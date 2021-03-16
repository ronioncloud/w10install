; allpull.pb
; ------------------------------------------------------------
; GIT tool for pulling all repositories
;   in a given directory structure
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20190826
; ------------------------------------------------------------
;

OpenConsole()
EnableGraphicalConsole(0)

; check commandline...
If ( CountProgramParameters() = 0 Or CountProgramParameters() >1 )
	ConsoleColor(14,0)
	PrintN("")
	PrintN("usage: allpull <path>")
	PrintN("")
	ConsoleColor(15,0)
	PrintN("Executes a git pull on all repositories")
	PrintN("  recursively found in the given path.")
	ConsoleColor(7,0)
	PrintN("")
	End 99
EndIf

;
; PROCEDURES
;

Procedure system(command$,args$)

  out$ = ""
  p = RunProgram(command$, args$, "", #PB_Program_Open | #PB_Program_Read)
  
  If p
    While ProgramRunning(p)
      If AvailableProgramOutput(p)
        out$ + ReadProgramString(p) + Chr(13)
      EndIf
    Wend
    CloseProgram(p)
    PrintN(out$)
  Else
    PrintN("ERROR calling program: '" + command$ + "'!")
  EndIf

EndProcedure

  
Procedure allpull(path$)

	z = 0
	result = 0
	dir$ = ""
	Dim dirlist$(0)

	If Not SetCurrentDirectory(path$)
		PrintN ("ERROR: cannot chdir to '" + path$ +"'!")
		ProcedureReturn 1
	EndIf

	If ExamineDirectory(0,".", "")
		While NextDirectoryEntry(0)
			If DirectoryEntryType(0) = #PB_DirectoryEntry_Directory
				dir$ = DirectoryEntryName(0)
				If Dir$ <> "." And Dir$ <> ".."
					dirlist$(z) = dir$
					z = z + 1
					ReDim dirlist$(z)
				EndIf
			EndIf
		Wend
		FinishDirectory(0)
	EndIf

	For z = 0 To ArraySize(dirlist$())-1
		If dirlist$(z) = ".git"
			PrintN("CWD = " + GetCurrentDirectory())
			PrintN("pulling '" + path$ + "' ...")
			result = system("git","pull")
			Else
			; recursion !
			allpull(dirlist$(z))
		EndIf
	Next z

	result = SetCurrentDirectory("..")

EndProcedure

;
; MAIN
;

allpull(ProgramParameter(0))
CloseConsole()
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; ExecutableFormat = Console
; CursorPosition = 18
; Folding = -
; Executable = C:\TEMP\allpull.exe
; DisableDebugger