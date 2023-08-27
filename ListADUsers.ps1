Get-ADUser -Filter * -Properties DisplayName, EmailAddress | Select-Object DisplayName, EmailAddress
