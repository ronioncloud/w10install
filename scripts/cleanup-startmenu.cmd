@echo off

set STARTMENU=%PROGRAMDATA%\"Microsoft\Windows\Start Menu\Programs"
set STARTMENU_USER=%APPDATA%\"Microsoft\Windows\Start Menu\Programs"

echo ####### %0 #######

echo kill system processes and wait a short time ...
taskkill /f /im StartMenuExperienceHost.exe 2>nul
taskkill /f /im shellexperiencehost.exe 2>nul
taskkill /f /im explorer.exe 2>nul

echo sleep 3 seconds ...
ping 127.0.0.1 -n 3 >nul 2>nul

echo cleanup TempState directories and reset cache ...
del %LOCALAPPDATA%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\TempState\* /q
del %LOCALAPPDATA%\Packages\Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy\TempState\* /q
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\StateStore" /V ResetCache /T REG_DWORD /D 1 /F

echo removing useless entries in startmenu ...
rd /S /Q %STARTMENU%\"Go Programming Language" 2>nul
rd /S /Q %STARTMENU%\Maintenance 2>nul

rem VLC ...
move /Y %STARTMENU%\"VideoLan\VLC media player.lnk" %STARTMENU% 2>nul
rd /S /Q %STARTMENU%\VideoLan 2>nul

rem ADK ...
move /Y %STARTMENU%\"Windows Kits\Windows ADK\Windows System Image Manager.lnk" ^
  %STARTMENU%\"System Tools\Image Manager.lnk" 2>nul
rd /S /Q %STARTMENU%\"Windows Kits" 2>nul

rem Windows stuff (Character map)...
move /Y %STARTMENU%\"Accessories\System Tools\Character*.*" ^
  %STARTMENU%\"Accessories" 2>nul
rd /S /Q %STARTMENU%\"Accessories\System Tools" 2>nul

echo sleep 3 seconds and start explorer ...
ping 127.0.0.1 -n 3 >nul 2>nul
start explorer.exe

echo ####### %0 #######

