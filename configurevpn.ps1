$name = Read-Host "Enter a name for your VPN connection:"
$ipadress = Read-Host "Enter the IP adress for the connection:"
$psk = Read-Host "Enter the pre-shared key:"

Add-VpnConnection -Name "$name" -ServerAddress "$ipadress" -TunnelType L2TP -L2tpPsk "$psk" -Force -EncryptionLevel "Optional"

Set-VpnConnection -Name $name -AuthenticationMethod Pap, Chap, MSChapv2