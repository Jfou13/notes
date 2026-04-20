# searchsploit

```shell
┌──(kali㉿kali)-[~]
└─$ searchsploit site editor 1.1.1
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
 Exploit Title                                                                                                                                                                      |  Path
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------
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

```