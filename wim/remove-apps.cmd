@echo off
set IMAGE=c:\TEMP\IMAGE

echo exporting APPS list BEFORE doing any changes ...
dism /Image:%IMAGE% /Get-ProvisionedAppxPackages 1>Apps-BEFORE.txt

FOR /F %%P in (apps-to-remove.csv) do (

  echo removing APPX package [ Microsoft.%%P ]
  dism /Image:%IMAGE% /Remove-ProvisionedAppxPackage /PackageName:Microsoft.%%P

)

echo exporting remaining APPS list ...
dism /Image:%IMAGE% /Get-ProvisionedAppxPackages 1>Apps-AFTER.txt

rem showing packages ...
dir Apps*.txt

