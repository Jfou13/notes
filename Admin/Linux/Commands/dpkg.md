# dpkg

## voir le contenu d'un fichier .deb

```bash

root@mon_serveur:~ # dpkg -c zabbix-release_6.0-5+debian12_all.deb
drwxr-xr-x root/root         0 2022-11-01 12:12 ./
drwxr-xr-x root/root         0 2022-11-01 12:12 ./etc/
drwxr-xr-x root/root         0 2022-11-01 12:12 ./etc/apt/
drwxr-xr-x root/root         0 2022-11-01 12:12 ./etc/apt/sources.list.d/
-rw-r--r-- root/root       305 2022-11-01 12:12 ./etc/apt/sources.list.d/zabbix.list
...
```
