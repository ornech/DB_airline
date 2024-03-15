-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: airline_dev
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB-1:10.11.7+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aircrafts`
--

DROP TABLE IF EXISTS `Aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aircrafts` (
  `ID` int(11) NOT NULL,
  `Constructeur` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Immatriculation` varchar(255) DEFAULT NULL,
  `Total_Capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Airports`
--

DROP TABLE IF EXISTS `Airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airports` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `Code_OACI` varchar(255) DEFAULT NULL,
  `Pays` varchar(255) DEFAULT NULL,
  `Lattitude` float DEFAULT NULL,
  `Longitude` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Billets`
--

DROP TABLE IF EXISTS `Billets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Billets` (
  `ID` varchar(255) DEFAULT NULL,
  `Passenger_ID` int(11) NOT NULL,
  `Flight_ID` int(11) NOT NULL,
  `Seat_ID` int(11) NOT NULL,
  PRIMARY KEY (`Passenger_ID`,`Flight_ID`,`Seat_ID`),
  KEY `Flight_ID` (`Flight_ID`),
  KEY `Seat_ID` (`Seat_ID`),
  CONSTRAINT `Billets_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `Passagers` (`ID`),
  CONSTRAINT `Billets_ibfk_2` FOREIGN KEY (`Flight_ID`) REFERENCES `Flights` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `Carnet_de_vol`
--

