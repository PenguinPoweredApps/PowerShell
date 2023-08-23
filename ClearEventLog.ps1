# Run PowerShell as administrator

# Get the list of all event logs
$eventLogs = Get-EventLog -List

foreach ($log in $eventLogs) {
    # Clear each event log
    Write-Host "Clearing $($log.LogDisplayName)..."
    try {
        Clear-EventLog -LogName $log.Log
    } catch {
        Write-Warning "Failed to clear $($log.LogDisplayName)."
    }
}

Write-Host "All logs cleared!"
