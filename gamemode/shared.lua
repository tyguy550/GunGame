GM.Name = "GunGame"
GM.Author = "Tyguy"
DeriveGamemode("base")

GunGame = {}

function GunGame.AddTeam(n, str, col1, col2, col3)
team.SetUp(n, str, Color(col1, col2, col3))
end

GunGame.AddTeam(1, "Players", 100, 100, 100)

--Change this to modify the F1 menu text. Please keep my name there as it rightfully suggests the developer & owner of this gamemode.
GunGame.HelpText = [[Welcome. 
The objective of this gamemode is to kill other players. 
If the round is not active then you must wait a few seconds.
Once you kill a player, you will get an upgrade to the next weapon. 
If you die, however, you will lose a weapon (assuming that you don't have the starter weapon)
Once you kill enough, you will obtain the last weapon. Once you have that weapon and you make a kill - you win the round.
The round is then off and you must wait a few seconds for the round to start again.

Thanks for playing my gamemode, and I hope you have fun.
Tyguy
]]
