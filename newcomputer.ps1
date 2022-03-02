Get-ChildItem -Path D:\DESK -Recurse | Move-Item -Destination C:\Users\%USERPROFILE%\Desktop
Get-ChildItem -Path D:\DOC -Recurse | Move-Item -Destination C:\Users\%USERPROFILE%\Documents
Get-ChildItem -Path D:\PIC -Recurse | Move-Item -Destination C:\Users\%USERPROFILE%\Pictures
Get-ChildItem -Path D:\Outlook -Recurse | Move-Item -Destination C:\Users\%USERPROFILE%\AppData\Local\Microsoft\Outlook
Remove-Item -Path D:\DOC -Recurse
Remove-Item -Path D:\PIC-Recurse
Remove-Item -Path D:\DESK -Recurse
Remove-Item -Path D:\Outlook -Recurse
Read-Host "All done"