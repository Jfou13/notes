# kubernetes commandes de bases

## choisir son context

```bash
└─$ kubectx
```

## voir les namespace
```bash
kubectl get namespaces
```

## changer de namespace
```bash
kubens kube-system
```

## voir les logs d'un pod

```bash
kubectl logs -f POD_NAME
```

## exec 
```bash
kubectl exec www -- nginx -v # (le -- permet de dire que ce qui suit n'est pas une option de la commande, exemple: rm -- -toto si le fichier est nommé -toto)
kubectl exec -t -i www -- /bin/bash
```
