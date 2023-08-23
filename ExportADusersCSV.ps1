function Export-ADUsers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ExportPath
    )

    Get-ADUser -Filter * -Property * | Select-Object Name, SamAccountName, EmailAddress, Enabled | Export-Csv -Path $ExportPath -NoTypeInformation
}
