# gobuster

## Utilisation

### **Dir Busting**
```bash
gobuster dir --url http://{target_IP}/ --wordlist /usr/share/wordlists/dirb/big.txt

gobuster dir -x .php -u http://{target_IP} -w /usr/share/wordlists/dirbuster/directory-list-1.0.txt
gobuster dir -x php -u http://{target_IP} -w /usr/share/wordlists/dirb/common.txt
```

### **Subdomain enumeration**

```bash
sudo mkdir -p /opt/useful/SecLists/Discovery/DNS/
sudo wget -O /opt/useful/SecLists/Discovery/DNS/subdomains-top1million-5000.txt https://raw.githubusercontent.com/danielmiessler/SecLists/refs/heads/master/Discovery/DNS/subdomains-top1million-5000.txt
gobuster vhost -w /opt/useful/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -u http://thetoppers.htb
gobuster vhost -w /opt/useful/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -u http://thetoppers.htb --append-domain
gobuster dir --url http://ignition.htb --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt
```
list
https://github.com/daviddias/node-dirbuster/blob/master/lists/directory-list-2.3-small.txt