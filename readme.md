# Notes

Index des notes d’administration, de documentation technique, de sécurité et des write-ups.

## Administration

Notes d’administration système et réseau.

[![Administration](assets/banners/administration.svg)](Admin/)

[![Bases de données](assets/banners/databases.svg)](Admin/Bdd/)

- **Bdd/**
  - [mongo_commandes_de_bases.md](Admin/Bdd/Mongodb/mongo_commandes_de_bases.md)
  - [sqlite3.md](Admin/Bdd/Sqlite/sqlite3.md)

[![Linux](assets/banners/linux.svg)](Admin/Linux/)

- **Linux/**
  - [AS.md](Admin/Linux/AS.md)
  - **Commands/**
    - [apt.md](Admin/Linux/Commands/apt.md)
    - [awk.md](Admin/Linux/Commands/awk.md)
    - [dpkg.md](Admin/Linux/Commands/dpkg.md)
    - [find.md](Admin/Linux/Commands/find.md)
    - [grep.md](Admin/Linux/Commands/grep.md)
    - [journalctl.md](Admin/Linux/Commands/journalctl.md)
    - [ps.md](Admin/Linux/Commands/ps.md)
    - [rsync.md](Admin/Linux/Commands/rsync.md)
    - [systemctl.md](Admin/Linux/Commands/systemctl.md)
  - **Kubernetes/**
    - [Kubernetes_commandes_de_bases.md](Admin/Linux/Kubernetes/Kubernetes_commandes_de_bases.md)
  - [mail.md](Admin/Linux/mail.md)
  - **Tools/**
    - [tealdeer.md](Admin/Linux/Tools/tealdeer.md)
  - [upgrade_echec.md](Admin/Linux/upgrade_echec.md)

[![Réseaux](assets/banners/networks.svg)](Admin/Reseaux/)

- **Reseaux/**
  - [nc.md](Admin/Reseaux/nc.md)
  - [tcpdump.md](Admin/Reseaux/tcpdump.md)

[![Administration Web](assets/banners/web-admin.svg)](Admin/Web/)

- **Web/**
  - [apache.md](Admin/Web/apache.md)
  - [curl.md](Admin/Web/curl.md)
  - [lynx.md](Admin/Web/lynx.md)
  - [php.md](Admin/Web/php.md)
  - **scripts/**
    - [verif_ssl_15days.sh](Admin/Web/scripts/verif_ssl_15days.sh)
  - **ssl/**
    - [autosigne.md](Admin/Web/ssl/autosigne.md)
    - [certbot.md](Admin/Web/ssl/certbot.md)
    - [commandes_pratiques.md](Admin/Web/ssl/commandes_pratiques.md)
  - [varnish.md](Admin/Web/varnish.md)

---

## Challenges

Défis et exercices.

[![Challenges](assets/banners/challenges.svg)](Challenge/)

- **Behind_the_scene/**
  - [Behind_the_scene.md](Challenge/Behind_the_scene/Behind_the_scene.md)

- **Debugging_Interface/**
  - [Debugging_Interface.md](Challenge/Debugging_Interface/Debugging_Interface.md)

---

## Documentation

Documentation technique et références.

[![Documentation](assets/banners/documentation.svg)](Docs/)

[![Git](assets/banners/git.svg)](Docs/Git/)

- **Git/**
  - [CheatSheet.md](Docs/Git/CheatSheet.md)

[![En-têtes HTTP](assets/banners/headers.svg)](Docs/Headers/)

- **Headers/**
  - [Referrer-Policy.md](Docs/Headers/Referrer-Policy.md)

---

## Hacking et sécurité

Notes, outils et fiches pratiques autour du hacking et de la sécurité.

[![Hacking et sécurité](assets/banners/hacking.svg)](Hack/)

[![Fiches pratiques](assets/banners/cheat-sheets.svg)](Hack/cheat_sheets_global/)

- **cheat_sheets_global/**
  - [bash.md](Hack/cheat_sheets_global/bash.md)
  - [ftp.md](Hack/cheat_sheets_global/ftp.md)

[![Commandes](assets/banners/commands.svg)](Hack/Commands/)

- **Commands/**
  - [lxc.md](Hack/Commands/lxc.md)

[![Footprinting](assets/banners/footprint.svg)](Hack/Footprint/)

- **Footprint/**
  - **CheatSheet/**
    - [CS_footprinting.md](Hack/Footprint/CheatSheet/CS_footprinting.md)
  - [DNS.md](Hack/Footprint/DNS.md)
  - [Domain_information.md](Hack/Footprint/Domain_information.md)
  - [IMAP.md](Hack/Footprint/IMAP.md)
  - [IPMI.md](Hack/Footprint/IPMI.md)
  - [MSSQL.md](Hack/Footprint/MSSQL.md)
  - [NFS.md](Hack/Footprint/NFS.md)
  - [Oracle.md](Hack/Footprint/Oracle.md)
  - **skills_assessment/**
    - [easy.md](Hack/Footprint/skills_assessment/easy.md)
    - [medium.md](Hack/Footprint/skills_assessment/medium.md)
    - [hard.md](Hack/Footprint/skills_assessment/hard.md)
  - [SMB.md](Hack/Footprint/SMB.md)
  - [SMTP.md](Hack/Footprint/SMTP.md)
  - [SNMP.md](Hack/Footprint/SNMP.md)

[![Déobfuscation JavaScript](assets/banners/javascript.svg)](Hack/JS_deobfuscation/)

- **JS_deobfuscation/**
  - **CheatSheet/**
    - [CS_JS_deobfuscation.md](Hack/JS_deobfuscation/CheatSheet/CS_JS_deobfuscation.md)
  - [Deobfuscation.md](Hack/JS_deobfuscation/Deobfuscation.md)
  - [skill_assessment.md](Hack/JS_deobfuscation/skill_assessment.md)

[![Metasploit](assets/banners/metasploit.svg)](Hack/Metasploit/)

- **Metasploit/**
  - **CheatSheet/**
    - [CS_Metasploit.md](Hack/Metasploit/CheatSheet/CS_Metasploit.md)
  - [Framework.md](Hack/Metasploit/Framework.md)
  - [MSF_scan_nmap.md](Hack/Metasploit/MSF_scan_nmap.md)
  - [MSF_steal_token.md](Hack/Metasploit/MSF_steal_token.md)
  - [MSFVenom.md](Hack/Metasploit/MSFVenom.md)
  - [Payloads.md](Hack/Metasploit/Payloads.md)

[![Préparation](assets/banners/setting-up.svg)](Hack/Setting_up/)

- **Setting_up/**
  - [Theory_Organization.md](Hack/Setting_up/Theory_Organization.md)

[![Outils](assets/banners/tools.svg)](Hack/Tools/)

- **Tools/**
  - [gobuster.md](Hack/Tools/gobuster.md)
  - [hydra.md](Hack/Tools/hydra.md)
  - [Metasploit.md](Hack/Tools/Metasploit.md)
  - [nmap.md](Hack/Tools/nmap.md)
  - [rustscan.md](Hack/Tools/rustscan.md)
  - [searchsploit.md](Hack/Tools/searchsploit.md)
  - [smbclient.md](Hack/Tools/smbclient.md)
  - [subfinder.md](Hack/Tools/subfinder.md)
  - [whatweb.md](Hack/Tools/whatweb.md)
  - [Wpscan.md](Hack/Tools/Wpscan.md)

[![Webshells](assets/banners/webshell.svg)](Hack/Shell/)

- **Shell/**
  - [Reverse_shell.md](Hack/Shell/Reverse_shell.md)
  - [upgrade_shell.md](Hack/Shell/upgrade_shell.md)
  - [webshell_location.md](Hack/Shell/webshell_location.md)

[![Sécurité Windows](assets/banners/windows.svg)](Hack/Windows/)

- **Windows/**
  - **Basics/**
    - **CheatSheet/**
      - [CS_Windows_Fundamentals.md](Hack/Windows/Basics/CheatSheet/CS_Windows_Fundamentals.md)
    - [List_Services.md](Hack/Windows/Basics/List_Services.md)
    - [Permissions_ICACLS.md](Hack/Windows/Basics/Permissions_ICACLS.md)
    - [Regedit.md](Hack/Windows/Basics/Regedit.md)
    - [SID.md](Hack/Windows/Basics/SID.md)
    - [Smbclient.md](Hack/Windows/Basics/Smbclient.md)
    - [Version&SN.md](Hack/Windows/Basics/Version&SN.md)
    - [WSL.md](Hack/Windows/Basics/WSL.md)
  - **CLI/**
    - **CheatSheet/**
      - [CS_Windows_CLI.md](Hack/Windows/CLI/CheatSheet/CS_Windows_CLI.md)
    - [Basics.md](Hack/Windows/CLI/Basics.md)
    - [Env_vars.md](Hack/Windows/CLI/Env_vars.md)
    - [find.md](Hack/Windows/CLI/find.md)
    - [Gathering_System_Infos.md](Hack/Windows/CLI/Gathering_System_Infos.md)
    - [Managing_Services.md](Hack/Windows/CLI/Managing_Services.md)
    - [Powershell_Finding_&_Filtering_Content.md](Hack/Windows/CLI/Powershell_Finding_&_Filtering_Content.md)
    - [Powershell_interacting_web.md](Hack/Windows/CLI/Powershell_interacting_web.md)
    - [Powershell_modules_cmdlets.md](Hack/Windows/CLI/Powershell_modules_cmdlets.md)
    - [Powershell_registry.md](Hack/Windows/CLI/Powershell_registry.md)
    - [Powershell_remote_access.md](Hack/Windows/CLI/Powershell_remote_access.md)
    - [Powershell_services.md](Hack/Windows/CLI/Powershell_services.md)
    - [Powershell_User_and_Group.md](Hack/Windows/CLI/Powershell_User_and_Group.md)
    - [Powershell_Working_with_Files_and_Directories.md](Hack/Windows/CLI/Powershell_Working_with_Files_and_Directories.md)
    - [Skills_Assessment.md](Hack/Windows/CLI/Skills_Assessment.md)

[![Sécurité WordPress](assets/banners/wordpress.svg)](Hack/Wordpress/)

- **Wordpress/**
  - **CheatSheet/**
    - [CS_Hacking_Wordpress.md](Hack/Wordpress/CheatSheet/CS_Hacking_Wordpress.md)
  - [LFI.md](Hack/Wordpress/LFI.md)
  - [Plugins_and_Themes_Enumeration.md](Hack/Wordpress/Plugins_and_Themes_Enumeration.md)
  - [RCE.md](Hack/Wordpress/RCE.md)
  - [SkillAssessment.md](Hack/Wordpress/SkillAssessment.md)
  - [Users_enum.md](Hack/Wordpress/Users_enum.md)
  - [WP_dirbusting.md](Hack/Wordpress/WP_dirbusting.md)
  - [WP_version_enum.md](Hack/Wordpress/WP_version_enum.md)
  - [Wpscan_enum.md](Hack/Wordpress/Wpscan_enum.md)
  - [Wpscan_Users_Bruteforce.md](Hack/Wordpress/Wpscan_Users_Bruteforce.md)
  - [xmlrpc_attacks.md](Hack/Wordpress/xmlrpc_attacks.md)

---

## Machines

Write-ups des machines résolues.

[![Machines](assets/banners/machines.svg)](Machines/)

- **archetype/**
  - [archetype.md](Machines/archetype/achetype.md)

- **Metatwo/**
  - [Writeup_Metatwo.md](Machines/Metatwo/Writeup_Metatwo.md)

- **Reactor/**
  - [Writeup_reactor.md](Machines/Reactor/Writeup_reactor.md)

- **Touch/**
  - [Writeup_touch.md](Machines/Touch/Writeup_touch.md)
