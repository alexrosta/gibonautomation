#Copy the paths to D:\
Get-ChildItem -Path C:\Users\%USERPROFILE%\Desktop | Copy-Item -Exclude '*.lnk' -Destination D:\DESK -Recurse
Get-ChildItem -Path C:\Users\%USERPROFILE%\Documents | Copy-Item -Destination D:\DOC -Recurse
Get-ChildItem -Path C:\Users\%USERPROFILE%\Pictures | Copy-Item -Destination D:\PIC -Recurse
Get-ChildItem -Path C:\Users\%USERPROFILE%\AppData\Local\Microsoft\Outlook | Copy-Item -Destination D:\Outlook -Recurse
