

#Persistent
#SingleInstance, force 
#NoTrayIcon
#Include %A_WorkingDir%\Library\scrollbar.ahk

OnMessage(0x115, "OnScroll") ; WM_VSCROLL
OnMessage(0x114, "OnScroll") ; WM_HSCROLL

Gui, +Resize +0x300000
Gui, Show, w1250 h756, E-mail Template Reference Sheet 
Gui, Add, Picture, x0 y0 w1250 h756, %A_WorkingDir%\images\ref.png
GroupAdd, MyGui, % "ahk_id " . WinExist()
return 

GuiClose:
ExitApp

GuiSize:
    UpdateScrollBars(A_Gui, A_GuiWidth, A_GuiHeight)
return

#IfWinActive ahk_group MyGui
WheelUp::
WheelDown::
+WheelUp::
+WheelDown::
    ; SB_LINEDOWN=1, SB_LINEUP=0, WM_HSCROLL=0x114, WM_VSCROLL=0x115
    OnScroll(InStr(A_ThisHotkey,"Down") ? 1 : 0, 0, GetKeyState("Shift") ? 0x114 : 0x115, WinExist())
return

