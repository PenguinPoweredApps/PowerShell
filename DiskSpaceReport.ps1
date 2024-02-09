# Function to get disk space information
function Get-DiskSpaceInfo {
    # Get logical disk information
    $disks = Get-WmiObject Win32_LogicalDisk -Filter "DriveType = 3" | Select-Object DeviceID, VolumeName, @{Name='Size(GB)';Expression={$_.Size / 1GB -as [int]}}, @{Name='FreeSpace(GB)';Expression={$_.FreeSpace / 1GB -as [int]}}
    
    return $disks
}

# Function to write disk space information to CSV
function Export-DiskSpaceReport {
    param (
        [string]$Path
    )

    # Get disk space information
    $diskInfo = Get-DiskSpaceInfo

    # Export to CSV
    $diskInfo | Export-Csv -Path $Path -NoTypeInformation
}

# Main script
$reportFilePath = "C:\Scripts\Logs\DiskSpaceReport.csv"
Export-DiskSpaceReport -Path $reportFilePath
Write-Host "Disk space report has been saved to $reportFilePath"
