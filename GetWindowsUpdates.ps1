Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine

if (!(Get-InstalledModule PSWindowsUpdate)) {
    Install-Module -Name PSWindowsUpdate -Force
}
else {
    Write-Output "Module Installed"
}

Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot

Write-Host "Windows Updates Installed"
