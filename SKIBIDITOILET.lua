local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Roulette Hub",
    Icon = 83085647545420,
    LoadingTitle = "Shadow Hub",
    LoadingSubtitle = "by @fevber",
    ShowText = "by @odintheodin",
    Theme = "Serenity",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "TIXU"
    },
    KeySystem = false
})

-- TABS
local PlayerTab = Window:CreateTab("Player", 10723395215)
local AdminTab = Window:CreateTab("Scripts", "terminal")
local AnimTab = Window:CreateTab("Animations", 10734905958)
local CombatTab = Window:CreateTab("Combat", 10734944200)
local SettingsTab = Window:CreateTab("Settings", "settings")

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- PLAYER TAB
PlayerTab:CreateLabel("Movement Settings", 10723395215)
local WalkSpeed, JumpPower, CFrameSpeed = 16, 50, 0.2
local wsEnabled, jpEnabled, cframeEnabled, noclipEnabled = true, false, false, false

PlayerTab:CreateSlider({Name = "WalkSpeed", Range = {-100, 200}, Increment = 1, CurrentValue = WalkSpeed, Callback = function(v) WalkSpeed = v end})
PlayerTab:CreateToggle({Name = "Enable WalkSpeed", CurrentValue = true, Callback = function(v) wsEnabled = v end})

PlayerTab:CreateSlider({Name = "JumpPower", Range = {0, 300}, Increment = 5, CurrentValue = JumpPower, Callback = function(v) JumpPower = v end})
PlayerTab:CreateToggle({Name = "Enable JumpPower", CurrentValue = false, Callback = function(v) jpEnabled = v end})

PlayerTab:CreateLabel("CFrame Speed", "rewind")
PlayerTab:CreateSlider({Name = "CFrame Speed", Range = {0.1, 3}, Increment = 0.1, CurrentValue = CFrameSpeed, Callback = function(v) CFrameSpeed = v end})
PlayerTab:CreateToggle({Name = "Enable CFrame Speed", CurrentValue = false, Callback = function(v) cframeEnabled = v end})

PlayerTab:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = function(v) noclipEnabled = v end})

RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        if hum then
            hum.WalkSpeed = wsEnabled and WalkSpeed or 16
            hum.JumpPower = jpEnabled and JumpPower or 50
        end
        if cframeEnabled and hum and hum.MoveDirection.Magnitude > 0 then
            char:TranslateBy(hum.MoveDirection * CFrameSpeed)
        end
        if noclipEnabled then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end
end)

-- ADMIN TAB
AdminTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

AdminTab:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
    end
})
AdminTab:CreateLabel("Best Scripts", rbxassetid://10709797006)
-- ANIMATIONS TAB
local animURL = "https://raw.githubusercontent.com/Mautiku/Mautiku/refs/heads/main/AnimationCHANGER.txt"
local anims = {"Ninja", "Robot", "Levitate", "Ghost", "Toy", "Stylish", "Bubbly"}
for _, anim in ipairs(anims) do
    AnimTab:CreateButton({
        Name = "Animation: " .. anim,
        Callback = function()
            getgenv().pack = anim
            loadstring(game:HttpGet(animURL))()
            Rayfield:Notify({
                Title = "Animation Loaded",
                Content = "/e stop to reset.",
                Duration = 5
            })
        end
    })
end

-- COMBAT TAB
CombatTab:CreateLabel("Combat Tools", "crosshair")

-- ESP
local espEnabled = false
local espTable = {}
CombatTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Callback = function(state)
        espEnabled = state
        if state then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local highlight = Instance.new("Highlight")
                    highlight.Adornee = plr.Character
                    highlight.FillColor = Color3.fromRGB(0,255,0)
                    highlight.Parent = plr.Character
                    espTable[plr] = highlight
                end
            end
        else
            for _, h in pairs(espTable) do h:Destroy() end
            espTable = {}
        end
    end
})

-- Tween TP
local tpTweenSpeed = 0.2
local tpEnabled = false
CombatTab:CreateSlider({
    Name = "Tween TP Speed",
    Range = {0.1, 1},
    Increment = 0.05,
    CurrentValue = tpTweenSpeed,
    Callback = function(v) tpTweenSpeed = v end
})
CombatTab:CreateToggle({
    Name = "Enable Click TP",
    CurrentValue = false,
    Callback = function(state)
        tpEnabled = state
    end
})

local Mouse = LocalPlayer:GetMouse()
Mouse.Button1Down:Connect(function()
    if tpEnabled and LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local goal = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 3, 0))
            TweenService:Create(hrp, TweenInfo.new(tpTweenSpeed), {CFrame = goal}):Play()
        end
    end
end)

-- SETTINGS TAB
local currentTheme = "Serenity"
SettingsTab:CreateDropdown({
    Name = "Theme",
    Options = {"Serenity", "Dark", "Amethyst", "Aqua"},
    CurrentOption = currentTheme,
    Callback = function(opt)
        Rayfield:Destroy()
        wait(0.5)
        loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
    end
})
