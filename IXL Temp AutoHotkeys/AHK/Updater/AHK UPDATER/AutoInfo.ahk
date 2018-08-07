;v.1
#Persistent
#NoTrayIcon 
#SingleInstance, force 
#include %A_ScriptDir%\library\updaterlib.ahk 

MsgBox, AutoInfo Called 

ClearAutoUpdateDir()

MsgBox, AutoUpdate Complete!

ExitApp