# Script de gestion des bases de données pour les étudiants

Ce script permet de générer des bases de données spécifiques pour chaque étudiant à partir d'un export Pronote (fichier CSV) d'une liste d'élèves. Il crée également les utilisateurs associés et génère un script Bash pour importer une base de données standardisée dans chaque base créée.

---

## Fonctionnalités

- Création des bases de données pour chaque étudiant.
- Création des utilisateurs MySQL avec des privilèges spécifiques pour chaque base.
- Génération d'un fichier SQL contenant toutes les commandes nécessaires.
- Génération d'un script Bash pour automatiser l'importation d'une base de données standardisée.
- Les identifiants (logins) sont générés en minuscule, sans accents ni caractères spéciaux.

---

## Prérequis

### Python

- **Python 3.6+** est requis pour exécuter le script.
- Le module `unidecode` doit être installé. Pour l'installer :
  ```bash
  pip install unidecode

### MySQL

    Un serveur MySQL fonctionnel.
    Accès root pour la création des bases de données et des utilisateurs.

## Fichiers générés
 - create_databases_and_users.sql : Contient les commandes SQL pour créer les bases de données et les utilisateurs.
 - import_databases.sh : Script Bash pour télécharger et importer une base de données standardisée dans chaque base.
