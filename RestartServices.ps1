$Services = Get-Content -Path ".\Services.txt"

$Services

$Services | Get-Service | Restart-Service -Force