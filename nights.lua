local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local playerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Create the Orange UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OrangeUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Enhanced color scheme
local colors = {
    background = Color3.fromRGB(40, 35, 30),
    primary = Color3.fromRGB(255, 120, 50),
    secondary = Color3.fromRGB(70, 50, 40),
    accent = Color3.fromRGB(255, 150, 80),
    text = Color3.fromRGB(240, 240, 240),
    toggleOn = Color3.fromRGB(100, 200, 100),
    toggleOff = Color3.fromRGB(200, 80, 80),
    dropdownToggleOn = Color3.fromRGB(255, 140, 60),
    dropdownToggleOff = Color3.fromRGB(180, 80, 50),
    sliderTrack = Color3.fromRGB(80, 60, 50),
    sliderFill = Color3.fromRGB(255, 140, 60),
    inputBackground = Color3.fromRGB(50, 40, 35),
    light = Color3.fromRGB(80, 60, 50),
    border = Color3.fromRGB(100, 70, 50),
    tabActive = Color3.fromRGB(255, 120, 50),
    tabInactive = Color3.fromRGB(70, 50, 40),
    notification = Color3.fromRGB(255, 100, 50),
    dropdownClose = Color3.fromRGB(255, 80, 40),
    reopenButton = Color3.fromRGB(255, 100, 50),
    labelDefault = Color3.fromRGB(240, 240, 240),
    labelTitle = Color3.fromRGB(255, 180, 100),
    labelWarning = Color3.fromRGB(255, 100, 100),
    labelSuccess = Color3.fromRGB(100, 255, 100),
    labelInfo = Color3.fromRGB(100, 180, 255),
    labelSection = Color3.fromRGB(255, 140, 60)
}

-- Mobile reopen button
local reopenButton = Instance.new("TextButton")
reopenButton.Size = UDim2.new(0, 50, 0, 50)
reopenButton.Position = UDim2.new(1, -70, 1, -70)
reopenButton.Text = "X"
reopenButton.Font = Enum.Font.GothamBold
reopenButton.TextSize = 24
reopenButton.TextColor3 = colors.text
reopenButton.BackgroundColor3 = colors.reopenButton
reopenButton.BorderSizePixel = 0
reopenButton.Visible = false
reopenButton.ZIndex = 10
reopenButton.Parent = screenGui

local reopenCorner = Instance.new("UICorner")
reopenCorner.CornerRadius = UDim.new(1, 0)
reopenCorner.Parent = reopenButton

-- Notification system
local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0, 320, 0, 90)
notificationFrame.Position = UDim2.new(0.5, -160, 1, -100)
notificationFrame.BackgroundColor3 = colors.notification
notificationFrame.BorderSizePixel = 0
notificationFrame.Visible = false
notificationFrame.ZIndex = 100
notificationFrame.Parent = screenGui

local notificationCorner = Instance.new("UICorner")
notificationCorner.CornerRadius = UDim.new(0, 8)
notificationCorner.Parent = notificationFrame

local notificationLabel = Instance.new("TextLabel")
notificationLabel.Size = UDim2.new(1, -20, 0.7, -5)
notificationLabel.Position = UDim2.new(0, 10, 0, 5)
notificationLabel.BackgroundTransparency = 1
notificationLabel.TextColor3 = colors.text
notificationLabel.Font = Enum.Font.GothamBold
notificationLabel.TextSize = 15
notificationLabel.TextWrapped = true
notificationLabel.TextXAlignment = Enum.TextXAlignment.Left
notificationLabel.TextYAlignment = Enum.TextYAlignment.Top
notificationLabel.ClipsDescendants = true
notificationLabel.Parent = notificationFrame

local notificationSubLabel = Instance.new("TextLabel")
notificationSubLabel.Size = UDim2.new(1, -20, 0.3, -5)
notificationSubLabel.Position = UDim2.new(0, 10, 0.7, 0)
notificationSubLabel.BackgroundTransparency = 1
notificationSubLabel.TextColor3 = colors.text
notificationSubLabel.Font = Enum.Font.Gotham
notificationSubLabel.TextSize = 12
notificationSubLabel.Text = "ROLUULLETE Notification"
notificationSubLabel.TextXAlignment = Enum.TextXAlignment.Left
notificationSubLabel.Parent = notificationFrame

local function showNotification(message, duration)
    notificationLabel.Text = message
    notificationFrame.Visible = true
    
    notificationFrame.Position = UDim2.new(0.5, -160, 1, 100)
    TweenService:Create(notificationFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -160, 1, -100)}):Play()
    
    if duration then
        task.delay(duration, function()
            TweenService:Create(notificationFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -160, 1, 100)}):Play()
            task.wait(0.3)
            notificationFrame.Visible = false
        end)
    end
end

-- Create the main frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 350, 0, 450)
frame.Position = UDim2.new(0.6, -150, 0.5, -100)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = colors.background
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Make frame draggable
local dragging
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(
        startPos.X.Scale, 
        startPos.X.Offset + delta.X,
        startPos.Y.Scale, 
        startPos.Y.Offset + delta.Y
    )
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

-- Add rounded corners and border
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame

local border = Instance.new("UIStroke")
border.Color = colors.border
border.Thickness = 1
border.Parent = frame

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = colors.primary
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 2
titleBar.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Name = "TopCorner"
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = colors.text
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Text = "Roulette hub | Last Update" -- Changed to ROLUULLETE
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 3
title.Parent = titleBar

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0.5, -12.5)
closeBtn.Text = "×"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.TextColor3 = colors.text
closeBtn.BackgroundColor3 = colors.dropdownClose
closeBtn.BorderSizePixel = 0
closeBtn.ZIndex = 3

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    reopenButton.Visible = true
    showNotification("UI has been hidden\nTap the orange X button to reopen the menu", 3)
end)

reopenButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    reopenButton.Visible = false
    showNotification("UI has been restored\nYou can now access all features", 2)
end)

closeBtn.Parent = titleBar

-- TAB SYSTEM
local tabButtons = {}
local tabFrames = {}
local tabsContainer = Instance.new("Frame")
tabsContainer.Size = UDim2.new(1, -10, 0, 40)
tabsContainer.Position = UDim2.new(0, 5, 0, 35)
tabsContainer.BackgroundTransparency = 1
tabsContainer.Parent = frame

