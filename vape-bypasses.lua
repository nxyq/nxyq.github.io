--[[
    vape bypasses
]]

--[[
giangplay's bypass
]]
local bypass;
    bypass = hookmetamethod(game, "__namecall", function(method, ...) 
        if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
            return
        end
        return bypass(method, ...)
    end)

--[[
ghostplayer's bypass
]]
local old
old = hookmetamethod(
game,
"__namecall",
function(self, ...)
local method = tostring(getnamecallmethod())
if string.lower(method) == "kick" then
return wait(9e9)
end
return old(self, ...)
end)

--1st Method
Y = hookmetamethod(game,"__namecall",function(self,...)
local args = {...};
local checkargs = {};
local method = getnamecallmethod()
local last
if method == "Fire" or method == "FireServer" then
if self.Name == "MessagePosted" or self.Name == "SayMessageRequest" then
last = args[1]
if last == args[1] then
return Y(self,...)
else
return
end
if method == "ReportAbuse" and self == game.Players.LocalPlayer then
return
end
end
end
return Y(self,...)
end)
--2nd Method
if not game:IsLoaded() then
game.Loaded:Wait()
end
if game.PlaceId ~= 7056922815 then
if game.PlaceId ~= 4991214437 then
if game.PlaceId ~= 7298553006 then
if game.PlaceId ~= 8934886191 then
if game.PlaceId ~= 6494527314 then
local LP = game:GetService('Players').LocalPlayer
local PlayerScripts = LP ~= nil and LP:FindFirstChild('PlayerScripts') or nil
local ChatScript = PlayerScripts ~= nil and PlayerScripts:FindFirstChild('ChatScript') or nil
local ChatMain = ChatScript ~= nil and ChatScript:FindFirstChild('ChatMain') or nil
if LP and ChatMain ~= nil then
local Old, Chatted, OldChatted = nil, Instance.new('BindableEvent'), LP.Chatted; Chatted.Name = LP.Name..'_Chatted_Event'
Old = hookmetamethod(game, '__index', newcclosure(function(self, Index)
if checkcaller() and self == LP and Index == 'Chatted' then
return Chatted.Event
elseif not checkcaller() and self == LP and Index == 'Chatted' then
return OldChatted
end

return Old(self, Index)
end))

local Old2, MessagePosted = nil, require(ChatMain).MessagePosted
if MessagePosted ~= "sakanade" then
Old2 = hookfunction(MessagePosted.fire, function(self, ...)
if not checkcaller() then
print(self, ...)
return Chatted:Fire(...)
end
end)
end
end
end
end
end
end
end
--3rd Method
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

--[[
eazvy's bypass
]]

	repeat wait() until game:IsLoaded()
	
	--{Services
	local Players = game:GetService("Players")
	--}
	
	--{Vars 
	local LocalPlayer = Players.LocalPlayer
	--}
	
	
	local function CheckRank()
		do 
			for _,v in pairs(Players:GetChildren()) do 
				if v~= LocalPlayer and v:IsInGroup(game.CreatorId) then 
					local Rank = v:GetRoleInGroup(game.CreatorId)
					local CheckRank = v:GetRankInGroup(game.CreatorId)
					if _G.Settings.CheckRole then 
						if table.find(_G.Settings.CheckRoles, Rank)  then 
						   LocalPlayer:Kick(v.Name .. " is in the game | Rank: " .. Rank .. " | Anti-Ban Check Roles")
					   end
					end
					if CheckRank >= _G.Settings.Rank then 
						LocalPlayer:Kick(v.Name .. " is in the game | Rank: " .. Rank .. " | Anti-Ban Rank")
					end
				end
			end
		end
	end
	
	Players.PlayerAdded:Connect(function(player)
		if player:IsInGroup(game.CreatorId) then
			local Rank = v:GetRoleInGroup(game.CreatorId)
			local CheckRank = v:GetRankInGroup(game.CreatorId)
			if _G.Settings.CheckRole then 
			   if table.find(_G.Settings.CheckRoles, Rank)  then 
				  LocalPlayer:Kick(player.Name .. " is in the game | Rank: " .. Rank .. " | Anti-Ban Check-Roles")
				end
			end
			if CheckRank > _G.Settings.Rank then 
			   LocalPlayer:Kick(player.Name .. "has joined the game | Rank: " .. Rank .. " Anti-Ban Rank")
			end
		end
	end)
	
	
	CheckRank()

 --[[
     GGH25lan's bypass
]]

--game.Players.localPlayer:kick() --remove "--" to kick u self
 
--Auto execute highly recommended (use it)

