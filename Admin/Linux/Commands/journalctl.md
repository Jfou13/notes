# journalctl

## Chercher les logs dans journalctl sur une période donnée

``` bash
journalctl -u apache2 --since "2024-08-12 05:59:30" --until "2024-08-12 06:30:00"
```

## pruner les journaux 

``` bash
journalctl --vacuum-time=7d
```