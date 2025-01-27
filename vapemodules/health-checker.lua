local vape = shared.vape

local hc = vape.Categories.Combat:CreateModule({
    Name = '[PK] HealthChecker',
    Function = function(callback)
        if callback then
          	local hum = game.Players.LocalPlayer.Character.Humanoid
			local he = hum.Health
			if he < 50 then
				createwarning("HealthChecker", "Your health has been detected as lower than 50!")
			end
    end,
    Tooltip = 'Checks your health if it is nearly 0.'
})
