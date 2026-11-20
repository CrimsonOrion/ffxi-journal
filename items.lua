-- The item catalogue of the Journal: the state of its window, the list of
-- items (data/items/, built by gen_items.py from the item list and the
-- LandSandBoat tables), the monsters that drop each item (the inverse of
-- data/monster_drops.lua) and the icons (assets/items/<id>.png). The drawing is
-- in ui.lua (sheetx.items_draw).
--
-- Items with the same name (the versions of a weapon) are one entry of the
-- list; the sheet shows each version.
--
-- Only the size of the window is remembered (shared_items.lua, shared by all
-- the characters, like the monster search).

local M = {}

local bit = require('bit')
local monsters = require('monsters')

local FILE_NAME = 'shared_items.lua'
local SAVE_DELAY = 1.5
local ICON_CACHE = 400     -- textures kept at the same time
local ALL_JOBS = 4194303   -- the 22 jobs

local JOBS = { 'WAR', 'MNK', 'WHM', 'BLM', 'RDM', 'THF', 'PLD', 'DRK', 'BST', 'BRD',
    'RNG', 'SAM', 'NIN', 'DRG', 'SMN', 'BLU', 'COR', 'PUP', 'DNC', 'SCH', 'GEO', 'RUN' }

local window_open = false
local selected = nil        -- the entry of the list (name, ids...)
local selected_id = nil     -- the version shown
local win_size = nil
local favorites = {}        -- [first id of an entry] = true
local FAVORITES_GROUP = -1  -- the group of the filter that shows only the favorites
local settings_read = false
local dirty = false
local dirty_time = 0

-- Alias: other names that point at an item (the full names of the game, 
-- data/items/alias.lua, and the few the quest texts spell their own way).
local alias_long = nil
local alias_extra = {
    ['parana shields'] = 'parana shield',
    ['blazing pepper'] = 'blazing peppers',
    ['giant sheep meat'] = 'g sheep meat',
    ['pickaxes'] = 'pickaxe',
    ['yagudo holy water'] = 'yag holy water',
    ['coral crest keys'] = 'coral crest key',
    ['garhada teak lumber'] = 'gar teak lumber',
    ['rosewood lumber'] = 'rosewood lbr',
    ['goblin chocolate'] = 'gob chocolate',
}

