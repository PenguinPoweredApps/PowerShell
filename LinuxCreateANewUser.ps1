# CreateNewUser.ps1
param(
    [Parameter(Mandatory=$true)]
    [string]$username
)

Invoke-Expression "useradd $username"
