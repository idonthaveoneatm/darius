--[[

Made by griffin
Discord: @griffindoescooking
Github: https://github.com/idonthaveoneatm
loadstring(game:HttpGet("http://127.0.0.1:5500/example/source.luau"))()

]]--

local start = tick()

local characters = string.split("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890","")
local function randomString(length)
    if length > 0 then
        return randomString(length - 1) .. characters[math.random(1, #characters)]
    else
        return ""
    end
end

local fakeData = {
	['dropdown'] = {"apple"},
	['dropdown_m'] = {"apple", "carrot", "banana"},
	['keybind'] = {keycode = Enum.KeyCode.Q.Name, coordinate = "0,0"},
	['toggle_lk'] = {boolean = true, keycode = Enum.KeyCode.E.Name},
	['toggle'] = {boolean = true},
	['slider'] = 50,
	['textbox'] = "heyy",
	['textbox_n'] = "1121212"
}

local lucide = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/idonthaveoneatm/darius/refs/heads/main/example/lucide.luau"))()
local randomIcons = {}
for _,v in lucide do
    table.insert(randomIcons, v)
end
local function randomIcon():string
    return randomIcons[math.floor(math.random(1,#randomIcons))]
end

local format = "minified"
local branch = "beta"
--local darius = loadstring(game:HttpGetAsync(`https://raw.githubusercontent.com/idonthaveoneatm/darius/refs/heads/{branch}/{format}.luau`))()
local darius = loadstring(game:HttpGetAsync(`http://127.0.0.1:5500/{format}.luau`))()
local window = darius:Window({
    Title = "Darius",
    Description = "What the sigma this isn't Quantum UI",
    HideBind = Enum.KeyCode.T,
    IsMobile = false
})
--[[
print("UseConfig=false\n\tNo LoadConfig\n\tall defaults")
for i,v in fakeData do
    darius.flags[i].OnChange:Connect(function(value)
        print(`{i}: "{value}"`)
    end)
end]]

local tab = window:Tab({
    Name = randomString(6),
    Image = randomIcon()
})
local tab2 = window:Tab({
    Name = randomString(6),
    Image = randomIcon()
})
for i=1,10 do
    window:Tab({
        Name = randomString(6),
        Image = randomIcon()
    })
end

local a
local togled = false

tab:Button({
    Name = "Button",
    Callback = function()
        a:SetValue(togled)
        togled = not togled
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
    Name = "Multiselect Dropdown",
    Items = {
        {
            Value = '<font color="rgb(255,0,0)">apple</font>',
            Image = randomIcon()
        },
        'banana',
        'carrot',
        'dingleberry',
        'egg plant',
        'frank',
        'grape',
        'helicopter'
    },
    Multiselect = true,
    Regex = ExtractItem,
    FLAG = "dropdown_m",
    Callback = function(value)
        for i,v in darius.flags.dropdown_m.Value do
            print(i,v)
        end
    end
})
tab:Dropdown({
    Name = "Dropdown",
    Items = {
        "Legit", "Blatant"
    },
    Multiselect = false,
    FLAG = "dropdown",
    Regex = ExtractItem,
    Default = "Blatant",
    Callback = function(value)
        print(darius.flags.dropdown.Value)
    end
})

a = tab:Toggle({
    Name = "Toggle",
    Default = false,
    LinkKeybind = true,
    Bind = Enum.KeyCode.E,
    FLAG = "toggle_lk",
    Callback = function(value)
        print(darius.flags.toggle_lk.Value)
    end
})
local b
b = tab:Toggle({
    Name = "Disable first toggle",
    Default = false,
    FLAG = "toggle",
    Callback = function(v)
        print(darius.flags.toggle.Value)
        if v then
            a:Disable()
            b:SetName("Enable first toggle")
        else
            a:Enable()
            b:SetName("Disable first toggle")
        end
    end
})

tab:Keybind({
    Name = "Keybind",
    FLAG = "keybind",
    Callback = function()
        print("Keybind ran")
    end
})

print(darius.flags.slider.Value)

tab:Slider({
    Name = "Slider",
    Min = 0,
    Max = 100,
    Default = 10,
    FLAG = "slider",
    Callback = function(value)
        print(darius.flags.slider.Value)
    end
})

print(darius.flags.slider.Value)

tab:TextBox({
    Name = "TextBox Numbers",
    Placeholder = "Only Numbers",
    ClearTextOnFocus = false,
    OnlyNumbers = true,
    OnLeave = true,
    Default = "",
    FLAG = "textbox_n",
    Callback = function(value)
        print(darius.flags.textbox_n.Value)
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
        print(darius.flags.textbox.Value)
    end
})

tab:Label("Label")
tab:Paragraph({
    Title = "Paragraph",
    Body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
})

tab:Divider()
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

darius.OnDestruction:Connect(function()
    print("Goodbye Darius!")
end)

print(`loaded in: {tick() - start}`)