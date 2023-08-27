$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "YourScript.ps1"
$trigger = New-ScheduledTaskTrigger -AtStartup
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MyTask"
