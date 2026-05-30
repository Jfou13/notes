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

```powershell
PS C:\htb> Get-Command -verb get

<SNIP>
Cmdlet          Get-Acl                                            3.0.0.0    Microsoft.Pow...
Cmdlet          Get-Alias                                          3.1.0.0    Microsoft.Pow...
Cmdlet          Get-AppLockerFileInformation                       2.0.0.0    AppLocker
Cmdlet          Get-AppLockerPolicy                                2.0.0.0    AppLocker
Cmdlet          Get-AppvClientApplication                          1.0.0.0    AppvClient  
<SNIP>
```

```powershell
PS C:\htb> Get-Command -noun windows*  

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           Apply-WindowsUnattend                              3.0        Dism
Function        Get-WindowsUpdateLog                               1.0.0.0    WindowsUpdate
Cmdlet          Add-WindowsCapability                              3.0        Dism
Cmdlet          Add-WindowsDriver                                  3.0        Dism
Cmdlet          Add-WindowsImage                                   3.0        Dism
Cmdlet          Add-WindowsPackage                                 3.0        Dism
Cmdlet          Clear-WindowsCorruptMountPoint                     3.0        Dism
Cmdlet          Disable-WindowsErrorReporting                      1.0        WindowsErrorR...
Cmdlet          Disable-WindowsOptionalFeature                     3.0        Dism
Cmdlet          Dismount-WindowsImage                              3.0        Dism
Cmdlet          Enable-WindowsErrorReporting                       1.0        WindowsErrorR...
Cmdlet          Enable-WindowsOptionalFeature                      3.0        Dism
<SNIP>
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

```Powershell
PS C:\htb> Get-History

 Id CommandLine
  -- -----------
   1 Get-Command
   2 clear
   3 get-command -verb set
   4 get-command set*
   5 clear
   6 get-command -verb get
   7 get-command -noun windows
   8 get-command -noun windows*
   9 get-module
  10 clear
  11 get-history
  12 clear
  13 ipconfig /all
  14 arp -a
  15 get-help
  16 get-help get-module
```

### emplacement de l'historique

```powershell
PS C:\htb> get-content C:\Users\DLarusso\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
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