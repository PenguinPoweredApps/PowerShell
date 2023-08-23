function Set-RemoteService {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ComputerName,
        [Parameter(Mandatory=$true)]
        [string]$ServiceName,
        [Parameter(Mandatory=$true)]
        [ValidateSet('Start', 'Stop')]
        [string]$Action
    )

    if ($Action -eq 'Start') {
        (Get-Service -ComputerName $ComputerName -Name $ServiceName).Start()
    } else {
        (Get-Service -ComputerName $ComputerName -Name $ServiceName).Stop()
    }
}
