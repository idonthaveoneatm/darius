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
        HideBind = Enum.KeyCode.T,
        UseConfig = false,
        IsMobile = false,
        Theme = {},
        noOffset = false,
		Parent = Instance.new("Part")
	},{
		windowProperty.noOffset and "" or "noOffset",
		windowProperty.IsMobile and "" or "IsMobile",
		windowProperty.UseConfig and "" or "UseConfig",
		windowProperty.Theme and "" or "Theme",
		windowProperty.Parent and "" or "Parent"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	didPass, failedItems = typecheck(windowProperty,{
		Config = "",
	},{
		windowProperty.UseConfig and "" or "Config"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Theme

	theme.create(windowProperty.Theme or {})

	-- Data

	data.add({string = ""}, "selectedTab")
	data.add({boolean = false}, "isFirst")
	data.add({number = windowProperty.noOffset and 0 or 58}, "absoluteOffset")
	data.add({name = randomString(32)}, "instanceName")
	data.add({binds = {}}, "currentBinds")
	data.add({string = ""}, "searchText")
	data.add({boolean = true}, "isVisible")
	data.add({boolean = windowProperty.IsMobile}, "isMobile")
	data.add({boolean = false}, "isListening")
	local flags = data.add({list = {}, names = {}}, "flags")
	local configLoaded = data.add({boolean = false}, "configLoaded")
	local useConfig = data.add({boolean = false}, "useConfig")
	local windowData = data.add({data = windowProperty})

	-- Flags

	local config
	if windowProperty.UseConfig then
		useConfig:update("boolean", windowProperty.UseConfig)
		config = windowProperty.Config

		local path = {"darius-configs",`/{config}`}
		local built = ""
		for i=1,#path do
			built = built..path[i]
			if not customFunctions.isfolder(built) then
				customFunctions.makefolder(built)
			end
		end
		config = built.."/config.json"
		if not customFunctions.isfile(config) then
			customFunctions.writefile(config, "{}")
		end
	end

	-- Instance

	local bindableEvent = fusion.New "BindableEvent" {}
	darius.OnDestruction = bindableEvent.Event
	mainLayout(windowProperty, bindableEvent)
	local tabButtonList = references.get("tabButtonList")
	local tabFrameList = references.get("tabFrameList")

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
		return tabs[tab.uid]
	end
	function darius:Notify(notifyProperty)
		return addComponent("notification", references.get("notificationList"), notifyProperty)
	end
	function darius:Destroy()
		bindableEvent:Fire()
		bindableEvent:Destroy()
		connections:deleteConnections()
		references:clear()
	end
	function darius:LoadConfig()
		if not windowProperty.UseConfig then
			return
		end
		flags:update("list", HttpService:JSONDecode(customFunctions.readfile(config)))
		observe(flags.list):onChange(function()
			customFunctions.writefile(config, HttpService:JSONEncode(get(flags.list)))
		end)
		configLoaded:update("boolean", true)
	end
	function darius:SetTheme(newTheme)
		local _didPass, _failedItems = typecheck({['New Theme'] = newTheme}, {['New Theme'] = {}})
		assert(_didPass, table.concat(_failedItems, "\n"))
		theme.create(newTheme)
	end

	if customFunctions.getgenv then
		customFunctions.getgenv().dariusInstance = darius
	else
		_G.dariusInstance = darius
	end
	return darius[windowData.uid]
end
return darius