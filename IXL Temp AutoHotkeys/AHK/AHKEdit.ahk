;----------------------------------- AUTOHOTKEY EDIT GUI -------------------------------------------------------------------------------------------------------------
/*

Name: <FIRSTNAME> <LASTNAME>
Username: <USERNAME>
Initials: <INITIALS>
Assistant: <ASSISTANT>
Roster File Path: C:\Users\<USERNAME>\Desktop\Rosters

*/

#Persistent
#SingleInstance, force

Gui, Show, w1000 h500, Create AutoHotkey Here 

Gui, Add, Text, x150 y20 h30, Enter Return Phrase Below 

Gui, Add, Text, x15 y170, Enter Hotkey Below
Gui, Add, Edit, x15 y200 w120 h30 r1 vAHKPhraseEdit
Gui, Add, Edit, x150 y50 w800 h30 r30 WantTab vAHKStringEdit 
Gui, Add, Button, x15 y230 w120 h30 vEnterAHKEdit gBUILD, Construct New AutoHotkey 
Gui, Add, Button, x15 y270 w120 h30 vPhraseBut gDELETE, Delete AutoHotkey 

return 

BUILD:
{	
	;submits entered stuff
	DetectHiddenWindows, On 
	Gui, Submit, NoHide  

	;creates a hotkey for entered phrase
	var1 := "::" . AHKPhraseEdit 
	;appends _rem to the end of hotkey being overwritten
	var2 :=  var1 . "_rem"
	
	;ensures no hotkeys with whitespace or empty keys are made 
	if AHKPhraseEdit is space
	{
		MsgBox, Please enter a phrase!
		Exit 
	}

	;checks to see if _rem is in custom hotkey 
	if InStr(AHKPhraseEdit, "_rem")
	{
		MsgBox, Do not include "_rem" in your hotkey!
		Exit 
	}

	; checks to see if hotkey already exists 
	Loop, read, testfile.ahk 
	{
		If InStr(A_LoopReadLine, var1) ;checks each line of file for string
		{
			Goto, OVERWRITE    ;jump to overwrite function 
		}
		
	}

	;creates new autohotkey 
	FileAppend, `n::%AHKPhraseEdit%::`n, testfile.ahk
	FileAppend,(`n%AHKStringEdit%`n)`n`n, testfile.ahk

	MsgBox, New Hotkey Added ;confirmation

	;resets custom hotkey file 
	IfWinExist, %A_WorkingDir%\SomeLikeItHotBackup.ahk 
	{
		WinClose, %A_WorkingDir%\testfile.ahk ahk_class AutoHotkey 
		Run, %A_WorkingDir%\testfile.ahk		
	}

	Exit

	;goto overwrite: function that asks if they want to overwrite previous hotkey 
	OVERWRITE:
	MsgBox, 4, , HotKey already exists! Would you like to replace it?
	IfMsgBox, Yes 
	
	{
		;replaces old autohotkey with new one
		FileRead, TheText, testfile.ahk 
		StringReplace, NewText, TheText, %var1%, %var2%, All

		;rewrites file	   
		FileDelete, %A_WorkingDir%\testfile.ahk 
		FileAppend, %NewText%, %A_WorkingDir%\testfile.ahk 

		;adds new autohotkey to file
		FileAppend,`n::%AHKPhraseEdit%::`n, testfile.ahk
		FileAppend,(`n%AHKStringEdit%`n)`n`n, testfile.ahk

		MsgBox, New Hotkey Added ;confirmation

		;resets custom autohotkey file
		IfWinExist, %A_WorkingDir%\SomeLikeItHotBackup.ahk 
		{
			WinClose, %A_WorkingDir%\testfile.ahk ahk_class AutoHotkey 
			Run, %A_WorkingDir%\testfile.ahk		
		}

		Exit  	 
	}

	IfMsgBox, No 
	{
		Exit 
	}
	
	return 
}

DELETE:
{
	;submits entered stuff
	DetectHiddenWindows, On 
	Gui, Submit, NoHide  

	;creates a hotkey for entered phrase
	var1 := "::" . AHKPhraseEdit 
	;appends _rem to the end of hotkey being overwritten
	var2 :=  var1 . "_rem"
	
	;ensures no hotkeys with whitespace or empty keys are made 
	if AHKPhraseEdit is space
	{
		MsgBox, Please enter a phrase!
		Exit 
	}

	;checks to see if _rem is in custom hotkey 
	if InStr(AHKPhraseEdit, "_rem")
	{
		MsgBox, Do not include "_rem" in your hotkey!
		Exit 
	}
	
	Loop, read, testfile.ahk 
	{
		If InStr(A_LoopReadLine, var1) ;checks each line of file for string
		{
			Goto, REMOVE    ;jump to overwrite function 
		}
		
	}

	MsgBox, Hotstring not found!
	Exit 
	;replaces old autohotkey with new one
	REMOVE:
	MsgBox, 4, , Remove %AHKPhraseEdit% ?
	IfMsgBox, Yes
	{
		FileRead, TheText, testfile.ahk 
		StringReplace, NewText, TheText, %var1%, %var2%, All

		;rewrites file	   
		FileDelete, %A_WorkingDir%\testfile.ahk 
		FileAppend, %NewText%, %A_WorkingDir%\testfile.ahk 	

		MsgBox, HotString %AHKPhraseEdit% removed.  ;confirmation

		;resets custom autohotkey file
		IfWinExist, %A_WorkingDir%\SomeLikeItHotBackup.ahk 
		{
			WinClose, %A_WorkingDir%\testfile.ahk ahk_class AutoHotkey 
			Run, %A_WorkingDir%\testfile.ahk		
		}

		Exit
	}
	IfMsgBox, No 
	{
		MsgBox, Hotstring not removed!
		Exit 
	} 

	return 
}

GuiClose:
ExitApp 


