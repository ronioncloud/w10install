@echo off

set TOOLS=c:\tools
set SOFTWARE=..\software
set PERSONAL=..\personal

echo ####### %0 #######

for %%E in (

  bfg.jar  
  snapshot64.exe
  putty.exe
  puttygen.exe
  rufus.exe
  Windows-ISO-Downloader.exe

) do (
  
  if NOT EXIST %SOFTWARE%\%%E (
    echo WARNING: %SOFTWARE%\%%E not found!
  ) else (
    echo copying %%E to %TOOLS% ...
    copy /Y %SOFTWARE%\%%E %TOOLS%
  )

)

rem copy licensed snapshot64 executable
rem (license is written to the binary)
if EXIST %PERSONAL%\snapshot64.exe (
  echo installing licensed version of snapshot64 ...
  copy /Y %PERSONAL%\snapshot64.exe %TOOLS%
)

echo ####### %0 #######
