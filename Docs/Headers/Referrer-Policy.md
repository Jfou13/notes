# Referrer-Policy

## param 
### **`strict-origin-when-cross-origin`**

- Envoie l'URL complète pour same-origin
- Envoie l'origine pour cross-origin de même niveau de sécurité
- Aucun referrer pour HTTPS → HTTP

## Tableau récapitulatif strict-origin-when-cross-origin

| Depuis                             | Vers                        | Referrer envoyé                            |
| ---------------------------------- | --------------------------- | ------------------------------------------ |
| `https://monsite.com/page1`        | `https://monsite.com/page2` | `https://monsite.com/page1` (URL complète) |
| `https://monsite.com/admin/secret` | `https://google.com`        | `https://monsite.com` (origine seule)      |
| `https://monsite.com/page`         | `http://autresite.com`      | _(rien)_                                   |
