# Organization

## Organization
```shell
Cry0l1t3@htb[/htb]$ tree ..

└── Penetration-Testing
    │
    ├── Pre-Engagement
    │       └── ...
    ├── Linux
    │   ├── Information-Gathering
    │   │   └── ...
    │   ├── Vulnerability-Assessment
    │   │   └── ...
    │   ├── Exploitation
    │   │   └── ...
    │   ├── Post-Exploitation
    │   │   └── ...
    │   └── Lateral-Movement
    │       └── ...
    ├── Windows
    │   ├── Information-Gathering
    │   │   └── ...
    │   ├── Vulnerability-Assessment
    │   │   └── ...
    │   ├── Exploitation
    │   │   └── ...
    │   ├── Post-Exploitation
    │   │   └── ...
    │   └── Lateral-Movement
    │       └── ...
    ├── Reporting
    │   └── ...
    └── Results
        └── ...

```

```shell
Cry0l1t3@htb[/htb]$ tree ..

└── Penetration-Testing
    │
    ├── Pre-Engagement
    │       └── ...
    ├── Network-Pentesting
    │       ├── Linux
    │       │   ├── Information-Gathering
    │       │   │   └── ...
    │       │   ├── Vulnerability-Assessment
    │       │   │   └── ...
    │       │   └── ...
    │       │       └── ...
    │       ├── Windows
    │       │   ├── Information-Gathering
    │       │   │   └── ...
    │       │   └── ...
    │       └── ...
    ├── WebApp-Pentesting
    │       └── ...
    ├── Social-Engineering
    │       └── ...
    ├── .......
    │       └── ...
    ├── Reporting
    │   └── ...
    └── Results
        └── ...
```

## Results

For this, we can use [GhostWriter](https://github.com/GhostManager/Ghostwriter) or [Pwndoc](https://github.com/pwndoc/pwndoc).

## Logging

### PS1
```shell
PS1="\[\033[1;32m\]\342\224\200\$([[ \$(/opt/vpnbash.sh) == *\"10.\"* ]] && echo \"[\[\033[1;34m\]\$(/opt/vpnserver.sh)\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]\$(/opt/vpnbash.sh)\[\033[1;32m\]]\342\224\200\")[\[\033[1;37m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]\w\[\033[1;32m\]]\n\[\033[1;32m\]\342\224\224\342\224\200\342\224\200\342\225\274 [\[\e[01;33m\]$(date +%D-%r)\[\e[01;32m\]]\\$ \[\e[0m\]"
```

### Date
```shell
─[eu-academy-1]─[10.10.14.2]─[Cry0l1t3@htb]─[~]
└──╼ [03/21/21-01:45:04 PM]$
```

### Script

```shell
Cry0l1t3@htb[/htb]$ script 03-21-2021-0200pm-exploitation.log
Cry0l1t3@htb[/htb]$ <ALL THE COMMANDS>
Cry0l1t3@htb[/htb]$ exit
```