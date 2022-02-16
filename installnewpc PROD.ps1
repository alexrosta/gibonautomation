#IF POWERSHELL IS IN NON-ADMIN MODE, PROMPT AND OPEN A ADMIN WINDOW
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#LET CHOCO INSTALL APPLICATIONS WITH BYPASS
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Allow scripts to run by trusted publisher
Set-ExecutionPolicy RemoteSigned

#Install NuGet dependency
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

#Silently install module for windows update
Install-Module -Name PSWindowsUpdate -Force -ErrorAction SilentlyContinue;

#CHANGE NAME ON THE COMPUTER
$input = Read-Host "Name your Computer"
Rename-Computer -newname "$input"

#CHOCO INSTALL APPLICATIONS
choco install adobereader -y
choco install googlechrome -y
choco install 7zip.install -y
choco install vlc -y
choco install microsoft-teams.install -y
choco install office365business -y
choco install teamviewer -y

Install-WindowsUpdate -AcceptAll -IgnoreReboot

#Author Alex