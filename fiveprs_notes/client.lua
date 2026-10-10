local APP_ID = 'notes'
local STORAGE_KEY = 'fiveprs_notes'
local MAX_LENGTH = 4000

local function readNotes()
    return GetResourceKvpString(STORAGE_KEY) or ''
end

local function updateBadge(text)
    exports.fiveprs:setAppBadge(APP_ID, text ~= '' and '•' or '')
end

local function register()
    exports.fiveprs:registerApp({
        id = APP_ID,
        label = 'Notes',
        color = '#0891b2',
        order = 600,
        icon = 'M5 3h10l4 4v14H5z M15 3v4h4 M9 11h6 M9 15h6',
        page = ('https://cfx-nui-%s/html/index.html'):format(GetCurrentResourceName()),
    })
    updateBadge(readNotes())
end

local function tryRegister()
    if GetResourceState('fiveprs') ~= 'started' then return false end
    return pcall(register)
end

AddEventHandler('fiveprs:appAction', function(app, action, data)
    if app ~= APP_ID then return end

    if action == 'load' then
        exports.fiveprs:sendAppMessage(APP_ID, 'notes', { text = readNotes(), maxLength = MAX_LENGTH })
    elseif action == 'save' then
        local text = tostring(data and data.text or ''):sub(1, MAX_LENGTH)
        SetResourceKvp(STORAGE_KEY, text)
        updateBadge(text)
        exports.fiveprs:sendAppMessage(APP_ID, 'saved', { length = #text })
    end
end)

AddEventHandler('onClientResourceStart', function(resource)
    if resource == 'fiveprs' then tryRegister() end
end)

CreateThread(function()
    while not tryRegister() do
        Wait(1000)
    end
end)
