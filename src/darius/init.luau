local Bundles = require(script.Bundles)
local data = Bundles.data
local icons = Bundles.icons
local theme = Bundles.themeSystem
local services = Bundles.services
	local HttpService = services.HttpService
local fusion = Bundles.Fusion
	local observe = fusion.Observer

local utilities = require(script.utilities)
local references = utilities.references
local connections = utilities.connections
local customFunctions = utilities.customFunctions
local randomString = utilities.randomString
local get = utilities.get
local typecheck = utilities.typecheck

local mainLayout = require(script.layouts.main)

local flagCreator = require(script.Bundles.flags)

local setWarnTitle = require(script.components.warn)[2]

local function addComponent(name, parent, properties)
	properties.Parent = parent
	return require(script.components[name])(properties)
end

local darius = {}
function darius:Window(windowProperty)
	if customFunctions.getgenv then
		if customFunctions.getgenv().dariusInstance then
			connections:deleteConnections()
			references:clear()
			customFunctions.getgenv().dariusInstance = nil
		end
	else
		if _G.dariusInstance then
			connections:deleteConnections()
			references:clear()
			_G.dariusInstance = nil
		end
	end

	-- Typecheck

	local didPass, failedItems = typecheck(windowProperty,{
		Title = "",
        Description = "",
		Icon = "",
        HideBind = Enum.KeyCode.T,
        UseConfig = false,
        IsMobile = false,
		Offset = 0,
        Theme = {},
		Configuration = {},
        noOffset = false,
		Parent = Instance.new("Part")
	},{
		windowProperty.Icon and "" or "Icon",
		windowProperty.noOffset and "" or "noOffset",
		windowProperty.IsMobile and "" or "IsMobile",
		windowProperty.UseConfig and "" or "UseConfig",
		windowProperty.Theme and "" or "Theme",
		windowProperty.Configuration and "" or "Configuration",
		windowProperty.Parent and "" or "Parent",
		windowProperty.Offset and "" or "Offset"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	if windowProperty.UseConfig then
		didPass, failedItems = typecheck(windowProperty,{
			Workspace = ""
		},{})
		assert(didPass, table.concat(failedItems, "\n"))
	end

	-- Warn

	setWarnTitle(windowProperty.Title)

	-- Data

	data.add({string = ""}, "selectedTab")
	data.add({boolean = false}, "isFirst")
	local setTheme = data.add({tbl = {}}, "setTheme")
	data.add({number = windowProperty.noOffset and 0 or 58}, "absoluteOffset")
	data.add({name = randomString(32)}, "instanceName")
	data.add({binds = {}}, "currentBinds")
	data.add({bindData = {}}, "bindData")
	data.add({string = ""}, "searchText")
	local toggles = data.add({list = {}}, "toggles", true)
	data.add({module = function()end}, "currentPicker")
	data.add({module = function()end}, "currentPicker")
	data.add({boolean = true}, "isVisible")
	data.add({boolean = windowProperty.IsMobile}, "isMobile")
	data.add({boolean = false}, "isListening")
	local destroyFunc = data.add({func = function()end}, "destroyFunc")
	local flags = data.find("flags")
	local useConfig = data.add({boolean = false}, "useConfig")
	local windowData = data.add({data = windowProperty})

	-- Files

	if windowProperty.UseConfig then
		local path = {"darius",`/{windowProperty.Workspace}`}
		local built = ""
		for i=1,#path do
			built = built..path[i]
			if not customFunctions.isfolder(built) then
				customFunctions.makefolder(built)
			end
		end
		flagCreator.writeFiles = true
		flagCreator.path = `darius/{windowProperty.Workspace}`
		darius.Folder = `darius/{windowProperty.Workspace}`
	end
	local path = {"darius",`/themes`}
	local built = ""
	for i=1,#path do
		built = built..path[i]
		if not customFunctions.isfolder(built) then
			customFunctions.makefolder(built)
		end
	end
	theme.path = `darius/themes`

	-- Themes

	theme.init()
	local defaultTheme = theme.getTheme().uid
	if windowProperty.Theme then
		didPass, failedItems = typecheck(windowProperty.Theme, {
			Name = "",
			Colors = {}
		})
		assert(didPass, table.concat(failedItems, "\n"))
		setTheme:update("tbl", windowProperty.Theme)
		task.wait()
		theme.set(theme.create(windowProperty.Theme.Name, windowProperty.Theme.Colors, nil, nil, true))
	end

	-- Configs

	flagCreator.init()
	if windowProperty.Configuration then
		didPass, failedItems = typecheck(windowProperty.Configuration, {
			Name = "",
			FlagValues = {}
		})
		assert(didPass, table.concat(failedItems, "\n"))
		local uid = flagCreator.create(windowProperty.Configuration.Name, nil, nil, windowProperty.Configuration.FlagValues, true, windowProperty.Configuration.Lock)
		flagCreator.set(uid)
		for i,v in windowProperty.Configuration.FlagValues do
			flagCreator.preregister(i, v)
		end
	end

	-- Flags

	if windowProperty.UseConfig then
		useConfig:update("boolean", windowProperty.UseConfig)
	end

	darius.flags = {}
	setmetatable(darius.flags, {
		__index = function(tbl, flag)
			local _list = get(flags.list)
			if _list[flag] then
				return _list[flag].user
			else
				return flagCreator.preregister(flag).user
			end
			return nil
		end
	})

	-- Instance

	local bindableEvent = fusion.New "BindableEvent" {}
	darius.OnDestruction = bindableEvent.Event
	mainLayout(windowProperty, bindableEvent)
	local tabButtonList = references.get("tabButtonList")
	local tabFrameList = references.get("tabFrameList")

	-- Destruction

	destroyFunc:update("func", function()
		darius.Destroyed = true
		bindableEvent:Fire()
		for _,toggle in toggles.list do
			toggle:set(false)
		end
		task.wait(0.1)
		connections:deleteConnections()
		references:clear()
		bindableEvent:Destroy()
	end)

	-- Tabs

	darius[windowData.uid] = {}
	local tabs = darius[windowData.uid]
	function tabs:Tab(tabProperty)
		local tab = addComponent("tabButton", tabButtonList, tabProperty)
		local tabFrame = addComponent("tabFrame", tabFrameList, {uid = tab.uid})

		tabs[tab.uid] = {}
		local components = tabs[tab.uid]
		function components:Button(property)
			property.tab = tab
			return addComponent("button", tabFrame, property)
		end
		function components:Toggle(property)
			property.tab = tab
			return addComponent("toggle", tabFrame, property)
		end
		function components:Dropdown(property)
			property.tab = tab
			return addComponent("dropdown", tabFrame, property)
		end
		function components:Label(string)
			return addComponent("label", tabFrame, {tab = tab, Text = string})
		end
		function components:Paragraph(property)
			property.tab = tab
			return addComponent("paragraph", tabFrame, property)
		end
		function components:TextBox(property)
			property.tab = tab
			return addComponent("textbox", tabFrame, property)
		end
		function components:Slider(property)
			property.tab = tab
			return addComponent("slider", tabFrame, property)
		end
		function components:Keybind(property)
			property.tab = tab
			return addComponent("keybind", tabFrame, property)
		end
		function components:Divider()
			return addComponent("divider", tabFrame, {tab = tab})
		end
		function components:ColorPicker(property)
			property.tab = tab
			return addComponent("colorpicker", tabFrame, property)
		end
		function components:KeybindList()
			return addComponent("keybindList", tabFrame, {tab = tab})
		end
		function components:ButtonGroup()
			return addComponent("buttonGroup", tabFrame, {tab = tab})
		end
		return tabs[tab.uid]
	end
	darius.Destroyed = false
	function darius:Notify(notifyProperty)
		return addComponent("notification", references.get("notificationList"), notifyProperty)
	end
	function darius:Destroy()
		darius.Destroyed = true
		bindableEvent:Fire()
		task.spawn(function()
			for _,toggle in toggles.list do
				toggle:set(false)
			end	
		end)
		task.wait()
		connections:deleteConnections()
		references:clear()
		bindableEvent:Destroy()
	end

	function darius:SetTheme(uid)
		local _didPass, _failedItems = typecheck({['New Theme'] = uid}, {['New Theme'] = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		if theme.find(uid) then
			theme.set(uid)
		end
	end
	function darius:GetThemeUID()
		return theme.getTheme().uid
	end
	function darius:ImportTheme(...)
		local args = {...}
		if #args == 1 then
			didPass, failedItems = typecheck(args,{[1] = {}},{})
			assert(didPass, table.concat(failedItems, "\n"))
			return theme.create(`Import_{randomString(5)}`, args[1])
		elseif #args == 2 then
			didPass, failedItems = typecheck(args,{[1] = "",[2] = {}},{})
			assert(didPass, table.concat(failedItems, "\n"))
			return theme.create(args[1], args[2])
		end
	end
	function darius:ExportTheme()
		return theme.export()
	end

	function darius:SetConfiguration(uid)
		flagCreator.set(uid)
	end
	function darius:GetConfigurationUID()
		return flagCreator.getConfig().uid
	end
	function darius:ImportConfiguration(...)
		local args = {...}
		if #args == 1 then
			didPass, failedItems = typecheck(args,{[1] = {}},{})
			assert(didPass, table.concat(failedItems, "\n"))
			return flagCreator.create(`Import_{randomString(5)}`, nil, nil, args[1])
		elseif #args == 2 then
			didPass, failedItems = typecheck(args,{[1] = "",[2] = {}},{})
			assert(didPass, table.concat(failedItems, "\n"))
			return flagCreator.create(args[1], nil, nil, args[2])
		end
	end
	function darius:ExportConfiguration()
		return flagCreator.export()
	end

	function darius:CreateSettings()
		local _settings = tabs:Tab({
			Name = "Settings",
			Image = icons.cog
		})

		-- Theme Manager

		do
			local themeTable = theme.getTheme().palette
			local cachedTheme = {}
			local colorNames = {}
			local savedThemesNames = {}
			table.foreach(themeTable,function(i)
				table.insert(colorNames, i)
			end)
			table.foreach(theme.getThemes(), function(_, _theme)
				table.insert(savedThemesNames, {
					DisplayValue = _theme.name,
					Value = _theme.uid
				})
			end)

			local _name = ""
			local _colorPicker,_reset,_themeNames,_delete,_save,_changeName,_confirmName
			local isToggledE = false
			local displayReset = false
			local function editToggle(value)
				if value then
					_themeNames:Visible()
					_colorPicker:Visible()
					if displayReset then
						_reset:Visible()
					end
					if theme.getTheme().uid ~= "original" then
						_changeName:Visible()
						_confirmName:Visible()
					else
						_changeName:Invisible()
						_confirmName:Invisible()
					end
				else
					_reset:Invisible()
					_colorPicker:Invisible()
					_themeNames:Invisible()
					_changeName:Invisible()
					_confirmName:Invisible()
				end
			end

			local savedThemesDD = _settings:Dropdown({
				Name = "Current Theme",
				Items = savedThemesNames,
				Default = theme.getTheme().uid,
				Callback = function(uid)
					theme.set(uid)
					if _colorPicker and _name ~= "" then
						_colorPicker:SetColor(theme.get(_name))
					end
					if uid == "original" and _delete then
						_delete:Disable()
					elseif uid ~= "original" and _delete then
						_delete:Enable()
					end
					if uid == "original" and _save then
						_save:Disable()
					elseif uid ~= "original" and _save then
						_save:Enable()
					end
					if _confirmName then
						editToggle(isToggledE)
					end
				end
			})
			local function refreshThemes(value:string?)
				table.clear(savedThemesNames)
				table.foreach(theme.getThemes(), function(_, _theme)
					table.insert(savedThemesNames, {
						DisplayValue = _theme.name,
						Value = _theme.uid
					})
				end)
				savedThemesDD:SetItems(savedThemesNames)
				if value then
					savedThemesDD:SelectItem(value)
				end
			end

			theme.onChange(function()
				savedThemesDD:SelectItem(theme.getTheme().uid)
				table.clear(cachedTheme)
				table.foreach(theme.getTheme().palette, function(i,v)
					cachedTheme[i] = v
				end)
			end)
			theme.onCreate(function()
				refreshThemes()
			end)

			local themeGroup = _settings:ButtonGroup()
			local isToggledC = false
			local _nameTheme,_createTheme,_cancelTheme
			local function createToggle(value)
				if value then
					_nameTheme:Visible()
					_createTheme:Visible()
					_cancelTheme:Visible()
				else
					_nameTheme:Invisible()
					_createTheme:Invisible()
					_cancelTheme:Invisible()
				end
			end

			-- Edit Button

			themeGroup:Button({
				Name = "Edit",
				Callback = function()
					isToggledC = false
					createToggle(false)
					isToggledE = not isToggledE
					editToggle(isToggledE)
				end
			})

			_themeNames = _settings:Dropdown({
				Name = "Colors",
				Visible = false,
				Items = colorNames,
				Callback = function(v)
					_name = v
					_colorPicker:SetColor(theme.get(_name))
					_colorPicker:Enable()
					_colorPicker:SetName(`Editing: {_name}`)
				end
			})
			_colorPicker = _settings:ColorPicker({
				Name = "Editing Color: ",
				IsEnabled = false,
				Visible = false,
				DisabledText = "Select Color First!",
				HideTransparency = true,
				Callback = function(color)
					local currentTheme = theme.getTheme().palette
					if currentTheme[_name]:ToHex() ~= color:ToHex() then
						displayReset = true
						_reset:Visible()
					else
						_reset:Invisible()
						displayReset = false
					end
					theme.edit(_name, color)
				end
			})
			_reset = _settings:Button({
				Name = "Reset Color",
				Visible = false,
				Callback = function()
					displayReset = false
					_colorPicker:SetColor(cachedTheme[_name])
					_reset:Invisible()
				end
			})
			local newName = ""
			_changeName = _settings:TextBox({
				Name = "New Name",
				Visible = false,
				Callback = function(v)
					newName = v
				end
			})
			_confirmName = _settings:Button({
				Name = "Set Name",
				Visible = false,
				Callback = function()
					theme.editTheme(theme.getTheme().uid, "name", newName)
					refreshThemes()
					_changeName:SetInput("")
				end
			})

			-- Create Button

			local _themeName = ""
			themeGroup:Button({
				Name = "Create",
				Callback = function()
					isToggledE = false
					editToggle(false)
					isToggledC = not isToggledC
					createToggle(isToggledC)
				end
			})

			_nameTheme = _settings:TextBox({
				Name = "Name your theme",
				Visible = false,
				Callback = function(v)
					_themeName = v
				end
			})
			_createTheme = _settings:Button({
				Name = "Create theme",
				Visible = false,
				Callback = function()
					if _themeName == "" then
						darius:Notify({
							Title = windowProperty.Title,
							Body = "Theme name cannot be empty!",
							Duration = 3,
							Image = icons.alert,
							ImageColor = theme.get("red")
						})
						return
					end
					local newTheme = theme.create(_themeName, theme.getColors())
					local response = {theme.set(newTheme)}

					if response[1] then
						refreshThemes(newTheme)
						isToggledC = false
						createToggle(isToggledC)
					end
				end
			})
			_cancelTheme = _settings:Button({
				Name = "Cancel",
				Visible = false,
				Callback = function()
					isToggledC = false
					createToggle(isToggledC)
					_nameTheme:SetInput("")
				end
			})

			-- Save Button

			_save = themeGroup:Button({
				Name = "Save",
				DisabledText = "Disabled",
				Callback = function()
					local response = theme.save(theme.getTheme().uid)
					if response then
						task.wait()
						local currentTheme = theme.getTheme().palette
						if currentTheme[_name]:ToHex() ~= cachedTheme[_name]:ToHex() then
							displayReset = true
							_reset:Visible()
						else
							_reset:Invisible()
							displayReset = false
						end
						darius:Notify({
							Title = windowProperty.Title,
							Body = `Saved theme with uid "{theme.getTheme().uid}"`,
							Duration = 3,
							Image = icons.check
						})
					else
						darius:Notify({
							Title = "Theme Manager Error",
							Body = `Couldn't find/save theme with uid "{theme.getTheme().uid}"`,
							Duration = 3,
							Image = icons.alert,
							ImageColor = theme.get("red")
						})
					end
				end
			})

			-- Delete Button

			_delete = themeGroup:Button({
				Name = "Delete",
				DisabledText = "Disabled",
				Callback = function()
					local response = {theme.find(theme.getTheme().uid)}
					if response[1] then
						local _theme = response[2]
						theme.delete(_theme.uid)
						refreshThemes(defaultTheme)
						darius:Notify({
							Title = windowProperty.Title,
							Body = `Deleted theme with uid "{_theme.uid}"`,
							Duration = 3,
							Image = icons.check
						})
					else
						darius:Notify({
							Title = "Theme Manager Error",
							Body = `Couldn't find theme with uid "{theme.getTheme().uid}"`,
							Duration = 3,
							Image = icons.alert,
							ImageColor = theme.get("red")
						})
					end
				end
			})
		end

		-- Configuration Manager

		if windowProperty.UseConfig then
			_settings:Divider()
			local configNames = {}
			table.foreach(flagCreator.getConfigs(), function(_, _config)
				table.insert(configNames, {
					DisplayValue = _config.name,
					Value = _config.uid
				})
			end)
			local selectedConfig = ""
			local _save, _delete

			local configs = _settings:Dropdown({
				Name = "Configs",
				Items = configNames,
				Default = flagCreator.getConfig().uid,
				AlwaysOpen = true,
				Callback = function(uid)
					selectedConfig = uid
					local config = flagCreator.find(uid)
					if not config then
						_delete:Enable()
						_save:Enable()
						return
					end
					if config.lock and _delete then
						_delete:Disable()
						_save:Disable()
					elseif not config.lock and _delete then
						_delete:Enable()
						_save:Enable()
					end
				end
			})
			local configButtons = _settings:ButtonGroup()
			configButtons:Button({
				Name = "Load",
				Callback = function()
					if selectedConfig ~= "" then
						flagCreator.set(selectedConfig)
						local _config = flagCreator.find(selectedConfig)
						darius:Notify({
							Title = windowProperty.Title,
							Body = `Set configuration to "{_config.name}"`,
							Duration = 3,
							Image = icons.check
						})
					else
						darius:Notify({
							Title = "Configuration Error",
							Body = "No configuration selected",
							Duration = 3,
							Image = icons.alert,
							ImageColor = theme.get("red")
						})
					end
				end
			})
			local function refreshConfigList(value)
				table.clear(configNames)
				table.foreach(flagCreator.getConfigs(), function(_, _config)
					table.insert(configNames, {
						DisplayValue = _config.name,
						Value = _config.uid
					})
				end)
				configs:SetItems(configNames)
				if value then
					configs:SelectItem(value)
				end
			end
			flagCreator.onCreate(refreshConfigList)
			flagCreator.onSelect(refreshConfigList)

			-- Create

			local createA, createB, createC
			local configName = ""
			configButtons:Button({
				Name = "Create",
				Callback = function()
					configButtons:Invisible()
					configs:Invisible()
					createA:Visible()
					createB:Visible()
					createC:Visible()
				end
			})

			createA = _settings:TextBox({
				Visible = false,
				Name = "Name your configuration",
				Callback = function(name)
					configName = name
				end
			})
			createB = _settings:Button({
				Visible = false,
				Name = "Complete new configuration",
				Callback = function()
					if configName ~= "" then
						flagCreator.create(configName, nil, false, nil)

						refreshConfigList()

						configButtons:Visible()
						configs:Visible()
						createA:Invisible()
						createB:Invisible()
						createC:Invisible()

						darius:Notify({
							Title = windowProperty.Title,
							Body = `Created "{configName}"`,
							Duration = 3,
							Image = icons.check
						})
						createA:SetInput("")
					else
						darius:Notify({
							Title = "Configuration Error",
							Body = "Name cannot be empty",
							Duration = 3,
							Image = icons.alert,
							ImageColor = theme.get("red")
						})
					end
				end
			})
			createC = _settings:Button({
				Visible = false,
				Name = "Cancel",
				Callback = function()
					configButtons:Visible()
					configs:Visible()
					createA:Invisible()
					createB:Invisible()
					createC:Invisible()
					createA:SetInput("")
				end
			})

			-- Save

			_save = configButtons:Button({
				Name = "Save",
				DisabledText = "Disabled",
				Callback = function()
					if selectedConfig ~= "" then
						flagCreator.save(selectedConfig)
						local _config = flagCreator.find(selectedConfig)
						darius:Notify({
							Title = windowProperty.Title,
							Body = `Saved configuration "{_config.name}"`,
							Duration = 3,
							Image = icons.check
						})
					else
						darius:Notify({
							Title = "Configuration Error",
							Body = "No configuration selected",
							Duration = 3,
							Image = icons.alert,
							ImageColor = theme.get("red")
						})
					end
				end
			})

			-- Delete

			_delete = configButtons:Button({
				Name = "Delete",
				DisabledText = "Disabled",
				Callback = function()
					if selectedConfig == "" then
						darius:Notify({
							Title = "Configuration Error",
							Body = "No configuration selected",
							Duration = 3,
							Image = icons.alert,
							ImageColor = theme.get("red")
						})
						return
					end
					flagCreator.delete(selectedConfig)
					refreshConfigList()
				end
			})
		end
	end

	if customFunctions.getgenv then
		customFunctions.getgenv().dariusInstance = darius
	else
		_G.dariusInstance = darius
	end
	return darius[windowData.uid]
end
return darius