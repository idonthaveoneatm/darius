local darius = script.Parent.Parent

return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
	local flagCreator = Bundles.flags
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
        Callback = function()end,
        Items = {},
        Multiselect = true,
        Regex = function()end,
		IgnoreConfig = true
	},{
		property.DisabledText and "" or "DisabledText",
		property.FLAG and "" or "FLAG",
		property.IsEnabled and "" or "IsEnabled",
		property.Multiselect and "" or "Multiselect",
		property.Regex and "" or "Regex",
		property.IgnoreConfig and "" or "IgnoreConfig"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	didPass, failedItems = typecheck(property,{
		Default = property.Multiselect and {} or ""
	},{
		property.Default and "" or "Default",
	})
	assert(didPass, table.concat(failedItems, "\n"))

	if property.Regex then
		assert(typeof(property.Regex("")) == "string", "The Regex function must always return a string")
	end

	-- Data

	local selectedTab = data.find("selectedTab")
	local useConfig = data.find("useConfig")
	local searchText = data.find("searchText")
	local dropdown = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local callback = property.Callback
	local items = value({})
	local multiselect = property.Multiselect or value(false)
	local default = property.Default
	local ignoreConfig = property.IgnoreConfig or value(false)
	local isEnabled = property.IsEnabled or value(true)
	local disabledText = property.DisabledText or value("Component Disabled")
	local regex = property.Regex or value(function(itemToClean) return itemToClean end)
	local flag = property.FLAG or value(dropdown.uid)
	local _flag
	if get(flag) ~= "" then
		_flag = flagCreator.register(get(flag), {
			items = value({}),
			item = value(""),
			multiselect = get(multiselect)
		},"dropdown", get(flag) == dropdown.uid)
		_flag.user.Value = get(multiselect) and get(_flag.status.items) or  get(_flag.status.item)
	end

	-- Variables

	local dropdownRef = value()
	local searchRef = value()

	local isDropped = value(false)
	local lastReturnedValue = value(get(multiselect) and {} or "")
	local itemElements = value({})
	local hasSelectedAll = value(false)

	observe(_flag.status.items):onChange(function()
		if #get(_flag.status.items) == #get(items) then
			hasSelectedAll:set(true)
		else
			hasSelectedAll:set(false)
		end
		local _cbTable = {}
		for _,v in get(_flag.status.items) do
			table.insert(_cbTable, get(regex)(v))
		end
		task.wait()
		task.spawn(get(callback), _cbTable)
		lastReturnedValue:set(get(_flag.status.items))
	end)
	observe(_flag.status.item):onChange(function()
		task.wait()
		task.spawn(get(callback), get(regex)(get(_flag.status.item)))
		lastReturnedValue:set(get(regex)(get(_flag.status.item)))
	end)
	local isSelected = value(get(selectedTab.string) == get(dropdown.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(dropdown.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)

	-- Dropdown

	new "Frame" {
		Parent = _parent,
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) then
				return false
			end
			return true
		end),
		Size = animate(function()
			if get(isDropped) and get(dropdownRef) then
				local _dropdown = get(dropdownRef)
				local y = 3
				for _,child in _dropdown:GetChildren() do
					if child:IsA("UIListLayout") or child:IsA("UICorner") or not child.Visible then
						continue
					end
					y += (4 + child.Size.Y.Offset)
				end
				return UDim2.new(1,0,0,y)
			end
			return UDim2.new(1,0,0,36)
		end, 40, 1),
		BackgroundColor3 = theme.background2,
		BackgroundTransparency = selectedAnimation,
		ClipsDescendants = true,

		[ref] = dropdownRef,

		[children] = {
			UICorner(6),
			UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,4)),
			new "TextButton" {
				Interactable = computed(function()
					if not get(isEnabled) then
						return false
					end
					return get(isSelected)
				end),
				Size = UDim2.new(1,0,0,36),
				BackgroundTransparency = 1,

				[onevent "Activated"] = function()
					isDropped:set(not get(isDropped))
				end,

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
							UIPadding(8),
							new "TextLabel" {
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								Size = UDim2.new(1,-39,0,18),
								BackgroundTransparency = 1,
								TextColor3 = theme.text,
								TextScaled = true,
								AnchorPoint = Vector2.new(0,0.5),
								Position = UDim2.new(0,0,0.5,0),
								Text = computed(function()
									if get(multiselect) then
										return get(name).." "..tostring(#get(_flag.status.items)).."/"..tostring(#get(items))
									end
									if typeof(get(lastReturnedValue)) == "table" then
										return get(name)
									end
									return get(name)..": "..get(lastReturnedValue)
								end),
								TextTransparency = selectedAnimation,
								TextXAlignment = Enum.TextXAlignment.Left,
								RichText = true
							},
							new "ImageLabel" {
								Size = UDim2.fromOffset(24,24),
								AnchorPoint = Vector2.new(1,0.5),
								Position = UDim2.new(1,0,0.5,0),
								BackgroundTransparency = 1,
								Image = computed(function()
									return get(multiselect) and icons.multiDropdown or icons.normalDropdown
								end),
								ImageColor3 = theme.text2,
								ImageTransparency = selectedAnimation
							}
						}
					}
				}
			},
			new "Frame" {
				Size = UDim2.new(1,0,0,32),
				BackgroundTransparency = 1,
				[children] = {
					UIPadding(0,6),
					new "TextBox" {
						Size = UDim2.fromScale(1,1),
						BackgroundColor3 = theme.background,
						BackgroundTransparency = selectedAnimation,
						FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextScaled = true,
						ClearTextOnFocus = true,
						PlaceholderText = "Search",
						TextColor3 = theme.text,
						TextTransparency = selectedAnimation,

						[ref] = searchRef,

						[onevent "Changed"] = function(changedProperty)
							local search = get(searchRef)
							if changedProperty == "Text" and search and search.Text then
								local text = search.Text
								for _,item in get(itemElements) do
									if string.find(get(regex)(item.Name):lower(), text:lower()) or text == "" then
										item.Visible = true
									else
										item.Visible = false
									end
								end
							end
						end,

						[children] = {
							new "UITextSizeConstraint" {
								MinTextSize = 0,
								MaxTextSize = 16
							},
							UICorner(4),
							UIPadding(6,6,6,6)
						}
					}
				}
			},
			new "Frame" {
				Size = UDim2.new(1,0,0,32),
				BackgroundTransparency = 1,
				Visible = multiselect,
				[children] = {
					UIPadding(6,6,0,6),
					new "TextButton" {
						Interactable = multiselect,
						Size = UDim2.new(1,0,0,24),
						BackgroundTransparency = selectedAnimation,
						BackgroundColor3 = theme.background,

						[onevent "Activated"] = function()
							local tableToSet = {}
							if not get(hasSelectedAll) then
								for _,item in get(items) do
									item = typeof(item) == "table" and item.Value or item
									table.insert(tableToSet, get(regex)(item))
								end
							end
							_flag.status.items:set(tableToSet)
						end,

						[children] = {
							UICorner(4),
							UIPadding(8),
							new "TextLabel" {
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								Size = UDim2.new(1,0,0,14),
								BackgroundTransparency = 1,
								TextColor3 = theme.text2,
								TextScaled = true,
								AnchorPoint = Vector2.new(0,0.5),
								Position = UDim2.new(0,0,0.5,0),
								Text = computed(function()
									if get(hasSelectedAll) then
										return "Deselect All"
									end
									return "Select All"
								end),
								TextTransparency = selectedAnimation,
								TextXAlignment = Enum.TextXAlignment.Left,
								RichText = true
							}
						}
					}
				}
			},
			new "ScrollingFrame" {
				ZIndex = 3,
				Size = UDim2.new(1,0,0,136),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(0,0,0,0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,

				[children] = {
					UIPadding(6,6,0,6),
					UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,6)),
					itemElements
				}
			}
		}
	}

	observe(items):onChange(function()
		local tableOfElements = {}
		for _,item in get(items) do
			local itemValue, itemImage
			local isItemSelected = value(false)
			if typeof(item) == "table" then
				local _didPass, _failedItems = typecheck(item, {Value = "",Image = ""},{item.Image and "" or "Image"})
				assert(_didPass, table.concat(_failedItems, "\n"))

				itemValue = item.Value
				itemImage = item.Image or nil
			else
				local _didPass, _failedItems = typecheck({['Item'] = item}, {Item = "",})
				assert(_didPass, table.concat(_failedItems, "\n"))

				itemValue = item
			end
			local cleanedItem = get(regex)(itemValue)

			observe(_flag.status.items):onChange(function()
				if table.find(get(_flag.status.items), cleanedItem) then
					isItemSelected:set(true)
				else
					isItemSelected:set(false)
				end
			end)
			observe(_flag.status.item):onChange(function()
				if get(_flag.status.item) == cleanedItem then
					isItemSelected:set(true)
				else
					isItemSelected:set(false)
				end
			end)

			local itemElement = new "TextButton" {
				Name = itemValue,
				Size = UDim2.new(1,0,0,28),
				BackgroundTransparency = selectedAnimation,
				BackgroundColor3 = theme.background,

				[onevent "Activated"] = function()
					if get(multiselect) then
						local _items = get(_flag.status.items)
						isItemSelected:set(not get(isItemSelected))
						if get(isItemSelected) then
							table.insert(_items, cleanedItem)
						else
							table.remove(_items, table.find(_items, cleanedItem))
						end
						_flag.status.items:set(_items)
					else
						_flag.status.item:set(cleanedItem)
						isDropped:set(false)
					end
				end,

				[children] = {
					UICorner(4),
					UIPadding(8),
					UIListLayout(SO.LayoutOrder, FD.Horizontal,HA.Left,VA.Center,UDim.new(0,6)),
					new "Frame" {
						Visible = computed(function()
							return get(multiselect) and true or false
						end),
						Size = UDim2.fromOffset(20,20),
						AnchorPoint = Vector2.new(1,0.5),
						Position = UDim2.new(1,0,0.5,0),
						BackgroundTransparency = selectedAnimation,
						BackgroundColor3 = animate(function()
							return get(isItemSelected) and theme.get("toggled") or theme.get("selectedTab")
						end,40,1),

						[children] = {
							UICorner(6),
							new "ImageLabel" {
								Size = UDim2.fromOffset(14,14),
								AnchorPoint = Vector2.new(0.5,0.5),
								Position = UDim2.new(0.5,0,0.5,0),
								BackgroundTransparency = 1,
								Image = icons.check,
								ImageTransparency = animate(function()
									if not get(isSelected) then
										return 1
									end
									if get(isItemSelected) then
										return 0
									end
									return 1
								end,40,1),
								ImageColor3 = theme.selectedTab
							}
						}
					},
					new "ImageLabel" {
						Visible = computed(function()
							return itemImage and true or false
						end),
						Size = UDim2.fromOffset(18,18),
						AnchorPoint = Vector2.new(1,0.5),
						Position = UDim2.new(1,0,0.5,0),
						BackgroundTransparency = 1,
						Image = itemImage,
						ImageTransparency = selectedAnimation,
						ImageColor3 = theme.text2
					},
					new "TextLabel" {
						FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
						Size = computed(function()
							return get(multiselect) and UDim2.new(1,-48,0,16) or UDim2.new(1,-24,0,16)
						end),
						BackgroundTransparency = 1,
						TextColor3 = theme.text,
						TextScaled = true,
						AnchorPoint = Vector2.new(0,0.5),
						Position = UDim2.new(0,0,0.5,0),
						Text = itemValue,
						TextTransparency = selectedAnimation,
						TextXAlignment = Enum.TextXAlignment.Left,
						RichText = true
					}
				}
			}

			table.insert(tableOfElements,itemElement)
		end
		itemElements:set(tableOfElements)
	end)

	-- Closure

	items:set(get(property.Items))

	if get(useConfig.boolean) and not get(ignoreConfig) then
		observe(_flag.file):onChange(function()
			local file = get(_flag.file)
			local noChange = true
			if file ~= nil then
				noChange = false
			end
			if get(multiselect) then
				_flag.status.items:set(file)
			else
				_flag.status.item:set(file)
			end
			if noChange then
				if get(multiselect) then
					if default and #get(default) > 0 then
						_flag.status.items:set(get(default))
					end
				else
					if default then
						_flag.status.item:set(get(default))
					end
				end
			end
		end)
		if _flag.private then
			if get(multiselect) then
				if default and #get(default) > 0 then
					_flag.status.items:set(get(default))
				end
			else
				if default then
					_flag.status.item:set(get(default))
				end
			end
		end
	else
		if get(multiselect) then
			if default and #get(default) > 0 then
				_flag.status.items:set(get(default))
			end
		else
			if default then
				_flag.status.item:set(get(default))
			end
		end
	end

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetItems(newTable) -- Sets a new table of items
		local _didPass, _failedItems = typecheck({['SetItems'] = newTable}, {SetItems = {}})
		assert(_didPass, table.concat(_failedItems, "\n"))

		items:set(newTable)
		local multiselectTable = {}
		local foundAnything = false
		for _,v in get(items) do
			local item
			if typeof(v) == "table" then
				item = v.Value
			else
				item  = v
			end
			local cleanedItem = get(regex)(item)
			if get(multiselect) then
				if typeof(get(lastReturnedValue)) == "table" and table.find(get(lastReturnedValue), cleanedItem) then
					table.insert(multiselectTable, cleanedItem)
					foundAnything = true
				end
			else
				if get(lastReturnedValue) == cleanedItem then
					foundAnything = true
					_flag.status.item:set(cleanedItem)
					break
				end
			end
		end
		if foundAnything then
			if get(multiselect) then
				_flag.status.items:set(multiselectTable)
			end
		end
	end

	function returnFunctions:SelectItem(item) -- Sets item used when Multiselect is false
		assert(not get(multiselect), ":SelectItem requires Multiselect to be false")
		local _didPass, _failedItems = typecheck({['SelectItem'] = item}, {SelectItem = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		local hasItem = false
		for _,v in get(items) do
			local itemValue = v
			if typeof(v) == "table" then
				itemValue = v.Value
			end
			local cleanedItem = get(regex)(item)
			if get(regex)(itemValue) == cleanedItem then
				hasItem = true
				break
			end
		end
		assert(hasItem, ":SelectItem couldn't find "..item)
		_flag.status.item:set(item)
	end
	function returnFunctions:SelectItems(newSelecteds) -- Sets items used when Multiselect is true
		assert(get(multiselect), ":SelectItems requires Multiselect to be true")
		local _didPass, _failedItems = typecheck({['SelectItems'] = newSelecteds}, {SelectItems = {}})
		assert(_didPass, table.concat(_failedItems, "\n"))

		for i,v in newSelecteds do
			local found = false
			for _,item in get(items) do
				local itemValue = typeof(item) == "table" and get(regex)(item.Value) or get(regex)(item)
				if v == itemValue then
					found = true
					break
				end
			end
			if found then
				newSelecteds[i] = get(regex)(v)
			else
				table.remove(newSelecteds, i)
			end
		end
		_flag.status.items:set(newSelecteds)
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	return returnFunctions
end