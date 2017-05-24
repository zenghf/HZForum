-- MySQL dump 10.13  Distrib 5.7.17, for osx10.12 (x86_64)
--
-- Host: localhost    Database: df
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Current Database: `df`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `df` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `df`;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `comment_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `rid` (`rid`),
  KEY `uid` (`uid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `reply` (`rid`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `request_url` varchar(300) DEFAULT NULL,
  `context_path` varchar(30) DEFAULT NULL,
  `remote_addr` varchar(30) DEFAULT NULL,
  `access_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-10-25 00:45:45'),(2,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-10-25 00:47:37'),(3,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-10-25 01:26:04'),(4,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-10-25 13:54:04'),(5,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-10-25 13:54:52'),(6,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-10-25 14:03:23'),(7,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-10-25 14:18:38'),(8,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-10-25 14:18:49'),(9,'http://localhost:8080/df/toIndex.do','/df','0:0:0:0:0:0:0:1','2016-11-12 04:22:21'),(10,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-10 19:11:56'),(11,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-10 19:12:34'),(12,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-11 14:43:05'),(13,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-11 14:45:10'),(14,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-11 14:45:12'),(15,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-11 14:46:10'),(16,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-11 14:46:15'),(17,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 11:57:11'),(18,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 11:57:13'),(19,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 11:57:32'),(20,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 11:57:48'),(21,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 11:58:21'),(22,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 11:59:03'),(23,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 11:59:14'),(24,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 12:00:35'),(25,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 12:00:38'),(26,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 12:00:40'),(27,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 12:03:04'),(28,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-16 15:32:33'),(29,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 15:33:55'),(30,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-16 15:52:22'),(31,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 15:56:27'),(32,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 15:57:09'),(33,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 15:58:46'),(34,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 15:59:08'),(35,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 15:59:45'),(36,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 16:51:23'),(37,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 16:51:40'),(38,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 17:04:00'),(39,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 17:07:28'),(40,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 17:13:20'),(41,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 17:29:41'),(42,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-16 17:32:18'),(43,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:14:49'),(44,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:22:24'),(45,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:27:13'),(46,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:32:20'),(47,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:32:43'),(48,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:47:35'),(49,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:50:17'),(50,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:50:36'),(51,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:56:43'),(52,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 00:57:09'),(53,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 01:05:50'),(54,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 01:06:16'),(55,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-17 01:10:18'),(56,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-17 01:12:35'),(57,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 00:50:23'),(58,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 00:54:00'),(59,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:05:56'),(60,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:06:36'),(61,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:38:37'),(62,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:49:36'),(63,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:50:48'),(64,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:52:21'),(65,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:52:43'),(66,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:55:55'),(67,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:56:29'),(68,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:56:42'),(69,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:56:45'),(70,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:56:48'),(71,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:56:49'),(72,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:56:51'),(73,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:56:58'),(74,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-19 01:57:04'),(75,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 01:58:03'),(76,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 01:58:06'),(77,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 01:58:12'),(78,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 01:58:36'),(79,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:11:17'),(80,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:14:11'),(81,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:14:21'),(82,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:14:26'),(83,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:18:24'),(84,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:22:14'),(85,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:22:27'),(86,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:22:36'),(87,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:24:50'),(88,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:24:51'),(89,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 02:26:03'),(90,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:34:19'),(91,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:44:43'),(92,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:44:57'),(93,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:45:01'),(94,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:45:06'),(95,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:45:08'),(96,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:45:10'),(97,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:45:12'),(98,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:45:31'),(99,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:45:38'),(100,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:45:53'),(101,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:51:15'),(102,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:54:06'),(103,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:57:54'),(104,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:58:07'),(105,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:58:20'),(106,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:58:41'),(107,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 04:58:48'),(108,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:02:03'),(109,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:10:26'),(110,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:11:54'),(111,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:12:06'),(112,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:12:24'),(113,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:12:33'),(114,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:12:42'),(115,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:13:59'),(116,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:15:00'),(117,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:17:30'),(118,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:18:14'),(119,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:19:52'),(120,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:21:14'),(121,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:21:24'),(122,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:21:27'),(123,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:21:29'),(124,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:21:47'),(125,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:46:50'),(126,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:46:55'),(127,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:47:06'),(128,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:48:02'),(129,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:48:11'),(130,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:50:23'),(131,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:50:30'),(132,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 05:59:12'),(133,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:01:17'),(134,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:01:40'),(135,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:01:50'),(136,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:08:45'),(137,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:09:14'),(138,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:09:15'),(139,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:09:18'),(140,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:09:27'),(141,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:09:30'),(142,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:09:32'),(143,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:09:49'),(144,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:13:58'),(145,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:14:46'),(146,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:15:42'),(147,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:15:44'),(148,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:16:07'),(149,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:18:27'),(150,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-19 06:22:11'),(151,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-24 02:00:13'),(152,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-24 02:31:19'),(153,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-24 02:31:52'),(154,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-24 02:31:55'),(155,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-24 02:32:17'),(156,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-24 02:32:18'),(157,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-24 02:32:20'),(158,'http://127.0.0.1:8080/','','127.0.0.1','2017-05-24 02:32:22'),(159,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 02:32:28'),(160,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 02:32:30'),(161,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 02:39:04'),(162,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 02:39:06'),(163,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 02:39:07'),(164,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 02:39:08'),(165,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 02:39:10'),(166,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 02:39:42'),(167,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 03:10:41'),(168,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:22:56'),(169,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:22:57'),(170,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:22:59'),(171,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:23:00'),(172,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:23:02'),(173,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:23:02'),(174,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:23:08'),(175,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:23:13'),(176,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:24:51'),(177,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:24:55'),(178,'http://127.0.0.1:8080/toIndex','','127.0.0.1','2017-05-24 13:24:56');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `other_id` int(11) NOT NULL,
  `other_username` varchar(20) NOT NULL,
  `post_id` int(11) NOT NULL,
  `operation` varchar(20) NOT NULL,
  `displayed_content` varchar(100) NOT NULL,
  `msg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,15,15,'HZ_9365',22,'liked your post','Java spring ','2017-05-16 12:00:57'),(2,15,15,'HZ_9365',22,'liked your post','Java spring ','2017-05-16 12:00:59');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` text,
  `publish_time` varchar(30) NOT NULL,
  `reply_time` varchar(30) NOT NULL,
  `reply_count` int(11) DEFAULT '0',
  `like_count` int(11) DEFAULT '0',
  `scan_count` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `topic` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'test1','test content1','2016-10-24 07:10:11','2016-10-24 07:10:11',0,0,0,8,10),(2,'test2','test content2','2016-10-24 07:10:13','2016-10-24 07:10:13',0,0,0,4,12),(3,'test3','test content3','2016-10-24 07:10:14','2016-10-24 07:10:14',0,0,0,3,4),(4,'test4','test content4','2016-10-24 07:10:15','2016-10-24 07:10:15',0,0,0,4,7),(5,'test5','test content5','2016-10-24 07:10:16','2016-10-24 07:10:16',0,0,21,1,10),(6,'test6','test content6','2016-10-24 07:10:17','2016-10-24 07:10:17',0,0,0,9,6),(7,'test7','test content7','2016-10-24 07:10:18','2016-10-24 07:10:18',0,0,0,1,6),(8,'test8','test content8','2016-10-24 07:10:19','2016-10-24 07:10:19',0,0,0,9,9),(9,'test9','test content9','2016-10-24 07:10:20','2016-10-24 07:10:20',0,0,0,3,10),(10,'test10','test content10','2016-10-24 07:10:21','2016-10-24 07:10:21',0,0,0,1,8),(11,'test11','test content11','2016-10-24 07:10:22','2016-10-24 07:10:22',0,0,0,8,7),(12,'test12','test content12','2016-10-24 07:10:23','2016-10-24 07:10:23',0,0,0,9,8),(13,'test13','test content13','2016-10-24 07:10:24','2016-10-24 07:10:24',0,0,1,4,4),(14,'test14','test content14','2016-10-24 07:10:25','2016-10-24 07:10:25',0,0,0,8,5),(15,'test15','test content15','2016-10-24 07:10:26','2016-10-24 07:10:26',0,0,0,4,3),(16,'test16','test content16','2016-10-24 07:10:28','2016-10-24 07:10:28',0,0,0,4,12),(17,'test17','test content17','2016-10-24 07:10:29','2016-10-24 07:10:29',0,0,0,3,8),(18,'test18','test content18','2016-10-24 07:10:30','2016-10-24 07:10:30',0,0,0,7,11),(19,'test19','test content19','2016-10-24 07:10:31','2016-10-24 07:10:31',0,0,0,5,6),(20,'test20','test content20','2016-10-24 07:10:32','2016-10-24 07:10:32',0,0,1,2,6),(21,'POST with image','<p><img src=\"http://od6v5lenq.bkt.clouddn.com/22f3b086-01f5-4e3a-8f8b-77cc9d4cfa2d.jpg\" alt=\"a\" style=\"max-width:100%;\"><br></p><p><br></p>','2016-10-25 10:10:17','2016-10-25 10:10:17',0,0,3,1,6),(22,'Java spring ','<p>java spring </p>','2017-5-16 07:58:44','2017-5-16 07:58:44',0,0,8,15,1),(23,'post without tag','<p>it doesn\'t belong to any of the tags. </p>','2017-5-16 12:52:26','2017-5-16 12:52:26',0,0,17,15,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `reply_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `content` varchar(50) DEFAULT '',
  `image` varchar(100) DEFAULT '',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'General','Currently no description!','/image/default.png'),(2,'Python','Currently no description!','/image/default.png'),(3,'Data Structure','Currently no description!','/image/default.png'),(4,'Algorithms','Currently no description!','/image/default.png'),(5,'Operating System','Currently no description!','/image/default.png'),(6,'Computer Networking','Currently no description!','/image/default.png'),(7,'Database','Currently no description!','/image/default.png'),(8,'Compiler Principles','Currently no description!','/image/default.png'),(9,'Software Engineering','Currently no description!','/image/default.png'),(10,'Java','Currently no description!','/image/default.png'),(11,'C','Currently no description!','/image/default.png'),(12,'C++','Currently no description!','/image/default.png'),(13,'#{topic}','Currently no description!','/image/default.png'),(14,'aaa','Currently no description!','/image/default.png'),(15,'afasfas','Currently no description!','/image/default.png'),(16,'abcdefg','Currently no description!','/image/default.png'),(17,'1213123123','Currently no description!','/image/default.png');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `actived` int(11) NOT NULL,
  `activate_code` varchar(60) NOT NULL,
  `join_time` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `description` varchar(30) DEFAULT '',
  `head_url` varchar(100) NOT NULL,
  `position` varchar(20) DEFAULT '',
  `school` varchar(20) DEFAULT '',
  `job` varchar(20) DEFAULT '',
  `like_count` int(11) DEFAULT '0',
  `post_count` int(11) DEFAULT '0',
  `scan_count` int(11) DEFAULT '0',
  `follow_count` int(11) DEFAULT '0',
  `follower_count` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1@1.com','000000',1,'14773075675632ad6199d5f3e4d908299ac20fc05c72c','2016-10-24 07:10:47','2034','','/image/programmer.jpg','','','',0,4,0,0,0),(2,'2@2.com','000000',1,'14773075685817d1efc76a9384392997c07fba1081c45','2016-10-24 07:10:48','7339','','/image/programmer.jpg','','','',0,1,0,0,0),(3,'3@3.com','000000',1,'14773075698454b2d54a9d4cc49369350ddb6b4dfdeda','2016-10-24 07:10:49','3888','','/image/programmer.jpg','','','',0,3,2,0,0),(4,'4@4.com','000000',1,'1477307570872b3e42b049ca14c928b58b12d9875c21f','2016-10-24 07:10:50','4957','','/image/programmer.jpg','','','',0,5,0,0,0),(5,'5@5.com','000000',1,'1477307571881b64840b082704c349af1d991997e5195','2016-10-24 07:10:51','2276','','/image/programmer.jpg','','','',0,1,0,0,0),(6,'6@6.com','000000',1,'147730757289032677af172084dd3ab87899467e2d65b','2016-10-24 07:10:52','7566','','/image/programmer.jpg','','','',0,0,0,0,0),(7,'7@7.com','000000',1,'14773075739073f418583d3784030ad92af942a6e5a9f','2016-10-24 07:10:53','7150','','/image/programmer.jpg','','','',0,1,0,0,0),(8,'8@8.com','000000',1,'1477307574999c7b474240b414be2a56409a931ddf83e','2016-10-24 07:10:55','8956','','/image/programmer.jpg','','','',0,3,0,0,0),(9,'9@9.com','000000',1,'147730757601867cab426b96943968352ea1e3ff76317','2016-10-24 07:10:56','7084','','/image/programmer.jpg','','','',0,3,0,0,0),(10,'10@10.com','000000',1,'14773075770730fb573de1e4d4538945c7cad9d52300f','2016-10-24 07:10:57','3524','','/image/programmer.jpg','','','',0,0,0,0,0),(15,'zenghaifeng@gmail.com','asdfgh',0,'1494444440664703e4f1ef27e4abaadffffcdca8cdde2','2017-05-10 03:05:20','HZ_9365','','/image/programmer.jpg','','','',0,2,1,0,0),(16,'zenghaifeng1@gmail.com','asdfgh',0,'1494445329387269e30389d8941f69f8ae8ec19334a8a','2017-05-10 03:05:09','HZ_2038','','/image/programmer.jpg','','','',0,0,0,0,0),(17,'sdafasf@gmail.com','asdfgh',0,'14944454296853b858238c95b4b869772c6a3d15ad206','2017-05-10 03:05:49','HZ_6044','','/image/programmer.jpg','','','',0,0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-24  9:44:48
