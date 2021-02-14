# REMOVE all applications except the Calculator, the Store and the Terminal ...

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = 'SilentlyContinue'

Get-AppxPackage -AllUsers |
  where-object {$_.name -notlike "*calc*"} |
  where-object {$_.name -notlike "*store*"} |
  where-object {$_.name -notlike "*terminal*"} |
  Remove-AppxPackage

Get-AppxProvisionedPackage -online |
  where-object {$_.name -notlike "*calc*"} |
  where-object {$_.name -notlike "*store*"} |
  where-object {$_.name -notlike "*terminal*"} |
  Remove-AppxProvisionedPackage -online

# make sure that the calculator is installed ...
$PROGS=$Env:ProgramFiles
$CALC=Get-AppXpackage -Allusers Microsoft.WindowsCalculator | select -expand PackageFullName
Add-AppXPackage -register "$PROGS\WindowsApps\$CALC\AppXManifest.xml" -DisableDevelopmentMode

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

