# Function to get user account information
function Get-UserAccountInfo {
    # Get all local user accounts
    $userAccounts = Get-WmiObject Win32_UserAccount | Where-Object { $_.LocalAccount -eq $true } | Select-Object Name, FullName, Description, Disabled

    # Get groups for each user
    foreach ($user in $userAccounts) {
        $groups = Get-LocalGroupMembership -UserName $user.Name
        $user | Add-Member -MemberType NoteProperty -Name Groups -Value ($groups -join ', ')
    }

    return $userAccounts
}

# Function to get groups for a user
function Get-LocalGroupMembership {
    param (
        [string]$UserName
    )

    # Execute net localgroup command to get group memberships for the user
    $groups = & net localgroup | Where-Object { $_ -match ":$UserName$" } | ForEach-Object { $_ -replace '\s+', ',' } | ForEach-Object { ($_ -split ',')[0] }

    return $groups
}

# Function to write user account information to CSV
function Export-UserAccountReport {
    param (
        [string]$Path
    )

    # Get user account information
    $userAccountInfo = Get-UserAccountInfo

    # Export to CSV
    $userAccountInfo | Export-Csv -Path $Path -NoTypeInformation
}

# Main script
$reportFilePath = "C:\Scripts\Logs\UserAccountReport.csv"
Export-UserAccountReport -Path $reportFilePath
Write-Host "User account report has been saved to $reportFilePath"
