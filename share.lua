-- The Tab key of the chat box: it completes what you are writing with a nick
-- of the channel or with the name of a quest, a mission, an NPC or a zone,
-- written as a tag ("[Quest: Name]") that the others can read. Pure logic:
-- the chat window gives the text and puts back what this returns.

local M = {}

M.MAX_RESULTS = 40
M.MIN_LENGTH = 2
M.MAX_WORDS = 5

-- Where the names come from. The addon sets them (logic.lua); the tests too.
--   entries(): { { kind = 'quest'|'mission', name = '...' }, ... }
--   zones():   { 'Name', ... }
--   nicks():   { 'Nick', ... }
M.source = {}

local npcs = nil

local function npc_names()
    if npcs == nil then
        local ok, list = pcall(require, 'data.npcs')

        npcs = ok and type(list) == 'table' and list or {}
    end

    return npcs
end

-- For the tests: use this list instead of data/npcs.lua.
function M.SetNpcs(list)
    npcs = type(list) == 'table' and list or {}
end

-- Lower case, without the apostrophes (so "Cids" finds "Cid's").
local function fold(text)
    return (tostring(text or ''):lower():gsub("['`]", ''))
end

M.Fold = fold

local KINDS = {
    nick = { order = 1 },
    quest = { order = 2, tag = 'Quest' },
    mission = { order = 3, tag = 'Mission' },
    npc = { order = 4, tag = 'NPC' },
    zone = { order = 5, tag = 'Zone' },
}

local function call(name)
    local fn = M.source[name]

    if type(fn) ~= 'function' then
        return {}
    end

    local ok, list = pcall(fn)

    return ok and type(list) == 'table' and list or {}
end

-- Every name there is: { kind =, name =, key = folded name }.
local function all_names()
    local list = {}
    local seen = {}

    local function add(kind, name)
        if type(name) == 'string' and name ~= '' then
            local id = kind .. '|' .. name

            if not seen[id] then
                seen[id] = true
                list[#list + 1] = { kind = kind, name = name, key = fold(name) }
            end
        end
    end

    for _, entry in ipairs(call('entries')) do
        if entry.kind == 'quest' or entry.kind == 'mission' then
            add(entry.kind, entry.name)
        end
    end

    for _, name in ipairs(npc_names()) do
        add('npc', name)
    end

    for _, name in ipairs(call('zones')) do
        add('zone', name)
    end

    return list
end

-- The places in the text where a name may start: the start, and each word
-- (after a space or a bracket). Up to MAX_WORDS words from the end, the
-- longest tail first.
local function starts(text)
    local list = {}

    for position = 1, #text do
        local before = position == 1 and ' ' or text:sub(position - 1, position - 1)
        local here = text:sub(position, position)

        if (before == ' ' or before == '[') and here ~= ' ' and here ~= '[' then
            list[#list + 1] = position
        end
    end

    while #list > M.MAX_WORDS do
        table.remove(list, 1)
    end

    return list
end

local function sorted(found)
    table.sort(found, function(a, b)
        local oa, ob = KINDS[a.kind].order, KINDS[b.kind].order

        if oa ~= ob then
            return oa < ob
        end

        if a.key ~= b.key then
            return a.key < b.key
        end

        return a.name < b.name
    end)

    while #found > M.MAX_RESULTS do
        table.remove(found)
    end

    return found
end

-- What can the text end with? Returns nil, or
--   { at = position where the word starts, from = where the replaced part
--     starts (a "[" typed before it goes too), token = the word and what follows,
--     list = { { kind =, name =, text = what goes in its place }, ... } }
-- The longest tail of the text that has a match wins. A name that starts
-- with the tail is found first; if there is none, a name that has the last
-- word (three letters or more) inside.
function M.Find(text, no_nicks)
    text = tostring(text or '')

    local names = all_names()
    local nicks = no_nicks and {} or call('nicks')
    local places = starts(text)

    for pass = 1, 2 do
        for _, at in ipairs(places) do
            local token = text:sub(at)
            local key = fold(token)
            local found = {}

            if #key >= M.MIN_LENGTH then
                local last_word = at == places[#places]

                if pass == 1 then
                    for _, entry in ipairs(names) do
                        if entry.key:sub(1, #key) == key then
                            found[#found + 1] = entry
                        end
                    end

                    -- A nick: one word only.
                    if not token:find(' ', 1, true) then
                        for _, nick in ipairs(nicks) do
                            if fold(nick):sub(1, #key) == key then
                                found[#found + 1] = {
                                    kind = 'nick', name = nick, key = fold(nick),
                                }
                            end
                        end
                    end
                elseif last_word and #key >= 3 then
                    for _, entry in ipairs(names) do
                        if entry.key:find(key, 1, true) then
                            found[#found + 1] = entry
                        end
                    end
                end

                if #found > 0 then
                    -- The tag brackets: the "[" the player typed stays out.
                    local list = {}

                    for _, entry in ipairs(sorted(found)) do
                        local insert

                        if entry.kind == 'nick' then
                            insert = entry.name .. (at == 1 and ': ' or ' ')
                        else
                            insert = '[' .. KINDS[entry.kind].tag .. ': '
                                .. entry.name .. ']'
                        end

                        list[#list + 1] = {
                            kind = entry.kind, name = entry.name, text = insert,
                        }
                    end

                    -- A "[" typed just before the word goes too (the tag has its own).
                    local from = at

                    if at > 1 and text:sub(at - 1, at - 1) == '[' then
                        from = at - 1
                    end

                    return { at = at, from = from, token = token, list = list }
                end
            end
        end
    end

    return nil
end

-- The state of one box between two presses of Tab: a new press with the
-- same text as the last result goes to the next match.
function M.New()
    return { applied = nil, base = nil, list = nil, index = 0 }
end

-- Press of Tab on `text`. Returns the new text and a short description of
-- the match ("2/5 Quest: Name"), or nil when there is nothing to complete.
-- max: longest text allowed. no_nicks: do not offer the nicks (private chats).
function M.Press(state, text, max, no_nicks)
    text = tostring(text or '')

    if state.applied ~= nil and text == state.applied and state.list then
        state.index = state.index % #state.list + 1
    else
        local result = M.Find(text, no_nicks)

        if result == nil then
            state.applied, state.base, state.list = nil, nil, nil

            return nil
        end

        state.base = text:sub(1, result.from - 1)
        state.list = result.list
        state.index = 1
    end

    -- A match that does not fit in the box is skipped.
    for _ = 1, #state.list do
        local entry = state.list[state.index]
        local new = state.base .. entry.text

        if max == nil or #new <= max then
            state.applied = new

            local label = entry.kind == 'nick' and entry.name
                or (KINDS[entry.kind].tag .. ': ' .. entry.name)

            return new, string.format('%d/%d  %s', state.index, #state.list, label)
        end

        state.index = state.index % #state.list + 1
    end

    return nil
end

return M
