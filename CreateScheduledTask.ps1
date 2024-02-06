$action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument "C:\Scripts\YourScript.ps1"

$trigger = New-ScheduledTaskTrigger -AtStartup
# $trigger = New-ScheduledTaskTrigger -AtLogOn
# $trigger = New-ScheduledTaskTrigger -At 3pm -Daily

# Define the principal with highest privileges
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -TaskName "MyTask"
