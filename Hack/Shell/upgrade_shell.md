# upgrade shell

## visu shell

```shell
echo $SHELL # profil
echo $0 # actuel
```

## Python PTY Module

Spawn `/bin/bash` using [Python's PTY module](https://docs.python.org/3/library/pty.html), and connect the controlling shell with its standard I/O.

```sh
python -c 'import pty; pty.spawn("/bin/bash")'
python3 -c 'import pty;pty.spawn("/bin/bash")'
```
```bash
python3 -c 'import pty;pty.spawn("/bin/bash")'
ctrl+z
stty raw -echo; fg
<entrée>
<entrée>
export TERM=xterm
```

pour que `vi` ou `tab` fonctionne bien il faut vérifier la taille de son écran avec
```bash
stty size
27 164
```
et sur le shell distant
```bash
stty rows 27 cols 164
```

## Shell to Bash

```bash
SHELL=/bin/bash script -q /dev/null
```
```bash
script /dev/null -c bash
```

## TTY upgrade

```shell
script /dev/null -c bash
# Ctrl+Z
stty raw -echo; fg
reset xterm
export TERM=xterm
export SHELL=bash
stty rows 27 cols 164
```