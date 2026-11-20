-- The rank of the monster search (Vana'dex): points for the monsters the
-- character has defeated, a rank for the points, bonuses for the zones and
-- regions completed, and achievements.
--
-- Nothing about the points is saved: they are worked out from the kills the
-- character already has (kills_<name>.lua), so a character that defeated
-- monsters before this existed has its rank at once, and changing a number
-- below changes everything with no migration. What is saved, in
-- rank_<name>.lua next to the kills file, is the last rank and the
-- achievements already seen, so each alert comes once.

local i18n = require('i18n')
local store = require('monsters')
local zonelist = require('zonelist')

local M = {}

local tx = i18n.t

-- ------------------------------------------------------------ the numbers
-- Everything that can be adjusted by eye is here.
M.CONFIG = {
    -- A monster defeated for the first time: this, plus per_level for each
    -- level of its highest level (a monster with no level in the data gets
    -- only the base) and the bonus when it is a notorious one.
    discover_base = 10,
    per_level = 0.5,
    notorious_bonus = 25,

    -- The defeats after the first: repeat_points each, and only the first
    -- repeat_cap of them count (so farming one monster does not pay).
    repeat_points = 1,
    repeat_cap = 9,

    -- Every monster of a zone (or of a region) defeated: base plus a few
    -- points for each monster in it.
    zone_base = 20,
    zone_per_monster = 3,
    region_base = 100,
    region_per_monster = 2,
}

-- The ranks, with the points each one needs. With the data of today the most
-- a character can reach is about 263000 (every monster with 10 defeats, 3740
-- monsters); each step is the same share of that maximum as before the
-- list grew (Legend is about 90% of it). If the lists grow again, compute
-- the maximum with every monster at 10 defeats and scale these numbers.
-- The names are the Journal's own (they are not names from the game).
M.RANKS = {
    { name = 'Rookie', points = 0 },
    { name = 'Apprentice', points = 1200 },
    { name = 'Scout', points = 4000 },
    { name = 'Hunter', points = 10000 },
    { name = 'Pathfinder', points = 20000 },
    { name = 'Veteran', points = 37000 },
    { name = 'Expert', points = 60000 },
    { name = 'Champion', points = 95000 },
    { name = 'Master', points = 135000 },
    { name = 'Grand Master', points = 185000 },
    { name = 'Legend', points = 240000 },
}

-- The achievements: stat is a number of the score (see compute) and need
-- how much of it unlocks it. A text with %d gets the number in it.
M.ACHIEVEMENTS = {
    { id = 'd1', text = 'First Monster Discovered', stat = 'discovered', need = 1 },
    { id = 'd10', text = '%d Monsters Discovered', stat = 'discovered', need = 10 },
    { id = 'd50', text = '%d Monsters Discovered', stat = 'discovered', need = 50 },
    { id = 'd100', text = '%d Monsters Discovered', stat = 'discovered', need = 100 },
    { id = 'd250', text = '%d Monsters Discovered', stat = 'discovered', need = 250 },
    { id = 'd500', text = '%d Monsters Discovered', stat = 'discovered', need = 500 },
    { id = 'd1000', text = '%d Monsters Discovered', stat = 'discovered', need = 1000 },
    { id = 'd2500', text = '%d Monsters Discovered', stat = 'discovered', need = 2500 },
    { id = 'all', text = 'All Monsters Discovered', stat = 'everything', need = 1 },
    { id = 'nm1', text = 'First Notorious Monster', stat = 'notorious', need = 1 },
    { id = 'nm10', text = '%d Notorious Monsters', stat = 'notorious', need = 10 },
    { id = 'nm50', text = '%d Notorious Monsters', stat = 'notorious', need = 50 },
    { id = 'nm100', text = '%d Notorious Monsters', stat = 'notorious', need = 100 },
    { id = 'nm500', text = '%d Notorious Monsters', stat = 'notorious', need = 500 },
    { id = 'z1', text = 'First Zone Completed', stat = 'zones_done', need = 1 },
    { id = 'z10', text = '%d Zones Completed', stat = 'zones_done', need = 10 },
    { id = 'z50', text = '%d Zones Completed', stat = 'zones_done', need = 50 },
    { id = 'z100', text = '%d Zones Completed', stat = 'zones_done', need = 100 },
    { id = 'r1', text = 'First Region Completed', stat = 'regions_done', need = 1 },
    { id = 'k100', text = '%d Defeats', stat = 'kills', need = 100 },
    { id = 'k1000', text = '%d Defeats', stat = 'kills', need = 1000 },
}

-- ------------------------------------------------------------------ score

local cache = nil
local cache_key = nil

local function rank_of(points)
    local index = 1

    for position, rank in ipairs(M.RANKS) do
        if points >= rank.points then
            index = position
        end
    end

    return index
end

local function compute()
    local cfg = M.CONFIG
    local parts = {
        discovered = 0, repeats = 0, notorious = 0, zones = 0, regions = 0,
    }
    local counts = {
        discovered = 0, total = 0, notorious = 0, kills = 0,
        zones_done = 0, zones_total = 0, regions_done = 0, regions_total = 0,
        everything = 0,
    }
    local defeated = {}

    for _, entry in ipairs(store.Names()) do
        counts.total = counts.total + 1

        local n = store.Defeated(entry.name)

        if n > 0 then
            defeated[entry.name] = true
            counts.discovered = counts.discovered + 1
            counts.kills = counts.kills + n

            local _, high = store.LevelRange(entry.name)

            parts.discovered = parts.discovered
                + cfg.discover_base + math.floor(cfg.per_level * high)
            parts.repeats = parts.repeats
                + math.min(n - 1, cfg.repeat_cap) * cfg.repeat_points

            if store.IsNotorious(entry.name) then
                counts.notorious = counts.notorious + 1
                parts.notorious = parts.notorious + cfg.notorious_bonus
            end
        end
    end

    counts.everything = (counts.total > 0 and counts.discovered >= counts.total)
        and 1 or 0

    -- The zones: all the monsters of one defeated.
    local groups = store.ByZone('name')
    local zone_bonus = {}

    for id, list in pairs(groups) do
        if id ~= 0 and #list > 0 then
            counts.zones_total = counts.zones_total + 1

            local complete = true

            for _, member in ipairs(list) do
                if not defeated[member.name] then
                    complete = false

                    break
                end
            end

            if complete then
                counts.zones_done = counts.zones_done + 1
                zone_bonus[id] = cfg.zone_base + cfg.zone_per_monster * #list
                parts.zones = parts.zones + zone_bonus[id]
            end
        end
    end

    -- The regions of the list of zones: all the monsters of all its zones
    -- (one that lives in several of them counts once).
    local region_bonus = {}

    for index, region in ipairs(zonelist.Regions()) do
        local seen, total, complete = {}, 0, true

        for _, id in ipairs(region.zones) do
            for _, member in ipairs(groups[id] or {}) do
                if not seen[member.name] then
                    seen[member.name] = true
                    total = total + 1

                    if not defeated[member.name] then
                        complete = false
                    end
                end
            end
        end

        if total > 0 then
            counts.regions_total = counts.regions_total + 1

            if complete then
                counts.regions_done = counts.regions_done + 1
                region_bonus[index] = cfg.region_base + cfg.region_per_monster * total
                parts.regions = parts.regions + region_bonus[index]
            end
        end
    end

    local points = parts.discovered + parts.repeats + parts.notorious
        + parts.zones + parts.regions
    local rank = rank_of(points)
    local current = M.RANKS[rank]
    local following = M.RANKS[rank + 1]

    return {
        points = points,
        parts = parts,
        counts = counts,
        rank = rank,
        rank_name = current.name,
        base = current.points,
        next_points = following and following.points or nil,
        next_name = following and following.name or nil,
        progress = following
            and (points - current.points) / (following.points - current.points)
            or 1,
        zone_bonus = zone_bonus,
        region_bonus = region_bonus,
    }
end

-- The score of the character (cached until its kills change).
function M.Score()
    local key = tostring(store.KillsOwner()) .. ':' .. store.KillsVersion()

    if cache == nil or cache_key ~= key then
        cache = compute()
        cache_key = key
    end

    return cache
end

-- The points of a zone (by id) or a region (by its place in the list of
-- zones) when it is completed, nil when it is not.
function M.ZoneBonus(zone_id)
    return M.Score().zone_bonus[zone_id]
end

function M.RegionBonus(index)
    return M.Score().region_bonus[index]
end

-- The text of an achievement.
function M.AchievementText(item)
    local text = tx(item.text)

    if item.text:find('%%d') then
        return string.format(text, item.need)
    end

    return text
end

-- { { id =, text =, done =, value =, need = } } in order.
function M.Achievements()
    local counts = M.Score().counts
    local list = {}

    for _, item in ipairs(M.ACHIEVEMENTS) do
        local value = counts[item.stat] or 0

        list[#list + 1] = {
            id = item.id,
            text = M.AchievementText(item),
            done = value >= item.need,
            value = math.min(value, item.need),
            need = item.need,
        }
    end

    return list
end

-- ------------------------------------------------------- alerts and memory

local alerts = {}            -- the alerts not shown yet
local seen_owner = nil       -- the character the memory below belongs to
local seen_version = -1
local rank_seen = 1
local ach_seen = {}

local function progress_file(owner)
    return 'rank_' .. owner .. '.lua'
end

local function save_progress(owner)
    local ids = {}

    for id in pairs(ach_seen) do
        ids[#ids + 1] = id
    end

    table.sort(ids)

    local parts = { 'return {\n  rank = ', tostring(rank_seen), ',\n  ach = {' }

    for _, id in ipairs(ids) do
        parts[#parts + 1] = string.format(' %q,', id)
    end

    parts[#parts + 1] = ' },\n}\n'

    store.WriteData(progress_file(owner), table.concat(parts))
end

-- Called now and then (by the alerts of the Journal). When the character
-- just changed or was just loaded it only learns the state, with no alert;
-- when the kills changed afterwards, a higher rank or a new achievement
-- makes an alert.
function M.Poll()
    local owner = store.KillsOwner()

    if owner == nil then
        return
    end

    local version = store.KillsVersion()

    if owner == seen_owner and version == seen_version then
        return
    end

    local score = M.Score()
    local unlocked = {}

    for _, item in ipairs(M.Achievements()) do
        if item.done then
            unlocked[item.id] = item
        end
    end

    if owner ~= seen_owner then
        -- The state the character had (or the one it has now, the first
        -- time): no alert for what it already did.
        local saved = store.ReadData(progress_file(owner))

        rank_seen = score.rank
        ach_seen = {}

        if type(saved) == 'table' and type(saved.ach) == 'table' then
            for _, id in ipairs(saved.ach) do
                if type(id) == 'string' then
                    ach_seen[id] = true
                end
            end
        end

        for id in pairs(unlocked) do
            ach_seen[id] = true
        end

        seen_owner = owner
        seen_version = version
        save_progress(owner)

        return
    end

    seen_version = version

    local changed = false

    if score.rank > rank_seen then
        if #alerts < 10 then
            alerts[#alerts + 1] = {
                kind = 'quest',
                monster_info = true,
                title = tx('Rank Up!'),
                line1 = tx(score.rank_name),
                line2 = string.format(tx('%d points'), score.points),
            }
        end

        rank_seen = score.rank
        changed = true
    elseif score.rank < rank_seen then
        rank_seen = score.rank
        changed = true
    end

    for _, item in ipairs(M.ACHIEVEMENTS) do
        if unlocked[item.id] ~= nil and not ach_seen[item.id] then
            ach_seen[item.id] = true
            changed = true

            if #alerts < 10 then
                alerts[#alerts + 1] = {
                    kind = 'quest',
                    monster_info = true,
                    title = tx('Achievement Unlocked'),
                    line1 = unlocked[item.id].text,
                    line2 = string.format(tx('%d points'), score.points),
                }
            end
        end
    end

    if changed then
        save_progress(owner)
    end
end

-- The next alert (a rank up or an achievement), or nil.
function M.TakeAlert()
    return table.remove(alerts, 1)
end

return M
