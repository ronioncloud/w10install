@echo off

echo ####### %0 #######

echo kill system processes and wait a short time ...
taskkill /f /im StartMenuExperienceHost.exe 2>nul
taskkill /f /im shellexperiencehost.exe 2>nul
taskkill /f /im explorer.exe 2>nul

ping 127.0.0.1 -n 3 >nul 2>nul

echo cleanup TempState directories and reset cache ...
del %LOCALAPPDATA%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\TempState\* /q
del %LOCALAPPDATA%\Packages\Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy\TempState\* /q
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\StateStore" /V ResetCache /T REG_DWORD /D 1 /F

echo start explorer again ...
ping 127.0.0.1 -n 3 >nul 2>nul
start explorer.exe

echo ####### %0 #######

