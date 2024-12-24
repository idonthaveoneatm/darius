return function(text:string, properties)
    text = text or ""
    local params = Instance.new("GetTextBoundsParams")
    params.Text = text
    params.Font = properties.Font
    params.Size = properties.Size
    params.Width = properties.Width
    local TextService = require(script.Parent.Parent.Bundles.services).TextService
    return TextService:GetTextBoundsAsync(params)
end