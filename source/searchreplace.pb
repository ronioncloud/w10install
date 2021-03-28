; searchreplace.pb
; ------------------------------------------------------------
; search a string in a file and replace all occurences
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20210328
; ------------------------------------------------------------
;

OpenConsole()

; check commandline ...
If ( CountProgramParameters() <> 3 )
	ConsoleColor(14,0)
	PrintN("")
	PrintN("usage: searchreplace <filename> <oldstring> <newstring>")
	PrintN("")
	ConsoleColor(15,0)
	PrintN("search a string in a file and replace all occurences")
	PrintN("  oldstring: string to search")
	PrintN("  newstring: string to replace")
	ConsoleColor(7,0)
	PrintN("")
	End 99
EndIf

; get arguments ...
workfile$  = ProgramParameter(0)
oldstring$ = ProgramParameter(1)
newstring$ = ProgramParameter(2)

; vars
tempfile$ = workfile$ + "_T"

;
; MAIN
;

; open workfile ...
If Not ReadFile(0, workfile$, #PB_File_SharedRead | #PB_File_NoBuffering)
  PrintN("ERROR while opening file [ " + workfile$ + " ] for reading!")
  End 99
EndIf

; cleanup ...
DeleteFile(tempfile$,#PB_FileSystem_Force)

; open tempfile ...
If Not OpenFile(1, tempfile$, #PB_File_SharedWrite | #PB_File_NoBuffering)
  PrintN("ERROR while opening tempfile [ " + tempfile$ + " ] for writing!")
  End 99
EndIf

PrintN("working on [ "+ workfile$ +" ] and replacing string [ "+ oldstring$ +" ] With [ "+ newstring$ +" ] ...")
Repeat
  ; read a line ...
  line$ = ReadString(0)
  
  ; search and replace ...
  result$ = ReplaceString(line$, oldstring$, newstring$)
  
  ; write to tempfile ...
  WriteStringN(1, result$)  
Until Eof(0)

; close files ...
CloseFile(0)
CloseFile(1)

; delete workfile ...
DeleteFile(workfile$,#PB_FileSystem_Force)

; move tempfile in place of original file ...
dummy = RenameFile(tempfile$, workfile$)

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 54
; FirstLine = 30
; EnableXP