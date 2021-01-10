@echo off
set TARGET=tweaks

echo ####### %0 #######

IF EXIST "%TARGET%\*.reg" (
  FOR /F "tokens=*" %%A IN ('DIR /B  "%TARGET%\*.reg"') DO (
    echo "%TARGET%\%%A"
    regedit /S "%TARGET%\%%A"
  )
)

echo ####### %0 #######

