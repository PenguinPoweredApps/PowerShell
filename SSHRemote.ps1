$session = New-PSSession -HostName WPS-LAP-01 -UserName remoteuser
Enter-PSSession -Session $session
Exit-PSSession