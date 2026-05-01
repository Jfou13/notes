# MSF - Scanning Target


```shell
msf6 > db_nmap -sV -p- -T5 -A 10.10.10.15

[*] Nmap: Starting Nmap 7.80 ( https://nmap.org ) at 2020-09-03 09:55 UTC
[*] Nmap: Nmap scan report for 10.10.10.15
[*] Nmap: Host is up (0.021s latency).
[*] Nmap: Not shown: 65534 filtered ports
[*] Nmap: PORT   STATE SERVICE VERSION
[*] Nmap: 80/tcp open  http    Microsoft IIS httpd 6.0
[*] Nmap: | http-methods:
[*] Nmap: |_  Potentially risky methods: TRACE DELETE COPY MOVE PROPFIND PROPPATCH SEARCH MKCOL LOCK UNLOCK PUT
[*] Nmap: |_http-server-header: Microsoft-IIS/6.0
[*] Nmap: |_http-title: Under Construction
[*] Nmap: | http-webdav-scan:
[*] Nmap: |   Public Options: OPTIONS, TRACE, GET, HEAD, DELETE, PUT, POST, COPY, MOVE, MKCOL, PROPFIND, PROPPATCH, LOCK, UNLOCK, SEARCH
[*] Nmap: |   WebDAV type: Unknown
[*] Nmap: |   Allowed Methods: OPTIONS, TRACE, GET, HEAD, DELETE, COPY, MOVE, PROPFIND, PROPPATCH, SEARCH, MKCOL, LOCK, UNLOCK
[*] Nmap: |   Server Date: Thu, 03 Sep 2020 09:56:46 GMT
[*] Nmap: |_  Server Type: Microsoft-IIS/6.0
[*] Nmap: Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows
[*] Nmap: Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
[*] Nmap: Nmap done: 1 IP address (1 host up) scanned in 59.74 seconds


msf6 > hosts

Hosts
=====

address      mac  name  os_name  os_flavor  os_sp  purpose  info  comments
-------      ---  ----  -------  ---------  -----  -------  ----  --------
10.10.10.15             Unknown                    device         


msf6 > services

Services
========

host         port  proto  name  state  info
----         ----  -----  ----  -----  ----
10.10.10.15  80    tcp    http  open   Microsoft IIS httpd 6.0
```
