-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: automat
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `appearance`
--

DROP TABLE IF EXISTS `appearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appearance` (
  `sticker` varchar(50) NOT NULL,
  `colour` varchar(50) NOT NULL,
  PRIMARY KEY (`sticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearance`
--

LOCK TABLES `appearance` WRITE;
/*!40000 ALTER TABLE `appearance` DISABLE KEYS */;
INSERT INTO `appearance` VALUES ('Ozon','blue'),('PickPoint','orange'),('Sberbank','green'),('Wildberries','purple'),('Yandex Market','yellow');
/*!40000 ALTER TABLE `appearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembly`
--

DROP TABLE IF EXISTS `assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembly` (
  `details_amount` int NOT NULL,
  `detail_code` varchar(10) NOT NULL,
  `model_name` varchar(10) NOT NULL,
  KEY `detail_code` (`detail_code`),
  KEY `model_name` (`model_name`),
  CONSTRAINT `assembly_ibfk_1` FOREIGN KEY (`detail_code`) REFERENCES `detail` (`detail_code`),
  CONSTRAINT `assembly_ibfk_2` FOREIGN KEY (`model_name`) REFERENCES `automat_model` (`model_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembly`
--

LOCK TABLES `assembly` WRITE;
/*!40000 ALTER TABLE `assembly` DISABLE KEYS */;
INSERT INTO `assembly` VALUES (67,'23','AT765'),(170,'56','AT765'),(77,'23','GT098');
/*!40000 ALTER TABLE `assembly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automat`
--

DROP TABLE IF EXISTS `automat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automat` (
  `serial_number` varchar(10) NOT NULL,
  `automat_price` int DEFAULT NULL,
  `model_name` varchar(10) NOT NULL,
  `sticker` varchar(50) NOT NULL,
  `production_department_number` int DEFAULT NULL,
  PRIMARY KEY (`serial_number`),
  KEY `model_name` (`model_name`),
  KEY `sticker` (`sticker`),
  KEY `production_department_number` (`production_department_number`),
  CONSTRAINT `automat_ibfk_1` FOREIGN KEY (`model_name`) REFERENCES `automat_model` (`model_name`),
  CONSTRAINT `automat_ibfk_2` FOREIGN KEY (`sticker`) REFERENCES `appearance` (`sticker`),
  CONSTRAINT `automat_ibfk_3` FOREIGN KEY (`production_department_number`) REFERENCES `production_department` (`production_department_number`),
  CONSTRAINT `zero_verification` CHECK ((`automat_price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automat`
--

LOCK TABLES `automat` WRITE;
/*!40000 ALTER TABLE `automat` DISABLE KEYS */;
INSERT INTO `automat` VALUES ('3457',350500,'WR880','Yandex Market',3),('3458',350000,'WR880','Ozon',3),('3459',345000,'WR880','PickPoint',3),('6417',400000,'GT098','PickPoint',2),('6946',500000,'AT765','Ozon',1),('6947',500000,'AT765','PickPoint',1),('7001',290000,'GT098','Wildberries',3);
/*!40000 ALTER TABLE `automat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automat_model`
--

DROP TABLE IF EXISTS `automat_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automat_model` (
  `model_name` varchar(10) NOT NULL,
  `cells_amount` int NOT NULL,
  `weight` int NOT NULL,
  PRIMARY KEY (`model_name`),
  CONSTRAINT `automat_model_chk_1` CHECK ((`cells_amount` > 0)),
  CONSTRAINT `automat_model_chk_2` CHECK ((`cells_amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automat_model`
--

LOCK TABLES `automat_model` WRITE;
/*!40000 ALTER TABLE `automat_model` DISABLE KEYS */;
INSERT INTO `automat_model` VALUES ('AT765',100,500),('GT098',70,300),('WR880',140,900);
/*!40000 ALTER TABLE `automat_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge`
--

DROP TABLE IF EXISTS `badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badge` (
  `badge_number` varchar(10) NOT NULL,
  `validity_period` date NOT NULL,
  `issue_date` date NOT NULL,
  PRIMARY KEY (`badge_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge`
--

LOCK TABLES `badge` WRITE;
/*!40000 ALTER TABLE `badge` DISABLE KEYS */;
INSERT INTO `badge` VALUES ('21','2024-09-22','2019-09-22'),('22','2023-11-24','2018-11-24'),('23','2023-12-21','2018-12-21');
/*!40000 ALTER TABLE `badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buying_department`
--

DROP TABLE IF EXISTS `buying_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buying_department` (
  `buying_department_number` int NOT NULL AUTO_INCREMENT,
  `manufacturing_date` date NOT NULL,
  `details_amount` int NOT NULL,
  `department_address` varchar(100) NOT NULL,
  PRIMARY KEY (`buying_department_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buying_department`
--

LOCK TABLES `buying_department` WRITE;
/*!40000 ALTER TABLE `buying_department` DISABLE KEYS */;
INSERT INTO `buying_department` VALUES (1,'2023-11-29',50000,'Moscow, Shchelkovskoe sh., 8, 105122'),(2,'2023-12-04',10000,'Moscow, Youth str., 2, 111402'),(3,'2023-12-27',100000,'Moscow, Timiryazevskaya str., 49, 127550');
/*!40000 ALTER TABLE `buying_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_code` varchar(10) NOT NULL,
  `delivery_price` int DEFAULT NULL,
  `delivery_address` varchar(100) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `provider_name` varchar(20) DEFAULT NULL,
  `installer_sequence_number` int DEFAULT NULL,
  `driver_sequence_number` int DEFAULT NULL,
  PRIMARY KEY (`delivery_code`),
  KEY `provider_name` (`provider_name`),
  KEY `installer_sequence_number` (`installer_sequence_number`),
  KEY `driver_sequence_number` (`driver_sequence_number`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`provider_name`) REFERENCES `provider` (`provider_name`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`installer_sequence_number`) REFERENCES `installer` (`installer_sequence_number`),
  CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`driver_sequence_number`) REFERENCES `driver` (`driver_sequence_number`),
  CONSTRAINT `check_for_zero` CHECK ((`delivery_price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES ('1551',9393,'Moscow, Andropova ave., 58, 115446','2024-12-30','Mail',1,1),('3735',10500,'Moscow, Andropova ave., 58, 115446','2023-11-12','Post',2,3),('3859',11500,'Moscow, Kashirskoe sh., 39, 115409','2023-12-15','Package',3,3),('5822',17500,'Moscow, Kashirskoe sh., 39, 115409','2023-12-21','Order',3,1),('6793',15500,'Moscow, Varshavskoe sh., 97, 117556','2023-11-23','Order',1,3),('7656',11000,'Moscow, Varshavskoe sh., 97, 117556','2023-12-17','Mail',1,2);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail` (
  `detail_code` varchar(10) NOT NULL,
  `detail_price` int NOT NULL,
  `warehouse_number` int NOT NULL,
  PRIMARY KEY (`detail_code`),
  KEY `warehouse_number` (`warehouse_number`),
  CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`warehouse_number`) REFERENCES `warehouse` (`warehouse_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
INSERT INTO `detail` VALUES ('23',10000,3),('56',5000,1),('98',7000,2);
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_sequence_number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `license_number` varchar(10) NOT NULL,
  `transport_number` varchar(10) NOT NULL,
  PRIMARY KEY (`driver_sequence_number`),
  KEY `license_number` (`license_number`),
  KEY `transport_number` (`transport_number`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`license_number`) REFERENCES `driver_license` (`license_number`),
  CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`transport_number`) REFERENCES `transport` (`transport_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Pyotr','Gorsky','84953567286','39700','B324OM'),(2,'Semen','Bolshoy','84951983341','43765','C876EX'),(3,'Mikhail','Morozov','84956512905','29453','H766TX'),(4,'Pyotr','Gorsky','+77567467686','39700','C876EX'),(5,'Pyotr','Gorsky','+77567467686','39700','H766TX');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_license`
--

DROP TABLE IF EXISTS `driver_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_license` (
  `license_number` varchar(10) NOT NULL,
  `category` varchar(5) NOT NULL,
  `validity_period` date NOT NULL,
  `issue_date` date NOT NULL,
  PRIMARY KEY (`license_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_license`
--

LOCK TABLES `driver_license` WRITE;
/*!40000 ALTER TABLE `driver_license` DISABLE KEYS */;
INSERT INTO `driver_license` VALUES ('29453','B','2023-12-07','2013-12-07'),('39700','C','2024-12-30','2014-12-30'),('43765','C','2026-03-12','2016-03-12');
/*!40000 ALTER TABLE `driver_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_sequence_number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `pass_number` varchar(10) NOT NULL,
  `production_department_number` int NOT NULL,
  PRIMARY KEY (`employee_sequence_number`),
  KEY `pass_number` (`pass_number`),
  KEY `production_department_number` (`production_department_number`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`pass_number`) REFERENCES `pass` (`pass_number`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`production_department_number`) REFERENCES `production_department` (`production_department_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Vasily','Ivanov','89413077658','201',1),(2,'Ivan','Petrov','89416547686','202',2),(3,'Ilya','Popov','89412875647','203',1),(4,'Gerg','Ty','+79096585885','204',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage`
--

DROP TABLE IF EXISTS `garage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage` (
  `garage_number` int NOT NULL AUTO_INCREMENT,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`garage_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage`
--

LOCK TABLES `garage` WRITE;
/*!40000 ALTER TABLE `garage` DISABLE KEYS */;
INSERT INTO `garage` VALUES (1,'Moscow, Vvedensky str., 1, 117342'),(2,'Moscow, Balaklavsky ave., 33, 117303'),(3,'Moscow, Golubinskaya str., 28, 117463');
/*!40000 ALTER TABLE `garage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installer`
--

DROP TABLE IF EXISTS `installer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `installer` (
  `installer_sequence_number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `badge_number` varchar(10) NOT NULL,
  PRIMARY KEY (`installer_sequence_number`),
  KEY `badge_number` (`badge_number`),
  CONSTRAINT `installer_ibfk_1` FOREIGN KEY (`badge_number`) REFERENCES `badge` (`badge_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installer`
--

LOCK TABLES `installer` WRITE;
/*!40000 ALTER TABLE `installer` DISABLE KEYS */;
INSERT INTO `installer` VALUES (1,'Gennady','Rostokin','89146519870','21'),(2,'Kirill','Horse','89149028788','22'),(3,'Alexander','Pushnoy','89148765143','23');
/*!40000 ALTER TABLE `installer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordering`
--

DROP TABLE IF EXISTS `ordering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordering` (
  `ordering_code` varchar(10) NOT NULL,
  `ordering_date` date NOT NULL,
  `serial_number` varchar(10) NOT NULL,
  `delivery_code` varchar(10) NOT NULL,
  PRIMARY KEY (`ordering_code`),
  KEY `serial_number` (`serial_number`),
  KEY `delivery_code` (`delivery_code`),
  CONSTRAINT `ordering_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `automat` (`serial_number`),
  CONSTRAINT `ordering_ibfk_2` FOREIGN KEY (`delivery_code`) REFERENCES `delivery` (`delivery_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordering`
--

LOCK TABLES `ordering` WRITE;
/*!40000 ALTER TABLE `ordering` DISABLE KEYS */;
INSERT INTO `ordering` VALUES ('1074','2022-07-01','3459','6793'),('7759','2022-10-23','6947','3735'),('8545','2022-06-07','6417','5822'),('9191','2022-05-10','6946','1551'),('9292','2022-04-19','3457','3859'),('9393','2022-03-11','3458','7656');
/*!40000 ALTER TABLE `ordering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pass`
--

DROP TABLE IF EXISTS `pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pass` (
  `pass_number` varchar(10) NOT NULL,
  `validity_period` date NOT NULL,
  `issue_date` date NOT NULL,
  PRIMARY KEY (`pass_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pass`
--

LOCK TABLES `pass` WRITE;
/*!40000 ALTER TABLE `pass` DISABLE KEYS */;
INSERT INTO `pass` VALUES ('201','2024-09-23','2021-09-23'),('202','2024-07-06','2021-07-06'),('203','2023-12-27','2020-12-27'),('204','2024-01-01','2022-01-01');
/*!40000 ALTER TABLE `pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_department`
--

DROP TABLE IF EXISTS `production_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_department` (
  `production_department_number` int NOT NULL AUTO_INCREMENT,
  `department_address` varchar(100) NOT NULL,
  PRIMARY KEY (`production_department_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_department`
--

LOCK TABLES `production_department` WRITE;
/*!40000 ALTER TABLE `production_department` DISABLE KEYS */;
INSERT INTO `production_department` VALUES (1,'Moscow, Vilnius str., 1, 117574'),(2,'Moscow, bul. Velasquez, 3, 142771'),(3,'Moscow, Golubinskaya str., 16, 117574');
/*!40000 ALTER TABLE `production_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `provider_name` varchar(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`provider_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES ('Mail','84563901723'),('Order','84562087361'),('Package','89515689559'),('Parcel','89513667112'),('Post','84561237856');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport` (
  `transport_number` varchar(10) NOT NULL,
  `transport_mark` varchar(50) NOT NULL,
  `load_capacity` int NOT NULL,
  `garage_number` int NOT NULL,
  PRIMARY KEY (`transport_number`),
  KEY `garage_number` (`garage_number`),
  CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`garage_number`) REFERENCES `garage` (`garage_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES ('A567IO','Hyundai',2000,2),('B324OM','Toyota',500,2),('C876EX','Volvo',2000,2),('F909TY','Fuso',1000,2),('H766TX','Kamaz',5000,1),('O411SE','Hino',3000,2),('S545ES','GAZ',3000,2);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `warehouse_number` int NOT NULL AUTO_INCREMENT,
  `location` varchar(100) NOT NULL,
  `buying_department_number` int NOT NULL,
  PRIMARY KEY (`warehouse_number`),
  KEY `buying_department_number` (`buying_department_number`),
  CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`buying_department_number`) REFERENCES `buying_department` (`buying_department_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Moscow, Andropova ave., 1, 115533',2),(2,'Moscow, Zeleny ave., 10, 111141',3),(3,'Moscow, Bolshoy Krug alley, 7, 105187',1);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warranty`
--

DROP TABLE IF EXISTS `warranty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warranty` (
  `warranty_number` varchar(10) NOT NULL,
  `validity_period` date NOT NULL,
  `serial_number` varchar(10) NOT NULL,
  PRIMARY KEY (`warranty_number`),
  KEY `serial_number` (`serial_number`),
  CONSTRAINT `warranty_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `automat` (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warranty`
--

LOCK TABLES `warranty` WRITE;
/*!40000 ALTER TABLE `warranty` DISABLE KEYS */;
INSERT INTO `warranty` VALUES ('148912','2033-01-01','6417'),('297574','2030-01-01','3459'),('700329','2028-01-01','6947');
/*!40000 ALTER TABLE `warranty` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-12 16:12:40
