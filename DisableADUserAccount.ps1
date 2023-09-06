# Import Active Directory Module
Import-Module ActiveDirectory

# Specify the username of the account to be disabled
$userName = "YourUserNameHere"

# Disable the account
Disable-ADAccount -Identity $userName

Write-Output "User $userName has been disabled."
