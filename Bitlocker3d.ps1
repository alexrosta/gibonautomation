$BLinfo = Get-Bitlockervolume

if($blinfo.ProtectionStatus -eq 'Off'){
    Write-EventLog -log System -source System -EntryType Warning -eventID 1234 -Message "Bitlocker is off, please enable for enhanced security."
}