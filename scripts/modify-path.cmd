@echo off

echo ####### %0 #######

echo setting GLOBAL PATH variable ...

rem first the standard pathes (via registry) ...
reg add ^
  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /d ^
  /d "%SYSTEMROOT%;%SYSTEMROOT%\system32;%SYSTEMROOT%\system32\wbem" ^
  /v PATH /t REG_EXPAND_SZ /f

rem now add powershell and local apps ...
setx PATH "%PATH%;%SYSTEMROOT%\system32\WindowsPowerShell\v1.0" /M
setx PATH "%PATH%;%LOCALAPPDATA%\Microsoft\WindowsApps" /M

rem TOOLS path ...
setx PATH "%PATH%;%TOOLS%" /M

rem other stuff (that will not be set in other scripts) ...
setx PATH "%PATH%;%TOOLS%\notepad++" /M

echo ####### %0 #######

