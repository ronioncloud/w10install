@echo off

echo ####### %0 #######

echo setting GLOBAL PATH variable ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v PATH ^
  /t REG_EXPAND_SZ ^
  /d "%SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%LOCALAPPDATA%\Microsoft\WindowsApps;%TOOLS%;%TOOLS%\notepad++;%TOOLS%\git\bin;%TOOLS%\git\usr\bin;%ProgramFiles%\PureBasic\Compilers;%ProgramFiles%\Far Manager" ^
  /f

echo ####### %0 #######

