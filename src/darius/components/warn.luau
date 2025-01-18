local darius = script.Parent.Parent
local title = ""

local returnTable = {}
table.insert(returnTable, function(body)
    local bundles = require(darius.Bundles)
    local notificaton = require(script.Parent.notification)
    local references = require(darius.utilities).references
    local icons = bundles.icons
    local theme = bundles.themeSystem
    notificaton({
        Parent = references.get("notificationList"),
        Title = title,
        Body = body,
        Duration = 3,
        Image = icons.alert,
        ImageColor = theme.get("red")
    })
end)
table.insert(returnTable, function(newTitle)
    title = newTitle
end)

return returnTable