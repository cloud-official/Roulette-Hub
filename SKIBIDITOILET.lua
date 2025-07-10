local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Roulette Hub | " .. Fluent.Version,
    SubTitle = "Version 0.2",
    TabWidth = 150,
    Size = UDim2.fromOffset(400, 200),
    Acrylic = true,
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    animation = Window:AddTab({ Title = "animation", Icon = "music-4" }),
    Troll = Window:AddTab({ Title = "Trolling", Icon = "laugh" }),
    Dev = Window:AddTab({ Title = "Devloper", Icon = "file-code" }),
    play = Window:AddTab({ Title = "Player", Icon = "user" }),
}

Window:Dialog({
    Title = "Hello!",
    Content = "Will you use this again?",
    Buttons = {
        { 
            Title = "Yes",
            Callback = function()
                Fluent:Notify({
                    Title = "Oh thank you <3",
                    Content = "We'll always remember you!",
                    Duration = 5
                })
            end
        },
        {
            Title = "No",
            Callback = function()
                Fluent:Notify({
                    Title = "Flip you 💢",
                    Content = "I hope your pillow is warm on both sides.",
                    Duration = 5
                })
            end
        }
    }
})

Tabs.Main:AddParagraph({
    Title = "Hey!",
    Content = "Thank you for using our script. Keep in mind this is Version 0.2, so don't expect good stuff!"
})

Tabs.animation:AddParagraph({
    Title = "R6 Animation",
    Content = "These are custom so u will nevet sre on another hub"
})

Tabs.animation:AddButton({
    Title = "Shy",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Left Shoulder").C0 = CFrame.new(-1, 0.5, 0, -0.305042088, -0.87296617, -0.380631208, 0.242066488, 0.315480441, -0.917538404, 0.921061456, -0.372025669, 0.115081035)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Right Shoulder").C0 = CFrame.new(1, 0.5, 0, -0.442299753, 0.64650774, 0.621610045, -0.350987554, 0.513037026, -0.783327043, -0.825335681, -0.564642549, 0)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Neck").C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0.389418364, 0.921061039, 0, 0.921061158, -0.389418393)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Left Hip").C0 = CFrame.new(-1, -1, 0, -1.01344062e-08, -0.0998334587, -0.995004296, 0.389418483, 0.916459978, -0.0919527337, 0.921061158, -0.387472928, 0.0388769731)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Right Hip").C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)

    end
})

Tabs.animation:AddButton({
    Title = "autism walk",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Left Shoulder").C0 = CFrame.new(-1, 0.5, 0, 0, 0.999573886, 0.0291995425, 0, -0.029199576, 0.999573827, 1, 0, 0)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Right Shoulder").C0 = CFrame.new(1, 0.5, 0, 0, -0.997495234, 0.0707372129, 0, 0.0707371682, 0.997495174, -1, 0, 0)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Neck").C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, -0.963558435, 0.26749894, 0, 0.26749894, 0.963558376)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Left Hip").C0 = CFrame.new(-1, -1, 0, -0.00966822263, 0.00247125491, -0.99995023, 0.000510802958, 0.999997318, 0.00246649398, 0.99995327, -0.000486770325, -0.00966944266)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Right Hip").C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)

    end
})

Tabs.animation:AddButton({
    Title = "realtic look up",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Left Shoulder").C0 = CFrame.new(-1, 0.5, 0, 0.518526375, 0.208344772, -0.829291105, 0.125439435, 0.940833092, 0.314800352, 0.845810652, -0.267257869, 0.461711854)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Right Shoulder").C0 = CFrame.new(1, 0.5, 0, 0.587879837, -0.289629489, 0.755322754, 0.0102178352, 0.936293483, 0.351070285, -0.808884144, -0.198669374, 0.553387463)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Neck").C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, -0.644217789, 0.764842272, 0, 0.764842272, 0.644217789)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Left Hip").C0 = CFrame.new(-1, -1, 0, 0.389418453, -7.77770737e-10, -0.921061218, -3.02878306e-10, 1, 7.1637446e-10, 0.921061277, 0, 0.389418393)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Right Hip").C0 = CFrame.new(1, -1, 0, 0.479425609, 0, 0.87758261, 0, 1, 0, -0.877582729, 0, 0.479425639)

    end
})

Tabs.animation:AddParagraph({
    Title = "R16 Animation",
    Content = "These are NOT custom so u will see these"
})

