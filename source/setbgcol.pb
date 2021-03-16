; setbgcol.pb
; ------------------------------------------------------------
; changes windows background colour
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20210315
; ------------------------------------------------------------
;

OpenConsole()
EnableGraphicalConsole(0)

; check commandline...
If ( CountProgramParameters() = 0 Or CountProgramParameters() >4 )
  PrintN("")
	PrintN("usage: setbgcol <R> <G> <B>")
	PrintN("  sets windows background colour")
	End 99
EndIf

;
; MAIN
;

Dim lpaElements(0)
Dim lpaRgbValues(0)

R$ = ProgramParameter(0)
G$ = ProgramParameter(1)
B$ = ProgramParameter(2)

PrintN("R=" + R$ + ", G=" + G$ + ", B=" + B$)

lpaElements(0) = #COLOR_BACKGROUND
lpaRgbValues(0) = RGB(Val(R$),Val(G$),Val(B$))

SetSysColors_(1,@lpaElements(),@lpaRgbValues(0))

CloseConsole()

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 6
; EnableXP