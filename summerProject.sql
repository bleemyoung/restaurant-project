-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 192.168.175.130    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `DEPT`
--

DROP TABLE IF EXISTS `DEPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPT` (
  `DEPTNO` int(2) NOT NULL,
  `DNAME` varchar(14) DEFAULT NULL,
  `LOC` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT`
--

LOCK TABLES `DEPT` WRITE;
/*!40000 ALTER TABLE `DEPT` DISABLE KEYS */;
INSERT INTO `DEPT` VALUES (10,'ACCOUNTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON');
/*!40000 ALTER TABLE `DEPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALGRADE`
--

DROP TABLE IF EXISTS `SALGRADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALGRADE` (
  `GRADE` int(11) DEFAULT NULL,
  `LOSAL` int(11) DEFAULT NULL,
  `HISAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALGRADE`
--

LOCK TABLES `SALGRADE` WRITE;
/*!40000 ALTER TABLE `SALGRADE` DISABLE KEYS */;
INSERT INTO `SALGRADE` VALUES (1,700,1200),(2,1201,1400),(3,1401,2000),(4,2001,3000),(5,3001,9999);
/*!40000 ALTER TABLE `SALGRADE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `name` varchar(255) NOT NULL COMMENT '????????????',
  `price` int(11) NOT NULL COMMENT '????????????',
  `information` varchar(255) DEFAULT NULL COMMENT '????????????????????????????????????',
  `number` int(255) DEFAULT NULL COMMENT '????????????',
  `isfinished` tinyint(1) unsigned DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'?????????',35,'?????????',1,0),(2,'????????????',40,'?????????',1,0),(3,'????????????',18,'?????????',1,0);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `information` varchar(255) DEFAULT NULL,
  `isfinished` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,'?????????',35,'?????????','0'),(2,'????????????',40,'?????????','0'),(3,'????????????',18,'?????????','0');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `EMPNO` int(4) NOT NULL,
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` int(4) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` double(7,2) DEFAULT NULL,
  `COMM` double(7,2) DEFAULT NULL,
  `DEPTNO` int(2) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (7369,'SMITH','?????????',7902,'1980-12-17',800.00,NULL,20),(7499,'ALLEN','?????????',7698,'1981-02-20',1600.00,300.00,30),(7521,'WARD','?????????',7698,'1981-02-22',1250.00,500.00,30),(7566,'JONES','???????????????',7839,'1981-04-02',2975.00,NULL,20),(7654,'MARTIN','????????????',7698,'1981-09-28',1250.00,1400.00,30),(7698,'BLAKE','????????????',7839,'1981-05-01',2850.00,NULL,30),(7782,'CLARK','????????????',7839,'1981-06-09',2450.00,NULL,10),(7788,'SCOTT','????????????',7566,'1987-04-19',3000.00,NULL,20),(7839,'KING','????????????',NULL,'1981-11-17',5000.00,NULL,10),(7844,'TURNER','????????????',7698,'1981-09-08',1500.00,0.00,30),(7876,'ADAMS','????????????',7788,'1987-05-23',1100.00,NULL,20),(7900,'JAMES','????????????',7698,'1981-12-03',950.00,NULL,30),(7902,'FORD','????????????',7566,'1981-12-03',3000.00,NULL,20),(7934,'MILLER','????????????',7782,'1982-01-23',1300.00,NULL,10);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `name` varchar(255) NOT NULL COMMENT '????????????',
  `price` int(11) DEFAULT NULL COMMENT '????????????',
  `information` varchar(255) DEFAULT NULL COMMENT '????????????????????????????????????',
  `number` int(255) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'?????????',35,'?????????',0),(2,'????????????',40,'?????????',0),(3,'????????????',18,'?????????',0),(4,'????????????',15,'?????????',0),(5,'?????????',36,'?????????',0),(6,'????????????',50,'?????????',0),(7,'????????????',25,'?????????',0),(8,'???????????????',29,'?????????',0),(9,'????????????',46,'?????????',0),(10,'?????????',45,'?????????',0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `content` varchar(1000) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1472773993562968066 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'abcde'),(1422862967824752641,'piao'),(1422867157338857473,'buhuizuo'),(1422924829413150721,'xi'),(1472773895890210818,'1233'),(1472773993562968065,'2021.12.20');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `chinese` int(3) DEFAULT NULL,
  `math` int(3) DEFAULT NULL,
  `science` int(3) DEFAULT NULL,
  `english` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (12345,'wang',90,87,88,99),(123446,'zeta',67,66,56,40),(1314444,'wad',55,88,55,55),(3333333,'wda',77,77,77,77),(2113123131,'???',99,99,90,88);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT '??????ID',
  `name` varchar(30) DEFAULT NULL COMMENT '??????',
  `age` int(11) DEFAULT NULL COMMENT '??????',
  `email` varchar(50) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Jack',20,'test2@baomidou.com'),(3,'Tom',28,'test3@baomidou.com'),(4,'Sandy',21,'test4@baomidou.com'),(5,'Billie',24,'test5@baomidou.com'),(6,'lin',11,'11111111111'),(1418132684391071745,'zhang',11,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-20 14:54:38
