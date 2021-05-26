
$taskName = “The task name”;
$task = Get-ScheduledTask | Where-Object { $_.TaskName -eq $taskName } | Select-Object -First 1
if ($null -ne $task) {
  $task | Unregister-ScheduledTask -Confirm:$false
  Write-Host “Task $taskName was removed” -ForegroundColor Yellow
}

if (Get-ScheduledTask -TaskName $TaskName){Unregister-ScheduledTask -TaskName $TaskName -Confirm $false}
