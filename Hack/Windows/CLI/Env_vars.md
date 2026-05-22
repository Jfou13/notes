# Environment Variables

## Show env vars:

```shell
C:\Users\alice> set SECRET=HTB{5UP3r_53Cr37_V4r14813}

C:\Users\alice> echo %SECRET%
HTB{5UP3r_53Cr37_V4r14813}



C:\Users\htb\>echo %PATH%

C:\Users\htb\Desktop
```

## set and setx

`set` = temporaire
`setx` = permanent

L'écriture est différente
```shell
C:\htb> set DCIP=172.16.5.2

C:\htb> setx DCIP 172.16.5.2
SUCCESS: Specified value was saved.

C:\htb> setx DCIP ""
SUCCESS: Specified value was saved.
```
