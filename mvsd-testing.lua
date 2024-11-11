-- Checks for the required UI element before creating the toggle UI
if gethui():FindFirstChild("Orion") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("ToggleUi") == nil then
    local TOGGLE = {}

    -- Create UI elements
    TOGGLE["Ui"] = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    TOGGLE["DaIcon"] = Instance.new("ImageButton", TOGGLE["Ui"])
    TOGGLE["das"] = Instance.new("UICorner", TOGGLE["DaIcon"])

    -- Configure UI settings
    TOGGLE["Ui"].Name = "ToggleUi"
    TOGGLE["Ui"].ResetOnSpawn = false
    TOGGLE["DaIcon"].Size = UDim2.new(0,45,0,45)
    TOGGLE["DaIcon"].Position = UDim2.new(0,0,0,0)
    TOGGLE["DaIcon"].Draggable = true
    TOGGLE["DaIcon"].Image = "rbxassetid://" -- Set an asset ID if needed
    TOGGLE["DaIcon"].BackgroundColor3 = Color3.fromRGB(255, 186, 117)
    TOGGLE["DaIcon"].BorderColor3 = Color3.fromRGB(255, 186, 117)
    TOGGLE["das"]["CornerRadius"] = UDim.new(0.2, 0)

    -- Animation loop for the icon color
    task.spawn(function()
        while true do
            for i = 0, 255, 4 do
                TOGGLE["DaIcon"].BorderColor3 = Color3.fromHSV(i/256, 1, 1)
                TOGGLE["DaIcon"].BackgroundColor3 = Color3.fromHSV(i/256, .5, .8)
                wait()
            end
        end
    end)

    -- Toggle Orion UI visibility on icon click
    TOGGLE["DaIcon"].MouseButton1Click:Connect(function()
        if gethui():FindFirstChild("Orion") then
            for _, v in pairs(gethui():GetChildren()) do
                if v.Name == "Orion" then
                    v.Enabled = not v.Enabled
                end
            end
        end
    end)
end

-- Update animations in LocalPlayer’s character
local Animate = game.Players.LocalPlayer.Character.Animate

while true do
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
    wait(-999)  -- Infinite loop pause
end

-- Function to kill all players in-game
function kill_all()
    -- Equip the first tool with "Fire" in the backpack
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:FindFirstChild("Fire") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            break
        end
    end

    -- Shoot at every player
    for _, v in pairs(game.Players:GetPlayers()) do
        task.spawn(function()
            pcall(function()
                local Vec1 = Vector3.new(-186.466, 49.749, math.random(-49.323, 49.488))
                local Vec2 = Vector3.new(-254.478, 68.998, math.random(-49.323, 49.488))
                local Vec3 = v.Character.LowerTorso
                local Vec4 = Vector3.new(-222.701, 60.864, math.random(-49.323, 49.488))
                
                game:GetService("ReplicatedStorage").Remotes.Shoot:FireServer(Vec1, Vec2, Vec3, Vec4)
            end)
        end)
    end
end

-- Initialize Orion library and VapeBypasses
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local VapeBypasses = loadstring(game:HttpGet("https://nxyq.github.io/vape-bypasses.lua"))("vxpe.ro-bypass.wf/spoof/source.lua")

-- Create the main UI window
local Window = OrionLib:MakeWindow({
    Name = [[<font color="rgb(17, 35, 171)">Moon Client | MVSD</font>]],
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

-- Information Tab
local Tab = Window:MakeTab({
    Name = "Information",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddParagraph("Credits", "Script by pkplaysrblx with contributions by externalbypassed, wyvernify, and Simple Spy.")
Tab:AddParagraph("Bypasses", "Using Vape Bypasses. Use at your own risk as bans may still occur.")

-- Main Tab
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
})

Tab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(v)
        local InfiniteJumpEnabled = v
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end    
})

Tab:AddTextbox({
    Name = "Hitbox",
    Default = "default input lol",
    TextDisappear = true,
    Callback = function(x)
        _G.HeadSize = x
        _G.Disabled = true

        game:GetService("RunService").RenderStepped:connect(function()
            if _G.Disabled then
                for _, v in next, game:GetService("Players"):GetPlayers() do
                    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end
})

-- Rage Mode Tab
local Tab = Window:MakeTab({
    Name = "Rage Mode",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddButton({
    Name = "Kill All [OP]",
    Callback = function() kill_all() end
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
local ESP_URLs = {
    ["3D Box"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/3DBox",
    ["Arrows"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Arrows",
    ["Sense"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/BoxLine",
    ["BoxesWithChams"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/BoxesWithChams",
    ["CornerBox"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Cornerbox",
    ["DrawingChams"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/DrawingChams",
    ["Health"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Health",
    ["Highlight"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Highlight",
    ["InvisOutline"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/InvisibleOutline",
    ["NameTags"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Name",
    ["Radar"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Radar",
    ["Skeleton"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Skeleton",
    ["WeirdTracers"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/ToungeTracers",
    ["Tracers"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/Tracers",
    ["TracersWithBoxes"] = "https://raw.githubusercontent.com/pkplaysrblx/ESP/refs/heads/main/TracersWithBoxes"
}

for espName, url in pairs(ESP_URLs) do
    Tab:AddButton({
        Name = espName,
        Callback = function()
            pcall(function()
                local espScript = game:HttpGet(url)
                loadstring(espScript)()
            end)
        end
    })
end
