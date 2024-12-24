local rbxmSuite = loadstring(game:HttpGetAsync("https://github.com/richie0866/rbxm-suite/releases/latest/download/rbxm-suite.lua"))()
local path = rbxmSuite.download("idonthaveoneatm/darius@latest", "darius.rbxm")
local model = rbxmSuite.launch(path)
return rbxmSuite.require(model)