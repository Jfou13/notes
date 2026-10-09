# Touch

## Scan

```shell
┌──(kali㉿kali)-[~/machines/touch]
└─$ nmap -sV -sC -T4 10.129.70.172              
Starting Nmap 7.99 ( https://nmap.org ) at 2026-10-09 17:46 +0200
Nmap scan report for 10.129.70.172
Host is up (0.023s latency).
Not shown: 996 filtered tcp ports (no-response)
PORT     STATE SERVICE       VERSION
135/tcp  open  msrpc         Microsoft Windows RPC
3389/tcp open  ms-wbt-server Microsoft Terminal Service
5985/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
8443/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
| http-title: Nexion DeviceHub - Login
|_Requested resource was /login
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-cors: GET POST PUT OPTIONS
|_http-trane-info: Problem with XML parsing of /evox/about
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 84.27 seconds
```

## Hosts

```shell
10.129.70.172 touch.htb
```
## flag user

## flag root


branche en cours pour ne pas divulger le writeup avant que la machine soit retired