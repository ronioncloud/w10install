@echo off

set SOURCE=deploy/logon.cmd
set TARGET="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

echo ####### %0 #######

echo create link for logon script...
del /Q /F %TARGET%\logon* 1>nul 2>nul
mklink %TARGET%\logon.cmd %SOURCE%

echo create link on desktop...
del /Q /F "%USERPROFILE%\Desktop\Autostart*" 1>nul 2>nul
rmdir /Q "%USERPROFILE%\Desktop\Autostart" 1>nul 2>nul
mklink /D "%USERPROFILE%\Desktop\Autostart" %TARGET%

echo execute logon script...
call %TARGET%\logon.cmd

echo ####### %0 #######

