CREATE DATABASE  IF NOT EXISTS `registro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `registro`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.99.100    Database: registro
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clientes` (
  `Nombre_cliente` varchar(100) NOT NULL,
  `Identificacion_cliente` varchar(15) NOT NULL,
  PRIMARY KEY (`Identificacion_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('Marly Montenegro','1001877142'),('Moises','1001892170'),('WOLFRAM DAVID','123456'),('jaisan naira','12345771'),('marly cachonaaa','3653427543276'),('gfdfgdfgdg','45634234'),('Osiris','45747514');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `factura` (
  `Num_factura` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cli` varchar(60) NOT NULL,
  `id_cli` varchar(15) NOT NULL,
  `nom_prod` varchar(45) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `valor_prod` int(11) NOT NULL,
  `cantidad_prod` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`Num_factura`),
  KEY `id_cli_idx` (`id_cli`),
  KEY `id_prod_idx` (`id_prod`),
  CONSTRAINT `id_cli` FOREIGN KEY (`id_cli`) REFERENCES `clientes` (`Identificacion_cliente`),
  CONSTRAINT `id_prod` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `cantidad` varchar(50) NOT NULL,
  `valor` varchar(200) NOT NULL,
  `fecha_ing` datetime DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(150) NOT NULL,
  `fk_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productos_proveedores_idx` (`fk_proveedor`),
  CONSTRAINT `fk_productos_proveedores` FOREIGN KEY (`fk_proveedor`) REFERENCES `proveedores` (`id_proveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (35,'JABON','22','3999','2020-01-01 00:00:00','JABON 100g',1),(37,'MANZANAS','4','600',NULL,'MANZANAS ROJAS',1),(38,'CEPILLOS','40','1800','2021-01-01 00:00:00','Para el Cabello',1),(39,'Celular','10','1200000',NULL,'Gama Alta',1),(43,'MÁQUINA DE ESTERILIZACIÓN','12','123',NULL,'demo',1),(44,'IPhone','2','2000000',NULL,'Alta Gama',1),(50,'Jabon Especial para la Piel','2','10000',NULL,'Especial para manos secas por alcohol',1),(51,'pc de escritorio','20','2000000',NULL,'demo',2),(54,'Celular Xiaomi 9 Pro','200','600000',NULL,'Celular Gama Alta',1),(57,'Portatil DELL','10','2000',NULL,'Equipo Sena',2),(58,'Portatil DELL','10','2000',NULL,'Equipo Sena',2);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proveedores` (
  `id_proveedores` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `calidad` int(11) DEFAULT '1' COMMENT 'Se Evaluan los proveedores de 1 a 100. ',
  `estado` int(11) DEFAULT '1' COMMENT '1= Activo, 0= Inactivo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la informacion de Proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'12345','Palmolive',75,1,'2021-06-25 13:43:41'),(2,'987654','Dell',95,1,'2021-06-25 13:44:29');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'registro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-13 17:28:15
