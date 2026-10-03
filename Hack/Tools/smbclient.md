# smbclient

## Utilisation

```shell
$ smbclient -L {target_IP} -U Administrator
$ smbclient -N -L {target_IP}
```

```shell
$ smbclient //{target_IP}/C$ -U Administrator 
Password for [WORKGROUP\Administrator]:
Try "help" to get a list of possible commands.
smb: \> ls
  $Recycle.Bin                      DHS        0  Wed Apr 21 17:23:49 2021
  Config.Msi                        DHS        0  Wed Jul  7 20:04:56 2021
  Documents and Settings          DHSrn        0  Wed Apr 21 17:17:12 2021
  pagefile.sys                      AHS 738197504  Sat Oct  3 11:11:44 2026
  PerfLogs                            D        0  Sat Sep 15 09:19:00 2018
  Program Files                      DR        0  Wed Jul  7 20:04:24 2021
  Program Files (x86)                 D        0  Wed Jul  7 20:03:38 2021
  ProgramData                        DH        0  Tue Sep 13 18:27:53 2022
  Recovery                         DHSn        0  Wed Apr 21 17:17:15 2021
  System Volume Information         DHS        0  Wed Apr 21 17:34:04 2021
  Users                              DR        0  Wed Apr 21 17:23:18 2021
  Windows                             D        0  Wed Jul  7 20:05:23 2021
```


## mount

```shell
┌──(root㉿kali)-[~]
└─# mount -t cifs //{target_IP}/C$ /mnt/tactics -o username=Administrator
Password for Administrator@//{target_IP}/C$: 
                                                                                                                                                                                                                      
┌──(root㉿kali)-[~]
└─# la /mnt/tactics
total 705M
drwxr-xr-x 2 root root 4.0K Oct  3 11:22  .
drwxr-xr-x 5 root root 4.0K Oct  3 11:47  ..
drwxr-xr-x 2 root root    0 Apr 21  2021 '$Recycle.Bin'
drwxr-xr-x 2 root root    0 Jul  7  2021  Config.Msi
drwx--x--x 2 root root    0 Oct  3 11:49 'Documents and Settings'
-rwxr-xr-x 1 root root 704M Oct  3 11:11  pagefile.sys
drwxr-xr-x 2 root root    0 Sep 15  2018  PerfLogs
drwxr-xr-x 2 root root    0 Sep 13  2022  ProgramData
dr-xr-xr-x 2 root root    0 Jul  7  2021 'Program Files'
drwxr-xr-x 2 root root    0 Jul  7  2021 'Program Files (x86)'
drwxr-xr-x 2 root root    0 Apr 21  2021  Recovery
drwxr-xr-x 2 root root    0 Apr 21  2021 'System Volume Information'
dr-xr-xr-x 2 root root    0 Apr 21  2021  Users
drwxr-xr-x 2 root root    0 Jul  7  2021  Windows

```
