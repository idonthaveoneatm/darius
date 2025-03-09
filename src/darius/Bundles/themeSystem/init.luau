local themeSystem = {}
local fusion = require(script.Parent.Fusion)
local default = require(script.default)
local value = fusion.Value
local observe = fusion.Observer

local get = require(script.Parent.Parent.utilities.get)
local animate = require(script.Parent.Parent.utilities.animate)
local functionsOnChange = {}

local currentTheme = value({})
observe(currentTheme):onChange(function()
    for _,func in ipairs(functionsOnChange) do
        task.spawn(func)
    end
end)

local palletteCheck = {}
table.foreach(default, function(name, color)
    table.insert(palletteCheck, name)
end)

function themeSystem.create(pallette)
    for _,v in palletteCheck do
        if pallette[v] == nil then
            pallette[v] = default[v]
        end
        if typeof(pallette[v]) ~= "Color3" then
            error(v.." isn't type Color3")
        end
    end
    for i,_ in pallette do
        if not table.find(palletteCheck, i) then
            warn('Incorrect value removed "'..tostring(i)..'"')
            pallette[i] = nil
        end
    end
    currentTheme:set(pallette)
end

function themeSystem.get(name:string)
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

currentTheme:set(default)
function themeSystem.onChange(func)
    table.insert(functionsOnChange, func)
end

function themeSystem.getTheme()
    return get(currentTheme)
end

return themeSystem