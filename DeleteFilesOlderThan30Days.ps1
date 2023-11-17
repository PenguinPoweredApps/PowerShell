# Set the path to the directory where you want to delete old files
$directoryPath = "C:\Path\To\Your\Directory"

# Set the number of days for the threshold
$thresholdDays = 30

# Get the current date
$currentDate = Get-Date

# Calculate the date threshold for deletion
$thresholdDate = $currentDate.AddDays(-$thresholdDays)

# Get files in the specified directory older than the threshold date
$oldFiles = Get-ChildItem -Path $directoryPath | Where-Object { $_.LastWriteTime -lt $thresholdDate }

# Iterate through each old file
foreach ($file in $oldFiles) {
    $fileAge = $currentDate - $file.LastWriteTime
    $confirmationMessage = "File: $($file.FullName)`nAge: $($fileAge.Days) days`nDo you want to delete this file? (Y/N)"

    # Prompt the user for confirmation
    $userInput = Read-Host -Prompt $confirmationMessage

    if ($userInput -eq 'Y' -or $userInput -eq 'y') {
        Write-Host "Deleting $($file.FullName)"
        Remove-Item $file.FullName -Force
    } else {
        Write-Host "Skipped deletion of $($file.FullName)"
    }
}

Write-Host "Deletion process complete."
