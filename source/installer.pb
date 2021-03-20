; installer.pb
; ------------------------------------------------------------
; installer wrapper for setup.exe 
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20210320
; ------------------------------------------------------------
;

; preparations to use native "system" command ...
ImportC "msvcrt.lib"
  system(str.p-ascii)
EndImport

; Get system drive
SYS$=GetEnvironmentVariable("SystemDrive")

Procedure StartInstallation()
  
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
      dummy=system(SYS$ + "\winsetup.exe")
      End 0
    EndIf
    
  EndIf
    
  ; new fullscreen window with red colour ...
  OpenWindow(10, 0, 0, 0, 0, "", #PB_Window_BorderLess | #PB_Window_Maximize)
  SetWindowColor(10, RGB($FF,$00,$00))
  
  ; kill main window ...
  CloseWindow(0)
  
  MessageRequester("END.","Press OK to shutdown your system.",#PB_MessageRequester_Info)
    
  End
  
EndProcedure


Procedure StartCMD()
  
  ; start a command shell ...
  dummy=system(SYS$ + "\windows\system32\cmd.exe /C start /D "+SYS$+"\ "+SYS$+"\windows\system32\cmd.exe /K wpeutil initializenetwork")
  
EndProcedure


Procedure StartSnapshot64()
  
  ; start backup/restore program ...
  dummy=system(SYS$ + "\windows\system32\cmd.exe /C start /D "+SYS$+"\ "+SYS$+"\snapshot64.exe")
  
EndProcedure


; Button handler procedure
Procedure ButtonHandler()
  
  Select EventGadget()
      
    Case 0
      StartInstallation()
    Case 1
      StartCMD()
    Case 2
      StartSnapshot64()
      
  EndSelect

EndProcedure


;;;;;;;
; MAIN
;;;;;;;

; open window to hide all other windows on desktop ...
OpenWindow(0, 0, 0, 0, 0, "", #PB_Window_BorderLess | #PB_Window_Maximize)
 
; set colour to windows blue ...
SetWindowColor(0, RGB($00,$a2,$ed)) 

; Get window size
W = WindowWidth(0)
H = WindowHeight(0)

; Shrink factor for buttons
S=0.1

; X and Y root
X0=W/2-(W*S/2)
Y0=H/2-(W*S/2)

; calculations for buttons
ButtonH=H*0.1
ButtonW=W*0.1
GAP=ButtonW*0.1

BX1=W/3
BX2=BX1 + ButtonW + GAP
BX3=BX2 + ButtonW + GAP

BY=H/2-ButtonH/2

; Create Buttons
ButtonGadget(0, BX1, BY, ButtonW, ButtonH, "INSTALL system", #PB_Button_MultiLine)
BindGadgetEvent(0, @ButtonHandler())

ButtonGadget(1, BX2, BY, ButtonW, ButtonH, "COMMAND shell"+Chr(13)+"(with network)", #PB_Button_MultiLine)
BindGadgetEvent(1, @ButtonHandler())

ButtonGadget(2, BX3, BY, ButtonW, ButtonH, "Snapshot 64"+Chr(13)+"(Backup/Restore)", #PB_Button_MultiLine)
BindGadgetEvent(2, @ButtonHandler())

; MAIN LOOP
Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 118
; FirstLine = 86
; Folding = -
; EnableXP