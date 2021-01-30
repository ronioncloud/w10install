# REMOVE all applications except the Store and the Calculator ...

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

$ErrorActionPreference = 'SilentlyContinue'

Get-AppxPackage -AllUsers |
  where-object {$_.name -notlike @("*store*","*calc*")} |
  Remove-AppxPackage
Get-AppxProvisionedPackage -online |
  where-object {$_.name -notlike @("*store*","*calc*")} |
  Remove-AppxProvisionedPackage -online

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

