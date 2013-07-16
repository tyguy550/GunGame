--Made, developed and scripted by Tyguy http://steamcommunity.com/profiles/76561198020390211/

include('shared.lua')
include('sh_guns.lua')
include("sh_hooks.lua")
include('settings.lua')

AddCSLuaFile('shared.lua')
AddCSLuaFile('cl_init.lua')
AddCSLuaFile("cl_derma.lua")

function GM:PlayerInitialSpawn(ply)
ply:SetTeam(1)
ply:SetNWInt("RoundStat", RoundDownTimer)
ply.GunWentBack = false
ply.NewBackGunWep = ""
ply.Died = false
ply.TextShowTime = 0

	if Round then
	ply:SetNWInt("RoundStat", 0)
	else
	ply:SetNWInt("RoundStat", RoundDownTimer)
	end
	if GunGame.OpenMenuOnSpawn then
	ply:ConCommand("gungame_help")
	end
end

function GM:PlayerLoadout(ply)
ply:SetWalkSpeed(300)
ply:SetRunSpeed(300)
	if !ply.GunWentBack then
	ply:Give(GunGame.StarterWep)
	end
	if ply.GunWentBack and ply.Died then
	ply:StripWeapons()
	ply:Give(ply.NewBackGunWep)
	ply.GunWentBack = false
	ply.NewBackGunWep = ""
	ply.Died = false
	end
ply:GiveAmmo(10000000, "smg1")
ply:GiveAmmo(10000000, "pistol")
ply:GiveAmmo(10000000, "crossbow")
ply:GiveAmmo(10000000, "357")
end