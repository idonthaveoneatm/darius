local Fusion = require(script.Parent.Parent.Bundles.Fusion)

return function(MinText:number?, MaxText:number?)
    return Fusion.New "UITextSizeConstraint" {
        MinTextSize = MinText,
        MaxTextSize = MaxText,
    }
end