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

local mid = root.Position + Vector3.new(0, 20, 0)  -- 20 studs up
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
TweenService:Create(red, tweenInfo, { Position = mid }):Play()
TweenService:Create(blue, tweenInfo, { Position = mid }):Play()


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

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 400, 0, 200)
	frame.Position = UDim2.new(0.5, -200, 0.75, 0)
	frame.BackgroundColor3 = Color3.new(1, 1, 1)
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
