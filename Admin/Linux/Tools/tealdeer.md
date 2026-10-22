# tealdeer

## Install

```shell
apt install tealdeer
```

## Utilisation

```shell
tldr --update
tldr ln
tldr john
tldr ...
```

## Exemple

```shell
 tldr john

  Password cracker.
  More information: <https://www.openwall.com/john/>.

  Crack password hashes:

      john path/to/hashes.txt

  Show passwords cracked:

      john --show path/to/hashes.txt

  Display users cracked passwords by user identifier from multiple files:

      john --show --users=user_ids path/to/hashes1.txt path/to/hashes2.txt ...

  Crack password hashes, using a custom wordlist:

      john --wordlist=path/to/wordlist.txt path/to/hashes.txt

[...SNIP...]
```