local animURL = "https://raw.githubusercontent.com/Mautiku/Mautiku/main/AnimationCHANGER.txt"
local anims = {"Ninja", "Robot", "Levitate", "Ghost", "Toy", "Stylish", "Bubbly"}

for _, name in ipairs(anims) do
    Tabs.animation:AddButton({
        Title = name .. " Animation",
        Description = "Load the " .. name .. " animation pack.",
        Callback = function()
            getgenv().pack = name
            loadstring(game:HttpGet(animURL))()
            print("Loaded animation pack: " .. name)
        end
    })
end

Tabs.Troll:AddButton({
    Title = "telekinesis V5",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/main/qwerty1.lua"))()
    end
})

Tabs.Troll:AddButton({
    Title = "Gojo",
    Description = "Client tho",
    Callback = function()
        
        local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local bp = Instance.new("BodyPosition")
bp.MaxForce = Vector3.new(0, 50000, 0)
bp.P = 10000
bp.D = 1000
bp.Position = root.Position + Vector3.new(0, 20, 0)
bp.Parent = root

game.Debris:AddItem(bp, 2)

        
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local activated = false
local orbs = {}

-- Create an orb
local function createOrb(color, offsetAngle, id)
	local orb = Instance.new("Part")
	orb.Shape = Enum.PartType.Ball
	orb.Size = Vector3.new(1.5, 1.5, 1.5)
	orb.Anchored = true
	orb.CanCollide = false
	orb.Material = Enum.Material.Neon
	orb.Color = color
	orb.Transparency = 0 -- fully solid
	orb.Name = "Orb_" .. id
	orb.Parent = workspace

	-- Trail
	local trail = Instance.new("Trail")
	trail.Color = ColorSequence.new(color)
	trail.Lifetime = 0.4
	trail.LightEmission = 1
	trail.WidthScale = NumberSequence.new(0.4)
	trail.Attachment0 = Instance.new("Attachment", orb)
	trail.Attachment1 = Instance.new("Attachment", orb)
	trail.Parent = orb

	orbs[id] = {
		Part = orb,
		Angle = offsetAngle
	}
end

-- Create red and blue orbs
createOrb(Color3.fromRGB(255, 0, 0), 0, "Red")
createOrb(Color3.fromRGB(0, 0, 255), math.pi, "Blue")
        

-- Purple orb effect
local function createPurpleBlast(position)
	local purple = Instance.new("Part")
	purple.Shape = Enum.PartType.Ball
	purple.Size = Vector3.new(1, 1, 1)
	purple.Anchored = true
	purple.CanCollide = false
	purple.Material = Enum.Material.Neon
	purple.Color = Color3.fromRGB(160, 0, 255)
	purple.Transparency = 0 -- solid
	purple.Position = position
	purple.Parent = workspace

	local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	local grow = TweenService:Create(purple, tweenInfo, { Size = Vector3.new(8, 8, 8) })
	grow:Play()

  

function mangaTxt(t)
    local ts = game:GetService("TweenService")
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
    local Dialogue = Instance.new("BillboardGui")
    local Chat1 = Instance.new("Frame")
    local Sub = Instance.new("TextLabel")
 
    Dialogue.Active = true
    Dialogue.Size = UDim2.new(15, 0, 15, 0)
    Dialogue.StudsOffset = Vector3.new(0, 0, 2)
    Dialogue.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Dialogue.Name = "Dialogue"
    Dialogue.Parent = humanoidRootPart
 
    Chat1.AnchorPoint = Vector2.new(0.5, 0.5)
    Chat1.BackgroundColor3 = Color3.new(1, 1, 1)
    Chat1.BorderColor3 = Color3.new(0, 0, 0)
    Chat1.BorderSizePixel = 2
    Chat1.Position = UDim2.new(0.600000024, 0, -0.2, 0)
    Chat1.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
    Chat1.Name = "Chat1"
    Chat1.BackgroundTransparency = 1
    Chat1.Parent = Dialogue
 
    Sub.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
    Sub.Text = t
    Sub.TextColor3 = Color3.new(0, 0, 0)
    Sub.TextScaled = true
    Sub.TextSize = 14
    Sub.TextWrapped = true
    Sub.AnchorPoint = Vector2.new(0.5, 0.5)
    Sub.BackgroundColor3 = Color3.new(1, 1, 1)
    Sub.TextTransparency = 1
    Sub.BorderColor3 = Color3.new(0, 0, 0)
    Sub.BorderSizePixel = 0
    Sub.Position = UDim2.new(0.5, 0, 0.5, 0)
    Sub.Size = UDim2.new(0.850000024, 0, 0.349999994, 0)
    Sub.Name = "Sub"
    Sub.Parent = Chat1
 
    game.Debris:AddItem(Chat1, 25)
    game.Debris:AddItem(Sub, 25)
 
    local function tweenProperty(object, properties, time)
        local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = ts:Create(object, tweenInfo, properties)
        tween:Play()
        return tween
    end
 
    tweenProperty(Chat1, {BackgroundTransparency = 0}, 1)
    tweenProperty(Sub, {TextTransparency = 0}, 1)
    tweenProperty(Chat1, {Position = UDim2.new(0.6, 0, 0.4, 0)}, 1)
    task.wait(4)
    tweenProperty(Chat1, {BackgroundTransparency = 1}, 2)
    tweenProperty(Sub, {TextTransparency = 1}, 2)
end


mangaTxt("Disgusting people should PAY NOW")
  
	-- Remove after 3 seconds
	Debris:AddItem(purple, 3)

	return purple
end

game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Left Shoulder").C0 = CFrame.new(-1, 0.5, 0, 0.240261525, -0.780856788, -0.576661229, -0.895711064, -0.407305658, 0.178341016, -0.374135822, 0.473673165, -0.797281325)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Right Shoulder").C0 = CFrame.new(1, 0.5, 0, -0.627489388, 0.695281804, 0.350486606, 0.402906269, -0.0952404886, 0.910272658, 0.666276276, 0.712399602, -0.220371023)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Neck").C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Left Hip").C0 = CFrame.new(-1, -1, 0, 0.550629914, -0.0468113571, -0.833437026, -0.0622140244, 0.993348956, -0.0968965143, 0.832428992, 0.105205089, 0.544055045)
game.Players.LocalPlayer.Character:WaitForChild("Torso"):FindFirstChild("Right Hip").C0 = CFrame.new(1, -1, 0, 0.449511737, -0.000619219791, 0.893274546, 0.096167922, 0.994221628, -0.0477041602, -0.888083518, 0.107347935, 0.44697389)

