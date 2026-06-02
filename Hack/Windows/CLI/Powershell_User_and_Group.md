# Powershell User and Group

## Adding/Removing/Editing User Accounts & Groups

### Identifying Local Users

```powershell
PS C:\htb> Get-LocalUser  
  
Name               Enabled Description
----               ------- -----------
Administrator      False   Built-in account for administering the computer/domain
DefaultAccount     False   A user account managed by the system.
DLarusso           True    High kick specialist.
Guest              False   Built-in account for guest access to the computer/domain
sshd               True
WDAGUtilityAccount False   A user account managed and used by the system for Windows Defender A...
```

### Creating A New User

```powershell
PS C:\htb>  New-LocalUser -Name "JLawrence" -NoPassword

Name      Enabled Description
----      ------- -----------
JLawrence True
```


### Creating A New User

```powershell
PS C:\htb> $Password = Read-Host -AsSecureString
****************
PS C:\htb> Set-LocalUser -Name "JLawrence" -Password $Password -Description "CEO EagleFang"
PS C:\htb> Get-LocalUser  

Name               Enabled Description
----               ------- -----------
Administrator      False   Built-in account for administering the computer/domain
DefaultAccount     False   A user account managed by the system.
demo               True
Guest              False   Built-in account for guest access to the computer/domain
JLawrence          True    CEO EagleFang
```


### Get-LocalGroup

```powershell
PS C:\Users\htb-student> get-localgroup

Name                                Description
----                                -----------
Access Control Assistance Operators Members of this group can remotely query authorization attributes and permissions for resources on this computer.
Administrators                      Administrators have complete and unrestricted access to the computer/domain
Backup Operators                    Backup Operators can override security restrictions for the sole purpose of backing up or restoring files
Cryptographic Operators             Members are authorized to perform cryptographic operations.
<SNIP>
```

### Adding a Member To a Group

```powershell
PS C:\htb> Add-LocalGroupMember -Group "Remote Desktop Users" -Member "JLawrence"
PS C:\htb> Get-LocalGroupMember -Name "Remote Desktop Users" 

ObjectClass Name                      PrincipalSource
----------- ----                      ---------------
User        DESKTOP-B3MFM77\JLawrence Local
```

## Managing Domain Users and Groups

### Installing RSAT

```powershell
PS C:\htb> Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

Path          :  
Online        : True  
RestartNeeded : False
```

### Locating The AD Module
```powershell
PS C:\htb> Get-Module -Name ActiveDirectory -ListAvailable 

    Directory: C:\Windows\system32\WindowsPowerShell\v1.0\Modules


ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Manifest   1.0.1.0    ActiveDirectory                     {Add-ADCentralAccessPolicyMember, Add-ADComputerServiceAccount, Add-ADDomainControllerPasswordReplicationPolicy, Add-A...
```

### Get-ADUser

```powershell
PS C:\htb> Get-ADUser -Filter *

DistinguishedName : CN=user14,CN=Users,DC=greenhorn,DC=corp
Enabled           : True
GivenName         :
Name              : user14
ObjectClass       : user
ObjectGUID        : bef9787d-2716-4dc9-8e8f-f8037a72c3d9
SamAccountName    : user14
SID               : S-1-5-21-1480833693-1324064541-2711030367-1110
Surname           :
UserPrincipalName :

DistinguishedName : CN=sshd,CN=Users,DC=greenhorn,DC=corp
Enabled           : True
GivenName         :
Name              : sshd
ObjectClass       : user
ObjectGUID        : 7a324e98-00e4-480b-8a1a-fa465d558063
SamAccountName    : sshd
SID               : S-1-5-21-1480833693-1324064541-2711030367-1112
Surname           :
UserPrincipalName :

DistinguishedName : CN=TSilver,CN=Users,DC=greenhorn,DC=corp
Enabled           : True
GivenName         :
Name              : TSilver
ObjectClass       : user
ObjectGUID        : a19a6c8a-000a-4cbf-aa14-0c7fca643c37
SamAccountName    : TSilver
SID               : S-1-5-21-1480833693-1324064541-2711030367-1602
Surname           :
UserPrincipalName :  

<SNIP>
```

### Get a Specific User
```powershell
PS C:\htb>  Get-ADUser -Identity TSilver


DistinguishedName : CN=TSilver,CN=Users,DC=greenhorn,DC=corp
Enabled           : True
GivenName         :
Name              : TSilver
ObjectClass       : user
ObjectGUID        : a19a6c8a-000a-4cbf-aa14-0c7fca643c37
SamAccountName    : TSilver
SID               : S-1-5-21-1480833693-1324064541-2711030367-1602
Surname           :
UserPrincipalName :
```

### Searching On An Attribute
```powershell
PS C:\htb> Get-ADUser -Filter {EmailAddress -like '*greenhorn.corp'}


DistinguishedName : CN=TSilver,CN=Users,DC=greenhorn,DC=corp
Enabled           : True
GivenName         :
Name              : TSilver
ObjectClass       : user
ObjectGUID        : a19a6c8a-000a-4cbf-aa14-0c7fca643c37
SamAccountName    : TSilver
SID               : S-1-5-21-1480833693-1324064541-2711030367-1602
Surname           :
UserPrincipalName :
```

### New ADUser
```powershell
PS C:\htb> New-ADUser -Name "MTanaka" -Surname "Tanaka" -GivenName "Mori" -Office "Security" -OtherAttributes @{'title'="Sensei";'mail'="MTanaka@greenhorn.corp"} -Accountpassword (Read-Host -AsSecureString "AccountPassword") -Enabled $true 

AccountPassword: ****************
PS C:\htb> Get-ADUser -Identity MTanaka -Properties * | Format-Table Name,Enabled,GivenName,Surname,Title,Office,Mail

Name    Enabled GivenName Surname Title  Office   Mail
----    ------- --------- ------- -----  ------   ----
MTanaka    True Mori      Tanaka  Sensei Security MTanaka@greenhorn.corp
```

### Changing a Users Attributes
```powershell
PS C:\htb> Set-ADUser -Identity MTanaka -Description " Sensei to Security Analyst's Rocky, Colt, and Tum-Tum"  

PS C:\htb> Get-ADUser -Identity MTanaka -Property Description


Description       :  Sensei to Security Analyst's Rocky, Colt, and Tum-Tum
DistinguishedName : CN=MTanaka,CN=Users,DC=greenhorn,DC=corp
Enabled           : True
GivenName         : Mori
Name              : MTanaka
ObjectClass       : user
ObjectGUID        : c19e402d-b002-4ca0-b5ac-59d416166b3a
SamAccountName    : MTanaka
SID               : S-1-5-21-1480833693-1324064541-2711030367-1603
Surname           : Tanaka
UserPrincipalName :
```

### Voir les users admin

```powershell
PS C:\Users\MTanaka> Get-ADGroupMember -Identity "Domain Admins"


distinguishedName : CN=Administrator,CN=Users,DC=greenhorn,DC=corp
name              : Administrator
objectClass       : user
objectGUID        : 140a4c70-7a69-4870-871d-652a01d23215
SamAccountName    : Administrator
SID               : S-1-5-21-1480833693-1324064541-2711030367-500

distinguishedName : CN=MTanaka,CN=Users,DC=greenhorn,DC=corp
name              : MTanaka
objectClass       : user
objectGUID        : c19e402d-b002-4ca0-b5ac-59d416166b3a
SamAccountName    : MTanaka
SID               : S-1-5-21-1480833693-1324064541-2711030367-1603
```