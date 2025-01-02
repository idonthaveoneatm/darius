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
    ['toggle'] = function(status, flagEvent, private)
        local boolean = status.boolean
        connections.add(observe(boolean):onChange(function()
            if not private then
                task.spawn(funcs.export)
            end
            local cValue = get(boolean)
            flagEvent:Fire(cValue)
        end))
    end,
    ['dropdown'] = function(status, flagEvent, private)
        local observable = status.multiselect and status.items or status.item
        connections.add(observe(observable):onChange(function()
            if not private then
                task.spawn(funcs.export)
            end
            local cValue = get(observable)
            flagEvent:Fire(cValue)
        end))
    end,
    ['keybind'] = function(status, flagEvent, private)
        local observable = status.mobile and status.coordinate or status.keycode
        connections.add(observe(observable):onChange(function()
            if not private then
                task.spawn(funcs.export)
            end
            local cValue = get(observable)
            flagEvent:Fire(cValue)
        end))
    end,
    ['slider'] = function(status, flagEvent, private)
        local percentageOf = status.percentageOf
        connections.add(observe(percentageOf):onChange(function()
            if not private then
                task.spawn(funcs.export)
            end
            local cValue = get(percentageOf)
            flagEvent:Fire(cValue)
        end))
    end,
    ['textbox'] = function(status, flagEvent, private)
        local correctText = status.correctText
        connections.add(observe(correctText):onChange(function()
            if not private then
                task.spawn(funcs.export)
            end
            local cValue = get(correctText)
            flagEvent:Fire(cValue)
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
        old = value(nil),
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
            old = value(nil),
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
        types[_flag.type](_flag.status, _flag.bindableEvent, _flag.private)

        local _list = get(flags.list)
        _list[_flag.name] = _flag
        flags:update("list",_list)
    else
        _flag = preregistered[name]
        _flag.type = type
        _flag.preregistered = false
        _flag.status = default
        _flag.private = private
        types[_flag.type](_flag.status, _flag.bindableEvent, _flag.private)
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