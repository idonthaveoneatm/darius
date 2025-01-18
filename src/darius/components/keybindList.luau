local darius = script.Parent.Parent

return function(property)
    local bundles = require(darius.Bundles)
    local data = bundles.data
    local theme = bundles.themeSystem
    local icons = bundles.icons
    local fusion = bundles.Fusion
        local new = fusion.New
        local children = fusion.Children
        local value = fusion.Value
        local computed = fusion.Computed
        local observe = fusion.Observer

	local simpleElements = require(darius.simpleElements)
	local UICorner = simpleElements.UICorner
	local UIPadding = simpleElements.UIPadding
	local UITextSizeConstraint = simpleElements.UITextSizeConstraint

    local utilities = require(darius.utilities)
    local get = utilities.get
    local animate = utilities.animate
    local getStringBounds = utilities.getStringBounds
    local customFont = utilities.customFont

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
    local currentBinds = data.find("currentBinds")
	local keybindList = data.add(property)

	-- Properties

	local _parent = property.Parent
	local title = value("Active Keybinds")
	local body = value("")

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(keybindList.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(keybindList.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local ySize = value(0)
	task.spawn(function()
		ySize:set(getStringBounds(get(body),{
			Font = customFont("Montserrat", Enum.FontWeight.Medium),
			Size = 16,
			Width = math.round(get(_parent).AbsoluteSize.X)
		}).Y)
	end)
	get(_parent).Changed:Connect(function(changedProperty)
		if changedProperty:lower() == "absolutesize" then
			ySize:set(getStringBounds(get(body),{
				Font = customFont("Montserrat", Enum.FontWeight.Medium),
                Size = 16,
                Width = math.round(get(_parent).AbsoluteSize.X)
			}).Y)
		end
	end)
	observe(body):onChange(function()
		ySize:set(getStringBounds(get(body),{
			Font = customFont("Montserrat", Enum.FontWeight.Bold),
            Size = 16,
            Width = math.round(get(_parent).AbsoluteSize.X)
		}).Y)
	end)
    local function createBody(tbl)
        local tmp = {}
        table.foreach(tbl, function(i,v)
            tmp[i] = v.Name
        end)
        return table.concat(tmp, ", ")
    end

	-- keybindList

	new "Frame" {
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(title):lower(), get(searchText.string):lower()) and not string.find(get(body):lower(), get(searchText.string):lower()) then
				return false
			end
			return true
		end),
		BackgroundColor3 = theme.background2,
		Parent = _parent,
		BackgroundTransparency = selectedAnimation,
		Size = computed(function()
			return UDim2.new(1,0,0,36 + get(ySize))
		end),
		AutomaticSize = Enum.AutomaticSize.Y,

		[children] = {
			UICorner(6),
			UIPadding(6),
            new "ImageLabel" {
                ZIndex = 0,
                Size = UDim2.fromOffset(20,20),
                BackgroundTransparency = 1,
                Image = icons.command,
                ImageColor3 = theme.text2,
                ImageTransparency = selectedAnimation
            },
			new "TextLabel" {
				Name = "Title",
				RichText = true,
				Size = UDim2.new(1,-25,0,18),
                Position = UDim2.fromOffset(25,0),
				BackgroundTransparency = 1,
				TextTransparency = selectedAnimation,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextScaled = true,
				TextSize = 18,
                FontFace = customFont("Montserrat", Enum.FontWeight.Bold),

				TextColor3 = theme.text,
				Text = title,

				[children] = {
					UITextSizeConstraint(1,18),
				}
			},
			new "TextLabel" {
				Name = "Body",
				TextWrapped = true,
				RichText = true,
				Position = UDim2.fromOffset(4,25),
				BackgroundTransparency = 1,
				TextTransparency = selectedAnimation,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = 16,
				FontFace = customFont("Montserrat", Enum.FontWeight.Medium),

				TextColor3 = theme.text2,
				Text = body,
				Size = computed(function()
					return UDim2.new(1,-4,0,get(ySize))
				end)
			}
		}
	}

    body:set(createBody(get(currentBinds.binds)))
    observe(currentBinds.binds):onChange(function()
        body:set(createBody(get(currentBinds.binds)))
    end)
end