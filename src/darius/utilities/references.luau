local references = {}
local returnFunctions = {}
local observe = require(script.Parent.Parent.Bundles.Fusion).Observer

local get = require(script.Parent.get)

function returnFunctions.add(...)
    for _,REF in {...} do
        if typeof(get(REF)) ~= "Instance" then
            observe(REF):onChange(function()
                if typeof(get(REF)) == "Instance" then
                    if not references[get(REF).Name] then
                        references[get(REF).Name] = get(REF)
                    else
                        warn(get(REF).Name, " REF was already added")
                    end
                end
            end)
        else
            if not references[get(REF).Name] then
                references[get(REF).Name] = get(REF)
            else
                warn(get(REF).Name, " REF was already added")
            end
        end
    end
end
function returnFunctions.get(name)
    if references[name] then
        return references[name]
    end
end
function returnFunctions.remove(name)
    if references[name] then
        references[name] = nil
    else
        warn(name, "isn't in the references list")
    end
end
function returnFunctions.clear()
    for i,v in references do
        references[i] = nil
        if typeof(v) == "Instance" then
            v:Destroy()
        end
    end
end

return returnFunctions