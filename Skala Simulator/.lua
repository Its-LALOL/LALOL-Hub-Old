local upgrade_args = {
    [1] = game:GetService("Players").LocalPlayer.PlayerGui.GameGui.Upgrade
}

local function click()
	game:GetService('ReplicatedStorage').Click:FireServer()
end
local function upgrade()
	game:GetService("ReplicatedStorage").ClickUpgrade:InvokeServer(unpack(upgrade_args)) -- Click Upgrade
	for i=1,3 do -- Turtles
		game:GetService("ReplicatedStorage").IncomeEvent:FireServer(unpack({[1] = i, [2] = 0}))
	end
end
local m=Instance.new('Hint')
m.Parent=game.Workspace
m.Text='\65\117\116\111\70\97\114\109\32\83\99\114\105\112\116\32\98\121\32\76\65\76\79\76\32\124\32\103\105\116\104\117\98\46\99\111\109\47\73\116\115\45\76\65\76\79\76'
while wait(0.1) do
	for i=1,10 do
		click()
		wait(0.1)
	end
	upgrade()
end
