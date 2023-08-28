# Import the ActiveDirectory module if not already loaded
Import-Module ActiveDirectory

# Read the CSV file containing user details
$users = Import-Csv -Path "C:\path\to\users.csv"

# Loop through each user in the CSV
foreach ($user in $users) {
    # Gather user information from the current row
    $firstName = $user.FirstName
    $lastName = $user.LastName
    $username = $user.Username
    $password = ConvertTo-SecureString -AsPlainText $user.Password -Force
    $ou = $user.OU # Example: "OU=Staff,DC=example,DC=com"

    # Create the user
    New-ADUser `
        -Name "$firstName $lastName" `
        -GivenName $firstName `
        -Surname $lastName `
        -UserPrincipalName "$username@example.com" `
        -SamAccountName $username `
        -AccountPassword $password `
        -Enabled $true `
        -Path $ou
}

Write-Host "Users have been added to AD."
