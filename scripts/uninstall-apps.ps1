# REMOVE all applications except the Storem, Calculator and Terminal ...

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = 'SilentlyContinue'

Get-AppxPackage -AllUsers |
  where-object {$_.name -notlike "*store*"} |
  where-object {$_.name -notlike "*calc*"} |
  where-object {$_.name -notlike "*terminal*"} |
  Remove-AppxPackage

Get-AppxProvisionedPackage -online |
  where-object {$_.name -notlike "*store*"} |
  where-object {$_.name -notlike "*calc*"} |
  where-object {$_.name -notlike "*terminal*"} |
  Remove-AppxProvisionedPackage -online

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

