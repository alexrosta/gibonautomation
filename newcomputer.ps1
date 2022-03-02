Get-ChildItem -Path D:\DESK -Recurse | Move-Item -Destination C:\Users\%USERPROFILE%\Desktop
Get-ChildItem -Path D:\DOC -Recurse | Move-Item -Destination C:\Users\%USERPROFILE%\Documents
Get-ChildItem -Path D:\PIC -Recurse | Move-Item -Destination C:\Users\%USERPROFILE%\Pictures
Get-ChildItem -Path D:\Outlook -Recurse | Move-Item -Destination C:\Users\%USERPROFILE%\AppData\Local\Microsoft\Outlook