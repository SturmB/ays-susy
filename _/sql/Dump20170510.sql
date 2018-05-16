CREATE DATABASE  IF NOT EXISTS `acs2017` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `acs2017`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: skyfs    Database: acs2017
-- ------------------------------------------------------
-- Server version	5.5.49-log

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
-- Table structure for table `clipart_categories`
--

DROP TABLE IF EXISTS `clipart_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clipart_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `short_name` varchar(45) NOT NULL COMMENT 'The short name of this category of clipart.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clipart_categories`
--

LOCK TABLES `clipart_categories` WRITE;
/*!40000 ALTER TABLE `clipart_categories` DISABLE KEYS */;
INSERT INTO `clipart_categories` VALUES (1,'aircraft'),(2,'boat');
/*!40000 ALTER TABLE `clipart_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clipart_subcategories`
--

DROP TABLE IF EXISTS `clipart_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clipart_subcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `short_name` varchar(45) NOT NULL COMMENT 'The short name of the clipart type. Typically lower-case only and one word, using hyphens to separate words.',
  `long_name` varchar(256) NOT NULL COMMENT 'The long name of the clipart type. Typically capitalized properly and ready for displaying on the web page.',
  `cat_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Foreign key to the Clipart Category table, defining to which category this subcategory of clipart belongs.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `clipart_cat_id_idx` (`cat_id`),
  CONSTRAINT `clipart_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `clipart_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clipart_subcategories`
--

LOCK TABLES `clipart_subcategories` WRITE;
/*!40000 ALTER TABLE `clipart_subcategories` DISABLE KEYS */;
INSERT INTO `clipart_subcategories` VALUES (1,'jets','Jets',1),(2,'turboprop','Turbo Props',1),(3,'multi-eng','Multi-Engine Planes',1),(4,'single-eng','Single-Engine Planes',1),(5,'helicopter','Helicopters',1),(6,'clouds','Clouds',1),(7,'motoryacht','Motor Yachts',2),(8,'daycruiser','Day Cruisers',2),(9,'speedboat','Speed Boats',2),(10,'sailboat','Sail Boats',2),(11,'ketch','Ketches',2),(12,'sportfish','Sport Fish Boats',2),(13,'houseboat','House Boats',2),(14,'pontoon','Pontoons',2),(15,'theme','Themed',2);
/*!40000 ALTER TABLE `clipart_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_types`
--

DROP TABLE IF EXISTS `color_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the color type is active.',
  `short_name` varchar(45) NOT NULL COMMENT 'The short name of the type of color.',
  `long_name` varchar(256) NOT NULL COMMENT 'The long name of the type of color. Mostly used for outputting as text to web page.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_types`
--

LOCK TABLES `color_types` WRITE;
/*!40000 ALTER TABLE `color_types` DISABLE KEYS */;
INSERT INTO `color_types` VALUES (1,1,'ink-standard','Standard Ink Colors'),(2,1,'ink-metallic','Metallic Ink Colors'),(3,1,'ink-neon','Neon Ink Colors'),(4,1,'foil','Foil Colors'),(5,1,'product','Product Colors');
/*!40000 ALTER TABLE `color_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the color is active.',
  `short_name` varchar(45) NOT NULL COMMENT 'The name of the color. *THERE MAY BE MULTIPLE ENTRIES WITH THE SAME COLOR NAME.* This means that different manufacturers make the same color, but they have different shades. The differentiator will be the closest equivalent Pantone match, which is in the “pantone” column.',
  `long_name` varchar(256) NOT NULL,
  `pantone` varchar(32) DEFAULT NULL COMMENT 'The Pantone equivalent to the color name. This will vary from manufacturer to manufacturer.',
  `hex` varchar(6) DEFAULT NULL,
  `color_type` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to denote what type of color this is (Product, Standard Ink, Foil, etc.).',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `color_type_idx` (`color_type`),
  CONSTRAINT `color_type` FOREIGN KEY (`color_type`) REFERENCES `color_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,1,'Ivory','Ivory','7499 U','FAEDBC',5),(2,1,'Yellow','Yellow','115 U','FFCE2E',5),(3,1,'Orange','Orange','Orange 021 U','FF6C2F',5),(4,1,'Pink','Pink','706 U','FFCAD4',5),(5,1,'Red','Red','186 U','D2515E',5),(6,1,'Burg','Burgundy','194 U','A35965',5),(7,1,'Lt Green','Light Green','367 U','8FD16A',5),(8,1,'Green','Green','355 U','19975D',5),(9,1,'Dk Green','Dark Green','341 U','347963',5),(10,1,'Lt Blue','Light Blue','2975 U','8BD5EE',5),(11,1,'Aqua','Aqua','311 U','01BEDB',5),(12,1,'Blue','Blue','286 U','3255A4',5),(13,1,'Dk Blue','Dark Blue','294 U','385988',5),(14,1,'Magenta','Magenta','219 U','E45C96',5),(15,1,'Purple','Purple','2755 U','5D538B',5),(16,1,'Silver','Silver','429 U','91999F',5),(17,1,'Choc','Chocolate','497 U','715956',5),(18,1,'Black','Black','Black','222222',5),(19,1,'Natural','Natural',NULL,NULL,5),(20,1,'Burlap','Burlap',NULL,NULL,5),(21,1,'Dish/Red','Dishtowel / Red',NULL,NULL,5),(22,1,'Dish/Blue','Dishtowel / Blue',NULL,NULL,5),(23,1,'Dish/Black','Dishtowel / Black',NULL,NULL,5),(24,1,'Natural','Natural','Translucent',NULL,5),(25,1,'Yellow','Yellow','123 C','FFC72C',5),(26,1,'Orange','Orange','151 C','FF8200',5),(27,1,'Pink','Pink','230 C','F4A6D7',5),(28,1,'Red','Red','186 C','C8102E',5),(29,1,'Burg','Burgundy','1955 C','8A1538',5),(30,1,'Green','Green','341 C','007A53',5),(31,1,'Dk Green','Dark Green','561 C','00594C',5),(32,1,'Blue','Blue','286 C','0033A0',5),(33,1,'Dk Blue','Dark Blue','2767 C','13294B',5),(34,1,'Purple','Purple','2597 C','5C068C',5),(35,1,'Green','Green','354 C','00B140',5),(36,1,'Purple','Purple','266 C','753BBD',5),(37,1,'Smoke','Smoke','Cool Gray 9 C','75787B',5),(38,1,'Clear','Clear','Clear',NULL,5),(39,1,'Red','Red','187 C','A6192E',5),(40,1,'Dk Blue','Dark Blue','282 C','041E42',5),(41,1,'White','White','White','FFFFFF',5),(42,1,'Red','Red','186','C8102E',1),(43,1,'Orange','Orange','Orange 021','FE5000',1),(44,1,'Athletic Gold','Athletic Gold','1235','FFB81C',1),(45,1,'Yellow','Yellow','Yellow 012','FFD700',1),(46,1,'Green','Green','355','009639',1),(47,1,'Dk Green','Dark Green / Hunter','343','115740',1),(48,1,'Burg','Burgundy','202','862633',1),(49,1,'Maroon','Maroon','208','861F41',1),(50,1,'Teal','Teal','327','008675',1),(51,1,'Navy','Navy','281','00205B',1),(52,1,'Violet','Violet','Violet','440099',1),(53,1,'Purple','Purple','2592','9B26B6',1),(54,1,'Blue','Blue / Royal','Reflex Blue','001489',1),(55,1,'Lt Blue','Light Blue','297','71C5E8',1),(56,1,'Pink','Pink','210','F99FC9',1),(57,1,'Vanilla','Vanilla','726','E0C09F',1),(58,1,'Gray','Gray','430','7C878E',1),(59,1,'Brown','Brown','469','693F23',1),(60,1,'Metallic Gold','Metallic Gold','871 U','AD986E',2),(61,1,'Metallic Gold*','Metallic Gold','874 U*','AE8F6F',2),(62,1,'Metallic Copper','Metallic Copper','876 U','B08770',2),(63,1,'Metallic Silver','Metallic Silver','877 U','B4B7B9',2),(64,1,'Neon Blue','Neon Blue','801 U','009CCD',3),(65,1,'Neon Green','Neon Green','802 U','3BD23D',3),(66,1,'Neon Yellow','Neon Yellow','803 U','FFE916',3),(67,1,'Neon Orange','Neon Orange','804 U','FFAA52',3),(68,1,'Neon Red','Neon Red','805 U','FF7477',3),(69,1,'Neon Pink','Neon Pink','806 U','FF48B0',3),(70,1,'Neon Purple','Neon Purple','807 U','E838BF',3),(71,1,'Matte Gold*','Matte Gold',NULL,'D7BB84',4),(72,1,'Shiny Gold','Shiny Gold',NULL,'A39679',4),(73,1,'Shiny Silver','Shiny Silver',NULL,'8D8885',4),(74,1,'Matte Silver*','Matte Silver',NULL,'D9D2CD',4),(75,1,'Copper','Copper',NULL,'986945',4),(76,1,'Red','Red',NULL,'9B5041',4),(77,1,'Burg','Burgundy',NULL,'793F3C',4),(78,1,'Dk Purple','Dark Purple',NULL,'4E3B57',4),(79,1,'Blue','Blue',NULL,'0E4E79',4),(80,1,'Teal','Teal',NULL,'1F6E6D',4),(81,1,'Green','Green',NULL,'097A47',4);
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_codes`
--

DROP TABLE IF EXISTS `coupon_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `code` varchar(45) NOT NULL COMMENT 'The coupon code.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_codes`
--

LOCK TABLES `coupon_codes` WRITE;
/*!40000 ALTER TABLE `coupon_codes` DISABLE KEYS */;
INSERT INTO `coupon_codes` VALUES (1,'6R'),(2,'7R2S'),(3,'2R3STUV'),(4,'3R3ST2UV'),(5,'R3ST2UV'),(6,'8R'),(7,'2V'),(8,'8RS');
/*!40000 ALTER TABLE `coupon_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `priority` smallint(6) NOT NULL COMMENT 'The priority of the feature/option. The higher the priority, the higher on the list it should appear.\n\n29000s and up: Highest priority stuff.\n28000s: Imprint method count.\n27000s: Individual imprint methods.\n	27600-28000: First, main print method detail.\n	27300s: Die methods.\n26000s: Ink & color info.\n25000s: “Optional” info.\n10000-12000: Number of colors possible.\n1000-10000: Item-specific info.\n	1000-2999: Napkins.\n		2000s: Ply count.\n		1000s: Other info.\n	3000s: Coasters.\n	4000s: Drink Stirrers, Food Piks, & Ice Cream Spoons.\n	5000s: Plates.\n	6000-7999: Cups.\n<1000: Bottom of the list stuff.\n',
  `feature` varchar(256) NOT NULL COMMENT 'A feature or option for the subcategory & print method.',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'The self-referencing foreign key of the feature/option of which *this* feature/option is a subset.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `priority_UNIQUE` (`priority`),
  KEY `group_idx` (`parent_id`),
  CONSTRAINT `group` FOREIGN KEY (`parent_id`) REFERENCES `features` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,100,'Made & printed in the U.S.A.',NULL),(2,300,'Made from renewable resources',NULL),(3,400,'Biodegradable',NULL),(4,500,'Recyclable',NULL),(5,28500,'5 imprint methods available:',NULL),(6,27320,'Deboss/Emboss',5),(7,27380,'Hot Stamp',5),(8,27400,'Traditional 4-Color Process',5),(9,27850,'Screen Printed: unlimited spot colors',5),(10,1500,'Looks & feels like real linen',NULL),(11,2120,'Heavyweight single ply material',NULL),(12,600,'Recyclable & Biodegradable',NULL),(13,1300,'Dinner napkin has right side fold',NULL),(14,1400,'Guest towel has top fold',NULL),(15,2100,'Single ply absorbent facial quality',NULL),(16,26200,'Metallic and neon ink colors offered at no extra cost',NULL),(17,26300,'Free PMS matching',NULL),(18,27950,'Digitally Printed with 4-Color Process',NULL),(19,29100,'Personalization & 1 color included in the price',NULL),(20,28550,'5 Print methods available: Screen Print, Hot Stamp, Emboss, Deboss, 4CP',NULL),(21,200,'Made from 20% recycled fibers',NULL),(22,2200,'2 ply facial quality material',NULL),(23,26100,'White opaque ink available',NULL),(24,28400,'4 imprint methods available:',NULL),(25,150,'Economical for multiple color imprints',NULL),(26,2300,'3 ply facial quality material',NULL),(27,27650,'Offset Printed: 1–4 spot colors',NULL),(28,25700,'Optional 2nd Side Imprint Available',NULL),(29,1600,'Excellent replacement for linen that will not lint',NULL),(30,2140,'Single ply, thick, soft, and fluffy feel',NULL),(31,3400,'Available in white 14 pt. cardstock',NULL),(32,25800,'Full Bleed Imprint Optional',NULL),(33,28300,'3 imprint methods available:',NULL),(34,27360,'Deboss',NULL),(35,27750,'Pad Printed: 1–5 spot colors',NULL),(36,27340,'Emboss',NULL),(38,3600,'Available in 3 thicknesses: 40 / 60 / 80 pt.',NULL),(39,3500,'White high-density pulpboard',NULL),(40,4500,'Heavyweight plastic or wood',NULL),(41,220,'Made from 100% recycled fibers',NULL),(42,9900,'Heavyweight plastic',NULL),(43,5500,'Slot allows for Stemware',NULL),(44,5400,'Recessed well accepts tumbler',NULL),(45,5300,'Elegant disposable alternative to fine china',NULL),(46,9800,'Fluted design for an upscale table setting',NULL),(47,5700,'Classic scalloped edges',NULL),(48,28200,'2 imprint methods available:',NULL),(49,5600,'Coated paper plate',NULL),(50,26120,'White ink available',NULL),(51,11000,'No extra cost for 1 side, 2 side, or wrap imprint',NULL),(52,10000,'Multi-color imprints available 1 side only',NULL),(53,6100,'Interior is poly coated',NULL),(54,6200,'Great for hot & cold beverages',NULL),(55,280,'Recyclable where facilities exist',NULL),(56,6220,'Eliminates the need for double cupping or sleeves',NULL),(57,6240,'Double walled design provides excellent insulation',NULL),(58,10100,'Imprint available 1 side only',NULL),(59,25600,'2nd side imprint optional***',NULL),(60,700,'Compostable',NULL),(61,6120,'Interior is PLA coated',NULL),(62,12000,'Economical for multiple color imprints',NULL),(91,6420,'A unique vessel for food/drink presentations',NULL),(92,6440,'Great for displaying signature cocktails',NULL),(93,6360,'Rigid polystyrene tumbler',NULL),(94,6380,'Very elegant look',NULL),(95,6400,'Beautiful fluted finish reflects light',NULL),(96,6320,'Detachable bases',NULL),(97,6340,'2-piece design for freight savings',NULL),(98,6500,'Ideal for places where glass is prohibited',NULL),(99,6520,'Looks & feels like real glass',NULL),(100,6540,'Microwave safe / top-rack dishwasher safe',NULL),(101,6560,'Tritan™ Plastic will not haze or crack',NULL),(102,6580,'Made from shatterproof Tritan™ Plastic',NULL),(103,6600,'Made from shatterproof PET',NULL),(104,6620,'Style & sophistication with single-serve convenience',NULL),(105,6640,'A stunning vessel for food/drink presentations',NULL),(106,6660,'Smooth plastic finish',NULL),(107,6700,'Unique, frosted, textured surface',NULL),(108,6720,'Flexible plastic provides unbreakable & durable design',NULL),(109,6740,'Flexible & shatter resistant',NULL),(110,6760,'Elegant frosted finish',NULL),(111,800,'Recyclable / reusable product',NULL),(112,6800,'Matching push / pull lids included',NULL),(113,6850,'CPSIA / CA Prop 65 certified',NULL),(114,6860,'BPA / Lead free',NULL),(115,6880,'Individually poly-bagged',NULL),(116,6820,'Matching snap on lid & straw included',NULL),(117,6900,'Individually poly-bagged*',NULL),(118,6870,'16 oz. Drink Logic® snap on lid available',NULL),(119,27660,'Offset Printed: 1–6 spot colors',NULL),(120,6920,'Made from soft, flexible PET plastic',NULL),(121,900,'Compostable*',NULL),(122,6940,'Made from PLA plastic',NULL),(123,7000,'CFC Free',NULL),(124,7020,'Traditional insulated foam cup',NULL),(125,7100,'Great for sampling programs',NULL),(126,26140,'White ink available on clear items',NULL),(127,6810,'Economical alternative to acrylic double wall tumblers',NULL);
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featuresjoining`
--

DROP TABLE IF EXISTS `featuresjoining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featuresjoining` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Foreign key of the id of the paren’t feature from the same table.',
  `feature_id` int(10) unsigned NOT NULL COMMENT 'Foreign key that represents an sub-feature.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `feature_id_idx` (`feature_id`),
  KEY `parent_id_idx` (`parent_id`),
  CONSTRAINT `f_id` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `par_id` FOREIGN KEY (`parent_id`) REFERENCES `features` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featuresjoining`
--

LOCK TABLES `featuresjoining` WRITE;
/*!40000 ALTER TABLE `featuresjoining` DISABLE KEYS */;
INSERT INTO `featuresjoining` VALUES (1,5,6),(2,5,7),(3,5,8),(4,5,9),(5,24,6),(6,24,7),(7,24,9),(8,33,7),(9,33,34),(10,33,35),(11,48,8),(12,48,35),(13,48,7);
/*!40000 ALTER TABLE `featuresjoining` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `print_methods`
--

DROP TABLE IF EXISTS `print_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the print method is active.',
  `short_name` varchar(45) NOT NULL COMMENT 'The short name of the print method. i.e., “Traditions”',
  `long_name` varchar(255) DEFAULT NULL COMMENT 'The long name of the print method. i.e., “American Traditions.”',
  `prefix` varchar(10) DEFAULT NULL COMMENT 'The prefix used in combination with the item number of a product.',
  `short_description` text COMMENT 'A short, one-sentence description of the print method.',
  `long_description` text COMMENT 'A long description of the print method; generally one paragraph in length.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `print_methods`
--

LOCK TABLES `print_methods` WRITE;
/*!40000 ALTER TABLE `print_methods` DISABLE KEYS */;
INSERT INTO `print_methods` VALUES (1,1,'digital','American Digital','D-','Low minimums, high quality, & quick turn around','The American Digital Line is a new and innovative way to get brilliant photo and graphical replication of special effects such as shadows, highlights, & dramatic contrasts. This state of the art digital 4-color process allows us to print amazing art with incredible detail. See the General Info section from the main menu for detailed print characteristics.'),(2,1,'tradition','American Tradition','T-','Low minimums, high quality, & quick turn around','The American Tradition Line is great for low minimums, high quality, and quick turn around. It includes: screen, pad, hot stamping, embossing, debossing, and traditional 4-color process printing methods. See the General Info section from the main menu for detailed print characteristics.'),(3,1,'hispeed','American Hi-Speed','H-','Quantity of 10,000 to 1 million+, “food service grade”','The American Hi-Speed Line is great for the cost conscious consumer, providing pricing for quantities of up to one million plus pieces. Multi-color imprints are very economical. Sometimes referred to as “food service grade.” See the General Info section from the main menu for detailed print characteristics.');
/*!40000 ALTER TABLE `print_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the product category is active.',
  `short_name` varchar(45) NOT NULL COMMENT 'The short name of the category.',
  `long_name` varchar(256) NOT NULL COMMENT 'The long name of the category.',
  `text_notes` text COMMENT 'Text notes (if any) that appear below the “Features & Options” list on the product page.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,1,'napkin','Napkins','<div id=\"text-notes\">\n  <p><span class=\"color-accent\">Be sure to specify:</span> Napkin color, Imprint method, Imprint placement, Standard ink color below or provide us with your PMS ink number.</p>\n  <dl>\n    <dt>Hot Stamp -</dt>\n    <dd>One time $40 die charge (Hot stamp foil) (1-die)</dd>\n    <dt>Deboss -</dt>\n    <dd>One time $40 die charge (Recessed image) (1-die)</dd>\n    <dt>Emboss -</dt>\n    <dd>One time $60 die charge (Raised image) (2-dies) <span class=\"aside\">(male &amp; female)</span></dd>\n  </dl>\n</div>'),(2,1,'coaster','Coasters',NULL),(3,1,'stirpik','Drink Stirrers, Food Piks, & Ice Cream Spoons',NULL),(4,1,'plate','Plates',NULL),(5,1,'cup','Drinkware',NULL),(6,1,'misc','Miscellaneous',NULL);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_subcategories`
--

DROP TABLE IF EXISTS `product_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_subcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the product subcategory is active.',
  `short_name` varchar(45) NOT NULL COMMENT 'The short name of the product subcategory.',
  `long_name` varchar(256) NOT NULL COMMENT 'The long name of the product subcategory.',
  `category_id` int(10) unsigned NOT NULL COMMENT 'The foreign key of the main product category to which this subcategory belongs.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_subcategories`
--

LOCK TABLES `product_subcategories` WRITE;
/*!40000 ALTER TABLE `product_subcategories` DISABLE KEYS */;
INSERT INTO `product_subcategories` VALUES (1,1,'color','Colored Napkins',1),(2,1,'n10-white','White Beverage Napkins',1),(3,1,'n13-white','White Luncheon Napkins',1),(4,1,'n17-white','White Dinner Napkins',1),(5,1,'linen','White Almost Linen™ Napkins',1),(6,1,'guesttowels','Guest Towels',1),(7,1,'fashnpoint','Fashn Point® Napkins',1),(8,1,'budget','Budgetboard Coasters',2),(9,1,'pulp','Pulpboard Coasters',2),(10,1,'drinkstirrers','Drink Stirrers',3),(11,1,'foodpiks','Food Piks & Ice Cream Spoons',3),(12,1,'eco','Eco-Plates',4),(13,1,'tray','Plastic Trays',4),(14,1,'classicmilan','Classicware® & Milan™ Plates',4),(15,1,'plastic-white','White Plastic Plates',4),(16,1,'plastic-color','Colored Plastic Plates',4),(17,1,'paper-white','White Paper Plates',4),(18,1,'paper-color','Colored Paper Plates',4),(19,1,'paper-color','Colored Paper Cups',5),(20,1,'paper-insulated','Insulated Paper Cups',5),(21,1,'wrap','Beverage Wraps',5),(22,1,'ecopaper-white','Eco-Friendly Paper Cups',5),(23,1,'paper-white','White Paper Cups',5),(24,1,'clearfluted','Clear Fluted Plastic Cups',5),(25,1,'clearplastic-specialty','Clear Plastic Specialty Cups',5),(26,1,'reserv','Reserv™ Stemless Collection',5),(27,1,'symglass','symGLASS™',5),(28,1,'clearplastic','Clear Plastic Cups',5),(29,1,'frostflex','Frost Flex™ Cups',5),(30,1,'sportbottle-fitness','Sport Bottles - Fitness',5),(31,1,'sportbottle-journey','Sport Bottles - Journey',5),(32,1,'doublewall-bolero','Double Wall Tumblers - Bolero',5),(33,1,'doublewall-partycup','Double Wall Tumblers - Party Cup',5),(34,1,'stadium-color','Colored Stadium Cups',5),(35,1,'stadium-white','White Stadium Cups',5),(36,1,'softsided-clear','Clear Soft Sided Cups',5),(37,1,'greenware','Greenware® Cold Cups',5),(38,1,'foam','Foam Cups',5),(39,1,'sampling','Sampling Cups',5),(40,1,'lids','Lids',6),(41,1,'straws-tips','Straws & Tips',6),(42,1,'utensils','Utensils',6);
/*!40000 ALTER TABLE `product_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Good ol’ integer Primary Key.',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the product is active.',
  `item_num` varchar(256) NOT NULL COMMENT 'The item number as shown in the catalog WITHOUT the print method prefix.',
  `description` varchar(1024) NOT NULL COMMENT 'Description of the product as shown in the catalog.',
  `subcategory_id` int(10) unsigned NOT NULL COMMENT 'Foreign key of the subcategory to which this product belongs.',
  `case_quantity` int(10) unsigned NOT NULL COMMENT 'Number of products in a case (or box).',
  `case_weight` tinyint(3) unsigned NOT NULL COMMENT 'The weight of the case in pounds.',
  `case_dim_weight` tinyint(3) unsigned NOT NULL COMMENT 'The “Dimensional Weight” of the case in pounds. (Not the *actual* weight.)',
  `case_length` tinyint(3) unsigned NOT NULL COMMENT 'Length of the case.',
  `case_width` tinyint(3) unsigned NOT NULL COMMENT 'Width of the case.',
  `case_height` tinyint(3) unsigned NOT NULL COMMENT 'Height of the case.',
  `dim_top` float unsigned DEFAULT NULL COMMENT 'The dimension of the top of the product in inches. (Usually a diameter.) NULL typically means it is a flat item.',
  `dim_height` float unsigned DEFAULT NULL COMMENT 'The dimension of the height of the product in inches. NULL typically means it is a flat item.',
  `dim_base` float unsigned DEFAULT NULL COMMENT 'The dimension of the bottom (or base) of the product in inches. (Usually a diameter.) NULL typically means it is a flat item.',
  `item_width` float unsigned DEFAULT NULL COMMENT 'The width of the item. NULL typically means it is *not* a flat item. One dimension typically means it is a diameter.',
  `item_height` float unsigned DEFAULT NULL COMMENT 'The height of the item. NULL typically means it is *not* a flat item. One dimension typically means it is a diameter.',
  `pallet_quantity` smallint(6) unsigned NOT NULL COMMENT 'The number of cases (boxes) that ship on a single pallet.',
  `pallet_length` tinyint(3) unsigned NOT NULL COMMENT 'The length of the pallet in inches when fully loaded with cases.',
  `pallet_width` tinyint(3) unsigned NOT NULL COMMENT 'The width of the pallet in inches when fully loaded with cases.',
  `pallet_height` tinyint(3) unsigned NOT NULL COMMENT 'The height of the pallet in inches when fully loaded with cases.',
  `pallet_weight` smallint(6) unsigned NOT NULL COMMENT 'The weight of the pallet in pounds when fully loaded with cases.',
  `class_code` smallint(6) unsigned NOT NULL COMMENT 'The class code of the item.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `subcategory_id_idx` (`subcategory_id`),
  CONSTRAINT `subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `product_subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'N10 - (COLOR)','Beverage Napkin - (Color)',1,2500,20,19,21,16,9,NULL,NULL,NULL,5,5,54,40,48,77,1025,70),(2,1,'N13 - (COLOR)','Luncheon Napkin - (Color)',1,1800,25,30,22,15,15,NULL,NULL,NULL,6.75,6.75,30,40,48,94,775,70),(3,1,'N17 - (COLOR)','Dinner Napkin - (Color)',1,1000,23,26,18,18,13,NULL,NULL,NULL,4.25,8.25,24,40,48,82,625,70),(4,1,'N10 - WHITE','Beverage Napkin - White',2,2500,21,19,21,16,9,NULL,NULL,NULL,5,5,54,40,48,77,1150,70),(5,1,'N13 - WHITE','Luncheon Napkin - White',3,1800,28,30,22,15,15,NULL,NULL,NULL,6.75,6.75,30,40,48,79,900,70),(6,1,'N17 - WHITE','Dinner Napkin - White',4,1000,23,26,18,18,13,NULL,NULL,NULL,4.25,8.5,24,40,48,82,625,70),(7,1,'N10L - WHITE','Almost Linen Beverage Napkin - White',5,1000,9,11,15,11,11,NULL,NULL,NULL,5,5,108,40,48,100,1025,70),(8,1,'N17L - WHITE','Almost Linen Dinner Napkin - White',5,1000,24,28,21,17,13,NULL,NULL,NULL,4.25,8.5,24,40,48,82,625,70),(9,1,'GTL - WHITE','Almost Linen Guest Towel - White',5,1000,15,20,18,10,18,NULL,NULL,NULL,4.25,8.375,40,40,48,76,650,70),(10,1,'GT - WHITE','Guest Towel - White',6,1600,26,26,18,18,13,NULL,NULL,NULL,4.125,8.5,24,40,48,82,675,70),(11,1,'N17F - (COLOR)','FashnPoint® Dinner Napkin - (Color)',7,1000,18,26,18,18,13,NULL,NULL,NULL,4,7.75,24,40,48,82,500,70),(12,1,'N17F - (DISHTOWEL / COLOR)','FashnPoint® Dinner Napkin - (Dishtowel / Color)',7,1000,18,26,18,18,13,NULL,NULL,NULL,4,7.75,24,40,48,82,500,70),(13,1,'C14RD35','14 PT 3.5\" Round Coaster',8,3600,17,7,15,10,7,NULL,NULL,NULL,3.5,NULL,84,40,48,54,1500,70),(14,1,'C14SQ35','14 PT 3.5\" Square Coaster',8,3600,22,7,15,10,7,NULL,NULL,NULL,3.5,3.5,84,40,48,54,1750,70),(15,1,'C14RD40','14 PT 4.0\" Round Coaster',8,3600,19,7,13,13,6,NULL,NULL,NULL,4,NULL,54,40,48,41,1100,70),(16,1,'C14SQ40','14 PT 4.0\" Square Coaster',8,3600,24,8,13,13,7,NULL,NULL,NULL,4,4,56,40,48,60,1400,70),(17,1,'C40RD35','40 PT 3.5\" Round Coaster',9,5000,34,21,19,15,12,NULL,NULL,NULL,3.5,NULL,42,40,48,88,1500,70),(18,1,'C40SQ35','40 PT 3.5\" Square Coaster',9,5000,39,21,19,15,12,NULL,NULL,NULL,3.5,3.5,42,40,48,88,1675,70),(19,1,'C40RD40','40 PT 4.0\" Round Coaster',9,2000,17,11,17,9,11,NULL,NULL,NULL,4,NULL,60,40,48,58,1100,70),(20,1,'C40SQ40','40 PT 4.0\" Square Coaster',9,2000,21,11,17,9,11,NULL,NULL,NULL,4,4,60,40,48,58,1350,70),(21,1,'C60RD35','60 PT 3.5\" Round Coaster',9,3500,33,21,19,15,12,NULL,NULL,NULL,3.5,NULL,42,40,48,88,1450,70),(22,1,'C60SQ35','60 PT 3.5\" Square Coaster',9,3500,41,21,19,15,12,NULL,NULL,NULL,3.5,3.5,42,40,48,88,1800,70),(23,1,'C80RD35','80 PT 3.5\" Round Coaster',9,2500,34,21,19,15,12,NULL,NULL,NULL,3.5,NULL,42,40,48,88,1500,70),(24,1,'C80SQ35','80 PT 3.5\" Square Coaster',9,2500,41,14,19,15,12,NULL,NULL,NULL,3.5,3.5,42,40,48,88,1800,70),(25,1,'DS10 - WHITE','6.25\" Upright Rectangle Plastic Drink Stirrer - White',10,500,6,4,11,7,8,NULL,NULL,NULL,6.25,NULL,108,40,48,52,700,70),(26,1,'DS11 - WHITE','5.75\" Rectangle Plastic Drink Stirrer - White',10,500,6,4,11,7,8,NULL,NULL,NULL,5.75,NULL,108,40,48,52,700,70),(27,1,'DS12 - WHITE','6\" Paddle Plastic Drink Stirrer - White',10,1000,6,4,11,7,8,NULL,NULL,NULL,6,NULL,108,40,48,52,700,70),(28,1,'DS13 - WHITE','6\" Upright Oval Plastic Drink Stirrer - White',10,500,6,4,11,7,8,NULL,NULL,NULL,6,NULL,108,40,48,52,700,70),(29,1,'DS14 - WHITE','6\" Round Plastic Drink Stirrer - White',10,500,6,4,11,7,8,NULL,NULL,NULL,6,NULL,108,40,48,52,700,70),(30,1,'DS15 - WHITE','6\" Oval Plastic Drink Stirrer - White',10,500,6,4,11,7,8,NULL,NULL,NULL,6,NULL,108,40,48,52,700,70),(31,1,'DS18 - WOOD','6\" Paddle Wood Drink Stirrer',10,1000,6,4,11,7,8,NULL,NULL,NULL,6,NULL,108,40,48,52,700,70),(32,1,'DS19 - WOOD','6.25\" Upright Rectangle Wood Drink Stirrer',10,500,6,4,11,7,8,NULL,NULL,NULL,6.25,NULL,108,40,48,52,700,70),(33,1,'DS20 - WOOD','6\" Round Wood Drink Stirrer',10,500,60,4,11,7,8,NULL,NULL,NULL,6,NULL,108,40,48,52,700,70),(34,1,'FP10 - WHITE','5.5\" Round Plastic Food Pik - White',11,1000,6,4,11,7,8,NULL,NULL,NULL,5.5,NULL,108,40,48,52,700,70),(35,1,'FP11 - WHITE','4\" Round Plastic Food Pik - White',11,1000,6,4,11,7,8,NULL,NULL,NULL,4,NULL,108,40,48,52,700,70),(36,1,'FP12 - WHITE','5\" Upright Rectangle Plastic Food Pik - White',11,1000,6,4,11,7,8,NULL,NULL,NULL,5,NULL,108,40,48,52,700,70),(37,1,'FP13 - WHITE','4\" Upright  Rectangle Plastic Food Pik - White',11,1000,6,4,11,7,8,NULL,NULL,NULL,4,NULL,108,40,48,52,700,70),(38,1,'FP14 - WHITE','4\" Oval Plastic Food Pik - White',11,500,6,4,11,7,8,NULL,NULL,NULL,4,NULL,108,41,48,52,700,70),(39,1,'FP15 - WHITE','3.5\" Rectangle Plastic Food Pik - White',11,500,6,4,11,7,8,NULL,NULL,NULL,3.5,NULL,108,40,48,52,700,70),(40,1,'FP16 - WOOD','4.5\" Paddle Wood Food Pik',11,1000,6,4,11,7,8,NULL,NULL,NULL,4.5,NULL,108,40,48,52,700,70),(41,1,'FP17 - WOOD','4\" Round Wood Food Pik',11,1000,6,4,11,7,8,NULL,NULL,NULL,4,NULL,108,40,48,52,700,70),(42,1,'FP18 - WOOD','5\" Upright Oval Wood Food Pik',11,1000,6,4,11,7,8,NULL,NULL,NULL,5,NULL,108,40,48,52,700,70),(43,1,'ICS10 - WOOD','3.75\" Wood Ice Cream Spoon',11,1000,6,4,11,7,8,NULL,NULL,NULL,3.75,NULL,108,40,48,52,700,70),(44,1,'ECOP6','6\" Eco - Plate',12,1000,17,15,14,13,13,NULL,NULL,NULL,6,NULL,63,40,48,95,1150,70),(45,1,'ECOP9','9\" Eco - Plate',12,500,18,16,18,14,10,NULL,NULL,NULL,8.75,NULL,72,40,48,94,1350,70),(46,1,'ECOP10','10\" Eco - Plate',12,500,28,23,21,16,11,NULL,NULL,NULL,10.25,NULL,56,40,48,81,1600,70),(47,1,'CCT','Clear Plastic Milan™ Cocktail Tray',13,120,17,10,18,9,10,NULL,NULL,NULL,8.25,8.25,90,40,48,85,1600,70),(48,1,'CW75 - CLEAR','7.5\" ClassicWare® Plastic Plate - Clear',14,180,12,7,16,8,8,NULL,NULL,NULL,7.5,NULL,120,40,48,68,1500,70),(49,1,'CW9 - CLEAR','9\" ClassicWare® Plastic Plate - Clear',14,180,19,10,15,10,10,NULL,NULL,NULL,9,NULL,96,40,48,74,1850,70),(50,1,'CW10 - CLEAR','10\" ClassicWare® Plastic Plate - Clear',14,144,20,10,13,11,11,NULL,NULL,NULL,10.25,NULL,72,40,48,82,1750,70),(51,1,'MS6 - CLEAR','Small Milan™ Plastic Plate - Clear',14,168,9,4,12,7,7,NULL,NULL,NULL,5.375,5.375,180,40,48,75,1675,70),(52,1,'MS75 - CLEAR','Medium Milan™ Plastic Plate - Clear',14,168,13,6,15,8,8,NULL,NULL,NULL,6.75,6.75,120,40,48,89,1600,70),(53,1,'MS9 - CLEAR','Large Milan™ Plastic Plate - Clear',14,168,20,9,17,10,8,NULL,NULL,NULL,8.25,8.25,64,40,48,78,1350,70),(54,1,'PLP7 - WHITE','7\" Plastic Plate - White',15,1000,21,17,15,15,12,NULL,NULL,NULL,7,NULL,72,40,48,97,1550,70),(55,1,'PLP9 - WHITE','9\" Plastic Plate - White',15,500,20,12,19,10,10,NULL,NULL,NULL,9,NULL,81,40,48,94,1650,70),(56,1,'PLP10 - WHITE','10\" Plastic Plate - White',15,500,27,17,21,11,12,NULL,NULL,NULL,10.25,NULL,56,40,48,89,1550,70),(57,1,'PLP7 - (COLOR)','7\" Plastic Plate - (Color)',16,250,7,5,12,8,8,NULL,NULL,NULL,7,NULL,180,40,48,77,1300,70),(58,1,'PAP7 - WHITE','7\" Coated Paper Plate - White',17,1000,17,11,15,8,15,NULL,NULL,NULL,7.125,NULL,90,40,48,94,1600,70),(59,1,'PAP9 - WHITE','9\" Coated Paper Plate - White',17,500,14,11,18,10,10,NULL,NULL,NULL,8.75,NULL,90,40,48,94,1300,70),(60,1,'PAP9 - (COLOR)','9\" Coated Paper Plate - (Color)',18,250,8,8,13,9,10,NULL,NULL,NULL,9,NULL,90,40,48,94,800,70),(61,1,'PC9 - (COLOR)','9oz Paper Cup - (Color)',19,500,11,12,16,7,17,3.125,3.75,2,NULL,NULL,68,40,48,73,800,70),(62,1,'IPC8 - WHITE','8oz Paper Cup Insulated - White',20,600,23,28,17,14,19,3.625,4.125,2.375,NULL,NULL,40,40,48,81,1000,150),(63,1,'IPC12 - WHITE','12oz Paper Cup Insulated - White',20,600,28,35,19,15,20,3.625,4.125,2.375,NULL,NULL,24,40,48,84,550,150),(64,1,'IPC16 - WHITE','16oz Paper Cup Insulated - White',20,600,36,42,19,15,24,3.625,5.25,2.375,NULL,NULL,18,40,48,76,700,100),(65,1,'BWS - WHITE','8/9 oz Beverage Wrap - White',21,1300,18,16,21,11,11,4.5,2.75,3.5,NULL,NULL,80,40,48,93,1500,70),(66,1,'BWS - KRAFT','8/9 oz Beverage  Wrap - Kraft',21,1300,18,16,21,11,11,4.5,2.75,3.5,NULL,NULL,80,40,48,93,1500,70),(67,1,'BWL - WHITE','12/16/20/24 oz Beverage Wrap - White',21,1300,19,16,21,11,11,5,2.75,4.5,NULL,NULL,80,40,48,93,1575,70),(68,1,'BWL - KRAFT','12/16/20/24 oz Beverage Wrap - Kraft',21,1300,19,16,21,11,11,5,2.75,4.5,NULL,NULL,80,40,48,93,1575,70),(69,1,'EPC4 - WHITE','4oz Eco-Friendly Paper Cup - White',22,1000,10,13,13,11,15,2.5,2.5,1.75,NULL,NULL,60,40,48,80,650,70),(70,1,'EPC8 - WHITE','8oz Eco-Friendly Paper Cup - White',22,1000,23,32,17,14,22,3.25,3.625,2.25,NULL,NULL,24,40,48,93,600,70),(71,1,'EPC12 - WHITE','12oz Eco-Friendly Paper Cup - White',22,1000,31,35,19,15,20,3.5,4.125,2.5,NULL,NULL,16,40,48,85,800,70),(72,1,'EPC16 - WHITE','16oz Eco-Friendly Paper Cup - White',22,1000,37,45,19,15,26,3.5,5.375,2.25,NULL,NULL,18,40,48,82,725,70),(73,1,'PC4 - WHITE','4oz Paper Cup - White',23,1000,10,13,13,11,14,2.5,2.375,1.75,NULL,NULL,72,40,48,88,800,70),(74,1,'PC6 - WHITE','6oz Paper Cup - White',23,1000,16,22,16,13,17,2.875,3.25,2,NULL,NULL,45,40,48,89,800,70),(75,1,'PC8 - WHITE','8oz Paper Cup - White',23,1000,20,26,17,14,18,3.125,3.75,2.125,NULL,NULL,45,40,48,94,950,700),(76,1,'PC10 - WHITE','10oz Paper Cup - White',23,1000,22,31,20,14,18,3.5,3.5,2.375,NULL,NULL,35,40,48,92,900,70),(77,1,'PC12 - WHITE','12oz Paper Cup - White ',23,1000,27,38,19,15,22,3.5,4.375,2.375,NULL,NULL,28,40,48,92,800,70),(78,1,'PC16 - WHITE','16oz Paper Cup - White',23,1000,33,43,18,15,26,3.5,5.375,2.375,NULL,NULL,21,40,48,80,800,70),(79,1,'CF2W','2 oz Clear Fluted Plastic Footed Wine Cup',24,240,5,7,12,9,10,2,2.25,1.75,NULL,NULL,144,40,48,84,775,70),(80,1,'CF5W','5 oz Clear Fluted Plastic Footed Wine Cup',24,240,9,15,16,11,14,2.5,3.375,2,NULL,NULL,50,40,48,88,500,70),(81,1,'CF8W','8 oz Clear Fluted Plastic Footed Wine Cup',24,240,11,21,18,12,16,3,4,2.25,NULL,NULL,40,40,48,85,500,150),(82,1,'CF8','8 oz Clear Fluted Plastic Cup',24,240,9,8,12,9,11,2.8125,3.3125,2,NULL,NULL,128,40,48,92,1200,70),(83,1,'CF9','9 oz Clear Fluted Plastic Cup',24,240,10,12,14,10,14,3.125,2.9375,2.625,NULL,NULL,72,40,48,88,775,70),(84,1,'CF9R','9 oz Clear Fluted Plastic Rocks Cup',24,240,9,8,15,11,8,3.5,3,2.3125,NULL,NULL,132,40,48,91,1250,70),(85,1,'CF10','10 oz Clear Fluted Plastic Cup',24,240,10,10,13,10,12,3,3.875,2.125,NULL,NULL,105,40,48,88,1100,70),(86,1,'CF12','12 oz Clear Fluted Plastic Cup',24,240,11,12,13,10,15,3,4.4375,2.125,NULL,NULL,90,40,48,94,1050,70),(87,1,'CF16','16 oz Clear Fluted Plastic Cup',24,240,17,16,14,11,17,3.125,5.625,2.125,NULL,NULL,70,40,48,89,1325,70),(88,1,'C2MT','2 oz Clear Plastic Mini Martini Cup',25,240,11,31,21,16,15,2.75,3.5,2.3125,NULL,NULL,30,40,48,79,400,150),(89,1,'C4C','4 oz Clear Plastic Champagne Cup',25,500,19,39,21,17,18,3.375,4.125,2.625,NULL,NULL,30,40,48,94,625,70),(90,1,'C5W','5 oz Clear Plastic Wine Goblet',25,500,19,31,20,14,18,2.625,4.5,2.625,NULL,NULL,30,40,48,90,625,70),(91,1,'CF5C','5 oz Clear Plastic Fluted Champagne Cup',25,120,7,15,16,11,14,2.5,8.25,2.625,NULL,NULL,72,40,48,89,575,150),(92,1,'C6MT','6 oz Clear Plastic Martini Cup',25,96,7,18,20,16,9,4.125,6,3.5,NULL,NULL,54,40,48,86,450,150),(93,1,'C12MG','12 oz Clear Plastic Margarita Cup',25,96,9,22,22,16,10,4.625,7,3.375,NULL,NULL,42,40,48,93,500,150),(94,1,'C12P','12 oz Clear Plastic Pilsner Cup',25,250,17,21,22,14,11,3,7.375,2.625,NULL,NULL,48,40,48,96,875,70),(95,1,'FF12','12 oz FunFusions™ 2PC Rocks Cup',25,48,8,9,15,8,12,3.5,4,2.375,NULL,NULL,90,40,48,77,775,70),(96,1,'RSFL10','10 oz Clear Plastic Reserv™ Stemless Flute',26,64,7,17,21,11,12,1.875,5.25,1.75,NULL,NULL,56,40,48,88,450,150),(97,1,'RSPG12','12 oz Clear Plastic Reserv™ Pilsner Glass',26,64,12,24,22,12,15,2.875,7,2.25,NULL,NULL,30,40,48,80,425,150),(98,1,'RSGL12','12 oz Clear Plastic Reserv™ Stemless Glass',26,64,7,19,14,14,16,2.5,3.625,2.375,NULL,NULL,45,40,48,85,375,250),(99,1,'RSGL14','14 oz Clear Plastic Reserv™ Stemless Glass',26,64,7,22,15,15,16,2.75,3.5,2.5,NULL,NULL,30,40,48,85,250,250),(100,1,'RSCG16','16 oz Clear Plastic Reserv™ Can Glass',26,64,7,22,13,13,21,2.5,5,2.375,NULL,NULL,36,40,48,89,300,250),(101,1,'SGOF10','10 oz Clear Plastic Old Fashioned symGLASS®',27,24,13,14,23,16,6,3.5,4.125,2.5,NULL,NULL,42,40,48,71,650,70),(102,1,'SGSLW12','12 oz Clear Plastic Stemless Wine symGLASS®',27,24,15,14,23,16,6,2.75,4.375,1.75,NULL,NULL,42,40,48,71,775,70),(103,1,'SGPG16','16 oz Clear Plastic Pint symGLASS®',27,24,15,19,23,17,8,3.5,6.25,2.5,NULL,NULL,42,40,48,93,825,70),(104,1,'C1','1 oz Clear Hard Plastic Shot Cup',28,2500,19,13,18,9,13,1.75,1.625,1.125,NULL,NULL,50,40,48,69,1000,70),(105,1,'C2','2 oz Clear Hard Plastic Shot Cup',28,2500,29,28,20,11,21,1.875,2.25,1.375,NULL,NULL,42,40,48,86,1200,70),(106,1,'C5R','5 oz Clear Hard Plastic Rocks Cup',28,1000,19,16,15,12,14,2.875,2.625,1.75,NULL,NULL,66,40,48,85,1300,70),(107,1,'C5','5 oz Clear Hard Plastic Cup',28,500,11,10,13,11,11,2.5625,2.9375,1.75,NULL,NULL,96,40,48,88,1100,70),(108,1,'C7','7 oz Clear Hard Plastic Cup',28,500,14,11,14,11,11,2.625,3.5,1.875,NULL,NULL,80,40,48,85,1200,70),(109,1,'C9R','9 oz Clear Hard Plastic Rocks Cup',28,500,15,15,18,15,9,3.5,2.875,2.0625,NULL,NULL,54,40,48,86,850,70),(110,1,'C10','10 oz Clear Hard Plastic Cup',28,500,19,17,15,13,14,3,3.875,2.125,NULL,NULL,54,40,48,88,1100,70),(111,1,'C12','12 oz Clear Hard Plastic Cup',28,500,21,22,16,13,17,3,4.4375,2.125,NULL,NULL,45,40,48,90,1000,70),(112,1,'C14','14 oz Clear Hard Plastic Cup',28,500,28,21,16,14,15,3.25,4.625,2.25,NULL,NULL,48,40,48,91,1400,70),(113,1,'C16','16 oz Clear Hard Plastic Cup',28,500,34,28,17,14,19,3.25,5.875,2.125,NULL,NULL,36,40,48,79,1275,70),(114,1,'P5','5 oz Frost-Flex™ Cup',29,500,9,10,13,11,11,2.5,2.875,1.75,NULL,NULL,105,40,48,76,1000,70),(115,1,'P8','8 oz Frost-Flex™ Cup',29,500,16,16,14,12,15,2.75,3.75,1.9375,NULL,NULL,50,40,48,80,850,70),(116,1,'P9R','9 oz Frost-Flex™ Rocks Cup',29,500,13,14,18,14,9,3.5,2.75,2,NULL,NULL,72,40,48,83,975,70),(117,1,'P10','10 oz Frost-Flex™ Cup',29,500,16,19,16,13,15,3,3.875,2.125,NULL,NULL,45,40,48,79,775,70),(118,1,'P12','12 oz Frost-Flex™ Cup',29,500,17,17,16,13,13,3.125,4.25,2.125,NULL,NULL,63,40,48,90,1200,70),(119,1,'P14','14 oz Frost-Flex™ Cup',29,500,20,22,17,14,15,3.25,4.625,2.1875,NULL,NULL,45,40,48,77,950,70),(120,1,'P16','16 oz Frost-Flex™ Cup',29,500,24,27,18,15,16,3.5,4.5,2.25,NULL,NULL,30,40,48,84,775,70),(121,1,'P20','20 oz Frost-Flex™ Cup',29,500,29,28,19,15,16,3.75,5.625,2.1875,NULL,NULL,30,40,48,84,925,70),(122,1,'P24','24 oz Frost-Flex™ Cup',29,500,34,33,19,15,19,3.75,5.625,2.625,NULL,NULL,24,40,48,80,875,70),(123,1,'B10 - (COLOR)','24oz Fitness Bottle - (Color)',30,100,17,53,24,18,20,2.5,8.875,2.75,NULL,NULL,16,40,48,83,325,250),(124,1,'B11 - (COLOR)','28oz Journey Bottle - (Color)',31,100,17,64,25,20,21,2.75,9.5,2.5,NULL,NULL,16,40,48,87,325,250),(125,1,'DW10 - (COLOR)','16oz Double Wall Bolero Tumbler - (Color)',32,60,11,27,20,17,13,3.75,5.5,2.5,NULL,NULL,42,40,48,94,525,70),(126,1,'DW11 - (COLOR)','16oz Double Wall Party Cup - (Color)',33,100,19,28,19,16,15,3.875,5.5,2.625,NULL,NULL,36,40,48,91,750,70),(127,1,'ST12 - (COLOR)','12oz Stadium Cup - (Color)',34,500,19,28,17,14,19,3.25,4.25,2.375,NULL,NULL,36,40,48,78,725,70),(128,1,'ST16 - (COLOR)','16oz Stadium Cup - (Color)',34,500,25,30,19,15,17,3.75,4.375,2.75,NULL,NULL,30,40,48,88,800,70),(129,1,'ST22 - (COLOR)','22oz Stadium Cup - (Color)',34,500,33,41,19,16,22,3.625,5.75,2.625,NULL,NULL,24,40,48,93,850,70),(130,1,'ST12 - WHITE','12 oz Stadium Cup - White',35,500,19,28,17,14,19,3.25,4.25,2.375,NULL,NULL,36,40,48,78,725,70),(131,1,'ST16 - WHITE','16 oz Stadium Cup - White',35,500,25,30,19,15,17,3.75,4.375,2.75,NULL,NULL,30,40,48,88,800,70),(132,1,'ST22 - WHITE','22 oz Stadium Cup - White',35,500,33,41,19,16,22,3.625,5.75,2.625,NULL,NULL,24,40,48,93,850,70),(133,1,'ST32 - WHITE','32 oz Stadium Cup - White',35,250,19,19,21,9,16,4,6.75,3,NULL,NULL,40,40,48,85,825,70),(134,1,'SS3 - CLEAR','3.5 oz Soft Sided Clear Plastic Cup',36,2500,21,18,13,13,17,2.5,2.375,1.5,NULL,NULL,60,40,48,90,1300,70),(135,1,'SS5 - CLEAR','5 oz Soft Sided Clear Plastic Cup',36,2500,35,30,15,15,22,2.75,2.875,1.5,NULL,NULL,24,40,48,93,900,70),(136,1,'SS10 - CLEAR','10 oz Soft Sided Clear Plastic Cup',36,1000,24,18,16,13,14,3.125,4,2,NULL,NULL,45,40,48,74,1125,70),(137,1,'SS12 - CLEAR','12/14 oz Soft Sided Clear Plastic Cup',36,1000,33,30,19,15,17,3.625,4.25,2.375,NULL,NULL,30,40,48,89,925,70),(138,1,'SS16 - CLEAR','16/18 oz Soft Sided Clear Plastic Cup',36,1000,41,33,20,16,17,3.875,4.75,2.5,NULL,NULL,30,40,48,90,1225,70),(139,1,'CG7','7 oz Clear Greenware® Cup',37,1000,18,19,16,13,15,2.9375,3.375,1.8125,NULL,NULL,45,40,48,81,875,70),(140,1,'CG9R','9 oz Clear Greenware® Rocks Cup',37,1000,20,24,19,16,13,3.625,2.875,2.1875,NULL,NULL,36,40,48,84,775,70),(141,1,'CG10','10 oz Clear Greenware® Cup',37,1000,22,23,16,13,18,3.125,4,2,NULL,NULL,45,40,48,94,1050,70),(142,1,'CG12','12 oz Clear Greenware® Cup',37,1000,28,31,19,15,18,3.625,4.1875,2.3125,NULL,NULL,30,40,48,93,900,70),(143,1,'CG16','16 oz Clear Greenware® Cup',37,1000,36,41,20,16,21,3.875,4.75,2.5,NULL,NULL,24,40,48,90,950,70),(144,1,'CG20','20 oz Clear Greenware® Cup',37,1000,40,42,19,15,24,3.625,5.5,2.4375,NULL,NULL,18,40,48,76,775,70),(145,1,'S4','4 oz Foam Cup',38,1000,5,27,16,10,27,2.6875,2.625,1.6875,NULL,NULL,40,40,48,84,250,250),(146,1,'S6','6 oz Foam Cup',38,1000,6,33,17,11,29,2.875,3.375,1.75,NULL,NULL,30,40,48,91,250,250),(147,1,'S8','8 oz Foam Cup',38,1000,8,40,18,12,30,3.125,3.8125,1.9375,NULL,NULL,27,40,48,94,250,250),(148,1,'S10','10 oz Foam Cup',38,1000,9,48,19,13,32,3.375,4,2,NULL,NULL,24,40,48,69,250,250),(149,1,'S12','12 oz Foam Cup',38,1000,10,57,20,13,36,3.5,4.5,2.125,NULL,NULL,16,40,48,76,200,250),(150,1,'S14','14 oz Foam Cup',38,1000,13,95,29,18,30,3.5,4.875,2.625,NULL,NULL,9,40,48,96,175,250),(151,1,'S16','16 oz Foam Cup',38,1000,14,92,32,17,28,3.75,5.375,2.375,NULL,NULL,9,40,48,89,175,250),(152,1,'S20','20 oz Foam Cup',38,500,9,61,21,14,34,3.75,6.125,2.375,NULL,NULL,14,40,48,76,175,250),(153,1,'S24','24 oz Foam Cup',38,500,11,72,22,15,36,3.875,7,2.375,NULL,NULL,14,40,48,75,225,250),(154,1,'S32','32 oz Foam Cup',38,500,13,94,26,17,35,4.5,6.625,2.9375,NULL,NULL,10,40,48,74,200,250),(155,1,'C1','1 oz Clear Hard Plastic Shot Cup',39,2500,19,13,18,9,13,1.75,1.625,1.125,NULL,NULL,50,40,48,69,1000,70),(156,1,'C2','2 oz Clear Hard Plastic Shot Cup',39,2500,29,28,20,11,21,1.875,2.25,1.375,NULL,NULL,42,40,48,86,1200,70),(157,1,'C5R','5 oz Clear Hard Plastic Rocks Cup',39,1000,19,16,15,12,14,2.875,2.625,1.75,NULL,NULL,66,40,48,85,1300,70),(158,1,'C5','5 oz Clear Hard Plastic Cup',39,500,11,10,13,11,11,2.5625,2.9375,1.75,NULL,NULL,96,40,48,88,1100,70),(159,1,'CF2W','2 oz Clear Fluted Plastic Footed Wine Cup',39,240,5,7,12,9,10,2,2.25,1.75,NULL,NULL,144,40,48,84,775,70),(160,1,'CF5W','5 oz Clear Fluted Plastic Footed Wine Cup',39,240,9,15,16,11,14,2.5,3.375,2,NULL,NULL,50,40,48,88,500,70),(161,1,'C2MT','2 oz Clear Plastic Mini Martini Cup',39,240,11,31,21,16,15,2.75,3.5,2.3125,NULL,NULL,30,40,48,79,400,150),(162,1,'P5','5 oz Frost-Flex™ Cup',39,500,9,10,13,11,11,2.5,2.875,1.75,NULL,NULL,105,40,48,76,1000,70),(163,1,'SS3 - CLEAR','3.5 oz Soft Sided Clear Plastic Cup',39,2500,21,18,13,13,17,2.5,2.375,1.5,NULL,NULL,60,40,48,90,1300,70),(164,1,'SS5 - CLEAR','5 oz Soft Sided Clear Plastic Cup',39,2500,35,30,15,15,22,2.75,2.875,1.5,NULL,NULL,24,40,48,93,900,70),(165,1,'S4','4 oz Foam Cup',39,1000,5,27,16,10,27,2.6875,2.625,1.6875,NULL,NULL,40,40,48,84,250,250),(166,1,'PC4 - WHITE','4oz Paper Cup - White',39,1000,10,13,13,11,14,2.5,2.375,1.75,NULL,NULL,72,40,48,88,800,70),(167,1,'DL16SN08','16 oz Drink Logic® Snap on Lid - White',40,400,17,32,19,16,17,NULL,NULL,NULL,4,NULL,30,40,48,90,550,150),(168,1,'IPC08DO08','8 oz Domed Lid - White',40,1200,11,19,21,18,8,NULL,NULL,NULL,3.375,NULL,40,40,48,85,500,150),(169,1,'IPC08DO09','8 oz Domed Lid - Black',40,1200,11,19,21,18,8,NULL,NULL,NULL,3.375,NULL,40,40,48,85,500,150),(170,1,'IPC16DO08','12/16/20 oz Domed Lid - White',40,1200,12,20,17,16,12,NULL,NULL,NULL,3.75,NULL,42,40,48,88,550,150),(171,1,'IPC16DO09','12/16/20 oz Domed Lid - Black',40,1200,12,20,17,16,12,NULL,NULL,NULL,3.75,NULL,42,40,48,88,550,150),(172,1,'EPC16DO08','12/16 oz Eco-Friendly Domed Lid - White',40,1200,14,22,19,16,12,NULL,NULL,NULL,3.625,NULL,42,40,48,89,650,70),(173,1,'PC08DO08','8 oz Domed Lid - White',40,1000,7,34,17,17,19,NULL,NULL,NULL,3.25,NULL,72,40,48,78,450,70),(174,1,'PC08DO09','8 oz Domed Lid - Black',40,1000,7,34,17,17,19,NULL,NULL,NULL,3.25,NULL,72,40,48,78,450,70),(175,1,'PC16DO08','10/12/16/20 oz Domed Lid - White',40,1000,11,19,20,8,19,NULL,NULL,NULL,3.625,NULL,48,40,48,78,475,70),(176,1,'PC16DO09','10/12/16/20/24 oz Domed Lid - Black',40,1000,11,19,20,8,19,NULL,NULL,NULL,3.625,NULL,48,40,48,78,475,70),(177,1,'ST12ML03','12 oz Molded Lid - Natural',40,500,6,11,17,14,7,NULL,NULL,NULL,3.25,NULL,88,40,48,82,600,70),(178,1,'ST16ML03','16/22 oz Molded Lid - Natural',40,500,8,13,19,14,8,NULL,NULL,NULL,3.75,NULL,80,40,48,85,700,70),(179,1,'ST32ML08','32 oz Molded Lid - White',40,500,8,19,21,9,16,NULL,NULL,NULL,4,NULL,40,40,48,85,375,150),(180,1,'SS12ST01','12 oz Straw Slot Lid - Clear',40,1000,7,21,20,9,19,NULL,NULL,NULL,3.625,NULL,48,40,48,81,375,150),(181,1,'SS16ST01','16/20/24 oz Straw Slot Lid - Clear',40,1000,7,22,21,9,19,NULL,NULL,NULL,3.875,NULL,40,40,48,80,350,150),(182,1,'SS16OD01','16/24 oz Open Domed Lid - Clear',40,1000,10,22,21,17,10,NULL,NULL,NULL,3.875,NULL,42,40,48,74,500,150),(183,1,'CG12ST01','09/12/20 oz Straw Slot Lid - Clear',40,1000,8,19,20,17,9,NULL,NULL,NULL,3.625,NULL,54,40,48,80,500,150),(184,1,'CG16ST01','16/24 oz Straw Slot Lid - Clear',40,1000,9,22,21,17,10,NULL,NULL,NULL,3.875,NULL,54,40,48,87,525,150),(185,1,'FC08DO08','8 oz Domed Lid - White',40,1000,7,13,17,7,17,NULL,NULL,NULL,3.125,NULL,80,40,48,89,625,70),(186,1,'FC10DO08','10 oz Domed Lid - White',40,1000,8,14,18,8,16,NULL,NULL,NULL,3.25,NULL,60,40,48,85,550,70),(187,1,'FC12DO08','12/14 oz Domed Lid - White',40,1000,8,15,19,8,16,NULL,NULL,NULL,3.5,NULL,70,40,48,85,625,70),(188,1,'FC16DO08','16/20 oz Domed Lid - White',40,1000,9,16,20,8,16,NULL,NULL,NULL,3.75,NULL,60,40,48,85,600,70),(189,1,'FC12ST02','12/14 oz Straw Slot Lid - Frosted',40,1000,6,13,19,8,14,NULL,NULL,NULL,3.5,NULL,60,40,48,75,425,150),(190,1,'FC16ST02','16/20 Straw Slot Lid - Frosted',40,1000,6,16,21,9,14,NULL,NULL,NULL,3.75,NULL,72,40,48,89,500,150),(191,1,'FC24ST02','24 oz Straw Slot Lid - Frosted',40,500,3,9,21,5,14,NULL,NULL,NULL,4,NULL,120,40,48,89,425,150),(192,1,'FC32ST02','32 oz Straw Slot Lid - Frosted',40,500,5,13,25,6,14,NULL,NULL,NULL,4.5,NULL,96,40,48,89,550,150),(193,1,'FC16OD01','16/20 oz Open Domed Lid - Clear',40,1000,11,24,20,16,12,NULL,NULL,NULL,3.75,NULL,36,40,48,77,450,150),(194,1,'DSTRAW07','7 3/4\" Disposable Straw',41,12000,23,45,18,17,24,NULL,NULL,NULL,7.75,NULL,12,40,48,77,350,150),(195,1,'DSTRAW10','10 1/4\" Disposable Straw',41,2000,5,13,13,13,12,NULL,NULL,NULL,10.25,NULL,54,40,48,77,325,150),(196,1,'WSTRAW07','6.5\" Corrugated Whistle Straw',41,2000,12,31,20,16,16,NULL,NULL,NULL,7.5,NULL,30,40,48,86,425,150),(197,1,'WSTRAW09','9\" Corrugated Whistle Straw',41,2000,13,31,23,13,17,NULL,NULL,NULL,9,NULL,40,40,48,91,575,150),(198,1,'TIP - (COLOR)','Whistle Straw Tip - (Color)',41,5500,22,23,19,10,20,NULL,NULL,NULL,NULL,NULL,40,40,48,86,950,70),(199,1,'UTF - (COLOR)','Plastic Fork - (Color)',42,600,8,5,15,9,6,NULL,NULL,NULL,7,NULL,120,40,48,65,1000,70),(200,1,'UTK - (COLOR)','Plastic Knife - (Color)',42,600,9,5,13,9,7,NULL,NULL,NULL,7.5,NULL,153,40,48,63,1400,70),(201,1,'UTS - (COLOR)','Plastic Spoon - (Color)',42,600,7,5,13,9,7,NULL,NULL,NULL,6,NULL,153,40,48,63,1100,70),(202,1,'UTF-BIO','Bio Degradable Fork',42,1000,14,10,14,10,11,NULL,NULL,NULL,6,NULL,77,40,48,82,1150,70),(203,1,'UTK-BIO','Bio Degradeable Knife',42,1000,13,7,13,9,9,NULL,NULL,NULL,6,NULL,105,40,48,68,1450,70),(204,1,'UTS-BIO','Bio Degradable Spoon',42,1000,15,11,14,11,11,NULL,NULL,NULL,6,NULL,91,40,48,82,1450,70),(205,1,'UT3 - WHITE','Plastic Fork Knife Spoon Combo - White',42,500,11,21,20,10,17,NULL,NULL,NULL,7.5,NULL,50,40,48,90,700,150),(206,1,'D-EPC4 - WHITE','4oz  Eco-Friendly Paper Cup - White',39,1000,10,13,13,11,15,2.5,2.5,1.75,NULL,NULL,60,40,48,80,650,70);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productscolors`
--

DROP TABLE IF EXISTS `productscolors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productscolors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Foreign Key of the item in the “products” table.',
  `color_id` int(10) unsigned NOT NULL COMMENT 'Foreign Key of the item in the “colors” table.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `product_id_idx` (`product_id`),
  KEY `color_id_idx` (`color_id`),
  CONSTRAINT `color_id` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productscolors`
--

LOCK TABLES `productscolors` WRITE;
/*!40000 ALTER TABLE `productscolors` DISABLE KEYS */;
INSERT INTO `productscolors` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,2,1),(20,2,2),(21,2,5),(22,2,8),(23,2,13),(24,2,15),(25,2,16),(26,2,18),(27,3,1),(28,3,2),(29,3,5),(30,3,8),(31,3,13),(32,3,15),(33,3,16),(34,3,18),(35,11,18),(36,11,19),(37,11,20),(38,12,21),(39,12,22),(40,12,23),(41,57,2),(42,57,8),(43,57,12),(44,57,13),(45,57,15),(46,57,5),(47,57,18),(48,60,2),(49,60,8),(50,60,12),(51,60,13),(52,60,15),(53,60,5),(54,60,18),(55,61,2),(56,61,8),(57,61,12),(58,61,13),(59,61,15),(60,61,5),(61,61,18),(62,123,32),(63,123,35),(64,123,28),(65,123,36),(66,123,37),(67,123,38),(68,124,32),(69,124,35),(70,124,28),(71,124,36),(72,124,37),(73,124,38),(74,125,32),(75,125,35),(76,125,28),(77,125,36),(78,125,37),(79,125,38),(80,126,39),(81,126,25),(82,126,32),(83,126,40),(84,126,18),(85,126,41),(86,127,24),(87,127,25),(88,127,26),(89,127,27),(90,127,28),(91,127,30),(92,127,32),(93,127,33),(94,127,34),(95,127,18),(96,128,24),(97,128,25),(98,128,26),(99,128,27),(100,128,28),(101,128,29),(102,128,30),(103,128,31),(104,128,32),(105,128,33),(106,128,34),(107,128,18),(108,129,24),(109,129,25),(110,129,26),(111,129,27),(112,129,28),(113,129,30),(114,129,32),(115,129,33),(116,129,34),(117,129,18),(118,198,41),(119,198,25),(120,198,28),(121,198,32),(122,199,41),(123,199,25),(124,199,28),(125,199,30),(126,199,32),(127,199,34),(128,199,33),(129,199,18),(130,200,41),(131,200,25),(132,200,28),(133,200,30),(134,200,32),(135,200,34),(136,200,33),(137,200,18),(138,201,41),(139,201,25),(140,201,28),(141,201,30),(142,201,32),(143,201,34),(144,201,33),(145,201,18);
/*!40000 ALTER TABLE `productscolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsmethods`
--

DROP TABLE IF EXISTS `productsmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productsmethods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Foreign key of the id from the Products table.',
  `method_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key of the Print_Methods table. NULL means it is an unprintable item (such as a lid, straw, or utensil).',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the product-method combo is active.',
  `package_count` smallint(6) unsigned NOT NULL COMMENT 'Number of products in a package (usually shrink-wrapped). *1 indicates “individual”*. *0 indicates “bulk”*',
  `imprint_width` float unsigned DEFAULT NULL COMMENT 'The width of the imprint area. NULL typically means it is an unprinted item, such as a lid or straw. If there is a value in this column while the imprint_height column is NULL, then it is likely that this number is a diameter. *A value of 0 means “See Template.”*',
  `imprint_height` float unsigned DEFAULT NULL COMMENT 'The height of the imprint area. NULL typically means it is an unprinted item, such as a lid or straw. If this is NULL while there is a value in the imprint_width column, then it is likely that number is a diameter.',
  `imprint_bleed_wrap_width` float unsigned DEFAULT NULL COMMENT 'The width of the “bleed” imprint area on a flat item or “wrap” imprint area of a cup. NULL typically means that the product does not have a bleed or wrap imprint area possible. *A value of 0 means “See Template.”*',
  `imprint_bleed_wrap_height` float unsigned DEFAULT NULL COMMENT 'The height of the “bleed” imprint area on a flat item or “wrap” imprint area of a cup. NULL typically means either the item is a cup and the wrap width is in the “imprint_bleed_wrap_width” field or the number in that field represents a diameter for a flat item. A NULL in *both* fields means the item does not have a bleed nor wrap imprint area.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `products_colors_id_idx` (`product_id`),
  KEY `method_id_idx` (`method_id`),
  CONSTRAINT `method_id` FOREIGN KEY (`method_id`) REFERENCES `print_methods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `p_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsmethods`
--

LOCK TABLES `productsmethods` WRITE;
/*!40000 ALTER TABLE `productsmethods` DISABLE KEYS */;
INSERT INTO `productsmethods` VALUES (1,1,2,1,50,3,3,NULL,NULL),(2,2,2,1,50,3,3,NULL,NULL),(3,3,2,1,25,3,3,NULL,NULL),(4,4,1,1,50,3,3,NULL,NULL),(5,4,2,1,50,3,3,NULL,NULL),(6,4,3,1,210,3.5,3.5,NULL,NULL),(7,5,1,1,50,3,3,NULL,NULL),(8,5,2,1,50,3,3,NULL,NULL),(9,5,3,1,100,5,5,NULL,NULL),(10,6,1,1,25,3,3,NULL,NULL),(11,6,2,1,25,3,3,NULL,NULL),(12,6,3,1,125,3.5,5,NULL,NULL),(13,7,1,1,50,3,3,NULL,NULL),(14,7,2,1,50,3,3,NULL,NULL),(15,8,1,1,25,3,3,NULL,NULL),(16,8,2,1,25,3,3,NULL,NULL),(17,9,1,1,25,3,3,NULL,NULL),(18,9,2,1,25,3,3,NULL,NULL),(19,10,2,1,25,3,3,NULL,NULL),(20,11,2,1,25,3,3,NULL,NULL),(21,12,2,1,25,3,2,NULL,NULL),(22,13,1,1,50,3,NULL,3.625,NULL),(23,13,2,1,50,3,NULL,NULL,NULL),(24,14,1,1,50,3,3,3.625,3.625),(25,14,2,1,50,3,3,NULL,NULL),(26,15,1,1,50,3.5,NULL,4.125,NULL),(27,15,2,1,50,3,NULL,NULL,NULL),(28,16,1,1,50,3.5,3.5,4.125,4.125),(29,16,2,1,50,3,3,NULL,NULL),(30,17,1,1,25,3,NULL,3.625,NULL),(31,17,2,1,25,3,NULL,NULL,NULL),(32,18,1,1,25,3,3,3.625,3.625),(33,18,2,1,25,3,3,NULL,NULL),(34,19,1,1,25,3.5,NULL,4.125,NULL),(35,19,2,1,25,3,NULL,NULL,NULL),(36,20,1,1,25,3.5,3.5,4.125,4.125),(37,20,2,1,25,3,3,NULL,NULL),(38,21,1,1,25,3,NULL,3.625,NULL),(39,21,2,1,25,3,NULL,NULL,NULL),(40,22,1,1,25,3,3,3.625,3.625),(41,22,2,1,25,3,3,NULL,NULL),(42,23,1,1,25,3,NULL,3.625,NULL),(43,23,2,1,25,3,NULL,NULL,NULL),(44,24,1,1,25,3,3,3.625,3.625),(45,24,2,1,25,3,3,NULL,NULL),(46,25,1,1,25,0.875,1.25,0,NULL),(47,26,1,1,25,1.125,0.875,0,NULL),(48,27,1,1,25,0.375,1.75,0,NULL),(49,28,1,1,25,0.875,1.25,0,NULL),(50,29,1,1,25,0.875,NULL,0,NULL),(51,30,1,1,25,1.125,0.6875,0,NULL),(52,31,1,1,25,0.375,1.75,0,NULL),(53,32,1,1,25,0.75,1.25,0,NULL),(54,33,1,1,25,0.875,NULL,0,NULL),(55,34,1,1,25,0.6875,NULL,0,NULL),(56,35,1,1,25,0.6875,NULL,0,NULL),(57,36,1,1,25,1,0.6875,0,NULL),(58,37,1,1,25,0.625,0.9375,0,NULL),(59,38,1,1,25,1.125,0.75,0,NULL),(60,39,1,1,25,1.25,0.75,0,NULL),(61,40,1,1,25,0.25,1.625,0,NULL),(62,41,1,1,25,0.625,NULL,0,NULL),(63,42,1,1,25,0.625,0.875,0,NULL),(64,43,1,1,25,0.375,1.75,0,NULL),(65,44,2,1,25,3,NULL,NULL,NULL),(66,45,2,1,25,3,NULL,NULL,NULL),(67,46,2,1,25,3,NULL,NULL,NULL),(68,47,1,1,10,0,NULL,NULL,NULL),(69,47,2,1,10,3,2.5,NULL,NULL),(70,48,1,1,18,3.75,NULL,NULL,NULL),(71,48,2,1,18,3,NULL,NULL,NULL),(72,49,1,1,18,4.75,NULL,NULL,NULL),(73,49,2,1,18,3,NULL,NULL,NULL),(74,50,1,1,18,5.5,NULL,NULL,NULL),(75,50,2,1,18,3,NULL,NULL,NULL),(76,51,1,1,12,3.25,3.25,NULL,NULL),(77,51,2,1,12,3,3,NULL,NULL),(78,52,1,1,12,4.25,4.25,NULL,NULL),(79,52,2,1,12,3,3,NULL,NULL),(80,53,1,1,12,5,5,NULL,NULL),(81,53,2,1,12,3,3,NULL,NULL),(82,54,2,1,25,3,NULL,NULL,NULL),(83,55,2,1,25,3,NULL,NULL,NULL),(84,56,2,1,25,3,NULL,NULL,NULL),(85,57,2,1,25,3,NULL,NULL,NULL),(86,58,2,1,25,3,NULL,NULL,NULL),(87,59,2,1,25,3,NULL,NULL,NULL),(88,60,2,1,25,3,NULL,NULL,NULL),(89,61,1,1,50,2.75,2.875,7,NULL),(90,61,2,1,50,2.75,2.5,6.75,NULL),(91,62,1,1,30,2.125,1.75,7.25,NULL),(92,62,2,1,30,2.25,1.75,NULL,NULL),(93,63,1,1,30,2.5,2.25,8.25,NULL),(94,63,2,1,30,2.5,2.25,NULL,NULL),(95,64,1,1,30,2.5,3,8.5,NULL),(96,64,2,1,30,2.5,3,NULL,NULL),(97,65,1,1,25,3,1.75,0,NULL),(98,65,2,1,25,3,1.75,NULL,NULL),(99,66,1,1,25,3,1.75,0,NULL),(100,66,2,1,25,3,1.75,NULL,NULL),(101,67,1,1,25,3,1.75,0,NULL),(102,67,2,1,25,3,1.75,NULL,NULL),(103,68,1,1,25,3,1.75,0,NULL),(104,68,2,1,25,3,1.75,NULL,NULL),(105,69,1,1,50,2,1.25,5,NULL),(106,69,2,1,50,2,1.25,NULL,NULL),(107,70,1,1,50,2.5,2.25,6.25,NULL),(108,70,2,1,50,2.5,2.25,NULL,NULL),(109,71,1,1,50,2.75,2.5,7.25,NULL),(110,71,2,1,50,2.75,2.5,NULL,NULL),(111,72,1,1,50,3,3.5,7.5,NULL),(112,72,2,1,50,3,3.5,NULL,NULL),(113,73,1,1,50,2,1.75,5.25,NULL),(114,73,2,1,50,2,1.5,6,NULL),(115,73,3,1,50,2,1.5,6,NULL),(116,74,1,1,50,2.25,2.5,6.25,NULL),(117,74,2,1,50,2.25,2.25,6.75,NULL),(118,74,3,1,50,2.25,2.25,6.75,NULL),(119,75,1,1,50,2.5,3,7,NULL),(120,75,2,1,50,2.5,2.5,7.25,NULL),(121,75,3,1,50,2.5,2.5,7.25,NULL),(122,76,1,1,50,2.5,2.5,7.875,NULL),(123,76,2,1,50,2.5,2.25,8.375,NULL),(124,76,3,1,50,2.5,2.25,8.375,NULL),(125,77,1,1,50,2.5,3.5,7.875,NULL),(126,77,2,1,50,2.5,3,8.25,NULL),(127,77,3,1,50,2.5,3,8.25,NULL),(128,78,1,1,50,3,4.25,8,NULL),(129,78,2,1,50,3,4,8.25,NULL),(130,78,3,1,50,3,4,8.25,NULL),(131,79,1,1,10,1.5,1,5.25,NULL),(132,79,2,1,10,1.5,0.75,5.25,NULL),(133,80,1,1,10,2,1.75,6.875,NULL),(134,80,2,1,10,2,1.5,6.875,NULL),(135,81,1,1,10,2.25,2,8,NULL),(136,81,2,1,10,2.25,1.75,8.25,NULL),(137,82,1,1,20,2,2.375,7,NULL),(138,82,2,1,20,2,2,6.75,NULL),(139,83,1,1,20,2.25,1.75,8.5,NULL),(140,83,2,1,20,2.5,1.5,8.125,NULL),(141,84,2,1,20,2.5,2,8.25,NULL),(142,85,1,1,20,2.5,2.75,7.625,NULL),(143,85,2,1,20,2.5,2.5,7.25,NULL),(144,86,1,1,20,2.5,3.25,7.75,NULL),(145,86,2,1,20,2.5,3,7.25,NULL),(146,87,1,1,20,2.5,4.25,7.875,NULL),(147,87,2,1,20,2.5,4,7.75,NULL),(148,88,2,1,24,1.25,0.75,5.75,NULL),(149,89,1,1,25,2.5,0.375,9.5,NULL),(150,89,2,1,25,2.5,0.375,9.625,NULL),(151,90,1,1,25,2,1,7.25,NULL),(152,90,2,1,25,2,1,7.25,NULL),(153,91,2,1,10,1.25,1.25,5,NULL),(154,92,2,1,12,2,0.75,7.5,NULL),(155,93,1,1,12,3.25,0.25,10,NULL),(156,93,2,1,12,3.125,0.25,10,NULL),(157,94,1,1,10,2.25,3.5,6.75,NULL),(158,94,2,1,10,2.25,2.75,6.875,NULL),(159,95,1,1,8,2.75,1.5,9.25,NULL),(160,95,2,1,8,2.75,1.5,9,NULL),(161,96,1,1,1,2,3,6.5,NULL),(162,96,2,1,1,2,3,6.5,NULL),(163,97,1,1,1,2.25,2,7.75,NULL),(164,97,2,1,1,2.25,2,7.75,NULL),(165,98,1,1,1,2,1.75,9,NULL),(166,98,2,1,1,2,1.75,9,NULL),(167,99,1,1,1,2.5,1.5,10.25,NULL),(168,99,2,1,1,2.5,1.5,10.25,NULL),(169,100,1,1,1,2,2.75,9,NULL),(170,100,2,1,1,2,2.75,9,NULL),(171,101,2,1,1,2.5,2.5,9.25,NULL),(172,102,2,1,1,2.5,2,10,NULL),(173,103,2,1,1,2.75,4,9,NULL),(174,104,1,1,50,1,1,3.75,NULL),(175,104,2,1,50,1,0.75,3.5,NULL),(176,105,1,1,50,1.25,1.375,4.375,NULL),(177,105,2,1,50,1.25,1.25,4.25,NULL),(178,105,3,1,50,1.25,1.25,4.5,NULL),(179,106,2,1,50,1.75,1.25,6.5,NULL),(180,106,3,1,50,1.75,1.25,6.75,NULL),(181,107,1,1,25,1.75,2,6.25,NULL),(182,107,2,1,25,1.75,1.75,5.875,NULL),(183,107,3,1,25,1.75,1.75,6.375,NULL),(184,108,1,1,25,2,2.625,6.5,NULL),(185,108,2,1,25,2,2.5,6.5,NULL),(186,108,3,1,25,2,2.5,6.75,NULL),(187,109,2,1,25,2.5,1.625,8,NULL),(188,109,3,1,25,2.5,1.625,8.25,NULL),(189,110,1,1,25,2.5,3,7.625,NULL),(190,110,2,1,25,2.5,2.5,7.25,NULL),(191,110,3,1,25,2.5,2.5,7.5,NULL),(192,111,1,1,25,2.5,3.625,7.75,NULL),(193,111,2,1,25,2.5,3,7.25,NULL),(194,111,3,1,25,2.5,3,7.5,NULL),(195,112,1,1,25,2.5,3.625,8,NULL),(196,112,2,1,25,2.5,3.25,7.75,NULL),(197,112,3,1,25,2.5,3.25,8.25,NULL),(198,113,1,1,25,2.5,4.25,8,NULL),(199,113,2,1,25,2.5,3.625,7.5,NULL),(200,113,3,1,25,2.5,3.625,7.75,NULL),(201,114,1,1,25,1.75,1.875,6.125,NULL),(202,114,2,1,25,1.75,1.5,5.75,NULL),(203,114,3,1,25,1.75,1.5,6,NULL),(204,115,1,1,25,2,2.625,6.75,NULL),(205,115,2,1,25,2,2,6.625,NULL),(206,115,3,1,25,2,2,7.125,NULL),(207,116,2,1,25,2,1.5,8,NULL),(208,116,3,1,25,2,1.5,8.25,NULL),(209,117,1,1,25,2.5,2.75,8,NULL),(210,117,2,1,25,2.5,2.5,7.5,NULL),(211,117,3,1,25,2.5,2.5,7.75,NULL),(212,118,1,1,25,2.5,3.125,7.625,NULL),(213,118,2,1,25,2.5,3,7.375,NULL),(214,118,3,1,25,2.5,3,7.625,NULL),(215,119,1,1,25,2.25,3.375,7.875,NULL),(216,119,2,1,25,2.25,3,7.5,NULL),(217,119,3,1,25,2.25,3,7.625,NULL),(218,120,1,1,25,2.75,3.25,8.625,NULL),(219,120,2,1,25,2.75,3,8.875,NULL),(220,120,3,1,25,2.75,3,8.875,NULL),(221,121,1,1,25,2.5,4.125,9.5,NULL),(222,121,2,1,25,2.5,3.75,8.25,NULL),(223,121,3,1,25,2.5,3.75,8.5,NULL),(224,122,1,1,25,3,4.25,9.25,NULL),(225,122,2,1,25,3,3.25,9.125,NULL),(226,122,3,1,25,3,3.25,9.5,NULL),(227,123,1,1,1,2.75,3.75,9,NULL),(228,123,2,1,1,2.75,3,8.75,NULL),(229,124,1,1,1,2.75,2.5,9.375,NULL),(230,124,2,1,1,2.75,2.75,9.125,NULL),(231,125,1,1,1,3,4,8.75,NULL),(232,125,2,1,1,3,2.75,8.75,NULL),(233,126,2,1,1,2.5,2.5,9,NULL),(234,127,1,1,25,2.5,3,7.875,NULL),(235,127,2,1,25,2.5,2.75,7.875,NULL),(236,128,1,1,25,3,3.25,9.125,NULL),(237,128,2,1,25,3,3,9.125,NULL),(238,129,1,1,25,2.75,4.25,9,NULL),(239,129,2,1,25,2.75,4,9,NULL),(240,130,1,1,25,2.5,3,7.875,NULL),(241,130,2,1,25,2.5,2.75,7.875,NULL),(242,130,3,1,25,2.5,2.75,8.125,NULL),(243,131,1,1,25,3,3.25,9.125,NULL),(244,131,2,1,25,3,3,9.125,NULL),(245,131,3,1,25,3,3,9.375,NULL),(246,132,1,1,25,2.75,4.25,9,NULL),(247,132,2,1,25,2.75,4,9,NULL),(248,132,3,1,25,2.75,4,9.25,NULL),(249,133,1,1,25,3.25,4.25,10.125,NULL),(250,133,2,1,25,3.25,5,10.125,NULL),(251,133,3,1,25,3.25,5,10.375,NULL),(252,134,1,1,100,1.25,1.125,5.5,NULL),(253,134,2,1,100,1.25,1.125,5,NULL),(254,134,3,1,100,1.25,1.125,5.5,NULL),(255,135,2,1,100,1.5,1.5,6,NULL),(256,135,3,1,100,1.5,1.5,6.25,NULL),(257,136,1,1,50,2.5,2.5,7.25,NULL),(258,136,2,1,50,2.25,2.5,7.25,NULL),(259,136,3,1,50,2.25,2.5,7.5,NULL),(260,137,1,1,50,2.75,2.125,8.25,NULL),(261,137,2,1,50,2.75,2.125,8.25,NULL),(262,137,3,1,50,2.75,2.125,8.5,NULL),(263,138,1,1,50,2.75,2.125,9,NULL),(264,138,2,1,50,3,2.125,9,NULL),(265,138,3,1,50,3,2.125,9.25,NULL),(266,139,1,1,50,2,2.125,6.5,NULL),(267,139,2,1,50,2,1.625,6.625,NULL),(268,139,3,1,50,2,1.625,6.875,NULL),(269,140,2,1,50,2.5,1.25,8.125,NULL),(270,140,3,1,50,2.5,1.25,8.625,NULL),(271,141,1,1,50,2.25,2.5,7,NULL),(272,141,2,1,50,2.25,2,6.75,NULL),(273,141,3,1,50,2.25,2,7.25,NULL),(274,142,1,1,50,2.25,2.5,8.25,NULL),(275,142,2,1,50,2.25,2,8.375,NULL),(276,142,3,1,50,2.25,2,8.625,NULL),(277,143,1,1,50,2.5,2.75,9,NULL),(278,143,2,1,50,2.5,2.25,8.625,NULL),(279,143,3,1,50,2.5,2.25,9.125,NULL),(280,144,1,1,50,2.5,3.5,8.625,NULL),(281,144,2,1,50,2.5,2.75,8.75,NULL),(282,144,3,1,50,2.5,2.75,9,NULL),(283,145,1,1,50,2,1.25,6.125,NULL),(284,145,2,1,50,2,1.25,6.125,NULL),(285,145,3,1,50,2,1.25,6.375,NULL),(286,146,1,1,25,2.25,2,6.625,NULL),(287,146,2,1,25,2.25,1.75,6.625,NULL),(288,146,3,1,25,2.25,1.75,6.875,NULL),(289,147,1,1,25,2.5,2.25,7.25,NULL),(290,147,2,1,25,2.5,2,7.25,NULL),(291,147,3,1,25,2.5,2,7.5,NULL),(292,148,1,1,25,2.5,2.75,7.75,NULL),(293,148,2,1,25,2.5,2.5,7.625,NULL),(294,148,3,1,25,2.5,2.5,7.875,NULL),(295,149,1,1,25,2.75,3,8,NULL),(296,149,2,1,25,2.75,2.75,8,NULL),(297,149,3,1,25,2.75,2.75,8.25,NULL),(298,150,1,1,25,2.75,3,8.5,NULL),(299,150,2,1,25,2.75,2.75,8.625,NULL),(300,150,3,1,25,2.75,2.75,8.875,NULL),(301,151,1,1,25,3,3.625,8.75,NULL),(302,151,2,1,25,3,3.375,8.625,NULL),(303,151,3,1,25,3,3.375,8.875,NULL),(304,152,1,1,25,3,4,8.75,NULL),(305,152,2,1,25,3,3.75,8.625,NULL),(306,152,3,1,25,3,3.75,8.875,NULL),(307,153,1,1,25,3,4.25,9.125,NULL),(308,153,2,1,25,3,4.5,9,NULL),(309,153,3,1,25,3,4.5,9.25,NULL),(310,154,1,1,25,3.5,4.25,11,NULL),(311,154,2,1,25,3.5,4,11,NULL),(312,154,3,1,25,3.5,4,11.25,NULL),(313,155,1,1,50,1,1,3.75,NULL),(314,155,2,1,50,1,0.75,3.5,NULL),(315,156,1,1,50,1.25,1.375,4.375,NULL),(316,156,2,1,50,1.25,1.25,4.25,NULL),(317,156,3,1,50,1.25,1.25,4.5,NULL),(318,157,2,1,50,1.75,1.25,6.5,NULL),(319,157,3,1,50,1.75,1.25,6.75,NULL),(320,158,1,1,25,1.75,2,6.25,NULL),(321,158,3,1,25,1.75,1.75,6.375,NULL),(322,159,1,1,10,1.5,0.75,5.25,NULL),(323,160,1,1,10,2,1.5,6.875,NULL),(324,161,2,1,24,1.25,0.75,5.75,NULL),(325,162,1,1,25,1.75,1.875,6.25,NULL),(326,162,2,1,25,1.75,1.5,5.75,NULL),(327,162,3,1,25,1.75,1.5,6,NULL),(328,163,2,1,100,1.25,1.125,5,NULL),(329,163,3,1,100,1.25,1.125,5.5,NULL),(330,164,2,1,100,1.5,1.5,6,NULL),(331,164,3,1,100,1.5,1.5,6.25,NULL),(332,165,1,1,50,2,1.25,6.25,NULL),(333,165,2,1,50,2,1.25,6.125,NULL),(334,165,3,1,50,2,1.25,6.375,NULL),(335,166,1,1,50,2,1.75,5.25,NULL),(336,166,2,1,50,2,1.5,6,NULL),(337,166,3,1,50,2,1.5,6,NULL),(338,167,NULL,1,100,NULL,NULL,NULL,NULL),(339,168,NULL,1,100,NULL,NULL,NULL,NULL),(340,169,NULL,1,100,NULL,NULL,NULL,NULL),(341,170,NULL,1,100,NULL,NULL,NULL,NULL),(342,171,NULL,1,100,NULL,NULL,NULL,NULL),(343,172,NULL,1,100,NULL,NULL,NULL,NULL),(344,173,NULL,1,100,NULL,NULL,NULL,NULL),(345,174,NULL,1,100,NULL,NULL,NULL,NULL),(346,175,NULL,1,100,NULL,NULL,NULL,NULL),(347,176,NULL,1,100,NULL,NULL,NULL,NULL),(348,177,NULL,1,50,NULL,NULL,NULL,NULL),(349,178,NULL,1,50,NULL,NULL,NULL,NULL),(350,179,NULL,1,25,NULL,NULL,NULL,NULL),(351,180,NULL,1,100,NULL,NULL,NULL,NULL),(352,181,NULL,1,100,NULL,NULL,NULL,NULL),(353,182,NULL,1,50,NULL,NULL,NULL,NULL),(354,183,NULL,1,100,NULL,NULL,NULL,NULL),(355,184,NULL,1,100,NULL,NULL,NULL,NULL),(356,185,NULL,1,100,NULL,NULL,NULL,NULL),(357,186,NULL,1,100,NULL,NULL,NULL,NULL),(358,187,NULL,1,100,NULL,NULL,NULL,NULL),(359,188,NULL,1,100,NULL,NULL,NULL,NULL),(360,189,NULL,1,100,NULL,NULL,NULL,NULL),(361,190,NULL,1,100,NULL,NULL,NULL,NULL),(362,191,NULL,1,100,NULL,NULL,NULL,NULL),(363,192,NULL,1,100,NULL,NULL,NULL,NULL),(364,193,NULL,1,50,NULL,NULL,NULL,NULL),(365,194,NULL,1,500,NULL,NULL,NULL,NULL),(366,195,NULL,1,500,NULL,NULL,NULL,NULL),(367,196,NULL,1,50,NULL,NULL,NULL,NULL),(368,197,NULL,1,50,NULL,NULL,NULL,NULL),(369,198,NULL,1,50,NULL,NULL,NULL,NULL),(370,199,NULL,1,50,NULL,NULL,NULL,NULL),(371,200,NULL,1,50,NULL,NULL,NULL,NULL),(372,201,NULL,1,50,NULL,NULL,NULL,NULL),(373,202,NULL,1,50,NULL,NULL,NULL,NULL),(374,203,NULL,1,50,NULL,NULL,NULL,NULL),(375,204,NULL,1,50,NULL,NULL,NULL,NULL),(376,205,NULL,1,0,NULL,NULL,NULL,NULL),(377,206,1,1,50,2,1.25,5,NULL),(378,158,2,1,25,1.75,1.5,5.75,NULL);
/*!40000 ALTER TABLE `productsmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantity_breaks`
--

DROP TABLE IF EXISTS `quantity_breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quantity_breaks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `quantity` int(10) unsigned NOT NULL COMMENT 'Quantity breakpoint.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantity_breaks`
--

LOCK TABLES `quantity_breaks` WRITE;
/*!40000 ALTER TABLE `quantity_breaks` DISABLE KEYS */;
INSERT INTO `quantity_breaks` VALUES (1,100),(2,250),(3,500),(4,1000),(5,2500),(6,5000),(7,10000),(8,25000),(9,50000),(10,75000),(11,100000),(12,250000),(13,500000),(14,1000000),(15,25),(16,50),(17,12),(18,24),(19,48),(20,144),(21,288),(22,576);
/*!40000 ALTER TABLE `quantity_breaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smqprices`
--

DROP TABLE IF EXISTS `smqprices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smqprices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Foreign key of the product id from the “Products” table.',
  `smq_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key of the quantity break in the “Quantity_Breaks” table.',
  `price` decimal(19,4) unsigned NOT NULL COMMENT 'The price for that particular item.',
  `quantity_id` int(10) unsigned NOT NULL COMMENT 'Foreign key to the Quantity_Breaks table.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `product_id_idx` (`product_id`),
  KEY `pid_idx` (`product_id`),
  KEY `qid_idx` (`smq_id`),
  KEY `quantity_id_idx` (`quantity_id`),
  CONSTRAINT `qid` FOREIGN KEY (`smq_id`) REFERENCES `subcategoriesmethodsquantities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pid` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quant_id` FOREIGN KEY (`quantity_id`) REFERENCES `quantity_breaks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6451 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smqprices`
--

LOCK TABLES `smqprices` WRITE;
/*!40000 ALTER TABLE `smqprices` DISABLE KEYS */;
INSERT INTO `smqprices` VALUES (1,1,1,0.5800,1),(2,1,2,0.3450,2),(3,1,3,0.2800,3),(4,1,4,0.2200,4),(5,1,5,0.1900,5),(6,1,6,0.1800,6),(7,1,7,0.1700,7),(8,1,8,0.1500,8),(9,1,9,0.1400,9),(10,2,1,0.6400,1),(11,2,2,0.4050,2),(12,2,3,0.3300,3),(13,2,4,0.2600,4),(14,2,5,0.2400,5),(15,2,6,0.2300,6),(16,2,7,0.2200,7),(17,2,8,0.1960,8),(18,2,9,0.1800,9),(19,3,1,0.7000,1),(20,3,2,0.5000,2),(21,3,3,0.4000,3),(22,3,4,0.3500,4),(23,3,5,0.3300,5),(24,3,6,0.3200,6),(25,3,7,0.2900,7),(26,3,8,0.2400,8),(27,3,9,0.2200,9),(45,4,10,2.3000,16),(46,4,11,2.1500,1),(47,4,12,1.2000,2),(48,4,13,1.0000,3),(49,4,14,0.7500,4),(50,4,15,0.6500,5),(51,4,16,0.5550,1),(52,4,17,0.3100,2),(53,4,18,0.2450,3),(54,4,19,0.2000,4),(55,4,20,0.1600,5),(56,4,21,0.1500,6),(57,4,22,0.1400,7),(58,4,23,0.1230,8),(59,4,24,0.1200,9),(60,4,25,70.0000,7),(61,4,26,52.0000,8),(62,4,27,40.0000,9),(63,4,28,36.0000,10),(64,4,29,32.0000,11),(65,4,30,29.0000,12),(66,4,31,26.8000,13),(67,4,32,25.0000,14),(68,5,33,2.3300,16),(69,5,34,2.1800,1),(70,5,35,1.2400,2),(71,5,36,1.0300,3),(72,5,37,0.7800,4),(73,5,38,0.6800,5),(74,5,39,0.5850,1),(75,5,40,0.3550,2),(76,5,41,0.2650,3),(77,5,42,0.2200,4),(78,5,43,0.1850,5),(79,5,44,0.1750,6),(80,5,45,0.1650,7),(81,5,46,0.1400,8),(82,5,47,0.1360,9),(83,5,48,107.0000,7),(84,5,49,86.0000,8),(85,5,50,66.0000,9),(86,5,51,62.0000,10),(87,5,52,58.0000,11),(88,5,53,52.0000,12),(89,5,54,48.0000,13),(90,5,55,44.0000,14),(91,6,56,2.3800,16),(92,6,57,2.2300,1),(93,6,58,1.2900,2),(94,6,59,1.0300,3),(95,6,60,0.8200,4),(96,6,61,0.7200,5),(97,6,62,0.6400,1),(98,6,63,0.4050,2),(99,6,64,0.3450,3),(100,6,65,0.2450,4),(101,6,66,0.2400,5),(102,6,67,0.2350,6),(103,6,68,0.2300,7),(104,6,69,0.2000,8),(105,6,70,0.1800,9),(106,6,71,152.0000,7),(107,6,72,132.0000,8),(108,6,73,102.0000,9),(109,6,74,96.0000,10),(110,6,75,92.0000,11),(111,6,76,78.0000,12),(112,6,77,70.0000,13),(113,6,78,62.0000,14),(114,7,79,2.3400,16),(115,7,80,2.1900,1),(116,7,81,1.2500,2),(117,7,82,1.0400,3),(118,7,83,0.7900,4),(119,7,84,0.6500,5),(120,8,79,2.3800,16),(121,8,80,2.2200,1),(122,8,81,1.2800,2),(123,8,82,1.0700,3),(124,8,83,0.8200,4),(125,8,84,0.6900,5),(126,9,79,2.3800,16),(127,9,80,2.2200,1),(128,9,81,1.2800,2),(129,9,82,1.0700,3),(130,9,83,0.8200,4),(131,9,84,0.6900,5),(132,7,85,0.7600,1),(133,7,86,0.3800,2),(134,7,87,0.2800,3),(135,7,88,0.2300,4),(136,7,89,0.2200,5),(137,7,90,0.2100,6),(138,7,91,0.2000,7),(139,7,92,0.1800,8),(140,7,93,0.1600,9),(141,8,85,0.8700,1),(142,8,86,0.5000,2),(143,8,87,0.4000,3),(144,8,88,0.3500,4),(145,8,89,0.3300,5),(146,8,90,0.3100,6),(147,8,91,0.2800,7),(148,8,92,0.2400,8),(149,8,93,0.2200,9),(150,9,85,0.8700,1),(151,9,86,0.5000,2),(152,9,87,0.4000,3),(153,9,88,0.3500,4),(154,9,89,0.3300,5),(155,9,90,0.3100,6),(156,9,91,0.2800,7),(157,9,92,0.2400,8),(158,9,93,0.2200,9),(159,10,94,0.8400,1),(160,10,95,0.4800,2),(161,10,96,0.3800,3),(162,10,97,0.3200,4),(163,10,98,0.3000,5),(164,10,99,0.2900,6),(165,10,100,0.2800,7),(166,10,101,0.2400,8),(167,10,102,0.2200,9),(168,11,103,1.1500,1),(169,11,104,0.6000,2),(170,11,105,0.5000,3),(171,11,106,0.4500,4),(172,11,107,0.4300,5),(173,11,108,0.4100,6),(174,11,109,0.3800,7),(175,11,110,0.3400,8),(176,11,111,0.3200,9),(177,12,103,1.1500,1),(178,12,104,0.6000,2),(179,12,105,0.5000,3),(180,12,106,0.4500,4),(181,12,107,0.4300,5),(182,12,108,0.4100,6),(183,12,109,0.3800,7),(184,12,110,0.3400,8),(185,12,111,0.3200,9),(186,13,112,1.1600,16),(187,13,113,0.6800,1),(188,13,114,0.4400,2),(189,13,115,0.4000,3),(190,13,116,0.3800,4),(191,13,117,0.3500,5),(192,14,112,1.1600,16),(193,14,113,0.6800,1),(194,14,114,0.4400,2),(195,14,115,0.4000,3),(196,14,116,0.3800,4),(197,14,117,0.3500,5),(198,15,112,1.1800,16),(199,15,113,0.6900,1),(200,15,114,0.4500,2),(201,15,115,0.4200,3),(202,15,116,0.4000,4),(203,15,117,0.3800,5),(204,16,112,1.1800,16),(205,16,113,0.6900,1),(206,16,114,0.4500,2),(207,16,115,0.4200,3),(208,16,116,0.4000,4),(209,16,117,0.3800,5),(210,13,118,0.7000,1),(211,13,119,0.3400,2),(212,13,120,0.2200,3),(213,13,121,0.1900,4),(214,13,122,0.1650,5),(215,13,123,0.1450,6),(216,13,124,0.1400,7),(217,13,125,0.1260,8),(218,13,126,0.1220,9),(219,14,118,0.7000,1),(220,14,119,0.3400,2),(221,14,120,0.2200,3),(222,14,121,0.1900,4),(223,14,122,0.1650,5),(224,14,123,0.1450,6),(225,14,124,0.1400,7),(226,14,125,0.1260,8),(227,14,126,0.1220,9),(228,15,118,0.7200,1),(229,15,119,0.3600,2),(230,15,120,0.2300,3),(231,15,121,0.2000,4),(232,15,122,0.1750,5),(233,15,123,0.1550,6),(234,15,124,0.1500,7),(235,15,125,0.1360,8),(236,15,126,0.1320,9),(237,16,118,0.7200,1),(238,16,119,0.3600,2),(239,16,120,0.2300,3),(240,16,121,0.2000,4),(241,16,122,0.1750,5),(242,16,123,0.1550,6),(243,16,124,0.1500,7),(244,16,125,0.1360,8),(245,16,126,0.1320,9),(246,17,127,1.1600,16),(247,17,128,0.6800,1),(248,17,129,0.4400,2),(249,17,130,0.4000,3),(250,17,131,0.3800,4),(251,17,132,0.3500,5),(252,18,127,1.1600,16),(253,18,128,0.6800,1),(254,18,129,0.4400,2),(255,18,130,0.4000,3),(256,18,131,0.3800,4),(257,18,132,0.3500,5),(258,19,127,1.2000,16),(259,19,128,0.7200,1),(260,19,129,0.4800,2),(261,19,130,0.4400,3),(262,19,131,0.4200,4),(263,19,132,0.3900,5),(264,20,127,1.2000,16),(265,20,128,0.7200,1),(266,20,129,0.4800,2),(267,20,130,0.4400,3),(268,20,131,0.4200,4),(269,20,132,0.3900,5),(270,21,127,1.2500,16),(271,21,128,0.7500,1),(272,21,129,0.5200,2),(273,21,130,0.4600,3),(274,21,131,0.4400,4),(275,21,132,0.4000,5),(276,22,127,1.2500,16),(277,22,128,0.7500,1),(278,22,129,0.5200,2),(279,22,130,0.4600,3),(280,22,131,0.4400,4),(281,22,132,0.4000,5),(282,23,127,1.2800,16),(283,23,128,0.7700,1),(284,23,129,0.5400,2),(285,23,130,0.4800,3),(286,23,131,0.4600,4),(287,23,132,0.4200,5),(288,24,127,1.2800,16),(289,24,128,0.7700,1),(290,24,129,0.5400,2),(291,24,130,0.4800,3),(292,24,131,0.4600,4),(293,24,132,0.4200,5),(309,17,133,0.7200,1),(310,17,134,0.3600,2),(311,17,135,0.2300,3),(312,17,136,0.2000,4),(313,17,137,0.1750,5),(314,17,138,0.1550,6),(315,17,139,0.1500,7),(316,17,140,0.1360,8),(317,17,141,0.1320,9),(318,18,133,0.7200,1),(319,18,134,0.3600,2),(320,18,135,0.2300,3),(321,18,136,0.2000,4),(322,18,137,0.1750,5),(323,18,138,0.1550,6),(324,18,139,0.1500,7),(325,18,140,0.1360,8),(326,18,141,0.1320,9),(327,19,133,0.7500,1),(328,19,134,0.3800,2),(329,19,135,0.2500,3),(330,19,136,0.2150,4),(331,19,137,0.1900,5),(332,19,138,0.1750,6),(333,19,139,0.1650,7),(334,19,140,0.1500,8),(335,19,141,0.1460,9),(336,20,133,0.7500,1),(337,20,134,0.3800,2),(338,20,135,0.2500,3),(339,20,136,0.2150,4),(340,20,137,0.1900,5),(341,20,138,0.1750,6),(342,20,139,0.1650,7),(343,20,140,0.1500,8),(344,20,141,0.1460,9),(345,21,133,0.7700,1),(346,21,134,0.4200,2),(347,21,135,0.2900,3),(348,21,136,0.2500,4),(349,21,137,0.2200,5),(350,21,138,0.2000,6),(351,21,139,0.1850,7),(352,21,140,0.1700,8),(353,21,141,0.1660,9),(354,22,133,0.7700,1),(355,22,134,0.4200,2),(356,22,135,0.2900,3),(357,22,136,0.2500,4),(358,22,137,0.2200,5),(359,22,138,0.2000,6),(360,22,139,0.1850,7),(361,22,140,0.1700,8),(362,22,141,0.1660,9),(363,23,133,0.7900,1),(364,23,134,0.4300,2),(365,23,135,0.3100,3),(366,23,136,0.2700,4),(367,23,137,0.2400,5),(368,23,138,0.2200,6),(369,23,139,0.2050,7),(370,23,140,0.1880,8),(371,23,141,0.1860,9),(372,24,133,0.7900,1),(373,24,134,0.4300,2),(374,24,135,0.3100,3),(375,24,136,0.2700,4),(376,24,137,0.2400,5),(377,24,138,0.2200,6),(378,24,139,0.2050,7),(379,24,140,0.1880,8),(380,24,141,0.1860,9),(381,25,142,0.7800,1),(382,25,143,0.6200,2),(383,25,144,0.5000,3),(384,25,145,0.4600,4),(385,25,146,0.4000,5),(386,25,147,0.3800,6),(387,25,148,0.3600,7),(388,25,149,0.3200,8),(389,25,150,0.3100,9),(390,26,142,0.8000,1),(391,26,143,0.6400,2),(392,26,144,0.5200,3),(393,26,145,0.4800,4),(394,26,146,0.4300,5),(395,26,147,0.4100,6),(396,26,148,0.3900,7),(397,26,149,0.3500,8),(398,26,150,0.3400,9),(399,27,142,0.7200,1),(400,27,143,0.5600,2),(401,27,144,0.4800,3),(402,27,145,0.4400,4),(403,27,146,0.3800,5),(404,27,147,0.3600,6),(405,27,148,0.3400,7),(406,27,149,0.3000,8),(407,27,150,0.2900,9),(408,28,142,0.7800,1),(409,28,143,0.6200,2),(410,28,144,0.5000,3),(411,28,145,0.4600,4),(412,28,146,0.4000,5),(413,28,147,0.3800,6),(414,28,148,0.3600,7),(415,28,149,0.3200,8),(416,28,150,0.3100,9),(417,29,142,0.7400,1),(418,29,143,0.5800,2),(419,29,144,0.4900,3),(420,29,145,0.4500,4),(421,29,146,0.3900,5),(422,29,147,0.3700,6),(423,29,148,0.3500,7),(424,29,149,0.3100,8),(425,29,150,0.3000,9),(426,30,142,0.7200,1),(427,30,143,0.5600,2),(428,30,144,0.4800,3),(429,30,145,0.4400,4),(430,30,146,0.3800,5),(431,30,147,0.3600,6),(432,30,148,0.3400,7),(433,30,149,0.3000,8),(434,30,150,0.2900,9),(435,31,142,0.6600,1),(436,31,143,0.5400,2),(437,31,144,0.4000,3),(438,31,145,0.3600,4),(439,31,146,0.3300,5),(440,31,147,0.3000,6),(441,31,148,0.2700,7),(442,31,149,0.2400,8),(443,31,150,0.2300,9),(444,32,142,0.7800,1),(445,32,143,0.6200,2),(446,32,144,0.5000,3),(447,32,145,0.4600,4),(448,32,146,0.4000,5),(449,32,147,0.3800,6),(450,32,148,0.3600,7),(451,32,149,0.3200,8),(452,32,150,0.3100,9),(453,33,142,0.7200,1),(454,33,143,0.5600,2),(455,33,144,0.4800,3),(456,33,145,0.4400,4),(457,33,146,0.3800,5),(458,33,147,0.3600,6),(459,33,148,0.3400,7),(460,33,149,0.3000,8),(461,33,150,0.2900,9),(462,34,151,0.7200,1),(463,34,152,0.5600,2),(464,34,153,0.4800,3),(465,34,154,0.4400,4),(466,34,155,0.3800,5),(467,34,156,0.3600,6),(468,34,157,0.3400,7),(469,34,158,0.3000,8),(470,34,159,0.2900,9),(471,35,151,0.7200,1),(472,35,152,0.5600,2),(473,35,153,0.4800,3),(474,35,154,0.4400,4),(475,35,155,0.3800,5),(476,35,156,0.3600,6),(477,35,157,0.3400,7),(478,35,158,0.3000,8),(479,35,159,0.2900,9),(480,36,151,0.7400,1),(481,36,152,0.5800,2),(482,36,153,0.4900,3),(483,36,154,0.4500,4),(484,36,155,0.3900,5),(485,36,156,0.3700,6),(486,36,157,0.3500,7),(487,36,158,0.3100,8),(488,36,159,0.3000,9),(489,37,151,0.7200,1),(490,37,152,0.5600,2),(491,37,153,0.4800,3),(492,37,154,0.4400,4),(493,37,155,0.3800,5),(494,37,156,0.3600,6),(495,37,157,0.3400,7),(496,37,158,0.3000,8),(497,37,159,0.2900,9),(498,38,151,0.7200,1),(499,38,152,0.5600,2),(500,38,153,0.4800,3),(501,38,154,0.4400,4),(502,38,155,0.3800,5),(503,38,156,0.3600,6),(504,38,157,0.3400,7),(505,38,158,0.3000,8),(506,38,159,0.2900,9),(507,39,151,0.7400,1),(508,39,152,0.5800,2),(509,39,153,0.4900,3),(510,39,154,0.4500,4),(511,39,155,0.3900,5),(512,39,156,0.3700,6),(513,39,157,0.3500,7),(514,39,158,0.3100,8),(515,39,159,0.3000,9),(516,40,151,0.6600,1),(517,40,152,0.5400,2),(518,40,153,0.4000,3),(519,40,154,0.3600,4),(520,40,155,0.3300,5),(521,40,156,0.3000,6),(522,40,157,0.2700,7),(523,40,158,0.2400,8),(524,40,159,0.2300,9),(525,41,151,0.6600,1),(526,41,152,0.5400,2),(527,41,153,0.4000,3),(528,41,154,0.3600,4),(529,41,155,0.3300,5),(530,41,156,0.3000,6),(531,41,157,0.2700,7),(532,41,158,0.2400,8),(533,41,159,0.2300,9),(534,42,151,0.6600,1),(535,42,152,0.5400,2),(536,42,153,0.4000,3),(537,42,154,0.3600,4),(538,42,155,0.3300,5),(539,42,156,0.3000,6),(540,42,157,0.2700,7),(541,42,158,0.2400,8),(542,42,159,0.2300,9),(543,43,151,0.6000,1),(544,43,152,0.5000,2),(545,43,153,0.3600,3),(546,43,154,0.3200,4),(547,43,155,0.3000,5),(548,43,156,0.2800,6),(549,43,157,0.2500,7),(550,43,158,0.2200,8),(551,43,159,0.2100,9),(552,44,160,0.7500,1),(553,44,161,0.5100,2),(554,44,162,0.4500,3),(555,44,163,0.4000,4),(556,44,164,0.3800,5),(557,44,165,0.3600,6),(558,44,166,0.3400,7),(559,44,167,0.2900,8),(560,44,168,0.2700,9),(561,45,160,0.8900,1),(562,45,161,0.7000,2),(563,45,162,0.5900,3),(564,45,163,0.5300,4),(565,45,164,0.5000,5),(566,45,165,0.4800,6),(567,45,166,0.4700,7),(568,45,167,0.4300,8),(569,45,168,0.4200,9),(570,46,160,1.3000,1),(571,46,161,0.7500,2),(572,46,162,0.6800,3),(573,46,163,0.6400,4),(574,46,164,0.6200,5),(575,46,165,0.6100,6),(576,46,166,0.5900,7),(577,46,167,0.5300,8),(578,46,168,0.5200,9),(579,47,169,3.3000,16),(580,47,170,3.1000,1),(581,47,171,2.9000,2),(582,47,172,2.8000,3),(583,47,173,2.7200,4),(584,47,174,2.6600,5),(585,47,175,2.6600,1),(586,47,176,2.3400,2),(587,47,177,2.1800,3),(588,47,178,2.0800,4),(589,47,179,1.8700,5),(590,47,180,1.8200,6),(591,47,181,1.6600,7),(592,47,182,1.4600,8),(593,47,183,1.4400,9),(594,48,184,2.6900,16),(595,48,185,2.5700,1),(596,48,186,2.3600,2),(597,48,187,2.0600,3),(598,48,188,1.9600,4),(599,48,189,1.9000,5),(600,49,184,2.9200,16),(601,49,185,2.8000,1),(602,49,186,2.5800,2),(603,49,187,2.5000,3),(604,49,188,2.2000,4),(605,49,189,2.1000,5),(606,50,184,3.2200,16),(607,50,185,3.1000,1),(608,50,186,2.8800,2),(609,50,187,2.8200,3),(610,50,188,2.7600,4),(611,50,189,2.7200,5),(612,51,184,2.4800,16),(613,51,185,2.3600,1),(614,51,186,1.6500,2),(615,51,187,1.6100,3),(616,51,188,1.4600,4),(617,51,189,1.3500,5),(618,52,184,2.7800,16),(619,52,185,2.6600,1),(620,52,186,2.4800,2),(621,52,187,2.2500,3),(622,52,188,2.0000,4),(623,52,189,1.9000,5),(624,53,184,3.1000,16),(625,53,185,2.9800,1),(626,53,186,2.8800,2),(627,53,187,2.7500,3),(628,53,188,2.5500,4),(629,53,189,2.5000,5),(630,48,190,1.9800,1),(631,48,191,1.6600,2),(632,48,192,1.5600,3),(633,48,193,1.4600,4),(634,48,194,1.4200,5),(635,48,195,1.3800,6),(636,48,196,1.3500,7),(637,48,197,1.2200,8),(638,48,198,1.2000,9),(639,49,190,2.1500,1),(640,49,191,2.0200,2),(641,49,192,1.8000,3),(642,49,193,1.7400,4),(643,49,194,1.7000,5),(644,49,195,1.6000,6),(645,49,196,1.5800,7),(646,49,197,1.4500,8),(647,49,198,1.4300,9),(648,50,190,2.4600,1),(649,50,191,2.2500,2),(650,50,192,2.0500,3),(651,50,193,1.8600,4),(652,50,194,1.8000,5),(653,50,195,1.6600,6),(654,50,196,1.6200,7),(655,50,197,1.4800,8),(656,50,198,1.4500,9),(657,51,190,1.8800,1),(658,51,191,1.5600,2),(659,51,192,1.5000,3),(660,51,193,1.4500,4),(661,51,194,1.4200,5),(662,51,195,1.3500,6),(663,51,196,1.3000,7),(664,51,197,1.1800,8),(665,51,198,1.1400,9),(666,52,190,2.1500,1),(667,52,191,2.0200,2),(668,52,192,1.8500,3),(669,52,193,1.8000,4),(670,52,194,1.7500,5),(671,52,195,1.6500,6),(672,52,196,1.6300,7),(673,52,197,1.5000,8),(674,52,198,1.4800,9),(675,53,190,2.5600,1),(676,53,191,2.2500,2),(677,53,192,2.1500,3),(678,53,193,2.0000,4),(679,53,194,1.9600,5),(680,53,195,1.8800,6),(681,53,196,1.8500,7),(682,53,197,1.7000,8),(683,53,198,1.6800,9),(684,54,199,0.7900,1),(685,54,200,0.5000,2),(686,54,201,0.4300,3),(687,54,202,0.4100,4),(688,54,203,0.3800,5),(689,54,204,0.3700,6),(690,54,205,0.3600,7),(691,54,206,0.3300,8),(692,54,207,0.3200,9),(693,55,199,0.9100,1),(694,55,200,0.6000,2),(695,55,201,0.5200,3),(696,55,202,0.4700,4),(697,55,203,0.4500,5),(698,55,204,0.4370,6),(699,55,205,0.4300,7),(700,55,206,0.3900,8),(701,55,207,0.3800,9),(702,56,199,1.2500,1),(703,56,200,0.7100,2),(704,56,201,0.6800,3),(705,56,202,0.6600,4),(706,56,203,0.6300,5),(707,56,204,0.5800,6),(708,56,205,0.5600,7),(709,56,206,0.5100,8),(710,56,207,0.5000,9),(711,57,208,0.8200,1),(712,57,209,0.5400,2),(713,57,210,0.4800,3),(714,57,211,0.4400,4),(715,57,212,0.4100,5),(716,57,213,0.4000,6),(717,57,214,0.3900,7),(718,57,215,0.3500,8),(719,57,216,0.3400,9),(720,58,217,0.6400,1),(721,58,218,0.4300,2),(722,58,219,0.3800,3),(723,58,220,0.3200,4),(724,58,221,0.3100,5),(725,58,222,0.2990,6),(726,58,223,0.2700,7),(727,58,224,0.2400,8),(728,58,225,0.2300,9),(729,59,217,0.7550,1),(730,59,218,0.4900,2),(731,59,219,0.4300,3),(732,59,220,0.4000,4),(733,59,221,0.3900,5),(734,59,222,0.3800,6),(735,59,223,0.3600,7),(736,59,224,0.3100,8),(737,59,225,0.2900,9),(738,60,226,0.7800,1),(739,60,227,0.5300,2),(740,60,228,0.4600,3),(741,60,229,0.4200,4),(742,60,230,0.4000,5),(743,60,231,0.3750,6),(744,60,232,0.3600,7),(745,60,233,0.3300,8),(746,60,234,0.3100,9),(747,61,235,5.8300,15),(748,61,236,4.3600,16),(749,61,237,3.8600,1),(750,61,238,3.4000,2),(751,61,239,3.1200,3),(752,61,240,2.8400,4),(753,61,241,0.7800,1),(754,61,242,0.5300,2),(755,61,243,0.4600,3),(756,61,244,0.4200,4),(757,61,245,0.4000,5),(758,61,246,0.3750,6),(759,61,247,0.3600,7),(760,61,248,0.3300,8),(761,61,249,0.3100,9),(762,62,250,5.9000,15),(763,62,251,4.4300,16),(764,62,252,3.9300,1),(765,62,253,3.4700,2),(766,62,254,3.1800,3),(767,62,255,2.9000,4),(768,63,250,5.9300,15),(769,63,251,4.4600,16),(770,63,252,3.9600,1),(771,63,253,3.5000,2),(772,63,254,3.2200,3),(773,63,255,2.9400,4),(774,64,250,5.9700,15),(775,64,251,4.5000,16),(776,64,252,4.0000,1),(777,64,253,3.5400,2),(778,64,254,3.2600,3),(779,64,255,2.9900,4),(780,62,256,0.9300,1),(781,62,257,0.6600,2),(782,62,258,0.5200,3),(783,62,259,0.4600,4),(784,62,260,0.4400,5),(785,62,261,0.4200,6),(786,62,262,0.4000,7),(787,62,263,0.3400,8),(788,62,264,0.3300,9),(789,63,256,0.9600,1),(790,63,257,0.6800,2),(791,63,258,0.5400,3),(792,63,259,0.4800,4),(793,63,260,0.4600,5),(794,63,261,0.4400,6),(795,63,262,0.4200,7),(796,63,263,0.3700,8),(797,63,264,0.3600,9),(798,64,256,0.9800,1),(799,64,257,0.7000,2),(800,64,258,0.5600,3),(801,64,259,0.5000,4),(802,64,260,0.4800,5),(803,64,261,0.4600,6),(804,64,262,0.4400,7),(805,64,263,0.4000,8),(806,64,264,0.3900,9),(807,65,266,0.9500,16),(808,65,267,0.6500,1),(809,65,268,0.5500,2),(810,65,269,0.4700,3),(811,65,270,0.4400,4),(812,65,271,0.4000,5),(813,66,266,0.9500,16),(814,66,267,0.6500,1),(815,66,268,0.5500,2),(816,66,269,0.4700,3),(817,66,270,0.4400,4),(818,66,271,0.4000,5),(819,67,266,0.9500,16),(820,67,267,0.6500,1),(821,67,268,0.5500,2),(822,67,269,0.4700,3),(823,67,270,0.4400,4),(824,67,271,0.4000,5),(825,68,266,0.9500,16),(826,68,267,0.6500,1),(827,68,268,0.5500,2),(828,68,269,0.4700,3),(829,68,270,0.4400,4),(830,68,271,0.4000,5),(831,65,273,0.7500,1),(832,65,274,0.4200,2),(833,65,275,0.3600,3),(834,65,276,0.3200,4),(835,65,277,0.3100,5),(836,65,278,0.2700,6),(837,65,279,0.2400,7),(838,65,280,0.2200,8),(839,65,281,0.2100,9),(840,66,273,0.7500,1),(841,66,274,0.4200,2),(842,66,275,0.3600,3),(843,66,276,0.3200,4),(844,66,277,0.3100,5),(845,66,278,0.2700,6),(846,66,279,0.2400,7),(847,66,280,0.2200,8),(848,66,281,0.2100,9),(849,67,273,0.7500,1),(850,67,274,0.4200,2),(851,67,275,0.3600,3),(852,67,276,0.3200,4),(853,67,277,0.3100,5),(854,67,278,0.2700,6),(855,67,279,0.2400,7),(856,67,280,0.2200,8),(857,67,281,0.2100,9),(858,68,273,0.7500,1),(859,68,274,0.4200,2),(860,68,275,0.3600,3),(861,68,276,0.3200,4),(862,68,277,0.3100,5),(863,68,278,0.2700,6),(864,68,279,0.2400,7),(865,68,280,0.2200,8),(866,68,281,0.2100,9),(867,69,288,5.8200,15),(868,69,289,4.3500,16),(869,69,290,3.8400,1),(870,69,291,3.3800,2),(871,69,292,3.1000,3),(872,69,293,2.8200,4),(873,70,288,5.8400,15),(874,70,289,4.3700,16),(875,70,290,3.8600,1),(876,70,291,3.4000,2),(877,70,292,3.1200,3),(878,70,293,2.8400,4),(879,71,288,5.8600,15),(880,71,289,4.3900,16),(881,71,290,3.8900,1),(882,71,291,3.4300,2),(883,71,292,3.1400,3),(884,71,293,2.8700,4),(885,72,288,5.8900,15),(886,72,289,4.4200,16),(887,72,290,3.9200,1),(888,72,291,3.4600,2),(889,72,292,3.1700,3),(890,72,293,2.8900,4),(891,69,295,0.7000,1),(892,69,296,0.4900,2),(893,69,297,0.3300,3),(894,69,298,0.2700,4),(895,69,299,0.2500,5),(896,69,300,0.2400,6),(897,69,301,0.2300,7),(898,69,302,0.2100,8),(899,69,303,0.2000,9),(900,70,295,0.7100,1),(901,70,296,0.5100,2),(902,70,297,0.3500,3),(903,70,298,0.2900,4),(904,70,299,0.2700,5),(905,70,300,0.2600,6),(906,70,301,0.2500,7),(907,70,302,0.2300,8),(908,70,303,0.2200,9),(909,71,295,0.7600,1),(910,71,296,0.5300,2),(911,71,297,0.3700,3),(912,71,298,0.3200,4),(913,71,299,0.3000,5),(914,71,300,0.2800,6),(915,71,301,0.2700,7),(916,71,302,0.2500,8),(917,71,303,0.2400,9),(918,72,295,0.7800,1),(919,72,296,0.5500,2),(920,72,297,0.4000,3),(921,72,298,0.3600,4),(922,72,299,0.3500,5),(923,72,300,0.3200,6),(924,72,301,0.3000,7),(925,72,302,0.2800,8),(926,72,303,0.2700,9),(927,73,310,5.8100,15),(928,73,311,4.3400,16),(929,73,312,3.8400,1),(930,73,313,3.3800,2),(931,73,314,3.1000,3),(932,73,315,2.8200,4),(933,74,310,5.8300,15),(934,74,311,4.3600,16),(935,74,312,3.8600,1),(936,74,313,3.4000,2),(937,74,314,3.1200,3),(938,74,315,2.8400,4),(939,75,310,5.8300,15),(940,75,311,4.3600,16),(941,75,312,3.8600,1),(942,75,313,3.4000,2),(943,75,314,3.1200,3),(944,75,315,2.8400,4),(945,76,310,5.8300,15),(946,76,311,4.3600,16),(947,76,312,3.8600,1),(948,76,313,3.4000,2),(949,76,314,3.1200,3),(950,76,315,2.8400,4),(951,77,310,5.8300,15),(952,77,311,4.3600,16),(953,77,312,3.8600,1),(954,77,313,3.4000,2),(955,77,314,3.1200,3),(956,77,315,2.8400,4),(957,78,310,5.8300,15),(958,78,311,4.3600,16),(959,78,312,3.8600,1),(960,78,313,3.4000,2),(961,78,314,3.1200,3),(962,78,315,2.8400,4),(963,73,317,0.6400,1),(964,73,318,0.4100,2),(965,73,319,0.3700,3),(966,73,320,0.3000,4),(967,73,321,0.2900,5),(968,73,322,0.2700,6),(969,73,323,0.2600,7),(970,73,324,0.2300,8),(971,73,325,0.2200,9),(972,74,317,0.6500,1),(973,74,318,0.4400,2),(974,74,319,0.3800,3),(975,74,320,0.3100,4),(976,74,321,0.3000,5),(977,74,322,0.2800,6),(978,74,323,0.2700,7),(979,74,324,0.2400,8),(980,74,325,0.2300,9),(981,75,317,0.6500,1),(982,75,318,0.4400,2),(983,75,319,0.3800,3),(984,75,320,0.3100,4),(985,75,321,0.3000,5),(986,75,322,0.2800,6),(987,75,323,0.2700,7),(988,75,324,0.2400,8),(989,75,325,0.2300,9),(990,76,317,0.6500,1),(991,76,318,0.4400,2),(992,76,319,0.3800,3),(993,76,320,0.3100,4),(994,76,321,0.3000,5),(995,76,322,0.2800,6),(996,76,323,0.2700,7),(997,76,324,0.2400,8),(998,76,325,0.2300,9),(999,77,317,0.7200,1),(1000,77,318,0.4600,2),(1001,77,319,0.4300,3),(1002,77,320,0.3700,4),(1003,77,321,0.3500,5),(1004,77,322,0.3400,6),(1005,77,323,0.3200,7),(1006,77,324,0.2800,8),(1007,77,325,0.2700,9),(1008,78,317,0.7600,1),(1009,78,318,0.5400,2),(1010,78,319,0.4400,3),(1011,78,320,0.4000,4),(1012,78,321,0.3800,5),(1013,78,322,0.3700,6),(1014,78,323,0.3600,7),(1015,78,324,0.3300,8),(1016,78,325,0.3200,9),(1017,73,326,0.5000,5),(1018,73,327,0.3200,6),(1019,73,328,0.2300,7),(1020,73,329,0.1800,8),(1021,73,330,0.1700,9),(1022,73,331,0.1600,10),(1023,73,332,0.1420,11),(1024,73,333,0.1300,12),(1025,73,334,0.1280,13),(1026,73,335,0.1180,14),(1027,74,326,0.5000,5),(1028,74,327,0.3400,6),(1029,74,328,0.2400,7),(1030,74,329,0.1900,8),(1031,74,330,0.1800,9),(1032,74,331,0.1700,10),(4404,74,332,0.1520,11),(4405,74,333,0.1380,12),(4406,74,334,0.1340,13),(4407,74,335,0.1240,14),(4408,75,326,0.5000,5),(4409,75,327,0.3400,6),(4410,75,328,0.2400,7),(4411,75,329,0.1900,8),(4412,75,330,0.1800,9),(4413,75,331,0.1700,10),(4414,75,332,0.1520,11),(4415,75,333,0.1380,12),(4416,75,334,0.1340,13),(4417,75,335,0.1240,14),(4418,76,326,0.5000,5),(4419,76,327,0.3400,6),(4420,76,328,0.2600,7),(4421,76,329,0.2100,8),(4422,76,330,0.2000,9),(4423,76,331,0.1900,10),(4424,76,332,0.1720,11),(4425,76,333,0.1580,12),(4426,76,334,0.1560,13),(4427,76,335,0.1440,14),(4428,77,326,0.5200,5),(4429,77,327,0.4200,6),(4430,77,328,0.2900,7),(4431,77,329,0.2300,8),(4432,77,330,0.2200,9),(4433,77,331,0.2140,10),(4434,77,332,0.1920,11),(4435,77,333,0.1720,12),(4436,77,334,0.1700,13),(4437,77,335,0.1560,14),(4438,78,326,0.5400,5),(4439,78,327,0.4400,6),(4440,78,328,0.3600,7),(4441,78,329,0.3000,8),(4442,78,330,0.2900,9),(4443,78,331,0.2780,10),(4444,78,332,0.2500,11),(4445,78,333,0.2300,12),(4446,78,334,0.2260,13),(4447,78,335,0.2080,14),(4448,79,341,6.1400,15),(4449,79,342,4.6800,16),(4450,79,343,4.1800,1),(4451,79,344,3.7200,2),(4452,79,345,3.4200,3),(4453,79,346,3.1500,4),(4454,80,341,6.2200,15),(4455,80,342,4.7500,16),(4456,80,343,4.2500,1),(4457,80,344,3.7900,2),(4458,80,345,3.5000,3),(4459,80,346,3.2500,4),(4460,81,341,6.3800,15),(4461,81,342,4.9200,16),(4462,81,343,4.4200,1),(4463,81,344,3.9600,2),(4464,81,345,3.6600,3),(4465,81,346,3.4000,4),(4466,82,341,6.0100,15),(4467,82,342,4.5400,16),(4468,82,343,4.0500,1),(4469,82,344,3.5800,2),(4470,82,345,3.2900,3),(4471,82,346,3.0200,4),(4472,83,341,6.0100,15),(4473,83,342,4.5400,16),(4474,83,343,4.0500,1),(4475,83,344,3.5800,2),(4476,83,345,3.2900,3),(4477,83,346,3.0200,4),(4478,85,341,6.0100,15),(4479,85,342,4.5400,16),(4480,85,343,4.0500,1),(4481,85,344,3.5800,2),(4482,85,345,3.2900,3),(4483,85,346,3.0200,4),(4484,86,341,6.1400,15),(4485,86,342,4.6600,16),(4486,86,343,4.1600,1),(4487,86,344,3.7000,2),(4488,86,345,3.4200,3),(4489,86,346,3.1500,4),(4490,87,341,6.3100,15),(4491,87,342,4.8400,16),(4492,87,343,4.3400,1),(4493,87,344,3.8800,2),(4494,87,345,3.5900,3),(4495,87,346,3.3200,4),(4496,79,347,1.7400,1),(4497,79,348,1.3800,2),(4498,79,349,1.2000,3),(4499,79,350,1.1300,4),(4500,79,351,1.0600,5),(4501,79,352,0.9900,6),(4502,79,353,0.9100,7),(4503,79,354,0.7900,8),(4504,79,355,0.7800,9),(4505,80,347,1.8200,1),(4506,80,348,1.4200,2),(4507,80,349,1.2600,3),(4508,80,350,1.2000,4),(4509,80,351,1.1400,5),(4510,80,352,1.0500,6),(4511,80,353,0.9600,7),(4512,80,354,0.8600,8),(4513,80,355,0.8400,9),(4514,81,347,1.8200,1),(4515,81,348,1.4700,2),(4516,81,349,1.3200,3),(4517,81,350,1.2400,4),(4518,81,351,1.1700,5),(4519,81,352,1.1100,6),(4520,81,353,1.0400,7),(4521,81,354,0.9200,8),(4522,81,355,0.8900,9),(4523,82,347,1.3600,1),(4524,82,348,0.8000,2),(4525,82,349,0.6700,3),(4526,82,350,0.5900,4),(4527,82,351,0.5500,5),(4528,82,352,0.5100,6),(4529,82,353,0.5000,7),(4530,82,354,0.4500,8),(4531,82,355,0.4300,9),(4532,83,347,1.4000,1),(4533,83,348,0.8300,2),(4534,83,349,0.7000,3),(4535,83,350,0.6200,4),(4536,83,351,0.5800,5),(4537,83,352,0.5400,6),(4538,83,353,0.5300,7),(4539,83,354,0.4800,8),(4540,83,355,0.4600,9),(4541,84,347,1.4000,1),(4542,84,348,0.8300,2),(4543,84,349,0.7000,3),(4544,84,350,0.6200,4),(4545,84,351,0.5800,5),(4546,84,352,0.5400,6),(4547,84,353,0.5300,7),(4548,84,354,0.4800,8),(4549,84,355,0.4600,9),(4550,85,347,1.4000,1),(4551,85,348,0.8300,2),(4552,85,349,0.7000,3),(4553,85,350,0.6200,4),(4554,85,351,0.5800,5),(4555,85,352,0.5400,6),(4556,85,353,0.5300,7),(4557,85,354,0.4800,8),(4558,85,355,0.4600,9),(4559,86,347,1.4600,1),(4560,86,348,0.9900,2),(4561,86,349,0.8400,3),(4562,86,350,0.6900,4),(4563,86,351,0.6300,5),(4564,86,352,0.5900,6),(4565,86,353,0.5800,7),(4566,86,354,0.5200,8),(4567,86,355,0.5100,9),(4568,87,347,1.6600,1),(4569,87,348,1.1800,2),(4570,87,349,1.0200,3),(4571,87,350,0.8700,4),(4572,87,351,0.8000,5),(4573,87,352,0.7800,6),(4574,87,353,0.7660,7),(4575,87,354,0.7000,8),(4576,87,355,0.6900,9),(4577,89,362,5.9600,15),(4578,89,363,4.4900,16),(4579,89,364,3.9900,1),(4580,89,365,3.5300,2),(4581,89,366,3.2500,3),(4582,89,367,2.9700,4),(4583,90,362,5.9600,15),(4584,90,363,4.4900,16),(4585,90,364,3.9900,1),(4586,90,365,3.5300,2),(4587,90,366,3.2500,3),(4588,90,367,2.9700,4),(4589,93,362,6.7500,15),(4590,93,363,5.2800,16),(4591,93,364,4.7800,1),(4592,93,365,4.3200,2),(4593,93,366,4.0400,3),(4594,93,367,3.7600,4),(4595,94,362,6.3600,15),(4596,94,363,4.8900,16),(4597,94,364,4.3900,1),(4598,94,365,3.9200,2),(4599,94,366,3.6400,3),(4600,94,367,3.3600,4),(4601,95,362,8.8900,15),(4602,95,363,7.4200,16),(4603,95,364,6.9200,1),(4604,95,365,6.4600,2),(4605,95,366,6.1700,3),(4606,95,367,5.8900,4),(4607,88,369,2.2800,1),(4608,88,370,1.7700,2),(4609,88,371,1.3500,3),(4610,88,372,1.1400,4),(4611,88,373,1.0900,5),(4612,88,374,1.0400,6),(4613,88,375,0.9900,7),(4614,88,376,0.8600,8),(4615,88,377,0.8300,9),(4616,89,369,1.6600,1),(4617,89,370,1.1400,2),(4618,89,371,0.9800,3),(4619,89,372,0.8600,4),(4620,89,373,0.8000,5),(4621,89,374,0.7600,6),(4622,89,375,0.7000,7),(4623,89,376,0.6200,8),(4624,89,377,0.6000,9),(4625,90,369,1.5400,1),(4626,90,370,1.0400,2),(4627,90,371,0.8900,3),(4628,90,372,0.7300,4),(4629,90,373,0.6700,5),(4630,90,374,0.6400,6),(4631,90,375,0.6100,7),(4632,90,376,0.5400,8),(4633,90,377,0.5100,9),(4634,91,369,3.5400,1),(4635,91,370,2.7000,2),(4636,91,371,2.4000,3),(4637,91,372,1.8800,4),(4638,91,373,1.7200,5),(4639,91,374,1.6200,6),(4640,91,375,1.5600,7),(4641,91,376,1.4000,8),(4642,91,377,1.3500,9),(4643,92,369,3.5400,1),(4644,92,370,2.8000,2),(4645,92,371,2.3900,3),(4646,92,372,2.1800,4),(4647,92,373,1.9800,5),(4648,92,374,1.8700,6),(4649,92,375,1.7680,7),(4650,92,376,1.5900,8),(4651,92,377,1.5800,9),(4652,93,369,3.8400,1),(4653,93,370,2.9000,2),(4654,93,371,2.7000,3),(4655,93,372,2.3400,4),(4656,93,373,2.1300,5),(4657,93,374,2.0800,6),(4658,93,375,2.0400,7),(4659,93,376,1.8700,8),(4660,93,377,1.8400,9),(4661,94,369,2.7000,1),(4662,94,370,1.9800,2),(4663,94,371,1.5600,3),(4664,94,372,1.4200,4),(4665,94,373,1.3000,5),(4666,94,374,1.2500,6),(4667,94,375,1.2000,7),(4668,94,376,1.1000,8),(4669,94,377,1.0900,9),(4670,95,369,4.4200,1),(4671,95,370,3.7300,2),(4672,95,371,3.5000,3),(4673,95,372,3.4300,4),(4674,95,373,3.4000,5),(4675,95,374,3.3800,6),(4676,95,375,3.3600,7),(4677,95,376,3.1000,8),(4678,95,377,3.0900,9),(4679,96,384,6.8700,15),(4680,96,385,5.5000,16),(4681,96,386,4.9900,1),(4682,96,387,4.5300,2),(4683,96,388,4.2500,3),(4684,96,389,3.9700,4),(4685,97,384,6.8700,15),(4686,97,385,5.5000,16),(4687,97,386,4.9900,1),(4688,97,387,4.5300,2),(4689,97,388,4.2500,3),(4690,97,389,3.9700,4),(4691,98,384,6.8700,15),(4692,98,385,5.5000,16),(4693,98,386,4.9900,1),(4694,98,387,4.5300,2),(4695,98,388,4.2500,3),(4696,98,389,3.9700,4),(4697,99,384,6.9100,15),(4698,99,385,5.5300,16),(4699,99,386,5.0100,1),(4700,99,387,4.5600,2),(4701,99,388,4.2600,3),(4702,99,389,3.9800,4),(4703,100,384,6.9100,15),(4704,100,385,5.5300,16),(4705,100,386,5.0100,1),(4706,100,387,4.5600,2),(4707,100,388,4.2600,3),(4708,100,389,3.9800,4),(4709,96,391,3.2400,1),(4710,96,392,2.5000,2),(4711,96,393,1.9600,3),(4712,96,394,1.8600,4),(4713,96,395,1.7500,5),(4714,96,396,1.6300,6),(4715,96,397,1.5900,7),(4716,96,398,1.4200,8),(4717,96,399,1.4100,9),(4718,97,391,3.2400,1),(4719,97,392,2.5000,2),(4720,97,393,1.9600,3),(4721,97,394,1.8600,4),(4722,97,395,1.7500,5),(4723,97,396,1.6300,6),(4724,97,397,1.5900,7),(4725,97,398,1.4200,8),(4726,97,399,1.4100,9),(4727,98,391,3.2400,1),(4728,98,392,2.5000,2),(4729,98,393,1.9600,3),(4730,98,394,1.8600,4),(4731,98,395,1.7500,5),(4732,98,396,1.6300,6),(4733,98,397,1.5900,7),(4734,98,398,1.4200,8),(4735,98,399,1.4100,9),(4736,99,391,3.2800,1),(4737,99,392,2.5400,2),(4738,99,393,2.0200,3),(4739,99,394,1.9000,4),(4740,99,395,1.7800,5),(4741,99,396,1.6600,6),(4742,99,397,1.6100,7),(4743,99,398,1.4400,8),(4744,99,399,1.4200,9),(4745,100,391,3.2800,1),(4746,100,392,2.5400,2),(4747,100,393,2.0200,3),(4748,100,394,1.9000,4),(4749,100,395,1.7800,5),(4750,100,396,1.6600,6),(4751,100,397,1.6100,7),(4752,100,398,1.4400,8),(4753,100,399,1.4200,9),(4754,101,406,20.0800,17),(4755,101,407,16.8800,18),(4756,101,408,14.0400,19),(4757,101,409,11.9100,20),(4758,101,410,11.1800,21),(4759,101,411,10.7000,22),(4760,102,406,20.0800,17),(4761,102,407,16.8800,18),(4762,102,408,14.0400,19),(4763,102,409,11.9100,20),(4764,102,410,11.1800,21),(4765,102,411,10.7000,22),(4766,103,406,20.0800,17),(4767,103,407,16.8800,18),(4768,103,408,14.0400,19),(4769,103,409,11.9100,20),(4770,103,410,11.1800,21),(4771,103,411,10.7000,22),(4772,104,413,5.7800,15),(4773,104,414,4.3200,16),(4774,104,415,3.8200,1),(4775,104,416,3.3600,2),(4776,104,417,3.0600,3),(4777,104,418,2.7900,4),(4778,105,413,5.8200,15),(4779,105,414,4.3500,16),(4780,105,415,3.8500,1),(4781,105,416,3.3900,2),(4782,105,417,3.1000,3),(4783,105,418,2.8200,4),(4784,107,413,5.8900,15),(4785,107,414,4.4200,16),(4786,107,415,3.9200,1),(4787,107,416,3.4600,2),(4788,107,417,3.1700,3),(4789,107,418,2.9000,4),(4790,108,413,5.8700,15),(4791,108,414,4.4000,16),(4792,108,415,3.9000,1),(4793,108,416,3.4400,2),(4794,108,417,3.1500,3),(4795,108,418,2.8800,4),(4796,110,413,5.8700,15),(4797,110,414,4.4000,16),(4798,110,415,3.9000,1),(4799,110,416,3.4400,2),(4800,110,417,3.1500,3),(4801,110,418,2.8800,4),(4802,111,413,6.0100,15),(4803,111,414,4.5300,16),(4804,111,415,4.0300,1),(4805,111,416,3.5700,2),(4806,111,417,3.2800,3),(4807,111,418,3.0000,4),(4808,112,413,6.0700,15),(4809,112,414,4.6000,16),(4810,112,415,4.1000,1),(4811,112,416,3.6400,2),(4812,112,417,3.3500,3),(4813,112,418,3.0800,4),(4814,113,413,6.1200,15),(4815,113,414,4.6800,16),(4816,113,415,4.1800,1),(4817,113,416,3.7200,2),(4818,113,417,3.4200,3),(4819,113,418,3.1400,4),(4820,104,420,0.7200,1),(4821,104,421,0.4400,2),(4822,104,422,0.3400,3),(4823,104,423,0.3100,4),(4824,104,424,0.2800,5),(4825,104,425,0.2700,6),(4826,104,426,0.2500,7),(4827,104,427,0.2200,8),(4828,104,428,0.2100,9),(4829,105,420,0.7600,1),(4830,105,421,0.4600,2),(4831,105,422,0.3600,3),(4832,105,423,0.3300,4),(4833,105,424,0.3000,5),(4834,105,425,0.2900,6),(4835,105,426,0.2700,7),(4836,105,427,0.2400,8),(4837,105,428,0.2300,9),(4838,106,420,0.8300,1),(4839,106,421,0.5600,2),(4840,106,422,0.4600,3),(4841,106,423,0.3800,4),(4842,106,424,0.3500,5),(4843,106,425,0.3400,6),(4844,106,426,0.3200,7),(4845,106,427,0.2900,8),(4846,106,428,0.2700,9),(4847,107,420,0.8500,1),(4848,107,421,0.5800,2),(4849,107,422,0.4900,3),(4850,107,423,0.4200,4),(4851,107,424,0.3900,5),(4852,107,425,0.3500,6),(4853,107,426,0.3400,7),(4854,107,427,0.3100,8),(4855,107,428,0.2900,9),(4856,108,420,0.8300,1),(4857,108,421,0.5600,2),(4858,108,422,0.4600,3),(4859,108,423,0.4000,4),(4860,108,424,0.3600,5),(4861,108,425,0.3400,6),(4862,108,426,0.3200,7),(4863,108,427,0.2900,8),(4864,108,428,0.2800,9),(4865,109,420,0.8300,1),(4866,109,421,0.5600,2),(4867,109,422,0.4600,3),(4868,109,423,0.4000,4),(4869,109,424,0.3600,5),(4870,109,425,0.3400,6),(4871,109,426,0.3200,7),(4872,109,427,0.2900,8),(4873,109,428,0.2800,9),(4874,110,420,0.8300,1),(4875,110,421,0.5600,2),(4876,110,422,0.4600,3),(4877,110,423,0.4000,4),(4878,110,424,0.3600,5),(4879,110,425,0.3400,6),(4880,110,426,0.3200,7),(4881,110,427,0.2900,8),(4882,110,428,0.2800,9),(4883,111,420,0.9800,1),(4884,111,421,0.6600,2),(4885,111,422,0.6000,3),(4886,111,423,0.5100,4),(4887,111,424,0.4800,5),(4888,111,425,0.4600,6),(4889,111,426,0.4500,7),(4890,111,427,0.4000,8),(4891,111,428,0.3900,9),(4892,112,420,1.2000,1),(4893,112,421,0.8600,2),(4894,112,422,0.7900,3),(4895,112,423,0.6600,4),(4896,112,424,0.6100,5),(4897,112,425,0.5900,6),(4898,112,426,0.5600,7),(4899,112,427,0.5100,8),(4900,112,428,0.4900,9),(4901,113,420,1.3800,1),(4902,113,421,0.9600,2),(4903,113,422,0.8100,3),(4904,113,423,0.6700,4),(4905,113,424,0.6400,5),(4906,113,425,0.6100,6),(4907,113,426,0.5800,7),(4908,113,427,0.5300,8),(4909,113,428,0.5200,9),(4910,105,435,0.2800,7),(4911,105,436,0.2400,8),(4912,105,437,0.2260,9),(4913,105,438,0.2100,10),(4914,105,439,0.1880,11),(4915,105,440,0.1720,12),(4916,105,441,0.1680,13),(4917,105,442,0.1550,14),(4918,106,435,0.3200,7),(4919,106,436,0.2640,8),(4920,106,437,0.2400,9),(4921,106,438,0.2260,10),(4922,106,439,0.2000,11),(4923,106,440,0.1800,12),(4924,106,441,0.1760,13),(4925,106,442,0.1640,14),(4926,107,435,0.3200,7),(4927,107,436,0.2720,8),(4928,107,437,0.2540,9),(4929,107,438,0.2480,10),(4930,107,439,0.2240,11),(4931,107,440,0.2040,12),(4932,107,441,0.1980,13),(4933,107,442,0.1840,14),(4934,108,435,0.3200,7),(4935,108,436,0.2640,8),(4936,108,437,0.2400,9),(4937,108,438,0.2260,10),(4938,108,439,0.2000,11),(4939,108,440,0.1800,12),(4940,108,441,0.1760,13),(4941,108,442,0.1640,14),(4942,109,435,0.3200,7),(4943,109,436,0.2640,8),(4944,109,437,0.2400,9),(4945,109,438,0.2260,10),(4946,109,439,0.2000,11),(4947,109,440,0.1800,12),(4948,109,441,0.1760,13),(4949,109,442,0.1640,14),(4950,110,435,0.3200,7),(4951,110,436,0.2640,8),(4952,110,437,0.2400,9),(4953,110,438,0.2260,10),(4954,110,439,0.2000,11),(4955,110,440,0.1800,12),(4956,110,441,0.1760,13),(4957,110,442,0.1640,14),(4958,111,435,0.4500,7),(4959,111,436,0.3800,8),(4960,111,437,0.3600,9),(4961,111,438,0.3500,10),(4962,111,439,0.3200,11),(4963,111,440,0.2940,12),(4964,111,441,0.2900,13),(4965,111,442,0.2700,14),(4966,112,435,0.5600,7),(4967,112,436,0.5000,8),(4968,112,437,0.4800,9),(4969,112,438,0.4700,10),(4970,112,439,0.4340,11),(4971,112,440,0.3960,12),(4972,112,441,0.3840,13),(4973,112,442,0.3500,14),(4974,113,435,0.5700,7),(4975,113,436,0.5100,8),(4976,113,437,0.4900,9),(4977,113,438,0.4800,10),(4978,113,439,0.4400,11),(4979,113,440,0.3980,12),(4980,113,441,0.3860,13),(4981,113,442,0.3560,14),(4982,114,450,5.8600,15),(4983,114,451,4.4000,16),(4984,114,452,3.8800,1),(4985,114,453,3.4200,2),(4986,114,454,3.1400,3),(4987,114,455,2.8600,4),(4988,115,450,5.8600,15),(4989,115,451,4.4000,16),(4990,115,452,3.8800,1),(4991,115,453,3.4200,2),(4992,115,454,3.1400,3),(4993,115,455,2.8600,4),(4994,117,450,5.8700,15),(4995,117,451,4.4200,16),(4996,117,452,3.9000,1),(4997,117,453,3.4400,2),(4998,117,454,3.1600,3),(4999,117,455,2.8800,4),(5000,118,450,5.9600,15),(5001,118,451,4.5000,16),(5002,118,452,3.9900,1),(5003,118,453,3.5300,2),(5004,118,454,3.2400,3),(5005,118,455,2.9600,4),(5006,119,450,5.9600,15),(5007,119,451,4.5000,16),(5008,119,452,3.9900,1),(5009,119,453,3.5300,2),(5010,119,454,3.2400,3),(5011,119,455,2.9600,4),(5012,120,450,6.0600,15),(5013,120,451,4.6900,16),(5014,120,452,4.1900,1),(5015,120,453,3.7200,2),(5016,120,454,3.4400,3),(5017,120,455,3.1600,4),(5018,121,450,6.1200,15),(5019,121,451,4.7200,16),(5020,121,452,4.2200,1),(5021,121,453,3.7600,2),(5022,121,454,3.4800,3),(5023,121,455,3.1900,4),(5024,122,450,6.2200,15),(5025,122,451,4.8200,16),(5026,122,452,4.3200,1),(5027,122,453,3.8600,2),(5028,122,454,3.5600,3),(5029,122,455,3.2900,4),(5030,114,457,0.8200,1),(5031,114,458,0.6600,2),(5032,114,459,0.5600,3),(5033,114,460,0.4500,4),(5034,114,461,0.4100,5),(5035,114,462,0.3900,6),(5036,114,463,0.3800,7),(5037,114,464,0.3400,8),(5038,114,465,0.3300,9),(5039,115,457,0.8400,1),(5040,115,458,0.6800,2),(5041,115,459,0.5800,3),(5042,115,460,0.4700,4),(5043,115,461,0.4300,5),(5044,115,462,0.4100,6),(5045,115,463,0.4000,7),(5046,115,464,0.3600,8),(5047,115,465,0.3500,9),(5048,116,457,0.8400,1),(5049,116,458,0.6800,2),(5050,116,459,0.5800,3),(5051,116,460,0.4700,4),(5052,116,461,0.4300,5),(5053,116,462,0.4100,6),(5054,116,463,0.4000,7),(5055,116,464,0.3600,8),(5056,116,465,0.3500,9),(5057,117,457,0.8400,1),(5058,117,458,0.6800,2),(5059,117,459,0.5800,3),(5060,117,460,0.4700,4),(5061,117,461,0.4300,5),(5062,117,462,0.4100,6),(5063,117,463,0.4000,7),(5064,117,464,0.3600,8),(5065,117,465,0.3500,9),(5066,118,457,0.9800,1),(5067,118,458,0.7000,2),(5068,118,459,0.6200,3),(5069,118,460,0.5400,4),(5070,118,461,0.5100,5),(5071,118,462,0.4800,6),(5072,118,463,0.4600,7),(5073,118,464,0.4200,8),(5074,118,465,0.4000,9),(5075,119,457,1.2200,1),(5076,119,458,0.8600,2),(5077,119,459,0.7900,3),(5078,119,460,0.6500,4),(5079,119,461,0.6000,5),(5080,119,462,0.5500,6),(5081,119,463,0.5400,7),(5082,119,464,0.4900,8),(5083,119,465,0.4700,9),(5084,120,457,1.3000,1),(5085,120,458,0.9100,2),(5086,120,459,0.8200,3),(5087,120,460,0.6800,4),(5088,120,461,0.6600,5),(5089,120,462,0.6500,6),(5090,120,463,0.6200,7),(5091,120,464,0.5700,8),(5092,120,465,0.5500,9),(5093,121,457,1.3600,1),(5094,121,458,1.0100,2),(5095,121,459,0.9200,3),(5096,121,460,0.7900,4),(5097,121,461,0.7500,5),(5098,121,462,0.7200,6),(5099,121,463,0.7000,7),(5100,121,464,0.6400,8),(5101,121,465,0.6200,9),(5102,122,457,1.4400,1),(5103,122,458,1.2000,2),(5104,122,459,1.1000,3),(5105,122,460,0.8600,4),(5106,122,461,0.8200,5),(5107,122,462,0.7900,6),(5108,122,463,0.7700,7),(5109,122,464,0.7000,8),(5110,122,465,0.6900,9),(5111,114,472,0.4200,7),(5112,114,473,0.3400,8),(5113,114,474,0.3200,9),(5114,114,475,0.3020,10),(5115,114,476,0.2640,11),(5116,114,477,0.2380,12),(5117,114,478,0.2280,13),(5118,114,479,0.2080,14),(5119,115,472,0.4200,7),(5120,115,473,0.3560,8),(5121,115,474,0.3400,9),(5122,115,475,0.3220,10),(5123,115,476,0.2840,11),(5124,115,477,0.2560,12),(5125,115,478,0.2400,13),(5126,115,479,0.2160,14),(5127,116,472,0.4200,7),(5128,116,473,0.3560,8),(5129,116,474,0.3400,9),(5130,116,475,0.3220,10),(5131,116,476,0.2840,11),(5132,116,477,0.2560,12),(5133,116,478,0.2400,13),(5134,116,479,0.2160,14),(5135,117,472,0.4200,7),(5136,117,473,0.3560,8),(5137,117,474,0.3400,9),(5138,117,475,0.3220,10),(5139,117,476,0.2840,11),(5140,117,477,0.2560,12),(5141,117,478,0.2400,13),(5142,117,479,0.2160,14),(5143,118,472,0.4800,7),(5144,118,473,0.4100,8),(5145,118,474,0.3960,9),(5146,118,475,0.3800,10),(5147,118,476,0.3400,11),(5148,118,477,0.3100,12),(5149,118,478,0.3000,13),(5150,118,479,0.2720,14),(5151,119,472,0.5400,7),(5152,119,473,0.4740,8),(5153,119,474,0.4600,9),(5154,119,475,0.4420,10),(5155,119,476,0.3960,11),(5156,119,477,0.3620,12),(5157,119,478,0.3540,13),(5158,119,479,0.3260,14),(5159,120,472,0.6200,7),(5160,120,473,0.5200,8),(5161,120,474,0.5060,9),(5162,120,475,0.4860,10),(5163,120,476,0.4380,11),(5164,120,477,0.4040,12),(5165,120,478,0.3960,13),(5166,120,479,0.3680,14),(5167,121,472,0.6760,7),(5168,121,473,0.5840,8),(5169,121,474,0.5680,9),(5170,121,475,0.5500,10),(5171,121,476,0.4930,11),(5172,121,477,0.4520,12),(5173,121,478,0.4440,13),(5174,121,479,0.4100,14),(5175,122,472,0.7800,7),(5176,122,473,0.6880,8),(5177,122,474,0.6620,9),(5178,122,475,0.6460,10),(5179,122,476,0.5900,11),(5180,122,477,0.5420,12),(5181,122,478,0.5320,13),(5182,122,479,0.4920,14),(5183,123,487,6.5500,15),(5184,123,488,5.2000,16),(5185,123,489,4.4800,1),(5186,123,490,4.2000,2),(5187,123,491,3.9200,3),(5188,123,492,2.9700,4),(5189,123,494,2.3300,16),(5190,123,495,2.0500,1),(5191,123,496,1.7000,2),(5192,123,497,1.6100,3),(5193,123,498,1.5000,4),(5194,123,499,1.4400,5),(5195,123,500,1.4200,6),(5196,123,501,1.3800,7),(5197,124,509,6.7500,15),(5198,124,510,5.3400,16),(5199,124,511,4.8400,1),(5200,124,512,4.3800,2),(5201,124,513,4.0900,3),(5202,124,514,3.8200,4),(5203,124,516,2.6200,16),(5204,124,517,2.2500,1),(5205,124,518,2.0400,2),(5206,124,519,1.8600,3),(5207,124,520,1.7600,4),(5208,124,521,1.7200,5),(5209,124,522,1.6800,6),(5210,124,523,1.6300,7),(5211,125,531,6.9600,15),(5212,125,532,5.3600,16),(5213,125,533,4.8600,1),(5214,125,534,4.4000,2),(5215,125,535,4.1100,3),(5216,125,536,3.8400,4),(5217,125,537,2.8200,16),(5218,125,538,2.3500,1),(5219,125,539,2.1200,2),(5220,125,540,1.9600,3),(5221,125,541,1.8600,4),(5222,125,542,1.7800,5),(5223,125,543,1.7200,6),(5224,125,544,1.6800,7),(5225,126,545,2.7700,16),(5226,126,546,2.6000,1),(5227,126,547,2.4000,2),(5228,126,548,2.2500,3),(5229,126,549,1.9800,4),(5230,126,550,1.8500,5),(5231,126,551,1.8000,6),(5232,126,552,1.7500,7),(5233,127,562,5.9300,15),(5234,127,563,4.4600,16),(5235,127,564,3.9600,1),(5236,127,565,3.4900,2),(5237,127,566,3.2100,3),(5238,127,567,2.9300,4),(5239,128,562,5.9700,15),(5240,128,563,4.5000,16),(5241,128,564,4.0000,1),(5242,128,565,3.5400,2),(5243,128,566,3.2600,3),(5244,128,567,2.9800,4),(5245,129,562,6.0100,15),(5246,129,563,4.5400,16),(5247,129,564,4.0400,1),(5248,129,565,3.5700,2),(5249,129,566,3.2900,3),(5250,129,567,3.0200,4),(5251,127,568,0.8200,1),(5252,127,569,0.5300,2),(5253,127,570,0.4700,3),(5254,127,571,0.4500,4),(5255,127,572,0.4400,5),(5256,127,573,0.4300,6),(5257,127,574,0.4200,7),(5258,127,575,0.3800,8),(5259,127,576,0.3700,9),(5260,128,568,0.8400,1),(5261,128,569,0.5700,2),(5262,128,570,0.5000,3),(5263,128,571,0.4600,4),(5264,128,572,0.4500,5),(5265,128,573,0.4400,6),(5266,128,574,0.4300,7),(5267,128,575,0.3900,8),(5268,128,576,0.3800,9),(5269,129,568,0.9200,1),(5270,129,569,0.6400,2),(5271,129,570,0.5800,3),(5272,129,571,0.5400,4),(5273,129,572,0.5200,5),(5274,129,573,0.4800,6),(5275,129,574,0.4600,7),(5276,129,575,0.4100,8),(5277,129,576,0.4000,9),(5278,130,577,5.8900,15),(5279,130,578,4.4200,16),(5280,130,579,3.9200,1),(5281,130,580,3.4600,2),(5282,130,581,3.1800,3),(5283,130,582,2.9000,4),(5284,131,577,5.9300,15),(5285,131,578,4.4600,16),(5286,131,579,3.9600,1),(5287,131,580,3.5000,2),(5288,131,581,3.2200,3),(5289,131,582,2.9400,4),(5290,132,577,5.9600,15),(5291,132,578,4.4900,16),(5292,132,579,3.9900,1),(5293,132,580,3.5300,2),(5294,132,581,3.2400,3),(5295,132,582,2.9700,4),(5296,133,577,6.0400,15),(5297,133,578,4.5800,16),(5298,133,579,4.0700,1),(5299,133,580,3.6100,2),(5300,133,581,3.3300,3),(5301,133,582,3.0500,4),(5302,130,583,0.8000,1),(5303,130,584,0.4900,2),(5304,130,585,0.4400,3),(5305,130,586,0.4200,4),(5306,130,587,0.4100,5),(5307,130,588,0.4000,6),(5308,130,589,0.3900,7),(5309,130,590,0.3500,8),(5310,130,591,0.3300,9),(5311,131,583,0.8200,1),(5312,131,584,0.5100,2),(5313,131,585,0.4600,3),(5314,131,586,0.4400,4),(5315,131,587,0.4300,5),(5316,131,588,0.4200,6),(5317,131,589,0.4100,7),(5318,131,590,0.3700,8),(5319,131,591,0.3600,9),(5320,132,583,0.8800,1),(5321,132,584,0.5900,2),(5322,132,585,0.5400,3),(5323,132,586,0.5000,4),(5324,132,587,0.4800,5),(5325,132,588,0.4600,6),(5326,132,589,0.4400,7),(5327,132,590,0.4000,8),(5328,132,591,0.3900,9),(5329,133,583,0.9800,1),(5330,133,584,0.7200,2),(5331,133,585,0.6600,3),(5332,133,586,0.6000,4),(5333,133,587,0.5600,5),(5334,133,588,0.5400,6),(5335,133,589,0.5200,7),(5336,133,590,0.4700,8),(5337,133,591,0.4500,9),(5338,130,592,0.5000,5),(5339,130,593,0.4000,6),(5340,130,594,0.3400,7),(5341,130,595,0.2800,8),(5342,130,596,0.2700,9),(5343,130,597,0.2600,10),(5344,130,598,0.2300,11),(5345,130,599,0.2000,12),(5346,130,600,0.1900,13),(5347,130,601,0.1700,14),(5348,131,592,0.5200,5),(5349,131,593,0.4200,6),(5350,131,594,0.3600,7),(5351,131,595,0.3000,8),(5352,131,596,0.2900,9),(5353,131,597,0.2800,10),(5354,131,598,0.2560,11),(5355,131,599,0.2300,12),(5356,131,600,0.2200,13),(5357,131,601,0.2000,14),(5358,132,592,0.5600,5),(5359,132,593,0.4400,6),(5360,132,594,0.3800,7),(5361,132,595,0.3200,8),(5362,132,596,0.3100,9),(5363,132,597,0.3000,10),(5364,132,598,0.2700,11),(5365,132,599,0.2500,12),(5366,132,600,0.2400,13),(5367,132,601,0.2200,14),(5368,133,592,0.6600,5),(5369,133,593,0.5400,6),(5370,133,594,0.4600,7),(5371,133,595,0.4100,8),(5372,133,596,0.4000,9),(5373,133,597,0.3800,10),(5374,133,598,0.3400,11),(5375,133,599,0.3100,12),(5376,133,600,0.3000,13),(5377,133,601,0.2800,14),(5378,134,602,5.8200,15),(5379,134,603,4.3600,16),(5380,134,604,3.8600,1),(5381,134,605,3.3900,2),(5382,134,606,3.1000,3),(5383,134,607,2.8000,4),(5384,136,602,5.8200,15),(5385,136,603,4.3600,16),(5386,136,604,3.8600,1),(5387,136,605,3.3900,2),(5388,136,606,3.1000,3),(5389,136,607,2.8000,4),(5390,137,602,5.8200,15),(5391,137,603,4.3600,16),(5392,137,604,3.8600,1),(5393,137,605,3.3900,2),(5394,137,606,3.1000,3),(5395,137,607,2.8000,4),(5396,138,602,5.8200,15),(5397,138,603,4.3600,16),(5398,138,604,3.8600,1),(5399,138,605,3.3900,2),(5400,138,606,3.1000,3),(5401,138,607,2.8000,4),(5402,134,608,0.7400,1),(5403,134,609,0.4700,2),(5404,134,610,0.3700,3),(5405,134,611,0.2900,4),(5406,134,612,0.2700,5),(5407,134,613,0.2500,6),(5408,134,614,0.2400,7),(5409,134,615,0.2200,8),(5410,134,616,0.2100,9),(5411,135,608,0.7500,1),(5412,135,609,0.4800,2),(5413,135,610,0.3800,3),(5414,135,611,0.3000,4),(5415,135,612,0.2800,5),(5416,135,613,0.2600,6),(5417,135,614,0.2500,7),(5418,135,615,0.2300,8),(5419,135,616,0.2200,9),(5420,136,608,0.7600,1),(5421,136,609,0.4900,2),(5422,136,610,0.4200,3),(5423,136,611,0.3200,4),(5424,136,612,0.3100,5),(5425,136,613,0.2900,6),(5426,136,614,0.2800,7),(5427,136,615,0.2500,8),(5428,136,616,0.2400,9),(5429,137,608,0.8200,1),(5430,137,609,0.5200,2),(5431,137,610,0.4300,3),(5432,137,611,0.3900,4),(5433,137,612,0.3700,5),(5434,137,613,0.3600,6),(5435,137,614,0.3400,7),(5436,137,615,0.3000,8),(5437,137,616,0.2900,9),(5438,138,608,0.9300,1),(5439,138,609,0.5700,2),(5440,138,610,0.4900,3),(5441,138,611,0.4300,4),(5442,138,612,0.4100,5),(5443,138,613,0.3900,6),(5444,138,614,0.3700,7),(5445,138,615,0.3200,8),(5446,138,616,0.3100,9),(5447,134,617,0.2500,7),(5448,134,618,0.2180,8),(5449,134,619,0.2120,9),(5450,134,620,0.2020,10),(5451,134,621,0.1800,11),(5452,134,622,0.1600,12),(5453,134,623,0.1540,13),(5454,134,624,0.1400,14),(5455,135,617,0.2500,7),(5456,135,618,0.2180,8),(5457,135,619,0.2120,9),(5458,135,620,0.2020,10),(5459,135,621,0.1800,11),(5460,135,622,0.1600,12),(5461,135,623,0.1540,13),(5462,135,624,0.1400,14),(5463,136,617,0.2700,7),(5464,136,618,0.2400,8),(5465,136,619,0.2360,9),(5466,136,620,0.2300,10),(5467,136,621,0.2040,11),(5468,136,622,0.1840,12),(5469,136,623,0.1800,13),(5470,136,624,0.1640,14),(5471,137,617,0.2800,7),(5472,137,618,0.2500,8),(5473,137,619,0.2480,9),(5474,137,620,0.2400,10),(5475,137,621,0.2140,11),(5476,137,622,0.1940,12),(5477,137,623,0.1900,13),(5478,137,624,0.1740,14),(5479,138,617,0.3600,7),(5480,138,618,0.3000,8),(5481,138,619,0.2800,9),(5482,138,620,0.2700,10),(5483,138,621,0.2400,11),(5484,138,622,0.2160,12),(5485,138,623,0.2100,13),(5486,138,624,0.1900,14),(5487,139,625,5.8400,15),(5488,139,626,4.3700,16),(5489,139,627,3.8700,1),(5490,139,628,3.4000,2),(5491,139,629,3.1200,3),(5492,139,630,2.8400,4),(5493,141,625,5.8400,15),(5494,141,626,4.3700,16),(5495,141,627,3.8700,1),(5496,141,628,3.4000,2),(5497,141,629,3.1200,3),(5498,141,630,2.8400,4),(5499,142,625,5.8400,15),(5500,142,626,4.3700,16),(5501,142,627,3.8700,1),(5502,142,628,3.4000,2),(5503,142,629,3.1200,3),(5504,142,630,2.8400,4),(5505,143,625,5.8700,15),(5506,143,626,4.4000,16),(5507,143,627,3.9000,1),(5508,143,628,3.4400,2),(5509,143,629,3.1500,3),(5510,143,630,2.8700,4),(5511,144,625,5.9100,15),(5512,144,626,4.4400,16),(5513,144,627,3.9400,1),(5514,144,628,3.4800,2),(5515,144,629,3.1900,3),(5516,144,630,2.9200,4),(5517,139,631,0.7700,1),(5518,139,632,0.5100,2),(5519,139,633,0.4400,3),(5520,139,634,0.3400,4),(5521,139,635,0.3100,5),(5522,139,636,0.3000,6),(5523,139,637,0.2900,7),(5524,139,638,0.2600,8),(5525,139,639,0.2500,9),(5526,140,631,0.7700,1),(5527,140,632,0.5100,2),(5528,140,633,0.4400,3),(5529,140,634,0.3400,4),(5530,140,635,0.3100,5),(5531,140,636,0.3000,6),(5532,140,637,0.2900,7),(5533,140,638,0.2600,8),(5534,140,639,0.2500,9),(5535,141,631,0.7700,1),(5536,141,632,0.5100,2),(5537,141,633,0.4400,3),(5538,141,634,0.3400,4),(5539,141,635,0.3100,5),(5540,141,636,0.3000,6),(5541,141,637,0.2900,7),(5542,141,638,0.2600,8),(5543,141,639,0.2500,9),(5544,142,631,0.8000,1),(5545,142,632,0.5200,2),(5546,142,633,0.4500,3),(5547,142,634,0.3600,4),(5548,142,635,0.3200,5),(5549,142,636,0.3100,6),(5550,142,637,0.3000,7),(5551,142,638,0.2700,8),(5552,142,639,0.2600,9),(5553,143,631,0.9800,1),(5554,143,632,0.6600,2),(5555,143,633,0.5600,3),(5556,143,634,0.4600,4),(5557,143,635,0.4300,5),(5558,143,636,0.4000,6),(5559,143,637,0.3800,7),(5560,143,638,0.3500,8),(5561,143,639,0.3400,9),(5562,144,631,1.1000,1),(5563,144,632,0.8200,2),(5564,144,633,0.7000,3),(5565,144,634,0.5700,4),(5566,144,635,0.5300,5),(5567,144,636,0.5100,6),(5568,144,637,0.4800,7),(5569,144,638,0.4300,8),(5570,144,639,0.4100,9),(5571,139,640,0.2900,7),(5572,139,641,0.2400,8),(5573,139,642,0.2300,9),(5574,139,643,0.2200,10),(5575,139,644,0.1940,11),(5576,139,645,0.1740,12),(5577,139,646,0.1700,13),(5578,139,647,0.1540,14),(5579,140,640,0.2900,7),(5580,140,641,0.2400,8),(5581,140,642,0.2300,9),(5582,140,643,0.2200,10),(5583,140,644,0.1940,11),(5584,140,645,0.1740,12),(5585,140,646,0.1700,13),(5586,140,647,0.1540,14),(5587,141,640,0.2900,7),(5588,141,641,0.2400,8),(5589,141,642,0.2300,9),(5590,141,643,0.2200,10),(5591,141,644,0.1940,11),(5592,141,645,0.1740,12),(5593,141,646,0.1700,13),(5594,141,647,0.1540,14),(5595,142,640,0.3000,7),(5596,142,641,0.2500,8),(5597,142,642,0.2400,9),(5598,142,643,0.2300,10),(5599,142,644,0.2040,11),(5600,142,645,0.1840,12),(5601,142,646,0.1800,13),(5602,142,647,0.1640,14),(5603,143,640,0.3600,7),(5604,143,641,0.3000,8),(5605,143,642,0.2800,9),(5606,143,643,0.2700,10),(5607,143,644,0.2400,11),(5608,143,645,0.2160,12),(5609,143,646,0.2100,13),(5610,143,647,0.1900,14),(5611,144,640,0.3900,7),(5612,144,641,0.3300,8),(5613,144,642,0.3100,9),(5614,144,643,0.3000,10),(5615,144,644,0.2700,11),(5616,144,645,0.2440,12),(5617,144,646,0.2360,13),(5618,144,647,0.2160,14),(5619,145,648,5.7600,15),(5620,145,649,4.2900,16),(5621,145,650,3.7900,1),(5622,145,651,3.3300,2),(5623,145,652,3.0400,3),(5624,145,653,2.7600,4),(5625,146,648,5.7600,15),(5626,146,649,4.2900,16),(5627,146,650,3.7900,1),(5628,146,651,3.3300,2),(5629,146,652,3.0400,3),(5630,146,653,2.7600,4),(5631,147,648,5.7600,15),(5632,147,649,4.2900,16),(5633,147,650,3.7900,1),(5634,147,651,3.3300,2),(5635,147,652,3.0400,3),(5636,147,653,2.7600,4),(5637,148,648,5.7600,15),(5638,148,649,4.2900,16),(5639,148,650,3.7900,1),(5640,148,651,3.3300,2),(5641,148,652,3.0400,3),(5642,148,653,2.7600,4),(5643,149,648,5.7600,15),(5644,149,649,4.2900,16),(5645,149,650,3.7900,1),(5646,149,651,3.3300,2),(5647,149,652,3.0400,3),(5648,149,653,2.7600,4),(5649,150,648,5.7900,15),(5650,150,649,4.3200,16),(5651,150,650,3.8200,1),(5652,150,651,3.3600,2),(5653,150,652,3.0700,3),(5654,150,653,2.7900,4),(5655,151,648,5.7900,15),(5656,151,649,4.3200,16),(5657,151,650,3.8200,1),(5658,151,651,3.3600,2),(5659,151,652,3.0700,3),(5660,151,653,2.7900,4),(5661,152,648,5.8100,15),(5662,152,649,4.3400,16),(5663,152,650,3.8400,1),(5664,152,651,3.3800,2),(5665,152,652,3.0900,3),(5666,152,653,2.8200,4),(5667,153,648,5.8100,15),(5668,153,649,4.3400,16),(5669,153,650,3.8400,1),(5670,153,651,3.3800,2),(5671,153,652,3.0900,3),(5672,153,653,2.8200,4),(5673,154,648,5.8500,15),(5674,154,649,4.3900,16),(5675,154,650,3.8900,1),(5676,154,651,3.4300,2),(5677,154,652,3.1400,3),(5678,154,653,2.8600,4),(5679,145,654,0.6400,1),(5680,145,655,0.3700,2),(5681,145,656,0.2900,3),(5682,145,657,0.2500,4),(5683,145,658,0.2300,5),(5684,145,659,0.2100,6),(5685,145,660,0.2000,7),(5686,145,661,0.1800,8),(5687,145,662,0.1700,9),(5688,146,654,0.6400,1),(5689,146,655,0.3700,2),(5690,146,656,0.2900,3),(5691,146,657,0.2500,4),(5692,146,658,0.2300,5),(5693,146,659,0.2100,6),(5694,146,660,0.2000,7),(5695,146,661,0.1800,8),(5696,146,662,0.1700,9),(5697,147,654,0.6400,1),(5698,147,655,0.3700,2),(5699,147,656,0.2900,3),(5700,147,657,0.2500,4),(5701,147,658,0.2300,5),(5702,147,659,0.2100,6),(5703,147,660,0.2000,7),(5704,147,661,0.1800,8),(5705,147,662,0.1700,9),(5706,148,654,0.6600,1),(5707,148,655,0.3800,2),(5708,148,656,0.3000,3),(5709,148,657,0.2600,4),(5710,148,658,0.2400,5),(5711,148,659,0.2300,6),(5712,148,660,0.2200,7),(5713,148,661,0.1900,8),(5714,148,662,0.1800,9),(5715,149,654,0.6600,1),(5716,149,655,0.3800,2),(5717,149,656,0.3000,3),(5718,149,657,0.2600,4),(5719,149,658,0.2400,5),(5720,149,659,0.2300,6),(5721,149,660,0.2200,7),(5722,149,661,0.1900,8),(5723,149,662,0.1800,9),(5724,150,654,0.6800,1),(5725,150,655,0.4000,2),(5726,150,656,0.3300,3),(5727,150,657,0.2900,4),(5728,150,658,0.2600,5),(5729,150,659,0.2500,6),(5730,150,660,0.2400,7),(5731,150,661,0.2100,8),(5732,150,662,0.2000,9),(5733,151,654,0.7600,1),(5734,151,655,0.4200,2),(5735,151,656,0.3500,3),(5736,151,657,0.2900,4),(5737,151,658,0.2700,5),(5738,151,659,0.2600,6),(5739,151,660,0.2500,7),(5740,151,661,0.2200,8),(5741,151,662,0.2100,9),(5742,152,654,0.8000,1),(5743,152,655,0.4600,2),(5744,152,656,0.4000,3),(5745,152,657,0.3300,4),(5746,152,658,0.3100,5),(5747,152,659,0.2900,6),(5748,152,660,0.2800,7),(5749,152,661,0.2400,8),(5750,152,662,0.2300,9),(5751,153,654,0.8200,1),(5752,153,655,0.4800,2),(5753,153,656,0.4200,3),(5754,153,657,0.3300,4),(5755,153,658,0.3200,5),(5756,153,659,0.3000,6),(5757,153,660,0.2900,7),(5758,153,661,0.2500,8),(5759,153,662,0.2400,9),(5760,154,654,0.8400,1),(5761,154,655,0.5000,2),(5762,154,656,0.4400,3),(5763,154,657,0.3500,4),(5764,154,658,0.3400,5),(5765,154,659,0.3200,6),(5766,154,660,0.3100,7),(5767,154,661,0.2800,8),(5768,154,662,0.2700,9),(5769,145,663,0.1240,7),(5770,145,664,0.1000,8),(5771,145,665,0.0820,9),(5772,145,666,0.0800,10),(5773,145,667,0.0710,11),(5774,145,668,0.0640,12),(5775,145,669,0.0620,13),(5776,145,670,0.0560,14),(5777,146,663,0.1240,7),(5778,146,664,0.1000,8),(5779,146,665,0.0820,9),(5780,146,666,0.0800,10),(5781,146,667,0.0710,11),(5782,146,668,0.0640,12),(5783,146,669,0.0620,13),(5784,146,670,0.0560,14),(5785,147,663,0.1258,7),(5786,147,664,0.1020,8),(5787,147,665,0.0840,9),(5788,147,666,0.0820,10),(5789,147,667,0.0730,11),(5790,147,668,0.0660,12),(5791,147,669,0.0640,13),(5792,147,670,0.0590,14),(5793,148,663,0.1360,7),(5794,148,664,0.1160,8),(5795,148,665,0.0980,9),(5796,148,666,0.0960,10),(5797,148,667,0.0850,11),(5798,148,668,0.0760,12),(5799,148,669,0.0740,13),(5800,148,670,0.0680,14),(5801,149,663,0.1480,7),(5802,149,664,0.1200,8),(5803,149,665,0.1020,9),(5804,149,666,0.0980,10),(5805,149,667,0.0880,11),(5806,149,668,0.0800,12),(5807,149,669,0.0760,13),(5808,149,670,0.0700,14),(5809,150,663,0.1680,7),(5810,150,664,0.1460,8),(5811,150,665,0.1340,9),(5812,150,666,0.1320,10),(5813,150,667,0.1210,11),(5814,150,668,0.1080,12),(5815,150,669,0.1060,13),(5816,150,670,0.0980,14),(5817,151,663,0.1710,7),(5818,151,664,0.1480,8),(5819,151,665,0.1360,9),(5820,151,666,0.1340,10),(5821,151,667,0.1240,11),(5822,151,668,0.1100,12),(5823,151,669,0.1080,13),(5824,151,670,0.1000,14),(5825,152,663,0.1960,7),(5826,152,664,0.1640,8),(5827,152,665,0.1560,9),(5828,152,666,0.1520,10),(5829,152,667,0.1390,11),(5830,152,668,0.1280,12),(5831,152,669,0.1260,13),(5832,152,670,0.1170,14),(5833,153,663,0.2060,7),(5834,153,664,0.1740,8),(5835,153,665,0.1680,9),(5836,153,666,0.1640,10),(5837,153,667,0.1500,11),(5838,153,668,0.1380,12),(5839,153,669,0.1360,13),(5840,153,670,0.1260,14),(5841,154,663,0.2680,7),(5842,154,664,0.2320,8),(5843,154,665,0.2200,9),(5844,154,666,0.2100,10),(5845,154,667,0.1940,11),(5846,154,668,0.1800,12),(5847,154,669,0.1780,13),(5848,154,670,0.1640,14),(5849,155,671,5.7800,15),(5850,155,672,4.3200,16),(5851,155,673,3.8200,1),(5852,155,674,3.3600,2),(5853,155,675,3.0600,3),(5854,155,676,2.7900,4),(5855,156,671,5.8200,15),(5856,156,672,4.3500,16),(5857,156,673,3.8500,1),(5858,156,674,3.3900,2),(5859,156,675,3.1000,3),(5860,156,676,2.8200,4),(5861,159,671,6.1400,15),(5862,159,672,4.6800,16),(5863,159,673,4.1800,1),(5864,159,674,3.7200,2),(5865,159,675,3.4200,3),(5866,159,676,3.1500,4),(5867,160,671,6.2200,15),(5868,160,672,4.7500,16),(5869,160,673,4.2500,1),(5870,160,674,3.7900,2),(5871,160,675,3.5000,3),(5872,160,676,3.2500,4),(5873,158,671,5.8900,15),(5874,158,672,4.4200,16),(5875,158,673,3.9200,1),(5876,158,674,3.4600,2),(5877,158,675,3.1700,3),(5878,158,676,2.9000,4),(5879,162,671,5.8600,15),(5880,162,672,4.4000,16),(5881,162,673,3.8800,1),(5882,162,674,3.4200,2),(5883,162,675,3.1400,3),(5884,162,676,2.8600,4),(5885,165,671,5.7600,15),(5886,165,672,4.2900,16),(5887,165,673,3.7900,1),(5888,165,674,3.3300,2),(5889,165,675,3.0400,3),(5890,165,676,2.7600,4),(5891,166,671,5.8100,15),(5892,166,672,4.3400,16),(5893,166,673,3.8400,1),(5894,166,674,3.3800,2),(5895,166,675,3.1000,3),(5896,166,676,2.8200,4),(5897,206,671,5.8200,15),(5898,206,672,4.3500,16),(5899,206,673,3.8400,1),(5900,206,674,3.3800,2),(5901,206,675,3.1000,3),(5902,206,676,2.8200,4),(5903,155,677,0.7200,1),(5904,155,678,0.4400,2),(5905,155,679,0.3400,3),(5906,155,680,0.3100,4),(5907,155,681,0.2800,5),(5908,155,682,0.2700,6),(5909,155,683,0.2500,7),(5910,155,684,0.2200,8),(5911,155,685,0.2100,9),(5912,156,677,0.7600,1),(5913,156,678,0.4600,2),(5914,156,679,0.3600,3),(5915,156,680,0.3300,4),(5916,156,681,0.3000,5),(5917,156,682,0.2900,6),(5918,156,683,0.2700,7),(5919,156,684,0.2400,8),(5920,156,685,0.2300,9),(5921,157,677,0.8300,1),(5922,157,678,0.5600,2),(5923,157,679,0.4600,3),(5924,157,680,0.3800,4),(5925,157,681,0.3500,5),(5926,157,682,0.3400,6),(5927,157,683,0.3200,7),(5928,157,684,0.2900,8),(5929,157,685,0.2700,9),(5930,158,677,0.8500,1),(5931,158,678,0.5800,2),(5932,158,679,0.4900,3),(5933,158,680,0.4200,4),(5934,158,681,0.3900,5),(5935,158,682,0.3500,6),(5936,158,683,0.3400,7),(5937,158,684,0.3100,8),(5938,158,685,0.2900,9),(5939,161,677,2.2800,1),(5940,161,678,1.7700,2),(5941,161,679,1.3500,3),(5942,161,680,1.1400,4),(5943,161,681,1.0900,5),(5944,161,682,1.0400,6),(5945,161,683,0.9900,7),(5946,161,684,0.8600,8),(5947,161,685,0.8300,9),(5948,162,677,0.8200,1),(5949,162,678,0.6600,2),(5950,162,679,0.5600,3),(5951,162,680,0.4500,4),(5952,162,681,0.4100,5),(5953,162,682,0.3900,6),(5954,162,683,0.3800,7),(5955,162,684,0.3400,8),(5956,162,685,0.3300,9),(5957,163,677,0.7400,1),(5958,163,678,0.4700,2),(5959,163,679,0.3700,3),(5960,163,680,0.2900,4),(5961,163,681,0.2700,5),(5962,163,682,0.2500,6),(5963,163,683,0.2400,7),(5964,163,684,0.2200,8),(5965,163,685,0.2100,9),(5966,164,677,0.7500,1),(5967,164,678,0.4800,2),(5968,164,679,0.3800,3),(5969,164,680,0.3000,4),(5970,164,681,0.2800,5),(5971,164,682,0.2600,6),(5972,164,683,0.2500,7),(5973,164,684,0.2300,8),(5974,164,685,0.2200,9),(5975,165,677,0.6400,1),(5976,165,678,0.3700,2),(5977,165,679,0.2900,3),(5978,165,680,0.2500,4),(5979,165,681,0.2300,5),(5980,165,682,0.2100,6),(5981,165,683,0.2000,7),(5982,165,684,0.1800,8),(5983,165,685,0.1700,9),(5984,166,677,0.6400,1),(5985,166,678,0.4100,2),(5986,166,679,0.3700,3),(5987,166,680,0.3000,4),(5988,166,681,0.2900,5),(5989,166,682,0.2700,6),(5990,166,683,0.2600,7),(5991,166,684,0.2300,8),(5992,166,685,0.2200,9),(5993,156,686,0.2800,7),(5994,156,687,0.2400,8),(5995,156,688,0.2260,9),(5996,156,689,0.2100,10),(5997,156,690,0.1880,11),(5998,156,691,0.1720,12),(5999,156,692,0.1680,13),(6000,156,693,0.1550,14),(6001,157,686,0.3200,7),(6002,157,687,0.2640,8),(6003,157,688,0.2400,9),(6004,157,689,0.2260,10),(6005,157,690,0.2000,11),(6006,157,691,0.1800,12),(6007,157,692,0.1760,13),(6008,157,693,0.1640,14),(6009,158,686,0.3200,7),(6010,158,687,0.2720,8),(6011,158,688,0.2540,9),(6012,158,689,0.2480,10),(6013,158,690,0.2240,11),(6014,158,691,0.2040,12),(6015,158,692,0.1980,13),(6016,158,693,0.1840,14),(6017,162,686,0.4200,7),(6018,162,687,0.3400,8),(6019,162,688,0.3200,9),(6020,162,689,0.3020,10),(6021,162,690,0.2640,11),(6022,162,691,0.2380,12),(6023,162,692,0.2280,13),(6024,162,693,0.2080,14),(6025,163,686,0.2500,7),(6026,163,687,0.2180,8),(6027,163,688,0.2120,9),(6028,163,689,0.2020,10),(6029,163,690,0.1800,11),(6030,163,691,0.1600,12),(6031,163,692,0.1540,13),(6032,163,693,0.1400,14),(6033,164,686,0.2500,7),(6034,164,687,0.2180,8),(6035,164,688,0.2120,9),(6036,164,689,0.2020,10),(6037,164,690,0.1800,11),(6038,164,691,0.1600,12),(6039,164,692,0.1540,13),(6040,164,693,0.1400,14),(6041,165,686,0.1240,7),(6042,165,687,0.1000,8),(6043,165,688,0.0820,9),(6044,165,689,0.0800,10),(6045,165,690,0.0710,11),(6046,165,691,0.0640,12),(6047,165,692,0.0620,13),(6048,165,693,0.0560,14),(6049,166,686,0.2300,7),(6050,166,687,0.1800,8),(6051,166,688,0.1700,9),(6052,166,689,0.1600,10),(6053,166,690,0.1420,11),(6054,166,691,0.1300,12),(6055,166,692,0.1280,13),(6056,166,693,0.1180,14),(6057,194,NULL,0.0400,3),(6058,194,NULL,0.0300,7),(6059,195,NULL,0.0500,3),(6060,195,NULL,0.0400,7),(6061,196,NULL,0.1050,1),(6062,196,NULL,0.0700,7),(6063,197,NULL,0.1210,1),(6064,197,NULL,0.0850,7),(6065,198,NULL,0.0710,1),(6066,198,NULL,0.0560,7),(6067,177,NULL,0.1000,1),(6068,177,NULL,0.0700,7),(6069,178,NULL,0.1350,1),(6070,178,NULL,0.0900,7),(6071,179,NULL,0.1350,1),(6072,179,NULL,0.0900,7),(6073,180,NULL,0.1150,1),(6074,180,NULL,0.0750,7),(6075,181,NULL,0.1150,1),(6076,181,NULL,0.0750,7),(6077,182,NULL,0.2000,1),(6078,182,NULL,0.1500,7),(6079,185,NULL,0.0650,1),(6080,185,NULL,0.0450,7),(6081,186,NULL,0.0750,1),(6082,186,NULL,0.0550,7),(6083,187,NULL,0.0750,1),(6084,187,NULL,0.0550,7),(6085,188,NULL,0.0750,1),(6086,188,NULL,0.0550,7),(6087,189,NULL,0.0650,1),(6088,189,NULL,0.0500,7),(6089,190,NULL,0.0650,1),(6090,190,NULL,0.0500,7),(6091,191,NULL,0.0650,1),(6092,191,NULL,0.0500,7),(6093,192,NULL,0.1250,1),(6094,192,NULL,0.0900,7),(6095,193,NULL,0.1500,1),(6096,193,NULL,0.1000,7),(6097,173,NULL,0.1200,1),(6098,173,NULL,0.0880,7),(6099,174,NULL,0.1200,1),(6100,174,NULL,0.0880,7),(6101,175,NULL,0.1200,1),(6102,175,NULL,0.0880,7),(6103,176,NULL,0.1200,1),(6104,176,NULL,0.0880,7),(6105,183,NULL,0.1250,1),(6106,183,NULL,0.0850,7),(6107,184,NULL,0.1250,1),(6108,184,NULL,0.0850,7),(6109,167,NULL,0.4000,1),(6110,167,NULL,0.3500,7),(6111,168,NULL,0.1200,1),(6112,168,NULL,0.0880,7),(6113,169,NULL,0.1200,1),(6114,169,NULL,0.0880,7),(6115,170,NULL,0.1200,1),(6116,170,NULL,0.0880,7),(6117,171,NULL,0.1200,1),(6118,171,NULL,0.0880,7),(6119,172,NULL,0.2000,1),(6120,172,NULL,0.1500,7),(6121,199,NULL,0.2300,1),(6122,199,NULL,0.1700,2),(6123,199,NULL,0.1600,3),(6124,199,NULL,0.1400,4),(6125,199,NULL,0.1300,5),(6126,199,NULL,0.1200,6),(6127,199,NULL,0.1100,7),(6128,199,NULL,0.1000,8),(6129,199,NULL,0.0900,9),(6130,200,NULL,0.2300,1),(6131,200,NULL,0.1700,2),(6132,200,NULL,0.1600,3),(6133,200,NULL,0.1400,4),(6134,200,NULL,0.1300,5),(6135,200,NULL,0.1200,6),(6136,200,NULL,0.1100,7),(6137,200,NULL,0.1000,8),(6138,200,NULL,0.0900,9),(6139,201,NULL,0.2300,1),(6140,201,NULL,0.1700,2),(6141,201,NULL,0.1600,3),(6142,201,NULL,0.1400,4),(6143,201,NULL,0.1300,5),(6144,201,NULL,0.1200,6),(6145,201,NULL,0.1100,7),(6146,201,NULL,0.1000,8),(6147,201,NULL,0.0900,9),(6148,202,NULL,0.2600,1),(6149,202,NULL,0.2400,2),(6150,202,NULL,0.2000,3),(6151,202,NULL,0.1800,4),(6152,202,NULL,0.1700,5),(6153,202,NULL,0.1600,6),(6154,202,NULL,0.1500,7),(6155,202,NULL,0.1400,8),(6156,202,NULL,0.1200,9),(6157,203,NULL,0.2600,1),(6158,203,NULL,0.2400,2),(6159,203,NULL,0.2000,3),(6160,203,NULL,0.1800,4),(6161,203,NULL,0.1700,5),(6162,203,NULL,0.1600,6),(6163,203,NULL,0.1500,7),(6164,203,NULL,0.1400,8),(6165,203,NULL,0.1200,9),(6166,204,NULL,0.2600,1),(6167,204,NULL,0.2400,2),(6168,204,NULL,0.2000,3),(6169,204,NULL,0.1800,4),(6170,204,NULL,0.1700,5),(6171,204,NULL,0.1600,6),(6172,204,NULL,0.1500,7),(6173,204,NULL,0.1400,8),(6174,204,NULL,0.1200,9),(6175,205,NULL,0.5100,1),(6176,205,NULL,0.4300,2),(6177,205,NULL,0.3900,3),(6178,205,NULL,0.3300,4),(6179,205,NULL,0.3100,5),(6180,205,NULL,0.2900,6),(6181,205,NULL,0.2800,7),(6182,205,NULL,0.2700,8),(6183,205,NULL,0.2400,9);
/*!40000 ALTER TABLE `smqprices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stamping`
--

DROP TABLE IF EXISTS imprint_types;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stamping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the stamping method is active.',
  `short_name` varchar(45) NOT NULL COMMENT 'The short name of the stamping method.',
  `long_name` varchar(256) NOT NULL COMMENT 'The long name of the stamping method, with capitalization and spaces.',
  `pricing_text` text COMMENT 'The text to display on the web page, with HTML structuring.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stamping`
--

LOCK TABLES imprint_types WRITE;
/*!40000 ALTER TABLE imprint_types DISABLE KEYS */;
INSERT INTO imprint_types VALUES (1,1,'hotstamp','Hot Stamp','One time $40 die charge (Hot stamp foil) (1-die)'),(2,1,'deboss','Deboss','One time $40 die charge (Recessed image) (1-die)'),(3,1,'emboss','Emboss','One time $60 die charge (Raised image) (2-dies) <span class=\"aside\">(male &amp; female)</span>');
/*!40000 ALTER TABLE imprint_types ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoriesmethods`
--

DROP TABLE IF EXISTS `subcategoriesmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategoriesmethods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not the product subcategory/method combination is active.',
  `subcategory_id` int(10) unsigned NOT NULL COMMENT 'Foreign key of the Subcategory.',
  `method_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key of the print method. NULL means it is an unprintable item (such as lids, straws, or utensils).',
  `coupon_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to denote the coupon code for this subcategory/method combination.',
  `second_side` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether or not this subcategory/print method combo has a second side that’s printable. (Called “per panel” for offset napkins.)',
  `wrap` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether or not this subcategory/print method combo has the capability to be printed as a wrap (first and second side together).',
  `bleed` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether or not this subcategory/print method combo has the capability to be printed as a bleed.',
  `multicolor` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether or not this subcategory/print method combo can be printed with more than one color. (Digital method irrelevant for determining the “per color” tag.)',
  `per_thousand` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'True/False. True if the prices for this product/color/method combo is measured per thousand.',
  `setup_charge` smallint(6) unsigned NOT NULL DEFAULT '40' COMMENT 'Amount to charge for setup.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `subcategory_id_idx` (`subcategory_id`),
  KEY `method_id_idx` (`method_id`),
  KEY `sub_id_idx` (`subcategory_id`),
  KEY `m_id_idx` (`method_id`),
  KEY `coupon_id_idx` (`coupon_id`),
  CONSTRAINT `m_id` FOREIGN KEY (`method_id`) REFERENCES `print_methods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `coupon_codes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sub_id` FOREIGN KEY (`subcategory_id`) REFERENCES `product_subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoriesmethods`
--

LOCK TABLES `subcategoriesmethods` WRITE;
/*!40000 ALTER TABLE `subcategoriesmethods` DISABLE KEYS */;
INSERT INTO `subcategoriesmethods` VALUES (1,1,1,2,2,1,0,0,1,0,40),(2,1,2,1,1,1,0,0,0,0,40),(3,1,2,2,2,1,0,0,1,0,40),(4,1,2,3,3,1,0,0,1,1,40),(5,1,3,1,1,1,0,0,0,0,40),(6,1,3,2,2,1,0,0,1,0,40),(7,1,3,3,3,1,0,0,1,1,40),(8,1,4,1,1,0,0,0,0,0,40),(9,1,4,2,2,0,0,0,1,0,40),(10,1,4,3,3,0,0,0,1,1,40),(11,1,5,1,1,1,0,0,0,0,40),(12,1,5,2,2,1,0,0,1,0,40),(13,1,6,2,2,0,0,0,1,0,40),(14,1,7,2,2,0,0,0,1,0,40),(15,1,8,1,1,1,0,1,0,0,40),(16,1,8,2,2,1,0,0,1,0,40),(17,1,9,1,1,1,0,1,0,0,40),(18,1,9,2,2,1,0,0,1,0,40),(19,1,10,1,2,1,0,1,0,0,40),(20,1,11,1,2,1,0,1,0,0,40),(21,1,12,2,2,0,0,0,1,0,40),(22,1,13,1,1,0,0,0,0,0,40),(23,1,13,2,2,0,0,0,1,0,40),(24,1,14,1,1,0,0,0,0,0,40),(25,1,14,2,2,0,0,0,1,0,40),(26,1,15,2,2,0,0,0,1,0,40),(27,1,16,2,2,0,0,0,1,0,40),(28,1,17,2,2,0,0,0,1,0,40),(29,1,18,2,2,0,0,0,1,0,40),(30,1,19,1,1,1,1,0,0,0,40),(31,1,19,2,2,1,1,0,1,0,40),(32,1,20,1,1,0,1,0,0,0,40),(33,1,20,2,2,0,0,0,1,0,40),(34,1,21,1,1,1,0,1,0,0,40),(35,1,21,2,2,0,0,0,1,0,40),(36,1,22,1,1,0,1,0,0,0,40),(37,1,22,2,2,0,0,0,1,0,40),(38,1,23,1,1,1,1,0,0,0,40),(39,1,23,2,2,1,1,0,1,0,40),(40,1,23,3,4,1,1,0,1,0,60),(41,1,24,1,1,1,1,0,0,0,40),(42,1,24,2,2,1,1,0,1,0,40),(43,1,25,1,1,1,1,0,0,0,40),(44,1,25,2,2,1,1,0,1,0,40),(45,1,26,1,1,1,1,0,0,0,40),(46,1,26,2,2,1,1,0,1,0,40),(47,1,27,1,1,1,1,0,0,0,40),(48,1,28,1,1,1,1,0,0,0,40),(49,1,28,2,2,1,1,0,1,0,40),(50,1,28,3,5,1,1,0,1,0,60),(51,1,29,1,1,1,1,0,0,0,40),(52,1,29,2,2,1,1,0,1,0,40),(53,1,29,3,5,1,1,0,1,0,60),(54,1,30,1,1,1,1,0,0,0,40),(55,1,30,2,6,1,1,0,1,0,40),(56,1,31,1,1,1,1,0,0,0,40),(57,1,31,2,6,1,1,0,1,0,40),(58,1,32,1,1,1,1,0,0,0,40),(59,1,32,2,6,1,1,0,1,0,40),(60,1,33,2,6,1,1,0,1,0,40),(61,1,34,1,1,1,1,0,0,0,40),(62,1,34,2,2,1,1,0,1,0,40),(63,1,35,1,1,1,1,0,0,0,40),(64,1,35,2,2,1,1,0,1,0,40),(65,1,35,3,4,1,1,0,1,0,60),(66,1,36,1,1,1,1,0,0,0,40),(67,1,36,2,2,1,1,0,1,0,40),(68,1,36,3,5,1,1,0,1,0,60),(69,1,37,1,1,1,1,0,0,0,40),(70,1,37,2,2,1,1,0,1,0,40),(71,1,37,3,5,1,1,0,1,0,60),(72,1,38,1,1,1,1,0,0,0,40),(73,1,38,2,2,1,1,0,1,0,40),(74,1,38,3,5,1,1,0,1,0,60),(75,1,39,1,1,1,1,0,0,0,40),(76,1,39,2,2,1,1,0,1,0,40),(77,1,39,3,5,1,1,0,1,0,60),(78,1,40,NULL,7,0,0,0,0,0,0),(79,1,41,NULL,7,0,0,0,0,0,0),(80,1,42,NULL,8,0,0,0,0,0,0);
/*!40000 ALTER TABLE `subcategoriesmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoriesmethodsfeatures`
--

DROP TABLE IF EXISTS `subcategoriesmethodsfeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategoriesmethodsfeatures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `subcategorymethod_id` int(10) unsigned NOT NULL COMMENT 'Foreign key of the Subcategory & Print Method joining table.',
  `feature_id` int(10) unsigned NOT NULL COMMENT 'Foreign key of a Feature/Option associated with the Subcategory & Print Method.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `feature_id_idx` (`feature_id`),
  KEY `subcategorymethod_id_idx` (`subcategorymethod_id`),
  CONSTRAINT `feature_id` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subcategorymethod_id` FOREIGN KEY (`subcategorymethod_id`) REFERENCES `subcategoriesmethods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoriesmethodsfeatures`
--

LOCK TABLES `subcategoriesmethodsfeatures` WRITE;
/*!40000 ALTER TABLE `subcategoriesmethodsfeatures` DISABLE KEYS */;
INSERT INTO `subcategoriesmethodsfeatures` VALUES (1,1,1),(2,1,21),(3,1,2),(4,1,3),(5,1,22),(6,1,23),(7,1,16),(8,1,17),(9,1,6),(10,1,7),(11,1,9),(12,1,24),(13,2,1),(14,2,21),(15,2,2),(16,2,3),(17,2,26),(18,2,28),(19,2,18),(20,3,1),(21,3,21),(22,3,2),(23,3,3),(24,3,26),(25,3,16),(26,3,17),(27,3,6),(28,3,7),(29,3,8),(30,3,9),(31,3,5),(32,4,1),(33,4,25),(34,4,21),(35,4,2),(36,4,3),(37,4,26),(38,4,17),(39,4,27),(46,5,1),(47,5,21),(48,5,2),(49,5,3),(50,5,26),(51,5,18),(52,6,1),(53,6,21),(54,6,2),(55,6,3),(56,6,26),(57,6,16),(58,6,17),(59,6,6),(60,6,7),(61,6,8),(62,6,9),(63,6,5),(64,7,1),(65,7,25),(66,7,21),(67,7,2),(68,7,3),(69,7,26),(70,7,17),(71,7,27),(72,8,1),(73,8,21),(74,8,2),(75,8,3),(76,8,26),(77,8,18),(78,9,1),(79,9,21),(80,9,2),(81,9,3),(82,9,26),(83,9,16),(84,9,17),(85,9,6),(86,9,7),(87,9,8),(88,9,9),(89,9,5),(90,10,1),(91,10,25),(92,10,21),(93,10,2),(94,10,3),(95,10,26),(96,10,17),(97,10,27),(98,11,1),(99,11,2),(100,11,3),(101,11,10),(102,11,11),(103,11,18),(104,12,1),(105,12,2),(106,12,3),(107,12,10),(108,12,11),(109,12,16),(110,12,17),(111,12,6),(112,12,7),(113,12,8),(114,12,9),(115,12,5),(116,13,1),(117,13,21),(118,13,2),(119,13,3),(120,13,26),(121,13,16),(122,13,17),(123,13,6),(124,13,7),(125,13,8),(126,13,9),(127,13,5),(128,14,1),(129,14,2),(130,14,3),(131,14,29),(132,14,30),(133,14,16),(134,14,17),(135,14,6),(136,14,7),(137,14,9),(138,14,24),(139,15,1),(140,15,2),(141,15,3),(142,15,31),(143,15,28),(144,15,32),(145,15,18),(146,16,1),(147,16,2),(148,16,3),(149,16,31),(150,16,28),(151,16,16),(152,16,17),(153,16,7),(154,16,34),(155,16,35),(156,16,33),(157,17,1),(158,17,2),(159,17,3),(160,17,39),(161,17,38),(162,17,28),(163,17,32),(164,17,18),(165,18,1),(166,18,2),(167,18,3),(168,18,39),(169,18,38),(170,18,28),(171,18,16),(172,18,34),(173,18,7),(174,18,35),(175,18,33),(176,19,1),(177,19,40),(178,19,28),(179,19,32),(180,19,18),(181,20,1),(182,20,40),(183,20,28),(184,20,32),(185,20,18),(186,21,1),(187,21,41),(188,21,2),(189,21,3),(190,21,16),(191,21,17),(192,21,8),(193,21,35),(194,21,48),(195,22,1),(196,22,45),(197,22,44),(198,22,43),(199,22,42),(200,22,50),(201,22,18),(202,23,1),(203,23,45),(204,23,44),(205,23,43),(206,23,42),(207,23,16),(208,23,17),(209,23,35),(210,24,1),(211,24,4),(212,24,46),(213,24,42),(214,24,50),(215,24,18),(216,25,1),(217,25,45),(218,25,46),(219,25,42),(220,25,16),(221,25,17),(222,25,35),(223,26,1),(224,26,4),(225,26,16),(226,26,17),(227,26,8),(228,26,35),(229,26,48),(230,27,1),(231,27,4),(232,27,50),(233,27,16),(234,27,17),(235,27,35),(236,28,1),(237,28,4),(238,28,2),(239,28,49),(240,28,16),(241,28,17),(242,28,8),(243,28,35),(244,28,48),(245,29,1),(246,29,4),(247,29,2),(248,29,23),(249,29,49),(250,29,16),(251,29,17),(252,29,35),(253,30,1),(254,30,55),(255,30,2),(256,30,53),(257,30,54),(258,30,51),(259,30,50),(260,30,18),(261,31,1),(262,31,55),(263,31,2),(264,31,53),(265,31,54),(266,31,52),(267,31,51),(268,31,16),(269,31,17),(270,31,9),(271,32,1),(272,32,55),(273,32,2),(274,32,53),(275,32,54),(276,32,56),(277,32,57),(278,32,51),(279,32,18),(280,33,1),(281,33,55),(282,33,2),(283,33,53),(284,33,54),(285,33,56),(286,33,57),(287,33,58),(288,33,16),(289,33,17),(290,33,9),(291,34,1),(292,34,2),(293,34,3),(294,34,4),(295,34,59),(296,34,32),(297,34,18),(298,35,1),(299,35,2),(300,35,3),(301,35,4),(302,35,16),(303,35,17),(304,35,7),(305,35,35),(306,35,48),(307,36,1),(308,36,3),(309,36,60),(310,36,2),(311,36,61),(312,36,54),(313,36,51),(314,36,18),(315,37,1),(316,37,3),(317,37,60),(318,37,2),(319,37,61),(320,37,54),(321,37,52),(322,37,51),(323,37,16),(324,37,17),(325,37,9),(326,38,1),(327,38,55),(328,38,2),(329,38,53),(330,38,54),(331,38,51),(332,38,18),(333,39,1),(334,39,55),(335,39,2),(336,39,53),(337,39,54),(338,39,52),(339,39,51),(340,39,16),(341,39,17),(342,39,9),(343,40,1),(344,40,55),(345,40,2),(346,40,53),(347,40,54),(348,40,51),(349,40,62),(350,40,17),(351,40,27),(352,41,1),(353,41,4),(354,41,91),(355,41,92),(356,41,46),(357,41,51),(358,41,50),(359,41,18),(360,42,1),(361,42,4),(362,42,91),(363,42,92),(364,42,46),(365,42,52),(366,42,51),(367,42,16),(368,42,17),(369,42,9),(370,43,1),(371,43,4),(372,43,96),(373,43,97),(374,43,91),(375,43,92),(376,43,51),(377,43,50),(378,43,18),(379,44,1),(380,44,4),(381,44,96),(382,44,97),(383,44,52),(384,44,51),(385,44,16),(386,44,17),(387,44,9),(388,45,1),(389,45,4),(390,45,98),(391,45,103),(392,45,104),(393,45,105),(394,45,51),(395,45,50),(396,45,18),(397,46,1),(398,46,4),(399,46,98),(400,46,103),(401,46,104),(402,46,105),(403,46,51),(404,46,16),(405,46,17),(406,46,9),(407,47,1),(408,47,4),(409,47,98),(410,47,99),(411,47,100),(412,47,101),(413,47,102),(414,47,51),(415,47,50),(416,47,18),(417,48,1),(418,48,4),(419,48,104),(420,48,51),(421,48,50),(422,48,18),(423,49,1),(424,49,4),(425,49,104),(426,49,52),(427,49,51),(428,49,16),(429,49,17),(430,49,9),(431,50,1),(432,50,4),(433,50,104),(434,50,51),(435,50,62),(436,50,17),(437,50,119),(438,51,1),(439,51,4),(440,51,98),(441,51,107),(442,51,108),(443,51,51),(444,51,50),(445,51,18),(446,52,1),(447,52,4),(448,52,98),(449,52,107),(450,52,108),(451,52,52),(452,52,51),(453,52,16),(454,52,17),(455,52,9),(456,53,1),(457,53,4),(458,53,98),(459,53,107),(460,53,108),(461,53,51),(462,53,62),(463,53,17),(464,53,119),(465,54,1),(466,54,111),(467,54,112),(468,54,113),(469,54,114),(470,54,115),(471,54,51),(472,54,50),(473,54,18),(474,55,1),(475,55,111),(476,55,112),(477,55,113),(478,55,114),(479,55,115),(480,55,16),(481,55,17),(482,55,52),(483,55,51),(484,55,9),(485,56,1),(486,56,111),(487,56,112),(488,56,113),(489,56,114),(490,56,115),(491,56,51),(492,56,50),(493,56,18),(494,57,1),(495,57,111),(496,57,112),(497,57,113),(498,57,114),(499,57,115),(500,57,16),(501,57,17),(502,57,52),(503,57,51),(504,57,9),(505,58,1),(506,58,111),(507,58,127),(508,58,116),(509,58,113),(510,58,114),(511,58,117),(512,58,51),(513,58,50),(514,58,18),(515,59,1),(516,59,111),(517,59,116),(518,59,113),(519,59,114),(520,59,52),(521,59,117),(522,59,51),(523,59,16),(524,59,17),(525,59,9),(526,60,1),(527,60,111),(528,60,113),(529,60,114),(530,60,118),(531,60,115),(532,60,52),(533,60,51),(534,60,16),(535,60,17),(536,60,9),(537,61,1),(538,61,4),(539,61,42),(540,61,51),(541,61,50),(542,61,18),(543,62,1),(544,62,52),(545,62,51),(546,62,16),(547,62,17),(548,62,9),(549,63,1),(550,63,4),(551,63,42),(552,63,51),(553,63,18),(554,64,1),(555,64,4),(556,64,42),(557,64,52),(558,64,51),(559,64,16),(560,64,17),(561,64,9),(562,65,1),(563,65,4),(564,65,42),(565,65,51),(566,65,62),(567,65,17),(568,65,119),(569,66,1),(570,66,4),(571,66,120),(572,66,51),(573,66,50),(574,66,18),(575,67,1),(576,67,4),(577,67,120),(578,67,52),(579,67,51),(580,67,16),(581,67,17),(582,67,9),(583,68,1),(584,68,4),(585,68,120),(586,68,51),(587,68,62),(588,68,17),(589,68,119),(590,69,1),(591,69,121),(592,69,122),(593,69,51),(594,69,50),(595,69,18),(596,70,1),(597,70,121),(598,70,122),(599,70,52),(600,70,51),(601,70,16),(602,70,17),(603,70,9),(604,71,1),(605,71,121),(606,71,122),(607,71,51),(608,71,62),(609,71,17),(610,71,119),(611,72,1),(612,72,4),(613,72,123),(614,72,56),(615,72,54),(616,72,51),(617,72,18),(618,73,1),(619,73,4),(620,73,123),(621,73,56),(622,73,54),(623,73,52),(624,73,51),(625,73,16),(626,73,17),(627,73,9),(628,74,1),(629,74,4),(630,74,123),(631,74,56),(632,74,54),(633,74,51),(634,74,62),(635,74,17),(636,74,119),(637,75,1),(638,75,4),(639,75,125),(640,75,51),(641,75,126),(642,75,18),(643,76,1),(644,76,4),(645,76,125),(646,76,52),(647,76,51),(648,76,16),(649,76,17),(650,76,9),(651,77,1),(652,77,4),(653,77,125),(654,77,51),(655,77,62),(656,77,17),(657,77,119),(668,62,4);
/*!40000 ALTER TABLE `subcategoriesmethodsfeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoriesmethodsquantities`
--

DROP TABLE IF EXISTS `subcategoriesmethodsquantities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategoriesmethodsquantities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `subcat_method_id` int(10) unsigned NOT NULL COMMENT 'Foreign key from the SubcategoriesMethods joining table.',
  `quantity_id` int(10) unsigned NOT NULL COMMENT 'Foreign key denoting which quantity break to use.',
  `additional_color_charge` decimal(19,4) unsigned DEFAULT NULL COMMENT 'The price for an additional color for the quantity break, or NULL if there are no additional color charges for the Subcategory & Print Method.',
  `second_side_charge` decimal(19,4) unsigned DEFAULT NULL COMMENT 'The price to imprint the second side of the item, or NULL if the item cannot be printed on a second side.',
  `process_charge` decimal(19,4) unsigned DEFAULT NULL COMMENT 'The price for printing using a 4-color process method, or NULL if this Subcategory & Print Method combo does not charge for 4-color process printing.',
  `bleed_charge` decimal(19,4) unsigned DEFAULT NULL COMMENT 'The price for an printing full bleed, or NULL if this Subcategory & Print Method does not allow for full bleed printing.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `quantity_id_idx` (`quantity_id`),
  KEY `subcat_method_id_idx` (`subcat_method_id`),
  CONSTRAINT `quantity_id` FOREIGN KEY (`quantity_id`) REFERENCES `quantity_breaks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subcat_method_id` FOREIGN KEY (`subcat_method_id`) REFERENCES `subcategoriesmethods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=817 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoriesmethodsquantities`
--

LOCK TABLES `subcategoriesmethodsquantities` WRITE;
/*!40000 ALTER TABLE `subcategoriesmethodsquantities` DISABLE KEYS */;
INSERT INTO `subcategoriesmethodsquantities` VALUES (1,1,1,0.2400,NULL,NULL,NULL),(2,1,2,0.1400,NULL,NULL,NULL),(3,1,3,0.1200,NULL,NULL,NULL),(4,1,4,0.1100,NULL,NULL,NULL),(5,1,5,0.1000,NULL,NULL,NULL),(6,1,6,0.0900,NULL,NULL,NULL),(7,1,7,0.0900,NULL,NULL,NULL),(8,1,8,0.0900,NULL,NULL,NULL),(9,1,9,0.0900,NULL,NULL,NULL),(10,2,16,NULL,2.0500,NULL,NULL),(11,2,1,NULL,1.9000,NULL,NULL),(12,2,2,NULL,1.1000,NULL,NULL),(13,2,3,NULL,0.9000,NULL,NULL),(14,2,4,NULL,0.6500,NULL,NULL),(15,2,5,NULL,0.5500,NULL,NULL),(16,3,1,0.2400,NULL,2.9000,NULL),(17,3,2,0.1400,NULL,1.2500,NULL),(18,3,3,0.1200,NULL,0.8500,NULL),(19,3,4,0.1100,NULL,0.6200,NULL),(20,3,5,0.1000,NULL,0.4500,NULL),(21,3,6,0.0900,NULL,0.3800,NULL),(22,3,7,0.0900,NULL,0.3500,NULL),(23,3,8,0.0900,NULL,0.3450,NULL),(24,3,9,0.0900,NULL,0.3400,NULL),(25,4,7,6.0000,NULL,NULL,NULL),(26,4,8,5.0000,NULL,NULL,NULL),(27,4,9,4.0000,NULL,NULL,NULL),(28,4,10,4.0000,NULL,NULL,NULL),(29,4,11,4.0000,NULL,NULL,NULL),(30,4,12,3.0000,NULL,NULL,NULL),(31,4,13,2.8000,NULL,NULL,NULL),(32,4,14,2.5000,NULL,NULL,NULL),(33,5,16,NULL,NULL,NULL,NULL),(34,5,1,NULL,NULL,NULL,NULL),(35,5,2,NULL,NULL,NULL,NULL),(36,5,3,NULL,NULL,NULL,NULL),(37,5,4,NULL,NULL,NULL,NULL),(38,5,5,NULL,NULL,NULL,NULL),(39,6,1,0.2400,NULL,2.9000,NULL),(40,6,2,0.1400,NULL,1.2500,NULL),(41,6,3,0.1200,NULL,0.8500,NULL),(42,6,4,0.1100,NULL,0.6200,NULL),(43,6,5,0.1000,NULL,0.4500,NULL),(44,6,6,0.0900,NULL,0.3800,NULL),(45,6,7,0.0900,NULL,0.3500,NULL),(46,6,8,0.0900,NULL,0.3450,NULL),(47,6,9,0.0900,NULL,0.3400,NULL),(48,7,7,6.0000,NULL,NULL,NULL),(49,7,8,5.0000,NULL,NULL,NULL),(50,7,9,4.0000,NULL,NULL,NULL),(51,7,10,4.0000,NULL,NULL,NULL),(52,7,11,4.0000,NULL,NULL,NULL),(53,7,12,3.0000,NULL,NULL,NULL),(54,7,13,2.8000,NULL,NULL,NULL),(55,7,14,2.5000,NULL,NULL,NULL),(56,8,16,NULL,NULL,NULL,NULL),(57,8,1,NULL,NULL,NULL,NULL),(58,8,2,NULL,NULL,NULL,NULL),(59,8,3,NULL,NULL,NULL,NULL),(60,8,4,NULL,NULL,NULL,NULL),(61,8,5,NULL,NULL,NULL,NULL),(62,9,1,0.2400,NULL,2.9000,NULL),(63,9,2,0.1400,NULL,1.2500,NULL),(64,9,3,0.1200,NULL,0.8500,NULL),(65,9,4,0.1100,NULL,0.6200,NULL),(66,9,5,0.1000,NULL,0.4500,NULL),(67,9,6,0.0900,NULL,0.3800,NULL),(68,9,7,0.0900,NULL,0.3500,NULL),(69,9,8,0.0900,NULL,0.3450,NULL),(70,9,9,0.0900,NULL,0.3400,NULL),(71,10,7,6.0000,NULL,NULL,NULL),(72,10,8,5.0000,NULL,NULL,NULL),(73,10,9,4.0000,NULL,NULL,NULL),(74,10,10,4.0000,NULL,NULL,NULL),(75,10,11,4.0000,NULL,NULL,NULL),(76,10,12,3.0000,NULL,NULL,NULL),(77,10,13,2.8000,NULL,NULL,NULL),(78,10,14,2.5000,NULL,NULL,NULL),(79,11,16,NULL,NULL,NULL,NULL),(80,11,1,NULL,NULL,NULL,NULL),(81,11,2,NULL,NULL,NULL,NULL),(82,11,3,NULL,NULL,NULL,NULL),(83,11,4,NULL,NULL,NULL,NULL),(84,11,5,NULL,NULL,NULL,NULL),(85,12,1,0.2400,NULL,2.9000,NULL),(86,12,2,0.1400,NULL,1.2500,NULL),(87,12,3,0.1200,NULL,0.8500,NULL),(88,12,4,0.1100,NULL,0.6200,NULL),(89,12,5,0.1000,NULL,0.4500,NULL),(90,12,6,0.0900,NULL,0.3800,NULL),(91,12,7,0.0900,NULL,0.3500,NULL),(92,12,8,0.0900,NULL,0.3450,NULL),(93,12,9,0.0900,NULL,0.3400,NULL),(94,13,1,0.2400,NULL,2.9000,NULL),(95,13,2,0.1400,NULL,1.2500,NULL),(96,13,3,0.1200,NULL,0.8500,NULL),(97,13,4,0.1100,NULL,0.6200,NULL),(98,13,5,0.1000,NULL,0.4500,NULL),(99,13,6,0.0900,NULL,0.3800,NULL),(100,13,7,0.0900,NULL,0.3500,NULL),(101,13,8,0.0900,NULL,0.3450,NULL),(102,13,9,0.0900,NULL,0.3400,NULL),(103,14,1,0.2400,NULL,NULL,NULL),(104,14,2,0.1400,NULL,NULL,NULL),(105,14,3,0.1200,NULL,NULL,NULL),(106,14,4,0.1100,NULL,NULL,NULL),(107,14,5,0.1000,NULL,NULL,NULL),(108,14,6,0.0900,NULL,NULL,NULL),(109,14,7,0.0900,NULL,NULL,NULL),(110,14,8,0.0900,NULL,NULL,NULL),(111,14,9,0.0900,NULL,NULL,NULL),(112,15,16,NULL,0.4400,NULL,0.1000),(113,15,1,NULL,0.4000,NULL,0.1000),(114,15,2,NULL,0.3600,NULL,0.1000),(115,15,3,NULL,0.3200,NULL,0.1000),(116,15,4,NULL,0.3000,NULL,0.1000),(117,15,5,NULL,0.2800,NULL,0.1000),(118,16,1,NULL,NULL,NULL,NULL),(119,16,2,NULL,NULL,NULL,NULL),(120,16,3,0.1200,NULL,NULL,NULL),(121,16,4,0.1100,NULL,NULL,NULL),(122,16,5,0.1000,NULL,NULL,NULL),(123,16,6,0.0900,NULL,NULL,NULL),(124,16,7,0.0900,NULL,NULL,NULL),(125,16,8,0.0900,NULL,NULL,NULL),(126,16,9,0.0900,NULL,NULL,NULL),(127,17,16,NULL,0.4400,NULL,0.1000),(128,17,1,NULL,0.4000,NULL,0.1000),(129,17,2,NULL,0.3600,NULL,0.1000),(130,17,3,NULL,0.3200,NULL,0.1000),(131,17,4,NULL,0.3000,NULL,0.1000),(132,17,5,NULL,0.2800,NULL,0.1000),(133,18,1,NULL,NULL,NULL,NULL),(134,18,2,NULL,NULL,NULL,NULL),(135,18,3,0.1200,NULL,NULL,NULL),(136,18,4,0.1100,NULL,NULL,NULL),(137,18,5,0.1000,NULL,NULL,NULL),(138,18,6,0.0900,NULL,NULL,NULL),(139,18,7,0.0900,NULL,NULL,NULL),(140,18,8,0.0900,NULL,NULL,NULL),(141,18,9,0.0900,NULL,NULL,NULL),(142,19,1,NULL,0.3000,NULL,0.1000),(143,19,2,NULL,0.2800,NULL,0.1000),(144,19,3,NULL,0.2700,NULL,0.1000),(145,19,4,NULL,0.2600,NULL,0.1000),(146,19,5,NULL,0.2400,NULL,0.1000),(147,19,6,NULL,0.2200,NULL,0.1000),(148,19,7,NULL,0.2000,NULL,0.1000),(149,19,8,NULL,0.1800,NULL,0.0900),(150,19,9,NULL,0.1760,NULL,0.0900),(151,20,1,NULL,0.3000,NULL,0.1000),(152,20,2,NULL,0.2800,NULL,0.1000),(153,20,3,NULL,0.2700,NULL,0.1000),(154,20,4,NULL,0.2600,NULL,0.1000),(155,20,5,NULL,0.2400,NULL,0.1000),(156,20,6,NULL,0.2200,NULL,0.1000),(157,20,7,NULL,0.2000,NULL,0.1000),(158,20,8,NULL,0.1800,NULL,0.0900),(159,20,9,NULL,0.1760,NULL,0.0900),(160,21,1,0.3900,NULL,3.4500,NULL),(161,21,2,0.2700,NULL,1.8000,NULL),(162,21,3,0.2400,NULL,1.3000,NULL),(163,21,4,0.2200,NULL,1.0500,NULL),(164,21,5,0.2100,NULL,0.8500,NULL),(165,21,6,0.2000,NULL,0.7900,NULL),(166,21,7,0.1900,NULL,0.7500,NULL),(167,21,8,0.1900,NULL,0.7400,NULL),(168,21,9,0.1900,NULL,0.7200,NULL),(169,22,16,NULL,NULL,NULL,NULL),(170,22,1,NULL,NULL,NULL,NULL),(171,22,2,NULL,NULL,NULL,NULL),(172,22,3,NULL,NULL,NULL,NULL),(173,22,4,NULL,NULL,NULL,NULL),(174,22,5,NULL,NULL,NULL,NULL),(175,23,1,0.4200,NULL,NULL,NULL),(176,23,2,0.2800,NULL,NULL,NULL),(177,23,3,0.2600,NULL,NULL,NULL),(178,23,4,0.2400,NULL,NULL,NULL),(179,23,5,0.2200,NULL,NULL,NULL),(180,23,6,0.2100,NULL,NULL,NULL),(181,23,7,0.2000,NULL,NULL,NULL),(182,23,8,0.1900,NULL,NULL,NULL),(183,23,9,0.1900,NULL,NULL,NULL),(184,24,16,NULL,NULL,NULL,NULL),(185,24,1,NULL,NULL,NULL,NULL),(186,24,2,NULL,NULL,NULL,NULL),(187,24,3,NULL,NULL,NULL,NULL),(188,24,4,NULL,NULL,NULL,NULL),(189,24,5,NULL,NULL,NULL,NULL),(190,25,1,0.4200,NULL,NULL,NULL),(191,25,2,0.2800,NULL,NULL,NULL),(192,25,3,0.2600,NULL,NULL,NULL),(193,25,4,0.2400,NULL,NULL,NULL),(194,25,5,0.2200,NULL,NULL,NULL),(195,25,6,0.2100,NULL,NULL,NULL),(196,25,7,0.2000,NULL,NULL,NULL),(197,25,8,0.1900,NULL,NULL,NULL),(198,25,9,0.1900,NULL,NULL,NULL),(199,26,1,0.3900,NULL,3.4500,NULL),(200,26,2,0.2700,NULL,1.8000,NULL),(201,26,3,0.2400,NULL,1.3000,NULL),(202,26,4,0.2200,NULL,1.0500,NULL),(203,26,5,0.2100,NULL,0.8500,NULL),(204,26,6,0.2000,NULL,0.7900,NULL),(205,26,7,0.1900,NULL,0.7500,NULL),(206,26,8,0.1900,NULL,0.7400,NULL),(207,26,9,0.1900,NULL,0.7200,NULL),(208,27,1,0.3900,NULL,NULL,NULL),(209,27,2,0.2700,NULL,NULL,NULL),(210,27,3,0.2400,NULL,NULL,NULL),(211,27,4,0.2200,NULL,NULL,NULL),(212,27,5,0.2100,NULL,NULL,NULL),(213,27,6,0.2000,NULL,NULL,NULL),(214,27,7,0.1900,NULL,NULL,NULL),(215,27,8,0.1900,NULL,NULL,NULL),(216,27,9,0.1900,NULL,NULL,NULL),(217,28,1,0.3900,NULL,3.4500,NULL),(218,28,2,0.2700,NULL,1.8000,NULL),(219,28,3,0.2400,NULL,1.3000,NULL),(220,28,4,0.2200,NULL,1.0500,NULL),(221,28,5,0.2100,NULL,0.8500,NULL),(222,28,6,0.2000,NULL,0.7900,NULL),(223,28,7,0.1900,NULL,0.7500,NULL),(224,28,8,0.1900,NULL,0.7400,NULL),(225,28,9,0.1900,NULL,0.7200,NULL),(226,29,1,0.3900,NULL,NULL,NULL),(227,29,2,0.2700,NULL,NULL,NULL),(228,29,3,0.2400,NULL,NULL,NULL),(229,29,4,0.2200,NULL,NULL,NULL),(230,29,5,0.2100,NULL,NULL,NULL),(231,29,6,0.2000,NULL,NULL,NULL),(232,29,7,0.1900,NULL,NULL,NULL),(233,29,8,0.1900,NULL,NULL,NULL),(234,29,9,0.1900,NULL,NULL,NULL),(235,30,15,NULL,NULL,NULL,NULL),(236,30,16,NULL,NULL,NULL,NULL),(237,30,1,NULL,NULL,NULL,NULL),(238,30,2,NULL,NULL,NULL,NULL),(239,30,3,NULL,NULL,NULL,NULL),(240,30,4,NULL,NULL,NULL,NULL),(241,31,1,NULL,NULL,NULL,NULL),(242,31,2,0.2200,NULL,NULL,NULL),(243,31,3,0.2000,NULL,NULL,NULL),(244,31,4,0.1800,NULL,NULL,NULL),(245,31,5,0.1700,NULL,NULL,NULL),(246,31,6,0.1500,NULL,NULL,NULL),(247,31,7,0.1400,NULL,NULL,NULL),(248,31,8,0.1300,NULL,NULL,NULL),(249,31,9,0.1200,NULL,NULL,NULL),(250,32,15,NULL,NULL,NULL,NULL),(251,32,16,NULL,NULL,NULL,NULL),(252,32,1,NULL,NULL,NULL,NULL),(253,32,2,NULL,NULL,NULL,NULL),(254,32,3,NULL,NULL,NULL,NULL),(255,32,4,NULL,NULL,NULL,NULL),(256,33,1,NULL,NULL,NULL,NULL),(257,33,2,0.2200,NULL,NULL,NULL),(258,33,3,0.2000,NULL,NULL,NULL),(259,33,4,0.1800,NULL,NULL,NULL),(260,33,5,0.1700,NULL,NULL,NULL),(261,33,6,0.1500,NULL,NULL,NULL),(262,33,7,0.1400,NULL,NULL,NULL),(263,33,8,0.1300,NULL,NULL,NULL),(264,33,9,0.1200,NULL,NULL,NULL),(266,34,16,NULL,0.4400,NULL,0.1000),(267,34,1,NULL,0.4000,NULL,0.1000),(268,34,2,NULL,0.3600,NULL,0.1000),(269,34,3,NULL,0.3200,NULL,0.1000),(270,34,4,NULL,0.3000,NULL,0.1000),(271,34,5,NULL,0.2800,NULL,0.1000),(273,35,1,NULL,NULL,NULL,NULL),(274,35,2,NULL,NULL,NULL,NULL),(275,35,3,0.2200,NULL,NULL,NULL),(276,35,4,0.2000,NULL,NULL,NULL),(277,35,5,0.1800,NULL,NULL,NULL),(278,35,6,0.1600,NULL,NULL,NULL),(279,35,7,0.1400,NULL,NULL,NULL),(280,35,8,0.1300,NULL,NULL,NULL),(281,35,9,0.1300,NULL,NULL,NULL),(288,36,15,NULL,NULL,NULL,NULL),(289,36,16,NULL,NULL,NULL,NULL),(290,36,1,NULL,NULL,NULL,NULL),(291,36,2,NULL,NULL,NULL,NULL),(292,36,3,NULL,NULL,NULL,NULL),(293,36,4,NULL,NULL,NULL,NULL),(295,37,1,NULL,NULL,NULL,NULL),(296,37,2,0.2200,NULL,NULL,NULL),(297,37,3,0.2000,NULL,NULL,NULL),(298,37,4,0.1800,NULL,NULL,NULL),(299,37,5,0.1700,NULL,NULL,NULL),(300,37,6,0.1500,NULL,NULL,NULL),(301,37,7,0.1400,NULL,NULL,NULL),(302,37,8,0.1300,NULL,NULL,NULL),(303,37,9,0.1200,NULL,NULL,NULL),(310,38,15,NULL,NULL,NULL,NULL),(311,38,16,NULL,NULL,NULL,NULL),(312,38,1,NULL,NULL,NULL,NULL),(313,38,2,NULL,NULL,NULL,NULL),(314,38,3,NULL,NULL,NULL,NULL),(315,38,4,NULL,NULL,NULL,NULL),(317,39,1,NULL,NULL,NULL,NULL),(318,39,2,0.2200,NULL,NULL,NULL),(319,39,3,0.2000,NULL,NULL,NULL),(320,39,4,0.1800,NULL,NULL,NULL),(321,39,5,0.1700,NULL,NULL,NULL),(322,39,6,0.1500,NULL,NULL,NULL),(323,39,7,0.1400,NULL,NULL,NULL),(324,39,8,0.1300,NULL,NULL,NULL),(325,39,9,0.1200,NULL,NULL,NULL),(326,40,5,0.0180,NULL,NULL,NULL),(327,40,6,0.0170,NULL,NULL,NULL),(328,40,7,0.0160,NULL,NULL,NULL),(329,40,8,0.0140,NULL,NULL,NULL),(330,40,9,0.0120,NULL,NULL,NULL),(331,40,10,0.0120,NULL,NULL,NULL),(332,40,11,0.0100,NULL,NULL,NULL),(333,40,12,0.0080,NULL,NULL,NULL),(334,40,13,0.0080,NULL,NULL,NULL),(335,40,14,0.0070,NULL,NULL,NULL),(341,41,15,NULL,NULL,NULL,NULL),(342,41,16,NULL,NULL,NULL,NULL),(343,41,1,NULL,NULL,NULL,NULL),(344,41,2,NULL,NULL,NULL,NULL),(345,41,3,NULL,NULL,NULL,NULL),(346,41,4,NULL,NULL,NULL,NULL),(347,42,1,NULL,NULL,NULL,NULL),(348,42,2,0.2200,NULL,NULL,NULL),(349,42,3,0.2000,NULL,NULL,NULL),(350,42,4,0.1800,NULL,NULL,NULL),(351,42,5,0.1700,NULL,NULL,NULL),(352,42,6,0.1500,NULL,NULL,NULL),(353,42,7,0.1400,NULL,NULL,NULL),(354,42,8,0.1300,NULL,NULL,NULL),(355,42,9,0.1200,NULL,NULL,NULL),(362,43,15,NULL,NULL,NULL,NULL),(363,43,16,NULL,NULL,NULL,NULL),(364,43,1,NULL,NULL,NULL,NULL),(365,43,2,NULL,NULL,NULL,NULL),(366,43,3,NULL,NULL,NULL,NULL),(367,43,4,NULL,NULL,NULL,NULL),(369,44,1,NULL,NULL,NULL,NULL),(370,44,2,0.3000,NULL,NULL,NULL),(371,44,3,0.2800,NULL,NULL,NULL),(372,44,4,0.2600,NULL,NULL,NULL),(373,44,5,0.2400,NULL,NULL,NULL),(374,44,6,0.2200,NULL,NULL,NULL),(375,44,7,0.2100,NULL,NULL,NULL),(376,44,8,0.2000,NULL,NULL,NULL),(377,44,9,0.1900,NULL,NULL,NULL),(384,45,15,NULL,NULL,NULL,NULL),(385,45,16,NULL,NULL,NULL,NULL),(386,45,1,NULL,NULL,NULL,NULL),(387,45,2,NULL,NULL,NULL,NULL),(388,45,3,NULL,NULL,NULL,NULL),(389,45,4,NULL,NULL,NULL,NULL),(391,46,1,NULL,NULL,NULL,NULL),(392,46,2,NULL,NULL,NULL,NULL),(393,46,3,NULL,NULL,NULL,NULL),(394,46,4,NULL,NULL,NULL,NULL),(395,46,5,NULL,NULL,NULL,NULL),(396,46,6,NULL,NULL,NULL,NULL),(397,46,7,NULL,NULL,NULL,NULL),(398,46,8,NULL,NULL,NULL,NULL),(399,46,9,NULL,NULL,NULL,NULL),(406,47,17,NULL,NULL,NULL,NULL),(407,47,18,NULL,NULL,NULL,NULL),(408,47,19,NULL,NULL,NULL,NULL),(409,47,20,NULL,NULL,NULL,NULL),(410,47,21,NULL,NULL,NULL,NULL),(411,47,22,NULL,NULL,NULL,NULL),(413,48,15,NULL,NULL,NULL,NULL),(414,48,16,NULL,NULL,NULL,NULL),(415,48,1,NULL,NULL,NULL,NULL),(416,48,2,NULL,NULL,NULL,NULL),(417,48,3,NULL,NULL,NULL,NULL),(418,48,4,NULL,NULL,NULL,NULL),(420,49,1,NULL,NULL,NULL,NULL),(421,49,2,0.2200,NULL,NULL,NULL),(422,49,3,0.2000,NULL,NULL,NULL),(423,49,4,0.1800,NULL,NULL,NULL),(424,49,5,0.1700,NULL,NULL,NULL),(425,49,6,0.1500,NULL,NULL,NULL),(426,49,7,0.1400,NULL,NULL,NULL),(427,49,8,0.1300,NULL,NULL,NULL),(428,49,9,0.1200,NULL,NULL,NULL),(435,50,7,0.0160,NULL,NULL,NULL),(436,50,8,0.0140,NULL,NULL,NULL),(437,50,9,0.0120,NULL,NULL,NULL),(438,50,10,0.0120,NULL,NULL,NULL),(439,50,11,0.0100,NULL,NULL,NULL),(440,50,12,0.0080,NULL,NULL,NULL),(441,50,13,0.0080,NULL,NULL,NULL),(442,50,14,0.0070,NULL,NULL,NULL),(450,51,15,NULL,NULL,NULL,NULL),(451,51,16,NULL,NULL,NULL,NULL),(452,51,1,NULL,NULL,NULL,NULL),(453,51,2,NULL,NULL,NULL,NULL),(454,51,3,NULL,NULL,NULL,NULL),(455,51,4,NULL,NULL,NULL,NULL),(457,52,1,NULL,NULL,NULL,NULL),(458,52,2,0.2200,NULL,NULL,NULL),(459,52,3,0.2000,NULL,NULL,NULL),(460,52,4,0.1800,NULL,NULL,NULL),(461,52,5,0.1700,NULL,NULL,NULL),(462,52,6,0.1500,NULL,NULL,NULL),(463,52,7,0.1400,NULL,NULL,NULL),(464,52,8,0.1300,NULL,NULL,NULL),(465,52,9,0.1200,NULL,NULL,NULL),(472,53,7,0.0160,NULL,NULL,NULL),(473,53,8,0.0140,NULL,NULL,NULL),(474,53,9,0.0120,NULL,NULL,NULL),(475,53,10,0.0120,NULL,NULL,NULL),(476,53,11,0.0100,NULL,NULL,NULL),(477,53,12,0.0080,NULL,NULL,NULL),(478,53,13,0.0080,NULL,NULL,NULL),(479,53,14,0.0070,NULL,NULL,NULL),(487,54,15,NULL,NULL,NULL,NULL),(488,54,16,NULL,NULL,NULL,NULL),(489,54,1,NULL,NULL,NULL,NULL),(490,54,2,NULL,NULL,NULL,NULL),(491,54,3,NULL,NULL,NULL,NULL),(492,54,4,NULL,NULL,NULL,NULL),(494,55,16,NULL,NULL,NULL,NULL),(495,55,1,NULL,NULL,NULL,NULL),(496,55,2,0.3000,NULL,NULL,NULL),(497,55,3,0.2800,NULL,NULL,NULL),(498,55,4,0.2600,NULL,NULL,NULL),(499,55,5,0.2400,NULL,NULL,NULL),(500,55,6,0.2200,NULL,NULL,NULL),(501,55,7,0.2100,NULL,NULL,NULL),(509,56,15,NULL,NULL,NULL,NULL),(510,56,16,NULL,NULL,NULL,NULL),(511,56,1,NULL,NULL,NULL,NULL),(512,56,2,NULL,NULL,NULL,NULL),(513,56,3,NULL,NULL,NULL,NULL),(514,56,4,NULL,NULL,NULL,NULL),(516,57,16,NULL,NULL,NULL,NULL),(517,57,1,NULL,NULL,NULL,NULL),(518,57,2,0.3000,NULL,NULL,NULL),(519,57,3,0.2800,NULL,NULL,NULL),(520,57,4,0.2600,NULL,NULL,NULL),(521,57,5,0.2400,NULL,NULL,NULL),(522,57,6,0.2200,NULL,NULL,NULL),(523,57,7,0.2100,NULL,NULL,NULL),(531,58,15,NULL,NULL,NULL,NULL),(532,58,16,NULL,NULL,NULL,NULL),(533,58,1,NULL,NULL,NULL,NULL),(534,58,2,NULL,NULL,NULL,NULL),(535,58,3,NULL,NULL,NULL,NULL),(536,58,4,NULL,NULL,NULL,NULL),(537,59,16,NULL,NULL,NULL,NULL),(538,59,1,NULL,NULL,NULL,NULL),(539,59,2,0.3000,NULL,NULL,NULL),(540,59,3,0.2800,NULL,NULL,NULL),(541,59,4,0.2600,NULL,NULL,NULL),(542,59,5,0.2400,NULL,NULL,NULL),(543,59,6,0.2200,NULL,NULL,NULL),(544,59,7,0.2100,NULL,NULL,NULL),(545,60,16,NULL,NULL,NULL,NULL),(546,60,1,NULL,NULL,NULL,NULL),(547,60,2,0.3000,NULL,NULL,NULL),(548,60,3,0.2800,NULL,NULL,NULL),(549,60,4,0.2600,NULL,NULL,NULL),(550,60,5,0.2400,NULL,NULL,NULL),(551,60,6,0.2200,NULL,NULL,NULL),(552,60,7,0.2100,NULL,NULL,NULL),(562,61,15,NULL,NULL,NULL,NULL),(563,61,16,NULL,NULL,NULL,NULL),(564,61,1,NULL,NULL,NULL,NULL),(565,61,2,NULL,NULL,NULL,NULL),(566,61,3,NULL,NULL,NULL,NULL),(567,61,4,NULL,NULL,NULL,NULL),(568,62,1,NULL,NULL,NULL,NULL),(569,62,2,0.3000,NULL,NULL,NULL),(570,62,3,0.2600,NULL,NULL,NULL),(571,62,4,0.2400,NULL,NULL,NULL),(572,62,5,0.2200,NULL,NULL,NULL),(573,62,6,0.1900,NULL,NULL,NULL),(574,62,7,0.1700,NULL,NULL,NULL),(575,62,8,0.1500,NULL,NULL,NULL),(576,62,9,0.1500,NULL,NULL,NULL),(577,63,15,NULL,NULL,NULL,NULL),(578,63,16,NULL,NULL,NULL,NULL),(579,63,1,NULL,NULL,NULL,NULL),(580,63,2,NULL,NULL,NULL,NULL),(581,63,3,NULL,NULL,NULL,NULL),(582,63,4,NULL,NULL,NULL,NULL),(583,64,1,NULL,NULL,NULL,NULL),(584,64,2,0.3000,NULL,NULL,NULL),(585,64,3,0.2600,NULL,NULL,NULL),(586,64,4,0.2400,NULL,NULL,NULL),(587,64,5,0.2200,NULL,NULL,NULL),(588,64,6,0.1900,NULL,NULL,NULL),(589,64,7,0.1700,NULL,NULL,NULL),(590,64,8,0.1500,NULL,NULL,NULL),(591,64,9,0.1500,NULL,NULL,NULL),(592,65,5,0.0180,NULL,NULL,NULL),(593,65,6,0.0170,NULL,NULL,NULL),(594,65,7,0.0160,NULL,NULL,NULL),(595,65,8,0.0140,NULL,NULL,NULL),(596,65,9,0.0120,NULL,NULL,NULL),(597,65,10,0.0120,NULL,NULL,NULL),(598,65,11,0.0100,NULL,NULL,NULL),(599,65,12,0.0080,NULL,NULL,NULL),(600,65,13,0.0080,NULL,NULL,NULL),(601,65,14,0.0070,NULL,NULL,NULL),(602,66,15,NULL,NULL,NULL,NULL),(603,66,16,NULL,NULL,NULL,NULL),(604,66,1,NULL,NULL,NULL,NULL),(605,66,2,NULL,NULL,NULL,NULL),(606,66,3,NULL,NULL,NULL,NULL),(607,66,4,NULL,NULL,NULL,NULL),(608,67,1,NULL,NULL,NULL,NULL),(609,67,2,0.2200,NULL,NULL,NULL),(610,67,3,0.2000,NULL,NULL,NULL),(611,67,4,0.1800,NULL,NULL,NULL),(612,67,5,0.1700,NULL,NULL,NULL),(613,67,6,0.1500,NULL,NULL,NULL),(614,67,7,0.1400,NULL,NULL,NULL),(615,67,8,0.1300,NULL,NULL,NULL),(616,67,9,0.1200,NULL,NULL,NULL),(617,68,7,0.0160,NULL,NULL,NULL),(618,68,8,0.0140,NULL,NULL,NULL),(619,68,9,0.0120,NULL,NULL,NULL),(620,68,10,0.0120,NULL,NULL,NULL),(621,68,11,0.0100,NULL,NULL,NULL),(622,68,12,0.0080,NULL,NULL,NULL),(623,68,13,0.0080,NULL,NULL,NULL),(624,68,14,0.0070,NULL,NULL,NULL),(625,69,15,NULL,NULL,NULL,NULL),(626,69,16,NULL,NULL,NULL,NULL),(627,69,1,NULL,NULL,NULL,NULL),(628,69,2,NULL,NULL,NULL,NULL),(629,69,3,NULL,NULL,NULL,NULL),(630,69,4,NULL,NULL,NULL,NULL),(631,70,1,NULL,NULL,NULL,NULL),(632,70,2,0.2200,NULL,NULL,NULL),(633,70,3,0.2000,NULL,NULL,NULL),(634,70,4,0.1800,NULL,NULL,NULL),(635,70,5,0.1700,NULL,NULL,NULL),(636,70,6,0.1500,NULL,NULL,NULL),(637,70,7,0.1400,NULL,NULL,NULL),(638,70,8,0.1300,NULL,NULL,NULL),(639,70,9,0.1200,NULL,NULL,NULL),(640,71,7,0.0160,NULL,NULL,NULL),(641,71,8,0.0140,NULL,NULL,NULL),(642,71,9,0.0120,NULL,NULL,NULL),(643,71,10,0.0120,NULL,NULL,NULL),(644,71,11,0.0100,NULL,NULL,NULL),(645,71,12,0.0080,NULL,NULL,NULL),(646,71,13,0.0080,NULL,NULL,NULL),(647,71,14,0.0070,NULL,NULL,NULL),(648,72,15,NULL,NULL,NULL,NULL),(649,72,16,NULL,NULL,NULL,NULL),(650,72,1,NULL,NULL,NULL,NULL),(651,72,2,NULL,NULL,NULL,NULL),(652,72,3,NULL,NULL,NULL,NULL),(653,72,4,NULL,NULL,NULL,NULL),(654,73,1,NULL,NULL,NULL,NULL),(655,73,2,0.2200,NULL,NULL,NULL),(656,73,3,0.2000,NULL,NULL,NULL),(657,73,4,0.1800,NULL,NULL,NULL),(658,73,5,0.1700,NULL,NULL,NULL),(659,73,6,0.1500,NULL,NULL,NULL),(660,73,7,0.1400,NULL,NULL,NULL),(661,73,8,0.1300,NULL,NULL,NULL),(662,73,9,0.1200,NULL,NULL,NULL),(663,74,7,0.0160,NULL,NULL,NULL),(664,74,8,0.0140,NULL,NULL,NULL),(665,74,9,0.0120,NULL,NULL,NULL),(666,74,10,0.0120,NULL,NULL,NULL),(667,74,11,0.0100,NULL,NULL,NULL),(668,74,12,0.0080,NULL,NULL,NULL),(669,74,13,0.0080,NULL,NULL,NULL),(670,74,14,0.0070,NULL,NULL,NULL),(671,75,15,NULL,NULL,NULL,NULL),(672,75,16,NULL,NULL,NULL,NULL),(673,75,1,NULL,NULL,NULL,NULL),(674,75,2,NULL,NULL,NULL,NULL),(675,75,3,NULL,NULL,NULL,NULL),(676,75,4,NULL,NULL,NULL,NULL),(677,76,1,NULL,NULL,NULL,NULL),(678,76,2,NULL,NULL,NULL,NULL),(679,76,3,NULL,NULL,NULL,NULL),(680,76,4,NULL,NULL,NULL,NULL),(681,76,5,NULL,NULL,NULL,NULL),(682,76,6,NULL,NULL,NULL,NULL),(683,76,7,NULL,NULL,NULL,NULL),(684,76,8,NULL,NULL,NULL,NULL),(685,76,9,NULL,NULL,NULL,NULL),(686,77,7,0.0160,NULL,NULL,NULL),(687,77,8,0.0140,NULL,NULL,NULL),(688,77,9,0.0120,NULL,NULL,NULL),(689,77,10,0.0120,NULL,NULL,NULL),(690,77,11,0.0100,NULL,NULL,NULL),(691,77,12,0.0080,NULL,NULL,NULL),(692,77,13,0.0080,NULL,NULL,NULL),(693,77,14,0.0070,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subcategoriesmethodsquantities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoriesmethodsstamping`
--

DROP TABLE IF EXISTS subcategoriesmethodsimprinttypes;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategoriesmethodsstamping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK.',
  `subcat_method_id` int(10) unsigned NOT NULL COMMENT 'Foreign key for of the Subcategory/Method in question.',
  `stamping_id` int(10) unsigned NOT NULL COMMENT 'The id of the Stamping table row that can be associated with that Subcategory/Method.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoriesmethodsstamping`
--

LOCK TABLES subcategoriesmethodsimprinttypes WRITE;
/*!40000 ALTER TABLE subcategoriesmethodsimprinttypes DISABLE KEYS */;
INSERT INTO subcategoriesmethodsimprinttypes VALUES (1,1,1),(2,1,2),(3,1,3),(4,3,1),(5,3,2),(6,3,3),(7,6,1),(8,6,2),(9,6,3),(10,9,1),(11,9,2),(12,9,3),(13,12,1),(14,12,2),(15,12,3),(16,13,1),(17,13,2),(18,13,3),(19,14,1),(20,14,2),(21,14,3),(22,15,1),(23,15,2),(24,16,1),(25,16,2),(26,17,1),(27,17,2),(28,18,1),(29,18,2),(30,34,1),(31,35,1);
/*!40000 ALTER TABLE subcategoriesmethodsimprinttypes ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'acs2017'
--
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Category_GetTextNotes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Category_GetTextNotes`(
	IN p_cat_name VARCHAR(45),
    IN p_active VARCHAR(10)
)
BEGIN
    
	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

    SELECT text_notes
		FROM Product_Categories
        WHERE short_name = p_cat_name
			AND active IN (1, @active);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_CatSubcat_BreakApart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_CatSubcat_BreakApart`(
	IN p_cat_subcat VARCHAR(256),
    OUT cat VARCHAR(45),
    OUT subcat VARCHAR(45)
)
BEGIN

	SET @cat = SUBSTRING_INDEX(p_cat_subcat, '-', 1);
	SET @first_hyphen = LOCATE('-', p_cat_subcat);
	SET @subcat = SUBSTR(p_cat_subcat, @first_hyphen + 1);

	SELECT @cat INTO cat;
	SELECT @subcat INTO subcat;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Clipart_GetInfoFromShortName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Clipart_GetInfoFromShortName`(
	IN p_name VARCHAR(45)
)
BEGIN

	SELECT s.long_name, c.short_name AS category
		FROM Clipart_Subcategories AS s
			JOIN Clipart_Categories AS c
			ON s.cat_id = c.id
		WHERE s.short_name = p_name
        LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Colors_GetColorsOfType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Colors_GetColorsOfType`(
	IN p_color_types VARCHAR(1024),
    IN p_active VARCHAR(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	SET @sql = CONCAT(
		'SELECT c.short_name AS color_short_name, c.long_name AS color_long_name, c.hex, t.long_name AS type_name 
			FROM Colors AS c
            JOIN Color_Types AS t
            ON t.id = c.color_type 
            WHERE c.color_type IN ( 
				SELECT id FROM Color_Types WHERE short_name IN (', p_color_types, ')
			) AND t.active IN (1, ', @active, ')
            AND c.active IN (1, ', @active, ');');
    PREPARE stmt FROM @sql;
	EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Feature_GetList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Feature_GetList`(
	IN p_cat_name VARCHAR(45),
	IN p_subcat_name VARCHAR(45),
	IN p_method_name VARCHAR(45),
    IN p_active VARCHAR(10)
)
BEGIN

	CALL ACS_SubcategoryMethod_GetIdFromName(
		p_cat_name,
		p_subcat_name,
		p_method_name,
        p_active,
		@p_subcatmethod_id
	);

	SELECT f.id, f.feature, j.parent_id
		FROM Features AS f
		LEFT JOIN FeaturesJoining AS j
		ON f.id = j.feature_id
		WHERE f.id IN (
			SELECT feature_id
				FROM SubcategoriesMethodsFeatures
				WHERE subcategorymethod_id = @p_subcatmethod_id
		)
		ORDER BY f.priority DESC;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Methods_GetShortName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Methods_GetShortName`(
	IN method_name VARCHAR(256),
    IN p_active VARCHAR(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	SELECT short_description
		FROM Print_Methods
        WHERE short_name = method_name
			AND active IN (1, @active)
        LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Method_GetNames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Method_GetNames`(
	IN method_name VARCHAR(256),
    IN p_active VARCHAR(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	SELECT long_name, short_description
		FROM Print_Methods
        WHERE short_name = method_name
			AND active IN (1, @active)
        LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Prices_GetQuantitiesAndPrices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Prices_GetQuantitiesAndPrices`(
	IN sm_id INT(10),
    IN p_id INT(10)
)
BEGIN

	SELECT q.quantity, p.price
		FROM SMQPrices AS p
		JOIN Quantity_Breaks AS q
		ON q.id = p.quantity_id
		WHERE p.product_id = p_id
			AND p.smq_id IN (
				SELECT s.id FROM SubcategoriesMethodsQuantities AS s WHERE s.subcat_method_id = sm_id
			);
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Products_GetColorsForProductsInSubcategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Products_GetColorsForProductsInSubcategory`(
	IN p_cat_name VARCHAR(45),
	IN p_subcat_name VARCHAR(45),
    IN p_active VARCHAR(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	CALL ACS_Subcategory_GetId(
		p_cat_name,
		p_subcat_name,
        p_active,
		@subcat_id
	);

	SELECT p.id, p.item_num, c.short_name, c.long_name, c.pantone, c.hex
		FROM Products AS p
		JOIN ProductsColors AS j
		ON p.id = j.product_id
		AND j.product_id IN (
			SELECT id FROM Products WHERE subcategory_id = @subcat_id AND active IN (1, @active)
		)
		JOIN Colors AS c
		ON j.color_id = c.id
        AND c.active IN (1, @active);
            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Products_GetProductsFromFullName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Products_GetProductsFromFullName`(
	IN p_category VARCHAR(45),
    IN p_subcategory VARCHAR(45),
    IN p_method VARCHAR(45),
    IN p_active VARCHAR(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	SELECT id, prefix
		INTO @method_id, @prefix
		FROM Print_Methods
		WHERE short_name = p_method
			AND active IN (1, @active)
		LIMIT 1;
		
	SELECT id
		INTO @cat_id
		FROM Product_Categories
		WHERE short_name = p_category
			AND active IN (1, @active)
		LIMIT 1;

	SELECT id
		INTO @subcat_id
		FROM Product_Subcategories
		WHERE short_name = p_subcategory
			AND category_id = @cat_id
            AND active IN (1, @active)
		LIMIT 1;
		
	SELECT id, coupon_id
		INTO @sm_id, @coupon_id
		FROM SubcategoriesMethods
		WHERE subcategory_id = @subcat_id
			AND method_id = @method_id
            AND active IN (1, @active)
		LIMIT 1;
		
	SELECT code
		INTO @coupon_code
		FROM Coupon_Codes
		WHERE id = @coupon_id
		LIMIT 1;

    SELECT id AS product_id, CONCAT(@prefix, item_num) AS product_name, description, @coupon_code AS coupon_code, @sm_id AS sm_id
		FROM Products
        WHERE id IN (
			SELECT product_id FROM ProductsMethods WHERE method_id = @method_id AND product_id IN (
						SELECT id FROM Products WHERE subcategory_id = @subcat_id AND active IN (1, @active)
					) AND active IN (1, @active)
			);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Stamping_GetStampTypesForSubcatMethod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Stamping_GetStampTypesForSubcatMethod`(
	IN p_cat_name VARCHAR(45),
	IN p_subcat_name VARCHAR(45),
	IN p_method_name VARCHAR(45),
    IN p_active VARCHAR(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	CALL ACS_SubcategoryMethod_GetIdFromName(
		p_cat_name,
		p_subcat_name,
		p_method_name,
        p_active,
        @p_subcatmethod_id
    );

	SELECT *
		FROM imprint_types
		WHERE id IN (
			SELECT imprint_type_id FROM subcategoriesmethodsimprinttypes WHERE subcat_method_id = @p_subcatmethod_id
        )
        AND active IN (1, @active);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_SubcategoryMethod_BreakApart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_SubcategoryMethod_BreakApart`(
	IN complete_name VARCHAR(256),
    OUT cat VARCHAR(45),
    OUT subcat VARCHAR(45),
    OUT method VARCHAR(45))
BEGIN

	SET @cat = SUBSTRING_INDEX(complete_name, '-', 1);
	SET @method = SUBSTRING_INDEX(complete_name, '-', -1);
	SET @first_hyphen = LOCATE('-', complete_name);
	SET @last_hyphen = LENGTH(complete_name) - LENGTH(@method);
	SET @len = (@last_hyphen - 1) - (LENGTH(@cat) + 1);
	SET @subcat = SUBSTR(complete_name, @first_hyphen + 1, @len);

	SELECT @cat INTO cat;
	SELECT @subcat INTO subcat;
	SELECT @method INTO method;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_SubcategoryMethod_GetIdFromName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_SubcategoryMethod_GetIdFromName`(
	IN p_cat_name VARCHAR(45),
	IN p_subcat_name VARCHAR(45),
	IN p_method_name VARCHAR(45),
    IN p_active VARCHAR(10),
    OUT p_subcatmethod_id INT UNSIGNED
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	SELECT id FROM SubcategoriesMethods WHERE subcategory_id = (
		SELECT id FROM Product_Subcategories WHERE short_name = p_subcat_name AND active IN (1, @active) AND category_id = (
			SELECT id FROM Product_Categories WHERE short_name = p_cat_name AND active IN (1, @active) LIMIT 1
		) LIMIT 1
	) AND method_id = (
		SELECT id FROM Print_Methods WHERE short_name = p_method_name AND active IN (1, @active) LIMIT 1
	) AND active IN (1, @active)
    LIMIT 1
    INTO p_subcatmethod_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Subcategory_GetFullName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Subcategory_GetFullName`(
	IN p_cat_name VARCHAR(45),
	IN p_subcat_name VARCHAR(45),
    IN p_active VARCHAR(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	SELECT long_name FROM Product_Subcategories WHERE short_name = p_subcat_name AND active IN (1, @active) AND category_id = (
		SELECT id FROM Product_Categories WHERE short_name = p_cat_name AND active IN (1, @active) LIMIT 1
	) LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Subcategory_GetId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Subcategory_GetId`(
	IN p_cat_name VARCHAR(45),
	IN p_subcat_name VARCHAR(45),
    IN p_active VARCHAR(10),
    OUT subcat_id INT(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	SELECT id INTO subcat_id
		FROM Product_Subcategories
		WHERE short_name = p_subcat_name AND active IN (1, @active) AND category_id = (
			SELECT id FROM Product_Categories WHERE short_name = p_cat_name AND active IN (1, @active) LIMIT 1
		) LIMIT 1;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACS_Subcategory_GetMethods` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`skyweb`@`localhost` PROCEDURE `ACS_Subcategory_GetMethods`(
	IN p_cat_name VARCHAR(45),
	IN p_subcat_name VARCHAR(45),
    IN p_active VARCHAR(10)
)
BEGIN

	SET @active = IF(STRCMP(p_active,'true'), 1, 0);

	SELECT *
		FROM Print_Methods
		WHERE id IN (
			SELECT method_id FROM SubcategoriesMethods WHERE subcategory_id = (
				SELECT id FROM Product_Subcategories WHERE short_name = p_subcat_name AND active IN (1, @active) AND category_id = (
					SELECT id FROM Product_Categories WHERE short_name = p_cat_name AND active IN (1, @active) LIMIT 1
				) LIMIT 1
			) AND active IN (1, @active)
		)
        AND active IN (1, @active);

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

-- Dump completed on 2017-05-10 16:27:36
