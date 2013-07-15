surface.CreateFont("f1helptext_font", {
font = "Arial",
size = 16
} )

concommand.Add("gungame_help", function()
local at_how_to_get_area = false

local F1Menu = vgui.Create("DFrame")
F1Menu:SetPos(ScrW()/2.6, ScrH()/5)
F1Menu:SetSize(500, 400)
F1Menu:SetTitle("Help")
F1Menu:SetDraggable(false)
F1Menu:ShowCloseButton(true)
F1Menu:MakePopup()

	function F1Menu:Paint()
	draw.RoundedBox(12, 0, 0, 500, 400, Color(50, 50, 50, 255))
	end
	
local F1MenuText = vgui.Create("DTextEntry", F1Menu)
F1MenuText:SetPos(10, 40)
F1MenuText:SetWide(480)
F1MenuText:SetTall(320)
F1MenuText:SetMultiline(true)
F1MenuText:SetText(GunGame.HelpText)
F1MenuText:SetTextColor(Color(255, 255, 255, 255))
F1MenuText:SetFont("f1helptext_font")
F1MenuText:SetDrawBackground(false)
F1MenuText:SetEnterAllowed(false)
F1MenuText:SetEditable(false)
	
local F1MenuButton = vgui.Create("DButton", F1Menu)
F1MenuButton:SetPos(10, 360)
F1MenuButton:SetWide(185)
F1MenuButton:SetTextColor(Color(0, 255, 255, 255))
F1MenuButton:SetText("How do I get this gamemode?")
F1MenuButton:SetFont("f1helptext_font")
F1MenuButton:SetVisible(true)
F1MenuButton:SetDrawBackground(false)

local how_to_get_gungame_text = 
[[You can get this gamemode at my GitHub]]


	function F1MenuButton:DoClick()
	local go_up = true
	local go_down = false
	local gone = 1
		if !at_how_to_get_area then
		at_how_to_get_area = true
		F1MenuText:SetText(how_to_get_gungame_text)
			F1LinkTyguyPage = vgui.Create("DButton", F1Menu)
			F1LinkTyguyPage:SetPos(12, 70)
			F1LinkTyguyPage:SetText("You can go to my github page by clicking here")
			F1LinkTyguyPage:SetTextColor(Color(255, 255, 255, 255))
			F1LinkTyguyPage:SetFont("f1helptext_font")
			F1LinkTyguyPage:SizeToContents()
			F1LinkTyguyPage:SetSize(280, 20)
			F1LinkTyguyPage:SetDrawBackground(false)
			
				
				function F1LinkTyguyPage:DoClick()
				gui.OpenURL("http://github.com/tyguy550")
				end
				
				function F1LinkTyguyPage:Think()
					if go_up then
					gone = gone + 1
					end
					if go_down then
					gone = gone - 1
					end
					if go_up and gone >= 200 then
					go_up = false
					go_down = true
					end
					if go_down and gone <= 0 then
					go_down = false
					go_up = true
					end
				
				F1LinkTyguyPage:SetTextColor(Color(gone, 0, 0))
				end
				
				
			
		F1MenuButton:SetPos(-45, 360)
		F1MenuButton:SetText("<= Back")
		else
		at_how_to_get_area = false
		F1LinkTyguyPage:Remove()
		F1MenuText:SetText(GunGame.HelpText)
		F1MenuButton:SetPos(10, 360)
		F1MenuButton:SetText("How do I get this gamemode?")
		end
	end
end )
