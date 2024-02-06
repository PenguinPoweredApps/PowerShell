# Ensure the NetSecurity module is loaded
Import-Module NetSecurity

# Get the status of the firewall for all profiles
$firewallProfiles = Get-NetFirewallProfile

# Display the status for each profile
foreach ($profile in $firewallProfiles) {
    $status = if ($profile.Enabled -eq "True") { "Enabled" } else { "Disabled" }
    Write-Host "Firewall Profile: $($profile.Name) is $status"
}
