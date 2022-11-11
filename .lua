local a=''
for i,v in {10972284553} do
	if game.PlaceId==v then
		a=game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/'..tostring(game.PlaceId)..'/.lua')
	end
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Universal/.lua')..a)()
