# Curl

### curl local avec resolve

``` bash
curl -I --resolve monsite.fr:80:127.0.0.1 http://monsite.fr
curl -I --resolve monsite.fr:443:127.0.0.1 https://monsite.fr
```

### curl local

``` bash
curl -IXGET -k -H "Host: www.monsite.fr" https://127.0.0.1:443
```

### curl avec TTFB

``` bash
$ curl -o /dev/null -H 'Cache-Control: no-cache' -s -w "Connect: %{time_connect} \nTTFB: %{time_starttransfer} \nTotal time: %{time_total} \n" https://www.test.com
Connect: 0.022591
TTFB: 1.351994
Total time: 1.500310
```

