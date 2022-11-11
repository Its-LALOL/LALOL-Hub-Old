_G.walkspeed_value=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
_G.jumppower_value=game.Players.LocalPlayer.Character.Humanoid.JumpPower

local function walkspeed()
	while wait(0.1) do
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=_G.walkspeed_value
	end
end
local function jumppower()
	while wait(0.1) do
		game.Players.LocalPlayer.Character.Humanoid.JumpPower=_G.jumppower_value
	end
end
spawn(walkspeed)
spawn(jumppower)

local libary=loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/Kavo-UI-Library/main/.lua'))()
local _G.window=libary.CreateLib('\76\65\76\79\76\32\72\117\98\32\124\32\103\105\116\104\117\98\46\99\111\109\47\73\116\115\45\76\65\76\79\76', 'Ocean')
local universal=window:NewTab('Universal')

local player=universal:NewSection('Player')
player:NewSlider('Walk Speed', '', 100, 16, function(i)
	_G.walkspeed_value=i
end)
player:NewSlider('Jump Power', '', 300, 50, function(i)
	_G.jumppower_value=i
end)
--player:NewButton('God', '', function()
--local humanoid=game.Players.LocalPlayer.Character.Humanoid
--humanoid.MaxHealth=6666666
--humanoid.Health=6666666
--end)
