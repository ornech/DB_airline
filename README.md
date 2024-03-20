# Présentation

Ce dépôt contient la base de données d'une compagnie aérienne fictive où sont stocké les données utiles à ses activités opérationnelles. Elle a pour but de vous entrainer au requêtage SQL.

![image](https://github.com/ornech/DB_airline/assets/101867500/115efdc3-0f13-4a47-a8f6-b4ea70e2fe0d)

La compagnie aérienne fictive en question réalise quotidienneùent plusieurs rotations au départ de Paris à destination de :
1. Ajaccio (3 aller/retour par jour)
2. Zurich (4 aller/retour par jour)
3. Rome (2 aller/retour par jour)

Cette base de données :
 - Contient plusieurs mois d'activité de la compagnie aérienne qui inclus ( billets vendus, vols réalisés, avions utilisés, équipage pour un vol, etc ...)
 - A été conçue pour respecter les "règles métier" d'une compagnie aérienne, c'est à dire les contraintes liées à son activité opérationnelle (par exemple un siège pour un vol précis ne peut pas être assigner une seconde fois sur ce même vol).

A titre d'exemple, voici ce que vous pouviez générer comme résultats :

Nom: Eskriet
Prenom: Loïca
N° de vol: AJA-03
Siège: 1A
Depart: Paris - Orly
Destination: Ajaccio - Napoléon Bonaparte
Date: 12/02/2024
Heure décollage: 13:00
Heure arrivée: 14:31

## Information de connection aux serveurs de base de données

- IP (SIO1): 172.16.254.188
- IP (SIO2): 172.16.254.167

- user :
  - Pour les SIO1: Votre prénom sans accent  et avec la première lettre du prénom en majuscule
  - Pour les SIO2: "SIO2-" suivi de votre prénom sans accent et avec la première lettre du prénom en majuscule
- mot de passe: votre date de naissance au format JJMMAAAA

  Pour les SIO1, vous possédez d'une base de données commune avec des droits limités au SELECT.

  Pour les SIO2, vous disposez d'une base de données personnel avec des droits étendus afin de modifier ou créer des tables, procédures stockées, déclencheurs ou fonctions.


## Avant de commencer
Connectez-vous au serveur
``` shell
mysql -u <VOTRE UTILISATEUR> -p
```

- Sélectionnez votre base de données
``` sql
SHOW DATABASE;
USE <NOM DE LA BASE DE DONNEES>;
```
- Familiarisez-vous avec cette base de données
- Relisez vos notes
- Utilisez la documentation de mariadb
- Utilisez des ressources pour vous aidez (et pas ChatGPT)

## Petit lexique du jargon du monde de l'aviation

- Une rotation: un aller/retour vers une destination
- Un CDB: une Commandant de bord
- OPL: Officier pilote de ligne, un second pilote
- CDC: Chef de cabine
- PNC: Hotesse
![image](https://github.com/ornech/DB_airline/assets/101867500/01b3ddc5-b34e-48e0-98a3-bc033ed65f47)

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

### Générer un nouveau jeu d'essai
1. Connectez vous à la base de données
mysql -u votre_utilisateur -p votre_base_de_donnees

2. Exécuter la procédure stockée Jeu_essai
``` sql
CALL Jeu_essai("YYYY-MM-DD");
```
Notez que la date transmise à la procédure sera la date du premier vol de votre jeu d'essai. Les vols et billets seront généré automatiquement de cette date jusqu'à la date du jour.
