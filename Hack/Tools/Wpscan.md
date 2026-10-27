# wpscan

## enumeration

### 1) repérage léger, sans API
```shell
wpscan --url https://cible.com --random-user-agent -e u,cb,dbe
```
### 2) scan ciblé avec l'API, une fois les plugins connus 

```shell
wpscan --url https://cible.com --api-token {TOKEN} -e vp,vt --plugins-detection mixed
```

```shell
wpscan --update wpscan --url https://cible.com --api-token {token} -e vp,vt,tt,cb,dbe,u,m --plugins-detection mixed --themes-detection mixed --random-user-agent --request-timeout 20 --max-threads 10 -o wpscan-cible.txt --format cli-no-color --disable-tls-checks
```

|Option|Rôle|
|---|---|
|`-e vp,vt`|plugins et thèmes **vulnérables** uniquement (économise les requêtes API)|
|`-e ap,at`|**tous** les plugins / thèmes installés (coûteux en requêtes API)|
|`-e u` ou `u1-100`|énumération des utilisateurs (ou une plage) 1|
|`-e cb,dbe`|backups de `wp-config.php` et exports de base de données|
|`-e bf`|dossiers de sauvegarde laissés par les plugins de backup 1|
|`-e m`|médias (peut révéler des users via les auteurs)|
|`--plugins-detection mixed`|`passive` (défaut) = rapide mais incomplet ; `mixed` = bien meilleur compromis ; `aggressive` = complet mais bruyant 1|
|`--random-user-agent`|évite le blocage par User-Agent|
|`--max-threads 10` / `--throttle 500`|ralentir si le serveur renvoie des 429/503|
|`--disable-tls-checks`|utile sur certificat auto-signé|
|`--ignore-main-redirect`|ne pas suivre la redirection vers un autre domaine|


```shell
wpscan --url http://blog.inlanefreight.local/ --enumerate --api-token cBsXg7
```

## WordPress User Bruteforce
```shell
┌──(root㉿kaljfou)-[~]
└─# wpscan --password-attack xmlrpc -t 20 --usernames admin,roger --passwords /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt --url http://154.57.164.82:31010  


