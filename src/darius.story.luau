--[[]]
local _path = script.Parent.darius
local darius = require(_path)
local randomString = require(_path.utilities).randomString
local lucide = require(_path.Bundles.lucide)
local HttpService = require(_path.Bundles).services.HttpService
local customFunctions = require(_path.utilities).customFunctions

local fakeData = {
    name = "test",
    uid = "FIVE5",
	flagValues = {
        textbox = "testing123",
        toggle_lk = {boolean = true, keycode = "P"},
        slider = 100
    }
}
customFunctions.makefolder("darius")
customFunctions.makefolder("darius/testing")
customFunctions.makefolder("darius/testing")
customFunctions.makefolder("darius/themes")
customFunctions.writefile("darius/testing/FIVE5.json", HttpService:JSONEncode(fakeData))

local randomIcons = {}
for _,v in lucide do
    table.insert(randomIcons, v)
end
local function randomIcon():string
    return randomIcons[math.floor(math.random(1,#randomIcons))]
end


local ripFile = [[{"palette":{"disabledText":"d6dce0","text2":"b7a6d4","mobileButtonText":"2c2f33","disabledBackground":"2a2c31","mobileButtonImage":"2c2f33","text":"edebf2","background2":"0f0c15","notificationButton":"222427","orange":"b7a6d4","toggled":"b7a6d4","mobileButtonBackground":"dce1e5","colorpickerBar":"dce1e5","background":"1c1726","selectedTab":"1d1827","red":"b7a6d4"},"uid":"APunF","name":"rip"}]]
customFunctions.writefile("darius/themes/APunF.json", ripFile)

return function(target)
    task.spawn(function()
        local window = darius:Window({
            Title = "Darius",
            Description = "What the sigma this isn't Quantum UI",
            HideBind = Enum.KeyCode.T,
            UseConfig = true,
            Workspace = "testing",
            IsMobile = true,
            noOffset = true,
            Parent = target
        })

        local tab = window:Tab({
            Name = "Main",
        })
        local tab2 = window:Tab({
            Name = "test"
        })

        tab:TextBox({
            Name = "TextBox Numbers",
            Placeholder = "Only Numbers",
            ClearTextOnFocus = false,
            OnlyNumbers = true,
            OnLeave = true,
            Default = "",
            FLAG = "textbox_n",
            Callback = function(value)
                print(`TextBox Numbers: {value}`)
            end
        })
        tab:TextBox({
            Name = "TextBox",
            Placeholder = "ANYTHING",
            OnLeave = false,
            OnlyNumbers = false,
            ClearTextOnFocus = true,
            Default = "",
            FLAG = "textbox",
            Callback = function(value)
                print(`TextBox: {value}`)
            end
        })
        tab:Toggle({
            Name = "Toggle",
            FLAG = "toggle",
            Callback = function(v)
                print(`toggle: {v}`)
            end
        })
        tab:Toggle({
            Name = "Toggle Link Keybind",
            FLAG = "toggle_lk",
            LinkKeybind = true,
            Callback = function(v)
                print(`toggle_lk: {v}`)
            end
        })
        tab:Dropdown({
            Name = "Dropdown",
            Items = {"A","B","C",{DisplayValue = "D Display",Value = "D"}},
            FLAG = "dropdown",
            Callback = function(v)
                print(`dropdown: {v}`)
            end
        })
        tab:Dropdown({
            Name = "Dropdown Multiselect",
            Items = {"A","B","C",{DisplayValue = "D Display",Value = "D"}},
            FLAG = "dropdown_m",
            Multiselect = true,
            Callback = function(v)
                print(`dropdown_m: {table.concat(v,", ")}`)
            end
        })
        local ExtractItem = function(itemToClean:string):string
            cleanedItem = itemToClean:match('<font color="rgb%(.-%)">(.-)</font>')
            if cleanedItem then
                cleanedItem = cleanedItem:match("^%s*(.-)%s*$")
            end
            return cleanedItem or itemToClean
        end

        tab:Dropdown({
            Name = "Rich Text Example",
            Items = {
                {
                    Value = '<font color="rgb(255,0,0)">apple</font>',
                    Image = randomIcon()
                },
                {
                    Value = "banana",
                    DisplayValue = "Display not banana"
                },
                'carrot',
                'dingleberry',
                'egg plant',
                'frank',
                'grape',
                'helicopter'
            },
            Multiselect = true,
            Regex = ExtractItem,
            FLAG = "dropdown_m2",
            Callback = function(value)
                print(value)
            end
        })
        tab:Slider({
            Name = "Slider",
            Min = 0,
            Max = 100,
            FLAG = "slider",
            Callback = function(v)
                print(`slider: {v}`)
            end
        })
        tab:Keybind({
            Name = "Keybind",
            FLAG = "keybind",
            Callback = function()
                print("keybind")
            end
        })
        tab:ColorPicker({
            Name = "Color Picker",
            FLAG = "colorpicker",
            Callback = function(c, t)
                print(`colorpicker: {c} : {t}`)
            end
        })
        tab:Label("Label")
        tab:Paragraph({
            Title = "Paragraph",
            Body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        })

        --tab:KeybindList()

        tab2:Label("Theme Caching")

        local cachedTheme = ""
        tab2:Button({
            Name = "uid",
            Callback = function()
                print(darius:GetThemeUID())
                cachedTheme = darius:GetThemeUID()
            end
        })
        tab2:Button({
            Name = "set to cached",
            Callback = function()
                darius:SetTheme(cachedTheme)
            end
        })
        tab2:Button({
            Name = "import theme",
            Callback = function()
                darius:ImportTheme({
                    background = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
                })
            end
        })

        tab2:Divider()

        local duration = 0
        local title = ""
        local body = ""

        tab2:TextBox({
            Name = "Title",
            Placeholder = "Placeholder Text!",
            OnLeave = true,
            Default = "Title",
            Callback = function(value)
                title = value
            end
        })
        tab2:TextBox({
            Name = "Body",
            Placeholder = "Placeholder Text!",
            OnLeave = true,
            Default = "Body BODY body",
            Callback = function(value)
                body = value
            end
        })
        tab2:Slider({
            Name = "Duration",
            Min = 0,
            Max = 100,
            Default = 10,
            Callback = function(value)
                duration = value
            end
        })
        tab2:Button({
            Name = "Send notification",
            Callback = function()
                darius:Notify({
                    Title = title,
                    Body = body,
                    Image = randomIcon(),
                    Duration = duration,
                    Buttons = {
                        {
                            Name = "Button",
                            Callback = function()
                                print("Button 1")
                            end
                        },
                        {
                            Name = "Button",
                            Callback = function()
                                print("Button 2")
                            end
                        },
                        {
                            Name = "Button",
                            Callback = function()
                                print("Button 3")
                            end
                        }
                    }
                })
            end
        })


        darius:CreateSettings()
    end)

    return function()
        task.spawn(function()
            darius:Destroy()
        end)
    end
end
