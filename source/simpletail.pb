; simpletail.pb
; ------------------------------------------------------------
; show a file and print changes in realtime ...
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20210321
; ------------------------------------------------------------
;

OpenConsole()
SetConsoleCtrlHandler_(?CTRLC,#True)

; check commandline ...
If ( CountProgramParameters() <> 2 )
	ConsoleColor(14,0)
	PrintN("")
	PrintN("usage: simpletail <filename> <refreshtime>")
	PrintN("")
	ConsoleColor(15,0)
	PrintN("show a files content and print changes in realtime")
	PrintN("  filename   : full or relative path to file")
	PrintN("  refreshtime: time in seconds for refresh")
	ConsoleColor(7,0)
	PrintN("")
	End 99
EndIf

; get arguments ...
filename$ = ProgramParameter(0)
refreshtime = Val(ProgramParameter(1))

;
; MAIN
;

If Not ReadFile(0, filename$, #PB_File_SharedWrite | #PB_File_NoBuffering)
  PrintN("ERROR while opening file: " + filename$ + " !")
  End 99
EndIf

; goto end of file ...
FileSeek(0,Lof(0))

; print a message ...
PrintN("===== Starting TAIL for file [ "+filename$+" ] =====")

; get filesize ...
filesize=Lof(0)
Repeat
  
  ; new data ?
  If ( filesize < Lof(0) )
    ; print new file contents ...
    Repeat
      PrintN(ReadString(0))
    Until Eof(0)
    filesize=Lof(0)
  EndIf
  
  ; wait (refreshtime in seconds) ...
  Delay(refreshtime * 1000)
  
ForEver

; exit here ...
CTRLC:
PrintN("CTRL-C pressed")
CloseFile(0)
CloseConsole()
End 0

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 57
; FirstLine = 25
; EnableXP