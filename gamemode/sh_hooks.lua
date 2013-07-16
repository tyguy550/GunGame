util.AddNetworkString("sendmessage")
util.AddNetworkString("playsound")

util.AddNetworkString("zedtime_sendeffect")

Round = false
local RoundDownChange = false
local RoundDownSpeed = RoundDownSpeed or 0
local RoundDownTimer = 198

function SendMessage(to, msg)
net.Start("sendmessage")
net.WriteString(msg)
net.Send(to)
end

local function RoundOver(winner)
SendMessage(player.GetAll(), "The round has now ended. "..winner:Nick().." is the winner!")
Round = false
end

local function RoundOn()
SendMessage(player.GetAll(), "The round has started!")
Round = true
RoundDownTimer = 198
RoundDownChange = false

	for k,v in pairs(player.GetAll()) do
	v:SetNWInt("RoundStat", 198)
	v.Died = false
	v.GunWentBack = false
	v.NewBackGunWep = ""
	v:StripWeapons()
	v:Spawn()
	end
end

hook.Add("PlayerShouldTakeDamage", "block_damage", function(ent1, ent2)
	if !Round then
	SendMessage(ent2, "The round is inactive! Wait for it to be active to attack people.")
	return false
	end
end )

hook.Add("ScalePlayerDamage", "sounds", function(ply, hit, dmg)
	if IsValid(ply) and IsValid(dmg:GetAttacker()) then
	local attacker = dmg:GetAttacker()
		if hit == HITGROUP_HEAD and dmg:GetDamage() >= ply:Health() then
		local rand = math.random(1, 6)
			if rand == 1 or rand == 2 or rand == 3 then
			net.Start("playsound")
			net.WriteString("boomheadshot.mp3")
			net.Send(attacker)
			attacker:SetNWInt("ShowText", 1)
			attacker:SetNWInt("TextShow", "BOOM HEADSHOT!")
			attacker.TextShowTime = CurTime() + 3
			end
		end
	end
end )

hook.Add("EntityTakeDamage", "entity_took_damage_setting", function(ply, dmg)
ply.MyWep = ply:GetActiveWeapon():GetClass()
end )

hook.Add("PlayerDeath", "add_upgrade_weapon", function(ply,inflictor,attacker)
ply.Died = true
	if IsValid(ply) and IsValid(attacker) and ply != attacker then
		local attacker_weapon = attacker:GetActiveWeapon():GetClass()
		if attacker_weapon != GunGame.Guns[GunGame.LastGun] then
		local next_wep = table.FindNext(GunGame.Guns, attacker_weapon)
		attacker:StripWeapons()
		attacker:Give(next_wep)
		elseif attacker_weapon == GunGame.Guns[GunGame.LastGun] then
		RoundOver(attacker)
		end
		if GunGame.DeathGunBack then
			if ply.MyWep ~= GunGame.Guns[1] then
			local killed_wepback = table.FindPrev(GunGame.Guns, ply.MyWep)
			ply.GunWentBack = true
			ply.NewBackGunWep = killed_wepback
			end
		end
	end
end )

hook.Add("Think", "gungame_think", function()
	for k,v in pairs(player.GetAll()) do
		if !RoundDownChange then
		RoundDownChange = true
		RoundDownSpeed = CurTime() + 2
		end
		if !Round then
			if CurTime() >= RoundDownSpeed then
			RoundDownSpeed = CurTime() + 2
			RoundDownTimer = RoundDownTimer - GunGame.RoundDownBy
			end
			if RoundDownTimer <= 0 then
			RoundOn()
			end
		v:SetNWInt("RoundStat", RoundDownTimer)
		end
		if Round and v:GetNWInt("RoundStat") ~= 198 then
		v:SetNWInt("RoundStat", 198)
		end
		if v:GetNWInt("ShowText") == 1 and v.TextShowTime ~= 0 then
			if CurTime() >= v.TextShowTime then
			v.TextShowTime = 0
			v:SetNWInt("ShowText", 0)
			end
		end
	end 
end )

hook.Add("ShowHelp", "f1_menuopen", function(ply)
ply:ConCommand("gungame_help")
end )

timer.Create("zedtime", 100, 0, function()
	if Round and GunGame.ZedTimeEnabled then
	game.SetTimeScale(GunGame.ZedTimeSpeed)
	net.Start("zedtime_sendeffect")
	net.Send(player.GetAll())
		timer.Simple(0.8, function()
		game.SetTimeScale(1)
		end )
	end
end )
