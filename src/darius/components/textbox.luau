local darius = script.Parent.Parent
return function(property)
	local bundles = require(darius.Bundles)
	local data = bundles.data
	local theme = bundles.themeSystem
	local icons = bundles.icons
	local flagCreator = bundles.flags
	local Fusion = bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
		local value = Fusion.Value
		local computed = Fusion.Computed
		local observe = Fusion.Observer
		local ref = Fusion.Ref
		local onevent = Fusion.OnEvent

	local utilities = require(darius.utilities)
	local get = utilities.get
	local animate = utilities.animate
	local customFont = utilities.customFont
	local typecheck = utilities.typecheck

	local simpleElements = require(darius.simpleElements)
	local UIPadding = simpleElements.UIPadding
	local UICorner = simpleElements.UICorner
	local UITextSizeConstraint = simpleElements.UITextSizeConstraint
	local UIListLayout = simpleElements.UIListLayout
	local SO = Enum.SortOrder
	local VA = Enum.VerticalAlignment
	local HA = Enum.HorizontalAlignment
	local FD = Enum.FillDirection

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Name = "",
        Placeholder = "",
		DisabledText = "",
        ClearTextOnFocus = false,
        OnlyNumbers = true,
        OnLeave = true,
        Default = "",
        FLAG = "",
        IsEnabled = false,
        Callback = function()end,
		IgnoreConfig = true
	},{
		property.Placeholder and "" or "Placeholder",
		property.IsEnabled and "" or "IsEnabled",
		property.ClearTextOnFocus and "" or "ClearTextOnFocus",
		property.OnlyNumbers and "" or "OnlyNumbers",
		property.OnLeave and "" or "OnLeave",
		property.Default and "" or "Default",
		property.FLAG and "" or "FLAG",
		property.DisabledText and "" or "DisabledText",
		property.IgnoreConfig and "" or "IgnoreConfig"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local useConfig = data.find("useConfig")
	local searchText = data.find("searchText")
	local textbox = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local callback = property.Callback
	local isEnabled = property.IsEnabled or value(true)
	local disabledText = property.DisabledText or value("Component Disabled")
	local onlyNumbers = property.OnlyNumbers or value(false)
	local default = property.Default or value("")
	local onLeave = property.OnLeave or value(false)
	local clearTextOnFocus = property.ClearTextOnFocus or value(false)
	local ignoreConfig = property.IgnoreConfig or value(false)
	local placeHolder = property.Placeholder or value("")
	local flag = property.FLAG or value(textbox.uid)
	local _flag
	if get(flag) ~= "" then
		_flag = flagCreator.register(get(flag), {
			correctText = value(""),
		},"textbox", get(flag) == textbox.uid)
		_flag.user.Value = get(_flag.status.correctText)
	end

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(textbox.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(textbox.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local textboxRef = value()
	local focused = value(false)
	local correctText = value("")
	local lastCorrectText = value(get(_flag.status.correctText))
	local lastCalled = value("")
	local largerThanBox = value(false)

	observe(correctText):onChange(function()
		if get(onlyNumbers) then
			if tonumber(get(correctText)) or get(correctText) == "" then
				lastCorrectText:set(get(correctText))
			end
		else
			lastCorrectText:set(get(correctText))
		end
		local textBox = get(textboxRef)
		textBox.Text = get(lastCorrectText)
		if get(onLeave) then
			return
		end
		if get(onlyNumbers) then
			if (tonumber(get(correctText)) or get(correctText) == "") and get(lastCalled) ~= get(correctText) then
				task.spawn(get(callback), get(correctText))
				_flag.status.correctText:set(get(correctText))
				lastCalled:set(get(correctText))
			end
		else
			if get(lastCalled) == get(correctText) then
				return
			end
			task.spawn(get(callback), get(correctText))
			_flag.status.correctText:set(get(correctText))
			lastCalled:set(get(correctText))
		end
	end)
	observe(focused):onChange(function()
		if get(onLeave) and not get(focused) then
			if get(onlyNumbers) then
				if (tonumber(get(correctText)) or get(correctText) == "") and get(lastCalled) ~= get(correctText) then
					task.spawn(get(callback), get(correctText))
					_flag.status.correctText:set(get(correctText))
					lastCalled:set(get(correctText))
				end
			else
				if get(lastCalled) == get(correctText) then
					return
				end
				task.spawn(get(callback), get(correctText))
				_flag.status.correctText:set(get(correctText))
				lastCalled:set(get(correctText))
			end
		end
	end)

	-- TextBox

	new "Frame" {
		Parent = _parent,
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) then
				return false
			end
			return true
		end),
		BackgroundTransparency = 1,
		Size = UDim2.new(1,0,0,36),

		[children] = {
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
				Size = UDim2.fromScale(1,1),
				BackgroundTransparency = 1,

				[children] = {
					UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,3)),
					new "Frame" {
						Size = UDim2.new(0.65,-3,1,0),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[children] = {
							UICorner(6),
							UIPadding(0,6),
							new "TextLabel" { -- Title
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
						Size = UDim2.fromScale(0.35,1),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[onevent "Activated"] = function()
							local _textbox = get(textboxRef)
							if _textbox then
								_textbox:CaptureFocus()
							end
						end,

						[children] = {
							UICorner(6),
							UIPadding(0,6),
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,5)),
							new "ImageLabel" {
								ZIndex = 0,
								Size = UDim2.fromOffset(20,20),
								BackgroundTransparency = 1,
								Image = icons.input,
								ImageColor3 = theme.text2,
								ImageTransparency = selectedAnimation
							},
							new "TextBox" {
								Interactable = computed(function()
									if not get(isEnabled) then
										return false
									end
									return get(isSelected)
								end),
								ClipsDescendants = true,
								Size = UDim2.new(1,-25,1,0),
								BackgroundTransparency = 1,
								PlaceholderText = placeHolder,
								PlaceholderColor3 = theme.text2,
								TextColor3 = theme.text,
								TextSize = 16,
								TextXAlignment = Enum.TextXAlignment.Left,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								Text = lastCorrectText,
								TextTransparency = selectedAnimation,
								ClearTextOnFocus = clearTextOnFocus,

								[ref] = textboxRef,

								[onevent "Changed"] = function(changedProperty)
									local _textbox = get(textboxRef)
									if _textbox.TextBounds.X > _textbox.AbsoluteSize.X then
										largerThanBox:set(true)
									end
									if _textbox and _textbox.Text and changedProperty == "Text" then
										correctText:set(_textbox.Text)
									end
								end,

								[onevent "Focused"] = function()
									focused:set(true)
								end,
								[onevent "FocusLost"] = function()
									focused:set(false)
								end,

								[children] = {
									new "Frame" {
										Size = UDim2.fromScale(1,1),
										BackgroundTransparency = 0,

										[children] = {
											new "UIGradient" {
												Rotation = 0,
												Color = animate(function()
													return ColorSequence.new {
														ColorSequenceKeypoint.new(0, theme.get("background2")),
														ColorSequenceKeypoint.new(1, theme.get("background2"))
													}
												end,40,1),
												Transparency = animate(function()
													if not get(isSelected) then
														return NumberSequence.new {
															NumberSequenceKeypoint.new(0, 1),
															NumberSequenceKeypoint.new(0.5, 1),
															NumberSequenceKeypoint.new(1, 1)
														}
													end
													if get(largerThanBox) then
														if get(focused) then
															return NumberSequence.new {
																NumberSequenceKeypoint.new(0, 0),
																NumberSequenceKeypoint.new(0.1, 1),
																NumberSequenceKeypoint.new(1, 1)
															}
														else
															return NumberSequence.new {
																NumberSequenceKeypoint.new(0, 1),
																NumberSequenceKeypoint.new(0.9, 1),
																NumberSequenceKeypoint.new(1, 0)
															}
														end
													end
													return NumberSequence.new {
														NumberSequenceKeypoint.new(0, 1),
														NumberSequenceKeypoint.new(1, 1)
													}
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

	-- Closure

	if get(useConfig.boolean) and not get(ignoreConfig) then
		observe(_flag.file):onChange(function()
			local file = get(_flag.file)
			local noCorrectText = true
			if file ~= nil then
				if get(onLeave) then
					focused:set(true)
				end
				correctText:set(file)
				if get(onLeave) then
					focused:set(false)
				end
				noCorrectText = false
			end
			if noCorrectText then
				if get(onLeave) then
					focused:set(true)
				end
				correctText:set(get(default))
				if get(onLeave) then
					focused:set(false)
				end
			end
		end)
		if _flag.private then
			if get(onLeave) then
				focused:set(true)
			end
			correctText:set(get(default))
			if get(onLeave) then
				focused:set(false)
			end
		end
	else
		if get(onLeave) then
			focused:set(true)
		end
		correctText:set(get(default))
		if get(onLeave) then
			focused:set(false)
		end
	end

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetInput(newInput)
		local _didPass, _failedItems = typecheck({['SetInput'] = newInput}, {SetInput = get(onlyNumbers) and 1 or ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		correctText:set(newInput)
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	return returnFunctions
end