local data = nil            -- { list =, by_id =, by_key =, subs =, groups =, error = }
local blocks = {}           -- [id // 1024] = the block of descriptions
local infos = {}            -- [id] = the data of an item
local drop_index = nil      -- [item id] = { { name =, percent = }, ... }
local filter_cache = { sig = nil, list = {} }

local fold = monsters.fold
local read_settings   -- defined with the settings below

-- Loading ------------------------------------------------------------------

-- The list, sorted by name, with the versions of a name together. Read the first
-- time it is needed (about 3 MB of data).
local function load_data()
    if data ~= nil then
        return data
    end

    data = { list = {}, by_id = {}, by_key = {}, cat_of = {}, subs = {}, groups = {}, error = nil }

    local ok, cats = pcall(require, 'data.items.cats')

    if not ok or type(cats) ~= 'table' then
        data.error = 'data/items/cats.lua'

        return data
    end

    data.subs = cats.subs or {}
    data.groups = cats.groups or {}

    local last
    local k = 1

    while true do
        local loaded, chunk = pcall(require, 'data.items.i' .. k)

        if not loaded or type(chunk) ~= 'table' then
            if k == 1 then
                data.error = 'data/items/i1.lua'
            end

            break
        end

        for j = 1, #chunk.n do
            local name, id, cat = chunk.n[j], chunk.i[j], chunk.c[j]
            local group = data.subs[cat] and data.subs[cat][1] or 0

            if last ~= nil and last.name == name then
                last.ids[#last.ids + 1] = id
            else
                last = { name = name, key = fold(name), ids = { id }, cats = {}, grps = {} }
                data.list[#data.list + 1] = last
            end

            -- The versions of a name may be in different categories.
            last.cats[cat] = true
            last.grps[group] = true
            data.by_id[id] = last

            if data.by_key[last.key] == nil then
                data.by_key[last.key] = last
            end

            if data.by_key[last.key] == nil then
                data.by_key[last.key] = last
            end
            data.cat_of[id] = cat
        end

        k = k + 1
    end

    return data
end

function M.Ready()
    return load_data().error == nil
end

function M.Error()
    return load_data().error
end

function M.Count()
    return #load_data().list
end

-- The names of the groups (Weapons, Armor...) in the order of the filter.
function M.Groups()
    return load_data().groups
end

-- The sub-categories of a group (0: all), sorted by name: { { index =, label = }, ... }.
function M.Subs(group)
    local out = {}

    for index, sub in pairs(load_data().subs) do
        if sub[1] == group then
            out[#out + 1] = { index = index, label = sub[2] }
        end
    end

    table.sort(out, function(a, b)
        return a.label < b.label
    end)

    return out
end

-- The group and the sub-category of an item (by its id), e.g. "Weapons", "Sword".
function M.CategoryLabel(id)
    local d = load_data()
    local sub = d.subs[d.cat_of[id]]

    if sub == nil then
        return nil, nil
    end

    return d.groups[sub[1]], sub[2]
end

-- The entries (see load_data) that pass the search and the filter of group and
-- sub-category. The text is part of the name (or the number is an id of it).
function M.Filter(query, group, sub)
    read_settings()

    local d = load_data()
    local text = fold(query)
    local number = tonumber(query)
    local sig = text .. '|' .. tostring(number) .. '|' .. group .. '|' .. sub

    if filter_cache.sig == sig then
        return filter_cache.list
    end

    local out = {}

    for _, entry in ipairs(d.list) do
        local in_group
        if group == FAVORITES_GROUP then
            in_group = favorites[entry.ids[1]] == true
        else
            in_group = (group == 0 or entry.grps[group]) and (sub == 0 or entry.cats[sub])
        end

        if in_group then

            local match = text == '' or entry.key:find(text, 1, true) ~= nil

            if not match and number ~= nil then
                for _, id in ipairs(entry.ids) do
                    if id == number then
                        match = true

                        break
                    end
                end
            end

            if match then
                out[#out + 1] = entry
            end
        end
    end

    filter_cache = { sig = sig, list = out }

    return out
end

-- The data of an item: { id =, text =, level =, ilevel =, jobs =, rare =, ex =,
-- stack =, price = } or nil. The text is the one of the game.
function M.Info(id)
    local cached = infos[id]

    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    local key = math.floor(id / 1024)
    local block = blocks[key]

    if block == nil then
        local ok, loaded = pcall(require, 'data.items.d' .. key)

        block = ok and type(loaded) == 'table' and loaded or {}
        blocks[key] = block
    end

    local row = block[id]

    if row == nil then
        infos[id] = false

        return nil
    end

    local info = {
        id = id,
        text = row[1],
        level = row[2],
        ilevel = row[3],
        jobs = row[4],
        rare = row[5] % 2 == 1,
        ex = row[5] >= 2,
        stack = row[6],
        price = row[7],
    }

    infos[id] = info

    return info
end

-- "WAR/PLD", "All jobs" or nil (the source has no jobs for it).
function M.JobsLabel(mask)
    mask = tonumber(mask) or 0

    if mask == 0 then
        return nil
    end

    if mask == ALL_JOBS then
        return 'All jobs'
    end

    local names = {}

    for position, name in ipairs(JOBS) do
        if bit.band(mask, bit.lshift(1, position - 1)) ~= 0 then
            names[#names + 1] = name
        end
    end

    return table.concat(names, '/')
end

-- The monsters that drop an item: { { name =, percent = }, ... }, the most
-- frequent first (from the drops of the Vana'dex monsters).
function M.DroppedBy(id)
    if drop_index == nil then
        drop_index = {}

        for monster, entry in pairs(monsters.AllDrops()) do
            for _, item in ipairs(entry.items or {}) do
                local item_id = item[1]

                if item_id ~= nil then
                    local list = drop_index[item_id]

                    if list == nil then
                        list = {}
                        drop_index[item_id] = list
                    end

                    list[#list + 1] = { name = monster, percent = tonumber(item[3]) or 0 }
                end
            end
        end

        for _, list in pairs(drop_index) do
            table.sort(list, function(a, b)
                if a.percent ~= b.percent then
                    return a.percent > b.percent
                end

                return a.name < b.name
            end)
        end
    end

    return drop_index[id] or {}
end

-- For the tests: the drops of the monsters come from this table.
function M.ResetDrops()
    drop_index = nil
end

-- Icons --------------------------------------------------------------------

local icons = {}       -- [id] = { id =, width =, height =, ptr = } | false
local icon_order = {}  -- ids in the order they were loaded

-- The texture of the icon of an item (assets/items/<id>.png), or nil when
-- there is no file. It keeps ICON_CACHE of them; the oldest are released.
function M.Icon(id)
    local cached = icons[id]

    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    icons[id] = false

    local ok, texture = pcall(function()
        local ffi = require('ffi')
        local d3d = require('d3d8')
        local path = tostring(addon and addon.path or '') .. '/assets/items/' .. id .. '.png'

        if not ashita.fs.exists(path) then
            return nil
        end

        local info = ffi.new('D3DXIMAGE_INFO')

        if ffi.C.D3DXGetImageInfoFromFileA(path, info) ~= ffi.C.S_OK then
            return nil
        end

        local pointer = ffi.new('IDirect3DTexture8*[1]')

        if ffi.C.D3DXCreateTextureFromFileA(
            d3d.get_device(), path, pointer
        ) ~= ffi.C.S_OK then

            return nil
        end

        local owned = d3d.gc_safe_release(
            ffi.cast('IDirect3DTexture8*', pointer[0])
        )

        return {
            ptr = owned,
            id = tonumber(ffi.cast('uint32_t', owned)),
            width = tonumber(info.Width),
            height = tonumber(info.Height),
        }
    end)

    if ok and texture ~= nil and texture.id ~= nil
        and (texture.width or 0) > 0 and (texture.height or 0) > 0 then

        icons[id] = texture
        icon_order[#icon_order + 1] = id

        -- The oldest ones are let go (the texture is released when nothing
        -- refers to it).
        if #icon_order > ICON_CACHE then
            local old = table.remove(icon_order, 1)

            icons[old] = nil
        end

        return texture
    end

    return nil
end

-- The window ------------------------------------------------------------------

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

function M.GetSelectedId()
    return selected_id
end

-- Selects an entry of the list (and its first version, or the one given).
function M.Select(entry, id)
    selected = entry
    selected_id = id or (entry ~= nil and entry.ids[1] or nil)
end

-- The entry of an item by its name (the case and the apostrophes do not
-- count), or nil when the catalogue does not have it.
function M.ByName(name)
    local entry = M.LookupName(name)

    return entry
end

-- The entry and the id of an item by its name: the id is the one a full name
-- of the game points at (or the first of the entry).
function M.LookupName(name)
    if name == nil then
        return nil
    end

    local d = load_data()
    local key = fold(tostring(name))
    local entry = d.by_key[key]

    if entry ~= nil then
        return entry, entry.ids[1]
    end

    if alias_extra[key] ~= nil then
        entry = d.by_key[alias_extra[key]]

        return entry, entry and entry.ids[1] or nil
    end

    -- The full names of the game.
    if alias_long == nil then
        alias_long = {}

        local ok, chunk = pcall(require, 'data.items.alias')

        if ok and type(chunk) == 'table' and chunk.n ~= nil then
            for index, alias_name in ipairs(chunk.n) do
                alias_long[alias_name] = chunk.i[index]
            end
        end
    end

    local id = alias_long[key]

    if id ~= nil and d.by_id[id] ~= nil then
        return d.by_id[id], id
    end

    return nil
end

-- Opens the window with the item of this name selected (the quest steps).
-- True when the catalogue has it.
function M.ShowByName(name)
    local entry, id = M.LookupName(name)

    if entry == nil then
        return false
    end

    M.Select(entry, id)
    window_open = true

    return true
end

-- Opens the window with an item (by its id) selected. True when it exists.
function M.Show(id)
    local entry = load_data().by_id[tonumber(id)]

    if entry == nil then
        return false
    end

    M.Select(entry, tonumber(id))
    window_open = true

    return true
end

-- The entry of an item by its id.
function M.Entry(id)
    return load_data().by_id[id]
end

-- Settings ----------------------------------------------------------------------

read_settings = function()
    if settings_read then
        return
    end

    settings_read = true

    local list = monsters.ReadData(FILE_NAME)

    if type(list) == 'table' and type(list.window) == 'table' then
        local w, h = tonumber(list.window.w), tonumber(list.window.h)

        if w ~= nil and h ~= nil and w >= 100 and h >= 100 then
            win_size = { w = math.floor(w), h = math.floor(h) }
        end
    end

    if type(list) == 'table' and type(list.favorites) == 'table' then
        for _, id in ipairs(list.favorites) do
            id = tonumber(id)

            if id ~= nil then
                favorites[id] = true
            end
        end
    end
end

-- Favorites ---------------------------------------------------------------------

-- The value of the group of the filter that shows only the favorites.
function M.FavoritesGroup()
    return FAVORITES_GROUP
end

function M.IsFavorite(entry)
    read_settings()

    return entry ~= nil and favorites[entry.ids[1]] == true
end

-- Adds the item to the favorites or takes it out. Returns the new state.
function M.ToggleFavorite(entry)
    read_settings()

    if entry == nil then
        return false
    end

    local key = entry.ids[1]

    if favorites[key] then
        favorites[key] = nil
    else
        favorites[key] = true
    end

    filter_cache.sig = nil
    dirty = true
    dirty_time = os.clock()

    return favorites[key] == true
end

function M.FavoriteCount()
    read_settings()

    local count = 0

    for _ in pairs(favorites) do
        count = count + 1
    end

    return count
end

-- The size of the window the last time (nil the first time).
function M.GetSize()
    read_settings()

    return win_size
end

function M.SetSize(w, h)
    read_settings()

    w, h = math.floor(tonumber(w) or 0), math.floor(tonumber(h) or 0)

    if w < 100 or h < 100 then
        return
    end

    if win_size == nil or math.abs(win_size.w - w) > 2 or math.abs(win_size.h - h) > 2 then
        win_size = { w = w, h = h }
        dirty = true
        dirty_time = os.clock()
    end
end

function M.Save()
    read_settings()

    local ids = {}

    for id in pairs(favorites) do
        ids[#ids + 1] = id
    end

    table.sort(ids)

    local text = 'return {\n'

    if win_size ~= nil then
        text = text .. string.format('  window = { w = %d, h = %d },\n', win_size.w, win_size.h)
    end

    text = text .. '  favorites = { ' .. table.concat(ids, ', ') .. ' },\n}\n'

    local ok = monsters.WriteData(FILE_NAME, text)

    if ok then
        dirty = false
    end

    return ok
end

-- Called every frame by the window: saves a second and a half after the last
-- change.
function M.Tick()
    if dirty and os.clock() - dirty_time >= SAVE_DELAY then
        M.Save()
    end
end

function M.Flush()
    if dirty then
        M.Save()
    end
end

return M
