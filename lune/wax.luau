--[[
    Wax - A Fast Runtime-Based Lua 5.1x+/Luau Project Bundler, Using Roblox Models and Module-Require Semantics
    MIT License | Copyright (c) 2023-2024 Latte Softworks <https://latte.to>
]]

local WaxVersion = "latest"

local net = require("@lune/net")
local luau = require("@lune/luau")

local FileLink = if string.lower(WaxVersion) == "latest" then
    "https://github.com/latte-soft/wax/releases/latest/download/wax.luau"
else `https://github.com/latte-soft/wax/releases/download/{WaxVersion}/wax.luau`

luau.load(net.request(FileLink).body, {
    debugName = "Wax",
})()