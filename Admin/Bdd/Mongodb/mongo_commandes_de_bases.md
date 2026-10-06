# Mongodb - commande de bases

## connexion
```bash
mongo --port 27117
```

## aide
```javascript
db.help;
```

## voir les bases
```javascript
show dbs;
```

## choisir une base
```javascript
use ma_base_de_donnees;
```

## voir les users
```javascript
db.admin.find();
db.admin.find().forEach(printjson);
```

```javascript
db.admin.find({ age: { $gte: 30 } })
  .sort({ age: -1 })
  .limit(5);
```

## changer le pass admin
```bash
mkpasswd -m sha-512 Password1234
```
```bash
mongo --port 27117 ace --eval 'db.admin.update({"_id":ObjectId("61ce278f46e0fb0012d47ee4")},{$set:{"x_shadow":"SHA_512 Hash Generated"}})'
```