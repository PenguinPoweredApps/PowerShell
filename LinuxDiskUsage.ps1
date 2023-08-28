# DiskUsage.ps1
Get-PSDrive | Where-Object { $_.Provider -eq 'FileSystem' } | Select-Object Name, Used, Free
