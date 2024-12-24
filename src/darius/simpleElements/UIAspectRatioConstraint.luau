local Fusion = require(script.Parent.Parent.Bundles.Fusion)

return function(AspectRatio:number, AspectType:Enum.AspectType, DominantAxis:Enum.DominantAxis)
    AspectType = AspectType or Enum.AspectType.FitWithinMaxSize
    DominantAxis = DominantAxis or Enum.DominantAxis.Height
    return Fusion.New "UIAspectRatioConstraint" {
        AspectRatio = AspectRatio,
        AspectType = AspectType,
        DominantAxis = DominantAxis
    }
end