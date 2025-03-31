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
        textbox = "testing123"
    }
}
customFunctions.makefolder("darius")
customFunctions.makefolder("darius/testing")
customFunctions.makefolder("darius/testing/configurations")
customFunctions.writefile("darius/testing/configurations/FIVE5.json", HttpService:JSONEncode(fakeData))

local randomIcons = {}
for _,v in lucide do
    table.insert(randomIcons, v)
end
local function randomIcon():string
    return randomIcons[math.floor(math.random(1,#randomIcons))]
end


--local ripFile = [[{"palette":{"disabledText":"d6dce0","text2":"b7a6d4","mobileButtonText":"2c2f33","disabledBackground":"2a2c31","mobileButtonImage":"2c2f33","text":"edebf2","background2":"0f0c15","notificationButton":"222427","orange":"b7a6d4","toggled":"b7a6d4","mobileButtonBackground":"dce1e5","colorpickerBar":"dce1e5","background":"1c1726","selectedTab":"1d1827","red":"b7a6d4"},"uid":"APunF","name":"rip"}]]
--[[]]--customFunctions.writefile("darius/themes/APunF.json", ripFile)

return function(target)
    task.spawn(function()
        local window = darius:Window({
            Title = "Darius",
            Description = "What the sigma this isn't Quantum UI",
            HideBind = Enum.KeyCode.T,
            UseConfig = true,
            Workspace = "testing",
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
            FLAG = "textbox",
            Callback = function(v)
                print(v)
            end
        })
        tab:TextBox({
            Name = "Much larger text box title",
            Callback = function(v)

            end
        })
        tab:Button({
            Name = "print :ExportTheme",
            Callback = function()
                print(darius:ExportTheme())
            end
        })
        darius:CreateSettings()

        darius:LoadConfig()
    end)

    return function()
        task.spawn(function()
            darius:Destroy()
        end)
    end
end
