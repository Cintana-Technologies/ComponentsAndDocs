-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	8.0.3-rc-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema seva_updated
--

CREATE DATABASE IF NOT EXISTS seva_updated;
USE seva_updated;

--
-- Definition of table `annual_maintenance`
--

DROP TABLE IF EXISTS `annual_maintenance`;
CREATE TABLE `annual_maintenance` (
  `receipt_no` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `upload_document` blob,
  `campaign_id` int(11) DEFAULT NULL,
  `credit_or_debit_card_no` char(16) DEFAULT NULL,
  `txn_id` char(10) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`receipt_no`),
  KEY `payment_id` (`payment_id`),
  KEY `project_category_id` (`project_category_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `annual_maintenance_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_master` (`payment_id`),
  CONSTRAINT `annual_maintenance_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `annual_maintenance_ibfk_3` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`),
  CONSTRAINT `annual_maintenance_ibfk_4` FOREIGN KEY (`sub_type_id`) REFERENCES `maintenance_sub_type` (`sub_type_id`),
  CONSTRAINT `annual_maintenance_ibfk_5` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`),
  CONSTRAINT `annual_maintenance_ibfk_6` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `annual_maintenance`
--

/*!40000 ALTER TABLE `annual_maintenance` DISABLE KEYS */;
INSERT INTO `annual_maintenance` (`receipt_no`,`donor_id`,`donation_date`,`amount`,`payment_id`,`cheque_no`,`cheque_date`,`bank`,`project_category_id`,`maintenance_id`,`sub_type_id`,`notes`,`upload_document`,`campaign_id`,`credit_or_debit_card_no`,`txn_id`,`created_by`,`created_on`,`updated_by`,`updated_on`,`project_id`,`start_date`,`end_date`) VALUES 
 (2,27,'2017-06-09','2000.00',13,NULL,'2018-08-07',NULL,5,6,11,'Had a good experience!',NULL,NULL,NULL,NULL,'Admin','2018-04-16 18:12:01',NULL,NULL,NULL,'2018-06-05','2017-07-04'),
 (3,28,'2017-05-30','1234.00',2,'1234',NULL,NULL,5,6,11,'For Free School Hostel',NULL,5,NULL,NULL,'raju','2018-04-30 18:18:56',NULL,NULL,9,'2017-05-31','2017-05-31');
/*!40000 ALTER TABLE `annual_maintenance` ENABLE KEYS */;


--
-- Definition of table `audit_state_master`
--

DROP TABLE IF EXISTS `audit_state_master`;
CREATE TABLE `audit_state_master` (
  `state_code` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `state_short_name` varchar(10) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit_state_master`
--

/*!40000 ALTER TABLE `audit_state_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_state_master` ENABLE KEYS */;


--
-- Definition of table `building_donor`
--

DROP TABLE IF EXISTS `building_donor`;
CREATE TABLE `building_donor` (
  `receipt_no` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `full_building` varchar(100) DEFAULT NULL,
  `ground_floor` varchar(100) DEFAULT NULL,
  `first_floor` varchar(100) DEFAULT NULL,
  `second_floor` varchar(100) DEFAULT NULL,
  `third_floor` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `year_of_construction` varchar(30) DEFAULT NULL,
  `year_of_completion` varchar(30) DEFAULT NULL,
  `upload_photo` varchar(200) DEFAULT NULL,
  `credit_or_debit_card_no` char(16) DEFAULT NULL,
  `txn_id` char(10) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  `project_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`receipt_no`),
  KEY `payment_id` (`payment_id`),
  KEY `project_category_id` (`project_category_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `building_donor_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_master` (`payment_id`),
  CONSTRAINT `building_donor_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `building_donor_ibfk_3` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`),
  CONSTRAINT `building_donor_ibfk_4` FOREIGN KEY (`sub_type_id`) REFERENCES `maintenance_sub_type` (`sub_type_id`),
  CONSTRAINT `building_donor_ibfk_5` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`),
  CONSTRAINT `building_donor_ibfk_6` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `building_donor`
--

