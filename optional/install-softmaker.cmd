@echo off

set SCRIPTS=..\scripts
set SOFTWARE=..\software
set MSI=softmaker-setup.msi 

if NOT EXIST %SOFTWARE%\%MSI% (
  echo ERROR: %SOFTWARE%\%MSI% not found!
  exit /b
)

echo ####### %0 #######

cd %SOFTWARE%
@echo on
msiexec /i %MSI% /qb APPLICATIONFOLDER="c:\Program Files\Softmaker Office 2021" ^
  INSTALLTM=1 INSTALLPM=1 INSTALLPR=1 INSTALLTB1=0 INSTALLTB2=0 /l*v c:\temp\softmaker.log
@echo off
del /F c:\temp\softmaker.log
cd %SCRIPTS%

echo installing desktop icons ...
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Softmaker Office 2021\PlanMaker 2021.lnk" ^
  %PUBLIC%\Desktop\PlanMaker.lnk
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Softmaker Office 2021\Presentations 2021.lnk" ^
  %PUBLIC%\Desktop\Presentations.lnk
copy /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Softmaker Office 2021\TextMaker 2021.lnk" ^
  %PUBLIC%\Desktop\Textmaker.lnk

echo ####### %0 #######
pause

