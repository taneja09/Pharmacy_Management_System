-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: Pharmacy_Database_Management
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `Address_Type`
--

DROP TABLE IF EXISTS `Address_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Address_Type` (
  `Address_Type_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Address_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Address_Type_Id`),
  UNIQUE KEY `Address_Type_Id_UNIQUE` (`Address_Type_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address_Type`
--

LOCK TABLES `Address_Type` WRITE;
/*!40000 ALTER TABLE `Address_Type` DISABLE KEYS */;
INSERT INTO `Address_Type` VALUES (4,'Home'),(5,'Work');
/*!40000 ALTER TABLE `Address_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `billing_invoice`
--

DROP TABLE IF EXISTS `billing_invoice`;
/*!50001 DROP VIEW IF EXISTS `billing_invoice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `billing_invoice` AS SELECT 
 1 AS `SALES_ID`,
 1 AS `PATIENT`,
 1 AS `EMPLOYEE`,
 1 AS `PURCHASE_DATE`,
 1 AS `PHARMACY_NAME`,
 1 AS `BILL_AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Drug`
--

DROP TABLE IF EXISTS `Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Drug` (
  `Drug_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Drug_Type_Id` int(11) NOT NULL,
  `Drug_Name` varchar(45) NOT NULL,
  `Drug_Desc` varchar(45) DEFAULT NULL,
  `Drug_Dose` varchar(45) NOT NULL,
  `Drug_Manufacture_Date` date NOT NULL,
  `Drug_Expiration_Date` date NOT NULL,
  `Drug_Cost_Price` double NOT NULL,
  `Manufacturer_Id` int(11) NOT NULL,
  PRIMARY KEY (`Drug_Id`),
  KEY `Manufacturer_Id_FK_idx` (`Manufacturer_Id`),
  KEY `Drug_Type_Id_idx` (`Drug_Type_Id`),
  CONSTRAINT `Drug_Type_Id` FOREIGN KEY (`Drug_Type_Id`) REFERENCES `drug_type` (`drug_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Manufacturer_Id_FK` FOREIGN KEY (`Manufacturer_Id`) REFERENCES `manufacturer_details` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drug`
--

LOCK TABLES `Drug` WRITE;
/*!40000 ALTER TABLE `Drug` DISABLE KEYS */;
INSERT INTO `Drug` VALUES (1,1,'Advil','Advil Neo','300 mg','2018-10-10','2025-11-28',12.5,2),(2,2,'Absorica','Isotretion New Tab','500 mg','2017-10-10','2023-12-23',9.4,2),(3,1,'Accupril','Quainpril hexa','100 mg','2018-08-10','2022-11-23',5,1),(4,2,'Benefix','Co-agulation factor','20 mg','2017-02-13','2024-09-21',8,1),(5,2,'Demerol','Mythelon - Aceton Bi','5 mg','2016-02-13','2022-03-21',20,3),(6,1,'Flagyl','Flocarnet - Sodium','200 mg','2017-08-08','2022-04-25',10,4),(7,1,'Ketamine','Ketamine Hydrochloride','10 mg','2016-06-08','2021-08-20',13,3),(8,2,'Levophed','Noreprinephine','20 mg','2017-11-07','2022-09-22',19,4),(9,2,'Skelaxin','Metaxelone','10 mg','2017-12-09','2023-09-22',29,5),(10,1,'Somavert','Zaleplon','40 mg','2017-10-06','2023-06-20',21,5),(11,1,'Sutent','Nefrlan Acetone','20 mg','2016-07-08','2023-08-09',15,6),(12,2,'Ogen','Oxalitin plaintin','80 mg','2012-09-10','2022-07-12',12,7),(13,2,'Tobramycin','Tribimezed','50 mg','2012-08-10','2021-07-11',12,6),(14,1,'Nardil','Phenelizer','70 mg','2012-09-10','2022-07-12',11,7),(15,1,'Norvic','Amlodipin C','50 mg','2011-09-11','2021-05-10',19,8),(16,2,'Vistrole','vinobrine Asitymine','20 mg','2012-09-10','2022-05-10',19,8);
/*!40000 ALTER TABLE `Drug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `DRUG_Nearing_Expiration` BEFORE INSERT ON `Drug` FOR EACH ROW BEGIN 

IF DATEDIFF(NOW(), NEW.`Drug_Expiration_Date`) < 365
THEN 
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'The Expiration Date Margin is too low ';
end if;
END */;;
DELIMITER ;

--
-- Table structure for table `Drug_Type`
--

DROP TABLE IF EXISTS `Drug_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Drug_Type` (
  `Drug_Type_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Drug_Type` varchar(45) NOT NULL,
  `Drug_Type_Desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Drug_Type_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drug_Type`
--

LOCK TABLES `Drug_Type` WRITE;
/*!40000 ALTER TABLE `Drug_Type` DISABLE KEYS */;
INSERT INTO `Drug_Type` VALUES (1,'Brand','Branded Drug prescribed by Doctor'),(2,'Generic','An alternate low cost Drug');
/*!40000 ALTER TABLE `Drug_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Employee` (
  `Emp_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_First_Name` varchar(45) NOT NULL,
  `Emp_Last_Name` varchar(45) NOT NULL,
  `Emp_Contact` varchar(45) NOT NULL,
  `Emp_City` varchar(45) DEFAULT NULL,
  `Emp_State` varchar(45) DEFAULT NULL,
  `Emp_Zip_Code` varchar(45) DEFAULT NULL,
  `Pharmacy_Id` int(11) NOT NULL,
  PRIMARY KEY (`Emp_Id`),
  UNIQUE KEY `Emp_Id_UNIQUE` (`Emp_Id`),
  KEY `Pharmacy_Id_FK_idx` (`Pharmacy_Id`),
  CONSTRAINT `Pharmacy_Id_FK` FOREIGN KEY (`Pharmacy_Id`) REFERENCES `pharmacy` (`pharmacy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Jones','Miller','8792341256','Tampa','Florida','08234',2),(2,'Gracia','Wilson','2341256897','Phoenix','Arizona','02134',3),(3,'Davis','Brown','1289891232','Denver','Colorado','02198',4),(4,'Jackson','Martin','4545362314','Jacksonville','Florida','09123',4),(5,'Harris','Clark','3425121298','Atlanta','Georgia','02323',5),(6,'Green','Baker','5978831234','Boise','Idaho','04545',5),(7,'Hill','Carter','1972341234','Denver','Colorado','04545',6),(8,'Evan','Turner','9971231234','Honolulu','Hawaii','04545',7),(9,'Parkar','Turner','9288942345','Tampa','Florida','04545',8),(10,'Masie','William','1973894534','Honolulu','Hawaii','04545',9),(11,'Peter','Dinklage','3478823234','Phoenix','Hawaii','04545',9),(12,'Edward','Collin','1973491299','Tampa','Florida','04545',10),(13,'Cook','Roger','3497121254','Honolulu','Hawaii','04545',1),(14,'Bell','Gomez','2134897863','Denver','Colorado','04545',11),(15,'Salene','Gomez','5634891298','Jacksonville','Florida','04545',12),(16,'Cox','Wharton','2378391245','Phoenix','Arizona','04545',13),(17,'Ross','Miller','5466791288','Honolulu','Hawaii','04545',14),(18,'Fisher','Barner','7838891223','Tampa','Florida','04545',15),(19,'Elly','Ford','2315891456','Denver','Colorado','04545',16),(20,'Shaw','Mason','6734891278','Honolulu','Hawaii','04545',17),(21,'Alice','Palmer','8788891345','Phoenix','Arizona','04545',18),(22,'David','John','7788892314','Honolulu','Hawaii','04545',19),(23,'Ryan','Patel','5543891678','Tampa','Florida','04545',20),(24,'Grant','Peter','3458891778','Phoenix','Arizona','04545',20),(25,'Willy','Silva','7678891999','Jacksonville','Florida','04545',21),(26,'Harper','Green','2238894353','Denver','Colorado','04545',22);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HCP_Type`
--

DROP TABLE IF EXISTS `HCP_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `HCP_Type` (
  `HCP_Type_Id` int(11) NOT NULL AUTO_INCREMENT,
  `HCP_Type` varchar(45) DEFAULT NULL,
  `HCP_Type_Desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HCP_Type_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HCP_Type`
--

LOCK TABLES `HCP_Type` WRITE;
/*!40000 ALTER TABLE `HCP_Type` DISABLE KEYS */;
INSERT INTO `HCP_Type` VALUES (1,'General Physician','General Physician for trivial problems'),(2,'Specialist','A specialist for a particular Disease'),(3,'Pharmacist','A pharmacist who prescribes a drug');
/*!40000 ALTER TABLE `HCP_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Healthcare_Provider`
--

DROP TABLE IF EXISTS `Healthcare_Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Healthcare_Provider` (
  `Healthcare_Id` int(11) NOT NULL AUTO_INCREMENT,
  `HCP_First_Name` varchar(45) DEFAULT NULL,
  `HCP_Last_Name` varchar(45) DEFAULT NULL,
  `HCP_Contact` varchar(45) DEFAULT NULL,
  `HCP_CIty` varchar(45) DEFAULT NULL,
  `HCP_State` varchar(45) DEFAULT NULL,
  `HCP_Zip_Code` varchar(45) DEFAULT NULL,
  `HCP_Type_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Healthcare_Id`),
  KEY `HCP_Type_Id_idx` (`HCP_Type_Id`),
  CONSTRAINT `HCP_Type_Id` FOREIGN KEY (`HCP_Type_Id`) REFERENCES `hcp_type` (`hcp_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Healthcare_Provider`
--

LOCK TABLES `Healthcare_Provider` WRITE;
/*!40000 ALTER TABLE `Healthcare_Provider` DISABLE KEYS */;
INSERT INTO `Healthcare_Provider` VALUES (1,'Karz','Wheeler','2817283829','Tampa','Florida','02312',1),(2,'Oliver','Dean','3421689564','Louisville','Kentucky','02524',2),(3,'Bates','Stanly','9812786734','Detroit','Michigan','03124',2),(4,'Mann','Bush','7876523123','Tampa','Florida','07123',3),(5,'Sharp','Bowen','7632123456','Kansas	','Missouri','03213',2),(6,'Hardey','Ramsey','6523142536','Vegas','Nevada','09123',3),(7,'Paul','Ridge','1278342516','Columbus','Ohio','07234',1),(8,'Brady','Webster','6767123498','Portland','Oregon','04343',1);
/*!40000 ALTER TABLE `Healthcare_Provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insurance_Details`
--

DROP TABLE IF EXISTS `Insurance_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Insurance_Details` (
  `Insurance_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Insurance_Type` varchar(45) NOT NULL,
  `Insurance_Details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Insurance_Id`),
  UNIQUE KEY `Insurance_Id_UNIQUE` (`Insurance_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insurance_Details`
--

LOCK TABLES `Insurance_Details` WRITE;
/*!40000 ALTER TABLE `Insurance_Details` DISABLE KEYS */;
INSERT INTO `Insurance_Details` VALUES (1,'PPO','Preferred provider organizations'),(2,'HMO','Health maintenance organizations '),(3,'HDHP','High deductible health plans'),(4,'POS','Point of service'),(5,'EPO','Exclusive provider organization'),(6,'MCR','Medicare Plan'),(7,'MCD','Medicaid Plan');
/*!40000 ALTER TABLE `Insurance_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Inventory` (
  `Inventory_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pharmacy_Id` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Supplier_Supplier_Id` int(11) NOT NULL,
  `Drug_Drug_Id` int(11) NOT NULL,
  PRIMARY KEY (`Inventory_Id`,`Supplier_Supplier_Id`,`Drug_Drug_Id`),
  UNIQUE KEY `Inventory_Id_UNIQUE` (`Inventory_Id`),
  KEY `Pharmacy_Id_FK_idx` (`Pharmacy_Id`),
  KEY `fk_Inventory_Supplier1_idx` (`Supplier_Supplier_Id`),
  KEY `fk_Inventory_Drug1_idx` (`Drug_Drug_Id`),
  CONSTRAINT `Pharmacy_Id1_FK` FOREIGN KEY (`Pharmacy_Id`) REFERENCES `pharmacy` (`pharmacy_id`),
  CONSTRAINT `fk_Inventory_Drug1` FOREIGN KEY (`Drug_Drug_Id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `fk_Inventory_Supplier1` FOREIGN KEY (`Supplier_Supplier_Id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (1,1,300,1,1),(2,1,200,1,2),(3,5,100,1,3),(4,6,250,2,4),(5,1,100,3,6),(6,1,300,4,8),(7,1,400,1,9),(8,5,500,1,10),(9,6,200,2,12),(10,1,300,2,13),(11,2,100,1,1),(12,2,200,1,2),(13,2,300,3,3),(14,2,250,3,4),(15,3,100,1,6),(16,3,300,4,8),(17,3,400,5,9),(18,4,500,1,10),(19,4,200,1,12),(20,4,350,2,13),(21,6,300,2,14),(22,6,200,2,14),(23,4,300,5,15),(24,4,400,5,15),(25,7,300,5,13),(26,11,500,2,16),(27,4,300,2,16),(28,12,300,2,13),(29,22,300,2,13),(30,20,300,2,13),(31,6,200,2,12),(32,1,300,2,13),(33,11,100,1,1),(34,13,200,1,2),(35,13,300,3,3),(36,14,250,3,4),(37,14,100,1,6),(38,16,300,4,8),(39,16,400,5,9),(40,18,500,1,10),(41,18,200,5,12),(42,20,350,4,13),(43,20,300,2,14),(44,20,200,2,14),(45,8,200,1,3),(46,8,300,2,7),(47,8,400,1,4),(48,8,200,2,5),(49,9,250,3,1),(50,9,100,4,16),(51,15,200,5,12),(52,15,300,5,14),(53,15,200,4,16),(54,15,200,3,3);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manufacturer_Details`
--

DROP TABLE IF EXISTS `Manufacturer_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Manufacturer_Details` (
  `Manufacturer_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Manufacturer_Name` varchar(45) DEFAULT NULL,
  `Manu_Contact` varchar(45) DEFAULT NULL,
  `Manu_City` varchar(45) DEFAULT NULL,
  `Manu_State` varchar(45) DEFAULT NULL,
  `Manu_Zip_Code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Manufacturer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manufacturer_Details`
--

LOCK TABLES `Manufacturer_Details` WRITE;
/*!40000 ALTER TABLE `Manufacturer_Details` DISABLE KEYS */;
INSERT INTO `Manufacturer_Details` VALUES (1,'Karina','2315987123','Tempe','Arizona','01672'),(2,'Trish Co','2315987123','Fremont','California','02123'),(3,'Silk Inc','2315987123','Boulder','Colorado','05423'),(4,'Pfizer','7624161234','Baltimore','Maryland','01425'),(5,'Pfizer','2452982349','Newton','Massachusetts','09123'),(6,'Johnson & Johnson','1234561230','Minneapolis','Minnesota','06129'),(7,'Amgen Inc','8912312345','Columbia','Missouri','01245'),(8,'Bayer','2989123498','Buffalo','New York','05523');
/*!40000 ALTER TABLE `Manufacturer_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Patient` (
  `Patient_Id` int(11) NOT NULL AUTO_INCREMENT,
  `P_First_Name` varchar(45) NOT NULL,
  `P_Last_Name` varchar(45) NOT NULL,
  `P_ContactNo` varchar(45) DEFAULT NULL,
  `P_Insurance_Id` int(11) NOT NULL,
  `P_Email_Id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`),
  UNIQUE KEY `Patient_Id_UNIQUE` (`Patient_Id`),
  KEY `Insurance_Id_FK_idx` (`P_Insurance_Id`),
  CONSTRAINT `Insurance_Id_FK` FOREIGN KEY (`P_Insurance_Id`) REFERENCES `insurance_details` (`insurance_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'Brady','Walton','7834526378',1,'brady12@gmail.com'),(2,'Paul','Mason','5634253674',1,'p.mason@gmail.com'),(3,'Stone','Mills','2378934256',2,'stone.m@gmail.com'),(4,'Arnold','Davidson','9876123452',2,'david.arnold@gmail.com'),(5,'Peter','Hawkins','2323456273',4,'pete.hw@gmail.com'),(6,'Ray','Lynn','7878123415',4,'ray.lynn@gmail.com'),(7,'George','Harper','5532876342',3,'george.har@gmail.com'),(8,'Jacob','John','2343452345',5,'jacob@gmail.com'),(9,'Little','Walsh','8734342345',6,'walsh@gmail.com'),(10,'Stanly','Rio','6453235673',6,'rio.stanly@gmail.com');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_Address_Details`
--

DROP TABLE IF EXISTS `Patient_Address_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Patient_Address_Details` (
  `Address_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Address_Type_Id` int(11) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Zip_Code` varchar(45) NOT NULL,
  `Patient_Patient_Id` int(11) NOT NULL,
  PRIMARY KEY (`Address_Id`),
  UNIQUE KEY `P_Address_Id_UNIQUE` (`Address_Id`),
  KEY `Address_Type_FK_idx` (`Address_Type_Id`),
  KEY `fk_Patient_Address_Details_Patient1_idx` (`Patient_Patient_Id`),
  CONSTRAINT `Address_Type_FK` FOREIGN KEY (`Address_Type_Id`) REFERENCES `address_type` (`address_type_id`),
  CONSTRAINT `fk_Patient_Address_Details_Patient1` FOREIGN KEY (`Patient_Patient_Id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_Address_Details`
--

LOCK TABLES `Patient_Address_Details` WRITE;
/*!40000 ALTER TABLE `Patient_Address_Details` DISABLE KEYS */;
INSERT INTO `Patient_Address_Details` VALUES (1,1,'Fremont','California','02134',2),(2,2,'Tulsa','Oklahoma','02341',2),(3,1,'Tempa','Florida','07867',3),(4,1,'Burlington','Vermont','07867',4),(5,1,'Seattle','Washington','07867',5),(6,1,'Austin','Texas','07867',6),(7,1,'Columbus','Ohio','07867',7),(8,1,'Porland','Oregon','07867',8),(9,1,'Tucson','Arizona','07867',9),(10,2,'Georgia','Atlanta','07867',8),(11,1,'Riverside','California','07867',1),(12,1,'Cincinnati','Ohio','07867',10);
/*!40000 ALTER TABLE `Patient_Address_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_prescriptions`
--

DROP TABLE IF EXISTS `patient_prescriptions`;
/*!50001 DROP VIEW IF EXISTS `patient_prescriptions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `patient_prescriptions` AS SELECT 
 1 AS `P_First_Name`,
 1 AS `P_Last_Name`,
 1 AS `Drug_Name`,
 1 AS `Drug_Dose`,
 1 AS `Prescription_Refill_Days`,
 1 AS `Healthcare_Provider`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Pharmacy`
--

DROP TABLE IF EXISTS `Pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Pharmacy` (
  `Pharmacy_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pharmacy_Name` varchar(45) NOT NULL,
  `Pharmacy_Loc_Id` int(11) NOT NULL,
  PRIMARY KEY (`Pharmacy_Id`),
  KEY `Pharmacy_Loc_Id_FK_idx` (`Pharmacy_Loc_Id`),
  CONSTRAINT `Pharmacy_Loc_Id_FK` FOREIGN KEY (`Pharmacy_Loc_Id`) REFERENCES `pharmacy_location` (`pharmacy_loc_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pharmacy`
--

LOCK TABLES `Pharmacy` WRITE;
/*!40000 ALTER TABLE `Pharmacy` DISABLE KEYS */;
INSERT INTO `Pharmacy` VALUES (1,'Kaiser Permanente',1),(2,'CVS',1),(3,'Kroger',2),(4,'Omnicare',3),(5,'Wallgreen',4),(6,'Safeway',5),(7,'Walmart',5),(8,'Walmart',6),(9,'CVS',6),(10,'CVS',7),(11,'CVS',8),(12,'Superfula',8),(13,'Walmart',8),(14,'Wallgreen',8),(15,'Wallgreen',9),(16,'Kroger',10),(17,'Kmart',11),(18,'Cosco Pharmacy',11),(19,'Cosco Pharmacy',12),(20,'Cosco Pharmacy',13),(21,'Wallgreen',13),(22,'CVS',12);
/*!40000 ALTER TABLE `Pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pharmacy_has_Patient`
--

DROP TABLE IF EXISTS `Pharmacy_has_Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Pharmacy_has_Patient` (
  `Pharmacy_Pharmacy_Id` int(11) NOT NULL,
  `Patient_Patient_Id` int(11) NOT NULL,
  `Sales_Id` int(11) NOT NULL,
  `Sale_Date` date NOT NULL,
  PRIMARY KEY (`Pharmacy_Pharmacy_Id`,`Patient_Patient_Id`,`Sales_Id`,`Sale_Date`),
  KEY `fk_Pharmacy_has_Patient_Patient1_idx` (`Patient_Patient_Id`),
  KEY `fk_Pharmacy_has_Patient_Pharmacy1_idx` (`Pharmacy_Pharmacy_Id`),
  CONSTRAINT `fk_Pharmacy_has_Patient_Patient1` FOREIGN KEY (`Patient_Patient_Id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `fk_Pharmacy_has_Patient_Pharmacy1` FOREIGN KEY (`Pharmacy_Pharmacy_Id`) REFERENCES `pharmacy` (`pharmacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pharmacy_has_Patient`
--

LOCK TABLES `Pharmacy_has_Patient` WRITE;
/*!40000 ALTER TABLE `Pharmacy_has_Patient` DISABLE KEYS */;
INSERT INTO `Pharmacy_has_Patient` VALUES (2,1,1,'2018-12-01'),(3,1,2,'2018-11-12'),(4,1,3,'2018-11-21'),(4,1,4,'2016-11-12'),(5,1,28,'2018-12-13'),(5,2,5,'2018-09-12'),(5,2,6,'2018-10-12'),(8,2,7,'2018-11-12'),(8,2,8,'2016-12-01'),(8,2,22,'2018-07-09'),(1,3,9,'2018-07-10'),(9,3,10,'2018-11-12'),(20,3,23,'2017-12-12'),(12,4,11,'2018-12-12'),(15,4,12,'2017-12-12'),(15,4,24,'2018-11-09'),(8,5,15,'2018-10-12'),(9,5,25,'2015-10-12'),(18,5,13,'2018-12-03'),(18,5,14,'2017-11-01'),(1,6,16,'2018-10-09'),(5,6,26,'2016-12-12'),(9,6,17,'2017-12-12'),(5,7,27,'2018-12-12'),(20,7,18,'2018-12-02'),(21,8,19,'2018-01-05'),(22,9,20,'2018-12-12'),(5,10,21,'2018-12-11');
/*!40000 ALTER TABLE `Pharmacy_has_Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pharmacy_inventory_details`
--

DROP TABLE IF EXISTS `pharmacy_inventory_details`;
/*!50001 DROP VIEW IF EXISTS `pharmacy_inventory_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `pharmacy_inventory_details` AS SELECT 
 1 AS `Inventory_Id`,
 1 AS `Pharmacy_Name`,
 1 AS `Pharmacy_Location_Name`,
 1 AS `Pharmacy_Zip_Code`,
 1 AS `Supplier_Name`,
 1 AS `Sup_City`,
 1 AS `Drug_Name`,
 1 AS `Drug_Dose`,
 1 AS `Quantity`,
 1 AS `Drug_Manufacture_Date`,
 1 AS `Drug_Expiration_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Pharmacy_Location`
--

DROP TABLE IF EXISTS `Pharmacy_Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Pharmacy_Location` (
  `Pharmacy_Loc_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pharmacy_Location_Name` varchar(45) DEFAULT NULL,
  `Pharmacy_Zip_Code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Pharmacy_Loc_Id`),
  UNIQUE KEY `Pharmacy_Loc_Id_UNIQUE` (`Pharmacy_Loc_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pharmacy_Location`
--

LOCK TABLES `Pharmacy_Location` WRITE;
/*!40000 ALTER TABLE `Pharmacy_Location` DISABLE KEYS */;
INSERT INTO `Pharmacy_Location` VALUES (1,'Seattle','02456'),(2,'New York','02134'),(3,'Fremont','02897'),(4,'Fremont','02897'),(5,'Boston','02115'),(6,'Chicago','02345'),(7,'Rhode','02763'),(8,'Buffalo','03124'),(9,'Brooklyn','04172'),(10,'Ohio','09123'),(11,'Malden','29813'),(12,'Everette','09123'),(13,'Nashua','17782');
/*!40000 ALTER TABLE `Pharmacy_Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription_Details`
--

DROP TABLE IF EXISTS `Prescription_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Prescription_Details` (
  `Prescription_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_Id` int(11) NOT NULL,
  `HealthCare_Id` int(11) NOT NULL,
  `Prescription_Refill_Id` int(11) NOT NULL,
  PRIMARY KEY (`Prescription_Id`),
  UNIQUE KEY `Prescription_Id_UNIQUE` (`Prescription_Id`),
  KEY `Refill_Id_FK_idx` (`Prescription_Refill_Id`),
  KEY `Patient_Id_FK_idx` (`Patient_Id`),
  KEY `Healthcare_Id_FK_idx` (`HealthCare_Id`),
  CONSTRAINT `Healthcare_Id_FK` FOREIGN KEY (`HealthCare_Id`) REFERENCES `healthcare_provider` (`healthcare_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Patient_Id_FK` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`patient_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Refill_Id_FK` FOREIGN KEY (`Prescription_Refill_Id`) REFERENCES `prescription_refill_details` (`prescription_refill_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription_Details`
--

LOCK TABLES `Prescription_Details` WRITE;
/*!40000 ALTER TABLE `Prescription_Details` DISABLE KEYS */;
INSERT INTO `Prescription_Details` VALUES (1,1,2,1),(2,1,3,2),(3,2,3,1),(4,3,3,2),(5,4,4,3),(6,5,7,1),(7,6,7,1),(8,7,8,2),(9,8,8,2),(10,9,2,1),(11,10,1,1);
/*!40000 ALTER TABLE `Prescription_Details` ENABLE KEYS */;
UNLOCK TABLES;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Doctor_Screen` BEFORE INSERT ON `Prescription_Details` FOR EACH ROW BEGIN 

IF NOT EXISTS
 (SELECT * FROM `Healthcare_Provider` HCP
WHERE HCP.Healthcare_Id = NEW.HealthCare_Id )
THEN 
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'The Healthcare Provider is Invalid ! ';
end if;

END */;;
DELIMITER ;

--
-- Table structure for table `Prescription_Drug`
--

DROP TABLE IF EXISTS `Prescription_Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Prescription_Drug` (
  `Prescription_Details_Prescription_Id` int(11) NOT NULL,
  `Drug_Drug_Id` int(11) NOT NULL,
  PRIMARY KEY (`Prescription_Details_Prescription_Id`,`Drug_Drug_Id`),
  KEY `fk_Prescription_Details_has_Drug_Drug1_idx` (`Drug_Drug_Id`),
  KEY `fk_Prescription_Details_has_Drug_Prescription_Details1_idx` (`Prescription_Details_Prescription_Id`),
  CONSTRAINT `fk_Prescription_Details_has_Drug_Drug1` FOREIGN KEY (`Drug_Drug_Id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `fk_Prescription_Details_has_Drug_Prescription_Details1` FOREIGN KEY (`Prescription_Details_Prescription_Id`) REFERENCES `prescription_details` (`prescription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription_Drug`
--

LOCK TABLES `Prescription_Drug` WRITE;
/*!40000 ALTER TABLE `Prescription_Drug` DISABLE KEYS */;
INSERT INTO `Prescription_Drug` VALUES (3,1),(6,1),(1,2),(3,2),(4,2),(9,2),(1,3),(3,3),(4,3),(2,4),(8,4),(3,7),(5,7),(6,8),(7,8),(11,9),(5,11),(2,12),(6,14),(7,14),(10,16);
/*!40000 ALTER TABLE `Prescription_Drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription_Refill_Details`
--

DROP TABLE IF EXISTS `Prescription_Refill_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Prescription_Refill_Details` (
  `Prescription_Refill_Id` int(11) NOT NULL AUTO_INCREMENT,
  `No_Of_Days` int(11) NOT NULL,
  PRIMARY KEY (`Prescription_Refill_Id`),
  UNIQUE KEY `Prescription_Refill_Id_UNIQUE` (`Prescription_Refill_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription_Refill_Details`
--

LOCK TABLES `Prescription_Refill_Details` WRITE;
/*!40000 ALTER TABLE `Prescription_Refill_Details` DISABLE KEYS */;
INSERT INTO `Prescription_Refill_Details` VALUES (1,15),(2,30),(3,45),(4,60),(5,90),(6,120);
/*!40000 ALTER TABLE `Prescription_Refill_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Sales` (
  `Sales_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_Id` int(11) NOT NULL,
  `Employee_Id` int(11) NOT NULL,
  `Sale_Date` date NOT NULL,
  `Bill_Amount` double NOT NULL,
  `Pharmacy_Id` int(11) NOT NULL,
  `Prescription_Id` int(11) NOT NULL,
  PRIMARY KEY (`Sales_Id`),
  KEY `Patient_Id_FK_idx` (`Patient_Id`),
  KEY `Employee_Id_FK_idx` (`Employee_Id`),
  KEY `Pharmacy_Id_FK_idx` (`Pharmacy_Id`),
  CONSTRAINT `Employee_Id_FK` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `Patient_Id1_FK` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`patient_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Pharmacy_Id2_FK` FOREIGN KEY (`Pharmacy_Id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (1,1,1,'2018-12-01',300,2,1),(2,1,2,'2018-11-12',414,3,1),(3,1,4,'2018-11-21',529,4,2),(4,1,4,'2016-11-12',500,4,2),(5,2,5,'2018-09-12',230,5,3),(6,2,6,'2018-10-12',600,5,3),(7,2,9,'2018-11-12',300,8,3),(8,2,9,'2016-12-01',200,8,3),(9,3,13,'2018-07-10',200,1,4),(10,3,11,'2018-11-12',375,9,4),(11,4,15,'2018-12-12',250,12,5),(12,4,18,'2017-12-12',180,15,5),(13,5,21,'2018-12-03',196,18,6),(14,5,21,'2017-11-01',240,18,6),(15,5,9,'2018-10-12',336,8,6),(16,6,13,'2018-10-09',276,1,7),(17,6,11,'2017-12-12',400,9,7),(18,7,23,'2018-12-02',360,20,8),(19,8,25,'2018-01-05',200,21,9),(20,9,26,'2018-12-12',480,22,10),(21,10,6,'2018-12-11',625,5,11),(22,2,9,'2018-07-09',240,8,3),(23,3,23,'2017-12-12',270,20,4),(24,4,18,'2018-11-09',276,15,5),(25,5,11,'2015-10-12',400,9,6),(26,6,5,'2016-12-12',300,5,7),(27,7,6,'2018-12-12',240,5,8),(28,1,6,'2018-12-13',500,5,2);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales_Drug`
--

DROP TABLE IF EXISTS `Sales_Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Sales_Drug` (
  `Sales_Id` int(11) NOT NULL,
  `Drug_Id` int(11) NOT NULL,
  `Drug_Sale_Price` double NOT NULL,
  `Drug_Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Sales_Id`,`Drug_Id`),
  KEY `fk_Sales_has_Drug_Drug1_idx` (`Drug_Id`),
  KEY `fk_Sales_has_Drug_Sales1_idx` (`Sales_Id`),
  CONSTRAINT `fk_Sales_has_Drug_Drug1` FOREIGN KEY (`Drug_Id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `fk_Sales_has_Drug_Sales1` FOREIGN KEY (`Sales_Id`) REFERENCES `sales` (`sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales_Drug`
--

LOCK TABLES `Sales_Drug` WRITE;
/*!40000 ALTER TABLE `Sales_Drug` DISABLE KEYS */;
INSERT INTO `Sales_Drug` VALUES (1,3,10,10),(1,5,20,10),(2,4,18,23),(3,1,23,23),(4,2,20,25),(5,7,23,10),(6,2,20,30),(7,3,25,12),(8,7,20,10),(9,11,20,10),(10,1,25,15),(11,8,25,10),(12,14,15,12),(13,8,28,7),(14,14,24,10),(15,4,24,14),(16,2,23,12),(17,16,20,20),(18,9,30,12),(19,3,20,10),(20,5,24,20),(21,8,25,25),(22,5,24,10),(23,15,27,10),(24,16,23,12),(25,12,20,20),(26,3,15,20),(27,2,20,12),(28,7,25,20);
/*!40000 ALTER TABLE `Sales_Drug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Calc_Bill_Amt` AFTER INSERT ON `Sales_Drug` FOR EACH ROW UPDATE SALES SET Bill_Amount  = (

SELECT AMOUNT FROM 
(SELECT SALES_ID , SUM(Drug_Sale_Price * Drug_Quantity) AMOUNT FROM SALES_DRUG
GROUP  BY SALES_ID) A,

(SELECT * FROM SALES) B
WHERE A.SALES_ID = B.SALES_ID 
AND B.SALES_ID = SALES.SALES_ID
) */;;
DELIMITER ;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Supplier` (
  `Supplier_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sup_First_Name` varchar(45) NOT NULL,
  `Sup_Last_Name` varchar(45) NOT NULL,
  `Sup_Contact_No` varchar(45) NOT NULL,
  `Sup_City` varchar(45) NOT NULL,
  `Sup_State` varchar(45) DEFAULT NULL,
  `Sup_Zip_Code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Supplier_Id`),
  UNIQUE KEY `Supplier_Id_UNIQUE` (`Supplier_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'Karla','John','2343456273','Boston','Massachussets','02115'),(2,'Jilly','Denver','9845627312','Malden','Massachussets','02435'),(3,'Kenny','Davidson','1923195634','Texas','Illinois','02435'),(4,'Sara','Jason','2341278634','Seattle','California','01456'),(5,'Tiara','macy','9812312345','Washington','California','02343');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Pharmacy_Database_Management'
--
/*!50003 DROP PROCEDURE IF EXISTS `Refill_Reminder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Refill_Reminder`()
Begin

SELECT  * FROM (
SELECT pres.prescription_id, 
concat_ws(" ",p.p_first_name,p.p_last_name) Patient, p.P_ContactNo as Patient_Contact, p.P_Email_id as Patient_Email,
latest_fill, Refill.No_Of_Days, ADDDATE(latest_fill,No_Of_Days) AS Refill_Due FROM (
SELECT prescription_id, max(sale_date) as latest_fill FROM SALES
group by prescription_id)T

inner join prescription_details pres on pres.prescription_id = T. prescription_id
INNER JOIN `Prescription_Refill_Details` Refill on pres.prescription_refill_id = Refill.Prescription_Refill_Id
inner join patient p on pres.patient_id = p.patient_id)T2  WHERE curdate() > Refill_Due;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Revenue_of_Year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Revenue_of_Year`(in year_1 DATE)
Begin
SELECT Pharmacy_Name, (Selling - Purchase) AS Revenue FROM (
SELECT Pharmacy_Name, SUM(Cost_Price) Purchase, SUM(Selling_Price) Selling from (
SELECT Pharmacy_Name, Drug_Id, SUM(Drug_Quantity * Drug_Cost_Price) as Cost_Price, SUM(Drug_Quantity * Drug_Sale_Price) as Selling_Price
from 
(
SELECT  distinct  Pharmacy.Pharmacy_Name, Pharmacy.Pharmacy_Id, s.sales_id,
d.Drug_Id, Drug_Sale_Price, d.Drug_Quantity,Drug_Cost_Price
 FROM sales s
inner join Sales_Drug d on s.Sales_Id = d.Sales_Id
inner join drug on d.drug_id = drug.drug_id  
Inner join  Inventory Inv on Inv.Pharmacy_Id = s.Pharmacy_Id   
Inner join Pharmacy ON Pharmacy.Pharmacy_Id = s.Pharmacy_Id
where year(s.Sale_Date) = YEAR(year_1)
)T1 group by Pharmacy_Name, Drug_Id
)T2 group by Pharmacy_Name
)T3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `billing_invoice`
--

/*!50001 DROP VIEW IF EXISTS `billing_invoice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `billing_invoice` AS select `sales`.`Sales_Id` AS `SALES_ID`,concat_ws(' ',`patient`.`P_First_Name`,`patient`.`P_Last_Name`) AS `PATIENT`,concat_ws(' ',`employee`.`Emp_First_Name`,`employee`.`Emp_Last_Name`) AS `EMPLOYEE`,`sales`.`Sale_Date` AS `PURCHASE_DATE`,`PHARMA`.`Pharmacy_Name` AS `PHARMACY_NAME`,`sales`.`Bill_Amount` AS `BILL_AMOUNT` from (((`patient` join `sales` on((`sales`.`Patient_Id` = `patient`.`Patient_Id`))) join `employee` on((`employee`.`Emp_Id` = `sales`.`Employee_Id`))) join `pharmacy` `PHARMA` on((`PHARMA`.`Pharmacy_Id` = `sales`.`Pharmacy_Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_prescriptions`
--

/*!50001 DROP VIEW IF EXISTS `patient_prescriptions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_prescriptions` AS select `patient`.`P_First_Name` AS `P_First_Name`,`patient`.`P_Last_Name` AS `P_Last_Name`,`drug`.`Drug_Name` AS `Drug_Name`,`drug`.`Drug_Dose` AS `Drug_Dose`,`Refill`.`No_Of_Days` AS `Prescription_Refill_Days`,concat_ws(' ',`HCP`.`HCP_First_Name`,`HCP`.`HCP_Last_Name`) AS `Healthcare_Provider` from (((((`patient` join `prescription_details` `Prescription` on((`patient`.`Patient_Id` = `Prescription`.`Patient_Id`))) join `prescription_drug` `Pres_Drug` on((`Prescription`.`Prescription_Id` = `Pres_Drug`.`Prescription_Details_Prescription_Id`))) join `drug` on((`Pres_Drug`.`Drug_Drug_Id` = `drug`.`Drug_Id`))) join `prescription_refill_details` `Refill` on((`Refill`.`Prescription_Refill_Id` = `Prescription`.`Prescription_Refill_Id`))) join `healthcare_provider` `HCP` on((`HCP`.`Healthcare_Id` = `Prescription`.`HealthCare_Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pharmacy_inventory_details`
--

/*!50001 DROP VIEW IF EXISTS `pharmacy_inventory_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pharmacy_inventory_details` AS select `inventory`.`Inventory_Id` AS `Inventory_Id`,`pharmacy`.`Pharmacy_Name` AS `Pharmacy_Name`,`P_Loc`.`Pharmacy_Location_Name` AS `Pharmacy_Location_Name`,`P_Loc`.`Pharmacy_Zip_Code` AS `Pharmacy_Zip_Code`,concat_ws(' ',`supplier`.`Sup_First_Name`,`supplier`.`Sup_Last_Name`) AS `Supplier_Name`,`supplier`.`Sup_City` AS `Sup_City`,`drug`.`Drug_Name` AS `Drug_Name`,`drug`.`Drug_Dose` AS `Drug_Dose`,`inventory`.`Quantity` AS `Quantity`,`drug`.`Drug_Manufacture_Date` AS `Drug_Manufacture_Date`,`drug`.`Drug_Expiration_Date` AS `Drug_Expiration_Date` from ((((`inventory` join `pharmacy` on((`inventory`.`Pharmacy_Id` = `pharmacy`.`Pharmacy_Id`))) join `pharmacy_location` `P_Loc` on((`P_Loc`.`Pharmacy_Loc_Id` = `pharmacy`.`Pharmacy_Loc_Id`))) join `supplier` on((`supplier`.`Supplier_Id` = `inventory`.`Supplier_Supplier_Id`))) join `drug` on((`drug`.`Drug_Id` = `inventory`.`Drug_Drug_Id`))) */;
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

-- Dump completed on 2018-12-13  9:53:02

-- Data Analysis

--
-- Most Selling drug accross all the pharmacy 
--

SELECT * FROM (
SELECT Drug_Name as Most_Selling_Drug, Drug_Desc, Drug_Dose, Drug_Type.Drug_Type, Sold_Quantity, manu. Manufacturer_Name, manu.manu_Contact as Manufacturer_Contact
from 
(
SELECT Drug_id, SUM(drug_quantity) Sold_Quantity FROM Sales s
inner join sales_drug d
on s.sales_id = d.sales_id
GROUP BY drug_id
) T
inner join Drug on Drug.Drug_Id = T.Drug_id
inner join Drug_Type on Drug.Drug_Type_Id = Drug_Type.Drug_Type_Id
inner join Manufacturer_Details manu on manu.Manufacturer_Id = Drug.Manufacturer_Id
)T1
ORDER BY Sold_Quantity DESC
LIMIT 1;

--
-- *Most Successfull Manufacturer
--


Select manufacturer_name, SUM(base_sum) Total_Sale from (
Select manufacturer_name, drug_name, SUM(quantity * Drug_Cost_Price) base_sum from (
Select m.manufacturer_name, drug_name, quantity,Drug_Cost_Price FROM Manufacturer_Details m
inner join drug d
on d.manufacturer_id = m.manufacturer_id
inner join inventory inv
on inv.Drug_Drug_Id = d.drug_id
)T1
Group by manufacturer_name,drug_name
)T2
group by manufacturer_name
order by Total_Sale desc
Limit 1;


--
--  Priviledges --

Create user sysadmin identified by 'sysadmin';
revoke all privileges, grant option from sysadmin;
grant all on Pharmacy_Database_Management.* to sysadmin;
create user sales_divya identified by 'divya';
revoke all privileges, grant option from sales_divya;
grant select on Pharmacy_Database_Management.Drug to sales_divya;
grant select on Pharmacy_Database_Management.HCP_Type to sales_divya;
grant select on Pharmacy_Database_Management.Employee to sales_divya;
grant select on Pharmacy_Database_Management.Healthcare_Provider to sales_divya;
grant all on Pharmacy_Database_Management.Prescription_Details to sales_divya;
grant select, insert, update on Pharmacy_Database_Management.Sales to sales_divya;
grant select, insert, update on Pharmacy_Database_Management.Patient to sales_divya;
grant select,insert, update on Pharmacy_Database_Management.Inventory to sales_divya;

