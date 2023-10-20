# Ensure the ActiveDirectory module is loaded
Import-Module ActiveDirectory

# Get the count of all AD users
$userCount = (Get-ADUser -Filter *).Count

# Output the count
Write-Output "Total number of AD users: $userCount"
