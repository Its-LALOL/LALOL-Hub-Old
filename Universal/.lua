local Rayfield=loadstring(game:HttpGet(('https://raw.githubusercontent.com/Its-LALOL/Rayfield/main/.lua')))()
local window=Rayfield:CreateWindow({
	Name='LALOL Hub',
	LoadingTitle='LALOL Hub',
	LoadingSubtitle='Thanks for using!',
	ConfigurationSaving={
		Enabled=false,
		FolderName=nil,
		FileName='LALOL Hub'
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

_G.walkspeed_value=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
_G.jumppower_value=game.Players.LocalPlayer.Character.Humanoid.JumpPower
_G.gravity_value=game.Workspace.Gravity

local function walkspeed()
	while wait(1) do
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=_G.walkspeed_value
	end
end
local function jumppower()
	while wait(1) do
		game.Players.LocalPlayer.Character.Humanoid.JumpPower=_G.jumppower_value
	end
end
local function gravity()
	while wait(1) do
		game.Workspace.Gravity=_G.gravity_value
	end
end
spawn(walkspeed)
spawn(jumppower)
spawn(gravity)

local universal=window:CreateTab('Universal')
local player=universal:CreateSection('Player')
universal:CreateSlider({
	Name='Walk Speed',
	Range={0, 100},
	Increment=1,
	Suffix='Speed',
	CurrentValue=16,
	Flag='WalkSpeed',
	Callback=function(i)
		_G.walkspeed_value=i
	end,
})
universal:CreateSlider({
	Name='Jump power',
	Range={0, 300},
	Increment=1,
	Suffix='Power',
	CurrentValue=50,
	Flag='JumpPower',
	Callback=function(i)
		_G.jumppower_value=i
	end,
})
universal:CreateSlider({
	Name='Gravity',
	Range={0, 300},
	Increment=1,
	Suffix='',
	CurrentValue=196,
	Flag='Gravity',
	Callback=function(i)
		_G.gravity_value=i
	end,
})
universal:CreateButton({
	Name='Sit',
	Callback=function()
		game.Players.LocalPlayer.Character.Humanoid.Sit=true
	end,
})
