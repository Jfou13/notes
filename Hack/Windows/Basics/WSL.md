# WSL

## Activer WSL

```shell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

On lance un bash pour valider

```shell
PS C:\Users\jfou> uname
uname : Le terme «uname» n'est pas reconnu comme nom d'applet de commande, fonction, fichier de script ou programme
exécutable. Vérifiez l'orthographe du nom, ou si un chemin d'accès existe, vérifiez que le chemin d'accès est correct
et réessayez.
Au caractère Ligne:1 : 1
+ uname
+ ~~~~~
    + CategoryInfo          : ObjectNotFound: (uname:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

PS C:\Users\jfou> bash
jfou@PC:/mnt/c/Users/jfou$ uname
Linux
```
