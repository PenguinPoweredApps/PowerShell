$Credential = Get-Credential

 # Create the secured password
 $NewPwd = ConvertTo-SecureString "Password@123" -AsPlainText -Force
 
# Reset the AD user password and specify the admin credential context
 Set-ADAccountPassword -Identity user03 -NewPassword $NewPwd -Credential $Credential

 # Force the user to change the password at next logon
 Set-ADUser -Identity user03 -ChangePasswordAtLogon $true -Credential $Credential