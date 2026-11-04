# Varnish

## commande utiles

voir les hosts du pool

``` bash
$ varnishadm backend.list
```

stopper l'utilisation d'un host du pool

``` bash
$ varnishadm backend.set_health mon_backend_name sick
```

rétablir l'utilisation d'un host du pool

``` bash
$ varnishadm backend.set_health mon_backend_name auto
```

## vérifier les logs varnishncsa

filtrer via le header "host":

``` bash
$ varnishlog -q 'ReqHeader ~ "Host: example.com"'
```

filtrer via l'url:

``` bash
$ varnishlog -q 'ReqURL ~ "^/some/path/"'
```

filtrer par IP (derrière un reverse proxy):

``` bash
$ varnishlog -q 'ReqHeader ~ "X-Real-IP: .*123.123.123.123"'
```

filtrer par header "host" ET par url ET par header "referrer"

``` bash
$ varnishlog -q 'ReqHeader ~ "Host: (www\.)?example\.com"' -i "ReqURL" -I "ReqHeader:Referer:"
```

filtrer par code http

``` bash
varnishlog -q "RespStatus ~ 301"
```
