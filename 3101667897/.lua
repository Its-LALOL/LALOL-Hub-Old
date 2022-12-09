autohoop=false
autoorb=false
autorebith=false

local lof=window:CreateTab('Legends Of Speed', tab_image)
lof:CreateSection('AutoFarm')

lof:CreateToggle({
	Name='AutoHoop',
	CurrentValue=false,
	Flag='lof_autohoop',
	Callback=function(state)
		autohoop=state
		while autohoop and wait(0.5) do
			for i,v in workspace.Hoops:GetChildren() do
				firetouchinterest(player.Character.HumanoidRootPart, v, 0)
				firetouchinterest(player.Character.HumanoidRootPart, v, 1)
			end
		end
	end,
})
lof:CreateToggle({
	Name='AutoOrb',
	CurrentValue=false,
	Flag='lof_autoorb',
	Callback=function(state)
		autoorb=state
		while autoorb and wait() do
			local args = {
				[1] = "collectOrb",
				[2] = "Red Orb",
				[3] = "City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
			local args = {
				[1] = "collectOrb",
				[2] = "Gem",
				[3] = "City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end,
})
lof:CreateToggle({
	Name='AutoRebith',
	CurrentValue=false,
	Flag='lof_autorebith',
	Callback=function(state)
		autorebith=state
		while autorebith and wait(2) do
			local args = {
				[1] = "rebirthRequest"
			}
			game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
		end
	end,
})
