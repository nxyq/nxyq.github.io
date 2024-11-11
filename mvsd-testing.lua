-- Load Orion Library and set up window
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = [[<font color="rgb(17, 35, 171)">Moon Client | MVSD</font>]],
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

-- Information Tab
local InfoTab = Window:MakeTab({
    Name = "Information",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
InfoTab:AddParagraph("Credits", "Script by pkplaysrblx with contributions by externalbypassed, wyvernify, and Simple Spy.")
InfoTab:AddParagraph("Bypasses", "Using Vape Bypasses. Use at your own risk as bans may still occur.")

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Anti AFK Button
MainTab:AddButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end
})

-- Infinite Jump Toggle
MainTab:AddToggle({
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

-- Hitbox Textbox
MainTab:AddTextbox({
    Name = "Hitbox",
    Default = "5",
    TextDisappear = true,
    Callback = function(size)
        _G.HeadSize = tonumber(size) or 5
        _G.Disabled = true

        game:GetService("RunService").RenderStepped:connect(function()
            if _G.Disabled then
                for _, v in pairs(game:GetService("Players"):GetPlayers()) do
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
local RageTab = Window:MakeTab({
    Name = "Rage Mode",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Kill All Function
local function kill_all()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:FindFirstChild("Fire") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            break
        end
    end

    for _, player in pairs(game.Players:GetPlayers()) do
        task.spawn(function()
            pcall(function()
                local Vec1 = Vector3.new(-186.466, 49.749, math.random(-49.323, 49.488))
                local Vec2 = Vector3.new(-254.478, 68.998, math.random(-49.323, 49.488))
                local Vec3 = player.Character.LowerTorso
                local Vec4 = Vector3.new(-222.701, 60.864, math.random(-49.323, 49.488))

                game:GetService("ReplicatedStorage").Remotes.Shoot:FireServer(Vec1, Vec2, Vec3, Vec4)
            end)
        end)
    end
end

-- Kill All Button
RageTab:AddButton({
    Name = "Kill All [OP]",
    Callback = kill_all
})

-- Loop Kill All Toggle
RageTab:AddToggle({
    Name = "Loop Kill All [OP]",
    Default = false,
    Callback = function(loop)
        while loop do
            kill_all()
            wait(0.01) -- Adjust delay as needed
        end
    end
})

-- ESP Tab
local ESPTab = Window:MakeTab({
    Name = "ESP",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Load ESP Scripts
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

for name, url in pairs(ESP_URLs) do
    ESPTab:AddButton({
        Name = name,
        Callback = function()
            loadstring(game:HttpGet(url))()
        end
    })
end

OrionLib:Init()
