# grep

## Filtrer dans les heures

``` bash
grep -E '2024-06-03 (03:[2-9][1-3]|03:[1-3][0-9])' /var/log/mon_fichier.log
grep -E 'May 30 (09:5[6-9]|10:0[0-2])' /var/log/mon_fichier.log

grep -E '11:[23][0-9]:' /var/log/haproxy/haproxy*.log | awk '{ print $6 }' | sort -n | uniq -c | sort -nr | head -20

grep -E '15:[12][0-9]:' /var/log/haproxy/haproxy.log | awk '{ print $6 }' | sort -n | uniq -c | sort -nr | head -20
```

## avec le subnet

```bash
grep -E '15:[45][0-9]:' /var/log/haproxy/haproxy*.log | awk '{ print $6 }' | awk -F '.' '{ printf "%s.%s.%s.0/24\n", $1, $2, $3 }' | sort -n | uniq -c | sort -nr | head -10

2595 10.XYZ.XYZ.0/24
1414 1.2.3.0/24
```

``` bash
grep -E '1[45678]:[0-9][0-9]:' /var/log/haproxy/haproxy.log | awk '{ print $6 }' | awk -F '.' '{ printf "%s.%s.0.0/16\n", $1, $2 }' | sort -n | uniq -c | sort -nr | head -10

  63408 47.XYZ.0.0/16
   4494 10.XYZ.0.0/16
   ```