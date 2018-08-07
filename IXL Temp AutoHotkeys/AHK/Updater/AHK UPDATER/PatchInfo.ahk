;v3.0

#Persistent
#SingleInstance, force 
#include %A_ScriptDir%\library\updaterlib.ahk 

MsgBox, PATCH INFO CALLED 

dir := A_ScriptDir . "\updates"
des := A_Desktop . "\test stuff\updates"

FileMoveDir, %dir%, %des%, 2
zd := des . "\*.zip"
FileDelete, %zd%

ClearUpdateDir()

MsgBox, Installation Complete!

ExitApp 
