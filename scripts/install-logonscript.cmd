@echo off
set TOOLS=c:\tools
set TARGET="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

echo ####### %0 #######

echo cleanup ...
del /Q /F %TARGET%\logon* 1>nul 2>nul
rd /S /Q %PUBLIC%\Desktop\Startup 1>nul 2>nul

echo creating link for logon script ...
mklink %TARGET%\logon.cmd %TOOLS%\logon.cmd

echo ####### %0 #######

