@echo off

set CONFIG=config\install-java.txt
set EXE=..\software\java-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing JAVA ...
start /wait %EXE% INSTALL_SILENT=Enable AUTO_UPDATE=0 NOSTARTMENU=1 REBOOT=0 ^
  INSTALLDIR="%ProgramFiles%\java"

echo ####### %0 #######
pause

