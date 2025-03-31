local themeSystem = {}
local services = require(script.Parent.services)
local HttpService = services.HttpService
local data = require(script.Parent.data)
local fusion = require(script.Parent.Fusion)
local default = require(script.default)
local value = fusion.Value
local observe = fusion.Observer

local get = require(script.Parent.Parent.utilities.get)
local animate = require(script.Parent.Parent.utilities.animate)
local _warn = require(script.Parent.Parent.components.warn)
local randomString = require(script.Parent.Parent.utilities.randomString)
local customFunctions = require(script.Parent.Parent.utilities.customFunctions)
local functionsOnChange = {}

local currentTheme = value({})
local _currentTheme = value({})
local dariusUID = ""
observe(currentTheme):onChange(function()
    for _,func in ipairs(functionsOnChange) do
        task.spawn(func)
    end
end)

local themes = {}
local potentialFromFiles = {}

local palletteCheck = {}
table.foreach(default, function(name)
    table.insert(palletteCheck, name)
end)

themeSystem.path = ""

function themeSystem.find(uid)
    for _,theme in themes do
        if theme.uid == uid then
            return true, theme
        end
    end
    return false
end

function themeSystem.export()
    for _,theme in themes do
        local ctheme = {}
        ctheme.name = theme.name
        ctheme.uid = theme.uid
        ctheme.fromSet = theme.fromSet
        ctheme.palette = {}
        for i,v in theme.palette do
            ctheme.palette[i] = v:ToHex()
        end
        customFunctions.writefile(`{themeSystem.path}/{theme.uid}.json`, HttpService:JSONEncode(ctheme))
    end
end

function themeSystem.create(name, palette, uid, fromFile, fromSet)
    fromFile = fromFile or false
    if uid == "original" and fromFile then
        return
    end
    for _,v in palletteCheck do
        if palette[v] == nil then
            palette[v] = default[v]
        end
        if typeof(palette[v]) ~= "Color3" then
            _warn(v.." isn't type Color3")
        end
    end
    for i,_ in palette do
        if not table.find(palletteCheck, i) then
            _warn('Incorrect value removed "'..tostring(i)..'"')
            palette[i] = nil
        end
    end

    if fromSet and fromFile then
        table.insert(potentialFromFiles, uid)
    end
    if fromSet and not fromFile then
        for _,v in potentialFromFiles do
            local theme = themeSystem.find(v)
            if theme.name == name then
                return v.uid
            end
        end
    end

    uid = uid or randomString(5)
    table.insert(themes, {
        name = name,
        uid = uid,
        fromSet = fromSet or false,
        palette = palette
    })
    themeSystem.export()
    return uid
end

function themeSystem.delete(uid)
    local results = {themeSystem.find(uid)}
    if not results[1] then
        return false, "no theme found"
    end
    local position = table.find(themes, results[2])
    themeSystem.set(dariusUID)
    table.remove(themes, position)
    customFunctions.delfile(`{themeSystem.path}/{results[2].uid}.json`)
end

function themeSystem.edit(name, color)
    local ctheme = get(currentTheme)
    ctheme[name] = color
    currentTheme:set(ctheme)
end

function themeSystem.set(uid)
    local results = {themeSystem.find(uid)}
    local theme, palette
    if results[1] then
        theme, palette = results[2], results[2].palette
    else
        return false, "no theme found"
    end

    local _palette = {}
    table.foreach(palette,function(i,v)
        _palette[i] = v
    end)
    currentTheme:set(_palette)
    _currentTheme:set(theme)
    return true, "successfully set new theme"
end

function themeSystem.import(name, palette)
    themeSystem.create(name, palette)
end

function themeSystem.get(name)
    local theme = get(currentTheme)
    if theme[name] then
        return theme[name]
    else
        error(name.." isn't a theme element")
    end
end

for _,v in palletteCheck do
    themeSystem[v] = animate(function()
        return get(currentTheme)[v]
    end,40,1)
end

function themeSystem.init()
    dariusUID = themeSystem.create("darius", default, "original")
    themeSystem.set(dariusUID)
    for _,file in customFunctions.listfiles(themeSystem.path) do
        local theme = HttpService:JSONDecode(customFunctions.readfile(file))
        table.foreach(theme.palette,function(i,v)
            local color = Color3.fromHex(`#{v}`)
            theme.palette[i] = color
        end)
        themeSystem.create(theme.name, theme.palette, theme.uid, true, theme.fromSet)
    end
end

function themeSystem.onChange(func)
    table.insert(functionsOnChange, func)
end

function themeSystem.getTheme()
    return get(_currentTheme)
end

function themeSystem.getThemes()
    return themes
end
function themeSystem.getColors()
    return get(currentTheme)
end

return themeSystem