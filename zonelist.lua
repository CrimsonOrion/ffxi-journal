-- The list of the zones by region (the globe button of the Journal): the
-- state of its window and the data (data/zone_regions.lua).

local M = {}

local window_open = false
local regions = nil

-- { { name =, zones = { id, ... } } }, in the order of the list.
function M.Regions()
    if regions == nil then
        local ok, list = pcall(require, 'data.zone_regions')

        regions = ok and type(list) == 'table' and list or {}
    end

    return regions
end

-- For the tests: use this table instead of the file.
function M.SetRegions(list)
    regions = type(list) == 'table' and list or {}
    M.region_by_zone = nil
end

-- The name of the region a zone belongs to, or nil.
function M.RegionOf(zone_id)
    if M.region_by_zone == nil then
        M.region_by_zone = {}

        for _, region in ipairs(M.Regions()) do
            for _, id in ipairs(region.zones) do
                M.region_by_zone[id] = region.name
            end
        end
    end

    return M.region_by_zone[zone_id]
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

return M
