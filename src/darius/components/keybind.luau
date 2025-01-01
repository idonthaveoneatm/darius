local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
	local services = Bundles.services
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
	local connections = utilities.connections
	local customFont = utilities.customFont
	local references = utilities.references
	local drag = utilities.drag

	local simpleElements = require(darius.simpleElements)
	local UIPadding = simpleElements.UIPadding
	local UICorner = simpleElements.UICorner
	local UITextSizeConstraint = simpleElements.UITextSizeConstraint
	local UIListLayout = simpleElements.UIListLayout
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment

	local dariusWarn = require(script.Parent.warn)

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Name = "",
		DisabledText = "",
        FLAG = "",
        IsEnabled = false,
        Callback = function()end,
		Bind = Enum.KeyCode.Q
	},{
		property.DisabledText and "" or "DisabledText",
		property.FLAG and "" or "FLAG",
		property.IsEnabled and "" or "IsEnabled",
		property.Bind and "" or "Bind",
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local currentBinds = data.find("currentBinds")
	local useConfig = data.find("useConfig")
	local flags = data.find("flags")
	local configLoaded = data.find("configLoaded")
	local searchText = data.find("searchText")
	local isMobile = data.find("isMobile")
	local instanceName = data.find("instanceName")
	local isListening = data.find("isListening")
	local keybind = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local callback = property.Callback
	local isEnabled = property.IsEnabled or value(true)
	local disabledText = property.DisabledText or value("Component Disabled")
	local keyCode = value()
	local hasKeyCodeBeenSet = false
	local function checkKeyCode(keycode: EnumItem, dupeMessage:string)
		local _currentBinds = get(currentBinds.binds)
		if table.find(_currentBinds, keycode) then
			dariusWarn(("Key %s is already in use. %s"):format(keycode.Name, dupeMessage))
		else
			table.insert(_currentBinds, keycode)
			if get(keyCode) then
				table.remove(_currentBinds, table.find(_currentBinds, get(keyCode)))
			end
			currentBinds:update("binds", _currentBinds)
			keyCode:set(keycode)
			hasKeyCodeBeenSet = true
		end
	end
	local flag = property.FLAG or value("")
	local hasFlag = false
	if get(flag) ~= "" then
		local _names = get(flags.names)
		assert(not table.find(_names, get(flag)), ('FLAG "%s" already exists'):format(get(flag)))
		table.insert(_names, get(flag))
		flags:update("names", _names)
		hasFlag = true
		local _specialCase = get(flags.specialCase)
		_specialCase[get(flag)] = {isKeybind = true}
		flags:update("specialCase", _specialCase)
	end

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(keybind.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(keybind.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local listening = value(false)
	local keybindConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if get(isMobile.boolean) then
			return
		end
		if get(listening) then
			if input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
				checkKeyCode(input.KeyCode, "From input box")
			end
			listening:set(false)
			task.wait()
			isListening:update("boolean", false)
		else
			if input.KeyCode and input.KeyCode == get(keyCode) and not gameProcessed and not get(isListening.boolean) and get(isEnabled) then
				task.spawn(get(callback))
			end
		end
	end)
	connections.add(keybindConnection)
	local hasPlaced = value(false)
	local coordinate = value(Vector2.new(0,0))
	local function configLoad()
		if hasFlag then
			if get(configLoaded.boolean) then
				local savedFlag = get(flags.list)[get(flag)]
				local _didPass = typecheck({[get(flag)] = savedFlag},{[get(flag)] = {}})
				if savedFlag and _didPass then
					checkKeyCode(Enum.KeyCode[savedFlag.keycode], "From configLoad has FLAG")
				end
				if not savedFlag then
					task.wait()
					checkKeyCode(get(property.Bind), "From configLoad no FLAG")
				end
			end
		else
			if get(configLoaded.boolean) and not hasKeyCodeBeenSet then
				task.wait()
				checkKeyCode(get(property.Bind), "From configLoad no FLAG")
			end
		end
	end

	-- Keybind

	local dragConnection
	local mobileButton
	mobileButton = new "TextButton" {
		Visible = computed(function()
			if not get(isEnabled) then
				return get(isEnabled)
			end
			return get(hasPlaced)
		end),
		Parent = references.get(get(instanceName.name)),
		Size = UDim2.fromOffset(60,60),
		AnchorPoint = Vector2.new(0.5,0.5),
		Position = UDim2.fromScale(0.5,0.5),
		TextScaled = true,
		Text = get(name),
		FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
		TextColor3 = theme.mobileButtonText,
		BackgroundColor3 = theme.mobileButtonBackground,
		BackgroundTransparency = 0.6,
		TextTransparency = 0.1,

		[onevent "Activated"] = function()
			if dragConnection then
				dragConnection:Disconnect()
				dragConnection = nil
				coordinate:set(mobileButton.AbsolutePosition)
			else
				task.spawn(get(callback))
			end
		end,

		[children] = {
			UIPadding(4),
			UICorner(16),
			UITextSizeConstraint(0,16),
			new "ImageLabel" {
				ZIndex = 0,
				AnchorPoint = Vector2.new(0.5,0.5),
				Position = UDim2.fromScale(0.5,0.5),
				Size = UDim2.fromOffset(32,32),
				BackgroundTransparency = 1,
				Image = get(isMobile.boolean) and icons.finger or icons.command,
				ImageColor3 = theme.mobileButtonImage,
				ImageTransparency = 0.8
			}
		}
	}

	new "Frame" {
		Parent = _parent,
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) then
				return false
			end
			return true
		end),
		Size = UDim2.new(1,0,0,36),
		BackgroundTransparency = 1,

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
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1,1),

				[children] = {
					UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,3)),
					new "TextButton" {
						Interactable = computed(function()
							if not get(isEnabled) then
								return false
							end
							return get(isSelected)
						end),
						Size = UDim2.new(0.225,0,1,0),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[onevent "Activated"] = function()
							if get(isMobile.boolean) then
								hasPlaced:set(true)
								dragConnection = drag(mobileButton, 15)
								return
							end
							listening:set(true)
							isListening:update("boolean", true)
						end,

						[children] = {
							UICorner(6),
							UIPadding(6),
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,5)),
							new "ImageLabel" {
								ZIndex = 0,
								Size = UDim2.fromOffset(20,20),
								BackgroundTransparency = 1,
								Image = get(isMobile.boolean) and icons.finger or icons.command,
								ImageColor3 = theme.text2,
								ImageTransparency = selectedAnimation
							},
							new "TextLabel" {
								Visible = not get(isMobile.boolean),
								Size = UDim2.new(1,-25,0,16),
								BackgroundTransparency = 1,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								TextScaled = true,
								TextXAlignment = Enum.TextXAlignment.Center,
								TextColor3 = theme.text2,
								TextTransparency = selectedAnimation,
								Text = computed(function()
									return get(listening) and "Listening" or get(keyCode) and get(keyCode).Name or "Waiting"
								end)
							},
							new "TextLabel" {
								Visible = get(isMobile.boolean),
								Size = UDim2.new(1,-25,0,16),
								BackgroundTransparency = 1,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								TextScaled = true,
								TextXAlignment = Enum.TextXAlignment.Center,
								TextColor3 = theme.text2,
								Text = computed(function()
									return get(hasPlaced) and "Move Bind" or "Place Bind"
								end),
								TextTransparency = selectedAnimation
							}
						}
					},
					new "TextButton" {
						Visible = hasPlaced,
						Interactable = computed(function()
							if not get(isEnabled) then
								return false
							end
							return get(isSelected)
						end),
						Size = UDim2.fromOffset(36,36),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[onevent "Activated"] = function()
							hasPlaced:set(false)
							mobileButton.Position = UDim2.fromScale(0.5,0.5)
							coordinate:set(mobileButton.AbsolutePosition)
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
								ImageTransparency = selectedAnimation
							}
						}
					},
					new "Frame" {
						Size = computed(function()
							return UDim2.new(0.775,get(hasPlaced) and -42 or -3,0,36)
						end),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[children] = {
							UICorner(6),
							new "Frame" {
								Size = UDim2.fromScale(1,1),
								BackgroundTransparency = 1,
								[children] = {
									UIPadding(8),
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,10)),
									new "TextLabel" { -- Title
										FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
										Size = UDim2.new(1,-24,0,18),
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
							}
						}
					}
				}
			}
		}
	}

	-- Closure

	if hasFlag then
		observe(keyCode):onChange(function()
			local _list = get(flags.list)
			_list[get(flag)] = _list[get(flag)] or {}
			_list[get(flag)].keycode = get(keyCode).Name
			flags:update("list", _list)
		end)
		observe(coordinate):onChange(function()
			local _list = get(flags.list)
			_list[get(flag)] = _list[get(flag)] or {}
			_list[get(flag)].coordinate = tostring(get(coordinate))
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
			if property.Bind then
				checkKeyCode(get(property.Bind), "At property set")
			end
		end)
	end

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetBind(newBind:EnumItem)
		local _didPass, _failedItems = typecheck({['SetBind'] = newBind}, {SetBind = Enum.keyCode.C})
		assert(_didPass, table.concat(_failedItems, "\n"))

		checkKeyCode(newBind, "At :SetBind")
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	return returnFunctions
end