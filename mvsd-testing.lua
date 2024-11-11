-- Main script starts here

-- Check if `gethui()` exists and supports "Orion"
if gethui and gethui():FindFirstChild("Orion") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("ToggleUi") == nil then
    local TOGGLE = {}
    TOGGLE["Ui"] = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    TOGGLE["DaIcon"] = Instance.new("ImageButton", TOGGLE["Ui"])
    TOGGLE["das"] = Instance.new("UICorner", TOGGLE["DaIcon"])

    TOGGLE["Ui"].Name = "ToggleUi"
    TOGGLE["Ui"].ResetOnSpawn = false

    -- Icon settings
    TOGGLE["DaIcon"].Size = UDim2.new(0, 45, 0, 45)
    TOGGLE["DaIcon"].Position = UDim2.new(0, 0, 0, 0)
    TOGGLE["DaIcon"].Draggable = true
    TOGGLE["DaIcon"].Image = "rbxassetid://" -- Provide actual asset ID here
    TOGGLE["DaIcon"].BackgroundColor3 = Color3.fromRGB(255, 186, 117)
    TOGGLE["DaIcon"].BorderColor3 = Color3.fromRGB(255, 186, 117)
    
    -- Border color animation
    task.spawn(function()
        while true do
            for i = 0, 255, 4 do
                TOGGLE["DaIcon"].BorderColor3 = Color3.fromHSV(i / 256, 1, 1)
                TOGGLE["DaIcon"].BackgroundColor3 = Color3.fromHSV(i / 256, 0.5, 0.8)
                task.wait()
            end
        end
    end)

    -- Toggle visibility of "Orion" GUI
    TOGGLE["DaIcon"].MouseButton1Click:Connect(function()
        if gethui():FindFirstChild("Orion") then
            for _, v in pairs(gethui():GetChildren()) do
                if v.Name == "Orion" then
                    v.Enabled = not v.Enabled
                end
            end
        end
    end)

    TOGGLE["das"].CornerRadius = UDim.new(0.2, 0)
end

-- Update player animations
local Animate = game.Players.LocalPlayer.Character:FindFirstChild("Animate")
if Animate then
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
end

-- Kill all players function
local function kill_all()
    -- Equip the first tool in the player's backpack with "Fire" action
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:FindFirstChild("Fire") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            break
        end
    end

    -- Trigger shoot event for all players
    for _, v in pairs(game.Players:GetPlayers()) do
        task.spawn(function()
            pcall(function()
                local Vec1 = Vector3.new(-186.47, 49.75, math.random(-49.32, 49.49))
                local Vec2 = Vector3.new(-254.48, 68.99, math.random(-49.32, 49.49))
                local Vec3 = v.Character and v.Character:FindFirstChild("LowerTorso")
                local Vec4 = Vector3.new(-222.7, 60.86, math.random(-49.32, 49.49))
                
                if Vec3 then
                    game:GetService("ReplicatedStorage").Remotes.Shoot:FireServer(Vec1, Vec2, Vec3.Position, Vec4)
                end
            end)
        end)
    end
end

-- Other code continues (OrionLib and VapeBypasses loading, Tabs setup, etc.)

-- Handle "Loop Kill All" functionality with a safer toggle
local loopKillEnabled = false
Tab:AddToggle({
    Name = "Loop Kill All [OP]",
    Default = false,
    Callback = function(auto)
        loopKillEnabled = auto
        if loopKillEnabled then
            task.spawn(function()
                while loopKillEnabled do
                    kill_all()
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Anti-AFK implementation
Tab:AddButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end
})
