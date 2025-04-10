local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
	local Fusion = Bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
		local value = Fusion.Value
		local observe = Fusion.Observer
		local onevent = Fusion.OnEvent
		local computed = Fusion.Computed

	local utilities = require(darius.utilities)
	local get = utilities.get
	local animate = utilities.animate
	local typecheck = utilities.typecheck
	local customFont = utilities.customFont

	local simpleElements = require(darius.simpleElements)
    local UIListLayout = simpleElements.UIListLayout
    local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment
	local UIPadding = simpleElements.UIPadding
	local UICorner = simpleElements.UICorner

    -- Property

    local _parent = property.Parent
    local _tab = property.tab

    -- Variables

    local visibleCount = value(0)
    local visible = value(true)

	-- Button Group

    local buttonGroup = new "Frame" {
        Visible = visible,
        Parent = _parent,
		Size = UDim2.new(1,0,0,36),
        BackgroundTransparency = 1,

        [children] = {
            UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,3))
        }
    }

    local absSize = value(buttonGroup.AbsoluteSize)

    local returnTable = {}
    function returnTable:Button(_property)

        -- Typecheck

        local didPass, failedItems = typecheck(_property,{
            Name = "",
            DisabledText = "",
            IsEnabled = false,
            Visible = false,
            Callback = function()end
        },{
            _property.IsEnabled and "" or "IsEnabled",
            _property.Visible and "" or "Visible",
            _property.DisabledText and "" or "DisabledText"
        })
        assert(didPass, table.concat(failedItems, "\n"))

        -- Data

        local selectedTab = data.find("selectedTab")
        local searchText = data.find("searchText")
        local button = data.add(_property)

        -- Properties

        local name = _property.Name
        local callback = _property.Callback
        local isEnabled = _property.IsEnabled or value(true)
        local disabledText = _property.DisabledText or value("Component Disabled")
        local _visible = _property.Visible or value(true)

        -- Variables

        local isSelected = value(get(selectedTab.string) == get(_tab).uid)
        observe(selectedTab.string):onChange(function()
            isSelected:set(get(selectedTab.string) == get(_tab).uid)
        end)
        local selectedAnimation = animate(function()
            return get(isSelected) and 0 or 1
        end, 40, 1)

        new "TextButton" {
            Interactable = computed(function()
                if not get(isEnabled) then
                    return false
                end
                return get(isSelected)
            end),
            Visible = computed(function()
                if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(_visible) then
                    return false
                end
                return true
            end),
            Size = computed(function()
                return UDim2.new(1/get(visibleCount) - (get(visibleCount) - 1 == 0 and 0 or ((((get(visibleCount)-1)*3)/get(visibleCount))/get(absSize).X)),0,0,36)
            end),
            Parent = buttonGroup,
            BackgroundColor3 = theme.background2,
            BackgroundTransparency = selectedAnimation,

            [onevent "Activated"] = function()
                if not get(isEnabled) then
                    return
                end
                task.spawn(get(callback))
            end,

            [children] = {
                UICorner(6),
                new "Frame" { -- Disabled Frame
                    ZIndex = 2,
                    Visible = computed(function()
                        if not get(isEnabled)  then
                            return true
                        end
                        return false
                    end),
                    BackgroundTransparency = animate(function()
                        return get(isSelected) and 0.2 or 1
                    end,40,1),
                    BackgroundColor3 = theme.disabledBackground,
                    Size = UDim2.fromScale(1,1),

                    [children] = {
                        UICorner(6),
                        new "ImageLabel" { -- Icon
                            Size = UDim2.fromOffset(24,24),
                            AnchorPoint = Vector2.new(0,0.5),
                            Position = UDim2.new(0,5,0.5,0),
                            BackgroundTransparency = 1,
                            Image = icons.lock,
                            ImageColor3 = theme.disabledText,
                            ImageTransparency = selectedAnimation,
                        },
                        new "TextLabel" {
                            FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1,-24,0,18),
                            TextColor3 = theme.disabledText,
                            TextTransparency = selectedAnimation,
                            TextScaled = true,
                            AnchorPoint = Vector2.new(0,0.5),
                            Position = UDim2.new(0,29,0.5,0),
                            Text = disabledText,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            RichText = true,

                            [children] = {
                                UIPadding(0,5)
                            }
                        }
                    }
                },
                new "Frame" {
                    Size = UDim2.fromScale(1,1),
                    BackgroundTransparency = 1,
                    [children] = {
                        UIPadding(0,8),
                        new "TextLabel" { -- Title
                            FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
                            Size = UDim2.new(1,-16-16,0,18),
                            BackgroundTransparency = 1,
                            TextColor3 = theme.text,
                            TextScaled = true,
                            AnchorPoint = Vector2.new(0,0.5),
                            Position = UDim2.new(0,0,0.5,0),
                            Text = name,
                            TextTransparency = selectedAnimation,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            RichText = true
                        },
                        new "ImageLabel" { -- Icon
                            Size = UDim2.fromOffset(16,16),
                            AnchorPoint = Vector2.new(1,0.5),
                            Position = UDim2.new(1,0,0.5,0),
                            BackgroundTransparency = 1,
                            Image = icons.fingerprint,
                            ImageColor3 = theme.text2,
                            ImageTransparency = animate(function()
                                return get(isSelected) and 0.5 or 1
                            end, 40, 1)
                        }
                    }
                }
            }
        }

        if get(_visible) then
            visibleCount:set(get(visibleCount) + 1)
        end
        observe(_visible):onChange(function()
            if get(_visible) then
                visibleCount:set(get(visibleCount) + 1)
            else
                visibleCount:set(get(visibleCount) - 1)
            end
        end)

        local returnFunctions = {}
        function returnFunctions:SetName(newText)
            local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
            assert(_didPass, table.concat(_failedItems, "\n"))

            name:set(newText)
        end
        function returnFunctions:SetCallback(newFunction)
            local _didPass, _failedItems = typecheck({['SetCallback'] = newFunction}, {SetCallback = function()end})
            assert(_didPass, table.concat(_failedItems, "\n"))

            callback:set(newFunction)
        end
        function returnFunctions:Fire()
            task.spawn(get(callback))
        end
        function returnFunctions:Enable()
            isEnabled:set(true)
        end
        function returnFunctions:Disable()
            isEnabled:set(false)
        end
        function returnFunctions:Visible()
            _visible:set(true)
        end
        function returnFunctions:Invisible()
            _visible:set(false)
        end
        return returnFunctions
    end
    function returnTable:Visible()
        visible:set(true)
    end
    function returnTable:Invisible()
        visible:set(false)
    end
	return returnTable
end