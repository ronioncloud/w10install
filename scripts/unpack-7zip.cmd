@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set T=c:\TEMP
set MSI=7z-setup.msi

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

echo unpacking 7-zip ...
cd %SOFTWARE%
@echo on
msiexec /a %MSI% TARGETDIR=%T% /qn
@echo off
cd %SCRIPTS%

echo moving 7-zip binaries to tools folder ...
move /Y %T%\Files\7-Zip\7z.exe %TOOLS%
move /Y %T%\Files\7-zip\7z.dll %TOOLS%
move /Y %T%\Files\7-zip\7zCon.sfx %TOOLS%
del /S /Q /A %T%\%MSI% 1>nul 2>nul
rd /S /Q %T%\Files

echo ####### %0 #######
