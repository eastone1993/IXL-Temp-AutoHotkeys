#Persistent
#SingleInstance, force 
#include %A_ScriptDir%\library\Zip-Unzip.ahk ;library for zip functions
#include %A_ScriptDir%\library\updaterlib.ahk 

;----------------------------------- DOWNLOAD SECTION -------------------------------------------------------------------------------------------------------------
filename := "update.zip" ;names the zip folder being downloaded
FileURL := "https://github.com/floppernopper/AHK-UPDATE/archive/master.zip" ;actual url for file being downloaded 

IfNotExist, %A_ScriptDir%\updates 
{
	FileCreateDir, %A_ScriptDir%\updates 
}

SetWorkingDir, %A_ScriptDir%\updates   ;sets directory to download file

UrlDownloadToFile, %FileURL%, %filename%        ;downloads file with designated name 

;MsgBox Download finished! 

;----------------------------------- UNZIP SECTION -------------------------------------------------------------------------------------------------------------

sZip := A_WorkingDir . "\update.zip" ;directory and name of file being unzipped
sUnz := A_WorkingDir ;place to unzip file

Unz(sZip, sUnz) ;call to unzip function 

;MsgBox Unzipped!

;----------------------------------- CHECK PATCH INFO -------------------------------------------------------------------------------------------------------------



FileReadLine, version, %A_WorkingDir%\AHK-UPDATE-master\patch info\PatchInfo.ahk, 1 ;patch file contains version at first line of file
FileReadLine, vcontrol, %A_ScriptDir%\PatchInfo.ahk, 1 ;text file containing current version 

;MsgBox %version% : %vcontrol%


if (version != vcontrol) ;checks if versions are same or different
{
	Update()
}

else 
{
	ClearUpdateDir()
}


ExitApp


