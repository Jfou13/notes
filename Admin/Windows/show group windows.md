
## net user

``` powershell
PS C:\Users\john> net user

User accounts for \\WIN01

-------------------------------------------------------------------------------
Administrator            DefaultAccount           Guest
john                     WDAGUtilityAccount
The command completed successfully.
```

``` powershell
PS C:\Users\john> net user john
User name                    john
Full Name                    john
Comment
User's comment
Country/region code          000 (System Default)
Account active               Yes
Account expires              Never

Password last set            2/23/2025 11:57:29 AM
Password expires             Never
Password changeable          2/23/2025 11:57:29 AM
Password required            Yes
User may change password     Yes

Workstations allowed         All
Logon script
User profile
Home directory
Last logon                   3/8/2026 3:24:06 AM

Logon hours allowed          All

Local Group Memberships      *Event Log Readers    *Remote Desktop Users
                             *Users
Global Group memberships     *None
The command completed successfully.

```