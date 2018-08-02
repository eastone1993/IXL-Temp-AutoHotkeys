

#Persistent
#SingleInstance, force 
#NoTrayIcon

Gui, +Resize
Gui, Show, w1250 h756, E-mail Template Reference Sheet 
Gui, Add, Picture, x0 y0 w1250 h756, %A_WorkingDir%\images\ref.png
return 

GuiClose:
ExitApp



/*
#Persistent
#SingleInstance, force 
;#NoTrayIcon
;#Include %A_Desktop%\anchor.ahk 
Gui, +Resize
Gui, Show, w1250 h756, E-mail Template Reference Sheet 

WinGetPos, , , GuiWidth, GuiHeight, E-mail Template Reference Sheet 

GW := " w" . GuiWidth
GH := " h" . GuiHeight
Gui, Add, Picture, x0 y0 %GW% %GH%, %A_WorkingDir%\images\ref.png
;MsgBox % GW 
;MsgBox % GH 
return 

GuiSize:
WinGetPos, , , GuiWidth, GuiHeight, E-mail Template Reference Sheet 
GW := " w" . GuiWidth
GH := " h" . GuiHeight
Gui, Add, Picture, x0 y0 %GW% %GH%, %A_WorkingDir%\images\ref.png
Gui, Show, %GW% %GH%, E-mail Template Reference Sheet 
return 

GuiClose:
ExitApp
*/