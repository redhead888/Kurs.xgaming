-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (3,'ш. Петербургское, 76 корпус 5, Тверь, Тверская обл.'),(4,'Тверской просп., 8, Тверь, Тверская обл.'),(5,'ул. Спартака, 26А, Тверь, Тверская обл.');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Александр Иванов ','+7 123-456-7890'),(2,'Екатерина Смирнова ','+7 987-654-3210'),(3,'Максим Кузнецов','+7 555-123-4567'),(4,'Анна Петрова','+7 321-789-4560'),(5,'Дмитрий Соколов ','+7 888-999-7777'),(6,'Ольга Новикова ','+7 234-567-8901'),(7,'Алексей Козлов ','+7 987-654-3210'),(8,'Мария Морозова ','+7 555-444-3333'),(9,'Иван Федоров','+7 321-654-9870'),(10,'Елена Волкова ','+7 777-888-9999'),(11,'Джорно Джовано','8 800 555 3535');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_orders`
--

DROP TABLE IF EXISTS `client_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(45) NOT NULL,
  `product` varchar(45) NOT NULL,
  `purchased_quantity` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `games_id` varchar(45) DEFAULT '0',
  `consoles_id` varchar(45) DEFAULT '0',
  `client_id` int NOT NULL,
  `staff_ids` int NOT NULL,
  `staff_address_id` int NOT NULL,
  PRIMARY KEY (`id`,`client_id`,`staff_ids`,`staff_address_id`),
  KEY `fk_client_orders_consoles1_idx` (`consoles_id`),
  KEY `fk_client_orders_client1_idx` (`client_id`),
  KEY `fk_client_orders_games1_idx` (`games_id`),
  KEY `fk_client_orders_stuff1_idx` (`staff_ids`,`staff_address_id`),
  CONSTRAINT `fk_client_orders_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_client_orders_stuff1` FOREIGN KEY (`staff_ids`, `staff_address_id`) REFERENCES `staff` (`ids`, `address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_orders`
--

LOCK TABLES `client_orders` WRITE;
/*!40000 ALTER TABLE `client_orders` DISABLE KEYS */;
INSERT INTO `client_orders` VALUES (2,'2023-05-15','xbox','1','15000','','3',1,1,5);
/*!40000 ALTER TABLE `client_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consoles`
--

DROP TABLE IF EXISTS `consoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consoles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consoles`
--

LOCK TABLES `consoles` WRITE;
/*!40000 ALTER TABLE `consoles` DISABLE KEYS */;
INSERT INTO `consoles` VALUES (1,'Playstation 4 pro','7','22 000'),(2,'Playstation 5','12','55 000'),(3,'Xbox Series X','10','46 000'),(4,'Xbox Series S','16','33 000'),(5,'Nintendo Switch','14','25 000');
/*!40000 ALTER TABLE `consoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (22,'The last of us ','PlayStation 4','14','1800'),(25,'The last of us 2 ','PlayStation 5','11','3400'),(26,'Devil May Cry 5 ','PlayStation 4','6','1500'),(29,'Затерянный мир','PlayStation 4','5','1000'),(31,'Стальной герой','Xbox One','8','1000'),(32,'Магические истории','Nintendo Switch','3','1000'),(33,'Последний страж','PlayStation 5','7','1000'),(34,'Фантастический мир','Xbox Series X','4','1000'),(35,'Космические путешествия','Nintendo Switch','6','1000'),(36,'Темные коридоры','PlayStation 4','2','1000'),(37,'Звездный путь','Xbox One','9','1000'),(38,'Легенда о войне','Nintendo Switch','3','1000'),(39,'Великое приключение','PlayStation 5','6','1000'),(40,'Загадочный остров','Xbox Series X','5','1000'),(41,'Мир фэнтези','PlayStation 4','7','1000'),(42,'Охотники за сокровищами','Xbox One','4','1000'),(43,'Путь самурая','Nintendo Switch','10','1000'),(44,'Тайны древнего храма','PlayStation 5','6','1000'),(45,'Битва воинов','Xbox Series X','3','1000'),(46,'God of War','PlayStation 4','10','2000'),(47,'God of War: Ragnarök','PlayStation 5','5','3000'),(48,'Call of Duty: Modern Warfare II','Xbox Series X','8','2000'),(49,'The Legend of Zelda: Tears of the Kingdom','Nintendo Switch','12','4000'),(50,'Mortal Kombat X','PlayStation 4','3','2000'),(51,'Not a game','Play Station 4','4','380');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `ids` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`ids`,`address_id`),
  KEY `fk_stuff_address_idx` (`address_id`),
  CONSTRAINT `fk_stuff_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Норбек Эбаев','89065545317',5),(2,'Кирилл Иванов','89961338013',4),(3,'Игорь Жестарёв','89043552797',3);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_total_consoles_in_stock`
--

DROP TABLE IF EXISTS `view_total_consoles_in_stock`;
/*!50001 DROP VIEW IF EXISTS `view_total_consoles_in_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_consoles_in_stock` AS SELECT 
 1 AS `Всего консолей`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_total_consoles_in_stock`
--

/*!50001 DROP VIEW IF EXISTS `view_total_consoles_in_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_consoles_in_stock` AS select sum(`consoles`.`quantity`) AS `Всего консолей` from `consoles` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-29 12:59:34
