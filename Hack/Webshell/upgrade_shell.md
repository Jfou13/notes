# upgrade shell

## Python PTY Module

Spawn `/bin/bash` using [Python's PTY module](https://docs.python.org/3/library/pty.html), and connect the controlling shell with its standard I/O.

```sh
python -c 'import pty; pty.spawn("/bin/bash")'
python3 -c 'import pty;pty.spawn("/bin/bash")'
```

## Shell to Bash

```bash
SHELL=/bin/bash script -q /dev/null
```
```bash
script /dev/null -c bash
```
