--[[
local darius = require(script.Parent)
local randomString = require(script.Parent.utilities).randomString
local lucide = require(script.Parent.Bundles.lucide)
local HttpService = require(script.Parent.Bundles).services.HttpService
local customFunctions = require(script.Parent.utilities).customFunctions

local fakeData = {
	['dropdown_m'] = {"1"},
    ['colorpicker'] = {color = "0.1,0.2,0.5",transparency = 0.5}
}
customFunctions.makefolder("darius")
customFunctions.makefolder("darius/test")
customFunctions.writefile("darius/test/config.json", HttpService:JSONEncode(fakeData))

local randomIcons = {}
for _,v in lucide do
    table.insert(randomIcons, v)
end
local function randomIcon():string
    return randomIcons[math.floor(math.random(1,#randomIcons))]
end

return function(target)
    task.spawn(function()
        local window = darius:Window({
            Title = "Darius",
            Description = "What the sigma this isn't Quantum UI",
            Icon = randomIcon(),
            HideBind = Enum.KeyCode.T,
            UseConfig = true,
            Config = "test",
            IsMobile = false,

            Theme = {
                background = Color3.fromHex("#1C1726"),
                background2 = Color3.fromHex("#0F0C15"),

                text = Color3.fromHex("#EDEBF2"),
                text2 = Color3.fromHex("#B7A6D4"),

                selectedTab = Color3.fromHex("#1D1827"),

                colorpickerBar = Color3.fromHex("#DCE1E5"),

                notificationButton = Color3.fromHex("#222427"),

                mobileButtonBackground = Color3.fromHex("#DCE1E5"),
                mobileButtonText = Color3.fromHex("#2C2F33"),
                mobileButtonImage = Color3.fromHex("#2C2F33"),

                disabledBackground = Color3.fromHex("#2A2C31"),
                disabledText = Color3.fromHex("#D6DCE0"),

                toggled = Color3.fromHex("#B7A6D4"),

                red = Color3.fromHex("#B7A6D4"),
                orange = Color3.fromHex("#B7A6D4")
            },

            noOffset = true,
            Parent = target
        })

        local tab = window:Tab({
            Name = "Main",
        })
        local tab2 = window:Tab({
            Name = randomString(16),
            Image = randomIcon()
        })
        for i=1,10 do
            window:Tab({
                Name = randomString(6),
                Image = randomIcon()
            })
        end

        tab:TextBox({
            Name = "Textbox",
            Callback = function(v)

            end
        })
        tab:Keybind({
            Name = "Keybind",
            Callback = function(v)

            end
        })
        tab:Toggle({
            Name = "Toggle",
            LinkKeybind = true,
            Callback = function(v)
                print(v)
            end
        })
        tab:Dropdown({
            Name = "Dropdown",
            Items = {"1","2","3"},
            Default = "1",
            FLAG = "dropdown",
            Callback = function()

            end
        })
        print(`dropdown flag: "{darius.flags.dropdown.Value}"`)
        tab:Dropdown({
            Name = "Dropdown",
            Items = {"1","2","3"},
            FLAG = "dropdown_m",
            --IgnoreConfig = true,
            Multiselect = true,
            Callback = function(v)
                print(v)
                print(darius.flags.dropdown_m.Value)
            end
        })
        print(darius.flags.dropdown_m.Value)
        local a = tab:ColorPicker({
            Name = "Colorpicker",
            --Color = Color3.fromHex('#a49ae6'),
            --Transparency = 0.5,
            FLAG = "colorpicker",
            Callback = function(color,transparency)

            end
        })
        local b = tab:ColorPicker({
            Name = "Colorpicker",
            --Color = Color3.fromHex('#a49ae6'),
            --Transparency = 0.5,
            --FLAG = "colorpicker",
            Callback = function(color,transparency)

            end
        })
        tab:Button({
            Name = "sdfsdf",
            Callback = function()
                a:Disable()
            end
        })
        tab:Slider({
            Name = "Slider",
            Min = 0,
            Max = 100,
            Callback = function(v)

            end
        })
        tab:KeybindList()
        darius:LoadConfig()
    end)
    return function()
        task.spawn(function()
            darius:Destroy()
        end)
    end
end
]]