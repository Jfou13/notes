# Powershell commands
## voir le contenu d'un fichier

GC pour get-content
```powershell
gc monfichier.txt
```

## faire un head sur un fichier

``` powershell
PS C:\> Get-Content .\healthcheck.log | Select-Object -First 10
System health check at 2025-02-24 14:26:46 - CPU Usage: 12%
System health check at 2025-02-24 14:28:47 - CPU Usage: 4%
System health check at 2025-02-24 14:30:47 - CPU Usage: 7%
System health check at 2025-02-24 14:32:47 - CPU Usage: 4%
System health check at 2025-02-24 14:34:47 - CPU Usage: 2%
System health check at 2025-02-24 14:36:47 - CPU Usage: 2%
System health check at 2025-02-24 14:38:47 - CPU Usage: 3%
System health check at 2025-02-24 14:40:46 - CPU Usage: 3%
System health check at 2025-02-24 14:42:46 - CPU Usage: 2%
System health check at 2025-02-24 14:44:46 - CPU Usage: 7%
```
ou 
``` powershell
PS C:\> gc .\healthcheck.log | select -first 5
System health check at 2025-02-24 14:26:46 - CPU Usage: 12%
System health check at 2025-02-24 14:28:47 - CPU Usage: 4%
System health check at 2025-02-24 14:30:47 - CPU Usage: 7%
System health check at 2025-02-24 14:32:47 - CPU Usage: 4%
System health check at 2025-02-24 14:34:47 - CPU Usage: 2%

```

