; logmonitor.pb
; ------------------------------------------------------------
; tool to monitor a logfile ...
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20210329
; ------------------------------------------------------------
;

If ( CountProgramParameters() <> 1 )
  dummy = MessageRequester("Usage:",
                           "logmonitor <filename>" + Chr(13) +
                           "  shows a logfile and print changes in realtime in a window" + Chr(13) +
                           "  filename : full or relative path to file",
                           #PB_MessageRequester_Info)
  End 99
EndIf

; logfile to monitor ...
logfile$=ProgramParameter(0)

;;;;;;;
; MAIN
;;;;;;;

; open logfile ...
If Not ReadFile(0, logfile$, #PB_File_SharedWrite | #PB_File_NoBuffering)
  dummy = MessageRequester("ERROR",
                           "cannot open logfile: [ "+logfile$+" ]",
                           #PB_MessageRequester_Error)
  End 99
EndIf

; open window to hide all other windows on desktop ...
OpenWindow(0, 0, 0, 0, 0, "", #PB_Window_BorderLess|#PB_Window_Maximize)
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

; goto end of file ...
FileSeek(0,Lof(0))

; print starting message ...
AddGadgetItem(0, -1, "===== Monitoring logfile: [ "+logfile$+" ] =====")

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

; IDE Options = PureBasic 5.71 LTS (Windows - x64)
; CursorPosition = 31
; FirstLine = 6
; EnableXP