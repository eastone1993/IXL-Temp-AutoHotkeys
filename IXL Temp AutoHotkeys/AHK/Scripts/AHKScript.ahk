#SingleInstance, force 
#Persistent
;#NoTrayIcon
#IfWinNotExist, `%A_ScriptDir`%\auxillary\testfile.ahk 
{
    Run, %A_ScriptDir%\auxillary\testfile.ahk
} 

OnExit("ExitFunc")

ExitFunc()
{
    DetectHiddenWindows, On 
    WinClose, %A_ScriptDir%\auxillary\testfile.ahk ahk_class AutoHotkey
} 


;----------------------------------- HOTSTRINGS ---------------------------------------------------------------------------------------------------------
::lmk::Please let me know if you have any questions.
::tfyr::Thanks for your reply.
::tfcu::Thanks for contacting us.
;----------------------------------- LINKS AND URLS -------------------------------------------------------------------------------------------------------------
::qssr::https://www.ixl.com/userguides/IXLQuickStart_SiteRoster.pdf 
::afaq::https://www.ixl.com/help-center/School-administrators/665924
::aqsg::https://www.ixl.com/userguides/IXLQuickStart_Administrator.pdf

;----------------------------------- XSTRINGS ------------------------------------------------------------------------------------------------------------------
::xsig::Sincerely,{enter}{enter}Assistant to <SENIORSPECIALIST>{enter}<FIRSTNAME> <LASTNAME>{enter}IXL Account Services{enter}{enter}Mailing Address:{enter}IXL Learning{enter}777 Mariners Island Blvd., Suite 600{enter}San Mateo, CA 94404 USA{enter}{enter}Toll-free 1.855.255.8800 | Direct 1.650.372.4300 | Fax: 1.650.372.4301
::xpswd::I've sent you a password reset link to your e-mail. Let me know if you don't see it.
::xsi::
::xchkin::I'm just reaching out to check-in on how your IXL account set-up is going?
::xintro::My name is <FIRSTNAME> and I am assisting <SENIORSPECIALIST> during this busy time of year. 
;-----------------------------------DATE STAMP FUNCTION-------------------------------------------------------------------------------------------
:R*?:ddd::
FormatTime, CurrentDateTime,, MM/dd/yyyy
SendInput %CurrentDateTime% + <INTIALS>{enter}{enter}{enter}{enter}{Up}{Up}
;-----------------------------------SPELLCORRECT--------------------------------------------------------------------------------------------------
:*?:recieve::receive 
::setup::set-up
::checkin::check-in
:*?:email::e-mail
:*?:seperate::separate
:*?:reccommend::recommend 
::ixl::IXL 
::teh::the 
::managment::management 
:*?:neccessary::necessary
;----------------------------------- SCRUBBING FUNCTION -------------------------------------------------------------------------------------------------------------
;enables editing 
Send !f
sleep, 250
Send i
sleep, 250
Send e
sleep, 250

;resets to main window 
Send {Esc}{Esc}{Esc}
sleep, 500

;scrubbing block 
Send ^{Home}
sleep, 500
Send, ^+{End}
sleep, 250
Send ^c
sleep, 250
Send +{F11}
sleep, 250
Send ^!v
sleep, 250
Send v
Send {enter}
sleep, 250

;sorts file to eliminate blank lines 
Send ^{Home}
sleep, 250
Send, {down}
sleep, 250
Send ^+{End}
sleep, 250
Send {alt}
sleep, 250
Send a 
sleep, 250
send sa 
sleep, 500

Return


;ALL IN ONE SCRUBBING AND SAVING FUNCTION ---------------------------------------------------------------------
^+l::
;enables editing 
Send !f
sleep, 250
Send i
sleep, 250
Send e
sleep, 250

;resets to main window 
Send {Esc}{Esc}{Esc}
sleep, 500

