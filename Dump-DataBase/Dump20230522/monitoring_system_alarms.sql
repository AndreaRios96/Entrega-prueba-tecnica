-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: monitoring_system
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alarms`
--

DROP TABLE IF EXISTS `alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(1000) DEFAULT NULL,
  `hostname` varchar(1000) DEFAULT NULL,
  `namevariable` varchar(1000) DEFAULT NULL,
  `percentage` varchar(1000) DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarms`
--

LOCK TABLES `alarms` WRITE;
/*!40000 ALTER TABLE `alarms` DISABLE KEYS */;
INSERT INTO `alarms` VALUES (1,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-20 18:35:50'),(2,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-22 12:32:24'),(3,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-22 13:45:09'),(4,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-22 13:51:35'),(5,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-22 13:57:07'),(6,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-22 14:30:31'),(7,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-22 14:30:35'),(8,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-22 14:44:38'),(9,'192.168.1.18','localhost.localdomain','CPU','100','2023-05-22 14:46:10'),(10,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 14:47:56'),(11,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 14:53:01'),(12,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 14:58:07'),(13,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 15:03:12'),(14,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 15:13:23'),(15,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 15:23:33'),(16,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 15:28:39'),(17,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 15:33:46'),(18,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 15:38:51'),(19,'192.168.1.23','localhost.localdomain','CPU','100','2023-05-22 15:43:57');
/*!40000 ALTER TABLE `alarms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22 15:52:59
