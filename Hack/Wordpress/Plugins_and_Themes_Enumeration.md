# Plugins and Themes Enumeration

## Passif 

### Plugins

``` shell
curl -s -X GET http://blog.inlanefreight.com | sed 's/href=/\n/g' | sed 's/src=/\n/g' | grep 'wp-content/plugins/*' | cut -d"'" -f2
```

### Themes

``` shell
curl -s -X GET http://blog.inlanefreight.com | sed 's/href=/\n/g' | sed 's/src=/\n/g' | grep 'themes' | cut -d"'" -f2
```

## Actifs

However, not all installed plugins and themes can be discovered passively. In this case, we have to send requests to the server actively to enumerate them

``` shell
 curl -I -X GET http://blog.inlanefreight.com/wp-content/plugins/mail-masta

HTTP/1.1 301 Moved Permanently
Date: Wed, 13 May 2020 20:08:23 GMT
Server: Apache/2.4.29 (Ubuntu)
Location: http://blog.inlanefreight.com/wp-content/plugins/mail-masta/
Content-Length: 356
Content-Type: text/html; charset=iso-8859-1
```

If the content does not exist, we will receive a 404 Not Found error.

``` shell
curl -I -X GET http://blog.inlanefreight.com/wp-content/plugins/someplugin

HTTP/1.1 404 Not Found
Date: Wed, 13 May 2020 20:08:18 GMT
Server: Apache/2.4.29 (Ubuntu)
Expires: Wed, 11 Jan 1984 05:00:00 GMT
Cache-Control: no-cache, must-revalidate, max-age=0
Link: <http://blog.inlanefreight.com/index.php/wp-json/>; rel="https://api.w.org/"
Transfer-Encoding: chunked
Content-Type: text/html; charset=UTF-8
```

``` shell
curl -sX GET http://154.57.164.69:31253/wp-content/plugins/mail-masta/
<html>
<head><title>Index of /wp-content/plugins/mail-masta/</title></head>
<body>
<h1>Index of /wp-content/plugins/mail-masta/</h1><hr><pre><a href="../">../</a>
<a href="amazon_api/">amazon_api/</a>                                        13-May-2020 18:54                   -
<a href="inc/">inc/</a>                                               18-May-2020 10:28                   -
<a href="lib/">lib/</a>                                               13-May-2020 18:54                   -
<a href="plugin-interface.php">plugin-interface.php</a>                               13-May-2020 18:54               90080
<a href="readme.txt">readme.txt</a>                                         13-May-2020 18:54                2251
</pre><hr></body>
</html>
```

``` shell
curl -s -X GET http://blog.inlanefreight.com/wp-content/plugins/mail-masta/ | html2text

****** Index of /wp-content/plugins/mail-masta ******
[[ICO]]       Name                 Last_modified    Size Description
===========================================================================
[[PARENTDIR]] Parent_Directory                         -  
[[DIR]]       amazon_api/          2020-05-13 18:01    -  
[[DIR]]       inc/                 2020-05-13 18:01    -  
[[DIR]]       lib/                 2020-05-13 18:01    -  
[[   ]]       plugin-interface.php 2020-05-13 18:01  88K  
[[TXT]]       readme.txt           2020-05-13 18:01 2.2K  
===========================================================================
     Apache/2.4.29 (Ubuntu) Server at blog.inlanefreight.com Port 80
```