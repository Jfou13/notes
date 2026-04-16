# NFS Footprint

## Nmap

```shell
nmap 10.129.14.128 -p111,2049 -sV -sC
nmap --script nfs* 10.129.14.128 -sV -p111,2049
```

## Exportfs

```shell
exportfs
```

## Interresting files

```shell
cat /etc/exports
```

## Showmount

```shell
showmount -e 10.129.14.128

Export list for 10.129.14.128:
/mnt/nfs 10.129.14.0/24
```

## Mount

```shell
Jfou@htb[/htb]$ mkdir target-NFS
Jfou@htb[/htb]$ sudo mount -t nfs 10.129.14.128:/ ./target-NFS/ -o nolock
Jfou@htb[/htb]$ cd target-NFS
Jfou@htb[/htb]$ tree .

.
└── mnt
    └── nfs
        ├── id_rsa
        ├── id_rsa.pub
        └── nfs.share
```

## List content uid/guid

```shell
ls -n mnt/nfs/

total 16
-rw-r--r-- 1 1000 1000 1872 Sep 25 00:55 cry0l1t3.priv
-rw-r--r-- 1 1000 1000  348 Sep 25 00:55 cry0l1t3.pub
-rw-r--r-- 1    0 1000 1221 Sep 19 18:21 backup.sh
-rw-r--r-- 1    0    0 1872 Sep 19 17:27 id_rsa
-rw-r--r-- 1    0    0  348 Sep 19 17:28 id_rsa.pub
-rw-r--r-- 1    0    0    0 Sep 19 17:22 nfs.share
```