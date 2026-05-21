# Find

## Where

```shell
C:\Users\student\Desktop>where calc.exe

C:\Windows\System32\calc.exe
```
```shell
C:\Users\student\Desktop>where /R C:\Users\student\ bio.txt

C:\Users\student\Downloads\bio.txt
```
```shell
C:\Users\student\Desktop>where /R C:\Users\student\ *.csv

C:\Users\student\AppData\Local\live-hosts.csv
```

## Find

```shell
C:\Users\student\Desktop> find "password" "C:\Users\student\not-passwords.txt"
C:\Users\student\Desktop> find /N /I /V "IP Address" example.txt
```

## Findstr

```shell
C:\Users\student\Desktop> findstr
```

## Compare

```shell
C:\Users\student\Desktop> comp .\file-1.md .\file-2.md

Comparing .\file-1.md and .\file-2.md...
Files compare OK
```

## FC
```shell
C:\htb> fc.exe /?


C:\Users\student\Desktop> fc passwords.txt modded.txt /N

Comparing files passwords.txt and MODDED.TXT
***** passwords.txt
    1:  123456
    2:  password
***** MODDED.TXT
    1:  123456
    2:
    3:  password
*****

***** passwords.txt
    5:  12345
    6:  qwerty
***** MODDED.TXT
    6:  12345
    7:  Just something extra to show functionality. Did it see the space inserted above?
    8:  qwerty
*****
```

## Sort
```shell
C:\Users\student\Desktop> type .\file-1.md
a
b
d
h
w
a
q
h
g

C:\Users\MTanaka\Desktop> sort.exe .\file-1.md /O .\sort-1.md
C:\Users\MTanaka\Desktop> type .\sort-1.md

a
a
b
d
g
h
h
q
w
```
## unique
```shell
C:\htb> type .\sort-1.md

a
a
b
d
g
h
h
q
w

PS C:\Users\MTanaka\Desktop> sort.exe .\sort-1.md /unique

a
b
d
g
h
q
w
```

