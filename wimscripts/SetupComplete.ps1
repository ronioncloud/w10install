rem REMOVE all applications except the Store...

Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*store*"} | Remove-AppxPackage
Get-AppxProvisionedPackage -online | where-object {$_.name -notlike "*store*"} | Remove-AppxProvisionedPackage -online

