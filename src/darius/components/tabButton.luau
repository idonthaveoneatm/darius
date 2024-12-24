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
		local onevent = Fusion.OnEvent

	local utilities = require(darius.utilities)
	local get = utilities.get
	local animate = utilities.animate
	local typecheck = utilities.typecheck
	local customFont = utilities.customFont

	local simpleElements = require(darius.simpleElements)
	local UIListLayout = simpleElements.UIListLayout
	local UIPadding = simpleElements.UIPadding
	local UICorner = simpleElements.UICorner
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment

	-- Typecheck

	local didPass, failedItems = typecheck(property, {
		Name = "",
		Image = ""
	},{
		property.Image and "" or "Image"
	})

	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local isFirst = data.find("isFirst")
	local tab = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local image, hasImage = nil, value(false)
	if property.Image then
		image = property.Image
		hasImage:set(true)
	end

	-- Variables

	local isSelected = value(false)
	observe(selectedTab.string):onChange(function()
		local _selectedTab = get(selectedTab.string)
		isSelected:set(_selectedTab == tab.uid)
	end)

	-- Instance

	new "TextButton" {
		Name = tab.uid,
		Parent = _parent,
		Size = UDim2.new(1,0,0,36),
		BackgroundColor3 = animate(function()
			return get(isSelected) and theme.get("selectedTab") or theme.get("background2")
		end,40,1),

		[onevent "Activated"] = function()
			selectedTab:update("string", tab.uid)
		end,

		[children] = {
			UICorner(4),
			UIPadding(6),
			UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,4)),
			new "ImageLabel" {
				Visible = hasImage,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(24,24),
				ImageColor3 = theme.text2,
				Image = image,
				ImageTransparency = animate(function()
					return get(isSelected) and 0 or 0.6
				end,40,1)
			},
			new "TextLabel" {
				Size = get(hasImage) and UDim2.new(1,-28,1) or UDim2.fromScale(1,1),
				FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
				TextColor3 = theme.text2,
				TextScaled = true,
				Text = name,
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTransparency = animate(function()
					return get(isSelected) and 0 or 0.6
				end,40,1),

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 16
					}
				}
			}
		}
	}
	if not get(isFirst.boolean) then
		isFirst:update("boolean", true)
		selectedTab:update("string", tab.uid)
	end
	return tab
end