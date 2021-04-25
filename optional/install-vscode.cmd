@echo off

set CONFIG=config\install-vscode.txt
set EXE=..\software\vscode-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

rem update.code.visualstudio.com
set VSCODEUPDATEIP=51.144.164.215

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo killing VisualStudio code processes...
taskkill /F /IM Code.exe 2>nul

echo cleanup ...
del /F "%PUBLIC%\Desktop\VScode.lnk" 2>nul

echo installing Visual Studio CODE ...
start /wait %EXE% /LOADINF=%CONFIG% /NORESTART /NOCANCEL /SILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS

echo installing Desktop shortcut ...
copy /Y %STARTMENU%\"Visual Studio Code\Visual*.lnk" "%PUBLIC%\Desktop"
move /Y "%PUBLIC%\Desktop\Visual*.lnk" "%PUBLIC%\Desktop\VScode.lnk"

rem refresh desktop (W10 style)
ie4uinit.exe -show

rem NO updates here! FUCK YOU!
echo disabling automatic updates via W10 firewall ...
netsh advfirewall firewall delete rule name="block_vscode_updates" 2>nul
netsh advfirewall firewall add rule name="block_vscode_updates" ^
  dir=out action=block protocol=tcp localip=any remoteip=%VSCODEUPDATEIP% ^
  remoteport=80,443 program="%ProgramFiles%\Microsoft VS Code\Code.exe"

echo ####### %0 #######
pause

