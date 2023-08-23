function Test-MultiplePing {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$ComputerName
    )

    foreach ($computer in $ComputerName) {
        if (Test-Connection -ComputerName $computer -Count 1 -Quiet) {
            Write-Output "$computer is online"
        } else {
            Write-Output "$computer is offline"
        }
    }
}
