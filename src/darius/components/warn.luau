local darius = script.Parent.Parent
return function(body)
    local bundles = require(darius.Bundles)
    local notificaton = require(script.Parent.notification)
    local references = require(darius.utilities).references
    local icons = bundles.icons
    local theme = bundles.themeSystem
    notificaton({
        Parent = references.get("notificationList"),
        Title = "Darius Interface",
        Body = body,
        Duration = 3,
        Image = icons.alert,
        ImageColor = theme.get("red")
    })
end