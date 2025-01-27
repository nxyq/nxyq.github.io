local vape = shared.vape

local hc = vape.Categories.Combat:CreateModule({
    Name = '[PK] HealthChecker',
    Function = function(callback)
        if callback then
          	local hum = game.Players.LocalPlayer.Character.Humanoid
			local he = hum.Health
			if he < 50 then
				vape:CreateNotification('HealthChecker', 'Your health is below 50.', 5, 'alert')
			end
    end,
    ExtraText = function() return 'Healthseek' end,
    Tooltip = 'Checks your health if it is nearly 0.'
})
