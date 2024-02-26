-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: reserva_ya
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aficionado`
--

DROP TABLE IF EXISTS `aficionado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aficionado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `aficionado_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aficionado`
--

LOCK TABLES `aficionado` WRITE;
/*!40000 ALTER TABLE `aficionado` DISABLE KEYS */;
INSERT INTO `aficionado` VALUES (4,7),(5,8),(6,11),(7,13),(8,14);
/*!40000 ALTER TABLE `aficionado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancha`
--

DROP TABLE IF EXISTS `cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `capacidad` int NOT NULL,
  `techado` tinyint NOT NULL,
  `complejo_id` int DEFAULT NULL,
  `costo` int DEFAULT NULL,
  `referencia_cancha` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complejo_id` (`complejo_id`),
  CONSTRAINT `cancha_ibfk_1` FOREIGN KEY (`complejo_id`) REFERENCES `complejo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancha`
--

LOCK TABLES `cancha` WRITE;
/*!40000 ALTER TABLE `cancha` DISABLE KEYS */;
INSERT INTO `cancha` VALUES (1,5,1,4,300,NULL),(2,5,0,4,300,NULL),(3,5,0,4,300,NULL),(4,7,1,4,300,NULL),(5,5,0,1,500,NULL),(6,11,0,1,500,NULL),(7,7,0,1,500,NULL),(8,5,0,1,500,NULL),(9,5,1,5,600,NULL),(10,11,0,5,600,NULL),(11,7,1,5,600,NULL),(12,5,1,5,600,NULL),(13,5,0,2,250,NULL),(14,5,1,2,250,NULL),(15,5,1,2,250,NULL),(16,5,0,2,250,NULL),(17,7,1,3,450,NULL),(18,11,0,3,450,NULL),(19,7,0,3,450,NULL),(20,5,0,3,450,NULL),(21,5,1,3,450,NULL),(22,7,1,3,450,NULL),(23,5,1,3,450,NULL),(24,7,1,6,700,NULL);
/*!40000 ALTER TABLE `cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complejo`
--

DROP TABLE IF EXISTS `complejo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complejo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion_id` int DEFAULT NULL,
  `propietario_id` int DEFAULT NULL,
  `latitud` decimal(8,5) DEFAULT NULL,
  `longitud` decimal(8,5) DEFAULT NULL,
  `horario_inicio` datetime DEFAULT NULL,
  `horario_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dirreccion_id` (`direccion_id`),
  KEY `propietario_id` (`propietario_id`),
  CONSTRAINT `complejo_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`),
  CONSTRAINT `complejo_ibfk_2` FOREIGN KEY (`propietario_id`) REFERENCES `propietario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complejo`
--

LOCK TABLES `complejo` WRITE;
/*!40000 ALTER TABLE `complejo` DISABLE KEYS */;
INSERT INTO `complejo` VALUES (1,'Futbol Resto',2,NULL,-34.90816,-57.91680,NULL,NULL),(2,'El estadio de Futbol',6,NULL,-34.92565,-57.97683,NULL,NULL),(3,'CSyD Los Amigos',5,NULL,-34.92210,-57.97086,NULL,NULL),(4,'Club Deportivo LP',4,NULL,-34.92125,-57.93928,NULL,NULL),(5,'Rustico FC',3,NULL,-34.90960,-57.91693,NULL,NULL),(6,'Tiro Libre',7,NULL,-34.73952,-58.25310,NULL,NULL);
/*!40000 ALTER TABLE `complejo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `numero` int NOT NULL,
  `localidad_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localidad_id` (`localidad_id`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (2,'127',28,1),(3,'126',50,1),(4,'61',570,1),(5,'Diag 73',2547,1),(6,'25',471,1),(7,'Av. Vicente Lopez',3186,2);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigoPostal` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `provincia` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,1900,'La Plata','Buenos Aires'),(2,1882,'Ezpeleta','Buenos Aires'),(3,1876,'Bernal','Buenos Aires'),(4,1901,'Magdalena','Buenos Aires');
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `propietario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES (1,9,NULL),(2,10,NULL),(3,12,NULL),(4,15,NULL);
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cancha` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cancha` (`id_cancha`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_cancha`) REFERENCES `cancha` (`id`),
  CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `aficionado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,23,'2023-11-23',11,NULL),(2,23,'2023-11-23',15,NULL),(3,23,'2023-11-23',17,NULL),(4,23,'2023-11-23',20,NULL),(5,23,'2023-11-23',22,NULL),(6,5,'2023-11-23',12,NULL),(7,5,'2023-11-23',15,NULL),(8,5,'2023-11-23',16,NULL),(9,5,'2023-11-23',19,NULL),(10,5,'2023-11-23',22,NULL),(11,3,'2023-11-23',12,NULL),(12,3,'2023-11-23',15,NULL),(13,3,'2023-11-23',16,NULL),(14,3,'2023-11-23',19,NULL),(15,3,'2023-11-23',22,NULL),(16,6,'2023-11-23',15,NULL),(17,8,'2023-11-23',15,NULL),(18,7,'2023-11-23',15,NULL),(19,18,'2023-11-23',16,NULL),(20,1,'2023-11-23',16,NULL),(21,8,'2023-11-23',16,NULL),(22,6,'2023-11-23',19,NULL),(23,19,'2023-11-24',16,NULL),(24,2,'2023-11-23',16,NULL),(25,7,'2023-11-24',23,NULL),(26,14,'2023-11-24',21,NULL),(27,15,'2023-11-24',21,NULL),(28,16,'2023-11-24',21,NULL),(29,13,'2023-11-24',21,NULL),(30,9,'2024-02-06',15,NULL),(31,14,'2024-02-21',18,8),(32,14,'2024-02-21',18,8),(33,14,'2024-02-21',18,8),(34,16,'2024-02-21',18,8),(35,16,'2024-02-21',18,8),(36,13,'2024-02-21',18,8),(37,15,'2024-02-21',18,8),(38,18,'2024-02-22',21,8),(39,1,'2024-02-22',21,8),(40,11,'2024-02-24',15,8),(41,4,'2024-02-29',20,8),(42,17,'2024-02-23',21,8),(43,24,'2024-02-23',23,8),(44,3,'2024-02-24',3,8);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8mb4_general_ci NOT NULL,
  `correo_electronico` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `propietario` tinyint(1) NOT NULL,
  `cuil` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (7,'Enzo','enzo@gmail.com','12345678',0,NULL),(8,'Jorge','jorge@gmail.com','12345678',0,NULL),(9,'Propietario 1','propietario1@gmail.com','12345678',1,NULL),(10,'luis','luis@gmail.com','12345678',1,NULL),(11,'Martin','martin@gmail.com','12345678',0,NULL),(12,'enzo','enzo1@gmail.com','12345678',1,NULL),(13,'aficionado','aficionado@gmail.com','123456789',0,NULL),(14,'Pepe Argento','pepe_argento@gmail.com','12345678',0,NULL),(15,'pedro_picapiedra','pedro_picapiedra@gmail.com','12345678',1,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-24  4:01:16
