local darius = script.Parent.Parent
return function(property)
    local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local Fusion = Bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
		local value = Fusion.Value
		local observe = Fusion.Observer

	local utilities = require(darius.utilities)
	local get = utilities.get
	local animate = utilities.animate

    -- Data

	local selectedTab = data.find("selectedTab")
	local divider = data.add(property)

	-- Properties

	local _parent = property.Parent

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(divider.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(divider.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)

    new "Frame" {
        Parent = _parent,
		Size = UDim2.new(1,0,0,16),
		BackgroundTransparency = 1,

        [children] = {
            new "Frame" {
                Size = UDim2.new(1,0,0,2),
                AnchorPoint = Vector2.new(0.5,0.5),
                Position = UDim2.fromScale(0.5,0.5),
                BackgroundColor3 = theme.text2,
                BackgroundTransparency = selectedAnimation
            }
        }
    }
end