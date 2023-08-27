# requires Get-PhysicalDisk cmdlet
Get-PhysicalDisk | Select-Object MediaType, OperationalStatus, Size, OperationalStatusDescription
