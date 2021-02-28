@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set T=c:\TEMP
set MSI=vnc-setup.msi

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

echo unpacking vnc (tvnviewer) ...
@echo on
cd %SOFTWARE%
msiexec /a %MSI% TARGETDIR=%T% /qn
cd %SCRIPTS%
@echo off

echo moving vnc binary to tools folder ...
move /Y %T%\PFiles\TightVNC\tvnviewer.exe %TOOLS%
del /S /Q /A %T%\%MSI% 1>nul 2>nul
rd /S /Q %T%\PFiles

rem create symbolic link ...
mklink %TOOLS%\vnc.exe %TOOLS%\tvnviewer.exe 2>nul

echo ####### %0 #######
