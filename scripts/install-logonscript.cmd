@echo off
set TOOLS=c:\tools
set TARGET="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

echo ####### %0 #######

rem cleanup ...
del /Q /F %TARGET%\logon* 1>nul 2>nul
del /Q /F %TOOLS%\logon.cmd 1>nul 2>nul

echo creating link for logon script...
mklink %TARGET%\logon.cmd %TOOLS%\logon.cmd

echo create link on desktop...
del /Q /F "%USERPROFILE%\Desktop\Autostart*" 1>nul 2>nul
rmdir /Q "%USERPROFILE%\Desktop\Autostart" 1>nul 2>nul
mklink /D "%USERPROFILE%\Desktop\Autostart" %TARGET%

echo execute logon script...
call %TARGET%\logon.cmd

echo ####### %0 #######

