# Import the Active Directory module
Import-Module ActiveDirectory

# Get the date for 90 days ago
$90DaysAgo = (Get-Date).AddDays(-90)

# Define a list of system accounts that shouldn't be deleted
$systemAccounts = @("Administrator", "krbtgt", "Guest") # Add more system account names if needed

# Get all AD user accounts that haven't been used in the last 90 days
Get-ADUser -Filter { LastLogonDate -lt $90DaysAgo -and enabled -eq $true } -Properties LastLogonDate | Where-Object {
    $systemAccounts -notcontains $_.SamAccountName
} | ForEach-Object {
    Write-Output "User: $($_.SamAccountName) last logged on $($_.LastLogonDate)"
    
    # Ask the user for confirmation
    $response = Read-Host "Do you want to delete this user? (y/n)"
    if ($response -eq 'y') {
        Remove-ADUser -Identity $_.DistinguishedName -Confirm:$false
        Write-Output "Deleted user $($_.SamAccountName)."
    }
    else {
        Write-Output "Skipped user $($_.SamAccountName)."
    }
}
