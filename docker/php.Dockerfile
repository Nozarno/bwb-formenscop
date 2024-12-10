FROM php:8.2-fpm-alpine

# Ajouter le fichier de configuration php-fpm
ADD ./docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf

# Créer un utilisateur et un groupe laravel
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

# Créer les répertoires nécessaires
RUN mkdir -p /var/www/html /var/www/html/storage /var/www/html/bootstrap/cache

# Ajouter le code source dans le conteneur
ADD ./back/ /var/www/html

# Installer les extensions PHP nécessaires
RUN docker-php-ext-install pdo pdo_mysql

# Modifier les permissions des répertoires nécessaires pour Laravel
RUN chown -R laravel:laravel /var/www/html
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Assurez-vous que www-data peut aussi accéder aux répertoires nécessaires
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache