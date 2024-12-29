# Darius 🐳
A Roblox user interface built using [Fusion 0.2](https://elttob.uk/Fusion/0.2/).

Developed by - griffin(@idonthaveoneatm)

Contact me via Discord **@griffindoescooking** for any problems or questions

Video of user interface: [https://www.youtube.com/watch?v=-yLwTmJhK7A](https://www.youtube.com/watch?v=-yLwTmJhK7A)
### Credits:
- [biggaboy212](https://github.com/biggaboy212) - Basically the entire design
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) - Code for slider math
- [dawid-scripts/Fluent](https://github.com/dawid-scripts/Fluent/) - Lucide icons
- [lucide.dev](https://lucide.dev/) - More Lucide icons
- [latte-soft/wax](https://github.com/latte-soft/wax) - Bundler
- [richie0866/rbxm-suite](https://github.com/richie0866/rbxm-suite) - Release
# Launching Darius
Each type varies in compatbility
```lua
-- Bundled with wax
local darius = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/idonthaveoneatm/darius/refs/heads/main/bundled.luau"))()
-- Bundled + Minified via darklua
local darius = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/idonthaveoneatm/darius/refs/heads/main/minified.luau"))()
-- rbxm-suite
local darius = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/idonthaveoneatm/darius/refs/heads/main/rbxmSuite.luau"))()
```
## Create a Window
```lua
local window = darius:Window({
    Title = "Darius",
    Description = "What the sigma this isn't Quantum UI",

    -- Optional
    HideBind = Enum.KeyCode.T,
    Parent = target, -- Defaults to game.CoreGui
    UseConfig = false,
    Config = "config",
    IsMobile = false,
    Theme = {} -- Custom theme on launch
})
```
### Setting the theme
You can set the colors you want and leave the else to default.
```lua
darius:SetTheme({
    toggled = Color3.fromRGB(255,255,255)
})
--[[
List of all color variables:

background
background2
text
text2
selectedTab

notificationButton

mobileButtonBackground
mobileButtonText
mobileButtonImage

disabledBackground
disabledText

toggled

red
orange
]]
```
### Notify a User
```lua
darius:Notify({
    Title = "the title",
    Body = "the body",
    Duration = 10,

    -- Optional
    Image = "", -- rbxassetid:// or getcustomasset
    ImageColor = Color3.fromRGB(255,0,0),
    Buttons = {
        {
            Name = "Click me!",
            Callback = function()
                print("You clicked!")
            end
        }
    }
})
```
### Loading config
Place this at the **END** of your implementation of the user interface. See [here](https://github.com/idonthaveoneatm/darius/blob/main/example/source.luau) for an example.
```lua
darius:LoadConfig()
```
### Flags
This is how you can access the callback'd values with flags.
```lua
darius.flags.FLAGNAME.Value --> Will be the last set value of the flag
darius.flags.FLAGNAME.OnChange:Connect(function(value): any -- Is fired every time the value of a flag is changed
    print(value)
end)
-- Types are the same as the ones found for each component
```
### Darius Folder and File
If `UseConfig = true` then `darius.Folder` and `darius.File` will give you strings to the folder and the config file created.
```lua
...
    UseConfig = true,
    Config = "darius rocks",
...
print(darius.Folder) --> darius/darius rocks
print(darius.File) --> darius/darius rocks/config.json
```
### Destroying Darius
You can also connect functions to run when Darius is destroyed by connectiong to `darius.OnDestruction`. You can also check if Darius has been destroyed with `darius.Destroyed`.
```lua
darius.OnDestruction:Connect(function()
    print("Destroying Darius")
end)
print(darius.Destroyed) --> false
darius:Destroy()
print(darius.Destroyed) --> true
-- In console it would print "Destroying Darius"
```
## Create a Tab
```lua
local tab = window:Tab({
    Name = "Tab Name",

    -- Optional
    Image = "" -- rbxassetid:// or getcustomasset
})
```
## Create a Button
```lua
local button = tab:Button({
    Name = "Interact With Me!",
    Callback = function(): nil
        print("Hello World!")
    end,

    -- Optional
    IsEnabled = false, -- Defaults true
    DisabledText = "Hey you cant use this!"
})
```
### Returned Functions
```lua
button:SetCallback(function()
    print("Goodbye World!")
end)
button:Fire()
```
## Create a Dropdown
```lua
local dropdown = tab:Dropdown({
    Name = "Single Item Selection",
    Items = {
        { -- Special Item Customization
            Image = "", -- rbxassetid:// or getcustomasset
            Value = "Apple"
        }, 
    "Banana", "Carrot", "Dingleberry", "Eggplant", "Fruit", "Grape", "Hen", "India", "Jumprope", "Kite", "Lime","Music","Number","Omega","Pencil","Quadrant", "Rust"},
    Callback = function(value): string | table
        print(value)
    end,

    -- Optional
    IsEnabled = false, -- Defaults true
    DisabledText = "Hey you cant use this!",
    FLAG = "dropdown_SingleSelection",
    Default = "" or {}, -- Table if Multiselect and string if not
    Multiselect = false,
    Regex = function(itemToClean)
    -- MUST RETURN A STRING NO MATTER WHAT
        local cleanedItem = itemToClean
        return cleanedItem or itemToClean
    end
})
```
### Returned Functions
```lua
dropdown:SetItems({})
dropdown:SelectItem("") -- When Multiselect is false
dropdown:SelectItems({}) -- When Multiselect is true
```
## Create a Toggle
```lua
local toggle = tab:Toggle({
    Name = "Toggle Me!",
    Callback = function(value): boolean
        
    end,

    -- Optional
    IsEnabled = false, -- Defaults true
    DisabledText = "Hey you cant use this!",
    FLAG = "toggle_LinkKeybind",
    Default = false,
    LinkKeybind = true,
    Bind = Enum.KeyCode.E
})
```
### Returned Functions
```lua
toggle:SetValue(true) -- Fires with desired value
toggle:SetBind(Enum.KeyCode.R) -- Only if LinkKeybind
```
## Create a Keybind
```lua
local keybind = tab:Keybind({
    Name = "Binded Action",
    Callback = function(): nil
        
    end,

    -- Optional
    IsEnabled = false, -- Defaults true
    DisabledText = "Hey you cant use this!",
    FLAG = "keybind",
    Bind = Enum.KeyCode.F
})
```
### Returned Functions
```lua
keybind:SetBind(Enum.KeyCode.Q)
```
## Create a Slider
```lua
local slider = tab:Slider({
    Name = "Slide Me!",
    Min = 0,
    Max = 100,
    Callback = function(value): number
        
    end,

    -- Optional
    IsEnabled = false, -- Defaults to true
    DisabledText = "Hey you cant use this!",
    FLAG = "slider",
    Default = 10,
    DisplayAsPercent = false,
    DecimalPlace = 2 -- Would return 0.00 places
})
```
### Returned Functions
```lua
slider:SetValue(10) -- Fires callback
```
## Create a TextBox
```lua
local textbox = tab:TextBox({
    Name = "Enter Text",
    Callback = function(value): string

    end,

    -- Optional
    IsEnabled = false,
    DisabledText = "Hey you cant use this!",
    FLAG = "textbox",
    Default = "Hey",
    OnlyNumbers = false,
    OnLeave = false,
    ClearTextOnFocus = false,
    PlaceHolderText = "Input is here"
})
```
### Returned Functions
```lua
textbox:SetInput("New Hey")
```
## Create a Label
```lua
local label = tab:Label("heyo")
```
### Returned Functions
```lua
label:SetText("say heyo")
```
## Create a Paragraph
```lua
local paragraph = tab:Paragraph({
    Title = "Title here",
    Body = "\tBODY\n Body\n body"
})
```
### Returned Functions
```lua
paragraph:SetTitle("New Title")
paragraph:SetBody("New Title")
```
## Creata a Divider
```lua
tab:Divider()
```
## Universal Returned Functions
**EXCLUDES** :Tab :Window :Label :Divider :Paragraph
```lua
<Component>:Enable()
<Component>:Disable()
<Component>:SetName("New Name")
```