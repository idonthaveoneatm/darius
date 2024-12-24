local Fusion = require(script.Parent.Parent.Bundles.Fusion)
local computed,spring = Fusion.Computed,Fusion.Spring

return function(callback, speed, damping)
	return spring(computed(callback), speed, damping)
end