local Bundles = require(script.Bundles)
local data = Bundles.data
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

	theme.create(windowProperty.Theme or {})

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
		function components:KeybindList()
			return addComponent("keybindList", tabFrame, {tab = tab})
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
		theme.create(newTheme)
	end
	function darius:ExportTheme(json)
		local currentTheme = theme.getTheme()
		if json and typeof(json) == "boolean" and json == true then
			local _string = "{"
			for name,color in currentTheme do
				_string = _string..`\n\t[{name}] = Color3.new({tostring(color)})`
			end
			_string = _string.."\n}"
			return _string
		else
			return HttpService:JSONEncode(currentTheme)
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