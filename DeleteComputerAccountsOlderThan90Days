# Ensure the Active Directory module is loaded
Import-Module ActiveDirectory

# Define the number of days since the last logon to consider the account inactive
$daysInactive = 90

# Determine the date threshold
$dateCutoff = (Get-Date).AddDays(-$daysInactive)

# Retrieve all computer accounts that have been inactive for more than the specified days
$inactiveComputers = Get-ADComputer -Filter { LastLogonDate -lt $dateCutoff } -Properties LastLogonDate

# Confirm before deleting
foreach ($computer in $inactiveComputers) {
    $confirm = Read-Host -Prompt "Do you want to delete $($computer.Name) last logged on $($computer.LastLogonDate)? (Y/N)"
    
    if ($confirm -eq "Y") {
        # Delete the computer account
        $computer | Remove-ADComputer -Confirm:$false
        Write-Output "Deleted $($computer.Name)"
    }
}
