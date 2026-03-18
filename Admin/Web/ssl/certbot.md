# certbot

## Révoquer un ssl

```bash
certbot revoke --cert-path /etc/letsencrypt/archive/domaine.fr/fullchain1.pem
```

## supprimer un ssl

```bash
certbot delete --cert-name mon-site.com
```

## créer un ssl sans webserver

```yml
acl is_acme path_beg -i /.well-known/acme-challenge
use_backend letsencrypt if is_acme

backend letsencrypt
     mode http
     server certbot_monhost monhost:8888 maxconn 5
```

```bash
certbot certonly -m me@mail.fr --agree-tos -d <domaine> --deploy-hook /usr/local/bin/letsencrypt_renew_hook.sh --http-01-port=8888 --non-interactive --standalone
```

```shell
domain=monsite.fr && certbot certonly -m me@mail.fr --agree-tos -d $domain -d www.$domain --deploy-hook /usr/local/bin/letsencrypt_renew_hook.sh --http-01-port=8888 --non-interactive --standalone
```
