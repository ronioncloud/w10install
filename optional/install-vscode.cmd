@echo off

set CONFIG=config\install-vscode.txt
set EXE=..\software\vscode-setup.exe
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

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

echo ####### %0 #######
pause

