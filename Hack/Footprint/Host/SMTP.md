# SMTP

## nmap

```bash
sudo nmap 10.129.14.128 -sC -sV -p25
sudo nmap 10.129.14.128 -p25 --script smtp-open-relay -v
```


## smtp-user-enum
### Enumerate the SMTP service even further and find the username that exists on the system. Submit it as the answer.

```bash
smtp-user-enum -U /home/kali/Desktop/footprinting-wordlist.txt -t 10.129.122.219 
Starting smtp-user-enum v1.2 ( http://pentestmonkey.net/tools/smtp-user-enum )

 ----------------------------------------------------------
|                   Scan Information                       |
 ----------------------------------------------------------

Mode ..................... VRFY
Worker Processes ......... 5
Usernames file ........... /home/kali/Desktop/footprinting-wordlist.txt
Target count ............. 1
Username count ........... 210
Target TCP port .......... 25
Query timeout ............ 5 secs
Target domain ............ 

######## Scan started at Fri Jul 24 15:02:17 2026 #########
```