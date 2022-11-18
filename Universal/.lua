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

mouse=game.Players.LocalPlayer:GetMouse()
UserInputService=game:GetService('UserInputService')
player=game.Players.LocalPlayer

walkspeed_value=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
jumppower_value=game.Players.LocalPlayer.Character.Humanoid.JumpPower
gravity_value=game.Workspace.Gravity
infinite_jump=false
esp=false
autoez=false
loop_teleport=false
ctrl_tp=false

local ESP=Instance.new('Highlight')
ESP.Name='LALOL Hub ESP'
ESP.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
ESP.FillTransparency=999

mouse.KeyDown:connect(function(i)
	key=i:byte()
	for i,v in {119, 97, 115, 100} do --WASD
		if v==key then
			player.Character.Humanoid.WalkSpeed=walkspeed_value
			return
		end
	end
	if key==32 then --Spacebar
		player.Character.Humanoid.JumpPower=jumppower_value
		game.Workspace.Gravity=gravity_value
		if infinite_jump then
			player.Character.Humanoid:ChangeState('Jumping')
			wait(0.1)
			player.Character.Humanoid:ChangeState('Seated')
		end
	end
end)
UserInputService.InputBegan:Connect(function(i, _)
	if i.UserInputType==Enum.UserInputType.MouseButton1 then
		if ctrl_tp and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z))
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
universal:CreateSection('Teleport')
universal:CreateToggle({
	Name='Loop Teleport',
	CurrentValue=false,
	Flag='universal_loop_teleport',
	Callback=function(state)
		loop_teleport=state
	end,
})
universal:CreateInput({
	Name='Teleport to',
	PlaceholderText='Player',
	RemoveTextAfterFocusLost=false,
	Callback=function(i)
		for _,v in pairs(game.Players:GetPlayers()) do
			if v.Name:lower():sub(1, #i)==i:lower() or v.DisplayName:lower():sub(1, #i)==i:lower() then
				while true do
					player.Character.HumanoidRootPart.CFrame=v.Character.HumanoidRootPart.CFrame
					if not loop_teleport then
						break
					end
					wait(0.1)
				end
			end
		end
	end,
})
universal:CreateToggle({
	Name='Сtrl+Click Teleport',
	CurrentValue=false,
	Flag='universal_ctrl_tp',
	Callback=function(state)
		ctrl_tp=state
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
				if not v.Character then
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
				if v.Team then
					ESP_Clone.OutlineColor=v.Team.TeamColor.Color
					print(1)
				end
			end
		end
		for i,v in pairs(game.Players:GetChildren()) do
			if not v.Character then
				continue
			end
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
universal:CreateSection('Others')
universal:CreateToggle({
	Name='AutoEZ',
	CurrentValue=false,
	Flag='universal_autoez',
	Callback=function(state)
		autoez=state
		while autoez and wait(10) do
			local num=math.random(1, 6)
			if num==1 then
				text='ez killed by lalol hub'
			elseif num==2 then
				text='ezzzzzz'
			elseif num==3 then
				text='ezzz lalol hub on top'
			elseif num==4 then
				text='ez noobs'
			elseif num==5 then
				text='ezzed by lаlol hubb'
			elseif num==6 then
				text='ezzzzz win by lalol hub'
			end
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack({[1]=text, [2]='All'}))
		end
	end,
})
universal:CreateButton({
	Name='Sit',
	Callback=function()
		player.Character.Humanoid.Sit=true
	end,
})
