-- Chat between the users of the addon, over IRC (Snoonet).
--
-- Two parts:
--   1. The chat: one channel, text only. Off until the user connects.
--   2. A connection test (/journal chat test): it only connects, listens and
--      closes, without logging in.
--
-- The sockets never block: Tick() looks at them once a frame. Only the lookup
-- of the name of the server (DNS) can hold the game for a moment.
--
-- There is no encryption (the client has no TLS): what is written travels as
-- plain text. The nick is the name of the character and anyone could use the
-- name of another.

local M = {}

-- The network and the channel of the chat.
M.HOST = 'irc.snoonet.org'
M.PORT = 6667
M.CHANNEL = '#ffxi-journal'

-- The channels of the chat: a fixed list (nobody can add one). The user is
-- in all of them while connected and cannot leave one; only disconnect.
-- color: the detail of its button in the window.
M.CHANNELS = {
    { name = '#ffxi-journal', label = 'General', color = { 0.92, 0.68, 0.20, 1.0 } },
    { name = '#ffxi-journal-es', label = 'Spanish', color = { 0.86, 0.30, 0.26, 1.0 } },
    { name = '#ffxi-journal-en', label = 'English', color = { 0.28, 0.52, 0.92, 1.0 } },
    { name = '#ffxi-journal-help', label = 'Help', color = { 0.62, 0.40, 0.82, 1.0 } },
}

-- The server of the test, when the command gives none.
M.DEFAULT_HOST = M.HOST
M.DEFAULT_PORT = M.PORT

-- Seconds to wait for the connection, and to listen once connected.
M.CONNECT_TIMEOUT = 6
M.LISTEN_TIME = 3
M.MAX_SERVER_LINES = 4

local candidate_dirs      -- defined with the files of the chat, below
local window_open = false
local private_open = false   -- the window of the private chats

-- state: 'idle', 'connecting', 'listening' or 'done'.
-- result: nil, 'ok' or 'failed' (of the last test).
local test = {
    state = 'idle',
    result = nil,
    lines = {},
    socket = nil,
    sock = nil,
    started = 0,
    received = 0,
    host = '',
    port = 0,
}

-- Only printable ASCII goes to the chat log of the game.
local function clean(text)
    text = tostring(text or ''):gsub('[^\32-\126]', '?')

    if #text > 110 then
        text = text:sub(1, 107) .. '...'
    end

    return text
end