local tabsScrolling = Instance.new("ScrollingFrame")
tabsScrolling.Size = UDim2.new(1, 0, 1, 0)
tabsScrolling.BackgroundTransparency = 1
tabsScrolling.ScrollBarThickness = 5
tabsScrolling.ScrollBarImageColor3 = colors.primary
tabsScrolling.AutomaticCanvasSize = Enum.AutomaticSize.X
tabsScrolling.Parent = tabsContainer

local tabsLayout = Instance.new("UIListLayout")
tabsLayout.FillDirection = Enum.FillDirection.Horizontal
tabsLayout.Padding = UDim.new(0, 5)
tabsLayout.Parent = tabsScrolling

-- Content frame
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, -10, 1, -85)
contentFrame.Position = UDim2.new(0, 5, 0, 80)
contentFrame.BackgroundTransparency = 1
contentFrame.ScrollBarThickness = 5
contentFrame.ScrollBarImageColor3 = colors.primary
contentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
contentFrame.Parent = frame

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0, 10)
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Parent = contentFrame

-- Function to create tabs
local function createTab(name)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, 100, 1, 0)
    tabButton.Text = name
    tabButton.Font = Enum.Font.GothamBold
    tabButton.TextSize = 14
    tabButton.TextColor3 = colors.text
    tabButton.BackgroundColor3 = colors.tabInactive
    tabButton.BorderSizePixel = 0
    tabButton.AutoButtonColor = false
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabButton
    
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = false
    
    local tabContentLayout = Instance.new("UIListLayout")
    tabContentLayout.Padding = UDim.new(0, 10)
    tabContentLayout.Parent = tabFrame
    
    tabButton.MouseButton1Click:Connect(function()
        for _, frame in pairs(tabFrames) do
            frame.Visible = false
        end
        for _, button in pairs(tabButtons) do
            button.BackgroundColor3 = colors.tabInactive
        end
        tabFrame.Visible = true
        tabButton.BackgroundColor3 = colors.tabActive
        showNotification("Switched to " .. name .. " tab\nAccess all " .. name .. " features here", 2)
    end)
    
    tabButtons[name] = tabButton
    tabFrames[name] = tabFrame
    
    tabButton.Parent = tabsScrolling
    tabFrame.Parent = contentFrame
    
    return tabFrame
end

-- Create tabs
local mainTab = createTab("Main")
local teleportTab = createTab("Teleport")
local espTab = createTab("ESP")
local playerTab = createTab("Player")
local autofarmTab = createTab("AutoFarm")
local miscTab = createTab("Misc")

-- Activate first tab
tabButtons["Main"].BackgroundColor3 = colors.tabActive
tabFrames["Main"].Visible = true

-- UI Component Functions
local function createLabel(parent, text, size, labelType)
    local labelTypes = {
        default = {color = colors.labelDefault, bold = false},
        title = {color = colors.labelTitle, bold = true},
        warning = {color = colors.labelWarning, bold = true},
        success = {color = colors.labelSuccess, bold = true},
        info = {color = colors.labelInfo, bold = false},
        section = {color = colors.labelSection, bold = true}
    }
    
    local settings = labelTypes[labelType or "default"]
    
    local label = Instance.new("TextLabel")
    label.Size = size or UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = settings.color
    label.Font = settings.bold and Enum.Font.GothamBold or Enum.Font.Gotham
    label.TextSize = settings.bold and 16 or 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = #parent:GetChildren()
    label.Parent = parent
    
    if labelType == "section" then
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.TextSize = 15
        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 10)
        padding.Parent = label
    end
    
    return label
end

local function createSlider(parent, text, min, max, default, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, 0, 0, 50)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.LayoutOrder = #parent:GetChildren()
    
    local label = createLabel(sliderFrame, text .. ": " .. default, UDim2.new(1, 0, 0, 20))
    
    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, 0, 0, 10)
    track.Position = UDim2.new(0, 0, 0, 25)
    track.BackgroundColor3 = colors.sliderTrack
    track.BorderSizePixel = 0
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 5)
    trackCorner.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = colors.sliderFill
    fill.BorderSizePixel = 0
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 5)
    fillCorner.Parent = fill
    
    local handle = Instance.new("TextButton")
    handle.Size = UDim2.new(0, 15, 0, 15)
    handle.Position = UDim2.new(fill.Size.X.Scale, -7, 0.5, -7)
    handle.Text = ""
    handle.BackgroundColor3 = colors.primary
    handle.BorderSizePixel = 0
    handle.AutoButtonColor = false
    
    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(1, 0)
    handleCorner.Parent = handle
    
    fill.Parent = track
    handle.Parent = track
    track.Parent = sliderFrame
    sliderFrame.Parent = parent
    
    local isDragging = false
    
    local function updateSlider(input)
        local xOffset = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * xOffset)
        
        fill.Size = UDim2.new(xOffset, 0, 1, 0)
        handle.Position = UDim2.new(xOffset, -7, 0.5, -7)
        label.Text = text .. ": " .. value
        
        callback(value)
    end
    
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            updateSlider(input)
        end
    end)
    
    handle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)
    
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            updateSlider(input)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input)
        end
    end)
    
    return sliderFrame
end

local function createToggle(parent, text, default, callback, isDropdownToggle)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, 0, 0, 30)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.LayoutOrder = #parent:GetChildren()

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = colors.text
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggleFrame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.3, 0, 1, 0)
    btn.Position = UDim2.new(0.7, 0, 0, 0)
    btn.Text = default and "ON" or "OFF"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = colors.text
    btn.BackgroundColor3 = isDropdownToggle and (default and colors.dropdownToggleOn or colors.dropdownToggleOff) 
                          or (default and colors.toggleOn or colors.toggleOff)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        local newState = not (btn.Text == "ON")
        btn.Text = newState and "ON" or "OFF"
        btn.BackgroundColor3 = isDropdownToggle and (newState and colors.dropdownToggleOn or colors.dropdownToggleOff)
                              or (newState and colors.toggleOn or colors.toggleOff)
        callback(newState)
        showNotification(text .. " " .. (newState and "ENABLED" or "DISABLED") .. "\nFeature status updated", 2)
    end)

    btn.Parent = toggleFrame
    toggleFrame.Parent = parent
    return btn
end

local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = colors.text
    btn.BackgroundColor3 = colors.primary
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.LayoutOrder = #parent:GetChildren()

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        callback()
        showNotification(text .. " ACTIVATED\nAction completed successfully", 2)
    end)

    btn.Parent = parent
    return btn
