;-----------------------------------  CUSTOM AHK VIEW GUI -------------------------------------------------------------------------------------------------------------
#Persistent
#SingleInstance, force 

Gui, Show, w1000 h500, Custom Hotkeys Reference Sheet
Gui, Add, Text,x50 y25, Hotkey's are denoted by the asterik. 
Gui, Add, Edit, x50 y50 r30 w900 ReadOnly vCustomRef

;variables used to remove AHK code to make output readable 
var0 := "::"
var1 :=  "("
var2 := ")" 
var3 := "*"
var4 := ""

FileRead, FileContents, %A_WorkingDir%\testfile.ahk 
StringReplace, NewContents1, FileContents, %var0%, %var3%, All
StringReplace, NewContents2, NewContents1, %var1%, %var4%, All 
StringReplace, NewContents, NewContents2, %var2%, %var4%, All  

derp(arg) { ;decides if argument should be added to custom view output
	if arg = "`n" ;does not add extra whitespace
	{
		Exit ;do not do anything else if whitespace
	}
	else 
	{
		FileAppend, `n%arg% , cus.txt ;add to custom view 
	}
}

a := false ;false when adding the line to custom view output
Loop, Parse, NewContents, "`n`n`n"
{
	If InStr(A_LoopField, "_rem") ;changes a to true when _rem is found 
	{
		a := true 
		;MsgBox, %A_LoopField% NOT ADDED 
		continue ;exits loop without adding to custom view 
	} 
	else if (a = true) ;once _rem is found, continue ignoring elements associated with _rem 
	{
		if InStr(A_LoopField, "*") ;new hotstring no longer associated with _rem, 
		{
			a := false ;addable element 
			;MsgBox, %A_LoopField% ADDED 
			derp(A_LoopField) ;deciedes if it should add 
			continue 
		}
		else ;if true but no new element, must still be part of _rem 
		{
			;MsgBox, %A_LoopField% NOT ADDED 
			Continue ;restart loop without adding to custom view 
		}
	}
	else 
	{
		derp(A_LoopField) ;if false and not _rem, it must be addable to custom view 
		;MsgBox, %A_LoopField% ADD 
		continue 
	}
}

FileRead, CusView, %A_WorkingDir%\cus.txt  
GuiControl,, CustomRef, %CusView%
FileDelete, %A_WorkingDir%\cus.txt
return 
GuiClose:
ExitApp
  