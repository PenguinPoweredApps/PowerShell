# Query the System log for the most recent 100 error events
$events = Get-WinEvent -LogName System -MaxEvents 100 | Where-Object { $_.LevelDisplayName -eq "Error" }

# Display the events
foreach ($event in $events) {
    Write-Host "Event ID: $($event.Id), Source: $($event.ProviderName), Message: $($event.Message)"
}
