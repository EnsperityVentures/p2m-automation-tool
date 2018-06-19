CREATE DATABASE  IF NOT EXISTS `shobingg_p2m_operations` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shobingg_p2m_operations`;
-- MySQL dump 10.13  Distrib 5.6.40, for Win64 (x86_64)
--
-- Host: localhost    Database: shobingg_p2m_operations
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `clients invoices`
--

DROP TABLE IF EXISTS `clients invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients invoices` (
  `OrderNo` varchar(45) NOT NULL,
  `EmployeeID` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `CatalogName` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `RedemptionPoints` varchar(45) DEFAULT NULL,
  `LocalCost` double DEFAULT NULL,
  `ReasonofReturn` varchar(45) DEFAULT 'None',
  `Currency_ID` int(11) DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Company` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderNo`),
  KEY `CurrencyID_idx` (`Currency_ID`),
  CONSTRAINT `CurencyID` FOREIGN KEY (`Currency_ID`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients invoices`
--

LOCK TABLES `clients invoices` WRITE;
/*!40000 ALTER TABLE `clients invoices` DISABLE KEYS */;
INSERT INTO `clients invoices` VALUES ('1774-1','1139','Fakhri','Al Shidad','0000-00-00',1,'2018-02-14','1',70,'0',NULL,0,'1',NULL),('1775-1','1848','Maryam','Al Dairi','0000-00-00',1,'2018-02-14','1',70,'Not Available',10,0,'OM',NULL),('1776-1','394','Aida','Al-Musharfi','0000-00-00',1,'2018-02-15','1',90,'0',NULL,0,'1',NULL),('1778-1','389','Sultan','Al-Ghafri','0000-00-00',1,'2018-02-15','1',70,'None',10,0,'OM',NULL),('1779-2','467','Zubaida','Alzadjali','0000-00-00',1,'2018-02-18','2200',600000,'-1',NULL,0,'2200',NULL),('1781-1','571','Younis','Alzadjali','0000-00-00',2,'2018-02-18','1740',1740,'None',10,1,'OM',1),('1783-1','1727','Mayada','Al Zadjali','0000-00-00',1,'2018-02-18','870',870,'None',10,0,'OM',1),('1784-1','128','Mahmood','Al-Balushi','0000-00-00',3,'2018-02-19','2205',463050,'None',10,0,'OM',NULL),('1785-1','1054','Fatima','Alobaidani','0000-00-00',1,'2018-02-19','870',870,'None',10,0,'OM',2),('1787-1','1006','Hassan','Alwahaibi','0000-00-00',1,'2018-02-20','615',615,'None',10,0,'OM',1),('1788-1','2087','Mohamed','AlZadjali','0000-00-00',2,'2018-02-21','1740',1740,'None',10,0,'OM',2),('1790-1','2092','Muzna','Al Maashari','0000-00-00',1,'2018-02-22','95',6650,'-1',NULL,0,'95',NULL),('1793-1','1103','Mahmood','Alnbhani','0000-00-00',1,'2018-02-26','795',795,'None',10,1,'OM',1),('1794-1','1658','Nidhal','AL Zadjali','0000-00-00',1,'2018-02-26','240',240,'None',10,1,'OM',1),('1798-1','1637','Fatma','AL Jazmi','0000-00-00',1,'2018-02-27','1300',1300,'None',10,1,'OM',1);
/*!40000 ALTER TABLE `clients invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientsdailyorders`
--

DROP TABLE IF EXISTS `clientsdailyorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientsdailyorders` (
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DeptName` varchar(100) DEFAULT NULL,
  `DeptCode` varchar(50) DEFAULT NULL,
  `PIN` varchar(50) NOT NULL,
  `EmployeeID` varchar(50) NOT NULL,
  `JobTitle` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `CatalogName` varchar(100) NOT NULL,
  `RewardName` varchar(500) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Details` varchar(1500) DEFAULT NULL,
  `HighestLevelCategory` varchar(60) DEFAULT NULL,
  `LowestLevelCategory` varchar(60) DEFAULT NULL,
  `ShipToCompany` varchar(100) DEFAULT NULL,
  `ShipToName` varchar(70) DEFAULT NULL,
  `ShipToAddress1` varchar(500) DEFAULT NULL,
  `ShipToAddress2` varchar(500) DEFAULT NULL,
  `ShipToCity` varchar(50) DEFAULT NULL,
  `ShipToState` varchar(50) DEFAULT NULL,
  `ShipToZipCode` varchar(50) DEFAULT NULL,
  `ShipToCountry` varchar(50) DEFAULT NULL,
  `P2MOrderNumber` varchar(50) NOT NULL,
  `OrderStatus` varchar(50) NOT NULL,
  `CurrentStatus` varchar(50) NOT NULL,
  `DiscountCoupon` varchar(50) DEFAULT NULL,
  `RedemptionAmount` varchar(50) DEFAULT NULL,
  `DiscountApplied` varchar(50) DEFAULT NULL,
  `MemberPaid` varchar(50) DEFAULT NULL,
  `PointBillingRate` double DEFAULT NULL,
  `DateandTime` datetime DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`P2MOrderNumber`),
  UNIQUE KEY `P2M Order Number_UNIQUE` (`P2MOrderNumber`),
  UNIQUE KEY `PIN_UNIQUE` (`PIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientsdailyorders`
--

LOCK TABLES `clientsdailyorders` WRITE;
/*!40000 ALTER TABLE `clientsdailyorders` DISABLE KEYS */;
INSERT INTO `clientsdailyorders` VALUES ('Fakhri','Al Shidad','Islamic Banking Unit','771','CMTZ1357','1139','Front Office Clerk','98696899090445','Oman Merchandise - Live','4 in 1 Hair Styler 650 W',1,'','Beauty','Personal Care','AL YUSR ISLAMIC BANKINGG','Fakhri Al Shidad','SALALAH','SALALAH','SALALAH','JA','211','OM','1774-1','shipped','shipped','','-325','','-325',0.07920999825000763,'2018-02-14 00:32:21',0),('Maryam','Al Dairi','Branches Operations Department','795','GPSX1679','1848','Open Accounts & Data Quality Officer','986201092404039','Oman Gift Cards','Home Centre OMR50',1,'','Virtual Gift Cards','Retail','oman arab bank','Maryam Al Dairi','muscat','','Ozaiba','MA','130','OM','1775-1','shipped','shipped','','-650','','-650',0.07920999825000763,'2018-02-14 03:19:19',0),('Aida','Al-Musharfi','Retail Credit Department','8251','HTWY0279','394','Head of Personal Loan Section','98696899434903','Oman Gift Cards','Lulu Hypermarket (40 OMR)',1,'','Physical Gift Cards','Retail','','Aida Al-Musharfi','omanarabbank','??????','????','MA','2010','OM','1776-1','po_received','shipped','','-735','','-735',0.07920999825000763,'2018-02-15 03:35:06',0),('Sultan','Al-Ghafri','Regional Management &amp; Branch Support Department','8214','HNRW0145','389','Regional Manager','98696899473375','Oman Merchandise - Live','Samsung Galaxy S7 Edge Dual Sim - 32GB,4GB RAM, 4G LTE, Gold',1,'','Electronics','Phones','','Sultan Al-Ghafri','Sultanate of oman','','Ibri','ZA','511','OM','1778-1','po_received','shipped','','-2675','','-2675',0.07920999825000763,'2018-02-15 09:49:50',0),('Zubaida','Alzadjali','Al Rusayl','3117','DFJQ0478','467','Universal Customers Care','9860098692290468','Oman Gift Cards','Joyalukkas Jewlary Gift Card (150 OMR)',1,'','Physical Gift Cards','Gifts','??? ???? ?????? ??? ??????','Zubaida Alzadjali','1124','?   ??? 1124','?????','MA','???112','OM','1779-2','po_received','shipped','','-2200','','-2200',0.07920999825000763,'2018-02-18 04:52:01',0),('Younis','Alzadjali','Recruitment & Manpower Planning Section','85183','DFGJ1478','571','Human Resources Generalist','98699731846','Oman Gift Cards','Lulu Hypermarket (50 OMR)',2,'','Physical Gift Cards','Retail','','Younis Alzadjali','??? ???? ??????','','???????','MA','130','OM','1781-1','po_received','shipped','','-1740','','-1740',0.07920999825000763,'2018-02-18 05:49:36',0),('Mayada','Al Zadjali','Branches Operations Department','795','BJRV0268','1727','Remittance - Out ward Staff','98698697228846','Oman Gift Cards','Muscat Grand Mall Gift Card (50 OMR)',1,'','Physical Gift Cards','Retail','','Mayada Al Zadjali','Oman Arab Bank','Head Office-Ghoubra','Muscat','MA','112','OM','1783-1','po_received','shipped','','-870','','-870',0.07920999825000763,'2018-02-18 23:44:04',0),('Mahmood','Al-Balushi','Logistics Services Department','791115','JMNW5678','128','Store Staff','9860096892120029','Oman Gift Cards','Lulu Hypermarket (40 OMR)',3,'','Physical Gift Cards','Retail','oab head office','Mahmood Al-Balushi','al ghubra','','al ghubrah','MA','112','OM','1784-1','po_received','shipped','','-2205','','-2205',0.07920999825000763,'2018-02-19 01:54:05',0),('Fatima','Alobaidani','Al Khuwair Commercial Market','3124','CJSY0158','1054','Universal Customers Care','9863395788149','Oman Gift Cards','Lulu Hypermarket (50 OMR)',1,'','Physical Gift Cards','Retail','','Fatima Alobaidani','alkhuwair commercial','alkhuwair commercial br','??????? ????????','MA','111','OM','1785-1','po_received','shipped','','-870','','-870',0.07920999825000763,'2018-02-19 05:39:02',0),('Hassan','Alwahaibi','Credit Documentation Department','7448','CLTY0149','1006','Credit Documentation Processing Staff','98696892548517','Oman Merchandise - Live','Dualshock 4 wireless controller V2',1,'','Electronics','Controllers','','Hassan Alwahaibi','oman arab bank','','Head Office- ALGhubra','MA','2010 - 112','OM','1787-1','shipped','shipped','','-615','','-615',0.07920999825000763,'2018-02-20 06:11:30',0),('Mohamed','AlZadjali','Al Khuwair Commercial Market','3124','CJQS5678','2087','Cashier-(Teller)','98611199765555','Oman Gift Cards','Lulu Hypermarket (50 OMR)',2,'','Physical Gift Cards','Retail','','Mohamed AlZadjali','?????? ??? ?????? 906 ??? ????? 4111','al khuwair commercial branch','muscat','MA','1169','OM','1788-1','new','shipped','','-1740','','-1740',0.07920999825000763,'2018-02-21 05:43:46',0),('Muzna','Al Maashari','Al Qurum','3106','DMPZ0135','2092','Universal Customers Care','986+98697727855','Oman Merchandise - Live','Motion Sand 3D Sand Box - Safari',1,'','Toys & Games','Crafts','','Muzna Al Maashari','OMAN/OAB-QURUM BRANCH','OMAN/MUSCAT','MUSCAT/QURUM','MA','PC 2010 POX 112','OM','1790-1','po_sent','po_sent','','-95','','-95',0.07920999825000763,'2018-02-22 03:58:10',0),('Mahmood','Alnbhani','IT Operation Department','5987','DFPX0489','1103','Data Center Operator','98696899560777','Oman Merchandise - Live','2000W Vacuum Cleaner 18 L Dust Capacity',1,'','Appliances','Vacuums & Floor Care','Oman Arab Bank','Mahmood Alnbhani','muscat','alghubrah','Muscat','MA','111','OM','1793-1','po_sent','shipped','','-795','','-795',0.07920999825000763,'2018-02-26 09:38:03',0),('Nidhal','AL Zadjali','Retail Credit Department','8251','BNPW0569','1658','Business Analytics Officer','98695692010','Oman Merchandise - Live','Givenchy Blue Label Men 100 Ml',1,'','Beauty','Men\'s','','Nidhal AL Zadjali','Oman Arab Bank Main Office','3rd Floor','Muscat','MA','000000','OM','1794-1','po_sent','po_received','','-240','','-240',0.07920999825000763,'2018-02-26 23:06:07',0),('Fatma','AL Jazmi','Khasab','3155','GMPV1348','1637','Universal Customers Care','98681193302327','Oman Merchandise - Live','8 Lite 4G 5.2 Inch Display Kirin',1,'','Electronics','Phones','oab','Fatma AL Jazmi','????? ???','','???? ???','MU','811','OM','1798-1','po_sent','shipped','','-1300','','-1300',0.07920999825000763,'2018-02-27 05:19:45',0);
/*!40000 ALTER TABLE `clientsdailyorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `NameAr` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Site` varchar(500) DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`,`Name`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'OAB','Pan','????? ??????','www.ada.com',0),(2,'Nat Health','Amman','????? ????','http://www.nathealth.asdnet',1),(4,'test','Amman','????','www.fghj.com',1),(6,'Elhaj','Jordan','???????','www.fghj.com',1),(11,'NatHealth','Jordan','????? ????','www.wee.com',0),(12,'Ayas Company','Jordan','???','www.aya.com',1),(13,'Pink Fairy','Turkey','??? ????','www.pinkfairy.com',1),(14,'Zain','Jordan','???','www.zain.jo',0),(15,'AAA','Pan','????? ??????','www.ada.com',1),(16,'ABC','Jordan','????? ????','www.asdasd.com',1),(17,'ABCD','Jordan','???','www.aya.com',1),(18,'PWC','Turkey','??? ????','www.pinkfairy.com',1),(32,'we','qwe',NULL,NULL,1),(33,'Company','Bahrain','','',1),(37,'Odai','Aruba','','',1),(38,'company bulk','Jordan','','www.pc.com',0),(39,'company bulk2','Oman','','www.pc.com',1),(40,'lama','jordan','','lama.com',0),(41,'Duha','jordan','','lama.com',0),(44,'Nour','Jordan','نور','www.nour.com',1),(46,'Esm Sherkeh mo3ayan','Algeria','اسم شركة معين بالعربي','',0),(50,'Esm Sherkeh mo3ayan2','Andorra','اسم شركة معين بالعربي2','www.batata.com',0);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `PointValue_Rate` double NOT NULL,
  `USDRate` double NOT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  `ISO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (10,'OMAwwrrr','Andorra',70,1,0,'OMR'),(12,'JOR','JORDAN',0.79522,1,0,'JO'),(13,'OMA','ssss',0.7556,1,0,''),(14,'OMR','eses',1.852,0.771,1,''),(15,'OMAwwrrr','Afghanistan',70,1,0,'OM'),(16,'OMAwwrrr','Albania',70,1,0,'OM'),(17,'OMAwwrrr','--Select Country--',702,1,1,'OM'),(18,'OMAwwrrr','Antarctica',70,1,1,'OM'),(19,'Batata','Antarctica',20.254,15.1,0,'BA');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dailyorders`
--

DROP TABLE IF EXISTS `dailyorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dailyorders` (
  `ID` varchar(45) NOT NULL,
  `PIN` varchar(45) DEFAULT NULL,
  `EmployeeID` varchar(45) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `DeptName` varchar(100) DEFAULT NULL,
  `DeptCode` varchar(45) DEFAULT NULL,
  `JobTitle` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `CatalogName` varchar(100) DEFAULT NULL,
  `RewardName` varchar(500) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `Details` varchar(1500) DEFAULT NULL,
  `HighestLevelCategory` varchar(55) DEFAULT NULL,
  `LowestLevelCategory` varchar(55) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Name` varchar(70) DEFAULT NULL,
  `Address1` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `P2MOrderNumber` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `CStatus` varchar(45) DEFAULT NULL,
  `DiscountCoupon` varchar(45) DEFAULT NULL,
  `RedemptionAmount` double DEFAULT '0',
  `DiscountApplied` varchar(45) DEFAULT NULL,
  `MemberPaid` varchar(45) DEFAULT '0',
  `PointBillingRate` double DEFAULT '0',
  `OrderDate` date DEFAULT NULL,
  `GRSOrderNum` varchar(45) DEFAULT NULL,
  `ItemNumber` varchar(45) DEFAULT NULL,
  `ItemDescription` varchar(100) DEFAULT NULL,
  `ItemOption` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `ProductCost` double DEFAULT '0',
  `CatalogCode` varchar(45) DEFAULT NULL,
  `DateProcessed` varchar(45) DEFAULT NULL,
  `QuantityShipped` int(11) DEFAULT '0',
  `TrackingNumber` varchar(45) DEFAULT NULL,
  `CourierName` varchar(50) DEFAULT NULL,
  `Memo` varchar(500) DEFAULT NULL,
  `Note` varchar(100) DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PIN_UNIQUE` (`PIN`),
  UNIQUE KEY `P2M Order Number_UNIQUE` (`P2MOrderNumber`),
  UNIQUE KEY `GRS Order Num_UNIQUE` (`GRSOrderNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailyorders`
--

LOCK TABLES `dailyorders` WRITE;
/*!40000 ALTER TABLE `dailyorders` DISABLE KEYS */;
INSERT INTO `dailyorders` VALUES ('1774-1','CMTZ1357','1139','Fakhri','Al Shidad','Islamic Banking Unit','771','Front Office Clerk','98696899090445','Oman Merchandise - Live','4 in 1 Hair Styler 650 W',1,'','Beauty','Personal Care','AL YUSR ISLAMIC BANKINGG','Fakhri Al Shidad','SALALAH','SALALAH','SALALAH','JA','211','OM','1774-1','shipped','shipped','',325,'','325',0.07920999825000763,'2018-02-14',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,0),('1775-1','GPSX1679','1848','Maryam','Al Dairi','Branches Operations Department','795','Open Accounts & Data Quality Officer','986201092404039','Oman Gift Cards','Home Centre OMR50',1,'','Virtual Gift Cards','Retail','oman arab bank','Maryam Al Dairi','muscat','','Ozaiba','MA','130','OM','1775-1','shipped','shipped','',650,'','650',0.07920999825000763,'2018-02-14',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,0),('1776-1','HTWY0279','394','Aida','Al-Musharfi','Retail Credit Department','8251','Head of Personal Loan Section','98696899434903','Oman Gift Cards','Lulu Hypermarket (40 OMR)',1,'','Physical Gift Cards','Retail','','Aida Al-Musharfi','omanarabbank','الغبرة','مسقط','MA','2010','Oman','1776-1','','shipped','',735,'','735',0.07920999825000763,'2018-02-20',NULL,'OM-LUH0002','Lulu Hypermarket (40 OMR)','','Aida.Al-Musharfi@oman-arabbank.com',40,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('1778-1','HNRW0145','389','Sultan','Al-Ghafri','Regional Management &amp; Branch Support Department','8214','Regional Manager','98696899473375','Oman Merchandise - Live','Samsung Galaxy S7 Edge Dual Sim - 32GB,4GB RAM, 4G LTE, Gold',1,'','Electronics','Phones','','Sultan Al-Ghafri','Sultanate of oman','','Ibri','ZA','511','OM','1777-1','po_received','shipped','',2675,'','2675',0.07920999825000763,'2018-02-15',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,0),('1779-2','DFJQ0478','467','Zubaida','Alzadjali','Al Rusayl','3117','Universal Customers Care','9860098692290468','Oman Gift Cards','Joyalukkas Jewlary Gift Card (150 OMR)',1,'','Physical Gift Cards','Gifts','بنك عمان العربي فرع الرسيل','Zubaida Alzadjali','1124','ا   روي 1124','السيب','MA','روي112','Oman','1779-1','','shipped','',2200,'','2200',0.07920999825000763,'2018-02-20',NULL,'OM-JJ003','Joyalukkas Jewlary Gift Card (150 OMR)','','Zubaida.Al-Zadjali@oman-arabbank.com',150,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('1781-1','DFGJ1478','571','Younis','Alzadjali','Recruitment & Manpower Planning Section','85183','Human Resources Generalist','98600099731846','Oman Gift Cards','Lulu Hypermarket (50 OMR)',2,'','Physical Gift Cards','Retail','','Younis Alzadjali','بنك عمان العربي','','العذيبة','MA','130','Oman','1781-1','','shipped','',1740,'','1740',0.07920999825000763,'2018-02-20',NULL,'OM-LUH0003','Lulu Hypermarket (50 OMR)','','Younis.Al-Zadjali@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('1783-1','BJRV0268','1727','Mayada','Al Zadjali','Branches Operations Department','795','Remittance - Out ward Staff','98698697228846','Oman Gift Cards','Muscat Grand Mall Gift Card (50 OMR)',1,'','Physical Gift Cards','Retail','','Mayada Al Zadjali','Oman Arab Bank','Head Office-Ghoubra','Muscat','MA','112','Oman','1783-1','','shipped','',870,'','870',0.07920999825000763,'2018-02-20',NULL,'OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','Miyada.Al-Zadjali@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('1784-1','JMNW5678','128','Mahmood','Al-Balushi','Logistics Services Department','791115','Store Staff','9860096892120029','Oman Gift Cards','Lulu Hypermarket (40 OMR)',3,'','Physical Gift Cards','Retail','oab head office','Mahmood Al-Balushi','al ghubra','','al ghubrah','MA','112','Oman','1784-1','','shipped','',2205,'','2205',0.07920999825000763,'2018-02-20',NULL,'OM-LUH0002','Lulu Hypermarket (40 OMR)','','Mahmood.Faqeer@oman-arabbank.com',40,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('1785-1','CJSY0158','1054','Fatima','Alobaidani','Al Khuwair Commercial Market','3124','Universal Customers Care','9863395788149','Oman Gift Cards','Lulu Hypermarket (50 OMR)',1,'','Physical Gift Cards','Retail','','Fatima Alobaidani','alkhuwair commercial','alkhuwair commercial br','الموالح الجنوبية','MA','111','Oman','1785-1','','shipped','',870,'','870',0.07920999825000763,'2018-02-20',NULL,'OM-LUH0003','Lulu Hypermarket (50 OMR)','','Fatima.Al-Obaidani@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('1787-1','CLTY0149','1006','Hassan','Alwahaibi','Credit Documentation Department','7448','Credit Documentation Processing Staff','98696892548517','Oman Merchandise - Live','Dualshock 4 wireless controller V2',1,'','Electronics','Controllers','','Hassan Alwahaibi','oman arab bank','','Head Office- ALGhubra','MA','2010 - 112','OM','1787-1','shipped','shipped','',615,'','615',0.07920999825000763,'2018-02-20',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,0),('1788-1','CJQS5678','2087','Mohamed','AlZadjali','Al Khuwair Commercial Market','3124','Cashier-(Teller)','98611199765555','Oman Gift Cards','Lulu Hypermarket (50 OMR)',2,'','Physical Gift Cards','Retail','','Mohamed AlZadjali','الخوير رقم المنزل 906 رقم السكة 4111','al khuwair commercial branch','muscat','MA','1169','Oman','1788-1','','shipped','',1740,'','1740',0.07920999825000763,'2018-03-05',NULL,'OM-LUH0003','Lulu Hypermarket (50 OMR)','','Mohammed.Abdulrahman@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('1790-1','DMPZ0135','2092','Muzna','Al Maashari','Al Qurum','3106','Universal Customers Care','986+98697727855','Oman Merchandise - Live','Motion Sand 3D Sand Box - Safari',1,'','Toys & Games','Crafts','','Muzna Al Maashari','OMAN/OAB-QURUM BRANCH','OMAN/MUSCAT','MUSCAT/QURUM','MA','PC 2010 POX 112','OM','1790-1','po_sent','po_sent','',95,'','95',0.07920999825000763,'2018-02-22',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,0),('1793-1','DFPX0489','1103','Mahmood','Alnbhani','IT Operation Department','5987','Data Center Operator','98696899560777','Oman Merchandise - Live','2000W Vacuum Cleaner 18 L Dust Capacity',1,'','Appliances','Vacuums & Floor Care','Oman Arab Bank','Mahmood Alnbhani','muscat','alghubrah','Muscat','MA','111','OM','1793-1','po_sent','shipped','',795,'','795',0.07920999825000763,'2018-02-26',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,0),('1794-1','BNPW0569','1658','Nidhal','AL Zadjali','Retail Credit Department','8251','Business Analytics Officer','98695692010','Oman Merchandise - Live','Givenchy Blue Label Men 100 Ml',1,'','Beauty','Men\'s','','Nidhal AL Zadjali','Oman Arab Bank Main Office','3rd Floor','Muscat','MA','000000','OM','1794-2','po_sent','po_received','',240,'','240',0.07920999825000763,'2018-02-26',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,0),('1798-1','GMPV1348','1637','Fatma','AL Jazmi','Khasab','3155','Universal Customers Care','98681193302327','Oman Merchandise - Live','8 Lite 4G 5.2 Inch Display Kirin',1,'','Electronics','Phones','oab','Fatma AL Jazmi','????? ???','','???? ???','MU','811','OM','1798-1','po_sent','shipped','',1300,'','1300',0.07920999825000763,'2018-02-27',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,0),('3456972-1',NULL,'1848','Maryam','Al Dairi',NULL,NULL,NULL,'986201092404039','Oman Gift Cards',NULL,1,NULL,NULL,NULL,'oman arab bank',NULL,'2010','','Ozaiba','MA','100','Oman','1730-1','',NULL,NULL,0,NULL,'0',1,'2018-02-01','3456972-1','OM-LUH0003','Lulu Hypermarket (50 OMR)','','Maryam.Al-Dairi@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3456973-1',NULL,'1848','Maryam','Al Dairi',NULL,NULL,NULL,'986201092404039','Oman Gift Cards',NULL,3,NULL,NULL,NULL,'oman arab bank',NULL,'2010','','Ozaiba','MA','100','Oman','1731-1','',NULL,NULL,0,NULL,'0',1,'2018-02-01','3456973-1','OM-LUH0003','Lulu Hypermarket (50 OMR)','','Maryam.Al-Dairi@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3473463-1',NULL,'1985','Jamil','Sawwas',NULL,NULL,NULL,'962962788541605','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'Nathealth',NULL,'شارع المدينة المنورة مجمع طول كرم التجاري','','عمان','AM','13111','Jordan','1758-1','',NULL,NULL,0,NULL,'0',1,'2018-02-08','3473463-1','MAN0006','Al Manaseer Gift Card (200 JD)','','j.sawas@nathealth.net',200,'JORDAN_GC',NULL,0,'','','',NULL,0),('3479187-1',NULL,'1770','Haitham','AL Mukhaini',NULL,NULL,NULL,'9860196611060','Oman Gift Cards',NULL,2,NULL,NULL,NULL,'بنك عمان العربي',NULL,'رقم السكة : 683 رقم المنزل : 4477','ولاية بوشر / الغبرة الشمالية','الغبرة الشماليه','MA','130','Oman','1763-1','',NULL,NULL,0,NULL,'0',1,'2018-02-11','3479187-1','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','Haitham.Al-Mukhaini@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3485846-1',NULL,'821','Aisha','Alobaidani',NULL,NULL,NULL,'98696899792810','Oman Gift Cards',NULL,2,NULL,NULL,NULL,'oman arab bank-muscat city center branch',NULL,'muscat','al mawaleh','al seeb','MA','2010','Oman','1753-1','',NULL,NULL,0,NULL,'0',1,'2018-02-14','3485846-1','OM-JJ003','Joyalukkas Jewlary Gift Card (150 OMR)','','Aisha.Al-Obaidani@oman-arabbank.com',150,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3485847-1',NULL,'984','Moosa','Alamri',NULL,NULL,NULL,'9860092702344','Oman Gift Cards',NULL,2,NULL,NULL,NULL,'',NULL,'الغبرة','الغبرة','بوشر','MA','2010 / 112','Oman','1756-1','',NULL,NULL,0,NULL,'0',1,'2018-02-14','3485847-1','OM-CAR008','Carrefour Voucher (50 OMR)','','Moosa.Al-Amri@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3485847-2',NULL,'984','Moosa','Alamri',NULL,NULL,NULL,'9860092702344','Oman Gift Cards',NULL,2,NULL,NULL,NULL,'',NULL,'الغبرة','الغبرة','بوشر','MA','2010 / 112','Oman','1756-2','',NULL,NULL,0,NULL,'0',1,'2018-02-14','3485847-2','OM-LUH0003','Lulu Hypermarket (50 OMR)','','Moosa.Al-Amri@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3485848-1',NULL,'115','Meya','Al-Rashdi',NULL,NULL,NULL,'98696899449974','Oman Gift Cards',NULL,1,NULL,NULL,NULL,'',NULL,'AL AZAIBA','AZAIBA','AZAIBA','MA','100','Oman','1767-1','',NULL,NULL,0,NULL,'0',1,'2018-02-14','3485848-1','OM-HC001','Home Center Gift Card (50 OMR)','','maiya.alrashdi@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3485849-1',NULL,'115','Meya','Al-Rashdi',NULL,NULL,NULL,'98696899449974','Oman Gift Cards',NULL,1,NULL,NULL,NULL,'',NULL,'AL AZAIBA','AZAIBA','AZAIBA','MA','100','Oman','1768-1','',NULL,NULL,0,NULL,'0',1,'2018-02-14','3485849-1','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','maiya.alrashdi@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3485852-1',NULL,'1324','Khalifa','Al Yaqoobi',NULL,NULL,NULL,'9860096896651559','Oman Gift Cards',NULL,2,NULL,NULL,NULL,'OAB',NULL,'Muscat','OAB head office','ALGHUBRA HEAD OFFICE','MA','2240','Oman','1773-1','',NULL,NULL,0,NULL,'0',1,'2018-02-14','3485852-1','OM-LUH0003','Lulu Hypermarket (50 OMR)','','Khalifa.Al-yaqoubi@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3495559-1',NULL,'1984','Wala','Ibrahim',NULL,NULL,NULL,'962962962797637912','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'',NULL,'ضاحية الامير حسن - عرجان الشرقية - ش. شرحبيل بن حسنة - عمارة رقم 6أ الطابق 1','','amman','AM','11','Jordan','1786-1','',NULL,NULL,0,NULL,'0',1,'2018-02-19','3495559-1','MAN0003','Al Manaseer Gift Card (20 JD)','','w.ibrahim@nathealth.net',20,'JORDAN_GC',NULL,0,'','','',NULL,0),('3497624-2',NULL,'467','Zubaida','Alzadjali',NULL,NULL,NULL,'9860098692290468','Oman Gift Cards',NULL,1,NULL,NULL,NULL,'بنك عمان العربي فرع الرسيل',NULL,'1124','ا   روي 1124','السيب','MA','روي112','Oman','1779-2','',NULL,NULL,0,NULL,'0',1,'2018-02-20','3497624-2','OM-JJ001','Joyalukkas Jewlary Gift Card (50 OMR)','','Zubaida.Al-Zadjali@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3502721-1',NULL,'1956','Maisa','Amarneh',NULL,NULL,NULL,'962962786919026','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'nathealth',NULL,'شارع المدينة المنورة مقابل ابو جبارة','عمارة طول كرم','عمان','AM','962','Jordan','1789-1','',NULL,NULL,0,NULL,'0',1,'2018-02-21','3502721-1','QAZ0046','Zara /Qanz Card (45 JD)','','m.amarneh@nathealth.net',45,'JORDAN_GC',NULL,0,'','','',NULL,0),('3509933-1',NULL,'1747','Osama','Alijel',NULL,NULL,NULL,'96200962799953331','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'نات هيلث',NULL,'عمان شارع المدينة المنورة / شركة نات هيلث عمارة 194','عمان شارع المدينة المنورة / شركة نات هيلث عمارة 194','عمان شارع المدينة المنورة','AM','750','Jordan','1791-1','',NULL,NULL,0,NULL,'0',1,'2018-02-25','3509933-1','MAN0005','Al Manaseer Gift Card (100 JD)','','osama.abd@nathealth.net',100,'JORDAN_GC',NULL,0,'','','',NULL,0),('3509939-1',NULL,'2088','Reham','Al Khateeb',NULL,NULL,NULL,'9620795091345','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'',NULL,'عمان - شارع المدينة المنورة - مجمع طولكرم - نات هيلث','','amman','AM','11121','Jordan','1792-1','',NULL,NULL,0,NULL,'0',1,'2018-02-25','3509939-1','MAN0004','Al Manaseer Gift Card (50 JD)','','r.Al-khatib@nathealth.net',50,'JORDAN_GC',NULL,0,'','','',NULL,0),('3528419-1',NULL,'1992','Hamdi','Mohammad',NULL,NULL,NULL,'96200962790900985','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'Nathealth',NULL,'عمان - شارع المدينة المنورة','','عمان','AM','0000','Jordan','1802-1','',NULL,NULL,0,NULL,'0',1,'2018-03-03','3528419-1','MAN0003','Al Manaseer Gift Card (20 JD)','','h.mohammad@nathealth.net',20,'JORDAN_GC',NULL,0,'','','',NULL,0),('3531839-1',NULL,'2271','Intisar','AL Uraimi',NULL,NULL,NULL,'9860496794723','Oman Gift Cards',NULL,1,NULL,NULL,NULL,'',NULL,'الموالح رقم المنزل 5452 رقم السكة 1770','السيب','مسقط','MA','114','Oman','1805-1','',NULL,NULL,0,NULL,'0',1,'2018-03-05','3531839-1','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','Intisaar.Al-Araimi@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3532099-1',NULL,'1751','Ayman','Hassan',NULL,NULL,NULL,'96207962779999861','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'الشركة الوطنية لادارة التأمينات الصحية',NULL,'ضاحية الامير حسن','','عمان','AM','750','Jordan','1810-1','',NULL,NULL,0,NULL,'0',1,'2018-03-05','3532099-1','MAN0005','Al Manaseer Gift Card (100 JD)','','a.hasan@nathealth.net',100,'JORDAN_GC',NULL,0,'','','',NULL,0),('3535396-1',NULL,'1533','Yousuf','AL Housni',NULL,NULL,NULL,'98696896222216','Oman Gift Cards',NULL,1,NULL,NULL,NULL,'',NULL,'رقم المنزل : 62','AZAIBA','AZAIBA','MA','100','Oman','1803-1','',NULL,NULL,0,NULL,'0',1,'2018-03-06','3535396-1','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','Yuosef.Al-Hosni@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3535397-1',NULL,'1740','Rabab','AL Lawati',NULL,NULL,NULL,'98698699545005','Oman Gift Cards',NULL,1,NULL,NULL,NULL,'بنك عمان العربي',NULL,'المبنى الرئيسي','بنك عمان العربي','الغبرة الشمالية','MA','2010/114','Oman','1809-1','',NULL,NULL,0,NULL,'0',1,'2018-03-06','3535397-1','OM-HC003','Home Center Gift Card (150 OMR)','','Rabab.Al-Lawati@oman-arabbank.com',150,'OM_GIFTCARDS',NULL,0,'','','',NULL,0),('3535418-1',NULL,'1707','Rana','Al_Momani',NULL,NULL,NULL,'9629620795025017','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'Nathealth',NULL,'ضاحية الاقصى','Nathealth','amman','AM','11953','Jordan','1811-1','',NULL,NULL,0,NULL,'0',1,'2018-03-06','3535418-1','CAR0003','Carrefour Voucher (50 JD)','','r.momani@nathealth.net',50,'JORDAN_GC',NULL,0,'','','',NULL,0),('3535418-2',NULL,'1707','Rana','Al_Momani',NULL,NULL,NULL,'9629620795025017','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'Nathealth',NULL,'ضاحية الاقصى','Nathealth','amman','AM','11953','Jordan','1811-2','',NULL,NULL,0,NULL,'0',1,'2018-03-06','3535418-2','CAR0002','Carrefour Voucher (20 JD)','','r.momani@nathealth.net',20,'JORDAN_GC',NULL,0,'','','',NULL,0),('3535425-1',NULL,'1707','Rana','Al_Momani',NULL,NULL,NULL,'962962795025017','Jordan Gift Cards',NULL,1,NULL,NULL,NULL,'Nathealth',NULL,'ضاحية الاقصى','Nathealth','amman','AM','11953','Jordan','1813-1','',NULL,NULL,0,NULL,'0',1,'2018-03-06','3535425-1','CAR0003','Carrefour Voucher (50 JD)','','r.momani@nathealth.net',50,'JORDAN_GC',NULL,0,'','','',NULL,0),('3538544-1',NULL,'2385','Amaal','Al Mukhaini',NULL,NULL,NULL,'98698692337366','Oman Gift Cards',NULL,1,NULL,NULL,NULL,'oman arab bank',NULL,'الفرع  الرئيسي الغبره الشماليه -بنك عمان العربي','','الغبره الشماليه','MA','2010/114','Oman','1814-1','',NULL,NULL,0,NULL,'0',1,'2018-03-07','3538544-1','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','Amaal.Al-Mukhaini@oman-arabbank.com',50,'OM_GIFTCARDS',NULL,0,'','','',NULL,0);
/*!40000 ALTER TABLE `dailyorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `NameAr` varchar(100) DEFAULT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `Comp_ID_idx` (`Company_Id`),
  CONSTRAINT `Comp_ID` FOREIGN KEY (`Company_Id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1010,'General Manager','??????? ??????',2,0),(3109,'Salalah','?????',1,0),(3152,'Al Suwaiq','??????? ??????',1,0),(73357,'HR','??????? ???????',2,0),(75257,'IT','???????????',2,0),(75357,'MGR','???????',1,0),(75787,'Financial','????????',1,0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RewardName` varchar(500) DEFAULT NULL,
  `ShippingCost` double DEFAULT NULL,
  `HandlingCost` double DEFAULT NULL,
  `ServiceCharge` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  `SKU` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=857 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,NULL),(2,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,NULL),(3,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,NULL),(4,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0001'),(5,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0002'),(6,'Four Seasons e-Gift Card (300 OMR)',1,6,7,14,0,'OM-FS0003'),(7,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0004'),(8,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0005'),(9,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0006'),(10,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0007'),(11,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0008'),(12,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0009'),(13,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0010'),(14,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0011'),(15,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0012'),(16,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0013'),(17,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0014'),(18,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0015'),(19,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0016'),(20,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0017'),(21,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0018'),(22,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0019'),(23,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0020'),(24,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0021'),(25,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0022'),(26,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0023'),(27,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0024'),(28,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0025'),(29,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0026'),(30,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0027'),(31,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0028'),(32,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0029'),(33,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0030'),(34,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0031'),(35,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0032'),(36,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0033'),(37,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0034'),(38,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0035'),(39,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0036'),(40,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0037'),(41,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0038'),(42,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0039'),(43,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0040'),(44,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0041'),(45,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0042'),(46,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0043'),(47,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0044'),(48,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0045'),(49,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0001'),(50,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0002'),(51,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0003'),(52,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0004'),(53,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0005'),(54,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0006'),(55,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0001'),(56,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0002'),(57,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0003'),(58,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0004'),(59,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0005'),(60,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0006'),(61,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0007'),(62,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0008'),(63,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0009'),(64,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VOX0010'),(65,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0029'),(66,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0030'),(67,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0031'),(68,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0032'),(69,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0033'),(70,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0034'),(71,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0035'),(72,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0036'),(73,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0037'),(74,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0038'),(75,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0039'),(76,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0040'),(77,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0041'),(78,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0042'),(79,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0043'),(80,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0044'),(81,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0045'),(82,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0046'),(83,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0047'),(84,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0048'),(85,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0049'),(86,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0050'),(87,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0051'),(88,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0052'),(89,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0053'),(90,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0054'),(91,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0055'),(92,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CH0056'),(93,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0001'),(94,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0002'),(95,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0003'),(96,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0004'),(97,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ001'),(98,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ002'),(99,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ003'),(100,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ004'),(101,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ005'),(102,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ006'),(103,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ007'),(104,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ008'),(105,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ009'),(106,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ010'),(107,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ011'),(108,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ012'),(109,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ013'),(110,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ014'),(111,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ015'),(112,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ016'),(113,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ017'),(114,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ018'),(115,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ019'),(116,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ020'),(117,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ021'),(118,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ022'),(119,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ023'),(120,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ024'),(121,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ025'),(122,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ026'),(123,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ027'),(124,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMZ028'),(125,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0005'),(126,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0006'),(127,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0007'),(128,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0008'),(129,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0009'),(130,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0010'),(131,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0011'),(132,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0012'),(133,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0013'),(134,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0014'),(135,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0015'),(136,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0016'),(137,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0017'),(138,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0018'),(139,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0019'),(140,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0020'),(141,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0021'),(142,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CHI0022'),(143,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM001'),(144,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM003'),(145,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM005'),(146,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM007'),(147,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM009'),(148,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM011'),(149,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM013'),(150,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM015'),(151,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM017'),(152,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM019'),(153,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM021'),(154,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM023'),(155,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM025'),(156,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM002'),(157,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM004'),(158,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM006'),(159,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM008'),(160,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM010'),(161,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM012'),(162,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM014'),(163,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM016'),(164,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM018'),(165,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM020'),(166,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM022'),(167,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM024'),(168,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MGM026'),(169,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR001'),(170,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR002'),(171,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR003'),(172,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR004'),(173,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR005'),(174,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR006'),(175,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR007'),(176,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR008'),(177,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR009'),(178,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR010'),(179,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR011'),(180,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR012'),(181,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR013'),(182,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR014'),(183,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR015'),(184,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR016'),(185,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR017'),(186,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR018'),(187,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS001'),(188,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS002'),(189,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS003'),(190,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS004'),(191,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS005'),(192,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS006'),(193,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS007'),(194,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS008'),(195,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS009'),(196,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS010'),(197,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS011'),(198,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS012'),(199,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS013'),(200,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS014'),(201,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS015'),(202,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS016'),(203,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS017'),(204,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS018'),(205,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS019'),(206,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS020'),(207,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS021'),(208,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS022'),(209,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS023'),(210,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS024'),(211,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS025'),(212,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-OAS026'),(213,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-SHR001'),(214,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-SHR002'),(215,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-JJ001'),(216,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-JJ002'),(217,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-JJ003'),(218,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-JJ004'),(219,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-JJ005'),(220,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-JJ006'),(221,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-HC001'),(222,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-HC002'),(223,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-HC003'),(224,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-HC004'),(225,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-HC005'),(226,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0002'),(227,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0003'),(228,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0004'),(229,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BHS0002'),(230,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BHS0003'),(231,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BHS0004'),(232,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0001'),(233,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0001'),(234,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0002'),(235,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0003'),(236,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0004'),(237,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0005'),(238,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0006'),(239,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0007'),(240,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0008'),(241,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0009'),(242,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0010'),(243,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0011'),(244,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0012'),(245,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0013'),(246,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0014'),(247,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0015'),(248,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0016'),(249,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0017'),(250,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0018'),(251,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0019'),(252,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0020'),(253,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0021'),(254,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0022'),(255,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0023'),(256,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0024'),(257,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0025'),(258,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0026'),(259,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0028'),(260,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0029'),(261,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0030'),(262,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0031'),(263,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0032'),(264,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0033'),(265,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0034'),(266,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0035'),(267,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0036'),(268,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0037'),(269,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0038'),(270,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0039'),(271,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0040'),(272,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0041'),(273,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0042'),(274,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0043'),(275,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0044'),(276,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0045'),(277,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'NT0001'),(278,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'NT0002'),(279,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'NT0003'),(280,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAC0001'),(281,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAC0002'),(282,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAC0003'),(283,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAC0004'),(284,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0001'),(285,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0002'),(286,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0003'),(287,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0009'),(288,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0010'),(289,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0011'),(290,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0013'),(291,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0014'),(292,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0015'),(293,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0016'),(294,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0017'),(295,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0018'),(296,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0019'),(297,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VS0001'),(298,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VS0002'),(299,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VS0003'),(300,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MC0001'),(301,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MC0002'),(302,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MC0003'),(303,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MC0004'),(304,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BBW0001'),(305,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BBW0002'),(306,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BBW0003'),(307,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MWC0001'),(308,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MWC0002'),(309,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MWC0003'),(310,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAJ0001'),(311,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAJ0002'),(312,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAJ0003'),(313,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAJ0004'),(314,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'DAJ0001'),(315,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'DAJ0002'),(316,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'DAJ0003'),(317,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MTJ0001'),(318,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'RG0001'),(319,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'RG0002'),(320,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BOB0001'),(321,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BOB0002'),(322,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BOB0003'),(323,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BOB0004'),(324,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MS0001'),(325,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MS0002'),(326,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MS0003'),(327,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MS0004'),(328,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0001'),(329,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0002'),(330,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0003'),(331,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0004'),(332,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0005'),(333,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0006'),(334,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0007'),(335,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0008'),(336,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LUH0009'),(337,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0001'),(338,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0002'),(339,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0003'),(340,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0004'),(341,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0005'),(342,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0006'),(343,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0007'),(344,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0008'),(345,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0009'),(346,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VOX0010'),(347,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0020'),(348,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0021'),(349,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0022'),(350,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0023'),(351,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0024'),(352,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0025'),(353,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0029'),(354,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0030'),(355,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0031'),(356,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0032'),(357,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0033'),(358,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0034'),(359,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0035'),(360,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0036'),(361,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0037'),(362,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0038'),(363,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0039'),(364,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0040'),(365,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0041'),(366,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0042'),(367,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0043'),(368,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0044'),(369,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0045'),(370,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0046'),(371,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0047'),(372,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0048'),(373,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0049'),(374,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0050'),(375,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0051'),(376,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0052'),(377,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0053'),(378,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0054'),(379,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0055'),(380,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CH0056'),(381,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CHI0001'),(382,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CHI0002'),(383,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CHI0003'),(384,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CHI0004'),(385,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0002'),(386,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0003'),(387,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0004'),(388,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BHS0003'),(389,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BHS0004'),(390,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR0001'),(391,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-NT0001'),(392,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-NT0002'),(393,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-NT0003'),(394,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MAC0001'),(395,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MAC0002'),(396,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MAC0003'),(397,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MAC0004'),(398,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0001'),(399,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0002'),(400,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0003'),(401,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0009'),(402,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0010'),(403,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0011'),(404,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0013'),(405,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0014'),(406,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0015'),(407,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0016'),(408,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0017'),(409,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0018'),(410,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0019'),(411,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VS0001'),(412,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VS0002'),(413,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-VS0003'),(414,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MC0001'),(415,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MC0002'),(416,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MC0003'),(417,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MC0004'),(418,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BBW0001'),(419,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BBW0002'),(420,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BBW0003'),(421,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MWC0001'),(422,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MWC0002'),(423,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MWC0003'),(424,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MAJ0001'),(425,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MAJ0002'),(426,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MAJ0003'),(427,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MAJ0004'),(428,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-DAJ0001'),(429,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-DAJ0002'),(430,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-DAJ0003'),(431,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MTJ0001'),(432,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-RG0001'),(433,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-RG0002'),(434,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BOB0001'),(435,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BOB0002'),(436,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BOB0003'),(437,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BOB0004'),(438,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MS0001'),(439,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MS0002'),(440,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MS0003'),(441,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-MS0004'),(442,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0007'),(443,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0008'),(444,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-LUH0009'),(445,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0020'),(446,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0021'),(447,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0022'),(448,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0023'),(449,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0024'),(450,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0025'),(451,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-BHS0002'),(452,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0005'),(453,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0006'),(454,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0007'),(455,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CAR0002'),(456,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0026'),(457,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0027'),(458,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAN0028'),(459,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM001'),(460,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM003'),(461,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM005'),(462,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM007'),(463,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM009'),(464,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM011'),(465,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM013'),(466,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM015'),(467,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM017'),(468,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM019'),(469,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM021'),(470,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM023'),(471,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM025'),(472,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM002'),(473,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM004'),(474,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM006'),(475,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM008'),(476,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM010'),(477,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM012'),(478,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM014'),(479,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM016'),(480,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM018'),(481,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM020'),(482,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM022'),(483,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM024'),(484,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTM026'),(485,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ001'),(486,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ003'),(487,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ005'),(488,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ007'),(489,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ009'),(490,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ011'),(491,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ013'),(492,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ015'),(493,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ017'),(494,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ019'),(495,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ021'),(496,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ023'),(497,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ025'),(498,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ002'),(499,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ004'),(500,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ006'),(501,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ008'),(502,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ010'),(503,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ012'),(504,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ014'),(505,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ016'),(506,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ018'),(507,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ020'),(508,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ022'),(509,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ024'),(510,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-CTQ026'),(511,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0008'),(512,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0009'),(513,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-APP0010'),(514,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-QAB001'),(515,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMO001'),(516,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-AMO002'),(517,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0027'),(518,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AEO0001'),(519,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AEO0002'),(520,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AEO0003'),(521,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0001'),(522,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0002'),(523,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0003'),(524,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0004'),(525,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AS0002'),(526,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AS0003'),(527,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BHS0002'),(528,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BHS0003'),(529,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BHS0004'),(530,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0001'),(531,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0002'),(532,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0003'),(533,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0005'),(534,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0006'),(535,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0008'),(536,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0009'),(537,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0011'),(538,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0012'),(539,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0014'),(540,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0015'),(541,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0017'),(542,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0018'),(543,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0020'),(544,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0021'),(545,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0023'),(546,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0024'),(547,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0026'),(548,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0027'),(549,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0029'),(550,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0030'),(551,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0032'),(552,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CM0033'),(553,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'COZ0002'),(554,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'COZ0003'),(555,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'DIV0001'),(556,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'DIV0002'),(557,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'DIV0003'),(558,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'DIV0004'),(559,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'EDS0001'),(560,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'EDS0002'),(561,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'EDS0003'),(562,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ELC0002'),(563,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ELC0003'),(564,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'F1G001'),(565,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0001'),(566,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0002'),(567,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0003'),(568,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0004'),(569,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0005'),(570,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0006'),(571,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0007'),(572,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0008'),(573,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0009'),(574,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0010'),(575,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0011'),(576,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0012'),(577,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0013'),(578,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0014'),(579,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0015'),(580,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0016'),(581,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0017'),(582,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0018'),(583,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0019'),(584,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0020'),(585,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0021'),(586,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0022'),(587,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0023'),(588,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0024'),(589,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0025'),(590,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0026'),(591,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'FS0027'),(592,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GCS002'),(593,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GCS005'),(594,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GCS006'),(595,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GCS007'),(596,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GCS008'),(597,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GCS009'),(598,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GCS010'),(599,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GS0002'),(600,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GS0003'),(601,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'HAM0002'),(602,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'HAM0003'),(603,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'IKEA0001'),(604,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'IKEA0002'),(605,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'IKEA0003'),(606,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0001'),(607,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0002'),(608,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0003'),(609,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0004'),(610,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0005'),(611,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0006'),(612,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0007'),(613,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0008'),(614,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0009'),(615,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0010'),(616,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0011'),(617,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0012'),(618,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0013'),(619,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0014'),(620,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'JS0015'),(621,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAC0001'),(622,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAC0002'),(623,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAC0003'),(624,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAN0003'),(625,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAN0004'),(626,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAN0005'),(627,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MAN0006'),(628,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'MOV0001'),(629,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ONE0001'),(630,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ONE0002'),(631,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ONE0003'),(632,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0001'),(633,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0002'),(634,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0003'),(635,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0004'),(636,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0005'),(637,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0006'),(638,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0007'),(639,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0008'),(640,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0009'),(641,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0010'),(642,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0011'),(643,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0012'),(644,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0013'),(645,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0014'),(646,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0015'),(647,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0016'),(648,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0017'),(649,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0018'),(650,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0019'),(651,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0020'),(652,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'REA0003'),(653,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'REA0004'),(654,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'RJ0001'),(655,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SB0001'),(656,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SB0002'),(657,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SB0003'),(658,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SBX0002'),(659,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SBX0003'),(660,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SHA0001'),(661,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SHA0002'),(662,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SHA0003'),(663,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SHA0004'),(664,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SWA0001'),(665,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SWA0002'),(666,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SWA0003'),(667,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TAJ0004'),(668,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TAJ0005'),(669,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VIR0002'),(670,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VS0001'),(671,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VS0002'),(672,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'VS0003'),(673,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0005'),(674,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0006'),(675,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0007'),(676,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'APP0008'),(677,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AS0004'),(678,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AS0005'),(679,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'BHS0001'),(680,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0002'),(681,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'COZ0004'),(682,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'COZ0005'),(683,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0021'),(684,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0022'),(685,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0023'),(686,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0024'),(687,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0025'),(688,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0026'),(689,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0027'),(690,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0028'),(691,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0029'),(692,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0030'),(693,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0031'),(694,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0032'),(695,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0033'),(696,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0034'),(697,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0035'),(698,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0036'),(699,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0037'),(700,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0038'),(701,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0039'),(702,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0040'),(703,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0041'),(704,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0042'),(705,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0043'),(706,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0044'),(707,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0045'),(708,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0046'),(709,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0047'),(710,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0048'),(711,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0049'),(712,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0050'),(713,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0051'),(714,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0052'),(715,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0053'),(716,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0054'),(717,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0055'),(718,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0056'),(719,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0057'),(720,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0058'),(721,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0059'),(722,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0060'),(723,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0061'),(724,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0062'),(725,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0063'),(726,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0064'),(727,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAN0065'),(728,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0066'),(729,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0067'),(730,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0068'),(731,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0069'),(732,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0070'),(733,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0071'),(734,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0072'),(735,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0073'),(736,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0074'),(737,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0075'),(738,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0076'),(739,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0077'),(740,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0078'),(741,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0079'),(742,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0080'),(743,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0081'),(744,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0082'),(745,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0083'),(746,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0084'),(747,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ001'),(748,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ002'),(749,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ003'),(750,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ004'),(751,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ005'),(752,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ006'),(753,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ007'),(754,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ008'),(755,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ009'),(756,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ010'),(757,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ011'),(758,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ012'),(759,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ013'),(760,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ014'),(761,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ015'),(762,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ016'),(763,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ017'),(764,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ018'),(765,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ019'),(766,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ020'),(767,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ021'),(768,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ022'),(769,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ023'),(770,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ024'),(771,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ025'),(772,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ026'),(773,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ027'),(774,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ028'),(775,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ029'),(776,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ030'),(777,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ031'),(778,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'AMZ032'),(779,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GS0004'),(780,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'GS0005'),(781,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'REA0005'),(782,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'REA0006'),(783,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0003'),(784,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0004'),(785,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0005'),(786,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0006'),(787,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SWY003'),(788,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SHR0001'),(789,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SHR0002'),(790,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SHR0003'),(791,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC001'),(792,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM001'),(793,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM002'),(794,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM003'),(795,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM004'),(796,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM005'),(797,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM006'),(798,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM007'),(799,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM008'),(800,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM009'),(801,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM010'),(802,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM011'),(803,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM012'),(804,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM013'),(805,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM014'),(806,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM015'),(807,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM016'),(808,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM017'),(809,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM018'),(810,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM019'),(811,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM020'),(812,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM021'),(813,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM022'),(814,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM023'),(815,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM024'),(816,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM025'),(817,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM026'),(818,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM027'),(819,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM028'),(820,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM029'),(821,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM030'),(822,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM031'),(823,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM032'),(824,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'TM033'),(825,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC002'),(826,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC003'),(827,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'KAR001'),(828,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'KAR002'),(829,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'KAR003'),(830,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC004'),(831,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC005'),(832,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC006'),(833,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC007'),(834,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC008'),(835,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'ZC009'),(836,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC001'),(837,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC002'),(838,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC003'),(839,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC004'),(840,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC005'),(841,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC006'),(842,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC007'),(843,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC008'),(844,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OC009'),(845,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CopaC001'),(846,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0085'),(847,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0086'),(848,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0087'),(849,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'QAZ0088'),(850,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'LTC0001'),(851,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0007'),(852,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'CAR0008'),(853,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0001'),(854,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0001'),(855,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'SKUCODE'),(856,'Four Seasons e-Gift Card (300 OMR)',1,2,7,10,0,'OM-FS0003');
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gcdailyorders`
--

DROP TABLE IF EXISTS `gcdailyorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcdailyorders` (
  `GRSOrder` varchar(45) NOT NULL DEFAULT '',
  `PartnerSystemOrder` varchar(45) DEFAULT NULL,
  `UserId` varchar(45) DEFAULT NULL,
  `FirstName` varchar(70) DEFAULT NULL,
  `LastName` varchar(70) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `CompanyName` varchar(45) DEFAULT NULL,
  `Address1` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State_Province` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Zip_PostalCode` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `ItemNumber` varchar(45) DEFAULT NULL,
  `ItemDescription` varchar(100) DEFAULT NULL,
  `ItemOption` varchar(45) DEFAULT NULL,
  `Quantity` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `ProductCost` double DEFAULT NULL,
  `CatalogCode` varchar(45) DEFAULT NULL,
  `CatalogName` varchar(45) DEFAULT NULL,
  `DateProcessed` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `QuantityShipped` int(11) DEFAULT NULL,
  `TrackingNumber` varchar(45) DEFAULT NULL,
  `CourierName` varchar(45) DEFAULT NULL,
  `Memo` varchar(500) DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`GRSOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gcdailyorders`
--

LOCK TABLES `gcdailyorders` WRITE;
/*!40000 ALTER TABLE `gcdailyorders` DISABLE KEYS */;
INSERT INTO `gcdailyorders` VALUES ('3456972-1','1730-1','1848','Maryam','Al Dairi','2018-02-01 08:17:35','oman arab bank','2010','','Ozaiba','MA','Oman','100','986201092404039','OM-LUH0003','Lulu Hypermarket (50 OMR)','','1','Maryam.Al-Dairi@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3456973-1','1731-1','1848','Maryam','Al Dairi','2018-02-01 08:17:44','oman arab bank','2010','','Ozaiba','MA','Oman','100','986201092404039','OM-LUH0003','Lulu Hypermarket (50 OMR)','','3','Maryam.Al-Dairi@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3473463-1','1758-1','1985','Jamil','Sawwas','2018-02-08 13:22:50','Nathealth','???? ??????? ??????? ???? ??? ??? ???????','','????','AM','Jordan','13111','962962788541605','MAN0006','Al Manaseer Gift Card (200 JD)','','1','j.sawas@nathealth.net',200,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3479187-1','1763-1','1770','Haitham','AL Mukhaini','2018-02-11 00:43:23','??? ???? ??????','??? ????? : 683 ??? ?????? : 4477','????? ???? / ?????? ????????','?????? ????????','MA','Oman','130','9860196611060','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','2','Haitham.Al-Mukhaini@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3485846-1','1753-1','821','Aisha','Alobaidani','2018-02-14 07:10:37','oman arab bank-muscat city center branch','muscat','al mawaleh','al seeb','MA','Oman','2010','98696899792810','OM-JJ003','Joyalukkas Jewlary Gift Card (150 OMR)','','2','Aisha.Al-Obaidani@oman-arabbank.com',150,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3485847-1','1756-1','984','Moosa','Alamri','2018-02-14 07:11:00','','??????','??????','????','MA','Oman','2010 / 112','9860092702344','OM-CAR008','Carrefour Voucher (50 OMR)','','2','Moosa.Al-Amri@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3485847-2','1756-2','984','Moosa','Alamri','2018-02-14 07:11:00','','??????','??????','????','MA','Oman','2010 / 112','9860092702344','OM-LUH0003','Lulu Hypermarket (50 OMR)','','2','Moosa.Al-Amri@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3485848-1','1767-1','115','Meya','Al-Rashdi','2018-02-14 07:11:16','','AL AZAIBA','AZAIBA','AZAIBA','MA','Oman','100','98696899449974','OM-HC001','Home Center Gift Card (50 OMR)','','1','maiya.alrashdi@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3485849-1','1768-1','115','Meya','Al-Rashdi','2018-02-14 07:11:23','','AL AZAIBA','AZAIBA','AZAIBA','MA','Oman','100','98696899449974','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','1','maiya.alrashdi@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3485852-1','1773-1','1324','Khalifa','Al Yaqoobi','2018-02-14 07:12:18','OAB','Muscat','OAB head office','ALGHUBRA HEAD OFFICE','MA','Oman','2240','9860096896651559','OM-LUH0003','Lulu Hypermarket (50 OMR)','','2','Khalifa.Al-yaqoubi@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3495559-1','1786-1','1984','Wala','Ibrahim','2018-02-19 09:08:49','','????? ?????? ??? - ????? ??????? - ?. ?????? ?? ???? - ????? ??? 6? ?????? 1','','amman','AM','Jordan','11','962962962797637912','MAN0003','Al Manaseer Gift Card (20 JD)','','1','w.ibrahim@nathealth.net',20,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3497623-1','1776-1','394','Aida','Al-Musharfi','2018-02-20 01:37:01','','omanarabbank','??????','????','MA','Oman','2010','98696899434903','OM-LUH0002','Lulu Hypermarket (40 OMR)','','1','Aida.Al-Musharfi@oman-arabbank.com',40,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3497624-1','1779-1','467','Zubaida','Alzadjali','2018-02-20 01:37:10','??? ???? ?????? ??? ??????','1124','?   ??? 1124','?????','MA','Oman','???112','9860098692290468','OM-JJ003','Joyalukkas Jewlary Gift Card (150 OMR)','','1','Zubaida.Al-Zadjali@oman-arabbank.com',150,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3497624-2','1779-2','467','Zubaida','Alzadjali','2018-02-20 01:37:10','??? ???? ?????? ??? ??????','1124','?   ??? 1124','?????','MA','Oman','???112','9860098692290468','OM-JJ001','Joyalukkas Jewlary Gift Card (50 OMR)','','1','Zubaida.Al-Zadjali@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3497625-1','1781-1','571','Younis','Alzadjali','2018-02-20 01:37:19','','??? ???? ??????','','???????','MA','Oman','130','98600099731846','OM-LUH0003','Lulu Hypermarket (50 OMR)','','2','Younis.Al-Zadjali@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3497626-1','1783-1','1727','Mayada','Al Zadjali','2018-02-20 01:37:24','','Oman Arab Bank','Head Office-Ghoubra','Muscat','MA','Oman','112','98698697228846','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','1','Miyada.Al-Zadjali@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3497627-1','1784-1','128','Mahmood','Al-Balushi','2018-02-20 01:37:30','oab head office','al ghubra','','al ghubrah','MA','Oman','112','9860096892120029','OM-LUH0002','Lulu Hypermarket (40 OMR)','','3','Mahmood.Faqeer@oman-arabbank.com',40,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3497628-1','1785-1','1054','Fatima','Alobaidani','2018-02-20 01:37:35','','alkhuwair commercial','alkhuwair commercial br','??????? ????????','MA','Oman','111','9863395788149','OM-LUH0003','Lulu Hypermarket (50 OMR)','','1','Fatima.Al-Obaidani@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3502721-1','1789-1','1956','Maisa','Amarneh','2018-02-21 17:57:35','nathealth','???? ??????? ??????? ????? ??? ?????','????? ??? ???','????','AM','Jordan','962','962962786919026','QAZ0046','Zara /Qanz Card (45 JD)','','1','m.amarneh@nathealth.net',45,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3509933-1','1791-1','1747','Osama','Alijel','2018-02-25 04:24:05','??? ????','???? ???? ??????? ??????? / ???? ??? ???? ????? 194','???? ???? ??????? ??????? / ???? ??? ???? ????? 194','???? ???? ??????? ???????','AM','Jordan','750','96200962799953331','MAN0005','Al Manaseer Gift Card (100 JD)','','1','osama.abd@nathealth.net',100,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3509939-1','1792-1','2088','Reham','Al Khateeb','2018-02-25 04:39:46','','???? - ???? ??????? ??????? - ???? ?????? - ??? ????','','amman','AM','Jordan','11121','9620795091345','MAN0004','Al Manaseer Gift Card (50 JD)','','1','r.Al-khatib@nathealth.net',50,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3528419-1','1802-1','1992','Hamdi','Mohammad','2018-03-03 04:44:33','Nathealth','???? - ???? ??????? ???????','','????','AM','Jordan','0000','96200962790900985','MAN0003','Al Manaseer Gift Card (20 JD)','','1','h.mohammad@nathealth.net',20,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3531827-1','1788-1','2087','Mohamed','AlZadjali','2018-03-05 01:58:38','','?????? ??? ?????? 906 ??? ????? 4111','al khuwair commercial branch','muscat','MA','Oman','1169','98611199765555','OM-LUH0003','Lulu Hypermarket (50 OMR)','','2','Mohammed.Abdulrahman@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3531839-1','1805-1','2271','Intisar','AL Uraimi','2018-03-05 02:10:45','','??????? ??? ?????? 5452 ??? ????? 1770','?????','????','MA','Oman','114','9860496794723','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','1','Intisaar.Al-Araimi@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3532099-1','1810-1','1751','Ayman','Hassan','2018-03-05 07:26:59','?????? ??????? ?????? ????????? ??????','????? ?????? ???','','????','AM','Jordan','750','96207962779999861','MAN0005','Al Manaseer Gift Card (100 JD)','','1','a.hasan@nathealth.net',100,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3535396-1','1803-1','1533','Yousuf','AL Housni','2018-03-06 02:35:05','','??? ?????? : 62','AZAIBA','AZAIBA','MA','Oman','100','98696896222216','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','1','Yuosef.Al-Hosni@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3535397-1','1809-1','1740','Rabab','AL Lawati','2018-03-06 02:35:18','??? ???? ??????','?????? ???????','??? ???? ??????','?????? ????????','MA','Oman','2010/114','98698699545005','OM-HC003','Home Center Gift Card (150 OMR)','','1','Rabab.Al-Lawati@oman-arabbank.com',150,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0),('3535418-1','1811-1','1707','Rana','Al_Momani','2018-03-06 03:03:24','Nathealth','????? ??????','Nathealth','amman','AM','Jordan','11953','9629620795025017','CAR0003','Carrefour Voucher (50 JD)','','1','r.momani@nathealth.net',50,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3535418-2','1811-2','1707','Rana','Al_Momani','2018-03-06 03:03:24','Nathealth','????? ??????','Nathealth','amman','AM','Jordan','11953','9629620795025017','CAR0002','Carrefour Voucher (20 JD)','','1','r.momani@nathealth.net',20,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3535425-1','1813-1','1707','Rana','Al_Momani','2018-03-06 03:08:48','Nathealth','????? ??????','Nathealth','amman','AM','Jordan','11953','962962795025017','CAR0003','Carrefour Voucher (50 JD)','','1','r.momani@nathealth.net',50,'JORDAN_GC','Jordan Gift Cards',NULL,'',NULL,'','','',0),('3538544-1','1814-1','2385','Amaal','Al Mukhaini','2018-03-07 01:48:11','oman arab bank','?????  ??????? ?????? ???????? -??? ???? ??????','','?????? ????????','MA','Oman','2010/114','98698692337366','OM-MGM002','Muscat Grand Mall Gift Card (50 OMR)','','1','Amaal.Al-Mukhaini@oman-arabbank.com',50,'OM_GIFTCARDS','Oman Gift Cards',NULL,'',NULL,'','','',0);
/*!40000 ALTER TABLE `gcdailyorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift cards invoice`
--

DROP TABLE IF EXISTS `gift cards invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift cards invoice` (
  `OrderId` varchar(45) NOT NULL,
  `EmployeeID` varchar(45) NOT NULL,
  `LineNumber` varchar(45) NOT NULL,
  `RewardName` varchar(500) NOT NULL,
  `OrderDate` date NOT NULL,
  `LocalCost` double NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ReasonofReturn` varchar(50) DEFAULT 'None',
  `Currency_ID` int(11) NOT NULL,
  `Fees_ID` int(11) NOT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `CurrencyID_idx` (`Currency_ID`),
  KEY `FeesID_idx` (`Fees_ID`),
  CONSTRAINT `CurrencyID` FOREIGN KEY (`Currency_ID`) REFERENCES `currency` (`id`),
  CONSTRAINT `FeesID` FOREIGN KEY (`Fees_ID`) REFERENCES `fees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift cards invoice`
--

LOCK TABLES `gift cards invoice` WRITE;
/*!40000 ALTER TABLE `gift cards invoice` DISABLE KEYS */;
INSERT INTO `gift cards invoice` VALUES ('3456972-1','1848','3456972','Lulu Hypermarket (50 OMR)','2018-02-01',0,1,'Not Available',10,51,0,'Oman'),('3456973-1','1848','3456973','Lulu Hypermarket (50 OMR)','2018-02-01',50,3,'By Customer',10,51,0,'Oman'),('3473463-1','1985','3473463','Al Manaseer Gift Card (200 JD)','2018-02-08',200,1,'None',12,627,0,'Jordan'),('3479187-1','1770','3479187','Muscat Grand Mall Gift Card (50 OMR)','2018-02-11',50,2,'None',10,156,0,'Oman'),('3485846-1','821','3485846','Joyalukkas Jewlary Gift Card (150 OMR)','2018-02-14',150,2,'None',10,217,0,'Oman'),('3485847-1','984','3485847','Carrefour Voucher (50 OMR)','2018-02-14',50,2,'None',10,176,0,'Oman'),('3485847-2','984','3485847','Lulu Hypermarket (50 OMR)','2018-02-14',50,2,'None',10,51,0,'Oman'),('3485848-1','115','3485848','Home Center Gift Card (50 OMR)','2018-02-14',50,1,'None',10,221,0,'Oman'),('3485849-1','115','3485849','Muscat Grand Mall Gift Card (50 OMR)','2018-02-14',50,1,'None',10,156,0,'Oman'),('3485852-1','1324','3485852','Lulu Hypermarket (50 OMR)','2018-02-14',50,2,'None',10,51,0,'Oman'),('3495559-1','1984','3495559','Al Manaseer Gift Card (20 JD)','2018-02-19',20,1,'None',12,624,0,'Jordan'),('3497623-1','394','3497623','Lulu Hypermarket (40 OMR)','2018-02-20',40,1,'None',10,50,0,'Oman'),('3497624-1','467','3497624','Joyalukkas Jewlary Gift Card (150 OMR)','2018-02-20',150,1,'None',10,217,0,'Oman'),('3497624-2','467','3497624','Joyalukkas Jewlary Gift Card (50 OMR)','2018-02-20',50,1,'None',10,215,0,'Oman'),('3497625-1','571','3497625','Lulu Hypermarket (50 OMR)','2018-02-20',50,2,'None',10,51,0,'Oman'),('3497626-1','1727','3497626','Muscat Grand Mall Gift Card (50 OMR)','2018-02-20',50,1,'None',10,156,0,'Oman'),('3497627-1','128','3497627','Lulu Hypermarket (40 OMR)','2018-02-20',40,3,'None',10,50,0,'Oman'),('3497628-1','1054','3497628','Lulu Hypermarket (50 OMR)','2018-02-20',50,1,'None',10,51,0,'Oman'),('3502721-1','1956','3502721','Qanz Card (45 JD)','2018-02-21',45,1,'None',12,708,0,'Jordan'),('3509933-1','1747','3509933','Al Manaseer Gift Card (100 JD)','2018-02-25',100,1,'None',12,626,0,'Jordan'),('3509939-1','2088','3509939','Al Manaseer Gift Card (50 JD)','2018-02-25',50,1,'None',12,625,0,'Jordan'),('3528419-1','1992','3528419','Al Manaseer Gift Card (20 JD)','2018-03-03',20,1,'None',12,624,0,'Jordan'),('3531827-1','2087','3531827','Lulu Hypermarket (50 OMR)','2018-03-05',50,2,'None',10,51,0,'Jordan'),('3531839-1','2271','3531839','Muscat Grand Mall Gift Card (50 OMR)','2018-03-05',50,1,'None',10,156,0,'Jordan'),('3532099-1','1751','3532099','Al Manaseer Gift Card (100 JD)','2018-03-05',100,1,'None',12,626,0,'Jordan'),('3535396-1','1533','3535396','Muscat Grand Mall Gift Card (50 OMR)','2018-03-06',50,1,'None',10,156,0,'Jordan'),('3535397-1','1740','3535397','Home Center Gift Card (150 OMR)','2018-03-06',150,1,'None',10,223,0,'Jordan'),('3535418-1','1707','3535418','Carrefour Voucher (50 JD)','2018-03-06',50,1,'None',12,783,0,'Jordan'),('3535418-2','1707','3535418','Carrefour Voucher (20 JD)','2018-03-06',20,1,'None',12,680,0,'Jordan'),('3535425-1','1707','3535425','Carrefour Voucher (50 JD)','2018-03-06',50,1,'None',12,783,0,'Jordan'),('3538544-1','2385','3538544','Muscat Grand Mall Gift Card (50 OMR)','2018-03-07',50,1,'None',10,156,0,'Jordan');
/*!40000 ALTER TABLE `gift cards invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `last_file_used`
--

DROP TABLE IF EXISTS `last_file_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_file_used` (
  `ID` int(11) NOT NULL,
  `path` varchar(512) NOT NULL,
  `mapped_to` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `last_file_used`
--

LOCK TABLES `last_file_used` WRITE;
/*!40000 ALTER TABLE `last_file_used` DISABLE KEYS */;
INSERT INTO `last_file_used` VALUES (1,'theBookofRyan.csv','Company'),(2,'ClientRAWinvoice.csv','Clients Invoices');
/*!40000 ALTER TABLE `last_file_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `Pin` varchar(45) DEFAULT '',
  `EmployeeNumber` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `JobTitle` varchar(100) NOT NULL,
  `HireDate` date NOT NULL,
  `BirthDate` date NOT NULL,
  `Address1` varchar(45) NOT NULL,
  `Address2` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Province_State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  `TelephoneAreaCode` varchar(45) DEFAULT NULL,
  `TelephoneNumber` varchar(45) NOT NULL,
  `TelephoneCountryCode` varchar(45) DEFAULT NULL,
  `LanguageCode` varchar(45) DEFAULT NULL,
  `DepartmentCode` varchar(45) DEFAULT NULL,
  `DepartmentName` varchar(45) DEFAULT NULL,
  `AccessGroups` varchar(200) DEFAULT NULL,
  `EmployeeType` varchar(45) NOT NULL,
  `DeletionFlag` tinyint(4) DEFAULT '0',
  `DeletionDate` date DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `DisableLogin` varchar(45) DEFAULT NULL,
  `DisableEarn` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `FnameAR` varchar(100) DEFAULT NULL,
  `LnameAR` varchar(100) DEFAULT NULL,
  `PositionAr` varchar(500) DEFAULT NULL,
  `MNA` varchar(45) DEFAULT NULL,
  `MNE` varchar(45) DEFAULT NULL,
  `META` varchar(45) DEFAULT NULL,
  `Child` varchar(45) DEFAULT NULL,
  `MrgDate` date DEFAULT NULL,
  `Comp_Id` int(11) DEFAULT NULL,
  `Dept_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeNumber`),
  UNIQUE KEY `EmployeeNumber_UNIQUE` (`EmployeeNumber`),
  KEY `Dept_ID_idx` (`Dept_ID`),
  KEY `Memb_Comp_ID_idx` (`Comp_Id`),
  CONSTRAINT `Me_Dep_ID` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Memb_Comp_ID` FOREIGN KEY (`Comp_Id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('BCDH1569','1360','Mohammad','Al Balushi','hamida.albalushi@oman-arabbank.com','Universal Customers Care','2012-11-10','2010-02-08','???? 23 ????? ??? 421 ???? 16','???????','?????','JA','OM','211','','92187017','','ar','3109','Salalah','Default Member','F',0,NULL,'','','','674','','','','','','','',NULL,1,3109),('BCDT0157','1378','Samira','AlAlem','Samira.AlAlem@oman-arabbank.com','Universal Customers Care','2015-01-11','2000-11-08','???? 23 ????? ??? 421 ???? 16','???????','?????','JA','OM','211','','92187017','986','ar','3152','Al Suwaiq','Default Member','F',0,NULL,'','','','674','','','','','','','',NULL,1,3152),('BCDF0148','674','Mahomood','Elmnasara','Mahomood.Elmnasara@oman-arabbank.com','Universal Customers Care','2018-12-19','2000-10-08','???? 23 ????? ??? 421 ???? 16','???????','?????','JA','OM','211','','92187017','986','ar','1010','General Manager','Default Member','F',0,NULL,'','','','674','','','','','','','',NULL,2,3109);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old not shipped_orders`
--

DROP TABLE IF EXISTS `old not shipped_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old not shipped_orders` (
  `PIN` varchar(45) DEFAULT NULL,
  `EmployeeID` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `DeptName` varchar(100) DEFAULT NULL,
  `DeptCode` varchar(45) DEFAULT NULL,
  `JobTitle` varchar(100) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  `CatalogName` varchar(100) NOT NULL,
  `RewardName` varchar(500) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Details` varchar(1500) DEFAULT NULL,
  `HighestLevelCategory` varchar(55) DEFAULT NULL,
  `LowestLevelCategory` varchar(55) DEFAULT NULL,
  `Company` varchar(100) NOT NULL,
  `Name` varchar(70) DEFAULT NULL,
  `Address1` varchar(500) DEFAULT NULL,
  `Address2` varchar(500) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `P2MOrderNumber` varchar(45) DEFAULT NULL,
  `OrderStatus` varchar(45) NOT NULL,
  `DiscountCoupon` varchar(45) NOT NULL,
  `RedemptionAmount` varchar(45) NOT NULL,
  `DiscountApplied` varchar(45) NOT NULL,
  `MemberPaid` varchar(45) NOT NULL,
  `PointBillingRate` double DEFAULT NULL,
  `ordarDate` date NOT NULL,
  `GRSOrderNum` varchar(45) DEFAULT NULL,
  `PartnerSystemOrderNum` varchar(45) NOT NULL,
  `ItemNumber` varchar(45) DEFAULT NULL,
  `ItemDescription` varchar(100) DEFAULT NULL,
  `ItemOption` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `ProductCost` double DEFAULT NULL,
  `CatalogCode` varchar(45) DEFAULT NULL,
  `DateProcessed` varchar(45) NOT NULL,
  `QuantityShipped` int(11) NOT NULL,
  `TrackingNumber` varchar(45) NOT NULL,
  `CourierName` varchar(50) NOT NULL,
  `Memo` varchar(500) DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `PIN_UNIQUE` (`PIN`),
  UNIQUE KEY `P2M Order Number_UNIQUE` (`P2MOrderNumber`),
  UNIQUE KEY `GRS Order Num_UNIQUE` (`GRSOrderNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old not shipped_orders`
--

LOCK TABLES `old not shipped_orders` WRITE;
/*!40000 ALTER TABLE `old not shipped_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `old not shipped_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oman amount`
--

DROP TABLE IF EXISTS `oman amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oman amount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TotalRemainingAmount` double DEFAULT '0',
  `Dateofpayment` date DEFAULT NULL,
  `PaymentstoOman` double DEFAULT NULL,
  `DeletionFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oman amount`
--

LOCK TABLES `oman amount` WRITE;
/*!40000 ALTER TABLE `oman amount` DISABLE KEYS */;
INSERT INTO `oman amount` VALUES (1,0,'2018-09-09',1000,0),(4,0,'2018-04-24',1000,0),(5,0,'2018-05-15',5,0),(6,0,'2018-05-15',5,0),(7,0,'2018-05-15',5,0),(8,0,'2018-06-30',1000,0),(9,0,'2018-06-29',5,0),(10,0,'2018-06-30',51,0);
/*!40000 ALTER TABLE `oman amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oman float`
--

DROP TABLE IF EXISTS `oman float`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oman float` (
  `OrderNo` varchar(45) NOT NULL DEFAULT '',
  `OrderDate` date DEFAULT NULL,
  `MemberName` varchar(45) DEFAULT NULL,
  `Totalcost` double DEFAULT '0',
  `Deliveryfees` double DEFAULT '0',
  `TotalCostwithDelivery` double DEFAULT '0',
  `Status` varchar(45) DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `CardTypeandAmount` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT '0',
  `DeletionFlag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`OrderNo`),
  UNIQUE KEY `OrderNo_UNIQUE` (`OrderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oman float`
--

LOCK TABLES `oman float` WRITE;
/*!40000 ALTER TABLE `oman float` DISABLE KEYS */;
INSERT INTO `oman float` VALUES ('802-1','2017-09-01','Isra AL Lawati',30,30,60,'Pending','2018-06-08','City Center Qurum Gift Card (30 OMR)',1,0),('810-1','2017-09-01','Wael Jebril',30,11,41,'Ordered','2018-06-29','City Center Qurum Gift Card (30 OMR)',1,1),('811-1','2017-09-01','Mubarak AL Rahbi',50,11,61,'Shipped','2018-06-23','City Center Qurum Gift Card (50 OMR)',1,0),('812-1','2017-09-01','Mubarak AL Rahbi',30,0,30,'Other','2018-06-23','City Center Qurum Gift Card (30 OMR)',1,0),('813-1','2017-09-01','Muntaser Alshirawi',50,11,61,'Delivered',NULL,'Lulu Hypermarket (50 OMR)',1,0);
/*!40000 ALTER TABLE `oman float` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shobingg_p2m_operations'
--

--
-- Dumping routines for database 'shobingg_p2m_operations'
--
/*!50003 DROP PROCEDURE IF EXISTS `DeleteAmount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteAmount`(
in VarID int(11)
)
BEGIN
delete from  `shobingg_P2M_Operations`.`Oman Amount`
where `ID`=VarID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteClientsInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteClientsInvoice`(
IN VarOrderNO Varchar(45)
)
BEGIN
if VarOrderNO is not null then 
update `shobingg_P2M_Operations`.`Clients Invoices` 
set `DeletionFlag`=1
where  `OrderNo`=VarOrderNO;
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCompany`(
IN VarName varchar(45)
)
BEGIN
if VarName is not null then 
update `shobingg_P2M_Operations`.`Company` 
set `DeletionFlag` =1
where lower(`Name`) =lower(VarName) ;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCurrency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCurrency`(
in VarID int(11)
)
BEGIN

if (VarID is not null) then
update `shobingg_P2M_Operations`.`Currency`
set `DeletionFlag`=1
where `ID`=VarID;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteFees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFees`(
IN VarID int(11)
)
BEGIN
if (VarID is not null) then
update  `shobingg_P2M_Operations`.`Fees`
set `DeletionFlag`=1
where `ID`=VarID;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteFloat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFloat`(
IN VarOrderNO Varchar(45)
)
BEGIN
if VarOrderNO is not null then 
update `shobingg_P2M_Operations`.`Oman Float`
set `DeletionFlag`=1
where  `OrderNo`=VarOrderNO;
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteGiftCardsInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGiftCardsInvoice`(
IN VarOrderId Varchar(45)
)
BEGIN
if VarOrderId is not null then 
update `shobingg_P2M_Operations`.`Gift Cards Invoice`
set `DeletionFlag`=1
where  `OrderId`=VarOrderId;
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAmount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAmount`()
BEGIN
select * from `shobingg_P2M_Operations`.`Oman Amount`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetClientsInvoices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetClientsInvoices`(

IN VarOrderNo varchar(45),
IN VarEmployeeID varchar(45),
IN VarStartDate date,
IN VarEndDate Date,
IN VarCompany int(11)
)
BEGIN


case 


when (VarOrderNo is not null and ((VarStartDate is null and VarEndDate is null)
 and VarCompany =0 ))then 
select a.OrderNo,
a.EmployeeID,
a.FirstName,
a.LastName,
a.CatalogName,
a.Quantity,
a.OrderDate,
(a.RedemptionPoints)as 'RedemptionPoints',
a.ReasonofReturn,
a.Country,
(a.LocalCost*b.PointValue_Rate*a.Quantity) as 'LocalCost',
(a.LocalCost*a.Quantity*b.USDRate) as 'USDCost' from
 `shobingg_P2M_Operations`.`Clients Invoices` as a ,
 `shobingg_P2M_Operations`.`Currency` as b
 where ((a.Currency_ID = b.ID)and (`OrderNo`=VarOrderNo and a.DeletionFlag!=1))
 GROUP BY a.OrderNo;
 
 
 
 
 
 when (VarOrderNo is not null and ((VarStartDate is null and VarEndDate is null)
 and VarCompany !=0 ))then 
select a.OrderNo,
a.EmployeeID,
a.FirstName,
a.LastName,
a.CatalogName,
a.Quantity,
a.OrderDate,
(a.RedemptionPoints)as 'RedemptionPoints',
a.ReasonofReturn,
a.Country,
(a.LocalCost*b.PointValue_Rate*a.Quantity) as 'LocalCost',
(a.LocalCost*a.Quantity*b.USDRate) as 'USDCost' from
 `shobingg_P2M_Operations`.`Clients Invoices` as a ,
 `shobingg_P2M_Operations`.`Currency` as b
 where ((a.Currency_ID = b.ID)and (`OrderNo`=VarOrderNo and a.DeletionFlag!=1)
 and (`Company`like VarCompany) or `Company` is null)
 GROUP BY a.OrderNo;
	
 
 when ((VarStartDate is not null) and (VarEndDate is not null) and
 (VarCompany !=0))then 
select a.OrderNo,
a.EmployeeID,
a.FirstName,
a.LastName,
a.CatalogName,
a.Quantity,
a.OrderDate,
(a.RedemptionPoints)as 'RedemptionPoints',
a.ReasonofReturn,
a.Country,
(a.LocalCost*b.PointValue_Rate*a.Quantity) as 'LocalCost',
(a.LocalCost*a.Quantity*b.USDRate) as 'USDCost'
 From 
 `shobingg_P2M_Operations`.`Clients Invoices` as a ,
 `shobingg_P2M_Operations`.`Currency` as b
 where ((a.Currency_ID = b.ID and (a.DeletionFlag!=1))and 
 (`OrderDate` BETWEEN VarStartDate and VarEndDate)and 
 ((`Company` like VarCompany)or (`Company` is null)))
 GROUP BY a.OrderNo;




when (VarEmployeeID is not null and (VarCompany !=0)) then 
select a.OrderNo,
a.EmployeeID,
a.FirstName,
a.LastName,
a.CatalogName,
a.Quantity,
a.OrderDate,
(a.RedemptionPoints)as 'RedemptionPoints',
a.ReasonofReturn,
a.Country,
(a.LocalCost*b.PointValue_Rate*a.Quantity) as 'LocalCost',
(a.LocalCost*a.Quantity*b.USDRate) as 'USDCost' From 
 `shobingg_P2M_Operations`.`Clients Invoices` as a ,
 `shobingg_P2M_Operations`.`Currency` as b
 where ((a.Currency_ID = b.ID )and
 (`EmployeeID`=VarEmployeeID and (a.DeletionFlag!=1)) and (`Company` like VarCompany)and ((`Company` like VarCompany)or `Company` is null))
 GROUP BY a.OrderNo;
 
 
 
when (VarEmployeeID is not null and (VarCompany =0)) then 
select a.OrderNo,
a.EmployeeID,
a.FirstName,
a.LastName,
a.CatalogName,
a.Quantity,
a.OrderDate,
(a.RedemptionPoints)as 'RedemptionPoints',
a.ReasonofReturn,
a.Country,
(a.LocalCost*b.PointValue_Rate*a.Quantity) as 'LocalCost',
(a.LocalCost*a.Quantity*b.USDRate) as 'USDCost' From 
 `shobingg_P2M_Operations`.`Clients Invoices` as a ,
 `shobingg_P2M_Operations`.`Currency` as b
 where ((a.Currency_ID = b.ID )and
 (`EmployeeID`=VarEmployeeID and (a.DeletionFlag!=1)) and (`Company` like VarCompany))
 GROUP BY a.OrderNo;
 
 /*when ((VarCompany >0)) then 
select a.OrderNo,
a.EmployeeID,
a.FirstName,
a.LastName,
a.CatalogName,
a.Quantity,
a.OrderDate,
(a.RedemptionPoints)as 'RedemptionPoints',
a.ReasonofReturn,
a.Country,
(a.LocalCost*b.PointValue_Rate*a.Quantity) as 'LocalCost',
(a.LocalCost*a.Quantity*b.USDRate) as 'USDCost' From 
 `shobingg_P2M_Operations`.`Clients Invoices` as a ,
 `shobingg_P2M_Operations`.`Currency` as b
 where ((a.Currency_ID = b.ID )and
 ((a.DeletionFlag!=1)) and ((`Company` like VarCompany)or (`Company` is null)))
 GROUP BY a.OrderNo;*/
 
else 

select a.OrderNo,
a.EmployeeID,
a.FirstName,
a.LastName,
a.CatalogName,
a.Quantity,
a.OrderDate,
(a.RedemptionPoints)as 'RedemptionPoints',
a.ReasonofReturn,
a.Country,
(a.LocalCost*b.PointValue_Rate*a.Quantity) as 'LocalCost',
(a.LocalCost*a.Quantity*b.USDRate) as 'USDCost'
 From 
 `shobingg_P2M_Operations`.`Clients Invoices` as a ,
 `shobingg_P2M_Operations`.`Currency` as b
 where (a.Currency_ID = b.ID and (a.DeletionFlag!=1)and (`Company` like VarCompany));
end case;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCompany`(
IN VarName varchar(45)
)
BEGIN
if VarName is not null then 
select * from 
`shobingg_P2M_Operations`.`Company`
where (`Name`=VarName and `DeletionFlag`!=1);
else 
select * from 
`shobingg_P2M_Operations`.`Company`
where `DeletionFlag`!=1;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCurrency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCurrency`()
BEGIN
select * from `shobingg_P2M_Operations`.`Currency`
where `DeletionFlag`!=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFees`(
in VarRName varchar(500)
)
BEGIN
if VarRName is null then
select * from `shobingg_P2M_Operations`.`Fees`
where `DeletionFlag`!=1;

else 
select * from `shobingg_P2M_Operations`.`Fees`
where `DeletionFlag`!=1 and (`RewardName`like VarRName);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFloat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFloat`(
IN VarOrderNO Varchar(45)
)
BEGIN
if VarOrderNO is not null then 
select *
from `shobingg_P2M_Operations`.`Oman Float`
where  OrderNo=VarOrderNO and (`DeletionFlag`!=1);

else select *
from `shobingg_P2M_Operations`.`Oman Float`
where `DeletionFlag`!=1 ;
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetGCTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGCTotal`(IN VarStartDate Date,
IN VarEndDate Date)
BEGIN
DECLARE USDCost double;

/*select  (a.LocalCost*a.Quantity*c.USDRate) into USDCost
From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where a.Currency_ID = c.ID and a.Fees_ID=b.ID;*/
 
 case 
  when (VarStartDate is not null and VarEndDate is not null )then 
 select 
sum(a.LocalCost*a.Quantity*c.USDRate) as 'TotalUSDCost', 
sum(a.LocalCost) as 'TotalLocalCost',c.USDRate,
c.PointValue_Rate
 From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where ((a.Currency_ID = c.ID and a.Fees_ID=b.ID)and (`OrderDate` BETWEEN VarStartDate and VarEndDate)and(a.DeletionFlag!=1));
else
select sum(a.LocalCost*a.Quantity*c.USDRate) as 'TotalUSDCost', 
sum(a.LocalCost) as 'TotalLocalCost',c.USDRate,
c.PointValue_Rate
 From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where (a.Currency_ID = c.ID and a.Fees_ID=b.ID and(a.DeletionFlag!=1));


end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetGiftCardsInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGiftCardsInvoice`(
IN VarOrderId varchar(45),
IN VarEMPID varchar(45) ,
/*IN VarQuantity int(8),*/
IN VarStartDate Date,
IN VarEndDate Date
)
BEGIN
/*DECLARE USDCost double;

select  (a.LocalCost*a.Quantity*c.PointValue_Rate*b.Total) into USDCost
From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where a.Currency_ID = c.ID and a.Fees_ID=b.ID;*/
 
 
case 

when (VarOrderId is not null and (VarStartDate is null and VarEndDate is null ))then 
select a.*,b.SKU,
(a.LocalCost*a.Quantity*c.PointValue_Rate) as 'USDCost' 

 From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where ((a.Currency_ID = c.ID and a.Fees_ID=b.ID)and (a.OrderId=VarOrderId)and(a.DeletionFlag!=1));

when (VarEMPID is not null and (VarStartDate is null and VarEndDate is null ))then 
select a.*,b.SKU,
(a.LocalCost*a.Quantity*c.PointValue_Rate) as 'USDCost' 

 From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where ((a.Currency_ID = c.ID and a.Fees_ID=b.ID)and (a.EmployeeID=VarEMPID)and(a.DeletionFlag!=1));
 
 
 
 
 when (VarStartDate is not null and VarEndDate is not null )then 
 select a.*,b.SKU,
(a.LocalCost*a.Quantity*c.PointValue_Rate) as 'USDCost' 
 From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where ((a.Currency_ID = c.ID and a.Fees_ID=b.ID)and (`OrderDate` BETWEEN VarStartDate and VarEndDate)and(a.DeletionFlag!=1));





/* when VarQuantity>0 then 
select a.*,b.SKU,
(a.LocalCost*a.Quantity*c.PointValue_Rate) as 'USDCost'
 From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where ((a.Currency_ID = c.ID and a.Fees_ID=b.ID)and (`Quantity`>=VarQuantity)and(a.DeletionFlag!=1));
*/
when VarOrderId is not null then 
select a.*,b.SKU,
(a.LocalCost*a.Quantity*c.PointValue_Rate) as 'USDCost'
 From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where ((a.Currency_ID = c.ID and a.Fees_ID=b.ID)and (`OrderId`=VarOrderId and a.DeletionFlag!=1));
 else 
 select a.*,b.SKU,
(a.LocalCost*a.Quantity*c.PointValue_Rate) as 'USDCost'
 From 
 `shobingg_P2M_Operations`.`Gift Cards Invoice` as a ,
 `shobingg_P2M_Operations`.`Fees`as b, 
 `shobingg_P2M_Operations`.`Currency` as c
 where (a.Currency_ID = c.ID and a.Fees_ID=b.ID and(a.DeletionFlag!=1));


end case;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPath`()
BEGIN
SELECT * FROM shobingg_p2m_operations.last_file_used WHERE ID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTotalAmount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTotalAmount`(

)
BEGIN
declare VarPaymentstoOman double;
declare VarTotalCostwithDelivery double;
declare VarTotal double;
select sum(TotalCostwithDelivery) into VarTotalCostwithDelivery 
from `shobingg_P2M_Operations`.`Oman Float` 
where `DeletionFlag`!=1 ; 

select sum(PaymentstoOman) into VarPaymentstoOman 
from `shobingg_P2M_Operations`.`Oman Amount` 
where `DeletionFlag`!=1 ; 

set VarTotal= VarPaymentstoOman-VarTotalCostwithDelivery;

select VarTotal as 'TotalRemainingAmount';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCurrency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCurrency`(
in 	VarID int(11),
IN VarName varchar(45) ,
IN VarCountry varchar(45),
IN VarPointValue_Rate double,
in VarUSDRate double,
in VarISO varchar(45)
)
BEGIN

UPDATE `shobingg_P2M_Operations`.`Currency`
SET
Name=VarName,
Country=VarCountry,
PointValue_Rate=VarPointValue_Rate,
USDRate=VarUSDRate,
ISO=VarISO,
DeletionFlag=0
where `ID`=VarID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_file_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_file_name`(IN file_path varchar(512))
BEGIN
UPDATE `shobingg_p2m_operations`.`last_file_used` SET `path` = file_path WHERE (`ID` = '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpsertAmount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpsertAmount`(
in varID int(11),
IN VarPaymentstoOman double,
IN VarDateofpayment date
)
BEGIN
declare idcnt int(11);
select count(*) into idcnt from `shobingg_P2M_Operations`.`Oman Amount` where `ID`=varID;

if (idcnt > 0) then
UPDATE `shobingg_P2M_Operations`.`Oman Amount`

set
PaymentstoOman=VarPaymentstoOman,
Dateofpayment=VarDateofpayment,
DeletionFlag=0
where `ID`=varID;
else 
INSERT INTO `shobingg_P2M_Operations`.`Oman Amount`

(`ID`,
`PaymentstoOman`,
`Dateofpayment`,
`DeletionFlag`)

VALUES
(varID,
VarPaymentstoOman,
VarDateofpayment,
0);

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpsertClientsInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpsertClientsInvoice`(


IN VarOrderNo varchar(45),
IN VarEmployeeID varchar(45),
IN VarFirstName varchar(45),
IN VarLastName varchar(500) ,
IN VarCatalogName varchar(100),
IN VarQuantity int(11),
IN VarOrderDate date,
IN VarRedemptionPoints varchar(45),
IN VarLocalCost double,
IN VarCountry varchar(45),
IN VarReasonofReturn varchar(50)


)
BEGIN
DECLARE CurrencyID int(11);
declare Comp int(11);

Select id into CurrencyID from `shobingg_P2M_Operations`.`Currency`
where lower(`ISO`) like lower(VarCountry);

Select `Comp_Id` into Comp from (select * from `shobingg_P2M_Operations`.`Members`
where `EmployeeNumber` =VarEmployeeID) as comp;


INSERT INTO `shobingg_P2M_Operations`.`Clients Invoices`
(`OrderNo`,
`EmployeeID`,
`FirstName`,
`LastName`,
`CatalogName`,
`Quantity`,
`OrderDate`,
`RedemptionPoints`,
`LocalCost`,
`ReasonofReturn`,
`Currency_ID`,
`DeletionFlag`,
`Country`,
`Company`)

values
(VarOrderNo,
VarEmployeeID,
VarFirstName,
VarLastName,
VarCatalogName,
VarQuantity,
VarOrderDate,
abs(VarRedemptionPoints),
abs(VarLocalCost),
VarReasonofReturn,
CurrencyID,
0,
VarCountry,
Comp)

on duplicate key update 
EmployeeID=VarEmployeeID,
FirstName=VarFirstName,
LastName=VarLastName,
CatalogName=VarCatalogName,
Quantity=VarQuantity,
OrderDate=VarOrderDate,
RedemptionPoints=abs(VarRedemptionPoints),
LocalCost=abs(VarLocalCost),
ReasonofReturn=VarReasonofReturn,
Currency_ID=CurrencyID,
DeletionFlag=0,
Country=VarCountry,
Company=Comp;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpsertCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpsertCompany`(IN VarName varchar(45),
IN VarCountry varchar(45),
IN VarNameAr NVARCHAR(100),
IN VarSite varchar(500)
)
BEGIN
INSERT INTO `shobingg_P2M_Operations`.`Company`
(`Name`,
`Country`,
`NameAr`,
`Site`,
`DeletionFlag`)
VALUES
(VarName,
VarCountry,
VarNameAr,
VarSite,
0)

on duplicate key update

Name=VarName,
Country=VarCountry,
NameAr=VarNameAr,
Site=VarSite,
DeletionFlag=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpsertCurrency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpsertCurrency`(

IN VarName varchar(45) ,
IN VarCountry varchar(45),
IN VarPointValue_Rate double,
in VarUSDRate double,
in VarISO varchar(45)
)
BEGIN
INSERT INTO `shobingg_P2M_Operations`.`Currency`
(
`Name`,
`Country`,
`PointValue_Rate`,
`USDRate`,
`DeletionFlag`,
`ISO`)
VALUES
(
VarName,
VarCountry,
VarPointValue_Rate,
VarUSDRate,
0,
VarISO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpsertFees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpsertFees`(

IN VarID int(11),
IN VarRewardName varchar(500),
IN VarShippingCost double,
IN VarHandlingCost double,
IN VarServiceCharge double,
in VarSKU varchar(45)
)
BEGIN
declare VTotal double;
declare VarRID int(11);
set VTotal= VarShippingCost+VarHandlingCost+VarServiceCharge;
select count(*) into VarRID from `shobingg_P2M_Operations`.`Fees` where `ID`=VarID;

/*if VarID is null then */
if (VarRID > 0)
then
UPDATE `shobingg_P2M_Operations`.`Fees`
set RewardName=VarRewardName,
ShippingCost=VarShippingCost,
HandlingCost=VarHandlingCost,
ServiceCharge=VarServiceCharge,
Total=VTotal,
DeletionFlag=0
Where	`ID`=VarID;
else 
INSERT INTO `shobingg_P2M_Operations`.`Fees`
(`ID`,
`RewardName`,
`ShippingCost`,
`HandlingCost`,
`ServiceCharge`,
`Total`,
`DeletionFlag`,
`SKU`)
VALUES
(VarID,
VarRewardName,
VarShippingCost,
VarHandlingCost,
VarServiceCharge,
VTotal,
0
,VarSKU);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpsertFloat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpsertFloat`(

IN VarOrderNo varchar(45),
IN VarOrderDate date,
IN VarMemberName varchar(45),
IN VarTotalcost double,
IN VarDeliveryfees double,
IN VarTotalCostwithDelivery double,
IN VarStatus varchar(45),
IN VarDeliveryDate date,
IN VarCardTypeandAmount varchar(50),
IN VarQuantity int(11)

)
BEGIN
if not exists(select * from `shobingg_P2M_Operations`.`Oman Float` where  `OrderNo`=VarOrderNo)then
INSERT INTO `shobingg_P2M_Operations`.`Oman Float`
(`OrderNo`,
`OrderDate`,
`MemberName`,
`Totalcost`,
`Deliveryfees`,
`TotalCostwithDelivery`,
`Status`,
`CardTypeandAmount`,
`Quantity`,
`DeletionFlag`)

VALUES

(VarOrderNo,
VarOrderDate,
VarMemberName,
VarTotalcost,
VarDeliveryfees,
VarQuantity*(VarTotalcost+VarDeliveryfees),
VarStatus,
VarCardTypeandAmount,
VarQuantity,
0);
else 

update `shobingg_P2M_Operations`.`Oman Float`

set OrderDate=VarOrderDate,
MemberName=VarMemberName,
Totalcost=VarTotalcost,
Deliveryfees=VarDeliveryfees,
TotalCostwithDelivery=VarTotalcost+VarDeliveryfees,
Status=VarStatus,
DeliveryDate=VarDeliveryDate,
CardTypeandAmount=VarCardTypeandAmount,
Quantity=VarQuantity,
DeletionFlag=0
where `OrderNo`=VarOrderNo;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpsertGiftCardsInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpsertGiftCardsInvoice`(

IN VarOrderId varchar(45),
IN VarEmployeeID varchar(45),
IN VarLineNumber varchar(45),
IN VarRewardName varchar(500) ,
IN VarOrderDate date,
IN VarLocalCost double,
IN VarQuantity int(11),
IN VarReasonofReturn varchar(50),
IN VarCountry varchar(45),
IN VarSKU varchar(45)

)
BEGIN
DECLARE CurrencyID int(11);
DECLARE FeesID int(11);

Select id into CurrencyID from `shobingg_P2M_Operations`.`Currency`
where lower(`Country`) like lower(VarCountry);

Select id into FeesID from `shobingg_P2M_Operations`.`Fees` 
where ((lower(`RewardName`) = Lower(VarRewardName))and `SKU`= VarSKU);


INSERT INTO `shobingg_P2M_Operations`.`Gift Cards Invoice`
(`OrderId`,
`EmployeeID`,
`LineNumber`,
`RewardName`,
`OrderDate`,
`LocalCost`,
`Quantity`,
`ReasonofReturn`,
`Currency_ID`,
`Fees_ID`,
`DeletionFlag`,
`Country`)

values
(VarOrderId,
VarEmployeeID,
VarLineNumber,
VarRewardName,
VarOrderDate,
VarLocalCost,
VarQuantity,
VarReasonofReturn,
CurrencyID,
FeesID,
0,
Country)

on duplicate key update 
EmployeeID=VarEmployeeID,
LineNumber=VarLineNumber,
RewardName=VarRewardName,
OrderDate=VarOrderDate,
LocalCost=VarLocalCost,
Quantity=VarQuantity,
ReasonofReturn=VarReasonofReturn,
Currency_ID=CurrencyID,
Fees_ID=FeesID,
DeletionFlag=0,
Country=VarCountry;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-19 11:00:21
