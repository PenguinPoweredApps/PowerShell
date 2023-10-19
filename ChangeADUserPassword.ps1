# Define the username and new password
$username = "UsernameToChange"
$newPassword = "NewPassword123"

# Convert the plain-text password to a secure string
$securePassword = ConvertTo-SecureString -String $newPassword -AsPlainText -Force

# Change the password for the user
Set-ADAccountPassword -Identity $username -NewPassword $securePassword -Reset

# Optionally, force the user to change the password at next login
Set-ADUser -Identity $username -ChangePasswordAtLogon $true
