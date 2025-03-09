local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
	local flagCreator = Bundles.flags
	local services = Bundles.services
	local RunService = services.RunService
	local UserInputService = services.UserInputService
	local Fusion = Bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
		local value = Fusion.Value
		local observe = Fusion.Observer
		local onevent = Fusion.OnEvent
		local computed = Fusion.Computed
		local ref = Fusion.Ref

	local utilities = require(darius.utilities)
	local get = utilities.get
	local animate = utilities.animate
	local typecheck = utilities.typecheck
	local customFont = utilities.customFont
	local randomString = utilities.randomString
	local connections = utilities.connections

	local simpleElements = require(darius.simpleElements)
	local UIListLayout = simpleElements.UIListLayout
	local UIPadding = simpleElements.UIPadding
	local UITextSizeConstraint = simpleElements.UITextSizeConstraint
	local UICorner = simpleElements.UICorner
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Name = "",
		DisabledText = "",
        IsEnabled = false,
        Callback = function()end,
		FLAG = "",
		Color = Color3.new(),
		Transparency = 0,
		IgnoreConfig = true
	},{
		property.IsEnabled and "" or "IsEnabled",
		property.DisabledText and "" or "DisabledText",
		property.FLAG and "" or "FLAG",
		property.Color and "" or "Color",
		property.Transparency and "" or "Transparency",
		property.IgnoreConfig and "" or "IgnoreConfig"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
	local useConfig = data.find("useConfig")
	local offset = data.find("absoluteOffset")
	local currentPicker = data.find("currentPicker")
	local colorpicker = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local callback = property.Callback
	local isEnabled = property.IsEnabled or value(true)
	local disabledText = property.DisabledText or value("Component Disabled")
	local _color = property.Color or value(Color3.new(1))
	local ignoreConfig = property.IgnoreConfig or value(false)
	local _transparency = property.Transparency or value(0)
	local flag = property.FLAG or value(colorpicker.uid)
	local _flag
	if get(flag) ~= "" then
		_flag = flagCreator.register(get(flag), {
			color = value(Color3.new(1)),
			transparency = value(0)
		},"colorpicker", get(flag) == colorpicker.uid)
		_flag.user.Value = {get(_flag.status.color),get(_flag.status.transparency)}
	end
	local color = _flag.status.color
	local transparency = _flag.status.transparency

	observe(color):onChange(function()
		if get(isEnabled) then
			task.spawn(get(callback), get(color), get(transparency))
		end
	end)
	observe(transparency):onChange(function()
		if get(isEnabled) then
			task.spawn(get(callback), get(color), get(transparency))
		end
	end)

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(colorpicker.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(colorpicker.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)

	local hexCodeTextBox = value()
	local hexCodeLength = value(0)

	local HSVTextBox = value()
	local HSVLength = value(0)

	local RGBTextBox = value()
	local RGBLength = value(0)

	local saturationValue = value()
	local saturationValueDown = value(false)

	local hue = value()
	local hueDown = value(false)

	local transparencyRef = value()
	local transparencyDown = value(false)

	local module, setChildren

	local hueAmount = value(0)
	local saturationAmount = value(0)
	local valueAmount = value(0)

	-- Colorpicker

	local function createColorPickerModule()
		return {
			Name = name,
			Children = {
				UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,5)),
				new "TextButton" { -- Saturation and Value
					Size = UDim2.fromOffset(224,224),

					[ref] = saturationValue,

					[onevent "InputBegan"] = function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						saturationValueDown:set(true)
						local _changed
						_changed = input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End or input.UserInputState.Cancel then
								saturationValueDown:set(false)
								_changed:Disconnect()
							end
						end)
					end,

					[children] = {
						new "UIGradient" {
							Color = computed(function()
								return ColorSequence.new {
									ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
									ColorSequenceKeypoint.new(1, Color3.fromHSV(get(hueAmount),1,1)),
								}
							end)
						},
						new "Frame" {
							Size = UDim2.fromScale(1,1),

							[children] = {
								new "UIGradient" {
									Rotation = 270,
									Color = ColorSequence.new {
										ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
										ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0)),
									},
									Transparency = computed(function()
										return NumberSequence.new {
											NumberSequenceKeypoint.new(0, 0),
											NumberSequenceKeypoint.new(1, 1),
											}
									end)
								}
							}
						},
						new "ImageLabel" {
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5,0.5),
							BackgroundTransparency = 1,
							Image = icons.circle,
							Size = UDim2.fromOffset(10,10),
							ImageColor3 = computed(function()
								return Color3.fromHSV(0,0,1-get(valueAmount))
							end),
							Position = computed(function()
								return UDim2.fromScale(get(saturationAmount), 1-get(valueAmount))
							end),

							[children] = {
								new "ImageLabel" {
									ZIndex = 2,
									AnchorPoint = Vector2.new(0.5,0.5),
									BackgroundTransparency = 1,
									Image = icons.circle,
									Size = UDim2.fromScale(0.9,0.9),
									ImageColor3 = computed(function()
										return Color3.fromHSV(get(hueAmount),1,1)
									end),
									Position = UDim2.fromScale(0.5,0.5)

								}
							}
						}
					}
				},
				new "TextButton" { -- Hue
					Size = UDim2.new(1,0,0,24),

					[onevent "InputBegan"] = function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						hueDown:set(true)
						local _changed
						_changed = input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End or input.UserInputState.Cancel then
								hueDown:set(false)
								_changed:Disconnect()
							end
						end)
					end,

					[ref] = hue,

					[children] = {
						new "UIGradient" {
							Color = ColorSequence.new {
								ColorSequenceKeypoint.new(0, Color3.fromHSV(1, 1, 1)),
								ColorSequenceKeypoint.new(0.1, Color3.fromHSV(0.9, 1, 1)),
								ColorSequenceKeypoint.new(0.2, Color3.fromHSV(0.8, 1, 1)),
								ColorSequenceKeypoint.new(0.3, Color3.fromHSV(0.7, 1, 1)),
								ColorSequenceKeypoint.new(0.4, Color3.fromHSV(0.6, 1, 1)),
								ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
								ColorSequenceKeypoint.new(0.6, Color3.fromHSV(0.4, 1, 1)),
								ColorSequenceKeypoint.new(0.7, Color3.fromHSV(0.3, 1, 1)),
								ColorSequenceKeypoint.new(0.8, Color3.fromHSV(0.2, 1, 1)),
								ColorSequenceKeypoint.new(0.9, Color3.fromHSV(0.1, 1, 1)),
								ColorSequenceKeypoint.new(1, Color3.fromHSV(0, 1, 1)),
							}
						},
						new "Frame" {
							AnchorPoint = Vector2.new(0,0.5),
							BackgroundColor3 = theme.colorpickerBar,
							Size = UDim2.new(0,2,1,0),
							Position = computed(function()
								local _hue = get(color):ToHSV()
								return UDim2.fromScale(1 - get(hueAmount),0.5)
							end)
						}
					}
				},
				new "ImageButton" { -- Transparency
					ZIndex = 2,
					Size = UDim2.new(1,0,0,24),
					BackgroundTransparency = 1,
					Image = "rbxassetid://15612242981",
					ScaleType = Enum.ScaleType.Crop,

					[onevent "InputBegan"] = function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						transparencyDown:set(true)
						local _changed
						_changed = input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End or input.UserInputState.Cancel then
								transparencyDown:set(false)
								_changed:Disconnect()
							end
						end)
					end,

					[ref] = transparencyRef,

					[children] = {
						new "Frame" {
							Size = UDim2.fromScale(1,1),

							[children] = {
								new "UIGradient" {
									Color = computed(function()
										return ColorSequence.new {
											ColorSequenceKeypoint.new(0, get(color)),
											ColorSequenceKeypoint.new(1, get(color)),
											}
									end),
									Transparency = computed(function()
										return NumberSequence.new {
											NumberSequenceKeypoint.new(0, 0),
											NumberSequenceKeypoint.new(1, 1),
											}
									end)
								}
							}
						},
						new "Frame" {
							AnchorPoint = Vector2.new(0,0.5),
							BackgroundColor3 = theme.colorpickerBar,
							Size = UDim2.new(0,2,1,0),
							Position = computed(function()
								return UDim2.fromScale(get(transparency),0.5)
							end)
						}
					}
				},
				new "Frame" { -- RGB
					Size = UDim2.new(1,0,0,16),
					BackgroundTransparency = 1,

					[children] = {
						UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,4)),
						{
							new "TextLabel" {
								Size = UDim2.new(0,0,0,16),
								AutomaticSize = Enum.AutomaticSize.X,
								Text = "RGB:",
								TextColor3 = theme.text2,
								BackgroundTransparency = 1,
								TextSize = 16,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								TextXAlignment = Enum.TextXAlignment.Right
							},
							new "TextBox" {
								Name = randomString(8),
								BackgroundTransparency = 1,
								Size = UDim2.new(0,42,0,16),
								PlaceholderText = "RGB",
								PlaceholderColor3 = theme.text2,
								AutomaticSize = Enum.AutomaticSize.X,
								TextColor3 = theme.text,
								Text = computed(function()
									local a = {get(color).R,get(color).G,get(color).B}
									for i,v in a do
										a[i] = math.floor(math.clamp(v*255,0,255))
									end
									return table.concat(a, ", ")
								end),
								TextScaled = true,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								ClearTextOnFocus = true,
								TextXAlignment = Enum.TextXAlignment.Right,

								[ref] = RGBTextBox,

								[onevent "Changed"] = function(changedProperty)
									local _RGBTextBox = get(RGBTextBox)
									if changedProperty == "TextBounds" and _RGBTextBox and _RGBTextBox.TextBounds then
										RGBLength:set(_RGBTextBox.TextBounds.X)
									end
								end,

								[onevent "FocusLost"] = function()
									local _RGBTextBox = get(RGBTextBox)
									local _rgb = _RGBTextBox.Text:gsub(" ","")
									local a = {get(color).R,get(color).G,get(color).B}
									for i,v in a do
										a[i] = math.floor(math.clamp(v*255,0,255))
									end
									local _old = table.concat(a, ", ")
									local s,result = pcall(function()
										local b = string.split(_rgb, ",")
										table.foreach(b, function(i,v)
											if not tonumber(v) then
												return nil
											end
											b[i] = math.clamp(v, 0, 255)
										end)
										return Color3.fromRGB(b[1],b[2],b[3])
									end)
									if s and result then
										color:set(result)
										hueAmount:set(({get(color):ToHSV()})[1])
										saturationAmount:set(({get(color):ToHSV()})[2])
										valueAmount:set(({get(color):ToHSV()})[3])
									else
										_RGBTextBox.Text = _old
									end
								end,

								[children] = {
									UITextSizeConstraint(1,16),
									new "UISizeConstraint" {
										MaxSize = Vector2.new(110,16),
										MinSize = Vector2.new(42,16)
									},
									new "Frame"{
										AnchorPoint = Vector2.new(1,0.5),
										BackgroundColor3 = theme.text2,
										Position = UDim2.fromScale(1,1),
										Size = animate(function()
											return UDim2.fromOffset(math.clamp(get(RGBLength),0,110),2)
										end,40,1),

										[children] = {
											UICorner(0,1)
										}
									}
								}
							}
						}
					}
				},
				new "Frame" { -- HSV
					Size = UDim2.new(1,0,0,16),
					BackgroundTransparency = 1,

					[children] = {
						UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,5)),
						{
							new "TextLabel" {
								Size = UDim2.new(0,0,0,16),
								AutomaticSize = Enum.AutomaticSize.X,
								Text = "HSV:",
								TextColor3 = theme.text2,
								BackgroundTransparency = 1,
								TextSize = 16,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								TextXAlignment = Enum.TextXAlignment.Right
							},
							new "TextBox" {
								Name = randomString(8),
								BackgroundTransparency = 1,
								Size = UDim2.new(0,36,0,16),
								AutomaticSize = Enum.AutomaticSize.X,
								PlaceholderText = "HSV",
								PlaceholderColor3 = theme.text2,
								TextColor3 = theme.text,
								Text = computed(function()
									local a = {get(color):ToHSV()}
									for i,v in a do
										a[i] = math.floor(v*100)/100
									end
									return table.concat(a, ", ")
								end),
								TextScaled = true,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								ClearTextOnFocus = true,
								TextXAlignment = Enum.TextXAlignment.Right,

								[ref] = HSVTextBox,

								[onevent "Changed"] = function(changedProperty)
									local _HSVTextBox = get(HSVTextBox)
									if changedProperty == "TextBounds" and _HSVTextBox and _HSVTextBox.TextBounds then
										HSVLength:set(_HSVTextBox.TextBounds.X)
									end
								end,

								[onevent "FocusLost"] = function()
									local _HSVTextBox = get(HSVTextBox)
									local _hsv = _HSVTextBox.Text:gsub(" ","")
									local a = {get(color):ToHSV()}
									for i,v in a do
										a[i] = math.floor(v*100)/100
									end
									local _old = table.concat(a, ", ")
									local s,result = pcall(function()
										local b = string.split(_hsv, ",")
										table.foreach(b, function(i,v)
											if not tonumber(v) then
												return nil
											end
										end)
										return Color3.fromHSV(unpack(b))
									end)
									if s and result then
										color:set(result)
										hueAmount:set(({get(color):ToHSV()})[1])
										saturationAmount:set(({get(color):ToHSV()})[2])
										valueAmount:set(({get(color):ToHSV()})[3])
									else
										_HSVTextBox.Text = _old
									end
								end,

								[children] = {
									UITextSizeConstraint(1,16),
									new "UISizeConstraint" {
										MaxSize = Vector2.new(110,16),
										MinSize = Vector2.new(36,16)
									},
									new "Frame"{
										AnchorPoint = Vector2.new(1,0.5),
										BackgroundColor3 = theme.text2,
										Position = UDim2.fromScale(1,1),
										Size = animate(function()
											return UDim2.fromOffset(math.clamp(get(HSVLength),36,110),2)
										end,40,1),

										[children] = {
											UICorner(0,1)
										}
									}
								}
							}
						}
					}
				}
			}
		}
	end
	observe(isEnabled):onChange(function()
		if not get(isEnabled) and typeof(module) == "Instance" then
			module:Destroy()
		end
	end)

	new "Frame" {
		Interactable = computed(function()
			if not get(isEnabled) then
				return false
			end
			return get(isSelected)
		end),
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) then
				return false
			end
			return true
		end),
		Parent = _parent,
		Size = UDim2.new(1,0,0,36),
		BackgroundTransparency = 1,
		BackgroundColor3 = theme.background2,

		[children] = {
			UICorner(6),
			new "Frame" { -- Disabled Frame
				ZIndex = 3,
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
					UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Bottom, UDim.new(0,3)),
					new "Frame" {
						Size = UDim2.new(1,-103,1,0),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[children] = {
							UIPadding(9,8),
							UICorner(6),
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Top),
							new "TextLabel" {
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								Size = UDim2.new(1,0,0,18),
								BackgroundTransparency = 1,
								TextColor3 = theme.text,
								TextScaled = true,
								AnchorPoint = Vector2.new(0,0.5),
								Position = UDim2.new(0,0,0.5,0),
								Text = name,
								TextTransparency = selectedAnimation,
								TextXAlignment = Enum.TextXAlignment.Left,
								RichText = true
							}
						}
					},
					new "TextButton" {
						Interactable = computed(function()
							if not get(isEnabled) then
								return false
							end
							return get(isSelected)
						end),
						Size = UDim2.new(0,100,0,36),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[onevent "Activated"] = function()
							if typeof(get(currentPicker.module)) == "Instance" then
								get(currentPicker.module):Destroy()
							end
							module, setChildren = require(script.Parent.module)(createColorPickerModule())
							currentPicker:update("module", module)
						end,

						[children] = {
							UIPadding(0,8),
							UICorner(6),
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Right,VA.Center,UDim.new(0,5)),
							new "Frame" {
								Size = UDim2.new(1,-29,0,36),
								BackgroundTransparency = 1,

								[children] = {
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Right,VA.Center,UDim.new(0,4)),
									new "TextBox" {
										Interactable = computed(function()
											if not get(isEnabled) then
												return false
											end
											return get(isSelected)
										end),
										Name = randomString(8),
										BackgroundTransparency = 1,
										Size = UDim2.new(1,0,0,16),
										PlaceholderText = "Hex",
										PlaceholderColor3 = theme.text2,
										TextColor3 = theme.text,
										TextTransparency = selectedAnimation,
										Text = computed(function()
											return "#"..get(color):ToHex()
										end),
										TextScaled = true,
										FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
										ClearTextOnFocus = true,
										TextXAlignment = Enum.TextXAlignment.Right,

										[onevent "Changed"] = function(changedProperty)
											local _hexCodeText = get(hexCodeTextBox)
											if changedProperty == "TextBounds" and _hexCodeText and _hexCodeText.TextBounds then
												hexCodeLength:set(_hexCodeText.TextBounds.X)
											end
										end,

										[onevent "FocusLost"] = function()
											local _textBox = get(hexCodeTextBox)
											local _hexCode = _textBox.Text:gsub("[^%w#]", "")
											if not string.find(_hexCode, "#") then
												_hexCode = "#".._hexCode
											end
											if string.len(_hexCode) ~= 7 then
												_textBox.Text = "#"..get(color):ToHex()
											else
												local s,result = pcall(function()
													return Color3.fromHex(_hexCode)
												end)
												if s then
													color:set(result)
												else
													_textBox.Text = "#"..get(color):ToHex()
												end
											end
										end,

										[ref] = hexCodeTextBox,

										[children] = {
											UITextSizeConstraint(1,16),
											new "Frame"{
												AnchorPoint = Vector2.new(1,0.5),
												BackgroundColor3 = theme.text2,
												BackgroundTransparency = animate(function()
													if get(isSelected) then
														return 0.5
													end
													return 1
												end,40,1),
												Position = UDim2.fromScale(1,1),
												Size = animate(function()
													return UDim2.fromOffset(math.clamp(get(hexCodeLength),0,140-29-13),2)
												end,40,1),

												[children] = {
													UICorner(0,1)
												}
											}
										}
									}
								}
							},
							new "ImageLabel" {
								Size = UDim2.fromOffset(24,24),
								Image = icons.paint,
								ImageColor3 = color,
								BackgroundTransparency = 1,
								ImageTransparency = animate(function()
									return not get(isSelected) and 1 or get(transparency)
								end,40,1),

								[children] = {
									UICorner(6)
								}
							}
						}
					}
				}
			}
		}
	}

	connections.add(RunService.Heartbeat:Connect(function()
		if get(saturationValueDown) then
			local _saturationValue = get(saturationValue)
			local newSV = UserInputService:GetMouseLocation() - _saturationValue.AbsolutePosition - Vector2.new(0,get(offset.number))
			newSV = Vector2.new(math.clamp(newSV.X, 0, _saturationValue.AbsoluteSize.X), math.clamp(newSV.Y, 0, _saturationValue.AbsoluteSize.Y))
			saturationAmount:set(newSV.X/_saturationValue.AbsoluteSize.X)
			valueAmount:set((_saturationValue.AbsoluteSize.Y - newSV.Y)/_saturationValue.AbsoluteSize.Y)
			color:set(Color3.fromHSV(get(hueAmount), get(saturationAmount), get(valueAmount)))
		end
		if get(hueDown) then
			local _hue = get(hue)
			local newHue = UserInputService:GetMouseLocation() - _hue.AbsolutePosition - Vector2.new(0,get(offset.number))
			newHue = Vector2.new(math.clamp(newHue.X, 0, _hue.AbsoluteSize.X), 0)
			hueAmount:set((_hue.AbsoluteSize.X - newHue.X)/_hue.AbsoluteSize.X)
			color:set(Color3.fromHSV(get(hueAmount), get(saturationAmount), get(valueAmount)))
		end
		if get(transparencyDown) then
			local __transparency = get(transparencyRef)
			local newTransparency = UserInputService:GetMouseLocation() - __transparency.AbsolutePosition - Vector2.new(0,get(offset.number))
			newTransparency = Vector2.new(math.clamp(newTransparency.X, 0, __transparency.AbsoluteSize.X),0)
			transparency:set(newTransparency.X/__transparency.AbsoluteSize.X)
		end
	end))

	-- Closure

	if get(useConfig.boolean) and not get(ignoreConfig) then
		observe(_flag.file):onChange(function()
			local file = get(_flag.file)
			local noColor = true
			local noTransparency = true
			if file.color ~= nil then
				local a = string.split(file.color:gsub(" ", ""), ",")
				table.foreach(a, function(i,v)
					a[i] = tonumber(v)
				end)
				_flag.status.color:set(Color3.new(unpack(a)))
				noColor = false
			end
			if file.transparency ~= nil then
				_flag.status.transparency:set(tonumber(file.transparency))
				noTransparency = false
			end
			if noColor then
				_flag.status.color:set(get(_color))
			end
			if noTransparency then
				_flag.status.transparency:set(get(_transparency))
			end
			hueAmount:set(({get(color):ToHSV()})[1])
			saturationAmount:set(({get(color):ToHSV()})[2])
			valueAmount:set(({get(color):ToHSV()})[3])
		end)
		if _flag.private then
			_flag.status.color:set(get(_color))
			_flag.status.transparency:set(get(_transparency))
		end
	else
		_flag.status.color:set(get(_color))
		_flag.status.transparency:set(get(_transparency))
	end

	hueAmount:set(({get(color):ToHSV()})[1])
	saturationAmount:set(({get(color):ToHSV()})[2])
	valueAmount:set(({get(color):ToHSV()})[3])

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetColor(newColor)
		local _didPass, _failedItems = typecheck({['SetColor'] = newColor}, {SetColor = Color3.new()})
		assert(_didPass, table.concat(_failedItems, "\n"))

		_flag.status.color:set(newColor)
	end
	function returnFunctions:SetTransparency(newTransparency)
		local _didPass, _failedItems = typecheck({['SetTransparency'] = newTransparency}, {SetTransparency = 0})
		assert(_didPass, table.concat(_failedItems, "\n"))

		_flag.status.transparency:set(newTransparency)
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	return returnFunctions
end