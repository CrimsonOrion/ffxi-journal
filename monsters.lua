-- The monster search of the Journal: the state of its window, the list of
-- names (data/monsters.lua) and the sheet of each one (data/monster_info.lua,
-- generated from LandSandBoat by gen_monster_info.py). The drawing is in
-- ui.lua (sheetx.monsters_draw).
--
-- What is remembered (shared by all your characters, in shared_monsters.lua,
-- like the general notes): the size of the window, how the list is sorted
-- and the favorite monsters.

local M = {}

M.FAVORITE_MAX = 200

local FILE_NAME = 'shared_monsters.lua'
local SAVE_DELAY = 1.5

local window_open = false
local selected = nil
local names = nil
local canon = nil       -- [key] = name in the list (built when it is first needed)
local canon_by_name = nil -- [name as written] = name in the list, or false
local info = nil
local drops = nil
local item_cache = {}
local by_zone = { name = nil, level = nil }

local favorites = {}      -- { 'Name', ... } in the order they were added
local favorite_set = {}
local sort_mode = 'name'  -- 'name' | 'level'
local win_size = nil
local loaded = false
local dirty = false
local dirty_time = 0

-- Lowercase, no apostrophes, punctuation as one space. The same folding the
-- styles use, so "Goblin's  Digger" and "goblin digger" are the same.
local function fold(text)
    text = tostring(text or ''):lower():gsub("'", ''):gsub('`', '')
    text = text:gsub('[^%w]+', ' '):gsub('^ ', ''):gsub(' $', '')

    return text
end

M.fold = fold

-- The Abyssea zones are left out for now: the game closed when the sheet of
-- one of those monsters was drawn. A monster that is only in these zones is
-- hidden; one that is also in other zones keeps only those.
local ABYSSEA = { [15] = true, [45] = true, [132] = true, [215] = true,
    [216] = true, [217] = true, [218] = true, [253] = true, [254] = true }
local hidden = {}   -- fold(name) = true

