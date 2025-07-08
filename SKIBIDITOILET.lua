local Link = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/refs/heads/main/Playstation%20Ui%20Library/source.lua"))()

local Win = Link:CreateWindow('Roulette Hub','V0.1')

local HubStart = Win:addPage('Main', 2, true, 6)

local AnimTab = Win:addPage('Animation Packs', 2, false, 6)

local VisualTab = Win:addPage('Visuals', 2, false, 6)

local DebugTab = Win:addPage('Debug Tools', 2, false, 6)

local TrollTab = Win:addPage('Trolling', 2, false, 6)

local AimbotTab = Win:addPage('Aimbot', 2, false, 6)

local GameHubTab = Win:addPage('GameHub', 2, false, 6)

HubStart:addLabel('Welcome to Roulette Hub!', 'Use the tabs to navigate.')

HubStart:addLabel('Update Notes', 'New scripts weekly + bug fixes.')

HubStart:addLabel('Credits', 'Owner: odintheodin\nDev: fevber\n💗')

HubStart:addButton('Check Hub Status', function()

    print("Hub Loaded Successfully 💗")

end)

local animURL = "https://raw.githubusercontent.com/Mautiku/Mautiku/main/AnimationCHANGER.txt"

local anims = {"Ninja", "Robot", "Levitate", "Ghost", "Toy", "Stylish", "Bubbly"}

for _, name in ipairs(anims) do

    AnimTab:addButton(name, function()

        getgenv().pack = name

        loadstring(game:HttpGet(animURL))()

        print("Loaded animation pack: " .. name)

    end)

end

local headToggled = false

local originalHeadSize = nil

VisualTab:addButton("Headless", function()

    local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()

    local head = char:FindFirstChild("Head")

    if head then

        if not headToggled then

            originalHeadSize = head.Size

            head.Size = Vector3.new(20, 20, 20)

            head.Transparency = 1

            if head:FindFirstChild("face") then head:FindFirstChild("face"):Destroy() end

            headToggled = true

        else

            head.Size = originalHeadSize or Vector3.new(2, 1, 1)

            head.Transparency = 0

            headToggled = false

        end

    end

end)

VisualTab:addButton("fly bypass", function()

    local player = game.Players.LocalPlayer

    local RunService = game:GetService("RunService")

    local char = player.Character or player.CharacterAdded:Wait()

    local hrp = char:FindFirstChild("HumanoidRootPart")

    if not hrp then return end

    local block = Instance.new("Part")

    block.Size = Vector3.new(4, 0.5, 4)

    block.Anchored = true

    block.CanCollide = true

    block.Transparency = 0.3

    block.Material = Enum.Material.Neon

    block.Parent = workspace

    local hue = 0

    RunService.Heartbeat:Connect(function()

        local pos = hrp.Position - Vector3.new(0, hrp.Size.Y/2 + block.Size.Y/2 + 0.1, 0)

        block.CFrame = CFrame.new(pos)

        hue = (hue + 0.01) % 1

        block.Color = Color3.fromHSV(hue, 1, 1)

    end)

end)

DebugTab:addButton("Anim logger", function()

    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Animation-Logger-32018"))()

end)

DebugTab:addButton("UNC Environment Checker", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/refs/heads/main/UNCCheckEnv.lua"))()

end)

DebugTab:addButton("Dex Explorer", function()

    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()

end)

TrollTab:addButton("FE 18+ Script", function()

    loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()

end)

TrollTab:addButton("OpFinality", function()

    loadstring(game:HttpGet("https://gist.githubusercontent.com/Coolie-tech/2425d472c253ef3b3d49ee74695f9cc3/raw/64971f032b6af3023305c57dba0810073a6d5a6b/OP%2520Finality%2520Trolling%2520GUI"))()

end)

TrollTab:addButton("SkyHub", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()

end)

local loaded = false

local aimbotEnabled = false

local espEnabled = false

local fov = 90

AimbotTab:addButton("Load Aimbot/ESP", function()

    if not loaded then

        loadstring(game:HttpGet("https://pastebin.com/raw/ha5p8Rzk", true))()

        print("Aimbot Loaded")

        loaded = true

    else

        print("Already Loaded")

    end

end)

AimbotTab:addToggle("Enable Aimbot", function(state)

    aimbotEnabled = state

    _G.AimbotEnabled = state

end)

AimbotTab:addToggle("Enable ESP", function(state)

    espEnabled = state

    _G.ESPEnabled = state

end)

AimbotTab:addSlider("Aim FOV", 10, 360, function(value)

    fov = value

    _G.AimFOV = value

end)

GameHubTab:addButton("CosmicHub (Fling)", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/ExolKaddinx/deobfuscated/refs/heads/main/cosmichub-new.lua", true))()

end)

GameHubTab:addButton("Solara Hub V3", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua"))()

end)

GameHubTab:addButton("PrizzLife", function()

    loadstring(game:HttpGet('https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua'))()

end)

GameHubTab:addButton("ZeroHub", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/dnezero/zerohub/refs/heads/main/main.lua"))()

end)

GameHubTab:addButton("GhostHub", function()

    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()

end)
