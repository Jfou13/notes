# Skills Assessment

## User4 has a lot of files and folders in their Documents folder. The flag can be found within one of them.

```powershell
PS C:\Users\user4\Documents> Get-ChildItem -Path .\ -Filter "flag.txt" -Recurse -File
<SNIP>

    Directory: C:\Users\user4\Documents\3\7\28


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         7/26/2022   2:14 PM              0 flag.txt


    Directory: C:\Users\user4\Documents\3\7\29


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         7/26/2022   2:14 PM              0 flag.txt


    Directory: C:\Users\user4\Documents\3\7\30


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         7/26/2022   2:14 PM              0 flag.txt
<SNIP>
```

```powershell
PS C:\Users\user4\Documents> Get-ChildItem -Path .\ -Filter "flag.txt" -Recurse -File | Where-Object { $_.Length -gt 0 }


    Directory: C:\Users\user4\Documents\3\4


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         7/26/2022   2:18 PM             44 flag.txt
```
```powershell
PS C:\Users\user4\Documents> gci . -Filter "flag.txt" -Recurse -File | ? Length -gt 0


    Directory: C:\Users\user4\Documents\3\4


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         7/26/2022   2:18 PM             44 flag.txt
```

## How many users exist on this host? (Excluding the DefaultAccount and WDAGUtility)
```powershell
PS C:\Users\user4\Documents> Get-LocalUser

Name               Enabled Description
----               ------- -----------
Administrator      True    Built-in account for administering the computer/domain
DefaultAccount     False   A user account managed by the system.
Guest              False   Built-in account for guest access to the computer/domain
htb-student        True
user0              True
user1              True
user100            True
user2              True
user3              True
user4              True
user5              True
user66             False
user77             False
user88             False
user99             False
WDAGUtilityAccount False   A user account managed and used by the system for Windows Defender Application Guard scenarios.


PS C:\Users\user4\Documents> (Get-LocalUser).Count
16
```

## For this level, you must successfully authenticate to the Domain Controller host at 172.16.5.155 via SSH after first authenticating to the target host. This host seems to have several PowerShell modules loaded, and this user's flag is hidden in one of them.

```powershell
PS C:\Users\user7> Get-Module 

ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Script     0.0        Flag-Finder                         Get-Flag
Manifest   3.1.0.0    Microsoft.PowerShell.Utility        {Add-Member, Add-Type, Clear-Variable, Compare-Object...}
Script     2.0.0      PSReadline                          {Get-PSReadLineKeyHandler, Get-PSReadLineOption, Remove-PSReadLineKeyHandler, Set-PSReadLineKeyHandler...}


PS C:\Users\user7> Get-Command -Module "Flag-Finder" 

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-Flag                                           0.0        Flag-Finder


PS C:\Users\user7> Get-Flag 
The
Flag you are looking for is {Modules_<snip>_pwsh_run!} 

```

## This flag is the GivenName of a domain user with the Surname "Flag".

ssh with user 7 and password is question 7 answer

```powershell
PS C:\Users\user7> Get-ADUser -Filter *                                      


DistinguishedName : CN=Administrator,CN=Users,DC=greenhorn,DC=corp 
Enabled           : True
GivenName         :
Name              : Administrator
ObjectClass       : user
ObjectGUID        : 140a4c70-7a69-4870-871d-652a01d23215
SamAccountName    : Administrator
SID               : S-1-5-21-1480833693-1324064541-2711030367-500  
Surname           :
UserPrincipalName :

DistinguishedName : CN=Guest,CN=Users,DC=greenhorn,DC=corp
Enabled           : False
GivenName         :
Name              : Guest
ObjectClass       : user
ObjectGUID        : ba793330-ac63-4a06-aa19-9a2a6ef64c23
```

```powershell
PS C:\Users\user7> Get-ADUser -Filter {Surname -like 'Flag'}


DistinguishedName : CN=Rick F. Flag,CN=Users,DC=greenhorn,DC=corp
Enabled           : False
GivenName         : Rick
Name              : Rick F. Flag
ObjectClass       : user
ObjectGUID        : de3769db-7161-46a0-bf99-cfe766cb8bcd
SamAccountName    : RFlag
SID               : S-1-5-21-1480833693-1324064541-2711030367-1113
Surname           : Flag
UserPrincipalName : RFlag@greenhorn.corp

```
## Use the tasklist command to print running processes and then sort them in reverse order by name. The name of the process that begins with "vm" is the flag for this user.

```powershell
PS C:\Users\user7> tasklist | Sort-Object -Descending | Select-String "^vm"

vmtoolsd.exe                  2820 Services                   0     21,732 K
vm3dservice.exe               2800 Console                    1      7,952 K
vm3dservice.exe               2756 Services                   0      6,980 K
vm3dservice.exe               2064 Console                    1      7,136 K

```

## What user account on the Domain Controller has many Event ID (4625) logon failures generated in rapid succession, which is indicative of a password brute forcing attack? The flag is the name of the user account.

```powershell
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} | Group-Object -Property {$_.Properties[5].Value} | Sort-Object Count -Descending | Select-Object Count, Name


PS C:\Users\user7> Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} | Group-Object -Property {$_.Properties[5].Value} | Sort-Object Count -Descending | Select-Object Count, Name

Count Name
----- ----
  181 justalocaladmin
   11 Administrator
    8 user2
    8 htb-student
    4 user1
    2 NOUSER
    2 user7
    2
    1 FakeUser
    1 user6


```