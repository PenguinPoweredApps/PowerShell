$session = New-PSSession -HostName 192.168.1.20 -UserName remoteuser
Enter-PSSession -Session $session
Exit-PSSession