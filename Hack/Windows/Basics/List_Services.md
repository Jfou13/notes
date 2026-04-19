# List services

## Filter by service dysplay name

``` PowerShell
Get-Service -DisplayName "*update*"

Status   Name               DisplayName
------   ----               -----------
Stopped  edgeupdate         Microsoft Edge Update Service (edge...
Stopped  edgeupdatem        Microsoft Edge Update Service (edge...
Running  FoxitReaderUpda... Foxit Reader Update Service
Stopped  tzautoupdate       Auto Time Zone Updater
Running  UsoSvc             Update Orchestrator Service
Stopped  WaaSMedicSvc       Windows Update Medic Service
Running  wuauserv           Windows Update
```
