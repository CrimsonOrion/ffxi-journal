local M = {}

require('common')

local imgui = require('imgui')
local ffi = require('ffi')
local d3d = require('d3d8')
local logic = require('logic')
local richtext = require('richtext')
local i18n = require('i18n')
local tx = i18n.t
local icons = require('icons')
local theme = require('theme')

-- Ashita 4.1/4.3 ImGui compatibility.
--
-- 4.1: third argument is the legacy boolean 'border'.
-- 4.3: third argument is ImGuiChildFlags.
--
-- Deliberately keep child_border as a boolean. This means:
--   4.1 -> true is passed unchanged.
--   4.3 -> true is converted to ImGuiChildFlags_Borders.
--
-- This also avoids passing a raw numeric ImGuiChildFlags value through the
-- older binding, which is the important part for cross-version compatibility.
local imgui_BeginChild_original = imgui.BeginChild
local imgui_ashita_43 = (ImGuiChildFlags_Borders ~= nil)

imgui.BeginChild = function(
    id,
    size,
    cflags,
    wflags
)
    if imgui_ashita_43 then
        if cflags == true then
            cflags = ImGuiChildFlags_Borders
        elseif cflags == false or cflags == nil then
            cflags = ImGuiChildFlags_None
        end
    else
        -- Ashita 4.1 expects the old boolean border argument.
        -- If a numeric flag ever reaches this wrapper, normalize it.
        if type(cflags) == 'number' then
            cflags = cflags ~= 0
        elseif cflags == nil then
            cflags = false
        end
    end

    if wflags == nil then
        return imgui_BeginChild_original(
            id,
            size,
            cflags
        )
    end

    return imgui_BeginChild_original(
        id,
        size,
        cflags,
        wflags
    )
end

local d3d8dev = d3d.get_device()
local controller = logic

local function get_styles()
    if controller ~= nil and controller.GetStyles ~= nil then
        return controller.GetStyles()
    end

    return nil
end

-- Keep this as the legacy boolean. The compatibility wrapper above converts
-- it to ImGuiChildFlags_Borders only on Ashita 4.3.
local child_border = true

function M.SetController(value)
    controller = value or logic
end

local journal_font

-- Fira Sans (Regular, Bold, Italic) for the step text. The titles and
-- buttons keep the original font.
local text_font
local text_bold_font
local text_italic_font

local journal_font_size = 30

-- Fira Sans looks larger than the small caps of the original font at the
-- same size, so the step text is set a little smaller.
local step_font_size = 26
local step_text_ratio = step_font_size / journal_font_size

local ui_button_height = 42
local ui_bar_height = 54

-- The size of the text of the Journal can be changed in the settings. The
-- sizes above are the ones at 100%; apply_text_scale gives the real ones to
-- the font, the buttons and the bars, so the text always fits in them.
local text_scale = 1.0

-- Height of the buttons of the settings, guide and camps windows. The text
-- is 30 high and the style keeps 6 free above and below it, so the buttons
-- need 42 or the text is cut and not centered.
local SETTINGS_BUTTON_HEIGHT = 42

-- A size in pixels for the current text scale.
local function scaled(value)
    return math.floor(value * text_scale + 0.5)
end

local function apply_text_scale()
    local wanted = 1.0

    if controller and controller.GetTextScale then
        wanted = controller.GetTextScale()
    end

    if wanted == text_scale then
        return
    end

    text_scale = wanted
    journal_font_size = scaled(30)
    step_font_size = scaled(26)
    step_text_ratio = step_font_size / journal_font_size
    ui_button_height = scaled(42)
    ui_bar_height = scaled(54)
    SETTINGS_BUTTON_HEIGHT = scaled(42)
end

-- Windows follow the size of the text. Each window remembers its size and
-- the text scale it had; when the scale changes, the window grows or shrinks
-- by the same factor. before() goes just ahead of Begin, after() inside it.
-- The Fame window and the icon of the Fame Checker NPCs. A table, to keep the
-- locals of this file under the limit.
local fame_ui = { was_open = false, restore = false }

-- Draws the Fame Checker icon at the cursor, as tall as a line of text, and
-- leaves the cursor ready for SameLine. Returns the width it took (0 when
-- there is no icon, and then nothing was drawn).
function fame_ui.inline_icon(kind)
    local icon = controller
        and controller.worldmark
        and controller.worldmark.GetIcon
        and controller.worldmark.GetIcon(kind or 'fame')

    if icon == nil or not imgui.Dummy or not imgui.SameLine then
        return 0
    end

    local icon_height = imgui.GetTextLineHeight()
    local icon_width = icon_height * icon.width / icon.height

    if not pcall(imgui.Dummy, { icon_width, icon_height }) then
        return 0
    end

    pcall(function()
        local min_x, min_y = imgui.GetItemRectMin()
        local max_x, max_y = imgui.GetItemRectMax()

        imgui.GetWindowDrawList():AddImage(
            icon.id,
            { min_x, min_y },
            { max_x, max_y },
            { 0, 0 },
            { 1, 1 },
            imgui.GetColorU32({ 1, 1, 1, 1 })
        )
    end)

    imgui.SameLine(0, 4)

    return icon_width + 4
end

local scalex = { last = {} }

function scalex.before(key)
    local last = scalex.last[key]

    if last and last.scale ~= text_scale and last.scale > 0 then
        local factor = text_scale / last.scale

        imgui.SetNextWindowSize({
            math.floor(last.w * factor + 0.5),
            math.floor(last.h * factor + 0.5),
        })
    end
end

function scalex.after(key)
    local w, h = imgui.GetWindowSize()
    local last = scalex.last[key]

    if last == nil then
        last = {}
        scalex.last[key] = last
    end

    last.w = w
    last.h = h
    last.scale = text_scale
end

local journal_restore_window = true
local journal_last_reset_count = nil
local journal_mini_restore_window = true

local journal_mode_popup_open = false
local journal_area_popup_open = false

-- Search box of the Journal. The buffer is the table that ImGui edits;
-- the flag is true while the box has the keyboard, so the arrow keys and
-- Enter are left to the text instead of moving the lists.
local journal_search_buffer = { '' }
local journal_search_active = false

-- Sheet window: the whole record of the mission or quest clicked in the
-- list. It follows the selection while it is open.
local sheet_open = false
local sheet_kind = 'Mission'
local sheet_restore = false

-- Window with the progress of every area.
local progress_open = false
local progress_restore = false

-- Window "Active Now": the active quests and missions, and the favorites.
-- Whether it is open is kept by the controller, so a command can open it.
-- The rows are rebuilt about once a second.
local active_was_open = false
local active_restore = false
local active_rows = {}
local favorite_rows = {}
local active_rows_time = -1000
local active_notice = nil

-- The note of the quest or mission selected in the Journal: the text box,
-- the item it holds, and whether it has the keyboard.
local note_buffer = { '' }
local note_key = nil
local note_input_active = false

local function open_sheet(kind)
    sheet_kind = kind

    if not sheet_open then
        sheet_open = true
        sheet_restore = true
    end
end

-- The sheet opened without the Journal (from the compass or the Tracker),
-- and the size the player gave it.
local sheetx = { standalone = false, w = nil, h = nil }

-- The window of the general notes (notes.lua keeps the list): the box that
-- is being edited, the delete that waits for a second click, and the width
-- of the button in the toolbar.
local notesx = {
    buffer = { '' }, tbuf = { '' }, cbuf = { '' },
    key = nil, ckey = nil, confirm = nil,
    was_open = false, btn_w = 0, full = 0,
}

-- The icon (a texture of worldmark.lua) a quest row has instead of the dot:
-- in progress, not started (available or locked), or completed (the
-- repeatable ones have their own). nil when there is none (missions, the
-- quests that cannot be tracked, no PNG files).
sheetx.kinds = {}
sheetx.kinds_time = -1000

sheetx.row_icon = function(row, status, mission)
    if mission then
        -- Missions: completed, not available yet (see IsMissionLocked), or
        -- in progress / available.
        if row == nil or row.id == nil or controller == nil then
            return nil
        end

        local marks = controller.worldmark

        if marks == nil or marks.GetIcon == nil then
            return nil
        end

        if status == 'completed' then
            return marks.GetIcon('mission_completed')
        end

        if status == 'not_started' and row.area ~= nil
            and controller.IsMissionLocked
            and controller.IsMissionLocked(row.area, row.id) then

            return marks.GetIcon('mission_locked')
        end

        -- In progress: its own icon (the one of available when there is
        -- no file). Not started and available: the icon of available. The
        -- ones the game cannot track keep their dot.
        if status == 'active' then
            return marks.GetIcon('mission_progress')
                or marks.GetIcon('mission_available')
        end

        if status == 'not_started' then
            return marks.GetIcon('mission_available')
        end

        return nil
    end

    local repeated = status == 'completed' and row ~= nil
        and row.repeatable == true

    if row == nil or row.id == nil
        or (status ~= 'active' and status ~= 'not_started'
            and status ~= 'completed') then

        return nil
    end

    local marks = controller and controller.worldmark

    if marks == nil or marks.GetIcon == nil then
        return nil
    end

    local kind = 'progress'

    if status == 'completed' then
        -- Done; the repeatable ones can be done again.
        kind = repeated and 'repeatable' or 'completed'
    elseif status ~= 'active' then
        -- Looked up at most once a second for each quest.
        local now = os.clock()

        if now - sheetx.kinds_time > 1 then
            sheetx.kinds = {}
            sheetx.kinds_time = now
        end

        kind = sheetx.kinds[row.id]

        if kind == nil then
            kind = controller.GetQuestIconKind
                and controller.GetQuestIconKind(row.id) or nil
            kind = kind == 'locked' and 'locked' or 'available'
            sheetx.kinds[row.id] = kind
        end
    end

    return marks.GetIcon(kind)
end

logic.sheet_hook = function()
    local journal = logic.GetJournalWindowState and logic.GetJournalWindowState()

    if not sheet_open then
        sheetx.standalone = not (journal and journal.visible)
    end

    open_sheet('Quest')
end

local function toggle_progress()
    progress_open = not progress_open

    if progress_open then
        progress_restore = true
    end
end
local journal_category_popup_open = false

local journal_help_window = false
local journal_help_width = 500
local journal_help_height = 360
local journal_help_restore = true

local controller_repeat_button
local controller_repeat_time = 0
local controller_repeat_delay = 0.40
local controller_repeat_interval = 0.12

local keyboard_repeat_key
local keyboard_repeat_time = 0
local keyboard_repeat_delay = 0.40
local keyboard_repeat_interval = 0.12

local list_last_selection = {}

local pGameMenu = 0
local pEventSystem = 0
local pInterfaceHidden = 0
local game_visibility_initialized = false
local game_ui_visible = false
local visibility_cache_time = 0
local visibility_cache_interval = 0.05

local journal_cover_files = {
    sandoria = 'Sandorian_Iconv2.png',
    bastok = 'Bastok_Iconv2.png',
    windurst = 'Windurst_Iconv2.png',
    zilart = 'Zilart_Icon.png',
    cop = 'Chainsofpromathia_Icon.png',
    toau = 'AhtUrghan_Icon.png',
    wotg = 'Wingsofthegoddess_Icon.png',
    acp = 'CrystallineProphecy_Icon.png',
    mkd = 'Mooglekupodetat_Icon.png',
    asa = 'ShantottoAscension_Icon.png',
    abyssea = 'Abyssea_Icon.png',
    adoulin = 'Seekersofadoulin_Icon.png',
    rov = 'Rhapsodies_Icon.png',
    tvr = 'VoraciousResurgence_Icon.png',
    assault = 'Assault_Icon.PNG',
    campaign = 'Campaign_Iconv2.png',
}

local journal_cover_cache = {}

-- Logos shown above the first mission of an area in the list (optional
-- files in assets/logos).
local journal_logo_files = {
    cop = 'Chainsofpromathia_Logo.png',
    zilart = 'Riseofthezilart_Logo.png',
    windurst = 'Windurst_Logo.png',
    bastok = 'Bastok_Logo.png',
    sandoria = 'Sandoria_Logo.png',
    jeuno = 'Jeuno_Logo.png',
    toau = 'Treasuresofahturhgan_Logo.png',
    wotg = 'Wingsofthegoddess_Logo.png',
    adoulin = 'Seekersofadoulin_Logo.png',
    rov = 'Rhapsodiesofvanadiel_Logo.png',
    -- Local patch: banners for the quest categories that had none. The
    -- expansion logos stand in for Whitegate and the Crystal War.
    whitegate = 'Treasuresofahturhgan_Logo.png',
    crystal_war = 'Wingsofthegoddess_Logo.png',
}
local journal_logo_cache = {}

-- Local patch: quest categories with no picture get a drawn title banner.
-- A PNG added to journal_logo_files for the same key replaces it.
local journal_text_banners = {
    outlands = 'Outlands',
    other = 'Other Areas',
}

-- How many times bigger than the usual width a logo is drawn. The banners
-- of the nations are twice as big.
local journal_logo_scale = {
    windurst = 2,
    bastok = 2,
    sandoria = 2,
    jeuno = 2,
}
local d3d_image_info = ffi.new('D3DXIMAGE_INFO')
local journal_mini_texture

local colors = {
    -- Navy palette of the original look, with one blue accent for the
    -- selection and the titles in plain white.
    window_bg = { 0.123, 0.136, 0.247, 0.88 },
    -- Same value as window_bg; a theme can give popups their own color.
    popup_bg = { 0.123, 0.136, 0.247, 0.88 },
    child_bg = { 0.111, 0.123, 0.225, 0.85 },
    header_bg = { 0.080, 0.087, 0.173, 1.00 },
    header_active = { 0.094, 0.102, 0.196, 1.00 },
    border = { 0.55, 0.62, 0.80, 0.16 },
    text = { 0.902, 0.910, 0.925, 1.00 },
    text_dim = { 0.640, 0.660, 0.740, 1.00 },
    -- Text on the colored buttons of the nations (a theme can change it).
    on_tint = { 0.902, 0.910, 0.925, 1.00 },
    -- The infinity sign of the repeatable quests.
    repeatable = { 0.62, 0.85, 1.00, 1.00 },
    -- The green sprout of the guide for new adventurers.
    leaf = { 0.46, 0.82, 0.38, 1.00 },
    camps_red = { 0.90, 0.16, 0.14, 1.00 },
    leaf_2 = { 0.36, 0.72, 0.30, 1.00 },
    stem = { 0.28, 0.58, 0.26, 1.00 },
    -- Title color. The key keeps its old name; it is plain white now.
    gold = { 1.00, 1.00, 1.00, 1.00 },
    -- The star of the favorites and the text of the notes.
    favorite = { 1.00, 0.82, 0.30, 1.00 },
    note = { 0.96, 0.86, 0.58, 1.00 },
    button = { 0.098, 0.109, 0.200, 1.00 },
    button_hover = { 0.128, 0.140, 0.247, 1.00 },
    button_active = { 0.149, 0.162, 0.272, 1.00 },
    -- The Settings button: gray with a bright border.
    settings_fill = { 0.400, 0.412, 0.447, 1.00 },
    settings_hover = { 0.490, 0.502, 0.537, 1.00 },
    settings_active = { 0.318, 0.329, 0.361, 1.00 },
    settings_border = { 0.780, 0.792, 0.827, 1.00 },
    settings_text = { 0.961, 0.965, 0.976, 1.00 },
    -- Borders of the three buttons under the details.
    detail_pin = { 0.40, 0.62, 0.95, 1.00 },
    detail_favorite = { 0.95, 0.75, 0.25, 1.00 },
    detail_compass = { 0.35, 0.78, 0.60, 1.00 },
    -- The Missions and Quests buttons: the blue of the missions and the
    -- yellow of the quests (the ones of the alerts).
    mode_mission = { 0.55, 0.75, 1.00, 1.00 },
    mode_quest = { 1.00, 0.85, 0.40, 1.00 },
    -- The pulsing border of the Active Now button.
    active_border = { 0.30, 0.90, 0.40, 1.00 },
    active_status = { 0.490, 0.698, 0.918, 1.00 },
    completed = { 0.498, 0.749, 0.541, 1.00 },
    not_started = { 0.588, 0.639, 0.710, 1.00 },
    -- The small x that removes an NPC from the compass.
    cross = { 0.50, 0.52, 0.58, 0.55 },
    cross_hover = { 0.82, 0.84, 0.90, 0.95 },

    panel = { 20 / 255, 17 / 255, 48 / 255, 1.00 },
    stripe_dark = { 16 / 255, 12 / 255, 44 / 255, 1.00 },
    stripe = { 24 / 255, 22 / 255, 52 / 255, 1.00 },

    frame = { 0.55, 0.62, 0.80, 0.20 },
    frame_inner = { 0.35, 0.40, 0.55, 0.16 },
    arrow = { 0.490, 0.698, 0.918, 1.00 },

    selector_dot = { 0.490, 0.698, 0.918, 1.00 },
    selector_dot_highlight = { 0.85, 0.95, 1.00, 0.80 },

    -- Dot next to each mission or quest in the list.
    dot_not_started = { 0.490, 0.698, 0.918, 1.00 },
    dot_active = { 0.400, 0.780, 0.500, 1.00 },
    dot_completed = { 0.580, 0.610, 0.680, 1.00 },
    dot_untracked = { 0.490, 0.698, 0.918, 0.40 },
    selector_text = { 0.902, 0.910, 0.925, 1.00 },
    selector_text_selected = { 0.490, 0.698, 0.918, 1.00 },

    scrollbar_bg = { 0.080, 0.087, 0.173, 0.60 },
    scrollbar_grab = { 0.231, 0.259, 0.376, 1.00 },
    scrollbar_grab_hovered = { 0.300, 0.330, 0.460, 1.00 },
    scrollbar_grab_active = { 0.360, 0.400, 0.550, 1.00 },

    panel_alpha_top = 0.55,
    panel_alpha_mid = 0.88,
    panel_alpha_bottom = 1.00,
}

-- The themes (theme.lua) change the values of this table in place.
theme.Bind(colors, richtext.COLORS)

local transparent = { 0, 0, 0, 0 }

-- Button colors of the three nations in the area and category selectors.
-- The keys are the mission areas and the quest categories, which use the
-- same names. Every other area keeps the standard button color.
local area_colors = {
    sandoria = {
        fill = { 0.498, 0.165, 0.180, 1.00 },
        border = { 0.627, 0.267, 0.286, 1.00 },
    },
    bastok = {
        fill = { 0.184, 0.361, 0.620, 1.00 },
        border = { 0.290, 0.471, 0.733, 1.00 },
    },
    windurst = {
        fill = { 0.184, 0.420, 0.271, 1.00 },
        border = { 0.243, 0.541, 0.357, 1.00 },
    },
}

local function lighten(color, amount)
    return {
        math.min(color[1] + amount, 1),
        math.min(color[2] + amount, 1),
        math.min(color[3] + amount, 1),
        color[4] or 1,
    }
end

local theme_colors = {
    { ImGuiCol_WindowBg, colors.window_bg },
    { ImGuiCol_ChildBg, colors.child_bg },
    { ImGuiCol_PopupBg, colors.popup_bg },
    { ImGuiCol_Border, colors.border },
    { ImGuiCol_FrameBg, colors.button },
    { ImGuiCol_FrameBgHovered, colors.button_hover },
    { ImGuiCol_FrameBgActive, colors.button_active },
    { ImGuiCol_Button, colors.button },
    { ImGuiCol_ButtonHovered, colors.button_hover },
    { ImGuiCol_ButtonActive, colors.button_active },
    { ImGuiCol_Header, transparent },
    { ImGuiCol_HeaderHovered, transparent },
    { ImGuiCol_HeaderActive, transparent },
    { ImGuiCol_Text, colors.text },
    { ImGuiCol_TitleBg, colors.header_bg },
    { ImGuiCol_TitleBgActive, colors.header_active },
    { ImGuiCol_ScrollbarBg, colors.scrollbar_bg },
    { ImGuiCol_ScrollbarGrab, colors.scrollbar_grab },
    { ImGuiCol_ScrollbarGrabHovered, colors.scrollbar_grab_hovered },
    { ImGuiCol_ScrollbarGrabActive, colors.scrollbar_grab_active },
}

local mode_items = { 'Missions', 'Quests' }
local mode_names = {
    Missions = 'Missions',
    Quests = 'Quests',
}

local KEY = {
    UP = 0xC8,
    DOWN = 0xD0,
    LEFT = 0xCB,
    RIGHT = 0xCD,
}

local DPAD = {
    UP = 0,
    DOWN = 1,
    LEFT = 2,
    RIGHT = 3,
}

local BUTTON_A = 12
local BUTTON_B = 13
local BUTTON_X = 14

local function reset_repeat()
    controller_repeat_button = nil
    controller_repeat_time = 0
    keyboard_repeat_key = nil
    keyboard_repeat_time = 0
end

local function close_popups()
    journal_mode_popup_open = false
    journal_area_popup_open = false
    journal_category_popup_open = false
    journal_search_active = false
    sheet_open = false
    progress_open = false
end

local function initialize_game_visibility()
    if game_visibility_initialized then
        return
    end

    game_visibility_initialized = true

    pGameMenu = ashita.memory.find(
        'FFXiMain.dll',
        0,
        '8B480C85C974??8B510885D274??3B05',
        16,
        0
    )

    pEventSystem = ashita.memory.find(
        'FFXiMain.dll',
        0,
        'A0????????84C0741AA1????????85C0741166A1????????663B05????????0F94C0C3',
        0,
        0
    )

    pInterfaceHidden = ashita.memory.find(
        'FFXiMain.dll',
        0,
        '8B4424046A016A0050B9????????E8????????F6D81BC040C3',
        0,
        0
    )
end

local function get_game_menu_name()
    if pGameMenu == 0 then
        return ''
    end

    local menu_pointer = ashita.memory.read_uint32(pGameMenu)
    if menu_pointer == 0 then
        return ''
    end

    local menu_val = ashita.memory.read_uint32(menu_pointer)
    if menu_val == 0 then
        return ''
    end

    local menu_header = ashita.memory.read_uint32(menu_val + 4)
    if menu_header == 0 then
        return ''
    end

    local name = ashita.memory.read_string(menu_header + 0x46, 16)
    if not name then
        return ''
    end

    return name:gsub('\x00', ''):gsub('menu[%s]+', ''):trimex():lower()
end

local function update_game_ui_visibility()
    initialize_game_visibility()

    local now = os.clock()
    if now - visibility_cache_time < visibility_cache_interval then
        return
    end

    visibility_cache_time = now
    game_ui_visible = GetPlayerEntity() ~= nil

    if not game_ui_visible then
        return
    end

    if pEventSystem ~= 0 then
        local ptr = ashita.memory.read_uint32(pEventSystem + 1)
        if ptr ~= 0 and ashita.memory.read_uint8(ptr) == 1 then
            game_ui_visible = false
            return
        end
    end

    if pInterfaceHidden ~= 0 then
        local ptr = ashita.memory.read_uint32(pInterfaceHidden + 10)
        if ptr ~= 0 and ashita.memory.read_uint8(ptr + 0xB4) == 1 then
            game_ui_visible = false
            return
        end
    end

    local menu = get_game_menu_name()
    if menu ~= ''
        and (
            menu:find('map', 1, true)
            or menu:find('regioninfo', 1, true)
            or menu:find('region', 1, true)
            or menu:find('cnqframe', 1, true)
            or menu:find('widescan', 1, true)
        ) then
        game_ui_visible = false
    end
end

local function can_draw_ui()
    return game_ui_visible
end

local function load_journal_cover(area)
    local cached = journal_cover_cache[area]
    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    local filename = journal_cover_files[area]
    if not filename then
        journal_cover_cache[area] = false
        return nil
    end

    local path = addon.path .. '/assets/covers/' .. filename
    if not ashita.fs.exists(path) then
        journal_cover_cache[area] = false
        return nil
    end

    if ffi.C.D3DXGetImageInfoFromFileA(path, d3d_image_info) ~= ffi.C.S_OK then
        journal_cover_cache[area] = false
        return nil
    end

    local texture_ptr = ffi.new('IDirect3DTexture8*[1]')

    if ffi.C.D3DXCreateTextureFromFileA(
        d3d8dev,
        path,
        texture_ptr
    ) ~= ffi.C.S_OK then

        journal_cover_cache[area] = false
        return nil
    end

    local texture = {
        ptr = d3d.gc_safe_release(
            ffi.cast('IDirect3DTexture8*', texture_ptr[0])
        ),
        width = tonumber(d3d_image_info.Width),
        height = tonumber(d3d_image_info.Height),
    }

    journal_cover_cache[area] = texture
    return texture
end

local function load_journal_logo(area)
    local cached = journal_logo_cache[area]

    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    journal_logo_cache[area] = false

    local filename = journal_logo_files[area]

    if not filename then
        return nil
    end

    local path = addon.path .. '/assets/logos/' .. filename

    if not ashita.fs.exists(path) then
        return nil
    end

    if ffi.C.D3DXGetImageInfoFromFileA(path, d3d_image_info) ~= ffi.C.S_OK then
        return nil
    end

    local texture_ptr = ffi.new('IDirect3DTexture8*[1]')

    if ffi.C.D3DXCreateTextureFromFileA(
        d3d8dev,
        path,
        texture_ptr
    ) ~= ffi.C.S_OK then

        return nil
    end

    local texture = {
        ptr = d3d.gc_safe_release(
            ffi.cast('IDirect3DTexture8*', texture_ptr[0])
        ),
        width = tonumber(d3d_image_info.Width),
        height = tonumber(d3d_image_info.Height),
    }

    journal_logo_cache[area] = texture

    return texture
end

local function load_journal_mini_texture()
    if journal_mini_texture ~= nil then
        return
    end

    local path = addon.path .. '/assets/journal.jpg'

    if not ashita.fs.exists(path) then
        return
    end

    local texture_ptr = ffi.new('IDirect3DTexture8*[1]')

    if ffi.C.D3DXCreateTextureFromFileA(
        d3d8dev,
        path,
        texture_ptr
    ) ~= ffi.C.S_OK then
        return
    end

    journal_mini_texture = d3d.gc_safe_release(
        ffi.cast('IDirect3DTexture8*', texture_ptr[0])
    )
end

-- left: draw it at the cursor instead of centering it.
local function draw_journal_cover(
    cover,
    width,
    height,
    left
)
    if not cover or not cover.ptr then
        return
    end

    local texture_id =
        tonumber(
            ffi.cast(
                'uint32_t',
                cover.ptr
            )
        )

    if not texture_id then
        return
    end

    if not left then
        imgui.SetCursorPosX(
            (
                imgui.GetWindowWidth()
                - width
            ) * 0.5
        )
    end

    imgui.Image(
        texture_id,
        { width, height },
        { 0, 0 },
        { 1, 1 },
        { 1, 1, 1, 1 }
    )
end

local function set_window_visible(
    kind,
    visible
)
    if not controller then
        return
    end

    local fn =
        controller[
            (
                visible
                and 'Show'
                or 'Hide'
            ) .. kind
        ]

    if fn then
        fn()
        return
    end

    fn =
        controller[
            'Set' .. kind .. 'Visible'
        ]

    if fn then
        fn(visible)
    end
end

local function toggle_window(kind)
    if not controller then
        return
    end

    local fn =
        controller[
            'Toggle' .. kind
        ]

    if not fn then
        return
    end

    fn()

    if kind == 'Journal' then
        journal_restore_window = true
    end
end

function M.ShowJournal()
    set_window_visible(
        'Journal',
        true
    )

    if controller
        and controller.SetJournalMini then

        controller.SetJournalMini(false)
    end

    journal_restore_window = true
    journal_mini_restore_window = true
end

function M.HideJournal()
    set_window_visible(
        'Journal',
        false
    )

    close_popups()
    reset_repeat()
end

function M.ToggleJournal()
    toggle_window('Journal')
end

function M.ShowHelp()
    journal_help_window = true
    journal_help_restore = true
end

function M.HideHelp()
    journal_help_window = false
end

function M.ToggleHelp()
    journal_help_window =
        not journal_help_window

    if journal_help_window then
        journal_help_restore = true
    end
end

-- Opacity of the backgrounds of the window being drawn (1.0 = solid). Only
-- the backgrounds fade: the text, the buttons and the lines stay sharp.
local current_bg_opacity = 1.0

local function scale_alpha(color, opacity)
    return { color[1], color[2], color[3], (color[4] or 1) * opacity }
end

-- no_fade keeps the window solid (the settings window, so it can always be
-- read while the opacity is being changed).
local function push_theme(no_fade, opacity_override, chat_legacy)
    -- The compass (the only caller with an opacity of its own) keeps the
    -- Original look.
    theme.Enter(opacity_override ~= nil, chat_legacy)

    local opacity = 1.0

    if opacity_override ~= nil then
        opacity = opacity_override
    elseif not no_fade
        and controller
        and controller.GetJournalOpacity then

        opacity = controller.GetJournalOpacity()
    end

    current_bg_opacity = opacity

    for _, entry in ipairs(theme_colors) do
        local color = entry[2]

        if opacity_override ~= nil
            and opacity <= 0
            and entry[1] == ImGuiCol_Border then

            -- A window with a fully transparent background has no border.
            color = transparent
        elseif opacity < 1.0
            and (
                entry[1] == ImGuiCol_WindowBg
                or entry[1] == ImGuiCol_ChildBg
                or entry[1] == ImGuiCol_PopupBg
            ) then

            color = scale_alpha(color, opacity)
        end

        imgui.PushStyleColor(
            entry[1],
            color
        )
    end

    imgui.PushStyleVar(
        ImGuiStyleVar_WindowPadding,
        theme.WindowPadding()
    )

    imgui.PushStyleVar(
        ImGuiStyleVar_FramePadding,
        { 8, 6 }
    )

    imgui.PushStyleVar(
        ImGuiStyleVar_ItemSpacing,
        { 7, 7 }
    )

    imgui.PushStyleVar(
        ImGuiStyleVar_ItemInnerSpacing,
        { 6, 5 }
    )

    -- The style of the controls of the Legacy theme (nothing in Original).
    theme.PushExtra(imgui)
end

local function pop_theme()
    theme.PopExtra(imgui)
    imgui.PopStyleVar(4)
    imgui.PopStyleColor(
        #theme_colors
    )

    current_bg_opacity = 1.0

    theme.Leave()
end

local function draw_window_panel(
    draw,
    x,
    y,
    width,
    height,
    double_line
)
    if not draw then
        return
    end

    -- The book of the Legacy theme replaces the panel.
    if theme.DrawPanel(
        imgui, draw, x, y, width, height, current_bg_opacity
    ) then
        return
    end

    local opacity = current_bg_opacity

    local top = imgui.GetColorU32({
        colors.panel[1],
        colors.panel[2],
        colors.panel[3],
        colors.panel_alpha_top * opacity,
    })

    local mid = imgui.GetColorU32({
        colors.panel[1],
        colors.panel[2],
        colors.panel[3],
        colors.panel_alpha_mid * opacity,
    })

    local bottom = imgui.GetColorU32({
        colors.panel[1],
        colors.panel[2],
        colors.panel[3],
        colors.panel_alpha_bottom * opacity,
    })

    local mid_y =
        y + height * 0.5

    draw:AddRectFilledMultiColor(
        { x, y },
        {
            x + width,
            mid_y,
        },
        top,
        top,
        mid,
        mid
    )

    draw:AddRectFilledMultiColor(
        { x, mid_y },
        {
            x + width,
            y + height,
        },
        mid,
        mid,
        bottom,
        bottom
    )

    local light =
        imgui.GetColorU32(
            scale_alpha(colors.stripe, opacity)
        )

    local dark =
        imgui.GetColorU32(
            scale_alpha(colors.stripe_dark, opacity)
        )

    for row_y = y, y + height, 5 do
        local row =
            math.floor(
                (row_y - y) / 5
            )

        draw:AddLine(
            { x, row_y },
            { x + width, row_y },
            row % 2 == 0
                and light
                or dark,
            2.0
        )
    end

    draw:AddRect(
        { x + 0.5, y + 0.5 },
        {
            x + width - 0.5,
            y + height - 0.5,
        },
        imgui.GetColorU32(
            colors.frame
        ),
        0,
        0,
        1
    )

    if double_line then
        draw:AddRect(
            {
                x + 2.5,
                y + 2.5,
            },
            {
                x + width - 2.5,
                y + height - 2.5,
            },
            imgui.GetColorU32(
                colors.frame_inner
            ),
            0,
            0,
            1
        )
    end
end

-- Panel of a block inside a window: only a thin line, so the stripes of the
-- window show through. double_line is accepted for the callers and ignored.
local function draw_panel(
    draw,
    x,
    y,
    width,
    height,
    double_line
)
    -- The pages of the Legacy theme have no frame of their own.
    if not draw or theme.HasPicture() then
        return
    end

    draw:AddRect(
        { x + 0.5, y + 0.5 },
        {
            x + width - 0.5,
            y + height - 0.5,
        },
        imgui.GetColorU32(
            colors.frame
        ),
        0,
        0,
        1
    )
end

local function draw_selection_arrow(
    draw,
    x,
    y,
    height
)
    if not draw then
        return
    end

    local cy =
        y + height * 0.5

    local left =
        x + 3

    draw:AddTriangleFilled(
        {
            left,
            cy - 6,
        },
        {
            left + 9,
            cy,
        },
        {
            left,
            cy + 6,
        },
        imgui.GetColorU32(
            colors.arrow
        )
    )
end

-- Color of the dot for a status as shown in the list: blue when not
-- started, green when active, gray when completed. A quest that cannot be
-- tracked gets a faded blue, since its real state is unknown.
local function status_dot_color(status)
    if status == 'active' then
        return colors.dot_active
    elseif status == 'completed' then
        return colors.dot_completed
    elseif status == 'untracked' then
        return colors.dot_untracked
    end

    return colors.dot_not_started
end

local function draw_selector_item(
    text,
    selected,
    dot_color,
    repeatable,
    id_suffix,
    favorite,
    icon
)
    imgui.PushStyleColor(
        ImGuiCol_Text,
        transparent
    )

    -- id_suffix keeps two rows with the same text apart.
    local clicked =
        imgui.Selectable(
            id_suffix and (text .. '##' .. id_suffix) or text,
            selected
        )

    local hovered =
        imgui.IsItemHovered()

    imgui.PopStyleColor()

    local draw =
        imgui.GetWindowDrawList()

    local min_x, min_y =
        imgui.GetItemRectMin()

    local max_x, max_y =
        imgui.GetItemRectMax()

    local height =
        max_y - min_y

    if hovered then
        draw:AddRectFilled(
            {
                min_x + 2,
                min_y + 1,
            },
            {
                max_x - 2,
                max_y - 1,
            },
            imgui.GetColorU32({
                colors.button_hover[1],
                colors.button_hover[2],
                colors.button_hover[3],
                0.55,
            }),
            2
        )
    end

    -- Legacy: a faint rule under every row, and a burgundy mark on the
    -- selected one (nothing in Original).
    theme.DrawRow(imgui, draw, min_x, min_y, max_x, max_y, selected)

    if selected then
        draw_selection_arrow(
            draw,
            min_x,
            min_y,
            height
        )
    end

    -- The icon of the quest, or the dot when there is none (or it fails).
    local icon_drawn = false

    if icon ~= nil then
        icon_drawn = pcall(function()
            local icon_h = math.min(height - 2, 24)
            local icon_w = icon_h * icon.width / icon.height
            local center_y = min_y + height * 0.5

            -- The mission icons are wider: they must not touch the text.
            if icon_w > 21 then
                icon_h = icon_h * 21 / icon_w
                icon_w = 21
            end

            draw:AddImage(
                icon.id,
                { min_x + 19 - icon_w * 0.5, center_y - icon_h * 0.5 },
                { min_x + 19 + icon_w * 0.5, center_y + icon_h * 0.5 },
                { 0, 0 },
                { 1, 1 },
                imgui.GetColorU32({ 1, 1, 1, 1 })
            )
        end)
    end

    if not icon_drawn then
        draw:AddCircleFilled(
            {
                min_x + 19,
                min_y + height * 0.5,
            },
            6.1,
            imgui.GetColorU32(
                dot_color
                    or colors.selector_dot
            ),
            14
        )

        draw:AddCircleFilled(
            {
                min_x + 17.4,
                min_y + height * 0.5 - 1.6,
            },
            1.9,
            imgui.GetColorU32(
                colors.selector_dot_highlight
            ),
            10
        )
    end

    local text_x =
        min_x + 32

    local text_y =
        min_y
        + (
            height
            - imgui.GetTextLineHeight()
        ) * 0.5

    if selected then
        text_x =
            text_x + 2

        text_y =
            text_y - 1
    end

    draw:AddText(
        {
            text_x,
            text_y,
        },
        imgui.GetColorU32(
            selected
                and colors.selector_text_selected
                or colors.selector_text
        ),
        text
    )

    -- Repeatable quests: an infinity sign after the name.
    if repeatable then
        local line_height = imgui.GetTextLineHeight()
        local icon_width, icon_height =
            icons.infinity_size(line_height)

        icons.draw_infinity(
            draw,
            text_x + (imgui.CalcTextSize(text)) + 10,
            text_y + (line_height - icon_height) * 0.5,
            icon_width,
            icon_height,
            imgui.GetColorU32(colors.repeatable),
            2.0
        )
    end

    -- Favorites: a star after the name (and after the infinity sign).
    if favorite then
        local line_height = imgui.GetTextLineHeight()
        local star_x = text_x + (imgui.CalcTextSize(text)) + 10

        if repeatable then
            star_x = star_x + (icons.infinity_size(line_height)) + 8
        end

        local size = line_height * 0.8

        icons.draw_star(
            draw,
            star_x,
            text_y + (line_height - size) * 0.5,
            size,
            imgui.GetColorU32(colors.favorite)
        )
    end

    return clicked
end

local function restore_window(
    state,
    restore
)
    if not restore then
        return false
    end

    if state.width ~= nil
        and state.height ~= nil then

        imgui.SetNextWindowSize({
            state.width,
            state.height,
        })
    end

    if state.x ~= nil
        and state.y ~= nil then

        imgui.SetNextWindowPos({
            state.x,
            state.y,
        })
    end

    return false
end

local function get_status_display(status)
    if status == 'active' then
        return tx('Active'),
            colors.active_status

    elseif status == 'completed' then
        return tx('Completed'),
            colors.completed
    end

    if status == 'untracked' then
        return tx('Not Tracked'),
            colors.not_started
    end

    return tx('Not Started'),
        colors.not_started
end

-- Quests without a tracking id cannot be told apart, so "Not Started"
-- would be a guess: they could be done already. They are shown as not
-- tracked instead.
local function display_status(item)
    local status = item.status or 'not_started'

    if item.trackable == false and status == 'not_started' then
        return 'untracked'
    end

    return status
end

local function draw_status_at_item_end(
    status
)
    local text, color =
        get_status_display(status)

    local _, min_y =
        imgui.GetItemRectMin()

    local max_x =
        select(
            1,
            imgui.GetItemRectMax()
        )

    local width =
        imgui.CalcTextSize(text)

    local draw =
        imgui.GetWindowDrawList()

    if draw then
        draw:AddText(
            {
                max_x - width - 12,
                min_y + 4,
            },
            imgui.GetColorU32(color),
            text
        )
    end
end

local function draw_selectable_status_list(
    child_id,
    width,
    items,
    selection_index,
    hide_label,
    hide_getter,
    hide_setter,
    show_label,
    show_getter,
    show_setter,
    label_getter,
    select_callback,
    empty_top_spacing,
    repeatable_getter,
    repeatable_setter,
    open_callback,
    extras,
    favorite_getter,
    filter_getter,
    filter_setter
)
    imgui.PushStyleColor(
        ImGuiCol_ChildBg,
        transparent
    )

    if imgui.BeginChild(
        child_id,
        { width, -1 },
        child_border
    ) then
        local draw =
            imgui.GetWindowDrawList()

        local x, y =
            imgui.GetWindowPos()

        local w, h =
            imgui.GetWindowSize()

        draw_panel(
            draw,
            x,
            y,
            w,
            h,
            true
        )

        local checkbox = {
            hide_getter
                and hide_getter() == true
                or false,
        }

        if imgui.Checkbox(
            hide_label,
            checkbox
        )
            and hide_setter then

            hide_setter(
                checkbox[1] == true
            )
        end

        -- A button with a star that shows only the favorites. It sits at the
        -- right end of the first row, before the infinity button when there
        -- is one.
        local only_favorites = false

        if filter_getter
            and filter_setter
            and imgui.GetFrameHeight then

            only_favorites = filter_getter() == true

            local size = imgui.GetFrameHeight()
            local right = 14

            if repeatable_getter and repeatable_setter then
                right = right + size + 6
            end

            imgui.SameLine()
            imgui.SetCursorPosX(imgui.GetWindowWidth() - size - right)

            if only_favorites then
                imgui.PushStyleColor(
                    ImGuiCol_Button,
                    colors.button_active
                )
            end

            if imgui.Button(
                '##OnlyFavorites',
                { size, size }
            ) then
                filter_setter(not only_favorites)
            end

            if only_favorites then
                imgui.PopStyleColor()
            end

            local min_x, min_y = imgui.GetItemRectMin()
            local max_x, max_y = imgui.GetItemRectMax()
            local star_size = (max_y - min_y) * 0.6

            icons.draw_star(
                imgui.GetWindowDrawList(),
                min_x + ((max_x - min_x) - star_size) * 0.5,
                min_y + ((max_y - min_y) - star_size) * 0.5,
                star_size,
                imgui.GetColorU32(
                    only_favorites
                        and colors.favorite
                        or colors.text_dim
                )
            )

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Only favorites'))
            end
        end

        -- Quests only: a button with the infinity sign that shows only the
        -- repeatable quests. It sits at the right end of the first row.
        local only_repeatable = false

        if repeatable_getter
            and repeatable_setter
            and imgui.GetFrameHeight then

            only_repeatable = repeatable_getter() == true

            local size = imgui.GetFrameHeight()

            imgui.SameLine()
            imgui.SetCursorPosX(imgui.GetWindowWidth() - size - 14)

            if only_repeatable then
                imgui.PushStyleColor(
                    ImGuiCol_Button,
                    colors.button_active
                )
            end

            if imgui.Button(
                '##OnlyRepeatable',
                { size, size }
            ) then
                repeatable_setter(not only_repeatable)
            end

            if only_repeatable then
                imgui.PopStyleColor()
            end

            -- The sign is drawn over the button.
            local min_x, min_y = imgui.GetItemRectMin()
            local max_x, max_y = imgui.GetItemRectMax()
            local icon_width = (max_x - min_x) * 0.66
            local icon_height = icon_width * 0.45

            icons.draw_infinity(
                imgui.GetWindowDrawList(),
                min_x + ((max_x - min_x) - icon_width) * 0.5,
                min_y + ((max_y - min_y) - icon_height) * 0.5,
                icon_width,
                icon_height,
                imgui.GetColorU32(
                    only_repeatable
                        and colors.repeatable
                        or colors.text_dim
                ),
                2.0
            )

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Only repeatable quests'))
            end
        end

        if show_label ~= nil then
            local show_checkbox = {
                show_getter
                    and show_getter() == true
                    or false,
            }

            if imgui.Checkbox(
                show_label,
                show_checkbox
            )
                and show_setter then

                show_setter(
                    show_checkbox[1] == true
                )
            end
        end

        imgui.Separator()

        if empty_top_spacing then
            imgui.Spacing()
            imgui.Spacing()
        else
            imgui.Spacing()
        end

        if #items == 0 then
            local empty_text =
                empty_top_spacing
                and tx('No quests available.')
                or tx('No missions available.')

            if controller
                and controller.GetSearchText
                and controller.GetSearchText() ~= '' then

                empty_text = tx('No matches found.')
            elseif only_favorites then
                empty_text = tx('No favorites in this list.')
            elseif only_repeatable then
                empty_text = tx('No repeatable quests.')
            end

            imgui.TextColored(
                colors.text_dim,
                empty_text
            )
        else
            local last_selection =
                list_last_selection[child_id]

            local selection_changed =
                last_selection
                ~= selection_index

            -- Extra blocks (the chapters of Chains of Promathia, the epilogue
            -- of Zilart and Chains) go before one mission of their area.
            -- The epilogue goes after the last mission of its area when that
            -- mission is not in the list.
            local blocks_at = {}

            for _, block in ipairs(extras or {}) do
                local at = block.at_index

                for i, item in ipairs(at == nil and items or {}) do
                    if item.area == block.area then
                        if block.before_code ~= nil then
                            if tostring(item.code or '') == block.before_code then
                                at = i
                                break
                            end
                        elseif block.rank ~= nil then
                            if tonumber(item.rank) == block.rank then
                                at = i
                                break
                            end
                        elseif block.chapter ~= nil then
                            local code = tostring(item.code or '')

                            if tonumber(code:match('^(%d)%-')) == block.chapter then
                                at = i
                                break
                            end
                        else
                            if item.id == block.before_id then
                                at = i
                                break
                            end

                            at = i + 1
                        end
                    end
                end

                if at ~= nil then
                    blocks_at[at] = blocks_at[at] or {}
                    blocks_at[at][#blocks_at[at] + 1] = block
                end
            end

            -- The logo of an area goes above its first mission, and the
            -- banner of a nation above its first quest. In a list of all
            -- the areas each one gets its own.
            local logos_at = {}
            local logo_seen = {}
            local is_mission_list = child_id == '##JournalMissionList'

            for i, item in ipairs(items) do
                local key = is_mission_list and item.area or item.category

                if key ~= nil
                    and (
                        journal_logo_files[key] ~= nil
                        or (not is_mission_list and journal_text_banners[key] ~= nil)
                    )
                    and not logo_seen[key] then

                    logo_seen[key] = true
                    logos_at[i] = key
                end
            end

            -- Local patch: a title banner drawn in place of a picture.
            local function draw_text_banner(title)
                local width = math.min(
                    imgui.GetWindowWidth() - scaled(40),
                    scaled(380) * 2
                )
                local height = scaled(64)

                if width <= 0 then
                    return
                end

                imgui.Spacing()
                imgui.SetCursorPosX((imgui.GetWindowWidth() - width) * 0.5)
                imgui.Dummy({ width, height })

                pcall(function()
                    local draw = imgui.GetWindowDrawList()
                    local x1, y1 = imgui.GetItemRectMin()
                    local x2, y2 = imgui.GetItemRectMax()
                    local gold = imgui.GetColorU32({ 0.93, 0.80, 0.50, 1.00 })
                    local line = imgui.GetColorU32({ 0.93, 0.80, 0.50, 0.55 })
                    local fill = imgui.GetColorU32({ 0.06, 0.07, 0.15, 0.65 })
                    local size = scaled(40)
                    local tw, th

                    if journal_font ~= nil then
                        imgui.PushFont(journal_font, size)
                        tw, th = imgui.CalcTextSize(title)
                        imgui.PopFont()
                    else
                        tw, th = imgui.CalcTextSize(title)
                    end

                    local cx = (x1 + x2) * 0.5
                    local cy = (y1 + y2) * 0.5
                    local gap = scaled(18)
                    local d = scaled(5)

                    draw:AddRectFilled({ x1, y1 }, { x2, y2 }, fill, 4)
                    draw:AddRect({ x1, y1 }, { x2, y2 }, line, 4, 0, 1)

                    -- Ornamental rules on each side of the title, ending
                    -- in a small diamond.
                    local left_end = cx - tw * 0.5 - gap
                    local right_start = cx + tw * 0.5 + gap
                    local margin = x1 + scaled(24)
                    local margin_r = x2 - scaled(24)

                    if left_end > margin + d * 2 then
                        draw:AddLine({ margin, cy }, { left_end, cy }, line, 1.5)
                        draw:AddQuadFilled({ left_end, cy - d }, { left_end + d, cy },
                            { left_end, cy + d }, { left_end - d, cy }, gold)
                        draw:AddLine({ right_start, cy }, { margin_r, cy }, line, 1.5)
                        draw:AddQuadFilled({ right_start, cy - d }, { right_start + d, cy },
                            { right_start, cy + d }, { right_start - d, cy }, gold)
                    end

                    local pos = { cx - tw * 0.5, cy - th * 0.5 }

                    if journal_font ~= nil then
                        draw:AddText(journal_font, size, pos, gold, title)
                    else
                        draw:AddText(pos, gold, title)
                    end
                end)

                imgui.Spacing()
            end

            local function draw_logo(logo_area)
                local logo = load_journal_logo(logo_area)

                if (logo == nil or logo.height <= 0)
                    and not is_mission_list
                    and journal_text_banners[logo_area] ~= nil then

                    draw_text_banner(tx(journal_text_banners[logo_area]))
                    return
                end

                if logo == nil or logo.height <= 0 then
                    return
                end

                local logo_width = math.min(
                    imgui.GetWindowWidth() - scaled(40),
                    scaled(380) * (journal_logo_scale[logo_area] or 1)
                )

                if logo_width <= 0 then
                    return
                end

                imgui.Spacing()

                draw_journal_cover(
                    logo,
                    logo_width,
                    logo_width * logo.height / logo.width
                )

                imgui.Spacing()
            end

            local function draw_extras(list)
                for _, block in ipairs(list or {}) do
                    imgui.Spacing()

                    if block.before_code ~= nil then
                        -- A requirement: a short dim text before the mission.
                        imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)

                        if imgui.TextWrapped then
                            imgui.TextWrapped(tx(block.title))
                        else
                            imgui.Text(tx(block.title))
                        end

                        imgui.PopStyleColor()
                    else
                        imgui.TextColored(
                            colors.gold,
                            block.raw_title and block.title or tx(block.title)
                        )

                        if block.done then
                            -- Green V: every mission of this rank is done.
                            local x0, y0 = imgui.GetItemRectMin()
                            local x1, y1 = imgui.GetItemRectMax()
                            local size = y1 - y0
                            icons.draw_check(
                                imgui.GetWindowDrawList(),
                                x1 + 6,
                                y0,
                                size,
                                imgui.GetColorU32(colors.completed),
                                1
                            )
                        end
                    end

                    for _, row in ipairs(block.rows or {}) do
                        if row.info then
                            -- Information only: no quest to open.
                            imgui.TextColored(
                                colors.text_dim,
                                '    ' .. tostring(row.name)
                            )

                            if imgui.IsItemHovered() and imgui.SetTooltip then
                                imgui.SetTooltip(
                                    tostring(row.type)
                                    .. '\n'
                                    .. tostring(row.reward)
                                )
                            end
                        else
                            local row_clicked =
                                draw_selector_item(
                                    tostring(row.name),
                                    false,
                                    status_dot_color(display_status(row)),
                                    row.repeatable == true,
                                    block.area .. '_' .. tostring(row.id),
                                    nil,
                                    sheetx.row_icon(row, display_status(row))
                                )

                            if row_clicked and controller.JumpToQuest then
                                controller.JumpToQuest(row.id)
                            end

                            if imgui.IsItemHovered() and imgui.SetTooltip then
                                imgui.SetTooltip(tx('Opens the quest'))
                            end

                            draw_status_at_item_end(display_status(row))
                        end
                    end

                    imgui.Spacing()
                end
            end

            for i, item in ipairs(items) do
                if logos_at[i] ~= nil then
                    draw_logo(logos_at[i])
                end

                draw_extras(blocks_at[i])

                local selected =
                    i == selection_index

                local status =
                    display_status(item)

                local clicked =
                    draw_selector_item(
                        tostring(
                            label_getter(item)
                        ),
                        selected,
                        status_dot_color(status),
                        item.repeatable == true,
                        -- Local patch: the row number keeps rows with the same
                        -- name apart (e.g. "Enemy of the Empire" in two areas).
                        'row' .. i,
                        favorite_getter ~= nil
                            and favorite_getter(item) == true,
                        sheetx.row_icon(item, status, is_mission_list)
                    )

                -- One click selects the row; a double click opens its
                -- sheet.
                local double_clicked =
                    open_callback ~= nil
                    and imgui.IsMouseDoubleClicked ~= nil
                    and imgui.IsItemHovered()
                    and imgui.IsMouseDoubleClicked(0)

                if clicked then
                    select_callback(i)
                end

                if double_clicked then
                    select_callback(i)
                    open_callback(i)
                end

                if selected
                    and selection_changed
                    and not imgui.IsItemVisible() then

                    imgui.SetScrollHereY(
                        0.5
                    )
                end

                draw_status_at_item_end(
                    status
                )
            end

            draw_extras(blocks_at[#items + 1])

            list_last_selection[child_id] =
                selection_index
        end
    end

    imgui.EndChild()

    imgui.PopStyleColor()
end

-- A click on an NPC name in a step: the NPC goes to the compass (and the
-- compass window opens). nil when the controller cannot do it, and then the
-- names are not clickable.
local function npc_click(step_text)
    if controller ~= nil and controller.AddCompassNpcByName ~= nil then
        return function(name)
            controller.AddCompassNpcByName(name, step_text)
        end
    end

    return nil
end

-- A line "prefix + name" for the compass where the name has a border around
-- its letters (the zone pinned in the compass): the line is reserved with
-- invisible text and the border is the name drawn in the border color around
-- its place, one pixel (scaled) in each direction, with the letters on top.
-- Returns false when it could not draw it.
sheetx.outline_line = function(color, prefix, name, border, scale)
    imgui.PushStyleColor(ImGuiCol_Text, transparent)

    local reserved = pcall(imgui.Text, prefix .. name)

    imgui.PopStyleColor()

    if not reserved then
        return false
    end

    return pcall(function()
        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetItemRectMin()
        local shift = (imgui.CalcTextSize(prefix .. '|'))
            - (imgui.CalcTextSize('|'))
        -- A little thinner than a whole pixel per step of scale.
        local width = math.max(0.6, (scale or 1) * 0.6)
        local ring = imgui.GetColorU32(border)
        local fill = imgui.GetColorU32(color)

        draw:AddText({ x, y }, fill, prefix)

        for dx = -1, 1 do
            for dy = -1, 1 do
                if dx ~= 0 or dy ~= 0 then
                    draw:AddText(
                        { x + shift + dx * width, y + dy * width },
                        ring,
                        name
                    )
                end
            end
        end

        draw:AddText({ x + shift, y }, fill, name)
    end)
end

-- A click on a zone name in a step: the compass guides the player there.
-- nil when the controller cannot do it, and then the names are not clickable.
sheetx.zone_click = function()
    if controller ~= nil and controller.SetCompassZoneGoalByName ~= nil then
        return controller.SetCompassZoneGoalByName
    end

    return nil
end

-- mark_kind and mark_id (and mark_name) identify the quest or mission, to
-- show and change its checklist.
local function draw_steps(
    steps,
    child_id,
    no_steps_text,
    reserve,
    mark_kind,
    mark_id,
    mark_name,
    locked
)
    if #steps == 0 then
        imgui.TextColored(
            colors.text_dim,
            no_steps_text
        )

        return
    end

    imgui.PushStyleColor(
        ImGuiCol_ChildBg,
        transparent
    )

    if imgui.BeginChild(
        child_id,
        { -1, -(reserve or 76) },
        child_border
    ) then
        local draw =
            imgui.GetWindowDrawList()

        local x, y =
            imgui.GetWindowPos()

        local w, h =
            imgui.GetWindowSize()

        draw_panel(
            draw,
            x,
            y,
            w,
            h,
            true
        )

        local styles = get_styles()

        -- The checklist needs these calls of the interface. Without them the
        -- steps are drawn as before, with no boxes.
        local checklist =
            mark_id ~= nil
            and controller
            and controller.GetStepMarks
            and controller.ToggleStepMark
            and imgui.Checkbox
            and imgui.Indent
            and imgui.Unindent
            and imgui.GetCursorPosY
            and imgui.SetCursorPosY
            and imgui.GetFrameHeight
            and imgui.Dummy

        local marks = {}

        if checklist and locked then
            -- A completed quest or mission: every step is done and cannot
            -- be changed.
            for i = 1, #steps do
                marks[i] = true
            end
        elseif checklist then
            marks =
                controller.GetStepMarks(
                    mark_kind,
                    mark_id,
                    mark_name,
                    steps
                )
        end

        for i, step in ipairs(steps) do
            local text =
                tostring(i)
                    .. '. '
                    .. tostring(i18n.step(step))

            if checklist then
                local done = marks[i] == true
                local top = imgui.GetCursorPosY()
                local box_height = imgui.GetFrameHeight()
                local box_width = box_height + 10
                local box = { done }

                if imgui.Checkbox('##step_done_' .. i, box) and not locked then
                    controller.ToggleStepMark(
                        mark_kind,
                        mark_id,
                        mark_name,
                        steps,
                        i
                    )
                end

                -- The text goes beside the box, indented so that every
                -- line of it stays clear of the box.
                imgui.SetCursorPosY(top)
                imgui.Indent(box_width)

                richtext.draw_wrapped(
                    text,
                    {
                        styles = styles,
                        color = done and colors.text_dim or colors.text,
                        size = step_font_size,
                        items = true,
                        on_npc = npc_click(text),
                        id = tostring(child_id) .. '_' .. i,
                        npc_tooltip = tx('Click to point the compass at it'),
                        on_zone = sheetx.zone_click(),
                        zone_tooltip = tx('Click to guide the compass to this zone'),
                        on_monster = sheetx.monster_click(),
                        monster_tooltip = tx('Click to see its sheet'),
                        on_item = sheetx.item_click(),
                        item_known = sheetx.item_known,
                        item_tooltip = tx('Click to see its sheet'),
                    }
                )

                imgui.Unindent(box_width)

                -- A short step is as tall as its box.
                local missing = top + box_height - imgui.GetCursorPosY()

                if missing > 0 then
                    imgui.Dummy({ 1, missing })
                end
            else
                richtext.draw_wrapped(
                    text,
                    {
                        styles = styles,
                        color = colors.text,
                        size = step_font_size,
                        items = true,
                        on_npc = npc_click(text),
                        id = tostring(child_id) .. '_' .. i,
                        npc_tooltip = tx('Click to point the compass at it'),
                        on_zone = sheetx.zone_click(),
                        zone_tooltip = tx('Click to guide the compass to this zone'),
                        on_monster = sheetx.monster_click(),
                        monster_tooltip = tx('Click to see its sheet'),
                        on_item = sheetx.item_click(),
                        item_known = sheetx.item_known,
                        item_tooltip = tx('Click to see its sheet'),
                    }
                )
            end

            imgui.Spacing()
        end
    end

    imgui.EndChild()

    imgui.PopStyleColor()
end

local function draw_selected_status(status)
    local text, color =
        get_status_display(status)

    imgui.TextColored(
        color,
        '[' .. text .. ']'
    )
end

local function draw_mission_info(selected)
    local parts = {}

    if selected.rank ~= nil and selected.rank ~= '' then
        parts[#parts + 1] = tx('Rank ') .. tostring(selected.rank)
    end

    if selected.number ~= nil and selected.number ~= '' then
        parts[#parts + 1] = tx('Mission ') .. tostring(selected.number)
    end

    if selected.mission_type ~= nil and selected.mission_type ~= '' then
        parts[#parts + 1] = tostring(selected.mission_type)
    end

    if #parts > 0 then
        -- Local patch: wrap instead of running past the panel edge.
        imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)
        imgui.TextWrapped(table.concat(parts, '  |  '))
        imgui.PopStyleColor()
    end

    if selected.reward ~= nil and selected.reward ~= '' then
        -- Local patch: wrap instead of running past the panel edge.
        imgui.PushStyleColor(ImGuiCol_Text, colors.gold)
        imgui.TextWrapped(tx('Reward: ') .. tostring(selected.reward))
        imgui.PopStyleColor()
    end
end

-- A line of the details that jumps to another quest when it is clicked.
-- The mark in front shows if the quest is done ([x]), active ([>]) or not.
local function draw_quest_link(link, section)
    local mark = '[ ] '
    local color = colors.active_status

    if link.status == 'completed' then
        mark = '[x] '
        color = colors.completed
    elseif link.status == 'active' then
        mark = '[>] '
    end

    imgui.PushStyleColor(ImGuiCol_Text, color)

    local clicked =
        imgui.Selectable(
            '  ' .. mark .. link.name
                .. '##quest_link_' .. section
                .. '_' .. tostring(link.id),
            false
        )

    imgui.PopStyleColor()

    return clicked
end

local function draw_metadata(selected)
    local links = nil
    local back = nil

    if controller
        and controller.GetQuestLinks
        and selected.id ~= nil then

        links = controller.GetQuestLinks(selected.id)

        if controller.GetQuestBack then
            back = controller.GetQuestBack()
        end
    end

    if back ~= nil then
        imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)

        local clicked =
            imgui.Selectable(
                tx('< Back: ') .. back.name .. '##quest_link_back',
                false
            )

        imgui.PopStyleColor()

        if clicked then
            controller.JumpBack()
        end
    end

    if selected.repeatable == true then
        imgui.TextColored(
            colors.active_status,
            tx('Repeatable')
        )
    end

    local fields = {
        { tx('Zone: '), selected.zone },
        { tx('NPC: '), selected.npc },
        { tx('Location: '), selected.loc },
        { tx('Requires: '), selected.req },
        { tx('Prereq: '), selected.prereq },
        { tx('Items: '), selected.items },
    }

    local has_prereq_links =
        links ~= nil
        and #links.prereq > 0

    for _, field in ipairs(fields) do
        if field[2] ~= nil
            and field[2] ~= ''
            and not (
                has_prereq_links
                and field[1] == tx('Prereq: ')
            ) then

            if field[1] == tx('NPC: ') and controller.AddCompassNpcByName then
                -- The NPC that starts the quest: each name (the data may
                -- hold several, separated by "/") is clickable, as in the
                -- steps. The zone of the quest helps to pick the right one.
                local hint = tostring(selected.zone or '') .. ' '
                    .. tostring(selected.loc or '')
                local first = true

                imgui.TextColored(colors.text_dim, field[1])

                for part in tostring(field[2]):gmatch('[^/]+') do
                    local name = part:match('^%s*(.-)%s*$')

                    if name ~= '' then
                        if not first then
                            imgui.SameLine(0, 0)
                            imgui.TextColored(colors.text_dim, ' / ')
                        end

                        first = false

                        imgui.SameLine(0, 0)
                        imgui.TextColored(richtext.COLORS.npc, name)

                        if imgui.IsItemHovered() then
                            pcall(function()
                                local min_x, min_y = imgui.GetItemRectMin()
                                local max_x, max_y = imgui.GetItemRectMax()

                                imgui.GetWindowDrawList():AddLine(
                                    { min_x, max_y },
                                    { max_x, max_y },
                                    imgui.GetColorU32(richtext.COLORS.npc),
                                    1
                                )
                            end)

                            if imgui.SetTooltip then
                                imgui.SetTooltip(
                                    tx('Click to point the compass at it')
                                )
                            end

                            if imgui.IsItemClicked() then
                                controller.AddCompassNpcByName(name, hint)
                            end
                        end
                    end
                end
            else
                -- Local patch: wrap long values (items, requirements)
                -- instead of letting them run past the edge of the panel.
                imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)
                imgui.TextWrapped(
                    field[1]
                        .. tostring(field[2])
                )
                imgui.PopStyleColor()
            end
        end
    end

    if has_prereq_links then
        imgui.TextColored(colors.text_dim, tx('Prereq: '))

        for _, link in ipairs(links.prereq) do
            if draw_quest_link(link, 'prereq') then
                controller.JumpToQuest(link.id)
            end
        end

        if links.has_other_text then
            imgui.TextColored(
                colors.text_dim,
                '  ' .. tostring(selected.prereq)
            )
        end
    end

    if links ~= nil
        and #links.next > 0 then

        imgui.TextColored(colors.text_dim, tx('Next: '))

        for _, link in ipairs(links.next) do
            if draw_quest_link(link, 'next') then
                controller.JumpToQuest(link.id)
            end
        end

        if links.more > 0 then
            imgui.TextColored(
                colors.text_dim,
                '  ' .. string.format(tx('+%d more'), links.more)
            )
        end
    end

    if selected.reward ~= nil
        and selected.reward ~= '' then

        -- Local patch: wrap instead of running past the panel edge.
        imgui.PushStyleColor(ImGuiCol_Text, colors.gold)
        imgui.TextWrapped(
            tx('Reward: ')
                .. tostring(selected.reward)
        )
        imgui.PopStyleColor()
    end
end

-- The note box of the details panel needs these calls.
local function notes_enabled()
    return controller ~= nil
        and controller.GetNote ~= nil
        and controller.SetNote ~= nil
        and imgui.InputText ~= nil
end

-- A single line where the player writes a note about the quest or mission.
-- It is saved as it is typed.
local function draw_note_input(kind, selected, width)
    if not notes_enabled() then
        return
    end

    local key = kind .. ':' .. tostring(selected.id)
        .. ':' .. tostring(selected.name)

    -- The box shows the note of the item selected now.
    if note_key ~= key then
        note_key = key
        note_buffer[1] = controller.GetNote(kind, selected)
    end

    local field_width = math.max(120, width - 24)

    imgui.SetCursorPosX(
        (imgui.GetWindowWidth() - field_width) * 0.5
    )

    imgui.PushItemWidth(field_width)

    local typed =
        imgui.InputText(
            '##JournalNote',
            note_buffer,
            (controller.personal and controller.personal.NOTE_MAX or 240) + 1
        )

    imgui.PopItemWidth()

    local active = imgui.IsItemActive()

    if active then
        note_input_active = true
    end

    if typed then
        controller.SetNote(kind, selected, note_buffer[1])
    end

    -- Hint inside the empty box.
    if note_buffer[1] == '' and not active then
        local box_x, box_y = imgui.GetItemRectMin()
        local _, box_bottom = imgui.GetItemRectMax()

        imgui.GetWindowDrawList():AddText(
            {
                box_x + 8,
                box_y
                    + (
                        (box_bottom - box_y)
                        - imgui.GetTextLineHeight()
                    ) * 0.5,
            },
            imgui.GetColorU32(colors.text_dim),
            tx('Add a note')
        )
    end
end

-- One row of three buttons under the details: pin it to the Tracker, mark it
-- as a favorite and point the compass at it. Short names (the full ones are in
-- the tooltips) and a border of its own color for each one.
local function draw_details_button(
    kind,
    selected,
    width
)
    -- The row takes the width that is really free inside the panel (its
    -- margins change with the theme); width - 24 when that is unknown.
    local row_width =
        math.max(
            120,
            width - 24
        )

    if imgui.GetContentRegionAvail ~= nil then
        local ok, avail = pcall(imgui.GetContentRegionAvail)

        if ok and type(avail) == 'number' and avail > 0 then
            row_width = math.max(120, math.floor(avail))
        end
    end

    local entries = {}

    if controller
        and controller.IsPinned
        and controller.ToggleItemPin then

        local pinned = controller.IsPinned(kind, selected)

        entries[#entries + 1] = {
            id = '##JournalPinButton',
            on = pinned,
            label = pinned and tx('Unpin') or tx('Pin'),
            tip = pinned and tx('Unpin from Tracker')
                or tx('Pin to Tracker'),
            border = colors.detail_pin,
            run = function()
                controller.ToggleItemPin(kind, selected)
            end,
        }

        if controller.IsFavorite ~= nil
            and controller.ToggleFavorite ~= nil then

            local favorite = controller.IsFavorite(kind, selected)

            entries[#entries + 1] = {
                id = '##JournalFavoriteButton',
                on = favorite,
                label = favorite and tx('Unfav') or tx('Fav'),
                tip = favorite and tx('Remove from favorites')
                    or tx('Add to favorites'),
                border = colors.detail_favorite,
                run = function()
                    controller.ToggleFavorite(kind, selected)
                end,
            }
        end
    end

    if controller
        and controller.IsCompassTarget
        and controller.ToggleCompassTarget then

        local targeted = controller.IsCompassTarget(kind, selected)

        entries[#entries + 1] = {
            id = '##JournalCompassTargetButton',
            on = targeted,
            label = targeted and tx('Stop') or tx('Compass'),
            tip = targeted and tx('Stop compass')
                or tx('Point compass here'),
            border = colors.detail_compass,
            run = function()
                controller.ToggleCompassTarget(kind, selected)
            end,
        }
    end

    if #entries == 0 then
        return
    end

    local gap = 6
    local button_width =
        math.floor((row_width - gap * (#entries - 1)) / #entries)

    imgui.SetCursorPosX(
        (
            imgui.GetWindowWidth()
            - (button_width * #entries + gap * (#entries - 1))
        ) * 0.5
    )

    for index, entry in ipairs(entries) do
        if index > 1 then
            imgui.SameLine(0, gap)
        end

        if entry.on then
            imgui.PushStyleColor(
                ImGuiCol_Button,
                colors.button_active
            )
        end

        if imgui.Button(
            entry.label .. entry.id,
            { button_width, ui_button_height }
        ) then
            entry.run()
        end

        if entry.on then
            imgui.PopStyleColor()
        end

        local min_x, min_y = imgui.GetItemRectMin()
        local max_x, max_y = imgui.GetItemRectMax()

        imgui.GetWindowDrawList():AddRect(
            { min_x, min_y },
            { max_x, max_y },
            imgui.GetColorU32(entry.border),
            4,
            0,
            2
        )

        if imgui.IsItemHovered() and imgui.SetTooltip then
            imgui.SetTooltip(entry.tip)
        end
    end
end

-- Height kept at the bottom of the details panel for the pin button. The
-- rest of the controls (tracker size, opacity, language...) are in the
-- settings window.
local function details_controls_height()
    local has_buttons =
        controller
        and ((controller.IsPinned and controller.ToggleItemPin)
            or (controller.IsCompassTarget
                and controller.ToggleCompassTarget))

    -- What the panel draws under the steps: a space, the note box (when the
    -- notes are on), another space and the row of buttons; every item also
    -- adds the spacing of the style. The real height of the note box and the
    -- spacing are read from ImGui, because they grow with the font.
    local spacing = 8

    if imgui.GetTextLineHeightWithSpacing and imgui.GetTextLineHeight then
        local with_spacing = imgui.GetTextLineHeightWithSpacing()
        local plain = imgui.GetTextLineHeight()

        if type(with_spacing) == 'number' and type(plain) == 'number'
            and with_spacing > plain then

            spacing = with_spacing - plain
        end
    end

    local note_height = ui_button_height

    if imgui.GetFrameHeight then
        local frame = imgui.GetFrameHeight()

        if type(frame) == 'number' then
            note_height = math.max(ui_button_height, frame)
        end
    end

    local height = spacing * 4 + 4

    if notes_enabled() then
        height = height + note_height
    end

    if has_buttons then
        height = height + ui_button_height
    end

    return math.floor(height)
end

-- The head of the sheet of a quest or mission: the name big and centered
-- (it wraps when it is long), the infinity sign of the repeatable ones and
-- a big green V at its right when it is completed, and the state
-- ([Active]...) centered under it.
function sheetx.quest_title(selected, status)
    local pad = imgui.GetCursorPosX()
    local avail = math.max(scaled(60), imgui.GetWindowWidth() - pad * 2)
    local done = status == 'completed'
    local repeatable = selected.repeatable == true
    local pushed = false

    if journal_font ~= nil then
        pushed = pcall(imgui.PushFont, journal_font, journal_font_size * 1.5)
    end

    local _, line_h = imgui.CalcTextSize('Ag')

    line_h = line_h or scaled(30)

    local gap = scaled(10)
    local check_size = math.floor(line_h * 1.1 + 0.5)
    local inf_w, inf_h = 0, 0

    if repeatable then
        inf_w, inf_h = icons.infinity_size(line_h)
    end

    -- What goes after the last line of the name.
    local extra = (repeatable and (gap + inf_w) or 0)
        + (done and (gap + check_size) or 0)

    -- The name in lines that fit (word by word).
    local lines, line = {}, ''

    for word in tostring(selected.name or ''):gmatch('%S+') do
        local candidate = line == '' and word or (line .. ' ' .. word)

        if line ~= '' and (imgui.CalcTextSize(candidate)) > avail - extra then
            lines[#lines + 1] = line
            line = word
        else
            line = candidate
        end
    end

    lines[#lines + 1] = line

    for index, text in ipairs(lines) do
        local last = index == #lines
        local total = (imgui.CalcTextSize(text)) + (last and extra or 0)

        imgui.SetCursorPosX(pad + math.max(0, (avail - total) * 0.5))
        imgui.TextColored(colors.gold, text)

        if last and repeatable and imgui.GetCursorScreenPos and imgui.Dummy then
            imgui.SameLine(0, gap)

            local icon_x, icon_y = imgui.GetCursorScreenPos()

            icons.draw_infinity(
                imgui.GetWindowDrawList(),
                icon_x,
                icon_y + (line_h - inf_h) * 0.5,
                inf_w,
                inf_h,
                imgui.GetColorU32(colors.repeatable),
                2.0
            )

            imgui.Dummy({ inf_w, line_h })
        end

        if last and done and imgui.GetItemRectMin and imgui.Dummy then
            imgui.SameLine(0, gap)
            imgui.Dummy({ check_size, line_h })

            local check_x, check_y = imgui.GetItemRectMin()

            icons.draw_check(
                imgui.GetWindowDrawList(),
                check_x,
                check_y + (line_h - check_size) * 0.5,
                check_size,
                imgui.GetColorU32(colors.leaf)
            )
        end
    end

    if pushed then
        imgui.PopFont()
    end

    local label, color = get_status_display(status)

    label = '[' .. label .. ']'

    imgui.SetCursorPosX(pad + math.max(0, (avail - (imgui.CalcTextSize(label))) * 0.5))
    imgui.TextColored(color, label)
end

local function draw_details_panel(
    kind,
    width,
    area
)
    imgui.PushStyleColor(
        ImGuiCol_ChildBg,
        transparent
    )

    local selected =
        kind == 'Mission'
        and controller.GetSelectedMission()
        or controller.GetSelectedQuest()

    if imgui.BeginChild(
        '##Journal'
            .. kind
            .. 'Details',
        {
            width,
            -1,
        },
        child_border
    ) then
        local draw =
            imgui.GetWindowDrawList()

        local x, y =
            imgui.GetWindowPos()

        local w, h =
            imgui.GetWindowSize()

        draw_panel(
            draw,
            x,
            y,
            w,
            h,
            true
        )

        if selected then
            local steps =
                selected.steps
                or {}

            if kind == 'Mission'
                and area then

                local cover =
                    load_journal_cover(
                        selected.area or area
                    )

                if cover then
                    -- 20 % of the width (half of what it was), so the
                    -- objectives have room.
                    local cover_width =
                        math.floor(
                            (width - 24) * 0.2
                        )

                    local ratio = 1.0

                    if cover.width
                        and cover.height
                        and cover.height > 0 then

                        ratio =
                            cover.width
                            / cover.height
                    end

                    draw_journal_cover(
                        cover,
                        cover_width,
                        math.floor(
                            cover_width
                            / ratio
                        )
                    )

                    imgui.Spacing()
                end
            end

            sheetx.quest_title(selected, display_status(selected))

            imgui.Spacing()

            if kind == 'Quest' then
                draw_metadata(
                    selected
                )

                imgui.Spacing()
            elseif kind == 'Mission' then
                draw_mission_info(
                    selected
                )

                imgui.Spacing()
            end

            imgui.Separator()
            imgui.Spacing()

            imgui.TextColored(
                colors.text,
                tx('Objectives')
            )

            -- A completed quest or mission keeps its steps as they are.
            local steps_locked =
                display_status(selected) == 'completed'

            -- How many steps are done, and a button to start over.
            if #steps > 0
                and selected.id ~= nil
                and controller.GetStepMarks
                and controller.ClearStepMarks then

                local _, done_count =
                    controller.GetStepMarks(
                        kind,
                        selected.id,
                        selected.name,
                        steps
                    )

                if steps_locked then
                    done_count = #steps
                end

                imgui.SameLine(0, 10)

                imgui.TextColored(
                    colors.text_dim,
                    string.format('(%d/%d)', done_count, #steps)
                )

                if done_count > 0 and not steps_locked then
                    imgui.SameLine(0, 12)

                    if imgui.SmallButton(
                        tx('Reset steps') .. '##reset_steps'
                    ) then
                        controller.ClearStepMarks(
                            kind,
                            selected.id,
                            selected.name
                        )
                    end
                end
            end

            imgui.Spacing()

            draw_steps(
                steps,
                '##Journal'
                    .. kind
                    .. 'Steps',
                tx('No objectives available.'),
                details_controls_height(),
                kind,
                selected.id,
                selected.name,
                steps_locked
            )

            imgui.Spacing()

            draw_note_input(
                kind,
                selected,
                width
            )

            imgui.Spacing()

            draw_details_button(
                kind,
                selected,
                width
            )
        else
            imgui.TextColored(
                colors.text_dim,
                (kind == 'Mission' and tx('No mission selected.') or tx('No quest selected.'))
            )
        end
    end

    imgui.EndChild()

    imgui.PopStyleColor()
end

local function get_journal_context(
    is_mission_mode
)
    if is_mission_mode then
        local areas =
            controller.GetMissionAreas()

        local names =
            controller.GetMissionAreaNames()

        local selection =
            controller.GetMissionSelection()

        local area =
            areas[
                selection.area_index
            ]

        return areas,
            names,
            selection,
            area,
            'Questline',
            names[area] or ''
    end

    local categories =
        controller.GetQuestCategories()

    local names =
        controller.GetQuestCategoryNames()

    local selection =
        controller.GetQuestSelection()

    local category =
        categories[
            selection.category_index
        ]

    return categories,
        names,
        selection,
        category,
        'Region',
        names[category] or ''
end

-- A button of the area and category popups. A nation uses its own color,
-- every other entry the standard button color. The selected entry gets a
-- light frame.
local function draw_selector_button(
    text,
    selected,
    tint
)
    imgui.PushStyleColor(
        ImGuiCol_Text,
        transparent
    )

    local clicked =
        imgui.Selectable(
            text,
            selected
        )

    local hovered =
        imgui.IsItemHovered()

    imgui.PopStyleColor()

    local draw =
        imgui.GetWindowDrawList()

    local min_x, min_y =
        imgui.GetItemRectMin()

    local max_x, max_y =
        imgui.GetItemRectMax()

    local fill =
        tint and tint.fill
        or colors.button

    if hovered then
        fill =
            tint and lighten(fill, 0.06)
            or colors.button_hover
    end

    local top_left = { min_x + 2, min_y + 1 }
    local bottom_right = { max_x - 2, max_y - 1 }

    draw:AddRectFilled(
        top_left,
        bottom_right,
        imgui.GetColorU32(fill),
        2
    )

    draw:AddRect(
        top_left,
        bottom_right,
        imgui.GetColorU32(
            tint and tint.border
            or colors.frame
        ),
        2,
        0,
        1
    )

    if selected then
        draw:AddRect(
            top_left,
            bottom_right,
            imgui.GetColorU32(
                colors.text
            ),
            2,
            0,
            2
        )
    end

    draw:AddText(
        {
            min_x + 14,
            min_y
                + (
                    (max_y - min_y)
                    - imgui.GetTextLineHeight()
                ) * 0.5,
        },
        imgui.GetColorU32(
            tint and colors.on_tint
            or colors.text
        ),
        text
    )

    return clicked
end

local function selector_popup_width(
    items,
    names
)
    local max_width = 0

    for _, item in ipairs(items) do
        max_width =
            math.max(
                max_width,
                imgui.CalcTextSize(
                    tostring(
                        names[item]
                            or item
                    )
                )
            )
    end

    return max_width + 58
end

-- " (30% 26/85)": share of completed entries, rounded down.
local function format_progress(done, total)
    if total == nil or total <= 0 then
        return ''
    end

    return string.format(
        ' (%d%% %d/%d)',
        math.floor(done * 100 / total),
        done,
        total
    )
end

-- Name of every area or category followed by its progress.
local function get_area_labels(
    is_mission_mode,
    items,
    names
)
    local labels = {}

    for _, item in ipairs(items) do
        local done, total = 0, 0

        if is_mission_mode then
            if controller.GetMissionProgress then
                done, total =
                    controller.GetMissionProgress(item)
            end
        elseif controller.GetQuestProgress then
            done, total =
                controller.GetQuestProgress(item)
        end

        labels[item] =
            tostring(names[item] or item)
            .. format_progress(done, total)
    end

    return labels
end

local function draw_selector_popup(
    popup_id,
    items,
    names,
    selected_index,
    on_select,
    footer,
    headers
)
    local popup_width = selector_popup_width(items, names)

    -- Types: a title above the first item of each one.
    for _, title in pairs(headers or {}) do
        popup_width = math.max(
            popup_width,
            (imgui.CalcTextSize(tx(title))) + 28
        )
    end

    imgui.SetNextWindowSize({ popup_width, 0 })

    if not imgui.BeginPopup(
        popup_id
    ) then
        return false
    end

    for i, item in ipairs(items) do
        if headers ~= nil and headers[item] ~= nil then
            if i > 1 then
                imgui.Spacing()
            end

            imgui.TextColored(colors.gold, tx(headers[item]))
        end

        if draw_selector_button(
            tostring(
                names[item]
                    or item
            ),
            i == selected_index,
            area_colors[item]
        ) then
            on_select(i)
            imgui.CloseCurrentPopup()
        end
    end

    if footer ~= nil and footer ~= '' then
        imgui.Spacing()
        imgui.TextColored(colors.text_dim, footer)
    end

    imgui.EndPopup()

    return true
end

-- One button of the Missions / Quests switch. The active one is filled,
-- the other is plain text.
local function toolbar_mode_button(
    label,
    active,
    width,
    tint,
    light,
    fixed
)
    -- With a tint the button has its own color: solid when it is the
    -- active one, a dark shade of it (and tinted text) when it is not.
    local fill, hover, pressed, text

    if type(fixed) == 'table' then
        -- Its own colors in every theme: { fill, hover, pressed, text }.
        fill, hover, pressed, text = fixed[1], fixed[2], fixed[3], fixed[4]
    elseif type(light) == 'table' and theme.Get() == 'legacy' then
        -- A button that gives a pale color (the folders and the defeated
        -- monsters of the monster list) is very light in the Legacy theme,
        -- with the dark ink of the pages.
        local function shade(amount)
            return {
                light[1] * amount, light[2] * amount, light[3] * amount, 1,
            }
        end

        fill = active and shade(0.84) or shade(1.0)
        hover = shade(active and 0.78 or 0.92)
        pressed = shade(0.72)
        text = colors.text
    elseif tint ~= nil then
        local function shade(amount)
            return { tint[1] * amount, tint[2] * amount, tint[3] * amount, 1 }
        end

        fill = active and tint or shade(0.30)
        hover = active and lighten(tint, 0.08) or shade(0.42)
        pressed = active and shade(0.85) or shade(0.50)
        text = active and { 0.08, 0.09, 0.13, 1.00 } or tint
    else
        fill = active and colors.button_active or transparent
        hover = colors.button_hover
        pressed = colors.button_active
        text = active and colors.text or colors.text_dim
    end

    imgui.PushStyleColor(ImGuiCol_Button, fill)
    imgui.PushStyleColor(ImGuiCol_ButtonHovered, hover)
    imgui.PushStyleColor(ImGuiCol_ButtonActive, pressed)
    imgui.PushStyleColor(ImGuiCol_Text, text)

    local clicked =
        imgui.Button(
            label,
            {
                width,
                ui_button_height,
            }
        )

    imgui.PopStyleColor(4)

    return clicked
end

-- The only bar at the top of the Journal: Missions / Quests on the left,
-- then the questline or region selector, with a thin line underneath.
-- The two small buttons at the right corner of the Journal: show or hide the
-- bar, and close. The bar starts hidden every time the Journal is opened.
sheetx.toolbar_open = false

-- The search box lives in the bar: with the bar hidden a search that is still
-- on would filter the list with no box to see or clear it, so the search is
-- cleared whenever the bar goes away.
function sheetx.clear_search()
    journal_search_buffer[1] = ''

    if controller
        and controller.SetSearchText
        and controller.GetSearchText
        and controller.GetSearchText() ~= '' then

        controller.SetSearchText('')
    end
end

function sheetx.corner_buttons()
    local size = ui_button_height

    if imgui.Button('##JournalBarToggle', { size, size }) then
        sheetx.toolbar_open = not sheetx.toolbar_open

        if not sheetx.toolbar_open then
            sheetx.clear_search()
        end
    end

    local min_x, min_y = imgui.GetItemRectMin()
    local max_x, max_y = imgui.GetItemRectMax()
    local mid_x = (min_x + max_x) * 0.5
    local mid_y = (min_y + max_y) * 0.5
    local color = imgui.GetColorU32(colors.text)

    -- A triangle: down to show the bar, up to hide it.
    if sheetx.toolbar_open then
        imgui.GetWindowDrawList():AddTriangleFilled(
            { mid_x - 7, mid_y + 4 },
            { mid_x + 7, mid_y + 4 },
            { mid_x, mid_y - 5 },
            color
        )
    else
        imgui.GetWindowDrawList():AddTriangleFilled(
            { mid_x - 7, mid_y - 4 },
            { mid_x + 7, mid_y - 4 },
            { mid_x, mid_y + 5 },
            color
        )
    end

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(
            sheetx.toolbar_open and tx('Hide the bar') or tx('Show the bar')
        )
    end

    imgui.SameLine(0, 8)

    if imgui.Button('X##JournalClose', { size, size }) then
        sheetx.close_requested = true
    end

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(tx('Close'))
    end
end

-- The entries of the menu (the guide, the camps, the fame): the same list in
-- the bar and in the corner when the bar is hidden.
function sheetx.menu_entries()
    local menu_entries = {}

    if controller.ToggleGuide then
        menu_entries[#menu_entries + 1] = {
            id = 'Guide',
            label = tx('New adventurer guide'),
            icon = 'sprout',
            open = controller.GetGuideOpen
                and controller.GetGuideOpen() or false,
            toggle = controller.ToggleGuide,
        }
    end

    if controller.ToggleCamps then
        menu_entries[#menu_entries + 1] = {
            id = 'Camps',
            label = tx('Camps'),
            tip = tx('Camps: where to gain experience'),
            icon = 'question',
            open = controller.GetCampsOpen
                and controller.GetCampsOpen() or false,
            toggle = controller.ToggleCamps,
        }
    end

    if controller.ToggleFame then
        menu_entries[#menu_entries + 1] = {
            id = 'Fame',
            label = tx('Fame'),
            tip = tx('Fame of the nations'),
            icon = 'star',
            open = controller.GetFameOpen
                and controller.GetFameOpen() or false,
            toggle = controller.ToggleFame,
        }
    end

    -- The windows that also have a button in the bar.
    if controller.monsters ~= nil and icons.draw_monster ~= nil then
        menu_entries[#menu_entries + 1] = {
            id = 'Monsters',
            label = tx("Vana'dex (BETA)"),
            tip = tx("Vana'dex (BETA): search monsters and see their sheet"),
            icon = 'monster',
            open = controller.monsters.GetOpen(),
            toggle = controller.monsters.Toggle,
        }
    end

    if controller.items ~= nil then
        menu_entries[#menu_entries + 1] = {
            id = 'Items',
            label = tx('Item catalog (BETA)'),
            tip = tx('Item catalog (BETA): search any item and see its sheet'),
            icon = 'box',
            open = controller.items.GetOpen(),
            toggle = controller.items.Toggle,
        }
    end

    if controller.chat ~= nil and icons.draw_chat ~= nil then
        menu_entries[#menu_entries + 1] = {
            id = 'Chat',
            label = tx('Chat'),
            icon = 'chat',
            open = controller.chat.GetOpen(),
            toggle = controller.chat.Toggle,
            unread = controller.chat.HasUnread and controller.chat.HasUnread() or false,
        }
    end

    if controller.notes ~= nil then
        menu_entries[#menu_entries + 1] = {
            id = 'Notes',
            label = tx('General notes'),
            icon = 'postit',
            open = controller.notes.GetOpen(),
            toggle = controller.notes.Toggle,
        }
    end

    if controller.zonelist ~= nil then
        menu_entries[#menu_entries + 1] = {
            id = 'Zones',
            label = tx('Zones by region'),
            icon = 'globe',
            open = controller.zonelist.GetOpen(),
            toggle = controller.zonelist.Toggle,
        }
    end

    return menu_entries
end

-- The button of the menu (three lines); it opens the list.
function sheetx.menu_button()
    if imgui.Button(
        '##JournalMenuButton',
        { ui_button_height, ui_button_height }
    ) then
        imgui.OpenPopup('##JournalMenuPopup')
    end

    local mb_min_x, mb_min_y = imgui.GetItemRectMin()
    local mb_max_x, mb_max_y = imgui.GetItemRectMax()
    local mb_w = mb_max_x - mb_min_x
    local mb_h = mb_max_y - mb_min_y
    local mb_draw = imgui.GetWindowDrawList()

    for line = -1, 1 do
        local line_y = mb_min_y + mb_h * 0.5 + line * mb_h * 0.18

        mb_draw:AddLine(
            { mb_min_x + mb_w * 0.28, line_y },
            { mb_max_x - mb_w * 0.28, line_y },
            imgui.GetColorU32(colors.text),
            2
        )
    end

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(tx('Menu'))
    end
end

-- The list of the menu (a popup): one row for each function.
function sheetx.menu_popup(menu_entries)
    -- The list of the menu: one row for each function (its icon and its
    -- name). The one whose window is open is shown pressed.
    if #menu_entries > 0 and imgui.BeginPopup('##JournalMenuPopup') then
        local row_icon = ui_button_height * 0.62
        local row_width = 0

        for _, entry in ipairs(menu_entries) do
            row_width = math.max(
                row_width,
                (imgui.CalcTextSize(entry.label))
            )
        end

        row_width = row_width + (row_icon + 24) * 2

        for _, entry in ipairs(menu_entries) do
            if entry.open then
                imgui.PushStyleColor(
                    ImGuiCol_Button,
                    colors.button_active
                )
            end

            local row_clicked = imgui.Button(
                entry.label .. '##JournalMenu' .. entry.id,
                { row_width, ui_button_height }
            )

            if entry.open then
                imgui.PopStyleColor()
            end

            local r_min_x, r_min_y = imgui.GetItemRectMin()
            local r_max_x, r_max_y = imgui.GetItemRectMax()
            local r_draw = imgui.GetWindowDrawList()
            local r_x = r_min_x + 12
            local r_y = r_min_y + ((r_max_y - r_min_y) - row_icon) * 0.5

            if entry.icon == 'sprout' then
                icons.draw_sprout(
                    r_draw, r_x, r_y, row_icon,
                    imgui.GetColorU32(colors.leaf),
                    imgui.GetColorU32(colors.leaf_2),
                    imgui.GetColorU32(colors.stem)
                )
            elseif entry.icon == 'question' then
                icons.draw_question(
                    r_draw, r_x, r_y, row_icon,
                    imgui.GetColorU32(colors.camps_red)
                )
            elseif entry.icon == 'star' then
                -- The icon of the Fame Checkers; the star drawn with
                -- lines when there is no image.
                local fame_icon = controller.worldmark
                    and controller.worldmark.GetIcon
                    and controller.worldmark.GetIcon('fame')
                local image_drawn = false

                if fame_icon ~= nil then
                    image_drawn = pcall(function()
                        r_draw:AddImage(
                            fame_icon.id,
                            { r_x, r_y },
                            {
                                r_x + row_icon * fame_icon.width
                                    / fame_icon.height,
                                r_y + row_icon,
                            },
                            { 0, 0 },
                            { 1, 1 },
                            imgui.GetColorU32({ 1, 1, 1, 1 })
                        )
                    end)
                end

                -- Five-point star, drawn with lines.
                local cx = r_x + row_icon * 0.5
                local cy = r_y + row_icon * 0.53
                local rad = row_icon * 0.5
                local star_color = imgui.GetColorU32(colors.favorite)
                local points = {}

                for k = 0, 4 do
                    local ang = -math.pi / 2 + k * (2 * math.pi / 5)
                    points[k] = {
                        cx + math.cos(ang) * rad,
                        cy + math.sin(ang) * rad,
                    }
                end

                for k = 0, image_drawn and -1 or 4 do
                    local p1 = points[k]
                    local p2 = points[(k + 2) % 5]

                    r_draw:AddLine(
                        { p1[1], p1[2] }, { p2[1], p2[2] },
                        star_color, math.max(1.5, row_icon * 0.09)
                    )
                end
            end

            if entry.icon == 'monster' then
                icons.draw_monster(
                    r_draw, r_x, r_y, row_icon, imgui.GetColorU32(colors.text)
                )
            elseif entry.icon == 'postit' then
                icons.draw_postit(
                    r_draw, r_x, r_y, row_icon,
                    imgui.GetColorU32({ 1.0, 0.86, 0.35, 1.0 }),
                    imgui.GetColorU32({ 0.80, 0.62, 0.15, 1.0 }),
                    imgui.GetColorU32({ 0.45, 0.33, 0.08, 1.0 })
                )
            elseif entry.icon == 'box' and icons.draw_box ~= nil then
                icons.draw_box(
                    r_draw, r_x, r_y, row_icon,
                    imgui.GetColorU32({ 0.62, 0.42, 0.20, 1 }),
                    imgui.GetColorU32({ 0.78, 0.55, 0.26, 1 }),
                    imgui.GetColorU32({ 0.28, 0.18, 0.08, 1 })
                )
            elseif entry.icon == 'globe' then
                icons.draw_globe(
                    r_draw, r_x, r_y, row_icon, imgui.GetColorU32(colors.text)
                )
            elseif entry.icon == 'chat' then
                -- The Moogle icon, when the file is there; the bubble if not.
                local chat_icon = controller.worldmark
                    and controller.worldmark.GetIcon
                    and controller.worldmark.GetIcon('chat')
                local drawn = false

                if chat_icon ~= nil then
                    drawn = pcall(function()
                        r_draw:AddImage(
                            chat_icon.id,
                            { r_x, r_y },
                            { r_x + row_icon, r_y + row_icon },
                            { 0, 0 },
                            { 1, 1 },
                            imgui.GetColorU32({ 1, 1, 1, 1 })
                        )
                    end)
                end

                if not drawn then
                    icons.draw_chat(
                        r_draw, r_x, r_y, row_icon,
                        imgui.GetColorU32(entry.unread and colors.favorite or colors.text)
                    )
                end
            end

            if entry.tip and imgui.IsItemHovered()
                and imgui.SetTooltip then

                imgui.SetTooltip(entry.tip)
            end

            if row_clicked then
                entry.toggle()
                imgui.CloseCurrentPopup()
            end
        end

        imgui.EndPopup()
    end
end

local function draw_journal_toolbar(
    is_mission_mode
)
    -- Hidden: the two buttons of the corner and, at their left, the menu
    -- (three lines): its list opens without showing the bar.
    if not sheetx.toolbar_open then
        imgui.PushStyleColor(ImGuiCol_ChildBg, transparent)

        if imgui.BeginChild(
            '##JournalToolbar',
            { -1, ui_bar_height },
            false,
            ImGuiWindowFlags_NoScrollbar
                + ImGuiWindowFlags_NoScrollWithMouse
        ) then
            local corner_entries = sheetx.menu_entries()
            local corner_w = ui_button_height * 2 + 8

            if #corner_entries > 0 then
                corner_w = corner_w + ui_button_height + 8
            end

            imgui.SetCursorPosY(6)

            imgui.SetCursorPosX(
                math.max(0, imgui.GetWindowWidth() - corner_w - 14)
            )

            if #corner_entries > 0 then
                sheetx.menu_button()
                imgui.SameLine(0, 8)
            end

            sheetx.corner_buttons()
            sheetx.menu_popup(corner_entries)
        end

        imgui.EndChild()

        imgui.PopStyleColor()

        return
    end

    local _, _, _, _, _, value =
        get_journal_context(
            is_mission_mode
        )

    imgui.PushStyleColor(
        ImGuiCol_ChildBg,
        transparent
    )

    if imgui.BeginChild(
        '##JournalToolbar',
        {
            -1,
            ui_bar_height,
        },
        false,
        ImGuiWindowFlags_NoScrollbar
            + ImGuiWindowFlags_NoScrollWithMouse
    ) then
        local draw =
            imgui.GetWindowDrawList()

        local x, y =
            imgui.GetWindowPos()

        local w, h =
            imgui.GetWindowSize()

        draw:AddLine(
            { x, y + h - 0.5 },
            { x + w, y + h - 0.5 },
            imgui.GetColorU32(
                colors.frame
            ),
            1
        )

        imgui.SetCursorPosY(6)

        local missions_width =
            imgui.CalcTextSize(tx('Missions'))
            + 36

        local quests_width =
            imgui.CalcTextSize(tx('Quests'))
            + 36

        if toolbar_mode_button(
            tx('Missions##JournalModeMissions'),
            is_mission_mode,
            missions_width,
            colors.mode_mission
        ) and not is_mission_mode then
            controller.SetJournalMode(1)
        end

        imgui.SameLine(0, 4)

        if toolbar_mode_button(
            tx('Quests##JournalModeQuests'),
            not is_mission_mode,
            quests_width,
            colors.mode_quest
        ) and is_mission_mode then
            controller.SetJournalMode(2)
        end

        imgui.SameLine(0, 24)

        local items,
        names,
        index

        if is_mission_mode then
            items =
                controller.GetMissionAreas()

            names =
                controller.GetMissionAreaNames()

            index =
                controller.GetMissionSelection()
                    .area_index
        else
            items =
                controller.GetQuestCategories()

            names =
                controller.GetQuestCategoryNames()

            index =
                controller.GetQuestSelection()
                    .category_index
        end

        local labels =
            get_area_labels(
                is_mission_mode,
                items,
                names
            )

        local area_width =
            selector_popup_width(
                items,
                labels
            ) + 28

        -- The button takes the color of the current nation.
        local tint =
            area_colors[items[index]]

        if tint then
            imgui.PushStyleColor(
                ImGuiCol_Button,
                tint.fill
            )

            imgui.PushStyleColor(
                ImGuiCol_ButtonHovered,
                lighten(tint.fill, 0.06)
            )

            imgui.PushStyleColor(
                ImGuiCol_ButtonActive,
                lighten(tint.fill, 0.12)
            )

            imgui.PushStyleColor(
                ImGuiCol_Text,
                colors.on_tint
            )
        end

        local area_clicked =
            imgui.Button(
                (labels[items[index]] or value)
                    .. '##JournalAreaButton',
                {
                    area_width,
                    ui_button_height,
                }
            )

        if tint then
            imgui.PopStyleColor(4)
        end

        if area_clicked then
            if is_mission_mode then
                journal_area_popup_open =
                    true

                imgui.OpenPopup(
                    '##JournalAreaPopup'
                )
            else
                journal_category_popup_open =
                    true

                imgui.OpenPopup(
                    '##JournalCategoryPopup'
                )
            end
        end

        -- Small down arrow at the right edge of the selector button.
        local min_x, min_y =
            imgui.GetItemRectMin()

        local max_x, max_y =
            imgui.GetItemRectMax()

        local arrow_x = max_x - 16
        local arrow_y =
            (min_y + max_y) * 0.5

        draw:AddTriangleFilled(
            { arrow_x - 4, arrow_y - 2 },
            { arrow_x + 4, arrow_y - 2 },
            { arrow_x, arrow_y + 3 },
            imgui.GetColorU32(
                tint and colors.on_tint
                or colors.text_dim
            )
        )

        -- Opens the settings window.
        local settings_width = 0

        if controller.ToggleSettings then
            settings_width =
                imgui.CalcTextSize(tx('Settings')) + 28
        end

        -- Opens the Active Now window: the active quests and missions, and
        -- the favorites.
        local active_width = 0

        if controller.GetActiveOpen and controller.SetActiveOpen then
            imgui.SameLine(0, 8)

            active_width =
                imgui.CalcTextSize(tx('Active Now')) + 28

            local window_open = controller.GetActiveOpen()

            if window_open then
                imgui.PushStyleColor(
                    ImGuiCol_Button,
                    colors.button_active
                )
            end

            if imgui.Button(
                tx('Active Now') .. '##JournalActiveButton',
                { active_width, ui_button_height }
            ) then
                controller.SetActiveOpen(not window_open)
            end

            if window_open then
                imgui.PopStyleColor()
            end

            -- Green border that pulses: brighter and thicker while the
            -- window is open.
            local pulse =
                (math.sin(os.clock() * 3.0) + 1.0) * 0.5

            local an_min_x, an_min_y = imgui.GetItemRectMin()
            local an_max_x, an_max_y = imgui.GetItemRectMax()

            imgui.GetWindowDrawList():AddRect(
                { an_min_x, an_min_y },
                { an_max_x, an_max_y },
                imgui.GetColorU32({
                    colors.active_border[1],
                    colors.active_border[2],
                    colors.active_border[3],
                    (window_open and 0.70 or 0.40) + 0.30 * pulse,
                }),
                2,
                0,
                window_open and 2.5 or (1.5 + pulse)
            )

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(
                    tx('Active quests and missions, and your favorites')
                )
            end
        end

        -- The menu groups the guide, the camps and the functions to come.
        -- Its button sits at the right corner, left of Settings.
        local menu_entries = sheetx.menu_entries()

        local menu_width = 0

        if #menu_entries > 0 then
            menu_width = ui_button_height + 8
        end

        -- Shows or hides the compass window: a button with a compass.
        local compass_width = 0

        if controller.GetCompassOpen and controller.SetCompassOpen then
            imgui.SameLine(0, 8)

            compass_width = ui_button_height

            local compass_open = controller.GetCompassOpen()

            if compass_open then
                imgui.PushStyleColor(
                    ImGuiCol_Button,
                    colors.button_active
                )
            end

            if imgui.Button(
                '##JournalCompassButton',
                { compass_width, ui_button_height }
            ) then
                controller.SetCompassOpen(not compass_open)
            end

            if compass_open then
                imgui.PopStyleColor()
            end

            local min_x, min_y = imgui.GetItemRectMin()
            local max_x, max_y = imgui.GetItemRectMax()
            local size = (max_y - min_y) * 0.68

            icons.draw_compass(
                imgui.GetWindowDrawList(),
                min_x + ((max_x - min_x) - size) * 0.5,
                min_y + ((max_y - min_y) - size) * 0.5,
                size,
                imgui.GetColorU32(colors.active_status),
                imgui.GetColorU32(colors.camps_red),
                imgui.GetColorU32(colors.text)
            )

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Compass: show or hide'))
            end
        end

        -- Shows or hides the list of the zones by region: a button with a
        -- globe, beside the compass.
        sheetx.zones_w = 0

        if controller.zonelist ~= nil then
            imgui.SameLine(0, 8)

            sheetx.zones_w = ui_button_height

            local zones_open = controller.zonelist.GetOpen()

            if zones_open then
                imgui.PushStyleColor(
                    ImGuiCol_Button,
                    colors.button_active
                )
            end

            if imgui.Button(
                '##JournalZonesButton',
                { sheetx.zones_w, ui_button_height }
            ) then
                controller.zonelist.Toggle()
            end

            if zones_open then
                imgui.PopStyleColor()
            end

            local min_x, min_y = imgui.GetItemRectMin()
            local max_x, max_y = imgui.GetItemRectMax()
            local size = (max_y - min_y) * 0.68

            icons.draw_globe(
                imgui.GetWindowDrawList(),
                min_x + ((max_x - min_x) - size) * 0.5,
                min_y + ((max_y - min_y) - size) * 0.5,
                size,
                imgui.GetColorU32(colors.text)
            )

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Zones by region'))
            end
        end

        -- Opens the general notes: a button with a sticky note.
        notesx.btn_w = 0

        if controller.notes ~= nil then
            imgui.SameLine(0, 8)

            notesx.btn_w = ui_button_height

            local notes_open = controller.notes.GetOpen()

            if notes_open then
                imgui.PushStyleColor(
                    ImGuiCol_Button,
                    colors.button_active
                )
            end

            if imgui.Button(
                '##JournalNotesButton',
                { notesx.btn_w, ui_button_height }
            ) then
                controller.notes.Toggle()
            end

            if notes_open then
                imgui.PopStyleColor()
            end

            local min_x, min_y = imgui.GetItemRectMin()
            local max_x, max_y = imgui.GetItemRectMax()
            local size = (max_y - min_y) * 0.62

            icons.draw_postit(
                imgui.GetWindowDrawList(),
                min_x + ((max_x - min_x) - size) * 0.5,
                min_y + ((max_y - min_y) - size) * 0.5,
                size,
                imgui.GetColorU32({ 1.0, 0.86, 0.35, 1.0 }),
                imgui.GetColorU32({ 0.80, 0.62, 0.15, 1.0 }),
                imgui.GetColorU32({ 0.45, 0.33, 0.08, 1.0 })
            )

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('General notes'))
            end
        end

        -- Opens the chat window: a button with a speech bubble.
        sheetx.chat_w = 0

        if controller.chat ~= nil and icons.draw_chat ~= nil then
            imgui.SameLine(0, 8)

            sheetx.chat_w = ui_button_height

            local chat_open = controller.chat.GetOpen()

            if chat_open then
                imgui.PushStyleColor(
                    ImGuiCol_Button,
                    colors.button_active
                )
            end

            if imgui.Button(
                '##JournalChatButton',
                { sheetx.chat_w, ui_button_height }
            ) then
                controller.chat.Toggle()
            end

            if chat_open then
                imgui.PopStyleColor()
            end

            local min_x, min_y = imgui.GetItemRectMin()
            local max_x, max_y = imgui.GetItemRectMax()
            local size = (max_y - min_y) * 0.66
            local unread = controller.chat.HasUnread
                and controller.chat.HasUnread()
            local chat_icon = controller.worldmark
                and controller.worldmark.GetIcon
                and controller.worldmark.GetIcon('chat')
            local drawn = false

            -- The Moogle icon, when the file is there.
            if chat_icon ~= nil then
                local pad = (max_y - min_y) * 0.10

                drawn = pcall(function()
                    imgui.GetWindowDrawList():AddImage(
                        chat_icon.id,
                        { min_x + pad, min_y + pad },
                        { max_x - pad, max_y - pad },
                        { 0, 0 },
                        { 1, 1 },
                        imgui.GetColorU32({ 1, 1, 1, 1 })
                    )
                end)
            end

            if not drawn then
                icons.draw_chat(
                    imgui.GetWindowDrawList(),
                    min_x + ((max_x - min_x) - size) * 0.5,
                    min_y + ((max_y - min_y) - size) * 0.5,
                    size,
                    -- Another color while there are messages not read yet.
                    imgui.GetColorU32(unread and colors.favorite or colors.text)
                )
            end

            sheetx.chat_badge(min_x, min_y, max_x, max_y)

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Chat'))
            end
        end

        -- Opens the monster search: a button with a monster face, beside
        -- the chat.
        sheetx.mon_w = 0

        if controller.monsters ~= nil and icons.draw_monster ~= nil then
            imgui.SameLine(0, 8)

            sheetx.mon_w = ui_button_height

            local mon_open = controller.monsters.GetOpen()

            if mon_open then
                imgui.PushStyleColor(ImGuiCol_Button, colors.button_active)
            end

            if imgui.Button(
                '##JournalMonstersButton',
                { sheetx.mon_w, ui_button_height }
            ) then
                controller.monsters.Toggle()
            end

            if mon_open then
                imgui.PopStyleColor()
            end

            local m_min_x, m_min_y = imgui.GetItemRectMin()
            local m_max_x, m_max_y = imgui.GetItemRectMax()
            local m_size = (m_max_y - m_min_y) * 0.66

            icons.draw_monster(
                imgui.GetWindowDrawList(),
                m_min_x + ((m_max_x - m_min_x) - m_size) * 0.5,
                m_min_y + ((m_max_y - m_min_y) - m_size) * 0.5,
                m_size,
                imgui.GetColorU32(colors.text)
            )

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx("Vana'dex (BETA): search monsters and see their sheet"))
            end
        end

        -- Search box: filters the list by name.
        if controller.SetSearchText then
            imgui.SameLine(0, 24)

            local search_width =
                math.max(
                    160,
                    math.min(
                        420,
                        imgui.GetWindowWidth()
                            - missions_width
                            - quests_width
                            - area_width
                            - settings_width
                            - active_width
                            - menu_width
                            - compass_width
                            - sheetx.zones_w
                            - notesx.btn_w
                            - sheetx.chat_w
                            - (sheetx.chat_w > 0 and 8 or 0)
                            - sheetx.mon_w
                            - (sheetx.mon_w > 0 and 8 or 0)
                            - (ui_button_height + 8) * 2
                            - 190
                    )
                )

            imgui.PushItemWidth(search_width)

            -- A jump from a link clears the text of the search in the
            -- controller; the box follows.
            if controller.GetSearchText
                and controller.GetSearchText() == ''
                and journal_search_buffer[1] ~= ''
                and not journal_search_active then

                journal_search_buffer[1] = ''
            end

            local typed =
                imgui.InputText(
                    '##JournalSearch',
                    journal_search_buffer,
                    64
                )

            imgui.PopItemWidth()

            journal_search_active =
                imgui.IsItemActive()

            if typed then
                controller.SetSearchText(
                    journal_search_buffer[1]
                )
            end

            -- Hint inside the empty box.
            if journal_search_buffer[1] == ''
                and not journal_search_active then

                local box_x, box_y =
                    imgui.GetItemRectMin()

                local _, box_bottom =
                    imgui.GetItemRectMax()

                draw:AddText(
                    {
                        box_x + 8,
                        box_y
                            + (
                                (box_bottom - box_y)
                                - imgui.GetTextLineHeight()
                            ) * 0.5,
                    },
                    imgui.GetColorU32(
                        colors.text_dim
                    ),
                    tx('Search')
                )
            end

            if journal_search_buffer[1] ~= '' then
                imgui.SameLine(0, 4)

                if imgui.Button(
                    'x##JournalSearchClear',
                    {
                        ui_button_height,
                        ui_button_height,
                    }
                ) then
                    journal_search_buffer[1] = ''
                    controller.SetSearchText('')
                end
            end
        end

        -- The menu button (three lines) and its list, then the settings
        -- window button: gray, both at the right corner of the
        -- bar, next to the search box.
        if controller.ToggleSettings or #menu_entries > 0 then
            local target_x =
                imgui.GetWindowWidth() - settings_width - menu_width - 14
                - (ui_button_height + 8) * 2

            if imgui.GetCursorPosX then
                target_x =
                    math.max(target_x, imgui.GetCursorPosX() + 8)
            end

            imgui.SameLine(target_x, 0)
        end

        if #menu_entries > 0 then
            sheetx.menu_button()

            if settings_width > 0 then
                imgui.SameLine(0, 8)
            end
        end

        if controller.ToggleSettings then
            imgui.PushStyleColor(
                ImGuiCol_Button,
                colors.settings_fill
            )

            imgui.PushStyleColor(
                ImGuiCol_ButtonHovered,
                colors.settings_hover
            )

            imgui.PushStyleColor(
                ImGuiCol_ButtonActive,
                colors.settings_active
            )

            imgui.PushStyleColor(
                ImGuiCol_Text,
                colors.settings_text
            )

            local settings_clicked =
                imgui.Button(
                    tx('Settings') .. '##JournalSettingsButton',
                    {
                        settings_width,
                        ui_button_height,
                    }
                )

            imgui.PopStyleColor(4)

            -- Bright border drawn over the button.
            local sb_min_x, sb_min_y = imgui.GetItemRectMin()
            local sb_max_x, sb_max_y = imgui.GetItemRectMax()

            imgui.GetWindowDrawList():AddRect(
                { sb_min_x, sb_min_y },
                { sb_max_x, sb_max_y },
                imgui.GetColorU32(colors.settings_border),
                2,
                0,
                2
            )

            if settings_clicked then
                controller.ToggleSettings()
            end
        end

        -- Hide the bar, and close the Journal (the window has no title bar,
        -- so no X of its own).
        imgui.SameLine(0, 8)

        sheetx.corner_buttons()

        sheetx.menu_popup(menu_entries)

        local popup_id =
            is_mission_mode
            and '##JournalAreaPopup'
            or '##JournalCategoryPopup'

        local opened =
            draw_selector_popup(
                popup_id,
                items,
                labels,
                index,
                function(i)
                    if is_mission_mode then
                        controller.SetMissionSelection(
                            i,
                            1
                        )

                        journal_area_popup_open =
                            false
                    else
                        controller.SetQuestSelection(
                            i,
                            1
                        )

                        journal_category_popup_open =
                            false
                    end
                end,
                controller.GetTotalProgress
                    and (
                        tx('Total')
                        .. format_progress(
                            controller.GetTotalProgress(
                                is_mission_mode
                            )
                        )
                    )
                    or nil,
                is_mission_mode
                    and controller.GetMissionAreaTypes
                    and controller.GetMissionAreaTypes()
                    or nil
            )

        if is_mission_mode then
            journal_area_popup_open =
                opened
        else
            journal_category_popup_open =
                opened
        end
    end

    imgui.EndChild()

    imgui.PopStyleColor()
end

local function draw_journal_list(
    is_mission_mode,
    width
)
    local items,
    selection

    local hide_label,
    getter,
    setter,
    callback,
    show_label,
    show_getter,
    show_setter

    local id,
    spacing

    -- What a double click on a row does (opens its sheet).
    local open_fn

    if is_mission_mode then
        items =
            controller.GetMissionList()

        selection =
            controller.GetMissionSelection()

        hide_label =
            tx('Hide complete missions')

        getter =
            controller.GetHideCompleteMissions

        setter =
            controller.SetHideCompleteMissions

        show_label =
            tx('Show not started##JournalShowMissions')

        show_getter =
            controller.GetShowNotStartedMissions

        show_setter =
            controller.SetShowNotStartedMissions

        callback = function(index)
            controller.SetMissionSelection(
                selection.area_index,
                index
            )
        end

        open_fn = function()
            open_sheet('Mission')
        end

        id =
            '##JournalMissionList'

        spacing =
            false
    else
        items =
            controller.GetQuestList()

        selection =
            controller.GetQuestSelection()

        hide_label =
            tx('Hide complete quests')

        getter =
            controller.GetHideCompleteQuests

        setter =
            controller.SetHideCompleteQuests

        show_label =
            tx('Show not started##JournalShowQuests')

        show_getter =
            controller.GetShowNotStartedQuests

        show_setter =
            controller.SetShowNotStartedQuests

        callback = function(index)
            controller.SetQuestSelection(
                selection.category_index,
                index
            )
        end

        open_fn = function()
            open_sheet('Quest')
        end

        id =
            '##JournalQuestList'

        spacing =
            true
    end

    -- Extra rows: the chapters and notes of the missions, or the zone titles
    -- of the quests.
    local list_extras = nil

    if is_mission_mode then
        list_extras = controller.GetMissionListExtras
            and controller.GetMissionListExtras()
            or nil
    elseif controller.GetQuestListGroups then
        for _, group in ipairs(controller.GetQuestListGroups()) do
            list_extras = list_extras or {}
            list_extras[#list_extras + 1] = {
                at_index = group.index,
                title = group.zone,
            }
        end
    end

    draw_selectable_status_list(
        id,
        width,
        items,
        is_mission_mode
            and selection.mission_index
            or selection.quest_index,
        hide_label,
        getter,
        setter,
        show_label,
        show_getter,
        show_setter,
        function(item)
            if item.code ~= nil then
                return tostring(item.code)
                    .. '. '
                    .. tostring(item.name or '')
                    .. (item.finale and (' (' .. tx('Finale') .. ')') or '')
            end

            return tostring(
                item.name or ''
            )
        end,
        callback,
        spacing,
        controller.GetOnlyRepeatableQuests
            and not is_mission_mode
            and controller.GetOnlyRepeatableQuests
            or nil,
        controller.SetOnlyRepeatableQuests
            and not is_mission_mode
            and controller.SetOnlyRepeatableQuests
            or nil,
        open_fn,
        list_extras,
        function(item)
            return controller.IsFavorite ~= nil
                and controller.IsFavorite(
                    is_mission_mode and 'Mission' or 'Quest',
                    item
                ) == true
        end,
        controller.GetOnlyFavorites
            and function()
                return controller.GetOnlyFavorites(
                    is_mission_mode and 'Mission' or 'Quest'
                )
            end
            or nil,
        controller.SetOnlyFavorites
            and function(value)
                controller.SetOnlyFavorites(
                    is_mission_mode and 'Mission' or 'Quest',
                    value
                )
            end
            or nil
    )
end

local function draw_journal_mini()
    if not can_draw_ui()
        or not controller
        or not controller.GetJournalMiniState then

        return
    end

    local state =
        controller.GetJournalMiniState()

    if not state
        or not state.visible then

        return
    end

    -- The button is only drawn when the setting is on.
    if controller.GetJournalMiniButton
        and not controller.GetJournalMiniButton() then

        return
    end

    local journal_state =
        controller.GetJournalWindowState()

    if journal_state
        and journal_state.visible then

        return
    end

    load_journal_mini_texture()

    if journal_mini_restore_window then
        if state.x ~= nil
            and state.y ~= nil then

            imgui.SetNextWindowPos({
                state.x,
                state.y,
            })
        end

        imgui.SetNextWindowSize({
            72,
            72,
        })

        journal_mini_restore_window =
            false
    end

    push_theme()

    if imgui.Begin(
        'Journal Mini###JournalMini',
        { true },
        ImGuiWindowFlags_NoTitleBar
            + ImGuiWindowFlags_NoResize
            + ImGuiWindowFlags_NoScrollbar
            + ImGuiWindowFlags_NoScrollWithMouse
            + ImGuiWindowFlags_NoCollapse
    ) then
        local texture_id

        if journal_mini_texture ~= nil then
            texture_id =
                tonumber(
                    ffi.cast(
                        'uint32_t',
                        journal_mini_texture
                    )
                )
        end

        imgui.SetCursorPos({
            6,
            6,
        })

        local opened

        if texture_id ~= nil then
            opened =
                imgui.ImageButton(
                    texture_id,
                    {
                        60,
                        60,
                    },
                    {
                        0,
                        0,
                    },
                    {
                        1,
                        1,
                    },
                    -1,
                    {
                        0,
                        0,
                        0,
                        0,
                    },
                    {
                        1,
                        1,
                        1,
                        1,
                    }
                )
        else
            opened =
                imgui.Button(
                    'Open',
                    {
                        60,
                        60,
                    }
                )
        end

        if opened then
            controller.SetJournalMini(false)
            controller.SetJournalVisible(true)

            journal_restore_window =
                true
        end

        local x, y =
            imgui.GetWindowPos()

        if x ~= state.x
            or y ~= state.y then

            controller.SetJournalMiniGeometry(
                x,
                y
            )
        end
    end

    imgui.End()
    pop_theme()
end

-- One objective of the sheet. state is 'done' (an earlier step), 'current'
-- or 'pending'. Plain characters keep it readable with any font.
local function draw_sheet_step(index, text, state)
    local marker = '[ ]'
    local color = colors.text

    if state == 'done' then
        marker = '[x]'
        color = colors.text_dim
    elseif state == 'current' then
        marker = '[>]'
        color = colors.active_status
    end

    richtext.draw_wrapped(
        marker
            .. ' '
            .. tostring(index)
            .. '. '
            .. tostring(i18n.step(text)),
        {
            styles = get_styles(),
            color = color,
            size = step_font_size,
            items = true,
            on_npc = npc_click(text),
            id = 'sheet' .. tostring(index),
            npc_tooltip = tx('Click to point the compass at it'),
            on_zone = sheetx.zone_click(),
            zone_tooltip = tx('Click to guide the compass to this zone'),
            on_monster = sheetx.monster_click(),
            monster_tooltip = tx('Click to see its sheet'),
            on_item = sheetx.item_click(),
            item_known = sheetx.item_known,
            item_tooltip = tx('Click to see its sheet'),
        }
    )

    imgui.Spacing()
end

local function draw_sheet_window()
    if not sheet_open
        or not can_draw_ui()
        or not controller
        or not controller.GetJournalWindowState then

        return
    end

    local journal =
        controller.GetJournalWindowState()

    -- The sheet goes away with the Journal, unless it was opened without it.
    if not journal
        or (not journal.visible and not sheetx.standalone) then

        sheet_open = false

        return
    end

    if sheet_restore then
        sheet_restore = false

        local sheet_w = sheetx.w or scaled(520)
        local sheet_h = sheetx.h or scaled(660)

        imgui.SetNextWindowSize({ sheet_w, sheet_h })

        local pos_x = (journal.x or 0) + 60
        local pos_y = (journal.y or 0) + 60

        if not journal.visible then
            -- Without the Journal: near the middle of the screen.
            local ok, screen_w, screen_h = pcall(function()
                local size = imgui.GetIO().DisplaySize

                return size.x, size.y
            end)

            if ok and screen_w and screen_h then
                pos_x = math.max(20, (screen_w - sheet_w) * 0.5)
                pos_y = math.max(20, (screen_h - sheet_h) * 0.4)
            end
        end

        imgui.SetNextWindowPos({ pos_x, pos_y })
    end

    -- The player can drag the corner to resize it.
    if imgui.SetNextWindowSizeConstraints then
        imgui.SetNextWindowSizeConstraints(
            { scaled(300), scaled(200) },
            { scaled(1400), scaled(1400) }
        )
    end

    local kind = sheet_kind

    local selected =
        kind == 'Mission'
        and controller.GetSelectedMission()
        or controller.GetSelectedQuest()

    push_theme()

    local font_pushed =
        journal_font ~= nil

    if font_pushed then
        imgui.PushFont(
            journal_font,
            journal_font_size
        )
    end

    local open = { true }

    -- The grip of the corner, visible.
    imgui.PushStyleColor(ImGuiCol_ResizeGrip, { 0.80, 0.84, 0.95, 0.30 })
    imgui.PushStyleColor(ImGuiCol_ResizeGripHovered, { 0.80, 0.84, 0.95, 0.60 })
    imgui.PushStyleColor(ImGuiCol_ResizeGripActive, { 0.80, 0.84, 0.95, 0.90 })

    scalex.before('sheet')

    if imgui.Begin(
        (
            kind == 'Mission'
            and tx('Mission Sheet')
            or tx('Quest Sheet')
        ) .. '###JournalSheet',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
    ) then
        scalex.after('sheet')

        local draw =
            imgui.GetWindowDrawList()

        local x, y =
            imgui.GetWindowPos()

        local width, height =
            imgui.GetWindowSize()

        -- Remembered for the next time it opens.
        sheetx.w, sheetx.h = width, height

        draw_window_panel(
            draw,
            x,
            y,
            width,
            height,
            true
        )

        if not selected then
            imgui.TextColored(
                colors.text_dim,
                (kind == 'Mission' and tx('No mission selected.') or tx('No quest selected.'))
            )
        else
            local status =
                display_status(selected)

            -- The cover of the area, small, next to the name.
            if kind == 'Mission' then
                local areas =
                    controller.GetMissionAreas()

                local selection =
                    controller.GetMissionSelection()

                local cover =
                    load_journal_cover(
                        selected.area
                            or areas[selection.area_index]
                    )

                if cover then
                    draw_journal_cover(
                        cover,
                        56,
                        56,
                        true
                    )

                    imgui.SameLine(0, 12)
                end
            end

            imgui.TextColored(
                colors.gold,
                tostring(selected.name or '')
            )

            imgui.Spacing()

            draw_selected_status(status)

            -- How far along: the game does not tell the step, so it is the
            -- step pinned in the Tracker.
            local step, total

            if controller.GetPinStep then
                step, total =
                    controller.GetPinStep(
                        kind,
                        selected
                    )
            end

            if status == 'completed' then
                imgui.TextColored(
                    colors.text_dim,
                    tx('All steps completed.')
                )
            elseif step then
                imgui.TextColored(
                    colors.text_dim,
                    string.format(
                        tx('Step %d of %d (pinned in the Tracker)'),
                        step,
                        total
                    )
                )
            elseif status == 'active' then
                imgui.TextColored(
                    colors.text_dim,
                    tx('Pin it to the Tracker to follow your step.')
                )
            end

            imgui.Spacing()

            if kind == 'Quest' then
                draw_metadata(selected)
            else
                draw_mission_info(selected)
            end

            imgui.Spacing()
            imgui.Separator()
            imgui.Spacing()

            imgui.TextColored(
                colors.text,
                tx('Objectives')
            )

            imgui.Spacing()

            local steps =
                selected.steps
                or {}

            if #steps == 0 then
                imgui.TextColored(
                    colors.text_dim,
                    tx('No objectives available.')
                )
            end

            for i, text in ipairs(steps) do
                local state = 'pending'

                if status == 'completed'
                    or (step and i < step) then

                    state = 'done'
                elseif step and i == step then
                    state = 'current'
                end

                draw_sheet_step(
                    i,
                    text,
                    state
                )
            end

            -- The note of the player.
            local note =
                controller.GetNote
                and controller.GetNote(kind, selected)
                or ''

            if note ~= '' then
                imgui.Spacing()
                imgui.Separator()
                imgui.Spacing()

                imgui.TextColored(
                    colors.text,
                    tx('Note')
                )

                imgui.Spacing()

                richtext.draw_wrapped(
                    note,
                    {
                        color = colors.note,
                        size = step_font_size,
                    }
                )
            end
        end
    end

    imgui.End()
    imgui.PopStyleColor(3)

    if not open[1] then
        sheet_open = false
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- One row of the progress window: name, bar and "30%  26/85". The row is
-- clickable when on_click is given.
local function draw_progress_row(
    label,
    done,
    total,
    id,
    label_width,
    on_click
)
    local clicked =
        imgui.Selectable(
            '##progress_row_' .. id,
            false
        )

    local hovered = imgui.IsItemHovered()

    local draw = imgui.GetWindowDrawList()

    local min_x, min_y = imgui.GetItemRectMin()
    local max_x, max_y = imgui.GetItemRectMax()
    local middle = (min_y + max_y) * 0.5

    if hovered and on_click then
        draw:AddRectFilled(
            { min_x + 2, min_y + 1 },
            { max_x - 2, max_y - 1 },
            imgui.GetColorU32({
                colors.button_hover[1],
                colors.button_hover[2],
                colors.button_hover[3],
                0.55,
            }),
            2
        )
    end

    local ratio = 0

    if total > 0 then
        ratio = done / total
    end

    local percent_text =
        string.format(
            '%d%%  %d/%d',
            math.floor(ratio * 100),
            done,
            total
        )

    local percent_width = imgui.CalcTextSize(percent_text)
    local line_height = imgui.GetTextLineHeight()
    local text_y = middle - line_height * 0.5

    draw:AddText(
        { min_x + 8, text_y },
        imgui.GetColorU32(colors.text),
        label
    )

    draw:AddText(
        { max_x - 8 - percent_width, text_y },
        imgui.GetColorU32(colors.text_dim),
        percent_text
    )

    local bar_left = min_x + 8 + label_width + 14
    local bar_right = max_x - 8 - percent_width - 14

    if bar_right - bar_left >= 24 then
        draw:AddRectFilled(
            { bar_left, middle - 4 },
            { bar_right, middle + 4 },
            imgui.GetColorU32(colors.header_bg),
            3
        )

        local fill = (bar_right - bar_left) * ratio

        if fill >= 1 then
            draw:AddRectFilled(
                { bar_left, middle - 4 },
                { bar_left + fill, middle + 4 },
                imgui.GetColorU32(
                    total > 0 and done >= total
                        and colors.completed
                        or colors.active_status
                ),
                3
            )
        end
    end

    if clicked and on_click then
        on_click()
    end
end

-- Opens an area in the Journal from the progress window.
local function open_area_from_progress(is_mission_mode, index)
    controller.SetJournalMode(is_mission_mode and 1 or 2)

    if controller.SetSearchText then
        journal_search_buffer[1] = ''
        controller.SetSearchText('')
    end

    if is_mission_mode then
        controller.SetMissionSelection(index, 1)
    else
        controller.SetQuestSelection(index, 1)
    end
end

local function draw_progress_section(is_mission_mode, label_width)
    local items, names

    if is_mission_mode then
        items = controller.GetMissionAreas()
        names = controller.GetMissionAreaNames()
    else
        items = controller.GetQuestCategories()
        names = controller.GetQuestCategoryNames()
    end

    local done, total = controller.GetTotalProgress(is_mission_mode)

    draw_progress_row(
        is_mission_mode and tx('Missions') or tx('Quests'),
        done,
        total,
        is_mission_mode and 'total_missions' or 'total_quests',
        label_width,
        nil
    )

    imgui.Separator()

    for index, item in ipairs(items) do
        local area_done, area_total = 0, 0

        if is_mission_mode then
            area_done, area_total = controller.GetMissionProgress(item)
        else
            area_done, area_total = controller.GetQuestProgress(item)
        end

        if area_total > 0 then
            draw_progress_row(
                tostring(names[item] or item),
                area_done,
                area_total,
                (is_mission_mode and 'm_' or 'q_') .. tostring(item),
                label_width,
                function()
                    open_area_from_progress(is_mission_mode, index)
                end
            )
        end
    end
end

local function draw_progress_window()
    if not progress_open
        or not can_draw_ui()
        or not controller
        or not controller.GetTotalProgress
        or not controller.GetJournalWindowState then

        return
    end

    local journal = controller.GetJournalWindowState()

    -- The progress window goes away with the Journal.
    if not journal
        or not journal.visible then

        progress_open = false

        return
    end

    if progress_restore then
        progress_restore = false

        imgui.SetNextWindowSize({ scaled(460), scaled(600) })

        imgui.SetNextWindowPos({
            (journal.x or 0) + 80,
            (journal.y or 0) + 80,
        })
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    scalex.before('progress')

    if imgui.Begin(
        tx('Progress') .. '###JournalProgress',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
    ) then
        scalex.after('progress')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        draw_window_panel(draw, x, y, width, height, true)

        -- Names of both lists share one column so the bars line up.
        local label_width = imgui.CalcTextSize(tx('Missions'))

        for _, is_mission_mode in ipairs({ true, false }) do
            local items, names

            if is_mission_mode then
                items = controller.GetMissionAreas()
                names = controller.GetMissionAreaNames()
            else
                items = controller.GetQuestCategories()
                names = controller.GetQuestCategoryNames()
            end

            for _, item in ipairs(items) do
                label_width =
                    math.max(
                        label_width,
                        imgui.CalcTextSize(tostring(names[item] or item))
                    )
            end
        end

        label_width = math.min(label_width, width * 0.45)

        draw_progress_section(true, label_width)

        imgui.Spacing()
        imgui.Spacing()

        draw_progress_section(false, label_width)
    end

    imgui.End()

    if not open[1] then
        progress_open = false
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- Active Now window ---------------------------------------------------------

-- A text that fits in max_width, cut with "..." when it is longer.
local function fit_text(text, max_width)
    text = tostring(text or '')

    if max_width <= 0 then
        return ''
    end

    if (imgui.CalcTextSize(text)) <= max_width then
        return text
    end

    local low = 0
    local high = #text

    while low < high do
        local middle = math.ceil((low + high) / 2)

        if (imgui.CalcTextSize(text:sub(1, middle) .. '...'))
            <= max_width then

            low = middle
        else
            high = middle - 1
        end
    end

    return text:sub(1, low) .. '...'
end

-- Opens the item of a row in the Journal.
local function open_active_row(row)
    local ok = false

    if row.kind == 'mission' then
        ok = controller.JumpToMission ~= nil
            and controller.JumpToMission(row.area, row.id, row.name)
    else
        ok = controller.JumpToQuest ~= nil
            and controller.JumpToQuest(row.id)
    end

    if ok then
        -- The jump cleared the search text; the box must follow.
        journal_search_buffer[1] = ''

        if sheet_open then
            sheet_kind = row.kind == 'mission' and 'Mission' or 'Quest'
        end
    else
        active_notice = {
            text = tx('Not found in the Journal data.'),
            time = os.clock(),
        }
    end
end

-- One row of the window: up to three lines (the name, the step and the
-- note) and a click on any of them opens the item in the Journal. With
-- remove, a small button under the row takes it out of the favorites (on
-- its own line: a button on the same line as a row can swallow its clicks).
-- Returns true when the row was clicked.
local function draw_active_row(row, id, remove)
    local clicked = false
    local draw = imgui.GetWindowDrawList()
    local text_left = nil
    local status = display_status(row)

    for line = 1, 3 do
        if line < 3 or row.note ~= '' then
            local hit =
                imgui.Selectable(
                    '##active_row_' .. id .. '_' .. line,
                    false
                )

            local hovered = imgui.IsItemHovered()
            local min_x, min_y = imgui.GetItemRectMin()
            local max_x, max_y = imgui.GetItemRectMax()
            local middle = (min_y + max_y) * 0.5
            local line_height = imgui.GetTextLineHeight()
            local text_y = middle - line_height * 0.5

            if hit then
                clicked = true
            end

            if line == 1 then
                -- The text of the other lines lines up with the name.
                text_left = min_x + 28
            end

            if hovered then
                draw:AddRectFilled(
                    { min_x + 2, min_y + 1 },
                    { max_x - 2, max_y - 1 },
                    imgui.GetColorU32({
                        colors.button_hover[1],
                        colors.button_hover[2],
                        colors.button_hover[3],
                        0.55,
                    }),
                    2
                )
            end

            if line == 1 then
                local icon = sheetx.row_icon(row, status, row.kind == 'mission')
                local icon_drawn = false

                if icon ~= nil then
                    icon_drawn = pcall(function()
                        local icon_h = math.min(max_y - min_y - 2, 22)
                        local icon_w = icon_h * icon.width / icon.height

                        if icon_w > 20 then
                            icon_h = icon_h * 20 / icon_w
                            icon_w = 20
                        end

                        draw:AddImage(
                            icon.id,
                            { min_x + 15 - icon_w * 0.5, middle - icon_h * 0.5 },
                            { min_x + 15 + icon_w * 0.5, middle + icon_h * 0.5 },
                            { 0, 0 },
                            { 1, 1 },
                            imgui.GetColorU32({ 1, 1, 1, 1 })
                        )
                    end)
                end

                if not icon_drawn then
                    draw:AddCircleFilled(
                        { min_x + 15, middle },
                        5.5,
                        imgui.GetColorU32(status_dot_color(status)),
                        14
                    )
                end

                -- On the right: the pin sign when it is in the Tracker, and
                -- the area or category.
                local right_x = max_x - 8
                local label_width =
                    math.min(
                        imgui.CalcTextSize(row.label),
                        (max_x - min_x) * 0.34
                    )

                if row.label ~= '' then
                    draw:AddText(
                        { right_x - label_width, text_y },
                        imgui.GetColorU32(colors.text_dim),
                        fit_text(row.label, label_width)
                    )

                    right_x = right_x - label_width - 10
                end

                if row.pinned then
                    local size = line_height * 0.9

                    icons.draw_pin(
                        draw,
                        right_x - size,
                        middle - size * 0.5,
                        size,
                        imgui.GetColorU32(colors.active_status),
                        true
                    )

                    right_x = right_x - size - 10
                end

                -- After the name: the infinity sign and the star.
                local after = 0
                local star_size = line_height * 0.8
                local infinity_width = (icons.infinity_size(line_height))

                if row.repeatable then
                    after = after + infinity_width + 8
                end

                if row.favorite and not remove then
                    after = after + star_size + 8
                end

                local name =
                    fit_text(row.name, right_x - text_left - after)

                draw:AddText(
                    { text_left, text_y },
                    imgui.GetColorU32(
                        status == 'completed'
                            and colors.text_dim
                            or colors.text
                    ),
                    name
                )

                local after_x = text_left + (imgui.CalcTextSize(name)) + 10

                if row.repeatable then
                    local icon_width, icon_height =
                        icons.infinity_size(line_height)

                    icons.draw_infinity(
                        draw,
                        after_x,
                        text_y + (line_height - icon_height) * 0.5,
                        icon_width,
                        icon_height,
                        imgui.GetColorU32(colors.repeatable),
                        2.0
                    )

                    after_x = after_x + icon_width + 8
                end

                if row.favorite and not remove then
                    icons.draw_star(
                        draw,
                        after_x,
                        text_y + (line_height - star_size) * 0.5,
                        star_size,
                        imgui.GetColorU32(colors.favorite)
                    )
                end

            elseif line == 2 then
                local text
                local color = colors.text_dim

                if row.missing then
                    text = tx('Not found in the Journal data.')
                elseif status == 'completed' then
                    text = tx('Completed')
                    color = colors.completed
                elseif status ~= 'active' then
                    text = (get_status_display(status))
                elseif row.total == 0 then
                    text = tx('No objectives available.')
                elseif row.all_done then
                    text = tx('All steps completed.')
                else
                    text = string.format(
                        '%d/%d  %s',
                        row.step,
                        row.total,
                        tostring(i18n.step(row.step_text))
                    )

                    color = colors.text
                end

                draw:AddText(
                    { text_left, text_y },
                    imgui.GetColorU32(color),
                    fit_text(text, max_x - 8 - text_left)
                )
            else
                draw:AddText(
                    { text_left, text_y },
                    imgui.GetColorU32(colors.note),
                    fit_text(
                        tx('Note') .. ': ' .. row.note,
                        max_x - 8 - text_left
                    )
                )

                -- The whole note, when the line is too short for it.
                if hovered and imgui.SetTooltip then
                    imgui.SetTooltip(row.note)
                end
            end
        end
    end

    if remove then
        if imgui.SmallButton(tx('Remove') .. '##fav_remove_' .. id) then
            if controller.RemoveFavorite then
                controller.RemoveFavorite(row.kind, row.id, row.name)
                active_rows_time = -1000
            end
        end

        if imgui.IsItemHovered() and imgui.SetTooltip then
            imgui.SetTooltip(tx('Remove from favorites'))
        end
    end

    return clicked
end

local function draw_active_window()
    if not controller
        or not controller.GetActiveOpen then

        return
    end

    if not controller.GetActiveOpen() then
        active_was_open = false

        return
    end

    if not can_draw_ui()
        or not controller.GetActiveNow
        or not controller.GetFavoriteRows
        or not controller.GetJournalWindowState then

        return
    end

    local journal = controller.GetJournalWindowState()

    -- The window goes away with the Journal.
    if not journal
        or not journal.visible then

        controller.SetActiveOpen(false)
        active_was_open = false

        return
    end

    if not active_was_open then
        active_was_open = true
        active_restore = true
        active_rows_time = -1000
        active_notice = nil
    end

    if active_restore then
        active_restore = false

        imgui.SetNextWindowSize({ scaled(500), scaled(640) })

        imgui.SetNextWindowPos({
            (journal.x or 0) + 100,
            (journal.y or 0) + 100,
        })
    end

    -- The rows are rebuilt about once a second, and at once after a change.
    local now = os.clock()

    if now - active_rows_time > 1.0 then
        active_rows_time = now
        active_rows = controller.GetActiveNow() or {}
        favorite_rows = controller.GetFavoriteRows() or {}
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    scalex.before('active')

    if imgui.Begin(
        tx('Active Now') .. '###JournalActive',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
    ) then
        scalex.after('active')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        draw_window_panel(draw, x, y, width, height, true)

        local tab = controller.GetActiveTab()

        local active_text =
            tx('Active') .. ' (' .. #active_rows .. ')'

        local favorites_text =
            tx('Favorites') .. ' (' .. #favorite_rows .. ')'

        if toolbar_mode_button(
            active_text .. '##ActiveTab',
            tab == 'active',
            (imgui.CalcTextSize(active_text)) + 36
        ) then
            controller.SetActiveOpen(true, 'active')
        end

        imgui.SameLine(0, 4)

        if toolbar_mode_button(
            favorites_text .. '##FavoritesTab',
            tab == 'favorites',
            (imgui.CalcTextSize(favorites_text)) + 36
        ) then
            controller.SetActiveOpen(true, 'favorites')
        end

        -- A jump that did not arrive says so for a few seconds.
        if active_notice ~= nil then
            if now - active_notice.time < 4 then
                imgui.TextColored(colors.text_dim, active_notice.text)
            else
                active_notice = nil
            end
        end

        imgui.Spacing()

        imgui.PushStyleColor(ImGuiCol_ChildBg, transparent)

        if imgui.BeginChild('##JournalActiveList', { -1, -1 }, child_border) then
            local list_draw = imgui.GetWindowDrawList()
            local list_x, list_y = imgui.GetWindowPos()
            local list_w, list_h = imgui.GetWindowSize()

            draw_panel(list_draw, list_x, list_y, list_w, list_h, true)

            local rows = tab == 'favorites' and favorite_rows or active_rows

            if #rows == 0 then
                richtext.draw_wrapped(
                    tab == 'favorites'
                        and tx('No favorites yet. Use the star on a quest or mission.')
                        or tx('Nothing active right now.'),
                    { color = colors.text_dim, size = step_font_size }
                )
            end

            local last_kind = nil

            for index, row in ipairs(rows) do
                if tab == 'active' and row.kind ~= last_kind then
                    last_kind = row.kind

                    imgui.TextColored(
                        colors.text_dim,
                        row.kind == 'mission'
                            and tx('Missions')
                            or tx('Quests')
                    )
                end

                local row_id =
                    row.kind .. '_' .. tostring(row.area or '')
                    .. '_' .. tostring(row.id) .. '_' .. index

                if draw_active_row(row, row_id, tab == 'favorites') then
                    open_active_row(row)
                end

                imgui.Spacing()
            end
        end

        imgui.EndChild()

        imgui.PopStyleColor()
    end

    imgui.End()

    if not open[1] then
        controller.SetActiveOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- Compass window ------------------------------------------------------------
-- A small window with an arrow that points at the NPC of the current step of
-- the target. It is drawn whenever it is open, with the Journal or without
-- it, like the Tracker. The locals live in a block: the file has few left.

local draw_compass_window

do
    local placed = false
    -- Resizing of the window. refit counts the frames in which the window
    -- is asked to fit its content (a height of 0); after that its size
    -- belongs to the player. clipped_signature is the content seen in the
    -- last frame: a refit is only asked when it changes and does not fit.
    local refit, last_w, clipped_signature = 0, nil, nil
    local compass_scale, last_scale = 1.0, nil

    -- A size in pixels, scaled with the text size of the Journal and with
    -- the text size of the compass.
    local function cscaled(value)
        return scaled(value * compass_scale)
    end
    local size_placed = false

    -- The search box and what it found, the last message and the names of
    -- the zones (looked up once).
    local search_buffer = { '' }
    local search_text = ''
    local search_results = {}
    local search_notice = nil
    local zone_names = {}

    local function zone_label(id)
        if zone_names[id] == nil then
            local name = controller.GetCompassZoneName
                and controller.GetCompassZoneName(id)

            if name == nil then
                return '#' .. tostring(id)
            end

            zone_names[id] = name
        end

        return zone_names[id]
    end

    -- A small, dim "x" at the right end of the row that was just drawn: an
    -- invisible button with two lines drawn over it, lighter when the mouse
    -- is on it. Returns true when it was pressed.
    local function draw_cross(id, window_width)
        local cross = cscaled(14)

        imgui.SameLine(window_width - cscaled(12) - cross)

        local pressed = imgui.InvisibleButton(id, { cross, cross })

        local min_x, min_y = imgui.GetItemRectMin()
        local max_x, max_y = imgui.GetItemRectMax()
        local cx = (min_x + max_x) * 0.5
        local cy = (min_y + max_y) * 0.5
        local arm = cross * 0.22
        local color = imgui.GetColorU32(
            imgui.IsItemHovered()
                and colors.cross_hover
                or colors.cross
        )
        local list = imgui.GetWindowDrawList()

        list:AddLine(
            { cx - arm, cy - arm },
            { cx + arm, cy + arm },
            color,
            1.2
        )
        list:AddLine(
            { cx - arm, cy + arm },
            { cx + arm, cy - arm },
            color,
            1.2
        )

        if imgui.IsItemHovered() and imgui.SetTooltip then
            imgui.SetTooltip(tx('Remove'))
        end

        return pressed
    end

    local function distance_text(distance)
        if distance < 10 then
            return string.format(tx('%.1f meters'), distance)
        end

        return string.format(tx('%d meters'), math.floor(distance + 0.5))
    end

    -- Color and message by distance: 0-5 green, 6-20 yellow, 21-35
    -- orange. Farther than that, no message.
    local proximity_colors = {
        { 0.40, 0.90, 0.40, 1.00 },
        { 1.00, 0.90, 0.30, 1.00 },
        { 1.00, 0.60, 0.20, 1.00 },
    }

    local function proximity(distance)
        local shown = math.floor(distance + 0.5)

        if shown <= 5 then
            return proximity_colors[1], tx("It's right here!")
        elseif shown <= 20 then
            return proximity_colors[2], tx("You're very close..")
        elseif shown <= 35 then
            return proximity_colors[3], tx("You're getting closer..")
        end

        return nil, nil
    end

    -- A line of text with a soft black shadow, as in the Tracker: the
    -- line is reserved with invisible text and drawn twice.
    local function shadow_text(color, text)
        imgui.PushStyleColor(ImGuiCol_Text, transparent)

        local reserved = pcall(imgui.Text, text)

        imgui.PopStyleColor()

        local drawn = reserved and pcall(function()
            local draw = imgui.GetWindowDrawList()
            local x, y = imgui.GetItemRectMin()

            draw:AddText({ x + 1, y + 1 }, 0xCC000000, text)
            draw:AddText({ x, y }, imgui.GetColorU32(color), text)
        end)

        if not reserved then
            imgui.TextColored(color, text)
        elseif not drawn then
            imgui.TextColored(color, text)
        end
    end

    -- A line with a shadow like shadow_text, but with the name of a zone in
    -- bold after a regular prefix ("In another zone: Zone"). Bold is the
    -- bold font of the text, or the text drawn twice when it is not loaded.
    function sheetx.shadow_zone_text(color, prefix, zone, available)
        local prefix_w = prefix ~= '' and (imgui.CalcTextSize(prefix)) or 0

        zone = fit_text(zone, math.max(20, available - prefix_w))

        local bold_size = journal_font_size * compass_scale

        imgui.PushStyleColor(ImGuiCol_Text, transparent)

        local reserved = pcall(imgui.Text, prefix .. zone)

        imgui.PopStyleColor()

        local drawn = reserved and pcall(function()
            local draw = imgui.GetWindowDrawList()
            local x, y = imgui.GetItemRectMin()
            local u32 = imgui.GetColorU32(color)

            if prefix ~= '' then
                draw:AddText({ x + 1, y + 1 }, 0xCC000000, prefix)
                draw:AddText({ x, y }, u32, prefix)
            end

            local has_font = text_bold_font ~= nil
                and pcall(imgui.PushFont, text_bold_font, bold_size)

            draw:AddText({ x + prefix_w + 1, y + 1 }, 0xCC000000, zone)
            draw:AddText({ x + prefix_w, y }, u32, zone)

            if has_font then
                imgui.PopFont()
            else
                draw:AddText({ x + prefix_w + 1, y }, u32, zone)
            end
        end)

        if not drawn then
            imgui.TextColored(color, prefix .. zone)
        end
    end

    local function compass_text(state)
        if state.status == 'none' then
            if controller.GetCompassSearchVisible
                and not controller.GetCompassSearchVisible() then

                return tx('Choose a quest or mission and press "Point compass here".')
            end

            return tx('Search an NPC below, or choose a quest or mission and press "Point compass here".')
        end

        if state.status == 'nostep' then
            return tx('No step to follow.')
        end

        if state.status == 'nonpc' then
            return tx('This step does not name an NPC.')
        end

        if state.status == 'unavailable' then
            return tx('Compass unavailable')
        end

        return nil
    end

    draw_compass_window = function()
        if not controller
            or not controller.GetCompassOpen
            or not controller.GetCompassState then

            return
        end

        if not controller.GetCompassOpen() then
            placed = false
            size_placed = false
            refit = 0
            last_w = nil
            last_scale = nil
            clipped_signature = nil

            return
        end

        if not can_draw_ui() then
            return
        end

        compass_scale = controller.GetCompassTextScale
            and controller.GetCompassTextScale() or 1.0

        -- A new text size: fit the window to the content again.
        if last_scale == nil then
            last_scale = compass_scale
        elseif compass_scale ~= last_scale then
            last_scale = compass_scale
            refit = 3
            last_w = nil
        end

        local now = os.clock()
        local state = controller.GetCompassState(now)

        -- The window can be resized. Without a saved size it fits its
        -- content (a height of 0) for a few frames and keeps that size. A
        -- saved size is applied once. After that the size is the player's:
        -- it is saved when it changes, and the content scrolls if it does
        -- not fit. No mouse state is needed to tell who changed the size.
        local saved_w, saved_h

        if controller.GetCompassSize then
            saved_w, saved_h = controller.GetCompassSize()
        end

        if saved_w == nil and refit == 0 and controller.SetCompassSize then
            -- First time, or the size was reset.
            refit = 3
            last_w = nil
        end

        if refit > 0 then
            imgui.SetNextWindowSize({ last_w or cscaled(260), 0 })
        elseif not size_placed and saved_w ~= nil then
            imgui.SetNextWindowSize({ saved_w, saved_h })
        end

        size_placed = true

        if imgui.SetNextWindowSizeConstraints then
            imgui.SetNextWindowSizeConstraints(
                { cscaled(190), cscaled(80) },
                { cscaled(1000), cscaled(1000) }
            )
        end

        if not placed then
            placed = true

            local saved_x, saved_y = controller.GetCompassPosition()

            imgui.SetNextWindowPos({
                saved_x or cscaled(80),
                saved_y or cscaled(220),
            })
        end

        push_theme(false, controller.GetCompassOpacity
            and controller.GetCompassOpacity() or nil)

        -- The resize grip of the corner is invisible until the mouse is
        -- over it.
        imgui.PushStyleColor(ImGuiCol_ResizeGrip, transparent)
        imgui.PushStyleColor(
            ImGuiCol_ResizeGripHovered,
            { 0.80, 0.84, 0.95, 0.55 }
        )
        imgui.PushStyleColor(
            ImGuiCol_ResizeGripActive,
            { 0.80, 0.84, 0.95, 0.85 }
        )

        local font_pushed = journal_font ~= nil

        if font_pushed then
            imgui.PushFont(journal_font, journal_font_size * compass_scale)
        end

        -- No title bar and no close button: the window is moved by
        -- dragging it anywhere, and shown or hidden with the button of the
        -- Journal or /journal compass.
        if imgui.Begin(
            tx('Compass') .. '###JournalCompass',
            { true },
            ImGuiWindowFlags_NoSavedSettings
                + ImGuiWindowFlags_NoCollapse
                + ImGuiWindowFlags_NoTitleBar
        ) then
            local draw = imgui.GetWindowDrawList()
            local x, y = imgui.GetWindowPos()
            local window_width, window_height = imgui.GetWindowSize()

            -- Fully transparent: no background and no frame lines either.
            if (controller.GetCompassOpacity
                and controller.GetCompassOpacity() or 1) > 0 then

                draw_window_panel(
                    draw,
                    x,
                    y,
                    window_width,
                    window_height,
                    true
                )
            end

            -- Local patch: a slim header with a close button, since the window
            -- has no title bar. Dragging anywhere and fitting to the content
            -- work as before; the content just starts one row lower.
            do
                local close_size = cscaled(16)

                imgui.TextColored(colors.text_dim, tx('Compass'))
                imgui.SameLine(window_width - cscaled(10) - close_size)

                if imgui.InvisibleButton('##CompassClose', { close_size, close_size }) then
                    controller.SetCompassOpen(false)
                end

                local min_x, min_y = imgui.GetItemRectMin()
                local max_x, max_y = imgui.GetItemRectMax()
                local cx = (min_x + max_x) * 0.5
                local cy = (min_y + max_y) * 0.5
                local arm = close_size * 0.30
                local hovered = imgui.IsItemHovered()
                local color = imgui.GetColorU32(hovered and colors.text or colors.text_dim)

                draw:AddLine({ cx - arm, cy - arm }, { cx + arm, cy + arm }, color, 1.6)
                draw:AddLine({ cx - arm, cy + arm }, { cx + arm, cy - arm }, color, 1.6)

                if hovered and imgui.SetTooltip then
                    imgui.SetTooltip(tx('Close'))
                end

                imgui.Separator()
            end

            local available = window_width - cscaled(24)
            local message = compass_text(state)

            local npc_rows = controller.GetCompassNpcRows
                and controller.GetCompassNpcRows(now) or {}
            local pin_rows = controller.GetCompassPinRows
                and controller.GetCompassPinRows(now) or {}
            local zone_route = controller.GetCompassZoneRoute
                and controller.GetCompassZoneRoute() or nil

            if state.target ~= nil then
                shadow_text(
                    colors.text,
                    fit_text(state.target.name, available - cscaled(24))
                )

                -- The "x" stops pointing the compass at it.
                if draw_cross('##CompassTargetRemove', window_width)
                    and controller.RemoveCompassTarget then

                    controller.RemoveCompassTarget()
                end
            end

            if state.status == 'none' then
                -- No quest or mission: nothing is written (the hint that
                -- was here got in the way of an empty compass).
            elseif message ~= nil then
                imgui.Spacing()

                richtext.draw_wrapped(
                    message,
                    { color = colors.text_dim, size = step_font_size * compass_scale, shadow = true }
                )
            else
                if state.npc ~= nil then
                    shadow_text(
                        richtext.COLORS.npc,
                        fit_text(state.npc, available)
                    )
                end

                -- The arrow area, only when the compass gives an angle.
                local area = state.angle ~= nil and cscaled(86) or 0
                local start_x, start_y = imgui.GetCursorScreenPos()
                local center_x = x + window_width * 0.5
                local center_y = start_y + area * 0.5

                if state.status == 'found' and state.angle ~= nil then
                    local color = state.arrived
                        and colors.completed
                        or colors.active_status
                    local size = area * 0.40

                    if state.arrived then
                        -- A slow pulse when you are there.
                        size = size * (1 + 0.10 * math.sin(now * 6))
                    end

                    icons.draw_arrow(
                        draw,
                        center_x,
                        center_y,
                        size,
                        state.angle or 0,
                        imgui.GetColorU32(color)
                    )
                end

                if area > 0 and imgui.Dummy then
                    imgui.Dummy({ 1, area })
                else
                    imgui.Spacing()
                end

                if state.status == 'found' or state.status == 'known' then
                    -- The distance always shows; one decimal when it is
                    -- short, to see it drop as you walk.
                    local near_color, near_message = proximity(state.distance)

                    shadow_text(
                        near_color or colors.text,
                        distance_text(state.distance)
                    )

                    if near_message then
                        shadow_text(near_color, near_message)
                    end

                    -- The fixed position is from the game data, not live.
                    if state.status == 'known' then
                        shadow_text(
                            colors.text_dim,
                            tx('From the game data')
                        )
                    end
                elseif state.status == 'otherzone' then
                    local zone_names = {}

                    for _, id in ipairs(state.zones or {}) do
                        if #zone_names < 2 then
                            zone_names[#zone_names + 1] =
                                (controller.GetCompassZoneName
                                    and controller.GetCompassZoneName(id))
                                or ('#' .. tostring(id))
                        end
                    end

                    shadow_text(colors.text_dim, tx('In another zone:'))

                    sheetx.shadow_zone_text(
                        colors.text,
                        '',
                        table.concat(zone_names, ', '),
                        available
                    )

                    -- The next zone on foot (data/zone_links.lua).
                    if state.next_zone ~= nil then
                        shadow_text(
                            colors.text_dim,
                            fit_text(
                                tx('Next:') .. ' ' .. zone_label(state.next_zone),
                                available
                            )
                        )
                    end
                else
                    shadow_text(colors.text_dim, tx('Not in range'))
                end

                if state.grid ~= nil then
                    shadow_text(
                        colors.text_dim,
                        tx('Map square') .. ' ' .. state.grid
                    )
                end
            end

            -- The zone picked with a click on a zone name in a step: the
            -- way there from the zone the player is in.
            if zone_route ~= nil then
                if state.status ~= 'none' then
                    imgui.Separator()
                end

                -- The zone has a yolk-yellow border around its letters.
                local route_prefix = tx('Route to') .. ' '
                local route_name = fit_text(
                    zone_label(zone_route.goal),
                    available - cscaled(24)
                        - (imgui.CalcTextSize(route_prefix .. '|'))
                        + (imgui.CalcTextSize('|'))
                )

                if not sheetx.outline_line(
                    colors.text,
                    route_prefix,
                    route_name,
                    { 1.00, 0.78, 0.15, 1.00 },
                    compass_scale
                ) then
                    imgui.TextColored(colors.text, route_prefix .. route_name)
                end

                -- The "x" stops guiding to the zone.
                if draw_cross('##CompassZoneGoalRemove', window_width)
                    and controller.ClearCompassZoneGoal then

                    controller.ClearCompassZoneGoal()
                end

                local path = zone_route.route and zone_route.route.path

                if path ~= nil then
                    shadow_text(
                        colors.text,
                        fit_text(
                            tx('Next:') .. ' ' .. zone_label(path[1]),
                            available
                        )
                    )

                    if #path > 1 then
                        local later = {}

                        for position = 2, #path do
                            later[#later + 1] = zone_label(path[position])
                        end

                        richtext.draw_wrapped(
                            tx('Then:') .. ' ' .. table.concat(later, ' > '),
                            {
                                color = colors.text_dim,
                                size = step_font_size * compass_scale,
                                shadow = true,
                            }
                        )
                    end
                elseif not zone_route.unknown then
                    shadow_text(colors.text_dim, tx('No walking route'))
                end
            end

            -- The items pinned in the Tracker: the NPC of the current step
            -- of each, with a small "x" that takes it off the compass only.
            local hide_key = nil

            if #pin_rows > 0 then
                if state.status ~= 'none' or zone_route ~= nil then
                    imgui.Separator()
                end

                for index, row in ipairs(pin_rows) do
                    shadow_text(
                        richtext.COLORS.npc,
                        fit_text(row.npc, available - cscaled(24))
                    )

                    if draw_cross('##CompassPinRemove' .. index, window_width) then
                        hide_key = row.key
                    end

                    local line
                    local color = colors.text
                    local row_color, row_message, zone_bold

                    if row.status == 'found' or row.status == 'known' then
                        line = distance_text(row.distance)

                        if row.zone ~= nil then
                            line = line .. '  ' .. zone_label(row.zone)
                        end

                        row_color, row_message = proximity(row.distance)
                        color = row_color or color
                    elseif row.status == 'otherzone' then
                        local names = {}

                        for _, id in ipairs(row.zones or {}) do
                            if #names < 2 then
                                names[#names + 1] = zone_label(id)
                            end
                        end

                        line = tx('In another zone:') .. ' '
                        zone_bold = table.concat(names, ', ')
                        color = colors.text_dim

                        if row.next_zone ~= nil then
                            row_color = colors.text_dim
                            row_message = tx('Next:') .. ' '
                                .. zone_label(row.next_zone)
                        end
                    elseif row.status == 'far' then
                        line = tx('Not in range')
                        color = colors.text_dim
                    else
                        line = tx('Compass unavailable')
                        color = colors.text_dim
                    end

                    if zone_bold ~= nil then
                        sheetx.shadow_zone_text(
                            color, line, zone_bold, available
                        )
                    else
                        shadow_text(color, fit_text(line, available))
                    end

                    if row_message then
                        shadow_text(row_color, fit_text(row_message, available))
                    end

                    -- Which quest or mission it is for.
                    shadow_text(colors.text_dim, fit_text(row.title, available))
                end
            end

            if hide_key ~= nil and controller.HideCompassPin then
                controller.HideCompassPin(hide_key)
            end

            -- The NPCs chosen with the search.
            local remove_index = nil

            if #npc_rows > 0 then
                if state.status ~= 'none' or #pin_rows > 0
                    or zone_route ~= nil then
                    imgui.Separator()
                end

                -- From the closest to the farthest; the ones without a
                -- distance (another zone, not in range) go last. The index
                -- of the row in the list is kept for the "x".
                local order = {}

                for position = 1, #npc_rows do
                    order[position] = position
                end

                table.sort(order, function(a, b)
                    local da = tonumber(npc_rows[a].distance) or math.huge
                    local db = tonumber(npc_rows[b].distance) or math.huge

                    if da ~= db then
                        return da < db
                    end

                    return a < b
                end)

                for position, index in ipairs(order) do
                    local row = npc_rows[index]

                    -- A line between the NPCs.
                    if position > 1 then
                        imgui.Separator()
                    end

                    -- The Fame Checkers have their own icon before the name.
                    local name_icon = 0

                    if controller.IsFameChecker
                        and controller.IsFameChecker(row.name) then

                        name_icon = fame_ui.inline_icon()
                    elseif controller.GetMissionGiverIcon then
                        -- A Gate Guard: the mission available or not.
                        local giver_icon = controller.GetMissionGiverIcon(row.name)

                        if giver_icon ~= nil then
                            name_icon = fame_ui.inline_icon(giver_icon)
                        end
                    end

                    shadow_text(
                        richtext.COLORS.npc,
                        fit_text(row.name, available - cscaled(24) - name_icon)
                    )

                    -- A small, dim "x": an invisible button with two lines
                    -- drawn over it, lighter when the mouse is on it.
                    local cross = cscaled(14)

                    imgui.SameLine(window_width - cscaled(12) - cross)

                    if imgui.InvisibleButton(
                        '##CompassNpcRemove' .. index,
                        { cross, cross }
                    ) then
                        remove_index = index
                    end

                    do
                        local min_x, min_y = imgui.GetItemRectMin()
                        local max_x, max_y = imgui.GetItemRectMax()
                        local cx = (min_x + max_x) * 0.5
                        local cy = (min_y + max_y) * 0.5
                        local arm = cross * 0.22
                        local color = imgui.GetColorU32(
                            imgui.IsItemHovered()
                                and colors.cross_hover
                                or colors.cross
                        )
                        local list = imgui.GetWindowDrawList()

                        list:AddLine(
                            { cx - arm, cy - arm },
                            { cx + arm, cy + arm },
                            color,
                            1.2
                        )
                        list:AddLine(
                            { cx - arm, cy + arm },
                            { cx + arm, cy - arm },
                            color,
                            1.2
                        )
                    end

                    if imgui.IsItemHovered() and imgui.SetTooltip then
                        imgui.SetTooltip(tx('Remove'))
                    end

                    -- The quests of an NPC added by the proximity alert: a
                    -- click opens the quest in the Journal.
                    local previous = nil

                    for number, quest in ipairs(row.quests or {}) do
                        -- A thin line between one quest and the next, in the
                        -- gap under the previous one.
                        if previous ~= nil then
                            pcall(function()
                                imgui.GetWindowDrawList():AddLine(
                                    { previous.min_x - 3, previous.max_y + 3 },
                                    { previous.min_x + available, previous.max_y + 3 },
                                    imgui.GetColorU32({ 0.60, 0.60, 0.60, 0.30 }),
                                    1
                                )
                            end)
                        end

                        if number > 3 then
                            shadow_text(
                                colors.text_dim,
                                string.format(
                                    tx('+%d more'), #row.quests - 3
                                )
                            )

                            break
                        end

                        -- The small icon of the quest before its name: the
                        -- same ones as over the NPC in the game world.
                        local icon_kind = quest.repeatable and 'repeatable'
                            or (quest.active and 'progress' or 'available')
                        local icon = controller.worldmark
                            and controller.worldmark.GetIcon
                            and controller.worldmark.GetIcon(icon_kind)
                        local icon_left = nil
                        local icon_width = 0

                        if icon ~= nil and imgui.Dummy and imgui.SameLine then
                            local icon_height = imgui.GetTextLineHeight()

                            icon_width = icon_height * icon.width / icon.height

                            if pcall(imgui.Dummy, { icon_width, icon_height }) then
                                pcall(function()
                                    local min_x, min_y = imgui.GetItemRectMin()
                                    local max_x, max_y = imgui.GetItemRectMax()

                                    icon_left = min_x

                                    imgui.GetWindowDrawList():AddImage(
                                        icon.id,
                                        { min_x, min_y },
                                        { max_x, max_y },
                                        { 0, 0 },
                                        { 1, 1 },
                                        imgui.GetColorU32({ 1, 1, 1, 1 })
                                    )
                                end)

                                imgui.SameLine(0, 4)
                                icon_width = icon_width + 4
                            else
                                icon_width = 0
                            end
                        end

                        shadow_text(
                            quest.active and { 0.55, 0.95, 0.55, 1.00 } or colors.text,
                            fit_text(quest.name, available - icon_width)
                        )

                        pcall(function()
                            local min_x = imgui.GetItemRectMin()
                            local _, max_y = imgui.GetItemRectMax()

                            previous = {
                                min_x = math.min(min_x, icon_left or min_x),
                                max_y = max_y,
                            }
                        end)

                        -- A shaded box and a line under the text, brighter
                        -- with the mouse over it, so it looks clickable.
                        pcall(function()
                            local min_x, min_y = imgui.GetItemRectMin()
                            local max_x, max_y = imgui.GetItemRectMax()
                            local over = imgui.IsItemHovered()
                            local list = imgui.GetWindowDrawList()

                            -- The box also covers the icon.
                            min_x = math.min(min_x, icon_left or min_x)

                            list:AddRectFilled(
                                { min_x - 3, min_y },
                                { max_x + 3, max_y + 1 },
                                imgui.GetColorU32(quest.active and {
                                    0.35, 0.85, 0.40, over and 0.38 or 0.18,
                                } or {
                                    0.45, 0.65, 1.00, over and 0.38 or 0.18,
                                }),
                                3
                            )
                            list:AddLine(
                                { min_x - 3, max_y + 1 },
                                { max_x + 3, max_y + 1 },
                                imgui.GetColorU32(quest.active and {
                                    0.55, 0.95, 0.55, over and 1.00 or 0.60,
                                } or {
                                    0.60, 0.78, 1.00, over and 1.00 or 0.60,
                                }),
                                1
                            )
                        end)

                        if imgui.IsItemHovered() then
                            if imgui.SetTooltip then
                                imgui.SetTooltip(tx('Opens the quest sheet'))
                            end

                            if imgui.IsItemClicked() then
                                if controller.OpenQuestSheet then
                                    controller.OpenQuestSheet(quest.id)
                                elseif controller.OpenQuestFromCompass then
                                    controller.OpenQuestFromCompass(quest.id)
                                end
                            end
                        end
                    end

                    local line
                    local color = colors.text
                    local row_color, row_message, zone_bold

                    if row.status == 'found' or row.status == 'known' then
                        -- Only the meters, in the color of the distance.
                        line = distance_text(row.distance)
                        row_color = proximity(row.distance)
                        color = row_color or color
                        row_color = nil
                    elseif row.status == 'otherzone' then
                        line = tx('In another zone:') .. ' '
                        zone_bold = zone_label(row.zone)
                        color = colors.text_dim

                        if row.next_zone ~= nil then
                            row_color = colors.text_dim
                            row_message = tx('Next:') .. ' '
                                .. zone_label(row.next_zone)
                        end
                    elseif row.status == 'far' then
                        line = tx('Not in range') .. '  '
                            .. zone_label(row.zone)
                        color = colors.text_dim
                    else
                        line = tx('Compass unavailable')
                        color = colors.text_dim
                    end

                    if zone_bold ~= nil then
                        sheetx.shadow_zone_text(
                            color, line, zone_bold, available
                        )
                    else
                        shadow_text(color, fit_text(line, available))
                    end

                    if row_message then
                        shadow_text(row_color, row_message)
                    end
                end
            end

            if remove_index ~= nil then
                controller.RemoveCompassNpc(remove_index)
            end

            -- The search box.
            if controller.SearchCompassNpcs
                and controller.AddCompassNpc
                and imgui.InputText ~= nil
                and (
                    controller.GetCompassSearchVisible == nil
                    or controller.GetCompassSearchVisible()
                ) then

                imgui.Separator()
                imgui.PushItemWidth(available)

                local typed = imgui.InputText(
                    '##CompassSearch',
                    search_buffer,
                    41
                )

                imgui.PopItemWidth()

                local active = imgui.IsItemActive()

                if active then
                    note_input_active = true
                end

                -- Hint inside the empty box.
                if search_buffer[1] == '' and not active then
                    local box_x, box_y = imgui.GetItemRectMin()
                    local _, box_bottom = imgui.GetItemRectMax()

                    imgui.GetWindowDrawList():AddText(
                        {
                            box_x + 8,
                            box_y
                                + (
                                    (box_bottom - box_y)
                                    - imgui.GetTextLineHeight()
                                ) * 0.5,
                        },
                        imgui.GetColorU32(colors.text_dim),
                        tx('Search an NPC')
                    )
                end

                if typed or search_text ~= search_buffer[1] then
                    search_text = search_buffer[1]
                    search_results = controller.SearchCompassNpcs(search_text)
                end

                for index, item in ipairs(search_results) do
                    if imgui.Selectable(
                        fit_text(
                            item.name .. ' - ' .. zone_label(item.zone),
                            available
                        ) .. '##CompassResult' .. index
                    ) then
                        local added, problem =
                            controller.AddCompassNpc(item.name, item.zone)

                        if problem == 'full' then
                            search_notice = {
                                time = now,
                                text = string.format(
                                    tx('The NPC list is full (%d). Remove one first.'),
                                    controller.compass
                                        and controller.compass.NPC_MAX or 5
                                ),
                            }
                        end

                        search_buffer[1] = ''
                        search_text = ''
                        search_results = {}

                        break
                    end
                end

                if #search_text >= 2 and #search_results == 0 then
                    shadow_text(colors.text_dim, tx('No NPC matches.'))
                end

                if search_notice ~= nil then
                    if now - search_notice.time < 4 then
                        shadow_text(colors.text_dim, search_notice.text)
                    else
                        search_notice = nil
                    end
                end
            end

            -- Remember the size: the fit of the first frames, then whatever
            -- the player drags it to.
            if refit > 0 then
                refit = refit - 1
                last_w = window_width

                if refit == 0 and controller.SetCompassSize then
                    controller.SetCompassSize(window_width, window_height)
                end
            else
                if controller.SetCompassSize
                    and (
                        saved_w == nil
                        or math.abs(window_width - saved_w) > 2
                        or math.abs(window_height - saved_h) > 2
                    ) then

                    controller.SetCompassSize(window_width, window_height)
                end

                -- New content that does not fit (an NPC was added): fit
                -- again, once for each content.
                local signature = state.status .. #npc_rows .. '/' .. #pin_rows

                if zone_route ~= nil then
                    signature = signature .. 'r' .. tostring(
                        zone_route.route and zone_route.route.hops or 0
                    )
                end

                for _, row in ipairs(npc_rows) do
                    signature = signature .. row.status .. #(row.quests or {})
                end

                for _, row in ipairs(pin_rows) do
                    signature = signature .. row.status
                end

                -- Only when the content changed while the window was open:
                -- the first signature seen (also right after loading a
                -- saved size) is never a reason to override the size the
                -- player chose.
                local previous = clipped_signature

                clipped_signature = signature

                if previous ~= nil
                    and signature ~= previous
                    and imgui.GetScrollMaxY
                    and imgui.GetScrollMaxY() > 1 then

                    refit = 3
                    last_w = window_width
                end
            end

            -- Remember where the player put the window.
            if controller.SetCompassPosition then
                controller.SetCompassPosition(x, y)
            end
        end

        imgui.End()

        if font_pushed then
            imgui.PopFont()
        end

        imgui.PopStyleColor(3)

        pop_theme()
    end
end

-- Settings window ---------------------------------------------------------

local settings_was_open = false
local settings_restore = false

local function settings_percent(value)
    return string.format('%d%%', math.floor((value or 0) * 100 + 0.5))
end

-- The bar that separates the sections (and the groups inside Alerts).
function sheetx.settings_divider()
    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()
end

local function draw_settings_header(label)
    sheetx.settings_divider()
    imgui.PushStyleColor(ImGuiCol_Text, colors.gold)
    imgui.TextWrapped(label)
    imgui.PopStyleColor()
    imgui.Spacing()
end

-- Label on the left and [-] value [+] on the right. Clicking the value goes
-- back to the default.
-- Width the controls of the Settings window can use: the window without its
-- inner margins (12 px a side in Original, wider in Legacy) and without the
-- scroll bar when the content is taller than the window.
function sheetx.settings_inner(width)
    local pad = theme.WindowPadding()[1]
    local bar = 0

    if imgui.GetScrollMaxY and imgui.GetScrollMaxY() > 0 then
        bar = 14
    end

    return width - pad * 2 - bar, pad
end

-- The windows without a title bar close with a small X at the right of their
-- first row. `open` is the { true } table that goes to imgui.Begin.
function sheetx.close_row(open)
    local size = scaled(26)
    local inner, pad = sheetx.settings_inner(imgui.GetWindowWidth())

    imgui.SetCursorPosX(pad + inner - size)

    if imgui.Button('X##WindowClose', { size, size }) then
        open[1] = false
    end

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(tx('Close'))
    end
end

-- A size of window that does not pass 90% of the screen.
function sheetx.fit_screen(w, h)
    local ok, screen_w, screen_h = pcall(function()
        local size = imgui.GetIO().DisplaySize

        return size.x or size[1], size.y or size[2]
    end)

    if ok and screen_w and screen_h then
        return math.min(w, math.floor(screen_w * 0.9)),
            math.min(h, math.floor(screen_h * 0.9))
    end

    return w, h
end

local function draw_settings_stepper(id, label, value_text, on_step, on_reset)
    if imgui.AlignTextToFramePadding then
        imgui.AlignTextToFramePadding()
    end

    imgui.TextColored(colors.text, label)

    local small = SETTINGS_BUTTON_HEIGHT

    -- The value button is as wide as its text needs (the padding of the
    -- style is 8 on each side), so "100%" is never cut.
    local middle = math.max(
        scaled(84),
        math.ceil((imgui.CalcTextSize(value_text)) + 24)
    )
    local gap = 6
    local total = small * 2 + middle + gap * 2

    local inner, pad = sheetx.settings_inner(imgui.GetWindowWidth())

    -- When the label leaves no room for the buttons, they go on the next
    -- line (the label would be under them).
    local label_w = imgui.CalcTextSize(label)

    if not (type(label_w) == 'number'
        and label_w + 12 + total + 6 > inner) then

        imgui.SameLine()
    end

    imgui.SetCursorPosX(pad + inner - total - 6)

    if imgui.Button('-##' .. id .. '_minus', { small, small }) then
        on_step(-1)
    end

    imgui.SameLine(0, gap)

    if imgui.Button(
        value_text .. '##' .. id .. '_value',
        { middle, small }
    ) then
        on_reset()
    end

    imgui.SameLine(0, gap)

    if imgui.Button('+##' .. id .. '_plus', { small, small }) then
        on_step(1)
    end
end

local function draw_settings_checkbox(id, label, value, on_change)
    local box = { value == true }

    -- A label wider than the window goes on more than one line: the box
    -- alone, and the text next to it wrapped at the edge of the window (a
    -- click on the text also changes the box).
    local inner = sheetx.settings_inner(imgui.GetWindowWidth())
    local label_w = imgui.CalcTextSize(label)
    local box_w = imgui.GetFrameHeight and imgui.GetFrameHeight() or 30

    if type(label_w) == 'number'
        and type(box_w) == 'number'
        and label_w + box_w + 12 > inner then

        if imgui.Checkbox('##' .. id, box) then
            on_change(box[1])
        end

        imgui.SameLine(0, 8)
        imgui.TextWrapped(label)

        if imgui.IsItemClicked and imgui.IsItemClicked() then
            on_change(not (value == true))
        end

        return
    end

    if imgui.Checkbox(label .. '##' .. id, box) then
        on_change(box[1])
    end
end

-- A button that looks pressed while it is the current choice.
local function draw_settings_choice(label, active, width)
    if active then
        imgui.PushStyleColor(ImGuiCol_Button, colors.button_active)
    end

    -- The button is never narrower than its text (without the ##id).
    local shown = tostring(label):match('^(.-)##') or tostring(label)

    width = math.max(width, math.ceil((imgui.CalcTextSize(shown)) + 24))

    -- ...and never wider than the window: a text that does not fit is
    -- shortened with "...".
    local inner = sheetx.settings_inner(imgui.GetWindowWidth())

    if type(inner) == 'number' and inner > 0 and width > inner then
        width = math.floor(inner)

        local id = tostring(label):match('(##.*)$') or ''

        label = fit_text(shown, width - 24) .. id
    end

    local clicked =
        imgui.Button(
            label,
            { width, SETTINGS_BUTTON_HEIGHT }
        )

    if active then
        imgui.PopStyleColor()
    end

    return clicked
end

-- The look of one kind of alert: background, text size and color. group is
-- 'new' (new quests and missions) or 'done' (completed ones).
local function draw_alert_style_group(group, header, no_background)
    if not (controller.GetAlertStyle
        and controller.AdjustAlertOpacity
        and controller.AdjustAlertSize
        and controller.SetAlertColor
        and controller.GetAlertPalette) then

        return
    end

    local style = controller.GetAlertStyle(group)
    local palette = controller.GetAlertPalette()

    sheetx.settings_divider()
    imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)
    imgui.TextWrapped(header)
    imgui.PopStyleColor()

    if not no_background then
        draw_settings_stepper(
            'alert_' .. group .. '_bg',
            tx('Alert background'),
            settings_percent(style.opacity),
            function(direction)
                controller.AdjustAlertOpacity(group, direction)
            end,
            function()
                controller.SetAlertOpacity(group, 0.70)
            end
        )
    end

    draw_settings_stepper(
        'alert_' .. group .. '_size',
        tx('Alert text size'),
        settings_percent(style.size),
        function(direction)
            controller.AdjustAlertSize(group, direction)
        end,
        function()
            controller.SetAlertSize(group, 1.0)
        end
    )

    imgui.TextColored(colors.text, tx('Alert color'))

    if draw_settings_choice(
        tx('Default') .. '##alert_' .. group .. '_color0',
        style.color == 0,
        scaled(84)
    ) then
        controller.SetAlertColor(group, 0)
    end

    local box = scaled(32)

    local inner, pad = sheetx.settings_inner(imgui.GetWindowWidth())

    for index, color in ipairs(palette) do
        -- A square that does not fit at the end of the line goes on the next.
        local at_x = imgui.GetCursorPosX and imgui.GetCursorPosX()

        if not (type(at_x) == 'number'
            and at_x + 6 + box > pad + inner + 4) then

            imgui.SameLine(0, 6)
        end

        imgui.PushStyleColor(ImGuiCol_Button, color)
        imgui.PushStyleColor(ImGuiCol_ButtonHovered, lighten(color, 0.10))
        imgui.PushStyleColor(ImGuiCol_ButtonActive, lighten(color, 0.20))

        local clicked =
            imgui.Button(
                '##alert_' .. group .. '_color' .. index,
                { box, box }
            )

        imgui.PopStyleColor(3)

        -- The chosen color gets a white frame.
        if style.color == index then
            local min_x, min_y = imgui.GetItemRectMin()
            local max_x, max_y = imgui.GetItemRectMax()
            local draw = imgui.GetWindowDrawList()
            local white = imgui.GetColorU32({ 1, 1, 1, 1 })

            draw:AddLine({ min_x, min_y }, { max_x, min_y }, white, 2.0)
            draw:AddLine({ max_x, min_y }, { max_x, max_y }, white, 2.0)
            draw:AddLine({ max_x, max_y }, { min_x, max_y }, white, 2.0)
            draw:AddLine({ min_x, max_y }, { min_x, min_y }, white, 2.0)
        end

        if clicked then
            controller.SetAlertColor(group, index)
        end
    end
end

-- The buttons that show an alert on the screen, to see how it looks while
-- the settings are changed. Pressing the one that is showing hides it.
local function draw_alert_tests(width)
    if not (controller.StartAlertTest
        and controller.StopAlertTest
        and controller.GetAlertTest) then

        return
    end

    local test = controller.GetAlertTest()
    local half = math.floor((sheetx.settings_inner(width) - 8) / 2)

    local function test_button(label, kind, done, id)
        local special = kind == 'near' or kind == 'progress'
        local active =
            test ~= nil
            and not test.monster
            and not test.monster_zone
            and not test.monster_rank
            and not test.monster_ach
            and test.done == done
            and (test.near == true) == special
            and (not special or (test.progress == true) == (kind == 'progress'))
            and (special or test.kind == kind)

        if draw_settings_choice(
            tx(label) .. '##alert_test_' .. id,
            active,
            half
        ) then
            if active then
                controller.StopAlertTest()
            else
                controller.StartAlertTest(kind, done)
            end
        end
    end

    sheetx.settings_divider()
    imgui.TextColored(colors.text_dim, tx('Test the alerts'))

    -- Two buttons side by side only when the longest text fits in half the
    -- width; if not, one button per line.
    local stacked = false

    for _, label in ipairs({
        'Test: Mission Completed',
        'Test: Quest Completed',
        'Test: Items Complete',
        'Test: Quest In Progress',
    }) do
        local text_w = imgui.CalcTextSize(tx(label))

        if type(text_w) == 'number' and text_w + 24 > half then
            stacked = true
        end
    end

    if stacked then
        half = sheetx.settings_inner(width)
    end

    local function pair()
        if not stacked then
            imgui.SameLine(0, 8)
        end
    end

    test_button('Test: New Quest', 'quest', false, 'quest')
    pair()
    test_button('Test: New Mission', 'mission', false, 'mission')

    test_button('Test: Quest Completed', 'quest', true, 'quest_done')
    pair()
    test_button('Test: Mission Completed', 'mission', true, 'mission_done')

    test_button('Test: Quest Nearby', 'near', false, 'near')
    test_button('Test: Quest In Progress', 'progress', false, 'progress')

    -- The alerts of an item of a quest in progress (item obtained, and all
    -- the items of the quest).
    for _, item_test in ipairs({
        { 'Test: Item Obtained', 'item', 'item' },
        { 'Test: Items Complete', 'itemdone', 'item_done' },
    }) do
        local item_active = test ~= nil
            and test.item == true
            and (test.complete == true) == (item_test[2] == 'itemdone')

        if draw_settings_choice(
            tx(item_test[1]) .. '##alert_test_' .. item_test[3],
            item_active,
            half
        ) then
            if item_active then
                controller.StopAlertTest()
            else
                controller.StartAlertTest(item_test[2], false)
            end
        end

        if item_test[2] == 'item' then
            pair()
        end
    end

    -- The alerts of the monsters: a defeat, a zone with monsters to
    -- discover, a rank up and an achievement. The field of the test has the
    -- name of its kind.
    for position, monster_test in ipairs({
        { 'Test: Monster Defeated', 'monster' },
        { 'Test: Monsters to Discover', 'monster_zone' },
        { 'Test: Rank Up', 'monster_rank' },
        { 'Test: Achievement', 'monster_ach' },
    }) do
        local monster_active = test ~= nil and test[monster_test[2]] == true

        if draw_settings_choice(
            tx(monster_test[1]) .. '##alert_test_' .. monster_test[2],
            monster_active,
            half
        ) then
            if monster_active then
                controller.StopAlertTest()
            else
                controller.StartAlertTest(monster_test[2], false)
            end
        end

        if position % 2 == 1 then
            pair()
        end
    end

    imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)
    imgui.TextWrapped(
        tx('The test stays on the screen until you press it again or close the settings.')
    )
    imgui.PopStyleColor()
end

local function draw_settings_window()
    local wanted =
        controller
        and controller.GetSettingsOpen
        and controller.GetSettingsOpen()

    if not wanted or not can_draw_ui() then
        settings_was_open = false

        return
    end

    if not settings_was_open then
        settings_was_open = true
        settings_restore = true
    end

    if settings_restore then
        settings_restore = false

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        local saved_w, saved_h

        if controller.GetSettingsSize then
            saved_w, saved_h = controller.GetSettingsSize()
        end

        imgui.SetNextWindowSize({
            saved_w or scaled(480),
            saved_h or scaled(640),
        })

        imgui.SetNextWindowPos({
            ((journal and journal.visible and journal.x) or 40) + 100,
            ((journal and journal.visible and journal.y) or 40) + 100,
        })
    end

    -- Always fully opaque, so it stays readable while the opacity changes.
    push_theme(true)

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    scalex.before('settings')

    if imgui.Begin(
        tx('Settings') .. '###JournalSettings',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
    ) then
        scalex.after('settings')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        draw_window_panel(draw, x, y, width, height, true)

        sheetx.close_row(open)

        -- Remember the size the player gives the window.
        if controller.SetSettingsSize and controller.GetSettingsSize then
            local kept_w, kept_h = controller.GetSettingsSize()

            kept_w = kept_w or scaled(480)
            kept_h = kept_h or scaled(640)

            if math.abs(width - kept_w) > 2
                or math.abs(height - kept_h) > 2 then

                controller.SetSettingsSize(width, height)
            end
        end

        -- Language
        if controller.GetLanguage and controller.SetLanguage then
            draw_settings_header(tx('Language'))

            local half = math.floor((sheetx.settings_inner(width) - 8) / 2)
            local es = controller.GetLanguage() == 'es'

            if draw_settings_choice('English##settings_en', not es, half)
                and es then

                controller.SetLanguage('en')
            end

            imgui.SameLine(0, 8)

            if draw_settings_choice(
                tx('Spanish') .. '##settings_es',
                es,
                half
            ) and not es then

                controller.SetLanguage('es')
            end
        end

        -- Theme
        draw_settings_header(tx('Theme'))

        do
            local half = math.floor((sheetx.settings_inner(width) - 8) / 2)
            local legacy = theme.Get() == 'legacy'

            if draw_settings_choice(
                tx(theme.LABELS.original) .. '##settings_theme_original',
                not legacy,
                half
            ) and legacy then

                theme.Set('original')
            end

            imgui.SameLine(0, 8)

            if draw_settings_choice(
                tx(theme.LABELS.legacy) .. '##settings_theme_legacy',
                legacy,
                half
            ) and not legacy then

                theme.Set('legacy')
            end
        end

        -- Journal
        draw_settings_header(tx('Journal'))

        if controller.GetTextScale then
            draw_settings_stepper(
                'journal_text_size',
                tx('Text size'),
                settings_percent(controller.GetTextScale()),
                function(direction)
                    controller.AdjustTextScale(direction)
                end,
                function()
                    controller.SetTextScale(1.0)
                end
            )
        end

        if controller.GetJournalOpacity then
            draw_settings_stepper(
                'journal_opacity',
                tx('Background opacity'),
                settings_percent(controller.GetJournalOpacity()),
                function(direction)
                    controller.AdjustJournalOpacity(direction)
                end,
                function()
                    controller.SetJournalOpacity(1.0)
                end
            )
        end

        local lists = {
            {
                'hide_missions',
                'Hide complete missions',
                controller.GetHideCompleteMissions,
                controller.SetHideCompleteMissions,
            },
            {
                'hide_quests',
                'Hide complete quests',
                controller.GetHideCompleteQuests,
                controller.SetHideCompleteQuests,
            },
            {
                'show_missions',
                'Show missions not started',
                controller.GetShowNotStartedMissions,
                controller.SetShowNotStartedMissions,
            },
            {
                'show_quests',
                'Show quests not started',
                controller.GetShowNotStartedQuests,
                controller.SetShowNotStartedQuests,
            },
        }

        for _, row in ipairs(lists) do
            if row[3] and row[4] then
                draw_settings_checkbox(
                    row[1],
                    tx(row[2]),
                    row[3](),
                    row[4]
                )
            end
        end

        if controller.GetJournalMiniButton
            and controller.SetJournalMiniButton then

            draw_settings_checkbox(
                'mini_button',
                tx('Show Journal button on close'),
                controller.GetJournalMiniButton(),
                controller.SetJournalMiniButton
            )
        end

        -- Tracker
        draw_settings_header(tx('Tracker'))

        local pin =
            controller.GetPinState and controller.GetPinState()

        if pin and controller.SetPinVisible then
            draw_settings_checkbox(
                'tracker_visible',
                tx('Show the Tracker'),
                pin.visible,
                controller.SetPinVisible
            )
        end

        if pin and controller.TogglePinMode then
            if imgui.Button(
                tx(
                    pin.mode == 'tabs'
                        and 'Mode: Tabs'
                        or 'Mode: Stacked'
                ) .. '##settings_mode',
                { sheetx.settings_inner(width), SETTINGS_BUTTON_HEIGHT }
            ) then
                controller.TogglePinMode()
            end
        end

        if controller.GetPinScale and controller.AdjustPinScale then
            draw_settings_stepper(
                'tracker_size',
                tx('Size'),
                string.format('%.1fx', controller.GetPinScale()),
                function(direction)
                    controller.AdjustPinScale(direction)
                end,
                function()
                    controller.SetPinScale(1.0)
                end
            )
        end

        if controller.GetPinOpacity then
            draw_settings_stepper(
                'tracker_opacity',
                tx('Opacity'),
                settings_percent(controller.GetPinOpacity()),
                function(direction)
                    controller.AdjustPinOpacity(direction)
                end,
                function()
                    controller.SetPinOpacity(1.0)
                end
            )
        end

        if controller.GetPinBackground then
            draw_settings_stepper(
                'tracker_background',
                tx('Background'),
                settings_percent(controller.GetPinBackground()),
                function(direction)
                    controller.AdjustPinBackground(direction)
                end,
                function()
                    controller.SetPinBackground(0.0)
                end
            )
        end

        if controller.GetPinShowNext and controller.SetPinShowNext then
            draw_settings_checkbox(
                'tracker_next',
                tx('Show next step'),
                controller.GetPinShowNext(),
                controller.SetPinShowNext
            )
        end

        if pin and controller.SetPinAutoZone then
            draw_settings_checkbox(
                'tracker_auto',
                tx('Auto step on zone change'),
                pin.auto_zone,
                controller.SetPinAutoZone
            )
        end

        if pin and controller.SetAutoPinQuests then
            draw_settings_checkbox(
                'tracker_auto_pin',
                tx('Pin active quests automatically'),
                pin.auto_pin,
                controller.SetAutoPinQuests
            )
        end

        -- Compass
        if controller.GetCompassOpacity and controller.AdjustCompassOpacity then
            draw_settings_header(tx('Compass'))

            if controller.GetCompassTextScale then
                draw_settings_stepper(
                    'compass_text_size',
                    tx('Text size'),
                    settings_percent(controller.GetCompassTextScale()),
                    function(direction)
                        controller.AdjustCompassTextScale(direction)
                    end,
                    function()
                        controller.SetCompassTextScale(1.0)
                    end
                )
            end

            draw_settings_stepper(
                'compass_opacity',
                tx('Background opacity'),
                settings_percent(controller.GetCompassOpacity()),
                function(direction)
                    controller.AdjustCompassOpacity(direction)
                end,
                function()
                    controller.SetCompassOpacity(1.0)
                end
            )

            if controller.GetCompassSearchVisible
                and controller.SetCompassSearchVisible then

                draw_settings_checkbox(
                    'compass_search',
                    tx('Show the NPC search'),
                    controller.GetCompassSearchVisible(),
                    controller.SetCompassSearchVisible
                )
            end

            -- The arrows over the NPCs in the game world (/journal mark)
            if controller.GetWorldMark and controller.SetWorldMark then
                draw_settings_checkbox(
                    'world_mark',
                    tx('Arrow over the compass NPC in the game'),
                    controller.GetWorldMark(),
                    controller.SetWorldMark
                )

                if controller.GetWorldMarkAll and controller.SetWorldMarkAll then
                    draw_settings_checkbox(
                        'world_mark_all',
                        tx('Arrows over all the NPCs of the compass'),
                        controller.GetWorldMarkAll(),
                        controller.SetWorldMarkAll
                    )
                end

                if controller.GetWorldMarkActive and controller.SetWorldMarkActive then
                    draw_settings_checkbox(
                        'world_mark_active',
                        tx('Green arrow over the NPC of each quest in progress'),
                        controller.GetWorldMarkActive(),
                        controller.SetWorldMarkActive
                    )
                end

                if controller.GetWorldMarkEdge and controller.SetWorldMarkEdge then
                    draw_settings_checkbox(
                        'world_mark_edge',
                        tx('Arrow at the edge of the screen for NPCs out of view'),
                        controller.GetWorldMarkEdge(),
                        controller.SetWorldMarkEdge
                    )
                end
            end
        end

        -- Alerts of new quests and missions
        if controller.GetAnnounceEnabled and controller.SetAnnounceEnabled then
            draw_settings_header(tx('Alerts'))

            draw_settings_checkbox(
                'alert_enabled',
                tx('New quest / mission alert'),
                controller.GetAnnounceEnabled(),
                controller.SetAnnounceEnabled
            )

            if controller.GetAnnounceSound and controller.SetAnnounceSound then
                draw_settings_checkbox(
                    'alert_sound',
                    tx('Alert sound'),
                    controller.GetAnnounceSound(),
                    controller.SetAnnounceSound
                )
            end

            if controller.GetAnnounceAsk and controller.SetAnnounceAsk then
                draw_settings_checkbox(
                    'alert_ask',
                    tx('Ask to pin in the Tracker'),
                    controller.GetAnnounceAsk(),
                    controller.SetAnnounceAsk
                )
            end

            if controller.GetNearEnabled and controller.SetNearEnabled then
                draw_settings_checkbox(
                    'alert_near',
                    tx('Alert when entering a zone: quests in progress there'),
                    controller.GetNearEnabled(),
                    controller.SetNearEnabled
                )
            end

            if controller.GetItemAlertEnabled
                and controller.SetItemAlertEnabled then

                draw_settings_checkbox(
                    'alert_items',
                    tx('Alert when you get an item for a quest in progress'),
                    controller.GetItemAlertEnabled(),
                    controller.SetItemAlertEnabled
                )
            end

            if controller.GetProxEnabled and controller.SetProxEnabled then
                draw_settings_checkbox(
                    'alert_prox',
                    tx('Alert when close to an NPC who starts a quest (30 y)'),
                    controller.GetProxEnabled(),
                    controller.SetProxEnabled
                )

                if controller.GetProxCompass and controller.SetProxCompass then
                    draw_settings_checkbox(
                        'alert_prox_compass',
                        tx('Add and remove those NPCs in the compass automatically'),
                        controller.GetProxCompass(),
                        controller.SetProxCompass
                    )
                end
            end

            -- The look of each kind of alert.
            draw_alert_style_group('new', tx('New quest / mission alerts'))
            draw_alert_style_group('done', tx('Completed alerts'))
            draw_alert_style_group('monster', tx('Monster alerts'))
            draw_alert_style_group('near', tx('Quest nearby alerts'))

            draw_alert_tests(width)

            -- The banner with the name of the zone (zonebanner.lua).
            draw_alert_style_group('zone', tx('Zone name banner'), true)

            if draw_settings_choice(
                tx('Test: Zone Name') .. '##zone_banner_test',
                false,
                sheetx.settings_inner(width)
            ) then
                local banner = require('zonebanner')

                if banner.Replay then
                    banner.Replay(controller)
                end
            end
        end

        -- Windows
        if controller.ResetWindowPositions then
            draw_settings_header(tx('Windows'))

            if imgui.Button(
                tx('Reset window positions') .. '##settings_reset',
                { sheetx.settings_inner(width), SETTINGS_BUTTON_HEIGHT }
            ) then
                controller.ResetWindowPositions()
            end
        end

        sheetx.settings_divider()

        imgui.TextColored(
            colors.text_dim,
            'Journal ' .. tostring(addon and addon.version or '')
        )
    end

    imgui.End()

    if not open[1] then
        controller.SetSettingsOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- Guide window ------------------------------------------------------------

local guide_was_open = false
local guide_restore = false
local guide_scroll_top = false

-- A text of the guide in the current language (it falls back to English).
local function guide_text(text)
    return tostring(i18n.step(text))
end

-- Splits a title into lines that fit in max_width (word by word).
local function wrap_guide_title(text, max_width)
    local lines = {}
    local line = ''

    for word in tostring(text):gmatch('%S+') do
        local candidate = line == '' and word or (line .. ' ' .. word)

        if line ~= '' and (imgui.CalcTextSize(candidate)) > max_width then
            lines[#lines + 1] = line
            line = word
        else
            line = candidate
        end
    end

    if line ~= '' then
        lines[#lines + 1] = line
    end

    if #lines == 0 then
        lines[1] = tostring(text)
    end

    return lines
end

-- Local patch: NPC names in the guide are clickable (they point the compass
-- at the NPC, as in the quest steps). Each paragraph needs its own id for
-- the click areas, so a counter numbers them; it restarts with each section.
local guide_paragraph_count = 0

local function draw_guide_paragraph(text, color)
    local shown = guide_text(text)

    guide_paragraph_count = guide_paragraph_count + 1

    richtext.draw_wrapped(
        shown,
        {
            styles = get_styles(),
            color = color or colors.text,
            size = step_font_size,
            on_npc = npc_click(shown),
            id = 'guide_' .. guide_paragraph_count,
            npc_tooltip = tx('Click to point the compass at it'),
        }
    )

    imgui.Spacing()
end

-- Shows the quests named in a text as lines that open them in the Journal.
local function draw_guide_quest_links(links, section)
    for _, link in ipairs(links) do
        if draw_quest_link(link, section) then
            if controller.ShowJournal then
                controller.ShowJournal()
            end

            controller.JumpToQuest(link.id)
        end
    end
end

local function draw_guide_bullets(items)
    local can_dot =
        imgui.GetCursorScreenPos
        and imgui.Indent
        and imgui.Unindent

    for _, item in ipairs(items) do
        -- Local patch: an item that starts with "- " is a sub-point of the
        -- one above: indented further, with a smaller, hollow dot.
        local sub = type(item) == 'string' and item:sub(1, 2) == '- '

        if sub then
            item = item:sub(3)
        end

        if can_dot then
            local shift = sub and 18 or 0

            if shift > 0 then
                imgui.Indent(shift)
            end

            local dot_x, dot_y = imgui.GetCursorScreenPos()
            local line_height = imgui.GetTextLineHeight()

            imgui.Indent(18)

            draw_guide_paragraph(item)

            imgui.Unindent(18)

            if sub then
                imgui.GetWindowDrawList():AddCircle(
                    { dot_x + 6, dot_y + line_height * 0.55 },
                    2.5,
                    imgui.GetColorU32(colors.gold),
                    12,
                    1.2
                )
            else
                imgui.GetWindowDrawList():AddCircleFilled(
                    { dot_x + 6, dot_y + line_height * 0.55 },
                    3,
                    imgui.GetColorU32(colors.gold)
                )
            end

            if shift > 0 then
                imgui.Unindent(shift)
            end
        else
            draw_guide_paragraph('- ' .. item)
        end
    end
end

-- Rows with a label and a text, for example the level of a milestone. When
-- links is true the quests named in the text become links.
local function draw_guide_pairs(rows, links, block_id)
    for index, row in ipairs(rows) do
        imgui.TextColored(colors.gold, guide_text(row[1]))

        if imgui.Indent then
            imgui.Indent(14)
        end

        draw_guide_paragraph(row[2])

        if links and controller.GetTextQuestLinks then
            draw_guide_quest_links(
                controller.GetTextQuestLinks(row[2]),
                'guide_' .. block_id .. '_' .. index
            )
        end

        if imgui.Unindent then
            imgui.Unindent(14)
        end

        imgui.Spacing()
    end
end

-- One quest of a table: its name (a link to the quest in the Journal), the
-- infinity sign when it is repeatable, who gives it, what to do and the
-- reward.
local function draw_guide_quests(rows, block_id)
    for index, row in ipairs(rows) do
        local link = nil

        if controller.GetTextQuestLinks then
            link = controller.GetTextQuestLinks(row.name)[1]
        end

        if link ~= nil and link.name == row.name then
            draw_guide_quest_links({ link }, 'guide_' .. block_id .. '_' .. index)
        else
            imgui.TextColored(colors.gold, row.name)
        end

        if imgui.Indent then
            imgui.Indent(14)
        end

        draw_guide_paragraph(tx('Start: ') .. guide_text(row.start), colors.text_dim)
        draw_guide_paragraph(tx('What you do: ') .. guide_text(row.what))
        draw_guide_paragraph(tx('Reward: ') .. guide_text(row.reward), colors.text_dim)

        local repeatable = row.repeatable
        local value =
            repeatable == true and tx('Yes')
            or repeatable == false and tx('No')
            or guide_text(tostring(repeatable))

        if repeatable == true
            and imgui.GetCursorScreenPos
            and imgui.Dummy then

            local line_height = imgui.GetTextLineHeight()
            local icon_width, icon_height =
                icons.infinity_size(line_height)
            local icon_x, icon_y = imgui.GetCursorScreenPos()

            icons.draw_infinity(
                imgui.GetWindowDrawList(),
                icon_x,
                icon_y + (line_height - icon_height) * 0.5,
                icon_width,
                icon_height,
                imgui.GetColorU32(colors.repeatable),
                2.0
            )

            imgui.Dummy({ icon_width + 6, line_height })
            imgui.SameLine(0, 0)
        end

        imgui.TextColored(
            colors.text_dim,
            tx('Repeatable: ') .. value
        )

        if imgui.Unindent then
            imgui.Unindent(14)
        end

        imgui.Spacing()
        imgui.Separator()
        imgui.Spacing()
    end
end

local function draw_guide_section(section)
    guide_paragraph_count = 0

    imgui.TextColored(colors.gold, guide_text(section.title))
    imgui.Separator()
    imgui.Spacing()

    for index, block in ipairs(section.blocks) do
        local block_id = tostring(section.id) .. '_' .. index

        if block.p then
            draw_guide_paragraph(block.p)
        elseif block.h then
            imgui.TextColored(colors.gold, guide_text(block.h))
            imgui.Spacing()
        elseif block.note then
            draw_guide_paragraph(block.note, colors.gold)
        elseif block.bullets then
            draw_guide_bullets(block.bullets)
            imgui.Spacing()
        elseif block.pairs then
            draw_guide_pairs(block.pairs, block.links == true, block_id)
        elseif block.quests then
            draw_guide_quests(block.quests, block_id)
        end
    end
end

local function draw_guide_window()
    local wanted =
        controller
        and controller.GetGuideOpen
        and controller.GetGuideOpen()

    if not wanted or not can_draw_ui() then
        guide_was_open = false

        return
    end

    local guide = controller.GetGuide and controller.GetGuide()

    if guide == nil then
        controller.SetGuideOpen(false)

        return
    end

    if not guide_was_open then
        guide_was_open = true
        guide_restore = true
        guide_scroll_top = true
    end

    if guide_restore then
        guide_restore = false

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        -- Twice the size it had (760 x 680), without passing the screen.
        imgui.SetNextWindowSize({
            sheetx.fit_screen(scaled(1520), scaled(1360))
        })

        imgui.SetNextWindowPos({
            ((journal and journal.visible and journal.x) or 40) + 60,
            ((journal and journal.visible and journal.y) or 40) + 60,
        })
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    scalex.before('guide')

    if imgui.Begin(
        tx('New adventurer guide') .. '###JournalGuide',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
    ) then
        scalex.after('guide')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        draw_window_panel(draw, x, y, width, height, true)

        sheetx.close_row(open)

        local current = controller.GetGuideSection()

        -- The group (first level title and the points under it) that the
        -- current section belongs to.
        local current_group = current

        while current_group > 1
            and guide.sections[current_group]
            and guide.sections[current_group].level == 2 do

            current_group = current_group - 1
        end

        -- The contents, on the left. It is as wide as the longest title
        -- needs (within limits) and a title that is still too long goes on
        -- more than one line, so no title is cut.
        imgui.PushStyleColor(ImGuiCol_ChildBg, transparent)

        local contents_width =
            math.max(
                scaled(280),
                math.min(scaled(400), math.floor(width * 0.45))
            )

        if imgui.BeginChild(
            '##GuideContents',
            { contents_width, -1 },
            true
        ) then
            -- Room for the padding of the panel and its scroll bar.
            local usable = contents_width - 40

            for index, section in ipairs(guide.sections) do
                -- A first level title with points under it is a heading:
                -- yellow letters, a triangle (down when its group is the open
                -- one) and the number of points it holds.
                local points = 0

                if section.level ~= 2 then
                    local following = index + 1

                    while guide.sections[following]
                        and guide.sections[following].level == 2 do

                        points = points + 1
                        following = following + 1
                    end
                end

                local heading = points > 0
                -- The points go further in than the headings.
                local indent = section.level == 2 and '     ' or ''

                if heading then
                    indent = '  '
                end

                local title = guide_text(section.title)

                if heading then
                    title = title .. '  (' .. points .. ')'
                end

                -- The lines after the first one are indented a little.
                local room =
                    usable
                    - (imgui.CalcTextSize(indent))
                    - (imgui.CalcTextSize('  '))
                local lines =
                    wrap_guide_title(title, room)

                if heading then
                    imgui.PushStyleColor(ImGuiCol_Text, colors.favorite)
                end

                for line_index, line in ipairs(lines) do
                    -- Every line of a title selects it.
                    if imgui.Selectable(
                        indent
                            .. (line_index > 1 and '  ' or '')
                            .. line
                            .. '##guide_section_' .. index
                            .. '_' .. line_index,
                        index == current
                    ) then
                        controller.SetGuideSection(index)
                        guide_scroll_top = true
                    end

                    if heading and line_index == 1 then
                        local min_x, min_y = imgui.GetItemRectMin()
                        local max_x, max_y = imgui.GetItemRectMax()
                        local mid = (min_y + max_y) * 0.5
                        local open_group = index == current_group
                        local list_draw = imgui.GetWindowDrawList()
                        local color = imgui.GetColorU32(colors.favorite)

                        if open_group then
                            list_draw:AddTriangleFilled(
                                { min_x + 4, mid - 3 },
                                { min_x + 14, mid - 3 },
                                { min_x + 9, mid + 4 },
                                color
                            )
                        else
                            list_draw:AddTriangleFilled(
                                { min_x + 5, mid - 5 },
                                { min_x + 5, mid + 5 },
                                { min_x + 12, mid },
                                color
                            )
                        end
                    end
                end

                if heading then
                    imgui.PopStyleColor()
                end
            end
        end

        imgui.EndChild()

        imgui.SameLine()

        -- The text of the section, on the right.
        if imgui.BeginChild('##GuideContent', { 0, -1 }, true) then
            if guide_scroll_top and imgui.SetScrollY then
                imgui.SetScrollY(0)
            end

            guide_scroll_top = false

            local section = guide.sections[current]

            if section ~= nil then
                draw_guide_section(section)
            end

            imgui.Spacing()
            imgui.Separator()

            imgui.TextColored(
                colors.text_dim,
                tx('Source: ') .. tostring(guide.source)
                    .. ' (' .. tostring(guide.url) .. ')'
            )
        end

        imgui.EndChild()

        imgui.PopStyleColor()
    end

    imgui.End()

    if not open[1] then
        controller.SetGuideOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- Camps window ------------------------------------------------------------

local camps_was_open = false
local camps_restore = false

-- One camp: the levels it is good for, the monsters, the area (with its
-- coordinates) and a note when the table has one. In the list by range the
-- camps that are good for the level are highlighted and the rest are dimmed.
local function draw_camps_entries(entries, highlight)
    for _, entry in ipairs(entries) do
        local camp = entry.camp
        local prefix = string.format('Lv%d-Lv%d  ', camp.from, camp.to)
        local monsters = nil
        local forced = nil

        if camp.monsters ~= '' then
            monsters = tostring(i18n.step(camp.monsters))

            -- The names of the monsters are always in the color of the
            -- monsters (red), even when they are not in the list of names.
            forced = {
                {
                    s = #prefix + 1,
                    e = #prefix + #monsters,
                    kind = 'monster',
                },
            }
        else
            monsters = tx('(monsters not listed)')
        end

        local where = camp.area

        if camp.loc ~= nil then
            where = where .. ' ' .. camp.loc
        end

        local text = prefix .. monsters .. '  -  ' .. where

        if camp.note ~= nil then
            text = text .. ' (' .. tostring(i18n.step(camp.note)) .. ')'
        end

        local color = colors.text

        if highlight then
            color = entry.match and colors.gold or colors.text_dim
        end

        richtext.draw_wrapped(
            text,
            {
                styles = get_styles(),
                forced = forced,
                color = color,
                size = step_font_size,
            }
        )

        -- Local patch: how the monsters detect you, and the notes of the
        -- guide, dimmed and indented under the camp.
        local extra = {}

        if camp.aggro ~= nil then
            extra[#extra + 1] = tx('Aggro') .. ': ' .. camp.aggro
        end

        for _, line in ipairs(camp.details or {}) do
            extra[#extra + 1] = tostring(i18n.step(line))
        end

        if #extra > 0 then
            imgui.Indent(scaled(18))
            imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)

            for _, line in ipairs(extra) do
                imgui.TextWrapped(line)
            end

            imgui.PopStyleColor()
            imgui.Unindent(scaled(18))
        end

        imgui.Spacing()
    end
end

local function draw_camps_list(view)
    local highlight = controller.GetCampsMode() == 'bracket'
    local shown = 0

    for _, kind in ipairs({ 'standard', 'alternate' }) do
        if #view[kind] > 0 then
            shown = shown + #view[kind]

            -- Local patch: the guide has one list, so no "Standard" title.
            local title = kind == 'standard' and 'Standard camps' or 'Alternate camps'

            if #view.alternate == 0 then
                title = 'Camps'
            end

            imgui.TextColored(
                colors.gold,
                tx(title)
            )

            imgui.Separator()
            imgui.Spacing()

            draw_camps_entries(view[kind], highlight)
        end
    end

    if shown == 0 then
        if view.level < 10 then
            richtext.draw_wrapped(
                tx('Camps start at level 10. For levels 1-10, see the guide for new adventurers.'),
                {
                    styles = get_styles(),
                    color = colors.text,
                    size = step_font_size,
                }
            )

            imgui.Spacing()

            if imgui.Button(
                tx('Open the guide') .. '##camps_open_guide',
                { scaled(200), SETTINGS_BUTTON_HEIGHT }
            ) then
                controller.OpenGuideSection('levels1')
            end
        else
            imgui.TextColored(colors.text_dim, tx('No camps for this level.'))
        end
    end
end

local function draw_camps_window()
    local wanted =
        controller
        and controller.GetCampsOpen
        and controller.GetCampsOpen()

    if not wanted or not can_draw_ui() then
        camps_was_open = false

        return
    end

    if not controller.GetCamps or controller.GetCamps() == nil then
        controller.SetCampsOpen(false)

        return
    end

    if not camps_was_open then
        camps_was_open = true
        camps_restore = true
    end

    if camps_restore then
        camps_restore = false

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        -- Twice as tall as it was (640), without passing the screen.
        imgui.SetNextWindowSize({
            sheetx.fit_screen(scaled(700), scaled(1280))
        })

        imgui.SetNextWindowPos({
            ((journal and journal.visible and journal.x) or 40) + 80,
            ((journal and journal.visible and journal.y) or 40) + 80,
        })
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    scalex.before('camps')

    if imgui.Begin(
        tx('Camps') .. '###JournalCamps',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
    ) then
        scalex.after('camps')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        draw_window_panel(draw, x, y, width, height, true)

        sheetx.close_row(open)

        -- How the camps are listed: the ones for the level, or a whole range.
        local mode = controller.GetCampsMode()
        local half = math.floor((sheetx.settings_inner(width) - 8) / 2)

        if draw_settings_choice(
            tx('For your level') .. '##camps_mode_level',
            mode == 'level',
            half
        ) then
            controller.SetCampsMode('level')
        end

        imgui.SameLine(0, 8)

        if draw_settings_choice(
            tx('By level range') .. '##camps_mode_bracket',
            mode == 'bracket',
            half
        ) then
            controller.SetCampsMode('bracket')
        end

        imgui.Spacing()

        -- The level. Clicking the number goes back to the level of the
        -- character, when the game gives it.
        draw_settings_stepper(
            'camps_level',
            tx('Level'),
            tostring(controller.GetCampsLevel()),
            function(direction)
                controller.AdjustCampsLevel(direction)
            end,
            function()
                controller.UseGameLevelForCamps()
            end
        )

        if controller.GetPlayerLevel and controller.GetPlayerLevel() ~= nil then
            local my_level =
                tx('My level') .. ' (' .. controller.GetPlayerLevel() .. ')'

            if imgui.Button(
                my_level .. '##camps_my_level',
                {
                    math.max(
                        scaled(200),
                        math.ceil((imgui.CalcTextSize(my_level)) + 24)
                    ),
                    SETTINGS_BUTTON_HEIGHT,
                }
            ) then
                controller.UseGameLevelForCamps()
            end
        end

        -- The ranges of the table (10, 20 ... 70).
        if mode == 'bracket' then
            imgui.Spacing()

            local current = controller.GetCampsBracket()

            for index, level in ipairs(controller.GetCampsBrackets()) do
                if index > 1 then
                    imgui.SameLine(0, 6)
                end

                -- Local patch: the buttons show the ranges of the guide.
                local label = controller.GetCampsBracketLabel
                    and controller.GetCampsBracketLabel(level)
                    or tostring(level)

                if draw_settings_choice(
                    label .. '##camps_bracket_' .. level,
                    level == current,
                    math.max(scaled(58), math.ceil((imgui.CalcTextSize(label)) + scaled(20)))
                ) then
                    controller.SetCampsBracket(level)
                end
            end
        end

        imgui.Spacing()

        draw_settings_checkbox(
            'camps_hide_shadow',
            tx('Hide (S) areas'),
            controller.GetCampsHideShadow(),
            controller.SetCampsHideShadow
        )

        if imgui.IsItemHovered() and imgui.SetTooltip then
            imgui.SetTooltip(tx('Areas marked (S) belong to Wings of the Goddess.'))
        end

        imgui.Separator()

        -- The camps.
        if imgui.BeginChild('##CampsList', { 0, -1 }, true) then
            draw_camps_list(controller.GetCampsView())

            -- Local patch: where the camps come from.
            local camps = controller.GetCamps()

            if camps ~= nil and camps.source ~= nil then
                imgui.Spacing()
                imgui.TextColored(colors.text_dim, tx('Source') .. ': ' .. camps.source)
            end
        end

        imgui.EndChild()
    end

    imgui.End()

    if not open[1] then
        controller.SetCampsOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- Fame of the nations, as it was when the player last talked to the Fame
-- Checker NPC of each one (see fame.lua).
function fame_ui.draw()
    local wanted =
        controller
        and controller.GetFameOpen
        and controller.GetFameOpen()

    if not wanted or not can_draw_ui() then
        fame_ui.was_open = false

        return
    end

    if not controller.GetFameLevels or not controller.GetFameAreas then
        controller.SetFameOpen(false)

        return
    end

    if not fame_ui.was_open then
        fame_ui.was_open = true
        fame_ui.restore = true
    end

    if fame_ui.restore then
        fame_ui.restore = false

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        local saved_w, saved_h

        if controller.GetFameSize then
            saved_w, saved_h = controller.GetFameSize()
        end

        imgui.SetNextWindowSize({
            saved_w or scaled(520),
            saved_h or scaled(430),
        })

        imgui.SetNextWindowPos({
            ((journal and journal.visible and journal.x) or 40) + 80,
            ((journal and journal.visible and journal.y) or 40) + 80,
        })
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    scalex.before('fame')

    if imgui.Begin(
        tx('Fame') .. '###JournalFame',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
    ) then
        scalex.after('fame')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        draw_window_panel(draw, x, y, width, height, true)

        sheetx.close_row(open)

        -- Remember the size the player gives the window.
        if controller.SetFameSize and controller.GetFameSize then
            local kept_w, kept_h = controller.GetFameSize()

            kept_w = kept_w or scaled(520)
            kept_h = kept_h or scaled(430)

            if math.abs(width - kept_w) > 2
                or math.abs(height - kept_h) > 2 then

                controller.SetFameSize(width, height)
            end
        end

        local fame = controller.GetFameLevels()

        local first_area = true

        for _, area in ipairs(controller.GetFameAreas()) do
            local entry = fame[area.key]

            -- A line between the nations.
            if not first_area then
                imgui.Spacing()
                imgui.Separator()
                imgui.Spacing()
            end

            first_area = false

            imgui.TextColored(colors.gold, area.name)
            imgui.SameLine()

            if entry then
                imgui.TextColored(
                    colors.favorite,
                    string.format(tx('Level %d'), entry.level)
                )
            else
                imgui.TextColored(colors.text_dim, tx('Unknown'))
            end

            if entry and entry.time and entry.time > 0 then
                imgui.TextColored(
                    colors.text_dim,
                    string.format(
                        tx('Last read: %s.'),
                        os.date('%Y-%m-%d', entry.time)
                    )
                )
            end

            imgui.TextColored(colors.text_dim, tx('Talk to:'))

            -- The Fame Checkers: each name is clickable and points the
            -- compass at the NPC, as in the steps of the quests.
            for _, checker in ipairs(area.checkers) do
                fame_ui.inline_icon()
                imgui.TextColored(richtext.COLORS.npc, checker.npc)

                if imgui.IsItemHovered() then
                    pcall(function()
                        local min_x, min_y = imgui.GetItemRectMin()
                        local max_x, max_y = imgui.GetItemRectMax()

                        imgui.GetWindowDrawList():AddLine(
                            { min_x, max_y },
                            { max_x, max_y },
                            imgui.GetColorU32(richtext.COLORS.npc),
                            1
                        )
                    end)

                    if imgui.SetTooltip then
                        imgui.SetTooltip(
                            tx('Click to point the compass at it')
                        )
                    end

                    if imgui.IsItemClicked()
                        and controller.AddCompassNpcByName then

                        controller.AddCompassNpcByName(
                            checker.npc,
                            checker.place
                        )
                    end
                end

                imgui.SameLine()
                imgui.TextColored(colors.text_dim, checker.place)
            end
        end
    end

    imgui.End()

    if not open[1] then
        controller.SetFameOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- The results of the search box: every mission and every quest that has the
-- text, whatever its area, category or the filters of the lists. It replaces
-- the list while the box has a text.
local function draw_search_results(width)
    local match_names = {
        npc = 'NPC',
        place = 'Place',
        reward = 'Reward',
        requires = 'Requires',
        type = 'Type',
    }

    imgui.PushStyleColor(
        ImGuiCol_ChildBg,
        transparent
    )

    if imgui.BeginChild(
        '##JournalSearchResults',
        { width, -1 },
        child_border
    ) then
        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local w, h = imgui.GetWindowSize()

        draw_panel(draw, x, y, w, h, true)

        local available = w - scaled(70)
        local result = controller.GetSearchResults
            and controller.GetSearchResults(os.clock())
            or nil

        -- The item that is open in the Journal now.
        local open_kind = nil
        local open_item = nil

        if controller.GetJournalMode() == 1 then
            open_kind = 'mission'
            open_item = controller.GetSelectedMission()
        else
            open_kind = 'quest'
            open_item = controller.GetSelectedQuest()
        end

        if result == nil
            or (#result.missions == 0 and #result.quests == 0) then

            imgui.Spacing()
            imgui.TextColored(colors.text_dim, tx('No matches found.'))
        else
            local function group(title, rows, total, kind)
                if #rows == 0 then
                    return
                end

                imgui.Spacing()
                imgui.TextColored(colors.gold, string.format(tx(title), total))

                for _, row in ipairs(rows) do
                    local selected = open_kind == kind
                        and open_item ~= nil
                        and tostring(open_item.id) == tostring(row.id)
                        and tostring(open_item.name or '') == row.name

                    local status = display_status(row)

                    local clicked = draw_selector_item(
                        row.name,
                        selected,
                        status_dot_color(status),
                        row.repeatable == true,
                        kind .. tostring(row.area or row.category)
                            .. tostring(row.id),
                        controller.IsFavorite ~= nil
                            and controller.IsFavorite(
                                kind == 'mission' and 'Mission' or 'Quest',
                                row
                            ) == true,
                        sheetx.row_icon(row, status, kind == 'mission')
                    )

                    -- A double click opens the sheet, as in the lists.
                    local double_clicked = imgui.IsMouseDoubleClicked ~= nil
                        and imgui.IsItemHovered()
                        and imgui.IsMouseDoubleClicked(0)

                    draw_status_at_item_end(status)

                    if clicked or double_clicked then
                        if controller.OpenSearchResult(row) then
                            local sheet = kind == 'mission' and 'Mission'
                                or 'Quest'

                            if double_clicked then
                                open_sheet(sheet)
                            elseif sheet_open then
                                sheet_kind = sheet
                            end
                        end
                    end

                    -- Where it is, and what the text matched.
                    local detail = row.label or ''

                    if row.match == 'step' then
                        detail = detail .. '  -  '
                            .. string.format(tx('Step %d'), row.step or 0)
                    elseif match_names[row.match] ~= nil then
                        detail = detail .. '  -  ' .. tx(match_names[row.match])
                    end

                    imgui.TextColored(
                        colors.text_dim,
                        '      ' .. fit_text(detail, available)
                    )
                end

                if total > #rows then
                    imgui.TextColored(
                        colors.text_dim,
                        fit_text(
                            string.format(
                                tx('Showing the first %d of %d.'),
                                #rows,
                                total
                            ),
                            available
                        )
                    )
                end
            end

            -- Local patch: the results of the open tab come first.
            if open_kind == 'quest' then
                group('Quests (%d)', result.quests, result.total_quests, 'quest')
                group('Missions (%d)', result.missions, result.total_missions, 'mission')
            else
                group('Missions (%d)', result.missions, result.total_missions, 'mission')
                group('Quests (%d)', result.quests, result.total_quests, 'quest')
            end
        end
    end

    imgui.EndChild()

    imgui.PopStyleColor()
end

-- The Journal as a book (Legacy theme): the toolbar on the bar of leather,
-- the list on the left page and the details on the right page. book is the
-- layout of theme.BookLayout. A field of sheetx, not a local (limit of 200).
function sheetx.draw_book(is_mission_mode, book)
    -- The children (list and details) keep a small margin of their own.
    imgui.PushStyleVar(ImGuiStyleVar_WindowPadding, { 10, 8 })

    -- No scroll bar on the pages of the book: the lists and the sheet still
    -- scroll with the mouse wheel.
    local hide_bars = ImGuiStyleVar_ScrollbarSize ~= nil

    if hide_bars then
        imgui.PushStyleVar(ImGuiStyleVar_ScrollbarSize, 0)
    end

    if sheetx.toolbar_open then
        imgui.SetCursorPosX(book.bar_pad)
        imgui.SetCursorPosY(
            math.max(0, math.floor((book.bar_h - ui_bar_height) * 0.5) - 2)
        )

        draw_journal_toolbar(is_mission_mode)
    else
        -- No bar: the two buttons sit at the right corner of the book, in
        -- the margin above the right page.
        local right_edge = book.left_x + book.page_w * 2 + book.gap

        -- The menu (three lines) goes at their left, as in the other theme.
        local corner_entries = sheetx.menu_entries()
        local corner_w = ui_button_height * 2 + 8

        if #corner_entries > 0 then
            corner_w = corner_w + ui_button_height + 8
        end

        imgui.SetCursorPosX(math.max(0, right_edge - corner_w))
        imgui.SetCursorPosY(
            math.max(
                6,
                math.floor((book.page_y - ui_button_height) * 0.5)
            )
        )

        if #corner_entries > 0 then
            sheetx.menu_button()
            imgui.SameLine(0, 8)
        end

        sheetx.corner_buttons()
        sheetx.menu_popup(corner_entries)
    end

    imgui.SetCursorPosX(book.left_x)
    imgui.SetCursorPosY(book.page_y)

    if controller.GetSearchText
        and controller.GetSearchResults
        and controller.GetSearchText() ~= '' then

        draw_search_results(book.page_w)
    else
        draw_journal_list(is_mission_mode, book.page_w)
    end

    imgui.SameLine(0, book.gap)

    if is_mission_mode then
        local areas = controller.GetMissionAreas()
        local selection = controller.GetMissionSelection()

        draw_details_panel(
            'Mission',
            book.page_w,
            areas[selection.area_index]
        )
    else
        draw_details_panel('Quest', book.page_w)
    end

    if hide_bars then
        imgui.PopStyleVar()
    end

    imgui.PopStyleVar()
end

local function draw_journal()
    if not can_draw_ui()
        or not controller
        or not controller.GetJournalWindowState then

        return
    end

    local state =
        controller.GetJournalWindowState()

    if not state
        or not state.visible then

        -- The bar is hidden again for the next time the Journal opens.
        sheetx.toolbar_open = false
        sheetx.clear_search()

        return
    end

    -- "Reset window positions" in the settings: read the position again.
    if journal_last_reset_count == nil then
        journal_last_reset_count = state.reset_count
    elseif state.reset_count ~= journal_last_reset_count then
        journal_last_reset_count = state.reset_count
        journal_restore_window = true
    end

    if journal_restore_window then
        journal_restore_window =
            restore_window(
                state,
                journal_restore_window
            )
    end

    -- The book of the Legacy theme needs the size of the window before the
    -- theme is pushed (the margin of its bottom edge is the padding).
    -- With the bar hidden the book fills the whole window.
    theme.BeginBook(
        sheetx.toolbar_open and (ui_bar_height + 30) or 0,
        state.width,
        state.height
    )

    push_theme()

    local font_pushed =
        journal_font ~= nil

    if font_pushed then
        imgui.PushFont(
            journal_font,
            journal_font_size
        )
    end

    local is_mission_mode =
        controller.GetJournalMode() == 1

    local open = {
        state.visible,
    }

    local title =
        is_mission_mode
        and tx('Mission Journal')
        or tx('Quest Journal')

    scalex.before('journal')

    if imgui.Begin(
        title .. '###JournalWindow',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoTitleBar
            + ImGuiWindowFlags_NoScrollbar
            + ImGuiWindowFlags_NoScrollWithMouse
            + ImGuiWindowFlags_NoCollapse
    ) then
        scalex.after('journal')

        local draw =
            imgui.GetWindowDrawList()

        local x, y =
            imgui.GetWindowPos()

        local width, height =
            imgui.GetWindowSize()

        draw_window_panel(
            draw,
            x,
            y,
            width,
            height,
            true
        )

        -- The Legacy theme draws the Journal as an open book: the toolbar on
        -- the bar of leather, the list on the left page and the details on
        -- the right page. Without the pictures this is nil and the window is
        -- drawn as always.
        local book = theme.BookLayout(width, height)

        if book then
            sheetx.draw_book(is_mission_mode, book)
        else
            draw_journal_toolbar(
                is_mission_mode
            )

            imgui.Spacing()

            local content_width =
                imgui.GetWindowWidth()

            local spacing = 10

            local details_width =
                math.floor(
                    content_width * 0.32
                )

            local list_width =
                content_width
                - details_width
                - spacing

            if controller.GetSearchText
                and controller.GetSearchResults
                and controller.GetSearchText() ~= '' then

                draw_search_results(list_width)
            else
                draw_journal_list(
                    is_mission_mode,
                    list_width
                )
            end

            imgui.SameLine(
                0,
                spacing
            )

            if is_mission_mode then
                local areas =
                    controller.GetMissionAreas()

                local selection =
                    controller.GetMissionSelection()

                draw_details_panel(
                    'Mission',
                    details_width,
                    areas[
                        selection.area_index
                    ]
                )
            else
                draw_details_panel(
                    'Quest',
                    details_width
                )
            end
        end

        local wx, wy =
            imgui.GetWindowPos()

        local ww, wh =
            imgui.GetWindowSize()

        if wx ~= state.x
            or wy ~= state.y
            or ww ~= state.width
            or wh ~= state.height then

            if controller.SetJournalGeometry then
                controller.SetJournalGeometry(
                    wx,
                    wy,
                    ww,
                    wh
                )
            end
        end

        -- Local patch: the window panel covers ImGui's own resize grip, so
        -- draw a visible one over the bottom-right corner (drag it to resize).
        local grip = 18
        local gx, gy = wx + ww - 2, wy + wh - 2
        local hovered = imgui.IsMouseHoveringRect
            and imgui.IsMouseHoveringRect({ gx - grip, gy - grip }, { gx, gy }, false)
        local grip_color = imgui.GetColorU32(
            hovered and { 0.80, 0.84, 0.95, 0.75 } or { 0.80, 0.84, 0.95, 0.40 }
        )
        local clipped = pcall(imgui.PushClipRect, { wx, wy }, { wx + ww, wy + wh }, false)
        draw:AddTriangleFilled({ gx, gy - grip }, { gx, gy }, { gx - grip, gy }, grip_color)
        if clipped then
            imgui.PopClipRect()
        end
    end

    imgui.End()

    if sheetx.close_requested then
        sheetx.close_requested = false
        open[1] = false
    end

    if not open[1] then
        controller.SetJournalVisible(false)
        controller.SetJournalMini(true)

        journal_mini_restore_window =
            true

        close_popups()
        reset_repeat()
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

local function controller_vertical(
    direction
)
    if not controller then
        return
    end

    if journal_mode_popup_open then
        controller.SetJournalMode(
            controller.GetJournalMode() == 1
                and 2
                or 1
        )

        return
    end

    if journal_area_popup_open then
        if direction < 0 then
            controller.SelectPreviousMissionArea()
        else
            controller.SelectNextMissionArea()
        end

        return
    end

    if journal_category_popup_open then
        if direction < 0 then
            controller.SelectPreviousQuestCategory()
        else
            controller.SelectNextQuestCategory()
        end

        return
    end

    local state =
        controller.GetJournalWindowState()

    if not state
        or not state.visible then

        return
    end

    if controller.GetJournalMode() == 1 then
        if direction < 0 then
            controller.SelectPreviousMission()
        else
            controller.SelectNextMission()
        end
    else
        if direction < 0 then
            controller.SelectPreviousQuest()
        else
            controller.SelectNextQuest()
        end
    end
end

local function controller_horizontal(
    direction
)
    if not controller then
        return
    end

    local state =
        controller.GetJournalWindowState()

    if not state
        or not state.visible then

        return
    end

    if journal_mode_popup_open
        or journal_area_popup_open
        or journal_category_popup_open then

        return
    end

    if controller.GetJournalMode() == 1 then
        if direction < 0 then
            controller.SelectPreviousMissionArea()
        else
            controller.SelectNextMissionArea()
        end
    else
        if direction < 0 then
            controller.SelectPreviousQuestCategory()
        else
            controller.SelectNextQuestCategory()
        end
    end
end

local function controller_move(button)
    if button == DPAD.UP then
        controller_vertical(-1)

    elseif button == DPAD.DOWN then
        controller_vertical(1)

    elseif button == DPAD.LEFT then
        controller_horizontal(-1)

    elseif button == DPAD.RIGHT then
        controller_horizontal(1)
    end
end

local function controller_confirm()
    if not controller then
        return
    end

    local state =
        controller.GetJournalWindowState()

    if not state
        or not state.visible then

        return
    end

    if journal_mode_popup_open
        or journal_area_popup_open
        or journal_category_popup_open then

        close_popups()
        imgui.CloseCurrentPopup()

        return
    end

    -- Same as double-clicking the row with the mouse: open the sheet.
    open_sheet(
        controller.GetJournalMode() == 1
            and 'Mission'
            or 'Quest'
    )
end

-- Pins the selected mission or quest to the Tracker, or unpins it.
local function controller_toggle_pin()
    if not controller
        or not controller.ToggleItemPin then

        return
    end

    local state =
        controller.GetJournalWindowState()

    if not state
        or not state.visible then

        return
    end

    if controller.GetJournalMode() == 1 then
        local selected =
            controller.GetSelectedMission()

        if selected then
            controller.ToggleItemPin(
                'Mission',
                selected
            )
        end
    else
        local selected =
            controller.GetSelectedQuest()

        if selected then
            controller.ToggleItemPin(
                'Quest',
                selected
            )
        end
    end
end

local function controller_cancel()
    if not controller then
        return
    end

    if journal_mode_popup_open
        or journal_area_popup_open
        or journal_category_popup_open then

        close_popups()
        imgui.CloseCurrentPopup()

        return
    end

    -- The first press closes the sheet, the next one the Journal.
    if sheet_open or progress_open
        or (controller.GetActiveOpen and controller.GetActiveOpen())
        or (controller.GetSettingsOpen and controller.GetSettingsOpen())
        or (controller.GetGuideOpen and controller.GetGuideOpen())
        or (controller.GetCampsOpen and controller.GetCampsOpen())
        or (controller.GetFameOpen and controller.GetFameOpen()) then

        sheet_open = false
        progress_open = false

        if controller.SetFameOpen then
            controller.SetFameOpen(false)
        end

        if controller.SetActiveOpen then
            controller.SetActiveOpen(false)
        end

        if controller.SetCampsOpen then
            controller.SetCampsOpen(false)
        end

        if controller.SetSettingsOpen then
            controller.SetSettingsOpen(false)
        end

        if controller.SetGuideOpen then
            controller.SetGuideOpen(false)
        end

        return
    end

    controller.SetJournalVisible(false)
    controller.SetJournalMini(true)

    journal_mini_restore_window =
        true

    journal_help_window =
        false

    reset_repeat()
end

local function update_controller_repeat()
    if controller_repeat_button == nil then
        return
    end

    if not controller then
        reset_repeat()
        return
    end

    local state =
        controller.GetJournalWindowState()

    if not state
        or not state.visible then

        controller_repeat_button = nil
        controller_repeat_time = 0

        return
    end

    local now = os.clock()

    if now < controller_repeat_time then
        return
    end

    controller_move(
        controller_repeat_button
    )

    controller_repeat_time =
        now
        + controller_repeat_interval
end

local function update_keyboard_repeat()
    if keyboard_repeat_key == nil then
        return
    end

    if not controller then
        keyboard_repeat_key = nil
        keyboard_repeat_time = 0

        return
    end

    local state =
        controller.GetJournalWindowState()

    if not state
        or not state.visible then

        keyboard_repeat_key = nil
        keyboard_repeat_time = 0

        return
    end

    local now = os.clock()

    if now < keyboard_repeat_time then
        return
    end

    if keyboard_repeat_key == KEY.UP then
        controller_vertical(-1)

    elseif keyboard_repeat_key == KEY.DOWN then
        controller_vertical(1)

    elseif keyboard_repeat_key == KEY.LEFT then
        controller_horizontal(-1)

    elseif keyboard_repeat_key == KEY.RIGHT then
        controller_horizontal(1)
    end

    keyboard_repeat_time =
        now
        + keyboard_repeat_interval
end

local function controller_enabled()
    if controller == nil then
        return journal_help_window
    end

    local state =
        controller.GetJournalWindowState()

    return (
        state ~= nil
        and state.visible
    )
        or journal_help_window
end

local function sync_journal_mini()
    if not controller
        or not controller.GetJournalWindowState
        or not controller.GetJournalMiniState
        or not controller.SetJournalMini then

        return
    end

    local state =
        controller.GetJournalWindowState()

    local mini =
        controller.GetJournalMiniState()

    if not state
        or not mini then

        return
    end

    local visible =
        not state.visible

    if mini.visible ~= visible then
        controller.SetJournalMini(
            visible
        )

        if visible then
            journal_mini_restore_window =
                true
        end
    end
end

ashita.events.register(
    'xinput_button',
    'journal_ui_xinput_button',
    function(e)
        if not controller_enabled() then
            return
        end

        if e.state == 0 then
            if controller_repeat_button
                == e.button then

                controller_repeat_button =
                    nil

                controller_repeat_time =
                    0
            end

            return
        end

        if e.button == DPAD.UP
            or e.button == DPAD.DOWN
            or e.button == DPAD.LEFT
            or e.button == DPAD.RIGHT then

            controller_move(
                e.button
            )

            controller_repeat_button =
                e.button

            controller_repeat_time =
                os.clock()
                + controller_repeat_delay

            e.blocked = true

            return
        end

        if e.button == BUTTON_A then
            controller_confirm()
            e.blocked = true

            return
        end

        if e.button == BUTTON_X then
            controller_toggle_pin()
            e.blocked = true

            return
        end

        if e.button == BUTTON_B then
            controller_cancel()
            e.blocked = true
        end
    end
)

ashita.events.register(
    'key_data',
    'journal_ui_key_data',
    function(e)
        if not controller then
            return
        end

        local state =
            controller.GetJournalWindowState()

        if (
            not state
            or not state.visible
        )
            and not journal_help_window then

            return
        end

        if not e.down then
            if (
                e.key == KEY.UP
                or e.key == KEY.DOWN
                or e.key == KEY.LEFT
                or e.key == KEY.RIGHT
            )
                and keyboard_repeat_key
                    == e.key then

                keyboard_repeat_key = nil
                keyboard_repeat_time = 0
            end

            return
        end

        if e.key == 0x01 then
            -- The first Esc closes the sheet, the next one the Journal.
            if sheet_open or progress_open
                or (
                    controller.GetActiveOpen
                    and controller.GetActiveOpen()
                )
                or (
                    controller.GetSettingsOpen
                    and controller.GetSettingsOpen()
                )
                or (
                    controller.GetGuideOpen
                    and controller.GetGuideOpen()
                )
                or (
                    controller.GetCampsOpen
                    and controller.GetCampsOpen()
                )
                or (
                    controller.GetFameOpen
                    and controller.GetFameOpen()
                ) then

                sheet_open = false
                progress_open = false

                if controller.SetFameOpen then
                    controller.SetFameOpen(false)
                end

                if controller.SetActiveOpen then
                    controller.SetActiveOpen(false)
                end

                if controller.SetCampsOpen then
                    controller.SetCampsOpen(false)
                end

                if controller.SetSettingsOpen then
                    controller.SetSettingsOpen(false)
                end

                if controller.SetGuideOpen then
                    controller.SetGuideOpen(false)
                end

                e.blocked = true

                return
            end

            controller.SetJournalVisible(
                false
            )

            journal_help_window =
                false

            close_popups()
            reset_repeat()

            e.blocked = true

            return
        end

        if not state
            or not state.visible then

            return
        end

        -- While a note is being typed every arrow key and Enter belong to
        -- the text (up and down would change the quest under the note).
        if note_input_active
            and (
                e.key == KEY.UP
                or e.key == KEY.DOWN
                or e.key == KEY.LEFT
                or e.key == KEY.RIGHT
                or e.key == 0x1C
                or e.key == 0x9C
            ) then

            return
        end

        -- While the search box has the keyboard, left, right and Enter
        -- belong to the text. Up and down still move the list.
        if journal_search_active
            and (
                e.key == KEY.LEFT
                or e.key == KEY.RIGHT
                or e.key == 0x1C
                or e.key == 0x9C
            ) then

            return
        end

        if e.key == KEY.UP
            or e.key == KEY.DOWN
            or e.key == KEY.LEFT
            or e.key == KEY.RIGHT then

            if keyboard_repeat_key
                ~= e.key then

                if e.key == KEY.UP then
                    controller_vertical(-1)

                elseif e.key == KEY.DOWN then
                    controller_vertical(1)

                elseif e.key == KEY.LEFT then
                    controller_horizontal(-1)

                else
                    controller_horizontal(1)
                end

                keyboard_repeat_key =
                    e.key

                keyboard_repeat_time =
                    os.clock()
                    + keyboard_repeat_delay
            end

            e.blocked = true

            return
        end

        if e.key == 0x1C
            or e.key == 0x9C then

            controller_confirm()
            e.blocked = true
        end
    end
)

local function draw_journal_help()
    if not journal_help_window
        or not game_ui_visible then

        return
    end

    if journal_help_restore then
        imgui.SetNextWindowSize({
            scaled(journal_help_width),
            scaled(journal_help_height),
        })

        journal_help_restore = false
    end

    push_theme()

    local font_pushed =
        journal_font ~= nil

    if font_pushed then
        imgui.PushFont(
            journal_font,
            journal_font_size
        )
    end

    local open = {
        journal_help_window,
    }

    scalex.before('help')

    if imgui.Begin(
        tx('Journal Help') .. '###JournalHelp',
        open
    ) then
        scalex.after('help')

        local draw =
            imgui.GetWindowDrawList()

        local x, y =
            imgui.GetWindowPos()

        local width, height =
            imgui.GetWindowSize()

        draw_window_panel(
            draw,
            x,
            y,
            width,
            height,
            true
        )

        imgui.TextColored(
            colors.gold,
            tx('MISSION JOURNAL COMMANDS')
        )

        imgui.Spacing()
        imgui.Separator()
        imgui.Spacing()

        local help = {
            {
                '/journal',
                tx('Open the Mission Journal.'),
            },
            {
                '/journal settings',
                tx('Open the settings window.'),
            },
            {
                '/journal guide',
                tx('Open the guide for new adventurers.'),
            },
            {
                '/journal camps',
                tx('Open the camps guide.'),
            },
            {
                '/journal help',
                tx('Show this command list in chat.'),
            },
            {
                '/journal quest',
                tx('Open the Quest Journal.'),
            },
            {
                '/journal pin',
                tx('Show or hide the pinned tracker.'),
            },
            {
                '/journal pin size [+|-|reset|<value>]',
                tx('Change the tracker size from 0.60x to 2.00x.'),
            },
            {
                '/journal pin preview [on|off]',
                tx('Show or hide the next step in the tracker.'),
            },
            {
                '/journal lang [en|es]',
                tx('Switch the Journal between English and Spanish.'),
            },
        }

        for i, entry in ipairs(help) do
            imgui.Text(
                entry[1]
            )

            imgui.TextColored(
                colors.text_dim,
                entry[2]
            )

            if i < #help then
                imgui.Spacing()
            end
        end
    end

    imgui.End()

    if not open[1] then
        journal_help_window = false
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- General notes window --------------------------------------------------------
-- On the left the notes (without a folder first, then each folder with its
-- notes), on the right the title, the folder and the text of the selected
-- note, or the name of the selected folder. notes.lua saves everything in a
-- file shared by all the characters, and also the size of this window.

-- The colors a folder can have (notes.lua keeps the number, 1 to 8).
notesx.palette = {
    { 0.90, 0.35, 0.35, 1.0 },
    { 0.95, 0.60, 0.25, 1.0 },
    { 0.95, 0.85, 0.35, 1.0 },
    { 0.45, 0.80, 0.45, 1.0 },
    { 0.35, 0.75, 0.75, 1.0 },
    { 0.40, 0.60, 0.95, 1.0 },
    { 0.68, 0.50, 0.90, 1.0 },
    { 0.92, 0.55, 0.75, 1.0 },
}

-- A bar of the color of the folder on the left of the last item.
function notesx.bar(color, width)
    local rgba = color and color > 0 and notesx.palette[color] or nil

    if rgba == nil then
        return
    end

    local min_x, min_y = imgui.GetItemRectMin()
    local _, max_y = imgui.GetItemRectMax()

    imgui.GetWindowDrawList():AddRectFilled(
        { min_x - width - 2, min_y },
        { min_x - 2, max_y },
        imgui.GetColorU32(rgba)
    )
end

function notesx.draw()
    local store = controller and controller.notes

    if store == nil
        or not store.GetOpen()
        or not can_draw_ui()
        or imgui.InputText == nil then

        notesx.was_open = false

        return
    end

    store.Tick()

    if not notesx.was_open then
        notesx.was_open = true
        notesx.key = nil
        notesx.ckey = nil
        notesx.confirm = nil

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        local saved = store.GetSize()

        imgui.SetNextWindowSize({
            saved and saved.w or scaled(720),
            saved and saved.h or scaled(540),
        })

        imgui.SetNextWindowPos({
            ((journal and journal.visible and journal.x) or 40) + 60,
            ((journal and journal.visible and journal.y) or 40) + 60,
        })
    end

    -- The player can drag the corner to resize it.
    if imgui.SetNextWindowSizeConstraints then
        imgui.SetNextWindowSizeConstraints(
            { scaled(460), scaled(300) },
            { scaled(1600), scaled(1400) }
        )
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    imgui.PushStyleColor(ImGuiCol_ResizeGrip, { 0.80, 0.84, 0.95, 0.30 })
    imgui.PushStyleColor(ImGuiCol_ResizeGripHovered, { 0.80, 0.84, 0.95, 0.60 })
    imgui.PushStyleColor(ImGuiCol_ResizeGripActive, { 0.80, 0.84, 0.95, 0.90 })

    scalex.before('notes')

    if imgui.Begin(
        tx('General notes') .. '###JournalNotes',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
    ) then
        scalex.after('notes')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        -- Remembered (the file is written a moment after the last change).
        store.SetSize(width, height)

        draw_window_panel(draw, x, y, width, height, true)

        sheetx.close_row(open)

        local list_w = math.floor(math.max(scaled(200), width * 0.32))
        local half = math.floor((list_w - 8) / 2)
        local now = os.clock()

        local sel_cat = store.GetSelectedCategory()

        if imgui.Button(
            tx('New note') .. '##NotesNew',
            { half, ui_button_height }
        ) then
            local index = store.Add(sel_cat)

            if index ~= nil then
                store.Select(store.Get(index).id)
                notesx.key = nil
                notesx.full = 0
            else
                notesx.full = now
            end
        end

        imgui.SameLine(0, 8)

        if imgui.Button(
            tx('New folder') .. '##NotesNewFolder',
            { half, ui_button_height }
        ) then
            local id = store.AddCategory()

            if id ~= nil then
                store.SelectCategory(id)
                notesx.ckey = nil
                notesx.full = 0
            else
                notesx.full = now
            end
        end

        if notesx.full > 0 and now - notesx.full < 4 then
            imgui.SameLine(0, 12)
            imgui.TextColored(
                colors.text_dim,
                tx('The notes list is full.')
            )
        end

        imgui.Spacing()

        imgui.PushStyleColor(ImGuiCol_ChildBg, transparent)

        -- The list.
        if imgui.BeginChild('##NotesList', { list_w, -1 }, child_border) then
            local rows = store.Rows()

            if #rows == 0 then
                imgui.TextWrapped(
                    tx('No notes yet. Click New note to write one.')
                )
            end

            local toggle_w = ui_button_height

            for _, row in ipairs(rows) do
                if row.kind == 'folder' then
                    local cat = row.cat

                    if imgui.Button(
                        (cat.collapsed and '+' or '-')
                            .. '##NotesFold' .. tostring(cat.id),
                        { toggle_w, ui_button_height }
                    ) then
                        store.SetCollapsed(cat.id, not cat.collapsed)
                    end

                    imgui.SameLine(0, 4)

                    if toolbar_mode_button(
                        cat.name .. ' (' .. row.count .. ')'
                            .. '##NotesCat' .. tostring(cat.id),
                        cat.id == sel_cat,
                        list_w - toggle_w - 24
                    ) then
                        store.SelectCategory(cat.id)
                    end

                    notesx.bar(cat.color, 5)
                else
                    local note = row.note
                    local indent = row.nested and scaled(24) or 0

                    if indent > 0 then
                        imgui.Dummy({ indent, 1 })
                        imgui.SameLine(0, 0)
                    end

                    if toolbar_mode_button(
                        (store.Title(note, 22) or tx('Empty note'))
                            .. '##note' .. tostring(note.id),
                        note.id == store.GetSelected(),
                        list_w - 20 - indent
                    ) then
                        store.Select(note.id)
                    end

                    if row.nested then
                        local owner = store.GetCategory(note.cat)

                        notesx.bar(owner and owner.color, 3)
                    end
                end
            end
        end

        imgui.EndChild()

        imgui.SameLine(0, 8)

        -- The right side.
        if imgui.BeginChild('##NotesEdit', { -1, -1 }, child_border) then
            -- The room of the right side. If the call is not there, it is
            -- worked out from the window.
            local avail_w, avail_h = nil, nil

            if imgui.GetContentRegionAvail ~= nil then
                local ok, aw, ah = pcall(imgui.GetContentRegionAvail)

                if ok then
                    avail_w, avail_h = tonumber(aw), tonumber(ah)
                end
            end

            avail_w = avail_w or (width - list_w - 40)
            avail_h = avail_h or (height - ui_button_height - 60)

            local index = store.IndexOfId(store.GetSelected())
            local note = index and store.Get(index) or nil
            local cat = sel_cat and store.GetCategory(sel_cat) or nil

            if cat ~= nil then
                -- A folder: its name and a delete.
                if notesx.ckey ~= cat.id then
                    notesx.ckey = cat.id
                    notesx.cbuf[1] = cat.name
                    notesx.confirm = nil
                end

                imgui.TextColored(colors.text_dim, tx('Folder'))

                imgui.PushItemWidth(math.max(120, avail_w))

                local typed = imgui.InputText(
                    '##NotesFolderName',
                    notesx.cbuf,
                    store.CAT_NAME_MAX + 1
                )

                imgui.PopItemWidth()

                if imgui.IsItemActive() then
                    note_input_active = true
                end

                if typed then
                    store.RenameCategory(cat.id, notesx.cbuf[1])
                end

                imgui.Spacing()
                imgui.TextColored(colors.text_dim, tx('Color'))

                -- No color, then the eight of the palette.
                local swatch = math.floor(ui_button_height * 0.75)

                for number = 0, store.COLOR_COUNT do
                    if number > 0 then
                        imgui.SameLine(0, 6)
                    end

                    if imgui.Button(
                        '##NotesColor' .. number,
                        { swatch, swatch }
                    ) then
                        store.SetCategoryColor(cat.id, number)
                    end

                    local min_x, min_y = imgui.GetItemRectMin()
                    local max_x, max_y = imgui.GetItemRectMax()
                    local sdraw = imgui.GetWindowDrawList()
                    local rgba = notesx.palette[number]

                    if rgba ~= nil then
                        sdraw:AddRectFilled(
                            { min_x + 3, min_y + 3 },
                            { max_x - 3, max_y - 3 },
                            imgui.GetColorU32(rgba)
                        )
                    else
                        -- None: an empty square with a slash.
                        sdraw:AddLine(
                            { min_x + 5, max_y - 5 },
                            { max_x - 5, min_y + 5 },
                            imgui.GetColorU32(colors.text_dim),
                            2.0
                        )
                    end

                    -- The chosen one has a frame.
                    if (cat.color or 0) == number then
                        sdraw:AddRect(
                            { min_x, min_y },
                            { max_x, max_y },
                            imgui.GetColorU32(colors.text),
                            0,
                            0,
                            2.0
                        )
                    end
                end

                imgui.Spacing()
                imgui.TextWrapped(
                    tx('Notes in a deleted folder are kept, without a folder.')
                )
                imgui.Spacing()

                local confirming =
                    notesx.confirm == 'c' .. cat.id
                    and now - (notesx.confirm_time or 0) < 4

                local label =
                    confirming and tx('Click again to delete')
                    or tx('Delete folder')

                if imgui.Button(
                    label .. '##NotesDeleteFolder',
                    {
                        math.max(
                            scaled(140),
                            math.ceil((imgui.CalcTextSize(label)) + 28)
                        ),
                        ui_button_height,
                    }
                ) then
                    if confirming then
                        store.DeleteCategory(cat.id)
                        store.SelectCategory(nil)
                        notesx.ckey = nil
                        notesx.confirm = nil
                    else
                        notesx.confirm = 'c' .. cat.id
                        notesx.confirm_time = now
                    end
                end
            elseif note == nil then
                imgui.TextWrapped(
                    tx('Select a note, or create a new one.')
                )
            else
                if notesx.key ~= note.id then
                    notesx.key = note.id
                    notesx.buffer[1] = note.text
                    notesx.tbuf[1] = note.title
                    notesx.confirm = nil
                end

                -- The title.
                imgui.PushItemWidth(math.max(120, avail_w))

                local title_typed = imgui.InputText(
                    '##NotesTitle',
                    notesx.tbuf,
                    store.TITLE_MAX + 1
                )

                imgui.PopItemWidth()

                local title_active = imgui.IsItemActive()

                if title_active then
                    note_input_active = true
                end

                if title_typed then
                    store.SetTitle(index, notesx.tbuf[1])
                end

                if notesx.tbuf[1] == '' and not title_active then
                    local box_x, box_y = imgui.GetItemRectMin()
                    local _, box_bottom = imgui.GetItemRectMax()

                    imgui.GetWindowDrawList():AddText(
                        {
                            box_x + 8,
                            box_y
                                + (
                                    (box_bottom - box_y)
                                    - imgui.GetTextLineHeight()
                                ) * 0.5,
                        },
                        imgui.GetColorU32(colors.text_dim),
                        tx('Title')
                    )
                end

                -- The folder of the note.
                local current = store.GetCategory(note.cat)
                local current_name =
                    current and current.name or tx('No folder')

                imgui.TextColored(colors.text_dim, tx('Folder'))
                imgui.SameLine(0, 8)

                local cats = store.GetCategories()

                if imgui.BeginCombo ~= nil
                    and imgui.EndCombo ~= nil
                    and imgui.Selectable ~= nil then

                    imgui.PushItemWidth(math.max(120, avail_w - scaled(90)))

                    if imgui.BeginCombo(
                        '##NotesFolder',
                        current_name
                    ) then
                        if imgui.Selectable(
                            tx('No folder') .. '##NotesFolder0',
                            note.cat == 0
                        ) then
                            store.SetCategory(index, 0)
                        end

                        for _, option in ipairs(cats) do
                            if imgui.Selectable(
                                option.name
                                    .. '##NotesFolder' .. tostring(option.id),
                                note.cat == option.id
                            ) then
                                store.SetCategory(index, option.id)
                            end
                        end

                        imgui.EndCombo()
                    end

                    imgui.PopItemWidth()
                else
                    -- Without a list: the button goes to the next folder.
                    if imgui.Button(
                        current_name .. '##NotesFolderCycle',
                        { math.max(120, avail_w - scaled(90)), ui_button_height }
                    ) then
                        local next_id = cats[1] and cats[1].id or 0

                        for position, option in ipairs(cats) do
                            if option.id == note.cat then
                                next_id = cats[position + 1]
                                    and cats[position + 1].id or 0
                            end
                        end

                        store.SetCategory(index, next_id)
                    end
                end

                imgui.Spacing()

                -- The text.
                local box = {
                    math.max(120, avail_w),
                    math.max(80, avail_h - 3 * ui_button_height - 40),
                }

                local typed

                if imgui.InputTextMultiline ~= nil then
                    typed = imgui.InputTextMultiline(
                        '##NotesText',
                        notesx.buffer,
                        store.TEXT_MAX + 1,
                        box
                    )
                else
                    imgui.PushItemWidth(box[1])

                    typed = imgui.InputText(
                        '##NotesText',
                        notesx.buffer,
                        store.TEXT_MAX + 1
                    )

                    imgui.PopItemWidth()
                end

                local active = imgui.IsItemActive()

                if active then
                    note_input_active = true
                end

                if typed then
                    store.SetText(index, notesx.buffer[1])
                end

                -- Hint inside the empty box.
                if notesx.buffer[1] == '' and not active then
                    local box_x, box_y = imgui.GetItemRectMin()

                    imgui.GetWindowDrawList():AddText(
                        { box_x + 8, box_y + 6 },
                        imgui.GetColorU32(colors.text_dim),
                        tx('Write your note here')
                    )
                end

                -- Delete asks for a second click.
                local confirming =
                    notesx.confirm == note.id
                    and now - (notesx.confirm_time or 0) < 4

                local label =
                    confirming and tx('Click again to delete')
                    or tx('Delete')

                if imgui.Button(
                    label .. '##NotesDelete',
                    {
                        math.max(
                            scaled(120),
                            math.ceil((imgui.CalcTextSize(label)) + 28)
                        ),
                        ui_button_height,
                    }
                ) then
                    if confirming then
                        store.Delete(index)
                        store.Select(nil)
                        notesx.key = nil
                        notesx.confirm = nil
                    else
                        notesx.confirm = note.id
                        notesx.confirm_time = now
                    end
                end

                imgui.SameLine(0, 12)
                imgui.TextColored(
                    colors.text_dim,
                    #notesx.buffer[1] .. '/' .. store.TEXT_MAX
                )
            end
        end

        imgui.EndChild()

        imgui.PopStyleColor()
    end

    imgui.End()

    imgui.PopStyleColor(3)

    if not open[1] then
        store.SetOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- The list of the zones by region (the globe button of the toolbar): a click
-- on a zone points the compass at it (the route there), another click removes
-- it. The names of the zones are read from the game (zones.names).
sheetx.zones_open = {}
sheetx.zones_filter = { '' }

function sheetx.zones_build()
    local store = controller and controller.zonelist
    local names = controller and controller.GetCompassZoneName

    if store == nil or names == nil then
        return nil
    end

    local list = {}

    for _, region in ipairs(store.Regions()) do
        local entries = {}

        for _, id in ipairs(region.zones) do
            local name = names(id)

            if type(name) == 'string' and name ~= '' and name ~= '???' then
                entries[#entries + 1] = {
                    id = id,
                    name = name,
                    key = name:lower(),
                }
            end
        end

        table.sort(entries, function(a, b)
            return a.key < b.key
        end)

        if #entries > 0 then
            list[#list + 1] = { name = region.name, zones = entries }
        end
    end

    return #list > 0 and list or nil
end


function sheetx.chat_button(label, size, accent)
    if not sheetx.chat_skin then
        return imgui.Button(label, size)
    end
    imgui.PushStyleColor(ImGuiCol_Button, transparent)
    imgui.PushStyleColor(ImGuiCol_ButtonHovered, transparent)
    imgui.PushStyleColor(ImGuiCol_ButtonActive, transparent)
    -- Reserve and activate the original control ID, without painting its label twice.
    local id_at = label:find('##', 1, true)
    local caption = id_at and label:sub(1, id_at - 1) or label
    local id = id_at and label:sub(id_at) or ('##VanaChat' .. label)
    local clicked = imgui.Button(id, size)
    imgui.PopStyleColor(3)
    local x0, y0 = imgui.GetItemRectMin()
    local x1, y1 = imgui.GetItemRectMax()
    local hovered = imgui.IsItemHovered()
    local pressed = imgui.IsItemActive()
    local art = pressed and 'pressed' or (hovered and 'hover'
        or (accent and 'accent' or 'button'))
    local draw = imgui.GetWindowDrawList()
    theme.DrawChatArt(imgui, draw, art, x0, y0, x1 - x0, y1 - y0)
    local tw, th = imgui.CalcTextSize(caption)
    local text_color = (accent or hovered or pressed)
        and { 1, 0.93, 0.77, 1 } or colors.text
    draw:AddText({ x0 + math.max(4, (x1 - x0 - tw) / 2),
        y0 + math.max(0, (y1 - y0 - (th or sheetx.chat_height * 0.7)) / 2) },
        imgui.GetColorU32(text_color), caption)
    return clicked
end

function sheetx.chat_strip(height)
    if not sheetx.chat_skin then return end
    local x, y = imgui.GetCursorScreenPos()
    local inner = sheetx.chat_inner(imgui.GetWindowWidth())
    theme.DrawChatArt(imgui, imgui.GetWindowDrawList(), 'leather',
        x - 3, y - 3, inner + 6, height + 6)
end

function sheetx.chat_panel()
    if not sheetx.chat_skin then return end
    local x, y = imgui.GetWindowPos()
    local w, h = imgui.GetWindowSize()
    theme.DrawChatArt(imgui, imgui.GetWindowDrawList(), 'frame', x, y, w, h)
end

function sheetx.chat_inner(width)
    if not sheetx.chat_skin then
        return sheetx.settings_inner(width)
    end

    local scrollbar = imgui.GetScrollMaxY and imgui.GetScrollMaxY() > 0
    return width - 38 - (scrollbar and 14 or 0), 19
end

-- Chat window -----------------------------------------------------------------
-- The chat of the users of the addon (chat.lua talks to the server): the
-- state and the Connect button, the lines and the box to write.
sheetx.chat_buf = { '' }
sheetx.pm_buf = { '' }
sheetx.chat_copy_buf = { '' }
sheetx.chat_pass = { '' }
sheetx.chat_name = { '' }
sheetx.chat_name_ready = false

-- The name written in the box becomes the name of the chat. The password box
-- belongs to a nick: when the nick changes it is loaded again.
function sheetx.chat_apply_name(store)
    if sheetx.chat_name_ready and store.SetCustomName ~= nil then
        store.SetCustomName(sheetx.chat_name[1])
        sheetx.chat_name[1] = store.GetCustomName()
    end

    if (store.ChatName and store.ChatName() or ''):lower()
        ~= sheetx.chat_pass_nick then

        sheetx.chat_pass_ready = false
    end
end

-- A line of text in a color that wraps at the edge of the window.
function sheetx.chat_wrapped(color, text)
    imgui.PushStyleColor(ImGuiCol_Text, color)
    imgui.TextWrapped(text)
    imgui.PopStyleColor()
end

-- The ball with the number of messages not read, at the corner of the chat
-- button of the bar. Red when one is important (a private message, or a
-- line that names you), gold otherwise.
function sheetx.chat_badge(min_x, min_y, max_x, max_y)
    local chat = controller and controller.chat
    local count = chat and chat.GetUnreadCount and chat.GetUnreadCount() or 0

    if count <= 0 then
        return
    end

    local text = count > 9 and '9+' or tostring(count)
    local tw, th = imgui.CalcTextSize(text)
    local radius = math.max((max_y - min_y) * 0.26, th * 0.5 + 1, tw * 0.5 + 2)
    local cx, cy = max_x - radius - 1, min_y + radius + 1
    local important = chat.HasImportantUnread and chat.HasImportantUnread()
    local draw = imgui.GetWindowDrawList()

    draw:AddCircleFilled(
        { cx, cy },
        radius,
        imgui.GetColorU32(important and { 0.86, 0.17, 0.16, 1.0 } or colors.favorite)
    )
    draw:AddText(
        { cx - tw * 0.5, cy - th * 0.5 },
        imgui.GetColorU32({ 1.0, 1.0, 1.0, 1.0 }),
        text
    )

    sheetx.badge_drawn = (sheetx.badge_drawn or 0) + 1
end

-- The box to write of the chat and of the private chats: Enter sends, the
-- Up and Down arrows bring back the messages sent before, and Tab completes
-- a nick or a name of the Journal (see share.lua). ctx is 'chat' or 'pm'.
sheetx.sent = { chat = {}, pm = {} }
sheetx.recall = { chat = { draft = '' }, pm = { draft = '' } }
sheetx.tabs = {}
sheetx.key_pending = nil
sheetx.input_ctx = nil     -- the box that had the keyboard in the last frame

-- A message was sent: it goes to the list that Up walks through.
function sheetx.sent_add(ctx, text)
    text = tostring(text or ''):gsub('^%s+', ''):gsub('%s+$', '')

    if text == '' then
        return
    end

    local list = sheetx.sent[ctx]

    if list[#list] ~= text then
        list[#list + 1] = text

        if #list > 30 then
            table.remove(list, 1)
        end
    end

    sheetx.recall[ctx].idx = nil
    sheetx.recall[ctx].draft = ''
end

-- Up (-1) or Down (+1) in the box: an older or a newer message; after the
-- newest one, what was being written. Returns true when the text changed.
function sheetx.chat_recall(ctx, buf, step)
    local list = sheetx.sent[ctx]
    local state = sheetx.recall[ctx]

    if #list == 0 then
        return false
    end

    if step < 0 then
        if state.idx == nil then
            state.draft = buf[1]
            state.idx = #list
        else
            state.idx = math.max(1, state.idx - 1)
        end

        buf[1] = list[state.idx]

        return true
    end

    if state.idx == nil then
        return false
    end

    if state.idx >= #list then
        state.idx = nil
        buf[1] = state.draft
    else
        state.idx = state.idx + 1
        buf[1] = list[state.idx]
    end

    return true
end

-- Tab: the next match for the end of the text. Returns true when it changed.
function sheetx.tab_complete(ctx, buf, limit)
    local share = controller and controller.share

    buf[1] = buf[1]:gsub('\t', '')

    if share == nil then
        return false
    end

    sheetx.tabs[ctx] = sheetx.tabs[ctx] or share.New()

    local text, what = share.Press(sheetx.tabs[ctx], buf[1], limit, ctx == 'pm')

    if text == nil then
        sheetx.set_hint(ctx, 'No matches for Tab.')

        return false
    end

    buf[1] = text
    sheetx.set_hint(ctx, 'Tab ' .. what)

    return true
end

-- Draws the box and returns true when Enter was pressed in it.
function sheetx.chat_input(ctx, id, buf, limit)
    local flags = ImGuiInputTextFlags_EnterReturnsTrue
    local tab_in_text = ImGuiInputTextFlags_AllowTabInput ~= nil

    if tab_in_text then
        flags = (flags or 0) + ImGuiInputTextFlags_AllowTabInput
    end

    -- A key pressed while this box had the keyboard (see the key event).
    local key = sheetx.key_pending

    if key ~= nil and sheetx.input_ctx == ctx then
        sheetx.key_pending = nil

        local changed = false

        if key == 'up' then
            changed = sheetx.chat_recall(ctx, buf, -1)
        elseif key == 'down' then
            changed = sheetx.chat_recall(ctx, buf, 1)
        elseif key == 'tab' then
            changed = sheetx.tab_complete(ctx, buf, limit)
        end

        -- The box takes the new text when it gets the keyboard again.
        if changed and imgui.SetKeyboardFocusHere then
            imgui.SetKeyboardFocusHere()
        end
    end

    local entered = false

    if flags ~= nil then
        entered = imgui.InputText(id, buf, limit, flags)
    else
        imgui.InputText(id, buf, limit)
    end

    if imgui.IsItemActive() then
        -- Arrows and Enter are text here, not moves in the Journal.
        note_input_active = true
        sheetx.input_ctx = ctx
    elseif sheetx.input_ctx == ctx then
        sheetx.input_ctx = nil
    end

    -- With AllowTabInput the Tab key arrives as a tab character in the text.
    if tab_in_text and buf[1]:find('\t', 1, true) then
        entered = false

        if sheetx.tab_complete(ctx, buf, limit) then
            -- Next frame the box gets the keyboard again with the new text.
            if ctx == 'pm' then
                sheetx.pm_focus = true
            else
                sheetx.chat_focus = true
            end
        end
    end

    return entered == true
end

ashita.events.register('key_data', 'journal_ui_chat_keys', function(e)
    -- Only while a box of the chat has the keyboard.
    if not e.down or sheetx.input_ctx == nil then
        return
    end

    if e.key == 0xC8 then
        sheetx.key_pending = 'up'
    elseif e.key == 0xD0 then
        sheetx.key_pending = 'down'
    elseif e.key == 0x0F and ImGuiInputTextFlags_AllowTabInput == nil then
        sheetx.key_pending = 'tab'
    end
end)

function sheetx.chat_send(store)
    local text = sheetx.chat_buf[1]
    local sent, why = store.Say(text)

    if sent then
        sheetx.sent_add('chat', text)
        sheetx.chat_buf[1] = ''
        sheetx.chat_hint = nil
    elseif why == 'fast' then
        sheetx.chat_hint = 'Too fast: wait a moment.'
    elseif why == 'offline' then
        sheetx.chat_hint = 'You are not connected.'
    elseif why == 'notjoined' then
        sheetx.chat_hint = 'You are not in this channel: click it to join.'
    end

    -- The keyboard stays in the box after a message.
    sheetx.chat_focus = true
end

-- The list of channels, at the left: a click opens one. A band of color at
-- the left of each button, a green border around the ones the chat is
-- connected to. There is no way to leave a channel, only to disconnect.
function sheetx.chat_channel_button(store, entry, width, close_id)
    local label, inside, unread, _, mention = store.GetChannelInfo(entry.name)
    local pm_view = store.GetPrivateOpen ~= nil and store.GetPrivateOpen()
    local is_active = entry.name == (
        entry.private and store.GetPrivateActive() or store.GetActive()
    )

    -- While the private chats are on screen no channel is the open one.
    if pm_view and not entry.private then
        is_active = false
    end

    if is_active then
        sheetx.chat_push_accent()
    end

    -- Online but not in the channel yet: dim until the user opens it.
    local dim = not inside and not entry.private
        and store.GetState() == 'online'

    if dim and not is_active then
        imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)
    end

    local text = entry.private and label or tx(label)

    if sheetx.chat_skin then
        imgui.PushStyleColor(ImGuiCol_Button, transparent)
    end

    local clicked = sheetx.chat_button(
        text .. '##ChatTab' .. entry.name,
        { width, sheetx.chat_height }, is_active
    )

    if sheetx.chat_skin then
        imgui.PopStyleColor()
    end
    if dim and not is_active then
        imgui.PopStyleColor()
    end

    if is_active then
        imgui.PopStyleColor(4)
    end

    local min_x, min_y = imgui.GetItemRectMin()
    local max_x, max_y = imgui.GetItemRectMax()
    local draw_list = imgui.GetWindowDrawList()

    if entry.color ~= nil then
        draw_list:AddRectFilled(
            { min_x + 4, max_y - 4 },
            { max_x - 4, max_y - 2 },
            imgui.GetColorU32(entry.color)
        )
    end

    if unread and not is_active then
        draw_list:AddCircleFilled(
            { max_x - 8, min_y + 7 }, 3,
            imgui.GetColorU32({ 0.96, 0.57, 0.17, 1 })
        )
    end

    if inside then
        draw_list:AddRect(
            { min_x, min_y },
            { max_x, max_y },
            imgui.GetColorU32({ 0.20, 0.72, 0.28, 1.0 }),
            0,
            0,
            2
        )
    end

    -- A line that names you is waiting in that channel.
    if mention and not is_active then
        draw_list:AddCircleFilled(
            { max_x - 10, (min_y + max_y) * 0.5 },
            5,
            imgui.GetColorU32({ 0.86, 0.17, 0.16, 1.0 })
        )
    end

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(entry.private and label or entry.name)
    end

    if clicked then
        if entry.private then
            if not is_active and store.SetPrivateActive(entry.name) then
                sheetx.pm_hint = nil
                sheetx.pm_focus = true
            end
        else
            if pm_view and store.SetPrivateOpen ~= nil then
                store.SetPrivateOpen(false)
            end

            if not is_active and store.SetActive(entry.name) then
                sheetx.chat_hint = nil
                sheetx.chat_focus = true
            end
        end

        -- A channel the chat is not in yet: the click joins it.
        if not entry.private and store.JoinChannel ~= nil then
            store.JoinChannel(entry.name)
        end
    end

    -- The x of a private chat.
    if close_id ~= nil then
        imgui.SameLine(0, 4)

        if sheetx.chat_button('x##ChatPMClose' .. entry.name, { sheetx.chat_height, sheetx.chat_height }) then
            store.ClosePrivate(entry.name)
        end

        if imgui.IsItemHovered() and imgui.SetTooltip then
            imgui.SetTooltip(tx('Close this chat'))
        end
    end
end

-- Local accents keep the rest of Journal on its existing theme.
function sheetx.chat_push_accent()
    local legacy = sheetx.chat_skin or theme.Get() == 'legacy'
    local fill = legacy and { 0.37, 0.12, 0.15, 1 }
        or { 0.10, 0.25, 0.34, 1 }

    imgui.PushStyleColor(ImGuiCol_Button, fill)
    imgui.PushStyleColor(ImGuiCol_ButtonHovered,
        legacy and { 0.48, 0.19, 0.20, 1 } or { 0.15, 0.34, 0.43, 1 })
    imgui.PushStyleColor(ImGuiCol_ButtonActive, fill)
    imgui.PushStyleColor(ImGuiCol_Text, { 1, 0.92, 0.75, 1 })
end

-- A small in-game lantern emblem, drawn at the same scale as the title.
function sheetx.chat_title(draw, x, y, width)
    local size = sheetx.chat_skin and math.max(62, scaled(70)) or scaled(26)
    local inner, pad = sheetx.chat_inner(width)
    local left = x + pad
    local cursor_y = imgui.GetCursorPosY()
    local top = y + cursor_y
    if sheetx.chat_skin then
        local max_w = math.max(1, inner - math.max(56, scaled(52)) - 12)
        theme.DrawChatArt(imgui, draw, 'leather', left, top, inner, size)
        -- Keep the lantern, lettering and airship together at the reference ratio.
        local title_w = math.min(max_w, size * 1292 / 101)
        theme.DrawChatArt(imgui, draw, 'title', left, top, title_w, title_w * 101 / 1292)
        return top + size
    end

    local cx = left + size * 0.55
    local cy = top + size * 0.51
    local brass = imgui.GetColorU32({ 0.77, 0.57, 0.29, 1 })
    local glass = imgui.GetColorU32({ 0.05, 0.22, 0.33, 1 })

    draw:AddRectFilled({ left - 3, top - 3 },
        { x + width - pad + 3, top + size + 3 },
        imgui.GetColorU32(theme.Get() == 'legacy'
            and { 0.25, 0.08, 0.10, 1 } or { 0.07, 0.13, 0.20, 1 }), 4)
    draw:AddLine({ left, top + size + 2 },
        { x + width - pad, top + size + 2 }, brass, 1)

    draw:AddCircleFilled({ cx, cy - size * 0.33 }, size * 0.09, brass)
    draw:AddRectFilled({ cx - size * 0.27, cy - size * 0.25 },
        { cx + size * 0.27, cy + size * 0.35 }, brass, 3)
    draw:AddRectFilled({ cx - size * 0.18, cy - size * 0.17 },
        { cx + size * 0.18, cy + size * 0.26 }, glass, 2)
    draw:AddTriangleFilled({ cx, cy - size * 0.12 },
        { cx - size * 0.12, cy + size * 0.16 },
        { cx + size * 0.12, cy + size * 0.16 },
        imgui.GetColorU32({ 0.39, 0.83, 1, 1 }))
    draw:AddCircleFilled({ cx, cy + size * 0.13 }, size * 0.055,
        imgui.GetColorU32({ 0.88, 0.98, 1, 1 }))

    imgui.SetCursorPosX(pad + size + 5)
    if imgui.AlignTextToFramePadding then
        imgui.AlignTextToFramePadding()
    end
    imgui.TextColored({ 1, 0.91, 0.71, 1 }, 'VanaChat (Beta)')
    imgui.SetCursorPosY(cursor_y)
end

-- The channels as tabs on top, in as many rows as the width needs, so no name
-- is clipped. The last tab opens the window of the private chats, with a red
-- number when some of those chats have news.
function sheetx.chat_private_tab(store, width)
    local shown = store.GetPrivateOpen and store.GetPrivateOpen()

    if shown then
        sheetx.chat_push_accent()
    end

    local clicked = sheetx.chat_button(
        tx('Private chats') .. '##ChatPrivateOpen',
        { width, sheetx.chat_height }, shown
    )

    if shown then
        imgui.PopStyleColor(4)
    end

    local min_x, min_y = imgui.GetItemRectMin()
    local max_x = imgui.GetItemRectMax()
    local draw_list = imgui.GetWindowDrawList()

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(tx('Open the private chats'))
    end

    if clicked then
        store.TogglePrivate()
    end

    local n = store.CountUnreadPrivate and store.CountUnreadPrivate() or 0

    if n > 0 then
        local center = { max_x - 8, min_y + 2 }

        draw_list:AddCircleFilled(
            center, 9, imgui.GetColorU32({ 0.86, 0.17, 0.16, 1.0 })
        )
        draw_list:AddText(
            { center[1] - 3, center[2] - 7 },
            imgui.GetColorU32({ 1, 1, 1, 1 }),
            tostring(math.min(n, 9))
        )
    end
end

function sheetx.chat_channels(store, width)
    local items = {}

    for _, entry in ipairs(store.GetChannels()) do
        items[#items + 1] = entry
    end

    if store.TogglePrivate ~= nil then
        items[#items + 1] = { pm = true, label = 'Private chats' }
    end

    if #items == 0 then
        return
    end

    local gap = 7
    local widest = 0

    for _, entry in ipairs(items) do
        widest = math.max(widest, imgui.CalcTextSize(tx(entry.label)) + 27)
    end

    local columns = math.max(1, math.min(#items,
        math.floor((width + gap) / (widest + gap))))
    local tab_w = math.floor((width - (columns - 1) * gap) / columns)

    for index, entry in ipairs(items) do
        if (index - 1) % columns ~= 0 then
            imgui.SameLine(0, gap)
        end

        if entry.pm then
            sheetx.chat_private_tab(store, tab_w)
        else
            sheetx.chat_channel_button(store, entry, tab_w, nil)
        end
    end
end

-- The people in the channel on screen (at the right).
function sheetx.chat_users(store)
    local users = store.GetUsers()

    sheetx.chat_wrapped(
        colors.text_dim,
        string.format(tx('Connected (%d)'), #users)
    )

    imgui.Separator()

    local me = store.GetNick()

    for _, nick in ipairs(users) do
        if me ~= nil and nick:lower() == me:lower() then
            imgui.TextColored(colors.completed, nick)
        elseif store.OpenPrivate ~= nil and imgui.Selectable then
            -- A click opens a menu: quote, private message, mute.
            if imgui.Selectable(nick .. '##ChatUser' .. nick) then
                sheetx.chat_hint = nil
                sheetx.nick_click(store, nick, 'chat', true)
            end

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Click for options'))
            end
        else
            imgui.Text(nick)
        end
    end

    if #users == 0 then
        imgui.TextColored(colors.text_dim, tx('Nobody yet.'))
    end
end

-- The hint under the lines: one for the chat, one for the private chats.
function sheetx.set_hint(ctx, text)
    if ctx == 'pm' then
        sheetx.pm_hint = text
    else
        sheetx.chat_hint = text
    end
end

-- A click on a name: a small menu (Quote, Private message, Mute). The menu
-- itself is drawn by sheetx.nick_menu, once per window. Without popups, the
-- old behaviour: a name in the list opens a private chat, one in the lines
-- mutes it.
function sheetx.nick_click(store, nick, ctx, from_list)
    if imgui.OpenPopup ~= nil and imgui.BeginPopup ~= nil then
        sheetx.nick_ask = sheetx.nick_ask or {}
        sheetx.nick_ask[ctx] = { nick = nick, open = true }

        return
    end

    if from_list and store.OpenPrivate ~= nil then
        if store.OpenPrivate(nick) then
            store.SetPrivateOpen(true)
        else
            sheetx.set_hint(ctx, 'Could not open that private chat (limit of 8).')
        end
    elseif not from_list then
        store.SetMuted(nick, true)
        sheetx.set_hint(
            ctx, 'Muted. To undo: /journal chat unmute ' .. nick
        )
    end
end

-- Writes "Nick: " at the start of the box (once), and gives it the keyboard.
function sheetx.quote_nick(ctx, nick)
    local buf = ctx == 'pm' and sheetx.pm_buf or sheetx.chat_buf
    local prefix = nick .. ': '

    if buf[1]:sub(1, #prefix) ~= prefix then
        buf[1] = (prefix .. buf[1]):sub(1, 300)
    end

    if ctx == 'pm' then
        sheetx.pm_focus = true
    else
        sheetx.chat_focus = true
    end
end

-- The menu of a name. Call it in the window (not in a child), every frame.
function sheetx.nick_menu(store, ctx)
    local ask = sheetx.nick_ask and sheetx.nick_ask[ctx]

    if ask == nil or imgui.OpenPopup == nil or imgui.BeginPopup == nil then
        return
    end

    local id = '##NickMenu' .. ctx

    if ask.open then
        ask.open = false
        imgui.OpenPopup(id)
    end

    if imgui.BeginPopup(id) then
        imgui.TextColored(colors.text_dim, ask.nick)
        imgui.Separator()

        if imgui.Selectable(tx('Quote') .. '##NickQuote') then
            sheetx.quote_nick(ctx, ask.nick)
        end

        if ctx ~= 'pm' and store.OpenPrivate ~= nil
            and imgui.Selectable(tx('Private message') .. '##NickPrivate') then

            if store.OpenPrivate(ask.nick) then
                store.SetPrivateOpen(true)
                sheetx.pm_focus = true
            else
                sheetx.chat_hint = 'Could not open that private chat (limit of 8).'
            end
        end

        if imgui.Selectable(tx('Mute') .. '##NickMute') then
            store.SetMuted(ask.nick, true)
            sheetx.set_hint(
                ctx, 'Muted. To undo: /journal chat unmute ' .. ask.nick
            )
        end

        imgui.EndPopup()
    end
end

-- A line of the chat: [time] nick: text, or an info / action line. A line
-- that names you has a soft band of color behind it.
function sheetx.chat_line(store, line, ctx)
    local mention = line.kind ~= 'me' and line.kind ~= 'info'
        and store.Mentions ~= nil and store.Mentions(line.text)
    local x0, y0, avail

    if mention and imgui.GetCursorScreenPos then
        x0, y0 = imgui.GetCursorScreenPos()

        if imgui.GetContentRegionAvail ~= nil then
            local ok, a = pcall(imgui.GetContentRegionAvail)

            if ok and type(a) == 'number' then
                avail = a
            end
        end
    end

    sheetx.chat_line_body(store, line, ctx)

    if type(x0) == 'number' and type(y0) == 'number' then
        local _, y1 = imgui.GetCursorScreenPos()

        if type(y1) == 'number' and y1 > y0 then
            imgui.GetWindowDrawList():AddRectFilled(
                { x0 - 2, y0 - 1 },
                { x0 + (avail or scaled(300)), y1 },
                imgui.GetColorU32({ 1.0, 0.82, 0.25, 0.17 })
            )

            sheetx.mention_drawn = (sheetx.mention_drawn or 0) + 1
        end
    end
end

function sheetx.chat_line_body(store, line, ctx)
    if line.kind == 'info' then
        sheetx.chat_wrapped(
            colors.text_dim,
            '[' .. line.time .. '] ' .. line.text
        )
    elseif line.kind == 'action' then
        sheetx.chat_wrapped(
            colors.text_dim,
            '[' .. line.time .. '] * ' .. line.nick
                .. ' ' .. line.text
        )
    else
        imgui.TextColored(
            colors.text_dim,
            '[' .. line.time .. ']'
        )

        imgui.SameLine(0, 6)

        imgui.TextColored(
            line.kind == 'me' and colors.completed
                or colors.active_status,
            line.nick .. ':'
        )

        -- A click on the nick of another opens a menu (quote, private, mute).
        if line.kind ~= 'me' then
            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Click for options'))
            end

            if imgui.IsItemClicked and imgui.IsItemClicked() then
                sheetx.nick_click(store, line.nick, ctx, false)
            end
        end

        imgui.SameLine(0, 6)

        imgui.TextWrapped(line.text)

        -- The web addresses of the message: one line each, a
        -- click copies it (nothing is opened by itself).
        for _, url in ipairs(sheetx.chat_urls(line.text)) do
            imgui.PushStyleColor(ImGuiCol_Text, { 0.20, 0.45, 0.90, 1.0 })
            imgui.TextWrapped('> ' .. url)
            imgui.PopStyleColor()

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Click to copy the link'))
            end

            if imgui.IsItemClicked and imgui.IsItemClicked() then
                sheetx.set_hint(
                    ctx,
                    sheetx.chat_copy_text(url)
                    and 'Link copied. Paste it in your browser.'
                    or 'Could not copy: use the Copy text button and Ctrl+C.'
                )
            end
        end
    end

end

-- Copy mode: one read-only box with the lines of the channel, where the text
-- can be selected with the mouse and copied with Ctrl+C.
function sheetx.chat_copy_view(lines)
    local text = {}

    for _, line in ipairs(lines) do
        if line.kind == 'info' then
            text[#text + 1] = '[' .. line.time .. '] ' .. line.text
        elseif line.kind == 'action' then
            text[#text + 1] = '[' .. line.time .. '] * ' .. line.nick
                .. ' ' .. line.text
        else
            text[#text + 1] = '[' .. line.time .. '] ' .. line.nick
                .. ': ' .. line.text
        end
    end

    sheetx.chat_copy_buf[1] = table.concat(text, '\n')

    imgui.InputTextMultiline(
        '##ChatCopyText',
        sheetx.chat_copy_buf,
        math.max(1024, #sheetx.chat_copy_buf[1] + 256),
        { -1, -1 },
        ImGuiInputTextFlags_ReadOnly
    )

    if imgui.IsItemActive() then
        note_input_active = true
    end
end

-- Puts a text in the clipboard. true when one of the ways worked.
function sheetx.chat_copy_text(text)
    if imgui.SetClipboardText ~= nil and pcall(imgui.SetClipboardText, text) then
        return true
    end

    if ashita ~= nil and ashita.misc ~= nil
        and ashita.misc.set_clipboard ~= nil
        and pcall(ashita.misc.set_clipboard, text) then

        return true
    end

    return false
end

-- The web addresses in a message (at most three, without the signs that
-- usually come after them in a sentence).
function sheetx.chat_urls(text)
    local urls = {}

    for url in tostring(text):gmatch('[Hh][Tt][Tt][Pp][Ss]?://[^%s<>"]+') do
        url = url:gsub('[%.,;:!%?%)%]]+$', '')

        if #url > 8 then
            urls[#urls + 1] = url
        end

        if #urls >= 3 then
            break
        end
    end

    return urls
end

-- Sends the text of the private box to the chat that is on screen.
function sheetx.pm_send(store)
    local active = store.GetPrivateActive()

    if active == nil then
        return
    end

    local text = sheetx.pm_buf[1]
    local sent, why = store.Say(text, active)

    if sent then
        sheetx.sent_add('pm', text)
        sheetx.pm_buf[1] = ''
        sheetx.pm_hint = nil
    elseif why == 'fast' then
        sheetx.pm_hint = 'Too fast: wait a moment.'
    elseif why == 'offline' then
        sheetx.pm_hint = 'You are not connected.'
    end

    sheetx.pm_focus = true
end

-- The two panes of the private tab: the lines of the chat on screen and,
-- where the people are in a channel, the list of private chats.
function sheetx.pm_panes(store, height, side_w, border)
    local active = store.GetPrivateActive()
    local privates = store.GetPrivates()

    if imgui.BeginChild('##PmLines', { -(side_w + 8), height }, border) then
        sheetx.chat_panel()
        local panel_w, panel_h = imgui.GetWindowSize()
        imgui.SetCursorPosX(26)
        imgui.SetCursorPosY(26)

        if imgui.BeginChild('##PmContent',
            { math.max(20, panel_w - 52), math.max(20, panel_h - 52) }, false) then

            if active == nil then
                sheetx.chat_wrapped(
                    colors.text_dim,
                    tx('Click a name in the chat and choose Private message.')
                )
            else
                local lines = store.GetChatLines(active)

                if #lines == 0 then
                    sheetx.chat_wrapped(colors.text_dim, tx('No messages yet.'))
                end

                for _, line in ipairs(lines) do
                    sheetx.chat_line(store, line, 'pm')
                end

                local serial = store.GetSerial(active)

                if sheetx.pm_tab ~= active then
                    sheetx.pm_tab = active
                    sheetx.pm_serial = nil
                end

                if sheetx.pm_serial ~= serial then
                    local reading =
                        sheetx.pm_serial ~= nil
                        and imgui.GetScrollY ~= nil
                        and imgui.GetScrollMaxY ~= nil
                        and type(imgui.GetScrollY()) == 'number'
                        and type(imgui.GetScrollMaxY()) == 'number'
                        and imgui.GetScrollMaxY() - imgui.GetScrollY() > 60

                    sheetx.pm_serial = serial

                    if not reading and imgui.SetScrollHereY then
                        imgui.SetScrollHereY(1.0)
                    end
                end
            end
        end

        imgui.EndChild()
    end

    imgui.EndChild()

    imgui.SameLine(0, 8)

    if imgui.BeginChild('##PmList', { -1, height }, border) then
        sheetx.chat_panel()
        local panel_w, panel_h = imgui.GetWindowSize()
        imgui.SetCursorPosX(22)
        imgui.SetCursorPosY(26)

        if imgui.BeginChild('##PmListContent',
            { math.max(20, panel_w - 44), math.max(20, panel_h - 52) }, false) then

            for _, entry in ipairs(privates) do
                entry.private = true

                sheetx.chat_channel_button(
                    store, entry, -(sheetx.chat_height + 8), true
                )
            end

            if #privates == 0 then
                sheetx.chat_wrapped(
                    colors.text_dim, tx('No private chats yet.')
                )
            end
        end

        imgui.EndChild()
    end

    imgui.EndChild()
end

function sheetx.chat_draw()
    local store = controller and controller.chat

    if store == nil
        or not store.GetOpen()
        or not can_draw_ui()
        or imgui.InputText == nil then

        sheetx.chat_was_open = false
        sheetx.chat_pass_ready = false
        sheetx.chat_name_ready = false

        if sheetx.input_ctx == 'chat' then
            sheetx.input_ctx = nil
            sheetx.key_pending = nil
        end

        return
    end

    if not sheetx.chat_was_open then
        sheetx.chat_was_open = true
        sheetx.chat_serial = nil
        sheetx.chat_settings = nil

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        -- Where it was the last time, or a first place near the Journal.
        local saved = store.GetWindow and store.GetWindow()

        if saved ~= nil then
            imgui.SetNextWindowSize({ sheetx.fit_screen(saved.w, saved.h) })
            imgui.SetNextWindowPos({ saved.x, saved.y })
        else
            imgui.SetNextWindowSize({
                sheetx.fit_screen(scaled(1000), scaled(700))
            })

            imgui.SetNextWindowPos({
                ((journal and journal.visible and journal.x) or 40) + 120,
                ((journal and journal.visible and journal.y) or 40) + 120,
            })
        end
    end

    -- The player can drag the corner to resize it.
    if imgui.SetNextWindowSizeConstraints then
        imgui.SetNextWindowSizeConstraints(
            { scaled(600), scaled(300) },
            { scaled(2400), scaled(2400) }
        )
    end

    store.MarkRead()

    sheetx.chat_can_copy =
        imgui.InputTextMultiline ~= nil and ImGuiInputTextFlags_ReadOnly ~= nil

    sheetx.chat_skin = theme.HasChatSkin()
    sheetx.chat_height = math.max(34, ui_button_height)
    push_theme(nil, nil, sheetx.chat_skin)
    if sheetx.chat_skin then
        imgui.PushStyleVar(ImGuiStyleVar_WindowPadding, { 19, 17 })
        imgui.PushStyleVar(ImGuiStyleVar_FramePadding,
            { 10, math.max(6, (sheetx.chat_height - journal_font_size) / 2) })
        imgui.PushStyleColor(ImGuiCol_WindowBg, transparent)
    end

    -- Pinned: it cannot be moved or resized, and the corner is not shown.
    local pinned = store.GetPinned ~= nil and store.GetPinned()

    if pinned then
        imgui.PushStyleColor(ImGuiCol_ResizeGrip, transparent)
        imgui.PushStyleColor(ImGuiCol_ResizeGripHovered, transparent)
        imgui.PushStyleColor(ImGuiCol_ResizeGripActive, transparent)
    else
        imgui.PushStyleColor(ImGuiCol_ResizeGrip, { 0.80, 0.84, 0.95, 0.30 })
        imgui.PushStyleColor(ImGuiCol_ResizeGripHovered, { 0.80, 0.84, 0.95, 0.60 })
        imgui.PushStyleColor(ImGuiCol_ResizeGripActive, { 0.80, 0.84, 0.95, 0.90 })
    end

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    scalex.before('chat')

    if imgui.Begin(
        tx('Chat') .. '###JournalChat',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
            + (pinned and (ImGuiWindowFlags_NoMove or 0) or 0)
            + (pinned and (ImGuiWindowFlags_NoResize or 0) or 0)
    ) then
        scalex.after('chat')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        -- Remembered (the file is written a moment after the last change).
        if store.SetWindow ~= nil then
            store.SetWindow(x, y, width, height)
        end

        if sheetx.chat_skin then
            theme.DrawChatArt(imgui, draw, 'frame', x, y, width, height)
        else
            draw_window_panel(draw, x, y, width, height, true)
        end

        -- With the artwork the header is a picture; without it, the logo (or
        -- the name in text) of the block below.
        local title_bottom = sheetx.chat_skin
            and sheetx.chat_title(draw, x, y, width) or nil
        if title_bottom then
            imgui.SetCursorPosY(imgui.GetCursorPosY() + scaled(6))
        end
        sheetx.chat_push_accent()

        -- The name of the chat, in the middle of the top row (the pin and the
        -- X share that row, at the right).
        if not sheetx.chat_skin then
            local title = 'Vanachat (Beta)'
            local inner, pad = sheetx.settings_inner(width)
            local logo = controller.worldmark
                and controller.worldmark.GetIcon
                and controller.worldmark.GetIcon('logo')
            local logo_h = scaled(64)
            local logo_w = logo and logo.width > 0
                and logo_h * logo.height > 0
                and math.floor(logo_h * logo.width / logo.height) or 0
            local drawn = false

            -- The logo, when its file is there; the name in text if not.
            if logo ~= nil and logo_w > 0 then
                local lx = x + pad + math.max(0, (inner - logo_w) * 0.5)
                local ly = imgui.GetCursorScreenPos
                    and select(2, imgui.GetCursorScreenPos()) or y + 6

                drawn = pcall(function()
                    draw:AddImage(
                        logo.id,
                        { lx, ly },
                        { lx + logo_w, ly + logo_h },
                        { 0, 0 },
                        { 1, 1 },
                        imgui.GetColorU32({ 1, 1, 1, 1 })
                    )
                end)

                if drawn then
                    -- The row is as high as the logo.
                    imgui.Dummy({ 1, logo_h })
                    imgui.SameLine()
                end
            end

            if not drawn then
                local text_w = (imgui.CalcTextSize(title))

                if imgui.AlignTextToFramePadding then
                    imgui.AlignTextToFramePadding()
                end

                imgui.SetCursorPosX(pad + math.max(0, (inner - text_w) * 0.5))
                imgui.TextColored(colors.favorite, title)
                imgui.SameLine()
            end
        end

        -- The pin, to the left of the X.
        if store.SetPinned ~= nil then
            local size = math.max(28, scaled(26))
            local inner, pad = sheetx.chat_inner(width)

            imgui.SetCursorPosX(pad + inner - size * 2 - 6)

            if pinned then
                imgui.PushStyleColor(ImGuiCol_Button, colors.button_active)
            end

            if sheetx.chat_button('##ChatPin', { size, size }, true) then
                store.SetPinned(not pinned)
            end

            if pinned then
                imgui.PopStyleColor()
            end

            local min_x, min_y = imgui.GetItemRectMin()
            local max_x = imgui.GetItemRectMax()
            local icon = (max_x - min_x) * 0.62

            icons.draw_pin(
                draw,
                min_x + ((max_x - min_x) - icon) * 0.5,
                min_y + ((max_x - min_x) - icon) * 0.5,
                icon,
                imgui.GetColorU32({ 1, 0.91, 0.71, 1 }),
                pinned
            )

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(
                    pinned
                        and tx('Unpin the window')
                        or tx('Pin the window: it stays in place and comes back when the addon loads')
                )
            end

            imgui.SameLine()
        end

        if sheetx.chat_skin then
            local inner, pad = sheetx.chat_inner(width)
            local size = math.max(28, scaled(26))
            imgui.SetCursorPosX(pad + inner - size)
            if sheetx.chat_button('X##WindowClose', { size, size }, true) then
                open[1] = false
            end
            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(tx('Close'))
            end
        else
            sheetx.close_row(open)
        end
        imgui.PopStyleColor(4)
        if title_bottom then
            imgui.SetCursorPosY(title_bottom - y + 8)
        end
        imgui.Spacing()

        -- The state, the button to connect or disconnect, and the gear that
        -- opens the settings (the first time it starts open).
        local state = store.GetState()

        if sheetx.chat_settings == nil then
            sheetx.chat_settings = not store.GetAccepted()
        end

        local show = sheetx.chat_settings == true
        sheetx.chat_strip(sheetx.chat_height)

        local gear_size = sheetx.chat_height

        if show then
            imgui.PushStyleColor(ImGuiCol_Button, colors.button_active)
        end

        if sheetx.chat_button('##ChatSettings', { gear_size, gear_size }) then
            sheetx.chat_settings = not show
        end

        if show then
            imgui.PopStyleColor()
        end

        do
            local min_x, min_y = imgui.GetItemRectMin()
            local max_x = imgui.GetItemRectMax()
            local icon = (max_x - min_x) * 0.62

            icons.draw_gear(
                draw,
                min_x + ((max_x - min_x) - icon) * 0.5,
                min_y + ((max_x - min_x) - icon) * 0.5,
                icon,
                imgui.GetColorU32(colors.text)
            )
        end

        if imgui.IsItemHovered() and imgui.SetTooltip then
            imgui.SetTooltip(tx('Chat settings'))
        end

        -- The password written in the box (kept while it is disconnected,
        -- even with the settings closed).
        if state == 'off' and store.SetPassword ~= nil then
            if not sheetx.chat_pass_ready then
                sheetx.chat_pass_ready = true
                sheetx.chat_pass_nick = (store.ChatName() or ''):lower()
                sheetx.chat_pass[1] = store.GetPassword()
                sheetx.chat_remember = store.IsPasswordSaved()
            end
        else
            sheetx.chat_pass_ready = false
        end

        -- The name written in the box (while disconnected).
        if state == 'off' and store.SetCustomName ~= nil then
            if not sheetx.chat_name_ready then
                sheetx.chat_name_ready = true
                sheetx.chat_name[1] = store.GetCustomName()
            end
        else
            sheetx.chat_name_ready = false
        end

        imgui.SameLine(0, 8)

        -- As wide as the longer of the two texts (it changes with the language).
        local connect_w = math.max(
            scaled(120),
            (imgui.CalcTextSize(tx('Connect'))) + 28,
            (imgui.CalcTextSize(tx('Disconnect'))) + 28
        )

        if state == 'off' then
            if sheetx.chat_button(
                tx('Connect') .. '##ChatConnect',
                { connect_w, sheetx.chat_height }
            ) then
                -- The name and the password written in the boxes go with it.
                sheetx.chat_apply_name(store)

                if sheetx.chat_pass_ready and store.SetPassword ~= nil then
                    store.SetPassword(
                        nil,
                        sheetx.chat_pass[1],
                        sheetx.chat_remember == true
                    )
                end

                store.Connect()
            end
        elseif sheetx.chat_button(
            tx('Disconnect') .. '##ChatConnect',
            { connect_w, sheetx.chat_height }
        ) then
            store.Disconnect()
        end

        imgui.SameLine(0, 10)

        if imgui.AlignTextToFramePadding then
            imgui.AlignTextToFramePadding()
        end

        if state == 'online' then
            imgui.TextColored(
                sheetx.chat_skin and { 0.68, 0.94, 0.48, 1 } or colors.completed,
                string.format(
                    tx('Online as %s - %d in the channel'),
                    store.GetNick(),
                    store.GetUserCount()
                )
            )
        elseif state == 'connecting' then
            imgui.TextColored({ 0.93, 0.74, 0.40, 1 }, tx('Connecting...'))
        elseif state == 'waiting' then
            sheetx.chat_wrapped({ 0.93, 0.74, 0.40, 1 }, tx('Connection lost. Trying again...'))
        else
            imgui.TextColored({ 0.90, 0.80, 0.65, 1 }, tx('Offline'))
        end

        if show then
            imgui.Separator()

            -- The name: the one of the character, or the one the user writes.
            imgui.TextColored(colors.text_dim, tx('Name:'))
            imgui.SameLine(0, 8)

            if sheetx.chat_name_ready then
                imgui.PushItemWidth(scaled(200))

                imgui.InputText('##ChatName', sheetx.chat_name, 21)

                imgui.PopItemWidth()

                -- Done writing: it is kept (and the password box follows).
                -- (without IsItemActive it waits for the Connect button)
                if imgui.IsItemActive ~= nil and not imgui.IsItemActive() then
                    sheetx.chat_apply_name(store)
                end

                sheetx.chat_wrapped(
                    colors.text_dim,
                    string.format(
                        tx('Empty: the name of your character (%s). Letters, digits, _ and -.'),
                        (store.PlayerName and store.PlayerName() ~= '')
                            and store.PlayerName() or '-'
                    )
                )
            else
                local who = state == 'online' and store.GetNick()
                    or (store.ChatName and store.ChatName())

                imgui.Text((who ~= nil and who ~= '') and who or '-')

                imgui.TextColored(
                    colors.text_dim,
                    tx('Disconnect to change the name.')
                )
            end

            if imgui.Checkbox then
                local auto = { store.GetAuto() }

                if imgui.Checkbox(
                    tx('Connect when the addon loads') .. '##ChatAuto',
                    auto
                ) then
                    store.SetAuto(auto[1])
                end

                -- Alert and sound for the private messages.
                if store.SetPmAlert ~= nil then
                    local alert = { store.GetPmAlert() }

                    if imgui.Checkbox(
                        tx('Alerts and sound for private messages') .. '##PmAlert',
                        alert
                    ) then
                        store.SetPmAlert(alert[1])
                    end
                end

                if store.GetMentionAlert ~= nil then
                    local alert = { store.GetMentionAlert() }

                    if imgui.Checkbox(
                        tx('Alert when a message names you') .. '##ChatMention',
                        alert
                    ) then
                        store.SetMentionAlert(alert[1])
                    end
                end
            end

            -- The password of a registered nick, only while disconnected.
            if sheetx.chat_pass_ready then
                imgui.TextColored(
                    colors.text_dim,
                    tx('Password (only if your nick is registered):')
                )

                imgui.PushItemWidth(scaled(260))

                imgui.InputText(
                    '##ChatPassword',
                    sheetx.chat_pass,
                    120,
                    ImGuiInputTextFlags_Password or 0
                )

                if imgui.IsItemActive() then
                    note_input_active = true
                end

                imgui.PopItemWidth()

                if imgui.Checkbox then
                    local remember = { sheetx.chat_remember == true }

                    if imgui.Checkbox(
                        tx('Remember it on this computer') .. '##ChatRemember',
                        remember
                    ) then
                        sheetx.chat_remember = remember[1]
                    end
                end

                sheetx.chat_wrapped(
                    colors.text_dim,
                    tx('The password travels without encryption and, if remembered, is saved as plain text. Do not reuse one from another site.')
                )
            elseif store.SetPassword ~= nil then
                imgui.TextColored(
                    colors.text_dim,
                    tx('Disconnect to change the password.')
                )
            end

            -- What connecting means, until the first connection.
            if not store.GetAccepted() then
                sheetx.chat_wrapped(
                    colors.text_dim,
                    tx('This chat connects to a public IRC network (Snoonet). Everyone in the channel sees the name of your character, and anyone could use the name of another. Nothing is encrypted: do not write passwords or personal data. The network sees your IP address and checks it for open proxies; the other users do not see it.')
                )
            end

            imgui.Separator()
        end

        imgui.Spacing()

        -- The private chats are a tab of this window: the same lines, list
        -- and box, for the private chat on screen.
        local pm_view = store.GetPrivateOpen ~= nil and store.GetPrivateOpen()

        if pm_view then
            store.MarkReadPrivate()
        end

        local hint = pm_view and sheetx.pm_hint or sheetx.chat_hint

        -- The box to write is taller than the buttons: it is where the
        -- player looks most.
        local input_h = math.max(
            sheetx.chat_height,
            math.floor(sheetx.chat_height * 1.45)
        )

        -- The lines, with room below for the box.
        local row_h = input_h + 14

        if hint ~= nil then
            row_h = row_h
                + (imgui.GetTextLineHeightWithSpacing
                    and imgui.GetTextLineHeightWithSpacing() or 24)
        end

        imgui.PushStyleColor(ImGuiCol_ChildBg, transparent)

        local inner = sheetx.chat_inner(width)
        sheetx.chat_channels(store, inner)

        local avail_h
        if imgui.GetContentRegionAvail ~= nil then
            local _, height_left = imgui.GetContentRegionAvail()
            avail_h = height_left
        end
        -- Keep the channel tabs, settings and composer reachable in short
        -- windows. The parent scrolls when their total height exceeds it.
        local log_h = -row_h
        if type(avail_h) == 'number' then
            log_h = math.max(scaled(100), avail_h - row_h)
        end

        local users_w = math.min(math.floor(inner * 0.36), math.max(
            math.max(172, scaled(155)),
            imgui.CalcTextSize(string.format(tx('Connected (%d)'), 99)) + 24
        ))

        local child_frame = sheetx.chat_skin and type(ImGuiStyleVar_ChildBorderSize) == 'number'
        if child_frame then
            imgui.PushStyleVar(ImGuiStyleVar_ChildBorderSize, 0)
            imgui.PushStyleVar(ImGuiStyleVar_WindowPadding, { 24, 24 })
        end

        if pm_view then
            sheetx.pm_panes(store, log_h, users_w, child_border)
        else
        if imgui.BeginChild(
            '##ChatLines',
            { -(users_w + 8), log_h },
            child_border
        ) then
            sheetx.chat_panel()
            local panel_w, panel_h = imgui.GetWindowSize()
            imgui.SetCursorPosX(26)
            imgui.SetCursorPosY(26)
            local content_open = imgui.BeginChild('##ChatTranscriptContent',
                { math.max(20, panel_w - 52), math.max(20, panel_h - 52) }, false)
            if content_open then
                local lines = store.GetChatLines()

                local copying = sheetx.chat_copy == true and sheetx.chat_can_copy

                if copying then
                    sheetx.chat_copy_view(lines)
                elseif #lines == 0 then
                    sheetx.chat_wrapped(
                        colors.text_dim,
                        tx('No messages yet.')
                    )
                end

                for _, line in ipairs(copying and {} or lines) do
                    sheetx.chat_line(store, line, 'chat')
                end

                -- A new line scrolls down, unless the user is reading above; another
                -- channel starts at the bottom.
                local serial = store.GetSerial()

                if sheetx.chat_tab ~= store.GetActive() then
                    sheetx.chat_tab = store.GetActive()
                    sheetx.chat_serial = nil
                end

                if not copying and sheetx.chat_serial ~= serial then
                    local reading =
                        sheetx.chat_serial ~= nil
                        and imgui.GetScrollY ~= nil
                        and imgui.GetScrollMaxY ~= nil
                        and type(imgui.GetScrollY()) == 'number'
                        and type(imgui.GetScrollMaxY()) == 'number'
                        and imgui.GetScrollMaxY() - imgui.GetScrollY() > 60

                    sheetx.chat_serial = serial

                    if not reading and imgui.SetScrollHereY then
                        imgui.SetScrollHereY(1.0)
                    end
                end
            end
            imgui.EndChild()
        end

        imgui.EndChild()

        imgui.SameLine(0, 8)

        -- Who is in the channel.
        if imgui.BeginChild('##ChatUsers', { -1, log_h }, child_border) then
            sheetx.chat_panel()
            local panel_w, panel_h = imgui.GetWindowSize()
            imgui.SetCursorPosX(22)
            imgui.SetCursorPosY(26)
            if imgui.BeginChild('##ChatRosterContent',
                { math.max(20, panel_w - 44), math.max(20, panel_h - 52) }, false) then
                sheetx.chat_users(store)
            end
            imgui.EndChild()
        end

        imgui.EndChild()
        end

        if child_frame then
            imgui.PopStyleVar(2)
        end
        imgui.PopStyleColor()

        sheetx.nick_menu(store, pm_view and 'pm' or 'chat')

        if hint ~= nil then
            imgui.TextColored(colors.text_dim, tx(hint))
        end

        -- The box to write: Enter or the button sends (to the channel, or to
        -- the private chat on screen).
        local send_w = scaled(110)
        local copy_w = 0
        local can_copy = sheetx.chat_can_copy and not pm_view

        if can_copy then
            copy_w = math.max(
                scaled(110),
                (imgui.CalcTextSize(tx('Copy text'))) + 28
            ) + 8
        end

        local box_ctx = pm_view and 'pm' or 'chat'
        local box_id = pm_view and '##PmInput' or '##ChatInput'
        local box = pm_view and sheetx.pm_buf or sheetx.chat_buf

        sheetx.chat_strip(input_h)
        local input_w = math.max(120, inner - send_w - copy_w - 8)
        if sheetx.chat_skin then
            local ix, iy = imgui.GetCursorScreenPos()
            theme.DrawChatArt(imgui, imgui.GetWindowDrawList(), 'input',
                ix, iy, input_w, input_h)
            imgui.PushStyleColor(ImGuiCol_FrameBg, transparent)
        end

        -- The text sits in the middle of the taller box.
        imgui.PushStyleVar(
            ImGuiStyleVar_FramePadding,
            { 14, math.max(4, (input_h - journal_font_size) / 2) }
        )
        imgui.PushItemWidth(input_w)

        local want_focus = pm_view and sheetx.pm_focus or sheetx.chat_focus

        if want_focus and imgui.SetKeyboardFocusHere then
            imgui.SetKeyboardFocusHere()
        end

        sheetx.chat_focus = false
        sheetx.pm_focus = false

        local entered = sheetx.chat_input(box_ctx, box_id, box, 300)

        imgui.PopItemWidth()
        imgui.PopStyleVar()
        if sheetx.chat_skin then
            imgui.PopStyleColor()
        end

        imgui.SameLine(0, 8)

        sheetx.chat_push_accent()
        if sheetx.chat_button(
            tx('Send') .. (pm_view and '##PmSend' or '##ChatSend'),
            { send_w, input_h }, true
        ) then
            entered = true
        end

        imgui.PopStyleColor(4)

        if entered == true then
            if pm_view then
                sheetx.pm_send(store)
            else
                sheetx.chat_send(store)
            end
        end

        -- The button of the copy mode.
        if can_copy then
            imgui.SameLine(0, 8)

            local copying = sheetx.chat_copy == true

            if copying then
                imgui.PushStyleColor(ImGuiCol_Button, colors.button_active)
            end

            if sheetx.chat_button(
                tx('Copy text') .. '##ChatCopy',
                { copy_w - 8, input_h }
            ) then
                sheetx.chat_copy = not copying
            end

            if copying then
                imgui.PopStyleColor()
            end

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(
                    tx('Select the text with the mouse and copy it with Ctrl+C. Click again to go back.')
                )
            end
        end
    end

    imgui.End()

    if not open[1] then
        store.SetOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    imgui.PopStyleColor(3)

    if sheetx.chat_skin then
        imgui.PopStyleColor()
        imgui.PopStyleVar(2)
    end
    pop_theme()
end

-- The window of the private chats: a list of conversations at the left, the
-- lines and the box to write at the right. It opens by itself when someone
-- writes to you.
-- The private chats are a tab of the chat window (sheetx.pm_panes); there is
-- no window of their own any more.
function sheetx.private_draw()
    sheetx.pm_was_open = false

    if sheetx.input_ctx == 'pm' and not (
        controller and controller.chat
        and controller.chat.GetPrivateOpen
        and controller.chat.GetPrivateOpen()
        and controller.chat.GetOpen()
    ) then
        sheetx.input_ctx = nil
        sheetx.key_pending = nil
    end
end

function sheetx.zones_draw()
    local store = controller and controller.zonelist

    if store == nil
        or not store.GetOpen()
        or not can_draw_ui()
        or imgui.InputText == nil then

        sheetx.zones_was_open = false

        return
    end

    if not sheetx.zones_was_open then
        sheetx.zones_was_open = true
        -- Read again: the names may not have been there the last time.
        sheetx.zones_list = nil

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        -- Twice the size it had (380 x 580), without going over the screen.
        local zones_w = scaled(760)
        local zones_h = scaled(1160)

        local shown_ok, screen_w, screen_h = pcall(function()
            local size = imgui.GetIO().DisplaySize

            return size.x or size[1], size.y or size[2]
        end)

        if shown_ok and screen_w and screen_h then
            zones_w = math.min(zones_w, math.floor(screen_w * 0.9))
            zones_h = math.min(zones_h, math.floor(screen_h * 0.9))
        end

        imgui.SetNextWindowSize({ zones_w, zones_h })

        imgui.SetNextWindowPos({
            ((journal and journal.visible and journal.x) or 40) + 80,
            ((journal and journal.visible and journal.y) or 40) + 80,
        })
    end

    if imgui.SetNextWindowSizeConstraints then
        imgui.SetNextWindowSizeConstraints(
            { scaled(300), scaled(260) },
            { scaled(1800), scaled(2400) }
        )
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    scalex.before('zones')

    if imgui.Begin(
        tx('Zones by region') .. '###JournalZones',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
    ) then
        scalex.after('zones')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        draw_window_panel(draw, x, y, width, height, true)

        sheetx.close_row(open)

        if sheetx.zones_list == nil then
            sheetx.zones_list = sheetx.zones_build()
        end

        local goal = controller.GetCompassZoneGoal
            and controller.GetCompassZoneGoal() or nil

        imgui.TextWrapped(
            tx('Click a zone to guide the compass there. Click it again to remove it.')
        )

        imgui.PushItemWidth(-1)

        imgui.InputText('##ZonesFilter', sheetx.zones_filter, 64)

        imgui.PopItemWidth()

        imgui.Spacing()

        imgui.PushStyleColor(ImGuiCol_ChildBg, transparent)

        if imgui.BeginChild('##ZonesList', { -1, -1 }, child_border) then
            local list = sheetx.zones_list

            if list == nil then
                imgui.TextWrapped(tx('The zone names are not available yet.'))
            else
                local query = tostring(sheetx.zones_filter[1] or ''):lower()
                -- The width that is really free (the margins change with
                -- the theme), minus the space of a scroll bar.
                local row_w = width - scaled(48)

                if imgui.GetContentRegionAvail ~= nil then
                    local ok, avail = pcall(imgui.GetContentRegionAvail)

                    if ok and type(avail) == 'number' and avail > 0 then
                        row_w = math.floor(avail)
                    end
                end

                local toggle_w = ui_button_height

                -- The names start at the left of their button.
                local aligned = ImGuiStyleVar_ButtonTextAlign ~= nil

                if aligned then
                    imgui.PushStyleVar(ImGuiStyleVar_ButtonTextAlign, { 0, 0.5 })
                end

                local indent = scaled(28)

                for index, region in ipairs(list) do
                    local shown = {}

                    for _, zone in ipairs(region.zones) do
                        if query == '' or zone.key:find(query, 1, true) then
                            shown[#shown + 1] = zone
                        end
                    end

                    if #shown > 0 then
                        -- With a filter every region with a match is open.
                        local opened = query ~= ''
                            or sheetx.zones_open[region.name] == true

                        if imgui.Button(
                            (opened and '-' or '+') .. '##ZoneFold' .. index,
                            { toggle_w, ui_button_height }
                        ) then
                            sheetx.zones_open[region.name] = not opened
                        end

                        imgui.SameLine(0, 4)

                        if toolbar_mode_button(
                            fit_text(
                                region.name .. ' (' .. #shown .. ')',
                                row_w - toggle_w - 4 - 24
                            ) .. '##ZoneRegion' .. index,
                            false,
                            row_w - toggle_w - 4
                        ) then
                            sheetx.zones_open[region.name] = not opened
                        end

                        if opened then
                            for _, zone in ipairs(shown) do
                                imgui.Dummy({ indent, 1 })
                                imgui.SameLine(0, 0)

                                local selected = zone.id == goal

                                if toolbar_mode_button(
                                    fit_text(
                                        zone.name,
                                        row_w - indent - 24
                                    ) .. '##Zone' .. zone.id,
                                    selected,
                                    row_w - indent
                                ) and controller.ToggleCompassZoneGoal then
                                    controller.ToggleCompassZoneGoal(zone.id)
                                end

                                if imgui.IsItemHovered() and imgui.SetTooltip then
                                    imgui.SetTooltip(
                                        selected
                                            and tx('Click to remove it from the compass')
                                            or tx('Click to guide the compass here')
                                    )
                                end
                            end
                        end
                    end
                end

                if aligned then
                    imgui.PopStyleVar()
                end
            end
        end

        imgui.EndChild()

        imgui.PopStyleColor()
    end

    imgui.End()

    if not open[1] then
        store.SetOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

-- A click on a monster name in a step: its sheet (the monster search).
-- nil when the controller has no monster search, and then the names are
-- not clickable.
-- Item names of the steps: the click opens their sheet in the item catalogue;
-- only the ones the catalogue has are links.
sheetx.item_click = function()
    if controller ~= nil and controller.items ~= nil
        and controller.items.ShowByName ~= nil then

        return function(name)
            controller.items.ShowByName(name)
        end
    end

    return nil
end

sheetx.item_known = function(name)
    return controller ~= nil and controller.items ~= nil
        and controller.items.ByName(name) ~= nil
end

sheetx.monster_click = function()
    if controller ~= nil and controller.monsters ~= nil
        and controller.monsters.Show ~= nil then

        return function(name)
            controller.monsters.Show(name)
        end
    end

    return nil
end

-- The monster search (the monster button of the bar, or /journal monsters): the list of
-- the monsters the Journal knows on the left, the sheet of the one picked on
-- the right. The data and the state are in monsters.lua.
sheetx.monsters_filter = { '' }
sheetx.monsters_open = {}

-- "Yes", "No" or "Not in the data" (nil: the source variants disagree).
function sheetx.monsters_yesno(value)
    if value == true then
        return tx('Yes')
    elseif value == false then
        return tx('No')
    end

    return tx('Not in the data')
end

-- "Level 20-25", "Level 3" or '' when the source has no level.
function sheetx.monsters_levels(low, high)
    low = tonumber(low) or 0
    high = tonumber(high) or 0

    if high <= 0 then
        return ''
    end

    if low <= 0 or low == high then
        return tx('Level') .. ' ' .. string.format('%d', high)
    end

    return tx('Level') .. ' ' .. string.format('%d-%d', low, high)
end

-- A line "Label: value" with the label dim.
function sheetx.monsters_line(label, value, width, color)
    imgui.TextColored(colors.text_dim, label .. ':')
    imgui.SameLine(0, 8)

    if width ~= nil then
        local label_w = (imgui.CalcTextSize(label .. ':')) + 8

        value = fit_text(value, width - label_w - scaled(8))
    end

    if color ~= nil then
        imgui.TextColored(color, value)
    else
        imgui.Text(value)
    end
end

-- The sheet of the monster that is selected.
-- The data of the monster (notorious, species, job, aggressive...): at the
-- right of the 3D model, or under the sheet's header when there is no model.
function sheetx.monsters_info(store, data, width)
    if data.species ~= nil then
        sheetx.monsters_line(tx('Species'), store.SpeciesLabel(data.species), width)
    end

    if data.jobs ~= nil then
        local main, sub = data.jobs[1], data.jobs[2]

        sheetx.monsters_line(
            tx('Job'),
            store.JobLabel(main) .. (sub ~= nil and sub ~= main
                and ('/' .. store.JobLabel(sub)) or ''),
            width
        )
    end

    sheetx.monsters_line(
        tx('Aggressive'), sheetx.monsters_yesno(data.aggro), width,
        data.aggro == true and { 0.95, 0.25, 0.25, 1.0 } or nil
    )
    sheetx.monsters_line(tx('Links'), sheetx.monsters_yesno(data.links), width)
    sheetx.monsters_line(
        tx('True detection'),
        sheetx.monsters_yesno(data.truedet),
        width
    )

    if data.detects ~= nil and #data.detects > 0 then
        local labels = {}

        for _, kind in ipairs(data.detects) do
            labels[#labels + 1] = tx(tostring(kind))
        end

        sheetx.monsters_line(tx('Detects'), table.concat(labels, ', '), width)
    end
end

function sheetx.monsters_sheet(store, width)
    local name = store.GetSelected()

    if name == nil then
        imgui.TextWrapped(tx('Pick a monster from the list.'))

        return
    end

    local data, data_name = store.Info(name)
    local fav_name = store.Canonical(name) or data_name or name

    -- Defeated: the mark appears once the character (or the party) has
    -- killed it.
    local times, first = store.Defeated(fav_name)

    -- The name: big and centered, with a green V at its right when defeated.
    do
        local title = data_name or name
        local pushed = false

        if journal_font ~= nil then
            pushed = pcall(imgui.PushFont, journal_font, journal_font_size * 1.35)
        end

        local title_w, title_h = imgui.CalcTextSize(title)
        local mark_gap = scaled(12)
        -- A green check (drawn) at the right of the name when it is defeated.
        local mark_w = times > 0 and (title_h or scaled(30)) or 0
        local total_w = title_w + (times > 0 and (mark_gap + mark_w) or 0)

        imgui.SetCursorPosX(math.max(0, (width - total_w) * 0.5))
        imgui.TextColored(richtext.COLORS.monster, title)

        if times > 0 then
            imgui.SameLine(0, mark_gap)
            imgui.Dummy({ mark_w, mark_w })

            if imgui.GetItemRectMin ~= nil and imgui.GetWindowDrawList ~= nil then
                local check_x, check_y = imgui.GetItemRectMin()

                icons.draw_check(
                    imgui.GetWindowDrawList(), check_x, check_y, mark_w * 0.9,
                    imgui.GetColorU32(colors.leaf)
                )
            end
        end

        if pushed then
            imgui.PopFont()
        end

        -- Notorious: the label goes under the name.
        if data ~= nil and data.nm == true then
            local label = tx('Notorious monster')

            imgui.SetCursorPosX(math.max(0, (width - (imgui.CalcTextSize(label))) * 0.5))
            imgui.TextColored(sheetx.monsters_nm_border, label)
        end

        -- How many times it was defeated and the first time, under the name.
        if times > 0 then
            local line = tx('Defeated')

            if times > 1 then
                line = line .. '  x' .. times
            end

            local when = first > 0
                and tx('First time: %s'):format(os.date('%Y-%m-%d', first)) or nil
            local gap = scaled(12)
            local line_w = (imgui.CalcTextSize(line))
                + (when ~= nil and (gap + (imgui.CalcTextSize(when))) or 0)

            imgui.SetCursorPosX(math.max(0, (width - line_w) * 0.5))
            imgui.TextColored(colors.leaf, line)

            if when ~= nil then
                imgui.SameLine(0, gap)
                imgui.TextColored(colors.text_dim, when)
            end
        else
            local line = tx('Not defeated yet')

            imgui.SetCursorPosX(math.max(0, (width - (imgui.CalcTextSize(line))) * 0.5))
            imgui.TextColored(colors.text_dim, line)
        end
    end

    -- Favorite: the monster goes to (or leaves) the Favorites folder.
    local is_fav = store.IsFavorite(fav_name)
    -- A star: gold when it is a favorite, grey when it is not.
    local fav_w = ui_button_height

    imgui.SetCursorPosX(math.max(0, (width - fav_w) * 0.5))

    if is_fav then
        imgui.PushStyleColor(ImGuiCol_Button, colors.button_active)
    end

    if imgui.Button('##MonFavorite', { fav_w, ui_button_height }) then
        if not store.ToggleFavorite(fav_name) then
            sheetx.monsters_full = os.clock()
        end
    end

    if imgui.GetItemRectMin ~= nil and imgui.GetWindowDrawList ~= nil then
        local star_x, star_y = imgui.GetItemRectMin()
        local pad = ui_button_height * 0.12

        icons.draw_star(
            imgui.GetWindowDrawList(), star_x + pad, star_y + pad,
            ui_button_height - pad * 2,
            imgui.GetColorU32(is_fav and { 1.0, 0.85, 0.1, 1.0 } or colors.text_dim)
        )
    end

    if is_fav then
        imgui.PopStyleColor()
    end

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(
            is_fav and tx('Remove from favorites') or tx('Add to favorites')
        )
    end

    if sheetx.monsters_full ~= nil and os.clock() - sheetx.monsters_full < 4 then
        imgui.TextColored(colors.text_dim, tx('The favorites list is full.'))
    end

    -- The 3D model (only the monsters that have a DAT in data/monster_dats.lua).
    local side_done = false

    if controller ~= nil and controller.monster_view ~= nil then
        side_done = controller.monster_view.DrawPanel(fav_name, width, {
            scale = scaled(1),
            dim = colors.text_dim,
            accent = colors.gold,
            button_h = ui_button_height,
            -- The data of the monster goes at the right of the model.
            side = data ~= nil and function(room)
                sheetx.monsters_info(store, data, room)
                sheetx.monsters_drops(store, data_name or fav_name, room, true)
            end or nil,
            side_w = scaled(240),
        }) == true
    end

    if data == nil then
        imgui.Spacing()
        imgui.TextWrapped(
            tx('No sheet for this name in the source data. It may be a group or a type of monster.')
        )

        return
    end

    if not side_done then
        imgui.Spacing()
        sheetx.monsters_info(store, data, width)
    end

    -- The drops go under the data at the right of the model; with no model
    -- they go here, above the zones (the section draws its own separator).
    if not side_done then
        sheetx.monsters_drops(store, data_name or fav_name, width)
    end

    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()

    -- Zones: a click guides the compass there (the same as the zone list).
    imgui.TextColored(colors.text, tx('Where to find it'))

    local zones = data.zones or {}

    if #zones == 0 then
        imgui.TextWrapped(tx('No zones in the data.'))
    else
        imgui.TextColored(colors.text_dim, tx('Click a zone to guide the compass there.'))

        local goal = controller.GetCompassZoneGoal
            and controller.GetCompassZoneGoal() or nil

        for index, zone in ipairs(sheetx.zones_by_level(zones)) do
            local zone_name = controller.GetCompassZoneName
                and controller.GetCompassZoneName(zone[1]) or nil

            if zone_name == nil or zone_name == '' or zone_name == '???' then
                zone_name = string.format(tx('Zone #%d'), zone[1])
            end

            local levels = sheetx.monsters_levels(zone[2], zone[3])
            local label = levels ~= '' and (zone_name .. '  -  ' .. levels)
                or zone_name

            local selected = zone[1] == goal

            if toolbar_mode_button(
                fit_text(label, width - 24) .. '##MonZone' .. index,
                selected,
                width - 8
            ) and controller.ToggleCompassZoneGoal then
                controller.ToggleCompassZoneGoal(zone[1])
            end
        end
    end
end

-- The zones of a monster from the lowest level to the highest: by the low
-- end of the range (the high one when the low is 0), then by the high end.
-- The ones with no level go last; the order of the data breaks the ties.
-- It returns a new list: the data is not changed.
function sheetx.zones_by_level(zones)
    local list = {}

    for index, zone in ipairs(zones or {}) do
        local low = tonumber(zone[2]) or 0
        local high = tonumber(zone[3]) or 0

        list[#list + 1] = {
            zone = zone,
            index = index,
            low = low > 0 and low or high,
            high = high,
        }
    end

    table.sort(list, function(a, b)
        local a_none, b_none = a.low <= 0, b.low <= 0

        if a_none ~= b_none then
            return b_none
        end

        if a.low ~= b.low then
            return a.low < b.low
        end

        if a.high ~= b.high then
            return a.high < b.high
        end

        return a.index < b.index
    end)

    local result = {}

    for position, item in ipairs(list) do
        result[position] = item.zone
    end

    return result
end

-- What a click on a drop does: opens the sheet of the item in the item
-- catalogue (by its id, or by its name when that id is not in it). nil when
-- the catalogue does not have the item: its name stays plain text.
function sheetx.drop_item_link(item)
    local items = controller ~= nil and controller.items or nil

    if items == nil or items.Show == nil then
        return nil
    end

    local id = tonumber(item[1])

    if id ~= nil and items.Entry ~= nil and items.Entry(id) ~= nil then
        return function()
            items.Show(id)
        end
    end

    if items.ByName ~= nil and items.ShowByName ~= nil
        and items.ByName(item[2]) ~= nil then

        return function()
            items.ShowByName(item[2])
        end
    end

    return nil
end

-- The drops of the monster: the name of the item (the data gives it, the game
-- is not asked) and its percent, the most frequent first. The names of the
-- items the catalogue has are buttons that open their sheet.
function sheetx.monsters_drops(store, name, width, no_separator)
    local entry = store.Drops and store.Drops(name) or nil

    imgui.Spacing()

    -- A separator spans the whole window: not inside the column of the data.
    if not no_separator then
        imgui.Separator()
    end

    imgui.Spacing()
    imgui.TextColored(colors.text, tx('Drops'))

    -- A small line under the title (drawn: a Separator spans the window).
    if imgui.GetCursorScreenPos ~= nil and imgui.GetWindowDrawList ~= nil then
        local line_x, line_y = imgui.GetCursorScreenPos()

        imgui.GetWindowDrawList():AddLine(
            { line_x, line_y + 1 },
            { line_x + math.max(10, width - scaled(8)), line_y + 1 },
            imgui.GetColorU32(colors.text_dim),
            1
        )
        imgui.Dummy({ 1, scaled(6) })
    end

    if entry == nil or entry.items == nil or #entry.items == 0 then
        imgui.TextColored(colors.text_dim, tx('No drops in the data.'))

        return
    end

    if entry.varies then
        imgui.TextColored(
            colors.text_dim,
            fit_text(tx('Versions of it drop different things: the highest rate is shown.'), width - 8)
        )
    end

    -- SameLine counts from the left of the window: add where the section starts.
    local base = imgui.GetCursorPosX ~= nil and imgui.GetCursorPosX() or 0

    -- The percents go at the left, in a column, and then the name.
    local percent_col = 0

    for _, item in ipairs(entry.items) do
        percent_col = math.max(
            percent_col, (imgui.CalcTextSize(store.PercentLabel(item[3])))
        )
    end

    -- The names that are buttons start at the left of their box.
    local align_pushed = false

    if ImGuiStyleVar_ButtonTextAlign ~= nil then
        imgui.PushStyleVar(ImGuiStyleVar_ButtonTextAlign, { 0, 0.5 })
        align_pushed = true
    end

    for index, item in ipairs(entry.items) do
        local percent = store.PercentLabel(item[3])
        local percent_w = (imgui.CalcTextSize(percent))
        local label = tostring(item[2]):gsub('^%l', string.upper)
        local open_item = sheetx.drop_item_link(item)

        -- SetCursorPosX counts from the window; SameLine(offset) would count
        -- from the group (the column of the data), so it is not used here.
        imgui.SetCursorPosX(base + percent_col - percent_w)
        imgui.TextColored(colors.text_dim, percent)
        imgui.SameLine(0, 0)
        imgui.SetCursorPosX(base + percent_col + scaled(10))

        if open_item ~= nil then
            if toolbar_mode_button(
                fit_text(label, width - percent_col - scaled(40))
                    .. '##DropItem' .. index,
                false, width - percent_col - scaled(24)
            ) then
                open_item()
            end

            if imgui.IsItemHovered ~= nil and imgui.SetTooltip ~= nil
                and imgui.IsItemHovered() then

                imgui.SetTooltip(tx('Click to see its sheet'))
            end
        else
            imgui.Text(fit_text(label, width - percent_col - scaled(28)))
        end
    end

    if align_pushed then
        imgui.PopStyleVar()
    end
end

-- The very light colors of the folders and the defeated monsters in the
-- Legacy theme (the page is parchment: the dark ones would be heavy).
sheetx.monsters_pale = {
    zone = { 0.80, 0.89, 1.00 },
    defeated = { 0.76, 0.95, 0.76 },
    favorite = { 1.00, 0.93, 0.62 },
}

-- The border of the button of a notorious monster.
sheetx.monsters_nm_border = { 1.00, 0.55, 0.05, 1.00 }

-- The color of the folders of zones (the monsters keep the normal text
-- color; the Favorites folder is gold).
sheetx.monsters_zone_tint = { 0.45, 0.68, 0.95, 1.0 }

-- The border of the folder of the zone you are in.
sheetx.monsters_here_border = { 0.30, 0.85, 0.35, 1.0 }
-- The row of the zone you are in: light green, with dark text, in any theme.
-- { fill, hover, pressed, text }
sheetx.monsters_here_fill = {
    { 0.78, 0.92, 0.78, 1 }, { 0.70, 0.88, 0.70, 1 },
    { 0.62, 0.82, 0.62, 1 }, { 0.07, 0.16, 0.08, 1 },
}
sheetx.monsters_here_fill_open = {
    { 0.64, 0.86, 0.64, 1 }, { 0.60, 0.84, 0.60, 1 },
    { 0.55, 0.80, 0.55, 1 }, { 0.07, 0.16, 0.08, 1 },
}

-- The regions (the ones of the list of zones: Windurst, Sarutabaruta...)
-- that have monsters, each with its zones. The regions go in the order of
-- the list of zones (the nations first), or by their lowest level when the
-- list is sorted by level; the zones of a region by name or by level. The
-- zones that no region has go in "Other zones", and the monsters with no
-- zone in the data in a folder of their own, last.
function sheetx.monsters_zone_order(store, mode)
    local groups = store.ByZone(mode)
    local zonelist = controller and controller.zonelist
    local ranks = {}
    local names = {}

    if zonelist ~= nil then
        for index, region in ipairs(zonelist.Regions()) do
            for _, id in ipairs(region.zones) do
                ranks[id] = index
            end

            names[index] = region.name
        end
    end

    local OTHER, NONE = 1000, 2000
    local by_rank = {}
    local regions = {}

    for id, list in pairs(groups) do
        local name

        if id == 0 then
            name = tx('No zone in the data')
        else
            name = controller.GetCompassZoneName
                and controller.GetCompassZoneName(id) or nil

            if name == nil or name == '' or name == '???' then
                name = string.format(tx('Zone #%d'), id)
            end
        end

        local rank = id == 0 and NONE or ranks[id] or OTHER
        local region = by_rank[rank]

        if region == nil then
            region = {
                rank = rank,
                key = 'R' .. rank,
                name = rank == NONE and tx('No zone in the data')
                    or rank == OTHER and tx('Other zones')
                    or names[rank],
                flat = rank == NONE,
                level = 999,
                zones = {},
            }
            by_rank[rank] = region
            regions[#regions + 1] = region
        end

        local first = 999

        for _, entry in ipairs(list) do
            first = math.min(first, store.low_key(entry))
        end

        region.level = math.min(region.level, first)
        region.zones[#region.zones + 1] = {
            id = id, name = name, key = name:lower(), level = first,
        }
    end

    for _, region in ipairs(regions) do
        table.sort(region.zones, function(a, b)
            if mode == 'level' and a.level ~= b.level then
                return a.level < b.level
            end

            return a.key < b.key
        end)
    end

    table.sort(regions, function(a, b)
        local a_last, b_last = a.rank >= OTHER, b.rank >= OTHER

        if a_last ~= b_last then
            return b_last
        end

        if mode == 'level' and not a_last and a.level ~= b.level then
            return a.level < b.level
        end

        return a.rank < b.rank
    end)

    return regions
end

-- How many of the monsters of the entries have been defeated, and how many
-- there are (a monster in several zones counts once).
function sheetx.monsters_counts(store, lists, bonus, cache_key)
    -- The counts only change when the kills change (or when the lists are
    -- built again), so the ones of a folder with a cache_key are worked out
    -- once and not on every frame (that was most of the cost of the window).
    local cache = nil

    if cache_key ~= nil and store.KillsVersion ~= nil and store.ByZone ~= nil then
        local version = tostring(store.KillsOwner()) .. ':' .. tostring(store.KillsVersion())
        local groups = store.ByZone('name')

        cache = sheetx.monsters_counts_cache

        if cache == nil or cache.version ~= version or cache.groups ~= groups then
            cache = { version = version, groups = groups, items = {} }
            sheetx.monsters_counts_cache = cache
        end

        local hit = cache.items[cache_key]

        if hit ~= nil then
            return { done = hit.done, total = hit.total, bonus = bonus }
        end
    end

    local done, total, seen = 0, 0, {}

    for _, list in ipairs(lists) do
        for _, entry in ipairs(list) do
            if not seen[entry.name] then
                seen[entry.name] = true
                total = total + 1

                if store.Defeated(entry.name) > 0 then
                    done = done + 1
                end
            end
        end
    end

    if cache ~= nil then
        cache.items[cache_key] = { done = done, total = total }
    end

    return { done = done, total = total, bonus = bonus }
end

-- The title of a folder: its name, the monsters defeated / all of them, and
-- a V when they are all defeated, with the points of the bonus of having
-- completed it ("V +50").
function sheetx.monsters_folder_title(name, counts, room)
    local suffix = ' (' .. counts.done .. '/' .. counts.total .. ')'

    if counts.total > 0 and counts.done >= counts.total then
        suffix = suffix .. ' V'

        if counts.bonus ~= nil and counts.bonus > 0 then
            suffix = suffix .. ' +' .. counts.bonus
        end
    end

    return fit_text(name, math.max(40, room - (imgui.CalcTextSize(suffix)))) .. suffix
end

-- The line of a folder: a +/- button and the name in its own color. True
-- when it was clicked. depth is how many levels it is inside.
function sheetx.monsters_header(key, name, counts, tint, opened, row_w, depth, border, active)
    local toggle_w = ui_button_height
    local base = scaled(24) * (depth or 0)
    local clicked = false

    if base > 0 then
        imgui.Dummy({ base, 1 })
        imgui.SameLine(0, 0)
    end

    if imgui.Button(
        (opened and '-' or '+') .. '##MonFold' .. key,
        { toggle_w, ui_button_height }
    ) then
        clicked = true
    end

    imgui.SameLine(0, 4)

    if toolbar_mode_button(
        sheetx.monsters_folder_title(
            name, counts, row_w - base - toggle_w - 28
        ) .. '##MonGroup' .. key,
        active == true,
        row_w - base - toggle_w - 4,
        tint,
        tint == sheetx.monsters_zone_tint and sheetx.monsters_pale.zone
            or sheetx.monsters_pale.favorite
    ) then
        clicked = true
    end

    -- A colored border (the folder of the zone you are in is green).
    if border ~= nil and imgui.GetItemRectMin ~= nil then
        local min_x, min_y = imgui.GetItemRectMin()
        local max_x, max_y = imgui.GetItemRectMax()

        imgui.GetWindowDrawList():AddRect(
            { min_x, min_y },
            { max_x, max_y },
            imgui.GetColorU32(border),
            2,
            0,
            2
        )
    end

    return clicked
end

-- One row of the list of monsters: its name (with its levels), green when
-- it is defeated, an orange border when it is notorious. key is the id of
-- its group (the zone id or 'C' / 'F'), only for the id of the button.
function sheetx.monsters_row(store, key, index, entry, row_w, selected_name, indent)
    local label = entry.name

    indent = indent or 0

    if indent > 0 then
        imgui.Dummy({ indent, 1 })
        imgui.SameLine(0, 0)
        row_w = row_w - indent
    end

    if entry.high > 0 then
        label = label .. ' (' .. sheetx.monsters_range(
            entry.low, entry.high
        ) .. ')'
    end

    local defeated = (store.Defeated(entry.name)) > 0

    if toolbar_mode_button(
        fit_text(label, row_w - 24) .. '##Mon' .. key .. '_' .. index,
        entry.name == selected_name,
        row_w,
        defeated and colors.leaf or nil,
        defeated and sheetx.monsters_pale.defeated or nil
    ) then
        store.Select(entry.name)
        sheetx.monsters_rank_open = false
    end

    -- The monster picked from a step: the list scrolls to its row.
    local reveal = sheetx.monsters_reveal

    if reveal ~= nil and reveal.key == key and reveal.name == entry.name then
        if imgui.SetScrollHereY ~= nil then
            imgui.SetScrollHereY(0.4)
        end

        sheetx.monsters_reveal = nil
    end

    if store.IsNotorious(entry.name) and imgui.GetItemRectMin ~= nil then
        local min_x, min_y = imgui.GetItemRectMin()
        local max_x, max_y = imgui.GetItemRectMax()

        imgui.GetWindowDrawList():AddRect(
            { min_x, min_y },
            { max_x, max_y },
            imgui.GetColorU32(sheetx.monsters_nm_border),
            2,
            0,
            1.5
        )
    end
end

-- Bold text: the bold font of the step text, or the text drawn twice (one
-- pixel apart) when that font is not loaded.
function sheetx.monsters_bold_width(text)
    local pushed = text_bold_font ~= nil
        and pcall(imgui.PushFont, text_bold_font, journal_font_size)
    local width = (imgui.CalcTextSize(text))

    if pushed then
        imgui.PopFont()
    end

    return width
end

function sheetx.monsters_bold_text(text, color)
    local pushed = text_bold_font ~= nil
        and pcall(imgui.PushFont, text_bold_font, journal_font_size)

    if pushed then
        imgui.TextColored(color, text)
        imgui.PopFont()
    else
        local x, y = imgui.GetCursorScreenPos()

        imgui.TextColored(color, text)
        imgui.SetCursorScreenPos({ x + 1, y })
        imgui.TextColored(color, text)
    end
end

-- A row of the list that is not a folder: the zone you are in, Favorites, or a
-- zone of a region.
function sheetx.monsters_place(
    key, name, counts, tint, row_w, depth, selected, border, fill, prefix
)
    local base = scaled(24) * (depth or 0)

    if base > 0 then
        imgui.Dummy({ base, 1 })
        imgui.SameLine(0, 0)
    end

    -- With a prefix (in bold) the text of the button is drawn over it.
    local prefix_w = 0

    if prefix ~= nil then
        prefix_w = sheetx.monsters_bold_width(prefix) + scaled(6)
    end

    local title = sheetx.monsters_folder_title(
        name, counts, row_w - base - 28 - prefix_w
    )

    local clicked = toolbar_mode_button(
        (prefix ~= nil and '' or title) .. '##MonPlace' .. key,
        selected,
        row_w - base,
        tint,
        tint == colors.favorite and sheetx.monsters_pale.favorite
            or sheetx.monsters_pale.zone,
        fill
    )

    if prefix ~= nil and imgui.GetItemRectMin ~= nil then
        local min_x, min_y = imgui.GetItemRectMin()
        local _, max_y = imgui.GetItemRectMax()
        local next_x, next_y = imgui.GetCursorScreenPos()
        local text_color = fill ~= nil and fill[4] or colors.text

        imgui.SetCursorScreenPos({
            min_x + scaled(8),
            min_y + math.max(0, (max_y - min_y - imgui.GetTextLineHeight()) * 0.5),
        })
        sheetx.monsters_bold_text(prefix, text_color)
        imgui.SameLine(0, scaled(6))
        imgui.TextColored(text_color, title)
        imgui.SetCursorScreenPos({ next_x, next_y })
    end

    if border ~= nil and imgui.GetItemRectMin ~= nil then
        local min_x, min_y = imgui.GetItemRectMin()
        local max_x, max_y = imgui.GetItemRectMax()

        imgui.GetWindowDrawList():AddRect(
            { min_x, min_y },
            { max_x, max_y },
            imgui.GetColorU32(border),
            2,
            0,
            2
        )
    end

    return clicked
end

-- What the two columns need in every frame: the monsters by zone, the
-- search, the filters and the zone you are in. It also does what has to be
-- done once per frame: take the monster picked from a step (its zone is
-- selected and its region opened), and choose a place when there is none.
function sheetx.monsters_context(store)
    local mode = store.GetSort()

    if sheetx.monsters_zones == nil or sheetx.monsters_zones_mode ~= mode then
        sheetx.monsters_zones = sheetx.monsters_zone_order(store, mode)
        sheetx.monsters_zones_mode = mode
    end

    local ctx = {
        mode = mode,
        groups = store.ByZone(mode),
        query = store.fold(sheetx.monsters_filter[1]),
        pending = store.GetOnlyPending(),
        rank_points = controller and controller.monster_rank or nil,
    }

    ctx.here = store.CurrentZone and store.CurrentZone() or nil

    if ctx.here ~= nil and ctx.groups[ctx.here] == nil then
        ctx.here = nil
    end

    -- The entries that pass the search and the filters.
    function ctx.passes(entry)
        return (ctx.query == '' or entry.key:find(ctx.query, 1, true))
            and not (ctx.pending and store.Defeated(entry.name) > 0)
            and store.PassesFilters(entry)
    end

    -- Asked twice for the same zone in a frame (to know if it has a match
    -- and to draw it): worked out once.
    local shown_memo = {}

    function ctx.shown(list)
        if list ~= nil and shown_memo[list] ~= nil then
            return shown_memo[list]
        end

        local out = {}

        for _, entry in ipairs(list or {}) do
            if ctx.passes(entry) then
                out[#out + 1] = entry
            end
        end

        if list ~= nil then
            shown_memo[list] = out
        end

        return out
    end

    function ctx.zone_bonus(id)
        return ctx.rank_points ~= nil and ctx.rank_points.ZoneBonus(id) or nil
    end

    -- A monster picked from a step: no filter hides it. The place of the zone
    -- you are in comes first; if not, the first zone of the list that has it.
    local wanted = store.TakeReveal and store.TakeReveal() or nil

    if wanted ~= nil then
        sheetx.monsters_filter[1] = ''
        sheetx.monsters_rank_open = false
        store.ClearFilters()
        ctx.query = ''
        ctx.pending = false

        local function has(zone_id)
            for _, entry in ipairs(ctx.groups[zone_id] or {}) do
                if entry.name == wanted then
                    return true
                end
            end

            return false
        end

        if ctx.here ~= nil and has(ctx.here) then
            sheetx.monsters_sel = { kind = 'C' }
            sheetx.monsters_reveal = { name = wanted, key = 'C' }
        else
            for _, region in ipairs(sheetx.monsters_zones) do
                for _, zone in ipairs(region.zones) do
                    if sheetx.monsters_reveal == nil and has(zone.id) then
                        sheetx.monsters_open[region.key] = true
                        sheetx.monsters_sel = { kind = 'zone', key = zone.id }
                        sheetx.monsters_reveal = { name = wanted, key = zone.id }
                    end
                end
            end
        end
    end

    local sel = sheetx.monsters_sel

    -- No place picked (or the zone you were in is gone): the zone you are in,
    -- or everything closed. 'none' is a list with every place closed.
    if sel == nil or (sel.kind == 'C' and ctx.here == nil) then
        sheetx.monsters_sel = ctx.here ~= nil and { kind = 'C' } or { kind = 'none' }
    end

    return ctx
end

-- The only list: the places (the zone you are in, Favorites, the regions with
-- their zones) and, under the place that is open, its monsters (that pass the
-- search and the filters). A click on a place opens it; a click on the open
-- one closes it. With a search or a filter every zone with a match is open.
function sheetx.monsters_tree(store, ctx, col_w)
    local sel = sheetx.monsters_sel
    local row_w = col_w - scaled(28)
    local indent = scaled(24)
    local selected_name = store.GetSelected()
    local searching = ctx.query ~= '' or store.AnyFilter() or ctx.pending
    local anything = false

    if ImGuiStyleVar_ButtonTextAlign ~= nil then
        imgui.PushStyleVar(ImGuiStyleVar_ButtonTextAlign, { 0, 0.5 })
    end

    -- Clicking the open place closes it.
    local function pick(kind, key)
        if sel.kind == kind and sel.key == key then
            sheetx.monsters_sel = { kind = 'none' }
        else
            sheetx.monsters_sel = { kind = kind, key = key }
        end
    end

    local function monsters(key, shown, depth)
        for index, entry in ipairs(shown) do
            anything = true
            sheetx.monsters_row(
                store, key, index, entry, row_w, selected_name, indent * depth
            )
        end
    end

    -- The zone you are in (green border).
    if ctx.here ~= nil then
        local here_name = controller.GetCompassZoneName
            and controller.GetCompassZoneName(ctx.here) or nil

        if here_name == nil or here_name == '' or here_name == '???' then
            here_name = string.format(tx('Zone #%d'), ctx.here)
        end

        local opened = sel.kind == 'C'

        if sheetx.monsters_place(
            'C', here_name,
            sheetx.monsters_counts(
                store, { ctx.groups[ctx.here] }, ctx.zone_bonus(ctx.here),
                'Z' .. ctx.here
            ),
            sheetx.monsters_zone_tint, row_w, 0, opened,
            sheetx.monsters_here_border,
            opened and sheetx.monsters_here_fill_open or sheetx.monsters_here_fill,
            tx('Current zone:')
        ) then
            pick('C')
        end

        if opened then
            monsters('C', ctx.shown(ctx.groups[ctx.here]), 1)
        end
    end

    local favs = store.Favorites(ctx.mode)
    local fav_open = sel.kind == 'F'

    if sheetx.monsters_place(
        'F', tx('Favorites'), sheetx.monsters_counts(store, { favs }),
        colors.favorite, row_w, 0, fav_open
    ) then
        pick('F')
    end

    if fav_open then
        local shown = ctx.shown(favs)

        monsters('F', shown, 1)

        if #shown == 0 and not searching then
            imgui.TextWrapped(tx('No favorite monsters yet. Pick one and press Fav.'))
        end
    end

    imgui.Spacing()

    for _, region in ipairs(sheetx.monsters_zones) do
        local visible = {}

        for _, zone in ipairs(region.zones) do
            -- With a search or a filter only the zones with a match.
            if not searching or #ctx.shown(ctx.groups[zone.id]) > 0 then
                visible[#visible + 1] = zone
            end
        end

        if #visible > 0 then
            if region.flat then
                local zone = visible[1]
                local opened = searching
                    or (sel.kind == 'zone' and sel.key == zone.id)

                if sheetx.monsters_place(
                    tostring(zone.id), region.name,
                    sheetx.monsters_counts(
                        store, { ctx.groups[zone.id] or {} }, nil, 'Z' .. zone.id
                    ),
                    sheetx.monsters_zone_tint, row_w, 0, opened
                ) then
                    pick('zone', zone.id)
                end

                if opened then
                    monsters(zone.id, ctx.shown(ctx.groups[zone.id]), 1)
                end
            else
                local lists = {}

                for _, zone in ipairs(region.zones) do
                    lists[#lists + 1] = ctx.groups[zone.id] or {}
                end

                local opened = searching or sheetx.monsters_open[region.key] == true

                if sheetx.monsters_header(
                    region.key, region.name,
                    sheetx.monsters_counts(
                        store, lists,
                        region.rank < 1000 and ctx.rank_points
                            and ctx.rank_points.RegionBonus(region.rank) or nil,
                        'R' .. region.key
                    ),
                    sheetx.monsters_zone_tint, opened, row_w, 0, nil, false
                ) then
                    sheetx.monsters_open[region.key] = not opened
                end

                if opened then
                    for _, zone in ipairs(visible) do
                        local zone_open = searching
                            or (sel.kind == 'zone' and sel.key == zone.id)

                        if sheetx.monsters_place(
                            tostring(zone.id), zone.name,
                            sheetx.monsters_counts(
                                store, { ctx.groups[zone.id] or {} },
                                ctx.zone_bonus(zone.id), 'Z' .. zone.id
                            ),
                            sheetx.monsters_zone_tint, row_w, 1, zone_open
                        ) then
                            pick('zone', zone.id)
                        end

                        if zone_open then
                            monsters(zone.id, ctx.shown(ctx.groups[zone.id]), 2)
                        end
                    end
                end
            end
        end
    end

    if ImGuiStyleVar_ButtonTextAlign ~= nil then
        imgui.PopStyleVar()
    end

    if searching and not anything then
        if ctx.pending and ctx.query == '' and not store.AnyFilter() then
            imgui.TextWrapped(tx('You have defeated them all!'))
        else
            imgui.TextWrapped(tx('No monster matches.'))
        end
    end
end

-- "4-5" or "3": the levels of a monster in a zone, for its row.
function sheetx.monsters_range(low, high)
    if low <= 0 or low == high then
        return string.format('%d', high)
    end

    return string.format('%d-%d', low, high)
end

-- The name of the function, big and centered at the top of the window.
function sheetx.monsters_title(width, title)
    local text = title or tx("Vana'dex (BETA)")
    local font = sheetx.alert_font or sheetx.banner_font or journal_font
    local size = scaled(80)
    local pushed = false

    if font ~= nil then
        pushed = pcall(imgui.PushFont, font, size)
    end

    local text_w = (imgui.CalcTextSize(text))

    imgui.SetCursorPosX(math.max(0, (width - text_w) * 0.5))
    imgui.TextColored(colors.gold, text)

    if pushed then
        imgui.PopFont()
    end

    return text_w
end

-- 12345 -> "12,345".
function sheetx.thousands(value)
    local text = tostring(math.floor(tonumber(value) or 0))
    local replaced

    repeat
        text, replaced = text:gsub('^(-?%d+)(%d%d%d)', '%1,%2')
    until replaced == 0

    return text
end

-- The text of the tooltip of the rank: the rank, the points and where they
-- come from.
function sheetx.monsters_rank_tooltip(rank, score)
    local parts = score.parts
    local counts = score.counts
    local lines = {
        string.format(
            '%s  (%d/%d)', tx(score.rank_name), score.rank, #rank.RANKS
        ),
        string.format(tx('%s points'), sheetx.thousands(score.points)),
    }

    if score.next_points ~= nil then
        lines[#lines + 1] = string.format(
            tx('Next: %s at %s points'),
            tx(score.next_name), sheetx.thousands(score.next_points)
        )
    else
        lines[#lines + 1] = tx('Highest rank reached')
    end

    lines[#lines + 1] = ''
    lines[#lines + 1] = string.format(
        tx('Discovered: %d / %d (%s)'),
        counts.discovered, counts.total, sheetx.thousands(parts.discovered)
    )
    lines[#lines + 1] = string.format(
        tx('Repeat defeats: %s'), sheetx.thousands(parts.repeats)
    )
    lines[#lines + 1] = string.format(
        tx('Notorious: %d (%s)'),
        counts.notorious, sheetx.thousands(parts.notorious)
    )
    lines[#lines + 1] = string.format(
        tx('Zones completed: %d / %d (%s)'),
        counts.zones_done, counts.zones_total, sheetx.thousands(parts.zones)
    )
    lines[#lines + 1] = string.format(
        tx('Regions completed: %d / %d (%s)'),
        counts.regions_done, counts.regions_total,
        sheetx.thousands(parts.regions)
    )
    lines[#lines + 1] = ''
    lines[#lines + 1] = tx('Click for the details')

    return table.concat(lines, '\n')
end

-- The rank at the top right of the window: its name, the points and a bar
-- to the next rank. A click opens the page of the rank. It goes under the X
-- button, beside the title; if the window is too narrow for that, under the
-- title. Returns the Y where the rest of the window can start.
function sheetx.monsters_rank_widget(width, title_y, title_w, after_y)
    local rank = controller and controller.monster_rank

    if rank == nil or imgui.InvisibleButton == nil then
        return after_y
    end

    local score = rank.Score()
    local inner, pad = sheetx.settings_inner(width)
    local right = pad + inner
    local want = scaled(240)
    local room = right - ((width + title_w) * 0.5 + scaled(12))
    local box_w = math.min(want, room)
    local inline = box_w >= scaled(170)
    local line_h = scaled(16)

    if imgui.GetTextLineHeight ~= nil then
        local ok, value = pcall(imgui.GetTextLineHeight)

        if ok and type(value) == 'number' and value > 0 then
            line_h = value
        end
    end

    local bar_h = scaled(8)
    local box_h = line_h + bar_h + scaled(14)

    if not inline then
        box_w = math.min(want, right - pad)
    end

    local box_x = right - box_w
    local box_y = inline and (title_y + scaled(26) + scaled(6)) or after_y

    imgui.SetCursorPosX(box_x)
    imgui.SetCursorPosY(box_y)

    local clicked = imgui.InvisibleButton('##MonRankBox', { box_w, box_h })
    local hovered = imgui.IsItemHovered()
    local min_x, min_y = imgui.GetItemRectMin()
    local draw = imgui.GetWindowDrawList()
    local open = sheetx.monsters_rank_open == true

    draw:AddRectFilled(
        { min_x, min_y }, { min_x + box_w, min_y + box_h },
        imgui.GetColorU32({ 0, 0, 0, hovered and 0.38 or 0.26 }), 4
    )
    draw:AddRect(
        { min_x, min_y }, { min_x + box_w, min_y + box_h },
        imgui.GetColorU32(open and colors.gold or colors.text_dim), 4, 0,
        open and 2 or 1
    )

    local name = fit_text(tx(score.rank_name), box_w * 0.55)
    local points = sheetx.thousands(score.points)

    draw:AddText(
        { min_x + 8, min_y + 4 }, imgui.GetColorU32(colors.gold), name
    )

    local points_w = (imgui.CalcTextSize(points))

    draw:AddText(
        { min_x + box_w - 8 - points_w, min_y + 4 },
        imgui.GetColorU32(colors.text), points
    )

    local bar_y = min_y + 4 + line_h + scaled(4)
    local bar_x1, bar_x2 = min_x + 8, min_x + box_w - 8

    draw:AddRectFilled(
        { bar_x1, bar_y }, { bar_x2, bar_y + bar_h },
        imgui.GetColorU32({ 1, 1, 1, 0.16 }), 3
    )

    local fill = math.max(0, math.min(1, score.progress or 0))

    if fill > 0 then
        draw:AddRectFilled(
            { bar_x1, bar_y },
            { bar_x1 + (bar_x2 - bar_x1) * fill, bar_y + bar_h },
            imgui.GetColorU32(colors.gold), 3
        )
    end

    if hovered and imgui.SetTooltip then
        imgui.SetTooltip(sheetx.monsters_rank_tooltip(rank, score))
    end

    if clicked then
        sheetx.monsters_rank_open = not open
    end

    local bottom = box_y + box_h + scaled(4)

    -- The total of defeated monsters, under the box (right aligned).
    local totals = sheetx.monsters_totals

    sheetx.monsters_totals_drawn = false

    if totals ~= nil then
        local text_w = (imgui.CalcTextSize(totals.text))

        draw:AddText(
            { min_x + box_w - text_w, min_y + box_h + scaled(3) },
            imgui.GetColorU32(totals.color), totals.text
        )
        bottom = bottom + line_h + scaled(4)
        sheetx.monsters_totals_drawn = true
    end

    if inline then
        return math.max(after_y, bottom)
    end

    return bottom
end

-- The page of the rank, in the place of the sheet of a monster: the points,
-- the rank ladder and the achievements.
function sheetx.monsters_rank_page(width)
    local rank = controller and controller.monster_rank

    if rank == nil then
        sheetx.monsters_rank_open = false

        return
    end

    local score = rank.Score()
    local counts = score.counts

    if imgui.Button(tx('Back') .. '##MonRankBack', { scaled(90), ui_button_height }) then
        sheetx.monsters_rank_open = false
    end

    imgui.Spacing()
    imgui.TextColored(colors.gold, tx(score.rank_name))
    imgui.SameLine(0, 10)
    imgui.TextColored(
        colors.text, string.format(tx('%s points'), sheetx.thousands(score.points))
    )

    if score.next_points ~= nil then
        imgui.TextColored(
            colors.text_dim,
            string.format(
                tx('Next: %s at %s points'),
                tx(score.next_name), sheetx.thousands(score.next_points)
            )
        )
    else
        imgui.TextColored(colors.leaf, tx('Highest rank reached'))
    end

    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()
    imgui.TextColored(colors.gold, tx('Where the points come from'))

    local parts = score.parts

    sheetx.monsters_line(
        tx('Discovered'),
        string.format('%d / %d  (%s)', counts.discovered, counts.total,
            sheetx.thousands(parts.discovered))
    )
    sheetx.monsters_line(
        tx('Repeat defeats'), sheetx.thousands(parts.repeats)
    )
    sheetx.monsters_line(
        tx('Notorious'),
        string.format('%d  (%s)', counts.notorious,
            sheetx.thousands(parts.notorious))
    )
    sheetx.monsters_line(
        tx('Zones completed'),
        string.format('%d / %d  (%s)', counts.zones_done, counts.zones_total,
            sheetx.thousands(parts.zones))
    )
    sheetx.monsters_line(
        tx('Regions completed'),
        string.format('%d / %d  (%s)', counts.regions_done,
            counts.regions_total, sheetx.thousands(parts.regions))
    )

    local cfg = rank.CONFIG

    imgui.Spacing()
    imgui.PushStyleColor(ImGuiCol_Text, colors.text_dim)
    imgui.TextWrapped(
        string.format(
            tx('A new monster gives %d points plus %s per level, and %d more if it is a notorious one. Each repeat defeat gives %d (the first %d count). A completed zone or region gives a bonus.'),
            cfg.discover_base, tostring(cfg.per_level), cfg.notorious_bonus,
            cfg.repeat_points, cfg.repeat_cap
        )
    )
    imgui.PopStyleColor()

    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()
    imgui.TextColored(colors.gold, tx('Ranks'))

    for position, entry in ipairs(rank.RANKS) do
        local reached = score.points >= entry.points
        local line = string.format(
            '%s%s  -  %s', position == score.rank and '> ' or '   ',
            tx(entry.name), sheetx.thousands(entry.points)
        )

        imgui.TextColored(
            position == score.rank and colors.gold
                or (reached and colors.leaf or colors.text_dim),
            line
        )
    end

    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()
    imgui.TextColored(colors.gold, tx('Achievements'))

    for _, item in ipairs(rank.Achievements()) do
        if item.done then
            imgui.TextColored(colors.leaf, 'V  ' .. item.text)
        elseif item.need > 1 then
            imgui.TextColored(
                colors.text_dim,
                string.format('-  %s  (%d/%d)', item.text, item.value, item.need)
            )
        else
            imgui.TextColored(colors.text_dim, '-  ' .. item.text)
        end
    end
end

-- The item catalogue -----------------------------------------------------------
-- The window of the items: a search box and two filters (group and category), one
-- list (only the visible rows are drawn: there are more than 20,000) and the
-- sheet of the item selected: icon, data, text of the game, versions and the
-- monsters that drop it. The data is in items.lua.

sheetx.items_query = { '' }
sheetx.items_group = 0
sheetx.items_sub = 0
sheetx.items_row_h = nil
sheetx.items_scroll_top = false
sheetx.items_last_sig = nil

-- A combo of strings: options = { { value, label }, ... }. Returns the value
-- picked, or nil when nothing changed.
function sheetx.items_combo(id, width, current_label, options, current)
    local picked = nil

    imgui.PushItemWidth(width)

    if imgui.BeginCombo('##' .. id, current_label) then
        for index, option in ipairs(options) do
            if imgui.Selectable(option[2] .. '##' .. id .. index, option[1] == current) then
                picked = option[1]
            end
        end

        imgui.EndCombo()
    end

    imgui.PopItemWidth()

    return picked
end

-- The list: only the rows that are seen are drawn (a Dummy has the height of
-- the others, so the scroll bar is the one of the whole list).
function sheetx.items_list(store, list, col_w)
    local row_w = col_w - scaled(28)
    local selected = store.GetSelected()
    local count = #list

    if sheetx.items_scroll_top then
        sheetx.items_scroll_top = false

        if imgui.SetScrollY ~= nil then
            imgui.SetScrollY(0)
        end
    end

    if count == 0 then
        if store.FavoritesGroup ~= nil and sheetx.items_group == store.FavoritesGroup()
            and store.FavoriteCount() == 0 then

            imgui.TextWrapped(tx('No favorites yet. Use the star on the sheet of an item.'))
        else
            imgui.TextWrapped(tx('No item matches.'))
        end

        return
    end

    local row_h = sheetx.items_row_h or (ui_button_height + scaled(6))
    local gap = math.max(0, row_h - ui_button_height)
    local scroll = imgui.GetScrollY ~= nil and imgui.GetScrollY() or 0
    local view_h = imgui.GetWindowHeight ~= nil and imgui.GetWindowHeight() or scaled(600)
    local first = math.min(count, math.max(1, math.floor(scroll / row_h)))
    local last = math.min(count, math.ceil((scroll + view_h) / row_h) + 1)

    if first > 1 then
        imgui.Dummy({ 1, math.max(1, (first - 1) * row_h - gap) })
    end

    if ImGuiStyleVar_ButtonTextAlign ~= nil then
        imgui.PushStyleVar(ImGuiStyleVar_ButtonTextAlign, { 0, 0.5 })
    end

    local draw = imgui.GetWindowDrawList()
    local size = ui_button_height - scaled(6)

    for index = first, last do
        local entry = list[index]
        local y_before = imgui.GetCursorPosY()

        if toolbar_mode_button(
            '##ItemRow' .. entry.ids[1], entry == selected, row_w
        ) then
            store.Select(entry)
        end

        if sheetx.items_row_h == nil and imgui.GetCursorPosY() > y_before then
            sheetx.items_row_h = imgui.GetCursorPosY() - y_before
        end

        local min_x, min_y = imgui.GetItemRectMin()
        local max_x, max_y = imgui.GetItemRectMax()
        local texture = store.Icon(entry.ids[1])

        if texture ~= nil then
            draw:AddImage(
                texture.id,
                { min_x + scaled(4), min_y + scaled(3) },
                { min_x + scaled(4) + size, min_y + scaled(3) + size },
                { 0, 0 }, { 1, 1 },
                imgui.GetColorU32({ 1, 1, 1, 1 })
            )
        end

        if store.IsFavorite(entry) then
            icons.draw_star(
                draw,
                max_x - scaled(24), min_y + (max_y - min_y - scaled(16)) * 0.5, scaled(16),
                imgui.GetColorU32({ 1.0, 0.85, 0.1, 1.0 })
            )
        end

        local label = entry.name

        if #entry.ids > 1 then
            label = label .. ' (' .. #entry.ids .. ')'
        end

        local line_h = imgui.GetTextLineHeight ~= nil and imgui.GetTextLineHeight() or scaled(16)

        draw:AddText(
            { min_x + size + scaled(12), min_y + math.max(0, (max_y - min_y - line_h) * 0.5) },
            imgui.GetColorU32(colors.text),
            fit_text(label, row_w - size - scaled(44))
        )
    end

    if ImGuiStyleVar_ButtonTextAlign ~= nil then
        imgui.PopStyleVar()
    end

    if last < count then
        imgui.Dummy({ 1, math.max(1, (count - last) * row_h - gap) })
    end
end

-- A line of the sheet: "Label: value".
function sheetx.items_line(label, value)
    imgui.TextColored(colors.text_dim, label .. ':')
    imgui.SameLine(0, 8)
    imgui.Text(value)
end

-- The sheet of the item selected.
function sheetx.items_sheet(store, width)
    local entry = store.GetSelected()

    if entry == nil then
        imgui.TextWrapped(tx('Pick an item from the list.'))

        return
    end

    local id = store.GetSelectedId() or entry.ids[1]
    local info = store.Info(id)

    -- Icon (its place stays empty when the file is not there) and name.
    local icon_size = scaled(64)
    local texture = store.Icon(id)

    imgui.Dummy({ icon_size, icon_size })

    if imgui.GetItemRectMin ~= nil then
        local icon_x, icon_y = imgui.GetItemRectMin()
        local draw = imgui.GetWindowDrawList()

        if texture ~= nil then
            draw:AddImage(
                texture.id, { icon_x, icon_y }, { icon_x + icon_size, icon_y + icon_size },
                { 0, 0 }, { 1, 1 }, imgui.GetColorU32({ 1, 1, 1, 1 })
            )
        else
            draw:AddRect(
                { icon_x, icon_y }, { icon_x + icon_size, icon_y + icon_size },
                imgui.GetColorU32(colors.text_dim), 4, 0, 1
            )
        end
    end

    imgui.SameLine(0, scaled(14))
    imgui.BeginGroup()

    local pushed = false

    if journal_font ~= nil then
        pushed = pcall(imgui.PushFont, journal_font, journal_font_size * 1.35)
    end

    imgui.TextColored(colors.gold, fit_text(entry.name, width - icon_size - scaled(40)))

    if pushed then
        imgui.PopFont()
    end

    local group, sub = store.CategoryLabel(id)

    if group ~= nil then
        imgui.TextColored(
            colors.text_dim,
            tx(group) .. (sub ~= nil and sub ~= group and (' > ' .. tx(sub)) or '')
        )
    end


    -- Favorite: a star, yellow when the item is in the favorites folder.
    local is_fav = store.IsFavorite(entry)

    if is_fav then
        imgui.PushStyleColor(ImGuiCol_Button, colors.button_active)
    end

    if imgui.Button('##ItemFavorite', { ui_button_height, ui_button_height }) then
        store.ToggleFavorite(entry)
    end

    if imgui.GetItemRectMin ~= nil then
        local star_x, star_y = imgui.GetItemRectMin()
        local pad = ui_button_height * 0.12

        icons.draw_star(
            imgui.GetWindowDrawList(), star_x + pad, star_y + pad,
            ui_button_height - pad * 2,
            imgui.GetColorU32(is_fav and { 1.0, 0.85, 0.1, 1.0 } or colors.text_dim)
        )
    end

    if is_fav then
        imgui.PopStyleColor()
    end

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(is_fav and tx('Remove from favorites') or tx('Add to favorites'))
    end

    imgui.EndGroup()

    imgui.Spacing()

    if info == nil then
        imgui.TextColored(colors.text_dim, tx('No data for this item.'))
    else
        -- What the source has; a field it does not have is not shown.
        if info.level > 0 then
            sheetx.items_line(tx('Level'), tostring(info.level))
        end

        if info.ilevel > 0 then
            sheetx.items_line(tx('Item level'), tostring(info.ilevel))
        end

        local jobs = store.JobsLabel(info.jobs)

        if jobs ~= nil then
            sheetx.items_line(tx('Jobs'), jobs == 'All jobs' and tx('All jobs') or jobs)
        end

        if info.rare or info.ex then
            sheetx.items_line(
                tx('Flags'),
                (info.rare and 'Rare' or '') .. (info.rare and info.ex and ' ' or '') .. (info.ex and 'Ex' or '')
            )
        end

        if info.stack > 1 then
            sheetx.items_line(tx('Stack'), tostring(info.stack))
        end

        if info.price > 0 then
            sheetx.items_line(tx('Base price'), string.format(tx('%d gil'), info.price))
        end

        imgui.Spacing()
        imgui.Separator()
        imgui.Spacing()

        if info.text ~= nil and info.text ~= '' then
            imgui.TextWrapped(info.text)
        else
            imgui.TextColored(colors.text_dim, tx('No description in the data.'))
        end
    end

    -- The versions of the name: a click shows its data.
    if #entry.ids > 1 then
        imgui.Spacing()
        imgui.Separator()
        imgui.Spacing()
        imgui.TextColored(colors.text, tx('Versions'))

        if ImGuiStyleVar_ButtonTextAlign ~= nil then
            imgui.PushStyleVar(ImGuiStyleVar_ButtonTextAlign, { 0, 0.5 })
        end

        for _, version in ipairs(entry.ids) do
            local data = store.Info(version)
            local first_line = data ~= nil and tostring(data.text or ''):match('^[^\n]*') or ''
            local label = '#' .. version .. (first_line ~= '' and ('  ' .. first_line) or '')

            if toolbar_mode_button(
                fit_text(label, width - scaled(24)) .. '##ItemVersion' .. version,
                version == id, width - scaled(8)
            ) then
                store.Select(entry, version)
            end
        end

        if ImGuiStyleVar_ButtonTextAlign ~= nil then
            imgui.PopStyleVar()
        end
    end

    -- The monsters that drop it (the Vana'dex data): a click opens its sheet.
    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()
    imgui.TextColored(colors.text, tx('Dropped by'))

    local droppers = store.DroppedBy(id)

    if #droppers == 0 then
        imgui.TextColored(colors.text_dim, tx('No monster of the Vana\'dex drops it in the data.'))
    else
        local percent_col = 0

        for _, dropper in ipairs(droppers) do
            percent_col = math.max(
                percent_col, (imgui.CalcTextSize(controller.monsters.PercentLabel(dropper.percent)))
            )
        end

        if ImGuiStyleVar_ButtonTextAlign ~= nil then
            imgui.PushStyleVar(ImGuiStyleVar_ButtonTextAlign, { 0, 0.5 })
        end

        local base = imgui.GetCursorPosX()

        for index, dropper in ipairs(droppers) do
            if index > 40 then
                imgui.TextColored(
                    colors.text_dim, string.format(tx('and %d more'), #droppers - 40)
                )

                break
            end

            local percent = controller.monsters.PercentLabel(dropper.percent)

            imgui.SetCursorPosX(base + percent_col - (imgui.CalcTextSize(percent)))
            imgui.TextColored(colors.text_dim, percent)
            imgui.SameLine(0, 0)
            imgui.SetCursorPosX(base + percent_col + scaled(10))

            if toolbar_mode_button(
                fit_text(dropper.name, width - percent_col - scaled(40))
                    .. '##ItemDrop' .. index,
                false, width - percent_col - scaled(24)
            ) then
                controller.monsters.Show(dropper.name)
            end
        end

        if ImGuiStyleVar_ButtonTextAlign ~= nil then
            imgui.PopStyleVar()
        end
    end
end

function sheetx.items_draw()
    local store = controller and controller.items

    if store == nil
        or not store.GetOpen()
        or not can_draw_ui()
        or imgui.InputText == nil then

        if sheetx.items_was_open and store ~= nil then
            -- Closed: the size is written now.
            store.Flush()
        end

        sheetx.items_was_open = false

        return
    end

    store.Tick()

    if not sheetx.items_was_open then
        sheetx.items_was_open = true

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        local saved = store.GetSize()
        local win_w, win_h = sheetx.fit_screen(
            saved and saved.w or scaled(960),
            saved and saved.h or scaled(860)
        )

        imgui.SetNextWindowSize({ win_w, win_h })

        imgui.SetNextWindowPos({
            ((journal and journal.visible and journal.x) or 40) + 90,
            ((journal and journal.visible and journal.y) or 40) + 90,
        })
    end

    if imgui.SetNextWindowSizeConstraints then
        imgui.SetNextWindowSizeConstraints(
            { scaled(520), scaled(320) },
            { scaled(1800), scaled(2400) }
        )
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    imgui.PushStyleColor(ImGuiCol_ResizeGrip, { 0.80, 0.84, 0.95, 0.30 })
    imgui.PushStyleColor(ImGuiCol_ResizeGripHovered, { 0.80, 0.84, 0.95, 0.60 })
    imgui.PushStyleColor(ImGuiCol_ResizeGripActive, { 0.80, 0.84, 0.95, 0.90 })

    scalex.before('items')

    if imgui.Begin(
        tx('Item catalog (BETA)') .. '###JournalItems',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
    ) then
        scalex.after('items')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        store.SetSize(width, height)

        draw_window_panel(draw, x, y, width, height, true)

        local title_y = imgui.GetCursorPosY()

        sheetx.close_row(open)
        imgui.SetCursorPosY(title_y)

        local start_x = imgui.GetCursorPosX()

        sheetx.monsters_title(width, tx('Item catalog (BETA)'))
        imgui.Spacing()
        imgui.SetCursorPosX(start_x)

        if not store.Ready() then
            imgui.TextWrapped(
                string.format(tx('The item data is not available: %s'), tostring(store.Error()))
            )
        else
            local list_w = math.floor(math.max(scaled(250), width * 0.34))

            -- Search.
            imgui.PushItemWidth(list_w)
            imgui.InputText('##ItemsSearch', sheetx.items_query, 64)
            imgui.PopItemWidth()

            if (sheetx.items_query[1] or '') == '' then
                imgui.SameLine(0, 12)
                imgui.TextColored(colors.text_dim, tx('Type a name or an id to search'))
            end

            -- Group and category.
            local groups = store.Groups()
            local half = math.floor((list_w - 8) / 2)
            local favorites_group = store.FavoritesGroup()
            local group_options = {
                { 0, tx('All groups') },
                { favorites_group, tx('Favorites') },
            }

            for index, name in ipairs(groups) do
                group_options[#group_options + 1] = { index, tx(name) }
            end

            local group_label = tx('All groups')

            if sheetx.items_group == favorites_group then
                group_label = tx('Favorites')
            elseif sheetx.items_group ~= 0 then
                group_label = tx(groups[sheetx.items_group] or '')
            end

            local picked = sheetx.items_combo(
                'ItemsGroup', half, group_label,
                group_options, sheetx.items_group
            )

            if picked ~= nil and picked ~= sheetx.items_group then
                sheetx.items_group = picked
                sheetx.items_sub = 0
            end

            imgui.SameLine(0, 8)

            if sheetx.items_group == favorites_group then
                imgui.TextColored(colors.text_dim, string.format(tx('%d favorites'), store.FavoriteCount()))
            elseif sheetx.items_group ~= 0 then
                local subs = store.Subs(sheetx.items_group)
                local sub_options = { { 0, tx('All categories') } }
                local sub_label = tx('All categories')

                for _, sub in ipairs(subs) do
                    sub_options[#sub_options + 1] = { sub.index, tx(sub.label) }

                    if sub.index == sheetx.items_sub then
                        sub_label = tx(sub.label)
                    end
                end

                local sub_picked = sheetx.items_combo(
                    'ItemsSub', half, sub_label, sub_options, sheetx.items_sub
                )

                if sub_picked ~= nil then
                    sheetx.items_sub = sub_picked
                end
            else
                imgui.TextColored(colors.text_dim, tx('Pick a group to see its categories'))
            end

            local list = store.Filter(
                sheetx.items_query[1] or '', sheetx.items_group, sheetx.items_sub
            )

            -- A new search or filter: the list goes back to the top.
            local sig = tostring(sheetx.items_query[1]) .. '|' .. sheetx.items_group
                .. '|' .. sheetx.items_sub

            if sig ~= sheetx.items_last_sig then
                sheetx.items_last_sig = sig
                sheetx.items_scroll_top = true
            end

            imgui.TextColored(
                colors.text_dim, string.format(tx('%d items'), #list)
            )

            imgui.Spacing()

            imgui.PushStyleColor(ImGuiCol_ChildBg, transparent)

            if imgui.BeginChild('##ItemsList', { list_w, -1 }, child_border) then
                sheetx.items_list(store, list, list_w)
            end

            imgui.EndChild()

            imgui.SameLine(0, 8)

            if imgui.BeginChild('##ItemsSheet', { -1, -1 }, child_border) then
                local sheet_w = width - list_w - scaled(40)

                if imgui.GetContentRegionAvail ~= nil then
                    local ok, avail = pcall(imgui.GetContentRegionAvail)

                    if ok and type(avail) == 'number' and avail > 0 then
                        sheet_w = math.floor(avail) - scaled(20)
                    end
                end

                sheetx.items_sheet(store, sheet_w)
            end

            imgui.EndChild()

            imgui.PopStyleColor()
        end
    end

    imgui.End()

    imgui.PopStyleColor(3)

    if not open[1] then
        store.SetOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

function sheetx.monsters_draw()
    local store = controller and controller.monsters

    if store == nil
        or not store.GetOpen()
        or not can_draw_ui()
        or imgui.InputText == nil then

        if sheetx.monsters_was_open then
            -- Closed: the size and the favorites are written now.
            if store ~= nil then
                store.Flush()
            end
        end

        sheetx.monsters_was_open = false

        return
    end

    store.Tick()

    if not sheetx.monsters_was_open then
        sheetx.monsters_was_open = true
        -- Read again: the zone names may not have been there before.
        sheetx.monsters_zones = nil

        local journal =
            controller.GetJournalWindowState
            and controller.GetJournalWindowState()

        -- The size it had the last time, without going over the screen.
        local saved = store.GetSize()
        local win_w, win_h = sheetx.fit_screen(
            saved and saved.w or scaled(980),
            saved and saved.h or scaled(900)
        )

        imgui.SetNextWindowSize({ win_w, win_h })

        imgui.SetNextWindowPos({
            ((journal and journal.visible and journal.x) or 40) + 70,
            ((journal and journal.visible and journal.y) or 40) + 70,
        })
    end

    -- The player can drag the corner to resize it.
    if imgui.SetNextWindowSizeConstraints then
        imgui.SetNextWindowSizeConstraints(
            { scaled(520), scaled(320) },
            { scaled(1800), scaled(2400) }
        )
    end

    push_theme()

    local font_pushed = journal_font ~= nil

    if font_pushed then
        imgui.PushFont(journal_font, journal_font_size)
    end

    local open = { true }

    imgui.PushStyleColor(ImGuiCol_ResizeGrip, { 0.80, 0.84, 0.95, 0.30 })
    imgui.PushStyleColor(ImGuiCol_ResizeGripHovered, { 0.80, 0.84, 0.95, 0.60 })
    imgui.PushStyleColor(ImGuiCol_ResizeGripActive, { 0.80, 0.84, 0.95, 0.90 })

    scalex.before('monsters')

    if imgui.Begin(
        tx("Vana'dex (BETA)") .. '###JournalMonsters',
        open,
        ImGuiWindowFlags_NoSavedSettings
            + ImGuiWindowFlags_NoCollapse
            + ImGuiWindowFlags_NoTitleBar
    ) then
        scalex.after('monsters')

        local draw = imgui.GetWindowDrawList()
        local x, y = imgui.GetWindowPos()
        local width, height = imgui.GetWindowSize()

        -- Remembered (the file is written a moment after the last change).
        store.SetSize(width, height)

        draw_window_panel(draw, x, y, width, height, true)

        -- The X is at the right; the title goes on the same line.
        local title_y = imgui.GetCursorPosY()

        sheetx.close_row(open)
        imgui.SetCursorPosY(title_y)

        local start_x = imgui.GetCursorPosX()
        local title_w = sheetx.monsters_title(width)

        imgui.Spacing()

        -- The rank, at the top right, and under it the defeated total.
        local done, total = store.DefeatedTotals()

        sheetx.monsters_totals = {
            text = tx('Defeated %d / %d'):format(done, total),
            color = done >= total and total > 0 and colors.leaf or colors.text,
        }
        sheetx.monsters_totals_drawn = false

        local after_y = sheetx.monsters_rank_widget(
            width, title_y, title_w or 0, imgui.GetCursorPosY()
        )

        imgui.SetCursorPosX(start_x)
        imgui.SetCursorPosY(after_y)

        -- Two columns: one list (the places with their monsters) and the sheet.
        local list_w = math.floor(math.max(scaled(230), width * 0.30))
        local toolbar_w = list_w

        -- The order of the list: by name or by level.
        local by_level = store.GetSort() == 'level'
        local sort_label = by_level and tx('Sort: Level') or tx('Sort: Name')
        local sort_w = (imgui.CalcTextSize(sort_label)) + scaled(28)

        imgui.PushItemWidth(math.max(scaled(80), toolbar_w - sort_w - 8))
        imgui.InputText('##MonstersFilter', sheetx.monsters_filter, 64)
        imgui.PopItemWidth()

        imgui.SameLine(0, 8)

        if imgui.Button(sort_label .. '##MonstersSort', { sort_w, ui_button_height }) then
            store.ToggleSort()
        end

        if imgui.IsItemHovered() and imgui.SetTooltip then
            imgui.SetTooltip(tx('Sort the monsters by name or by level'))
        end

        if (sheetx.monsters_filter[1] or '') == '' then
            imgui.SameLine(0, 12)
            imgui.TextColored(colors.text_dim, tx('Type a name to search'))
        end

        -- The progress and the filter of the ones not defeated yet.
        local pending_on = store.GetOnlyPending()
        local pending_label = pending_on and tx('Show: Pending') or tx('Show: All')
        local pending_w = (imgui.CalcTextSize(pending_label)) + scaled(28)

        -- Without the rank box the total stays here.
        if not sheetx.monsters_totals_drawn then
            imgui.TextColored(sheetx.monsters_totals.color, sheetx.monsters_totals.text)
            imgui.SameLine(0, 12)
        end

        if imgui.Button(pending_label .. '##MonstersPending', { pending_w, ui_button_height }) then
            store.ToggleOnlyPending()
        end

        if imgui.IsItemHovered() and imgui.SetTooltip then
            imgui.SetTooltip(tx('Show all the monsters or only the ones you have not defeated yet'))
        end

        -- Filters: notorious, aggressive, close to your level.
        local mine = store.PlayerLevel()
        local gap = 6
        local filter_w = math.floor((toolbar_w - gap * 2) / 3)

        for position, filter in ipairs({
            { 'notorious', 'Notorious',
                'Only the notorious monsters' },
            { 'aggro', 'Aggro',
                'Only the aggressive monsters' },
            { 'level', 'Level +/-5',
                mine ~= nil
                    and string.format(
                        tx('Only the monsters close to your level (%d): from %d to %d'),
                        mine, math.max(1, mine - store.LEVEL_RANGE),
                        mine + store.LEVEL_RANGE
                    )
                    or tx('Your level is not known yet') },
        }) do
            if position > 1 then
                imgui.SameLine(0, gap)
            end

            if toolbar_mode_button(
                fit_text(tx(filter[2]), filter_w - scaled(24))
                    .. '##MonstersFilter_' .. filter[1],
                store.GetFilter(filter[1]),
                filter_w
            ) then
                store.ToggleFilter(filter[1])
            end

            if imgui.IsItemHovered() and imgui.SetTooltip then
                imgui.SetTooltip(
                    filter[1] == 'level' and filter[3] or tx(filter[3])
                )
            end
        end

        imgui.Spacing()

        imgui.PushStyleColor(ImGuiCol_ChildBg, transparent)

        local ctx = sheetx.monsters_context(store)

        -- The list: regions, zones and the monsters of the open place.
        if imgui.BeginChild('##MonstersList', { list_w, -1 }, child_border) then
            sheetx.monsters_tree(store, ctx, list_w)
        end

        imgui.EndChild()

        imgui.SameLine(0, 8)

        -- The sheet.
        if imgui.BeginChild('##MonsterSheet', { -1, -1 }, child_border) then
            local sheet_w = width - list_w - scaled(40)

            if imgui.GetContentRegionAvail ~= nil then
                local ok, avail = pcall(imgui.GetContentRegionAvail)

                if ok and type(avail) == 'number' and avail > 0 then
                    sheet_w = math.floor(avail) - scaled(20)
                end
            end

            if sheetx.monsters_rank_open then
                sheetx.monsters_rank_page(sheet_w)
            else
                sheetx.monsters_sheet(store, sheet_w)
            end
        end

        imgui.EndChild()

        imgui.PopStyleColor()
    end

    imgui.End()

    imgui.PopStyleColor(3)

    if not open[1] then
        store.SetOpen(false)
    end

    if font_pushed then
        imgui.PopFont()
    end

    pop_theme()
end

function M.Draw()
    -- Set again by the note box of this frame, if it has the keyboard.
    note_input_active = false

    apply_text_scale()
    update_game_ui_visibility()
    update_controller_repeat()
    update_keyboard_repeat()
    sync_journal_mini()

    draw_journal()
    draw_sheet_window()
    draw_progress_window()
    draw_active_window()
    draw_compass_window()
    draw_settings_window()
    draw_guide_window()
    draw_camps_window()
    fame_ui.draw()
    notesx.draw()
    sheetx.zones_draw()
    sheetx.monsters_draw()
    sheetx.items_draw()
    sheetx.chat_draw()
    sheetx.private_draw()
    draw_journal_mini()
    draw_journal_help()
end

ashita.events.register(
    'load',
    'journal_ui_load',
    function()
        initialize_game_visibility()
        load_journal_mini_texture()

        journal_font =
            imgui.AddFontFromFileTTF(
                addon.path
                    .. 'assets/fonts/CarroisGothicSC-Regular.ttf',
                30
            )

        -- Fira Sans for the step text. If a file cannot be loaded that
        -- style falls back (bold is faked, italics are tinted).
        local function load_text_font(file)
            local ok, font = pcall(
                imgui.AddFontFromFileTTF,
                addon.path .. 'assets/fonts/' .. file,
                30
            )

            if ok then
                return font
            end

            return nil
        end

        text_font = load_text_font('FiraSans-Regular.ttf')

        -- Fantasy letters for the banner of the zone name: Hexenkotel, and
        -- Uncial Antiqua when that file is missing. banner_profile is where
        -- the color bands of the letters go (see zonebanner.lua).
        sheetx.banner_font = load_text_font('Hexenkotel.ttf')
        sheetx.banner_profile = { top = 0.19, span = 0.62 }

        if sheetx.banner_font == nil then
            sheetx.banner_font = load_text_font('UncialAntiqua-Regular.ttf')
            sheetx.banner_profile = { top = 0.07, span = 0.68 }
        end

        -- The titles of the alerts (New Quest!, Quest Completed...).
        sheetx.alert_font = load_text_font('KensingtonParlor.ttf')

        text_bold_font = load_text_font('FiraSans-Bold.ttf')
        text_italic_font = load_text_font('FiraSans-Italic.ttf')

        richtext.set_fonts({
            regular = text_font,
            bold = text_bold_font,
            italic = text_italic_font,
        })
    end
)

ashita.events.register(
    'unload',
    'journal_ui_unload',
    function()
        reset_repeat()
        list_last_selection = {}

        for _, cover in pairs(
            journal_cover_cache
        ) do
            if cover ~= nil
                and cover ~= false then

                cover.ptr = nil
            end
        end

        for _, logo in pairs(journal_logo_cache) do
            if logo ~= nil and logo ~= false then
                logo.ptr = nil
            end
        end

        journal_logo_cache = {}
        journal_mini_texture = nil
        journal_cover_cache = {}

        journal_font = nil
        sheetx.banner_font = nil
        sheetx.banner_profile = nil
        sheetx.alert_font = nil
        text_font = nil
        text_bold_font = nil
        text_italic_font = nil
        richtext.set_fonts({})

        pGameMenu = 0
        pEventSystem = 0
        pInterfaceHidden = 0

        game_visibility_initialized =
            false

        game_ui_visible =
            false

        visibility_cache_time =
            0
    end
)

M.CanDrawUI = can_draw_ui

-- The title font of the Journal (nil until it is loaded).
function M.GetTitleFont()
    return journal_font
end

-- The font of the banner of the zone name: the one of the titles of the
-- alerts (Kensington Parlor), then Hexenkotel / Uncial Antiqua when that file
-- is missing (nil when none is there).
function M.GetBannerFont()
    return sheetx.alert_font or sheetx.banner_font
end

-- The font of the titles of the alerts (nil when its file is missing).
function M.GetAlertFont()
    return sheetx.alert_font
end

-- Where the color bands of its letters go: { top =, span = }.
function M.GetBannerProfile()
    return sheetx.banner_profile
end

return M
