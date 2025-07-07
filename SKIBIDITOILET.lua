-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create main window
local Window = Rayfield:CreateWindow({
    Name = "Roulette Hub",
    Icon = "star",
    LoadingTitle = "",
    LoadingSubtitle = "RouletteHub",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Roulette-Hub-file",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    Theme = "DarkBlue"
})

-- Hub Start Tab (Welcome/Launcher)
local HubStartTab = Window:CreateTab("Hub Start", "home")
HubStartTab:CreateParagraph({
    Title = "Welcome!",
    Content = "Thanks for using Roulette-Hub Script Hub by .\n\nUse the tabs above to navigate scripts."
})
HubStartTab:CreateParagraph({
    Title = "Update Notes",
    Content = "The hub will be updated weekly with new scripts, improvements, and fixes.\nCheck back often for the latest updates!"
})
HubStartTab:CreateParagraph({
    Title = "Credits",
    Content = "The owner is odintheodin and the devloper is fevber.\nside note: i love yall enjoy💗!"
})
HubStartTab:CreateButton({
    Name = "Check Hub Status",
    Callback = function()
        Rayfield:Notify({
            Title = "Roulette-Hub  Hub",
            Content = "Hub has been loaded. enjoy!💗",
            Duration = 5
        })
    end
})
HubStartTab:CreateLabel("Enjoy using the hub! 🚀")

------------------------------------------------------------
-- Admin Tab
local IYTab = "https://raw.githubusercontent.com/Mautiku/Mautiku/refs/heads/main/AnimationCHANGER.txt"
    local anims = {"Ninja","Robot","Levitate","Ghost","Toy","Stylish","Bubbly"}
    for _, name in ipairs(anims) do
        IYTab:CreateButton({Name="Animation: "..name, Callback=function()
            getgenv().pack = name
            loadstring(game:HttpGet(animURL))()
            Rayfield:Notify({Title="Animation",Content=name.." loaded. Use /e stop to reset",Duration=4})
        end})
    end


local VisualTab = Window:CreateTab("Visual Utilities", "eye")

local player = game.Players.LocalPlayer

local cachedHead = nil
local cachedRightLegParts = {}

VisualTab:CreateButton({
    Name = "Toggle Headless",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        if cachedHead then
            cachedHead.Parent = char
            cachedHead = nil
        else
            local head = char:FindFirstChild("Head")
            if head then
                cachedHead = head:Clone()
                head:Destroy()
            end
        end
    end
})

VisualTab:CreateButton({
    Name = "Toggle Korblox",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()

        if #cachedRightLegParts > 0 then
            for _, part in ipairs(cachedRightLegParts) do
                part.Parent = char
            end
            cachedRightLegParts = {}
        else
            local partsToRemove = {"Right Leg", "RightLowerLeg", "RightUpperLeg", "RightFoot"}
            for _, partName in ipairs(partsToRemove) do
                local part = char:FindFirstChild(partName)
                if part then
                    table.insert(cachedRightLegParts, part:Clone())
                    part:Destroy()
                end
            end
        end
    end
})

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local rainbowBlock
local rainbowConnection
local rainbowEnabled = false

VisualTab:CreateButton({
    Name = "bypass inf jump",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if rainbowEnabled then
            if rainbowBlock then
                rainbowBlock:Destroy()
                rainbowBlock = nil
            end
            if rainbowConnection then
                rainbowConnection:Disconnect()
                rainbowConnection = nil
            end
            rainbowEnabled = false
        else
            rainbowBlock = Instance.new("Part")
            rainbowBlock.Size = Vector3.new(4, 0.5, 4)
            rainbowBlock.Anchored = true
            rainbowBlock.CanCollide = false
            rainbowBlock.Transparency = 0.3
            rainbowBlock.Material = Enum.Material.Neon
            rainbowBlock.Parent = workspace

            local hue = 0
            rainbowConnection = RunService.Heartbeat:Connect(function()
                if not hrp or not rainbowBlock then return end
                local pos = hrp.Position - Vector3.new(0, hrp.Size.Y/2 + rainbowBlock.Size.Y/2 + 0.1, 0)
                rainbowBlock.CFrame = CFrame.new(pos)

                hue = (hue + 0.01) % 1
                rainbowBlock.Color = Color3.fromHSV(hue, 1, 1)
            end)
            rainbowEnabled = true
        end
    end
})

-- Debug Tools Tab
local DebugTab = Window:CreateTab("Debug Tools", "bug")
DebugTab:CreateButton({
    Name = "Remote Event Viewer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/D3f4ultscript/scripts/refs/heads/main/Remotes.lua"))()
    end
})
DebugTab:CreateButton({
    Name = "UNC Environment Checker",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/refs/heads/main/UNCCheckEnv.lua"))()
    end
})
DebugTab:CreateButton({
    Name = "Dex Explorer",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end
})

-- Trolling Scripts Tab
local TrollingTab = Window:CreateTab("Trolling Scripts", "smile")
TrollingTab:CreateButton({
    Name = "FE 18+ Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()
    end
})
TrollingTab:CreateButton({
    Name = "OpFinality",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/Coolie-tech/2425d472c253ef3b3d49ee74695f9cc3/raw/64971f032b6af3023305c57dba0810073a6d5a6b/OP%2520Finality%2520Trolling%2520GUI"))()
    end
})
TrollingTab:CreateButton({
    Name = "SkyHub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
    end
})

-- AIMBOT Tab
local AimTab = Window:CreateTab("AIMBOT", "target")
_G.AimbotLoaded = false
AimTab:CreateButton({
    Name = "Load Aimbot/ESP Script",
    Callback = function()
        if not _G.AimbotLoaded then
            loadstring(game:HttpGet("https://pastebin.com/raw/ha5p8Rzk", true))()
            _G.AimbotLoaded = true
            Rayfield:Notify({
                Title = "Aimbot Loaded",
                Content = "Aimbot/ESP script has been successfully loaded!",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Already Loaded",
                Content = "The Aimbot/ESP script is already loaded.",
                Duration = 5
            })
        end
    end
})
AimTab:CreateToggle({
    Name = "Enable Aimbot (Hold RMB to Lock)",
    CurrentValue = false,
    Callback = function(Value)
        _G.AimbotEnabled = Value
    end
})
AimTab:CreateToggle({
    Name = "Enable ESP (Box + Tracer + Team Check)",
    CurrentValue = false,
    Callback = function(Value)
        _G.ESPEnabled = Value
    end
})
AimTab:CreateSlider({
    Name = "Aim FOV",
    Range = {10, 360},
    Increment = 5,
    Suffix = "°",
    CurrentValue = 90,
    Callback = function(Value)
        _G.AimFOV = Value
    end
})

-- GameHub Tab
local GameHubTab = Window:CreateTab("GameHub", "gamepad")
GameHubTab:CreateButton({
    Name = "CosmicHub (Fling Things And People)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/deobfuscated/refs/heads/main/cosmichub-new.lua", true))()
    end
})
GameHubTab:CreateButton({
    Name = "Solara Hub V3 (Multiple Game Support)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua"))()
    end
})
GameHubTab:CreateButton({
    Name = "PrizzLife (Prison Life)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua'))()
    end
})
GameHubTab:CreateButton({
    Name = "ZeroHub (Multiple Game Support)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dnezero/zerohub/refs/heads/main/main.lua"))()
    end
})
GameHubTab:CreateButton({
    Name = "GhostHub (Multiple Game Support)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end
})
