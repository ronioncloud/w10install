@echo off

echo ####### %0 #######

rem kill system processes and wait a short time ...
taskkill /f /im StartMenuExperienceHost.exe
taskkill /f /im shellexperiencehost.exe
taskkill /f /im explorer.exe

ping 127.0.0.1 -n 3 >nul 2>nul

rem kill dead entries in start menu and kill old live tiles ...
@echo on
del %LOCALAPPDATA%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\TempState\* /q
del %LOCALAPPDATA%\Packages\Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy\TempState\* /q
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\StateStore" /V ResetCache /T REG_DWORD /D 1 /F
@echo off

rem start explorer again ...
ping 127.0.0.1 -n 1 >nul 2>nul
start explorer

echo ####### %0 #######

