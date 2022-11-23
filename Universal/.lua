local Rayfield=loadstring(game:HttpGet(('https://raw.githubusercontent.com/Its-LALOL/Rayfield/main/.lua')))()
local window=Rayfield:CreateWindow({
	Name='LALOL Hub',
	LoadingTitle='LALOL Hub',
	LoadingSubtitle='Thanks for using!',
	ConfigurationSaving={
		Enabled=false,
		FolderName='LALOL Hub',
		FileName='cfg'
	},
        Discord={
        	Enabled=true,
        	Invite='XXqzxT7E5z',
        	RememberJoins=true
        },
	KeySystem=true, -- dont change or ur pc will explode
	KeySettings={
		Title='LALOL Hub',
		Subtitle='Key System',
		Note='discord.gg/XXqzxT7E5z',
		FileName='LALOL Hub Key',
		SaveKey=true,
		GrabKeyFromSite=false,
		Key='\51\56\49' -- dont change or ur pc will explode
	}
})

mouse=game.Players.LocalPlayer:GetMouse()
camera=game.Workspace.CurrentCamera
UserInputService=game:GetService('UserInputService')
VirtualInputManager=game:GetService('VirtualInputManager')
player=game.Players.LocalPlayer

walkspeed_value=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
jumppower_value=game.Players.LocalPlayer.Character.Humanoid.JumpPower
gravity_value=game.Workspace.Gravity
infinite_jump=false
esp=false
autoez=false
loop_teleport=false
ctrl_tp=false
aimbot=false
aim=false
ambient=game.Lighting.Ambient
outdoor_ambient=game.Lighting.OutdoorAmbient
fogstart=game.Lighting.FogStart
brightness=game.Lighting.Brightness
clocktime=game.Lighting.ClockTime
shadows=game.Lighting.GlobalShadows

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
-- AIMBOT
local function getClosest()
	local closestPlayer=nil
	local closesDist=math.huge
	if not player.Team then
		team=1
	else
		team=player.Team
	end
	for i,v in pairs(game.Players:GetChildren()) do
		if v.team~=team and v~=player then
			local Dist=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Character.HumanoidRootPart.Position).magnitude
			if Dist<closesDist then
				closesDist=Dist
				closestPlayer=v
			end
		end
	end
	return closestPlayer
end
UserInputService.InputBegan:Connect(function(inp)
    if aimbot and inp.UserInputType==Enum.UserInputType.MouseButton2 then
    	aim=true
  	 	while aim and wait() do
  			camera.CFrame=CFrame.new(camera.CFrame.Position, getClosest().Character.Head.Position)
  	  	end
	end
end)
UserInputService.InputEnded:Connect(function(inp)
    if inp.UserInputType==Enum.UserInputType.MouseButton2 then
	    aim=false
    end
end)

local universal=window:CreateTab('Universal')
universal:CreateToggle({
	Name='Aimbot',
	CurrentValue=false,
	Flag='universal_aimbot',
	Callback=function(state)
		aimbot=state
	end,
})
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
					wait()
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
			for i,v in pairs(game.Players:GetChildren()) do
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
universal:CreateToggle({
	Name='Pink Glasses',
	CurrentValue=false,
	Flag='universal_pink_glasses',
	Callback=function(state)
		if state then
			game.Lighting.Ambient=Color3.fromRGB(225, 20, 147)
			game.Lighting.OutdoorAmbient=Color3.fromRGB(225, 20, 147)
		else
			game.Lighting.Ambient=ambient
			game.Lighting.OutdoorAmbient=outdoor_ambient
		end
	end,
})
universal:CreateToggle({
	Name='Remove Fog',
	CurrentValue=false,
	Flag='universal_remove_fog',
	Callback=function(state)
		if state then
			game.Lighting.FogStart=9999999
		else
			game.Lighting.FogStart=fogstart
		end
	end,
})
universal:CreateToggle({
	Name='Full Brightness',
	CurrentValue=false,
	Flag='universal_full_brightness',
	Callback=function(state)
		if state then
			game.Lighting.Brightness=2
			game.Lighting.ClockTime=14
			game.Lighting.GlobalShadows=false
			game.Lighting.OutdoorAmbient=Color3.fromRGB(128, 128, 128)
		else
			game.Lighting.Brightness=brightness
			game.Lighting.ClockTime=clocktime
			game.Lighting.GlobalShadows=shadows
			game.Lighting.OutdoorAmbient=outdoor_ambient
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
			if game.PlaceId==286090429 then -- If arsenal
				local args = {
				    [1] = "Hah!",
				    [2] = text,
				    [3] = false,
				    [5] = false,
				    [6] = true
				}
				game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(unpack(args))
				continue
			end
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack({[1]=text, [2]='All'}))
		end
	end,
})
universal:CreateInput({
	Name='FPS',
	PlaceholderText='60',
	RemoveTextAfterFocusLost=false,
	Callback=function(i)
		setfpscap(i+0)
	end,
})
universal:CreateToggle({
	Name='Rendering',
	CurrentValue=true,
	Flag='universal_rendering',
	Callback=function(state)
		game:GetService('RunService'):Set3dRenderingEnabled(state)
	end,
})
universal:CreateToggle({
	Name='Anti-AFK Bypass',
	CurrentValue=true,
	Flag='universal_antiafk',
	Callback=function(state)
		for i,v in pairs(getconnections(player.Idled)) do
			if state then v:Disable() end
			if not state then v:Enable() end
		end
	end,
})
universal:CreateButton({
	Name='Sit',
	Callback=function()
		player.Character.Humanoid.Sit=true
	end,
})
