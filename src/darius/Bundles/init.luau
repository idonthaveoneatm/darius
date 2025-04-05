local utilities = require(script.Parent.utilities)
local customFunctions = utilities.customFunctions

local fusion
local oldidentity
if customFunctions.getthreadidentity() < 5 then
    oldidentity = customFunctions.getthreadidentity()
    customFunctions.setthreadidentity(5)
end
fusion = game:GetObjects("rbxassetid://110500042647914")[1]
fusion.Parent = script
customFunctions.setthreadidentity(oldidentity)

return setmetatable({},{
    __index = function(self, key)
        if script:FindFirstChild(key) then
            return require(script[key])
        else
            error("no bundle: "..key)
        end
    end
})