function Get-RemoteServices {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ComputerName
    )

    Get-Service -ComputerName $ComputerName
}