-- Create GUI with big white frame that deletes after 10 secs
local function createWhiteGUI()
	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "SpecialEffectUI"
	gui.ResetOnSpawn = false

	local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(99999999999999, 99999999999999, 99999999999999, 99999999999999)       -- Full width & height of the screen
frame.Position = UDim2.new(0, 0, 0, 0)   -- Top-left corner
frame.BackgroundColor3 = Color3.new(1, 1, 1) -- White
frame.BorderSizePixel = 0
frame.Parent = gui


	-- Delete after 10 seconds
	task.delay(10, function()
		if gui then gui:Destroy() end
	end)
end

-- Main update loop
-- Main update loop
RunService.RenderStepped:Connect(function(dt)
    local height = root.Position.Y
    local radius = 4
    local y = 2

    if not activated then
        -- Normal spin
        for id, data in pairs(orbs) do
            data.Angle += dt * 1.2 -- slower
            local x = math.cos(data.Angle) * radius
            local z = math.sin(data.Angle) * radius
            data.Part.Position = root.Position + Vector3.new(x, y, z)
        end

        -- Trigger when player is above 20 studs
        if height > 20 then
            activated = true

            local red = orbs.Red.Part
            local blue = orbs.Blue.Part
            local mid = root.Position + Vector3.new(0, 20, 0)  -- 20 studs up

            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            TweenService:Create(red, tweenInfo, { Position = mid }):Play()
            TweenService:Create(blue, tweenInfo, { Position = mid }):Play()

            task.wait(0.55)
            createPurpleBlast(mid)

            for _, data in pairs(orbs) do
                data.Part:Destroy()
            end

            -- Wait 3 seconds before spawning GUI
            task.delay(3, function()
                createWhiteGUI()
            end)
        end
    end
end)
local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local startPos = root.Position
local endPos = startPos + Vector3.new(0, 20, 0)

coroutine.wrap(function()
	local duration = 1.5
	local elapsed = 0
	while elapsed < duration do
		elapsed += task.wait()
		local alpha = elapsed / duration
		root.CFrame = CFrame.new(startPos:Lerp(endPos, alpha))
	end
end)()
    end
})

Tabs.Troll:AddButton({
    Title = "grab knife",
    Description = "client side tho",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cloud-official/Roulette-Hub/refs/heads/main/Grab-knife-V2.lua"))()

    end
})

