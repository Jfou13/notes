# Managing Services

## SC

### Query
```shell
C:\htb> sc query type= service

SERVICE_NAME: Appinfo
DISPLAY_NAME: Application Information
        TYPE               : 30  WIN32
        STATE              : 4  RUNNING
                                (STOPPABLE, NOT_PAUSABLE, IGNORES_SHUTDOWN)
        WIN32_EXIT_CODE    : 0  (0x0)
        SERVICE_EXIT_CODE  : 0  (0x0)
        CHECKPOINT         : 0x0
        WAIT_HINT          : 0x0

SERVICE_NAME: AppXSvc
DISPLAY_NAME: AppX Deployment Service (AppXSVC)
        TYPE               : 30  WIN32
        STATE              : 4  RUNNING
                                (STOPPABLE, NOT_PAUSABLE, ACCEPTS_SHUTDOWN)
        WIN32_EXIT_CODE    : 0  (0x0)
        SERVICE_EXIT_CODE  : 0  (0x0)
        CHECKPOINT         : 0x0
        WAIT_HINT          : 0x0
<SNIP>
```

```shell
C:\htb> sc query windefend    

SERVICE_NAME: windefend
        TYPE               : 10  WIN32_OWN_PROCESS
        STATE              : 4  RUNNING
                                (NOT_STOPPABLE, NOT_PAUSABLE, ACCEPTS_SHUTDOWN)
        WIN32_EXIT_CODE    : 0  (0x0)
        SERVICE_EXIT_CODE  : 0  (0x0)
        CHECKPOINT         : 0x0
        WAIT_HINT          : 0x0
```

### Stop / start
```shell
C:\htb> sc stop windefend

Access is denied.
```

```shell
C:\WINDOWS\system32> sc stop Spooler

SERVICE_NAME: Spooler
        TYPE               : 110  WIN32_OWN_PROCESS  (interactive)
        STATE              : 3  STOP_PENDING
                                (NOT_STOPPABLE, NOT_PAUSABLE, IGNORES_SHUTDOWN)
        WIN32_EXIT_CODE    : 0  (0x0)
        SERVICE_EXIT_CODE  : 0  (0x0)
        CHECKPOINT         : 0x3
        WAIT_HINT          : 0x4e20

C:\WINDOWS\system32> sc query Spooler

SERVICE_NAME: Spooler
        TYPE               : 110  WIN32_OWN_PROCESS  (interactive)
        STATE              : 1  STOPPED
        WIN32_EXIT_CODE    : 0  (0x0)
        SERVICE_EXIT_CODE  : 0  (0x0)
        CHECKPOINT         : 0x0
        WAIT_HINT          : 0x0
```

### Disable

Disabling Windows Update Service

```shell
C:\WINDOWS\system32> sc config wuauserv start= disabled
[SC] ChangeServiceConfig SUCCESS
```

Disabling Background Intelligent Transfer Service

```shell
C:\WINDOWS\system32> sc config bits start= disabled
[SC] ChangeServiceConfig SUCCESS
```

```shell
C:\WINDOWS\system32> sc start wuauserv 

[SC] StartService FAILED 1058:

The service cannot be started, either because it is disabled or because it has no enabled devices associated with it.
```

## Net Start

net start, net stop, net pause, net continue
```shell
C:\htb> net start

These Windows services are started:

   Application Information
   AppX Deployment Service (AppXSVC)
   AVCTP service
<SNIP>
```

## WMIC

```shell
C:\htb> wmic service list brief

ExitCode  Name                                      ProcessId  StartMode  State    Status
1077      AJRouter                                  0          Manual     Stopped  OK
1077      ALG                                       0          Manual     Stopped  OK
1077      AppIDSvc                                  0          Manual     Stopped  OK
0         Appinfo                                   5016       Manual     Running  OK
1077      AppMgmt                                   0          Manual     Stopped  OK
1077      AppReadiness                              0          Manual     Stopped  OK
1077      AppVClient                                0          Disabled   Stopped  OK
0         AppXSvc                                   9996       Manual     Running  OK
<SNIP>
```
