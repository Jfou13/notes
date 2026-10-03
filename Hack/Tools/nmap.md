# NMAP

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
```

