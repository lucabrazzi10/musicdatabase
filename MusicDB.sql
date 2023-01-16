-- MySQL dump 10.13  Distrib 5.7.29, for Linux (i686)
--
-- Host: localhost    Database: MusicDB
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.16.04.1

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
-- Current Database: `MusicDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MusicDB` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `MusicDB`;

--
-- Table structure for table `Albums`
--

DROP TABLE IF EXISTS `Albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Albums` (
  `albumId` int(4) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `artistId` int(4) DEFAULT NULL,
  PRIMARY KEY (`albumId`),
  KEY `Albums_Artist_FK` (`artistId`),
  CONSTRAINT `Albums_Artist_FK` FOREIGN KEY (`artistId`) REFERENCES `Artist` (`artistId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (101,'Heavens','Rap',1992,204),(102,'Glory','Hip-Hop',1994,203),(103,'King','Pop',1994,201),(104,'Love','Blues',1992,203),(105,'Blessings','Blues',1995,204);
/*!40000 ALTER TABLE `Albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artist`
--

DROP TABLE IF EXISTS `Artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artist` (
  `artistId` int(4) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `songId` varchar(4) DEFAULT NULL,
  `albumId` int(4) DEFAULT NULL,
  `label` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`artistId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artist`
--

LOCK TABLES `Artist` WRITE;
/*!40000 ALTER TABLE `Artist` DISABLE KEYS */;
INSERT INTO `Artist` VALUES (201,'Sean','A11',103,'ROX'),(202,'Al-K',NULL,NULL,'EME'),(203,'BW','A13',104,'ROX'),(204,'Fol-B','A15',105,'ROX'),(205,'Nosa',NULL,NULL,'ChocCity');
/*!40000 ALTER TABLE `Artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Songs`
--

DROP TABLE IF EXISTS `Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Songs` (
  `songsId` varchar(4) NOT NULL,
  `songtitle` varchar(20) DEFAULT NULL,
  `artistId` int(4) DEFAULT NULL,
  `albumId` int(4) DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`songsId`),
  KEY `Songs_Artist_FK` (`artistId`),
  KEY `Songs_Albums_FK` (`albumId`),
  CONSTRAINT `Songs_Albums_FK` FOREIGN KEY (`albumId`) REFERENCES `Albums` (`albumId`),
  CONSTRAINT `Songs_Artist_FK` FOREIGN KEY (`artistId`) REFERENCES `Artist` (`artistId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs`
--

LOCK TABLES `Songs` WRITE;
/*!40000 ALTER TABLE `Songs` DISABLE KEYS */;
INSERT INTO `Songs` VALUES ('A11','We Win',201,103,'AfroPop'),('A12','BackUp',204,101,'Rap'),('A13','Lovin U',203,104,'Blues'),('A14','I move',203,102,'HipHop'),('A15','Drive',204,105,'Blues');
/*!40000 ALTER TABLE `Songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Streams`
--

DROP TABLE IF EXISTS `Streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Streams` (
  `subId` varchar(4) NOT NULL,
  `songsId` varchar(4) NOT NULL,
  `freq` int(6) DEFAULT NULL,
  PRIMARY KEY (`songsId`,`subId`),
  KEY `streams_sub_FK` (`subId`),
  CONSTRAINT `streams_songs_FK` FOREIGN KEY (`songsId`) REFERENCES `Songs` (`songsId`),
  CONSTRAINT `streams_sub_FK` FOREIGN KEY (`subId`) REFERENCES `Subscribers` (`subId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Streams`
--

LOCK TABLES `Streams` WRITE;
/*!40000 ALTER TABLE `Streams` DISABLE KEYS */;
INSERT INTO `Streams` VALUES ('S03','A11',16),('S05','A11',8),('S02','A12',32),('S04','A12',19),('S03','A13',15),('S01','A14',28),('S01','A15',19),('S04','A15',2);
/*!40000 ALTER TABLE `Streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscribers`
--

DROP TABLE IF EXISTS `Subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subscribers` (
  `subId` varchar(4) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscribers`
--

LOCK TABLES `Subscribers` WRITE;
/*!40000 ALTER TABLE `Subscribers` DISABLE KEYS */;
INSERT INTO `Subscribers` VALUES ('S01','dleon@gmail.com','Leon','Dean'),('S02','limary@gmail.com','Mary','Li'),('S03','naahmed@hotmail.com','Na','Ahmed'),('S04','yangk@hotmail.com','Kiram','Yang'),('S05','malove@pvamu.com','Margret','Love');
/*!40000 ALTER TABLE `Subscribers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-23 11:21:50
