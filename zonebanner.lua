-- Banner with the name of the zone the player enters.
--
-- A few seconds after the player arrives in a zone, the name of the zone
-- fades in near the top of the screen, big, in one color, with a thin line
-- under it; below it, smaller, the region of the zone
-- (data/zone_regions.lua). It stays a moment and fades out. It takes no
-- clicks and has no background.
--
-- The zone is read from the controller (GetCurrentZoneId) and the name from
-- the game resources (GetCompassZoneName). The letters use a fantasy font
-- (Hexenkotel, then Uncial Antiqua, in assets/fonts; see ui.lua); the title
-- font of the Journal is the last fallback and the official Final Fantasy
-- typeface is not used. Their size and color are set in Settings.
--
-- While the banner is on its way (IsBusy) the alerts of announce.lua wait, so
-- that the name of the zone and the alert of the quests of the zone do not
-- mix: the alert comes after.
--
-- Not shown for a zone without a name. It also shows when the addon is
-- loaded in a zone (a reload or a login).

local imgui = require('imgui')

local M = {}

-- Seconds
local DELAY = 2.0 -- after the zone is detected (the loading screen)
local FADE_IN = 0.9
local HOLD = 2.8
local FADE_OUT = 1.3
local GAP = 1.0 -- the zone id is missing at least this long: a new entry

-- Sizes for a 1080 pixels high screen
local TITLE_SIZE = 58
local SUB_SIZE = 22
local TOP = 0.25

local LINE = { 0.28, 0.50, 1.00 } -- the thin line under the name
local LETTERS = { 0.93, 0.81, 0.50 }

local SUBTITLE = { 0.78, 0.87, 1.00 }

local last_zone = nil
local missing_since = nil
local current = nil

local function now()
    if imgui.GetTime ~= nil then
        local ok, value = pcall(imgui.GetTime)

        if ok and type(value) == 'number' then
            return value
        end
    end

    return os.clock()
end

local function ease_out(t)
    t = math.min(1, math.max(0, t))

    return 1 - (1 - t) ^ 3
end

local function screen_size()
    if imgui.GetIO ~= nil then
        local ok, io = pcall(imgui.GetIO)

        if ok and io ~= nil then
            local got, w, h = pcall(function()
                local size = io.DisplaySize

                return size.x or size[1], size.y or size[2]
            end)

            if got and type(w) == 'number' and type(h) == 'number'
                and w > 0 and h > 0 then

                return w, h
            end
        end
    end

    return 1920, 1080
end

local function measure(font, size, text)
    local width = 0

    if font ~= nil then
        imgui.PushFont(font, size)
        width = (imgui.CalcTextSize(text))
        imgui.PopFont()
    else
        width = (imgui.CalcTextSize(text)) * size / 16
    end

    return width
end

local function put(draw, font, size, x, y, color, text)
    if font ~= nil then
        draw:AddText(font, size, { x, y }, color, text)
    else
        draw:AddText({ x, y }, color, text)
    end
end

local function rgba(color, alpha)
    return imgui.GetColorU32({ color[1], color[2], color[3], alpha })
end

-- The letters in one color. A color of the palette of the alerts, when one is
-- chosen, replaces the default gold.
local function plain_text(draw, font, size, x, y, text, color, alpha)
    put(draw, font, size, x, y, rgba(color, alpha), text)
end

-- A thin line that fades at both ends.
local function fade_line(draw, x0, x1, y, alpha, thickness, line_color)
    local steps = 24

    for i = 0, steps - 1 do
        local a = i / steps
        local b = (i + 1) / steps
        local mid = (a + b) * 0.5
        local fade = math.sin(math.pi * mid)

        draw:AddLine(
            { x0 + (x1 - x0) * a, y },
            { x0 + (x1 - x0) * b, y },
            rgba(line_color or LINE, 0.85 * fade * alpha),
            thickness
        )
    end
end

-- Looks at the zone of the player and starts the banner on an arrival.
local function watch(controller, at)
    local zone = controller.GetCurrentZoneId()

    if zone == nil then
        missing_since = missing_since or at

        return
    end

    local gap = missing_since ~= nil and at - missing_since or 0

    missing_since = nil

    if zone == last_zone and gap < GAP then
        return
    end

    last_zone = zone
    current = nil

    local name = controller.GetCompassZoneName
        and controller.GetCompassZoneName(zone)

    if type(name) ~= 'string' or name == '' or name == '???' then
        return
    end

    local region = controller.zonelist
        and controller.zonelist.RegionOf
        and controller.zonelist.RegionOf(zone)

    current = { name = name, region = region, start = at + DELAY }
end

-- true from the arrival in a zone until its banner is gone: the alerts wait.
function M.IsBusy()
    return current ~= nil
end

