# SID 

## Utilisatuer actuel
```shell
whoami /user
```

## Utilisateur local
```shell
Get-LocalUser -Name "NOM_UTILISATEUR" | Select-Object Name, SID
```
```shell
Get-LocalUser -Name bob.smith | Select-Object Name,SID

Name      SID
----      ---
bob.smith S-1-5-21-2614195641-1726409526-3792725429-1003


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

ou
```DOS
wmic useraccount where name='NOM_UTILISATEUR' get sid
```

## utilisateur AD
```shell
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