end

-- Updated scrollable dropdown function
local function createDropdown(parent, text, options)
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Size = UDim2.new(1, 0, 0, 35)
    dropdownFrame.BackgroundColor3 = colors.secondary
    dropdownFrame.AutomaticSize = Enum.AutomaticSize.Y
    dropdownFrame.LayoutOrder = #parent:GetChildren()

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = dropdownFrame

    local stroke = Instance.new("UIStroke")
    stroke.Color = colors.border
    stroke.Thickness = 1
    stroke.Parent = dropdownFrame

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.Parent = dropdownFrame

    local headerFrame = Instance.new("Frame")
    headerFrame.Size = UDim2.new(1, 0, 0, 35)
    headerFrame.BackgroundTransparency = 1
    headerFrame.LayoutOrder = 0
    headerFrame.Parent = dropdownFrame

    local header = Instance.new("TextButton")
    header.Size = UDim2.new(1, -40, 1, 0)
    header.Position = UDim2.new(0, 0, 0, 0)
    header.Text = text .. " ▼"
    header.Font = Enum.Font.GothamBold
    header.TextSize = 14
    header.TextColor3 = colors.text
    header.BackgroundColor3 = colors.secondary
    header.BorderSizePixel = 0
    header.AutoButtonColor = false

    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 6)
    headerCorner.Parent = header

    local headerStroke = Instance.new("UIStroke")
    headerStroke.Color = colors.border
    headerStroke.Thickness = 1
    headerStroke.Parent = header

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0.5, -15)
    closeButton.Text = "×"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 18
    closeButton.TextColor3 = colors.text
    closeButton.BackgroundColor3 = colors.dropdownClose
    closeButton.BorderSizePixel = 0
    closeButton.ZIndex = 2

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(1, 0)
    closeCorner.Parent = closeButton

    -- Scrolling frame for dropdown content
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 0, 0)
    scrollFrame.Position = UDim2.new(0, 0, 0, 40)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.Visible = false
    scrollFrame.ScrollBarThickness = 5
    scrollFrame.ScrollBarImageColor3 = colors.primary
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.ClipsDescendants = true
    scrollFrame.LayoutOrder = 1

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.AutomaticSize = Enum.AutomaticSize.Y
    contentFrame.Parent = scrollFrame

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 5)
    contentLayout.Parent = contentFrame

    -- Update canvas size when content changes
    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        contentFrame.Size = UDim2.new(1, 0, 0, contentLayout.AbsoluteContentSize.Y)
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y)
    end)

    local isOpen = false

    local function animateDropdown()
        if isOpen then
            scrollFrame.Visible = true
            scrollFrame.Size = UDim2.new(1, 0, 0, 0)
            TweenService:Create(scrollFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, math.min(contentLayout.AbsoluteContentSize.Y, 300))}):Play()
            TweenService:Create(header, TweenInfo.new(0.2), {BackgroundColor3 = colors.light}):Play()
            TweenService:Create(dropdownFrame, TweenInfo.new(0.2), {BackgroundColor3 = colors.light}):Play()
        else
            TweenService:Create(scrollFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
            TweenService:Create(header, TweenInfo.new(0.2), {BackgroundColor3 = colors.secondary}):Play()
            TweenService:Create(dropdownFrame, TweenInfo.new(0.2), {BackgroundColor3 = colors.secondary}):Play()
            task.wait(0.2)
            scrollFrame.Visible = false
        end
    end

    header.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        header.Text = text .. (isOpen and " ▲" or " ▼")
        animateDropdown()
    end)

    closeButton.MouseButton1Click:Connect(function()
        if isOpen then
            isOpen = false
            header.Text = text .. " ▼"
            animateDropdown()
        end
    end)

    header.Parent = headerFrame
    closeButton.Parent = headerFrame
    scrollFrame.Parent = dropdownFrame
    dropdownFrame.Parent = parent

    return {
        addButton = function(text, callback)
            local btn = createButton(contentFrame, text, callback)
            return btn
        end,
        addToggle = function(text, default, callback)
            local toggle = createToggle(contentFrame, text, default, callback, true)
            return toggle
        end,
        addLabel = function(text, labelType)
            local label = createLabel(contentFrame, text, nil, labelType)
            return label
        end,
        addSlider = function(text, min, max, default, callback)
            local slider = createSlider(contentFrame, text, min, max, default, callback)
            return slider
        end,
        frame = dropdownFrame
    }
end

-- ===== GAME SCRIPT FUNCTIONALITY =====

-- Safe zone setup
local safezoneBaseplates = {}
local baseplateSize = Vector3.new(2048, 1, 2048)
local baseY = 100
local centerPos = Vector3.new(0, baseY, 0)

for dx = -1, 1 do
    for dz = -1, 1 do
        local pos = centerPos + Vector3.new(dx * baseplateSize.X, 0, dz * baseplateSize.Z)
        local baseplate = Instance.new("Part")
        baseplate.Name = "SafeZoneBaseplate"
        baseplate.Size = baseplateSize
        baseplate.Position = pos
        baseplate.Anchored = true
        baseplate.CanCollide = true
        baseplate.Transparency = 1
        baseplate.Color = Color3.fromRGB(255, 255, 255)
        baseplate.Parent = workspace
        table.insert(safezoneBaseplates, baseplate)
    end
end

-- Utility to convert "x, y, z" string to CFrame
local function stringToCFrame(str)
    local x, y, z = str:match("([^,]+),%s*([^,]+),%s*([^,]+)")
    return CFrame.new(tonumber(x), tonumber(y), tonumber(z))
end

-- Teleport function with optional tween duration
local function teleportToTarget(cf, duration)
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if duration and duration > 0 then
        local ts = game:GetService("TweenService")
        local info = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        local goal = { CFrame = cf }
        local tween = ts:Create(hrp, info, goal)
        tween:Play()
    else
        hrp.CFrame = cf
    end
end

-- ===== MAIN TAB CONTENT =====
createLabel(mainTab, "MAIN FEATURES", UDim2.new(1, 0, 0, 25), "section")

-- Safe Zone Toggle
createToggle(mainTab, "Show Safe Zone", false, function(enabled)
    for _, baseplate in ipairs(safezoneBaseplates) do
        baseplate.Transparency = enabled and 0.8 or 1
        baseplate.CanCollide = enabled
    end
end)

