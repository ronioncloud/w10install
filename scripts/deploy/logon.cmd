@echo off

set TOOLS=c:\tools

echo ####### %0 #######

echo remove wallpaper...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d " " /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo set desktop colour...
%TOOLS%\setbgcol

echo starting BGInfo ....
%TOOLS%\bginfo\bginfo64.exe %TOOLS%\bginfo\config.bgi /NOLICPROMPT /silent /timer:0

echo ####### %0 #######

