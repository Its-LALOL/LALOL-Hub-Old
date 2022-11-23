genocide=false
silent_aim=false
autocollect=false

local arsenal=window:CreateTab('Arsenal')
arsenal:CreateToggle({
	Name='Genocide 😈',
	CurrentValue=false,
	Flag='arsenal_genocide',
	Callback=function(state)
		genocide=state
		while genocide do
			for i,v in pairs(game.Players:GetPlayers()) do
				if not genocide then return end
				if not player.Team then
					team=1
				else
					team=player.Team
				end
				if v.team~=team and v~=player then
					number=0
					while genocide and wait() do
						if not v.Character:FindFirstChild('LowerTorso') then break end
						player.Character.HumanoidRootPart.CFrame=v.Character.LowerTorso.CFrame*CFrame.new(0,0,1.2)
						camera.CFrame=CFrame.new(camera.CFrame.Position, v.Character.Head.Position)
						number+=1
						VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,1)
						wait(0.1)
						VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,1)
						if number==10 then break end
						wait(0.1)
					end
				end
			end
		end
	end,
})

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
arsenal:CreateToggle({
	Name='AutoCollect',
	CurrentValue=false,
	Flag='arsenal_autocollect',
	Callback=function(state)
		autocollect=state
		while autocollect and wait(0.1) do
			object=game.Workspace.Debris:FindFirstChildOfClass('MeshPart')
			if object then
				object.CFrame=player.Character.HumanoidRootPart.CFrame
			end
		end
	end,
})
