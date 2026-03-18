# Git cheat-sheet

## historique de modification pour un fichier

``` bash
git log -p <monfichier>

git show <COMMIT> <FILE>
```

## Comparer un répertoire spécifique avec le dernier commit

``` bash
git diff HEAD -- chemin/vers/repertoire/

# Ou simplement (HEAD est implicite)
git diff -- chemin/vers/repertoire/
```
## restaurer un fichier en fonction d'un commit

Assuming the hash of the commit you want is c5f567:

``` bash
git checkout c5f567 -- file1/to/restore file2/to/restore
ou pour un dossier 
git checkout 2b86 -- /etc/letsencrypt/renewal/
```

## Historique de modification dans un dossier

``` bash
git log --name-status -10 ./
```

## ignorer un fichier non pris en compte par gitignore

### ignorer
`git update-index --assume-unchanged ansible.cfg`
### voir la liste
`git ls-files -v | grep '^[[:lower:]]'` 
### désignorer
`git update-index --no-assume-unchanged ansible.cfg` Edited