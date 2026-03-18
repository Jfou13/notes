# commandes pratiques

## voir les ssl expirés
```bash
┌ debian-jfou ~ 
└ # 
find /etc/haproxy/ssl/certs/ -name "*.pem" -exec sh -c 'END_DATE_STR=$(openssl x509 -in "$1" -noout -enddate 2>/dev/null | cut -d= -f2 | xargs); if [ -n "$END_DATE_STR" ]; then END_DATE_SEC=$(date -d "$END_DATE_STR" +%s); DAYS_REMAINING=$(( (END_DATE_SEC - $(date +%s)) / 86400 )); if [ "$DAYS_REMAINING" -lt 15 ]; then echo "ALERTE: Le certificat $1 expire dans $DAYS_REMAINING jours, le $END_DATE_STR."; fi; fi' _ {} \;  

ALERTE: Le certificat /etc/haproxy/ssl/certs/test.jfou.fr.pem expire dans -555 jours, le Feb 23 19:12:22 2024 GMT.
```