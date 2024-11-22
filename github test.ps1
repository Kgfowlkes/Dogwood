# Set Execution Policy to Bypass (temporarily for the session)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Define the VPN name you're looking for
$vpnName = "DHT VPN"  # Replace with the actual name of the VPN you want to remove

# Check if the VPN exists
$vpn = Get-VpnConnection -Name $vpnName -ErrorAction SilentlyContinue

if ($vpn) {
    Write-output "VPN '$vpnName' found. Removing it..."
    
    # Remove the VPN connection
    Remove-VpnConnection -Name $vpnName -Force -Confirm:$false

    # Verify if the VPN was successfully removed
    $vpnCheck = Get-VpnConnection -Name $vpnName -ErrorAction SilentlyContinue
    if (-not $vpnCheck) {
        Write-output "VPN '$vpnName' successfully removed."
    } else {
        Write-output "Failed to remove VPN '$vpnName'."
    }
} else {
    Write-output "VPN '$vpnName' not found."
}
