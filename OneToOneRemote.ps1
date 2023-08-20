$Credential = Get-Credential

# Create a one-to-one PowerShell remoting session to the domain controller named dc01.
Enter-PSSession -ComputerName dc01 -Credential $Credential