# NMAP

## SMTP

```bash
sudo nmap 10.129.14.128 -sC -sV -p25
sudo nmap 10.129.14.128 -p25 --script smtp-open-relay -v
```

## Mysql

```bash
sudo nmap 10.129.14.128 -sV -sC -p3306 --script mysql*
```

## MSSQL

```bash
sudo nmap --script ms-sql-info,ms-sql-empty-password,ms-sql-xp-cmdshell,ms-sql-config,ms-sql-ntlm-info,ms-sql-tables,ms-sql-hasdbaccess,ms-sql-dac,ms-sql-dump-hashes --script-args mssql.instance-port=1433,mssql.username=sa,mssql.password=,mssql.instance-name=MSSQLSERVER -sV -p 1433 10.129.201.248
```

## oracle

```bash
sudo nmap -p1521 -sV 10.129.204.235 --open
sudo nmap -p1521 -sV 10.129.204.235 --open --script oracle-sid-brute
```

## IPMI

```bash
sudo nmap -sU --script ipmi-version -p 623 ilo.inlanfreight.local
```