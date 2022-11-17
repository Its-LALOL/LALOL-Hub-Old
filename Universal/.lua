local Rayfield=loadstring(game:HttpGet(('https://raw.githubusercontent.com/Its-LALOL/Rayfield/main/.lua')))()
local window=Rayfield:CreateWindow({
	Name='LALOL Hub',
	LoadingTitle='LALOL Hub',
	LoadingSubtitle='Thanks for using!',
	ConfigurationSaving={
		Enabled=true,
		FolderName='LALOL Hub',
		FileName='cfg'
	},
        Discord={
        	Enabled=true,
        	Invite='XXqzxT7E5z',
        	RememberJoins=true
        },
	KeySystem=true,
	KeySettings={
		Title='LALOL Hub',
		Subtitle='Key System',
		Note='discord.gg/XXqzxT7E5z',
		FileName='LALOL Hub Key',
		SaveKey=true,
		GrabKeyFromSite=false,
		Key='\53\53\50'
	}
})

walkspeed_value=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
jumppower_value=game.Players.LocalPlayer.Character.Humanoid.JumpPower
gravity_value=game.Workspace.Gravity
infinite_jump=false
esp=false

local ESP=Instance.new('Highlight')
ESP.Name='LALOL Hub ESP'
ESP.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
ESP.FillTransparency=999

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(i)
	key=i:byte()
	for i,v in {119, 97, 115, 100} do --WASD
		if v==key then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=walkspeed_value
			return
		end
	end
	if key==32 then --Spacebar
		game.Players.LocalPlayer.Character.Humanoid.JumpPower=jumppower_value
		game.Workspace.Gravity=gravity_value
		if infinite_jump then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState('Jumping')
			wait(0.1)
			game.Players.LocalPlayer.Character.Humanoid:ChangeState('Seated')
		end
	end
end)

local universal=window:CreateTab('Universal')
universal:CreateSection('Player')
universal:CreateSlider({
	Name='Walk Speed',
	Range={0, 100},
	Increment=1,
	Suffix='Speed',
	CurrentValue=16,
	Flag='universal_walk_speed',
	Callback=function(i)
		walkspeed_value=i
	end,
})
universal:CreateSlider({
	Name='Jump Power',
	Range={0, 300},
	Increment=1,
	Suffix='Power',
	CurrentValue=50,
	Flag='universal_jump_power',
	Callback=function(i)
		jumppower_value=i
	end,
})
universal:CreateSlider({
	Name='Gravity',
	Range={0, 300},
	Increment=1,
	Suffix='',
	CurrentValue=196,
	Flag='universal_gravity',
	Callback=function(i)
		gravity_value=i
	end,
})
universal:CreateToggle({
	Name='Infinite Jump',
	CurrentValue=false,
	Flag='universal_infinite_jump',
	Callback=function(state)
		infinite_jump=state
	end,
})
universal:CreateInput({
	Name='Teleport',
	PlaceholderText='Player',
	RemoveTextAfterFocusLost=false,
	Callback=function(i)
		for _,v in pairs(game.Players:GetPlayers()) do
			if v.Name:lower():sub(1, #i)==i:lower() or v.DisplayName:lower():sub(1, #i)==i:lower() then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v.Character.HumanoidRootPart.CFrame
				break
			end
		end
	end,
})
universal:CreateButton({
	Name='Sit',
	Callback=function()
		game.Players.LocalPlayer.Character.Humanoid.Sit=true
	end,
})
universal:CreateSection('Visual')
universal:CreateToggle({
	Name='ESP',
	CurrentValue=false,
	Flag='universal_esp',
	Callback=function(state)
		esp=state
		while esp and wait(1) do
			for i,v in pairs(game.Players:GetPlayers()) do
				if not v.Character:FindFirstChild('Head') then
					continue
				end
				if not v.Character:FindFirstChild('HumanoidRootPart') then
					continue
				end
				if v.Character.HumanoidRootPart:FindFirstChild('LALOL Hub ESP') then
					continue
				end
				local ESP_Clone=ESP:Clone()
				ESP_Clone.Adornee=v.Character
				ESP_Clone.Parent=v.Character.HumanoidRootPart
				ESP_Clone.OutlineColor=Color3.new(255, 255, 255)
				if v:FindFirstChild('Team') then
					ESP_Clone.OutlineColor=v.Team.TeamColor.Color
				end
			end
		end
		for i,v in pairs(game.Players:GetChildren()) do
			if not v.Character:FindFirstChild('HumanoidRootPart') then
				continue
			end
			if v.Character.HumanoidRootPart:FindFirstChild('LALOL Hub ESP') then
				v.Character.HumanoidRootPart:FindFirstChild('LALOL Hub ESP'):remove()
			end
		end
	end,
})
universal:CreateSection('Server')
universal:CreateButton({
	Name='Rejoin',
	Callback=function()
		game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
	end,
})
