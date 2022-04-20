#check command line mode
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#get user variable
$user = Read-Host "Enter User"

#create signatures folder
New-Item -Path "C:\Users\$user\OneDrive\" -Name "Signatures" -ItemType "directory"

Start-Sleep -Seconds 1.5

#make link junction to OneDrive folder
New-Item -ItemType Junction -Path "C:\Users\$user\OneDrive\Signatures" -Target "C:\Users\$user\Appdata\Roaming\Microsoft\Signatures" 

#open file explorer to that path
explorer C:\Users\$user\OneDrive\Signatures

#/endscript