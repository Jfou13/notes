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
hydra -L usernames.txt -p 'password_a_tester' {target_ip} ssh
```