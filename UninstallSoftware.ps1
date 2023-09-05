Get-WmiObject -Class Win32_Product -Filter "Name='ProgramName'" | ForEach-Object { $_.Uninstall() }
