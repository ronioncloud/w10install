@echo off

set TOOLS=c:\tools
set SOFTWARE=..\software
set T=c:\TEMP
set WINSCPINI=..\personal\winscp.ini

echo ####### %0 #######

rem ###################################
rem MAIN loop ( unzip archives ) ...
rem ###################################

for %%A in (

  bginfo
  curl
  imapcopy
  installwimtweak
  offlineregistryfinder
  rclone
  regscanner
  restic
  setacl
  showkeyplus
  vim
  vivetool
  winscp
  wub

) do (
  
  if NOT EXIST %SOFTWARE%\%%A.zip (
    echo WARNING: %SOFTWARE%\%%A.zip not found!
  ) else (
    echo unpacking %%A.zip ...
    %TOOLS%\7z e -y -aoa -o%T%\%%A %SOFTWARE%\%%A.zip
  )

)

echo.
echo ###################################
echo move files to tools folder
echo ###################################
echo.

echo BGinfo ...
mkdir %TOOLS%\bginfo 2>nul
move /Y %T%\bginfo\Bginfo64.exe %TOOLS%\bginfo
copy /Y config\config.bgi %TOOLS%\bginfo
rd /S /Q %T%\bginfo 2>nul
echo.

echo CURL
move /Y %T%\curl\curl.exe %TOOLS%
move /Y %T%\curl\libcurl*.dll %TOOLS%
move /Y %T%\curl\curl-ca-bundle.crt %TOOLS%
rd /S /Q %T%\curl
echo.

echo ImapCopy
mkdir %TOOLS%\imapcopy 2>nul
move /Y %T%\imapcopy\* %TOOLS%\imapcopy
rd /S /Q %T%\imapcopy
echo.

echo InstallWimTweak
move /Y %T%\installwimtweak\* %TOOLS%
rd /S /Q %T%\installwimtweak
echo.

echo OfflineRegistryFinder
move /Y %T%\offlineregistryfinder\*.exe %TOOLS%
rd /S /Q %T%\offlineregistryfinder
copy /Y config\OfflineRegistryFinder.cfg %TOOLS%
echo.

echo RClone
move /Y %T%\rclone\rclone.exe %TOOLS%
rd /S /Q %T%\rclone
echo.

echo RegScanner
move /Y %T%\regscanner\*.exe %TOOLS%
rd /S /Q %T%\regscanner
echo.

echo Restic
move /Y %T%\restic\*.exe %TOOLS%\restic.exe
rd /S /Q %T%\restic
echo.

echo Setacl
move /Y %T%\setacl\*.exe %TOOLS%\setacl.exe
rd /S /Q %T%\setacl
echo.

echo ShowKeyPlus
move /Y %T%\showkeyplus\*.exe %TOOLS%
rd /S /Q %T%\showkeyplus
echo.

echo VIM
move /Y %T%\vim\vim.exe %TOOLS%
rd /S /Q %T%\vim
echo.

echo ViveTool
move /Y %T%\vivetool\vivetool.exe %TOOLS%
move /Y %T%\vivetool\*.dll %TOOLS%
rd /S /Q %T%\vivetool
echo.

echo WinSCP
move /Y %T%\winscp\*.exe %TOOLS%
rd /S /Q %T%\winscp
if EXIST %WINSCPINI% (
  echo copying WinSCP ini file ...
  copy /Y %WINSCPINI% %TOOLS%
)
echo.

echo WUB - Windows update blocker
move /Y %T%\wub\wub_x64.exe %TOOLS%\wub.exe
rd /S /Q %T%\wub
echo.

echo ####### %0 #######
