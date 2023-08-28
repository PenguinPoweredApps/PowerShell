# CheckServicesStatus.ps1
Invoke-Expression "systemctl list-units --type=service --state=running"
