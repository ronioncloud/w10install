@echo off

set DRIVE=
set /p DRIVE="Drive to use [Z] ? "
IF %DRIVE%.==. set DRIVE=Z

set SERVER=
set /p SERVER="Network Server [nas] ? "
IF %SERVER%.==. set SERVER=nas

set SHARE=
set /p SHARE="Share to mount [DATA] ? "
IF %SHARE%.==. set SHARE=DATA

set USER=
set /p USER="User [guest] ? "
IF %USER%.==. set USER=guest

set PASSWORD=
set /p PASSWORD="Password [guest] ? "
IF %PASSWORD%.==. set PASSWORD=guest

echo.
echo EXECUTING: net use %DRIVE%: \\%SERVER%\%SHARE% /USER:%USER% xxxxxxxx

net use %DRIVE%: /DELETE 1>nul 2>nul
net use %DRIVE%: \\%SERVER%\%SHARE% /USER:%USER% %PASSWORD%

echo READY. 
echo.