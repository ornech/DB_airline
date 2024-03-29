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

## Exercices "requêtes "

1. Afficher la liste des immatriculations et le modèle d'avion.
2. Comptez le nombre d'aéroports .
3. Afficher le nombre de sièges en la classe « business » pour l'avion de votre choix.
4. Quel a été le vol qui a duré le plus longtemps.


## Exercices "Jointures"
1. Affichez pour le vol de votre choix, la liste des passagers (Nom, Prénom et date de naissance du passager).
2. Pour le vol de votre choix, afficher le CDB et le N° de vol.
3. Pour le vol de votre choix, afficher l'immatriculation de l'avion utilisé et la ville de destination
4. Pour le vol de votre choix, afficher le numéro du siège (1B par exemple) et le nom du passager
5. Pour le vol de votre choix quels ont les sièges qui ont été innocupées
6. Affichez les passagers qui n'ont pas volé.

## Exercices "sous-requêtes"
1. Affichez le ou les pilotes (CDB ou OPL) qui ont effectués le plus grand nombres de vols au mois en décembre 2023.
2. Pour le vol de votre choix, affichez le nombre de passagers  classe Business.
3. Calculer le nombre moyen de passagers à destination de Rome.
5. Déterminez le nombre de vol moyen d’un naviguant.
6. Trouver les 5 employés les plus sollicités (ayant le plus de vols à leur actif)
7. Quel est le temps de vol moyen des équipages pour le mois de Février
8. Déterminez le taux de remplissage des 3 lignes
9. Affichez les vols avec un nombre de passagers supérieur à la moyenne
10. Déterminez la tranche d’âge moyenne des passagers qui ont voyagé en classe Business à destination de Zurich

## Excercice "Vues"
1. Fait une vue qui affiche le carnet de vol des avions
2. Fait une vue qui affiche le carnet de vol des naviguants (nom, prénom, fonction, date (uniquement) du vol, n° de vol, aéroport de départ, aéroport de destination, temps de vol)

## Exercice "Triggers"
1. Faite un trigger sur la table Billets qui vérifie si une modification de siège est possible pour un passager ?

## Exercice "Procédures stockées"
1. Faite une procédure capable de programmer un nouveau vol (décollage à une date ultérieur) ainsi que son retour. Cette prosédure doit remplir tous les champs.
2. Modifiez cette procédure pour que seul les équipages yant le moins volé ce mois ci soit affecté à ce vol.


# Générer un nouveau jeu d'essai
1. Connectez vous à la base de données
mysql -u votre_utilisateur -p votre_base_de_donnees

2. Exécuter la procédure stockée Jeu_essai
``` sql
CALL Jeu_essai("YYYY-MM-DD");
```
Notez que la date transmise à la procédure sera la date du premier vol de votre jeu d'essai. Les vols et billets seront généré automatiquement de cette date jusqu'à la date du jour.

### Importer cette base de données
1. Récupérer le dump de la base de données
2. Connectez vous à la base de données
mysql -u votre_utilisateur -p
3. Créer une base de données
``` sql
CREATE DATABASE airline;
EXIT;
```
4a. Importez le fichier dump
``` bash
mysql -u user -h localhost -p airline < dump-airline_dev-XXXXXXXXXX.sql
```

4b. Si vous utilisez le compte root de mariadb
``` bash
sudo mysql -p airline < dump-airline_dev-XXXXXXXXXX.sql
```
