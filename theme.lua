-- Themes of the Journal windows: "Original" (the navy look the addon always
-- had) and "Legacy" (an aged book: parchment pages inside a leather cover).
--
-- The colors of ui.lua live in one table (`colors`). A theme is a set of
-- values copied INTO that table, so every function of ui.lua keeps reading
-- the same names and none of them has to change. Original is the snapshot of
-- the table as it was when ui.lua loaded, so it can always be put back.
--
-- Legacy also draws pictures behind the windows (assets/theme): the Journal
-- is an open book (a bar of leather with the toolbar on top, the list of
-- quests on the left page and the details on the right page) and the other
-- windows are a single page. They are cut in pieces so the corners and the
-- spine keep their shape at any window size. Without the pictures, Legacy
-- falls back to plain parchment colors.
--
-- The choice is shared by all the characters, so it is kept in a small file
-- of its own (like the general notes), not with the settings of the character.
--
-- The compass keeps the Original look: it floats over the game, where a book
-- would only be in the way. ui.lua tells it with Enter(true).

local M = {}

M.NAMES = { 'original', 'legacy' }
M.LABELS = { original = 'Original', legacy = 'Legacy' }

local FILE_NAME = 'shared_theme.lua'

-- The pictures (assets/theme). All are cut in pieces so the corners and the
-- spine keep their shape at any window size.
--
-- legacy_book.png (1450 x 948): the open book, 5 columns x 3 rows. The
-- columns are corner, page, spine, page, corner; the corners, the spine and
-- the top and bottom rows keep their size, the pages stretch. Under the book
-- (y 860 to 948) is a strip of leather for the bar of the toolbar.
--
-- legacy_page.png (880 x 860): one page with its frame, 3 x 3 pieces, for
-- the windows that are not the book.
local BOOK = {
    file = '/assets/theme/legacy_book.png',
    w = 1450, h = 948,
    cols = { 250, 380, 190, 380, 250 },
    rows = { 230, 400, 230 },
    bar = { y = 860, w = 1180, h = 88 },
}

local PAGE = {
    file = '/assets/theme/legacy_page.png',
    w = 880, h = 860,
    cols = { 250, 380, 250 },
    rows = { 230, 400, 230 },
}

-- The size of the book as it was photographed (without the cover margin of
-- the picture), and where the text may go on it, in those pixels: the
-- margin of the left and right pages, the gap of the spine, the top and
-- bottom margin.
local BOOK_NATURAL_W, BOOK_NATURAL_H = 1493, 969
local TEXT_L, TEXT_R, TEXT_GAP, TEXT_T, TEXT_B = 125, 125, 92, 105, 105
local DS_MIN, DS_MAX = 0.55, 1.6

-- A single page is shown at this share of the picture. The frame that the
-- text must keep clear of is 150 x 130 pixels in the picture.
local PAGE_SCALE = 0.32
local PAGE_FRAME_W, PAGE_FRAME_H = 150, 130
local PADDING_EXTRA = 4

local transparent = { 0, 0, 0, 0 }
local parchment = { 0.93, 0.79, 0.52, 1.00 }

