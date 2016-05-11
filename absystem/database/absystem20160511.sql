-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: absystem
-- ------------------------------------------------------
-- Server version	5.5.35-1ubuntu1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) NOT NULL COMMENT '管理员姓名',
  `email` varchar(255) NOT NULL COMMENT '管理员邮箱',
  `pwd` varchar(60) NOT NULL,
  `role_id` int(11) NOT NULL COMMENT '用户组ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(1启用,0未启用)',
  `at` datetime DEFAULT NULL COMMENT '添加时间戳',
  `ut` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (3,'1','1','21',1,11,'2016-04-24 02:40:19','2016-04-23 18:40:19'),(5,'admin','123','e10adc3949ba59abbe56e057f20f883e',1,1,'2016-04-24 02:40:47','2016-04-27 13:50:13'),(6,'tes','tews','13241',1,1,'2016-05-11 10:17:19','2016-05-11 02:17:19'),(7,'test','tset','213',1,1,'2016-05-11 10:17:28','2016-05-11 02:17:35'),(8,'jofw','fjwoer1','231',1,1,'2016-05-11 11:57:36','2016-05-11 03:57:36'),(9,'123','213','212321',1,1,'2016-05-11 11:57:43','2016-05-11 03:57:43'),(10,'11','11','12312',1,1,'2016-05-11 11:57:56','2016-05-11 03:57:56'),(11,'12341','12','1232141',1,1,'2016-05-11 11:58:04','2016-05-11 03:58:10'),(12,'fqawe','61','161adwa',1,1,'2016-05-11 14:33:20','2016-05-11 06:33:20'),(13,'65daw','14641aw','sdawe',1,1,'2016-05-11 14:33:34','2016-05-11 06:33:34'),(14,'fwer1306va','1adwae','da1dwa3e',1,1,'2016-05-11 14:33:47','2016-05-11 06:33:47'),(15,'fwer','12312','323123w',1,1,'2016-05-11 14:34:04','2016-05-11 06:34:04');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_time` BEFORE INSERT ON `admin` FOR EACH ROW set NEW.`at` = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `title_code` char(100) NOT NULL DEFAULT '' COMMENT '名称码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态1启用0禁用',
  `rules` char(80) NOT NULL DEFAULT '' COMMENT '规则ID,用,分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'管理员',1,'1,2,3,4,5'),(2,'测试',1,'2,3');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_access`
--

DROP TABLE IF EXISTS `auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_access` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '用户ID',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组ID',
  UNIQUE KEY `uid_group_id` (`id`,`group_id`),
  KEY `uid` (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_access`
--

LOCK TABLES `auth_group_access` WRITE;
/*!40000 ALTER TABLE `auth_group_access` DISABLE KEYS */;
INSERT INTO `auth_group_access` VALUES (5,1),(5,2);
/*!40000 ALTER TABLE `auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title_code` char(20) NOT NULL DEFAULT '' COMMENT '名称码',
  `is_link` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单1是0否',
  `status` tinyint(8) NOT NULL DEFAULT '1' COMMENT '状态1启用0禁用',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `icon` char(20) NOT NULL DEFAULT '' COMMENT '图标',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES (1,'Dash','仪表盘',1,1,0,'',0),(2,'Admin','管理员',1,1,0,'',0),(3,'Dash/index','管理员',1,1,1,'',0),(4,'Dash/charts','图表测试',1,1,1,'',0),(5,'Admin/index','管理员列表',1,1,2,'',0);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `session_id` varchar(255) NOT NULL COMMENT 'session ID',
  `session_expire` int(11) NOT NULL COMMENT 'session过期时间',
  `session_data` blob COMMENT 'session数据',
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='session表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('dc0i08u319p7i1pg42eob7qd76',1463033859,'admin|a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:5:\"admin\";s:5:\"email\";s:3:\"123\";s:3:\"pwd\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";s:7:\"role_id\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:2:\"at\";s:19:\"2016-04-24 02:40:47\";s:2:\"ut\";s:19:\"2016-04-27 21:50:13\";}_MENU_LIST_5|a:3:{i:0;a:2:{i:0;a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"Dash\";s:10:\"title_code\";s:9:\"仪表盘\";s:3:\"pid\";s:1:\"0\";s:4:\"icon\";s:0:\"\";}i:1;a:5:{s:2:\"id\";s:1:\"2\";s:4:\"name\";s:5:\"Admin\";s:10:\"title_code\";s:9:\"管理员\";s:3:\"pid\";s:1:\"0\";s:4:\"icon\";s:0:\"\";}}i:1;a:2:{i:0;a:5:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:10:\"Dash/index\";s:10:\"title_code\";s:9:\"管理员\";s:3:\"pid\";s:1:\"1\";s:4:\"icon\";s:0:\"\";}i:1;a:5:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:11:\"Dash/charts\";s:10:\"title_code\";s:12:\"图表测试\";s:3:\"pid\";s:1:\"1\";s:4:\"icon\";s:0:\"\";}}i:2;a:1:{i:0;a:5:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:11:\"Admin/index\";s:10:\"title_code\";s:15:\"管理员列表\";s:3:\"pid\";s:1:\"2\";s:4:\"icon\";s:0:\"\";}}}'),('iuvvj9p1lh07v3ga6ck9lbehk0',1463047319,'admin|a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:5:\"admin\";s:5:\"email\";s:3:\"123\";s:3:\"pwd\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";s:7:\"role_id\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:2:\"at\";s:19:\"2016-04-24 02:40:47\";s:2:\"ut\";s:19:\"2016-04-27 21:50:13\";}_MENU_LIST_5|a:3:{i:0;a:2:{i:0;a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"Dash\";s:10:\"title_code\";s:9:\"仪表盘\";s:3:\"pid\";s:1:\"0\";s:4:\"icon\";s:0:\"\";}i:1;a:5:{s:2:\"id\";s:1:\"2\";s:4:\"name\";s:5:\"Admin\";s:10:\"title_code\";s:9:\"管理员\";s:3:\"pid\";s:1:\"0\";s:4:\"icon\";s:0:\"\";}}i:1;a:2:{i:0;a:5:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:10:\"Dash/index\";s:10:\"title_code\";s:9:\"管理员\";s:3:\"pid\";s:1:\"1\";s:4:\"icon\";s:0:\"\";}i:1;a:5:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:11:\"Dash/charts\";s:10:\"title_code\";s:12:\"图表测试\";s:3:\"pid\";s:1:\"1\";s:4:\"icon\";s:0:\"\";}}i:2;a:1:{i:0;a:5:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:11:\"Admin/index\";s:10:\"title_code\";s:15:\"管理员列表\";s:3:\"pid\";s:1:\"2\";s:4:\"icon\";s:0:\"\";}}}');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-11 18:05:49
