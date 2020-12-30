@echo off
set TARGET=D:
set TESTSCRIPT=1st-logon.cmd
set SOURCES=c:\TEMP\Win10\sources

echo ####### %0 #######

if EXIST %SOURCES%\install_FINAL.esd (
  robocopy %SOURCES% %TARGET%\sources install_FINAL.esd
  del /Q %TARGET%\sources\install.esd 1>nul 2>nul
  move %TARGET%\sources\install_FINAL.esd %TARGET%\sources\install.esd
  move %SOURCES%\install_FINAL.esd %SOURCES%\install_FINAL_copy.esd
)

copy /Y autounattend.xml %TARGET%\
copy /Y 1st-logon.cmd %TARGET%\
copy /Y ToolsDownload.ftp %TARGET%\
copy /Y SetupComplete.cmd %TARGET%\
copy /Y SetupComplete.ps1 %TARGET%\

echo ####### %0 #######

