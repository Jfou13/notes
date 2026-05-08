# Basics

## Info sur une commande
```powershell
PS C:\Users\htb-student> Get-Command cmd

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Application     cmd.exe                                            10.0.22... C:\Windows\system32\cmd.exe


PS C:\Users\htb-student> gcm cmd

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Application     cmd.exe                                            10.0.22... C:\Windows\system32\cmd.exe
```

## History

```cmd
C:\htb> doskey /history

systeminfo
ipconfig /all
cls
ipconfig /all
systeminfo
cls
history
help
doskey /history
ping 8.8.8.8
doskey /history
```

## Tree
```cmd
htb-student@ICL-WIN11 C:\Users\htb-student>tree /?
Graphically displays the folder structure of a drive or path.

TREE [drive:][path] [/F] [/A]

   /F   Display the names of the files in each folder.
   /A   Use ASCII instead of extended characters.


htb-student@ICL-WIN11 C:\Users\htb-student>tree /F .\Videos
Folder PATH listing
Volume serial number is F684-763E
C:\USERS\HTB-STUDENT\VIDEOS
└───Captures

htb-student@ICL-WIN11 C:\Users\htb-student>tree Links
Folder PATH listing
Volume serial number is F684-763E
C:\USERS\HTB-STUDENT\LINKS
No subfolders exist


htb-student@ICL-WIN11 C:\Users\htb-student>tree Links /F
Folder PATH listing
Volume serial number is F684-763E
C:\USERS\HTB-STUDENT\LINKS
    Desktop.lnk
    Downloads.lnk

No subfolders exist

```