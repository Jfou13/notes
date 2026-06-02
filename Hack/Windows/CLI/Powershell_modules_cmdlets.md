# Powershell modules cmdlets

## Viewing PSModulePath

```powershell
PS C:\Users\htb-student> $env:PSModulePath

C:\Users\htb-student\Documents\WindowsPowerShell\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules
```

## Import-Module

### Execution Policy's Impact
```powershell
PS C:\Users\htb-student\Desktop\PowerSploit> Import-Module .\PowerSploit.psd1

Import-Module : File C:\Users\Users\htb-student\PowerSploit.psm1
cannot be loaded because running scripts is disabled on this system. For more information, see
about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.
At line:1 char:1
+ Import-Module .\PowerSploit.psd1
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : SecurityError: (:) [Import-Module], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess,Microsoft.PowerShell.Commands.ImportModuleCommand
```

### Checking Execution Policy State
```powershell
PS C:\htb> Get-ExecutionPolicy 

Restricted
```

### Setting Execution Policy
```powershell
PS C:\htb> Set-ExecutionPolicy undefined
```

### Testing It Out
```powershell
PS C:\htb> Import-Module .\PowerSploit.psd1

Import-Module .\PowerSploit.psd1
PS C:\Users\htb> get-module

ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Manifest   3.1.0.0    Microsoft.PowerShell.Management     {Add-Computer, Add-Content, Check...
Manifest   3.0.0.0    Microsoft.PowerShell.Security       {ConvertFrom-SecureString, Conver...
Manifest   3.1.0.0    Microsoft.PowerShell.Utility        {Add-Member, Add-Type, Clear-Vari...
Script     3.0.0.0    PowerSploit                         {Add-Persistence, Add-ServiceDacl...
Script     2.0.0      PSReadline                          {Get-PSReadLineKeyHandler, Get-PS...
```

### Change Execution Policy By Scope

```powershell
PS C:\htb> Set-ExecutionPolicy -scope Process 
PS C:\htb> Get-ExecutionPolicy -list

Scope ExecutionPolicy
        ----- ---------------
MachinePolicy       Undefined
   UserPolicy       Undefined
      Process          Bypass
  CurrentUser       Undefined
 LocalMachine          Bypass
```

### PowerShellGet

```powershell
PS C:\htb> Get-Command -Module PowerShellGet 

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Find-Command                                       1.0.0.1    PowerShellGet
Function        Find-DscResource                                   1.0.0.1    PowerShellGet
Function        Find-Module                                        1.0.0.1    PowerShellGet
Function        Find-RoleCapability                                1.0.0.1    PowerShellGet
Function        Find-Script                                        1.0.0.1    PowerShellGet
Function        Get-InstalledModule                                1.0.0.1    PowerShellGet
Function        Get-InstalledScript                                1.0.0.1    PowerShellGet
Function        Get-PSRepository                                   1.0.0.1    PowerShellGet
Function        Install-Module                                     1.0.0.1    PowerShellGet
Function        Install-Script                                     1.0.0.1    PowerShellGet
Function        New-ScriptFileInfo                                 1.0.0.1    PowerShellGet
Function        Publish-Module                                     1.0.0.1    PowerShellGet
Function        Publish-Script                                     1.0.0.1    PowerShellGet
<SNIP>
```

## Install-Module

```powershell
Find-module -Name AdminToolbox | Install-module
```

## Tools To Be Aware Of

- [AdminToolbox](https://www.powershellgallery.com/packages/AdminToolbox/11.0.8): AdminToolbox is a collection of helpful modules that allow system administrators to perform any number of actions dealing with things like Active Directory, Exchange, Network management, file and storage issues, and more.
- [ActiveDirectory](https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps): This module is a collection of local and remote administration tools for all things Active Directory. We can manage users, groups, permissions, and much more with it.
- [Empire / Situational Awareness](https://github.com/BC-SECURITY/Empire/tree/master/empire/server/data/module_source/situational_awareness): Is a collection of PowerShell modules and scripts that can provide us with situational awareness on a host and the domain they are apart of. This project is being maintained by [BC Security](https://github.com/BC-SECURITY) as a part of their Empire Framework.
- [Inveigh](https://github.com/Kevin-Robertson/Inveigh): Inveigh is a tool built to perform network spoofing and Man-in-the-middle attacks.
- [BloodHound / SharpHound](https://github.com/BloodHoundAD/BloodHound/tree/master/Collectors): Bloodhound/Sharphound allows us to visually map out an Active Directory Environment using graphical analysis tools and data collectors written in C# and PowerShell.