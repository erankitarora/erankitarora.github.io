CREATE DATABASE  IF NOT EXISTS `sisdb2015` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sisdb2015`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: sisdb2015
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `cid` int(11) NOT NULL,
  `ccode` varchar(45) NOT NULL,
  `cname` varchar(45) NOT NULL,
  `credits` int(11) NOT NULL,
  `csyllabus` longtext NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'','General',0,'For News',1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `year` date DEFAULT NULL,
  `sem` int(11) NOT NULL,
  PRIMARY KEY (`cid`,`sid`),
  KEY `fk_courses_has_student_student1_idx` (`sid`),
  KEY `fk_enrollment_idx` (`gid`),
  KEY `fk_sem_idx` (`sem`),
  CONSTRAINT `fk_courses_has_student_courses1` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_has_student_student1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment` FOREIGN KEY (`gid`) REFERENCES `grade_master` (`gid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sem` FOREIGN KEY (`sem`) REFERENCES `sem_master` (`semid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `fid` int(11) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `doj` date DEFAULT NULL,
  `phno` varchar(15) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  CONSTRAINT `fid` FOREIGN KEY (`fid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'FACULTY ADMIN','0000-00-00','123456789',NULL);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `sid` int(11) NOT NULL,
  `sid1` int(11) NOT NULL,
  PRIMARY KEY (`sid`,`sid1`),
  KEY `fk_student_has_student_student2_idx` (`sid1`),
  KEY `fk_student_has_student_student1_idx` (`sid`),
  CONSTRAINT `fk_student_has_student_student1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_student_student2` FOREIGN KEY (`sid1`) REFERENCES `student` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_master`
--

DROP TABLE IF EXISTS `grade_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_master` (
  `gid` int(11) NOT NULL,
  `grade_gname` varchar(5) NOT NULL,
  `weightage` decimal(10,0) NOT NULL,
  `passorfail` tinyint(1) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_master`
--

LOCK TABLES `grade_master` WRITE;
/*!40000 ALTER TABLE `grade_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `nid` int(11) NOT NULL,
  `ntitle` varchar(100) NOT NULL,
  `ndetails` longtext NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `fk_news_1_idx` (`cid`),
  KEY `fk_news_2_idx` (`fid`),
  CONSTRAINT `fk_news_1` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_news_2` FOREIGN KEY (`fid`) REFERENCES `faculty` (`fid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'SPIC_MACY','A UK Government white paper has noted that governments \"must produce policies that really deal with problems, that are forward-looking and shaped by evidence rather than a response to short-term pressures; that tackle causes not symptoms\". When we look at how most policies in India get drafted, a continued challenge is the lack of comprehensive data of existing systems and processes. How do we then establish an evidence based policy approach when working with governments ?  In this talk, Sridhar Pabbisetty intends to combine the theoretical understanding of public policy framing put forth by policy researchers, government and multilateral agencies with practitioner oriented case studies showing how an increased amount of evidence can be generated using IT and put to use for continued monitoring and improvement of the policy process. He will particularly focus on the Right to Public Services initiative (Sakala) recently launched by the Government of Karnataka. ',1,1,1),(2,'IBM Challenge','Prior to joining Namma Bengaluru Foundation, Sridhar was the Chief Programs Officer at the Bangalore Political Action Committee (B.PAC - http://www.bpac.in). He has previously served as the Chief Operating Officer of the Centre for Public Policy, IIM Bangalore. and has worked with fast growing hitech companies including Zyme Solutions and Aditi Technologies. Sridhar has a MBA from Indian Institute of Management, Bangalore and BE degree in Computer Science from the Bangalore University.\n',1,1,1),(3,'OOAD Test','By Prof Dinesha',1,1,1),(4,'Talk on OOAD','By Speaker ABCD',1,1,1),(5,'Holidays','Sridhar Pabbisetty is the Chief Executive Officer of Namma Bengaluru Foundation, an organization working towards making Bengaluru a model city. He is also the Chief Enabler at Centre for Inclusive Governance, a citizens collective for social actions on public problems.  Sridhar is a regular speaker at various national and international fora on the issue of open governance and inclusive growth. He has been advisor to the Government of Karnataka \'s Sakala Mission in improving Transparency and Accountability in Governance. He is also part of various government committees including Samarthya - enabling informal waste pickers get formal recognition and simplification of citizen oriented forms in BESCOM. \n \n',1,1,1),(6,'Hackathon','By Amazon',1,1,1),(7,'Sample','one',1,1,1),(8,'Testing','two',1,1,1),(9,'Placement','2015',1,1,1),(10,'SAC','2014',1,1,1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sem_master`
--

DROP TABLE IF EXISTS `sem_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sem_master` (
  `semid` int(11) NOT NULL,
  `semname` varchar(45) NOT NULL,
  PRIMARY KEY (`semid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sem_master`
--

LOCK TABLES `sem_master` WRITE;
/*!40000 ALTER TABLE `sem_master` DISABLE KEYS */;
INSERT INTO `sem_master` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4');
/*!40000 ALTER TABLE `sem_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL,
  `sname` varchar(45) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phno` varchar(15) DEFAULT NULL,
  `lastdegree` varchar(20) DEFAULT NULL,
  `rollno` varchar(20) NOT NULL,
  `currentsem` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `rollno_UNIQUE` (`rollno`),
  KEY `fk_student_sem_idx` (`currentsem`),
  CONSTRAINT `fk_student_sem` FOREIGN KEY (`currentsem`) REFERENCES `sem_master` (`semid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (3,'pavan','0000-00-00','pavan@sis.com','123456789','btech','86',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `fid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `semid` int(11) NOT NULL,
  PRIMARY KEY (`fid`,`cid`),
  KEY `fk_faculty_has_courses_courses1_idx` (`cid`),
  KEY `fk_faculty_has_courses_faculty1_idx` (`fid`),
  KEY `fk_teaches_sem_idx` (`semid`),
  CONSTRAINT `fk_faculty_has_courses_courses1` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_faculty_has_courses_faculty1` FOREIGN KEY (`fid`) REFERENCES `faculty` (`fid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teaches_sem` FOREIGN KEY (`semid`) REFERENCES `sem_master` (`semid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `upwd` varchar(45) NOT NULL,
  `lastloggedin` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `isactive` tinyint(1) NOT NULL,
  `utype` varchar(45) NOT NULL,
  `userimage` longblob,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `uname_UNIQUE` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','2015-02-06 17:55:06',1,'admin',''),(2,'pavan','pavan','2015-02-06 18:31:27',1,'admin',NULL),(3,'student','student','2015-02-06 17:54:02',1,'student',NULL),(4,'faculty','faculty','2015-02-06 17:54:45',1,'faculty',NULL);
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

-- Dump completed on 2015-02-06 23:18:09
