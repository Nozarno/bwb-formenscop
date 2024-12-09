# FORMENSCOP



## Environnement de développement

### Back (Laravel)

La configuration de l'environnement de développement du backend est construite autour de conteneurs qui exécutent des commandes, en utilisant les noms de commandes comme labels des services pour en faciliter l'utilisation. Elle est fortement inspirée de [ce dépôt](https://github.com/vshloda/docker-laravel).

Les commandes `composer`  ou `artisan` doivent être précédées par : `docker compose -f compose.dev-back.yml run --rm`.


### Organisation des fichiers :
- Tous les fichiers source de Laravel se trouvent dans le répertoire `./back`.
- Tout ce qui concerne MySQL est situé dans le répertoire `./mysql`.
- Le répertoire `./docker` contient tout ce dont Docker a besoin : les Dockerfiles, les configurations des services, et les fichiers spécifiques à Docker.
    - La configuration des services se trouve dans `docker/nom_du_service`.  
      
### Exemple : Préparer Laravel avec API Platform

#### 1. Préparation de l'environnement (construction des images Docker)
Exécutez la commande suivante pour créer les images à partir des Dockerfiles :
```bash
docker compose -f compose.dev-back.yml build
```

#### 2. Installation du backend Laravel avec Composer
Lancez cette commande pour installer Laravel :
```bash
docker compose -f compose.dev-back.yml run --rm composer create-project laravel/laravel .
```

##### Explications :
- `docker compose -f compose.dev-back.yml` : Utilise Docker Compose avec un fichier de configuration spécifique.
- `run --rm composer` : Crée un conteneur temporaire "composer" pour exécuter la commande, puis le supprime après exécution.
- `create-project laravel/laravel .` : Commande de Composer pour créer un projet Laravel.
- `.` : Chemin cible dans le conteneur. Le chemin est déjà configuré dans les Dockerfiles et le fichier `compose.dev-back.yml`.

#### 3. Test de fonctionnement
Pour vérifier que tout fonctionne, exécutez les commandes suivantes :
```bash
docker compose -f compose.dev-back.yml up -d
```
Ensuite, ouvrez votre navigateur et accédez à [http://localhost](http://localhost).

#### 4. Configuration et migrations MySQL
⚠️ Les services doivent être en cours d'exécution pour cette étape.

1. Éditez le fichier `back/.env` pour utiliser les mêmes informations que les variables d'environnement du fichier `compose.dev-back.yml`.
2. Exécutez la commande suivante pour appliquer les migrations :
   ```bash
   docker compose run --rm artisan migrate
   ```

#### 5. Installation d'API Platform
Pour installer API Platform dans le projet Laravel :
```bash
docker compose -f compose.dev-back.yml run --rm composer require api-platform/laravel
docker compose -f compose.dev-back.yml run --rm artisan api-platform:install
```
