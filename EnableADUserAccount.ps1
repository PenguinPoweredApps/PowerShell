# Import the Active Directory module if not already loaded
Import-Module ActiveDirectory

# The SamAccountName (username) of the account to enable
$userToEnable = "jdoe"

# Check if the user exists in Active Directory
$user = Get-ADUser -Filter { SamAccountName -eq $userToEnable }

if ($user -eq $null) {
    Write-Host "User account with SamAccountName '$userToEnable' does not exist."
} else {
    # Enable the user account
    Enable-ADAccount -Identity $user

    Write-Host "User account '$userToEnable' has been enabled."
}
