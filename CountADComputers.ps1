# Ensure the ActiveDirectory module is imported
Import-Module ActiveDirectory

# Get all AD computer objects and count them
$computerCount = (Get-ADComputer -Filter *).Count

# Output the count
Write-Output "Total number of computers in Active Directory: $computerCount"
