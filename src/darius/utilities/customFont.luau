local fonts = {
    ["Inter"] = "rbxassetid://12187365364",
    ["Montserrat"] = "rbxassetid://11702779517"
}

return function(font:string, weight:Enum.FontWeight?, style:Enum.FontStyle?)
    assert(font, "font required")
    weight = weight or Enum.FontWeight.Regular
    style = style or Enum.FontStyle.Normal
    if fonts[font] then
        return Font.new(fonts[font],weight,style)
    else
        error("no font:", font)
    end
end