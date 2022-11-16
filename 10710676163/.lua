level=1
fist_strength=false
body_tougness=false
movement_speed=false
jump_force=false
psychic_power=false

local function remote(what)
	local levell=level
	if what=='Add_FS_Request' then
		local levell=1
	end
	args={
	    [1] = {
	        [1] = what,
	        [2] = levell
	    }
	}
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end
local spts=window:CreateTab('SPTS')
spts:CreateSection('AutoFarm')
spts:CreateSlider({
	Name='Level (BETA)',
	Range={1, 5},
	Increment=1,
	Suffix='',
	CurrentValue=1,
	Flag='spts_level',
	Callback=function(i)
		level=i
	end,
})
spts:CreateToggle({
	Name='Fist Strength',
	CurrentValue=false,
	Flag='spts_fist_Strength',
	Callback=function(state)
		fist_strength=state
	end,
})
spts:CreateToggle({
	Name='Body Tougness',
	CurrentValue=false,
	Flag='spts_body_tougness',
	Callback=function(state)
		body_tougness=state
	end,
})
spts:CreateToggle({
	Name='Movement Speed',
	CurrentValue=false,
	Flag='spts_movement_speed',
	Callback=function(state)
		movement_speed=state
	end,
})
spts:CreateToggle({
	Name='Jump Force',
	CurrentValue=false,
	Flag='spts_jump_force',
	Callback=function(state)
		jump_force=state
	end
})
spts:CreateToggle({
	Name='Psychic Power',
	CurrentValue=false,
	Flag='spts_psychic_power',
	Callback=function(state)
		psychic_power=state
	end,
})
spts:CreateSection('Others')
spts:CreateButton({
	Name='Safe Zone++',
	Callback=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-3949.56323, 99999999999999999, -3439.6062, -0.98901552, 0.00691204006, -0.147650108, 9.99347094e-09, 0.998906016, 0.0467623696, 0.1478118, 0.0462487079, -0.987933576)
	end,
})

while wait(0.1) do
	if fist_strength then
		remote('Add_FS_Request')
	end
	if body_tougness then
		remote('+BT1')
	end
	if movement_speed then
		remote('Add_MS_Request')
	end
	if jump_force then
		remote('Add_JF_Request')
	end
	if psychic_power then
		remote('+PP1')
	end
end
