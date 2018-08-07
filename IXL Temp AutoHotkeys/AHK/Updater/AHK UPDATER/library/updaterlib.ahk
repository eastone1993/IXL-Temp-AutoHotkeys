#persistent
#SingleInstance, force 
#NoTrayIcon

Update()
{
	SetWorkingDir, %A_ScriptDir%
	FileMove, %A_WorkingDir%\updates\AHK-UPDATE-master\patch info\PatchInfo.ahk, %A_WorkingDir%, 1
	Run, %A_WorkingDir%\PatchInfo.ahk ;runs patch control if it is a new version
	return  
}
ClearUpdateDir()
{
	FileRemoveDir, %A_ScriptDir%\updates, 1 ;deletes the update if same version 
	FileCreateDir, %A_ScriptDir%\updates ;recreates empty update directory 
	FileAppend, %version%, %A_ScriptDir%\updates\vcontrol.txt 
	;MsgBox, FILES DELETED
	return 
}

AutoUpdate()
{
	SetWorkingDir, %A_ScriptDir%
	FileMove, %A_WorkingDir%\auto updates\AutoUpdate-master\AutoUpdate\AutoInfo.ahk, %A_WorkingDir%, 1
	Run, %A_WorkingDir%\AutoInfo.ahk 
	return 
}

ClearAutoUpdateDir()
{
	FileRemoveDir, %A_ScriptDir%\auto updates, 1
	FileCreateDir, %A_ScriptDir%\auto updates 
	FileAppend, %auversion%, %A_ScriptDir%\auto updates\aucontrol.txt 
	return 
}