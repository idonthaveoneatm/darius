local darius = script.Parent.Parent
return function(property, bindableEvent)
	local bundles = require(darius.Bundles)
	local services = bundles.services
	local UserInputService = services.UserInputService
	local theme = bundles.themeSystem
	local icons = bundles.icons
	local data = bundles.data
		local Fusion = bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
		local value = Fusion.Value
		local ref = Fusion.Ref
		local computed = Fusion.Computed
		local observe = Fusion.Observer
		local onevent = Fusion.OnEvent

	local simpleElements = require(darius.simpleElements)
	local UIListLayout = simpleElements.UIListLayout
	local UICorner = simpleElements.UICorner
	local UITextSizeConstraint = simpleElements.UITextSizeConstraint
	local UIPadding = simpleElements.UIPadding
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment

	local utilities = require(darius.utilities)
	local get = utilities.get
	local references = utilities.references
	local drag = utilities.drag
	local customFont = utilities.customFont
	local animate = utilities.animate
	local connections = utilities.connections

	local dariusWarn = require(script.Parent.Parent.components.warn)[1]

	-- References

	local container = value()
	local tabButtonList = value()
	local tabFrameList = value()
	local notificationList = value()
	local dariusref = value()
	local searchBox = value()
	references.add(dariusref,notificationList,tabFrameList,tabButtonList,container,searchBox)

	-- Data

	local absoluteOffset = data.find("absoluteOffset")
	local instanceName = data.find("instanceName")
	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
	local currentBinds = data.find("currentBinds")
	local isVisible = data.find("isVisible")
	local isMobile = data.find("isMobile")
	local isListening = data.find("isListening")
	local bindData = data.find("bindData")
	local destroyFunc = data.find("destroyFunc").func

	-- Variables

	local x = value(750)
	local y = value(500)
	local isCollapsed = value(false)
	local stage1 = value(false)
	local stage2 = value(false)
	local stage3 = value(false)
	observe(isCollapsed):onChange(function()
		if get(isCollapsed) then
			stage1:set(not get(stage1))
			task.wait(0.3)
			stage2:set(not get(stage2))
			task.wait(0.3)
			stage3:set(not get(stage3))
		else
			stage3:set(not get(stage3))
			task.wait(0.3)
			stage2:set(not get(stage2))
			task.wait(0.3)
			stage1:set(not get(stage1))
		end
	end)
	observe(stage2):onChange(function()
		x:set(get(stage2) and 212 or 750)
	end)
	observe(stage3):onChange(function()
		y:set(get(stage3) and 74 or 500)
	end)
	local listening = value(false)
	local keyCode = value()
	local hasBind = value(false)
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
			hasBind:set(true)
			_bindData[get(keyCode).Name] = {
				bind = get(keyCode),
				name = "Toggle Interface"
			}
			bindData:update("bindData", _bindData)
			currentBinds:update("binds", _currentBinds)
		end
	end
	if not get(isMobile.boolean) then
		checkKeyCode(property.HideBind, "init")
	end
	local backTitle = value("")
	observe(selectedTab.string):onChange(function()
		local _selectedTab = get(selectedTab.string)
		local tabData = data.find(_selectedTab)
		backTitle:set(get(tabData.Name):upper())
	end)
	local icon  = value(property.Icon or "")

	local mobileButton
	local dragConnection
	local inst = new "ScreenGui" {
		Name = get(instanceName.name),
		Parent = property.Parent or services.CoreGui,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,

		[ref] = dariusref,

		[children] = {
			new "Frame" {
				Name = "screenSize",
				Size = UDim2.fromScale(1,1),
				BackgroundTransparency = 1,
			},
			new "Frame" {
				Name = "container",
				Visible = isVisible.boolean,
				AnchorPoint = Vector2.new(0.5,0.5),
				Position = UDim2.new(0.5,0,0.5,get(absoluteOffset.number)),
				Size = animate(function()
					return UDim2.fromOffset(get(x),get(y))
				end,30,1),
				BackgroundColor3 = theme.background,

				[ref] = container,

				[children] = {
					UICorner(6),
					UIPadding(16),
					UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Right,VA.Top,UDim.new(0,16)),
					new "Frame" {
						ZIndex = 2,
						AnchorPoint = Vector2.new(0,0.5),
						Size = animate(function()
							return UDim2.new(0, math.clamp(get(x)-32-180-16,212,9e9), get(stage1) and 0 or 1,0)
						end,30,1),
						BackgroundTransparency = 1,
						ClipsDescendants = true,

						[children] = {
							new "TextLabel" {
								Size = UDim2.new(1,-1,0,70),
								Position = UDim2.fromOffset(0,10),
								BackgroundTransparency = 1,
								Text = backTitle,
								TextXAlignment = Enum.TextXAlignment.Right,
								TextYAlignment = Enum.TextYAlignment.Bottom,
								FontFace = customFont("Montserrat", Enum.FontWeight.ExtraBold),
								TextColor3 = theme.text,
								TextTransparency = 0.95,
								TextScaled = true,

								[children] = {
									new "UITextSizeConstraint" {
										MinTextSize = 1,
										MaxTextSize = 70
									}
								}
							},
							new "Frame" {
								Size = UDim2.fromScale(1,1),
								BackgroundTransparency = 1,

								[children] = {
									UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Left,VA.Top,UDim.new(0,16)),
									new "Frame" {-- Title and Search
										Size = UDim2.new(1,0,0,44),
										BackgroundTransparency = 1,

										[children] = {
											UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Top,UDim.new(0,10)),
											new "Frame" {-- Title
												Size = UDim2.new(0.65,0,1,0),
												BackgroundTransparency = 1,

												[children] = {
													UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Top,UDim.new(0,5)),
													new "ImageLabel" {
														Visible = computed(function()
															if get(icon) ~= "" then
																return true
															end
															return false
														end),
														Size = UDim2.fromOffset(44,44),
														BackgroundTransparency = 1,
														Image = icon,
														ImageColor3 = theme.text2
													},
													new "Frame" {
														Size = computed(function()
															if get(icon) ~= "" then
																return UDim2.new(1,-49,1,0)
															end
															return UDim2.new(1,0,1,0)
														end),
														BackgroundTransparency = 1,

														[children] = {
															UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Left,VA.Top,UDim.new(0,4)),
															new "TextLabel" {
																Size = UDim2.new(1,0,0.6,0),
																Text = property.Title,
																TextColor3 = theme.text,
																FontFace = customFont("Montserrat", Enum.FontWeight.ExtraBold),
																TextScaled = true,
																BackgroundTransparency = 1,
																TextXAlignment = Enum.TextXAlignment.Left
															},
															new "TextLabel" {
																Size = UDim2.new(1,0,0.4,-4),
																Text = property.Description,
																TextColor3 = theme.text2,
																FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
																TextScaled = true,
																BackgroundTransparency = 1,
																TextXAlignment = Enum.TextXAlignment.Left
															}
														}
													}
												}
											},
											new "TextButton" {
												Size = UDim2.new(0.35,-10,1,0),
												BackgroundColor3 = theme.background2,

												[onevent "Activated"] = function()
													local _searchBox = get(searchBox)
													if _searchBox then
														_searchBox:CaptureFocus()
													end
												end,

												[children] = {
													UIPadding(0,4),
													UICorner(6),
													UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Center,VA.Center,UDim.new(0,4)),
													new "ImageLabel" {
														Size = UDim2.fromOffset(20,20),
														BackgroundTransparency = 1,
														Image = icons.search,
														ImageColor3 = theme.text2
													},
													new "TextBox" {-- Search
														Size = UDim2.new(1,-32,0,16),
														TextColor3 = theme.text2,
														TextSize = 16,
														FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
														PlaceholderText = "Search",
														PlaceholderColor3 = theme.text2,
														BackgroundTransparency = 1,
														TextXAlignment = Enum.TextXAlignment.Left,
														TextScaled = true,
														ClearTextOnFocus = true,

														[onevent "Changed"] = function(changedProperty)
															local _searchBox = get(searchBox)
															if changedProperty ~= "Text" and _searchBox and _searchBox.Text then
																return
															end
															searchText:update("string", _searchBox.Text)
														end,

														[ref] = searchBox,
													}

												}
											}
										}
									},
									new "Frame" {-- Tab Frames
										Name = "tabFrameList",
										Size = UDim2.new(1,0,1,-44-16),
										BackgroundTransparency = 1,

										[ref] = tabFrameList

									}
								}
							}
						}
					},
					new "Frame" {
						Size = animate(function()
							return get(stage3) and UDim2.new(0,180,0,44) or UDim2.new(0,180,1,0)
						end,30,1),
						BackgroundColor3 = theme.background2,
						ClipsDescendants = true,

						[children] = {
							UICorner(6),
							UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,8)),
							new "Frame" {-- Minimize and Hide
								Size = UDim2.new(1,0,0,44),
								BackgroundTransparency = 1,

								[children] = {
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Center,VA.Center,UDim.new(0,4)),
									new "TextButton" {
										Size = UDim2.new(1,-84,0,32),
										BackgroundColor3 = theme.selectedTab,

										[onevent "Activated"] = function()
											if get(isMobile.boolean) then
												hasBind:set(true)
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
												ImageTransparency = 0
											},
											new "TextLabel" {
												Visible = not get(isMobile.boolean),
												Size = UDim2.new(1,-25,0,16),
												BackgroundTransparency = 1,
												FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
												TextScaled = true,
												TextXAlignment = Enum.TextXAlignment.Center,
												TextColor3 = theme.text2,
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
													return get(hasBind) and "Move Bind" or "Place Bind"
												end)
											}
										}
									},
									new "TextButton" {
										Size = UDim2.fromOffset(32,32),
										BackgroundColor3 = theme.selectedTab,

										[onevent "Activated"] = function()
											isCollapsed:set(not get(isCollapsed))
										end,

										[children] = {
											UICorner(6),
											new "ImageLabel" {
												AnchorPoint = Vector2.new(0.5,0.5),
												Position = UDim2.fromScale(0.5,0.5),
												Size = UDim2.fromOffset(30,30),
												BackgroundTransparency = 1,
												Image = computed(function()
													return get(isCollapsed) and icons.minimize or icons.maximize
												end),
												ImageColor3 = theme.text2,
												ImageTransparency = 0
											}
										}
									},
									new "TextButton" {
										Size = UDim2.fromOffset(32,32),
										BackgroundColor3 = theme.selectedTab,

										[onevent "Activated"] = function()
											if not get(hasBind) then
												require(darius.components.notification)({
													Parent = notificationList,
													Title = "Darius Interface",
													Body = `You must {get(isMobile.boolean) and "place your bind" or "bind to a key"} before hiding the UI!`,
													Duration = 5,
													Image = icons.alert,
													ImageColor = theme.get("red")
												})
												return
											end
											isVisible:update("boolean", not get(isVisible.boolean))
										end,

										[children] = {
											UICorner(6),
											new "ImageLabel" {
												AnchorPoint = Vector2.new(0.5,0.5),
												Position = UDim2.fromScale(0.5,0.5),
												Size = UDim2.fromOffset(30,30),
												BackgroundTransparency = 1,
												Image = icons.close,
												ImageColor3 = theme.orange,
												ImageTransparency = 0
											}
										}
									}
								}
							},
							new "ScrollingFrame" {-- Tab Buttons
								Name = "tabButtonList",
								Size = animate(function()
									return get(stage3) and UDim2.new(1,0,0,0) or UDim2.new(1,0,1,-90)
								end,30,1),
								BackgroundTransparency = 1,
								ScrollBarThickness = 0,
								CanvasSize = UDim2.new(0,0,0,0),
								AutomaticCanvasSize = Enum.AutomaticSize.Y,
								ClipsDescendants = true,

								[ref] = tabButtonList,

								[children] = {
									UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Left,VA.Top,UDim.new(0,6)),
									UIPadding(0,10)
								}
							},
							new "TextButton" {
								Size = UDim2.new(1,-10,0,24),
								BackgroundColor3 = theme.selectedTab,

								[onevent "Activated"] = function()
									get(destroyFunc)()
								end,

								[children] = {
									UICorner(4),
									UIPadding(6),
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,4)),
									new "ImageLabel" {
										BackgroundTransparency = 1,
										Size = UDim2.fromOffset(24,24),
										ImageColor3 = theme.red,
										Image = icons.close,
										ImageTransparency = 0.3
									},
									new "TextLabel" {
										Size = UDim2.new(1,-28,1),
										FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
										TextColor3 = theme.red,
										TextScaled = true,
										Text = "Destroy Interface",
										BackgroundTransparency = 1,
										TextXAlignment = Enum.TextXAlignment.Left,
										TextTransparency = 0.3,

										[children] = {
											new "UITextSizeConstraint" {
												MinTextSize = 1,
												MaxTextSize = 16
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
				Name = "notificationList",
				BackgroundTransparency = 1,
				Size = UDim2.new(0,2,1,-20),
				Position = UDim2.new(1,-5,0.5,0),
				AnchorPoint = Vector2.new(1,0.5),
				ClipsDescendants = false,

				[ref] = notificationList,

				[children] = {
					UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Right,VA.Bottom)
				}
			}
		}
	}

	if inst.screenSize.AbsoluteSize.X < get(x) then
		x:set(inst.screenSize.AbsoluteSize.X * 0.9)
	end
	if inst.screenSize.AbsoluteSize.Y < get(y) then
		y:set(inst.screenSize.AbsoluteSize.Y * 0.9)
	end

	mobileButton = new "TextButton" {
		Visible = computed(function()
			return (get(hasBind) and get(isMobile.boolean))
		end),
		Interactable = computed(function()
			return (get(hasBind) and get(isMobile.boolean))
		end),
		Parent = references.get(get(instanceName.name)),
		Size = UDim2.fromOffset(60,60),
		AnchorPoint = Vector2.new(0.5,0.5),
		Position = UDim2.fromScale(0.5,0.5),
		TextScaled = true,
		Text = "Toggle UI",
		FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
		TextColor3 = theme.mobileButtonText,
		BackgroundColor3 = theme.mobileButtonBackground,
		BackgroundTransparency = 0.6,
		TextTransparency = 0.1,

		[onevent "Activated"] = function()
			if dragConnection then
				dragConnection:Disconnect()
				dragConnection = nil
			else
				isVisible:update("boolean", not get(isVisible.boolean))
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
			if input.KeyCode and input.KeyCode == get(keyCode) and not gameProcessed and not get(isListening.boolean) then
				isVisible:update("boolean", not get(isVisible.boolean))
			end
		end
	end)
	connections.add(keybindConnection)

	local _currentDrag = drag(references.get("container"), 15)

	connections.add(references.get("container"):GetPropertyChangedSignal("Position"):Connect(function()
		local _container = references.get("container")
		local correctPosition = _container.AbsolutePosition + Vector2.new(get(x)/2,get(y)/2)
		if (correctPosition.X - inst.screenSize.AbsoluteSize.X)/get(x) > 0.435 then
			_currentDrag:Disconnect()
			_container.Position = UDim2.new(0.5,0,_container.Position.Y.Scale,_container.Position.Y.Offset)
			_currentDrag = drag(references.get("container"), 15)
		end
		if -((correctPosition.X - inst.screenSize.AbsoluteSize.X)/get(x) + 1) > 0.8 then
			_currentDrag:Disconnect()
			_container.Position = UDim2.new(0.5,0,_container.Position.Y.Scale,_container.Position.Y.Offset)
			_currentDrag = drag(references.get("container"), 15)
		end
		if (correctPosition.Y - (inst.screenSize.AbsoluteSize.Y + get(absoluteOffset.number)))/get(y) > 0.32 then
			_currentDrag:Disconnect()
			_container.Position = UDim2.new(_container.Position.X.Scale,_container.Position.X.Offset,0.5,get(absoluteOffset.number))
			_currentDrag = drag(references.get("container"), 15)
		end
		if -((correctPosition.Y - (inst.screenSize.AbsoluteSize.Y + get(absoluteOffset.number)))/get(y) + 1) > 0.935 then
			_currentDrag:Disconnect()
			_container.Position = UDim2.new(_container.Position.X.Scale,_container.Position.X.Offset,0.5,get(absoluteOffset.number))
			_currentDrag = drag(references.get("container"), 15)
		end
	end))
end