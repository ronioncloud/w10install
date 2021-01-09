@echo off
set TARGET=D:\
set SOURCES=c:\TEMP\Win10\sources

echo ####### %0 #######

echo using drive %TARGET% ...

if NOT EXIST %TARGET% (
  echo ERROR: drive %TARGET% not found!
  exit /b
)

:ask
  set /p answer="BIOS or UEFI setup (B/U)? "
  if /i "%answer:~,1%" EQU "B" (
    copy /Y autounattend_BIOS.xml %TARGET%\autounattend.xml
    goto cont
  )
  if /i "%answer:~,1%" EQU "U" (
    copy /Y autounattend_UEFI.xml %TARGET%\autounattend.xml
    goto cont
  )
  echo Please type B for BIOS or U for UEFI setup.
  goto ask
:cont

if EXIST %SOURCES%\install_FINAL.esd (
  robocopy %SOURCES% %TARGET%\sources install_FINAL.esd
  del /Q %TARGET%\sources\install.esd 1>nul 2>nul
  move /Y %TARGET%\sources\install_FINAL.esd %TARGET%\sources\install.esd
  move /Y %SOURCES%\install_FINAL.esd %SOURCES%\install_FINAL_copy.esd
)

echo ####### %0 #######
