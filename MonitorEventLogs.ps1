Get-WinEvent -LogName "Application" -MaxEvents 10 | Select-Object TimeCreated, ID, Message
