# apropos

## Install

```bash
sudo apt update && sudo apt install man-db
```

## Utlisisation

```bash
apropos partition


addpart (8)          - tell the kernel about the existence of a partition
cfdisk (8)           - display or manipulate a disk partition table
cgdisk (8)           - Curses-based GUID partition table (GPT) manipulator
cryptsetup-luksFormat (8) - initialize a LUKS partition and set the initial passphrase
delpart (8)          - tell the kernel to forget about a partition
fdisk (8)            - manipulate disk partition table
fixparts (8)         - MBR partition table repair utility
gdisk (8)            - Interactive GUID partition table (GPT) manipulator
growpart (1)         - extend a partition in a partition table to fill available space
[...]
```

Lister les commandes dont le nom commence exactement par `net` :

```bash
apropos -r '^net'
```