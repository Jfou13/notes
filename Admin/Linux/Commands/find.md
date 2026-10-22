# find

Chercher les dossiers appartenant à l'utilisateur root

``` bash
find /var/www/sites/*/releases/ -type d -uid 0
```

## Chercher les fichiers qui ne sont pas bz2 et les bziper

``` bash
find /var/log/dossier/2024/09/2{6..9} -type f -not -name \*.bz2 -exec bzip2 \{\} \;
```

## Fichier plus vieux de 1 an à déplacer dans un autre dossier


```bash
find /sourcedirectory -maxdepth 1 -mtime +365 -type f -exec ls -l {} ￼￼;
find /sourcedirectory -maxdepth 1 -mtime +365 -type f -exec mv "{}" /destination/directory/ \;
```

## Faire un tri récursif des fichier les plus récents dans un répertoire


```bash
find . -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort
```

## chercher des fichiers entre 2 dates

```shell
find /var/www/sites/monsite.fr/ -type f -newermt "2025-10-16" ! -newermt "2025-10-17"
```

## connaitre le poids des fichiers dans le find


```bash
find /var/www/sites/test/shared/ -name "*.pdf" -mtime +620 -exec du -sh {} \;
```

### avec le total du poids

```bash
find /var/cache/apt -name "test*_amd64.deb" -exec du -ch {} + | grep total; 
3.0G	total
```

## Passer les dossiers en 755 et fichiers en 644

```bash
find /desired_location -type d -print0 | xargs -0 chmod 0755
```

``` bash
find /desired_location -type f -print0 | xargs -0 chmod 0644
```


