# DB AIRLINE

Ce dépôt contient la base de données d'une compagnie aérienne fictive où sont stockées les données utiles à ses activités opérationnelles. Elle a pour but de vous entrainer au requêtage SQL.

## Table des Matières

- [Requêtes](#requêtes)
- [Jointures](#jointures)
- [Sous-requêtes](#sous-requêtes)
- [Vues](#vues)
- [Triggers](#triggers)
- [Procédures stockées](#procédures-stockées)

![image](https://github.com/ornech/DB_airline/assets/101867500/115efdc3-0f13-4a47-a8f6-b4ea70e2fe0d)

La compagnie aérienne fictive en question réalise quotidiennement plusieurs rotations au départ de Paris à destination de :
1. Ajaccio (3 aller/retour par jour)
2. Zurich (4 aller/retour par jour)
3. Rome (2 aller/retour par jour)

Cette base de données :
 - Contient plusieurs mois d'activité de la compagnie aérienne qui inclut billets vendus, vols réalisés, avions utilisés, équipage pour un vol, etc ...
 - A été conçue pour respecter les "règles métier" d'une compagnie aérienne, c'est à dire les contraintes liées à son activité opérationnelle (par exemple un siège pour un vol précis ne peut pas être assigné une seconde fois sur ce même vol).

A titre d'exemple, voici ce que vous pouvez générer comme résultats :

Nom: Eskriet
Prenom: Loïca
N° de vol: AJA-03
Siège: 1A
Depart: Paris - Orly
Destination: Ajaccio - Napoléon Bonaparte
Date: 12/02/2024
Heure décollage: 13:00
Heure arrivée: 14:31

## Information de connexion aux serveurs de base de données

- IP (SIO1): 172.16.254.188
- IP (SIO2): 172.16.254.167

- user :
  - Pour les SIO1: Votre prénom sans accent  et avec la première lettre du prénom en majuscule
  - Pour les SIO2: "SIO2-" suivi de votre prénom sans accent et avec la première lettre du prénom en majuscule
- mot de passe: votre date de naissance au format JJMMAAAA

  Pour les SIO1, vous possédez une base de données commune avec des droits limités au SELECT.

  Pour les SIO2, vous disposez d'une base de données personnelle avec des droits étendus afin de modifier ou créer des tables, procédures stockées, déclencheurs ou fonctions.

## Avant de commencer
- Familiarisez-vous avec cette base de données  
 ![image](https://github.com/ornech/DB_airline/assets/101867500/0b9ac547-fcc4-4cd5-9d4b-5be35cb35b10)

- Relisez vos notes
- Utilisez la documentation de mariadb
- Utilisez des ressources pour vous aider (et pas ChatGPT)

## Petit lexique du jargon du monde de l'aviation

- Une rotation: un aller/retour vers une destination
- Un CDB: une Commandant de bord
- OPL: Officier pilote de ligne, un second pilote
- CDC: Chef de cabine
- PNC: Hotesse
![image](https://github.com/ornech/DB_airline/assets/101867500/01b3ddc5-b34e-48e0-98a3-bc033ed65f47)

## Exercices "requêtes "
> ℹ️ Pour vous aider  
> https://mariadb.com/kb/en/select/
>
1. Affichez la liste des immatriculations et le modèle d'avion.
2. Comptez le nombre d'aéroports .
3. Affichez le nombre de sièges en classe « business » pour l'avion de votre choix.
4. Quel a été le vol qui a duré le plus longtemps ?


## Exercices "Jointures"
> ℹ️ Pour vous aidez  
> https://mariadb.com/kb/en/joining-tables-with-join-clauses/  
> https://mariadb.com/kb/en/more-advanced-joins/
> https://mariadb.com/kb/en/group-by/  


1. Affichez pour le vol de votre choix, la liste des passagers (N° de vol, Nom, Prénom et date de naissance du passager).
2. Pour le vol de votre choix, affichez le CDB et le N° de vol.
3. Pour le vol de votre choix, affichez l'immatriculation de l'avion utilisé et la ville de destination
4. Pour le vol de votre choix, affichez le numéro du siège (1B par exemple) et le nom du passager
5. Pour le vol de votre choix quels sont les sièges inoccupés ?
6. Affichez les passagers qui n'ont pas volé.

## Exercices "sous-requêtes"
> ℹ️ Pour vous aider  
> https://mariadb.com/kb/en/subqueries-scalar-subqueries/  
> https://mariadb.com/kb/en/subqueries-row-subqueries/  
> https://mariadb.com/kb/en/subqueries-in-a-from-clause/  
> https://mariadb.com/kb/en/in/  

1. Affichez le ou les pilotes (CDB ou OPL) qui ont effectué le plus grand nombre de vols en décembre 2023.
2. Pour le vol de votre choix, affichez le nombre de passagers en classe Business.
3. Calculez le nombre moyen de passagers par vol à destination de Rome.
5. Déterminez le nombre moyen de vols d’un naviguant.
6. Trouvez les 5 employés les plus sollicités (ayant le plus de vols à leur actif)
7. Quel est le temps de vol moyen des équipages pour le mois de Février ?
8. Déterminez le taux de remplissage des 3 lignes
9. Affichez les vols avec un nombre de passagers supérieur à la moyenne
10. Déterminez la tranche d’âge moyenne des passagers qui ont voyagé en classe Business à destination de Zurich

## Exercices "Vues"
> ℹ️ Pour vous aider
> https://mariadb.com/kb/en/create-view/

1. Créez une vue qui affiche le carnet de vol des avions (chaque ligne devra afficher, l'immatriculation de l'avion, son modèle, l'aéroport de départ, la date et heure de décollage, l'aéroport de destination la date et l'heure d'arrivée, le temps de vols)
2. Faites une vue qui affiche le carnet de vol des naviguants (nom, prénom, fonction, date (uniquement) du vol, n° de vol, aéroport de départ, aéroport de destination, temps de vol)

## Exercices "Triggers"
> ℹ️ Pour vous aider  
> https://mariadb.com/kb/en/create-trigger/  
> https://mariadb.com/kb/en/signal/  
> Pour les erreurs personnalisées, le SQLSTATE recommandé est « 45000 ».  

1. Ajoutez un trigger (Trigger_Update_Billet) sur la table Billets. Ce trigger doit vérifier si le siège modifié est disponible. Si c'est le cas le changement est enregistré. Si ce n'est pas le cas, ce trigger doit déclencher un erreur (SIGNAL)
2. Ajoutez un Trigger (Trigger_Create_Flight) à la table Flights. Ce trigger doit générer une erreur si le vols programmés n'a pas d'équipage

## Exercices "Procédures stockées"
> ℹ️ Pour vous aider  
> https://mariadb.com/kb/en/create-procedure/

1. Faites une procédure qui affiche la liste des passagers (Nom, prénom, siège (Allée et rangée) et date de naissance). Le n° de vol sera donné en argument.
2. Faites une procédure capable de programmer un nouveau vol (décollage à une date ultérieure) ainsi que son retour. L'aéroport de départ, destination ainsi que la date et l'heure seront donnée en arguments. (L'assignation des équipages se fera ultérieurement).



# Générez un nouveau jeu d'essai
1. Connectez vous à la base de données
mysql -u votre_utilisateur -p votre_base_de_donnees

2. Exécutez la procédure stockée Jeu_essai
``` sql
CALL Jeu_essai("YYYY-MM-DD");
```
Notez que la date transmise à la procédure sera la date du premier vol de votre jeu d'essai. Les vols et billets seront générés automatiquement de cette date jusqu'à la date du jour.

### Importez cette base de données
#### A partir de Dbeaver
1. Créez une base de données
2. Faite un clique droit sur votre nouvelle base de données
3. Outils -> Restore Database
4. Importer le dump de ce dépot  
![image](https://github.com/ornech/DB_airline/assets/101867500/3c81f4c0-1bc7-46a3-a1b1-0ec63eeb29e2)

#### Depuis un terminal
1. Récupérer le dump de la base de données
2. Connectez vous à la base de données
mysql -u votre_utilisateur -p
3. Créez une base de données
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
