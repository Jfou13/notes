# systemctl

## Voir les services en état running

``` bash
systemctl list-units --state=running |awk '{print $1}' | head -n50 |grep service | sed 's/.service//'
```
