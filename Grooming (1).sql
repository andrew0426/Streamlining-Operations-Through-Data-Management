-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: mobilepetgrooming2
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `DateTime` datetime NOT NULL,
  `LocationAddress` varchar(90) NOT NULL,
  `PetID` int NOT NULL,
  `AppointmentStatus` enum('Scheduled','Completed','Cancelled') NOT NULL DEFAULT 'Scheduled',
  PRIMARY KEY (`AppointmentID`),
  KEY `FK_PETID_idx` (`PetID`),
  CONSTRAINT `FK_PETID` FOREIGN KEY (`PetID`) REFERENCES `pets` (`PetID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,'2025-03-01 08:00:00','789 Chestnut Blvd, Newark',1,'Cancelled'),(2,'2025-03-01 10:00:00','654 Walnut Ct, Newark',2,'Cancelled'),(3,'2025-03-02 09:00:00','111 Magnolia Ave, Newark',3,'Completed'),(4,'2025-03-02 11:00:00','222 Cypress St, Newark',4,'Completed'),(5,'2025-03-03 08:30:00','333 Willow Rd, Newark',5,'Completed'),(6,'2025-03-03 10:30:00','444 Poplar Ln, Newark',6,'Completed'),(7,'2025-03-04 09:00:00','555 Hickory Dr, Newark',7,'Completed'),(8,'2025-03-31 11:00:00','666 Dogwood Cir, Newark',8,'Scheduled'),(9,'2025-03-30 08:00:00','777 Sycamore Ave, Newark',9,'Scheduled'),(10,'2025-03-31 10:00:00','888 Juniper St, Newark',10,'Scheduled');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `appointmentsforbella`
--

DROP TABLE IF EXISTS `appointmentsforbella`;
/*!50001 DROP VIEW IF EXISTS `appointmentsforbella`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `appointmentsforbella` AS SELECT 
 1 AS `PetName`,
 1 AS `AppointmentID`,
 1 AS `DateTime`,
 1 AS `LocationAddress`,
 1 AS `AppointmentStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `appointmentsperemployee`
--

DROP TABLE IF EXISTS `appointmentsperemployee`;
/*!50001 DROP VIEW IF EXISTS `appointmentsperemployee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `appointmentsperemployee` AS SELECT 
 1 AS `EmployeeFirstName`,
 1 AS `EmployeeLastName`,
 1 AS `TotalAppointments`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `AssignmentID` int NOT NULL AUTO_INCREMENT,
  `StartDateTime` datetime NOT NULL,
  `EndDateTime` datetime NOT NULL,
  `EmployeeID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `ServiceCode` int NOT NULL,
  PRIMARY KEY (`AssignmentID`),
  KEY `FK_EMPLOYEEID_idx` (`EmployeeID`),
  KEY `FK_APPOINTMENTID_idx` (`AppointmentID`),
  KEY `FK_SERVICECODE_idx` (`ServiceCode`),
  CONSTRAINT `FK_APPOINTMENTID` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPLOYEEID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_SERVICECODE` FOREIGN KEY (`ServiceCode`) REFERENCES `services` (`ServiceCode`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,'2025-03-01 08:00:00','2025-03-01 09:00:00',1,1,201),(2,'2025-03-01 08:00:00','2025-03-01 09:00:00',5,1,201),(3,'2025-03-02 09:00:00','2025-03-02 10:30:00',2,2,208),(4,'2025-03-02 09:00:00','2025-03-02 10:30:00',7,2,208),(5,'2025-03-02 11:00:00','2025-03-02 12:00:00',1,3,201),(6,'2025-03-03 10:30:00','2025-03-03 12:00:00',9,4,202),(7,'2025-03-04 10:30:00','2025-03-04 11:30:00',7,5,201),(8,'2025-03-04 10:30:00','2025-03-04 11:30:00',1,5,201),(9,'2025-03-04 11:00:00','2025-03-04 12:30:00',3,7,210),(10,'2025-03-04 11:00:00','2025-03-04 12:30:00',5,7,210);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ClientID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (101,'John Doe','123 Maple Street, Newark','555-123-4567','john.doe@example.com'),(102,'Gio Crisoto','456 Oak Avenue, Newark','555-234-5678','gio.crisosto@example.com'),(103,'Robert Brown','789 Pine Road, Newark','555-345-6789','robert.brown@example.com'),(104,'Emily Johnson','321 Birch Boulevard, Newark','555-456-7890','emily.johnson@example.com'),(105,'Michael Miller','654 Cedar Lane, Newark','555-567-8901','michael.miller@example.com'),(106,'Sarah Davis','987 Spruce Court, Newark','555-678-9012','sarah.davis@example.com'),(107,'Daniel Wilson','147 Elm Street, Newark','555-789-0123','daniel.wilson@example.com'),(108,'Laura Martinez','258 Aspen Avenue, Newark','555-890-1234','laura.martinez@example.com'),(109,'James Anderson','369 Redwood Drive, Newark','555-901-2345','james.anderson@example.com'),(110,'Lisa Taylor','741 Fir Way, Newark','555-012-3456','lisa.taylor@example.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `JobRole` varchar(50) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Kevin','Adams','123 Maple St, Newark','555-111-2222','kevin.adams@example.com','Driver'),(2,'Susan','Carter','456 Oak St, Newark','555-333-4444','susan.carter@example.com','Driver'),(3,'Brian','Johnson','789 Pine St, Newark','555-555-6666','brian.johnson@example.com','Driver'),(4,'Emily','Roberts','987 Spruce Ct, Newark','555-678-9012','ethan.moore@example.com','Cleaning Staff'),(5,'Isabella','Garcia','147 Elm St, Newark','555-789-0123','isabella.garcia@example.com','Groomer'),(6,'Sofia','Davis','789 Pine St, Newark','555-345-6789','sophia.davis@example.com','Receptionsit'),(7,'Lucas','Martinez','258 Aspen Ave, Newark','555-890-1234','lucas.martinez@example.com','Groomer'),(8,'Ava','Thompson','369 Redwood Dr, Newark','555-901-2345','ava.thompson@example.com','Inventory Manager'),(9,'Mason','White','741 Fir Way, Newark','555-012-3456','mason.white@example.com','Groomer'),(10,'Ethan','Moore','189 Elm St, Newark','555-962-0132','ethan.moore@example.com','Marketing Specialist');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `PetID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Breed` varchar(30) DEFAULT NULL,
  `Age` int NOT NULL,
  `PetType` varchar(25) NOT NULL,
  `ClientID` int NOT NULL,
  `Size` enum('Small','Medium','Large') NOT NULL,
  PRIMARY KEY (`PetID`),
  KEY `FK_CLIENTS_idx` (`ClientID`),
  CONSTRAINT `FK_CLIENTS` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'Spot','Syrian',1,'Hamster',102,'Small'),(2,'Ginnie','German Shepherd',7,'Dog',102,'Large'),(3,'Max','Golden Retriever',5,'Dog',101,'Medium'),(4,'Bella','Persian',3,'Cat',103,'Small'),(5,'Charlie','N/A',3,'Bird',105,'Small'),(6,'Daisy','French Bulldog',4,'Dog',104,'Medium'),(7,'Oliver','N/A',2,'Rabbit',105,'Small'),(8,'Luna','Siamese',6,'Cat',107,'Small'),(9,'Rocky','Beagle',7,'Dog',108,'Medium'),(10,'Coco','Pomeranian',2,'Dog',108,'Small');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `petsandowners`
--

DROP TABLE IF EXISTS `petsandowners`;
/*!50001 DROP VIEW IF EXISTS `petsandowners`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `petsandowners` AS SELECT 
 1 AS `PetName`,
 1 AS `OwnerName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceCode` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ServiceCode`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (201,'Regular Full Grooming Package',90.00),(202,'Bath and Blow Dry',40.00),(203,'Nail Trimming',15.00),(204,'Teeth Cleaning',20.00),(205,'Ear Cleaning',15.00),(206,'Fur Deshedding Treatment',40.00),(207,'Flea and Tick Removal',80.00),(208,'Puppy/Kitten Grooming Package',95.00),(209,'Senior Pet Grooming Package',95.00),(210,'Exotic Pet Grooming Package',115.00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `totalrevenuebyservice`
--

DROP TABLE IF EXISTS `totalrevenuebyservice`;
/*!50001 DROP VIEW IF EXISTS `totalrevenuebyservice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalrevenuebyservice` AS SELECT 
 1 AS `ServiceName`,
 1 AS `TotalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `upcomingappointments`
--

DROP TABLE IF EXISTS `upcomingappointments`;
/*!50001 DROP VIEW IF EXISTS `upcomingappointments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `upcomingappointments` AS SELECT 
 1 AS `PetName`,
 1 AS `OwnerName`,
 1 AS `AppointmentDate`,
 1 AS `Location`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `appointmentsforbella`
--

/*!50001 DROP VIEW IF EXISTS `appointmentsforbella`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointmentsforbella` AS select `pets`.`Name` AS `PetName`,`appointments`.`AppointmentID` AS `AppointmentID`,`appointments`.`DateTime` AS `DateTime`,`appointments`.`LocationAddress` AS `LocationAddress`,`appointments`.`AppointmentStatus` AS `AppointmentStatus` from (`pets` join `appointments` on((`pets`.`PetID` = `appointments`.`PetID`))) where (`pets`.`Name` = 'Bella') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `appointmentsperemployee`
--

/*!50001 DROP VIEW IF EXISTS `appointmentsperemployee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointmentsperemployee` AS select `employees`.`FirstName` AS `EmployeeFirstName`,`employees`.`LastName` AS `EmployeeLastName`,count(`assignments`.`AppointmentID`) AS `TotalAppointments` from (`employees` join `assignments` on((`employees`.`EmployeeID` = `assignments`.`EmployeeID`))) group by `employees`.`FirstName`,`employees`.`LastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `petsandowners`
--

/*!50001 DROP VIEW IF EXISTS `petsandowners`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `petsandowners` AS select `pets`.`Name` AS `PetName`,`clients`.`Name` AS `OwnerName` from (`pets` join `clients` on((`pets`.`ClientID` = `clients`.`ClientID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalrevenuebyservice`
--

/*!50001 DROP VIEW IF EXISTS `totalrevenuebyservice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalrevenuebyservice` AS select `services`.`Description` AS `ServiceName`,sum(`services`.`Price`) AS `TotalRevenue` from (`services` join `assignments` on((`services`.`ServiceCode` = `assignments`.`ServiceCode`))) group by `services`.`Description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `upcomingappointments`
--

/*!50001 DROP VIEW IF EXISTS `upcomingappointments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `upcomingappointments` AS select `pets`.`Name` AS `PetName`,`clients`.`Name` AS `OwnerName`,`appointments`.`DateTime` AS `AppointmentDate`,`appointments`.`LocationAddress` AS `Location` from ((`pets` join `clients` on((`pets`.`ClientID` = `clients`.`ClientID`))) join `appointments` on((`pets`.`PetID` = `appointments`.`PetID`))) where (`appointments`.`DateTime` > now()) */;
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

-- Dump completed on 2025-04-13 23:57:07
