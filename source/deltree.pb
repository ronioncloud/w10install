; deltree.pb
; ------------------------------------------------------------
; deletes files and directories...
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20190524
; ------------------------------------------------------------
;

OpenConsole()
EnableGraphicalConsole(0)

; check commandline...
If ( CountProgramParameters() = 0 Or CountProgramParameters() >1 )
	ConsoleColor(14,0)
	PrintN("")
	PrintN("usage: deltree <path>")
	PrintN("")
	ConsoleColor(15,0)
	PrintN("deletes all files and directories")
	PrintN("  recursively found in the given path.")
	ConsoleColor(7,0)
	PrintN("")
	End 99
EndIf

;
; MAIN
;

path$ = ProgramParameter(0)
result = (DeleteDirectory(path$, "", #PB_FileSystem_Recursive|#PB_FileSystem_Force))

If result = 0
  PrintN("ERROR while trying to delete: " + path$ + " !")
Else
	PrintN("OK:" + path$ + " DELETED.")
EndIf

CloseConsole()

