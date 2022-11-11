autoclicker=false
autoupgrade=false

local upgrade_args = {
    [1] = game:GetService("Players").LocalPlayer.PlayerGui.GameGui.Upgrade
}

local function click()
	if autoclicker then
		game:GetService('ReplicatedStorage').Click:FireServer()
	end
end
local function upgrade()
	if autoupgrade then
		game:GetService("ReplicatedStorage").ClickUpgrade:InvokeServer(unpack(upgrade_args)) -- Click Upgrade
		for i=1,3 do -- Turtles
			game:GetService("ReplicatedStorage").IncomeEvent:FireServer(unpack({[1] = i, [2] = 0}))
		end
	end
end

local m=Instance.new('Hint')
m.Parent=game.Workspace
m.Text='\83\107\97\108\97\32\83\105\109\117\108\97\116\111\114\32\83\99\114\105\112\116\32\98\121\32\76\65\76\79\76\32\124\32\103\105\116\104\117\98\46\99\111\109\47\73\116\115\45\76\65\76\79\76'


local libary=loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/Kavo-UI-Library/main/.lua'))()
local window=libary.CreateLib('\83\107\97\108\97\32\83\105\109\117\108\97\116\111\114\32\83\99\114\105\112\116\32\98\121\32\76\65\76\79\76\32\124\32\103\105\116\104\117\98\46\99\111\109\47\73\116\115\45\76\65\76\79\76', 'Ocean')
local tab=window:NewTab('Thx for using!')
local autofarm=tab:NewSection('AutoFarm')
local others=tab:NewSection('Others')

autofarm:NewToggle('AutoClicker', 'google.com', function(state)
	if state then
		autoclicker=true
	else
		autoclicker=false
	end
end)
autofarm:NewToggle('AutoUpgrader', 'hello!!!', function(state)
	if state then
		autoupgrade=true
	else
		autoupgrade=false
	end
end)
others:NewButton('Free Badge', 'bye111111', function()
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack({[1]='42', [2]='All'}))
end)

while wait(0.1) do
	for i=1,10 do
		click()
		wait(0.1)
	end
	upgrade()
end
