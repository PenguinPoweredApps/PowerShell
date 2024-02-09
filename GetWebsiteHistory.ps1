
# Specify the path to Chrome's history database
$historyPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History"

# Check if the history database file exists
if (-not (Test-Path $historyPath)) {
    Write-Host "Chrome history database not found at $historyPath"
    exit
}

# Specify the query to retrieve browsing history from Chrome's history database
$query = "SELECT * FROM 'urls'"

# Access Chrome's history database
try {
    $connection = New-Object -ComObject ADODB.Connection
    $connection.Open("Provider=Microsoft.SQLite.EF6;Data Source=$historyPath")
} catch {
    Write-Host "Failed to open Chrome history database: $_"
    exit
}

# Execute the query
try {
    $recordset = $connection.Execute($query)
} catch {
    Write-Host "Failed to execute query on Chrome history database: $_"
    $connection.Close()
    exit
}

# Loop through the recordset and write URLs to a report file
$reportPath = "C:\Scripts\Logs\ChromeBrowsingHistoryReport.txt"
$reportFile = New-Item -Path $reportPath -ItemType File -Force

# Write header to the report file
Add-Content -Path $reportFile -Value "Website Visited`n"

# Loop through the recordset and write URLs to the report file
while (!$recordset.EOF) {
    $website = $recordset.Fields.Item("url").Value
    Add-Content -Path $reportFile -Value $website
    $recordset.MoveNext()
}

# Close the connection to the database
$connection.Close()

Write-Host "Chrome browsing history report generated successfully. Path: $reportPath"
