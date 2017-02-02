-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: complaint_resltn_db
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_login_dtls`
--

DROP TABLE IF EXISTS `admin_login_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_login_dtls` (
  `ADMIN_LOGIN_DTLS_ID` char(36) NOT NULL,
  `SOCIETY_DTLS_ID` int(11) DEFAULT NULL,
  `USER_NAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `CHANGE_PASSWORD` enum('y','n') DEFAULT NULL,
  `EMAIL_ID` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_LOGIN_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_login_dtls`
--

LOCK TABLES `admin_login_dtls` WRITE;
/*!40000 ALTER TABLE `admin_login_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_login_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_message_dtls`
--

DROP TABLE IF EXISTS `admin_message_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_message_dtls` (
  `ADMIN_MESSAGE_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECIEVER_FLAT_DTLS_ID` int(11) DEFAULT NULL,
  `MESSAGE` varchar(100) DEFAULT NULL,
  `COMNTN_TYPE` enum('send','receive') DEFAULT NULL,
  `IS_READ` enum('y','n') DEFAULT NULL,
  `IS_REPLIED` enum('y','n') DEFAULT NULL,
  `MESSAGE_STATUS` enum('active','inactive') DEFAULT NULL,
  `IS_SENDER_MSSG_DELETED` enum('y','n') DEFAULT NULL,
  `IS_RECIEVER_MSSG_DELETED` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_MESSAGE_DTLS_ID`),
  KEY `fk_flat_details_idx` (`RECIEVER_FLAT_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_message_dtls`
--

LOCK TABLES `admin_message_dtls` WRITE;
/*!40000 ALTER TABLE `admin_message_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_message_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles_dtls`
--

DROP TABLE IF EXISTS `admin_roles_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles_dtls` (
  `ADMIN_ROLES_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMIN_LOGIN_DTLS_ID` char(36) DEFAULT NULL,
  `ROLES_MASTER_ID` int(11) DEFAULT NULL,
  `IS_ACTIVE` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_ROLES_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles_dtls`
--

LOCK TABLES `admin_roles_dtls` WRITE;
/*!40000 ALTER TABLE `admin_roles_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_roles_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_dtls`
--

DROP TABLE IF EXISTS `area_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_dtls` (
  `AREA_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_DTLS_ID` int(11) DEFAULT NULL,
  `AREA_NM` varchar(50) DEFAULT NULL,
  `AREA_DESC` varchar(300) DEFAULT NULL,
  `AREA_CODE` varchar(5) DEFAULT NULL,
  `AREA_PINCODE` int(11) DEFAULT NULL,
  `LONGITUDE` decimal(10,7) DEFAULT NULL,
  `LATITUDE` decimal(10,7) DEFAULT NULL,
  `IS_ACTIVE` enum('Y','N') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`AREA_DTLS_ID`),
  KEY `fk_city_dtls_id.._idx` (`CITY_DTLS_ID`),
  CONSTRAINT `fk_city_dtls_id..` FOREIGN KEY (`CITY_DTLS_ID`) REFERENCES `city_dtls` (`CITY_DTLS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_dtls`
--

LOCK TABLES `area_dtls` WRITE;
/*!40000 ALTER TABLE `area_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_dtls`
--

DROP TABLE IF EXISTS `building_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_dtls` (
  `BUILDING_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOCIETY_DTLS_ID` int(11) DEFAULT NULL,
  `BUILDING_NM` varchar(100) DEFAULT NULL,
  `NUM_OF_FLOORS` int(11) DEFAULT NULL,
  `NUM_OF_FLATS_PER_FLOOR` int(11) DEFAULT NULL,
  `FLAT_START_NUM` int(11) DEFAULT NULL,
  `IS_ACTIVE` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`BUILDING_DTLS_ID`),
  KEY `fk_building_dtls_idx` (`SOCIETY_DTLS_ID`),
  CONSTRAINT `fk_building_dtls` FOREIGN KEY (`SOCIETY_DTLS_ID`) REFERENCES `society_dtls` (`SOCIETY_DTLS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_dtls`
--

LOCK TABLES `building_dtls` WRITE;
/*!40000 ALTER TABLE `building_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `building_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_dtls`
--

DROP TABLE IF EXISTS `city_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_dtls` (
  `CITY_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATE_DTLS_ID` int(11) DEFAULT NULL,
  `CITY_NM` varchar(50) DEFAULT NULL,
  `CITY_DESC` varchar(300) DEFAULT NULL,
  `LONGITUDE` decimal(10,7) DEFAULT NULL,
  `LATITUDE` decimal(10,7) DEFAULT NULL,
  `IS_ACTIVE` enum('Y','N') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`CITY_DTLS_ID`),
  KEY `fk_DISTRICT_DTLS_ID_idx` (`STATE_DTLS_ID`),
  CONSTRAINT `fk_DISTRICT_DTLS_ID` FOREIGN KEY (`STATE_DTLS_ID`) REFERENCES `state_dtls` (`STATE_DTLS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_dtls`
--

LOCK TABLES `city_dtls` WRITE;
/*!40000 ALTER TABLE `city_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_category_master`
--

DROP TABLE IF EXISTS `complaint_category_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_category_master` (
  `COMPLAINT_CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL,
  `CATEGORY_NM` varchar(50) DEFAULT NULL,
  `CATEGORY_DESCRIPTION` varchar(100) DEFAULT NULL,
  `IS_ACTIVE` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`COMPLAINT_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_category_master`
--

LOCK TABLES `complaint_category_master` WRITE;
/*!40000 ALTER TABLE `complaint_category_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_category_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_category_template_master`
--

DROP TABLE IF EXISTS `complaint_category_template_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_category_template_master` (
  `COMPLAINT_CATEGORY_TEMPLATE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPLAINT_CATEGORY_ID` int(11) DEFAULT NULL,
  `TEMPLATE` varchar(100) DEFAULT NULL,
  `IS_ACTIVE` enum('y','n') DEFAULT NULL,
  `CREATED_TS` enum('y','n') DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` timestamp NULL DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`COMPLAINT_CATEGORY_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_category_template_master`
--

LOCK TABLES `complaint_category_template_master` WRITE;
/*!40000 ALTER TABLE `complaint_category_template_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_category_template_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_dtls`
--

DROP TABLE IF EXISTS `complaint_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_dtls` (
  `COMPLAINT_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLAT_DTLS_ID` int(11) DEFAULT NULL,
  `COMPLAINT_CATEGORY_ID` int(11) DEFAULT NULL,
  `COMPLAINT_CATEGORY_TEMPLATE_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` int(11) DEFAULT NULL,
  `ASGN_VENDOR_DTLS_ID` int(11) DEFAULT NULL,
  `ASSIGNED_TS` timestamp NULL DEFAULT NULL,
  `EXP_RESOLUTION_TS` timestamp NULL DEFAULT NULL,
  `ACT_RESOLUTION_TS` timestamp NULL DEFAULT NULL,
  `FEEDBACK` varchar(200) DEFAULT NULL,
  `STATUS_CD` int(11) DEFAULT NULL,
  `CANCEL_REASON` varchar(200) DEFAULT NULL,
  `CANCEL_TS` timestamp NULL DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`COMPLAINT_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_dtls`
--

LOCK TABLES `complaint_dtls` WRITE;
/*!40000 ALTER TABLE `complaint_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_dtls`
--

DROP TABLE IF EXISTS `country_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_dtls` (
  `COUNTRY_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY_NM` varchar(50) DEFAULT NULL,
  `COUNTRY_DESC` varchar(300) DEFAULT NULL,
  `COUNTRY_CD` varchar(5) DEFAULT NULL,
  `IS_ACTIVE` enum('Y','N') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_DTLS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_dtls`
--

LOCK TABLES `country_dtls` WRITE;
/*!40000 ALTER TABLE `country_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flat_dtls`
--

DROP TABLE IF EXISTS `flat_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flat_dtls` (
  `FLAT_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOCIETY_DTLS_ID` int(11) DEFAULT NULL,
  `BUILDING_DTLS_ID` int(11) DEFAULT NULL,
  `DEVICE_NUM` varchar(100) DEFAULT NULL,
  `FLOOR_NUM` int(11) DEFAULT NULL,
  `FLAT_NUM` int(11) DEFAULT NULL,
  `IS_ACTIVE` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`FLAT_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_dtls`
--

LOCK TABLES `flat_dtls` WRITE;
/*!40000 ALTER TABLE `flat_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `flat_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flat_message_dtls`
--

DROP TABLE IF EXISTS `flat_message_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flat_message_dtls` (
  `FLAT_MESSAGE_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SENDER_FLAT_DTLS_ID` int(11) DEFAULT NULL,
  `RECIEVER_FLAT_DTLS_ID` int(11) DEFAULT NULL,
  `MESSAGE` varchar(100) DEFAULT NULL,
  `IS_READ` enum('y','n') DEFAULT NULL,
  `IS_REPLIED` enum('y','n') DEFAULT NULL,
  `MESSAGE_STATUS` enum('active','inactive') DEFAULT NULL,
  `IS_SENDER_MSSG_DELETED` enum('y','n') DEFAULT NULL,
  `IS_RECIEVER_MSSG_DELETED` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`FLAT_MESSAGE_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_message_dtls`
--

LOCK TABLES `flat_message_dtls` WRITE;
/*!40000 ALTER TABLE `flat_message_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `flat_message_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_data`
--

DROP TABLE IF EXISTS `master_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_data` (
  `MASTER_DATA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GRP` varchar(100) NOT NULL,
  `SUB_GROUP` varchar(150) DEFAULT NULL,
  `DISPLAY_TEXT` varchar(100) DEFAULT NULL,
  `VALUE` varchar(50) DEFAULT NULL,
  `CODE` varchar(10) DEFAULT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL,
  `IS_ACTIVE` enum('Y','N') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`MASTER_DATA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_data`
--

LOCK TABLES `master_data` WRITE;
/*!40000 ALTER TABLE `master_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_master_dtls`
--

DROP TABLE IF EXISTS `role_master_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_master_dtls` (
  `ROLE_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(45) DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ROLE_DTLS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_master_dtls`
--

LOCK TABLES `role_master_dtls` WRITE;
/*!40000 ALTER TABLE `role_master_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_master_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_master`
--

DROP TABLE IF EXISTS `roles_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_master` (
  `ROLES_MASTER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NM` varchar(50) DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ROLES_MASTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_master`
--

LOCK TABLES `roles_master` WRITE;
/*!40000 ALTER TABLE `roles_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society_addr_dtls`
--

DROP TABLE IF EXISTS `society_addr_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `society_addr_dtls` (
  `SOCIETY_ADDR_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ST_ADDR` varchar(200) DEFAULT NULL,
  `LANDMARK` varchar(50) DEFAULT NULL,
  `AREA_DTLS_ID` int(11) DEFAULT NULL,
  `PINCODE` varchar(10) DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`SOCIETY_ADDR_DTLS_ID`),
  KEY `fk_society_addr_idx` (`AREA_DTLS_ID`),
  CONSTRAINT `fk_society_addr` FOREIGN KEY (`AREA_DTLS_ID`) REFERENCES `area_dtls` (`AREA_DTLS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society_addr_dtls`
--

LOCK TABLES `society_addr_dtls` WRITE;
/*!40000 ALTER TABLE `society_addr_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_addr_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society_dtls`
--

DROP TABLE IF EXISTS `society_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `society_dtls` (
  `SOCIETY_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOCIETY_NM` varchar(100) DEFAULT NULL,
  `SOCIETY_AREA_DTLS_ID` int(11) DEFAULT NULL,
  `NUM_OF_BUILDINGS` int(11) DEFAULT NULL,
  `IS_ACTIVE` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`SOCIETY_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society_dtls`
--

LOCK TABLES `society_dtls` WRITE;
/*!40000 ALTER TABLE `society_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_dtls`
--

DROP TABLE IF EXISTS `state_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_dtls` (
  `STATE_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY_DTLS_ID` int(11) DEFAULT NULL,
  `STATE_NM` varchar(50) DEFAULT NULL,
  `STATE_DESC` varchar(300) DEFAULT NULL,
  `STATE_CODE` varchar(5) DEFAULT NULL,
  `LONGITUDE` decimal(10,7) DEFAULT NULL,
  `LATITUDE` decimal(10,7) DEFAULT NULL,
  `IS_ACTIVE` enum('Y','N') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_TS` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`STATE_DTLS_ID`),
  KEY `COUNTRY_DTLS_ID_idx` (`COUNTRY_DTLS_ID`),
  CONSTRAINT `COUNTRY_DTLS_ID` FOREIGN KEY (`COUNTRY_DTLS_ID`) REFERENCES `country_dtls` (`COUNTRY_DTLS_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `state_dtls_ibfk_1` FOREIGN KEY (`COUNTRY_DTLS_ID`) REFERENCES `country_dtls` (`COUNTRY_DTLS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_dtls`
--

LOCK TABLES `state_dtls` WRITE;
/*!40000 ALTER TABLE `state_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `state_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_addr_dtls`
--

DROP TABLE IF EXISTS `vendor_addr_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_addr_dtls` (
  `VENDOR_ADDR_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ST_ADDR` varchar(200) DEFAULT NULL,
  `LANDMARK` varchar(50) DEFAULT NULL,
  `AREA_DTLS_ID` int(11) DEFAULT NULL,
  `PINCODE` varchar(10) DEFAULT NULL,
  `ADDR_TYPE_CD` int(11) DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`VENDOR_ADDR_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_addr_dtls`
--

LOCK TABLES `vendor_addr_dtls` WRITE;
/*!40000 ALTER TABLE `vendor_addr_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_addr_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_dtls`
--

DROP TABLE IF EXISTS `vendor_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_dtls` (
  `VENDOR_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOCIETY_DTLS_ID` int(11) DEFAULT NULL,
  `FIRST_NM` varchar(100) DEFAULT NULL,
  `LAST_NM` varchar(100) DEFAULT NULL,
  `CNTC_NUM` varchar(40) DEFAULT NULL,
  `ALTR_CNTC_NUM` varchar(40) DEFAULT NULL,
  `EXPERTISE_CD` int(11) DEFAULT NULL,
  `VENDOR_ADDR_DTLS_ID` int(11) DEFAULT NULL,
  `IS_ACTIVE` enum('y','n') DEFAULT NULL,
  `CREATED_TS` timestamp NULL DEFAULT NULL,
  `MODIFIED_TS` timestamp NULL DEFAULT NULL,
  `CREATED_BY` char(36) DEFAULT NULL,
  `MODIFIED_BY` char(36) DEFAULT NULL,
  PRIMARY KEY (`VENDOR_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_dtls`
--

LOCK TABLES `vendor_dtls` WRITE;
/*!40000 ALTER TABLE `vendor_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_dtls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-02 18:37:04