local function say(text)
    text = clean(text)

    test.lines[#test.lines + 1] = text

    print('[Journal] Chat test: ' .. text)
end

local function close_socket()
    if test.sock ~= nil then
        pcall(function()
            test.sock:close()
        end)
    end

    test.sock = nil
end

local function finish(ok, text)
    close_socket()

    test.state = 'done'
    test.result = ok and 'ok' or 'failed'

    say(text)
end

local function now()
    return test.socket.gettime()
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

function M.IsRunning()
    return test.state == 'connecting' or test.state == 'listening'
end

-- 'ok', 'failed' or nil (no test finished yet).
function M.GetResult()
    return test.result
end

function M.GetLines()
    return test.lines
end

-- Starts the test. Returns true when it is running or has finished well.
function M.StartTest(host, port)
    if M.IsRunning() then
        print('[Journal] Chat test: a test is already running.')

        return false
    end

    host = host ~= nil and host ~= '' and tostring(host) or M.DEFAULT_HOST
    port = tonumber(port) or M.DEFAULT_PORT

    test.lines = {}
    test.result = nil
    test.received = 0
    test.state = 'done'

    if not host:match('^[%w%.%-]+$') or #host > 100 then
        test.result = 'failed'
        say('"' .. host .. '" is not a valid server name.')

        return false
    end

    if port < 1 or port > 65535 or port ~= math.floor(port) then
        test.result = 'failed'
        say('the port must be a number from 1 to 65535.')

        return false
    end

    test.host = host
    test.port = port

    -- 1. LuaSocket.
    local loaded, socket = pcall(require, 'socket')

    if not loaded
        or type(socket) ~= 'table'
        or type(socket.tcp) ~= 'function' then

        test.result = 'failed'
        say('1/3 LuaSocket is NOT available in this client.')
        say('(' .. tostring(socket):match('^[^\r\n]*') .. ')')
        say('RESULT: FAILED. A chat over the network cannot be built this way.')

        return false
    end

    test.socket = socket

    say('1/3 LuaSocket loaded (' .. tostring(socket._VERSION) .. ').')

    -- 2. The address of the server (this lookup can hold the game a moment).
    local resolved, ip, why = pcall(socket.dns.toip, host)

    if not resolved or type(ip) ~= 'string' then
        test.result = 'failed'
        say('2/3 could not find ' .. host .. ' ('
            .. tostring((not resolved and ip) or why) .. ').')
        say('RESULT: FAILED. Check the internet connection or the firewall.')

        return false
    end

    say('2/3 ' .. host .. ' is ' .. ip .. '.')

    -- 3. The connection, without blocking.
    local sock, err = socket.tcp()

    if sock == nil then
        test.result = 'failed'
        say('3/3 could not create the socket (' .. tostring(err) .. ').')
        say('RESULT: FAILED.')

        return false
    end

    sock:settimeout(0)

    test.sock = sock
    test.started = now()

    local connected, connect_err = sock:connect(ip, port)

    if connected then
        test.state = 'listening'
        say('3/3 connected to port ' .. port .. '. Listening...')
    elseif connect_err == 'timeout'
        or connect_err == 'Operation already in progress' then

        test.state = 'connecting'
    else
        finish(false, '3/3 could not connect to port ' .. port
            .. ' (' .. tostring(connect_err) .. '). RESULT: FAILED.')

        return false
    end

    return true
end

-- Once a frame: follows the test without ever waiting.
local function tick_test()
    if test.state == 'connecting' then
        local socket = test.socket
        local ok, _, writable = pcall(socket.select, nil, { test.sock }, 0)

        if ok and writable ~= nil and writable[1] ~= nil then
            if test.sock:getpeername() ~= nil then
                test.state = 'listening'
                test.started = now()
                say('3/3 connected to port ' .. test.port .. '. Listening...')
            else
                finish(false, '3/3 the server refused the connection to port '
                    .. test.port .. '. RESULT: FAILED.')
            end
        elseif now() - test.started > M.CONNECT_TIMEOUT then
            finish(false, '3/3 no connection to port ' .. test.port
                .. ' after ' .. M.CONNECT_TIMEOUT
                .. ' s (refused or blocked by a firewall). RESULT: FAILED.')
        end
    elseif test.state == 'listening' then
        local closed = false

        for _ = 1, 8 do
            local line, err = test.sock:receive('*l')

            if line == nil then
                closed = err == 'closed'

                break
            end

            test.received = test.received + 1

            if test.received <= M.MAX_SERVER_LINES then
                say('server: ' .. line)
            end
        end

        if closed
            or test.received >= M.MAX_SERVER_LINES
            or now() - test.started > M.LISTEN_TIME then

            if test.received > 0 then
                finish(true, 'RESULT: OK. The client can connect and read'
                    .. ' from a server.')
            else
                finish(true, 'RESULT: OK, connected, but the server sent'
                    .. ' no text in ' .. M.LISTEN_TIME .. ' s.')
            end
        end
    end
end

-- The chat ---------------------------------------------------------------------
-- (M.Tick, at the end of this part, runs the test and the chat.)

M.MAX_LINES = 200
M.HISTORY_LINES = 200     -- lines kept for each private chat
M.HISTORY_PEERS = 30      -- private chats kept
M.HISTORY_SAVE_WAIT = 5   -- seconds after the last line before writing
M.ALERT_GAP = 1.5         -- seconds between two alert sounds
M.MAX_TEXT = 300          -- bytes of a message
M.MAX_QUEUE = 4           -- messages waiting to be sent
M.SEND_GAP = 1.5          -- seconds between two messages
M.CONNECT_WAIT = 12       -- seconds for the connection
M.SASL_WAIT = 8           -- seconds for the server to answer the password
M.LOGIN_WAIT = 40         -- seconds for the server to accept the nick
M.MAX_PRIVATE = 8         -- private tabs at once
M.PRIVATE_COLOR = { 0.90, 0.48, 0.74, 1.0 }
M.JOIN_ANSWER_WAIT = 8     -- seconds before saying that a channel did not answer
M.JOIN_FIRST = 2           -- seconds after the welcome before the other channels
M.JOIN_GAP = 1.5           -- seconds between one JOIN and the next
M.JOIN_RETRY = 12         -- seconds between new tries to join a channel that failed
M.JOIN_TRIES = 8          -- how many new tries
M.SILENCE_PING = 150      -- seconds without data before asking the server
M.SILENCE_DROP = 240      -- seconds without data before giving up
M.RETRY = { 15, 30, 60, 120, 300 }
M.FILE_NAME = 'shared_chat.lua'

-- state: 'off', 'connecting', 'login', 'joining', 'online' or 'waiting'
-- (waiting = the connection was lost and it will try again).
local irc = {
    state = 'off',
    wanted = false,       -- the user wants to be connected
    sock = nil,
    ip = nil,
    pending = '',         -- a line that has not arrived whole yet
    out = '',             -- bytes waiting to go out
    queue = {},           -- messages waiting for their turn
    last_send = 0,
    last_data = 0,
    pinged = false,
    started = 0,
    retry_at = 0,
    retries = 0,
    nick = '',
    password = '',
    base_nick = '',
    nick_try = 0,
    chans = {},           -- by channel name in lower case (see make_chans)
    names_raw = {},       -- the last NAMES lines, for /journal chat names
    raw_log = {},         -- the last lines of the server, for /journal chat log
    active = M.CHANNEL,   -- the channel of the tab on screen
    name_check = 0,
    join_at = 0,          -- when to try the channels that are not joined
    join_tries = 0,
    join_queue = {},      -- channels waiting for their JOIN
    want = {},            -- channels the user opened (lower case): joined again after a reconnect
    notices = 0,          -- notices of the server shown in this connection
    privs = {},           -- keys of the private tabs, in order
    pactive = nil,        -- key of the private tab on screen
    hist = {},            -- saved private chats of this user, by nick in lower case
    hist_key = nil,       -- whose history is loaded
    hist_dirty_at = nil,  -- when the history changed and is not written yet
    hist_check = 0,
    alert_at = 0,
    alert_count = 0,
    mention_count = 0,
}

-- The state of each channel: its lines, who is in it, what was not read.
-- inside: the server accepted the JOIN.
local function make_chans()
    for _, entry in ipairs(M.CHANNELS) do
        irc.chans[entry.name:lower()] = {
            name = entry.name,
            label = entry.label,
            lines = {},
            serial = 0,       -- goes up with every new line
            unread = false,
            users = {},
            user_count = 0,
            inside = false,
        }
    end
end

make_chans()

-- The state of a channel from its name (any case); nil if it is not in the
-- fixed list. No name: the general channel.
local function chan_of(name)
    if name == nil then
        return irc.chans[M.CHANNEL:lower()]
    end

    return irc.chans[tostring(name):lower()]
end

local store = {
    auto = false, accepted = false, muted = {}, loaded = false,
    passwords = {},       -- remembered passwords, by nick in lower case
    custom_name = '',     -- the name chosen by the user ('' = the character's)
    win = nil,            -- { x, y, w, h } of the window, once it was open
    pinned = false,       -- the window cannot be moved or resized
    pwin = nil,           -- { x, y, w, h } of the window of the private chats
    pm_alert = true,      -- alert and sound when someone writes to you
    mention_alert = true, -- the same when a channel message names you
    open = false,         -- the window was open (it comes back if pinned)
    dirty = false,
    dirty_time = 0,
}

-- Passwords written in this session, by nick in lower case (remembered or
-- not). A password is never shown and never goes to the lines of the chat.
local session_pass = {}

-- Seconds; LuaSocket's clock when it is there (os.clock is not wall time
-- everywhere).
function M.Now()
    if irc.socket ~= nil then
        return irc.socket.gettime()
    end

    return os.clock()
end

-- Takes out what must never reach the screen or the server: control bytes
-- (line breaks included) and the color codes of IRC.
function M.CleanText(text, max)
    text = tostring(text or '')
    text = text:gsub('\3%d?%d?,?%d?%d?', '')
    text = text:gsub('[%z\1-\31\127]', '')

    if max ~= nil and #text > max then
        text = text:sub(1, max)

        -- Do not leave half a UTF-8 character at the end.
        while #text > 0 do
            local byte = text:byte(#text)

            if byte < 128 then
                break
            end

            text = text:sub(1, #text - 1)

            if byte >= 192 then
                break
            end
        end
    end

    return text
end

-- A nick the server accepts, from the name of the character.
function M.MakeNick(name)
    local nick = tostring(name or ''):gsub('[^%a%d_%-]', '')

    if nick:match('^[%d%-]') then
        nick = '_' .. nick
    end

    if #nick < 2 then
        nick = 'Adventurer'
    end

    return nick:sub(1, 20)
end

-- The name of the character, or '' while there is none.
function M.PlayerName()
    local ok, name = pcall(function()
        return AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)
    end)

    if ok and type(name) == 'string' then
        return (name:gsub('[^%a]', ''))
    end

    return ''
end

-- The name the chat uses: the one the user chose, or the character's.
function M.ChatName()
    if store.custom_name ~= '' then
        return store.custom_name
    end

    return M.PlayerName()
end

-- What the user chose ('' = the name of the character).
function M.GetCustomName()
    return store.custom_name
end

-- A name for the chat: letters, digits, _ and -, 20 at most; '' when it is
-- empty or too short.
local function clean_name(text)
    local name = tostring(text or ''):gsub('[^%a%d_%-]', ''):sub(1, 20)

    if name:match('^[%d%-]') then
        name = '_' .. name
    end

    if #name < 2 then
        name = ''
    end

    return name
end

-- Sets the name of the chat; an empty text goes back to the name of the
-- character. Returns the name kept.
function M.SetCustomName(text)
    local name = clean_name(text)

    if name ~= store.custom_name then
        store.custom_name = name

        M.Save()
    end

    return name
end


-- ---------------------------------------------------------------------
-- The history of the private chats: on this computer, one file for each
-- user of the chat (the name of the chat), only what was said in private.

local HIST_KINDS = { msg = true, me = true, action = true }

-- Which file: the name of the chat, made safe for a file name.
local function hist_key_now()
    local name = M.ChatName()

    if name == '' then
        return nil
    end

    return (M.MakeNick(name):lower():gsub('[^%w_%-]', '_'))
end

local function hist_file(key)
    return 'chat_private_' .. key .. '.lua'
end

local function hist_trim()
    local peers = {}

    for key, rec in pairs(irc.hist) do
        peers[#peers + 1] = { key = key, last = rec.last or 0 }
    end

    if #peers <= M.HISTORY_PEERS then
        return
    end

    table.sort(peers, function(a, b)
        return a.last > b.last
    end)

    for index = M.HISTORY_PEERS + 1, #peers do
        irc.hist[peers[index].key] = nil
    end
end

-- A line of a private chat goes to the history.
local function hist_add(chan, kind, nick, text)
    if not chan.private or not HIST_KINDS[kind] or irc.hist_key == nil then
        return
    end

    local key = chan.name:sub(2)
    local rec = irc.hist[key]

    if rec == nil then
        rec = { nick = chan.nick, lines = {} }
        irc.hist[key] = rec
    end

    rec.nick = chan.nick
    rec.last = os.time()
    rec.lines[#rec.lines + 1] = {
        kind, nick or '', text, os.date('%H:%M'), os.date('%Y-%m-%d'),
    }

    while #rec.lines > M.HISTORY_LINES do
        table.remove(rec.lines, 1)
    end

    hist_trim()

    irc.hist_dirty_at = M.Now()
end

local function hist_serialize()
    local keys = {}

    for key in pairs(irc.hist) do
        keys[#keys + 1] = key
    end

    table.sort(keys)

    local parts = { 'return {\n' }

    for _, key in ipairs(keys) do
        local rec = irc.hist[key]

        parts[#parts + 1] = string.format(
            '    [%q] = { nick = %q, last = %d, lines = {\n',
            key, rec.nick, rec.last or 0
        )

        for _, l in ipairs(rec.lines) do
            parts[#parts + 1] = string.format(
                '        { %q, %q, %q, %q, %q },\n', l[1], l[2], l[3], l[4], l[5]
            )
        end

        parts[#parts + 1] = '    } },\n'
    end

    parts[#parts + 1] = '}\n'

    return table.concat(parts)
end

-- Writes the history of the user (when it changed). True when written.
local function save_history(force)
    if irc.hist_key == nil or (irc.hist_dirty_at == nil and not force) then
        return false
    end

    local data = hist_serialize()
    local name = hist_file(irc.hist_key)

    for _, entry in ipairs(M.CandidateDirs()) do
        if entry.create and ashita ~= nil and ashita.fs ~= nil then
            for _, fname in ipairs({ 'create_dir', 'create_directory' }) do
                if ashita.fs[fname] ~= nil then
                    pcall(ashita.fs[fname], entry.dir)
                end
            end
        end

        local file = io.open(entry.dir .. name, 'wb')

        if file ~= nil then
            file:write(data)
            file:close()

            irc.hist_dirty_at = nil

            return true
        end
    end

    return false
end

-- Reads the file of the user: only what has the right shape is kept.
local function read_history(key)
    local hist = {}

    for _, entry in ipairs(M.CandidateDirs()) do
        local file = io.open(entry.dir .. hist_file(key), 'rb')

        if file ~= nil then
            local data = file:read('*a')

            file:close()

            local chunk = loadstring(data or '', 'chat_private')

            if chunk ~= nil then
                setfenv(chunk, {})

                local ok, result = pcall(chunk)

                if ok and type(result) == 'table' then
                    for _, rec in pairs(result) do
                        if type(rec) == 'table' and type(rec.nick) == 'string'
                            and rec.nick:match('^[%w_%-%[%]\\`^{}|]+$')
                            and #rec.nick <= 30 and type(rec.lines) == 'table' then

                            local lines = {}

                            for index = 1, math.min(#rec.lines, M.HISTORY_LINES) do
                                local l = rec.lines[index]

                                if type(l) == 'table' and HIST_KINDS[l[1]]
                                    and type(l[2]) == 'string' and #l[2] <= 40
                                    and type(l[3]) == 'string' and #l[3] <= 420
                                    and type(l[4]) == 'string' and #l[4] <= 8
                                    and type(l[5]) == 'string' and #l[5] <= 12 then

                                    lines[#lines + 1] = { l[1], l[2], l[3], l[4], l[5] }
                                end
                            end

                            if #lines > 0 then
                                hist[rec.nick:lower()] = {
                                    nick = rec.nick,
                                    last = type(rec.last) == 'number' and rec.last or 0,
                                    lines = lines,
                                }
                            end
                        end
                    end
                end
            end

            break
        end
    end

    return hist
end

-- The saved lines of a peer go to its tab (a line with the day when it
-- changes), so the conversation goes on where it was.
local function restore_lines(chan)
    local rec = irc.hist[chan.name:sub(2)]

    if rec == nil or #chan.lines > 0 then
        return
    end

    local day

    for _, l in ipairs(rec.lines) do
        if l[5] ~= day then
            day = l[5]
            chan.serial = chan.serial + 1
            chan.lines[#chan.lines + 1] = {
                kind = 'info', text = '-- ' .. day .. ' --',
                time = l[4], serial = chan.serial,
            }
        end

        chan.serial = chan.serial + 1
        chan.lines[#chan.lines + 1] = {
            kind = l[1], nick = l[2], text = l[3], time = l[4],
            serial = chan.serial,
        }
    end

    if day ~= nil and day ~= os.date('%Y-%m-%d') then
        chan.serial = chan.serial + 1
        chan.lines[#chan.lines + 1] = {
            kind = 'info', text = '-- ' .. os.date('%Y-%m-%d') .. ' --',
            time = os.date('%H:%M'), serial = chan.serial,
        }
    end

    while #chan.lines > M.MAX_LINES do
        table.remove(chan.lines, 1)
    end
end

-- The sound of a private message. Your own assets/sounds/private_message.wav
-- when it is a good .wav; otherwise a short chime that the addon writes
-- itself (assets/sounds/private_message_default.wav) the first time.
local function wav_ok(path)
    local file = io.open(path, 'rb')

    if file == nil then
        return false
    end

    local head = file:read(12)
    local size = file:seek('end')

    file:close()

    if head == nil or #head < 12 or head:sub(1, 4) ~= 'RIFF'
        or head:sub(9, 12) ~= 'WAVE' then

        return false
    end

    local b1, b2, b3, b4 = head:byte(5, 8)

    return b1 + b2 * 256 + b3 * 65536 + b4 * 16777216 == size - 8
end

local function le(value, bytes)
    local out = {}

    for i = 1, bytes do
        out[i] = string.char(value % 256)
        value = math.floor(value / 256)
    end

    return table.concat(out)
end

-- Two soft notes, 16 bit mono: writes the file. True when written.
local function make_chime(path)
    local rate = 22050
    local samples = {}

    for _, note in ipairs({ { 880, 0.12 }, { 1318.5, 0.22 } }) do
        for i = 0, math.floor(rate * note[2]) - 1 do
            local t = i / rate
            local env = math.min(1, i / (rate * 0.005)) * math.exp(-t * 9)
            local v = math.floor(32767 * 0.6 * env * (
                0.5 * math.sin(2 * math.pi * note[1] * t)
                + 0.2 * math.sin(4 * math.pi * note[1] * t)
            ))

            if v < 0 then
                v = v + 65536
            end

            samples[#samples + 1] = le(v, 2)
        end
    end

    local data = table.concat(samples)
    local file = io.open(path, 'wb')

    if file == nil then
        return false
    end

    file:write('RIFF', le(36 + #data, 4), 'WAVEfmt ', le(16, 4), le(1, 2),
        le(1, 2), le(rate, 4), le(rate * 2, 4), le(2, 2), le(16, 2),
        'data', le(#data, 4), data)
    file:close()

    return true
end

local function sound_file()
    if irc.sound_file ~= nil then
        return irc.sound_file
    end

    local base = tostring(addon and addon.path or '')

    if base ~= '' and not base:match('[\\/]$') then
        base = base .. '/'
    end

    local custom = base .. 'assets/sounds/private_message.wav'

    if wav_ok(custom) then
        irc.sound_file = custom

        return custom
    end

    -- The chime of the addon: in the sounds folder, or in the config folder.
    local places = { base .. 'assets/sounds/private_message_default.wav' }

    for _, entry in ipairs(candidate_dirs()) do
        places[#places + 1] = entry.dir .. 'private_message_default.wav'
    end

    for _, path in ipairs(places) do
        if wav_ok(path) or make_chime(path) then
            irc.sound_file = path

            return path
        end
    end

    return nil
end

local function alert_sound()
    if ashita == nil or ashita.misc == nil
        or ashita.misc.play_sound == nil then

        return
    end

    local path = sound_file()

    if path ~= nil then
        pcall(ashita.misc.play_sound, path)
    elseif not irc.sound_missing then
        irc.sound_missing = true

        print('[Journal] Could not create the alert sound (assets/sounds).')
    end
end

-- A channel (or private tab) has been read.
local function clear_unread(chan)
    chan.unread = false
    chan.unread_count = 0
    chan.mention = false
end

-- Someone names you in a channel that is not on screen: a sound and a line
-- in the game chat (the option of the settings), at most one every ALERT_GAP.
local function mention_alert(chan, nick, text)
    if not store.mention_alert then
        return
    end

    irc.mention_count = irc.mention_count + 1

    local now = M.Now()

    if now - irc.alert_at >= M.ALERT_GAP then
        irc.alert_at = now

        alert_sound()
    end

    print('[Journal] ' .. nick .. ' mentioned you in ' .. chan.label .. ': ' .. text)
end

local function add_line(chan, kind, nick, text)
    chan.serial = chan.serial + 1

    chan.lines[#chan.lines + 1] = {
        kind = kind,          -- 'msg', 'me', 'action' or 'info'
        nick = nick,
        text = text,
        time = os.date('%H:%M'),
        serial = chan.serial,
    }

    while #chan.lines > M.MAX_LINES do
        table.remove(chan.lines, 1)
    end

    -- Not read: the window is closed or it shows another channel (a private
    -- chat has its own window).
    local seen

    if chan.private then
        seen = private_open and irc.pactive == chan.name
    else
        seen = window_open and irc.active == chan.name
    end

    if not seen and (kind == 'msg' or kind == 'action') then
        chan.unread = true
        chan.unread_count = (chan.unread_count or 0) + 1

        -- A private message always counts as important; in a channel only
        -- a line that names you.
        if chan.private or M.Mentions(text) then
            if not chan.private and not chan.mention then
                mention_alert(chan, tostring(nick), tostring(text))
            end

            chan.mention = true
        end
    end

    hist_add(chan, kind, nick, text)
end

-- A system line. With a channel it goes there; without, to every channel
-- of the list (the connection concerns all of them).
local function info(text, chan)
    text = M.CleanText(text, 300)

    if chan ~= nil then
        add_line(chan, 'info', nil, text)

        return
    end

    for _, entry in ipairs(M.CHANNELS) do
        add_line(irc.chans[entry.name:lower()], 'info', nil, text)
    end
end

local function raw(text)
    irc.out = irc.out .. text .. '\r\n'
end

local function drop_socket()
    if irc.sock ~= nil then
        pcall(function()
            irc.sock:close()
        end)
    end

    irc.sock = nil
    irc.pending = ''
    irc.out = ''
    irc.queue = {}

    for _, chan in pairs(irc.chans) do
        chan.users = {}
        chan.user_count = 0
        chan.inside = false
        chan.join_sent = nil
    end
end

-- The connection ended without the user asking: try again later.
local function lost(why)
    drop_socket()

    if not irc.wanted then
        irc.state = 'off'

        return
    end

    irc.retries = irc.retries + 1

    local wait = M.RETRY[math.min(irc.retries, #M.RETRY)]

    irc.state = 'waiting'
    irc.retry_at = M.Now() + wait

    -- After two failures the address is looked up again.
    if irc.retries >= 2 then
        irc.ip = nil
    end

    info(why .. ' Trying again in ' .. wait .. ' s.')
end

-- Stops for good (a ban, a kick, no way to join...).
local function give_up(why)
    drop_socket()

    irc.wanted = false
    irc.state = 'off'

    info(why)
end

local function set_user(chan, nick, present)
    local key = nick:lower()

    -- The network's service is not a person: never listed or counted.
    if key == 'chanserv' then
        return
    end

    if present and not chan.users[key] then
        chan.users[key] = nick
        chan.user_count = chan.user_count + 1
    elseif not present and chan.users[key] then
        chan.users[key] = nil
        chan.user_count = chan.user_count - 1
    end
end

-- Someone left the server or changed nick: it concerns every channel.
local function set_user_everywhere(nick, present)
    for _, chan in pairs(irc.chans) do
        set_user(chan, nick, present)
    end
end

local function open_connection()
    local loaded, socket = pcall(require, 'socket')

    if not loaded or type(socket) ~= 'table' then
        give_up('The chat needs LuaSocket and this client does not have it.')

        return
    end

    irc.socket = socket

    if irc.ip == nil then
        local ok, ip = pcall(socket.dns.toip, M.HOST)

        if not ok or type(ip) ~= 'string' then
            lost('Could not find the chat server.')

            return
        end

        irc.ip = ip
    end

    local sock = socket.tcp()

    if sock == nil then
        lost('Could not open a connection.')

        return
    end

    sock:settimeout(0)

    irc.sock = sock
    irc.pending = ''
    irc.out = ''
    irc.pinged = false
    irc.started = M.Now()
    irc.last_data = irc.started
    irc.state = 'connecting'

    local connected, err = sock:connect(irc.ip, M.PORT)

    if connected then
        M.Login()
    elseif err ~= 'timeout' and err ~= 'Operation already in progress' then
        lost('Could not connect to the chat server.')
    end
end

-- Sends the nick: the server answers with 001 (accepted) or an error.
function M.Login()
    info('Connected to the server. Logging in...', chan_of(M.CHANNEL))

    irc.state = 'login'
    irc.started = M.Now()
    irc.last_data = irc.started
    irc.nick_try = 0
    irc.nick = irc.base_nick
    irc.password = M.GetPassword(irc.base_nick)
    irc.identified = false
    irc.sasl = false

    -- With a password: ask for SASL, which identifies the nick before the
    -- server lets it in. A server without it gets the password later, in a
    -- message to NickServ.
    if irc.password ~= '' then
        irc.sasl = true

        raw('CAP REQ :sasl')
    end

    raw('NICK ' .. irc.nick)
    raw('USER journal 0 * :Journal addon')
end

local B64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function M.Base64(data)
    local out = {}

    for i = 1, #data, 3 do
        local a, b, c = data:byte(i, i + 2)
        local n = a * 65536 + (b or 0) * 256 + (c or 0)
        local i1 = math.floor(n / 262144) % 64
        local i2 = math.floor(n / 4096) % 64
        local i3 = math.floor(n / 64) % 64
        local i4 = n % 64

        out[#out + 1] = B64:sub(i1 + 1, i1 + 1) .. B64:sub(i2 + 1, i2 + 1)
            .. (b and B64:sub(i3 + 1, i3 + 1) or '=')
            .. (c and B64:sub(i4 + 1, i4 + 1) or '=')
    end

    return table.concat(out)
end

-- The nick is taken: the same name with a number.
local function next_nick()
    irc.nick_try = irc.nick_try + 1

    if irc.nick_try > 6 then
        give_up('The server did not accept any nick.')

        return
    end

    irc.nick = irc.base_nick:sub(1, 17) .. '_' .. irc.nick_try

    raw('NICK ' .. irc.nick)
end

-- ':nick!user@host COMMAND a b :the rest' -> nick, command, { a, b, rest }
function M.Parse(line)
    local prefix = nil
    local rest = line

    if rest:sub(1, 1) == ':' then
        local space = rest:find(' ', 1, true)

        if space == nil then
            return nil
        end

        prefix = rest:sub(2, space - 1)
        rest = rest:sub(space + 1)
    end

    local params = {}
    local trailing = nil
    local cut = rest:find(' :', 1, true)

    if cut ~= nil then
        trailing = rest:sub(cut + 2)
        rest = rest:sub(1, cut - 1)
    end

    for word in rest:gmatch('%S+') do
        params[#params + 1] = word
    end

    if trailing ~= nil then
        params[#params + 1] = trailing
    end

    local command = table.remove(params, 1)

    if command == nil then
        return nil
    end

    local nick = prefix and prefix:match('^[^!@]+') or nil

    return nick, command:upper(), params
end

-- A name that can be a nick: letters, digits and the few signs IRC allows,
-- up to 32 characters. Anything else (a channel, a '=', a colon...) is not a
-- person and is never listed.
local function is_nick(name)
    return type(name) == 'string'
        and #name >= 1 and #name <= 32
        and name:match('^[%w%[%]\\`_^{|}][%w%[%]\\`_^{|}%-]*$') ~= nil
end

local function same(a, b)
    return a ~= nil and b ~= nil and a:lower() == b:lower()
end

-- The numerics that mean "you cannot join the channel".
-- The services of the network are not people: no private chat with them.
local SERVICES = {
    chanserv = true, nickserv = true, memoserv = true, operserv = true,
    hostserv = true, botserv = true, global = true,
}

-- The tab of a private chat with a nick (key '@nick'). create: make it if it
-- is not there. nil when it cannot be (not a nick, a service, yourself, or
-- too many tabs).
local function private_chan(nick, create)
    if not is_nick(nick) or SERVICES[nick:lower()] or same(nick, irc.nick) then
        return nil
    end

    local key = '@' .. nick:lower()
    local chan = irc.chans[key]

    if chan ~= nil or not create then
        return chan
    end

    local count = #irc.privs

    if count >= M.MAX_PRIVATE then
        return nil
    end

    chan = {
        name = key,
        label = nick,
        nick = nick,
        private = true,
        color = M.PRIVATE_COLOR,
        lines = {},
        serial = 0,
        unread = false,
        users = {},
        user_count = 0,
        inside = false,
    }

    irc.chans[key] = chan
    irc.privs[count + 1] = key

    restore_lines(chan)

    if irc.pactive == nil then
        irc.pactive = key
    end

    return chan
end

-- Someone writes to you in private: a sound plays, a line goes to the chat of
-- the game and the Private chats tab gets its ball (only while that
-- conversation is not already on screen). The tab is not opened by itself, so
-- the channel you are reading stays where it is.
local function private_alert(chan, nick, text)
    if not store.pm_alert then
        return
    end

    local on_screen = private_open and irc.pactive == chan.name

    if irc.pactive == nil or not irc.chans[irc.pactive] then
        irc.pactive = chan.name
    end

    if on_screen then
        return
    end

    local now = M.Now()

    irc.alert_count = irc.alert_count + 1

    if now - irc.alert_at >= M.ALERT_GAP then
        irc.alert_at = now

        alert_sound()
    end

    print('[Journal] ' .. nick .. ' (private): ' .. text)
end

local JOIN_ERRORS = {
    ['403'] = true, ['405'] = true, ['471'] = true, ['473'] = true,
    ['474'] = true, ['475'] = true, ['477'] = true, ['489'] = true,
    ['520'] = true,
}

local function handle(line)
    local nick, command, params = M.Parse(line)

    if command == nil then
        return
    end

    local last = params[#params] or ''

    -- The last lines the server sent, to see why a channel does not open.
    if command ~= 'PING' and command ~= 'PONG' then
        irc.raw_log[#irc.raw_log + 1] = line:sub(1, 300)

        while #irc.raw_log > 60 do
            table.remove(irc.raw_log, 1)
        end
    end

    -- With a password, what the server answers while logging in is shown in
    -- the chat, so a refusal can be read (never the password: the server
    -- does not send it back).
    if irc.password ~= '' and (irc.state == 'login' or irc.state == 'joining')
        and command ~= 'PING' and command ~= 'PONG'
        and (command == 'CAP' or command == 'AUTHENTICATE'
            or command:match('^[49]%d%d$')
            or (command == 'NOTICE' and nick == nil)) then

        if command == 'AUTHENTICATE' then
            info('Login: the server asks for the password.')
        elseif command == 'CAP' then
            info('Login: CAP ' .. tostring(params[2]) .. ' ' .. last)
        else
            info('Login: ' .. command .. ' ' .. last)
        end
    end

    if command == 'PING' then
        raw('PONG :' .. last)
    elseif command == 'PONG' then
        irc.pinged = false
    elseif command == 'CAP' and irc.state == 'login' then
        -- The answer to 'CAP REQ :sasl'.
        if params[2] == 'ACK' and irc.sasl then
            raw('AUTHENTICATE PLAIN')
        elseif params[2] == 'NAK' then
            irc.sasl = false

            raw('CAP END')
        end
    elseif command == 'AUTHENTICATE' and irc.sasl then
        if params[1] == '+' then
            raw('AUTHENTICATE ' .. M.Base64(
                irc.base_nick .. '\0' .. irc.base_nick .. '\0' .. irc.password
            ))
        end
    elseif command == '900' or command == '903' then
        if not irc.identified then
            irc.identified = true

            info('Identified as ' .. irc.base_nick .. '.')
        end

        if command == '903' then
            raw('CAP END')
        end
    elseif command == '902' or command == '904' or command == '905'
        or command == '906' or command == '908' then

        -- The password was not accepted: go on without it.
        if irc.sasl then
            irc.sasl = false

            info('The password was not accepted: connected as a guest.')

            raw('CAP END')
        end
    elseif command == '001' then
        -- Accepted: the server tells the nick it gave.
        irc.nick = params[1] or irc.nick
        -- Welcome: from here the chat is online; each channel is joined
        -- (and shown as joined) by itself, so a slow or refused channel
        -- cannot leave the chat "connecting".
        irc.state = 'online'
        irc.retries = 0
        irc.started = M.Now()

        info('Logged in as ' .. irc.nick .. '. Joining the channels...',
            chan_of(M.CHANNEL))

        -- A server without SASL: the password goes to NickServ.
        if irc.password ~= '' and not irc.identified then
            raw('PRIVMSG NickServ :IDENTIFY ' .. irc.password)
        end

        irc.join_tries = 0
        irc.notices = 0
        irc.join_at = M.Now() + math.min(M.JOIN_FIRST, M.JOIN_RETRY)

        -- The general channel is joined by itself; the others when the user
        -- opens them (and again after a reconnect, one by one: see the tick).
        raw('JOIN ' .. M.CHANNEL)
        irc.join_queue = {}
        irc.join_reported = false
    elseif command == 'NOTICE' and same(nick, 'NickServ')
        and irc.password ~= '' and not irc.identified
        and #params >= 2 and not chan_of(params[1]) then

        -- What NickServ says about the password (accepted or not).
        info('NickServ: ' .. last)
    elseif command == '432' or command == '433'
        or command == '436' or command == '437' then

        if irc.state == 'login' then
            next_nick()
        end
    elseif command == '353' then
        -- The names of a channel: '@nick +nick nick'.
        local chan = chan_of(params[3])

        -- The last lines, to see what the server sends (/journal chat names).
        irc.names_raw[#irc.names_raw + 1] = line

        while #irc.names_raw > 6 do
            table.remove(irc.names_raw, 1)
        end

        if chan ~= nil then
            for name in last:gmatch('%S+') do
                name = name:gsub('^[~&@%%+]+', '')

                -- With 'userhost-in-names' a name comes as nick!user@host.
                name = name:match('^([^!]+)') or name

                if is_nick(name) then
                    set_user(chan, name, true)
                end
            end
        end
    elseif command == 'JOIN' and nick ~= nil then
        local chan = chan_of(params[1])

        if chan ~= nil then
            if same(nick, irc.nick) then
                irc.state = 'online'
                irc.retries = 0
                chan.inside = true
                chan.users = {}
                chan.user_count = 0

                info('Connected to ' .. chan.name .. ' as ' .. irc.nick .. '.', chan)
            end

            if is_nick(nick) then
                set_user(chan, nick, true)
            end
        end
    elseif command == 'PART' and nick ~= nil then
        local chan = chan_of(params[1])

        if chan ~= nil then
            if same(nick, irc.nick) then
                chan.inside = false
                chan.users = {}
                chan.user_count = 0
            else
                set_user(chan, nick, false)
            end
        end
    elseif command == 'QUIT' and nick ~= nil then
        set_user_everywhere(nick, false)
    elseif command == 'NICK' and nick ~= nil then
        for _, chan in pairs(irc.chans) do
            if chan.users[nick:lower()] then
                set_user(chan, nick, false)

                if is_nick(last) then
                    set_user(chan, last, true)
                end
            end
        end

        if same(nick, irc.nick) then
            irc.nick = last
        end
    elseif command == 'KICK' then
        local chan = chan_of(params[1])
        local target = params[2]

        if chan ~= nil and target ~= nil then
            set_user(chan, target, false)

            if same(target, irc.nick) then
                if chan.name == M.CHANNEL then
                    give_up('You were removed from the chat by a moderator.')
                else
                    -- Another channel: out of it, the general one stays.
                    chan.inside = false
                    chan.users = {}
                    chan.user_count = 0

                    info('You were removed from ' .. chan.name
                        .. ' by a moderator.', chan)
                end
            end
        end
    elseif command == 'PRIVMSG' and nick ~= nil then
        -- The channels of the list, or a private message to you (a tab per
        -- person, never from a muted nick).
        local chan = chan_of(params[1])

        if chan == nil and same(params[1], irc.nick) and not M.IsMuted(nick) then
            chan = private_chan(nick, true)
        end

        if chan ~= nil and not M.IsMuted(nick) then
            local action = last:match('^\1ACTION (.-)\1?$')
            local shown

            if action ~= nil then
                shown = M.CleanText(action, 400)

                add_line(chan, 'action', nick, shown)
            elseif last:sub(1, 1) ~= '\1' then
                local text = M.CleanText(last, 400)

                if text ~= '' then
                    shown = text

                    add_line(chan, 'msg', nick, text)
                end
            end

            if chan.private and shown ~= nil and shown ~= '' then
                private_alert(chan, nick, shown)
            end
        end
    elseif command == 'ERROR' then
        if last:lower():find('ban', 1, true)
            or last:lower():find('lined', 1, true) then

            give_up('The chat server refused the connection: ' .. last)
        else
            lost('The chat server closed the connection.')
        end
    elseif command == '465' then
        give_up('The chat server refused the connection: ' .. last)
    elseif command == '401' then
        -- A private message to someone who is not there.
        local chan = params[2] ~= nil and private_chan(params[2], false) or nil

        if chan ~= nil then
            info('This user is not connected.', chan)
        else
            info('The message was not sent: ' .. last)
        end
    elseif command == '404' then
        info('The message was not sent: ' .. last)
    elseif command == 'NOTICE' and nick == nil and irc.state == 'online'
        and irc.notices < 20 then

        -- What the server itself says (a few lines): it may explain a refusal.
        irc.notices = irc.notices + 1

        info('Server: ' .. last, chan_of(M.CHANNEL))
    elseif command == 'NOTICE' and same(nick, 'ChanServ') then
        -- What the channel service says to you (why it does not let you in...).
        info('ChanServ: ' .. last, chan_of(M.CHANNEL))
    elseif JOIN_ERRORS[command] then
        -- '<server> 474 <nick> <channel> :text'.
        local chan = chan_of(params[2])

        if chan ~= nil and chan.name == M.CHANNEL then
            if command == '474' then
                -- Banned: there is no point in trying again.
                give_up('Could not join ' .. M.CHANNEL .. ': ' .. last)
            else
                chan.inside = false

                info('Could not join ' .. chan.name .. ': ' .. last, chan)
            end
        elseif chan ~= nil then
            -- Another channel: the chat goes on without it, and it is not
            -- asked again until the user clicks it again.
            chan.inside = false
            chan.join_sent = nil
            irc.want[chan.name:lower()] = nil

            local text = 'Could not join ' .. chan.name .. ': ' .. last

            info(text, chan)
            info(text, chan_of(M.CHANNEL))
        end
    elseif command:match('^[45]%d%d$') and command ~= '421' and command ~= '422'
        and (irc.state == 'joining' or irc.state == 'online') then

        -- Any other error of the server: shown, so a refusal can be read.
        info('Server ' .. command .. ': ' .. last, chan_of(M.CHANNEL))
    end
end

-- Reads what has arrived, without waiting. False when the server closed.
local function read_lines()
    for _ = 1, 40 do
        local line, err, partial = irc.sock:receive('*l')

        if line == nil then
            if partial ~= nil and partial ~= '' then
                irc.pending = irc.pending .. partial

                -- A line this long is not IRC: drop it.
                if #irc.pending > 4096 then
                    irc.pending = ''
                end
            end

            return err ~= 'closed'
        end

        line = irc.pending .. line
        irc.pending = ''
        irc.last_data = M.Now()
        irc.pinged = false

        if line ~= '' then
            handle(line)
        end

        if irc.sock == nil then
            return true
        end
    end

    return true
end

-- Sends what is waiting, without waiting. False when the server closed.
local function write_out()
    if irc.out == '' then
        return true
    end

    local sent, err, partial = irc.sock:send(irc.out)
    local count = sent or partial or 0

    if count > 0 then
        irc.out = irc.out:sub(count + 1)
    end

    return sent ~= nil or err == 'timeout'
end

local function tick_chat()
    local state = irc.state

    if state == 'off' then
        -- "Connect when the addon loads": once the character has a name.
        if store.auto and store.accepted and not irc.auto_done
            and M.ChatName() ~= '' then

            irc.auto_done = true
            M.Connect()
        end

        return
    end

    local now = M.Now()

    if state == 'waiting' then
        if now >= irc.retry_at then
            open_connection()
        end

        return
    end

    if state == 'connecting' then
        local ok, _, writable =
            pcall(irc.socket.select, nil, { irc.sock }, 0)

        if ok and writable ~= nil and writable[1] ~= nil then
            if irc.sock:getpeername() ~= nil then
                M.Login()
            else
                lost('Could not connect to the chat server.')
            end
        elseif now - irc.started > M.CONNECT_WAIT then
            lost('The chat server did not answer.')
        end

        return
    end

    if not read_lines() then
        lost('The connection to the chat was lost.')

        return
    end

    if irc.sock == nil then
        return
    end

    -- The server never answered the password: go on without SASL (the
    -- password then goes to NickServ once the server lets the nick in).
    if irc.state == 'login' and irc.sasl and now - irc.started > M.SASL_WAIT then
        irc.sasl = false

        info('The server did not answer the password: trying another way.')

        raw('CAP END')
    end

    -- A channel the user asked for and the server never answered.
    for _, entry in ipairs(M.CHANNELS) do
        local chan = irc.chans[entry.name:lower()]

        if chan.join_sent ~= nil and not chan.inside and not chan.join_warned
            and now - chan.join_sent > M.JOIN_ANSWER_WAIT then

            chan.join_warned = true

            info('The server has not answered for ' .. chan.name
                .. '. Click the channel to try again; see /journal chat log.',
                chan)
        end
    end

    -- Channels that are not joined (not asked yet, the server said no, or the
    -- nick was not identified yet): one JOIN at a time, a pass at a time.
    if irc.state == 'online' and now >= irc.join_at then
        if #irc.join_queue == 0 then
            for _, entry in ipairs(M.CHANNELS) do
                local key = entry.name:lower()

                if not irc.chans[key].inside
                    and (entry.name == M.CHANNEL or irc.want[key]) then

                    irc.join_queue[#irc.join_queue + 1] = entry.name
                end
            end

            if #irc.join_queue == 0 then
                irc.join_tries = 0
                irc.join_at = now + M.JOIN_RETRY
            elseif irc.join_tries >= M.JOIN_TRIES then
                -- Out of tries: no more asking; without the general
                -- channel there is no chat.
                if not irc.join_reported then
                    irc.join_reported = true

                    info('Still not in: ' .. table.concat(irc.join_queue, ', ')
                        .. '. See /journal chat log.', chan_of(M.CHANNEL))
                end

                irc.join_queue = {}
                irc.join_at = now + 60

                if not chan_of(M.CHANNEL).inside then
                    give_up('Could not join ' .. M.CHANNEL .. '.')
                end
            else
                irc.join_tries = irc.join_tries + 1
            end
        end

        if #irc.join_queue > 0 then
            raw('JOIN ' .. table.remove(irc.join_queue, 1))

            irc.join_at = now + (#irc.join_queue > 0 and M.JOIN_GAP
                or M.JOIN_RETRY)
        end
    end

    if (irc.state == 'login' or irc.state == 'joining')
        and now - irc.started > M.LOGIN_WAIT then

        lost('The chat server did not let you in.')

        return
    end

    if irc.state == 'online' then
        -- One message at a time, with a pause: the server drops who floods.
        if #irc.queue > 0 and now - irc.last_send >= M.SEND_GAP then
            local item = table.remove(irc.queue, 1)

            raw('PRIVMSG ' .. item.channel .. ' :' .. item.text)

            irc.last_send = now
        end

        -- The character changed (another one logged in): follow its name.
        if now - irc.name_check > 5 then
            irc.name_check = now

            local name = M.ChatName()

            if name ~= '' and M.MakeNick(name) ~= irc.base_nick then
                irc.base_nick = M.MakeNick(name)

                raw('NICK ' .. irc.base_nick)
            end
        end
    end

    -- A silent server: ask it, and give up if it stays silent.
    if now - irc.last_data > M.SILENCE_DROP then
        lost('The connection to the chat was lost.')

        return
    elseif now - irc.last_data > M.SILENCE_PING and not irc.pinged then
        irc.pinged = true

        raw('PING :journal')
    end

    if not write_out() then
        lost('The connection to the chat was lost.')
    end
end

-- Once a frame, from logic.Update. Never waits.
function M.Tick()
    tick_test()
    tick_chat()

    -- The place of the window is written a moment after the last change.
    if store.loaded and store.open ~= window_open then
        store.open = window_open
        store.dirty = true
        store.dirty_time = os.clock()
    end

    if store.dirty and os.clock() - store.dirty_time >= 1.5 then
        M.Save()
    end

    -- The private chats are written a few seconds after the last line.
    if irc.hist_dirty_at ~= nil
        and M.Now() - irc.hist_dirty_at >= M.HISTORY_SAVE_WAIT then

        save_history()
    end
end

-- The window of the private chats: where it was ({ x, y, w, h } or nil).
function M.GetPrivateWindow()
    return store.pwin
end

function M.SetPrivateWindow(x, y, w, h)
    if type(x) ~= 'number' or type(y) ~= 'number'
        or type(w) ~= 'number' or type(h) ~= 'number' then

        return
    end

    local win = store.pwin

    if win ~= nil
        and math.abs(win.x - x) < 2 and math.abs(win.y - y) < 2
        and math.abs(win.w - w) < 2 and math.abs(win.h - h) < 2 then

        return
    end

    store.pwin = {
        x = math.floor(x + 0.5), y = math.floor(y + 0.5),
        w = math.floor(w + 0.5), h = math.floor(h + 0.5),
    }
    store.dirty = true
    store.dirty_time = os.clock()
end

function M.GetPrivateOpen()
    return private_open
end

function M.SetPrivateOpen(value)
    private_open = value == true

    -- The private chats are a tab of the chat window: it has to be open.
    if private_open then
        window_open = true
    end

    if private_open and irc.pactive ~= nil and irc.chans[irc.pactive] then
        clear_unread(irc.chans[irc.pactive])
    end
end

function M.TogglePrivate()
    M.SetPrivateOpen(not private_open)
end

-- Alert (message in the game chat, sound, window) for private messages.
function M.GetPmAlert()
    return store.pm_alert
end

function M.SetPmAlert(value)
    store.pm_alert = value == true

    M.Save()
end

function M.GetAlertCount()
    return irc.alert_count
end

-- Where the window was: { x, y, w, h }, or nil the first time.
function M.GetWindow()
    return store.win
end

-- The window tells where it is every frame; only a real change is kept.
function M.SetWindow(x, y, w, h)
    if type(x) ~= 'number' or type(y) ~= 'number'
        or type(w) ~= 'number' or type(h) ~= 'number' then

        return
    end

    local win = store.win

    if win ~= nil
        and math.abs(win.x - x) < 2 and math.abs(win.y - y) < 2
        and math.abs(win.w - w) < 2 and math.abs(win.h - h) < 2 then

        return
    end

    store.win = {
        x = math.floor(x + 0.5), y = math.floor(y + 0.5),
        w = math.floor(w + 0.5), h = math.floor(h + 0.5),
    }
    store.dirty = true
    store.dirty_time = os.clock()
end

-- Pinned: the window stays where it is (no moving, no resizing) and comes
-- back by itself the next time, if it was open.
function M.GetPinned()
    return store.pinned
end

function M.SetPinned(value)
    store.pinned = value == true

    M.Save()
end

-- Connects (the button of the window). name: for the tests.
function M.Connect(name)
    if irc.state ~= 'off' and irc.state ~= 'waiting' then
        return false
    end

    name = name or M.ChatName()

    if name == '' then
        info('Log in with a character first.')

        return false
    end

    drop_socket()

    irc.wanted = true
    irc.retries = 0
    irc.base_nick = M.MakeNick(name)

    M.EnsureHistory(true)

    if not store.accepted then
        store.accepted = true
        M.Save()
    end

    open_connection()

    return irc.state ~= 'off'
end

function M.Disconnect()
    irc.wanted = false
    irc.want = {}

    if irc.sock ~= nil and irc.state ~= 'connecting' then
        pcall(function()
            irc.sock:send('QUIT :Journal\r\n')
        end)
    end

    local was = irc.state

    if irc.hist_dirty_at ~= nil then
        save_history()
    end

    drop_socket()
    irc.state = 'off'

    if was ~= 'off' then
        info('Disconnected.')
    end
end

-- 'off', 'connecting' (also while logging in and joining), 'online' or
-- 'waiting'.
function M.GetState()
    if irc.state == 'login' or irc.state == 'joining' then
        return 'connecting'
    end

    return irc.state
end

function M.GetNick()
    return irc.nick
end

-- The fixed list of channels, in order: { name, label }. Do not change it;
-- GetChannelInfo tells the state of each one.
function M.GetChannels()
    return M.CHANNELS
end

-- The state of one channel (the active one when none is given).
local function chan_state(name)
    return chan_of(name or irc.active) or chan_of(nil)
end

-- label, inside (connected to it), unread, how many people.
function M.GetChannelInfo(name)
    local chan = chan_state(name)

    if chan.private then
        return chan.label, irc.state == 'online', chan.unread, 0, chan.unread
    end

    return chan.label, chan.inside, chan.unread, chan.user_count,
        chan.mention == true
end

-- The private tabs, in order: { name, label, nick, color }.
function M.GetPrivates()
    local list = {}

    M.EnsureHistory()

    for _, key in ipairs(irc.privs) do
        local chan = irc.chans[key]

        list[#list + 1] = {
            name = chan.name, label = chan.label,
            nick = chan.nick, color = chan.color,
        }
    end

    return list
end

-- Opens (and shows) the private chat with a nick: from a click in the list
-- of people. Returns false when it cannot be.
function M.OpenPrivate(nick)
    local chan = private_chan(tostring(nick or ''), true)

    if chan == nil then
        return false
    end

    return M.SetPrivateActive(chan.name)
end

-- The private tab on screen (in the window of the private chats).
function M.GetPrivateActive()
    return irc.pactive
end

function M.SetPrivateActive(name)
    local chan = chan_of(name)

    if chan ~= nil and chan.private then
        irc.pactive = chan.name
        clear_unread(chan)

        return true
    end

    return false
end

-- Reads the history of the user of the chat (once per user; the tabs of the
-- latest conversations come back). Throttled: it is cheap to call.
function M.EnsureHistory(force)
    local now = M.Now()

    if not force and now - irc.hist_check < 3 then
        return
    end

    irc.hist_check = now

    local key = hist_key_now()

    if key == irc.hist_key then
        return
    end

    -- Another user: what is pending is written first.
    if irc.hist_key ~= nil and irc.hist_dirty_at ~= nil then
        save_history()
    end

    -- Another user: his tabs go; the first time, the tabs there are stay.
    if irc.hist_key ~= nil then
        for _, pkey in ipairs(irc.privs) do
            irc.chans[pkey] = nil
        end

        irc.privs = {}
        irc.pactive = nil
    end

    irc.hist_key = key
    irc.hist = {}

    if key == nil then
        return
    end

    irc.hist = read_history(key)

    local peers = {}

    for _, rec in pairs(irc.hist) do
        peers[#peers + 1] = rec
    end

    table.sort(peers, function(a, b)
        return a.last > b.last
    end)

    for index = 1, math.min(#peers, M.MAX_PRIVATE) do
        private_chan(peers[index].nick, true)
    end
end

-- Deletes the saved private chats: one nick, or all of them.
function M.ClearHistory(nick)
    if irc.hist_key == nil then
        M.EnsureHistory(true)
    end

    if nick ~= nil and nick ~= '' then
        local key = tostring(nick):lower()

        if irc.hist[key] == nil then
            return false
        end

        irc.hist[key] = nil

        local chan = irc.chans['@' .. key]

        if chan ~= nil then
            chan.lines = {}
            chan.serial = chan.serial + 1
        end
    else
        irc.hist = {}

        for _, key in ipairs(irc.privs) do
            local chan = irc.chans[key]

            chan.lines = {}
            chan.serial = chan.serial + 1
        end
    end

    irc.hist_dirty_at = M.Now()

    save_history()

    return true
end

-- Closes a private tab (the saved history stays). The channels cannot be closed.
function M.ClosePrivate(name)
    local chan = irc.chans[tostring(name):lower()]

    if chan == nil or not chan.private then
        return false
    end

    irc.chans[chan.name] = nil

    for index, key in ipairs(irc.privs) do
        if key == chan.name then
            table.remove(irc.privs, index)

            break
        end
    end

    if irc.pactive == chan.name then
        irc.pactive = irc.privs[1]
    end

    return true
end

-- Joins one of the channels of the list (the user clicked it). False when
-- it cannot be asked now (not online, already in it, or asked a moment ago).
function M.JoinChannel(name)
    local chan = chan_of(name)

    if chan == nil or chan.private or irc.state ~= 'online' or chan.inside then
        return false
    end

    local now = M.Now()

    if chan.join_sent ~= nil and now - chan.join_sent < 3 then
        return false
    end

    chan.join_sent = now
    chan.join_warned = false
    irc.want[chan.name:lower()] = true

    info('Joining ' .. chan.name .. '...', chan)
    raw('JOIN ' .. chan.name)

    return true
end

-- The channel of the tab on screen.
function M.GetActive()
    return irc.active
end

function M.SetActive(name)
    local chan = chan_of(name)

    if chan ~= nil and not chan.private then
        irc.active = chan.name
        clear_unread(chan)

        return true
    end

    return false
end

-- Who is in a channel (the active one when none is given), in alphabetical
-- order. A new list each time.
function M.GetUsers(name)
    local list = {}
    local chan = chan_state(name)

    if chan.private then
        list[1] = chan.nick

        if irc.nick ~= '' then
            list[2] = irc.nick
        end

        table.sort(list, function(a, b)
            return a:lower() < b:lower()
        end)

        return list
    end

    for _, nick in pairs(chan_state(name).users) do
        list[#list + 1] = nick
    end

    table.sort(list, function(a, b)
        return a:lower() < b:lower()
    end)

    return list
end

-- Writes in the chat the last NAMES lines the server sent (to look for
-- problems with the list of people).
function M.ShowNames()
    if #irc.names_raw == 0 then
        info('No NAMES line received yet.')
    end

    for _, raw_line in ipairs(irc.names_raw) do
        info('NAMES: ' .. raw_line:sub(1, 240))
    end
end

-- Writes in the General tab the last lines the server sent.
function M.ShowLog()
    local general = chan_of(M.CHANNEL)

    if #irc.raw_log == 0 then
        info('No line received yet.', general)
    end

    for _, raw_line in ipairs(irc.raw_log) do
        info('LOG: ' .. raw_line, general)
    end
end

function M.GetUserCount(name)
    return chan_state(name).user_count
end

-- The lines of a channel (the active one when none is given):
-- { kind, nick, text, time, serial }.
function M.GetChatLines(name)
    return chan_state(name).lines
end

-- Goes up with every new line (the window scrolls down when it changes).
function M.GetSerial(name)
    return chan_state(name).serial
end

-- Any channel with messages not read.
function M.HasUnread()
    for _, chan in pairs(irc.chans) do
        if chan.unread then
            return true
        end
    end

    return false
end

-- How many messages are not read (all the channels and private chats), and
-- whether one of them is important: a private message or a line that names
-- you. For the badge in the bar of the Journal.
function M.GetUnreadCount()
    local total = 0

    for _, chan in pairs(irc.chans) do
        if chan.unread then
            total = total + math.max(1, chan.unread_count or 0)
        end
    end

    return total
end

function M.HasImportantUnread()
    for _, chan in pairs(irc.chans) do
        if chan.unread and (chan.private or chan.mention) then
            return true
        end
    end

    return false
end

-- The alert (sound and a line in the game chat) when a channel message names
-- you and the channel is not on screen.
function M.GetMentionAlert()
    return store.mention_alert
end

function M.SetMentionAlert(value)
    store.mention_alert = value == true

    M.Save()
end

function M.GetMentionCount()
    return irc.mention_count
end

-- Unread in the private chats / in the channels.
function M.CountUnreadPrivate()
    local n = 0

    for _, key in ipairs(irc.privs) do
        if irc.chans[key].unread then
            n = n + 1
        end
    end

    return n
end

function M.HasUnreadPrivate()
    for _, key in ipairs(irc.privs) do
        if irc.chans[key].unread then
            return true
        end
    end

    return false
end

-- The window of the private chats calls it while it shows a conversation.
function M.MarkReadPrivate()
    local chan = irc.pactive and irc.chans[irc.pactive]

    if chan ~= nil then
        clear_unread(chan)
    end
end

-- The window calls it while it is on screen: the active channel is read.
function M.MarkRead()
    clear_unread(chan_state(nil))
end

-- Does the text name you? (the name of the chat, the nick or the character;
-- whole words, any case).
function M.Mentions(text)
    text = tostring(text or ''):lower()

    local names = { irc.nick, M.ChatName() }

    if M.PlayerName ~= nil then
        names[#names + 1] = M.PlayerName()
    end

    for _, name in ipairs(names) do
        name = tostring(name or ''):lower()

        if #name >= 2 then
            local pattern = '%f[%w_]' .. name:gsub('%W', '%%%0') .. '%f[^%w_]'

            if text:find(pattern) then
                return true
            end
        end
    end

    return false
end

-- Sends a message to a channel (the active one when none is given). Returns
-- true, or false and the reason.
function M.Say(text, name)
    local chan = chan_state(name)

    if irc.state ~= 'online' then
        return false, 'offline'
    end

    if not chan.inside and not chan.private then
        return false, 'notjoined'
    end

    text = M.CleanText(text, M.MAX_TEXT)
    text = text:gsub('^%s+', ''):gsub('%s+$', '')

    if text == '' then
        return false, 'empty'
    end

    if #irc.queue >= M.MAX_QUEUE then
        return false, 'fast'
    end

    irc.queue[#irc.queue + 1] = {
        channel = chan.private and chan.nick or chan.name,
        text = text,
    }

    add_line(chan, 'me', irc.nick, text)

    return true
end

-- Muted nicks: their messages are not shown. Saved for all the characters.
function M.IsMuted(nick)
    return store.muted[tostring(nick):lower()] == true
end

function M.SetMuted(nick, value)
    nick = M.CleanText(nick, 40):gsub('%s', '')

    if nick == '' then
        return false
    end

    store.muted[nick:lower()] = value and true or nil

    M.Save()

    return true
end

function M.ClearMuted()
    store.muted = {}

    M.Save()
end

function M.GetMuted()
    local list = {}

    for nick in pairs(store.muted) do
        list[#list + 1] = nick
    end

    table.sort(list)

    return list
end

function M.GetAuto()
    return store.auto
end

-- The password of a nick registered in the network ('' = none). name: the
-- name of the character, or nil for the current one.
function M.GetPassword(name)
    local key = M.MakeNick(name or M.ChatName()):lower()

    return session_pass[key] or store.passwords[key] or ''
end

-- True when the password of that nick is saved in the file.
function M.IsPasswordSaved(name)
    local key = M.MakeNick(name or M.ChatName()):lower()

    return store.passwords[key] ~= nil
end

-- remember: also save it in the file (as plain text). An empty password
-- forgets it.
function M.SetPassword(name, password, remember)
    local key = M.MakeNick(name or M.ChatName()):lower()

    -- No spaces: a password with them could not go to NickServ.
    password = M.CleanText(password, 120):gsub('%s', '')

    local was_saved = store.passwords[key]

    session_pass[key] = password
    store.passwords[key] = (remember and password ~= '') and password or nil

    if store.passwords[key] ~= was_saved then
        M.Save()
    end
end

function M.SetAuto(value)
    store.auto = value == true

    M.Save()
end

-- True once the user has connected at least once (has read the notice).
function M.GetAccepted()
    return store.accepted
end

-- The file of the chat (shared by all the characters), like the notes.
candidate_dirs = function()
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

function M.CandidateDirs()
    return candidate_dirs()
end

function M.Load()
    store.loaded = true

    for _, entry in ipairs(candidate_dirs()) do
        local file = io.open(entry.dir .. M.FILE_NAME, 'rb')

        if file ~= nil then
            local data = file:read('*a')

            file:close()

            -- The file runs in an empty environment: it cannot call anything.
            local chunk = loadstring(data or '', 'shared_chat')

            if chunk ~= nil then
                setfenv(chunk, {})

                local ok, result = pcall(chunk)

                if ok and type(result) == 'table' then
                    store.auto = result.auto == true
                    store.accepted = result.accepted == true
                    store.pinned = result.pinned == true
                    store.pm_alert = result.pmalert ~= false
                    store.mention_alert = result.mentionalert ~= false
                    store.open = result.open == true
                    store.pwin = nil

                    local pw = result.pwindow

                    if type(pw) == 'table'
                        and type(pw.x) == 'number' and type(pw.y) == 'number'
                        and type(pw.w) == 'number' and type(pw.h) == 'number'
                        and pw.w >= 200 and pw.w <= 6000
                        and pw.h >= 150 and pw.h <= 6000
                        and pw.x > -6000 and pw.x < 12000
                        and pw.y > -6000 and pw.y < 12000 then

                        store.pwin = {
                            x = math.floor(pw.x), y = math.floor(pw.y),
                            w = math.floor(pw.w), h = math.floor(pw.h),
                        }
                    end
                    store.custom_name = ''

                    if type(result.name) == 'string' then
                        store.custom_name = clean_name(result.name)
                    end
                    store.win = nil

                    local win = result.window

                    if type(win) == 'table'
                        and type(win.x) == 'number' and type(win.y) == 'number'
                        and type(win.w) == 'number' and type(win.h) == 'number'
                        and win.w >= 200 and win.w <= 6000
                        and win.h >= 150 and win.h <= 6000
                        and win.x > -6000 and win.x < 12000
                        and win.y > -6000 and win.y < 12000 then

                        store.win = {
                            x = math.floor(win.x), y = math.floor(win.y),
                            w = math.floor(win.w), h = math.floor(win.h),
                        }
                    end

                    -- A pinned window that was open comes back.
                    if store.pinned and store.open then
                        window_open = true
                    end

                    store.passwords = {}

                    if type(result.passwords) == 'table' then
                        for nick, password in pairs(result.passwords) do
                            if type(nick) == 'string'
                                and type(password) == 'string'
                                and nick:match('^[%w_%-]+$')
                                and #nick <= 20
                                and password ~= ''
                                and #password <= 120
                                and not password:find('[%z\1-\32\127]') then

                                store.passwords[nick:lower()] = password
                            end
                        end
                    end

                    store.muted = {}

                    if type(result.muted) == 'table' then
                        for index = 1, math.min(#result.muted, 200) do
                            local nick = result.muted[index]

                            if type(nick) == 'string'
                                and nick:match('^[%w_%-%[%]\\`^{}|]+$')
                                and #nick <= 40 then

                                store.muted[nick:lower()] = true
                            end
                        end
                    end

                    return true
                end
            end
        end
    end

    return false
end

function M.Save()
    local parts = {
        'return {\n',
        '    auto = ', tostring(store.auto), ',\n',
        '    accepted = ', tostring(store.accepted), ',\n',
        '    pinned = ', tostring(store.pinned), ',\n',
        '    pmalert = ', tostring(store.pm_alert), ',\n',
        '    mentionalert = ', tostring(store.mention_alert), ',\n',
        store.pwin and string.format(
            '    pwindow = { x = %d, y = %d, w = %d, h = %d },\n',
            store.pwin.x, store.pwin.y, store.pwin.w, store.pwin.h
        ) or '',
        '    open = ', tostring(store.open), ',\n',
        '    name = ', string.format('%q', store.custom_name), ',\n',
        store.win and string.format(
            '    window = { x = %d, y = %d, w = %d, h = %d },\n',
            store.win.x, store.win.y, store.win.w, store.win.h
        ) or '',
        '    muted = {\n',
    }

    for _, nick in ipairs(M.GetMuted()) do
        if nick:match('^[%w_%-%[%]\\`^{}|]+$') then
            parts[#parts + 1] = string.format('        %q,\n', nick)
        end
    end

    parts[#parts + 1] = '    },\n    passwords = {\n'

    local nicks = {}

    for nick in pairs(store.passwords) do
        nicks[#nicks + 1] = nick
    end

    table.sort(nicks)

    for _, nick in ipairs(nicks) do
        parts[#parts + 1] = string.format(
            '        [%q] = %q,\n', nick, store.passwords[nick]
        )
    end

    parts[#parts + 1] = '    },\n}\n'

    local data = table.concat(parts)

    for _, entry in ipairs(candidate_dirs()) do
        if entry.create and ashita ~= nil and ashita.fs ~= nil then
            for _, name in ipairs({ 'create_dir', 'create_directory' }) do
                if ashita.fs[name] ~= nil then
                    pcall(ashita.fs[name], entry.dir)
                end
            end
        end

        local file = io.open(entry.dir .. M.FILE_NAME, 'wb')

        if file ~= nil then
            file:write(data)
            file:close()

            store.dirty = false

            return true
        end
    end

    return false
end

-- When the addon is unloaded.
function M.Stop()
    close_socket()

    if M.IsRunning() then
        test.state = 'done'
        test.result = 'failed'
    end

    M.Disconnect()

    if irc.hist_dirty_at ~= nil then
        save_history()
    end

    if store.dirty then
        M.Save()
    end
end

return M
