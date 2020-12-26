# SetupComplete.ps1 ...

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

echo "[ place your code here ] ..."

$progressPreference = 'SilentlyContinue'
Get-AppxPackage -AllUsers |
  where-object {$_.name -notlike "*store*"} |
  Remove-AppxPackage
Get-AppxProvisionedPackage -online |
  where-object {$_.name -notlike "*store*"} |
  Remove-AppxProvisionedPackage -online

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

