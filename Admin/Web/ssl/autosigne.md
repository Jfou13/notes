# ssl autosigné

## exemple d'autosigné sur 10 ans pour pureftpd

```shell
openssl req -newkey rsa:2048 -nodes -'sha256' -x509 -subj '/C=FR/ST=Ile-De-France/L=Paris/O=IT/CN=ftp.monsite.fr' -days '3650' -keyout '/etc/ssl/private/pure-ftpd.pem' -out '/etc/ssl/private/pure-ftpd.pem' -extensions 'v3_ca'

systemctl restart pure-ftpd.service

```
