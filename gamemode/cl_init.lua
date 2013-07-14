include('shared.lua')
include('cl_derma.lua')

surface.CreateFont("showtext", {
font = "Arial",
size = 30
} )

net.Receive("sendmessage", function()
local msg = net.ReadString()
chat.AddText(Color(255, 255, 255, 255), msg)
end )

hook.Add("HUDPaint", "draw_things_for_gungame", function(ply)
ply = LocalPlayer()

surface.SetDrawColor(255, 255, 255, 255)
surface.DrawOutlinedRect(ScrW()/2.2, ScrH()/411, 200, 20)

surface.SetDrawColor(30, 30, 30, 255)
surface.DrawRect(ScrW()/2.199, ScrH()/322, ply:GetNWInt("RoundStat"), 18.9)

surface.SetDrawColor(0, 0, 0, 255)
surface.DrawOutlinedRect(ScrW()/15.82, ScrH()/1.151, 201, 20)

surface.SetDrawColor(0, 100, 0, 255)
surface.DrawRect(ScrW()/15.7, ScrH()/1.15, ply:Health() * 1.99, 18.9)

	if ply:GetNWInt("ShowText") == 1 then
	surface.SetTextColor(255, 255, 255, 255)
	surface.SetTextPos(ScrW()/2.25, ScrH()/5)
	surface.SetFont("showtext")
	surface.DrawText(ply:GetNWInt("TextShow"))
	end
end )

hook.Add("HUDShouldDraw", "hide_things_for_hud", function(x)
	if x == "CHudHealth" then
	return false
	end
end )

net.Receive("playsound", function()
surface.PlaySound(net.ReadString())
end )

net.Receive("zedtime_sendeffect", function()
local zedtime_effect = 0.1
surface.PlaySound("zt_enter.wav") 
	timer.Simple(0.6, function() 
	surface.PlaySound("zt_exit.wav")
		timer.Simple(0.2, function()
		hook.Remove("RenderScreenspaceEffects", "draw_zedtimeeffect")
		end )
	end )

	hook.Add("RenderScreenspaceEffects", "draw_zedtimeeffect", function()
	local zedtime =
	{
	 [ "$pp_colour_addr" ] = 0.2,
	 [ "$pp_colour_addg" ] = 0.2,
	 [ "$pp_colour_addb" ] = 0.2,
	 [ "$pp_colour_brightness" ] = 0,
	 [ "$pp_colour_contrast" ] = 1,
	 [ "$pp_colour_colour" ] = 0.5,
	 [ "$pp_colour_mulr" ] = 0,
	 [ "$pp_colour_mulg" ] = 0,
	 [ "$pp_colour_mulb" ] = 0
	}

	DrawColorModify(zedtime)
	end )
end )
