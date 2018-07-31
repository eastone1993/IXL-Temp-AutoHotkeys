#SingleInstance, force 
#NoTrayIcon
#IfWinNotExist, `%A_WorkingDir`%\AHK\IXLAutoHotKeysGUI.ahk 
{
    Run, %A_WorkingDir%\AHK\IXLAutoHotKeysGUI.ahk
    ExitApp
} 

#IfWinExist, `%A_WorkingDir`%\AHK\IXLAutoHotKeysGUI.ahk 
{
	ExitApp 
}