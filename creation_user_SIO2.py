import csv
import unidecode

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

# Récupérer les étudiants depuis le CSV
etudiants = extraire_donnees_csv(nom_fichier_csv)

# Générer les commandes SQL
for etudiant in etudiants:
    print(f"CREATE DATABASE IF NOT EXISTS airline_{etudiant[1]};")
    print(f"CREATE USER IF NOT EXISTS 'SIO2-{etudiant[1]}@'%' IDENTIFIED BY '{etudiant[2]}';")
    print(f"GRANT SELECT, DROP, INSERT, UPDATE, EXECUTE, ALTER, CREATE, TRIGGER, ALTER ROUTINE, CREATE ROUTINE, SHOW VIEW ON airline_{etudiant[1]}.* TO 'SIO2-{etudiant[1]}@'%';")

print("FLUSH PRIVILEGES;")
