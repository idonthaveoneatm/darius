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
        noOffset = false,
		Parent = Instance.new("Part")
	},{
		windowProperty.Icon and "" or "Icon",
		windowProperty.noOffset and "" or "noOffset",
		windowProperty.IsMobile and "" or "IsMobile",
		windowProperty.UseConfig and "" or "UseConfig",
		windowProperty.Theme and "" or "Theme",
		windowProperty.Parent and "" or "Parent",
		windowProperty.Offset and "" or "Offset"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	didPass, failedItems = typecheck(windowProperty,{
		Config = "",
	},{
		windowProperty.UseConfig and "" or "Config"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Warn

	setWarnTitle(windowProperty.Title)

	-- Theme

	theme.init()
	local defaultTheme = theme.getTheme().uid
	if windowProperty.Theme then
		didPass, failedItems = typecheck(windowProperty.Theme, {
			Name = "",
			Colors = {}
		})
		assert(didPass, table.concat(failedItems, "\n"))
		theme.set(theme.create(windowProperty.Theme.Name, windowProperty.Theme.Colors))
	end

	-- Data

	data.add({string = ""}, "selectedTab")
	data.add({boolean = false}, "isFirst")
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
	local configLoaded = data.add({boolean = false}, "configLoaded")
	local useConfig = data.add({boolean = false}, "useConfig")
	local windowData = data.add({data = windowProperty})

	-- Flags

	local config
	if windowProperty.UseConfig then
		useConfig:update("boolean", windowProperty.UseConfig)
		config = windowProperty.Config

		local path = {"darius",`/{config}`}
		local built = ""
		for i=1,#path do
			built = built..path[i]
			if not customFunctions.isfolder(built) then
				customFunctions.makefolder(built)
			end
		end
		darius.Folder = built
		config = built.."/config.json"
		darius.File = config
		if not customFunctions.isfile(config) then
			customFunctions.writefile(config, "{}")
		end
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
		return tabs[tab.uid]
	end
	darius.Destroyed = false
	function darius:Notify(notifyProperty)
		return addComponent("notification", references.get("notificationList"), notifyProperty)
	end
	function darius:Destroy()
		darius.Destroyed = true
		bindableEvent:Fire()
		for _,toggle in toggles.list do
			toggle:set(false)
		end
		task.wait(0.1)
		connections:deleteConnections()
		references:clear()
		bindableEvent:Destroy()
	end
	function darius:LoadConfig()
		if not windowProperty.UseConfig then
			return
		end
		flagCreator.load(HttpService:JSONDecode(customFunctions.readfile(config)))
		flagCreator.config:set(config)
		configLoaded:update("boolean", true)
	end
	function darius:SetTheme(newTheme)
		local _didPass, _failedItems = typecheck({['New Theme'] = newTheme}, {['New Theme'] = {}})
		assert(_didPass, table.concat(_failedItems, "\n"))
		--theme.set(newTheme)
	end
	function darius:ExportTheme()
		local _currentTheme = theme.getTheme()
		local ctheme = {}
		ctheme.name = _currentTheme.name
		ctheme.uid = _currentTheme.uid
		ctheme.palette = {}
		for i,v in _currentTheme.palette do
			ctheme.palette[i] = v:ToHex()
		end
		return HttpService:JSONEncode(ctheme)
	end
	function darius:CreateSettings()
		local _settings = tabs:Tab({
			Name = "⚙️ Settings"
		})
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
		local _themeName = ""
		local _colorPicker,_reset,_deleteThemeA,_deleteThemeB

		local savedThemesDD = _settings:Dropdown({
			Name = "Current Theme",
			Items = savedThemesNames,
			Default = theme.getTheme().uid,
			Callback = function(name)
				if defaultTheme == name and _deleteThemeA then
					_deleteThemeA:Invisible()
				elseif defaultTheme ~= name and _deleteThemeA then
					_deleteThemeA:Visible()
				end
				theme.set(name)
				themeTable = theme.getTheme().palette
				table.clear(cachedTheme)
				table.foreach(themeTable, function(i,v)
					cachedTheme[i] = v
				end)
				if _colorPicker and _name ~= "" then
					_colorPicker:SetColor(theme.get(_name))
				end
			end
		})
		_deleteThemeA = _settings:Toggle({
			Name = "Do you want to delete this theme?",
			Visible = false,
			Callback = function(value)
				if value then
					_deleteThemeB:Visible()
				else
					_deleteThemeB:Invisible()
				end
			end
		})
		_deleteThemeB = _settings:Button({
			Name = "Delete Theme",
			Visible = false,
			DisabledText = "Check the box above first!",
			Callback = function()
				theme.delete(theme.getTheme().uid)
				_deleteThemeA:SetValue(false)
				table.clear(savedThemesNames)
				table.foreach(theme.getThemes(), function(_, _theme)
					table.insert(savedThemesNames, {
						DisplayValue = _theme.name,
						Value = _theme.uid
					})
				end)
				savedThemesDD:SetItems(savedThemesNames)
				savedThemesDD:SelectItem(defaultTheme)
			end
		})
		_settings:Label("Edit Theme:")
		_settings:Dropdown({
			Name = "Theme Colors",
			Items = colorNames,
			Alphabetical = true,
			Callback = function(name)
				_name = name
				_colorPicker:Enable()
				_colorPicker:SetName(`Editing Color: {_name}`)
				_colorPicker:SetColor(theme.get(_name))
			end
		})
		_colorPicker = _settings:ColorPicker({
			Name = "Editing Color: ",
			IsEnabled = false,
			DisabledText = "Select Color First!",
			HideTransparency = true,
			Callback = function(color)
				local currentTheme = theme.getTheme().palette
				if currentTheme[_name].R ~= color.R or currentTheme[_name].G ~= color.G or currentTheme[_name].B ~= color.B then
					_reset:Visible()
				end
				theme.edit(_name, color)
			end
		})
		_reset = _settings:Button({
			Name = "Reset Color",
			Visible = false,
			Callback = function()
				_colorPicker:SetColor(cachedTheme[_name])
				_reset:Invisible()
			end
		})
		_settings:TextBox({
			Name = "Name Your Theme",
			Callback = function(text)
				_themeName = text
			end
		})
		_settings:Button({
			Name = "Save and Set New Theme",
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
					table.clear(savedThemesNames)
					table.foreach(theme.getThemes(), function(_, _theme)
						table.insert(savedThemesNames, {
							DisplayValue = _theme.name,
							Value = _theme.uid
						})
					end)
					savedThemesDD:SetItems(savedThemesNames)
					savedThemesDD:SelectItem(newTheme)
				end
				theme.export()
				customFunctions.printFileSystem()
			end
		})
		_settings:Divider()
	end

	if customFunctions.getgenv then
		customFunctions.getgenv().dariusInstance = darius
	else
		_G.dariusInstance = darius
	end
	return darius[windowData.uid]
end
return darius