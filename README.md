# Darius 🐳
A Roblox user interface built using [Fusion 0.2](https://elttob.uk/Fusion/0.2/).

Developed by - griffin(@idonthaveoneatm)

Join the Discord [here](https://discord.gg/GtWwgVvm7r) and create a ticket if you want to report a problem. You can also contact me via Discord **@griffindoescooking** with the ID of `691337507157311661`.

Video of user interface: [https://www.youtube.com/watch?v=Rip9_fAe1lY](https://www.youtube.com/watch?v=Rip9_fAe1lY)
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
-- Bundled with wax + minified with darklua
local darius = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/idonthaveoneatm/darius/refs/heads/main/minified.luau"))()
-- rbxm-suite
local darius = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/idonthaveoneatm/darius/refs/heads/main/rbxmSuite.luau"))()
```
### Compatibility
Darius requires a specific environment to run the best. The fake functions that Darius creates allows it to still work but at the cost of there being no **real** files and folders or **real** security.
- Thread identity ≥ 5  *Required*
- writefile, readfile, isfile, delfolder *Fakes functions*
- isfolder, makefolder *Fakes functions*
- listfiles *Fakes function*
- cloneref *Fakes function*
- gethui *Fakes function*

## Create a Window
```lua
local window = darius:Window({
    Title = "Darius",
    Description = "What the sigma this isn't Quantum UI",

    -- Optional
    Icon = "",
    HideBind = Enum.KeyCode.T,
    Parent = target, -- Defaults to game.CoreGui
    UseConfig = false, -- Determines if Workspace is required+enables filesystem for configurationss
    Workspace = "mainWorkspace", -- the name of the darius workspace for configs and themes
    IsMobile = false,
    Theme = { -- Custom theme on launch
        Name = "custom theme",
        Colors = {
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
    Configuration = { -- Information about formatting in Configurations
        Name = "custom configuration",
        Lock = true, -- Defaults to false will make it so a user cannot overwrite this configuration
        FlagValues = {
            textbox = "hey",
            textbox_n = "123",
            toggle = {boolean = true},
            toggle_lk = {boolean = true, keycode = "Q", coordinate = {X = 50, Y = 50}},
            dropdown = "D",
            dropdown_m = {"A","B","C","NOT HERE"},
            slider = 110,
            keybind = {keycode = "H"},
            colorpicker = {color = "#a49ae6", transparency = 0.5}
        }
    }
})
```

## Theming 
You are able to use a multitude of different functions to modify the looks of Darius.
### Importing Theme
You can create a theme with no name that is given the name "Import_abc12" with a random ending. Otherwise give it a name! This function also returns the unique identifier that is given to each theme so that you can set it as the theme.
```lua
-- No Name
darius:ImportTheme({
    toggled = Color3.fromRGB(255,255,255)
}) --> "C3bb2"
-- Name
darius:ImportTheme("New Theme!", {
    toggled = Color3.fromRGB(255,0,0)
}) --> "p4W01"
```
#### List of all color variables:
- background
- background2
- text
- text2
- selectedTab
- scrollBar
- colorpickerBar
- notificationButton
- mobileButtonBackground
- mobileButtonText
- mobileButtonImage
- disabledBackground
- disabledText
- toggled
- red
- orange
### Set Theme
Using that unique identifier you can now set the theme with `:SetTheme`.
```lua
darius:SetTheme("p4w01")
```
### Get Theme Unique Identifier
Returns the unique identifier of the current theme.
```lua
darius:GetThemeUID() --> "p4w01"
```
### Exporting Theme
If you want to export the current theme you can use this.
```lua
darius:ExportTheme() --> "{}" is a JSON table of the current theme
```

## Flags
This is how you can access the callback'd values with flags. You can place these anywhere in your script after the Darius loadstring and if they are placed before the component with that flag they are considered 'preregistered' in that the OnChange won't be fired when the flag is registered normally but they will for default/configurations. `darius.flags.FLAGNAME.Value`, however, does change from nil to the default/config.
```lua
darius.flags.FLAGNAME.Value --> Will be the last set value of the flag
darius.flags.FLAGNAME.OnChange:Connect(function(value): any -- Is fired every time the value of a flag is changed
    print(value)
end)
-- Types are the same as the ones found for each component
```

## Configurations
How to import, export, and set configurations in Darius. This uses flags.
### Importing Configuration
These return the unique identifier like themes.
```lua
-- No Name
darius:ImportConfiguration({
    Lebron = {boolean = false, keycode = "H"}
}) --> "aZ10F"
-- Name
darius:ImportConfiguration("New Configuration", {
    TheGoat = {boolean = true, keycode = "A"}
})--> "Bp5bD"
```
#### List of flag value formats
This is what you can use when creating the `Configuration` in the `:Window` function.
- `:Toggle` = `{boolean = <boolean>, keycode = <string>, coordinate = {X = <number>, Y = <number>}}`
    - The `keycode` is the .Name of a Enum.KeyCode
- `:TextBox` = `<string>`
- `:Slider` = `<number>`
- `:Dropdown` = If `Multiselect` then `{<string>,<string>}` else it is `<string>`
- `:Keybind` = `{keycode = <string>, coordinate = {X = <number>, Y = <number>}}`
    - The `keycode` is the .Name of a Enum.KeyCode
- `:ColorPicker` = `{color = <string>, transparency = <number>}`
    - The color is the Hex code
### Setting Configuration
Using a unique identifier you can set the configuration.
```lua
darius:SetConfiguration("Bp5bD")
```
### Getting Configuration Unique Identifier
Returns current configuration's unique identifier.
```lua
darius:GetConfigurationUID() --> "Bp5bD"
```
### Exporting Configuration
If you want to export the current configuration you can use this.
```lua
darius:ExportConfiguration() --> "{}" is a JSON table of the current configuration
```
### Darius Folder
Gives you strings to the folder created for the `Workspace` provided.
```lua
...
    Workspace = "darius rocks",
...
print(darius.Folder) --> darius/darius rocks
```

## Settings Page
Adding this function **after** you create your tabs adds a "⚙️ Settings" tab with a theme and configuration manager.
```lua
darius:CreateSettings()
```

## Notify the User
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

## Destroying Darius
You can connect functions to run when Darius is destroyed by connectiong to `darius.OnDestruction`. You can also check if Darius has been destroyed with `darius.Destroyed`. All toggles will be toggled off on destruction.
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
    Visible = false, -- Defaults true
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
## Create Button Group
This was made specifically for the configuration manager and allows you to add buttons in a horizontal list. It only has the `:Button` component
```lua
tab:ButtonGroup()
```
## Create a Dropdown
```lua
local dropdown = tab:Dropdown({
    Name = "Single Item Selection",
    Items = {
        { -- Special Item Customization
            Image = "", -- rbxassetid:// or getcustomasset
            DisplayValue = "Green Apple", -- will display Green Apple but callback Apple
            Value = "Apple"
        }, 
    "Banana", "Carrot", "Dingleberry", "Eggplant", "Fruit", "Grape", "Hen", "India", "Jumprope", "Kite", "Lime","Music","Number","Omega","Pencil","Quadrant", "Rust"},
    Callback = function(value): string | table
        print(value)
    end,

    -- Optional
    Visible = false, -- Defaults true
    IsEnabled = false, -- Defaults true
    IgnoreConfig = true, -- Defaults false
    DisabledText = "Hey you cant use this!",
    Alphabetical = true, -- Defaults false
    AlwaysOpen = true, -- Defaults false
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
    Visible = false, -- Defaults true
    IsEnabled = false, -- Defaults true
    IgnoreConfig = true, -- Defaults false
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
    Visible = false, -- Defaults true
    IsEnabled = false, -- Defaults true
    IgnoreConfig = true, -- Defaults false
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
    Visible = false, -- Defaults true
    IsEnabled = false, -- Defaults true
    IgnoreConfig = true, -- Defaults false
    DisabledText = "Hey you cant use this!",
    FLAG = "slider",
    Default = 10,
    DisplayAsPercent = false,
    DecimalPlace = 2 -- Would return 0.00 places
})
```
### Returned Functions
```lua
slider:SetValue(10)
```
## Create a TextBox
```lua
local textbox = tab:TextBox({
    Name = "Enter Text",
    Callback = function(value): string

    end,

    -- Optional
    Visible = false, -- Defaults true
    IsEnabled = false, -- Defaults true
    IgnoreConfig = true, -- Defaults false
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
## Create a Color Picker
```lua
local colorpicker = tab:ColorPicker({
    Name = "Color Picker",
    Callback = function(color, transparency): Color3, number

    end,

    -- Optional
    Visible = false, -- Defaults true
    IsEnabled = false, -- Defaults true
    IgnoreConfig = true, -- Defaults false
    HideTransparency = true, -- Defaults false
    FLAG = "colorpicker",
    Color = Color3.fromHex("#a49ae6"), -- Best color
    Transparency = 0.5
})
```
### Returned Functions
```lua
colorpicker:SetColor(Color3.new(1,0,0))
colorpicker:SetTransparency(0)
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
    Body = "\tBODY\n Body\n body",

    -- Optional
    Visible = false -- Defaults true
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
## Create a Keybind List
```lua
tab:KeybindList()
```
## Universal*ish* Returned Functions
**EXCLUDES** `:Tab :Window :Label :Divider :Paragraph :KeybindList :ButtonGroup`
```lua
<Component>:Enable()
<Component>:Disable()
<Component>:SetName("New Name")
<Component>:Visible() -- Includes :Label :Paragraph :ButtonGroup
<Component>:Invisibile() -- Includes :Label :Paragraph :ButtonGroup
```