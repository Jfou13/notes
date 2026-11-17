# CSRF Cross-Site Request Forgery

Imaginons que sur `ma-banque.example`, un virement s'effectue via un simple formulaire POST vers `/virement`.  
L'attaquant héberge la page HTML ci dessous sur son propre site `jeu-gratuit.example` et envoie le lien à la victime :

```html
<html>
  <!-- Dès que la page charge, le formulaire est soumis automatiquement -->
  <body onload="document.getElementById('piege').submit()">
    <form id="piege" action="https://ma-banque.example/virement" method="POST">
      <input type="hidden" name="destinataire" value="IBAN_ATTAQUANT" />
      <input type="hidden" name="montant" value="1000" />
    </form>
  </body>
</html>
```

Si la victime est connectée à sa banque dans un autre onglet et ouvre la page piégée, son navigateur envoie le formulaire accompagné de son cookie de session bancaire.  
Sans jeton anti-CSRF (ou attribut cookie `SameSite=Strict`), la banque valide le virement.

### <u>Déroulement étape par étape :</u>

1. La préparation : L'attaquant achète un nom de domaine banal (jeu-gratuit.example) et y dépose sa page web piégée contenant le formulaire caché.

2. L'appât : Il envoie le lien [https://jeu-gratuit.example](https://jeu-gratuit.example) à la victime (par email, SMS, message Discord, etc.) avec un prétexte classique : "Regarde cette vidéo !" ou "Tu as gagné un bon d'achat !".

3. Le déclenchement : La victime clique sur le lien. Son navigateur télécharge et affiche la page de jeu-gratuit.example.

4. L'exécution invisible : À l'instant où la page s'affiche chez la victime, le code HTML caché s'exécute dans son navigateur et envoie silencieusement une requête vers ma-banque.example en arrière-plan.