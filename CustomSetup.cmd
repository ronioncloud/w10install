@echo off
rem this script puts everything in place ...

set TOOLS=c:\tools
set BATCH=%TOOLS%\scripts\\autoconfig-all.cmd
set LOG=c:\CustomSetup.txt

del /F %LOG% 1>nul 2>nul
if not "%1"=="STDOUT_TO_FILE" %0 STDOUT_TO_FILE %* 1>%LOG% 2>&1
shift /1

echo ####### %0 #######
date /t
time /t
echo.

echo ####### %0 #######
echo.

echo killing ssh agent ...
taskkill /F /IM ssh-agent.exe
taskkill /F /IM ssh.exe

echo restart explorer ...
taskkill /F /IM explorer.exe & start explorer.exe
echo.

echo deleting %TOOLS% ...
rd /S /Q %TOOLS%
echo.

echo starting %BATCH% ...
call %BATCH%
echo.

date /t
time /t
echo ####### %0 #######
echo READY.
echo.

