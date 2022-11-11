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

local skala=window:NewTab('Skala Simulator')
local autofarm=tab:NewSection('AutoFarm')
local others=tab:NewSection('Others')

skala:NewToggle('AutoClicker', 'google.com', function(state)
	if state then
		autoclicker=true
	else
		autoclicker=false
	end
end)
skala:NewToggle('AutoUpgrader', 'hello!!!', function(state)
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
