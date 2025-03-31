local data = require(script.Parent).data
local get = require(script.Parent.Parent.utilities).get
local services = require(script.Parent).services
local HttpService = services.HttpService
local fusion = require(script.Parent).Fusion
local observe = fusion.Observer
local value = fusion.Value

local utilities = require(script.Parent.Parent.utilities)
local connections = utilities.connections
local customFunctions = utilities.customFunctions
local randomString = utilities.randomString

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

local configs = {}
funcs.currentConfig = ""
funcs.path = ""

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

function funcs.find(uid)
    for i,v in configs do
        if v.uid == uid then
            return v, i
        end
    end
    return false
end

function funcs.create(name, uid, fromFile, tbl)
    fromFile = fromFile or false
    if uid == "original" and fromFile then
        return
    end
    local config = {}
    config.name = name
    config.uid = uid or randomString(5)
    config.flagValues = {}
    if fromFile then
        config.flagValues = tbl
    else
        for _,flag in get(flags.list) do
            if flag.private then
                continue
            end
            if flag.type == "unknown" then
                continue
            end
            config.flagValues[flag.name] = cleaner[flag.type](flag.status)
        end
    end
    table.insert(configs, config)

    return uid
end

function funcs.init()
    for _,file in customFunctions.listfiles(funcs.path) do
        local config = HttpService:JSONDecode(customFunctions.readfile(file))
        funcs.create(config.name, config.uid, true, config.flagValues)
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

function funcs.set(uid)
    local config = funcs.find(uid)
    if not config then
        return
    end
    funcs.currentConfig = uid
    funcs.load(config.flagValues)
end

function funcs.save(uid)
    local config = funcs.find(uid)
    for _,flag in get(flags.list) do
        if flag.private then
            continue
        end
        if flag.type == "unknown" then
            continue
        end
        config.flagValues[flag.name] = cleaner[flag.type](flag.status)
    end
    customFunctions.writefile(`{funcs.path}/{config.uid}.json`, HttpService:JSONEncode(config))
end

function funcs.delete(uid)
    local config, index = funcs.find(uid)
    if config then
        if customFunctions.isfile(`{funcs.path}/{config.uid}.json`) then
            customFunctions.delfile(`{funcs.path}/{config.uid}.json`)
            table.remove(configs, index)
        end
    end
end

function funcs.getConfigs()
    return configs
end

return funcs