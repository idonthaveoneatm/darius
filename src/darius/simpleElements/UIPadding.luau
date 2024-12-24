local Fusion = require(script.Parent.Parent.Bundles.Fusion)

return function(...)
    local args = {...}
    if #args == 1 then
        return Fusion.New "UIPadding" {
            PaddingLeft = UDim.new(0,...),
            PaddingRight = UDim.new(0,...),
            PaddingTop = UDim.new(0,...),
            PaddingBottom = UDim.new(0,...),
        }
    elseif #args == 2 then
        return Fusion.New "UIPadding" {
            PaddingTop = UDim.new(0,args[1]),
            PaddingRight = UDim.new(0,args[2]),
            PaddingBottom = UDim.new(0,args[1]),
            PaddingLeft = UDim.new(0,args[2]),
        }
    elseif #args == 3 then
        return Fusion.New "UIPadding" {
            PaddingTop = UDim.new(0,args[1]),
            PaddingRight = UDim.new(0,args[2]),
            PaddingBottom = UDim.new(0,args[3]),
            PaddingLeft = UDim.new(0,args[2]),
        }
    else
        return Fusion.New "UIPadding" {
            PaddingTop = UDim.new(0,args[1]),
            PaddingRight = UDim.new(0,args[2]),
            PaddingBottom = UDim.new(0,args[3]),
            PaddingLeft = UDim.new(0,args[4]),
        }
    end
end