;
; change Windows Background Colour
;

Dim lpaElements(0)
Dim lpaRgbValues(0)

lpaElements(0) = #COLOR_BACKGROUND
lpaRgbValues(0) = RGB(3,131,135)

SetSysColors_(1,@lpaElements(),@lpaRgbValues(0))

; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 11
; EnableXP