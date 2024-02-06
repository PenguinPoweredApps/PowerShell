# Define the path for the report file
$reportFile = "C:\Scripts\RunReport.txt"

# Create or clear the report file at the start of the script run
if (Test-Path $reportFile) {
    Clear-Content $reportFile
} else {
    New-Item $reportFile -ItemType File
}

# Define the full path of each script you want to run
$scripts = @(
    "C:\Scripts\Script1.ps1",
    "C:\Scripts\Script2.ps1",
    "C:\Scripts\Script3.ps1"
)

# Iterate over each script and execute them one by one
foreach ($script in $scripts) {
    Try {
        Write-Host "Running script: $script"
        & $script
        $result = "SUCCESS"
    } Catch {
        $result = "FAILED - Error: $_"
    } Finally {
        $logEntry = "$(Get-Date) - Script: $script - Result: $result"
        Add-Content $reportFile -Value $logEntry
        Write-Host "Finished running: $script with result $result`n"
    }
}