-- Kill Aura System
local killAuraToggle = false
local radius = 200
local toolsDamageIDs = {
    ["Old Axe"] = "1_8982038982",
    ["Good Axe"] = "112_8982038982",
    ["Strong Axe"] = "116_8982038982",
    ["Chainsaw"] = "647_8992824875",
    ["Spear"] = "196_8999010016"
}

local function getAnyToolWithDamageID()
    for toolName, damageID in pairs(toolsDamageIDs) do
        local tool = LocalPlayer.Inventory:FindFirstChild(toolName)
        if tool then
            return tool, damageID
        end
    end
    return nil, nil
end

local function equipTool(tool)
    if tool then
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").EquipItemHandle:FireServer("FireAllClients", tool)
    end
end

local function unequipTool(tool)
    if tool then
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").UnequipItemHandle:FireServer("FireAllClients", tool)
    end
end

local function killAuraLoop()
    while killAuraToggle do
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local tool, damageID = getAnyToolWithDamageID()
            if tool and damageID then
                equipTool(tool)

                for _, mob in ipairs(workspace.Characters:GetChildren()) do
                    if mob:IsA("Model") then
                        local part = mob:FindFirstChildWhichIsA("BasePart")
                        if part and (part.Position - hrp.Position).Magnitude <= radius then
                            pcall(function()
                                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").ToolDamageObject:InvokeServer(
                                    mob,
                                    tool,
                                    damageID,
                                    CFrame.new(part.Position)
                                )
                            end)
                        end
                    end
                end

                task.wait(0.1)
            else
                warn("No supported tool found in inventory")
                task.wait(1)
            end
        else
            task.wait(0.5)
        end
    end
end

createToggle(mainTab, "Kill Aura", false, function(state)
    killAuraToggle = state
    if state then
        task.spawn(killAuraLoop)
    else
        local tool, _ = getAnyToolWithDamageID()
        unequipTool(tool)
    end
end)

createSlider(mainTab, "Kill Aura Radius", 500, 20, 200, function(value)
    radius = math.clamp(value, 20, 500)
end)

-- Stronghold Timer
local strongholdRunning = true
local strongholdTimeChecker = createLabel(mainTab, "Stronghold Timer: Checking...", nil, "info")

coroutine.wrap(function()
    local lastTimerText = nil
    while strongholdRunning do
        local label = workspace:FindFirstChild("Map")
            and workspace.Map:FindFirstChild("Landmarks")
            and workspace.Map.Landmarks:FindFirstChild("Stronghold")
            and workspace.Map.Landmarks.Stronghold:FindFirstChild("Functional")
            and workspace.Map.Landmarks.Stronghold.Functional:FindFirstChild("Sign")
            and workspace.Map.Landmarks.Stronghold.Functional.Sign:FindFirstChild("SurfaceGui")
            and workspace.Map.Landmarks.Stronghold.Functional.Sign.SurfaceGui:FindFirstChild("Frame")
            and workspace.Map.Landmarks.Stronghold.Functional.Sign.SurfaceGui.Frame:FindFirstChild("Body")
        
        local timerText = "Stronghold Timer: " .. tostring(label and label.ContentText or "N/A")
        strongholdTimeChecker.Text = timerText
        task.wait(0.5)
    end
end)()

-- Stronghold Teleports
local strongholdDropdown = createDropdown(mainTab, "Stronghold Teleports")
strongholdDropdown.addButton("Teleport to Stronghold", function()
    local targetPart = workspace:FindFirstChild("Map")
        and workspace.Map:FindFirstChild("Landmarks")
        and workspace.Map.Landmarks:FindFirstChild("Stronghold")
        and workspace.Map.Landmarks.Stronghold:FindFirstChild("Functional")
        and workspace.Map.Landmarks.Stronghold.Functional:FindFirstChild("EntryDoors")
        and workspace.Map.Landmarks.Stronghold.Functional.EntryDoors:FindFirstChild("DoorRight")
        and workspace.Map.Landmarks.Stronghold.Functional.EntryDoors.DoorRight:FindFirstChild("Model")

    if targetPart then
        local children = targetPart:GetChildren()
        local destination = children[5]

        if destination and destination:IsA("BasePart") then
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = destination.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end
end)

strongholdDropdown.addButton("Teleport to Diamond Chest", function()
    local items = workspace:FindFirstChild("Items")
    if not items then return end

    local chest = items:FindFirstChild("Stronghold Diamond Chest")
    if not chest then return end

    local chestLid = chest:FindFirstChild("ChestLid")
    if not chestLid then return end

    local diamondchest = chestLid:FindFirstChild("Meshes/diamondchest_Cube.002")
    if not diamondchest then return end

    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = diamondchest.CFrame + Vector3.new(0, 5, 0)
    end
end)

-- ===== TELEPORT TAB CONTENT =====
createLabel(teleportTab, "TELEPORT OPTIONS", UDim2.new(1, 0, 0, 25), "section")

-- Story Teleports
local storyCoords = {
    { "[campsite] camp site", "0, 8, -0"},
    { "[safezone] safe zone", "0, 110, -0" }
}

local storyDropdown = createDropdown(teleportTab, "Story Teleports")
for _, entry in ipairs(storyCoords) do
    local name, coord = entry[1], entry[2]
    storyDropdown.addButton(name, function()
        teleportToTarget(stringToCFrame(coord), 0.1)
    end)
end

-- Item Teleports
local itemFolder = workspace:WaitForChild("Items")
local itemNames = {
    "Revolver", "Medkit", "Alien Chest", "Berry", "Bolt", "Broken Fan",
    "Carrot", "Coal", "Coin Stack", "Hologram Emitter", "Item Chest",
    "Laser Fence Blueprint", "Log", "Old Flashlight", "Old Radio",
    "Sheet Metal", "Bandage", "Rifle"
}

local function getModelPart(model)
    if model.PrimaryPart then
        return model.PrimaryPart
    end
    for _, part in pairs(model:GetChildren()) do
        if part:IsA("BasePart") then
            return part
        end
    end
    return nil
end

