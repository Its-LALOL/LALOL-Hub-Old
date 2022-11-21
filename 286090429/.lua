silent_aim=false

local arsenal=window:CreateTab('Arsenal')
toggle=arsenal:CreateToggle({
	Name='Silent aim',
	CurrentValue=false,
	Flag='arsenal_silent_aim',
	Callback=function(state)
		silent_aim=state
		size=Vector3.new(30, 30, 30)
		while silent_aim and wait(1) do
			for i,v in pairs(game.Players:GetPlayers()) do
				if v~=player then
					v.Character.LowerTorso.Transparency=1
					v.Character.LowerTorso.CanCollide=false
					v.Character.LowerTorso.Size=size
					v.Character.HumanoidRootPart.Size=size
				end
			end
		end
		wait(0.5)
		toggle:Set(true)
	end,
})
