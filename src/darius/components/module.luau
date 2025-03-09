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
    local drag = utilities.drag
    local references = utilities.references
    local connections = utilities.connections

	local simpleElements = require(darius.simpleElements)
	local UIListLayout = simpleElements.UIListLayout
	local UIPadding = simpleElements.UIPadding
	local UICorner = simpleElements.UICorner
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Name = {},
        Children = {}
	},{})
	assert(didPass, table.concat(failedItems, "\n"))

    -- Data

    local instanceName = data.find("instanceName")
    local absoluteOffset = data.find("absoluteOffset")

    -- Properties

    local name = property.Name
    local _children = value(property.Children)

    -- Variables

    local screenGui = references.get(get(instanceName.name))
    local down = value(false)

    -- Module

    local module
    module = new "TextButton" {
        Parent = screenGui,
        Size = UDim2.fromOffset(240,11),
        Position = UDim2.fromOffset(10,10 + get(absoluteOffset.number)),
        BackgroundTransparency = 1,

        [onevent "MouseButton1Down"] = function()
            down:set(true)
        end,

        [children] = {
            new "Frame" {
                Position = UDim2.new(0.5,-120,0,0),
                Size = UDim2.fromOffset(240,0),
                BackgroundColor3 = theme.background2,
                AutomaticSize = Enum.AutomaticSize.Y,

                [children] = {
                    UICorner(4),
                    UIPadding(8),
                    new "TextButton" {
                        AnchorPoint = Vector2.new(1,0),
                        Position = UDim2.fromScale(1,0),
                        Size = UDim2.fromOffset(32,32),
                        BackgroundColor3 = theme.selectedTab,

                        [onevent "Activated"] = function()
                            module:Destroy()
                        end,

                        [children] = {
                            UICorner(6),
                            new "ImageLabel" {
                                AnchorPoint = Vector2.new(0.5,0.5),
                                Position = UDim2.fromScale(0.5,0.5),
                                Size = UDim2.fromOffset(30,30),
                                BackgroundTransparency = 1,
                                Image = icons.close,
                                ImageColor3 = theme.red,
                                ImageTransparency = 0
                            }
                        }
                    },
                    new "Frame" {
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1,0,0,0),
                        AutomaticSize = Enum.AutomaticSize.Y,

                        [children] = {
                            UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,8)),
                            new "Frame" {
                                Size = animate(function()
                                    return get(down) and UDim2.new(0.4,0,0,6) or UDim2.new(0.25,0,0,6)
                                end,40,1),
                                BackgroundColor3 = theme.text2,
                                BackgroundTransparency = animate(function()
                                    return get(down) and 0 or 0.5
                                end,40,1),

                                [children] = {
                                    UICorner(6)
                                }
                            },
                            new "Frame" {
                                Size = UDim2.new(1,0,0,0),
                                BackgroundTransparency = 1,
                                AutomaticSize = Enum.AutomaticSize.Y,

                                [children] = {
                                    new "TextLabel" {
                                        Size = UDim2.new(1,-40,0,18),
                                        BackgroundTransparency = 1,
                                        FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
                                        TextColor3 = theme.text,
                                        TextScaled = true,
                                        Text = name,
                                        TextXAlignment = Enum.TextXAlignment.Left,
								        RichText = true
                                    },
                                    new "Frame" {
                                        Size = UDim2.new(1,0,0,0),
                                        Position = UDim2.fromOffset(0,26),
                                        BackgroundTransparency = 1,
                                        AutomaticSize = Enum.AutomaticSize.Y,

                                        [children] = _children
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

    }

    local connection, onEnd = drag(module, 15)
    local connection2 = onEnd:Connect(function()
        down:set(false)
    end)
    connections.add(connection)
    connections.add(connection2)
    module.Destroying:Once(function()
        connection:Disconnect()
        connection2:Disconnect()
    end)
    return module, function(...)
        _children:set(...)
    end
end