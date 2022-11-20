local e=Instance.new('BindableFunction')
e.OnInvoke=function() setclipboard('https://discord.gg/XXqzxT7E5z') end
game.StarterGui:SetCore('SendNotification',{Title='LALOL Hub',Text='Thanks for using!',Icon='http://www.roblox.com/asset/?id=8941506186',Duration=5,Button1='discord.gg/XXqzxT7E5z',Callback=e})
local a=''
for i,v in ipairs({10972284553,10710676163,4522347649,5023687570}) do if game.PlaceId==v then a=game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/'..tostring(game.PlaceId)..'/.lua') end end
loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Universal/.lua')..a)()
