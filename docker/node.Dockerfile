# Étape 1 : Utiliser une image officielle Node.js
FROM node:20.18-alpine

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

RUN apk update
RUN apk add curl screen htop tmux



# Étape 4 : Commande par défaut pour garder le conteneur actif
CMD ["tail", "-f", "/dev/null"]