DROP TABLE IF EXISTS `Carnet_de_vol`;
/*!50001 DROP VIEW IF EXISTS `Carnet_de_vol`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Carnet_de_vol` AS SELECT
 1 AS `Flight_Number`,
  1 AS `Nom_Employe`,
  1 AS `Fonction_Employe`,
  1 AS `Departure_Airport`,
  1 AS `Arrival_Airport`,
  1 AS `Date_Departure`,
  1 AS `Heure_Departure`,
  1 AS `Temps_Vol` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Employes`
--

DROP TABLE IF EXISTS `Employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employes` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `Fonction` varchar(255) DEFAULT NULL,
  `Genre` varchar(1) NOT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Next_Available_Time` datetime DEFAULT NULL,
  `Duty_Time` time NOT NULL DEFAULT '00:00:00',
  `Location` int(11) NOT NULL DEFAULT 1 COMMENT 'Localisation du Personnel Naviguant (ID de la table Airport)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Flights`
--

DROP TABLE IF EXISTS `Flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Flight_Number` varchar(255) DEFAULT NULL,
  `Departure_Airport_ID` int(11) DEFAULT NULL,
  `Arrival_Airport_ID` int(11) DEFAULT NULL,
  `Aircraft_ID` int(11) DEFAULT NULL,
  `Departure_Time` datetime DEFAULT NULL,
  `Arrival_Time` datetime DEFAULT NULL,
  `CDB` int(11) DEFAULT NULL,
  `OPL` int(11) DEFAULT NULL,
  `CDC` int(11) DEFAULT NULL,
  `PNC1` int(11) DEFAULT NULL,
  `PNC2` int(11) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Departure_Airport_ID` (`Departure_Airport_ID`),
  KEY `Arrival_Airport_ID` (`Arrival_Airport_ID`),
  KEY `Aircraft_ID` (`Aircraft_ID`),
  KEY `Captain` (`CDB`),
  KEY `Pilote` (`OPL`),
  KEY `Chef_cabine` (`CDC`),
  KEY `PNC1` (`PNC1`),
  KEY `PNC` (`PNC2`),
  CONSTRAINT `Flights_ibfk_1` FOREIGN KEY (`Departure_Airport_ID`) REFERENCES `Airports` (`ID`),
  CONSTRAINT `Flights_ibfk_2` FOREIGN KEY (`Arrival_Airport_ID`) REFERENCES `Airports` (`ID`),
  CONSTRAINT `Flights_ibfk_3` FOREIGN KEY (`Aircraft_ID`) REFERENCES `Aircrafts` (`ID`),
  CONSTRAINT `Flights_ibfk_4` FOREIGN KEY (`CDB`) REFERENCES `Employes` (`ID`),
  CONSTRAINT `Flights_ibfk_5` FOREIGN KEY (`OPL`) REFERENCES `Employes` (`ID`),
  CONSTRAINT `Flights_ibfk_6` FOREIGN KEY (`CDC`) REFERENCES `Employes` (`ID`),
  CONSTRAINT `Flights_ibfk_7` FOREIGN KEY (`PNC1`) REFERENCES `Employes` (`ID`),
  CONSTRAINT `Flights_ibfk_8` FOREIGN KEY (`PNC2`) REFERENCES `Employes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2953 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER assign_crew_to_flight
AFTER UPDATE ON Flights
FOR EACH ROW
BEGIN
	
	-- -------------------------------------
	-- Assigne un naviguant à un vol
	-- -------------------------------------
	
    DECLARE Takeoff_Time DATETIME;
    DECLARE Arrival_Time DATETIME;
    DECLARE Temps_de_vol TIME;
    DECLARE PN1 INT ;
   	DECLARE Duty_CDB TIME;
   	DECLARE Duty_OPL TIME;
   	DECLARE Duty_CDC TIME;
   	DECLARE Duty_PNC1 TIME;
   	DECLARE Duty_PNC2 TIME;
    
    
    SELECT (TIMEDIFF(NEW.Arrival_Time, NEW.Departure_Time)) INTO Temps_de_vol;
   
    
	SELECT Duty_Time INTO Duty_CDB FROM Employes WHERE ID = NEW.CDB;
    UPDATE Employes SET Duty_Time = ADDTIME(Duty_CDB, Temps_de_vol) WHERE ID = NEW.CDB ;
    UPDATE Employes SET Location = NEW.Arrival_Airport_ID WHERE ID = NEW.CDB ;
    
    
	SELECT Duty_Time INTO Duty_OPL FROM Employes WHERE ID = NEW.OPL; 
    UPDATE Employes SET Duty_Time = ADDTIME(Duty_OPL, Temps_de_vol) WHERE ID = NEW.OPL ;
    UPDATE Employes SET Location = NEW.Arrival_Airport_ID WHERE ID = NEW.OPL ;

    
    SELECT Duty_Time INTO Duty_CDC FROM Employes WHERE ID = NEW.CDC;  
    UPDATE Employes SET Duty_Time = ADDTIME(Duty_CDC, Temps_de_vol) WHERE ID = NEW.CDC ;
    UPDATE Employes SET Location = NEW.Arrival_Airport_ID WHERE ID = NEW.CDC ; 
   
    
    SELECT Duty_Time INTO Duty_PNC1 FROM Employes WHERE ID = NEW.PNC1;  
    UPDATE Employes SET Duty_Time = ADDTIME(Duty_PNC1, Temps_de_vol) WHERE ID = NEW.PNC1 ;
    UPDATE Employes SET Location = NEW.Arrival_Airport_ID WHERE ID = NEW.PNC1 ;

    
    SELECT Duty_Time INTO Duty_PNC2 FROM Employes WHERE ID = NEW.PNC2;
    UPDATE Employes SET Duty_Time = ADDTIME(Duty_PNC2, Temps_de_vol) WHERE ID = NEW.PNC2 ;
    UPDATE Employes SET Location = NEW.Arrival_Airport_ID WHERE ID = NEW.PNC2 ;
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Passagers`
--

DROP TABLE IF EXISTS `Passagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Passagers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Ville` varchar(100) NOT NULL,
  `Genre` varchar(1) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Passport_Number` varchar(255) DEFAULT NULL,
  `Nationality` varchar(100) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Tel` varchar(255) DEFAULT NULL,
  `Credit_Card` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Seats`
--

DROP TABLE IF EXISTS `Seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seats` (
  `ID` int(11) NOT NULL,
  `Aircraft_ID` int(11) NOT NULL,
  `Seat_Number` int(11) NOT NULL,
  `Rang` int(11) NOT NULL,
  `Siege` varchar(1) NOT NULL,
  `Classe` varchar(8) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`Aircraft_ID`,`Seat_Number`),
  CONSTRAINT `Seats_ibfk_1` FOREIGN KEY (`Aircraft_ID`) REFERENCES `Aircrafts` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `Vue_Billets`
--

DROP TABLE IF EXISTS `Vue_Billets`;
/*!50001 DROP VIEW IF EXISTS `Vue_Billets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Vue_Billets` AS SELECT
 1 AS `N° vol`,
  1 AS `Nom_Passager`,
  1 AS `Prenom_Passager`,
  1 AS `Siege`,
  1 AS `Depart`,
  1 AS `T/O aate`,
  1 AS `T/O time`,
  1 AS `Destination`,
  1 AS `Landing date`,
  1 AS `Landing time`,
  1 AS `Immatriculation_Avion` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `Carnet_de_vol`
--

/*!50001 DROP VIEW IF EXISTS `Carnet_de_vol`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Carnet_de_vol` AS select `Flights`.`Flight_Number` AS `Flight_Number`,concat(`Employes`.`Nom`,' ',`Employes`.`Prenom`) AS `Nom_Employe`,`Employes`.`Fonction` AS `Fonction_Employe`,`DA`.`Nom` AS `Departure_Airport`,`AA`.`Nom` AS `Arrival_Airport`,cast(`Flights`.`Departure_Time` as date) AS `Date_Departure`,cast(`Flights`.`Departure_Time` as time) AS `Heure_Departure`,concat(lpad((time_to_sec(`Flights`.`Arrival_Time`) - time_to_sec(`Flights`.`Departure_Time`)) DIV 3600,2,'0'),':',lpad((time_to_sec(`Flights`.`Arrival_Time`) - time_to_sec(`Flights`.`Departure_Time`)) MOD 3600 DIV 60,2,'0')) AS `Temps_Vol` from (((`Flights` join `Employes` on(`Flights`.`CDB` = `Employes`.`ID` or `Flights`.`OPL` = `Employes`.`ID` or `Flights`.`CDC` = `Employes`.`ID` or `Flights`.`PNC1` = `Employes`.`ID` or `Flights`.`PNC2` = `Employes`.`ID`)) join `Airports` `DA` on(`Flights`.`Departure_Airport_ID` = `DA`.`ID`)) join `Airports` `AA` on(`Flights`.`Arrival_Airport_ID` = `AA`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vue_Billets`
--

/*!50001 DROP VIEW IF EXISTS `Vue_Billets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Vue_Billets` AS select `Flights`.`Flight_Number` AS `N° vol`,`Passagers`.`Nom` AS `Nom_Passager`,`Passagers`.`Prenom` AS `Prenom_Passager`,concat(`Seats`.`Rang`,`Seats`.`Siege`) AS `Siege`,concat(`Airports`.`Ville`,' - ',`Airports`.`Nom`) AS `Depart`,date_format(`Flights`.`Departure_Time`,'%d/%m/%Y') AS `T/O aate`,date_format(`Flights`.`Departure_Time`,'%H:%i') AS `T/O time`,`AirportsDest`.`Nom` AS `Destination`,date_format(`Flights`.`Arrival_Time`,'%d/%m/%Y') AS `Landing date`,date_format(`Flights`.`Arrival_Time`,'%H:%i') AS `Landing time`,`Aircrafts`.`Immatriculation` AS `Immatriculation_Avion` from ((((((`Billets` join `Passagers` on(`Billets`.`Passenger_ID` = `Passagers`.`ID`)) join `Flights` on(`Billets`.`Flight_ID` = `Flights`.`ID`)) join `Seats` on(`Billets`.`Seat_ID` = `Seats`.`ID`)) join `Airports` on(`Flights`.`Departure_Airport_ID` = `Airports`.`ID`)) join `Airports` `AirportsDest` on(`Flights`.`Arrival_Airport_ID` = `AirportsDest`.`ID`)) join `Aircrafts` on(`Flights`.`Aircraft_ID` = `Aircrafts`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-15 16:13:51
