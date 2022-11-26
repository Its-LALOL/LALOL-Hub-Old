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
	Name='Get Knight',
	Callback=function()
		old=player.Character.HumanoidRootPart.CFrame
		player.Character.HumanoidRootPart.CFrame=game.Workspace.JewelleryStand.CFrame
		for i=1,10 do
			fireproximityprompt(game.Workspace.JewelleryStand.ProximityPrompt)
			wait(0.1)
		end
		player.Character.HumanoidRootPart.CFrame=old
	end,
})
rma:CreateButton({
	Name='Get sword',
	Callback=function()
		game:GetService("ReplicatedStorage").RequestTool:FireServer(unpack({[1]='ClassicSword'}))
	end,
})
rma:CreateToggle({
	Name='Chat',
	CurrentValue=false,
	Flag='rma_chat',
	Callback=function(state)
		player.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible=state --dont skid this
	end,
})
