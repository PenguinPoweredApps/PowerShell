# Function to get installed software information
function Get-InstalledSoftwareInfo {
    # Get 32-bit and 64-bit registry paths
    $32BitPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
    $64BitPath = "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"

    # Get software information from registry
    $software32 = Get-ItemProperty -Path $32BitPath | Select-Object DisplayName, Publisher, InstallDate, DisplayVersion
    $software64 = Get-ItemProperty -Path $64BitPath | Select-Object DisplayName, Publisher, InstallDate, DisplayVersion

    # Combine 32-bit and 64-bit software lists
    $installedSoftware = $software32 + $software64

    return $installedSoftware
}

# Function to write installed software information to CSV
function Export-InstalledSoftwareReport {
    param (
        [string]$Path
    )

    # Get installed software information
    $softwareInfo = Get-InstalledSoftwareInfo

    # Export to CSV
    $softwareInfo | Export-Csv -Path $Path -NoTypeInformation
}

# Main script
$reportFilePath = "C:\Scripts\Logs\InstalledSoftwareReport.csv"
Export-InstalledSoftwareReport -Path $reportFilePath
Write-Host "Installed software report has been saved to $reportFilePath"
