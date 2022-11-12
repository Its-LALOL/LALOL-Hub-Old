fist_strength=false
body_tougness=false
movement_speed=false
jump_force=false
psychic_power=false

local function remote(what)
	args={
	    [1] = {
	        [1] = what,
	        [2] = 1
	    }
	}
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end
local spts=window:NewTab('SPTS')
local autofarm=spts:NewSection('AutoFarm')
autofarm:NewToggle('Fist Strength', '', function(state)
	if state then
		fist_strength=true
	else
		fist_strength=false
	end
end)
autofarm:NewToggle('Body Tougness', '', function(state)
	if state then
		body_tougness=true
	else
		body_tougness=false
	end
end)
autofarm:NewToggle('Movement Speed', '', function(state)
	if state then
		movement_speed=true
	else
		movement_speed=false
	end
end)
autofarm:NewToggle('Jump Force', '', function(state)
	if state then
		jump_force=true
	else
		jump_force=false
	end
end)
autofarm:NewToggle('Psychic Power', '', function(state)
	if state then
		psychic_power=true
	else
		psychic_power=false
	end
end)

local others=spts:NewSection('Others')
others:NewButton('Safe Zone++', '', function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-3949.56323, 99999999999999999, -3439.6062, -0.98901552, 0.00691204006, -0.147650108, 9.99347094e-09, 0.998906016, 0.0467623696, 0.1478118, 0.0462487079, -0.987933576)
end)

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
