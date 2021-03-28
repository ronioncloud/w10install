; installending.pb
; ------------------------------------------------------------
; shows a status message at the end of the installation 
; LICENSE  : GPL
; AUTHOR   : Michael H.G. Schmidt
; EMAIL    : michael@schmidt2.de
; DATE     : 20210328
; ------------------------------------------------------------
;

MessageRequester("Installation finished.",
                 "Installation of this system has been finished." + Chr(13) +
                 "You can start using the system now!" + Chr(13) + Chr(13) +
                 "Logfile: C:\tools\scripts\autoconfig-all.txt",
                 #PB_MessageRequester_Info)

; IDE Options = PureBasic 5.71 LTS (Windows - x64)
; CursorPosition = 15
; EnableXP