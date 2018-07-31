#Persistent
#SingleInstance, force 
#NoTrayIcon

Gui, Show, w1250 h756, E-mail Template Reference Sheet 
Gui, Add, Picture, x0 y0 w1250 h756, %A_WorkingDir%\images\ref.png
return 

GuiClose:
ExitApp