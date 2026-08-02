# Domain Information

## Présence en ligne
### crt.sh
```shell
$ DOMAIN=inlanefreight.com; curl -s https://crt.sh/\?q\=$DOMAIN\&output\=json | jq . | grep name | cut -d":" -f2 | grep -v "CN=" | cut -d'"' -f2 | awk '{gsub(/\\n/,"\n");}1;' | sort -u

account.ttn.inlanefreight.com
blog.inlanefreight.com
bots.inlanefreight.com
[...]
```

```shell
$ for i in $(cat subdomainlist);do host $i | grep "has address" | grep inlanefreight.com | cut -d" " -f1,4;done

blog.inlanefreight.com 10.129.24.93
inlanefreight.com 10.129.27.33
matomo.inlanefreight.com 10.129.127.22
```

### shodan
```shell
$ for i in $(cat subdomainlist);do host $i | grep "has address" | grep inlanefreight.com | cut -d" " -f4 >> ip-addresses.txt;done
$ for i in $(cat ip-addresses.txt);do shodan host $i;done
```

### dig
```shell
dig any inlanefreight.com
```

## subfinder

```bash
┌──(root㉿kaljfou)-[~]
└─# subfinder -d domaine.fr

               __    _____           __
   _______  __/ /_  / __(_)___  ____/ /__  _____
  / ___/ / / / __ \/ /_/ / __ \/ __  / _ \/ ___/
 (__  ) /_/ / /_/ / __/ / / / / /_/ /  __/ /
/____/\__,_/_.___/_/ /_/_/ /_/\__,_/\___/_/

                projectdiscovery.io

[INF] Current subfinder version v2.14.0 (latest)
[INF] Loading provider config from /root/.config/subfinder/provider-config.yaml
[INF] Enumerating subdomains for domaine.fr
ip.domaine.fr
letme.domaine.fr
osint.domaine.fr
webcheck.domaine.fr
uptime.domaine.fr
www.domaine.fr
[INF] Found 18 subdomains for domaine.fr in 5 seconds 205 milliseconds
```