local itemTeleportDropdown = createDropdown(teleportTab, "Teleport to Item")
for _, itemName in ipairs(itemNames) do
    itemTeleportDropdown.addButton("TP to " .. itemName, function()
        local candidates = {}
        for _, model in pairs(itemFolder:GetChildren()) do
            if model:IsA("Model") and model.Name == itemName then
                local part = getModelPart(model)
                if part then
                    table.insert(candidates, part)
                end
            end
        end

        if #candidates == 0 then
            warn("No '" .. itemName .. "' found to teleport to.")
            return
        end

        local targetPart = candidates[math.random(1, #candidates)]
        local character = LocalPlayer.Character
        if character then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end)
end

-- Bring Items to Player
local possibleItems = {
    "Alien Chest", "Alpha Wolf Pelt", "Anvil Front", "Anvil Back", "Apple", "Bandage",
    "Bear Corpse", "Bear Pelt", "Berry", "Biofuel", "Bolt", "Broken Fan", "Bunny Foot",
    "Carrot", "Coal", "Coin Stack", "Cooked Morsel", "Cooked Steak", "Chainsaw", "Cultist",
    "Cultist Gem", "Flower", "Fuel Canister", "Hologram Emitter", "Item Chest", "Laser Fence Blueprint",
    "Leather Body", "Iron Body", "Thorn Body", "Log", "MedKit", "Morsel", "Old Flashlight",
    "Old Radio", "Good Sack", "Good Axe", "Raygun", "Giant Sack", "Strong Axe", "Oil Barrel",
    "Old Car Engine", "Rifle", "Rifle Ammo", "Revolver", "Revolver Ammo", "Sapling", "Sheet Metal",
    "Steak", "Wolf Pelt", "Gem of the Forest Fragment", "Tyre", "Washing Machine", "Broken Microwave"
}

local bringItemDropdown = createDropdown(teleportTab, "Bring Items to Player")
for _, itemName in ipairs(possibleItems) do
    bringItemDropdown.addButton(itemName, function()
        local rootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local remoteEvents = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents")
        local stackOffsetY = 2
        local count = 0
        
        for _, source in ipairs({workspace.Items, game:GetService("ReplicatedStorage"):WaitForChild("TempStorage")}) do
            for _, item in ipairs(source:GetChildren()) do
                if item.Name == itemName then
                    local targetPart = nil
                    
                    if itemName == "Berry" then
                        targetPart = item:FindFirstChild("Handle")
                        if not targetPart then
                            for _, child in ipairs(item:GetDescendants()) do
                                if child:IsA("MeshPart") or child:IsA("Part") or child:IsA("UnionOperation") then
                                    targetPart = child
                                    break
                                end
                            end
                        end
                    else
                        for _, child in ipairs(item:GetDescendants()) do
                            if child:IsA("MeshPart") or child:IsA("Part") then
                                targetPart = child
                                break
                            end
                        end
                    end
                    
                    if targetPart then
                        remoteEvents.RequestStartDraggingItem:FireServer(item)
                        local offset = Vector3.new(0, count * stackOffsetY, 0)
                        targetPart.CFrame = rootPart.CFrame + offset
                        remoteEvents.StopDraggingItem:FireServer(item)
                        count = count + 1
                    end
                end
            end
        end
    end)
end

-- Bring Mobs to Player
local possibleCharacters = {
    "Alpha Wolf", "Bear", "Lost Child", "Lost Child2", "Lost Child3", "Lost Child4",
    "Wolf", "Bunny", "Cultist", "Alien"
}

local bringMobDropdown = createDropdown(teleportTab, "Bring Mobs to Player")
for _, characterName in ipairs(possibleCharacters) do
    bringMobDropdown.addButton(characterName, function()
        local rootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local characterFolder = workspace:WaitForChild("Characters")
        local stackOffsetY = 3
        local count = 0
        
        for _, model in ipairs(characterFolder:GetChildren()) do
            if model.Name == characterName then
                local mainPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                if mainPart then
                    local targetCFrame = rootPart.CFrame + Vector3.new(0, count * stackOffsetY, 0)
                    if model.PrimaryPart then
                        model:SetPrimaryPartCFrame(targetCFrame)
                    else
                        mainPart.CFrame = targetCFrame
                    end
                    count = count + 1
                end
            end
        end
    end)
end

-- ===== ESP TAB CONTENT =====
createLabel(espTab, "VISUAL ENHANCEMENTS", UDim2.new(1, 0, 0, 25), "section")

-- Item ESP
createToggle(espTab, "Item ESP", false, function(state)
    local itemFolder = workspace:FindFirstChild("Items")
    if not itemFolder then return end

    local itemNames = {
        ["Revolver"] = true, ["Oil Barrel"] = true, ["Chainsaw"] = true, 
        ["Giant Sack"] = true, ["Bunny Foot"] = true, ["MedKit"] = true, 
        ["Alien Chest"] = true, ["Berry"] = true, ["Bolt"] = true, 
        ["Broken Fan"] = true, ["Carrot"] = true, ["Coal"] = true,
        ["Coin Stack"] = true, ["Hologram Emitter"] = true, ["Item Chest"] = true,
        ["Laser Fence Blueprint"] = true, ["Log"] = true, ["Old Flashlight"] = true,
        ["Old Radio"] = true, ["Sheet Metal"] = true, ["Bandage"] = true, ["Rifle"] = true
    }

    local connections = {}

    local function createESP(model)
        if not model:IsA("Model") or not itemNames[model.Name] then return end
        if not model.PrimaryPart or model:FindFirstChild("ESP") then return end

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP"
        billboard.Size = UDim2.new(0, 100, 0, 30)
        billboard.Adornee = model.PrimaryPart
        billboard.AlwaysOnTop = true
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        
        local customFont = Font.new("rbxassetid://16658246179", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.TextSize = 17
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextStrokeTransparency = 0.5
        label.TextScaled = false
        label.FontFace = customFont
        label.Text = model.Name
        label.Parent = billboard

        billboard.Parent = model
    end

    local function removeAllESP()
        for _, model in itemFolder:GetChildren() do
            local esp = model:FindFirstChild("ESP")
            if esp then esp:Destroy() end
        end
    end

    if state then
        for _, model in itemFolder:GetChildren() do
            createESP(model)
        end

        local connection = itemFolder.ChildAdded:Connect(function(model)
            if model:IsA("Model") and itemNames[model.Name] then
                model:GetPropertyChangedSignal("PrimaryPart"):Wait()
                createESP(model)
            end
        end)

        table.insert(connections, connection)
    else
        removeAllESP()
        for _, conn in connections do
            if conn.Disconnect then conn:Disconnect() end
        end
        table.clear(connections)
    end
end)

-- Player ESP
local ESPEnabled = false
local ChamsEnabled = false
local BillboardESPs = {}
local ChamsESPs = {}
local ESPConnections = {}

local function createBillboardESP(plr)
    if BillboardESPs[plr] or plr == LocalPlayer then return end
    if not plr.Character or not plr.Character:FindFirstChild("Head") then return end

    local gui = Instance.new("BillboardGui")
    gui.Name = "Billboard_ESP"
    gui.Adornee = plr.Character.Head
    gui.Parent = plr.Character.Head
    gui.Size = UDim2.new(0, 100, 0, 40)
    gui.AlwaysOnTop = true
    gui.StudsOffset = Vector3.new(0, 2, 0)

    local label = Instance.new("TextLabel", gui)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextStrokeTransparency = 0.5
    label.TextScaled = true
    label.FontFace = Font.new("rbxassetid://16658246179", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

    local conn
    conn = RunService.RenderStepped:Connect(function()
        if not plr.Character or not plr.Character:FindFirstChild("Humanoid") then
            gui:Destroy()
            if conn then conn:Disconnect() end
            BillboardESPs[plr] = nil
            ESPConnections[plr] = nil
            return
        end

        local hp = math.floor(plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth * 100)
        label.Text = plr.Name .. " | " .. hp .. "%"
    end)

    BillboardESPs[plr] = gui
    ESPConnections[plr] = conn
end

local function createChamsESP(plr)
    if ChamsESPs[plr] or plr == LocalPlayer then return end
    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end

    local folder = Instance.new("Folder")
    folder.Name = "Chams_ESP"
    folder.Parent = game:GetService("CoreGui")
    ChamsESPs[plr] = folder

    for _, part in pairs(plr.Character:GetChildren()) do
        if part:IsA("BasePart") then
            local box = Instance.new("BoxHandleAdornment")
            box.Name = "Cham_" .. plr.Name
            box.Adornee = part
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Size = part.Size
            box.Transparency = 0.4
            box.Color = BrickColor.new("Bright green")
            box.Parent = folder
        end
    end
end

local function cleanupBillboardESP()
    for _, gui in pairs(BillboardESPs) do
        if gui then gui:Destroy() end
    end
    for _, conn in pairs(ESPConnections) do
        if conn then conn:Disconnect() end
    end
    BillboardESPs = {}
    ESPConnections = {}
end

local function cleanupChamsESP()
    for _, folder in pairs(ChamsESPs) do
        if folder then folder:Destroy() end
    end
    ChamsESPs = {}
end

local function handlePlayerESP(plr)
    if ESPEnabled then createBillboardESP(plr) end
    if ChamsEnabled then createChamsESP(plr) end

    plr.CharacterAdded:Connect(function()
        task.wait(1)
        if ESPEnabled then createBillboardESP(plr) end
        if ChamsEnabled then createChamsESP(plr) end
    end)
end

createToggle(espTab, "Player ESP", false, function(state)
    ESPEnabled = state
    if not state then
        cleanupBillboardESP()
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                createBillboardESP(plr)
            end
        end
    end
end)

createToggle(espTab, "Player Chams", false, function(state)
    ChamsEnabled = state
    if not state then
        cleanupChamsESP()
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                createChamsESP(plr)
            end
        end
    end
end)

-- Initialize ESP for existing players
for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        handlePlayerESP(plr)
    end
end

Players.PlayerAdded:Connect(function(plr)
    handlePlayerESP(plr)
end)

-- FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Transparency = 1
FOVCircle.Thickness = 1
FOVCircle.Filled = false
FOVCircle.ZIndex = 2
local FOVRadius = 100

RunService.RenderStepped:Connect(function()
    if FOVCircle.Visible then
        FOVCircle.Radius = FOVRadius
        FOVCircle.Position = UserInputService:GetMouseLocation()
    end
end)

createToggle(espTab, "FOV Circle", false, function(state)
    FOVCircle.Visible = state
end)

-- ===== PLAYER TAB CONTENT =====
createLabel(playerTab, "PLAYER MODIFICATIONS", UDim2.new(1, 0, 0, 25), "section")

-- WalkSpeed Slider
local walkSpeedSlider = createSlider(playerTab, "WalkSpeed", 700, 16, 16, function(value)
    _G.HackedWalkSpeed = value

    local function applyWalkSpeed(humanoid)
        if humanoid then
            humanoid.WalkSpeed = _G.HackedWalkSpeed
            humanoid.Changed:Connect(function(property)
                if property == "WalkSpeed" and humanoid.WalkSpeed ~= _G.HackedWalkSpeed then
                    humanoid.WalkSpeed = _G.HackedWalkSpeed
                end
            end)
        end
    end

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        applyWalkSpeed(LocalPlayer.Character.Humanoid)
    end

    LocalPlayer.CharacterAdded:Connect(function(char)
        char:WaitForChild("Humanoid")
        applyWalkSpeed(char:FindFirstChild("Humanoid"))
    end)
end)

-- JumpPower Slider
createSlider(playerTab, "JumpPower", 700, 50, 50, function(value)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = value
    end
end)

-- WalkSpeed Toggle
createToggle(playerTab, "Toggle WalkSpeed (50)", false, function(toggle)
    if toggle == true then 
        _G.HackedWalkSpeed = 50
    else
        _G.HackedWalkSpeed = 16
    end

    local function applyWalkSpeed(humanoid)
        if humanoid then
            humanoid.WalkSpeed = _G.HackedWalkSpeed
            humanoid.Changed:Connect(function(property)
                if property == "WalkSpeed" and humanoid.WalkSpeed ~= _G.HackedWalkSpeed then
                    humanoid.WalkSpeed = _G.HackedWalkSpeed
                end
            end)
        end
    end

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        applyWalkSpeed(LocalPlayer.Character.Humanoid)
    end

    LocalPlayer.CharacterAdded:Connect(function(char)
        char:WaitForChild("Humanoid")
        applyWalkSpeed(char:FindFirstChild("Humanoid"))
    end)
end)

-- ===== AUTOFARM TAB CONTENT =====
createLabel(autofarmTab, "AUTOMATION SYSTEMS", UDim2.new(1, 0, 0, 25), "section")

-- Auto Feed Campfire
local campfireFuelItems = {"Log", "Coal", "Fuel Canister", "Oil Barrel", "Biofuel"}
local autoFuelEnabledItems = {}
local alwaysFeedEnabledItems = {}

local campfireDropdown = createDropdown(autofarmTab, "Auto Feed Campfire")
for _, itemName in ipairs(campfireFuelItems) do
    campfireDropdown.addToggle(itemName, false, function(checked)
        autoFuelEnabledItems[itemName] = checked
    end)
end

campfireDropdown.addToggle("Bulk (All)", false, function(checked)
    for _, itemName in ipairs(campfireFuelItems) do
        autoFuelEnabledItems[itemName] = checked
    end
end)

-- Auto Cook Food
local autocookItems = {"Morsel", "Steak"}
local autoCookEnabledItems = {}

local cookDropdown = createDropdown(autofarmTab, "Auto Cook Food")
for _, itemName in ipairs(autocookItems) do
    cookDropdown.addToggle(itemName, false, function(checked)
        autoCookEnabledItems[itemName] = checked
    end)
end

-- Auto Grind Items
local autoGrindItems = {
    "UFO Junk", "UFO Component", "Old Car Engine", "Broken Fan", 
    "Old Microwave", "Bolt", "Log", "Cultist Gem", "Sheet Metal", 
    "Old Radio", "Tyre", "Washing Machine", "Cultist Experiment", 
    "Cultist Component", "Gem of the Forest Fragment", "Broken Microwave"
}
local autoGrindEnabledItems = {}

local grindDropdown = createDropdown(autofarmTab, "Auto Machine Grind")
for _, itemName in ipairs(autoGrindItems) do
    grindDropdown.addToggle(itemName, false, function(checked)
        autoGrindEnabledItems[itemName] = checked
    end)
end

-- Auto Eat
local autoEatFoods = {"Cooked Steak", "Cooked Morsel", "Berry", "Carrot", "Apple"}
local autoEatEnabled = false

local eatDropdown = createDropdown(autofarmTab, "Auto Eat")
eatDropdown.addToggle("Enable Auto Eat", false, function(checked)
    autoEatEnabled = checked
end)

-- Auto Biofuel
local biofuelItems = {"Carrot", "Cooked Morsel", "Morsel", "Steak", "Cooked Steak", "Log"}
local autoBiofuelEnabledItems = {}

local biofuelDropdown = createDropdown(autofarmTab, "Auto Biofuel Processor")
for _, itemName in ipairs(biofuelItems) do
    biofuelDropdown.addToggle(itemName, false, function(checked)
        autoBiofuelEnabledItems[itemName] = checked
    end)
end

-- Auto Bring Trees
local autoBreakEnabled = false
local originalTreeCFrames = {}
local treesBrought = false

createToggle(autofarmTab, "Auto Bring All Small Trees", false, function(checked)
    autoBreakEnabled = checked
    if checked and not treesBrought then
        local rootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local target = CFrame.new(rootPart.Position + rootPart.CFrame.LookVector * 10)
        local trees = {}
        
        local function scan(folder)
            for _, obj in ipairs(folder:GetChildren()) do
                if obj:IsA("Model") and obj.Name == "Small Tree" then
                    table.insert(trees, obj)
                end
            end
        end

        local map = workspace:FindFirstChild("Map")
        if map then
            if map:FindFirstChild("Foliage") then scan(map.Foliage) end
            if map:FindFirstChild("Landmarks") then scan(map.Landmarks) end
        end
        
        for _, tree in ipairs(trees) do
            local trunk = nil
            for _, part in ipairs(tree:GetDescendants()) do
                if part:IsA("BasePart") and part.Name == "Trunk" then 
                    trunk = part
                    break
                end
            end
            
            if trunk then
                if not originalTreeCFrames[tree] then originalTreeCFrames[tree] = trunk.CFrame end
                tree.PrimaryPart = trunk
                trunk.Anchored = false
                trunk.CanCollide = false
                task.wait()
                tree:SetPrimaryPartCFrame(target + Vector3.new(math.random(-5,5), 0, math.random(-5,5)))
                trunk.Anchored = true
            end
        end
        treesBrought = true
    elseif not checked and treesBrought then
        for tree, cframe in pairs(originalTreeCFrames) do
            local trunk = nil
            for _, part in ipairs(tree:GetDescendants()) do
                if part:IsA("BasePart") and part.Name == "Trunk" then 
                    trunk = part
                    break
                end
            end
            
            if trunk then
                tree.PrimaryPart = trunk
                tree:SetPrimaryPartCFrame(cframe)
                trunk.Anchored = true
                trunk.CanCollide = true
            end
        end
        originalTreeCFrames = {}
        treesBrought = false
    end
end)

-- Background coroutines for automation
coroutine.wrap(function()
    local campfireDropPos = Vector3.new(0, 19, 0)
    local machineDropPos = Vector3.new(21, 16, -5)
    local itemsFolder = workspace:WaitForChild("Items")
    local remoteEvents = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents")

    -- Auto Feed Campfire
    while true do
        for itemName, enabled in pairs(autoFuelEnabledItems) do
            if enabled then
                for _, item in ipairs(itemsFolder:GetChildren()) do
                    if item.Name == itemName then
                        local part = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item:FindFirstChild("Handle")
                        if part then
                            remoteEvents.RequestStartDraggingItem:FireServer(item)
                            task.wait(0.05)
                            item:SetPrimaryPartCFrame(CFrame.new(campfireDropPos))
                            task.wait(0.05)
                            remoteEvents.StopDraggingItem:FireServer(item)
                        end
                    end
                end
            end
        end
        task.wait(2)
    end
end)()

coroutine.wrap(function()
    local itemsFolder = workspace:WaitForChild("Items")
    local remoteConsume = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestConsumeItem")

    -- Auto Cook
    while true do
        for itemName, enabled in pairs(autoCookEnabledItems) do
            if enabled then
                for _, item in ipairs(itemsFolder:GetChildren()) do
                    if item.Name == itemName then
                        local part = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item:FindFirstChild("Handle")
                        if part then
                            remoteEvents.RequestStartDraggingItem:FireServer(item)
                            task.wait(0.05)
                            item:SetPrimaryPartCFrame(CFrame.new(campfireDropPos))
                            task.wait(0.05)
                            remoteEvents.StopDraggingItem:FireServer(item)
                        end
                    end
                end
            end
        end
        task.wait(2.5)
    end
end)()

coroutine.wrap(function()
    local itemsFolder = workspace:WaitForChild("Items")
    local remoteConsume = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestConsumeItem")

    -- Auto Grind
    while true do
        for itemName, enabled in pairs(autoGrindEnabledItems) do
            if enabled then
                for _, item in ipairs(itemsFolder:GetChildren()) do
                    if item.Name == itemName then
                        local part = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item:FindFirstChild("Handle")
                        if part then
                            remoteEvents.RequestStartDraggingItem:FireServer(item)
                            task.wait(0.05)
                            item:SetPrimaryPartCFrame(CFrame.new(machineDropPos))
                            task.wait(0.05)
                            remoteEvents.StopDraggingItem:FireServer(item)
                        end
                    end
                end
            end
        end
        task.wait(2.5)
    end
end)()

coroutine.wrap(function()
    local itemsFolder = workspace:WaitForChild("Items")
    local remoteConsume = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestConsumeItem")

    -- Auto Eat
    while true do
        if autoEatEnabled then
            local available = {}
            for _, item in ipairs(itemsFolder:GetChildren()) do
                if table.find(autoEatFoods, item.Name) then
                    table.insert(available, item)
                end
            end
            if #available > 0 then
                local food = available[math.random(1, #available)]
                pcall(function() remoteConsume:InvokeServer(food) end)
            end
        end
        task.wait(3)
    end
end)()

coroutine.wrap(function()
    local itemsFolder = workspace:WaitForChild("Items")
    local remoteConsume = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("RequestConsumeItem")

    -- Auto Biofuel
    while true do
        local biofuelProcessorPos
        if not biofuelProcessorPos then
            local processor = workspace:FindFirstChild("Structures") and workspace.Structures:FindFirstChild("Biofuel Processor")
            local part = processor and processor:FindFirstChild("Part")
            if part then
                biofuelProcessorPos = part.Position + Vector3.new(0, 5, 0)
            end
        end

        if biofuelProcessorPos then
            for itemName, enabled in pairs(autoBiofuelEnabledItems) do
                if enabled then
                    for _, item in ipairs(itemsFolder:GetChildren()) do
                        if item.Name == itemName then
                            local part = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item:FindFirstChild("Handle")
                            if part then
                                remoteEvents.RequestStartDraggingItem:FireServer(item)
                                task.wait(0.05)
                                item:SetPrimaryPartCFrame(CFrame.new(biofuelProcessorPos))
                                task.wait(0.05)
                                remoteEvents.StopDraggingItem:FireServer(item)
                            end
                        end
                    end
                end
            end
        end
        task.wait(2)
    end
end)()

-- ===== MISC TAB CONTENT =====
createLabel(miscTab, "MISCELLANEOUS", UDim2.new(1, 0, 0, 25), "section")

-- Anti AFK
createButton(miscTab, "Anti AFK", function()
    local ba = Instance.new("ScreenGui")
    local ca = Instance.new("TextLabel")
    local da = Instance.new("Frame")
    local _b = Instance.new("TextLabel")
    local ab = Instance.new("TextLabel")
    
    ba.Parent = game.CoreGui
    ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ca.Parent = ba
    ca.Active = true
    ca.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    ca.Draggable = true
    ca.Position = UDim2.new(0.698610067, 0, 0.098096624, 0)
    ca.Size = UDim2.new(0, 370, 0, 52)
    ca.Font = Enum.Font.SourceSansSemibold
    ca.Text = "anti afk"
    ca.TextColor3 = Color3.new(0, 1, 1)
    ca.TextSize = 22
    
    da.Parent = ca
    da.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
    da.Position = UDim2.new(0, 0, 1.0192306, 0)
    da.Size = UDim2.new(0, 370, 0, 107)
    
    _b.Parent = da
    _b.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    _b.Position = UDim2.new(0, 0, 0.800455689, 0)
    _b.Size = UDim2.new(0, 370, 0, 21)
    _b.Font = Enum.Font.Arial
    _b.Text = "anti afk"
    _b.TextColor3 = Color3.new(0, 1, 1)
    _b.TextSize = 20
    
    ab.Parent = da
    ab.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    ab.Position = UDim2.new(0, 0, 0.158377, 0)
    ab.Size = UDim2.new(0, 370, 0, 44)
    ab.Font = Enum.Font.ArialBold
    ab.Text = "status: active"
    ab.TextColor3 = Color3.new(0, 1, 1)
    ab.TextSize = 20
    
    local bb = game:service'VirtualUser'
    game:service'Players'.LocalPlayer.Idled:connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        ab.Text = "roblox tried to kick you but failed to do so!"
        wait(2)
        ab.Text = "status : active"
    end)
end)

-- Infinite Yield
createButton(miscTab, "Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- Emote GUI
createButton(miscTab, "Emote GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dimension-sources/random-scripts-i-found/refs/heads/main/r6%20animations"))()
end)

-- Turtle Spy
createButton(miscTab, "Turtle Spy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Spy/main/source.lua", true))()
end)

-- Make sure the UI is properly sized
tabsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    tabsScrolling.CanvasSize = UDim2.new(0, tabsLayout.AbsoluteContentSize.X, 0, 0)
end)

contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 10)
end)

