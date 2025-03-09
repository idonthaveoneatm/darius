---@diagnostic disable: undefined-global
local functions = {}

local filesystem = {}

function functions.cloneref(service)
    if cloneref then
        return cloneref(service)
    else
        return service
    end
end

function functions.gethui(...)
    return gethui(...) or nil
end

functions.getgenv = getgenv or nil

function functions.isfile(string:string)
    if isfile then
        return isfile(string)
    else
        local currentPath = filesystem
        local isNil = false
        if string:find("/") then
            for _,v in string:split("/") do
                currentPath = currentPath[v]
                if currentPath == nil then
                    isNil = true
                    break
                end
            end
        else
            currentPath = currentPath[string]
            if currentPath == nil then
                isNil = true
            end
        end
        if isNil then
            return false
        end
        return true
    end
end
function functions.isfolder(string:string)
    if isfolder then
        return isfolder(string)
    else
        local currentPath = filesystem
        local isNil = false
        if string:find("/") then
            for _,v in string:split("/") do
                currentPath = currentPath[v]
                if currentPath == nil then
                    isNil = true
                    break
                end
            end
        else
            currentPath = currentPath[string]
            if currentPath == nil then
                isNil = true
            end
        end
        if isNil then
            return false
        end
        return true
    end
end
function functions.writefile(string:string, content:string)
    if writefile then
        return writefile(string, content)
    else
        local currentPath = filesystem
        for _,v in string:split("/") do
            if typeof(currentPath[v]) == "table" then
                currentPath = currentPath[v]
            elseif (typeof(currentPath[v]) == "string" or typeof(currentPath[v]) == "nil")then
                currentPath[v] = content
            end
        end
    end
end
function functions.delfile(string:string)
    if delfile then
        return delfile(string)
    else
        local currentPath = filesystem
        local oldestCorrect = currentPath
        local splitString = string:split("/")
        for _,v in splitString do
            currentPath = currentPath[v]
            if typeof(currentPath) == "string" then
                oldestCorrect[v] = nil
            else
                oldestCorrect = currentPath
            end
        end
    end
end
function functions.readfile(string:string)
    if readfile then
        return readfile(string)
    else
        local currentPath = filesystem
        local isNil = false
        if string:find("/") then
            for _,v in string:split("/") do
                currentPath = currentPath[v]
                if currentPath == nil then
                    isNil = true
                    break
                end
            end
        else
            currentPath = currentPath[string]
        end
        if isNil then
            warn("readfile: no file")
            return nil
        end
        return currentPath
    end
end
function functions.makefolder(string:string)
    if makefolder then
        return makefolder(string)
    else
        local currentPath = filesystem
        if string:find("/") then
            for _,v in string:split("/") do
                if not currentPath[v] then
                    currentPath[v] = {}
                    break
                else
                    currentPath = currentPath[v]
                end
            end
        else
            currentPath[string] = {}
        end
    end
end
function functions.listfiles(string:string)
    if listfiles then
        return listfiles(string)
    else
        local currentPath = filesystem
        local isNil = false
        if string:find("/") then
            for _,v in string:split("/") do
                currentPath = currentPath[v]
                if currentPath == nil then
                    isNil = true
                    break
                end
            end
        else
            currentPath = currentPath[string]
        end
        if isNil or typeof(currentPath) == "string" then
            warn("no folder exists")
            return nil
        end
        local cleaned = {}
        for i,v in currentPath do
            if typeof(v) == "string" then
                table.insert(cleaned, i)
            end
        end
        return cleaned
    end
end
return functions