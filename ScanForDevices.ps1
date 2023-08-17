#!/usr/bin/pwsh

# Function to perform a network scan using Nmap
function Get-DevicesOnNetwork {
    param (
        [string]$subnet
    )
    $nmapOutput = nmap -sn $subnet
    $devices = $nmapOutput | Select-String -Pattern "Nmap scan report for (.+)" | ForEach-Object { $_.Matches.Groups[1].Value }
    return $devices
}

# Enter your network subnet in CIDR notation (e.g., 192.168.0.0/24)
$subnet = "192.168.1.0/24"

# Call the function to get devices on the network
$devicesOnNetwork = Get-DevicesOnNetwork $subnet

# Output the device names
$devicesOnNetwork
