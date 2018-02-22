-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: it_blog
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Current Database: `it_blog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `it_blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `it_blog`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add article',8,'add_article'),(23,'Can change article',8,'change_article'),(24,'Can delete article',8,'delete_article'),(25,'Can add comment',9,'add_comment'),(26,'Can change comment',9,'change_comment'),(27,'Can delete comment',9,'delete_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$k6gj7syn3N9s$FpV9aHg0Ww+wCHRftb6DN29HgRAUb2TXYEzyYEB0sy0=','2018-02-14 05:28:46.705007',1,'Bushiczl','','','',1,1,'2018-02-14 05:28:10.188567');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  `owner` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'123123213','<p><s><sup><span style=\"color:#16a085\"><span style=\"background-color:#e74c3c\">123213213213213</span></span></sup></s></p>',1,'2018-02-18 13:10:29.000000'),(3,'1234324','4545335',1,'2018-02-15 10:26:10.000000'),(4,'123','123',1,'2018-02-15 10:31:06.000000'),(5,'呜呜呜','呜呜呜',1,'2018-02-16 13:00:17.000000'),(6,'成功了哈哈哈啊','<p><strong><em>哇哈哈哈哈啊哈哈 <span style=\"background-color:#e67e22\">大萨<span style=\"color:#2980b9\">达sadas打打</span><span style=\"color:#e67e22\">死大萨达as</span></span></em></strong></p>',1,'2018-02-18 13:10:39.000000'),(7,'123456dewz','<p>aaaaaaaaaaaaaaaaa</p>',4,'2018-02-18 09:46:40.000000');
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(30) NOT NULL,
  `article` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES (1,'admin1',6,'lalala','2018-02-19 18:18:14.000000'),(2,'admin1',6,'lalala','2018-02-19 18:18:14.000000'),(3,'admin1',6,'lalala','2018-02-19 18:18:14.000000'),(4,'admin1',6,'lalala','2018-02-19 18:18:14.000000'),(5,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(6,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(7,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(8,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(9,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(10,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(11,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(12,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(13,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(14,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(15,'admin1',6,'lalala','2018-02-19 18:18:15.000000'),(16,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(17,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(18,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(19,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(20,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(21,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(22,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(23,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(24,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(25,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(26,'admin1',6,'lalala','2018-02-19 18:18:16.000000'),(27,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(28,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(29,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(30,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(31,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(32,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(33,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(34,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(35,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(36,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(37,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(38,'admin1',6,'lalala','2018-02-19 18:18:17.000000'),(39,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(40,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(41,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(42,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(43,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(44,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(45,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(46,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(47,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(48,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(49,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(50,'admin1',6,'lalala','2018-02-19 18:18:18.000000'),(51,'admin1',6,'lalala','2018-02-19 18:18:19.000000'),(52,'admin1',6,'lalala','2018-02-19 18:18:19.000000'),(53,'admin1',6,'lalala','2018-02-19 18:18:19.000000'),(54,'admin1',6,'lalala','2018-02-19 18:18:19.000000'),(55,'admin1',6,'lalala','2018-02-19 18:18:19.000000'),(56,'admin1',6,'lalala','2018-02-19 18:18:19.000000'),(57,'admin1',6,'wocao?','2018-02-19 18:18:33.000000'),(58,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(59,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(60,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(61,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(62,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(63,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(64,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(65,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(66,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(67,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(68,'admin1',6,'wocao?','2018-02-19 18:18:34.000000'),(69,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(70,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(71,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(72,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(73,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(74,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(75,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(76,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(77,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(78,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(79,'admin1',6,'wocao?','2018-02-19 18:18:35.000000'),(80,'admin1',6,'wocao?','2018-02-19 18:18:36.000000'),(81,'admin1',6,'wocao?','2018-02-19 18:18:36.000000'),(82,'admin1',6,'wocao?','2018-02-19 18:18:36.000000'),(83,'admin1',6,'wocao?','2018-02-19 18:18:36.000000'),(84,'admin1',6,'wocao?','2018-02-19 18:18:36.000000'),(85,'admin1',6,'wocao?','2018-02-19 18:18:36.000000'),(86,'admin1',6,'正常了？','2018-02-19 18:24:53.000000'),(87,'admin1',6,'正常了！','2018-02-19 18:25:04.000000'),(88,'123123',6,'test【','2018-02-19 18:28:42.000000'),(89,'md5test',6,'md5也说好','2018-02-21 09:57:46.000000'),(90,'lalala',6,'验证码也成功了','2018-02-22 11:40:50.000000');
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'blog','article'),(9,'blog','comment'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-09 04:01:04.118544'),(2,'auth','0001_initial','2018-02-09 04:01:14.890867'),(3,'admin','0001_initial','2018-02-09 04:01:17.137271'),(4,'admin','0002_logentry_remove_auto_add','2018-02-09 04:01:17.188542'),(5,'contenttypes','0002_remove_content_type_name','2018-02-09 04:01:18.906903'),(6,'auth','0002_alter_permission_name_max_length','2018-02-09 04:01:19.760755'),(7,'auth','0003_alter_user_email_max_length','2018-02-09 04:01:20.806588'),(8,'auth','0004_alter_user_username_opts','2018-02-09 04:01:20.873793'),(9,'auth','0005_alter_user_last_login_null','2018-02-09 04:01:21.724019'),(10,'auth','0006_require_contenttypes_0002','2018-02-09 04:01:21.789405'),(11,'auth','0007_alter_validators_add_error_messages','2018-02-09 04:01:21.861044'),(12,'auth','0008_alter_user_username_max_length','2018-02-09 04:01:23.821301'),(13,'sessions','0001_initial','2018-02-09 04:01:24.817341'),(14,'user','0001_initial','2018-02-09 04:01:25.283583'),(15,'user','0002_auto_20180209_1402','2018-02-09 06:02:15.013373'),(16,'user','0003_auto_20180210_1036','2018-02-10 02:36:08.195731'),(17,'blog','0001_initial','2018-02-12 02:56:50.418771'),(18,'blog','0002_auto_20180214_1321','2018-02-14 05:21:41.743736'),(19,'blog','0003_auto_20180214_1530','2018-02-14 07:30:17.642270'),(20,'blog','0004_auto_20180215_1001','2018-02-15 02:01:25.034444'),(21,'blog','0005_auto_20180215_1435','2018-02-15 06:35:11.016889'),(22,'blog','0006_comment','2018-02-19 09:09:45.632369');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jcmdql3dbeo8lljtfby2ccz7pdfsi4f8','YzMxNjY4MWQ1NzQ5OWM5MGRiYmUwOWJhNTNjZTY5OTIxN2M3MzY5NTp7InVzZXJuYW1lIjoiYWRtaW4xIn0=','2018-02-25 07:59:28.401786'),('xhvtcfhhwm5p4p5fw9ezu4wop0azltnr','ZDk3NTBjMDg0ODM1MjNjYmY1M2IwNGViZWIwYmE4OGMyNjM0OWQ0Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MDM4NWIwODMxYzc3NGJiOTNkMTQ5MmVjMGQyZTllYjAwZDgzYTE0IiwiaWRlbnRpZnkiOiJ5QzJLIn0=','2018-03-08 03:48:58.685870');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (1,'admin1','admin1'),(2,'test11','123456'),(3,'123123','123123'),(4,'123456','123456'),(5,'12345678','123456'),(6,'123123123','123123123'),(7,'md5test','e10adc3949ba59abbe56e057f20f883e'),(8,'lalala','e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-22 11:58:16
