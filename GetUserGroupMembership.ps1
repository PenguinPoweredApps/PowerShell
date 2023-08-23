function Get-UserGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Username
    )

    (Get-ADUser $Username -Properties memberof).memberof | Get-ADGroup | Select-Object Name
}
