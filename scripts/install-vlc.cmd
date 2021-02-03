@echo off

set EXE=..\software\vlc-3.0.12-win64.exe

echo ####### %0 #######

echo installing VLC player ...
%EXE% /L=1033 /S

echo renaming Desktop shortcut ...
move /Y "%PUBLIC%\Desktop\VLC media player.lnk" ^
  "%PUBLIC%\Desktop\VLC.lnk"

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo ####### %0 #######

