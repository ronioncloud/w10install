@echo off

set DESKTOP="%PUBLIC%\Desktop"
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

echo ####### %0 #######

echo copying desktop shortcuts ...
xcopy /CDI /HERBY desktop %DESKTOP%

echo copying startmenu shortcuts ...
xcopy /CDI /HERBY startmenu %STARTMENU%

echo ####### %0 #######

