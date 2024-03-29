1. Afficher la liste des immatriculations et le modèle d'avion.  
``` sql
SELECT Immatriculation , Model  FROM Aircrafts;
```

2. Comptez le nombre d'aéroports .
``` sql
SELECT COUNT(ID) FROM Airports ;
```

3. Afficher le nombre de sièges en la classe « business » pour l'avion de votre choix.
``` sql
SELECT count(ID) FROM Seats WHERE Aircraft_ID = 1 AND Seats.Classe = 'Business' ;
```

4. Quel a été le vol qui a duré le plus longtemps.
``` sql
SELECT MAX(TIMEDIFF(Arrival_Time, Departure_Time)) AS 'Temps de vol max' FROM Flights;
```

5. Affichez pour le vol de votre choix, la liste des passagers (Nom, Prénom et date de naissance du passager).
``` sql
SELECT Passagers.Nom , Passagers.Prenom , Passagers.Age  FROM Billets
JOIN Passagers ON Billets.Passenger_ID = Passagers.ID
WHERE Flight_ID = 1 ;
```

6. Pour le vol de votre choix, afficher La date du vol, le CDB et le N° de vol.
``` sql
SELECT Flights.Flight_Number, CONCAT(Employes.Prenom, " ", Employes.Nom ) AS CBD FROM Flights
JOIN Employes ON Flights.CDB = Employes.ID
WHERE Flights.ID = 54;
```

7. Pour le vol de votre choix, afficher l'immatriculation de l'avion utilisé et la ville de destination
8. Pour le vol de votre choix, afficher le numéro du siège (1B par exemple) et le nom du passager
9. Affichez le ou les pilotes (CDB ou OPL) qui ont effectués le plus grand nombres de vols.
10. Pour le vol de votre choix, affichez le nombre de passagers en classe Eco et en classe Business .
11. Calculer le nombre moyen de passagers
12. Déterminez le nombre de vol moyen d’un naviguant.
13. Trouver les 5 employés les plus sollicités (ayant le plus de vols à leur actif)
14. Affichez la liste des vols à destination d’Ajaccio au mois de Janvier.
15. Quel est le temps de vol moyen des équipages pour le mois de Février
16. Déterminez le taux de remplissage des 3 lignes
17. Affichez les vols avec un nombre de passagers supérieur à la moyenne
18. Affichez la liste des vols à destination d’Ajaccio au mois de Janvier
19. Affichez le temps de vol des avions pour les mois de janvier et février
20. Déterminez la tranche d’âge moyenne des passagers qui ont voyagé en classe Business à destination de Zurich
21. Quel est le temps de vol moyen des équipages pour le mois de Février ?
22. Quel est le temps de repos moyen des équipages ?

SELECT AVG(Nombre_de_vols) AS Moyenne_de_vols_par_employe
FROM (
    SELECT COUNT(Flights.ID) AS Nombre_de_vols
    FROM Flights
    JOIN Employes ON Flights.CDB = Employes.ID
    GROUP BY Employes.Nom
) AS Subquery;