local function without_abyssea(list)
    local result = {}

    hidden = {}

    for name, entry in pairs(list) do
        local zones = type(entry) == 'table' and entry.zones or nil
        local kept = {}
        local dropped = false

        if type(zones) == 'table' then
            for _, zone in ipairs(zones) do
                if type(zone) == 'table' and ABYSSEA[zone[1]] then
                    dropped = true
                else
                    kept[#kept + 1] = zone
                end
            end
        end

        if not dropped then
            result[name] = entry
        elseif #kept > 0 then
            local copy = {}

            for key, value in pairs(entry) do
                copy[key] = value
            end

            copy.zones = kept
            result[name] = copy
        else
            hidden[fold(name)] = true
        end
    end

    return result
end

local function load_info()
    if info == nil then
        local ok, list = pcall(require, 'data.monster_info')

        info = ok and type(list) == 'table' and without_abyssea(list) or {}
    end

    return info
end

-- The drops of every monster that has them (data/monster_drops.lua).
local function load_drops()
    if drops == nil then
        local ok, list = pcall(require, 'data.monster_drops')

        drops = ok and type(list) == 'table' and list or {}
    end

    return drops
end

local nm_cache = {}

local function reset_caches()
    names = nil
    canon = nil
    canon_by_name = nil
    by_zone = { name = nil, level = nil }
    nm_cache = {}
end

-- For the tests: use this table instead of the file.
function M.SetInfo(list)
    info = type(list) == 'table' and list or {}
    reset_caches()
end

-- For the tests: use this list of names instead of data/monsters.lua.
function M.SetNames(list)
    names = {}
    canon = nil
    canon_by_name = nil
    by_zone = { name = nil, level = nil }

    for _, name in ipairs(list or {}) do
        names[#names + 1] = { name = name, key = fold(name) }
    end

    table.sort(names, function(a, b)
        return a.key < b.key
    end)
end

-- ---------------------------------------------------------------- the file

-- The folders where the file may be, in order of preference.
local function candidate_dirs()
    local dirs = {}

    local ok, install = pcall(function()
        return AshitaCore:GetInstallPath()
    end)

    if ok and type(install) == 'string' and install ~= '' then
        install = install:gsub('/', '\\')

        if install:sub(-1) ~= '\\' then
            install = install .. '\\'
        end

        dirs[#dirs + 1] = {
            dir = install .. 'config\\addons\\journal\\',
            create = true,
        }
    end

    if addon ~= nil and type(addon.path) == 'string' then
        dirs[#dirs + 1] = { dir = addon.path, create = false }
    end

    return dirs
end

local function make_dir(path)
    if ashita == nil or ashita.fs == nil then
        return
    end

    for _, name in ipairs({ 'create_dir', 'create_directory' }) do
        local fn = ashita.fs[name]

        if fn ~= nil then
            pcall(fn, path)
        end
    end
end

local function serialize()
    local parts = { 'return {\n' }

    if win_size ~= nil then
        parts[#parts + 1] = string.format(
            '  window = { w = %d, h = %d },\n', win_size.w, win_size.h
        )
    end

    parts[#parts + 1] = string.format('  sort = %q,\n', sort_mode)
    parts[#parts + 1] = '  favorites = {\n'

    for _, name in ipairs(favorites) do
        parts[#parts + 1] = string.format('    %q,\n', name)
    end

    parts[#parts + 1] = '  },\n}\n'

    return table.concat(parts)
end

local function read_file(path)
    local file = io.open(path, 'rb')

    if file == nil then
        return nil
    end

    local data = file:read('*a')
    file:close()

    return data
end

-- The file is read as data: it is run in an empty environment, so a corrupt
-- file (or one with code in it) cannot do anything.
local function parse(data)
    if type(data) ~= 'string' or data == '' then
        return nil
    end

    local chunk

    if loadstring ~= nil then
        chunk = loadstring(data, 'shared_monsters')
    else
        chunk = load(data, 'shared_monsters', 't', {})
    end

    if chunk == nil then
        return nil
    end

    if setfenv ~= nil then
        setfenv(chunk, {})
    end

    local ok, result = pcall(chunk)

    if ok and type(result) == 'table' then
        return result
    end

    return nil
end

local function read_list(list)
    win_size = nil
    sort_mode = 'name'
    favorites = {}
    favorite_set = {}

    local w = type(list.window) == 'table' and tonumber(list.window.w)
    local h = type(list.window) == 'table' and tonumber(list.window.h)

    if w and h and w >= 100 and h >= 100 then
        win_size = { w = math.floor(w), h = math.floor(h) }
    end

    if list.sort == 'level' then
        sort_mode = 'level'
    end

    if type(list.favorites) == 'table' then
        for _, name in ipairs(list.favorites) do
            if type(name) == 'string' and name ~= ''
                and not favorite_set[name]
                and #favorites < M.FAVORITE_MAX then

                favorites[#favorites + 1] = name
                favorite_set[name] = true
            end
        end
    end
end

-- Reads the file (once). True when there was one.
function M.Load()
    loaded = true
    dirty = false

    for _, entry in ipairs(candidate_dirs()) do
        local list = parse(read_file(entry.dir .. FILE_NAME))

        if list ~= nil then
            read_list(list)

            return true
        end
    end

    return false
end

local function ensure_loaded()
    if not loaded then
        M.Load()
    end
end

-- Writes the file now. True when it was written.
function M.Save()
    local data = serialize()

    for _, entry in ipairs(candidate_dirs()) do
        if entry.create then
            make_dir(entry.dir)
        end

        local file = io.open(entry.dir .. FILE_NAME, 'wb')

        if file ~= nil then
            file:write(data)
            file:close()
            dirty = false

            return true
        end
    end

    return false
end

local function touch()
    dirty = true
    dirty_time = os.clock()
end

-- Called every frame by the window: saves a second and a half after the
-- last change.
function M.Tick()
    if dirty and os.clock() - dirty_time >= SAVE_DELAY then
        M.Save()
    end

    if M.KillsDirty() and os.clock() - M.KillsTime() >= SAVE_DELAY then
        M.SaveKills()
    end
end

function M.Flush()
    if dirty then
        M.Save()
    end

    if M.KillsDirty() then
        M.SaveKills()
    end
end

-- The size of the window the last time (nil the first time).
function M.GetSize()
    ensure_loaded()

    return win_size
end

function M.SetSize(w, h)
    ensure_loaded()

    w, h = math.floor(tonumber(w) or 0), math.floor(tonumber(h) or 0)

    if w < 100 or h < 100 then
        return
    end

    if win_size == nil
        or math.abs(win_size.w - w) > 2
        or math.abs(win_size.h - h) > 2 then

        win_size = { w = w, h = h }
        touch()
    end
end

-- 'name' or 'level'
function M.GetSort()
    ensure_loaded()

    return sort_mode
end

function M.SetSort(mode)
    ensure_loaded()

    mode = mode == 'level' and 'level' or 'name'

    if mode ~= sort_mode then
        sort_mode = mode
        touch()
    end
end

function M.ToggleSort()
    M.SetSort(M.GetSort() == 'level' and 'name' or 'level')
end

-- --------------------------------------------------------------- favorites

function M.IsFavorite(name)
    ensure_loaded()

    return favorite_set[name] == true
end

-- Adds or removes it. Returns false only when the list is full.
function M.ToggleFavorite(name)
    ensure_loaded()

    if type(name) ~= 'string' or name == '' then
        return false
    end

    if favorite_set[name] then
        favorite_set[name] = nil

        for index, value in ipairs(favorites) do
            if value == name then
                table.remove(favorites, index)
                break
            end
        end
    else
        if #favorites >= M.FAVORITE_MAX then
            return false
        end

        favorites[#favorites + 1] = name
        favorite_set[name] = true
    end

    touch()

    return true
end

function M.FavoriteCount()
    ensure_loaded()

    return #favorites
end

-- -------------------------------------------------------------------- lists

-- { { name =, key = } } sorted by name: every monster the Journal knows
-- (the ones that are colored in the steps), with or without a sheet.
function M.Names()
    if names == nil then
        load_info()   -- fills the hidden ones

        local ok, list = pcall(require, 'data.monsters')
        local seen = {}
        local result = {}

        if ok and type(list) == 'table' then
            for _, name in ipairs(list) do
                local key = fold(name)

                if type(name) == 'string' and key ~= '' and not seen[key]
                    and not hidden[key] then
                    seen[key] = true
                    result[#result + 1] = { name = name, key = key }
                end
            end
        end

        -- A sheet without a name in the list is still shown.
        for name in pairs(load_info()) do
            local key = fold(name)

            if not seen[key] and not hidden[key] then
                seen[key] = true
                result[#result + 1] = { name = name, key = key }
            end
        end

        table.sort(result, function(a, b)
            return a.key < b.key
        end)

        names = result
    end

    return names
end

-- The names that contain the text (case, apostrophes and punctuation do not
-- matter). Names that start with it come first.
function M.Search(query)
    local needle = fold(query)
    local all = M.Names()

    if needle == '' then
        return all
    end

    local first, rest = {}, {}

    for _, entry in ipairs(all) do
        local at = entry.key:find(needle, 1, true)

        if at == 1 then
            first[#first + 1] = entry
        elseif at ~= nil then
            rest[#rest + 1] = entry
        end
    end

    for _, entry in ipairs(rest) do
        first[#first + 1] = entry
    end

    return first
end

-- The lowest level of an entry, 999 when the source has none: so the
-- monsters without a level go last.
local function low_key(entry)
    local low = entry.low > 0 and entry.low or entry.high

    return low > 0 and low or 999
end

local function by_level(a, b)
    local la, lb = low_key(a), low_key(b)

    if la ~= lb then
        return la < lb
    end

    local ha = a.high > 0 and a.high or 999
    local hb = b.high > 0 and b.high or 999

    if ha ~= hb then
        return ha < hb
    end

    return a.key < b.key
end

M.low_key = low_key

-- The sheet of a monster ({ zones, aggro, ... }) or nil when the source has
-- none. The name is matched like a search, so a click on the text of a step
-- ("goblin digger") finds it.
function M.Info(name)
    local list = load_info()

    if list[name] ~= nil then
        return list[name], name
    end

    local key = fold(name)

    for entry_name, entry in pairs(list) do
        if fold(entry_name) == key then
            return entry, entry_name
        end
    end

    return nil
end

-- The drops of a monster: { items = { { item id, item name, percent }, ... },
-- varies = true|nil }, or nil when the data has none for it.
function M.Drops(name)
    local list = load_drops()

    if list[name] ~= nil then
        return list[name]
    end

    local key = fold(name)

    for entry_name, entry in pairs(list) do
        if fold(entry_name) == key then
            return entry
        end
    end

    return nil
end

-- All the drops: { [monster name] = { items = {...}, varies = }, ... } (the
-- catalogue of items turns it around).
function M.AllDrops()
    return load_drops()
end

-- For the tests: use this table instead of the file.
function M.SetDrops(list)
    drops = type(list) == 'table' and list or {}
end

-- True when the monster is a notorious one (the source says so).
function M.IsNotorious(name)
    local cached = nm_cache[name]

    if cached == nil then
        local data = M.Info(name)

        cached = data ~= nil and data.nm == true
        nm_cache[name] = cached
    end

    return cached
end

-- { [zone id] = { { name =, key =, low =, high = }, ... } }: the monsters of
-- each zone with their level range there. A monster in several zones is in
-- each of them; one with no zone in the data is in zone 0. mode is 'name'
-- (the default) or 'level' (lowest level first).
function M.ByZone(mode)
    mode = mode == 'level' and 'level' or 'name'

    if by_zone[mode] == nil then
        local groups = {}

        for _, entry in ipairs(M.Names()) do
            local data = M.Info(entry.name)
            local placed = false

            if data ~= nil and type(data.zones) == 'table' then
                for _, zone in ipairs(data.zones) do
                    local list = groups[zone[1]]

                    if list == nil then
                        list = {}
                        groups[zone[1]] = list
                    end

                    list[#list + 1] = {
                        name = entry.name,
                        key = entry.key,
                        low = zone[2] or 0,
                        high = zone[3] or 0,
                    }

                    placed = true
                end
            end

            if not placed then
                groups[0] = groups[0] or {}
                groups[0][#groups[0] + 1] = {
                    name = entry.name, key = entry.key, low = 0, high = 0,
                }
            end
        end

        if mode == 'level' then
            for _, list in pairs(groups) do
                table.sort(list, by_level)
            end
        end

        by_zone[mode] = groups
    end

    return by_zone[mode]
end

-- The level range of a monster over all its zones: low, high (0, 0 when the
-- source has none).
function M.LevelRange(name)
    local data = M.Info(name)
    local low, high = 0, 0

    if data ~= nil and type(data.zones) == 'table' then
        for _, zone in ipairs(data.zones) do
            local lo = (zone[2] or 0) > 0 and zone[2] or (zone[3] or 0)

            if lo > 0 and (low == 0 or lo < low) then
                low = lo
            end

            if (zone[3] or 0) > high then
                high = zone[3]
            end
        end
    end

    return low, high
end

-- The favorites as entries { name =, key =, low =, high = } (the level range
-- over all their zones), sorted by name or by level.
function M.Favorites(mode)
    ensure_loaded()

    local list = {}

    for _, name in ipairs(favorites) do
        local low, high = M.LevelRange(name)

        list[#list + 1] = { name = name, key = fold(name), low = low, high = high }
    end

    table.sort(list, mode == 'level' and by_level or function(a, b)
        return a.key < b.key
    end)

    return list
end

-- The name as the list writes it (for a click on a step), or nil.
function M.Canonical(name)
    -- The list is only walked once: after that it is a lookup (this is asked
    -- for every monster that was never defeated, on every frame of the
    -- window, so a walk over the whole list each time made it very slow).
    if canon == nil then
        canon = {}
        canon_by_name = {}

        for _, entry in ipairs(M.Names()) do
            if canon[entry.key] == nil then
                canon[entry.key] = entry.name
            end
        end
    end

    local cached = canon_by_name[name]

    if cached == nil then
        cached = canon[fold(name)] or false
        canon_by_name[name] = cached
    end

    return cached or nil
end

-- ------------------------------------------------------------------ kills
-- The monsters the character has defeated. Each character has its own file
-- (kills_<name>.lua) in the same folder as shared_monsters.lua:
--   return { ["Goblin Digger"] = { 3, 1789999999 }, }
-- = the times it was defeated and the time (os.time) of the first one.

local KILL_DEDUPE = 10      -- seconds: the same target is counted once
local kills = {}            -- [name in the list] = { n =, first = }
local kills_owner = nil     -- the character the table belongs to
local kills_dirty = false
local kills_time = 0
local owner_check = -100
local recent_kills = {}     -- [target id] = os.clock()
local only_pending = false  -- the filter of the window (not saved)
local kill_alerts = {}      -- the defeats for the first time, not shown yet
local kills_version = 0     -- goes up with every change of the kills table

local function character_name()
    local ok, name = pcall(function()
        return AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)
    end)

    if ok and type(name) == 'string' then
        name = (name:gsub('[^%w]', ''))

        if name ~= '' then
            return name
        end
    end

    return nil
end

-- The id of the zone the character is in, or nil.
function M.CurrentZone()
    local ok, id = pcall(function()
        return AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0)
    end)

    if ok and type(id) == 'number' and id > 0 then
        return id
    end

    return nil
end

local function kills_file(owner)
    return 'kills_' .. owner .. '.lua'
end

function M.KillsDirty()
    return kills_dirty
end

function M.KillsTime()
    return kills_time
end

local function serialize_kills()
    local names = {}

    for name in pairs(kills) do
        names[#names + 1] = name
    end

    table.sort(names)

    local parts = { 'return {\n' }

    for _, name in ipairs(names) do
        local entry = kills[name]

        parts[#parts + 1] = string.format(
            '  [%q] = { %d, %d },\n', name, entry.n, entry.first
        )
    end

    parts[#parts + 1] = '}\n'

    return table.concat(parts)
end

-- Writes the file of the character now. True when it was written.
function M.SaveKills()
    if kills_owner == nil then
        return false
    end

    local data = serialize_kills()

    for _, entry in ipairs(candidate_dirs()) do
        if entry.create then
            make_dir(entry.dir)
        end

        local file = io.open(entry.dir .. kills_file(kills_owner), 'wb')

        if file ~= nil then
            file:write(data)
            file:close()
            kills_dirty = false

            return true
        end
    end

    return false
end

local function load_kills(owner)
    kills = {}
    kills_dirty = false
    kills_version = kills_version + 1

    for _, entry in ipairs(candidate_dirs()) do
        local list = parse(read_file(entry.dir .. kills_file(owner)))

        if list ~= nil then
            for name, value in pairs(list) do
                local n = type(value) == 'table' and tonumber(value[1])
                local first = type(value) == 'table' and tonumber(value[2])

                if type(name) == 'string' and name ~= '' and n and n >= 1
                    and n < 1e9 then

                    kills[name] = {
                        n = math.floor(n),
                        first = first and first > 0 and math.floor(first) or 0,
                    }
                end
            end

            return
        end
    end
end

-- Loads the file of the character who is playing (and writes the one of
-- the character before, if it was changed). False while there is no name.
local function ensure_kills()
    if kills_owner ~= nil and os.clock() - owner_check < 1 then
        return true
    end

    local name = character_name()

    if name == nil then
        return kills_owner ~= nil
    end

    owner_check = os.clock()

    if kills_owner ~= name then
        if kills_dirty then
            M.SaveKills()
        end

        kills_owner = name
        load_kills(name)
    end

    return true
end

-- The character whose kills are loaded (nil while the game gives no name)
-- and a number that goes up every time the kills change (the rank, in
-- monsterrank.lua, recalculates when it does).
function M.KillsOwner()
    ensure_kills()

    return kills_owner
end

function M.KillsVersion()
    return kills_version
end

-- A small data file next to shared_monsters.lua (the rank of each character
-- is kept this way): { table } or nil, and a write that returns true when
-- it worked. The file is read as data, like the others.
function M.ReadData(file_name)
    for _, entry in ipairs(candidate_dirs()) do
        local list = parse(read_file(entry.dir .. file_name))

        if list ~= nil then
            return list
        end
    end

    return nil
end

function M.WriteData(file_name, text)
    for _, entry in ipairs(candidate_dirs()) do
        if entry.create then
            make_dir(entry.dir)
        end

        local file = io.open(entry.dir .. file_name, 'wb')

        if file ~= nil then
            file:write(text)
            file:close()

            return true
        end
    end

    return false
end

-- How many times the character has defeated the monster, and when the
-- first time was (os.time; 0 when never or unknown).
function M.Defeated(name)
    if not ensure_kills() then
        return 0, 0
    end

    local entry = kills[name]

    if entry == nil then
        local canonical = M.Canonical(name)

        entry = canonical ~= nil and kills[canonical] or nil
    end

    if entry == nil then
        return 0, 0
    end

    return entry.n, entry.first
end

-- defeated, total (of the monsters of the list).
function M.DefeatedTotals()
    local done, total = 0, 0

    ensure_kills()

    for _, entry in ipairs(M.Names()) do
        total = total + 1

        if kills[entry.name] ~= nil then
            done = done + 1
        end
    end

    return done, total
end

-- Counts a defeat. Returns the name in the list and how many times, or nil
-- when it is not a monster of the list (or there is no character yet).
function M.RecordKill(name, now)
    if not ensure_kills() then
        return nil
    end

    local canonical = M.Canonical(name)

    if canonical == nil then
        return nil
    end

    local entry = kills[canonical]

    if entry == nil then
        entry = { n = 0, first = math.floor(now or os.time()) }
        kills[canonical] = entry
    end

    entry.n = entry.n + 1
    kills_dirty = true
    kills_time = os.clock()
    kills_version = kills_version + 1

    -- The first time: an alert (the banner of announce.lua takes it).
    if entry.n == 1 and #kill_alerts < 20 then
        local done, total = M.DefeatedTotals()

        local alert = {
            name = canonical, defeated = done, total = total,
        }

        -- The counter of the zone the character is in.
        local zone = M.CurrentZone()
        local list = zone ~= nil and M.ByZone('name')[zone] or nil

        if list ~= nil and #list > 0 then
            local zone_done = 0

            for _, member in ipairs(list) do
                if kills[member.name] ~= nil then
                    zone_done = zone_done + 1
                end
            end

            alert.zone = zone
            alert.zone_defeated = zone_done
            alert.zone_total = #list
        end

        kill_alerts[#kill_alerts + 1] = alert
    end

    return canonical, entry.n
end

-- The next alert of a monster defeated for the first time:
-- { name =, defeated =, total = }, or nil.
function M.TakeKillAlert()
    return table.remove(kill_alerts, 1)
end

-- Zone entry: when the zone has monsters the character has not discovered
-- yet, an alert says how many. Called now and then (by TakeAnnouncement);
-- it only looks when the zone is not the one of the last time.
local last_zone = nil
local zone_alerts = {}

function M.PollZone()
    local zone = M.CurrentZone()

    if zone == nil or zone == last_zone or not ensure_kills() then
        return
    end

    last_zone = zone

    local list = M.ByZone('name')[zone]

    if list == nil or #list == 0 then
        return
    end

    local missing = 0

    for _, member in ipairs(list) do
        if kills[member.name] == nil then
            missing = missing + 1
        end
    end

    if missing > 0 and #zone_alerts < 5 then
        zone_alerts[#zone_alerts + 1] = {
            zone = zone, missing = missing, total = #list,
        }
    end
end

-- The next alert of a zone entered: { zone =, missing =, total = }, or nil.
function M.TakeZoneAlert()
    return table.remove(zone_alerts, 1)
end

function M.GetOnlyPending()
    return only_pending
end

function M.ToggleOnlyPending()
    only_pending = not only_pending
end

-- ---------------------------------------------------------------- filters
-- More filters of the list (like the one of the pending ones, they are not
-- saved): only the notorious monsters, only the aggressive ones (the source
-- says "aggressive" for sure; a monster with mixed variants does not pass)
-- and only the ones close to the level of the character.
M.LEVEL_RANGE = 5

local filters = { notorious = false, aggro = false, level = false }

-- The main job level of the character, or nil when the game does not give it.
function M.PlayerLevel()
    local ok, level = pcall(function()
        return AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel()
    end)

    if ok and type(level) == 'number' and level >= 1 and level <= 99 then
        return level
    end

    return nil
end

function M.GetFilter(name)
    return filters[name] == true
end

function M.ToggleFilter(name)
    if filters[name] ~= nil then
        filters[name] = not filters[name]
    end
end

function M.AnyFilter()
    return filters.notorious or filters.aggro or filters.level
end

-- True when the entry ({ name =, low =, high = }) passes the filters that
-- are on. The level filter keeps the monsters whose level range (in that
-- zone) touches the character's level +/- LEVEL_RANGE; one with no level in
-- the data does not pass. Without the level of the character it does not
-- filter.
function M.PassesFilters(entry)
    if filters.notorious and not M.IsNotorious(entry.name) then
        return false
    end

    if filters.aggro then
        local data = M.Info(entry.name)

        if data == nil or data.aggro ~= true then
            return false
        end
    end

    if filters.level then
        local mine = M.PlayerLevel()

        if mine ~= nil then
            local high = entry.high or 0
            local low = (entry.low or 0) > 0 and entry.low or high

            if high <= 0
                or high < mine - M.LEVEL_RANGE
                or low > mine + M.LEVEL_RANGE then

                return false
            end
        end
    end

    return true
end

-- The packet 0x029 (action message) with the message 6: "<actor> defeats
-- <target>". The game sends it for the defeats of the character, the party
-- and the alliance. Layout (as the other tools read it): actor id u32 at
-- 0x04, target id u32 at 0x08, target index u16 at 0x16, message u16 at 0x18
-- (the high bit is a flag).
local DEFEAT_MESSAGE = 6

local function u16(data, offset)
    local a, b = data:byte(offset + 1, offset + 2)

    if a == nil or b == nil then
        return nil
    end

    return a + b * 0x100
end

local function u32(data, offset)
    local a, b, c, d = data:byte(offset + 1, offset + 4)

    if a == nil or b == nil or c == nil or d == nil then
        return nil
    end

    return a + b * 0x100 + c * 0x10000 + d * 0x1000000
end

-- True when the actor is the character or someone of the party or alliance.
local function in_my_group(actor_id)
    local party = AshitaCore:GetMemoryManager():GetParty()

    for index = 0, 17 do
        if party:GetMemberIsActive(index) == 1
            and party:GetMemberServerId(index) == actor_id then

            return true
        end
    end

    return false
end

-- Reads a packet. Returns the name counted, or nil.
function M.OnPacket(e)
    if e == nil or e.id ~= 0x029 or type(e.data) ~= 'string'
        or #e.data < 0x1A then

        return nil
    end

    local message = u16(e.data, 0x18)

    if message == nil or bit.band(message, 0x7FFF) ~= DEFEAT_MESSAGE then
        return nil
    end

    local actor = u32(e.data, 0x04)
    local target = u32(e.data, 0x08)
    local index = u16(e.data, 0x16)

    if actor == nil or target == nil or index == nil or index <= 0
        or index >= 0x900 or not in_my_group(actor) then

        return nil
    end

    local now = os.clock()

    if recent_kills[target] ~= nil and now - recent_kills[target] < KILL_DEDUPE then
        return nil
    end

    local name = AshitaCore:GetMemoryManager():GetEntity():GetName(index)

    if type(name) ~= 'string' or name == '' then
        return nil
    end

    local canonical, times = M.RecordKill(name, os.time())

    if canonical ~= nil then
        recent_kills[target] = now

        -- Forget the old ones.
        for id, at in pairs(recent_kills) do
            if now - at > 60 then
                recent_kills[id] = nil
            end
        end
    end

    return canonical, times
end

local registered = false

-- Starts to listen to the packets (once).
function M.Register()
    if registered or ashita == nil or ashita.events == nil then
        return
    end

    registered = true

    ashita.events.register('packet_in', 'journal_kills_packet_in', function(e)
        local ok, err = pcall(M.OnPacket, e)

        if not ok and not M.kill_error_shown then
            M.kill_error_shown = true
            print('[Journal] Error reading the defeats: ' .. tostring(err))
        end
    end)
end

-- The English name of an item, from the game resources (like inventory.lua).
-- Without it: "Item #id".
function M.ItemName(id)
    local cached = item_cache[id]

    if cached ~= nil then
        return cached
    end

    local ok, name = pcall(function()
        return AshitaCore:GetResourceManager():GetItemById(id).Name[1]
    end)

    if ok and type(name) == 'string' and name ~= '' then
        item_cache[id] = name

        return name
    end

    -- Not cached: the resources may not be ready yet.
    return 'Item #' .. tostring(id)
end

-- "mnk" -> "MNK"
function M.JobLabel(abbr)
    return tostring(abbr or ''):upper()
end

-- "worm_x" -> "Worm x": the species label of the source, made readable.
function M.SpeciesLabel(species)
    local text = tostring(species or ''):gsub('_', ' ')

    return (text:gsub('^%l', string.upper))
end

-- "5" or "0.5": the percent of a drop, without trailing zeros.
function M.PercentLabel(value)
    local number = tonumber(value) or 0
    -- Below 1% the second decimal counts (0.25%, 0.05%).
    local text = string.format(number < 1 and '%.2f' or '%.1f', number)

    text = text:gsub('(%.%d-)0+$', '%1'):gsub('%.$', '')

    return text .. '%'
end

function M.GetOpen()
    return window_open
end

function M.SetOpen(value)
    window_open = value == true
end

function M.Toggle()
    window_open = not window_open
end

function M.GetSelected()
    return selected
end

function M.Select(name)
    selected = name
end

-- The monster the list has to open its folders for and scroll to (set by
-- Show, taken once by the window).
local reveal = nil

-- Shows the window with this monster (a click on a name in a step). The
-- list opens the folder that has it and scrolls to it.
function M.Show(name)
    local canonical = M.Canonical(name)

    selected = canonical or name
    window_open = true
    reveal = canonical

    return selected
end

-- The monster to reveal in the list (once), or nil.
function M.TakeReveal()
    local name = reveal

    reveal = nil

    return name
end

-- Turns off the search filters of the list (pending and the other ones),
-- so a monster picked from a step is not hidden by them.
function M.ClearFilters()
    only_pending = false
    filters.notorious = false
    filters.aggro = false
    filters.level = false
end

return M
