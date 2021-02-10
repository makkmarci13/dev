-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: panel
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allocations`
--

DROP TABLE IF EXISTS `allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allocations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `node_id` int(10) unsigned NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_alias` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `server_id` int(10) unsigned DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `allocations_node_id_ip_port_unique` (`node_id`,`ip`,`port`),
  KEY `allocations_server_id_foreign` (`server_id`),
  CONSTRAINT `allocations_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `allocations_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocations`
--

LOCK TABLES `allocations` WRITE;
/*!40000 ALTER TABLE `allocations` DISABLE KEYS */;
INSERT INTO `allocations` VALUES (152,1,'127.0.0.1','localhost',2301,2,NULL,NULL,'2021-02-09 18:34:12'),(153,1,'127.0.0.1','localhost',2302,NULL,NULL,NULL,NULL),(154,1,'127.0.0.1','localhost',2303,NULL,NULL,NULL,NULL),(155,1,'127.0.0.1','localhost',2304,NULL,NULL,NULL,NULL),(156,1,'127.0.0.1','localhost',2305,NULL,NULL,NULL,NULL),(157,1,'127.0.0.1','localhost',2306,NULL,NULL,NULL,NULL),(158,1,'127.0.0.1','localhost',2307,NULL,NULL,NULL,NULL),(159,1,'127.0.0.1','localhost',2308,NULL,NULL,NULL,NULL),(160,1,'127.0.0.1','localhost',2309,NULL,NULL,NULL,NULL),(161,1,'127.0.0.1','localhost',2310,NULL,NULL,NULL,NULL),(162,1,'127.0.0.1','localhost',2311,NULL,NULL,NULL,NULL),(163,1,'127.0.0.1','localhost',2312,NULL,NULL,NULL,NULL),(164,1,'127.0.0.1','localhost',2313,NULL,NULL,NULL,NULL),(165,1,'127.0.0.1','localhost',2314,NULL,NULL,NULL,NULL),(166,1,'127.0.0.1','localhost',2315,NULL,NULL,NULL,NULL),(167,1,'127.0.0.1','localhost',2316,NULL,NULL,NULL,NULL),(168,1,'127.0.0.1','localhost',2317,NULL,NULL,NULL,NULL),(169,1,'127.0.0.1','localhost',2318,NULL,NULL,NULL,NULL),(170,1,'127.0.0.1','localhost',2319,NULL,NULL,NULL,NULL),(171,1,'127.0.0.1','localhost',2320,NULL,NULL,NULL,NULL),(172,1,'127.0.0.1','localhost',2321,NULL,NULL,NULL,NULL),(173,1,'127.0.0.1','localhost',2322,NULL,NULL,NULL,NULL),(174,1,'127.0.0.1','localhost',2323,NULL,NULL,NULL,NULL),(175,1,'127.0.0.1','localhost',2324,NULL,NULL,NULL,NULL),(176,1,'127.0.0.1','localhost',2325,NULL,NULL,NULL,NULL),(177,1,'127.0.0.1','localhost',2326,NULL,NULL,NULL,NULL),(178,1,'127.0.0.1','localhost',2327,NULL,NULL,NULL,NULL),(179,1,'127.0.0.1','localhost',2328,NULL,NULL,NULL,NULL),(180,1,'127.0.0.1','localhost',2329,NULL,NULL,NULL,NULL),(181,1,'127.0.0.1','localhost',2330,NULL,NULL,NULL,NULL),(182,1,'127.0.0.1','localhost',2331,NULL,NULL,NULL,NULL),(183,1,'127.0.0.1','localhost',2332,NULL,NULL,NULL,NULL),(184,1,'127.0.0.1','localhost',2333,NULL,NULL,NULL,NULL),(185,1,'127.0.0.1','localhost',2334,NULL,NULL,NULL,NULL),(186,1,'127.0.0.1','localhost',2335,NULL,NULL,NULL,NULL),(187,1,'127.0.0.1','localhost',2336,NULL,NULL,NULL,NULL),(188,1,'127.0.0.1','localhost',2337,NULL,NULL,NULL,NULL),(189,1,'127.0.0.1','localhost',2338,NULL,NULL,NULL,NULL),(190,1,'127.0.0.1','localhost',2339,NULL,NULL,NULL,NULL),(191,1,'127.0.0.1','localhost',2340,NULL,NULL,NULL,NULL),(192,1,'127.0.0.1','localhost',2341,NULL,NULL,NULL,NULL),(193,1,'127.0.0.1','localhost',2342,NULL,NULL,NULL,NULL),(194,1,'127.0.0.1','localhost',2343,NULL,NULL,NULL,NULL),(195,1,'127.0.0.1','localhost',2344,NULL,NULL,NULL,NULL),(196,1,'127.0.0.1','localhost',2345,NULL,NULL,NULL,NULL),(197,1,'127.0.0.1','localhost',2346,NULL,NULL,NULL,NULL),(198,1,'127.0.0.1','localhost',2347,NULL,NULL,NULL,NULL),(199,1,'127.0.0.1','localhost',2348,NULL,NULL,NULL,NULL),(200,1,'127.0.0.1','localhost',2349,NULL,NULL,NULL,NULL),(201,1,'127.0.0.1','localhost',2350,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'Dev Node','<p>Dev Node was added to Panel and Panel was released to the public.</p>','2021-02-09 19:41:06','2021-02-09 19:41:06'),(2,'Status Change','<p>If you make your status #Oreos4Life, Neko will gift you with 1GB extra ram!!!</p>','2021-02-09 19:42:04','2021-02-09 19:42:04');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `key_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `identifier` char(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_ips` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `r_servers` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_nodes` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_allocations` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_users` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_locations` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_nests` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_eggs` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_database_hosts` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_server_databases` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_keys_identifier_unique` (`identifier`),
  KEY `api_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES (2,1,2,'vtXg315DkdpVauWP','eyJpdiI6IlpCY0NyekxJV2VCRHZacnJ0SmtlYWc9PSIsInZhbHVlIjoiRzNjbXVRQWxod3JwbERmQVg2RnV5Q3pHOVB1bnhCL1AxK0tRNUhiZjVzMGlOWWUzMENvdWtQRlNKQTRIbDdIdSIsIm1hYyI6IjRkMGM3NTc0Yzc4NjRmMzllZjU5MDQyY2VmNWFhZTRiNjg3NjQ5YTEwMWY4ZmU2OWI1MzY4ZDYwNDlhYmM2MjkifQ==',NULL,'client',NULL,'2021-02-09 23:10:10','2021-02-09 23:10:10',3,3,3,3,3,3,3,3,3);
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_logs`
--

DROP TABLE IF EXISTS `api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorized` tinyint(1) NOT NULL,
  `error` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` char(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_logs`
--

LOCK TABLES `api_logs` WRITE;
/*!40000 ALTER TABLE `api_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_successful` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ignored_files` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bytes` bigint(20) unsigned NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_uuid_unique` (`uuid`),
  KEY `backups_server_id_foreign` (`server_id`),
  CONSTRAINT `backups_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_hosts`
--

DROP TABLE IF EXISTS `database_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `database_hosts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(10) unsigned NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_databases` int(10) unsigned DEFAULT NULL,
  `node_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `database_hosts_node_id_foreign` (`node_id`),
  CONSTRAINT `database_hosts_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_hosts`
--

LOCK TABLES `database_hosts` WRITE;
/*!40000 ALTER TABLE `database_hosts` DISABLE KEYS */;
INSERT INTO `database_hosts` VALUES (2,'Dev','127.0.0.1',3306,'pterodactyl','eyJpdiI6IjFWWU9TNjFZenNuQXVhSENudTlLbmc9PSIsInZhbHVlIjoiWFhSdUpYWFNISWI3M09zakdjQmFrcWdTTitlSHdKWWJOYk1Rc2s0YXJxRT0iLCJtYWMiOiIyYThlNGRhNDVhNGNiN2JjZmRjNzM0ZWJlM2QyNTEyMWI1M2JmNTcxYzE5ZmMyNWM3ZDg1NDllMWVkMmJmYzg0In0=',NULL,1,'2021-02-08 20:14:55','2021-02-08 20:14:55');
/*!40000 ALTER TABLE `database_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databases`
--

DROP TABLE IF EXISTS `databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `database_host_id` int(10) unsigned NOT NULL,
  `database` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remote` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '%',
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_connections` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `databases_database_host_id_username_unique` (`database_host_id`,`username`),
  UNIQUE KEY `databases_database_host_id_server_id_database_unique` (`database_host_id`,`server_id`,`database`),
  KEY `databases_server_id_foreign` (`server_id`),
  CONSTRAINT `databases_database_host_id_foreign` FOREIGN KEY (`database_host_id`) REFERENCES `database_hosts` (`id`),
  CONSTRAINT `databases_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databases`
--

LOCK TABLES `databases` WRITE;
/*!40000 ALTER TABLE `databases` DISABLE KEYS */;
/*!40000 ALTER TABLE `databases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egg_mount`
--

DROP TABLE IF EXISTS `egg_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egg_mount` (
  `egg_id` int(11) NOT NULL,
  `mount_id` int(11) NOT NULL,
  UNIQUE KEY `egg_mount_egg_id_mount_id_unique` (`egg_id`,`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egg_mount`
--

LOCK TABLES `egg_mount` WRITE;
/*!40000 ALTER TABLE `egg_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `egg_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egg_variables`
--

DROP TABLE IF EXISTS `egg_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egg_variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `egg_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `env_variable` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_viewable` tinyint(3) unsigned NOT NULL,
  `user_editable` tinyint(3) unsigned NOT NULL,
  `rules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_variables_egg_id_foreign` (`egg_id`),
  CONSTRAINT `service_variables_egg_id_foreign` FOREIGN KEY (`egg_id`) REFERENCES `eggs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egg_variables`
--

LOCK TABLES `egg_variables` WRITE;
/*!40000 ALTER TABLE `egg_variables` DISABLE KEYS */;
INSERT INTO `egg_variables` VALUES (1,1,'Bungeecord Version','The version of Bungeecord to download and use.','BUNGEE_VERSION','latest',1,1,'required|alpha_num|between:1,6','2021-02-08 17:55:14','2021-02-08 17:55:14'),(2,1,'Bungeecord Jar File','The name of the Jarfile to use when running Bungeecord.','SERVER_JARFILE','bungeecord.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(3,2,'Server Jar File','The name of the Jarfile to use when running Forge Mod.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(4,2,'Minecraft Version','The version of minecraft you want to install for.\r\n\r\nLeaving latest will install the latest recommended version.','MC_VERSION','latest',1,1,'required|string|max:9','2021-02-08 17:55:14','2021-02-08 17:55:14'),(5,2,'Build Type','The type of server jar to download from forge.\r\n\r\nValid types are \"recommended\" and \"latest\".','BUILD_TYPE','recommended',1,1,'required|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(6,2,'Forge Version','Gets an exact version.\r\n\r\nEx. 1.15.2-31.2.4\r\n\r\nOverrides MC_VERSION and BUILD_TYPE. If it fails to download the server files it will fail to install.','FORGE_VERSION','',1,1,'nullable|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(7,3,'Minecraft Version','The version of minecraft to download. \r\n\r\nLeave at latest to always get the latest version. Invalid versions will default to latest.','MINECRAFT_VERSION','latest',1,0,'nullable|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(8,3,'Server Jar File','The name of the server jarfile to run the server with.','SERVER_JARFILE','server.jar',1,1,'required|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(9,3,'Download Path','A URL to use to download a server.jar rather than the ones in the install script. This is not user viewable.','DL_PATH','',0,0,'nullable|string','2021-02-08 17:55:14','2021-02-08 17:55:14'),(10,3,'Build Number','The build number for the paper release.\r\n\r\nLeave at latest to always get the latest version. Invalid versions will default to latest.','BUILD_NUMBER','latest',1,0,'required|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(11,4,'Sponge Version','The version of SpongeVanilla to download and use.','SPONGE_VERSION','1.12.2-7.3.0',1,0,'required|regex:/^([a-zA-Z0-9.\\-_]+)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(12,4,'Server Jar File','The name of the Jarfile to use when running SpongeVanilla.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(13,5,'Server Jar File','The name of the server jarfile to run the server with.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(14,5,'Server Version','The version of Minecraft Vanilla to install. Use \"latest\" to install the latest version.','VANILLA_VERSION','latest',1,1,'required|string|between:3,15','2021-02-08 17:55:14','2021-02-08 17:55:14'),(15,6,'Server Password','If specified, players must provide this password to join the server.','ARK_PASSWORD','',1,1,'nullable|alpha_dash|between:1,100','2021-02-08 17:55:14','2021-02-08 17:55:14'),(16,6,'Admin Password','If specified, players must provide this password (via the in-game console) to gain access to administrator commands on the server.','ARK_ADMIN_PASSWORD','PleaseChangeMe',1,1,'nullable|alpha_dash|between:1,100','2021-02-08 17:55:14','2021-02-08 17:55:14'),(17,6,'Server Map','Available Maps: TheIsland, TheCenter, Ragnarok, ScorchedEarth_P, Aberration_P, Extinction, Valguero_P, Genesis','SERVER_MAP','TheIsland',1,1,'required|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(18,6,'App ID','ARK steam app id for auto updates. Leave blank to avoid auto update.','SRCDS_APPID','376030',1,0,'nullable|numeric','2021-02-08 17:55:14','2021-02-08 17:55:14'),(19,6,'Server Name','ARK server name','SESSION_NAME','A Pterodactyl Hosted ARK Server',1,1,'required|string|max:128','2021-02-08 17:55:14','2021-02-08 17:55:14'),(20,6,'Use Rcon','Enable or disable rcon system. (true or false)\r\n\r\nDefault True for the console to work.','ENABLE_RCON','True',1,0,'required|string|in:True,False','2021-02-08 17:55:14','2021-02-08 17:55:14'),(21,6,'Rcon Port','ARK rcon port used by rcon tools.','RCON_PORT','27020',1,1,'required|numeric','2021-02-08 17:55:14','2021-02-08 17:55:14'),(22,6,'Query Port','ARK query port used by steam server browser and ark client server browser.','QUERY_PORT','27015',1,1,'required|numeric','2021-02-08 17:55:14','2021-02-08 17:55:14'),(23,6,'Auto-update server','This is to enable auto-updating for servers.\r\n\r\nDefault is 0. Set to 1 to update','AUTO_UPDATE','0',1,1,'required|boolean','2021-02-08 17:55:14','2021-02-08 17:55:14'),(24,6,'Ballte Eye','Enable BattleEye\r\n\r\n0 to disable\r\n1 to enable\r\n\r\ndefault=\"1\"','BATTLE_EYE','1',1,1,'required|boolean','2021-02-08 17:55:14','2021-02-08 17:55:14'),(25,7,'Map','The default map for the server.','SRCDS_MAP','de_dust2',1,1,'required|string|alpha_dash','2021-02-08 17:55:14','2021-02-08 17:55:14'),(26,7,'Steam Account Token','The Steam Account Token required for the server to be displayed publicly.','STEAM_ACC','',1,1,'required|string|alpha_num|size:32','2021-02-08 17:55:14','2021-02-08 17:55:14'),(27,7,'Source AppID','Required for game to update on server restart. Do not modify this.','SRCDS_APPID','740',0,0,'required|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(28,8,'Game ID','The ID corresponding to the game to download and run using SRCDS.','SRCDS_APPID','',1,0,'required|numeric|digits_between:1,6','2021-02-08 17:55:14','2021-02-08 17:55:14'),(29,8,'Game Name','The name corresponding to the game to download and run using SRCDS.','SRCDS_GAME','',1,0,'required|alpha_dash|between:1,100','2021-02-08 17:55:14','2021-02-08 17:55:14'),(30,8,'Map','The default map for the server.','SRCDS_MAP','',1,1,'required|string|alpha_dash','2021-02-08 17:55:14','2021-02-08 17:55:14'),(31,9,'Map','The default map for the server.','SRCDS_MAP','gm_flatgrass',1,1,'required|string|alpha_dash','2021-02-08 17:55:14','2021-02-08 17:55:14'),(32,9,'Steam Account Token','The Steam Account Token required for the server to be displayed publicly.','STEAM_ACC','',1,1,'nullable|string|alpha_num|size:32','2021-02-08 17:55:14','2021-02-08 17:55:14'),(33,9,'Source AppID','Required for game to update on server restart. Do not modify this.','SRCDS_APPID','4020',0,0,'required|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(34,9,'Workshop ID','The ID of your workshop collection (the numbers at the end of the URL)','WORKSHOP_ID','',1,1,'nullable|integer','2021-02-08 17:55:14','2021-02-08 17:55:14'),(35,9,'Gamemode','The gamemode of your server.','GAMEMODE','sandbox',1,1,'required|string','2021-02-08 17:55:14','2021-02-08 17:55:14'),(36,9,'Max Players','The maximum amount of players allowed on your game server.','MAX_PLAYERS','32',1,1,'required|integer|max:128','2021-02-08 17:55:14','2021-02-08 17:55:14'),(37,9,'Tickrate','The tickrate defines how fast the server will update each entities location.','TICKRATE','22',1,1,'required|integer|max:100','2021-02-08 17:55:14','2021-02-08 17:55:14'),(38,10,'Game ID','The ID corresponding to the game to download and run using SRCDS.','SRCDS_APPID','237410',1,0,'required|regex:/^(237410)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(39,10,'Game Name','The name corresponding to the game to download and run using SRCDS.','SRCDS_GAME','insurgency',1,0,'required|regex:/^(insurgency)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(40,10,'Default Map','The default map to use when starting the server.','SRCDS_MAP','sinjar',1,1,'required|regex:/^(\\w{1,20})$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(41,11,'Game ID','The ID corresponding to the game to download and run using SRCDS.','SRCDS_APPID','232250',1,0,'required|regex:/^(232250)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(42,11,'Game Name','The name corresponding to the game to download and run using SRCDS.','SRCDS_GAME','tf',1,0,'required|regex:/^(tf)$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(43,11,'Default Map','The default map to use when starting the server.','SRCDS_MAP','cp_dustbowl',1,1,'required|regex:/^(\\w{1,20})$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(44,12,'Maximum Users','Maximum concurrent users on the mumble server.','MAX_USERS','100',1,0,'required|numeric|digits_between:1,5','2021-02-08 17:55:14','2021-02-08 17:55:14'),(45,12,'Server Version','Version of Mumble Server to download and use.','MUMBLE_VERSION','latest',1,1,'required|regex:/^([0-9_\\.-]{5,8})$/','2021-02-08 17:55:14','2021-02-08 17:55:14'),(46,13,'Server Version','The version of Teamspeak 3 to use when running the server.','TS_VERSION','latest',1,1,'required|string|max:6','2021-02-08 17:55:14','2021-02-08 17:55:14'),(47,13,'File Transfer Port','The Teamspeak file transfer port','FILE_TRANSFER','30033',1,0,'required|integer|between:1,65535','2021-02-08 17:55:14','2021-02-08 17:55:14'),(48,14,'Server Name','The name of your server in the public server list.','HOSTNAME','A Rust Server',1,1,'required|string|max:40','2021-02-08 17:55:14','2021-02-08 17:55:14'),(49,14,'OxideMod','Set whether you want the server to use and auto update OxideMod or not. Valid options are \"1\" for true and \"0\" for false.','OXIDE','0',1,1,'required|boolean','2021-02-08 17:55:14','2021-02-08 17:55:14'),(50,14,'Level','The world file for Rust to use.','LEVEL','Procedural Map',1,1,'required|string|max:20','2021-02-08 17:55:14','2021-02-08 17:55:14'),(51,14,'Description','The description under your server title. Commonly used for rules & info. Use \\n for newlines.','DESCRIPTION','Powered by Pterodactyl',1,1,'required|string','2021-02-08 17:55:14','2021-02-08 17:55:14'),(52,14,'URL','The URL for your server. This is what comes up when clicking the \"Visit Website\" button.','SERVER_URL','http://pterodactyl.io',1,1,'nullable|url','2021-02-08 17:55:14','2021-02-08 17:55:14'),(53,14,'World Size','The world size for a procedural map.','WORLD_SIZE','3000',1,1,'required|integer','2021-02-08 17:55:14','2021-02-08 17:55:14'),(54,14,'World Seed','The seed for a procedural map.','WORLD_SEED','',1,1,'nullable|string','2021-02-08 17:55:14','2021-02-08 17:55:14'),(55,14,'Max Players','The maximum amount of players allowed in the server at once.','MAX_PLAYERS','40',1,1,'required|integer','2021-02-08 17:55:14','2021-02-08 17:55:14'),(56,14,'Server Image','The header image for the top of your server listing.','SERVER_IMG','',1,1,'nullable|url','2021-02-08 17:55:14','2021-02-08 17:55:14'),(57,14,'RCON Port','Port for RCON connections.','RCON_PORT','28016',1,0,'required|integer','2021-02-08 17:55:14','2021-02-08 17:55:14'),(58,14,'RCON Password','RCON access password.','RCON_PASS','CHANGEME',1,1,'required|string|max:64','2021-02-08 17:55:14','2021-02-08 17:55:14'),(59,14,'Save Interval','Sets the server’s auto-save interval in seconds.','SAVEINTERVAL','60',1,1,'required|integer','2021-02-08 17:55:14','2021-02-08 17:55:14'),(60,14,'Additional Arguments','Add additional startup parameters to the server.','ADDITIONAL_ARGS','',1,1,'nullable|string','2021-02-08 17:55:14','2021-02-08 17:55:14'),(61,15,'NodeJS','NodeJS version','NODEJS_VERSION','14',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(62,15,'Other options mode','','OTHER_THINGS','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(63,15,'Github user','Github username','GITHUB_USER','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(64,15,'Github token/password','Github token/password','GITHUB_OAUTH_TOKEN','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(65,15,'Golang version','','GOLANG_VERSION','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(66,15,'Github repository','Github','GITHUB_REPO','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(67,15,'Github Email','Github','GITHUB_EMAIL','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(68,15,'Github Action','You want to pull/clone?\r\nAccepted values is pull/clone','GITHUB_ACTION','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(69,15,'Java Version','','JAVA_VERSION','adopt@1.8-0',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(70,15,'Python version','','PYTHON_VERSION','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(71,15,'Github pull/clone feature','Would you like to use Github pull/clone feature?\r\nAccepted values is yes','GITHUB_FEATURE','no',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(72,15,'Mindustry map','Default Maps Available: Ancient Caldera, Fork, Fortress, Glacier, Islands, Labyrinth, Maze, Shattered, Tendrils, Triad, Veins, Wasteland.','MAPNAME','Ancient',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(73,15,'SinusBot admin account','SinusBot','OVERRIDE_PASSWORD','change-this',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(74,15,'Rage.MP server name','Server name that will be displayed to the master server.  (64 Char max)','SERVER_NAME','RAGE:MP Unofficial server',1,1,'nullable|string|max:64','2021-02-08 20:02:41','2021-02-08 20:02:41'),(75,15,'Rage.MP max players','Maximum number of players your server will hold.  (Max 100)','MAX_PLAYERS','50',1,1,'nullable|integer|between:1,100','2021-02-08 20:02:41','2021-02-08 20:02:41'),(76,15,'Rage.MP announce','Announce to the master server so people can see you in their server browser. This needs to be a 0 (false) or 1 (true) due to weird boolean parsing.','ANNOUNCE','0',1,1,'nullable|boolean','2021-02-08 20:02:41','2021-02-08 20:02:41'),(77,15,'Redis admin account password','Redis','REDIS_PASSWORD','replace-this',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(78,15,'RethinkDB web interface port','RethinkDB','HTTP_PORT','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(79,15,'RethinkDB cluster port','RethinkDB','CLUSTER_PORT','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(80,15,'RethinkDB admin acount password','RethinkDB','ADMIN_PASSWORD','replace-this',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(81,15,'TeamSpeak3 file transfer port','TeamSpeak3','FILE_TRANSFER','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(82,15,'Java arguments','Addition arguments for java','JAVA_ARGUMENT','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(83,15,'Server optimization','You want to use optimized java arguments?\r\nIf you want to use optimized argumets type yes at value field','JAVA_OPTIMIZED','yes',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(84,15,'PM2 arguments','','PM2_ARGUMENTS','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(85,15,'MTA:SA http port','','MTA_HTTP_PORT','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(86,15,'MTA:SA ASE port','','ASE_PORT','',1,1,'nullable|string','2021-02-08 20:02:41','2021-02-08 20:02:41'),(87,16,'Install Repo','The GitHub repo to clone and install the discord js bot from.','INSTALL_REPO','',1,1,'nullable|string|max:128','2021-02-08 20:05:32','2021-02-08 20:05:32'),(88,16,'Username','The GitHub username. Leave this field blank if the GitHub repo is NOT a private repo.','USERNAME','',1,1,'nullable|string|max:128','2021-02-08 20:05:32','2021-02-08 20:05:32'),(89,16,'Password','The GitHub password. Leave this field blank if the GitHub repo is NOT a private repo.','PASSWORD','',1,1,'nullable|string|max:128','2021-02-08 20:05:32','2021-02-08 20:05:32'),(90,16,'Install Branch','The branch of the bot to install.','INSTALL_BRANCH','',1,1,'nullable|string|max:32','2021-02-08 20:05:32','2021-02-08 20:05:32'),(91,16,'User Uploaded Files','Skip all the install stuff if you are letting a user upload files.\r\n\r\n0 = false (default)\r\n1 = true','USER_UPLOAD','0',1,1,'required|bool','2021-02-08 20:05:32','2021-02-08 20:05:32'),(92,16,'Auto Update','Pull the latest files on startup when using a GitHub repo.','AUTO_UPDATE','0',1,1,'required|boolean','2021-02-08 20:05:32','2021-02-08 20:05:32'),(93,16,'Bot js file','The file that starts the bot.','BOT_JS_FILE','index.js',1,1,'required|string','2021-02-08 20:05:32','2021-02-08 20:05:32'),(94,16,'Additional Node packages','Install additional node packages.\r\n\r\nUse spaces to separate.','NODE_PACKAGES','',1,1,'nullable|string','2021-02-08 20:05:32','2021-02-08 20:05:32'),(95,17,'Install Repo','The GitHub repo to clone and install the discord py bot from.','INSTALL_REPO','',1,1,'nullable|string|max:128','2021-02-08 20:05:51','2021-02-08 20:05:51'),(96,17,'Install Branch','The branch of the bot to install','INSTALL_BRANCH','',1,1,'nullable|string|max:32','2021-02-08 20:05:51','2021-02-08 20:05:51'),(97,17,'User Uploaded Files','Skip all the install stuff if you are letting a user upload files.\r\n\r\n0 = false (default)\r\n1 = true','USER_UPLOAD','0',1,1,'required|boolean','2021-02-08 20:05:51','2021-02-08 20:05:51'),(98,17,'Auto Update','Pull the latest files on startup when using a GitHub repo.','AUTO_UPDATE','0',1,1,'required|boolean','2021-02-08 20:05:51','2021-02-08 20:05:51'),(99,17,'Bot py file','The file that starts the bot.','BOT_PY_FILE','bot.py',1,1,'required|string','2021-02-08 20:05:51','2021-02-08 20:05:51'),(100,17,'Additional Python packages','Install additional python packages.\r\n\r\nUse spaces to separate','PY_PACKAGES','',1,1,'nullable|string','2021-02-08 20:05:51','2021-02-08 20:05:51'),(101,17,'Username','The GitHub username. Leave this field blank if the GitHub repo is NOT a private repo.','USERNAME','',1,1,'nullable|string|max:128','2021-02-08 20:05:51','2021-02-08 20:05:51'),(102,17,'Password','The GitHub password. Leave this field blank if the GitHub repo is NOT a private repo.','PASSWORD','',1,1,'nullable|string|max:128','2021-02-08 20:05:51','2021-02-08 20:05:51'),(103,18,'Discord Bot Token','Get your own token here - https://discordapp.com/developers/applications/','TOKEN','GET_YOUR_OWN',1,1,'required|string','2021-02-08 20:06:09','2021-02-08 20:06:09'),(104,18,'Command Prefix','The prefix for commands from the bot.','PREFIX','.',1,1,'required|string','2021-02-08 20:06:09','2021-02-08 20:06:09'),(105,19,'Startup file','The file that starts the bot.','BOT_JS_FILE','index.js',1,1,'required|string','2021-02-08 20:08:19','2021-02-08 20:08:19'),(106,19,'Additional Startup Command','If you want to disable sqlite3 installing please type --no-install','NO_INSTALL','',1,1,'nullable|max:50','2021-02-08 20:08:19','2021-02-08 20:08:19'),(107,20,'Server Jar File','The name of the server jarfile to run the server with.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2021-02-08 23:09:05','2021-02-08 23:09:05'),(108,20,'Download Path','A URL to use to download Spigot rather than building it on the server. This is not user viewable. Use <code>{{DL_VERSION}}</code> in the URL to automatically insert the assigned version into the URL. If you do not enter a URL Spigot will build directly in the container (this will fail on low memory containers).','DL_PATH','',0,0,'nullable|string','2021-02-08 23:09:05','2021-02-08 23:09:05'),(109,20,'Spigot Version','The version of Spigot to download (using the --rev tag). Use \"latest\" for latest.','DL_VERSION','latest',1,1,'required|string|between:3,7','2021-02-08 23:09:05','2021-02-08 23:09:05'),(110,21,'Server Jar File','The name of the server jarfile to run the server with.','SERVER_JARFILE','fabric-server-launch.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2021-02-08 23:10:46','2021-02-08 23:10:46'),(111,21,'Fabric Version','The version of Fabric to install.','FABRIC_VERSION','latest',1,1,'required|string|between:3,15','2021-02-08 23:10:46','2021-02-08 23:10:46'),(112,22,'PocketmineMP Version','The build to pull and install. (Ex. 1604)\r\n\r\nThis is the build number on https://jenkins.pmmp.io','PMMP_VERSION','latest',1,1,'required|string|max:20','2021-02-09 14:59:42','2021-02-09 14:59:42'),(113,23,'Server Jar File','The name of the server jarfile to run the server with.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2021-02-09 14:59:56','2021-02-09 14:59:56'),(114,23,'Download Path','A URL to use to download Spigot rather than building it on the server. This is not user viewable. Use <code>{{DL_VERSION}}</code> in the URL to automatically insert the assigned version into the URL. If you do not enter a URL Spigot will build directly in the container (this will fail on low memory containers).','DL_PATH','',0,0,'nullable|string','2021-02-09 14:59:56','2021-02-09 14:59:56'),(115,23,'nukkit version','The version of Nukkitt to download (using the --rev tag). Use \"latest\" for latest.','NUKKIT_VERSION','latest',1,1,'required|string|max:20','2021-02-09 14:59:56','2021-02-09 14:59:56'),(116,24,'Bedrock Version','The version of bedrock. (Ex. 1.7.0.13)\r\n\r\nDefault version is latest.','BEDROCK_VERSION','latest',1,1,'required|string|max:20','2021-02-09 15:00:11','2021-02-09 15:00:11'),(117,24,'ld lib path','Dumb reasons to need this','LD_LIBRARY_PATH','.',0,0,'required|string|max:20','2021-02-09 15:00:11','2021-02-09 15:00:11'),(118,24,'Server Name','The name for the server','SERVERNAME','Bedrock Dedicated Server',1,1,'required|string|max:50','2021-02-09 15:00:11','2021-02-09 15:00:11'),(119,24,'Gamemode','Allowed values: \"survival\", \"creative\", or \"adventure\"','GAMEMODE','survival',1,1,'required|string|in:survival,creative,adventure','2021-02-09 15:00:11','2021-02-09 15:00:11'),(120,24,'Difficulty','Allowed values: \"peaceful\", \"easy\", \"normal\", or \"hard\"','DIFFICULTY','easy',1,1,'required|string|in:peaceful,easy,normal,hard','2021-02-09 15:00:11','2021-02-09 15:00:11'),(121,24,'Allow cheats','If true then cheats like commands can be used.\r\n\r\nAllowed values: \"true\" or \"false\"','CHEATS','false',1,1,'required|string|in:true,false','2021-02-09 15:00:11','2021-02-09 15:00:11');
/*!40000 ALTER TABLE `egg_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eggs`
--

DROP TABLE IF EXISTS `eggs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eggs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nest_id` int(10) unsigned NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `docker_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`docker_images`)),
  `file_denylist` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_files` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_startup` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_logs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_stop` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_from` int(10) unsigned DEFAULT NULL,
  `startup` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script_container` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'alpine:3.4',
  `copy_script_from` int(10) unsigned DEFAULT NULL,
  `script_entry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ash',
  `script_is_privileged` tinyint(1) NOT NULL DEFAULT 1,
  `script_install` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_options_uuid_unique` (`uuid`),
  KEY `service_options_nest_id_foreign` (`nest_id`),
  KEY `eggs_config_from_foreign` (`config_from`),
  KEY `eggs_copy_script_from_foreign` (`copy_script_from`),
  CONSTRAINT `eggs_config_from_foreign` FOREIGN KEY (`config_from`) REFERENCES `eggs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eggs_copy_script_from_foreign` FOREIGN KEY (`copy_script_from`) REFERENCES `eggs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `service_options_nest_id_foreign` FOREIGN KEY (`nest_id`) REFERENCES `nests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eggs`
--

LOCK TABLES `eggs` WRITE;
/*!40000 ALTER TABLE `eggs` DISABLE KEYS */;
INSERT INTO `eggs` VALUES (1,'58ce4217-c680-44ec-b053-c50ce0c7e156',1,'support@pterodactyl.io','Bungeecord','For a long time, Minecraft server owners have had a dream that encompasses a free, easy, and reliable way to connect multiple Minecraft servers together. BungeeCord is the answer to said dream. Whether you are a small server wishing to string multiple game-modes together, or the owner of the ShotBow Network, BungeeCord is the ideal solution for you. With the help of BungeeCord, you will be able to unlock your community\'s full potential.','[\"eula\"]','[\"quay.io\\/pterodactyl\\/core:java\",\"quay.io\\/pterodactyl\\/core:java-11\"]','',NULL,'{\r\n    \"config.yml\": {\r\n        \"parser\": \"yaml\",\r\n        \"find\": {\r\n            \"listeners[0].query_enabled\": true,\r\n            \"listeners[0].query_port\": \"{{server.build.default.port}}\",\r\n            \"listeners[0].host\": \"0.0.0.0:{{server.build.default.port}}\",\r\n            \"servers.*.address\": {\r\n                \"regex:^(127\\\\.0\\\\.0\\\\.1|localhost)(:\\\\d{1,5})?$\": \"{{config.docker.interface}}$2\"\r\n            }\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \"Listening on \",\r\n    \"userInteraction\": [\r\n        \"Listening on /0.0.0.0:25577\"\r\n    ]\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"proxy.log.0\"\r\n}','end',NULL,'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# Bungeecord Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y curl\r\n\r\ncd /mnt/server\r\n\r\nif [ -z \"${BUNGEE_VERSION}\" ] || [ \"${BUNGEE_VERSION}\" == \"latest\" ]; then\r\n    BUNGEE_VERSION=\"lastStableBuild\"\r\nfi\r\n\r\ncurl -o ${SERVER_JARFILE} https://ci.md-5.net/job/BungeeCord/${BUNGEE_VERSION}/artifact/bootstrap/target/BungeeCord.jar','2021-02-08 17:55:14','2021-02-08 17:55:14'),(2,'1bc84881-f4ad-47f5-8618-132330e521c4',1,'support@pterodactyl.io','Forge Minecraft','Minecraft Forge Server. Minecraft Forge is a modding API (Application Programming Interface), which makes it easier to create mods, and also make sure mods are compatible with each other.','[\"eula\"]','[\"quay.io\\/pterodactyl\\/core:java\",\"quay.io\\/pterodactyl\\/core:java-11\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"logs/latest.log\"\r\n}','stop',NULL,'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}','openjdk:8-jdk-slim',NULL,'bash',1,'#!/bin/bash\r\n# Forge Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y curl jq\r\n\r\n#Go into main direction\r\nif [ ! -d /mnt/server ]; then\r\n    mkdir /mnt/server\r\nfi\r\n\r\ncd /mnt/server\r\n\r\nif [ ! -z ${FORGE_VERSION} ]; then\r\n    DOWNLOAD_LINK=https://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}\r\nelse\r\n    JSON_DATA=$(curl -sSL https://files.minecraftforge.net/maven/net/minecraftforge/forge/promotions_slim.json)\r\n\r\n    if [ \"${MC_VERSION}\" == \"latest\" ] || [ \"${MC_VERSION}\" == \"\" ] ; then\r\n        echo -e \"getting latest recommended version of forge.\"\r\n        MC_VERSION=$(echo -e ${JSON_DATA} | jq -r \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains(\"recommended\")) | split(\"-\")[0]\' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | tail -1)\r\n    	BUILD_TYPE=recommended\r\n    fi\r\n\r\n    if [ \"${BUILD_TYPE}\" != \"recommended\" ] && [ \"${BUILD_TYPE}\" != \"latest\" ]; then\r\n        BUILD_TYPE=recommended\r\n    fi\r\n\r\n    echo -e \"minecraft version: ${MC_VERSION}\"\r\n    echo -e \"build type: ${BUILD_TYPE}\"\r\n\r\n    ## some variables for getting versions and things\r\n    FILE_SITE=$(echo -e ${JSON_DATA} | jq -r \'.homepage\' | sed \"s/http:/https:/g\")\r\n    VERSION_KEY=$(echo -e ${JSON_DATA} | jq -r --arg MC_VERSION \"${MC_VERSION}\" --arg BUILD_TYPE \"${BUILD_TYPE}\" \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains($MC_VERSION)) | select(contains($BUILD_TYPE))\')\r\n\r\n    ## locating the forge version\r\n    if [ \"${VERSION_KEY}\" == \"\" ] && [ \"${BUILD_TYPE}\" == \"recommended\" ]; then\r\n        echo -e \"dropping back to latest from recommended due to there not being a recommended version of forge for the mc version requested.\"\r\n        VERSION_KEY=$(echo -e ${JSON_DATA} | jq -r --arg MC_VERSION \"${MC_VERSION}\" \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains($MC_VERSION)) | select(contains(\"recommended\"))\')\r\n    fi\r\n\r\n    ## Error if the mc version set wasn\'t valid.\r\n    if [ \"${VERSION_KEY}\" == \"\" ] || [ \"${VERSION_KEY}\" == \"null\" ]; then\r\n    	echo -e \"The install failed because there is no valid version of forge for the version on minecraft selected.\"\r\n    	exit 1\r\n    fi\r\n\r\n    FORGE_VERSION=$(echo -e ${JSON_DATA} | jq -r --arg VERSION_KEY \"$VERSION_KEY\" \'.promos | .[$VERSION_KEY]\')\r\n\r\n    if [ \"${MC_VERSION}\" == \"1.7.10\" ] || [ \"${MC_VERSION}\" == \"1.8.9\" ]; then\r\n        DOWNLOAD_LINK=${FILE_SITE}${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}/forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}\r\n        FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}.jar\r\n        if [ \"${MC_VERSION}\" == \"1.7.10\" ]; then\r\n            FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}-universal.jar\r\n        fi\r\n    else\r\n        DOWNLOAD_LINK=${FILE_SITE}${MC_VERSION}-${FORGE_VERSION}/forge-${MC_VERSION}-${FORGE_VERSION}\r\n        FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}.jar\r\n    fi\r\nfi\r\n\r\n\r\n#Adding .jar when not eding by SERVER_JARFILE\r\nif [[ ! $SERVER_JARFILE = *\\.jar ]]; then\r\n  SERVER_JARFILE=\"$SERVER_JARFILE.jar\"\r\nfi\r\n\r\n#Downloading jars\r\necho -e \"Downloading forge version ${FORGE_VERSION}\"\r\necho -e \"Download link is ${DOWNLOAD_LINK}\"\r\nif [ ! -z \"${DOWNLOAD_LINK}\" ]; then \r\n    if curl --output /dev/null --silent --head --fail ${DOWNLOAD_LINK}-installer.jar; then\r\n        echo -e \"installer jar download link is valid.\"\r\n    else\r\n        echo -e \"link is invalid closing out\"\r\n        exit 2\r\n    fi\r\nelse\r\n    echo -e \"no download link closing out\"\r\n    exit 3\r\nfi\r\n\r\ncurl -s -o installer.jar -sS ${DOWNLOAD_LINK}-installer.jar\r\n\r\n#Checking if downloaded jars exist\r\nif [ ! -f ./installer.jar ]; then\r\n    echo \"!!! Error by downloading forge version ${FORGE_VERSION} !!!\"\r\n    exit\r\nfi\r\n\r\n#Installing server\r\necho -e \"Installing forge server.\\n\"\r\njava -jar installer.jar --installServer || { echo -e \"install failed\"; exit 4; }\r\n\r\nmv $FORGE_JAR $SERVER_JARFILE\r\n\r\n#Deleting installer.jar\r\necho -e \"Deleting installer.jar file.\\n\"\r\nrm -rf installer.jar','2021-02-08 17:55:14','2021-02-08 17:55:14'),(3,'c99f736a-1ca5-468d-b400-693a54fae7a9',1,'parker@pterodactyl.io','Paper','High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies.','[\"eula\"]','[\"quay.io\\/pterodactyl\\/core:java-11\",\"quay.io\\/pterodactyl\\/core:java\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"server-port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{}','stop',NULL,'java -Xms128M -Xmx{{SERVER_MEMORY}}M -Dterminal.jline=false -Dterminal.ansi=true -jar {{SERVER_JARFILE}}','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# Paper Installation Script\r\n#\r\n# Server Files: /mnt/server\r\nPROJECT=paper\r\n\r\napt update\r\napt install -y curl jq\r\n\r\nif [ -n \"${DL_PATH}\" ]; then\r\n	echo -e \"Using supplied download url: ${DL_PATH}\"\r\n	DOWNLOAD_URL=`eval echo $(echo ${DL_PATH} | sed -e \'s/{{/${/g\' -e \'s/}}/}/g\')`\r\nelse\r\n	VER_EXISTS=`curl -s https://papermc.io/api/v2/projects/${PROJECT} | jq -r --arg VERSION $MINECRAFT_VERSION \'.versions[] | contains($VERSION)\' | grep true`\r\n	LATEST_VERSION=`curl -s https://papermc.io/api/v2/projects/${PROJECT} | jq -r \'.versions\' | jq -r \'.[-1]\'`\r\n\r\n	if [ \"${VER_EXISTS}\" == \"true\" ]; then\r\n		echo -e \"Version is valid. Using version ${MINECRAFT_VERSION}\"\r\n	else\r\n		echo -e \"Using the latest ${PROJECT} version\"\r\n		MINECRAFT_VERSION=${LATEST_VERSION}\r\n	fi\r\n	\r\n	BUILD_EXISTS=`curl -s https://papermc.io/api/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r --arg BUILD ${BUILD_NUMBER} \'.builds[] | tostring | contains($BUILD)\' | grep true`\r\n	LATEST_BUILD=`curl -s https://papermc.io/api/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r \'.builds\' | jq -r \'.[-1]\'`\r\n	\r\n	if [ \"${BUILD_EXISTS}\" == \"true\" ]; then\r\n		echo -e \"Build is valid for version ${MINECRAFT_VERSION}. Using build ${BUILD_NUMBER}\"\r\n	else\r\n		echo -e \"Using the latest ${PROJECT} build for version ${MINECRAFT_VERSION}\"\r\n		BUILD_NUMBER=${LATEST_BUILD}\r\n	fi\r\n	\r\n	JAR_NAME=${PROJECT}-${MINECRAFT_VERSION}-${BUILD_NUMBER}.jar\r\n	\r\n	echo \"Version being downloaded\"\r\n	echo -e \"MC Version: ${MINECRAFT_VERSION}\"\r\n	echo -e \"Build: ${BUILD_NUMBER}\"\r\n	echo -e \"JAR Name of Build: ${JAR_NAME}\"\r\n	DOWNLOAD_URL=https://papermc.io/api/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds/${BUILD_NUMBER}/downloads/${JAR_NAME}\r\nfi\r\n\r\ncd /mnt/server\r\n\r\necho -e \"Running curl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}\"\r\n\r\nif [ -f ${SERVER_JARFILE} ]; then\r\n	mv ${SERVER_JARFILE} ${SERVER_JARFILE}.old\r\nfi\r\n\r\ncurl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}\r\n\r\nif [ ! -f server.properties ]; then\r\n    echo -e \"Downloading MC server.properties\"\r\n    curl -o server.properties https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft/java/server.properties\r\nfi','2021-02-08 17:55:14','2021-02-08 17:55:14'),(4,'fe4ee352-b3ab-49b1-bfe0-4732651d2030',1,'support@pterodactyl.io','Sponge (SpongeVanilla)','SpongeVanilla is the SpongeAPI implementation for Vanilla Minecraft.','[\"eula\"]','[\"quay.io\\/pterodactyl\\/core:java-glibc\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"logs/latest.log\"\r\n}','stop',NULL,'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# Sponge Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\napt update\r\napt install -y curl\r\n\r\ncd /mnt/server\r\n\r\ncurl -sSL \"https://repo.spongepowered.org/maven/org/spongepowered/spongevanilla/${SPONGE_VERSION}/spongevanilla-${SPONGE_VERSION}.jar\" -o ${SERVER_JARFILE}','2021-02-08 17:55:14','2021-02-08 17:55:14'),(5,'59ba72a7-f0a9-44c9-ac18-be634359aaa6',1,'support@pterodactyl.io','Vanilla Minecraft','Minecraft is a game about placing blocks and going on adventures. Explore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles. Play in Creative Mode with unlimited resources or mine deep in Survival Mode, crafting weapons and armor to fend off dangerous mobs. Do all this alone or with friends.','[\"eula\"]','[\"quay.io\\/pterodactyl\\/core:java\",\"quay.io\\/pterodactyl\\/core:java-11\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"logs/latest.log\"\r\n}','stop',NULL,'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# Vanilla MC Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y jq curl\r\n\r\nmkdir -p /mnt/server\r\ncd /mnt/server\r\n\r\nLATEST_VERSION=`curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r \'.latest.release\'`\r\n\r\necho -e \"latest version is $LATEST_VERSION\"\r\n\r\nif [ -z \"$VANILLA_VERSION\" ] || [ \"$VANILLA_VERSION\" == \"latest\" ]; then\r\n  MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $LATEST_VERSION -r \'.versions | .[] | select(.id== $VERSION )|.url\')\r\nelse\r\n  MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $VANILLA_VERSION -r \'.versions | .[] | select(.id== $VERSION )|.url\')\r\nfi\r\n\r\nDOWNLOAD_URL=$(curl ${MANIFEST_URL} | jq .downloads.server | jq -r \'. | .url\')\r\n\r\necho -e \"running: curl -o ${SERVER_JARFILE} $DOWNLOAD_URL\"\r\ncurl -o ${SERVER_JARFILE} $DOWNLOAD_URL\r\n\r\necho -e \"Install Complete\"','2021-02-08 17:55:14','2021-02-08 17:55:14'),(6,'83031460-003c-4778-aa6f-9d404c6350a3',2,'dev@shepper.fr','Ark: Survival Evolved','As a man or woman stranded, naked, freezing, and starving on the unforgiving shores of a mysterious island called ARK, use your skill and cunning to kill or tame and ride the plethora of leviathan dinosaurs and other primeval creatures roaming the land. Hunt, harvest resources, craft items, grow crops, research technologies, and build shelters to withstand the elements and store valuables, all while teaming up with (or preying upon) hundreds of other players to survive, dominate... and escape! — Gamepedia: ARK',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:debian_source\"]','',NULL,'{}','{\r\n    \"done\": \"Waiting commands for 127.0.0.1:\",\r\n    \"userInteraction\": []\r\n}','{\r\n    \"custom\": true,\r\n    \"location\": \"logs/latest.log\"\r\n}','^C',NULL,'rmv() { echo -e \"stoppping server\"; rcon -a 127.0.0.1:${RCON_PORT} -p ${ARK_ADMIN_PASSWORD} -c saveworld && rcon -a 127.0.0.1:${RCON_PORT} -p ${ARK_ADMIN_PASSWORD} -c DoExit; }; trap rmv 15; cd ShooterGame/Binaries/Linux && ./ShooterGameServer {{SERVER_MAP}}?listen?SessionName=\"{{SESSION_NAME}}\"?ServerPassword={{ARK_PASSWORD}}?ServerAdminPassword={{ARK_ADMIN_PASSWORD}}?Port={{SERVER_PORT}}?RCONPort={{RCON_PORT}}?QueryPort={{QUERY_PORT}}?RCONEnabled={{ENABLE_RCON}}$( [ \"$BATTLE_EYE\" == \"0\" ] || printf %s \'?-NoBattlEye\' ) -server -log & until echo \"waiting for rcon connection...\"; rcon -a 127.0.0.1:${RCON_PORT} -p ${ARK_ADMIN_PASSWORD}; do sleep 5; done','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'ubuntu:18.04\'\r\napt -y update\r\napt -y --no-install-recommends --no-install-suggests install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\n\r\nmkdir -p /mnt/server/Engine/Binaries/ThirdParty/SteamCMD/Linux\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/Engine/Binaries/ThirdParty/SteamCMD/Linux\r\n\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so\r\n\r\n## create a symbolic link for loading mods\r\ncd /mnt/server/Engine/Binaries/ThirdParty/SteamCMD/Linux\r\nln -sf ../../../../../Steam/steamapps steamapps\r\ncd /mnt/server','2021-02-08 17:55:14','2021-02-08 17:55:14'),(7,'ac773e25-0868-4f7a-bf42-efbacfef419f',2,'support@pterodactyl.io','Counter-Strike: Global Offensive','Counter-Strike: Global Offensive is a multiplayer first-person shooter video game developed by Hidden Path Entertainment and Valve Corporation.',NULL,'[\"quay.io\\/pterodactyl\\/core:source\"]','',NULL,'{}','{\r\n    \"done\": \"Connection to Steam servers successful\",\r\n    \"userInteraction\": []\r\n}','{\r\n    \"custom\": true,\r\n    \"location\": \"logs/latest.log\"\r\n}','quit',NULL,'./srcds_run -game csgo -console -port {{SERVER_PORT}} +ip 0.0.0.0 +map {{SRCDS_MAP}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}}','ubuntu:18.04',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'ubuntu:18.04\'\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2021-02-08 17:55:14','2021-02-08 17:55:14'),(8,'b28ec966-a680-4805-b30e-727dbb272b64',2,'support@pterodactyl.io','Custom Source Engine Game','This option allows modifying the startup arguments and other details to run a custom SRCDS based game on the panel.',NULL,'[\"quay.io\\/pterodactyl\\/core:source\"]','',NULL,'{}','{\r\n    \"done\": \"gameserver Steam ID\",\r\n    \"userInteraction\": []\r\n}','{\r\n    \"custom\": true,\r\n    \"location\": \"logs/latest.log\"\r\n}','quit',NULL,'./srcds_run -game {{SRCDS_GAME}} -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'debian:buster-slim\'\r\n\r\n##\r\n#\r\n# Variables\r\n# STEAM_USER, STEAM_PASS, STEAM_AUTH - Steam user setup. If a user has 2fa enabled it will most likely fail due to timeout. Leave blank for anon install.\r\n# WINDOWS_INSTALL - if it\'s a windows server you want to install set to 1\r\n# SRCDS_APPID - steam app id ffound here - https://developer.valvesoftware.com/wiki/Dedicated_Servers_List\r\n# EXTRA_FLAGS - when a server has extra glas for things like beta installs or updates.\r\n#\r\n##\r\n\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ \"${WINDOWS_INSTALL}\" == \"1\" ]] && printf %s \'+@sSteamCmdForcePlatformType windows\' ) +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2021-02-08 17:55:14','2021-02-08 17:55:14'),(9,'cdf4a73c-2577-491c-b7c9-1fc95c8057b8',2,'support@pterodactyl.io','Garrys Mod','Garrys Mod, is a sandbox physics game created by Garry Newman, and developed by his company, Facepunch Studios.',NULL,'[\"quay.io\\/pterodactyl\\/core:source\"]','',NULL,'{}','{\r\n    \"done\": \"gameserver Steam ID\",\r\n    \"userInteraction\": []\r\n}','{\r\n    \"custom\": true,\r\n    \"location\": \"logs/latest.log\"\r\n}','quit',NULL,'./srcds_run -game garrysmod -console -port {{SERVER_PORT}} +ip 0.0.0.0 +host_workshop_collection {{WORKSHOP_ID}} +map {{SRCDS_MAP}} +gamemode {{GAMEMODE}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}} +maxplayers {{MAX_PLAYERS}}  -tickrate {{TICKRATE}}','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'debian:buster-slim\'\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ \"${WINDOWS_INSTALL}\" == \"1\" ]] && printf %s \'+@sSteamCmdForcePlatformType windows\' ) +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so\r\n\r\n# Creating needed default files for the game\r\ncd /mnt/server/garrysmod/lua/autorun/server\r\necho \'\r\n-- Docs: https://wiki.garrysmod.com/page/resource/AddWorkshop\r\n-- Place the ID of the workshop addon you want to be downloaded to people who join your server, not the collection ID\r\n-- Use https://beta.configcreator.com/create/gmod/resources.lua to easily create a list based on your collection ID\r\n\r\nresource.AddWorkshop( \"\" )\r\n\' > workshop.lua\r\n\r\ncd /mnt/server/garrysmod/cfg\r\necho \'\r\n// Please do not set RCon in here, use the startup parameters.\r\n\r\nhostname		\"New Gmod Server\"\r\nsv_password		\"\"\r\nsv_loadingurl   \"\"\r\n\r\n// Steam Server List Settings\r\nsv_region \"255\"\r\nsv_lan \"0\"\r\nsv_max_queries_sec_global \"30000\"\r\nsv_max_queries_window \"45\"\r\nsv_max_queries_sec \"5\"\r\n\r\n// Server Limits\r\nsbox_maxprops		100\r\nsbox_maxragdolls	5\r\nsbox_maxnpcs		10\r\nsbox_maxballoons	10\r\nsbox_maxeffects		10\r\nsbox_maxdynamite	10\r\nsbox_maxlamps		10\r\nsbox_maxthrusters	10\r\nsbox_maxwheels		10\r\nsbox_maxhoverballs	10\r\nsbox_maxvehicles	20\r\nsbox_maxbuttons		10\r\nsbox_maxsents		20\r\nsbox_maxemitters	5\r\nsbox_godmode		0\r\nsbox_noclip		    0\r\n\r\n// Network Settings - Please keep these set to default.\r\n\r\nsv_minrate		75000\r\nsv_maxrate		0\r\ngmod_physiterations	2\r\nnet_splitpacket_maxrate	45000\r\ndecalfrequency		12 \r\n\r\n// Execute Ban Files - Please do not edit\r\nexec banned_ip.cfg \r\nexec banned_user.cfg \r\n\r\n// Add custom lines under here\r\n\' > server.cfg','2021-02-08 17:55:14','2021-02-08 17:55:14'),(10,'d70868e4-aefd-43ef-af30-ca169f4a7a46',2,'support@pterodactyl.io','Insurgency','Take to the streets for intense close quarters combat, where a team\'s survival depends upon securing crucial strongholds and destroying enemy supply in this multiplayer and cooperative Source Engine based experience.',NULL,'[\"quay.io\\/pterodactyl\\/core:source\"]','',NULL,'{}','{\"done\": \"gameserver Steam ID\", \"userInteraction\": []}','{\"custom\": true, \"location\": \"logs/latest.log\"}','quit',NULL,'./srcds_run -game {{SRCDS_GAME}} -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'debian:buster-slim\'\r\n\r\n##\r\n#\r\n# Variables\r\n# STEAM_USER, STEAM_PASS, STEAM_AUTH - Steam user setup. If a user has 2fa enabled it will most likely fail due to timeout. Leave blank for anon install.\r\n# WINDOWS_INSTALL - if it\'s a windows server you want to install set to 1\r\n# SRCDS_APPID - steam app id ffound here - https://developer.valvesoftware.com/wiki/Dedicated_Servers_List\r\n# EXTRA_FLAGS - when a server has extra glas for things like beta installs or updates.\r\n#\r\n##\r\n\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ \"${WINDOWS_INSTALL}\" == \"1\" ]] && printf %s \'+@sSteamCmdForcePlatformType windows\' ) +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2021-02-08 17:55:14','2021-02-08 17:55:14'),(11,'2a81da28-6072-4181-be4e-dab9a8a65974',2,'support@pterodactyl.io','Team Fortress 2','Team Fortress 2 is a team-based first-person shooter multiplayer video game developed and published by Valve Corporation. It is the sequel to the 1996 mod Team Fortress for Quake and its 1999 remake.',NULL,'[\"quay.io\\/pterodactyl\\/core:source\"]','',NULL,'{}','{\r\n    \"done\": \"gameserver Steam ID\",\r\n    \"userInteraction\": []\r\n}','{\r\n    \"custom\": true,\r\n    \"location\": \"logs/latest.log\"\r\n}','quit',NULL,'./srcds_run -game {{SRCDS_GAME}} -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'debian:buster-slim\'\r\n\r\n##\r\n#\r\n# Variables\r\n# STEAM_USER, STEAM_PASS, STEAM_AUTH - Steam user setup. If a user has 2fa enabled it will most likely fail due to timeout. Leave blank for anon install.\r\n# WINDOWS_INSTALL - if it\'s a windows server you want to install set to 1\r\n# SRCDS_APPID - steam app id ffound here - https://developer.valvesoftware.com/wiki/Dedicated_Servers_List\r\n# EXTRA_FLAGS - when a server has extra glas for things like beta installs or updates.\r\n#\r\n##\r\n\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ \"${WINDOWS_INSTALL}\" == \"1\" ]] && printf %s \'+@sSteamCmdForcePlatformType windows\' ) +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2021-02-08 17:55:14','2021-02-08 17:55:14'),(12,'7518ad71-bbb4-47da-89db-d355193047e1',3,'support@pterodactyl.io','Mumble Server','Mumble is an open source, low-latency, high quality voice chat software primarily intended for use while gaming.',NULL,'[\"quay.io\\/pterodactyl\\/core:glibc\"]','',NULL,'{\"murmur.ini\":{\"parser\": \"ini\", \"find\":{\"logfile\": \"murmur.log\", \"port\": \"{{server.build.default.port}}\", \"host\": \"0.0.0.0\", \"users\": \"{{server.build.env.MAX_USERS}}\"}}}','{\"done\": \"Server listening on\", \"userInteraction\": [ \"Generating new server certificate\"]}','{\"custom\": true, \"location\": \"logs/murmur.log\"}','^C',NULL,'./murmur.x86 -fg','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# Mumble Installation Script\r\n#\r\n# Server Files: /mnt/server\r\nGITHUB_PACKAGE=mumble-voip/mumble\r\nMATCH=murmur-static\r\n\r\napt update\r\napt install -y tar curl jq bzip2\r\n\r\nif [ ! -d /mnt/server/ ]; then\r\n    mkdir /mnt/server/\r\nfi\r\n\r\ncd /mnt/server\r\n\r\nif [ -z \"${GITHUB_USER}\" ] && [ -z \"${GITHUB_OAUTH_TOKEN}\" ] ; then\r\n    echo -e \"using anon api call\"\r\nelse\r\n    echo -e \"user and oauth token set\"\r\n    alias curl=\'curl -u ${GITHUB_USER}:${GITHUB_OAUTH_TOKEN} \'\r\nfi\r\n\r\n## get release info and download links\r\nLATEST_JSON=$(curl --silent \"https://api.github.com/repos/${GITHUB_PACKAGE}/releases/latest\")\r\nRELEASES=$(curl --silent \"https://api.github.com/repos/${GITHUB_PACKAGE}/releases\")\r\n\r\nif [ -z \"${VERSION}\" ] || [ \"${VERSION}\" == \"latest\" ]; then\r\n    DOWNLOAD_LINK=$(echo ${LATEST_JSON} | jq .assets | jq -r .[].browser_download_url | grep -m 1 -i ${MATCH})\r\nelse\r\n    VERSION_CHECK=$(echo ${RELEASES} | jq -r --arg VERSION \"${VERSION}\" \'.[] | select(.tag_name==$VERSION) | .tag_name\')\r\n    if [ \"${VERSION}\" == \"${VERSION_CHECK}\" ]; then\r\n        DOWNLOAD_LINK=$(echo ${RELEASES} | jq -r --arg VERSION \"${VERSION}\" \'.[] | select(.tag_name==$VERSION) | .assets[].browser_download_url\' | grep -m 1 -i ${MATCH})\r\n    else\r\n        echo -e \"defaulting to latest release\"\r\n        DOWNLOAD_LINK=$(echo ${LATEST_JSON} | jq .assets | jq -r .[].browser_download_url)\r\n    fi\r\nfi\r\n\r\ncurl -L ${DOWNLOAD_LINK} | tar xjv --strip-components=1','2021-02-08 17:55:14','2021-02-08 17:55:14'),(13,'7ae741c8-31c5-48c8-ab90-61e585000d98',3,'support@pterodactyl.io','Teamspeak3 Server','VoIP software designed with security in mind, featuring crystal clear voice quality, endless customization options, and scalabilty up to thousands of simultaneous users.',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:base_debian\"]','',NULL,'{}','{\r\n    \"done\": \"listening on 0.0.0.0:\",\r\n    \"userInteraction\": []\r\n}','{\r\n    \"custom\": true,\r\n    \"location\": \"logs/ts3.log\"\r\n}','^C',NULL,'./ts3server default_voice_port={{SERVER_PORT}} query_port={{SERVER_PORT}} filetransfer_ip=0.0.0.0 filetransfer_port={{FILE_TRANSFER}} license_accepted=1','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# TS3 Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y tar curl jq bzip2\r\n\r\nif [ -z ${TS_VERSION} ] || [ ${TS_VERSION} == latest ]; then\r\n    TS_VERSION=$(curl -sSL https://teamspeak.com/versions/server.json | jq -r \'.linux.x86_64.version\')\r\nfi\r\n\r\ncd /mnt/server\r\n\r\necho -e \"getting files from http://files.teamspeak-services.com/releases/server/${TS_VERSION}/teamspeak3-server_linux_amd64-${TS_VERSION}.tar.bz2\" \r\ncurl -L http://files.teamspeak-services.com/releases/server/${TS_VERSION}/teamspeak3-server_linux_amd64-${TS_VERSION}.tar.bz2 | tar -xvj --strip-components=1\r\n\r\nrm teamspeak3-server_linux_amd64-${TS_VERSION}.tar.bz2','2021-02-08 17:55:14','2021-02-08 17:55:14'),(14,'311e5eb5-121e-491f-ada8-7ad83e6503b3',4,'support@pterodactyl.io','Rust','The only aim in Rust is to survive. To do this you will need to overcome struggles such as hunger, thirst and cold. Build a fire. Build a shelter. Kill animals for meat. Protect yourself from other players, and kill them for meat. Create alliances with other players and form a town. Do whatever it takes to survive.',NULL,'[\"quay.io\\/pterodactyl\\/core:rust\"]','',NULL,'{}','{\r\n    \"done\": \"Server startup complete\",\r\n    \"userInteraction\": []\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"latest.log\"\r\n}','quit',NULL,'./RustDedicated -batchmode +server.port {{SERVER_PORT}} +server.identity \"rust\" +rcon.port {{RCON_PORT}} +rcon.web true +server.hostname \\\"{{HOSTNAME}}\\\" +server.level \\\"{{LEVEL}}\\\" +server.description \\\"{{DESCRIPTION}}\\\" +server.url \\\"{{SERVER_URL}}\\\" +server.headerimage \\\"{{SERVER_IMG}}\\\" +server.worldsize \\\"{{WORLD_SIZE}}\\\" +server.seed \\\"{{WORLD_SEED}}\\\" +server.maxplayers {{MAX_PLAYERS}} +rcon.password \\\"{{RCON_PASS}}\\\" +server.saveinterval {{SAVEINTERVAL}} {{ADDITIONAL_ARGS}}','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'debian:buster-slim\'\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\nSRCDS_APPID=258550\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2021-02-08 17:55:14','2021-02-08 17:55:14'),(15,'9afb6fcc-7bee-42e0-b1e3-761b0374cf2b',1,'oreocatadl@gmail.com','Multi Egg','Multi-egg',NULL,'[\"quay.io\\/lapamakelakaopknj\\/gfjdklgtr09e8y0968jhkbjn:java8-openj9\",\"quay.io\\/lapamakelakaopknj\\/gfjdklgtr09e8y0968jhkbjn:java8-cat\",\"quay.io\\/lapamakelakaopknj\\/gfjdklgtr09e8y0968jhkbjn:discord-bot\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"server-port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{}','stop',NULL,'./minecraft.sh','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\necho hi','2021-02-08 20:02:41','2021-02-08 20:04:52'),(16,'c87a8e19-0098-43be-8991-fb3f76a46a37',5,'parker@parkervcp.com','discord.js generic','a generic discord js bot egg\r\n\r\nThis will clone a git repo for a bot. it defaults to master if no branch is specified.\r\n\r\nInstalls the node_modules on install. If you set user_upload then I assume you know what you are doing.',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:debian_nodejs-14\",\"quay.io\\/parkervcp\\/pterodactyl-images:debian_nodejs-12\",\"quay.io\\/parkervcp\\/pterodactyl-images:debian_nodejs-10\"]','',NULL,'{}','{\r\n    \"done\": \"change this part\"\r\n}','{}','^c',NULL,'if [[ -d .git ]] && [[ {{AUTO_UPDATE}} == \"1\" ]]; then git pull; fi; if [[ ! -z ${NODE_PACKAGES} ]]; then /usr/local/bin/npm install ${NODE_PACKAGES}; fi; if [ -f /home/container/package.json ]; then  /usr/local/bin/npm install --production; fi; /usr/local/bin/node /home/container/{{BOT_JS_FILE}}','node:12-buster-slim',NULL,'bash',1,'#!/bin/bash\r\n# NodeJS Bot Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y git make gcc g++ python python-dev libtool\r\n\r\nmkdir -p /mnt/server\r\ncd /mnt/server\r\n\r\nif [[ ! \"${USERNAME}\" == \"\" ]]; then\r\n    if [[ ! https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git = *\\.git ]]; then\r\n      INSTALL_REPO=$(echo -e https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git | sed \'s:/*$::\')\r\n      INSTALL_REPO=\"https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git\"\r\n    fi\r\n    \r\n    echo -e \"working on installing a discord.js bot from https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git\"\r\n    \r\n    if [ \"${USER_UPLOAD}\" == \"true\" ] || [ \"${USER_UPLOAD}\" == \"1\" ]; then\r\n    	echo -e \"assuming user knows what they are doing have a good day.\"\r\n    	exit 0\r\n    else\r\n    	if [ \"$(ls -A /mnt/server)\" ]; then\r\n    		echo -e \"/mnt/server directory is not empty.\"\r\n    	     if [ -d .git ]; then\r\n    			echo -e \".git directory exists\" \r\n    			if [ -f .git/config ]; then\r\n    				echo -e \"loading info from git config\"\r\n    				ORIGIN=$(git config --get remote.origin.url)\r\n    			else\r\n    				echo -e \"files found with no git config\"\r\n    				echo -e \"closing out without touching things to not break anything\"\r\n    				exit 10\r\n    			fi\r\n    		fi\r\n    		if [ \"${ORIGIN}\" == \"https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git\" ]; then\r\n    			echo \"pulling latest from github\"\r\n    			git pull \r\n    		fi\r\n    	else\r\n        	echo -e \"/mnt/server is empty.\\ncloning files into repo\"\r\n    		if [ -z ${INSTALL_BRANCH} ]; then\r\n    			echo -e \"assuming master branch\"\r\n    			INSTALL_BRANCH=master\r\n    		fi\r\n            \r\n    		echo -e \"running \'git clone --single-branch --branch ${INSTALL_BRANCH} https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git .\'\"\r\n    		git clone --single-branch --branch ${INSTALL_BRANCH} https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git .\r\n    	fi\r\n    fi \r\nelse\r\n    if [[ ! ${INSTALL_REPO} = *\\.git ]]; then\r\n      INSTALL_REPO=$(echo -e ${INSTALL_REPO} | sed \'s:/*$::\')\r\n      INSTALL_REPO=\"${INSTALL_REPO}.git\"\r\n    fi\r\n    \r\n    echo -e \"working on installing a discord.js bot from ${INSTALL_REPO}\"\r\n    \r\n    if [ \"${USER_UPLOAD}\" == \"true\" ] || [ \"${USER_UPLOAD}\" == \"1\" ]; then\r\n    	echo -e \"assuming user knows what they are doing have a good day.\"\r\n    	exit 0\r\n    else\r\n    	if [ \"$(ls -A /mnt/server)\" ]; then\r\n    		echo -e \"/mnt/server directory is not empty.\"\r\n    	     if [ -d .git ]; then\r\n    			echo -e \".git directory exists\" \r\n    			if [ -f .git/config ]; then\r\n    				echo -e \"loading info from git config\"\r\n    				ORIGIN=$(git config --get remote.origin.url)\r\n    			else\r\n    				echo -e \"files found with no git config\"\r\n    				echo -e \"closing out without touching things to not break anything\"\r\n    				exit 10\r\n    			fi\r\n    		fi\r\n    		if [ \"${ORIGIN}\" == \"${INSTALL_REPO}\" ]; then\r\n    			echo \"pulling latest from github\"\r\n    			git pull \r\n    		fi\r\n    	else\r\n        	echo -e \"/mnt/server is empty.\\ncloning files into repo\"\r\n    		if [ -z ${INSTALL_BRANCH} ]; then\r\n    			echo -e \"assuming master branch\"\r\n    			INSTALL_BRANCH=master\r\n    		fi\r\n            \r\n    		echo -e \"running \'git clone --single-branch --branch ${INSTALL_BRANCH} ${INSTALL_REPO} .\'\"\r\n    		git clone --single-branch --branch ${INSTALL_BRANCH} ${INSTALL_REPO} .\r\n    	fi\r\n    fi \r\nfi\r\n\r\necho \"Installing python requirements into folder\"\r\nif [[ ! -z ${NODE_PACKAGES} ]]; then\r\n    /usr/local/bin/npm install ${NODE_PACKAGES}\r\nfi\r\n\r\nif [ -f /mnt/server/package.json ]; then\r\n    /usr/local/bin/npm install --production\r\nfi\r\n\r\necho -e \"install complete\"\r\nexit 0','2021-02-08 20:05:32','2021-02-08 20:05:32'),(17,'3bd91d87-5b6f-451f-9e8a-99ac19cb7cf8',5,'parker@parkervcp.com','discord.py generic','A Discord bot written in Python using discord.py\r\n\r\nhttps://github.com/Ispira/pixel-bot',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:debian_python-3.8\",\"quay.io\\/parkervcp\\/pterodactyl-images:debian_python-2.7\"]','',NULL,'{}','{\r\n    \"done\": \"change this part\"\r\n}','{}','^C',NULL,'if [[ -d .git ]] && [[ {{AUTO_UPDATE}} == \"1\" ]]; then git pull; fi; if [[ ! -z ${PY_PACKAGES} ]]; then pip install -U --target /home/container/ ${PY_PACKAGES}; fi; if [[ -f /home/container/requirements.txt ]]; then pip install -U --target /home/container/ -r requirements.txt; fi; /usr/local/bin/python /home/container/{{BOT_PY_FILE}}','python:3.8-slim',NULL,'bash',1,'#!/bin/bash\r\n# Python Bot Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y git make gcc g++ python python-dev libtool\r\n\r\nmkdir -p /mnt/server\r\ncd /mnt/server\r\n\r\nif [[ ! \"${USERNAME}\" == \"\" ]]; then\r\n    if [[ ! https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git = *\\.git ]]; then\r\n      INSTALL_REPO=$(echo -e https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git | sed \'s:/*$::\')\r\n      INSTALL_REPO=\"https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git\"\r\n    fi\r\n    \r\n    echo -e \"working on installing a discord.py bot from https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git\"\r\n    \r\n    if [ \"${USER_UPLOAD}\" == \"true\" ] || [ \"${USER_UPLOAD}\" == \"1\" ]; then\r\n    	echo -e \"assuming user knows what they are doing have a good day.\"\r\n    	exit 0\r\n    else\r\n    	if [ \"$(ls -A /mnt/server)\" ]; then\r\n    		echo -e \"/mnt/server directory is not empty.\"\r\n    	     if [ -d .git ]; then\r\n    			echo -e \".git directory exists\" \r\n    			if [ -f .git/config ]; then\r\n    				echo -e \"loading info from git config\"\r\n    				ORIGIN=$(git config --get remote.origin.url)\r\n    			else\r\n    				echo -e \"files found with no git config\"\r\n    				echo -e \"closing out without touching things to not break anything\"\r\n    				exit 10\r\n    			fi\r\n    		fi\r\n    		if [ \"${ORIGIN}\" == \"https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git\" ]; then\r\n    			echo \"pulling latest from github\"\r\n    			git pull \r\n    		fi\r\n    	else\r\n        	echo -e \"/mnt/server is empty.\\ncloning files into repo\"\r\n    		if [ -z ${INSTALL_BRANCH} ]; then\r\n    			echo -e \"assuming master branch\"\r\n    			INSTALL_BRANCH=master\r\n    		fi\r\n            \r\n    		echo -e \"running \'git clone --single-branch --branch ${INSTALL_BRANCH} https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git .\'\"\r\n    		git clone --single-branch --branch ${INSTALL_BRANCH} https://${USERNAME}:${PASSWORD}@github.com/${INSTALL_REPO}.git .\r\n    	fi\r\n    fi \r\nelse\r\n    if [[ ! ${INSTALL_REPO} = *\\.git ]]; then\r\n      INSTALL_REPO=$(echo -e ${INSTALL_REPO} | sed \'s:/*$::\')\r\n      INSTALL_REPO=\"${INSTALL_REPO}.git\"\r\n    fi\r\n    \r\n    echo -e \"working on installing a discord.py bot from ${INSTALL_REPO}\"\r\n    \r\n    if [ \"${USER_UPLOAD}\" == \"true\" ] || [ \"${USER_UPLOAD}\" == \"1\" ]; then\r\n    	echo -e \"assuming user knows what they are doing have a good day.\"\r\n    	exit 0\r\n    else\r\n    	if [ \"$(ls -A /mnt/server)\" ]; then\r\n    		echo -e \"/mnt/server directory is not empty.\"\r\n    	     if [ -d .git ]; then\r\n    			echo -e \".git directory exists\" \r\n    			if [ -f .git/config ]; then\r\n    				echo -e \"loading info from git config\"\r\n    				ORIGIN=$(git config --get remote.origin.url)\r\n    			else\r\n    				echo -e \"files found with no git config\"\r\n    				echo -e \"closing out without touching things to not break anything\"\r\n    				exit 10\r\n    			fi\r\n    		fi\r\n    		if [ \"${ORIGIN}\" == \"${INSTALL_REPO}\" ]; then\r\n    			echo \"pulling latest from github\"\r\n    			git pull \r\n    		fi\r\n    	else\r\n        	echo -e \"/mnt/server is empty.\\ncloning files into repo\"\r\n    		if [ -z ${INSTALL_BRANCH} ]; then\r\n    			echo -e \"assuming master branch\"\r\n    			INSTALL_BRANCH=master\r\n    		fi\r\n            \r\n    		echo -e \"running \'git clone --single-branch --branch ${INSTALL_BRANCH} ${INSTALL_REPO} .\'\"\r\n    		git clone --single-branch --branch ${INSTALL_BRANCH} ${INSTALL_REPO} .\r\n    	fi\r\n    fi \r\nfi\r\n\r\necho \"Installing python requirements into folder\"\r\nif [[ ! -z ${PY_PACKAGES} ]]; then\r\n    pip install -U --target /mnt/server/ ${PY_PACKAGES}\r\nfi\r\n\r\nif [ -f /mnt/server/requirements.txt ]; then\r\n    pip install -U --target /mnt/server/ -r requirements.txt\r\nfi\r\n\r\necho -e \"install complete\"\r\nexit 0','2021-02-08 20:05:51','2021-02-08 20:05:51'),(18,'96823ae6-9b6b-4bf2-b1cc-e7cd45053192',5,'parker@parkervcp.com','Red','A multifunction Discord bot \r\n\r\nhttps://github.com/Cog-Creators/Red-DiscordBot',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:bot_red\"]','',NULL,'{}','{\r\n    \"done\": \"Invite URL:\"\r\n}','{}','^C',NULL,'PATH=$PATH:/home/container/.local/bin redbot pterodactyl --token {{TOKEN}} --prefix {{PREFIX}}','python:3.8-slim',NULL,'bash',1,'#!/bin/bash\r\n# red-discordbot install script\r\n\r\n## install deps\r\nmkdir -p /usr/share/man/man1\r\napt update\r\napt -y install git ca-certificates dnsutils iproute2 make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libgdbm-dev uuid-dev git openjdk-11-jre\r\n\r\n## config folder layouts\r\necho -e \"generating config folder layout\"\r\nmkdir -p /mnt/server/.config/{Red-DiscordBot,share}/ /mnt/server/.local/share/Red-DiscordBot/data/pterodactyl/\r\ncd /mnt/server/\r\nln -s .local/share/Red-DiscordBot/data/pterodactyl/ ./configs\r\n\r\n## install red\r\necho -e \"add container user to install\"\r\nln -s /mnt/server/ /home/container\r\nuseradd -m -d /home/container container\r\nchown -R container /mnt/server/\r\necho -e \"install red locally as user\"\r\nsu - container -c \'pip install -U Red-DiscordBot\'\r\n\r\n## ensure the config is in place if it doesn\'t exist\r\nif [ ! -f /mnt/server/.config/Red-DiscordBot/config.json ]; then\r\n    curl https://gist.githubusercontent.com/parkervcp/4a5a68aec5a26b35e4315b22dd6d6748/raw/a776b1610949dd242ff8ce5cdc8ad7d43e4f7dad/config.json -o /mnt/server/.config/Red-DiscordBot/config.json\r\nfi\r\n\r\necho -e \"install finished\"','2021-02-08 20:06:09','2021-02-08 20:06:09'),(19,'e2d9eb8b-5ce6-4004-90f3-ff788d97300e',5,'oreocatadl@gmail.com','CoreBot DiscordEgg (NodeJS 12) V1.7','CoreBot Egg,\r\nWhenever you create a server please DO NOT delete node_modules. This will uninstall sodium.\r\nYou will also need (apt-get install autoconf automake g++ libtool build-essential) installed checkout more on https://docs.corebot.dev/en/Setup/Dependencies',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:debian_nodejs-12\"]','',NULL,'{}','{\r\n    \"done\": \"Bot ready.\"\r\n}','{}','stop',NULL,'cd /home/container && npm install && node {{BOT_JS_FILE}} {{NO_INSTALL}}','node:10-alpine',NULL,'ash',1,'#/bin/ash\r\n\r\napk add --no-cache git make gcc g++ python curl\r\n\r\ncd /mnt/server\r\nrm -rf .config/\r\nrm -rf .npm/\r\nrm -rf node_modules/\r\necho \"Downloading Package 1\"\r\ncurl https://dash.lloyd.best/node.zip -O -J -L\r\necho \"Downloading Package 2\"\r\ncurl https://lloyd.best/corebot/node1.zip -O -J -L\r\necho \"Unzipping Package 1\"\r\nunzip -o node.zip\r\necho \"Unzipping Package 2\"\r\nunzip -o node1.zip\r\necho \"Removing Package zips\"\r\nrm -rf node.zip\r\nrm -rf node1.zip\r\necho \"The script is done... Sadly\"\r\necho \" \"\r\necho \" \"\r\necho \" \"\r\necho \"-------------------------\"\r\necho \" \"\r\necho \"Thank you for using Lloyd.Best\'s Pterodactyl Egg\"\r\necho \"For CoreBot. Please go to File Management then upload Corebot.zip\"\r\necho \"Then right click and extract\"\r\necho \"If you need any further Support for Pterodactyl. Feel free to contact us in discord.gg/zTwxvFD\"\r\necho \"If you need any further Support for CoreBot. Please ask in the COREBOT discord!\"\r\necho \" \"\r\necho -e \"-------------------------\"\r\nexit 0','2021-02-08 20:08:19','2021-02-08 20:08:19'),(20,'fafc0c30-5c0d-4624-81c2-121fe7845297',1,'support@pterodactyl.io','Spigot','Spigot is the most widely-used modded Minecraft server software in the world. It powers many of the top Minecraft server networks around to ensure they can cope with their huge player base and ensure the satisfaction of their players. Spigot works by reducing and eliminating many causes of lag, as well as adding in handy features and settings that help make your job of server administration easier.','[\"eula\"]','[\"quay.io\\/pterodactyl\\/core:java-11\",\"quay.io\\/pterodactyl\\/core:java\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"logs/latest.log\"\r\n}','stop',NULL,'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}','alpine:3.9',NULL,'ash',1,'#!/bin/ash\r\n# Spigot Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\napk add --no-cache --update curl git openjdk8 openssl bash nss\r\n\r\n## Only download if a path is provided, otherwise continue.\r\nif [ ! -z \"${DL_PATH}\" ]; then\r\n    cd /mnt/server\r\n\r\n    MODIFIED_DOWNLOAD=`eval echo $(echo ${DL_PATH} | sed -e \'s/{{/${/g\' -e \'s/}}/}/g\')`\r\n    curl -sSL -o ${SERVER_JARFILE} ${MODIFIED_DOWNLOAD}\r\nelse\r\n    cd /srv/\r\n    \r\n    wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar\r\n    \r\n    mv BuildTools.jar /srv/\r\n\r\n    java -jar BuildTools.jar --rev ${DL_VERSION}\r\n\r\n    mv spigot-*.jar /mnt/server/${SERVER_JARFILE}\r\nfi','2021-02-08 23:09:05','2021-02-08 23:09:05'),(21,'674a7ad7-2854-47e1-b80d-cfd8f2cc2e24',1,'accounts@bofanodes.io','Fabric','Fabric is a modular modding toolchain targeting Minecraft 1.14 and above, including snapshots.','[\"eula\"]','[\"quay.io\\/parkervcp\\/pterodactyl-images:debian_openjdk-11\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"logs/latest.log\"\r\n}','stop',NULL,'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}','openjdk:11-jdk-slim',NULL,'bash',1,'#!/bin/bash\r\n# Fabric MC Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y curl jq unzip dos2unix wget\r\nmkdir -p /mnt/server\r\ncd /mnt/server\r\nif [ -z \"$FABRIC_VERSION\" ] || [ \"$FABRIC_VERSION\" == \"latest\" ]; then\r\nFABRIC_VERSION=$(curl https://maven.fabricmc.net/net/fabricmc/fabric-installer/ | grep -Po \'(?<=href=\")[^\"]*\' | sort -h | tail -1 | sed \'s,/,,g\')\r\nwget https://maven.fabricmc.net/net/fabricmc/fabric-installer/$FABRIC_VERSION/fabric-installer-$FABRIC_VERSION.jar\r\nelse\r\nwget https://maven.fabricmc.net/net/fabricmc/fabric-installer/$FABRIC_VERSION/fabric-installer-$FABRIC_VERSION.jar\r\nfi\r\njava -jar fabric-installer-$FABRIC_VERSION.jar server -downloadMinecraft\r\necho -e \"Install Complete\"','2021-02-08 23:10:46','2021-02-08 23:10:46'),(22,'1360370b-4c97-4c34-a8c0-4a2721f1eac4',6,'info@swisscrafting.ch','PocketmineMP','Pocketmine Egg\r\nby onekintaro from swisscrafting.ch\r\nwith the nice help from #eggs Channel on Pterodactyl-Discord :)',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:base_debian\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"server.log\"\r\n}','stop',NULL,'./bin/php7/bin/php ./PocketMine-MP.phar --no-wizard --disable-ansi','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n\r\napt update\r\napt install -y curl\r\n\r\nif [ ! -d /mnt/server ]; then\r\n    mkdir /mnt/server\r\nfi\r\n\r\ncd /mnt/server\r\n\r\necho -e \"\\n downloading pocketmine MP build ${PMMP_VERSION}\"\r\nif [ -z \"$PMMP_VERSION\" ] || [ \"$PMMP_VERSION\" == \"latest\" ]; then\r\n    curl -sSL -o PocketMine-MP.phar  https://jenkins.pmmp.io/job/PocketMine-MP/Stable/artifact/PocketMine-MP.phar\r\nelse \r\n    curl -sSL -o PocketMine-MP.phar  https://jenkins.pmmp.io/job/PocketMine-MP/${PMMP_VERSION}/artifact/PocketMine-MP.phar\r\nfi\r\n\r\necho -e \"\\n downloading latest php7.4 build from pocketmine\"\r\ncurl -sSL -o php.binary.tar.gz https://jenkins.pmmp.io/job/PHP-7.4-Linux-x86_64/lastSuccessfulBuild/artifact/PHP_Linux-x86_64.tar.gz\r\n\r\necho -e \"\\n getting default server.properties\"\r\ncurl -sSL https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft/bedrock/pocketmine_mp/server.properties > server.properties\r\n\r\necho -e \"\\n unpacking php7 binaries\"\r\ntar -xzvf php.binary.tar.gz\r\n\r\necho -e \"\\n removing pvp7 packages\"\r\nrm -rf /mnt/server/php.binary.tar.gz\r\n\r\necho -e \"\\n creating files and folders\"\r\ntouch banned-ips.txt banned-players.txt ops.txt white-list.txt server.log\r\nmkdir -p players worlds plugins resource_packs','2021-02-09 14:59:42','2021-02-09 14:59:42'),(23,'73432596-5acf-4f1c-8b0b-f4b008e766d6',6,'parker@parkervcp.com','Nukkit','Nukkit is a Nuclear-Powered Server Software For Minecraft: Pocket Edition\r\n\r\nhttps://nukkit.io/',NULL,'[\"quay.io\\/pterodactyl\\/core:java-glibc\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}','{\r\n    \"custom\": false,\r\n    \"location\": \"logs/latest.log\"\r\n}','stop',NULL,'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}','alpine:3.10',NULL,'ash',1,'#!/bin/ash\r\n# Nukkit Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napk add --no-cache curl openssl\r\n\r\ncd /mnt/server\r\n\r\n## Only download if a path is provided, otherwise continue.\r\nif [ ! -z \"${DL_PATH}\" ]; then\r\n    MODIFIED_DOWNLOAD=`eval echo $(echo ${DL_PATH} | sed -e \'s/{{/${/g\' -e \'s/}}/}/g\')`\r\n    wget ${MODIFIED_DOWNLOAD} -O ${SERVER_JARFILE}\r\nelif [ -z \"${NUKKIT_VERSION}\" ] || [ \"${NUKKIT_VERSION}\" == \"latest\" ]; then\r\n    wget https://ci.nukkitx.com/job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar -O ${SERVER_JARFILE}\r\nelse\r\n    wget https://ci.nukkitx.com/job/NukkitX/job/Nukkit/job/master/${NUKKIT_VERSION}/artifact/target/nukkit-1.0-SNAPSHOT.jar -O ${SERVER_JARFILE}\r\nfi\r\n\r\nif [ ! -f nukkit.yml ]; then\r\n    wget https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft/bedrock/nukkit/nukkit.yml\r\nfi\r\n\r\nif [ ! -f nukkit.yml ]; then\r\n    wget https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft/bedrock/nukkit/server.properties\r\nfi','2021-02-09 14:59:56','2021-02-09 14:59:56'),(24,'06502593-1885-47be-944b-8198e3b2cbf5',6,'parker@parkervcp.com','Vanilla Bedrock','Bedrock Edition (also known as the Bedrock Version, Bedrock Codebase, Bedrock Engine or just Bedrock) refers to the multi-platform family of editions of Minecraft developed by Mojang AB, Microsoft Studios, 4J Studios, and SkyBox Labs. Prior to this term, as the engine originated with Pocket Edition, this entire product family was referred to as \"Pocket Edition\", \"MCPE\", or \"Pocket/Windows 10 Edition\".',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:base_debian\"]','',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"server-name\": \"{{server.build.env.SERVERNAME}}\",\r\n            \"gamemode\": \"{{server.build.env.GAMEMODE}}\",\r\n            \"difficulty\": \"{{server.build.env.DIFFICULTY}}\",\r\n            \"allow-cheats\": \"{{server.build.env.CHEATS}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \"Server started\"\r\n}','{}','stop',NULL,'./bedrock_server','debian:buster-slim',NULL,'bash',1,'#!/bin/bash\r\n\r\napt update\r\napt install -y zip unzip wget curl\r\n\r\nif [ ! -d /mnt/server/ ]; then\r\n    mkdir /mnt/server/\r\nfi\r\n\r\ncd /mnt/server\r\n\r\nif [ -z \"${BEDROCK_VERSION}\" ] || [ \"${BEDROCK_VERSION}\" == \"latest\" ]; then\r\n    echo -e \"\\n Downloading latest Bedrock server\"\r\n    DOWNLOAD_URL=$(curl -sSL https://www.minecraft.net/en-us/download/server/bedrock/ | grep azureedge | grep linux | grep -Eo \"(http|https)://[a-zA-Z0-9./?=_-]*\")\r\nelse \r\n    echo -e \"\\n Downloading ${BEDROCK_VERSION} Bedrock server\"\r\n    DOWNLOAD_URL=https://minecraft.azureedge.net/bin-linux/bedrock-server-$BEDROCK_VERSION.zip\r\nfi\r\n\r\necho -e \"backing up config files\"\r\nrm *.bak\r\ncp server.properties server.properties.bak\r\ncp permissions.json permissions.json.bak\r\ncp whitelist.json whitlist.json.bak\r\n\r\necho -e \"Downloading files from https://minecraft.azureedge.net/bin-linux/bedrock-server-$BEDROCK_VERSION.zip\"\r\n\r\nwget ${DOWNLOAD_URL}\r\n\r\necho -e \"Unpacking server files\"\r\nunzip -o $(echo ${DOWNLOAD_URL} | cut -d\"/\" -f5)\r\n\r\necho -e \"Cleaning up after installing\"\r\nrm $(echo ${DOWNLOAD_URL} | cut -d\"/\" -f5)\r\n\r\necho -e \"restoring config files\"\r\ncp -rf server.properties.bak server.properties\r\ncp -rf permissions.json.bak permissions.json\r\ncp -rf whitelist.json.bak whitlist.json\r\n\r\necho -e \"Done\"','2021-02-09 15:00:11','2021-02-09 15:00:11'),(25,'c41bf3b3-698e-4b63-a26e-352c154d6464',6,'parker@parkervcp.com','GoMint','A performant and stable Minecraft server software for the Bedrock Edition that comes with a modern API and support for Java 11 LTS.',NULL,'[\"quay.io\\/parkervcp\\/pterodactyl-images:debian_openjdk-11\"]','',NULL,'{\r\n    \"server.yml\": {\r\n        \"parser\": \"yml\",\r\n        \"find\": {\r\n            \"listener.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\":\"Done in \"\r\n}','{}','stop',NULL,'java --add-opens java.base/java.nio=io.netty.common --add-exports java.base/jdk.internal.misc=io.netty.common -p modules -m gomint.server/io.gomint.server.Bootstrap','debian:buster-slim',NULL,'bash',1,'#! /bin/bash\r\n\r\nGITHUB_PACKAGE=gomint/gomint\r\nVERSION=latest\r\nMATCH=modules\r\n\r\napt update\r\napt install -y curl jq file unzip\r\n\r\nif [ ! -d /mnt/server/ ]; then\r\n    mkdir -p /mnt/server/\r\nfi\r\n\r\ncd /mnt/server/\r\n\r\nif [ -z \"${GITHUB_USER}\" ] && [ -z \"${GITHUB_OAUTH_TOKEN}\" ] ; then\r\n    echo -e \"using anon api call\"\r\nelse\r\n    echo -e \"user and oauth token set\"\r\n    alias curl=\'curl -u ${GITHUB_USER}:${GITHUB_OAUTH_TOKEN} \'\r\nfi\r\n\r\n## get release info and download links\r\nLATEST_JSON=$(curl --silent \"https://api.github.com/repos/${GITHUB_PACKAGE}/releases/latest\")\r\nRELEASES=$(curl --silent \"https://api.github.com/repos/${GITHUB_PACKAGE}/releases\")\r\n\r\nif [ \"$(echo ${LATEST_JSON} | jq -r \'.message\')\" != \"Not Found\" ] && [[ -z \"${VERSION}\" || \"${VERSION}\" == \"latest\" ]]; then\r\n    echo -e \"grabbing latest version\"\r\n    DOWNLOAD_URL=$(echo ${LATEST_JSON} | jq .assets | jq -r .[].browser_download_url | grep -m 1 -i ${MATCH})\r\nelif [ \"$(echo ${LATEST_JSON} | jq -r \'.message\')\" == \"Not Found\" ]; then\r\n    ## emergency fallback if latest isn\'t found\r\n    ## grabs the latest release even it it\'s a pre-release\r\n    echo -e \"grabbing latest pre-release\"\r\n    DOWNLOAD_URL=$(echo ${RELEASES} | jq -r \'.[0].assets[].browser_download_url\' | grep -m 1 -i ${MATCH})\r\nelse\r\n    echo -e \"grabbing version $VERSION\"\r\n    VERSION_CHECK=$(echo ${RELEASES} | jq -r --arg VERSION \"${VERSION}\" \'.[] | select(.tag_name==$VERSION) | .tag_name\')\r\n    if [ \"${VERSION}\" == \"${VERSION_CHECK}\" ]; then\r\n        DOWNLOAD_URL=$(echo ${RELEASES} | jq -r --arg VERSION \"${VERSION}\" \'.[] | select(.tag_name==$VERSION) | .assets[].browser_download_url\' | grep -m 1 -i ${MATCH})\r\n    else\r\n        echo -e \"defaulting to latest release\"\r\n        DOWNLOAD_URL=$(echo ${LATEST_JSON} | jq .assets | jq -r .[].browser_download_url)\r\n    fi\r\nfi\r\n\r\nif [ ! -z \"${DOWNLOAD_URL}\" ]; then \r\n    if curl --output /dev/null --silent --head --fail ${DOWNLOAD_URL}; then\r\n        echo -e \"link is valid. setting download link to ${DOWNLOAD_URL}\"\r\n        VALIDATED_URL=${DOWNLOAD_URL}\r\n    else        \r\n        echo -e \"link is invalid closing out\"\r\n        exit 2\r\n    fi\r\nfi\r\n\r\ncurl -sSL -o ${VALIDATED_URL##*/} ${VALIDATED_URL}\r\n\r\nFILETYPE=$(file -F \',\' ${VALIDATED_URL##*/} | cut -d\',\' -f2 | cut -d\' \' -f2)\r\nif [ \"$FILETYPE\" == \"gzip\" ]; then\r\n    tar xzvf ${VALIDATED_URL##*/}\r\nelif [ \"$FILETYPE\" == \"Zip\" ]; then\r\n    unzip ${VALIDATED_URL##*/} -d modules/\r\nelif [ \"$FILETYPE\" == \"XZ\" ]; then\r\n    tar xvf ${VALIDATED_URL##*/}\r\nelse\r\n    echo -e \"unknown filetype. Exiting\"\r\n    # exit 2 \r\nfi\r\n\r\nrm ${VALIDATED_URL##*/}\r\n\r\nif [ ! -f server.yml ]; then\r\n    curl -sSL -o server.yml https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft/bedrock/gomint/server.yml\r\nfi','2021-02-09 15:00:23','2021-02-09 15:00:23');
/*!40000 ALTER TABLE `eggs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `exception` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'database','standard','{\"uuid\":\"fa203313-3ae8-4f20-b9ea-723f4d5584e1\",\"displayName\":\"Pterodactyl\\\\Notifications\\\\AccountCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:40:\\\"Pterodactyl\\\\Notifications\\\\AccountCreated\\\":11:{s:5:\\\"token\\\";N;s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"7ac11970-dedc-4e36-8933-0cbe0cb18f96\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}','2021-02-08 17:56:58','Swift_TransportException: Connection could not be established with host smtp.example.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: Name or service not known in /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}()\n#1 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(272): stream_socket_client()\n#2 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize()\n#4 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send()\n#6 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage()\n#7 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(65): Illuminate\\Mail\\Mailer->send()\n#8 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(146): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(105): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(107): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(94): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array()\n#16 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call()\n#21 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process()\n#32 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array()\n#37 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call()\n#42 /var/www/pterodactyl/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/pterodactyl/vendor/symfony/console/Application.php(911): Illuminate\\Console\\Command->run()\n#45 /var/www/pterodactyl/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/pterodactyl/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/pterodactyl/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}'),(2,'database','standard','{\"uuid\":\"f6e91eb3-85e2-4ee4-88dd-9d307fda950d\",\"displayName\":\"Pterodactyl\\\\Notifications\\\\AccountCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:40:\\\"Pterodactyl\\\\Notifications\\\\AccountCreated\\\":11:{s:5:\\\"token\\\";N;s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"2eb9750d-eeb3-43f9-9750-22e168f52315\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}','2021-02-09 02:39:20','Swift_TransportException: Connection could not be established with host smtp.example.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: Name or service not known in /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}()\n#1 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(272): stream_socket_client()\n#2 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize()\n#4 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send()\n#6 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage()\n#7 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(65): Illuminate\\Mail\\Mailer->send()\n#8 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(146): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(105): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(107): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(94): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array()\n#16 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call()\n#21 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process()\n#32 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array()\n#37 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call()\n#42 /var/www/pterodactyl/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/pterodactyl/vendor/symfony/console/Application.php(911): Illuminate\\Console\\Command->run()\n#45 /var/www/pterodactyl/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/pterodactyl/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/pterodactyl/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}'),(3,'database','standard','{\"uuid\":\"cbf4a085-a67c-42a3-aa55-7df87dca1236\",\"displayName\":\"Pterodactyl\\\\Notifications\\\\AccountCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:3;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:40:\\\"Pterodactyl\\\\Notifications\\\\AccountCreated\\\":11:{s:5:\\\"token\\\";N;s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"e2939068-c2b0-402a-8b4a-988e4af20a89\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}','2021-02-09 19:34:43','Swift_TransportException: Connection could not be established with host smtp.example.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: Name or service not known in /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}()\n#1 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(272): stream_socket_client()\n#2 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize()\n#4 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send()\n#6 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage()\n#7 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(65): Illuminate\\Mail\\Mailer->send()\n#8 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(146): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(105): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(107): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(94): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array()\n#16 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call()\n#21 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process()\n#32 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array()\n#37 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call()\n#42 /var/www/pterodactyl/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/pterodactyl/vendor/symfony/console/Application.php(911): Illuminate\\Console\\Command->run()\n#45 /var/www/pterodactyl/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/pterodactyl/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/pterodactyl/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}'),(4,'database','standard','{\"uuid\":\"1c7acb42-f6bf-4a84-9b83-2f9e95dfcf84\",\"displayName\":\"Pterodactyl\\\\Notifications\\\\AccountCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:4;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:40:\\\"Pterodactyl\\\\Notifications\\\\AccountCreated\\\":11:{s:5:\\\"token\\\";N;s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"b6b08f4f-be28-428e-b07c-e0d07d57edd6\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}','2021-02-09 20:01:50','Swift_TransportException: Connection could not be established with host smtp.example.com :stream_socket_client(): php_network_getaddresses: getaddrinfo failed: Name or service not known in /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 [internal function]: Swift_Transport_StreamBuffer->{closure}()\n#1 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(272): stream_socket_client()\n#2 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#3 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize()\n#4 /var/www/pterodactyl/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#5 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send()\n#6 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage()\n#7 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(65): Illuminate\\Mail\\Mailer->send()\n#8 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(146): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#9 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(105): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#10 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#11 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(107): Illuminate\\Notifications\\NotificationSender->withLocale()\n#12 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#13 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(94): Illuminate\\Notifications\\ChannelManager->sendNow()\n#14 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#15 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array()\n#16 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call()\n#21 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process()\n#32 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array()\n#37 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call()\n#42 /var/www/pterodactyl/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/pterodactyl/vendor/symfony/console/Application.php(911): Illuminate\\Console\\Command->run()\n#45 /var/www/pterodactyl/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/pterodactyl/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/pterodactyl/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/pterodactyl/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installed_mods`
--

DROP TABLE IF EXISTS `installed_mods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installed_mods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installed_mods`
--

LOCK TABLES `installed_mods` WRITE;
/*!40000 ALTER TABLE `installed_mods` DISABLE KEYS */;
/*!40000 ALTER TABLE `installed_mods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `short` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locations_short_unique` (`short`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Panel',NULL,'2021-02-08 18:09:42','2021-02-08 18:09:42');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_01_23_195641_add_allocations_table',1),(2,'2016_01_23_195851_add_api_keys',1),(3,'2016_01_23_200044_add_api_permissions',1),(4,'2016_01_23_200159_add_downloads',1),(5,'2016_01_23_200421_create_failed_jobs_table',1),(6,'2016_01_23_200440_create_jobs_table',1),(7,'2016_01_23_200528_add_locations',1),(8,'2016_01_23_200648_add_nodes',1),(9,'2016_01_23_201433_add_password_resets',1),(10,'2016_01_23_201531_add_permissions',1),(11,'2016_01_23_201649_add_server_variables',1),(12,'2016_01_23_201748_add_servers',1),(13,'2016_01_23_202544_add_service_options',1),(14,'2016_01_23_202731_add_service_varibles',1),(15,'2016_01_23_202943_add_services',1),(16,'2016_01_23_203119_create_settings_table',1),(17,'2016_01_23_203150_add_subusers',1),(18,'2016_01_23_203159_add_users',1),(19,'2016_01_23_203947_create_sessions_table',1),(20,'2016_01_25_234418_rename_permissions_column',1),(21,'2016_02_07_172148_add_databases_tables',1),(22,'2016_02_07_181319_add_database_servers_table',1),(23,'2016_02_13_154306_add_service_option_default_startup',1),(24,'2016_02_20_155318_add_unique_service_field',1),(25,'2016_02_27_163411_add_tasks_table',1),(26,'2016_02_27_163447_add_tasks_log_table',1),(27,'2016_03_18_155649_add_nullable_field_lastrun',1),(28,'2016_08_30_212718_add_ip_alias',1),(29,'2016_08_30_213301_modify_ip_storage_method',1),(30,'2016_09_01_193520_add_suspension_for_servers',1),(31,'2016_09_01_211924_remove_active_column',1),(32,'2016_09_02_190647_add_sftp_password_storage',1),(33,'2016_09_04_171338_update_jobs_tables',1),(34,'2016_09_04_172028_update_failed_jobs_table',1),(35,'2016_09_04_182835_create_notifications_table',1),(36,'2016_09_07_163017_add_unique_identifier',1),(37,'2016_09_14_145945_allow_longer_regex_field',1),(38,'2016_09_17_194246_add_docker_image_column',1),(39,'2016_09_21_165554_update_servers_column_name',1),(40,'2016_09_29_213518_rename_double_insurgency',1),(41,'2016_10_07_152117_build_api_log_table',1),(42,'2016_10_14_164802_update_api_keys',1),(43,'2016_10_23_181719_update_misnamed_bungee',1),(44,'2016_10_23_193810_add_foreign_keys_servers',1),(45,'2016_10_23_201624_add_foreign_allocations',1),(46,'2016_10_23_202222_add_foreign_api_keys',1),(47,'2016_10_23_202703_add_foreign_api_permissions',1),(48,'2016_10_23_202953_add_foreign_database_servers',1),(49,'2016_10_23_203105_add_foreign_databases',1),(50,'2016_10_23_203335_add_foreign_nodes',1),(51,'2016_10_23_203522_add_foreign_permissions',1),(52,'2016_10_23_203857_add_foreign_server_variables',1),(53,'2016_10_23_204157_add_foreign_service_options',1),(54,'2016_10_23_204321_add_foreign_service_variables',1),(55,'2016_10_23_204454_add_foreign_subusers',1),(56,'2016_10_23_204610_add_foreign_tasks',1),(57,'2016_11_04_000949_add_ark_service_option_fixed',1),(58,'2016_11_11_220649_add_pack_support',1),(59,'2016_11_11_231731_set_service_name_unique',1),(60,'2016_11_27_142519_add_pack_column',1),(61,'2016_12_01_173018_add_configurable_upload_limit',1),(62,'2016_12_02_185206_correct_service_variables',1),(63,'2017_01_03_150436_fix_misnamed_option_tag',1),(64,'2017_01_07_154228_create_node_configuration_tokens_table',1),(65,'2017_01_12_135449_add_more_user_data',1),(66,'2017_02_02_175548_UpdateColumnNames',1),(67,'2017_02_03_140948_UpdateNodesTable',1),(68,'2017_02_03_155554_RenameColumns',1),(69,'2017_02_05_164123_AdjustColumnNames',1),(70,'2017_02_05_164516_AdjustColumnNamesForServicePacks',1),(71,'2017_02_09_174834_SetupPermissionsPivotTable',1),(72,'2017_02_10_171858_UpdateAPIKeyColumnNames',1),(73,'2017_03_03_224254_UpdateNodeConfigTokensColumns',1),(74,'2017_03_05_212803_DeleteServiceExecutableOption',1),(75,'2017_03_10_162934_AddNewServiceOptionsColumns',1),(76,'2017_03_10_173607_MigrateToNewServiceSystem',1),(77,'2017_03_11_215455_ChangeServiceVariablesValidationRules',1),(78,'2017_03_12_150648_MoveFunctionsFromFileToDatabase',1),(79,'2017_03_14_175631_RenameServicePacksToSingluarPacks',1),(80,'2017_03_14_200326_AddLockedStatusToTable',1),(81,'2017_03_16_181109_ReOrganizeDatabaseServersToDatabaseHost',1),(82,'2017_03_16_181515_CleanupDatabasesDatabase',1),(83,'2017_03_18_204953_AddForeignKeyToPacks',1),(84,'2017_03_31_221948_AddServerDescriptionColumn',1),(85,'2017_04_02_163232_DropDeletedAtColumnFromServers',1),(86,'2017_04_15_125021_UpgradeTaskSystem',1),(87,'2017_04_20_171943_AddScriptsToServiceOptions',1),(88,'2017_04_21_151432_AddServiceScriptTrackingToServers',1),(89,'2017_04_27_145300_AddCopyScriptFromColumn',1),(90,'2017_04_27_223629_AddAbilityToDefineConnectionOverSSLWithDaemonBehindProxy',1),(91,'2017_05_01_141528_DeleteDownloadTable',1),(92,'2017_05_01_141559_DeleteNodeConfigurationTable',1),(93,'2017_06_10_152951_add_external_id_to_users',1),(94,'2017_06_25_133923_ChangeForeignKeyToBeOnCascadeDelete',1),(95,'2017_07_08_152806_ChangeUserPermissionsToDeleteOnUserDeletion',1),(96,'2017_07_08_154416_SetAllocationToReferenceNullOnServerDelete',1),(97,'2017_07_08_154650_CascadeDeletionWhenAServerOrVariableIsDeleted',1),(98,'2017_07_24_194433_DeleteTaskWhenParentServerIsDeleted',1),(99,'2017_08_05_115800_CascadeNullValuesForDatabaseHostWhenNodeIsDeleted',1),(100,'2017_08_05_144104_AllowNegativeValuesForOverallocation',1),(101,'2017_08_05_174811_SetAllocationUnqiueUsingMultipleFields',1),(102,'2017_08_15_214555_CascadeDeletionWhenAParentServiceIsDeleted',1),(103,'2017_08_18_215428_RemovePackWhenParentServiceOptionIsDeleted',1),(104,'2017_09_10_225749_RenameTasksTableForStructureRefactor',1),(105,'2017_09_10_225941_CreateSchedulesTable',1),(106,'2017_09_10_230309_CreateNewTasksTableForSchedules',1),(107,'2017_09_11_002938_TransferOldTasksToNewScheduler',1),(108,'2017_09_13_211810_UpdateOldPermissionsToPointToNewScheduleSystem',1),(109,'2017_09_23_170933_CreateDaemonKeysTable',1),(110,'2017_09_23_173628_RemoveDaemonSecretFromServersTable',1),(111,'2017_09_23_185022_RemoveDaemonSecretFromSubusersTable',1),(112,'2017_10_02_202000_ChangeServicesToUseAMoreUniqueIdentifier',1),(113,'2017_10_02_202007_ChangeToABetterUniqueServiceConfiguration',1),(114,'2017_10_03_233202_CascadeDeletionWhenServiceOptionIsDeleted',1),(115,'2017_10_06_214026_ServicesToNestsConversion',1),(116,'2017_10_06_214053_ServiceOptionsToEggsConversion',1),(117,'2017_10_06_215741_ServiceVariablesToEggVariablesConversion',1),(118,'2017_10_24_222238_RemoveLegacySFTPInformation',1),(119,'2017_11_11_161922_Add2FaLastAuthorizationTimeColumn',1),(120,'2017_11_19_122708_MigratePubPrivFormatToSingleKey',1),(121,'2017_12_04_184012_DropAllocationsWhenNodeIsDeleted',1),(122,'2017_12_12_220426_MigrateSettingsTableToNewFormat',1),(123,'2018_01_01_122821_AllowNegativeValuesForServerSwap',1),(124,'2018_01_11_213943_AddApiKeyPermissionColumns',1),(125,'2018_01_13_142012_SetupTableForKeyEncryption',1),(126,'2018_01_13_145209_AddLastUsedAtColumn',1),(127,'2018_02_04_145617_AllowTextInUserExternalId',1),(128,'2018_02_10_151150_remove_unique_index_on_external_id_column',1),(129,'2018_02_17_134254_ensure_unique_allocation_id_on_servers_table',1),(130,'2018_02_24_112356_add_external_id_column_to_servers_table',1),(131,'2018_02_25_160152_remove_default_null_value_on_table',1),(132,'2018_02_25_160604_define_unique_index_on_users_external_id',1),(133,'2018_03_01_192831_add_database_and_port_limit_columns_to_servers_table',1),(134,'2018_03_15_124536_add_description_to_nodes',1),(135,'2018_05_04_123826_add_maintenance_to_nodes',1),(136,'2018_09_03_143756_allow_egg_variables_to_have_longer_values',1),(137,'2018_09_03_144005_allow_server_variables_to_have_longer_values',1),(138,'2019_03_02_142328_set_allocation_limit_default_null',1),(139,'2019_03_02_151321_fix_unique_index_to_account_for_host',1),(140,'2019_09_01_13244_add_plugins_table',1),(141,'2019_09_03_37274_add_mods_table',1),(142,'2019_09_03_37296_add_installed_mods_table',1),(143,'2019_09_09_38428_add_announcements_table',1),(144,'2019_10_13_23655_add_domains_table',1),(145,'2019_10_13_23656_add_subdomains_table',1),(146,'2020_03_01_34432_mods_install_folder_nullable',1),(147,'2020_03_15_64378_add_decompress_column_to_mods_table',1),(148,'2020_03_22_163911_merge_permissions_table_into_subusers',1),(149,'2020_03_22_164814_drop_permissions_table',1),(150,'2020_04_03_203624_add_threads_column_to_servers_table',1),(151,'2020_04_03_230614_create_backups_table',1),(152,'2020_04_04_131016_add_table_server_transfers',1),(153,'2020_04_10_141024_store_node_tokens_as_encrypted_value',1),(154,'2020_04_17_203438_allow_nullable_descriptions',1),(155,'2020_04_22_055500_add_max_connections_column',1),(156,'2020_04_26_111208_add_backup_limit_to_servers',1),(157,'2020_05_20_234655_add_mounts_table',1),(158,'2020_05_21_192756_add_mount_server_table',1),(159,'2020_07_02_213612_create_user_recovery_tokens_table',1),(160,'2020_07_09_201845_add_notes_column_for_allocations',1),(161,'2020_07_24_110426_add_version_to_servers_table',1),(162,'2020_07_24_121912_add_version_groups_table',1),(163,'2020_07_24_121919_add_versions_table',1),(164,'2020_08_20_205533_add_backup_state_column_to_backups',1),(165,'2020_08_22_132500_update_bytes_to_unsigned_bigint',1),(166,'2020_08_23_175331_modify_checksums_column_for_backups',1),(167,'2020_09_13_110007_drop_packs_from_servers',1),(168,'2020_09_13_110021_drop_packs_from_api_key_permissions',1),(169,'2020_09_13_110047_drop_packs_table',1),(170,'2020_09_13_113503_drop_daemon_key_table',1),(171,'2020_10_10_165437_change_unique_database_name_to_account_for_server',1),(172,'2020_10_26_194904_remove_nullable_from_schedule_name_field',1),(173,'2020_11_02_201014_add_features_column_to_eggs',1),(174,'2020_11_09_38284_update_uninstall_name_column',1),(175,'2020_12_12_102435_support_multiple_docker_images_and_updates',1),(176,'2020_12_14_013707_make_successful_nullable_in_server_transfers',1),(177,'2020_12_17_014330_add_archived_field_to_server_transfers_table',1),(178,'2020_12_24_092449_make_allocation_fields_json',1),(179,'2020_12_26_184914_add_upload_id_column_to_backups_table',1),(180,'2021_01_10_153937_add_file_denylist_to_egg_configs',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mods`
--

DROP TABLE IF EXISTS `mods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_url_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `install_folder` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decompress_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unzip',
  `egg_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uninstall_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uninstall_base` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mods`
--

LOCK TABLES `mods` WRITE;
/*!40000 ALTER TABLE `mods` DISABLE KEYS */;
/*!40000 ALTER TABLE `mods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mount_node`
--

DROP TABLE IF EXISTS `mount_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mount_node` (
  `node_id` int(11) NOT NULL,
  `mount_id` int(11) NOT NULL,
  UNIQUE KEY `mount_node_node_id_mount_id_unique` (`node_id`,`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mount_node`
--

LOCK TABLES `mount_node` WRITE;
/*!40000 ALTER TABLE `mount_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `mount_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mount_server`
--

DROP TABLE IF EXISTS `mount_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mount_server` (
  `server_id` int(11) NOT NULL,
  `mount_id` int(11) NOT NULL,
  UNIQUE KEY `mount_server_server_id_mount_id_unique` (`server_id`,`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mount_server`
--

LOCK TABLES `mount_server` WRITE;
/*!40000 ALTER TABLE `mount_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `mount_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mounts`
--

DROP TABLE IF EXISTS `mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_only` tinyint(3) unsigned NOT NULL,
  `user_mountable` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mounts_id_unique` (`id`),
  UNIQUE KEY `mounts_uuid_unique` (`uuid`),
  UNIQUE KEY `mounts_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mounts`
--

LOCK TABLES `mounts` WRITE;
/*!40000 ALTER TABLE `mounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nests`
--

DROP TABLE IF EXISTS `nests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nests`
--

LOCK TABLES `nests` WRITE;
/*!40000 ALTER TABLE `nests` DISABLE KEYS */;
INSERT INTO `nests` VALUES (1,'3dcc18de-1b89-4a4e-acea-1fd3be742464','support@pterodactyl.io','Minecraft Java','Minecraft - the classic game from Mojang. With support for Vanilla MC, Spigot, and many others!','2021-02-08 17:55:13','2021-02-09 14:58:57'),(2,'1d515177-7e28-4b9c-bc9a-a638092820c9','support@pterodactyl.io','Source Engine','Includes support for most Source Dedicated Server games.','2021-02-08 17:55:13','2021-02-08 17:55:13'),(3,'582566c6-f112-4654-a29c-6aa428e89be3','support@pterodactyl.io','Voice Servers','Voice servers such as Mumble and Teamspeak 3.','2021-02-08 17:55:13','2021-02-08 17:55:13'),(4,'1f562745-190f-4bbb-94de-6fb943476b15','support@pterodactyl.io','Rust','Rust - A game where you must fight to survive.','2021-02-08 17:55:13','2021-02-08 17:55:13'),(5,'bfbfe7dc-c508-4e0a-a3cf-e4aea62bd6ea','oreocatadl@gmail.com','Discord Bots',NULL,'2021-02-08 20:05:13','2021-02-08 20:05:13'),(6,'efa02e52-648a-4d2a-92a6-e4cc8b2627c0','oreocatadl@gmail.com','Minecraft Bedrock',NULL,'2021-02-09 14:59:09','2021-02-09 14:59:09');
/*!40000 ALTER TABLE `nests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` smallint(5) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `fqdn` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https',
  `behind_proxy` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `memory` int(10) unsigned NOT NULL,
  `memory_overallocate` int(11) NOT NULL DEFAULT 0,
  `disk` int(10) unsigned NOT NULL,
  `disk_overallocate` int(11) NOT NULL DEFAULT 0,
  `upload_size` int(10) unsigned NOT NULL DEFAULT 100,
  `daemon_token_id` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daemon_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `daemonListen` smallint(5) unsigned NOT NULL DEFAULT 8080,
  `daemonSFTP` smallint(6) NOT NULL DEFAULT 2022,
  `daemonBase` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/home/daemon-files',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nodes_uuid_unique` (`uuid`),
  UNIQUE KEY `nodes_daemon_token_id_unique` (`daemon_token_id`),
  KEY `nodes_location_id_foreign` (`location_id`),
  CONSTRAINT `nodes_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,'2b7c6caf-8e1d-48f6-905b-88a66acf283c',1,'Dev','Dev Node',1,'dev.oreo.host','https',0,0,16384,0,153600,0,100,'Ume4STolWMJn3DvV','eyJpdiI6IkxUK2RFRFBJejRmSWFQRzdPVUtlSXc9PSIsInZhbHVlIjoiaUtsNHh5QTYxdWpHVlkyYUt4di9nWjVqV0Uwc1hzbS9nMjdZaG8yZjR1Z1N6UTFJVDRZRGlsb21zV3JzMGxTNURwZ3k4d0pCNEVHSU9uc1JwbTZtamd6QWl4QWpWN0NpbGdNVFU4Yy9vSjg9IiwibWFjIjoiMTM5NDg1MDhhMjYwNzNiZDAwMzU5ZjEzMzJhYmYwYzgzOWQ5ODk5YmEwZGY0NjJiYWM5ZWZlNzhmNDU2NDc4YyJ9',8443,2021,'/var/lib/pterodactyl/volumes','2021-02-08 18:11:37','2021-02-09 18:31:22');
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL,
  `plugin_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recovery_tokens`
--

DROP TABLE IF EXISTS `recovery_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recovery_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recovery_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `recovery_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recovery_tokens`
--

LOCK TABLES `recovery_tokens` WRITE;
/*!40000 ALTER TABLE `recovery_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `recovery_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_day_of_week` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_day_of_month` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_hour` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_minute` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_processing` tinyint(1) NOT NULL,
  `last_run_at` timestamp NULL DEFAULT NULL,
  `next_run_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_server_id_foreign` (`server_id`),
  CONSTRAINT `schedules_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_transfers`
--

DROP TABLE IF EXISTS `server_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `old_node` int(10) unsigned NOT NULL,
  `new_node` int(10) unsigned NOT NULL,
  `old_allocation` int(10) unsigned NOT NULL,
  `new_allocation` int(10) unsigned NOT NULL,
  `old_additional_allocations` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `new_additional_allocations` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_transfers_server_id_foreign` (`server_id`),
  CONSTRAINT `server_transfers_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_transfers`
--

LOCK TABLES `server_transfers` WRITE;
/*!40000 ALTER TABLE `server_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_variables`
--

DROP TABLE IF EXISTS `server_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned DEFAULT NULL,
  `variable_id` int(10) unsigned NOT NULL,
  `variable_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_variables_server_id_foreign` (`server_id`),
  KEY `server_variables_variable_id_foreign` (`variable_id`),
  CONSTRAINT `server_variables_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `server_variables_variable_id_foreign` FOREIGN KEY (`variable_id`) REFERENCES `egg_variables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_variables`
--

LOCK TABLES `server_variables` WRITE;
/*!40000 ALTER TABLE `server_variables` DISABLE KEYS */;
INSERT INTO `server_variables` VALUES (27,2,61,'14',NULL,NULL),(28,2,62,'',NULL,NULL),(29,2,63,'',NULL,NULL),(30,2,64,'',NULL,NULL),(31,2,65,'',NULL,NULL),(32,2,66,'',NULL,NULL),(33,2,67,'',NULL,NULL),(34,2,68,'',NULL,NULL),(35,2,69,'adopt@1.8-0',NULL,NULL),(36,2,70,'',NULL,NULL),(37,2,71,'no',NULL,NULL),(38,2,72,'Ancient',NULL,NULL),(39,2,73,'change-this',NULL,NULL),(40,2,74,'RAGE:MP Unofficial server',NULL,NULL),(41,2,75,'50',NULL,NULL),(42,2,76,'0',NULL,NULL),(43,2,77,'replace-this',NULL,NULL),(44,2,78,'',NULL,NULL),(45,2,79,'',NULL,NULL),(46,2,80,'replace-this',NULL,NULL),(47,2,81,'',NULL,NULL),(48,2,82,'',NULL,NULL),(49,2,83,'yes',NULL,NULL),(50,2,84,'',NULL,NULL),(51,2,85,'',NULL,NULL),(52,2,86,'',NULL,NULL);
/*!40000 ALTER TABLE `server_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuidShort` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `skip_scripts` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(10) unsigned NOT NULL,
  `memory` int(10) unsigned NOT NULL,
  `swap` int(11) NOT NULL,
  `disk` int(10) unsigned NOT NULL,
  `io` int(10) unsigned NOT NULL,
  `cpu` int(10) unsigned NOT NULL,
  `threads` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oom_disabled` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `allocation_id` int(10) unsigned NOT NULL,
  `nest_id` int(10) unsigned NOT NULL,
  `egg_id` int(10) unsigned NOT NULL,
  `startup` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installed` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `allocation_limit` int(10) unsigned DEFAULT NULL,
  `database_limit` int(10) unsigned DEFAULT 0,
  `backup_limit` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servers_uuid_unique` (`uuid`),
  UNIQUE KEY `servers_uuidshort_unique` (`uuidShort`),
  UNIQUE KEY `servers_allocation_id_unique` (`allocation_id`),
  UNIQUE KEY `servers_external_id_unique` (`external_id`),
  KEY `servers_node_id_foreign` (`node_id`),
  KEY `servers_owner_id_foreign` (`owner_id`),
  KEY `servers_nest_id_foreign` (`nest_id`),
  KEY `servers_egg_id_foreign` (`egg_id`),
  CONSTRAINT `servers_allocation_id_foreign` FOREIGN KEY (`allocation_id`) REFERENCES `allocations` (`id`),
  CONSTRAINT `servers_egg_id_foreign` FOREIGN KEY (`egg_id`) REFERENCES `eggs` (`id`),
  CONSTRAINT `servers_nest_id_foreign` FOREIGN KEY (`nest_id`) REFERENCES `nests` (`id`),
  CONSTRAINT `servers_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`),
  CONSTRAINT `servers_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES (2,NULL,'5955b5f2-1804-4219-8a27-9571ec10962f','5955b5f2',1,'Dev','',0,0,1,0,0,0,500,0,NULL,1,152,1,15,'./minecraft.sh','quay.io/lapamakelakaopknj/gfjdklgtr09e8y0968jhkbjn:java8-cat',NULL,1,1,1,1,'2021-02-09 18:34:12','2021-02-09 18:35:30');
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('22Sf3ddFKLRi2bWIz4pTfywt1tAjaSJIys2WNzwq',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa1ZWUTIwMGFsZEZRV1lyUTI0MlYxTnpibEZyYlZFOVBTSXNJblpoYkhWbElqb2lTekZOYlhSaWVHbzRjRVF6V2tZeE5TOHhhbU5zVkZkc1EzUnhjVEpsVmtGTGFWSlpiM05ZVkVsdmMyMU1Wek13YW5kaWRXaExOV0kwWkhKb2NWZHhiMGxaT0RaaWNFMTZSVkJOUzNGV2EzVkhiVW8xTlROS1MxaEtjMDE1Um5GcFoyUTRhbWhqVFc1V1kzcFVkVzR2TlRsbFREUmlTVFIwZWtkeFlsTk9NVlpqVG5ZeVdXWldRbEJIYkRoVFZsWm1Sa1pwYlhGNEsxUTJkV0Z3TW1aak4yWmhNRTVZVmlzemNXMTZkM0ZXYVRWV1J6a3Zha3RPWW5Cdk9WZElUWE5EWjJ0Qk9GSTRWamh5WmxCWllYaHNPRWhDVjBFelNERkVUV2RpY1V0M1FXbzNhMUJTWTFONGFFdFFkekpWV1haYVJubGphblJIVVVjMVFtbFFTa1Y2S3paTE4yNXBjWFJpTjAxVU5tOUxkbWw0UjB3clpURlNLMkZzVkRCbVEzazFRa2g0TDJ4T1VGRjBVRkpaZEdSSmIxcEJhV1YwU0ROelRuaGtWbkpQWm01aFNtbDFWamc1TkVwQmFIbEtkRmRaV0ZnNEwyUnRTMlpwVkhWWWFrdE9PR3MwUkdaRVNqVTBRa293UFNJc0ltMWhZeUk2SWpNME9XTTBPREk1WlRFMlpHUTFZbU5oTmpabFlUSTNNRGt5TlRaaVl6bG1aRFUzT1Raak16azNZV1EwTm1Zek5UWTJZemd5WkRFd09HVXdNbVZqWVRnaWZRPT0=',1612943484),('2IROsxkM7FrW8ej52ZXxjFEcx7jBNCWi32FIavFD',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbFpNVVd3M2MxVmFhV1Y0U25Wc2REUm9WQzl2YjFFOVBTSXNJblpoYkhWbElqb2lNVFpEYVZRNVRHeENVMFJaVjJoNVdsUktla05vZGxOV1lqZE9WVVp2V0hWeU1uRXpOMnhzUTBwaVZrNU5VRzFOZWt0VFpVRXdObXBTVFRCMVoyWnhNa3R1VURkT2RrTnlSUzh2UzJkQ1ZUVTFiVEY2U2xaMGRXRkxWV2xxWWtGMU56ZHJkbklyWVRKdmJrSjJXa0pZTjNkbVRrb3ZMMGxxVW5oelEwUlFOR2xRZG5wTFlqQjRNeXRDSzJGSU5tRTBlVGRwZDBOVlZGZ3pURWRTZGtwVmJUVjZMM0ZCVlhSdWQxVndPVWd6WTBoQk1GaHVNV1ZCYWtNMGJsSkJUV1ZrWTBFMWIwdEVabnB4YjNwM1pVOTVNemhIVVVKVWFqTjZMMDEyVWpSck0ySXhjMUUxWld0NFkwTlVVVEJ0U2pCRFFraHdSR1JpYXlzclVWZHhUakJrWlU1Q2IwaFhVVFZ2SzNadmMwczBWbVZUTlZCSWFuTm9Ta28xVW1GMmFqbGtkbkYyWnpsNFZtcHVVREV2Y0cxNVNqWlRaMFphUkVNclkyUTVMMVpIUlNzMWJ5OVVjMDFzYVRkRFUzZExURTFxVGtGdGN6aFJQVDBpTENKdFlXTWlPaUl4WmpNd1pqQXpabUpqWTJaaFpXVTROMk0wWmpCa01tWTVNREprWm1Nd05qQTFNV1ZqTmpjM016QXhOelE0WXpObVlURmxZakE0WmpBME0yVTFaV0kwSW4wPQ==',1612972020),('2WrlW4N2Ykh9GSbS2mFBqjF2rpF72j8D1mcvFeWZ',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbEI2TDNoWGNXZHNjamMyY2pKTGVHc3lRVk4yUkdjOVBTSXNJblpoYkhWbElqb2ljRTVMTTA5SlRtd3dlVk12T0ZkblVGUjFlREZMTmpWQlVqVjFhVXhUYUd4NGNqbHFZVXgxUm5KNE1HbFNhbkZ3TVUxUE9FSk5RV1JXVlVKRk1rYzBjV1kzZVZFeGMxTTRTRUo0VWk4NU9FNWpTVU0yVjJ4R2NWRmFTaTkwYlVkeGFFNUpURTRyYzFoWlZFeGFPSFZMVUhONVJWaEZhSEJZV1hSSFVreGhWbkJ6VlROak1Ia3ljMmxEVDJGWFVEZ3JNMkpoVDNWdWN6ZzJiRzlWT0Vab2RsaHZVRWhJYkUxSWFTdFBSalowVmsxbFdXRkJWVEJKY1hGalVVa3ZVVk4zT0VGeVMwcHNkRTB5WWxScFIzUnFkbGw1TldNdlUwSnJZVmR2Tkd4dE9IbEhNbWhJZDJOMVZFVllSbGRxVEZScGNVRjJhbXhWYUZsSVJIZ3hSVVExWTFkTlExSmFSV3czVFVOM1RuVkVPVmxrVlZOQ2MwTllWRzl5UWt4dk4wazBaRk5wTUdoR1VIUlhWVU40Y0hsR1NpOVdXVk5zWWtsUlFYcFBVazloYWpaSWNFWXhhVTVxWmpaMUsyTkdZM1EzZFRGSVFtUlJQVDBpTENKdFlXTWlPaUkyTTJFNFpUUXpPVGd5WTJOa05EWmlNekl3TkdJd1lqSm1OREExTVRBelptVXlNRFUyTW1SallUa3dPRGt3WkRneFl6azNNbUZrTkdWbU5EaGxNVGxtSW4wPQ==',1612950973),('4EygE0EgmHd4C8tXQXMGAkT7r9nwdZQhtaOBOe2f',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbXB2TmxaRFNWZHVXRXhMWlhOQ01HdEdlbXB6TjFFOVBTSXNJblpoYkhWbElqb2lOME5RYlUwMFZHaHhVQzlvWjNGb1FXeHBjR1JvUVhKWEwwWmhia0ZzVjFKbk4zZElMelJuTURaeWQweDRXWFF3UmxsRWVUbGlla2x0VDJWcE1qSkZSMjB4WkcxbFYwSnBMMU5IUVd3d1l6QkRlSE5VTTBoc05FVjJaRzB3ZFRCSWIxRkdPV1IzTjNReVZsbDBSbVJJTkhkRFMyNVRWRzlTYzJObFRrczJMMnhNYW5RMWIwUjJNMGxzVVVablRFOUNXRlF2V0M5TU1qVmphbVozY21Od016WjBhM1JJWTNNeWNFRkdSSGxwV2xkaGNDdHdRVkZ1VkZwUlNsbFZlV1ZvZG1oQ1NYVXZaRzFESzJkNGN6RnZNVWd6Y21oNVRWUmthbU55Wmk5TWIwOVFXSEZWWVZkM2FFbFVWWE56VkZaa2NXVXpWU3QxV0ZOME9TOWxNVkJ6VHpnd1FrNUNRMlZqWnpoTGRUUjZaMnRHZFdOMGFFRk1iVEZ1V1VSS1pVaEhOVkUyUm1sNVIyTnliV2xaU2pWd2VtOTVZVEJKWlZwSlRHaDNXa0pFVjJsMGEzRmlNREkyYWk5TU1sSkNWakpNVTIxeWJIRlJQVDBpTENKdFlXTWlPaUpoWVdJd01tRXlaV1JoTmpWalpqZGxaVE0zT0RWalpHVTROMk5qT1RkbVlqYzNabUUzTkdZd05UTmlZek5tTXpkaE1EQTFOVGswWVdJelpUTmlNbVkxSW4wPQ==',1612958695),('4TbKGzpcp5OvNRUjHJRnunhJWHM6LTS4JEf3TnPC',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJalEyTlhWcFFWUlhLM1UzYUcxTVRsaDNaazF2Tm5jOVBTSXNJblpoYkhWbElqb2lUV0pvV2pWMFNHZHViMWxQVVVKcEt6aElSR3AwYldJNWNrRkJaR05aWVc0MlJqZFdZVEZ3VlZKaE1HRXpWMGhKTkhVMVJISmpNbE13VDBwTVQwMU5aMUpRVmpoTVdXbHBURzVaT1hVM1RFODVTeXRMTkc5VGJrWXdVVmx0TTBWd2JUQTJVblJ5TnpsMlMyNDNRMVJpZEdvM0x6azFPSGt6UW5GRWNGZHBjMXBSUkZNMFR6QkVkRFJ0VlRadU9YaFdNWFkwUW04eFJtWndablpMYTJ0Q09XSTNhWGczTjFkT0x6UXpRWHBHVDBSbVJuaFpVVTgzTkVkUlFUZ3lZemRXWW5oNlYwaDBUMkZtZVZKeVNXVmhiVkIyWnpOSFdYSnRWemRzTW14dVNIZGlZVGRaZEVZcmVUTkphMWd2TVV0alRISlBSR1JQUjJodWFIaHpVbmt4YzA5eVVsaHhPWFIwVkhoRk5XVjNOVEJJVlVoMlNFNUZPR1Z2UmxwV2FYWndhVWhZVFVWdmVFVjJTR2xaYzJObU5tSTVTVEZzV1VSMVIzcFdkMWMzVms1MlJFUkhabWc0VVdoYU4xbFFabEZGT0ZKQ2JIUkVTMFJxZVM4Mk5YQnFaMmhUZEc5a2QzVjFTSHBCUFNJc0ltMWhZeUk2SW1Wa01tSmpObUV4TldZNE1HTXhaakZoWVRnek9HWXhZekUyT1RBeVlqazFaRGt6T0dSbE1XSmxNalZrWkdZMk5qaGpNR0U0TURWak5HWXlaRFU0WWpFaWZRPT0=',1612947344),('6WJ1cdBgIMeSuMtqAUJESyNPen5DJcHtr9D3m2ql',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbHBFVVZBeldGZzNWamhhVUVGUVZVZzFaWGxUTmxFOVBTSXNJblpoYkhWbElqb2lWVmw2TUVaa1pGWkhiMFZpYTBReFZ6ZHdiamQwWWxnMWIwWTRLM0ZUVlhWbGFVWlpTSFJhWTNWR2J6RnpTbVk1WWpaVWFVNTRRMmxaYm1OWldVRjRTMGhZVFVNelExWmFPR2MwUW5GUGJWUTJVekJ1VG5wQlMwaHJiRmxVYlZOalkyMXdZeTlSVFhoTVRtMVhlbkZWZUhWWFdISnhaWFIwY1ZWcE4xSTRSRGgzTldsdmEzVkhjbHA1WkU4d1JWUmxhelZ0TTFOelprUm5hamhtY25aT1JVRkhWMGc0VDJkUmVrcERVMWxMTjNJMFZFcEtPVzFGZFdNd2R5c3ZTVVpZY1RCMFIwTnlkRUZUY21WRVFXTm1ZMk5QSzJjdmRFaFlTMFZDWW5OcVlWaDZUVVZtUWsxSlR6Vm1aa0V4VWtWRVNHVkVkMFoxUTBRM1RUSnBXbk4yY1dkcVMwVmtUV3htY0RoNlVVZDZXa1pSTkVveFlYbFRWMkUyTkhvMVlYUnROM0p0UzFRNE1WWnJOblYyY0Zwck1GbHNWVGxMWlRGVFpHTlpNMngzVjNGNFFWUm1XR1JvT0RNNWJ6bGxZV04yVlc5cE9TdHpWMk5RT1drdk4xZ3djblpPTldOeGFHUlhkSEk0UFNJc0ltMWhZeUk2SWpJM05tRXpZMlZsWW1OaU56UTBaV1UyTWpKaVpURTFZVGsyWm1Oak1UVmhObU5qTkdGbU1XTmxZekV6TXpjMFlqVXhNVEpqWkRJMU1qbG1NVGMxTTJNaWZRPT0=',1612939272),('7vvoSsiVPtGTM9HB6yG5x75L8A7b1nzkVqteVhJt',NULL,'120.0.52.4','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36','ZXlKcGRpSTZJbGh0UWxSQ2FWUmFObVZOVmpsd2NEUllWMGt2YldjOVBTSXNJblpoYkhWbElqb2ljek5xUzBWcmFuSmFha3h4VVM5Uk1rTlRWVFphYjA5dmVta3JXRkYwYUZweFJHRjNTazV2WmxsTmVqRXpUazlDV0hSTFVFMWxWSEJDTkc5Vk9FOUtjSFkzUkhKNmJrc3pWVFp0VHpOaVJqUjJiemRaV25Oc1lVRkRWR1l4Y210Rkx5OW1lazQ1ZUd4Tkt6RlRkRmR6WkRJd2RVMDBVelp5Y0hOU1VtTktTazF2UmxCMFVERnNibmxLY21ocGMwZzRhMFJ4ZGtKVU1VaGtRVXhvVWxkRWRuZG5kMFpKY25keE1YWTVMMFpXZUd0eWF6TkNVMmt3YVdsWk1VeHJiamcyWVUweFoxbDVXRkkwV0dKSVJ6ZHNhVE5EUlZOd2QzVTRTM2xpVFZVMVpXcGpPRnBTZG1GdGVqVllia3BEVGk5UlRXSmlUek40UzNGTk1HazRVRGxHVDBkRldFRmFhMVJuVmpSck1HVndTbXhXVW1OcFJEY3pjV3B6UzBSeVFrcFNVbllyVkhOWVZVNXhNamM1WlZKM2NqWXpMMWx3TjFaa1oyNVVNSFZsV20xSlltbGFWVmh6ZDJkc2RrMUNhVUpQY25jeE5XTnlaMWgzYTBKdU5rOHliWGxCVUUxNVYxQjBaa1JGUFNJc0ltMWhZeUk2SWpreFl6TmpZVEUzT0dRMllXRTNNRE5sTnpoaU5EWXdNMlF6WldKak1tTmhPRGswWW1abE1EUXdPR1JtTkdaaE16a3haVEk0TnpRek5UTTNPVGc0TkdJaWZRPT0=',1612963245),('9SVTClhexC5VdZi1454UxnICc5UGwf7EFnFaig5Y',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbk5CWTIxT0syMDFSREZGVEZBNFEyRkRPRmczZVdjOVBTSXNJblpoYkhWbElqb2lZVTFETTFkWVZFWnFTMXAxUlRRMVpETTRORzFwVW5oT1dFUk5OazFKVW1SYVZrOUhVbG8yTHpKWU5YTkZZVk5wU21zdlVEaE1UekozWmpKcVYyeHhOR2xEVmpZMGVIRnZRbVJWVTFsMGMwaHNSMGxLTDFJMlltcEhZelp1ZFZKdVNsUk1Wa1Z3VmpKTlJsZEZha1lyUjFjemVrRm9MM1JSSzFwM1RXcExkRk13VUhCM1JqQlBaRWxSTWl0R1ZubEpRWEJrVTJoek5YbFFhVlUwUjNGSlozSTRiMUkyTkhRM04xZ3lNSGxYZW5GWFV6azFPR3h6Wm1KcU5qZFhiVGRqTW1KSlFVWm1PRGhwUWxWQ1R5OW1PVVpxUzBkV2J6VlZlRzlVU0VWSVMyY3dWa3BMYVdrd2FVeE5TR1J2WjFRcmNXOVVZVlpxYWpSaGEwUXpRWEY0TjA5c2FXSlBZMGwzZW1KR1QweFBWRzVyZURWeWVrZHZNMEp0UldOUVVHSXdTVXBxWmtRMlFWTkllRU5RUldaclQycE9RMlpVZGtOalJXWXJka1ZPZDI1blIwUTBja3RoUjBaeGIzaHRXbUkwUlcxUGJUVnRaVUZpYTA4MWVrRTFNVk4yWlVkTFpFNHlVazlyUFNJc0ltMWhZeUk2SW1Oak5EQmxNemt3WmpJNU5HTmlabUZqTVRRMk9UVXhOREZqTlRWaU1EVXhPVGd5TUdZMU1Ua3hOekUxTWpOa1pUa3haRGhpT0RkaU16Vm1ZamM0WmpFaWZRPT0=',1612958696),('aEPpfWX7DHnAjixzLtEfhelURvaHBmPqLnoRDKBG',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbGRIWVN0eVpqRTNNV012VVZKNGVWUlJWRkpXYUZFOVBTSXNJblpoYkhWbElqb2lVVzlKY21kQmVXZFhaMUF3Um5sa09VWjZRV3B1U1dkdlJFUnpjVEpTZWxGeFZ6ZEViMHBLVDNKRVZYUjVUMWgzVnpCS1pHMTRVbFF5WVdGSlptZFhlRE15TkM5UFdXZGlkMDFYTjBWNGFVMDNaRGxsUTBwYWNUQlBTR2d5YzJwek9IVkRkbTFsT1hkbVIxcEpUbEpTTTBGb1VUaGlia2xxYnpCSmJDOHZiRzE2VVd4SWQwaFlRakpPYzFNMGQxaE9SbmRMU2pSd05VVjZSekZFY0U5V09VdE9hemt4WTJvek1rUTRaVmRaWWtGNVFsZEJiMjVoTHpVMlYzTXpWMVV2Y0d4UkszRjVkV3BMT1hGcWJXd3hUMkpzYTBSYVNHdDJZVkpQVVZZeGNETkxOalZrVVZWbmFrRXpaVUZqTjFKTmVHVkhia2t3TjBWVlppdDNhQzlSTkZaV01tazFVVmxGUlhabFlUVmpVa3BoWlUxUlZTdDNSSFZaVjBkUmR6SlhZVTVaWm1RMFozVXlVbTlqV2pad0wySlJSbmswY1ZkelMyUlFabVprUjFZeFluSklNekF3UnpoYVdXWlFaM2cxWkRrMVZqbFFUbTVWVjNkT1VrZGhkbUp0WTNoa2FteHZiRTEzUFNJc0ltMWhZeUk2SWpKa01XUTFaamxpWkdZeU1XWm1abU15WlRFellUSTJaRFE0TldNelpXWmhOR00wTURFd1pUSmlZalV5T0dFMlpXUmpZMk5tTlRabU56Y3laRGN6WXpBaWZRPT0=',1612934896),('bZebfCQSLSTrQfvwnUeb2vWihdNqHIt3yzGtj45m',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbFJMVkhNeFVrTTJkbVppUzFKMWRERXZiek5DUzBFOVBTSXNJblpoYkhWbElqb2lWQ3RoUTFjMGIzZEpkbWQwYWpjclVHZ3JWMWRuUWpsUFVERkRRbU5qVEZBdk1rMW1WRmhWU2tWUlkweG5SVWRvTldscVF6SXZjME00ZGpGWlZFUTNSVVZsV1RSeVltNVdSemMzVkdGUE5tMTZNblZMT0U1dFYzaGFORFpSU0Vsek5HZENURUZuU3psV1VIZHJNbVI1Tkdsd1NFUjVjV05sY2toMlRHTXhURTVRUzFacGJXWlZkMm93UVZsa1dVb3lZblowVHpRMWJUaHZOVlZ6ZFd0T2JtNXZVMU5qZDNBemVEVXdSR1ZSY0VOME1tZFZTRXBIVFU4ck5VdGlWVVI0WjBsUWRIQXdSMG8xYm1ka00ydFFXR1IxUWxONE5YWkNiM2MzT1ZjNVMyc3laMWhRWkVZdmREbHllVXBDZVRKSGVHaE5XWEJIYlZwVVVVMDNSbWxETVdjMlVFZzJha2hWT0UxWVZrOVVUMmc0TjI1VmFuSk1ORlpGVFdWU04ycHNjR2RwWWpWV09FeFZLM2s0WjJwcWVuTjJaR0ZGSzA0NWMzbFJhREpLT0RSNVZYaFFXQzg1VTJKSU5uUkxNVTk2VkZaa1JWVlJQVDBpTENKdFlXTWlPaUl4WlRNeVlqZ3dPREV5TVdRM00yUXdaRGc0WWpnek5qTTFaR015WTJJM09EWXhZelUxTnprNFpUZGhOVFl3Wm1KbE56aGhOVFEzT0RFM05ESTJOVGMzSW4wPQ==',1612979888),('cKGqmz71YiRx68Xd2eCZNf4rtRVc1yvniM2f6j5T',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbXBNV1hnM2RFUTNTbGQ1WjBadU1GTjVXVTk1WTFFOVBTSXNJblpoYkhWbElqb2lkVEJ2UVhKaVRsSmhZMEZQYzNoTVZuUlZjM0IxZFhsNk1VeEJWbVJ5UkZnNVpFVnFSblpqUjFkNlQwSlpPR0pLV25vNGRsWTVWREZrUVZkM1dVZENhSGRUVDI1WU0xbDBNemRtTjBWQ1FtRjJkSGQyWW1wRk5HeHhMMnRJZUU5Sk0xSXpTRXBPUWs1SVdVcHVMemxZVkhsTU9EaENTVlZtZVdoMFVucGtRVW9yYlZaRGRGUlVUbkJzWlZKSWNHbDZZbkFyZVRBMVRXTlpRM1EwU1VzM1Z6SllOVGh0TkZobWNGVnZhRVpvZEc1TlZFZDRVMjExUVVkbGMyNUVZVFJQVm5wVFRFWmtXbGRYT1dSaFdtUjBLMWRaTmtVNGVqRmlRa3B4T0hrM1drVjBlRVJrUVdScVNtOW1ZVVZtTURGSGVXWlpOMHA1Y2tOcWVWRTFObVJqYVVsV1VtbFpkbGh5WVRsTFNYTkNWbEZWU0d4ek5sRlVaemxqZFc1cmFGVnNTa1JIYVc1RFdWZ3lUbk0zUzNKNU5tVlVTRGRsVUc5NWRWQlVORTlRYW1Wa2FFSXJjMmxQTldSV04zaDVaR3hZUW0xcVkxTmxZMVpNWlRGR1lrVjNkRlZMZEZoWlVGWlhhMEZuUFNJc0ltMWhZeUk2SWpRelpXUmhZell6WmpBMlpHRTNZMlJqWTJNd09ERXdNekF3WXpVMk5XRTNOR014WVRFelpXRTFNamN3T0RRMU5HWmxOVGRpWTJFM05qUTFORGhtWmpVaWZRPT0=',1612943484),('CMHhv2leinbGjSXuJcULlPq3QFHmS6s3HgUE2H3A',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa2huTVc1d09VSldlV2xCV1V0c1pIZE1OVVZTUWxFOVBTSXNJblpoYkhWbElqb2lkR0o1WVdsc1ZETlhXbGhsVWlzNWVrOUZNWGt6TDFaSmJFSjRVV2s1UmtsSU9UZG1UVmRETlU4clRHcG9WbXhaWld3MGRXbDVibVZaYjIwdmNGQjJMMGh4UTNCT1VtSk5TVXRoU0ZWSWFHcEVTbVU0VlVSbFVFeHdLMFZQWTFkMWNqVklObnAzZUhkV1RGUkRWMjlzWlVrdlFtSndUQzl5WlhoMk1ITnFjMU5sVDFaVVkwWk5MekVyTURkMWRqWjVkVTFwVHpOblZVcExaRFZoTDNSSVJ6WnFSRFJXUjFGSVNISndUWGRZZGtwQ2JuY3pNQ3R6YzFSaVNYVkJVVkpCU1ZaSVVXdE9UbkJVVFdwMFowaDJUSE5GYTFsWGF6bDJXSEJ1UkhKeGJuUjZjME5SZVVKaFJ6Y3ZZVWQwUVZGRFNrUllUVGRMYUVWT2QwbzFWRkV6YzI1TmEzcHVRbXd5ZEdnMVNXTlVWRE54T0hNNFVXTk5lVkJEWm5Kd2VYTXhkV1V5ZFVGeGVrZHdiMHBoS3k5c1owOTNlREpVVTFvek5TdHhWVzlDTlZaRmMwaHRNamR0TUdSTFRWZzRXVUZJUW14V1kxSmFaMUpPYlhoWGExbDRaa2R0VDB0NlRVRkRaMUpqUFNJc0ltMWhZeUk2SWpVd1pUazFOR1UxTjJSa05UUXlOV1ptTVdOaFpqZG1NekE0TnpobVpXWmxOVFJqWXpGaE9HUm1aRGszTWpneE9UazNZV1V5TXpFNU16RTJNelkwTkdFaWZRPT0=',1612979889),('e2UsPKRdokU5gB9VmlKuVhBbzIcibo47EjbTEqlQ',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa1ZsYW1aVFJUUkNVMUl2VkZaMWNUaGtMMkZpTUZFOVBTSXNJblpoYkhWbElqb2lkVkp2V1RGb2VXRTBlVmhzVjBKblVWYzVkRzkxTW5JNVFraEhWa0Y2Tm05RGEwa3JObmw0WXpkbllXSnZhbUpuUW5JMFpUaG5WREZJVURWVVZISXJNRlJ4V1ZrdlFtRkdZa0ZyVjIxQ1dsRk1SRFYzZVdoTmIwRm1SelpETkdOcU9VUnZTMUEzYW10VFVHUklUM0p6U2psMWVGWXhVRmg2V1haUlUySm9TRnBuVlVoQ01GUjViR05aTm1oSmJYWjJVbU53WXpZd1FtWXhTWEJWT1d3dlMzcDRSakJKVjBOcWVFNVFUM0ZVUmtOTFVIRktjVXhRZGt4V1F6aFNSWGc1Y2xodVdXRTBOMlE1WkVrdk0wOHlRblYxZW1wRE1saE1XbFpvYVRKQlJsRTRjMkoxVGtJd1RERkpPVVZaWkM5blFYQmhhblpZTTIxYVZrcEthV1ZZTlZCM09YWkJNMU4yUmpnM01VRTBZVFY0T0dGeFlqVk5lQ3MwWldSbU1tMW5iVGR0VjBZNVlUVk1SVWsyV21wSGIwdGtUa3hHTUdSTVVISm9ZV2xJVjFsYVlrOUlhRkZqYVZaRmIzSlNaM1pwWkhsdWIyWnpVR2xMTjNkeGNrbFhZaXR3UWtaMllqWlFhVmcwUFNJc0ltMWhZeUk2SWpGbE56STVZek01T0dZM05UQmhNakl4WXpBME1qQmlZVGN5TlRRM09URTFPREU0WW1JMVlqTXdNREV6TURrek5qWTJPVGczTkdKbU1qSmlaR001TXpjaWZRPT0=',1612972040),('ECcidZpYqhzCYhC6pzQD25s51tZYSpXx8mlxaXUq',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJaTlKUkZKNUsxTjBSbEpqYW1Ga1ZIQllTMUJCYlVFOVBTSXNJblpoYkhWbElqb2lNVmhpUkZweWNHWnNkbU5vVm1sdlJXOHhWMmxtWkRaSUwzcHRTMUkzVFRjd1JscGFTVEV5UjFscmVVTldURGhtYjNOdmIxQTRRVlJZVWxkbGVVeExVREpVT1dkNVFUTnFWamhvUVVKYWNreHRSRzVDU1RsV2FtaHRMemhvWTNKdVZGUk5UV2hZVVZrck0zWjFXamRMWW5KUVoweHFVa0U0VlVaU2JYRnRSa1V2VHpkMVlWUjBXSFJqVFhrd01VWXpXRk5QUzFkNWNrdDBTMUV4TDAxeU5qaEtOREJNTVVoUE1GcFpWazgwVFZoRlVYQjBUUzlJT0ZZdlJFRmlWVGRhWlVFNVpraE5ZMU12UkZCbE1Ha3dWM2hIWms5bFJVTk9ZM1JRV0VvdmJTOVplRVU0V1dSa1MxbDVWazFxTW5Sb1FpdFFha3RpTHpSR1p6STBPVXhKYm1aMVQxSm5ObWxvT1ZoclJVZDBWbUpsU1V4WFN6STVUMnRaUTJsbVZITkJhekZNZEhwVE1HVlBhelJoSzJseFYyWXhVVlZMT0dseGF6VXdjV3B4THpaUlNsbGhkM2xJVVRKYVFrUmxPVzU2Ym5kQ1luUk1jRGRRUkhVeFMySXZZbnBRUW5kRllXZGFORFJSUFNJc0ltMWhZeUk2SWpWaE5UUm1aVFE1TlRWa04yTXhNalkzTkRCa1pqbGlZVGxtWTJVME9UQmhZemMyWVdZNFpqQXpZV1pqT1dNMllqZGhZemMzWW1ZNE56WXdaRFl5WTJJaWZRPT0=',1612954721),('ejzFkN9A9FHl03xg9nfyvMsuE5wLrniYKtHiAOrN',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbE5OUVdoRVZHWmFhbmd3UW5sdE1XMTNTM1pNUzJjOVBTSXNJblpoYkhWbElqb2lSWHBGTlhwNk9YWmlTMEl4Y0VoeWVVZHdRVzVvZDJ0UFFUUXdaMlF5TWtKMlN6Wm9MMjR2TWpsU2QxaG9OSE1yUkM5WkszcExaREF5ZVdGblpsSnlOMmgwVldGNE9XcFpkMVpyVEhNM2JUZ3hTazVDUWtSeGR6VnJkVUpqVGxaWFdtVnJRbkF3YmxWb1IwRmtXa2g0T1UxSE5rWlFUekJqWmtkTGVIVTFXRWhhUXk4eFJtUkVZU3RTTlZsQldFaHFPVWQwZDFCQmN6ZFhUMnBNYWpaNWQzSTJXblZsTTNvNWRqWXhObTlDWjBkb1JrOXVXbXROVUVaYUszZEJOazF1YzBaNlZHUklhR2s1UzNaR0wxbHZhR050VjFSSkwyUnRlSE01TUN0eFpHaFNaakJwTWpONFFreEliMGRFYjJSc2MxRktNM1Z3Y0dveGVYVlFPRmxyVGxGS1lVVnNXSEJTYzNOaE5sWlRlSHBOVERVNVJYRldZVEI2WW05bWNITTFLelZSYmtWaFlXdFZOVWhxU0UxU2VUTm5jV2RzVDFKUlFVUXdUM04wVjBod2MxcHZTbEZHV1hoalRFRlFVM052TlRGd1VrcFJQVDBpTENKdFlXTWlPaUl3T1RVeU4yUm1NR1F6TlRVMlpETXlZemc1WkdJM05HTTFNMk15T1RSa01qVTJNekl5WVRabFlqQTFaVGs0TXpKbU1UWm1ZalUzWWpZd04yRXhaR05pSW4wPQ==',1612971070),('eZZYrFyDAUqiH4wsGln5peGN9dz0XYV3Kw6NqJaj',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbmRXV0hKTUswOHpjRUprUjJkNE9HdDJSemxyYWxFOVBTSXNJblpoYkhWbElqb2lVbTFDWlVFMlRuVjBkVW92ZVhaVU56Y3JkM0JqYlc4eVlrcFRkbTFFVEd0RmVqUlJkMk5CVFdGSGJ5dGFWQ3RwY1ZVeUwwWnpiM0IzZVcxVVZqbE9NRlptTVhCRmVXUmpXSHAwZUROQlVtWlZOamxqWlN0d1FsSndOa0Y0TTNSRWNUVnpTVTlvUWtWRVVUWkljakZDYWpCVGNqUndlbVJ2Y25sbFJDdHZSblJyTkVGWFpqZDJNakJPVDJOTFZuZHhXR0owYmtKU1RUZEphR3RITVdKSlIwc3phbmxvUzFvM2QweDBXbTAzV201UE5VeG5abVZCZGpnMlVDODBZMmd3TW1SVFFqQlhWMHgwUW5CNk1rbFJiamRuVFRkUE5taFpXbFV4TUVKR1dtWkxXbWh0UTJGWGVETklhSEJ6YWswdlNIcFVXRzV5Y1ZsbGNraDRTVU50YW5SQ1RsTndPVkJsTldOV0t6SlhjalJZUTBwSVNrWjFLMGhhWVU5SWRGZDVkamRQTUVOcFRuTnFSVmd3YUUxclJUUlFUbGc0VTFONVMycHVabGhEUlRSV1JtMURaMEpXWVVVMVQwRjFNa3cxZVhSeE0zaHVSbUptY0ZJNE1HWkdVMGRQY0hoR2MxUnRZMXBCUFNJc0ltMWhZeUk2SW1VMU9UVmtNbUppTm1KbFpUWmxZVFJqTUdZMU5USTBOelJoWWpRNU9XTmxOR1EyWkdGalpHTTBNV1ppT1Roak5XUTJZVEF3TmpJMlpEa3pZVFF3TlRnaWZRPT0=',1612962682),('GhLWw8SFUzIFIKSuqKkWpsn73TiFxH7tMlaW2Hko',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa0ZPZFVwUU5GWTJaWEZEYmxwVU5XSlZZbUYxTTFFOVBTSXNJblpoYkhWbElqb2lZMWRoVVdZeVZsUnRURkJQVWtGV1Qyc3dUSEJ4UmpKQ1VIbHBjMVpwZUdJNFFtNURlRkJOVEhkTVJuSTNhMHhGTUV0VGFXVmlUbFZGUzNOaVdTdEVlR3BMTUhONVdsUnNTMVphWkhobFpuTnNVemxMVWxkS1YyWnFTRU52U1U5R01sTmpTMVZEWmtnM1NHVXpjbU4wZW05T2JFRmlVbUoxZVRocGRVTXdSSFJrSzFWaE1VZERPR0k0ZUhoNUswY3llRFp3ZGt4dEswNUVLMnB3VVhFeVlVb3pjREpLZGtjeFdEVnpaMDEwYm5kQkt6RnFZWFpwTkU1RWJrZ3hXRTlTYkc5VVZsYzFkV3QzVTNaSmVrbDNjM2hMWkhVdlVuQlRLMVo1UlZaMFVERlFkR0pOV2psaVYyaFZWaXN6UTIwNVlYZzNPRFZ6TkN0akwxWmxhSFphWVRkbGVEQkdTWE5JUm1GRldGTTNjSG94Y1ZSWU1HeFlSVVI1Y2xkaE1EUkRVVmR2UVUxRlFXNU1XRmd5UTFab1RVbFlZbXBEYWpsQ1UySkJVMVI1YWtOQlYyUXJaWEV2TTI1aGJuQmFVVEpEUVZNM1VWVTNkRUZGVWpZNWJHdFdPU3QzYVdOMU0xTXlSVmt3UFNJc0ltMWhZeUk2SWpFM1lUTmlZalJtWW1JeFl6STFZMlV6TmpCbU5qRmhZMlJrTjJVMlptVTRNelU1WmpNeU9EY3dOVEUwTURjNFpUYzVPVFEwWkRRMllUaGhZMk14WmpVaWZRPT0=',1612939272),('GOBtHLRthEPZOBq2UqQhSOrAnP1jB07j16rgadEn',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa2R6U2pRM1QySjJiM1E0WTJSMk5FMVZOMXBVUWxFOVBTSXNJblpoYkhWbElqb2lNRFJ2ZWsxVGFuUm5ZWEZzZUdWWmFteHRPV2swTHpWV1NXRjZhRVI0TDJwRmNIUkJkek4zTkcxcE5sQjFVQzg0WldKNU0wVjVjMWxaYUVaelVXRXlOeTlYY1hwbVdsUXdOVE1yT1VvNGMyZGpaMjVvSzNwQlNGcGxZV1ZtVVhWUFkycFlVVXd6TTJGWk5uRXpVbkpPS3pNd2J6QnVNMkZWZGtvdlpUWkRWbVU0ZW01dVNuUkpTa0puVFdGdFZGcFFZeXRyTDJkU1R6TlZSVmRLYVROUWRuZEZlVVJvS3l0aFRsUnphVUV6ZGtzcmVHc3piRE5YUkc5clNXRmxibVpuWVZrdldIVlNWM05yWkM5TWRETkljVEZyV0NzdlRHNXNlbGhRWkdWa00wbHRUVk5qUzBwaFVuSm9VRlZqVjJwQmRtUXllRkk1YldrMU1VVXliazlMT0ZKVWExRlVORklyUW5kNWJrOVJVMDVxZVRJMmMzUnZWazVXWWpoWFJEa3lVbkUxTVhoUlVYZE1SVUYwVDB4SFlXOVFTVmhOZUdwbU4xVlJSRGR1TVN0UWIyeHNLekp3YzNWeFpubFllbXd6VlhwSFNUVlJQVDBpTENKdFlXTWlPaUl5TkdRNU1tSTJORFE0T0dWaFltRTNNMlF3TUdNellqVmxZV1U0TkRBMk16RXlPVGRrWldVd01XTTJPV1JoTW1ZM00yVTVPRGd3TW1ZeVpXRTBOR00zSW4wPQ==',1612930099),('HIRyjgtLsRYWAjP5MI0AS0fchNLJIRFrwQ1wtfGi',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbU4wSzNkdlMyTmhNRVZVWWxjMVkyRjBZa3BYVUVFOVBTSXNJblpoYkhWbElqb2lRUzl5YkdGYWJqZ3dSSE16Y0ZWSFYxUXhTRmhHVldvdk9UVkxaVmswTm5WcE5VMVNVMHA0ZG5KVE1UUjVNV3BXTkhseWIxWlNhRkkyUm1aYWNtTkNRMnRpT0U5WVIyUkNZbUpZUW1seVJqZ3dkMnBtUVhsaVMwb3djV0pCVFdORmIyRnFjMk51UVZSNFRVRkdjbE01V0ZKcVUxazRNMGh4YlhwYWFWY3lVMWt2VUd4SFMzQkhOamhsU0dGeFJURnBSMDFvU0ZveFZEQlJWa1V4TmpGWWNHaDVWVVIxTm1wREwwOVJURnBJUVRONGFGTm9kU3N6Wkd4WFEzazJObEpaYkRScldYSmtSRTVXWWl0SlUweFpVbGRLZUd0TlpuSXpZbWhDSzA4elR6Slplak5yYlRNcmFXVXZXbmRNTDJzeU0wTnlTVmR2ZEZCbVNtRXhaMEVyTVVoWVltdzBMMkpwVmtWNWRWVnRjVlJXTW5oT1lVNXpiMEpRVFN0M2NHMTNXRUl5V1dsb2RtbENVMWxTUW1JNGF6aDJWblJqVjBseGVUWTFja0ZxU1hSTFlUVjJVV0pPWmxnd2MyMXBRa05SV2pGS2FtNXNUMFpZVjFwWFV6bFBUbWRaYlhKb1RFUm1VVGhCUFNJc0ltMWhZeUk2SWpZM01UZGpabVEyTWpsalptRmhNbU0wTTJJMVltVm1aVE14T0dWbE1XUXhZV0V5T1RReVpUZzNPRFUzWXpabFpUbGhaVGMxWkdVNE9UUmlZekV4T1RZaWZRPT0=',1612972049),('iW5IXA4MGxz2FfCl72WFaZ1FfYncszT98lhgToKQ',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbU56T0VvMFNFd3JWM2hzSzBkWmIxbElURUZGVlZFOVBTSXNJblpoYkhWbElqb2lhV2xvTURscFJFWnlORmxNUldWa1dETmhVME4zTkcwM2VUWnRRamRFVEZOT1EyMWlXV28xWkZOamRuQjBMMUZuTDFGNlZXOXFXWEZ5ZUVSbmNrbFJZM1JUYkNzeVlWRmxWVUpNZWtsdFEwcHViVmhxUjBsSk16aExOWEJ6TURWVFZFTjNaRk5RZGs1aWJUWTFPVlZQV1U1bE9HTTFabU5NWW1WR09UWTBTMVZyYlRNMVZHOVVkbmRWVkhkbFoyZFNOMVI1YzJwT1RXbERjMDFYU21KemVqQlRVbmh6T0M5aGJ6UXdiazF4UzNCeFQyNHhPSEZKYjB4T1dHdEthR3hCWWxCdWFFSktTak12ZDJsNk9HVXJWV0ZhV1VsUlZVWmlSM1JvVkVSeWVYaFpaeTloUmtvdmNFMTFiRFJFUmxKT2NEaFRXVVJrYmpkMVJFSXpOVzQ1UTBWaFEybDFVMWQ0S3pOVlRGWmxVelZzTnpWblJISkhialF2TjBOcmNWVnJTVGhpV0ZwcE5GRkhMMm92UmxOQ1RIRXpjR0paT0ZWSGVWTklVM0J1UjFOWFJqTlBSV3B0UXpkdk1qZzBXa2R6VGl0eVJtNXhhVUZFWTBOc2NtcFZaU3RoVDNnMVdrb3hVM2RSUFNJc0ltMWhZeUk2SW1Rek4yUTJZalJsTjJObVpEUTVZMll5TjJFNVpXSm1NMk0wTW1ZeU5ETXdZVGxrWVRjMU5qTmhaalptWmpRMU1tRXlOREpqWkdOaE16RXhaRGRqWW1FaWZRPT0=',1612947345),('ixNDQwY6nUPnERiKkdArb3mfKwnkwVGzTziTIBWD',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJamRLY0RSSFZGSXlWbFZhUTBsbWJraERXVE50YzBFOVBTSXNJblpoYkhWbElqb2lhRVJXTTBoYVRucDZOVk5OSzBjMFJFRjNMemxPZW1KTk5UaE5SbmhYTlRGTVNDdDZNRE5QYkhwWllVVXdhSEpyYUhONVF6a3dOMk5rUTNWV2FpOXZXQ3R3WTI5VVVUZDZjREZIT1c5SWNuQkhjMWRxUXpGbk9GTTBSMmRpY2pCNGNEVllNR1E1ZDNWelJVaFRWVE5JVXpGc2EwRTBUMnMyVEVsSldFOW9UWFZ5YWxBMU9GZEJWRGRYZG1KU2JEa3dOakpQWlRWcFFtVnZhblk1VjAxYU5UTkZTR3BLWXpoT1MzaFNUbVpoUkM4ellXdzJVRGhKV0ZwaU1XOVZWMDg1ZVdkSmRXdEtkM0ZoVjIxMU9YWk5NVzFCZWxJek9WRjNSMW8zUldKT1dISkRSMGhLYkRsdVZrUktVVXBXWmpod2FFTnlNVkk0UWpsV01HWk9lREZIVFdoMVJXVmhabkF2YzFSRVkzVmFhSGRZZVhrek0wdzJPRmx6VUhOQ2VWVlBWR0pRWW04NVNXNTZSbFU1ZWpOV2QwSXZSMU5zUmtOT00wTmthMmx5VTFoemQxRnRRamh3UlZoeVFrTkpRMEU1VVVKT1dYUXZWMU50UjNkWlpGQTVjRXhDWVZwbVJFazJRWFJGUFNJc0ltMWhZeUk2SWpreU9UYzJPV1F5TVRVeFl6ZzRZVEV4TlRNeU1qY3pOelJtWXprMU5ESTJaamxsT0RZek5UUmpabVk0WWpVek5tUXpZemhtT1dSalkyUTFPV1JqWkRraWZRPT0=',1612979888),('JAcfr8R8LSSRJPxLVo37TFFMc5lVB1Ydemx7TAZO',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbloyYUhKMmRrNTZlRzlQT0ZOTk9GSmhhamRDVUZFOVBTSXNJblpoYkhWbElqb2lNSFp2ZUcxWU1qUlZibFIyUlZsNGVUaGhOMEZ4VmpOeVJIbFpaSEYyYVVwdllqUlhOVlV4YVdzMVVIUk9RWEZ1V1dOMFdqbEdSR3RQWVVsb05uVTNTR1ozSzNKUmFrc3ZWMG93TTFCSlVITkRNSEJEY0ZaYVNUZEdVVkF2TkU0cmNGRnZXVnA0YmxkYVNuRjJaSEEyWkRrMWRVMWxNVXM0TldkR05HMXFSemhEWjBKNE5IVnFiMVJ1TURCR1FUSk1USFJXYVhndlowMWxNVWQ2UmpSMVkyTktjMHhEUjNSV0szUlhSR0ZhTVU5a2FYaDNWbkowUW5oaU4ydHliMVIxZUhFd2FsRTFNa0owTjFaMU5VZzVXblJsUzNaRFYwWllWbU14U1hsV1ExZHZhMFJDVDNKQ2RUSnFkblpzUm5WUVkxVlFSbVpJZDNwMk1HbFpaUzkxV1VZNGRrTTNVMU4wWm1oV2NVaGtWSE5CV1RCRlNsVXJlVWRvY3pOM1ozcHpZbHBJTDJsSGVteHBlRE42TDFwQ2QzaFZlRkpRVGpWaFJFWTJkelJNT0hWMFIwaHFaR3h5YTNCeWVtaE9iRXhFUlVKSWJESlNSQ3RyYzFWeVRIRjFibWRGZWpoUVdWUjNiaXRCUFNJc0ltMWhZeUk2SWpFeVptVTFOamM1TlRnNU1qUXhOMll6T0dZMU1UTTVPRFV4WVRRME56aG1ZMk0xWVdObU1UQmtOVE01T1dZM016azBORFU0WVdFMk9XTTJPVEZpWWpjaWZRPT0=',1612966793),('jciDl4WBuiynnuNJ0wfWTT7WEaK7sP2UhsoBYaSM',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbEk1UkhaMFZuTXdTVEU1V0ZKelkxTkJaa3hKY2tFOVBTSXNJblpoYkhWbElqb2lSMjExUjNsdVprWmxWbmxzZVd0TmN6UmFkREpyZDBaSVlTODBNR1pHVTFOalJUQXdkRU0xVFVWRWVGZHRMMFJJTVhGclNGb3JLMjByWjNwTU5GQlZkREZUUVVsbkswRkpMMnB3UWpSWlNXOTNZV00yY21aV1VVNUxORkZuTmtWRGNIRnlhV2MyTTJkMmNEaFVNREpsVVhKRk5rOU9VR0YzU2tsS0wzWnlUM2t4ZW5aMFdqZEVSamxLT1ROVVpWQkRkazFJZEZGSVJYQlhTMmxNUkZodFdISTFaa1JoUnpORlZHOW9RMFJRYlVWT015OTRjRzVZSzJwc2EyMTRjVFoyVTBwUU5GVmtWM2xIYzJaV2RWQlVhMlZXYW10blkyTnBUbEZHV0hBMlNtZFJXRTVDT0c1clpuZElVak5EWlN0V1VXMTNkMHhTVFhWTVNsQmphWFZNYlRNMFR6TXZkek5EWjI1eWFEVXhRblVyUm5oallXZ3dkVEV5ZEhrM1lXMXNXbFZtY1VOalZWRnRZV3h5VEc5VWVUWXZaamhLWkV4cFRHTlVLMU5YZFdWbUszQkdXREJEYm1oSGREbFlVRGR3Y2pBNGMwWjNQVDBpTENKdFlXTWlPaUkyWVRFM05HTXlZVEUwTXpKallXVTNZV1l4T0dZNFlUVmxNVEZqWkRaaFl6aGhZMkptT0dZeU56RmxZakkyTnpJeFlqZ3lOakprTURrMk16UTBORFEzSW4wPQ==',1612962681),('M5k64x2lbHdVMkD4zAUmSHCBPDLvN4GZcKTTTZQJ',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa3MxZG5SemNGRXhVSEpXZUdKM1ptTlJha3BETDFFOVBTSXNJblpoYkhWbElqb2lTMlE1ZFdOdmNqZzFaMDFIVUc1Q056ZE1XVmhvU0haaVdUVmlZM042VTA0MGFWQndhRFZZWWk4emNFZHhRM2gyY0ZFMk1GWnhRMFpLTVd4bVZYRkpVVGx6VFVvelUyVndkV2xxVDJkeU5HSjBlQzl5YkU1SlEyaEhkSFJKUzNGYU56RnFhRXRWU2s4NE9USjVOM3B6YVdoWFZsSmpVSHB5Wmt4dFNHTlFaRWxLY2xkNlQzbFVWRTR6WVZaMGNHRjFkakkyT0M5VFkyUktUMVIyT1ROcU1VWnFUMWcyVGt4S2RXOVRTMEZIYTJSTFlXOTBia0l2VjBKaVVGUnhkbWhTUm5CTmFYTkdPR1UzSzNvelVtdFhjVEpVUmpaaVduUkhXa1J4SzNZNVdqVnBkSEZWZFhCRmVXeG9URXBUWkhRMmFuaEhRM0Z1WkRoQ1pIWkVObGt4ZWxoSFJDdFpSVlV3ZEVsTWNsbE9Vak5OTm13MVlYUndUMGhHZFVwVk9GSTVkVlJyYkVWaWFtMVhURWhtTXpsc1JrRkRORXBZT0ZscVNubENkM2R5WlU0MldHdGFWR1psYTBWdmJEVllOV2xtVlVjMWVrZ3djM1UzV1hKQ2RWZ3ZWazlVVjA5TFozUm1NWEJ6UFNJc0ltMWhZeUk2SWpKbE1EZzJaall5TjJGbU5tRTVOVE0yWlRWa1kyUXdOakk0TVdaaE1XVmlPVGxsT0dFNFl6RTNaakF6T1RGaU5qaG1ZMlF3TlRWa09EYzJNRE5pWTJNaWZRPT0=',1612939272),('nanEcCLZThLbCjkuWHBYaROsZu5prcP2DOsk4ObG',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJazR4TlZCbU9YWTRZVTlsTkhsalQySkphVVp4UmxFOVBTSXNJblpoYkhWbElqb2lOQ3RpVHpsQlFrOUxWazB3YjJRME1HWkVWMjh6VjBjNGFXMXNNR016VFVkb1JWZFRNemhNUW1OQk5ERnhPRU5IYmswelJVWTFSVlp5TkROMmIwd3pWbWc1Um5aUFluQlZabWhTU0dkRE5EaEpVVXBxY1ROYWRqQmxNa2R4U21kTVVrcDVjVWRJTTJ0RlpWVmpOMjFHUkhkNllWbExkazVDVG14aFpXOHlZWGxOT0V4SGNWQkhWWGRPUWpCeFZXb3ZhbU5IYlVGaldteGljakF3YlhoSlIwazRUM2RPTUVrMWJtTkpNM0YwY1dOUmFFNW1PR05wZDJ0TVkzUXlTWGhTSzBadU9FZDNWbTlCTUZacVQyaENTMWMwWlV4aVVtUXpUMnRNWldkdVdVWmFUalZhVlc1VU4wSnJjbXRpY1hsVVZqZFFabkZNVFZwME5sbHlkMDFKTUd4UVlrb3ZWMVJIY0V0MlQyRkNhalJxVlhaR09HbGtNMmg1VUZsR2FFMUVia2xDTTBWdWNtMUJSVk52YzJ3MVdYZDBWamxuYTJKS1dTODRTekpxVlhkWmVqSlpNMk5vTUdORU5TdEdZMjVGVVc4elJtbFJQVDBpTENKdFlXTWlPaUpoWlRZeVptUmxNVEJsWVdVNU5UaGlOakF5TUdaaFlUTTJNR0V5TlRsaVpESXhZak14WXpGaE5HWXlPR0UxTkdJeU5ESTRZemc1WWpjNE9HTmtNV015SW4wPQ==',1612975510),('NtInP1UrwBQTRdZiR06rlbSU8IizeLQAW5zO27Rb',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa2QxVDFNdmVtOHZWV2RRVVVsRVVIWkpUa2RzUmxFOVBTSXNJblpoYkhWbElqb2lNM29yUml0M1FqQjFXbFptWkdwV2IzazRkMUZ5TVdwSWJXWmllV3AyYW1WWmNVNDNaa0p3ZUhobGVUTlpNelZSWXpkd0szZEhjRlJTUnprMlF5dDJWSHA2WmpsbU16TkJkRzlPY3k5SU4xbFlWMXBPVDNkcU5YaEJiVVl6YWpSaWFtNHhlWEZLU2pWYVl6aDFSMWhrY1V0UlIxVmpSRVZzUjFaVGNpdE1Ta1ZCY1RWU1ZrVnlVMDUyTDFoMmRGTlRNMGMzUm1OemFtc3ZUblFyVEdWMGRHNTViVGxMVVZGd1pWWnNPU3RqVVVjeFIxUkhlRTFKYVVOMFQzWlJhV2MxWmxKc2VYVjJZWFpST1Zwa1dIRkZiVTVCUWt0TVZXaEVabTlwUVd4TlptUjNLMGh3VlVwTFNUQmpXV0k1VUdkbk4xZEtZazl3VkVsb1QzQTJZMUJMUW01YWJYaHNNRWRKVVVzdllpdDVabEJPSzA5dWJXRTJSVllyVlVwRVoyRjRRMjk2ZEdKcmRtZEhjbXRyYkVwbmQyaEtibmhWZUM5VFdsQTFMMnBGWWxkMmVVa3ZabmRSU0haT1MwZ3pObk5KYUdnMFNHMW5QVDBpTENKdFlXTWlPaUprT0Roall6WmhabVl6WWpnellXTXhaVEJsTVRjeU5UWmhPVEJqWldRMk16YzRaVGsxT1dNeE1tSXdPRFE0TkRRNE1HRmlaakZrTnpVd056WmhNak5oSW4wPQ==',1612958695),('o886b48NFfVwf2ghR1rn5yoO5LUcHd5WesjTdRKx',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbUZsVDNScWFtTTJSSEZxVmxVM1ExRTVOWE5QTTFFOVBTSXNJblpoYkhWbElqb2lWV28zU0dZdlZWRk5NbFJwTlhwc1VVbHlhM2w0YjBKeFRscFVTVXBITlU4dmFFZG1abGt4UnpOYVdWRnZkRXRyUlVOSmRVUjNjMjUzUlV0aVRXcGxSVmxVUzNoVmVtUjBjbnA0V1hKVGFrSkRZVEphVjFKUWF6SmFaazFRYW5KWlVFOHlkVnBFTHpKRGN6VlBiMGRYSzNkcFJVdFRPRmRrU25sTVlrRnVXblFyV21GQmRFbHpVMUlyUkU5NmFsZFBlazVOTm1kRGRHMXFVWFF2UTFSSWNqVnJaVXRNVUdGUlowaExVRzVzTlhSV1ZFbEplVTVOS3pCM2RIVllNbkEwWkVoaE5rUnZWUzlLZERCcE9HbGhhMHBtUmk4MVVGZFNVR2hWUlZCR09YWjJRWFpWVjBSU2RYTnZZMEo1ZDJKcmRqTk5MMGQxWjNoUlJXa3dWMFZJZGxKeFpuWnVRazV6VG14aE5sRjRhMU5pZWpCdVEyeFdOWFJFY1RSVmFsSlZNMnBsY2pOdmJsUm5TaTg1V21GSk1YVlRRM0ZrWTA5a01qa3pNMWRUYUVwS1dIWktRbWhUVFRCbmFrSk9kRVJGY2taa2VXUnZiRXhrY1VoYVJ6RkJXSGQ2V21wQ2MwVk9WVFpyUFNJc0ltMWhZeUk2SWpZeVpqUXpPREUyTnpSaE9HUXpaRE5rTXpka056Z3lZMlJsTWpoa09EUXhNbVkzTWpjelpqTm1OekEwTkdOa01EbGlNamd3Tnpnd09HWmtNelkwTVRjaWZRPT0=',1612950974),('olehTjXPXleLvWurNlHPMsP9VYqVLP9lEBgAtuaJ',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbVJCY1RaTWNXWlpSSE5HVm10VWJWRTJhVEZCUVhjOVBTSXNJblpoYkhWbElqb2ljMlY0VldkRWJVZG9iMU5qWmswNE5EY3djekU1SzBoa2NraHlaMnBCTkZwd2RreDVaRmxUZHpRM1ZFOXZla3hXV25wc055dEpkSGhpWkdGSlMyaG5RekZPUWtwd1kweFBibGxMWmxaMFVtUmhTREJXY25sNllXczRhVXRYUlU5SFNGWTNaM05XYXpKSk1sVlZlakZQUW5wek5rRXlNbUYzUTFkYU1ERnJjamRWWjBSSmVYUnJjazFwWlVsUFZWa3phMWxoYzB3MVdVaEdPVmRCTVdGSU9VOXlMMVpxVHpKcmJXeHRRelJUZDI5V1UzZFVNbVJwVTFwYVRWRlVLM1l3U21nMlJreGtTbUptVlROYU9FaFRSVUZXVTB4S2VUSnpjMlZsVkVoVk1YVXlSazFvYVZobk56TjZUVFJNTm14MkwwOTZjbkkzV0hCclZtMWlabWN3WVZsdGNscFBjVk5RTVZad1NWaFVLMEpDYlV4cVRWbzJNbFpLV1M5clVITkRXaTk0Wm01eWVTOXlkREJUY1hSd2VUWTNjMUpzYURnNFdDdGFjWGc1U3k5YWQyVlRWSHB2YmpWRFlqZGxLM0p2YVVsRVlVZG5ZM3BaWVVsR2NESjRMMW92TURKT1RWcE1VMjg0UFNJc0ltMWhZeUk2SW1RMU5EazJOekk0WkdSbE5EWXhPREU0WkdGalpEVTRNREpsTURCaFlXWXhaVGM0TkRGaE5tSXpOR1kyWlRBME9UWTVPV1UzWVRZNU9EUTRaV0l6TkRJaWZRPT0=',1612930101),('oM9H8NDfsPjrl6WpOV7PRSPdUmvq6mGCVaUa0oQQ',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa2xXVFhneVJUY3dVV1l5UTJOUFRVeGpXbWxhU0ZFOVBTSXNJblpoYkhWbElqb2lkVk5rYkU1dWJIZEtWRVZFVVdNMlFWRnpVR051TDNSR1QybDJlbkV4TjNKaVVYWlZaVmhJVTNwSVluQjVWbk5vYURWcFNGVklSRTV5YlVScUwxTlVWR0V6UnlzclVsSkRSR2hqUnpoWVRuRm9VVGRHWmtsNFYyWjFWM2szTURWalVHUTFORTlPVlVobE9HcDBSV1pJZFdGcWFtWndXbWRWU2taUFRqUnlaMHRHZWpkSGVuQXdSMUUyYURSSmMwSnBWbGt3Y0ZWV1RrMTFhRVJJZDBzeFpFMVZWRE5XT1cxa1VFNXNhMEZFVEVoVGNtRlRTMVJTZWt4eGJrUTJSV1I0YjJFNGIyZG5MMFZ5Uml0RlprTlFNMXB5TUc5M0swdzRUMEkwVTA1dmNuZ3pja0ZOUVRsUVEyNVNSamN2T0ZoSFJqQmtjakJ3YkVwM2JGTmxSR3BxS3psUGVtNUNVekpWVW5aWE1tNWxkRXBYV0hsdWRYVmpiV05FYUhsT1NIcGFObGRsUm5KWkswcElWVzA1VUVoQmRrZzBNVlJFWVRkMldqVjFlVlI1Y1ZreUswUlNSME5pYW5kcE1UWmpVMjUwUzNVMVluUkJQVDBpTENKdFlXTWlPaUpqTldJd05EWmhNamd5TURFNFl6WmhPRE5sWVdFNE9EaGxaV013TldGbU1qTTROMlV3WldZd1pqbGpPVFJrTkRobFptWmxZV1UyWWpFek1EazBOall5SW4wPQ==',1612934895),('oT1RUwlrjegPXk9lHGNZnr5N2NX29iNl7mY8HWwK',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbEpGYVhsRVNFNHpXV2swZHk5R1QyZEZlVFpxV1ZFOVBTSXNJblpoYkhWbElqb2lSMmxLTkRaUlVuTkZlRk16VjJoWGNFaEhlV2RFYmxkNFVtRXhRVVZMTjFSTVVVeFZaa2h1VkdkRlRsaERhMnQ0YUdFdlJqTkdUbEIyTjFoMVRtdHJOa1ZUYVRGblJpdFdRV0ZtSzJ0SGJXOW1lVmRQYUVoc1JHSmFkRTVCY25KMFVVSjVRVXB1SzA1emJUUnpOeXN3ZGpSeFFVbHZUbk01ZDFKRFUwWlJlVEZFTTFodGNrSk1hVGRtYm5GSFVVUklUWEZxZW1wcVRrcG5jVkZ1TVZWWWRFaHVNekpSWm5VdlFVY3dUa1JFUXpSV1RUUjFlamxuTkRGUVJXaEhZM2RaV25oVmJEVmpSVUl2VVd4Q09XaDJRMDU2VUROVlJIcEhPRWx1UXpCc1FVRlFkREJMUnpselYwRkNhbnBOZDI1RldXNDBjaTlHUVVJdmRYWjBObVZhUTJ0SFQyeGpXR3BEVTFWMVkzTmFlRUp0Y1cxaGNHaDRabmdyV0dSek5YUTNaRkUzYVRSUWF5OVRTMWhKT0VGR1MxWndSVlowZDBvNVVHZFNiV053WmpkeE5ERXpNbU01UTJkcU0xaDFhRmwzUWpCSGRUZ3hjVWRKVG1SWmFsTlViekJFTkdkWFltdGpjR0ZGUFNJc0ltMWhZeUk2SW1Sa05XTTFOelJpT1RGaVl6Tm1PV1JtWmpReU1qUTVaakF3WkdaaU1UQTROalZtWkRRek1ESmhPR1E1WmpJME0ySXdZelExWkdaaE5Ua3hNakkyWlRnaWZRPT0=',1612971070),('PBjIaAyN33LliYHCHofW385Xlg6Sy5xb5unRwVBi',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbVp6ZEdWNE5FaFJaVU01ZHpKMGIybGFXbk5HVDNjOVBTSXNJblpoYkhWbElqb2lWakl2VTFkelNIWmxNemhVUzI1R1VVWjRVMmhPTVZrMWRVeFFaWGN2YW5GRVkwOXVLM3BXZEVGdmJGRjZVRlJ3V0hveE9XaHdSRXROZVZSUVkyRmFOV2QwWWxGTVZuQTVPRlZqSzNncmNtZ3dSekZxUzBWRFYzRjNMMUJ1VWsxWmNEWlNNaTkwV0RSeU4xTlBSMHhyV1hKbmNrRlJORlZXTDNaemFESnRiV2xyUkZOTlpGaEdRVFJQYkRCaWIwb3ZkR2Q2ZWpjMU1qTldjSFV2WjFKQ2VscHJZalIyY1Rabk5FZ3pTM2RIU2pSaFFVdDFObXRFWTJoNk5ucDJSbUkzUVhObldFMHpiMFkyUjBzNFYwMW5aVTlFYW10S1dWcE1PU3RoYVZnM04xTkZRVnBMUVVzeVFVMUZiVXRUT1ZVNVRtaG9SbFZNVjNOaWVVSmFRbFJ2VjBrMGNVRXdUamR2ZEV0d1RsWjVNQ3RGTldnNWVWbHVkR1JWWkhoMGJYQTBiVEJKVmpoUVRYVnBNM1JITldWdk4wdExWMHBpTjNGNVpYWmhWRU0zVnpnclVVeEpiMUpoT1c5eU1FWnBkRTR6ZDA5dVRYaDRaMWxpYjBKc1ExbHdlVlpNWkdjdmFEVXZlRWRaUFNJc0ltMWhZeUk2SWpNell6TTRNMk0yTmpZMFpUVXhPRFpoTVdRMVpqazVaVEl4T0RFelkyVTRPRGt4T1dFME5UVXpPR0ptTXprM04ySTNOelE1TVdFNU4yRXdPVGc1TTJNaWZRPT0=',1612950973),('pQV3hNVI5ToqDmII7rygDjvEm8dNYYSklZpCbgXZ',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJakY2WjBVek9GQkxiMXBDWXpRMVZHcEZPRFIxYWtFOVBTSXNJblpoYkhWbElqb2lkRU15VG10cGMySklabUZXU1U1WmMxWllibXRVU0hwUU9FWnNSbE15VlVOVVNERmxjMUF2UmxWdFUxSkdUVFZWUm5acmNEbGpRVGRFTmxkMU5UWnNhM2hFVFhwblRsQXJTVEpEUVd3eVoyTkRXREI0YWxGcFZFVTFkVkJFVVdkMFFrVm5XbFoyTDNkTksya3piR2MwU21WdFQyUXZRbXd3YmpsUlZFeFBUekIyVTBSbVUwUXdWVEF4VnpaTGNEVm1TR3h1YzJ4RVJrWk5RVlZtYWxscVNEbFdWRkJXTlhaelRITXdOazVEUlhKbFMzRmhPRmszU2pabmNuSkZURXBQYTBFcmEyVkhOak5XU0VSSVdXOUVOVFZ6WkdaaGNUTm1PVkJuWmpkM1UyaHRaakZMYjFCM1dHaFlabGxWWmpWNlZqRkRUVW8xYkV4cFVVRmxjRXg0VkVjdlptaHJPVWxoY0RaT01rUmpSVTl4TTFWbmJFNVRSR3BsYUhoUGRIaHdSWGhPVkdVeFVHbzNlblF4ZFUxSVpubFBhRXBsV0V4bWIyMWxOVUUyVGt0d2RVeG1UV3B2VjJ4Tk9XeEpUMk40WkRRMWN6TlJOazV1V2xOTWFWcFpSa3MxZG1ocGFITXpRVzQwUFNJc0ltMWhZeUk2SW1VeE4ySXdNREZoWVRJNVl6RTVaV1ZoTm1RNFlqVXhaR0UwTmpRd09XWm1OREExWlROa05qZzVPRFExTkdWaVpqTXpaRFV3WmpWbFlqSTJNakUzWXpnaWZRPT0=',1612954720),('PyjMBOepIkLrBrYJX7mEcOn3ewup9rybFFHcFiBK',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa1ExUVVKNlJXSkxWbWt5ZG1rM2VGZFFia0ZFWm5jOVBTSXNJblpoYkhWbElqb2lXVlJDTTBVM00xZFBXVTAwZFdWYVNESjRhME5EYmtKdFNVRnNOamhSWms5WFdHZzVTRFp2SzBoaVpuRnBhakp5V0c4NWExaGFVMWxxYWswemVXVnNRV3N5Y2pkRFRFVnViRGxzU3pCMFJFUlFWR0ozTVhwclRFMTJURVZaVTFKRlJ6TkZVRmRDUzBwUGJuaGxiR3BsSzJaclRrTmFLMFIwT1hkalYwWTVSM3A0UjBsc1RVMDJUbWxrWmxsck0zVmthMmhYY0d4WlVrOVlRVVZDZDJKa1ZqZEVTVmhpWjJoWmFYbFFNVEZGTlZGVlJXUnNNVUpPUW5kVVNGcHllWGhQWTFGSE5ubFlObUZhTjJncmVGUk5RVE1yTTJoU2NrOVBOSEF3U0hOWU5URnFTVTVOZDBsaE1ra3pOSGxQZGtORWF6ZDBTVXB1ZDJaMlVIWnNiV2xCUlVzMlJFcGtNVVo1U2xrMGMyeE5hV05XZEZaSGFsUktSVTFpVEhocVNVNW5UbWwxUVZJNE9FTnVMMmxvTjJWWFYzQm5WU3RYTVVselQwUkZPVU5vUkRRemFFeHZjV0oxT0NzNU5raDVOMFptVVZkUE1WWm9ObTVQVUZabU0wMVNNRTVPZWxWa2IwTklXRzlaUFNJc0ltMWhZeUk2SWpZMFltSTVObUl3TkdSbU1USXdOREkzWW1ZNFlqVmxPREppWWpnMVl6RTVZV1UyT1RGak5qZ3hZV1V4WWpKbU56VmpNemsxTXpSa05UQmxPV013T1RBaWZRPT0=',1612972040),('QgNEXvEtfI5w84thWeSZtcdIRK7syHtTvqPlmJXX',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa2g1WjNwS05EZHBiWGRPTjBWcGRuWktObVF4VldjOVBTSXNJblpoYkhWbElqb2lMMk0wZEVneFIyTjJPREZaUkhKaldIZDRhM3BZVWxwMFZFcGxiRlUwYVVKVU5rVkJRV00yUVVwUlZEaHlVRzlpSzBkMmVXNUhNVTVXUzAxUVNVWklURk5YVkZKTVdHNWlTRkZNVTJ0TWRuUkxkakpJVEVFNWVWUkZkM1ZxVEhsQ1VWcFBaemhrUWtSbWRHdHNLM0p6Wm5CQ1RWbGhWMk5vUXl0YU5FcEZNelV5VFVaWllWbDNkVmhUWmtzeGVUaHFlVmh3WlcweWJqQkxPV0ZFY1VaU1YzcERhV05GY2xoUVlrNVRVV3REZUZSQ1JsZHVlalpHY1ZjMUwwRjBNRmh4Y3pGVlpEaHJXV2MwTXpSM1RqSmlPWEJqZWxaNWEyaHRVa2hxT0RnM1NHRnNOR3cyTkRZNVpXSk9RVFZzUzFWSVpYWnRPRU0xUzFGVGVXd3ZWMFF5WVVOdlEzZFpOMmg0YjNObVIzTlVORkozUzFsalZuTlFPVTEwVm1aRE1tcFlZVUZ2WWxaMVFWRkdjVEZuTW5jNFEzbGtaMmN5ZG5aVGExRTJXa2xSUmpsMFMweE5Tbk0wTUZoVVFXNXdhSG93V2pJeE5IUndWbmR2ZFN0Q1FVWnNjak13YVZvcmJXMU1SR1JWUFNJc0ltMWhZeUk2SWpJNE1qazROR0poTVRObE0yVXhPV013TkdNMk1USXpaV0k0TTJNM1ltWXlOV001TURSbU56RTVPVGxoTVdKaU5XWmhPR1ZrWkRRek5HUXdPREkwTW1NaWZRPT0=',1612954720),('RKYLIC3adLpybDq7TQlFzgV9TzT2ecgO4ncQUgoI',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJa3N5YkhaUWFURmFNelJLVlRGYWVFZDJVWGhvVEVFOVBTSXNJblpoYkhWbElqb2lXbmhCVTBkNFlrdGxhV2d2Tm1oSkwwSTNVVzVaY1hrdll6bHZaRXRWVDBaSVV6RkZSSEozZFZNdlRXaEdhRk52UTFBMEwydDZPVTk0UjNWME5TOU1NMkZhUVU0eE4xRkhaRWRFYTJSb1JHOVFiM1JoZGxoS2EweFpTMlZKUm5BemRXZDZZbTlLWjFCbVEzaFZXVm8xU2s4elkwUnBPR3AzZW1GM09EVkJWR2xETm1aVGJFMXpRbGRyYVhoeUwzZENhVmh4V0hZMWRVMDNOVmhLVm5rNVZtTXdaMmxuWlhOb2MwMU5NbUU0YTA5bVkwNHJiVkptTm1sQlZWQnBVMlp4UVd0eGIxUjNaVk14VDNkMFFuUTRXV0UzV1daSE4zb3pSbmhJYnpsVGJWTXpVWEJ2Tm5KSVFtWkJNRGwyZWxJd2VXTklVbXBUWnpRd01HeGtUMlZZY0c1VGNtMDVhWFozVERodmRVSmtSbWg2Y2pKeWIyaFFXRlF4VkdaWWRTOVdRbmg2WVN0eE4yZE9SRVpIYVZkdmEzWlJURWh5V1VWU1JHSmtTbU5DY1RkeFEwOWplVWxpV0M5NFppdFdiRlozUmxKS2RHUjNPV3hSYjJOMU5HZ3JSalZSUnpoMmF6Y3JURFZSUFNJc0ltMWhZeUk2SW1JeFlUVmpNek0wWXpsak5EUmhaalV4WmpOaFpXVXdaREV6WmpjMU5URXlNR0UyTVdObVptVXdZek15TlRaallqbGhZamxsT1dFMk1UZGlOREprTlRnaWZRPT0=',1612972020),('SfSCf2Xd5K6ek9Sf2ULs00s1ZLNKEAgZ0Fvqwq5S',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbG8xUVZWQlFWTlpWamgxTTBkRE1IZHRiRmxqWWtFOVBTSXNJblpoYkhWbElqb2lOMFp1ZEVwck9YVnlMMmx3UmxOQlJuUk5kMmhOYUdGNlUwOVdNemh5YTB0bWNqWmhOMk5JV1ZSeVoyZzVTME54YlZKNGJVOUdOMXBYU1ZwM2VsSjVhVEVyUjI1RlVFWTJSakV4ZHl0VWVtcEZTR1pWWkdSalNqbGlNblV4YVcweloxY3hSVEU0VXl0VlZWRkVjbkpVVWxRMEsxUlliMDVqVFV4NWNYUkxLemxXZW5NclIzZHFLMko0UkhKaWRXVkJkV2RKWVV0blJIWkJlR3B4U25Rd1dub3hNVFJOV0hST1RtdHhhbGR3YlVkWlFUVXdVMUZLWWtOS0wyVlVhbVJIVEVkMVFsTkxZMFZOZUhSWVRVMWpiamhtVVhaMFJsZEJUV000YzNsU0wyWkVSazFrWlRRM1FscGtkVTFIU3pCdGIyNTVTMDgxUjFoUFJsVkVRbmszVUhWWVluSjZLMlpIYUhBM0x5dGpXRk5pYm1OaFVHMWlXSGRrTnpad1pGRk9ka0pSUW5saWEwTnpTR2s0TVdFNGFVMDFVMjVuZGpFelJrcG1ZblpYYUdoNFdYZzNUazlYWTFaYVJ6VkNUblZ3ZGtsM2JXMUhOVlp0TVVkQ1pVeHpSV05YY1hWWFJrSnZNQzlKUFNJc0ltMWhZeUk2SWpaak16UTBObUUyTjJGak1tVXhZbUZtT0dFMVlUTTVNalV5WWpVek1HUmlZV0pqWlRjelpqa3hOemd6Tmpnek0yTmxNVGt4WWpjMFpEbGxPR1l5TVRRaWZRPT0=',1612962682),('SY22ND9sXLIf2Af6pA0fxReZxnVJuhrQTHdGZrLo',NULL,'112.133.246.34','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','ZXlKcGRpSTZJbmhYYTJ3MU9UVmpTbk5SY1N0dldXSk5aakpIYWtFOVBTSXNJblpoYkhWbElqb2lOR05YUkZCaGMwdFBlWFpsYTNWQmNESkhlREl4VGtWa01XaDZWRUowU0V0aFFuVmhlWFJvZDBkUlRWWjFZblk0YVZRMmJYcFRNRkJFYkdoUmQwVjRUSE5LTTJwM1dHMDFRbnBqU0RsWFUxbGpkbVZKVFU5dFVIcEZZMlp3U0RaalNGbHJha28zU205RWRIQnJXbEZJU2xwUWFFMUthMGhJU1VoT0wwdFhjVFpQY1dSNE5XbDVPSEJsUjNKWWJHTjRka1pQY0dwaVRHYzVXRXhJTmxKMFFWVlBUbGR3WmtjNGJESkZiakpPWWpCM1JXOTBablJoVFZkWlUwUlVUR0pHVkZWblkxTnZTRk4yU0hGWWJXOXVTQzl6UkZSTFYyMDViV0ZPTDJwQ1VWaENPUzlVYVhodGIxTnRRbmRYYkZOdVpEZDBVRlJuZERsdU9VMUpZVEIzZFVweVNtWmxVemd5UkdGT01YQk9ORXhDVVN0NVprWnFXVEZpU1d0aFkwRlFlVGxGYTJkT1FuVXdVR0ZaWldacFZYTm1ObGhIVFV0UWNrNVFkRFo0TjBwc1pXRlJXVFZDY3lzeWMyNVZOalp0Y0hNdkwyUXpValJsWlVGV1UxUkZNazE2UkZOaWRVTnVkMmhSUFNJc0ltMWhZeUk2SWpJMk5qYzBZemhtWlRFeU9EZG1PRGt6TjJReE5EVTVaV0UxWlRZMFltRXpOV1F5TUdKalpXVXpPVGcxT0RKalpqRXdOV0l3WWpVd1l6UTJNMlpoTmpVaWZRPT0=',1612940874),('Ta1z6Svlys9XFmiGSDg9JxFwiEc8QERwEFo9xXqU',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbmdyVFZJeFpUaHBhMlZTZW1kV09EZG9NU3R3UW1jOVBTSXNJblpoYkhWbElqb2lLeTh3YzB0NVdFc3JlRkJCVVdKc1VubHFSRTQwYWpWSVZtRjBhVWxtU3pCeGNIbHhZM3BVUlhBeldUSjJhakJIVDNrME9Va3pkVXByVldweGRuQmlkbVZxY0ZWUk5uQklSV1ZtTjNWSlpFNDBSMVJKY0hCNWRUSkxlbFZuWTI1RWIxQnBNVTFsY1N0blNUTllTbUZTYUZrMk5qUlZhRVk1WVV4Q1ZYZFlZM3BwUTJ3MFNIbHdiSGhGVlZOS2VWQnZVbk4zYjFRMVpuWlpOR2xNTTFKYVltRk5OVXg0VEV0R1kwUk5WMEUzUTBrdldUSm5XVUpVUjFremJuVlhWMnhtV0ZOMWVrWjZUVkJTVUVoamVsZ3hUakpRYjFGQlIycFBRbTVXZUdKNGJFZExTRTF4YUZGU1dWRkNhWGRJVVRoaFdGTTVhVlY2V1RCblYwRndSekUyZGxkWFRETnhVVEZvT1daaVRqbFlTRUpwYWpCWmQwaEpUa0pVTDBoMmIwSmlNMFZsT1ZKVWJWRTRTRkpXUWpoc2RtMVNibVJFU0RSU2FtdFFRM2xITURacFdHMTZXVXg2TlV4YU9HMVNiMUZ2VEZOM01XUlFNa3RyZDBWaGJqVlNhVTVwTlhFMVQzTnlSSFZ2UFNJc0ltMWhZeUk2SW1Vek1qUmxOV1l3TjJJd01qTmhObUZpTW1Wa01qYzVaVE00Tmpkak9HSmtaalZsTjJWak9UazVOVEl6TVRZNE16SmpNR1poWVRJeU5tWmlZbUpoT0RjaWZRPT0=',1612966793),('TFHeT3Nd30IjoqT6fNfRvCoL7PtWBoFfOz3TZsDE',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJaXROTDNkSk5pOTBjbVJNY2xsclIzQm5NRzFUWlZFOVBTSXNJblpoYkhWbElqb2lPRVozZG1aVU5WQnpOVUZoUnpKTFJISTRkM3ByVm1oNE9IQklWRFJJVjFGaVZtczRXRXRQY2twSmMxbERNWFJFVDBreU1tRkxhV28yWm5Vd1dFbzVSamN5VlVKWmRXRkVPV0UzTURZNWRUaG9Va1pJVDJRNVZXcFdWa3RLTlVkTVVVSkdSR3Q1YTBzd2JIVnlNMlU0TTNaSWRYSlFWR2RST0RKSGN6QkRkRlJXYWtsSGVURlpabkI2V2t4WFFVaExkVmx6UTJwamJXVjRkazVLVGtabmVXeFNTMnhKVUc5TlZEUkJOM1JSWm1KM04zWnZWMFJKTWk5NVVTOHlNRmd4YzJSWVIwaENhbTh6TUdGVFMxYzJUMHB5ZGt4dFMyaHZjMnBMWldOWUwwODJaalY2UkZOU04yUnRSV3hEYkZWWldIaDJXVWhrZUdNMFprRkVhR0pDTW5aVWJuTnRTWFprTmxkeWFsQnlValpxTkVKVFJFaGxXRTlFUWt3emExVlRlamRETVhaT1pXOW5jVzlvT0RaTk16TlZSMlpYZURkc1EyVXpOSFpoYmt4NllqSktjbGhZYTJsNGJWbFlSbXRGU1ZOMFdUQmpUVUp0UkhWMlduSTNSamt3ZFdnNFpsUkZhMDlKUFNJc0ltMWhZeUk2SWpobU9EaGxOV0k1WWpZMk5qVTNaVGRqWWpKbU5EWTNOakJrT1RZNFlqQmhaVFEzWTJaaU9UUmhOVEk0TXpVMllXWTJPV0UyTVRoaU1qUXpNVEE0WkRnaWZRPT0=',1612934895),('voLvK9h033BfezuBaHq32ds8qlyiel0vDErhxUdi',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbGxFZUV0b0wzVm5XRmxrYjJjMlN6ZE1WR2xWTWxFOVBTSXNJblpoYkhWbElqb2lObTFqYzBwU2RFNWlSRVJIWkdwU1JGaEZibFpJU21KQlZTOHdkV2h0T1dVMVFrZGhUbGdyYkZoRU5FWmxVMjVUZWs0NFduaE9VVk5uVW5oNVpUWXpZUzlNYzNOcVQxaGpaRkpYTDJ4NlMxbHRXa1JtTjJacVIxVTBRWGR1YzJGcVdETjRjVnAyV1dGT1QwNXJWR00yZW10SVltdDRVamMyYlZwQmNTOXROV0l4T0dSSk9HVlZUR1JYVTNSSFdtSlZNbGhtVlRoVFVXazVhMVkxYUZwUWJYZHlObXBWUzB4Mk4zaHBhbGszTkVKTlZVcHFaR04xU1ZCU1REY3dWR3R5VjIwelNYQk1ZM2xJTUdSeGVubHhUV3BFUkVOeldtZEdWMkpPTVdsVlEyeHpSV1psTkhaclpHbExjak5qUjFFMmNrZFRkRzV2UjFCSVUwRlliM1pVYjJFNWIxbDNMME5WY2swNVRrRXZPSGREVW5CblRHMTVabkppWjNaYU5YVk1Uek1yY2xWWk5sZFJZbXgxTW1wSGJuQlBOa2xET0RSQlExSnBjalF5WTJNdk1tWmlVbEJwTlRJd056WlVXVFJXU2xod1J6bG5QVDBpTENKdFlXTWlPaUkwT1RSbFlqYzVOekJtWlRFM05HRXpPR1EzTnpJMk1UVmtNakF4WlRRelpEZzRZalZpTkRFMk9ERmlOR1l5T1dKa1pEVTJZak5pWkRnMlpEWTVNR000SW4wPQ==',1612966792),('VsNtbBqMfWurBWb6NTUnunx7HpGOgpO1f5FtB3yG',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbmgxYzFCT1JFeElUekJPTlhWWlFXbE1NV3BRVUdjOVBTSXNJblpoYkhWbElqb2lkblpNUms5WGRXaEtZaXMxUzFkMFlWbEtlbWxPUjA1cE5XRnNUV1JRV2t0M2RrSm5jVGhoVEZkMFV6Rk9NSFpIUldWNU5FZzNVMFJMWm5waWNWVkhTR2xRWTBoclNUZDRNa1Y1Y0RSc2VGWkxlWGh2ZEdKNU9FbFlPQ3R3YjJSTk0wdGpRbEZCWjA5VE0yZG9TVzFVVGtaUVlXRTNWVXhNZG5sQ04wMXdXR1p5TjJWalNXaFBlbVJ2YjIxcU9ERnNiMWRqYTIwMVUybFhObEpuT1dvMFFWSjJUamRLYjBGU2JITlhiRXB3Um5nMlVFdGlUa0l3VEVFdk1VTnFiamQ2VmpGVlEwcHRNVEl6TW1zMU9UVTVia3BJZVdab1NWWnFVUzlDZVVkeWVYQjBaRFJ5UWs5UVowaFRaRzFFUVRoQ2RUTTVhVnAwTVcxRE56SlBURFJ5WTNKVVZYcGxVMGRqVVZoUWNFeENjRTlVYTJOQlNVTXdURE13VGxaYWVuSTVlbWhtYnpoeGFqZzJUbXBhYW5FMlREWlROMU5uVFRkVGJXczBRbEpMSzJSNFRYRlpZekZFTUdsbVoyeElVR2hoYmtsSVUwdHpkR05DYUhoUlpHNU1OMjFRVjNKcWFUZEVaSE5SUFNJc0ltMWhZeUk2SWpVMFl6QTBNRFl3TlRZNVpHVmxZekl3WlRWbE9EWmxNakZtTjJZM09USXdOakpsT1dGbVlqWXlOR0UxTWpnMU9ERmlaR0ZrTkRSaVlUa3daREl5WmpNaWZRPT0=',1612947344),('VzEr2eBBLB77WYvfK9UFLOs6ruxTHrJ2Cq9A3TJV',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJamxoTTBWa1RXazFabGhVZUdGVGNuWkxURE5yYW5jOVBTSXNJblpoYkhWbElqb2lTR1JoUVc1aGVFdFlXbUppT0RaUVZtbFFlV1JoWVRoRWRXTlRRVEZaZURkUFR6ZDFTRnBzYzI1bllXbEtZVGRTWmxNME9FMDFSMVpJUjI1dk1sUlRiVGRDWTNnMU9EQmxObU41WjI5UmVFWktLemhtZEM5bFJIQlJPVE5ZVVZkNk9GazNkRkZNWmxCbGVqTjRSVVJDTDJsSFUwNHJLMk0yUW1wb2JrUXZaMDVvUjBwc1p6VjJjMU4xTDJ4dk1rbFRTekZKUVhGRVR6VXZabUZWVTNaVFZsWnphVXhEYjNkWlpHa3pMMFJtY0ROR2RuTnNNbTVOVEdoQ1QyazFVbFJJUlZGME0yVm1lbGRCUkc5SU1XczJiM0kxTmtGUlRqTk5XV1JzZGxBclJGQk1lbEo1SzI1eWRVVnVjRkZ4VUZodGNVUTVWWGxFYmt0b2VsVndXbGhXUkRoalFsbHFaakF3VDFSTlRUZG5XRzVDVERaR0sxaEdiSFE1Tm05cmREaExaMjVHUTBFMWFETm1PSE5tVVdsRmVsbHhibHBJTHpBeVJFUm5ZMnhDSzJWbGVYVkNNVzB4VFVGTVkyeFZNMGhJWm5WaVVEQlZWbWcyZUU5aVpXVTNNVEprVmpCd2JYWXZMMUJGUFNJc0ltMWhZeUk2SWpFek9HTmlNamN5T0dOak5tTXhZak13T1dOaU16azBNemxsWkdGbVpXUTBNelkwWVdFeVltUTJObVV3WkdJNU1qZzNaVGN5T0dWa05HUTJNV0l5TnpjaWZRPT0=',1612975510),('W4p1bGW27YAFqISi58MT9BxHiiKkAJAMbJMeHb8i',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbko0U0VodGIzcHFlVkJEV0RWRVlVbERiVkZPUzJjOVBTSXNJblpoYkhWbElqb2lXRk5EUlhCdWRFSXJMMnN6Umt0d2QxRlJWVlkzUkhOR1NtVjRabGxHTDB0Nk5EVlJWMEZ1UVRkaFExSjRhRlJxTVRoQlpuSm9VblJNTDNGVFkyNTNXVzkxUWtaSFFVeFVka2sxYVc0NGVtdHNWVVV4U1VGV2QyZDVNM2xrUlU1TmRITlJOVkJHYjJaak5GQndaMmhtY0dwTFNYbzFlVWN6TWpodU1UQTRZbFJSV1Vwb2RXUnFNV0YyT0ROM2NsSktaRmRzWjIxeVRHUkVSelJWTkVWbE5XbGpTMlY1ZUZOV2FFdG1jbTl5WlU1a2MwdGlUMWRXZDJOQmRUZHdkR2wxZFZsSk4ycEpVMkoxWm5ScVRHSlhOQ3RaVDNoWlpXWTRTU3RoYldKdldrSnRiVFJNVTNWSWVYaEdWa1pYZEVWNE0xcG1ORXhHUVdOd0wyZHVPR2huZWpBclN6QkxNVEUwZGpsVlNHbHZTR3hpVEhWck1tSmpTa3hMZFcwcmNWaDZSMU5LTjJJM2VFeExRWEV5UldwWWIyWlNRM2xCYkV0bGVWaDZOREpYTjJWUVV6RjNSekJLVFdsT1dXZDBkRFZFVld0cVUxcGFSRk0wZGtZd2VtaFFPVWRMVUhGblUybE5UM2t3UFNJc0ltMWhZeUk2SWpBeVltVmlaak0zWmpRMk5qbGlNamM0TjJOaU5tRTJORFUzWlRjMlpUQmhaak15TURSaFpHVmtOREV4TmpBMU9ESTFOVEl6WTJRNVpqQmxOVGRqTjJJaWZRPT0=',1612971071),('WfCnWcmVX0FYtkDfZBK51E8GrStjYStWcNZBk344',1,'209.58.142.161','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','ZXlKcGRpSTZJa1Z3WmtGVVoyUkJNekZFVFRseGNrZGpRV3MwZW1jOVBTSXNJblpoYkhWbElqb2lTWEoxYWpjckwxaEpkVXc0YUVkSlZTOVRaSGxNWW5KRmREZG5XR3AyYTB4aFRYazBRMnhrVUVjelJVcGFObXh3Y1RSRWVYTlVjR2c0Y1RCeksybHFNRk5STVZrd1JITmxPRTFPVG1sdE9UZEhRV0U0WmxSNGJpOTBRMGRuUTBGUlFXWkdTbFZ1SzFoS1VXbENVbEk1UlhOeU0xVmllVGhSZUU5blYwWjVMM2xtU0dOdWMycENNSGQwZUZCVVVrdGtNR0pEVEdKUWNWRnNjVEJpVVU5aGIzRXZTVmh4ZFhOVFlsWjFibmNyYWpoc2NWSnRSMUpxVms4NFdtMDJaekJ6UjJwNldYWTBURFIzUlhoVE5GRm1kbUpYUTBWU2JuSm9TRzlJVEdrMU1UTXdNVVpXZFhSMGVqSlFkblJGTWpSYUt5OVRZV3h0Y0c0eVIwcFdUekZ1VGl0cVQwZHhSVlZMYmtaMFFWWnRNbFZtUTNBeEsxTm5jVnAwZFM5Q1kzVmpXbWhEWm00M2NFSmpUQzlhYVZSVFdFSnBlbXRwTm1ZM1ZuQjJWM1V4YnpaSlFVZE5PVnBLUjJ0S09GUjVWVzlITDJSWFdXb3lWa2xLVEhKak1tUnpUaXRFU0RkNFVWWTVNbGxtZDBabk1FVjBXV2c0ZFhnd2NXWnphMjgwZDBjMFRWSm1Oazh3Y2xFMGRsVlhjREUxY1ZsS1RsTmhNMEpxTTFCbE9WaG9UWGRFUzNkTFJIRkpNMnhqV25rdmFqSnRZWEZ6Y0dwclpWZE1ObkZVVm1wbE4wSnliRWhGTmt0MlpHeG1VV3QzVVdzdlpuSlFVVzFRYlRFNE5EaGlRM1UzTjBnM2R6aFVaMWRNTDBrOUlpd2liV0ZqSWpvaU5HSXhPR05sT1RKak56a3dZbUV5WVRCa05UWmpZbU5tTkdVMk1ESXhNRFk0WWpRMU5UQTRNemt5TmpaaVlqUmpZemM0WlRSbFlqUXpaR0kxT1RBeE5TSjk=',1612972764),('yH0QffJKGRM1htxhdHfIhlifvlhGRVDuSITZ1RSk',NULL,'34.72.172.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbXRoVUVSNmNsWldUVGhXZWxkdFVISjZhVXR1WlhjOVBTSXNJblpoYkhWbElqb2lkM05LYTNWSmVUSXlXVlkyWWtkT0wzcDViVXh5U2xWUGVWUmtiR0ZGY0RFdlFXSnVaRlJOU0ZGelRETlpWMVZHZURSbmFWaFFXRmwzYUdKbFkxRTVObVJNTmpOUmIyOW5hMWc1V0c5VWRrdFRlVUkxVXpkQ2NFUXZZa1pzUWt0cVpsQjVWM1U0ZDJkamRXY3pjRU56ZWpWdmVtaG5OMVI1ZDIwMWRrVlhNRTlNVEhWR1lTOXRaRmc0Y1V4WU4wZFlValYzZUdWV2VIbDRRbkpGTjIxRmNsUlFTMHB2TTB0VVYwMXBZVGw2VlM4ME9GSm9PREZNT0hBMWNteEtOWFJvZURjM2Mya3hhak1yYjFOUVdURTFMMVJyYUhrMk1UVnBkMUJKVVRJNVIyd3dja2QyUkZZckwxQnhVelJzTTNjclYycFVTMmxwVW5BMk5sRnlPRzUwYm1welR6RlVZa1pQZWpoMlJGSkJhMkZvY2pZeWVFMXZPV0ZMUmpWMGJrc3JlSGRqUW5kb2FWYzNSa1l4UzB0dk5rUlZXWE0wY1d4MU1uWnZTa0ZZY0RWU2JHUjBUelJST0dJeGJUazNURVZTZHpKMlF6TkxMMlJMVVRjNWIwcEhVVk14UnpKTGQyczFla3BaUFNJc0ltMWhZeUk2SWpSbU9UbGpZVEZpTkdNNE9EVTROek00T1RkallqTTBPRGczTXpkallURTRabUkzWXpOallXRmtNelkwTkRZd01ESXhOR0kwTURnM09XRmhZV0kwTlRnaWZRPT0=',1612943485),('YiQfGdJhXNYhSDRHebZ61gDeJA72p3oRqLIidHAC',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJazFoTmtsa01XTlZSRGxPSzJvMGVqUjRlRkpNTUVFOVBTSXNJblpoYkhWbElqb2lTa2wzWkZCc1VUWldWbU4zWWt0Skx5dHdVRGxTVUhnNGNsVlplakJVUkdoSGMwTnJOSGR2Ym05c1dWaEdieTlHWTB4all6VlpiWGREUXpCdWRrVldUWFE0YlZWMlFXNUZNbmhYVVVoYVJHOUpPVUppTnpGc1ExTjFWbEV3TTBka0syaFpRV05pYm0xVk5uUTVNblZUTnpodWEwRXpNR3RVUkROMVRTOTBaMFEyU0V4aVQzRnRaM3BRYWxCSVZsRnJUWGxsVjAxd0wxWkZXakpPYkhZeE4zZElTVUpxWkdaeGVWSXpVbXBNT1dsVFNERTBja1pQWVVveVNVeENaeTh6WTNOcFRVNHhkMmxLZDFacmFVMU9VMFJVVEZGcWFtSllaV2xLYVRNNGRtWTBjR000TDJscVVGUjNPRmwxUWpOc2FrTlBTMVJoY1RSNFdtVXJWRUZDVkhKTWJFVlRkVEZtUjJoRU9XMXFRbGhOUzNsbFRYZEtVRWQyZDBOclZUbFVWa1p1VTJkT1Exa3diVGhGZG1obWVWRTRkVmhoVDBkWmIwWldVRlZhT0dwaVNEQjRjbWRKUW1RNVMyWk5TV1pYS3pKc2FUTmxUMWd6TTJWUksyMVFUVzlLWldoc2VFWkJORWhCUFNJc0ltMWhZeUk2SWpWak9HTmpOVE01T0dRNU5XWXlaVGs1TXpRM1pETmxNamhtTXpBMFlqVXdNRGN3TmpZME1tUTJNMkUwTUdKbU9ESmxPV0V6WmpWbFl6RXlOemczWWpRaWZRPT0=',1612930101),('yJqFFeP1TP6vzrMFpIGr7J5DGqFXbfKFWrGbKcYt',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJakpPVFdack5IbElTa0ppTlZveVltaFFObTlTWlVFOVBTSXNJblpoYkhWbElqb2ljeXREUkdscFFqQnZXWFF3Wmk5a1VsRmljbXR1VUV0VllVNW9OM2hVZEhRM00wZFFlRFpLWWtSb1VUWTBlRkp0VFRoMFFsQnpRazFHUjNGdWEwaFhXVEZJYkVOVFQwUkVRVFp6VG1wNGIzVmpZU3RMTVhKalFqRXhVbVpWVDB4bGFVcE5hRmwyTVVwMmFqWk5WVGxKVm1aNlQzbGhUbk5rWTIxbmNXdEdUa1JYYWtVNFJWVTBkblpPV0RRelYzaG5Oa3hVYkhsMVFYcE9XRWRzSzJsQ1ZFZHphazVQYmxkVWNFeE9hV3R2Y3pGS2RFcEpUbFFyWVZrM1VIaHRXalJxT0VkeFUzUTRRbW93VGk4M2FVOWtMekV4TVdWUWVscE5OMjlZZEVwaVRqTTNVSEZ0YTJkWWRWcHZlSGh0TjJoeUszaGhVbE53YWxFclNrVmlWa2w2VFZGMGRIY3JUa0ZVZDNSMlJFUmhWRzF3UnpKalMycEtaR1lyT1ZoUlMwRnhRMHR6UzB0VFRVWldMM05aVUV3d1JqZHZRak0yV0ZSckwwVTVVbXRVVW1WUWNHSkJXVTVGYjFwRFJVaElWVUZTTUhGUVlYSXdVamxHUkdkM1dHbElTemhwT1d4UWNrVnhNRkIzUFNJc0ltMWhZeUk2SW1RMk1qSXpNREZqT1RBelpESmtZak01T0RGbU0yRTNORGd6WkRSallqazROMkU0T1Rrd01HVTFOek00TkdJNFpHRTJPR1V5TW1OaVpUZGhNRGRoTVRNaWZRPT0=',1612972040),('yvpkuwdBOXeD9zGwxIDNzQeVqhksGhNT0vJEZnir',NULL,'34.66.172.110','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36','ZXlKcGRpSTZJbTluTXpCTlJDdDZOVUV6YjJwNFlta3hZMUo1VDNjOVBTSXNJblpoYkhWbElqb2liamhQWkdGSVJqa3hibVUyU2xZNVMyazBiRmN3UTFKbVpFazNXbVZLTjFJeFNteFJSWFpsVDJ0WE4zQjJMM2dyWkVwck5FWk5LM1F6U21sek1IWk9PR3hhUm1WRVdYcHZiemN4Tm1kVU15dHJNWGx0V0dGM1ZVTTFiMUZaYTFOblZ6aEZjVWRVVFUxRlZGcEVaV2MxZGs0d1FTOXNNVlZIU1RKdUsxVTRVeTkyZDNwa01XSm1OMGRRUldaNU1HTkNhbWRUVXpWQ09FTlRTakJNU2xCSFdEVXZaR2MwVTBoc1N6a3lkalpVWW1Wa01WWXlSRTEwUkVObWNreEdiMGxXUm5wNVNXMTVUMVpWWld4SFl5OW1lbVZIWkZCTlVIVk1PRXRFZUd0UFJrczVaRGRQTm5oMFdHc3ZXREpwYWt4VlpGQjFWeXRHZEhoSFJ6RnZjRWgyTWs5dmRHSndZMDFtUzBsVVFVeGpiRkpyVXpoM01UaFdZV3B1TW5sR1RUQkhUVlZ6TWxSV1UyUkpXWGhKYWpkRk9ERldheXRCWjJjemRWWXlUelUxVDFoS1VXRTFVbmROVkZwT1JIbzBTazV5UlhOemRYcGphMnA1T1ZKUGVGZDJaakF4WXpKTmRtTkNlRTkzUFNJc0ltMWhZeUk2SWpoak9HSTRZVGxrWW1ZMlpXSmlOelV5T1dWalpUSmhaVGxoTUdObFpUbGhNVGhtWmpJME4yUmtaVGN4TXpKbVlqQmpOakF6TlRsa05XUXdOalUwTUdVaWZRPT0=',1612975511);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'settings::app:name','Oreo Development'),(2,'settings::pterodactyl:auth:2fa_required','0'),(3,'settings::app:locale','en'),(4,'settings::app:analytics',''),(5,'settings::recaptcha:enabled','false'),(6,'settings::recaptcha:secret_key','6LcJcjwUAAAAALOcDJqAEYKTDhwELCkzUkNDQ0J5'),(7,'settings::recaptcha:website_key','6LcJcjwUAAAAAO_Xqjrtj9wWufUpYRnK6BW8lnfn'),(8,'settings::pterodactyl:guzzle:timeout','30'),(9,'settings::pterodactyl:guzzle:connect_timeout','10'),(10,'settings::pterodactyl:client_features:allocations:enabled','true'),(11,'settings::pterodactyl:client_features:allocations:range_start','2001'),(12,'settings::pterodactyl:client_features:allocations:range_end','2300');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdomain_manager_domains`
--

DROP TABLE IF EXISTS `subdomain_manager_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdomain_manager_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `egg_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol_types` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdomain_manager_domains`
--

LOCK TABLES `subdomain_manager_domains` WRITE;
/*!40000 ALTER TABLE `subdomain_manager_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `subdomain_manager_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdomain_manager_subdomains`
--

DROP TABLE IF EXISTS `subdomain_manager_subdomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdomain_manager_subdomains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `subdomain` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(11) NOT NULL,
  `record_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdomain_manager_subdomains`
--

LOCK TABLES `subdomain_manager_subdomains` WRITE;
/*!40000 ALTER TABLE `subdomain_manager_subdomains` DISABLE KEYS */;
/*!40000 ALTER TABLE `subdomain_manager_subdomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subusers`
--

DROP TABLE IF EXISTS `subusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subusers_user_id_foreign` (`user_id`),
  KEY `subusers_server_id_foreign` (`server_id`),
  CONSTRAINT `subusers_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subusers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subusers`
--

LOCK TABLES `subusers` WRITE;
/*!40000 ALTER TABLE `subusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` int(10) unsigned NOT NULL,
  `sequence_id` int(10) unsigned NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_offset` int(10) unsigned NOT NULL,
  `is_queued` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_schedule_id_sequence_id_index` (`schedule_id`,`sequence_id`),
  CONSTRAINT `tasks_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_log`
--

DROP TABLE IF EXISTS `tasks_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `run_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `run_status` int(10) unsigned NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_log`
--

LOCK TABLES `tasks_log` WRITE;
/*!40000 ALTER TABLE `tasks_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_first` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_last` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `root_admin` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `use_totp` tinyint(3) unsigned NOT NULL,
  `totp_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totp_authenticated_at` timestamp NULL DEFAULT NULL,
  `gravatar` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_uuid_unique` (`uuid`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_external_id_index` (`external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'0ebc62ae-4e86-4ede-9c4b-4f68496c1190','admin','admin@admin.com','admin','acct','$2y$10$ERm2Mxx.TwzUZlCBCiZbGejeJmCN1qg7yMQNw7fSN9jx//OgJrbfK','Mglp4Zv6zdRVzKovpm18y9fGqvqbUYTaHfTnrHxrVIznOAYfVBoTgAJqAtkl','en',1,0,NULL,NULL,1,'2021-02-08 17:55:52','2021-02-09 02:37:34'),(3,NULL,'a6096825-438d-48eb-b688-cf7b7beee748','oreo','Akwasia@icloud.com','oreo','oreo','$2y$10$QiynB86rtmtv.AhABaxrXeDw9CGbySz3A5eqfVuZo6sCarzLxoC7C','iCwKRD25UNh9CJWG5ob0fJvIAuHas6Eqt8XHypMY4cTQ4fuT7dntQLkdaABm','en',1,0,NULL,NULL,1,'2021-02-09 19:34:40','2021-02-09 19:34:40'),(4,NULL,'dea762dc-2cac-4c70-bfcb-ffa1436c89bc','zack','Zack@sryden.com','zack','zack','$2y$10$7taGHz5ywDm9JaPTXDmDL.c0U4DSn6w75D/JVF3TMW36/S0t3I30y','YdPve6w1h74zjcrnmolph2ht2N9JBJKQo2L29cXWaxKD6csjmA2WRfPNvoD6','en',1,0,NULL,NULL,1,'2021-02-09 20:01:48','2021-02-09 20:03:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_groups`
--

DROP TABLE IF EXISTS `version_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eggs` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `folder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_groups`
--

LOCK TABLES `version_groups` WRITE;
/*!40000 ALTER TABLE `version_groups` DISABLE KEYS */;
INSERT INTO `version_groups` VALUES (1,'JavaMC','a:7:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:2:\"15\";i:5;s:2:\"20\";i:6;s:2:\"21\";}',4,NULL,1),(2,'BedrockMC','a:5:{i:0;s:2:\"15\";i:1;s:2:\"22\";i:2;s:2:\"23\";i:3;s:2:\"24\";i:4;s:2:\"25\";}',4,NULL,2),(3,'Discord Bots','a:5:{i:0;s:2:\"15\";i:1;s:2:\"16\";i:2;s:2:\"17\";i:3;s:2:\"18\";i:4;s:2:\"19\";}',4,NULL,3);
/*!40000 ALTER TABLE `version_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-10 18:25:32
