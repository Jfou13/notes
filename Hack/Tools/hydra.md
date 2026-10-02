# hydra

## utilisation

```shell
cat usernames.txt

optimus
albert
andreas
christine
```

```shell
hydra -L usernames.txt -p 'le_password' {target_ip} ssh
```