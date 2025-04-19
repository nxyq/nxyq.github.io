--[[
this is for bedwars
thanks to Storm99999 for original
]]

workspace.CurrentCamera.Viewmodel.ChildAdded:Connect(function(x)
    if x and x:FindFirstChild("Handle") then
        if string.find(x.Name:lower(), 'sword') then
            x.Handle.Material = Enum.Material.ForceField
            x.Handle.MeshId = "rbxassetid://13471207377"

            coroutine.wrap(function()
                local hue = 0
                while x and x.Parent do 
                    hue = (hue + 0.05) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    x.Handle.BrickColor = BrickColor.new(color)
                    wait(0.1)
                end
            end)()
        end
    end
end)
