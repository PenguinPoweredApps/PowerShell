function Get-RemoteLoggedOnUsers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ComputerName
    )

    qwinsta /server:$ComputerName
}
