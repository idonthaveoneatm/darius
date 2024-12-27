local darius = script.Parent.Parent
return function(property)
    local bundles = require(darius.Bundles)
    local theme = bundles.themeSystem
    local Fusion = bundles.Fusion
        local new = Fusion.New
        local onevent = Fusion.OnEvent
        local children = Fusion.Children
        local value = Fusion.Value
        local computed = Fusion.Computed

    local utilities = require(darius.utilities)
    local get = utilities.get
    local animate = utilities.animate
    local getStringBounds = utilities.getStringBounds
    local customFont = utilities.customFont
    local typecheck = utilities.typecheck

    local simpleElements = require(darius.simpleElements)
    local UICorner = simpleElements.UICorner
    local UIPadding = simpleElements.UIPadding
    local UIListLayout = simpleElements.UIListLayout
    local SO = Enum.SortOrder
    local FD = Enum.FillDirection
    local HA = Enum.HorizontalAlignment
    local VA = Enum.VerticalAlignment

    -- Typecheck

    local didPass, failedItems = typecheck(property, {
        Title = "",
        Body = "",
        Duration = 1,
        Image = "",
        ImageColor = Color3.fromRGB(0,0,0),
        Buttons = {}
    }, {
        property.Image and "" or "Image",
        property.ImageColor and "" or "ImageColor",
        property.Buttons and "" or "Buttons"
    })
    assert(didPass, table.concat(failedItems, "\n"))

    -- Properties

    local title = value(property.Title)
    local body = value(property.Body)
    local duration = value(property.Duration)
    local image = value(property.Image or "")
    local imageColor = property.ImageColor and value(property.ImageColor) or theme.text
    local buttons = value(property.Buttons or {})

    -- Variables

    local loaded = value(false)
    local resized = value(false)
    local hideNotification = value(false)
    local tickText = value("")
    local width = value(250)
    local bodyBounds = value(getStringBounds(get(body), {
        Size = 14,
        Font = customFont("Montserrat", Enum.FontWeight.Medium),
        Width = get(width) - 8 - (image and 32 or 0)
    }))
    local height = value(20 + math.clamp(get(bodyBounds).Y + 4 + 10 + (#get(buttons) > 0 and 26 or 0), #get(buttons) > 0 and 56 or 30, 9e9))
    local function roundTo(decimal, number)
        local point = 1
        for _=1,decimal do
            point = point*10
        end
        local stringed = tostring(math.round(number*point)/point)
        local tstringed = string.split(stringed, ".")
        if #tstringed == 1 then
            local zeros = ""
            for i=1,decimal do
                zeros = zeros.."0"
            end
            stringed = stringed.."."..zeros
        end
        return stringed
    end

    -- Instances
    local newNotification

    local buttonInstances = {}
    for _,buttonInfo in get(buttons) do
        local _didPass, _failedItems = typecheck({Button = buttonInfo}, {Button = {}})
        assert(_didPass, table.concat(_failedItems, "\n"))
        _didPass, _failedItems = typecheck(buttonInfo, {Name = "", Callback = function()end})
        assert(_didPass, table.concat(_failedItems, "\n"))

        local name = buttonInfo.Name
        local callback = buttonInfo.Callback
        local instance = new "TextButton" {
            Size = UDim2.new(1/#get(buttons), -2, 1, -4),
            TextSize = 14,
            Text = name,
            FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
            BackgroundColor3 = theme.notificationButton,
            TextColor3 = theme.text,

            [onevent "Activated"] = function()
                task.spawn(callback)
                resized:set(false)
                task.wait(0.4)
                loaded:set(false)
                task.delay(0.3, function()
                    hideNotification:set(true)
                end)
                task.wait(2)
                newNotification:Destroy()
            end,

            [children] = {
                UICorner(4)
            }
        }
        table.insert(buttonInstances, instance)
    end

    newNotification = new "Frame" {
        Parent = property.Parent,
        BackgroundTransparency = 1,
        Size = animate(function()
            return UDim2.fromOffset(get(width), get(loaded) and get(height) + 5 or 0)
        end, 30, 1),
        ClipsDescendants = true,

        [children] = {
            new "TextButton" {
                Visible = computed(function()
                    return not get(hideNotification)
                end),
                Interactable = resized,
                AnchorPoint = Vector2.new(0,1),
                Position = UDim2.fromScale(0,1),
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(get(width), get(height)),

                [onevent "Activated"] = function()
                    resized:set(false)
                    task.wait(0.4)
                    loaded:set(false)
                    task.delay(0.3, function()
                        hideNotification:set(true)
                    end)
                    task.wait(2)
                    newNotification:Destroy()
                end
            },
            new "Frame" {
                AnchorPoint = Vector2.new(0,1),
                BackgroundColor3 = theme.background,
                Size = UDim2.fromOffset(get(width), get(height)),
                Position = animate(function()
                    return UDim2.fromScale(get(resized) and 0 or 1.2, 1)
                end,30,1),

                [children] = {
                    UIPadding(0,4),
                    UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Left,VA.Center,UDim.new(0,4)),
                    UICorner(4),
                    new "Frame" {
                        Visible = get(image) ~= "" and true or false,
                        Size = UDim2.new(0,24,1,0),
                        BackgroundTransparency = 1,

                        [children] = {
                            new "ImageLabel" {
                                Size = UDim2.fromOffset(24,24),
                                AnchorPoint = Vector2.new(0.5,0.5),
                                Position = UDim2.fromScale(0.5,0.5),
                                BackgroundTransparency = 1,
                                Image = image,
                                ImageColor3 = imageColor
                            }
                        }
                    },
                    new "Frame" {
                        Size = UDim2.new(1,get(image) ~= "" and -28 or 0,1,0),
                        BackgroundTransparency = 1,

                        [children] = {
                            UIPadding(2,0),
                            UIListLayout(SO.LayoutOrder,FD.Vertical,HA.Left,VA.Top),
                            new "TextLabel" {
                                Size = UDim2.new(1,0,0,16),
                                BackgroundTransparency = 1,
                                FontFace = customFont("Montserrat", Enum.FontWeight.Bold),
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextSize = 16,
                                RichText = true,

                                TextColor3 = theme.text,
                                Text = title
                            },
                            new "TextLabel" {
                                Size = UDim2.new(1,0,0,1),
                                AutomaticSize = Enum.AutomaticSize.Y,
                                Position = UDim2.fromOffset(8,25),
                                BackgroundTransparency = 1,
                                FontFace = customFont("Montserrat", Enum.FontWeight.Medium),
                                TextSize = 14,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextYAlignment = Enum.TextYAlignment.Top,
                                TextWrapped = true,
                                RichText = true,

                                TextColor3 = theme.text2,
                                Text = body
                            },
                            new "Frame" {
                                Visible = computed(function()
                                    return #get(buttons) > 0 and true or false
                                end),
                                Size = UDim2.new(1,0,0,26),
                                BackgroundTransparency = 1,

                                [children] = {
                                    UIListLayout(SO.LayoutOrder,FD.Horizontal,HA.Center,VA.Center,UDim.new(0,2)),
                                    buttonInstances
                                }
                            },
                            new "TextLabel" {
                                Size = UDim2.new(1,0,0,10),
                                FontFace = customFont("Montserrat", Enum.FontWeight.Medium),
                                Text = tickText,
                                TextColor3 = theme.text,
                                TextSize = 10,
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Right
                            }
                        }
                    }
                }
            }
        }
    }

    task.delay(0.4,function()
        resized:set(true)
    end)
    task.spawn(function()
        repeat task.wait() until get(resized)
        local startTick = tick()
        local endTick
        repeat
            endTick = tick() - startTick
            tickText:set(roundTo(1,math.clamp(endTick,0,get(duration))))
            task.wait()
        until endTick > get(duration)
    end)
    task.spawn(function()
        loaded:set(true)
        repeat task.wait() until get(resized)
        task.wait(get(duration))
        task.wait(0.2)
        resized:set(false)
        task.wait(0.4)
        loaded:set(false)
        task.delay(0.3, function()
            hideNotification:set(true)
        end)
        task.wait(2)
        newNotification:Destroy()
    end)
end