#Persistent
#SingleInstance, force 
#NoTrayIcon

Gui, +Resize
Gui, Show, w1251 h883, E-mail Template Reference Sheet 
Gui, Add, Picture, x0 y0 w1251 h883, %A_WorkingDir%\images\ref3.png
return 

GuiClose:
ExitApp