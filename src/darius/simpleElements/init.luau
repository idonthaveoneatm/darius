return setmetatable({},{
    __index = function(self, key)
        if script:FindFirstChild(key) then
            return require(script[key])
        else
            error("no utility: "..key)
        end
    end
})