-- PLAYER UTILITIES
PlayerTab:CreateButton({
    Name = "Teleport to Random Player",
    Callback = function()
        local players = Players:GetPlayers()
        local target = players[math.random(1, #players)]
        if target and target.Character and LocalPlayer.Character then
            LocalPlayer.Character:PivotTo(target.Character:GetPivot())
        end
    end
})

-- Fly Toggle
local flying = false
local flyVel, flyGyro

PlayerTab:CreateToggle({
    Name = "Fly (Space to go up)",
    CurrentValue = false,
    Callback = function(state)
        flying = state
        local char = LocalPlayer.Character
        if char then
            if state then
                local hrp = char:WaitForChild("HumanoidRootPart")
                flyVel = Instance.new("BodyVelocity", hrp)
                flyVel.Velocity = Vector3.zero
                flyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)

                flyGyro = Instance.new("BodyGyro", hrp)
                flyGyro.CFrame = hrp.CFrame
                flyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)

                RunService.Stepped:Connect(function()
                    if flying then
                        local camDir = Camera.CFrame.LookVector
                        flyVel.Velocity = camDir * 50
                        flyGyro.CFrame = Camera.CFrame
                    end
                end)
            else
                if flyVel then flyVel:Destroy() end
                if flyGyro then flyGyro:Destroy() end
            end
        end
    end
})

-- SERVER UTILS
SettingsTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

SettingsTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for _, v in pairs(servers.data) do
            if v.playing < v.maxPlayers then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
                break
            end
        end
    end
})

SettingsTab:CreateButton({
    Name = "Unlock FPS (Client)",
    Callback = function()
        setfpscap(240)
    end
})

SettingsTab:CreateButton({
    Name = "Clear Memory / Lag",
    Callback = function()
        collectgarbage("collect")
    end
})

-- ADMIN TOOLS
AdminTab:CreateButton({
    Name = "Grab All Tools",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") then
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 1)
            end
        end
    end
})

AdminTab:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
})

-- COMBAT TOOLS
CombatTab:CreateButton({
    Name = "Basic Fling Nearest Player",
    Callback = function()
        local function fling(target)
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local thrp = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if hrp and thrp then
                hrp.CFrame = thrp.CFrame
                local bv = Instance.new("BodyVelocity", hrp)
                bv.Velocity = Vector3.new(9999,9999,9999)
                bv.P = 1e5
                bv.MaxForce = Vector3.new(1e5,1e5,1e5)
                wait(0.1)
                bv:Destroy()
            end
        end
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                fling(plr)
                break
            end
        end
    end
})

CombatTab:CreateButton({
    Name = "Godmode (Basic)",
    Callback = function()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.Name = "1"
                local clone = hum:Clone()
                clone.Parent = char
                clone.Name = "Humanoid"
                wait()
                hum:Destroy()
                workspace.CurrentCamera.CameraSubject = clone
            end
        end
    end
})

-- Extra ESP Feature
CombatTab:CreateToggle({
    Name = "Show Player Names ESP",
    CurrentValue = false,
    Callback = function(state)
        if state then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and not plr.Character:FindFirstChild("NameEsp") then
                    local billboard = Instance.new("BillboardGui", plr.Character)
                    billboard.Name = "NameEsp"
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.AlwaysOnTop = true
                    billboard.StudsOffset = Vector3.new(0, 3, 0)

                    local label = Instance.new("TextLabel", billboard)
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.Text = plr.Name
                    label.TextColor3 = Color3.new(0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.TextStrokeTransparency = 0
                end
            end
        else
            for _, plr in pairs(Players:GetPlayers()) do
                local esp = plr.Character and plr.Character:FindFirstChild("NameEsp")
                if esp then esp:Destroy() end
            end
        end
    end
})
