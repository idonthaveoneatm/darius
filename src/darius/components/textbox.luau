local darius = script.Parent.Parent
return function(property)
	local bundles = require(darius.Bundles)
	local data = bundles.data
	local theme = bundles.themeSystem
	local icons = bundles.icons
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
        Callback = function()end
	},{
		property.Placeholder and "" or "Placeholder",
		property.IsEnabled and "" or "IsEnabled",
		property.ClearTextOnFocus and "" or "ClearTextOnFocus",
		property.OnlyNumbers and "" or "OnlyNumbers",
		property.OnLeave and "" or "OnLeave",
		property.Default and "" or "Default",
		property.FLAG and "" or "FLAG",
		property.DisabledText and "" or "DisabledText"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local useConfig = data.find("useConfig")
	local flags = data.find("flags")
	local configLoaded = data.find("configLoaded")
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
	local placeHolder = property.Placeholder or value("")
	local flag = property.FLAG or value("")
	local hasFlag = false
	if get(flag) ~= "" then
		local _names = get(flags.names)
		assert(not table.find(_names, get(flag)), ('FLAG "%s" already exists'):format(get(flag)))
		table.insert(_names, get(flag))
		flags:update("names", _names)
		hasFlag = true
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
	local updatedText = value("")
	local focused = value(false)
	local lastCorrectText = value(get(updatedText))
	local lastCalled = value("")
	observe(updatedText):onChange(function()
		if get(onlyNumbers) then
			if tonumber(get(updatedText)) or get(updatedText) == "" then
				lastCorrectText:set(get(updatedText))
			end
		else
			lastCorrectText:set(get(updatedText))
		end
		local textBox = get(textboxRef)
		textBox.Text = get(lastCorrectText)
		if get(onLeave) then
			return
		end
		if get(onlyNumbers) then
			if (tonumber(get(updatedText)) or get(updatedText) == "") and get(lastCalled) ~= get(updatedText) then
				task.spawn(get(callback), get(updatedText))
				lastCalled:set(get(updatedText))
			end
		else
			if get(lastCalled) == get(updatedText) then
				return
			end
			task.spawn(get(callback), get(updatedText))
			lastCalled:set(get(updatedText))
		end
	end)
	observe(focused):onChange(function()
		if get(onLeave) and not get(focused) then
			if get(onlyNumbers) then
				if (tonumber(get(updatedText)) or get(updatedText) == "") and get(lastCalled) ~= get(updatedText) then
					task.spawn(get(callback), get(updatedText))
					lastCalled:set(get(updatedText))
				end
			else
				if get(lastCalled) == get(updatedText) then
					return
				end
				task.spawn(get(callback), get(updatedText))
				lastCalled:set(get(updatedText))
			end
		end
	end)
	local function configLoad()
		if hasFlag then
			if get(configLoaded.boolean) then
				local savedFlag = get(flags.list)[get(flag)]
				local _didPass = typecheck({[get(flag)] = savedFlag},{[get(flag)] = ""})
				if savedFlag and _didPass then
					if get(onLeave) then
						focused:set(true)
					end
					updatedText:set(savedFlag)
					if get(onLeave) then
						focused:set(false)
					end
				end
				if not savedFlag then
					task.wait()
					if get(default) ~= "" then
						if get(onLeave) then
							focused:set(true)
						end
						updatedText:set(get(default))
						if get(onLeave) then
							focused:set(false)
						end
					end
				end
			end
		else
			if get(configLoaded.boolean) then
				task.wait()
				if get(default) ~= "" then
					if get(onLeave) then
						focused:set(true)
					end
					updatedText:set(get(default))
					if get(onLeave) then
						focused:set(false)
					end
				end
			end
		end
	end

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
								Size = UDim2.new(1,-25,1,0),
								BackgroundTransparency = 1,
								PlaceholderText = placeHolder,
								PlaceholderColor3 = theme.text2,
								TextColor3 = theme.text,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextScaled = true,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								Text = lastCorrectText,
								TextTransparency = selectedAnimation,
								ClearTextOnFocus = clearTextOnFocus,

								[ref] = textboxRef,

								[onevent "Changed"] = function(changedProperty)
									local _textbox = get(textboxRef)
									if _textbox and _textbox.Text and changedProperty == "Text" then
										updatedText:set(_textbox.Text)
									end
								end,

								[onevent "Focused"] = function()
									focused:set(true)
								end,
								[onevent "FocusLost"] = function()
									focused:set(false)
								end,

								[children] = {
									UITextSizeConstraint(1,16)
								}
							}
						}
					}
				}
			}
		}
	}

	-- Closure

	if hasFlag then
		observe(lastCorrectText):onChange(function()
			local _list = get(flags.list)
			_list[get(flag)] = get(lastCorrectText)
			flags:update("list", _list)
		end)
	end

	if get(useConfig.boolean) then
		if get(configLoaded.boolean) then
			configLoad()
		else
			observe(configLoaded.boolean):onChange(configLoad)
		end
	else
		task.spawn(function()
			task.wait()
			if get(default) ~= "" then
				if get(onLeave) then
					focused:set(true)
				end
				updatedText:set(get(default))
				if get(onLeave) then
					focused:set(false)
				end
			end
		end)
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

		updatedText:set(newInput)
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	return returnFunctions
end