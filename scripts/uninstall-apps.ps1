# REMOVE all applications except the Store ...

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = "SilentlyContinue"

# $progressPreference = 'SilentlyContinue'
Get-AppxPackage -AllUsers |
  where-object {$_.name -notlike "*store*"} |
  Remove-AppxPackage
Get-AppxProvisionedPackage -online |
  where-object {$_.name -notlike "*store*"} |
  Remove-AppxProvisionedPackage -online

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

