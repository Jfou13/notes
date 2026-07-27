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