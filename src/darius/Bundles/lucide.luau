local utilities = require(script.Parent.Parent.utilities)
local customFunctions = utilities.customFunctions

local lucide
local oldidentity
if customFunctions.getthreadidentity() < 5 then
    oldidentity = customFunctions.getthreadidentity()
    customFunctions.setthreadidentity(5)
end
lucide = loadstring(game:GetObjects("rbxassetid://85554466048193")[1].Source)()
customFunctions.setthreadidentity(oldidentity)
return lucide