; installmonitor.pb
; ------------------------------------------------------------
; tool to monitor the running installation ...
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20210322
; ------------------------------------------------------------
;

; Get system drive
SYS$=GetEnvironmentVariable("SystemDrive")

; logfile to monitor ...
logfile$=SYS$+"\tools\scripts\autoconfig-all.txt"

;;;;;;;
; MAIN
;;;;;;;

; open window to hide all other windows on desktop ...
OpenWindow(0, 0, 0, 0, 0, "Unattended Installation - running scripts ...", #PB_Window_SystemMenu | #PB_Window_Maximize)
StickyWindow(0,#True)
SetActiveWindow(0)

; set colour to windows blue ...
SetWindowColor(0, RGB($00,$a2,$ed)) 

; Get window size
W = WindowWidth(0)
H = WindowHeight(0)

; create text field ...
EditorGadget(0, 8, 8, W-16, H-16, #PB_Editor_ReadOnly | #PB_Editor_WordWrap)

; load system font
LoadFont(0, "Consolas", 12)
SetGadgetFont(0, FontID(0))

; open logfile ...
If Not ReadFile(0, logfile$, #PB_File_SharedWrite | #PB_File_NoBuffering)
  AddGadgetItem(0, -1, "===== ERROR while trying to open logfile: [ "+logfile$+" ] ! =====")
  Repeat: Delay(1)
  Until WaitWindowEvent() = #PB_Event_CloseWindow
  End
EndIf

; goto end of file ...
FileSeek(0,Lof(0))

; print starting message ...
AddGadgetItem(0, -1, "===== Starting Installation. Logfile = [ "+logfile$+"] =====")

; get filesize ...
filesize=Lof(0)
Repeat
  
  ; new data ?
  If ( filesize < Lof(0) )
    ; print new file contents ...
    Repeat
      AddGadgetItem(0, -1, ReadString(0))
    Until Eof(0)
    filesize=Lof(0)
    
    ; scroll down editor gadget ...
    SendMessage_(GadgetID(0), #EM_SETSEL,-1,-1)
    
    ; window refresh ...
    StickyWindow(0,#True)
    SetActiveWindow(0)
    
  EndIf
  
Until WaitWindowEvent() = #PB_Event_CloseWindow

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 6
; EnableXP