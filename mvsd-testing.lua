--[[
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                    :.....    .........................   .......                                   
                    :...                                .............                               
                     -..................            ...................:                            
                                    :............            :............                          
                                   ... .....:                     ..........                        
                                 :.. .....                           ...  ...:                      
        =------      -----------...  ..:                               ..   ..:                     
      ..  ....  .: ..           ......         :...............:        ..   ..:                    
      ..  ....  .::..   ....... .....        :..  ............. .:        .   ..:                   
       -.......:    :..........  ...        ..                  ..:        ..   .:                  
                            :......        ..   .............. .. .:       =..  ..                  
                            ......       :... ...             ..  ...       ..  ..-                 
                            .    .      :.. ....               .   ...      :.  ...                 
                           +.   ..     :... ..-                 ..   ..:     .   ..                 
              :...............  ..    :... ..:                   :..  ..-    ... ..                 
             : .  ........      ..    .......:                   ..  ...     ..   .                 
             -.....       ....  ..     :......:                 ...  ..:     .    .                 
               :::::::::::::..  ..      :.......               .... ..      ..    .                 
                            ..  ..-       .......            :..   ..       .. ...-                 
                            :......        .....................  .:        :.....                  
                             : .....        :.                   .=                                 
                              .......        :..                .                                   
                               .......:        -:::::::::::::::                                     
                                ........                                                            
                                  .... ...                                                          
                                   :..   ....                                                       
                                     ..     ......-         -.......:                               
                                       :.......   ....  ....... .....                               
                                          :.. ..          ....   ...                                
                                              :....  ...........:                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
Welcome 2 Nitro Client (Moon Client)
]]

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
Tab:AddParagraph("Updates","[+] Started script\n[+] Added hitbox, options to expand and number\n[+] Added kill-all function\n [-] Removed silent aim and fov.")
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
--[[
dont skid or i will send 100 tyrones to fuck you!
]]
local Tab = Window:MakeTab({
	Name = "Universal Avatar",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Character Customization"
})


Tab:AddButton({
	Name = "Headless [R15 & R6]",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Invooker11/Koblox-and-Headless/main/Headless", true))()
  	end    
})


Tab:AddButton({
	Name = "Korblox Right Leg [R15 ONLY]",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Invooker11/Koblox-and-Headless/main/Right%20Leg", true))()
  	end    
})


Tab:AddButton({
	Name = "Korblox Left Leg [R15 ONLY]",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Invooker11/Koblox-and-Headless/main/Left%20leg", true))()
  	end    
})


local Section = Tab:AddSection({
	Name = "Faces"
})


Tab:AddButton({
	Name = "Red Beast Mode [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://129003756" 		
  	end    
})


Tab:AddButton({
	Name = "Playful Vampire [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://6779437898" 		
  	end    
})


Tab:AddButton({
	Name = "Super Super Happy Face [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://6779442089"
  	end    
})


Tab:AddButton({
	Name = "Yum! [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://6779401729"
  	end    
})



Tab:AddButton({
	Name = "Red Glowing Eyes [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://6779462397"
  	end    
})


Tab:AddButton({
	Name = "Prankster [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://20052028"
  	end    
})


Tab:AddButton({
	Name = "ROBLOX Madness [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://479872791"
  	end    
})


Tab:AddButton({
	Name = "The Dog Whisper [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://34764373"
  	end    
})


Tab:AddButton({
	Name = "Evil Skeptic [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://110287983"
  	end    
})


Tab:AddButton({
	Name = "Red Tango [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://629930519"
  	end    
})


Tab:AddButton({
	Name = "Angelic [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://45083898"
  	end    
})


Tab:AddButton({
	Name = "Green Glowing Eyes [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://398676207"
  	end    
})


Tab:AddButton({
	Name = "Troublemaker [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://22920500"
  	end    
})


Tab:AddButton({
	Name = "Paintball Enthusiast [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://23310996"
  	end    
})


Tab:AddButton({
	Name = "Grandma's Lipstick [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://51241479"
  	end    
})


Tab:AddButton({
	Name = "Facepalm [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://30394593"
  	end    
})


Tab:AddButton({
	Name = "Country Morning [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://51241521"
  	end    
})


Tab:AddButton({
	Name = "Optimist [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://21024598"
  	end    
})


Tab:AddButton({
	Name = "Camoface [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://24441824"
  	end    
})


