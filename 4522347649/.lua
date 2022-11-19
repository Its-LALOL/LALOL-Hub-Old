local function command(text)
	game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({[1]=text}))
end

fa=window:CreateTab('Free Admin')
fa:CreateButton({
	Name='Explode all',
	Callback=function()
		for i,v in pairs(game.Players:GetPlayers()) do
			command(':explode '..v.name)
		end
	end,
})
fa:CreateButton({
	Name='Spam',
	Callback=function()
		for i,v in pairs(game.Players:GetPlayers()) do
			local num=math.random(1, 3)
			if num==1 then
				emoji='💥'
			elseif num==2 then
				emoji='🎃'
			elseif num==3 then
				emoji='🤡'
			end
			command(':talk '..v.name..' '..emoji..' LALOL Hub '..emoji)
		end
	end,
})
fa:CreateButton({
	Name='Spam 2.0',
	Callback=function()
		for i=1,5 do
			local num=math.random(1, 3)
			if num==1 then
				emoji='💥'
			elseif num==2 then
				emoji='🎃'
			elseif num==3 then
				emoji='🤡'
			end
			command(':sm '..emoji..' LALOL Hub '..emoji)
			wait(3)
		end
	end,
})
fa:CreateButton({
	Name='Jail all',
	Callback=function()
		for i,v in pairs(game.Players:GetPlayers()) do
			command(':jail '..v.name)
		end
	end,
})
fa:CreateButton({
	Name='Crash all',
	Callback=function()
		for i,v in pairs(game.Players:GetPlayers()) do
			command(':control '..v.name)
		end
	end,
})
fa:CreateSection('Music')
fa:CreateButton({
	Name='Scary Sounds',
	Callback=function()
		command(':music 4737106301')
		command(':volume 9999999')
		command(':pitch 0.3')
	end,
})
fa:CreateButton({
	Name='Phonk',
	Callback=function()
		command(':music 6911766512')
		command(':volume 9999999')
	end,
})
