@echo off

set OPT=..\optional
set SOFTWARE=..\software
set MSI=softmaker-setup.msi 
set SETTINGS=..\personal\settings.cmd
set softmaker_license=0
set STARTMENU="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

rem ===================
rem CONFIGFILE CHECK
rem ===================

if NOT EXIST %SETTINGS% (
  echo.
  echo WARNING: %SETTINGS% NOT FOUND
  echo.
) else (
  call %SETTINGS%
)


echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /qb APPLICATIONFOLDER="c:\Program Files\Softmaker Office 2021" ^
  INSTALLTM=1 INSTALLPM=1 INSTALLPR=1 INSTALLTB1=0 INSTALLTB2=0 /l*v c:\temp\softmaker.log
@echo off
del /F c:\temp\softmaker.log
cd %OPT%

echo installing desktop icons ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Softmaker Office 2021\PlanMaker 2021.lnk" ^
  %PUBLIC%\Desktop\PlanMaker.lnk
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Softmaker Office 2021\Presentations 2021.lnk" ^
  %PUBLIC%\Desktop\Presentations.lnk
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Softmaker Office 2021\TextMaker 2021.lnk" ^
  %PUBLIC%\Desktop\Textmaker.lnk

rem refresh desktop (W10 style)
ie4uinit.exe -show

echo cleaning startmenu ...
del /F /Q /A %STARTMENU%\"Softmaker Office 2021\Bitte*.*" 2>nul

echo disabling automatic updates for Softmaker Office 2021 ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\SoftMaker Office 2021" ^
  /v "UpdateCheckEnabled" /d 0 /t REG_DWORD /f

echo disabling WEB help ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\SoftMaker Office 2021" ^
  /v "HelpSoftMaker" /d 0 /t REG_DWORD /f

echo disabling License Management ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\SoftMaker Office 2021" ^
  /v "HelpManage" /d 0 /t REG_DWORD /f

echo disabling the asking for user infos ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\SoftMaker Office 2021" ^
  /v "AskUserInfo" /d 0 /t REG_DWORD /f

echo setting dialog language to US-english ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\SoftMaker Office 2021" ^
  /v "DlgLID" /d 409 /t REG_DWORD /f

echo disabling backups ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\TextMaker 2021" ^
  /v "AutoSave" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\PlanMaker 2021" ^
  /v "AutoSave" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\Presentations 2021" ^
  /v "AutoSave" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\TextMaker 2021" ^
  /v "BackupFilesNumber" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\PlanMaker 2021" ^
  /v "BackupFilesNumber" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\Presentations 2021" ^
  /v "BackupFilesNumber" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\TextMaker 2021" ^
  /v "BackupFilesPath" /d "" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\PlanMaker 2021" ^
  /v "BackupFilesPath" /d "" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\Presentations 2021" ^
  /v "BackupFilesPath" /d "" /t REG_SZ /f

echo setting default formats ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\TextMaker 2021" ^
  /v "DefaultFormat" /d 6 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\PlanMaker 2021" ^
  /v "DefaultFormat" /d 6 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\Presentations 2021" ^
  /v "DefaultFormat" /d 6 /t REG_DWORD /f

echo disabling smart quotes ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\TextMaker 2021" ^
  /v "SmartQuotes" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\PlanMaker 2021" ^
  /v "SmartQuotes" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\Presentations 2021" ^
  /v "SmartQuotes" /d 0 /t REG_DWORD /f

if softmaker_license == 0 (
  echo no softmaker license found!
) else (
  echo adding softmaker license ...
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\SoftMaker\SoftMaker Office 2021" ^
    /v "ProductKey" /d "%softmaker_license%" /t REG_SZ /f
)

echo ####### %0 #######
pause

