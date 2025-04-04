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
		Workspace = "",
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
	--[[
	didPass, failedItems = typecheck(windowProperty,{
		Config = "",
	},{
		windowProperty.UseConfig and "" or "Config"
	})
	assert(didPass, table.concat(failedItems, "\n"))
	]]

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
	local configLoaded = data.add({boolean = false}, "configLoaded")
	local useConfig = data.add({boolean = false}, "useConfig")
	local windowData = data.add({data = windowProperty})

	-- Files

	local path = {"darius",`/{windowProperty.Workspace}`}
	local built = ""
	for i=1,#path do
		built = built..path[i]
		if not customFunctions.isfolder(built) then
			customFunctions.makefolder(built)
		end
	end
	flagCreator.path = `darius/{windowProperty.Workspace}`
	path = {"darius",`/themes`}
	built = ""
	for i=1,#path do
		built = built..path[i]
		if not customFunctions.isfolder(built) then
			customFunctions.makefolder(built)
		end
	end
	theme.path = `darius/themes`

	darius.Folder = `darius/{windowProperty.Workspace}`

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

	-- Flags

	local config
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
		for _,toggle in toggles.list do
			toggle:set(false)
		end
		task.wait(0.1)
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

		_settings:Divider()

		-- Configuration Manager

		do
			local configNames = {}
			table.foreach(flagCreator.getConfigs(), function(_, _config)
				table.insert(configNames, {
					DisplayValue = _config.name,
					Value = _config.uid
				})
			end)
			local selectedConfig = ""

			local configs = _settings:Dropdown({
				Name = "Configs",
				Items = configNames,
				AlwaysOpen = true,
				Callback = function(uid)
					selectedConfig = uid
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

			configButtons:Button({
				Name = "Save",
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

			configButtons:Button({
				Name = "Delete",
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
    function()local wax,script,require=ImportGlobals(3)local ImportGlobals return (function(...)local utilities = require(script.Parent.Parent.utilities)
local customFunctions = utilities.customFunctions

local fusion
local oldidentity
if customFunctions.getthreadidentity() < 5 then
    oldidentity = customFunctions.getthreadidentity()
    customFunctions.setthreadidentity(5)
end
fusion = require(game:GetObjects("rbxassetid://110500042647914")[1])
customFunctions.setthreadidentity(oldidentity)
return fusion
end)() end,
    function()local wax,script,require=ImportGlobals(4)local ImportGlobals return (function(...)local randomString = require(script.Parent.Parent.utilities.randomString)
local fusion = require(script.Parent.Fusion)
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
    function()local wax,script,require=ImportGlobals(5)local ImportGlobals return (function(...)local data = require(script.Parent).data
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
        return status.multiselect and get(status.items) or get(status.item)
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

local configs = {}
funcs.currentConfig = {}
funcs.path = ""

function funcs.preregister(name)
    local flagEvent = fusion.New "BindableEvent" {}
    local onChange = {}
    function onChange:Connect(func)
        assert(typeof(func) == "function", "Connect only takes functions")
        connections.add(flagEvent.Event:Connect(func))
    end
    local _flag
    _flag = {
        name = name,
        status = {},
        type = "unknown",
        preregistered = true,
        bindableEvent = flagEvent,
        file = value({}),
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
        _flag.preregistered = false
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

function funcs.create(name, uid, fromFile, tbl)
    fromFile = fromFile or false
    if uid == "original" and fromFile then
        return
    end
    local config = {}
    config.name = name
    config.uid = uid or randomString(5)
    config.flagValues = {}
    if fromFile then
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
    customFunctions.writefile(`{funcs.path}/{config.uid}.json`, HttpService:JSONEncode(config))
    task.spawn(function()
        for _,v in functionsOnCreate do
            task.spawn(v)
        end
    end)
    return uid
end

function funcs.init()
    for _,file in customFunctions.listfiles(funcs.path) do
        local config = HttpService:JSONDecode(customFunctions.readfile(file))
        funcs.create(config.name, config.uid, true, config.flagValues)
    end
end

function funcs.load(fileTable)
    for i,v in fileTable do
        local flag = get(flags.list)[i]
        if not flag then
            continue
        end
        flag.fileEvent:Fire(v)
    end
end

function funcs.set(uid)
    local config = funcs.find(uid)
    if not config then
        return
    end
    funcs.currentConfig = config
    funcs.load(config.flagValues)
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
    customFunctions.writefile(`{funcs.path}/{config.uid}.json`, HttpService:JSONEncode(config))
end

function funcs.delete(uid)
    local config, index = funcs.find(uid)
    if config then
        if customFunctions.isfile(`{funcs.path}/{config.uid}.json`) then
            customFunctions.delfile(`{funcs.path}/{config.uid}.json`)
            table.remove(configs, index)
        end
    end
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
    function()local wax,script,require=ImportGlobals(6)local ImportGlobals return (function(...)return {
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
    function()local wax,script,require=ImportGlobals(7)local ImportGlobals return (function(...)local utilities = require(script.Parent.Parent.utilities)
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
    function()local wax,script,require=ImportGlobals(8)local ImportGlobals return (function(...)local cF = require(script.Parent.Parent.utilities.customFunctions)
local cloneref = cF.cloneref

local services = {}
services = setmetatable(services, {
    __index = function(_, key)
        return cloneref(game:GetService(key))
    end
})

return services
end)() end,
    function()local wax,script,require=ImportGlobals(9)local ImportGlobals return (function(...)local themeSystem = {}
local services = require(script.Parent.services)
local HttpService = services.HttpService
local data = require(script.Parent.data)
local fusion = require(script.Parent.Fusion)
local default = require(script.default)
local value = fusion.Value
local observe = fusion.Observer

local get = require(script.Parent.Parent.utilities.get)
local animate = require(script.Parent.Parent.utilities.animate)
local _warn = require(script.Parent.Parent.components.warn)
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
            local theme = themeSystem.find(v)
            if theme.name == name then
                return v.uid
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
    function()local wax,script,require=ImportGlobals(10)local ImportGlobals return (function(...)return {
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
    [12] = function()local wax,script,require=ImportGlobals(12)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [13] = function()local wax,script,require=ImportGlobals(13)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [14] = function()local wax,script,require=ImportGlobals(14)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
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
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
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
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
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
					color:set(Color3.fromHex(`#{file.color}`))
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
    [15] = function()local wax,script,require=ImportGlobals(15)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [16] = function()local wax,script,require=ImportGlobals(16)local ImportGlobals return (function(...)local darius = script.Parent.Parent

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
				_items:set(file)
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
    [17] = function()local wax,script,require=ImportGlobals(17)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
							_flag.status.coordinate:set(mobileButton.AbsolutePosition)
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
			if file.keycode ~= nil then
				if get(keyCode) and get(keyCode).Name == file.keycode then
					return
				end
				local success, result = pcall(function()
					return Enum.KeyCode[file.keycode]
				end)
				if success then
					checkKeyCode(result, "File1")
				end
				noKeyCode = false
			end
			if noKeyCode then
				if bind then
					_flag.status.keycode:set(get(bind).Name)
				end
			end
			if get(isMobile.boolean) and file.coordinate then
				mobileButton.Position = UDim2.fromOffset(file.coordinate.X + 30,file.coordinate.Y + 30)
				hasPlaced:set(true)
			end
		end)
		if _flag.private then
			if bind then
				_flag.status.keycode:set(get(bind).Name)
			end
		end
	else
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
    [18] = function()local wax,script,require=ImportGlobals(18)local ImportGlobals return (function(...)local darius = script.Parent.Parent

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
    [19] = function()local wax,script,require=ImportGlobals(19)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [20] = function()local wax,script,require=ImportGlobals(20)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [21] = function()local wax,script,require=ImportGlobals(21)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    local hideNotification = value(false)
    local tickText = value("")
    local width = value(250)
    local bodyBounds = value(getStringBounds(get(body), {
        Size = 14,
        Font = customFont("Montserrat", Enum.FontWeight.Medium),
        Width = get(width) - 8 - (image and 32 or 0)
    }))
    local height = value(20 + math.clamp(get(bodyBounds).Y + 4 + 10 + (#get(buttons) > 0 and 26 or 0), #get(buttons) > 0 and 56 or 30, 9e9))
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
                task.delay(0.3, function()
                    hideNotification:set(true)
                end)
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
        Size = animate(function()
            return UDim2.fromOffset(get(width), get(loaded) and get(height) + 5 or 0)
        end, 30, 1),
        ClipsDescendants = true,

        [children] = {
            new "TextButton" {
                Visible = computed(function()
                    return not get(hideNotification)
                end),
                Interactable = resized,
                AnchorPoint = Vector2.new(0,1),
                Position = UDim2.fromScale(0,1),
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(get(width), get(height)),

                [onevent "Activated"] = function()
                    resized:set(false)
                    task.wait(0.4)
                    loaded:set(false)
                    task.delay(0.3, function()
                        hideNotification:set(true)
                    end)
                    task.wait(2)
                    newNotification:Destroy()
                end
            },
            new "Frame" {
                AnchorPoint = Vector2.new(0,1),
                BackgroundColor3 = theme.background,
                Size = UDim2.fromOffset(get(width), get(height)),
                Position = animate(function()
                    return UDim2.fromScale(get(resized) and 0 or 1.2, 1)
                end,30,1),

                [children] = {
                    UIPadding(0,4),
                    UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,4)),
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
                        Size = UDim2.new(1,get(image) ~= "" and -28 or 0,1,0),
                        BackgroundTransparency = 1,

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
        task.delay(0.3, function()
            hideNotification:set(true)
        end)
        task.wait(2)
        newNotification:Destroy()
    end)
end
end)() end,
    [22] = function()local wax,script,require=ImportGlobals(22)local ImportGlobals return (function(...)local darius = script.Parent.Parent

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
    [23] = function()local wax,script,require=ImportGlobals(23)local ImportGlobals return (function(...)local darius = script.Parent.Parent

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
				_flag.status.percentageOf:set(file)
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
    [24] = function()local wax,script,require=ImportGlobals(24)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [25] = function()local wax,script,require=ImportGlobals(25)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [26] = function()local wax,script,require=ImportGlobals(26)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [27] = function()local wax,script,require=ImportGlobals(27)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
			if file.keycode ~= nil then
				if get(keyCode) and get(keyCode).Name == file.keycode then
					return
				end
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
					_flag.status.keycode:set(get(bind).Name)
				end
			end
			if get(isMobile.boolean) and file.coordinate then
				mobileButton.Position = UDim2.fromOffset(file.coordinate.X + 30,file.coordinate.Y + 30)
				hasPlaced:set(true)
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
	function returnFunctions:Visible()
		visible:set(true)
	end
	function returnFunctions:Invisible()
		visible:set(false)
	end
	return returnFunctions
end
end)() end,
    [28] = function()local wax,script,require=ImportGlobals(28)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
    [30] = function()local wax,script,require=ImportGlobals(30)local ImportGlobals return (function(...)local darius = script.Parent.Parent
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
end)() end,
    [31] = function()local wax,script,require=ImportGlobals(31)local ImportGlobals return (function(...)return setmetatable({},{
    __index = function(self, key)
        if script:FindFirstChild(key) then
            return require(script[key])
        else
            error("no utility: "..key)
        end
    end
})
end)() end,
    [32] = function()local wax,script,require=ImportGlobals(32)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)

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
    [33] = function()local wax,script,require=ImportGlobals(33)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)

return function(offset, scale)
    scale = scale or 0
    return Fusion.New "UICorner" {
        CornerRadius = UDim.new(scale, offset)
    }
end
end)() end,
    [34] = function()local wax,script,require=ImportGlobals(34)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)

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
    [35] = function()local wax,script,require=ImportGlobals(35)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)

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
    [36] = function()local wax,script,require=ImportGlobals(36)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)

return function(MinText:number?, MaxText:number?)
    return Fusion.New "UITextSizeConstraint" {
        MinTextSize = MinText,
        MaxTextSize = MaxText,
    }
end
end)() end,
    [37] = function()local wax,script,require=ImportGlobals(37)local ImportGlobals return (function(...)return setmetatable({},{
    __index = function(self, key)
        if script:FindFirstChild(key) then
            return require(script[key])
        else
            error("no utility: "..key)
        end
    end
})
end)() end,
    [38] = function()local wax,script,require=ImportGlobals(38)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)
local computed,spring = Fusion.Computed,Fusion.Spring

return function(callback, speed, damping)
	return spring(computed(callback), speed, damping)
end
end)() end,
    [39] = function()local wax,script,require=ImportGlobals(39)local ImportGlobals return (function(...)local connections = {}
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
    [40] = function()local wax,script,require=ImportGlobals(40)local ImportGlobals return (function(...)local fonts = {
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
    [41] = function()local wax,script,require=ImportGlobals(41)local ImportGlobals return (function(...)---@diagnostic disable: undefined-global
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
    [42] = function()local wax,script,require=ImportGlobals(42)local ImportGlobals return (function(...)return function(o,s)
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
    [43] = function()local wax,script,require=ImportGlobals(43)local ImportGlobals return (function(...)return function(value, dependency)
	if typeof(value) == "table" and value.type == "State" then
		return value:get(dependency)
	end
	return value
end
end)() end,
    [44] = function()local wax,script,require=ImportGlobals(44)local ImportGlobals return (function(...)return function(text:string, properties)
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
    [45] = function()local wax,script,require=ImportGlobals(45)local ImportGlobals return (function(...)local characters = string.split("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890","")
local function randomString(length)
    if length > 0 then
        return randomString(length - 1) .. characters[math.random(1, #characters)]
    else
        return ""
    end
end
return randomString
end)() end,
    [46] = function()local wax,script,require=ImportGlobals(46)local ImportGlobals return (function(...)local references = {}
local returnFunctions = {}
local observe = require(script.Parent.Parent.Bundles.Fusion).Observer

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
    [47] = function()local wax,script,require=ImportGlobals(47)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)
local computed = Fusion.Computed

return function(callback,style)
	return Fusion.Tween(computed(callback), style)
end
end)() end,
    [48] = function()local wax,script,require=ImportGlobals(48)local ImportGlobals return (function(...)return function(variables:table, correctVariables:table, ignoreList:table?):any
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
                11,
                1,
                {
                    "components"
                },
                {
                    {
                        20,
                        2,
                        {
                            "module"
                        }
                    },
                    {
                        27,
                        2,
                        {
                            "toggle"
                        }
                    },
                    {
                        28,
                        2,
                        {
                            "warn"
                        }
                    },
                    {
                        26,
                        2,
                        {
                            "textbox"
                        }
                    },
                    {
                        15,
                        2,
                        {
                            "divider"
                        }
                    },
                    {
                        19,
                        2,
                        {
                            "label"
                        }
                    },
                    {
                        25,
                        2,
                        {
                            "tabFrame"
                        }
                    },
                    {
                        14,
                        2,
                        {
                            "colorpicker"
                        }
                    },
                    {
                        16,
                        2,
                        {
                            "dropdown"
                        }
                    },
                    {
                        21,
                        2,
                        {
                            "notification"
                        }
                    },
                    {
                        18,
                        2,
                        {
                            "keybindList"
                        }
                    },
                    {
                        13,
                        2,
                        {
                            "buttonGroup"
                        }
                    },
                    {
                        23,
                        2,
                        {
                            "slider"
                        }
                    },
                    {
                        24,
                        2,
                        {
                            "tabButton"
                        }
                    },
                    {
                        17,
                        2,
                        {
                            "keybind"
                        }
                    },
                    {
                        22,
                        2,
                        {
                            "paragraph"
                        }
                    },
                    {
                        12,
                        2,
                        {
                            "button"
                        }
                    }
                }
            },
            {
                31,
                2,
                {
                    "simpleElements"
                },
                {
                    {
                        34,
                        2,
                        {
                            "UIListLayout"
                        }
                    },
                    {
                        36,
                        2,
                        {
                            "UITextSizeConstraint"
                        }
                    },
                    {
                        35,
                        2,
                        {
                            "UIPadding"
                        }
                    },
                    {
                        33,
                        2,
                        {
                            "UICorner"
                        }
                    },
                    {
                        32,
                        2,
                        {
                            "UIAspectRatioConstraint"
                        }
                    }
                }
            },
            {
                2,
                2,
                {
                    "Bundles"
                },
                {
                    {
                        5,
                        2,
                        {
                            "flags"
                        }
                    },
                    {
                        8,
                        2,
                        {
                            "services"
                        }
                    },
                    {
                        7,
                        2,
                        {
                            "lucide"
                        }
                    },
                    {
                        3,
                        2,
                        {
                            "Fusion"
                        }
                    },
                    {
                        9,
                        2,
                        {
                            "themeSystem"
                        },
                        {
                            {
                                10,
                                2,
                                {
                                    "default"
                                }
                            }
                        }
                    },
                    {
                        6,
                        2,
                        {
                            "icons"
                        }
                    },
                    {
                        4,
                        2,
                        {
                            "data"
                        }
                    }
                }
            },
            {
                37,
                2,
                {
                    "utilities"
                },
                {
                    {
                        41,
                        2,
                        {
                            "customFunctions"
                        }
                    },
                    {
                        40,
                        2,
                        {
                            "customFont"
                        }
                    },
                    {
                        44,
                        2,
                        {
                            "getStringBounds"
                        }
                    },
                    {
                        47,
                        2,
                        {
                            "tween"
                        }
                    },
                    {
                        48,
                        2,
                        {
                            "typecheck"
                        }
                    },
                    {
                        45,
                        2,
                        {
                            "randomString"
                        }
                    },
                    {
                        42,
                        2,
                        {
                            "drag"
                        }
                    },
                    {
                        38,
                        2,
                        {
                            "animate"
                        }
                    },
                    {
                        39,
                        2,
                        {
                            "connections"
                        }
                    },
                    {
                        43,
                        2,
                        {
                            "get"
                        }
                    },
                    {
                        46,
                        2,
                        {
                            "references"
                        }
                    }
                }
            },
            {
                29,
                1,
                {
                    "layouts"
                },
                {
                    {
                        30,
                        2,
                        {
                            "main"
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
    804,
    814,
    827,
    901,
    1210,
    1229,
    1242,
    1254,
    1493,
    [12] = 1521,
    [13] = 1721,
    [14] = 1974,
    [15] = 2828,
    [16] = 2879,
    [17] = 3578,
    [18] = 4036,
    [19] = 4247,
    [20] = 4360,
    [21] = 4530,
    [22] = 4799,
    [23] = 4965,
    [24] = 5406,
    [25] = 5524,
    [26] = 5563,
    [27] = 6028,
    [28] = 6566,
    [30] = 6591,
    [31] = 7199,
    [32] = 7209,
    [33] = 7221,
    [34] = 7230,
    [35] = 7242,
    [36] = 7277,
    [37] = 7286,
    [38] = 7296,
    [39] = 7303,
    [40] = 7324,
    [41] = 7340,
    [42] = 7535,
    [43] = 7584,
    [44] = 7591,
    [45] = 7602,
    [46] = 7612,
    [47] = 7662,
    [48] = 7669
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