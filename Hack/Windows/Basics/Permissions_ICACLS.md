# Permissions

## ICACLS (Integrity Control Access Control List)

``` shell
C:\htb> icacls c:\Users
c:\Users NT AUTHORITY\SYSTEM:(OI)(CI)(F)
         BUILTIN\Administrators:(OI)(CI)(F)
         BUILTIN\Users:(RX)
         BUILTIN\Users:(OI)(CI)(IO)(GR,GE)
         Everyone:(RX)
         Everyone:(OI)(CI)(IO)(GR,GE)

Successfully processed 1 files; Failed processing 0 files
```

```shell
C:\htb> icacls c:\users /grant joe:f
processed file: c:\users
Successfully processed 1 files; Failed processing 0 files

C:\htb> icacls c:\Users
c:\users WS01\joe:(F)
         NT AUTHORITY\SYSTEM:(OI)(CI)(F)
         BUILTIN\Administrators:(OI)(CI)(F)
         BUILTIN\Users:(RX)
         BUILTIN\Users:(OI)(CI)(IO)(GR,GE)
         Everyone:(RX)
         Everyone:(OI)(CI)(IO)(GR,GE)

Successfully processed 1 files; Failed processing 0 files

```

The resource access level is listed after each user in the output. The possible inheritance settings are:

    (CI): container inherit
    (OI): object inherit
    (IO): inherit only
    (NP): do not propagate inherit
    (I): permission inherited from parent container

Basic access permissions are as follows:

    F : full access
    D :  delete access
    N :  no access
    M :  modify access
    RX :  read and execute access
    R :  read-only access
    W :  write-only access