game:GetService("StarterGui"):SetCore("SendNotification",{
 Title = "Vape";
 Text = "The bypasses have been executed. I, pkplaysrblx has collected every bypass I found. The real credits go to the actual owners.";
 Duration = 5;
 Icon = "rbxassetid://14260295451";
})

gui = game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt")

gui.Size = UDim2.new(0, 400, 0, 230)

leave = gui.MessageArea.ErrorFrame.ButtonArea.LeaveButton

gui.MessageArea.MessageAreaPadding.PaddingTop = UDim.new(0,-20)
gui.MessageArea.ErrorFrame.ErrorFrameLayout.Padding = UDim.new(0, 5)

gui.MessageArea.ErrorFrame.ButtonArea.ButtonLayout.CellPadding = UDim2.new(0, 0, 0, 5)

if not leave.Parent:FindFirstChild"Rejoin" then
rejoin = leave:Clone()
rejoin.Parent = leave.Parent
rejoin.Name="Rejoin"
rejoin.ButtonText.Text = "Rejoin"
end

Players = game:GetService("Players")
TeleportService = game:GetService("TeleportService")

rejoin.MouseButton1Click:Connect(function()
 if #Players:GetPlayers() <= 1 then
game.Players.localPlayer:kick("Rejoining...")
rejoin: destroy ()
wait(1)
  TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
 else
  TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
 end
end)

--[[
	 notification
]]

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local vape = Instance.new("ImageLabel")
local msg = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.155
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.476347625, 0, 0.719551265, 0)
Frame.Size = UDim2.new(0.510451019, 0, 0.254807681, 0)

UICorner.Parent = Frame

vape.Name = "vape"
vape.Parent = Frame
vape.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vape.BackgroundTransparency = 1.000
vape.BorderColor3 = Color3.fromRGB(0, 0, 0)
vape.BorderSizePixel = 0
vape.Position = UDim2.new(0.331896544, 0, 0.0503144637, 0)
vape.Size = UDim2.new(0.336206883, 0, 0.276729554, 0)
vape.Image = "rbxassetid://13350872035"

msg.Name = "msg"
msg.Parent = Frame
msg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
msg.BackgroundTransparency = 1.000
msg.BorderColor3 = Color3.fromRGB(0, 0, 0)
msg.BorderSizePixel = 0
msg.Position = UDim2.new(0, 0, 0.32704404, 0)
msg.Size = UDim2.new(1, 0, 0.67295599, 0)
msg.Font = Enum.Font.FredokaOne
msg.Text = "Thank you for using VAPE's bypasser. The bypasser includes the following people: Giangplay, Eazvy and GhostPlayer. Me (nxyq) has put all of the bypasses into 1."
msg.TextColor3 = Color3.fromRGB(255, 255, 255)
msg.TextScaled = true
msg.TextSize = 14.000
msg.TextWrapped = true

UIAspectRatioConstraint.Parent = Frame
UIAspectRatioConstraint.AspectRatio = 2.918

-- Scripts:

local function YTHTO_fake_script() -- msg.LocalScript 
	local script = Instance.new('LocalScript', msg)

	local TL = script.Parent.Parent:FindFirstChild("msg")
	
	TL.Font = Enum.Font.GothamBold
end
coroutine.wrap(YTHTO_fake_script)()
local function TMXUSCJ_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local TweenService = game:GetService("TweenService")
	local frame = game.Players.LocalPlayer.PlayerGui.ScreenGui:WaitForChild("Frame")  -- Ensure 'Frame' is a child of the LocalScript's parent GUI element
	
	-- Set initial position off-screen to the far right
	frame.Position = UDim2.new(1, 0, 0.72, 0)
	
	-- Define the target position
	local targetPosition = UDim2.new(0.476, 0, 0.72, 0)
	local startPosition = UDim2.new(1, 0, 0.72, 0)  -- Far right off-screen
	
	-- Define tween info for the animation (1-second duration, easing style)
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	
	-- Create tweens for moving to the target position and back
	local moveToTarget = TweenService:Create(frame, tweenInfo, { Position = targetPosition })
	local moveToStart = TweenService:Create(frame, tweenInfo, { Position = startPosition })
	
	-- Function to play the animation sequence
	local function animateFrame()
		wait(2)
		moveToTarget:Play()  -- Move to target position
		moveToTarget.Completed:Wait()  -- Wait until the tween to target position is finished
	
		wait(5)  -- Wait for 5 seconds at the target position
	
		moveToStart:Play()  -- Move back to the far right (starting position)
	end
	
	-- Start the animation
	animateFrame()
	
end
coroutine.wrap(TMXUSCJ_fake_script)()
