@echo off

set x86=%SYSTEMROOT%\System32\OneDriveSetup.exe
set x64=%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe

echo ####### %0 #######

echo KILLING OneDrive ...
taskkill /f /im OneDrive.exe > NUL 2>&1

echo sleep 5 seconds ...
ping 127.0.0.1 -n 5 > NUL 2>&1

echo UNINSTALLING OneDrive ...
if exist %x64% (
  %x64% /uninstall 2>nul
) else (
  %x86% /uninstall 2>nul
)

echo sleep 5 seconds ...
ping 127.0.0.1 -n 5 > NUL 2>&1

echo CLEANUP OneDrive ...
rd "%USERPROFILE%\OneDrive" /Q /S > NUL 2>&1
rd "C:\OneDriveTemp" /Q /S > NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S > NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S > NUL 2>&1

echo remove OneDrive from explorer ...
reg DELETE "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
reg DELETE "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
reg DELETE "HKEY_CURRENT_USER\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f > NUL 2>&1
reg DELETE "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f > NUL 2>&1

echo ####### %0 #######