Tabs.Troll:AddButton({
    Title = "telekinesis V5",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/main/qwerty1.lua"))()
    end
})

Tabs.Troll:AddButton({
    Title = "Jerk Off Tool",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})


Tabs.Troll:AddButton({
    Title = "Touch fling",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/long191910/all-my-roblox-script/refs/heads/main/touchfling.lua"))()
    end
})
Tabs.Dev:AddButton({
    Title = "Dex",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end
})

Tabs.Dev:AddButton({
    Title = "Hydroxide",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Upbolt/Hydroxide/main/source.lua"))()

    end
})

Tabs.Dev:AddButton({
    Title = "Simple Spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()

    end
})

Tabs.play:AddButton({
    Title = "tween tp tool",
    Callback = function()
        local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local tweenTime = 1 -- seconds to complete teleport

local function tweenTeleport(position)
    if not rootPart then return end
    
    local tweenInfo = TweenInfo.new(
        tweenTime,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    
    local tweenGoal = {CFrame = CFrame.new(position) * CFrame.new(0, 3, 0)} -- Raise a bit to avoid stuck
    
    local tween = TweenService:Create(rootPart, tweenInfo, tweenGoal)
    tween:Play()
end

mouse.Button1Down:Connect(function()
    local targetPos = mouse.Hit and mouse.Hit.p
    if targetPos then
        tweenTeleport(targetPos)
    end
end)

    end
})

local tspeed = 0.2
local tpwalking = false

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function isNumber(str)
    return tonumber(str) ~= nil or str == "inf"
end

Tabs.play:AddTextBox({
    Title = "CWalk Speed",
    Description = "Recommended: 0.1 - 1",
    Placeholder = "Enter speed (e.g. 0.2)",
    Callback = function(input)
        local value = tonumber(input)
        if isNumber(input) and value >= 0 then
            tspeed = value
            Fluent:Notify({
                Title = "Speed Updated",
                Content = "CWalk speed set to " .. tostring(tspeed),
                Duration = 3
            })
        else
            Fluent:Notify({
                Title = "Invalid Speed",
                Content = "Must be a number >= 0",
                Duration = 3
            })
        end
    end
})

Tabs.play:AddToggle({
    Title = "CWalk (TranslateBy)",
    Description = "Smooth teleport movement",
    Default = false,
    Callback = function(state)
        tpwalking = state
        Fluent:Notify({
            Title = "CWalk " .. (state and "Enabled" or "Disabled"),
            Content = state and "You're sliding now." or "Back to normal movement.",
            Duration = 3
        })
    end
})

task.spawn(function()
    while true do
        if tpwalking then
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
            if humanoid and humanoid.MoveDirection.Magnitude > 0 then
                character:TranslateBy(humanoid.MoveDirection.Unit * tspeed)
            end
        end
        RunService.Heartbeat:Wait()
    end
end)

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function makeHeadless(char)
    local head = char:FindFirstChild("Head")
    if head then
        head.Transparency = 1
        local face = head:FindFirstChildOfClass("Decal")
        if face then face:Destroy() end
    end
end

local headlessEnabled = false

Tabs.play:AddToggle({
    Title = "Headless",
    Description = "Make your head invisible its client tho",
    Callback = function(state)
        headlessEnabled = state
        if state then
            local char = lp.Character or lp.CharacterAdded:Wait()
            makeHeadless(char)
            Fluent:Notify({
                Title = "Headless Enabled",
                Content = "You're now invisible-headed!",
                Duration = 3
            })
        else
            Fluent:Notify({
                Title = "Headless Disabled",
                Content = "Reset to see your head again.",
                Duration = 3
            })
        end
    end
})

lp.CharacterAdded:Connect(function(char)
    if headlessEnabled then
        char:WaitForChild("Head")
        task.wait(0.1)
        makeHeadless(char)
    end
end)

local noclipEnabled = false
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

Tabs.play:AddToggle({
    Title = "Noclip",
    Description = "Walk through walls like a ghost 👻",
    Callback = function(state)
        noclipEnabled = state
        Fluent:Notify({
            Title = state and "Noclip Enabled" or "Noclip Disabled",
            Content = state and "You can walk through anything!" or "You're solid again.",
            Duration = 3
        })
    end
})

RunService.Stepped:Connect(function()
    if noclipEnabled then
        local char = lp.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)
