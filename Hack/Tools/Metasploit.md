# Metasploit

# Basics

```shell
msfconsole
msfconsole -q # supprimer la banner
```

## install

```shell
sudo apt update && sudo apt install metasploit-framework
```

## debug example

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

