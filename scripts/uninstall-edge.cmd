@echo off

set EDGEROOT="C:\Program Files (x86)\Microsoft\Edge"
set EDGEUPDATE="C:\Program Files (x86)\Microsoft\EdgeUpdate"
set INSTALLER=Application\84.0.522.52\Installer

echo ####### %0 #######

@echo on
%EDGEROOT%\%INSTALLER%\setup.exe --uninstall --system-level --verbose-logging --force-uninstall
@echo off
timeout /T 10

echo.
echo cleanup ...
rd /S /Q %EDGEROOT% 2>nul
rd /S /Q %EDGEUPDATE% 2>nul
del /F "%PUBLIC%\Desktop\Microsoft Edge.lnk" 2>nul
del /F "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" 2>nul
del /F "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" 2>nul
del /F "%USERPROFILE%\Desktop\Microsoft Edge.lnk" 2>nul
rd /S /Q "%PROGRAMDATA%\Microsoft\EdgeUpdate" 2>nul

echo.
echo block edge updates ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate" ^
  /v "DoNotUpdateToEdgeWithChromium" /d 1 /t REG_DWORD /f

echo.
echo trying to remove stale entries from software list ...
for %%K in (

  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge"
  "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge"

) do (

  echo %%K
  SetACL.exe -on %%K -ot reg -actn setowner -ownr "n:Administrators" 1>nul 2>nul
  SetACL.exe -on %%K -ot reg -actn ace -ace "n:Administrators;p:full" 1>nul 2>nul
  reg delete %%K /f

)

echo.
echo ####### %0 #######

