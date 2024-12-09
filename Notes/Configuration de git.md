## Configuration de Git (par Nozarno) :
Pour mes différents usages, je configure Git **au niveau du dépôt** afin d'éviter les configurations globales.  
Pour la gestion de GitHub, j'utilise une clé SSH avec un mot de passe complexe.

### Comment configurer une clé SSH :
Pour générer et ajouter une clé SSH, suivez les instructions officielles de GitHub :  
[Documentation GitHub - Générer une clé SSH et l'ajouter à l'agent SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Configurer l'utilisateur Git pour le dépôt :
Dans le répertoire du dépôt concerné, exécutez les commandes suivantes :
```bash
git config user.name "VotreNomUtilisateur"
git config user.email "votre.email@example.com"
```

### Ajouter une clé SSH dans la configuration locale du dépôt :
```bash
git config core.sshCommand "ssh -i chemin/de/la/cle"
```

### Cloner un dépôt en utilisant une clé SSH (sans configuration globale) :
Pour cloner un dépôt avec une clé SSH spécifique sans modifier la configuration globale, utilisez :
```bash
GIT_SSH_COMMAND='ssh -i chemin/de/la/cle' git clone git@github.com:Nozarno/bwb-formenscop.git
```