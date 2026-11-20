-- SPDX-License-Identifier: GPL-3.0-only
-- The 3D view of a monster in the sheet of Vana'dex (BETA).
--
-- The viewer itself (reading the DAT, the skeleton, the texture and the
-- Direct3D8 drawing) is the code of VanaViewer, in the folder viewer/, which
-- is a port of vekien/xi-model-viewer (GPL-3.0). This file only connects it:
-- which DAT a monster has (data/monster_dats.lua), when to load and draw it,
-- and the panel in the sheet.
--
-- The DAT files are the ones of the game. data/monster_dats.lua says which
-- one each monster has, as a path under the folder of the DAT files (the
-- folder is set with /journal dat <folder>; without it, the folder "models"
-- of the addon). A monster with no DAT in that list shows no 3D panel.
--
-- The panel is off until the player turns it on (it is experimental and it
-- draws with Direct3D). Nothing of the viewer is loaded before that.

local ffi = require('ffi')
local imgui = require('imgui')
local i18n = require('i18n')
local store = require('monsters')

local M = {}

local tx = i18n.t

local SETTINGS_FILE = 'view_settings.lua'
local GRACE = 30          -- seconds without the panel before the model is freed
local FRAME_STEP = 1 / 30 -- the model is drawn at most this often
local MAX_SIZE = 340      -- the biggest side of the picture (before scaling)

-- The turn of the model that shows it from the front (pi/2 shows its back).
local FRONT_YAW = -math.pi / 2

local S = {
    enabled = true,      -- open by default; the player can hide it
    root = nil,
    settings_read = false,

    requested = nil,      -- the DAT (as the list gives it) the panel wants
    loaded = nil,         -- the DAT the renderer has
    pending = nil,        -- full path waiting to be loaded
    failed = {},          -- [DAT] = the error of its last load

    renderer = nil,
    model = nil,
    err = nil,

    clip = 0,
    frame = 0,
    play = { true },
    wire = { false },
    zoom = { 1 },
    bg = { 23 / 255, 30 / 255, 41 / 255 },
    transparent = { true },   -- the background is see-through (the default)
    yaw = FRONT_YAW,
    pitch = 0.15,
    pan = { 0, 0 },      -- the model moved on the picture, in pixels of the texture
    panning = false,     -- the right button is moving it

    last = 0,
    last_draw = 0,
    last_sig = nil,
    draw_ok = true,
    seen = -1000,
    rect = nil,
    rect_time = -1000,
}

-- The modules of the viewer, loaded the first time they are needed.
local viewer = nil        -- { dat =, pose =, texture =, render = } or false
local viewer_error = nil

-- "C:\...\dat.lua:176: message" -> "message" (the place of an error is no help
-- to the player).
local function clean_error(err)
    return (tostring(err):gsub('^.-%.lua:%d+: ', ''))
end

local function addon_root()
    local path = addon ~= nil and addon.path or ''

    return (tostring(path):gsub('[/\\]+$', '')) .. '/'
end

local function ensure_viewer()
    if viewer ~= nil then
        return viewer ~= false
    end

    local ok, err = pcall(function()
        local function module(name)
            local loader = assert(loadfile(addon_root() .. 'viewer/' .. name .. '.lua'))

            return loader()
        end

        local loaded = {
            dat = module('dat'),
            pose = module('pose'),
            texture = module('texture'),
        }

        -- render.lua asks for "pose" and "texture" with require: they are
        -- ours only while it loads, so no other addon sees them.
        local old_pose, old_texture = package.loaded.pose, package.loaded.texture

        package.loaded.pose = loaded.pose
        package.loaded.texture = loaded.texture

        local rok, render = pcall(module, 'render')

        package.loaded.pose = old_pose
        package.loaded.texture = old_texture

        if not rok then
            error(render)
        end

        loaded.render = render
        viewer = loaded
    end)

    if not ok then
        viewer = false
        viewer_error = tostring(err)
    end

    return viewer ~= false
end

-- --------------------------------------------------------------- settings

local function load_settings()
    if S.settings_read then
        return
    end

    S.settings_read = true

    local data = store.ReadData(SETTINGS_FILE)

    if type(data) == 'table' then
        if data.enabled ~= nil then
            S.enabled = data.enabled == true
        end

        if data.transparent ~= nil then
            S.transparent[1] = data.transparent == true
        end

        if type(data.bg) == 'table' then
            for i = 1, 3 do
                local v = tonumber(data.bg[i])

                if v ~= nil then
                    S.bg[i] = math.max(0, math.min(1, v))
                end
            end
        end

        if type(data.root) == 'string' and data.root ~= '' then
            S.root = data.root
        end
    end
