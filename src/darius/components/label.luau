local darius = script.Parent.Parent
return function(property)
	local bundles = require(darius.Bundles)
	local data = bundles.data
	local theme = bundles.themeSystem
	local fusion = bundles.Fusion
		local new = fusion.New
		local children = fusion.Children
		local value = fusion.Value
		local computed = fusion.Computed
		local observe = fusion.Observer

	local simpleElements = require(darius.simpleElements)
	local UICorner = simpleElements.UICorner
	local UIPadding = simpleElements.UIPadding

	local utilities = require(darius.utilities)
	local get = utilities.get
	local typecheck = utilities.typecheck
	local animate = utilities.animate
	local customFont = utilities.customFont

	-- Typecheck

	local didPass, failedItems = typecheck(property,{Text = ""})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
	local label = data.add(property)

	-- Properties

	local _parent = property.Parent
	local text = property.Text

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(label.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(label.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)

	-- Label

	new "Frame" {
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(text):lower(), get(searchText.string):lower()) then
				return false
			end
			return true
		end),
		Size = UDim2.new(1,0,0,36),
		Parent = _parent,
		BackgroundTransparency = selectedAnimation,
		BackgroundColor3 = theme.background2,

		[children] = {
			UICorner(6),
			UIPadding(0,8),
			new "TextLabel" {
				FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
				RichText = true,
				TextScaled = true,
				BackgroundTransparency = 1,
				TextTransparency = selectedAnimation,
				Size = UDim2.new(1,-0,0,18),
				Position = UDim2.new(0,0,0.5,0),
				AnchorPoint = Vector2.new(0,0.5),
				TextXAlignment = Enum.TextXAlignment.Left,

				TextColor3 = theme.text,
				Text = computed(function()
					return get(text)
				end),

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 18
					}
				}
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:SetText(newText)
		local _didPass, _failedItems = typecheck({['SetText'] = newText}, {SetText = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		text:set(newText)
	end
	return returnFunctions
end