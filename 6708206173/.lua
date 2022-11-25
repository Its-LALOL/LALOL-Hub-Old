local rma=window:CreateTab('Rate My Avatar', tab_image)
rma:CreateButton({
	Name='Snipe booth',
	Callback=function()
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.name=='Booth' then
				if v.Banner.SurfaceGui.Frame.Description.ContentText=='Click here to rent this booth' then
					player.Character.HumanoidRootPart.CFrame=v.Carpet.CFrame
					wait(0.5)
					fireclickdetector(v.Banner.ClickDetector)
					break
				end
			end
		end
	end,
})
rma:CreateInput({
	Name='Rate all',
	PlaceholderText='5',
	RemoveTextAfterFocusLost=false,
	Callback=function(i)
		for _,v in pairs(game.Players:GetPlayers()) do
			game:GetService("ReplicatedStorage").PostRating:FireServer(unpack({[1]=v, [2]=i}))
		end
		checkmark('Successfully rated all!')
	end,
})
rma:CreateButton({
	Name='Blacklist all',
	Callback=function()
		for _,v in pairs(game.Players:GetPlayers()) do
			if not v.Name==player.name then game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack({[1]='AddBlacklist', [2]=v.Name})) end
		end
		checkmark('Successfully blacklisted all!')
	end,
})
rma:CreateButton({
	Name='Unblacklist all',
	Callback=function()
		for _,v in pairs(game.Players:GetPlayers()) do
			if not v.Name==player.name then game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack({[1]='RemoveBlacklist', [2]=v.Name})) end
		end
		checkmark('Successfully unblacklisted all!')
	end,
})
