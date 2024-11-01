--[[
this is for bedwars
thanks to Storm99999 for original
]]

workspace.CurrentCamera.Viewmodel.ChildAdded:Connect(function(x)
    if x and x:FindFirstChild("Handle") then
        if string.find(x.Name:lower(), 'sword') then
            x.Handle.Material = Enum.Material.ForceField
            x.Handle.MeshId = "rbxassetid://13471207377"

            -- Start a coroutine to cycle through rainbow colors
            coroutine.wrap(function()
                local hue = 0
                while x and x.Parent do  -- Ensures the loop runs while the object is still in the game
                    hue = (hue + 0.05) % 1  -- Increment hue, reset to 0 after reaching 1
                    local color = Color3.fromHSV(hue, 1, 1)  -- Full saturation and brightness
                    x.Handle.BrickColor = BrickColor.new(color)
                    wait(0.1)  -- Adjust timing for a smooth transition
                end
            end)()
        end
    end
end)
