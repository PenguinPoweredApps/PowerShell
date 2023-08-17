Import-Module NetAdapter
Import-Module NetTCPIP

$IPAddresses = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.Status -eq "UP" }

$Results = @()

foreach ($IPAddress in $IPAddresses) {
    
    $HostName = Get-NetHostName -IPAddress $IPAddress
    
    $MacAddress = Get-NetAdapter -InterfaceAlias $IPAddress.InterfaceAlias | Select-Object -ExpandProperty PhysicalAddress

    $Results += New-Object PSObject -Property @{
        IPAddress            = $IPAddress.IPAddress
        InterfaceAlias       = $IPAddress.InterfaceAlias
        InterfaceDescription = $IPAddress.InterfaceDescription
        HostName             = $HostName.Name
        MacAddress           = $MacAddress
    }
}