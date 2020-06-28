-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com    Database: GroupOne336
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Admin` (
  `adminID` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('123','abc');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aircrafts`
--

DROP TABLE IF EXISTS `Aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Aircrafts` (
  `aircraftID` int(11) NOT NULL AUTO_INCREMENT,
  `number_of_seats` int(11) DEFAULT NULL,
  PRIMARY KEY (`aircraftID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircrafts`
--

LOCK TABLES `Aircrafts` WRITE;
/*!40000 ALTER TABLE `Aircrafts` DISABLE KEYS */;
INSERT INTO `Aircrafts` VALUES (1,1),(2,2),(3,3),(4,4),(6,NULL);
/*!40000 ALTER TABLE `Aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airline_Company`
--

DROP TABLE IF EXISTS `Airline_Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Airline_Company` (
  `companyID` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airline_Company`
--

LOCK TABLES `Airline_Company` WRITE;
/*!40000 ALTER TABLE `Airline_Company` DISABLE KEYS */;
INSERT INTO `Airline_Company` VALUES ('CA','China Airline'),('UA','United Airline');
/*!40000 ALTER TABLE `Airline_Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Airport` (
  `airportID` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`airportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport`
--

LOCK TABLES `Airport` WRITE;
/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES ('CTU'),('EWR'),('JFK'),('MIA'),('PEK');
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Associate`
--

DROP TABLE IF EXISTS `Associate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Associate` (
  `companyID` varchar(2) NOT NULL DEFAULT '',
  `airportID` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`companyID`,`airportID`),
  KEY `airportID` (`airportID`),
  CONSTRAINT `Associate_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `Airline_Company` (`companyID`),
  CONSTRAINT `Associate_ibfk_2` FOREIGN KEY (`airportID`) REFERENCES `Airport` (`airportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Associate`
--

LOCK TABLES `Associate` WRITE;
/*!40000 ALTER TABLE `Associate` DISABLE KEYS */;
INSERT INTO `Associate` VALUES ('CA','CTU'),('UA','CTU'),('CA','JFK'),('UA','JFK'),('CA','MIA'),('UA','MIA'),('CA','PEK'),('UA','PEK');
/*!40000 ALTER TABLE `Associate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Contact` (
  `customerID` varchar(10) NOT NULL DEFAULT '',
  `CRID` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`customerID`,`CRID`),
  KEY `CRID` (`CRID`),
  CONSTRAINT `Contact_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `Customer` (`customerID`),
  CONSTRAINT `Contact_ibfk_2` FOREIGN KEY (`CRID`) REFERENCES `Customer_Representitive` (`CRID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer` (
  `customerID` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('666','123'),('ABD','123'),('djxnb','456'),('nbnbnb','abc'),('ttt','123');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Representitive`
--

DROP TABLE IF EXISTS `Customer_Representitive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer_Representitive` (
  `CRID` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CRID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Representitive`
--

LOCK TABLES `Customer_Representitive` WRITE;
/*!40000 ALTER TABLE `Customer_Representitive` DISABLE KEYS */;
INSERT INTO `Customer_Representitive` VALUES ('cody','456'),('djxnb','123'),('him','123');
/*!40000 ALTER TABLE `Customer_Representitive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Flight` (
  `flight_number` varchar(10) NOT NULL DEFAULT '',
  `domestic_or_international` varchar(13) DEFAULT NULL,
  `seat_avaiblity` int(11) NOT NULL DEFAULT '1',
  `arrival_airport` varchar(3) DEFAULT NULL,
  `departure_airport` varchar(10) DEFAULT NULL,
  `stops` int(11) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `operating_days` varchar(7) DEFAULT NULL,
  `total_fare` int(11) DEFAULT NULL,
  PRIMARY KEY (`flight_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight`
--

LOCK TABLES `Flight` WRITE;
/*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
INSERT INTO `Flight` VALUES ('CA110','domestic',1,'CTU','PEK',2,'09:00:01','12:00:00','1',1000),('CA400','international',1,'CTU','PEK',0,'01:30:00','05:00:00','2',500),('CA819','international',2,'EWR','PEK',1,'08:00:00','14:00:00','246',1500),('CA820','international',1,'PEK','EWR',1,'06:00:00','12:00:00','135',1600),('UA001','international',1,'EWR','PEK',0,'05:00:00','08:00:00','136',1150),('UA002','international',1,'PEK','EWR',0,'05:00:00','10:00:00','5',1150),('UA320','domestic',1,'JFK','EWR',1,'08:00:00','02:00:00','5',1300),('UA321','domestic',1,'EWR','JFK',1,'08:00:00','02:00:00','246',1200),('UA550','domestic',1,'MIA','JFK',1,'06:00:00','10:00:00','036',700),('UA760','domestic',1,'MIA','JFK',0,'23:00:00','04:00:00','146',500);
/*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Has`
--

DROP TABLE IF EXISTS `Has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Has` (
  `flight_number` varchar(10) NOT NULL,
  `list_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`flight_number`),
  KEY `list_index` (`list_index`),
  CONSTRAINT `Has_ibfk_1` FOREIGN KEY (`flight_number`) REFERENCES `Flight` (`flight_number`),
  CONSTRAINT `Has_ibfk_2` FOREIGN KEY (`list_index`) REFERENCES `Waiting_List` (`list_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Has`
--

LOCK TABLES `Has` WRITE;
/*!40000 ALTER TABLE `Has` DISABLE KEYS */;
INSERT INTO `Has` VALUES ('CA819',1),('CA820',2);
/*!40000 ALTER TABLE `Has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Is_IN`
--

DROP TABLE IF EXISTS `Is_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Is_IN` (
  `customerID` varchar(10) NOT NULL,
  `list_index` int(11) NOT NULL,
  PRIMARY KEY (`customerID`,`list_index`),
  KEY `list_index` (`list_index`),
  CONSTRAINT `Is_IN_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `Customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Is_IN_ibfk_2` FOREIGN KEY (`list_index`) REFERENCES `Waiting_List` (`list_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Is_IN`
--

LOCK TABLES `Is_IN` WRITE;
/*!40000 ALTER TABLE `Is_IN` DISABLE KEYS */;
INSERT INTO `Is_IN` VALUES ('666',1),('ABD',1),('djxnb',1),('nbnbnb',1),('666',2),('djxnb',2);
/*!40000 ALTER TABLE `Is_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manage`
--

DROP TABLE IF EXISTS `Manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Manage` (
  `CRID` varchar(10) NOT NULL DEFAULT '',
  `adminID` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`CRID`,`adminID`),
  KEY `adminID` (`adminID`),
  CONSTRAINT `Manage_ibfk_1` FOREIGN KEY (`CRID`) REFERENCES `Customer_Representitive` (`CRID`),
  CONSTRAINT `Manage_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `Admin` (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manage`
--

LOCK TABLES `Manage` WRITE;
/*!40000 ALTER TABLE `Manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Operate`
--

DROP TABLE IF EXISTS `Operate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Operate` (
  `companyID` varchar(2) NOT NULL DEFAULT '',
  `flight_number` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`flight_number`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `Operate_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `Airline_Company` (`companyID`),
  CONSTRAINT `Operate_ibfk_2` FOREIGN KEY (`flight_number`) REFERENCES `Flight` (`flight_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operate`
--

LOCK TABLES `Operate` WRITE;
/*!40000 ALTER TABLE `Operate` DISABLE KEYS */;
INSERT INTO `Operate` VALUES ('CA','CA110'),('CA','CA400'),('CA','CA819'),('CA','CA820'),('UA','UA001'),('UA','UA002'),('UA','UA320'),('UA','UA321'),('UA','UA550'),('UA','UA760');
/*!40000 ALTER TABLE `Operate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Owns_by`
--

DROP TABLE IF EXISTS `Owns_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Owns_by` (
  `ticket_number` int(11) NOT NULL,
  `customerID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ticket_number`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `Owns_by_ibfk_1` FOREIGN KEY (`ticket_number`) REFERENCES `Ticket` (`ticket_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Owns_by_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `Customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Owns_by`
--

LOCK TABLES `Owns_by` WRITE;
/*!40000 ALTER TABLE `Owns_by` DISABLE KEYS */;
INSERT INTO `Owns_by` VALUES (7,'666'),(8,'666'),(9,'666'),(11,'666'),(14,'666'),(18,'666'),(4,'abd'),(15,'abd'),(16,'abd'),(12,'djxnb'),(17,'djxnb'),(20,'djxnb'),(22,'djxnb'),(1,'nbnbnb'),(2,'nbnbnb'),(3,'nbnbnb'),(13,'nbnbnb'),(19,'nbnbnb'),(21,'nbnbnb'),(23,'nbnbnb');
/*!40000 ALTER TABLE `Owns_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relates_to`
--

DROP TABLE IF EXISTS `Relates_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Relates_to` (
  `flight_number` varchar(10) NOT NULL DEFAULT '',
  `ticket_number` int(11) NOT NULL,
  `departure_date` date DEFAULT NULL,
  PRIMARY KEY (`flight_number`,`ticket_number`),
  KEY `ticket_number` (`ticket_number`),
  CONSTRAINT `Relates_to_ibfk_1` FOREIGN KEY (`flight_number`) REFERENCES `Flight` (`flight_number`),
  CONSTRAINT `Relates_to_ibfk_2` FOREIGN KEY (`ticket_number`) REFERENCES `Ticket` (`ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relates_to`
--

LOCK TABLES `Relates_to` WRITE;
/*!40000 ALTER TABLE `Relates_to` DISABLE KEYS */;
INSERT INTO `Relates_to` VALUES ('CA110',1,'2018-08-19'),('CA110',9,'2019-04-13'),('CA110',16,'2018-08-19'),('CA400',2,'2020-01-01'),('CA819',3,'2011-01-01'),('CA819',18,'2018-06-02'),('CA819',20,'2018-02-20'),('CA819',21,'2019-08-12'),('CA819',22,'2019-08-09'),('CA819',23,'2019-08-14'),('CA820',3,'2019-08-01'),('CA820',17,'2019-05-12'),('CA820',19,'2018-02-20'),('CA820',20,'2018-02-25'),('CA820',22,'2019-08-08'),('CA820',23,'2020-08-13'),('UA001',4,'2020-01-01'),('UA001',11,'2017-12-11'),('UA002',4,'2021-08-09'),('UA320',5,'2019-01-09'),('UA321',5,'2018-07-03'),('UA550',6,'2019-01-08'),('UA760',7,'2020-09-10');
/*!40000 ALTER TABLE `Relates_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Ticket` (
  `ticket_number` int(11) NOT NULL AUTO_INCREMENT,
  `trip_type` varchar(9) DEFAULT NULL,
  `valid_for_change` tinyint(1) DEFAULT '0',
  `special_meal` varchar(50) DEFAULT NULL,
  `class` varchar(9) DEFAULT 'Economy',
  `seat_number` int(11) DEFAULT '200',
  `total_fare` int(11) DEFAULT '0',
  `date_of_purchase` date DEFAULT '2000-00-00',
  `time_of_purchase` time DEFAULT NULL,
  `booking_fee` int(11) DEFAULT '100',
  PRIMARY KEY (`ticket_number`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES (1,NULL,0,NULL,'Economy',200,200,'2000-00-00','00:00:00',100),(2,NULL,0,NULL,'Economy',200,200,'2000-00-00','00:00:00',100),(3,NULL,0,NULL,'Economy',200,200,'2000-00-00','00:00:00',100),(4,NULL,0,NULL,'Economy',200,200,'2000-00-00','00:00:00',100),(5,NULL,0,NULL,'Economy',200,200,'2000-00-00','00:00:00',100),(6,NULL,0,NULL,'Economy',200,200,'2000-00-00','00:00:00',100),(7,NULL,0,NULL,'Economy',200,200,'2000-00-00','00:00:00',100),(8,'round',0,NULL,'Economy',200,0,'2000-00-00','00:00:00',100),(9,NULL,0,NULL,'Economy',200,0,'2000-00-00','00:00:00',100),(11,NULL,0,NULL,'Economy',200,0,'2000-00-00','00:00:00',100),(12,'oneway',0,'no','Economy',100,1000,'2019-08-09','03:22:38',30),(13,'oneway',0,'sb','Economy',123,1500,'2019-08-09','03:25:08',30),(14,'oneway',0,'haha','Economy',211,1000,'2019-08-09','03:35:04',30),(15,'oneway',0,'sb','Economy',123,1000,'2019-08-09','03:40:06',30),(16,'oneway',0,'meat','Economy',5,1000,'2019-08-09','03:45:54',30),(17,'oneway',0,'no','Economy',12,500,'2019-08-09','03:53:33',30),(18,'oneway',0,'meatlover','Economy',1,1500,'2019-08-09','03:56:37',30),(19,'oneway',1,'water','First',1,1600,'2019-08-09','00:15:38',30),(20,'round',1,'food','Business',23,1500,'2019-08-09','00:38:47',30),(21,'oneway',0,'no food','Economy',1,1500,'2019-08-09','03:51:13',30),(22,'round',1,'drink water','First',2,1500,'2019-08-09','04:02:36',30),(23,'round',1,'veggie','First',1,1500,'2019-08-09','06:01:07',30),(32,'oneway',0,'NO','Economy',200,0,'2019-08-09','12:32:17',30);
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Waiting_List`
--

DROP TABLE IF EXISTS `Waiting_List`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Waiting_List` (
  `list_index` int(11) NOT NULL,
  PRIMARY KEY (`list_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Waiting_List`
--

LOCK TABLES `Waiting_List` WRITE;
/*!40000 ALTER TABLE `Waiting_List` DISABLE KEYS */;
INSERT INTO `Waiting_List` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `Waiting_List` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `owns` (
  `aircraftID` int(11) NOT NULL AUTO_INCREMENT,
  `companyID` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`aircraftID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`aircraftID`) REFERENCES `Aircrafts` (`aircraftID`),
  CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `Airline_Company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-09 12:43:29
