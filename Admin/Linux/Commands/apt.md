# apt

## erreur sur un apt update

```
The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7FCC7D46ACCC4CF8
```

resolution

```bash
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8
```


## see all repo

```bash
ls /var/lib/apt/lists/
```

## voir uniquement les paquets security a mettre a jour

```bash
apt-get --just-print upgrade | grep -i security | awk '{print $2}' | awk '!seen[$0]++'
```
