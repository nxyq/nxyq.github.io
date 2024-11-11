-- Loading Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = [[<font color="rgb(17, 35, 171)">Moon Client | MVSD</font>]],
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

-- Tab Setup
local Tab = Window:MakeTab({
	Name = "Information",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Credits","This script was made by pkplaysrblx and contributed by externalbypassed, wyvernify and Simple Spy.")
Tab:AddParagraph("Bypasses","We are using Vape Bypasses. We cannot 100% guarantee that you will have unlimited time of exploiting. (Might be banned) Loadstring for the Vape Bypasses is loadstring(game:HttpGet('https://nxyq.github.io/vape-bypasses.lua'))('vxpe.ro-bypass.wf/spoof/source.lua')")

-- Main Tab
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Variables for modifying body parts
_G.HeadSize = 50
_G.Disabled = true
_G.SelectedBodyPart = "HumanoidRootPart" -- Default selected body part

-- Dropdown to select body part
Tab:AddDropdown({
	Name = "Select Body Part",
	Default = "HumanoidRootPart",
	Options = {"Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "HumanoidRootPart"},
	Callback = function(selectedBodyPart)
		print("Selected Body Part:", selectedBodyPart)
		_G.SelectedBodyPart = selectedBodyPart -- Save the selected body part
	end    
})

-- Continuously modify the selected body part for each player
game:GetService('RunService').RenderStepped:connect(function()
	if _G.Disabled then
		for _, player in next, game:GetService('Players'):GetPlayers() do
			if player.Name ~= game:GetService('Players').LocalPlayer.Name then
				pcall(function()
					local character = player.Character
					if character and _G.SelectedBodyPart then
						local part = character:FindFirstChild(_G.SelectedBodyPart)
						if part then
							part.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
							part.Transparency = 0.7
							part.BrickColor = BrickColor.new("Really black")
							part.Material = "Neon"
							part.CanCollide = false
						end
					end
				end)
			end
		end
	end
end)

-- Anti AFK
Tab:AddButton({
	Name = "Anti AFK",
	Callback = function()
      		local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
  	end    
})

-- Infinite Jump
Tab:AddToggle({
	Name = "Infinite Jump",
	Default = false,
	Callback = function(v)
		local InfiniteJumpEnabled = v
        game:GetService("UserInputService").JumpRequest:connect(function()
	    if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	    end
        end)
	end    
})

-- Hitbox Expander
Tab:AddTextbox({
	Name = "Hitbox",
	Default = "50",
	TextDisappear = true,
	Callback = function(x)
		_G.HeadSize = tonumber(x) -- Update the head size based on input
		_G.Disabled = true
	end	  
})

function kill_all()
    -- Equips the first tool it finds in your backpack
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:FindFirstChild("Fire") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            break
        end
    end

    -- Sends a shoot event for every player online  
    for _, v in pairs(game.Players:GetPlayers()) do
        task.spawn(function()
            pcall(function()
                local Vec1 = Vector3.new(-186.46624755859375, 49.74998474121094, math.random(-49.323232, 49.488882))
                local Vec2 = Vector3.new(-254.47802734375, 68.99893188476562, math.random(-49.323232, 49.488882))
                local Vec3 = v.Character.LowerTorso
                local Vec4 = Vector3.new(-222.7018585205078, 60.864871978759766, math.random(-49.323232, 49.488882))
                
                game:GetService("ReplicatedStorage").Remotes.Shoot:FireServer(Vec1, Vec2, Vec3, Vec4)
            end)
        end)
    end
end

-- Rage Mode Tab
local Tab = Window:MakeTab({
	Name = "Rage Mode",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Kill All [OP]",
	Callback = function()
    	kill_all()
  	end    
})

Tab:AddToggle({
	Name = "Loop Kill All [OP]",
	Default = false,
	Callback = function(auto)
        while auto do
        	kill_all()
        	wait(0.0000001)
        end
	end    
})

-- ESP Tab
local Tab = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "3D Box",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/3DBox"))()
  	end    
})

Tab:AddButton({
	Name = "Arrows",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Arrows"))()
  	end    
})

Tab:AddButton({
	Name = "Sense",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/BoxLine"))()
  	end    
})

Tab:AddButton({
	Name = "BoxesWithChams",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/BoxesWithChams"))()
  	end    
})

Tab:AddButton({
	Name = "CornerBox",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Cornerbox"))()
  	end    
})

Tab:AddButton({
	Name = "DrawingChams",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/DrawingChams"))()
  	end    
})

Tab:AddButton({
	Name = "Health",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Health"))()
  	end    
})

Tab:AddButton({
	Name = "Highlight",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Highlight"))()
  	end    
})

Tab:AddButton({
	Name = "InvisOutline",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/InvisibleOutline"))()
  	end    
})

Tab:AddButton({
	Name = "NameTags",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Name"))()
  	end    
})

Tab:AddButton({
	Name = "Radar",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Radar"))()
  	end    
})

Tab:AddButton({
	Name = "Skeleton",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Skeleton"))()
  	end    
})

Tab:AddButton({
	Name = "WeirdTracers",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/ToungeTracers"))()
  	end    
})

Tab:AddButton({
	Name = "Tracers",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Tracers"))()
  	end    
})

Tab:AddButton({
	Name = "TracersWithBoxes",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/TracersWithBoxes"))()
  	end
})
