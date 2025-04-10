-- ++++++++ WAX BUNDLED DATA BELOW ++++++++ --

-- Will be used later for getting flattened globals
local ImportGlobals

-- Holds direct closure data (defining this before the DOM tree for line debugging etc)
local ClosureBindings = {
    function()local wax,script,require=ImportGlobals(1)local ImportGlobals return (function(...)local Bundles = require(script.Bundles)
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
		--[[
		_settings:Button({
			Name = "files",
			Callback = function()
				customFunctions.printFileSystem()

			end
		})
		_settings:Button({
			Name = "configs",
			Callback = function()
				print(flagCreator.getConfigs())
			end
		})]]
	end

	if customFunctions.getgenv then
		customFunctions.getgenv().dariusInstance = darius
	else
		_G.dariusInstance = darius
	end
	return darius[windowData.uid]
end
return darius
end)() end,
    function()local wax,script,require=ImportGlobals(2)local ImportGlobals return (function(...)return setmetatable({},{
    __index = function(self, key)
        if script:FindFirstChild(key) then
            return require(script[key])
        else
            error("no bundle: "..key)
        end
    end
})
end)() end,
    function()local wax,script,require=ImportGlobals(3)local ImportGlobals return (function(...)--!strict

--[[
	The entry point for the Fusion library.
]]

local PubTypes = require(script.PubTypes)
local restrictRead = require(script.Utility.restrictRead)

export type StateObject<T> = PubTypes.StateObject<T>
export type CanBeState<T> = PubTypes.CanBeState<T>
export type Symbol = PubTypes.Symbol
export type Value<T> = PubTypes.Value<T>
export type Computed<T> = PubTypes.Computed<T>
export type ForPairs<KO, VO> = PubTypes.ForPairs<KO, VO>
export type ForKeys<KI, KO> = PubTypes.ForKeys<KI, KO>
export type ForValues<VI, VO> = PubTypes.ForKeys<VI, VO>
export type Observer = PubTypes.Observer
export type Tween<T> = PubTypes.Tween<T>
export type Spring<T> = PubTypes.Spring<T>

type Fusion = {
	version: PubTypes.Version,

	New: (className: string) -> ((propertyTable: PubTypes.PropertyTable) -> Instance),
	Hydrate: (target: Instance) -> ((propertyTable: PubTypes.PropertyTable) -> Instance),
	Ref: PubTypes.SpecialKey,
	Cleanup: PubTypes.SpecialKey,
	Children: PubTypes.SpecialKey,
	Out: PubTypes.SpecialKey,
	OnEvent: (eventName: string) -> PubTypes.SpecialKey,
	OnChange: (propertyName: string) -> PubTypes.SpecialKey,

	Value: <T>(initialValue: T) -> Value<T>,
	Computed: <T>(callback: () -> T, destructor: (T) -> ()?) -> Computed<T>,
	ForPairs: <KI, VI, KO, VO, M>(inputTable: CanBeState<{[KI]: VI}>, processor: (KI, VI) -> (KO, VO, M?), destructor: (KO, VO, M?) -> ()?) -> ForPairs<KO, VO>,
	ForKeys: <KI, KO, M>(inputTable: CanBeState<{[KI]: any}>, processor: (KI) -> (KO, M?), destructor: (KO, M?) -> ()?) -> ForKeys<KO, any>,
	ForValues: <VI, VO, M>(inputTable: CanBeState<{[any]: VI}>, processor: (VI) -> (VO, M?), destructor: (VO, M?) -> ()?) -> ForValues<any, VO>,
	Observer: (watchedState: StateObject<any>) -> Observer,

	Tween: <T>(goalState: StateObject<T>, tweenInfo: TweenInfo?) -> Tween<T>,
	Spring: <T>(goalState: StateObject<T>, speed: number?, damping: number?) -> Spring<T>,

	cleanup: (...any) -> (),
	doNothing: (...any) -> ()
}

return restrictRead("Fusion", {
	version = {major = 0, minor = 2, isRelease = true},

	New = require(script.Instances.New),
	Hydrate = require(script.Instances.Hydrate),
	Ref = require(script.Instances.Ref),
	Out = require(script.Instances.Out),
	Cleanup = require(script.Instances.Cleanup),
	Children = require(script.Instances.Children),
	OnEvent = require(script.Instances.OnEvent),
	OnChange = require(script.Instances.OnChange),

	Value = require(script.State.Value),
	Computed = require(script.State.Computed),
	ForPairs = require(script.State.ForPairs),
	ForKeys = require(script.State.ForKeys),
	ForValues = require(script.State.ForValues),
	Observer = require(script.State.Observer),

	Tween = require(script.Animation.Tween),
	Spring = require(script.Animation.Spring),

	cleanup = require(script.Utility.cleanup),
	doNothing = require(script.Utility.doNothing)
}) :: Fusion

end)() end,
    [5] = function()local wax,script,require=ImportGlobals(5)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new computed state object, which follows the value of another
	state object using a spring simulation.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local logError = require(Package.Logging.logError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local unpackType = require(Package.Animation.unpackType)
local SpringScheduler = require(Package.Animation.SpringScheduler)
local useDependency = require(Package.Dependencies.useDependency)
local initDependency = require(Package.Dependencies.initDependency)
local updateAll = require(Package.Dependencies.updateAll)
local xtypeof = require(Package.Utility.xtypeof)
local unwrap = require(Package.State.unwrap)

local class = {}

local CLASS_METATABLE = {__index = class}
local WEAK_KEYS_METATABLE = {__mode = "k"}

--[[
	Returns the current value of this Spring object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._currentValue
end

--[[
	Sets the position of the internal springs, meaning the value of this
	Spring will jump to the given value. This doesn't affect velocity.

	If the type doesn't match the current type of the spring, an error will be
	thrown.
]]
function class:setPosition(newValue: PubTypes.Animatable)
	local newType = typeof(newValue)
	if newType ~= self._currentType then
		logError("springTypeMismatch", nil, newType, self._currentType)
	end

	self._springPositions = unpackType(newValue, newType)
	self._currentValue = newValue
	SpringScheduler.add(self)
	updateAll(self)
end

--[[
	Sets the velocity of the internal springs, overwriting the existing velocity
	of this Spring. This doesn't affect position.

	If the type doesn't match the current type of the spring, an error will be
	thrown.
]]
function class:setVelocity(newValue: PubTypes.Animatable)
	local newType = typeof(newValue)
	if newType ~= self._currentType then
		logError("springTypeMismatch", nil, newType, self._currentType)
	end

	self._springVelocities = unpackType(newValue, newType)
	SpringScheduler.add(self)
end

--[[
	Adds to the velocity of the internal springs, on top of the existing
	velocity of this Spring. This doesn't affect position.

	If the type doesn't match the current type of the spring, an error will be
	thrown.
]]
function class:addVelocity(deltaValue: PubTypes.Animatable)
	local deltaType = typeof(deltaValue)
	if deltaType ~= self._currentType then
		logError("springTypeMismatch", nil, deltaType, self._currentType)
	end

	local springDeltas = unpackType(deltaValue, deltaType)
	for index, delta in ipairs(springDeltas) do
		self._springVelocities[index] += delta
	end
	SpringScheduler.add(self)
end

--[[
	Called when the goal state changes value, or when the speed or damping has
	changed.
]]
function class:update(): boolean
	local goalValue = self._goalState:get(false)

	-- figure out if this was a goal change or a speed/damping change
	if goalValue == self._goalValue then
		-- speed/damping change
		local damping = unwrap(self._damping)
		if typeof(damping) ~= "number" then
			logErrorNonFatal("mistypedSpringDamping", nil, typeof(damping))
		elseif damping < 0 then
			logErrorNonFatal("invalidSpringDamping", nil, damping)
		else
			self._currentDamping = damping
		end

		local speed = unwrap(self._speed)
		if typeof(speed) ~= "number" then
			logErrorNonFatal("mistypedSpringSpeed", nil, typeof(speed))
		elseif speed < 0 then
			logErrorNonFatal("invalidSpringSpeed", nil, speed)
		else
			self._currentSpeed = speed
		end

		return false
	else
		-- goal change - reconfigure spring to target new goal
		self._goalValue = goalValue

		local oldType = self._currentType
		local newType = typeof(goalValue)
		self._currentType = newType

		local springGoals = unpackType(goalValue, newType)
		local numSprings = #springGoals
		self._springGoals = springGoals

		if newType ~= oldType then
			-- if the type changed, snap to the new value and rebuild the
			-- position and velocity tables
			self._currentValue = self._goalValue

			local springPositions = table.create(numSprings, 0)
			local springVelocities = table.create(numSprings, 0)
			for index, springGoal in ipairs(springGoals) do
				springPositions[index] = springGoal
			end
			self._springPositions = springPositions
			self._springVelocities = springVelocities

			-- the spring may have been animating before, so stop that
			SpringScheduler.remove(self)
			return true

			-- otherwise, the type hasn't changed, just the goal...
		elseif numSprings == 0 then
			-- if the type isn't animatable, snap to the new value
			self._currentValue = self._goalValue
			return true

		else
			-- if it's animatable, let it animate to the goal
			SpringScheduler.add(self)
			return false
		end
	end
end

local function Spring<T>(
	goalState: PubTypes.Value<T>,
	speed: PubTypes.CanBeState<number>?,
	damping: PubTypes.CanBeState<number>?
): Types.Spring<T>
	-- apply defaults for speed and damping
	if speed == nil then
		speed = 10
	end
	if damping == nil then
		damping = 1
	end

	local dependencySet = {[goalState] = true}
	if xtypeof(speed) == "State" then
		dependencySet[speed] = true
	end
	if xtypeof(damping) == "State" then
		dependencySet[damping] = true
	end

	local self = setmetatable({
		type = "State",
		kind = "Spring",
		dependencySet = dependencySet,
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_speed = speed,
		_damping = damping,

		_goalState = goalState,
		_goalValue = nil,

		_currentType = nil,
		_currentValue = nil,
		_currentSpeed = unwrap(speed),
		_currentDamping = unwrap(damping),

		_springPositions = nil,
		_springGoals = nil,
		_springVelocities = nil
	}, CLASS_METATABLE)

	initDependency(self)
	-- add this object to the goal state's dependent set
	goalState.dependentSet[self] = true
	self:update()

	return self
end

return Spring
end)() end,
    [6] = function()local wax,script,require=ImportGlobals(6)local ImportGlobals return (function(...)---@diagnostic disable: undefined-global
--!strict

--[[
	Manages batch updating of spring objects.
]]

local RunService = cloneref and cloneref(game:GetService("RunService")) or game:GetService("RunService")

local Package = script.Parent.Parent
local Types = require(Package.Types)
local packType = require(Package.Animation.packType)
local springCoefficients = require(Package.Animation.springCoefficients)
local updateAll = require(Package.Dependencies.updateAll)

type Set<T> = {[T]: any}
type Spring = Types.Spring<any>

local SpringScheduler = {}

local EPSILON = 0.0001
local activeSprings: Set<Spring> = {}
local lastUpdateTime = os.clock()

function SpringScheduler.add(spring: Spring)
	-- we don't necessarily want to use the most accurate time - here we snap to
	-- the last update time so that springs started within the same frame have
	-- identical time steps
	spring._lastSchedule = lastUpdateTime
	spring._startDisplacements = {}
	spring._startVelocities = {}
	for index, goal in ipairs(spring._springGoals) do
		spring._startDisplacements[index] = spring._springPositions[index] - goal
		spring._startVelocities[index] = spring._springVelocities[index]
	end

	activeSprings[spring] = true
end

function SpringScheduler.remove(spring: Spring)
	activeSprings[spring] = nil
end


local function updateAllSprings()
	local springsToSleep: Set<Spring> = {}
	lastUpdateTime = os.clock()

	for spring in pairs(activeSprings) do
		local posPos, posVel, velPos, velVel = springCoefficients(lastUpdateTime - spring._lastSchedule, spring._currentDamping, spring._currentSpeed)

		local positions = spring._springPositions
		local velocities = spring._springVelocities
		local startDisplacements = spring._startDisplacements
		local startVelocities = spring._startVelocities
		local isMoving = false

		for index, goal in ipairs(spring._springGoals) do
			local oldDisplacement = startDisplacements[index]
			local oldVelocity = startVelocities[index]
			local newDisplacement = oldDisplacement * posPos + oldVelocity * posVel
			local newVelocity = oldDisplacement * velPos + oldVelocity * velVel

			if math.abs(newDisplacement) > EPSILON or math.abs(newVelocity) > EPSILON then
				isMoving = true
			end

			positions[index] = newDisplacement + goal
			velocities[index] = newVelocity
		end

		if not isMoving then
			springsToSleep[spring] = true
		end
	end

	for spring in pairs(activeSprings) do
		spring._currentValue = packType(spring._springPositions, spring._currentType)
		updateAll(spring)
	end

	for spring in pairs(springsToSleep) do
		activeSprings[spring] = nil
	end
end

RunService:BindToRenderStep(
	"__FusionSpringScheduler",
	Enum.RenderPriority.First.Value,
	updateAllSprings
)

return SpringScheduler
end)() end,
    [7] = function()local wax,script,require=ImportGlobals(7)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new computed state object, which follows the value of another
	state object using a tween.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local TweenScheduler = require(Package.Animation.TweenScheduler)
local useDependency = require(Package.Dependencies.useDependency)
local initDependency = require(Package.Dependencies.initDependency)
local logError = require(Package.Logging.logError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local xtypeof = require(Package.Utility.xtypeof)

local class = {}

local CLASS_METATABLE = {__index = class}
local WEAK_KEYS_METATABLE = {__mode = "k"}

--[[
	Returns the current value of this Tween object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._currentValue
end

--[[
	Called when the goal state changes value; this will initiate a new tween.
	Returns false as the current value doesn't change right away.
]]
function class:update(): boolean
	local goalValue = self._goalState:get(false)

	-- if the goal hasn't changed, then this is a TweenInfo change.
	-- in that case, if we're not currently animating, we can skip everything
	if goalValue == self._nextValue and not self._currentlyAnimating then
		return false
	end

	local tweenInfo = self._tweenInfo
	if self._tweenInfoIsState then
		tweenInfo = tweenInfo:get()
	end

	-- if we receive a bad TweenInfo, then error and stop the update
	if typeof(tweenInfo) ~= "TweenInfo" then
		logErrorNonFatal("mistypedTweenInfo", nil, typeof(tweenInfo))
		return false
	end

	self._prevValue = self._currentValue
	self._nextValue = goalValue

	self._currentTweenStartTime = os.clock()
	self._currentTweenInfo = tweenInfo

	local tweenDuration = tweenInfo.DelayTime + tweenInfo.Time
	if tweenInfo.Reverses then
		tweenDuration += tweenInfo.Time
	end
	tweenDuration *= tweenInfo.RepeatCount + 1
	self._currentTweenDuration = tweenDuration

	-- start animating this tween
	TweenScheduler.add(self)

	return false
end

local function Tween<T>(
	goalState: PubTypes.StateObject<PubTypes.Animatable>,
	tweenInfo: PubTypes.CanBeState<TweenInfo>?
): Types.Tween<T>
	local currentValue = goalState:get(false)

	-- apply defaults for tween info
	if tweenInfo == nil then
		tweenInfo = TweenInfo.new()
	end

	local dependencySet = {[goalState] = true}
	local tweenInfoIsState = xtypeof(tweenInfo) == "State"

	if tweenInfoIsState then
		dependencySet[tweenInfo] = true
	end

	local startingTweenInfo = tweenInfo
	if tweenInfoIsState then
		startingTweenInfo = startingTweenInfo:get()
	end

	-- If we start with a bad TweenInfo, then we don't want to construct a Tween
	if typeof(startingTweenInfo) ~= "TweenInfo" then
		logError("mistypedTweenInfo", nil, typeof(startingTweenInfo))
	end

	local self = setmetatable({
		type = "State",
		kind = "Tween",
		dependencySet = dependencySet,
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_goalState = goalState,
		_tweenInfo = tweenInfo,
		_tweenInfoIsState = tweenInfoIsState,

		_prevValue = currentValue,
		_nextValue = currentValue,
		_currentValue = currentValue,

		-- store current tween into separately from 'real' tween into, so it
		-- isn't affected by :setTweenInfo() until next change
		_currentTweenInfo = tweenInfo,
		_currentTweenDuration = 0,
		_currentTweenStartTime = 0,
		_currentlyAnimating = false
	}, CLASS_METATABLE)

	initDependency(self)
	-- add this object to the goal state's dependent set
	goalState.dependentSet[self] = true

	return self
end

return Tween
end)() end,
    [8] = function()local wax,script,require=ImportGlobals(8)local ImportGlobals return (function(...)---@diagnostic disable: undefined-global
--!strict

--[[
	Manages batch updating of tween objects.
]]

local RunService = cloneref and cloneref(game:GetService("RunService")) or game:GetService("RunService")

local Package = script.Parent.Parent
local Types = require(Package.Types)
local lerpType = require(Package.Animation.lerpType)
local getTweenRatio = require(Package.Animation.getTweenRatio)
local updateAll = require(Package.Dependencies.updateAll)

local TweenScheduler = {}

type Set<T> = {[T]: any}
type Tween = Types.Tween<any>

local WEAK_KEYS_METATABLE = {__mode = "k"}

-- all the tweens currently being updated
local allTweens: Set<Tween> = {}
setmetatable(allTweens, WEAK_KEYS_METATABLE)

--[[
	Adds a Tween to be updated every render step.
]]
function TweenScheduler.add(tween: Tween)
	allTweens[tween] = true
end

--[[
	Removes a Tween from the scheduler.
]]
function TweenScheduler.remove(tween: Tween)
	allTweens[tween] = nil
end

--[[
	Updates all Tween objects.
]]
local function updateAllTweens()
	local now = os.clock()
	-- FIXME: Typed Luau doesn't understand this loop yet
	for tween: Tween in pairs(allTweens :: any) do
		local currentTime = now - tween._currentTweenStartTime

		if currentTime > tween._currentTweenDuration then
			if tween._currentTweenInfo.Reverses then
				tween._currentValue = tween._prevValue
			else
				tween._currentValue = tween._nextValue
			end
			tween._currentlyAnimating = false
			updateAll(tween)
			TweenScheduler.remove(tween)
		else
			local ratio = getTweenRatio(tween._currentTweenInfo, currentTime)
			local currentValue = lerpType(tween._prevValue, tween._nextValue, ratio)
			tween._currentValue = currentValue
			tween._currentlyAnimating = true
			updateAll(tween)
		end
	end
end

RunService:BindToRenderStep(
	"__FusionTweenScheduler",
	Enum.RenderPriority.First.Value,
	updateAllTweens
)

return TweenScheduler
end)() end,
    [9] = function()local wax,script,require=ImportGlobals(9)local ImportGlobals return (function(...)---@diagnostic disable: undefined-global
--!strict

--[[
	Given a `tweenInfo` and `currentTime`, returns a ratio which can be used to
	tween between two values over time.
]]

local TweenService = cloneref and cloneref(game:GetService("TweenService")) or game:GetService("TweenService")

local function getTweenRatio(tweenInfo: TweenInfo, currentTime: number): number
	local delay = tweenInfo.DelayTime
	local duration = tweenInfo.Time
	local reverses = tweenInfo.Reverses
	local numCycles = 1 + tweenInfo.RepeatCount
	local easeStyle = tweenInfo.EasingStyle
	local easeDirection = tweenInfo.EasingDirection

	local cycleDuration = delay + duration
	if reverses then
		cycleDuration += duration
	end

	if currentTime >= cycleDuration * numCycles then
		return 1
	end

	local cycleTime = currentTime % cycleDuration

	if cycleTime <= delay then
		return 0
	end

	local tweenProgress = (cycleTime - delay) / duration
	if tweenProgress > 1 then
		tweenProgress = 2 - tweenProgress
	end

	local ratio = TweenService:GetValue(tweenProgress, easeStyle, easeDirection)
	return ratio
end

return getTweenRatio
end)() end,
    [10] = function()local wax,script,require=ImportGlobals(10)local ImportGlobals return (function(...)--!strict

--[[
	Linearly interpolates the given animatable types by a ratio.
	If the types are different or not animatable, then the first value will be
	returned for ratios below 0.5, and the second value for 0.5 and above.

	FIXME: This function uses a lot of redefinitions to suppress false positives
	from the Luau typechecker - ideally these wouldn't be required
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Oklab = require(Package.Colour.Oklab)

local function lerpType(from: any, to: any, ratio: number): any
	local typeString = typeof(from)

	if typeof(to) == typeString then
		-- both types must match for interpolation to make sense
		if typeString == "number" then
			local to, from = to :: number, from :: number
			return (to - from) * ratio + from

		elseif typeString == "CFrame" then
			local to, from = to :: CFrame, from :: CFrame
			return from:Lerp(to, ratio)

		elseif typeString == "Color3" then
			local to, from = to :: Color3, from :: Color3
			local fromLab = Oklab.to(from)
			local toLab = Oklab.to(to)
			return Oklab.from(
				fromLab:Lerp(toLab, ratio),
				false
			)

		elseif typeString == "ColorSequenceKeypoint" then
			local to, from = to :: ColorSequenceKeypoint, from :: ColorSequenceKeypoint
			local fromLab = Oklab.to(from.Value)
			local toLab = Oklab.to(to.Value)
			return ColorSequenceKeypoint.new(
				(to.Time - from.Time) * ratio + from.Time,
				Oklab.from(
					fromLab:Lerp(toLab, ratio),
					false
				)
			)

		elseif typeString == "DateTime" then
			local to, from = to :: DateTime, from :: DateTime
			return DateTime.fromUnixTimestampMillis(
				(to.UnixTimestampMillis - from.UnixTimestampMillis) * ratio + from.UnixTimestampMillis
			)

		elseif typeString == "NumberRange" then
			local to, from = to :: NumberRange, from :: NumberRange
			return NumberRange.new(
				(to.Min - from.Min) * ratio + from.Min,
				(to.Max - from.Max) * ratio + from.Max
			)

		elseif typeString == "NumberSequenceKeypoint" then
			local to, from = to :: NumberSequenceKeypoint, from :: NumberSequenceKeypoint
			return NumberSequenceKeypoint.new(
				(to.Time - from.Time) * ratio + from.Time,
				(to.Value - from.Value) * ratio + from.Value,
				(to.Envelope - from.Envelope) * ratio + from.Envelope
			)

		elseif typeString == "PhysicalProperties" then
			local to, from = to :: PhysicalProperties, from :: PhysicalProperties
			return PhysicalProperties.new(
				(to.Density - from.Density) * ratio + from.Density,
				(to.Friction - from.Friction) * ratio + from.Friction,
				(to.Elasticity - from.Elasticity) * ratio + from.Elasticity,
				(to.FrictionWeight - from.FrictionWeight) * ratio + from.FrictionWeight,
				(to.ElasticityWeight - from.ElasticityWeight) * ratio + from.ElasticityWeight
			)

		elseif typeString == "Ray" then
			local to, from = to :: Ray, from :: Ray
			return Ray.new(
				from.Origin:Lerp(to.Origin, ratio),
				from.Direction:Lerp(to.Direction, ratio)
			)

		elseif typeString == "Rect" then
			local to, from = to :: Rect, from :: Rect
			return Rect.new(
				from.Min:Lerp(to.Min, ratio),
				from.Max:Lerp(to.Max, ratio)
			)

		elseif typeString == "Region3" then
			local to, from = to :: Region3, from :: Region3
			-- FUTURE: support rotated Region3s if/when they become constructable
			local position = from.CFrame.Position:Lerp(to.CFrame.Position, ratio)
			local halfSize = from.Size:Lerp(to.Size, ratio) / 2
			return Region3.new(position - halfSize, position + halfSize)

		elseif typeString == "Region3int16" then
			local to, from = to :: Region3int16, from :: Region3int16
			return Region3int16.new(
				Vector3int16.new(
					(to.Min.X - from.Min.X) * ratio + from.Min.X,
					(to.Min.Y - from.Min.Y) * ratio + from.Min.Y,
					(to.Min.Z - from.Min.Z) * ratio + from.Min.Z
				),
				Vector3int16.new(
					(to.Max.X - from.Max.X) * ratio + from.Max.X,
					(to.Max.Y - from.Max.Y) * ratio + from.Max.Y,
					(to.Max.Z - from.Max.Z) * ratio + from.Max.Z
				)
			)

		elseif typeString == "UDim" then
			local to, from = to :: UDim, from :: UDim
			return UDim.new(
				(to.Scale - from.Scale) * ratio + from.Scale,
				(to.Offset - from.Offset) * ratio + from.Offset
			)

		elseif typeString == "UDim2" then
			local to, from = to :: UDim2, from :: UDim2
			return from:Lerp(to, ratio)

		elseif typeString == "Vector2" then
			local to, from = to :: Vector2, from :: Vector2
			return from:Lerp(to, ratio)

		elseif typeString == "Vector2int16" then
			local to, from = to :: Vector2int16, from :: Vector2int16
			return Vector2int16.new(
				(to.X - from.X) * ratio + from.X,
				(to.Y - from.Y) * ratio + from.Y
			)

		elseif typeString == "Vector3" then
			local to, from = to :: Vector3, from :: Vector3
			return from:Lerp(to, ratio)

		elseif typeString == "Vector3int16" then
			local to, from = to :: Vector3int16, from :: Vector3int16
			return Vector3int16.new(
				(to.X - from.X) * ratio + from.X,
				(to.Y - from.Y) * ratio + from.Y,
				(to.Z - from.Z) * ratio + from.Z
			)
		end
	end

	-- fallback case: the types are different or not animatable
	if ratio < 0.5 then
		return from
	else
		return to
	end
end

return lerpType
end)() end,
    [11] = function()local wax,script,require=ImportGlobals(11)local ImportGlobals return (function(...)--!strict

--[[
	Packs an array of numbers into a given animatable data type.
	If the type is not animatable, nil will be returned.

	FUTURE: When Luau supports singleton types, those could be used in
	conjunction with intersection types to make this function fully statically
	type checkable.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Oklab = require(Package.Colour.Oklab)

local function packType(numbers: {number}, typeString: string): PubTypes.Animatable?
	if typeString == "number" then
		return numbers[1]

	elseif typeString == "CFrame" then
		return
			CFrame.new(numbers[1], numbers[2], numbers[3]) *
			CFrame.fromAxisAngle(
				Vector3.new(numbers[4], numbers[5], numbers[6]).Unit,
				numbers[7]
			)

	elseif typeString == "Color3" then
		return Oklab.from(
			Vector3.new(numbers[1], numbers[2], numbers[3]),
			false
		)

	elseif typeString == "ColorSequenceKeypoint" then
		return ColorSequenceKeypoint.new(
			numbers[4],
			Oklab.from(
				Vector3.new(numbers[1], numbers[2], numbers[3]),
				false
			)
		)

	elseif typeString == "DateTime" then
		return DateTime.fromUnixTimestampMillis(numbers[1])

	elseif typeString == "NumberRange" then
		return NumberRange.new(numbers[1], numbers[2])

	elseif typeString == "NumberSequenceKeypoint" then
		return NumberSequenceKeypoint.new(numbers[2], numbers[1], numbers[3])

	elseif typeString == "PhysicalProperties" then
		return PhysicalProperties.new(numbers[1], numbers[2], numbers[3], numbers[4], numbers[5])

	elseif typeString == "Ray" then
		return Ray.new(
			Vector3.new(numbers[1], numbers[2], numbers[3]),
			Vector3.new(numbers[4], numbers[5], numbers[6])
		)

	elseif typeString == "Rect" then
		return Rect.new(numbers[1], numbers[2], numbers[3], numbers[4])

	elseif typeString == "Region3" then
		-- FUTURE: support rotated Region3s if/when they become constructable
		local position = Vector3.new(numbers[1], numbers[2], numbers[3])
		local halfSize = Vector3.new(numbers[4] / 2, numbers[5] / 2, numbers[6] / 2)
		return Region3.new(position - halfSize, position + halfSize)

	elseif typeString == "Region3int16" then
		return Region3int16.new(
			Vector3int16.new(numbers[1], numbers[2], numbers[3]),
			Vector3int16.new(numbers[4], numbers[5], numbers[6])
		)

	elseif typeString == "UDim" then
		return UDim.new(numbers[1], numbers[2])

	elseif typeString == "UDim2" then
		return UDim2.new(numbers[1], numbers[2], numbers[3], numbers[4])

	elseif typeString == "Vector2" then
		return Vector2.new(numbers[1], numbers[2])

	elseif typeString == "Vector2int16" then
		return Vector2int16.new(numbers[1], numbers[2])

	elseif typeString == "Vector3" then
		return Vector3.new(numbers[1], numbers[2], numbers[3])

	elseif typeString == "Vector3int16" then
		return Vector3int16.new(numbers[1], numbers[2], numbers[3])
	else
		return nil
	end
end

return packType
end)() end,
    [12] = function()local wax,script,require=ImportGlobals(12)local ImportGlobals return (function(...)--!strict

--[[
	Returns a 2x2 matrix of coefficients for a given time, damping and speed.
	Specifically, this returns four coefficients - posPos, posVel, velPos, and
	velVel - which can be multiplied with position and velocity like so:

	local newPosition = oldPosition * posPos + oldVelocity * posVel
	local newVelocity = oldPosition * velPos + oldVelocity * velVel

	Special thanks to AxisAngle for helping to improve numerical precision.
]]

local function springCoefficients(time: number, damping: number, speed: number): (number, number, number, number)
	-- if time or speed is 0, then the spring won't move
	if time == 0 or speed == 0 then
		return 1, 0, 0, 1
	end
	local posPos, posVel, velPos, velVel

	if damping > 1 then
		-- overdamped spring
		-- solution to the characteristic equation:
		-- z = -ζω ± Sqrt[ζ^2 - 1] ω
		-- x[t] -> x0(e^(t z2) z1 - e^(t z1) z2)/(z1 - z2)
		--		 + v0(e^(t z1) - e^(t z2))/(z1 - z2)
		-- v[t] -> x0(z1 z2(-e^(t z1) + e^(t z2)))/(z1 - z2)
		--		 + v0(z1 e^(t z1) - z2 e^(t z2))/(z1 - z2)

		local scaledTime = time * speed
		local alpha = math.sqrt(damping^2 - 1)
		local scaledInvAlpha = -0.5 / alpha
		local z1 = -alpha - damping
		local z2 = 1 / z1
		local expZ1 = math.exp(scaledTime * z1)
		local expZ2 = math.exp(scaledTime * z2)

		posPos = (expZ2*z1 - expZ1*z2) * scaledInvAlpha
		posVel = (expZ1 - expZ2) * scaledInvAlpha / speed
		velPos = (expZ2 - expZ1) * scaledInvAlpha * speed
		velVel = (expZ1*z1 - expZ2*z2) * scaledInvAlpha

	elseif damping == 1 then
		-- critically damped spring
		-- x[t] -> x0(e^-tω)(1+tω) + v0(e^-tω)t
		-- v[t] -> x0(t ω^2)(-e^-tω) + v0(1 - tω)(e^-tω)

		local scaledTime = time * speed
		local expTerm = math.exp(-scaledTime)

		posPos = expTerm * (1 + scaledTime)
		posVel = expTerm * time
		velPos = expTerm * (-scaledTime*speed)
		velVel = expTerm * (1 - scaledTime)

	else
		-- underdamped spring
		-- factored out of the solutions to the characteristic equation:
		-- α = Sqrt[1 - ζ^2]
		-- x[t] -> x0(e^-tζω)(α Cos[tα] + ζω Sin[tα])/α
		--       + v0(e^-tζω)(Sin[tα])/α
		-- v[t] -> x0(-e^-tζω)(α^2 + ζ^2 ω^2)(Sin[tα])/α
		--       + v0(e^-tζω)(α Cos[tα] - ζω Sin[tα])/α

		local scaledTime = time * speed
		local alpha = math.sqrt(1 - damping^2)
		local invAlpha = 1 / alpha
		local alphaTime = alpha * scaledTime
		local expTerm = math.exp(-scaledTime*damping)
		local sinTerm = expTerm * math.sin(alphaTime)
		local cosTerm = expTerm * math.cos(alphaTime)
		local sinInvAlpha = sinTerm*invAlpha
		local sinInvAlphaDamp = sinInvAlpha*damping

		posPos = sinInvAlphaDamp + cosTerm
		posVel = sinInvAlpha
		velPos = -(sinInvAlphaDamp*damping + sinTerm*alpha)
		velVel = cosTerm - sinInvAlphaDamp
	end

	return posPos, posVel, velPos, velVel
end

return springCoefficients

end)() end,
    [13] = function()local wax,script,require=ImportGlobals(13)local ImportGlobals return (function(...)--!strict

--[[
	Unpacks an animatable type into an array of numbers.
	If the type is not animatable, an empty array will be returned.

	FIXME: This function uses a lot of redefinitions to suppress false positives
	from the Luau typechecker - ideally these wouldn't be required

	FUTURE: When Luau supports singleton types, those could be used in
	conjunction with intersection types to make this function fully statically
	type checkable.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Oklab = require(Package.Colour.Oklab)

local function unpackType(value: any, typeString: string): {number}
	if typeString == "number" then
		local value = value :: number
		return {value}

	elseif typeString == "CFrame" then
		-- FUTURE: is there a better way of doing this? doing distance
		-- calculations on `angle` may be incorrect
		local axis, angle = value:ToAxisAngle()
		return {value.X, value.Y, value.Z, axis.X, axis.Y, axis.Z, angle}

	elseif typeString == "Color3" then
		local lab = Oklab.to(value)
		return {lab.X, lab.Y, lab.Z}

	elseif typeString == "ColorSequenceKeypoint" then
		local lab = Oklab.to(value.Value)
		return {lab.X, lab.Y, lab.Z, value.Time}

	elseif typeString == "DateTime" then
		return {value.UnixTimestampMillis}

	elseif typeString == "NumberRange" then
		return {value.Min, value.Max}

	elseif typeString == "NumberSequenceKeypoint" then
		return {value.Value, value.Time, value.Envelope}

	elseif typeString == "PhysicalProperties" then
		return {value.Density, value.Friction, value.Elasticity, value.FrictionWeight, value.ElasticityWeight}

	elseif typeString == "Ray" then
		return {value.Origin.X, value.Origin.Y, value.Origin.Z, value.Direction.X, value.Direction.Y, value.Direction.Z}

	elseif typeString == "Rect" then
		return {value.Min.X, value.Min.Y, value.Max.X, value.Max.Y}

	elseif typeString == "Region3" then
		-- FUTURE: support rotated Region3s if/when they become constructable
		return {
			value.CFrame.X, value.CFrame.Y, value.CFrame.Z,
			value.Size.X, value.Size.Y, value.Size.Z
		}

	elseif typeString == "Region3int16" then
		return {value.Min.X, value.Min.Y, value.Min.Z, value.Max.X, value.Max.Y, value.Max.Z}

	elseif typeString == "UDim" then
		return {value.Scale, value.Offset}

	elseif typeString == "UDim2" then
		return {value.X.Scale, value.X.Offset, value.Y.Scale, value.Y.Offset}

	elseif typeString == "Vector2" then
		return {value.X, value.Y}

	elseif typeString == "Vector2int16" then
		return {value.X, value.Y}

	elseif typeString == "Vector3" then
		return {value.X, value.Y, value.Z}

	elseif typeString == "Vector3int16" then
		return {value.X, value.Y, value.Z}
	else
		return {}
	end
end

return unpackType
end)() end,
    [15] = function()local wax,script,require=ImportGlobals(15)local ImportGlobals return (function(...)--!strict

--[[
	Provides functions for converting Color3s into Oklab space, for more
	perceptually uniform colour blending.

	See: https://bottosson.github.io/posts/oklab/
]]

local Oklab = {}

-- Converts a Color3 in RGB space to a Vector3 in Oklab space.
function Oklab.to(rgb: Color3): Vector3
	local l = rgb.R * 0.4122214708 + rgb.G * 0.5363325363 + rgb.B * 0.0514459929
	local m = rgb.R * 0.2119034982 + rgb.G * 0.6806995451 + rgb.B * 0.1073969566
	local s = rgb.R * 0.0883024619 + rgb.G * 0.2817188376 + rgb.B * 0.6299787005

	local lRoot = l ^ (1/3)
	local mRoot = m ^ (1/3)
	local sRoot = s ^ (1/3)

	return Vector3.new(
		lRoot * 0.2104542553 + mRoot * 0.7936177850 - sRoot * 0.0040720468,
		lRoot * 1.9779984951 - mRoot * 2.4285922050 + sRoot * 0.4505937099,
		lRoot * 0.0259040371 + mRoot * 0.7827717662 - sRoot * 0.8086757660
	)
end

-- Converts a Vector3 in CIELAB space to a Color3 in RGB space.
-- The Color3 will be clamped by default unless specified otherwise.
function Oklab.from(lab: Vector3, unclamped: boolean?): Color3
	local lRoot = lab.X + lab.Y * 0.3963377774 + lab.Z * 0.2158037573
	local mRoot = lab.X - lab.Y * 0.1055613458 - lab.Z * 0.0638541728
	local sRoot = lab.X - lab.Y * 0.0894841775 - lab.Z * 1.2914855480

	local l = lRoot ^ 3
	local m = mRoot ^ 3
	local s = sRoot ^ 3

	local red = l * 4.0767416621 - m * 3.3077115913 + s * 0.2309699292
	local green = l * -1.2684380046 + m * 2.6097574011 - s * 0.3413193965
	local blue = l * -0.0041960863 - m * 0.7034186147 + s * 1.7076147010

	if not unclamped then
		red = math.clamp(red, 0, 1)
		green = math.clamp(green, 0, 1)
		blue = math.clamp(blue, 0, 1)
	end

	return Color3.new(red, green, blue)
end

return Oklab

end)() end,
    [17] = function()local wax,script,require=ImportGlobals(17)local ImportGlobals return (function(...)--!strict

--[[
	Calls the given callback, and stores any used external dependencies.
	Arguments can be passed in after the callback.
	If the callback completed successfully, returns true and the returned value,
	otherwise returns false and the error thrown.
	The callback shouldn't yield or run asynchronously.

	NOTE: any calls to useDependency() inside the callback (even if inside any
	nested captureDependencies() call) will not be included in the set, to avoid
	self-dependencies.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local parseError = require(Package.Logging.parseError)
local sharedState = require(Package.Dependencies.sharedState)

type Set<T> = {[T]: any}

local initialisedStack = sharedState.initialisedStack
local initialisedStackCapacity = 0

local function captureDependencies(
	saveToSet: Set<PubTypes.Dependency>,
	callback: (...any) -> any,
	...
): (boolean, any)

	local prevDependencySet = sharedState.dependencySet
	sharedState.dependencySet = saveToSet

	sharedState.initialisedStackSize += 1
	local initialisedStackSize = sharedState.initialisedStackSize

	local initialisedSet
	if initialisedStackSize > initialisedStackCapacity then
		initialisedSet = {}
		initialisedStack[initialisedStackSize] = initialisedSet
		initialisedStackCapacity = initialisedStackSize
	else
		initialisedSet = initialisedStack[initialisedStackSize]
		table.clear(initialisedSet)
	end

	local data = table.pack(xpcall(callback, parseError, ...))

	sharedState.dependencySet = prevDependencySet
	sharedState.initialisedStackSize -= 1

	return table.unpack(data, 1, data.n)
end

return captureDependencies

end)() end,
    [18] = function()local wax,script,require=ImportGlobals(18)local ImportGlobals return (function(...)--!strict

--[[
	Registers the creation of an object which can be used as a dependency.

	This is used to make sure objects don't capture dependencies originating
	from inside of themselves.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local sharedState = require(Package.Dependencies.sharedState)

local initialisedStack = sharedState.initialisedStack

local function initDependency(dependency: PubTypes.Dependency)
	local initialisedStackSize = sharedState.initialisedStackSize

	for index, initialisedSet in ipairs(initialisedStack) do
		if index > initialisedStackSize then
			return
		end

		initialisedSet[dependency] = true
	end
end

return initDependency
end)() end,
    [19] = function()local wax,script,require=ImportGlobals(19)local ImportGlobals return (function(...)--!strict

--[[
	Stores shared state for dependency management functions.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)

type Set<T> = {[T]: any}

-- The set where used dependencies should be saved to.
local dependencySet: Set<PubTypes.Dependency>? = nil

-- A stack of sets where newly created dependencies should be stored.
local initialisedStack: {Set<PubTypes.Dependency>} = {}
local initialisedStackSize = 0

return {
	dependencySet = dependencySet,
	initialisedStack = initialisedStack,
	initialisedStackSize = initialisedStackSize
}
end)() end,
    [20] = function()local wax,script,require=ImportGlobals(20)local ImportGlobals return (function(...)--!strict

--[[
	Given a reactive object, updates all dependent reactive objects.
	Objects are only ever updated after all of their dependencies are updated,
	are only ever updated once, and won't be updated if their dependencies are
	unchanged.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)

type Set<T> = {[T]: any}
type Descendant = (PubTypes.Dependent & PubTypes.Dependency) | PubTypes.Dependent

-- Credit: https://blog.elttob.uk/2022/11/07/sets-efficient-topological-search.html
local function updateAll(root: PubTypes.Dependency)
	local counters: {[Descendant]: number} = {}
	local flags: {[Descendant]: boolean} = {}
	local queue: {Descendant} = {}
	local queueSize = 0
	local queuePos = 1

	for object in root.dependentSet do
		queueSize += 1
		queue[queueSize] = object
		flags[object] = true
	end

	-- Pass 1: counting up
	while queuePos <= queueSize do
		local next = queue[queuePos]
		local counter = counters[next]
		counters[next] = if counter == nil then 1 else counter + 1
		if (next :: any).dependentSet ~= nil then
			for object in (next :: any).dependentSet do
				queueSize += 1
				queue[queueSize] = object
			end
		end
		queuePos += 1
	end

	-- Pass 2: counting down + processing
	queuePos = 1
	while queuePos <= queueSize do
		local next = queue[queuePos]
		local counter = counters[next] - 1
		counters[next] = counter
		if counter == 0 and flags[next] and next:update() and (next :: any).dependentSet ~= nil then
			for object in (next :: any).dependentSet do
				flags[object] = true
			end
		end
		queuePos += 1
	end
end

return updateAll
end)() end,
    [21] = function()local wax,script,require=ImportGlobals(21)local ImportGlobals return (function(...)--!strict

--[[
	If a target set was specified by captureDependencies(), this will add the
	given dependency to the target set.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local sharedState = require(Package.Dependencies.sharedState)

local initialisedStack = sharedState.initialisedStack

local function useDependency(dependency: PubTypes.Dependency)
	local dependencySet = sharedState.dependencySet

	if dependencySet ~= nil then
		local initialisedStackSize = sharedState.initialisedStackSize
		if initialisedStackSize > 0 then
			local initialisedSet = initialisedStack[initialisedStackSize]
			if initialisedSet[dependency] ~= nil then
				return
			end
		end
		dependencySet[dependency] = true
	end
end

return useDependency
end)() end,
    [23] = function()local wax,script,require=ImportGlobals(23)local ImportGlobals return (function(...)--!strict

--[[
	A special key for property tables, which parents any given descendants into
	an instance.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logWarn = require(Package.Logging.logWarn)
local Observer = require(Package.State.Observer)
local xtypeof = require(Package.Utility.xtypeof)

type Set<T> = {[T]: boolean}

-- Experimental flag: name children based on the key used in the [Children] table
local EXPERIMENTAL_AUTO_NAMING = false

local Children = {}
Children.type = "SpecialKey"
Children.kind = "Children"
Children.stage = "descendants"

function Children:apply(propValue: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
	local newParented: Set<Instance> = {}
	local oldParented: Set<Instance> = {}

	-- save disconnection functions for state object observers
	local newDisconnects: {[PubTypes.StateObject<any>]: () -> ()} = {}
	local oldDisconnects: {[PubTypes.StateObject<any>]: () -> ()} = {}

	local updateQueued = false
	local queueUpdate: () -> ()

	-- Rescans this key's value to find new instances to parent and state objects
	-- to observe for changes; then unparents instances no longer found and
	-- disconnects observers for state objects no longer present.
	local function updateChildren()
		if not updateQueued then
			return -- this update may have been canceled by destruction, etc.
		end
		updateQueued = false

		oldParented, newParented = newParented, oldParented
		oldDisconnects, newDisconnects = newDisconnects, oldDisconnects
		table.clear(newParented)
		table.clear(newDisconnects)

		local function processChild(child: any, autoName: string?)
			local kind = xtypeof(child)

			if kind == "Instance" then
				-- case 1; single instance

				newParented[child] = true
				if oldParented[child] == nil then
					-- wasn't previously present

					-- TODO: check for ancestry conflicts here
					child.Parent = applyTo
				else
					-- previously here; we want to reuse, so remove from old
					-- set so we don't encounter it during unparenting
					oldParented[child] = nil
				end

				if EXPERIMENTAL_AUTO_NAMING and autoName ~= nil then
					child.Name = autoName
				end

			elseif kind == "State" then
				-- case 2; state object

				local value = child:get(false)
				-- allow nil to represent the absence of a child
				if value ~= nil then
					processChild(value, autoName)
				end

				local disconnect = oldDisconnects[child]
				if disconnect == nil then
					-- wasn't previously present
					disconnect = Observer(child):onChange(queueUpdate)
				else
					-- previously here; we want to reuse, so remove from old
					-- set so we don't encounter it during unparenting
					oldDisconnects[child] = nil
				end

				newDisconnects[child] = disconnect

			elseif kind == "table" then
				-- case 3; table of objects

				for key, subChild in pairs(child) do
					local keyType = typeof(key)
					local subAutoName: string? = nil

					if keyType == "string" then
						subAutoName = key
					elseif keyType == "number" and autoName ~= nil then
						subAutoName = autoName .. "_" .. key
					end

					processChild(subChild, subAutoName)
				end

			else
				logWarn("unrecognisedChildType", kind)
			end
		end

		if propValue ~= nil then
			-- `propValue` is set to nil on cleanup, so we don't process children
			-- in that case
			processChild(propValue)
		end

		-- unparent any children that are no longer present
		for oldInstance in pairs(oldParented) do
			oldInstance.Parent = nil
		end

		-- disconnect observers which weren't reused
		for oldState, disconnect in pairs(oldDisconnects) do
			disconnect()
		end
	end

	queueUpdate = function()
		if not updateQueued then
			updateQueued = true
			task.defer(updateChildren)
		end
	end

	table.insert(cleanupTasks, function()
		propValue = nil
		updateQueued = true
		updateChildren()
	end)

	-- perform initial child parenting
	updateQueued = true
	updateChildren()
end

return Children :: PubTypes.SpecialKey
end)() end,
    [24] = function()local wax,script,require=ImportGlobals(24)local ImportGlobals return (function(...)--!strict

--[[
	A special key for property tables, which adds user-specified tasks to be run
	when the instance is destroyed.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)

local Cleanup = {}
Cleanup.type = "SpecialKey"
Cleanup.kind = "Cleanup"
Cleanup.stage = "observer"

function Cleanup:apply(userTask: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
	table.insert(cleanupTasks, userTask)
end

return Cleanup
end)() end,
    [25] = function()local wax,script,require=ImportGlobals(25)local ImportGlobals return (function(...)--!strict

--[[
	Processes and returns an existing instance, with options for setting
	properties, event handlers and other attributes on the instance.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local applyInstanceProps = require(Package.Instances.applyInstanceProps)

local function Hydrate(target: Instance)
	return function(props: PubTypes.PropertyTable): Instance
		applyInstanceProps(props, target)
		return target
	end
end

return Hydrate
end)() end,
    [26] = function()local wax,script,require=ImportGlobals(26)local ImportGlobals return (function(...)--!strict

--[[
	Constructs and returns a new instance, with options for setting properties,
	event handlers and other attributes on the instance right away.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local defaultProps = require(Package.Instances.defaultProps)
local applyInstanceProps = require(Package.Instances.applyInstanceProps)
local logError= require(Package.Logging.logError)

local function New(className: string)
	return function(props: PubTypes.PropertyTable): Instance
		local ok, instance = pcall(Instance.new, className)

		if not ok then
			logError("cannotCreateClass", nil, className)
		end

		local classDefaults = defaultProps[className]
		if classDefaults ~= nil then
			for defaultProp, defaultValue in pairs(classDefaults) do
				instance[defaultProp] = defaultValue
			end
		end

		applyInstanceProps(props, instance)

		return instance
	end
end

return New
end)() end,
    [27] = function()local wax,script,require=ImportGlobals(27)local ImportGlobals return (function(...)--!strict

--[[
	Constructs special keys for property tables which connect property change
	listeners to an instance.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logError = require(Package.Logging.logError)

local function OnChange(propertyName: string): PubTypes.SpecialKey
	local changeKey = {}
	changeKey.type = "SpecialKey"
	changeKey.kind = "OnChange"
	changeKey.stage = "observer"

	function changeKey:apply(callback: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
		local ok, event = pcall(applyTo.GetPropertyChangedSignal, applyTo, propertyName)
		if not ok then
			logError("cannotConnectChange", nil, applyTo.ClassName, propertyName)
		elseif typeof(callback) ~= "function" then
			logError("invalidChangeHandler", nil, propertyName)
		else
			table.insert(cleanupTasks, event:Connect(function()
				callback((applyTo :: any)[propertyName])
			end))
		end
	end

	return changeKey
end

return OnChange
end)() end,
    [28] = function()local wax,script,require=ImportGlobals(28)local ImportGlobals return (function(...)--!strict

--[[
	Constructs special keys for property tables which connect event listeners to
	an instance.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logError = require(Package.Logging.logError)

local function getProperty_unsafe(instance: Instance, property: string)
	return (instance :: any)[property]
end

local function OnEvent(eventName: string): PubTypes.SpecialKey
	local eventKey = {}
	eventKey.type = "SpecialKey"
	eventKey.kind = "OnEvent"
	eventKey.stage = "observer"

	function eventKey:apply(callback: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
		local ok, event = pcall(getProperty_unsafe, applyTo, eventName)
		if not ok or typeof(event) ~= "RBXScriptSignal" then
			logError("cannotConnectEvent", nil, applyTo.ClassName, eventName)
		elseif typeof(callback) ~= "function" then
			logError("invalidEventHandler", nil, eventName)
		else
			table.insert(cleanupTasks, event:Connect(callback))
		end
	end

	return eventKey
end

return OnEvent
end)() end,
    [29] = function()local wax,script,require=ImportGlobals(29)local ImportGlobals return (function(...)--!strict

--[[
	A special key for property tables, which allows users to extract values from
	an instance into an automatically-updated Value object.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logError = require(Package.Logging.logError)
local xtypeof = require(Package.Utility.xtypeof)

local function Out(propertyName: string): PubTypes.SpecialKey
	local outKey = {}
	outKey.type = "SpecialKey"
	outKey.kind = "Out"
	outKey.stage = "observer"

	function outKey:apply(outState: any, applyTo: Instance, cleanupTasks: { PubTypes.Task })
		local ok, event = pcall(applyTo.GetPropertyChangedSignal, applyTo, propertyName)
		if not ok then
			logError("invalidOutProperty", nil, applyTo.ClassName, propertyName)
		elseif xtypeof(outState) ~= "State" or outState.kind ~= "Value" then
			logError("invalidOutType")
		else
			outState:set((applyTo :: any)[propertyName])
			table.insert(
				cleanupTasks,
				event:Connect(function()
					outState:set((applyTo :: any)[propertyName])
				end)
			)
			table.insert(cleanupTasks, function()
				outState:set(nil)
			end)
		end
	end

	return outKey
end

return Out

end)() end,
    [30] = function()local wax,script,require=ImportGlobals(30)local ImportGlobals return (function(...)--!strict

--[[
	A special key for property tables, which stores a reference to the instance
	in a user-provided Value object.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logError = require(Package.Logging.logError)
local xtypeof = require(Package.Utility.xtypeof)

local Ref = {}
Ref.type = "SpecialKey"
Ref.kind = "Ref"
Ref.stage = "observer"

function Ref:apply(refState: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
	if xtypeof(refState) ~= "State" or refState.kind ~= "Value" then
		logError("invalidRefType")
	else
		refState:set(applyTo)
		table.insert(cleanupTasks, function()
			refState:set(nil)
		end)
	end
end

return Ref
end)() end,
    [31] = function()local wax,script,require=ImportGlobals(31)local ImportGlobals return (function(...)--!strict

--[[
	Applies a table of properties to an instance, including binding to any
	given state objects and applying any special keys.

	No strong reference is kept by default - special keys should take care not
	to accidentally hold strong references to instances forever.

	If a key is used twice, an error will be thrown. This is done to avoid
	double assignments or double bindings. However, some special keys may want
	to enable such assignments - in which case unique keys should be used for
	each occurence.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local cleanup = require(Package.Utility.cleanup)
local xtypeof = require(Package.Utility.xtypeof)
local logError = require(Package.Logging.logError)
local Observer = require(Package.State.Observer)

local function setProperty_unsafe(instance: Instance, property: string, value: any)
	(instance :: any)[property] = value
end

local function testPropertyAssignable(instance: Instance, property: string)
	(instance :: any)[property] = (instance :: any)[property]
end

local function setProperty(instance: Instance, property: string, value: any)
	if not pcall(setProperty_unsafe, instance, property, value) then
		if not pcall(testPropertyAssignable, instance, property) then
			if instance == nil then
				-- reference has been lost
				logError("setPropertyNilRef", nil, property, tostring(value))
			else
				-- property is not assignable
				logError("cannotAssignProperty", nil, instance.ClassName, property)
			end
		else
			-- property is assignable, but this specific assignment failed
			-- this typically implies the wrong type was received
			local givenType = typeof(value)
			local expectedType = typeof((instance :: any)[property])
			logError("invalidPropertyType", nil, instance.ClassName, property, expectedType, givenType)
		end
	end
end

local function bindProperty(instance: Instance, property: string, value: PubTypes.CanBeState<any>, cleanupTasks: {PubTypes.Task})
	if xtypeof(value) == "State" then
		-- value is a state object - assign and observe for changes
		local willUpdate = false
		local function updateLater()
			if not willUpdate then
				willUpdate = true
				task.defer(function()
					willUpdate = false
					setProperty(instance, property, value:get(false))
				end)
			end
		end

		setProperty(instance, property, value:get(false))
		table.insert(cleanupTasks, Observer(value :: any):onChange(updateLater))
	else
		-- value is a constant - assign once only
		setProperty(instance, property, value)
	end
end

local function applyInstanceProps(props: PubTypes.PropertyTable, applyTo: Instance)
	local specialKeys = {
		self = {} :: {[PubTypes.SpecialKey]: any},
		descendants = {} :: {[PubTypes.SpecialKey]: any},
		ancestor = {} :: {[PubTypes.SpecialKey]: any},
		observer = {} :: {[PubTypes.SpecialKey]: any}
	}
	local cleanupTasks = {}

	for key, value in pairs(props) do
		local keyType = xtypeof(key)

		if keyType == "string" then
			if key ~= "Parent" then
				bindProperty(applyTo, key :: string, value, cleanupTasks)
			end
		elseif keyType == "SpecialKey" then
			local stage = (key :: PubTypes.SpecialKey).stage
			local keys = specialKeys[stage]
			if keys == nil then
				logError("unrecognisedPropertyStage", nil, stage)
			else
				keys[key] = value
			end
		else
			-- we don't recognise what this key is supposed to be
			logError("unrecognisedPropertyKey", nil, xtypeof(key))
		end
	end

	for key, value in pairs(specialKeys.self) do
		key:apply(value, applyTo, cleanupTasks)
	end
	for key, value in pairs(specialKeys.descendants) do
		key:apply(value, applyTo, cleanupTasks)
	end

	if props.Parent ~= nil then
		bindProperty(applyTo, "Parent", props.Parent, cleanupTasks)
	end

	for key, value in pairs(specialKeys.ancestor) do
		key:apply(value, applyTo, cleanupTasks)
	end
	for key, value in pairs(specialKeys.observer) do
		key:apply(value, applyTo, cleanupTasks)
	end

	applyTo.Destroying:Connect(function()
		cleanup(cleanupTasks)
	end)
end

return applyInstanceProps
end)() end,
    [32] = function()local wax,script,require=ImportGlobals(32)local ImportGlobals return (function(...)--!strict

--[[
	Stores 'sensible default' properties to be applied to instances created by
	the New function.
]]

return {
	ScreenGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	},

	BillboardGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	},

	SurfaceGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,

		SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
		PixelsPerStud = 50
	},

	Frame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	},

	ScrollingFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		ScrollBarImageColor3 = Color3.new(0, 0, 0)
	},

	TextLabel = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14
	},

	TextButton = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		AutoButtonColor = false,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14
	},

	TextBox = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		ClearTextOnFocus = false,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14
	},

	ImageLabel = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	},

	ImageButton = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		AutoButtonColor = false
	},

	ViewportFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	},

	VideoFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	},
	
	CanvasGroup = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	}
}

end)() end,
    [34] = function()local wax,script,require=ImportGlobals(34)local ImportGlobals return (function(...)--!strict

--[[
	Utility function to log a Fusion-specific error.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)
local messages = require(Package.Logging.messages)

local function logError(messageID: string, errObj: Types.Error?, ...)
	local formatString: string

	if messages[messageID] ~= nil then
		formatString = messages[messageID]
	else
		messageID = "unknownMessage"
		formatString = messages[messageID]
	end

	local errorString
	if errObj == nil then
		errorString = string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")", ...)
	else
		formatString = formatString:gsub("ERROR_MESSAGE", errObj.message)
		errorString = string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")\n---- Stack trace ----\n" .. errObj.trace, ...)
	end

	error(errorString:gsub("\n", "\n    "), 0)
end

return logError
end)() end,
    [35] = function()local wax,script,require=ImportGlobals(35)local ImportGlobals return (function(...)--!strict

--[[
	Utility function to log a Fusion-specific error, without halting execution.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)
local messages = require(Package.Logging.messages)

local function logErrorNonFatal(messageID: string, errObj: Types.Error?, ...)
	local formatString: string

	if messages[messageID] ~= nil then
		formatString = messages[messageID]
	else
		messageID = "unknownMessage"
		formatString = messages[messageID]
	end

	local errorString
	if errObj == nil then
		errorString = string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")", ...)
	else
		formatString = formatString:gsub("ERROR_MESSAGE", errObj.message)
		errorString = string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")\n---- Stack trace ----\n" .. errObj.trace, ...)
	end

	task.spawn(function(...)
		error(errorString:gsub("\n", "\n    "), 0)
	end, ...)
end

return logErrorNonFatal
end)() end,
    [36] = function()local wax,script,require=ImportGlobals(36)local ImportGlobals return (function(...)--!strict

--[[
	Utility function to log a Fusion-specific warning.
]]

local Package = script.Parent.Parent
local messages = require(Package.Logging.messages)

local function logWarn(messageID, ...)
	local formatString: string

	if messages[messageID] ~= nil then
		formatString = messages[messageID]
	else
		messageID = "unknownMessage"
		formatString = messages[messageID]
	end

	warn(string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")", ...))
end

return logWarn
end)() end,
    [37] = function()local wax,script,require=ImportGlobals(37)local ImportGlobals return (function(...)--!strict

--[[
	Stores templates for different kinds of logging messages.
]]

return {
	cannotAssignProperty = "The class type '%s' has no assignable property '%s'.",
	cannotConnectChange = "The %s class doesn't have a property called '%s'.",
	cannotConnectEvent = "The %s class doesn't have an event called '%s'.",
	cannotCreateClass = "Can't create a new instance of class '%s'.",
	computedCallbackError = "Computed callback error: ERROR_MESSAGE",
	destructorNeededValue = "To save instances into Values, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	destructorNeededComputed = "To return instances from Computeds, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	multiReturnComputed = "Returning multiple values from Computeds is discouraged, as behaviour will change soon - see discussion #189 on GitHub.",
	destructorNeededForKeys = "To return instances from ForKeys, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	destructorNeededForValues = "To return instances from ForValues, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	destructorNeededForPairs = "To return instances from ForPairs, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	duplicatePropertyKey = "",
	forKeysProcessorError = "ForKeys callback error: ERROR_MESSAGE",
	forKeysKeyCollision = "ForKeys should only write to output key '%s' once when processing key changes, but it wrote to it twice. Previously input key: '%s'; New input key: '%s'",
	forKeysDestructorError = "ForKeys destructor error: ERROR_MESSAGE",
	forPairsDestructorError = "ForPairs destructor error: ERROR_MESSAGE",
	forPairsKeyCollision = "ForPairs should only write to output key '%s' once when processing key changes, but it wrote to it twice. Previous input pair: '[%s] = %s'; New input pair: '[%s] = %s'",
	forPairsProcessorError = "ForPairs callback error: ERROR_MESSAGE",
	forValuesProcessorError = "ForValues callback error: ERROR_MESSAGE",
	forValuesDestructorError = "ForValues destructor error: ERROR_MESSAGE",
	invalidChangeHandler = "The change handler for the '%s' property must be a function.",
	invalidEventHandler = "The handler for the '%s' event must be a function.",
	invalidPropertyType = "'%s.%s' expected a '%s' type, but got a '%s' type.",
	invalidRefType = "Instance refs must be Value objects.",
	invalidOutType = "[Out] properties must be given Value objects.",
	invalidOutProperty = "The %s class doesn't have a property called '%s'.",
	invalidSpringDamping = "The damping ratio for a spring must be >= 0. (damping was %.2f)",
	invalidSpringSpeed = "The speed of a spring must be >= 0. (speed was %.2f)",
	mistypedSpringDamping = "The damping ratio for a spring must be a number. (got a %s)",
	mistypedSpringSpeed = "The speed of a spring must be a number. (got a %s)",
	mistypedTweenInfo = "The tween info of a tween must be a TweenInfo. (got a %s)",
	springTypeMismatch = "The type '%s' doesn't match the spring's type '%s'.",
	strictReadError = "'%s' is not a valid member of '%s'.",
	unknownMessage = "Unknown error: ERROR_MESSAGE",
	unrecognisedChildType = "'%s' type children aren't accepted by `[Children]`.",
	unrecognisedPropertyKey = "'%s' keys aren't accepted in property tables.",
	unrecognisedPropertyStage = "'%s' isn't a valid stage for a special key to be applied at."
}
end)() end,
    [38] = function()local wax,script,require=ImportGlobals(38)local ImportGlobals return (function(...)--!strict

--[[
	An xpcall() error handler to collect and parse useful information about
	errors, such as clean messages and stack traces.

	TODO: this should have a 'type' field for runtime type checking!
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)

local function parseError(err: string): Types.Error
	return {
		type = "Error",
		raw = err,
		message = err:gsub("^.+:%d+:%s*", ""),
		trace = debug.traceback(nil, 2)
	}
end

return parseError
end)() end,
    [39] = function()local wax,script,require=ImportGlobals(39)local ImportGlobals return (function(...)--!strict

--[[
	Stores common public-facing type information for Fusion APIs.
]]

type Set<T> = {[T]: any}

--[[
	General use types
]]

-- A unique symbolic value.
export type Symbol = {
	type: string, -- replace with "Symbol" when Luau supports singleton types
	name: string
}

-- Types that can be expressed as vectors of numbers, and so can be animated.
export type Animatable =
	number |
	CFrame |
	Color3 |
	ColorSequenceKeypoint |
	DateTime |
	NumberRange |
	NumberSequenceKeypoint |
	PhysicalProperties |
	Ray |
	Rect |
	Region3 |
	Region3int16 |
	UDim |
	UDim2 |
	Vector2 |
	Vector2int16 |
	Vector3 |
	Vector3int16

-- A task which can be accepted for cleanup.
export type Task =
	Instance |
	RBXScriptConnection |
	() -> () |
	{destroy: (any) -> ()} |
	{Destroy: (any) -> ()} |
	{Task}

-- Script-readable version information.
export type Version = {
	major: number,
	minor: number,
	isRelease: boolean
}
--[[
	Generic reactive graph types
]]

-- A graph object which can have dependents.
export type Dependency = {
	dependentSet: Set<Dependent>
}

-- A graph object which can have dependencies.
export type Dependent = {
	update: (Dependent) -> boolean,
	dependencySet: Set<Dependency>
}

-- An object which stores a piece of reactive state.
export type StateObject<T> = Dependency & {
	type: string, -- replace with "State" when Luau supports singleton types
	kind: string,
	get: (StateObject<T>, asDependency: boolean?) -> T
}

-- Either a constant value of type T, or a state object containing type T.
export type CanBeState<T> = StateObject<T> | T

--[[
	Specific reactive graph types
]]

-- A state object whose value can be set at any time by the user.
export type Value<T> = StateObject<T> & {
	-- kind: "State" (add this when Luau supports singleton types)
 	set: (Value<T>, newValue: any, force: boolean?) -> ()
}

-- A state object whose value is derived from other objects using a callback.
export type Computed<T> = StateObject<T> & Dependent & {
	-- kind: "Computed" (add this when Luau supports singleton types)
}

-- A state object whose value is derived from other objects using a callback.
export type ForPairs<KO, VO> = StateObject<{ [KO]: VO }> & Dependent & {
	-- kind: "ForPairs" (add this when Luau supports singleton types)
}
-- A state object whose value is derived from other objects using a callback.
export type ForKeys<KO, V> = StateObject<{ [KO]: V }> & Dependent & {
	-- kind: "ForKeys" (add this when Luau supports singleton types)
}
-- A state object whose value is derived from other objects using a callback.
export type ForValues<K, VO> = StateObject<{ [K]: VO }> & Dependent & {
	-- kind: "ForKeys" (add this when Luau supports singleton types)
}

-- A state object which follows another state object using tweens.
export type Tween<T> = StateObject<T> & Dependent & {
	-- kind: "Tween" (add this when Luau supports singleton types)
}

-- A state object which follows another state object using spring simulation.
export type Spring<T> = StateObject<T> & Dependent & {
	-- kind: "Spring" (add this when Luau supports singleton types)
	-- Uncomment when ENABLE_PARAM_SETTERS is enabled
	-- setPosition: (Spring<T>, newValue: Animatable) -> (),
	-- setVelocity: (Spring<T>, newValue: Animatable) -> (),
	-- addVelocity: (Spring<T>, deltaValue: Animatable) -> ()
}

-- An object which can listen for updates on another state object.
export type Observer = Dependent & {
	-- kind: "Observer" (add this when Luau supports singleton types)
  	onChange: (Observer, callback: () -> ()) -> (() -> ())
}

--[[
	Instance related types
]]

-- Denotes children instances in an instance or component's property table.
export type SpecialKey = {
	type: string, -- replace with "SpecialKey" when Luau supports singleton types
	kind: string,
	stage: string, -- replace with "self" | "descendants" | "ancestor" | "observer" when Luau supports singleton types
	apply: (SpecialKey, value: any, applyTo: Instance, cleanupTasks: {Task}) -> ()
}

-- A collection of instances that may be parented to another instance.
export type Children = Instance | StateObject<Children> | {[any]: Children}

-- A table that defines an instance's properties, handlers and children.
export type PropertyTable = {[string | SpecialKey]: any}

return nil
end)() end,
    [41] = function()local wax,script,require=ImportGlobals(41)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs and returns objects which can be used to model derived reactive
	state.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)
local captureDependencies = require(Package.Dependencies.captureDependencies)
local initDependency = require(Package.Dependencies.initDependency)
local useDependency = require(Package.Dependencies.useDependency)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local logWarn = require(Package.Logging.logWarn)
local isSimilar = require(Package.Utility.isSimilar)
local needsDestruction = require(Package.Utility.needsDestruction)

local class = {}

local CLASS_METATABLE = {__index = class}
local WEAK_KEYS_METATABLE = {__mode = "k"}

--[[
	Returns the last cached value calculated by this Computed object.
	The computed object will be registered as a dependency unless `asDependency`
	is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._value
end

--[[
	Recalculates this Computed's cached value and dependencies.
	Returns true if it changed, or false if it's identical.
]]
function class:update(): boolean
	-- remove this object from its dependencies' dependent sets
	for dependency in pairs(self.dependencySet) do
		dependency.dependentSet[self] = nil
	end

	-- we need to create a new, empty dependency set to capture dependencies
	-- into, but in case there's an error, we want to restore our old set of
	-- dependencies. by using this table-swapping solution, we can avoid the
	-- overhead of allocating new tables each update.
	self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet
	table.clear(self.dependencySet)

	local ok, newValue, newMetaValue = captureDependencies(self.dependencySet, self._processor)

	if ok then
		if self._destructor == nil and needsDestruction(newValue) then
			logWarn("destructorNeededComputed")
		end

		if newMetaValue ~= nil then
			logWarn("multiReturnComputed")
		end

		local oldValue = self._value
		local similar = isSimilar(oldValue, newValue)
		if self._destructor ~= nil then
			self._destructor(oldValue)
		end
		self._value = newValue

		-- add this object to the dependencies' dependent sets
		for dependency in pairs(self.dependencySet) do
			dependency.dependentSet[self] = true
		end

		return not similar
	else
		-- this needs to be non-fatal, because otherwise it'd disrupt the
		-- update process
		logErrorNonFatal("computedCallbackError", newValue)

		-- restore old dependencies, because the new dependencies may be corrupt
		self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet

		-- restore this object in the dependencies' dependent sets
		for dependency in pairs(self.dependencySet) do
			dependency.dependentSet[self] = true
		end

		return false
	end
end

local function Computed<T>(processor: () -> T, destructor: ((T) -> ())?): Types.Computed<T>
	local self = setmetatable({
		type = "State",
		kind = "Computed",
		dependencySet = {},
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_oldDependencySet = {},
		_processor = processor,
		_destructor = destructor,
		_value = nil,
	}, CLASS_METATABLE)

	initDependency(self)
	self:update()

	return self
end

return Computed
end)() end,
    [42] = function()local wax,script,require=ImportGlobals(42)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new ForKeys state object which maps keys of an array using
	a `processor` function.

	Optionally, a `destructor` function can be specified for cleaning up
	calculated keys. If omitted, the default cleanup function will be used instead.

	Optionally, a `meta` value can be returned in the processor function as the
	second value to pass data from the processor to the destructor.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local captureDependencies = require(Package.Dependencies.captureDependencies)
local initDependency = require(Package.Dependencies.initDependency)
local useDependency = require(Package.Dependencies.useDependency)
local parseError = require(Package.Logging.parseError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local logError = require(Package.Logging.logError)
local logWarn = require(Package.Logging.logWarn)
local cleanup = require(Package.Utility.cleanup)
local needsDestruction = require(Package.Utility.needsDestruction)

local class = {}

local CLASS_METATABLE = { __index = class }
local WEAK_KEYS_METATABLE = { __mode = "k" }

--[[
	Returns the current value of this ForKeys object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._outputTable
end


--[[
	Called when the original table is changed.

	This will firstly find any keys meeting any of the following criteria:

	- they were not previously present
	- a dependency used during generation of this value has changed

	It will recalculate those key pairs, storing information about any
	dependencies used in the processor callback during output key generation,
	and save the new key to the output array with the same value. If it is
	overwriting an older value, that older value will be passed to the
	destructor for cleanup.

	Finally, this function will find keys that are no longer present, and remove
	their output keys from the output table and pass them to the destructor.
]]

function class:update(): boolean
	local inputIsState = self._inputIsState
	local newInputTable = if inputIsState then self._inputTable:get(false) else self._inputTable
	local oldInputTable = self._oldInputTable
	local outputTable = self._outputTable

	local keyOIMap = self._keyOIMap
	local keyIOMap = self._keyIOMap
	local meta = self._meta

	local didChange = false


	-- clean out main dependency set
	for dependency in pairs(self.dependencySet) do
		dependency.dependentSet[self] = nil
	end

	self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet
	table.clear(self.dependencySet)

	-- if the input table is a state object, add it as a dependency
	if inputIsState then
		self._inputTable.dependentSet[self] = true
		self.dependencySet[self._inputTable] = true
	end


	-- STEP 1: find keys that changed or were not previously present
	for newInKey, value in pairs(newInputTable) do
		-- get or create key data
		local keyData = self._keyData[newInKey]

		if keyData == nil then
			keyData = {
				dependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				oldDependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				dependencyValues = setmetatable({}, WEAK_KEYS_METATABLE),
			}
			self._keyData[newInKey] = keyData
		end

		-- check if the key is new
		local shouldRecalculate = oldInputTable[newInKey] == nil

		-- check if the key's dependencies have changed
		if shouldRecalculate == false then
			for dependency, oldValue in pairs(keyData.dependencyValues) do
				if oldValue ~= dependency:get(false) then
					shouldRecalculate = true
					break
				end
			end
		end


		-- recalculate the output key if necessary
		if shouldRecalculate then
			keyData.oldDependencySet, keyData.dependencySet = keyData.dependencySet, keyData.oldDependencySet
			table.clear(keyData.dependencySet)

			local processOK, newOutKey, newMetaValue = captureDependencies(
				keyData.dependencySet,
				self._processor,
				newInKey
			)

			if processOK then
				if self._destructor == nil and (needsDestruction(newOutKey) or needsDestruction(newMetaValue)) then
					logWarn("destructorNeededForKeys")
				end

				local oldInKey = keyOIMap[newOutKey]
				local oldOutKey = keyIOMap[newInKey]

				-- check for key collision
				if oldInKey ~= newInKey and newInputTable[oldInKey] ~= nil then
					logError("forKeysKeyCollision", nil, tostring(newOutKey), tostring(oldInKey), tostring(newOutKey))
				end

				-- check for a changed output key
				if oldOutKey ~= newOutKey and keyOIMap[oldOutKey] == newInKey then
					-- clean up the old calculated value
					local oldMetaValue = meta[oldOutKey]

					local destructOK, err = xpcall(self._destructor or cleanup, parseError, oldOutKey, oldMetaValue)
					if not destructOK then
						logErrorNonFatal("forKeysDestructorError", err)
					end

					keyOIMap[oldOutKey] = nil
					outputTable[oldOutKey] = nil
					meta[oldOutKey] = nil
				end

				-- update the stored data for this key
				oldInputTable[newInKey] = value
				meta[newOutKey] = newMetaValue
				keyOIMap[newOutKey] = newInKey
				keyIOMap[newInKey] = newOutKey
				outputTable[newOutKey] = value

				-- if we had to recalculate the output, then we did change
				didChange = true
			else
				-- restore old dependencies, because the new dependencies may be corrupt
				keyData.oldDependencySet, keyData.dependencySet = keyData.dependencySet, keyData.oldDependencySet

				logErrorNonFatal("forKeysProcessorError", newOutKey)
			end
		end


		-- save dependency values and add to main dependency set
		for dependency in pairs(keyData.dependencySet) do
			keyData.dependencyValues[dependency] = dependency:get(false)

			self.dependencySet[dependency] = true
			dependency.dependentSet[self] = true
		end
	end


	-- STEP 2: find keys that were removed
	for outputKey, inputKey in pairs(keyOIMap) do
		if newInputTable[inputKey] == nil then
			-- clean up the old calculated value
			local oldMetaValue = meta[outputKey]

			local destructOK, err = xpcall(self._destructor or cleanup, parseError, outputKey, oldMetaValue)
			if not destructOK then
				logErrorNonFatal("forKeysDestructorError", err)
			end

			-- remove data
			oldInputTable[inputKey] = nil
			meta[outputKey] = nil
			keyOIMap[outputKey] = nil
			keyIOMap[inputKey] = nil
			outputTable[outputKey] = nil
			self._keyData[inputKey] = nil

			-- if we removed a key, then the table/state changed
			didChange = true
		end
	end

	return didChange
end

local function ForKeys<KI, KO, M>(
	inputTable: PubTypes.CanBeState<{ [KI]: any }>,
	processor: (KI) -> (KO, M?),
	destructor: (KO, M?) -> ()?
): Types.ForKeys<KI, KO, M>

	local inputIsState = inputTable.type == "State" and typeof(inputTable.get) == "function"

	local self = setmetatable({
		type = "State",
		kind = "ForKeys",
		dependencySet = {},
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_oldDependencySet = {},

		_processor = processor,
		_destructor = destructor,
		_inputIsState = inputIsState,

		_inputTable = inputTable,
		_oldInputTable = {},
		_outputTable = {},
		_keyOIMap = {},
		_keyIOMap = {},
		_keyData = {},
		_meta = {},
	}, CLASS_METATABLE)

	initDependency(self)
	self:update()

	return self
end

return ForKeys
end)() end,
    [43] = function()local wax,script,require=ImportGlobals(43)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new ForPairs object which maps pairs of a table using
	a `processor` function.

	Optionally, a `destructor` function can be specified for cleaning up values.
	If omitted, the default cleanup function will be used instead.

	Additionally, a `meta` table/value can optionally be returned to pass data created
	when running the processor to the destructor when the created object is cleaned up.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local captureDependencies = require(Package.Dependencies.captureDependencies)
local initDependency = require(Package.Dependencies.initDependency)
local useDependency = require(Package.Dependencies.useDependency)
local parseError = require(Package.Logging.parseError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local logError = require(Package.Logging.logError)
local logWarn = require(Package.Logging.logWarn)
local cleanup = require(Package.Utility.cleanup)
local needsDestruction = require(Package.Utility.needsDestruction)

local class = {}

local CLASS_METATABLE = { __index = class }
local WEAK_KEYS_METATABLE = { __mode = "k" }

--[[
	Returns the current value of this ForPairs object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._outputTable
end

--[[
	Called when the original table is changed.

	This will firstly find any keys meeting any of the following criteria:

	- they were not previously present
	- their associated value has changed
	- a dependency used during generation of this value has changed

	It will recalculate those key/value pairs, storing information about any
	dependencies used in the processor callback during value generation, and
	save the new key/value pair to the output array. If it is overwriting an
	older key/value pair, that older pair will be passed to the destructor
	for cleanup.

	Finally, this function will find keys that are no longer present, and remove
	their key/value pairs from the output table and pass them to the destructor.
]]
function class:update(): boolean
	local inputIsState = self._inputIsState
	local newInputTable = if inputIsState then self._inputTable:get(false) else self._inputTable
	local oldInputTable = self._oldInputTable

	local keyIOMap = self._keyIOMap
	local meta = self._meta

	local didChange = false


	-- clean out main dependency set
	for dependency in pairs(self.dependencySet) do
		dependency.dependentSet[self] = nil
	end

	self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet
	table.clear(self.dependencySet)

	-- if the input table is a state object, add it as a dependency
	if inputIsState then
		self._inputTable.dependentSet[self] = true
		self.dependencySet[self._inputTable] = true
	end

	-- clean out output table
	self._oldOutputTable, self._outputTable = self._outputTable, self._oldOutputTable

	local oldOutputTable = self._oldOutputTable
	local newOutputTable = self._outputTable
	table.clear(newOutputTable)

	-- Step 1: find key/value pairs that changed or were not previously present

	for newInKey, newInValue in pairs(newInputTable) do
		-- get or create key data
		local keyData = self._keyData[newInKey]

		if keyData == nil then
			keyData = {
				dependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				oldDependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				dependencyValues = setmetatable({}, WEAK_KEYS_METATABLE),
			}
			self._keyData[newInKey] = keyData
		end


		-- check if the pair is new or changed
		local shouldRecalculate = oldInputTable[newInKey] ~= newInValue

		-- check if the pair's dependencies have changed
		if shouldRecalculate == false then
			for dependency, oldValue in pairs(keyData.dependencyValues) do
				if oldValue ~= dependency:get(false) then
					shouldRecalculate = true
					break
				end
			end
		end


		-- recalculate the output pair if necessary
		if shouldRecalculate then
			keyData.oldDependencySet, keyData.dependencySet = keyData.dependencySet, keyData.oldDependencySet
			table.clear(keyData.dependencySet)

			local processOK, newOutKey, newOutValue, newMetaValue = captureDependencies(
				keyData.dependencySet,
				self._processor,
				newInKey,
				newInValue
			)

			if processOK then
				if self._destructor == nil and (needsDestruction(newOutKey) or needsDestruction(newOutValue) or needsDestruction(newMetaValue)) then
					logWarn("destructorNeededForPairs")
				end

				-- if this key was already written to on this run-through, throw a fatal error.
				if newOutputTable[newOutKey] ~= nil then
					-- figure out which key/value pair previously wrote to this key
					local previousNewKey, previousNewValue
					for inKey, outKey in pairs(keyIOMap) do
						if outKey == newOutKey then
							previousNewValue = newInputTable[inKey]
							if previousNewValue ~= nil then
								previousNewKey = inKey
								break
							end
						end
					end

					if previousNewKey ~= nil then
						logError(
							"forPairsKeyCollision",
							nil,
							tostring(newOutKey),
							tostring(previousNewKey),
							tostring(previousNewValue),
							tostring(newInKey),
							tostring(newInValue)
						)
					end
				end

				local oldOutValue = oldOutputTable[newOutKey]

				if oldOutValue ~= newOutValue then
					local oldMetaValue = meta[newOutKey]
					if oldOutValue ~= nil then
						local destructOK, err = xpcall(self._destructor or cleanup, parseError, newOutKey, oldOutValue, oldMetaValue)
						if not destructOK then
							logErrorNonFatal("forPairsDestructorError", err)
						end
					end

					oldOutputTable[newOutKey] = nil
				end

				-- update the stored data for this key/value pair
				oldInputTable[newInKey] = newInValue
				keyIOMap[newInKey] = newOutKey
				meta[newOutKey] = newMetaValue
				newOutputTable[newOutKey] = newOutValue

				-- if we had to recalculate the output, then we did change
				didChange = true
			else
				-- restore old dependencies, because the new dependencies may be corrupt
				keyData.oldDependencySet, keyData.dependencySet = keyData.dependencySet, keyData.oldDependencySet

				logErrorNonFatal("forPairsProcessorError", newOutKey)
			end
		else
			local storedOutKey = keyIOMap[newInKey]

			-- check for key collision
			if newOutputTable[storedOutKey] ~= nil then
				-- figure out which key/value pair previously wrote to this key
				local previousNewKey, previousNewValue
				for inKey, outKey in pairs(keyIOMap) do
					if storedOutKey == outKey then
						previousNewValue = newInputTable[inKey]

						if previousNewValue ~= nil then
							previousNewKey = inKey
							break
						end
					end
				end

				if previousNewKey ~= nil then
					logError(
						"forPairsKeyCollision",
						nil,
						tostring(storedOutKey),
						tostring(previousNewKey),
						tostring(previousNewValue),
						tostring(newInKey),
						tostring(newInValue)
					)
				end
			end

			-- copy the stored key/value pair into the new output table
			newOutputTable[storedOutKey] = oldOutputTable[storedOutKey]
		end


		-- save dependency values and add to main dependency set
		for dependency in pairs(keyData.dependencySet) do
			keyData.dependencyValues[dependency] = dependency:get(false)

			self.dependencySet[dependency] = true
			dependency.dependentSet[self] = true
		end
	end

	-- STEP 2: find keys that were removed
	for oldOutKey, oldOutValue in pairs(oldOutputTable) do
		-- check if this key/value pair is in the new output table
		if newOutputTable[oldOutKey] ~= oldOutValue then
			-- clean up the old output pair
			local oldMetaValue = meta[oldOutKey]
			if oldOutValue ~= nil then
				local destructOK, err = xpcall(self._destructor or cleanup, parseError, oldOutKey, oldOutValue, oldMetaValue)
				if not destructOK then
					logErrorNonFatal("forPairsDestructorError", err)
				end
			end

			-- check if the key was completely removed from the output table
			if newOutputTable[oldOutKey] == nil then
				meta[oldOutKey] = nil
				self._keyData[oldOutKey] = nil
			end

			didChange = true
		end
	end

	for key in pairs(oldInputTable) do
		if newInputTable[key] == nil then
			oldInputTable[key] = nil
			keyIOMap[key] = nil
		end
	end

	return didChange
end

local function ForPairs<KI, VI, KO, VO, M>(
	inputTable: PubTypes.CanBeState<{ [KI]: VI }>,
	processor: (KI, VI) -> (KO, VO, M?),
	destructor: (KO, VO, M?) -> ()?
): Types.ForPairs<KI, VI, KO, VO, M>

	local inputIsState = inputTable.type == "State" and typeof(inputTable.get) == "function"

	local self = setmetatable({
		type = "State",
		kind = "ForPairs",
		dependencySet = {},
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_oldDependencySet = {},

		_processor = processor,
		_destructor = destructor,
		_inputIsState = inputIsState,

		_inputTable = inputTable,
		_oldInputTable = {},
		_outputTable = {},
		_oldOutputTable = {},
		_keyIOMap = {},
		_keyData = {},
		_meta = {},
	}, CLASS_METATABLE)

	initDependency(self)
	self:update()

	return self
end

return ForPairs
end)() end,
    [44] = function()local wax,script,require=ImportGlobals(44)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new ForValues object which maps values of a table using
	a `processor` function.

	Optionally, a `destructor` function can be specified for cleaning up values.
	If omitted, the default cleanup function will be used instead.

	Additionally, a `meta` table/value can optionally be returned to pass data created
	when running the processor to the destructor when the created object is cleaned up.
]]
local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local captureDependencies = require(Package.Dependencies.captureDependencies)
local initDependency = require(Package.Dependencies.initDependency)
local useDependency = require(Package.Dependencies.useDependency)
local parseError = require(Package.Logging.parseError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local logWarn = require(Package.Logging.logWarn)
local cleanup = require(Package.Utility.cleanup)
local needsDestruction = require(Package.Utility.needsDestruction)

local class = {}

local CLASS_METATABLE = { __index = class }
local WEAK_KEYS_METATABLE = { __mode = "k" }

--[[
	Returns the current value of this ForValues object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._outputTable
end

--[[
	Called when the original table is changed.

	This will firstly find any values meeting any of the following criteria:

	- they were not previously present
	- a dependency used during generation of this value has changed

	It will recalculate those values, storing information about any dependencies
	used in the processor callback during value generation, and save the new value
	to the output array with the same key. If it is overwriting an older value,
	that older value will be passed to the destructor for cleanup.

	Finally, this function will find values that are no longer present, and remove
	their values from the output table and pass them to the destructor. You can re-use
	the same value multiple times and this will function will update them as little as
	possible; reusing the same values where possible.
]]
function class:update(): boolean
	local inputIsState = self._inputIsState
	local inputTable = if inputIsState then self._inputTable:get(false) else self._inputTable
	local outputValues = {}

	local didChange = false

	-- clean out value cache
	self._oldValueCache, self._valueCache = self._valueCache, self._oldValueCache
	local newValueCache = self._valueCache
	local oldValueCache = self._oldValueCache
	table.clear(newValueCache)

	-- clean out main dependency set
	for dependency in pairs(self.dependencySet) do
		dependency.dependentSet[self] = nil
	end
	self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet
	table.clear(self.dependencySet)

	-- if the input table is a state object, add it as a dependency
	if inputIsState then
		self._inputTable.dependentSet[self] = true
		self.dependencySet[self._inputTable] = true
	end


	-- STEP 1: find values that changed or were not previously present
	for inKey, inValue in pairs(inputTable) do
		-- check if the value is new or changed
		local oldCachedValues = oldValueCache[inValue]
		local shouldRecalculate = oldCachedValues == nil

		-- get a cached value and its dependency/meta data if available
		local value, valueData, meta

		if type(oldCachedValues) == "table" and #oldCachedValues > 0 then
			local valueInfo = table.remove(oldCachedValues, #oldCachedValues)
			value = valueInfo.value
			valueData = valueInfo.valueData
			meta = valueInfo.meta

			if #oldCachedValues <= 0 then
				oldValueCache[inValue] = nil
			end
		elseif oldCachedValues ~= nil then
			oldValueCache[inValue] = nil
			shouldRecalculate = true
		end

		if valueData == nil then
			valueData = {
				dependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				oldDependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				dependencyValues = setmetatable({}, WEAK_KEYS_METATABLE),
			}
		end

		-- check if the value's dependencies have changed
		if shouldRecalculate == false then
			for dependency, oldValue in pairs(valueData.dependencyValues) do
				if oldValue ~= dependency:get(false) then
					shouldRecalculate = true
					break
				end
			end
		end

		-- recalculate the output value if necessary
		if shouldRecalculate then
			valueData.oldDependencySet, valueData.dependencySet = valueData.dependencySet, valueData.oldDependencySet
			table.clear(valueData.dependencySet)

			local processOK, newOutValue, newMetaValue = captureDependencies(
				valueData.dependencySet,
				self._processor,
				inValue
			)

			if processOK then
				if self._destructor == nil and (needsDestruction(newOutValue) or needsDestruction(newMetaValue)) then
					logWarn("destructorNeededForValues")
				end

				-- pass the old value to the destructor if it exists
				if value ~= nil then
					local destructOK, err = xpcall(self._destructor or cleanup, parseError, value, meta)
					if not destructOK then
						logErrorNonFatal("forValuesDestructorError", err)
					end
				end

				-- store the new value and meta data
				value = newOutValue
				meta = newMetaValue
				didChange = true
			else
				-- restore old dependencies, because the new dependencies may be corrupt
				valueData.oldDependencySet, valueData.dependencySet = valueData.dependencySet, valueData.oldDependencySet

				logErrorNonFatal("forValuesProcessorError", newOutValue)
			end
		end


		-- store the value and its dependency/meta data
		local newCachedValues = newValueCache[inValue]
		if newCachedValues == nil then
			newCachedValues = {}
			newValueCache[inValue] = newCachedValues
		end

		table.insert(newCachedValues, {
			value = value,
			valueData = valueData,
			meta = meta,
		})

		outputValues[inKey] = value


		-- save dependency values and add to main dependency set
		for dependency in pairs(valueData.dependencySet) do
			valueData.dependencyValues[dependency] = dependency:get(false)

			self.dependencySet[dependency] = true
			dependency.dependentSet[self] = true
		end
	end


	-- STEP 2: find values that were removed
	-- for tables of data, we just need to check if it's still in the cache
	for _oldInValue, oldCachedValueInfo in pairs(oldValueCache) do
		for _, valueInfo in ipairs(oldCachedValueInfo) do
			local oldValue = valueInfo.value
			local oldMetaValue = valueInfo.meta

			local destructOK, err = xpcall(self._destructor or cleanup, parseError, oldValue, oldMetaValue)
			if not destructOK then
				logErrorNonFatal("forValuesDestructorError", err)
			end

			didChange = true
		end

		table.clear(oldCachedValueInfo)
	end

	self._outputTable = outputValues

	return didChange
end

local function ForValues<VI, VO, M>(
	inputTable: PubTypes.CanBeState<{ [any]: VI }>,
	processor: (VI) -> (VO, M?),
	destructor: (VO, M?) -> ()?
): Types.ForValues<VI, VO, M>

	local inputIsState = inputTable.type == "State" and typeof(inputTable.get) == "function"

	local self = setmetatable({
		type = "State",
		kind = "ForValues",
		dependencySet = {},
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_oldDependencySet = {},

		_processor = processor,
		_destructor = destructor,
		_inputIsState = inputIsState,

		_inputTable = inputTable,
		_outputTable = {},
		_valueCache = {},
		_oldValueCache = {},
	}, CLASS_METATABLE)

	initDependency(self)
	self:update()

	return self
end

return ForValues
end)() end,
    [45] = function()local wax,script,require=ImportGlobals(45)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new state object which can listen for updates on another state
	object.

	FIXME: enabling strict types here causes free types to leak
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local initDependency = require(Package.Dependencies.initDependency)

type Set<T> = {[T]: any}

local class = {}
local CLASS_METATABLE = {__index = class}

-- Table used to hold Observer objects in memory.
local strongRefs: Set<Types.Observer> = {}

--[[
	Called when the watched state changes value.
]]
function class:update(): boolean
	for _, callback in pairs(self._changeListeners) do
		task.spawn(callback)
	end
	return false
end

--[[
	Adds a change listener. When the watched state changes value, the listener
	will be fired.

	Returns a function which, when called, will disconnect the change listener.
	As long as there is at least one active change listener, this Observer
	will be held in memory, preventing GC, so disconnecting is important.
]]
function class:onChange(callback: () -> ()): () -> ()
	local uniqueIdentifier = {}

	self._numChangeListeners += 1
	self._changeListeners[uniqueIdentifier] = callback

	-- disallow gc (this is important to make sure changes are received)
	strongRefs[self] = true

	local disconnected = false
	return function()
		if disconnected then
			return
		end
		disconnected = true
		self._changeListeners[uniqueIdentifier] = nil
		self._numChangeListeners -= 1

		if self._numChangeListeners == 0 then
			-- allow gc if all listeners are disconnected
			strongRefs[self] = nil
		end
	end
end

local function Observer(watchedState: PubTypes.Value<any>): Types.Observer
	local self = setmetatable({
		type = "State",
		kind = "Observer",
		dependencySet = {[watchedState] = true},
		dependentSet = {},
		_changeListeners = {},
		_numChangeListeners = 0,
	}, CLASS_METATABLE)

	initDependency(self)
	-- add this object to the watched state's dependent set
	watchedState.dependentSet[self] = true

	return self
end

return Observer
end)() end,
    [46] = function()local wax,script,require=ImportGlobals(46)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs and returns objects which can be used to model independent
	reactive state.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)
local useDependency = require(Package.Dependencies.useDependency)
local initDependency = require(Package.Dependencies.initDependency)
local updateAll = require(Package.Dependencies.updateAll)
local isSimilar = require(Package.Utility.isSimilar)

local class = {}

local CLASS_METATABLE = {__index = class}
local WEAK_KEYS_METATABLE = {__mode = "k"}

--[[
	Returns the value currently stored in this State object.
	The state object will be registered as a dependency unless `asDependency` is
	false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._value
end

--[[
	Updates the value stored in this State object.

	If `force` is enabled, this will skip equality checks and always update the
	state object and any dependents - use this with care as this can lead to
	unnecessary updates.
]]
function class:set(newValue: any, force: boolean?)
	local oldValue = self._value
	if force or not isSimilar(oldValue, newValue) then
		self._value = newValue
		updateAll(self)
	end
end

local function Value<T>(initialValue: T): Types.State<T>
	local self = setmetatable({
		type = "State",
		kind = "Value",
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_value = initialValue
	}, CLASS_METATABLE)

	initDependency(self)

	return self
end

return Value
end)() end,
    [47] = function()local wax,script,require=ImportGlobals(47)local ImportGlobals return (function(...)--!strict

--[[
	A common interface for accessing the values of state objects or constants.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local xtypeof = require(Package.Utility.xtypeof)

local function unwrap<T>(item: PubTypes.CanBeState<T>, useDependency: boolean?): T
	return if xtypeof(item) == "State" then (item :: PubTypes.StateObject<T>):get(useDependency) else (item :: T)
end

return unwrap
end)() end,
    [48] = function()local wax,script,require=ImportGlobals(48)local ImportGlobals return (function(...)--!strict

--[[
	Stores common type information used internally.

	These types may be used internally so Fusion code can type-check, but
	should never be exposed to public users, as these definitions are fair game
	for breaking changes.
]]

local Package = script.Parent
local PubTypes = require(Package.PubTypes)

type Set<T> = {[T]: any}

--[[
	General use types
]]

-- A symbol that represents the absence of a value.
export type None = PubTypes.Symbol & {
	-- name: "None" (add this when Luau supports singleton types)
}

-- Stores useful information about Luau errors.
export type Error = {
	type: string, -- replace with "Error" when Luau supports singleton types
	raw: string,
	message: string,
	trace: string
}

--[[
	Specific reactive graph types
]]

-- A state object whose value can be set at any time by the user.
export type State<T> = PubTypes.Value<T> & {
	_value: T
}

-- A state object whose value is derived from other objects using a callback.
export type Computed<T> = PubTypes.Computed<T> & {
	_oldDependencySet: Set<PubTypes.Dependency>,
	_callback: () -> T,
	_value: T
}

-- A state object whose value is derived from other objects using a callback.
export type ForPairs<KI, VI, KO, VO, M> = PubTypes.ForPairs<KO, VO> & {
	_oldDependencySet: Set<PubTypes.Dependency>,
	_processor: (KI, VI) -> (KO, VO),
	_destructor: (VO, M?) -> (),
	_inputIsState: boolean,
	_inputTable: PubTypes.CanBeState<{ [KI]: VI }>,
	_oldInputTable: { [KI]: VI },
	_outputTable: { [KO]: VO },
	_oldOutputTable: { [KO]: VO },
	_keyIOMap: { [KI]: KO },
	_meta: { [KO]: M? },
	_keyData: {
		[KI]: {
			dependencySet: Set<PubTypes.Dependency>,
			oldDependencySet: Set<PubTypes.Dependency>,
			dependencyValues: { [PubTypes.Dependency]: any },
		},
	},
}

-- A state object whose value is derived from other objects using a callback.
export type ForKeys<KI, KO, M> = PubTypes.ForKeys<KO, any> & {
	_oldDependencySet: Set<PubTypes.Dependency>,
	_processor: (KI) -> (KO),
	_destructor: (KO, M?) -> (),
	_inputIsState: boolean,
	_inputTable: PubTypes.CanBeState<{ [KI]: KO }>,
	_oldInputTable: { [KI]: KO },
	_outputTable: { [KO]: any },
	_keyOIMap: { [KO]: KI },
	_meta: { [KO]: M? },
	_keyData: {
		[KI]: {
			dependencySet: Set<PubTypes.Dependency>,
			oldDependencySet: Set<PubTypes.Dependency>,
			dependencyValues: { [PubTypes.Dependency]: any },
		},
	},
}

-- A state object whose value is derived from other objects using a callback.
export type ForValues<VI, VO, M> = PubTypes.ForValues<any, VO> & {
	_oldDependencySet: Set<PubTypes.Dependency>,
	_processor: (VI) -> (VO),
	_destructor: (VO, M?) -> (),
	_inputIsState: boolean,
	_inputTable: PubTypes.CanBeState<{ [VI]: VO }>,
	_outputTable: { [any]: VI },
	_valueCache: { [VO]: any },
	_oldValueCache: { [VO]: any },
	_meta: { [VO]: M? },
	_valueData: {
		[VI]: {
			dependencySet: Set<PubTypes.Dependency>,
			oldDependencySet: Set<PubTypes.Dependency>,
			dependencyValues: { [PubTypes.Dependency]: any },
		},
	},
}

-- A state object which follows another state object using tweens.
export type Tween<T> = PubTypes.Tween<T> & {
	_goalState: State<T>,
	_tweenInfo: TweenInfo,
	_prevValue: T,
	_nextValue: T,
	_currentValue: T,
	_currentTweenInfo: TweenInfo,
	_currentTweenDuration: number,
	_currentTweenStartTime: number,
	_currentlyAnimating: boolean
}

-- A state object which follows another state object using spring simulation.
export type Spring<T> = PubTypes.Spring<T> & {
	_speed: PubTypes.CanBeState<number>,
	_speedIsState: boolean,
	_lastSpeed: number,
	_damping: PubTypes.CanBeState<number>,
	_dampingIsState: boolean,
	_lastDamping: number,
	_goalState: State<T>,
	_goalValue: T,
	_currentType: string,
	_currentValue: T,
	_springPositions: {number},
	_springGoals: {number},
	_springVelocities: {number}
}

-- An object which can listen for updates on another state object.
export type Observer = PubTypes.Observer & {
	_changeListeners: Set<() -> ()>,
	_numChangeListeners: number
}

return nil
end)() end,
    [50] = function()local wax,script,require=ImportGlobals(50)local ImportGlobals return (function(...)--!strict

--[[
	A symbol for representing nil values in contexts where nil is not usable.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)

return {
	type = "Symbol",
	name = "None"
} :: Types.None
end)() end,
    [51] = function()local wax,script,require=ImportGlobals(51)local ImportGlobals return (function(...)--!strict

--[[
	Cleans up the tasks passed in as the arguments.
	A task can be any of the following:

	- an Instance - will be destroyed
	- an RBXScriptConnection - will be disconnected
	- a function - will be run
	- a table with a `Destroy` or `destroy` function - will be called
	- an array - `cleanup` will be called on each item
]]

local function cleanupOne(task: any)
	local taskType = typeof(task)

	-- case 1: Instance
	if taskType == "Instance" then
		task:Destroy()

	-- case 2: RBXScriptConnection
	elseif taskType == "RBXScriptConnection" then
		task:Disconnect()

	-- case 3: callback
	elseif taskType == "function" then
		task()

	elseif taskType == "table" then
		-- case 4: destroy() function
		if typeof(task.destroy) == "function" then
			task:destroy()

		-- case 5: Destroy() function
		elseif typeof(task.Destroy) == "function" then
			task:Destroy()

		-- case 6: array of tasks
		elseif task[1] ~= nil then
			for _, subtask in ipairs(task) do
				cleanupOne(subtask)
			end
		end
	end
end

local function cleanup(...: any)
	for index = 1, select("#", ...) do
		cleanupOne(select(index, ...))
	end
end

return cleanup
end)() end,
    [52] = function()local wax,script,require=ImportGlobals(52)local ImportGlobals return (function(...)--!strict

--[[
	An empty function. Often used as a destructor to indicate no destruction.
]]

local function doNothing(...: any)
end

return doNothing
end)() end,
    [53] = function()local wax,script,require=ImportGlobals(53)local ImportGlobals return (function(...)--!strict
--[[
    Returns true if A and B are 'similar' - i.e. any user of A would not need
    to recompute if it changed to B.
]]

local function isSimilar(a: any, b: any): boolean
    -- HACK: because tables are mutable data structures, don't make assumptions
    -- about similarity from equality for now (see issue #44)
    if typeof(a) == "table" then
        return false
    else
        return a == b
    end
end

return isSimilar
end)() end,
    [54] = function()local wax,script,require=ImportGlobals(54)local ImportGlobals return (function(...)--!strict

--[[
    Returns true if the given value is not automatically memory managed, and
    requires manual cleanup.
]]

local function needsDestruction(x: any): boolean
    return typeof(x) == "Instance"
end

return needsDestruction
end)() end,
    [55] = function()local wax,script,require=ImportGlobals(55)local ImportGlobals return (function(...)--!strict

--[[
	Restricts the reading of missing members for a table.
]]

local Package = script.Parent.Parent
local logError = require(Package.Logging.logError)

type table = {[any]: any}

local function restrictRead(tableName: string, strictTable: table): table
	-- FIXME: Typed Luau doesn't recognise this correctly yet
	local metatable = getmetatable(strictTable :: any)

	if metatable == nil then
		metatable = {}
		setmetatable(strictTable, metatable)
	end

	function metatable:__index(memberName)
		logError("strictReadError", nil, tostring(memberName), tableName)
	end

	return strictTable
end

return restrictRead
end)() end,
    [56] = function()local wax,script,require=ImportGlobals(56)local ImportGlobals return (function(...)--!strict

--[[
	Extended typeof, designed for identifying custom objects.
	If given a table with a `type` string, returns that.
	Otherwise, returns `typeof()` the argument.
]]

local function xtypeof(x: any)
	local typeString = typeof(x)

	if typeString == "table" and typeof(x.type) == "string" then
		return x.type
	else
		return typeString
	end
end

return xtypeof
end)() end,
    [57] = function()local wax,script,require=ImportGlobals(57)local ImportGlobals return (function(...)local randomString = require(script.Parent.Parent.utilities.randomString)
local bundles = require(script.Parent)
local fusion = bundles.Fusion
local value = fusion.Value

local data = {}
local dataFunctions = {}

type uid = string
type tag = string

function dataFunctions.update(uid:string, index:string, new:string)
    if index ~= "uid" and dataFunctions.find(uid) and dataFunctions.find(uid)[index] then
        local dataToEdit = dataFunctions.find(uid)
        dataToEdit[index]:set(new)
    elseif not dataFunctions.find(uid) then
        error("couldn't find uid: "..uid)
    elseif index == "uid" or index == "__tag" then
        error("cannot edit property "..index)
    elseif not dataFunctions.find(uid)[index] then
        
    else
        error("how?")
    end
end
function dataFunctions.find(identifier:uid | tag):table
    local returnData = nil
    for i=1, #data do
        if data[i].uid == identifier or data[i].__tag == identifier then
            returnData = data[i]
        end
    end
    if not returnData then
        warn("no data found by identifier: "..tostring(identifier))
        return returnData
    end
    return returnData
end
function dataFunctions.delete(uid:string)
    local dataToDelete = dataFunctions.find(uid)
    local index = table.find(data, dataToDelete)
    local newData = {}
    for i=1, #data do
        if i ~= index then
            table.insert(newData, data[i])
        end
    end
    data = newData
    newData =  nil
end
function dataFunctions.add(newData:table, tag:string, exclude:boolean):table
    exclude = exclude or false
    if not exclude then
        for i,v in newData do
            newData[i] = value(v)
        end
    end
    newData.__tag = tag or nil
    newData.uid = randomString(16)
    setmetatable(newData, {
        __index = {
            ["update"] = function(tbl, dataType, info)
                dataFunctions.update(tbl.uid, dataType, info)
            end,
            ["delete"] = function()
                dataFunctions.delete(newData.uid)
            end
        }
    })
    table.insert(data, newData)
    return dataFunctions.find(newData.uid)
end

return dataFunctions
end)() end,
    [58] = function()local wax,script,require=ImportGlobals(58)local ImportGlobals return (function(...)local data = require(script.Parent).data
local get = require(script.Parent.Parent.utilities).get
local services = require(script.Parent).services
local HttpService = services.HttpService
local fusion = require(script.Parent).Fusion
local observe = fusion.Observer
local value = fusion.Value

local utilities = require(script.Parent.Parent.utilities)
local connections = utilities.connections
local customFunctions = utilities.customFunctions
local randomString = utilities.randomString

local funcs = {}
local flags = data.add({list = {}},"flags")
local names = {}
local preregistered = {}
local functionsOnCreate = {}
local functionsOnSelect = {}
local configs = {}
local potentialFromFiles = {}
funcs.currentConfig = {}
funcs.writeFiles = false
funcs.path = ""

local types = {
    ['toggle'] = function(flag)
        local boolean = flag.status.boolean
        connections.add(observe(boolean):onChange(function()
            local cValue = get(boolean)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['dropdown'] = function(flag)
        local observable = flag.status.multiselect and flag.status.items or flag.status.item
        connections.add(observe(observable):onChange(function()
            local cValue = get(observable)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['keybind'] = function(flag)
        local observable = flag.status.mobile and flag.status.coordinate or flag.status.keycode
        connections.add(observe(observable):onChange(function()
            local cValue = get(observable)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['slider'] = function(flag)
        local percentageOf = flag.status.percentageOf
        connections.add(observe(percentageOf):onChange(function()
            local cValue = get(percentageOf)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['textbox'] = function(flag)
        local correctText = flag.status.correctText
        connections.add(observe(correctText):onChange(function()
            local cValue = get(correctText)
            flag.user.Value = cValue
            flag.bindableEvent:Fire(cValue)
        end))
    end,
    ['colorpicker'] = function(flag)
        local color = flag.status.color
        local transparency = flag.status.transparency
        connections.add(observe(color):onChange(function()
            flag.user.Value = {get(color), get(transparency)}
            flag.bindableEvent:Fire(unpack(flag.user.Value))
        end))
        connections.add(observe(transparency):onChange(function()
            flag.user.Value = {get(color), get(transparency)}
            flag.bindableEvent:Fire(unpack(flag.user.Value))
        end))
    end
}
local cleaner = {
    ['toggle'] = function(status)
        local clean = {}
        if status.boolean then
            clean.boolean = get(status.boolean)
        end
        if status.keycode then
            clean.keycode = get(status.keycode)
        end
        if get(status.coordinate) then
            clean.coordinate = {X = get(status.coordinate).X, Y = get(status.coordinate).Y}
        end
        return clean
    end,
    ['dropdown'] = function(status)
        return status.multiselect and {unpack(get(status.items))} or get(status.item)
    end,
    ['keybind'] = function(status)
        local clean = {}
        if status.keycode then
            clean.keycode = get(status.keycode)
        end
        if get(status.coordinate) then
            clean.coordinate = {X = get(status.coordinate).X, Y = get(status.coordinate).Y}
        end
        return clean
    end,
    ['slider'] = function(status)
        return get(status.percentageOf)
    end,
    ['textbox'] = function(status)
        return get(status.correctText)
    end,
    ['colorpicker'] = function(status)
        return {color = get(status.color):ToHex(), transparency = get(status.transparency)}
    end
}

function funcs.preregister(name, preregisteredValue)
    local flagEvent = fusion.New "BindableEvent" {}
    local onChange = {}
    function onChange:Connect(func)
        assert(typeof(func) == "function", "Connect only takes functions")
        connections.add(flagEvent.Event:Connect(func))
    end
    local fileChange = (fusion.New "BindableEvent" {})
    local _flag
    _flag = {
        name = name,
        status = {},
        type = "unknown",
        preregistered = true,
        bindableEvent = flagEvent,
        file = fileChange.Event,
        fileEvent = fileChange,
        preregisteredValue = preregisteredValue,
        user = {
            Value = nil,
            OnChange = setmetatable(onChange,{
                __newindex = function(tbl,idx,key)
                    return nil
                end
            })
        }
    }

    preregistered[name] = _flag
    local _list = get(flags.list)
    _list[_flag.name] = _flag
    flags:update("list",_list)
    return _flag
end

function funcs.register(name, default, type, private)
    assert(not table.find(names, name), "Flags must all be unique!")
    table.insert(names, name)
    local flagEvent = fusion.New "BindableEvent" {}
    local onChange = {}
    function onChange:Connect(func)
        assert(typeof(func) == "function", "Connect")
        connections.add(flagEvent.Event:Connect(func))
    end
    local _flag
    if not preregistered[name] then
        local fileChange = (fusion.New "BindableEvent" {})
        _flag = {
            name = name,
            status = default,
            type = type,
            private = private,
            preregistered = false,
            bindableEvent = flagEvent,
            file = fileChange.Event,
            fileEvent = fileChange,
            user = {
                Value = nil,
                OnChange = setmetatable(onChange,{
                    __newindex = function()
                        return nil
                    end
                })
            }
        }
        types[_flag.type](_flag)

        local _list = get(flags.list)
        _list[_flag.name] = _flag
        flags:update("list",_list)
    else
        _flag = preregistered[name]
        _flag.type = type
        _flag.status = default
        _flag.private = private
        types[_flag.type](_flag)
        preregistered[_flag.name] = nil
    end
    return _flag
end

function funcs.find(uid)
    for i,v in configs do
        if v.uid == uid then
            return v, i
        end
    end
    return false
end

function funcs.create(name, uid, fromFile, tbl, fromSet, lock)
    fromFile = fromFile or false
    fromSet = fromSet or false
    lock = lock or false
    if uid == "original" and fromFile then
        return
    end
    if fromSet and fromFile then
        table.insert(potentialFromFiles, uid)
    end
    if fromSet and not fromFile then
        for _,v in potentialFromFiles do
            local config = funcs.find(v)
            if config and config.name == name then
                return v
            end
        end
    end

    uid = uid or randomString(5)
    local config = {}
    config.name = name
    config.fromSet = fromSet
    config.lock = lock
    config.uid = uid
    config.flagValues = {}
    if tbl ~= nil then
        config.flagValues = tbl
    else
        for _,flag in get(flags.list) do
            if flag.private then
                continue
            end
            if flag.type == "unknown" then
                continue
            end
            config.flagValues[flag.name] = cleaner[flag.type](flag.status)
        end
    end
    table.insert(configs, config)
    if funcs.writeFiles then
        customFunctions.writefile(`{funcs.path}/{config.uid}.json`, HttpService:JSONEncode(config))
    end
    task.spawn(function()
        for _,v in functionsOnCreate do
            task.spawn(v)
        end
    end)
    return uid
end

function funcs.init()
    if funcs.writeFiles then
        for _,file in customFunctions.listfiles(funcs.path) do
            local config = HttpService:JSONDecode(customFunctions.readfile(file))
            funcs.create(config.name, config.uid, true, config.flagValues, config.fromSet, config.lock)
        end
    end
end

function load(config)
    for i,v in config.flagValues do
        local flag = get(flags.list)[i]
        if not flag then
            continue
        end
        flag.fileEvent:Fire(v)
    end
end

function funcs.set(uid)
    if not uid then
        funcs.currentConfig = {}
        return
    end
    local config = funcs.find(uid)
    if not config then
        return
    end
    funcs.currentConfig = config
    load(config)
    task.spawn(function()
        for _,v in functionsOnCreate do
            task.spawn(v, uid)
        end
    end)
end

function funcs.save(uid)
    local config = funcs.find(uid)
    for _,flag in get(flags.list) do
        if flag.private then
            continue
        end
        if flag.type == "unknown" then
            continue
        end
        config.flagValues[flag.name] = cleaner[flag.type](flag.status)
    end
    if funcs.writeFiles then
        customFunctions.writefile(`{funcs.path}/{config.uid}.json`, HttpService:JSONEncode(config))
    end
end

function funcs.delete(uid)
    local config, index = funcs.find(uid)
    if config then
        if funcs.writeFiles then
            if customFunctions.isfile(`{funcs.path}/{config.uid}.json`) then
                customFunctions.delfile(`{funcs.path}/{config.uid}.json`)
                table.remove(configs, index)
            end
        end
        table.remove(configs, index)
    end
    funcs.set(nil)
end
function funcs.export()
    return HttpService:JSONEncode(funcs.currentConfig)
end

function funcs.getConfigs()
    return configs
end
function funcs.getConfig()
    return funcs.currentConfig
end
function funcs.onCreate(func)
    table.insert(functionsOnCreate, func)
end
function funcs.onSelect(func)
    table.insert(functionsOnSelect, func)
end

return funcs
end)() end,
    [59] = function()local wax,script,require=ImportGlobals(59)local ImportGlobals return (function(...)return {
    ['lock'] = "rbxassetid://10723434711",
    ['maximize'] = "rbxassetid://15556636376",
    ['minimize'] = "rbxassetid://15556637715",
    ['close'] = "rbxassetid://10747384394",
    ['circle'] = "rbxassetid://18804307590",
    ['normalDropdown'] = "rbxassetid://10723433811",
    ['multiDropdown'] = "rbxassetid://10734884548",
    ['fingerprint'] = "rbxassetid://10723375250",
    ['check'] = "rbxassetid://10709790644",
    ['command'] = "rbxassetid://10723416765",
    ['input'] = "rbxassetid://10734982297",
    ['search'] = "rbxassetid://10734943674",
    ['finger'] = "rbxassetid://10734929723",
    ['alert'] = "rbxassetid://10709752996",
    ['paint'] = "rbxassetid://10734910187",
    ['cog'] = "rbxassetid://10709810948"
}
end)() end,
    [60] = function()local wax,script,require=ImportGlobals(60)local ImportGlobals return (function(...)local utilities = require(script.Parent.Parent.utilities)
local customFunctions = utilities.customFunctions

local lucide
local oldidentity
if customFunctions.getthreadidentity() < 5 then
    oldidentity = customFunctions.getthreadidentity()
    customFunctions.setthreadidentity(5)
end
lucide = loadstring(game:GetObjects("rbxassetid://85554466048193")[1].Source)()
customFunctions.setthreadidentity(oldidentity)
return lucide
end)() end,
    [61] = function()local wax,script,require=ImportGlobals(61)local ImportGlobals return (function(...)local cF = require(script.Parent.Parent.utilities.customFunctions)
local cloneref = cF.cloneref

local services = {}
services = setmetatable(services, {
    __index = function(_, key)
        return cloneref(game:GetService(key))
    end
})

return services
end)() end,
    [62] = function()local wax,script,require=ImportGlobals(62)local ImportGlobals return (function(...)local themeSystem = {}
local services = require(script.Parent.services)
local HttpService = services.HttpService
local Bundles = require(script.Parent)
local fusion = Bundles.Fusion
local default = require(script.default)
local value = fusion.Value
local observe = fusion.Observer

local get = require(script.Parent.Parent.utilities.get)
local animate = require(script.Parent.Parent.utilities.animate)
local _warn = warn
local randomString = require(script.Parent.Parent.utilities.randomString)
local customFunctions = require(script.Parent.Parent.utilities.customFunctions)
local functionsOnChange = {}
local functionsOnCreate = {}

local currentTheme = value({})
local _currentTheme = value({})
local dariusUID = ""
observe(currentTheme):onChange(function()
    task.wait()
    for _,func in ipairs(functionsOnChange) do
        task.spawn(func)
    end
end)

local themes = {}
local potentialFromFiles = {}

local palletteCheck = {}
table.foreach(default, function(name)
    table.insert(palletteCheck, name)
end)

themeSystem.path = ""

function themeSystem.find(uid)
    for _,theme in themes do
        if theme.uid == uid then
            return true, theme
        end
    end
    return false
end

function themeSystem.create(name, palette, uid, fromFile, fromSet)
    fromFile = fromFile or false
    if uid == "original" and fromFile then
        return
    end
    for _,v in palletteCheck do
        if palette[v] == nil then
            palette[v] = default[v]
        end
        if typeof(palette[v]) ~= "Color3" then
            _warn(v.." isn't type Color3")
        end
    end
    for i,_ in palette do
        if not table.find(palletteCheck, i) then
            _warn('Incorrect value removed "'..tostring(i)..'"')
            palette[i] = nil
        end
    end

    if fromSet and fromFile then
        table.insert(potentialFromFiles, uid)
    end
    if fromSet and not fromFile then
        for _,v in potentialFromFiles do
            local result = {themeSystem.find(v)}
            if result[1] and result[2].name == name then
                return v
            end
        end
    end

    uid = uid or randomString(5)
    table.insert(themes, {
        name = name,
        uid = uid,
        fromSet = fromSet or false,
        palette = palette
    })

    local ctheme = {}
    ctheme.name = name
    ctheme.uid = uid
    ctheme.fromSet = fromSet
    ctheme.palette = {}
    for i,v in palette do
        ctheme.palette[i] = v:ToHex()
    end
    customFunctions.writefile(`{themeSystem.path}/{uid}.json`, HttpService:JSONEncode(ctheme))
    task.spawn(function()
        for _,v in functionsOnCreate do
            task.spawn(v)
        end
    end)
    return uid
end

function themeSystem.delete(uid)
    local results = {themeSystem.find(uid)}
    if not results[1] then
        return false, "no theme found"
    end
    local position = table.find(themes, results[2])
    themeSystem.set(dariusUID)
    table.remove(themes, position)
    customFunctions.delfile(`{themeSystem.path}/{results[2].uid}.json`)
end

function themeSystem.edit(name, color)
    local ctheme = get(currentTheme)
    ctheme[name] = color
    currentTheme:set(ctheme)
end
function themeSystem.editTheme(uid:string, property:string, new:any)
    local results = {themeSystem.find(uid)}
    if not results[1] then
        return false
    end
    local theme = results[2]
    theme[property] = new

    local ctheme = {}
    ctheme.name = theme.name
    ctheme.uid = uid
    ctheme.fromSet = theme.fromSet
    ctheme.palette = {}
    for i,v in theme.palette do
        ctheme.palette[i] = v:ToHex()
    end
    customFunctions.writefile(`{themeSystem.path}/{uid}.json`, HttpService:JSONEncode(ctheme))

    return true
end

function themeSystem.set(uid)
    local results = {themeSystem.find(uid)}
    local theme, palette
    if results[1] then
        theme, palette = results[2], results[2].palette
    else
        return false, "no theme found"
    end

    local _palette = {}
    table.foreach(palette,function(i,v)
        _palette[i] = v
    end)
    currentTheme:set(_palette)
    _currentTheme:set(theme)
    return true, "successfully set new theme"
end
function themeSystem.export()
    local theme = get(_currentTheme)
    local ctheme = {}
    ctheme.name = theme.name
    ctheme.uid = theme.uid
    ctheme.fromSet = theme.fromSet
    ctheme.palette = {}
    for i,v in theme.palette do
        ctheme.palette[i] = v:ToHex()
    end
    return HttpService:JSONEncode(ctheme)
end

function themeSystem.save(uid)
    local results = {themeSystem.find(uid)}
    if results[1] then
        local theme = results[2]
        local ctheme = {}
        ctheme.name = theme.name
        ctheme.uid = theme.uid
        ctheme.fromSet = theme.fromSet
        ctheme.palette = {}
        for i,v in theme.palette do
            ctheme.palette[i] = v:ToHex()
        end
        theme.palette = get(currentTheme)
        customFunctions.writefile(`{themeSystem.path}/{uid}.json`, HttpService:JSONEncode(ctheme))
        themeSystem.set(uid)
        return true
    else
        return false
    end
end

function themeSystem.get(name)
    local theme = get(currentTheme)
    if theme[name] then
        return theme[name]
    else
        error(name.." isn't a theme element")
    end
end

for _,v in palletteCheck do
    themeSystem[v] = animate(function()
        return get(currentTheme)[v]
    end,40,1)
end

function themeSystem.init()
    dariusUID = themeSystem.create("darius", default, "original")
    themeSystem.set(dariusUID)
    for _,file in customFunctions.listfiles(themeSystem.path) do
        local theme = HttpService:JSONDecode(customFunctions.readfile(file))
        table.foreach(theme.palette,function(i,v)
            local color = Color3.fromHex(`#{v}`)
            theme.palette[i] = color
        end)
        themeSystem.create(theme.name, theme.palette, theme.uid, true, theme.fromSet)
    end
end

function themeSystem.onChange(func)
    table.insert(functionsOnChange, func)
end
function themeSystem.onCreate(func)
    table.insert(functionsOnCreate, func)
end

function themeSystem.getTheme()
    return get(_currentTheme)
end

function themeSystem.getThemes()
    return themes
end
function themeSystem.getColors()
    return get(currentTheme)
end

return themeSystem
end)() end,
    [63] = function()local wax,script,require=ImportGlobals(63)local ImportGlobals return (function(...)return {
    background = Color3.fromHex("#2C2F33"),
    background2 = Color3.fromHex("#222427"),

    text = Color3.fromHex("#DCE1E5"),
    text2 = Color3.fromHex("#737C8A"),

    selectedTab = Color3.fromHex("#1A1A1B"),

    scrollBar = Color3.fromHex("#DCE1E5"),

    colorpickerBar = Color3.fromHex("#DCE1E5"),

    notificationButton = Color3.fromHex("#222427"),

    mobileButtonBackground = Color3.fromHex("#DCE1E5"),
    mobileButtonText = Color3.fromHex("#2C2F33"),
    mobileButtonImage = Color3.fromHex("#2C2F33"),

    disabledBackground = Color3.fromHex("#2A2C31"),
    disabledText = Color3.fromHex("#D6DCE0"),

    toggled = Color3.fromHex("#DCE1E5"),

    red = Color3.fromRGB(255,105,97),
    orange = Color3.fromHex("#ff9b61"),
}
end)() end,
    [65] = function()local wax,script,require=ImportGlobals(65)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
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
	local customFont = utilities.customFont

	local simpleElements = require(darius.simpleElements)
	local UIPadding = simpleElements.UIPadding
	local UICorner = simpleElements.UICorner

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Name = "",
		DisabledText = "",
        IsEnabled = false,
		Visible = false,
        Callback = function()end
	},{
		property.DisabledText and "" or "DisabledText",
		property.IsEnabled and "" or "IsEnabled",
		property.Visible and "" or "Visible"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
	local button = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local visible = property.Visible or value(true)
	local isEnabled = property.IsEnabled or value(true)
	local disabledText = property.DisabledText or value("Component Disabled")
	local callback = property.Callback

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(button.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(button.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)

	-- Button

	new "TextButton" {
		Interactable = computed(function()
			if not get(isEnabled) then
				return false
			end
			return get(isSelected)
		end),
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(visible) then
				return false
			end
			return true
		end),
		Parent = _parent,
		Size = UDim2.new(1,0,0,36),
		BackgroundColor3 = theme.background2,
		BackgroundTransparency = selectedAnimation,

		[onevent "Activated"] = function()
			if not get(isEnabled) then
				return
			end
			task.spawn(get(callback))
		end,

		[children] = {
			UICorner(6),
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
						Text = disabledText,
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
					UIPadding(0,8),
					new "TextLabel" { -- Title
						FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
						Size = UDim2.new(1,-39,0,18),
						BackgroundTransparency = 1,
						TextColor3 = theme.text,
						TextScaled = true,
						AnchorPoint = Vector2.new(0,0.5),
						Position = UDim2.new(0,0,0.5,0),
						Text = name,
						TextTransparency = selectedAnimation,
						TextXAlignment = Enum.TextXAlignment.Left,
						RichText = true
					},
					new "ImageLabel" { -- Icon
						Size = UDim2.fromOffset(24,24),
						AnchorPoint = Vector2.new(1,0.5),
						Position = UDim2.new(1,0,0.5,0),
						BackgroundTransparency = 1,
						Image = icons.fingerprint,
						ImageColor3 = theme.text2,
						ImageTransparency = selectedAnimation
					}
				}
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetCallback(newFunction)
		local _didPass, _failedItems = typecheck({['SetCallback'] = newFunction}, {SetCallback = function()end})
		assert(_didPass, table.concat(_failedItems, "\n"))

		callback:set(newFunction)
	end
	function returnFunctions:Fire()
		task.spawn(get(callback))
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [66] = function()local wax,script,require=ImportGlobals(66)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
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
	local customFont = utilities.customFont

	local simpleElements = require(darius.simpleElements)
    local UIListLayout = simpleElements.UIListLayout
    local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment
	local UIPadding = simpleElements.UIPadding
	local UICorner = simpleElements.UICorner

    -- Property

    local _parent = property.Parent
    local _tab = property.tab

    -- Variables

    local visibleCount = value(0)
    local visible = value(true)

	-- Button Group

    local buttonGroup = new "Frame" {
        Visible = visible,
        Parent = _parent,
		Size = UDim2.new(1,0,0,36),
        BackgroundTransparency = 1,

        [children] = {
            UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,3))
        }
    }

    local absSize = value(buttonGroup.AbsoluteSize)

    local returnTable = {}
    function returnTable:Button(_property)

        -- Typecheck

        local didPass, failedItems = typecheck(_property,{
            Name = "",
            DisabledText = "",
            IsEnabled = false,
            Visible = false,
            Callback = function()end
        },{
            _property.IsEnabled and "" or "IsEnabled",
            _property.Visible and "" or "Visible",
            _property.DisabledText and "" or "DisabledText"
        })
        assert(didPass, table.concat(failedItems, "\n"))

        -- Data

        local selectedTab = data.find("selectedTab")
        local searchText = data.find("searchText")
        local button = data.add(_property)

        -- Properties

        local name = _property.Name
        local callback = _property.Callback
        local isEnabled = _property.IsEnabled or value(true)
        local disabledText = _property.DisabledText or value("Component Disabled")
        local _visible = _property.Visible or value(true)

        -- Variables

        local isSelected = value(get(selectedTab.string) == get(_tab).uid)
        observe(selectedTab.string):onChange(function()
            isSelected:set(get(selectedTab.string) == get(_tab).uid)
        end)
        local selectedAnimation = animate(function()
            return get(isSelected) and 0 or 1
        end, 40, 1)

        new "TextButton" {
            Interactable = computed(function()
                if not get(isEnabled) then
                    return false
                end
                return get(isSelected)
            end),
            Visible = computed(function()
                if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(_visible) then
                    return false
                end
                return true
            end),
            Size = computed(function()
                return UDim2.new(1/get(visibleCount) - (get(visibleCount) - 1 == 0 and 0 or ((((get(visibleCount)-1)*3)/get(visibleCount))/get(absSize).X)),0,0,36)
            end),
            Parent = buttonGroup,
            BackgroundColor3 = theme.background2,
            BackgroundTransparency = selectedAnimation,

            [onevent "Activated"] = function()
                if not get(isEnabled) then
                    return
                end
                task.spawn(get(callback))
            end,

            [children] = {
                UICorner(6),
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
                            Text = disabledText,
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
                        UIPadding(0,8),
                        new "TextLabel" { -- Title
                            FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
                            Size = UDim2.new(1,-16-16,0,18),
                            BackgroundTransparency = 1,
                            TextColor3 = theme.text,
                            TextScaled = true,
                            AnchorPoint = Vector2.new(0,0.5),
                            Position = UDim2.new(0,0,0.5,0),
                            Text = name,
                            TextTransparency = selectedAnimation,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            RichText = true
                        },
                        new "ImageLabel" { -- Icon
                            Size = UDim2.fromOffset(16,16),
                            AnchorPoint = Vector2.new(1,0.5),
                            Position = UDim2.new(1,0,0.5,0),
                            BackgroundTransparency = 1,
                            Image = icons.fingerprint,
                            ImageColor3 = theme.text2,
                            ImageTransparency = animate(function()
                                return get(isSelected) and 0.5 or 1
                            end, 40, 1)
                        }
                    }
                }
            }
        }

        if get(_visible) then
            visibleCount:set(get(visibleCount) + 1)
        end
        observe(_visible):onChange(function()
            if get(_visible) then
                visibleCount:set(get(visibleCount) + 1)
            else
                visibleCount:set(get(visibleCount) - 1)
            end
        end)

        local returnFunctions = {}
        function returnFunctions:SetName(newText)
            local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
            assert(_didPass, table.concat(_failedItems, "\n"))

            name:set(newText)
        end
        function returnFunctions:SetCallback(newFunction)
            local _didPass, _failedItems = typecheck({['SetCallback'] = newFunction}, {SetCallback = function()end})
            assert(_didPass, table.concat(_failedItems, "\n"))

            callback:set(newFunction)
        end
        function returnFunctions:Fire()
            task.spawn(get(callback))
        end
        function returnFunctions:Enable()
            isEnabled:set(true)
        end
        function returnFunctions:Disable()
            isEnabled:set(false)
        end
        function returnFunctions:Visible()
            _visible:set(true)
        end
        function returnFunctions:Invisible()
            _visible:set(false)
        end
        return returnFunctions
    end
    function returnTable:Visible()
        visible:set(true)
    end
    function returnTable:Invisible()
        visible:set(false)
    end
	return returnTable
end
end)() end,
    [67] = function()local wax,script,require=ImportGlobals(67)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
	local flagCreator = Bundles.flags
	local services = Bundles.services
	local RunService = services.RunService
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
	local customFont = utilities.customFont
	local randomString = utilities.randomString
	local connections = utilities.connections

	local simpleElements = require(darius.simpleElements)
	local UIListLayout = simpleElements.UIListLayout
	local UIPadding = simpleElements.UIPadding
	local UITextSizeConstraint = simpleElements.UITextSizeConstraint
	local UICorner = simpleElements.UICorner
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Name = "",
		DisabledText = "",
        IsEnabled = false,
		Visible = false,
        Callback = function()end,

		FLAG = "",
		Color = Color3.new(),
		Transparency = 0,
		HideTransparency = true,
		IgnoreConfig = true
	},{
		property.DisabledText and "" or "DisabledText",
		property.IsEnabled and "" or "IsEnabled",
		property.Visible and "" or "Visible",

		property.FLAG and "" or "FLAG",
		property.Color and "" or "Color",
		property.Transparency and "" or "Transparency",
		property.HideTransparency and "" or "HideTransparency",
		property.IgnoreConfig and "" or "IgnoreConfig"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
	local useConfig = data.find("useConfig")
	local offset = data.find("absoluteOffset")
	local currentPicker = data.find("currentPicker")
	local colorpicker = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local disabledText = property.DisabledText or value("Component Disabled")
	local isEnabled = property.IsEnabled or value(true)
	local visible = property.Visible or value(true)
	local callback = property.Callback

	local _color = property.Color or value(Color3.new(1))
	local ignoreConfig = property.IgnoreConfig or value(false)
	local _transparency = property.Transparency or value(0)
	local hideTransparency = property.HideTransparency or value(false)

	local flag = property.FLAG or value(colorpicker.uid)
	local _flag
	if get(flag) ~= "" then
		_flag = flagCreator.register(get(flag), {
			color = value(Color3.new(1)),
			transparency = value(0)
		},"colorpicker", get(flag) == colorpicker.uid)
		_flag.user.Value = {get(_flag.status.color),get(_flag.status.transparency)}
	end
	local color = _flag.status.color
	local transparency = _flag.status.transparency

	observe(color):onChange(function()
		if get(isEnabled) then
			task.spawn(get(callback), get(color), get(transparency))
		end
	end)
	observe(transparency):onChange(function()
		if get(isEnabled) then
			task.spawn(get(callback), get(color), get(transparency))
		end
	end)

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(colorpicker.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(colorpicker.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)

	local hexCodeTextBox = value()
	local hexCodeLength = value(0)

	local HSVTextBox = value()
	local HSVLength = value(0)

	local RGBTextBox = value()
	local RGBLength = value(0)

	local saturationValue = value()
	local saturationValueDown = value(false)

	local hue = value()
	local hueDown = value(false)

	local transparencyRef = value()
	local transparencyDown = value(false)

	local module, setChildren

	local hueAmount = value(0)
	local saturationAmount = value(0)
	local valueAmount = value(0)

	-- Colorpicker

	local function createColorPickerModule()
		return {
			Name = name,
			Children = {
				UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,5)),
				new "TextButton" { -- Saturation and Value
					Size = UDim2.fromOffset(224,224),

					[ref] = saturationValue,

					[onevent "InputBegan"] = function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
							return
						end
						saturationValueDown:set(true)
						local _changed
						_changed = input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End or input.UserInputState.Cancel then
								saturationValueDown:set(false)
								_changed:Disconnect()
							end
						end)
					end,

					[children] = {
						new "UIGradient" {
							Color = computed(function()
								return ColorSequence.new {
									ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
									ColorSequenceKeypoint.new(1, Color3.fromHSV(get(hueAmount),1,1)),
								}
							end)
						},
						new "Frame" {
							Size = UDim2.fromScale(1,1),

							[children] = {
								new "UIGradient" {
									Rotation = 270,
									Color = ColorSequence.new {
										ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
										ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0)),
									},
									Transparency = computed(function()
										return NumberSequence.new {
											NumberSequenceKeypoint.new(0, 0),
											NumberSequenceKeypoint.new(1, 1),
											}
									end)
								}
							}
						},
						new "ImageLabel" {
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5,0.5),
							BackgroundTransparency = 1,
							Image = icons.circle,
							Size = UDim2.fromOffset(10,10),
							ImageColor3 = computed(function()
								return Color3.fromHSV(0,0,1-get(valueAmount))
							end),
							Position = computed(function()
								return UDim2.fromScale(get(saturationAmount), 1-get(valueAmount))
							end),

							[children] = {
								new "ImageLabel" {
									ZIndex = 2,
									AnchorPoint = Vector2.new(0.5,0.5),
									BackgroundTransparency = 1,
									Image = icons.circle,
									Size = UDim2.fromScale(0.9,0.9),
									ImageColor3 = computed(function()
										return Color3.fromHSV(get(hueAmount),1,1)
									end),
									Position = UDim2.fromScale(0.5,0.5)

								}
							}
						}
					}
				},
				new "TextButton" { -- Hue
					Size = UDim2.new(1,0,0,24),

					[onevent "InputBegan"] = function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
							return
						end
						hueDown:set(true)
						local _changed
						_changed = input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End or input.UserInputState.Cancel then
								hueDown:set(false)
								_changed:Disconnect()
							end
						end)
					end,

					[ref] = hue,

					[children] = {
						new "UIGradient" {
							Color = ColorSequence.new {
								ColorSequenceKeypoint.new(0, Color3.fromHSV(1, 1, 1)),
								ColorSequenceKeypoint.new(0.1, Color3.fromHSV(0.9, 1, 1)),
								ColorSequenceKeypoint.new(0.2, Color3.fromHSV(0.8, 1, 1)),
								ColorSequenceKeypoint.new(0.3, Color3.fromHSV(0.7, 1, 1)),
								ColorSequenceKeypoint.new(0.4, Color3.fromHSV(0.6, 1, 1)),
								ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
								ColorSequenceKeypoint.new(0.6, Color3.fromHSV(0.4, 1, 1)),
								ColorSequenceKeypoint.new(0.7, Color3.fromHSV(0.3, 1, 1)),
								ColorSequenceKeypoint.new(0.8, Color3.fromHSV(0.2, 1, 1)),
								ColorSequenceKeypoint.new(0.9, Color3.fromHSV(0.1, 1, 1)),
								ColorSequenceKeypoint.new(1, Color3.fromHSV(0, 1, 1)),
							}
						},
						new "Frame" {
							AnchorPoint = Vector2.new(0,0.5),
							BackgroundColor3 = theme.colorpickerBar,
							Size = UDim2.new(0,2,1,0),
							Position = computed(function()
								return UDim2.fromScale(1 - get(hueAmount),0.5)
							end)
						}
					}
				},
				new "ImageButton" { -- Transparency
					Visible = not get(hideTransparency),
					ZIndex = 2,
					Size = UDim2.new(1,0,0,24),
					BackgroundTransparency = 1,
					Image = "rbxassetid://15612242981",
					ScaleType = Enum.ScaleType.Crop,

					[onevent "InputBegan"] = function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
							return
						end
						transparencyDown:set(true)
						local _changed
						_changed = input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End or input.UserInputState.Cancel then
								transparencyDown:set(false)
								_changed:Disconnect()
							end
						end)
					end,

					[ref] = transparencyRef,

					[children] = {
						new "Frame" {
							Size = UDim2.fromScale(1,1),

							[children] = {
								new "UIGradient" {
									Color = computed(function()
										return ColorSequence.new {
											ColorSequenceKeypoint.new(0, get(color)),
											ColorSequenceKeypoint.new(1, get(color)),
											}
									end),
									Transparency = computed(function()
										return NumberSequence.new {
											NumberSequenceKeypoint.new(0, 0),
											NumberSequenceKeypoint.new(1, 1),
											}
									end)
								}
							}
						},
						new "Frame" {
							AnchorPoint = Vector2.new(0,0.5),
							BackgroundColor3 = theme.colorpickerBar,
							Size = UDim2.new(0,2,1,0),
							Position = computed(function()
								return UDim2.fromScale(get(transparency),0.5)
							end)
						}
					}
				},
				new "Frame" { -- RGB
					Size = UDim2.new(1,0,0,16),
					BackgroundTransparency = 1,

					[children] = {
						UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,4)),
						{
							new "TextLabel" {
								Size = UDim2.new(0,0,0,16),
								AutomaticSize = Enum.AutomaticSize.X,
								Text = "RGB:",
								TextColor3 = theme.text2,
								BackgroundTransparency = 1,
								TextSize = 16,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								TextXAlignment = Enum.TextXAlignment.Right
							},
							new "TextBox" {
								Name = randomString(8),
								BackgroundTransparency = 1,
								Size = UDim2.new(0,42,0,16),
								PlaceholderText = "RGB",
								PlaceholderColor3 = theme.text2,
								AutomaticSize = Enum.AutomaticSize.X,
								TextColor3 = theme.text,
								Text = computed(function()
									local a = {get(color).R,get(color).G,get(color).B}
									for i,v in a do
										a[i] = math.floor(math.clamp(v*255,0,255))
									end
									return table.concat(a, ", ")
								end),
								TextScaled = true,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								ClearTextOnFocus = true,
								TextXAlignment = Enum.TextXAlignment.Right,

								[ref] = RGBTextBox,

								[onevent "Changed"] = function(changedProperty)
									local _RGBTextBox = get(RGBTextBox)
									if changedProperty == "TextBounds" and _RGBTextBox and _RGBTextBox.TextBounds then
										RGBLength:set(_RGBTextBox.TextBounds.X)
									end
								end,

								[onevent "FocusLost"] = function()
									local _RGBTextBox = get(RGBTextBox)
									local _rgb = _RGBTextBox.Text:gsub(" ","")
									local a = {get(color).R,get(color).G,get(color).B}
									for i,v in a do
										a[i] = math.floor(math.clamp(v*255,0,255))
									end
									local _old = table.concat(a, ", ")
									local s,result = pcall(function()
										local b = string.split(_rgb, ",")
										table.foreach(b, function(i,v)
											if not tonumber(v) then
												return nil
											end
											b[i] = math.clamp(v, 0, 255)
										end)
										return Color3.fromRGB(b[1],b[2],b[3])
									end)
									if s and result then
										color:set(result)
										hueAmount:set(({get(color):ToHSV()})[1])
										saturationAmount:set(({get(color):ToHSV()})[2])
										valueAmount:set(({get(color):ToHSV()})[3])
									else
										_RGBTextBox.Text = _old
									end
								end,

								[children] = {
									UITextSizeConstraint(1,16),
									new "UISizeConstraint" {
										MaxSize = Vector2.new(110,16),
										MinSize = Vector2.new(42,16)
									},
									new "Frame"{
										AnchorPoint = Vector2.new(1,0.5),
										BackgroundColor3 = theme.text2,
										Position = UDim2.fromScale(1,1),
										Size = animate(function()
											return UDim2.fromOffset(math.clamp(get(RGBLength),0,110),2)
										end,40,1),

										[children] = {
											UICorner(0,1)
										}
									}
								}
							}
						}
					}
				},
				new "Frame" { -- HSV
					Size = UDim2.new(1,0,0,16),
					BackgroundTransparency = 1,

					[children] = {
						UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,5)),
						{
							new "TextLabel" {
								Size = UDim2.new(0,0,0,16),
								AutomaticSize = Enum.AutomaticSize.X,
								Text = "HSV:",
								TextColor3 = theme.text2,
								BackgroundTransparency = 1,
								TextSize = 16,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								TextXAlignment = Enum.TextXAlignment.Right
							},
							new "TextBox" {
								Name = randomString(8),
								BackgroundTransparency = 1,
								Size = UDim2.new(0,36,0,16),
								AutomaticSize = Enum.AutomaticSize.X,
								PlaceholderText = "HSV",
								PlaceholderColor3 = theme.text2,
								TextColor3 = theme.text,
								Text = computed(function()
									local a = {get(color):ToHSV()}
									for i,v in a do
										a[i] = math.floor(v*100)/100
									end
									return table.concat(a, ", ")
								end),
								TextScaled = true,
								FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
								ClearTextOnFocus = true,
								TextXAlignment = Enum.TextXAlignment.Right,

								[ref] = HSVTextBox,

								[onevent "Changed"] = function(changedProperty)
									local _HSVTextBox = get(HSVTextBox)
									if changedProperty == "TextBounds" and _HSVTextBox and _HSVTextBox.TextBounds then
										HSVLength:set(_HSVTextBox.TextBounds.X)
									end
								end,

								[onevent "FocusLost"] = function()
									local _HSVTextBox = get(HSVTextBox)
									local _hsv = _HSVTextBox.Text:gsub(" ","")
									local a = {get(color):ToHSV()}
									for i,v in a do
										a[i] = math.floor(v*100)/100
									end
									local _old = table.concat(a, ", ")
									local s,result = pcall(function()
										local b = string.split(_hsv, ",")
										table.foreach(b, function(i,v)
											if not tonumber(v) then
												return nil
											end
										end)
										return Color3.fromHSV(unpack(b))
									end)
									if s and result then
										color:set(result)
										hueAmount:set(({get(color):ToHSV()})[1])
										saturationAmount:set(({get(color):ToHSV()})[2])
										valueAmount:set(({get(color):ToHSV()})[3])
									else
										_HSVTextBox.Text = _old
									end
								end,

								[children] = {
									UITextSizeConstraint(1,16),
									new "UISizeConstraint" {
										MaxSize = Vector2.new(110,16),
										MinSize = Vector2.new(36,16)
									},
									new "Frame"{
										AnchorPoint = Vector2.new(1,0.5),
										BackgroundColor3 = theme.text2,
										Position = UDim2.fromScale(1,1),
										Size = animate(function()
											return UDim2.fromOffset(math.clamp(get(HSVLength),36,110),2)
										end,40,1),

										[children] = {
											UICorner(0,1)
										}
									}
								}
							}
						}
					}
				}
			}
		}
	end
	observe(isEnabled):onChange(function()
		if not get(isEnabled) and typeof(module) == "Instance" then
			module:Destroy()
		end
	end)

	new "Frame" {
		Interactable = computed(function()
			if not get(isEnabled) then
				return false
			end
			return get(isSelected)
		end),
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(visible) then
				return false
			end
			return true
		end),
		Parent = _parent,
		Size = UDim2.new(1,0,0,36),
		BackgroundTransparency = 1,
		BackgroundColor3 = theme.background2,

		[children] = {
			UICorner(6),
			new "Frame" { -- Disabled Frame
				ZIndex = 3,
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
						Text = disabledText,
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
					UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Bottom, UDim.new(0,3)),
					new "Frame" {
						Size = UDim2.new(1,-103,1,0),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[children] = {
							UIPadding(9,8),
							UICorner(6),
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Top),
							new "TextLabel" {
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
						Size = UDim2.new(0,100,0,36),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,

						[onevent "Activated"] = function()
							if typeof(get(currentPicker.module)) == "Instance" then
								get(currentPicker.module):Destroy()
							end
							module, setChildren = require(script.Parent.module)(createColorPickerModule())
							currentPicker:update("module", module)
						end,

						[children] = {
							UIPadding(0,8),
							UICorner(6),
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Right,VA.Center,UDim.new(0,5)),
							new "Frame" {
								Size = UDim2.new(1,-29,0,36),
								BackgroundTransparency = 1,

								[children] = {
									UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Right,VA.Center,UDim.new(0,4)),
									new "TextBox" {
										Interactable = computed(function()
											if not get(isEnabled) then
												return false
											end
											return get(isSelected)
										end),
										Name = randomString(8),
										BackgroundTransparency = 1,
										Size = UDim2.new(1,0,0,16),
										PlaceholderText = "Hex",
										PlaceholderColor3 = theme.text2,
										TextColor3 = theme.text,
										TextTransparency = selectedAnimation,
										Text = computed(function()
											return "#"..get(color):ToHex()
										end),
										TextScaled = true,
										FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
										ClearTextOnFocus = true,
										TextXAlignment = Enum.TextXAlignment.Right,

										[onevent "Changed"] = function(changedProperty)
											local _hexCodeText = get(hexCodeTextBox)
											if changedProperty == "TextBounds" and _hexCodeText and _hexCodeText.TextBounds then
												hexCodeLength:set(_hexCodeText.TextBounds.X)
											end
										end,

										[onevent "FocusLost"] = function()
											local _textBox = get(hexCodeTextBox)
											local _hexCode = _textBox.Text:gsub("[^%w#]", "")
											if not string.find(_hexCode, "#") then
												_hexCode = "#".._hexCode
											end
											if string.len(_hexCode) ~= 7 then
												_textBox.Text = "#"..get(color):ToHex()
											else
												local s,result = pcall(function()
													return Color3.fromHex(_hexCode)
												end)
												if s then
													color:set(result)
												else
													_textBox.Text = "#"..get(color):ToHex()
												end
											end
										end,

										[ref] = hexCodeTextBox,

										[children] = {
											UITextSizeConstraint(1,16),
											new "Frame"{
												AnchorPoint = Vector2.new(1,0.5),
												BackgroundColor3 = theme.text2,
												BackgroundTransparency = animate(function()
													if get(isSelected) then
														return 0.5
													end
													return 1
												end,40,1),
												Position = UDim2.fromScale(1,1),
												Size = animate(function()
													return UDim2.fromOffset(math.clamp(get(hexCodeLength),0,140-29-13),2)
												end,40,1),

												[children] = {
													UICorner(0,1)
												}
											}
										}
									}
								}
							},
							new "ImageLabel" {
								Size = UDim2.fromOffset(24,24),
								Image = icons.paint,
								ImageColor3 = color,
								BackgroundTransparency = 1,
								ImageTransparency = animate(function()
									return not get(isSelected) and 1 or get(transparency)
								end,40,1),

								[children] = {
									UICorner(6)
								}
							}
						}
					}
				}
			}
		}
	}

	connections.add(RunService.Heartbeat:Connect(function()
		if get(saturationValueDown) then
			local _saturationValue = get(saturationValue)
			local newSV = UserInputService:GetMouseLocation() - _saturationValue.AbsolutePosition - Vector2.new(0,get(offset.number))
			newSV = Vector2.new(math.clamp(newSV.X, 0, _saturationValue.AbsoluteSize.X), math.clamp(newSV.Y, 0, _saturationValue.AbsoluteSize.Y))
			saturationAmount:set(newSV.X/_saturationValue.AbsoluteSize.X)
			valueAmount:set((_saturationValue.AbsoluteSize.Y - newSV.Y)/_saturationValue.AbsoluteSize.Y)
			color:set(Color3.fromHSV(get(hueAmount), get(saturationAmount), get(valueAmount)))
		end
		if get(hueDown) then
			local _hue = get(hue)
			local newHue = UserInputService:GetMouseLocation() - _hue.AbsolutePosition - Vector2.new(0,get(offset.number))
			newHue = Vector2.new(math.clamp(newHue.X, 0, _hue.AbsoluteSize.X), 0)
			hueAmount:set((_hue.AbsoluteSize.X - newHue.X)/_hue.AbsoluteSize.X)
			color:set(Color3.fromHSV(get(hueAmount), get(saturationAmount), get(valueAmount)))
		end
		if get(transparencyDown) then
			local __transparency = get(transparencyRef)
			local newTransparency = UserInputService:GetMouseLocation() - __transparency.AbsolutePosition - Vector2.new(0,get(offset.number))
			newTransparency = Vector2.new(math.clamp(newTransparency.X, 0, __transparency.AbsoluteSize.X),0)
			transparency:set(newTransparency.X/__transparency.AbsoluteSize.X)
		end
	end))

	-- Closure

	if get(useConfig.boolean) and not get(ignoreConfig) then
		_flag.file:Connect(function(file)
			local noColor = true
			local noTransparency = true
			if file.color ~= nil then
				if string.find(file.color, ",") then
					local a = string.split(file.color:gsub(" ", ""), ",")
					table.foreach(a, function(i,v)
						a[i] = tonumber(v)
					end)
					color:set(Color3.new(unpack(a)))
				else
					color:set(Color3.fromHex(`#{string.gsub(file.color,"#","")}`))
				end
				noColor = false
			end
			if file.transparency ~= nil then
				transparency:set(tonumber(file.transparency))
				noTransparency = false
			end
			if noColor then
				color:set(get(_color))
			end
			if noTransparency then
				transparency:set(get(_transparency))
			end
			hueAmount:set(({get(color):ToHSV()})[1])
			saturationAmount:set(({get(color):ToHSV()})[2])
			valueAmount:set(({get(color):ToHSV()})[3])
		end)
		if _flag.private then
			color:set(get(_color))
			transparency:set(get(_transparency))
		end
	else
		color:set(get(_color))
		transparency:set(get(_transparency))
	end
	if _flag.preregistered and _flag.preregisteredValue and typeof(_flag.preregisteredValue) == "table" then
		if _flag.preregisteredValue.color and typeof(_flag.preregisteredValue.color) == "string" then
			local s,result = pcall(function()
				return Color3.fromHex(_flag.preregisteredValue.color)
			end)
			if s then
				color:set(result)
			end
		end
		if not get(hideTransparency) then
			if _flag.preregisteredValue.transparency and typeof(_flag.preregisteredValue.transparency) == "number" then
				transparency:set(_flag.preregisteredValue.transparency)
			end
		end
	end

	hueAmount:set(({get(color):ToHSV()})[1])
	saturationAmount:set(({get(color):ToHSV()})[2])
	valueAmount:set(({get(color):ToHSV()})[3])

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetColor(newColor)
		local _didPass, _failedItems = typecheck({['SetColor'] = newColor}, {SetColor = Color3.new()})
		assert(_didPass, table.concat(_failedItems, "\n"))

		color:set(newColor)

		hueAmount:set(({get(color):ToHSV()})[1])
		saturationAmount:set(({get(color):ToHSV()})[2])
		valueAmount:set(({get(color):ToHSV()})[3])
	end
	function returnFunctions:SetTransparency(newTransparency)
		local _didPass, _failedItems = typecheck({['SetTransparency'] = newTransparency}, {SetTransparency = 0})
		assert(_didPass, table.concat(_failedItems, "\n"))

		transparency:set(newTransparency)
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [68] = function()local wax,script,require=ImportGlobals(68)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
    local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local Fusion = Bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
		local value = Fusion.Value
		local observe = Fusion.Observer

	local utilities = require(darius.utilities)
	local get = utilities.get
	local animate = utilities.animate

    -- Data

	local selectedTab = data.find("selectedTab")
	local divider = data.add(property)

	-- Properties

	local _parent = property.Parent

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(divider.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(divider.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)

    new "Frame" {
        Parent = _parent,
		Size = UDim2.new(1,0,0,16),
		BackgroundTransparency = 1,

        [children] = {
            new "Frame" {
                Size = UDim2.new(1,0,0,2),
                AnchorPoint = Vector2.new(0.5,0.5),
                Position = UDim2.fromScale(0.5,0.5),
                BackgroundColor3 = theme.text2,
                BackgroundTransparency = selectedAnimation
            }
        }
    }
end
end)() end,
    [69] = function()local wax,script,require=ImportGlobals(69)local ImportGlobals return (function(...)local darius = script.Parent.Parent

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
		IsEnabled = false,
		Visible = false,
        Callback = function()end,

		FLAG = "",
        Items = {},
        Multiselect = true,
        Regex = function()end,
		IgnoreConfig = true,
		Alphabetical = true,
		AlwaysOpen = true
	},{
		property.DisabledText and "" or "DisabledText",
		property.IsEnabled and "" or "IsEnabled",
		property.Visible and "" or "Visible",

		property.FLAG and "" or "FLAG",
		property.Multiselect and "" or "Multiselect",
		property.Regex and "" or "Regex",
		property.IgnoreConfig and "" or "IgnoreConfig",
		property.Alphabetical and "" or "Alphabetical",
		property.AlwaysOpen and "" or "AlwaysOpen"
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
	local disabledText = property.DisabledText or value("Component Disabled")
	local isEnabled = property.IsEnabled or value(true)
	local visible = property.Visible or value(true)
	local callback = property.Callback

	local items = value({})
	local multiselect = property.Multiselect or value(false)
	local default = property.Default
	local ignoreConfig = property.IgnoreConfig or value(false)
	local alphabetical = property.Alphabetical or value(false)
	local alwaysOpen = property.AlwaysOpen or value(false)
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
	local _items = _flag.status.items
	local _item = _flag.status.item

	-- Variables


	local searchRef = value()

	local isDropped = value(false)
	local lastReturnedValue = value(get(multiselect) and {} or "")
	local itemElements = value({})
	local displayValues = value({})
	local hasSelectedAll = value(false)

	observe(_items):onChange(function()
		if #get(_items) == #get(items) then
			hasSelectedAll:set(true)
		else
			hasSelectedAll:set(false)
		end

		local _cbTable = {}
		for _,v in get(_items) do
			table.insert(_cbTable, get(regex)(v))
		end
		task.wait()
		task.spawn(get(callback), _cbTable)
		lastReturnedValue:set(get(_items))
	end)
	observe(_item):onChange(function()
		task.wait()
		task.spawn(get(callback), get(regex)(get(_item)))
		lastReturnedValue:set(get(regex)(get(_item)))
	end)
	local isSelected = value(get(selectedTab.string) == get(dropdown.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(dropdown.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local function checkIfExists(item)
		for _,eItem in get(items) do
			local _value = typeof(eItem) == "table" and eItem.Value or eItem
			if _value == item then
				return true
			end
		end
		return false
	end

	-- Dropdown

	new "Frame" {
		Parent = _parent,
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(visible) then
				return false
			end
			return true
		end),
		Size = animate(function()
			if get(isDropped) then
				return UDim2.new(1,0,0,36 + 4 + 32 + 4 + (get(multiselect) and (32 + 4 + 6) or 6) + math.clamp((#get(items)*34), 34, 136))
			end
			return UDim2.new(1,0,0,36)
		end, 40, 1),
		BackgroundColor3 = theme.background2,
		BackgroundTransparency = selectedAnimation,
		ClipsDescendants = true,

		[children] = {
			UICorner(6),
			UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Left,VA.Top,UDim.new(0,4)),
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
					if get(alwaysOpen) then
						return
					end
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
										return get(name).." "..tostring(#get(_items)).."/"..tostring(#get(items))
									end
									if typeof(get(lastReturnedValue)) == "table" then
										return get(name)
									end
									if get(displayValues)[get(lastReturnedValue)] then
										return `{get(name)}: {get(displayValues)[get(lastReturnedValue)]}`
									end
									return `{get(name)}: {get(lastReturnedValue)}`
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
							_items:set(tableToSet)
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
				Size = computed(function()
					return UDim2.new(1,-6,0,math.clamp((#get(items)*34), 34, 136))
				end),
				BackgroundTransparency = 1,
				ScrollBarThickness = computed(function()
					return #get(items) > 4 and 6 or 0
				end),
				ScrollBarImageColor3 = theme.scrollBar,
				CanvasSize = UDim2.new(0,0,0,0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,

				[children] = {
					UIPadding(6,computed(function()
						return #get(items) > 4 and UDim.new(0,12) or UDim.new(0,0)
					end),0,6),
					UIListLayout(get(alphabetical) and SO.Name or SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,6)),
					itemElements
				}
			}
		}
	}

	observe(items):onChange(function()
		local tableOfElements = {}
		for _,item in get(items) do
			local itemValue, itemImage, itemDisplayValue
			local isItemSelected = value(false)
			if typeof(item) == "table" then
				local _didPass, _failedItems = typecheck(item, {DisplayValue = "", Value = "",Image = ""},{item.Image and "" or "Image", item.DisplayValue and "" or "DisplayValue"})
				assert(_didPass, table.concat(_failedItems, "\n"))

				itemValue = item.Value
				itemImage = item.Image or nil
				itemDisplayValue = item.DisplayValue or nil
			else
				local _didPass, _failedItems = typecheck({['Item'] = item}, {Item = "",})
				assert(_didPass, table.concat(_failedItems, "\n"))

				itemValue = item
			end
			local cleanedItem = get(regex)(itemValue)
			if itemDisplayValue then
				local _displayValues = get(displayValues)

				_displayValues[itemValue] = itemDisplayValue
				displayValues:set(_displayValues)
			end

			observe(_items):onChange(function()
				if table.find(get(_items), cleanedItem) then
					isItemSelected:set(true)
				else
					isItemSelected:set(false)
				end
			end)
			observe(_item):onChange(function()
				if get(_item) == cleanedItem then
					isItemSelected:set(true)
				else
					isItemSelected:set(false)
				end
			end)

			local itemElement = new "TextButton" {
				Name = `{itemDisplayValue ~= nil and itemDisplayValue or itemValue}`,
				Size = UDim2.new(1,0,0,28),
				BackgroundTransparency = selectedAnimation,
				BackgroundColor3 = theme.background,

				[onevent "Activated"] = function()
					if get(multiselect) then
						local _items2 = get(_items)
						isItemSelected:set(not get(isItemSelected))
						if get(isItemSelected) then
							table.insert(_items2, cleanedItem)
						else
							table.remove(_items2, table.find(_items2, cleanedItem))
						end

						_items:set(_items2)
					else
						_item:set(cleanedItem)
						if get(alwaysOpen) then
							return
						end
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
						Text = itemDisplayValue or itemValue,
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
	if get(alwaysOpen) then
		isDropped:set(true)
	end

	if get(useConfig.boolean) and not get(ignoreConfig) then
		_flag.file:Connect(function(file)
			local noChange = true
			if file ~= nil then
				noChange = false
			end
			if get(multiselect) then
				local cleansed = {}
				for _,v in file do
					if checkIfExists(v) then
						table.insert(cleansed, v)
					end
				end
				local currents = get(_items)
				local different = false
				local longerTable = #currents > #cleansed and currents or cleansed
				local shorterTable = #currents < #cleansed and currents or cleansed
				for i,v in longerTable do
					if shorterTable[i] ~= v then
						different = true
						break
					end
				end
				if different then
					_items:set(cleansed)
				end
			else
				_item:set(file)
			end
			if noChange then
				if get(multiselect) then
					if default and #get(default) > 0 then
						_items:set(get(default))
					end
				else
					if default then
						_item:set(get(default))
					end
				end
			end
		end)
		if _flag.private then
			if get(multiselect) then
				if default and #get(default) > 0 then
					_items:set(get(default))
				end
			else
				if default then
					for _,v in get(items) do
						if typeof(v) == "table" and v.Value == get(default) then
							_item:set(get(default))
						elseif v == get(default) then
							_item:set(get(default))
						end
					end
				end
			end
		end
	else
		if get(multiselect) then
			if default and #get(default) > 0 then
				_items:set(get(default))
			end
		else
			if default then
				_item:set(get(default))
			end
		end
	end
	if _flag.preregistered and _flag.preregisteredValue then
		if get(multiselect) then
			if typeof(_flag.preregisteredValue) == "table" then
				local cleansed = {}
				for _,v in _flag.preregisteredValue do
					if checkIfExists(v) then
						table.insert(cleansed, v)
					end
				end
				local currents = get(_items)
				local different = false
				local longerTable = #currents > #cleansed and currents or cleansed
				local shorterTable = #currents < #cleansed and currents or cleansed
				for i,v in longerTable do
					if shorterTable[i] ~= v then
						different = true
						break
					end
				end
				if different then
					_items:set(cleansed)
				end
			end
		else
			if typeof(_flag.preregisteredValue) == "string" and checkIfExists(_flag.preregisteredValue) then
				_item:set(_flag.preregisteredValue)
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
					_item:set(cleanedItem)
					break
				end
			end
		end
		if foundAnything then
			if get(multiselect) then
				_items:set(multiselectTable)
			end
		else
			if get(multiselect) then
				_items:set({})
			else
				_item:set("")
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
		_item:set(item)
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
		_items:set(newSelecteds)
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [70] = function()local wax,script,require=ImportGlobals(70)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
		IsEnabled = false,
		Visible = false,
        Callback = function()end,

		FLAG = "",
		Bind = Enum.KeyCode.Q,
		IgnoreConfig = true
	},{
		property.DisabledText and "" or "DisabledText",
		property.IsEnabled and "" or "IsEnabled",
		property.Visible and "" or "Visible",

		property.FLAG and "" or "FLAG",
		property.Bind and "" or "Bind",
		property.IgnoreConfig and "" or "IgnoreConfig"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local currentBinds = data.find("currentBinds")
	local useConfig = data.find("useConfig")
	local searchText = data.find("searchText")
	local isMobile = data.find("isMobile")
	local instanceName = data.find("instanceName")
	local isListening = data.find("isListening")
	local bindData = data.find("bindData")
	local absoluteOffset = data.find("absoluteOffset").number
	local keybind = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local disabledText = property.DisabledText or value("Component Disabled")
	local isEnabled = property.IsEnabled or value(true)
	local visible = property.Visible or value(true)
	local callback = property.Callback

	local bind = property.Bind
	local ignoreConfig = property.IgnoreConfig or value(false)

	local flag = property.FLAG or value(keybind.uid)
	local _flag
	if get(flag) ~= "" then
		_flag = flagCreator.register(get(flag), {
			coordinate = value(nil),
			keycode = value(nil),
			mobile = get(isMobile.boolean)
		},"keybind", get(flag) == keybind.uid)
		_flag.user.Value = get(isMobile.boolean) and get(_flag.status.coordinate) or get(_flag.status.keycode)
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
				name = get(name)
			}
			bindData:update("bindData", _bindData)
			currentBinds:update("binds", _currentBinds)
			_flag.status.keycode:set(get(keyCode).Name)
		end
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
				_flag.status.coordinate:set(mobileButton.AbsolutePosition)
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
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(visible) then
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
							_flag.status.coordinate:set(nil)
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

	if get(useConfig.boolean) and not get(ignoreConfig)  then
		_flag.file:Connect(function(file)
			local noKeyCode = true
			if file.keycode ~= nil and ((get(keyCode) and get(keyCode).Name or  "") ~= file.keycode) then
				local success, result = pcall(function()
					return Enum.KeyCode[file.keycode]
				end)
				if success then
					checkKeyCode(result, "File1")
				end
				noKeyCode = false
			end
			if noKeyCode and get(_flag.status.keycode) == nil then
				if bind then
					checkKeyCode(get(bind), "NoFileFound")
				end
			end
			if get(isMobile.boolean) and file.coordinate then
				mobileButton.Position = UDim2.fromOffset(file.coordinate.X + 30,file.coordinate.Y + 30 + get(absoluteOffset))
				hasPlaced:set(true)
				_flag.status.coordinate:set(file.coordinate)
			elseif get(isMobile.boolean) and not file.coordinate then
				hasPlaced:set(false)
				mobileButton.Position = UDim2.fromScale(0.5,0.5)
			end
		end)
		if _flag.private then
			if bind then
				checkKeyCode(get(bind), "Private")
			end
		end
	else
		if bind then
			checkKeyCode(get(bind), "IgnoreConfig/UseConfig:false")
		end
	end
	if _flag.preregistered and _flag.preregisteredValue and typeof(_flag.preregisteredValue) == "table" then
		if not get(isMobile.boolean) then
			if _flag.preregisteredValue.keycode and typeof(_flag.preregisteredValue.keycode) == "string" then
				local success, result = pcall(function()
					return Enum.KeyCode[_flag.preregisteredValue.keycode]
				end)
				if success then
					checkKeyCode(result, "Configuration1")
				end
			end
		else
			if _flag.preregisteredValue.coordinate and typeof(_flag.preregisteredValue.coordinate) == "table" and _flag.preregisteredValue.coordinate.X and _flag.preregisteredValue.coordinate.Y then
				if typeof(_flag.preregisteredValue.coordinate.X) == "number" and typeof(_flag.preregisteredValue.coordinate.Y) == "number" then
					mobileButton.Position = UDim2.fromOffset(_flag.preregisteredValue.coordinate.X + 30,_flag.preregisteredValue.coordinate.Y + 30 + get(absoluteOffset))
					hasPlaced:set(true)
				end
			end
		end
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
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [71] = function()local wax,script,require=ImportGlobals(71)local ImportGlobals return (function(...)local darius = script.Parent.Parent

return function(property)
    local bundles = require(darius.Bundles)
    local data = bundles.data
    local theme = bundles.themeSystem
    local icons = bundles.icons
    local fusion = bundles.Fusion
        local new = fusion.New
        local children = fusion.Children
        local value = fusion.Value
        local computed = fusion.Computed
        local observe = fusion.Observer
		local onevent = fusion.OnEvent

	local simpleElements = require(darius.simpleElements)
	local UICorner = simpleElements.UICorner
	local UIPadding = simpleElements.UIPadding
	local UITextSizeConstraint = simpleElements.UITextSizeConstraint
	local UIListLayout = simpleElements.UIListLayout
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment

    local utilities = require(darius.utilities)
    local get = utilities.get
    local animate = utilities.animate
    local getStringBounds = utilities.getStringBounds
    local customFont = utilities.customFont

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
    local currentBinds = data.find("currentBinds")
	local bindData = data.find("bindData")
	local keybindList = data.add(property)

	-- Properties

	local _parent = property.Parent
	local title = value("Active Keybinds")
	local body = value("")

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(keybindList.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(keybindList.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local ySize = value(0)
	task.spawn(function()
		ySize:set(getStringBounds(get(body),{
			Font = customFont("Montserrat", Enum.FontWeight.Medium),
			Size = 16,
			Width = math.round(get(_parent).AbsoluteSize.X)
		}).Y)
	end)
	get(_parent).Changed:Connect(function(changedProperty)
		if changedProperty:lower() == "absolutesize" then
			ySize:set(getStringBounds(get(body),{
				Font = customFont("Montserrat", Enum.FontWeight.Medium),
                Size = 16,
                Width = math.round(get(_parent).AbsoluteSize.X)
			}).Y)
		end
	end)
	observe(body):onChange(function()
		ySize:set(getStringBounds(get(body),{
			Font = customFont("Montserrat", Enum.FontWeight.Bold),
            Size = 16,
            Width = math.round(get(_parent).AbsoluteSize.X)
		}).Y)
	end)
    local function createBody(tbl)
        local tmp = {}
        table.foreach(tbl, function(i,v)
            tmp[i] = v.Name
        end)
        return table.concat(tmp, ", ")
    end
	local name = value("Active Keybinds")

	local setChildren, module

	-- keybindList

	module, setChildren = require(script.Parent.module)({
		Name = name,
		Children = {}
	})

	local function updateModule(tbl)
		local newChildren = {
			UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,5))
		}
		local _bindData = get(bindData.bindData)
		for _,v in get(currentBinds.binds) do
			local _data = _bindData[v.Name]
			table.insert(newChildren, new "TextLabel" {
				Size = UDim2.new(1,0,0,14),
				BackgroundTransparency = 1,
				TextColor3 = theme.text,
				FontFace = customFont("Montserrat", Enum.FontWeight.Regular),
				TextXAlignment = Enum.TextXAlignment.Left,
				RichText = true,
				Text = computed(function()
					if _data.boolean then
						return `[{_data.bind.Name}] {_data.name} (<i>{string.upper(tostring(get(_data.boolean)))}</i>)`
					end
					return `[{_data.bind.Name}] {_data.name}`
				end)
			})
		end
		setChildren(newChildren)
	end

	new "TextButton" {	
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(title):lower(), get(searchText.string):lower()) and not string.find(get(body):lower(), get(searchText.string):lower()) then
				return false
			end
			return true
		end),
		BackgroundColor3 = theme.background2,
		Parent = _parent,
		BackgroundTransparency = selectedAnimation,
		Size = computed(function()
			return UDim2.new(1,0,0,36 + get(ySize))
		end),
		AutomaticSize = Enum.AutomaticSize.Y,

		[onevent "Activated"] = function()
			if typeof(module) == "Instance" then
				module:Destroy()
				module = nil
			end
			module, setChildren = require(script.Parent.module)({
				Name = name,
				Children = {}
			})
			updateModule(get(currentBinds.binds))
		end,

		[children] = {
			UICorner(6),
			UIPadding(6),
            new "ImageLabel" {
                ZIndex = 0,
                Size = UDim2.fromOffset(20,20),
                BackgroundTransparency = 1,
                Image = icons.command,
                ImageColor3 = theme.text2,
                ImageTransparency = selectedAnimation
            },
			new "TextLabel" {
				Name = "Title",
				RichText = true,
				Size = UDim2.new(1,-25,0,18),
                Position = UDim2.fromOffset(25,0),
				BackgroundTransparency = 1,
				TextTransparency = selectedAnimation,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextScaled = true,
				TextSize = 18,
                FontFace = customFont("Montserrat", Enum.FontWeight.Bold),

				TextColor3 = theme.text,
				Text = title,

				[children] = {
					UITextSizeConstraint(1,18),
				}
			},
			new "TextLabel" {
				Name = "Body",
				TextWrapped = true,
				RichText = true,
				Position = UDim2.fromOffset(4,25),
				BackgroundTransparency = 1,
				TextTransparency = selectedAnimation,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = 16,
				FontFace = customFont("Montserrat", Enum.FontWeight.Medium),

				TextColor3 = theme.text2,
				Text = body,
				Size = computed(function()
					return UDim2.new(1,-4,0,get(ySize))
				end)
			}
		}
	}
	
	observe(currentBinds.binds):onChange(function()
		updateModule(get(currentBinds.binds))
	end)
	updateModule(get(currentBinds.binds))

    body:set(createBody(get(currentBinds.binds)))
    observe(currentBinds.binds):onChange(function()
        body:set(createBody(get(currentBinds.binds)))
    end)
end
end)() end,
    [72] = function()local wax,script,require=ImportGlobals(72)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
	local bundles = require(darius.Bundles)
	local data = bundles.data
	local theme = bundles.themeSystem
	local fusion = bundles.Fusion
		local new = fusion.New
		local children = fusion.Children
		local value = fusion.Value
		local computed = fusion.Computed
		local observe = fusion.Observer

	local simpleElements = require(darius.simpleElements)
	local UICorner = simpleElements.UICorner
	local UIPadding = simpleElements.UIPadding

	local utilities = require(darius.utilities)
	local get = utilities.get
	local typecheck = utilities.typecheck
	local animate = utilities.animate
	local customFont = utilities.customFont

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Text = "",
		Visible = false
	},{
		property.Visible and "" or "Visible"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
	local label = data.add(property)

	-- Properties

	local _parent = property.Parent
	local text = property.Text
	local visible = property.Visible or value(true)

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(label.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(label.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)

	-- Label

	new "Frame" {
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(text):lower(), get(searchText.string):lower()) or not get(visible) then
				return false
			end
			return true
		end),
		Size = UDim2.new(1,0,0,36),
		Parent = _parent,
		BackgroundTransparency = selectedAnimation,
		BackgroundColor3 = theme.background2,

		[children] = {
			UICorner(6),
			UIPadding(0,8),
			new "TextLabel" {
				FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
				RichText = true,
				TextScaled = true,
				BackgroundTransparency = 1,
				TextTransparency = selectedAnimation,
				Size = UDim2.new(1,-0,0,18),
				Position = UDim2.new(0,0,0.5,0),
				AnchorPoint = Vector2.new(0,0.5),
				TextXAlignment = Enum.TextXAlignment.Left,

				TextColor3 = theme.text,
				Text = computed(function()
					return get(text)
				end),

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 18
					}
				}
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:SetText(newText)
		local _didPass, _failedItems = typecheck({['SetText'] = newText}, {SetText = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		text:set(newText)
	end
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [73] = function()local wax,script,require=ImportGlobals(73)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
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
	local customFont = utilities.customFont
    local drag = utilities.drag
    local references = utilities.references
    local connections = utilities.connections

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
		Name = {},
        Children = {}
	},{})
	assert(didPass, table.concat(failedItems, "\n"))

    -- Data

    local instanceName = data.find("instanceName")
    local absoluteOffset = data.find("absoluteOffset")

    -- Properties

    local name = property.Name
    local _children = value(property.Children)

    -- Variables

    local screenGui = references.get(get(instanceName.name))
    local down = value(false)

    -- Module

    local module
    module = new "TextButton" {
        Parent = screenGui,
        Size = UDim2.fromOffset(240,11),
        Position = UDim2.fromOffset(10,10 + get(absoluteOffset.number)),
        BackgroundTransparency = 1,

        [onevent "MouseButton1Down"] = function()
            down:set(true)
        end,

        [children] = {
            new "Frame" {
                Position = UDim2.new(0.5,-120,0,0),
                Size = UDim2.fromOffset(240,0),
                BackgroundColor3 = theme.background2,
                AutomaticSize = Enum.AutomaticSize.Y,

                [children] = {
                    UICorner(4),
                    UIPadding(8),
                    new "TextButton" {
                        AnchorPoint = Vector2.new(1,0),
                        Position = UDim2.fromScale(1,0),
                        Size = UDim2.fromOffset(32,32),
                        BackgroundColor3 = theme.selectedTab,

                        [onevent "Activated"] = function()
                            module:Destroy()
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
                                ImageTransparency = 0
                            }
                        }
                    },
                    new "Frame" {
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1,0,0,0),
                        AutomaticSize = Enum.AutomaticSize.Y,

                        [children] = {
                            UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Center,VA.Top,UDim.new(0,8)),
                            new "Frame" {
                                Size = animate(function()
                                    return get(down) and UDim2.new(0.4,0,0,6) or UDim2.new(0.25,0,0,6)
                                end,40,1),
                                BackgroundColor3 = theme.text2,
                                BackgroundTransparency = animate(function()
                                    return get(down) and 0 or 0.5
                                end,40,1),

                                [children] = {
                                    UICorner(6)
                                }
                            },
                            new "Frame" {
                                Size = UDim2.new(1,0,0,0),
                                BackgroundTransparency = 1,
                                AutomaticSize = Enum.AutomaticSize.Y,

                                [children] = {
                                    new "TextLabel" {
                                        Size = UDim2.new(1,-40,0,18),
                                        BackgroundTransparency = 1,
                                        FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
                                        TextColor3 = theme.text,
                                        TextScaled = true,
                                        Text = name,
                                        TextXAlignment = Enum.TextXAlignment.Left,
								        RichText = true
                                    },
                                    new "Frame" {
                                        Size = UDim2.new(1,0,0,0),
                                        Position = UDim2.fromOffset(0,26),
                                        BackgroundTransparency = 1,
                                        AutomaticSize = Enum.AutomaticSize.Y,

                                        [children] = _children
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

    }

    local connection, onEnd = drag(module, 15)
    local connection2 = onEnd:Connect(function()
        down:set(false)
    end)
    connections.add(connection)
    connections.add(connection2)
    module.Destroying:Once(function()
        connection:Disconnect()
        connection2:Disconnect()
    end)
    return module, function(...)
        _children:set(...)
    end
end
end)() end,
    [74] = function()local wax,script,require=ImportGlobals(74)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
    local bundles = require(darius.Bundles)
    local theme = bundles.themeSystem
    local Fusion = bundles.Fusion
        local new = Fusion.New
        local onevent = Fusion.OnEvent
        local children = Fusion.Children
        local value = Fusion.Value
        local computed = Fusion.Computed

    local utilities = require(darius.utilities)
    local get = utilities.get
    local animate = utilities.animate
    local getStringBounds = utilities.getStringBounds
    local customFont = utilities.customFont
    local typecheck = utilities.typecheck

    local simpleElements = require(darius.simpleElements)
    local UICorner = simpleElements.UICorner
    local UIPadding = simpleElements.UIPadding
    local UIListLayout = simpleElements.UIListLayout
    local SO = Enum.SortOrder
    local FD = Enum.FillDirection
    local HA = Enum.HorizontalAlignment
    local VA = Enum.VerticalAlignment

    -- Typecheck

    local didPass, failedItems = typecheck(property, {
        Title = "",
        Body = "",
        Duration = 1,
        Image = "",
        ImageColor = Color3.fromRGB(0,0,0),
        Buttons = {}
    }, {
        property.Image and "" or "Image",
        property.ImageColor and "" or "ImageColor",
        property.Buttons and "" or "Buttons"
    })
    assert(didPass, table.concat(failedItems, "\n"))

    -- Properties

    local title = value(property.Title)
    local body = value(property.Body)
    local duration = value(property.Duration)
    local image = value(property.Image or "")
    local imageColor = property.ImageColor and value(property.ImageColor) or theme.text
    local buttons = value(property.Buttons or {})

    -- Variables

    local loaded = value(false)
    local resized = value(false)
    local tickText = value("")
    local width = value(250)
    local function roundTo(decimal, number)
        local point = 1
        for _=1,decimal do
            point = point*10
        end
        local stringed = tostring(math.round(number*point)/point)
        local tstringed = string.split(stringed, ".")
        if #tstringed == 1 then
            local zeros = ""
            for i=1,decimal do
                zeros = zeros.."0"
            end
            stringed = stringed.."."..zeros
        end
        return stringed
    end

    -- Instances
    local newNotification

    local buttonInstances = {}
    for _,buttonInfo in get(buttons) do
        local _didPass, _failedItems = typecheck({Button = buttonInfo}, {Button = {}})
        assert(_didPass, table.concat(_failedItems, "\n"))
        _didPass, _failedItems = typecheck(buttonInfo, {Name = "", Callback = function()end})
        assert(_didPass, table.concat(_failedItems, "\n"))

        local name = buttonInfo.Name
        local callback = buttonInfo.Callback
        local instance = new "TextButton" {
            Size = UDim2.new(1/#get(buttons), -2, 1, -4),
            TextSize = 14,
            Text = name,
            FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
            BackgroundColor3 = theme.notificationButton,
            TextColor3 = theme.text,

            [onevent "Activated"] = function()
                task.spawn(callback)
                resized:set(false)
                task.wait(0.4)
                loaded:set(false)
                task.wait(2)
                newNotification:Destroy()
            end,

            [children] = {
                UICorner(4)
            }
        }
        table.insert(buttonInstances, instance)
    end

    newNotification = new "Frame" {
        Parent = property.Parent,
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(get(width), 0),
        AutomaticSize = Enum.AutomaticSize.Y,

        [children] = {
            UIPadding(5,0,0,0),
            new "TextButton" {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1,1),

                [onevent "Activated"] = function()
                    resized:set(false)
                    task.wait(0.4)
                    loaded:set(false)
                    newNotification:Destroy()
                end
            },
            new "Frame" {
                Size = UDim2.fromScale(1,0),
                BackgroundColor3 = theme.background,
                AutomaticSize = Enum.AutomaticSize.Y,
                Position = animate(function()
                    return UDim2.fromScale(get(resized) and 0 or 1.2, 0)
                end,30,1),

                [children] = {
                    UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,4)),
                    UIPadding(0,4),
                    UICorner(4),
                    new "Frame" {
                        Visible = get(image) ~= "" and true or false,
                        Size = UDim2.new(0,24,1,0),
                        BackgroundTransparency = 1,

                        [children] = {
                            new "ImageLabel" {
                                Size = UDim2.fromOffset(24,24),
                                AnchorPoint = Vector2.new(0.5,0.5),
                                Position = UDim2.fromScale(0.5,0.5),
                                BackgroundTransparency = 1,
                                Image = image,
                                ImageColor3 = imageColor
                            }
                        }
                    },
                    new "Frame" {
                        Size = UDim2.new(1,get(image) ~= "" and -28 or 0,0,0),
                        BackgroundTransparency = 1,
                        AutomaticSize = Enum.AutomaticSize.Y,

                        [children] = {
                            UIPadding(2,0),
                            UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Left,VA.Top),
                            new "TextLabel" {
                                Size = UDim2.new(1,0,0,16),
                                BackgroundTransparency = 1,
                                FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextSize = 16,
                                RichText = true,

                                TextColor3 = theme.text,
                                Text = title
                            },
                            new "TextLabel" {
                                Size = UDim2.new(1,0,0,1),
                                AutomaticSize = Enum.AutomaticSize.Y,
                                Position = UDim2.fromOffset(8,25),
                                BackgroundTransparency = 1,
                                FontFace = customFont("Montserrat", Enum.FontWeight.Medium),
                                TextSize = 14,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextYAlignment = Enum.TextYAlignment.Top,
                                TextWrapped = true,
                                RichText = true,

                                TextColor3 = theme.text2,
                                Text = body
                            },
                            new "Frame" {
                                Visible = computed(function()
                                    return #get(buttons) > 0 and true or false
                                end),
                                Size = UDim2.new(1,0,0,26),
                                BackgroundTransparency = 1,

                                [children] = {
                                    UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Center,VA.Center,UDim.new(0,2)),
                                    buttonInstances
                                }
                            },
                            new "TextLabel" {
                                Size = UDim2.new(1,0,0,10),
                                FontFace = customFont("Montserrat", Enum.FontWeight.Medium),
                                Text = tickText,
                                TextColor3 = theme.text,
                                TextSize = 10,
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Right
                            }
                        }
                    }
                }

            }
        }
    }

    task.delay(0.4,function()
        resized:set(true)
    end)
    task.spawn(function()
        repeat task.wait() until get(resized)
        local startTick = tick()
        local endTick
        repeat
            endTick = tick() - startTick
            tickText:set(roundTo(1,math.clamp(endTick,0,get(duration))))
            task.wait()
        until endTick > get(duration)
    end)
    task.spawn(function()
        loaded:set(true)
        repeat task.wait() until get(resized)
        task.wait(get(duration))
        task.wait(0.2)
        resized:set(false)
        task.wait(0.4)
        loaded:set(false)
        task.wait(2)
        newNotification:Destroy()
    end)
end
end)() end,
    [75] = function()local wax,script,require=ImportGlobals(75)local ImportGlobals return (function(...)local darius = script.Parent.Parent

return function(property)
    local bundles = require(darius.Bundles)
    local data = bundles.data
    local theme = bundles.themeSystem
    local fusion = bundles.Fusion   
        local new = fusion.New
        local children = fusion.Children
        local value = fusion.Value
        local computed = fusion.Computed
        local observe = fusion.Observer

	local simpleElements = require(darius.simpleElements)
	local UICorner = simpleElements.UICorner
	local UIPadding = simpleElements.UIPadding
	local UITextSizeConstraint = simpleElements.UITextSizeConstraint

    local utilities = require(darius.utilities)
    local get = utilities.get
    local animate = utilities.animate
    local getStringBounds = utilities.getStringBounds
    local customFont = utilities.customFont
	local typecheck = utilities.typecheck

	-- Typecheck

	local didPass, failedItems = typecheck(property,{
		Title = "",
		Visible = false,
		Body = ""
	},{
		property.Visible and "" or "Visible",
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local searchText = data.find("searchText")
	local paragraph = data.add(property)

	-- Properties

	local _parent = property.Parent
	local title = property.Title
	local body = property.Body
	local visible = property.Visible or value(true)

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(paragraph.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(paragraph.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local ySize = value(0)
	task.spawn(function()
		ySize:set(getStringBounds(get(body),{
			Font = customFont("Montserrat", Enum.FontWeight.Medium),
			Size = 12,
			Width = math.round(get(_parent).AbsoluteSize.X)
		}).Y)
	end)
	get(_parent).Changed:Connect(function(changedProperty)
		if changedProperty:lower() == "absolutesize" then
			ySize:set(getStringBounds(get(body),{
				Font = customFont("Montserrat", Enum.FontWeight.Medium),
                Size = 12,
                Width = math.round(get(_parent).AbsoluteSize.X)
			}).Y)
		end
	end)
	observe(body):onChange(function()
		ySize:set(getStringBounds(get(body),{
			Font = customFont("Montserrat", Enum.FontWeight.Bold),
            Size = 12,
            Width = math.round(get(_parent).AbsoluteSize.X)
		}).Y)
	end)


	-- Paragraph

	new "Frame" {
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(title):lower(), get(searchText.string):lower()) and not string.find(get(body):lower(), get(searchText.string):lower()) or not get(visible) then
				return false
			end
			return true
		end),
		BackgroundColor3 = theme.background2,
		Parent = _parent,
		BackgroundTransparency = selectedAnimation,
		Size = computed(function()
			return UDim2.new(1,0,0,36 + get(ySize))
		end),
		AutomaticSize = Enum.AutomaticSize.Y,

		[children] = {
			UICorner(6),
			UIPadding(6),
			new "TextLabel" {
				Name = "Title",
				RichText = true,
				Size = UDim2.new(1,0,0,18),
				BackgroundTransparency = 1,
				TextTransparency = selectedAnimation,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextScaled = true,
				TextSize = 18,
                FontFace = customFont("Montserrat", Enum.FontWeight.Bold),

				TextColor3 = theme.text,
				Text = title,

				[children] = {
					UITextSizeConstraint(1,18)
				}
			},
			new "TextLabel" {
				Name = "Body",
				TextWrapped = true,
				RichText = true,
				Position = UDim2.fromOffset(4,20),
				BackgroundTransparency = 1,
				TextTransparency = selectedAnimation,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = 12,
				FontFace = customFont("Montserrat", Enum.FontWeight.Medium),

				TextColor3 = theme.text2,
				Text = body,
				Size = computed(function()
					return UDim2.new(1,-4,0,get(ySize))
				end)
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:SetBody(newBody)
		local _didPass, _failedItems = typecheck({['SetBody'] = newBody}, {SetBody = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		body:set(newBody)
	end
	function returnFunctions:SetTitle(newTitle)
		local _didPass, _failedItems = typecheck({['SetTitle'] = newTitle}, {SetTitle = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		title:set(newTitle)
	end
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [76] = function()local wax,script,require=ImportGlobals(76)local ImportGlobals return (function(...)local darius = script.Parent.Parent

return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local icons = Bundles.icons
	local flagCreator = Bundles.flags
	local services = Bundles.services
		local UserInputService = services.UserInputService
		local RunService = services.RunService
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
		IsEnabled = false,
		Visible = false,
		Callback = function()end,

        FLAG = "",
		Default = 0,
		Min = 0,
        Max = 0,
		DisplayAsPercent = false,
		DecimalPlace = 0,
		IgnoreConfig = true
	},{
		property.DisabledText and "" or "DisabledText",
		property.IsEnabled and "" or "IsEnabled",
		property.Visible and "" or "Visible",

		property.FLAG and "" or "FLAG",
		property.Default and "" or "Default",
		property.Min and "" or "Min",
		property.Max and "" or "Max",
		property.DisplayAsPercent and "" or "DisplayAsPercent",
		property.DecimalPlace and "" or "DecimalPlace",
		property.IgnoreConfig and "" or "IgnoreConfig"
	})
	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local useConfig = data.find("useConfig")
	local searchText = data.find("searchText")
	local slider = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local disabledText = property.DisabledText or value("Component Disabled")
	local isEnabled = property.IsEnabled or value(true)
	local visible = property.Visible or value(true)
	local callback = property.Callback

	local max = property.Max
	local min = property.Min
	local displayAsPercent = property.DisplayAsPercent or value(false)
	local roundTo = property.DecimalPlace or value(0)
	local ignoreConfig = property.IgnoreConfig or value(false)
	local default = get(property.Default) and value(math.clamp(get(property.Default), get(min), get(max)))
	if not get(default) then
		default = value(get(min))
	end

	local flag = (property.FLAG and get(property.FLAG) ~= "") and get(property.FLAG) or slider.uid
	local _flag = flagCreator.register(flag, {
		percentageOf = value(get(min))
	},"slider", flag == slider.uid)
	_flag.user.Value = get(_flag.status.percentageOf)

	-- Variables

	local isSelected = value(get(selectedTab.string) == get(slider.tab).uid)
	observe(selectedTab.string):onChange(function()
		isSelected:set(get(selectedTab.string) == get(slider.tab).uid)
	end)
	local selectedAnimation = animate(function()
		return get(isSelected) and 0 or 1
	end, 40, 1)
	local function mapValue(Value, MinA, MaxA, MinB, MaxB)
		return (1 - ((Value - MinA) / (MaxA - MinA))) * MinB + ((Value - MinA) / (MaxA - MinA)) * MaxB
	end
	local function round(Value)
		if get(roundTo) == 0 then
			return math.floor(Value)
		end
		return tonumber(string.format('%.' .. get(roundTo) .. 'f', Value))
	end
	local percentage = value(0)

	observe(_flag.status.percentageOf):onChange(function()
		local _percentageOf = get(_flag.status.percentageOf)
		if _percentageOf > get(max) or _percentageOf < get(min) then
			_flag.status.percentageOf:set(math.clamp(_percentageOf, get(min), get(max)))
			return
		end
		percentage:set(mapValue(get(_flag.status.percentageOf), get(min), get(max), 0, 1))
		if not get(isEnabled) then
			return
		end
		task.spawn(get(callback), get(_flag.status.percentageOf))
	end)
	local textbuttonRef = value()
	local textboxX = value(10)
	local textBoxRef = value()
	local button1Down = value(false)
	UserInputService.InputEnded:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and get(button1Down) then
			button1Down:set(false)
		end
	end)

	-- Slider

	new "Frame" {
		Parent = _parent,
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(visible) then
				return false
			end
			return true
		end),
		Size = UDim2.new(1,0,0,36),
		BackgroundColor3 = theme.background2,
		BackgroundTransparency = animate(function()
			if get(isSelected) then
				return 0
			end
			return 1
		end,40,1),

		[children] = {
			UICorner(6),
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
					UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,6)),
					UIPadding(0,8),
					new "TextLabel" {
						FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
						Size = UDim2.new(0.5,-6,0,18),
						BackgroundTransparency = 1,
						TextColor3 = theme.text,
						TextTransparency = selectedAnimation,
						TextScaled = true,
						AnchorPoint = Vector2.new(0,0.5),
						Position = UDim2.new(0,0,0.5,0),
						Text = name,
						TextXAlignment = Enum.TextXAlignment.Left,
						RichText = true
					},
					new "Frame" {
						Size = UDim2.new(0.5,0,1,0),
						AnchorPoint = Vector2.new(1,0.5),
						Position = UDim2.new(1,0,0.5,0),
						BackgroundTransparency = 1,

						[children] = {
							UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center, UDim.new(0,10)),
							new "Frame" {
								Size = UDim2.new(0.2,-5,1,0),
								BackgroundTransparency = 1,

								[children] = {
									UICorner(4),
									UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Right,VA.Center,UDim.new(0,1)),
									new "TextBox" {
										FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
										Size = UDim2.new(0,0,0,14),
										BackgroundTransparency = 1,
										TextColor3 = theme.text2,
										TextTransparency = selectedAnimation,
										TextScaled = true,
										ClearTextOnFocus = true,
										AnchorPoint = Vector2.new(1,0.5),
										Position = UDim2.new(1,0,0.5,0),
										Text = computed(function()
											if get(displayAsPercent) then
												return tostring(round(get(percentage) * 100)).."%"
											end
											return get(_flag.status.percentageOf) or ""
										end),
										TextXAlignment = Enum.TextXAlignment.Right,
										RichText = true,
										AutomaticSize = Enum.AutomaticSize.X,

										[onevent "Changed"] = function(changedProperty)
											local textbox = get(textBoxRef)
											if changedProperty == "AbsoluteSize" and textbox and textbox.AbsoluteSize then
												textboxX:set(textbox.AbsoluteSize.X)
											end
										end,

										[onevent "FocusLost"] = function()
											local textbox = get(textBoxRef)
											if tonumber(textbox.Text) then
												_flag.status.percentageOf:set(math.clamp(tonumber(textbox.Text), get(min), get(max)))
											else
												if get(displayAsPercent) then
													textbox.Text = tostring(round(get(percentage) * 100)).."%"
												end
												textbox.Text = get(_flag.status.percentageOf)
											end
										end,

										[ref] = textBoxRef,

										[children] = {
											UIPadding(0,5,0,5)
										}
									},
									new "Frame"{
										BackgroundColor3 = theme.text2,
										BackgroundTransparency = animate(function()
											if get(isSelected) then
												return 0.5
											end
											return 1
										end,40,1),
										Size = animate(function()
											return UDim2.fromOffset(get(textboxX),2)
										end,40,1),

										[children] = {
											UICorner(0,1)
										}
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
								Size = UDim2.new(0.8,-5,0.5,0),
								BackgroundTransparency = 1,

								[onevent "MouseButton1Down"] = function()
									button1Down:set(true)
								end,
								[onevent "TouchLongPress"] = function()
									button1Down:set(true)
								end,
								[onevent "InputBegan"] = function(input)
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and get(textbuttonRef) then
										local mPos = UserInputService:GetMouseLocation().X
										local gPos = get(textbuttonRef).Size.X.Offset
										local Diff = mPos - (get(textbuttonRef).AbsolutePosition.X + gPos)

										while get(button1Down) and task.wait() do
											local nMPos = UserInputService:GetMouseLocation().X
											local nX = math.clamp(gPos + (nMPos - mPos) + Diff, 0, get(textbuttonRef).AbsoluteSize.X)

											_flag.status.percentageOf:set(round(mapValue(nX, 0, get(textbuttonRef).AbsoluteSize.X, get(min), get(max))))
											RunService.RenderStepped:Wait()
										end
									end
								end,

								[ref] = textbuttonRef,

								[children] = {
									UIPadding(0,6),
									new "Frame" {
										AnchorPoint = Vector2.new(0,0.5),
										Position = UDim2.fromScale(0,0.5),
										Size = UDim2.new(1,0,0,4),
										BackgroundColor3 = theme.background,
										BackgroundTransparency = selectedAnimation,

										[children] = {
											UICorner(0,1)
										}
									},
									new "Frame" {
										AnchorPoint = Vector2.new(0,0.5),
										Position = UDim2.fromScale(0,0.5),
										BackgroundColor3 = theme.text,
										BackgroundTransparency = selectedAnimation,
										Size = animate(function()
											return UDim2.new(get(percentage),0,0,4)
										end,40,1),

										[children] = {
											UICorner(0,1),
											new "ImageLabel" {
												Image = icons.circle,
												BackgroundTransparency = 1,
												ImageColor3 = theme.selectedTab,
												ImageTransparency = selectedAnimation,
												Size = UDim2.fromOffset(18,18),
												Position = UDim2.new(1,0,0.5,0),
												AnchorPoint = Vector2.new(0.5,0.5),

												[children] = {
													new "Frame" {
														Position = UDim2.new(0.5,0,0.5,0),
														AnchorPoint = Vector2.new(0.5,0.5),
														Size = UDim2.fromOffset(2,8),
														BackgroundColor3 = theme.text,
														BackgroundTransparency = animate(function()
															if get(isSelected) then
																return 0.8
															end
															return 1
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
		}
	}

	-- Closure

	if get(useConfig.boolean) and not get(ignoreConfig) then
		_flag.file:Connect(function(file)
			local noPercentageOf = true
			if file ~= nil then
				_flag.status.percentageOf:set(math.clamp(file, get(min), get(max)))
				noPercentageOf = false
			end
			if noPercentageOf then
				_flag.status.percentageOf:set(get(default))
			end
		end)
		if _flag.private then
			_flag.status.percentageOf:set(get(default))
		end
	else
		_flag.status.percentageOf:set(get(default))
	end
	if _flag.preregistered and _flag.preregisteredValue and typeof(_flag.preregisteredValue) == "number" then
		_flag.status.percentageOf:set(math.clamp(_flag.preregisteredValue, get(min), get(max)))
	end

	local returnFunctions = {}
	function returnFunctions:SetName(newText)
		local _didPass, _failedItems = typecheck({['SetName'] = newText}, {SetName = ""})
		assert(_didPass, table.concat(_failedItems, "\n"))

		name:set(newText)
	end
	function returnFunctions:SetValue(newValue)
		local _didPass, _failedItems = typecheck({['SetValue'] = newValue}, {SetValue = 0})
		assert(_didPass, table.concat(_failedItems, "\n"))

		_flag.status.percentageOf:set(math.clamp(newValue, get(min), get(max)))
	end
	function returnFunctions:Enable()
		isEnabled:set(true)
	end
	function returnFunctions:Disable()
		isEnabled:set(false)
	end
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [77] = function()local wax,script,require=ImportGlobals(77)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
	local Bundles = require(darius.Bundles)
	local data = Bundles.data
	local theme = Bundles.themeSystem
	local Fusion = Bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
		local value = Fusion.Value
		local observe = Fusion.Observer
		local onevent = Fusion.OnEvent

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

	local didPass, failedItems = typecheck(property, {
		Name = "",
		Image = ""
	},{
		property.Image and "" or "Image"
	})

	assert(didPass, table.concat(failedItems, "\n"))

	-- Data

	local selectedTab = data.find("selectedTab")
	local isFirst = data.find("isFirst")
	local tab = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local image, hasImage = nil, value(false)
	if property.Image then
		image = property.Image
		hasImage:set(true)
	end

	-- Variables

	local isSelected = value(false)
	observe(selectedTab.string):onChange(function()
		local _selectedTab = get(selectedTab.string)
		isSelected:set(_selectedTab == tab.uid)
	end)

	-- Instance

	new "TextButton" {
		Name = tab.uid,
		Parent = _parent,
		Size = UDim2.new(1,0,0,36),
		BackgroundColor3 = animate(function()
			return get(isSelected) and theme.get("selectedTab") or theme.get("background2")
		end,40,1),

		[onevent "Activated"] = function()
			selectedTab:update("string", tab.uid)
		end,

		[children] = {
			UICorner(4),
			UIPadding(6),
			UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,4)),
			new "ImageLabel" {
				Visible = hasImage,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(24,24),
				ImageColor3 = theme.text2,
				Image = image,
				ImageTransparency = animate(function()
					return get(isSelected) and 0 or 0.6
				end,40,1)
			},
			new "TextLabel" {
				Size = get(hasImage) and UDim2.new(1,-28,1) or UDim2.fromScale(1,1),
				FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
				TextColor3 = theme.text2,
				TextScaled = true,
				Text = name,
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTransparency = animate(function()
					return get(isSelected) and 0 or 0.6
				end,40,1),

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 16
					}
				}
			}
		}
	}
	if not get(isFirst.boolean) then
		isFirst:update("boolean", true)
		selectedTab:update("string", tab.uid)
	end
	return tab
end
end)() end,
    [78] = function()local wax,script,require=ImportGlobals(78)local ImportGlobals return (function(...)local darius = script.Parent.Parent
return function(property)
    local Bundles = require(darius.Bundles)
    local data = Bundles.data
	local Fusion = Bundles.Fusion
		local new = Fusion.New
		local children = Fusion.Children
        local computed = Fusion.Computed

	local simpleElements = require(darius.simpleElements)
	local UIListLayout = simpleElements.UIListLayout
	local SO = Enum.SortOrder
	local FD = Enum.FillDirection
	local HA = Enum.HorizontalAlignment
	local VA = Enum.VerticalAlignment
    
    local get = require(darius.utilities).get

    local selectedTab = data.find("selectedTab")
    
    return new "ScrollingFrame" {
        ZIndex = computed(function()
            return (get(selectedTab.string) == property.uid) and 1 or 0
        end),
        Name = property.uid,
		Parent = property.Parent,
        Size = UDim2.new(1,0,1,0),
        BackgroundTransparency = 1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        CanvasSize = UDim2.new(1,0,1,0),

        [children] = {
            UIListLayout(SO.LayoutOrder, FD.Vertical,HA.Center,VA.Top,UDim.new(0,4)),
        }
    }
end
end)() end,
    [79] = function()local wax,script,require=ImportGlobals(79)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
		DisabledText = "",
		IsEnabled = false,
		Visible = false,
		Callback = function()end,

		FLAG = "",
        PlaceHolderText = "",
        ClearTextOnFocus = false,
        OnlyNumbers = true,
        OnLeave = true,
        Default = "",
		IgnoreConfig = true
	},{
		property.DisabledText and "" or "DisabledText",
		property.IsEnabled and "" or "IsEnabled",
		property.Visible and "" or "Visible",

		property.PlaceHolderText and "" or "PlaceHolderText",
		property.ClearTextOnFocus and "" or "ClearTextOnFocus",
		property.OnlyNumbers and "" or "OnlyNumbers",
		property.OnLeave and "" or "OnLeave",
		property.Default and "" or "Default",
		property.FLAG and "" or "FLAG",
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
	local disabledText = property.DisabledText or value("Component Disabled")
	local isEnabled = property.IsEnabled or value(true)
	local visible = property.Visible or value(true)
	local callback = property.Callback

	local onlyNumbers = property.OnlyNumbers or value(false)
	local default = property.Default or value("")
	local onLeave = property.OnLeave or value(false)
	local clearTextOnFocus = property.ClearTextOnFocus or value(false)
	local ignoreConfig = property.IgnoreConfig or value(false)
	local placeHolder = property.PlaceHolderText or value("")

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
	local titleTextLabel = value()
	local titleX = value(0)

	-- TextBox

	new "Frame" {
		Parent = _parent,
		Visible = computed(function()
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(visible) then
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
					new "TextLabel" {
						Size = UDim2.fromScale(0,1),
						BackgroundColor3 = theme.background2,
						BackgroundTransparency = selectedAnimation,
						TextSize = 18,
						Text = name,
						AutomaticSize = Enum.AutomaticSize.X,
						TextTransparency = selectedAnimation,
						TextXAlignment = Enum.TextXAlignment.Left,
						RichText = true,
						TextColor3 = theme.text,
						FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
						[onevent "Changed"] = function(changedProperty)
							if changedProperty == "AbsoluteSize" and get(titleTextLabel) ~= nil then
								titleX:set(get(titleTextLabel).AbsoluteSize.X)
							end
						end,

						[ref] = titleTextLabel,

						[children] = {
							UICorner(6),
							UIPadding(0,6),
							--[[
							new "TextLabel" {
								
								Size = UDim2.new(0,0,0,18),
								BackgroundTransparency = 1,
								
								--TextScaled = true,
								

								

								[children] = {}
							}
								]]
						}
					},
					new "TextButton" {
						Interactable = computed(function()
							if not get(isEnabled) then
								return false
							end
							return get(isSelected)
						end),
						Size = computed(function()
							if get(titleTextLabel) then
								return UDim2.new(1,-get(titleX) - 3,1)
							end
							return UDim2.fromScale(0.35,1)
						end),
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
		_flag.file:Connect(function(file)
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
	if _flag.preregistered and _flag.preregisteredValue then
		didPass, failedItems = typecheck({FlagValue = _flag.preregisteredValue},{FlagValue = ""})
		if didPass then
			if get(onLeave) then
				focused:set(true)
			end
			correctText:set(_flag.preregisteredValue)
			if get(onLeave) then
				focused:set(false)
			end
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
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [80] = function()local wax,script,require=ImportGlobals(80)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
		IsEnabled = false,
		Visible = false,
        Callback = function()end,

        FLAG = "",
		Default = false,
		LinkKeybind = true,
		IgnoreConfig = true,
	},{
		property.DisabledText and "" or "DisabledText",
		property.IsEnabled and "" or "IsEnabled",
		property.Visible and "" or "Visible",

		property.FLAG and "" or "FLAG",
		property.Default and "" or "Default",
		property.LinkKeybind and "" or "LinkKeybind",
		property.IgnoreConfig and "" or "IgnoreConfig",
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
	local absoluteOffset = data.find("absoluteOffset").number
	local toggle = data.add(property)

	-- Properties

	local _parent = property.Parent
	local name = property.Name
	local disabledText = property.DisabledText or value("Component Disabled")
	local isEnabled = property.IsEnabled or value(true)
	local visible = property.Visible or value(true)
	local callback = property.Callback

	local default = property.Default or value(false)
	local bind = property.Bind
	local ignoreConfig = property.IgnoreConfig or value(false)
	local linkKeybind = property.LinkKeybind or value(false)

	local flag = property.FLAG or value(toggle.uid)
	local _flag
	if get(flag) ~= "" then
		_flag = flagCreator.register(get(flag), {
			boolean = value(false),
			keycode = value(nil),
			coordinate = value(nil)
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
			_flag.status.keycode:set(get(keyCode).Name)
		end
	end
	observe(_flag.status.boolean):onChange(function()
		if get(isEnabled) then
			task.spawn(get(callback), get(_flag.status.boolean))
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
				_flag.status.coordinate:set(mobileButton.AbsolutePosition)
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
			if get(searchText.string) ~= "" and not string.find(get(name):lower(), get(searchText.string):lower()) or not get(visible) then
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
							_flag.status.coordinate:set(nil)
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
		_flag.file:Connect(function(file)
			local noBoolean = true
			local noKeyCode = true
			if file.boolean ~= nil then
				_flag.status.boolean:set(file.boolean)
				noBoolean = false
			end
			if file.keycode ~= nil and ((get(keyCode) and get(keyCode).Name or  "") ~= file.keycode) then
				local success, result = pcall(function()
					return Enum.KeyCode[file.keycode]
				end)
				if success then
					checkKeyCode(result, "File1")
				end
				noKeyCode = false
			end
			if noBoolean then
				_flag.status.boolean:set(get(default))
			end
			if noKeyCode then
				if bind then
					checkKeyCode(get(bind), "NoFileFound")
				end
			end
			if get(isMobile.boolean) and file.coordinate then
				mobileButton.Position = UDim2.fromOffset(file.coordinate.X + 30,file.coordinate.Y + 30 + get(absoluteOffset))
				hasPlaced:set(true)
				_flag.status.coordinate:set(file.coordinate)
			elseif get(isMobile.boolean) and not file.coordinate then
				hasPlaced:set(false)
				mobileButton.Position = UDim2.fromScale(0.5,0.5)
			end
		end)

		if _flag.private then
			_flag.status.boolean:set(get(default))
			if bind then
				checkKeyCode(get(bind), "Private")
			end
		end
	else
		_flag.status.boolean:set(get(default))
		if bind then
			checkKeyCode(get(bind), "IgnoreConfig/UseConfig:false")
		end
	end
	if _flag.preregistered and _flag.preregisteredValue and typeof(_flag.preregisteredValue) == "table" then
		if _flag.preregisteredValue.boolean and typeof(_flag.preregisteredValue.boolean) == "boolean" then
			_flag.status.boolean:set(_flag.preregisteredValue.boolean)
		end
		if get(linkKeybind) then
			if not get(isMobile.boolean) then
				if _flag.preregisteredValue.keycode and typeof(_flag.preregisteredValue.keycode) == "string" then
					local success, result = pcall(function()
						return Enum.KeyCode[_flag.preregisteredValue.keycode]
					end)
					if success then
						checkKeyCode(result, "Configuration1")
					end
				end
			else
				if _flag.preregisteredValue.coordinate and typeof(_flag.preregisteredValue.coordinate) == "table" and _flag.preregisteredValue.coordinate.X and _flag.preregisteredValue.coordinate.Y then
					if typeof(_flag.preregisteredValue.coordinate.X) == "number" and typeof(_flag.preregisteredValue.coordinate.Y) == "number" then
						mobileButton.Position = UDim2.fromOffset(_flag.preregisteredValue.coordinate.X + 30,_flag.preregisteredValue.coordinate.Y + 30 + get(absoluteOffset))
						hasPlaced:set(true)
						_flag.status.coordinate:set(_flag.preregisteredValue.coordinate)
					end
				end
			end
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
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [81] = function()local wax,script,require=ImportGlobals(81)local ImportGlobals return (function(...)local darius = script.Parent.Parent
local title = ""

local returnTable = {}
table.insert(returnTable, function(body)
    local bundles = require(darius.Bundles)
    local notificaton = require(script.Parent.notification)
    local references = require(darius.utilities).references
    local icons = bundles.icons
    local theme = bundles.themeSystem
    notificaton({
        Parent = references.get("notificationList"),
        Title = title,
        Body = body,
        Duration = 3,
        Image = icons.alert,
        ImageColor = theme.get("red")
    })
end)
table.insert(returnTable, function(newTitle)
    title = newTitle
end)

return returnTable
end)() end,
    [83] = function()local wax,script,require=ImportGlobals(83)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
		local centerPosition = _container.AbsolutePosition + Vector2.new(get(x)/2,get(y)/2)
		local screenSize = inst.screenSize.AbsoluteSize
		local xCap = screenSize.X + (get(isCollapsed) and get(x)/4 or (get(x)/6)*2.5)
		local yCap = screenSize.Y + (get(isCollapsed) and get(y)/8 or (get(y)/6)*2.3)
		local hasProblem = false
		local _type = ""
		if centerPosition.X > xCap or  screenSize.X - centerPosition.X > xCap then
			hasProblem = true
			_type = "x"
		end
		if centerPosition.Y + get(absoluteOffset.number) > yCap or screenSize.Y - centerPosition.Y - get(absoluteOffset.number) > yCap then
			hasProblem = true
			_type = "y"
		end
		if hasProblem and _type == "x" then
			_currentDrag:Disconnect()
			_container.Position = UDim2.new(0.5,0,_container.Position.Y.Scale,_container.Position.Y.Offset)
			_currentDrag = drag(references.get("container"), 15)
		elseif hasProblem and _type == "y" then
			_currentDrag:Disconnect()
			_container.Position = UDim2.new(_container.Position.X.Scale,_container.Position.X.Offset,0.5,get(absoluteOffset.number))
			_currentDrag = drag(references.get("container"), 15)
		end
	end))
end
end)() end,
    [84] = function()local wax,script,require=ImportGlobals(84)local ImportGlobals return (function(...)return setmetatable({},{
    __index = function(self, key)
        if script:FindFirstChild(key) then
            return require(script[key])
        else
            error("no utility: "..key)
        end
    end
})
end)() end,
    [85] = function()local wax,script,require=ImportGlobals(85)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles).Fusion

return function(AspectRatio:number, AspectType:Enum.AspectType, DominantAxis:Enum.DominantAxis)
    AspectType = AspectType or Enum.AspectType.FitWithinMaxSize
    DominantAxis = DominantAxis or Enum.DominantAxis.Height
    return Fusion.New "UIAspectRatioConstraint" {
        AspectRatio = AspectRatio,
        AspectType = AspectType,
        DominantAxis = DominantAxis
    }
end
end)() end,
    [86] = function()local wax,script,require=ImportGlobals(86)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles).Fusion

return function(offset, scale)
    scale = scale or 0
    return Fusion.New "UICorner" {
        CornerRadius = UDim.new(scale, offset)
    }
end
end)() end,
    [87] = function()local wax,script,require=ImportGlobals(87)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles).Fusion

return function(SortOrder, FillDirection,HorizontalAlignment,VerticalAlignment,Padding)
    return Fusion.New "UIListLayout" {
        SortOrder = SortOrder or Enum.SortOrder.LayoutOrder,
        FillDirection = FillDirection or Enum.FillDirection.Vertical,
        HorizontalAlignment = HorizontalAlignment or Enum.HorizontalAlignment.Center,
        VerticalAlignment = VerticalAlignment or Enum.VerticalAlignment.Center,
        Padding = Padding or UDim.new(0,0)
    }
end
end)() end,
    [88] = function()local wax,script,require=ImportGlobals(88)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles).Fusion

return function(...)
    local args = {...}
    if #args == 1 then
        return Fusion.New "UIPadding" {
            PaddingTop = typeof(...) == "number" and UDim.new(0,...) or ...,
            PaddingRight = typeof(...) == "number" and UDim.new(0,...) or ...,
            PaddingBottom = typeof(...) == "number" and UDim.new(0,...) or ...,
            PaddingLeft = typeof(...) == "number" and UDim.new(0,...) or ...
        }
    elseif #args == 2 then
        return Fusion.New "UIPadding" {
            PaddingTop = typeof(args[1]) == "number" and UDim.new(0,args[1]) or args[1],
            PaddingRight = typeof(args[2]) == "number" and UDim.new(0,args[2]) or args[2],
            PaddingBottom = typeof(args[1]) == "number" and UDim.new(0,args[1]) or args[1],
            PaddingLeft = typeof(args[2]) == "number" and UDim.new(0,args[2]) or args[2]
        }
    elseif #args == 3 then
        return Fusion.New "UIPadding" {
            PaddingTop = typeof(args[1]) == "number" and UDim.new(0,args[1]) or args[1],
            PaddingRight = typeof(args[2]) == "number" and UDim.new(0,args[2]) or args[2],
            PaddingBottom = typeof(args[3]) == "number" and UDim.new(0,args[3]) or args[3],
            PaddingLeft = typeof(args[2]) == "number" and UDim.new(0,args[2]) or args[2]
        }
    else
        return Fusion.New "UIPadding" {
            PaddingTop = typeof(args[1]) == "number" and UDim.new(0,args[1]) or args[1],
            PaddingRight = typeof(args[2]) == "number" and UDim.new(0,args[2]) or args[2],
            PaddingBottom = typeof(args[3]) == "number" and UDim.new(0,args[3]) or args[3],
            PaddingLeft = typeof(args[4]) == "number" and UDim.new(0,args[4]) or args[4]
        }
    end
end
end)() end,
    [89] = function()local wax,script,require=ImportGlobals(89)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles).Fusion

return function(MinText:number?, MaxText:number?)
    return Fusion.New "UITextSizeConstraint" {
        MinTextSize = MinText,
        MaxTextSize = MaxText,
    }
end
end)() end,
    [90] = function()local wax,script,require=ImportGlobals(90)local ImportGlobals return (function(...)return setmetatable({},{
    __index = function(self, key)
        if script:FindFirstChild(key) then
            return require(script[key])
        else
            error("no utility: "..key)
        end
    end
})
end)() end,
    [91] = function()local wax,script,require=ImportGlobals(91)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles).Fusion
local computed,spring = Fusion.Computed,Fusion.Spring

return function(callback, speed, damping)
	return spring(computed(callback), speed, damping)
end
end)() end,
    [92] = function()local wax,script,require=ImportGlobals(92)local ImportGlobals return (function(...)local connections = {}
local connectionsFunction = {}

local services = require(script.Parent.Parent.Bundles.services)

function connectionsFunction.add(connection)
    table.insert(connections, connection)
end
function connectionsFunction.deleteConnections()
    for i,v in connections do
        if typeof(v) == "function" then
            v()
        else
            v:Disconnect()
        end
        connections[i] = nil
    end
end

return connectionsFunction
end)() end,
    [93] = function()local wax,script,require=ImportGlobals(93)local ImportGlobals return (function(...)local fonts = {
    ["Inter"] = "rbxassetid://12187365364",
    ["Montserrat"] = "rbxassetid://11702779517"
}

return function(font:string, weight:Enum.FontWeight?, style:Enum.FontStyle?)
    assert(font, "font required")
    weight = weight or Enum.FontWeight.Regular
    style = style or Enum.FontStyle.Normal
    if fonts[font] then
        return Font.new(fonts[font],weight,style)
    else
        error("no font:", font)
    end
end
end)() end,
    [94] = function()local wax,script,require=ImportGlobals(94)local ImportGlobals return (function(...)---@diagnostic disable: undefined-global
local functions = {}

local filesystem = {}

function functions.cloneref(service)
    if cloneref then
        return cloneref(service)
    else
        return service
    end
end

function functions.printFileSystem()
    print(filesystem)
end

function functions.gethui(...)
    return gethui(...) or nil
end

functions.getgenv = getgenv or nil

function functions.isfile(string:string)
    if isfile then
        return isfile(string)
    else
        local currentPath = filesystem
        local isNil = false
        if string:find("/") then
            for _,v in string:split("/") do
                currentPath = currentPath[v]
                if currentPath == nil then
                    isNil = true
                    break
                end
            end
        else
            currentPath = currentPath[string]
            if currentPath == nil then
                isNil = true
            end
        end
        if isNil then
            return false
        end
        return true
    end
end
function functions.isfolder(string:string)
    if isfolder then
        return isfolder(string)
    else
        local currentPath = filesystem
        local isNil = false
        if string:find("/") then
            for _,v in string:split("/") do
                currentPath = currentPath[v]
                if currentPath == nil then
                    isNil = true
                    break
                end
            end
        else
            currentPath = currentPath[string]
            if currentPath == nil then
                isNil = true
            end
        end
        if isNil then
            return false
        end
        return true
    end
end
function functions.writefile(string:string, content:string)
    if writefile then
        return writefile(string, content)
    else
        local currentPath = filesystem
        for _,v in string:split("/") do
            if typeof(currentPath[v]) == "table" then
                currentPath = currentPath[v]
            elseif (typeof(currentPath[v]) == "string" or typeof(currentPath[v]) == "nil")then
                currentPath[v] = content
            end
        end
    end
end
function functions.delfile(string:string)
    if delfile then
        return delfile(string)
    else
        local currentPath = filesystem
        local oldestCorrect = currentPath
        local splitString = string:split("/")
        for _,v in splitString do
            currentPath = currentPath[v]
            if typeof(currentPath) == "string" then
                oldestCorrect[v] = nil
            else
                oldestCorrect = currentPath
            end
        end
    end
end
function functions.readfile(string:string)
    if readfile then
        return readfile(string)
    else
        local currentPath = filesystem
        local isNil = false
        if string:find("/") then
            for _,v in string:split("/") do
                currentPath = currentPath[v]
                if currentPath == nil then
                    isNil = true
                    break
                end
            end
        else
            currentPath = currentPath[string]
        end
        if isNil then
            warn("readfile: no file")
            return nil
        end
        return currentPath
    end
end
function functions.makefolder(string:string)
    if makefolder then
        return makefolder(string)
    else
        local currentPath = filesystem
        if string:find("/") then
            for _,v in string:split("/") do
                if not currentPath[v] then
                    currentPath[v] = {}
                    break
                else
                    currentPath = currentPath[v]
                end
            end
        else
            currentPath[string] = {}
        end
    end
end
function functions.listfiles(string:string)
    if listfiles then
        return listfiles(string)
    else
        local currentPath = filesystem
        local isNil = false
        if string:find("/") then
            for _,v in string:split("/") do
                currentPath = currentPath[v]
                if currentPath == nil then
                    isNil = true
                    break
                end
            end
        else
            currentPath = currentPath[string]
        end
        if isNil or typeof(currentPath) == "string" then
            warn("no folder exists")
            return nil
        end
        local cleaned = {}
        for i,v in currentPath do
            if typeof(v) == "string" then
                table.insert(cleaned, `{string}/{i}`)
            end
        end
        return cleaned
    end
end
function functions.getthreadidentity()
    if getthreadidentity then
        return getthreadidentity()
    else
        return 5
    end
end
function functions.setthreadidentity(number:number)
    if setthreadidentity then
        return setthreadidentity(number)
    else
        return 5
    end
end
return functions
end)() end,
    [95] = function()local wax,script,require=ImportGlobals(95)local ImportGlobals return (function(...)return function(o,s)
	local services = require(script.Parent.Parent.Bundles.services)
	local DRAG_SPEED = s or 10
	local UserInputService = services.UserInputService
	local runService = services.RunService
	local gui = o
	local dragging, lastMousePos, lastGoalPos, startPos
	local function Lerp(a, b, m)
		return a + (b - a) * m
	end

	local onEnd = Instance.new("BindableEvent")

	local function Update(dt)
		if not (startPos) then return end;

		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return
		end

		local delta = (lastMousePos - UserInputService:GetMouseLocation())

		local xGoal = (startPos.X.Offset - delta.X)
		local yGoal = (startPos.Y.Offset - delta.Y)

		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)

		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					onEnd:Fire()
					dragging = false
				end
			end)
		end
	end)
	local connection = runService.Heartbeat:Connect(Update)
	return connection, onEnd.Event
end

end)() end,
    [96] = function()local wax,script,require=ImportGlobals(96)local ImportGlobals return (function(...)return function(value, dependency)
	if typeof(value) == "table" and value.type == "State" then
		return value:get(dependency)
	end
	return value
end
end)() end,
    [97] = function()local wax,script,require=ImportGlobals(97)local ImportGlobals return (function(...)return function(text:string, properties)
    text = text or ""
    local params = Instance.new("GetTextBoundsParams")
    params.Text = text
    params.Font = properties.Font
    params.Size = properties.Size
    params.Width = properties.Width
    local TextService = require(script.Parent.Parent.Bundles.services).TextService
    return TextService:GetTextBoundsAsync(params)
end
end)() end,
    [98] = function()local wax,script,require=ImportGlobals(98)local ImportGlobals return (function(...)local characters = string.split("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890","")
local function randomString(length)
    if length > 0 then
        return randomString(length - 1) .. characters[math.random(1, #characters)]
    else
        return ""
    end
end
return randomString
end)() end,
    [99] = function()local wax,script,require=ImportGlobals(99)local ImportGlobals return (function(...)local references = {}
local returnFunctions = {}
local observe = require(script.Parent.Parent.Bundles).Fusion.Observer

local get = require(script.Parent.get)

function returnFunctions.add(...)
    for _,REF in {...} do
        if typeof(get(REF)) ~= "Instance" then
            observe(REF):onChange(function()
                if typeof(get(REF)) == "Instance" then
                    if not references[get(REF).Name] then
                        references[get(REF).Name] = get(REF)
                    else
                        warn(get(REF).Name, " REF was already added")
                    end
                end
            end)
        else
            if not references[get(REF).Name] then
                references[get(REF).Name] = get(REF)
            else
                warn(get(REF).Name, " REF was already added")
            end
        end
    end
end
function returnFunctions.get(name)
    if references[name] then
        return references[name]
    end
end
function returnFunctions.remove(name)
    if references[name] then
        references[name] = nil
    else
        warn(name, "isn't in the references list")
    end
end
function returnFunctions.clear()
    for i,v in references do
        references[i] = nil
        if typeof(v) == "Instance" then
            v:Destroy()
        end
    end
end

return returnFunctions
end)() end,
    [100] = function()local wax,script,require=ImportGlobals(100)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)
local computed = Fusion.Computed

return function(callback,style)
	return Fusion.Tween(computed(callback), style)
end
end)() end,
    [101] = function()local wax,script,require=ImportGlobals(101)local ImportGlobals return (function(...)return function(variables:table, correctVariables:table, ignoreList:table?):any
    ignoreList = ignoreList or {}
    local didPass = true
    local itemsThatFailed = {}
    for key, correctType in correctVariables do
        if (variables[key] == nil or typeof(variables[key]) ~= typeof(correctType)) and not table.find(ignoreList, key) then
            didPass = false
            table.insert(itemsThatFailed,`{key} expected: {typeof(correctType)} got: {typeof(variables[key])}`)
        end
    end
    return didPass, itemsThatFailed
end
end)() end
} -- [RefId] = Closure

-- Holds the actual DOM data
local ObjectTree = {
    {
        1,
        2,
        {
            "Darius"
        },
        {
            {
                2,
                2,
                {
                    "Bundles"
                },
                {
                    {
                        59,
                        2,
                        {
                            "icons"
                        }
                    },
                    {
                        58,
                        2,
                        {
                            "flags"
                        }
                    },
                    {
                        57,
                        2,
                        {
                            "data"
                        }
                    },
                    {
                        60,
                        2,
                        {
                            "lucide"
                        }
                    },
                    {
                        62,
                        2,
                        {
                            "themeSystem"
                        },
                        {
                            {
                                63,
                                2,
                                {
                                    "default"
                                }
                            }
                        }
                    },
                    {
                        3,
                        2,
                        {
                            "Fusion"
                        },
                        {
                            {
                                16,
                                1,
                                {
                                    "Dependencies"
                                },
                                {
                                    {
                                        17,
                                        2,
                                        {
                                            "captureDependencies"
                                        }
                                    },
                                    {
                                        19,
                                        2,
                                        {
                                            "sharedState"
                                        }
                                    },
                                    {
                                        21,
                                        2,
                                        {
                                            "useDependency"
                                        }
                                    },
                                    {
                                        20,
                                        2,
                                        {
                                            "updateAll"
                                        }
                                    },
                                    {
                                        18,
                                        2,
                                        {
                                            "initDependency"
                                        }
                                    }
                                }
                            },
                            {
                                33,
                                1,
                                {
                                    "Logging"
                                },
                                {
                                    {
                                        35,
                                        2,
                                        {
                                            "logErrorNonFatal"
                                        }
                                    },
                                    {
                                        34,
                                        2,
                                        {
                                            "logError"
                                        }
                                    },
                                    {
                                        37,
                                        2,
                                        {
                                            "messages"
                                        }
                                    },
                                    {
                                        38,
                                        2,
                                        {
                                            "parseError"
                                        }
                                    },
                                    {
                                        36,
                                        2,
                                        {
                                            "logWarn"
                                        }
                                    }
                                }
                            },
                            {
                                14,
                                1,
                                {
                                    "Colour"
                                },
                                {
                                    {
                                        15,
                                        2,
                                        {
                                            "Oklab"
                                        }
                                    }
                                }
                            },
                            {
                                49,
                                1,
                                {
                                    "Utility"
                                },
                                {
                                    {
                                        55,
                                        2,
                                        {
                                            "restrictRead"
                                        }
                                    },
                                    {
                                        50,
                                        2,
                                        {
                                            "None"
                                        }
                                    },
                                    {
                                        54,
                                        2,
                                        {
                                            "needsDestruction"
                                        }
                                    },
                                    {
                                        52,
                                        2,
                                        {
                                            "doNothing"
                                        }
                                    },
                                    {
                                        51,
                                        2,
                                        {
                                            "cleanup"
                                        }
                                    },
                                    {
                                        56,
                                        2,
                                        {
                                            "xtypeof"
                                        }
                                    },
                                    {
                                        53,
                                        2,
                                        {
                                            "isSimilar"
                                        }
                                    }
                                }
                            },
                            {
                                40,
                                1,
                                {
                                    "State"
                                },
                                {
                                    {
                                        42,
                                        2,
                                        {
                                            "ForKeys"
                                        }
                                    },
                                    {
                                        41,
                                        2,
                                        {
                                            "Computed"
                                        }
                                    },
                                    {
                                        47,
                                        2,
                                        {
                                            "unwrap"
                                        }
                                    },
                                    {
                                        43,
                                        2,
                                        {
                                            "ForPairs"
                                        }
                                    },
                                    {
                                        44,
                                        2,
                                        {
                                            "ForValues"
                                        }
                                    },
                                    {
                                        45,
                                        2,
                                        {
                                            "Observer"
                                        }
                                    },
                                    {
                                        46,
                                        2,
                                        {
                                            "Value"
                                        }
                                    }
                                }
                            },
                            {
                                22,
                                1,
                                {
                                    "Instances"
                                },
                                {
                                    {
                                        23,
                                        2,
                                        {
                                            "Children"
                                        }
                                    },
                                    {
                                        27,
                                        2,
                                        {
                                            "OnChange"
                                        }
                                    },
                                    {
                                        25,
                                        2,
                                        {
                                            "Hydrate"
                                        }
                                    },
                                    {
                                        30,
                                        2,
                                        {
                                            "Ref"
                                        }
                                    },
                                    {
                                        28,
                                        2,
                                        {
                                            "OnEvent"
                                        }
                                    },
                                    {
                                        24,
                                        2,
                                        {
                                            "Cleanup"
                                        }
                                    },
                                    {
                                        32,
                                        2,
                                        {
                                            "defaultProps"
                                        }
                                    },
                                    {
                                        26,
                                        2,
                                        {
                                            "New"
                                        }
                                    },
                                    {
                                        29,
                                        2,
                                        {
                                            "Out"
                                        }
                                    },
                                    {
                                        31,
                                        2,
                                        {
                                            "applyInstanceProps"
                                        }
                                    }
                                }
                            },
                            {
                                48,
                                2,
                                {
                                    "Types"
                                }
                            },
                            {
                                39,
                                2,
                                {
                                    "PubTypes"
                                }
                            },
                            {
                                4,
                                1,
                                {
                                    "Animation"
                                },
                                {
                                    {
                                        5,
                                        2,
                                        {
                                            "Spring"
                                        }
                                    },
                                    {
                                        11,
                                        2,
                                        {
                                            "packType"
                                        }
                                    },
                                    {
                                        8,
                                        2,
                                        {
                                            "TweenScheduler"
                                        }
                                    },
                                    {
                                        13,
                                        2,
                                        {
                                            "unpackType"
                                        }
                                    },
                                    {
                                        12,
                                        2,
                                        {
                                            "springCoefficients"
                                        }
                                    },
                                    {
                                        6,
                                        2,
                                        {
                                            "SpringScheduler"
                                        }
                                    },
                                    {
                                        10,
                                        2,
                                        {
                                            "lerpType"
                                        }
                                    },
                                    {
                                        9,
                                        2,
                                        {
                                            "getTweenRatio"
                                        }
                                    },
                                    {
                                        7,
                                        2,
                                        {
                                            "Tween"
                                        }
                                    }
                                }
                            }
                        }
                    },
                    {
                        61,
                        2,
                        {
                            "services"
                        }
                    }
                }
            },
            {
                84,
                2,
                {
                    "simpleElements"
                },
                {
                    {
                        85,
                        2,
                        {
                            "UIAspectRatioConstraint"
                        }
                    },
                    {
                        86,
                        2,
                        {
                            "UICorner"
                        }
                    },
                    {
                        87,
                        2,
                        {
                            "UIListLayout"
                        }
                    },
                    {
                        88,
                        2,
                        {
                            "UIPadding"
                        }
                    },
                    {
                        89,
                        2,
                        {
                            "UITextSizeConstraint"
                        }
                    }
                }
            },
            {
                82,
                1,
                {
                    "layouts"
                },
                {
                    {
                        83,
                        2,
                        {
                            "main"
                        }
                    }
                }
            },
            {
                90,
                2,
                {
                    "utilities"
                },
                {
                    {
                        99,
                        2,
                        {
                            "references"
                        }
                    },
                    {
                        93,
                        2,
                        {
                            "customFont"
                        }
                    },
                    {
                        95,
                        2,
                        {
                            "drag"
                        }
                    },
                    {
                        96,
                        2,
                        {
                            "get"
                        }
                    },
                    {
                        97,
                        2,
                        {
                            "getStringBounds"
                        }
                    },
                    {
                        92,
                        2,
                        {
                            "connections"
                        }
                    },
                    {
                        91,
                        2,
                        {
                            "animate"
                        }
                    },
                    {
                        98,
                        2,
                        {
                            "randomString"
                        }
                    },
                    {
                        94,
                        2,
                        {
                            "customFunctions"
                        }
                    },
                    {
                        101,
                        2,
                        {
                            "typecheck"
                        }
                    },
                    {
                        100,
                        2,
                        {
                            "tween"
                        }
                    }
                }
            },
            {
                64,
                1,
                {
                    "components"
                },
                {
                    {
                        72,
                        2,
                        {
                            "label"
                        }
                    },
                    {
                        67,
                        2,
                        {
                            "colorpicker"
                        }
                    },
                    {
                        65,
                        2,
                        {
                            "button"
                        }
                    },
                    {
                        79,
                        2,
                        {
                            "textbox"
                        }
                    },
                    {
                        80,
                        2,
                        {
                            "toggle"
                        }
                    },
                    {
                        81,
                        2,
                        {
                            "warn"
                        }
                    },
                    {
                        69,
                        2,
                        {
                            "dropdown"
                        }
                    },
                    {
                        75,
                        2,
                        {
                            "paragraph"
                        }
                    },
                    {
                        77,
                        2,
                        {
                            "tabButton"
                        }
                    },
                    {
                        71,
                        2,
                        {
                            "keybindList"
                        }
                    },
                    {
                        66,
                        2,
                        {
                            "buttonGroup"
                        }
                    },
                    {
                        76,
                        2,
                        {
                            "slider"
                        }
                    },
                    {
                        73,
                        2,
                        {
                            "module"
                        }
                    },
                    {
                        68,
                        2,
                        {
                            "divider"
                        }
                    },
                    {
                        74,
                        2,
                        {
                            "notification"
                        }
                    },
                    {
                        70,
                        2,
                        {
                            "keybind"
                        }
                    },
                    {
                        78,
                        2,
                        {
                            "tabFrame"
                        }
                    }
                }
            }
        }
    }
}

-- Line offsets for debugging (only included when minifyTables is false)
local LineOffsets = {
    8,
    848,
    858,
    [5] = 932,
    [6] = 1150,
    [7] = 1244,
    [8] = 1380,
    [9] = 1456,
    [10] = 1500,
    [11] = 1662,
    [12] = 1761,
    [13] = 1847,
    [15] = 1936,
    [17] = 1991,
    [18] = 2048,
    [19] = 2077,
    [20] = 2101,
    [21] = 2161,
    [23] = 2191,
    [24] = 2340,
    [25] = 2361,
    [26] = 2381,
    [27] = 2417,
    [28] = 2452,
    [29] = 2489,
    [30] = 2533,
    [31] = 2563,
    [32] = 2690,
    [34] = 2801,
    [35] = 2834,
    [36] = 2869,
    [37] = 2893,
    [38] = 2939,
    [39] = 2962,
    [41] = 3109,
    [42] = 3223,
    [43] = 3472,
    [44] = 3782,
    [45] = 4029,
    [46] = 4113,
    [47] = 4176,
    [48] = 4192,
    [50] = 4339,
    [51] = 4353,
    [52] = 4407,
    [53] = 4418,
    [54] = 4436,
    [55] = 4449,
    [56] = 4478,
    [57] = 4498,
    [58] = 4573,
    [59] = 4916,
    [60] = 4935,
    [61] = 4948,
    [62] = 4960,
    [63] = 5199,
    [65] = 5227,
    [66] = 5427,
    [67] = 5680,
    [68] = 6549,
    [69] = 6600,
    [70] = 7355,
    [71] = 7834,
    [72] = 8045,
    [73] = 8158,
    [74] = 8328,
    [75] = 8575,
    [76] = 8741,
    [77] = 9190,
    [78] = 9308,
    [79] = 9347,
    [80] = 9824,
    [81] = 10391,
    [83] = 10416,
    [84] = 11026,
    [85] = 11036,
    [86] = 11048,
    [87] = 11057,
    [88] = 11069,
    [89] = 11104,
    [90] = 11113,
    [91] = 11123,
    [92] = 11130,
    [93] = 11151,
    [94] = 11167,
    [95] = 11362,
    [96] = 11411,
    [97] = 11418,
    [98] = 11429,
    [99] = 11439,
    [100] = 11489,
    [101] = 11496
}

-- Misc AOT variable imports
local WaxVersion = "0.4.1"
local EnvName = "WaxRuntime"

-- ++++++++ RUNTIME IMPL BELOW ++++++++ --

-- Localizing certain libraries and built-ins for runtime efficiency
local string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION =
      string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION

local table_insert = table.insert
local table_remove = table.remove
local table_freeze = table.freeze or function(t) return t end -- lol

local coroutine_wrap = coroutine.wrap

local string_sub = string.sub
local string_match = string.match
local string_gmatch = string.gmatch

-- The Lune runtime has its own `task` impl, but it must be imported by its builtin
-- module path, "@lune/task"
if _VERSION and string_sub(_VERSION, 1, 4) == "Lune" then
    local RequireSuccess, LuneTaskLib = pcall(require, "@lune/task")
    if RequireSuccess and LuneTaskLib then
        task = LuneTaskLib
    end
end

local task_defer = task and task.defer

-- If we're not running on the Roblox engine, we won't have a `task` global
local Defer = task_defer or function(f, ...)
    coroutine_wrap(f)(...)
end

-- ClassName "IDs"
local ClassNameIdBindings = {
    [1] = "Folder",
    [2] = "ModuleScript",
    [3] = "Script",
    [4] = "LocalScript",
    [5] = "StringValue",
}

local RefBindings = {} -- [RefId] = RealObject

local ScriptClosures = {}
local ScriptClosureRefIds = {} -- [ScriptClosure] = RefId
local StoredModuleValues = {}
local ScriptsToRun = {}

-- wax.shared __index/__newindex
local SharedEnvironment = {}

-- We're creating 'fake' instance refs soley for traversal of the DOM for require() compatibility
-- It's meant to be as lazy as possible
local RefChildren = {} -- [Ref] = {ChildrenRef, ...}

-- Implemented instance methods
local InstanceMethods = {
    GetFullName = { {}, function(self)
        local Path = self.Name
        local ObjectPointer = self.Parent

        while ObjectPointer do
            Path = ObjectPointer.Name .. "." .. Path

            -- Move up the DOM (parent will be nil at the end, and this while loop will stop)
            ObjectPointer = ObjectPointer.Parent
        end

        return Path
    end},

    GetChildren = { {}, function(self)
        local ReturnArray = {}

        for Child in next, RefChildren[self] do
            table_insert(ReturnArray, Child)
        end

        return ReturnArray
    end},

    GetDescendants = { {}, function(self)
        local ReturnArray = {}

        for Child in next, RefChildren[self] do
            table_insert(ReturnArray, Child)

            for _, Descendant in next, Child:GetDescendants() do
                table_insert(ReturnArray, Descendant)
            end
        end

        return ReturnArray
    end},

    FindFirstChild = { {"string", "boolean?"}, function(self, name, recursive)
        local Children = RefChildren[self]

        for Child in next, Children do
            if Child.Name == name then
                return Child
            end
        end

        if recursive then
            for Child in next, Children do
                -- Yeah, Roblox follows this behavior- instead of searching the entire base of a
                -- ref first, the engine uses a direct recursive call
                return Child:FindFirstChild(name, true)
            end
        end
    end},

    FindFirstAncestor = { {"string"}, function(self, name)
        local RefPointer = self.Parent
        while RefPointer do
            if RefPointer.Name == name then
                return RefPointer
            end

            RefPointer = RefPointer.Parent
        end
    end},

    -- Just to implement for traversal usage
    WaitForChild = { {"string", "number?"}, function(self, name)
        return self:FindFirstChild(name)
    end},
}

-- "Proxies" to instance methods, with err checks etc
local InstanceMethodProxies = {}
for MethodName, MethodObject in next, InstanceMethods do
    local Types = MethodObject[1]
    local Method = MethodObject[2]

    local EvaluatedTypeInfo = {}
    for ArgIndex, TypeInfo in next, Types do
        local ExpectedType, IsOptional = string_match(TypeInfo, "^([^%?]+)(%??)")
        EvaluatedTypeInfo[ArgIndex] = {ExpectedType, IsOptional}
    end

    InstanceMethodProxies[MethodName] = function(self, ...)
        if not RefChildren[self] then
            error("Expected ':' not '.' calling member function " .. MethodName, 2)
        end

        local Args = {...}
        for ArgIndex, TypeInfo in next, EvaluatedTypeInfo do
            local RealArg = Args[ArgIndex]
            local RealArgType = type(RealArg)
            local ExpectedType, IsOptional = TypeInfo[1], TypeInfo[2]

            if RealArg == nil and not IsOptional then
                error("Argument " .. RealArg .. " missing or nil", 3)
            end

            if ExpectedType ~= "any" and RealArgType ~= ExpectedType and not (RealArgType == "nil" and IsOptional) then
                error("Argument " .. ArgIndex .. " expects type \"" .. ExpectedType .. "\", got \"" .. RealArgType .. "\"", 2)
            end
        end

        return Method(self, ...)
    end
end

local function CreateRef(className, name, parent)
    -- `name` and `parent` can also be set later by the init script if they're absent

    -- Extras
    local StringValue_Value

    -- Will be set to RefChildren later aswell
    local Children = setmetatable({}, {__mode = "k"})

    -- Err funcs
    local function InvalidMember(member)
        error(member .. " is not a valid (virtual) member of " .. className .. " \"" .. name .. "\"", 3)
    end
    local function ReadOnlyProperty(property)
        error("Unable to assign (virtual) property " .. property .. ". Property is read only", 3)
    end

    local Ref = {}
    local RefMetatable = {}

    RefMetatable.__metatable = false

    RefMetatable.__index = function(_, index)
        if index == "ClassName" then -- First check "properties"
            return className
        elseif index == "Name" then
            return name
        elseif index == "Parent" then
            return parent
        elseif className == "StringValue" and index == "Value" then
            -- Supporting StringValue.Value for Rojo .txt file conv
            return StringValue_Value
        else -- Lastly, check "methods"
            local InstanceMethod = InstanceMethodProxies[index]

            if InstanceMethod then
                return InstanceMethod
            end
        end

        -- Next we'll look thru child refs
        for Child in next, Children do
            if Child.Name == index then
                return Child
            end
        end

        -- At this point, no member was found; this is the same err format as Roblox
        InvalidMember(index)
    end

    RefMetatable.__newindex = function(_, index, value)
        -- __newindex is only for props fyi
        if index == "ClassName" then
            ReadOnlyProperty(index)
        elseif index == "Name" then
            name = value
        elseif index == "Parent" then
            -- We'll just ignore the process if it's trying to set itself
            if value == Ref then
                return
            end

            if parent ~= nil then
                -- Remove this ref from the CURRENT parent
                RefChildren[parent][Ref] = nil
            end

            parent = value

            if value ~= nil then
                -- And NOW we're setting the new parent
                RefChildren[value][Ref] = true
            end
        elseif className == "StringValue" and index == "Value" then
            -- Supporting StringValue.Value for Rojo .txt file conv
            StringValue_Value = value
        else
            -- Same err as __index when no member is found
            InvalidMember(index)
        end
    end

    RefMetatable.__tostring = function()
        return name
    end

    setmetatable(Ref, RefMetatable)

    RefChildren[Ref] = Children

    if parent ~= nil then
        RefChildren[parent][Ref] = true
    end

    return Ref
end

-- Create real ref DOM from object tree
local function CreateRefFromObject(object, parent)
    local RefId = object[1]
    local ClassNameId = object[2]
    local Properties = object[3] -- Optional
    local Children = object[4] -- Optional

    local ClassName = ClassNameIdBindings[ClassNameId]

    local Name = Properties and table_remove(Properties, 1) or ClassName

    local Ref = CreateRef(ClassName, Name, parent) -- 3rd arg may be nil if this is from root
    RefBindings[RefId] = Ref

    if Properties then
        for PropertyName, PropertyValue in next, Properties do
            Ref[PropertyName] = PropertyValue
        end
    end

    if Children then
        for _, ChildObject in next, Children do
            CreateRefFromObject(ChildObject, Ref)
        end
    end

    return Ref
end

local RealObjectRoot = CreateRef("Folder", "[" .. EnvName .. "]")
for _, Object in next, ObjectTree do
    CreateRefFromObject(Object, RealObjectRoot)
end

-- Now we'll set script closure refs and check if they should be ran as a BaseScript
for RefId, Closure in next, ClosureBindings do
    local Ref = RefBindings[RefId]

    ScriptClosures[Ref] = Closure
    ScriptClosureRefIds[Ref] = RefId

    local ClassName = Ref.ClassName
    if ClassName == "LocalScript" or ClassName == "Script" then
        table_insert(ScriptsToRun, Ref)
    end
end

local function LoadScript(scriptRef)
    local ScriptClassName = scriptRef.ClassName

    -- First we'll check for a cached module value (packed into a tbl)
    local StoredModuleValue = StoredModuleValues[scriptRef]
    if StoredModuleValue and ScriptClassName == "ModuleScript" then
        return unpack(StoredModuleValue)
    end

    local Closure = ScriptClosures[scriptRef]

    local function FormatError(originalErrorMessage)
        originalErrorMessage = tostring(originalErrorMessage)

        local VirtualFullName = scriptRef:GetFullName()

        -- Check for vanilla/Roblox format
        local OriginalErrorLine, BaseErrorMessage = string_match(originalErrorMessage, "[^:]+:(%d+): (.+)")

        if not OriginalErrorLine or not LineOffsets then
            return VirtualFullName .. ":*: " .. (BaseErrorMessage or originalErrorMessage)
        end

        OriginalErrorLine = tonumber(OriginalErrorLine)

        local RefId = ScriptClosureRefIds[scriptRef]
        local LineOffset = LineOffsets[RefId]

        local RealErrorLine = OriginalErrorLine - LineOffset + 1
        if RealErrorLine < 0 then
            RealErrorLine = "?"
        end

        return VirtualFullName .. ":" .. RealErrorLine .. ": " .. BaseErrorMessage
    end

    -- If it's a BaseScript, we'll just run it directly!
    if ScriptClassName == "LocalScript" or ScriptClassName == "Script" then
        local RunSuccess, ErrorMessage = pcall(Closure)
        if not RunSuccess then
            error(FormatError(ErrorMessage), 0)
        end
    else
        local PCallReturn = {pcall(Closure)}

        local RunSuccess = table_remove(PCallReturn, 1)
        if not RunSuccess then
            local ErrorMessage = table_remove(PCallReturn, 1)
            error(FormatError(ErrorMessage), 0)
        end

        StoredModuleValues[scriptRef] = PCallReturn
        return unpack(PCallReturn)
    end
end

-- We'll assign the actual func from the top of this output for flattening user globals at runtime
-- Returns (in a tuple order): wax, script, require
function ImportGlobals(refId)
    local ScriptRef = RefBindings[refId]

    local function RealCall(f, ...)
        local PCallReturn = {pcall(f, ...)}

        local CallSuccess = table_remove(PCallReturn, 1)
        if not CallSuccess then
            error(PCallReturn[1], 3)
        end

        return unpack(PCallReturn)
    end

    -- `wax.shared` index
    local WaxShared = table_freeze(setmetatable({}, {
        __index = SharedEnvironment,
        __newindex = function(_, index, value)
            SharedEnvironment[index] = value
        end,
        __len = function()
            return #SharedEnvironment
        end,
        __iter = function()
            return next, SharedEnvironment
        end,
    }))

    local Global_wax = table_freeze({
        -- From AOT variable imports
        version = WaxVersion,
        envname = EnvName,

        shared = WaxShared,

        -- "Real" globals instead of the env set ones
        script = script,
        require = require,
    })

    local Global_script = ScriptRef

    local function Global_require(module, ...)
        local ModuleArgType = type(module)

        local ErrorNonModuleScript = "Attempted to call require with a non-ModuleScript"
        local ErrorSelfRequire = "Attempted to call require with self"

        if ModuleArgType == "table" and RefChildren[module]  then
            if module.ClassName ~= "ModuleScript" then
                error(ErrorNonModuleScript, 2)
            elseif module == ScriptRef then
                error(ErrorSelfRequire, 2)
            end

            return LoadScript(module)
        elseif ModuleArgType == "string" and string_sub(module, 1, 1) ~= "@" then
            -- The control flow on this SUCKS

            if #module == 0 then
                error("Attempted to call require with empty string", 2)
            end

            local CurrentRefPointer = ScriptRef

            if string_sub(module, 1, 1) == "/" then
                CurrentRefPointer = RealObjectRoot
            elseif string_sub(module, 1, 2) == "./" then
                module = string_sub(module, 3)
            end

            local PreviousPathMatch
            for PathMatch in string_gmatch(module, "([^/]*)/?") do
                local RealIndex = PathMatch
                if PathMatch == ".." then
                    RealIndex = "Parent"
                end

                -- Don't advance dir if it's just another "/" either
                if RealIndex ~= "" then
                    local ResultRef = CurrentRefPointer:FindFirstChild(RealIndex)
                    if not ResultRef then
                        local CurrentRefParent = CurrentRefPointer.Parent
                        if CurrentRefParent then
                            ResultRef = CurrentRefParent:FindFirstChild(RealIndex)
                        end
                    end

                    if ResultRef then
                        CurrentRefPointer = ResultRef
                    elseif PathMatch ~= PreviousPathMatch and PathMatch ~= "init" and PathMatch ~= "init.server" and PathMatch ~= "init.client" then
                        error("Virtual script path \"" .. module .. "\" not found", 2)
                    end
                end

                -- For possible checks next cycle
                PreviousPathMatch = PathMatch
            end

            if CurrentRefPointer.ClassName ~= "ModuleScript" then
                error(ErrorNonModuleScript, 2)
            elseif CurrentRefPointer == ScriptRef then
                error(ErrorSelfRequire, 2)
            end

            return LoadScript(CurrentRefPointer)
        end

        return RealCall(require, module, ...)
    end

    -- Now, return flattened globals ready for direct runtime exec
    return Global_wax, Global_script, Global_require
end

for _, ScriptRef in next, ScriptsToRun do
    Defer(LoadScript, ScriptRef)
end

-- AoT adjustment: Load init module (MainModule behavior)
return LoadScript(RealObjectRoot:GetChildren()[1])