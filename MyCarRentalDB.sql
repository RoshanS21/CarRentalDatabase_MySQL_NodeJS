-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_phase2
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Phone` varchar(14) NOT NULL,
  PRIMARY KEY (`CustID`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (201,'A. Parks','(214) 555-0127'),(202,'S. Patel','(849) 811-6298'),(203,'A. Hernandez','(355) 572-5385'),(204,'G. Carver','(753) 763-8656'),(205,'Sh. Byers','(912) 925-5332'),(206,'L. Lutz','(931) 966-1775'),(207,'L. Bernal','(884) 727-0591'),(208,'I. Whyte','(811) 979-7345'),(209,'L. Lott','(954) 706-2219'),(210,'G. Clarkson','(309) 625-1838'),(211,'Sh. Dunlap','(604) 581-6642'),(212,'H. Gallegos','(961) 265-8638'),(213,'L. Perkins','(317) 996-3104'),(214,'M. Beach','(481) 422-0282'),(215,'C. Pearce','(599) 881-5189'),(216,'A. Hess','(516) 570-6411'),(217,'M. Lee','(369) 898-6162'),(218,'R. Booker','(730) 784-6303'),(219,'A. Crowther','(325) 783-4081'),(220,'H. Mahoney','(212) 262-8829'),(221,'J. Brown','(644) 756-0110'),(222,'H. Stokes','(931) 969-7317'),(223,'J. Reeves','(940) 981-5113'),(224,'A. Mcghee','(838) 610-5802'),(225,'L. Mullen','(798) 331-7777'),(226,'R. Armstrong','(325) 783-4081'),(227,'J. Greenaway','(212) 262-8829'),(228,'K. Kaiser Acosta','(228) 576-1557'),(229,'D. Kirkpatrick','(773) 696-8009'),(230,'A. Odonnell','(439) 536-8929'),(231,'K. Kay','(368) 336-5403'),(232,'B.Shrestha','(837) 721-8965'),(233,'Bishesh','ALU BHAI'),(234,'12333','12334234'),(235,'12333','12334234'),(236,'12333','12334234'),(237,'12333','12334234'),(238,'1','1'),(239,'12','12'),(240,'123231231223213','321323'),(241,'123231231223213','321323'),(242,'123231231223213','321323'),(243,'',''),(244,'Yajju','123432'),(245,'theo','8174055216'),(246,'Randi','817666777');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `Type` int(11) NOT NULL,
  `Category` int(11) NOT NULL,
  `Weekly` float DEFAULT NULL,
  `Daily` float DEFAULT NULL,
  PRIMARY KEY (`Type`,`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (1,0,480,80),(1,1,600,100),(2,0,530,90),(2,1,660,110),(3,0,600,100),(3,1,710,120),(4,0,685,115),(4,1,800,135),(5,0,780,130),(5,1,900,150),(6,0,685,115),(6,1,800,135);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `CustID` int(11) NOT NULL,
  `VehicleID` varchar(45) NOT NULL,
  `StartDate` date NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `RentalType` int(11) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `TotalAmount` int(11) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Returned` int(11) NOT NULL,
  PRIMARY KEY (`CustID`,`VehicleID`,`StartDate`),
  KEY `veh_idx` (`VehicleID`),
  CONSTRAINT `cust` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`),
  CONSTRAINT `veh` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (203,'JM1BM1V35E1210570','2022-01-01',NULL,NULL,NULL,'2022-01-02',NULL,'2022-01-02',1),(203,'JM3KE4DY4F0441471','2019-09-09','2019-05-22',1,4,'2019-09-13',460,'2019-09-09',0),(210,'121','2011-09-09',NULL,NULL,NULL,'2011-09-11',NULL,'2011-09-09',1),(210,'19VDE1F3XEE414842','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL,1),(210,'3N1CN7APXEK444458','2021-11-11',NULL,NULL,NULL,'2020-11-11',NULL,'2020-11-11',1),(210,'5NPDH4AE2FH565275','2050-09-09',NULL,NULL,NULL,'2050-09-11',NULL,'2050-09-09',1),(210,'JTHFF2C26F135BX45','2019-05-01','2019-04-15',7,1,'2019-05-08',600,'2019-05-08',0),(210,'JTHFF2C26F135BX45','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL,1),(210,'WAUTFAFH0E0010613','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL,1),(210,'WBA3A9G51ENN73366','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL,1),(210,'WBA3B9C59EP458859','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL,1),(210,'WDCGG0EB0EG188709','2019-11-01','2019-10-28',7,2,'2019-11-15',1200,NULL,1),(212,'19VDE1F3XEE414842','2019-06-10','2019-04-15',7,3,'2019-07-01',1800,'2019-06-10',0),(216,'1N6BF0KM0EN101134','2019-08-02','2019-03-15',7,4,'2019-08-30',2740,'2019-08-02',0),(216,'1N6BF0KM0EN101134','2019-08-30','2019-03-15',1,2,'2019-09-01',230,'2019-08-02',0),(221,'19VDE1F3XEE414842','2019-07-01','2019-06-12',7,1,'2019-07-08',600,'2019-07-01',0),(221,'19VDE1F3XEE414842','2019-07-09','2019-06-12',1,2,'2019-07-11',200,'2019-07-01',0),(221,'19VDE1F3XEE414842','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL,1),(221,'JTHFF2C26F135BX45','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL,1),(221,'WAUTFAFH0E0010613','2019-07-01','2019-06-12',7,1,'2019-07-08',600,'2019-07-01',0),(221,'WAUTFAFH0E0010613','2019-07-09','2019-06-12',1,2,'2019-07-11',200,'2019-07-01',0),(221,'WAUTFAFH0E0010613','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL,1),(221,'WBA3A9G51ENN73366','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL,1),(221,'WBA3B9C59EP458859','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL,1),(221,'WDCGG0EB0EG188709','2020-01-01','2019-12-15',7,4,'2020-01-29',2400,NULL,1),(229,'19VDE1F3XEE414842','2019-05-06','2019-04-12',1,4,'2019-06-10',400,'2019-05-06',0),(229,'3MZBM1L74EM109736','2020-10-10',NULL,NULL,NULL,'2020-11-11',NULL,'2020-11-11',1),(229,'WAUTFAFH0E0010613','2019-05-06','2019-04-12',1,4,'2019-06-10',400,'2019-05-06',0);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `VehicleID` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Category` int(11) DEFAULT NULL,
  PRIMARY KEY (`VehicleID`),
  KEY `type_idx` (`Type`,`Category`),
  CONSTRAINT `catt` FOREIGN KEY (`Type`, `Category`) REFERENCES `rate` (`Type`, `Category`),
  CONSTRAINT `type` FOREIGN KEY (`Type`, `Category`) REFERENCES `rate` (`Type`, `Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('121','121',2012,2,1),('19VDE1F3XEE414842','Acura ILX',2014,1,1),('1FDEE3FL6EDA29122','Ford E 350',2014,6,0),('1FDRF3B61FEA87469','Ford Super Duty Pickup',2015,5,0),('1FTNF1CF2EKE54305','Ford F Series Pickup',2014,5,0),('1G1JD5SB3E4240835','Chevrolet Optra',2014,1,0),('1GB3KZCG1EF117132','Chevrolet Silverado',2014,5,0),('1HGCR2E3XEA305302','Honda Accord',2014,2,0),('1N4AB7AP2EN855026','Nissan Sentra',2014,1,0),('1N6BA0EJ9EN516565','Nissan Titan',2014,5,0),('1N6BF0KM0EN101134','Nissan NV',2014,6,0),('1VWCH7A3XEC037969','Volkswagen Passat',2014,2,1),('23232','23',2023,2,1),('2HGFB2F94FH501940','Honda Civic',2015,1,0),('2T3DFREV0FW317743','Toyota RAV4',2015,4,0),('3MZBM1L74EM109736','Mazda 3',2014,1,0),('3N1CE2CP0FL409472','Nissan Versa Note',2015,1,0),('3N1CN7APXEK444458','Nissan Versa',2014,1,0),('3VW2A7AU1FM012211','Volkswagen Golf',2015,1,0),('4S4BRCFC1E3203823','Subaru Outback',2014,4,0),('4S4BSBF39F3261064','Subaru Outback',2015,4,0),('4S4BSELC0F3325370','Subaru Outback',2015,4,0),('5FNRL6H58KB133711','Honda Odyssey',2019,6,1),('5J6RM4H90FL028629','Honda CR-V',2015,4,0),('5N1AL0MM8EL549388','Infiniti JX35',2014,4,1),('5NPDH4AE2FH565275','Hyundai Elantra',2015,1,0),('5TDBKRFH4ES26D590','Toyota Highlander',2014,4,0),('5XYKT4A75FG610224','Kia Sorento',2015,4,0),('5XYKU4A7XFG622415','Kia Sorento',2015,4,0),('5XYKUDA77EG449709','Kia Sorento',2014,4,0),('BBBG','Bh asa',2009,2,1),('JF1GPAA61F8314971','Subaru Impreza',2015,1,0),('JH4KC1F50EC800004','Acura RLX',2014,3,1),('JH4KC1F56EC000095','Acura RLX',2014,3,1),('JM1BM1V35E1210570','Mazda 3',2014,1,0),('JM3KE4DY4F0441471','Mazda CX5',2015,4,0),('JM3TB3DV0E0015742','Mazda CX9',2014,4,0),('JN8AS5MV0FW760408','Nissan Rogue Select',2015,4,0),('JTEZUEJR7E5081641','Toyota 4Runner',2014,4,0),('JTHBW1GG1F120DU53','Lexus ES 300h',2015,2,1),('JTHCE1BL3F151DE04','Lexus GS 350',2015,2,1),('JTHDL5EF9F5007221','Lexus LS 460',2015,3,1),('JTHFF2C26F135BX45','Lexus IS 250C',2015,1,1),('JTJHY7AX2F120EA11','Lexus LX 570',2015,4,1),('JTJJM7FX2E152CD75','Lexus GX460',2014,4,1),('JTMBFREV1FJ019885','Toyota RAV4',2015,4,0),('KM8SN4HF0FU107203','Hyundai Santa Fe',2015,4,0),('KMHJT3AF1FU028211','Hyundai Tucson',2015,4,0),('KMHTC6AD8EU998631','Hyundai Veloster',2014,1,0),('KNAFZ4A86E5195865','KIA Sportage',2014,4,0),('KNAFZ4A86E5195895','KIA Forte',2014,1,0),('KNAGN4AD2F5084324','Kia Optima Hybrid',2015,2,0),('KNALN4D75E5A57351','Kia Cadenza',2014,3,0),('KNALU4D42F6025717','Kia K900',2015,3,0),('KNDPCCA65F7791085','KIA Sportage',2015,4,0),('Randi','GGG',2091,2,1),('WA1LGAFE8ED001506','Audi Q7',2014,4,1),('WAU32AFD8FN005740','Audi A8',2015,3,1),('WAUTFAFH0E0010613','Audi A5',2014,1,1),('WBA3A9G51ENN73366','BMW 3 Series',2014,1,1),('WBA3B9C59EP458859','BMW 3 Series',2014,1,1),('WBAVL1C57EVR93286','BMW X1',2014,4,1),('WDCGG0EB0EG188709','Mercedes_Benz GLK',2014,1,1),('YV440MDD6F2617077','Volvo XC60',2015,4,1),('YV4940NB5F1191453','Volvo XC70',2015,4,1);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 16:50:08