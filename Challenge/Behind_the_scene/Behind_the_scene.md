# Behind the scene

```shell
$ ./behindthescenes
./challenge <password>
```
```shell
$ ltrace ./behindthescenes toto
--- SIGILL (Illegal instruction) ---
--- SIGILL (Illegal instruction) ---
--- SIGILL (Illegal instruction) ---
+++ exited (status 0) +++
```

## ghidra
```shell
apt install ghidra
```

Disassemble

![behind_the_scne_1](behind_the_scne_1.png)
![behind_the_scne_2](behind_the_scne_2.png)


```shell
$ ./behindthescenes Itz*****y_UD2
> HTB{Itz*****y_UD2}
```
