local function command(text)
	game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({[1]=text}))
end

fa=window:CreateTab('Free Admin')
fa:CreateButton({
	Name='Explode all',
	Callback=function()
		command(';explode all')
	end,
})
fa:CreateButton({
	Name='Crash all',
	Callback=function()
		old=player.Character.HumanoidRootPart.CFrame
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-3949.56323, 99999999999999999, -3439.6062, -0.98901552, 0.00691204006, -0.147650108, 9.99347094e-09, 0.998906016, 0.0467623696, 0.1478118, 0.0462487079, -0.987933576)
		command(';bring all')
		wait(0.5)
		player.Character.HumanoidRootPart.CFrame=old
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
	end,
})
fa:CreateButton({
	Name='Control all',
	Callback=function()
		command(';control all')
	end,
})
fa:CreateButton({
	Name='Crash all',
	Callback=function()
		old=player.Character.HumanoidRootPart.CFrame
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-3949.56323, 99999999999999999, -3439.6062, -0.98901552, 0.00691204006, -0.147650108, 9.99347094e-09, 0.998906016, 0.0467623696, 0.1478118, 0.0462487079, -0.987933576)
		command(';bring all')
		wait(3)
		player.Character.HumanoidRootPart.CFrame=old
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
