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
customFunctions.makefolder("darius/themes")
customFunctions.writefile("darius/test/config.json", HttpService:JSONEncode(fakeData))

local randomIcons = {}
for _,v in lucide do
    table.insert(randomIcons, v)
end
local function randomIcon():string
    return randomIcons[math.floor(math.random(1,#randomIcons))]
end


local ripFile = [[{"palette":{"disabledText":"d6dce0","text2":"b7a6d4","mobileButtonText":"2c2f33","disabledBackground":"2a2c31","mobileButtonImage":"2c2f33","text":"edebf2","background2":"0f0c15","notificationButton":"222427","orange":"b7a6d4","toggled":"b7a6d4","mobileButtonBackground":"dce1e5","colorpickerBar":"dce1e5","background":"1c1726","selectedTab":"1d1827","red":"b7a6d4"},"uid":"APunF","name":"rip"}]]
--[[customFunctions.writefile("darius/themes/rip-APunF.json", ripFile)

return function(target)
        local window = darius:Window({
            Title = "Darius",
            Description = "What the sigma this isn't Quantum UI",
            HideBind = Enum.KeyCode.T,
            UseConfig = true,
            Config = "test",
            IsMobile = false,
            Theme = {
                Name = "apple cider",
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
                }
            },
            noOffset = true,
            Parent = target
        })

        local tab = window:Tab({
            Name = "Main",
        })

        tab:TextBox({
            Name = "Textbox",
            PlaceHolderText = "Hello!",
            Callback = function(v)

            end
        })
        tab:TextBox({
            Name = "Much larger text box title",
            Callback = function(v)

            end
        })
        darius:CreateSettings()

        darius:LoadConfig()

    return function()
        task.spawn(function()
            darius:Destroy()
        end)
    end
end
]]