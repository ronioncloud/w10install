@echo off

echo ####### %0 #######

echo.
echo trying to remove stale entries from program list ...
for %%K in (

  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge"
  "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge"

) do (

  echo %%K
  setacl -on %%K -ot reg -actn setowner -ownr "n:Administrators" 1>nul 2>nul
  setacl -on %%K -ot reg -actn ace -ace "n:Administrators;p:full" 1>nul 2>nul
  reg delete %%K /f

)

echo ####### %0 #######

