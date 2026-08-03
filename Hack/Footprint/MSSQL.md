# MSSQL

## Nmap

```shell
sudo nmap --script ms-sql-info,ms-sql-empty-password,ms-sql-xp-cmdshell,ms-sql-config,ms-sql-ntlm-info,ms-sql-tables,ms-sql-hasdbaccess,ms-sql-dac,ms-sql-dump-hashes --script-args mssql.instance-port=1433,mssql.username=sa,mssql.password=,mssql.instance-name=MSSQLSERVER -sV -p 1433 10.129.201.248
```

## Metasploit

```bash
msf6 auxiliary(scanner/mssql/mssql_ping) > set rhosts 10.129.201.248

rhosts => 10.129.201.248


msf6 auxiliary(scanner/mssql/mssql_ping) > run

[*] 10.129.201.248:       - SQL Server information for 10.129.201.248:
[+] 10.129.201.248:       -    ServerName      = SQL-01
[+] 10.129.201.248:       -    InstanceName    = MSSQLSERVER
[+] 10.129.201.248:       -    IsClustered     = No
[+] 10.129.201.248:       -    Version         = 15.0.2000.5
[+] 10.129.201.248:       -    tcp             = 1433
[+] 10.129.201.248:       -    np              = \\SQL-01\pipe\sql\query
[*] 10.129.201.248:       - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```

```bash
┌──(kali㉿kali)-[~]
└─$ msfconsole -q                                                        
msf > set rhosts 10.129.230.249
rhosts => 10.129.230.249
msf > search mssql_ping

Matching Modules
================

   #  Name                                Disclosure Date  Rank    Check  Description
   -  ----                                ---------------  ----    -----  -----------
   0  auxiliary/scanner/mssql/mssql_ping  .                normal  No     MSSQL Ping Utility


Interact with a module by name or index. For example info 0, use 0 or use auxiliary/scanner/mssql/mssql_ping

msf > use 0
msf auxiliary(scanner/mssql/mssql_ping) > options

Module options (auxiliary/scanner/mssql/mssql_ping):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   PASSWORD                   no        The password for the specified username
   RHOSTS    10.129.230.249   yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.html
   THREADS   1                yes       The number of concurrent threads (max one per host)
   USERNAME  sa               no        The username to authenticate as


View the full module info with the info, or info -d command.

msf auxiliary(scanner/mssql/mssql_ping) > run
[*] 10.129.230.249        - SQL Server information for 10.129.230.249:
[+] 10.129.230.249        -    ServerName      = ILF-SQL-01
[+] 10.129.230.249        -    InstanceName    = MSSQLSERVER
[+] 10.129.230.249        -    IsClustered     = No
[+] 10.129.230.249        -    Version         = 15.0.2000.5
[+] 10.129.230.249        -    tcp             = 1433
[+] 10.129.230.249        -    np              = \\ILF-SQL-01\pipe\sql\query
[*] 10.129.230.249        - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed

```


## Mssqlclient.py

```bash
Jfou@htb[/htb]$ python3 /usr/share/doc/python3-impacket/examples/mssqlclient.py Administrator@10.129.201.248 -windows-auth

Impacket v0.9.22 - Copyright 2020 SecureAuth Corporation

Password:
[*] Encryption required, switching to TLS
[*] ENVCHANGE(DATABASE): Old Value: master, New Value: master
[*] ENVCHANGE(LANGUAGE): Old Value: , New Value: us_english
[*] ENVCHANGE(PACKETSIZE): Old Value: 4096, New Value: 16192
[*] INFO(SQL-01): Line 1: Changed database context to 'master'.
[*] INFO(SQL-01): Line 1: Changed language setting to us_english.
[*] ACK: Result: 1 - Microsoft SQL Server (150 7208) 
[!] Press help for extra shell commands

SQL> select name from sys.databases

name                                                                                                                               

--------------------------------------------------------------------------------------

master                                                                                                                             

tempdb                                                                                                                             

model                                                                                                                              

msdb                                                                                                                               

Transactions
```

## impacket

```bash
┌──(kali㉿kali)-[~]
└─$ impacket-mssqlclient backdoor:Password1@10.129.230.249 -windows-auth                                 
Impacket v0.14.0.dev0 - Copyright Fortra, LLC and its affiliated companies 

[*] Encryption required, switching to TLS
[*] ENVCHANGE(DATABASE): Old Value: master, New Value: master
[*] ENVCHANGE(LANGUAGE): Old Value: , New Value: us_english
[*] ENVCHANGE(PACKETSIZE): Old Value: 4096, New Value: 16192
[*] INFO(ILF-SQL-01): Line 1: Changed database context to 'master'.
[*] INFO(ILF-SQL-01): Line 1: Changed language setting to us_english.
[*] ACK: Result: 1 - Microsoft SQL Server 2019 RTM (15.0.2000)
[!] Press help for extra shell commands

SQL (ILF-SQL-01\backdoor  dbo@master)> enum_db
name        is_trustworthy_on   
---------   -----------------   
master                      0   
tempdb                      0   
model                       0   
msdb                        1   
Employees                   0   
SQL (ILF-SQL-01\backdoor  dbo@master)>
```
