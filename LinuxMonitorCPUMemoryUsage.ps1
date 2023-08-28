# MonitorCpuMemory.ps1
while ($true) {
    Get-Process | Select-Object Name, CPU, PM | Sort-Object -Property CPU -Descending | Format-Table -AutoSize
    Start-Sleep -Seconds 5
}
