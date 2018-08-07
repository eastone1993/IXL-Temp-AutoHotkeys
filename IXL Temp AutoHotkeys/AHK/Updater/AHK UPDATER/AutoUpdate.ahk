#Persistent
#SingleInstance, force 
#include %A_ScriptDir%\library\Zip-Unzip.ahk ;library for zip functions
#include %A_ScriptDir%\library\updaterlib.ahk 

;MsgBox, AutoUpdate Called.

filename := "auto-update.zip" ;names the zip folder being downloaded
FileURL := "https://github.com/floppernopper/AutoUpdate/archive/master.zip" ;actual url for file being downloaded

IfNotExist, %A_ScriptDir%\auto updates 
{
	FileCreateDir, %A_ScriptDir%\auto updates 
}

SetWorkingDir, %A_ScriptDir%\auto updates   ;sets directory to download file

UrlDownloadToFile, %FileURL%, %filename%        ;downloads file with designated name 

MsgBox Auto Updates finished!

;----------------------------------- ZIP -------------------------------------------------------------------------------------------------------------

sZip := A_WorkingDir . "\auto-update.zip" ;directory and name of file being unzipped
sUnz := A_WorkingDir ;place to unzip file

Unz(sZip, sUnz) ;call to unzip function 

MsgBox AUTO UPDATES Unzipped!


;----------------------------------- unpacking -------------------------------------------------------------------------------------------------------------
FileReadLine, auversion, %A_WorkingDir%\AutoUpdate-master\AutoUpdate\AutoInfo.ahk, 1 ;patch file contains version at first line of file
FileReadLine, aucontrol, %A_ScriptDir%\AutoInfo.ahk, 1 ;text file containing current version 

if (auversion != aucontrol) ;checks if versions are same or different
{
	AutoUpdate()
}

else 
{
	ClearAutoUpdateDir()
}


ExitApp