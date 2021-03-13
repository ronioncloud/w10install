@echo off

set TOOLS=c:\tools
set SOFTWARE=..\software

echo ####### %0 #######

for %%E in (

  bfg.jar  
  snapshot64.exe
  puttygen.exe

) do (
  
  if NOT EXIST %SOFTWARE%\%%E (
    echo WARNING: %SOFTWARE%\%%E not found!
  ) else (
    echo copying %%E to %TOOLS% ...
    copy /Y %SOFTWARE%\%%E %TOOLS%
  )

)

echo ####### %0 #######
