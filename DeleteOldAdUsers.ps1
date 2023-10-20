# Import the Active Directory module
Import-Module ActiveDirectory

# Define the time duration (in this case 90 days)
$daysInactive = 90
$time = (Get-Date).Adddays( - ($daysInactive))

# Get all AD users that haven't logged in since the time duration and delete them
Get-ADUser -Filter { LastLogonTimestamp -lt $time } -Properties LastLogonTimestamp |
Where-Object { $_.DistinguishedName -notlike '*OU=ServiceAccounts,*' } | # Exclude ServiceAccounts OU or any other OU you wish to exclude
Remove-ADUser -Confirm:$false
