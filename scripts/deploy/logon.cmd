@echo off

set TOOLS=c:\tools

echo ####### %0 #######

echo show workplace icon ...
echo add This PC icon for current user on desktop Windows 10 ...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" ^
 /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" ^
 /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f

echo add userhome icon on windows 10 desktop for current user
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" ^
 /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" ^
 /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0 /f

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo remove wallpaper ...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d " " /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo set desktop colour ...
%TOOLS%\setbgcol

echo starting BGInfo ...
%TOOLS%\bginfo\bginfo64.exe %TOOLS%\bginfo\config.bgi /NOLICPROMPT /silent /timer:0

echo start workstation service ...
net start workstation 1>nul 2>nul
net config workstation

echo ####### %0 #######

