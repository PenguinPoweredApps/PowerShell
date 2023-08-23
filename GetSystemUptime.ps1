function Get-Uptime {
    $os = Get-WmiObject win32_operatingsystem
    $uptime = (Get-Date) - $os.ConvertToDateTime($os.lastbootuptime)
    return $uptime.ToString()
}
