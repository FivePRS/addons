local function getState()
    if GetResourceState('fiveprs') ~= 'started' then return nil end

    local ok, state = pcall(function() return exports.fiveprs:getState() end)
    if ok and type(state) == 'table' then return state end
    return nil
end

local function getLocation()
    local coords = GetEntityCoords(PlayerPedId())
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    if zone ~= 'NULL' and zone ~= '' then return zone end

    local street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    return GetStreetNameFromHashKey(street)
end

local function fill(template, values)
    return (template:gsub('{(%w+)}', function(key)
        local value = values[key]
        return value ~= nil and tostring(value) or ''
    end))
end

local function buildValues(state)
    local values = { location = getLocation() }

    for key, value in pairs(state or {}) do
        values[key] = value
    end

    if values.status then
        values.status = Config.Statuses[values.status] or values.status
    end

    return values
end

local function pickText(state)
    if state and state.onDuty then
        if state.call then return Config.Text.onCall end
        return Config.Text.onDuty
    end
    return Config.Text.offDuty
end

local function update()
    local state = getState()
    local values = buildValues(state)

    SetRichPresence(fill(pickText(state), values))

    if Config.AppId == '' then return end

    SetDiscordRichPresenceAsset(Config.LargeImage.asset)
    SetDiscordRichPresenceAssetText(fill(Config.LargeImage.text, values))

    local image = state and state.onDuty and Config.DepartmentImages[state.department] or Config.CivilianImage
    if image then
        SetDiscordRichPresenceAssetSmall(image.asset)
        SetDiscordRichPresenceAssetSmallText(fill(image.text, values))
    else
        SetDiscordRichPresenceAssetSmall('')
        SetDiscordRichPresenceAssetSmallText('')
    end
end

CreateThread(function()
    if Config.AppId ~= '' then
        SetDiscordAppId(Config.AppId)

        for index, button in ipairs(Config.Buttons) do
            if index > 2 then break end
            SetDiscordRichPresenceAction(index - 1, button.label, button.url)
        end
    end

    while true do
        update()
        Wait(math.max(Config.RefreshSeconds, 5) * 1000)
    end
end)