-- Keybind to toggle UI
local toggleKey = Enum.KeyCode.RightControl
local uiVisible = true

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == toggleKey then
        uiVisible = not uiVisible
        frame.Visible = uiVisible
        reopenButton.Visible = not uiVisible
        showNotification("UI " .. (uiVisible and "SHOWN" or "HIDDEN") .. "\n" .. (uiVisible and "Press RightControl to hide" or "Press RightControl or tap X to show"), 2)
    end
end)

-- Mobile detection and adjustments
local function isMobile()
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

if isMobile() then
    frame.Size = UDim2.new(0, 380, 0, 500)
    frame.Position = UDim2.new(0.6, -190, 0.6, -150)
    reopenButton.Size = UDim2.new(0, 70, 0, 70)
    reopenButton.TextSize = 32
    closeBtn.Size = UDim2.new(0, 40, 0, 40)
    closeBtn.TextSize = 28
    notificationFrame.Size = UDim2.new(0.9, 0, 0, 100)
    notificationFrame.Position = UDim2.new(0.5, 0, 1, -110)
    notificationFrame.AnchorPoint = Vector2.new(0.5, 0)
    notificationLabel.TextSize = 16
    notificationSubLabel.TextSize = 14
end

-- Initial notification
showNotification(
    "WELCOME TO ROLUULLETE!\n\n"..
    "• Use tabs to navigate features\n"..
    "• Click X to hide UI\n"..
    "• Orange button appears to reopen\n"..
    "• Drag windows to reposition",
    6
)
