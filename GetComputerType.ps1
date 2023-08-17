$computers = Get-ADComputer -Filter *

foreach ($c in $computers) {
    $os = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $c.Name

    switch ($os.ProductType) {
        1 { $type = "Workstation" }
        2 { $type = "Domain Controller" }
        3 { $type = "Server" }
        default { $type = "Unknown" }
    }
    "$($c.Name) is a $type"
}