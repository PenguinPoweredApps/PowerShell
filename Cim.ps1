# Get-CimClass | Where-Object CimClassName -Like "*network*"

# Get-CimInstance -ClassName CIM_NetworkAdapter

# Get-CimInstance -ClassName WIN32_NetworkAdapterConfiguration | Select-Object  *

Get-CimInstance -ClassName WIN32_OperatingSystem | Select-Object  *