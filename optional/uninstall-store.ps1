# REMOVE the Store ...

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = 'SilentlyContinue'

Get-AppxPackage -AllUsers |
  where-object {$_.name -like "*store*"} |
  Remove-AppxPackage

Get-AppxProvisionedPackage -online |
  where-object {$_.displayname -like "*store*"} |
  Remove-AppxProvisionedPackage -online

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

