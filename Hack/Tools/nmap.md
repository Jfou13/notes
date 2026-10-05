# NMAP

## bypassing firewall restrictions for service scanning and host discovery

```bash
sudo nmap -sC -A -Pn {target_IP}
```
```
-sC : Equivalent to --script=default
-A : Enable OS detection, version detection, script scanning, and traceroute
-Pn : Treat all hosts as online -- skip host discovery
```

## SMTP

```bash
sudo nmap {target_IP} -sC -sV -p25
sudo nmap {target_IP} -p25 --script smtp-open-relay -v
```

## Mysql

```bash
sudo nmap {target_IP} -sV -sC -p3306 --script mysql*
```

## MSSQL

```bash
sudo nmap --script ms-sql-info,ms-sql-empty-password,ms-sql-xp-cmdshell,ms-sql-config,ms-sql-ntlm-info,ms-sql-tables,ms-sql-hasdbaccess,ms-sql-dac,ms-sql-dump-hashes --script-args mssql.instance-port=1433,mssql.username=sa,mssql.password=,mssql.instance-name=MSSQLSERVER -sV -p 1433 {target_IP}
```

## oracle

```bash
sudo nmap -p1521 -sV {target_IP} --open
sudo nmap -p1521 -sV {target_IP} --open --script oracle-sid-brute
```

## IPMI

```bash
sudo nmap -sU --script ipmi-version -p 623 ilo.inlanfreight.local
```

## UDP

```bash
sudo nmap -sU -T4 {target_IP} --top-ports 20
Nmap done: 1 IP address (1 host up) scanned in 4.97 seconds

sudo nmap -sU -T4 {target_IP} --top-ports 20 -sV
Nmap done: 1 IP address (1 host up) scanned in 108.16 seconds
```

