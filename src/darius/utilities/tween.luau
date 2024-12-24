local Fusion = require(script.Parent.Parent.Bundles.Fusion)
local computed = Fusion.Computed

return function(callback,style)
	return Fusion.Tween(computed(callback), style)
end