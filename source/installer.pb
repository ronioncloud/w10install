; installer.pb
; ------------------------------------------------------------
; installer wrapper for setup.exe 
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20210317
; ------------------------------------------------------------
;

; preparations to use native "system" command...
ImportC "msvcrt.lib"
  system(str.p-ascii)
EndImport

; open window to hide all other windows on dekstop ...
OpenWindow(0, 0, 0, 0, 0, "", #PB_Window_BorderLess | #PB_Window_Maximize)
 
; set colour to windows blue ...
SetWindowColor(0, RGB($00,$a2,$ed)) 

Result = MessageRequester("+++ Windows 10 unattended Installation +++",
                          "This will install a new OS (unattended)" + Chr(13) +
                          "and it will DELETE all DATA an your [ C: ] Drive!",
                          #PB_MessageRequester_YesNo | #PB_MessageRequester_Info)

If Result = #PB_MessageRequester_Yes
  
  Result = MessageRequester("Caution !",
                            "LAST WARNING:" + Chr(13) + 
                            "REALLY DELETE ALL Data on DRIVE [ C: ] ?",
                            #PB_MessageRequester_YesNo | #PB_MessageRequester_Warning)
  
  ; start installation ...
  If Result = #PB_MessageRequester_Yes
    dummy=system("x:\winsetup.exe")
    End 0
  EndIf

EndIf

; show abort message ...
OpenWindow(1, 0, 0, 270, 70, "Installation ABORTED",
           #PB_Window_SystemMenu | #PB_Window_ScreenCentered)

If LoadFont(0, "System", 10)
  SetGadgetFont(#PB_Default, FontID(0))
EndIf

TextGadget(0, 0, 20, 270, 30, "Please POWEROFF your system now!", #PB_Text_Center)

; wait forever (window cannot be closed by user) ...
Repeat : Until WaitWindowEvent() = True

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 32
; FirstLine = 8
; EnableXP