-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: powera7z_scl_dm2
-- ------------------------------------------------------
-- Server version 	5.7.21-20-beget-5.7.21-20-1-log
-- Date: Mon, 05 Nov 2018 15:04:17 +0300

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
-- Table structure for table `basket`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket` (
  `user_id` int(11) NOT NULL,
  `products` text,
  KEY `user_id` (`user_id`),
  CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `currency`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `currency` VALUES (1,'rub'),(2,'euro'),(3,'usd');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `dop_properties_fields`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dop_properties_fields` (
  `id` int(11) NOT NULL,
  `hint` text,
  `necessarily` tinyint(1) DEFAULT NULL,
  `indexed` tinyint(1) DEFAULT NULL,
  `filtered` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `dop_properties_fields_ibfk_1` FOREIGN KEY (`id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dop_properties_fields`
--

LOCK TABLES `dop_properties_fields` WRITE;
/*!40000 ALTER TABLE `dop_properties_fields` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `dop_properties_fields` VALUES (1,'',0,0,0),(76,'',0,0,0),(78,'',0,0,0),(79,'',0,0,0),(80,'',0,0,0),(81,'',0,0,0),(82,'',0,0,0),(83,'',0,0,0),(84,'',0,0,0),(85,'is active?',0,0,1),(86,'',0,0,0),(88,'',0,0,0),(89,'',0,0,0),(90,'',0,0,0),(91,'',0,1,1),(92,'',0,0,1),(93,'',0,0,1),(94,'',0,0,1),(95,'',0,0,1),(96,'',1,0,0),(97,'',1,0,0),(98,'',1,0,0),(99,'',1,0,0),(102,'',1,0,0),(109,'',0,0,0),(1676,'',0,0,1),(1735,'background color',0,0,0);
/*!40000 ALTER TABLE `dop_properties_fields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `dop_properties_page`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dop_properties_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `h1` text,
  `title` text,
  `description` text,
  PRIMARY KEY (`id`),
  CONSTRAINT `dop_properties_page_ibfk_1` FOREIGN KEY (`id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dop_properties_page`
--

LOCK TABLES `dop_properties_page` WRITE;
/*!40000 ALTER TABLE `dop_properties_page` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `dop_properties_page` VALUES (1,'','',''),(2,'','',''),(3,'','',''),(4,'','',''),(5,'','',''),(6,'About','About demo site',''),(7,'','',''),(8,'Cacti','',''),(9,'Bonsai','',''),(10,'','',''),(11,'Aporocactus','',''),(12,'Cereus','',''),(13,'Ehinopsis ','',''),(14,'Bunzingi','',''),(15,NULL,NULL,NULL),(16,NULL,NULL,NULL),(17,'Lofofora','',''),(18,'Parodia','',''),(19,'Trichocereus ','',''),(20,'Sekizhezhu','',''),(21,'Han-kangap','',''),(22,'Hieroglyphs','',''),(23,'Kabudati','',''),(24,'Sharimiki','',''),(25,'Syakan','',''),(26,'Dubnik','',''),(27,'anthurium','',''),(28,'Dracaena','',''),(29,'Monstera','',''),(30,'Palm','',''),(31,'Philodendron','',''),(32,'Succulentus','',''),(33,NULL,NULL,NULL),(34,'','',''),(35,'','',''),(36,'Password recovery','',''),(37,'','',''),(38,'','',''),(43,'Search','',''),(44,NULL,NULL,NULL),(45,'','','');
/*!40000 ALTER TABLE `dop_properties_page` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_id_field_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_id_field_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `field_id_field_type_ibfk_1` FOREIGN KEY (`id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_id_field_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type_fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1736 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_id_field_type`
--

LOCK TABLES `field_id_field_type` WRITE;
/*!40000 ALTER TABLE `field_id_field_type` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_id_field_type` VALUES (1,1),(76,1),(79,1),(80,1),(82,1),(83,1),(88,1),(96,1),(97,1),(98,1),(99,1),(102,1),(1735,1),(109,2),(85,3),(92,3),(1676,3),(78,4),(91,4),(94,4),(95,4),(81,7),(86,7),(84,8),(89,8),(90,8),(93,13);
/*!40000 ALTER TABLE `field_id_field_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_id_name`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_id_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `text_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text_id` (`text_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1736 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_id_name`
--

LOCK TABLES `field_id_name` WRITE;
/*!40000 ALTER TABLE `field_id_name` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_id_name` VALUES (1,'Email','email_user'),(76,'Addresses','addresses_mail_template'),(78,'Recipient address','mail_template_address'),(79,'Name from','mail_template_name_from'),(80,'Address from','mail_template_address_from'),(81,'Body letter template','mail_template_mail_templ'),(82,'Site title','site_title__global'),(83,'Title','title__slide'),(84,'Image','image__slide'),(85,'Active','active__slide'),(86,'Content','content_share'),(88,'Main menu icon','main_menu_icon__share'),(89,'Section image','section_image__catalog'),(90,'Product Image','product_image'),(91,'Manufacturer','manufacturer__cactus'),(92,'Show in catalog menu','show_catalog_menu__catalog'),(93,'Price','price__catalog'),(94,'Manufacturer','manufacturer__bonsai'),(95,'Manufacturer','manufacturer__succulents'),(96,'Name','name_customer'),(97,'Phone','phone_customer'),(98,'Name','name_send_message_properties'),(99,'Email','email_send_message_properties'),(102,'Message','message_send_message_properties'),(109,'Search limit','search_limit__global'),(1674,'Sdsde','dsadqd2'),(1676,'Show in main menu','show_main_menu'),(1698,'test','test_field2'),(1735,'Background','background');
/*!40000 ALTER TABLE `field_id_name` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_id_reference_id`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_id_reference_id` (
  `field_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_id_reference_id_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_id_reference_id`
--

LOCK TABLES `field_id_reference_id` WRITE;
/*!40000 ALTER TABLE `field_id_reference_id` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_id_reference_id` VALUES (78,54),(91,64),(94,67),(95,68),(78,54);
/*!40000 ALTER TABLE `field_id_reference_id` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_value_multi_select`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_value_multi_select` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_value_multi_select_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_value_multi_select_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_value_multi_select`
--

LOCK TABLES `field_value_multi_select` WRITE;
/*!40000 ALTER TABLE `field_value_multi_select` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `field_value_multi_select` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_date`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_date` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` date DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_date_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`),
  CONSTRAINT `field_values_type_date_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_date`
--

LOCK TABLES `field_values_type_date` WRITE;
/*!40000 ALTER TABLE `field_values_type_date` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `field_values_type_date` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_double`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_double` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_double_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_double`
--

LOCK TABLES `field_values_type_double` WRITE;
/*!40000 ALTER TABLE `field_values_type_double` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `field_values_type_double` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_file`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_file` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` text,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_file_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_file_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_file`
--

LOCK TABLES `field_values_type_file` WRITE;
/*!40000 ALTER TABLE `field_values_type_file` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_values_type_file` VALUES (4,84,'/files/images/main_slides/cacti_slide.png',1),(5,84,'/files/images/main_slides/suculent_slide.png',1),(8,89,'/files/images/catalog/cacti/rebuzia.jpg',1),(9,89,'/files/images/catalog/bonsai/sekizhezhu.jpg',1),(10,89,'/files/images/catalog/suculents/aloe.jpg',1),(11,89,'',1),(11,90,'/files/images/catalog/cacti/aporocactus/aporocactus.jpg',1),(12,89,'',1),(12,90,'/files/images/catalog/cacti/cereus/cereus.png',1),(13,89,'',1),(13,90,'/files/images/catalog/cacti/ehinopsis/ehinopsis.jpg',1),(14,89,'',1),(14,90,'/files/images/catalog/bonsai/bunzingi/bunzingi.jpg',1),(17,89,'',1),(17,90,'/files/images/catalog/cacti/lofofora/lofofora.jpg',1),(18,89,'',1),(18,90,'/files/images/catalog/cacti/parodia/parodia.jpg',1),(19,89,'',1),(19,90,'/files/images/catalog/cacti/trichocereus_/trichocereus fulvilanus.png',1),(8,90,'',1),(9,90,'',1),(20,89,'',1),(20,90,'/files/images/catalog/bonsai/sekizhezhu/ese-ue.jpg',1),(21,89,'',1),(21,90,'/files/images/catalog/bonsai/han-kangap/han-kangap.jpg',1),(22,89,'',1),(22,90,'/files/images/catalog/bonsai/hieroglyphs/hieroglyphs.jpg',1),(23,89,'',1),(23,90,'/files/images/catalog/bonsai/kabudati/kabudati.jpg',1),(24,89,'',1),(24,90,'/files/images/catalog/bonsai/sharimiki/sharimiki.jpg',1),(25,89,'',1),(25,90,'/files/images/catalog/bonsai/syakan/syakan.jpg',1),(10,90,'',1),(26,89,'',1),(26,90,'/files/images/catalog/suculents/dubnik/dubnik.jpg',1),(27,89,'',1),(27,90,'/files/images/catalog/suculents/anthurium/anthurium.jpg',1),(28,89,'',1),(28,90,'/files/images/catalog/suculents/dracaena/dracaena.jpg',1),(29,89,'',1),(29,90,'/files/images/catalog/suculents/monstera/monstera.jpg',1),(30,89,'',1),(30,90,'/files/images/catalog/suculents/palm/palm.jpg',1),(31,89,'',1),(31,90,'/files/images/catalog/suculents/philodendron/philodendron.png',1),(32,89,'',1),(32,90,'/files/images/catalog/suculents/succulentus.jpg',1);
/*!40000 ALTER TABLE `field_values_type_file` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_html_text`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_html_text` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` text,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_html_text_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_html_text_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_html_text`
--

LOCK TABLES `field_values_type_html_text` WRITE;
/*!40000 ALTER TABLE `field_values_type_html_text` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_values_type_html_text` VALUES (6,86,'<p>This is the test online shop to show <a href=\"scale-all.com\">ScaleCMS</a> opportunity</p>',1),(7,86,'',1),(8,86,'',1),(9,86,'',1),(10,86,'',1),(11,86,'',1),(12,86,'',1),(13,86,'',1),(14,86,'',1),(17,86,'',1),(18,86,'',1),(19,86,'',1),(20,86,'',1),(21,86,'',1),(22,86,'',1),(23,86,'',1),(24,86,'',1),(25,86,'',1),(26,86,'',1),(27,86,'',1),(28,86,'',1),(29,86,'',1),(30,86,'',1),(31,86,'',1),(32,86,'',1),(1,86,'',1),(34,86,'',1),(35,86,'',1),(36,86,'',1),(37,86,'',1),(38,86,'',1),(39,81,'<p>Message from site</p>\n<p>Name: &lt;%name_send_message_properties%&gt;</p>\n<p>Email: &lt;%email_send_message_properties%&gt;</p>\n<p>Message:&nbsp;&lt;%message_send_message_properties%&gt;</p>',6),(43,86,'',1);
/*!40000 ALTER TABLE `field_values_type_html_text` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_link_page`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_link_page` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_link_page_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_link_page_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_link_page`
--

LOCK TABLES `field_values_type_link_page` WRITE;
/*!40000 ALTER TABLE `field_values_type_link_page` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `field_values_type_link_page` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_number`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_number` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` int(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_number_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_number_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_number`
--

LOCK TABLES `field_values_type_number` WRITE;
/*!40000 ALTER TABLE `field_values_type_number` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_values_type_number` VALUES (4,85,1,1),(5,85,1,1),(8,92,1,1),(9,92,1,1),(10,92,1,1),(11,92,0,1),(12,92,0,1),(13,92,0,1),(17,92,0,1),(18,92,0,1),(19,92,0,1),(14,92,0,1),(20,92,0,1),(21,92,0,1),(22,92,0,1),(23,92,0,1),(24,92,0,1),(25,92,0,1),(26,92,0,1),(27,92,0,1),(28,92,0,1),(29,92,0,1),(30,92,0,1),(31,92,0,1),(32,92,0,1),(2,109,10,1),(6,1676,1,1),(7,1676,1,1),(8,1676,0,1),(10,1676,0,1),(9,1676,0,1),(43,1676,0,1),(11,1676,0,1),(12,1676,0,1),(13,1676,0,1),(17,1676,0,1),(18,1676,0,1),(19,1676,0,1),(14,1676,0,1),(20,1676,0,1),(21,1676,0,1),(22,1676,0,1),(23,1676,0,1),(24,1676,0,1),(25,1676,0,1),(26,1676,0,1),(27,1676,0,1),(29,1676,0,1),(28,1676,0,1),(30,1676,0,1),(31,1676,0,1),(32,1676,0,1);
/*!40000 ALTER TABLE `field_values_type_number` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_password`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_password` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` text,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_password_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_password_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_password`
--

LOCK TABLES `field_values_type_password` WRITE;
/*!40000 ALTER TABLE `field_values_type_password` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `field_values_type_password` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_price`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_price` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  UNIQUE KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_price_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_price_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_price`
--

LOCK TABLES `field_values_type_price` WRITE;
/*!40000 ALTER TABLE `field_values_type_price` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_values_type_price` VALUES (11,93,9,1),(12,93,15,1),(13,93,50,1),(17,93,40,1),(18,93,70,1),(19,93,100,1),(22,93,250,1),(23,93,144,1),(24,93,302,1),(25,93,90,1),(14,93,504,1),(20,93,1168,1),(21,93,402,1),(26,93,120,1),(27,93,15,1),(28,93,58,1),(29,93,45,1),(30,93,72,1),(31,93,17,1),(32,93,63,1);
/*!40000 ALTER TABLE `field_values_type_price` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_select`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_select` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_select_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_select_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_select`
--

LOCK TABLES `field_values_type_select` WRITE;
/*!40000 ALTER TABLE `field_values_type_select` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_values_type_select` VALUES (11,91,1,1),(12,91,2,1),(13,91,3,1),(17,91,1,1),(18,91,3,1),(19,91,2,1),(14,94,4,1),(20,94,5,1),(21,94,4,1),(22,94,4,1),(23,94,4,1),(24,94,4,1),(25,94,5,1),(26,95,6,1),(27,95,7,1),(28,95,7,1),(29,95,6,1),(30,95,7,1),(31,95,6,1),(32,95,7,1),(39,78,9,6);
/*!40000 ALTER TABLE `field_values_type_select` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_sostav`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_sostav` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `reference_data_id` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_sostav_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_sostav_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_sostav`
--

LOCK TABLES `field_values_type_sostav` WRITE;
/*!40000 ALTER TABLE `field_values_type_sostav` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `field_values_type_sostav` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_string`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_string` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_string_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_string_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_string`
--

LOCK TABLES `field_values_type_string` WRITE;
/*!40000 ALTER TABLE `field_values_type_string` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `field_values_type_string` VALUES (2,82,'Exotic plant shop',1),(4,83,'',1),(5,83,'',1),(6,88,'info',1),(7,88,'shopping_basket',1),(9,88,'',1),(10,88,'',1),(11,88,'',1),(12,88,'',1),(13,88,'',1),(14,88,'',1),(17,88,'',1),(18,88,'',1),(19,88,'',1),(20,88,'',1),(21,88,'',1),(22,88,'',1),(23,88,'',1),(24,88,'',1),(25,88,'',1),(26,88,'',1),(27,88,'',1),(28,88,'',1),(29,88,'',1),(30,88,'',1),(31,88,'',1),(32,88,'',1),(1,88,'',1),(34,88,'',1),(35,88,'',1),(1,1,'test@mail.com',3),(36,88,'',1),(37,88,'',1),(38,88,'',1),(14,96,'test',4),(14,97,'123',4),(15,96,'test',4),(15,97,'123',4),(16,96,'test',4),(16,97,'123',4),(17,96,'test',4),(17,97,'123',4),(18,96,'test',4),(18,97,'123',4),(19,96,'test',4),(19,97,'123',4),(20,96,'test',4),(20,97,'123',4),(21,96,'test',4),(21,97,'123',4),(22,96,'test',4),(22,97,'123',4),(23,96,'test',4),(23,97,'123',4),(24,96,'Uvan',4),(24,97,'123445',4),(25,96,'Ivan',4),(25,97,'1356',4),(26,96,'Fgddd',4),(26,97,'2212',4),(27,96,'Fedor',4),(27,97,'24422',4),(28,96,'test',4),(28,97,'123',4),(9,76,'test@mail.ru',2),(39,79,'Send message',6),(39,80,'test@gmail.com',6),(43,88,'',1),(8,88,'',1),(29,96,'Test',4),(29,97,'2123',4),(30,96,'saasd',4),(30,97,'dsda',4),(31,96,'Name',4),(31,97,'Phone',4),(4,1735,'#fdd2ca',1),(5,1735,'#242e27',1),(32,96,'Fedor',4),(32,97,'123455',4);
/*!40000 ALTER TABLE `field_values_type_string` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_text`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_text` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` text,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_text_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_text_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_text`
--

LOCK TABLES `field_values_type_text` WRITE;
/*!40000 ALTER TABLE `field_values_type_text` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `field_values_type_text` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `field_values_type_time`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values_type_time` (
  `page_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` time DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `field_values_type_time_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_values_type_time_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values_type_time`
--

LOCK TABLES `field_values_type_time` WRITE;
/*!40000 ALTER TABLE `field_values_type_time` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `field_values_type_time` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `filter_fields`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_fields` (
  `page_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` int(11) DEFAULT NULL,
  `field_value_string` varchar(255) DEFAULT NULL,
  KEY `page_id` (`page_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `filter_fields_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `filter_fields_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_fields`
--

LOCK TABLES `filter_fields` WRITE;
/*!40000 ALTER TABLE `filter_fields` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `filter_fields` VALUES (7,0,1676,'show_main_menu',1,NULL),(8,0,1676,'show_main_menu',0,NULL),(8,0,92,'show_catalog_menu__catalog',1,NULL),(10,0,1676,'show_main_menu',0,NULL),(10,0,92,'show_catalog_menu__catalog',1,NULL),(9,0,1676,'show_main_menu',0,NULL),(9,0,92,'show_catalog_menu__catalog',1,NULL),(43,0,1676,'show_main_menu',0,NULL),(45,0,1676,'show_main_menu',0,NULL),(45,0,92,'show_catalog_menu__catalog',0,NULL),(6,0,1676,'show_main_menu',1,NULL),(14,69,1676,'show_main_menu',0,NULL),(20,69,1676,'show_main_menu',0,NULL),(21,69,1676,'show_main_menu',0,NULL),(22,69,1676,'show_main_menu',0,NULL),(23,69,1676,'show_main_menu',0,NULL),(24,69,1676,'show_main_menu',0,NULL),(25,69,1676,'show_main_menu',0,NULL),(14,69,92,'show_catalog_menu__catalog',0,NULL),(20,69,92,'show_catalog_menu__catalog',0,NULL),(21,69,92,'show_catalog_menu__catalog',0,NULL),(22,69,92,'show_catalog_menu__catalog',0,NULL),(23,69,92,'show_catalog_menu__catalog',0,NULL),(24,69,92,'show_catalog_menu__catalog',0,NULL),(25,69,92,'show_catalog_menu__catalog',0,NULL),(22,69,93,'price__catalog',250,NULL),(23,69,93,'price__catalog',144,NULL),(24,69,93,'price__catalog',302,NULL),(25,69,93,'price__catalog',90,NULL),(14,69,93,'price__catalog',504,NULL),(20,69,93,'price__catalog',1168,NULL),(21,69,93,'price__catalog',402,NULL),(14,69,94,'manufacturer__bonsai',4,NULL),(20,69,94,'manufacturer__bonsai',5,NULL),(21,69,94,'manufacturer__bonsai',4,NULL),(22,69,94,'manufacturer__bonsai',4,NULL),(23,69,94,'manufacturer__bonsai',4,NULL),(24,69,94,'manufacturer__bonsai',4,NULL),(25,69,94,'manufacturer__bonsai',5,NULL),(26,70,1676,'show_main_menu',0,NULL),(27,70,1676,'show_main_menu',0,NULL),(29,70,1676,'show_main_menu',0,NULL),(28,70,1676,'show_main_menu',0,NULL),(30,70,1676,'show_main_menu',0,NULL),(31,70,1676,'show_main_menu',0,NULL),(32,70,1676,'show_main_menu',0,NULL),(26,70,92,'show_catalog_menu__catalog',0,NULL),(27,70,92,'show_catalog_menu__catalog',0,NULL),(28,70,92,'show_catalog_menu__catalog',0,NULL),(29,70,92,'show_catalog_menu__catalog',0,NULL),(30,70,92,'show_catalog_menu__catalog',0,NULL),(31,70,92,'show_catalog_menu__catalog',0,NULL),(32,70,92,'show_catalog_menu__catalog',0,NULL),(26,70,93,'price__catalog',120,NULL),(27,70,93,'price__catalog',15,NULL),(28,70,93,'price__catalog',58,NULL),(29,70,93,'price__catalog',45,NULL),(30,70,93,'price__catalog',72,NULL),(31,70,93,'price__catalog',17,NULL),(32,70,93,'price__catalog',63,NULL),(26,70,95,'manufacturer__succulents',6,NULL),(27,70,95,'manufacturer__succulents',7,NULL),(28,70,95,'manufacturer__succulents',7,NULL),(29,70,95,'manufacturer__succulents',6,NULL),(30,70,95,'manufacturer__succulents',7,NULL),(31,70,95,'manufacturer__succulents',6,NULL),(32,70,95,'manufacturer__succulents',7,NULL),(11,0,1676,'show_main_menu',0,NULL),(11,0,92,'show_catalog_menu__catalog',0,NULL),(11,0,93,'price__catalog',9,NULL),(11,0,91,'manufacturer__cactus',1,NULL),(12,0,1676,'show_main_menu',0,NULL),(12,0,92,'show_catalog_menu__catalog',0,NULL),(12,0,93,'price__catalog',15,NULL),(12,0,91,'manufacturer__cactus',2,NULL),(17,0,1676,'show_main_menu',0,NULL),(17,0,92,'show_catalog_menu__catalog',0,NULL),(17,0,93,'price__catalog',40,NULL),(17,0,91,'manufacturer__cactus',1,NULL),(18,0,1676,'show_main_menu',0,NULL),(18,0,92,'show_catalog_menu__catalog',0,NULL),(18,0,93,'price__catalog',70,NULL),(18,0,91,'manufacturer__cactus',3,NULL),(13,0,1676,'show_main_menu',0,NULL),(13,0,92,'show_catalog_menu__catalog',0,NULL),(13,0,93,'price__catalog',50,NULL),(13,0,91,'manufacturer__cactus',3,NULL),(19,0,1676,'show_main_menu',0,NULL),(19,0,92,'show_catalog_menu__catalog',0,NULL),(19,0,93,'price__catalog',100,NULL),(19,0,91,'manufacturer__cactus',2,NULL),(5,0,85,'active__slide',1,NULL),(4,0,85,'active__slide',1,NULL);
/*!40000 ALTER TABLE `filter_fields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `group_id_field_id`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_id_field_id` (
  `group_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `sort_num` int(11) DEFAULT NULL,
  KEY `group_id` (`group_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `group_id_field_id_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group_id_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_id_field_id_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `field_id_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_id_field_id`
--

LOCK TABLES `group_id_field_id` WRITE;
/*!40000 ALTER TABLE `group_id_field_id` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `group_id_field_id` VALUES (1,1,0),(84,78,0),(84,79,0),(84,80,0),(84,81,0),(85,76,0),(86,82,0),(87,83,1),(87,84,2),(87,85,0),(1,1,0),(84,78,0),(84,79,0),(84,80,0),(84,81,0),(85,76,0),(94,96,0),(94,97,1),(95,98,0),(95,99,1),(95,98,0),(95,99,1),(95,102,2),(86,82,0),(86,82,0),(86,82,0),(96,109,1),(88,1676,1),(88,86,0),(88,88,2),(89,92,3),(89,89,4),(89,90,5),(89,93,6),(93,95,7),(91,91,7),(92,94,7),(87,1735,3);
/*!40000 ALTER TABLE `group_id_field_id` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `group_id_name`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_id_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `text_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text_id` (`text_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_id_name`
--

LOCK TABLES `group_id_name` WRITE;
/*!40000 ALTER TABLE `group_id_name` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `group_id_name` VALUES (1,'User fields','field_of_user'),(78,'User fields','fields_of_user'),(80,'Address','address'),(84,'Mail template','mail_template'),(85,'Addresses group','addresses_mail_template_group'),(86,'Menu','menu_group'),(87,'Slide group','slide'),(88,'Share','share'),(89,'Catalog','catalog'),(91,'Cactus properties','cactus_properties'),(92,'Bonsai properties','bonsai_properties'),(93,'Succulents properties','succulents_properties'),(94,'Order info','order_info'),(95,'Send message group','send_message_properties'),(96,'Search','search__global');
/*!40000 ALTER TABLE `group_id_name` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `langs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_id` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text_id` (`text_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langs`
--

LOCK TABLES `langs` WRITE;
/*!40000 ALTER TABLE `langs` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `langs` VALUES (1,'ru',0,'Русский'),(2,'en',1,'English');
/*!40000 ALTER TABLE `langs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `main_page`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_page` (
  `id` int(11) DEFAULT NULL,
  `sub_domain` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `sub_domain` (`sub_domain`),
  CONSTRAINT `main_page_ibfk_1` FOREIGN KEY (`id`) REFERENCES `page_id_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_page`
--

LOCK TABLES `main_page` WRITE;
/*!40000 ALTER TABLE `main_page` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `main_page` VALUES (1,1);
/*!40000 ALTER TABLE `main_page` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `main_rights`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_rights` (
  `user_id` int(11) DEFAULT NULL,
  `section_text_id` varchar(255) DEFAULT NULL,
  `read_right` tinyint(1) DEFAULT NULL,
  `create_right` tinyint(1) DEFAULT NULL,
  `edit_right` tinyint(1) DEFAULT NULL,
  `delete_right` tinyint(1) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `main_rights_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_rights`
--

LOCK TABLES `main_rights` WRITE;
/*!40000 ALTER TABLE `main_rights` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `main_rights` VALUES (1,'events',1,1,1,1),(1,'structure',1,1,1,1),(1,'templates',1,1,1,1),(1,'references',1,1,1,1),(1,'orders',1,1,1,1),(1,'feedback',1,1,1,1),(1,'users',1,1,1,1),(1,'plugins',1,1,1,1),(1,'backups',1,1,1,1),(1,'settings',1,1,1,1);
/*!40000 ALTER TABLE `main_rights` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `messages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `message` text,
  `new_event` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `messages` VALUES (1,9,77,'2018-09-14','127.0.0.1','<p>Message from site</p>\n<p>Name: sadas</p>\n<p>Email: sadas</p>\n<p>Сообщение:&nbsp;</p>',1),(2,9,77,'2018-09-14','127.0.0.1','<p>Message from site</p>\n<p>Name: adas</p>\n<p>Email: emeail</p>\n<p>Message:&nbsp;Message</p>',1),(3,9,77,'2018-09-14','127.0.0.1','<p>Message from site</p>\n<p>Name: das</p>\n<p>Email: sad</p>\n<p>Message:&nbsp;fwer</p>',1),(4,9,77,'2018-09-29','93.185.17.181','<p>Message from site</p>\n<p>Name: test</p>\n<p>Email: www@ddw</p>\n<p>Message:&nbsp;WWWWE</p>',1),(5,9,77,'2018-09-29','93.185.17.181','<p>Message from site</p>\n<p>Name: ddsd</p>\n<p>Email: dsds</p>\n<p>Message:&nbsp;dswww2</p>',1),(6,9,77,'2018-09-30','93.185.29.120','<p>Message from site</p>\n<p>Name: www</p>\n<p>Email: 2221</p>\n<p>Message:&nbsp;ssss</p>',1),(7,9,77,'2018-09-30','93.185.29.120','<p>Message from site</p>\n<p>Name: sas</p>\n<p>Email: sas</p>\n<p>Message:&nbsp;sasas</p>',1),(8,9,77,'2018-09-30','93.185.29.120','<p>Message from site</p>\n<p>Name: Test</p>\n<p>Email: test@mail.ru</p>\n<p>Message:&nbsp;dasdasd</p>',1),(9,9,77,'2018-09-30','93.185.29.120','<p>Message from site</p>\n<p>Name: You</p>\n<p>Email: Man</p>\n<p>Message:&nbsp;ssasa</p>',1),(10,9,77,'2018-09-30','93.185.29.120','<p>Message from site</p>\n<p>Name: ssd</p>\n<p>Email: sas</p>\n<p>Message:&nbsp;sadd</p>',1),(11,9,77,'2018-09-30','93.185.29.120','<p>Message from site</p>\n<p>Name: Иван</p>\n<p>Email: test@mail.com</p>\n<p>Message:&nbsp;Привет, хочу кактус</p>',1),(12,9,77,'2018-09-30','93.185.29.120','<p>Message from site</p>\n<p>Name: Todor</p>\n<p>Email: dsad</p>\n<p>Message:&nbsp;dsadas</p>',1),(13,9,77,'2018-09-30','93.185.29.120','<p>Message from site</p>\n<p>Name: wdasd</p>\n<p>Email: dsad</p>\n<p>Message:&nbsp;dasda</p>',1);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `order_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_info` (
  `id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `product_name` text,
  `currency` int(11) DEFAULT NULL,
  KEY `product_id` (`product_id`),
  KEY `currency` (`currency`),
  CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `page_id_name` (`id`),
  CONSTRAINT `order_info_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `order_info` VALUES (14,11,9,1,'Aporocactus',1),(15,12,15,1,'Cereus',1),(15,11,9,1,'Aporocactus',1),(16,11,9,1,'Aporocactus',1),(17,11,9,1,'Aporocactus',1),(18,11,9,1,'Aporocactus',1),(19,11,9,1,'Aporocactus',1),(20,11,9,1,'Aporocactus',1),(21,11,9,1,'Aporocactus',1),(22,11,9,1,'Aporocactus',1),(23,11,9,1,'Aporocactus',1),(24,12,15,2,'Cereus',1),(24,11,9,1,'Aporocactus',1),(27,11,9,2,'Aporocactus',1),(28,11,9,1,'Aporocactus',1),(30,45,1,1,'Test product',1),(31,12,15,2,'Cereus',1),(32,27,15,1,'Anthurium',1),(32,11,9,1,'Aporocactus',1);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `new_event` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `orders` VALUES (14,1,'2018-09-06 10:06:27',0),(15,1,'2018-09-06 10:07:34',0),(16,1,'2018-09-06 10:12:24',1),(17,1,'2018-09-06 10:13:01',1),(18,1,'2018-09-06 10:13:26',1),(19,1,'2018-09-06 10:14:30',1),(20,1,'2018-09-06 10:15:03',1),(21,1,'2018-09-06 10:15:42',1),(22,1,'2018-09-06 10:16:35',1),(23,1,'2018-09-06 10:17:46',1),(24,1,'2018-09-06 10:19:05',0),(25,14,'2018-09-06 10:31:31',0),(26,15,'2018-09-06 10:33:22',1),(27,16,'2018-09-06 10:34:21',0),(28,1,'2018-09-06 10:40:17',1),(29,1,'2018-09-16 19:29:38',0),(30,1,'2018-09-16 19:31:02',0),(31,1,'2018-09-16 19:39:26',0),(32,1,'2018-09-30 12:26:56',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `page_id_active`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_id_active` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `no_indexed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `page_id_active_ibfk_1` FOREIGN KEY (`id`) REFERENCES `page_id_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_id_active`
--

LOCK TABLES `page_id_active` WRITE;
/*!40000 ALTER TABLE `page_id_active` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `page_id_active` VALUES (1,1,0),(2,0,1),(3,0,1),(4,0,0),(5,0,1),(6,1,0),(7,1,0),(8,1,0),(9,1,0),(10,1,0),(11,1,0),(12,1,0),(13,1,0),(14,1,0),(17,1,0),(18,1,0),(19,1,0),(20,1,0),(21,1,0),(22,1,0),(23,1,0),(24,1,0),(25,1,0),(26,1,0),(27,1,0),(28,1,0),(29,1,0),(30,1,0),(31,1,0),(32,1,0),(34,1,1),(35,1,1),(36,1,0),(37,1,1),(38,1,1),(43,1,1);
/*!40000 ALTER TABLE `page_id_active` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `page_id_name`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_id_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `last_mod` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_id_name`
--

LOCK TABLES `page_id_name` WRITE;
/*!40000 ALTER TABLE `page_id_name` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `page_id_name` VALUES (1,'Main','2018-11-05T10:44:58+00:00'),(2,'Global','2018-09-16T15:44:54+00:00'),(3,'Main Slider','2018-06-23T13:40:53+00:00'),(4,'Slide1','2018-09-30T00:18:57+03:00'),(5,'Slide2','2018-09-30T00:09:48+03:00'),(6,'About','2018-09-22T18:51:42+00:00'),(7,'Catalog','2018-09-16T16:49:18+00:00'),(8,'Cacti','2018-09-16T17:17:36+00:00'),(9,'Bonsai','2018-09-16T17:18:35+00:00'),(10,'Succulents','2018-09-16T17:18:18+00:00'),(11,'Aporocactus','2018-09-29T23:33:48+03:00'),(12,'Cereus','2018-09-29T23:41:39+03:00'),(13,'Ehinopsis ','2018-09-29T23:44:48+03:00'),(14,'Bunzingi','2018-09-29T23:28:14+03:00'),(15,'New page','2018-06-30T18:54:51+00:00'),(16,'New page','2018-06-30T18:55:23+00:00'),(17,'Lofofora','2018-09-29T23:42:36+03:00'),(18,'Parodia','2018-09-29T23:42:46+03:00'),(19,'Trichocereus ','2018-09-30T00:00:21+03:00'),(20,'Sekizhezhu','2018-09-29T23:28:22+03:00'),(21,'Han-kangap','2018-09-29T23:28:28+03:00'),(22,'Hieroglyphs','2018-09-29T23:28:34+03:00'),(23,'Kabudati','2018-09-29T23:28:41+03:00'),(24,'Sharimiki','2018-09-29T23:28:47+03:00'),(25,'Syakan','2018-09-29T23:28:53+03:00'),(26,'Dubnik','2018-09-29T23:28:58+03:00'),(27,'Anthurium','2018-09-29T23:29:11+03:00'),(28,'Dracaena','2018-09-29T23:29:28+03:00'),(29,'Monstera','2018-09-29T23:29:21+03:00'),(30,'Palm','2018-09-29T23:29:37+03:00'),(31,'Philodendron','2018-09-29T23:29:44+03:00'),(32,'Succulentus','2018-09-29T23:29:50+03:00'),(33,'New page','2018-06-30T19:24:19+00:00'),(34,'Registration','2018-08-05T10:41:05+00:00'),(35,'Account','2018-08-11T18:18:36+00:00'),(36,'Password recovery','2018-08-19T11:05:29+00:00'),(37,'Basket','2018-08-20T16:58:50+00:00'),(38,'Ordering','2018-08-20T16:59:25+00:00'),(39,'Send message','2018-09-13T18:08:21+00:00'),(40,'Send message','2018-09-13T18:17:27+00:00'),(41,'Send message','2018-09-13T18:19:30+00:00'),(42,'Send message','2018-09-13T18:21:35+00:00'),(43,'Search','2018-09-16T18:59:36+00:00'),(44,'New page','2018-09-16T19:28:15+00:00'),(45,'Test product','2018-09-16T19:30:21+00:00');
/*!40000 ALTER TABLE `page_id_name` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `page_id_to_template_id`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_id_to_template_id` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `template_id` (`template_id`),
  CONSTRAINT `page_id_to_template_id_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`),
  CONSTRAINT `page_id_to_template_id_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `template_id_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_id_to_template_id`
--

LOCK TABLES `page_id_to_template_id` WRITE;
/*!40000 ALTER TABLE `page_id_to_template_id` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `page_id_to_template_id` VALUES (1,1),(3,1),(6,1),(7,1),(2,55),(4,56),(5,56),(8,59),(9,60),(10,61),(11,63),(12,63),(13,63),(17,63),(18,63),(19,63),(14,69),(20,69),(21,69),(22,69),(23,69),(24,69),(25,69),(26,70),(27,70),(28,70),(29,70),(30,70),(31,70),(32,70),(34,72),(35,73),(36,74),(37,75),(38,76),(39,77),(40,77),(41,77),(42,77),(43,78);
/*!40000 ALTER TABLE `page_id_to_template_id` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `page_id_uri`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_id_uri` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `full_path` text,
  PRIMARY KEY (`page_id`),
  CONSTRAINT `page_id_uri_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page_id_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_id_uri`
--

LOCK TABLES `page_id_uri` WRITE;
/*!40000 ALTER TABLE `page_id_uri` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `page_id_uri` VALUES (1,'main','/'),(2,'__global','/__global/'),(3,'slider__main','/slider__main/'),(4,'4','/slider__main/4/'),(5,'5','/slider__main/5/'),(6,'about','/about/'),(7,'catalog','/catalog/'),(8,'cacti','/catalog/cacti/'),(9,'bonsai','/catalog/bonsai/'),(10,'succulents','/catalog/succulents/'),(11,'aporocactus','/catalog/cacti/aporocactus/'),(12,'cereus','/catalog/cacti/cereus/'),(13,'ehinopsis','/catalog/cacti/ehinopsis/'),(14,'bunzingi','/catalog/bonsai/bunzingi/'),(17,'lofofora','/catalog/cacti/lofofora/'),(18,'parodia','/catalog/cacti/parodia/'),(19,'trichocereus','/catalog/cacti/trichocereus/'),(20,'sekizhezhu','/catalog/bonsai/sekizhezhu/'),(21,'han-kangap','/catalog/bonsai/han-kangap/'),(22,'hieroglyphs','/catalog/bonsai/hieroglyphs/'),(23,'kabudati','/catalog/bonsai/kabudati/'),(24,'sharimiki','/catalog/bonsai/sharimiki/'),(25,'syakan','/catalog/bonsai/syakan/'),(26,'dubnik','/catalog/succulents/dubnik/'),(27,'Anthurium','/catalog/succulents/Anthurium/'),(28,'dracaena','/catalog/succulents/dracaena/'),(29,'monstera','/catalog/succulents/monstera/'),(30,'palm','/catalog/succulents/palm/'),(31,'philodendron','/catalog/succulents/philodendron/'),(32,'succulentus','/catalog/succulents/succulentus/'),(34,'registration','/registration/'),(35,'account','/account/'),(36,'password-recovery','/password-recovery/'),(37,'basket','/basket/'),(38,'ordering','/ordering/'),(43,'search','/search/');
/*!40000 ALTER TABLE `page_id_uri` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `page_parent_id`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_parent_id` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `countSortNum` bigint(20) DEFAULT NULL,
  `sub_domain` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `page_parent_id_ibfk_1` FOREIGN KEY (`id`) REFERENCES `page_id_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_parent_id`
--

LOCK TABLES `page_parent_id` WRITE;
/*!40000 ALTER TABLE `page_parent_id` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `page_parent_id` VALUES (1,0,1,64,1),(2,0,2,68,1),(3,1,0,65,1),(4,3,0,66,1),(5,3,1,67,1),(6,0,3,69,1),(7,0,0,39,1),(8,7,0,40,1),(9,7,1,48,1),(10,7,2,56,1),(11,8,0,41,1),(12,8,1,42,1),(13,8,2,43,1),(14,9,0,49,1),(17,8,3,44,1),(18,8,4,45,1),(19,8,5,46,1),(20,9,1,50,1),(21,9,2,51,1),(22,9,3,52,1),(23,9,4,53,1),(24,9,5,54,1),(25,9,6,55,1),(26,10,0,57,1),(27,10,1,58,1),(28,10,2,59,1),(29,10,3,60,1),(30,10,4,61,1),(31,10,5,62,1),(32,10,6,63,1),(34,0,4,71,1),(35,0,5,72,1),(36,0,6,73,1),(37,0,7,74,1),(38,0,8,75,1),(43,0,9,76,1);
/*!40000 ALTER TABLE `page_parent_id` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `plugins`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `text_id` varchar(255) NOT NULL,
  `text` text,
  `version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `plugins_rights`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins_rights` (
  `user_id` int(11) NOT NULL,
  `text_id` varchar(255) DEFAULT NULL,
  `read_right` tinyint(1) DEFAULT NULL,
  `create_right` tinyint(1) DEFAULT NULL,
  `edit_right` tinyint(1) DEFAULT NULL,
  `delete_right` tinyint(1) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `text_id` (`text_id`),
  CONSTRAINT `plugins_rights_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `plugins_rights_ibfk_2` FOREIGN KEY (`text_id`) REFERENCES `plugins` (`text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_rights`
--

LOCK TABLES `plugins_rights` WRITE;
/*!40000 ALTER TABLE `plugins_rights` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `plugins_rights` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `reference_data`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_data` (
  `reference_id` int(11) DEFAULT NULL,
  `reference_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reference_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_data`
--

LOCK TABLES `reference_data` WRITE;
/*!40000 ALTER TABLE `reference_data` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `reference_data` VALUES (64,1,'Netherlands'),(64,2,'Egypt'),(64,3,'Mexico'),(67,4,'Japan'),(67,5,'China'),(68,6,'Russia'),(68,7,'Netherlands'),(54,9,'Test addresses');
/*!40000 ALTER TABLE `reference_data` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `sections`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `class_ico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `sections` VALUES (1,'events',1,'/events','fa-bell-o'),(2,'structure',1,'/structure','fa-file-o'),(3,'templates',1,'/type_template_data','fa-archive'),(4,'references',1,'/references','fa-book'),(5,'orders',1,'/emarket','fa-shopping-cart'),(6,'feedback',1,'/webforms','fa-envelope-o'),(7,'users',1,'/users','fa-user'),(8,'plugins',1,'/plugins','fa-plug'),(9,'backups',1,'/backups','fa-download'),(10,'settings',1,'/settings','fa-wrench');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `sessions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_time_session_create` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `sessions` VALUES ('88676e28cc82f044e5c21c876e98e904',1,'2018-11-05 15:03:10');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `settings` VALUES (1,'admin_email','test@mail.ru');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `site_sub_domains`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_sub_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_id` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `default_value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text_id` (`text_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_sub_domains`
--

LOCK TABLES `site_sub_domains` WRITE;
/*!40000 ALTER TABLE `site_sub_domains` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `site_sub_domains` VALUES (1,'en','English',1),(2,'ru','Russian',0);
/*!40000 ALTER TABLE `site_sub_domains` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `site_url`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_url`
--

LOCK TABLES `site_url` WRITE;
/*!40000 ALTER TABLE `site_url` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `site_url` VALUES (1,'demo-php.scale-all.com');
/*!40000 ALTER TABLE `site_url` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `template_id_group_id`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_id_group_id` (
  `template_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  KEY `template_id` (`template_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `template_id_group_id_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template_id_name` (`id`),
  CONSTRAINT `template_id_group_id_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group_id_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_id_group_id`
--

LOCK TABLES `template_id_group_id` WRITE;
/*!40000 ALTER TABLE `template_id_group_id` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `template_id_group_id` VALUES (3,1),(7,84),(54,85),(55,86),(56,87),(1,88),(57,88),(57,89),(59,88),(59,89),(60,88),(60,89),(61,88),(61,89),(59,91),(63,88),(63,89),(63,91),(60,92),(61,93),(69,88),(69,89),(69,92),(70,88),(70,89),(70,93),(54,85),(72,88),(73,88),(74,88),(75,88),(76,88),(4,94),(77,95),(78,88),(55,96);
/*!40000 ALTER TABLE `template_id_group_id` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `template_id_name`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_id_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_id_name`
--

LOCK TABLES `template_id_name` WRITE;
/*!40000 ALTER TABLE `template_id_name` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `template_id_name` VALUES (1,'Section of the website'),(2,'Directories'),(3,'Users'),(4,'Orders'),(5,'Feedback'),(6,'Forms'),(7,'Message template'),(54,'Addresses'),(55,'Global'),(56,'Slide'),(57,'Catalog'),(59,'Cacti'),(60,'Bonsai(s)'),(61,'Succulents'),(63,'Cactus'),(64,'Manufacturer_cacti'),(67,'Manufacturer_bonsai'),(68,'Manufacturer_suculents'),(69,'Bonsai'),(70,'Suculent'),(72,'Registration'),(73,'Account'),(74,'Password recovery'),(75,'Basket'),(76,'Ordering'),(77,'Send message'),(78,'Search');
/*!40000 ALTER TABLE `template_id_name` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `template_parent_id`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_parent_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `template_parent_id_ibfk_1` FOREIGN KEY (`id`) REFERENCES `template_id_name` (`id`),
  CONSTRAINT `template_parent_id_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `template_id_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_parent_id`
--

LOCK TABLES `template_parent_id` WRITE;
/*!40000 ALTER TABLE `template_parent_id` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `template_parent_id` VALUES (1,NULL),(2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL),(7,NULL),(55,1),(56,1),(57,1),(72,1),(73,1),(74,1),(75,1),(76,1),(78,1),(54,2),(64,2),(67,2),(68,2),(77,6),(59,57),(60,57),(61,57),(63,59),(69,60),(70,61);
/*!40000 ALTER TABLE `template_parent_id` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `type_fields`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `table_name` varchar(255) DEFAULT NULL,
  `filter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_fields`
--

LOCK TABLES `type_fields` WRITE;
/*!40000 ALTER TABLE `type_fields` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `type_fields` VALUES (1,'String','field_values_type_string',1),(2,'Number','field_values_type_number',1),(3,'Checkbox','field_values_type_number',1),(4,'Select','field_values_type_select',1),(5,'Multi select','field_value_multi_select',1),(6,'Text','field_values_type_text',0),(7,'Html','field_values_type_html_text',0),(8,'Image/file','field_values_type_file',0),(9,'Date','field_values_type_date',1),(10,'Time','field_values_type_time',1),(11,'Double','field_values_type_double',1),(12,'Compound','field_values_type_sostav',0),(13,'Price','field_values_type_price',1),(14,'Reference to a tree','field_values_type_link_page',0),(15,'Password','field_values_type_password',0);
/*!40000 ALTER TABLE `type_fields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `password` text,
  `is_admin` tinyint(1) DEFAULT NULL,
  `new_event` tinyint(1) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `restore_path` text,
  `restore_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `users` VALUES (1,'admin','$2y$10$rHGvmVwJzifV5qsw5m0BGOCCqch4/mHFjjIzsMSsSXbnPO7V3q2La',1,1,'2018-11-05 10:44:58',NULL,NULL),(9,'maxV',NULL,NULL,1,'2018-09-05 10:03:37',NULL,NULL),(10,'new_User94',NULL,NULL,1,'2018-09-06 10:22:56',NULL,NULL),(11,'new_User926',NULL,NULL,1,'2018-09-06 10:24:59',NULL,NULL),(12,'new_User536',NULL,NULL,1,'2018-09-06 10:26:51',NULL,NULL),(13,'new_User614',NULL,NULL,1,'2018-09-06 10:29:19',NULL,NULL),(14,'new_User523',NULL,NULL,1,'2018-09-06 10:31:31',NULL,NULL),(15,'new_User697',NULL,NULL,1,'2018-09-06 10:33:22',NULL,NULL),(16,'new_User499',NULL,NULL,1,'2018-09-06 10:34:21',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Mon, 05 Nov 2018 15:04:17 +0300
