local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local Backpack = player:WaitForChild("Backpack")

local ui = WindUI:CreateWindow({
	Title = "Grow a Garden | Roulette Hub",
	Icon = "dices",
	Author = "Enjoy. my script :)",
	Folder = "Roulette Hub | Files",
	Size = UDim2.fromOffset(210, 105),
	Transparent = true,
	IsOpenButtonEnabled = true,
	User = {
		Enabled = true,
		Anonymous = false
	},
	SideBarWidth = 125,
})

local dialog = ui:Dialog({
	Icon = "dices",
	Title = "Roulette Hub",
	Content = "May i rizz u up hehe",
	Buttons = {
		{
			Title = "Confirm",
			Callback = function()
				WindUI:Popup({
					Title = "Confirmed!",
					Icon = "check",
					Content = "Enjoy the script 👌",
					Buttons = {
						{
							Title = "Okay",
							Icon = "check",
							Callback = function() end,
							Variant = "Primary",
						}
					}
				})
			end,
		},
		{
			Title = "Cancel",
			Callback = function()
				WindUI:Popup({
					Title = "Cancelled!",
					Icon = "x",
					Content = "You cancelled the action.",
					Buttons = {
						{
							Title = "Okay",
							Icon = "check",
							Callback = function() end,
							Variant = "Primary",
						}
					}
				})
			end,
		},
	},
})

local Tab = ui:Tab({
	Title = "Main",
	Icon = "leaf"
})

Tab:Paragraph({
	Title = "Welcome",
	Desc = "credit to @fevber @odintheodin",
	Color = "Red",
	Locked = false,
})

-- Farm Tab 🌱
local Tab1 = ui:Tab({
	Title = "Farm",
	Icon = "shovel"
})

local toggleEnabled = false

Tab1:Toggle({
	Title = "Auto Harvest 🌿",
	Desc = "Automatically interacts with ProximityPrompts near you.",
	Icon = "bird",
	Type = "Checkbox",
	Default = false,
	Callback = function(state)
		toggleEnabled = state
		WindUI:Popup({
			Title = "Auto Harvest",
			Icon = state and "check" or "x",
			Content = state and "Auto Harvest enabled." or "Auto Harvest disabled.",
			Buttons = {
				{
					Title = "Okay",
					Icon = "check",
					Callback = function() end,
					Variant = "Primary",
				}
			}
		})
	end
})

RunService.RenderStepped:Connect(function()
	if toggleEnabled and character and character:FindFirstChild("HumanoidRootPart") then
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("ProximityPrompt") and obj.Enabled then
				local parent = obj.Parent
				if parent and parent:IsA("BasePart") then
					local distance = (character.HumanoidRootPart.Position - parent.Position).Magnitude
					if distance <= obj.MaxActivationDistance then
						fireproximityprompt(obj, 1, true)
					end
				end
			end
		end
	end
end)

-- Inventory Tab 🎒
local InvTab = ui:Tab({
	Title = "Inventory",
	Icon = "bag"
})

InvTab:Button({
	Title = "List Backpack Tools",
	Desc = "See what's in your backpack",
	Icon = "box",
	Callback = function()
		local tools = {}
		for _, item in ipairs(Backpack:GetChildren()) do
			if item:IsA("Tool") then
				table.insert(tools, item.Name)
			end
		end
		WindUI:Popup({
			Title = "Backpack Tools",
			Icon = "box",
			Content = #tools > 0 and table.concat(tools, ", ") or "No tools in backpack.",
			Buttons = {
				{
					Title = "Okay",
					Icon = "check",
					Callback = function() end,
					Variant = "Primary",
				}
			}
		})
	end
})

InvTab:Button({
	Title = "Current Held Tool",
	Desc = "See what tool you're holding",
	Icon = "hand",
	Callback = function()
		local held = nil
		for _, item in ipairs(character:GetChildren()) do
			if item:IsA("Tool") then
				held = item.Name
				break
			end
		end
		WindUI:Popup({
			Title = "Held Tool",
			Icon = "hand",
			Content = held and ("You're holding: " .. held) or "You're not holding anything.",
			Buttons = {
				{
					Title = "Okay",
					Icon = "check",
					Callback = function() end,
					Variant = "Primary",
				}
			}
		})
	end
})

-- Dupe Button 🌀
InvTab:Button({
	Title = "Dupe Tool",
	Desc = "Attempt to dupe your held tool",
	Icon = "clone",
	Callback = function()
		local held = nil
		for _, item in ipairs(character:GetChildren()) do
			if item:IsA("Tool") then
				held = item
				break
			end
		end
		if held then
			local clone = held:Clone()
			clone.Parent = Backpack
			WindUI:Popup({
				Title = "Tool Duplicated!",
				Icon = "check",
				Content = "Successfully duped: " .. held.Name,
				Buttons = {
					{
						Title = "Okay",
						Icon = "check",
						Callback = function() end,
						Variant = "Primary",
					}
				}
			})
		else
			WindUI:Popup({
				Title = "Dupe Failed",
				Icon = "x",
				Content = "You must be holding a tool to dupe.",
				Buttons = {
					{
						Title = "Okay",
						Icon = "check",
						Callback = function() end,
						Variant = "Primary",
					}
				}
			})
		end
	end
})

