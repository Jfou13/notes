# upgrade en echec

## Vérifier que tout est bien configuré

```shell
sudo dpkg --configure -a
sudo apt --fix-broken install
```

## Installer toutes les mises à jour de sécurité

```shell
sudo apt update
sudo apt upgrade
sudo apt full-upgrade
```
## Vérifier l'état de GRUB (important !)

```shell
sudo update-grub
reboot
```

## Autre info

### Un processus de mise à niveau tourne encore

Si vous voyez `do-release-upgrade` ou un processus `apt/dpkg` actif :

bash

```shell
# Surveillez sa progression
sudo tail -f /var/log/dist-upgrade/main.log
# ou
sudo tail -f /var/log/apt/term.log
```