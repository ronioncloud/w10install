@echo off

echo ####### %0 #######

echo setting PATH variable (for all users) ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /d "%SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0;%LOCALAPPDATA%\Microsoft\WindowsApps;%TOOLS%;%TOOLS%\git\bin;%TOOLS%\git\usr\bin;%TOOLS%\notepad++;%ProgramFiles%\PureBasic\Compilers" ^
  /v PATH /t REG_EXPAND_SZ /f

echo ####### %0 #######

