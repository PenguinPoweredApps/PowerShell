Get-Service | Export-Csv -Path ".\Documents\Services.csv"

Set-Location -Path ".\Documents"

Import-Csv -Path ".\Services.csv"