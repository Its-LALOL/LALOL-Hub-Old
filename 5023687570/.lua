local function command(text)
	game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({[1]=text}))
end

fa=window:CreateTab('Free Owner Admin [Abuse]', tab_image)
fa:CreateButton({
	Name='Explode all',
	Callback=function()
		command(';explode all')
		checkmark('Successfully exploded all!')
	end,
})
fa:CreateButton({
	Name='Crash all',
	Callback=function()
		old=player.Character.HumanoidRootPart.CFrame
		player.Character.HumanoidRootPart.Position=Vector3.new(0,9e9,0)
		command(';bring all')
		wait(0.5)
		command(';re')
		player.Character.HumanoidRootPart.CFrame=old
		checkmark('Successfully crashed all!')
	end,
})
fa:CreateButton({
	Name='Spam',
	Callback=function()
		for i=1,3 do
			local num=math.random(1, 3)
			if num==1 then
				emoji='⚡'
			elseif num==2 then
				emoji='⭐'
			elseif num==3 then
				emoji='✨'
			end
			command(';talk all '..emoji..' type "LALOL Hub on top" to get free rubax! '..emoji)
		end
	end,
})
fa:CreateButton({
	Name='Spam 2.0',
	Callback=function()
		for i=1,5 do
			local num=math.random(1, 3)
			if num==1 then
				emoji='⚡'
			elseif num==2 then
				emoji='⭐'
			elseif num==3 then
				emoji='✨'
			end
			command(';sm '..emoji..' type "LALOL Hub on top" to get free rubax! '..emoji)
			wait(3)
		end
	end,
})
fa:CreateButton({
	Name='Jail all',
	Callback=function()
		command(';jail all')
		checkmark('Successfully jailed all!')
	end,
})
fa:CreateButton({
	Name='Control all',
	Callback=function()
		command(';control all')
		checkmark('Successfully controled all!')
	end,
})
fa:CreateButton({
	Name='Unloopkill all',
	Callback=function()
		command(';re all')
	end,
})
fa:CreateSection('Music')
fa:CreateButton({
	Name='Scary Sounds',
	Callback=function()
		command(';music 4737106301')
		command(';volume 9999999')
		command(';pitch 0.3')
	end,
})
fa:CreateButton({
	Name='Phonk',
	Callback=function()
		command(';music 6911766512')
		command(';volume 9999999')
	end,
})
fa:CreateButton({
	Name='Scream',
	Callback=function()
		command(';music 8819324666')
		command(';volume 9999999')
		command(';pitch 2')
	end,
})
