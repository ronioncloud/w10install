# disable FUCKING windows bell in cmd.exe ...

write-host '#######',(split-path $PSCommandPath -Leaf),'#######'
Write-Host "Disabling all windows sounds ..." -foregroundcolor red

New-ItemProperty -Path HKCU:\AppEvents\Schemes -Name "(Default)" -Value ".None" -Force | Out-Null

Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps" |
  Get-ChildItem | Get-ChildItem |
  Where-Object {$_.PSChildName -eq ".Current"} |
  Set-ItemProperty -Name "(Default)" -Value ""

Write-Host "READY. Sound scheme was set to NONE." -foregroundcolor green
write-host '#######',(split-path $PSCommandPath -Leaf),'#######'

