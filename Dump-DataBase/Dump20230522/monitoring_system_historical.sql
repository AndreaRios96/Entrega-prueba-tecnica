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
-- Table structure for table `historical`
--

DROP TABLE IF EXISTS `historical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historical` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(1000) DEFAULT NULL,
  `hostname` varchar(1000) DEFAULT NULL,
  `permemory` varchar(1000) DEFAULT NULL,
  `percpu` varchar(1000) DEFAULT NULL,
  `perdisk` varchar(1000) DEFAULT NULL,
  `timenow` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historical`
--

LOCK TABLES `historical` WRITE;
/*!40000 ALTER TABLE `historical` DISABLE KEYS */;
INSERT INTO `historical` VALUES (1,'192.168.1.18','localhost.localdomain','6.63793','3.8','20','2023-05-20 17:36:21'),(2,'192.168.1.18','localhost.localdomain','6.637','2.6','20','2023-05-20 17:41:25'),(3,'192.168.1.18','localhost.localdomain','6.65051','1.6','20','2023-05-20 17:46:27'),(4,'192.168.1.18','localhost.localdomain','6.64267','3.9','20','2023-05-20 17:51:32'),(5,'192.168.1.18','localhost.localdomain','6.63319','3.9','20','2023-05-20 17:56:36'),(6,'192.168.1.18','localhost.localdomain','6.61669','2.7','20','2023-05-20 18:01:40'),(7,'192.168.1.18','localhost.localdomain','6.70267','10.2','20','2023-05-20 18:06:45'),(8,'192.168.1.18','localhost.localdomain','6.69721','1.3','20','2023-05-20 18:11:49'),(9,'192.168.1.18','localhost.localdomain','6.69319','2.9','20','2023-05-20 18:16:54'),(10,'192.168.1.18','localhost.localdomain','6.70597','100','20','2023-05-20 18:21:59'),(11,'192.168.1.18','localhost.localdomain','6.66195','5','20','2023-05-20 18:27:03'),(12,'192.168.1.18','localhost.localdomain','6.65886','4.9','20','2023-05-20 18:32:08'),(13,'192.168.1.18','localhost.localdomain','6.63247','6.7','20','2023-05-20 18:37:12'),(14,'192.168.1.18','localhost.localdomain','6.63711','3.8','20','2023-05-20 18:42:16'),(15,'192.168.1.18','localhost.localdomain','6.65731','0.8','20','2023-05-22 12:24:49'),(16,'192.168.1.18','localhost.localdomain','6.62494','1.5','20','2023-05-22 12:27:22'),(17,'192.168.1.18','localhost.localdomain','6.63876','100','20','2023-05-22 12:32:24'),(18,'192.168.1.18','localhost.localdomain','6.62195','3','20','2023-05-22 12:45:28'),(19,'192.168.1.18','localhost.localdomain','6.62783','1.4','20','2023-05-22 12:47:48'),(20,'192.168.1.18','localhost.localdomain','6.63484','6.1','20','2023-05-22 12:52:52'),(21,'192.168.1.18','localhost.localdomain','6.64855','1.5','20','2023-05-22 12:57:55'),(22,'192.168.1.18','localhost.localdomain','6.63814','6.8','20','2023-05-22 13:02:59'),(23,'192.168.1.18','localhost.localdomain','6.64577','4.2','20','2023-05-22 13:08:02'),(24,'192.168.1.18','localhost.localdomain','6.62865','4.1','20','2023-05-22 13:13:05'),(25,'192.168.1.18','localhost.localdomain','6.67577','2.9','20','2023-05-22 13:18:08'),(26,'192.168.1.18','localhost.localdomain','6.67886','2.8','20','2023-05-22 13:23:11'),(27,'192.168.1.18','localhost.localdomain','6.68257','2.5','20','2023-05-22 13:28:15'),(28,'192.168.1.18','localhost.localdomain','6.70494','2.9','20','2023-05-22 13:33:18'),(29,'192.168.1.18','localhost.localdomain','6.6836','6.9','20','2023-05-22 13:38:21'),(30,'192.168.1.18','localhost.localdomain','6.68742','2.9','20','2023-05-22 13:43:31'),(31,'192.168.1.18','localhost.localdomain','6.66721','1.3','20','2023-05-22 13:44:54'),(32,'192.168.1.18','localhost.localdomain','6.68154','100','20','2023-05-22 13:45:09'),(33,'192.168.1.18','localhost.localdomain','6.68979','2.7','20','2023-05-22 13:47:16'),(34,'192.168.1.18','localhost.localdomain','6.6868','8.5','20','2023-05-22 13:47:27'),(35,'192.168.1.18','localhost.localdomain','6.69267','2.2','20','2023-05-22 13:47:41'),(36,'192.168.1.18','localhost.localdomain','6.69113','2.5','20','2023-05-22 13:47:54'),(37,'192.168.1.18','localhost.localdomain','6.67267','1.4','20','2023-05-22 13:48:06'),(38,'192.168.1.18','localhost.localdomain','6.68401','2.6','20','2023-05-22 13:48:19'),(39,'192.168.1.18','localhost.localdomain','6.68247','2.7','20','2023-05-22 13:51:21'),(40,'192.168.1.18','localhost.localdomain','6.67968','100','20','2023-05-22 13:51:35'),(41,'192.168.1.18','localhost.localdomain','6.69886','1.3','20','2023-05-22 13:53:06'),(42,'192.168.1.18','localhost.localdomain','6.67989','100','20','2023-05-22 13:57:07'),(43,'192.168.1.18','localhost.localdomain','6.66659','100','20','2023-05-22 14:30:31'),(44,'192.168.1.18','localhost.localdomain','6.66659','100','20','2023-05-22 14:30:35'),(45,'192.168.1.18','localhost.localdomain','6.61144','7.2','20','2023-05-22 14:32:18'),(46,'192.168.1.18','localhost.localdomain','6.62535','2.4','20','2023-05-22 14:32:21'),(47,'192.168.1.18','localhost.localdomain','6.60329','2.7','20','2023-05-22 14:36:29'),(48,'192.168.1.18','localhost.localdomain','6.61597','4.2','20','2023-05-22 14:36:31'),(49,'192.168.1.18','localhost.localdomain','6.617','4.3','20','2023-05-22 14:37:05'),(50,'192.168.1.18','localhost.localdomain','6.60896','1.5','20','2023-05-22 14:37:07'),(51,'192.168.1.18','localhost.localdomain','6.6237','2.9','20','2023-05-22 14:38:19'),(52,'192.168.1.18','localhost.localdomain','6.62504','1.5','20','2023-05-22 14:38:22'),(53,'192.168.1.18','localhost.localdomain','6.6236','1.5','20','2023-05-22 14:43:27'),(54,'192.168.1.18','localhost.localdomain','6.62144','2.9','20','2023-05-22 14:43:30'),(55,'192.168.1.18','localhost.localdomain','6.63133','100','20','2023-05-22 14:44:38'),(56,'192.168.1.18','localhost.localdomain','6.62731','2.6','20','2023-05-22 14:44:41'),(57,'192.168.1.18','localhost.localdomain','6.62484','100','20','2023-05-22 14:46:10'),(58,'192.168.1.18','localhost.localdomain','6.62731','2.5','20','2023-05-22 14:46:13'),(59,'192.168.1.18','localhost.localdomain','6.61958','4.4','20','2023-05-22 14:47:54'),(60,'192.168.1.23','localhost.localdomain','10.0924','100','20','2023-05-22 14:47:56'),(61,'192.168.1.18','localhost.localdomain','6.63855','5.2','20','2023-05-22 14:52:59'),(62,'192.168.1.23','localhost.localdomain','10.1098','100','20','2023-05-22 14:53:01'),(63,'192.168.1.18','localhost.localdomain','6.64041','4.4','20','2023-05-22 14:58:05'),(64,'192.168.1.23','localhost.localdomain','10.1152','100','20','2023-05-22 14:58:07'),(65,'192.168.1.18','localhost.localdomain','6.62587','4.2','20','2023-05-22 15:03:10'),(66,'192.168.1.23','localhost.localdomain','10.1149','100','20','2023-05-22 15:03:12'),(67,'192.168.1.18','localhost.localdomain','6.62092','1.5','20','2023-05-22 15:08:16'),(68,'192.168.1.23','localhost.localdomain','10.1373','3','20','2023-05-22 15:08:18'),(69,'192.168.1.18','localhost.localdomain','6.64288','10.3','20','2023-05-22 15:13:21'),(70,'192.168.1.23','localhost.localdomain','10.2414','100','20','2023-05-22 15:13:23'),(71,'192.168.1.18','localhost.localdomain','6.6368','1.5','20','2023-05-22 15:18:26'),(72,'192.168.1.23','localhost.localdomain','10.2639','3.1','20','2023-05-22 15:18:28'),(73,'192.168.1.18','localhost.localdomain','6.64247','4.1','20','2023-05-22 15:23:32'),(74,'192.168.1.23','localhost.localdomain','10.2612','100','20','2023-05-22 15:23:33'),(75,'192.168.1.18','localhost.localdomain','6.62669','1.4','20','2023-05-22 15:28:37'),(76,'192.168.1.23','localhost.localdomain','10.2665','100','20','2023-05-22 15:28:39'),(77,'192.168.1.18','localhost.localdomain','6.70525','1.4','20','2023-05-22 15:33:44'),(78,'192.168.1.23','localhost.localdomain','10.2612','100','20','2023-05-22 15:33:46'),(79,'192.168.1.18','localhost.localdomain','6.6303','2.9','20','2023-05-22 15:38:49'),(80,'192.168.1.23','localhost.localdomain','10.262','100','20','2023-05-22 15:38:51'),(81,'192.168.1.18','localhost.localdomain','6.64071','1.5','20','2023-05-22 15:43:55'),(82,'192.168.1.23','localhost.localdomain','10.2718','100','20','2023-05-22 15:43:57'),(83,'192.168.1.18','localhost.localdomain','6.6336','2.6','20','2023-05-22 15:49:01'),(84,'192.168.1.23','localhost.localdomain','10.2576','5.7','20','2023-05-22 15:49:02');
/*!40000 ALTER TABLE `historical` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22 15:52:58
