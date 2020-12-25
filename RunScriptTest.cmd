@echo off
set TARGET=D:
set TESTSCRIPT=1st-logon.cmd

echo ####### %0 #######

copy /Y autounattend.xml %TARGET%\
copy /Y 1st-logon.cmd %TARGET%\
copy /Y ToolsDownload.ftp %TARGET%\
copy /Y SetupComplete.cmd %TARGET%\
copy /Y SetupComplete.ps1 %TARGET%\

echo ####### %0 #######

rem call %TARGET%\%TESTSCRIPT%