-- The values that Legacy changes. Dark ink on paper: every color that was
-- light on navy has a darker version here. The colors of the nations in the
-- area buttons, the Missions and Quests buttons (they sit on the leather of
-- the bar) and the traffic lights of the compass are not here: they keep
-- their value.
local function legacy_palette(with_picture)
    return {
        window_bg = with_picture and transparent or parchment,
        popup_bg = { 0.90, 0.76, 0.50, 1.00 },
        child_bg = transparent,
        header_bg = { 0.35, 0.15, 0.10, 1.00 },
        header_active = { 0.42, 0.18, 0.12, 1.00 },
        border = { 0.35, 0.18, 0.10, 0.55 },

        text = { 0.20, 0.11, 0.05, 1.00 },
        text_dim = { 0.38, 0.26, 0.15, 1.00 },
        on_tint = { 0.97, 0.91, 0.76, 1.00 },
        gold = { 0.38, 0.09, 0.05, 1.00 },
        favorite = { 0.56, 0.33, 0.00, 1.00 },
        note = { 0.35, 0.20, 0.06, 1.00 },
        repeatable = { 0.10, 0.34, 0.58, 1.00 },

        leaf = { 0.18, 0.40, 0.12, 1.00 },
        leaf_2 = { 0.18, 0.38, 0.12, 1.00 },
        stem = { 0.15, 0.32, 0.10, 1.00 },
        camps_red = { 0.62, 0.08, 0.06, 1.00 },

        button = { 0.84, 0.67, 0.41, 1.00 },
        button_hover = { 0.90, 0.74, 0.47, 1.00 },
        button_active = { 0.76, 0.58, 0.33, 1.00 },

        settings_fill = { 0.42, 0.22, 0.12, 1.00 },
        settings_hover = { 0.52, 0.28, 0.15, 1.00 },
        settings_active = { 0.34, 0.17, 0.09, 1.00 },
        settings_border = { 0.78, 0.62, 0.30, 1.00 },
        settings_text = { 0.97, 0.91, 0.76, 1.00 },
        detail_pin = { 0.16, 0.30, 0.58, 1.00 },
        detail_favorite = { 0.62, 0.40, 0.04, 1.00 },
        detail_compass = { 0.10, 0.42, 0.32, 1.00 },

        active_border = { 0.10, 0.55, 0.20, 1.00 },
        active_status = { 0.12, 0.32, 0.58, 1.00 },
        completed = { 0.16, 0.38, 0.18, 1.00 },
        not_started = { 0.36, 0.30, 0.22, 1.00 },

        cross = { 0.40, 0.28, 0.18, 0.60 },
        cross_hover = { 0.20, 0.10, 0.05, 0.95 },

        frame = { 0.35, 0.18, 0.10, 0.35 },
        frame_inner = { 0.35, 0.18, 0.10, 0.25 },
        arrow = { 0.12, 0.32, 0.58, 1.00 },

        selector_dot = { 0.12, 0.32, 0.58, 1.00 },
        selector_dot_highlight = { 1.00, 0.95, 0.80, 0.80 },
        dot_not_started = { 0.12, 0.32, 0.58, 1.00 },
        dot_active = { 0.14, 0.45, 0.18, 1.00 },
        dot_completed = { 0.45, 0.40, 0.32, 1.00 },
        dot_untracked = { 0.12, 0.32, 0.58, 0.40 },
        selector_text = { 0.20, 0.11, 0.05, 1.00 },
        selector_text_selected = { 0.55, 0.10, 0.06, 1.00 },

        scrollbar_bg = { 0.55, 0.38, 0.20, 0.25 },
        scrollbar_grab = { 0.50, 0.30, 0.16, 0.90 },
        scrollbar_grab_hovered = { 0.58, 0.35, 0.18, 1.00 },
        scrollbar_grab_active = { 0.66, 0.40, 0.20, 1.00 },
    }
end

local state = {
    colors = nil,      -- the table of ui.lua
    original = nil,    -- snapshot of it
    selected = 'original',
    effective = nil,   -- the theme whose values are in `colors` now
    textures = {},     -- name -> texture, or false when it could not load
    book = nil,        -- { bar_h =, w =, h = } while the Journal window draws
    extra = {},        -- how many style vars each open window pushed
}

-- Files -----------------------------------------------------------------------

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

local function is_valid(name)
    for _, valid in ipairs(M.NAMES) do
        if valid == name then
            return true
        end
    end

    return false
end

-- Reads the saved choice. The file is only read, never run with access to
-- anything: it gets an empty environment.
local function read_choice()
    for _, entry in ipairs(candidate_dirs()) do
        local file = io.open(entry.dir .. FILE_NAME, 'rb')

        if file ~= nil then
            local data = file:read('*a')
            file:close()

            local chunk

            if loadstring ~= nil then
                chunk = loadstring(data, 'shared_theme')
            else
                chunk = load(data, 'shared_theme', 't', {})
            end

            if chunk ~= nil then
                if setfenv ~= nil then
                    setfenv(chunk, {})
                end

                local ok, result = pcall(chunk)

                if ok and type(result) == 'table'
                    and is_valid(result.name) then

                    return result.name
                end
            end

            return nil
        end
    end

    return nil
