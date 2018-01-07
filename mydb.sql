-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_user'),(2,'Can change user',1,'change_user'),(3,'Can delete user',1,'delete_user'),(4,'Can add country',2,'add_country'),(5,'Can change country',2,'change_country'),(6,'Can delete country',2,'delete_country'),(7,'Can add city',3,'add_city'),(8,'Can change city',3,'change_city'),(9,'Can delete city',3,'delete_city'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add comment',5,'add_comment'),(14,'Can change comment',5,'change_comment'),(15,'Can delete comment',5,'delete_comment'),(16,'Can add group member',6,'add_groupmember'),(17,'Can change group member',6,'change_groupmember'),(18,'Can delete group member',6,'delete_groupmember'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add permission',8,'add_permission'),(23,'Can change permission',8,'change_permission'),(24,'Can delete permission',8,'delete_permission'),(25,'Can add group',9,'add_group'),(26,'Can change group',9,'change_group'),(27,'Can delete group',9,'delete_group'),(28,'Can add user',10,'add_user'),(29,'Can change user',10,'change_user'),(30,'Can delete user',10,'delete_user'),(31,'Can add content type',11,'add_contenttype'),(32,'Can change content type',11,'change_contenttype'),(33,'Can delete content type',11,'delete_contenttype'),(34,'Can add session',12,'add_session'),(35,'Can change session',12,'change_session'),(36,'Can delete session',12,'delete_session');
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
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `books_city`
--

DROP TABLE IF EXISTS `books_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_name` varchar(30) NOT NULL,
  `ct_country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_city_eb9f50a2` (`ct_country_id`),
  CONSTRAINT `books_city_ct_country_id_378d0874_fk_books_country_id` FOREIGN KEY (`ct_country_id`) REFERENCES `books_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_city`
--

LOCK TABLES `books_city` WRITE;
/*!40000 ALTER TABLE `books_city` DISABLE KEYS */;
INSERT INTO `books_city` VALUES (1,'London',1),(2,'Paris',2),(3,'Rome',3),(4,'Rekjavik',4),(5,'Geneva',5);
/*!40000 ALTER TABLE `books_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_comment`
--

DROP TABLE IF EXISTS `books_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` longtext NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_comment_a00c1b00` (`article_id`),
  KEY `books_comment_e8701ad4` (`user_id`),
  CONSTRAINT `books_comment_article_id_2422dc82_fk_books_group_id` FOREIGN KEY (`article_id`) REFERENCES `books_group` (`id`),
  CONSTRAINT `books_comment_user_id_328fbe3a_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_comment`
--

LOCK TABLES `books_comment` WRITE;
/*!40000 ALTER TABLE `books_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_country`
--

DROP TABLE IF EXISTS `books_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(30) NOT NULL,
  `c_url_photo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_country`
--

LOCK TABLES `books_country` WRITE;
/*!40000 ALTER TABLE `books_country` DISABLE KEYS */;
INSERT INTO `books_country` VALUES (1,'UK','./templates/images/demo/portfolio-1.jpg'),(2,'France','./templates/author-6.jpg'),(3,'Italy','./templates/images/demo/portfolio-1.jpg'),(4,'Iceland','./templates/images/demo/portfolio-1.jpg'),(5,'Swiss','./templates/images/demo/portfolio-1.jpg');
/*!40000 ALTER TABLE `books_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_group`
--

DROP TABLE IF EXISTS `books_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(30) NOT NULL,
  `g_member` varchar(100) NOT NULL,
  `g_content` longtext,
  `g_state` varchar(1) NOT NULL,
  `g_createdtime` datetime(6) NOT NULL,
  `g_city_id` int(11) NOT NULL,
  `g_country_id` int(11) NOT NULL,
  `g_organiser_id` int(11) NOT NULL,
  `g_place_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_group_g_city_id_64ff5ea6_fk_books_city_id` (`g_city_id`),
  KEY `books_group_g_country_id_583069de_fk_books_country_id` (`g_country_id`),
  KEY `books_group_5bad9973` (`g_organiser_id`),
  KEY `books_group_8524d5b7` (`g_place_id`),
  CONSTRAINT `books_group_g_city_id_64ff5ea6_fk_books_city_id` FOREIGN KEY (`g_city_id`) REFERENCES `books_city` (`id`),
  CONSTRAINT `books_group_g_country_id_583069de_fk_books_country_id` FOREIGN KEY (`g_country_id`) REFERENCES `books_country` (`id`),
  CONSTRAINT `books_group_g_organiser_id_582f5a70_fk_books_user_id` FOREIGN KEY (`g_organiser_id`) REFERENCES `books_user` (`id`),
  CONSTRAINT `books_group_g_place_id_50107de9_fk_books_city_id` FOREIGN KEY (`g_place_id`) REFERENCES `books_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_group`
--

LOCK TABLES `books_group` WRITE;
/*!40000 ALTER TABLE `books_group` DISABLE KEYS */;
INSERT INTO `books_group` VALUES (1,'Test1','1','1','u','2007-01-18 00:00:00.000000',1,1,1,1),(2,'Test2','2','1','u','2007-01-18 00:00:00.000000',2,2,2,2);
/*!40000 ALTER TABLE `books_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_groupmember`
--

DROP TABLE IF EXISTS `books_groupmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_groupmember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gm_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_groupmember_gm_group_id_1a19c27_fk_books_group_id` (`gm_group_id`),
  CONSTRAINT `books_groupmember_gm_group_id_1a19c27_fk_books_group_id` FOREIGN KEY (`gm_group_id`) REFERENCES `books_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_groupmember`
--

LOCK TABLES `books_groupmember` WRITE;
/*!40000 ALTER TABLE `books_groupmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_groupmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_groupmember_gm_member`
--

DROP TABLE IF EXISTS `books_groupmember_gm_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_groupmember_gm_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupmember_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupmember_id` (`groupmember_id`,`user_id`),
  KEY `books_groupmember_gm_member_user_id_3a2cb3c0_fk_books_user_id` (`user_id`),
  CONSTRAINT `books_groupmembe_groupmember_id_2bbb054f_fk_books_groupmember_id` FOREIGN KEY (`groupmember_id`) REFERENCES `books_groupmember` (`id`),
  CONSTRAINT `books_groupmember_gm_member_user_id_3a2cb3c0_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_groupmember_gm_member`
--

LOCK TABLES `books_groupmember_gm_member` WRITE;
/*!40000 ALTER TABLE `books_groupmember_gm_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_groupmember_gm_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_user`
--

DROP TABLE IF EXISTS `books_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_user`
--

LOCK TABLES `books_user` WRITE;
/*!40000 ALTER TABLE `books_user` DISABLE KEYS */;
INSERT INTO `books_user` VALUES (1,'home','411081387','DEFAULT VALUE','DEFAULT VALUE','DEFAULT VALUE'),(2,'home','411081387','DEFAULT VALUE','DEFAULT VALUE','DEFAULT VALUE'),(3,'home','411081387','Jiachen1018@outlook.com','Jiachen','Li'),(4,'home','411081387','Jiachen1018@outlook.com','Jiachen','Li'),(5,'home','411081387','Jiachen1018@outlook.com','Jiachen','Li'),(6,'home','411081387','Jiachen1018@outlook.com','Jiachen','Li'),(7,'home','411081387','Jiachen1018@outlook.com','Jiachen','Li'),(8,'home','411081387','Jiachen1018@outlook.com','j','l'),(9,'home','411081387','Jiachen1018@outlook.com','Jiachen','Li'),(10,'home','411081387','Jiachen1018@outlook.com','Jiachen','Li'),(11,'home','411081387','Jiachen1018@outlook.com','Jiachen','Li');
/*!40000 ALTER TABLE `books_user` ENABLE KEYS */;
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
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(3,'books','city'),(5,'books','comment'),(2,'books','country'),(4,'books','group'),(6,'books','groupmember'),(1,'books','user'),(11,'contenttypes','contenttype'),(12,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-01-05 21:35:59.663000'),(2,'auth','0001_initial','2018-01-05 21:36:01.804000'),(3,'admin','0001_initial','2018-01-05 21:36:02.234000'),(4,'contenttypes','0002_remove_content_type_name','2018-01-05 21:36:02.599000'),(5,'auth','0002_alter_permission_name_max_length','2018-01-05 21:36:02.849000'),(6,'auth','0003_alter_user_email_max_length','2018-01-05 21:36:03.180000'),(7,'auth','0004_alter_user_username_opts','2018-01-05 21:36:03.196000'),(8,'auth','0005_alter_user_last_login_null','2018-01-05 21:36:03.399000'),(9,'auth','0006_require_contenttypes_0002','2018-01-05 21:36:03.415000'),(10,'books','0001_initial','2018-01-05 21:36:07.658000'),(11,'sessions','0001_initial','2018-01-05 21:36:07.814000'),(12,'books','0002_auto_20180105_2138','2018-01-05 21:38:52.628000'),(13,'admin','0002_logentry_remove_auto_add','2018-01-07 17:56:16.171000'),(14,'auth','0007_alter_validators_add_error_messages','2018-01-07 17:56:16.203000'),(15,'auth','0008_alter_user_username_max_length','2018-01-07 17:56:16.556000');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0k5o3nx66lk8ikyznxzswir17can4cnx','MDg0N2IyYTUyNzMwZjIyMDkwYWMwNGU3MGViZmRkMjZmMThjOGZlYjp7fQ==','2018-01-19 21:36:18.635000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-07 18:07:59
