$action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument "C:\Scripts\YourScript.ps1"

$trigger = New-ScheduledTaskTrigger -AtStartup
# $trigger = New-ScheduledTaskTrigger -AtLogOn
# $trigger = New-ScheduledTaskTrigger -At 3pm -Daily

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MyTask"