end

local function write_choice(name)
    local data = 'return { name = \'' .. name .. '\' }\n'

    for _, entry in ipairs(candidate_dirs()) do
        if entry.create then
            make_dir(entry.dir)
        end

        local file = io.open(entry.dir .. FILE_NAME, 'wb')

        if file ~= nil then
            file:write(data)
            file:close()

            return true
        end
    end

    return false
end

-- The pictures ----------------------------------------------------------------

-- The texture of a picture description (BOOK or PAGE), or nil. Each is looked
-- for once; a failure is remembered.
local function get_texture(desc)
    local cached = state.textures[desc.file]

    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    state.textures[desc.file] = false

    local ok, texture = pcall(function()
        local ffi = require('ffi')
        local d3d = require('d3d8')
        local path = tostring(addon and addon.path or '') .. desc.file

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
        and texture.width == desc.w and texture.height == desc.h then

        state.textures[desc.file] = texture
        return texture
    end

    return nil
end

-- VanaChat artwork is kept separate from the shared window themes.

local CHAT_SKIN = { file = '/assets/theme/vanachat_controls.png', w = 1774, h = 887 }
local CHAT_HEADER = { file = '/assets/theme/vanachat_header.png', w = 1672, h = 941 }
local CHAT_CELLS = {
    button = { 7, 30, 436, 412 },
    accent = { 451, 30, 879, 412 },
    hover = { 893, 30, 1325, 412 },
    pressed = { 1337, 30, 1765, 412 },
    parchment = { 3, 447, 439, 883 },
    leather = { 448, 447, 883, 883 },
    input = { 893, 580, 1324, 751 },
    frame = { 1335, 450, 1766, 880 },
}

function M.HasChatSkin()
    return get_texture(CHAT_SKIN) ~= nil and get_texture(CHAT_HEADER) ~= nil
end

-- Texture-only artwork. Text, hit testing and keyboard focus remain live.
function M.DrawChatArt(imgui, draw, art, x, y, w, h)
    if w <= 0 or h <= 0 then return end
    local header = art == 'title'
    local desc = header and CHAT_HEADER or CHAT_SKIN
    local texture = get_texture(desc)
    if texture == nil then return end
    local tint = imgui.GetColorU32({ 1, 1, 1, 1 })
    local function piece(u0, v0, u1, v1, x0, y0, x1, y1)
        draw:AddImage(texture.id, { x0, y0 }, { x1, y1 },
            { (u0 + 0.5) / desc.w, (v0 + 0.5) / desc.h },
            { (u1 - 0.5) / desc.w, (v1 - 0.5) / desc.h }, tint)
    end
    if header then
        piece(84, 30, 1376, 131, x, y, x + w, y + h)
        return
    end
    local cell = CHAT_CELLS[art]
    if cell == nil then return end
    local u, v = cell[1], cell[2]
    local cw, ch = cell[3] - u, cell[4] - v
    if art == 'parchment' or art == 'leather' then
        piece(u, v, u + cw, v + ch, x, y, x + w, y + h)
        return
    end
    -- Nine-slice scaling preserves corners when the window is resized.
    local source = math.min(cw, ch) * 0.17
    local edge = math.min(art == 'frame' and 22 or 12, w / 3, h / 3)
    local us, vs = { u, u + source, u + cw - source, u + cw },
        { v, v + source, v + ch - source, v + ch }
    local xs, ys = { x, x + edge, x + w - edge, x + w },
        { y, y + edge, y + h - edge, y + h }
    for row = 1, 3 do
        for col = 1, 3 do
            if art == 'frame' and row == 2 and col == 2 then
                -- One continuous paper surface avoids seams from the
                -- vignette in the source texture. A translucent ivory wash
                -- keeps the enlarged grain behind the text subtle.
                local paper = CHAT_CELLS.parchment
                piece(paper[1], paper[2], paper[3], paper[4],
                    xs[col], ys[row], xs[col + 1], ys[row + 1])
                draw:AddRectFilled(
                    { xs[col], ys[row] }, { xs[col + 1], ys[row + 1] },
                    imgui.GetColorU32({ 0.95, 0.83, 0.60, 0.48 }))
            else
                piece(us[col], vs[row], us[col + 1], vs[row + 1],
                    xs[col], ys[row], xs[col + 1], ys[row + 1])
            end
        end
    end
end

-- Palettes -------------------------------------------------------------------

local function copy_into(target, source)
    for key, value in pairs(source) do
        if type(value) == 'table' then
            local slot = target[key]

            if type(slot) ~= 'table' then
                slot = {}
                target[key] = slot
            end

            for i = 1, 4 do
                slot[i] = value[i]
            end
        else
            target[key] = value
        end
    end
end

local function snapshot(source)
    local copy = {}

    for key, value in pairs(source) do
        if type(value) == 'table' then
            copy[key] = { value[1], value[2], value[3], value[4] }
        else
            copy[key] = value
        end
    end

    return copy
end

-- Puts the values of a theme in the table of ui.lua (in place: the tables
-- that ui.lua already holds keep being the same tables).
-- Colors of the names inside the text of the sheets (NPCs, monsters, items,
-- the tick and the counter): richtext.lua gives them light colors for a dark
-- window, and on the parchment they would not be seen. Legacy gets dark
-- versions, only while a window that takes the theme is being drawn.
local RICH_LEGACY = {
    npc = { 0.20, 0.40, 0.10, 1.0 },
    monster = { 0.62, 0.12, 0.10, 1.0 },
    item = { 0.45, 0.26, 0.02, 1.0 },
    tick = { 0.12, 0.42, 0.16, 1.0 },
    count = { 0.20, 0.40, 0.26, 1.0 },
}

local function put_rich(name)
    if state.rich == nil then
        return
    end

    if name == 'legacy' then
        copy_into(state.rich, RICH_LEGACY)
    else
        copy_into(state.rich, state.rich_original)
    end
end

local function put(name)
    if state.colors == nil or state.effective == name then
        return
    end

    if name == 'legacy' then
        copy_into(state.colors, legacy_palette(get_texture(PAGE) ~= nil))
    else
        copy_into(state.colors, state.original)
    end

    state.effective = name
end

-- Public ----------------------------------------------------------------------

-- Called once by ui.lua, right after `colors` is built.
function M.Bind(colors, rich_colors)
    state.colors = colors

    if type(rich_colors) == 'table' then
        state.rich = rich_colors
        state.rich_original = snapshot(rich_colors)
    end

    state.original = snapshot(colors)
    state.effective = 'original'

    local saved = read_choice()

    if saved ~= nil then
        state.selected = saved
    end
end

function M.Get()
    return state.selected
end

function M.Set(name)
    if not is_valid(name) or name == state.selected then
        return state.selected
    end

    state.selected = name
    write_choice(name)

    return state.selected
end

-- At the start of a window. `keep_original` is true for the windows that
-- must not take the theme (the compass).
function M.Enter(keep_original, chat_legacy)
    put(chat_legacy and 'legacy' or (keep_original and 'original' or state.selected))
    put_rich(keep_original and 'original' or state.selected)
end

-- At the end of a window: back to the chosen theme.
function M.Leave()
    state.book = nil
    put(state.selected)
    put_rich('original')
end

-- True when Legacy is on and the picture of a page is there.
function M.HasPicture()
    return state.effective == 'legacy' and get_texture(PAGE) ~= nil
end

-- True when the book of the Journal can be drawn.
function M.HasBook()
    return M.HasPicture() and get_texture(BOOK) ~= nil
end

-- The size of the pictures on the screen: how much a pixel of the book
-- picture is worth for a window of width and height (bar of leather included).
local function book_scale(width, bar_h, height)
    local ds = math.min(
        width / BOOK_NATURAL_W,
        (height - bar_h) / BOOK_NATURAL_H
    )

    return math.max(DS_MIN, math.min(DS_MAX, ds))
end

-- Called by ui.lua BEFORE it pushes the theme of the Journal window, with the
-- last known size of the window. The padding of the window and the book that
-- is drawn depend on it. Forgotten at the end of the window (Leave).
function M.BeginBook(bar_h, width, height)
    put(state.selected)

    if M.HasBook() and width ~= nil and height ~= nil
        and width > 0 and height > bar_h then

        state.book = { bar_h = bar_h, w = width, h = height }
    else
        state.book = nil
    end
end

-- Where things go in the window of the book, in coordinates of the window:
-- the bar of the toolbar, and the left and right pages (their x, width and
-- the gap between them, the top of both, and the bottom margin). Nil when the
-- Journal is not drawn as a book.
function M.BookLayout(width, height)
    local book = state.book

    if book == nil then
        return nil
    end

    local bar_h = book.bar_h
    local ds = book_scale(width, bar_h, height)
    local inset = 6

    local left_x = TEXT_L * ds + inset
    local left_right = width * 0.5 - TEXT_GAP * 0.5 * ds - inset
    local right_x = width * 0.5 + TEXT_GAP * 0.5 * ds + inset

    return {
        ds = ds,
        bar_h = bar_h,
        bar_pad = 22,
        left_x = left_x,
        page_w = left_right - left_x,
        gap = right_x - left_right,
        page_y = bar_h + TEXT_T * ds,
        bottom = TEXT_B * ds,
    }
end

-- WindowPadding of the windows. The book keeps the margin of its bottom edge
-- (ui.lua puts the toolbar and the pages with the cursor); a single page keeps
-- clear of its frame.
function M.WindowPadding()
    local book = state.book

    if book ~= nil then
        local ds = book_scale(book.w, book.bar_h, book.h)

        return { 22, math.floor(TEXT_B * ds) }
    end

    if M.HasPicture() then
        return {
            PAGE_FRAME_W * PAGE_SCALE + PADDING_EXTRA,
            PAGE_FRAME_H * PAGE_SCALE + PADDING_EXTRA,
        }
    end

    return { 12, 12 }
end

-- The style of the controls in Legacy: rounded, with a thin outline, and no
-- border on the windows (the frame of the book is the border). Called by
-- push_theme after its own style; PopExtra undoes what this pushed.
function M.PushExtra(imgui)
    local count = 0

    if state.effective == 'legacy' then
        local list = {
            { ImGuiStyleVar_WindowBorderSize, 0 },
            { ImGuiStyleVar_ChildBorderSize, 0 },
            { ImGuiStyleVar_FrameBorderSize, 1 },
            { ImGuiStyleVar_FrameRounding, 4 },
        }

        for _, entry in ipairs(list) do
            if type(entry[1]) == 'number' then
                imgui.PushStyleVar(entry[1], entry[2])
                count = count + 1
            end
        end
    end

    state.extra[#state.extra + 1] = count
end

function M.PopExtra(imgui)
    local count = table.remove(state.extra) or 0

    if count > 0 then
        imgui.PopStyleVar(count)
    end
end

-- The look of a row of a list (Legacy only): a faint rule of ink under it
-- and, when it is the selected one, a burgundy wash with a bar on its left.
-- Returns true when it drew something.
function M.DrawRow(imgui, draw, x0, y0, x1, y1, selected)
    if draw == nil or not M.HasPicture() then
        return false
    end

    draw:AddLine(
        { x0 + 2, y1 - 0.5 },
        { x1 - 2, y1 - 0.5 },
        imgui.GetColorU32({ 0.55, 0.38, 0.18, 0.45 }),
        1
    )

    if selected then
        draw:AddRectFilled(
            { x0 + 2, y0 + 1 },
            { x1 - 2, y1 - 1 },
            imgui.GetColorU32({ 0.54, 0.12, 0.07, 0.16 }),
            2
        )

        draw:AddRectFilled(
            { x0 + 2, y0 + 1 },
            { x0 + 5, y1 - 1 },
            imgui.GetColorU32({ 0.54, 0.12, 0.07, 0.95 })
        )
    end

    return true
end

-- Draws pieces of a picture: the columns and rows of the picture (their
-- sizes in pixels) go to the destination edges dx and dy.
local function draw_pieces(imgui, draw, texture, desc, dx, dy, tint)

    for row = 1, #desc.rows do
        local v0 = 0

        for r = 1, row - 1 do
            v0 = v0 + desc.rows[r]
        end

        local v1 = v0 + desc.rows[row]
        local u0 = 0

        for col = 1, #desc.cols do
            local u1 = u0 + desc.cols[col]

            -- A half pixel inside at the seams so the filter does not mix
            -- two pieces.
            local a = u0 + (col > 1 and 0.5 or 0)
            local b = u1 - (col < #desc.cols and 0.5 or 0)
            local c = v0 + (row > 1 and 0.5 or 0)
            local d = v1 - (row < #desc.rows and 0.5 or 0)

            draw:AddImage(
                texture.id,
                { dx[col], dy[row] },
                { dx[col + 1], dy[row + 1] },
                { a / desc.w, c / desc.h },
                { b / desc.w, d / desc.h },
                tint
            )

            u0 = u1
        end
    end
end

-- Draws the background of a window of x, y, width, height. Returns true when
-- it did, so ui.lua skips its own panel.
function M.DrawPanel(imgui, draw, x, y, width, height, opacity)
    if draw == nil or not M.HasPicture() then
        return false
    end

    local tint = imgui.GetColorU32({
        1, 1, 1, math.max(0, math.min(1, opacity or 1)),
    })

    local book = state.book

    if book ~= nil then
        local texture = get_texture(BOOK)

        if texture ~= nil then
            local bar_h = book.bar_h
            local ds = book_scale(width, bar_h, height)
            local cols, rows = BOOK.cols, BOOK.rows

            -- The bar of leather, with a line of brass under it (the bar is
            -- hidden when bar_h is 0).
            if bar_h > 0 then
                draw:AddImage(
                    texture.id,
                    { x, y },
                    { x + width, y + bar_h },
                    { 0.5 / BOOK.w, (BOOK.bar.y + 0.5) / BOOK.h },
                    { (BOOK.bar.w - 0.5) / BOOK.w, (BOOK.bar.y + BOOK.bar.h - 0.5) / BOOK.h },
                    tint
                )

                draw:AddRectFilled(
                    { x, y + bar_h - 4 },
                    { x + width, y + bar_h },
                    imgui.GetColorU32({ 0.78, 0.62, 0.28, math.max(0, math.min(1, opacity or 1)) })
                )

                draw:AddRectFilled(
                    { x, y + bar_h - 1 },
                    { x + width, y + bar_h },
                    imgui.GetColorU32({ 0.35, 0.22, 0.08, math.max(0, math.min(1, opacity or 1)) })
                )
            end

            -- The book: corners, spine and the top and bottom rows keep their
            -- size; the pages stretch.
            local a = cols[1] * ds
            local c = cols[3] * ds
            local e = cols[5] * ds
            local b = (width - a - c - e) * 0.5

            local dx = {
                x, x + a, x + a + b, x + a + b + c, x + a + b + c + b, x + width,
            }

            local top = rows[1] * ds
            local bottom = rows[3] * ds
            local dy = {
                y + bar_h,
                y + bar_h + top,
                y + height - bottom,
                y + height,
            }

            draw_pieces(imgui, draw, texture, BOOK, dx, dy, tint)

            return true
        end
    end

    local texture = get_texture(PAGE)

    if texture == nil then
        return false
    end

    local fx = PAGE.cols[1] * PAGE_SCALE
    local fy = PAGE.rows[1] * PAGE_SCALE

    -- A small window: the frame shrinks so the corners never overlap.
    fx = math.min(fx, width * 0.5)
    fy = math.min(fy, height * 0.5)

    draw_pieces(
        imgui,
        draw,
        texture,
        PAGE,
        { x, x + fx, x + width - fx, x + width },
        { y, y + fy, y + height - fy, y + height },
        tint
    )

    return true
end

-- For the tests.
function M.ResetForTests()
    state.colors = nil
    state.rich = nil
    state.rich_original = nil
    state.original = nil
    state.selected = 'original'
    state.effective = nil
    state.textures = {}
    state.book = nil
    state.extra = {}
end

return M
