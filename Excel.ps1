if (!(Get-InstalledModule ImportExcel)) {
    Install-Module ImportExcel -Force
}
else {
    Write-Output "Module Installed"
}
Write-Output "Module Installed"