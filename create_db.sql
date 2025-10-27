
CREATE database SchoolSchedulingDB;
use SchoolSchedulingDB;
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
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildings` (
  `BuildingCode` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BuildingName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NumberOfFloors` smallint DEFAULT NULL,
  `ElevatorAccess` bit(1) NOT NULL DEFAULT b'0',
  `SiteParkingAvailable` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`BuildingCode`),
  KEY `NumberOfFloors` (`NumberOfFloors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
INSERT INTO `buildings` VALUES ('AS','Arts and Sciences',3,_binary '',_binary ''),('CC','College Center',3,_binary '',_binary '\0'),('GYM','PE and Wellness',1,_binary '\0',_binary ''),('IB','Instructional Building',3,_binary '',_binary ''),('LB','Library',2,_binary '',_binary ''),('TB','Technology Building',2,_binary '',_binary '');
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CategoryDescription` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DepartmentID` int DEFAULT '0',
  PRIMARY KEY (`CategoryID`),
  KEY `DepartmentID` (`DepartmentID`),
  CONSTRAINT `Categories_FK00` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('ACC','Accounting',1),('ART','Art',3),('BIO','Biology',2),('BUS','Business',1),('CHE','Chemistry',2),('CIS','Computer Information Systems',5),('CSC','Computer Science',5),('ECO','Economics',4),('ENG','English',3),('FRE','French',3),('GEG','Geography',4),('GER','German',3),('HIS','History',4),('JRN','Journalism',1),('MAT','Math',2),('MUS','Music',3),('PHY','Physics',2),('POL','Political Science',4),('PSY','Psychology',4);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_rooms`
--

DROP TABLE IF EXISTS `class_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_rooms` (
  `ClassRoomID` int NOT NULL,
  `BuildingCode` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PhoneAvailable` bit(1) NOT NULL DEFAULT b'0',
  `Capacity` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassRoomID`),
  KEY `BuildingNumber` (`BuildingCode`),
  CONSTRAINT `Class_Rooms_FK00` FOREIGN KEY (`BuildingCode`) REFERENCES `buildings` (`BuildingCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_rooms`
--

LOCK TABLES `class_rooms` WRITE;
/*!40000 ALTER TABLE `class_rooms` DISABLE KEYS */;
INSERT INTO `class_rooms` VALUES (1131,'LB',_binary '',30),(1142,'LB',_binary '\0',60),(1231,'LB',_binary '',20),(1514,'AS',_binary '',20),(1515,'AS',_binary '',25),(1519,'AS',_binary '\0',40),(1525,'AS',_binary '',15),(1530,'AS',_binary '',25),(1532,'AS',_binary '\0',50),(1619,'AS',_binary '\0',40),(1622,'AS',_binary '',20),(1624,'AS',_binary '\0',60),(1627,'AS',_binary '\0',75),(1639,'TB',_binary '',15),(1640,'TB',_binary '\0',50),(1641,'TB',_binary '\0',60),(1642,'TB',_binary '\0',35),(2357,'CC',_binary '',15),(2408,'IB',_binary '\0',110),(2423,'IB',_binary '\0',90),(3305,'IB',_binary '',25),(3307,'IB',_binary '\0',60),(3309,'IB',_binary '\0',70),(3313,'IB',_binary '\0',50),(3315,'IB',_binary '\0',45),(3317,'IB',_binary '',18),(3319,'IB',_binary '\0',40),(3322,'IB',_binary '\0',55),(3330,'IB',_binary '',25),(3343,'CC',_binary '\0',120),(3345,'CC',_binary '\0',90),(3346,'CC',_binary '',20),(3352,'CC',_binary '',30),(3353,'CC',_binary '\0',75),(3355,'CC',_binary '\0',50),(3404,'IB',_binary '\0',65),(3406,'IB',_binary '',20),(3409,'IB',_binary '',20),(3415,'IB',_binary '',15),(3420,'IB',_binary '\0',70),(3422,'IB',_binary '',25),(3431,'IB',_binary '\0',65),(3443,'CC',_binary '\0',100),(3445,'CC',_binary '',25),(3446,'CC',_binary '\0',70),(3452,'CC',_binary '\0',80),(3455,'CC',_binary '',30);
/*!40000 ALTER TABLE `class_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `ClassID` int NOT NULL,
  `SubjectID` int DEFAULT '0',
  `ClassRoomID` int DEFAULT '0',
  `Credits` tinyint DEFAULT '0',
  `SemesterNumber` smallint DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `Duration` smallint DEFAULT '0',
  `MondaySchedule` bit(1) NOT NULL DEFAULT b'0',
  `TuesdaySchedule` bit(1) NOT NULL DEFAULT b'0',
  `WednesdaySchedule` bit(1) NOT NULL DEFAULT b'0',
  `ThursdaySchedule` bit(1) NOT NULL DEFAULT b'0',
  `FridaySchedule` bit(1) NOT NULL DEFAULT b'0',
  `SaturdaySchedule` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ClassID`),
  KEY `SubjectID` (`SubjectID`),
  KEY `ClassRoomID` (`ClassRoomID`),
  CONSTRAINT `Classes_FK00` FOREIGN KEY (`ClassRoomID`) REFERENCES `class_rooms` (`ClassRoomID`),
  CONSTRAINT `Classes_FK01` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1000,11,1231,5,1,'2013-09-10','10:00:00',50,_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary ''),(1002,12,1619,4,1,'2013-09-09','15:30:00',110,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(1004,13,1627,4,1,'2013-09-09','08:00:00',50,_binary '',_binary '\0',_binary '',_binary '',_binary '',_binary '\0'),(1006,13,1627,4,1,'2013-09-09','09:00:00',110,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(1012,14,1627,4,1,'2013-09-10','13:00:00',110,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(1020,15,3404,4,1,'2013-09-10','13:00:00',110,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(1030,16,1231,5,1,'2013-09-09','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1031,16,1231,5,1,'2013-09-09','14:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1156,37,3443,5,1,'2013-09-09','16:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1162,37,3443,5,1,'2013-09-09','09:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(1168,37,3445,5,1,'2013-09-09','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1180,38,3446,5,1,'2013-09-09','11:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(1183,38,3415,5,1,'2013-09-09','13:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1184,38,3415,5,1,'2013-09-09','14:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1196,39,3415,5,1,'2013-09-09','15:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1500,33,1142,5,1,'2013-09-09','08:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1502,34,1142,5,1,'2013-09-09','09:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(1560,35,2408,3,1,'2013-09-10','10:00:00',50,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary ''),(1562,36,2408,5,1,'2013-09-09','12:00:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(1642,29,1514,2,1,'2013-09-10','11:00:00',50,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(2001,20,1519,5,1,'2013-09-09','07:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(2005,20,1515,5,1,'2013-09-10','11:00:00',50,_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary ''),(2015,21,1131,5,1,'2013-09-09','09:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(2051,22,1515,4,1,'2013-09-09','14:30:00',50,_binary '',_binary '',_binary '',_binary '',_binary '\0',_binary '\0'),(2071,50,1624,5,1,'2013-09-09','10:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2075,51,1624,5,1,'2013-09-09','07:00:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(2089,52,1624,5,1,'2013-09-10','16:00:00',50,_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary ''),(2103,53,1624,5,1,'2013-09-09','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2213,17,1532,5,1,'2013-09-09','10:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(2223,18,1532,5,1,'2013-09-09','12:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2245,19,1530,5,1,'2013-09-09','13:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(2410,23,1640,4,1,'2013-09-10','10:00:00',110,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(2420,24,1641,4,1,'2013-09-09','13:00:00',50,_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary ''),(2430,25,1642,4,1,'2013-09-09','15:00:00',50,_binary '',_binary '',_binary '\0',_binary '',_binary '\0',_binary ''),(2431,27,3322,5,1,'2013-09-09','14:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2451,27,1639,5,1,'2013-09-09','16:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2500,1,3305,3,1,'2013-09-09','16:00:00',50,_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0'),(2510,2,3307,3,1,'2013-09-10','13:00:00',80,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(2520,3,3309,3,1,'2013-09-10','09:00:00',50,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary ''),(2633,48,3420,5,1,'2013-09-10','16:00:00',50,_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary ''),(2639,49,3353,3,1,'2013-09-09','09:00:00',50,_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0'),(2647,49,3353,3,1,'2013-09-10','18:00:00',50,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary ''),(2889,45,2423,5,1,'2013-09-09','16:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2891,45,2423,5,1,'2013-09-09','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2895,45,2423,5,1,'2013-09-09','13:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2907,46,3445,5,1,'2013-09-09','08:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2911,46,3445,5,1,'2013-09-09','12:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2915,46,3353,5,1,'2013-09-09','10:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2917,47,3422,5,1,'2013-09-09','14:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2925,47,3422,5,1,'2013-09-09','15:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(2933,47,3422,5,1,'2013-09-10','09:00:00',280,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary ''),(3030,30,3352,5,1,'2013-09-14','09:00:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(3031,30,3352,5,1,'2013-09-09','13:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(3040,31,3352,5,1,'2013-09-09','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(3045,31,3352,5,1,'2013-09-09','12:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(3050,32,3343,5,1,'2013-09-09','16:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(3055,32,3317,5,1,'2013-09-09','15:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(3065,40,3345,5,1,'2013-09-09','08:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(3070,42,3346,5,1,'2013-09-09','10:30:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(3082,44,3346,5,1,'2013-09-09','08:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(3085,43,3346,5,1,'2013-09-09','15:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(3090,44,3346,5,1,'2013-09-09','13:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0'),(3115,54,3352,5,1,'2013-09-09','08:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(3120,54,3352,5,1,'2013-09-09','10:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(3123,56,3346,5,1,'2013-09-09','12:00:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(3600,41,3420,5,1,'2013-09-09','13:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(4000,11,1231,5,2,'2014-01-14','10:00:00',50,_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary ''),(4002,12,1619,4,2,'2014-01-13','15:30:00',110,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(4004,13,1627,4,2,'2014-01-13','08:00:00',50,_binary '',_binary '\0',_binary '',_binary '',_binary '',_binary '\0'),(4006,13,1627,4,2,'2014-01-13','09:00:00',110,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(4012,14,1627,4,2,'2014-01-14','13:00:00',110,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(4020,15,3404,4,2,'2014-01-14','13:00:00',110,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(4030,16,1231,5,2,'2014-01-13','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4031,16,1231,5,2,'2014-01-13','14:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4156,37,3443,5,2,'2014-01-13','16:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4162,37,3443,5,2,'2014-01-13','09:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(4168,37,3445,5,2,'2014-01-13','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4180,38,3446,5,2,'2014-01-13','11:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(4183,38,3415,5,2,'2014-01-13','13:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4184,38,3415,5,2,'2014-01-13','14:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4196,39,3415,5,2,'2014-01-13','15:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4500,33,1142,5,2,'2014-01-13','08:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4502,34,1142,5,2,'2014-01-13','09:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(4560,35,2408,3,2,'2014-01-14','10:00:00',50,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary ''),(4562,36,2408,5,2,'2014-01-13','12:00:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(4642,29,1514,2,2,'2014-01-14','11:00:00',50,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(5001,20,1519,5,2,'2014-01-13','07:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(5005,20,1515,5,2,'2014-01-14','11:00:00',50,_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary ''),(5015,21,1131,5,2,'2014-01-13','09:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(5051,22,1515,4,2,'2014-01-13','14:30:00',50,_binary '',_binary '',_binary '',_binary '',_binary '\0',_binary '\0'),(5071,50,1624,5,2,'2014-01-13','10:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5075,51,1624,5,2,'2014-01-13','07:00:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(5089,52,1624,5,2,'2014-01-14','16:00:00',50,_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary ''),(5103,53,1624,5,2,'2014-01-13','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5213,17,1532,5,2,'2014-01-13','10:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(5223,18,1532,5,2,'2014-01-13','12:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5245,19,1530,5,2,'2014-01-13','13:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(5410,23,1640,4,2,'2014-01-14','10:00:00',110,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(5420,24,1641,4,2,'2014-01-13','13:00:00',50,_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary ''),(5430,25,1642,4,2,'2014-01-13','15:00:00',50,_binary '',_binary '',_binary '\0',_binary '',_binary '\0',_binary ''),(5431,27,3322,5,2,'2014-01-13','14:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5451,27,1639,5,2,'2014-01-13','16:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5500,1,3305,3,2,'2014-01-13','16:00:00',50,_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0'),(5510,2,3307,3,2,'2014-01-14','13:00:00',80,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(5520,3,3309,3,2,'2014-01-14','09:00:00',50,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary ''),(5633,48,3420,5,2,'2014-01-14','16:00:00',50,_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary ''),(5639,49,3353,3,2,'2014-01-13','09:00:00',50,_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0'),(5647,49,3353,3,2,'2014-01-14','18:00:00',50,_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0',_binary ''),(5889,45,2423,5,2,'2014-01-13','16:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5891,45,2423,5,2,'2014-01-13','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5895,45,2423,5,2,'2014-01-13','13:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5907,46,3445,5,2,'2014-01-13','08:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5911,46,3445,5,2,'2014-01-13','12:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5915,46,3353,5,2,'2014-01-13','10:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5917,47,3422,5,2,'2014-01-13','14:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5925,47,3422,5,2,'2014-01-13','15:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(5933,47,3422,5,2,'2014-01-18','09:00:00',280,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary ''),(6030,30,3352,5,2,'2014-01-13','09:00:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(6031,30,3352,5,2,'2014-01-13','13:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(6040,31,3352,5,2,'2014-01-13','11:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(6045,31,3352,5,2,'2014-01-13','12:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(6050,32,3343,5,2,'2014-01-13','16:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(6055,32,3317,5,2,'2014-01-13','15:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(6065,40,3345,5,2,'2014-01-13','08:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0'),(6070,42,3346,5,2,'2014-01-13','10:30:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(6082,44,3346,5,2,'2014-01-13','08:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(6085,43,3346,5,2,'2014-01-13','15:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(6090,44,3346,5,2,'2014-01-13','13:30:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '',_binary '\0'),(6115,54,3352,5,2,'2014-01-13','08:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(6120,54,3352,5,2,'2014-01-13','10:00:00',50,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0'),(6123,56,3346,5,2,'2014-01-13','12:00:00',140,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0'),(6600,41,3420,5,2,'2014-01-13','13:00:00',140,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL,
  `DeptName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DeptChair` int DEFAULT '0',
  PRIMARY KEY (`DepartmentID`),
  KEY `StaffDepartments` (`DeptChair`),
  CONSTRAINT `Departments_FK00` FOREIGN KEY (`DeptChair`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Business Administration',98012),(2,'Sciences',98010),(3,'Humanities',98005),(4,'Social Sciences',98059),(5,'Information Technology',98007);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `StaffID` int NOT NULL,
  `Title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Status` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Tenured` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `Faculty_FK00` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (98005,'Instructor','Full Time',_binary ''),(98007,'Associate Professor','Full Time',_binary ''),(98010,'Associate Professor','On Leave',_binary ''),(98011,'Instructor','Full Time',_binary ''),(98012,'Instructor','Full Time',_binary ''),(98013,'Instructor','Full Time',_binary ''),(98014,'Professor','Full Time',_binary ''),(98019,'Instructor','Full Time',_binary ''),(98020,'Instructor','Full Time',_binary ''),(98025,'Associate Professor','Full Time',_binary ''),(98028,'Professor','Full Time',_binary ''),(98030,'Instructor','Full Time',_binary ''),(98036,'Professor','Full Time',_binary ''),(98040,'Associate Professor','Full Time',_binary ''),(98042,'Associate Professor','Full Time',_binary ''),(98045,'Professor','Full Time',_binary ''),(98048,'Professor','Full Time',_binary ''),(98052,'Instructor','Part Time',_binary '\0'),(98053,'Instructor','Full Time',_binary ''),(98055,'Professor','Full Time',_binary ''),(98059,'Instructor','Full Time',_binary ''),(98062,'Associate Professor','Full Time',_binary '\0'),(98063,'Instructor','Full Time',_binary ''),(98064,'Professor','Full Time',_binary '');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_categories`
--

DROP TABLE IF EXISTS `faculty_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_categories` (
  `StaffID` int NOT NULL,
  `CategoryID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ACC',
  PRIMARY KEY (`StaffID`,`CategoryID`),
  KEY `CategoriesFaculty_Categories` (`CategoryID`),
  KEY `FacultyFaculty_Categories` (`StaffID`),
  CONSTRAINT `Faculty_Categories_FK00` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
  CONSTRAINT `Faculty_Categories_FK01` FOREIGN KEY (`StaffID`) REFERENCES `faculty` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_categories`
--

LOCK TABLES `faculty_categories` WRITE;
/*!40000 ALTER TABLE `faculty_categories` DISABLE KEYS */;
INSERT INTO `faculty_categories` VALUES (98005,'ART'),(98005,'ENG'),(98005,'MUS'),(98007,'ACC'),(98007,'ART'),(98007,'CIS'),(98007,'MAT'),(98010,'ACC'),(98010,'CIS'),(98010,'MAT'),(98011,'ENG'),(98011,'HIS'),(98011,'MAT'),(98012,'ACC'),(98012,'ECO'),(98012,'MAT'),(98013,'CIS'),(98013,'CSC'),(98013,'MAT'),(98014,'ART'),(98014,'ENG'),(98014,'HIS'),(98019,'ART'),(98019,'ECO'),(98019,'MAT'),(98020,'CHE'),(98020,'CIS'),(98020,'PHY'),(98025,'ACC'),(98025,'BUS'),(98025,'MAT'),(98028,'ART'),(98028,'ENG'),(98028,'MUS'),(98030,'ART'),(98030,'ECO'),(98030,'HIS'),(98030,'MAT'),(98036,'ART'),(98036,'ENG'),(98036,'MUS'),(98040,'CIS'),(98040,'CSC'),(98040,'MAT'),(98042,'ECO'),(98042,'GEG'),(98042,'POL'),(98045,'ART'),(98045,'CIS'),(98045,'MUS'),(98048,'BUS'),(98048,'ECO'),(98048,'POL'),(98052,'BIO'),(98052,'CHE'),(98052,'MAT'),(98052,'PHY'),(98053,'BIO'),(98053,'CHE'),(98053,'PHY'),(98055,'ACC'),(98055,'BUS'),(98055,'ENG'),(98055,'MAT'),(98059,'ECO'),(98059,'HIS'),(98059,'POL'),(98062,'ACC'),(98062,'BUS'),(98062,'MAT'),(98063,'BIO'),(98063,'CHE'),(98063,'PHY'),(98064,'ENG'),(98064,'GEG'),(98064,'JRN');
/*!40000 ALTER TABLE `faculty_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_classes`
--

DROP TABLE IF EXISTS `faculty_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_classes` (
  `ClassID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`ClassID`,`StaffID`),
  KEY `ClassesFacultyClasses` (`ClassID`),
  KEY `StaffFacultyClasses` (`StaffID`),
  CONSTRAINT `Faculty_Classes_FK00` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`),
  CONSTRAINT `Faculty_Classes_FK01` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  CONSTRAINT `Faculty_CLasses_FK02` FOREIGN KEY (`StaffID`) REFERENCES `faculty` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_classes`
--

LOCK TABLES `faculty_classes` WRITE;
/*!40000 ALTER TABLE `faculty_classes` DISABLE KEYS */;
INSERT INTO `faculty_classes` VALUES (1000,98014),(1002,98036),(1004,98019),(1006,98045),(1012,98030),(1020,98028),(1030,98036),(1031,98005),(1156,98055),(1162,98064),(1168,98055),(1180,98011),(1183,98005),(1184,98011),(1196,98028),(1500,98028),(1502,98036),(1560,98028),(1562,98036),(2001,98020),(2005,98063),(2015,98053),(2051,98020),(2071,98020),(2075,98053),(2089,98052),(2103,98053),(2213,98052),(2223,98053),(2245,98063),(2410,98013),(2420,98007),(2430,98040),(2431,98012),(2451,98040),(2500,98012),(2510,98007),(2520,98055),(2633,98030),(2639,98011),(2647,98011),(2889,98040),(2891,98012),(2895,98013),(2907,98013),(2911,98013),(2915,98013),(2917,98025),(2925,98019),(2933,98025),(3030,98048),(3031,98030),(3040,98059),(3045,98042),(3050,98012),(3055,98012),(3065,98042),(3070,98030),(3082,98030),(3085,98059),(3090,98014),(3115,98048),(3120,98059),(3123,98059),(3600,98042),(4000,98014),(4002,98036),(4004,98019),(4006,98045),(4012,98030),(4020,98028),(4030,98036),(4031,98005),(4156,98055),(4162,98064),(4168,98055),(4180,98011),(4183,98005),(4184,98011),(4196,98028),(4500,98028),(4502,98036),(4560,98028),(4562,98036),(5001,98020),(5005,98063),(5015,98053),(5051,98020),(5071,98020),(5075,98053),(5089,98052),(5103,98053),(5213,98052),(5223,98053),(5245,98063),(5410,98013),(5420,98007),(5430,98040),(5431,98012),(5451,98040),(5500,98012),(5510,98007),(5520,98055),(5633,98030),(5639,98011),(5647,98011),(5889,98040),(5891,98012),(5895,98013),(5907,98013),(5911,98013),(5915,98013),(5917,98025),(5925,98019),(5933,98025),(6030,98048),(6031,98030),(6040,98059),(6045,98042),(6050,98012),(6055,98012),(6065,98042),(6070,98030),(6082,98030),(6085,98059),(6090,98014),(6115,98048),(6120,98059),(6123,98059),(6600,98042);
/*!40000 ALTER TABLE `faculty_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_subjects`
--

DROP TABLE IF EXISTS `faculty_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_subjects` (
  `StaffID` int NOT NULL DEFAULT '0',
  `SubjectID` int NOT NULL DEFAULT '0',
  `ProficiencyRating` double DEFAULT '0',
  PRIMARY KEY (`StaffID`,`SubjectID`),
  KEY `FacultyFacultySubjects` (`StaffID`),
  KEY `SubjectsFacultySubjects` (`SubjectID`),
  CONSTRAINT `Faculty_Subjects_FK00` FOREIGN KEY (`StaffID`) REFERENCES `faculty` (`StaffID`),
  CONSTRAINT `Faculty_Subjects_FK01` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_subjects`
--

LOCK TABLES `faculty_subjects` WRITE;
/*!40000 ALTER TABLE `faculty_subjects` DISABLE KEYS */;
INSERT INTO `faculty_subjects` VALUES (98005,12,10),(98005,16,10),(98005,34,9),(98005,36,8),(98005,38,8),(98007,2,9),(98007,5,10),(98007,14,8),(98007,24,10),(98007,46,10),(98010,2,8),(98010,5,10),(98010,24,8),(98010,48,10),(98011,38,9),(98011,43,8),(98011,49,10),(98012,1,9),(98012,4,10),(98012,32,9),(98012,45,9),(98013,23,9),(98013,26,8),(98013,27,10),(98013,28,9),(98013,46,10),(98014,11,9),(98014,15,9),(98014,39,9),(98014,42,9),(98014,44,9),(98019,13,9),(98019,32,9),(98019,47,8),(98020,20,8),(98020,22,10),(98020,25,8),(98020,50,8),(98020,52,8),(98025,3,10),(98025,7,10),(98025,9,10),(98025,47,10),(98028,11,8),(98028,15,10),(98028,33,9),(98028,35,8),(98028,39,8),(98030,14,10),(98030,30,8),(98030,42,10),(98030,44,9),(98030,48,9),(98036,12,10),(98036,16,9),(98036,34,9),(98036,36,8),(98040,25,8),(98040,27,8),(98040,28,10),(98040,45,8),(98042,31,9),(98042,40,8),(98042,41,10),(98042,55,8),(98042,56,9),(98045,13,10),(98045,23,8),(98045,26,9),(98045,33,9),(98045,35,9),(98048,7,10),(98048,9,8),(98048,30,8),(98048,54,9),(98048,55,10),(98052,17,8),(98052,18,8),(98052,21,10),(98052,50,10),(98052,52,9),(98053,18,9),(98053,19,9),(98053,21,8),(98053,51,9),(98053,53,9),(98055,3,8),(98055,6,8),(98055,8,9),(98055,10,10),(98055,37,10),(98059,31,8),(98059,43,10),(98059,54,9),(98059,56,9),(98062,1,10),(98062,4,8),(98062,6,8),(98062,8,10),(98062,10,10),(98062,49,9),(98063,17,9),(98063,19,9),(98063,20,9),(98063,22,8),(98063,51,9),(98063,53,8),(98064,37,8),(98064,40,9),(98064,41,8);
/*!40000 ALTER TABLE `faculty_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `majors` (
  `MajorID` int NOT NULL,
  `Major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MajorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES (1,'General Studies'),(2,'English'),(3,'Music'),(4,'Information Sciences'),(5,'Accounting'),(6,'Art'),(7,'Mathematics');
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `StfFirstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StfLastname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StfStreetAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StfCity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StfState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StfZipCode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StfAreaCode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StfPhoneNumber` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Salary` decimal(15,2) DEFAULT NULL,
  `DateHired` date DEFAULT NULL,
  `Position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `StaffZipCode` (`StfZipCode`),
  KEY `StudAreaCode` (`StfAreaCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (98005,'Suzanne','Viescas','15127 NE 24th, #383','Redmond','WA','98052','425','555-2686',44000.00,'1986-05-31','Faculty'),(98007,'Gary','Hallmark','Route 2, Box 203B','Auburn','WA','98002','253','555-2676',53000.00,'1985-01-21','Faculty'),(98010,'Jeffrey','Smith','30301 - 166th Ave. N.E.','Fremont','CA','94538','510','555-2596',52000.00,'1983-10-06','Faculty'),(98011,'Ann','Patterson','16 Maple Lane','Auburn','WA','98002','253','555-2591',45000.00,'1983-10-16','Faculty'),(98012,'Robert','Brown','672 Lamont Ave','Houston','TX','77201','713','555-2491',49000.00,'1989-02-09','Faculty'),(98013,'Deb','Waldal','908 W. Capital Way','Tacoma','WA','98413','253','555-2496',44000.00,'1986-07-05','Faculty'),(98014,'Peter','Brehm','722 Moss Bay Blvd.','Kirkland','WA','98033','425','555-2501',60000.00,'1986-07-16','Faculty'),(98019,'Mariya','Sergienko','901 Pine Avenue','Portland','OR','97208','503','555-2526',45000.00,'1989-11-02','Faculty'),(98020,'Jim','Glynn','13920 S.E. 40th Street','Bellevue','WA','98009','425','555-2531',45000.00,'1985-08-02','Faculty'),(98021,'Tim','Smith','30301 - 166th Ave. N.E.','Seattle','WA','98106','206','555-2536',40000.00,'1988-12-17','Registrar'),(98025,'Carol','Viescas','722 Moss Bay Blvd.','Kirkland','WA','98033','425','555-2576',50000.00,'1984-04-12','Faculty'),(98028,'Alaina','Hallmark','Route 2, Box 203B','Woodinville','WA','98072','425','555-2631',57000.00,'1984-01-17','Faculty'),(98030,'Liz','Keyser','13920 S.E. 40th Street','Bellevue','WA','98006','425','555-2556',48000.00,'1988-05-31','Faculty'),(98036,'Sam','Abolrous','611 Alpine Drive','Palm Springs','CA','92263','760','555-2611',60000.00,'1982-11-20','Faculty'),(98040,'Jim','Wilson','101 NE 88th','Salem','OR','97301','503','555-2636',50000.00,'1987-01-13','Faculty'),(98042,'David','Smith','311 20th Ave. N.E.','Fremont','CA','94538','510','555-2646',52000.00,'1991-12-17','Faculty'),(98043,'Kathryn','Patterson','16 Maple Lane','Seattle','WA','98115','206','555-2651',25000.00,'1984-11-14','Secretary'),(98045,'Michael','Hernandez','PO Box 223311','Tacoma','WA','98413','253','555-2711',60000.00,'1990-08-20','Faculty'),(98048,'Joyce','Bonnicksen','2424 Thames Drive','Bellevue','WA','98006','425','555-2726',60000.00,'1986-03-02','Faculty'),(98052,'Katherine','Ehrlich','777 Fenexet Blvd','Redmond','WA','98052','425','555-0399',45000.00,'1985-03-08','Faculty'),(98053,'Caleb','Viescas','4501 Wetland Road','Long Beach','CA','90809','562','555-0037',45000.00,'1992-02-10','Faculty'),(98055,'Alastair','Black','3887 Easy Street','Seattle','WA','98125','206','555-0039',60000.00,'1988-12-11','Faculty'),(98057,'Joe','Rosales III','7288 Barrister Ave N','Tacoma','WA','98413','253','555-2281',35000.00,'1988-11-25','Graduate Advisor'),(98059,'Maria','Patterson','3445 Cheyenne Road','El Paso','TX','79993','915','555-2291',48000.00,'1986-09-17','Faculty'),(98062,'Caroline','Coie','298 Forest Lane','Seattle','WA','98125','206','555-2306',52000.00,'1983-01-28','Faculty'),(98063,'Kirk','DeGrasse','455 West Palm Ave','San Antonio','TX','78284','210','555-2311',45000.00,'1988-03-02','Faculty'),(98064,'Luke','Patterson','877 145th Ave SE','Portland','OR','97208','503','555-2316',56000.00,'1989-08-20','Faculty');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_class_status`
--

DROP TABLE IF EXISTS `student_class_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_class_status` (
  `ClassStatus` int NOT NULL DEFAULT '0',
  `ClassStatusDescription` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ClassStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class_status`
--

LOCK TABLES `student_class_status` WRITE;
/*!40000 ALTER TABLE `student_class_status` DISABLE KEYS */;
INSERT INTO `student_class_status` VALUES (1,'Enrolled'),(2,'Completed'),(3,'Withdrew');
/*!40000 ALTER TABLE `student_class_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_schedules`
--

DROP TABLE IF EXISTS `student_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_schedules` (
  `StudentID` int NOT NULL,
  `ClassID` int NOT NULL,
  `ClassStatus` int DEFAULT '0',
  `Grade` double DEFAULT '0',
  PRIMARY KEY (`StudentID`,`ClassID`),
  KEY `ClassesStudent_Schedules` (`ClassID`),
  KEY `Student_Class_StatusStudent_Schedules` (`ClassStatus`),
  KEY `StudentsStudent_Schedules` (`StudentID`),
  CONSTRAINT `Student_Schedules_FK00` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`),
  CONSTRAINT `Student_Schedules_FK01` FOREIGN KEY (`ClassStatus`) REFERENCES `student_class_status` (`ClassStatus`),
  CONSTRAINT `Student_Schedules_FK02` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_schedules`
--

LOCK TABLES `student_schedules` WRITE;
/*!40000 ALTER TABLE `student_schedules` DISABLE KEYS */;
INSERT INTO `student_schedules` VALUES (1001,1000,2,99.83),(1001,1168,2,70),(1001,2907,2,67.33),(1001,3085,2,87.14),(1001,4180,1,0),(1001,5917,1,0),(1001,6082,1,0),(1002,1156,2,86.33),(1002,1500,2,85.72),(1002,2223,3,0),(1002,2889,2,68.22),(1003,1156,2,71.09),(1003,1500,2,89.05),(1003,1502,2,75.71),(1003,2911,2,85.39),(1003,4180,1,0),(1003,4560,1,0),(1003,6082,1,0),(1004,1162,2,91.44),(1004,2410,2,90.56),(1004,2907,2,74.23),(1004,4020,1,0),(1004,4180,1,0),(1004,5430,1,0),(1004,6082,1,0),(1005,1000,2,82.19),(1005,1180,2,81.66),(1005,2500,2,80.51),(1005,2907,2,94.33),(1005,4196,1,0),(1005,5510,1,0),(1005,5917,1,0),(1006,1000,2,73.04),(1006,1030,2,69.34),(1006,1156,2,98.07),(1006,2895,2,69.6),(1006,4002,1,0),(1006,4180,1,0),(1006,5907,1,0),(1007,1180,2,72.88),(1007,2015,2,66.2),(1007,2500,2,91.12),(1007,2907,2,65.8),(1007,4196,1,0),(1007,5071,1,0),(1007,5933,1,0),(1008,1000,2,89.32),(1008,1168,2,97.59),(1008,2907,2,88.27),(1008,3085,2,67.6),(1008,4180,1,0),(1008,5917,1,0),(1008,6082,1,0),(1009,1156,2,72.05),(1009,1500,2,71.66),(1009,2223,2,93.05),(1009,2889,2,70.99),(1009,4183,1,0),(1009,4196,1,0),(1009,6030,1,0),(1010,1156,2,87.4),(1010,1500,2,97.84),(1010,1502,2,86.57),(1010,2911,3,0),(1011,1020,2,87.65),(1011,1162,2,93.01),(1011,2410,2,92.36),(1011,2907,2,88.58),(1011,4180,1,0),(1011,5430,1,0),(1011,6082,1,0),(1012,1000,2,71.15),(1012,1180,2,67.6),(1012,2500,2,77.34),(1012,2907,2,66.15),(1012,4196,1,0),(1012,5510,1,0),(1012,5917,1,0),(1013,1000,2,69.67),(1013,1030,2,77.07),(1013,1156,2,77.59),(1013,2895,2,93.19),(1013,4002,1,0),(1013,4180,1,0),(1013,5907,1,0),(1014,1180,2,88.91),(1014,2015,2,77.01),(1014,2500,2,88.5),(1014,2907,2,72),(1014,4196,1,0),(1014,5071,1,0),(1014,5933,1,0),(1015,1156,2,91.66),(1015,1500,2,85.01),(1015,2223,2,94.54),(1015,2889,2,77.58),(1015,4183,1,0),(1015,4196,1,0),(1015,6030,1,0),(1016,1162,2,82.58),(1016,2410,2,98.01),(1016,2907,2,72.01),(1016,4020,1,0),(1016,4180,1,0),(1016,5430,1,0),(1016,6082,1,0),(1017,1000,2,69.46),(1017,1030,2,97.81),(1017,1156,2,88.54),(1017,2895,2,70.55),(1017,4002,1,0),(1017,4180,1,0),(1017,5907,1,0),(1018,1180,2,67.19),(1018,2015,2,98.31),(1018,2500,2,79.61),(1018,2907,2,93.32),(1018,4196,1,0),(1018,5071,1,0),(1018,5933,1,0);
/*!40000 ALTER TABLE `student_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` int NOT NULL,
  `StudFirstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudLastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudStreetAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudCity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudZipCode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudAreaCode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudPhoneNumber` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudBirthDate` date DEFAULT NULL,
  `StudGender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudMaritalStatus` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StudMajor` int DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `StudAreaCode` (`StudAreaCode`),
  KEY `StudZipCode` (`StudZipCode`),
  KEY `StudMajor` (`StudMajor`),
  CONSTRAINT `Students_FK00` FOREIGN KEY (`StudMajor`) REFERENCES `majors` (`MajorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1001,'Kerry','Patterson','9877 Hacienda Drive','San Antonio','TX','78284','210','555-2706','1991-10-01','F','S',1),(1002,'David','Hamilton','908 W. Capital Way','Tacoma','WA','98413','253','555-2701','1995-11-02','M','S',2),(1003,'Betsy','Stadick','611 Alpine Drive','Palm Springs','CA','92263','760','555-2696','1989-03-13','F','W',3),(1004,'Janice','Galvin','4110 Old Redmond Rd.','Redmond','WA','98052','425','555-2691','1994-07-04','F','S',4),(1005,'Doris','Hartwig','4726 - 11th Ave. N.E.','Seattle','WA','98105','206','555-2671','1992-08-12','F','D',5),(1006,'Scott','Bishop','66 Spring Valley Drive','Medford','OR','97501','541','555-2666','1995-07-11','M','S',6),(1007,'Elizabeth','Hallmark','Route 2, Box 203B','Auburn','WA','98002','253','555-2521','1996-08-29','F','S',7),(1008,'Sara','Sheskey','16679 NE 41st Court','Portland','OR','97208','503','555-2566','1989-08-15','F','M',1),(1009,'Karen','Smith','30301 - 166th Ave. N.E.','Eugene','OR','97401','541','555-2551','1993-12-05','F','S',2),(1010,'Marianne','Wier','908 W. Capital Way','Tacoma','WA','98413','253','555-2606','1996-03-08','F','S',3),(1011,'John','Kennedy','16679 NE 41st Court','Portland','OR','97208','503','555-2621','1991-04-18','M','S',4),(1012,'Sarah','Thompson','2222 Springer Road','Lubbock','TX','79402','806','555-2626','1994-01-11','F','S',5),(1013,'Michael','Viescas','15127 NE 24th, #383','Redmond','WA','98052','425','555-2656','1995-09-22','M','S',6),(1014,'Kendra','Bonnicksen','12330 Larchlemont Lane','Seattle','WA','98105','206','555-2716','1988-10-25','F','M',7),(1015,'Brannon','Jones','777 Fenexet Blvd','Long Beach','CA','90809','562','555-0399','1992-05-01','M','S',2),(1016,'Steve','Pundt','2500 Rosales Lane','Dallas','TX','79915','972','555-9938','1994-03-03','M','S',4),(1017,'George','Chavez','281 Old Navy Road','Bremerton','WA','98310','360','555-9930','1994-03-13','M','S',6),(1018,'Richard','Lum','754 Fourth Ave','Seattle','WA','98115','206','555-2296','1995-04-24','M','S',7);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `SubjectID` int NOT NULL DEFAULT '0',
  `CategoryID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SubjectCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SubjectName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SubjectPreReq` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SubjectDescription` text,
  `SubjectEstClassSize` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`SubjectID`),
  UNIQUE KEY `SubjectCode` (`SubjectCode`),
  KEY `CategoryID` (`CategoryID`),
  KEY `SubjectPreReq` (`SubjectPreReq`),
  CONSTRAINT `Subjects_FK00` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
  CONSTRAINT `Subjects_FK01` FOREIGN KEY (`SubjectPreReq`) REFERENCES `subjects` (`SubjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'ACC','ACC 210','Financial Accounting Fundamentals I',NULL,'Introduces basic accounting concepts, principles and prodcedures for recording business transactions and developing financial accounting reports. Excel spreadsheet component.',100),(2,'ACC','ACC 220','Financial Accounting Fundamentals II','ACC 210','Applications of basic accounting concepts, principles and procedures to more complex business situations and to different forms of enterprise ownership. Includes computerized element. Prereq: ACC 210 or instructor permission.',60),(3,'ACC','ACC 230','Fundamentals of Managerial Accounting','ACC 220','Analysis of accounting data as part of the managerial process of planning, decision making and control. Concentrates on economic decision making in enterprises. Includes computerized element. Prereq: ACC 220 or instructor permission.',20),(4,'ACC','ACC 251','Intermediate Accounting','ACC 220','In-depth review of financial accounting principles. Emphasizes the conceptual framework of accounting, revenue and expense recognition. Accounts Receivable, Depreciation, and Amortization, etc. Prereq: ACC 220 or instructor permission.',30),(5,'ACC','ACC 257','Business Tax Accounting','ACC 220','Basic principles, practices and governmental regulations (Federal, Washington, State, and local) involved in business tax accounting including filing returns, record keeping, tax planning, and registrations and business licenses. Prereq: ACC 220 or instructors permissions.',15),(6,'BUS','BUS 101','Introduction to Business',NULL,'Survey of businss practices. Covers business terminology, forms of business ownership, franchising, small and international businesses, leadership and management, marketing principles, financing and investment methods, and business environment.',80),(7,'BUS','BUS 155','Developing A Feasibility Plan',NULL,'With the aid of a counselor, a feasibility plan will be developed which will be the basis or start of your business plan. Must be concurrently enrolled in BUS 151.',15),(8,'BUS','BUS 151','Introduction to Entrepreneurship',NULL,'Overview of the entrepreneurial process, examination of the marketplace, and discussion of successful business strategies. Product selection, selling and marketing strategies. Sources of information and assistance. Must be concurrently enrolled in BUS 155.',15),(9,'BUS','BUS 170','Information Technology I',NULL,'Uses Word for Windows word processing skills, document formatting, keyboarding, and 10-key keypad skills. Emphasis on preparing letters, memos, reports, and tables. Introduces Excel spreadsheet basics.',50),(10,'BUS','BUS 171','Information Technology II','BUS 170','Uses intermediate Word features including formatting and production, mail merge, macros, text columns, graphics, and fonts; Excel spreadsheet; and introduction to PowerPoint presentation software, Internet and email. Prereq: BUS 170 or permission from instructor.',35),(11,'ART','ART 100','Introduction to Art',NULL,'Historical backgrounds and design fundamentals which have affected art. Includes slide lectures, reading and practical studio applications.',40),(12,'ART','ART 101','Design',NULL,'Studio sudies in the fundamentals of two-dimensional art with problems based on line, space, texture, shape and color theories. Includes practical applications of these theories to design.',12),(13,'ART','ART 111','Drawing',NULL,'Study of line, value, space, perspective, and compostion through the use o charcoal, pencil, pen, and brush.',12),(14,'ART','ART 201','Painting',NULL,'Beginning painting in oil or synthetic media using still life. Emphasis on basics such as composition, value studies, color mixing, canvas preparation, and various styles and techniques. No prerequisite; some drawing background important.',15),(15,'ART','ART 210','Computer Art',NULL,'Explore the elements of art such as line, value, space, composition, and color through the use of the computer. Sudents will create works of art using the computer.',18),(16,'ART','ART 251','Art History',NULL,'Surveys major forms of visual expression from the Paleolithic, Egyptian, Mesopotamian, Greek, Roman, and Early Christian periods. Includes painting, sculpture, architecture, lectures, slides, and readings.',75),(17,'BIO','BIO 100','Biological Principles',NULL,'An introductory biology course with lab for the non-science major. May include maintenance of the balance between man and his environment, nutrition, genetics and inheritence, ecological principles, plant and animal diversity, and evolution.',60),(18,'BIO','BIO 101','General Biology',NULL,'Basic bilogical concepts with emphasis on general cell processes, plant and animal diversity, morphyology, limited reproduction, phylogeny of the living organisms, exploration of molecular genetics.',50),(19,'BIO','BIO 280','Microbiology',NULL,'Introduction to micro-organisms including microbial cell structure and function; metabolism; microbial genetics; and the role of micro-organisms in disease, immunity, and other selected applied areas.',25),(20,'CHE','CHE 101','Chemistry',NULL,'General chemistry for non-science majors. Completion of CHE 101 fulfills chemistry requirements for many health science majors.',30),(21,'CHE','CHE 139','Fundamentals of Chemistry',NULL,'Prepatory for the science major chemistry courses for students without prior chemistry experience. This lecture format will include chemical mathematics, basic atomic structure, chemical bonding, chemical equation balancing and mole concept, and chemical stoichiometry.',100),(22,'CHE','CHE 231','Organic Chemistry',NULL,'Structure, nomenclature, reactions, and synthesis of the main types of organic compounds.',40),(23,'CIS','CIS 101','Microcomputer Applications',NULL,'This is a \"hands-on\" course. Students will learn how to use word processing, spreadsheet, and database applications. General operation systems activities such as deleting files, renaming files, and creating and navigating directory structures will also be covered.',20),(24,'CIS','CIS 102','Information Systems Concepts',NULL,'Provides a broad introduction to computers and information systems. Includes coverage of hardware, software, data organization, data communications, and systems development. Also covers the evolving role of computers in society.',80),(25,'CIS','CIS 114','Problem Solving and Structured Programming',NULL,'Covers design, documentation, and coding of programs using top-down design and structured programming principles. Includes introduction to multi-user systems, text editors, data access and storage techniques.',25),(26,'CIS','CIS 236','Database Management',NULL,'Includes database concepts, data management techniques, database environment, record relationships, and advantages and limitations of the database approach. Includes data modeling and database design.',20),(27,'CSC','CSC 110','Programming in BASIC',NULL,'Computer programming and program design using the Visual Basic programming language. Emphasis is on Program Design and Algorithm Development while writing programs primarily about mathematical and scientific applications.',20),(28,'CSC','CIS 142','Computer Programming',NULL,'Introduction to computer science using the C programming language. Emphasizes design, algorithmics, abstraction, and analysis.',25),(29,'JRN','JRN 104','College Publications',NULL,'Hands-on course in college publishing. Covers basics of reporting and writing through work on college newspaper and other assignments.',20),(30,'ECO','ECO 100','Survey of Economics',NULL,'Economics applied to various comtemporary social problems and issues. Provides an introduction to economic principles concerning national prosperity, market behavior, income inequality, the role of government, and economic fluctuations.',70),(31,'ECO','ECO 200','Principles of Economics: Microeconomics','MAT 098','Covers resource allocation and income distribution with emphasis on price determination, production costs, and market structures. Intermediate algebra or equivalent required.',35),(32,'ECO','ECO 201','Principles of Economics: Macroeconomics',NULL,'Analysis of the aggregate economy: GDP, inflation, business cycles, trade and finance. Intermediate algebra or equivalent required.',35),(33,'MUS','MUS 100','Music in the Western World',NULL,'An introduction to music. Features music from a global perspective with a focus on Western Music. Many musical examples, listening, videos on great musicians of the past.',40),(34,'MUS','MUS 101','First Year Theory and Ear Training',NULL,'Rudiments of music - notation, scales, intervals, and triads, rhythmic and melodic sight-reading and dictation. Studies of historical periods.',15),(35,'MUS','MUS 201','Second Year Music Theory','MUS 101','Continuation of MUS 101. Chromatic harmony, modulations and related modern concepts. Prereq: MUS 101 or instructor permission.',15),(36,'MUS','MUS 204','History of Jazz',NULL,'Traces the roots of jazz in America from New Orleans, New York, Chicago, Kansas City, the Big Band Era, Be-Bop to modern jazz through films, lectures, recordings and live performances.',30),(37,'ENG','ENG 101','Composition - Fundamentals',NULL,'Introduces the nature of the writing process in its various stages: gathering, shaping, establishing audience, editing, revising, polishing, and proffreading. Writing assignments concentrate on the major strategies of nonfiction prose - narration, description, and exposition.',60),(38,'ENG','ENG 102','Composition - Intermediate','ENG 101','Continues instruction on the writing process, extending it to include source-based writing of the kind typically done in academic settings. Topics for reading and writing will vary instructor to instructor. Prereq: ENG 101 or instructor permission.',35),(39,'ENG','ENG 104','Advanced English Grammar',NULL,'Study of the grammar and rhetoric of the English sentence. Not a remedial course.',20),(40,'GEG','GEG 100','Introduction to Geography',NULL,'An introduction to the major cultures of the world (Hebrew, Christian, Islamic, Hindu, Buddhist), their origins, values, heroes, rituals, scriptures and cross-cultural influences.',70),(41,'GEG','GEG 205','Physical Geography',NULL,'Study of the Earth, the materials that make it up, and plate tectonics. Special attention to the Pacific Northwest. Includes laboratory and field trip work.',20),(42,'HIS','HIS 101','World History to 1500',NULL,'Historic foundations and development of the great civilizations from prehistoric days to the Renaissance with emphasis on social, political, economic and geographic aspects. Attention to the nature of history as an intellectual and academic discipline.',60),(43,'HIS','HIS 111','U.S. History to 1877',NULL,'American history from the colonial period through Reconstruction. Emphasis on the American Revolution, the National Period, slavery, territorial expansion, the Civil War and Reconstruction.',60),(44,'HIS','HIS 112','U.S. History Since 1865',NULL,'Includes Reconstruction, industrialization, urbanization, westward movement, political reform movements, agrarian protest, progressive period, 1920\'s Great Depressioin and the New Deal, WWII, the conservative 50\'s, liberalism of the 60\'s and 70\'s, and into the next century.',60),(45,'MAT','MAT 080','Preparatory Mathematics',NULL,'Individualized instruction in Arithmetic, Algebra I and II, Geometry, nad Intermediate Algebra.',80),(46,'MAT','MAT 097','Elementary Algebra',NULL,'First course in Algebra includes signed numbers, linear equations, linear inequalities, products and factorization of polynomials, and operations with quotients of polynomials.',25),(47,'MAT','MAT 098','Intermediate Algebra',NULL,'Sets and the real number system, polynomial and rational expressions, exponents and radicals, first and second degree equations, linear systems of equations, and graphs.',20),(48,'MAT','MAT 103','Geometry and Visualization',NULL,'Basic plane geometry concepts, emphasizing problem-solving. Right triangle trigonometry. Introduction to 3-D geometry/spatial thinking. Directed towards students with no high school geometry but who plan a career in science/engineering.',25),(49,'MAT','MAT 104','Trigonometry',NULL,'Elementary plane goemetry, right triangle tirgonometry, general angels, identities, equations, word problems, and selected topics.',20),(50,'PHY','PHY 100','Survey Of Physics',NULL,'Basic laws of phyics from the laws of motion through nuclear physics. Also examines the origins and impact on society of the basic physics concepts.',80),(51,'PHY','PHY 101','General Physics',NULL,'Classical mechanics; kinematics and dynamics. Includes development of concepts of force, work/energy, impulse/momentum, and the conservation laws.',40),(52,'PHY','PHY 201','Engineering Physics I',NULL,'Development of the basic principles of classical mechanics. A calculus approach is used to introduce kinematics, Newton\'s laws, the work-energy theorem, and conservation laws.',20),(53,'PHY','PHY 203','Engineering Physics II','PHY 201','Waves and oscillations. Mechanical waves and sound are studied as well as geometric and physical optics. The wave aspect of an electron is introduced as it applies to the stationary states of the hydrogen atom. Prereq: PHY 201.',15),(54,'POL','POL 101','Introduction to Political Science',NULL,'Introduction to theory, organization, politics and administration of government. Includes political theory, comparative systems, political socialization, public administration, political parties and elections, and international relations.',90),(55,'POL','POL 102','American Government',NULL,'Origin and development of the U.S. government. Covers the stucture and function of Congress, the Presidency and courts as well as civil liberties, political behavior and political parties.',50),(56,'POL','POL 213','Women and Politics',NULL,'Introduction to concepts of power and policy issues as they relate to women. Theoretical, historical and empirical studies of women\'s participation in social and political movements nationally and internationally. Study of women\'s diverse roles in relations to family, economics, labor, government, and law.',30);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblgendermatrix`
--

DROP TABLE IF EXISTS `ztblgendermatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblgendermatrix` (
  `Gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Male` smallint DEFAULT NULL,
  `Female` smallint DEFAULT NULL,
  PRIMARY KEY (`Gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblgendermatrix`
--

LOCK TABLES `ztblgendermatrix` WRITE;
/*!40000 ALTER TABLE `ztblgendermatrix` DISABLE KEYS */;
INSERT INTO `ztblgendermatrix` VALUES ('F',0,1),('M',1,0);
/*!40000 ALTER TABLE `ztblgendermatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztbllettergrades`
--

DROP TABLE IF EXISTS `ztbllettergrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztbllettergrades` (
  `LetterGrade` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LowGradePoint` double DEFAULT NULL,
  `HighGradePoint` double DEFAULT NULL,
  PRIMARY KEY (`LetterGrade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztbllettergrades`
--

LOCK TABLES `ztbllettergrades` WRITE;
/*!40000 ALTER TABLE `ztbllettergrades` DISABLE KEYS */;
INSERT INTO `ztbllettergrades` VALUES ('A',93,96.99),('A+',97,120),('A-',90,92.99),('B',83,86.99),('B+',87,89.99),('B-',80,82.99),('C',73,76.99),('C+',77,79.99),('C-',70,72.99),('D',63,66.99),('D+',67,69.99),('D-',60,62.99),('F',0,59.99);
/*!40000 ALTER TABLE `ztbllettergrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblmaritalstatusmatrix`
--

DROP TABLE IF EXISTS `ztblmaritalstatusmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblmaritalstatusmatrix` (
  `MaritalStatus` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Married` smallint DEFAULT NULL,
  `Single` smallint DEFAULT NULL,
  `Widowed` smallint DEFAULT NULL,
  `Divorced` smallint DEFAULT NULL,
  PRIMARY KEY (`MaritalStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblmaritalstatusmatrix`
--

LOCK TABLES `ztblmaritalstatusmatrix` WRITE;
/*!40000 ALTER TABLE `ztblmaritalstatusmatrix` DISABLE KEYS */;
INSERT INTO `ztblmaritalstatusmatrix` VALUES ('D',0,0,0,1),('M',1,0,0,0),('S',0,1,0,0),('W',0,0,1,0);
/*!40000 ALTER TABLE `ztblmaritalstatusmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblprofratings`
--

DROP TABLE IF EXISTS `ztblprofratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblprofratings` (
  `ProfRatingDesc` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ProfRatingLow` double NOT NULL,
  `ProfRatingHigh` double DEFAULT NULL,
  PRIMARY KEY (`ProfRatingLow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblprofratings`
--

LOCK TABLES `ztblprofratings` WRITE;
/*!40000 ALTER TABLE `ztblprofratings` DISABLE KEYS */;
INSERT INTO `ztblprofratings` VALUES ('Poor',0,7),('Average',7.0001,8.5),('Good',8.5001,8.9),('Excellent',8.9001,10);
/*!40000 ALTER TABLE `ztblprofratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblsemesterdays`
--

DROP TABLE IF EXISTS `ztblsemesterdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblsemesterdays` (
  `SemesterNo` smallint NOT NULL,
  `SemDate` date NOT NULL,
  `SemDayName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SemesterNo`,`SemDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblsemesterdays`
--

LOCK TABLES `ztblsemesterdays` WRITE;
/*!40000 ALTER TABLE `ztblsemesterdays` DISABLE KEYS */;
INSERT INTO `ztblsemesterdays` VALUES (1,'2013-09-09','Monday'),(1,'2013-09-10','Tuesday'),(1,'2013-09-11','Wednesday'),(1,'2013-09-12','Thursday'),(1,'2013-09-13','Friday'),(1,'2013-09-14','Saturday'),(1,'2013-09-16','Monday'),(1,'2013-09-17','Tuesday'),(1,'2013-09-18','Wednesday'),(1,'2013-09-19','Thursday'),(1,'2013-09-20','Friday'),(1,'2013-09-21','Saturday'),(1,'2013-09-23','Monday'),(1,'2013-09-24','Tuesday'),(1,'2013-09-25','Wednesday'),(1,'2013-09-26','Thursday'),(1,'2013-09-27','Friday'),(1,'2013-09-28','Saturday'),(1,'2013-09-30','Monday'),(1,'2013-10-01','Tuesday'),(1,'2013-10-02','Wednesday'),(1,'2013-10-03','Thursday'),(1,'2013-10-04','Friday'),(1,'2013-10-05','Saturday'),(1,'2013-10-07','Monday'),(1,'2013-10-08','Tuesday'),(1,'2013-10-09','Wednesday'),(1,'2013-10-10','Thursday'),(1,'2013-10-11','Friday'),(1,'2013-10-12','Saturday'),(1,'2013-10-14','Monday'),(1,'2013-10-15','Tuesday'),(1,'2013-10-16','Wednesday'),(1,'2013-10-17','Thursday'),(1,'2013-10-18','Friday'),(1,'2013-10-19','Saturday'),(1,'2013-10-21','Monday'),(1,'2013-10-22','Tuesday'),(1,'2013-10-23','Wednesday'),(1,'2013-10-24','Thursday'),(1,'2013-10-25','Friday'),(1,'2013-10-26','Saturday'),(1,'2013-10-28','Monday'),(1,'2013-10-29','Tuesday'),(1,'2013-10-30','Wednesday'),(1,'2013-10-31','Thursday'),(1,'2013-11-01','Friday'),(1,'2013-11-02','Saturday'),(1,'2013-11-04','Monday'),(1,'2013-11-05','Tuesday'),(1,'2013-11-06','Wednesday'),(1,'2013-11-07','Thursday'),(1,'2013-11-08','Friday'),(1,'2013-11-09','Saturday'),(1,'2013-11-11','Monday'),(1,'2013-11-12','Tuesday'),(1,'2013-11-13','Wednesday'),(1,'2013-11-14','Thursday'),(1,'2013-11-15','Friday'),(1,'2013-11-16','Saturday'),(1,'2013-11-18','Monday'),(1,'2013-11-19','Tuesday'),(1,'2013-11-20','Wednesday'),(1,'2013-11-21','Thursday'),(1,'2013-11-22','Friday'),(1,'2013-11-23','Saturday'),(1,'2013-11-25','Monday'),(1,'2013-11-26','Tuesday'),(1,'2013-11-27','Wednesday'),(1,'2013-11-29','Friday'),(1,'2013-11-30','Saturday'),(1,'2013-12-02','Monday'),(1,'2013-12-03','Tuesday'),(1,'2013-12-04','Wednesday'),(1,'2013-12-05','Thursday'),(1,'2013-12-06','Friday'),(1,'2013-12-07','Saturday'),(1,'2013-12-09','Monday'),(1,'2013-12-10','Tuesday'),(1,'2013-12-11','Wednesday'),(1,'2013-12-12','Thursday'),(1,'2013-12-13','Friday'),(1,'2013-12-14','Saturday'),(1,'2013-12-16','Monday'),(1,'2013-12-17','Tuesday'),(1,'2013-12-18','Wednesday'),(1,'2013-12-19','Thursday'),(1,'2013-12-20','Friday'),(1,'2013-12-21','Saturday'),(2,'2014-01-13','Monday'),(2,'2014-01-14','Tuesday'),(2,'2014-01-15','Wednesday'),(2,'2014-01-16','Thursday'),(2,'2014-01-17','Friday'),(2,'2014-01-18','Saturday'),(2,'2014-01-21','Tuesday'),(2,'2014-01-22','Wednesday'),(2,'2014-01-23','Thursday'),(2,'2014-01-24','Friday'),(2,'2014-01-25','Saturday'),(2,'2014-01-27','Monday'),(2,'2014-01-28','Tuesday'),(2,'2014-01-29','Wednesday'),(2,'2014-01-30','Thursday'),(2,'2014-01-31','Friday'),(2,'2014-02-01','Saturday'),(2,'2014-02-03','Monday'),(2,'2014-02-04','Tuesday'),(2,'2014-02-05','Wednesday'),(2,'2014-02-06','Thursday'),(2,'2014-02-07','Friday'),(2,'2014-02-08','Saturday'),(2,'2014-02-10','Monday'),(2,'2014-02-11','Tuesday'),(2,'2014-02-12','Wednesday'),(2,'2014-02-13','Thursday'),(2,'2014-02-14','Friday'),(2,'2014-02-15','Saturday'),(2,'2014-02-17','Monday'),(2,'2014-02-18','Tuesday'),(2,'2014-02-19','Wednesday'),(2,'2014-02-21','Friday'),(2,'2014-02-22','Saturday'),(2,'2014-02-24','Monday'),(2,'2014-02-25','Tuesday'),(2,'2014-02-26','Wednesday'),(2,'2014-02-27','Thursday'),(2,'2014-02-28','Friday'),(2,'2014-03-01','Saturday'),(2,'2014-03-03','Monday'),(2,'2014-03-04','Tuesday'),(2,'2014-03-05','Wednesday'),(2,'2014-03-06','Thursday'),(2,'2014-03-07','Friday'),(2,'2014-03-08','Saturday'),(2,'2014-03-17','Monday'),(2,'2014-03-18','Tuesday'),(2,'2014-03-19','Wednesday'),(2,'2014-03-20','Thursday'),(2,'2014-03-21','Friday'),(2,'2014-03-22','Saturday'),(2,'2014-03-24','Monday'),(2,'2014-03-25','Tuesday'),(2,'2014-03-26','Wednesday'),(2,'2014-03-27','Thursday'),(2,'2014-03-28','Friday'),(2,'2014-03-29','Saturday'),(2,'2014-03-31','Monday'),(2,'2014-04-01','Tuesday'),(2,'2014-04-02','Wednesday'),(2,'2014-04-03','Thursday'),(2,'2014-04-04','Friday'),(2,'2014-04-05','Saturday'),(2,'2014-04-07','Monday'),(2,'2014-04-08','Tuesday'),(2,'2014-04-09','Wednesday'),(2,'2014-04-10','Thursday'),(2,'2014-04-11','Friday'),(2,'2014-04-12','Saturday'),(2,'2014-04-14','Monday'),(2,'2014-04-15','Tuesday'),(2,'2014-04-16','Wednesday'),(2,'2014-04-17','Thursday'),(2,'2014-04-19','Saturday'),(2,'2014-04-21','Monday'),(2,'2014-04-22','Tuesday'),(2,'2014-04-23','Wednesday'),(2,'2014-04-24','Thursday'),(2,'2014-04-25','Friday'),(2,'2014-04-26','Saturday'),(2,'2014-04-28','Monday'),(2,'2014-04-29','Tuesday'),(2,'2014-04-30','Wednesday'),(2,'2014-05-01','Thursday'),(2,'2014-05-02','Friday'),(2,'2014-05-03','Saturday');
/*!40000 ALTER TABLE `ztblsemesterdays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblsequencenos`
--

DROP TABLE IF EXISTS `ztblsequencenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblsequencenos` (
  `SequenceNo` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SequenceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblsequencenos`
--

LOCK TABLES `ztblsequencenos` WRITE;
/*!40000 ALTER TABLE `ztblsequencenos` DISABLE KEYS */;
INSERT INTO `ztblsequencenos` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60);
/*!40000 ALTER TABLE `ztblsequencenos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 19:06:27
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: recipes
-- ------------------------------------------------------
-- Server version	8.0.20
CREATE DATABASE RecipeDB;
use RecipeDB;
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
-- Table structure for table `ingredient_classes`
--

DROP TABLE IF EXISTS `ingredient_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_classes` (
  `IngredientClassID` smallint NOT NULL DEFAULT '0',
  `IngredientClassDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`IngredientClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_classes`
--

LOCK TABLES `ingredient_classes` WRITE;
/*!40000 ALTER TABLE `ingredient_classes` DISABLE KEYS */;
INSERT INTO `ingredient_classes` VALUES (1,'Spice'),(2,'Meat'),(3,'Vegetable'),(4,'Oil'),(5,'Pasta'),(6,'Grain'),(7,'Flour'),(8,'Dairy'),(9,'Liquid'),(10,'Seafood'),(11,'Butter'),(12,'Cheese'),(13,'Sauce'),(14,'Dressing'),(15,'Gravy'),(16,'Topping'),(17,'Fruit'),(18,'Chips'),(19,'Condiment'),(20,'Bottle'),(21,'Packaged food'),(22,'Herb'),(23,'Sorbet'),(24,'Liquor');
/*!40000 ALTER TABLE `ingredient_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `IngredientID` int NOT NULL DEFAULT '0',
  `IngredientName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IngredientClassID` smallint DEFAULT '0',
  `MeasureAmountID` smallint DEFAULT '0',
  PRIMARY KEY (`IngredientID`),
  KEY `Ingredient_ClassesIngredients` (`IngredientClassID`),
  KEY `MeasurementsIngredients` (`MeasureAmountID`),
  CONSTRAINT `Ingredients_FK00` FOREIGN KEY (`IngredientClassID`) REFERENCES `ingredient_classes` (`IngredientClassID`),
  CONSTRAINT `Ingredients_FK01` FOREIGN KEY (`MeasureAmountID`) REFERENCES `measurements` (`MeasureAmountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Beef',2,1),(2,'Onion',3,17),(3,'Water',9,1),(4,'Guinness Beer',9,1),(5,'Potato',3,2),(6,'Carrot',3,2),(7,'Tomato',3,8),(8,'Jalapeno',3,2),(9,'Garlic',1,16),(10,'Black Pepper (ground)',1,3),(11,'Salt',1,3),(12,'Halibut',10,5),(13,'Chicken, Fryer',2,5),(14,'Bacon',2,8),(15,'Romaine Lettuce',3,13),(16,'Iceberg Lettuce',3,13),(17,'Butterhead Lettuce',3,13),(18,'Scallop',10,5),(19,'Salmon',10,5),(20,'Vinegar',9,1),(21,'Olive Oil',4,1),(22,'Cucumber',3,17),(23,'Mushrooms',3,2),(24,'Red Wine',9,2),(25,'White Wine',9,2),(26,'Milk',8,2),(27,'Cheddar Cheese',12,2),(28,'Tortilla Chips',18,11),(29,'Black Olives',19,2),(30,'Green Beans',3,14),(31,'Fettuccini Pasta',5,1),(32,'Heavy Cream',8,1),(33,'Chicken, Pre-cut',2,17),(34,'T-bone Steak',2,17),(35,'Chicken Breast',2,7),(36,'Chicken Leg',2,17),(37,'Chicken Wing',2,7),(38,'Chicken Thigh',2,7),(39,'New York Steak',2,17),(40,'Spaghetti',5,1),(41,'Mustard, Regular',19,1),(42,'Mustard, Dijon',19,1),(43,'Ketchup',19,1),(44,'Salsa',13,1),(45,'Parmesan Cheese',12,1),(46,'Blue Cheese',12,1),(47,'Butter',11,4),(48,'Green Onion',3,14),(49,'Green Olives',19,2),(50,'Vegetable Oil',4,4),(51,'White Pepper (ground)',1,1),(52,'Cayenne Pepper, Ground',1,1),(53,'Radishes',3,14),(54,'Balsamic Vinaigrette Dressing',20,1),(55,'Sponge Cake',21,20),(56,'Raspberry Jello',21,20),(57,'Bird\'s Custard Powder',21,20),(58,'Colored sugar sprinkles',1,3),(59,'Raspberry Jam',21,21),(61,'Flour',6,2),(62,'Eggs',8,7),(63,'Beef drippings',4,3),(64,'Red Snapper',10,1),(65,'Canned tomatoes',3,10),(66,'Nutmeg',1,3),(67,'Cinnamon',1,3),(68,'Lime Juice',9,3),(69,'Asparagus',3,5),(70,'Parsley',22,22),(71,'Pie dough for 2-crust pie',21,24),(72,'Ground Pork',2,5),(73,'Ground Clove',1,3),(74,'Bread Crumbs',21,2),(75,'Leek',3,7),(76,'Red Bell Pepper',3,7),(77,'Lemon Juice',9,4),(78,'Lemon ',17,7),(79,'Lemon Sorbet',23,26),(80,'Vodka',24,4);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurements`
--

DROP TABLE IF EXISTS `measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measurements` (
  `MeasureAmountID` smallint NOT NULL DEFAULT '0',
  `MeasurementDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MeasureAmountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurements`
--

LOCK TABLES `measurements` WRITE;
/*!40000 ALTER TABLE `measurements` DISABLE KEYS */;
INSERT INTO `measurements` VALUES (1,'Ounce'),(2,'Cup'),(3,'Teaspoon'),(4,'Tablespoon'),(5,'Pound'),(6,'Pinch'),(7,'Piece'),(8,'Slice'),(9,'Dash'),(10,'Can'),(11,'Bag'),(12,'Bottle'),(13,'Head'),(14,'Bunch'),(15,'Ear'),(16,'Clove'),(17,'Whole'),(18,'Pint'),(19,'To Taste'),(20,'Package'),(21,'Jar'),(22,'Sprig'),(23,'Quarts'),(24,'sticks'),(25,'filets'),(26,'Scoop');
/*!40000 ALTER TABLE `measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_classes`
--

DROP TABLE IF EXISTS `recipe_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_classes` (
  `RecipeClassID` smallint NOT NULL DEFAULT '0',
  `RecipeClassDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`RecipeClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_classes`
--

LOCK TABLES `recipe_classes` WRITE;
/*!40000 ALTER TABLE `recipe_classes` DISABLE KEYS */;
INSERT INTO `recipe_classes` VALUES (1,'Main course'),(2,'Vegetable'),(3,'Starch'),(4,'Salad'),(5,'Hors d\'oeuvres'),(6,'Dessert'),(7,'Soup');
/*!40000 ALTER TABLE `recipe_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `RecipeID` int NOT NULL DEFAULT '0',
  `RecipeSeqNo` smallint NOT NULL DEFAULT '0',
  `IngredientID` int DEFAULT '0',
  `MeasureAmountID` smallint DEFAULT '0',
  `Amount` double DEFAULT '0',
  PRIMARY KEY (`RecipeID`,`RecipeSeqNo`),
  KEY `IngredientID` (`IngredientID`),
  KEY `MeasureAmountID` (`MeasureAmountID`),
  KEY `RecipeID` (`RecipeID`),
  CONSTRAINT `Recipe_Ingredients_FK00` FOREIGN KEY (`RecipeID`) REFERENCES `recipes` (`RecipeID`),
  CONSTRAINT `Recipe_Ingredients_FK01` FOREIGN KEY (`IngredientID`) REFERENCES `ingredients` (`IngredientID`),
  CONSTRAINT `Recipe_Ingredients_FK02` FOREIGN KEY (`MeasureAmountID`) REFERENCES `measurements` (`MeasureAmountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,1,5,1),(1,2,2,17,2),(1,3,5,17,4),(1,4,6,17,6),(1,5,3,23,4),(1,6,4,1,12),(2,1,8,17,6),(2,2,7,17,2),(2,3,2,17,0.5),(2,4,10,4,1),(2,5,11,3,1),(3,1,8,17,4),(3,2,27,2,1),(3,3,2,17,0.5),(3,4,28,11,0.5),(3,5,29,2,0.25),(4,1,30,5,0.5),(4,2,9,16,2),(4,3,21,4,1),(5,1,31,1,16),(5,2,50,4,1),(5,3,11,3,3),(5,4,47,4,6),(5,5,32,2,0.25),(5,12,45,1,6),(5,16,51,19,0),(6,1,36,7,2),(6,2,38,7,2),(6,3,11,3,1.5),(6,4,10,3,1.5),(6,5,9,16,3),(6,6,52,19,0),(7,1,15,13,1),(7,2,23,7,12),(7,3,22,17,1),(7,4,7,17,1),(7,5,53,14,1),(7,6,54,4,3),(8,1,55,20,1),(8,2,56,20,1),(8,3,57,20,1),(8,4,59,21,1),(8,5,58,3,1),(9,1,1,5,4),(9,2,9,16,6),(9,3,11,3,1),(9,4,10,3,1),(10,1,61,2,1.5),(10,2,3,2,1),(10,3,62,7,2),(10,4,11,3,0.5),(10,5,26,2,0.5),(10,6,63,3,4),(11,1,64,5,2),(11,2,21,1,4),(11,3,2,17,1),(11,4,65,10,2),(11,5,11,3,1),(11,6,10,3,0.5),(11,7,66,3,0.25),(11,8,67,3,0.5),(11,9,68,3,2),(11,10,49,7,8),(11,11,61,2,0.5),(11,12,70,22,2),(12,1,69,5,1),(12,2,47,4,4),(12,3,9,16,4),(13,1,71,24,2),(13,2,72,5,2),(13,3,2,2,0.333),(13,4,67,4,1),(13,5,73,3,0.5),(13,6,11,3,0.25),(13,7,10,3,0.5),(13,8,74,2,0.5),(14,1,19,25,4),(14,2,6,7,2),(14,3,75,7,1),(14,4,76,7,1),(14,5,47,4,4),(14,6,25,4,2),(14,7,77,4,2),(14,8,78,7,1),(14,9,11,3,0.5),(14,10,10,3,0.5),(15,1,79,26,2),(15,2,80,4,2);
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `RecipeID` int NOT NULL DEFAULT '0',
  `RecipeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RecipeClassID` smallint DEFAULT '0',
  `Preparation` text,
  `Notes` text,
  PRIMARY KEY (`RecipeID`),
  KEY `Recipe_ClassesRecipes` (`RecipeClassID`),
  CONSTRAINT `Recipes_FK00` FOREIGN KEY (`RecipeClassID`) REFERENCES `recipe_classes` (`RecipeClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Irish Stew',1,'Cut the beef into 1\" chunks\nBraise the meat\nAdd water and Guinness\nChop onions, potatoes, and carrots into 1/2\" chunks.\nAdd to stew.\nSimmer until vegetables are done.',NULL),(2,'Salsa Buena',5,'Coarsely dice the jalapenos .\nMix all ingredients thoroughly in a bowl and let stand in the refrigerator for about an hour. \nServe with your favorite corn chips.',NULL),(3,'Machos Nachos',5,'Slice the jalapenos crosswise (in circles) and set aside.\nGrate the cheddar cheese and set aside.\nDice the onion and set aside.\nSpread the tortilla chips on a large microwavable dish.\nTop the chips with the grated cheese, diced onion, and jalapenos.\nPlace the dish in the micowave and cook until the cheese just melts, about 3-4 minutes on high.\nWhen the cheese has melted, remove the dish and top with the black olives.','You can add a half a cup of diced tomatoes to this dish if you like. You can either add them prior to cooking in the microwave or afterwards, just before you add the black olives.'),(4,'Garlic Green Beans',2,'Snap off and discard the ends of the beans, then rinse them in cold water.\nMince the two cloves of garlic.\nHeat the oil in a frying pan on medium high heat.\nWhen the oil is hot, add the green beans and garlic. \nStir contiuously for about four minutes. \nPlace the beans on a serving dish when they\'re done and sprinkle silvered almonds on the top.','Be sure not to burn the oil. Watch it carefully while it\'s heating.'),(5,'Fettuccini Alfredo',1,'Fill a large pot two thirds full with water. Add one tablespoon each of salt and vegetable oil. Bring to a rollling boil.\nReduce heat, add pasta, and stir briefly. Cook until pasta is al dente.\nJust before the pasta is ready (about five minutes), melt the butter in a frying pan on low heat.\nAfter the butter has melted, add the heavy cream to the pan. Increase the heat to medium and stir until the mixture is slightly thickened. Remove the pan from the heat once the mixture is ready.\nDrain the fettuccini when it\'s done and add it to the mixture in the frying pan.\nMix three ounces of the cheese the the fettuccini and toss the entire mixture.\nAdd another three ounces of cheese and the white pepper, and toss again lightly.',NULL),(6,'Pollo Picoso',1,'Wash chicken pieces thoroughly in cold water. Pat dry and set aside.\nMince garlic and then mix it with the salt, pepper, and cayenne. Make sure the mixture is combined as thoroughly as possible.\nCoat each chicken piece (to taste) with the mixture. \nPlace pieces in the broiler pan and cook for 15 minutes. Turn pieces and cook for another 15 minutes. Turn pieces once more and cook for 35 - 40 minutes.\nWhen the chicken is cooked, remove from stove and let it stand for 10 minutes.','Pre-heat the oven to 400 degrees.\nCover the bottom of a broiler pan with a sheet of aluminum foil and then pour in about 1/2 an inch of water. The water will keep the chicken grease drippings from splattering throughout the inside of the stove and causing smoke. The foil makes the pan easier to clean.'),(7,'Mike\'s Summer Salad',4,'Rinse lettuce and cut into bite size pieces. (You can tear them if you really want to.)\nDust off mushrooms, remove stems, and slice into thick pieces, about 1/4\".\nPeel the cucumber and slice it into 1/4\" thick circles.\nSlice the tomatoes into 1/2\" wedges.\nWash radishes, remove leafy head and root, and slice into 1/8\" circles.\nMix all ingredients together in a large salad bowl and add your favorite balsamic vinaigrette dressing.',NULL),(8,'Trifle',6,'Prepare the Jello and custard per package directions.\nIn tall dessert cups, place a 1/2\" layer of the sponge cake.  Soak the layer of cake in Jello.  Spoon on a thin layer of raspberry jam.  Add a layer of custard.\nContinue adding layers of sponge cake, jam, and custard until the cup is full (with a layer of custard on top) -- 2 to 3 layers.\nChill for 2 hours.  Sprinkle colored sugar on top and serve.','For a \"spicier\" dessert, replace half the liquid in the Jello with brandy or your favorite liqueur.'),(9,'Roast Beef',1,'Place the beef on a roasting rack in a roasting pan.\nMake a paste of ground garlic, salt, and pepper.  Smother the outside of the roast with the paste.\nRoast at 325 for about 20 minutes per pound or to an internal temperature of 160F for medium-rare.\nRemove from oven and let stand 15 minutes before carving.  Reserve the beef drippings for gravy or Yorkshire Pudding.',NULL),(10,'Yorkshire Pudding',3,'Place the eggs and water in a blender.  While running the blender, slowly add the flour.  Add the salt and milk and blend for 30 seconds more.\nLet stand in a refrigerator for 1 hour or more.\nHeat the roasting pan with beef drippings to 450F.  Pour in the pudding mixture.  Cook in a very hot oven for 20-25 minutes or until puffed up and golden brown.  Remove from the pan immediately and cut into slices.  Serve with brown gravy.',NULL),(11,'Huachinango Veracruzana (Red Snapper, Veracruz style)',1,'Heat one ounce of olive oil in a 1.5 quart saucepan.  Slice the onion and sautee lightly in the olive oil.\nDrain the canned tomatoes (you can use peeled fresh tomatoes if you like) and puree in a blender.\nTo the pureed tomatoes, add all the spices, thinly sliced Jalapenos, and green olives.  Pour the tomato and spice mixture into the saucepan with the onions and simmer on a very low heat covered for 30 minutes.\nWhile the sauce is cooking, peel and boil the potatoes.\nJust before the potatoes are done, heat the remaining olive oil in a large frypan.  Wash and lightly dust the fish pieces in a mixture of flour, salt, and pepper.  Fry the fish, turning once, until just done.\nPlace the cooked fish in a large platter.  Surround the fish with the boiled potatoes.  Pour the sauce over the fish, sprinkle with chopped parsley, and serve immediately.\nServes 6.','You can substitute any firm white fish filets for the Red Snapper.  If you use salted canned tomatoes, reduce the salt in the sauce by half.  Adjust the amount of the Jalapenos in the sauce to suit your taste for spicy food!'),(12,'Asparagus',2,'Wash the asparagus and break off the tough part (if any) at the bottom of the stalks.  Arrange on a steaming rack in a large saucepan.  Dab liberally with pats of butter and sprinkle on the chopped garlic.  Steam until just tender -- no more than 5 minutes for large stalks.  Serve immediately.','You can chill the cooked asparagus and serve with your favorite dip as an appetizer.'),(13,'Tourtière (French-Canadian Pork Pie)',1,'Brown ground pork and chopped onion, stirring and breaking up pork.  Add spices and salt and pepper.  Simmer, uncovered, for 45 minutes, stirring occasionally.  Preheat oven to 375 degrees.  Prepare pie dough for 2-crust pie.  Line 9\" pie plate with half of the rolled-out dough.  Drain pork and stir bread crumbs into pork.  Taste and add more salt and pepper if desired.  Fill pie with pork mixture and top with second half of the rolled-out dough.  Crimp edges of pie and slit the top in several places.  Bake in 375-degree oven for one hour, covering edges of pie crust with foil if necessary.  Serve hot or cold.','Be sure to use fresh ground pork, not sausage.  Can be made with half ground pork and half ground beef, if desired.'),(14,'Salmon Filets in Parchment Paper',1,'Julienne carrots, leeks, and bell peppers and steam for several minutes.  Drain and rinse vegetables in ice water and set aside.  Preheat oven to 400 degrees.  Butter 4 large rounds of parchment paper.  Distribute half of vegetables on one side of each round of parchment.  Place a salmon filet on the vegetables on each round.  Top the filets with the rest of the vegetables.  Combine white wine and lemon juice and spoon 1 tablespoon on each filet.  Pour melted butter on filets.  Place a thinly-sliced lemon round on each.  Salt and pepper very lightly.  Fold over parchment paper into half circles and roll and crimp edges tightly.  Bake packets at 400 degrees for 10-15 minutes, depending on thickness of the filets.','Serve the salmon in the parchment packets. A salad and boiled new potatoes, buttered and sprinkled with fresh parsley, are the perfect complements.'),(15,'Coupe Colonel',6,'For each person, place 2 scoops of lemon sorbet in a stemmed glass.  Top with vodka.','This is a lovely, light, and refreshing dessert.  Use the best sorbet and vodka you can find.  Serve with crisp cookies.');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 19:06:27
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: ap
-- ------------------------------------------------------
-- Server version	8.0.20
CREATE DATABASE AccountsPayableDB;
use AccountsPayableDB;
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
-- Table structure for table `general_ledger_accounts`
--

DROP TABLE IF EXISTS `general_ledger_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_ledger_accounts` (
  `account_number` int NOT NULL,
  `account_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `account_description` (`account_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_ledger_accounts`
--

LOCK TABLES `general_ledger_accounts` WRITE;
/*!40000 ALTER TABLE `general_ledger_accounts` DISABLE KEYS */;
INSERT INTO `general_ledger_accounts` VALUES (221,'401K Employee Contributions'),(591,'Accounting'),(200,'Accounts Payable'),(110,'Accounts Receivable'),(569,'Auto Expense'),(568,'Auto License Fee'),(565,'Bank Fees'),(394,'Book Club Royalties'),(181,'Book Development'),(120,'Book Inventory'),(400,'Book Printing Costs'),(403,'Book Production Costs'),(572,'Books, Dues, and Subscriptions'),(520,'Building Lease'),(523,'Building Maintenance'),(551,'Business Forms'),(590,'Business Insurance'),(574,'Business Licenses and Taxes'),(280,'Capital Stock'),(162,'Capitalized Lease'),(536,'Card Deck Advertising'),(100,'Cash'),(610,'Charitable Contributions'),(555,'Collection Agency Fees'),(301,'College Sales'),(310,'Compositing Revenue'),(160,'Computer Equipment'),(527,'Computer Equipment Maintenance'),(306,'Consignment Sales'),(556,'Credit Card Handling'),(540,'Direct Mail Advertising'),(238,'Employee FICA Taxes Payable'),(242,'Employee SDI Taxes Payable'),(239,'Employer FICA Taxes Payable'),(241,'Employer FUTA Taxes Payable'),(243,'Employer UCI Taxes Payable'),(532,'Equipment Rental'),(546,'Exhibits and Shows'),(630,'Federal Corporation Income Taxes'),(505,'FICA'),(553,'Freight'),(150,'Furniture'),(506,'FUTA'),(510,'Group Insurance'),(251,'IBM Credit Corporation Payable'),(528,'IBM Lease'),(235,'Income Taxes Payable'),(620,'Interest Paid to Banks'),(580,'Meals'),(508,'Medicare'),(234,'Medicare Taxes Payable'),(570,'Office Supplies'),(170,'Other Equipment'),(621,'Other Interest'),(589,'Outside Services'),(550,'Packaging Materials'),(576,'PC Software'),(552,'Postage'),(611,'Profit Sharing Contributions'),(300,'Retail Sales'),(290,'Retained Earnings'),(205,'Royalties Payable'),(500,'Salaries and Wages'),(632,'Sales Tax'),(230,'Sales Taxes Payable'),(167,'Software'),(541,'Space Advertising'),(631,'State Corporation Income Taxes'),(237,'State Payroll Taxes Payable'),(522,'Telephone'),(302,'Trade Sales'),(582,'Travel and Accomodations'),(507,'UCI'),(521,'Utilities'),(548,'Web Site Production and Fees');
/*!40000 ALTER TABLE `general_ledger_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_archive`
--

DROP TABLE IF EXISTS `invoice_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_archive` (
  `invoice_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_total` decimal(9,2) NOT NULL,
  `payment_total` decimal(9,2) NOT NULL,
  `credit_total` decimal(9,2) NOT NULL,
  `terms_id` int NOT NULL,
  `invoice_due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_archive`
--

LOCK TABLES `invoice_archive` WRITE;
/*!40000 ALTER TABLE `invoice_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_line_items`
--

DROP TABLE IF EXISTS `invoice_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_line_items` (
  `invoice_id` int NOT NULL,
  `invoice_sequence` int NOT NULL,
  `account_number` int NOT NULL,
  `line_item_amount` decimal(9,2) NOT NULL,
  `line_item_description` varchar(100) NOT NULL,
  PRIMARY KEY (`invoice_id`,`invoice_sequence`),
  KEY `line_items_fk_acounts` (`account_number`),
  CONSTRAINT `line_items_fk_acounts` FOREIGN KEY (`account_number`) REFERENCES `general_ledger_accounts` (`account_number`),
  CONSTRAINT `line_items_fk_invoices` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_line_items`
--

LOCK TABLES `invoice_line_items` WRITE;
/*!40000 ALTER TABLE `invoice_line_items` DISABLE KEYS */;
INSERT INTO `invoice_line_items` VALUES (1,1,553,3813.33,'Freight'),(2,1,553,40.20,'Freight'),(3,1,553,138.75,'Freight'),(4,1,553,144.70,'Int\'l shipment'),(5,1,553,15.50,'Freight'),(6,1,553,42.75,'Freight'),(7,1,553,172.50,'Freight'),(8,1,522,95.00,'Telephone service'),(9,1,403,601.95,'Cover design'),(10,1,553,42.67,'Freight'),(11,1,553,42.50,'Freight'),(12,1,580,50.00,'DiCicco\'s'),(12,2,570,75.60,'Kinko\'s'),(12,3,570,58.40,'Office Max'),(12,4,540,478.00,'Publishers Marketing'),(13,1,522,16.33,'Telephone (line 5)'),(14,1,553,6.00,'Freight out'),(15,1,574,856.92,'Property Taxes'),(16,1,572,9.95,'Monthly access fee'),(17,1,553,10.00,'Address correction'),(18,1,553,104.00,'Freight'),(19,1,160,116.54,'MVS Online Library'),(20,1,553,6.00,'Freight out'),(21,1,589,4901.26,'Office lease'),(22,1,553,108.25,'Freight'),(23,1,572,9.95,'Monthly access fee'),(24,1,520,1750.00,'Warehouse lease'),(25,1,553,129.00,'Freight'),(26,1,553,10.00,'Freight'),(27,1,540,207.78,'Prospect list'),(28,1,553,109.50,'Freight'),(29,1,523,450.00,'Back office additions'),(30,1,553,63.40,'Freight'),(31,1,589,7125.34,'Web site design'),(32,1,403,953.10,'Crash Course revision'),(33,1,591,220.00,'Form 571-L'),(34,1,553,127.75,'Freight'),(35,1,507,1600.00,'Income Tax'),(36,1,403,565.15,'Crash Course Ad'),(37,1,553,36.00,'Freight'),(38,1,553,61.50,'Freight'),(39,1,400,37966.19,'CICS Desk Reference'),(40,1,403,639.77,'Card deck'),(41,1,553,53.75,'Freight'),(42,1,553,400.00,'Freight'),(43,1,400,21842.00,'Book repro'),(44,1,522,19.67,'Telephone (Line 3)'),(45,1,553,2765.36,'Freight'),(46,1,510,224.00,'Health Insurance'),(47,1,572,1575.00,'Catalog ad'),(48,1,553,33.00,'Freight'),(49,1,522,16.33,'Telephone (line 6)'),(50,1,510,116.00,'Health Insurance'),(51,1,553,2184.11,'Freight'),(52,1,160,1083.58,'MSDN'),(53,1,522,46.21,'Telephone (Line 1)'),(54,1,403,313.55,'Card revision'),(55,1,553,40.75,'Freight'),(56,1,572,2433.00,'Card deck'),(57,1,589,1367.50,'401K Contributions'),(58,1,553,53.25,'Freight'),(59,1,553,13.75,'Freight'),(60,1,553,2312.20,'Freight'),(61,1,553,25.67,'Freight out'),(62,1,553,26.75,'Freight'),(63,1,553,2115.81,'Freight'),(64,1,553,23.50,'Freight'),(65,1,400,6940.25,'OS Utilities'),(66,1,553,31.95,'Freight'),(67,1,553,1927.54,'Freight'),(68,1,160,936.93,'Quarterly Maintenance'),(69,1,540,175.00,'Card deck advertising'),(70,1,553,6.00,'Freight'),(71,1,553,108.50,'Freight'),(72,1,553,10.00,'Address correction'),(73,1,552,290.00,'International pkg.'),(74,1,570,41.80,'Coffee'),(75,1,553,27.00,'Freight'),(76,1,553,241.00,'Int\'l shipment'),(77,1,403,904.14,'Cover design'),(78,1,403,1197.00,'Cover design'),(78,2,540,765.13,'Catalog design'),(79,1,540,2184.50,'PC card deck'),(80,1,553,2318.03,'Freight'),(81,1,553,26.25,'Freight'),(82,1,150,17.50,'Supplies'),(83,1,522,39.77,'Telephone (Line 2)'),(84,1,553,111.00,'Freight'),(85,1,553,158.00,'Int\'l shipment'),(86,1,553,739.20,'Freight'),(87,1,553,60.00,'Freight'),(88,1,553,147.25,'Freight'),(89,1,400,85.31,'Book copy'),(90,1,553,38.75,'Freight'),(91,1,522,32.70,'Telephone (line 4)'),(92,1,521,16.62,'Propane-forklift'),(93,1,553,162.75,'International shipment'),(94,1,553,52.25,'Freight'),(95,1,572,600.00,'Books for research'),(96,1,400,26881.40,'MVS JCL'),(97,1,170,356.48,'Network wiring'),(98,1,572,579.42,'Catalog ad'),(99,1,553,59.97,'Freight'),(100,1,553,67.92,'Freight'),(101,1,553,30.75,'Freight'),(102,1,400,20551.18,'CICS book printing'),(103,1,553,2051.59,'Freight'),(104,1,553,44.44,'Freight'),(105,1,582,503.20,'Bronco lease'),(106,1,400,23517.58,'DB2 book printing'),(107,1,553,3689.99,'Freight'),(108,1,553,67.00,'Freight'),(109,1,403,1000.46,'Crash Course covers'),(110,1,540,90.36,'Card deck advertising'),(111,1,553,22.57,'Freight'),(112,1,400,10976.06,'VSAM book printing'),(113,1,510,224.00,'Health Insurance'),(114,1,553,127.75,'Freight');
/*!40000 ALTER TABLE `invoice_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_total` decimal(9,2) NOT NULL,
  `payment_total` decimal(9,2) NOT NULL DEFAULT '0.00',
  `credit_total` decimal(9,2) NOT NULL DEFAULT '0.00',
  `terms_id` int NOT NULL,
  `invoice_due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoices_fk_vendors` (`vendor_id`),
  KEY `invoices_fk_terms` (`terms_id`),
  KEY `invoices_invoice_date_ix` (`invoice_date` DESC),
  CONSTRAINT `invoices_fk_terms` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`terms_id`),
  CONSTRAINT `invoices_fk_vendors` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,122,'989319-457','2014-04-08',3813.33,3813.33,0.00,3,'2014-05-08','2014-05-07'),(2,123,'263253241','2014-04-10',40.20,40.20,0.00,3,'2014-05-10','2014-05-14'),(3,123,'963253234','2014-04-13',138.75,138.75,0.00,3,'2014-05-13','2014-05-09'),(4,123,'2-000-2993','2014-04-16',144.70,144.70,0.00,3,'2014-05-16','2014-05-12'),(5,123,'963253251','2014-04-16',15.50,15.50,0.00,3,'2014-05-16','2014-05-11'),(6,123,'963253261','2014-04-16',42.75,42.75,0.00,3,'2014-05-16','2014-05-21'),(7,123,'963253237','2014-04-21',172.50,172.50,0.00,3,'2014-05-21','2014-05-22'),(8,89,'125520-1','2014-04-24',95.00,95.00,0.00,1,'2014-05-04','2014-05-01'),(9,121,'97/488','2014-04-24',601.95,601.95,0.00,3,'2014-05-24','2014-05-21'),(10,123,'263253250','2014-04-24',42.67,42.67,0.00,3,'2014-05-24','2014-05-22'),(11,123,'963253262','2014-04-25',42.50,42.50,0.00,3,'2014-05-25','2014-05-20'),(12,96,'I77271-O01','2014-04-26',662.00,662.00,0.00,2,'2014-05-16','2014-05-13'),(13,95,'111-92R-10096','2014-04-30',16.33,16.33,0.00,2,'2014-05-20','2014-05-23'),(14,115,'25022117','2014-05-01',6.00,6.00,0.00,4,'2014-06-10','2014-06-10'),(15,48,'P02-88D77S7','2014-05-03',856.92,856.92,0.00,3,'2014-06-02','2014-05-30'),(16,97,'21-4748363','2014-05-03',9.95,9.95,0.00,2,'2014-05-23','2014-05-22'),(17,123,'4-321-2596','2014-05-05',10.00,10.00,0.00,3,'2014-06-04','2014-06-05'),(18,123,'963253242','2014-05-06',104.00,104.00,0.00,3,'2014-06-05','2014-06-05'),(19,34,'QP58872','2014-05-07',116.54,116.54,0.00,1,'2014-05-17','2014-05-19'),(20,115,'24863706','2014-05-10',6.00,6.00,0.00,4,'2014-06-19','2014-06-15'),(21,119,'10843','2014-05-11',4901.26,4901.26,0.00,2,'2014-05-31','2014-05-29'),(22,123,'963253235','2014-05-11',108.25,108.25,0.00,3,'2014-06-10','2014-06-09'),(23,97,'21-4923721','2014-05-13',9.95,9.95,0.00,2,'2014-06-02','2014-05-28'),(24,113,'77290','2014-05-13',1750.00,1750.00,0.00,5,'2014-07-02','2014-07-05'),(25,123,'963253246','2014-05-13',129.00,129.00,0.00,3,'2014-06-12','2014-06-09'),(26,123,'4-342-8069','2014-05-14',10.00,10.00,0.00,3,'2014-06-13','2014-06-13'),(27,88,'972110','2014-05-15',207.78,207.78,0.00,1,'2014-05-25','2014-05-27'),(28,123,'963253263','2014-05-16',109.50,109.50,0.00,3,'2014-06-15','2014-06-10'),(29,108,'121897','2014-05-19',450.00,450.00,0.00,4,'2014-06-28','2014-07-03'),(30,123,'1-200-5164','2014-05-20',63.40,63.40,0.00,3,'2014-06-19','2014-06-24'),(31,104,'P02-3772','2014-05-21',7125.34,7125.34,0.00,3,'2014-06-20','2014-06-24'),(32,121,'97/486','2014-05-21',953.10,953.10,0.00,3,'2014-06-20','2014-06-22'),(33,105,'94007005','2014-05-23',220.00,220.00,0.00,3,'2014-06-22','2014-06-26'),(34,123,'963253232','2014-05-23',127.75,127.75,0.00,3,'2014-06-22','2014-06-18'),(35,107,'RTR-72-3662-X','2014-05-25',1600.00,1600.00,0.00,4,'2014-07-04','2014-07-09'),(36,121,'97/465','2014-05-25',565.15,565.15,0.00,3,'2014-06-24','2014-06-24'),(37,123,'963253260','2014-05-25',36.00,36.00,0.00,3,'2014-06-24','2014-06-26'),(38,123,'963253272','2014-05-26',61.50,61.50,0.00,3,'2014-06-25','2014-06-30'),(39,110,'0-2058','2014-05-28',37966.19,37966.19,0.00,3,'2014-06-27','2014-06-30'),(40,121,'97/503','2014-05-30',639.77,639.77,0.00,3,'2014-06-29','2014-06-25'),(41,123,'963253255','2014-05-31',53.75,53.75,0.00,3,'2014-06-30','2014-06-27'),(42,123,'94007069','2014-05-31',400.00,400.00,0.00,3,'2014-06-30','2014-07-01'),(43,72,'40318','2014-06-01',21842.00,21842.00,0.00,3,'2014-07-01','2014-06-29'),(44,95,'111-92R-10094','2014-06-01',19.67,19.67,0.00,2,'2014-06-21','2014-06-24'),(45,122,'989319-437','2014-06-01',2765.36,2765.36,0.00,3,'2014-07-01','2014-06-28'),(46,37,'547481328','2014-06-03',224.00,224.00,0.00,3,'2014-07-03','2014-07-04'),(47,83,'31359783','2014-06-03',1575.00,1575.00,0.00,2,'2014-06-23','2014-06-21'),(48,123,'1-202-2978','2014-06-03',33.00,33.00,0.00,3,'2014-07-03','2014-07-05'),(49,95,'111-92R-10097','2014-06-04',16.33,16.33,0.00,2,'2014-06-24','2014-06-26'),(50,37,'547479217','2014-06-07',116.00,116.00,0.00,3,'2014-07-07','2014-07-07'),(51,122,'989319-477','2014-06-08',2184.11,2184.11,0.00,3,'2014-07-08','2014-07-08'),(52,34,'Q545443','2014-06-09',1083.58,1083.58,0.00,1,'2014-06-19','2014-06-23'),(53,95,'111-92R-10092','2014-06-09',46.21,46.21,0.00,2,'2014-06-29','2014-07-02'),(54,121,'97/553B','2014-06-10',313.55,313.55,0.00,3,'2014-07-10','2014-07-09'),(55,123,'963253245','2014-06-10',40.75,40.75,0.00,3,'2014-07-10','2014-07-12'),(56,86,'367447','2014-06-11',2433.00,2433.00,0.00,1,'2014-06-21','2014-06-17'),(57,103,'75C-90227','2014-06-11',1367.50,1367.50,0.00,5,'2014-07-31','2014-07-31'),(58,123,'963253256','2014-06-11',53.25,53.25,0.00,3,'2014-07-11','2014-07-07'),(59,123,'4-314-3057','2014-06-11',13.75,13.75,0.00,3,'2014-07-11','2014-07-15'),(60,122,'989319-497','2014-06-12',2312.20,2312.20,0.00,3,'2014-07-12','2014-07-09'),(61,115,'24946731','2014-06-15',25.67,25.67,0.00,4,'2014-07-25','2014-07-26'),(62,123,'963253269','2014-06-15',26.75,26.75,0.00,3,'2014-07-15','2014-07-11'),(63,122,'989319-427','2014-06-16',2115.81,2115.81,0.00,3,'2014-07-16','2014-07-19'),(64,123,'963253267','2014-06-17',23.50,23.50,0.00,3,'2014-07-17','2014-07-19'),(65,99,'509786','2014-06-18',6940.25,6940.25,0.00,3,'2014-07-18','2014-07-15'),(66,123,'263253253','2014-06-18',31.95,31.95,0.00,3,'2014-07-18','2014-07-21'),(67,122,'989319-487','2014-06-20',1927.54,1927.54,0.00,3,'2014-07-20','2014-07-18'),(68,81,'MABO1489','2014-06-21',936.93,936.93,0.00,2,'2014-07-11','2014-07-10'),(69,80,'133560','2014-06-22',175.00,175.00,0.00,2,'2014-07-12','2014-07-16'),(70,115,'24780512','2014-06-22',6.00,6.00,0.00,4,'2014-08-01','2014-07-29'),(71,123,'963253254','2014-06-22',108.50,108.50,0.00,3,'2014-07-22','2014-07-20'),(72,123,'43966316','2014-06-22',10.00,10.00,0.00,3,'2014-07-22','2014-07-17'),(73,114,'CBM9920-M-T77109','2014-06-23',290.00,290.00,0.00,1,'2014-07-03','2014-06-29'),(74,102,'109596','2014-06-24',41.80,41.80,0.00,4,'2014-08-03','2014-08-04'),(75,123,'7548906-20','2014-06-24',27.00,27.00,0.00,3,'2014-07-24','2014-07-24'),(76,123,'963253248','2014-06-24',241.00,241.00,0.00,3,'2014-07-24','2014-07-25'),(77,121,'97/553','2014-06-25',904.14,904.14,0.00,3,'2014-07-25','2014-07-25'),(78,121,'97/522','2014-06-28',1962.13,1762.13,200.00,3,'2014-07-28','2014-07-30'),(79,100,'587056','2014-06-30',2184.50,2184.50,0.00,4,'2014-08-09','2014-08-07'),(80,122,'989319-467','2014-07-01',2318.03,2318.03,0.00,3,'2014-07-31','2014-07-29'),(81,123,'263253265','2014-07-02',26.25,26.25,0.00,3,'2014-08-01','2014-07-28'),(82,94,'203339-13','2014-07-05',17.50,17.50,0.00,2,'2014-07-25','2014-07-27'),(83,95,'111-92R-10093','2014-07-06',39.77,39.77,0.00,2,'2014-07-26','2014-07-22'),(84,123,'963253258','2014-07-06',111.00,111.00,0.00,3,'2014-08-05','2014-08-05'),(85,123,'963253271','2014-07-07',158.00,158.00,0.00,3,'2014-08-06','2014-08-11'),(86,123,'963253230','2014-07-07',739.20,739.20,0.00,3,'2014-08-06','2014-08-06'),(87,123,'963253244','2014-07-08',60.00,60.00,0.00,3,'2014-08-07','2014-08-09'),(88,123,'963253239','2014-07-08',147.25,147.25,0.00,3,'2014-08-07','2014-08-11'),(89,72,'39104','2014-07-10',85.31,0.00,0.00,3,'2014-08-09',NULL),(90,123,'963253252','2014-07-12',38.75,38.75,0.00,3,'2014-08-11','2014-08-11'),(91,95,'111-92R-10095','2014-07-15',32.70,32.70,0.00,2,'2014-08-04','2014-08-06'),(92,117,'111897','2014-07-15',16.62,16.62,0.00,3,'2014-08-14','2014-08-14'),(93,123,'4-327-7357','2014-07-16',162.75,162.75,0.00,3,'2014-08-15','2014-08-11'),(94,123,'963253264','2014-07-18',52.25,0.00,0.00,3,'2014-08-17',NULL),(95,82,'C73-24','2014-07-19',600.00,600.00,0.00,2,'2014-08-08','2014-08-13'),(96,110,'P-0259','2014-07-19',26881.40,26881.40,0.00,3,'2014-08-18','2014-08-20'),(97,90,'97-1024A','2014-07-20',356.48,356.48,0.00,2,'2014-08-09','2014-08-07'),(98,83,'31361833','2014-07-21',579.42,0.00,0.00,2,'2014-08-10',NULL),(99,123,'263253268','2014-07-21',59.97,0.00,0.00,3,'2014-08-20',NULL),(100,123,'263253270','2014-07-22',67.92,0.00,0.00,3,'2014-08-21',NULL),(101,123,'263253273','2014-07-22',30.75,0.00,0.00,3,'2014-08-21',NULL),(102,110,'P-0608','2014-07-23',20551.18,0.00,1200.00,3,'2014-08-22',NULL),(103,122,'989319-417','2014-07-23',2051.59,2051.59,0.00,3,'2014-08-22','2014-08-24'),(104,123,'263253243','2014-07-23',44.44,44.44,0.00,3,'2014-08-22','2014-08-24'),(105,106,'9982771','2014-07-24',503.20,0.00,0.00,3,'2014-08-23',NULL),(106,110,'0-2060','2014-07-24',23517.58,21221.63,2295.95,3,'2014-08-23','2014-08-27'),(107,122,'989319-447','2014-07-24',3689.99,3689.99,0.00,3,'2014-08-23','2014-08-19'),(108,123,'963253240','2014-07-24',67.00,67.00,0.00,3,'2014-08-23','2014-08-23'),(109,121,'97/222','2014-07-25',1000.46,1000.46,0.00,3,'2014-08-24','2014-08-22'),(110,80,'134116','2014-07-28',90.36,0.00,0.00,2,'2014-08-17',NULL),(111,123,'263253257','2014-07-30',22.57,22.57,0.00,3,'2014-08-29','2014-09-03'),(112,110,'0-2436','2014-07-31',10976.06,0.00,0.00,3,'2014-08-30',NULL),(113,37,'547480102','2014-08-01',224.00,0.00,0.00,3,'2014-08-31',NULL),(114,123,'963253249','2014-08-02',127.75,127.75,0.00,3,'2014-09-01','2014-09-04');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms` (
  `terms_id` int NOT NULL AUTO_INCREMENT,
  `terms_description` varchar(50) NOT NULL,
  `terms_due_days` int NOT NULL,
  PRIMARY KEY (`terms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'Net due 10 days',10),(2,'Net due 20 days',20),(3,'Net due 30 days',30),(4,'Net due 60 days',60),(5,'Net due 90 days',90);
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_contacts`
--

DROP TABLE IF EXISTS `vendor_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_contacts` (
  `vendor_id` int NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_contacts`
--

LOCK TABLES `vendor_contacts` WRITE;
/*!40000 ALTER TABLE `vendor_contacts` DISABLE KEYS */;
INSERT INTO `vendor_contacts` VALUES (5,'Davison','Michelle'),(12,'Mayteh','Kendall'),(17,'Onandonga','Bruce'),(44,'Antavius','Anthony'),(76,'Bradlee','Danny'),(94,'Suscipe','Reynaldo'),(101,'O\'Sullivan','Geraldine'),(123,'Bucket','Charles');
/*!40000 ALTER TABLE `vendor_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(50) NOT NULL,
  `vendor_address1` varchar(50) DEFAULT NULL,
  `vendor_address2` varchar(50) DEFAULT NULL,
  `vendor_city` varchar(50) NOT NULL,
  `vendor_state` char(2) NOT NULL,
  `vendor_zip_code` varchar(20) NOT NULL,
  `vendor_phone` varchar(50) DEFAULT NULL,
  `vendor_contact_last_name` varchar(50) DEFAULT NULL,
  `vendor_contact_first_name` varchar(50) DEFAULT NULL,
  `default_terms_id` int NOT NULL,
  `default_account_number` int NOT NULL,
  PRIMARY KEY (`vendor_id`),
  UNIQUE KEY `vendor_name` (`vendor_name`),
  KEY `vendors_fk_terms` (`default_terms_id`),
  KEY `vendors_fk_accounts` (`default_account_number`),
  CONSTRAINT `vendors_fk_accounts` FOREIGN KEY (`default_account_number`) REFERENCES `general_ledger_accounts` (`account_number`),
  CONSTRAINT `vendors_fk_terms` FOREIGN KEY (`default_terms_id`) REFERENCES `terms` (`terms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'US Postal Service','Attn:  Supt. Window Services','PO Box 7005','Madison','WI','53707','(800) 555-1205','Alberto','Francesco',1,552),(2,'National Information Data Ctr','PO Box 96621',NULL,'Washington','DC','20120','(301) 555-8950','Irvin','Ania',3,540),(3,'Register of Copyrights','Library Of Congress',NULL,'Washington','DC','20559',NULL,'Liana','Lukas',3,403),(4,'Jobtrak','1990 Westwood Blvd Ste 260',NULL,'Los Angeles','CA','90025','(800) 555-8725','Quinn','Kenzie',3,572),(5,'Newbrige Book Clubs','3000 Cindel Drive',NULL,'Washington','NJ','07882','(800) 555-9980','Marks','Michelle',4,394),(6,'California Chamber Of Commerce','3255 Ramos Cir',NULL,'Sacramento','CA','95827','(916) 555-6670','Mauro','Anton',3,572),(7,'Towne Advertiser\'s Mailing Svcs','Kevin Minder','3441 W Macarthur Blvd','Santa Ana','CA','92704',NULL,'Maegen','Ted',3,540),(8,'BFI Industries','PO Box 9369',NULL,'Fresno','CA','93792','(559) 555-1551','Kaleigh','Erick',3,521),(9,'Pacific Gas & Electric','Box 52001',NULL,'San Francisco','CA','94152','(800) 555-6081','Anthoni','Kaitlyn',3,521),(10,'Robbins Mobile Lock And Key','4669 N Fresno',NULL,'Fresno','CA','93726','(559) 555-9375','Leigh','Bill',2,523),(11,'Bill Marvin Electric Inc','4583 E Home',NULL,'Fresno','CA','93703','(559) 555-5106','Hostlery','Kaitlin',2,523),(12,'City Of Fresno','PO Box 2069',NULL,'Fresno','CA','93718','(559) 555-9999','Mayte','Kendall',3,574),(13,'Golden Eagle Insurance Co','PO Box 85826',NULL,'San Diego','CA','92186',NULL,'Blanca','Korah',3,590),(14,'Expedata Inc','4420 N. First Street, Suite 108',NULL,'Fresno','CA','93726','(559) 555-9586','Quintin','Marvin',3,589),(15,'ASC Signs','1528 N Sierra Vista',NULL,'Fresno','CA','93703',NULL,'Darien','Elisabeth',1,546),(16,'Internal Revenue Service',NULL,NULL,'Fresno','CA','93888',NULL,'Aileen','Joan',1,235),(17,'Blanchard & Johnson Associates','27371 Valderas',NULL,'Mission Viejo','CA','92691','(214) 555-3647','Keeton','Gonzalo',3,540),(18,'Fresno Photoengraving Company','1952 \"H\" Street','P.O. Box 1952','Fresno','CA','93718','(559) 555-3005','Chaddick','Derek',3,403),(19,'Crown Printing','1730 \"H\" St',NULL,'Fresno','CA','93721','(559) 555-7473','Randrup','Leann',2,400),(20,'Diversified Printing & Pub','2632 Saturn St',NULL,'Brea','CA','92621','(714) 555-4541','Lane','Vanesa',3,400),(21,'The Library Ltd','7700 Forsyth',NULL,'St Louis','MO','63105','(314) 555-8834','Marques','Malia',3,540),(22,'Micro Center','1555 W Lane Ave',NULL,'Columbus','OH','43221','(614) 555-4435','Evan','Emily',2,160),(23,'Yale Industrial Trucks-Fresno','3711 W Franklin',NULL,'Fresno','CA','93706','(559) 555-2993','Alexis','Alexandro',3,532),(24,'Zee Medical Service Co','4221 W Sierra Madre #104',NULL,'Washington','IA','52353',NULL,'Hallie','Juliana',3,570),(25,'California Data Marketing','2818 E Hamilton',NULL,'Fresno','CA','93721','(559) 555-3801','Jonessen','Moises',4,540),(26,'Small Press','121 E Front St - 4th Floor',NULL,'Traverse City','MI','49684',NULL,'Colette','Dusty',3,540),(27,'Rich Advertising','12 Daniel Road',NULL,'Fairfield','NJ','07004','(201) 555-9742','Neil','Ingrid',3,540),(29,'Vision Envelope & Printing','PO Box 3100',NULL,'Gardena','CA','90247','(310) 555-7062','Raven','Jamari',3,551),(30,'Costco','Fresno Warehouse','4500 W Shaw','Fresno','CA','93711',NULL,'Jaquan','Aaron',3,570),(31,'Enterprise Communications Inc','1483 Chain Bridge Rd, Ste 202',NULL,'Mclean','VA','22101','(770) 555-9558','Lawrence','Eileen',2,536),(32,'RR Bowker','PO Box 31',NULL,'East Brunswick','NJ','08810','(800) 555-8110','Essence','Marjorie',3,532),(33,'Nielson','Ohio Valley Litho Division','Location #0470','Cincinnati','OH','45264',NULL,'Brooklynn','Keely',2,541),(34,'IBM','PO Box 61000',NULL,'San Francisco','CA','94161','(800) 555-4426','Camron','Trentin',1,160),(35,'Cal State Termite','PO Box 956',NULL,'Selma','CA','93662','(559) 555-1534','Hunter','Demetrius',2,523),(36,'Graylift','PO Box 2808',NULL,'Fresno','CA','93745','(559) 555-6621','Sydney','Deangelo',3,532),(37,'Blue Cross','PO Box 9061',NULL,'Oxnard','CA','93031','(800) 555-0912','Eliana','Nikolas',3,510),(38,'Venture Communications Int\'l','60 Madison Ave',NULL,'New York','NY','10010','(212) 555-4800','Neftaly','Thalia',3,540),(39,'Custom Printing Company','PO Box 7028',NULL,'St Louis','MO','63177','(301) 555-1494','Myles','Harley',3,540),(40,'Nat Assoc of College Stores','500 East Lorain Street',NULL,'Oberlin','OH','44074',NULL,'Bernard','Lucy',3,572),(41,'Shields Design','415 E Olive Ave',NULL,'Fresno','CA','93728','(559) 555-8060','Kerry','Rowan',2,403),(42,'Opamp Technical Books','1033 N Sycamore Ave.',NULL,'Los Angeles','CA','90038','(213) 555-4322','Paris','Gideon',3,572),(43,'Capital Resource Credit','PO Box 39046',NULL,'Minneapolis','MN','55439','(612) 555-0057','Maxwell','Jayda',3,589),(44,'Courier Companies, Inc','PO Box 5317',NULL,'Boston','MA','02206','(508) 555-6351','Antavius','Troy',4,400),(45,'Naylor Publications Inc','PO Box 40513',NULL,'Jacksonville','FL','32231','(800) 555-6041','Gerald','Kristofer',3,572),(46,'Open Horizons Publishing','Book Marketing Update','PO Box 205','Fairfield','IA','52556','(515) 555-6130','Damien','Deborah',2,540),(47,'Baker & Taylor Books','Five Lakepointe Plaza, Ste 500','2709 Water Ridge Parkway','Charlotte','NC','28217','(704) 555-3500','Bernardo','Brittnee',3,572),(48,'Fresno County Tax Collector','PO Box 1192',NULL,'Fresno','CA','93715','(559) 555-3482','Brenton','Kila',3,574),(49,'Mcgraw Hill Companies','PO Box 87373',NULL,'Chicago','IL','60680','(614) 555-3663','Holbrooke','Rashad',3,572),(50,'Publishers Weekly','Box 1979',NULL,'Marion','OH','43305','(800) 555-1669','Carrollton','Priscilla',3,572),(51,'Blue Shield of California','PO Box 7021',NULL,'Anaheim','CA','92850','(415) 555-5103','Smith','Kylie',3,510),(52,'Aztek Label','Accounts Payable','1150 N Tustin Ave','Anaheim','CA','92807','(714) 555-9000','Griffin','Brian',3,551),(53,'Gary McKeighan Insurance','3649 W Beechwood Ave #101',NULL,'Fresno','CA','93711','(559) 555-2420','Jair','Caitlin',3,590),(54,'Ph Photographic Services','2384 E Gettysburg',NULL,'Fresno','CA','93726','(559) 555-0765','Cheyenne','Kaylea',3,540),(55,'Quality Education Data','PO Box 95857',NULL,'Chicago','IL','60694','(800) 555-5811','Misael','Kayle',2,540),(56,'Springhouse Corp','PO Box 7247-7051',NULL,'Philadelphia','PA','19170','(215) 555-8700','Maeve','Clarence',3,523),(57,'The Windows Deck','117 W Micheltorena Top Floor',NULL,'Santa Barbara','CA','93101','(800) 555-3353','Wood','Liam',3,536),(58,'Fresno Rack & Shelving Inc','4718 N Bendel Ave',NULL,'Fresno','CA','93722',NULL,'Baylee','Dakota',2,523),(59,'Publishers Marketing Assoc','627 Aviation Way',NULL,'Manhatttan Beach','CA','90266','(310) 555-2732','Walker','Jovon',3,572),(60,'The Mailers Guide Co','PO Box 1550',NULL,'New Rochelle','NY','10802',NULL,'Lacy','Karina',3,540),(61,'American Booksellers Assoc','828 S Broadway',NULL,'Tarrytown','NY','10591','(800) 555-0037','Angelica','Nashalie',3,574),(62,'Cmg Information Services','PO Box 2283',NULL,'Boston','MA','02107','(508) 555-7000','Randall','Yash',3,540),(63,'Lou Gentile\'s Flower Basket','722 E Olive Ave',NULL,'Fresno','CA','93728','(559) 555-6643','Anum','Trisha',1,570),(64,'Texaco','PO Box 6070',NULL,'Inglewood','CA','90312',NULL,'Oren','Grace',3,582),(65,'The Drawing Board','PO Box 4758',NULL,'Carol Stream','IL','60197',NULL,'Mckayla','Jeffery',2,551),(66,'Ascom Hasler Mailing Systems','PO Box 895',NULL,'Shelton','CT','06484',NULL,'Lewis','Darnell',3,532),(67,'Bill Jones','Secretary Of State','PO Box 944230','Sacramento','CA','94244',NULL,'Deasia','Tristin',3,589),(68,'Computer Library','3502 W Greenway #7',NULL,'Phoenix','AZ','85023','(602) 547-0331','Aryn','Leroy',3,540),(69,'Frank E Wilber Co','2437 N Sunnyside',NULL,'Fresno','CA','93727','(559) 555-1881','Millerton','Johnathon',3,532),(70,'Fresno Credit Bureau','PO Box 942',NULL,'Fresno','CA','93714','(559) 555-7900','Braydon','Anne',2,555),(71,'The Fresno Bee','1626 E Street',NULL,'Fresno','CA','93786','(559) 555-4442','Colton','Leah',2,572),(72,'Data Reproductions Corp','4545 Glenmeade Lane',NULL,'Auburn Hills','MI','48326','(810) 555-3700','Arodondo','Cesar',3,400),(73,'Executive Office Products','353 E Shaw Ave',NULL,'Fresno','CA','93710','(559) 555-1704','Danielson','Rachael',2,570),(74,'Leslie Company','PO Box 610',NULL,'Olathe','KS','66061','(800) 255-6210','Alondra','Zev',3,570),(75,'Retirement Plan Consultants','6435 North Palm Ave, Ste 101',NULL,'Fresno','CA','93704','(559) 555-7070','Edgardo','Salina',3,589),(76,'Simon Direct Inc','4 Cornwall Dr Ste 102',NULL,'East Brunswick','NJ','08816','(908) 555-7222','Bradlee','Daniel',2,540),(77,'State Board Of Equalization','PO Box 942808',NULL,'Sacramento','CA','94208','(916) 555-4911','Dean','Julissa',1,631),(78,'The Presort Center','1627 \"E\" Street',NULL,'Fresno','CA','93706','(559) 555-6151','Marissa','Kyle',3,540),(79,'Valprint','PO Box 12332',NULL,'Fresno','CA','93777','(559) 555-3112','Warren','Quentin',3,551),(80,'Cardinal Business Media, Inc.','P O Box 7247-7844',NULL,'Philadelphia','PA','19170','(215) 555-1500','Eulalia','Kelsey',2,540),(81,'Wang Laboratories, Inc.','P.O. Box 21209',NULL,'Pasadena','CA','91185','(800) 555-0344','Kapil','Robert',2,160),(82,'Reiter\'s Scientific & Pro Books','2021 K Street Nw',NULL,'Washington','DC','20006','(202) 555-5561','Rodolfo','Carlee',2,572),(83,'Ingram','PO Box 845361',NULL,'Dallas','TX','75284',NULL,'Yobani','Trey',2,541),(84,'Boucher Communications Inc','1300 Virginia Dr. Ste 400',NULL,'Fort Washington','PA','19034','(215) 555-8000','Carson','Julian',3,540),(85,'Champion Printing Company','3250 Spring Grove Ave',NULL,'Cincinnati','OH','45225','(800) 555-1957','Clifford','Jillian',3,540),(86,'Computerworld','Department #1872','PO Box 61000','San Francisco','CA','94161','(617) 555-0700','Lloyd','Angel',1,572),(87,'DMV Renewal','PO Box 942894',NULL,'Sacramento','CA','94294',NULL,'Josey','Lorena',4,568),(88,'Edward Data Services','4775 E Miami River Rd',NULL,'Cleves','OH','45002','(513) 555-3043','Helena','Jeanette',1,540),(89,'Evans Executone Inc','4918 Taylor Ct',NULL,'Turlock','CA','95380',NULL,'Royce','Hannah',1,522),(90,'Wakefield Co','295 W Cromwell Ave Ste 106',NULL,'Fresno','CA','93711','(559) 555-4744','Rothman','Nathanael',2,170),(91,'McKesson Water Products','P O Box 7126',NULL,'Pasadena','CA','91109','(800) 555-7009','Destin','Luciano',2,570),(92,'Zip Print & Copy Center','PO Box 12332',NULL,'Fresno','CA','93777','(233) 555-6400','Javen','Justin',2,540),(93,'AT&T','PO Box 78225',NULL,'Phoenix','AZ','85062',NULL,'Wesley','Alisha',3,522),(94,'Abbey Office Furnishings','4150 W Shaw Ave',NULL,'Fresno','CA','93722','(559) 555-8300','Francis','Kyra',2,150),(95,'Pacific Bell',NULL,NULL,'Sacramento','CA','95887','(209) 555-7500','Nickalus','Kurt',2,522),(96,'Wells Fargo Bank','Business Mastercard','P.O. Box 29479','Phoenix','AZ','85038','(947) 555-3900','Damion','Mikayla',2,160),(97,'Compuserve','Dept L-742',NULL,'Columbus','OH','43260','(614) 555-8600','Armando','Jan',2,572),(98,'American Express','Box 0001',NULL,'Los Angeles','CA','90096','(800) 555-3344','Story','Kirsten',2,160),(99,'Bertelsmann Industry Svcs. Inc','28210 N Avenue Stanford',NULL,'Valencia','CA','91355','(805) 555-0584','Potter','Lance',3,400),(100,'Cahners Publishing Company','Citibank Lock Box 4026','8725 W Sahara Zone 1127','The Lake','NV','89163','(301) 555-2162','Jacobsen','Samuel',4,540),(101,'California Business Machines','Gallery Plz','5091 N Fresno','Fresno','CA','93710','(559) 555-5570','Rohansen','Anders',2,170),(102,'Coffee Break Service','PO Box 1091',NULL,'Fresno','CA','93714','(559) 555-8700','Smitzen','Jeffrey',4,570),(103,'Dean Witter Reynolds','9 River Pk Pl E 400',NULL,'Boston','MA','02134','(508) 555-8737','Johnson','Vance',5,589),(104,'Digital Dreamworks','5070 N Sixth Ste. 71',NULL,'Fresno','CA','93711',NULL,'Elmert','Ron',3,589),(105,'Dristas Groom & McCormick','7112 N Fresno St Ste 200',NULL,'Fresno','CA','93720','(559) 555-8484','Aaronsen','Thom',3,591),(106,'Ford Motor Credit Company','Dept 0419',NULL,'Los Angeles','CA','90084','(800) 555-7000','Snyder','Karen',3,582),(107,'Franchise Tax Board','PO Box 942857',NULL,'Sacramento','CA','94257',NULL,'Prado','Anita',4,507),(108,'Gostanian General Building','427 W Bedford #102',NULL,'Fresno','CA','93711','(559) 555-5100','Bragg','Walter',4,523),(109,'Kent H Landsberg Co','File No 72686','PO Box 61000','San Francisco','CA','94160','(916) 555-8100','Stevens','Wendy',3,540),(110,'Malloy Lithographing Inc','5411 Jackson Road','PO Box 1124','Ann Arbor','MI','48106','(313) 555-6113','Regging','Abe',3,400),(111,'Net Asset, Llc','1315 Van Ness Ave Ste. 103',NULL,'Fresno','CA','93721',NULL,'Kraggin','Laura',1,572),(112,'Office Depot','File No 81901',NULL,'Los Angeles','CA','90074','(800) 555-1711','Pinsippi','Val',3,570),(113,'Pollstar','4697 W Jacquelyn Ave',NULL,'Fresno','CA','93722','(559) 555-2631','Aranovitch','Robert',5,520),(114,'Postmaster','Postage Due Technician','1900 E Street','Fresno','CA','93706','(559) 555-7785','Finklestein','Fyodor',1,552),(115,'Roadway Package System, Inc','Dept La 21095',NULL,'Pasadena','CA','91185',NULL,'Smith','Sam',4,553),(116,'State of California','Employment Development Dept','PO Box 826276','Sacramento','CA','94230','(209) 555-5132','Articunia','Mercedez',1,631),(117,'Suburban Propane','2874 S Cherry Ave',NULL,'Fresno','CA','93706','(559) 555-2770','Spivak','Harold',3,521),(118,'Unocal','P.O. Box 860070',NULL,'Pasadena','CA','91186','(415) 555-7600','Bluzinski','Rachael',3,582),(119,'Yesmed, Inc','PO Box 2061',NULL,'Fresno','CA','93718','(559) 555-0600','Hernandez','Reba',2,589),(120,'Dataforms/West','1617 W. Shaw Avenue','Suite F','Fresno','CA','93711',NULL,'Church','Charlie',3,551),(121,'Zylka Design','3467 W Shaw Ave #103',NULL,'Fresno','CA','93711','(559) 555-8625','Ronaldsen','Jaime',3,403),(122,'United Parcel Service','P.O. Box 505820',NULL,'Reno','NV','88905','(800) 555-0855','Beauregard','Violet',3,553),(123,'Federal Express Corporation','P.O. Box 1140','Dept A','Memphis','TN','38101','(800) 555-4091','Bucket','Charlie',3,553);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 19:06:27
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: entertainmentagency
-- ------------------------------------------------------
-- Server version	8.0.20
CREATE DATABASE EntertainmentAgencyDB;
use EntertainmentAgencyDB;
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
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `AgentID` int NOT NULL,
  `AgtFirstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AgtLastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AgtStreetAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AgtCity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AgtState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AgtZipCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AgtPhoneNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DateHired` date DEFAULT NULL,
  `Salary` decimal(15,2) DEFAULT '0.00',
  `CommissionRate` float DEFAULT '0',
  PRIMARY KEY (`AgentID`),
  KEY `AgtZipCode` (`AgtZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (1,'William','Thompson','122 Spring River Drive','Redmond','WA','98053','555-2681','1997-05-15',35000.00,0.04),(2,'Scott','Bishop','66 Spring Valley Drive','Seattle','WA','98125','555-2666','1998-02-05',27000.00,0.04),(3,'Carol','Viescas','667 Red River Road','Bellevue','WA','98006','555-2571','1997-11-19',30000.00,0.05),(4,'Karen','Smith','30301 - 166th Ave. N.E.','Seattle','WA','98125','555-2551','1998-03-05',22000.00,0.055),(5,'Marianne','Wier','908 W. Capital Way','Tacoma','WA','98413','555-2606','1998-02-02',24500.00,0.045),(6,'John','Kennedy','16679 NE 41st Court','Seattle','WA','98125','555-2621','1997-05-15',33000.00,0.06),(7,'Caleb','Viescas','4501 Wetland Road','Redmond','WA','98052','555-0037','1998-02-16',22100.00,0.035),(8,'Maria','Patterson','3445 Cheyenne Road','Bellevue','WA','98006','555-2291','1997-09-03',30000.00,0.04),(9,'Daffy','Dumbwit','1234 Main Street','Kirkland','WA','98033','555-1234','2000-02-05',50.00,0.01);
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL,
  `CustFirstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustLastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustStreetAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustCity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustZipCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustPhoneNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `CustZipCode` (`CustZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (10001,'Doris','Hartwig','4726 - 11th Ave. N.E.','Seattle','WA','98105','555-2671'),(10002,'Deb','Waldal','908 W. Capital Way','Tacoma','WA','98413','555-2496'),(10003,'Peter','Brehm','722 Moss Bay Blvd.','Kirkland','WA','98033','555-2501'),(10004,'Dean','McCrae','4110 Old Redmond Rd.','Redmond','WA','98052','555-2506'),(10005,'Elizabeth','Hallmark','Route 2, Box 203B','Auburn','WA','98002','555-2521'),(10006,'Matt','Berg','908 W. Capital Way','Tacoma','WA','98413','555-2581'),(10007,'Liz','Keyser','13920 S.E. 40th Street','Bellevue','WA','98006','555-2556'),(10008,'Darren','Gehring','2601 Seaview Lane','Kirkland','WA','98033','555-2616'),(10009,'Sarah','Thompson','2222 Springer Road','Bellevue','WA','98006','555-2626'),(10010,'Zachary','Ehrlich','12330 Kingman Drive','Kirkland','WA','98033','555-2721'),(10011,'Joyce','Bonnicksen','2424 Thames Drive','Bellevue','WA','98006','555-2726'),(10012,'Kerry','Patterson','777 Fenexet Blvd','Redmond','WA','98052','555-0399'),(10013,'Estella','Pundt','2500 Rosales Lane','Bellevue','WA','98006','555-9938'),(10014,'Mark','Rosales','323 Advocate Lane','Bellevue','WA','98006','555-2286'),(10015,'Carol','Viescas','754 Fourth Ave','Seattle','WA','98115','555-2296');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engagements`
--

DROP TABLE IF EXISTS `engagements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engagements` (
  `EngagementNumber` int NOT NULL DEFAULT '0',
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `StopTime` time DEFAULT NULL,
  `ContractPrice` decimal(15,2) DEFAULT '0.00',
  `CustomerID` int DEFAULT '0',
  `AgentID` int DEFAULT '0',
  `EntertainerID` int DEFAULT '0',
  PRIMARY KEY (`EngagementNumber`),
  KEY `AgentsEngagements` (`AgentID`),
  KEY `CustomersEngagements` (`CustomerID`),
  KEY `EntertainersEngagements` (`EntertainerID`),
  CONSTRAINT `Engagements_FK00` FOREIGN KEY (`AgentID`) REFERENCES `agents` (`AgentID`),
  CONSTRAINT `Engagements_FK01` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `Engagements_FK02` FOREIGN KEY (`EntertainerID`) REFERENCES `entertainers` (`EntertainerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engagements`
--

LOCK TABLES `engagements` WRITE;
/*!40000 ALTER TABLE `engagements` DISABLE KEYS */;
INSERT INTO `engagements` VALUES (2,'2012-09-01','2012-09-05','13:00:00','15:00:00',200.00,10006,4,1004),(3,'2012-09-10','2012-09-15','13:00:00','15:00:00',590.00,10001,3,1005),(4,'2012-09-11','2012-09-17','20:00:00','00:00:00',470.00,10007,3,1004),(5,'2012-09-11','2012-09-14','16:00:00','19:00:00',1130.00,10006,5,1003),(6,'2012-09-10','2012-09-14','15:00:00','21:00:00',2300.00,10014,7,1008),(7,'2012-09-11','2012-09-18','17:00:00','20:00:00',770.00,10004,4,1002),(8,'2012-09-18','2012-09-25','20:00:00','23:00:00',1850.00,10006,3,1007),(9,'2012-09-18','2012-09-28','19:00:00','21:00:00',1370.00,10010,2,1010),(10,'2012-09-17','2012-09-26','13:00:00','17:00:00',3650.00,10005,3,1003),(11,'2012-09-15','2012-09-16','18:00:00','00:00:00',950.00,10005,4,1008),(12,'2012-09-18','2012-09-26','18:00:00','22:00:00',1670.00,10014,8,1001),(13,'2012-09-17','2012-09-20','20:00:00','23:00:00',770.00,10003,1,1006),(14,'2012-09-24','2012-09-29','16:00:00','22:00:00',2750.00,10001,1,1008),(15,'2012-09-24','2012-09-29','17:00:00','19:00:00',770.00,10007,1,1013),(16,'2012-10-02','2012-10-06','20:00:00','01:00:00',1550.00,10010,5,1013),(17,'2012-09-29','2012-10-02','18:00:00','20:00:00',530.00,10002,8,1010),(19,'2012-09-29','2012-10-05','20:00:00','23:00:00',365.00,10009,8,1004),(21,'2012-09-30','2012-10-03','12:00:00','16:00:00',1490.00,10005,1,1003),(22,'2012-09-30','2012-10-05','12:00:00','15:00:00',590.00,10004,5,1002),(23,'2012-09-30','2012-09-30','20:00:00','00:00:00',290.00,10012,4,1013),(24,'2012-10-01','2012-10-07','12:00:00','18:00:00',1940.00,10001,4,1001),(26,'2012-10-09','2012-10-14','17:00:00','22:00:00',950.00,10001,6,1002),(27,'2012-10-07','2012-10-12','12:00:00','16:00:00',2210.00,10015,7,1003),(28,'2012-10-06','2012-10-15','17:00:00','22:00:00',3800.00,10003,4,1007),(30,'2012-10-06','2012-10-08','17:00:00','22:00:00',275.00,10009,5,1011),(31,'2012-10-07','2012-10-16','16:00:00','20:00:00',2450.00,10002,8,1010),(32,'2012-10-07','2012-10-16','13:00:00','15:00:00',1250.00,10010,7,1013),(34,'2012-10-14','2012-10-20','16:00:00','18:00:00',680.00,10004,8,1005),(35,'2012-10-14','2012-10-15','19:00:00','23:00:00',410.00,10005,8,1001),(36,'2012-10-13','2012-10-23','18:00:00','22:00:00',710.00,10014,3,1011),(37,'2012-10-13','2012-10-19','14:00:00','19:00:00',2675.00,10006,3,1008),(38,'2012-10-14','2012-10-18','14:00:00','20:00:00',1850.00,10013,4,1006),(41,'2012-10-20','2012-10-28','18:00:00','21:00:00',860.00,10013,3,1002),(42,'2012-10-20','2012-10-26','17:00:00','22:00:00',2150.00,10002,1,1013),(43,'2012-10-21','2012-10-21','14:00:00','16:00:00',140.00,10001,8,1001),(44,'2012-10-22','2012-10-26','14:00:00','19:00:00',1925.00,10006,3,1008),(45,'2012-10-21','2012-10-28','14:00:00','18:00:00',530.00,10015,1,1012),(46,'2012-10-28','2012-11-05','15:00:00','17:00:00',1400.00,10009,4,1008),(48,'2012-11-05','2012-11-06','16:00:00','22:00:00',950.00,10002,1,1007),(49,'2012-11-13','2012-11-19','12:00:00','14:00:00',680.00,10014,5,1001),(51,'2012-11-13','2012-11-14','20:00:00','01:00:00',650.00,10013,3,1013),(52,'2012-11-13','2012-11-14','16:00:00','21:00:00',650.00,10010,3,1006),(53,'2012-11-11','2012-11-12','17:00:00','19:00:00',350.00,10002,5,1007),(55,'2012-11-19','2012-11-26','20:00:00','02:00:00',770.00,10002,3,1011),(56,'2012-11-25','2012-11-28','14:00:00','19:00:00',1550.00,10010,3,1007),(58,'2012-12-01','2012-12-04','17:00:00','23:00:00',770.00,10001,2,1002),(59,'2012-12-01','2012-12-04','15:00:00','19:00:00',290.00,10004,6,1012),(60,'2012-12-02','2012-12-04','13:00:00','17:00:00',230.00,10010,8,1004),(61,'2012-12-03','2012-12-10','17:00:00','20:00:00',410.00,10015,8,1011),(62,'2012-12-09','2012-12-10','20:00:00','01:00:00',500.00,10003,2,1005),(63,'2012-12-18','2012-12-21','14:00:00','16:00:00',650.00,10009,3,1008),(64,'2012-12-25','2013-01-03','14:00:00','16:00:00',1250.00,10007,3,1013),(66,'2012-12-22','2012-12-29','20:00:00','02:00:00',2930.00,10005,5,1006),(68,'2012-12-24','2012-12-29','16:00:00','22:00:00',1670.00,10009,1,1005),(69,'2012-12-22','2012-12-23','15:00:00','18:00:00',500.00,10004,7,1008),(70,'2012-12-23','2012-12-26','13:00:00','15:00:00',410.00,10010,6,1001),(71,'2012-12-22','2012-12-27','14:00:00','17:00:00',1670.00,10002,1,1003),(72,'2012-12-22','2013-01-01','20:00:00','01:00:00',875.00,10012,4,1011),(73,'2012-12-29','2013-01-07','19:00:00','22:00:00',1400.00,10014,5,1001),(74,'2013-01-01','2013-01-06','13:00:00','15:00:00',590.00,10004,1,1005),(75,'2013-01-01','2013-01-11','17:00:00','20:00:00',2525.00,10001,7,1007),(76,'2012-12-30','2013-01-03','16:00:00','22:00:00',500.00,10005,7,1012),(77,'2012-12-30','2013-01-04','17:00:00','20:00:00',1670.00,10015,5,1003),(78,'2013-01-01','2013-01-03','16:00:00','20:00:00',770.00,10010,4,1010),(79,'2012-12-30','2013-01-03','12:00:00','17:00:00',1550.00,10006,8,1006),(80,'2012-12-31','2013-01-01','17:00:00','21:00:00',650.00,10002,5,1008),(81,'2013-01-01','2013-01-09','13:00:00','17:00:00',1130.00,10013,4,1002),(82,'2013-01-08','2013-01-09','20:00:00','01:00:00',950.00,10014,8,1003),(83,'2013-01-06','2013-01-10','13:00:00','15:00:00',650.00,10010,2,1006),(84,'2013-01-06','2013-01-11','17:00:00','19:00:00',230.00,10007,3,1012),(85,'2013-01-06','2013-01-08','14:00:00','19:00:00',1175.00,10015,4,1008),(87,'2013-01-04','2013-01-06','16:00:00','19:00:00',275.00,10007,6,1008),(88,'2013-01-07','2013-01-17','12:00:00','14:00:00',1370.00,10004,8,1013),(89,'2013-01-06','2013-01-07','14:00:00','16:00:00',290.00,10003,8,1010),(90,'2013-01-08','2013-01-08','20:00:00','02:00:00',320.00,10006,5,1001),(91,'2013-01-05','2013-01-12','13:00:00','19:00:00',770.00,10009,3,1004),(92,'2013-01-12','2013-01-16','19:00:00','00:00:00',1925.00,10012,6,1008),(95,'2013-01-15','2013-01-18','20:00:00','01:00:00',1550.00,10010,6,1007),(96,'2013-01-22','2013-01-31','15:00:00','17:00:00',950.00,10009,6,1005),(97,'2013-01-19','2013-01-19','17:00:00','21:00:00',110.00,10012,8,1004),(98,'2013-01-20','2013-01-27','20:00:00','02:00:00',2930.00,10012,2,1010),(99,'2013-01-22','2013-02-22','14:00:00','20:00:00',14105.00,10005,6,1008),(100,'2013-01-19','2013-01-23','12:00:00','18:00:00',1850.00,10015,3,1006),(101,'2013-01-22','2013-01-30','14:00:00','18:00:00',1670.00,10004,5,1001),(102,'2013-01-22','2013-01-31','12:00:00','15:00:00',2300.00,10013,5,1007),(103,'2013-01-21','2013-01-27','12:00:00','17:00:00',575.00,10010,4,1011),(104,'2013-01-28','2013-02-01','13:00:00','16:00:00',1400.00,10010,6,1003),(105,'2013-01-27','2013-02-01','12:00:00','17:00:00',1850.00,10002,4,1013),(106,'2013-01-29','2013-02-01','15:00:00','18:00:00',770.00,10003,6,1006),(107,'2013-01-29','2013-01-30','16:00:00','21:00:00',200.00,10007,4,1004),(108,'2013-02-02','2013-02-04','18:00:00','00:00:00',320.00,10004,5,1012),(109,'2013-02-11','2013-02-15','13:00:00','19:00:00',1850.00,10014,5,1010),(110,'2013-02-11','2013-02-19','15:00:00','19:00:00',1670.00,10006,8,1001),(111,'2013-02-12','2013-02-14','15:00:00','18:00:00',185.00,10012,1,1004),(112,'2013-02-19','2013-02-24','18:00:00','22:00:00',410.00,10015,7,1011),(114,'2013-02-19','2013-02-28','12:00:00','17:00:00',1550.00,10005,1,1002),(115,'2013-02-19','2013-02-22','12:00:00','18:00:00',1490.00,10007,5,1013),(116,'2013-02-16','2013-02-25','14:00:00','19:00:00',800.00,10003,6,1012),(118,'2013-02-18','2013-02-18','19:00:00','00:00:00',350.00,10014,1,1010),(119,'2013-02-19','2013-02-28','18:00:00','21:00:00',500.00,10012,2,1004),(120,'2013-02-17','2013-02-20','20:00:00','23:00:00',950.00,10002,7,1008),(121,'2013-02-16','2013-02-22','17:00:00','23:00:00',2570.00,10004,3,1006),(122,'2013-02-24','2013-02-27','15:00:00','19:00:00',1010.00,10014,5,1010),(123,'2013-02-25','2013-02-28','16:00:00','20:00:00',770.00,10013,1,1001),(124,'2013-02-23','2013-03-02','14:00:00','17:00:00',1850.00,10006,1,1008),(125,'2013-02-23','2013-02-28','13:00:00','15:00:00',1130.00,10001,3,1003),(126,'2013-02-24','2013-03-03','18:00:00','20:00:00',1010.00,10009,6,1006),(127,'2013-02-24','2013-02-28','20:00:00','22:00:00',500.00,10010,4,1005),(128,'2013-02-26','2013-02-28','19:00:00','01:00:00',320.00,10003,4,1011),(129,'2013-02-24','2013-03-05','17:00:00','21:00:00',2450.00,10004,5,1013),(131,'2013-03-03','2013-03-12','15:00:00','17:00:00',1850.00,10014,1,1003);
/*!40000 ALTER TABLE `engagements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entertainer_members`
--

DROP TABLE IF EXISTS `entertainer_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entertainer_members` (
  `EntertainerID` int NOT NULL,
  `MemberID` int NOT NULL DEFAULT '0',
  `Status` smallint DEFAULT '0',
  PRIMARY KEY (`EntertainerID`,`MemberID`),
  KEY `EntertainersEntertainerMembers` (`EntertainerID`),
  KEY `MembersEntertainerMembers` (`MemberID`),
  CONSTRAINT `Entertainer_Members_FK00` FOREIGN KEY (`EntertainerID`) REFERENCES `entertainers` (`EntertainerID`),
  CONSTRAINT `Entertainer_Members_FK01` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entertainer_members`
--

LOCK TABLES `entertainer_members` WRITE;
/*!40000 ALTER TABLE `entertainer_members` DISABLE KEYS */;
INSERT INTO `entertainer_members` VALUES (1001,106,1),(1001,107,1),(1001,118,2),(1002,120,2),(1002,121,1),(1003,102,1),(1003,103,1),(1003,104,1),(1003,109,1),(1003,117,1),(1003,119,2),(1004,125,2),(1005,116,1),(1005,120,2),(1005,121,1),(1006,104,1),(1006,113,1),(1006,118,1),(1006,120,2),(1007,101,1),(1007,102,1),(1007,105,1),(1007,107,2),(1007,110,1),(1008,103,1),(1008,105,1),(1008,111,1),(1008,114,2),(1008,115,1),(1009,121,2),(1010,108,1),(1010,112,2),(1010,123,1),(1010,124,1),(1011,122,2),(1012,123,2),(1013,112,1),(1013,114,1),(1013,117,1),(1013,124,2);
/*!40000 ALTER TABLE `entertainer_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entertainer_styles`
--

DROP TABLE IF EXISTS `entertainer_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entertainer_styles` (
  `EntertainerID` int NOT NULL,
  `StyleID` smallint NOT NULL DEFAULT '0',
  `StyleStrength` smallint NOT NULL,
  PRIMARY KEY (`EntertainerID`,`StyleID`),
  KEY `EntertainersEntertainerStyles` (`EntertainerID`),
  KEY `MusicalStylesEntStyles` (`StyleID`),
  CONSTRAINT `Entertainer_Styles_FK00` FOREIGN KEY (`EntertainerID`) REFERENCES `entertainers` (`EntertainerID`),
  CONSTRAINT `Entertainer_Styles_FK01` FOREIGN KEY (`StyleID`) REFERENCES `musical_styles` (`StyleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entertainer_styles`
--

LOCK TABLES `entertainer_styles` WRITE;
/*!40000 ALTER TABLE `entertainer_styles` DISABLE KEYS */;
INSERT INTO `entertainer_styles` VALUES (1001,10,2),(1001,20,1),(1001,21,3),(1002,17,2),(1002,19,1),(1002,23,3),(1003,3,1),(1003,8,2),(1004,13,1),(1005,15,3),(1005,19,1),(1005,24,2),(1006,22,3),(1006,23,1),(1006,24,2),(1007,6,2),(1007,11,1),(1008,3,2),(1008,6,1),(1009,7,2),(1009,14,1),(1009,21,3),(1010,4,2),(1010,21,3),(1010,22,1),(1011,7,2),(1011,14,1),(1011,20,3),(1012,7,2),(1012,13,1),(1013,10,2),(1013,15,1);
/*!40000 ALTER TABLE `entertainer_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entertainers`
--

DROP TABLE IF EXISTS `entertainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entertainers` (
  `EntertainerID` int NOT NULL,
  `EntStageName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntSSN` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntStreetAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntCity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntZipCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntPhoneNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntWebPage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EntEMailAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DateEntered` date DEFAULT NULL,
  PRIMARY KEY (`EntertainerID`),
  UNIQUE KEY `EntertainerID` (`EntertainerID`),
  KEY `EntZipCode` (`EntZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entertainers`
--

LOCK TABLES `entertainers` WRITE;
/*!40000 ALTER TABLE `entertainers` DISABLE KEYS */;
INSERT INTO `entertainers` VALUES (1001,'Carol Peacock Trio','888-90-1121','4110 Old Redmond Rd.','Redmond','WA','98052','555-2691','www.cptrio.com','carolp@cptrio.com','1997-05-24'),(1002,'Topazz','888-50-1061','16 Maple Lane','Auburn','WA','98002','555-2591','www.topazz.com',NULL,'1996-02-14'),(1003,'JV & the Deep Six','888-18-1013','15127 NE 24th, #383','Redmond','WA','98052','555-2511','www.jvd6.com','jv@myspring.com','1998-03-18'),(1004,'Jim Glynn','888-26-1025','13920 S.E. 40th Street','Bellevue','WA','98009','555-2531',NULL,NULL,'1996-04-01'),(1005,'Jazz Persuasion','888-30-1031','233 West Valley Hwy','Bellevue','WA','98005','555-2541','www.jazzper.com',NULL,'1997-05-12'),(1006,'Modern Dance','888-66-1085','Route 2, Box 203B','Woodinville','WA','98072','555-2631','www.moderndance.com','mikeh@moderndance.com','1995-05-16'),(1007,'Coldwater Cattle Company','888-38-1043','4726 - 11th Ave. N.E.','Seattle','WA','98105','555-2561','www.coldwatercows.com',NULL,'1995-11-30'),(1008,'Country Feeling','888-98-1133','PO Box 223311','Seattle','WA','98125','555-2711',NULL,NULL,'1996-02-28'),(1009,'Katherine Ehrlich','888-61-1103','777 Fenexet Blvd','Woodinville','WA','98072','555-0399',NULL,'ke@mzo.com','1998-09-13'),(1010,'Saturday Revue','888-64-1109','3887 Easy Street','Seattle','WA','98125','555-0039','www.satrevue.com','edz@coolness.com','1995-01-20'),(1011,'Julia Schnebly','888-65-1111','2343 Harmony Lane','Seattle','WA','99837','555-9936',NULL,NULL,'1996-04-12'),(1012,'Susan McLain','888-70-1121','511 Lenora Ave','Bellevue','WA','98006','555-2301','www.greensleeves.com','susan@gs.com','1998-10-12'),(1013,'Caroline Coie Cuartet','888-71-1123','298 Forest Lane','Auburn','WA','98002','555-2306',NULL,'carolinec@willow.com','1997-07-11');
/*!40000 ALTER TABLE `entertainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `MemberID` int NOT NULL DEFAULT '0',
  `MbrFirstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MbrLastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MbrPhoneNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (101,'David','Hamilton','555-2701','M'),(102,'Suzanne','Viescas','555-2686','F'),(103,'Gary','Hallmark','555-2676','M'),(104,'Jeffrey','Smith','555-2596','M'),(105,'Robert','Brown','555-2491','M'),(106,'Mariya','Sergienko','555-2526','F'),(107,'Sara','Sheskey','555-2566','F'),(108,'Rachel','Patterson','555-2546','F'),(109,'David','Viescas','555-2661','M'),(110,'Manuela','Seidel','555-2641','F'),(111,'Kathryn','Patterson','555-2651','F'),(112,'Kendra','Bonnicksen','555-2716','F'),(113,'Steve','Pundt','555-9938','M'),(114,'George','Chavez','555-9930','M'),(115,'Joe','Rosales III','555-2281','M'),(116,'Angel','Kennedy','555-2311','M'),(117,'Luke','Patterson','555-2316','M'),(118,'Janice','Galvin','555-2691','F'),(119,'John','Viescas','555-2511','M'),(120,'Michael','Hernandez','555-2711','M'),(121,'Katherine','Ehrlich','555-0399','F'),(122,'Julia','Schnebly','555-9936','F'),(123,'Susan','McLain','555-2301','F'),(124,'Caroline','Coie','555-2306','F'),(125,'Jim','Glynn','555-2531',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musical_preferences`
--

DROP TABLE IF EXISTS `musical_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musical_preferences` (
  `CustomerID` int NOT NULL DEFAULT '0',
  `StyleID` smallint NOT NULL DEFAULT '0',
  `PreferenceSeq` smallint NOT NULL,
  PRIMARY KEY (`CustomerID`,`StyleID`),
  KEY `CustomersMusicalPreferences` (`CustomerID`),
  KEY `StyleID` (`StyleID`),
  CONSTRAINT `Musical_Preferences_FK00` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `Musical_Preferences_FK01` FOREIGN KEY (`StyleID`) REFERENCES `musical_styles` (`StyleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musical_preferences`
--

LOCK TABLES `musical_preferences` WRITE;
/*!40000 ALTER TABLE `musical_preferences` DISABLE KEYS */;
INSERT INTO `musical_preferences` VALUES (10001,10,2),(10001,22,1),(10002,3,1),(10002,8,2),(10003,17,2),(10003,19,1),(10004,15,1),(10004,21,2),(10005,7,2),(10005,14,1),(10006,13,2),(10006,23,1),(10007,4,2),(10007,8,1),(10007,19,3),(10008,10,1),(10008,21,2),(10009,6,2),(10009,11,1),(10009,18,3),(10010,15,2),(10010,19,1),(10010,24,3),(10011,1,2),(10011,7,3),(10011,21,1),(10012,10,2),(10012,20,1),(10013,15,1),(10013,24,2),(10014,5,3),(10014,18,2),(10014,22,1),(10015,1,3),(10015,20,2),(10015,21,1);
/*!40000 ALTER TABLE `musical_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musical_styles`
--

DROP TABLE IF EXISTS `musical_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musical_styles` (
  `StyleID` smallint NOT NULL DEFAULT '0',
  `StyleName` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`StyleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musical_styles`
--

LOCK TABLES `musical_styles` WRITE;
/*!40000 ALTER TABLE `musical_styles` DISABLE KEYS */;
INSERT INTO `musical_styles` VALUES (1,'40\'s Ballroom Music'),(2,'50\'s Music'),(3,'60\'s Music'),(4,'70\'s Music'),(5,'80\'s Music'),(6,'Country'),(7,'Classical'),(8,'Classic Rock & Roll'),(9,'Rap'),(10,'Contemporary'),(11,'Country Rock'),(12,'Elvis'),(13,'Folk'),(14,'Chamber Music'),(15,'Jazz'),(16,'Karaoke'),(17,'Motown'),(18,'Modern Rock'),(19,'Rhythm and Blues'),(20,'Show Tunes'),(21,'Standards'),(22,'Top 40 Hits'),(23,'Variety'),(24,'Salsa'),(25,'90\'s Music');
/*!40000 ALTER TABLE `musical_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztbldays`
--

DROP TABLE IF EXISTS `ztbldays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztbldays` (
  `DateField` date NOT NULL,
  PRIMARY KEY (`DateField`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztbldays`
--

LOCK TABLES `ztbldays` WRITE;
/*!40000 ALTER TABLE `ztbldays` DISABLE KEYS */;
INSERT INTO `ztbldays` VALUES ('2012-01-01'),('2012-01-02'),('2012-01-03'),('2012-01-04'),('2012-01-05'),('2012-01-06'),('2012-01-07'),('2012-01-08'),('2012-01-09'),('2012-01-10'),('2012-01-11'),('2012-01-12'),('2012-01-13'),('2012-01-14'),('2012-01-15'),('2012-01-16'),('2012-01-17'),('2012-01-18'),('2012-01-19'),('2012-01-20'),('2012-01-21'),('2012-01-22'),('2012-01-23'),('2012-01-24'),('2012-01-25'),('2012-01-26'),('2012-01-27'),('2012-01-28'),('2012-01-29'),('2012-01-30'),('2012-01-31'),('2012-02-01'),('2012-02-02'),('2012-02-03'),('2012-02-04'),('2012-02-05'),('2012-02-06'),('2012-02-07'),('2012-02-08'),('2012-02-09'),('2012-02-10'),('2012-02-11'),('2012-02-12'),('2012-02-13'),('2012-02-14'),('2012-02-15'),('2012-02-16'),('2012-02-17'),('2012-02-18'),('2012-02-19'),('2012-02-20'),('2012-02-21'),('2012-02-22'),('2012-02-23'),('2012-02-24'),('2012-02-25'),('2012-02-26'),('2012-02-27'),('2012-02-28'),('2012-02-29'),('2012-03-01'),('2012-03-02'),('2012-03-03'),('2012-03-04'),('2012-03-05'),('2012-03-06'),('2012-03-07'),('2012-03-08'),('2012-03-09'),('2012-03-10'),('2012-03-11'),('2012-03-12'),('2012-03-13'),('2012-03-14'),('2012-03-15'),('2012-03-16'),('2012-03-17'),('2012-03-18'),('2012-03-19'),('2012-03-20'),('2012-03-21'),('2012-03-22'),('2012-03-23'),('2012-03-24'),('2012-03-25'),('2012-03-26'),('2012-03-27'),('2012-03-28'),('2012-03-29'),('2012-03-30'),('2012-03-31'),('2012-04-01'),('2012-04-02'),('2012-04-03'),('2012-04-04'),('2012-04-05'),('2012-04-06'),('2012-04-07'),('2012-04-08'),('2012-04-09'),('2012-04-10'),('2012-04-11'),('2012-04-12'),('2012-04-13'),('2012-04-14'),('2012-04-15'),('2012-04-16'),('2012-04-17'),('2012-04-18'),('2012-04-19'),('2012-04-20'),('2012-04-21'),('2012-04-22'),('2012-04-23'),('2012-04-24'),('2012-04-25'),('2012-04-26'),('2012-04-27'),('2012-04-28'),('2012-04-29'),('2012-04-30'),('2012-05-01'),('2012-05-02'),('2012-05-03'),('2012-05-04'),('2012-05-05'),('2012-05-06'),('2012-05-07'),('2012-05-08'),('2012-05-09'),('2012-05-10'),('2012-05-11'),('2012-05-12'),('2012-05-13'),('2012-05-14'),('2012-05-15'),('2012-05-16'),('2012-05-17'),('2012-05-18'),('2012-05-19'),('2012-05-20'),('2012-05-21'),('2012-05-22'),('2012-05-23'),('2012-05-24'),('2012-05-25'),('2012-05-26'),('2012-05-27'),('2012-05-28'),('2012-05-29'),('2012-05-30'),('2012-05-31'),('2012-06-01'),('2012-06-02'),('2012-06-03'),('2012-06-04'),('2012-06-05'),('2012-06-06'),('2012-06-07'),('2012-06-08'),('2012-06-09'),('2012-06-10'),('2012-06-11'),('2012-06-12'),('2012-06-13'),('2012-06-14'),('2012-06-15'),('2012-06-16'),('2012-06-17'),('2012-06-18'),('2012-06-19'),('2012-06-20'),('2012-06-21'),('2012-06-22'),('2012-06-23'),('2012-06-24'),('2012-06-25'),('2012-06-26'),('2012-06-27'),('2012-06-28'),('2012-06-29'),('2012-06-30'),('2012-07-01'),('2012-07-02'),('2012-07-03'),('2012-07-04'),('2012-07-05'),('2012-07-06'),('2012-07-07'),('2012-07-08'),('2012-07-09'),('2012-07-10'),('2012-07-11'),('2012-07-12'),('2012-07-13'),('2012-07-14'),('2012-07-15'),('2012-07-16'),('2012-07-17'),('2012-07-18'),('2012-07-19'),('2012-07-20'),('2012-07-21'),('2012-07-22'),('2012-07-23'),('2012-07-24'),('2012-07-25'),('2012-07-26'),('2012-07-27'),('2012-07-28'),('2012-07-29'),('2012-07-30'),('2012-07-31'),('2012-08-01'),('2012-08-02'),('2012-08-03'),('2012-08-04'),('2012-08-05'),('2012-08-06'),('2012-08-07'),('2012-08-08'),('2012-08-09'),('2012-08-10'),('2012-08-11'),('2012-08-12'),('2012-08-13'),('2012-08-14'),('2012-08-15'),('2012-08-16'),('2012-08-17'),('2012-08-18'),('2012-08-19'),('2012-08-20'),('2012-08-21'),('2012-08-22'),('2012-08-23'),('2012-08-24'),('2012-08-25'),('2012-08-26'),('2012-08-27'),('2012-08-28'),('2012-08-29'),('2012-08-30'),('2012-08-31'),('2012-09-01'),('2012-09-02'),('2012-09-03'),('2012-09-04'),('2012-09-05'),('2012-09-06'),('2012-09-07'),('2012-09-08'),('2012-09-09'),('2012-09-10'),('2012-09-11'),('2012-09-12'),('2012-09-13'),('2012-09-14'),('2012-09-15'),('2012-09-16'),('2012-09-17'),('2012-09-18'),('2012-09-19'),('2012-09-20'),('2012-09-21'),('2012-09-22'),('2012-09-23'),('2012-09-24'),('2012-09-25'),('2012-09-26'),('2012-09-27'),('2012-09-28'),('2012-09-29'),('2012-09-30'),('2012-10-01'),('2012-10-02'),('2012-10-03'),('2012-10-04'),('2012-10-05'),('2012-10-06'),('2012-10-07'),('2012-10-08'),('2012-10-09'),('2012-10-10'),('2012-10-11'),('2012-10-12'),('2012-10-13'),('2012-10-14'),('2012-10-15'),('2012-10-16'),('2012-10-17'),('2012-10-18'),('2012-10-19'),('2012-10-20'),('2012-10-21'),('2012-10-22'),('2012-10-23'),('2012-10-24'),('2012-10-25'),('2012-10-26'),('2012-10-27'),('2012-10-28'),('2012-10-29'),('2012-10-30'),('2012-10-31'),('2012-11-01'),('2012-11-02'),('2012-11-03'),('2012-11-04'),('2012-11-05'),('2012-11-06'),('2012-11-07'),('2012-11-08'),('2012-11-09'),('2012-11-10'),('2012-11-11'),('2012-11-12'),('2012-11-13'),('2012-11-14'),('2012-11-15'),('2012-11-16'),('2012-11-17'),('2012-11-18'),('2012-11-19'),('2012-11-20'),('2012-11-21'),('2012-11-22'),('2012-11-23'),('2012-11-24'),('2012-11-25'),('2012-11-26'),('2012-11-27'),('2012-11-28'),('2012-11-29'),('2012-11-30'),('2012-12-01'),('2012-12-02'),('2012-12-03'),('2012-12-04'),('2012-12-05'),('2012-12-06'),('2012-12-07'),('2012-12-08'),('2012-12-09'),('2012-12-10'),('2012-12-11'),('2012-12-12'),('2012-12-13'),('2012-12-14'),('2012-12-15'),('2012-12-16'),('2012-12-17'),('2012-12-18'),('2012-12-19'),('2012-12-20'),('2012-12-21'),('2012-12-22'),('2012-12-23'),('2012-12-24'),('2012-12-25'),('2012-12-26'),('2012-12-27'),('2012-12-28'),('2012-12-29'),('2012-12-30'),('2012-12-31'),('2013-01-01'),('2013-01-02'),('2013-01-03'),('2013-01-04'),('2013-01-05'),('2013-01-06'),('2013-01-07'),('2013-01-08'),('2013-01-09'),('2013-01-10'),('2013-01-11'),('2013-01-12'),('2013-01-13'),('2013-01-14'),('2013-01-15'),('2013-01-16'),('2013-01-17'),('2013-01-18'),('2013-01-19'),('2013-01-20'),('2013-01-21'),('2013-01-22'),('2013-01-23'),('2013-01-24'),('2013-01-25'),('2013-01-26'),('2013-01-27'),('2013-01-28'),('2013-01-29'),('2013-01-30'),('2013-01-31'),('2013-02-01'),('2013-02-02'),('2013-02-03'),('2013-02-04'),('2013-02-05'),('2013-02-06'),('2013-02-07'),('2013-02-08'),('2013-02-09'),('2013-02-10'),('2013-02-11'),('2013-02-12'),('2013-02-13'),('2013-02-14'),('2013-02-15'),('2013-02-16'),('2013-02-17'),('2013-02-18'),('2013-02-19'),('2013-02-20'),('2013-02-21'),('2013-02-22'),('2013-02-23'),('2013-02-24'),('2013-02-25'),('2013-02-26'),('2013-02-27'),('2013-02-28'),('2013-03-01'),('2013-03-02'),('2013-03-03'),('2013-03-04'),('2013-03-05'),('2013-03-06'),('2013-03-07'),('2013-03-08'),('2013-03-09'),('2013-03-10'),('2013-03-11'),('2013-03-12'),('2013-03-13'),('2013-03-14'),('2013-03-15'),('2013-03-16'),('2013-03-17'),('2013-03-18'),('2013-03-19'),('2013-03-20'),('2013-03-21'),('2013-03-22'),('2013-03-23'),('2013-03-24'),('2013-03-25'),('2013-03-26'),('2013-03-27'),('2013-03-28'),('2013-03-29'),('2013-03-30'),('2013-03-31'),('2013-04-01'),('2013-04-02'),('2013-04-03'),('2013-04-04'),('2013-04-05'),('2013-04-06'),('2013-04-07'),('2013-04-08'),('2013-04-09'),('2013-04-10'),('2013-04-11'),('2013-04-12'),('2013-04-13'),('2013-04-14'),('2013-04-15'),('2013-04-16'),('2013-04-17'),('2013-04-18'),('2013-04-19'),('2013-04-20'),('2013-04-21'),('2013-04-22'),('2013-04-23'),('2013-04-24'),('2013-04-25'),('2013-04-26'),('2013-04-27'),('2013-04-28'),('2013-04-29'),('2013-04-30'),('2013-05-01'),('2013-05-02'),('2013-05-03'),('2013-05-04'),('2013-05-05'),('2013-05-06'),('2013-05-07'),('2013-05-08'),('2013-05-09'),('2013-05-10'),('2013-05-11'),('2013-05-12'),('2013-05-13'),('2013-05-14'),('2013-05-15'),('2013-05-16'),('2013-05-17'),('2013-05-18'),('2013-05-19'),('2013-05-20'),('2013-05-21'),('2013-05-22'),('2013-05-23'),('2013-05-24'),('2013-05-25'),('2013-05-26'),('2013-05-27'),('2013-05-28'),('2013-05-29'),('2013-05-30'),('2013-05-31'),('2013-06-01'),('2013-06-02'),('2013-06-03'),('2013-06-04'),('2013-06-05'),('2013-06-06'),('2013-06-07'),('2013-06-08'),('2013-06-09'),('2013-06-10'),('2013-06-11'),('2013-06-12'),('2013-06-13'),('2013-06-14'),('2013-06-15'),('2013-06-16'),('2013-06-17'),('2013-06-18'),('2013-06-19'),('2013-06-20'),('2013-06-21'),('2013-06-22'),('2013-06-23'),('2013-06-24'),('2013-06-25'),('2013-06-26'),('2013-06-27'),('2013-06-28'),('2013-06-29'),('2013-06-30'),('2013-07-01'),('2013-07-02'),('2013-07-03'),('2013-07-04'),('2013-07-05'),('2013-07-06'),('2013-07-07'),('2013-07-08'),('2013-07-09'),('2013-07-10'),('2013-07-11'),('2013-07-12'),('2013-07-13'),('2013-07-14'),('2013-07-15'),('2013-07-16'),('2013-07-17'),('2013-07-18'),('2013-07-19'),('2013-07-20'),('2013-07-21'),('2013-07-22'),('2013-07-23'),('2013-07-24'),('2013-07-25'),('2013-07-26'),('2013-07-27'),('2013-07-28'),('2013-07-29'),('2013-07-30'),('2013-07-31'),('2013-08-01'),('2013-08-02'),('2013-08-03'),('2013-08-04'),('2013-08-05'),('2013-08-06'),('2013-08-07'),('2013-08-08'),('2013-08-09'),('2013-08-10'),('2013-08-11'),('2013-08-12'),('2013-08-13'),('2013-08-14'),('2013-08-15'),('2013-08-16'),('2013-08-17'),('2013-08-18'),('2013-08-19'),('2013-08-20'),('2013-08-21'),('2013-08-22'),('2013-08-23'),('2013-08-24'),('2013-08-25'),('2013-08-26'),('2013-08-27'),('2013-08-28'),('2013-08-29'),('2013-08-30'),('2013-08-31'),('2013-09-01'),('2013-09-02'),('2013-09-03'),('2013-09-04'),('2013-09-05'),('2013-09-06'),('2013-09-07'),('2013-09-08'),('2013-09-09'),('2013-09-10'),('2013-09-11'),('2013-09-12'),('2013-09-13'),('2013-09-14'),('2013-09-15'),('2013-09-16'),('2013-09-17'),('2013-09-18'),('2013-09-19'),('2013-09-20'),('2013-09-21'),('2013-09-22'),('2013-09-23'),('2013-09-24'),('2013-09-25'),('2013-09-26'),('2013-09-27'),('2013-09-28'),('2013-09-29'),('2013-09-30'),('2013-10-01'),('2013-10-02'),('2013-10-03'),('2013-10-04'),('2013-10-05'),('2013-10-06'),('2013-10-07'),('2013-10-08'),('2013-10-09'),('2013-10-10'),('2013-10-11'),('2013-10-12'),('2013-10-13'),('2013-10-14'),('2013-10-15'),('2013-10-16'),('2013-10-17'),('2013-10-18'),('2013-10-19'),('2013-10-20'),('2013-10-21'),('2013-10-22'),('2013-10-23'),('2013-10-24'),('2013-10-25'),('2013-10-26'),('2013-10-27'),('2013-10-28'),('2013-10-29'),('2013-10-30'),('2013-10-31'),('2013-11-01'),('2013-11-02'),('2013-11-03'),('2013-11-04'),('2013-11-05'),('2013-11-06'),('2013-11-07'),('2013-11-08'),('2013-11-09'),('2013-11-10'),('2013-11-11'),('2013-11-12'),('2013-11-13'),('2013-11-14'),('2013-11-15'),('2013-11-16'),('2013-11-17'),('2013-11-18'),('2013-11-19'),('2013-11-20'),('2013-11-21'),('2013-11-22'),('2013-11-23'),('2013-11-24'),('2013-11-25'),('2013-11-26'),('2013-11-27'),('2013-11-28'),('2013-11-29'),('2013-11-30'),('2013-12-01'),('2013-12-02'),('2013-12-03'),('2013-12-04'),('2013-12-05'),('2013-12-06'),('2013-12-07'),('2013-12-08'),('2013-12-09'),('2013-12-10'),('2013-12-11'),('2013-12-12'),('2013-12-13'),('2013-12-14'),('2013-12-15'),('2013-12-16'),('2013-12-17'),('2013-12-18'),('2013-12-19'),('2013-12-20'),('2013-12-21'),('2013-12-22'),('2013-12-23'),('2013-12-24'),('2013-12-25'),('2013-12-26'),('2013-12-27'),('2013-12-28'),('2013-12-29'),('2013-12-30'),('2013-12-31'),('2014-01-01'),('2014-01-02'),('2014-01-03'),('2014-01-04'),('2014-01-05'),('2014-01-06'),('2014-01-07'),('2014-01-08'),('2014-01-09'),('2014-01-10'),('2014-01-11'),('2014-01-12'),('2014-01-13'),('2014-01-14'),('2014-01-15'),('2014-01-16'),('2014-01-17'),('2014-01-18'),('2014-01-19'),('2014-01-20'),('2014-01-21'),('2014-01-22'),('2014-01-23'),('2014-01-24'),('2014-01-25'),('2014-01-26'),('2014-01-27'),('2014-01-28'),('2014-01-29'),('2014-01-30'),('2014-01-31'),('2014-02-01'),('2014-02-02'),('2014-02-03'),('2014-02-04'),('2014-02-05'),('2014-02-06'),('2014-02-07'),('2014-02-08'),('2014-02-09'),('2014-02-10'),('2014-02-11'),('2014-02-12'),('2014-02-13'),('2014-02-14'),('2014-02-15'),('2014-02-16'),('2014-02-17'),('2014-02-18'),('2014-02-19'),('2014-02-20'),('2014-02-21'),('2014-02-22'),('2014-02-23'),('2014-02-24'),('2014-02-25'),('2014-02-26'),('2014-02-27'),('2014-02-28'),('2014-03-01'),('2014-03-02'),('2014-03-03'),('2014-03-04'),('2014-03-05'),('2014-03-06'),('2014-03-07'),('2014-03-08'),('2014-03-09'),('2014-03-10'),('2014-03-11'),('2014-03-12'),('2014-03-13'),('2014-03-14'),('2014-03-15'),('2014-03-16'),('2014-03-17'),('2014-03-18'),('2014-03-19'),('2014-03-20'),('2014-03-21'),('2014-03-22'),('2014-03-23'),('2014-03-24'),('2014-03-25'),('2014-03-26'),('2014-03-27'),('2014-03-28'),('2014-03-29'),('2014-03-30'),('2014-03-31'),('2014-04-01'),('2014-04-02'),('2014-04-03'),('2014-04-04'),('2014-04-05'),('2014-04-06'),('2014-04-07'),('2014-04-08'),('2014-04-09'),('2014-04-10'),('2014-04-11'),('2014-04-12'),('2014-04-13'),('2014-04-14'),('2014-04-15'),('2014-04-16'),('2014-04-17'),('2014-04-18'),('2014-04-19'),('2014-04-20'),('2014-04-21'),('2014-04-22'),('2014-04-23'),('2014-04-24'),('2014-04-25'),('2014-04-26'),('2014-04-27'),('2014-04-28'),('2014-04-29'),('2014-04-30'),('2014-05-01'),('2014-05-02'),('2014-05-03'),('2014-05-04'),('2014-05-05'),('2014-05-06'),('2014-05-07'),('2014-05-08'),('2014-05-09'),('2014-05-10'),('2014-05-11'),('2014-05-12'),('2014-05-13'),('2014-05-14'),('2014-05-15'),('2014-05-16'),('2014-05-17'),('2014-05-18'),('2014-05-19'),('2014-05-20'),('2014-05-21'),('2014-05-22'),('2014-05-23'),('2014-05-24'),('2014-05-25'),('2014-05-26'),('2014-05-27'),('2014-05-28'),('2014-05-29'),('2014-05-30'),('2014-05-31'),('2014-06-01'),('2014-06-02'),('2014-06-03'),('2014-06-04'),('2014-06-05'),('2014-06-06'),('2014-06-07'),('2014-06-08'),('2014-06-09'),('2014-06-10'),('2014-06-11'),('2014-06-12'),('2014-06-13'),('2014-06-14'),('2014-06-15'),('2014-06-16'),('2014-06-17'),('2014-06-18'),('2014-06-19'),('2014-06-20'),('2014-06-21'),('2014-06-22'),('2014-06-23'),('2014-06-24'),('2014-06-25'),('2014-06-26'),('2014-06-27'),('2014-06-28'),('2014-06-29'),('2014-06-30'),('2014-07-01'),('2014-07-02'),('2014-07-03'),('2014-07-04'),('2014-07-05'),('2014-07-06'),('2014-07-07'),('2014-07-08'),('2014-07-09'),('2014-07-10'),('2014-07-11'),('2014-07-12'),('2014-07-13'),('2014-07-14'),('2014-07-15'),('2014-07-16'),('2014-07-17'),('2014-07-18'),('2014-07-19'),('2014-07-20'),('2014-07-21'),('2014-07-22'),('2014-07-23'),('2014-07-24'),('2014-07-25'),('2014-07-26'),('2014-07-27'),('2014-07-28'),('2014-07-29'),('2014-07-30'),('2014-07-31'),('2014-08-01'),('2014-08-02'),('2014-08-03'),('2014-08-04'),('2014-08-05'),('2014-08-06'),('2014-08-07'),('2014-08-08'),('2014-08-09'),('2014-08-10'),('2014-08-11'),('2014-08-12'),('2014-08-13'),('2014-08-14'),('2014-08-15'),('2014-08-16'),('2014-08-17'),('2014-08-18'),('2014-08-19'),('2014-08-20'),('2014-08-21'),('2014-08-22'),('2014-08-23'),('2014-08-24'),('2014-08-25'),('2014-08-26'),('2014-08-27'),('2014-08-28'),('2014-08-29'),('2014-08-30'),('2014-08-31'),('2014-09-01'),('2014-09-02'),('2014-09-03'),('2014-09-04'),('2014-09-05'),('2014-09-06'),('2014-09-07'),('2014-09-08'),('2014-09-09'),('2014-09-10'),('2014-09-11'),('2014-09-12'),('2014-09-13'),('2014-09-14'),('2014-09-15'),('2014-09-16'),('2014-09-17'),('2014-09-18'),('2014-09-19'),('2014-09-20'),('2014-09-21'),('2014-09-22'),('2014-09-23'),('2014-09-24'),('2014-09-25'),('2014-09-26'),('2014-09-27'),('2014-09-28'),('2014-09-29'),('2014-09-30'),('2014-10-01'),('2014-10-02'),('2014-10-03'),('2014-10-04'),('2014-10-05'),('2014-10-06'),('2014-10-07'),('2014-10-08'),('2014-10-09'),('2014-10-10'),('2014-10-11'),('2014-10-12'),('2014-10-13'),('2014-10-14'),('2014-10-15'),('2014-10-16'),('2014-10-17'),('2014-10-18'),('2014-10-19'),('2014-10-20'),('2014-10-21'),('2014-10-22'),('2014-10-23'),('2014-10-24'),('2014-10-25'),('2014-10-26'),('2014-10-27'),('2014-10-28'),('2014-10-29'),('2014-10-30'),('2014-10-31'),('2014-11-01'),('2014-11-02'),('2014-11-03'),('2014-11-04'),('2014-11-05'),('2014-11-06'),('2014-11-07'),('2014-11-08'),('2014-11-09'),('2014-11-10'),('2014-11-11'),('2014-11-12'),('2014-11-13'),('2014-11-14'),('2014-11-15'),('2014-11-16'),('2014-11-17'),('2014-11-18'),('2014-11-19'),('2014-11-20'),('2014-11-21'),('2014-11-22'),('2014-11-23'),('2014-11-24'),('2014-11-25'),('2014-11-26'),('2014-11-27'),('2014-11-28'),('2014-11-29'),('2014-11-30'),('2014-12-01'),('2014-12-02'),('2014-12-03'),('2014-12-04'),('2014-12-05'),('2014-12-06'),('2014-12-07'),('2014-12-08'),('2014-12-09'),('2014-12-10'),('2014-12-11'),('2014-12-12'),('2014-12-13'),('2014-12-14'),('2014-12-15'),('2014-12-16'),('2014-12-17'),('2014-12-18'),('2014-12-19'),('2014-12-20'),('2014-12-21'),('2014-12-22'),('2014-12-23'),('2014-12-24'),('2014-12-25'),('2014-12-26'),('2014-12-27'),('2014-12-28'),('2014-12-29'),('2014-12-30'),('2014-12-31');
/*!40000 ALTER TABLE `ztbldays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblmonths`
--

DROP TABLE IF EXISTS `ztblmonths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblmonths` (
  `MonthYear` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `YearNumber` smallint NOT NULL,
  `MonthNumber` smallint NOT NULL,
  `MonthStart` date DEFAULT NULL,
  `MonthEnd` date DEFAULT NULL,
  `January` smallint DEFAULT '0',
  `February` smallint DEFAULT '0',
  `March` smallint DEFAULT '0',
  `April` smallint DEFAULT '0',
  `May` smallint DEFAULT '0',
  `June` smallint DEFAULT '0',
  `July` smallint DEFAULT '0',
  `August` smallint DEFAULT '0',
  `September` smallint DEFAULT '0',
  `October` smallint DEFAULT '0',
  `November` smallint DEFAULT '0',
  `December` smallint DEFAULT '0',
  PRIMARY KEY (`YearNumber`,`MonthNumber`),
  UNIQUE KEY `ztblMontths_MonthEnd` (`MonthEnd`),
  UNIQUE KEY `ztblMonths_MonthStart` (`MonthStart`),
  UNIQUE KEY `ztblMonths_MonthYear` (`MonthYear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblmonths`
--

LOCK TABLES `ztblmonths` WRITE;
/*!40000 ALTER TABLE `ztblmonths` DISABLE KEYS */;
INSERT INTO `ztblmonths` VALUES ('January 2012',2012,1,'2012-01-01','2012-01-31',1,0,0,0,0,0,0,0,0,0,0,0),('February 2012',2012,2,'2012-02-01','2012-02-29',0,1,0,0,0,0,0,0,0,0,0,0),('March 2012',2012,3,'2012-03-01','2012-03-31',0,0,1,0,0,0,0,0,0,0,0,0),('April 2012',2012,4,'2012-04-01','2012-04-30',0,0,0,1,0,0,0,0,0,0,0,0),('May 2012',2012,5,'2012-05-01','2012-05-31',0,0,0,0,1,0,0,0,0,0,0,0),('June 2012',2012,6,'2012-06-01','2012-06-30',0,0,0,0,0,1,0,0,0,0,0,0),('July 2012',2012,7,'2012-07-01','2012-07-31',0,0,0,0,0,0,1,0,0,0,0,0),('August 2012',2012,8,'2012-08-01','2012-08-31',0,0,0,0,0,0,0,1,0,0,0,0),('September 2012',2012,9,'2012-09-01','2012-09-30',0,0,0,0,0,0,0,0,1,0,0,0),('October 2012',2012,10,'2012-10-01','2012-10-31',0,0,0,0,0,0,0,0,0,1,0,0),('November 2012',2012,11,'2012-11-01','2012-11-30',0,0,0,0,0,0,0,0,0,0,1,0),('December 2012',2012,12,'2012-12-01','2012-12-31',0,0,0,0,0,0,0,0,0,0,0,1),('January 2013',2013,1,'2013-01-01','2013-01-31',1,0,0,0,0,0,0,0,0,0,0,0),('February 2013',2013,2,'2013-02-01','2013-02-28',0,1,0,0,0,0,0,0,0,0,0,0),('March 2013',2013,3,'2013-03-01','2013-03-31',0,0,1,0,0,0,0,0,0,0,0,0),('April 2013',2013,4,'2013-04-01','2013-04-30',0,0,0,1,0,0,0,0,0,0,0,0),('May 2013',2013,5,'2013-05-01','2013-05-31',0,0,0,0,1,0,0,0,0,0,0,0),('June 2013',2013,6,'2013-06-01','2013-06-30',0,0,0,0,0,1,0,0,0,0,0,0),('July 2013',2013,7,'2013-07-01','2013-07-31',0,0,0,0,0,0,1,0,0,0,0,0),('August 2013',2013,8,'2013-08-01','2013-08-31',0,0,0,0,0,0,0,1,0,0,0,0),('September 2013',2013,9,'2013-09-01','2013-09-30',0,0,0,0,0,0,0,0,1,0,0,0),('October 2013',2013,10,'2013-10-01','2013-10-31',0,0,0,0,0,0,0,0,0,1,0,0),('November 2013',2013,11,'2013-11-01','2013-11-30',0,0,0,0,0,0,0,0,0,0,1,0),('December 2013',2013,12,'2013-12-01','2013-12-31',0,0,0,0,0,0,0,0,0,0,0,1),('January 2014',2014,1,'2014-01-01','2014-01-31',1,0,0,0,0,0,0,0,0,0,0,0),('February 2014',2014,2,'2014-02-01','2014-02-28',0,1,0,0,0,0,0,0,0,0,0,0),('March 2014',2014,3,'2014-03-01','2014-03-31',0,0,1,0,0,0,0,0,0,0,0,0),('April 2014',2014,4,'2014-04-01','2014-04-30',0,0,0,1,0,0,0,0,0,0,0,0),('May 2014',2014,5,'2014-05-01','2014-05-31',0,0,0,0,1,0,0,0,0,0,0,0),('June 2014',2014,6,'2014-06-01','2014-06-30',0,0,0,0,0,1,0,0,0,0,0,0),('July 2014',2014,7,'2014-07-01','2014-07-31',0,0,0,0,0,0,1,0,0,0,0,0),('August 2014',2014,8,'2014-08-01','2014-08-31',0,0,0,0,0,0,0,1,0,0,0,0),('September 2014',2014,9,'2014-09-01','2014-09-30',0,0,0,0,0,0,0,0,1,0,0,0),('October 2014',2014,10,'2014-10-01','2014-10-31',0,0,0,0,0,0,0,0,0,1,0,0),('November 2014',2014,11,'2014-11-01','2014-11-30',0,0,0,0,0,0,0,0,0,0,1,0),('December 2014',2014,12,'2014-12-01','2014-12-31',0,0,0,0,0,0,0,0,0,0,0,1);
/*!40000 ALTER TABLE `ztblmonths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblskiplabels`
--

DROP TABLE IF EXISTS `ztblskiplabels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblskiplabels` (
  `LabelCount` int NOT NULL,
  PRIMARY KEY (`LabelCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblskiplabels`
--

LOCK TABLES `ztblskiplabels` WRITE;
/*!40000 ALTER TABLE `ztblskiplabels` DISABLE KEYS */;
INSERT INTO `ztblskiplabels` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60);
/*!40000 ALTER TABLE `ztblskiplabels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblweeks`
--

DROP TABLE IF EXISTS `ztblweeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblweeks` (
  `WeekStart` date NOT NULL,
  `WeekEnd` date DEFAULT NULL,
  PRIMARY KEY (`WeekStart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblweeks`
--

LOCK TABLES `ztblweeks` WRITE;
/*!40000 ALTER TABLE `ztblweeks` DISABLE KEYS */;
INSERT INTO `ztblweeks` VALUES ('2012-01-01','2012-01-07'),('2012-01-08','2012-01-14'),('2012-01-15','2012-01-21'),('2012-01-22','2012-01-28'),('2012-01-29','2012-02-04'),('2012-02-05','2012-02-11'),('2012-02-12','2012-02-18'),('2012-02-19','2012-02-25'),('2012-02-26','2012-03-03'),('2012-03-04','2012-03-10'),('2012-03-11','2012-03-17'),('2012-03-18','2012-03-24'),('2012-03-25','2012-03-31'),('2012-04-01','2012-04-07'),('2012-04-08','2012-04-14'),('2012-04-15','2012-04-21'),('2012-04-22','2012-04-28'),('2012-04-29','2012-05-05'),('2012-05-06','2012-05-12'),('2012-05-13','2012-05-19'),('2012-05-20','2012-05-26'),('2012-05-27','2012-06-02'),('2012-06-03','2012-06-09'),('2012-06-10','2012-06-16'),('2012-06-17','2012-06-23'),('2012-06-24','2012-06-30'),('2012-07-01','2012-07-07'),('2012-07-08','2012-07-14'),('2012-07-15','2012-07-21'),('2012-07-22','2012-07-28'),('2012-07-29','2012-08-04'),('2012-08-05','2012-08-11'),('2012-08-12','2012-08-18'),('2012-08-19','2012-08-25'),('2012-08-26','2012-09-01'),('2012-09-02','2012-09-08'),('2012-09-09','2012-09-15'),('2012-09-16','2012-09-22'),('2012-09-23','2012-09-29'),('2012-09-30','2012-10-06'),('2012-10-07','2012-10-13'),('2012-10-14','2012-10-20'),('2012-10-21','2012-10-27'),('2012-10-28','2012-11-03'),('2012-11-04','2012-11-10'),('2012-11-11','2012-11-17'),('2012-11-18','2012-11-24'),('2012-11-25','2012-12-01'),('2012-12-02','2012-12-08'),('2012-12-09','2012-12-15'),('2012-12-16','2012-12-22'),('2012-12-23','2012-12-29'),('2012-12-30','2013-01-05'),('2013-01-06','2013-01-12'),('2013-01-13','2013-01-19'),('2013-01-20','2013-01-26'),('2013-01-27','2013-02-02'),('2013-02-03','2013-02-09'),('2013-02-10','2013-02-16'),('2013-02-17','2013-02-23'),('2013-02-24','2013-03-02'),('2013-03-03','2013-03-09'),('2013-03-10','2013-03-16'),('2013-03-17','2013-03-23'),('2013-03-24','2013-03-30'),('2013-03-31','2013-04-06'),('2013-04-07','2013-04-13'),('2013-04-14','2013-04-20'),('2013-04-21','2013-04-27'),('2013-04-28','2013-05-04'),('2013-05-05','2013-05-11'),('2013-05-12','2013-05-18'),('2013-05-19','2013-05-25'),('2013-05-26','2013-06-01'),('2013-06-02','2013-06-08'),('2013-06-09','2013-06-15'),('2013-06-16','2013-06-22'),('2013-06-23','2013-06-29'),('2013-06-30','2013-07-06'),('2013-07-07','2013-07-13'),('2013-07-14','2013-07-20'),('2013-07-21','2013-07-27'),('2013-07-28','2013-08-03'),('2013-08-04','2013-08-10'),('2013-08-11','2013-08-17'),('2013-08-18','2013-08-24'),('2013-08-25','2013-08-31'),('2013-09-01','2013-09-07'),('2013-09-08','2013-09-14'),('2013-09-15','2013-09-21'),('2013-09-22','2013-09-28'),('2013-09-29','2013-10-05'),('2013-10-06','2013-10-12'),('2013-10-13','2013-10-19'),('2013-10-20','2013-10-26'),('2013-10-27','2013-11-02'),('2013-11-03','2013-11-09'),('2013-11-10','2013-11-16'),('2013-11-17','2013-11-23'),('2013-11-24','2013-11-30'),('2013-12-01','2013-12-07'),('2013-12-08','2013-12-14'),('2013-12-15','2013-12-21'),('2013-12-22','2013-12-28'),('2013-12-29','2014-01-04'),('2014-01-05','2014-01-11'),('2014-01-12','2014-01-18'),('2014-01-19','2014-01-25'),('2014-01-26','2014-02-01'),('2014-02-02','2014-02-08'),('2014-02-09','2014-02-15'),('2014-02-16','2014-02-22'),('2014-02-23','2014-03-01'),('2014-03-02','2014-03-08'),('2014-03-09','2014-03-15'),('2014-03-16','2014-03-22'),('2014-03-23','2014-03-29'),('2014-03-30','2014-04-05'),('2014-04-06','2014-04-12'),('2014-04-13','2014-04-19'),('2014-04-20','2014-04-26'),('2014-04-27','2014-05-03'),('2014-05-04','2014-05-10'),('2014-05-11','2014-05-17'),('2014-05-18','2014-05-24'),('2014-05-25','2014-05-31'),('2014-06-01','2014-06-07'),('2014-06-08','2014-06-14'),('2014-06-15','2014-06-21'),('2014-06-22','2014-06-28'),('2014-06-29','2014-07-05'),('2014-07-06','2014-07-12'),('2014-07-13','2014-07-19'),('2014-07-20','2014-07-26'),('2014-07-27','2014-08-02'),('2014-08-03','2014-08-09'),('2014-08-10','2014-08-16'),('2014-08-17','2014-08-23'),('2014-08-24','2014-08-30'),('2014-08-31','2014-09-06'),('2014-09-07','2014-09-13'),('2014-09-14','2014-09-20'),('2014-09-21','2014-09-27'),('2014-09-28','2014-10-04'),('2014-10-05','2014-10-11'),('2014-10-12','2014-10-18'),('2014-10-19','2014-10-25'),('2014-10-26','2014-11-01'),('2014-11-02','2014-11-08'),('2014-11-09','2014-11-15'),('2014-11-16','2014-11-22'),('2014-11-23','2014-11-29'),('2014-11-30','2014-12-06'),('2014-12-07','2014-12-13'),('2014-12-14','2014-12-20'),('2014-12-21','2014-12-27');
/*!40000 ALTER TABLE `ztblweeks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 19:06:28
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: salesorders
-- ------------------------------------------------------
-- Server version	8.0.20
CREATE DATABASE SalesOrdersDB;
use SalesOrdersDB;
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL DEFAULT '0',
  `CategoryDescription` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Accessories'),(2,'Bikes'),(3,'Clothing'),(4,'Components'),(5,'Car racks'),(6,'Tires');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL,
  `CustFirstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustLastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustStreetAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustCity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustZipCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustAreaCode` smallint DEFAULT '0',
  `CustPhoneNumber` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `CustAreaCode` (`CustAreaCode`),
  KEY `CustZipCode` (`CustZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1001,'Suzanne','Viescas','15127 NE 24th, #383','Redmond','WA','98052',425,'555-2686'),(1002,'William','Thompson','122 Spring River Drive','Duvall','WA','98019',425,'555-2681'),(1003,'Gary','Hallmark','Route 2, Box 203B','Auburn','WA','98002',253,'555-2676'),(1004,'Robert','Brown','672 Lamont Ave','Houston','TX','77201',713,'555-2491'),(1005,'Dean','McCrae','4110 Old Redmond Rd.','Redmond','WA','98052',425,'555-2506'),(1006,'John','Viescas','15127 NE 24th, #383','Redmond','WA','98052',425,'555-2511'),(1007,'Mariya','Sergienko','901 Pine Avenue','Portland','OR','97208',503,'555-2526'),(1008,'Neil','Patterson','233 West Valley Hwy','San Diego','CA','92199',619,'555-2541'),(1009,'Andrew','Cencini','507 - 20th Ave. E.\nApt. 2A','Seattle','WA','98105',206,'555-2601'),(1010,'Angel','Kennedy','667 Red River Road','Austin','TX','78710',512,'555-2571'),(1011,'Alaina','Hallmark','Route 2, Box 203B','Woodinville','WA','98072',425,'555-2631'),(1012,'Liz','Keyser','13920 S.E. 40th Street','Bellevue','WA','98006',425,'555-2556'),(1013,'Rachel','Patterson','2114 Longview Lane','San Diego','CA','92199',619,'555-2546'),(1014,'Sam','Abolrous','611 Alpine Drive','Palm Springs','CA','92263',760,'555-2611'),(1015,'Darren','Gehring','2601 Seaview Lane','Chico','CA','95926',530,'555-2616'),(1016,'Jim','Wilson','101 NE 88th','Salem','OR','97301',503,'555-2636'),(1017,'Manuela','Seidel','66 Spring Valley Drive','Medford','OR','97501',541,'555-2641'),(1018,'David','Smith','311 20th Ave. N.E.','Fremont','CA','94538',510,'555-2646'),(1019,'Zachary','Ehrlich','12330 Kingman Drive','Glendale','CA','91209',818,'555-2721'),(1020,'Joyce','Bonnicksen','2424 Thames Drive','Bellevue','WA','98006',425,'555-2726'),(1021,'Estella','Pundt','2500 Rosales Lane','Dallas','TX','75260',972,'555-9938'),(1022,'Caleb','Viescas','4501 Wetland Road','Long Beach','CA','90809',562,'555-0037'),(1023,'Julia','Schnebly','2343 Harmony Lane','Seattle','WA','99837',206,'555-9936'),(1024,'Mark','Rosales','323 Advocate Lane','El Paso','TX','79915',915,'555-2286'),(1025,'Maria','Patterson','3445 Cheyenne Road','El Paso','TX','79915',915,'555-2291'),(1026,'Kirk','DeGrasse','455 West Palm Ave','San Antonio','TX','78284',210,'555-2311'),(1027,'Luke','Patterson','877 145th Ave SE','Portland','OR','97208',503,'555-2316'),(1028,'Jeffrey','Tirekicker','19541 104th Ave NE','Bothell','WA','98006',425,'555-9999');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL,
  `EmpFirstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmpLastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmpStreetAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmpCity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmpState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmpZipCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmpAreaCode` smallint DEFAULT '0',
  `EmpPhoneNumber` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmpBirthDate` date DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `EmpAreaCode` (`EmpAreaCode`),
  KEY `EmpZipCode` (`EmpZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (701,'Ann','Patterson','16 Maple Lane','Auburn','WA','98002',253,'555-2591','1958-03-18'),(702,'Mary','Thompson','122 Spring River Drive','Duvall','WA','98019',425,'555-2516','1990-06-21'),(703,'Matt','Berg','908 W. Capital Way','Tacoma','WA','98413',253,'555-2581','1964-11-02'),(704,'Carol','Viescas','722 Moss Bay Blvd.','Kirkland','WA','98033',425,'555-2576','1987-12-23'),(705,'Kirk','DeGrasse','455 West Palm Ave','San Antonio','TX','78284',210,'5552311','1985-10-05'),(706,'David','Viescas','16679 NE 42nd Court','Redmond','WA','98052',425,'555-2661','1968-01-01'),(707,'Kathryn','Patterson','554 E. Wilshire\nApt. 2A','Seattle','WA','98105',206,'555-2697','1982-12-12'),(708,'Susan','McLain','511 Lenora Ave','Bellevue','WA','98006',425,'555-2301','1967-10-15');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `OrderNumber` int NOT NULL DEFAULT '0',
  `ProductNumber` int NOT NULL DEFAULT '0',
  `QuotedPrice` decimal(15,2) DEFAULT '0.00',
  `QuantityOrdered` smallint DEFAULT '0',
  PRIMARY KEY (`OrderNumber`,`ProductNumber`),
  KEY `OrdersOrderDetails` (`OrderNumber`),
  KEY `ProductsOrderDetails` (`ProductNumber`),
  CONSTRAINT `Order_Details_FK00` FOREIGN KEY (`OrderNumber`) REFERENCES `orders` (`OrderNumber`),
  CONSTRAINT `Order_Details_FK01` FOREIGN KEY (`ProductNumber`) REFERENCES `products` (`ProductNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1200.00,2),(1,6,635.00,3),(1,11,1650.00,4),(1,16,28.00,1),(1,21,55.00,3),(1,26,121.25,5),(1,40,174.60,6),(2,27,24.00,4),(2,40,180.00,4),(3,1,1164.00,5),(3,6,615.95,5),(3,11,1650.00,1),(3,16,28.00,2),(3,21,55.00,3),(3,26,125.00,3),(3,31,21.34,5),(3,36,165.00,4),(4,1,1200.00,4),(4,9,33.00,3),(4,17,45.00,1),(4,25,134.83,6),(4,39,169.75,5),(5,1,1200.00,4),(5,14,135.75,5),(5,31,22.00,3),(6,2,1746.00,5),(6,7,49.00,2),(6,12,22.80,6),(6,17,43.65,5),(6,22,79.54,6),(6,27,24.00,4),(6,32,32.00,2),(7,14,139.95,3),(7,27,24.00,2),(8,16,28.00,2),(8,22,82.00,3),(8,28,29.00,4),(8,34,27.00,1),(8,40,174.60,6),(9,24,69.00,1),(10,1,1200.00,2),(10,24,69.00,3),(11,1,1200.00,1),(11,6,615.95,6),(11,11,1650.00,3),(11,16,28.00,1),(11,21,55.00,3),(11,26,125.00,1),(11,31,21.34,5),(11,36,160.05,5),(12,10,36.00,2),(13,1,1200.00,2),(13,11,1650.00,3),(13,28,29.00,1),(13,38,166.00,1),(14,1,1164.00,5),(14,14,139.95,2),(14,40,180.00,4),(15,1,1200.00,2),(15,9,33.00,3),(15,17,43.65,5),(15,29,34.00,2),(15,37,189.00,1),(16,9,33.00,1),(16,14,139.95,2),(16,19,47.00,3),(16,24,69.00,4),(16,29,34.00,3),(16,34,26.19,6),(16,39,169.75,6),(17,1,1200.00,2),(17,7,47.53,6),(17,13,65.47,5),(17,19,47.00,4),(17,25,134.83,5),(17,36,160.05,6),(18,12,22.80,6),(18,20,15.00,4),(18,28,29.00,4),(18,36,165.00,3),(19,1,1164.00,5),(19,6,635.00,2),(19,11,1650.00,4),(19,20,15.00,3),(19,25,139.00,3),(19,30,45.00,4),(19,35,37.83,6),(19,40,180.00,4),(20,1,1200.00,3),(20,37,183.33,6),(21,3,75.00,3),(21,13,65.47,6),(21,33,18.43,5),(22,1,1164.00,5),(22,7,47.53,6),(22,17,45.00,2),(22,29,34.00,1),(22,35,37.83,6),(23,1,1164.00,6),(23,6,635.00,3),(23,11,1650.00,4),(23,16,27.16,6),(23,21,55.00,3),(23,29,34.00,1),(23,34,26.19,5),(23,39,175.00,2),(24,9,33.00,2),(24,14,139.95,3),(24,19,47.00,4),(24,24,69.00,1),(24,29,34.00,2),(24,34,27.00,2),(25,1,1200.00,4),(25,11,1650.00,3),(25,17,45.00,3),(25,29,34.00,2),(25,35,37.83,5),(26,1,1164.00,5),(26,7,47.53,6),(26,13,67.50,3),(26,24,69.00,1),(26,30,45.00,2),(26,36,160.05,5),(27,1,1164.00,6),(27,7,49.00,3),(27,13,67.50,1),(27,26,121.25,5),(27,32,32.00,1),(27,38,166.00,1),(28,7,49.00,4),(28,27,23.28,6),(29,38,166.00,4),(30,1,1164.00,5),(30,9,33.00,1),(30,17,45.00,4),(30,29,34.00,4),(30,37,183.33,6),(31,16,27.16,6),(32,1,1164.00,6),(32,7,49.00,1),(32,19,45.59,5),(32,25,134.83,6),(32,31,21.34,5),(32,37,189.00,3),(33,1,1200.00,1),(33,7,47.53,6),(33,13,65.47,5),(33,19,47.00,4),(33,33,19.00,1),(33,39,175.00,2),(34,8,48.50,5),(34,28,28.13,6),(35,1,1200.00,4),(35,14,139.95,1),(35,32,31.04,5),(36,5,7.45,1),(37,8,50.00,3),(37,18,173.63,6),(37,28,29.00,1),(37,38,166.00,3),(38,39,175.00,4),(39,1,1164.00,6),(39,6,615.95,5),(39,11,1600.50,6),(39,16,28.00,2),(39,21,55.00,3),(39,26,125.00,1),(39,31,22.00,2),(39,36,165.00,1),(40,6,635.00,1),(40,19,45.59,5),(40,32,31.04,5),(41,10,36.00,4),(41,16,27.16,5),(41,22,79.54,5),(41,28,28.13,6),(41,34,26.19,6),(41,40,180.00,4),(42,1,1164.00,5),(42,9,33.00,1),(42,19,47.00,3),(42,27,24.00,1),(42,35,39.00,4),(43,1,1200.00,2),(43,6,635.00,3),(43,11,1650.00,1),(43,16,27.16,5),(43,28,28.13,6),(43,33,19.00,4),(43,38,161.02,5),(44,1,1200.00,1),(44,7,49.00,1),(44,13,67.50,1),(44,26,121.25,6),(44,32,31.04,5),(44,38,166.00,1),(45,1,1164.00,5),(45,6,635.00,2),(45,11,1600.50,6),(45,16,28.00,3),(45,25,139.00,3),(45,30,43.65,5),(45,35,39.00,3),(45,40,180.00,2),(46,35,39.00,2),(47,1,1164.00,5),(48,1,1200.00,1),(48,20,14.55,6),(48,33,18.43,6),(49,13,67.50,3),(49,19,47.00,3),(49,25,139.00,2),(49,31,22.00,3),(49,37,189.00,3),(50,5,7.45,2),(50,15,4.84,6),(50,25,139.00,2),(50,35,39.00,4),(51,1,1200.00,1),(52,30,43.65,6),(53,1,1164.00,6),(53,6,635.00,4),(53,11,1600.50,6),(53,16,28.00,2),(53,21,55.00,1),(53,34,27.00,1),(53,39,175.00,2),(54,10,36.00,2),(55,10,36.00,1),(56,6,635.00,4),(56,16,27.16,5),(56,26,125.00,3),(56,36,165.00,2),(57,1,1200.00,2),(57,14,135.75,6),(57,20,14.55,5),(57,26,121.25,5),(57,32,31.04,5),(57,38,166.00,1),(58,1,1200.00,2),(58,7,49.00,4),(58,13,67.50,3),(58,19,47.00,3),(58,31,22.00,2),(58,37,189.00,1),(59,1,1200.00,4),(59,6,635.00,4),(59,11,1650.00,4),(59,21,53.35,6),(59,26,121.25,6),(59,31,22.00,1),(59,36,165.00,3),(60,1,1200.00,1),(60,6,635.00,1),(60,11,1600.50,5),(60,16,28.00,3),(60,28,29.00,1),(60,33,19.00,1),(60,38,166.00,1),(61,1,1200.00,3),(61,9,33.00,3),(61,17,43.65,5),(61,25,139.00,3),(61,33,19.00,2),(62,7,49.00,3),(62,21,55.00,1),(62,27,24.00,4),(62,33,19.00,1),(62,39,169.75,6),(63,1,1164.00,6),(63,27,24.00,2),(64,1,1200.00,1),(64,6,615.95,5),(64,11,1650.00,2),(64,16,28.00,4),(64,21,53.35,5),(64,28,29.00,3),(64,33,19.00,4),(64,38,166.00,2),(65,1,1200.00,3),(65,11,1600.50,6),(65,21,53.35,6),(65,34,27.00,1),(66,1,1200.00,1),(66,6,635.00,4),(66,11,1600.50,6),(66,16,28.00,2),(66,21,53.35,5),(66,29,34.00,2),(66,34,27.00,4),(66,39,175.00,4),(67,10,36.00,4),(67,16,28.00,3),(67,22,82.00,4),(67,28,29.00,3),(67,34,27.00,2),(67,40,180.00,1),(68,19,45.59,6),(69,6,635.00,3),(69,16,28.00,1),(69,26,121.25,5),(69,36,165.00,3),(70,9,32.01,5),(70,22,82.00,3),(70,35,37.83,5),(71,1,1200.00,1),(71,14,139.95,4),(71,30,45.00,2),(72,16,27.16,5),(72,22,82.00,2),(72,27,23.28,6),(72,32,32.00,4),(72,37,183.33,5),(73,1,1164.00,5),(73,7,47.53,6),(73,13,67.50,3),(73,25,139.00,4),(73,31,21.34,5),(73,37,189.00,1),(74,1,1200.00,2),(74,6,635.00,4),(74,11,1600.50,5),(74,16,28.00,3),(74,21,53.35,5),(74,26,121.25,5),(74,33,19.00,2),(74,38,166.00,1),(75,1,1200.00,4),(75,9,33.00,4),(75,14,135.75,5),(75,19,47.00,1),(75,24,69.00,4),(75,29,34.00,3),(75,34,26.19,5),(75,39,175.00,3),(76,18,173.63,5),(77,1,1200.00,1),(77,7,49.00,1),(77,13,67.50,4),(77,19,47.00,1),(77,30,43.65,6),(77,36,165.00,2),(78,1,1200.00,3),(78,11,1600.50,6),(78,21,55.00,3),(78,34,26.19,5),(79,1,1164.00,6),(79,7,49.00,2),(79,13,67.50,2),(79,28,29.00,1),(79,34,27.00,3),(79,40,180.00,1),(80,1,1200.00,3),(80,6,615.95,5),(80,11,1650.00,4),(80,16,27.16,5),(80,29,32.98,6),(80,34,27.00,3),(80,39,175.00,4),(81,39,169.75,6),(82,1,1164.00,6),(82,6,635.00,4),(82,11,1650.00,1),(82,16,28.00,4),(82,21,53.35,6),(82,32,31.04,5),(82,37,183.33,6),(83,10,36.00,4),(83,36,165.00,3),(84,16,27.16,6),(84,21,55.00,3),(84,35,39.00,2),(84,40,174.60,5),(85,16,28.00,2),(85,21,53.35,6),(85,26,121.25,6),(85,31,22.00,2),(85,36,165.00,4),(86,1,1200.00,2),(86,6,615.95,6),(86,11,1650.00,1),(86,18,179.00,3),(86,28,28.13,5),(86,33,19.00,3),(86,38,161.02,5),(87,1,1164.00,5),(87,21,55.00,4),(87,34,27.00,3),(88,36,160.05,6),(89,15,4.84,6),(89,31,22.00,4),(89,39,175.00,3),(90,33,19.00,3),(91,1,1164.00,5),(91,6,635.00,2),(91,11,1650.00,4),(91,16,28.00,1),(91,26,125.00,2),(91,31,22.00,3),(91,36,160.05,5),(92,1,1200.00,3),(92,14,135.75,5),(92,32,31.04,5),(93,3,75.00,1),(94,1,1200.00,2),(94,7,49.00,3),(94,13,65.47,5),(94,26,125.00,4),(94,32,32.00,3),(94,38,166.00,4),(95,5,7.23,5),(95,11,1600.50,6),(95,17,45.00,3),(95,29,34.00,2),(95,35,39.00,3),(96,1,1200.00,4),(96,17,45.00,3),(96,27,24.00,3),(96,37,189.00,3),(97,1,1200.00,2),(97,14,139.95,1),(97,30,45.00,1),(98,1,1200.00,4),(98,33,19.00,3),(99,1,1200.00,4),(99,25,139.00,2),(100,3,75.00,3),(100,11,1650.00,2),(100,19,47.00,3),(100,27,23.28,6),(100,35,39.00,1),(101,7,47.53,6),(101,15,4.99,4),(101,31,22.00,3),(101,39,169.75,6),(102,1,1200.00,3),(102,9,33.00,4),(102,17,43.65,5),(102,25,134.83,6),(102,33,18.43,6),(103,1,1164.00,5),(103,6,635.00,4),(103,19,45.59,6),(103,24,69.00,3),(103,29,34.00,3),(103,34,27.00,3),(103,39,175.00,2),(104,1,1200.00,3),(104,37,183.33,6),(105,2,1746.00,5),(105,8,50.00,3),(105,14,139.95,1),(105,20,15.00,3),(105,26,125.00,1),(105,32,31.04,5),(106,32,32.00,4),(107,17,45.00,2),(107,22,82.00,3),(107,27,23.28,5),(107,32,32.00,1),(107,37,189.00,4),(108,31,22.00,4),(109,39,175.00,4),(110,16,27.16,6),(110,21,55.00,3),(110,26,125.00,1),(110,37,189.00,1),(111,2,1746.00,6),(111,8,50.00,4),(111,14,139.95,3),(111,20,14.55,6),(111,26,125.00,4),(111,32,32.00,4),(112,16,28.00,3),(112,36,165.00,2),(113,1,1200.00,4),(113,25,139.00,1),(113,38,161.02,5),(114,17,43.65,5),(114,30,45.00,3),(115,8,50.00,4),(115,16,28.00,3),(115,24,69.00,3),(115,32,32.00,4),(115,40,180.00,1),(116,1,1200.00,3),(116,12,23.50,2),(116,20,15.00,2),(116,28,28.13,5),(116,36,165.00,4),(117,1,1164.00,6),(117,6,635.00,4),(117,18,179.00,4),(117,28,29.00,4),(117,33,19.00,3),(117,38,166.00,1),(118,33,18.43,6),(119,1,1164.00,6),(119,6,615.95,5),(119,11,1650.00,4),(119,16,28.00,3),(119,26,121.25,5),(119,31,22.00,4),(119,36,165.00,1),(120,1,1200.00,2),(120,9,33.00,2),(120,17,43.65,5),(120,25,139.00,4),(120,38,166.00,4),(121,1,1200.00,2),(121,14,139.95,1),(121,29,32.98,6),(122,1,1200.00,3),(122,9,33.00,1),(122,17,45.00,3),(122,25,134.83,6),(122,33,19.00,3),(123,6,615.95,5),(123,12,23.50,2),(123,18,179.00,1),(123,24,66.93,6),(123,30,43.65,6),(123,36,165.00,1),(124,1,1164.00,6),(124,33,18.43,6),(125,1,1200.00,3),(125,17,45.00,2),(125,30,43.65,6),(126,9,32.01,6),(126,14,139.95,4),(126,19,47.00,1),(126,24,66.93,6),(126,29,34.00,2),(126,34,26.19,5),(126,39,169.75,6),(127,1,1164.00,6),(127,7,47.53,5),(127,13,67.50,3),(127,19,47.00,1),(127,25,139.00,3),(127,36,165.00,3),(128,21,53.35,5),(128,33,18.43,6),(129,24,69.00,1),(130,1,1164.00,5),(130,6,615.95,5),(130,13,65.47,5),(130,18,179.00,2),(130,28,29.00,1),(130,33,18.43,6),(130,38,166.00,4),(131,1,1164.00,6),(131,17,45.00,2),(131,30,45.00,2),(132,1,1200.00,2),(132,37,183.33,5),(133,9,33.00,2),(134,16,28.00,2),(134,21,53.35,6),(134,26,121.25,6),(134,31,22.00,4),(134,37,183.33,6),(135,6,615.95,5),(135,14,135.75,6),(135,22,82.00,1),(135,30,43.65,6),(135,38,166.00,1),(136,1,1200.00,3),(136,11,1600.50,5),(136,19,47.00,3),(136,27,24.00,1),(136,35,39.00,2),(137,16,28.00,3),(137,21,55.00,2),(137,26,125.00,1),(137,37,183.33,5),(138,10,36.00,4),(138,16,28.00,3),(138,22,79.54,5),(138,28,29.00,1),(138,34,27.00,4),(138,40,180.00,2),(139,32,32.00,4),(140,1,1200.00,3),(140,6,615.95,5),(140,11,1600.50,6),(140,22,82.00,2),(140,27,24.00,2),(140,32,32.00,3),(140,37,189.00,1),(141,1,1200.00,2),(141,7,49.00,3),(141,13,67.50,3),(141,19,45.59,6),(141,25,139.00,4),(141,35,39.00,3),(142,1,1200.00,3),(142,27,24.00,1),(143,17,45.00,2),(143,30,45.00,2),(144,1,1164.00,6),(144,14,135.75,6),(144,27,24.00,2),(145,1,1200.00,3),(145,36,165.00,4),(146,18,179.00,2),(147,1,1200.00,2),(147,14,135.75,5),(147,37,183.33,6),(148,1,1200.00,1),(148,6,615.95,5),(148,11,1650.00,2),(148,16,27.16,5),(148,21,55.00,4),(148,26,125.00,1),(148,31,22.00,1),(148,36,165.00,4),(149,1,1200.00,4),(149,38,166.00,3),(150,1,1164.00,6),(150,11,1650.00,2),(150,21,53.35,5),(150,31,22.00,1),(151,24,69.00,4),(152,2,1800.00,3),(152,7,49.00,1),(152,12,23.50,4),(152,17,45.00,4),(152,22,82.00,2),(152,27,23.28,5),(152,32,32.00,2),(153,7,49.00,1),(153,13,67.50,2),(153,19,47.00,3),(153,34,26.19,5),(153,40,174.60,5),(154,14,139.95,4),(154,36,160.05,5),(155,10,36.00,4),(155,20,15.00,3),(155,30,45.00,3),(155,40,180.00,4),(156,1,1164.00,6),(156,6,635.00,1),(156,19,47.00,4),(156,24,69.00,3),(156,29,34.00,1),(156,34,27.00,4),(156,39,169.75,5),(157,1,1164.00,6),(157,11,1600.50,6),(157,21,53.35,6),(157,33,19.00,1),(158,21,53.35,6),(159,10,34.92,5),(159,20,15.00,2),(159,30,45.00,4),(159,40,180.00,4),(160,1,1200.00,1),(160,6,635.00,1),(160,11,1600.50,5),(160,16,28.00,1),(160,21,55.00,2),(160,26,121.25,6),(160,31,22.00,3),(160,36,160.05,5),(161,1,1200.00,2),(161,16,28.00,1),(161,36,165.00,4),(162,11,1600.50,5),(162,31,22.00,1),(163,1,1164.00,6),(163,7,49.00,4),(163,13,65.47,5),(163,26,125.00,4),(163,32,31.04,6),(163,38,166.00,1),(164,1,1164.00,6),(164,24,66.93,5),(165,1,1164.00,6),(165,6,615.95,5),(165,11,1600.50,6),(165,20,14.55,6),(165,25,139.00,4),(165,30,45.00,2),(165,35,37.83,6),(165,40,174.60,6),(166,7,49.00,3),(166,13,67.50,4),(166,19,45.59,6),(166,25,134.83,5),(166,40,180.00,3),(167,1,1164.00,5),(167,9,32.01,6),(167,21,55.00,2),(167,29,32.98,5),(167,37,183.33,6),(168,1,1200.00,1),(168,7,49.00,4),(168,13,67.50,1),(168,19,47.00,2),(168,29,34.00,4),(168,35,37.83,5),(169,9,33.00,1),(169,14,139.95,4),(169,19,45.59,6),(169,24,69.00,2),(169,29,32.98,6),(169,34,26.19,5),(169,39,169.75,5),(170,1,1200.00,3),(170,7,47.53,5),(170,13,67.50,2),(170,26,125.00,4),(170,32,32.00,1),(170,38,161.02,5),(171,38,166.00,4),(172,1,1200.00,2),(172,11,1650.00,2),(172,21,55.00,2),(172,34,27.00,3),(173,22,82.00,3),(173,35,37.83,6),(174,1,1164.00,6),(174,36,165.00,1),(175,1,1164.00,5),(175,6,615.95,6),(175,11,1650.00,3),(175,16,27.16,6),(175,21,55.00,4),(175,26,125.00,4),(175,31,22.00,3),(175,36,165.00,3),(176,7,47.53,5),(176,17,43.65,6),(176,27,24.00,3),(176,37,183.33,6),(177,1,1200.00,4),(177,9,33.00,2),(177,17,45.00,2),(177,25,139.00,1),(177,36,165.00,4),(178,16,28.00,1),(178,21,55.00,1),(178,31,22.00,2),(178,36,160.05,5),(179,1,1164.00,5),(179,6,635.00,2),(179,11,1650.00,1),(179,17,43.65,5),(179,22,79.54,6),(179,27,24.00,1),(179,32,31.04,6),(179,37,183.33,6),(180,21,55.00,4),(180,40,180.00,3),(181,1,1200.00,3),(181,11,1650.00,1),(181,24,66.93,6),(181,34,27.00,4),(182,1,1164.00,6),(182,6,615.95,5),(182,18,179.00,4),(182,28,29.00,2),(182,33,19.00,2),(182,38,166.00,4),(183,1,1200.00,2),(183,7,47.53,5),(183,12,22.80,5),(183,17,43.65,5),(183,22,82.00,4),(183,27,23.28,5),(183,32,31.04,6),(183,37,183.33,5),(184,1,1200.00,3),(184,6,635.00,2),(184,11,1600.50,5),(184,16,28.00,3),(184,21,53.35,6),(184,30,43.65,6),(184,35,39.00,4),(184,40,180.00,4),(185,1,1200.00,4),(185,18,179.00,2),(185,28,29.00,4),(185,38,166.00,4),(186,5,7.23,6),(186,25,139.00,2),(187,22,79.54,5),(187,35,37.83,6),(188,1,1164.00,6),(188,37,189.00,2),(189,5,7.23,5),(189,15,4.99,4),(189,25,134.83,5),(189,35,39.00,2),(190,29,32.98,6),(191,8,48.50,5),(191,13,65.47,5),(191,18,179.00,1),(191,28,29.00,1),(191,33,18.43,6),(191,38,166.00,4),(192,17,43.65,6),(192,22,79.54,6),(192,32,32.00,4),(192,37,189.00,2),(193,1,1200.00,2),(193,6,615.95,5),(193,20,15.00,4),(193,25,139.00,1),(193,30,45.00,2),(193,35,37.83,5),(193,40,180.00,1),(194,1,1200.00,3),(194,14,135.75,5),(194,31,21.34,6),(195,39,175.00,4),(196,1,1200.00,1),(196,7,49.00,4),(196,13,67.50,3),(196,19,47.00,3),(196,25,134.83,6),(196,40,174.60,5),(197,18,179.00,1),(199,9,33.00,4),(199,15,4.84,5),(199,21,55.00,1),(199,27,24.00,3),(199,33,19.00,1),(199,39,175.00,4),(200,1,1164.00,5),(200,7,47.53,5),(200,13,67.50,3),(200,24,66.93,6),(200,30,45.00,2),(200,36,160.05,5),(201,5,7.23,6),(202,39,175.00,3),(203,1,1200.00,2),(203,6,635.00,4),(203,16,28.00,3),(203,21,53.35,5),(203,31,21.34,5),(203,36,165.00,4),(204,24,66.93,5),(205,1,1164.00,6),(205,6,635.00,3),(205,11,1600.50,5),(205,16,28.00,2),(205,21,55.00,3),(205,34,26.19,6),(205,39,175.00,3),(206,1,1200.00,3),(206,14,139.95,4),(206,31,22.00,4),(207,14,139.95,4),(207,31,22.00,4),(208,9,32.01,5),(208,14,139.95,4),(208,19,47.00,2),(208,24,69.00,1),(208,29,32.98,5),(208,34,27.00,3),(208,39,175.00,4),(209,13,67.50,4),(209,33,19.00,1),(210,1,1164.00,5),(210,6,635.00,3),(210,11,1650.00,2),(210,24,66.93,6),(210,29,34.00,3),(210,34,26.19,5),(210,39,169.75,5),(211,6,615.95,5),(212,3,75.00,2),(213,16,27.16,6),(213,36,165.00,2),(214,13,65.47,6),(214,26,121.25,6),(214,39,175.00,2),(215,1,1200.00,3),(215,6,635.00,2),(215,18,179.00,3),(215,28,29.00,4),(215,33,18.43,6),(215,38,166.00,4),(217,1,1164.00,6),(217,11,1650.00,1),(217,30,45.00,4),(217,40,174.60,5),(218,1,1164.00,5),(218,7,49.00,3),(218,13,65.47,6),(218,19,47.00,4),(218,33,18.43,6),(218,39,175.00,3),(219,1,1200.00,1),(219,7,49.00,4),(219,13,67.50,4),(219,19,45.59,6),(219,25,139.00,4),(219,38,161.02,5),(220,1,1200.00,2),(220,6,635.00,1),(220,11,1600.50,6),(220,22,82.00,2),(220,27,23.28,6),(220,32,32.00,3),(220,37,183.33,6),(221,6,635.00,1),(221,14,139.95,3),(221,22,79.54,6),(221,30,45.00,3),(221,38,161.02,6),(222,1,1200.00,3),(222,11,1650.00,3),(222,24,69.00,1),(222,34,26.19,5),(223,1,1164.00,6),(223,11,1600.50,6),(223,29,34.00,2),(223,39,175.00,2),(224,1,1164.00,5),(224,9,32.01,6),(224,20,15.00,3),(224,28,29.00,2),(224,36,165.00,4),(225,1,1200.00,3),(225,7,47.53,6),(225,13,65.47,6),(225,26,125.00,3),(225,32,31.04,5),(225,38,166.00,2),(226,20,15.00,4),(226,30,45.00,2),(226,40,180.00,2),(227,1,1200.00,2),(227,6,615.95,5),(227,11,1650.00,2),(227,16,27.16,5),(227,25,134.83,5),(227,30,43.65,6),(227,35,37.83,6),(227,40,174.60,6),(228,17,45.00,1),(229,6,615.95,5),(229,26,121.25,5),(230,26,121.25,6),(231,8,50.00,4),(231,13,67.50,2),(231,18,179.00,2),(231,28,28.13,6),(231,33,19.00,1),(231,38,166.00,4),(232,7,49.00,1),(232,13,67.50,3),(232,19,47.00,1),(232,25,139.00,3),(232,31,22.00,2),(232,37,183.33,5),(233,1,1200.00,3),(233,24,66.93,6),(234,10,36.00,2),(234,36,165.00,2),(235,9,33.00,1),(235,17,45.00,4),(235,25,139.00,2),(235,38,166.00,1),(236,5,7.45,4),(236,10,34.92,6),(236,15,4.99,4),(236,20,15.00,3),(236,25,134.83,5),(236,30,43.65,6),(236,35,39.00,2),(236,40,180.00,2),(237,2,1800.00,2),(237,7,47.53,5),(237,12,22.80,6),(237,17,45.00,3),(237,22,82.00,4),(237,27,23.28,6),(237,32,31.04,5),(238,1,1200.00,3),(238,24,69.00,2),(238,37,183.33,5),(239,1,1200.00,3),(239,6,615.95,5),(239,11,1650.00,2),(239,16,28.00,3),(239,21,53.35,5),(239,35,37.83,5),(239,40,180.00,4),(240,5,7.23,6),(240,18,173.63,6),(240,31,22.00,3),(241,14,139.95,2),(241,27,24.00,4),(241,40,180.00,3),(242,1,1200.00,3),(242,6,635.00,1),(242,11,1650.00,3),(242,16,28.00,2),(242,21,55.00,3),(242,26,121.25,5),(242,31,21.34,5),(242,36,165.00,4),(243,1,1200.00,3),(243,6,635.00,4),(243,16,28.00,4),(243,21,55.00,3),(243,26,125.00,1),(243,31,22.00,1),(243,36,165.00,1),(244,11,1600.50,6),(245,10,34.92,6),(245,18,179.00,4),(245,26,121.25,5),(245,34,27.00,4),(246,1,1164.00,5),(246,15,4.99,1),(246,21,55.00,3),(246,27,24.00,2),(246,33,18.43,5),(246,39,175.00,2),(247,1,1200.00,2),(247,9,33.00,1),(247,17,43.65,6),(247,25,139.00,2),(247,33,19.00,2),(248,1,1200.00,4),(248,7,49.00,4),(248,19,47.00,4),(248,25,139.00,1),(248,31,22.00,4),(248,37,189.00,3),(249,1,1164.00,5),(249,7,47.53,5),(249,13,67.50,3),(249,19,47.00,1),(249,25,134.83,5),(249,38,166.00,2),(250,1,1200.00,1),(250,14,139.95,4),(250,34,27.00,4),(251,6,635.00,1),(251,11,1600.50,5),(251,16,28.00,3),(251,21,53.35,6),(251,26,121.25,6),(251,31,21.34,5),(251,36,165.00,2),(252,1,1200.00,3),(252,9,33.00,3),(252,14,139.95,1),(252,19,47.00,4),(252,24,69.00,3),(252,29,34.00,2),(252,34,27.00,1),(252,39,175.00,3),(253,1,1164.00,6),(253,27,24.00,2),(254,13,67.50,4),(254,26,125.00,3),(254,39,169.75,5),(255,16,28.00,1),(256,1,1200.00,4),(256,6,615.95,5),(256,11,1600.50,6),(256,16,28.00,2),(256,24,69.00,2),(256,29,34.00,3),(256,34,27.00,3),(256,39,175.00,3),(257,1,1164.00,6),(257,13,67.50,3),(257,19,45.59,5),(257,25,139.00,3),(257,31,22.00,3),(257,37,189.00,2),(258,1,1200.00,1),(258,6,635.00,1),(258,11,1600.50,6),(258,16,28.00,1),(258,24,66.93,5),(258,29,34.00,3),(258,34,27.00,1),(258,39,175.00,2),(259,36,160.05,6),(260,1,1200.00,3),(260,9,33.00,4),(260,17,45.00,3),(260,25,134.83,5),(260,39,175.00,1),(261,1,1200.00,1),(261,15,4.99,1),(261,28,29.00,3),(262,16,27.16,6),(263,1,1164.00,5),(263,11,1600.50,6),(263,21,53.35,6),(263,33,19.00,2),(264,21,53.35,5),(265,2,1800.00,4),(265,7,47.53,6),(265,12,23.50,2),(265,17,45.00,1),(265,22,82.00,4),(265,27,23.28,5),(265,32,32.00,2),(265,37,189.00,3),(266,1,1164.00,6),(266,9,33.00,4),(266,17,45.00,2),(266,25,139.00,2),(266,36,165.00,2),(267,1,1200.00,3),(267,25,139.00,2),(267,38,166.00,3),(268,1,1164.00,6),(268,6,615.95,6),(268,11,1650.00,2),(268,16,27.16,6),(268,21,55.00,4),(268,26,125.00,1),(268,32,32.00,4),(268,37,183.33,6),(269,1,1200.00,2),(269,6,635.00,1),(269,13,67.50,3),(269,18,179.00,1),(269,28,29.00,3),(269,33,19.00,4),(269,38,166.00,4),(270,1,1200.00,1),(270,15,4.99,2),(270,31,22.00,1),(270,39,175.00,1),(271,1,1200.00,2),(271,9,32.01,6),(271,19,45.59,6),(271,27,23.28,5),(271,35,39.00,1),(272,1,1164.00,6),(272,16,28.00,4),(272,26,125.00,2),(272,36,160.05,6),(273,1,1200.00,4),(273,9,33.00,1),(273,17,43.65,6),(273,30,43.65,5),(273,38,166.00,3),(274,18,179.00,3),(275,5,7.45,2),(276,1,1200.00,4),(276,11,1600.50,6),(276,19,47.00,4),(276,27,24.00,4),(276,35,39.00,3),(277,12,23.50,1),(277,20,14.55,6),(277,28,29.00,2),(277,36,165.00,1),(278,1,1200.00,1),(278,24,69.00,3),(278,37,183.33,6),(279,1,1200.00,2),(279,11,1650.00,3),(279,21,53.35,5),(279,39,169.75,6),(280,1,1200.00,4),(280,14,139.95,2),(280,40,174.60,6),(281,1,1164.00,6),(281,6,635.00,1),(281,11,1650.00,3),(281,16,28.00,3),(281,21,53.35,5),(281,33,19.00,2),(281,38,166.00,4),(282,1,1200.00,2),(282,14,135.75,5),(282,32,32.00,2),(283,19,47.00,1),(283,39,169.75,5),(284,1,1164.00,5),(284,6,635.00,4),(284,11,1650.00,3),(284,16,28.00,4),(284,21,55.00,1),(284,27,23.28,6),(284,32,32.00,1),(284,37,189.00,1),(285,1,1200.00,1),(285,17,45.00,1),(285,27,24.00,1),(285,37,189.00,3),(286,1,1164.00,5),(286,29,34.00,4),(287,9,33.00,1),(287,29,32.98,5),(288,8,48.50,5),(288,28,28.13,5),(289,9,32.01,5),(289,19,47.00,1),(289,29,34.00,2),(289,39,169.75,5),(290,1,1200.00,2),(290,17,45.00,4),(290,30,45.00,1),(291,1,1200.00,4),(291,14,139.95,2),(291,30,43.65,6),(292,1,1200.00,2),(292,7,49.00,1),(292,13,67.50,1),(292,19,47.00,1),(292,25,139.00,1),(292,35,39.00,4),(293,1,1200.00,2),(293,7,47.53,5),(293,13,65.47,5),(293,19,47.00,4),(293,25,134.83,5),(293,36,160.05,6),(294,1,1200.00,3),(294,15,4.84,6),(294,20,15.00,4),(294,25,139.00,2),(294,30,45.00,3),(294,35,37.83,5),(294,40,174.60,6),(295,1,1164.00,5),(295,9,33.00,2),(295,17,43.65,6),(295,25,134.83,6),(295,34,27.00,1),(296,1,1200.00,2),(296,34,27.00,2),(297,6,635.00,2),(297,26,121.25,5),(298,1,1164.00,6),(298,26,125.00,4),(299,19,45.59,5),(299,39,175.00,1),(300,1,1164.00,6),(300,6,635.00,1),(300,11,1600.50,5),(300,30,45.00,2),(300,35,39.00,2),(300,40,180.00,1),(301,1,1200.00,2),(301,14,135.75,5),(301,40,180.00,4),(302,1,1200.00,4),(302,14,139.95,2),(302,36,160.05,5),(303,8,48.50,5),(303,13,67.50,3),(303,18,179.00,4),(303,28,29.00,1),(303,33,18.43,6),(303,38,161.02,5),(304,16,27.16,5),(304,21,55.00,3),(304,27,24.00,1),(304,32,32.00,1),(304,37,189.00,3),(306,1,1200.00,4),(306,20,15.00,2),(306,33,18.43,6),(307,1,1200.00,4),(307,7,49.00,2),(307,13,67.50,2),(307,19,47.00,1),(307,30,45.00,1),(307,36,165.00,4),(308,1,1200.00,4),(308,19,47.00,2),(308,29,32.98,6),(308,39,175.00,2),(309,5,7.23,5),(309,13,67.50,2),(309,21,53.35,5),(309,29,34.00,3),(309,37,189.00,4),(310,1,1200.00,2),(310,6,635.00,3),(310,11,1600.50,5),(310,24,69.00,2),(310,29,32.98,5),(310,34,27.00,3),(310,39,169.75,6),(311,16,28.00,2),(311,26,125.00,2),(311,31,21.34,5),(311,36,165.00,4),(312,15,4.99,4),(312,21,55.00,3),(312,27,24.00,1),(312,33,18.43,6),(312,39,175.00,4),(313,1,1164.00,5),(313,15,4.84,6),(313,31,22.00,4),(313,39,175.00,1),(314,20,14.55,5),(314,40,180.00,2),(315,1,1164.00,6),(315,7,49.00,1),(315,13,67.50,4),(315,25,134.83,5),(315,31,22.00,3),(315,37,189.00,4),(316,38,161.02,6),(317,1,1200.00,2),(317,13,65.47,6),(317,21,53.35,5),(317,29,32.98,5),(317,37,183.33,5),(318,6,615.95,6),(319,1,1200.00,2),(319,38,166.00,4),(320,21,55.00,4),(321,1,1164.00,5),(321,7,47.53,5),(321,13,67.50,1),(321,24,69.00,1),(321,30,45.00,3),(321,36,165.00,3),(322,36,165.00,4),(323,1,1200.00,4),(323,12,23.50,4),(323,17,43.65,5),(323,22,82.00,2),(323,27,24.00,2),(323,32,32.00,2),(323,37,189.00,1),(324,8,50.00,1),(325,1,1200.00,3),(325,6,635.00,3),(325,12,23.50,1),(325,17,43.65,5),(325,22,82.00,2),(325,27,23.28,5),(325,32,31.04,6),(325,37,189.00,3),(326,8,48.50,5),(327,1,1200.00,2),(327,9,32.01,5),(327,17,45.00,3),(327,25,139.00,1),(327,34,27.00,4),(328,36,160.05,6),(329,1,1200.00,3),(329,6,615.95,6),(329,11,1650.00,2),(329,16,27.16,5),(329,21,55.00,2),(329,26,125.00,2),(329,31,21.34,6),(329,36,165.00,1),(330,7,47.53,5),(330,17,43.65,6),(330,27,24.00,3),(330,37,189.00,2),(331,1,1164.00,6),(331,6,635.00,2),(331,11,1650.00,1),(331,20,14.55,5),(331,25,134.83,6),(331,30,45.00,1),(331,35,37.83,6),(331,40,174.60,6),(332,1,1200.00,1),(332,11,1650.00,2),(332,21,55.00,3),(332,38,166.00,1),(333,7,49.00,3),(333,13,65.47,5),(333,19,45.59,5),(333,32,31.04,6),(333,38,161.02,6),(334,1,1200.00,2),(334,7,47.53,6),(334,13,67.50,2),(334,24,66.93,5),(334,30,43.65,5),(334,36,160.05,5),(335,1,1200.00,2),(335,11,1600.50,6),(335,29,34.00,1),(335,39,169.75,6),(336,1,1200.00,1),(336,6,615.95,5),(336,11,1600.50,6),(336,16,28.00,4),(336,21,55.00,4),(336,26,125.00,1),(336,31,22.00,2),(336,38,166.00,4),(337,1,1200.00,2),(337,19,45.59,5),(337,29,32.98,5),(337,39,175.00,2),(338,1,1164.00,6),(338,9,33.00,2),(338,17,43.65,5),(338,32,32.00,1),(338,40,174.60,5),(339,1,1200.00,4),(339,6,635.00,2),(339,11,1600.50,5),(339,16,28.00,3),(339,26,125.00,1),(339,31,22.00,3),(339,36,165.00,3),(340,1,1200.00,3),(340,14,139.95,2),(340,28,28.13,5),(341,34,27.00,3),(342,1,1200.00,3),(342,14,135.75,6),(342,39,175.00,1),(343,1,1164.00,6),(343,14,135.75,6),(343,39,175.00,3),(344,5,7.23,6),(344,11,1650.00,4),(344,17,45.00,3),(344,29,32.98,5),(344,35,39.00,3),(345,1,1200.00,4),(345,9,33.00,1),(345,17,45.00,2),(345,25,139.00,4),(345,36,165.00,2),(346,16,28.00,4),(346,21,55.00,3),(346,26,125.00,3),(346,31,21.34,5),(346,36,165.00,3),(347,11,1650.00,4),(347,24,69.00,4),(347,37,189.00,2),(348,7,49.00,2),(348,13,65.47,6),(348,19,45.59,5),(348,30,45.00,1),(348,36,160.05,6),(349,14,139.95,4),(349,38,166.00,1),(350,6,615.95,5),(351,1,1164.00,6),(351,13,65.47,6),(351,19,45.59,6),(351,25,139.00,3),(351,31,21.34,5),(351,37,189.00,1),(352,9,32.01,5),(352,22,82.00,3),(352,35,39.00,3),(353,1,1200.00,1),(353,6,615.95,6),(353,11,1600.50,6),(353,16,28.00,4),(353,21,55.00,2),(353,26,125.00,4),(353,35,37.83,6),(353,40,180.00,4),(354,1,1200.00,3),(354,7,49.00,2),(354,13,65.47,5),(354,19,47.00,3),(354,32,32.00,1),(354,38,161.02,5),(355,1,1164.00,6),(355,12,22.80,5),(355,20,15.00,2),(355,28,29.00,3),(355,36,165.00,3),(356,2,1800.00,1),(356,12,23.50,2),(356,22,82.00,3),(356,32,32.00,3),(357,7,47.53,5),(357,12,22.80,5),(357,17,45.00,2),(357,22,82.00,4),(357,27,24.00,2),(357,32,31.04,5),(357,37,189.00,2),(358,1,1200.00,4),(358,6,615.95,6),(358,11,1650.00,1),(358,16,28.00,3),(358,21,55.00,3),(358,26,125.00,2),(358,33,19.00,1),(358,38,161.02,5),(359,1,1164.00,5),(359,6,615.95,5),(359,11,1600.50,5),(359,16,27.16,5),(359,30,43.65,5),(359,35,39.00,4),(359,40,180.00,2),(360,1,1200.00,3),(360,6,615.95,5),(360,11,1600.50,6),(360,16,28.00,3),(360,21,53.35,6),(360,26,125.00,2),(360,37,189.00,4),(362,1,1200.00,2),(362,6,635.00,4),(362,11,1600.50,6),(362,16,28.00,3),(362,21,53.35,6),(362,26,121.25,6),(362,37,189.00,3),(363,1,1200.00,3),(363,6,615.95,5),(363,11,1650.00,2),(363,16,28.00,1),(363,21,55.00,3),(363,26,125.00,1),(363,34,27.00,1),(363,39,169.75,5),(364,3,75.00,3),(364,13,67.50,4),(364,33,19.00,4),(365,20,14.55,6),(365,40,180.00,1),(366,1,1164.00,6),(366,6,635.00,1),(366,16,27.16,6),(366,21,53.35,6),(366,26,121.25,5),(366,31,22.00,4),(366,36,165.00,2),(367,1,1200.00,2),(367,6,635.00,3),(367,11,1600.50,5),(367,16,28.00,1),(367,21,53.35,6),(367,37,189.00,3),(368,1,1200.00,4),(368,22,79.54,6),(369,34,27.00,4),(370,1,1200.00,2),(370,9,33.00,2),(370,17,45.00,4),(370,28,28.13,5),(370,36,165.00,1),(371,9,32.01,6),(371,22,79.54,5),(371,35,37.83,6),(372,1,1164.00,6),(372,8,48.50,5),(372,13,65.47,5),(372,18,173.63,6),(372,28,29.00,3),(372,33,18.43,6),(372,38,166.00,2),(373,1,1200.00,1),(373,6,635.00,1),(373,11,1650.00,4),(373,16,28.00,4),(373,21,55.00,3),(373,26,121.25,6),(373,31,22.00,3),(373,36,165.00,2),(374,1,1164.00,5),(374,12,23.50,4),(374,22,82.00,4),(374,32,31.04,6),(375,2,1800.00,2),(375,8,50.00,4),(375,14,139.95,2),(375,20,15.00,4),(375,26,125.00,1),(375,32,32.00,4),(376,16,28.00,4),(376,21,55.00,1),(376,26,121.25,5),(376,32,31.04,6),(376,37,189.00,4),(377,8,50.00,4),(377,14,139.95,4),(377,20,14.55,6),(377,26,121.25,6),(377,32,31.04,5),(377,38,166.00,3),(378,1,1164.00,5),(378,6,635.00,2),(378,13,67.50,4),(378,18,173.63,5),(378,28,29.00,2),(378,33,18.43,6),(378,38,166.00,1),(379,1,1200.00,3),(379,11,1650.00,4),(379,30,43.65,6),(379,40,174.60,6),(380,24,69.00,3),(381,1,1200.00,3),(381,6,635.00,1),(381,17,45.00,2),(381,22,79.54,6),(381,27,24.00,2),(381,32,32.00,1),(381,37,189.00,3),(382,14,139.95,4),(383,1,1200.00,4),(383,6,615.95,5),(383,11,1650.00,2),(383,16,28.00,1),(383,21,55.00,4),(383,30,45.00,3),(383,35,39.00,3),(383,40,180.00,2),(384,1,1200.00,2),(384,39,169.75,5),(385,1,1200.00,2),(385,6,615.95,6),(385,11,1650.00,4),(385,16,28.00,4),(385,21,55.00,3),(385,26,125.00,1),(385,32,31.04,6),(385,37,189.00,3),(386,1,1164.00,6),(386,9,33.00,3),(386,17,43.65,6),(386,25,134.83,6),(386,33,19.00,3),(387,1,1200.00,4),(387,6,635.00,4),(387,11,1600.50,5),(387,16,28.00,2),(387,21,55.00,2),(387,26,125.00,3),(387,31,22.00,2),(387,36,165.00,4),(388,1,1200.00,3),(388,9,33.00,3),(388,17,45.00,2),(388,25,134.83,6),(388,33,19.00,3),(389,7,49.00,4),(389,17,43.65,5),(389,27,23.28,5),(389,37,183.33,5),(390,1,1200.00,2),(390,6,635.00,3),(390,11,1600.50,5),(390,16,28.00,2),(390,21,55.00,4),(390,26,125.00,2),(390,34,27.00,4),(390,39,175.00,4),(391,6,615.95,6),(391,12,23.50,2),(391,18,179.00,1),(391,24,66.93,5),(391,30,43.65,6),(391,36,160.05,6),(392,1,1200.00,4),(392,11,1650.00,2),(392,27,23.28,6),(392,37,183.33,5),(393,1,1200.00,3),(393,28,29.00,3),(394,15,4.99,3),(394,28,29.00,4),(395,6,615.95,5),(396,5,7.45,4),(396,15,4.99,2),(396,25,139.00,3),(396,35,39.00,1),(397,26,125.00,4),(398,1,1164.00,5),(398,6,635.00,4),(398,11,1650.00,3),(398,16,28.00,3),(398,21,55.00,1),(398,26,125.00,2),(398,31,22.00,2),(398,40,180.00,3),(399,1,1164.00,6),(399,6,615.95,6),(399,11,1650.00,4),(399,16,28.00,2),(399,21,55.00,2),(399,26,121.25,5),(399,31,22.00,2),(399,36,165.00,1),(400,1,1164.00,5),(400,7,49.00,4),(400,13,67.50,3),(400,19,47.00,4),(400,30,45.00,1),(400,36,160.05,5),(401,16,27.16,5),(401,21,55.00,1),(401,33,19.00,1),(401,38,161.02,5),(402,1,1200.00,2),(402,9,33.00,2),(402,17,45.00,2),(402,29,34.00,1),(402,37,189.00,1),(403,1,1164.00,6),(403,6,635.00,3),(403,11,1600.50,6),(403,16,28.00,1),(403,21,55.00,3),(403,30,43.65,6),(403,35,37.83,5),(403,40,180.00,3),(404,2,1746.00,5),(405,1,1164.00,5),(405,17,45.00,4),(405,27,24.00,3),(405,37,183.33,5),(406,1,1164.00,5),(406,9,33.00,2),(406,22,79.54,5),(406,30,43.65,6),(406,38,166.00,4),(407,7,49.00,1),(407,27,23.28,6),(408,30,43.65,6),(409,1,1164.00,5),(409,21,55.00,1),(409,34,27.00,3),(410,6,635.00,4),(410,19,47.00,2),(410,32,32.00,2),(411,1,1164.00,6),(412,10,36.00,4),(412,16,27.16,5),(412,22,82.00,1),(412,28,28.13,6),(412,34,27.00,4),(412,40,180.00,3),(413,22,82.00,3),(413,35,39.00,4),(414,1,1200.00,4),(414,6,615.95,5),(414,11,1650.00,4),(414,20,14.55,5),(414,25,134.83,5),(414,30,45.00,2),(414,35,39.00,4),(414,40,174.60,5),(415,1,1200.00,3),(415,24,66.93,5),(415,37,183.33,5),(416,1,1200.00,3),(416,7,49.00,4),(416,13,67.50,3),(416,19,45.59,5),(416,29,32.98,5),(416,35,37.83,6),(417,38,166.00,1),(418,1,1200.00,1),(418,14,135.75,6),(418,24,66.93,6),(418,34,27.00,1),(419,11,1600.50,5),(420,1,1200.00,2),(420,14,139.95,2),(420,22,79.54,5),(420,30,43.65,6),(420,38,166.00,1),(421,21,53.35,5),(421,39,175.00,1),(422,1,1164.00,5),(422,34,27.00,3),(423,1,1200.00,1),(423,7,49.00,1),(423,13,65.47,6),(423,19,47.00,1),(423,32,31.04,5),(423,38,166.00,1),(424,35,39.00,1),(425,17,45.00,3),(425,29,34.00,1),(425,35,39.00,3),(426,14,139.95,2),(426,22,82.00,2),(426,30,45.00,1),(426,38,161.02,5),(427,5,7.45,4),(427,18,179.00,4),(427,31,22.00,1),(428,1,1200.00,1),(428,15,4.84,5),(428,20,15.00,1),(428,25,139.00,3),(428,30,45.00,3),(428,35,37.83,5),(428,40,180.00,2),(429,37,189.00,3),(430,29,34.00,3),(431,1,1200.00,1),(431,7,49.00,3),(431,13,67.50,1),(431,27,24.00,1),(431,33,19.00,3),(431,39,169.75,5),(432,16,28.00,3),(432,33,19.00,2),(432,38,161.02,6),(433,1,1164.00,6),(433,6,635.00,3),(433,16,28.00,3),(433,21,55.00,1),(433,26,125.00,3),(433,31,22.00,4),(433,36,160.05,5),(434,1,1200.00,3),(434,6,615.95,5),(434,11,1650.00,1),(434,16,28.00,3),(434,21,55.00,2),(434,26,125.00,1),(434,31,21.34,6),(434,37,189.00,3),(435,12,23.50,2),(436,15,4.84,5),(436,35,39.00,4),(437,1,1200.00,4),(437,9,32.01,5),(437,17,43.65,6),(437,28,29.00,4),(437,36,165.00,3),(438,7,49.00,3),(438,12,23.50,2),(438,17,45.00,3),(438,22,82.00,4),(438,27,23.28,5),(438,32,32.00,2),(438,37,189.00,1),(439,1,1164.00,5),(439,25,139.00,1),(439,38,166.00,3),(440,1,1200.00,1),(440,36,165.00,3),(441,1,1164.00,6),(441,6,615.95,5),(441,11,1600.50,5),(441,16,27.16,5),(441,26,125.00,3),(441,31,22.00,4),(441,36,165.00,4),(442,12,23.50,4),(442,20,15.00,1),(442,28,29.00,2),(442,36,165.00,3),(443,16,28.00,3),(443,21,53.35,6),(443,26,121.25,5),(443,31,22.00,3),(443,40,174.60,6),(444,8,50.00,4),(444,13,65.47,5),(444,18,179.00,3),(444,28,29.00,1),(444,33,19.00,4),(444,38,161.02,6),(445,1,1200.00,2),(445,11,1600.50,6),(445,17,45.00,3),(445,29,34.00,4),(445,35,39.00,1),(446,15,4.99,2),(446,35,39.00,2),(447,1,1200.00,4),(447,9,32.01,5),(447,24,66.93,5),(447,32,31.04,6),(447,40,180.00,3),(448,14,139.95,2),(448,31,22.00,1),(449,1,1164.00,5),(449,6,635.00,3),(449,11,1600.50,5),(449,16,27.16,5),(449,21,53.35,5),(449,26,125.00,1),(449,31,22.00,4),(449,36,165.00,2),(450,1,1200.00,1),(450,6,635.00,1),(450,11,1650.00,1),(450,16,28.00,3),(450,21,53.35,5),(450,26,125.00,3),(450,31,22.00,1),(451,21,55.00,4),(452,39,169.75,6),(453,1,1200.00,1),(453,7,49.00,2),(453,13,67.50,1),(453,26,125.00,1),(453,32,32.00,1),(453,38,166.00,2),(454,1,1200.00,1),(454,15,4.99,4),(454,28,29.00,1),(455,18,173.63,6),(455,38,166.00,4),(456,26,125.00,3),(457,2,1800.00,1),(457,10,36.00,2),(457,18,179.00,2),(457,26,125.00,4),(457,34,27.00,3),(458,9,33.00,2),(458,17,45.00,4),(458,25,139.00,2),(458,34,26.19,5),(459,8,48.50,5),(459,18,179.00,2),(459,28,29.00,4),(459,38,161.02,6),(460,6,635.00,3),(461,1,1200.00,1),(461,13,67.50,2),(461,21,55.00,4),(461,29,32.98,6),(461,37,183.33,6),(462,10,36.00,1),(462,30,43.65,5),(463,21,53.35,6),(463,34,26.19,6),(464,11,1650.00,3),(464,24,69.00,3),(464,37,189.00,1),(465,1,1200.00,1),(465,6,635.00,4),(465,11,1650.00,3),(465,16,27.16,6),(465,21,53.35,6),(465,27,24.00,1),(465,32,32.00,2),(465,37,183.33,6),(466,1,1164.00,5),(466,15,4.99,1),(466,21,55.00,2),(466,27,24.00,3),(466,33,19.00,4),(466,39,175.00,1),(467,1,1200.00,4),(467,11,1650.00,3),(467,33,19.00,4),(468,1,1164.00,5),(468,9,32.01,6),(468,17,45.00,4),(468,25,139.00,2),(468,33,19.00,4),(469,2,1746.00,5),(469,15,4.99,1),(469,28,29.00,2),(470,7,47.53,5),(470,15,4.99,3),(470,31,21.34,5),(470,39,175.00,2),(471,34,26.19,5),(472,1,1164.00,6),(472,38,166.00,4),(473,10,34.92,5),(473,15,4.99,2),(473,20,15.00,1),(473,25,139.00,3),(473,30,45.00,2),(473,35,39.00,2),(473,40,174.60,6),(474,9,32.01,5),(474,15,4.99,3),(474,21,53.35,6),(474,27,24.00,4),(474,33,19.00,4),(474,39,175.00,1),(475,20,14.55,6),(475,25,134.83,5),(475,30,45.00,2),(475,35,39.00,2),(475,40,180.00,1),(476,18,179.00,3),(476,38,166.00,4),(477,1,1200.00,4),(477,7,49.00,2),(477,13,65.47,5),(477,19,45.59,6),(477,30,45.00,3),(477,36,160.05,6),(478,9,33.00,4),(478,14,139.95,3),(478,19,47.00,1),(478,24,66.93,5),(478,29,34.00,4),(478,34,27.00,4),(478,39,175.00,1),(479,1,1164.00,6),(479,7,49.00,3),(479,21,55.00,3),(479,27,24.00,1),(479,33,19.00,2),(479,39,175.00,2),(480,6,635.00,4),(480,14,135.75,5),(480,22,82.00,2),(480,30,43.65,5),(480,38,166.00,4),(481,7,49.00,1),(481,15,4.99,4),(481,31,22.00,2),(481,39,175.00,3),(482,24,69.00,3),(483,6,615.95,6),(483,16,28.00,3),(483,26,125.00,3),(483,36,165.00,4),(485,10,34.92,5),(485,15,4.99,1),(485,20,15.00,3),(485,25,134.83,5),(485,30,45.00,4),(485,35,39.00,4),(485,40,174.60,5),(486,5,7.45,4),(486,10,36.00,1),(486,15,4.84,5),(486,20,15.00,1),(486,25,139.00,2),(486,30,45.00,3),(486,35,39.00,2),(486,40,180.00,2),(487,1,1200.00,2),(487,16,28.00,2),(487,26,125.00,1),(487,36,165.00,4),(488,10,36.00,1),(488,30,45.00,3),(489,5,7.23,5),(489,25,134.83,5),(490,1,1200.00,2),(490,14,139.95,2),(490,29,34.00,3),(491,1,1200.00,4),(491,7,49.00,2),(491,22,79.54,5),(491,28,28.13,5),(491,34,27.00,1),(491,40,180.00,1),(492,1,1200.00,1),(492,7,49.00,4),(492,13,67.50,3),(492,26,125.00,3),(492,32,32.00,3),(492,38,161.02,6),(493,1,1200.00,3),(493,30,43.65,6),(494,34,27.00,4),(495,1,1164.00,5),(495,15,4.99,1),(495,21,53.35,6),(495,27,23.28,5),(495,33,19.00,3),(495,39,175.00,3),(496,1,1200.00,1),(496,14,139.95,3),(496,36,165.00,2),(497,9,33.00,2),(497,14,139.95,4),(497,19,47.00,2),(497,24,69.00,2),(497,29,34.00,2),(497,34,27.00,4),(497,39,169.75,5),(498,1,1164.00,5),(498,6,635.00,1),(498,17,45.00,2),(498,22,82.00,1),(498,27,24.00,3),(498,32,32.00,2),(498,37,183.33,6),(499,1,1164.00,6),(499,11,1600.50,6),(499,21,55.00,3),(499,34,26.19,6),(500,1,1200.00,1),(500,11,1650.00,1),(500,21,55.00,3),(500,31,22.00,1),(501,9,33.00,1),(501,17,45.00,3),(501,26,125.00,2),(501,34,26.19,5),(502,1,1200.00,3),(502,11,1650.00,4),(502,21,53.35,5),(502,38,166.00,3),(503,1,1200.00,2),(503,9,32.01,5),(503,21,55.00,4),(503,29,34.00,3),(503,37,189.00,4),(504,37,189.00,1),(505,1,1200.00,2),(505,6,615.95,6),(505,20,14.55,6),(505,25,139.00,1),(505,30,45.00,4),(505,35,37.83,6),(505,40,180.00,3),(506,1,1164.00,5),(506,26,125.00,3),(507,9,32.01,6),(507,19,47.00,1),(507,29,32.98,5),(507,39,169.75,5),(508,1,1164.00,5),(508,11,1600.50,6),(508,30,43.65,5),(508,40,174.60,6),(509,1,1200.00,4),(509,18,173.63,5),(509,28,29.00,2),(509,38,166.00,2),(510,9,33.00,3),(510,17,43.65,6),(510,25,139.00,4),(510,33,19.00,3),(511,1,1200.00,3),(511,11,1650.00,3),(511,21,55.00,2),(511,37,183.33,5),(512,8,48.50,6),(513,1,1200.00,4),(513,6,615.95,5),(513,15,4.99,2),(513,20,14.55,5),(513,25,139.00,4),(513,30,45.00,3),(513,35,39.00,4),(513,40,174.60,5),(514,1,1164.00,6),(514,10,36.00,3),(514,18,179.00,4),(514,26,121.25,5),(514,34,27.00,1),(515,10,36.00,4),(515,18,179.00,4),(515,26,125.00,2),(515,34,27.00,3),(516,1,1200.00,3),(516,13,67.50,2),(516,33,18.43,6),(517,5,7.45,1),(517,10,36.00,2),(517,15,4.99,2),(517,20,15.00,4),(517,25,134.83,6),(517,30,45.00,3),(517,35,39.00,3),(518,9,32.01,5),(518,29,34.00,1),(519,5,7.23,6),(519,15,4.99,3),(519,25,139.00,1),(519,35,37.83,6),(520,1,1200.00,1),(520,12,22.80,5),(520,17,43.65,6),(520,22,82.00,1),(520,27,24.00,4),(520,32,32.00,3),(520,37,183.33,6),(521,1,1200.00,2),(521,31,22.00,3),(522,15,4.99,1),(524,29,34.00,4),(525,3,75.00,2),(525,9,33.00,3),(525,15,4.84,6),(525,21,55.00,2),(525,27,24.00,4),(525,33,19.00,4),(526,9,32.01,5),(526,29,34.00,2),(527,7,49.00,1),(528,2,1800.00,3),(528,22,82.00,3),(529,1,1164.00,6),(529,9,33.00,2),(529,17,45.00,3),(529,25,134.83,5),(529,33,18.43,5),(530,1,1200.00,3),(530,6,635.00,4),(530,11,1650.00,4),(530,16,27.16,6),(530,21,53.35,6),(530,31,22.00,2),(530,36,160.05,6),(531,1,1200.00,3),(531,7,49.00,4),(531,13,65.47,5),(531,19,45.59,5),(531,25,139.00,3),(531,36,165.00,4),(532,5,7.23,5),(532,11,1650.00,4),(532,17,43.65,6),(532,29,34.00,4),(532,35,39.00,4),(533,1,1200.00,3),(533,6,615.95,5),(533,11,1600.50,5),(533,16,28.00,2),(533,30,45.00,2),(533,35,37.83,6),(533,40,180.00,1),(534,5,7.45,2),(534,25,139.00,4),(535,1,1200.00,4),(535,24,66.93,5),(535,37,183.33,6),(536,10,36.00,4),(536,15,4.99,3),(536,20,15.00,3),(536,25,139.00,3),(536,30,43.65,6),(536,35,39.00,3),(536,40,180.00,4),(537,9,32.01,5),(537,17,45.00,1),(537,30,45.00,3),(537,38,166.00,4),(538,1,1200.00,3),(538,6,615.95,5),(538,11,1650.00,1),(538,20,15.00,2),(538,25,134.83,5),(538,30,45.00,2),(538,35,37.83,6),(538,40,180.00,2),(539,1,1200.00,2),(539,6,635.00,4),(539,11,1650.00,2),(539,16,28.00,1),(539,21,53.35,5),(539,26,125.00,2),(539,32,32.00,3),(539,37,189.00,1),(540,1,1164.00,6),(540,7,49.00,3),(540,13,67.50,1),(540,29,34.00,2),(540,35,39.00,4),(541,1,1164.00,6),(541,11,1600.50,6),(541,25,139.00,4),(541,35,37.83,6),(542,6,615.95,6),(542,19,47.00,1),(542,32,31.04,5),(543,24,66.93,5),(544,1,1200.00,3),(544,11,1650.00,2),(544,16,28.00,1),(544,21,55.00,2),(544,26,121.25,5),(544,31,22.00,1),(544,36,165.00,2),(545,1,1200.00,2),(545,6,635.00,3),(545,11,1650.00,3),(545,16,28.00,4),(545,21,55.00,2),(545,32,32.00,3),(545,37,183.33,5),(546,17,43.65,5),(546,37,189.00,1),(547,1,1200.00,1),(547,9,33.00,3),(547,17,43.65,5),(547,30,45.00,2),(547,38,166.00,4),(548,1,1200.00,4),(548,7,49.00,3),(548,13,67.50,4),(548,27,23.28,5),(548,33,19.00,4),(548,39,175.00,4),(549,28,28.13,5),(550,10,36.00,1),(550,16,28.00,2),(550,22,82.00,1),(550,28,29.00,1),(550,34,27.00,2),(550,40,180.00,3),(551,9,32.01,5),(551,14,135.75,6),(551,19,47.00,1),(551,24,66.93,6),(551,29,32.98,5),(551,34,27.00,4),(552,1,1164.00,5),(552,6,635.00,2),(552,11,1600.50,6),(552,16,28.00,4),(552,27,24.00,1),(552,32,31.04,5),(552,37,189.00,3),(553,1,1200.00,3),(553,11,1650.00,1),(553,21,53.35,5),(553,36,160.05,5),(554,1,1164.00,5),(554,9,32.01,5),(554,17,45.00,4),(554,25,134.83,5),(554,33,19.00,2),(555,3,72.75,5),(555,8,50.00,3),(555,13,67.50,3),(555,18,179.00,2),(555,28,29.00,1),(555,33,19.00,3),(555,38,166.00,3),(556,1,1164.00,5),(556,9,33.00,4),(556,17,43.65,5),(556,28,28.13,6),(556,36,165.00,1),(557,1,1200.00,3),(557,11,1650.00,2),(557,16,27.16,5),(557,21,55.00,3),(557,26,121.25,5),(557,31,21.34,6),(557,36,165.00,3),(558,1,1164.00,6),(558,6,635.00,3),(558,20,15.00,1),(558,25,139.00,4),(558,30,43.65,5),(558,35,39.00,3),(558,40,174.60,6),(559,1,1200.00,3),(559,8,50.00,4),(559,13,67.50,2),(559,18,179.00,4),(559,28,28.13,6),(559,33,19.00,4),(559,38,166.00,4),(560,1,1164.00,5),(560,16,27.16,6),(560,22,82.00,2),(560,28,29.00,1),(560,34,27.00,2),(560,40,180.00,3),(561,1,1200.00,3),(562,7,49.00,3),(563,1,1200.00,3),(563,7,49.00,3),(563,13,67.50,1),(563,19,47.00,3),(563,34,27.00,4),(563,40,180.00,4),(564,16,28.00,4),(564,29,34.00,3),(565,1,1200.00,2),(565,28,29.00,1),(566,10,34.92,5),(566,16,27.16,6),(566,22,82.00,3),(566,28,28.13,5),(566,34,27.00,3),(566,40,180.00,1),(567,14,135.75,6),(567,29,34.00,2),(568,29,32.98,6),(569,1,1200.00,4),(569,7,49.00,1),(569,13,67.50,4),(569,19,47.00,3),(569,33,19.00,4),(569,39,169.75,6),(570,15,4.84,6),(570,25,134.83,5),(570,35,39.00,1),(571,1,1200.00,1),(571,14,139.95,4),(571,38,166.00,4),(572,15,4.99,4),(572,21,53.35,6),(572,27,23.28,5),(572,33,18.43,5),(572,39,169.75,5),(573,5,7.45,2),(573,11,1600.50,6),(573,17,43.65,6),(573,29,34.00,1),(573,35,37.83,5),(574,9,32.01,5),(575,1,1200.00,1),(575,6,635.00,3),(575,11,1600.50,5),(575,16,28.00,1),(575,21,55.00,2),(575,26,125.00,4),(575,31,21.34,6),(575,36,165.00,3),(576,16,28.00,2),(577,12,23.50,1),(577,20,14.55,5),(577,28,29.00,3),(577,36,165.00,3),(578,8,48.50,5),(578,18,179.00,3),(578,28,29.00,4),(578,38,161.02,6),(579,1,1164.00,5),(579,6,635.00,3),(579,11,1650.00,4),(579,16,28.00,2),(579,21,55.00,2),(579,26,125.00,3),(579,39,175.00,3),(580,19,47.00,2),(580,39,169.75,6),(581,16,28.00,4),(581,21,55.00,3),(581,30,45.00,1),(581,35,37.83,6),(581,40,180.00,4),(582,1,1200.00,1),(582,6,635.00,2),(582,14,139.95,1),(582,19,47.00,4),(582,24,69.00,4),(582,29,34.00,3),(582,34,27.00,1),(582,39,175.00,3),(583,7,47.53,6),(583,13,67.50,1),(583,19,45.59,6),(583,33,19.00,1),(583,39,175.00,4),(584,1,1200.00,4),(584,14,139.95,2),(584,24,66.93,6),(584,34,27.00,1),(585,1,1200.00,1),(585,18,179.00,3),(585,31,21.34,6),(586,6,635.00,2),(587,21,55.00,4),(587,31,22.00,2),(588,9,33.00,3),(588,17,43.65,5),(588,29,32.98,6),(588,37,189.00,4),(589,10,34.92,6),(589,36,160.05,6),(590,1,1164.00,6),(590,6,615.95,6),(590,11,1650.00,3),(590,16,28.00,4),(590,30,43.65,5),(590,35,37.83,5),(590,40,180.00,2),(591,1,1200.00,2),(591,7,49.00,3),(591,13,67.50,1),(591,19,47.00,4),(591,37,189.00,1),(592,1,1200.00,2),(592,6,615.95,5),(592,11,1600.50,5),(592,28,29.00,1),(592,33,18.43,5),(592,38,161.02,5),(593,13,67.50,4),(594,1,1200.00,4),(594,9,32.01,6),(594,18,173.63,5),(594,26,125.00,1),(594,34,26.19,6),(595,19,45.59,6),(596,16,28.00,2),(596,21,55.00,4),(596,26,121.25,5),(596,32,31.04,5),(596,37,189.00,4),(597,1,1200.00,3),(597,6,615.95,6),(597,11,1600.50,6),(597,16,28.00,1),(597,25,134.83,6),(597,30,45.00,4),(597,35,37.83,6),(597,40,180.00,2),(598,1,1200.00,3),(598,6,635.00,3),(598,11,1650.00,1),(598,22,82.00,2),(598,27,23.28,5),(598,32,32.00,2),(598,37,189.00,1),(599,1,1200.00,3),(599,11,1650.00,1),(599,35,39.00,3),(600,1,1200.00,2),(600,6,635.00,4),(600,11,1650.00,1),(600,16,28.00,3),(600,21,53.35,6),(600,26,125.00,4),(600,31,21.34,6),(600,36,165.00,2),(601,12,22.80,6),(602,11,1600.50,5),(603,9,32.01,5),(603,17,45.00,4),(603,28,28.13,6),(603,36,165.00,4),(604,1,1164.00,6),(604,14,139.95,2),(604,27,24.00,1),(605,1,1164.00,6),(605,7,49.00,4),(605,21,55.00,4),(605,27,24.00,3),(605,33,18.43,5),(605,39,175.00,1),(606,1,1164.00,6),(606,14,135.75,6),(606,33,19.00,3),(607,1,1164.00,6),(607,35,39.00,2),(608,7,47.53,5),(608,17,45.00,2),(608,27,23.28,5),(608,37,189.00,1),(609,1,1200.00,3),(609,14,135.75,5),(609,22,82.00,2),(609,30,43.65,6),(609,38,166.00,2),(610,1,1164.00,5),(610,6,615.95,6),(610,11,1650.00,3),(610,16,27.16,5),(610,29,34.00,2),(610,34,26.19,5),(610,39,175.00,1),(611,1,1200.00,4),(611,15,4.99,2),(611,20,15.00,1),(611,25,139.00,2),(611,30,45.00,1),(611,35,39.00,4),(611,40,174.60,5),(612,1,1200.00,4),(612,6,635.00,1),(612,19,47.00,3),(612,24,69.00,4),(612,29,34.00,3),(612,34,26.19,6),(612,39,175.00,1),(613,21,55.00,2),(614,1,1200.00,2),(614,21,53.35,6),(614,34,27.00,2),(615,1,1200.00,2),(615,6,635.00,3),(615,11,1650.00,3),(615,16,28.00,2),(615,21,55.00,3),(615,26,125.00,1),(615,31,22.00,1),(615,36,165.00,1),(616,18,179.00,2),(616,38,166.00,3),(617,1,1164.00,6),(617,6,635.00,1),(617,11,1650.00,2),(617,16,28.00,2),(617,24,69.00,4),(617,29,34.00,4),(617,34,27.00,1),(617,39,175.00,1),(618,1,1164.00,6),(618,11,1650.00,3),(618,21,53.35,5),(618,31,22.00,4),(619,3,75.00,3),(620,1,1200.00,2),(620,6,635.00,3),(620,11,1650.00,2),(620,16,28.00,1),(620,21,55.00,3),(620,28,29.00,3),(620,33,19.00,4),(620,38,161.02,6),(621,30,45.00,3),(622,1,1164.00,5),(622,9,33.00,3),(622,22,79.54,6),(622,30,45.00,2),(622,38,166.00,3),(623,13,67.50,3),(623,33,19.00,3),(624,12,23.50,2),(624,20,15.00,3),(624,28,29.00,4),(624,36,165.00,2),(625,1,1164.00,5),(625,7,47.53,5),(625,13,67.50,4),(625,27,23.28,6),(625,33,19.00,2),(625,39,175.00,4),(626,1,1164.00,5),(626,27,24.00,3),(626,40,180.00,4),(627,1,1200.00,1),(627,34,27.00,4),(628,40,174.60,6),(630,1,1164.00,6),(630,11,1650.00,4),(630,21,55.00,2),(630,34,26.19,6),(631,1,1200.00,4),(631,7,47.53,6),(631,13,67.50,1),(631,19,47.00,2),(631,33,18.43,5),(631,39,175.00,3),(633,1,1200.00,4),(633,35,37.83,5),(634,1,1200.00,2),(634,17,45.00,3),(634,27,23.28,6),(634,37,183.33,5),(635,8,48.50,5),(635,14,135.75,6),(635,20,15.00,4),(635,26,125.00,1),(635,32,32.00,2),(635,38,166.00,4),(636,1,1200.00,4),(636,6,635.00,4),(636,11,1650.00,1),(636,16,27.16,6),(636,21,53.35,5),(636,26,125.00,3),(636,31,22.00,1),(636,36,165.00,2),(637,1,1200.00,2),(637,6,615.95,6),(637,11,1600.50,6),(637,16,27.16,5),(637,21,55.00,3),(637,29,34.00,2),(637,34,27.00,4),(637,39,169.75,5),(638,8,50.00,4),(638,28,28.13,5),(639,1,1164.00,6),(639,14,139.95,2),(639,20,15.00,3),(639,26,121.25,6),(639,32,31.04,5),(639,38,166.00,2),(640,6,635.00,2),(640,19,45.59,5),(640,32,32.00,1),(641,1,1200.00,1),(641,11,1600.50,6),(641,21,55.00,2),(641,35,39.00,2),(642,1,1200.00,2),(642,9,33.00,3),(642,17,45.00,1),(642,29,34.00,2),(642,37,189.00,2),(643,1,1200.00,4),(643,9,32.01,6),(643,17,43.65,5),(643,37,189.00,2),(644,3,75.00,2),(644,16,28.00,3),(644,29,32.98,6),(645,10,34.92,5),(645,36,165.00,1),(646,38,166.00,4),(647,3,75.00,1),(647,13,67.50,1),(647,33,19.00,1),(648,9,33.00,4),(649,17,43.65,6),(649,29,32.98,6),(649,35,37.83,6),(650,1,1200.00,4),(650,14,135.75,6),(650,40,174.60,6),(651,1,1200.00,2),(651,7,49.00,4),(651,13,67.50,1),(651,19,47.00,2),(651,31,22.00,4),(651,37,189.00,4),(652,9,32.01,5),(652,14,139.95,4),(652,19,47.00,1),(652,24,69.00,4),(652,29,34.00,3),(652,34,27.00,1),(652,39,169.75,5),(653,21,53.35,5),(653,31,21.34,5),(654,1,1164.00,6),(654,6,635.00,1),(654,11,1650.00,1),(654,16,28.00,2),(654,21,53.35,6),(654,33,18.43,6),(654,38,161.02,5),(655,1,1164.00,5),(655,9,33.00,3),(655,17,43.65,5),(655,25,139.00,2),(655,36,160.05,5),(656,7,47.53,5),(656,17,45.00,3),(656,27,24.00,2),(656,37,189.00,1),(657,9,33.00,2),(657,22,82.00,2),(657,30,45.00,1),(657,38,166.00,3),(658,1,1200.00,4),(658,9,33.00,4),(658,17,45.00,4),(658,28,29.00,1),(658,36,165.00,4),(659,1,1200.00,2),(659,21,53.35,6),(659,34,26.19,5),(660,1,1200.00,1),(660,7,49.00,1),(660,13,67.50,2),(660,19,45.59,5),(660,25,139.00,2),(660,40,174.60,6),(661,2,1800.00,3),(661,15,4.84,5),(661,28,29.00,1),(662,1,1200.00,1),(662,6,615.95,6),(662,16,28.00,2),(662,21,55.00,3),(662,26,125.00,4),(662,31,21.34,5),(662,36,165.00,4),(663,1,1200.00,4),(663,9,33.00,2),(663,17,45.00,4),(663,25,139.00,1),(663,33,19.00,3),(664,21,55.00,2),(664,38,166.00,1),(665,1,1200.00,1),(665,11,1650.00,4),(665,21,55.00,4),(665,31,22.00,1),(666,2,1800.00,3),(666,22,82.00,2),(667,9,32.01,6),(667,14,139.95,2),(667,19,45.59,5),(667,24,66.93,6),(667,29,34.00,3),(667,34,26.19,6),(668,1,1164.00,6),(668,9,33.00,1),(668,19,47.00,3),(668,27,23.28,5),(668,35,39.00,1),(669,1,1164.00,6),(669,7,49.00,1),(669,13,67.50,4),(669,19,47.00,4),(669,32,32.00,3),(669,38,166.00,2),(670,12,22.80,5),(670,25,134.83,5),(670,38,161.02,5),(671,1,1164.00,6),(671,6,635.00,4),(671,11,1650.00,3),(671,16,28.00,2),(671,21,55.00,2),(671,33,18.43,5),(671,38,166.00,1),(672,1,1164.00,5),(672,9,33.00,1),(672,17,45.00,3),(672,25,134.83,6),(672,33,19.00,2),(673,6,615.95,5),(673,19,45.59,6),(673,32,31.04,5),(674,1,1200.00,2),(674,30,43.65,5),(675,1,1164.00,5),(675,9,33.00,2),(675,17,43.65,5),(675,25,139.00,3),(675,34,27.00,3),(676,1,1200.00,1),(676,6,635.00,1),(676,11,1650.00,2),(676,16,27.16,5),(676,21,53.35,6),(676,32,32.00,3),(676,37,189.00,3),(677,1,1200.00,4),(677,7,49.00,1),(677,13,67.50,1),(677,19,45.59,5),(677,25,139.00,3),(677,38,166.00,2),(678,1,1200.00,2),(678,6,635.00,1),(678,11,1650.00,2),(678,16,28.00,2),(678,21,53.35,5),(678,26,125.00,3),(678,39,175.00,1),(679,1,1164.00,5),(679,6,635.00,3),(679,11,1650.00,4),(679,16,28.00,3),(679,21,55.00,2),(679,26,121.25,5),(679,31,21.34,6),(679,39,175.00,3),(680,8,48.50,6),(680,14,139.95,4),(680,20,15.00,3),(680,26,125.00,1),(680,32,32.00,1),(680,38,166.00,4),(681,16,28.00,1),(681,21,55.00,1),(681,26,121.25,5),(681,40,180.00,4),(682,1,1164.00,5),(682,7,49.00,2),(682,12,23.50,3),(682,17,45.00,4),(682,22,82.00,2),(682,27,24.00,4),(682,32,32.00,4),(682,37,189.00,4),(683,26,125.00,3),(684,1,1200.00,3),(684,6,615.95,6),(684,11,1650.00,3),(684,16,28.00,2),(684,21,55.00,1),(684,26,121.25,6),(684,31,22.00,2),(684,36,165.00,2),(685,1,1164.00,5),(685,6,615.95,6),(685,11,1650.00,3),(685,16,28.00,3),(685,21,53.35,6),(685,26,125.00,1),(685,37,189.00,2),(686,1,1164.00,5),(686,7,47.53,6),(686,13,65.47,6),(686,19,47.00,2),(686,33,19.00,1),(686,39,175.00,4),(687,1,1200.00,4),(687,7,49.00,4),(687,13,67.50,4),(687,29,34.00,2),(687,35,39.00,4),(688,1,1200.00,4),(688,9,32.01,6),(688,17,45.00,2),(688,25,134.83,6),(688,39,169.75,5),(690,1,1200.00,4),(690,11,1650.00,1),(690,21,55.00,2),(690,31,22.00,1),(691,1,1164.00,5),(691,6,615.95,6),(691,11,1650.00,2),(691,18,179.00,3),(691,28,28.13,5),(691,33,19.00,3),(691,38,161.02,6),(692,9,33.00,4),(692,29,32.98,5),(693,1,1200.00,4),(693,11,1650.00,3),(693,21,55.00,3),(693,31,22.00,1),(694,1,1200.00,1),(694,7,49.00,4),(694,13,67.50,1),(694,19,47.00,2),(694,34,27.00,1),(694,40,174.60,5),(695,1,1164.00,6),(695,24,69.00,2),(696,1,1164.00,6),(696,6,635.00,2),(696,11,1650.00,3),(696,20,14.55,6),(696,25,139.00,2),(696,30,43.65,6),(696,35,37.83,6),(696,40,174.60,6),(697,1,1200.00,3),(697,20,15.00,2),(697,33,19.00,3),(698,9,33.00,2),(698,17,45.00,1),(698,25,134.83,6),(698,40,180.00,2),(699,9,33.00,1),(699,19,45.59,5),(699,29,34.00,2),(699,39,175.00,1),(700,1,1200.00,3),(700,28,29.00,2),(701,19,45.59,5),(701,29,32.98,5),(701,39,175.00,3),(702,1,1200.00,4),(702,6,635.00,1),(702,16,27.16,6),(702,21,55.00,3),(702,26,125.00,4),(702,31,22.00,2),(702,36,165.00,4),(703,20,15.00,2),(703,40,180.00,3),(704,1,1200.00,1),(704,21,53.35,5),(705,21,53.35,6),(705,36,165.00,2),(706,8,50.00,3),(706,18,173.63,6),(706,28,28.13,6),(706,38,161.02,6),(707,25,139.00,4),(708,1,1200.00,1),(708,6,635.00,3),(708,13,65.47,5),(708,18,179.00,1),(708,28,28.13,5),(708,33,18.43,6),(708,38,161.02,6),(709,7,49.00,1),(709,12,23.50,1),(709,17,43.65,6),(709,22,82.00,3),(709,27,24.00,3),(709,32,32.00,2),(709,37,183.33,5),(710,1,1164.00,6),(710,9,33.00,2),(710,17,45.00,2),(710,25,139.00,1),(710,33,19.00,2),(711,1,1200.00,1),(711,6,615.95,5),(711,14,139.95,3),(711,19,45.59,5),(711,24,69.00,2),(711,29,34.00,3),(711,34,27.00,2),(711,39,169.75,5),(712,1,1200.00,3),(712,9,33.00,2),(712,17,43.65,6),(712,25,139.00,2),(712,35,39.00,1),(713,25,134.83,6),(714,1,1164.00,6),(714,6,635.00,3),(714,11,1650.00,2),(714,16,28.00,3),(714,21,55.00,1),(714,26,125.00,2),(714,31,21.34,6),(714,37,189.00,1),(715,1,1200.00,1),(715,7,49.00,2),(715,13,65.47,5),(715,19,47.00,4),(715,25,139.00,3),(715,37,183.33,6),(716,17,45.00,2),(716,37,189.00,4),(717,1,1200.00,3),(717,7,47.53,5),(717,13,67.50,4),(717,19,45.59,5),(717,29,32.98,5),(717,35,37.83,5),(718,12,22.80,6),(718,25,134.83,5),(718,38,166.00,1),(719,1,1200.00,1),(719,22,79.54,6),(719,35,39.00,4),(720,9,33.00,4),(720,22,79.54,6),(720,35,37.83,6),(721,9,32.01,5),(721,17,43.65,6),(721,25,139.00,3),(721,37,183.33,5),(722,1,1164.00,5),(722,11,1600.50,5),(722,33,18.43,5),(723,9,33.00,4),(723,21,53.35,6),(723,29,34.00,2),(723,37,189.00,4),(724,1,1200.00,4),(724,9,33.00,1),(724,18,179.00,2),(724,26,125.00,1),(724,34,27.00,3),(725,1,1164.00,5),(725,21,53.35,5),(726,3,75.00,2),(726,8,48.50,5),(726,13,65.47,6),(726,18,179.00,1),(726,28,28.13,5),(726,33,19.00,1),(727,1,1200.00,1),(727,6,635.00,4),(727,11,1650.00,2),(727,16,28.00,1),(727,21,55.00,4),(727,34,26.19,6),(727,39,169.75,6),(728,9,33.00,3),(728,22,82.00,1),(728,35,39.00,1),(729,1,1164.00,6),(729,14,135.75,5),(729,40,180.00,2),(730,1,1200.00,4),(730,9,32.01,5),(730,17,43.65,6),(730,35,39.00,4),(731,1,1164.00,5),(731,13,67.50,1),(731,19,47.00,1),(731,25,139.00,4),(731,31,22.00,4),(731,37,189.00,3),(732,18,179.00,2),(732,28,29.00,2),(732,33,19.00,1),(732,38,166.00,3),(733,8,50.00,1),(733,16,27.16,5),(733,24,69.00,1),(733,32,32.00,3),(733,40,180.00,4),(734,1,1200.00,4),(735,1,1200.00,2),(735,7,49.00,4),(735,13,67.50,1),(735,19,47.00,4),(735,34,27.00,2),(735,40,180.00,4),(736,17,43.65,6),(736,27,24.00,4),(736,37,183.33,5),(737,30,43.65,6),(738,1,1200.00,2),(738,11,1600.50,6),(738,21,55.00,4),(738,34,26.19,6),(739,26,121.25,5),(740,1,1164.00,6),(740,6,615.95,5),(740,11,1650.00,4),(740,16,28.00,2),(740,28,29.00,2),(740,33,18.43,5),(740,38,166.00,4),(741,2,1800.00,4),(741,8,48.50,5),(741,14,139.95,1),(741,20,15.00,1),(741,26,121.25,5),(741,32,32.00,2),(742,5,7.45,1),(742,13,65.47,6),(742,21,55.00,2),(742,29,32.98,5),(742,37,183.33,5),(743,1,1200.00,3),(743,11,1600.50,5),(743,25,139.00,4),(743,35,39.00,3),(744,1,1164.00,6),(744,6,635.00,3),(744,11,1650.00,3),(744,16,28.00,1),(744,21,55.00,2),(744,26,121.25,6),(744,31,22.00,1),(744,38,166.00,4),(745,1,1200.00,4),(745,6,635.00,3),(745,11,1650.00,2),(745,19,47.00,3),(745,24,69.00,3),(745,29,32.98,6),(745,34,27.00,3),(745,39,175.00,3),(746,1,1200.00,3),(746,7,49.00,4),(746,13,65.47,6),(746,26,125.00,3),(746,32,32.00,4),(746,38,161.02,5),(747,1,1164.00,6),(747,7,47.53,5),(747,13,65.47,5),(747,19,47.00,2),(747,25,134.83,5),(747,35,39.00,2),(748,5,7.45,4),(748,13,65.47,6),(748,21,53.35,6),(748,29,32.98,5),(748,37,189.00,4),(749,8,50.00,4),(750,1,1200.00,1),(750,6,635.00,2),(750,15,4.99,4),(750,20,15.00,3),(750,25,139.00,4),(750,30,45.00,4),(750,35,37.83,5),(750,40,180.00,1),(751,1,1164.00,6),(751,9,33.00,4),(751,17,43.65,5),(751,32,32.00,3),(751,40,180.00,1),(752,1,1200.00,2),(752,6,635.00,1),(752,11,1650.00,2),(752,16,28.00,1),(752,21,55.00,3),(752,26,125.00,3),(752,34,27.00,3),(752,39,169.75,6),(754,38,166.00,3),(755,6,615.95,5),(755,11,1650.00,1),(755,16,27.16,5),(755,21,53.35,6),(755,26,121.25,6),(755,31,21.34,5),(755,36,160.05,5),(756,1,1200.00,1),(756,26,125.00,2),(756,39,175.00,2),(757,1,1200.00,4),(757,6,635.00,2),(757,11,1650.00,4),(757,16,27.16,5),(757,21,55.00,1),(757,35,39.00,1),(757,40,180.00,4),(758,28,28.13,6),(759,8,50.00,4),(759,21,55.00,2),(759,34,26.19,6),(760,1,1200.00,1),(760,6,635.00,1),(760,11,1600.50,5),(760,21,53.35,6),(760,26,125.00,4),(760,31,22.00,3),(760,36,160.05,6),(761,1,1200.00,1),(761,7,47.53,6),(761,13,65.47,5),(761,19,47.00,2),(761,25,139.00,2),(761,38,161.02,5),(762,1,1164.00,5),(762,6,635.00,4),(762,11,1600.50,6),(762,16,28.00,4),(762,21,55.00,2),(762,26,125.00,4),(762,31,22.00,2),(762,36,160.05,6),(763,1,1200.00,3),(763,36,165.00,1),(764,13,65.47,5),(764,33,19.00,4),(765,1,1200.00,4),(765,9,33.00,1),(765,17,43.65,6),(765,25,139.00,2),(765,33,18.43,5),(766,1,1164.00,5),(766,36,165.00,1),(767,1,1200.00,4),(767,7,47.53,5),(767,13,67.50,3),(767,19,47.00,2),(767,25,139.00,1),(767,39,175.00,4),(768,17,45.00,3),(769,1,1164.00,6),(769,6,615.95,5),(769,11,1650.00,4),(769,16,27.16,6),(769,21,55.00,1),(769,26,121.25,5),(769,31,21.34,5),(769,36,165.00,1),(770,10,36.00,4),(771,1,1164.00,6),(771,33,19.00,2),(772,1,1200.00,1),(772,11,1600.50,6),(772,26,125.00,4),(772,36,165.00,1),(773,24,66.93,6),(774,1,1200.00,2),(774,9,33.00,3),(774,19,47.00,4),(774,27,24.00,2),(774,35,39.00,4),(775,3,75.00,3),(775,9,33.00,1),(775,15,4.99,4),(775,21,53.35,6),(775,27,23.28,6),(775,33,19.00,4),(776,1,1164.00,6),(776,11,1600.50,5),(776,21,55.00,4),(776,36,165.00,1),(777,1,1200.00,1),(777,18,179.00,3),(777,28,29.00,4),(777,38,166.00,1),(778,14,135.75,6),(778,27,23.28,6),(778,40,180.00,2),(779,9,33.00,1),(779,14,135.75,5),(779,19,47.00,2),(779,24,69.00,2),(779,29,34.00,2),(779,34,27.00,1),(779,39,175.00,2),(780,5,7.45,1),(780,10,34.92,5),(780,15,4.99,1),(780,20,15.00,3),(780,25,139.00,2),(780,30,43.65,6),(780,35,37.83,5),(780,40,174.60,6),(781,1,1200.00,3),(781,9,33.00,2),(781,17,45.00,2),(781,25,139.00,2),(781,36,160.05,6),(782,39,169.75,5),(783,2,1800.00,3),(783,10,34.92,6),(783,18,173.63,5),(783,26,125.00,4),(783,34,27.00,3),(784,1,1164.00,5),(784,14,139.95,4),(784,38,166.00,1),(785,1,1164.00,6),(785,14,139.95,4),(785,35,39.00,3),(786,16,28.00,3),(786,21,55.00,4),(786,35,39.00,1),(786,40,174.60,5),(787,1,1200.00,2),(787,6,615.95,6),(787,11,1650.00,4),(787,16,27.16,5),(787,21,55.00,2),(787,27,24.00,1),(787,32,31.04,5),(787,37,189.00,4),(788,1,1200.00,2),(788,11,1650.00,1),(788,21,55.00,3),(788,35,39.00,3),(789,1,1200.00,3),(789,17,45.00,4),(789,27,24.00,3),(789,37,183.33,6),(790,1,1200.00,4),(790,7,49.00,1),(790,13,67.50,2),(790,19,45.59,6),(790,25,139.00,3),(790,40,180.00,3),(791,1,1200.00,2),(791,14,135.75,6),(791,40,180.00,4),(792,1,1200.00,4),(792,35,37.83,6),(793,9,33.00,2),(793,22,79.54,5),(793,35,39.00,4),(794,1,1164.00,5),(794,26,125.00,4),(794,39,175.00,3),(795,1,1200.00,1),(795,22,82.00,4),(795,35,37.83,6),(796,1,1200.00,4),(796,14,135.75,6),(796,34,27.00,3),(797,1,1200.00,3),(797,6,635.00,4),(797,11,1650.00,2),(797,16,27.16,5),(797,21,55.00,4),(797,26,125.00,3),(797,31,22.00,2),(797,36,165.00,2),(798,7,47.53,5),(798,13,67.50,2),(798,29,32.98,5),(798,35,39.00,1),(799,1,1200.00,1),(799,7,49.00,1),(799,13,65.47,6),(799,19,47.00,4),(799,30,45.00,4),(799,36,160.05,6),(800,1,1200.00,2),(800,17,43.65,6),(800,27,24.00,1),(800,37,189.00,4),(801,1,1200.00,4),(801,16,27.16,6),(801,22,79.54,6),(801,28,28.13,6),(801,34,26.19,6),(801,40,180.00,4),(802,9,33.00,1),(802,29,34.00,1),(803,18,179.00,3),(803,38,161.02,5),(804,5,7.45,3),(804,11,1600.50,5),(804,17,43.65,5),(804,29,34.00,1),(804,35,39.00,1),(805,1,1164.00,6),(805,14,139.95,3),(805,30,45.00,2),(806,1,1200.00,4),(806,9,33.00,2),(806,17,43.65,6),(806,31,21.34,5),(806,39,175.00,3),(807,1,1200.00,4),(807,11,1650.00,2),(807,24,66.93,5),(807,34,26.19,6),(808,9,33.00,3),(808,22,82.00,4),(808,35,39.00,3),(809,1,1200.00,2),(809,7,49.00,1),(809,17,45.00,2),(809,29,34.00,1),(809,35,37.83,5),(810,15,4.99,3),(810,25,139.00,2),(810,35,39.00,3),(811,16,27.16,6),(811,36,160.05,6),(812,1,1164.00,5),(812,17,45.00,3),(812,27,23.28,5),(812,37,189.00,1),(813,1,1164.00,5),(813,6,635.00,1),(813,11,1650.00,4),(813,16,28.00,2),(813,21,53.35,6),(813,26,125.00,3),(813,31,22.00,2),(813,36,165.00,3),(814,9,33.00,1),(815,6,615.95,5),(815,11,1650.00,4),(815,16,28.00,2),(815,21,53.35,6),(815,26,125.00,3),(815,31,21.34,5),(815,36,165.00,4),(817,16,28.00,2),(817,25,139.00,4),(817,30,43.65,6),(817,35,39.00,3),(817,40,180.00,3),(818,1,1200.00,2),(818,9,33.00,2),(818,17,43.65,6),(818,37,189.00,4),(819,1,1200.00,1),(819,6,635.00,3),(819,11,1650.00,3),(819,16,27.16,5),(819,21,55.00,2),(819,26,121.25,6),(819,40,180.00,1),(820,24,66.93,6),(821,1,1200.00,3),(821,31,22.00,4),(822,1,1200.00,1),(822,9,32.01,6),(822,17,45.00,2),(822,25,139.00,4),(822,33,19.00,3),(823,29,34.00,2),(824,1,1164.00,5),(824,22,79.54,5),(825,1,1200.00,1),(825,24,66.93,6),(825,37,189.00,2),(826,1,1200.00,4),(826,7,49.00,3),(826,13,65.47,6),(826,19,45.59,5),(826,25,139.00,2),(826,31,21.34,6),(827,5,7.45,2),(827,13,67.50,2),(827,21,55.00,4),(827,29,34.00,1),(827,37,189.00,4),(828,1,1200.00,4),(828,7,49.00,4),(828,13,65.47,5),(828,19,47.00,2),(828,25,139.00,4),(828,40,180.00,2),(829,1,1200.00,2),(829,7,47.53,5),(829,13,67.50,3),(829,19,47.00,3),(829,32,32.00,4),(829,38,166.00,3),(830,1,1200.00,3),(830,37,183.33,5),(831,1,1200.00,4),(831,16,28.00,4),(831,29,34.00,3),(832,39,175.00,1),(833,1,1200.00,2),(833,9,33.00,2),(833,17,45.00,4),(833,27,23.28,5),(833,35,39.00,1),(834,7,47.53,6),(834,12,23.50,3),(834,17,43.65,6),(834,22,82.00,3),(834,27,24.00,4),(834,32,31.04,6),(834,37,189.00,4),(835,1,1164.00,6),(835,19,45.59,5),(835,32,31.04,6),(836,6,615.95,6),(836,16,27.16,6),(836,26,125.00,3),(836,36,165.00,2),(837,1,1164.00,6),(837,11,1600.50,6),(837,21,53.35,6),(837,35,37.83,5),(838,1,1200.00,1),(838,6,635.00,3),(838,11,1600.50,6),(838,16,28.00,3),(838,28,29.00,4),(838,33,19.00,1),(838,38,166.00,4),(839,1,1164.00,6),(839,9,33.00,2),(839,21,55.00,3),(839,29,34.00,1),(839,37,189.00,1),(840,13,67.50,4),(840,26,125.00,3),(840,39,175.00,2),(841,1,1200.00,4),(841,6,635.00,4),(841,11,1650.00,2),(841,16,28.00,3),(841,22,82.00,4),(841,27,24.00,3),(841,32,31.04,6),(841,37,189.00,1),(842,1,1200.00,2),(842,26,121.25,6),(843,1,1200.00,2),(843,24,69.00,3),(844,1,1200.00,3),(844,11,1650.00,2),(844,21,53.35,5),(844,34,27.00,4),(845,18,179.00,4),(846,5,7.23,6),(846,13,67.50,1),(846,21,55.00,3),(846,29,34.00,4),(846,37,189.00,4),(847,1,1164.00,5),(847,6,635.00,4),(847,11,1650.00,3),(847,16,28.00,4),(847,21,55.00,4),(847,35,39.00,1),(847,40,180.00,3),(848,1,1200.00,2),(848,9,33.00,4),(848,17,45.00,1),(848,29,34.00,4),(848,37,189.00,1),(849,1,1164.00,6),(849,27,23.28,6),(850,16,28.00,1),(850,21,53.35,5),(850,34,27.00,1),(850,39,175.00,3),(851,9,33.00,4),(851,14,139.95,3),(851,19,47.00,1),(851,24,66.93,5),(851,29,32.98,5),(851,34,27.00,2),(851,39,175.00,2),(852,1,1200.00,2),(852,6,615.95,5),(852,11,1600.50,5),(852,16,28.00,1),(852,21,55.00,4),(852,26,125.00,3),(852,40,174.60,6),(853,1,1164.00,5),(853,6,615.95,6),(853,11,1650.00,2),(853,16,28.00,3),(853,21,55.00,3),(853,31,21.34,5),(853,36,160.05,5),(854,2,1746.00,5),(855,35,39.00,3),(856,1,1200.00,2),(856,7,49.00,1),(856,13,65.47,5),(856,19,47.00,4),(856,34,26.19,5),(856,40,180.00,3),(857,25,139.00,1),(858,1,1200.00,1),(858,19,47.00,2),(858,29,34.00,1),(858,39,169.75,6),(859,6,635.00,4),(859,19,47.00,1),(859,32,31.04,6),(860,7,49.00,1),(860,13,67.50,1),(860,19,47.00,3),(860,25,139.00,1),(860,35,37.83,5),(861,1,1164.00,5),(861,12,23.50,4),(861,17,45.00,4),(861,22,79.54,6),(861,27,23.28,5),(861,32,32.00,2),(861,37,189.00,2),(862,2,1746.00,6),(862,12,22.80,5),(862,22,82.00,2),(862,32,32.00,2),(863,1,1164.00,5),(864,1,1200.00,2),(864,6,615.95,6),(864,11,1650.00,1),(864,16,28.00,1),(864,21,53.35,6),(864,26,125.00,4),(864,31,22.00,2),(864,37,189.00,3),(865,1,1200.00,2),(865,6,635.00,4),(865,11,1650.00,3),(865,16,28.00,1),(865,21,55.00,3),(865,26,121.25,6),(865,31,22.00,3),(865,38,166.00,4),(866,25,134.83,5),(867,1,1200.00,2),(867,9,32.01,6),(867,17,45.00,3),(867,25,134.83,5),(867,39,175.00,2),(868,7,49.00,1),(868,17,43.65,5),(868,27,24.00,2),(868,37,183.33,5),(869,1,1200.00,2),(869,38,166.00,2),(870,1,1164.00,6),(870,11,1600.50,6),(870,19,45.59,5),(870,27,24.00,4),(870,35,37.83,6),(871,1,1164.00,5),(871,15,4.99,4),(871,31,22.00,1),(871,39,175.00,3),(872,1,1200.00,2),(872,6,635.00,3),(872,11,1600.50,5),(872,16,27.16,6),(872,21,55.00,4),(872,26,121.25,6),(872,33,19.00,2),(872,38,166.00,3),(873,1,1200.00,3),(873,11,1650.00,2),(873,24,69.00,2),(873,34,26.19,5),(874,1,1200.00,3),(874,18,173.63,6),(874,28,29.00,4),(874,38,166.00,3),(875,16,28.00,2),(875,36,165.00,3),(876,12,23.50,1),(876,25,139.00,4),(876,38,166.00,2),(877,24,69.00,2),(878,1,1164.00,5),(878,14,139.95,3),(878,33,19.00,3),(879,1,1164.00,5),(879,11,1600.50,6),(879,21,55.00,3),(879,34,26.19,6),(880,1,1200.00,4),(880,33,19.00,4),(881,1,1200.00,1),(881,14,139.95,3),(881,19,47.00,4),(881,24,66.93,6),(881,29,32.98,6),(881,34,27.00,1),(881,39,175.00,2),(882,1,1200.00,3),(882,15,4.84,5),(882,31,22.00,3),(882,39,175.00,3),(883,1,1164.00,6),(883,7,49.00,3),(883,13,67.50,4),(883,19,47.00,1),(883,32,32.00,1),(883,38,166.00,1),(884,1,1200.00,2),(885,13,67.50,2),(885,33,19.00,2),(886,9,32.01,6),(886,14,135.75,5),(886,19,47.00,3),(886,24,66.93,6),(886,29,32.98,6),(886,34,27.00,1),(886,39,169.75,5),(887,16,28.00,4),(887,21,55.00,3),(887,26,125.00,1),(887,31,22.00,2),(887,40,174.60,6),(888,1,1164.00,6),(888,12,23.50,2),(888,20,15.00,2),(888,28,28.13,6),(888,36,165.00,3),(889,29,34.00,4),(890,38,166.00,2),(891,1,1164.00,5),(891,6,635.00,2),(891,11,1650.00,1),(891,16,28.00,1),(891,21,55.00,3),(891,26,121.25,6),(891,31,22.00,4),(891,36,165.00,1),(892,35,39.00,4),(893,9,33.00,1),(893,22,82.00,4),(893,35,37.83,5),(894,1,1200.00,3),(894,38,166.00,2),(895,1,1200.00,2),(895,6,615.95,6),(895,11,1600.50,6),(895,28,28.13,5),(895,33,19.00,3),(895,38,166.00,1),(896,1,1164.00,5),(896,9,33.00,1),(896,17,45.00,4),(896,29,34.00,1),(896,37,189.00,3),(897,10,36.00,1),(897,16,27.16,5),(897,22,79.54,6),(897,28,29.00,2),(897,34,27.00,2),(897,40,174.60,6),(898,26,121.25,6),(899,1,1200.00,3),(899,14,139.95,4),(899,19,45.59,5),(899,24,69.00,4),(899,29,34.00,3),(899,34,26.19,5),(899,39,175.00,1),(900,1,1200.00,1),(900,11,1650.00,3),(900,21,53.35,6),(900,31,21.34,5),(901,1,1200.00,2),(901,9,33.00,1),(901,31,22.00,2),(901,39,175.00,4),(902,2,1800.00,4),(902,22,79.54,5),(903,1,1200.00,3),(903,9,32.01,6),(903,17,43.65,5),(903,25,134.83,5),(903,40,180.00,3),(904,1,1164.00,6),(904,9,33.00,4),(904,17,45.00,1),(904,30,45.00,4),(904,38,166.00,2),(905,1,1200.00,2),(905,10,36.00,4),(905,15,4.99,4),(905,20,14.55,6),(905,25,134.83,5),(905,30,45.00,3),(905,35,37.83,5),(905,40,180.00,4),(906,1,1200.00,2),(906,7,49.00,1),(906,13,67.50,4),(906,19,47.00,4),(906,25,139.00,1),(906,39,175.00,2),(907,9,33.00,3),(907,22,79.54,6),(907,35,39.00,1),(908,1,1200.00,1),(908,19,45.59,5),(908,32,32.00,1),(909,1,1200.00,1),(909,11,1650.00,4),(909,21,55.00,1),(909,33,18.43,5),(910,1,1200.00,1),(910,6,615.95,5),(910,11,1650.00,3),(910,16,27.16,5),(910,21,53.35,6),(910,26,121.25,5),(910,31,22.00,2),(910,36,165.00,2),(911,14,135.75,5),(911,34,27.00,1),(912,1,1164.00,5),(912,7,49.00,4),(912,22,82.00,2),(912,28,29.00,4),(912,34,27.00,3),(912,40,180.00,4),(913,1,1200.00,2),(913,28,28.13,5),(914,21,55.00,1),(915,16,28.00,1),(916,7,49.00,1),(916,13,65.47,5),(916,19,45.59,5),(916,25,134.83,6),(916,31,22.00,1),(916,37,189.00,2),(917,1,1200.00,4),(917,9,33.00,1),(917,17,43.65,6),(917,25,134.83,5),(917,35,39.00,1),(918,36,165.00,4),(919,1,1200.00,1),(919,6,615.95,5),(919,11,1650.00,1),(919,22,82.00,2),(919,27,23.28,5),(919,32,31.04,6),(919,37,183.33,6),(920,5,7.23,5),(921,1,1200.00,4),(921,11,1650.00,1),(921,21,55.00,2),(921,31,22.00,1),(922,1,1164.00,5),(922,9,33.00,4),(922,17,45.00,3),(922,25,139.00,2),(922,33,18.43,6),(923,5,7.45,2),(923,10,34.92,6),(923,15,4.99,2),(923,20,15.00,4),(923,25,139.00,4),(923,30,43.65,6),(923,35,39.00,3),(924,1,1200.00,3),(924,39,175.00,1),(925,6,635.00,2),(925,12,22.80,6),(925,18,179.00,4),(925,24,66.93,6),(925,30,43.65,5),(925,36,165.00,1),(926,1,1200.00,4),(926,6,635.00,4),(926,20,15.00,2),(926,25,134.83,6),(926,30,45.00,2),(926,35,37.83,5),(926,40,180.00,1),(927,8,50.00,1),(927,16,27.16,6),(927,24,66.93,5),(927,32,32.00,1),(927,40,174.60,5),(928,7,47.53,6),(928,17,43.65,5),(928,27,24.00,1),(928,37,183.33,5),(929,1,1200.00,3),(929,14,139.95,1),(929,36,160.05,6),(930,20,15.00,1),(931,20,15.00,3),(931,40,180.00,1),(932,1,1200.00,1),(932,17,45.00,2),(932,30,45.00,4),(933,1,1164.00,6),(933,27,24.00,2),(934,7,49.00,2),(934,15,4.84,6),(934,31,22.00,4),(934,39,175.00,4),(935,1,1200.00,3),(935,11,1650.00,1),(935,22,82.00,2),(935,32,32.00,3),(936,1,1164.00,5),(936,9,33.00,4),(936,20,15.00,1),(936,28,29.00,2),(936,36,165.00,1),(937,1,1164.00,6),(937,7,49.00,3),(937,13,67.50,1),(937,19,47.00,1),(937,31,22.00,3),(937,37,189.00,1),(938,1,1164.00,5),(938,7,49.00,3),(938,13,67.50,2),(938,19,45.59,6),(938,31,22.00,4),(939,6,635.00,1),(939,14,139.95,2),(939,22,79.54,5),(939,30,43.65,6),(939,38,166.00,2),(940,1,1200.00,2),(940,6,635.00,2),(940,11,1650.00,4),(940,16,28.00,4),(940,21,55.00,2),(940,26,121.25,5),(940,34,26.19,6),(940,39,169.75,6),(941,1,1200.00,2),(941,6,635.00,1),(941,11,1650.00,2),(941,16,28.00,2),(941,29,34.00,3),(941,34,27.00,2),(941,39,169.75,5),(942,1,1200.00,2),(942,14,135.75,6),(942,38,166.00,4),(943,1,1200.00,1),(943,9,33.00,1),(943,17,45.00,1),(943,26,121.25,6),(943,34,27.00,2),(944,1,1164.00,6),(944,9,33.00,3),(944,17,43.65,6),(944,32,32.00,2),(944,40,180.00,2);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderNumber` int NOT NULL DEFAULT '0',
  `OrderDate` date DEFAULT NULL,
  `ShipDate` date DEFAULT NULL,
  `CustomerID` int DEFAULT '0',
  `EmployeeID` int DEFAULT '0',
  PRIMARY KEY (`OrderNumber`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `Orders_FK00` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `Orders_FK01` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2012-09-01','2012-09-04',1018,707),(2,'2012-09-01','2012-09-03',1001,703),(3,'2012-09-01','2012-09-04',1002,707),(4,'2012-09-01','2012-09-03',1009,703),(5,'2012-09-01','2012-09-01',1024,708),(6,'2012-09-01','2012-09-05',1014,702),(7,'2012-09-01','2012-09-04',1001,708),(8,'2012-09-01','2012-09-01',1003,703),(9,'2012-09-01','2012-09-04',1007,708),(10,'2012-09-01','2012-09-04',1012,701),(11,'2012-09-02','2012-09-04',1020,706),(12,'2012-09-02','2012-09-05',1024,706),(13,'2012-09-02','2012-09-02',1024,704),(14,'2012-09-02','2012-09-03',1013,704),(15,'2012-09-02','2012-09-06',1004,701),(16,'2012-09-02','2012-09-06',1001,707),(17,'2012-09-02','2012-09-03',1014,702),(18,'2012-09-02','2012-09-03',1016,708),(19,'2012-09-02','2012-09-06',1027,707),(20,'2012-09-02','2012-09-02',1011,706),(21,'2012-09-03','2012-09-03',1014,702),(22,'2012-09-03','2012-09-07',1026,702),(23,'2012-09-03','2012-09-04',1017,705),(24,'2012-09-03','2012-09-05',1010,705),(25,'2012-09-03','2012-09-04',1017,708),(26,'2012-09-04','2012-09-08',1013,707),(27,'2012-09-04','2012-09-05',1014,703),(28,'2012-09-04','2012-09-08',1004,703),(29,'2012-09-04','2012-09-08',1015,707),(30,'2012-09-04','2012-09-08',1010,708),(31,'2012-09-05','2012-09-09',1014,701),(32,'2012-09-05','2012-09-09',1012,704),(33,'2012-09-05','2012-09-06',1024,704),(34,'2012-09-06','2012-09-07',1010,705),(35,'2012-09-06','2012-09-06',1012,701),(36,'2012-09-06','2012-09-07',1007,705),(37,'2012-09-07','2012-09-11',1027,702),(38,'2012-09-07','2012-09-11',1017,702),(39,'2012-09-07','2012-09-10',1004,704),(40,'2012-09-07','2012-09-07',1017,703),(41,'2012-09-07','2012-09-07',1008,706),(42,'2012-09-07','2012-09-10',1012,704),(43,'2012-09-07','2012-09-11',1020,705),(44,'2012-09-07','2012-09-08',1005,701),(45,'2012-09-08','2012-09-08',1008,708),(46,'2012-09-08','2012-09-09',1018,707),(47,'2012-09-08','2012-09-10',1023,708),(48,'2012-09-08','2012-09-11',1004,707),(49,'2012-09-08','2012-09-08',1015,704),(50,'2012-09-08','2012-09-12',1002,704),(51,'2012-09-08','2012-09-08',1018,707),(52,'2012-09-09','2012-09-11',1001,701),(53,'2012-09-09','2012-09-09',1004,706),(54,'2012-09-09','2012-09-09',1007,707),(55,'2012-09-09','2012-09-11',1001,707),(56,'2012-09-09','2012-09-12',1014,702),(57,'2012-09-09','2012-09-10',1009,703),(58,'2012-09-09','2012-09-13',1006,701),(59,'2012-09-09','2012-09-09',1004,704),(60,'2012-09-09','2012-09-13',1013,708),(61,'2012-09-09','2012-09-10',1009,706),(62,'2012-09-10','2012-09-13',1003,703),(63,'2012-09-10','2012-09-13',1023,708),(64,'2012-09-10','2012-09-14',1027,708),(65,'2012-09-10','2012-09-13',1021,703),(66,'2012-09-10','2012-09-11',1026,703),(67,'2012-09-10','2012-09-11',1025,702),(68,'2012-09-11','2012-09-12',1027,702),(69,'2012-09-11','2012-09-13',1021,705),(70,'2012-09-12','2012-09-16',1016,706),(71,'2012-09-12','2012-09-14',1016,708),(72,'2012-09-12','2012-09-16',1003,708),(73,'2012-09-12','2012-09-15',1005,705),(74,'2012-09-12','2012-09-13',1002,703),(75,'2012-09-12','2012-09-14',1014,706),(76,'2012-09-12','2012-09-15',1012,703),(77,'2012-09-12','2012-09-13',1008,706),(78,'2012-09-13','2012-09-16',1007,701),(79,'2012-09-13','2012-09-17',1006,703),(80,'2012-09-13','2012-09-16',1025,708),(81,'2012-09-13','2012-09-13',1006,705),(82,'2012-09-13','2012-09-16',1005,701),(83,'2012-09-13','2012-09-16',1021,708),(84,'2012-09-13','2012-09-13',1022,707),(85,'2012-09-13','2012-09-15',1015,705),(86,'2012-09-13','2012-09-16',1009,701),(87,'2012-09-13','2012-09-14',1002,704),(88,'2012-09-14','2012-09-17',1026,707),(89,'2012-09-14','2012-09-17',1003,703),(90,'2012-09-14','2012-09-15',1017,706),(91,'2012-09-14','2012-09-18',1010,703),(92,'2012-09-14','2012-09-17',1011,704),(93,'2012-09-14','2012-09-17',1023,707),(94,'2012-09-14','2012-09-14',1010,701),(95,'2012-09-15','2012-09-19',1021,704),(96,'2012-09-15','2012-09-16',1025,703),(97,'2012-09-15','2012-09-18',1026,703),(98,'2012-09-15','2012-09-16',1009,706),(99,'2012-09-15','2012-09-18',1002,703),(100,'2012-09-15','2012-09-16',1002,707),(101,'2012-09-15','2012-09-18',1023,707),(102,'2012-09-15','2012-09-17',1010,705),(103,'2012-09-15','2012-09-16',1025,702),(104,'2012-09-15','2012-09-15',1017,708),(105,'2012-09-16','2012-09-18',1005,704),(106,'2012-09-16','2012-09-20',1020,708),(107,'2012-09-16','2012-09-20',1001,703),(108,'2012-09-16','2012-09-19',1004,701),(109,'2012-09-16','2012-09-16',1013,703),(110,'2012-09-17','2012-09-19',1015,708),(111,'2012-09-17','2012-09-21',1021,707),(112,'2012-09-18','2012-09-19',1009,703),(113,'2012-09-18','2012-09-22',1010,702),(114,'2012-09-18','2012-09-22',1011,706),(115,'2012-09-19','2012-09-21',1003,704),(116,'2012-09-19','2012-09-21',1004,701),(117,'2012-09-20','2012-09-22',1005,705),(118,'2012-09-20','2012-09-22',1021,708),(119,'2012-09-20','2012-09-20',1013,701),(120,'2012-09-20','2012-09-21',1024,702),(121,'2012-09-20','2012-09-21',1025,701),(122,'2012-09-20','2012-09-24',1009,707),(123,'2012-09-20','2012-09-22',1004,704),(124,'2012-09-21','2012-09-23',1007,705),(125,'2012-09-21','2012-09-21',1011,707),(126,'2012-09-22','2012-09-24',1016,708),(127,'2012-09-22','2012-09-25',1009,705),(128,'2012-09-22','2012-09-26',1022,708),(129,'2012-09-22','2012-09-22',1007,708),(130,'2012-09-22','2012-09-24',1011,705),(131,'2012-09-22','2012-09-22',1014,706),(132,'2012-09-22','2012-09-25',1007,705),(133,'2012-09-22','2012-09-22',1027,706),(134,'2012-09-22','2012-09-24',1003,703),(135,'2012-09-23','2012-09-26',1005,701),(136,'2012-09-23','2012-09-26',1008,707),(137,'2012-09-23','2012-09-23',1001,706),(138,'2012-09-24','2012-09-27',1001,702),(139,'2012-09-24','2012-09-26',1024,704),(140,'2012-09-24','2012-09-24',1002,706),(141,'2012-09-24','2012-09-27',1014,706),(142,'2012-09-25','2012-09-29',1018,702),(143,'2012-09-25','2012-09-28',1021,706),(144,'2012-09-25','2012-09-29',1018,704),(145,'2012-09-26','2012-09-30',1027,701),(146,'2012-09-26','2012-09-26',1021,708),(147,'2012-09-26','2012-09-26',1026,708),(148,'2012-09-26','2012-09-30',1027,704),(149,'2012-09-27','2012-09-28',1004,707),(150,'2012-09-27','2012-09-27',1024,701),(151,'2012-09-27','2012-09-28',1001,707),(152,'2012-09-28','2012-10-02',1017,704),(153,'2012-09-29','2012-09-30',1003,702),(154,'2012-09-29','2012-10-02',1001,703),(155,'2012-09-29','2012-10-03',1004,703),(156,'2012-09-29','2012-09-30',1004,703),(157,'2012-09-29','2012-10-01',1010,707),(158,'2012-09-29','2012-10-03',1021,705),(159,'2012-09-29','2012-10-03',1005,707),(160,'2012-09-30','2012-09-30',1021,706),(161,'2012-09-30','2012-09-30',1011,707),(162,'2012-09-30','2012-10-01',1021,704),(163,'2012-09-30','2012-09-30',1004,707),(164,'2012-10-01','2012-10-04',1021,707),(165,'2012-10-02','2012-10-02',1017,702),(166,'2012-10-03','2012-10-06',1022,706),(167,'2012-10-03','2012-10-03',1017,706),(168,'2012-10-03','2012-10-05',1027,706),(169,'2012-10-03','2012-10-06',1025,708),(170,'2012-10-04','2012-10-04',1004,704),(171,'2012-10-04','2012-10-05',1026,707),(172,'2012-10-04','2012-10-07',1018,704),(173,'2012-10-04','2012-10-04',1015,704),(174,'2012-10-04','2012-10-08',1006,703),(175,'2012-10-04','2012-10-07',1013,706),(176,'2012-10-04','2012-10-04',1025,701),(177,'2012-10-04','2012-10-08',1008,706),(178,'2012-10-04','2012-10-07',1022,702),(179,'2012-10-04','2012-10-08',1017,708),(180,'2012-10-05','2012-10-08',1015,708),(181,'2012-10-05','2012-10-05',1017,708),(182,'2012-10-05','2012-10-06',1002,702),(183,'2012-10-05','2012-10-05',1020,708),(184,'2012-10-05','2012-10-09',1023,707),(185,'2012-10-05','2012-10-09',1017,702),(186,'2012-10-05','2012-10-05',1002,704),(187,'2012-10-06','2012-10-07',1022,702),(188,'2012-10-06','2012-10-07',1002,706),(189,'2012-10-06','2012-10-07',1012,702),(190,'2012-10-06','2012-10-10',1024,708),(191,'2012-10-06','2012-10-07',1015,701),(192,'2012-10-06','2012-10-09',1022,702),(193,'2012-10-06','2012-10-06',1025,708),(194,'2012-10-06','2012-10-08',1017,708),(195,'2012-10-07','2012-10-10',1025,703),(196,'2012-10-07','2012-10-11',1009,707),(197,'2012-10-07','2012-10-10',1002,703),(198,'2012-10-07','2012-10-09',1002,703),(199,'2012-10-07','2012-10-09',1008,707),(200,'2012-10-07','2012-10-08',1026,706),(201,'2012-10-07','2012-10-08',1018,701),(202,'2012-10-07','2012-10-09',1020,705),(203,'2012-10-08','2012-10-08',1023,708),(204,'2012-10-08','2012-10-08',1026,701),(205,'2012-10-08','2012-10-12',1006,706),(206,'2012-10-08','2012-10-12',1021,704),(207,'2012-10-08','2012-10-10',1015,704),(208,'2012-10-09','2012-10-11',1019,704),(209,'2012-10-10','2012-10-11',1002,703),(210,'2012-10-10','2012-10-12',1024,701),(211,'2012-10-10','2012-10-13',1014,701),(212,'2012-10-10','2012-10-11',1007,704),(213,'2012-10-11','2012-10-12',1001,707),(214,'2012-10-11','2012-10-11',1021,703),(215,'2012-10-11','2012-10-11',1002,708),(216,'2012-10-11','2012-10-11',1016,707),(217,'2012-10-12','2012-10-14',1020,703),(218,'2012-10-12','2012-10-15',1014,707),(219,'2012-10-12','2012-10-13',1018,706),(220,'2012-10-12','2012-10-14',1014,705),(221,'2012-10-12','2012-10-14',1008,705),(222,'2012-10-12','2012-10-16',1007,703),(223,'2012-10-12','2012-10-15',1025,708),(224,'2012-10-12','2012-10-15',1011,705),(225,'2012-10-13','2012-10-13',1017,704),(226,'2012-10-13','2012-10-15',1023,705),(227,'2012-10-14','2012-10-17',1006,704),(228,'2012-10-15','2012-10-15',1017,701),(229,'2012-10-15','2012-10-18',1024,707),(230,'2012-10-15','2012-10-19',1008,708),(231,'2012-10-15','2012-10-17',1016,706),(232,'2012-10-15','2012-10-16',1017,703),(233,'2012-10-16','2012-10-18',1014,708),(234,'2012-10-16','2012-10-19',1010,702),(235,'2012-10-16','2012-10-19',1015,705),(236,'2012-10-17','2012-10-19',1021,704),(237,'2012-10-17','2012-10-19',1027,702),(238,'2012-10-17','2012-10-20',1005,705),(239,'2012-10-17','2012-10-18',1012,703),(240,'2012-10-18','2012-10-18',1022,701),(241,'2012-10-18','2012-10-18',1008,705),(242,'2012-10-18','2012-10-20',1010,705),(243,'2012-10-18','2012-10-21',1020,708),(244,'2012-10-18','2012-10-21',1014,708),(245,'2012-10-18','2012-10-19',1015,704),(246,'2012-10-19','2012-10-22',1004,703),(247,'2012-10-19','2012-10-22',1005,702),(248,'2012-10-19','2012-10-20',1021,705),(249,'2012-10-19','2012-10-22',1016,703),(250,'2012-10-19','2012-10-21',1023,707),(251,'2012-10-19','2012-10-22',1005,705),(252,'2012-10-19','2012-10-20',1010,702),(253,'2012-10-20','2012-10-20',1024,706),(254,'2012-10-21','2012-10-25',1002,703),(255,'2012-10-21','2012-10-21',1008,707),(256,'2012-10-21','2012-10-21',1016,705),(257,'2012-10-21','2012-10-21',1007,708),(258,'2012-10-22','2012-10-22',1016,705),(259,'2012-10-22','2012-10-22',1009,702),(260,'2012-10-22','2012-10-22',1006,701),(261,'2012-10-22','2012-10-26',1020,708),(262,'2012-10-22','2012-10-24',1020,707),(263,'2012-10-22','2012-10-25',1011,705),(264,'2012-10-22','2012-10-22',1002,702),(265,'2012-10-22','2012-10-25',1014,702),(266,'2012-10-22','2012-10-26',1021,708),(267,'2012-10-22','2012-10-23',1004,706),(268,'2012-10-23','2012-10-24',1021,704),(269,'2012-10-23','2012-10-24',1016,706),(270,'2012-10-23','2012-10-26',1007,703),(271,'2012-10-24','2012-10-24',1010,702),(272,'2012-10-24','2012-10-26',1005,701),(273,'2012-10-24','2012-10-24',1024,704),(274,'2012-10-24','2012-10-26',1004,703),(275,'2012-10-24','2012-10-28',1009,701),(276,'2012-10-24','2012-10-24',1018,702),(277,'2012-10-24','2012-10-24',1012,701),(278,'2012-10-24','2012-10-25',1024,707),(279,'2012-10-25','2012-10-29',1017,706),(280,'2012-10-25','2012-10-27',1016,702),(281,'2012-10-25','2012-10-27',1006,708),(282,'2012-10-26','2012-10-28',1005,702),(283,'2012-10-26','2012-10-27',1015,702),(284,'2012-10-26','2012-10-30',1016,701),(285,'2012-10-26','2012-10-27',1024,705),(286,'2012-10-26','2012-10-27',1019,705),(287,'2012-10-26','2012-10-29',1018,708),(288,'2012-10-26','2012-10-30',1027,704),(289,'2012-10-27','2012-10-31',1002,708),(290,'2012-10-28','2012-10-28',1018,706),(291,'2012-10-28','2012-11-01',1025,705),(292,'2012-10-28','2012-10-28',1013,708),(293,'2012-10-28','2012-10-29',1025,706),(294,'2012-10-29','2012-10-30',1017,706),(295,'2012-10-29','2012-10-29',1012,701),(296,'2012-10-29','2012-10-29',1014,707),(297,'2012-10-29','2012-11-01',1008,701),(298,'2012-10-29','2012-11-01',1005,701),(299,'2012-10-30','2012-11-03',1021,704),(300,'2012-10-30','2012-10-30',1011,706),(301,'2012-10-30','2012-11-03',1025,704),(302,'2012-10-30','2012-11-01',1007,702),(303,'2012-10-31','2012-11-03',1011,705),(304,'2012-10-31','2012-11-04',1015,701),(305,'2012-10-31','2012-11-04',1013,708),(306,'2012-10-31','2012-11-02',1026,701),(307,'2012-10-31','2012-11-01',1013,704),(308,'2012-10-31','2012-11-01',1002,701),(309,'2012-10-31','2012-11-03',1020,707),(310,'2012-10-31','2012-11-02',1025,703),(311,'2012-11-01','2012-11-03',1003,708),(312,'2012-11-01','2012-11-01',1003,707),(313,'2012-11-01','2012-11-01',1024,701),(314,'2012-11-01','2012-11-03',1007,706),(315,'2012-11-01','2012-11-05',1024,702),(316,'2012-11-01','2012-11-05',1018,705),(317,'2012-11-01','2012-11-01',1012,703),(318,'2012-11-01','2012-11-02',1024,703),(319,'2012-11-02','2012-11-03',1005,701),(320,'2012-11-02','2012-11-06',1001,707),(321,'2012-11-02','2012-11-04',1011,701),(322,'2012-11-02','2012-11-03',1001,701),(323,'2012-11-02','2012-11-04',1011,706),(324,'2012-11-02','2012-11-03',1016,704),(325,'2012-11-02','2012-11-03',1002,706),(326,'2012-11-02','2012-11-06',1024,704),(327,'2012-11-02','2012-11-02',1012,703),(328,'2012-11-02','2012-11-05',1009,702),(329,'2012-11-03','2012-11-05',1004,708),(330,'2012-11-03','2012-11-06',1021,708),(331,'2012-11-03','2012-11-05',1018,702),(332,'2012-11-04','2012-11-04',1006,704),(333,'2012-11-04','2012-11-06',1003,708),(334,'2012-11-04','2012-11-08',1009,707),(335,'2012-11-04','2012-11-05',1020,703),(336,'2012-11-05','2012-11-06',1020,703),(337,'2012-11-05','2012-11-06',1011,706),(338,'2012-11-05','2012-11-05',1009,708),(339,'2012-11-05','2012-11-09',1005,705),(340,'2012-11-05','2012-11-09',1026,707),(341,'2012-11-06','2012-11-07',1022,704),(342,'2012-11-07','2012-11-09',1013,702),(343,'2012-11-07','2012-11-10',1025,708),(344,'2012-11-07','2012-11-11',1005,702),(345,'2012-11-07','2012-11-10',1008,701),(346,'2012-11-07','2012-11-11',1001,702),(347,'2012-11-08','2012-11-08',1020,705),(348,'2012-11-08','2012-11-10',1015,703),(349,'2012-11-08','2012-11-09',1001,703),(350,'2012-11-08','2012-11-10',1019,703),(351,'2012-11-09','2012-11-13',1012,704),(352,'2012-11-09','2012-11-10',1020,706),(353,'2012-11-09','2012-11-13',1026,704),(354,'2012-11-10','2012-11-11',1021,706),(355,'2012-11-10','2012-11-11',1014,702),(356,'2012-11-10','2012-11-14',1018,702),(357,'2012-11-10','2012-11-12',1003,705),(358,'2012-11-10','2012-11-14',1012,701),(359,'2012-11-11','2012-11-12',1024,707),(360,'2012-11-11','2012-11-13',1013,707),(361,'2012-11-11','2012-11-12',1016,706),(362,'2012-11-11','2012-11-12',1012,701),(363,'2012-11-11','2012-11-12',1010,706),(364,'2012-11-11','2012-11-14',1010,705),(365,'2012-11-11','2012-11-12',1011,705),(366,'2012-11-11','2012-11-12',1004,708),(367,'2012-11-11','2012-11-11',1011,703),(368,'2012-11-12','2012-11-13',1017,708),(369,'2012-11-12','2012-11-13',1003,707),(370,'2012-11-12','2012-11-12',1025,708),(371,'2012-11-12','2012-11-15',1009,701),(372,'2012-11-12','2012-11-14',1025,707),(373,'2012-11-12','2012-11-15',1014,701),(374,'2012-11-12','2012-11-12',1005,701),(375,'2012-11-13','2012-11-15',1004,704),(376,'2012-11-13','2012-11-13',1015,704),(377,'2012-11-13','2012-11-17',1019,705),(378,'2012-11-13','2012-11-14',1014,707),(379,'2012-11-13','2012-11-17',1025,706),(380,'2012-11-13','2012-11-16',1023,704),(381,'2012-11-14','2012-11-16',1012,701),(382,'2012-11-15','2012-11-15',1017,705),(383,'2012-11-16','2012-11-19',1017,702),(384,'2012-11-16','2012-11-16',1021,708),(385,'2012-11-17','2012-11-20',1019,701),(386,'2012-11-17','2012-11-17',1021,705),(387,'2012-11-17','2012-11-21',1010,708),(388,'2012-11-17','2012-11-21',1008,705),(389,'2012-11-17','2012-11-20',1005,706),(390,'2012-11-17','2012-11-20',1016,708),(391,'2012-11-17','2012-11-17',1024,702),(392,'2012-11-17','2012-11-21',1006,708),(393,'2012-11-18','2012-11-20',1011,704),(394,'2012-11-18','2012-11-21',1001,702),(395,'2012-11-19','2012-11-23',1014,703),(396,'2012-11-19','2012-11-20',1019,706),(397,'2012-11-19','2012-11-19',1020,701),(398,'2012-11-20','2012-11-22',1004,708),(399,'2012-11-20','2012-11-23',1007,704),(400,'2012-11-20','2012-11-24',1026,705),(401,'2012-11-20','2012-11-21',1003,702),(402,'2012-11-20','2012-11-22',1017,704),(403,'2012-11-20','2012-11-20',1006,702),(404,'2012-11-20','2012-11-21',1019,708),(405,'2012-11-20','2012-11-23',1023,702),(406,'2012-11-21','2012-11-25',1012,706),(407,'2012-11-22','2012-11-25',1001,701),(408,'2012-11-23','2012-11-27',1001,703),(409,'2012-11-23','2012-11-24',1024,704),(410,'2012-11-23','2012-11-24',1008,702),(411,'2012-11-24','2012-11-25',1002,708),(412,'2012-11-24','2012-11-27',1026,708),(413,'2012-11-24','2012-11-25',1001,708),(414,'2012-11-24','2012-11-28',1020,703),(415,'2012-11-24','2012-11-27',1013,705),(416,'2012-11-24','2012-11-25',1024,705),(417,'2012-11-24','2012-11-27',1017,703),(418,'2012-11-24','2012-11-24',1012,705),(419,'2012-11-25','2012-11-25',1006,708),(420,'2012-11-25','2012-11-25',1024,704),(421,'2012-11-25','2012-11-28',1022,704),(422,'2012-11-25','2012-11-26',1027,707),(423,'2012-11-25','2012-11-29',1010,708),(424,'2012-11-25','2012-11-27',1025,706),(425,'2012-11-26','2012-11-30',1001,707),(426,'2012-11-26','2012-11-29',1001,707),(427,'2012-11-26','2012-11-29',1020,702),(428,'2012-11-26','2012-11-27',1024,703),(429,'2012-11-26','2012-11-29',1016,701),(430,'2012-11-26','2012-11-30',1009,707),(431,'2012-11-27','2012-11-30',1016,705),(432,'2012-11-27','2012-11-30',1022,702),(433,'2012-11-27','2012-11-27',1017,708),(434,'2012-11-27','2012-11-29',1012,703),(435,'2012-11-27','2012-11-29',1016,706),(436,'2012-11-27','2012-11-30',1014,703),(437,'2012-11-27','2012-11-29',1002,705),(438,'2012-11-27','2012-12-01',1020,708),(439,'2012-11-28','2012-12-02',1025,703),(440,'2012-11-28','2012-11-29',1027,708),(441,'2012-11-28','2012-11-28',1010,701),(442,'2012-11-28','2012-12-01',1002,705),(443,'2012-11-29','2012-12-02',1001,704),(444,'2012-11-29','2012-11-30',1002,706),(445,'2012-11-29','2012-11-30',1007,705),(446,'2012-11-29','2012-12-03',1010,708),(447,'2012-11-29','2012-11-30',1018,702),(448,'2012-11-29','2012-12-01',1001,701),(449,'2012-11-29','2012-11-29',1025,707),(450,'2012-11-30','2012-12-04',1004,705),(451,'2012-11-30','2012-12-02',1003,706),(452,'2012-11-30','2012-12-02',1001,702),(453,'2012-11-30','2012-12-04',1027,708),(454,'2012-11-30','2012-12-02',1010,703),(455,'2012-11-30','2012-12-01',1005,702),(456,'2012-12-01','2012-12-02',1015,705),(457,'2012-12-01','2012-12-05',1019,701),(458,'2012-12-02','2012-12-02',1003,702),(459,'2012-12-02','2012-12-03',1007,707),(460,'2012-12-03','2012-12-05',1013,704),(461,'2012-12-03','2012-12-07',1021,703),(462,'2012-12-03','2012-12-03',1004,705),(463,'2012-12-04','2012-12-07',1015,705),(464,'2012-12-04','2012-12-07',1020,705),(465,'2012-12-04','2012-12-04',1012,706),(466,'2012-12-05','2012-12-06',1026,704),(467,'2012-12-05','2012-12-05',1013,706),(468,'2012-12-05','2012-12-06',1010,708),(469,'2012-12-05','2012-12-05',1011,708),(470,'2012-12-05','2012-12-08',1014,703),(471,'2012-12-05','2012-12-07',1025,701),(472,'2012-12-05','2012-12-09',1023,707),(473,'2012-12-05','2012-12-08',1016,702),(474,'2012-12-05','2012-12-08',1006,703),(475,'2012-12-06','2012-12-10',1001,702),(476,'2012-12-06','2012-12-10',1014,705),(477,'2012-12-06','2012-12-06',1009,708),(478,'2012-12-06','2012-12-10',1004,707),(479,'2012-12-06','2012-12-09',1024,705),(480,'2012-12-06','2012-12-06',1011,703),(481,'2012-12-07','2012-12-10',1009,702),(482,'2012-12-07','2012-12-07',1011,705),(483,'2012-12-07','2012-12-08',1005,704),(484,'2012-12-08','2012-12-09',1021,707),(485,'2012-12-08','2012-12-10',1003,707),(486,'2012-12-08','2012-12-09',1022,705),(487,'2012-12-08','2012-12-10',1009,704),(488,'2012-12-08','2012-12-10',1025,703),(489,'2012-12-08','2012-12-08',1005,701),(490,'2012-12-08','2012-12-10',1009,702),(491,'2012-12-08','2012-12-09',1007,708),(492,'2012-12-09','2012-12-11',1008,702),(493,'2012-12-09','2012-12-13',1005,708),(494,'2012-12-09','2012-12-13',1012,701),(495,'2012-12-09','2012-12-10',1012,702),(496,'2012-12-10','2012-12-10',1014,701),(497,'2012-12-10','2012-12-11',1002,701),(498,'2012-12-10','2012-12-12',1018,708),(499,'2012-12-10','2012-12-14',1016,704),(500,'2012-12-10','2012-12-10',1007,705),(501,'2012-12-11','2012-12-14',1001,702),(502,'2012-12-11','2012-12-14',1025,707),(503,'2012-12-11','2012-12-13',1026,706),(504,'2012-12-11','2012-12-14',1004,707),(505,'2012-12-11','2012-12-15',1006,707),(506,'2012-12-11','2012-12-13',1016,704),(507,'2012-12-11','2012-12-11',1017,705),(508,'2012-12-11','2012-12-14',1012,704),(509,'2012-12-12','2012-12-13',1010,701),(510,'2012-12-12','2012-12-13',1015,703),(511,'2012-12-12','2012-12-12',1026,706),(512,'2012-12-12','2012-12-14',1027,708),(513,'2012-12-12','2012-12-15',1012,707),(514,'2012-12-12','2012-12-14',1025,705),(515,'2012-12-12','2012-12-15',1003,705),(516,'2012-12-12','2012-12-16',1021,703),(517,'2012-12-13','2012-12-15',1007,706),(518,'2012-12-13','2012-12-14',1007,704),(519,'2012-12-13','2012-12-15',1018,701),(520,'2012-12-13','2012-12-17',1027,704),(521,'2012-12-13','2012-12-17',1009,708),(522,'2012-12-13','2012-12-17',1009,708),(523,'2012-12-14','2012-12-16',1003,704),(524,'2012-12-15','2012-12-19',1002,701),(525,'2012-12-15','2012-12-18',1019,705),(526,'2012-12-15','2012-12-18',1011,705),(527,'2012-12-15','2012-12-19',1009,707),(528,'2012-12-16','2012-12-17',1026,701),(529,'2012-12-16','2012-12-18',1013,703),(530,'2012-12-16','2012-12-18',1009,701),(531,'2012-12-16','2012-12-16',1012,707),(532,'2012-12-17','2012-12-18',1027,706),(533,'2012-12-17','2012-12-20',1017,702),(534,'2012-12-17','2012-12-17',1017,706),(535,'2012-12-17','2012-12-18',1020,703),(536,'2012-12-17','2012-12-20',1020,702),(537,'2012-12-17','2012-12-20',1003,703),(538,'2012-12-18','2012-12-19',1008,703),(539,'2012-12-19','2012-12-23',1008,701),(540,'2012-12-19','2012-12-23',1007,707),(541,'2012-12-20','2012-12-22',1006,701),(542,'2012-12-21','2012-12-24',1008,704),(543,'2012-12-21','2012-12-24',1005,707),(544,'2012-12-21','2012-12-21',1009,704),(545,'2012-12-21','2012-12-25',1010,707),(546,'2012-12-21','2012-12-21',1013,702),(547,'2012-12-21','2012-12-21',1011,708),(548,'2012-12-21','2012-12-23',1004,707),(549,'2012-12-21','2012-12-21',1024,703),(550,'2012-12-22','2012-12-24',1003,706),(551,'2012-12-23','2012-12-27',1010,705),(552,'2012-12-23','2012-12-26',1023,705),(553,'2012-12-23','2012-12-27',1002,705),(554,'2012-12-23','2012-12-24',1002,701),(555,'2012-12-23','2012-12-26',1003,703),(556,'2012-12-23','2012-12-27',1019,701),(557,'2012-12-23','2012-12-23',1026,702),(558,'2012-12-24','2012-12-25',1009,708),(559,'2012-12-24','2012-12-26',1011,706),(560,'2012-12-24','2012-12-28',1016,707),(561,'2012-12-24','2012-12-27',1025,704),(562,'2012-12-24','2012-12-27',1006,705),(563,'2012-12-24','2012-12-25',1020,704),(564,'2012-12-24','2012-12-26',1001,706),(565,'2012-12-25','2012-12-27',1014,705),(566,'2012-12-25','2012-12-26',1007,706),(567,'2012-12-25','2012-12-27',1001,703),(568,'2012-12-25','2012-12-26',1024,704),(569,'2012-12-25','2012-12-27',1004,707),(570,'2012-12-25','2012-12-29',1022,707),(571,'2012-12-26','2012-12-29',1019,704),(572,'2012-12-26','2012-12-26',1003,703),(573,'2012-12-26','2012-12-28',1019,701),(574,'2012-12-26','2012-12-26',1003,704),(575,'2012-12-26','2012-12-30',1027,707),(576,'2012-12-27','2012-12-27',1005,705),(577,'2012-12-27','2012-12-27',1014,706),(578,'2012-12-27','2012-12-28',1026,708),(579,'2012-12-27','2012-12-31',1012,707),(580,'2012-12-27','2012-12-27',1011,705),(581,'2012-12-28','2012-12-28',1003,704),(582,'2012-12-28','2012-12-31',1004,703),(583,'2012-12-28','2012-12-28',1003,702),(584,'2012-12-29','2012-12-31',1004,707),(585,'2012-12-29','2012-12-29',1009,704),(586,'2012-12-29','2012-12-30',1023,707),(587,'2012-12-29','2013-01-02',1001,701),(588,'2012-12-29','2012-12-29',1003,701),(589,'2012-12-29','2012-12-29',1013,708),(590,'2012-12-29','2013-01-02',1018,708),(591,'2012-12-30','2013-01-02',1023,702),(592,'2012-12-30','2013-01-01',1005,707),(593,'2012-12-30','2013-01-02',1026,701),(594,'2012-12-30','2012-12-30',1017,706),(595,'2012-12-31','2013-01-03',1015,703),(596,'2012-12-31','2013-01-04',1001,702),(597,'2012-12-31','2012-12-31',1006,707),(598,'2012-12-31','2013-01-01',1013,701),(599,'2013-01-01','2013-01-01',1011,703),(600,'2013-01-01','2013-01-05',1006,704),(601,'2013-01-01','2013-01-02',1011,706),(602,'2013-01-01','2013-01-05',1025,708),(603,'2013-01-01','2013-01-03',1015,707),(604,'2013-01-01','2013-01-02',1006,702),(605,'2013-01-01','2013-01-02',1020,701),(606,'2013-01-02','2013-01-03',1007,702),(607,'2013-01-02','2013-01-05',1012,704),(608,'2013-01-02','2013-01-06',1001,706),(609,'2013-01-02','2013-01-06',1017,705),(610,'2013-01-02','2013-01-02',1020,704),(611,'2013-01-02','2013-01-04',1005,706),(612,'2013-01-02','2013-01-03',1005,705),(613,'2013-01-03','2013-01-05',1015,706),(614,'2013-01-04','2013-01-05',1004,704),(615,'2013-01-05','2013-01-06',1027,707),(616,'2013-01-05','2013-01-06',1022,705),(617,'2013-01-05','2013-01-05',1012,702),(618,'2013-01-05','2013-01-09',1026,707),(619,'2013-01-05','2013-01-06',1008,707),(620,'2013-01-05','2013-01-07',1023,702),(621,'2013-01-05','2013-01-08',1007,707),(622,'2013-01-06','2013-01-06',1002,707),(623,'2013-01-06','2013-01-08',1007,708),(624,'2013-01-06','2013-01-09',1014,701),(625,'2013-01-06','2013-01-08',1006,708),(626,'2013-01-06','2013-01-10',1023,702),(627,'2013-01-06','2013-01-08',1027,705),(628,'2013-01-06','2013-01-07',1026,704),(629,'2013-01-07','2013-01-11',1014,704),(630,'2013-01-07','2013-01-09',1026,702),(631,'2013-01-07','2013-01-07',1012,707),(632,'2013-01-07','2013-01-11',1001,706),(633,'2013-01-07','2013-01-09',1021,705),(634,'2013-01-07','2013-01-11',1002,703),(635,'2013-01-07','2013-01-10',1002,703),(636,'2013-01-07','2013-01-10',1002,703),(637,'2013-01-07','2013-01-10',1008,702),(638,'2013-01-07','2013-01-09',1003,705),(639,'2013-01-08','2013-01-10',1019,705),(640,'2013-01-08','2013-01-11',1008,706),(641,'2013-01-08','2013-01-11',1012,701),(642,'2013-01-08','2013-01-10',1012,708),(643,'2013-01-08','2013-01-11',1011,701),(644,'2013-01-08','2013-01-09',1021,706),(645,'2013-01-08','2013-01-12',1024,703),(646,'2013-01-08','2013-01-09',1017,705),(647,'2013-01-09','2013-01-13',1014,703),(648,'2013-01-09','2013-01-10',1015,701),(649,'2013-01-09','2013-01-13',1001,707),(650,'2013-01-09','2013-01-09',1005,706),(651,'2013-01-09','2013-01-12',1025,704),(652,'2013-01-10','2013-01-10',1024,701),(653,'2013-01-10','2013-01-13',1015,701),(654,'2013-01-10','2013-01-14',1024,704),(655,'2013-01-10','2013-01-14',1007,701),(656,'2013-01-10','2013-01-10',1024,707),(657,'2013-01-10','2013-01-13',1001,706),(658,'2013-01-10','2013-01-10',1010,701),(659,'2013-01-10','2013-01-12',1023,705),(660,'2013-01-11','2013-01-14',1027,702),(661,'2013-01-11','2013-01-15',1011,706),(662,'2013-01-11','2013-01-13',1006,706),(663,'2013-01-11','2013-01-14',1025,707),(664,'2013-01-11','2013-01-11',1015,707),(665,'2013-01-11','2013-01-11',1020,704),(666,'2013-01-11','2013-01-13',1012,707),(667,'2013-01-11','2013-01-14',1009,708),(668,'2013-01-11','2013-01-14',1018,708),(669,'2013-01-11','2013-01-14',1017,708),(670,'2013-01-12','2013-01-16',1021,701),(671,'2013-01-12','2013-01-12',1008,707),(672,'2013-01-12','2013-01-15',1005,707),(673,'2013-01-12','2013-01-12',1026,708),(674,'2013-01-12','2013-01-12',1016,705),(675,'2013-01-12','2013-01-13',1016,702),(676,'2013-01-12','2013-01-15',1002,701),(677,'2013-01-13','2013-01-16',1005,708),(678,'2013-01-13','2013-01-16',1013,704),(679,'2013-01-13','2013-01-14',1026,707),(680,'2013-01-13','2013-01-16',1013,703),(681,'2013-01-13','2013-01-14',1015,702),(682,'2013-01-13','2013-01-15',1018,704),(683,'2013-01-13','2013-01-13',1018,702),(684,'2013-01-14','2013-01-17',1027,708),(685,'2013-01-14','2013-01-15',1005,704),(686,'2013-01-14','2013-01-18',1026,701),(687,'2013-01-14','2013-01-16',1021,705),(688,'2013-01-14','2013-01-18',1002,702),(689,'2013-01-14','2013-01-15',1015,705),(690,'2013-01-14','2013-01-14',1016,702),(691,'2013-01-14','2013-01-18',1004,707),(692,'2013-01-15','2013-01-18',1019,701),(693,'2013-01-15','2013-01-18',1002,705),(694,'2013-01-15','2013-01-16',1019,708),(695,'2013-01-15','2013-01-17',1010,708),(696,'2013-01-15','2013-01-16',1002,708),(697,'2013-01-15','2013-01-15',1005,704),(698,'2013-01-16','2013-01-17',1022,705),(699,'2013-01-17','2013-01-18',1013,701),(700,'2013-01-17','2013-01-17',1013,707),(701,'2013-01-17','2013-01-19',1001,707),(702,'2013-01-17','2013-01-20',1020,704),(703,'2013-01-17','2013-01-19',1007,704),(704,'2013-01-17','2013-01-21',1024,704),(705,'2013-01-17','2013-01-20',1015,706),(706,'2013-01-17','2013-01-17',1016,703),(707,'2013-01-17','2013-01-18',1002,707),(708,'2013-01-18','2013-01-21',1009,708),(709,'2013-01-18','2013-01-18',1018,702),(710,'2013-01-19','2013-01-21',1007,702),(711,'2013-01-19','2013-01-21',1019,704),(712,'2013-01-19','2013-01-22',1024,705),(713,'2013-01-19','2013-01-23',1007,701),(714,'2013-01-19','2013-01-23',1019,707),(715,'2013-01-19','2013-01-23',1020,707),(716,'2013-01-20','2013-01-24',1016,701),(717,'2013-01-20','2013-01-20',1008,701),(718,'2013-01-20','2013-01-21',1010,705),(719,'2013-01-20','2013-01-23',1027,703),(720,'2013-01-21','2013-01-25',1010,707),(721,'2013-01-21','2013-01-22',1015,705),(722,'2013-01-21','2013-01-22',1006,703),(723,'2013-01-21','2013-01-24',1001,707),(724,'2013-01-22','2013-01-22',1017,704),(725,'2013-01-22','2013-01-24',1009,702),(726,'2013-01-22','2013-01-26',1015,703),(727,'2013-01-22','2013-01-23',1017,706),(728,'2013-01-22','2013-01-24',1008,706),(729,'2013-01-22','2013-01-24',1021,704),(730,'2013-01-22','2013-01-24',1023,706),(731,'2013-01-22','2013-01-26',1014,702),(732,'2013-01-23','2013-01-25',1001,707),(733,'2013-01-23','2013-01-24',1011,706),(734,'2013-01-24','2013-01-26',1016,706),(735,'2013-01-24','2013-01-24',1027,708),(736,'2013-01-24','2013-01-28',1003,708),(737,'2013-01-24','2013-01-27',1020,708),(738,'2013-01-24','2013-01-26',1017,704),(739,'2013-01-24','2013-01-25',1022,703),(740,'2013-01-25','2013-01-26',1011,708),(741,'2013-01-25','2013-01-25',1024,707),(742,'2013-01-25','2013-01-28',1013,706),(743,'2013-01-25','2013-01-27',1008,708),(744,'2013-01-25','2013-01-28',1027,703),(745,'2013-01-25','2013-01-29',1027,706),(746,'2013-01-25','2013-01-29',1013,702),(747,'2013-01-25','2013-01-28',1016,703),(748,'2013-01-25','2013-01-28',1021,703),(749,'2013-01-25','2013-01-29',1021,702),(750,'2013-01-26','2013-01-30',1018,708),(751,'2013-01-26','2013-01-30',1025,707),(752,'2013-01-27','2013-01-31',1005,702),(753,'2013-01-27','2013-01-29',1013,701),(754,'2013-01-27','2013-01-31',1014,708),(755,'2013-01-28','2013-01-31',1010,708),(756,'2013-01-28','2013-01-28',1005,706),(757,'2013-01-28','2013-01-30',1014,702),(758,'2013-01-28','2013-01-30',1020,708),(759,'2013-01-28','2013-01-28',1016,703),(760,'2013-01-28','2013-01-31',1014,707),(761,'2013-01-29','2013-01-30',1016,708),(762,'2013-01-29','2013-02-02',1013,705),(763,'2013-01-29','2013-02-01',1009,701),(764,'2013-01-29','2013-01-29',1003,702),(765,'2013-01-29','2013-01-31',1016,703),(766,'2013-01-29','2013-01-30',1026,707),(767,'2013-01-30','2013-01-31',1017,706),(768,'2013-01-30','2013-02-03',1003,706),(769,'2013-01-30','2013-02-01',1020,705),(770,'2013-01-30','2013-01-30',1019,702),(771,'2013-01-30','2013-02-01',1017,707),(772,'2013-01-30','2013-01-31',1024,704),(773,'2013-01-30','2013-02-02',1019,705),(774,'2013-01-31','2013-02-02',1013,704),(775,'2013-01-31','2013-01-31',1010,704),(776,'2013-01-31','2013-01-31',1006,708),(777,'2013-01-31','2013-02-02',1026,708),(778,'2013-01-31','2013-01-31',1025,707),(779,'2013-01-31','2013-01-31',1004,705),(780,'2013-01-31','2013-01-31',1003,701),(781,'2013-01-31','2013-02-04',1021,704),(782,'2013-01-31','2013-02-03',1016,702),(783,'2013-01-31','2013-02-04',1013,704),(784,'2013-02-01','2013-02-04',1018,707),(785,'2013-02-01','2013-02-05',1027,706),(786,'2013-02-01','2013-02-01',1015,704),(787,'2013-02-01','2013-02-03',1009,707),(788,'2013-02-01','2013-02-01',1026,704),(789,'2013-02-01','2013-02-05',1021,707),(790,'2013-02-01','2013-02-01',1004,707),(791,'2013-02-01','2013-02-02',1017,706),(792,'2013-02-02','2013-02-05',1027,707),(793,'2013-02-02','2013-02-03',1026,706),(794,'2013-02-02','2013-02-04',1016,703),(795,'2013-02-03','2013-02-05',1024,707),(796,'2013-02-03','2013-02-07',1007,703),(797,'2013-02-03','2013-02-06',1018,705),(798,'2013-02-03','2013-02-04',1003,702),(799,'2013-02-04','2013-02-05',1010,704),(800,'2013-02-04','2013-02-07',1027,707),(801,'2013-02-04','2013-02-08',1002,707),(802,'2013-02-04','2013-02-04',1021,707),(803,'2013-02-05','2013-02-08',1004,704),(804,'2013-02-05','2013-02-05',1014,708),(805,'2013-02-05','2013-02-05',1009,702),(806,'2013-02-05','2013-02-07',1019,707),(807,'2013-02-06','2013-02-07',1016,705),(808,'2013-02-06','2013-02-07',1004,704),(809,'2013-02-07','2013-02-11',1004,701),(810,'2013-02-07','2013-02-07',1022,705),(811,'2013-02-07','2013-02-11',1008,707),(812,'2013-02-07','2013-02-07',1005,707),(813,'2013-02-08','2013-02-08',1013,705),(814,'2013-02-08','2013-02-08',1013,706),(815,'2013-02-08','2013-02-12',1007,702),(816,'2013-02-08','2013-02-11',1011,701),(817,'2013-02-08','2013-02-08',1001,705),(818,'2013-02-08','2013-02-10',1023,704),(819,'2013-02-08','2013-02-12',1013,707),(820,'2013-02-08','2013-02-09',1019,704),(821,'2013-02-08','2013-02-12',1023,708),(822,'2013-02-08','2013-02-09',1004,701),(823,'2013-02-09','2013-02-10',1003,703),(824,'2013-02-09','2013-02-10',1006,701),(825,'2013-02-09','2013-02-09',1025,708),(826,'2013-02-09','2013-02-09',1005,707),(827,'2013-02-10','2013-02-14',1013,706),(828,'2013-02-10','2013-02-10',1014,701),(829,'2013-02-10','2013-02-11',1027,701),(830,'2013-02-11','2013-02-13',1020,703),(831,'2013-02-11','2013-02-14',1012,705),(832,'2013-02-11','2013-02-15',1012,707),(833,'2013-02-11','2013-02-15',1007,706),(834,'2013-02-11','2013-02-11',1021,704),(835,'2013-02-11','2013-02-13',1012,703),(836,'2013-02-11','2013-02-14',1007,708),(837,'2013-02-11','2013-02-13',1012,701),(838,'2013-02-11','2013-02-13',1014,706),(839,'2013-02-12','2013-02-12',1012,702),(840,'2013-02-12','2013-02-12',1001,701),(841,'2013-02-12','2013-02-16',1017,707),(842,'2013-02-12','2013-02-14',1013,707),(843,'2013-02-12','2013-02-14',1008,705),(844,'2013-02-12','2013-02-14',1014,708),(845,'2013-02-12','2013-02-15',1020,701),(846,'2013-02-13','2013-02-17',1012,704),(847,'2013-02-13','2013-02-15',1027,706),(848,'2013-02-13','2013-02-16',1014,706),(849,'2013-02-13','2013-02-15',1026,708),(850,'2013-02-13','2013-02-13',1003,701),(851,'2013-02-13','2013-02-13',1001,702),(852,'2013-02-13','2013-02-16',1002,707),(853,'2013-02-13','2013-02-16',1023,708),(854,'2013-02-13','2013-02-16',1004,706),(855,'2013-02-14','2013-02-15',1001,704),(856,'2013-02-14','2013-02-14',1026,703),(857,'2013-02-14','2013-02-14',1017,708),(858,'2013-02-15','2013-02-19',1023,701),(859,'2013-02-16','2013-02-16',1016,703),(860,'2013-02-16','2013-02-19',1003,703),(861,'2013-02-16','2013-02-16',1026,708),(862,'2013-02-16','2013-02-20',1010,702),(863,'2013-02-16','2013-02-17',1025,704),(864,'2013-02-16','2013-02-16',1008,707),(865,'2013-02-16','2013-02-20',1024,703),(866,'2013-02-16','2013-02-17',1022,706),(867,'2013-02-16','2013-02-20',1017,708),(868,'2013-02-16','2013-02-18',1021,702),(869,'2013-02-17','2013-02-19',1024,708),(870,'2013-02-17','2013-02-20',1005,704),(871,'2013-02-17','2013-02-19',1021,708),(872,'2013-02-17','2013-02-21',1017,702),(873,'2013-02-17','2013-02-18',1020,702),(874,'2013-02-18','2013-02-21',1005,702),(875,'2013-02-18','2013-02-22',1017,702),(876,'2013-02-18','2013-02-18',1005,708),(877,'2013-02-18','2013-02-18',1017,708),(878,'2013-02-18','2013-02-21',1008,706),(879,'2013-02-18','2013-02-19',1013,705),(880,'2013-02-18','2013-02-22',1006,704),(881,'2013-02-18','2013-02-20',1016,707),(882,'2013-02-18','2013-02-22',1008,707),(883,'2013-02-19','2013-02-22',1011,704),(884,'2013-02-19','2013-02-22',1027,704),(885,'2013-02-20','2013-02-23',1009,701),(886,'2013-02-20','2013-02-21',1027,708),(887,'2013-02-20','2013-02-23',1001,705),(888,'2013-02-20','2013-02-23',1007,707),(889,'2013-02-20','2013-02-24',1023,702),(890,'2013-02-20','2013-02-24',1022,705),(891,'2013-02-20','2013-02-21',1006,706),(892,'2013-02-21','2013-02-22',1010,703),(893,'2013-02-21','2013-02-25',1022,705),(894,'2013-02-21','2013-02-23',1024,704),(895,'2013-02-21','2013-02-21',1011,705),(896,'2013-02-21','2013-02-24',1025,702),(897,'2013-02-21','2013-02-24',1027,701),(898,'2013-02-21','2013-02-24',1001,708),(899,'2013-02-21','2013-02-25',1009,705),(900,'2013-02-22','2013-02-24',1020,701),(901,'2013-02-22','2013-02-24',1013,707),(902,'2013-02-22','2013-02-23',1006,702),(903,'2013-02-22','2013-02-23',1021,707),(904,'2013-02-22','2013-02-26',1009,708),(905,'2013-02-22','2013-02-24',1024,704),(906,'2013-02-22','2013-02-22',1012,707),(907,'2013-02-23','2013-02-23',1014,702),(908,'2013-02-23','2013-02-24',1025,705),(909,'2013-02-24','2013-02-24',1024,705),(910,'2013-02-24','2013-02-27',1019,702),(911,'2013-02-24','2013-02-26',1023,702),(912,'2013-02-24','2013-02-28',1025,706),(913,'2013-02-24','2013-02-25',1025,707),(914,'2013-02-24','2013-02-24',1022,707),(915,'2013-02-24','2013-02-25',1016,705),(916,'2013-02-24','2013-02-24',1025,705),(917,'2013-02-24','2013-02-26',1013,703),(918,'2013-02-25','2013-02-28',1025,703),(919,'2013-02-25','2013-02-27',1014,707),(920,'2013-02-26','2013-03-01',1008,708),(921,'2013-02-26','2013-02-26',1018,702),(922,'2013-02-26','2013-02-27',1004,706),(923,'2013-02-26','2013-03-01',1009,707),(924,'2013-02-26','2013-03-01',1002,704),(925,'2013-02-26','2013-02-26',1025,702),(926,'2013-02-26','2013-02-27',1005,701),(927,'2013-02-27','2013-02-28',1007,704),(928,'2013-02-27','2013-03-02',1017,706),(929,'2013-02-27','2013-02-27',1020,705),(930,'2013-02-27','2013-03-01',1023,701),(931,'2013-02-27','2013-02-27',1001,707),(932,'2013-02-27','2013-02-27',1012,704),(933,'2013-02-27','2013-02-27',1026,705),(934,'2013-02-27','2013-02-28',1021,705),(935,'2013-02-27','2013-03-02',1020,702),(936,'2013-02-28','2013-03-01',1025,704),(937,'2013-02-28','2013-03-04',1014,706),(938,'2013-02-28','2013-02-28',1011,705),(939,'2013-02-28','2013-02-28',1021,701),(940,'2013-02-28','2013-03-04',1007,702),(941,'2013-02-28','2013-02-28',1019,702),(942,'2013-02-28','2013-03-01',1002,706),(943,'2013-02-28','2013-03-01',1026,707),(944,'2013-02-28','2013-03-03',1020,702);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_vendors`
--

DROP TABLE IF EXISTS `product_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_vendors` (
  `ProductNumber` int NOT NULL DEFAULT '0',
  `VendorID` int NOT NULL DEFAULT '0',
  `WholesalePrice` decimal(15,2) DEFAULT '0.00',
  `DaysToDeliver` smallint DEFAULT '0',
  PRIMARY KEY (`ProductNumber`,`VendorID`),
  KEY `ProductsProductVendors` (`ProductNumber`),
  KEY `VendorID` (`VendorID`),
  CONSTRAINT `Product_Vendors_FK00` FOREIGN KEY (`ProductNumber`) REFERENCES `products` (`ProductNumber`),
  CONSTRAINT `Product_Vendors_FK01` FOREIGN KEY (`VendorID`) REFERENCES `vendors` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_vendors`
--

LOCK TABLES `product_vendors` WRITE;
/*!40000 ALTER TABLE `product_vendors` DISABLE KEYS */;
INSERT INTO `product_vendors` VALUES (1,4,804.00,6),(1,9,854.22,7),(2,6,1269.00,9),(2,9,1477.81,7),(3,7,54.19,10),(3,9,57.27,6),(4,6,44.22,10),(4,9,41.62,14),(5,7,5.38,10),(5,9,5.87,9),(6,2,403.22,3),(6,9,448.73,7),(7,2,31.12,3),(8,8,39.32,10),(8,9,37.88,14),(9,3,21.53,4),(10,2,22.86,3),(11,3,1076.62,4),(11,9,1178.65,7),(12,1,14.51,2),(12,6,15.44,10),(12,9,15.02,14),(13,1,41.68,2),(13,6,43.99,10),(13,9,43.77,14),(14,6,98.66,9),(14,9,101.22,14),(15,4,3.34,6),(15,6,3.79,10),(15,9,3.88,14),(16,4,18.76,6),(16,6,19.33,10),(16,9,19.33,14),(17,1,27.79,2),(17,6,28.55,10),(17,9,28.55,14),(18,2,113.66,3),(19,2,29.84,3),(20,7,10.84,10),(20,9,11.54,6),(21,7,39.74,10),(21,9,41.50,9),(22,10,63.55,15),(23,6,69.54,15),(23,9,64.39,14),(24,6,55.91,15),(24,7,53.88,10),(24,9,52.27,14),(25,9,105.29,14),(25,10,101.58,15),(26,3,81.56,4),(26,6,79.88,15),(27,3,15.66,4),(27,6,16.88,10),(27,9,15.88,14),(28,3,18.92,4),(28,6,20.56,10),(28,9,19.04,14),(29,5,23.38,8),(29,6,24.44,10),(29,9,23.99,14),(30,8,33.30,12),(30,9,35.32,8),(30,10,32.87,15),(31,7,15.85,15),(31,8,16.28,12),(31,9,16.93,7),(31,10,16.90,9),(32,6,24.77,15),(32,7,24.12,10),(32,8,23.68,12),(33,6,15.23,15),(33,8,14.06,12),(34,6,19.04,9),(34,9,23.86,3),(34,10,19.32,10),(35,6,27.49,9),(35,9,28.22,6),(36,6,122.88,10),(36,7,119.21,10),(36,9,122.78,14),(37,2,120.02,3),(37,6,125.99,10),(37,9,124.89,14),(38,9,136.98,6),(38,10,128.65,15),(39,6,137.55,7),(39,7,126.44,10),(40,6,154.87,10),(40,9,136.35,14);
/*!40000 ALTER TABLE `product_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductNumber` int NOT NULL DEFAULT '0',
  `ProductName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ProductDescription` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RetailPrice` decimal(15,2) DEFAULT '0.00',
  `QuantityOnHand` smallint DEFAULT '0',
  `CategoryID` int DEFAULT '0',
  PRIMARY KEY (`ProductNumber`),
  KEY `CategoriesProducts` (`CategoryID`),
  CONSTRAINT `Products_FK00` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Trek 9000 Mountain Bike',NULL,1200.00,6,2),(2,'Eagle FS-3 Mountain Bike',NULL,1800.00,8,2),(3,'Dog Ear Cyclecomputer',NULL,75.00,20,1),(4,'Victoria Pro All Weather Tires',NULL,54.95,20,4),(5,'Dog Ear Helmet Mount Mirrors',NULL,7.45,12,1),(6,'Viscount Mountain Bike',NULL,635.00,5,2),(7,'Viscount C-500 Wireless Bike Computer',NULL,49.00,30,1),(8,'Kryptonite Advanced 2000 U-Lock',NULL,50.00,20,1),(9,'Nikoma Lok-Tight U-Lock',NULL,33.00,12,1),(10,'Viscount Microshell Helmet',NULL,36.00,20,1),(11,'GT RTS-2 Mountain Bike',NULL,1650.00,5,2),(12,'Shinoman 105 SC Brakes',NULL,23.50,16,4),(13,'Shinoman Dura-Ace Headset',NULL,67.50,20,4),(14,'Eagle SA-120 Clipless Pedals',NULL,139.95,20,4),(15,'ProFormance Toe-Klips 2G',NULL,4.99,40,4),(16,'ProFormance ATB All-Terrain Pedal',NULL,28.00,40,4),(17,'Shinoman Deluxe TX-30 Pedal',NULL,45.00,60,4),(18,'Viscount CardioSport Sport Watch',NULL,179.00,12,1),(19,'Viscount Tru-Beat Heart Transmitter',NULL,47.00,20,1),(20,'Dog Ear Monster Grip Gloves',NULL,15.00,30,1),(21,'Dog Ear Aero-Flow Floor Pump',NULL,55.00,25,1),(22,'Pro-Sport \'Dillo Shades',NULL,82.00,18,1),(23,'Ultra-Pro Rain Jacket',NULL,85.00,30,3),(24,'StaDry Cycling Pants',NULL,69.00,22,3),(25,'King Cobra Helmet',NULL,139.00,30,1),(26,'Glide-O-Matic Cycling Helmet',NULL,125.00,24,1),(27,'X-Pro All Weather Tires',NULL,24.00,20,6),(28,'Turbo Twin Tires',NULL,29.00,18,6),(29,'Ultra-2K Competition Tire',NULL,34.00,22,6),(30,'Clear Shade 85-T Glasses',NULL,45.00,14,1),(31,'True Grip Competition Gloves',NULL,22.00,20,1),(32,'Kool-Breeze Rocket Top Jersey',NULL,32.00,12,3),(33,'Wonder Wool Cycle Socks',NULL,19.00,30,3),(34,'TransPort Bicycle Rack',NULL,27.00,14,1),(35,'HP Deluxe Panniers',NULL,39.00,10,1),(36,'Cosmic Elite Road Warrior Wheels',NULL,165.00,22,4),(37,'AeroFlo ATB Wheels',NULL,189.00,40,4),(38,'Cycle-Doc Pro Repair Stand',NULL,166.00,12,1),(39,'Road Warrior Hitch Pack',NULL,175.00,6,5),(40,'Ultimate Export 2G Car Rack',NULL,180.00,8,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `VendorID` int NOT NULL,
  `VendName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VendStreetAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VendCity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VendState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VendZipCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VendPhoneNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VendFaxNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VendWebPage` text,
  `VendEMailAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`VendorID`),
  KEY `VendZipCode` (`VendZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'Shinoman, Incorporated','3042 19th Avenue South','Bellevue','WA','98001','(425) 888-1234','(425) 888-1235','#http://www.shinoman.com/#','Sales@Shiniman.com'),(2,'Viscount','1911 Commerce Way','St. Louis','MO','63127','(314) 777-1234','(314) 777-1235','#http://www.viscountbikes.com/#','Orders@ViscountBikes.com'),(3,'Nikoma of America','88 Old North Road Ave','Ballard','WA','91324','(206) 666-1234','(314) 666-1235','#http://www.nikomabikes.com/#','BuyBikes@NikomaBikes.com'),(4,'ProFormance','29 N. Quail St.','Albany','NY','12012','(518) 444-1234','(518) 444-1235','#http://www.ProFormBikes.com/#','Sales@ProFormBikes.com'),(5,'Kona, Incorporated','PO Box 10429','Redmond','WA','98052','(425) 333-1234','(425) 333-1235','#http://www.konabikes.com/#','Sales@KonaBikes.com'),(6,'Big Sky Mountain Bikes','Glacier Bay South','Anchorage','AK','99209','(907) 222-1234','(907) 222-1235',NULL,NULL),(7,'Dog Ear','575 Madison Ave.','New York','NY','10003','(212) 888-9876','(212) 888-9877',NULL,NULL),(8,'Sun Sports Suppliers','PO Box 8082','Santa Monica','CA','91003','(310) 777-9876','(310) 777-9877',NULL,NULL),(9,'Lone Star Bike Supply','7402 Kingman Drive','El Paso','TX','79915','(915) 666-9876','(915) 666-9877',NULL,NULL),(10,'Armadillo Brand','12330 Side Road Lane','Dallas','TX','75137','(214) 444-9876','(214) 444-9877','#http://www.DilloBikes.com/#','BikeProducts@DilloBikes.com');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblmonths`
--

DROP TABLE IF EXISTS `ztblmonths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblmonths` (
  `MonthYear` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `YearNumber` smallint NOT NULL,
  `MonthNumber` smallint NOT NULL,
  `MonthStart` date NOT NULL,
  `MonthEnd` date NOT NULL,
  `January` smallint NOT NULL DEFAULT '0',
  `February` smallint NOT NULL DEFAULT '0',
  `March` smallint NOT NULL DEFAULT '0',
  `April` smallint NOT NULL DEFAULT '0',
  `May` smallint NOT NULL DEFAULT '0',
  `June` smallint NOT NULL DEFAULT '0',
  `July` smallint NOT NULL DEFAULT '0',
  `August` smallint NOT NULL DEFAULT '0',
  `September` smallint NOT NULL DEFAULT '0',
  `October` smallint NOT NULL DEFAULT '0',
  `November` smallint NOT NULL DEFAULT '0',
  `December` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`YearNumber`,`MonthNumber`),
  UNIQUE KEY `Month_End` (`MonthEnd`),
  UNIQUE KEY `Month_Start` (`MonthStart`),
  UNIQUE KEY `Month_Year` (`MonthYear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblmonths`
--

LOCK TABLES `ztblmonths` WRITE;
/*!40000 ALTER TABLE `ztblmonths` DISABLE KEYS */;
INSERT INTO `ztblmonths` VALUES ('January 2012',2012,1,'2012-01-01','2012-01-31',1,0,0,0,0,0,0,0,0,0,0,0),('February 2012',2012,2,'2012-02-01','2012-02-29',0,1,0,0,0,0,0,0,0,0,0,0),('March 2012',2012,3,'2012-03-01','2012-03-31',0,0,1,0,0,0,0,0,0,0,0,0),('April 2012',2012,4,'2012-04-01','2012-04-30',0,0,0,1,0,0,0,0,0,0,0,0),('May 2012',2012,5,'2012-05-01','2012-05-31',0,0,0,0,1,0,0,0,0,0,0,0),('June 2012',2012,6,'2012-06-01','2012-06-30',0,0,0,0,0,1,0,0,0,0,0,0),('July 2012',2012,7,'2012-07-01','2012-07-31',0,0,0,0,0,0,1,0,0,0,0,0),('August 2012',2012,8,'2012-08-01','2012-08-31',0,0,0,0,0,0,0,1,0,0,0,0),('September 2012',2012,9,'2012-09-01','2012-09-30',0,0,0,0,0,0,0,0,1,0,0,0),('October 2012',2012,10,'2012-10-01','2012-10-31',0,0,0,0,0,0,0,0,0,1,0,0),('November 2012',2012,11,'2012-11-01','2012-11-30',0,0,0,0,0,0,0,0,0,0,1,0),('December 2012',2012,12,'2012-12-01','2012-12-31',0,0,0,0,0,0,0,0,0,0,0,1),('January 2013',2013,1,'2013-01-01','2013-01-31',1,0,0,0,0,0,0,0,0,0,0,0),('February 2013',2013,2,'2013-02-01','2013-02-28',0,1,0,0,0,0,0,0,0,0,0,0),('March 2013',2013,3,'2013-03-01','2013-03-31',0,0,1,0,0,0,0,0,0,0,0,0),('April 2013',2013,4,'2013-04-01','2013-04-30',0,0,0,1,0,0,0,0,0,0,0,0),('May 2013',2013,5,'2013-05-01','2013-05-31',0,0,0,0,1,0,0,0,0,0,0,0),('June 2013',2013,6,'2013-06-01','2013-06-30',0,0,0,0,0,1,0,0,0,0,0,0),('July 2013',2013,7,'2013-07-01','2013-07-31',0,0,0,0,0,0,1,0,0,0,0,0),('August 2013',2013,8,'2013-08-01','2013-08-31',0,0,0,0,0,0,0,1,0,0,0,0),('September 2013',2013,9,'2013-09-01','2013-09-30',0,0,0,0,0,0,0,0,1,0,0,0),('October 2013',2013,10,'2013-10-01','2013-10-31',0,0,0,0,0,0,0,0,0,1,0,0),('November 2013',2013,11,'2013-11-01','2013-11-30',0,0,0,0,0,0,0,0,0,0,1,0),('December 2013',2013,12,'2013-12-01','2013-12-31',0,0,0,0,0,0,0,0,0,0,0,1),('January 2014',2014,1,'2014-01-01','2014-01-31',1,0,0,0,0,0,0,0,0,0,0,0),('February 2014',2014,2,'2014-02-01','2014-02-28',0,1,0,0,0,0,0,0,0,0,0,0),('March 2014',2014,3,'2014-03-01','2014-03-31',0,0,1,0,0,0,0,0,0,0,0,0),('April 2014',2014,4,'2014-04-01','2014-04-30',0,0,0,1,0,0,0,0,0,0,0,0),('May 2014',2014,5,'2014-05-01','2014-05-31',0,0,0,0,1,0,0,0,0,0,0,0),('June 2014',2014,6,'2014-06-01','2014-06-30',0,0,0,0,0,1,0,0,0,0,0,0),('July 2014',2014,7,'2014-07-01','2014-07-31',0,0,0,0,0,0,1,0,0,0,0,0),('August 2014',2014,8,'2014-08-01','2014-08-31',0,0,0,0,0,0,0,1,0,0,0,0),('September 2014',2014,9,'2014-09-01','2014-09-30',0,0,0,0,0,0,0,0,1,0,0,0),('October 2014',2014,10,'2014-10-01','2014-10-31',0,0,0,0,0,0,0,0,0,1,0,0),('November 2014',2014,11,'2014-11-01','2014-11-30',0,0,0,0,0,0,0,0,0,0,1,0),('December 2014',2014,12,'2014-12-01','2014-12-31',0,0,0,0,0,0,0,0,0,0,0,1);
/*!40000 ALTER TABLE `ztblmonths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblpriceranges`
--

DROP TABLE IF EXISTS `ztblpriceranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblpriceranges` (
  `PriceCategory` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LowPrice` decimal(15,2) DEFAULT NULL,
  `HighPrice` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`PriceCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblpriceranges`
--

LOCK TABLES `ztblpriceranges` WRITE;
/*!40000 ALTER TABLE `ztblpriceranges` DISABLE KEYS */;
INSERT INTO `ztblpriceranges` VALUES ('Affordable',15.01,50.00),('Expensive',200.01,9999999.00),('Inexpensive',0.00,15.00),('Moderately Expensive',50.01,200.00);
/*!40000 ALTER TABLE `ztblpriceranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblpurchasecoupons`
--

DROP TABLE IF EXISTS `ztblpurchasecoupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblpurchasecoupons` (
  `LowSpend` decimal(15,2) NOT NULL,
  `HighSpend` decimal(15,2) DEFAULT NULL,
  `NumCoupons` smallint DEFAULT '0',
  PRIMARY KEY (`LowSpend`),
  KEY `Num_Coupons` (`NumCoupons`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblpurchasecoupons`
--

LOCK TABLES `ztblpurchasecoupons` WRITE;
/*!40000 ALTER TABLE `ztblpurchasecoupons` DISABLE KEYS */;
INSERT INTO `ztblpurchasecoupons` VALUES (1000.00,1999.99,1),(2000.00,4999.99,2),(5000.00,9999.99,4),(10000.00,29999.99,9),(30000.00,49999.99,20),(50000.00,999999.99,50);
/*!40000 ALTER TABLE `ztblpurchasecoupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblseqnumbers`
--

DROP TABLE IF EXISTS `ztblseqnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblseqnumbers` (
  `Sequence` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblseqnumbers`
--

LOCK TABLES `ztblseqnumbers` WRITE;
/*!40000 ALTER TABLE `ztblseqnumbers` DISABLE KEYS */;
INSERT INTO `ztblseqnumbers` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60);
/*!40000 ALTER TABLE `ztblseqnumbers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 19:06:28
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: bowlingleague
-- ------------------------------------------------------
-- Server version	8.0.20
CREATE DATABASE BowlingLeagueDB;
use BowlingLeagueDB;
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
-- Table structure for table `bowler_scores`
--

DROP TABLE IF EXISTS `bowler_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bowler_scores` (
  `MatchID` int NOT NULL DEFAULT '0',
  `GameNumber` smallint NOT NULL DEFAULT '0',
  `BowlerID` int NOT NULL DEFAULT '0',
  `RawScore` smallint DEFAULT '0',
  `HandiCapScore` smallint DEFAULT '0',
  `WonGame` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`MatchID`,`GameNumber`,`BowlerID`),
  KEY `BowlerID` (`BowlerID`),
  KEY `MatchGamesBowlerScores` (`MatchID`,`GameNumber`),
  CONSTRAINT `Bowler_Scores_FK00` FOREIGN KEY (`BowlerID`) REFERENCES `bowlers` (`BowlerID`),
  CONSTRAINT `Bowler_Scores_FK01` FOREIGN KEY (`MatchID`, `GameNumber`) REFERENCES `match_games` (`MatchID`, `GameNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bowler_scores`
--

LOCK TABLES `bowler_scores` WRITE;
/*!40000 ALTER TABLE `bowler_scores` DISABLE KEYS */;
INSERT INTO `bowler_scores` VALUES (1,1,1,146,192,_binary '\0'),(1,1,2,166,205,_binary ''),(1,1,3,140,171,_binary '\0'),(1,1,4,146,198,_binary '\0'),(1,1,5,157,203,_binary ''),(1,1,6,160,198,_binary '\0'),(1,1,7,170,199,_binary ''),(1,1,8,150,202,_binary ''),(1,2,1,146,192,_binary '\0'),(1,2,2,135,174,_binary '\0'),(1,2,3,156,187,_binary ''),(1,2,4,143,195,_binary ''),(1,2,5,149,195,_binary ''),(1,2,6,152,190,_binary ''),(1,2,7,158,187,_binary ''),(1,2,8,136,188,_binary '\0'),(1,3,1,153,199,_binary ''),(1,3,2,177,216,_binary ''),(1,3,3,191,222,_binary ''),(1,3,4,148,200,_binary ''),(1,3,5,139,185,_binary '\0'),(1,3,6,142,180,_binary '\0'),(1,3,7,192,221,_binary '\0'),(1,3,8,148,200,_binary ''),(2,1,9,146,191,_binary ''),(2,1,10,154,190,_binary ''),(2,1,11,168,201,_binary ''),(2,1,12,136,188,_binary '\0'),(2,1,13,143,186,_binary '\0'),(2,1,14,142,181,_binary '\0'),(2,1,15,137,171,_binary '\0'),(2,1,16,143,195,_binary ''),(2,2,9,138,183,_binary '\0'),(2,2,10,171,207,_binary ''),(2,2,11,180,213,_binary ''),(2,2,12,145,197,_binary ''),(2,2,13,155,198,_binary ''),(2,2,14,166,205,_binary '\0'),(2,2,15,155,189,_binary '\0'),(2,2,16,139,191,_binary '\0'),(2,3,9,161,206,_binary ''),(2,3,10,172,208,_binary ''),(2,3,11,186,219,_binary ''),(2,3,12,136,188,_binary '\0'),(2,3,13,162,205,_binary '\0'),(2,3,14,137,176,_binary '\0'),(2,3,15,163,197,_binary '\0'),(2,3,16,143,195,_binary ''),(3,1,17,159,205,_binary ''),(3,1,18,176,215,_binary ''),(3,1,19,147,176,_binary '\0'),(3,1,20,143,194,_binary ''),(3,1,21,154,201,_binary '\0'),(3,1,22,173,211,_binary '\0'),(3,1,23,146,178,_binary ''),(3,1,24,164,192,_binary '\0'),(3,2,17,165,211,_binary ''),(3,2,18,164,203,_binary ''),(3,2,19,168,197,_binary '\0'),(3,2,20,137,188,_binary ''),(3,2,21,157,204,_binary '\0'),(3,2,22,157,195,_binary '\0'),(3,2,23,182,214,_binary ''),(3,2,24,160,188,_binary ''),(3,3,17,149,195,_binary ''),(3,3,18,160,199,_binary '\0'),(3,3,19,185,214,_binary '\0'),(3,3,20,141,192,_binary ''),(3,3,21,137,184,_binary '\0'),(3,3,22,180,218,_binary ''),(3,3,23,187,219,_binary ''),(3,3,24,163,191,_binary '\0'),(4,1,25,157,202,_binary ''),(4,1,26,143,182,_binary '\0'),(4,1,27,140,170,_binary '\0'),(4,1,28,143,194,_binary '\0'),(4,1,29,138,183,_binary '\0'),(4,1,30,176,215,_binary ''),(4,1,31,151,184,_binary ''),(4,1,32,148,200,_binary ''),(4,2,25,138,183,_binary '\0'),(4,2,26,147,186,_binary '\0'),(4,2,27,172,202,_binary ''),(4,2,28,147,198,_binary ''),(4,2,29,143,188,_binary ''),(4,2,30,167,206,_binary ''),(4,2,31,146,179,_binary '\0'),(4,2,32,141,193,_binary '\0'),(4,3,25,155,200,_binary '\0'),(4,3,26,148,187,_binary ''),(4,3,27,167,197,_binary '\0'),(4,3,28,140,191,_binary '\0'),(4,3,29,163,208,_binary ''),(4,3,30,143,182,_binary '\0'),(4,3,31,182,215,_binary ''),(4,3,32,148,200,_binary ''),(5,1,1,145,192,_binary '\0'),(5,1,2,148,185,_binary ''),(5,1,3,181,215,_binary ''),(5,1,4,139,188,_binary '\0'),(5,1,9,147,194,_binary ''),(5,1,10,147,178,_binary '\0'),(5,1,11,158,178,_binary '\0'),(5,1,12,147,202,_binary ''),(5,2,1,137,184,_binary '\0'),(5,2,2,140,177,_binary '\0'),(5,2,3,158,192,_binary ''),(5,2,4,139,188,_binary '\0'),(5,2,9,146,193,_binary ''),(5,2,10,167,198,_binary ''),(5,2,11,144,164,_binary '\0'),(5,2,12,143,198,_binary ''),(5,3,1,152,199,_binary ''),(5,3,2,144,181,_binary '\0'),(5,3,3,175,209,_binary ''),(5,3,4,138,187,_binary '\0'),(5,3,9,148,195,_binary '\0'),(5,3,10,178,209,_binary ''),(5,3,11,158,178,_binary '\0'),(5,3,12,137,192,_binary ''),(6,1,5,164,211,_binary ''),(6,1,6,179,223,_binary ''),(6,1,7,181,205,_binary '\0'),(6,1,8,146,196,_binary '\0'),(6,1,13,164,206,_binary '\0'),(6,1,14,164,211,_binary '\0'),(6,1,15,180,223,_binary ''),(6,1,16,149,201,_binary ''),(6,2,5,138,185,_binary '\0'),(6,2,6,164,208,_binary ''),(6,2,7,183,207,_binary '\0'),(6,2,8,149,199,_binary '\0'),(6,2,13,165,207,_binary ''),(6,2,14,156,203,_binary '\0'),(6,2,15,177,220,_binary ''),(6,2,16,149,201,_binary ''),(6,3,5,165,212,_binary ''),(6,3,6,136,180,_binary '\0'),(6,3,7,178,202,_binary ''),(6,3,8,138,188,_binary ''),(6,3,13,151,193,_binary '\0'),(6,3,14,147,194,_binary ''),(6,3,15,158,201,_binary '\0'),(6,3,16,136,188,_binary ''),(7,1,17,139,177,_binary '\0'),(7,1,18,142,172,_binary '\0'),(7,1,19,189,219,_binary ''),(7,1,20,138,192,_binary '\0'),(7,1,25,143,188,_binary ''),(7,1,26,180,229,_binary ''),(7,1,27,167,203,_binary '\0'),(7,1,28,148,199,_binary ''),(7,2,17,157,195,_binary ''),(7,2,18,143,173,_binary '\0'),(7,2,19,176,206,_binary '\0'),(7,2,20,141,195,_binary '\0'),(7,2,25,139,184,_binary '\0'),(7,2,26,175,224,_binary ''),(7,2,27,178,214,_binary ''),(7,2,28,147,198,_binary ''),(7,3,17,155,193,_binary ''),(7,3,18,136,166,_binary '\0'),(7,3,19,155,185,_binary ''),(7,3,20,139,193,_binary '\0'),(7,3,25,143,188,_binary '\0'),(7,3,26,151,200,_binary ''),(7,3,27,137,173,_binary '\0'),(7,3,28,150,201,_binary ''),(8,1,21,145,191,_binary ''),(8,1,22,146,173,_binary '\0'),(8,1,23,157,182,_binary '\0'),(8,1,24,168,196,_binary ''),(8,1,29,140,187,_binary '\0'),(8,1,30,179,213,_binary ''),(8,1,31,161,197,_binary ''),(8,1,32,138,187,_binary '\0'),(8,2,21,148,194,_binary '\0'),(8,2,22,136,163,_binary '\0'),(8,2,23,193,218,_binary '\0'),(8,2,24,178,206,_binary ''),(8,2,29,156,203,_binary ''),(8,2,30,149,183,_binary ''),(8,2,31,185,221,_binary ''),(8,2,32,136,185,_binary '\0'),(8,3,21,136,182,_binary ''),(8,3,22,143,170,_binary '\0'),(8,3,23,189,214,_binary ''),(8,3,24,168,197,_binary ''),(8,3,29,135,182,_binary ''),(8,3,30,166,200,_binary ''),(8,3,31,140,176,_binary '\0'),(8,3,32,144,193,_binary '\0'),(9,1,5,137,180,_binary '\0'),(9,1,6,178,218,_binary ''),(9,1,7,140,161,_binary '\0'),(9,1,8,139,189,_binary '\0'),(9,1,9,164,211,_binary ''),(9,1,10,136,168,_binary '\0'),(9,1,11,182,213,_binary ''),(9,1,12,145,198,_binary ''),(9,2,5,149,192,_binary '\0'),(9,2,6,147,187,_binary '\0'),(9,2,7,145,166,_binary '\0'),(9,2,8,141,191,_binary '\0'),(9,2,9,158,205,_binary ''),(9,2,10,167,199,_binary ''),(9,2,11,176,207,_binary ''),(9,2,12,139,192,_binary ''),(9,3,5,162,205,_binary ''),(9,3,6,141,181,_binary '\0'),(9,3,7,144,165,_binary '\0'),(9,3,8,149,199,_binary ''),(9,3,9,144,191,_binary '\0'),(9,3,10,158,190,_binary ''),(9,3,11,158,189,_binary ''),(9,3,12,135,188,_binary '\0'),(10,1,1,140,189,_binary ''),(10,1,2,141,184,_binary '\0'),(10,1,3,189,219,_binary ''),(10,1,4,143,195,_binary '\0'),(10,1,13,150,189,_binary ''),(10,1,14,150,193,_binary ''),(10,1,15,181,215,_binary '\0'),(10,1,16,145,196,_binary ''),(10,2,1,137,186,_binary '\0'),(10,2,2,163,206,_binary ''),(10,2,3,135,165,_binary '\0'),(10,2,4,147,199,_binary ''),(10,2,13,153,192,_binary ''),(10,2,14,154,197,_binary '\0'),(10,2,15,169,203,_binary ''),(10,2,16,138,189,_binary '\0'),(10,3,1,161,210,_binary ''),(10,3,2,167,210,_binary ''),(10,3,3,175,205,_binary ''),(10,3,4,140,192,_binary '\0'),(10,3,13,143,182,_binary '\0'),(10,3,14,157,200,_binary '\0'),(10,3,15,153,187,_binary '\0'),(10,3,16,142,193,_binary ''),(11,1,21,146,195,_binary '\0'),(11,1,22,174,214,_binary ''),(11,1,23,164,186,_binary '\0'),(11,1,24,169,196,_binary ''),(11,1,25,158,207,_binary ''),(11,1,26,159,198,_binary '\0'),(11,1,27,195,231,_binary ''),(11,1,28,138,187,_binary '\0'),(11,2,21,154,203,_binary '\0'),(11,2,22,140,180,_binary '\0'),(11,2,23,140,162,_binary '\0'),(11,2,24,175,202,_binary ''),(11,2,25,158,207,_binary ''),(11,2,26,171,210,_binary ''),(11,2,27,160,196,_binary ''),(11,2,28,142,191,_binary '\0'),(11,3,21,159,208,_binary '\0'),(11,3,22,165,205,_binary ''),(11,3,23,147,169,_binary '\0'),(11,3,24,167,194,_binary ''),(11,3,25,161,210,_binary ''),(11,3,26,161,200,_binary '\0'),(11,3,27,158,194,_binary ''),(11,3,28,135,184,_binary '\0'),(12,1,17,139,180,_binary '\0'),(12,1,18,145,186,_binary ''),(12,1,19,154,181,_binary ''),(12,1,20,149,203,_binary ''),(12,1,29,137,186,_binary ''),(12,1,30,135,168,_binary '\0'),(12,1,31,139,174,_binary '\0'),(12,1,32,140,192,_binary '\0'),(12,2,17,151,192,_binary '\0'),(12,2,18,167,208,_binary ''),(12,2,19,183,210,_binary ''),(12,2,20,146,200,_binary ''),(12,2,29,148,197,_binary ''),(12,2,30,171,204,_binary '\0'),(12,2,31,145,180,_binary '\0'),(12,2,32,145,197,_binary '\0'),(12,3,17,155,196,_binary '\0'),(12,3,18,143,184,_binary '\0'),(12,3,19,141,168,_binary '\0'),(12,3,20,149,203,_binary ''),(12,3,29,156,205,_binary ''),(12,3,30,158,191,_binary ''),(12,3,31,184,219,_binary ''),(12,3,32,146,198,_binary '\0'),(13,1,1,159,208,_binary ''),(13,1,2,163,205,_binary ''),(13,1,3,182,212,_binary ''),(13,1,4,138,189,_binary '\0'),(13,1,17,150,193,_binary '\0'),(13,1,18,136,178,_binary '\0'),(13,1,19,179,210,_binary '\0'),(13,1,20,146,197,_binary ''),(13,2,1,140,189,_binary '\0'),(13,2,2,176,218,_binary ''),(13,2,3,178,208,_binary ''),(13,2,4,139,190,_binary '\0'),(13,2,17,153,196,_binary ''),(13,2,18,174,216,_binary '\0'),(13,2,19,140,171,_binary '\0'),(13,2,20,141,192,_binary ''),(13,3,1,158,207,_binary ''),(13,3,2,141,183,_binary '\0'),(13,3,3,150,180,_binary '\0'),(13,3,4,140,191,_binary '\0'),(13,3,17,151,194,_binary '\0'),(13,3,18,146,188,_binary ''),(13,3,19,173,204,_binary ''),(13,3,20,148,199,_binary ''),(14,1,5,163,207,_binary ''),(14,1,6,136,177,_binary '\0'),(14,1,7,177,208,_binary ''),(14,1,8,147,197,_binary '\0'),(14,1,21,146,193,_binary '\0'),(14,1,22,170,209,_binary ''),(14,1,23,149,179,_binary '\0'),(14,1,24,176,202,_binary ''),(14,2,5,150,194,_binary '\0'),(14,2,6,172,213,_binary ''),(14,2,7,135,166,_binary '\0'),(14,2,8,136,186,_binary '\0'),(14,2,21,160,207,_binary ''),(14,2,22,140,179,_binary '\0'),(14,2,23,164,194,_binary ''),(14,2,24,172,198,_binary ''),(14,3,5,142,186,_binary '\0'),(14,3,6,142,183,_binary '\0'),(14,3,7,179,210,_binary ''),(14,3,8,148,198,_binary '\0'),(14,3,21,153,200,_binary ''),(14,3,22,178,217,_binary ''),(14,3,23,180,210,_binary ''),(14,3,24,175,201,_binary ''),(15,1,9,142,187,_binary '\0'),(15,1,10,155,190,_binary ''),(15,1,11,150,179,_binary '\0'),(15,1,12,140,194,_binary ''),(15,1,25,163,208,_binary ''),(15,1,26,153,190,_binary ''),(15,1,27,153,185,_binary ''),(15,1,28,143,194,_binary ''),(15,2,9,162,207,_binary ''),(15,2,10,151,186,_binary '\0'),(15,2,11,146,175,_binary '\0'),(15,2,12,150,204,_binary ''),(15,2,25,147,192,_binary '\0'),(15,2,26,156,193,_binary ''),(15,2,27,182,214,_binary ''),(15,2,28,140,191,_binary '\0'),(15,3,9,163,208,_binary ''),(15,3,10,158,193,_binary '\0'),(15,3,11,141,170,_binary '\0'),(15,3,12,140,194,_binary ''),(15,3,25,139,184,_binary '\0'),(15,3,26,166,203,_binary ''),(15,3,27,193,225,_binary ''),(15,3,28,140,191,_binary '\0'),(16,1,13,157,198,_binary '\0'),(16,1,14,162,204,_binary ''),(16,1,15,165,197,_binary '\0'),(16,1,16,139,190,_binary '\0'),(16,1,29,164,213,_binary ''),(16,1,30,153,189,_binary '\0'),(16,1,31,174,211,_binary ''),(16,1,32,140,191,_binary ''),(16,2,13,162,203,_binary ''),(16,2,14,164,206,_binary ''),(16,2,15,135,167,_binary '\0'),(16,2,16,137,188,_binary '\0'),(16,2,29,138,187,_binary '\0'),(16,2,30,167,203,_binary '\0'),(16,2,31,184,221,_binary ''),(16,2,32,144,195,_binary ''),(16,3,13,139,180,_binary '\0'),(16,3,14,153,195,_binary ''),(16,3,15,183,215,_binary ''),(16,3,16,147,198,_binary ''),(16,3,29,163,212,_binary ''),(16,3,30,147,183,_binary '\0'),(16,3,31,149,186,_binary '\0'),(16,3,32,140,191,_binary '\0'),(17,1,1,139,186,_binary ''),(17,1,2,175,216,_binary ''),(17,1,3,136,165,_binary '\0'),(17,1,4,141,193,_binary ''),(17,1,21,141,186,_binary ''),(17,1,22,146,184,_binary '\0'),(17,1,23,156,187,_binary ''),(17,1,24,162,187,_binary '\0'),(17,2,1,164,211,_binary ''),(17,2,2,161,202,_binary ''),(17,2,3,174,203,_binary ''),(17,2,4,145,197,_binary ''),(17,2,21,147,192,_binary '\0'),(17,2,22,141,179,_binary '\0'),(17,2,23,156,187,_binary '\0'),(17,2,24,165,190,_binary '\0'),(17,3,1,161,208,_binary ''),(17,3,2,173,214,_binary ''),(17,3,3,144,173,_binary '\0'),(17,3,4,141,193,_binary '\0'),(17,3,21,138,183,_binary '\0'),(17,3,22,174,212,_binary '\0'),(17,3,23,190,221,_binary ''),(17,3,24,173,198,_binary ''),(18,1,5,143,187,_binary '\0'),(18,1,6,145,186,_binary '\0'),(18,1,7,169,201,_binary ''),(18,1,8,146,196,_binary '\0'),(18,1,17,149,192,_binary ''),(18,1,18,165,207,_binary ''),(18,1,19,138,169,_binary '\0'),(18,1,20,148,199,_binary ''),(18,2,5,155,199,_binary ''),(18,2,6,178,219,_binary ''),(18,2,7,175,207,_binary ''),(18,2,8,146,196,_binary '\0'),(18,2,17,156,199,_binary ''),(18,2,18,173,215,_binary '\0'),(18,2,19,155,186,_binary '\0'),(18,2,20,148,199,_binary ''),(18,3,5,136,180,_binary '\0'),(18,3,6,140,181,_binary '\0'),(18,3,7,187,219,_binary '\0'),(18,3,8,142,192,_binary '\0'),(18,3,17,141,184,_binary ''),(18,3,18,173,215,_binary ''),(18,3,19,190,221,_binary ''),(18,3,20,143,194,_binary ''),(19,1,9,142,185,_binary '\0'),(19,1,10,169,205,_binary ''),(19,1,11,162,196,_binary '\0'),(19,1,12,140,193,_binary '\0'),(19,1,29,144,191,_binary ''),(19,1,30,162,199,_binary '\0'),(19,1,31,175,209,_binary ''),(19,1,32,143,195,_binary ''),(19,2,9,164,207,_binary ''),(19,2,10,161,197,_binary '\0'),(19,2,11,137,171,_binary '\0'),(19,2,12,148,201,_binary ''),(19,2,29,135,182,_binary '\0'),(19,2,30,177,214,_binary ''),(19,2,31,174,208,_binary ''),(19,2,32,149,201,_binary ''),(19,3,9,162,205,_binary ''),(19,3,10,158,194,_binary ''),(19,3,11,149,183,_binary '\0'),(19,3,12,142,195,_binary ''),(19,3,29,137,184,_binary '\0'),(19,3,30,151,188,_binary '\0'),(19,3,31,186,220,_binary ''),(19,3,32,137,189,_binary '\0'),(20,1,13,161,202,_binary ''),(20,1,14,175,216,_binary ''),(20,1,15,176,209,_binary ''),(20,1,16,143,195,_binary '\0'),(20,1,25,144,189,_binary '\0'),(20,1,26,141,178,_binary '\0'),(20,1,27,139,169,_binary '\0'),(20,1,28,150,201,_binary ''),(20,2,13,148,189,_binary ''),(20,2,14,164,205,_binary ''),(20,2,15,144,177,_binary ''),(20,2,16,137,189,_binary ''),(20,2,25,144,189,_binary ''),(20,2,26,158,195,_binary '\0'),(20,2,27,147,177,_binary ''),(20,2,28,138,189,_binary ''),(20,3,13,162,203,_binary ''),(20,3,14,172,213,_binary ''),(20,3,15,140,173,_binary '\0'),(20,3,16,138,190,_binary '\0'),(20,3,25,137,182,_binary '\0'),(20,3,26,143,180,_binary '\0'),(20,3,27,172,202,_binary ''),(20,3,28,149,200,_binary ''),(21,1,1,141,187,_binary '\0'),(21,1,2,141,179,_binary '\0'),(21,1,3,191,223,_binary ''),(21,1,4,145,197,_binary '\0'),(21,1,25,142,189,_binary ''),(21,1,26,151,190,_binary ''),(21,1,27,150,182,_binary '\0'),(21,1,28,148,199,_binary ''),(21,2,1,141,187,_binary '\0'),(21,2,2,164,202,_binary ''),(21,2,3,189,221,_binary ''),(21,2,4,142,194,_binary ''),(21,2,25,147,194,_binary ''),(21,2,26,138,177,_binary '\0'),(21,2,27,176,208,_binary '\0'),(21,2,28,137,188,_binary '\0'),(21,3,1,139,185,_binary ''),(21,3,2,159,197,_binary '\0'),(21,3,3,174,206,_binary '\0'),(21,3,4,137,189,_binary '\0'),(21,3,25,136,183,_binary '\0'),(21,3,26,178,217,_binary ''),(21,3,27,191,223,_binary ''),(21,3,28,147,198,_binary ''),(22,1,9,142,185,_binary ''),(22,1,10,165,201,_binary '\0'),(22,1,11,144,180,_binary '\0'),(22,1,12,139,191,_binary '\0'),(22,1,17,139,183,_binary '\0'),(22,1,18,168,208,_binary ''),(22,1,19,165,197,_binary ''),(22,1,20,144,194,_binary ''),(22,2,9,143,186,_binary '\0'),(22,2,10,167,203,_binary ''),(22,2,11,188,224,_binary ''),(22,2,12,145,197,_binary ''),(22,2,17,144,188,_binary ''),(22,2,18,159,199,_binary '\0'),(22,2,19,166,198,_binary '\0'),(22,2,20,143,193,_binary '\0'),(22,3,9,153,196,_binary '\0'),(22,3,10,146,182,_binary '\0'),(22,3,11,182,218,_binary ''),(22,3,12,147,199,_binary ''),(22,3,17,162,206,_binary ''),(22,3,18,179,219,_binary ''),(22,3,19,179,211,_binary '\0'),(22,3,20,144,194,_binary '\0'),(23,1,5,136,181,_binary '\0'),(23,1,6,175,216,_binary ''),(23,1,7,164,193,_binary '\0'),(23,1,8,136,186,_binary '\0'),(23,1,29,159,208,_binary ''),(23,1,30,151,187,_binary '\0'),(23,1,31,177,209,_binary ''),(23,1,32,142,193,_binary ''),(23,2,5,145,190,_binary ''),(23,2,6,175,216,_binary ''),(23,2,7,182,211,_binary ''),(23,2,8,142,192,_binary ''),(23,2,29,136,185,_binary '\0'),(23,2,30,149,185,_binary '\0'),(23,2,31,149,181,_binary '\0'),(23,2,32,136,187,_binary '\0'),(23,3,5,154,199,_binary ''),(23,3,6,177,218,_binary ''),(23,3,7,150,179,_binary ''),(23,3,8,142,192,_binary ''),(23,3,29,135,184,_binary '\0'),(23,3,30,153,189,_binary '\0'),(23,3,31,141,173,_binary '\0'),(23,3,32,140,191,_binary '\0'),(24,1,13,149,190,_binary '\0'),(24,1,14,138,176,_binary '\0'),(24,1,15,154,189,_binary '\0'),(24,1,16,139,191,_binary '\0'),(24,1,21,159,206,_binary ''),(24,1,22,147,185,_binary ''),(24,1,23,193,223,_binary ''),(24,1,24,171,197,_binary ''),(24,2,13,151,192,_binary '\0'),(24,2,14,179,217,_binary ''),(24,2,15,157,192,_binary '\0'),(24,2,16,148,200,_binary ''),(24,2,21,157,204,_binary ''),(24,2,22,172,210,_binary '\0'),(24,2,23,175,205,_binary ''),(24,2,24,169,195,_binary '\0'),(24,3,13,149,190,_binary ''),(24,3,14,163,201,_binary '\0'),(24,3,15,148,183,_binary '\0'),(24,3,16,139,191,_binary '\0'),(24,3,21,138,185,_binary '\0'),(24,3,22,170,208,_binary ''),(24,3,23,168,198,_binary ''),(24,3,24,174,200,_binary ''),(25,1,1,149,196,_binary '\0'),(25,1,2,157,196,_binary '\0'),(25,1,3,152,181,_binary '\0'),(25,1,4,141,193,_binary '\0'),(25,1,29,164,213,_binary ''),(25,1,30,173,210,_binary ''),(25,1,31,187,220,_binary ''),(25,1,32,145,197,_binary ''),(25,2,1,159,206,_binary '\0'),(25,2,2,171,210,_binary ''),(25,2,3,179,208,_binary ''),(25,2,4,135,187,_binary '\0'),(25,2,29,164,213,_binary ''),(25,2,30,156,193,_binary '\0'),(25,2,31,159,192,_binary '\0'),(25,2,32,137,189,_binary ''),(25,3,1,138,185,_binary '\0'),(25,3,2,157,196,_binary ''),(25,3,3,148,177,_binary '\0'),(25,3,4,137,189,_binary '\0'),(25,3,29,147,196,_binary ''),(25,3,30,159,196,_binary ''),(25,3,31,147,180,_binary ''),(25,3,32,148,200,_binary ''),(26,1,5,142,188,_binary '\0'),(26,1,6,166,204,_binary '\0'),(26,1,7,190,220,_binary ''),(26,1,8,142,193,_binary '\0'),(26,1,25,164,212,_binary ''),(26,1,26,174,213,_binary ''),(26,1,27,162,194,_binary '\0'),(26,1,28,145,196,_binary ''),(26,2,5,139,185,_binary '\0'),(26,2,6,163,201,_binary '\0'),(26,2,7,173,203,_binary '\0'),(26,2,8,135,186,_binary '\0'),(26,2,25,139,187,_binary ''),(26,2,26,170,209,_binary ''),(26,2,27,180,212,_binary ''),(26,2,28,136,187,_binary ''),(26,3,5,160,206,_binary ''),(26,3,6,168,206,_binary ''),(26,3,7,174,204,_binary ''),(26,3,8,137,188,_binary '\0'),(26,3,25,152,200,_binary '\0'),(26,3,26,139,178,_binary '\0'),(26,3,27,141,173,_binary '\0'),(26,3,28,138,189,_binary ''),(27,1,9,148,192,_binary '\0'),(27,1,10,174,210,_binary ''),(27,1,11,138,172,_binary '\0'),(27,1,12,148,200,_binary ''),(27,1,21,155,201,_binary ''),(27,1,22,156,194,_binary '\0'),(27,1,23,147,175,_binary ''),(27,1,24,166,192,_binary '\0'),(27,2,9,150,194,_binary ''),(27,2,10,169,205,_binary '\0'),(27,2,11,141,175,_binary '\0'),(27,2,12,147,199,_binary ''),(27,2,21,146,192,_binary '\0'),(27,2,22,174,212,_binary ''),(27,2,23,179,207,_binary ''),(27,2,24,160,186,_binary '\0'),(27,3,9,152,196,_binary ''),(27,3,10,175,211,_binary ''),(27,3,11,191,225,_binary ''),(27,3,12,148,200,_binary ''),(27,3,21,144,190,_binary '\0'),(27,3,22,147,185,_binary '\0'),(27,3,23,147,175,_binary '\0'),(27,3,24,171,197,_binary '\0'),(28,1,13,140,181,_binary '\0'),(28,1,14,155,193,_binary '\0'),(28,1,15,170,206,_binary '\0'),(28,1,16,138,190,_binary ''),(28,1,17,165,209,_binary ''),(28,1,18,172,210,_binary ''),(28,1,19,185,216,_binary ''),(28,1,20,140,190,_binary ''),(28,2,13,149,190,_binary '\0'),(28,2,14,162,200,_binary '\0'),(28,2,15,140,176,_binary '\0'),(28,2,16,135,187,_binary '\0'),(28,2,17,153,197,_binary ''),(28,2,18,180,218,_binary ''),(28,2,19,181,212,_binary ''),(28,2,20,142,192,_binary ''),(28,3,13,142,183,_binary '\0'),(28,3,14,135,173,_binary '\0'),(28,3,15,138,174,_binary '\0'),(28,3,16,148,200,_binary ''),(28,3,17,152,196,_binary ''),(28,3,18,140,178,_binary ''),(28,3,19,167,198,_binary ''),(28,3,20,149,199,_binary '\0'),(29,1,1,161,208,_binary ''),(29,1,2,143,181,_binary '\0'),(29,1,3,182,212,_binary ''),(29,1,4,138,191,_binary '\0'),(29,1,9,158,202,_binary '\0'),(29,1,10,161,195,_binary ''),(29,1,11,150,185,_binary '\0'),(29,1,12,145,196,_binary ''),(29,2,1,141,188,_binary ''),(29,2,2,171,209,_binary ''),(29,2,3,145,175,_binary '\0'),(29,2,4,144,197,_binary '\0'),(29,2,9,141,185,_binary '\0'),(29,2,10,160,194,_binary '\0'),(29,2,11,173,208,_binary ''),(29,2,12,150,201,_binary ''),(29,3,1,156,203,_binary ''),(29,3,2,159,197,_binary '\0'),(29,3,3,169,199,_binary '\0'),(29,3,4,146,199,_binary ''),(29,3,9,144,188,_binary '\0'),(29,3,10,164,198,_binary ''),(29,3,11,166,201,_binary ''),(29,3,12,136,187,_binary '\0'),(30,1,5,153,199,_binary ''),(30,1,6,152,189,_binary '\0'),(30,1,7,172,200,_binary ''),(30,1,8,136,187,_binary '\0'),(30,1,13,136,179,_binary '\0'),(30,1,14,165,204,_binary ''),(30,1,15,137,175,_binary '\0'),(30,1,16,148,200,_binary ''),(30,2,5,149,195,_binary '\0'),(30,2,6,159,196,_binary ''),(30,2,7,153,181,_binary '\0'),(30,2,8,149,200,_binary ''),(30,2,13,158,201,_binary ''),(30,2,14,148,187,_binary '\0'),(30,2,15,188,226,_binary ''),(30,2,16,145,197,_binary '\0'),(30,3,5,147,193,_binary '\0'),(30,3,6,151,188,_binary '\0'),(30,3,7,193,221,_binary ''),(30,3,8,143,194,_binary ''),(30,3,13,155,198,_binary ''),(30,3,14,177,216,_binary ''),(30,3,15,145,183,_binary '\0'),(30,3,16,141,193,_binary '\0'),(31,1,17,139,182,_binary '\0'),(31,1,18,144,181,_binary '\0'),(31,1,19,179,209,_binary ''),(31,1,20,147,197,_binary ''),(31,1,25,157,204,_binary ''),(31,1,26,170,209,_binary ''),(31,1,27,168,200,_binary '\0'),(31,1,28,143,194,_binary '\0'),(31,2,17,155,198,_binary '\0'),(31,2,18,148,185,_binary '\0'),(31,2,19,167,197,_binary '\0'),(31,2,20,141,191,_binary '\0'),(31,2,25,159,206,_binary ''),(31,2,26,165,204,_binary ''),(31,2,27,192,224,_binary ''),(31,2,28,142,193,_binary ''),(31,3,17,136,179,_binary '\0'),(31,3,18,171,208,_binary ''),(31,3,19,157,187,_binary '\0'),(31,3,20,137,187,_binary '\0'),(31,3,25,164,211,_binary ''),(31,3,26,165,204,_binary '\0'),(31,3,27,183,215,_binary ''),(31,3,28,146,197,_binary ''),(32,1,21,136,182,_binary '\0'),(32,1,22,143,180,_binary '\0'),(32,1,23,158,188,_binary '\0'),(32,1,24,174,201,_binary ''),(32,1,29,151,198,_binary ''),(32,1,30,167,204,_binary ''),(32,1,31,184,216,_binary ''),(32,1,32,143,195,_binary '\0'),(32,2,21,158,204,_binary ''),(32,2,22,166,203,_binary ''),(32,2,23,188,218,_binary ''),(32,2,24,167,194,_binary ''),(32,2,29,150,197,_binary '\0'),(32,2,30,166,203,_binary ''),(32,2,31,161,193,_binary '\0'),(32,2,32,137,189,_binary '\0'),(32,3,21,159,205,_binary ''),(32,3,22,145,182,_binary '\0'),(32,3,23,181,211,_binary ''),(32,3,24,168,195,_binary ''),(32,3,29,143,190,_binary '\0'),(32,3,30,161,198,_binary ''),(32,3,31,152,184,_binary '\0'),(32,3,32,139,191,_binary '\0'),(33,1,5,141,187,_binary '\0'),(33,1,6,143,181,_binary ''),(33,1,7,166,194,_binary '\0'),(33,1,8,145,196,_binary '\0'),(33,1,9,152,196,_binary ''),(33,1,10,141,175,_binary '\0'),(33,1,11,169,204,_binary ''),(33,1,12,147,198,_binary ''),(33,2,5,164,210,_binary ''),(33,2,6,147,185,_binary ''),(33,2,7,160,188,_binary '\0'),(33,2,8,147,198,_binary ''),(33,2,9,159,203,_binary '\0'),(33,2,10,140,174,_binary '\0'),(33,2,11,180,215,_binary ''),(33,2,12,138,189,_binary '\0'),(33,3,5,140,186,_binary ''),(33,3,6,171,209,_binary ''),(33,3,7,168,196,_binary '\0'),(33,3,8,140,191,_binary '\0'),(33,3,9,136,180,_binary '\0'),(33,3,10,155,189,_binary '\0'),(33,3,11,194,229,_binary ''),(33,3,12,150,201,_binary ''),(34,1,1,140,187,_binary '\0'),(34,1,2,160,198,_binary '\0'),(34,1,3,152,183,_binary '\0'),(34,1,4,142,195,_binary '\0'),(34,1,13,146,189,_binary ''),(34,1,14,161,199,_binary ''),(34,1,15,170,208,_binary ''),(34,1,16,144,196,_binary ''),(34,2,1,140,187,_binary '\0'),(34,2,2,170,208,_binary ''),(34,2,3,158,189,_binary ''),(34,2,4,137,190,_binary '\0'),(34,2,13,154,197,_binary ''),(34,2,14,170,208,_binary ''),(34,2,15,145,183,_binary '\0'),(34,2,16,141,193,_binary ''),(34,3,1,149,196,_binary '\0'),(34,3,2,146,184,_binary '\0'),(34,3,3,141,172,_binary '\0'),(34,3,4,149,202,_binary ''),(34,3,13,156,199,_binary ''),(34,3,14,148,186,_binary ''),(34,3,15,176,214,_binary ''),(34,3,16,149,201,_binary '\0'),(35,1,21,137,183,_binary '\0'),(35,1,22,157,195,_binary '\0'),(35,1,23,168,197,_binary ''),(35,1,24,163,190,_binary '\0'),(35,1,25,141,187,_binary ''),(35,1,26,158,196,_binary ''),(35,1,27,150,180,_binary '\0'),(35,1,28,147,198,_binary ''),(35,2,21,153,199,_binary '\0'),(35,2,22,155,193,_binary '\0'),(35,2,23,142,171,_binary '\0'),(35,2,24,171,198,_binary ''),(35,2,25,163,209,_binary ''),(35,2,26,157,195,_binary ''),(35,2,27,180,210,_binary ''),(35,2,28,139,190,_binary '\0'),(35,3,21,159,205,_binary ''),(35,3,22,164,202,_binary ''),(35,3,23,160,189,_binary ''),(35,3,24,162,189,_binary '\0'),(35,3,25,136,182,_binary '\0'),(35,3,26,141,179,_binary '\0'),(35,3,27,151,181,_binary '\0'),(35,3,28,144,195,_binary ''),(36,1,17,157,201,_binary '\0'),(36,1,18,157,195,_binary ''),(36,1,19,149,179,_binary ''),(36,1,20,148,198,_binary ''),(36,1,29,162,209,_binary ''),(36,1,30,139,175,_binary '\0'),(36,1,31,138,170,_binary '\0'),(36,1,32,142,194,_binary '\0'),(36,2,17,159,203,_binary ''),(36,2,18,179,217,_binary ''),(36,2,19,192,222,_binary ''),(36,2,20,140,190,_binary '\0'),(36,2,29,153,200,_binary '\0'),(36,2,30,158,194,_binary '\0'),(36,2,31,163,195,_binary '\0'),(36,2,32,142,194,_binary ''),(36,3,17,148,192,_binary '\0'),(36,3,18,174,212,_binary ''),(36,3,19,146,176,_binary '\0'),(36,3,20,139,189,_binary '\0'),(36,3,29,161,208,_binary ''),(36,3,30,173,209,_binary '\0'),(36,3,31,156,188,_binary ''),(36,3,32,143,195,_binary ''),(37,1,1,143,190,_binary '\0'),(37,1,2,139,177,_binary ''),(37,1,3,178,210,_binary ''),(37,1,4,141,194,_binary '\0'),(37,1,17,164,208,_binary ''),(37,1,18,138,174,_binary '\0'),(37,1,19,155,185,_binary '\0'),(37,1,20,149,200,_binary ''),(37,2,1,156,203,_binary '\0'),(37,2,2,143,181,_binary ''),(37,2,3,159,191,_binary '\0'),(37,2,4,144,197,_binary ''),(37,2,17,161,205,_binary ''),(37,2,18,142,178,_binary '\0'),(37,2,19,193,223,_binary ''),(37,2,20,141,192,_binary '\0'),(37,3,1,151,198,_binary '\0'),(37,3,2,165,203,_binary ''),(37,3,3,156,188,_binary '\0'),(37,3,4,148,201,_binary ''),(37,3,17,156,200,_binary ''),(37,3,18,155,191,_binary '\0'),(37,3,19,192,222,_binary ''),(37,3,20,137,188,_binary '\0'),(38,1,5,156,202,_binary '\0'),(38,1,6,155,193,_binary ''),(38,1,7,155,183,_binary '\0'),(38,1,8,138,189,_binary '\0'),(38,1,21,157,203,_binary ''),(38,1,22,136,174,_binary '\0'),(38,1,23,167,197,_binary ''),(38,1,24,173,201,_binary ''),(38,2,5,148,194,_binary ''),(38,2,6,165,203,_binary ''),(38,2,7,167,195,_binary ''),(38,2,8,138,189,_binary '\0'),(38,2,21,144,190,_binary '\0'),(38,2,22,161,199,_binary '\0'),(38,2,23,149,179,_binary '\0'),(38,2,24,176,204,_binary ''),(38,3,5,153,199,_binary ''),(38,3,6,165,203,_binary ''),(38,3,7,165,193,_binary '\0'),(38,3,8,145,196,_binary '\0'),(38,3,21,144,190,_binary '\0'),(38,3,22,151,189,_binary '\0'),(38,3,23,183,213,_binary ''),(38,3,24,171,199,_binary ''),(39,1,9,139,183,_binary '\0'),(39,1,10,146,182,_binary '\0'),(39,1,11,156,189,_binary '\0'),(39,1,12,145,196,_binary '\0'),(39,1,25,154,200,_binary ''),(39,1,26,158,196,_binary ''),(39,1,27,160,191,_binary ''),(39,1,28,148,199,_binary ''),(39,2,9,137,181,_binary ''),(39,2,10,146,182,_binary '\0'),(39,2,11,145,178,_binary ''),(39,2,12,136,187,_binary '\0'),(39,2,25,135,181,_binary ''),(39,2,26,158,196,_binary ''),(39,2,27,144,175,_binary '\0'),(39,2,28,144,195,_binary ''),(39,3,9,150,194,_binary ''),(39,3,10,145,181,_binary ''),(39,3,11,181,214,_binary ''),(39,3,12,147,198,_binary ''),(39,3,25,141,187,_binary '\0'),(39,3,26,136,174,_binary '\0'),(39,3,27,175,206,_binary '\0'),(39,3,28,139,190,_binary '\0'),(40,1,13,161,204,_binary ''),(40,1,14,161,199,_binary '\0'),(40,1,15,173,210,_binary ''),(40,1,16,146,198,_binary ''),(40,1,29,141,187,_binary '\0'),(40,1,30,172,209,_binary ''),(40,1,31,144,177,_binary '\0'),(40,1,32,142,194,_binary '\0'),(40,2,13,155,198,_binary '\0'),(40,2,14,165,203,_binary ''),(40,2,15,143,180,_binary '\0'),(40,2,16,137,189,_binary '\0'),(40,2,29,161,207,_binary ''),(40,2,30,140,177,_binary '\0'),(40,2,31,167,200,_binary ''),(40,2,32,146,198,_binary ''),(40,3,13,140,183,_binary '\0'),(40,3,14,157,195,_binary ''),(40,3,15,191,228,_binary ''),(40,3,16,139,191,_binary ''),(40,3,29,158,204,_binary ''),(40,3,30,137,174,_binary '\0'),(40,3,31,192,225,_binary '\0'),(40,3,32,136,188,_binary '\0'),(41,1,1,143,190,_binary '\0'),(41,1,2,156,195,_binary ''),(41,1,3,162,194,_binary '\0'),(41,1,4,145,197,_binary ''),(41,1,21,151,197,_binary ''),(41,1,22,149,188,_binary '\0'),(41,1,23,178,208,_binary ''),(41,1,24,164,191,_binary '\0'),(41,2,1,156,203,_binary ''),(41,2,2,176,215,_binary ''),(41,2,3,188,220,_binary ''),(41,2,4,137,189,_binary '\0'),(41,2,21,141,187,_binary '\0'),(41,2,22,170,209,_binary '\0'),(41,2,23,145,175,_binary '\0'),(41,2,24,171,198,_binary ''),(41,3,1,142,189,_binary '\0'),(41,3,2,178,217,_binary ''),(41,3,3,149,181,_binary ''),(41,3,4,149,201,_binary ''),(41,3,21,145,191,_binary ''),(41,3,22,141,180,_binary '\0'),(41,3,23,143,173,_binary '\0'),(41,3,24,159,186,_binary '\0'),(42,1,5,147,193,_binary '\0'),(42,1,6,163,201,_binary '\0'),(42,1,7,190,219,_binary ''),(42,1,8,137,188,_binary '\0'),(42,1,17,158,201,_binary ''),(42,1,18,166,204,_binary ''),(42,1,19,142,171,_binary '\0'),(42,1,20,138,189,_binary ''),(42,2,5,147,193,_binary ''),(42,2,6,144,182,_binary '\0'),(42,2,7,171,200,_binary '\0'),(42,2,8,150,201,_binary ''),(42,2,17,135,178,_binary '\0'),(42,2,18,169,207,_binary ''),(42,2,19,191,220,_binary ''),(42,2,20,137,188,_binary '\0'),(42,3,5,145,191,_binary '\0'),(42,3,6,148,186,_binary '\0'),(42,3,7,142,171,_binary '\0'),(42,3,8,140,191,_binary '\0'),(42,3,17,153,196,_binary ''),(42,3,18,154,192,_binary ''),(42,3,19,177,206,_binary ''),(42,3,20,145,196,_binary ''),(43,1,9,156,201,_binary '\0'),(43,1,10,180,217,_binary ''),(43,1,11,175,208,_binary ''),(43,1,12,149,200,_binary ''),(43,1,29,157,203,_binary ''),(43,1,30,137,175,_binary '\0'),(43,1,31,136,169,_binary '\0'),(43,1,32,140,192,_binary '\0'),(43,2,9,148,193,_binary ''),(43,2,10,158,195,_binary '\0'),(43,2,11,151,184,_binary '\0'),(43,2,12,135,186,_binary '\0'),(43,2,29,135,181,_binary '\0'),(43,2,30,163,201,_binary ''),(43,2,31,163,196,_binary ''),(43,2,32,147,199,_binary ''),(43,3,9,159,204,_binary ''),(43,3,10,172,209,_binary ''),(43,3,11,162,195,_binary ''),(43,3,12,140,191,_binary '\0'),(43,3,29,151,197,_binary '\0'),(43,3,30,162,200,_binary '\0'),(43,3,31,148,181,_binary '\0'),(43,3,32,146,198,_binary ''),(44,1,13,157,200,_binary ''),(44,1,14,171,209,_binary '\0'),(44,1,15,148,184,_binary ''),(44,1,16,136,188,_binary ''),(44,1,25,143,189,_binary '\0'),(44,1,26,175,214,_binary ''),(44,1,27,141,173,_binary '\0'),(44,1,28,136,187,_binary '\0'),(44,2,13,153,196,_binary '\0'),(44,2,14,153,191,_binary ''),(44,2,15,153,189,_binary '\0'),(44,2,16,142,194,_binary ''),(44,2,25,153,199,_binary ''),(44,2,26,142,181,_binary '\0'),(44,2,27,178,210,_binary ''),(44,2,28,139,190,_binary '\0'),(44,3,13,157,200,_binary ''),(44,3,14,144,182,_binary '\0'),(44,3,15,166,202,_binary '\0'),(44,3,16,140,192,_binary '\0'),(44,3,25,140,186,_binary '\0'),(44,3,26,148,187,_binary ''),(44,3,27,192,224,_binary ''),(44,3,28,150,201,_binary ''),(45,1,1,164,211,_binary ''),(45,1,2,143,181,_binary ''),(45,1,3,172,204,_binary ''),(45,1,4,136,188,_binary '\0'),(45,1,25,159,206,_binary '\0'),(45,1,26,141,180,_binary '\0'),(45,1,27,167,198,_binary '\0'),(45,1,28,150,201,_binary ''),(45,2,1,153,200,_binary '\0'),(45,2,2,171,209,_binary ''),(45,2,3,164,196,_binary '\0'),(45,2,4,144,196,_binary ''),(45,2,25,163,210,_binary ''),(45,2,26,162,201,_binary '\0'),(45,2,27,183,214,_binary ''),(45,2,28,141,192,_binary '\0'),(45,3,1,163,210,_binary ''),(45,3,2,151,189,_binary '\0'),(45,3,3,160,192,_binary '\0'),(45,3,4,139,191,_binary '\0'),(45,3,25,146,193,_binary '\0'),(45,3,26,164,203,_binary ''),(45,3,27,182,213,_binary ''),(45,3,28,142,193,_binary ''),(46,1,9,162,207,_binary ''),(46,1,10,176,212,_binary ''),(46,1,11,185,218,_binary ''),(46,1,12,136,187,_binary '\0'),(46,1,17,146,189,_binary '\0'),(46,1,18,155,192,_binary '\0'),(46,1,19,158,187,_binary '\0'),(46,1,20,147,198,_binary ''),(46,2,9,151,196,_binary ''),(46,2,10,138,174,_binary '\0'),(46,2,11,162,195,_binary '\0'),(46,2,12,138,189,_binary '\0'),(46,2,17,137,180,_binary '\0'),(46,2,18,145,182,_binary ''),(46,2,19,174,203,_binary ''),(46,2,20,144,195,_binary ''),(46,3,9,146,191,_binary ''),(46,3,10,136,172,_binary '\0'),(46,3,11,148,181,_binary '\0'),(46,3,12,137,188,_binary '\0'),(46,3,17,137,180,_binary '\0'),(46,3,18,138,175,_binary ''),(46,3,19,178,207,_binary ''),(46,3,20,146,197,_binary ''),(47,1,5,136,182,_binary '\0'),(47,1,6,174,212,_binary ''),(47,1,7,166,195,_binary ''),(47,1,8,136,187,_binary '\0'),(47,1,29,161,207,_binary ''),(47,1,30,152,190,_binary '\0'),(47,1,31,138,172,_binary '\0'),(47,1,32,137,189,_binary ''),(47,2,5,164,210,_binary ''),(47,2,6,136,174,_binary '\0'),(47,2,7,170,199,_binary '\0'),(47,2,8,144,195,_binary ''),(47,2,29,154,200,_binary '\0'),(47,2,30,147,185,_binary ''),(47,2,31,188,222,_binary ''),(47,2,32,142,194,_binary '\0'),(47,3,5,151,197,_binary ''),(47,3,6,137,175,_binary '\0'),(47,3,7,150,179,_binary '\0'),(47,3,8,142,193,_binary ''),(47,3,29,150,196,_binary '\0'),(47,3,30,151,189,_binary ''),(47,3,31,186,220,_binary ''),(47,3,32,136,188,_binary '\0'),(48,1,13,150,193,_binary '\0'),(48,1,14,167,205,_binary '\0'),(48,1,15,190,227,_binary ''),(48,1,16,148,200,_binary ''),(48,1,21,154,200,_binary ''),(48,1,22,172,211,_binary ''),(48,1,23,140,171,_binary '\0'),(48,1,24,175,203,_binary ''),(48,2,13,147,190,_binary ''),(48,2,14,140,178,_binary '\0'),(48,2,15,178,215,_binary ''),(48,2,16,146,198,_binary ''),(48,2,21,136,182,_binary '\0'),(48,2,22,161,200,_binary ''),(48,2,23,152,183,_binary '\0'),(48,2,24,160,188,_binary '\0'),(48,3,13,149,192,_binary ''),(48,3,14,151,189,_binary '\0'),(48,3,15,191,228,_binary ''),(48,3,16,141,193,_binary '\0'),(48,3,21,140,186,_binary '\0'),(48,3,22,176,215,_binary ''),(48,3,23,148,179,_binary '\0'),(48,3,24,174,202,_binary ''),(49,1,1,142,188,_binary '\0'),(49,1,2,142,180,_binary '\0'),(49,1,3,162,194,_binary '\0'),(49,1,4,140,192,_binary '\0'),(49,1,29,156,201,_binary ''),(49,1,30,145,184,_binary ''),(49,1,31,184,217,_binary ''),(49,1,32,142,194,_binary ''),(49,2,1,145,191,_binary ''),(49,2,2,167,205,_binary ''),(49,2,3,152,184,_binary '\0'),(49,2,4,143,195,_binary ''),(49,2,29,142,187,_binary '\0'),(49,2,30,144,183,_binary '\0'),(49,2,31,162,195,_binary ''),(49,2,32,138,190,_binary '\0'),(49,3,1,140,186,_binary '\0'),(49,3,2,153,191,_binary '\0'),(49,3,3,189,221,_binary '\0'),(49,3,4,148,200,_binary ''),(49,3,29,160,205,_binary ''),(49,3,30,170,209,_binary ''),(49,3,31,190,223,_binary ''),(49,3,32,140,192,_binary '\0'),(50,1,5,159,205,_binary ''),(50,1,6,174,213,_binary '\0'),(50,1,7,189,218,_binary '\0'),(50,1,8,149,201,_binary ''),(50,1,25,158,204,_binary '\0'),(50,1,26,177,216,_binary ''),(50,1,27,189,219,_binary ''),(50,1,28,141,192,_binary '\0'),(50,2,5,155,201,_binary '\0'),(50,2,6,153,192,_binary '\0'),(50,2,7,195,224,_binary ''),(50,2,8,149,201,_binary ''),(50,2,25,161,207,_binary ''),(50,2,26,175,214,_binary ''),(50,2,27,148,178,_binary '\0'),(50,2,28,137,188,_binary '\0'),(50,3,5,139,185,_binary '\0'),(50,3,6,177,216,_binary ''),(50,3,7,189,218,_binary '\0'),(50,3,8,135,187,_binary '\0'),(50,3,25,164,210,_binary ''),(50,3,26,143,182,_binary '\0'),(50,3,27,189,219,_binary ''),(50,3,28,146,197,_binary ''),(51,1,9,160,205,_binary ''),(51,1,10,150,187,_binary '\0'),(51,1,11,169,202,_binary ''),(51,1,12,144,196,_binary ''),(51,1,21,144,191,_binary '\0'),(51,1,22,173,211,_binary ''),(51,1,23,155,187,_binary '\0'),(51,1,24,166,194,_binary '\0'),(51,2,9,152,197,_binary ''),(51,2,10,176,213,_binary ''),(51,2,11,175,208,_binary '\0'),(51,2,12,150,202,_binary ''),(51,2,21,147,194,_binary '\0'),(51,2,22,135,173,_binary '\0'),(51,2,23,177,209,_binary ''),(51,2,24,178,206,_binary ''),(51,3,9,149,194,_binary ''),(51,3,10,142,179,_binary '\0'),(51,3,11,152,185,_binary '\0'),(51,3,12,140,192,_binary '\0'),(51,3,21,142,189,_binary '\0'),(51,3,22,163,201,_binary ''),(51,3,23,179,211,_binary ''),(51,3,24,171,199,_binary ''),(52,1,13,142,185,_binary '\0'),(52,1,14,171,209,_binary ''),(52,1,15,183,217,_binary ''),(52,1,16,145,197,_binary ''),(52,1,17,149,193,_binary ''),(52,1,18,156,194,_binary '\0'),(52,1,19,175,204,_binary '\0'),(52,1,20,142,193,_binary '\0'),(52,2,13,157,200,_binary ''),(52,2,14,136,174,_binary '\0'),(52,2,15,148,182,_binary '\0'),(52,2,16,141,193,_binary '\0'),(52,2,17,138,182,_binary '\0'),(52,2,18,155,193,_binary ''),(52,2,19,156,185,_binary ''),(52,2,20,147,198,_binary ''),(52,3,13,160,203,_binary ''),(52,3,14,136,174,_binary '\0'),(52,3,15,165,199,_binary '\0'),(52,3,16,148,200,_binary ''),(52,3,17,142,186,_binary '\0'),(52,3,18,138,176,_binary ''),(52,3,19,184,213,_binary ''),(52,3,20,145,196,_binary '\0'),(53,1,1,139,186,_binary '\0'),(53,1,2,145,183,_binary '\0'),(53,1,3,191,223,_binary ''),(53,1,4,146,198,_binary ''),(53,1,5,150,196,_binary ''),(53,1,6,170,208,_binary ''),(53,1,7,156,184,_binary '\0'),(53,1,8,141,192,_binary '\0'),(53,2,1,155,202,_binary ''),(53,2,2,146,184,_binary '\0'),(53,2,3,155,187,_binary ''),(53,2,4,143,195,_binary ''),(53,2,5,137,183,_binary '\0'),(53,2,6,179,217,_binary ''),(53,2,7,142,170,_binary '\0'),(53,2,8,137,188,_binary '\0'),(53,3,1,158,205,_binary '\0'),(53,3,2,138,176,_binary '\0'),(53,3,3,175,207,_binary ''),(53,3,4,140,192,_binary '\0'),(53,3,5,163,209,_binary ''),(53,3,6,155,193,_binary ''),(53,3,7,137,165,_binary '\0'),(53,3,8,147,198,_binary ''),(54,1,9,145,189,_binary ''),(54,1,10,175,212,_binary ''),(54,1,11,136,169,_binary '\0'),(54,1,12,138,189,_binary '\0'),(54,1,13,141,184,_binary '\0'),(54,1,14,157,196,_binary '\0'),(54,1,15,174,208,_binary ''),(54,1,16,149,201,_binary ''),(54,2,9,142,186,_binary '\0'),(54,2,10,170,207,_binary '\0'),(54,2,11,171,204,_binary ''),(54,2,12,146,197,_binary ''),(54,2,13,163,206,_binary ''),(54,2,14,170,209,_binary ''),(54,2,15,166,200,_binary '\0'),(54,2,16,139,191,_binary '\0'),(54,3,9,158,202,_binary ''),(54,3,10,173,210,_binary ''),(54,3,11,182,215,_binary ''),(54,3,12,139,190,_binary '\0'),(54,3,13,147,190,_binary '\0'),(54,3,14,150,189,_binary '\0'),(54,3,15,147,181,_binary '\0'),(54,3,16,141,193,_binary ''),(55,1,17,137,182,_binary '\0'),(55,1,18,153,192,_binary '\0'),(55,1,19,147,175,_binary '\0'),(55,1,20,138,189,_binary '\0'),(55,1,21,155,202,_binary ''),(55,1,22,169,207,_binary ''),(55,1,23,161,193,_binary ''),(55,1,24,170,199,_binary ''),(55,2,17,136,181,_binary '\0'),(55,2,18,155,194,_binary '\0'),(55,2,19,150,178,_binary '\0'),(55,2,20,144,195,_binary '\0'),(55,2,21,148,195,_binary ''),(55,2,22,170,208,_binary ''),(55,2,23,170,202,_binary ''),(55,2,24,172,201,_binary ''),(55,3,17,149,194,_binary ''),(55,3,18,162,201,_binary ''),(55,3,19,183,211,_binary ''),(55,3,20,138,189,_binary '\0'),(55,3,21,138,185,_binary '\0'),(55,3,22,136,174,_binary '\0'),(55,3,23,155,187,_binary '\0'),(55,3,24,169,198,_binary ''),(56,1,25,142,187,_binary ''),(56,1,26,177,216,_binary ''),(56,1,27,143,173,_binary '\0'),(56,1,28,142,193,_binary '\0'),(56,1,29,138,183,_binary '\0'),(56,1,30,135,174,_binary '\0'),(56,1,31,175,207,_binary ''),(56,1,32,143,195,_binary ''),(56,2,25,164,209,_binary ''),(56,2,26,151,190,_binary '\0'),(56,2,27,143,173,_binary ''),(56,2,28,135,186,_binary '\0'),(56,2,29,149,194,_binary '\0'),(56,2,30,155,194,_binary ''),(56,2,31,141,173,_binary ''),(56,2,32,141,193,_binary ''),(56,3,25,163,208,_binary ''),(56,3,26,136,175,_binary '\0'),(56,3,27,182,212,_binary ''),(56,3,28,139,190,_binary '\0'),(56,3,29,156,201,_binary '\0'),(56,3,30,165,204,_binary ''),(56,3,31,138,170,_binary '\0'),(56,3,32,148,200,_binary '');
/*!40000 ALTER TABLE `bowler_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bowlers`
--

DROP TABLE IF EXISTS `bowlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bowlers` (
  `BowlerID` int NOT NULL DEFAULT '0',
  `BowlerLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BowlerFirstName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BowlerMiddleInit` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BowlerAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BowlerCity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BowlerState` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BowlerZip` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BowlerPhoneNumber` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TeamID` int DEFAULT NULL,
  PRIMARY KEY (`BowlerID`),
  KEY `BowlerLastName` (`BowlerLastName`),
  KEY `BowlersTeamID` (`TeamID`),
  CONSTRAINT `Bowlers_FK00` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bowlers`
--

LOCK TABLES `bowlers` WRITE;
/*!40000 ALTER TABLE `bowlers` DISABLE KEYS */;
INSERT INTO `bowlers` VALUES (1,'Fournier','Barbara',NULL,'67 Willow Drive','Bothell','WA','98123','(206) 555-9876',1),(2,'Fournier','David',NULL,'67 Willow Drive','Bothell','WA','98123','(206) 555-9876',1),(3,'Kennedy','John','A','2957 W 33rd','Ballard','WA','98099','(206) 555-7854',1),(4,'Sheskey','Sara','J','17950 N 59th','Seattle','WA','98011','(206) 555-9893',1),(5,'Patterson','Ann','K','16 Maple Lane','Auburn','WA','98002','(206) 555-3487',2),(6,'Patterson','Neil',NULL,'16 Maple Lane','Auburn','WA','98002','(206) 555-3487',2),(7,'Viescas','David','A','16679 NE 42nd Court','Redmond','WA','98052','(206) 882-8878',2),(8,'Viescas','Stephanie',NULL,'16679 NE 42nd Court','Redmond','WA','98052','(206) 882-8878',2),(9,'Black','Alastair',NULL,'4726 - 11th Ave. N.E.','Seattle','WA','98105','(206) 555-1189',3),(10,'Cunningham','David',NULL,'4110 Old Redmond Rd.','Redmond','WA','98052','(206) 555-8122',3),(11,'Kennedy','Angel',NULL,'2957 W 33rd','Ballard','WA','98099','(206) 555-7854',3),(12,'Viescas','Carol','M','16345 NE 32nd Street','Bellevue','WA','98004','(206) 555-7295',3),(13,'Hallmark','Elizabeth',NULL,'Route 2, Box 203B','Woodinville','WA','98072','(206) 555-8990',4),(14,'Hallmark','Gary',NULL,'Route 2, Box 203B','Woodinville','WA','98072','(206) 555-8990',4),(15,'Patterson','Kathryn',NULL,'16 Maple Lane','Auburn','WA','98002','(206) 555-3487',4),(16,'Sheskey','Richard',NULL,'17950 N 59th','Seattle','WA','98011','(206) 555-9893',4),(17,'Hernandez','Kendra',NULL,'47 Harvard Drive','Kirkland','WA','98033','(206) 889-9191',5),(18,'Hernandez','Michael',NULL,'47 Harvard Drive','Kirkland','WA','98033','(206) 889-9191',5),(19,'Viescas','John','L','218 Main Street','Redmond','WA','98052','(206) 881-5596',5),(20,'Viescas','Suzanne','L','218 Main Street','Redmond','WA','98052','(206) 881-5596',5),(21,'Ehrlich','Zachary',NULL,'507 - 20th Ave. E.','Seattle','WA','98122','(206) 555-9857',6),(22,'Hallmark','Alaina',NULL,'Route 2, Box 203B','Woodinville','WA','98072','(206) 555-8990',6),(23,'Viescas','Caleb',NULL,'16679 NE 42nd Court','Redmond','WA','98052','(206) 882-8878',6),(24,'Thompson','Sarah','L','122 Spring Valley Drive','Duvall','WA','98019','(206) 555-8989',6),(25,'Patterson','Megan',NULL,'16 Maple Lane','Auburn','WA','98002','(206) 555-3487',7),(26,'Thompson','Mary','K','122 Spring Valley Drive','Duvall','WA','98019','(206) 555-8989',7),(27,'Thompson','William','G','122 Spring Valley Drive','Duvall','WA','98019','(206) 555-8989',7),(28,'Viescas','Michael','L','218 Main Street','Redmond','WA','98052','(206) 881-5596',7),(29,'Hallmark','Bailey',NULL,'Route 2, Box 203B','Woodinville','WA','98072','(206) 555-8990',8),(30,'Patterson','Rachel',NULL,'16 Maple Lane','Auburn','WA','98002','(206) 555-3487',8),(31,'Pundt','Steve',NULL,'722 Moss Bay Blvd.','Kirkland','WA','98033','(206) 555-3412',8),(32,'Rosales','Joe',NULL,'908 W. Capital Way','Tacoma','WA','98401','(206) 555-9482',8);
/*!40000 ALTER TABLE `bowlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_games`
--

DROP TABLE IF EXISTS `match_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_games` (
  `MatchID` int NOT NULL DEFAULT '0',
  `GameNumber` smallint NOT NULL DEFAULT '0',
  `WinningTeamID` int DEFAULT '0',
  PRIMARY KEY (`MatchID`,`GameNumber`),
  KEY `Team1ID` (`WinningTeamID`),
  KEY `TourneyMatchesMatchGames` (`MatchID`),
  CONSTRAINT `Match_Games_FK00` FOREIGN KEY (`MatchID`) REFERENCES `tourney_matches` (`MatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_games`
--

LOCK TABLES `match_games` WRITE;
/*!40000 ALTER TABLE `match_games` DISABLE KEYS */;
INSERT INTO `match_games` VALUES (1,1,1),(1,3,1),(5,2,1),(10,1,1),(10,3,1),(13,1,1),(13,3,1),(17,2,1),(21,1,1),(21,3,1),(25,2,1),(29,1,1),(29,3,1),(34,2,1),(37,2,1),(41,1,1),(41,3,1),(45,2,1),(49,1,1),(49,3,1),(53,2,1),(1,2,2),(6,2,2),(9,1,2),(9,3,2),(14,1,2),(14,3,2),(18,2,2),(23,1,2),(23,3,2),(26,2,2),(30,1,2),(30,3,2),(33,2,2),(38,2,2),(42,1,2),(42,3,2),(47,2,2),(50,1,2),(50,3,2),(53,1,2),(53,3,2),(2,1,3),(2,3,3),(5,1,3),(5,3,3),(9,2,3),(15,1,3),(15,3,3),(19,2,3),(22,1,3),(22,3,3),(27,2,3),(29,2,3),(33,1,3),(33,3,3),(39,2,3),(43,1,3),(43,3,3),(46,2,3),(51,1,3),(51,3,3),(54,2,3),(2,2,4),(6,1,4),(6,3,4),(10,2,4),(16,1,4),(16,3,4),(20,2,4),(24,1,4),(24,3,4),(28,2,4),(30,2,4),(34,1,4),(34,3,4),(40,2,4),(44,1,4),(44,3,4),(48,2,4),(52,1,4),(52,3,4),(54,1,4),(54,3,4),(3,1,5),(3,3,5),(7,1,5),(7,3,5),(12,1,5),(12,3,5),(13,2,5),(18,1,5),(18,3,5),(22,2,5),(28,1,5),(28,3,5),(31,2,5),(36,2,5),(37,1,5),(37,3,5),(42,2,5),(46,1,5),(46,3,5),(52,2,5),(55,2,5),(3,2,6),(8,2,6),(11,2,6),(14,2,6),(17,1,6),(17,3,6),(24,2,6),(27,1,6),(27,3,6),(32,1,6),(32,3,6),(35,1,6),(35,3,6),(38,1,6),(38,3,6),(41,2,6),(48,1,6),(48,3,6),(51,2,6),(55,1,6),(55,3,6),(4,1,7),(4,3,7),(7,2,7),(11,1,7),(11,3,7),(15,2,7),(20,1,7),(20,3,7),(21,2,7),(26,1,7),(26,3,7),(31,1,7),(31,3,7),(35,2,7),(39,1,7),(39,3,7),(44,2,7),(45,1,7),(45,3,7),(50,2,7),(56,2,7),(4,2,8),(8,1,8),(8,3,8),(12,2,8),(16,2,8),(19,1,8),(19,3,8),(23,2,8),(25,1,8),(25,3,8),(32,2,8),(36,1,8),(36,3,8),(40,1,8),(40,3,8),(43,2,8),(47,1,8),(47,3,8),(49,2,8),(56,1,8),(56,3,8);
/*!40000 ALTER TABLE `match_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `TeamID` int NOT NULL DEFAULT '0',
  `TeamName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CaptainID` int DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  UNIQUE KEY `TeamID` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Marlins',2),(2,'Sharks',5),(3,'Terrapins',12),(4,'Barracudas',16),(5,'Dolphins',20),(6,'Orcas',24),(7,'Manatees',28),(8,'Swordfish',32),(9,'Huckleberrys',7),(10,'MintJuleps',22);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournaments` (
  `TourneyID` int NOT NULL DEFAULT '0',
  `TourneyDate` date DEFAULT NULL,
  `TourneyLocation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`TourneyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournaments`
--

LOCK TABLES `tournaments` WRITE;
/*!40000 ALTER TABLE `tournaments` DISABLE KEYS */;
INSERT INTO `tournaments` VALUES (1,'2012-09-04','Red Rooster Lanes'),(2,'2012-09-11','Thunderbird Lanes'),(3,'2012-09-18','Bolero Lanes'),(4,'2012-09-25','Imperial Lanes'),(5,'2012-10-02','Sports World Lanes'),(6,'2012-10-09','Totem Lanes'),(7,'2012-10-16','Acapulco Lanes'),(8,'2012-10-23','Red Rooster Lanes'),(9,'2012-10-30','Thunderbird Lanes'),(10,'2012-11-06','Bolero Lanes'),(11,'2012-11-13','Imperial Lanes'),(12,'2012-11-20','Sports World Lanes'),(13,'2012-11-27','Totem Lanes'),(14,'2012-12-04','Acapulco Lanes'),(15,'2013-07-12','Red Rooster Lanes'),(16,'2013-07-19','Thunderbird Lanes'),(17,'2013-07-26','Bolero Lanes'),(18,'2013-08-02','Sports World Lanes'),(19,'2013-08-09','Imperial Lanes'),(20,'2013-08-16','Totem Lanes');
/*!40000 ALTER TABLE `tournaments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourney_matches`
--

DROP TABLE IF EXISTS `tourney_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourney_matches` (
  `MatchID` int NOT NULL DEFAULT '0',
  `TourneyID` int DEFAULT '0',
  `Lanes` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OddLaneTeamID` int DEFAULT '0',
  `EvenLaneTeamID` int DEFAULT '0',
  PRIMARY KEY (`MatchID`),
  KEY `Tourney_MatchesEven` (`EvenLaneTeamID`),
  KEY `TourneyMatchesOdd` (`OddLaneTeamID`),
  KEY `TourneyMatchesTourneyID` (`TourneyID`),
  CONSTRAINT `Tourney_Matches_FK00` FOREIGN KEY (`EvenLaneTeamID`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `Tourney_Matches_FK01` FOREIGN KEY (`OddLaneTeamID`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `Tourney_Matches_FK02` FOREIGN KEY (`TourneyID`) REFERENCES `tournaments` (`TourneyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourney_matches`
--

LOCK TABLES `tourney_matches` WRITE;
/*!40000 ALTER TABLE `tourney_matches` DISABLE KEYS */;
INSERT INTO `tourney_matches` VALUES (1,1,'01-02',1,2),(2,1,'03-04',3,4),(3,1,'05-06',5,6),(4,1,'07-08',7,8),(5,2,'21-22',3,1),(6,2,'23-24',4,2),(7,2,'25-26',5,7),(8,2,'27-28',8,6),(9,3,'15-16',2,3),(10,3,'17-18',1,4),(11,3,'19-20',7,6),(12,3,'21-22',5,8),(13,4,'09-10',1,5),(14,4,'11-12',2,6),(15,4,'13-14',3,7),(16,4,'15-16',4,8),(17,5,'11-12',6,1),(18,5,'13-14',5,2),(19,5,'15-16',8,3),(20,5,'17-18',7,4),(21,6,'05-06',1,7),(22,6,'07-08',3,5),(23,6,'09-10',2,8),(24,6,'11-12',4,6),(25,7,'13-14',8,1),(26,7,'15-16',7,2),(27,7,'17-18',6,3),(28,7,'19-20',5,4),(29,8,'21-22',1,3),(30,8,'23-24',2,4),(31,8,'25-26',7,5),(32,8,'27-28',6,8),(33,9,'15-16',3,2),(34,9,'17-18',4,1),(35,9,'19-20',6,7),(36,9,'21-22',8,5),(37,10,'09-10',5,1),(38,10,'11-12',6,2),(39,10,'13-14',7,3),(40,10,'15-16',8,4),(41,11,'11-12',1,6),(42,11,'13-14',2,5),(43,11,'15-16',3,8),(44,11,'17-18',4,7),(45,12,'05-06',7,1),(46,12,'07-08',5,3),(47,12,'09-10',8,2),(48,12,'11-12',6,4),(49,13,'13-14',1,8),(50,13,'15-16',2,7),(51,13,'17-18',3,6),(52,13,'19-20',4,5),(53,14,'01-02',2,1),(54,14,'03-04',4,3),(55,14,'05-06',6,5),(56,14,'07-08',8,7),(57,11,'19-20',10,9);
/*!40000 ALTER TABLE `tourney_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblbowlerratings`
--

DROP TABLE IF EXISTS `ztblbowlerratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblbowlerratings` (
  `BowlerRating` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BowlerLowAvg` smallint DEFAULT NULL,
  `BowlerHighAvg` smallint DEFAULT NULL,
  PRIMARY KEY (`BowlerRating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblbowlerratings`
--

LOCK TABLES `ztblbowlerratings` WRITE;
/*!40000 ALTER TABLE `ztblbowlerratings` DISABLE KEYS */;
INSERT INTO `ztblbowlerratings` VALUES ('League Player',146,160),('Mediocre',121,145),('Novice',0,120),('Pro',186,300),('Team winner',161,185);
/*!40000 ALTER TABLE `ztblbowlerratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblskiplabels`
--

DROP TABLE IF EXISTS `ztblskiplabels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblskiplabels` (
  `LabelCount` int NOT NULL,
  PRIMARY KEY (`LabelCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblskiplabels`
--

LOCK TABLES `ztblskiplabels` WRITE;
/*!40000 ALTER TABLE `ztblskiplabels` DISABLE KEYS */;
INSERT INTO `ztblskiplabels` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60);
/*!40000 ALTER TABLE `ztblskiplabels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztblweeks`
--

DROP TABLE IF EXISTS `ztblweeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztblweeks` (
  `WeekStart` date NOT NULL,
  `WeekEnd` date DEFAULT NULL,
  PRIMARY KEY (`WeekStart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztblweeks`
--

LOCK TABLES `ztblweeks` WRITE;
/*!40000 ALTER TABLE `ztblweeks` DISABLE KEYS */;
INSERT INTO `ztblweeks` VALUES ('2012-01-01','2012-01-07'),('2012-01-08','2012-01-14'),('2012-01-15','2012-01-21'),('2012-01-22','2012-01-28'),('2012-01-29','2012-02-04'),('2012-02-05','2012-02-11'),('2012-02-12','2012-02-18'),('2012-02-19','2012-02-25'),('2012-02-26','2012-03-03'),('2012-03-04','2012-03-10'),('2012-03-11','2012-03-17'),('2012-03-18','2012-03-24'),('2012-03-25','2012-03-31'),('2012-04-01','2012-04-07'),('2012-04-08','2012-04-14'),('2012-04-15','2012-04-21'),('2012-04-22','2012-04-28'),('2012-04-29','2012-05-05'),('2012-05-06','2012-05-12'),('2012-05-13','2012-05-19'),('2012-05-20','2012-05-26'),('2012-05-27','2012-06-02'),('2012-06-03','2012-06-09'),('2012-06-10','2012-06-16'),('2012-06-17','2012-06-23'),('2012-06-24','2012-06-30'),('2012-07-01','2012-07-07'),('2012-07-08','2012-07-14'),('2012-07-15','2012-07-21'),('2012-07-22','2012-07-28'),('2012-07-29','2012-08-04'),('2012-08-05','2012-08-11'),('2012-08-12','2012-08-18'),('2012-08-19','2012-08-25'),('2012-08-26','2012-09-01'),('2012-09-02','2012-09-08'),('2012-09-09','2012-09-15'),('2012-09-16','2012-09-22'),('2012-09-23','2012-09-29'),('2012-09-30','2012-10-06'),('2012-10-07','2012-10-13'),('2012-10-14','2012-10-20'),('2012-10-21','2012-10-27'),('2012-10-28','2012-11-03'),('2012-11-04','2012-11-10'),('2012-11-11','2012-11-17'),('2012-11-18','2012-11-24'),('2012-11-25','2012-12-01'),('2012-12-02','2012-12-08'),('2012-12-09','2012-12-15'),('2012-12-16','2012-12-22'),('2012-12-23','2012-12-29'),('2012-12-30','2013-01-05'),('2013-01-06','2013-01-12'),('2013-01-13','2013-01-19'),('2013-01-20','2013-01-26'),('2013-01-27','2013-02-02'),('2013-02-03','2013-02-09'),('2013-02-10','2013-02-16'),('2013-02-17','2013-02-23'),('2013-02-24','2013-03-02'),('2013-03-03','2013-03-09'),('2013-03-10','2013-03-16'),('2013-03-17','2013-03-23'),('2013-03-24','2013-03-30'),('2013-03-31','2013-04-06'),('2013-04-07','2013-04-13'),('2013-04-14','2013-04-20'),('2013-04-21','2013-04-27'),('2013-04-28','2013-05-04'),('2013-05-05','2013-05-11'),('2013-05-12','2013-05-18'),('2013-05-19','2013-05-25'),('2013-05-26','2013-06-01'),('2013-06-02','2013-06-08'),('2013-06-09','2013-06-15'),('2013-06-16','2013-06-22'),('2013-06-23','2013-06-29'),('2013-06-30','2013-07-06'),('2013-07-07','2013-07-13'),('2013-07-14','2013-07-20'),('2013-07-21','2013-07-27'),('2013-07-28','2013-08-03'),('2013-08-04','2013-08-10'),('2013-08-11','2013-08-17'),('2013-08-18','2013-08-24'),('2013-08-25','2013-08-31'),('2013-09-01','2013-09-07'),('2013-09-08','2013-09-14'),('2013-09-15','2013-09-21'),('2013-09-22','2013-09-28'),('2013-09-29','2013-10-05'),('2013-10-06','2013-10-12'),('2013-10-13','2013-10-19'),('2013-10-20','2013-10-26'),('2013-10-27','2013-11-02'),('2013-11-03','2013-11-09'),('2013-11-10','2013-11-16'),('2013-11-17','2013-11-23'),('2013-11-24','2013-11-30'),('2013-12-01','2013-12-07'),('2013-12-08','2013-12-14'),('2013-12-15','2013-12-21'),('2013-12-22','2013-12-28'),('2013-12-29','2014-01-04'),('2014-01-05','2014-01-11'),('2014-01-12','2014-01-18'),('2014-01-19','2014-01-25'),('2014-01-26','2014-02-01'),('2014-02-02','2014-02-08'),('2014-02-09','2014-02-15'),('2014-02-16','2014-02-22'),('2014-02-23','2014-03-01'),('2014-03-02','2014-03-08'),('2014-03-09','2014-03-15'),('2014-03-16','2014-03-22'),('2014-03-23','2014-03-29'),('2014-03-30','2014-04-05'),('2014-04-06','2014-04-12'),('2014-04-13','2014-04-19'),('2014-04-20','2014-04-26'),('2014-04-27','2014-05-03'),('2014-05-04','2014-05-10'),('2014-05-11','2014-05-17'),('2014-05-18','2014-05-24'),('2014-05-25','2014-05-31'),('2014-06-01','2014-06-07'),('2014-06-08','2014-06-14'),('2014-06-15','2014-06-21'),('2014-06-22','2014-06-28'),('2014-06-29','2014-07-05'),('2014-07-06','2014-07-12'),('2014-07-13','2014-07-19'),('2014-07-20','2014-07-26'),('2014-07-27','2014-08-02'),('2014-08-03','2014-08-09'),('2014-08-10','2014-08-16'),('2014-08-17','2014-08-23'),('2014-08-24','2014-08-30'),('2014-08-31','2014-09-06'),('2014-09-07','2014-09-13'),('2014-09-14','2014-09-20'),('2014-09-21','2014-09-27'),('2014-09-28','2014-10-04'),('2014-10-05','2014-10-11'),('2014-10-12','2014-10-18'),('2014-10-19','2014-10-25'),('2014-10-26','2014-11-01'),('2014-11-02','2014-11-08'),('2014-11-09','2014-11-15'),('2014-11-16','2014-11-22'),('2014-11-23','2014-11-29'),('2014-11-30','2014-12-06'),('2014-12-07','2014-12-13'),('2014-12-14','2014-12-20'),('2014-12-21','2014-12-27');
/*!40000 ALTER TABLE `ztblweeks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 19:06:28
