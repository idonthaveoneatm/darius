local utilities = require(script.Parent.Parent.utilities)
local customFunctions = utilities.customFunctions

local fusion
local oldidentity
if customFunctions.getthreadidentity() < 5 then
    oldidentity = customFunctions.getthreadidentity()
    customFunctions.setthreadidentity(5)
end
fusion = require(game:GetObjects("rbxassetid://110500042647914")[1])
customFunctions.setthreadidentity(oldidentity)
return fusion