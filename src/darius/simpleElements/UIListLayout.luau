local Fusion = require(script.Parent.Parent.Bundles.Fusion)

return function(SortOrder, FillDirection,HorizontalAlignment,VerticalAlignment,Padding)
    return Fusion.New "UIListLayout" {
        SortOrder = SortOrder or Enum.SortOrder.LayoutOrder,
        FillDirection = FillDirection or Enum.FillDirection.Vertical,
        HorizontalAlignment = HorizontalAlignment or Enum.HorizontalAlignment.Center,
        VerticalAlignment = VerticalAlignment or Enum.VerticalAlignment.Center,
        Padding = Padding or UDim.new(0,0)
    }
end