-- (profile is not used any more: it was for the bands of the old texture.)
function M.Draw(controller, can_draw, title_font, profile)
    local style = controller and controller.GetAlertStyle
        and controller.GetAlertStyle('zone') or nil
    local palette = controller and controller.GetAlertPalette
        and controller.GetAlertPalette() or nil
    local chosen = style and palette and style.color and style.color > 0
        and palette[style.color] or nil
    local letters = chosen or LETTERS
    local zoom = style and tonumber(style.size) or 1

    if controller == nil or controller.GetCurrentZoneId == nil then
        return
    end

    local at = now()

    watch(controller, at)

    if current == nil then
        return
    end

    local t = at - current.start

    if t < 0 then
        return
    end

    if t >= FADE_IN + HOLD + FADE_OUT then
        current = nil

        return
    end

    if can_draw ~= nil and not can_draw() then
        return
    end

    local alpha = ease_out(t / FADE_IN)

    if t > FADE_IN + HOLD then
        alpha = 1 - (t - FADE_IN - HOLD) / FADE_OUT
    end

    local screen_w, screen_h = screen_size()
    local scale = math.max(0.75, math.min(1.6, screen_h / 1080))
    local size = TITLE_SIZE * scale * zoom
    local font = title_font

    if font == nil then
        font = (require('richtext').fonts or {}).bold
    end

    local title_w = measure(font, size, current.name)
    local limit = screen_w * 0.8

    if title_w > limit then
        size = size * limit / title_w
        title_w = limit
    end

    local sub_size = SUB_SIZE * scale * zoom
    local sub_w = current.region and measure(font, sub_size, current.region) or 0
    local pad = 24 * scale
    local width = math.max(title_w, sub_w) + pad * 2
    local height = size * 1.55 + (current.region and sub_size * 1.8 or 0) + pad

    imgui.SetNextWindowSize({ width, height })
    imgui.SetNextWindowPos({
        screen_w * 0.5 - width * 0.5,
        screen_h * TOP + (1 - ease_out(t / FADE_IN)) * 14 * scale,
    })

    local transparent = { 0, 0, 0, 0 }

    imgui.PushStyleColor(ImGuiCol_WindowBg, transparent)
    imgui.PushStyleColor(ImGuiCol_Border, transparent)

    local flags =
        (ImGuiWindowFlags_NoTitleBar or 0)
        + (ImGuiWindowFlags_NoSavedSettings or 0)
        + (ImGuiWindowFlags_NoScrollbar or 0)
        + (ImGuiWindowFlags_NoCollapse or 0)
        + (ImGuiWindowFlags_NoResize or 0)
        + (ImGuiWindowFlags_NoMove or 0)
        + (ImGuiWindowFlags_NoBackground or 0)
        + (ImGuiWindowFlags_NoInputs or 0)
        + (ImGuiWindowFlags_NoFocusOnAppearing or 0)
        + (ImGuiWindowFlags_NoNav or 0)

    if imgui.Begin('Zone Name###JournalZoneBanner', { true }, flags) then
        pcall(function()
            local draw = imgui.GetWindowDrawList()
            local x, y = imgui.GetWindowPos()
            local center = x + width * 0.5
            local top = y + pad * 0.5

            plain_text(
                draw, font, size, center - title_w * 0.5, top,
                current.name, letters, alpha
            )

            local line_y = top + size * 1.22

            fade_line(
                draw, center - width * 0.45, center + width * 0.45,
                line_y, alpha, math.max(1, 1.5 * scale),
                chosen and letters or nil
            )

            if current.region then
                plain_text(
                    draw, font, sub_size, center - sub_w * 0.5,
                    line_y + sub_size * 0.45, current.region,
                    chosen and { 1 - (1 - chosen[1]) * 0.45, 1 - (1 - chosen[2]) * 0.45, 1 - (1 - chosen[3]) * 0.45 } or SUBTITLE,
                    alpha * 0.85
                )
            end
        end)
    end

    imgui.End()
    imgui.PopStyleColor(2)
end

-- For the tests.
function M.Reset()
    last_zone = nil
    missing_since = nil
    current = nil
end

-- Shows the banner again for the zone of the player (the Settings test).
function M.Replay(controller)
    local zone = controller and controller.GetCurrentZoneId
        and controller.GetCurrentZoneId()
    local name = zone and controller.GetCompassZoneName
        and controller.GetCompassZoneName(zone)

    if type(name) ~= 'string' or name == '' then
        name = 'Zone Name'
    end

    local region = zone and controller.zonelist
        and controller.zonelist.RegionOf
        and controller.zonelist.RegionOf(zone) or nil

    last_zone = zone or last_zone
    current = { name = name, region = region, start = now() }
end

function M.GetCurrent()
    return current
end

return M
