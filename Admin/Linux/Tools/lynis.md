# Lynis

## Install

```shell
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://packages.cisofy.com/keys/cisofy-software-public.key | sudo gpg --dearmor -o /etc/apt/keyrings/cisofy-archive-keyring.gpg
sudo apt update
sudo apt install lynis
lynis update check
lynis update info
```

## audit

```shell
sudo lynis audit system
sudo lynis audit system --wait
```
le `--wait` permet d'appuyer sur entrée entre chaque test.


### Lister uniquement les avertissements (priorité haute)

```shell
sudo grep -E "^warning\[\]=" /var/log/lynis-report.dat
warning[]=PKGS-7392|Found one or more vulnerable packages.|-|-|
```

```shell
sudo lynis show details PKGS-7392
```