;scrubbing block 
Send ^{Home}
sleep, 500
Send, ^+{End}
sleep, 250
Send ^c
sleep, 250
Send +{F11}
sleep, 250
Send ^!v
sleep, 250
Send v
Send {enter}
sleep, 250

;sorts file to eliminate blank lines 
Send ^{Home}
sleep, 250
Send, {down}
sleep, 250
Send ^+{End}
sleep, 250
Send {alt}
sleep, 250
Send a 
sleep, 250
send sa 
sleep, 500

;saving block 
Send {F12}
sleep, 500
Send {Esc}
sleep, 250
Send {F12}
sleep, 500
Send {F4}
Send {F6}{F6}{F6}{F6}{F6}
sleep, 500
Send d ;resets file type
Send c ;sets file type to csv 
Send !d ;moves to address bar 
sleep, 250
Send ^a
sleep, 250
Send %A_Desktop%\Rosters ;file path
Send, {enter}
sleep, 250
Send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab} ;navigates back to filename bar 
;MsgBox, Done
Return

;--------------------------------SEARCH FUNCTION-----------------------------------------------------------------------------------------------------------------

/*
Ctrl+Shift+S EMAIL, ACCOUNT NUMBER, OR CASE NUMBER
EMAIL: Searches Quia, SubMan, and SalesForce
ACC#: Searches SubMan and salesforce
Case#: Searches SalesForce
*/

