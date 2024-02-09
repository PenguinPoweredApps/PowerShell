# Define the username for which you want to retrieve logon/logoff history
$username = "Simon Wollerton"

# Get the logon/logoff events for the specified user
$logEvents = Get-WinEvent -FilterHashtable @{
    LogName = "Security"
    ID = @(4624, 4634)
    StartTime = (Get-Date).AddDays(-30)  # You can adjust the time frame as needed
} | Where-Object { $_.Properties[5].Value -eq $username }

# Create a new array to store logon/logoff events
$logArray = @()

# Iterate through each event and extract relevant information
foreach ($event in $logEvents) {
    $logArray += [PSCustomObject]@{
        Time = $event.TimeCreated
        EventID = $event.Id
        EventType = if ($event.Id -eq 4624) { "Logon" } else { "Logoff" }
        UserName = $event.Properties[5].Value
        IPAddress = $event.Properties[18].Value
    }
}

# Sort the log events by time
$logArray = $logArray | Sort-Object Time

# Specify the path to the file where you want to save the log
$outputFile = "C:\Scripts\Logs\LogonLogoffHistory_$username.csv"

# Export the log events to a CSV file
$logArray | Export-Csv -Path $outputFile -NoTypeInformation

Write-Host "Logon/Logoff history for user '$username' has been saved to $outputFile"
