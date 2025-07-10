local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local plr = Players.LocalPlayer

--///KEYS\\\--
local keyList = {
    ["RUSSIAN-ROULETTE-KEY(00999286124)"] = "USER",
    ["KEY2"] = "NIGGA SYSTEM2"
}

--///DISCORD LINK\\\--
local KeyLink = "https://discord.gg/U2jwTrT9VD"

--///FILE NAME\\\--
local fileName = "Keys.txt"

-- Notification
local function notify(title, text, time)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = time or 3
        })
    end)
end

-- Unlock logic
local function unlock(level, usedKey)
    notify("✅ Access Granted", "Welcome, " .. level, 3)
    print("Unlocked Tier:", level)
    print("Used Key:", usedKey)

    -- Add your real unlock logic here
    if level == "NIGGA SYSTEM2" then
        print("GUI ETC BUT BETTER")
    elseif level == "USER" then
        local code = game:HttpGet("https://pastefy.app/F1GTyteq/raw")
local func = loadstring(code)
func()
    end
end

-- Check saved key first
local savedKey
local skipGui = false

pcall(function()
    if readfile then
        savedKey = readfile(fileName)
        if keyList[savedKey] then
            unlock(keyList[savedKey], savedKey)
            skipGui = true
        end
    end
end)

-- STOP HERE if key is valid ✅
if skipGui then return end

-- ELSE: Show the key system GUI
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 20

local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "FluentKeyUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 220)
frame.Position = UDim2.new(0.5, 0, 1.2, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
    Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

-- Drag logic
local dragging, dragInput, startPos, startInputPos
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        startPos = frame.Position
        startInputPos = input.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - startInputPos
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Close button
local close = Instance.new("ImageButton", frame)
close.Image = "rbxassetid://10747372992"
close.Size = UDim2.new(0, 24, 0, 24)
close.Position = UDim2.new(1, -30, 0, 6)
close.BackgroundTransparency = 1
close.ZIndex = 20
close.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Title
local titleIcon = Instance.new("ImageLabel", frame)
titleIcon.Image = "rbxassetid://10723434711"
titleIcon.Size = UDim2.new(0, 24, 0, 24)
titleIcon.Position = UDim2.new(0, 10, 0, 10)
titleIcon.BackgroundTransparency = 1

local title = Instance.new("TextLabel", frame)
title.Text = "ROULETTE-HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -40, 0.2, 0)
title.Position = UDim2.new(0, 40, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Text input
local input = Instance.new("TextBox", frame)
input.PlaceholderText = "Type your key..."
input.Text = ""
input.Size = UDim2.new(0.85, 0, 0.18, 0)
input.Position = UDim2.new(0.075, 0, 0.3, 0)
input.Font = Enum.Font.Gotham
input.TextSize = 14
input.TextColor3 = Color3.new(1, 1, 1)
input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

-- Submit button
local submit = Instance.new("TextButton", frame)
submit.Size = UDim2.new(0.85, 0, 0.18, 0)
submit.Position = UDim2.new(0.075, 0, 0.52, 0)
submit.Font = Enum.Font.GothamBold
submit.TextSize = 15
submit.TextColor3 = Color3.new(1, 1, 1)
submit.BackgroundColor3 = Color3.fromRGB(35, 170, 90)
submit.Text = "  Submit"
submit.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", submit).CornerRadius = UDim.new(0, 8)

local checkIcon = Instance.new("ImageLabel", submit)
checkIcon.Image = "rbxassetid://10747371901"
checkIcon.Size = UDim2.new(0, 20, 0, 20)
checkIcon.Position = UDim2.new(0, 8, 0.5, -10)
checkIcon.BackgroundTransparency = 1

-- Get Key button
local getKey = Instance.new("TextButton", frame)
getKey.Size = UDim2.new(0.85, 0, 0.15, 0)
getKey.Position = UDim2.new(0.075, 0, 0.75, 0)
getKey.Font = Enum.Font.Gotham
getKey.TextSize = 14
getKey.TextColor3 = Color3.new(1, 1, 1)
getKey.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
getKey.Text = "  Get Key"
getKey.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", getKey).CornerRadius = UDim.new(0, 8)

local linkIcon = Instance.new("ImageLabel", getKey)
linkIcon.Image = "rbxassetid://10747365771"
linkIcon.Size = UDim2.new(0, 18, 0, 18)
linkIcon.Position = UDim2.new(0, 8, 0.5, -9)
linkIcon.BackgroundTransparency = 1

-- Submit logic
submit.MouseButton1Click:Connect(function()
    local typed = input.Text
    if keyList[typed] then
        pcall(function()
            if writefile then writefile(fileName, typed) end
        end)
        gui:Destroy()
        blur:Destroy()
        unlock(keyList[typed], typed)
    else
        notify("❌ Invalid Key", "Try again or get key on Discord.", 3)
    end
end)

-- Get Key logic
getKey.MouseButton1Click:Connect(function()
    if KeyLink and KeyLink ~= "" then
        setclipboard(KeyLink)
        notify("📋 Copied", "Discord link copied to clipboard!", 3)
    else
        notify("ℹ️ No Link", "Check the website or ask the dev.", 3)
    end
end)
