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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `Airports`
--

LOCK TABLES `Airports` WRITE;
/*!40000 ALTER TABLE `Airports` DISABLE KEYS */;
INSERT INTO `Airports` VALUES
(1,'Orly','Paris','LFPO','France',48.7262,2.3659),
(2,'El Prat','Barcelone','LEBL','Espagne',41.2971,2.0785),
(3,'Portela','Lisbonne','LPPT','Portugal',38.7742,-9.1342),
(4,'Fiumicino','Rome','LIRF','Italie',41.8045,12.2507),
(5,'Václav Havel','Prague','LKPR','République tchèque',50.1008,14.26),
(6,'Willy Brandt','Berlin','EDDB','Allemagne',52.3667,13.5033),
(7,'Elefthérios-Venizélos','Athènes','LGAV','Grèce',37.9364,23.9445),
(8,'Schwechat','Vienne','LOWW','Autriche',48.1102,16.5697),
(9,'Arlanda','Stockholm','ESSA','Suède',59.6519,17.9186),
(10,'Dublin','Dublin','EIDW','Irlande',53.4213,-6.2701),
(11,'Napoléon Bonaparte','Ajaccio','LFKJ','France',41.9206,8.7989),
(12,'Marrakech-Ménara','Marrakech','GMMX','Maroc',31.6062,-8.0363),
(13,'Budapest-Ferenc Liszt','Budapest','LHBP','Hongrie',47.4369,19.2556),
(14,'Bucarest-Henri Coandă','Bucarest','LROP','Roumanie',44.5717,26.08),
(15,'Saint-Pétersbourg-Pulkovo','Saint-Pétersbourg','ULLI','Russie',59.8,30.2625),
(16,'Copenhague-Kastrup','Copenhague','EKCH','Danemark',55.618,12.6561),
(17,'Helsinki-Vantaa','Helsinki','EFHK','Finlande',60.3172,24.9633),
(18,'Zurich','Zurich','LSZH','Suisse',47.4647,8.5492),
(19,'Oslo-Gardermoen','Oslo','ENGM','Norvège',60.1939,11.1004);
/*!40000 ALTER TABLE `Airports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-15 16:25:13