end

local function save_settings()
    local parts = { 'return {\n', '  enabled = ', tostring(S.enabled), ',\n' }

    if S.root ~= nil then
        parts[#parts + 1] = string.format('  root = %q,\n', S.root)
    end

    parts[#parts + 1] = string.format(
        '  bg = { %.4f, %.4f, %.4f },\n', S.bg[1], S.bg[2], S.bg[3]
    )
    parts[#parts + 1] = '  transparent = ' .. tostring(S.transparent[1] == true) .. ',\n'
    parts[#parts + 1] = '}\n'
    store.WriteData(SETTINGS_FILE, table.concat(parts))
end

-- The folder with the DAT files ("" or nil: the folder "models" of the addon).
function M.GetRoot()
    load_settings()

    return S.root or (addon_root() .. 'models/')
end

function M.SetRoot(path)
    load_settings()

    path = tostring(path or ''):gsub('^%s*"?', ''):gsub('"?%s*$', '')

    S.root = path ~= '' and path or nil
    S.failed = {}
    S.requested = nil
    save_settings()
end

-- ------------------------------------------------------------------- DATs

local index = nil

-- The DAT of a monster (as data/monster_dats.lua writes it), or nil.
function M.DatFor(name)
    if index == nil then
        index = {}

        local ok, list = pcall(require, 'data.monster_dats')

        if ok and type(list) == 'table' then
            for monster, path in pairs(list) do
                if type(monster) == 'string' and type(path) == 'string'
                    and path ~= '' then

                    index[store.fold(monster)] = path
                end
            end
        end
    end

    return index[store.fold(name)]
end

local function full_path(rel)
    if rel:match('^%a:[/\\]') or rel:match('^[/\\][/\\]') then
        return rel
    end

    local root = M.GetRoot():gsub('[/\\]+$', '')

    return root .. '/' .. (rel:gsub('\\', '/'))
end

-- -------------------------------------------------------------- the model

local function dispose()
    if S.renderer ~= nil then
        pcall(S.renderer.dispose, S.renderer)
        S.renderer = nil
    end

    S.model = nil
    S.loaded = nil
    S.last_sig = nil
end

function M.Dispose()
    dispose()
end

-- The background as the 0xAARRGGBB color the renderer clears with.
local function bg_color()
    local function byte(v)
        return math.floor(math.max(0, math.min(1, v)) * 255 + 0.5)
    end

    -- Alpha 0: the texture keeps the see-through background.
    local alpha = S.transparent[1] and 0 or 0xff000000

    return alpha + byte(S.bg[1]) * 65536 + byte(S.bg[2]) * 256 + byte(S.bg[3])
end

local DEFAULT_BG = { 23 / 255, 30 / 255, 41 / 255 }

local function reset_view()
    S.yaw = FRONT_YAW
    S.pitch = 0.15
    S.zoom[1] = 1
    S.pan[1] = 0
    S.pan[2] = 0
end

-- Reads the DAT in S.pending and builds its renderer (one failure is kept
-- and told in the panel; it is not tried again until the player asks).
local function load_pending()
    local full, rel = S.pending, S.requested

    S.pending = nil
    S.err = nil

    if full == nil or rel == nil or not ensure_viewer() then
        return
    end

    local ok, model = pcall(viewer.dat.load, full)

    if not ok then
        S.failed[rel] = clean_error(model)
        S.err = S.failed[rel]

        return
    end

    local rok, renderer = pcall(viewer.render.new, model)

    if not rok then
        S.failed[rel] = clean_error(renderer)
        S.err = S.failed[rel]

        return
    end

    dispose()

    S.renderer = renderer
    S.model = model
    S.loaded = rel
    S.clip = 0
    S.frame = 0
    S.draw_ok = true
    S.last = os.clock()
    S.last_draw = 0
    reset_view()

    -- Starts with the idle animation when the DAT has one.
    for position, animation in ipairs(model.animations) do
        if animation.id == 'idl0' then
            S.clip = position

            break
        end
    end
end

-- Asks for the model of a DAT (the panel, every frame it is shown).
local function request(rel)
    S.seen = os.clock()

    if S.requested ~= rel then
        S.requested = rel
        S.err = S.failed[rel]
        S.pending = S.failed[rel] == nil and full_path(rel) or nil
    end
end

-- Called when the game ends a scene (d3d_endscene, back buffer): loads the
-- model asked for and draws it into its picture. It does nothing unless the
-- panel was shown a moment ago.
function M.Render()
    local ok, err = pcall(function()
        load_settings()

        local now = os.clock()

        if not S.enabled then
            if S.renderer ~= nil then
                dispose()
            end

            return
        end

        if S.renderer ~= nil and now - S.seen > GRACE then
            dispose()

            return
        end

        if now - S.seen > 1 then
            S.last = now

            return
        end

        if S.pending ~= nil then
            load_pending()
        end

        if S.renderer == nil or S.loaded ~= S.requested or not S.draw_ok then
            S.last = now

            return
        end

        local delta = math.max(0, math.min(now - S.last, 0.1))

        S.last = now

        local clip = S.clip > 0 and S.model.animations[S.clip] or nil

        if clip ~= nil and S.play[1] then
            S.frame = (S.frame + delta * 30) % clip.length
        end

        if now - S.last_draw < FRAME_STEP then
            return
        end

        -- A model that is not moving is not drawn again.
        local signature = string.format(
            '%d|%.2f|%.3f|%.3f|%.3f|%s|%d|%.0f|%.0f',
            S.clip, S.frame, S.yaw, S.pitch, S.zoom[1],
            S.wire[1] and 1 or 0, bg_color(), S.pan[1], S.pan[2]
        )

        if signature == S.last_sig and S.renderer.display ~= nil then
            return
        end

        S.last_draw = now

        local dok, result = pcall(
            S.renderer.draw, S.renderer,
            clip, S.frame, S.yaw, S.pitch, S.zoom[1], S.wire[1], bg_color(),
            S.pan[1], S.pan[2]
        )

        if dok then
            S.last_sig = signature
        else
            S.err = tostring(result)
            S.draw_ok = false
        end
    end)

    if not ok and not S.error_told then
        S.error_told = true
        S.err = tostring(err)
        print('[Journal] 3D: ' .. tostring(err))
    end
end

-- The mouse event of the game. It does nothing: ImGui already keeps the
-- clicks and the wheel that are over its windows from the game, and blocking
-- them here too can keep them from ImGui itself (the drag and the wheel of
-- the picture stopped working that way).
function M.OnMouse(e)
end

-- ------------------------------------------------------------------ panel

-- How far the mouse moved since the last frame while a button is held (0 left, 1 right)
-- (the drag is reset every time, so it is a step, not a total). The binding
-- may give the two numbers or a table, and may not take the threshold.
local function drag_delta(button)
    button = button or 0

    local ok, a, b = pcall(imgui.GetMouseDragDelta, button, 0)

    if not ok then
        ok, a, b = pcall(imgui.GetMouseDragDelta, button)
    end

    imgui.ResetMouseDragDelta(button)

    if not ok then
        return 0, 0
    end

    if type(a) == 'table' then
        return tonumber(a.x or a[1]) or 0, tonumber(a.y or a[2]) or 0
    end

    return tonumber(a) or 0, tonumber(b) or 0
end

-- A gear drawn with lines (the draw list has no circles here): a ring, eight
-- teeth and the hole.
local function draw_gear(draw, x, y, size, color)
    local cx, cy = x + size * 0.5, y + size * 0.5

    local function ring(radius, thickness)
        local steps = 24
        local previous

        for i = 0, steps do
            local angle = math.pi * 2 * i / steps
            local point = { cx + math.cos(angle) * radius, cy + math.sin(angle) * radius }

            if previous ~= nil then
                draw:AddLine(previous, point, color, thickness)
            end

            previous = point
        end
    end

    for i = 0, 7 do
        local angle = math.pi * 2 * i / 8
        local c, n = math.cos(angle), math.sin(angle)

        draw:AddLine(
            { cx + c * size * 0.30, cy + n * size * 0.30 },
            { cx + c * size * 0.43, cy + n * size * 0.43 },
            color, math.max(2, size * 0.17)
        )
    end

    ring(size * 0.27, math.max(1.5, size * 0.1))
    ring(size * 0.11, math.max(1.2, size * 0.07))
end

-- + and - make the model bigger or smaller.
local ZOOM_MIN, ZOOM_MAX = 0.2, 3

local function zoom_by(factor)
    S.zoom[1] = math.max(ZOOM_MIN, math.min(ZOOM_MAX, S.zoom[1] * factor))
end

-- The options of the model, in the window of the gear button: animation,
-- play, wireframe, zoom, the view and the background.
local function draw_options(rel, scale, dim)
    local toggle = S.enabled and tx('Hide 3D') or tx('Show 3D')

    if imgui.Button(toggle .. '##MonView3D', { (imgui.CalcTextSize(toggle)) + 28 * scale, 0 }) then
        S.enabled = not S.enabled
        save_settings()
    end

    if not S.enabled then
        return
    end

    imgui.Spacing()

    if S.loaded ~= rel or S.renderer == nil or S.model == nil then
        imgui.TextColored(dim, tx('Loading the model...'))

        return
    end

    local width = math.floor(190 * scale)
    local label = S.clip == 0 and tx('Idle pose')
        or S.model.animations[S.clip].id

    imgui.PushItemWidth(width)

    if imgui.BeginCombo('##MonView3DAnim', label) then
        if imgui.Selectable(tx('Idle pose'), S.clip == 0) then
            S.clip = 0
            S.frame = 0
        end

        for position, animation in ipairs(S.model.animations) do
            if imgui.Selectable(animation.id, S.clip == position) then
                S.clip = position
                S.frame = 0
            end
        end

        imgui.EndCombo()
    end

    imgui.PopItemWidth()
    imgui.Checkbox(tx('Play') .. '##MonView3DPlay', S.play)
    imgui.SameLine(0, 12)
    imgui.Checkbox(tx('Wireframe') .. '##MonView3DWire', S.wire)

    imgui.PushItemWidth(width)
    imgui.SliderFloat('##MonView3DZoom', S.zoom, 0.2, 3, tx('Zoom') .. ' %.2fx')
    imgui.PopItemWidth()

    if imgui.Button(tx('Reset view') .. '##MonView3DReset') then
        reset_view()
    end

    if imgui.Checkbox(tx('Transparent background') .. '##MonView3DTransparent', S.transparent) then
        save_settings()
    end

    imgui.PushItemWidth(width)

    if imgui.ColorEdit3(tx('Background') .. '##MonView3DBg', S.bg) then
        S.bg_dirty = true
    end

    -- Saved when the mouse is released, not at every step of a drag.
    if S.bg_dirty and not imgui.IsMouseDown(0) then
        S.bg_dirty = false
        save_settings()
    end

    imgui.PopItemWidth()

    if imgui.Button(tx('Default') .. '##MonView3DBgReset') then
        for i = 1, 3 do
            S.bg[i] = DEFAULT_BG[i]
        end

        save_settings()
    end
end

-- The 3D panel of the sheet of a monster. opts = { scale =, dim =, accent =,
-- button_h = } from the Journal (sizes and colors of its theme). It draws
-- nothing when the monster has no DAT in the list.
function M.DrawPanel(name, width, opts)
    local rel = M.DatFor(name)

    if rel == nil then
        return
    end

    load_settings()

    opts = opts or {}

    local scale = opts.scale or 1
    local dim = opts.dim or { 0.62, 0.64, 0.72, 1 }
    local accent = opts.accent or { 1, 0.85, 0.4, 1 }
    local button_h = opts.button_h or 24

    imgui.Spacing()
    imgui.TextColored(accent, tx('3D model (BETA)'))
    imgui.SameLine(0, 12)

    -- The gear opens the options (and the switch that hides the model).
    if imgui.Button('##MonView3DOptions', { button_h, button_h }) then
        imgui.OpenPopup('##MonView3DOptionsPopup')
    end

    if imgui.GetItemRectMin ~= nil and imgui.GetWindowDrawList ~= nil then
        local gx, gy = imgui.GetItemRectMin()
        local pad = button_h * 0.12

        draw_gear(
            imgui.GetWindowDrawList(), gx + pad, gy + pad, button_h - pad * 2,
            imgui.GetColorU32(accent)
        )
    end

    if imgui.IsItemHovered() and imgui.SetTooltip then
        imgui.SetTooltip(tx('Options'))
    end

    -- + and - zoom the model (the wheel is left to the scroll of the sheet).
    if S.enabled then
        imgui.SameLine(0, 4)

        if imgui.Button('+##MonView3DZoomIn', { button_h, button_h }) then
            zoom_by(1.2)
        end

        imgui.SameLine(0, 4)

        if imgui.Button('-##MonView3DZoomOut', { button_h, button_h }) then
            zoom_by(1 / 1.2)
        end
    end

    if imgui.BeginPopup('##MonView3DOptionsPopup') then
        draw_options(rel, scale, dim)
        imgui.EndPopup()
    end

    if not S.enabled then
        return
    end

    if not ensure_viewer() then
        imgui.TextWrapped(string.format(
            tx('The 3D viewer is not available: %s'), tostring(viewer_error)
        ))

        return
    end

    request(rel)

    if S.err ~= nil then
        imgui.TextWrapped(string.format(tx('Could not show the model: %s'), S.err))
        imgui.TextColored(dim, string.format(tx('DAT file: %s'), full_path(rel)))
        imgui.TextWrapped(
            tx('The folder with the game DAT files is set with /journal dat <folder>.')
        )

        if imgui.Button(tx('Retry') .. '##MonView3DRetry') then
            S.failed[rel] = nil
            S.err = nil
            S.draw_ok = true
            S.last_sig = nil
            S.requested = nil
        end

        return
    end

    if S.loaded ~= rel or S.renderer == nil then
        imgui.TextColored(dim, tx('Loading the model...'))

        return
    end

    -- The picture and its mouse: drag to turn, right-drag to move. opts.side
    -- (a function) draws the data of the monster at its right.
    local side_w = opts.side ~= nil and (opts.side_w or 220 * scale) or 0

    -- Too narrow for a picture of a decent size next to the data: no side.
    if width - side_w - 12 * scale < 160 * scale then
        side_w = 0
    end

    local side = math.max(64, math.min(width - side_w - 12 * scale, MAX_SIZE * scale))
    local side_drawn = false

    if S.renderer.display ~= nil then
        -- With data at the right, the picture is a group: the data goes next
        -- to the group, so it can not overlap the picture.
        local grouped = opts.side ~= nil and side_w > 0
            and imgui.BeginGroup ~= nil and imgui.EndGroup ~= nil

        if grouped then
            imgui.BeginGroup()
        end

        local x, y = imgui.GetCursorScreenPos()

        S.rect = { x, y, x + side, y + side }
        S.rect_time = os.clock()

        imgui.Image(tonumber(ffi.cast('uintptr_t', S.renderer.display)), { side, side })

        -- A button over the picture takes the mouse: without it a click on
        -- an image drags the whole window instead (and the picture is no
        -- longer "hovered" while it moves).
        if imgui.SetCursorScreenPos ~= nil and imgui.InvisibleButton ~= nil then
            imgui.SetCursorScreenPos({ x, y })
            imgui.InvisibleButton('##MonView3DPick', { side, side })
        end

        local hovered = imgui.IsItemHovered()

        if imgui.IsItemActive ~= nil and imgui.IsItemActive() then
            local dx, dy = drag_delta()

            if dx ~= 0 or dy ~= 0 then
                S.yaw = S.yaw + dx * 0.01
                S.pitch = math.max(-1.5, math.min(1.5, S.pitch + dy * 0.01))
            end
        elseif hovered and imgui.IsMouseDragging(0) then
            local dx, dy = drag_delta()

            S.yaw = S.yaw + dx * 0.01
            S.pitch = math.max(-1.5, math.min(1.5, S.pitch + dy * 0.01))
        end

        -- The right button moves the model on the picture. It starts over the
        -- picture and goes on until the button is released.
        if imgui.IsMouseDown(1) then
            if not S.panning and hovered and imgui.IsMouseClicked(1) then
                S.panning = true
                imgui.ResetMouseDragDelta(1)
            end

            if S.panning then
                local dx, dy = drag_delta(1)
                local ratio = (S.renderer.size or side) / side
                local limit = (S.renderer.size or side) * 1.0

                S.pan[1] = math.max(-limit, math.min(limit, S.pan[1] + dx * ratio))
                S.pan[2] = math.max(-limit, math.min(limit, S.pan[2] + dy * ratio))
            end
        else
            S.panning = false
        end

        if grouped then
            imgui.EndGroup()
            imgui.SameLine(0, 12 * scale)
            imgui.BeginGroup()
            opts.side(width - side - 12 * scale)
            imgui.EndGroup()
            side_drawn = true
        end
    else
        imgui.TextColored(dim, tx('Waiting for the next 3D frame...'))
    end

    return side_drawn
end

-- The state itself, for the tests.
M._state = S

-- The state, for /journal dat.
function M.Status()
    load_settings()

    return {
        enabled = S.enabled,
        root = M.GetRoot(),
        loaded = S.loaded,
        error = S.err,
    }
end

return M
