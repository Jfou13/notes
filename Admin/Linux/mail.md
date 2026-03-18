# mail cheat-sheet

## Envoyer des mail en cli

### via mail

```bash
    mail -s "test mail" me@mail.fr < /dev/null
```
### en spécifiant le mail FROM
```bash
    mail -s "test mail" -r "toto<toto@gmail.com>" me@mail.fr < /dev/null
```
## Sources utiles

<https://www.interserver.net/tips/kb/linux-mail-command-usage-examples/>

## Postfix

### purge mail deferred
```bash
postsuper -d ALL deferred
```
