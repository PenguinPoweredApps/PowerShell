function Restart-RemoteComputer {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ComputerName
    )

    Restart-Computer -ComputerName $ComputerName -Force
}
