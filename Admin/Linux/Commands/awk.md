# awk commandes pratiques

## transformer des ip en ip /16

```bash
docker exec -ti traefik grep "/users/sign_in" /var/log/access.log | awk '{ print $1 }' | awk -F '.' '{ printf "%s.%s.0.0/16\n", $1, $2 }' | sort -n | uniq -c | sort -nr | head -n 20 
308 138.199.0.0/16 
246 156.146.0.0/16 
243 185.177.0.0/16 
133 193.176.0.0/16 
129 84.239.0.0/16 
64 87.249.0.0/16
[...]
```