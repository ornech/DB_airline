import csv
import unidecode
import os

# Fonction pour extraire et formater les informations à partir du CSV
def extraire_donnees_csv(nom_fichier):
    etudiants = []
    
    with open(nom_fichier, newline='', encoding='utf-8') as fichier_csv:
        lecteur_csv = csv.reader(fichier_csv, delimiter=';')
        
        # Ignorer la première ligne si c'est l'en-tête
        next(lecteur_csv)
        
        for i, ligne in enumerate(lecteur_csv, 1):
            nom_complet = ligne[0]
            date_naissance = ligne[2]

            # Traitement du nom complet (le premier mot est le nom de famille, le reste est le prénom)
            nom_prenom = nom_complet.split(" ", 1)  # Sépare la première partie comme nom de famille et le reste comme prénom
            
            if len(nom_prenom) == 1:
                nom, prenom = nom_prenom[0], ""
            else:
                nom, prenom = nom_prenom[0], nom_prenom[1]

            # Première lettre du prénom en minuscule
            prenom_initial = prenom[0].lower() if prenom else ""
            
            # Formatage de la date de naissance
            date_naissance_formattee = date_naissance[:2] + date_naissance[3:5] + date_naissance[6:]

            # Suppression des accents et gestion des caractères spéciaux
            nom_sans_accents = unidecode.unidecode(nom)
            prenom_sans_accents = unidecode.unidecode(prenom_initial)

            # Concaténation du nom et de la première lettre du prénom sans séparateur
            login = f"{nom_sans_accents}{prenom_sans_accents}"

            # Ajouter à la liste des étudiants
            etudiants.append((i, login, date_naissance_formattee))

    return etudiants

# Nom du fichier CSV (ajustez le chemin si nécessaire)
nom_fichier_csv = 'chemin/vers/le/fichier.csv'

# URL du fichier SQL à télécharger
url_fichier_sql = "http://example.com/path/to/data.sql"

# Récupérer les étudiants depuis le CSV
etudiants = extraire_donnees_csv(nom_fichier_csv)

# Fichiers de sortie
fichier_sql = "create_databases_and_users.sql"
fichier_bash = "import_databases.sh"

# Ouvrir les fichiers en mode écriture
with open(fichier_sql, 'w') as f_sql, open(fichier_bash, 'w') as f_bash:
    # Créer les commandes SQL pour chaque étudiant
    for etudiant in etudiants:
        login = etudiant[1]
        date_naissance = etudiant[2]
        base = f"airline_{login}"

        # Générer les commandes SQL et les écrire dans le fichier SQL
        f_sql.write(f"CREATE DATABASE IF NOT EXISTS {base};\n")
        f_sql.write(f"CREATE USER IF NOT EXISTS 'SIO2-{login}'@'%' IDENTIFIED BY '{date_naissance}';\n")
        f_sql.write(f"GRANT SELECT, DROP, INSERT, UPDATE, EXECUTE, ALTER, CREATE, TRIGGER, ALTER ROUTINE, CREATE ROUTINE, SHOW VIEW ON {base}.* TO 'SIO2-{login}'@'%';\n\n")
    
    # Générer le flush des privilèges
    f_sql.write("FLUSH PRIVILEGES;\n")

    # Créer le script Bash pour télécharger et importer le fichier SQL
    f_bash.write("#!/bin/bash\n\n")
    f_bash.write(f"curl -o /tmp/data.sql {url_fichier_sql}\n\n")

    # Ajouter les commandes d'importation dans le fichier bash
    for etudiant in etudiants:
        login = etudiant[1]
        base = f"airline_{login}"

        # Générer les commandes d'importation et les écrire dans le fichier Bash
        f_bash.write(f"mysql -u root -p {base} < /tmp/data.sql\n")

    # Rendre le script Bash exécutable
    os.chmod(fichier_bash, 0o755)

print(f"Fichiers générés : {fichier_sql} et {fichier_bash}")
