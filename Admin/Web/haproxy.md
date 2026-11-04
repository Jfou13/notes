# haproxy

## commandes de bases

### stats en cli avec netcat

```bash
watch 'echo "show stat" | nc -U /var/lib/haproxy/stats | cut -d "," -f 1,2,5-11,18,24,27,30,36,50,37,56,57,62 | column -s, -t'
```

### stats en cli classique
```bash
echo "show table prd_frontend1"| socat stdio UNIX-CONNECT:/var/lib/haproxy/stats
```

### drain un host dans un backend
```bash
echo "set server backend/host state drain" | nc -U /var/lib/haproxy/stats
```

### drain un frontend
```bash
echo "disable frontend mon_front" | nc -U /var/lib/haproxy/stats
```

### voir des responsetimes 

```bash
root@totoprdrpc2:~ # echo "show stat" | socat stdio /var/lib/haproxy/stats | cut -d "," -f 1-2,16,18,43,44,47,61 | column -s, -t | grep -E 'pxname|prd_admin' | grep -E 'pxname|totoprdweb1'
# pxname                      svname       wretr  status  hrsp_4xx  hrsp_5xx  req_rate  rtime
prd_admin                     totoprdweb1  0      UP      335       45                  11186

root@totoprdrpc2:~ # echo "show stat" | socat stdio /var/lib/haproxy/stats | cut -d "," -f 1-2,41-44,61 | column -s, -t | grep -E 'pxname|prd_admin' | grep -E 'pxname|totoprdweb1'
# pxname                      svname       hrsp_2xx  hrsp_3xx  hrsp_4xx  hrsp_5xx  rtime
prd_admin                     totoprdweb1  24825     3360      336       45        8370

root@totoprdrpc2:~ # echo "show stat" | socat stdio /var/lib/haproxy/stats | cut -d "," -f 1-2,18,41-44,61 | column -s, -t | grep -E 'pxname|prd_admin' | grep -E 'pxname|totoprdweb1'
# pxname                      svname       status  hrsp_2xx  hrsp_3xx  hrsp_4xx  hrsp_5xx  rtime
prd_admin                     totoprdweb1  UP      24828     3361      336       45        8308
```

## voir les status des serveurs du backend avec haproxytool

```bash
    haproxytool server --status
    haproxytool server --disable <server> --backend=<backend>
    haproxytool server --enable <server> --backend=<backend>
    
    haproxytool server --disable apache --backend=ppd_backend1
    haproxytool server --enable apache --backend=ppd_backend1
```

## blacklister les ip digitaloceans

```bash
curl -s https://www.digitalocean.com/geo/google.csv | awk -F ',' '{ print $1 }' | grep -v "::/" > /etc/haproxy/do_ips.txt
```

```
     acl is_digitalocean src -f /etc/haproxy/do_ips.txt
     acl is_digitalocean hdr_ip(x-forwarded-for) -f /etc/haproxy/do_ips.txt
	 http-request deny if is_digitalocean
```

## mettre un host en maintenance

```
## Frontend
use_backend prd_backend1 if { src 1.2.3.4/32 5.6.7.8/32 }
use_backend bk_maintenance if { hdr(Host) -i www.toto.com }


## Backend
backend bk_maintenance_migration
     errorfile 503 /etc/haproxy/errors/maintenance.html
     mode http
backend prd_backend1
     mode http
     http-request set-header X-Forwarded-Port %[dst_port]
     server host1 10.1.2.3:8080 check inter 3s
     server host2 10.1.2.4:8080 check inter 3s
```
