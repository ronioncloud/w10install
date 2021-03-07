@echo off

set TARGET="%ALLUSERSPROFILE%\Microsoft\User Account Pictures"

rem empty logo (disables all logos on logon screen)
rem set LOGO=config\user-empty.png

rem windows logo taken from: http://pngimg.com/image/23601
set LOGO=config\windows-logo.png

echo ####### %0 #######

echo disabling account pictures on logon screen ...
for %%F in (

  user-192
  user
  guest

) do (

  move /Y %TARGET%\%%F.png %TARGET%\%%F.bak
  copy /Y %LOGO% %TARGET%\%%F.png

)

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" ^
  /v UseDefaultTile /t REG_DWORD /d 1 /f

echo ####### %0 #######

