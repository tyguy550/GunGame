GunGame.RoundDownBy = 30 --How much the round wait should go down by every two seconds.
GunGame.DeathGunBack = true --Enable/disable this so if a player dies they go back by one 
GunGame.ZedTimeEnabled = true --Enable/disable ZedTime with this variable
GunGame.ZedTimeSpeed = 0.1 --This is the speed that you change to when zedtime is active, change this variable to modify the speed (normal speed being 1)
GunGame.OpenMenuOnSpawn = true --Enable/disable this to change whether the F1 menu opens on first spawn
GunGame.StopSuiciding = true --Enable/disable this to change whether or not players can suicide. It is recommended to keep it enabled for obvious reasons.


resource.AddFile("sound/boomheadshot.wav")
resource.AddFile("sound/zt_enter.wav")
resource.AddFile("sound/zt_exit.wav")