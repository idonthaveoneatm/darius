local randomString = require(script.Parent.Parent.utilities.randomString)
local fusion = require(script.Parent.Fusion)
local value = fusion.Value

local data = {}
local dataFunctions = {}

type uid = string
type tag = string

function dataFunctions.update(uid:string, index:string, new:string)
    if index ~= "uid" and dataFunctions.find(uid) and dataFunctions.find(uid)[index] then
        local dataToEdit = dataFunctions.find(uid)
        dataToEdit[index]:set(new)
    elseif not dataFunctions.find(uid) then
        error("couldn't find uid: "..uid)
    elseif index == "uid" or index == "__tag" then
        error("cannot edit property "..index)
    elseif not dataFunctions.find(uid)[index] then
        
    else
        error("how?")
    end
end
function dataFunctions.find(identifier:uid | tag):table
    local returnData = nil
    for i=1, #data do
        if data[i].uid == identifier or data[i].__tag == identifier then
            returnData = data[i]
        end
    end
    if not returnData then
        warn("no data found by identifier: "..tostring(identifier))
        return returnData
    end
    return returnData
end
function dataFunctions.delete(uid:string)
    local dataToDelete = dataFunctions.find(uid)
    local index = table.find(data, dataToDelete)
    local newData = {}
    for i=1, #data do
        if i ~= index then
            table.insert(newData, data[i])
        end
    end
    data = newData
    newData =  nil
end
function dataFunctions.add(newData:table, tag:string, exclude:boolean):table
    exclude = exclude or false
    if not exclude then
        for i,v in newData do
            newData[i] = value(v)
        end
    end
    newData.__tag = tag or nil
    newData.uid = randomString(16)
    setmetatable(newData, {
        __index = {
            ["update"] = function(tbl, dataType, info)
                dataFunctions.update(tbl.uid, dataType, info)
            end,
            ["delete"] = function()
                dataFunctions.delete(newData.uid)
            end
        }
    })
    table.insert(data, newData)
    return dataFunctions.find(newData.uid)
end

return dataFunctions