^+s:: 
Clipboard =
Send ^c
ClipWait
contents := Clipboard
contentsTrimmed = %contents%
if RegExMatch(contentsTrimmed, "[\w-_.]+@(?:\w+(?::\d+)?\.){1,3}(?:\w+\.?){1,2}", email) {
    
    Run, "chrome.exe" ; CREATES A NEW WINDOW OF CHROME

    ;QUIA SEARCH
    winactivate ahk_exe chrome.exe
    ;Send, ^t ; NOT NECESSARY TO CREATE NEW TAB FOR FIRST SEARCH WHEN WINDOW IS ALREADY PULLED UP
    Variable := "https://secure.quia.com/servlets/quia.internal.userInfo.UserInfo?logicModule=1&email=" . email
    Clipboard := Variable
    Send, ^v
    Send, {enter}
    Clipboard := email
    
    ;SALES FORCE SEARCH
    Send, ^t
    var1 := "https://ixl.my.salesforce.com/_ui/search/ui/UnifiedSearchResults?searchType=2&sen=0JZ&sen=001&sen=02s&sen=068&sen=003&sen=00T&sen=00U&sen=005&sen=500&sen=00O&str=" . email
    var2 := var1 . "&isdtp=vw&isWsVw=true&nonce=02541659de9dde0d96e44d154840e14be6f2bb3fcc1022859c569e3e55629581&sfdcIFrameOrigin=https%3A%2F%2Fixl.my.salesforce.com"
    ClipWait
    Clipboard := var2
    sleep, 500 ;WAIT FOR PAGE TO LOAD
    Send, ^v
    Send, {enter}
    Clipboard := email

    ;SUBMANAGER SEARCH
    var3 := Clipboard
    Send, ^t
    Clipboard := "https://secure.quia.com/actions/subManager/search/sub"
    Send, ^v
    Send, {enter}
    sleep, 1000 ;WAIT FOR PAGE TO LOAD
    Send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}
    Clipboard := var3
    Send, ^v
    Send, {enter}
    
     ;sends the screen to the right 
    sleep, 500
    Send, #+{Right} 
    
} else {
    Length := StrLen(contentsTrimmed)
    if (Length=8){
        
        ;Run, "chrome.exe" ; CREATES A NEW WINDOW OF CHROME
        
        ;SALESFORCE SEARCH
        winactivate ahk_exe chrome.exe
        Send, ^t
        var1 := "https://ixl.my.salesforce.com/_ui/search/ui/UnifiedSearchResults?searchType=2&sen=0JZ&sen=001&sen=02s&sen=068&sen=003&sen=00T&sen=00U&sen=005&sen=500&sen=00O&str=" . contentsTrimmed
        var2 := var1 . "&isdtp=vw&isWsVw=true&nonce=02541659de9dde0d96e44d154840e14be6f2bb3fcc1022859c569e3e55629581&sfdcIFrameOrigin=https%3A%2F%2Fixl.my.salesforce.com"
        ClipWait
        Clipboard := var2
        sleep, 500
        Send, ^v
        Send, {enter}

    } else if (Length>8) {
        
        ;Run, "chrome.exe" ; CREATES A NEW WINDOW OF CHROME

        ;SUBMANAGER SEARCH
        winactivate ahk_exe chrome.exe
        StringTrimLeft, NewStr, contentsTrimmed, 4 ;TRIMS PRECEDING A##- SO IT WOULD WORK WITH SALES FORCE
        Send, ^t
        Variable := "https://secure.quia.com/actions/subManager/account/view/" . contentsTrimmed
        ClipWait    
        Clipboard := Variable
        Send, ^v
        Send, {enter} 

        ;SALESFORCE SEARCH
        Send, ^t
        var1 := "https://ixl.my.salesforce.com/_ui/search/ui/UnifiedSearchResults?searchType=2&sen=0JZ&sen=001&sen=02s&sen=068&sen=003&sen=00T&sen=00U&sen=005&sen=500&sen=00O&str=" . NewStr
        var2 := var1 . "&isdtp=vw&isWsVw=true&nonce=02541659de9dde0d96e44d154840e14be6f2bb3fcc1022859c569e3e55629581&sfdcIFrameOrigin=https%3A%2F%2Fixl.my.salesforce.com"   
        ClipWait
        Clipboard := var2
        sleep, 500
        Send, ^v
        Send, {enter}

    } else { 

        ;Run, "chrome.exe" ; CREATES A NEW WINDOW OF CHROME

        ;SUBMANAGER SEARCH
        winactivate ahk_exe chrome.exe
        Send, ^t
        Variable := "https://secure.quia.com/actions/subManager/account/view/" . contentsTrimmed
        ClipWait    
        Clipboard := Variable
        Send, ^v
        Send, {enter}   

        ;SALESFORCE SEARCH
        Send, ^t
        var1 := "https://ixl.my.salesforce.com/_ui/search/ui/UnifiedSearchResults?searchType=2&sen=0JZ&sen=001&sen=02s&sen=068&sen=003&sen=00T&sen=00U&sen=005&sen=500&sen=00O&str=" . contentsTrimmed
        var2 := var1 . "&isdtp=vw&isWsVw=true&nonce=02541659de9dde0d96e44d154840e14be6f2bb3fcc1022859c569e3e55629581&sfdcIFrameOrigin=https%3A%2F%2Fixl.my.salesforce.com"   
        ClipWait
        Clipboard := var2
        sleep, 500
        Send, ^v
        Send, {enter}
    }

}
Return
;----------------------------------- SHORT-CUT QUIA SEARCH -------------------------------------------------------------------------------------------------------------
^+d::
; Identifies selected text as username or e-mail and searches for account
; Start off empty to allow ClipWait to detect when the text has arrived.
Clipboard =
Send ^c
; Wait for the clipboard to contain text.
ClipWait
contents := Clipboard
contentsTrimmed = %contents%
winactivate ahk_exe chrome.exe
Send, ^t
Variable := "https://secure.quia.com/servlets/quia.internal.userInfo.UserInfo?logicModule=1&email=" . contentsTrimmed
Clipboard := Variable
Send, ^v
Send, {enter}
Clipboard := email
Return

;-----------------------------------E-MAIL TEMPLATES-----------------------------------------------------------------------------------------------------


/*
E-MAIL TEMPLATES FOR TEMPS TO USE
*/
;----------------------------------- INTRODUCTIONS-------------------------------------------------------------------------------------------------------------
