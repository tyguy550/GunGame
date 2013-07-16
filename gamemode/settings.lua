GunGame.RoundDownBy = 30 --How much the round wait should go down by every two seconds.
GunGame.DeathGunBack = true --Enable/disable this so if a player dies they go back by one 
GunGame.ZedTimeEnabled = true --Enable/disable ZedTime with this variable
GunGame.ZedTimeSpeed = 0.1 --This is the speed that you change to when zedtime is active, change this variable to modify the speed (normal speed being 1)
<<<<<<< HEAD
GunGame.StopSuiciding = true --Enable/disable this to stop/allow players to suicide (people can suicide and the attacker won't proceed to the next weapon)
GunGame.FirstSpawnF1Menu = true --Enable/disable this to make/unmake the F1 Menu open on first spawn (when a player joins)
=======
GunGame.OpenMenuOnSpawn = true --Enable/disable this to change whether the F1 menu opens on first spawn
GunGame.StopSuiciding = true --Enable/disable this to change whether or not players can suicide. It is recommended to keep it enabled for obvious reasons.

>>>>>>> a2766b8dfeed5624c55dd8dc2b403d86fb06f70a

resource.AddFile("sound/boomheadshot.wav")
resource.AddFile("sound/zt_enter.wav")
resource.AddFile("sound/zt_exit.wav")