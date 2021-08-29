@echo off
set TOOLS=c:\tools

set newPATH=%SYSTEMROOT%;%SYSTEMROOT%\system32;^
%SYSTEMROOT%\system32\wbem;^
%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;^
%LOCALAPPDATA%\Microsoft\WindowsApps;^
%TOOLS%;^
%TOOLS%\android;^
%TOOLS%\git\bin;^
%TOOLS%\git\cmd;^
%TOOLS%\git\usr\bin;^
%TOOLS%\git\mingw64\bin;^
%ProgramFiles%\Go\bin;^
%SystemDrive%\Python27;^
%ProgramFiles%\Python39;^
%ProgramFiles%\Java\bin;^
%ProgramFiles%\PureBasic\Compilers;^
%ProgramFiles%\Microsoft VS Code\bin

echo ####### %0 #######

echo setting GLOBAL PATH variable ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v PATH /t REG_EXPAND_SZ /d "%newPATH%" /f

setx PATH "%newPATH%"
set PATH=%newPATH%

echo ####### %0 #######

