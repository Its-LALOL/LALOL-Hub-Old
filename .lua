game.StarterGui:SetCore('SendNotification', {Title='LALOL Hub', Text='Thx for using!', Icon='http://www.roblox.com/asset/?id=8941506186', Duration=5})
local a=''
for i,v in {10972284553, 10710676163, 4522347649} do
	if game.PlaceId==v then
		a=game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/'..tostring(game.PlaceId)..'/.lua')
	end
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Universal/.lua')..a)()
