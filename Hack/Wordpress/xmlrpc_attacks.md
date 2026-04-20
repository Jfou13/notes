# WordPress xmlrpc attacks

## question
Search for "WordPress xmlrpc attacks" and find out how to use it to execute all method calls. Enter the number of possible method calls of your target as the answer.

```shell
curl -i -X POST -H "Content-Type: text/xml" -d '<?xml version="1.0" encoding="utf-8"?><methodCall><methodName>system.listMethods</methodName><params></params></methodCall>' http://154.57.164.82:31010/xmlrpc.php
HTTP/1.1 200 OK
Server: nginx
Content-Type: text/xml; charset=UTF-8
Transfer-Encoding: chunked
Connection: keep-alive
Date: Mon, 20 Apr 2026 14:53:35 +0000

<?xml version="1.0" encoding="UTF-8"?>
<methodResponse>
  <params>
    <param>
      <value>
      <array><data>
  <value><string>system.multicall</string></value>
  <value><string>system.listMethods</string></value>
  <value><string>system.getCapabilities</string></value>
  <value><string>demo.addTwoNumbers</string></value>
  [...]


curl -i -s -X POST -H "Content-Type: text/xml" -d '<?xml version="1.0" encoding="utf-8"?><methodCall><methodName>system.listMethods</methodName><params></params></methodCall>' http://154.57.164.82:31010/xmlrpc.php | grep "<value><string>" | wc -l
80
```