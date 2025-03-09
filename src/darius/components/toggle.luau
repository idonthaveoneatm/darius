local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
	local flagCreator = Bundles.flags
	local services = Bundles.services
	local UserInputService = services.UserInputService
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

	local dariusWarn = require(script.Parent.warn)[1]

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Name = "",
		DisabledText = "",
        FLAG = "",
        IsEnabled = false,
		Default = false,
        Callback = function()end,
		LinkKeybind = true,
		IgnoreConfig = true,
	},{
		property.DisabledText and "" or "DisabledText",
		property.FLAG and "" or "FLAG",
		property.IsEnabled and "" or "IsEnabled",
		property.Default and "" or "Default",
		property.LinkKeybind and "" or "LinkKeybind",
		property.IgnoreConfig and "" or "IgnoreConfig"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	didPass, failedItems = typecheck(property,{
		Bind = Enum.KeyCode.E
	},{
		property.LinkKeybind and property.Bind and "" or "Bind"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local currentBinds = data.find("currentBinds")
	local useConfig = data.find("useConfig")
	local searchText = data.find("searchText")
	local instanceName = data.find("instanceName")
	local isMobile = data.find("isMobile")
	local isListening = data.find("isListening")
	local bindData = data.find("bindData")
	local toggles = data.find("toggles")
	local toggle = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local callback = property.Callback
	local default = property.Default or value(false)
	local isEnabled = property.IsEnabled or value(true)
	local bind = property.Bind
	local ignoreConfig = property.IgnoreConfig or value(false)
	local disabledText = property.DisabledText or value("Component Disabled")
	local linkKeybind = property.LinkKeybind or value(false)
	local flag = property.FLAG or value(toggle.uid)
	local _flag
	if get(flag) ~= "" then
		_flag = flagCreator.register(get(flag), {
			boolean = value(false),
			keycode = value(nil)
		},"toggle", get(flag) == toggle.uid)
		_flag.user.Value = get(_flag.status.boolean)
	end
	local keyCode = value()
	local function checkKeyCode(keycode: EnumItem, dupeMessage:string)
		local _currentBinds = get(currentBinds.binds)
		local _bindData = get(bindData.bindData)
		if table.find(_currentBinds, keycode) then
			dariusWarn(("Key %s is already in use. %s"):format(keycode.Name, dupeMessage))
		else
			table.insert(_currentBinds, keycode)
			if get(keyCode) then
				table.remove(_currentBinds, table.find(_currentBinds, get(keyCode)))
				_bindData[get(keyCode).Name] = nil
			end
			keyCode:set(keycode)
			_bindData[get(keyCode).Name] = {
				bind = get(keyCode),
				name = get(name),
				boolean = _flag.status.boolean
			}
			bindData:update("bindData", _bindData)
			currentBinds:update("binds", _currentBinds)
		end
	end
	observe(_flag.status.boolean):onChange(function()
		if get(isEnabled) then
			task.spawn(get(callback), get(_flag.status.boolean))
		end
	end)
	observe(_flag.status.keycode):onChange(function()
		local success, result = pcall(function()
			return Enum.KeyCode[get(_flag.status.keycode)]
		end)
		if success then
			checkKeyCode(result, "RAHHH")
		end
	end)
	table.insert(toggles.list, _flag.status.boolean)

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(toggle.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(toggle.tab).uid)
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
				_flag.status.boolean:set(not get(_flag.status.boolean))
			end
		end
	end)
	connections.add(keybindConnection)
	local hasPlaced = value(false)

	-- Toggle

	local dragConnection
	local mobileButton = new "TextButton" {
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
		Text = name,
		FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
		TextColor3 = theme.mobileButtonText,
		BackgroundColor3 = theme.mobileButtonBackground,
		BackgroundTransparency = 0.5,
		TextTransparency = 0.1,

		[onevent "Activated"] = function()
			if dragConnection then
				dragConnection:Disconnect()
				dragConnection = nil
			else
				_flag.status.boolean:set(not get(_flag.status.boolean))
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
						Size = computed(function()
							return get(linkKeybind) and UDim2.new(0.775,get(hasPlaced) and -42 or -3,0,36) or UDim2.new(1,0,0,36)
						end),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[onevent "Activated"] = function()
							if not get(isEnabled) then
								return
							end
							_flag.status.boolean:set(not get(_flag.status.boolean))
						end,

						[children] = {
							UICorner(6),
							new "Frame" {
								Size = UDim2.fromScale(1,1),
								BackgroundTransparency = 1,
								[children] = {
									UIPadding(8),
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,10)),
									new "Frame" {
										Size = UDim2.fromOffset(24,24),
										AnchorPoint = Vector2.new(1,0.5),
										Position = UDim2.new(1,0,0.5,0),
										BackgroundTransparency = selectedAnimation,
										BackgroundColor3 = animate(function()
											return get(_flag.status.boolean) and theme.get("toggled") or theme.get("selectedTab")
										end,40,1),

										[children] = {
											UICorner(6),
											new "ImageLabel" {
												Size = UDim2.fromScale(0.65,0.65),
												AnchorPoint = Vector2.new(0.5,0.5),
												Position = UDim2.new(0.5,0,0.5,0),
												BackgroundTransparency = 1,
												Image = icons.check,
												ImageTransparency = animate(function()
													if not get(isSelected) then
														return 1
													end
													if get(_flag.status.boolean) then
														return 0
													end
													return 1
												end,40,1),
												ImageColor3 = theme.selectedTab
											}
										}
									},
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
					new "TextButton" {
						Visible = linkKeybind,
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
					}
				}
			}
		}
	}

	-- Closure

	if get(useConfig.boolean) and not get(ignoreConfig) then
		observe(_flag.file):onChange(function()
			local file = get(_flag.file)
			local noBoolean = true
			local noKeyCode = true
			if file.boolean ~= nil then
				_flag.status.boolean:set(file.boolean)
				noBoolean = false
			end
			if file.keycode ~= nil then
				_flag.status.keycode:set(file.keycode)
				noKeyCode = false
			end
			if noBoolean then
				_flag.status.boolean:set(get(default))
			end
			if noKeyCode then
				if bind then
					_flag.status.keycode:set(get(bind).Name)
				end
			end
		end)
		if _flag.private then
			_flag.status.boolean:set(get(default))
			if bind then
				_flag.status.keycode:set(get(bind).Name)
			end
		end
	else
		_flag.status.boolean:set(get(default))
		if bind then
			_flag.status.keycode:set(get(bind).Name)
		end
	end

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetValue(newValue:boolean)
		local _didPass, _failedItems = typecheck({['SetValue'] = newValue}, {['SetValue'] = true})
		assert(_didPass, table.concat(_failedItems, "\n"))

		_flag.status.boolean:set(newValue)
	end
	function returnFunctions:SetBind(newBind:EnumItem)
		assert(get(linkKeybind), "Requires LinkKeybind")
		local _didPass, _failedItems = typecheck({['SetBind'] = newBind}, {['SetBind'] = Enum.keyCode.C})
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