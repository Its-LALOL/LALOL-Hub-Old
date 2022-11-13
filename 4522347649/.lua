local function command(text)
	game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({[1]=text}))
end

fa1=window:NewTab('Free Admin')
fa=fa1:NewSection('Free Admin')
fa:NewButton('Explode all', '', function()
	for i,v in pairs(game:FindService("Players"):GetPlayers()) do
		command(':explode '..v.name)
	end
end)
fa:NewButton('Spam', '', function()
	for i,v in pairs(game:FindService("Players"):GetPlayers()) do
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
end)
fa:NewButton('Spam 2.0', '', function()
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
end)
fa:NewButton('Jail all', '', function()
	for i,v in pairs(game:FindService("Players"):GetPlayers()) do
		command(':jail '..v.name)
	end
end)
fa:NewButton('Scary Sounds', '', function()
	command(':music 4737106301')
	command(':volume 9999999')
	command(':pitch 0.3')
end)