Tab:AddButton({
	Name = "Bandage [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://20418584"
  	end    
})


Tab:AddButton({
	Name = "Silver Punk Face [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://387256104"
  	end    
})


Tab:AddButton({
	Name = "Green Whatchoo Talkin' Bout [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://629936597"
  	end    
})


Tab:AddButton({
	Name = "Red RAWR [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://66329788"
  	end    
})


Tab:AddButton({
	Name = "Blizzard Beast Mode [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://209712379"
  	end    
})


Tab:AddButton({
	Name = "Tattletale [R15 & R6]",
	Callback = function()
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.Head.face.Texture = "rbxassetid://26343132"
  	end    
})




-- Hats section --
-- Here there will be limited hats such as the dominus. & there will maybe have also hairs. --
local Section = Tab:AddSection({
	Name = "Valkyrie"
})

Tab:AddButton({
	Name = "Black Valkyrie [R15 & R6]",
	Callback = function()
        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(c, d, b, _, a, e)
            local f = Instance.new("Weld")
            f.Name = c
            f.Part0 = b
            f.Part1 = _
            f.C0 = a
            f.C1 = e
            f.Parent = d
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, e)
            e.Parent = _
            local d = e:FindFirstChild("Handle")
            if d then
                local c = d:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = a(_, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = e.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 124730194
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
        end
})


