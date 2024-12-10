FROM nginx:stable-alpine

# Ajouter le fichier de configuration nginx
ADD ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Créer le répertoire html
RUN mkdir -p /var/www/html

# Créer les répertoires storage et bootstrap/cache
RUN mkdir -p /var/www/html/storage /var/www/html/bootstrap/cache

# Modifier les permissions pour que l'utilisateur nginx ait accès aux répertoires nécessaires
RUN chown -R nginx:nginx /var/www/html/storage /var/www/html/bootstrap/cache
