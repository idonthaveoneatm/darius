local data = require(script.Parent).data
local get = require(script.Parent.Parent.utilities).get
local services = require(script.Parent).services
local HttpService = services.HttpService
local fusion = require(script.Parent).Fusion
local observe = fusion.Observer
local value = fusion.Value
local connections = require(script.Parent.Parent.utilities).connections
local customFunctions = require(script.Parent.Parent.utilities).customFunctions

local funcs = {}
local flags = data.add({list = {}},"flags")
local names = {}
local preregistered = {}

local types = {
    ['toggle'] = function(flag)
        local boolean = flag.status.boolean
        connections.add(observe(boolean):onChange(function()
            if not flag.private then
                task.spawn(funcs.export)
            end
            local cValue = get(boolean)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['dropdown'] = function(flag)
        local observable = flag.status.multiselect and flag.status.items or flag.status.item
        connections.add(observe(observable):onChange(function()
            if not flag.private then
                task.spawn(funcs.export)
            end
            local cValue = get(observable)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['keybind'] = function(flag)
        local observable = flag.status.mobile and flag.status.coordinate or flag.status.keycode
        connections.add(observe(observable):onChange(function()
            if not flag.private then
                task.spawn(funcs.export)
            end
            local cValue = get(observable)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['slider'] = function(flag)
        local percentageOf = flag.status.percentageOf
        connections.add(observe(percentageOf):onChange(function()
            if not flag.private then
                task.spawn(funcs.export)
            end
            local cValue = get(percentageOf)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['textbox'] = function(flag)
        local correctText = flag.status.correctText
        connections.add(observe(correctText):onChange(function()
            if not flag.private then
                task.spawn(funcs.export)
            end
            local cValue = get(correctText)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['colorpicker'] = function(flag)
        local color = flag.status.color
        local transparency = flag.status.transparency
        connections.add(observe(color):onChange(function()
            if not flag.private then
                task.spawn(funcs.export)
            end
            flag.user.Value = {get(color), get(transparency)}
            flag.bindableEvent:Fire(unpack(flag.user.Value))
        end))
        connections.add(observe(transparency):onChange(function()
            if not flag.private then
                task.spawn(funcs.export)
            end
            flag.user.Value = {get(color), get(transparency)}
            flag.bindableEvent:Fire(unpack(flag.user.Value))
        end))
    end
}
local cleaner = {
    ['toggle'] = function(status)
        local clean = {}
        if status.boolean then
            clean.boolean = get(status.boolean)
        end
        if status.keycode then
            clean.keycode = get(status.keycode)
        end
        return clean
    end,
    ['dropdown'] = function(status)
        return status.multiselect and get(status.items) or get(status.item)
    end,
    ['keybind'] = function(status)
        local clean = {}
        if status.keycode then
            clean.keycode = get(status.keycode)
        end
        if status.coordinate then
            clean.coordinate = get(status.coordinate)
        end
        return clean
    end,
    ['slider'] = function(status)
        return get(status.percentageOf)
    end,
    ['textbox'] = function(status)
        return get(status.correctText)
    end,
    ['colorpicker'] = function(status)
        return {color = get(status.color), transparency = get(status.transparency)}
    end
}

function funcs.preregister(name)
    local flagEvent = fusion.New "BindableEvent" {}
    local onChange = {}
    function onChange:Connect(func)
        assert(typeof(func) == "function", "Connect only takes functions")
        connections.add(flagEvent.Event:Connect(func))
    end
    local _flag
    _flag = {
        name = name,
        status = {},
        type = "unknown",
        preregistered = true,
        bindableEvent = flagEvent,
        file = value({}),
        user = {
            Value = nil,
            OnChange = setmetatable(onChange,{
                __newindex = function(tbl,idx,key)
                    return nil
                end
            })
        }
    }

    preregistered[name] = _flag
    local _list = get(flags.list)
    _list[_flag.name] = _flag
    flags:update("list",_list)
    return _flag
end

function funcs.register(name, default, type, private)
    assert(not table.find(names, name), "Flags must all be unique!")
    table.insert(names, name)
    local flagEvent = fusion.New "BindableEvent" {}
    local onChange = {}
    function onChange:Connect(func)
        assert(typeof(func) == "function", "Connect")
        connections.add(flagEvent.Event:Connect(func))
    end
    local _flag
    if not preregistered[name] then
        _flag = {
            name = name,
            status = default,
            type = type,
            private = private,
            preregistered = false,
            bindableEvent = flagEvent,
            file = value({}),
            user = {
                Value = nil,
                OnChange = setmetatable(onChange,{
                    __newindex = function()
                        return nil
                    end
                })
            }
        }
        types[_flag.type](_flag)

        local _list = get(flags.list)
        _list[_flag.name] = _flag
        flags:update("list",_list)
    else
        _flag = preregistered[name]
        _flag.type = type
        _flag.preregistered = false
        _flag.status = default
        _flag.private = private
        types[_flag.type](_flag)
        preregistered[_flag.name] = nil
    end
    return _flag
end

funcs.config = value("")

function funcs.export()
    local exported = {}
    local _list = get(flags.list)
    for _,flag in _list do
        if flag.private then
            continue
        end
        if flag.type == "unknown" then
            continue
        end
        exported[flag.name] = cleaner[flag.type](flag.status)
    end
    if get(funcs.config) ~= "" then
        customFunctions.writefile(get(funcs.config), HttpService:JSONEncode(exported))
    end
end

function funcs.load(fileTable)
    for i,v in fileTable do
        local flag = get(flags.list)[i]
        if not flag then
            continue
        end
        flag.file:set(v)
    end
end

return funcs