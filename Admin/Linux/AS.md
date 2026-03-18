# AS

## Liste d'ip dans un AS

```bash
└─$ whois -h whois.radb.net -- '-i origin AS54115' | grep ^route | awk '{print $2}' 
163.114.128.0/20
163.114.128.0/24
163.114.129.0/24
```


## voir l'as d'une ip
```bash
└─● $ whois -h whois.cymru.com " -v 154.94.63.33"
AS      | IP               | BGP Prefix          | CC | Registry | Allocated  | AS Name
22773   | 154.94.63.33     | 154.94.63.0/24      | SC | afrinic  | 2013-07-24 | ASN-CXA-ALL-CCI-22773-RDC - Cox Communications Inc., US
```

```bash
└─● $ dig +short 33.63.94.154.origin.asn.cymru.com TXT
"35916 | 154.94.0.0/17 | SC | afrinic | 2013-07-24"
"22773 | 154.94.63.0/24 | SC | afrinic | 2013-07-24"
```
