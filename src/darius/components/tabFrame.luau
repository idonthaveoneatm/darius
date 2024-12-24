local darius = script.Parent.Parent
return function(property)
    local Bundles = require(darius.Bundles)
    local data = Bundles.data
	local Fusion = Bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
        local computed = Fusion.Computed

	local simpleElements = require(darius.simpleElements)
	local UIListLayout = simpleElements.UIListLayout
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment
    
    local get = require(darius.utilities).get

    local selectedTab = data.find("selectedTab")
    
    return new "ScrollingFrame" {
        ZIndex = computed(function()
            return (get(selectedTab.string) == property.uid) and 1 or 0
        end),
        Name = property.uid,
		Parent = property.Parent,
        Size = UDim2.new(1,0,1,0),
        BackgroundTransparency = 1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        CanvasSize = UDim2.new(1,0,1,0),

        [children] = {
            UIListLayout(SO.LayoutOrder, FD.Vertical,HA.Center,VA.Top,UDim.new(0,4)),
        }
    }
end