# nc

## test de port udp
```shell
┌ debian-jfou ~ 
└ # nc -l -u -p 1234  

┌ debian-jfou ~ 
└ # nc -vzu 127.0.0.1 1234
localhost [127.0.0.1] 1234 (?) open

```
## ouvrir un port local

```
nc -lvp 12345
nc -lvp 12345 -s 127.0.0.1
```
