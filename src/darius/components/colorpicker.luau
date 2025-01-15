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
		local ref = Fusion.Ref

	local utilities = require(darius.utilities)
	local get = utilities.get
	local animate = utilities.animate
	local typecheck = utilities.typecheck
	local customFont = utilities.customFont
	local randomString = utilities.randomString

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
        Callback = function()end
	},{
		property.IsEnabled and "" or "IsEnabled",
		property.DisabledText and "" or "DisabledText"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
	local button = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local callback = property.Callback
	local isEnabled = property.IsEnabled or value(true)
	local disabledText = property.DisabledText or value("Component Disabled")

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(button.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(button.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local dropped = value(false)
	local transparency = value(false)
	local droppedFinished = value(false)

	local color = value(Color3.fromRGB(255,0,0))
	local hexCodeTextBox = value()
	local hexCodeLength = value(0)

	local HSVTextBox = value()
	local HSVLength = value(0)

	local RGBTextBox = value()
	local RGBLength = value(0)

	-- Button

	new "TextButton" {
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
		Size = animate(function()
			return get(dropped) and UDim2.new(1,0,0,156) or UDim2.new(1,0,0,36)
		end,40,1),
		BackgroundTransparency = animate(function()
			if not get(isSelected) then
				return 1
			end
			return get(transparency) and 0 or 1
		end,40,1),
		BackgroundColor3 = theme.background2,

		[onevent "Activated"] = function()
			if get(transparency) then
				droppedFinished:set(false)
				task.wait(0.15)
				dropped:set(not get(dropped))
				task.wait(0.15)
				transparency:set(not get(transparency))
			else
				transparency:set(not get(transparency))
				task.wait(0.15)
				dropped:set(not get(dropped))
				task.wait(0.15)
				droppedFinished:set(true)
			end
		end,

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
				ZIndex = 2,
				Size = UDim2.fromScale(1,1),
				BackgroundTransparency = 1,

				[children] = {
					UIPadding(36,0,0,0),
					UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Left,VA.Top,UDim.new(0,8)),
					new "Frame" {
						Visible = dropped,
						Size = UDim2.new(1,0,1,-44),
						BackgroundTransparency = 1,

					},
					new "Frame" {
						Size = UDim2.new(1,-136,0,36),
						BackgroundTransparency = 1,

						[children] = {
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Right,VA.Center,UDim.new(0,8)),
							new "Frame" {
								Size = UDim2.fromOffset(0,32),
								AutomaticSize = Enum.AutomaticSize.X,
								BackgroundTransparency = 1,

								[children] = {
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Center,VA.Center,UDim.new(0,4)),
									{
										new "TextLabel" {
											Size = UDim2.new(0,0,0,16),
											AutomaticSize = Enum.AutomaticSize.X,
											Text = "RGB:",
											BackgroundTransparency = 1,
											TextSize = 16,
											FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
											TextXAlignment = Enum.TextXAlignment.Right,
											TextTransparency = animate(function()
												if not get(isSelected) then
													return 1
												end
												return get(droppedFinished) and 0 or 1
											end,40,1)
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
											TextTransparency = animate(function()
												if not get(isSelected) then
													return 1
												end
												return get(droppedFinished) and 0 or 1
											end,40,1),
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
													BackgroundTransparency = animate(function()
														if not get(isSelected) then
															return 1
														end
														return get(droppedFinished) and 0.5 or 1
													end,40,1),
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
							new "Frame" {
								Size = UDim2.fromOffset(0,32),
								AutomaticSize = Enum.AutomaticSize.X,
								BackgroundTransparency = 1,

								[children] = {
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Center,VA.Center,UDim.new(0,5)),
									{
										new "TextLabel" {
											Size = UDim2.new(0,0,0,16),
											AutomaticSize = Enum.AutomaticSize.X,
											Text = "HSV:",
											BackgroundTransparency = 1,
											TextSize = 16,
											FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
											TextXAlignment = Enum.TextXAlignment.Right,
											TextTransparency = animate(function()
												if not get(isSelected) then
													return 1
												end
												return get(droppedFinished) and 0 or 1
											end,40,1)
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
											TextTransparency = animate(function()
												if not get(isSelected) then
													return 1
												end
												return get(droppedFinished) and 0 or 1
											end,40,1),
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
													BackgroundTransparency = animate(function()
														if not get(isSelected) then
															return 1
														end
														return get(droppedFinished) and 0.5 or 1
													end,40,1),
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
						Size = UDim2.new(0,100,0,36),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[children] = {
							UIPadding(0,8),
							UICorner(6),
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Right,VA.Center,UDim.new(0,5)),
							new "Frame" {
								Size = UDim2.new(1,-29,0,36),
								BackgroundTransparency = 1,

								[children] = {
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Right,VA.Center,UDim.new(0,4)),
									new "TextLabel" {
										Visible = dropped,
										Size = UDim2.new(0,32,0,16),
										Text = "Hex:",
										BackgroundTransparency = 1,
										TextScaled = true,
										FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
										TextXAlignment = Enum.TextXAlignment.Right,
										TextTransparency = animate(function()
											if not get(isSelected) then
												return 1
											end
											return get(droppedFinished) and 0 or 1
										end,40,1)
									},
									new "TextBox" {
										Name = randomString(8),
										BackgroundTransparency = 1,
										Size = computed(function()
											return get(dropped) and UDim2.new(1,0,0,16) or UDim2.new(1,0,0,16)
										end),
										PlaceholderText = "Hex",
										PlaceholderColor3 = theme.text2,
										TextColor3 = theme.text,
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
								BackgroundTransparency = computed(function()
									return get(isSelected) and 1 or 1
								end),

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
	return returnFunctions
end