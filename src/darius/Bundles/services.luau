local cF = require(script.Parent.Parent.utilities.customFunctions)
local cloneref = cF.cloneref

local services = {}
services = setmetatable(services, {
    __index = function(_, key)
        return cloneref(game:GetService(key))
    end
})

return services