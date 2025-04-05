local script = game.ReplicatedStorage.darius
local darius = require(script)
local randomString = require(script.utilities).randomString
local HttpService = require(script.Bundles).services.HttpService
local customFunctions = require(script.utilities).customFunctions

local fakeData = {
    --['dropdown'] = "apple",
    ['colorpicker'] = {color = "0.1,0.2,0.5",transparency = 0.5}
}
customFunctions.makefolder("darius")
customFunctions.makefolder("darius/test")
customFunctions.writefile("darius/test/config.json", HttpService:JSONEncode(fakeData))


local function randomIcon():string
    return ""
end
local window = darius:Window({
    Title = "Darius",
    Description = "What the sigma this isn't Quantum UI",
    HideBind = Enum.KeyCode.T,
    UseConfig = true,
	Workspace = "example",
    IsMobile = true,
    Theme = {
		Name = "Theme",
		Colors = {
			background = Color3.fromHex("#D6DCE0"),
			text = Color3.fromHex("#2A2C31"),
			text2 = Color3.fromHex("#7D8694"),
			background2 = Color3.fromHex("#E7E9EF"),
			selectedTab = Color3.fromHex("#FAFFFF"),

			colorpickerBar = Color3.fromHex("#2C2F33"),

			notificationButton = Color3.fromHex("#E7E9EF"),

			mobileButtonBackground = Color3.fromHex("#2A2C31"),
			mobileButtonText = Color3.fromHex("#E7E9EF"),
			mobileButtonImage = Color3.fromHex("#7D8694"),

			disabledBackground = Color3.fromHex("#2A2C31"),
			disabledText = Color3.fromHex("#D6DCE0"),

			toggled = Color3.fromHex("#2A2C31")
		}
    },

    Parent = game.Players.LocalPlayer.PlayerGui
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

tab:ColorPicker({
    Name = "Colorpicker",
    --Color = Color3.fromHex('#a49ae6'),
    --Transparency = 0.5,
    FLAG = "colorpicker",
    Callback = function(color,transparency)

    end
})
tab:KeybindList()
tab:Keybind({
    Name = "Hello Hello",
    Callback = function()
    end
})
