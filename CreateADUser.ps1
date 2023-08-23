function New-ADUserAccount {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Username,
        [Parameter(Mandatory=$true)]
        [string]$Password,
        [string]$OU = "OU=Users,DC=domain,DC=com"
    )

    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    New-ADUser -Name $Username -GivenName $Username -Surname $Username -UserPrincipalName "$Username@domain.com" -SamAccountName $Username -AccountPassword $SecurePassword -Path $OU -Enabled $true
}