Tab:AddButton({
	Name = "Emerald Valkyrie [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, c, b, d, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = c
            f.Part1 = b
            f.C0 = d
            f.C1 = e
            f.Parent = a
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(c, e)
            e.Parent = c
            local d = e:FindFirstChild("Handle")
            if d then
                local a = d:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = b(c, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = c:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local b = e.AttachmentPoint
                        _("HeadWeld", c, c, d, a, b)
                    end
                end
            end
        end
        local _ = 2830437685
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Violet Valkyrie [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(e, d, c, a, b, _)
            local f = Instance.new("Weld")
            f.Name = e
            f.Part0 = c
            f.Part1 = a
            f.C0 = b
            f.C1 = _
            f.Parent = d
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, e)
            e.Parent = _
            local d = e:FindFirstChild("Handle")
            if d then
                local c = d:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = a(_, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = e.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 1402432199
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Valiant Valkyrie of Testing [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(_, b, a, d, e, c)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = a
            f.Part1 = d
            f.C0 = e
            f.C1 = c
            f.Parent = b
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, d)
            d.Parent = _
            local e = d:FindFirstChild("Handle")
            if e then
                local a = e:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = c(_, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = d.AttachmentPoint
                        b("HeadWeld", c, c, e, _, a)
                    end
                end
            end
        end
        local _ = 7781687598
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Valkyrie Helm [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(c, b, _, a, d, e)
            local f = Instance.new("Weld")
            f.Name = c
            f.Part0 = _
            f.Part1 = a
            f.C0 = d
            f.C1 = e
            f.Parent = b
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, d)
            d.Parent = _
            local e = d:FindFirstChild("Handle")
            if e then
                local c = e:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = a(_, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local _ = d.AttachmentPoint
                        b("HeadWeld", c, c, e, a, _)
                    end
                end
            end
        end
        local _ = 1365767
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Sparkle Time Valkyrie [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(e, d, b, c, a, _)
            local f = Instance.new("Weld")
            f.Name = e
            f.Part0 = b
            f.Part1 = c
            f.C0 = a
            f.C1 = _
            f.Parent = d
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, e)
            e.Parent = _
            local d = e:FindFirstChild("Handle")
            if d then
                local a = d:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = c(_, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = e.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 1180433861
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Ice Valkyrie [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(a, _, b, c, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = b
            f.Part1 = c
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, a)
            a.Parent = e
            local c = a:FindFirstChild("Handle")
            if c then
                local d = c:FindFirstChildOfClass("Attachment")
                if d then
                    local _ = b(e, d.Name)
                    if _ then
                        l(_, d)
                    end
                else
                    local d = e:FindFirstChild("Head")
                    if d then
                        local b = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        _("HeadWeld", d, d, c, b, a)
                    end
                end
            end
        end
        local _ = 4390891467
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


local Section = Tab:AddSection({
	Name = "Fiery Horns"
})


Tab:AddButton({
	Name = "Fiery Horns of the Netherworld [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(c, a, e, d, b, _)
            local f = Instance.new("Weld")
            f.Name = c
            f.Part0 = e
            f.Part1 = d
            f.C0 = b
            f.C1 = _
            f.Parent = a
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, _)
            _.Parent = e
            local d = _:FindFirstChild("Handle")
            if d then
                local a = d:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = c(e, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = e:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local _ = _.AttachmentPoint
                        b("HeadWeld", c, c, d, a, _)
                    end
                end
            end
        end
        local _ = 215718515
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Frozen Horns of the Frigid Planes [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, b, d, c, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = d
            f.C0 = c
            f.C1 = e
            f.Parent = a
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, c)
            c.Parent = e
            local d = c:FindFirstChild("Handle")
            if d then
                local b = d:FindFirstChildOfClass("Attachment")
                if b then
                    local _ = a(e, b.Name)
                    if _ then
                        l(_, b)
                    end
                else
                    local e = e:FindFirstChild("Head")
                    if e then
                        local b = CFrame.new(0, 0.5, 0)
                        local a = c.AttachmentPoint
                        _("HeadWeld", e, e, d, b, a)
                    end
                end
            end
        end
        local _ = 74891470
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Poisoned Horns of the Toxic Wasteland [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(c, e, _, b, d, a)
            local f = Instance.new("Weld")
            f.Name = c
            f.Part0 = _
            f.Part1 = b
            f.C0 = d
            f.C1 = a
            f.Parent = e
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(b, c)
            c.Parent = b
            local d = c:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = a(b, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local e = b:FindFirstChild("Head")
                    if e then
                        local a = CFrame.new(0, 0.5, 0)
                        local b = c.AttachmentPoint
                        _("HeadWeld", e, e, d, a, b)
                    end
                end
            end
        end
        local _ = 1744060292
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


local Section = Tab:AddSection({
	Name = "Dominus's"
})



Tab:AddButton({
	Name = "Dominus Vespertilio [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(c, b, _, a, d, e)
            local f = Instance.new("Weld")
            f.Name = c
            f.Part0 = _
            f.Part1 = a
            f.C0 = d
            f.C1 = e
            f.Parent = b
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(d, a)
            a.Parent = d
            local c = a:FindFirstChild("Handle")
            if c then
                local e = c:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = b(d, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local d = d:FindFirstChild("Head")
                    if d then
                        local b = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        _("HeadWeld", d, d, c, b, a)
                    end
                end
            end
        end
        local _ = 96103379
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Dominus Rex [R15 & R6]",
	Callback = function()
            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(d, e, c, b, a, _)
            local f = Instance.new("Weld")
            f.Name = d
            f.Part0 = c
            f.Part1 = b
            f.C0 = a
            f.C1 = _
            f.Parent = e
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(c, _)
            _.Parent = c
            local d = _:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = a(c, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = c:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local _ = _.AttachmentPoint
                        b("HeadWeld", c, c, d, a, _)
                    end
                end
            end
        end
        local _ = 250395631
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Dominus Praefectus [R15 & R6]",
	Callback = function()
	            function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function a(a, _, e, c, d, b)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = e
            f.Part1 = c
            f.C0 = d
            f.C1 = b
            f.Parent = _
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, _)
            _.Parent = e
            local d = _:FindFirstChild("Handle")
            if d then
                local c = d:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = b(e, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = e:FindFirstChild("Head")
                    if c then
                        local b = CFrame.new(0, 0.5, 0)
                        local _ = _.AttachmentPoint
                        a("HeadWeld", c, c, d, b, _)
                    end
                end
            end
        end
        local _ = 527365852
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Dominus Messor [R15 & R6]",
	Callback = function()
	    	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(e, c, d, b, _, a)
            local f = Instance.new("Weld")
            f.Name = e
            f.Part0 = d
            f.Part1 = b
            f.C0 = _
            f.C1 = a
            f.Parent = c
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, e)
            e.Parent = _
            local c = e:FindFirstChild("Handle")
            if c then
                local d = c:FindFirstChildOfClass("Attachment")
                if d then
                    local _ = a(_, d.Name)
                    if _ then
                        l(_, d)
                    end
                else
                    local d = _:FindFirstChild("Head")
                    if d then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = e.AttachmentPoint
                        b("HeadWeld", d, d, c, _, a)
                    end
                end
            end
        end
        local _ = 64444871
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Dominus Infernus [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(c, d, b, _, a, e)
            local f = Instance.new("Weld")
            f.Name = c
            f.Part0 = b
            f.Part1 = _
            f.C0 = a
            f.C1 = e
            f.Parent = d
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(a, d)
            d.Parent = a
            local e = d:FindFirstChild("Handle")
            if e then
                local c = e:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = b(a, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = a:FindFirstChild("Head")
                    if c then
                        local b = CFrame.new(0, 0.5, 0)
                        local a = d.AttachmentPoint
                        _("HeadWeld", c, c, e, b, a)
                    end
                end
            end
        end
        local _ = 31101391
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Dominus Frigidus [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(c, _, a, b, d, e)
            local f = Instance.new("Weld")
            f.Name = c
            f.Part0 = a
            f.Part1 = b
            f.C0 = d
            f.C1 = e
            f.Parent = _
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(a, d)
            d.Parent = a
            local e = d:FindFirstChild("Handle")
            if e then
                local c = e:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = b(a, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = a:FindFirstChild("Head")
                    if c then
                        local b = CFrame.new(0, 0.5, 0)
                        local a = d.AttachmentPoint
                        _("HeadWeld", c, c, e, b, a)
                    end
                end
            end
        end
        local _ = 48545806
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Dominus Formidulosus [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(e, c, d, b, a, _)
            local f = Instance.new("Weld")
            f.Name = e
            f.Part0 = d
            f.Part1 = b
            f.C0 = a
            f.C1 = _
            f.Parent = c
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, _)
            _.Parent = e
            local c = _:FindFirstChild("Handle")
            if c then
                local d = c:FindFirstChildOfClass("Attachment")
                if d then
                    local _ = a(e, d.Name)
                    if _ then
                        l(_, d)
                    end
                else
                    local d = e:FindFirstChild("Head")
                    if d then
                        local a = CFrame.new(0, 0.5, 0)
                        local _ = _.AttachmentPoint
                        b("HeadWeld", d, d, c, a, _)
                    end
                end
            end
        end
        local _ = 4255053867
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Dominus Empyreus [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(_, a, b, d, c, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = d
            f.C0 = c
            f.C1 = e
            f.Parent = a
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, d)
            d.Parent = _
            local e = d:FindFirstChild("Handle")
            if e then
                local a = e:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = c(_, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local _ = d.AttachmentPoint
                        b("HeadWeld", c, c, e, a, _)
                    end
                end
            end
        end
        local _ = 21070012
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


Tab:AddButton({
	Name = "Dominus Aureus [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(e, d, b, c, a, _)
            local f = Instance.new("Weld")
            f.Name = e
            f.Part0 = b
            f.Part1 = c
            f.C0 = a
            f.C1 = _
            f.Parent = d
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, e)
            e.Parent = _
            local d = e:FindFirstChild("Handle")
            if d then
                local c = d:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = a(_, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = e.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 138932314
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Dominus Astra [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 162067148
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

local Section = Tab:AddSection({
	Name = "Sparkle Time Fedora's"
})


Tab:AddButton({
	Name = "Sky-Blue-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = a
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(a, c)
            c.Parent = a
            local d = c:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = b(a, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local e = a:FindFirstChild("Head")
                    if e then
                        local a = CFrame.new(0, 0.5, 0)
                        local b = c.AttachmentPoint
                        _("HeadWeld", e, e, d, a, b)
                    end
                end
            end
        end
        local _ = 493476042
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function a(_, b, a, d, e, c)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = a
            f.Part1 = d
            f.C0 = e
            f.C1 = c
            f.Parent = b
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, _)
            _.Parent = e
            local d = _:FindFirstChild("Handle")
            if d then
                local c = d:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = b(e, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = e:FindFirstChild("Head")
                    if c then
                        local b = CFrame.new(0, 0.5, 0)
                        local _ = _.AttachmentPoint
                        a("HeadWeld", c, c, d, b, _)
                    end
                end
            end
        end
        local _ = 1285307
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Teal-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(e, c, d, b, _, a)
            local f = Instance.new("Weld")
            f.Name = e
            f.Part0 = d
            f.Part1 = b
            f.C0 = _
            f.C1 = a
            f.Parent = c
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, e)
            e.Parent = _
            local d = e:FindFirstChild("Handle")
            if d then
                local a = d:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = c(_, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = e.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 147180077
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Green-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(c, b, _, a, d, e)
            local f = Instance.new("Weld")
            f.Name = c
            f.Part0 = _
            f.Part1 = a
            f.C0 = d
            f.C1 = e
            f.Parent = b
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(c, d)
            d.Parent = c
            local e = d:FindFirstChild("Handle")
            if e then
                local b = e:FindFirstChildOfClass("Attachment")
                if b then
                    local _ = a(c, b.Name)
                    if _ then
                        l(_, b)
                    end
                else
                    local c = c:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local b = d.AttachmentPoint
                        _("HeadWeld", c, c, e, a, b)
                    end
                end
            end
        end
        local _ = 100929604
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Midnight-Blue-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, b, c, e, d)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = c
            f.C0 = e
            f.C1 = d
            f.Parent = a
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, b)
            b.Parent = e
            local c = b:FindFirstChild("Handle")
            if c then
                local d = c:FindFirstChildOfClass("Attachment")
                if d then
                    local _ = a(e, d.Name)
                    if _ then
                        l(_, d)
                    end
                else
                    local d = e:FindFirstChild("Head")
                    if d then
                        local a = CFrame.new(0, 0.5, 0)
                        local b = b.AttachmentPoint
                        _("HeadWeld", d, d, c, a, b)
                    end
                end
            end
        end
        local _ = 119916949
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Red-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(d, e, c, b, a, _)
            local f = Instance.new("Weld")
            f.Name = d
            f.Part0 = c
            f.Part1 = b
            f.C0 = a
            f.C1 = _
            f.Parent = e
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, d)
            d.Parent = _
            local e = d:FindFirstChild("Handle")
            if e then
                local a = e:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = c(_, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local _ = d.AttachmentPoint
                        b("HeadWeld", c, c, e, a, _)
                    end
                end
            end
        end
        local _ = 72082328
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Purple-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, b, a, e, c, d)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = a
            f.Part1 = e
            f.C0 = c
            f.C1 = d
            f.Parent = b
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(c, e)
            e.Parent = c
            local d = e:FindFirstChild("Handle")
            if d then
                local b = d:FindFirstChildOfClass("Attachment")
                if b then
                    local _ = a(c, b.Name)
                    if _ then
                        l(_, b)
                    end
                else
                    local c = c:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local b = e.AttachmentPoint
                        _("HeadWeld", c, c, d, a, b)
                    end
                end
            end
        end
        local _ = 63043890
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Black-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, e, c, d, b, a)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = c
            f.Part1 = d
            f.C0 = b
            f.C1 = a
            f.Parent = e
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(a, c)
            c.Parent = a
            local e = c:FindFirstChild("Handle")
            if e then
                local d = e:FindFirstChildOfClass("Attachment")
                if d then
                    local _ = b(a, d.Name)
                    if _ then
                        l(_, d)
                    end
                else
                    local d = a:FindFirstChild("Head")
                    if d then
                        local a = CFrame.new(0, 0.5, 0)
                        local b = c.AttachmentPoint
                        _("HeadWeld", d, d, e, a, b)
                    end
                end
            end
        end
        local _ = 259423244
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "White-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(d, e, c, a, b, _)
            local f = Instance.new("Weld")
            f.Name = d
            f.Part0 = c
            f.Part1 = a
            f.C0 = b
            f.C1 = _
            f.Parent = e
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, _)
            _.Parent = e
            local d = _:FindFirstChild("Handle")
            if d then
                local a = d:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = c(e, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = e:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local _ = _.AttachmentPoint
                        b("HeadWeld", c, c, d, a, _)
                    end
                end
            end
        end
        local _ = 1016143686
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Pink-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(d, _, a, b, c, e)
            local f = Instance.new("Weld")
            f.Name = d
            f.Part0 = a
            f.Part1 = b
            f.C0 = c
            f.C1 = e
            f.Parent = _
            return f
        end
        local function b(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = b(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(c, d)
            d.Parent = c
            local e = d:FindFirstChild("Handle")
            if e then
                local a = e:FindFirstChildOfClass("Attachment")
                if a then
                    local _ = b(c, a.Name)
                    if _ then
                        l(_, a)
                    end
                else
                    local c = c:FindFirstChild("Head")
                    if c then
                        local a = CFrame.new(0, 0.5, 0)
                        local b = d.AttachmentPoint
                        _("HeadWeld", c, c, e, a, b)
                    end
                end
            end
        end
        local _ = 334663683
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Orange-Sparkle-Time-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(d, e, b, c, a, _)
            local f = Instance.new("Weld")
            f.Name = d
            f.Part0 = b
            f.Part1 = c
            f.C0 = a
            f.C1 = _
            f.Parent = e
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, d)
            d.Parent = _
            local e = d:FindFirstChild("Handle")
            if e then
                local c = e:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = a(_, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = d.AttachmentPoint
                        b("HeadWeld", c, c, e, _, a)
                    end
                end
            end
        end
        local _ = 215751161
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Bluesteel-Fedora [R15 & R6]",
	Callback = function()
	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, b, d, c, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = d
            f.C0 = c
            f.C1 = e
            f.Parent = a
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(b, d)
            d.Parent = b
            local e = d:FindFirstChild("Handle")
            if e then
                local c = e:FindFirstChildOfClass("Attachment")
                if c then
                    local _ = a(b, c.Name)
                    if _ then
                        l(_, c)
                    end
                else
                    local c = b:FindFirstChild("Head")
                    if c then
                        local b = CFrame.new(0, 0.5, 0)
                        local a = d.AttachmentPoint
                        _("HeadWeld", c, c, e, b, a)
                    end
                end
            end
        end
        local _ = 98346834
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})


local Section = Tab:AddSection({
	Name = "Roblox Admin Accessories"
})

Tab:AddButton({
	Name = "Golden Roblox Bowler [R15 & R6]",
	Callback = function()
    	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 2910028689
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Goldlika: Bloxstar [R15 & R6]",
	Callback = function()
        	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 4637651199
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

local Section = Tab:AddSection({
	Name = "Other limited hats"
})

Tab:AddButton({
	Name = "Black Iron Horns [R15 & R6]",
	Callback = function()
            	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 628771505
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Supa Dupa Fly Cap [R15 & R6]",
	Callback = function()
                	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 1609401184
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Supa Fly Cap [R15 & R6]",
	Callback = function()
                    	        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 7636350
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Silverthorn Antlers [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 9255011
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "BIG: Silverthorn Antlers [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 477860473
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Golden Antlers [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 193659065
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "The Classic ROBLOX Fedora [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 1029025
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Clockwork's Shades [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 11748356
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Clockwork's Headphones [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 1235488
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Blue Clockwork Headphones [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 1743903423
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "Silver King of the Night [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 439945661
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})

Tab:AddButton({
	Name = "The Void Star [R15 & R6]",
	Callback = function()
     function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function b(a, _, c, b, e, d)
            local f = Instance.new("Weld")
            f.Name = a
            f.Part0 = c
            f.Part1 = b
            f.C0 = e
            f.C1 = d
            f.Parent = _
            return f
        end
        local function c(_, a)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == a then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = c(_, a)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(_, a)
            a.Parent = _
            local d = a:FindFirstChild("Handle")
            if d then
                local e = d:FindFirstChildOfClass("Attachment")
                if e then
                    local _ = c(_, e.Name)
                    if _ then
                        l(_, e)
                    end
                else
                    local c = _:FindFirstChild("Head")
                    if c then
                        local _ = CFrame.new(0, 0.5, 0)
                        local a = a.AttachmentPoint
                        b("HeadWeld", c, c, d, _, a)
                    end
                end
            end
        end
        local _ = 1125510
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players.LocalPlayer.Character, _)
  	end    
})





local Section = Tab:AddSection({
	Name = "Avatar Animations"
})



	local buttons = script.Parent
	local Animate = game.Players.LocalPlayer.Character:WaitForChild("Animate")
	
	game.Players.LocalPlayer.CharacterAdded:Connect(function()
		Animate = game.Players.LocalPlayer.Character:WaitForChild("Animate")
	end)


Tab:AddButton({
	Name = "Zombie [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616168032"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616163682"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616161997"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616156119"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616157476"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Astronaut [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=891667138"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=891636393"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=891627522"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=891609353"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=891617961"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Bubbly [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=910034870"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=910025107"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=910016857"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=910001910"
		Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
		Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Cartoony [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=742640026"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=742638842"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=742637942"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=742636889"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=742637151"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Elder [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=845403856"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=845386501"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=845398858"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=845392038"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=845396048"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Knight [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=657552124"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=657564596"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=658409194"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=658360781"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=657600338"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Levitation [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616013216"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616010382"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616008936"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616003713"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616005863"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Mage [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=707897309"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=707861613"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=707853694"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=707826056"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=707829716"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Ninja [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=656121766"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=656118852"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=656117878"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=656114359"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=656115606"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})



Tab:AddButton({
	Name = "Pirate [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=750785693"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=750783738"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=750782230"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=750779899"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=750780242"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Robot [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616095330"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616091570"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616090535"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616086039"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616087089"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Stylish [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616146177"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616140816"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616139451"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616133594"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616134815"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "SuperHero [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616122287"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616117076"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616115533"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616104706"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=616108001"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Toy [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=782843345"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=782842708"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=782847020"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=782843869"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=782846423"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Vampire [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083473930"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083462077"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083455352"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083439238"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083443587"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Werewolf [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083178339"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083216690"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083218792"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083182000"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=1083189019"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


Tab:AddButton({
	Name = "Oldschool [R15 Only]",
	Callback = function()
    		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=5319828216"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=5319831086"
		Animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=5319847204"
		Animate.run:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=5319844329"
		Animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=5319841935"
		Animate.climb:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=5319816685"
		Animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = "http://www.roblox.com/asset/?id=5319839762"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
  	end    
})


-- VisualWorks (Hats GUI...) -- 
local Section = Tab:AddSection({
	Name = "Other Hats/Accessories"
})


Tab:AddButton({
	Name = "VisualWorks (Hats/Accessories GUI) (NW)",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ForestIsPro/VisualWorks/main/FreeHats'))()
  	end    
})


-- The rainbow body parts section --
-- This section changes your body parts color to rainbow. --
local Section = Tab:AddSection({
	Name = "Rainbow Body Parts"
})


Tab:AddButton({
	Name = "Rainbow Head [R15 & R6]",
	Callback = function()
    -- Head
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local Head = chr.Head
    while wait(0.1) do 
	Head.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Left Arm [R15 Only]",
	Callback = function()
    -- Left Arm
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local LeftUpperArm = chr.LeftUpperArm
    while wait(0.1) do 
	LeftUpperArm.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Right Arm [R15 Only]",
	Callback = function()
    -- Right Arm
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local RightUpperArm = chr.RightUpperArm
    while wait(0.1) do 
	RightUpperArm.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Torso [R15 Only]",
	Callback = function()
    -- Right Leg
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local UpperTorso = chr.UpperTorso
    while wait(0.1) do 
	UpperTorso.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Left Leg [R15 Only]",
	Callback = function()
    -- Left Leg
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local LeftUpperLeg = chr.LeftUpperLeg
    while wait(0.1) do 
	LeftUpperLeg.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Right Leg [R15 Only]",
	Callback = function()
    -- Right Leg
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local RightUpperLeg = chr.RightUpperLeg
    while wait(0.1) do 
	RightUpperLeg.BrickColor = BrickColor.random() 
end
  	end    
})


local Section = Tab:AddSection({
	Name = "R6 Rainbow Body"
})


Tab:AddButton({
	Name = "Rainbow Head [R15 & R6]",
	Callback = function()
    -- Head
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local Head = chr.Head
    while wait(0.1) do 
	Head.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Left Arm [R6 Only]",
	Callback = function()
    -- Left Arm
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local Left Arm = chr["Left Arm"]
    while wait(0.1) do
	local Left Arm.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Right Arm [R6 Only]",
	Callback = function()
    -- Right Arm
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local Right Arm = chr["Right Arm"]
    while wait(0.1) do
	local Right Arm.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Torso [R15 & R6]",
	Callback = function()
    -- Torso
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local Torso = chr.Torso
    while wait(0.1) do 
	Torso.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Left Leg [R6 Only]",
	Callback = function()
    -- Right Leg
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local Left Leg = chr["Left Leg"]
    while wait(0.1) do
	local Left Leg.BrickColor = BrickColor.random() 
end
  	end    
})


Tab:AddButton({
	Name = "Rainbow Right Leg [R6 Only]",
	Callback = function()
    -- Right Leg
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    local Right Leg = chr["Right Leg"]
    while wait(0.1) do
	local Right Leg.BrickColor = BrickColor.random() 
end
  	end    
})
