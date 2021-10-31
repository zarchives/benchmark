-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: myapp
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` varchar(10) NOT NULL,
  `student_code` varchar(10) NOT NULL,
  `english` decimal(10,2) DEFAULT NULL,
  `maths` decimal(10,2) DEFAULT NULL,
  `science` decimal(10,2) DEFAULT NULL,
  `tamil` decimal(10,2) DEFAULT NULL,
  `history` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_exam_student_code` (`exam`,`student_code`),
  KEY `FK_marks_student_code` (`student_code`),
  CONSTRAINT `FK_marks_student_code` FOREIGN KEY (`student_code`) REFERENCES `student` (`student_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,'EX01','SD9000',90.00,85.00,90.00,NULL,NULL),(2,'EX21','DC9001',76.00,90.00,95.00,NULL,NULL),(3,'EX03','SD9000',90.00,85.00,90.00,86.00,75.00),(4,'EX03','SD200',90.00,85.00,90.00,86.00,75.00),(5,'EX03','SD9010',90.00,85.00,90.00,86.00,75.00),(6,'EX01','SD60001',65.00,95.00,89.00,85.00,90.00),(7,'EX02','SD60001',67.00,97.00,91.00,87.00,92.00),(9,'EX01','SD90004',90.00,85.00,NULL,NULL,NULL);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `student_code` varchar(10) NOT NULL,
  `student_class` varchar(10) DEFAULT NULL,
  `last_attended_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_student_code` (`student_code`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'JOHN','2010-12-02','SD9000','5','2021-04-06 10:25:05'),(2,'JOHN','2010-01-02','SD9001','5','2021-02-06 10:25:07'),(3,'ROSE','2012-05-02','DC9001','3','2021-02-06 10:25:07'),(4,'PETER','2010-01-02','SD900','5',NULL),(5,'JOHN','2010-01-02','SD9010','5',NULL),(6,'JOHN','2010-01-02','SD9002','5',NULL),(7,'KONE PETER','2010-01-02','SD9003','5',NULL),(8,'JOHN','2010-01-02','SD9004','5',NULL),(9,'JOHN','2010-01-02','SD9005','5',NULL),(10,'JOHN','2010-01-02','SD9006','5',NULL),(11,'JOHN','2010-01-02','SD9007','5',NULL),(12,'JOHN PAUL','2010-01-02','SD90012','5',NULL),(13,'JOHN SNOW','2010-01-02','SD90002','5',NULL),(14,'ALYSSA','2010-01-02','SD90003','5',NULL),(15,'JOHN SNOW','2010-01-02','SD90004','5',NULL),(16,'PETER','2010-01-02','SD90006','5',NULL),(17,'MONTI','2001-01-01','SD2001','4',NULL),(18,'MONTI','2011-01-01','SD200','4',NULL),(19,'MONTI','2010-01-02','SD2000','4',NULL),(20,'PETERSON','2010-01-01','SD1234','5',NULL),(21,'MONTI','2010-01-02','SD900056','4',NULL),(22,'MONTI','2010-01-02','SD000','5','2021-02-06 10:25:05'),(23,'MONTI','2010-01-02','SD5000','5','2021-02-06 10:25:05'),(24,'JACKSON','2012-07-07','SD2345','4',NULL),(25,'KEVIN','2011-09-09','SD3456','4',NULL),(26,'KATE','2014-08-08','SD5432','7',NULL),(27,'KELVIN','2015-01-01','SD678','6',NULL),(28,'TEST','2011-09-09','SD1999','8',NULL),(29,'JOY','2008-01-02','SD6000','8',NULL),(30,'DAN','2010-02-10','SD60001','6',NULL),(31,'Test student','2000-09-09','sn0001','5',NULL),(32,'ADD STD','2010-07-05','SD2600','6',NULL),(33,'sksuper','2021-06-06','121212','english',NULL),(34,'Vennela','2002-01-02','SD912','4',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-31 22:38:33
