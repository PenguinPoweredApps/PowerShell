Get-ChildItem -Path "C:\Path" -File -Recurse | Where-Object { $_.Length -gt 1GB } | Select-Object FullName, Length
