# SMTP

## nmap

```bash
sudo nmap 10.129.14.128 -sC -sV -p25
sudo nmap 10.129.14.128 -p25 --script smtp-open-relay -v
```


## smtp-user-enum
### Enumerate the SMTP service even further and find the username that exists on the system. Submit it as the answer.

```bash
┌──(root㉿kali)-[~]
└─# wget https://raw.githubusercontent.com/boboaung1337/wordlists/refs/heads/main/footprinting-wordlist.txt

┌──(root㉿kali)-[~]
└─# smtp-user-enum -U /home/kali/Desktop/footprinting-wordlist.txt -t 10.129.122.219 
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
######## Scan completed at Fri Jul 24 15:05:47 2026 #########
0 results.

210 queries in 210 seconds (1.0 queries / sec)

```
On augmente le timeout et on spécifi la méthode
```bash
┌──(root㉿kali)-[~]
└─# smtp-user-enum -U /home/kali/Desktop/footprinting-wordlist.txt -t 10.129.122.219 -M VRFY -w 20
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
Query timeout ............ 20 secs
Target domain ............ 

######## Scan started at Fri Jul 24 15:10:32 2026 #########
10.129.122.219: root exists
10.129.122.219: mysql exists
10.129.122.219: root exists
10.129.122.219: robin exists
10.129.122.219: root exists
10.129.122.219: robin exists
10.129.122.219: robin exists
10.129.122.219: robin exists
######## Scan completed at Fri Jul 24 15:17:28 2026 #########
8 results.

210 queries in 416 seconds (0.5 queries / sec)

```