SetWorkingDir, %A_ScriptDir%
#Persistent
#SingleInstance, force 
#NoTrayIcon
#Include %A_WorkingDir%\AHK\Library\GUILibrary.ahk 


DetectHiddenWindows, On
SetTitleMatchMode, 2

ButtonArray := ["AHKScript"]
TapArray := ["AHKEdit", "CustomAHKView"]
BuildButtonArray(5, 15, 200, 30, 5, ButtonArray)
BuildTapArray(5, 60, 200, 30, 5, TapArray)
BuildGui("IXL Hot Keys", 500, 500)

return 

;----------------------------------- MAIN SCRIPT BUTTON -------------------------------------------------------------------------------------------------------------
AHKScriptOn:
{
	OnButton("AHKScript")
	return
}

AHKScriptOff:
{
	OffButton("AHKScript")
	return 
}

;-----------------------------------  CUSTOM AHK SCRIPTS------------------------------------------------------------ -------------------------------------------------
AHKEditOn:
{
	Tap("AHKEdit")
	return
}

CustomAHKViewOn:
{
	Tap("CustomAHKView")
	return 
}


;----------------------------------- GUI CLOSE -------------------------------------------------------------------------------------------------------------
GuiClose:
ExitAllArray(ButtonArray)
ExitApp 