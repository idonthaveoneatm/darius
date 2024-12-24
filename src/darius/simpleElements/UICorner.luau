local Fusion = require(script.Parent.Parent.Bundles.Fusion)

return function(offset, scale)
    scale = scale or 0
    return Fusion.New "UICorner" {
        CornerRadius = UDim.new(scale, offset)
    }
end