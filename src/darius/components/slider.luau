local darius = script.Parent.Parent

return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
	local flagCreator = Bundles.flags
	local services = Bundles.services
		local UserInputService = services.UserInputService
		local RunService = services.RunService
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
		Name = "",
		DisabledText = "",
        FLAG = "",
        IsEnabled = false,
		Default = 0,
        Callback = function()end,
		Min = 0,
        Max = 0,
		DisplayAsPercent = false,
		DecimalPlace = 0,
		IgnoreConfig = true
	},{
		property.DisabledText and "" or "DisabledText",
		property.FLAG and "" or "FLAG",
		property.IsEnabled and "" or "IsEnabled",
		property.Default and "" or "Default",
		property.Min and "" or "Min",
		property.Max and "" or "Max",
		property.DisplayAsPercent and "" or "DisplayAsPercent",
		property.DecimalPlace and "" or "DecimalPlace",
		property.IgnoreConfig and "" or "IgnoreConfig"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local useConfig = data.find("useConfig")
	local searchText = data.find("searchText")
	local slider = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local callback = property.Callback
	local max = property.Max
	local min = property.Min
	local displayAsPercent = property.DisplayAsPercent or value(false)
	local roundTo = property.DecimalPlace or value(0)
	local isEnabled = property.IsEnabled or value(true)
	local disabledText = property.DisabledText or value("Component Disabled")
	local ignoreConfig = property.IgnoreConfig or value(false)
	local default = get(property.Default) and value(math.clamp(get(property.Default), get(min), get(max)))
	if not get(default) then
		default = value(get(min))
	end
	local flag = property.FLAG or value(slider.uid)
	local _flag
	if get(flag) ~= "" then
		_flag = flagCreator.register(get(flag), {
			percentageOf = value(get(min))
		},"slider", get(flag) == slider.uid)
		_flag.user.Value = get(_flag.status.percentageOf)
	end

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(slider.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(slider.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local function mapValue(Value, MinA, MaxA, MinB, MaxB)
		return (1 - ((Value - MinA) / (MaxA - MinA))) * MinB + ((Value - MinA) / (MaxA - MinA)) * MaxB
	end
	local function round(Value)
		if get(roundTo) == 0 then
			return math.floor(Value)
		end
		return tonumber(string.format('%.' .. get(roundTo) .. 'f', Value))
	end
	local percentage = value(0)

	observe(_flag.status.percentageOf):onChange(function()
		percentage:set(mapValue(get(_flag.status.percentageOf), get(min), get(max), 0, 1))
		if not get(isEnabled) then
			return
		end
		task.spawn(get(callback), get(_flag.status.percentageOf))
	end)
	local textbuttonRef = value()
	local textboxX = value(10)
	local textBoxRef = value()
	local button1Down = value(false)
	UserInputService.InputEnded:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and get(button1Down) then
			button1Down:set(false)
		end
	end)

	-- Slider

	new "Frame" {
		Parent = _parent,
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) then
				return false
			end
			return true
		end),
		Size = UDim2.new(1,0,0,36),
		BackgroundColor3 = theme.background2,
		BackgroundTransparency = animate(function()
			if get(isSelected) then
				return 0
			end
			return 1
		end,40,1),

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
						Text = computed(function()
							return get(disabledText)
						end),
						TextXAlignment = Enum.TextXAlignment.Left,
						RichText = true,

						[children] = {
							UIPadding(0,5)
						}
					}
				}
			},
			new "Frame" {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1,1),

				[children] = {
					UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,6)),
					UIPadding(0,8),
					new "TextLabel" {
						FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
						Size = UDim2.new(0.5,-6,0,18),
						BackgroundTransparency = 1,
						TextColor3 = theme.text,
						TextTransparency = selectedAnimation,
						TextScaled = true,
						AnchorPoint = Vector2.new(0,0.5),
						Position = UDim2.new(0,0,0.5,0),
						Text = name,
						TextXAlignment = Enum.TextXAlignment.Left,
						RichText = true
					},
					new "Frame" {
						Size = UDim2.new(0.5,0,1,0),
						AnchorPoint = Vector2.new(1,0.5),
						Position = UDim2.new(1,0,0.5,0),
						BackgroundTransparency = 1,

						[children] = {
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center, UDim.new(0,10)),
							new "Frame" {
								Size = UDim2.new(0.2,-5,1,0),
								BackgroundTransparency = 1,

								[children] = {
									UICorner(4),
									UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Right,VA.Center,UDim.new(0,1)),
									new "TextBox" {
										FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
										Size = UDim2.new(0,0,0,14),
										BackgroundTransparency = 1,
										TextColor3 = theme.text2,
										TextTransparency = selectedAnimation,
										TextScaled = true,
										ClearTextOnFocus = true,
										AnchorPoint = Vector2.new(1,0.5),
										Position = UDim2.new(1,0,0.5,0),
										Text = computed(function()
											if get(displayAsPercent) then
												return tostring(round(get(percentage) * 100)).."%"
											end
											return get(_flag.status.percentageOf) or ""
										end),
										TextXAlignment = Enum.TextXAlignment.Right,
										RichText = true,
										AutomaticSize = Enum.AutomaticSize.X,

										[onevent "Changed"] = function(changedProperty)
											local textbox = get(textBoxRef)
											if changedProperty == "AbsoluteSize" and textbox and textbox.AbsoluteSize then
												textboxX:set(textbox.AbsoluteSize.X)
											end
										end,

										[onevent "FocusLost"] = function()
											local textbox = get(textBoxRef)
											if tonumber(textbox.Text) then
												_flag.status.percentageOf:set(math.clamp(tonumber(textbox.Text), get(min), get(max)))
											else
												if get(displayAsPercent) then
													textbox.Text = tostring(round(get(percentage) * 100)).."%"
												end
												textbox.Text = get(_flag.status.percentageOf)
											end
										end,

										[ref] = textBoxRef,

										[children] = {
											UIPadding(0,5,0,5)
										}
									},
									new "Frame"{
										BackgroundColor3 = theme.text2,
										BackgroundTransparency = animate(function()
											if get(isSelected) then
												return 0.5
											end
											return 1
										end,40,1),
										Size = animate(function()
											return UDim2.fromOffset(get(textboxX),2)
										end,40,1),

										[children] = {
											UICorner(0,1)
										}
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
								Size = UDim2.new(0.8,-5,0.5,0),
								BackgroundTransparency = 1,

								[onevent "MouseButton1Down"] = function()
									button1Down:set(true)
								end,
								[onevent "TouchLongPress"] = function()
									button1Down:set(true)
								end,
								[onevent "InputBegan"] = function(input)
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and get(textbuttonRef) then
										local mPos = UserInputService:GetMouseLocation().X
										local gPos = get(textbuttonRef).Size.X.Offset
										local Diff = mPos - (get(textbuttonRef).AbsolutePosition.X + gPos)

										while get(button1Down) and task.wait() do
											local nMPos = UserInputService:GetMouseLocation().X
											local nX = math.clamp(gPos + (nMPos - mPos) + Diff, 0, get(textbuttonRef).AbsoluteSize.X)

											_flag.status.percentageOf:set(round(mapValue(nX, 0, get(textbuttonRef).AbsoluteSize.X, get(min), get(max))))
											RunService.RenderStepped:Wait()
										end
									end
								end,

								[ref] = textbuttonRef,

								[children] = {
									UIPadding(0,6),
									new "Frame" {
										AnchorPoint = Vector2.new(0,0.5),
										Position = UDim2.fromScale(0,0.5),
										Size = UDim2.new(1,0,0,4),
										BackgroundColor3 = theme.background,
										BackgroundTransparency = selectedAnimation,

										[children] = {
											UICorner(0,1)
										}
									},
									new "Frame" {
										AnchorPoint = Vector2.new(0,0.5),
										Position = UDim2.fromScale(0,0.5),
										BackgroundColor3 = theme.text,
										BackgroundTransparency = selectedAnimation,
										Size = animate(function()
											return UDim2.new(get(percentage),0,0,4)
										end,40,1),

										[children] = {
											UICorner(0,1),
											new "ImageLabel" {
												Image = icons.circle,
												BackgroundTransparency = 1,
												ImageColor3 = theme.selectedTab,
												ImageTransparency = selectedAnimation,
												Size = UDim2.fromOffset(18,18),
												Position = UDim2.new(1,0,0.5,0),
												AnchorPoint = Vector2.new(0.5,0.5),

												[children] = {
													new "Frame" {
														Position = UDim2.new(0.5,0,0.5,0),
														AnchorPoint = Vector2.new(0.5,0.5),
														Size = UDim2.fromOffset(2,8),
														BackgroundColor3 = theme.text,
														BackgroundTransparency = animate(function()
															if get(isSelected) then
																return 0.8
															end
															return 1
														end,40,1)
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
			}
		}
	}

	-- Closure

	if get(useConfig.boolean) and not get(ignoreConfig) then
		observe(_flag.file):onChange(function()
			local file = get(_flag.file)
			local noPercentageOf = true
			if file ~= nil then
				_flag.status.percentageOf:set(file)
				noPercentageOf = false
			end
			if noPercentageOf then
				_flag.status.percentageOf:set(get(default))
			end
		end)
		if _flag.private then
			_flag.status.percentageOf:set(get(default))
		end
	else
		_flag.status.percentageOf:set(get(default))
	end

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetValue(newValue)
		local _didPass, _failedItems = typecheck({['SetValue'] = newValue}, {SetValue = 0})
		assert(_didPass, table.concat(_failedItems, "\n"))

		_flag.status.percentageOf:set(math.clamp(newValue, get(min), get(max)))
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	return returnFunctions
end