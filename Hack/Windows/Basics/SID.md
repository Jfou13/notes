# SID 

## Utilisatuer actuel
```shell
whoami /user
```

## Utilisateur local
```powershell
Get-LocalUser -Name "NOM_UTILISATEUR" | Select-Object Name, SID
```
```powershell
Get-LocalUser -Name bob.smith | Select-Object Name,SID

Name      SID
----      ---
bob.smith S-1-5-21-2614195641-1726409526-3792725429-1003
```

``` powershell
Get-LocalUser -Name bob.smith | fl *

AccountExpires         :
Description            :
Enabled                : True
FullName               :
PasswordChangeableDate : 9/7/2020 12:20:31 PM
PasswordExpires        :
UserMayChangePassword  : True
PasswordRequired       : True
PasswordLastSet        : 9/7/2020 12:20:31 PM
LastLogon              :
Name                   : bob.smith
SID                    : S-1-5-21-2614195641-1726409526-3792725429-1003
PrincipalSource        : Local
ObjectClass            : User
```

Nota : `fl` est l'alias de `Format-List`

ou en DOS
```shell
wmic useraccount where name='NOM_UTILISATEUR' get sid
```

### Pour voir tous les users

``` powershell
Get-LocalUser -Name * | Select-Object Name,SID

Name               SID
----               ---
Administrator      S-1-5-21-2614195641-1726409526-3792725429-500
bob.smith          S-1-5-21-2614195641-1726409526-3792725429-1003
DefaultAccount     S-1-5-21-2614195641-1726409526-3792725429-503
defaultuser0       S-1-5-21-2614195641-1726409526-3792725429-1000
Guest              S-1-5-21-2614195641-1726409526-3792725429-501
htb-student        S-1-5-21-2614195641-1726409526-3792725429-1002
Jim                S-1-5-21-2614195641-1726409526-3792725429-1006
mrb3n              S-1-5-21-2614195641-1726409526-3792725429-1001
WDAGUtilityAccount S-1-5-21-2614195641-1726409526-3792725429-504
```

## Voir tous les groupe locaux

``` powershell
Get-LocalGroup -Name * | Select-Object Name,SID

Name                                SID
----                                ---
HR                                  S-1-5-21-2614195641-1726409526-3792725429-1007
Access Control Assistance Operators S-1-5-32-579
Administrators                      S-1-5-32-544
Backup Operators                    S-1-5-32-551
Cryptographic Operators             S-1-5-32-569
Distributed COM Users               S-1-5-32-562
Event Log Readers                   S-1-5-32-573
Guests                              S-1-5-32-546
Hyper-V Administrators              S-1-5-32-578
IIS_IUSRS                           S-1-5-32-568
Network Configuration Operators     S-1-5-32-556
Performance Log Users               S-1-5-32-559
Performance Monitor Users           S-1-5-32-558
Power Users                         S-1-5-32-547
Remote Desktop Users                S-1-5-32-555
Remote Management Users             S-1-5-32-580
Replicator                          S-1-5-32-552
System Managed Accounts Group       S-1-5-32-581
Users                               S-1-5-32-545
```


## utilisateur AD
```powershell
Get-ADUser -Identity "NOM_UTILISATEUR" | Select-Object SID
```



## SID

```
(SID)-(revision level)-(identifier-authority)-(subauthority1)-(subauthority2)-(etc)
```

|**Number**|**Meaning**|**Description**|
|---|---|---|
|S|SID|Identifies the string as a SID.|
|1|Revision Level|To date, this has never changed and has always been `1`.|
|5|Identifier-authority|A 48-bit string that identifies the authority (the computer or network) that created the SID.|
|21|Subauthority1|This is a variable number that identifies the user's relation or group described by the SID to the authority that created it. It tells us in what order this authority created the user's account.|
|674899381-4069889467-2080702030|Subauthority2|Tells us which computer (or domain) created the number|
|1002|Subauthority3|The RID that distinguishes one account from another. Tells us whether this user is a normal user, a guest, an administrator, or part of some other group|
