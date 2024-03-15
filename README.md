# Présentation

Pour ce travail nous allons utiliser la base de données d'une compagnie aérienne fictive. Cette base de données a pour fonction de gérer et centraliser les informations nécessaires à l'activité de la compagnie.

Notre compagnie aérienne fictive réalise plusieurs rotations au départ de Paris à destination de :
1. Ajaccio (3 aller/retour par jour)
2. Zurich (4 aller/retour par jour)
3. Rome (2 aller/retour par jour)

Cette base de données contient plusieurs mois d'activité de la compagnie aérienne qui inclus ( billets vendus, vols réalisés, avions utilisés, équipage pour un vol, etc ...)

Cette base de données a été conçue pour respecter au plus près les "règles métier" d'une compagnie aérienne, c'est à dire les contraintes liées à son activité opérationnelle.

A titre d'exemple, voici ce que vous pouvez générer  comme résultat à partir de cette base de données; Exemple d'un billet d'avion existant:

Nom: Eskriet
Prenom: Loïca
N° de vol: AJA-03
Siège: 1A
Depart: Paris - Orly
Destination: Ajaccio - Napoléon Bonaparte
Date: 12/02/2024
Heure décollage: 13:00
Heure arrivée: 14:31

## Information serveur de base de données

- IP: 172.168.254.188
- user : Votre prénom avec accent si nécessaire et avec la permière lettre en majuscule
- mot de passe: votre date de naissance au format JJMMAAAA

## Avant de commencer

    Familiarisez-vous avec cette base de données
    Relisez vos notes
    Utilisez la documentation de mariadb
    Utilisez des ressources pour vous aidez (et pas ChatGPT)

## Petit lexique du jargon du monde de l'aviation

- Une rotation: un aller/retour vers une destination
- Un CDB: une Commandant de bord
- OPL: Officier pilote de ligne, un second pilote
- CDC: Chef de cabine
- PNC: Hotesse

# Exercices

1. Afficher la liste des immatriculations et le modèle d'avion.
2. Comptez le nombre d'aéroports .
3.Afficher le nombre de sièges en la classe « business » pour chaque avion.
4. Quel a été le vol qui a duré le plus longtemps.
5. Affichez pour le vol de votre choix, la liste des passagers.
6. Pour le vol de votre choix, afficher le CDB et le N° de vol.
7.Pour le vol de votre choix, afficher l'immatriculation de l'avion utilisé et la ville de destination
8.Pour le vol de votre choix, afficher le numéro du siège (1B par exemple) et le nom du passager
9. Affichez le pilote (CDB ou OPL) qui a effectué le plus de vols.
10. Pour le vol de votre choix afficher le nombre de passagers en classe Eco et en classe Business .
11. Calculer le nombre moyen de passagers
12. Déterminez le nombre de vol moyen d’un naviguant.
13. Trouver les 5 employés les plus sollicités (ayant le plus de vols à leur actif
14. Affichez la liste des vols à destination d’Ajaccio au mois de Janvier.
15. Quel est le temps de vol moyen des équipages pour le mois de Février
16. Déterminez le taux de remplissage des 3 lignes
17. Affichez les vols avec un nombre de passagers supérieur à la moyenne
18. Affichez la liste des vols à destination d’Ajaccio au mois de Janvier
19. Affichez le temps de vol des avions pour les mois de janvier et février
20. Déterminez la tranche d’âge moyenne des passagers qui ont voyagé en classe Business à destination de Zurich
21. Quel est le temps de vol moyen des équipages pour le mois de Février ?
22. Quel est le temps de repos moyen des équipages ?
23. Affichez les vols avec un nombre de passagers supérieur à la moyenne.
