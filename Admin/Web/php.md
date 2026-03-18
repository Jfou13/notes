# PHP

#### Chemin des sessions php (non fpm) en cli

``` bash
php -r 'echo session_save_path() . "\n";'
/var/lib/php/sessions
```

#### Chemin des sessions php fpm en cli

``` bash
php5-fpm -i | grep save_path
session.save_path => tcp://<ip>:<port>?
```

#### créer une page php qui va générer une erreur

``` php
<?php jfou(); ?>
```

#### créer une page info.php

``` php
<?php phpinfo(); ?>
```

#### changer de version par défaut php-cli

Manuel :

``` bash
update-alternatives --set php /usr/bin/php7.4
```

Interactif :

``` bash
update-alternatives --config php
```
