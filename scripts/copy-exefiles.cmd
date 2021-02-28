@echo off

set TOOLS=c:\tools
set SOFTWARE=..\software

echo ####### %0 #######

for %%E in (
  
  snapshot64
  puttygen

) do (
  
  if NOT EXIST %SOFTWARE%\%%E.exe (
    echo WARNING: %SOFTWARE%\%%E.exe not found!
  ) else (
    echo copy %%E.exe to %TOOLS% ...
    copy /Y %SOFTWARE%\%%E.exe %TOOLS%
  )

)

echo ####### %0 #######
