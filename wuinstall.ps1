if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#Install NuGet dependency
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

#Silently install module for windows update
Install-Module -Name PSWindowsUpdate -Force -ErrorAction SilentlyContinue;

Install-WindowsUpdate -AcceptAll -IgnoreReboot