/*!40000 ALTER TABLE `building_donor` DISABLE KEYS */;
INSERT INTO `building_donor` (`receipt_no`,`donor_id`,`donation_date`,`amount`,`payment_id`,`cheque_no`,`cheque_date`,`bank`,`project_category_id`,`maintenance_id`,`sub_type_id`,`notes`,`campaign_id`,`full_building`,`ground_floor`,`first_floor`,`second_floor`,`third_floor`,`location`,`size`,`year_of_construction`,`year_of_completion`,`upload_photo`,`credit_or_debit_card_no`,`txn_id`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`,`project_id`) VALUES 
 (3,18,'2018-03-03','6000.00',13,NULL,'2010-03-03',NULL,6,10,14,'Had a good Experience!',4,'678','678','89','89','78','Nungambakam','10000','2018-04-04T18:30:00.000Z','2018-04-20T18:30:00.000Z',NULL,NULL,NULL,'Admin','2018-03-03 00:00:00',NULL,NULL,'Y',NULL),
 (6,22,'2018-04-28','32134.00',2,NULL,NULL,NULL,14,20,16,'dsfgf',5,'test','test','test','test','test','test','test','1234','2323',NULL,NULL,NULL,'raju','2018-04-28 15:58:15',NULL,NULL,'Y',13);
/*!40000 ALTER TABLE `building_donor` ENABLE KEYS */;


--
-- Definition of table `campaign_master`
--

DROP TABLE IF EXISTS `campaign_master`;
CREATE TABLE `campaign_master` (
  `campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_code` varchar(20) NOT NULL,
  `country_code` int(11) NOT NULL,
  `state_code` int(11) NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`campaign_id`),
  UNIQUE KEY `campaign_code` (`campaign_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  CONSTRAINT `campaign_master_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `campaign_master_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign_master`
--

/*!40000 ALTER TABLE `campaign_master` DISABLE KEYS */;
INSERT INTO `campaign_master` (`campaign_id`,`campaign_code`,`country_code`,`state_code`,`campaign_name`,`start_date`,`end_date`,`notes`,`created_by`,`created_on`,`updated_on`,`updated_by`,`active`) VALUES 
 (3,'CMP2',103,31,'Hostels','2018-04-12','2018-04-05',NULL,'raju','2018-04-16 16:05:01',NULL,NULL,'Y'),
 (4,'CMP4',14,49,'YRC','2018-04-03','2018-04-05',NULL,'raju','2018-04-16 16:06:37',NULL,NULL,'Y'),
 (5,'CMP5',103,31,'General Donation','2018-03-31','2018-03-31',NULL,'raju','2018-04-27 12:46:49',NULL,NULL,'Y'),
 (8,'CMP9',235,203,'Facility Camp','2018-04-30','2018-05-01',NULL,'raju','2018-04-27 12:54:50','2018-04-30 18:06:53',NULL,'Y');
/*!40000 ALTER TABLE `campaign_master` ENABLE KEYS */;


--
-- Definition of table `country_master`
--

DROP TABLE IF EXISTS `country_master`;
CREATE TABLE `country_master` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `country_short_name` varchar(10) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `Index_3` (`country_code`),
  KEY `country` (`country`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country_master`
--

/*!40000 ALTER TABLE `country_master` DISABLE KEYS */;
INSERT INTO `country_master` (`country_id`,`country_code`,`country`,`country_short_name`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (1,1,'Afghanistan','AF','Admin','2018-03-03 00:00:00',NULL,'2018-04-16 15:59:44','Y'),
 (10,103,'India','IN','Admin','2018-03-16 00:16:30',NULL,'2018-04-27 10:24:16','Y'),
 (29,5,'American Samoa','AS','raju','2018-04-10 17:54:04',NULL,'2018-04-16 16:01:46','N'),
 (32,235,'United States of America','US','raju','2018-04-12 14:24:26',NULL,NULL,'Y'),
 (33,14,'Australia','AU','raju','2018-04-13 11:21:06',NULL,NULL,'Y'),
 (35,112,'Japan','JP','raju','2018-04-16 15:44:19',NULL,NULL,'Y'),
 (36,4,'Algeria','DZ','raju','2018-04-27 12:15:59',NULL,NULL,'Y'),
 (37,3,'Albania','AL','raju','2018-04-27 12:18:54',NULL,NULL,'Y'),
 (38,2,'Aland Islands','AX','raju','2018-04-27 12:21:19',NULL,NULL,'Y'),
 (40,12,'Armenia','AM','raju','2018-04-27 12:39:49',NULL,NULL,'Y'),
 (41,13,'Aruba','AW','raju','2018-04-27 12:39:54',NULL,NULL,'Y'),
 (44,16,'Azerbaijan','AZ','raju','2018-04-27 12:41:46',NULL,NULL,'Y'),
 (45,15,'Austria','AT','raju','2018-04-27 12:41:51',NULL,NULL,'Y'),
 (46,17,'Bahamas','BS','raju','2018-04-27 12:41:56',NULL,NULL,'Y'),
 (51,101,'Hungary','HU','raju','2018-04-28 18:23:52',NULL,'2018-04-28 18:24:53','Y'),
 (53,18,'Bahrain','BH','raju','2018-04-30 09:28:45',NULL,NULL,'Y');
/*!40000 ALTER TABLE `country_master` ENABLE KEYS */;


--
-- Definition of table `country_master_lookup`
--

DROP TABLE IF EXISTS `country_master_lookup`;
CREATE TABLE `country_master_lookup` (
  `country_code` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `country_short_name` varchar(10) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`country_code`),
  UNIQUE KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_master_lookup`
--

/*!40000 ALTER TABLE `country_master_lookup` DISABLE KEYS */;
INSERT INTO `country_master_lookup` (`country_code`,`country`,`country_short_name`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (1,'Afghanistan','AF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (2,'Aland Islands','AX','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (3,'Albania','AL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (4,'Algeria','DZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (5,'American Samoa','AS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (6,'Andorra','AD','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (7,'Angola','AO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (8,'Anguilla','AI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (9,'Antarctica','AQ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (10,'Antigua and Barbuda','AG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (11,'Argentina','AR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (12,'Armenia','AM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (13,'Aruba','AW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (14,'Australia','AU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (15,'Austria','AT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (16,'Azerbaijan','AZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (17,'Bahamas','BS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (18,'Bahrain','BH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (19,'Bangladesh','BD','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (20,'Barbados','BB','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (21,'Belarus','BY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (22,'Belgium','BE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (23,'Belize','BZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (24,'Benin','BJ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (25,'Bermuda','BM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (26,'Bhutan','BT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (27,'Bolivia','BO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (28,'Bosnia and Herzegovina','BA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (29,'Botswana','BW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (30,'Bouvet Island','BV','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (31,'Brazil','BR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (32,'British Virgin Islands','VG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (33,'British Indian Ocean Territory','IO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (34,'Brunei Darussalam','BN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (35,'Bulgaria','BG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (36,'Burkina Faso','BF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (37,'Burundi','BI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (38,'Cambodia','KH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (39,'Cameroon','CM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (40,'Canada','CA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (41,'Cape Verde','CV','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (42,'Cayman Islands','KY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (43,'Central African Republic','CF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (44,'Chad','TD','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (45,'Chile','CL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (46,'China','CN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (47,'Hong Kong, SAR China','HK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (48,'Macao, SAR China','MO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (49,'Christmas Island','CX','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (50,'Cocos (Keeling) Islands','CC','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (51,'Colombia','CO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (52,'Comoros','KM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (53,'Congo (Brazzaville)','CG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (54,'Congo, (Kinshasa)','CD','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (55,'Cook Islands','CK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (56,'Costa Rica','CR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (57,'Côte dIvoire','CI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (58,'Croatia','HR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (59,'Cuba','CU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (60,'Cyprus','CY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (61,'Czech Republic','CZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (62,'Denmark','DK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (63,'Djibouti','DJ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (64,'Dominica','DM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (65,'Dominican Republic','DO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (66,'Ecuador','EC','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (67,'Egypt','EG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (68,'El Salvador','SV','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (69,'Equatorial Guinea','GQ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (70,'Eritrea','ER','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (71,'Estonia','EE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (72,'Ethiopia','ET','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (73,'Falkland Islands (Malvinas)','FK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (74,'Faroe Islands','FO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (75,'Fiji','FJ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (76,'Finland','FI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (77,'France','FR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (78,'French Guiana','GF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (79,'French Polynesia','PF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (80,'French Southern Territories','TF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (81,'Gabon','GA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (82,'Gambia','GM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (83,'Georgia','GE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (84,'Germany','DE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (85,'Ghana','GH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (86,'Gibraltar','GI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (87,'Greece','GR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (88,'Greenland','GL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (89,'Grenada','GD','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (90,'Guadeloupe','GP','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (91,'Guam','GU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (92,'Guatemala','GT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (93,'Guernsey','GG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (94,'Guinea','GN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (95,'Guinea-Bissau','GW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (96,'Guyana','GY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (97,'Haiti','HT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (98,'Heard and Mcdonald Islands','HM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (99,'Holy See (Vatican City State)','VA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (100,'Honduras','HN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (101,'Hungary','HU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (102,'Iceland','IS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (103,'India','IN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (104,'Indonesia','ID','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (105,'Iran, Islamic Republic of','IR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (106,'Iraq','IQ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (107,'Ireland','IE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (108,'Isle of Man','IM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (109,'Israel','IL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (110,'Italy','IT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (111,'Jamaica','JM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (112,'Japan','JP','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (113,'Jersey','JE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (114,'Jordan','JO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (115,'Kazakhstan','KZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (116,'Kenya','KE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (117,'Kiribati','KI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (118,'Korea (North)','KP','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (119,'Korea (South)','KR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (120,'Kuwait','KW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (121,'Kyrgyzstan','KG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (122,'Lao PDR','LA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (123,'Latvia','LV','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (124,'Lebanon','LB','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (125,'Lesotho','LS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (126,'Liberia','LR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (127,'Libya','LY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (128,'Liechtenstein','LI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (129,'Lithuania','LT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (130,'Luxembourg','LU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (131,'Macedonia, Republic of','MK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (132,'Madagascar','MG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (133,'Malawi','MW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (134,'Malaysia','MY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (135,'Maldives','MV','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (136,'Mali','ML','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (137,'Malta','MT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (138,'Marshall Islands','MH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (139,'Martinique','MQ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (140,'Mauritania','MR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (141,'Mauritius','MU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (142,'Mayotte','YT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (143,'Mexico','MX','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (144,'Micronesia, Federated States of','FM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (145,'Moldova','MD','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (146,'Monaco','MC','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (147,'Mongolia','MN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (148,'Montenegro','ME','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (149,'Montserrat','MS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (150,'Morocco','MA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (151,'Mozambique','MZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (152,'Myanmar','MM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (153,'Namibia','NA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (154,'Nauru','NR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (155,'Nepal','NP','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (156,'Netherlands','NL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (157,'Netherlands Antilles','AN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (158,'New Caledonia','NC','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (159,'New Zealand','NZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (160,'Nicaragua','NI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (161,'Niger','NE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (162,'Nigeria','NG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (163,'Niue','NU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (164,'Norfolk Island','NF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (165,'Northern Mariana Islands','MP','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (166,'Norway','NO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (167,'Oman','OM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (168,'Pakistan','PK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (169,'Palau','PW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (170,'Palestinian Territory','PS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (171,'Panama','PA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (172,'Papua New Guinea','PG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (173,'Paraguay','PY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (174,'Peru','PE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (175,'Philippines','PH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (176,'Pitcairn','PN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (177,'Poland','PL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (178,'Portugal','PT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (179,'Puerto Rico','PR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (180,'Qatar','QA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (181,'Réunion','RE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (182,'Romania','RO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (183,'Russian Federation','RU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (184,'Rwanda','RW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (185,'Saint-Barthélemy','BL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (186,'Saint Helena','SH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (187,'Saint Kitts and Nevis','KN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (188,'Saint Lucia','LC','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (189,'Saint-Martin (French part)','MF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (190,'Saint Pierre and Miquelon','PM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (191,'Saint Vincent and Grenadines','VC','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (192,'Samoa','WS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (193,'San Marino','SM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (194,'Sao Tome and Principe','ST','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (195,'Saudi Arabia','SA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (196,'Senegal','SN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (197,'Serbia','RS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (198,'Seychelles','SC','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (199,'Sierra Leone','SL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (200,'Singapore','SG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (201,'Slovakia','SK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (202,'Slovenia','SI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (203,'Solomon Islands','SB','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (204,'Somalia','SO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (205,'South Africa','ZA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (206,'South Georgia and the South Sandwich Islands','GS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (207,'South Sudan','SS','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (208,'Spain','ES','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (209,'Sri Lanka','LK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (210,'Sudan','SD','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (211,'Suriname','SR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (212,'Svalbard and Jan Mayen Islands','SJ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (213,'Swaziland','SZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (214,'Sweden','SE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (215,'Switzerland','CH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (216,'Syrian Arab Republic (Syria)','SY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (217,'Taiwan, Republic of China','TW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (218,'Tajikistan','TJ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (219,'Tanzania, United Republic of','TZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (220,'Thailand','TH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (221,'Timor-Leste','TL','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (222,'Togo','TG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (223,'Tokelau','TK','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (224,'Tonga','TO','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (225,'Trinidad and Tobago','TT','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (226,'Tunisia','TN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (227,'Turkey','TR','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (228,'Turkmenistan','TM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (229,'Turks and Caicos Islands','TC','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (230,'Tuvalu','TV','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (231,'Uganda','UG','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (232,'Ukraine','UA','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (233,'United Arab Emirates','AE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (234,'United Kingdom','GB','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (235,'United States of America','US','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (236,'US Minor Outlying Islands','UM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (237,'Uruguay','UY','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (238,'Uzbekistan','UZ','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (239,'Vanuatu','VU','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (240,'Venezuela (Bolivarian Republic)','VE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (241,'Viet Nam','VN','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (242,'Virgin Islands, US','VI','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (243,'Wallis and Futuna Islands','WF','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (244,'Western Sahara','EH','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (245,'Yemen','YE','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (246,'Zambia','ZM','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y'),
 (247,'Zimbabwe','ZW','ADMIN','2018-03-06 18:33:03',NULL,NULL,'Y');
/*!40000 ALTER TABLE `country_master_lookup` ENABLE KEYS */;


--
-- Definition of table `donor`
--

DROP TABLE IF EXISTS `donor`;
CREATE TABLE `donor` (
  `donor_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_code` char(50) NOT NULL,
  `country_code` int(11) NOT NULL,
  `state_code` int(11) NOT NULL,
  `donor_type` varchar(10) DEFAULT NULL,
  `donor_sub_type` varchar(45) DEFAULT NULL,
  `organization_name` varchar(100) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `landline_no` varchar(15) DEFAULT NULL,
  `fax_no` varchar(15) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `address1` varchar(80) DEFAULT NULL,
  `address2` varchar(80) DEFAULT NULL,
  `address3` varchar(80) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) CHARACTER SET ucs2 NOT NULL DEFAULT 'Y',
  `city` varchar(45) NOT NULL,
  `postal_code` char(10) NOT NULL,
  `gender` smallint(5) unsigned NOT NULL,
  `dob` date NOT NULL,
  `anniversary` date DEFAULT NULL,
  PRIMARY KEY (`donor_id`) USING BTREE,
  UNIQUE KEY `donor_code` (`donor_code`),
  UNIQUE KEY `Index_5` (`first_name`) USING BTREE,
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  CONSTRAINT `country_code_fk` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `donor_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  CONSTRAINT `state_code_fk` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donor`
--

/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` (`donor_id`,`donor_code`,`country_code`,`state_code`,`donor_type`,`donor_sub_type`,`organization_name`,`contact_person`,`first_name`,`last_name`,`mobile_no`,`landline_no`,`fax_no`,`email_id`,`website`,`address1`,`address2`,`address3`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`,`city`,`postal_code`,`gender`,`dob`,`anniversary`) VALUES 
 (18,'I1234',103,31,'Individual','','','','Rahul','N','8639471140','4232230428','98765','rahulsaivishnu@gmail.com','www.cintanatech.com','Bharadhiyar Colony','Ashok Pillar','Ashok nagar','Admin','2018-04-16 17:46:42','Admin','2018-04-29 13:54:58','Y','Chennai','600083',0,'1991-04-03','2011-04-28'),
 (27,'CP1',103,31,'Corporate','Public Sector','LIC','test','test','test','1234567890',NULL,NULL,'test@gmail.com',NULL,'test',NULL,NULL,'Admin','2018-05-02 19:11:20',NULL,NULL,'Y','test','1234',1,'2018-05-01',NULL),
 (28,'CPR1',103,31,'Corporate','Private Sector','LIC','test','Rahul S','Vishnu','8639471140',NULL,NULL,'rahulsai.vishnu@cintanatech.com',NULL,'test',NULL,NULL,'Admin','2018-05-02 19:11:52',NULL,NULL,'Y','test','1234',1,'2018-05-01','2018-05-31'),
 (30,'CB1',103,31,'Corporate','Bank','SBI',NULL,'sbi','tnagar','1234567890',NULL,NULL,'test@gmail.com',NULL,'test',NULL,NULL,'Admin','2018-05-02 19:16:33',NULL,NULL,'Y','test','1234',1,'2018-05-01',NULL);
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;


--
-- Definition of table `facility_management`
--

DROP TABLE IF EXISTS `facility_management`;
CREATE TABLE `facility_management` (
  `receipt_no` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `credit_or_debit_card_no` char(16) DEFAULT NULL,
  `txn_id` char(10) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`receipt_no`),
  KEY `payment_id` (`payment_id`),
  KEY `project_category_id` (`project_category_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `facility_management_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_master` (`payment_id`),
  CONSTRAINT `facility_management_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `facility_management_ibfk_3` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`),
  CONSTRAINT `facility_management_ibfk_4` FOREIGN KEY (`sub_type_id`) REFERENCES `maintenance_sub_type` (`sub_type_id`),
  CONSTRAINT `facility_management_ibfk_5` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`),
  CONSTRAINT `facility_management_ibfk_6` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facility_management`
--

/*!40000 ALTER TABLE `facility_management` DISABLE KEYS */;
INSERT INTO `facility_management` (`receipt_no`,`donor_id`,`donation_date`,`amount`,`payment_id`,`cheque_no`,`cheque_date`,`bank`,`project_category_id`,`maintenance_id`,`sub_type_id`,`notes`,`campaign_id`,`credit_or_debit_card_no`,`txn_id`,`created_on`,`created_by`,`updated_on`,`updated_by`,`project_id`) VALUES 
 (2,22,'2018-09-09','7000.00',13,NULL,'2018-08-07',NULL,6,10,14,'Had a great Experience!',3,NULL,NULL,'2018-04-16 18:26:26','Admin',NULL,NULL,NULL),
 (5,22,'2018-04-28','123.00',2,NULL,NULL,NULL,14,20,16,'dfdwf',5,NULL,NULL,'2018-04-28 16:34:33','raju',NULL,NULL,13),
 (6,23,'2018-04-30','2324.00',13,'234244',NULL,NULL,14,20,16,'sdgfedgegg',8,NULL,NULL,'2018-04-30 10:38:43','raju',NULL,NULL,13);
/*!40000 ALTER TABLE `facility_management` ENABLE KEYS */;


--
-- Definition of table `fsh_donor`
--

DROP TABLE IF EXISTS `fsh_donor`;
CREATE TABLE `fsh_donor` (
  `receipt_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `co_ordinator` varchar(75) NOT NULL,
  `warden` varchar(75) NOT NULL,
  `no_of_student` int(10) unsigned NOT NULL,
  `year` char(12) NOT NULL,
  `fsh_contact_number` varchar(15) DEFAULT NULL,
  `active` char(1) NOT NULL,
  `project_category_id` int(11) NOT NULL,
  `donation_date` datetime NOT NULL,
  `amount` char(20) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`receipt_no`) USING BTREE,
  KEY `fk_fsh_donor_donor1` (`donor_id`) USING BTREE,
  KEY `fk_fsh_donor_project_category1_idx` (`project_category_id`) USING BTREE,
  CONSTRAINT `fk_fsh_donor_donor1` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`),
  CONSTRAINT `fk_fsh_donor_project_category1` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fsh_donor`
--

/*!40000 ALTER TABLE `fsh_donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsh_donor` ENABLE KEYS */;


--
-- Definition of table `general_donation`
--

DROP TABLE IF EXISTS `general_donation`;
CREATE TABLE `general_donation` (
  `receipt_no` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `credit_or_debit_card_no` char(16) DEFAULT NULL,
  `txn_id` char(10) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`receipt_no`),
  KEY `payment_id` (`payment_id`),
  KEY `project_category_id` (`project_category_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `project_id` (`project_id`),
  KEY `general_donation_id` (`receipt_no`),
  CONSTRAINT `general_donation_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_master` (`payment_id`),
  CONSTRAINT `general_donation_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `general_donation_ibfk_3` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`),
  CONSTRAINT `general_donation_ibfk_4` FOREIGN KEY (`sub_type_id`) REFERENCES `maintenance_sub_type` (`sub_type_id`),
  CONSTRAINT `general_donation_ibfk_5` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`),
  CONSTRAINT `general_donation_ibfk_6` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_donation`
--

/*!40000 ALTER TABLE `general_donation` DISABLE KEYS */;
INSERT INTO `general_donation` (`receipt_no`,`donor_id`,`donation_date`,`amount`,`payment_id`,`cheque_no`,`cheque_date`,`bank`,`project_category_id`,`maintenance_id`,`sub_type_id`,`notes`,`campaign_id`,`credit_or_debit_card_no`,`txn_id`,`created_on`,`created_by`,`updated_on`,`updated_by`,`project_id`) VALUES 
 (2,18,'2017-06-03','5000.00',13,NULL,'2018-03-03',NULL,5,6,11,'Had a good experience',3,NULL,NULL,'2018-04-16 18:08:52','Admin',NULL,NULL,7),
 (3,18,'2017-05-04','10000.00',13,NULL,'2018-04-04',NULL,5,17,13,NULL,4,NULL,NULL,'2018-04-04 00:00:00','admin',NULL,NULL,10),
 (4,28,'2018-05-02','1234.00',2,'1234',NULL,NULL,5,6,11,'test',3,NULL,NULL,'2018-05-02 19:56:01','raju',NULL,NULL,9);
/*!40000 ALTER TABLE `general_donation` ENABLE KEYS */;


--
-- Definition of table `general_donaton`
--

DROP TABLE IF EXISTS `general_donaton`;
CREATE TABLE `general_donaton` (
  `receipt_no` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `credit_or_debit_card_no` char(16) DEFAULT NULL,
  `txn_id` char(10) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`receipt_no`),
  KEY `payment_id` (`payment_id`),
  KEY `project_category_id` (`project_category_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `campaign_id` (`campaign_id`),
  CONSTRAINT `general_donaton_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_master` (`payment_id`),
  CONSTRAINT `general_donaton_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `general_donaton_ibfk_3` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`),
  CONSTRAINT `general_donaton_ibfk_4` FOREIGN KEY (`sub_type_id`) REFERENCES `maintenance_sub_type` (`sub_type_id`),
  CONSTRAINT `general_donaton_ibfk_5` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_donaton`
--

/*!40000 ALTER TABLE `general_donaton` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_donaton` ENABLE KEYS */;


--
-- Definition of table `general_donor_history`
--

DROP TABLE IF EXISTS `general_donor_history`;
CREATE TABLE `general_donor_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `donor_id` int(10) unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `Sent_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_donor_history`
--

/*!40000 ALTER TABLE `general_donor_history` DISABLE KEYS */;
INSERT INTO `general_donor_history` (`id`,`donor_id`,`type`,`status`,`Sent_date`) VALUES 
 (5,18,'Individual','Sent','2018-05-10 22:48:27');
/*!40000 ALTER TABLE `general_donor_history` ENABLE KEYS */;


--
-- Definition of table `land_donor`
--

DROP TABLE IF EXISTS `land_donor`;
CREATE TABLE `land_donor` (
  `receipt_no` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `donated` varchar(50) DEFAULT NULL,
  `leased` varchar(50) DEFAULT NULL,
  `build_up_area` varchar(50) DEFAULT NULL,
  `vacant_area` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `year_of_donation` varchar(30) DEFAULT NULL,
  `leased_period` varchar(50) DEFAULT NULL,
  `credit_or_debit_card_no` char(16) DEFAULT NULL,
  `txn_id` char(10) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`receipt_no`),
  KEY `payment_id` (`payment_id`),
  KEY `project_category_id` (`project_category_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `land_donor_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_master` (`payment_id`),
  CONSTRAINT `land_donor_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `land_donor_ibfk_3` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`),
  CONSTRAINT `land_donor_ibfk_4` FOREIGN KEY (`sub_type_id`) REFERENCES `maintenance_sub_type` (`sub_type_id`),
  CONSTRAINT `land_donor_ibfk_5` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`),
  CONSTRAINT `land_donor_ibfk_6` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `land_donor`
--

/*!40000 ALTER TABLE `land_donor` DISABLE KEYS */;
INSERT INTO `land_donor` (`receipt_no`,`donor_id`,`donation_date`,`amount`,`payment_id`,`cheque_no`,`cheque_date`,`bank`,`project_category_id`,`maintenance_id`,`sub_type_id`,`notes`,`campaign_id`,`donated`,`leased`,`build_up_area`,`vacant_area`,`location`,`year_of_donation`,`leased_period`,`credit_or_debit_card_no`,`txn_id`,`created_by`,`created_on`,`updated_by`,`updated_on`,`project_id`) VALUES 
 (1,15,'2018-03-03','345.00',3,NULL,'2019-03-03',NULL,5,6,2,'dfghteh',4,'cvncgng','bmnmn',NULL,'cnn','vcnn','nndg','zcnn',NULL,NULL,'Admin','2018-04-16 12:27:35',NULL,NULL,NULL),
 (2,23,'2018-03-03','1000.00',13,NULL,'2019-03-03',NULL,5,6,11,'Had a great experience',3,'Rahul','Ankit',NULL,'Ashok pillar','Chennai','2018','2 months',NULL,NULL,'Admin','2018-04-16 18:28:15',NULL,NULL,NULL),
 (3,33,'2018-04-28','1234.00',13,NULL,NULL,NULL,5,17,13,'test',8,'test','test',NULL,'test','test','1234','test',NULL,NULL,'raju','2018-04-28 12:12:59',NULL,NULL,13),
 (4,33,'2018-04-28','1234.00',13,NULL,NULL,NULL,5,17,13,'test',8,'test','test',NULL,'test','test','1234','test',NULL,NULL,'raju','2018-04-28 12:13:09',NULL,NULL,13),
 (5,33,'2018-04-28','1234.00',13,NULL,'2018-04-29',NULL,5,17,13,'test',8,'test','test',NULL,'test','test','1234','test',NULL,NULL,'raju','2018-04-28 12:15:31',NULL,NULL,13),
 (6,33,'2018-04-28','1234.00',13,NULL,'2018-04-29',NULL,5,17,13,'test',8,'test','test',NULL,'test','test','1234','test',NULL,NULL,'raju','2018-04-28 12:15:34',NULL,NULL,13),
 (7,23,'2018-04-28','21324.00',2,NULL,NULL,NULL,14,20,16,'xcfsfgr',3,'xcvfdsgf','sdfgg',NULL,'12','xffgdsfg','232','sdgg',NULL,NULL,'raju','2018-04-28 16:10:48',NULL,NULL,13),
 (8,23,'2018-04-28','2134.00',2,NULL,NULL,NULL,14,20,16,'adsfrawt',8,'fsdgsg','fgfg',NULL,'21','dfgg','123','fdgfg',NULL,NULL,'raju','2018-04-28 16:26:12',NULL,NULL,14),
 (9,49,'2018-05-02','2314214.00',2,'214424213421452',NULL,NULL,5,6,11,'dsffgedgtea',8,'test','test',NULL,'12','test','1234','test',NULL,NULL,'raju','2018-05-02 13:06:57',NULL,NULL,9);
/*!40000 ALTER TABLE `land_donor` ENABLE KEYS */;


--
-- Definition of table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
CREATE TABLE `login_history` (
  `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_code` int(11) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `fk_login_history_user_master1_idx` (`user_code`) USING BTREE,
  CONSTRAINT `fk_login_history_user_master1` FOREIGN KEY (`user_code`) REFERENCES `user_master` (`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_history`
--

/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
INSERT INTO `login_history` (`login_id`,`user_code`,`login_time`,`logout_time`) VALUES 
 (1,1,'2018-04-25 12:37:23',NULL),
 (2,1,'2018-04-25 14:12:58',NULL),
 (3,1,'2018-04-26 16:57:45',NULL),
 (4,1,'2018-04-27 09:57:19',NULL),
 (5,1,'2018-04-27 10:12:55',NULL),
 (6,1,'2018-04-27 10:19:13',NULL),
 (7,1,'2018-04-27 11:29:17',NULL),
 (8,1,'2018-04-27 11:29:58',NULL),
 (9,1,'2018-04-27 12:06:41',NULL),
 (10,1,'2018-04-27 15:30:12',NULL),
 (11,1,'2018-04-27 16:51:26',NULL),
 (12,1,'2018-04-28 12:09:43',NULL),
 (13,1,'2018-04-28 16:52:55',NULL),
 (14,1,'2018-04-28 17:01:00',NULL),
 (15,1,'2018-04-28 18:15:25',NULL),
 (16,1,'2018-04-29 16:16:42',NULL),
 (17,1,'2018-04-29 16:19:07',NULL),
 (18,1,'2018-04-29 16:22:16',NULL),
 (19,1,'2018-04-29 16:23:54',NULL),
 (20,1,'2018-04-29 16:25:02',NULL),
 (21,1,'2018-04-29 16:27:10',NULL),
 (22,1,'2018-04-29 16:27:45',NULL),
 (23,1,'2018-04-29 16:28:14',NULL),
 (24,1,'2018-04-29 16:31:09',NULL),
 (25,1,'2018-04-29 16:45:27',NULL),
 (26,1,'2018-04-29 16:47:40',NULL),
 (27,1,'2018-04-29 16:48:47',NULL),
 (28,1,'2018-04-29 16:49:25',NULL),
 (29,1,'2018-04-29 16:54:44',NULL),
 (30,1,'2018-04-29 16:59:48',NULL),
 (31,1,'2018-04-29 17:01:39',NULL),
 (32,1,'2018-04-29 17:07:29',NULL),
 (33,1,'2018-04-29 17:08:42',NULL),
 (34,1,'2018-04-29 17:09:23',NULL),
 (35,1,'2018-04-29 17:11:13',NULL),
 (36,1,'2018-04-29 17:12:11',NULL),
 (37,1,'2018-04-29 17:13:37',NULL),
 (38,1,'2018-04-29 17:14:40',NULL),
 (39,1,'2018-04-29 17:16:02',NULL),
 (40,1,'2018-04-29 17:28:38',NULL),
 (41,1,'2018-04-29 17:31:31',NULL),
 (42,1,'2018-04-29 17:31:59',NULL),
 (43,1,'2018-04-29 17:33:38',NULL),
 (44,1,'2018-04-29 17:34:32',NULL),
 (45,1,'2018-04-29 17:35:16',NULL),
 (46,1,'2018-04-29 17:36:37',NULL),
 (47,1,'2018-04-29 17:37:07',NULL),
 (48,1,'2018-04-29 17:38:00',NULL),
 (49,1,'2018-04-29 17:38:46',NULL),
 (50,1,'2018-04-29 17:39:42',NULL),
 (51,1,'2018-04-29 17:41:14',NULL),
 (52,1,'2018-04-29 17:42:15',NULL),
 (53,1,'2018-04-29 17:43:41',NULL),
 (54,1,'2018-04-29 17:44:41',NULL),
 (55,1,'2018-04-29 17:46:12',NULL),
 (56,1,'2018-04-29 17:50:35',NULL),
 (57,1,'2018-04-29 17:52:56',NULL),
 (58,8,'2018-04-29 18:12:12',NULL),
 (59,2,'2018-04-29 18:13:38',NULL),
 (60,1,'2018-04-29 18:14:16',NULL),
 (61,1,'2018-04-29 18:19:34',NULL),
 (62,1,'2018-04-29 18:27:59',NULL),
 (63,1,'2018-04-30 09:26:57',NULL),
 (64,1,'2018-04-30 10:18:00',NULL),
 (65,1,'2018-04-30 10:30:03',NULL),
 (66,1,'2018-04-30 10:36:01',NULL),
 (67,1,'2018-04-30 10:46:28',NULL),
 (68,1,'2018-04-30 11:39:17',NULL),
 (69,1,'2018-04-30 11:48:48',NULL),
 (70,2,'2018-04-30 11:54:13',NULL),
 (71,1,'2018-04-30 11:54:48',NULL),
 (72,1,'2018-04-30 15:20:50',NULL),
 (73,1,'2018-05-02 10:26:43',NULL),
 (74,1,'2018-05-02 10:27:27',NULL),
 (75,1,'2018-05-02 14:41:41',NULL),
 (76,1,'2018-05-02 15:28:19',NULL),
 (77,1,'2018-05-03 09:44:09',NULL),
 (78,1,'2018-05-06 17:18:27',NULL),
 (79,1,'2018-05-06 17:22:11',NULL),
 (80,1,'2018-05-07 10:01:32',NULL);
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;


--
-- Definition of table `maintenance_sub_type`
--

DROP TABLE IF EXISTS `maintenance_sub_type`;
CREATE TABLE `maintenance_sub_type` (
  `sub_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_category_id` int(11) NOT NULL,
  `maintenance_id` int(11) NOT NULL,
  `sub_type` varchar(50) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`sub_type_id`),
  KEY `project_category_id` (`project_category_id`) USING BTREE,
  KEY `maintenance_id` (`maintenance_id`) USING BTREE,
  KEY `composite` (`project_category_id`,`maintenance_id`,`sub_type`),
  CONSTRAINT `maintenance_sub_type_ibfk_1` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `maintenance_sub_type_ibfk_2` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maintenance_sub_type`
--

/*!40000 ALTER TABLE `maintenance_sub_type` DISABLE KEYS */;
INSERT INTO `maintenance_sub_type` (`sub_type_id`,`project_category_id`,`maintenance_id`,`sub_type`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (11,5,6,'freeschool','raju','2018-04-16 16:50:55',NULL,NULL,'Y'),
 (13,5,17,'Products','raju','2018-04-16 16:53:00',NULL,NULL,'Y'),
 (14,6,10,'Ambulance','raju','2018-04-16 18:12:58',NULL,NULL,'Y'),
 (16,14,20,'School Ambulance Service','Admin','2018-04-27 15:12:39',NULL,NULL,'Y');
/*!40000 ALTER TABLE `maintenance_sub_type` ENABLE KEYS */;


--
-- Definition of trigger `trg_maintenance_sub_type`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_maintenance_sub_type`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_maintenance_sub_type` AFTER DELETE ON `maintenance_sub_type` FOR EACH ROW begin

  insert into audit_seva.audit_maintenance_sub_type (project_category_id, maintenance_id, sub_type, created_by, created_on, updated_by, updated_on, active)
  values(old.project_category_id, old.maintenance_id, old.sub_type, old.created_by, old.created_on, old.updated_by, now(), old.active);


end $$

DELIMITER ;

--
-- Definition of table `maintenance_type`
--

DROP TABLE IF EXISTS `maintenance_type`;
CREATE TABLE `maintenance_type` (
  `maintenance_id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_code` char(6) NOT NULL,
  `project_category_id` int(11) NOT NULL,
  `maintenance_type` varchar(50) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`maintenance_id`),
  UNIQUE KEY `maintenance_code` (`maintenance_code`),
  KEY `project_category_id` (`project_category_id`),
  CONSTRAINT `maintenance_type_ibfk_1` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maintenance_type`
--

/*!40000 ALTER TABLE `maintenance_type` DISABLE KEYS */;
INSERT INTO `maintenance_type` (`maintenance_id`,`maintenance_code`,`project_category_id`,`maintenance_type`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (6,'FSH01',5,'Annual FSH Maintenance','Admin','2018-03-19 00:00:00','raju','2018-04-13 12:46:58','Y'),
 (10,'HSP02',6,'Hospital Ambulance Maintenance','Admin','2018-03-19 00:00:00',NULL,NULL,'Y'),
 (11,'HSP03',6,'Hospital building Maintenance','Admin','2018-03-19 00:00:00',NULL,NULL,'Y'),
 (12,'SH01',9,'school mid-day meals','Admin','2018-03-19 00:00:00','raju','2018-04-13 12:42:49','Y'),
 (17,'FSH02',5,'Annual Maintenance','raju','2018-04-16 16:43:02',NULL,'2018-04-20 10:17:50','Y'),
 (20,'AS01',14,'Free Ambulance Service','Admin','2018-04-27 15:01:06',NULL,NULL,'Y');
/*!40000 ALTER TABLE `maintenance_type` ENABLE KEYS */;


--
-- Definition of table `navigation_master`
--

DROP TABLE IF EXISTS `navigation_master`;
CREATE TABLE `navigation_master` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(100) NOT NULL,
  `parent_or_child` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`nav_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_master`
--

/*!40000 ALTER TABLE `navigation_master` DISABLE KEYS */;
INSERT INTO `navigation_master` (`nav_id`,`nav_name`,`parent_or_child`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (1,'Country Master','Master','ADMIN','2018-04-07 15:12:17',NULL,NULL,'Y'),
 (2,'State Master','Master','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (3,'Campaign Master','Master','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (4,'Role Master','Master','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (5,'User Master','Master','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (6,'Role User Mapping','Master','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (7,'Role Screen Mapping','Master','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (8,'Payment Mode','Master','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (9,'Notification Master','Master','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (10,'Project Category','Project','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (11,'Maintenance Type','Project','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (12,'Maintenance SubType','Project','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (13,'Projects','Project','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (14,'Project Details','Project','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (15,'Add Donor','Donor','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (16,'Donor Details','Donor','ADMIN','2018-04-07 15:12:18',NULL,NULL,'Y'),
 (17,'Donations','Donor','ADMIN','2018-04-07 15:12:19',NULL,NULL,'Y'),
 (18,'General','Donor','ADMIN','2018-04-07 15:12:19',NULL,NULL,'Y'),
 (19,'Annual Maintenance','Donor','ADMIN','2018-04-07 15:12:19',NULL,NULL,'Y'),
 (20,'Building Donor','Donor','ADMIN','2018-04-07 15:12:19',NULL,NULL,'Y'),
 (21,'Facility Management','Donor','ADMIN','2018-04-07 15:12:19',NULL,NULL,'Y'),
 (22,'Land Donor','Donor','ADMIN','2018-04-07 15:12:19',NULL,NULL,'Y'),
 (23,'Search Popup','Donor','ADMIN','2018-04-07 15:12:19',NULL,NULL,'Y'),
 (24,'Send Notification','Donor','ADMIN','2018-04-07 15:12:19',NULL,NULL,'Y');
/*!40000 ALTER TABLE `navigation_master` ENABLE KEYS */;


--
-- Definition of table `notification_history`
--

DROP TABLE IF EXISTS `notification_history`;
CREATE TABLE `notification_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(10) NOT NULL,
  `type` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `sent_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`donor_id`),
  CONSTRAINT `FK_notification_history_1` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_history`
--

/*!40000 ALTER TABLE `notification_history` DISABLE KEYS */;
INSERT INTO `notification_history` (`id`,`donor_id`,`type`,`status`,`sent_date`) VALUES 
 (60,18,'Individual','Sent','2018-05-10 22:49:43');
/*!40000 ALTER TABLE `notification_history` ENABLE KEYS */;


--
-- Definition of table `notification_master`
--

DROP TABLE IF EXISTS `notification_master`;
CREATE TABLE `notification_master` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) DEFAULT NULL,
  `email_sub` varchar(100) DEFAULT NULL,
  `email_content` varchar(200) DEFAULT NULL,
  `sms_content` varchar(200) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  `status` varchar(45) NOT NULL,
  `donor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `Index_2` (`template_name`),
  KEY `Index_3` (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_master`
--

/*!40000 ALTER TABLE `notification_master` DISABLE KEYS */;
INSERT INTO `notification_master` (`template_id`,`template_name`,`email_sub`,`email_content`,`sms_content`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`,`status`,`donor_id`) VALUES 
 (2,'BirthDay','Happy BirthDay','Happy birthday dear, may this day comes back in your life for a thousand more years.','Happiness begins with your smile and let your smile change the world dear. Happy birthday to you. Have fun.','Admin','2018-03-28 10:47:04','raju','2018-04-27 14:52:27','Y','send',0),
 (4,'Anniversary','greetings','Wishing you all the happiness and love in the world and congratulations on your anniversary','Wishing you cheers and much happiness as you celebrate another year of your wonderful journey together','raju','2018-04-27 14:50:46',NULL,NULL,'Y','send',0),
 (8,'Project Report Submission Reminder','Greetings Donor','Report Submitted Successfully','Report Submitted Successfully','raju','2018-04-30 09:41:23','raju','2018-04-30 09:41:29','Y','send',0),
 (9,'General Donor Reminders','Greetings Donor','Your donation has been utilized this year for these activities and we want you to encourage us furthur','Your donation has been utilized this year for these activities and we want you to encourage us furthur','Admin','2018-05-05 07:41:55','Rahul','2018-05-05 07:41:55','Y','Send',0);
/*!40000 ALTER TABLE `notification_master` ENABLE KEYS */;


--
-- Definition of trigger `trg_notification_master`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_notification_master`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_notification_master` AFTER DELETE ON `notification_master` FOR EACH ROW begin

  insert into audit_seva.audit_notification_master (template_name, email_sub, email_content, sms_content, created_by, created_on, updated_by, updated_on, active)
  values(old.template_name, old.email_sub, old.email_content, old.sms_content, old.created_by, old.created_on, old.updated_by, now(), old.active);


end $$

DELIMITER ;

--
-- Definition of table `payment_master`
--

DROP TABLE IF EXISTS `payment_master`;
CREATE TABLE `payment_master` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_code` char(5) NOT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_code` (`payment_code`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_master`
--

/*!40000 ALTER TABLE `payment_master` DISABLE KEYS */;
INSERT INTO `payment_master` (`payment_id`,`payment_code`,`payment_mode`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (2,'PTM','PAYTM','Admin','2018-03-03 00:00:00','raju','2018-04-16 16:36:52','Y'),
 (3,'CHQ','CHEQUE','Admin','2018-03-03 00:00:00',NULL,NULL,'Y'),
 (4,'FND','FUND TRANSFER','ADMIN','2018-03-28 02:27:37','raju','2018-04-27 14:49:08','Y'),
 (5,'MOB','MOBIQUICK','ADMIN','2018-03-28 10:41:18',NULL,NULL,'Y'),
 (13,'CSH','CASH','raju','2018-04-16 16:36:17',NULL,NULL,'Y');
/*!40000 ALTER TABLE `payment_master` ENABLE KEYS */;


--
-- Definition of table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` char(6) NOT NULL,
  `project_name` varchar(100) NOT NULL,
  `country_code` int(11) NOT NULL,
  `state_code` int(11) NOT NULL,
  `address1` varchar(80) DEFAULT NULL,
  `address2` varchar(80) DEFAULT NULL,
  `address3` varchar(80) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` char(10) DEFAULT NULL,
  `report_subm_period` datetime DEFAULT NULL,
  `project_category_id` int(10) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_code` (`project_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `project_category_id` (`project_category_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  CONSTRAINT `project_ibfk_3` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`project_id`,`project_code`,`project_name`,`country_code`,`state_code`,`address1`,`address2`,`address3`,`city`,`postal_code`,`report_subm_period`,`project_category_id`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (9,'FSH03','Girls Hostel',103,31,'Pioneer Sudarshan Plaza','Nungambakam','Kodambakam','Chennai','600067','2018-06-30 00:00:00',NULL,'raju','2018-04-16 17:36:08',NULL,NULL,'Y'),
 (13,'AS01','Free Ambulance',103,31,'test','test',NULL,'Chennai','600001','2018-05-30 00:00:00',NULL,'Admin','2018-04-27 16:02:59',NULL,NULL,'Y');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;


--
-- Definition of table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
CREATE TABLE `project_category` (
  `project_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` char(6) NOT NULL,
  `project_category` varchar(50) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`project_category_id`),
  UNIQUE KEY `project_code` (`project_code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_category`
--

/*!40000 ALTER TABLE `project_category` DISABLE KEYS */;
INSERT INTO `project_category` (`project_category_id`,`project_code`,`project_category`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (5,'FSH','FREE STUDENT HOSTEL','Admin','2018-03-30 11:27:23',NULL,NULL,'Y'),
 (6,'HSP','HOSPITALS','Admin','2018-03-30 11:28:06',NULL,NULL,'Y'),
 (9,'SCH','SCHOOLS','raju','2018-04-13 12:01:29','raju','2018-04-16 16:41:40','N'),
 (11,'BNK','BANKS','raju','2018-04-16 16:40:48','raju','2018-04-16 16:41:31','Y'),
 (14,'AS','Ambulance Service','Admin','2018-04-27 14:58:35',NULL,NULL,'Y');
/*!40000 ALTER TABLE `project_category` ENABLE KEYS */;


--
-- Definition of table `project_dtl`
--

DROP TABLE IF EXISTS `project_dtl`;
CREATE TABLE `project_dtl` (
  `project_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_category_id` int(11) NOT NULL,
  `report_subm_comments` varchar(100) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`project_dtl_id`),
  KEY `project_id` (`project_id`),
  KEY `project_category_id` (`project_category_id`),
  CONSTRAINT `project_dtl_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `project_dtl_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_dtl`
--

/*!40000 ALTER TABLE `project_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_dtl` ENABLE KEYS */;


--
-- Definition of table `role_master`
--

DROP TABLE IF EXISTS `role_master`;
CREATE TABLE `role_master` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  `role_code` varchar(10) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_master`
--

/*!40000 ALTER TABLE `role_master` DISABLE KEYS */;
INSERT INTO `role_master` (`role_id`,`role`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`,`role_code`) VALUES 
 (1,'Admin User','Admin','2018-02-15 13:47:01','raju','2018-04-28 18:30:11','Y','AD'),
 (2,'Accountant','Admin','2018-03-28 02:43:28','raju','2018-04-29 18:18:27','Y','AC'),
 (3,'Campaigner','Admin','2018-03-28 10:29:25',NULL,NULL,'Y','CA'),
 (5,'Super Admin','Admin','2018-04-07 22:22:45','raju','2018-04-27 12:56:20','Y','SU');
/*!40000 ALTER TABLE `role_master` ENABLE KEYS */;


--
-- Definition of table `role_screen_mapping_master`
--

DROP TABLE IF EXISTS `role_screen_mapping_master`;
CREATE TABLE `role_screen_mapping_master` (
  `s_no` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `nav_id` int(10) unsigned NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`s_no`,`role_id`,`nav_id`) USING BTREE,
  KEY `role_id` (`role_id`),
  KEY `FK_role_screen_mapping_master_3` (`nav_id`) USING BTREE,
  CONSTRAINT `FK_role_screen_mapping_master_2` FOREIGN KEY (`nav_id`) REFERENCES `navigation_master` (`nav_id`),
  CONSTRAINT `role_screen_mapping_master_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_screen_mapping_master`
--

/*!40000 ALTER TABLE `role_screen_mapping_master` DISABLE KEYS */;
INSERT INTO `role_screen_mapping_master` (`s_no`,`role_id`,`nav_id`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (119,8,1,'raju','2018-04-12 16:22:41',NULL,NULL,'Y'),
 (120,8,3,'raju','2018-04-12 16:22:41',NULL,NULL,'Y'),
 (121,8,4,'raju','2018-04-12 16:22:41',NULL,NULL,'Y'),
 (122,1,1,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (123,1,2,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (124,1,3,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (125,1,4,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (126,1,5,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (127,1,6,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (128,1,7,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (129,1,8,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (130,1,9,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (131,1,10,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (132,1,11,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (133,1,12,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (134,1,13,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (135,1,14,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (136,1,15,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (137,1,16,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (138,1,17,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (139,1,18,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (140,1,19,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (141,1,20,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (142,1,21,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (143,1,22,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (144,1,23,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (145,1,24,'raju','2018-04-19 14:13:42',NULL,NULL,'Y'),
 (146,13,1,'raju','2018-04-28 17:06:37',NULL,NULL,'Y'),
 (147,13,2,'raju','2018-04-28 17:06:37',NULL,NULL,'Y'),
 (148,2,10,'raju','2018-04-29 18:16:30',NULL,NULL,'Y'),
 (149,2,11,'raju','2018-04-29 18:16:30',NULL,NULL,'Y'),
 (150,2,12,'raju','2018-04-29 18:16:30',NULL,NULL,'Y'),
 (151,2,13,'raju','2018-04-29 18:16:30',NULL,NULL,'Y'),
 (152,2,16,'raju','2018-04-29 18:16:30',NULL,NULL,'Y'),
 (153,2,23,'raju','2018-04-29 18:16:30',NULL,NULL,'Y'),
 (154,3,15,'raju','2018-04-29 18:17:06',NULL,NULL,'Y'),
 (155,3,17,'raju','2018-04-29 18:17:06',NULL,NULL,'Y'),
 (156,3,18,'raju','2018-04-29 18:17:06',NULL,NULL,'Y'),
 (157,3,19,'raju','2018-04-29 18:17:06',NULL,NULL,'Y'),
 (158,3,20,'raju','2018-04-29 18:17:06',NULL,NULL,'Y'),
 (159,3,21,'raju','2018-04-29 18:17:06',NULL,NULL,'Y'),
 (160,3,22,'raju','2018-04-29 18:17:06',NULL,NULL,'Y'),
 (161,3,23,'raju','2018-04-29 18:17:06',NULL,NULL,'Y'),
 (162,5,1,'raju','2018-04-29 18:20:09',NULL,NULL,'Y'),
 (163,5,2,'raju','2018-04-29 18:20:09',NULL,NULL,'Y');
/*!40000 ALTER TABLE `role_screen_mapping_master` ENABLE KEYS */;


--
-- Definition of table `role_user_mapping_master`
--

DROP TABLE IF EXISTS `role_user_mapping_master`;
CREATE TABLE `role_user_mapping_master` (
  `role_mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_code` int(11) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`role_mapping_id`),
  UNIQUE KEY `user_code` (`user_code`) USING BTREE,
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_user_mapping_master_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`role_id`),
  CONSTRAINT `role_user_mapping_master_ibfk_2` FOREIGN KEY (`user_code`) REFERENCES `user_master` (`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_user_mapping_master`
--

/*!40000 ALTER TABLE `role_user_mapping_master` DISABLE KEYS */;
INSERT INTO `role_user_mapping_master` (`role_mapping_id`,`role_id`,`user_code`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (1,1,1,'Admin','2018-02-15 13:47:01',NULL,NULL,'Y'),
 (3,2,2,'Admin','2018-04-04 10:19:34',NULL,NULL,'Y'),
 (4,3,8,'Admin','2018-04-04 10:19:34',NULL,NULL,'Y');
/*!40000 ALTER TABLE `role_user_mapping_master` ENABLE KEYS */;


--
-- Definition of table `sponsorship_history`
--

DROP TABLE IF EXISTS `sponsorship_history`;
CREATE TABLE `sponsorship_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(10) NOT NULL,
  `type` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `sent_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`donor_id`),
  CONSTRAINT `FK_sponsorship_history_1` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sponsorship_history`
--

/*!40000 ALTER TABLE `sponsorship_history` DISABLE KEYS */;
INSERT INTO `sponsorship_history` (`id`,`donor_id`,`type`,`status`,`sent_date`) VALUES 
 (3,27,'undefined','Sent','2018-05-10 23:06:29');
/*!40000 ALTER TABLE `sponsorship_history` ENABLE KEYS */;


--
-- Definition of table `state_master`
--

DROP TABLE IF EXISTS `state_master`;
CREATE TABLE `state_master` (
  `state_code` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `state_short_name` varchar(10) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`state_code`),
  UNIQUE KEY `state` (`state`),
  KEY `country_code` (`country_code`),
  CONSTRAINT `state_master_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_master`
--

/*!40000 ALTER TABLE `state_master` DISABLE KEYS */;
INSERT INTO `state_master` (`state_code`,`country_code`,`state`,`state_short_name`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (2,103,'Andhra Pradesh','AP','raju','2018-04-27 10:30:24',NULL,NULL,'Y'),
 (5,103,'Bihar','BR','Admin','2018-03-21 09:44:33',NULL,NULL,'N'),
 (7,103,'Chhattisgarh','CT','raju','2018-04-28 17:04:11',NULL,NULL,'Y'),
 (11,103,'Goa','GA','raju','2018-04-11 14:14:18',NULL,NULL,'Y'),
 (12,103,'Gujarat','GJ','raju','2018-04-27 12:43:01',NULL,NULL,'Y'),
 (16,103,'Jharkhand','JH','Admin','2018-03-28 10:19:50',NULL,NULL,'N'),
 (18,103,'Kerala','KL','raju','2018-04-27 12:42:57',NULL,NULL,'Y'),
 (28,103,'Punjab','PB','Admin','2018-03-28 10:19:33',NULL,NULL,'N'),
 (31,103,'Tamil Nadu','TN','raju','2018-04-16 15:44:53',NULL,NULL,'Y'),
 (35,103,'Uttarakhand,Uttaranchal','UT','raju','2018-04-28 18:25:30',NULL,NULL,'Y'),
 (49,14,'South Australia','SA','raju','2018-04-13 11:21:20',NULL,NULL,'N'),
 (203,235,'Alabama','AL','raju','2018-04-12 14:31:17',NULL,NULL,'Y'),
 (208,235,'Armed Forces, Americas','AA','raju','2018-04-30 11:50:36',NULL,NULL,'Y'),
 (249,235,'Texas','TX','raju','2018-04-30 09:29:35',NULL,NULL,'Y');
/*!40000 ALTER TABLE `state_master` ENABLE KEYS */;


--
-- Definition of table `state_master_lookup`
--

DROP TABLE IF EXISTS `state_master_lookup`;
CREATE TABLE `state_master_lookup` (
  `state_code` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `state_short_name` varchar(10) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`state_code`),
  KEY `country_code` (`country_code`),
  CONSTRAINT `FK_country_lookup_code` FOREIGN KEY (`country_code`) REFERENCES `country_master_lookup` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_master_lookup`
--

/*!40000 ALTER TABLE `state_master_lookup` DISABLE KEYS */;
INSERT INTO `state_master_lookup` (`state_code`,`country_code`,`state`,`state_short_name`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`) VALUES 
 (1,103,'Andaman and Nicobar Islands','AN','ADMIN','2018-03-08 15:25:17',NULL,NULL,'Y'),
 (2,103,'Andhra Pradesh','AP','ADMIN','2018-03-08 15:25:17',NULL,NULL,'Y'),
 (3,103,'Arunachal Pradesh','AR','ADMIN','2018-03-08 15:25:17',NULL,NULL,'Y'),
 (4,103,'Assam','AS','ADMIN','2018-03-08 15:25:17',NULL,NULL,'Y'),
 (5,103,'Bihar','BR','ADMIN','2018-03-08 15:25:17',NULL,NULL,'Y'),
 (6,103,'Chandigarh','CH','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (7,103,'Chhattisgarh','CT','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (8,103,'Dadra and Nagar Haveli','DN','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (9,103,'Daman and Diu','DD','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (10,103,'Delhi','DL','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (11,103,'Goa','GA','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (12,103,'Gujarat','GJ','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (13,103,'Haryana','HR','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (14,103,'Himachal Pradesh','HP','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (15,103,'Jammu and Kashmir','JK','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (16,103,'Jharkhand','JH','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (17,103,'Karnataka','KA','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (18,103,'Kerala','KL','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (19,103,'Lakshadweep','LD','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (20,103,'Madhya Pradesh','MP','ADMIN','2018-03-08 15:25:18',NULL,NULL,'Y'),
 (21,103,'Maharashtra','MH','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (22,103,'Manipur','MN','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (23,103,'Meghalaya','ML','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (24,103,'Mizoram','MZ','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (25,103,'Nagaland','NL','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (26,103,'Odisha, Orissa','OR','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (27,103,'Puducherry','PY','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (28,103,'Punjab','PB','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (29,103,'Rajasthan','RJ','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (30,103,'Sikkim','SK','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (31,103,'Tamil Nadu','TN','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (32,103,'Telangana','TG','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (33,103,'Tripura','TR','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (34,103,'Uttar Pradesh','UP','ADMIN','2018-03-08 15:25:19',NULL,NULL,'Y'),
 (35,103,'Uttarakhand,Uttaranchal','UT','ADMIN','2018-03-08 15:25:20',NULL,NULL,'Y'),
 (36,103,'West Bengal','WB','ADMIN','2018-03-08 15:25:20',NULL,NULL,'Y'),
 (37,168,'Azad Jammu and Kashmir','AJK','ADMIN','2018-03-08 15:25:28',NULL,NULL,'Y'),
 (38,168,'Balochistan','BA','ADMIN','2018-03-08 15:25:28',NULL,NULL,'Y'),
 (39,168,'Federally Administered Tribal Areas','FAT','ADMIN','2018-03-08 15:25:28',NULL,NULL,'Y'),
 (40,168,'Gilgit–Baltistan','GB','ADMIN','2018-03-08 15:25:28',NULL,NULL,'Y'),
 (41,168,'Islamabad Capital Territory','ICT','ADMIN','2018-03-08 15:25:28',NULL,NULL,'Y'),
 (42,168,'Khyber Pakhtunkhwa','KP','ADMIN','2018-03-08 15:25:28',NULL,NULL,'Y'),
 (43,168,'Punjab','PJ','ADMIN','2018-03-08 15:25:29',NULL,NULL,'Y'),
 (44,168,'Sindh','SD','ADMIN','2018-03-08 15:25:29',NULL,NULL,'Y'),
 (45,14,'Australian Capital Territory','ACT','ADMIN','2018-03-08 15:30:21',NULL,NULL,'Y'),
 (46,14,'New South Wales','NSW','ADMIN','2018-03-08 15:30:21',NULL,NULL,'Y'),
 (47,14,'Northern Territory','NT','ADMIN','2018-03-08 15:30:21',NULL,NULL,'Y'),
 (48,14,'Queensland','QLD','ADMIN','2018-03-08 15:30:21',NULL,NULL,'Y'),
 (49,14,'South Australia','SA','ADMIN','2018-03-08 15:30:21',NULL,NULL,'Y'),
 (50,14,'Tasmania','TAS','ADMIN','2018-03-08 15:30:21',NULL,NULL,'Y'),
 (51,14,'Victoria','VIC','ADMIN','2018-03-08 15:30:21',NULL,NULL,'Y'),
 (52,14,'Western Australia','WA','ADMIN','2018-03-08 15:30:21',NULL,NULL,'Y'),
 (53,31,'Acre','AC','ADMIN','2018-03-08 15:34:08',NULL,NULL,'Y'),
 (54,31,'Alagoas','AL','ADMIN','2018-03-08 15:34:08',NULL,NULL,'Y'),
 (55,31,'Amapá','AP','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (56,31,'Amazonas','AM','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (57,31,'Bahia','BA','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (58,31,'Ceará','CE','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (59,31,'Distrito Federal','DF','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (60,31,'Espírito Santo','ES','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (61,31,'Goias','GO','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (62,31,'Maranhao','MA','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (63,31,'Mato Grosso','MT','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (64,31,'Mato Grosso do Sul','MS','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (65,31,'Minas Gerais','MG','ADMIN','2018-03-08 15:34:09',NULL,NULL,'Y'),
 (66,31,'Pará','PA','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (67,31,'Paraíba','PB','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (68,31,'Paraná','PR','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (69,31,'Pernambuco','PE','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (70,31,'Piauí','PI','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (71,31,'Rio de Janeiro','RJ','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (72,31,'Rio Grande do Norte','RN','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (73,31,'Rio Grande do Sul','RS','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (74,31,'Rondônia','RO','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (75,31,'Roraima','RR','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (76,31,'Santa Catarina','SC','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (77,31,'Sao Paulo','SP','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (78,31,'Sergipe','SE','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (79,31,'Tocantins','TO','ADMIN','2018-03-08 15:34:10',NULL,NULL,'Y'),
 (80,40,'Alberta','AB','ADMIN','2018-03-08 15:36:03',NULL,NULL,'Y'),
 (81,40,'British Columbia','BC','ADMIN','2018-03-08 15:36:03',NULL,NULL,'Y'),
 (82,40,'Manitoba','MB','ADMIN','2018-03-08 15:36:03',NULL,NULL,'Y'),
 (83,40,'New Brunswick','NB','ADMIN','2018-03-08 15:36:03',NULL,NULL,'Y'),
 (84,40,'Newfoundland and Labrador','NL','ADMIN','2018-03-08 15:36:03',NULL,NULL,'Y'),
 (85,40,'Northwest Territories','NT','ADMIN','2018-03-08 15:36:03',NULL,NULL,'Y'),
 (86,40,'Nova Scotia','NS','ADMIN','2018-03-08 15:36:03',NULL,NULL,'Y'),
 (87,40,'Nunavut','NU','ADMIN','2018-03-08 15:36:03',NULL,NULL,'Y'),
 (88,40,'Ontario','ON','ADMIN','2018-03-08 15:36:04',NULL,NULL,'Y'),
 (89,40,'Prince Edward Island','PE','ADMIN','2018-03-08 15:36:04',NULL,NULL,'Y'),
 (90,40,'Quebec','QC','ADMIN','2018-03-08 15:36:04',NULL,NULL,'Y'),
 (91,40,'Saskatchewan','SK','ADMIN','2018-03-08 15:36:04',NULL,NULL,'Y'),
 (92,40,'Yukon','YT','ADMIN','2018-03-08 15:36:04',NULL,NULL,'Y'),
 (93,46,'Anhui','ANH','ADMIN','2018-03-08 15:38:16',NULL,NULL,'Y'),
 (94,46,'Beijing','BEI','ADMIN','2018-03-08 15:38:16',NULL,NULL,'Y'),
 (95,46,'Chongqing','CHO','ADMIN','2018-03-08 15:38:16',NULL,NULL,'Y'),
 (96,46,'Fujian','FUJ','ADMIN','2018-03-08 15:38:16',NULL,NULL,'Y'),
 (97,46,'Gansu','GAN','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (98,46,'Guangdong','GDG','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (99,46,'Guangxi','GXI','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (100,46,'Guizhou','GUI','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (101,46,'Hainan','HAI','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (102,46,'Hebei','HEB','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (103,46,'Heilongjiang','HEI','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (104,46,'Henan','HEN','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (105,46,'Hubei','HUB','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (106,46,'Hunan','HUN','ADMIN','2018-03-08 15:38:17',NULL,NULL,'Y'),
 (107,46,'Jiangsu','JSU','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (108,46,'Jiangxi','JXI','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (109,46,'Jilin','JIL','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (110,46,'Liaoning','LIA','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (111,46,'Nei Mongol','MON','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (112,46,'Ningxia','NIN','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (113,46,'Qinghai','QIN','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (114,46,'Shaanxi','SHA','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (115,46,'Shandong','SHD','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (116,46,'Shanghai','SHH','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (117,46,'Shanxi','SHX','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (118,46,'Sichuan','SIC','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (119,46,'Tianjin','TIA','ADMIN','2018-03-08 15:38:18',NULL,NULL,'Y'),
 (120,46,'Xinjiang','XIN','ADMIN','2018-03-08 15:38:19',NULL,NULL,'Y'),
 (121,46,'Xizang','XIZ','ADMIN','2018-03-08 15:38:19',NULL,NULL,'Y'),
 (122,46,'Yunnan','YUN','ADMIN','2018-03-08 15:38:19',NULL,NULL,'Y'),
 (123,46,'Zhejiang','ZHE','ADMIN','2018-03-08 15:38:19',NULL,NULL,'Y'),
 (124,112,'Aichi','AIC','ADMIN','2018-03-08 15:40:20',NULL,NULL,'Y'),
 (125,112,'Akita','AKT','ADMIN','2018-03-08 15:40:20',NULL,NULL,'Y'),
 (126,112,'Aomori','AMR','ADMIN','2018-03-08 15:40:20',NULL,NULL,'Y'),
 (127,112,'Chiba','CHB','ADMIN','2018-03-08 15:40:20',NULL,NULL,'Y'),
 (128,112,'Ehime','EHM','ADMIN','2018-03-08 15:40:20',NULL,NULL,'Y'),
 (129,112,'Fukui','FKI','ADMIN','2018-03-08 15:40:20',NULL,NULL,'Y'),
 (130,112,'Fukuoka','FKO','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (131,112,'Fukushima','FSM','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (132,112,'Gifu','GFU','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (133,112,'Gunma','GUM','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (134,112,'Hiroshima','HRS','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (135,112,'Hokkaido','HKD','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (136,112,'Hyogo','HYG','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (137,112,'Ibaraki','IBR','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (138,112,'Ishikawa','IKW','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (139,112,'Iwate','IWT','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (140,112,'Kagawa','KGW','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (141,112,'Kagoshima','KGS','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (142,112,'Kanagawa','KNG','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (143,112,'Kochi','KCH','ADMIN','2018-03-08 15:40:21',NULL,NULL,'Y'),
 (144,112,'Kumamoto','KMM','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (145,112,'Kyoto','KYT','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (146,112,'Mie','MIE','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (147,112,'Miyagi','MYG','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (148,112,'Miyazaki','MYZ','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (149,112,'Nagano','NGN','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (150,112,'Nagasaki','NGS','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (151,112,'Nara','NRA','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (152,112,'Niigata','NGT','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (153,112,'Oita','OTA','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (154,112,'Okayama','OKY','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (155,112,'Okinawa','OKN','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (156,112,'Osaka','OSK','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (157,112,'Saga','SAG','ADMIN','2018-03-08 15:40:22',NULL,NULL,'Y'),
 (158,112,'Saitama','STM','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (159,112,'Shiga','SHG','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (160,112,'Shimane','SMN','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (161,112,'Shizuoka','SZK','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (162,112,'Tochigi','TOC','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (163,112,'Tokushima','TKS','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (164,112,'Tokyo','TKY','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (165,112,'Tottori','TTR','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (166,112,'Toyama','TYM','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (167,112,'Wakayama','WKY','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (168,112,'Yamagata','YGT','ADMIN','2018-03-08 15:40:23',NULL,NULL,'Y'),
 (169,112,'Yamaguchi','YGC','ADMIN','2018-03-08 15:40:24',NULL,NULL,'Y'),
 (170,112,'Yamanashi','YNS','ADMIN','2018-03-08 15:40:24',NULL,NULL,'Y'),
 (171,143,'Aguascalientes','AGS','ADMIN','2018-03-08 15:42:08',NULL,NULL,'Y'),
 (172,143,'Baja California Norte','BCN','ADMIN','2018-03-08 15:42:08',NULL,NULL,'Y'),
 (173,143,'Baja California Sur','BCS','ADMIN','2018-03-08 15:42:08',NULL,NULL,'Y'),
 (174,143,'Campeche','CAMP','ADMIN','2018-03-08 15:42:08',NULL,NULL,'Y'),
 (175,143,'Chiapas','CHIS','ADMIN','2018-03-08 15:42:08',NULL,NULL,'Y'),
 (176,143,'Chihuahua','CHIH','ADMIN','2018-03-08 15:42:08',NULL,NULL,'Y'),
 (177,143,'Coahuila','COAH','ADMIN','2018-03-08 15:42:08',NULL,NULL,'Y'),
 (178,143,'Colima','COL','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (179,143,'Distrito Federal','DF','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (180,143,'Durango','DGO','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (181,143,'Guanajuato','GTO','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (182,143,'Guerrero','GRO','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (183,143,'Hidalgo','HGO','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (184,143,'Jalisco','JAL','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (185,143,'Mexico','EDO MEX','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (186,143,'Michoacan','MICH','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (187,143,'Morelos','MOR','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (188,143,'Nayarit','NAY','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (189,143,'Nuevo Leon','NL','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (190,143,'Oaxaca','OAX','ADMIN','2018-03-08 15:42:09',NULL,NULL,'Y'),
 (191,143,'Puebla','PUE','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (192,143,'Queretaro','QRO','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (193,143,'Quintana Roo','QROO','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (194,143,'San Luis Potosi','SLP','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (195,143,'Sinaloa','SIN','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (196,143,'Sonora','SON','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (197,143,'Tabasco','TAB','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (198,143,'Tamulipas','TAMP','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (199,143,'Tlaxcala','TLAX','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (200,143,'Veracruz','VER','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (201,143,'Yucatán','YUC','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (202,143,'Zacatecas','ZAC','ADMIN','2018-03-08 15:42:10',NULL,NULL,'Y'),
 (203,235,'Alabama','AL','ADMIN','2018-03-08 15:44:00',NULL,NULL,'Y'),
 (204,235,'Alaska','AK','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (205,235,'Arizona','AZ','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (206,235,'Arkansas','AR','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (207,235,'Armed Forces Pacific','AP','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (208,235,'Armed Forces, Americas','AA','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (209,235,'Armed Forces, Europe & Other','AE','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (210,235,'California','CA','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (211,235,'Colorado','CO','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (212,235,'Connecticut','CT','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (213,235,'Delaware','DE','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (214,235,'District Of Columbia','DC','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (215,235,'Florida','FL','ADMIN','2018-03-08 15:44:01',NULL,NULL,'Y'),
 (216,235,'Georgia','GA','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (217,235,'Hawaii','HI','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (218,235,'Idaho','ID','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (219,235,'Illinois','IL','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (220,235,'Indiana','IN','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (221,235,'Iowa','IA','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (222,235,'Kansas','KS','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (223,235,'Kentucky','KY','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (224,235,'Louisiana','LA','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (225,235,'Maine','ME','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (226,235,'Maryland','MD','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (227,235,'Massachusetts','MA','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (228,235,'Michigan','MI','ADMIN','2018-03-08 15:44:02',NULL,NULL,'Y'),
 (229,235,'Minnesota','MN','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (230,235,'Mississippi','MS','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (231,235,'Missouri','MO','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (232,235,'Montana','MT','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (233,235,'Nebraska','NE','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (234,235,'Nevada','NV','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (235,235,'New Hampshire','NH','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (236,235,'New Jersey','NJ','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (237,235,'New Mexico','NM','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (238,235,'New York','NY','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (239,235,'North Carolina','NC','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (240,235,'North Dakota','ND','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (241,235,'Ohio','OH','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (242,235,'Oklahoma','OK','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (243,235,'Oregon','OR','ADMIN','2018-03-08 15:44:03',NULL,NULL,'Y'),
 (244,235,'Pennsylvania','PA','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (245,235,'Rhode Island','RI','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (246,235,'South Carolina','SC','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (247,235,'South Dakota','SD','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (248,235,'Tennessee','TN','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (249,235,'Texas','TX','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (250,235,'Utah','UT','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (251,235,'Vermont','VT','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (252,235,'Virginia','VA','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (253,235,'Washington','WA','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (254,235,'West Virginia','WV','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (255,235,'Wisconsin','WI','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (256,235,'Wyoming','WY','ADMIN','2018-03-08 15:44:04',NULL,NULL,'Y'),
 (257,242,'Virgin Islands','VI','ADMIN','2018-03-08 15:46:10',NULL,NULL,'Y'),
 (258,205,'Eastern Cape','EC','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (259,205,'Free State','FS','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (260,205,'Gauteng','GT','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (261,205,'KwaZulu-Natal','KN','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (262,205,'Limpopo','LP','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (263,205,'Mpumalanga','MP','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (264,205,'North West','NW','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (265,205,'Northern Cape','NC','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (266,205,'Western Cape','WC','ADMIN','2018-03-08 15:56:46',NULL,NULL,'Y'),
 (267,19,'Barisal','BA','ADMIN','2018-03-08 16:06:17',NULL,NULL,'Y'),
 (268,19,'Chittagong','CH','ADMIN','2018-03-08 16:06:17',NULL,NULL,'Y'),
 (269,19,'Dhaka','DK','ADMIN','2018-03-08 16:06:17',NULL,NULL,'Y'),
 (270,19,'Khulna','KH','ADMIN','2018-03-08 16:06:17',NULL,NULL,'Y'),
 (271,19,'Mymensingh','MS','ADMIN','2018-03-08 16:06:17',NULL,NULL,'Y'),
 (272,19,'Rajshahi','RS','ADMIN','2018-03-08 16:06:17',NULL,NULL,'Y'),
 (273,19,'Rangpur','RG','ADMIN','2018-03-08 16:06:17',NULL,NULL,'Y'),
 (274,19,'Sylhet','SH','ADMIN','2018-03-08 16:06:17',NULL,NULL,'Y');
/*!40000 ALTER TABLE `state_master_lookup` ENABLE KEYS */;


--
-- Definition of table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
CREATE TABLE `user_master` (
  `user_code` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` int(11) NOT NULL,
  `state_code` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `anniversary` date DEFAULT NULL,
  `mobile_no` char(15) DEFAULT NULL,
  `landline_no` char(15) DEFAULT NULL,
  `email_id` varchar(100) NOT NULL,
  `address1` varchar(80) DEFAULT NULL,
  `address2` varchar(80) DEFAULT NULL,
  `address3` varchar(80) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` char(10) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` char(1) DEFAULT 'Y',
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_code`) USING BTREE,
  UNIQUE KEY `Index_5` (`email_id`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `first_name` (`first_name`),
  CONSTRAINT `FK_country_code` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `FK_state_code` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_master`
--

/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` (`user_code`,`country_code`,`state_code`,`first_name`,`last_name`,`dob`,`anniversary`,`mobile_no`,`landline_no`,`email_id`,`address1`,`address2`,`address3`,`city`,`postal_code`,`created_by`,`created_on`,`updated_by`,`updated_on`,`active`,`password`) VALUES 
 (1,1,1,'raju',NULL,NULL,NULL,'454323',NULL,'raj.gaya@gmail.com',NULL,NULL,NULL,NULL,NULL,'Admin','2018-02-15 13:47:01','raju','2018-04-27 13:44:03',NULL,'123456'),
 (2,2,2,'Ankit',NULL,NULL,NULL,'567564354',NULL,'ankit@gmail.com',NULL,NULL,NULL,NULL,NULL,'Admin','2018-02-15 13:47:01','raju','2018-04-27 13:45:03',NULL,'123456'),
 (8,103,5,'rahul','kumar','2018-03-03','2018-03-03','5465456','','rahu@gmail.com','chennai','kjkl','hfghfg','','','admin','2018-03-23 21:56:26',NULL,NULL,'Y','123456'),
 (11,103,16,'Rajesh','Ranjan','2018-03-03','2018-03-03','87878978',NULL,'kkr@gmail.com','gaya',NULL,NULL,'gaya','823001','admin','2018-03-28 10:34:34',NULL,NULL,'Y','123456'),
 (29,235,249,'Test','Test','2018-03-31',NULL,'234442121',NULL,'dfsadfdsf@gmil.com','Test',NULL,NULL,'Test','232344','raju','2018-04-30 09:40:08',NULL,NULL,'Y','123456');
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;


--
-- Definition of trigger `trg_user_master`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_user_master`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_user_master` AFTER DELETE ON `user_master` FOR EACH ROW begin

      insert into audit_seva.audit_user_master(user_code, country_code, state_code, first_name, last_name, dob, anniversary, mobile_no, landline_no, email_id, address1, address2, address3, city, postal_code, created_by, created_on, updated_by, updated_on, active, password)
      values(old.user_code, old.country_code, old.state_code, old.first_name, old.last_name, old.dob, old.anniversary, old.mobile_no, old.landline_no, old.email_id, old.address1, old.address2, old.address3, old.city, old.postal_code, old.created_by, old.created_on, old.updated_by, now(), old.active, old.password);


end $$

DELIMITER ;

--
-- Definition of function `splitAndTranslate`
--

DROP FUNCTION IF EXISTS `splitAndTranslate`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `splitAndTranslate`(str TEXT, delim VARCHAR(124)) RETURNS text CHARSET utf8
    DETERMINISTIC
BEGIN
DECLARE i INT DEFAULT 0; DECLARE ctr INT DEFAULT 0; DECLARE str_len INT; DECLARE out_str text DEFAULT ''; DECLARE temp_str text DEFAULT ''; DECLARE temp_val VARCHAR(255) DEFAULT ''; 
SET str_len=LENGTH(str); 

SET i = (LENGTH(str)-LENGTH(REPLACE(str, delim, '')))/LENGTH(delim) + 1; 

WHILE(ctr<i) DO
SET ctr=ctr+1; 

SET temp_str = REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, ctr), LENGTH(SUBSTRING_INDEX(str, delim,ctr - 1)) + 1), delim, '');

SELECT KPITypeName INTO temp_val FROM KpiTypes WHERE KpiTypeId=temp_str;

SET out_str=CONCAT(out_str, temp_val, ',');
END WHILE;

SET out_str=TRIM(TRAILING delim FROM out_str);
RETURN(out_str); 
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `strSplit`
--

DROP FUNCTION IF EXISTS `strSplit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `strSplit`(x varchar(255), delim varchar(12), pos int) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
BEGIN
   RETURN replace(substring(substring_index(x, delim, pos), 
      length(substring_index(x, delim, pos - 1)) + 1), delim, '');
	
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `new_procedure`
--

DROP PROCEDURE IF EXISTS `new_procedure`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(`json` JSON)
BEGIN
       DECLARE `json_items` BIGINT UNSIGNED DEFAULT JSON_LENGTH(`json`);
       DECLARE `_index` BIGINT UNSIGNED DEFAULT 0;

       DROP TEMPORARY TABLE IF EXISTS `jsonTemporary`;

       CREATE TEMPORARY TABLE IF NOT EXISTS `jsonTemporary`
         (`id` BIGINT UNSIGNED NOT NULL);


       WHILE `_index` < `json_items` DO

          select  (JSON_EXTRACT(`json`, CONCAT('$[', `_index`, ']')));
         SET `_index` := `_index` + 1;
       END WHILE;

     END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `split_string`
--

DROP PROCEDURE IF EXISTS `split_string`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `split_string`()
BEGIN


SET @valueList = 'aa,bb,cc,f,sduygfdctys,w,e,r,t,sd sdf sdf,yyy yyy yy,';



BEGIN
    set @valueList = @valueList + ',';
END;


set @pos = 0;
set @len = 0;

WHILE CHARINDEX(',', @valueList, @pos+1)>0 do
BEGIN
    set @len = 0;
    set @value = SUBSTRING(@valueList, @pos, @len);
  
        
    select @value;

    set @pos = 0;
    end;
END while;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_all_country`
--

DROP PROCEDURE IF EXISTS `sp_all_country`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_all_country`(IN `countryMaster` JSON, IN `statement` int)
BEGIN

      if statement=1 then

          select country_code,country,country_short_name
          from country_master_lookup;

      end if;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_all_state`
--

DROP PROCEDURE IF EXISTS `sp_all_state`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_all_state`(IN `stateMaster` JSON, IN `statement` int)
BEGIN

      if statement=1 then

          select state,state_short_name
          from state_master_lookup;

      end if;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_annual_maintenance`
--

DROP PROCEDURE IF EXISTS `sp_annual_maintenance`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_annual_maintenance`(IN annualMaintenance JSON,IN statement varchar(30), IN `donor_id` INT)
begin

		declare m_receipt_no int;
		declare i_donor_id int;
		declare i_donation_date date;
		declare i_amount decimal(18,2);
		declare i_payment_id int;
		declare i_cheque_no varchar(50);
		declare i_cheque_date char(25);
		declare i_bank varchar(150);
		declare i_project_category_id int;
		declare i_maintenance_id int;
		declare i_sub_type_id int;
		declare i_notes varchar(4000);
		declare i_upload_document varchar(4000);
		declare i_campaign_id int;
		declare i_credit_or_debit_card_no char(16);
		declare i_txn_id char(10);
		declare i_active char(1);
		declare i_created_by varchar(20);
		declare i_created_on datetime;
		declare i_updated_by varchar(20);
		declare i_updated_on datetime;
		declare i_country_code int;
		declare i_state_code int;
		declare i_start_date date;
		declare i_end_date date;
    declare i_project_id int;



				set i_donor_id = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.donor_id'));
				set i_donation_date = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.donation_date'));
        set i_project_id = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.project_id'));
				set i_amount = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.amount'));
				set i_payment_id = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.payment_id'));
				set i_cheque_no = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.cheque_no'));
				set i_cheque_date = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.cheque_date'));
				set i_bank = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.bank'));
				set i_project_category_id = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.project_category_id'));
				set i_maintenance_id = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.maintenance_id'));
				set i_sub_type_id = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.sub_type_id'));
				set i_notes = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.notes'));
				set i_upload_document = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.upload_document'));
				set i_campaign_id = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.campaign_id'));
				set i_credit_or_debit_card_no = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.credit_or_debit_card_no'));
				set i_txn_id = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.txn_id'));
				set i_active = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.active'));
				set i_created_by = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.created_by'));
				set i_created_on = now();
				set i_updated_by = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.updated_by'));
				set i_updated_on = now();
				set i_start_date = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.start_date'));
				set i_end_date = JSON_UNQUOTE(JSON_EXTRACT(annualMaintenance,'$.end_date'));
				set m_receipt_no =(select (ifnull(max(receipt_no),0)+1) as receipt_no from annual_maintenance);
        set i_donation_date=now();
        set @cheque_date=(select date_add(date_format(i_cheque_date,'%Y-%m-%d'),interval 1 day));


			if statement=1 then

				 insert into annual_maintenance(receipt_no,donor_id, donation_date, amount, payment_id, cheque_no, cheque_date, bank, project_category_id,
				 maintenance_id, sub_type_id, notes, upload_document, campaign_id, credit_or_debit_card_no, txn_id,project_id,start_date,end_date, created_by, created_on)
				 values(m_receipt_no,i_donor_id,i_donation_date,i_amount,i_payment_id,i_cheque_no,i_cheque_date,i_bank,i_project_category_id,i_maintenance_id,
				 i_sub_type_id,i_notes,i_upload_document,i_campaign_id,i_credit_or_debit_card_no,i_txn_id,i_project_id,i_start_date,i_end_date,i_created_by,i_created_on);

			elseif statement=2 then

				select country  from country_master;

			elseif statement=3 then
			
				select * from payment_master where active='Y';

			elseif statement=4 then

				select (ifnull(max(receipt_no),0)+1) as receipt_no from annual_maintenance;

      elseif statement=5 then

        select d.first_name,d.last_name,d.address1,d.address2,d.address3,d.city,c.country,s.state,d.postal_code,d.organization_name,d.donor_code,
        d.donor_type,d.email_id,d.mobile_no,d.donor_id,date_format(d.dob,'%Y-%m-%d') as dob,date_format(d.anniversary,'%Y-%m-%d') as anniversary,d.gender from donor d
        inner join country_master c on c.country_code=d.country_code
        inner join state_master s on s.state_code=d.state_code where d.donor_id=donor_id;

      elseif statement=6 then
          select d.first_name,d.last_name,d.address1,d.city,d.postal_code,c.country,s.state,a.receipt_no from annual_maintenance a
          inner join donor d on d.donor_id =a.donor_id
          inner join country_master c on c.country_code=d.country_code
          inner join state_master s on s.state_code=d.state_code where a.receipt_no=donor_id;

			end if;

	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_building_donor`
--

DROP PROCEDURE IF EXISTS `sp_building_donor`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_building_donor`(IN buildingDonor JSON,IN statement varchar(30), IN `donor_id` INT)
begin


			declare i_donor_id int;
			declare i_donation_date date;
			declare i_amount decimal(18,2);
			declare i_payment_id int;
			declare i_cheque_no varchar(50);
			declare i_cheque_date char(25);
			declare i_bank varchar(150);
			declare i_project_category_id int;
			declare i_maintenance_id int;
			declare i_sub_type_id int;
			declare i_notes varchar(4000);
			declare i_campaign_id int;
			declare i_full_building varchar(100);
			declare i_ground_floor varchar(100);
			declare i_first_floor varchar(100);
			declare i_second_floor varchar(100);
			declare i_third_floor varchar(100);
			declare i_location varchar(100);
			declare i_size varchar(50);
			declare i_year_of_construction varchar(30);
			declare i_year_of_completion varchar(30);
			declare i_upload_photo varchar(20);
			declare i_credit_or_debit_card_no char(16);
			declare i_txn_id char(10);
			declare i_created_on datetime;
			declare i_updated_on datetime;
			declare i_created_by varchar(20);
			declare i_updated_by varchar(20);
			declare m_receipt_no int;
      declare i_project_id int;
      declare m_donation_date date;


					set i_donor_id = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.donor_id'));
					
					set i_amount = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.amount'));
					set i_payment_id = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.payment_id'));
					set i_cheque_no = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.cheque_no'));
          set i_project_id = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.project_id'));
					set i_cheque_date = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.cheque_date'));
					set i_bank = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.bank'));
					set i_project_category_id = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.project_category_id'));
					set i_maintenance_id = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.maintenance_id'));
					set i_sub_type_id = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.sub_type_id'));
					set i_notes = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.notes'));
					set i_campaign_id = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.campaign_id'));
					set i_full_building = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.full_building'));
					set i_ground_floor = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.ground_floor'));
					set i_first_floor = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.first_floor'));
					set i_second_floor = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.second_floor'));
					set i_third_floor = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.third_floor'));
					set i_location = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.location'));
					set i_size = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.size'));
					set i_year_of_construction = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.year_of_construction'));
					set i_year_of_completion = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.year_of_completion'));
					set i_upload_photo = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.upload_photo'));
					set i_credit_or_debit_card_no = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.credit_or_debit_card_no'));
					set i_txn_id = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.txn_id'));
					set i_created_on = now();
					set i_updated_on = now();
					set i_updated_by = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.updated_by'));
					set i_created_by = JSON_UNQUOTE(JSON_EXTRACT(buildingDonor,'$.created_by'));
					set m_receipt_no = (select ifnull(max(receipt_no),0)+1 as receipt_no from building_donor);
          set m_donation_date=now();
          set @cheque_date=(select date_add(date_format(i_cheque_date,'%Y-%m-%d'),interval 1 day));

					if statement=1 then

						insert into building_donor(receipt_no,donor_id,donation_date,amount,payment_id,cheque_no,cheque_date,bank,project_category_id,
						maintenance_id,sub_type_id,notes,campaign_id,full_building,ground_floor,first_floor,second_floor,third_floor,location,size,year_of_construction,
						year_of_completion,upload_photo,credit_or_debit_card_no,txn_id,created_on,created_by,project_id) values(m_receipt_no,i_donor_id,m_donation_date,i_amount,i_payment_id,i_cheque_no,@cheque_date,i_bank,i_project_category_id,
						i_maintenance_id,i_sub_type_id,i_notes,i_campaign_id,i_full_building,i_ground_floor,i_first_floor,i_second_floor,i_third_floor,i_location,i_size,i_year_of_construction,
						i_year_of_completion,i_upload_photo,i_credit_or_debit_card_no,i_txn_id,i_created_on,i_created_by,i_project_id);

					elseif statement=2 then
					
						select * from payment_master where active='Y';

					elseif statement=3 then

						select ifnull(max(receipt_no),0)+1 as receipt_no from building_donor;

          elseif statement=4 then

            select d.first_name,d.last_name,d.address1,d.address2,d.address3,d.city,c.country,s.state,d.postal_code,d.organization_name,d.donor_code,
            d.donor_type,d.email_id,d.mobile_no,d.donor_id,date_format(d.dob,'%Y-%m-%d') as dob,date_format(d.anniversary,'%Y-%m-%d') as anniversary,d.gender from donor d
            inner join country_master c on c.country_code=d.country_code
            inner join state_master s on s.state_code=d.state_code where d.donor_id=donor_id;

          elseif statement=5 then

            select d.first_name,d.last_name,d.address1,d.city,d.postal_code,c.country,s.state,b.receipt_no from building_donor b
            inner join donor d on d.donor_id =b.donor_id
            inner join country_master c on c.country_code=d.country_code
            inner join state_master s on s.state_code=d.state_code where b.receipt_no=donor_id;

          end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_campaign_master`
--

DROP PROCEDURE IF EXISTS `sp_campaign_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campaign_master`(IN `campaignMaster` JSON, IN `statement` int, IN `cmp_code` INT)
begin

		declare i_country_code int;
		declare i_state_code int;
		declare i_campaign_name varchar(100);
		declare i_start_date varchar(50);
		declare i_end_date varchar(50);
		declare i_created_on datetime;
		declare i_updated_on datetime;
		declare i_created_by varchar(30);
		declare i_updated_by varchar(30);
		declare i_active char(1);
		declare i_notes varchar(4000);
		declare i_campaign_code varchar(20);

				set i_country_code =jSON_UNQUOTE( JSON_EXTRACT(campaignMaster,'$.country_code'));
				set i_campaign_code=jSON_UNQUOTE( JSON_EXTRACT(campaignMaster,'$.campaign_code'));
				set i_state_code = jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.state_code'));
				set i_campaign_name = jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.campaign_name'));
				set i_start_date = jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.start_date'));
				set i_end_date = jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.end_date'));
				set i_created_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.created_on'))as DATETIME);
				set i_updated_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.updated_on')) as DATETIME);
				set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.updated_by'));
				set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.created_by'));
				set i_active = jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.active'));
				set i_notes = jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.notes'));
				set @startdate=(select date_add(date_format(i_start_date,'%Y-%m-%d'),interval 1 day));
				set @enddate=(select date_add(date_format(i_end_date,'%Y-%m-%d'),interval 1 day));
				set i_campaign_code=(select concat('CMP',ifnull(max(campaign_id),0)+1) as campaign_code from campaign_master);


    	if statement=1 then

            insert into campaign_master(campaign_code,country_code,state_code,campaign_name,start_date,end_date,notes,created_by,created_on,active)
						values(i_campaign_code,i_country_code,i_state_code,i_campaign_name,@startdate,@enddate,i_notes,i_created_by,now(),i_active);

      	elseif statement=2 then

						select cc.campaign_id,cc.campaign_code,cc.campaign_name,c.country ,c.country_code,s.state,s.state_code,
						date_format(cc.start_date,'%Y-%m-%d') as start_date,date_format(cc.end_date,'%Y-%m-%d') as end_date, cc.active from campaign_master cc
						inner join country_master c on c.country_code=cc.country_code
						inner join state_master s on s.state_code=cc.state_code;

				elseif statement=3 THEN

						update campaign_master set campaign_code =i_campaign_code,country_code=i_country_code,state_code=i_state_code,
						campaign_name=i_campaign_name,start_date=i_start_date,end_date=i_end_date,
						notes=i_notes,updated_by=i_updated_by,updated_on=now(),active=i_active where campaign_id=cmp_code;

				elseif statement=4 THEN

						delete from campaign_master where campaign_id=cmp_code;


				elseif statement=5 then

							select campaign_id, campaign_code, country_code, state_code, campaign_name, date_format(start_date,'%Y-%m-%d') as start_date,
              date_format(end_date,'%Y-%m-%d') as end_date, notes,  created_by, created_on, updated_on, updated_by, active from campaign_master where campaign_id=cmp_code;

				elseif statement=6 then

						select campaign_id, campaign_code, country_code, state_code, campaign_name, date_format(start_date,'%Y-%m-%d') as start_date,
              date_format(end_date,'%Y-%m-%d') as end_date, notes,  created_by, created_on, updated_on, updated_by, active from campaign_master where active='Y';

				elseif statement=7 then

						select concat('CMP',ifnull(max(campaign_id),0)+1) as campaign_code from campaign_master;

				end if;

	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_change_password`
--

DROP PROCEDURE IF EXISTS `sp_change_password`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_change_password`(changePassword JSON,statement INT,log_his_id INT)
begin

		declare i_email_id varchar(100);
		declare i_updated_on datetime;
		declare i_updated_by varchar(30);

				set i_email_id=jSON_UNQUOTE(JSON_EXTRACT(changePassword,'$.email_id'));
				set i_updated_on=(select case when cast(ifnull(i_updated_on,'0000-00-00')as date) is null then '0000-00-00' else  cast(i_updated_on as date) end);
				set i_updated_by = JSON_UNQUOTE(JSON_EXTRACT(changePassword,'$.updated_by'));


					if (statement=1) then
					
							select r.role,usr.first_name,usr.email_id  from role_master r
							inner join role_user_mapping_master u on u.role_id=r.role_id
							inner join user_master usr on usr.user_code=u.user_code
							where usr.email_id=i_email_id and usr.active=upper('y');

					elseif (statement=2) then
					
							SELECT country_master.country, state_master.state,state_master.state_short_name FROM country_master
							INNER JOIN state_master ON country_master.country_code=state_master.country_code;

					end if;


end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_country_master`
--

DROP PROCEDURE IF EXISTS `sp_country_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_country_master`(IN `countryMaster` JSON, IN `statement` int,IN `cntry_code` INT)
begin

			declare i_country_code int;
			declare i_country_name varchar(100);
			declare i_short_name varchar(5);
			declare i_created_on datetime;
			declare i_updated_on datetime;
			declare i_created_by varchar(30);
			declare i_updated_by varchar(30);
			declare i_active char(1);


				set i_country_code = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.country_code'));
				set i_country_name = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.country'));
				set i_short_name = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.country_short_name'));
				set i_active = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.active'));
				set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.created_by'));
				set i_created_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.created_on'))as DATETIME);
				set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.updated_by'));
				set i_updated_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.updated_on')) as DATETIME);



					if statement= 1 then

						  insert into country_master(country_code,country, country_short_name, active, created_by, created_on )
						  values(i_country_code,i_country_name,i_short_name,i_active,i_created_by,now());
						  
					elseif statement= 2 then

						  select * from country_master;

					elseif statement= 3 THEN

						  select * from country_master WHERE country_code=cntry_code ;

					elseif statement= 4 THEN

						  update country_master set country=i_country_name,country_short_name=i_short_name,active=i_active,
						  updated_by=i_updated_by,updated_on=now() where country_code=cntry_code;

					elseif statement= 5 THEN

						  delete from country_master  WHERE country_code=cntry_code;


					end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_dashboard`
--

DROP PROCEDURE IF EXISTS `sp_dashboard`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dashboard`(dashboard json,IN statement varchar(30), IN i_donor_id INT )
BEGIN

			if statement= 'select' then

	 	   select d.donor_id,donor_code,first_name,donor_type,email_id,mobile_no,n.status,
					 case when date_format(anniversary,'%m')=date_format(dob,'%m') then 'BD/ANNI'
						  when  date_format(dob,'%m')=(select date_format(now(),'%m')) then 'BD'
						  when  date_format(anniversary,'%m')=(select date_format(now(),'%m')) then 'ANNI'
						 else null end as `Type`,
					 case when date_format(anniversary,'%m')=date_format(dob,'%m') then concat(concat(date_format(dob,'%d-%m'),'-',date_format(now(),'%Y')),'/',concat(date_format(anniversary,'%d-%m'),'-',date_format(now(),'%Y')))
						  when  date_format(dob,'%m')=(select date_format(now(),'%m')) then concat(date_format(dob,'%d-%m'),'-',date_format(now(),'%Y'))
						  when  date_format(anniversary,'%m')=(select date_format(now(),'%m')) then concat(date_format(anniversary,'%d-%m'),'-',date_format(now(),'%Y'))
						 else null end as dob
					 from donor d
           left outer join notification_history n on n.donor_id=d.donor_id and date_format(n.sent_date,'%Y-%m')=date_format(now(),'%Y-%m')
					 where date_format(dob,'%m')=(select date_format(now(),'%m'))
					 or date_format(anniversary,'%m')=(select date_format(now(),'%m'));

			elseif statement=2 then

					select d.donor_id,donor_code,first_name,donor_type,n.status,
					 case when date_format(anniversary,'%m')=date_format(dob,'%m') then 'BD/ANNI'
						  when  date_format(dob,'%m')=(select date_format(now(),'%m')) then 'BD'
						  when  date_format(anniversary,'%m')=(select date_format(now(),'%m')) then 'ANNI'
						 else null end as `Type`,
					 case when date_format(anniversary,'%m')=date_format(dob,'%m') then concat(concat(date_format(dob,'%d-%m'),'-',date_format(now(),'%Y')),'/',concat(date_format(anniversary,'%d-%m'),'-',date_format(now(),'%Y')))
						  when  date_format(dob,'%m')=(select date_format(now(),'%m')) then concat(date_format(dob,'%d-%m'),'-',date_format(now(),'%Y'))
						  when  date_format(anniversary,'%m')=(select date_format(now(),'%m')) then concat(date_format(anniversary,'%d-%m'),'-',date_format(now(),'%Y'))
						 else null end as dob
					 from donor d
           left outer join notification_history n on d.donor_id=n.donor_id
					where donor_id = i_donor_id;


			elseif statement='subType' then

		      select g.receipt_no,d.donor_id,d.donor_code,date_format(g.donation_date,'%d-%m-%Y') as donation_date,d.first_name,
          d.donor_type,m.sub_type,p.project_category,n.status
					from donor d
					inner join general_donation g on g.donor_id = d.donor_id
					inner join project_category p on p.project_category_id=g.project_category_id
					inner join maintenance_type m1 on m1.maintenance_id=g.maintenance_id
					inner join maintenance_sub_type m on m.sub_type_id=g.sub_type_id
					inner join country_master c on c.country_code=d.country_code
					inner join state_master s on s.state_code=d.state_code
          left outer join general_donor_history n on n.donor_id=d.donor_id and date_format(n.sent_date,'%Y-%m')=date_format(now(),'%Y-%m')
          where date_format(donation_date,'%Y-%m') in (select concat(date_format(date_add(current_date(),interval -1 year),'%Y'),'-',date_format(date_add(current_date(),interval 1 month),'%m')));

			elseif statement='subTypebyid' then

					select g.receipt_no,d.donor_id,d.donor_code,date_format(g.donation_date,'%d-%m-%Y') as donation_date,d.first_name,d.donor_type,m.sub_type,p.project_category,
					d.organization_name,c.country,s.state
					from donor d
					inner join general_donation g on g.donor_id = d.donor_id
					inner join project_category p on p.project_category_id=g.project_category_id
					inner join maintenance_type m1 on m1.maintenance_id=g.maintenance_id
					inner join maintenance_sub_type m on m.sub_type_id=g.sub_type_id
					inner join country_master c on c.country_code=d.country_code
					inner join state_master s on s.state_code=d.state_code
					where g.receipt_no=i_donor_id;

			elseif statement='annual' then

					  select d.donor_id,d.donor_code,d.first_name,p.project_category,
            date_format(a.donation_date,'%d-%m-%Y') as end_date,n.status
            from donor d
					  inner join annual_maintenance a on a.donor_id = d.donor_id
					  inner join project_category p on p.project_category_id=a.project_category_id
            left outer join sponsorship_history n on n.donor_id=d.donor_id and date_format(n.sent_date,'%Y-%m')=date_format(now(),'%Y-%m')
            where date_format(donation_date,'%Y-%m') in (select concat(date_format(date_add(current_date(),interval -1 year),'%Y'),'-',date_format(date_add(current_date(),interval 1 month),'%m')));

			elseif statement='annualbyid' then

					  select d.donor_id,d.donor_code,d.first_name,p.project_category,date_format(a.donation_date,'%d-%m-%Y') as end_date from donor d
					  inner join annual_maintenance a on a.donor_id = d.donor_id
					  inner join project_category p on p.project_category_id=a.project_category_id
					  where d.donor_id=i_donor_id;

			end if;

	END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_dashboard_project_sub_reminder`
--

DROP PROCEDURE IF EXISTS `sp_dashboard_project_sub_reminder`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dashboard_project_sub_reminder`(i_project_id int,statement int)
begin


			if(statement=1) then

				  SELECT p.project_id,p.project_code,p.project_name,p.city,s.state,date_format(report_subm_period,'%d-%m-%Y')report_subm_period FROM project p
          inner join state_master s on s.state_code=p.state_code
          where date_format(report_subm_period,'%m') in (select date_format(date_add(current_date(),interval 1 month),'%m'));
			elseif(statement=2) then

				  SELECT project_id, project_code, project_name, address1, address2, address3, city, postal_code, date_format(report_subm_period,'%d-%m-%Y')report_subm_period,s.state FROM project p
				  inner join state_master s on s.state_code=p.state_code
				  where p.project_id=i_project_id;

			end if;



	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_donation`
--

DROP PROCEDURE IF EXISTS `sp_donation`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donation`(i_donor_code int,statement varchar(10))
begin    





if(statement='select') then



      	SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'General' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,g.amount,date_format(g.donation_date,'%d-%m-%Y')  as `Date`
				FROM donor d
				inner join general_donation g on g.donor_id=d.donor_id
				
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'FSH' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,f.amount ,date_format(f.donation_date,'%d-%m-%Y')  as `Date`
				FROM donor d
				inner join fsh_donor f on f.donor_id=d.donor_id
			
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Annual' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,a.amount ,date_format(a.donation_date,'%d-%m-%Y')  as `Date`
				FROM donor d
				inner join annual_maintenance a on a.donor_id=d.donor_id
				
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Land' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,l.amount ,date_format(l.donation_date,'%d-%m-%Y')  as `Date`
				FROM donor d
				inner join land_donor l on l.donor_id=d.donor_id
				
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Building' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,b.amount ,date_format(b.donation_date,'%d-%m-%Y')  as `Date`
				FROM donor d
				inner join building_donor b on b.donor_id=d.donor_id
				
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Facility' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,m.amount ,date_format(m.donation_date,'%d-%m-%Y')  as `Date`
				FROM donor d
				inner join facility_management m on m.donor_id=d.donor_id;
				




		elseif(i_donor_code<>0 and i_mobile_no=0 and start_date<>'0000-00-00' and end_date<>'0000-00-00') then



				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'General' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,g.amount as 'Amt(Rs.)',g.donation_date as `Date`
				FROM donor d
				inner join general_donation g on g.donor_id=d.donor_id
				where  d.donor_id=i_donor_code and  g.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'FSH' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,f.amount as 'Amt(Rs.)',f.donation_date as `Date`
				FROM donor d
				inner join fsh_donor f on f.donor_id=d.donor_id
				where  d.donor_id=i_donor_code and  f.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Annual' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,a.amount as 'Amt(Rs.)',a.donation_date as `Date`
				FROM donor d
				inner join annual_maintenance a on a.donor_id=d.donor_id
				where  d.donor_id=i_donor_code and  a.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Land' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,l.amount as 'Amt(Rs.)',l.donation_date as `Date`
				FROM donor d
				inner join land_donor l on l.donor_id=d.donor_id
				where  d.donor_id=i_donor_code and  l.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Building' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,b.amount as 'Amt(Rs.)',b.donation_date as `Date`
				FROM donor d
				inner join building_donor b on b.donor_id=d.donor_id
				where  d.donor_id=i_donor_code and b.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Facility' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,m.amount as 'Amt(Rs.)',m.donation_date as `Date`
				FROM donor d
				inner join facility_management m on m.donor_id=d.donor_id
				where  d.donor_id=i_donor_code and m.donation_date between start_date and end_date;



		elseif(i_donor_code=0 and i_mobile_no=0 or i_donor_code<>0 or i_mobile_no<>0 and start_date='0000-00-00' or start_date<>'0000-00-00' and end_date='0000-00-00' or end_date<>'0000-00-00') then


				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'General' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,g.amount as 'Amt(Rs.)',g.donation_date as `Date`
				FROM donor d
				inner join general_donation g on g.donor_id=d.donor_id
				where  d.donor_id=i_donor_code or  d.mobile_no=i_mobile_no or  g.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'FSH' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,f.amount as 'Amt(Rs.)',f.donation_date as `Date`
				FROM donor d
				inner join fsh_donor f on f.donor_id=d.donor_id
				where  d.donor_id=i_donor_code or  d.mobile_no=i_mobile_no or f.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Annual' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,a.amount as 'Amt(Rs.)',a.donation_date as `Date`
				FROM donor d
				inner join annual_maintenance a on a.donor_id=d.donor_id
				where  d.donor_id=i_donor_code or  d.mobile_no=i_mobile_no or a.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Land' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,l.amount as 'Amt(Rs.)',l.donation_date as `Date`
				FROM donor d
				inner join land_donor l on l.donor_id=d.donor_id
				where  d.donor_id=i_donor_code or  d.mobile_no=i_mobile_no or l.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Building' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,b.amount as 'Amt(Rs.)',b.donation_date as `Date`
				FROM donor d
				inner join building_donor b on b.donor_id=d.donor_id
				where  d.donor_id=i_donor_code or  d.mobile_no=i_mobile_no or b.donation_date between start_date and end_date
				union all
				SELECT d.donor_code as Code,concat(d.first_name,' ',d.last_name)as Donor,'Facility' as 'Category','Donation' as Purpose,d.email_id as Contact,d.mobile_no as Phone,
				concat(d.address1,',',d.address2,',',d.address3,',',d.postal_code) as Address,m.amount as 'Amt(Rs.)',m.donation_date as `Date`
				FROM donor d
				inner join facility_management m on m.donor_id=d.donor_id
				where  d.donor_id=i_donor_code or  d.mobile_no=i_mobile_no or m.donation_date between start_date and end_date;


		end if;



	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_donor`
--

DROP PROCEDURE IF EXISTS `sp_donor`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donor`(IN `donor` JSON, IN `statement` int,IN `d_id` INT)
BEGIN

			declare i_donor_code char(6);
			declare i_country_code int;
			declare i_state_code int;
		  declare i_donor_type VARCHAR(10);
			declare i_organization_name varchar(100);
			declare i_first_name varchar(50);
			declare i_last_name varchar(50);
			declare i_city varchar(45);
			declare i_gender smallint(6);
			declare i_dob char(25);
			declare i_anniversary char(25);
			declare i_postal_code char(10);
			declare i_mobile_no varchar(15);
			declare i_landline_no varchar(15);
			declare i_fax_no varchar(15);
			declare i_email_id varchar(100);
			declare i_website varchar(50);
			declare i_address1 varchar(80);
			declare i_address2 varchar(80);
			declare i_address3 varchar(80);
			declare i_created_on datetime;
			declare i_updated_on datetime;
			declare i_created_by varchar(30);
			declare i_updated_by varchar(30);
			declare i_active char(1);
      declare i_donor_sub_type varchar(25);
      declare i_contact_person varchar(50);

					set i_donor_code = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.donor_code'));
					set i_country_code = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.country_code'));
					set i_state_code = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.state_code'));
					set i_donor_type=jSON_UNQUOTE(JSON_EXTRACT(donor,'$.donor_type'));
          set i_donor_sub_type=jSON_UNQUOTE(JSON_EXTRACT(donor,'$.donor_sub_type'));
					set i_organization_name=jSON_UNQUOTE(JSON_EXTRACT(donor,'$.organization_name'));
					set i_first_name = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.first_name'));
          set i_contact_person = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.contact_person'));
					set i_last_name = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.last_name'));
					set i_city = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.city'));
					set i_gender = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.gender'));
					set i_dob = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.dob'));
					set i_anniversary = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.anniversary'));
					set i_postal_code = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.postal_code'));
					set i_mobile_no = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.mobile_no'));
					set i_landline_no = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.landline_no'));
					set i_fax_no = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.fax_no'));
					set i_email_id = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.email_id'));
					set i_website = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.website'));
					set i_address1 = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.address1'));
					set i_address2 = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.address2'));
					set i_address3 = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.address3'));
					set i_active = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.active'));
					set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.created_by'));
					set i_created_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(donor,'$.created_on'))as DATETIME);
					set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(donor,'$.updated_by'));
					set i_updated_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(donor,'$.updated_on')) as DATETIME);
					set @dob=(select date_add(date_format(i_dob,'%Y-%m-%d'),interval 1 day));
					set @anniversary=(select date_add(date_format(i_anniversary,'%Y-%m-%d'),interval 1 day));
					


	    if (statement in (12,1) and i_donor_type='Individual' and i_donor_sub_type is null) then


                set @donor_id = (select max(ifnull(substring_index(donor_code,'I',-1),0)+1) as donor_id from donor where donor_code like 'I%');


                  if(@donor_id is null and i_donor_type='Individual')then

                    set @i_donor_id= (select concat('I',ifnull(@donor_id,0)+1));


                  elseif(@donor_id is not null and i_donor_type='Individual' and i_donor_sub_type is null ) then

                  set @i_donor_id = (SELECT concat('I',max(SUBSTRING_INDEX(donor_code,'I',-1))+1)as donor_id from donor where donor_code like 'I%');

                 end if;

        end if;

        if (statement in (12,1) and i_donor_type='Foreigners' and i_donor_sub_type is null) then


                set @donor_id = (select max(ifnull(substring_index(donor_code,'F',-1),0)+1) as donor_id from donor where donor_code like 'F%');


                  if(@donor_id is null and i_donor_type='Foreigners')then

                    set @i_donor_id= (select concat('F',ifnull(@donor_id,0)+1));


                  elseif(@donor_id is not null and i_donor_type='Foreigners' and i_donor_sub_type is null) then

                  set @i_donor_id = (SELECT concat('F',max(SUBSTRING_INDEX(donor_code,'F',-1))+1)as donor_id from donor where donor_code like 'F%');


                 end if;

          end if;

          if (statement in (12,1) and i_donor_type='Corporate' and i_donor_sub_type='Public Sector') then


                set @donor_id = (select max(ifnull(substring_index(donor_code,'CP',-1),0)+1) as donor_id from donor where donor_code like 'CP%');


                  if(@donor_id is null and i_donor_type='Corporate' and i_donor_sub_type='Public Sector')then

                    set @i_donor_id= (select concat('CP',ifnull(@donor_id,0)+1));


                  elseif(@donor_id is not null and i_donor_type='Corporate' and i_donor_sub_type='Public Sector') then

                  set @i_donor_id = (SELECT concat('CP',max(SUBSTRING_INDEX(donor_code,'CP',-1))+1)as donor_id from donor where donor_code like 'CP%');


                  end if;

          end if;


         if (statement in (12,1) and i_donor_type='Corporate' and i_donor_sub_type='Bank') then


                set @donor_id = (select max(ifnull(substring_index(donor_code,'CB',-1),0)+1) as donor_id from donor where donor_code like 'CB%');


                  if(@donor_id is null and i_donor_type='Corporate' and i_donor_sub_type='Bank')then

                    set @i_donor_id= (select concat('CB',ifnull(@donor_id,0)+1));


                  elseif(@donor_id is not null and i_donor_type='Corporate' and i_donor_sub_type='Bank') then

                  set @i_donor_id = (SELECT concat('CB',max(SUBSTRING_INDEX(donor_code,'CB',-1))+1)as donor_id from donor where donor_code like 'CB%');


                  end if;

          end if;

            if (statement in (12,1) and i_donor_type='Corporate' and i_donor_sub_type='Private Sector') then


                set @donor_id = (select max(ifnull(substring_index(donor_code,'CPR',-1),0)+1) as donor_id from donor where donor_code like 'CPR%');


                  if(@donor_id is null and i_donor_type='Corporate' and i_donor_sub_type='Private Sector')then

                    set @i_donor_id= (select concat('CPR',ifnull(@donor_id,0)+1));


                  elseif(@donor_id is not null and i_donor_type='Corporate' and i_donor_sub_type='Private Sector') then

                  set @i_donor_id = (SELECT concat('CPR',max(SUBSTRING_INDEX(donor_code,'CPR',-1))+1)as donor_id from donor where donor_code like 'CPR%');


                  end if;

          end if;




					if statement=1 then
					
							  insert into donor(donor_code,country_code,state_code,donor_type,donor_sub_type,organization_name,contact_person,first_name,last_name,
							  city,gender,dob,anniversary,postal_code,mobile_no,landline_no,fax_no,email_id,
							  website,address1,address2,address3,created_by,created_on,active)
							  values(@i_donor_id,i_country_code,i_state_code,i_donor_type,i_donor_sub_type,i_organization_name,i_contact_person,i_first_name,i_last_name,i_city,i_gender,@dob,@anniversary,i_postal_code,i_mobile_no,
							  i_landline_no,i_fax_no,i_email_id,i_website,i_address1,i_address2,i_address3,i_created_by,now(),i_active);

					elseif statement=2 then

							  

							  select d.*,s.state,c.country,s.state_code,c.country_code from donor d
							  inner join country_master c on c.country_code=d.country_code
							  inner join state_master s on s.state_code=d.state_code where d.active='Y';


					elseif statement=3 then

							select d.first_name,d.last_name,d.address1,d.address2,d.address3,d.city,c.country,s.state,d.postal_code,d.organization_name,d.donor_code,
							d.donor_type,d.email_id,d.mobile_no,d.donor_id,date_format(d.dob,'%Y-%m-%d') as dob,date_format(d.anniversary,'%Y-%m-%d') as anniversary,d.gender from donor d
							inner join country_master c on c.country_code=d.country_code
							inner join state_master s on s.state_code=d.state_code where donor_id=d_id;

					elseif statement =4 then

						  update donor
						  set
						  first_name=i_first_name,
						  mobile_no=i_mobile_no,
						  email_id=i_email_id,
						  updated_by=i_updated_by,
						  updated_on=now()
						  where donor_id=d_id;

					elseif statement=5 then
					
						  delete from donor where donor_id=d_id;

					elseif statement=6 then
					
						  select first_name,donor_code, donor_type,email_id,mobile_no 
						  from donor 
						  where mobile_no=i_mobile_no or landline_no=i_landline_no;
						  
					elseif statement=7 then
					
						   select first_name,donor_code, donor_type,email_id,mobile_no 
						   from donor 
						   where donor_code=d_id;
						   
					elseif statement=8 then

							select first_name,donor_code, donor_type,email_id,mobile_no 
							from donor 
							where city=i_city;
							
					elseif statement=9 then
					
							select d.first_name,d.donor_code, d.donor_type,d.email_id,d.mobile_no,s.state,c.country 
							from donor d
							inner join country_master c on c.country_code=d.country_code 
							where d.country_code=i_country_code;

					elseif statement=10 then
					
							select d.first_name,d.donor_code, d.donor_type,d.donor_sub_type,d.contact_person,d.email_id,d.mobile_no,s.state,c.country,s.state_code,c.country_code
							from donor d
							inner join country_master c on c.country_code=d.country_code
							inner join state_master s on s.state_code=d.state_code ;
							
					elseif statement=11 then
					
							select state,state_code from state_master 
							where country_code=d_id;

          end if;



				if statement=13 then
select d.city,d.mobile_no,c.country,s.state,l.year_of_donation,p.project_name from donor d
inner join country_master c on c.country_code=d.country_code
inner join state_master s on s.state_code=d.state_code
inner join land_donor l on l.donor_id=d.donor_id
inner join project p on p.project_id=l.project_id where l.donor_id=d_id;

end if;

if statement=14 then
select p.project_name,s.sub_type,d.donor_code from general_donation g
inner join project p on g.project_id=p.project_id
inner join maintenance_sub_type s on s.sub_type_id=g.sub_type_id
inner join donor d on d.donor_id=g.donor_id where g.donor_id=d_id;


end if;
if statement=15 then
select p.project_name,s.sub_type,d.donor_code,a.start_date,a.end_date from annual_maintenance a
inner join project p on a.project_id=p.project_id
inner join maintenance_sub_type s on s.sub_type_id=a.sub_type_id
inner join donor d on d.donor_id=a.donor_id where a.donor_id=d_id;


end if;
if statement=16 then
select p.project_name,s.sub_type,d.donor_code,f.donation_date from facility_management f
inner join project p on f.project_id=p.project_id
inner join maintenance_sub_type s on s.sub_type_id=f.sub_type_id
inner join donor d on d.donor_id=f.donor_id where f.donor_id=d_id;


end if;
if statement=17 then
 
select p.project_name,d.donor_code,d.mobile_no,c.country,s.state,b.year_of_construction from building_donor b
inner join project p on p.project_id=b.project_id
inner join donor d on d.donor_id=b.donor_id
inner join country_master c on c.country_code=d.country_code
inner join state_master s on s.state_code=d.state_code
where b.donor_id=d_id;

end if;
if statement=18 then
select template_name,email_sub from notification_master;
end if;

	END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_facility_management`
--

DROP PROCEDURE IF EXISTS `sp_facility_management`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_facility_management`(IN facilityManagement JSON,IN statement varchar(30), IN `donor_id` INT)
begin

			declare m_receipt_no int;
			declare i_donor_id int;
			declare i_donation_date date;
			declare i_amount decimal(18,2);
			declare i_payment_id int;
			declare i_cheque_no varchar(50);
			declare i_cheque_date date;
			declare i_bank varchar(150);
			declare i_project_category_id int;
			declare i_maintenance_id int;
			declare i_sub_type_id int;
			declare i_notes varchar(4000);
			declare i_campaign_id int;
			declare i_created_by varchar(20);
			declare i_created_on datetime;
			declare i_updated_by varchar(20);
			declare i_updated_on datetime;
      declare i_project_id int;


				set i_donor_id = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.donor_id'));
				set i_donation_date = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.donation_date'));
				set i_amount = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.amount'));
				set i_payment_id = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.payment_id'));
				set i_cheque_no = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.cheque_no'));
				set i_cheque_date = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.cheque_date'));
				set i_bank = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.bank'));
				set i_project_category_id = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.project_category_id'));
				set i_maintenance_id = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.maintenance_id'));
				set i_sub_type_id = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.sub_type_id'));
				set i_notes = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.notes'));
				set i_campaign_id = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.campaign_id'));
				set i_created_by = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.created_by'));
				set i_created_on = now();
				set i_updated_by = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.updated_by'));
				set i_updated_on = now();
				set m_receipt_no=(select ifnull(max(receipt_no),0)+1 as receipt_no from facility_management);
        set @cheque_date=(select date_add(date_format(i_cheque_date,'%Y-%m-%d'),interval 1 day));
        set i_project_id = JSON_UNQUOTE(JSON_EXTRACT(facilityManagement,'$.project_id'));
        set i_donation_date=now();

					if statement=1 then

						 insert into facility_management(receipt_no,donor_id, donation_date, amount, payment_id, cheque_no, cheque_date, bank, project_category_id,
						 maintenance_id, sub_type_id, notes, campaign_id,  created_by, created_on,project_id)
						 values(m_receipt_no,i_donor_id,i_donation_date,i_amount,i_payment_id,i_cheque_no,@cheque_date,i_bank,i_project_category_id,i_maintenance_id,
						 i_sub_type_id,i_notes,i_campaign_id,i_created_by,i_created_on,i_project_id);

					elseif statement=11 then

						select ifnull(max(receipt_no),0)+1 as receipt_no from facility_management;

          elseif statement=5 then

            select d.first_name,d.last_name,d.address1,d.address2,d.address3,d.city,c.country,s.state,d.postal_code,d.organization_name,d.donor_code,
            d.donor_type,d.email_id,d.mobile_no,d.donor_id,date_format(d.dob,'%Y-%m-%d') as dob,date_format(d.anniversary,'%Y-%m-%d') as anniversary,d.gender from donor d
            inner join country_master c on c.country_code=d.country_code
            inner join state_master s on s.state_code=d.state_code where d.donor_id=donor_id;

          elseif statement=6 then

            select d.first_name,d.last_name,d.address1,d.city,d.postal_code,c.country,s.state,f.receipt_no from facility_management f
            inner join donor d on d.donor_id =f.donor_id
            inner join country_master c on c.country_code=d.country_code
            inner join state_master s on s.state_code=d.state_code where f.receipt_no=donor_id;

					end if;

	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_fsh_donor`
--

DROP PROCEDURE IF EXISTS `sp_fsh_donor`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fsh_donor`(IN `fsh_Donor` JSON, IN `statement` int,
IN `rcpt_no` INT)
begin

declare i_co_ordinator varchar(75);
declare i_warden varchar(75);
declare i_no_of_student int(10);
declare i_year char(10);
declare i_fsh_contact_number varchar(15);
declare i_active char(1);
declare i_donation_date char(25);
declare i_amount char(20);
declare i_created_on datetime;
declare i_updated_on datetime;
declare i_created_by varchar(45);
declare i_updated_by varchar(45);
declare i_donor_id int;
declare i_project_category_id int;

set i_donor_id = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.donor_id'));
set i_project_category_id = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.project_category_id'));
set i_co_ordinator = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.co_ordinator'));
set i_warden = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.warden'));
set i_no_of_student = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.no_of_student'));
set i_year = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.year'));
set i_fsh_contact_number = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.fsh_contact_number'));
set i_active = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.active'));
set i_donation_date = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.donation_date'));
set i_amount = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.amount'));
set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.created_by'));
set i_created_on = now();
set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(fsh_Donor,'$.updated_by'));
set i_updated_on = now();

set @startdate=(select date_format(i_donation_date,'%Y-%m-%d'));


if statement= 1 then

insert into fsh_donor(donor_id,co_ordinator,warden,no_of_student,year,fsh_contact_number,active,project_category_id,donation_date,amount, created_by, created_on )
values(i_donor_id,i_co_ordinator,i_warden,i_no_of_student,i_year,i_fsh_contact_number,i_active,i_project_category_id,@startdate,i_amount,i_created_by,i_created_on);

elseif statement= 2 then

select * from fsh_Donor;

elseif statement= 3 THEN

SELECT * from fsh_Donor WHERE receipt_no=rcpt_no;

elseif statement= 4 THEN

update fsh_Donor set co_ordinator=i_co_ordinator,warden=i_warden,no_of_student=i_no_of_student,`year`=i_year,fsh_contact_number=i_fsh_contact_number,
active=i_active,donation_date=@startdate,amount=i_amount,updated_by=i_updated_by,updated_on=i_updated_on where receipt_no=rcpt_no;

elseif statement= 5 THEN

update fsh_Donor set active= 'N' WHERE receipt_no=rcpt_no;

end if;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_general_donation`
--

DROP PROCEDURE IF EXISTS `sp_general_donation`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_general_donation`(IN generalDonation JSON,IN statement varchar(30), IN `donor_id` INT)
BEGIN

			declare i_receipt_no int;
			declare i_donor_id int;
			declare i_country_code int;
			declare i_state_code int;
			declare i_donation_date date;
			declare i_amount decimal(18,2);
			declare i_payment_id int;
			declare i_cheque_no varchar(50);
			declare i_cheque_date char(25);
			declare i_bank varchar(150);
			declare i_project_category_id int;
			declare i_maintenance_id int;
			declare i_sub_type_id int;
			declare i_notes varchar(4000);
			declare i_campaign_id int;
			declare i_credit_or_debit_card_no char(16);
			declare i_txn_id char(10);
			declare i_active char(1);
			declare i_created_on datetime;
			declare i_updated_on datetime;
			declare i_created_by varchar(20);
			declare i_updated_by varchar(20);
			declare i_project_id int;


				set i_receipt_no = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.receipt_no'));
				set i_donor_id = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.donor_id'));
				set i_donation_date = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.donation_date'));
				set i_amount = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.amount'));
				set i_payment_id = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.payment_id'));
				set i_cheque_no = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.cheque_no'));
				set i_cheque_date = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.cheque_date'));
				set i_bank = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.bank'));
				set i_project_category_id = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.project_category_id'));
				set i_maintenance_id = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.maintenance_id'));
				set i_sub_type_id = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.sub_type_id'));
				set i_notes = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.notes'));
				set i_campaign_id = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.campaign_id'));
				set i_credit_or_debit_card_no = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.credit_or_debit_card_no'));
				set i_txn_id = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.txn_id'));
				set i_active = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.active'));
				set i_created_on = now();
				set i_updated_on = now();
				set i_updated_by = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.updated_by'));
				set i_created_by = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.created_by'));
				set i_project_id = JSON_UNQUOTE(JSON_EXTRACT(generalDonation,'$.project_id'));
				set i_receipt_no=(select (ifnull(max(receipt_no),0)+1) as receipt_no from general_donation);
        set i_donation_date=now();
        set @cheque_date=(select date_add(date_format(i_cheque_date,'%Y-%m-%d'),interval 1 day));
				

					if statement=1 then
					
							insert into general_donation(receipt_no,donor_id, donation_date, amount, payment_id, cheque_no, cheque_date, bank,
							project_category_id, maintenance_id, sub_type_id, notes, campaign_id, credit_or_debit_card_no,
							txn_id, created_by, created_on,project_id)values(i_receipt_no,i_donor_id,i_donation_date,i_amount,i_payment_id,i_cheque_no,@cheque_date,i_bank,i_project_category_id,i_maintenance_id,
							i_sub_type_id,i_notes,i_campaign_id,i_credit_or_debit_card_no,i_txn_id,i_created_by,i_created_on,i_project_id);

					 elseif statement=2 then

							select country  from country_master;

					elseif statement=3 then
					
							select * from payment_master where active='Y';

					elseif statement=4 then

							select (ifnull(max(receipt_no),0)+1) as receipt_no from general_donation;

          elseif statement=5 then

              select d.first_name,d.last_name,d.address1,d.address2,d.address3,d.city,c.country,s.state,d.postal_code,d.organization_name,d.donor_code,
              d.donor_type,d.email_id,d.mobile_no,d.donor_id,date_format(d.dob,'%Y-%m-%d') as dob,date_format(d.anniversary,'%Y-%m-%d') as anniversary,d.gender from donor d
              inner join country_master c on c.country_code=d.country_code
              inner join state_master s on s.state_code=d.state_code where d.donor_id=donor_id;

          elseif statement=6 then

              select d.first_name,d.last_name,d.address1,d.city,d.postal_code,c.country,s.state,g.receipt_no from general_donation g
              inner join donor d on d.donor_id =g.donor_id
              inner join country_master c on c.country_code=d.country_code
              inner join state_master s on s.state_code=d.state_code where g.receipt_no=donor_id;

					end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_general_donor_history`
--

DROP PROCEDURE IF EXISTS `sp_general_donor_history`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_general_donor_history`(IN `general_donor_history` JSON)
begin


      declare i_donor_id varchar(45);
      declare i_status varchar(45);
      declare i_type varchar(45);


        set i_donor_id = jSON_UNQUOTE(JSON_EXTRACT(general_donor_history,'$.donor_id'));
        set i_status = jSON_UNQUOTE(JSON_EXTRACT(general_donor_history,'$.status'));
        set i_type = jSON_UNQUOTE(JSON_EXTRACT(general_donor_history,'$.type'));


              delete from general_donor_history where  donor_id=i_donor_id;

						  insert into general_donor_history(donor_id,type,status,Sent_date)
						  values(i_donor_id,i_type,i_status,now());




	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_land_donor`
--

DROP PROCEDURE IF EXISTS `sp_land_donor`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_land_donor`(IN landDonor JSON,IN statement varchar(30), IN `donor_id` INT)
BEGIN
	
			declare m_receipt_no char(20);
			declare i_donor_id int;
			declare i_country_code int;
			declare i_state_code int;
			declare i_donation_date date;
			declare i_amount decimal(18,2);
			declare i_payment_id int;
			declare i_cheque_no varchar(50);
			declare i_cheque_date char(25);
			declare i_bank varchar(150);
			declare i_project_category_id int;
			declare i_maintenance_id int;
			declare i_sub_type_id int;
			declare i_notes varchar(4000);
			declare i_campaign_id int;
			declare i_donation varchar(50);
			declare i_leased varchar(50);
			declare i_build_up_area varchar(50);
			declare i_vacant_area varchar(50);
			declare i_location varchar(50);
			declare i_year_of_donation varchar(30);
			declare  i_leased_period varchar(30);
			declare i_credit_or_debit_card_no char(16);
			declare i_txn_id char(10);
			declare i_active char(1);
			declare i_created_on datetime;
			declare i_updated_on datetime;
			declare i_created_by varchar(20);
			declare i_updated_by varchar(20);
			declare i_project_id int;


				set i_donor_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.donor_id'));
				set i_donation_date = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.donation_date'));
				set i_amount = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.amount'));
				set i_payment_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.payment_id'));
				set i_cheque_no = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.cheque_no'));
				set i_cheque_date = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.cheque_date'));
				set i_bank = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.bank'));
				set i_project_category_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.project_category_id'));
				set i_maintenance_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.maintenance_id'));
				set i_sub_type_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.sub_type_id'));
				set i_notes = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.notes'));
				set i_campaign_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.campaign_id'));
				set i_donation = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.donated'));
				set i_leased = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.leased'));
				set i_vacant_area = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.vacant_area'));
				set i_location = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.location'));
				set i_year_of_donation = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.year_of_donation'));
				set i_leased_period = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.leased_period'));
				set i_credit_or_debit_card_no = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.credit_or_debit_card_no'));
				set i_txn_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.txn_id'));
				set i_active = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.active'));
				set i_created_on = now();
				set i_updated_on = now();
				set i_updated_by = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.updated_by'));
				set i_created_by = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.created_by'));
				set i_project_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.project_id'));
				set m_receipt_no =(select ifnull(max(receipt_no),0)+1 as receipt_no from land_donor);
        set @cheque_date=(select date_add(date_format(i_cheque_date,'%Y-%m-%d'),interval 1 day));
        set i_donation_date=now();
        set i_project_id = JSON_UNQUOTE(JSON_EXTRACT(landDonor,'$.project_id'));


					if statement=1 then
					
							insert into land_donor(receipt_no,donor_id, donation_date, amount, payment_id, cheque_no, cheque_date, bank,project_category_id, maintenance_id, 
							sub_type_id, notes, campaign_id, donated,leased,vacant_area,location,year_of_donation, leased_period, credit_or_debit_card_no,txn_id, created_by, created_on,project_id)
							values(m_receipt_no,i_donor_id,i_donation_date,i_amount,i_payment_id,i_cheque_no,@cheque_date,i_bank,i_project_category_id,i_maintenance_id,
							i_sub_type_id,i_notes,i_campaign_id,i_donation,i_leased,i_vacant_area,i_location,i_year_of_donation,i_leased_period,i_credit_or_debit_card_no,i_txn_id,i_created_by,i_created_on,i_project_id);

					elseif statement=6 then


							select ifnull(max(receipt_no),0)+1 as receipt_no from land_donor;

          elseif statement=5 then

              select d.first_name,d.last_name,d.address1,d.address2,d.address3,d.city,c.country,s.state,d.postal_code,d.organization_name,d.donor_code,
              d.donor_type,d.email_id,d.mobile_no,d.donor_id,date_format(d.dob,'%Y-%m-%d') as dob,date_format(d.anniversary,'%Y-%m-%d') as anniversary,d.gender from donor d
              inner join country_master c on c.country_code=d.country_code
              inner join state_master s on s.state_code=d.state_code where d.donor_id=donor_id;

          elseif statement=7 then

              select d.first_name,d.last_name,d.address1,d.city,d.postal_code,c.country,s.state,l.receipt_no from land_donor l
              inner join donor d on d.donor_id =l.donor_id
              inner join country_master c on c.country_code=d.country_code
              inner join state_master s on s.state_code=d.state_code where l.receipt_no=donor_id;

					end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_login_master`
--

DROP PROCEDURE IF EXISTS `sp_login_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_master`(IN `loginMaster` JSON, IN `statement` INT, IN `log_id` INT)
begin


			declare i_login_time datetime;
			declare i_logout_time datetime;
			declare i_user_code int;


				set i_user_code=JSON_UNQUOTE(JSON_EXTRACT(loginMaster,'$.user_code'));
				set i_login_time = CAST(jSON_UNQUOTE(JSON_EXTRACT(loginMaster,'$.login_time'))as DATETIME);
				set i_logout_time = CAST(jSON_UNQUOTE(JSON_EXTRACT(loginMaster,'$.logout_time')) as DATETIME);
				
					if statement=1 then
					
						insert into login_history(user_code,login_time) values(i_user_code,now());
						
					end if;
					
					if statement='3' then
					
						update login_history set logout_time=i_logout_time where login_id=log_id;
      
					end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_maintenance_sub_type`
--

DROP PROCEDURE IF EXISTS `sp_maintenance_sub_type`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_maintenance_sub_type`(IN `maintenancesubtype_js` JSON, IN `statement` int,IN `i_maintenancesubtype_id` INT)
begin


			declare s_project_category_id int(6);
			declare s_maintenance_id int(6);
			declare s_sub_type varchar(50);
			declare s_active char(1);
			declare i_created_at datetime;
			declare i_updated_at datetime;
			declare i_created_by varchar(30);
			declare i_updated_by varchar(30);



				set s_project_category_id = jSON_UNQUOTE(JSON_EXTRACT(maintenancesubtype_js,'$.project_category_id'));
				set s_maintenance_id = jSON_UNQUOTE(JSON_EXTRACT(maintenancesubtype_js,'$.maintenance_id'));
				set s_sub_type = jSON_UNQUOTE(JSON_EXTRACT(maintenancesubtype_js,'$.sub_type'));
				set s_active  = jSON_UNQUOTE(JSON_EXTRACT(maintenancesubtype_js,'$.active'));
				set i_created_at = now();
				set i_updated_at = now();
				set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(maintenancesubtype_js,'$.updated_by'));
				set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(maintenancesubtype_js,'$.created_by'));


						if statement=1 then   
						
								insert into maintenance_sub_type(project_category_id,maintenance_id,sub_type,created_on,created_by,active)
								values(s_project_category_id,s_maintenance_id,s_sub_type,i_created_at,i_created_by,s_active);

						elseif statement=2 then		
						
							    select m.maintenance_type , p.project_category,s.sub_type,s.sub_type_id,s.active  from project_category p
							    inner join maintenance_type m on p.project_category_id=m.project_category_id
							    inner join maintenance_sub_type s on  s.maintenance_id=m.maintenance_id;

						elseif statement=5 THEN
					  
								update maintenance_sub_type set sub_type = s_sub_type,updated_on=i_updated_at,updated_by=i_updated_by,active=s_active where sub_type_id=i_maintenancesubtype_id;

						elseif statement=4 THEN		
								
								delete from maintenance_sub_type WHERE sub_type_id=i_maintenancesubtype_id;

						elseif statement=3 THEN		
					  
								select * from maintenance_sub_type  WHERE sub_type_id=i_maintenancesubtype_id;

						elseif statement=6 then
								
								select project_category,project_category_id from project_category where active= 'Y';

						elseif statement=7 then    
								
								select maintenance_type,maintenance_id from maintenance_type where project_category_id=i_maintenancesubtype_id;

						elseif statement=8 then    
								
								select maintenance_id,maintenance_type from maintenance_type where project_category_id = i_maintenancesubtype_id;

						elseif statement=9 then    
								
								select sub_type_id,sub_type from maintenance_sub_type where project_category_id = i_maintenancesubtype_id;
						
						elseif statement=10 then
								
								select sub_type_id,sub_type from maintenance_sub_type where maintenance_id=i_maintenancesubtype_id;

					end if;

	END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_maintenance_type`
--

DROP PROCEDURE IF EXISTS `sp_maintenance_type`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_maintenance_type`(IN `maintenancetype_js` JSON, IN `statement` int,IN `i_maintenancetype_id` INT)
begin

			declare m_maintenancetype_code  char(6);
			declare m_project_category_id char(6);
			declare m_maintenancetype_type varchar(50);
			declare m_active char(1);
			declare i_created_at datetime;
			declare i_updated_at datetime;
			declare i_created_by varchar(30);
			declare i_updated_by varchar(30);


					set m_maintenancetype_code = jSON_UNQUOTE(JSON_EXTRACT(maintenancetype_js,'$.maintenance_code'));
					set m_project_category_id = jSON_UNQUOTE(JSON_EXTRACT(maintenancetype_js,'$.project_category_id'));
					set m_maintenancetype_type = jSON_UNQUOTE(JSON_EXTRACT(maintenancetype_js,'$.maintenance_type'));
					set m_active = jSON_UNQUOTE(JSON_EXTRACT(maintenancetype_js,'$.active'));
					set i_created_at = now();
					set i_updated_at = now();
					set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(maintenancetype_js,'$.updated_by'));
					set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(maintenancetype_js,'$.created_by'));


					if statement='1' then 
					
							insert into maintenance_type(maintenance_code,project_category_id,maintenance_type,created_on,created_by,active)
							values(m_maintenancetype_code, m_project_category_id,m_maintenancetype_type, i_created_at,i_created_by,m_active);

					elseif statement='2' then		
					
							  select p.project_category,m.maintenance_code,m.maintenance_type,m.active,m.maintenance_id,p.project_category_id
							  from project_category p inner join maintenance_type m on m.project_category_id=p.project_category_id;

				    elseif statement='5' THEN  
				  
							  update maintenance_type set maintenance_code=m_maintenancetype_code,project_category_id=m_project_category_id,
							  maintenance_type = m_maintenancetype_type,updated_on=i_updated_at,updated_by=i_updated_by,active=m_active
							  where maintenance_id=i_maintenancetype_id;

					elseif statement='4' THEN
							  
							  delete from maintenance_type WHERE maintenance_id=i_maintenancetype_id;

					elseif statement='3' THEN		

							   select * from maintenance_type  WHERE maintenance_id=i_maintenancetype_id;

					elseif statement='6' then   
								
								select project_category,project_category_id from project_category where active= 'Y';

					elseif statement='7' then    
								
								select maintenance_id,maintenance_type from maintenance_type where project_category_id = maintenance_id;


					end if;

	END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_navigation`
--

DROP PROCEDURE IF EXISTS `sp_navigation`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_navigation`(i_role_id int)
begin

          set @a:=0;
          set @b:=0;
          set @c:=0;
          select @a:=@a+1 as s_No,'Master' as navigation,
          case when (select count(*) from navigation_master n
          inner join role_screen_mapping_master r on r.nav_id=n.nav_id where n.parent_or_child in ('Master')and r.role_id=i_role_id)<>0 then 'Y' else 'N' end as Is_enabled,
          'Y' as IS_parent, 1 as parent_id

          union all

          (select @a:=@a+1 as s_No,nav_name,case when role_id <> 0 and a.nav_id <> 0 then 'Y' else 'N' end as Is_enabled,'N' as IS_parent, 1 as parent_id
          from((select n.nav_id,nav_name from navigation_master n where n.parent_or_child in ('Master') )a
          left join
          (select role_id,nav_id from role_screen_mapping_master where role_id=i_role_id) b on a.nav_id=b.nav_id ))

		      union all

          select @b:=@b+1 as s_No,'Project' as navigation,
          case when (select count(*) from navigation_master n
          inner join role_screen_mapping_master r on r.nav_id=n.nav_id where n.parent_or_child in ('Project')and r.role_id=i_role_id)<>0 then 'Y' else 'N' end as Is_enabled,
          'Y' as IS_parent, 2 as parent_id

          union all

          (select @b:=@b+1 as s_No,nav_name,case when role_id <> 0 and a.nav_id <> 0 then 'Y' else 'N' end as Is_enabled,'N' as IS_parent, 2 as parent_id
          from((select n.nav_id,nav_name from navigation_master n where n.parent_or_child in ('Project') )a
          left join
          (select role_id,nav_id from role_screen_mapping_master where role_id=i_role_id) b on a.nav_id=b.nav_id ))

		      union all


          select @c:=@c+1 as s_No,'Donor' as navigation,
          case when (select count(*) from navigation_master n
          inner join role_screen_mapping_master r on r.nav_id=n.nav_id where n.parent_or_child in ('Donor')and r.role_id=i_role_id)<>0 then 'Y' else 'N' end as Is_enabled,
          'Y' as IS_parent, 3 as parent_id

          union all

          (select @c:=@c+1 as s_No,nav_name,case when role_id <> 0 and a.nav_id <> 0 then 'Y' else 'N' end as Is_enabled,'N' as IS_parent, 3 as parent_id
          from((select n.nav_id,nav_name from navigation_master n where n.parent_or_child in ('Donor') )a
          left join
          (select role_id,nav_id from role_screen_mapping_master where role_id=i_role_id) b on a.nav_id=b.nav_id ));


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_notification_history`
--

DROP PROCEDURE IF EXISTS `sp_notification_history`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_notification_history`(IN `notification_history` JSON)
begin


      declare i_donor_id varchar(45);
      declare i_status varchar(45);
      declare i_type varchar(45);


        set i_donor_id = jSON_UNQUOTE(JSON_EXTRACT(notification_history,'$.donor_id'));
        set i_status = jSON_UNQUOTE(JSON_EXTRACT(notification_history,'$.status'));
        set i_type = jSON_UNQUOTE(JSON_EXTRACT(notification_history,'$.type'));


              delete from notification_history where  donor_id=i_donor_id;

						  insert into notification_history(donor_id,type,status,sent_date)
						  values(i_donor_id,i_type,i_status,now());

        


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_notification_master`
--

DROP PROCEDURE IF EXISTS `sp_notification_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_notification_master`(IN `notificationMaster` JSON, IN `statement` int,IN `tmplate_id` INT)
begin


			declare i_template_name varchar(100);
			declare i_email_subject varchar(100);
			declare i_email_content varchar(200);
			declare i_sms_content varchar(200);
			declare i_created_on datetime;
			declare i_updated_on datetime;
			declare i_created_by varchar(30);
			declare i_updated_by varchar(30);
			declare i_active char(1);
      declare i_status varchar(45);


				set i_template_name = jSON_UNQUOTE(JSON_EXTRACT(notificationMaster,'$.template_name'));
				set i_email_subject = jSON_UNQUOTE(JSON_EXTRACT(notificationMaster,'$.email_sub'));
				set i_email_content = jSON_UNQUOTE(JSON_EXTRACT(notificationMaster,'$.email_content'));
				set i_sms_content = jSON_UNQUOTE(JSON_EXTRACT(notificationMaster,'$.sms_content'));
				set i_active = jSON_UNQUOTE(JSON_EXTRACT(notificationMaster,'$.active'));
				set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(notificationMaster,'$.created_by'));
				set i_created_on = now();
				set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(notificationMaster,'$.updated_by'));
				set i_updated_on = now();
        set i_status = jSON_UNQUOTE(JSON_EXTRACT(notificationMaster,'$.status'));

					if statement= 1 then

						  insert into notification_master(template_name,email_sub,email_content,sms_content,active, created_by, created_on,status )
						  values(i_template_name,i_email_subject,i_email_content,i_sms_content,i_active,i_created_by,i_created_on,i_status);

					elseif statement= 2 then

							select * from notification_master;

					elseif statement= 3 THEN

							select * from notification_master WHERE template_id=tmplate_id;

					elseif statement= 4 THEN

						  update notification_master set template_name=i_template_name,email_sub=i_email_subject,email_content=i_email_content,sms_content=i_sms_content,active=i_active,
						  updated_by=i_updated_by,updated_on=i_updated_on where template_id=tmplate_id;

					elseif statement= 5 THEN

							delete from notification_master WHERE template_id=tmplate_id;

					end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_payment_master`
--

DROP PROCEDURE IF EXISTS `sp_payment_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payment_master`(i_payment_master JSON,i_statement int,i_payment_id int)
begin


		declare m_payment_code char(5);
		declare m_payment_mode varchar(50);
		declare m_created_on datetime;
		declare m_created_by varchar(50);
		declare m_updated_by varchar(50);
		declare m_updated_on datetime;
		declare m_active char(1);



			set m_payment_code=JSON_UNQUOTE(JSON_EXTRACT(i_payment_master,'$.payment_code'));
			set m_payment_mode=JSON_UNQUOTE(JSON_EXTRACT(i_payment_master,'$.payment_mode'));
			set m_created_by=JSON_UNQUOTE(JSON_EXTRACT(i_payment_master,'$.created_by'));
			set m_created_on = now();
			set m_updated_by=JSON_UNQUOTE(JSON_EXTRACT(i_payment_master,'$.updated_by'));
			set m_updated_on= now();
			set m_active=JSON_UNQUOTE(JSON_EXTRACT(i_payment_master,'$.active'));





			if(i_statement=1)then

				insert into payment_master(payment_code, payment_mode, created_by, created_on,active)values
				(m_payment_code,m_payment_mode,m_created_by,m_created_on,m_active);


			elseif(i_statement=2)then

				select * from payment_master ;

			elseif(i_statement=3)then

				select * from payment_master where payment_id=i_payment_id ;

			elseif(i_statement=4)then

				update payment_master set payment_code=m_payment_code,payment_mode=m_payment_mode,updated_by=m_updated_by,updated_on=m_updated_on,active=m_active
				where payment_id=i_payment_id;

			elseif(i_statement=5)then

			   delete from payment_master where payment_id=i_payment_id;

			end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_project`
--

DROP PROCEDURE IF EXISTS `sp_project`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_project`(IN `projectNames` JSON, IN `statement` INT, IN `proj_code` INT)
begin

			declare i_project_id int;
			declare i_project_code char(6);
			declare i_project_name varchar(100);
			declare i_country_code int;
			declare i_state_code int;
			declare i_address1 varchar(80);
			declare i_address2 varchar(80);
			declare i_address3 varchar(80);
			declare i_city varchar(80);
			declare i_postal_code char(10);
			declare i_report_subm_period varchar(30);
			declare i_created_by varchar(20);
			declare i_created_on datetime;
			declare i_updated_by varchar(20);
			declare i_updated_on datetime;
			declare i_active char(1);
			declare i_project_category_id int;


					set i_project_code = jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.project_code'));
					set i_project_name = jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.project_name'));
					set i_country_code=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.country_code'));
					set i_state_code=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.state_code'));
					set i_address1=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.address1'));
					set i_address2=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.address2'));
					set i_address3=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.address3'));
					set i_city=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.city'));
					set i_postal_code=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.postal_code'));
					set i_report_subm_period=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.report_subm_period'));
					set i_project_category_id=jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.project_category_id'));
					set i_created_on = now();
					set i_updated_on = now();
					set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.updated_by'));
					set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.created_by'));
					set i_active = jSON_UNQUOTE(JSON_EXTRACT(projectNames,'$.active'));


						if statement=1 then

							insert into project( project_code,project_name,country_code,state_code,address1,address2,address3,
							city,postal_code,report_subm_period,project_category_id,created_by,created_on,active)
              values(i_project_code,i_project_name,i_country_code,i_state_code,i_address1,i_address2,i_address3,i_city,i_postal_code,
              i_report_subm_period,i_project_category_id,i_created_by,i_created_on,i_active); 

						 elseif statement=2 then
						 
							select p.project_id,p.project_code,p.project_name,p.city,s.state,c.country,p.active from project p
							inner join country_master c on c.country_code=p.country_code
							inner join state_master s on s.state_code=p.state_code;

						elseif statement=3 then

							select * from project where project_id=proj_code;

						elseif statement=4 then

							update project set project_code=i_project_code,project_name=i_project_name,
							city=i_city,updated_on=i_updated_on,updated_by=i_updated_by,active=i_active where project_id=proj_code;

						elseif statement= 5 THEN

						  delete from project WHERE project_id=proj_code;

						elseif statement=6 then
						
						   select country_code,country from country_master;

						elseif statement=7 then
						
						    select * from project ;

						elseif statement=8 then
							
							select * from project_category where active='Y';

						end if;
	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_project_category`
--

DROP PROCEDURE IF EXISTS `sp_project_category`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_project_category`(IN `projectCategory` JSON, IN `statement` int,IN `prjct_category_id` INT)
begin


		declare i_project_code varchar(5);
		declare i_project_category varchar(100);
		declare i_created_on datetime;
		declare i_updated_on datetime;
		declare i_created_by varchar(30);
		declare i_updated_by varchar(30);
		declare i_active char(1);


				set i_project_code = jSON_UNQUOTE(JSON_EXTRACT(projectCategory,'$.project_code'));
				set i_project_category = jSON_UNQUOTE(JSON_EXTRACT(projectCategory,'$.project_category'));
				set i_active = jSON_UNQUOTE(JSON_EXTRACT(projectCategory,'$.active'));
				set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(projectCategory,'$.created_by'));
				set i_created_on = now();
				set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(projectCategory,'$.updated_by'));
				set i_updated_on = now();


				if statement= 1 then

					  insert into project_category(project_code, project_category, created_by, created_on,active )
					  values(i_project_code,i_project_category,i_created_by,i_created_on,i_active);

				elseif statement= 2 then

					select * from project_category where active= 'Y';

				elseif statement= 3 THEN

					select * from project_category WHERE project_category_id=prjct_category_id and active= 'Y';

				elseif statement= 4 THEN

					update project_category set project_code=i_project_code,project_category=i_project_category,
					updated_by=i_updated_by,updated_on=i_updated_on,active=i_active where project_category_id=prjct_category_id;

				elseif statement= 5 THEN

					delete from project_category WHERE project_category_id=prjct_category_id;

				end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_project_dtl`
--

DROP PROCEDURE IF EXISTS `sp_project_dtl`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_project_dtl`(IN `project_dtl` JSON, IN `statement` int,
IN `project_dtl_id` INT)
begin

declare i_created_on datetime;
declare i_created_by varchar(45);
declare i_project_id int(11);
declare i_project_category_id int(11);



set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(project_dtl,'$.created_by'));
set i_created_on = jSON_UNQUOTE(JSON_EXTRACT(project_dtl,'$.created_on'));
set i_project_id = jSON_UNQUOTE(JSON_EXTRACT(project_dtl,'$.project_id'));
set i_project_category_id = jSON_UNQUOTE(JSON_EXTRACT(project_dtl,'$.project_category_id '));




      if statement= 1 then

          insert into project_dtl(project_category_id,project_id,created_by,created_on)
          values(i_project_category_id,i_project_id,i_created_by,i_created_on);


  elseif statement=2 then

     select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id, p.sub_type_id,
p.notes, p.campaign_id, p.donated, p.leased, p.build_up_area, p.vacant_area, p.location, p.year_of_donation, p.leased_period, p.credit_or_debit_card_no, p.txn_id,
p.project_id,d.city,d.mobile_no,c.country,s.state from land_donor p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code;

elseif statement=3 then

      select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id, p.sub_type_id,
p.notes, p.campaign_id, p.donated, p.leased, p.build_up_area, p.vacant_area, p.location, p.year_of_donation, p.leased_period, p.credit_or_debit_card_no, p.txn_id,
p.project_id,d.city,d.mobile_no,c.country,s.state from land_donor p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code where receipt_no=project_dtl_id;

elseif statement=4 then

  delete from land_donor where receipt_no=project_dtl_id;




  elseif statement=5 then

     select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id,
     p.sub_type_id,p.notes, p.campaign_id, p.full_building,p.ground_floor,p.first_floor,p.second_floor,p.third_floor,p.location,p.size,p.year_of_construction,
     p.year_of_completion,p.upload_photo,p.credit_or_debit_card_no, p.active,p.txn_id,p.project_id,d.city,d.first_name,d.mobile_no,c.country,s.state from building_donor p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code;

elseif statement=6 then

      select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id,
     p.sub_type_id,p.notes, p.campaign_id, p.full_building,p.ground_floor,p.first_floor,p.second_floor,p.third_floor,p.location,p.size,p.year_of_construction,
     p.year_of_completion,p.upload_photo,p.credit_or_debit_card_no, p.txn_id,p.project_id,d.city,d.mobile_no,c.country,s.state from building_donor p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code where receipt_no=project_dtl_id;

elseif statement=7 then

  delete from building_donor where receipt_no=project_dtl_id;



  elseif statement=8 then

     select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id,
     p.sub_type_id,p.notes, p.campaign_id,p.upload_document,p.start_date,p.end_date,p.credit_or_debit_card_no, p.active,p.txn_id,p.project_id,d.city,
     d.mobile_no,d.first_name,c.country,s.state from annual_maintenance p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code;

elseif statement=9 then

      select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id,
     p.sub_type_id,p.notes, p.campaign_id, p.upload_document,p.start_date,p.end_date,credit_or_debit_card_no, p.txn_id,p.project_id,d.city,d.mobile_no,c.country,s.state from annual_maintenance p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code where receipt_no=project_dtl_id;

elseif statement=10 then

  delete from building_donor where receipt_no=project_dtl_id;



  elseif statement=11 then

     select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id,
     p.sub_type_id,p.notes, p.campaign_id,p.project_id,d.city,p.active,
     d.mobile_no,d.first_name,c.country,s.state from facility_management p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code;

elseif statement=12 then

      select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id,
     p.sub_type_id,p.notes, p.campaign_id,p.project_id,d.city,p.active,
     d.mobile_no,d.first_name,c.country,s.state from facility_management p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code where receipt_no=project_dtl_id;

elseif statement=13 then

  delete from facility_management where receipt_no=project_dtl_id;



  elseif statement=14 then

     select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id,
     p.sub_type_id,p.notes, p.campaign_id,p.project_id,d.city,p.credit_or_debit_card_no, p.txn_id,
     d.mobile_no,d.first_name,c.country,s.state from general_donation p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code;

elseif statement=15 then

      select p.receipt_no, p.donor_id, p.donation_date, p.amount, p.payment_id, p.cheque_no, p.cheque_date, p.bank, p.project_category_id, p.maintenance_id,
     p.sub_type_id,p.notes, p.campaign_id,p.project_id,d.city,p.credit_or_debit_card_no, p.txn_id,
     d.mobile_no,d.first_name,c.country,s.state from general_donation p
inner join  donor d on d.donor_id=p.donor_id
inner join country_master c on c.country_code=d.country_code
inner join  state_master s on s.state_code=d.state_code where receipt_no=project_dtl_id;

elseif statement=16 then

  delete from general_donation where receipt_no=project_dtl_id;


   end if;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_role_mapping`
--

DROP PROCEDURE IF EXISTS `sp_role_mapping`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_mapping`(i_rolemapping_master JSON,i_role_id int,i_statement int,i_use_code int)
begin

			declare navid varchar(100);
			declare m_role_id int;
			declare ins_role int;
			declare m_user_code int;
			declare m_created_on datetime;
			declare m_created_by varchar(50);
			declare m_updated_by varchar(50);
			declare m_updated_on datetime;
			declare m_active char(1);


				set m_role_id=i_role_id;
				set navid=JSON_UNQUOTE(JSON_EXTRACT(i_rolemapping_master,'$.nav_id'));
				set ins_role=JSON_UNQUOTE(JSON_EXTRACT(i_rolemapping_master,'$.role_id'));
				set m_user_code=JSON_UNQUOTE(JSON_EXTRACT(i_rolemapping_master,'$.user_code'));
				set m_created_by=JSON_UNQUOTE(JSON_EXTRACT(i_rolemapping_master,'$.created_by'));
				set m_created_on = now();
				set m_active=JSON_UNQUOTE(JSON_EXTRACT(i_rolemapping_master,'$.active'));



				begin
				
						DECLARE `json_items` BIGINT UNSIGNED DEFAULT JSON_LENGTH(navid);
						DECLARE `_index` BIGINT UNSIGNED DEFAULT 0;

						delete from role_screen_mapping_master where role_id=m_role_id;


							WHILE `_index` < `json_items` DO

									if(i_statement=5)then

										  insert into role_screen_mapping_master (role_id, nav_id,  created_by, created_on)
										  select  m_role_id,(JSON_EXTRACT(`navid`, CONCAT('$[', `_index`, ']'))),m_created_by,m_created_on;

									end if;

									SET `_index` := `_index` + 1;

							END WHILE;
				end;


					if(i_statement=1)then

					  select * from role_master where active='Y';

					elseif(i_statement=2)then

						insert into role_user_mapping_master(role_id, user_code, created_by, created_on, active)values(ins_role,m_user_code,m_created_by,m_created_on,m_active);

					elseif(i_statement=3)then

						  select user_code,first_name from user_master  order by user_code asc;
						  
					elseif(i_statement=4)then

						 select * from navigation_master;

					elseif(i_statement=6)then

						  select n.nav_name from role_screen_mapping_master r
						  inner join navigation_master n on n.nav_id=r.nav_id
						  where r.role_id=i_use_code;

					end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_role_master`
--

DROP PROCEDURE IF EXISTS `sp_role_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_master`(i_role_master JSON,i_statement varchar(30),i_role_id int)
begin


		declare m_role_name varchar(50);
		declare m_created_by varchar(50);
		declare m_created_on datetime;
		declare m_updated_by varchar(50);
		declare m_updated_on datetime;
		declare m_active char(1);
		declare m_role_code char(2);

			set m_role_name=JSON_UNQUOTE(JSON_EXTRACT(i_role_master,'$.role'));
			set m_role_code=JSON_UNQUOTE(JSON_EXTRACT(i_role_master,'$.role_code'));
			set m_created_by=JSON_UNQUOTE(JSON_EXTRACT(i_role_master,'$.created_by'));
			set m_created_on = now();
			set m_updated_by=JSON_UNQUOTE(JSON_EXTRACT(i_role_master,'$.updated_by'));
			set m_updated_on= now();
			set m_active=JSON_UNQUOTE(JSON_EXTRACT(i_role_master,'$.active'));


				if(i_statement=1)then

					insert into role_master(role,role_code, created_by, created_on,active)
					values(m_role_name,m_role_code,m_created_by,m_created_on,m_active);

				elseif(i_statement=2)then

					select * from role_master;

				elseif(i_statement=3)then

					select * from role_master where role_id=i_role_id ;

				elseif(i_statement=4)then

					update role_master set role=m_role_name,role_code=m_role_code,updated_by=m_updated_by,updated_on=m_updated_on,active=m_active where role_id=i_role_id;

				elseif(i_statement=5)then

					delete from role_master where role_id=i_role_id ;

				end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_role_user_mapping_master`
--

DROP PROCEDURE IF EXISTS `sp_role_user_mapping_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_user_mapping_master`(IN `userMapping` JSON, IN `statement` int,IN `role_id` INT)
begin


		declare i_role_mapping_id integer;
		declare i_role_id integer;
		declare i_user_code integer;
		declare i_created_on datetime;
		declare i_updated_on datetime;
		declare i_created_by varchar(30);
		declare i_updated_by varchar(30);
		declare i_active CHAR(1);



			set i_role_mapping_id= jSON_UNQUOTE(JSON_EXTRACT(userMapping,'$role_mapping_id'));
			set i_role_id = jSON_UNQUOTE(JSON_EXTRACT(userMapping,'$.role_id'));
			set i_user_code  = jSON_UNQUOTE(JSON_EXTRACT(userMapping,'$.user_code '));
			set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(userMapping,'$.created_by'));
			set i_created_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(userMapping,'$.created_on'))as DATETIME);
			set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(userMapping,'$.updated_by'));
			set i_updated_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(userMapping,'$.updated_on')) as DATETIME);
			set i_active = jSON_UNQUOTE(JSON_EXTRACT(userMapping,'$.active'));






	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_search_popup`
--

DROP PROCEDURE IF EXISTS `sp_search_popup`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_search_popup`(i_donor_id int,flag int)
begin


        if(flag=1)then

            select donor_id,donor_code,first_name,email_id,mobile_no,city,s.state,date_format(dob,'%d-%m-%Y') as date_of_birth,postal_code as pincode from donor d
inner join state_master s on s.state_code=d.state_code where donor_id=i_donor_id;

        elseif(flag=2)then

            select donor_id,donor_code,first_name,email_id,mobile_no,city from donor;

        end if;



    end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_sponsorship_history`
--

DROP PROCEDURE IF EXISTS `sp_sponsorship_history`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sponsorship_history`(IN `sponsorship_history` JSON)
begin


      declare i_donor_id varchar(45);
      declare i_status varchar(45);
      declare i_type varchar(45);


        set i_donor_id = jSON_UNQUOTE(JSON_EXTRACT(sponsorship_history,'$.donor_id'));
        set i_status = jSON_UNQUOTE(JSON_EXTRACT(sponsorship_history,'$.status'));
        set i_type = jSON_UNQUOTE(JSON_EXTRACT(sponsorship_history,'$.type'));


              delete from sponsorship_history where  donor_id=i_donor_id;

						  insert into sponsorship_history(donor_id,type,status,Sent_date)
						  values(i_donor_id,i_type,i_status,now());




	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_state_master`
--

DROP PROCEDURE IF EXISTS `sp_state_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_state_master`(IN `stateMaster` JSON, IN `statement` INT, IN `st_code` INT)
begin

			declare i_state_code int;
			declare i_country_code int;
			declare i_state_name varchar(100);
			declare i_short_name varchar(5);
			declare i_created_on datetime;
			declare i_updated_on datetime;
			declare i_created_by varchar(30);
			declare i_updated_by varchar(30);
			declare i_active char(1);


					set i_country_code = jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.country_code'));
					set i_state_code = jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.state_code'));
					set i_state_name = jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.state'));
					set i_short_name = jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.state_short_name'));
					set i_created_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.created_on'))as DATETIME);
					set i_updated_on = CAST(jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.updated_on')) as DATETIME);
					set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.updated_by'));
					set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.created_by'));
					set i_active = jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.active'));

					if statement=1 then
					
							insert into state_master(state_code,country_code,state,state_short_name,created_on,created_by,active) values(i_state_code,i_country_code,i_state_name,i_short_name,now(),i_created_by,i_active);
					
					elseif statement=2 then
					
							SELECT country_master.country, state_master.state,state_master.state_short_name,state_master.state_code,state_master.active FROM country_master INNER JOIN state_master ON country_master.country_code=state_master.country_code  ;
					
					end if;

					if statement=3 THEN
							
							update state_master set active=i_active   where state_code=st_code;

					elseif statement=4 THEN
					
							delete from  state_master  where state_code=st_code;

					elseif statement=5 THEN
					
							select state,state_short_name,state_code from state_master_lookup WHERE country_code=st_code;
					
					elseif statement=6 then
							
							select country_code,country,country_short_name from country_master ;

					end if;


	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_user_master`
--

DROP PROCEDURE IF EXISTS `sp_user_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_master`(userMaster JSON,statement varchar(30),u_code varchar(100))
begin

			declare i_country_code int;
			declare i_state_code int;
			declare i_first_name varchar(50);
			declare i_last_name varchar(50);
			declare i_dob varchar(50);
			declare i_anniversary varchar(50);
			declare i_mobile_no char(15);
			declare i_landline_no char(15);
			declare i_email varchar(100);
			declare i_active char(6);
			declare i_address1 varchar(80);
			declare i_address2 varchar(80);
			declare i_address3 varchar(80);
			declare i_city varchar(50);
			declare i_postal_code char(10);
			declare i_password varchar(100);
			declare i_created_on datetime;
			declare i_updated_on char(19);
			declare i_created_by varchar(30);
			declare i_updated_by varchar(30);
			declare m_dob date;
			declare m_anniversary date;
			declare m_updated_on date;  


				set i_country_code=JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.country_code'));
				set i_state_code = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.state_code'));
				set i_first_name = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.first_name'));
				set i_last_name = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.last_name'));
				set i_dob = jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.dob'));
				set i_anniversary = jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.anniversary'));
				set i_mobile_no = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.mobile_no'));
				set i_landline_no = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.landline_no'));
				set i_email = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.email_id'));
				set i_active = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.active'));
				set i_password = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.password'));
				set i_address1 = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.address1'));
				set i_address2 = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.address2'));
				set i_address3 = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.address3'));
				set i_city = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.city'));
				set i_postal_code = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.postal_code'));
				set i_created_on = now();
				set i_updated_on = (select (if (ifnull(json_extract(json_object(userMaster,null),'$.updated_on'),'0000-00-00')='0000-00-00', (CAST(jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.updated_on'))as char)) , (CAST(jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.updated_on'))as char)))));
				set i_updated_by = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.updated_by'));
				set i_created_by = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.created_by'));
				set i_active = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.active'));
				set @dob=(select date_format(i_dob,'%Y-%m-%d'));
				set @anniversary=(select date_format(i_anniversary,'%Y-%m-%d'));
				set m_updated_on=(select case when cast(ifnull(i_updated_on,'0000-00-00')as date) is null then '0000-00-00' else  cast(i_updated_on as date) end);


						if statement=1 then

								insert into user_master(country_code,state_code,first_name,last_name,dob,anniversary,mobile_no,landline_no,email_id,
								address1,address2,address3,city,postal_code,created_by,created_on,active,password)
								values(i_country_code,i_state_code,i_first_name,i_last_name,@dob,@anniversary,i_mobile_no,i_landline_no,i_email,
								i_address1,i_address2,i_address3,i_city,i_postal_code,i_created_by,now(),i_active,i_password);


						elseif statement='Select' then

								select r.role,r.role_id ,usr.first_name,max(l.login_time) as login_time,usr.password,u.user_code,usr.mobile_no from user_master usr
								inner join role_user_mapping_master u on u.user_code=usr.user_code
								inner join role_master r on r.role_id=u.role_id
								inner join login_history l on l.user_code=usr.user_code
								where usr.email_id=i_email or usr.mobile_no=i_email and usr.password=i_password and usr.active='Y';



						elseif statement=2 then

								select user_code,first_name,email_id, mobile_no,active from  user_master;

  					elseif statement=4 then

  							update user_master set first_name=i_first_name,email_id=i_email,mobile_no=i_mobile_no,updated_on=now(),updated_by=i_updated_by,active=i_active where user_code=u_code;

  					elseif statement=5 then

                delete from  user_master  where user_code=u_code;

            elseif statement='Select1' then

                select  r.role,r.role_id ,usr.first_name,usr.password,u.user_code,usr.mobile_no from user_master usr
								inner join role_user_mapping_master u on u.user_code=usr.user_code
								inner join role_master r on r.role_id=u.role_id
								where usr.email_id=i_email or usr.mobile_no=i_email and usr.password=i_password and usr.active='Y';

						 end if;

	end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
