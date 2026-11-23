-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bloowing_flower
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `bukets`
--

DROP TABLE IF EXISTS `bukets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bukets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bukets`
--

LOCK TABLES `bukets` WRITE;
/*!40000 ALTER TABLE `bukets` DISABLE KEYS */;
INSERT INTO `bukets` VALUES (1,'Buket Mawar',150000.00,'Buket bunga mawar dengan tampilan elegan dan cocok untuk berbagai momen.','Mawar',10,'buket-mawar.jpg','2026-09-25 02:33:09','2026-09-25 02:33:09'),(2,'Buket Sunflower',120000.00,'Buket bunga matahari yang cerah dan cocok untuk hadiah.','Sunflower',10,'buket-sunflower.jpg','2026-09-25 02:33:09','2026-09-25 02:33:09'),(3,'Buket Mix Flower',175000.00,'Buket kombinasi berbagai bunga dengan warna yang cantik.','Mix Flower',10,'buket-mix-flower.jpg','2026-09-25 02:33:09','2026-09-25 02:33:09'),(4,'Buket Baby Breath',100000.00,'Buket baby breath dengan tampilan lembut dan minimalis.','Baby Breath',10,'buket-baby-breath.jpg','2026-09-25 02:33:09','2026-09-25 02:33:09');
/*!40000 ALTER TABLE `bukets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_pesanans`
--

DROP TABLE IF EXISTS `detail_pesanans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_pesanans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pesanan_id` bigint(20) unsigned NOT NULL,
  `buket_id` bigint(20) unsigned NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_pesanans_pesanan_id_foreign` (`pesanan_id`),
  KEY `detail_pesanans_buket_id_foreign` (`buket_id`),
  CONSTRAINT `detail_pesanans_buket_id_foreign` FOREIGN KEY (`buket_id`) REFERENCES `bukets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detail_pesanans_pesanan_id_foreign` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_pesanans`
--

LOCK TABLES `detail_pesanans` WRITE;
/*!40000 ALTER TABLE `detail_pesanans` DISABLE KEYS */;
INSERT INTO `detail_pesanans` VALUES (1,4,3,1,175000.00,175000.00,'2026-09-28 10:53:27','2026-09-28 10:53:27'),(2,5,3,1,175000.00,175000.00,'2026-09-29 23:30:29','2026-09-29 23:30:29');
/*!40000 ALTER TABLE `detail_pesanans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_09_25_091032_create_bukets_table',2),(5,'2026_09_28_162554_create_pesanans_table',3),(6,'2026_09_28_163256_create_detail_pesanans_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanans`
--

DROP TABLE IF EXISTS `pesanans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_pesanan` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `no_whatsapp` varchar(255) NOT NULL,
  `catatan` text DEFAULT NULL,
  `total` decimal(12,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pesanans_kode_pesanan_unique` (`kode_pesanan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanans`
--

LOCK TABLES `pesanans` WRITE;
/*!40000 ALTER TABLE `pesanans` DISABLE KEYS */;
INSERT INTO `pesanans` VALUES (4,'BF001','nadiya','08596556856','warna bunga merah pink putih kuning',175000.00,'Diproses','2026-09-28 10:53:27','2026-09-28 10:59:03'),(5,'BF002','teli','05894366855',NULL,175000.00,'Menunggu','2026-09-29 23:30:29','2026-09-29 23:30:29');
/*!40000 ALTER TABLE `pesanans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('UhFXVMHWXSAUXsniMe4CboveeXNsXeGXhhmuEBGX',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOW5VajFrODA5S1VLMFFTb2ZDYVVxTFNrMk9Qc1czcDQyQXkxdkIwayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1795418847);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_access`
--

DROP TABLE IF EXISTS `ubwbh_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_authorization_role` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_profile`,`id_authorization_role`),
  KEY `IDX_564352A15FCA037F` (`id_profile`),
  KEY `IDX_564352A18C6DE0E5` (`id_authorization_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_access`
--

LOCK TABLES `ubwbh_access` WRITE;
/*!40000 ALTER TABLE `ubwbh_access` DISABLE KEYS */;
INSERT INTO `ubwbh_access` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,205),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(1,215),(1,216),(1,217),(1,218),(1,219),(1,220),(1,221),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,230),(1,231),(1,232),(1,233),(1,234),(1,235),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,242),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267),(1,268),(1,269),(1,270),(1,271),(1,272),(1,273),(1,274),(1,275),(1,276),(1,277),(1,278),(1,279),(1,280),(1,281),(1,282),(1,283),(1,284),(1,285),(1,286),(1,287),(1,288),(1,289),(1,290),(1,291),(1,292),(1,293),(1,294),(1,295),(1,296),(1,297),(1,298),(1,299),(1,300),(1,301),(1,302),(1,303),(1,304),(1,305),(1,306),(1,307),(1,308),(1,309),(1,310),(1,311),(1,312),(1,313),(1,314),(1,315),(1,316),(1,317),(1,318),(1,319),(1,320),(1,321),(1,322),(1,323),(1,324),(1,325),(1,326),(1,327),(1,328),(1,329),(1,330),(1,331),(1,332),(1,333),(1,334),(1,335),(1,336),(1,337),(1,338),(1,339),(1,340),(1,341),(1,342),(1,343),(1,344),(1,345),(1,346),(1,347),(1,348),(1,349),(1,350),(1,351),(1,352),(1,353),(1,354),(1,355),(1,356),(1,357),(1,358),(1,359),(1,360),(1,361),(1,362),(1,363),(1,364),(1,365),(1,366),(1,367),(1,368),(1,369),(1,370),(1,371),(1,372),(1,373),(1,374),(1,375),(1,376),(1,377),(1,378),(1,379),(1,380),(1,381),(1,382),(1,383),(1,384),(1,385),(1,386),(1,387),(1,388),(1,389),(1,390),(1,391),(1,392),(1,393),(1,394),(1,395),(1,396),(1,397),(1,398),(1,399),(1,400),(1,401),(1,402),(1,403),(1,404),(1,405),(1,406),(1,407),(1,408),(1,409),(1,410),(1,411),(1,412),(1,413),(1,414),(1,415),(1,416),(1,417),(1,418),(1,419),(1,420),(1,421),(1,422),(1,423),(1,424),(1,425),(1,426),(1,427),(1,428),(1,429),(1,430),(1,431),(1,432),(1,433),(1,434),(1,435),(1,436),(1,437),(1,438),(1,439),(1,440),(1,441),(1,442),(1,443),(1,444),(1,445),(1,446),(1,447),(1,448),(1,453),(1,454),(1,455),(1,456),(1,457),(1,458),(1,459),(1,460),(1,461),(1,462),(1,463),(1,464),(1,465),(1,466),(1,467),(1,468),(1,469),(1,470),(1,471),(1,472),(1,473),(1,474),(1,475),(1,476),(1,485),(1,486),(1,487),(1,488),(1,489),(1,490),(1,491),(1,492),(1,493),(1,494),(1,495),(1,496),(1,497),(1,498),(1,499),(1,500),(1,513),(1,514),(1,515),(1,516),(1,545),(1,546),(1,547),(1,548),(1,549),(1,550),(1,551),(1,552),(1,553),(1,554),(1,555),(1,556),(1,557),(1,558),(1,559),(1,560),(1,561),(1,562),(1,563),(1,564),(1,569),(1,570),(1,571),(1,572),(1,573),(1,574),(1,575),(1,576),(1,577),(1,578),(1,579),(1,580),(1,581),(1,582),(1,583),(1,584),(1,597),(1,598),(1,599),(1,600),(1,601),(1,602),(1,603),(1,604),(1,609),(1,610),(1,611),(1,612),(1,613),(1,614),(1,615),(1,616),(1,617),(1,618),(1,619),(1,620),(1,621),(1,622),(1,623),(1,624),(1,625),(1,626),(1,627),(1,628),(1,629),(1,630),(1,631),(1,632),(1,633),(1,634),(1,635),(1,636),(1,637),(1,638),(1,639),(1,640),(1,641),(1,642),(1,643),(1,644),(1,685),(1,686),(1,687),(1,688),(1,693),(1,694),(1,695),(1,696),(1,697),(1,698),(1,699),(1,700),(1,705),(1,706),(1,707),(1,708),(1,741),(1,742),(1,743),(1,744),(1,745),(1,746),(1,747),(1,748),(1,761),(1,762),(1,763),(1,764),(1,765),(1,766),(1,767),(1,768),(1,781),(1,782),(1,783),(1,784),(1,793),(1,794),(1,795),(1,796),(1,801),(1,802),(1,803),(1,804),(1,817),(1,818),(1,819),(1,820),(1,821),(1,822),(1,823),(1,824),(1,825),(1,826),(1,827),(1,828),(1,829),(1,830),(1,831),(1,832),(1,833),(1,834),(1,835),(1,836),(1,857),(1,858),(1,859),(1,860),(1,889),(1,890),(1,891),(1,892),(1,893),(1,894),(1,895),(1,896),(1,897),(1,898),(1,899),(1,900),(2,5),(2,6),(2,7),(2,8),(2,29),(2,30),(2,31),(2,32),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,81),(2,82),(2,83),(2,84),(2,129),(2,130),(2,131),(2,132),(2,189),(2,190),(2,191),(2,192),(2,221),(2,222),(2,223),(2,224),(2,229),(2,230),(2,231),(2,232),(2,241),(2,242),(2,243),(2,244),(2,254),(2,255),(2,261),(2,262),(2,263),(2,264),(2,281),(2,282),(2,283),(2,284),(2,317),(2,318),(2,319),(2,320),(2,333),(2,334),(2,335),(2,336),(2,345),(2,346),(2,347),(2,348),(2,357),(2,358),(2,359),(2,360),(2,385),(2,386),(2,387),(2,388),(2,405),(2,406),(2,407),(2,408),(2,429),(2,430),(2,431),(2,432),(2,433),(2,434),(2,435),(2,436),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,125),(3,126),(3,127),(3,128),(3,141),(3,142),(3,143),(3,144),(3,237),(3,238),(3,239),(3,240),(3,277),(3,278),(3,279),(3,280),(3,317),(3,318),(3,319),(3,320),(3,337),(3,338),(3,339),(3,340),(3,409),(3,410),(3,411),(3,412),(3,425),(3,426),(3,427),(3,428),(3,429),(3,430),(3,431),(3,432),(3,433),(3,434),(3,435),(3,436),(3,437),(3,438),(3,439),(3,440),(4,0),(4,5),(4,6),(4,7),(4,8),(4,13),(4,14),(4,15),(4,16),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,129),(4,130),(4,131),(4,132),(4,154),(4,181),(4,182),(4,183),(4,184),(4,189),(4,190),(4,191),(4,192),(4,221),(4,222),(4,223),(4,224),(4,229),(4,230),(4,231),(4,232),(4,241),(4,242),(4,243),(4,244),(4,254),(4,255),(4,261),(4,262),(4,263),(4,264),(4,278),(4,317),(4,318),(4,319),(4,320),(4,338),(4,357),(4,358),(4,359),(4,360),(4,413),(4,414),(4,415),(4,416),(4,425),(4,426),(4,427),(4,428),(4,433),(4,434),(4,435),(4,436),(4,437),(4,438),(4,439),(4,440);
/*!40000 ALTER TABLE `ubwbh_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_accessory`
--

DROP TABLE IF EXISTS `ubwbh_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_accessory` (
  `id_product_1` int(10) unsigned NOT NULL,
  `id_product_2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_1`,`id_product_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_accessory`
--

LOCK TABLES `ubwbh_accessory` WRITE;
/*!40000 ALTER TABLE `ubwbh_accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_accessory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_address`
--

DROP TABLE IF EXISTS `ubwbh_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_address` (
  `id_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL DEFAULT 0,
  `id_manufacturer` int(10) unsigned NOT NULL DEFAULT 0,
  `id_supplier` int(10) unsigned NOT NULL DEFAULT 0,
  `id_warehouse` int(10) unsigned NOT NULL DEFAULT 0,
  `alias` varchar(32) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `other` mediumtext DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `phone_mobile` varchar(32) DEFAULT NULL,
  `vat_number` varchar(32) DEFAULT NULL,
  `dni` varchar(16) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_address`),
  KEY `address_customer` (`id_customer`),
  KEY `id_country` (`id_country`),
  KEY `id_state` (`id_state`),
  KEY `id_manufacturer` (`id_manufacturer`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_warehouse` (`id_warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_address`
--

LOCK TABLES `ubwbh_address` WRITE;
/*!40000 ALTER TABLE `ubwbh_address` DISABLE KEYS */;
INSERT INTO `ubwbh_address` VALUES (1,110,0,1,0,0,0,'Anonymous','Anonymous','Anonymous','Anonymous','Anonymous','','00000','Anonymous','','0000000000','0000000000','0000','0000','2026-11-23 15:01:45','2026-11-23 15:01:45',1,0),(2,8,0,2,0,0,0,'Mon adresse','My Company','DOE','John','16, Main street','2nd floor','75002','Paris','','0102030405','','','','2026-11-23 15:08:46','2026-11-23 15:08:46',1,0),(3,21,35,0,0,1,0,'supplier','Fashion','supplier','supplier','767 Fifth Ave.','','10153','New York','','(212) 336-1440','','','','2026-11-23 15:08:46','2026-11-23 15:08:46',1,0),(4,21,35,0,1,0,0,'manufacturer','Fashion','manufacturer','manufacturer','767 Fifth Ave.','','10154','New York','','(212) 336-1666','','','','2026-11-23 15:08:46','2026-11-23 15:08:46',1,0),(5,21,12,2,0,0,0,'My address','My Company','DOE','John','16, Main street','2nd floor','33133','Miami','','0102030405','','','','2026-11-23 15:08:46','2026-11-23 15:08:46',1,0),(6,8,0,0,0,2,0,'accessories_supplier','Accessories and Co','accessories','accessories','42 Avenue Maréchal Soult','','64990','Bayonne','','0102030405','','','','2026-11-23 15:08:46','2026-11-23 15:08:46',1,0);
/*!40000 ALTER TABLE `ubwbh_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_address_format`
--

DROP TABLE IF EXISTS `ubwbh_address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_address_format` (
  `id_country` int(10) unsigned NOT NULL,
  `format` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_address_format`
--

LOCK TABLES `ubwbh_address_format` WRITE;
/*!40000 ALTER TABLE `ubwbh_address_format` DISABLE KEYS */;
INSERT INTO `ubwbh_address_format` VALUES (1,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(2,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(3,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(4,'firstname lastname\ncompany\naddress1\naddress2\ncity State:name postcode\nCountry:name\nphone'),(5,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(6,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(7,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(8,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(9,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(10,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(11,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(12,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(13,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(14,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(15,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(16,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(17,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\ncity\npostcode\nCountry:name\nphone'),(18,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(19,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(20,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(21,'firstname lastname\ncompany\naddress1 address2\ncity, State:name postcode\nCountry:name\nphone'),(22,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(23,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(24,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\ncity State:iso_code postcode\nCountry:name\nphone'),(25,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(26,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(27,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(28,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(29,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(30,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(31,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(32,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(33,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(34,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(35,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(36,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(37,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(38,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(39,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(40,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(41,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(42,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(43,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(44,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(45,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(46,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(47,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(48,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(49,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(50,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(51,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(52,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(53,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(54,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(55,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(56,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(57,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(58,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(59,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(60,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(61,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(62,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(63,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(64,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(65,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(66,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(67,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(68,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(69,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(70,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(71,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(72,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(73,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(74,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(75,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(76,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(77,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(78,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(79,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(80,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(81,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(82,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(83,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(84,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(85,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(86,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(87,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(88,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(89,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(90,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(91,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(92,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(93,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(94,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(95,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(96,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(97,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(98,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(99,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(100,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(101,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(102,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(103,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(104,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(105,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(106,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(107,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(108,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(109,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\ncity\npostcode\nState:name\nCountry:name\nphone'),(110,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(111,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(112,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(113,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(114,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(115,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(116,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(117,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(118,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(119,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(120,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(121,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(122,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(123,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(124,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(125,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(126,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(127,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(128,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(129,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(130,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(131,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(132,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(133,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(134,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(135,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(136,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(137,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(138,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(139,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(140,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(141,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(142,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(143,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(144,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(145,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(146,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(147,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(148,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(149,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(150,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(151,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(152,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(153,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(154,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(155,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(156,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(157,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(158,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(159,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(160,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(161,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(162,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(163,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(164,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(165,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(166,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(167,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(168,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(169,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(170,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(171,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(172,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(173,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(174,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(175,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(176,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(177,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(178,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(179,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(180,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(181,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(182,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(183,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(184,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(185,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(186,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(187,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(188,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(189,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(190,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(191,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(192,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(193,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(194,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(195,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(196,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(197,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(198,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(199,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(200,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(201,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(202,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(203,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(204,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(205,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(206,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(207,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(208,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(209,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(210,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(211,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(212,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(213,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(214,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(215,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(216,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(217,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(218,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(219,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(220,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(221,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(222,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(223,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(224,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(225,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(226,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(227,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(228,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(229,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(230,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(231,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(232,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(233,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(234,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(235,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(236,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(237,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(238,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(239,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(240,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(241,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone');
/*!40000 ALTER TABLE `ubwbh_address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_admin_filter`
--

DROP TABLE IF EXISTS `ubwbh_admin_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_admin_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee` int(11) NOT NULL,
  `shop` int(11) NOT NULL,
  `controller` varchar(60) NOT NULL,
  `action` varchar(100) NOT NULL,
  `filter` longtext NOT NULL,
  `filter_id` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_filter_search_id_idx` (`employee`,`shop`,`controller`,`action`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_admin_filter`
--

LOCK TABLES `ubwbh_admin_filter` WRITE;
/*!40000 ALTER TABLE `ubwbh_admin_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_admin_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_alias`
--

DROP TABLE IF EXISTS `ubwbh_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_alias` (
  `id_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(191) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_alias`
--

LOCK TABLES `ubwbh_alias` WRITE;
/*!40000 ALTER TABLE `ubwbh_alias` DISABLE KEYS */;
INSERT INTO `ubwbh_alias` VALUES (1,'bloose','blouse',1),(2,'blues','blouse',1);
/*!40000 ALTER TABLE `ubwbh_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_api_client`
--

DROP TABLE IF EXISTS `ubwbh_api_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_api_client` (
  `id_api_client` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `scopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`scopes`)),
  `description` varchar(255) NOT NULL DEFAULT '',
  `external_issuer` varchar(255) DEFAULT NULL,
  `lifetime` int(11) NOT NULL DEFAULT 3600,
  PRIMARY KEY (`id_api_client`),
  UNIQUE KEY `api_client_client_id_idx` (`client_id`,`external_issuer`),
  UNIQUE KEY `api_client_client_name_idx` (`client_name`,`external_issuer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_api_client`
--

LOCK TABLES `ubwbh_api_client` WRITE;
/*!40000 ALTER TABLE `ubwbh_api_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_api_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_attachment`
--

DROP TABLE IF EXISTS `ubwbh_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_attachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(40) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` bigint(10) unsigned NOT NULL DEFAULT 0,
  `mime` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_attachment`
--

LOCK TABLES `ubwbh_attachment` WRITE;
/*!40000 ALTER TABLE `ubwbh_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_attachment_lang`
--

DROP TABLE IF EXISTS `ubwbh_attachment_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_attachment_lang` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id_attachment`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_attachment_lang`
--

LOCK TABLES `ubwbh_attachment_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_attachment_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_attachment_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_attribute`
--

DROP TABLE IF EXISTS `ubwbh_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_attribute` (
  `id_attribute` int(11) NOT NULL AUTO_INCREMENT,
  `id_attribute_group` int(11) NOT NULL,
  `color` varchar(32) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id_attribute`),
  KEY `attribute_group` (`id_attribute_group`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_attribute`
--

LOCK TABLES `ubwbh_attribute` WRITE;
/*!40000 ALTER TABLE `ubwbh_attribute` DISABLE KEYS */;
INSERT INTO `ubwbh_attribute` VALUES (1,1,'',0),(2,1,'',1),(3,1,'',2),(4,1,'',3),(5,2,'#AAB2BD',0),(6,2,'#CFC4A6',1),(7,2,'#f5f5dc',2),(8,2,'#ffffff',3),(9,2,'#faebd7',4),(10,2,'#E84C3D',5),(11,2,'#434A54',6),(12,2,'#C19A6B',7),(13,2,'#F39C11',8),(14,2,'#5D9CEC',9),(15,2,'#A0D468',10),(16,2,'#F1C40F',11),(17,2,'#964B00',12),(18,2,'#FCCACD',13),(19,3,'',0),(20,3,'',1),(21,3,'',2),(22,4,'',0),(23,4,'',1),(24,4,'',2),(25,4,'',3);
/*!40000 ALTER TABLE `ubwbh_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_attribute_group`
--

DROP TABLE IF EXISTS `ubwbh_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_attribute_group` (
  `id_attribute_group` int(11) NOT NULL AUTO_INCREMENT,
  `is_color_group` tinyint(1) NOT NULL,
  `group_type` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_attribute_group`
--

LOCK TABLES `ubwbh_attribute_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_attribute_group` DISABLE KEYS */;
INSERT INTO `ubwbh_attribute_group` VALUES (1,0,'select',0),(2,1,'color',1),(3,0,'select',2),(4,0,'select',3);
/*!40000 ALTER TABLE `ubwbh_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_attribute_group_lang`
--

DROP TABLE IF EXISTS `ubwbh_attribute_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_attribute_group_lang` (
  `id_attribute_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `public_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`),
  KEY `IDX_4653726C67A664FB` (`id_attribute_group`),
  KEY `IDX_4653726CBA299860` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_attribute_group_lang`
--

LOCK TABLES `ubwbh_attribute_group_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_attribute_group_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_attribute_group_lang` VALUES (1,1,'Size','Size'),(1,2,'Ukuran','Ukuran'),(2,1,'Color','Color'),(2,2,'Warna','Warna'),(3,1,'Dimension','Dimension'),(3,2,'Dimension','Dimension'),(4,1,'Paper Type','Paper Type'),(4,2,'Paper Type','Paper Type');
/*!40000 ALTER TABLE `ubwbh_attribute_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_attribute_group_shop`
--

DROP TABLE IF EXISTS `ubwbh_attribute_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_attribute_group_shop` (
  `id_attribute_group` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_shop`),
  KEY `IDX_DB30BAAC67A664FB` (`id_attribute_group`),
  KEY `IDX_DB30BAAC274A50A0` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_attribute_group_shop`
--

LOCK TABLES `ubwbh_attribute_group_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_attribute_group_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_attribute_group_shop` VALUES (1,1),(2,1),(3,1),(4,1);
/*!40000 ALTER TABLE `ubwbh_attribute_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_attribute_lang`
--

DROP TABLE IF EXISTS `ubwbh_attribute_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_attribute_lang` (
  `id_attribute` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`),
  KEY `IDX_3ABE46A77A4F53DC` (`id_attribute`),
  KEY `IDX_3ABE46A7BA299860` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_attribute_lang`
--

LOCK TABLES `ubwbh_attribute_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_attribute_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_attribute_lang` VALUES (1,1,'S'),(1,2,'S'),(2,1,'M'),(2,2,'M'),(3,1,'L'),(3,2,'L'),(4,1,'XL'),(4,2,'XL'),(5,1,'Gray'),(5,2,'Abu-Abu'),(6,1,'Taupe'),(6,2,'Taupe'),(7,1,'Beige'),(7,2,'Beige'),(8,1,'White'),(8,2,'Putih'),(9,1,'Off White'),(9,2,'Putih Pucat'),(10,1,'Red'),(10,2,'Merah'),(11,1,'Black'),(11,2,'Hitam'),(12,1,'Camel'),(12,2,'Cokelat Unta'),(13,1,'Orange'),(13,2,'Oranye'),(14,1,'Blue'),(14,2,'Biru'),(15,1,'Green'),(15,2,'Hijau'),(16,1,'Yellow'),(16,2,'Kuning'),(17,1,'Brown'),(17,2,'Cokelat'),(18,1,'Pink'),(18,2,'Merah Muda'),(19,1,'40x60cm'),(19,2,'40x60cm'),(20,1,'60x90cm'),(20,2,'60x90cm'),(21,1,'80x120cm'),(21,2,'80x120cm'),(22,1,'Ruled'),(22,2,'Ruled'),(23,1,'Plain'),(23,2,'Plain'),(24,1,'Squared'),(24,2,'Squared'),(25,1,'Doted'),(25,2,'Doted');
/*!40000 ALTER TABLE `ubwbh_attribute_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_attribute_shop`
--

DROP TABLE IF EXISTS `ubwbh_attribute_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_attribute_shop` (
  `id_attribute` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_shop`),
  KEY `IDX_A7DD8E677A4F53DC` (`id_attribute`),
  KEY `IDX_A7DD8E67274A50A0` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_attribute_shop`
--

LOCK TABLES `ubwbh_attribute_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_attribute_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_attribute_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1);
/*!40000 ALTER TABLE `ubwbh_attribute_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_authorization_role`
--

DROP TABLE IF EXISTS `ubwbh_authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_authorization_role` (
  `id_authorization_role` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  PRIMARY KEY (`id_authorization_role`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_authorization_role`
--

LOCK TABLES `ubwbh_authorization_role` WRITE;
/*!40000 ALTER TABLE `ubwbh_authorization_role` DISABLE KEYS */;
INSERT INTO `ubwbh_authorization_role` VALUES (481,'ROLE_MOD_MODULE_BLOCKREASSURANCE_CREATE'),(484,'ROLE_MOD_MODULE_BLOCKREASSURANCE_DELETE'),(482,'ROLE_MOD_MODULE_BLOCKREASSURANCE_READ'),(483,'ROLE_MOD_MODULE_BLOCKREASSURANCE_UPDATE'),(501,'ROLE_MOD_MODULE_BLOCKWISHLIST_CREATE'),(504,'ROLE_MOD_MODULE_BLOCKWISHLIST_DELETE'),(502,'ROLE_MOD_MODULE_BLOCKWISHLIST_READ'),(503,'ROLE_MOD_MODULE_BLOCKWISHLIST_UPDATE'),(505,'ROLE_MOD_MODULE_CONTACTFORM_CREATE'),(508,'ROLE_MOD_MODULE_CONTACTFORM_DELETE'),(506,'ROLE_MOD_MODULE_CONTACTFORM_READ'),(507,'ROLE_MOD_MODULE_CONTACTFORM_UPDATE'),(509,'ROLE_MOD_MODULE_DASHACTIVITY_CREATE'),(512,'ROLE_MOD_MODULE_DASHACTIVITY_DELETE'),(510,'ROLE_MOD_MODULE_DASHACTIVITY_READ'),(511,'ROLE_MOD_MODULE_DASHACTIVITY_UPDATE'),(517,'ROLE_MOD_MODULE_DASHGOALS_CREATE'),(520,'ROLE_MOD_MODULE_DASHGOALS_DELETE'),(518,'ROLE_MOD_MODULE_DASHGOALS_READ'),(519,'ROLE_MOD_MODULE_DASHGOALS_UPDATE'),(521,'ROLE_MOD_MODULE_DASHPRODUCTS_CREATE'),(524,'ROLE_MOD_MODULE_DASHPRODUCTS_DELETE'),(522,'ROLE_MOD_MODULE_DASHPRODUCTS_READ'),(523,'ROLE_MOD_MODULE_DASHPRODUCTS_UPDATE'),(525,'ROLE_MOD_MODULE_DASHTRENDS_CREATE'),(528,'ROLE_MOD_MODULE_DASHTRENDS_DELETE'),(526,'ROLE_MOD_MODULE_DASHTRENDS_READ'),(527,'ROLE_MOD_MODULE_DASHTRENDS_UPDATE'),(529,'ROLE_MOD_MODULE_GRAPHNVD3_CREATE'),(532,'ROLE_MOD_MODULE_GRAPHNVD3_DELETE'),(530,'ROLE_MOD_MODULE_GRAPHNVD3_READ'),(531,'ROLE_MOD_MODULE_GRAPHNVD3_UPDATE'),(533,'ROLE_MOD_MODULE_GRIDHTML_CREATE'),(536,'ROLE_MOD_MODULE_GRIDHTML_DELETE'),(534,'ROLE_MOD_MODULE_GRIDHTML_READ'),(535,'ROLE_MOD_MODULE_GRIDHTML_UPDATE'),(537,'ROLE_MOD_MODULE_GSITEMAP_CREATE'),(540,'ROLE_MOD_MODULE_GSITEMAP_DELETE'),(538,'ROLE_MOD_MODULE_GSITEMAP_READ'),(539,'ROLE_MOD_MODULE_GSITEMAP_UPDATE'),(541,'ROLE_MOD_MODULE_KLAVIYOPSAUTOMATION_CREATE'),(544,'ROLE_MOD_MODULE_KLAVIYOPSAUTOMATION_DELETE'),(542,'ROLE_MOD_MODULE_KLAVIYOPSAUTOMATION_READ'),(543,'ROLE_MOD_MODULE_KLAVIYOPSAUTOMATION_UPDATE'),(585,'ROLE_MOD_MODULE_PAGESNOTFOUND_CREATE'),(588,'ROLE_MOD_MODULE_PAGESNOTFOUND_DELETE'),(586,'ROLE_MOD_MODULE_PAGESNOTFOUND_READ'),(587,'ROLE_MOD_MODULE_PAGESNOTFOUND_UPDATE'),(589,'ROLE_MOD_MODULE_PRODUCTCOMMENTS_CREATE'),(592,'ROLE_MOD_MODULE_PRODUCTCOMMENTS_DELETE'),(590,'ROLE_MOD_MODULE_PRODUCTCOMMENTS_READ'),(591,'ROLE_MOD_MODULE_PRODUCTCOMMENTS_UPDATE'),(593,'ROLE_MOD_MODULE_PSGDPR_CREATE'),(596,'ROLE_MOD_MODULE_PSGDPR_DELETE'),(594,'ROLE_MOD_MODULE_PSGDPR_READ'),(595,'ROLE_MOD_MODULE_PSGDPR_UPDATE'),(605,'ROLE_MOD_MODULE_PSSHIPPING_CREATE'),(608,'ROLE_MOD_MODULE_PSSHIPPING_DELETE'),(606,'ROLE_MOD_MODULE_PSSHIPPING_READ'),(607,'ROLE_MOD_MODULE_PSSHIPPING_UPDATE'),(645,'ROLE_MOD_MODULE_PSXMARKETINGWITHGOOGLE_CREATE'),(648,'ROLE_MOD_MODULE_PSXMARKETINGWITHGOOGLE_DELETE'),(646,'ROLE_MOD_MODULE_PSXMARKETINGWITHGOOGLE_READ'),(647,'ROLE_MOD_MODULE_PSXMARKETINGWITHGOOGLE_UPDATE'),(565,'ROLE_MOD_MODULE_PS_ACCOUNTS_CREATE'),(568,'ROLE_MOD_MODULE_PS_ACCOUNTS_DELETE'),(566,'ROLE_MOD_MODULE_PS_ACCOUNTS_READ'),(567,'ROLE_MOD_MODULE_PS_ACCOUNTS_UPDATE'),(649,'ROLE_MOD_MODULE_PS_APIRESOURCES_CREATE'),(652,'ROLE_MOD_MODULE_PS_APIRESOURCES_DELETE'),(650,'ROLE_MOD_MODULE_PS_APIRESOURCES_READ'),(651,'ROLE_MOD_MODULE_PS_APIRESOURCES_UPDATE'),(653,'ROLE_MOD_MODULE_PS_ASK_AI_CREATE'),(656,'ROLE_MOD_MODULE_PS_ASK_AI_DELETE'),(654,'ROLE_MOD_MODULE_PS_ASK_AI_READ'),(655,'ROLE_MOD_MODULE_PS_ASK_AI_UPDATE'),(657,'ROLE_MOD_MODULE_PS_BANNER_CREATE'),(660,'ROLE_MOD_MODULE_PS_BANNER_DELETE'),(658,'ROLE_MOD_MODULE_PS_BANNER_READ'),(659,'ROLE_MOD_MODULE_PS_BANNER_UPDATE'),(661,'ROLE_MOD_MODULE_PS_BESTSELLERS_CREATE'),(664,'ROLE_MOD_MODULE_PS_BESTSELLERS_DELETE'),(662,'ROLE_MOD_MODULE_PS_BESTSELLERS_READ'),(663,'ROLE_MOD_MODULE_PS_BESTSELLERS_UPDATE'),(665,'ROLE_MOD_MODULE_PS_BRANDLIST_CREATE'),(668,'ROLE_MOD_MODULE_PS_BRANDLIST_DELETE'),(666,'ROLE_MOD_MODULE_PS_BRANDLIST_READ'),(667,'ROLE_MOD_MODULE_PS_BRANDLIST_UPDATE'),(669,'ROLE_MOD_MODULE_PS_CASHONDELIVERY_CREATE'),(672,'ROLE_MOD_MODULE_PS_CASHONDELIVERY_DELETE'),(670,'ROLE_MOD_MODULE_PS_CASHONDELIVERY_READ'),(671,'ROLE_MOD_MODULE_PS_CASHONDELIVERY_UPDATE'),(673,'ROLE_MOD_MODULE_PS_CATEGORYPRODUCTS_CREATE'),(676,'ROLE_MOD_MODULE_PS_CATEGORYPRODUCTS_DELETE'),(674,'ROLE_MOD_MODULE_PS_CATEGORYPRODUCTS_READ'),(675,'ROLE_MOD_MODULE_PS_CATEGORYPRODUCTS_UPDATE'),(677,'ROLE_MOD_MODULE_PS_CATEGORYTREE_CREATE'),(680,'ROLE_MOD_MODULE_PS_CATEGORYTREE_DELETE'),(678,'ROLE_MOD_MODULE_PS_CATEGORYTREE_READ'),(679,'ROLE_MOD_MODULE_PS_CATEGORYTREE_UPDATE'),(681,'ROLE_MOD_MODULE_PS_CHECKOUT_CREATE'),(684,'ROLE_MOD_MODULE_PS_CHECKOUT_DELETE'),(682,'ROLE_MOD_MODULE_PS_CHECKOUT_READ'),(683,'ROLE_MOD_MODULE_PS_CHECKOUT_UPDATE'),(689,'ROLE_MOD_MODULE_PS_CHECKPAYMENT_CREATE'),(692,'ROLE_MOD_MODULE_PS_CHECKPAYMENT_DELETE'),(690,'ROLE_MOD_MODULE_PS_CHECKPAYMENT_READ'),(691,'ROLE_MOD_MODULE_PS_CHECKPAYMENT_UPDATE'),(701,'ROLE_MOD_MODULE_PS_CLASSIC_EDITION_CREATE'),(704,'ROLE_MOD_MODULE_PS_CLASSIC_EDITION_DELETE'),(702,'ROLE_MOD_MODULE_PS_CLASSIC_EDITION_READ'),(703,'ROLE_MOD_MODULE_PS_CLASSIC_EDITION_UPDATE'),(709,'ROLE_MOD_MODULE_PS_CONTACTINFO_CREATE'),(712,'ROLE_MOD_MODULE_PS_CONTACTINFO_DELETE'),(710,'ROLE_MOD_MODULE_PS_CONTACTINFO_READ'),(711,'ROLE_MOD_MODULE_PS_CONTACTINFO_UPDATE'),(713,'ROLE_MOD_MODULE_PS_CROSSSELLING_CREATE'),(716,'ROLE_MOD_MODULE_PS_CROSSSELLING_DELETE'),(714,'ROLE_MOD_MODULE_PS_CROSSSELLING_READ'),(715,'ROLE_MOD_MODULE_PS_CROSSSELLING_UPDATE'),(717,'ROLE_MOD_MODULE_PS_CURRENCYSELECTOR_CREATE'),(720,'ROLE_MOD_MODULE_PS_CURRENCYSELECTOR_DELETE'),(718,'ROLE_MOD_MODULE_PS_CURRENCYSELECTOR_READ'),(719,'ROLE_MOD_MODULE_PS_CURRENCYSELECTOR_UPDATE'),(721,'ROLE_MOD_MODULE_PS_CUSTOMERACCOUNTLINKS_CREATE'),(724,'ROLE_MOD_MODULE_PS_CUSTOMERACCOUNTLINKS_DELETE'),(722,'ROLE_MOD_MODULE_PS_CUSTOMERACCOUNTLINKS_READ'),(723,'ROLE_MOD_MODULE_PS_CUSTOMERACCOUNTLINKS_UPDATE'),(725,'ROLE_MOD_MODULE_PS_CUSTOMERSIGNIN_CREATE'),(728,'ROLE_MOD_MODULE_PS_CUSTOMERSIGNIN_DELETE'),(726,'ROLE_MOD_MODULE_PS_CUSTOMERSIGNIN_READ'),(727,'ROLE_MOD_MODULE_PS_CUSTOMERSIGNIN_UPDATE'),(729,'ROLE_MOD_MODULE_PS_CUSTOMTEXT_CREATE'),(732,'ROLE_MOD_MODULE_PS_CUSTOMTEXT_DELETE'),(730,'ROLE_MOD_MODULE_PS_CUSTOMTEXT_READ'),(731,'ROLE_MOD_MODULE_PS_CUSTOMTEXT_UPDATE'),(733,'ROLE_MOD_MODULE_PS_DATAPRIVACY_CREATE'),(736,'ROLE_MOD_MODULE_PS_DATAPRIVACY_DELETE'),(734,'ROLE_MOD_MODULE_PS_DATAPRIVACY_READ'),(735,'ROLE_MOD_MODULE_PS_DATAPRIVACY_UPDATE'),(737,'ROLE_MOD_MODULE_PS_DISTRIBUTIONAPICLIENT_CREATE'),(740,'ROLE_MOD_MODULE_PS_DISTRIBUTIONAPICLIENT_DELETE'),(738,'ROLE_MOD_MODULE_PS_DISTRIBUTIONAPICLIENT_READ'),(739,'ROLE_MOD_MODULE_PS_DISTRIBUTIONAPICLIENT_UPDATE'),(749,'ROLE_MOD_MODULE_PS_EMAILALERTS_CREATE'),(752,'ROLE_MOD_MODULE_PS_EMAILALERTS_DELETE'),(750,'ROLE_MOD_MODULE_PS_EMAILALERTS_READ'),(751,'ROLE_MOD_MODULE_PS_EMAILALERTS_UPDATE'),(753,'ROLE_MOD_MODULE_PS_EMAILSUBSCRIPTION_CREATE'),(756,'ROLE_MOD_MODULE_PS_EMAILSUBSCRIPTION_DELETE'),(754,'ROLE_MOD_MODULE_PS_EMAILSUBSCRIPTION_READ'),(755,'ROLE_MOD_MODULE_PS_EMAILSUBSCRIPTION_UPDATE'),(757,'ROLE_MOD_MODULE_PS_EVENTBUS_CREATE'),(760,'ROLE_MOD_MODULE_PS_EVENTBUS_DELETE'),(758,'ROLE_MOD_MODULE_PS_EVENTBUS_READ'),(759,'ROLE_MOD_MODULE_PS_EVENTBUS_UPDATE'),(769,'ROLE_MOD_MODULE_PS_FACEBOOK_CREATE'),(772,'ROLE_MOD_MODULE_PS_FACEBOOK_DELETE'),(770,'ROLE_MOD_MODULE_PS_FACEBOOK_READ'),(771,'ROLE_MOD_MODULE_PS_FACEBOOK_UPDATE'),(981,'ROLE_MOD_MODULE_PS_FACETEDSEARCH_CREATE'),(984,'ROLE_MOD_MODULE_PS_FACETEDSEARCH_DELETE'),(982,'ROLE_MOD_MODULE_PS_FACETEDSEARCH_READ'),(983,'ROLE_MOD_MODULE_PS_FACETEDSEARCH_UPDATE'),(777,'ROLE_MOD_MODULE_PS_FAVICONNOTIFICATIONBO_CREATE'),(780,'ROLE_MOD_MODULE_PS_FAVICONNOTIFICATIONBO_DELETE'),(778,'ROLE_MOD_MODULE_PS_FAVICONNOTIFICATIONBO_READ'),(779,'ROLE_MOD_MODULE_PS_FAVICONNOTIFICATIONBO_UPDATE'),(785,'ROLE_MOD_MODULE_PS_FEATUREDPRODUCTS_CREATE'),(788,'ROLE_MOD_MODULE_PS_FEATUREDPRODUCTS_DELETE'),(786,'ROLE_MOD_MODULE_PS_FEATUREDPRODUCTS_READ'),(787,'ROLE_MOD_MODULE_PS_FEATUREDPRODUCTS_UPDATE'),(789,'ROLE_MOD_MODULE_PS_GOOGLEANALYTICS_CREATE'),(792,'ROLE_MOD_MODULE_PS_GOOGLEANALYTICS_DELETE'),(790,'ROLE_MOD_MODULE_PS_GOOGLEANALYTICS_READ'),(791,'ROLE_MOD_MODULE_PS_GOOGLEANALYTICS_UPDATE'),(797,'ROLE_MOD_MODULE_PS_IMAGESLIDER_CREATE'),(800,'ROLE_MOD_MODULE_PS_IMAGESLIDER_DELETE'),(798,'ROLE_MOD_MODULE_PS_IMAGESLIDER_READ'),(799,'ROLE_MOD_MODULE_PS_IMAGESLIDER_UPDATE'),(805,'ROLE_MOD_MODULE_PS_LANGUAGESELECTOR_CREATE'),(808,'ROLE_MOD_MODULE_PS_LANGUAGESELECTOR_DELETE'),(806,'ROLE_MOD_MODULE_PS_LANGUAGESELECTOR_READ'),(807,'ROLE_MOD_MODULE_PS_LANGUAGESELECTOR_UPDATE'),(809,'ROLE_MOD_MODULE_PS_LINKLIST_CREATE'),(812,'ROLE_MOD_MODULE_PS_LINKLIST_DELETE'),(810,'ROLE_MOD_MODULE_PS_LINKLIST_READ'),(811,'ROLE_MOD_MODULE_PS_LINKLIST_UPDATE'),(813,'ROLE_MOD_MODULE_PS_MAINMENU_CREATE'),(816,'ROLE_MOD_MODULE_PS_MAINMENU_DELETE'),(814,'ROLE_MOD_MODULE_PS_MAINMENU_READ'),(815,'ROLE_MOD_MODULE_PS_MAINMENU_UPDATE'),(837,'ROLE_MOD_MODULE_PS_MBO_CREATE'),(840,'ROLE_MOD_MODULE_PS_MBO_DELETE'),(838,'ROLE_MOD_MODULE_PS_MBO_READ'),(839,'ROLE_MOD_MODULE_PS_MBO_UPDATE'),(841,'ROLE_MOD_MODULE_PS_MCP_SERVER_CREATE'),(844,'ROLE_MOD_MODULE_PS_MCP_SERVER_DELETE'),(842,'ROLE_MOD_MODULE_PS_MCP_SERVER_READ'),(843,'ROLE_MOD_MODULE_PS_MCP_SERVER_UPDATE'),(845,'ROLE_MOD_MODULE_PS_MCP_TOOLS_CREATE'),(848,'ROLE_MOD_MODULE_PS_MCP_TOOLS_DELETE'),(846,'ROLE_MOD_MODULE_PS_MCP_TOOLS_READ'),(847,'ROLE_MOD_MODULE_PS_MCP_TOOLS_UPDATE'),(849,'ROLE_MOD_MODULE_PS_NEWPRODUCTS_CREATE'),(852,'ROLE_MOD_MODULE_PS_NEWPRODUCTS_DELETE'),(850,'ROLE_MOD_MODULE_PS_NEWPRODUCTS_READ'),(851,'ROLE_MOD_MODULE_PS_NEWPRODUCTS_UPDATE'),(853,'ROLE_MOD_MODULE_PS_ONEPAGECHECKOUT_CREATE'),(856,'ROLE_MOD_MODULE_PS_ONEPAGECHECKOUT_DELETE'),(854,'ROLE_MOD_MODULE_PS_ONEPAGECHECKOUT_READ'),(855,'ROLE_MOD_MODULE_PS_ONEPAGECHECKOUT_UPDATE'),(861,'ROLE_MOD_MODULE_PS_SEARCHBAR_CREATE'),(864,'ROLE_MOD_MODULE_PS_SEARCHBAR_DELETE'),(862,'ROLE_MOD_MODULE_PS_SEARCHBAR_READ'),(863,'ROLE_MOD_MODULE_PS_SEARCHBAR_UPDATE'),(865,'ROLE_MOD_MODULE_PS_SHAREBUTTONS_CREATE'),(868,'ROLE_MOD_MODULE_PS_SHAREBUTTONS_DELETE'),(866,'ROLE_MOD_MODULE_PS_SHAREBUTTONS_READ'),(867,'ROLE_MOD_MODULE_PS_SHAREBUTTONS_UPDATE'),(869,'ROLE_MOD_MODULE_PS_SHOPPINGCART_CREATE'),(872,'ROLE_MOD_MODULE_PS_SHOPPINGCART_DELETE'),(870,'ROLE_MOD_MODULE_PS_SHOPPINGCART_READ'),(871,'ROLE_MOD_MODULE_PS_SHOPPINGCART_UPDATE'),(873,'ROLE_MOD_MODULE_PS_SOCIALFOLLOW_CREATE'),(876,'ROLE_MOD_MODULE_PS_SOCIALFOLLOW_DELETE'),(874,'ROLE_MOD_MODULE_PS_SOCIALFOLLOW_READ'),(875,'ROLE_MOD_MODULE_PS_SOCIALFOLLOW_UPDATE'),(877,'ROLE_MOD_MODULE_PS_SPECIALS_CREATE'),(880,'ROLE_MOD_MODULE_PS_SPECIALS_DELETE'),(878,'ROLE_MOD_MODULE_PS_SPECIALS_READ'),(879,'ROLE_MOD_MODULE_PS_SPECIALS_UPDATE'),(881,'ROLE_MOD_MODULE_PS_SUPPLIERLIST_CREATE'),(884,'ROLE_MOD_MODULE_PS_SUPPLIERLIST_DELETE'),(882,'ROLE_MOD_MODULE_PS_SUPPLIERLIST_READ'),(883,'ROLE_MOD_MODULE_PS_SUPPLIERLIST_UPDATE'),(885,'ROLE_MOD_MODULE_PS_THEMECUSTO_CREATE'),(888,'ROLE_MOD_MODULE_PS_THEMECUSTO_DELETE'),(886,'ROLE_MOD_MODULE_PS_THEMECUSTO_READ'),(887,'ROLE_MOD_MODULE_PS_THEMECUSTO_UPDATE'),(901,'ROLE_MOD_MODULE_PS_VIEWEDPRODUCT_CREATE'),(904,'ROLE_MOD_MODULE_PS_VIEWEDPRODUCT_DELETE'),(902,'ROLE_MOD_MODULE_PS_VIEWEDPRODUCT_READ'),(903,'ROLE_MOD_MODULE_PS_VIEWEDPRODUCT_UPDATE'),(905,'ROLE_MOD_MODULE_PS_WIREPAYMENT_CREATE'),(908,'ROLE_MOD_MODULE_PS_WIREPAYMENT_DELETE'),(906,'ROLE_MOD_MODULE_PS_WIREPAYMENT_READ'),(907,'ROLE_MOD_MODULE_PS_WIREPAYMENT_UPDATE'),(909,'ROLE_MOD_MODULE_STATSBESTCATEGORIES_CREATE'),(912,'ROLE_MOD_MODULE_STATSBESTCATEGORIES_DELETE'),(910,'ROLE_MOD_MODULE_STATSBESTCATEGORIES_READ'),(911,'ROLE_MOD_MODULE_STATSBESTCATEGORIES_UPDATE'),(913,'ROLE_MOD_MODULE_STATSBESTCUSTOMERS_CREATE'),(916,'ROLE_MOD_MODULE_STATSBESTCUSTOMERS_DELETE'),(914,'ROLE_MOD_MODULE_STATSBESTCUSTOMERS_READ'),(915,'ROLE_MOD_MODULE_STATSBESTCUSTOMERS_UPDATE'),(917,'ROLE_MOD_MODULE_STATSBESTMANUFACTURERS_CREATE'),(920,'ROLE_MOD_MODULE_STATSBESTMANUFACTURERS_DELETE'),(918,'ROLE_MOD_MODULE_STATSBESTMANUFACTURERS_READ'),(919,'ROLE_MOD_MODULE_STATSBESTMANUFACTURERS_UPDATE'),(921,'ROLE_MOD_MODULE_STATSBESTPRODUCTS_CREATE'),(924,'ROLE_MOD_MODULE_STATSBESTPRODUCTS_DELETE'),(922,'ROLE_MOD_MODULE_STATSBESTPRODUCTS_READ'),(923,'ROLE_MOD_MODULE_STATSBESTPRODUCTS_UPDATE'),(925,'ROLE_MOD_MODULE_STATSBESTSUPPLIERS_CREATE'),(928,'ROLE_MOD_MODULE_STATSBESTSUPPLIERS_DELETE'),(926,'ROLE_MOD_MODULE_STATSBESTSUPPLIERS_READ'),(927,'ROLE_MOD_MODULE_STATSBESTSUPPLIERS_UPDATE'),(929,'ROLE_MOD_MODULE_STATSBESTVOUCHERS_CREATE'),(932,'ROLE_MOD_MODULE_STATSBESTVOUCHERS_DELETE'),(930,'ROLE_MOD_MODULE_STATSBESTVOUCHERS_READ'),(931,'ROLE_MOD_MODULE_STATSBESTVOUCHERS_UPDATE'),(933,'ROLE_MOD_MODULE_STATSCARRIER_CREATE'),(936,'ROLE_MOD_MODULE_STATSCARRIER_DELETE'),(934,'ROLE_MOD_MODULE_STATSCARRIER_READ'),(935,'ROLE_MOD_MODULE_STATSCARRIER_UPDATE'),(937,'ROLE_MOD_MODULE_STATSCATALOG_CREATE'),(940,'ROLE_MOD_MODULE_STATSCATALOG_DELETE'),(938,'ROLE_MOD_MODULE_STATSCATALOG_READ'),(939,'ROLE_MOD_MODULE_STATSCATALOG_UPDATE'),(941,'ROLE_MOD_MODULE_STATSCHECKUP_CREATE'),(944,'ROLE_MOD_MODULE_STATSCHECKUP_DELETE'),(942,'ROLE_MOD_MODULE_STATSCHECKUP_READ'),(943,'ROLE_MOD_MODULE_STATSCHECKUP_UPDATE'),(945,'ROLE_MOD_MODULE_STATSDATA_CREATE'),(948,'ROLE_MOD_MODULE_STATSDATA_DELETE'),(946,'ROLE_MOD_MODULE_STATSDATA_READ'),(947,'ROLE_MOD_MODULE_STATSDATA_UPDATE'),(949,'ROLE_MOD_MODULE_STATSFORECAST_CREATE'),(952,'ROLE_MOD_MODULE_STATSFORECAST_DELETE'),(950,'ROLE_MOD_MODULE_STATSFORECAST_READ'),(951,'ROLE_MOD_MODULE_STATSFORECAST_UPDATE'),(953,'ROLE_MOD_MODULE_STATSNEWSLETTER_CREATE'),(956,'ROLE_MOD_MODULE_STATSNEWSLETTER_DELETE'),(954,'ROLE_MOD_MODULE_STATSNEWSLETTER_READ'),(955,'ROLE_MOD_MODULE_STATSNEWSLETTER_UPDATE'),(957,'ROLE_MOD_MODULE_STATSPERSONALINFOS_CREATE'),(960,'ROLE_MOD_MODULE_STATSPERSONALINFOS_DELETE'),(958,'ROLE_MOD_MODULE_STATSPERSONALINFOS_READ'),(959,'ROLE_MOD_MODULE_STATSPERSONALINFOS_UPDATE'),(961,'ROLE_MOD_MODULE_STATSPRODUCT_CREATE'),(964,'ROLE_MOD_MODULE_STATSPRODUCT_DELETE'),(962,'ROLE_MOD_MODULE_STATSPRODUCT_READ'),(963,'ROLE_MOD_MODULE_STATSPRODUCT_UPDATE'),(965,'ROLE_MOD_MODULE_STATSREGISTRATIONS_CREATE'),(968,'ROLE_MOD_MODULE_STATSREGISTRATIONS_DELETE'),(966,'ROLE_MOD_MODULE_STATSREGISTRATIONS_READ'),(967,'ROLE_MOD_MODULE_STATSREGISTRATIONS_UPDATE'),(969,'ROLE_MOD_MODULE_STATSSALES_CREATE'),(972,'ROLE_MOD_MODULE_STATSSALES_DELETE'),(970,'ROLE_MOD_MODULE_STATSSALES_READ'),(971,'ROLE_MOD_MODULE_STATSSALES_UPDATE'),(973,'ROLE_MOD_MODULE_STATSSEARCH_CREATE'),(976,'ROLE_MOD_MODULE_STATSSEARCH_DELETE'),(974,'ROLE_MOD_MODULE_STATSSEARCH_READ'),(975,'ROLE_MOD_MODULE_STATSSEARCH_UPDATE'),(977,'ROLE_MOD_MODULE_STATSSTOCK_CREATE'),(980,'ROLE_MOD_MODULE_STATSSTOCK_DELETE'),(978,'ROLE_MOD_MODULE_STATSSTOCK_READ'),(979,'ROLE_MOD_MODULE_STATSSTOCK_UPDATE'),(1,'ROLE_MOD_TAB_ADMINACCESS_CREATE'),(4,'ROLE_MOD_TAB_ADMINACCESS_DELETE'),(2,'ROLE_MOD_TAB_ADMINACCESS_READ'),(3,'ROLE_MOD_TAB_ADMINACCESS_UPDATE'),(5,'ROLE_MOD_TAB_ADMINADDRESSES_CREATE'),(8,'ROLE_MOD_TAB_ADMINADDRESSES_DELETE'),(6,'ROLE_MOD_TAB_ADMINADDRESSES_READ'),(7,'ROLE_MOD_TAB_ADMINADDRESSES_UPDATE'),(417,'ROLE_MOD_TAB_ADMINADMINAPI_CREATE'),(420,'ROLE_MOD_TAB_ADMINADMINAPI_DELETE'),(418,'ROLE_MOD_TAB_ADMINADMINAPI_READ'),(419,'ROLE_MOD_TAB_ADMINADMINAPI_UPDATE'),(9,'ROLE_MOD_TAB_ADMINADMINPREFERENCES_CREATE'),(12,'ROLE_MOD_TAB_ADMINADMINPREFERENCES_DELETE'),(10,'ROLE_MOD_TAB_ADMINADMINPREFERENCES_READ'),(11,'ROLE_MOD_TAB_ADMINADMINPREFERENCES_UPDATE'),(13,'ROLE_MOD_TAB_ADMINADVANCEDPARAMETERS_CREATE'),(16,'ROLE_MOD_TAB_ADMINADVANCEDPARAMETERS_DELETE'),(14,'ROLE_MOD_TAB_ADMINADVANCEDPARAMETERS_READ'),(15,'ROLE_MOD_TAB_ADMINADVANCEDPARAMETERS_UPDATE'),(685,'ROLE_MOD_TAB_ADMINAJAXPRESTASHOPCHECKOUT_CREATE'),(688,'ROLE_MOD_TAB_ADMINAJAXPRESTASHOPCHECKOUT_DELETE'),(686,'ROLE_MOD_TAB_ADMINAJAXPRESTASHOPCHECKOUT_READ'),(687,'ROLE_MOD_TAB_ADMINAJAXPRESTASHOPCHECKOUT_UPDATE'),(549,'ROLE_MOD_TAB_ADMINAJAXPSACCOUNTS_CREATE'),(552,'ROLE_MOD_TAB_ADMINAJAXPSACCOUNTS_DELETE'),(550,'ROLE_MOD_TAB_ADMINAJAXPSACCOUNTS_READ'),(551,'ROLE_MOD_TAB_ADMINAJAXPSACCOUNTS_UPDATE'),(765,'ROLE_MOD_TAB_ADMINAJAXPSFACEBOOK_CREATE'),(768,'ROLE_MOD_TAB_ADMINAJAXPSFACEBOOK_DELETE'),(766,'ROLE_MOD_TAB_ADMINAJAXPSFACEBOOK_READ'),(767,'ROLE_MOD_TAB_ADMINAJAXPSFACEBOOK_UPDATE'),(597,'ROLE_MOD_TAB_ADMINAJAXPSGDPR_CREATE'),(600,'ROLE_MOD_TAB_ADMINAJAXPSGDPR_DELETE'),(598,'ROLE_MOD_TAB_ADMINAJAXPSGDPR_READ'),(599,'ROLE_MOD_TAB_ADMINAJAXPSGDPR_UPDATE'),(641,'ROLE_MOD_TAB_ADMINAJAXPSXMKTGWITHGOOGLE_CREATE'),(644,'ROLE_MOD_TAB_ADMINAJAXPSXMKTGWITHGOOGLE_DELETE'),(642,'ROLE_MOD_TAB_ADMINAJAXPSXMKTGWITHGOOGLE_READ'),(643,'ROLE_MOD_TAB_ADMINAJAXPSXMKTGWITHGOOGLE_UPDATE'),(553,'ROLE_MOD_TAB_ADMINAJAXV2PSACCOUNTS_CREATE'),(556,'ROLE_MOD_TAB_ADMINAJAXV2PSACCOUNTS_DELETE'),(554,'ROLE_MOD_TAB_ADMINAJAXV2PSACCOUNTS_READ'),(555,'ROLE_MOD_TAB_ADMINAJAXV2PSACCOUNTS_UPDATE'),(474,'ROLE_MOD_TAB_ADMINALIASES_CREATE'),(476,'ROLE_MOD_TAB_ADMINALIASES_DELETE'),(473,'ROLE_MOD_TAB_ADMINALIASES_READ'),(475,'ROLE_MOD_TAB_ADMINALIASES_UPDATE'),(17,'ROLE_MOD_TAB_ADMINATTACHMENTS_CREATE'),(20,'ROLE_MOD_TAB_ADMINATTACHMENTS_DELETE'),(18,'ROLE_MOD_TAB_ADMINATTACHMENTS_READ'),(19,'ROLE_MOD_TAB_ADMINATTACHMENTS_UPDATE'),(21,'ROLE_MOD_TAB_ADMINATTRIBUTESGROUPS_CREATE'),(24,'ROLE_MOD_TAB_ADMINATTRIBUTESGROUPS_DELETE'),(22,'ROLE_MOD_TAB_ADMINATTRIBUTESGROUPS_READ'),(23,'ROLE_MOD_TAB_ADMINATTRIBUTESGROUPS_UPDATE'),(25,'ROLE_MOD_TAB_ADMINBACKUP_CREATE'),(28,'ROLE_MOD_TAB_ADMINBACKUP_DELETE'),(26,'ROLE_MOD_TAB_ADMINBACKUP_READ'),(27,'ROLE_MOD_TAB_ADMINBACKUP_UPDATE'),(485,'ROLE_MOD_TAB_ADMINBLOCKLISTING_CREATE'),(488,'ROLE_MOD_TAB_ADMINBLOCKLISTING_DELETE'),(486,'ROLE_MOD_TAB_ADMINBLOCKLISTING_READ'),(487,'ROLE_MOD_TAB_ADMINBLOCKLISTING_UPDATE'),(213,'ROLE_MOD_TAB_ADMINBUSINESSENTITIES_CREATE'),(216,'ROLE_MOD_TAB_ADMINBUSINESSENTITIES_DELETE'),(214,'ROLE_MOD_TAB_ADMINBUSINESSENTITIES_READ'),(215,'ROLE_MOD_TAB_ADMINBUSINESSENTITIES_UPDATE'),(209,'ROLE_MOD_TAB_ADMINBUSINESSENTITY_CREATE'),(212,'ROLE_MOD_TAB_ADMINBUSINESSENTITY_DELETE'),(210,'ROLE_MOD_TAB_ADMINBUSINESSENTITY_READ'),(211,'ROLE_MOD_TAB_ADMINBUSINESSENTITY_UPDATE'),(29,'ROLE_MOD_TAB_ADMINCARRIERS_CREATE'),(32,'ROLE_MOD_TAB_ADMINCARRIERS_DELETE'),(30,'ROLE_MOD_TAB_ADMINCARRIERS_READ'),(31,'ROLE_MOD_TAB_ADMINCARRIERS_UPDATE'),(33,'ROLE_MOD_TAB_ADMINCARTRULES_CREATE'),(36,'ROLE_MOD_TAB_ADMINCARTRULES_DELETE'),(34,'ROLE_MOD_TAB_ADMINCARTRULES_READ'),(35,'ROLE_MOD_TAB_ADMINCARTRULES_UPDATE'),(37,'ROLE_MOD_TAB_ADMINCARTS_CREATE'),(40,'ROLE_MOD_TAB_ADMINCARTS_DELETE'),(38,'ROLE_MOD_TAB_ADMINCARTS_READ'),(39,'ROLE_MOD_TAB_ADMINCARTS_UPDATE'),(41,'ROLE_MOD_TAB_ADMINCATALOG_CREATE'),(44,'ROLE_MOD_TAB_ADMINCATALOG_DELETE'),(42,'ROLE_MOD_TAB_ADMINCATALOG_READ'),(43,'ROLE_MOD_TAB_ADMINCATALOG_UPDATE'),(45,'ROLE_MOD_TAB_ADMINCATEGORIES_CREATE'),(48,'ROLE_MOD_TAB_ADMINCATEGORIES_DELETE'),(46,'ROLE_MOD_TAB_ADMINCATEGORIES_READ'),(47,'ROLE_MOD_TAB_ADMINCATEGORIES_UPDATE'),(49,'ROLE_MOD_TAB_ADMINCMSCONTENT_CREATE'),(52,'ROLE_MOD_TAB_ADMINCMSCONTENT_DELETE'),(50,'ROLE_MOD_TAB_ADMINCMSCONTENT_READ'),(51,'ROLE_MOD_TAB_ADMINCMSCONTENT_UPDATE'),(781,'ROLE_MOD_TAB_ADMINCONFIGUREFAVICONBO_CREATE'),(784,'ROLE_MOD_TAB_ADMINCONFIGUREFAVICONBO_DELETE'),(782,'ROLE_MOD_TAB_ADMINCONFIGUREFAVICONBO_READ'),(783,'ROLE_MOD_TAB_ADMINCONFIGUREFAVICONBO_UPDATE'),(801,'ROLE_MOD_TAB_ADMINCONFIGURESLIDES_CREATE'),(804,'ROLE_MOD_TAB_ADMINCONFIGURESLIDES_DELETE'),(802,'ROLE_MOD_TAB_ADMINCONFIGURESLIDES_READ'),(803,'ROLE_MOD_TAB_ADMINCONFIGURESLIDES_UPDATE'),(53,'ROLE_MOD_TAB_ADMINCONTACTS_CREATE'),(56,'ROLE_MOD_TAB_ADMINCONTACTS_DELETE'),(54,'ROLE_MOD_TAB_ADMINCONTACTS_READ'),(55,'ROLE_MOD_TAB_ADMINCONTACTS_UPDATE'),(57,'ROLE_MOD_TAB_ADMINCOUNTRIES_CREATE'),(60,'ROLE_MOD_TAB_ADMINCOUNTRIES_DELETE'),(58,'ROLE_MOD_TAB_ADMINCOUNTRIES_READ'),(59,'ROLE_MOD_TAB_ADMINCOUNTRIES_UPDATE'),(61,'ROLE_MOD_TAB_ADMINCURRENCIES_CREATE'),(64,'ROLE_MOD_TAB_ADMINCURRENCIES_DELETE'),(62,'ROLE_MOD_TAB_ADMINCURRENCIES_READ'),(63,'ROLE_MOD_TAB_ADMINCURRENCIES_UPDATE'),(65,'ROLE_MOD_TAB_ADMINCUSTOMERPREFERENCES_CREATE'),(68,'ROLE_MOD_TAB_ADMINCUSTOMERPREFERENCES_DELETE'),(66,'ROLE_MOD_TAB_ADMINCUSTOMERPREFERENCES_READ'),(67,'ROLE_MOD_TAB_ADMINCUSTOMERPREFERENCES_UPDATE'),(217,'ROLE_MOD_TAB_ADMINCUSTOMERSB2B_CREATE'),(220,'ROLE_MOD_TAB_ADMINCUSTOMERSB2B_DELETE'),(218,'ROLE_MOD_TAB_ADMINCUSTOMERSB2B_READ'),(219,'ROLE_MOD_TAB_ADMINCUSTOMERSB2B_UPDATE'),(69,'ROLE_MOD_TAB_ADMINCUSTOMERS_CREATE'),(72,'ROLE_MOD_TAB_ADMINCUSTOMERS_DELETE'),(70,'ROLE_MOD_TAB_ADMINCUSTOMERS_READ'),(71,'ROLE_MOD_TAB_ADMINCUSTOMERS_UPDATE'),(73,'ROLE_MOD_TAB_ADMINCUSTOMERTHREADS_CREATE'),(76,'ROLE_MOD_TAB_ADMINCUSTOMERTHREADS_DELETE'),(74,'ROLE_MOD_TAB_ADMINCUSTOMERTHREADS_READ'),(75,'ROLE_MOD_TAB_ADMINCUSTOMERTHREADS_UPDATE'),(77,'ROLE_MOD_TAB_ADMINDASHBOARD_CREATE'),(80,'ROLE_MOD_TAB_ADMINDASHBOARD_DELETE'),(78,'ROLE_MOD_TAB_ADMINDASHBOARD_READ'),(79,'ROLE_MOD_TAB_ADMINDASHBOARD_UPDATE'),(513,'ROLE_MOD_TAB_ADMINDASHGOALS_CREATE'),(516,'ROLE_MOD_TAB_ADMINDASHGOALS_DELETE'),(514,'ROLE_MOD_TAB_ADMINDASHGOALS_READ'),(515,'ROLE_MOD_TAB_ADMINDASHGOALS_UPDATE'),(569,'ROLE_MOD_TAB_ADMINDEBUGPSACCOUNTS_CREATE'),(572,'ROLE_MOD_TAB_ADMINDEBUGPSACCOUNTS_DELETE'),(570,'ROLE_MOD_TAB_ADMINDEBUGPSACCOUNTS_READ'),(571,'ROLE_MOD_TAB_ADMINDEBUGPSACCOUNTS_UPDATE'),(81,'ROLE_MOD_TAB_ADMINDELIVERYSLIP_CREATE'),(84,'ROLE_MOD_TAB_ADMINDELIVERYSLIP_DELETE'),(82,'ROLE_MOD_TAB_ADMINDELIVERYSLIP_READ'),(83,'ROLE_MOD_TAB_ADMINDELIVERYSLIP_UPDATE'),(601,'ROLE_MOD_TAB_ADMINDOWNLOADINVOICESPSGDPR_CREATE'),(604,'ROLE_MOD_TAB_ADMINDOWNLOADINVOICESPSGDPR_DELETE'),(602,'ROLE_MOD_TAB_ADMINDOWNLOADINVOICESPSGDPR_READ'),(603,'ROLE_MOD_TAB_ADMINDOWNLOADINVOICESPSGDPR_UPDATE'),(85,'ROLE_MOD_TAB_ADMINEMAILS_CREATE'),(88,'ROLE_MOD_TAB_ADMINEMAILS_DELETE'),(86,'ROLE_MOD_TAB_ADMINEMAILS_READ'),(87,'ROLE_MOD_TAB_ADMINEMAILS_UPDATE'),(89,'ROLE_MOD_TAB_ADMINEMPLOYEES_CREATE'),(92,'ROLE_MOD_TAB_ADMINEMPLOYEES_DELETE'),(90,'ROLE_MOD_TAB_ADMINEMPLOYEES_READ'),(91,'ROLE_MOD_TAB_ADMINEMPLOYEES_UPDATE'),(93,'ROLE_MOD_TAB_ADMINEXTRAPROPERTYDEFINITIONS_CREATE'),(96,'ROLE_MOD_TAB_ADMINEXTRAPROPERTYDEFINITIONS_DELETE'),(94,'ROLE_MOD_TAB_ADMINEXTRAPROPERTYDEFINITIONS_READ'),(95,'ROLE_MOD_TAB_ADMINEXTRAPROPERTYDEFINITIONS_UPDATE'),(453,'ROLE_MOD_TAB_ADMINFEATUREFLAG_CREATE'),(456,'ROLE_MOD_TAB_ADMINFEATUREFLAG_DELETE'),(454,'ROLE_MOD_TAB_ADMINFEATUREFLAG_READ'),(455,'ROLE_MOD_TAB_ADMINFEATUREFLAG_UPDATE'),(97,'ROLE_MOD_TAB_ADMINFEATURES_CREATE'),(100,'ROLE_MOD_TAB_ADMINFEATURES_DELETE'),(98,'ROLE_MOD_TAB_ADMINFEATURES_READ'),(99,'ROLE_MOD_TAB_ADMINFEATURES_UPDATE'),(793,'ROLE_MOD_TAB_ADMINGANALYTICSAJAX_CREATE'),(796,'ROLE_MOD_TAB_ADMINGANALYTICSAJAX_DELETE'),(794,'ROLE_MOD_TAB_ADMINGANALYTICSAJAX_READ'),(795,'ROLE_MOD_TAB_ADMINGANALYTICSAJAX_UPDATE'),(101,'ROLE_MOD_TAB_ADMINGENDERS_CREATE'),(104,'ROLE_MOD_TAB_ADMINGENDERS_DELETE'),(102,'ROLE_MOD_TAB_ADMINGENDERS_READ'),(103,'ROLE_MOD_TAB_ADMINGENDERS_UPDATE'),(105,'ROLE_MOD_TAB_ADMINGEOLOCATION_CREATE'),(108,'ROLE_MOD_TAB_ADMINGEOLOCATION_DELETE'),(106,'ROLE_MOD_TAB_ADMINGEOLOCATION_READ'),(107,'ROLE_MOD_TAB_ADMINGEOLOCATION_UPDATE'),(109,'ROLE_MOD_TAB_ADMINGROUPS_CREATE'),(112,'ROLE_MOD_TAB_ADMINGROUPS_DELETE'),(110,'ROLE_MOD_TAB_ADMINGROUPS_READ'),(111,'ROLE_MOD_TAB_ADMINGROUPS_UPDATE'),(113,'ROLE_MOD_TAB_ADMINIMAGES_CREATE'),(116,'ROLE_MOD_TAB_ADMINIMAGES_DELETE'),(114,'ROLE_MOD_TAB_ADMINIMAGES_READ'),(115,'ROLE_MOD_TAB_ADMINIMAGES_UPDATE'),(117,'ROLE_MOD_TAB_ADMINIMPORT_CREATE'),(120,'ROLE_MOD_TAB_ADMINIMPORT_DELETE'),(118,'ROLE_MOD_TAB_ADMINIMPORT_READ'),(119,'ROLE_MOD_TAB_ADMINIMPORT_UPDATE'),(121,'ROLE_MOD_TAB_ADMININFORMATION_CREATE'),(124,'ROLE_MOD_TAB_ADMININFORMATION_DELETE'),(122,'ROLE_MOD_TAB_ADMININFORMATION_READ'),(123,'ROLE_MOD_TAB_ADMININFORMATION_UPDATE'),(125,'ROLE_MOD_TAB_ADMININTERNATIONAL_CREATE'),(128,'ROLE_MOD_TAB_ADMININTERNATIONAL_DELETE'),(126,'ROLE_MOD_TAB_ADMININTERNATIONAL_READ'),(127,'ROLE_MOD_TAB_ADMININTERNATIONAL_UPDATE'),(129,'ROLE_MOD_TAB_ADMININVOICES_CREATE'),(132,'ROLE_MOD_TAB_ADMININVOICES_DELETE'),(130,'ROLE_MOD_TAB_ADMININVOICES_READ'),(131,'ROLE_MOD_TAB_ADMININVOICES_UPDATE'),(545,'ROLE_MOD_TAB_ADMINKLAVIYOPSCONFIG_CREATE'),(548,'ROLE_MOD_TAB_ADMINKLAVIYOPSCONFIG_DELETE'),(546,'ROLE_MOD_TAB_ADMINKLAVIYOPSCONFIG_READ'),(547,'ROLE_MOD_TAB_ADMINKLAVIYOPSCONFIG_UPDATE'),(133,'ROLE_MOD_TAB_ADMINLANGUAGES_CREATE'),(136,'ROLE_MOD_TAB_ADMINLANGUAGES_DELETE'),(134,'ROLE_MOD_TAB_ADMINLANGUAGES_READ'),(135,'ROLE_MOD_TAB_ADMINLANGUAGES_UPDATE'),(137,'ROLE_MOD_TAB_ADMINLINKWIDGET_CREATE'),(140,'ROLE_MOD_TAB_ADMINLINKWIDGET_DELETE'),(138,'ROLE_MOD_TAB_ADMINLINKWIDGET_READ'),(139,'ROLE_MOD_TAB_ADMINLINKWIDGET_UPDATE'),(141,'ROLE_MOD_TAB_ADMINLOCALIZATION_CREATE'),(144,'ROLE_MOD_TAB_ADMINLOCALIZATION_DELETE'),(142,'ROLE_MOD_TAB_ADMINLOCALIZATION_READ'),(143,'ROLE_MOD_TAB_ADMINLOCALIZATION_UPDATE'),(561,'ROLE_MOD_TAB_ADMINLOGINPSACCOUNTS_CREATE'),(564,'ROLE_MOD_TAB_ADMINLOGINPSACCOUNTS_DELETE'),(562,'ROLE_MOD_TAB_ADMINLOGINPSACCOUNTS_READ'),(563,'ROLE_MOD_TAB_ADMINLOGINPSACCOUNTS_UPDATE'),(573,'ROLE_MOD_TAB_ADMINLOGIN_CREATE'),(576,'ROLE_MOD_TAB_ADMINLOGIN_DELETE'),(574,'ROLE_MOD_TAB_ADMINLOGIN_READ'),(575,'ROLE_MOD_TAB_ADMINLOGIN_UPDATE'),(145,'ROLE_MOD_TAB_ADMINLOGS_CREATE'),(148,'ROLE_MOD_TAB_ADMINLOGS_DELETE'),(146,'ROLE_MOD_TAB_ADMINLOGS_READ'),(147,'ROLE_MOD_TAB_ADMINLOGS_UPDATE'),(445,'ROLE_MOD_TAB_ADMINMAILTHEME_CREATE'),(448,'ROLE_MOD_TAB_ADMINMAILTHEME_DELETE'),(446,'ROLE_MOD_TAB_ADMINMAILTHEME_READ'),(447,'ROLE_MOD_TAB_ADMINMAILTHEME_UPDATE'),(149,'ROLE_MOD_TAB_ADMINMAINTENANCE_CREATE'),(152,'ROLE_MOD_TAB_ADMINMAINTENANCE_DELETE'),(150,'ROLE_MOD_TAB_ADMINMAINTENANCE_READ'),(151,'ROLE_MOD_TAB_ADMINMAINTENANCE_UPDATE'),(153,'ROLE_MOD_TAB_ADMINMANUFACTURERS_CREATE'),(156,'ROLE_MOD_TAB_ADMINMANUFACTURERS_DELETE'),(154,'ROLE_MOD_TAB_ADMINMANUFACTURERS_READ'),(155,'ROLE_MOD_TAB_ADMINMANUFACTURERS_UPDATE'),(157,'ROLE_MOD_TAB_ADMINMETA_CREATE'),(160,'ROLE_MOD_TAB_ADMINMETA_DELETE'),(158,'ROLE_MOD_TAB_ADMINMETA_READ'),(159,'ROLE_MOD_TAB_ADMINMETA_UPDATE'),(449,'ROLE_MOD_TAB_ADMINMODULESMANAGE_CREATE'),(452,'ROLE_MOD_TAB_ADMINMODULESMANAGE_DELETE'),(450,'ROLE_MOD_TAB_ADMINMODULESMANAGE_READ'),(451,'ROLE_MOD_TAB_ADMINMODULESMANAGE_UPDATE'),(173,'ROLE_MOD_TAB_ADMINMODULESNOTIFICATIONS_CREATE'),(176,'ROLE_MOD_TAB_ADMINMODULESNOTIFICATIONS_DELETE'),(174,'ROLE_MOD_TAB_ADMINMODULESNOTIFICATIONS_READ'),(175,'ROLE_MOD_TAB_ADMINMODULESNOTIFICATIONS_UPDATE'),(165,'ROLE_MOD_TAB_ADMINMODULESPOSITIONS_CREATE'),(168,'ROLE_MOD_TAB_ADMINMODULESPOSITIONS_DELETE'),(166,'ROLE_MOD_TAB_ADMINMODULESPOSITIONS_READ'),(167,'ROLE_MOD_TAB_ADMINMODULESPOSITIONS_UPDATE'),(177,'ROLE_MOD_TAB_ADMINMODULESSF_CREATE'),(180,'ROLE_MOD_TAB_ADMINMODULESSF_DELETE'),(178,'ROLE_MOD_TAB_ADMINMODULESSF_READ'),(179,'ROLE_MOD_TAB_ADMINMODULESSF_UPDATE'),(169,'ROLE_MOD_TAB_ADMINMODULESUPDATES_CREATE'),(172,'ROLE_MOD_TAB_ADMINMODULESUPDATES_DELETE'),(170,'ROLE_MOD_TAB_ADMINMODULESUPDATES_READ'),(171,'ROLE_MOD_TAB_ADMINMODULESUPDATES_UPDATE'),(161,'ROLE_MOD_TAB_ADMINMODULES_CREATE'),(164,'ROLE_MOD_TAB_ADMINMODULES_DELETE'),(162,'ROLE_MOD_TAB_ADMINMODULES_READ'),(163,'ROLE_MOD_TAB_ADMINMODULES_UPDATE'),(557,'ROLE_MOD_TAB_ADMINOAUTH2PSACCOUNTS_CREATE'),(560,'ROLE_MOD_TAB_ADMINOAUTH2PSACCOUNTS_DELETE'),(558,'ROLE_MOD_TAB_ADMINOAUTH2PSACCOUNTS_READ'),(559,'ROLE_MOD_TAB_ADMINOAUTH2PSACCOUNTS_UPDATE'),(181,'ROLE_MOD_TAB_ADMINORDERMESSAGE_CREATE'),(184,'ROLE_MOD_TAB_ADMINORDERMESSAGE_DELETE'),(182,'ROLE_MOD_TAB_ADMINORDERMESSAGE_READ'),(183,'ROLE_MOD_TAB_ADMINORDERMESSAGE_UPDATE'),(185,'ROLE_MOD_TAB_ADMINORDERPREFERENCES_CREATE'),(188,'ROLE_MOD_TAB_ADMINORDERPREFERENCES_DELETE'),(186,'ROLE_MOD_TAB_ADMINORDERPREFERENCES_READ'),(187,'ROLE_MOD_TAB_ADMINORDERPREFERENCES_UPDATE'),(189,'ROLE_MOD_TAB_ADMINORDERS_CREATE'),(192,'ROLE_MOD_TAB_ADMINORDERS_DELETE'),(190,'ROLE_MOD_TAB_ADMINORDERS_READ'),(191,'ROLE_MOD_TAB_ADMINORDERS_UPDATE'),(193,'ROLE_MOD_TAB_ADMINOUTSTANDING_CREATE'),(196,'ROLE_MOD_TAB_ADMINOUTSTANDING_DELETE'),(194,'ROLE_MOD_TAB_ADMINOUTSTANDING_READ'),(195,'ROLE_MOD_TAB_ADMINOUTSTANDING_UPDATE'),(197,'ROLE_MOD_TAB_ADMINPARENTATTRIBUTESGROUPS_CREATE'),(200,'ROLE_MOD_TAB_ADMINPARENTATTRIBUTESGROUPS_DELETE'),(198,'ROLE_MOD_TAB_ADMINPARENTATTRIBUTESGROUPS_READ'),(199,'ROLE_MOD_TAB_ADMINPARENTATTRIBUTESGROUPS_UPDATE'),(201,'ROLE_MOD_TAB_ADMINPARENTCARTRULES_CREATE'),(204,'ROLE_MOD_TAB_ADMINPARENTCARTRULES_DELETE'),(202,'ROLE_MOD_TAB_ADMINPARENTCARTRULES_READ'),(203,'ROLE_MOD_TAB_ADMINPARENTCARTRULES_UPDATE'),(205,'ROLE_MOD_TAB_ADMINPARENTCOUNTRIES_CREATE'),(208,'ROLE_MOD_TAB_ADMINPARENTCOUNTRIES_DELETE'),(206,'ROLE_MOD_TAB_ADMINPARENTCOUNTRIES_READ'),(207,'ROLE_MOD_TAB_ADMINPARENTCOUNTRIES_UPDATE'),(225,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERPREFERENCES_CREATE'),(228,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERPREFERENCES_DELETE'),(226,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERPREFERENCES_READ'),(227,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERPREFERENCES_UPDATE'),(229,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERTHREADS_CREATE'),(232,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERTHREADS_DELETE'),(230,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERTHREADS_READ'),(231,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERTHREADS_UPDATE'),(221,'ROLE_MOD_TAB_ADMINPARENTCUSTOMER_CREATE'),(224,'ROLE_MOD_TAB_ADMINPARENTCUSTOMER_DELETE'),(222,'ROLE_MOD_TAB_ADMINPARENTCUSTOMER_READ'),(223,'ROLE_MOD_TAB_ADMINPARENTCUSTOMER_UPDATE'),(233,'ROLE_MOD_TAB_ADMINPARENTEMPLOYEES_CREATE'),(236,'ROLE_MOD_TAB_ADMINPARENTEMPLOYEES_DELETE'),(234,'ROLE_MOD_TAB_ADMINPARENTEMPLOYEES_READ'),(235,'ROLE_MOD_TAB_ADMINPARENTEMPLOYEES_UPDATE'),(237,'ROLE_MOD_TAB_ADMINPARENTLOCALIZATION_CREATE'),(240,'ROLE_MOD_TAB_ADMINPARENTLOCALIZATION_DELETE'),(238,'ROLE_MOD_TAB_ADMINPARENTLOCALIZATION_READ'),(239,'ROLE_MOD_TAB_ADMINPARENTLOCALIZATION_UPDATE'),(441,'ROLE_MOD_TAB_ADMINPARENTMAILTHEME_CREATE'),(444,'ROLE_MOD_TAB_ADMINPARENTMAILTHEME_DELETE'),(442,'ROLE_MOD_TAB_ADMINPARENTMAILTHEME_READ'),(443,'ROLE_MOD_TAB_ADMINPARENTMAILTHEME_UPDATE'),(241,'ROLE_MOD_TAB_ADMINPARENTMANUFACTURERS_CREATE'),(244,'ROLE_MOD_TAB_ADMINPARENTMANUFACTURERS_DELETE'),(242,'ROLE_MOD_TAB_ADMINPARENTMANUFACTURERS_READ'),(243,'ROLE_MOD_TAB_ADMINPARENTMANUFACTURERS_UPDATE'),(249,'ROLE_MOD_TAB_ADMINPARENTMETA_CREATE'),(252,'ROLE_MOD_TAB_ADMINPARENTMETA_DELETE'),(250,'ROLE_MOD_TAB_ADMINPARENTMETA_READ'),(251,'ROLE_MOD_TAB_ADMINPARENTMETA_UPDATE'),(245,'ROLE_MOD_TAB_ADMINPARENTMODULESSF_CREATE'),(248,'ROLE_MOD_TAB_ADMINPARENTMODULESSF_DELETE'),(246,'ROLE_MOD_TAB_ADMINPARENTMODULESSF_READ'),(247,'ROLE_MOD_TAB_ADMINPARENTMODULESSF_UPDATE'),(253,'ROLE_MOD_TAB_ADMINPARENTMODULES_CREATE'),(256,'ROLE_MOD_TAB_ADMINPARENTMODULES_DELETE'),(254,'ROLE_MOD_TAB_ADMINPARENTMODULES_READ'),(255,'ROLE_MOD_TAB_ADMINPARENTMODULES_UPDATE'),(257,'ROLE_MOD_TAB_ADMINPARENTORDERPREFERENCES_CREATE'),(260,'ROLE_MOD_TAB_ADMINPARENTORDERPREFERENCES_DELETE'),(258,'ROLE_MOD_TAB_ADMINPARENTORDERPREFERENCES_READ'),(259,'ROLE_MOD_TAB_ADMINPARENTORDERPREFERENCES_UPDATE'),(261,'ROLE_MOD_TAB_ADMINPARENTORDERS_CREATE'),(264,'ROLE_MOD_TAB_ADMINPARENTORDERS_DELETE'),(262,'ROLE_MOD_TAB_ADMINPARENTORDERS_READ'),(263,'ROLE_MOD_TAB_ADMINPARENTORDERS_UPDATE'),(265,'ROLE_MOD_TAB_ADMINPARENTPAYMENT_CREATE'),(268,'ROLE_MOD_TAB_ADMINPARENTPAYMENT_DELETE'),(266,'ROLE_MOD_TAB_ADMINPARENTPAYMENT_READ'),(267,'ROLE_MOD_TAB_ADMINPARENTPAYMENT_UPDATE'),(269,'ROLE_MOD_TAB_ADMINPARENTPREFERENCES_CREATE'),(272,'ROLE_MOD_TAB_ADMINPARENTPREFERENCES_DELETE'),(270,'ROLE_MOD_TAB_ADMINPARENTPREFERENCES_READ'),(271,'ROLE_MOD_TAB_ADMINPARENTPREFERENCES_UPDATE'),(273,'ROLE_MOD_TAB_ADMINPARENTREQUESTSQL_CREATE'),(276,'ROLE_MOD_TAB_ADMINPARENTREQUESTSQL_DELETE'),(274,'ROLE_MOD_TAB_ADMINPARENTREQUESTSQL_READ'),(275,'ROLE_MOD_TAB_ADMINPARENTREQUESTSQL_UPDATE'),(277,'ROLE_MOD_TAB_ADMINPARENTSEARCHCONF_CREATE'),(280,'ROLE_MOD_TAB_ADMINPARENTSEARCHCONF_DELETE'),(278,'ROLE_MOD_TAB_ADMINPARENTSEARCHCONF_READ'),(279,'ROLE_MOD_TAB_ADMINPARENTSEARCHCONF_UPDATE'),(457,'ROLE_MOD_TAB_ADMINPARENTSECURITY_CREATE'),(460,'ROLE_MOD_TAB_ADMINPARENTSECURITY_DELETE'),(458,'ROLE_MOD_TAB_ADMINPARENTSECURITY_READ'),(459,'ROLE_MOD_TAB_ADMINPARENTSECURITY_UPDATE'),(281,'ROLE_MOD_TAB_ADMINPARENTSHIPPING_CREATE'),(284,'ROLE_MOD_TAB_ADMINPARENTSHIPPING_DELETE'),(282,'ROLE_MOD_TAB_ADMINPARENTSHIPPING_READ'),(283,'ROLE_MOD_TAB_ADMINPARENTSHIPPING_UPDATE'),(285,'ROLE_MOD_TAB_ADMINPARENTSTORES_CREATE'),(288,'ROLE_MOD_TAB_ADMINPARENTSTORES_DELETE'),(286,'ROLE_MOD_TAB_ADMINPARENTSTORES_READ'),(287,'ROLE_MOD_TAB_ADMINPARENTSTORES_UPDATE'),(289,'ROLE_MOD_TAB_ADMINPARENTTAXES_CREATE'),(292,'ROLE_MOD_TAB_ADMINPARENTTAXES_DELETE'),(290,'ROLE_MOD_TAB_ADMINPARENTTAXES_READ'),(291,'ROLE_MOD_TAB_ADMINPARENTTAXES_UPDATE'),(293,'ROLE_MOD_TAB_ADMINPARENTTHEMES_CREATE'),(296,'ROLE_MOD_TAB_ADMINPARENTTHEMES_DELETE'),(294,'ROLE_MOD_TAB_ADMINPARENTTHEMES_READ'),(295,'ROLE_MOD_TAB_ADMINPARENTTHEMES_UPDATE'),(301,'ROLE_MOD_TAB_ADMINPAYMENTPREFERENCES_CREATE'),(304,'ROLE_MOD_TAB_ADMINPAYMENTPREFERENCES_DELETE'),(302,'ROLE_MOD_TAB_ADMINPAYMENTPREFERENCES_READ'),(303,'ROLE_MOD_TAB_ADMINPAYMENTPREFERENCES_UPDATE'),(297,'ROLE_MOD_TAB_ADMINPAYMENT_CREATE'),(300,'ROLE_MOD_TAB_ADMINPAYMENT_DELETE'),(298,'ROLE_MOD_TAB_ADMINPAYMENT_READ'),(299,'ROLE_MOD_TAB_ADMINPAYMENT_UPDATE'),(305,'ROLE_MOD_TAB_ADMINPERFORMANCE_CREATE'),(308,'ROLE_MOD_TAB_ADMINPERFORMANCE_DELETE'),(306,'ROLE_MOD_TAB_ADMINPERFORMANCE_READ'),(307,'ROLE_MOD_TAB_ADMINPERFORMANCE_UPDATE'),(309,'ROLE_MOD_TAB_ADMINPPREFERENCES_CREATE'),(312,'ROLE_MOD_TAB_ADMINPPREFERENCES_DELETE'),(310,'ROLE_MOD_TAB_ADMINPPREFERENCES_READ'),(311,'ROLE_MOD_TAB_ADMINPPREFERENCES_UPDATE'),(313,'ROLE_MOD_TAB_ADMINPREFERENCES_CREATE'),(316,'ROLE_MOD_TAB_ADMINPREFERENCES_DELETE'),(314,'ROLE_MOD_TAB_ADMINPREFERENCES_READ'),(315,'ROLE_MOD_TAB_ADMINPREFERENCES_UPDATE'),(317,'ROLE_MOD_TAB_ADMINPRODUCTS_CREATE'),(320,'ROLE_MOD_TAB_ADMINPRODUCTS_DELETE'),(318,'ROLE_MOD_TAB_ADMINPRODUCTS_READ'),(319,'ROLE_MOD_TAB_ADMINPRODUCTS_UPDATE'),(321,'ROLE_MOD_TAB_ADMINPROFILES_CREATE'),(324,'ROLE_MOD_TAB_ADMINPROFILES_DELETE'),(322,'ROLE_MOD_TAB_ADMINPROFILES_READ'),(323,'ROLE_MOD_TAB_ADMINPROFILES_UPDATE'),(697,'ROLE_MOD_TAB_ADMINPSCLASSICEDITIONHOMEPAGECONTROLLER_CREATE'),(700,'ROLE_MOD_TAB_ADMINPSCLASSICEDITIONHOMEPAGECONTROLLER_DELETE'),(698,'ROLE_MOD_TAB_ADMINPSCLASSICEDITIONHOMEPAGECONTROLLER_READ'),(699,'ROLE_MOD_TAB_ADMINPSCLASSICEDITIONHOMEPAGECONTROLLER_UPDATE'),(705,'ROLE_MOD_TAB_ADMINPSCLASSICEDITIONPSACADEMYCONTROLLER_CREATE'),(708,'ROLE_MOD_TAB_ADMINPSCLASSICEDITIONPSACADEMYCONTROLLER_DELETE'),(706,'ROLE_MOD_TAB_ADMINPSCLASSICEDITIONPSACADEMYCONTROLLER_READ'),(707,'ROLE_MOD_TAB_ADMINPSCLASSICEDITIONPSACADEMYCONTROLLER_UPDATE'),(741,'ROLE_MOD_TAB_ADMINPSDISTRIBUTIONAPICLIENTCOMMUNITY_CREATE'),(744,'ROLE_MOD_TAB_ADMINPSDISTRIBUTIONAPICLIENTCOMMUNITY_DELETE'),(742,'ROLE_MOD_TAB_ADMINPSDISTRIBUTIONAPICLIENTCOMMUNITY_READ'),(743,'ROLE_MOD_TAB_ADMINPSDISTRIBUTIONAPICLIENTCOMMUNITY_UPDATE'),(745,'ROLE_MOD_TAB_ADMINPSDISTRIBUTIONAPICLIENT_CREATE'),(748,'ROLE_MOD_TAB_ADMINPSDISTRIBUTIONAPICLIENT_DELETE'),(746,'ROLE_MOD_TAB_ADMINPSDISTRIBUTIONAPICLIENT_READ'),(747,'ROLE_MOD_TAB_ADMINPSDISTRIBUTIONAPICLIENT_UPDATE'),(761,'ROLE_MOD_TAB_ADMINPSFACEBOOKMODULE_CREATE'),(764,'ROLE_MOD_TAB_ADMINPSFACEBOOKMODULE_DELETE'),(762,'ROLE_MOD_TAB_ADMINPSFACEBOOKMODULE_READ'),(763,'ROLE_MOD_TAB_ADMINPSFACEBOOKMODULE_UPDATE'),(817,'ROLE_MOD_TAB_ADMINPSMBOMODULEPARENT_CREATE'),(820,'ROLE_MOD_TAB_ADMINPSMBOMODULEPARENT_DELETE'),(818,'ROLE_MOD_TAB_ADMINPSMBOMODULEPARENT_READ'),(819,'ROLE_MOD_TAB_ADMINPSMBOMODULEPARENT_UPDATE'),(821,'ROLE_MOD_TAB_ADMINPSMBOMODULE_CREATE'),(824,'ROLE_MOD_TAB_ADMINPSMBOMODULE_DELETE'),(822,'ROLE_MOD_TAB_ADMINPSMBOMODULE_READ'),(823,'ROLE_MOD_TAB_ADMINPSMBOMODULE_UPDATE'),(829,'ROLE_MOD_TAB_ADMINPSMBORECOMMENDED_CREATE'),(832,'ROLE_MOD_TAB_ADMINPSMBORECOMMENDED_DELETE'),(830,'ROLE_MOD_TAB_ADMINPSMBORECOMMENDED_READ'),(831,'ROLE_MOD_TAB_ADMINPSMBORECOMMENDED_UPDATE'),(825,'ROLE_MOD_TAB_ADMINPSMBOSELECTION_CREATE'),(828,'ROLE_MOD_TAB_ADMINPSMBOSELECTION_DELETE'),(826,'ROLE_MOD_TAB_ADMINPSMBOSELECTION_READ'),(827,'ROLE_MOD_TAB_ADMINPSMBOSELECTION_UPDATE'),(833,'ROLE_MOD_TAB_ADMINPSMBOTHEME_CREATE'),(836,'ROLE_MOD_TAB_ADMINPSMBOTHEME_DELETE'),(834,'ROLE_MOD_TAB_ADMINPSMBOTHEME_READ'),(835,'ROLE_MOD_TAB_ADMINPSMBOTHEME_UPDATE'),(857,'ROLE_MOD_TAB_ADMINPSONEPAGECHECKOUT_CREATE'),(860,'ROLE_MOD_TAB_ADMINPSONEPAGECHECKOUT_DELETE'),(858,'ROLE_MOD_TAB_ADMINPSONEPAGECHECKOUT_READ'),(859,'ROLE_MOD_TAB_ADMINPSONEPAGECHECKOUT_UPDATE'),(897,'ROLE_MOD_TAB_ADMINPSTHEMECUSTOADVANCED_CREATE'),(900,'ROLE_MOD_TAB_ADMINPSTHEMECUSTOADVANCED_DELETE'),(898,'ROLE_MOD_TAB_ADMINPSTHEMECUSTOADVANCED_READ'),(899,'ROLE_MOD_TAB_ADMINPSTHEMECUSTOADVANCED_UPDATE'),(893,'ROLE_MOD_TAB_ADMINPSTHEMECUSTOCONFIGURATION_CREATE'),(896,'ROLE_MOD_TAB_ADMINPSTHEMECUSTOCONFIGURATION_DELETE'),(894,'ROLE_MOD_TAB_ADMINPSTHEMECUSTOCONFIGURATION_READ'),(895,'ROLE_MOD_TAB_ADMINPSTHEMECUSTOCONFIGURATION_UPDATE'),(637,'ROLE_MOD_TAB_ADMINPSXMKTGWITHGOOGLEMODULE_CREATE'),(640,'ROLE_MOD_TAB_ADMINPSXMKTGWITHGOOGLEMODULE_DELETE'),(638,'ROLE_MOD_TAB_ADMINPSXMKTGWITHGOOGLEMODULE_READ'),(639,'ROLE_MOD_TAB_ADMINPSXMKTGWITHGOOGLEMODULE_UPDATE'),(325,'ROLE_MOD_TAB_ADMINQUICKACCESSES_CREATE'),(328,'ROLE_MOD_TAB_ADMINQUICKACCESSES_DELETE'),(326,'ROLE_MOD_TAB_ADMINQUICKACCESSES_READ'),(327,'ROLE_MOD_TAB_ADMINQUICKACCESSES_UPDATE'),(329,'ROLE_MOD_TAB_ADMINREQUESTSQL_CREATE'),(332,'ROLE_MOD_TAB_ADMINREQUESTSQL_DELETE'),(330,'ROLE_MOD_TAB_ADMINREQUESTSQL_READ'),(331,'ROLE_MOD_TAB_ADMINREQUESTSQL_UPDATE'),(333,'ROLE_MOD_TAB_ADMINRETURN_CREATE'),(336,'ROLE_MOD_TAB_ADMINRETURN_DELETE'),(334,'ROLE_MOD_TAB_ADMINRETURN_READ'),(335,'ROLE_MOD_TAB_ADMINRETURN_UPDATE'),(337,'ROLE_MOD_TAB_ADMINSEARCHCONF_CREATE'),(340,'ROLE_MOD_TAB_ADMINSEARCHCONF_DELETE'),(338,'ROLE_MOD_TAB_ADMINSEARCHCONF_READ'),(339,'ROLE_MOD_TAB_ADMINSEARCHCONF_UPDATE'),(341,'ROLE_MOD_TAB_ADMINSEARCHENGINES_CREATE'),(344,'ROLE_MOD_TAB_ADMINSEARCHENGINES_DELETE'),(342,'ROLE_MOD_TAB_ADMINSEARCHENGINES_READ'),(343,'ROLE_MOD_TAB_ADMINSEARCHENGINES_UPDATE'),(469,'ROLE_MOD_TAB_ADMINSECURITYSESSIONCUSTOMER_CREATE'),(472,'ROLE_MOD_TAB_ADMINSECURITYSESSIONCUSTOMER_DELETE'),(470,'ROLE_MOD_TAB_ADMINSECURITYSESSIONCUSTOMER_READ'),(471,'ROLE_MOD_TAB_ADMINSECURITYSESSIONCUSTOMER_UPDATE'),(465,'ROLE_MOD_TAB_ADMINSECURITYSESSIONEMPLOYEE_CREATE'),(468,'ROLE_MOD_TAB_ADMINSECURITYSESSIONEMPLOYEE_DELETE'),(466,'ROLE_MOD_TAB_ADMINSECURITYSESSIONEMPLOYEE_READ'),(467,'ROLE_MOD_TAB_ADMINSECURITYSESSIONEMPLOYEE_UPDATE'),(461,'ROLE_MOD_TAB_ADMINSECURITY_CREATE'),(464,'ROLE_MOD_TAB_ADMINSECURITY_DELETE'),(462,'ROLE_MOD_TAB_ADMINSECURITY_READ'),(463,'ROLE_MOD_TAB_ADMINSECURITY_UPDATE'),(345,'ROLE_MOD_TAB_ADMINSHIPPING_CREATE'),(348,'ROLE_MOD_TAB_ADMINSHIPPING_DELETE'),(346,'ROLE_MOD_TAB_ADMINSHIPPING_READ'),(347,'ROLE_MOD_TAB_ADMINSHIPPING_UPDATE'),(349,'ROLE_MOD_TAB_ADMINSHOPGROUP_CREATE'),(352,'ROLE_MOD_TAB_ADMINSHOPGROUP_DELETE'),(350,'ROLE_MOD_TAB_ADMINSHOPGROUP_READ'),(351,'ROLE_MOD_TAB_ADMINSHOPGROUP_UPDATE'),(353,'ROLE_MOD_TAB_ADMINSHOPURL_CREATE'),(356,'ROLE_MOD_TAB_ADMINSHOPURL_DELETE'),(354,'ROLE_MOD_TAB_ADMINSHOPURL_READ'),(355,'ROLE_MOD_TAB_ADMINSHOPURL_UPDATE'),(357,'ROLE_MOD_TAB_ADMINSLIP_CREATE'),(360,'ROLE_MOD_TAB_ADMINSLIP_DELETE'),(358,'ROLE_MOD_TAB_ADMINSLIP_READ'),(359,'ROLE_MOD_TAB_ADMINSLIP_UPDATE'),(361,'ROLE_MOD_TAB_ADMINSPECIFICPRICERULE_CREATE'),(364,'ROLE_MOD_TAB_ADMINSPECIFICPRICERULE_DELETE'),(362,'ROLE_MOD_TAB_ADMINSPECIFICPRICERULE_READ'),(363,'ROLE_MOD_TAB_ADMINSPECIFICPRICERULE_UPDATE'),(365,'ROLE_MOD_TAB_ADMINSTATES_CREATE'),(368,'ROLE_MOD_TAB_ADMINSTATES_DELETE'),(366,'ROLE_MOD_TAB_ADMINSTATES_READ'),(367,'ROLE_MOD_TAB_ADMINSTATES_UPDATE'),(369,'ROLE_MOD_TAB_ADMINSTATS_CREATE'),(372,'ROLE_MOD_TAB_ADMINSTATS_DELETE'),(370,'ROLE_MOD_TAB_ADMINSTATS_READ'),(371,'ROLE_MOD_TAB_ADMINSTATS_UPDATE'),(373,'ROLE_MOD_TAB_ADMINSTATUSES_CREATE'),(376,'ROLE_MOD_TAB_ADMINSTATUSES_DELETE'),(374,'ROLE_MOD_TAB_ADMINSTATUSES_READ'),(375,'ROLE_MOD_TAB_ADMINSTATUSES_UPDATE'),(377,'ROLE_MOD_TAB_ADMINSTOCKMANAGEMENT_CREATE'),(380,'ROLE_MOD_TAB_ADMINSTOCKMANAGEMENT_DELETE'),(378,'ROLE_MOD_TAB_ADMINSTOCKMANAGEMENT_READ'),(379,'ROLE_MOD_TAB_ADMINSTOCKMANAGEMENT_UPDATE'),(381,'ROLE_MOD_TAB_ADMINSTORES_CREATE'),(384,'ROLE_MOD_TAB_ADMINSTORES_DELETE'),(382,'ROLE_MOD_TAB_ADMINSTORES_READ'),(383,'ROLE_MOD_TAB_ADMINSTORES_UPDATE'),(385,'ROLE_MOD_TAB_ADMINSUPPLIERS_CREATE'),(388,'ROLE_MOD_TAB_ADMINSUPPLIERS_DELETE'),(386,'ROLE_MOD_TAB_ADMINSUPPLIERS_READ'),(387,'ROLE_MOD_TAB_ADMINSUPPLIERS_UPDATE'),(389,'ROLE_MOD_TAB_ADMINTAGS_CREATE'),(392,'ROLE_MOD_TAB_ADMINTAGS_DELETE'),(390,'ROLE_MOD_TAB_ADMINTAGS_READ'),(391,'ROLE_MOD_TAB_ADMINTAGS_UPDATE'),(393,'ROLE_MOD_TAB_ADMINTAXES_CREATE'),(396,'ROLE_MOD_TAB_ADMINTAXES_DELETE'),(394,'ROLE_MOD_TAB_ADMINTAXES_READ'),(395,'ROLE_MOD_TAB_ADMINTAXES_UPDATE'),(397,'ROLE_MOD_TAB_ADMINTAXRULESGROUP_CREATE'),(400,'ROLE_MOD_TAB_ADMINTAXRULESGROUP_DELETE'),(398,'ROLE_MOD_TAB_ADMINTAXRULESGROUP_READ'),(399,'ROLE_MOD_TAB_ADMINTAXRULESGROUP_UPDATE'),(889,'ROLE_MOD_TAB_ADMINTHEMESPARENT_CREATE'),(892,'ROLE_MOD_TAB_ADMINTHEMESPARENT_DELETE'),(890,'ROLE_MOD_TAB_ADMINTHEMESPARENT_READ'),(891,'ROLE_MOD_TAB_ADMINTHEMESPARENT_UPDATE'),(401,'ROLE_MOD_TAB_ADMINTHEMES_CREATE'),(404,'ROLE_MOD_TAB_ADMINTHEMES_DELETE'),(402,'ROLE_MOD_TAB_ADMINTHEMES_READ'),(403,'ROLE_MOD_TAB_ADMINTHEMES_UPDATE'),(405,'ROLE_MOD_TAB_ADMINTRACKING_CREATE'),(408,'ROLE_MOD_TAB_ADMINTRACKING_DELETE'),(406,'ROLE_MOD_TAB_ADMINTRACKING_READ'),(407,'ROLE_MOD_TAB_ADMINTRACKING_UPDATE'),(409,'ROLE_MOD_TAB_ADMINTRANSLATIONS_CREATE'),(412,'ROLE_MOD_TAB_ADMINTRANSLATIONS_DELETE'),(410,'ROLE_MOD_TAB_ADMINTRANSLATIONS_READ'),(411,'ROLE_MOD_TAB_ADMINTRANSLATIONS_UPDATE'),(413,'ROLE_MOD_TAB_ADMINWEBSERVICE_CREATE'),(416,'ROLE_MOD_TAB_ADMINWEBSERVICE_DELETE'),(414,'ROLE_MOD_TAB_ADMINWEBSERVICE_READ'),(415,'ROLE_MOD_TAB_ADMINWEBSERVICE_UPDATE'),(421,'ROLE_MOD_TAB_ADMINZONES_CREATE'),(424,'ROLE_MOD_TAB_ADMINZONES_DELETE'),(422,'ROLE_MOD_TAB_ADMINZONES_READ'),(423,'ROLE_MOD_TAB_ADMINZONES_UPDATE'),(425,'ROLE_MOD_TAB_CONFIGURE_CREATE'),(428,'ROLE_MOD_TAB_CONFIGURE_DELETE'),(426,'ROLE_MOD_TAB_CONFIGURE_READ'),(427,'ROLE_MOD_TAB_CONFIGURE_UPDATE'),(478,'ROLE_MOD_TAB_DEFAULT_CREATE'),(480,'ROLE_MOD_TAB_DEFAULT_DELETE'),(477,'ROLE_MOD_TAB_DEFAULT_READ'),(479,'ROLE_MOD_TAB_DEFAULT_UPDATE'),(693,'ROLE_MOD_TAB_HOME_CREATE'),(696,'ROLE_MOD_TAB_HOME_DELETE'),(694,'ROLE_MOD_TAB_HOME_READ'),(695,'ROLE_MOD_TAB_HOME_UPDATE'),(429,'ROLE_MOD_TAB_IMPROVE_CREATE'),(432,'ROLE_MOD_TAB_IMPROVE_DELETE'),(430,'ROLE_MOD_TAB_IMPROVE_READ'),(431,'ROLE_MOD_TAB_IMPROVE_UPDATE'),(633,'ROLE_MOD_TAB_MARKETING_CREATE'),(636,'ROLE_MOD_TAB_MARKETING_DELETE'),(634,'ROLE_MOD_TAB_MARKETING_READ'),(635,'ROLE_MOD_TAB_MARKETING_UPDATE'),(613,'ROLE_MOD_TAB_PSSHIPPINGCARRIERCONTROLLER_CREATE'),(616,'ROLE_MOD_TAB_PSSHIPPINGCARRIERCONTROLLER_DELETE'),(614,'ROLE_MOD_TAB_PSSHIPPINGCARRIERCONTROLLER_READ'),(615,'ROLE_MOD_TAB_PSSHIPPINGCARRIERCONTROLLER_UPDATE'),(617,'ROLE_MOD_TAB_PSSHIPPINGCONFIGURATIONCONTROLLER_CREATE'),(620,'ROLE_MOD_TAB_PSSHIPPINGCONFIGURATIONCONTROLLER_DELETE'),(618,'ROLE_MOD_TAB_PSSHIPPINGCONFIGURATIONCONTROLLER_READ'),(619,'ROLE_MOD_TAB_PSSHIPPINGCONFIGURATIONCONTROLLER_UPDATE'),(629,'ROLE_MOD_TAB_PSSHIPPINGFAQCONTROLLER_CREATE'),(632,'ROLE_MOD_TAB_PSSHIPPINGFAQCONTROLLER_DELETE'),(630,'ROLE_MOD_TAB_PSSHIPPINGFAQCONTROLLER_READ'),(631,'ROLE_MOD_TAB_PSSHIPPINGFAQCONTROLLER_UPDATE'),(609,'ROLE_MOD_TAB_PSSHIPPINGHOMECONTROLLER_CREATE'),(612,'ROLE_MOD_TAB_PSSHIPPINGHOMECONTROLLER_DELETE'),(610,'ROLE_MOD_TAB_PSSHIPPINGHOMECONTROLLER_READ'),(611,'ROLE_MOD_TAB_PSSHIPPINGHOMECONTROLLER_UPDATE'),(621,'ROLE_MOD_TAB_PSSHIPPINGKEYCLOAKAUTHCONTROLLER_CREATE'),(624,'ROLE_MOD_TAB_PSSHIPPINGKEYCLOAKAUTHCONTROLLER_DELETE'),(622,'ROLE_MOD_TAB_PSSHIPPINGKEYCLOAKAUTHCONTROLLER_READ'),(623,'ROLE_MOD_TAB_PSSHIPPINGKEYCLOAKAUTHCONTROLLER_UPDATE'),(625,'ROLE_MOD_TAB_PSSHIPPINGORDERSCONTROLLER_CREATE'),(628,'ROLE_MOD_TAB_PSSHIPPINGORDERSCONTROLLER_DELETE'),(626,'ROLE_MOD_TAB_PSSHIPPINGORDERSCONTROLLER_READ'),(627,'ROLE_MOD_TAB_PSSHIPPINGORDERSCONTROLLER_UPDATE'),(433,'ROLE_MOD_TAB_SELL_CREATE'),(436,'ROLE_MOD_TAB_SELL_DELETE'),(434,'ROLE_MOD_TAB_SELL_READ'),(435,'ROLE_MOD_TAB_SELL_UPDATE'),(581,'ROLE_MOD_TAB_SFADMINLOGINPSACCOUNTS_CREATE'),(584,'ROLE_MOD_TAB_SFADMINLOGINPSACCOUNTS_DELETE'),(582,'ROLE_MOD_TAB_SFADMINLOGINPSACCOUNTS_READ'),(583,'ROLE_MOD_TAB_SFADMINLOGINPSACCOUNTS_UPDATE'),(577,'ROLE_MOD_TAB_SFADMINOAUTH2PSACCOUNTS_CREATE'),(580,'ROLE_MOD_TAB_SFADMINOAUTH2PSACCOUNTS_DELETE'),(578,'ROLE_MOD_TAB_SFADMINOAUTH2PSACCOUNTS_READ'),(579,'ROLE_MOD_TAB_SFADMINOAUTH2PSACCOUNTS_UPDATE'),(437,'ROLE_MOD_TAB_SHOPPARAMETERS_CREATE'),(440,'ROLE_MOD_TAB_SHOPPARAMETERS_DELETE'),(438,'ROLE_MOD_TAB_SHOPPARAMETERS_READ'),(439,'ROLE_MOD_TAB_SHOPPARAMETERS_UPDATE'),(493,'ROLE_MOD_TAB_WISHLISTCONFIGURATIONADMINCONTROLLER_CREATE'),(496,'ROLE_MOD_TAB_WISHLISTCONFIGURATIONADMINCONTROLLER_DELETE'),(494,'ROLE_MOD_TAB_WISHLISTCONFIGURATIONADMINCONTROLLER_READ'),(495,'ROLE_MOD_TAB_WISHLISTCONFIGURATIONADMINCONTROLLER_UPDATE'),(489,'ROLE_MOD_TAB_WISHLISTCONFIGURATIONADMINPARENTCONTROLLER_CREATE'),(492,'ROLE_MOD_TAB_WISHLISTCONFIGURATIONADMINPARENTCONTROLLER_DELETE'),(490,'ROLE_MOD_TAB_WISHLISTCONFIGURATIONADMINPARENTCONTROLLER_READ'),(491,'ROLE_MOD_TAB_WISHLISTCONFIGURATIONADMINPARENTCONTROLLER_UPDATE'),(497,'ROLE_MOD_TAB_WISHLISTSTATISTICSADMINCONTROLLER_CREATE'),(500,'ROLE_MOD_TAB_WISHLISTSTATISTICSADMINCONTROLLER_DELETE'),(498,'ROLE_MOD_TAB_WISHLISTSTATISTICSADMINCONTROLLER_READ'),(499,'ROLE_MOD_TAB_WISHLISTSTATISTICSADMINCONTROLLER_UPDATE');
/*!40000 ALTER TABLE `ubwbh_authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_b2b_role`
--

DROP TABLE IF EXISTS `ubwbh_b2b_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_b2b_role` (
  `id_role` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(64) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `uniq_b2b_role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_b2b_role`
--

LOCK TABLES `ubwbh_b2b_role` WRITE;
/*!40000 ALTER TABLE `ubwbh_b2b_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_b2b_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_b2b_role_authorization_role`
--

DROP TABLE IF EXISTS `ubwbh_b2b_role_authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_b2b_role_authorization_role` (
  `id_role` int(10) unsigned NOT NULL,
  `id_authorization_role` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_role`,`id_authorization_role`),
  KEY `b2b_role_authorization_role_role_idx` (`id_role`),
  KEY `b2b_role_authorization_role_auth_role_idx` (`id_authorization_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_b2b_role_authorization_role`
--

LOCK TABLES `ubwbh_b2b_role_authorization_role` WRITE;
/*!40000 ALTER TABLE `ubwbh_b2b_role_authorization_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_b2b_role_authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_blockwishlist_statistics`
--

DROP TABLE IF EXISTS `ubwbh_blockwishlist_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_blockwishlist_statistics` (
  `id_statistics` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `id_shop` int(10) unsigned DEFAULT 1,
  PRIMARY KEY (`id_statistics`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_blockwishlist_statistics`
--

LOCK TABLES `ubwbh_blockwishlist_statistics` WRITE;
/*!40000 ALTER TABLE `ubwbh_blockwishlist_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_blockwishlist_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_business_entity`
--

DROP TABLE IF EXISTS `ubwbh_business_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_business_entity` (
  `id_business_entity` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  `id_customer_group` int(10) unsigned NOT NULL,
  `external_ref` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `legal_name` varchar(255) DEFAULT NULL,
  `delivery_authorized` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('pending','active','inactive','rejected') NOT NULL DEFAULT 'pending',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_business_entity`),
  KEY `business_entity_shop_idx` (`id_shop`),
  KEY `business_entity_customer_group_idx` (`id_customer_group`),
  KEY `business_entity_external_ref_idx` (`external_ref`),
  KEY `business_entity_deleted_idx` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_business_entity`
--

LOCK TABLES `ubwbh_business_entity` WRITE;
/*!40000 ALTER TABLE `ubwbh_business_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_business_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_business_entity_address`
--

DROP TABLE IF EXISTS `ubwbh_business_entity_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_business_entity_address` (
  `id_business_entity_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_business_entity` int(10) unsigned NOT NULL,
  `id_address` int(10) unsigned NOT NULL,
  `address_type` enum('both','invoice','delivery') NOT NULL DEFAULT 'both',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_business_entity_address`),
  UNIQUE KEY `uniq_be_address` (`id_business_entity`,`id_address`,`address_type`),
  KEY `business_entity_address_be_idx` (`id_business_entity`),
  KEY `business_entity_address_address_idx` (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_business_entity_address`
--

LOCK TABLES `ubwbh_business_entity_address` WRITE;
/*!40000 ALTER TABLE `ubwbh_business_entity_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_business_entity_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_business_entity_customer_b2b`
--

DROP TABLE IF EXISTS `ubwbh_business_entity_customer_b2b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_business_entity_customer_b2b` (
  `id_business_entity_customer_b2b` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_business_entity` int(10) unsigned NOT NULL,
  `id_customer_b2b` int(10) unsigned NOT NULL,
  `id_role` int(10) unsigned NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_business_entity_customer_b2b`),
  UNIQUE KEY `uniq_be_customer` (`id_business_entity`,`id_customer_b2b`),
  KEY `business_entity_customer_b2b_be_idx` (`id_business_entity`),
  KEY `business_entity_customer_b2b_customer_idx` (`id_customer_b2b`),
  KEY `business_entity_customer_b2b_role_idx` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_business_entity_customer_b2b`
--

LOCK TABLES `ubwbh_business_entity_customer_b2b` WRITE;
/*!40000 ALTER TABLE `ubwbh_business_entity_customer_b2b` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_business_entity_customer_b2b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_business_entity_identifier`
--

DROP TABLE IF EXISTS `ubwbh_business_entity_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_business_entity_identifier` (
  `id_identifier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_business_entity` int(10) unsigned NOT NULL,
  `id_business_identifier` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_identifier`),
  UNIQUE KEY `uniq_business_entity_identifier` (`id_business_entity`,`id_business_identifier`),
  KEY `business_entity_identifier_id_business_entity_idx` (`id_business_entity`),
  KEY `business_entity_identifier_id_business_identifier_idx` (`id_business_identifier`),
  KEY `business_entity_identifier_value_idx` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_business_entity_identifier`
--

LOCK TABLES `ubwbh_business_entity_identifier` WRITE;
/*!40000 ALTER TABLE `ubwbh_business_entity_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_business_entity_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_business_identifier`
--

DROP TABLE IF EXISTS `ubwbh_business_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_business_identifier` (
  `id_business_identifier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `unremovable` tinyint(1) NOT NULL DEFAULT 0,
  `id_zone` int(10) unsigned DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_business_identifier`),
  KEY `business_identifier_zone_idx` (`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_business_identifier`
--

LOCK TABLES `ubwbh_business_identifier` WRITE;
/*!40000 ALTER TABLE `ubwbh_business_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_business_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_carrier`
--

DROP TABLE IF EXISTS `ubwbh_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_carrier` (
  `id_carrier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_reference` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `shipping_handling` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `range_behavior` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `is_module` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `shipping_external` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `need_range` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `external_module_name` varchar(64) DEFAULT NULL,
  `shipping_method` int(2) NOT NULL DEFAULT 0,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `max_width` int(10) DEFAULT 0,
  `max_height` int(10) DEFAULT 0,
  `max_depth` int(10) DEFAULT 0,
  `max_weight` decimal(20,6) DEFAULT 0.000000,
  `grade` int(10) DEFAULT 0,
  PRIMARY KEY (`id_carrier`),
  KEY `deleted` (`deleted`,`active`),
  KEY `reference` (`id_reference`,`deleted`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_carrier`
--

LOCK TABLES `ubwbh_carrier` WRITE;
/*!40000 ALTER TABLE `ubwbh_carrier` DISABLE KEYS */;
INSERT INTO `ubwbh_carrier` VALUES (1,1,'Click and collect','',1,0,0,0,0,1,0,0,'',2,0,0,0,0,0.000000,0),(2,2,'My carrier','',1,0,1,0,0,0,0,0,'',1,1,0,0,0,0.000000,0),(3,3,'My cheap carrier','',0,0,1,0,0,0,0,0,'',2,2,0,0,0,0.000000,0),(4,4,'My light carrier','',0,0,1,0,0,0,0,0,'',1,3,0,0,0,0.000000,0);
/*!40000 ALTER TABLE `ubwbh_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_carrier_group`
--

DROP TABLE IF EXISTS `ubwbh_carrier_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_carrier_group` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_carrier_group`
--

LOCK TABLES `ubwbh_carrier_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_carrier_group` DISABLE KEYS */;
INSERT INTO `ubwbh_carrier_group` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3);
/*!40000 ALTER TABLE `ubwbh_carrier_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_carrier_lang`
--

DROP TABLE IF EXISTS `ubwbh_carrier_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_carrier_lang` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_lang` int(10) unsigned NOT NULL,
  `delay` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_lang`,`id_shop`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_carrier_lang`
--

LOCK TABLES `ubwbh_carrier_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_carrier_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_carrier_lang` VALUES (1,1,1,'Pick up in-store'),(2,1,1,'Delivery next day!'),(3,1,1,'Buy more to pay less!'),(4,1,1,'The lighter the cheaper!'),(1,1,2,'Ambil di toko'),(2,1,2,'Kirim esok hari!'),(3,1,2,'Buy more to pay less!'),(4,1,2,'The lighter the cheaper!');
/*!40000 ALTER TABLE `ubwbh_carrier_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_carrier_shop`
--

DROP TABLE IF EXISTS `ubwbh_carrier_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_carrier_shop` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_carrier_shop`
--

LOCK TABLES `ubwbh_carrier_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_carrier_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_carrier_shop` VALUES (1,1),(2,1),(3,1),(4,1);
/*!40000 ALTER TABLE `ubwbh_carrier_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_carrier_tax_rules_group_shop`
--

DROP TABLE IF EXISTS `ubwbh_carrier_tax_rules_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_carrier_tax_rules_group_shop` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_tax_rules_group`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_carrier_tax_rules_group_shop`
--

LOCK TABLES `ubwbh_carrier_tax_rules_group_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_carrier_tax_rules_group_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_carrier_tax_rules_group_shop` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1);
/*!40000 ALTER TABLE `ubwbh_carrier_tax_rules_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_carrier_zone`
--

DROP TABLE IF EXISTS `ubwbh_carrier_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_carrier_zone` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_carrier_zone`
--

LOCK TABLES `ubwbh_carrier_zone` WRITE;
/*!40000 ALTER TABLE `ubwbh_carrier_zone` DISABLE KEYS */;
INSERT INTO `ubwbh_carrier_zone` VALUES (1,1),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2);
/*!40000 ALTER TABLE `ubwbh_carrier_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart`
--

DROP TABLE IF EXISTS `ubwbh_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart` (
  `id_cart` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT 1,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_carrier` int(10) unsigned NOT NULL,
  `delivery_option` mediumtext NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `gift` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gift_message` mediumtext DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT 0,
  `allow_seperated_package` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `checkout_session_data` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `cart_customer` (`id_customer`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_guest` (`id_guest`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop_2` (`id_shop`,`date_upd`),
  KEY `id_shop` (`id_shop`,`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart`
--

LOCK TABLES `ubwbh_cart` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart` DISABLE KEYS */;
INSERT INTO `ubwbh_cart` VALUES (1,1,1,2,'{\"3\":\"2,\"}',1,5,5,1,2,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2026-11-23 15:08:47','2026-11-23 15:08:47',NULL),(2,1,1,2,'{\"3\":\"2,\"}',1,5,5,1,2,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2026-11-23 15:08:47','2026-11-23 15:08:47',NULL),(3,1,1,2,'{\"3\":\"2,\"}',1,5,5,1,2,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2026-11-23 15:08:47','2026-11-23 15:08:47',NULL),(4,1,1,2,'{\"3\":\"2,\"}',1,5,5,1,2,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2026-11-23 15:08:47','2026-11-23 15:08:47',NULL),(5,1,1,2,'{\"3\":\"2,\"}',1,5,5,1,2,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2026-11-23 15:08:47','2026-11-23 15:08:47',NULL);
/*!40000 ALTER TABLE `ubwbh_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_cart_rule`
--

DROP TABLE IF EXISTS `ubwbh_cart_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_cart_rule` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_cart_rule` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart`,`id_cart_rule`),
  KEY `id_cart_rule` (`id_cart_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_cart_rule`
--

LOCK TABLES `ubwbh_cart_cart_rule` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_cart_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_product`
--

DROP TABLE IF EXISTS `ubwbh_cart_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_product` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL DEFAULT 0,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  `id_product_attribute` int(10) unsigned NOT NULL DEFAULT 0,
  `id_customization` int(10) unsigned NOT NULL DEFAULT 0,
  `quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_cart`,`id_product`,`id_product_attribute`,`id_customization`,`id_address_delivery`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_cart_order` (`id_cart`,`date_add`,`id_product`,`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_product`
--

LOCK TABLES `ubwbh_cart_product` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_product` DISABLE KEYS */;
INSERT INTO `ubwbh_cart_product` VALUES (1,1,3,1,1,0,1,'0000-00-00 00:00:00'),(1,2,3,1,9,0,1,'0000-00-00 00:00:00'),(2,4,3,1,18,0,1,'0000-00-00 00:00:00'),(2,8,3,1,0,0,1,'0000-00-00 00:00:00'),(3,16,3,1,28,0,1,'0000-00-00 00:00:00'),(4,16,3,1,29,0,1,'0000-00-00 00:00:00'),(5,10,3,1,25,0,1,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ubwbh_cart_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule` (
  `id_cart_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL DEFAULT 0,
  `date_from` datetime NOT NULL,
  `date_to` datetime DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT 0,
  `quantity_per_user` int(10) unsigned DEFAULT 0,
  `priority` int(10) unsigned NOT NULL DEFAULT 1,
  `partial_use` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `code` varchar(254) NOT NULL,
  `minimum_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `minimum_amount_tax` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_amount_currency` int(10) unsigned NOT NULL DEFAULT 0,
  `minimum_amount_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `country_restriction` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `carrier_restriction` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `group_restriction` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `cart_rule_restriction` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `product_restriction` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `shop_restriction` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `reduction_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `reduction_tax` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `reduction_currency` int(10) unsigned NOT NULL DEFAULT 0,
  `reduction_product` int(10) NOT NULL DEFAULT 0,
  `reduction_exclude_special` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gift_product` int(10) unsigned NOT NULL DEFAULT 0,
  `gift_product_attribute` int(10) unsigned NOT NULL DEFAULT 0,
  `highlight` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `id_cart_rule_type` int(10) unsigned DEFAULT NULL,
  `minimum_product_quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `total_quantity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_cart_rule`),
  KEY `id_customer` (`id_customer`,`active`,`date_to`),
  KEY `group_restriction` (`group_restriction`,`active`,`date_to`),
  KEY `id_customer_2` (`id_customer`,`active`,`highlight`,`date_to`),
  KEY `group_restriction_2` (`group_restriction`,`active`,`highlight`,`date_to`),
  KEY `date_from` (`date_from`),
  KEY `date_to` (`date_to`),
  KEY `id_cart_rule_type` (`id_cart_rule_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule`
--

LOCK TABLES `ubwbh_cart_rule` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_carrier`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_carrier` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_carrier` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_carrier`
--

LOCK TABLES `ubwbh_cart_rule_carrier` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_combination`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_combination` (
  `id_cart_rule_1` int(10) unsigned NOT NULL,
  `id_cart_rule_2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule_1`,`id_cart_rule_2`),
  KEY `id_cart_rule_1` (`id_cart_rule_1`),
  KEY `id_cart_rule_2` (`id_cart_rule_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_combination`
--

LOCK TABLES `ubwbh_cart_rule_combination` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_compatible_types`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_compatible_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_compatible_types` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_cart_rule_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_cart_rule_type`),
  KEY `id_cart_rule` (`id_cart_rule`),
  KEY `id_cart_rule_type` (`id_cart_rule_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_compatible_types`
--

LOCK TABLES `ubwbh_cart_rule_compatible_types` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_compatible_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_compatible_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_country`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_country` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_country`
--

LOCK TABLES `ubwbh_cart_rule_country` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_group`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_group` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_group`
--

LOCK TABLES `ubwbh_cart_rule_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_lang`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_lang` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_lang`
--

LOCK TABLES `ubwbh_cart_rule_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_product_rule`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_product_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_product_rule` (
  `id_product_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_rule_group` int(10) unsigned NOT NULL,
  `type` enum('products','categories','attributes','manufacturers','suppliers','combinations','features') NOT NULL,
  PRIMARY KEY (`id_product_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_product_rule`
--

LOCK TABLES `ubwbh_cart_rule_product_rule` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_product_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_product_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_product_rule_group`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_product_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_product_rule_group` (
  `id_product_rule_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart_rule` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `type` enum('at_least_one_product_rule','all_product_rules') NOT NULL DEFAULT 'at_least_one_product_rule',
  PRIMARY KEY (`id_product_rule_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_product_rule_group`
--

LOCK TABLES `ubwbh_cart_rule_product_rule_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_product_rule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_product_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_product_rule_value`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_product_rule_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_product_rule_value` (
  `id_product_rule` int(10) unsigned NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_rule`,`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_product_rule_value`
--

LOCK TABLES `ubwbh_cart_rule_product_rule_value` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_product_rule_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_product_rule_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_shop`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_shop` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_shop`
--

LOCK TABLES `ubwbh_cart_rule_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cart_rule_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_type`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_type` (
  `id_cart_rule_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_type` varchar(128) NOT NULL,
  `is_core` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart_rule_type`),
  UNIQUE KEY `discount_type` (`discount_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_type`
--

LOCK TABLES `ubwbh_cart_rule_type` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_type` DISABLE KEYS */;
INSERT INTO `ubwbh_cart_rule_type` VALUES (1,'free_shipping',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'cart_level',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'order_level',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'product_level',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'free_gift',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ubwbh_cart_rule_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cart_rule_type_lang`
--

DROP TABLE IF EXISTS `ubwbh_cart_rule_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cart_rule_type_lang` (
  `id_cart_rule_type` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id_cart_rule_type`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cart_rule_type_lang`
--

LOCK TABLES `ubwbh_cart_rule_type_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_cart_rule_type_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_cart_rule_type_lang` VALUES (1,1,'On free shipping','Discount that provides free shipping to the order'),(1,2,'On free shipping','Discount that provides free shipping to the order'),(2,1,'On cart amount','Discount applied to cart'),(2,2,'On cart amount','Discount applied to cart'),(3,1,'On total order','Discount applied to the order'),(3,2,'On total order','Discount applied to the order'),(4,1,'On catalog products','Discount applied to specific products'),(4,2,'On catalog products','Discount applied to specific products'),(5,1,'On free gift','Discount that provides a free gift product'),(5,2,'On free gift','Discount that provides a free gift product'),(6,1,'On free shipping','Discount that provides free shipping to the order'),(6,2,'On free shipping','Discount that provides free shipping to the order'),(7,1,'On cart amount','Discount applied to cart'),(7,2,'On cart amount','Discount applied to cart'),(8,1,'On total order','Discount applied to the order'),(8,2,'On total order','Discount applied to the order'),(9,1,'On catalog products','Discount applied to specific products'),(9,2,'On catalog products','Discount applied to specific products'),(10,1,'On free gift','Discount that provides a free gift product'),(10,2,'On free gift','Discount that provides a free gift product');
/*!40000 ALTER TABLE `ubwbh_cart_rule_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_category`
--

DROP TABLE IF EXISTS `ubwbh_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT 1,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nleft` int(10) unsigned NOT NULL DEFAULT 0,
  `nright` int(10) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `redirect_type` enum('404','410','301','302') NOT NULL DEFAULT '301',
  `id_type_redirected` int(10) unsigned NOT NULL DEFAULT 0,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `is_root_category` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`),
  KEY `nleftrightactive` (`nleft`,`nright`,`active`),
  KEY `level_depth` (`level_depth`),
  KEY `nright` (`nright`),
  KEY `activenleft` (`active`,`nleft`),
  KEY `activenright` (`active`,`nright`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_category`
--

LOCK TABLES `ubwbh_category` WRITE;
/*!40000 ALTER TABLE `ubwbh_category` DISABLE KEYS */;
INSERT INTO `ubwbh_category` VALUES (1,0,1,0,1,18,1,'2026-11-23 15:01:16','2026-11-23 15:01:16','404',0,0,0),(2,1,1,1,2,17,1,'2026-11-23 15:01:16','2026-11-23 15:01:16','404',0,0,1),(3,2,1,2,3,8,1,'2026-11-23 15:08:47','2026-11-23 15:08:47','301',0,0,0),(4,3,1,3,4,5,1,'2026-11-23 15:08:47','2026-11-23 15:08:47','301',0,0,0),(5,3,1,3,6,7,1,'2026-11-23 15:08:47','2026-11-23 15:08:47','301',0,1,0),(6,2,1,2,9,14,1,'2026-11-23 15:08:47','2026-11-23 15:08:47','301',0,1,0),(7,6,1,3,10,11,1,'2026-11-23 15:08:47','2026-11-23 15:08:47','301',0,0,0),(8,6,1,3,12,13,1,'2026-11-23 15:08:47','2026-11-23 15:08:47','301',0,1,0),(9,2,1,2,15,16,1,'2026-11-23 15:08:47','2026-11-23 15:08:47','301',0,2,0);
/*!40000 ALTER TABLE `ubwbh_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_category_group`
--

DROP TABLE IF EXISTS `ubwbh_category_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_category_group` (
  `id_category` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_group`),
  KEY `id_category` (`id_category`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_category_group`
--

LOCK TABLES `ubwbh_category_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_category_group` DISABLE KEYS */;
INSERT INTO `ubwbh_category_group` VALUES (1,1),(1,2),(1,3),(2,0),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,1),(6,2),(6,3),(7,1),(7,2),(7,3),(8,1),(8,2),(8,3),(9,1),(9,2),(9,3);
/*!40000 ALTER TABLE `ubwbh_category_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_category_lang`
--

DROP TABLE IF EXISTS `ubwbh_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `additional_description` mediumtext DEFAULT NULL,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_category`,`id_shop`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_category_lang`
--

LOCK TABLES `ubwbh_category_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_category_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_category_lang` VALUES (1,1,1,'Root','','','root','',''),(1,1,2,'Root','','','root','',''),(2,1,1,'Home','','','home','',''),(2,1,2,'Beranda','','','beranda','',''),(3,1,1,'Clothes','<p>Discover our favorites fashionable discoveries, a selection of cool items to integrate in your wardrobe. Compose a unique style with personality which matches your own.</p>','','clothes','',''),(3,1,2,'Clothes','<p>Discover our favorites fashionable discoveries, a selection of cool items to integrate in your wardrobe. Compose a unique style with personality which matches your own.</p>','','clothes','',''),(4,1,1,'Men','<p>T-shirts, sweaters, hoodies and men\'s accessories. From basics to original creations, for every style. </p>','','men','',''),(4,1,2,'Men','<p>T-shirts, sweaters, hoodies and men\'s accessories. From basics to original creations, for every style. </p>','','men','',''),(5,1,1,'Women','<p>T-shirts, sweaters, hoodies and women\'s accessories. From basics to original creations, for every style. </p>','','women','',''),(5,1,2,'Women','<p>T-shirts, sweaters, hoodies and women\'s accessories. From basics to original creations, for every style. </p>','','women','',''),(6,1,1,'Accessories','<p>Items and accessories for your desk, kitchen or living room. Make your house a home with our eye-catching designs. </p>','','accessories','',''),(6,1,2,'Aksesoris','<p>Items and accessories for your desk, kitchen or living room. Make your house a home with our eye-catching designs. </p>','','accessories','',''),(7,1,1,'Stationery','<p>Notebooks, agendas, office accessories and more. Everything you need to combine the pleasant and the useful, either at work or at home. </p>','','stationery','',''),(7,1,2,'Stationery','<p>Notebooks, agendas, office accessories and more. Everything you need to combine the pleasant and the useful, either at work or at home. </p>','','stationery','',''),(8,1,1,'Home Accessories','<p>Details matter! Liven up your interior with our selection of home accessories. </p>','','home-accessories','',''),(8,1,2,'Home Accessories','<p>Details matter! Liven up your interior with our selection of home accessories. </p>','','home-accessories','',''),(9,1,1,'Art','<p>Framed poster and vector images, all you need to give personality to your walls or bring your creative projects to life.</p>','','art','',''),(9,1,2,'Art','<p>Framed poster and vector images, all you need to give personality to your walls or bring your creative projects to life.</p>','','art','','');
/*!40000 ALTER TABLE `ubwbh_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_category_product`
--

DROP TABLE IF EXISTS `ubwbh_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_category`,`id_product`),
  KEY `id_product` (`id_product`),
  KEY `id_category` (`id_category`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_category_product`
--

LOCK TABLES `ubwbh_category_product` WRITE;
/*!40000 ALTER TABLE `ubwbh_category_product` DISABLE KEYS */;
INSERT INTO `ubwbh_category_product` VALUES (2,1,1),(2,2,2),(2,3,3),(2,4,4),(2,5,5),(2,6,6),(2,7,7),(2,8,8),(2,9,9),(2,10,10),(2,11,11),(2,12,12),(2,13,13),(2,14,14),(2,15,15),(2,16,16),(2,17,17),(2,18,18),(2,19,19),(3,1,1),(3,2,2),(4,1,1),(5,2,1),(6,7,1),(6,6,2),(6,8,3),(6,10,4),(6,9,5),(6,11,6),(6,15,7),(6,16,8),(6,17,9),(6,18,10),(6,19,11),(7,16,1),(7,17,2),(7,18,3),(8,6,1),(8,7,2),(8,8,3),(8,9,4),(8,10,5),(8,11,6),(8,15,7),(8,19,8),(9,3,1),(9,4,2),(9,5,3),(9,12,4),(9,13,5),(9,14,6),(9,15,7);
/*!40000 ALTER TABLE `ubwbh_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_category_shop`
--

DROP TABLE IF EXISTS `ubwbh_category_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_category_shop` (
  `id_category` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_category`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_category_shop`
--

LOCK TABLES `ubwbh_category_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_category_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_category_shop` VALUES (1,1,0),(2,1,0),(3,1,0),(4,1,0),(5,1,1),(6,1,1),(7,1,0),(8,1,1),(9,1,2);
/*!40000 ALTER TABLE `ubwbh_category_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cms`
--

DROP TABLE IF EXISTS `ubwbh_cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_category` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `indexation` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_cms`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cms`
--

LOCK TABLES `ubwbh_cms` WRITE;
/*!40000 ALTER TABLE `ubwbh_cms` DISABLE KEYS */;
INSERT INTO `ubwbh_cms` VALUES (1,1,0,1,1),(2,1,1,1,1),(3,1,2,1,1),(4,1,3,1,1),(5,1,4,1,1);
/*!40000 ALTER TABLE `ubwbh_cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cms_category`
--

DROP TABLE IF EXISTS `ubwbh_cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cms_category` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_cms_category`),
  KEY `category_parent` (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cms_category`
--

LOCK TABLES `ubwbh_cms_category` WRITE;
/*!40000 ALTER TABLE `ubwbh_cms_category` DISABLE KEYS */;
INSERT INTO `ubwbh_cms_category` VALUES (1,0,1,1,'2026-11-23 15:01:16','2026-11-23 15:01:16',0);
/*!40000 ALTER TABLE `ubwbh_cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cms_category_lang`
--

DROP TABLE IF EXISTS `ubwbh_cms_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cms_category_lang` (
  `id_cms_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  `name` varchar(128) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_cms_category`,`id_shop`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cms_category_lang`
--

LOCK TABLES `ubwbh_cms_category_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_cms_category_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_cms_category_lang` VALUES (1,1,1,'Home','','home','',''),(1,2,1,'Beranda','','beranda','','');
/*!40000 ALTER TABLE `ubwbh_cms_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cms_category_shop`
--

DROP TABLE IF EXISTS `ubwbh_cms_category_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cms_category_shop` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_category`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cms_category_shop`
--

LOCK TABLES `ubwbh_cms_category_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_cms_category_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_cms_category_shop` VALUES (1,1);
/*!40000 ALTER TABLE `ubwbh_cms_category_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cms_lang`
--

DROP TABLE IF EXISTS `ubwbh_cms_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cms_lang` (
  `id_cms` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  `meta_title` varchar(255) NOT NULL,
  `head_seo_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `link_rewrite` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cms`,`id_shop`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cms_lang`
--

LOCK TABLES `ubwbh_cms_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_cms_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_cms_lang` VALUES (1,1,1,'Delivery','','Our terms and conditions of delivery','<h2>Shipments and returns</h2><h3>Your pack shipment</h3><p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via UPS with tracking and drop-off without signature. If you prefer delivery by UPS Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p><p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>','delivery'),(1,2,1,'Pengiriman barang','','Tata cara pengiriman barang','<h2>Pengiriman barang</h2><h3>Your pack shipment</h3><p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via UPS with tracking and drop-off without signature. If you prefer delivery by UPS Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p><p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>','pengiriman-barang'),(2,1,1,'Legal Notice','','Legal notice','<h2>Legal</h2><h3>Credits</h3><p>Concept and production:</p><p>This Online store was created using <a href=\"http://www.prestashop.com\">Prestashop Shopping Cart Software</a>,check out PrestaShop\'s <a href=\"http://www.prestashop.com/blog/en/\">ecommerce blog</a> for news and advices about selling online and running your ecommerce website.</p>','legal-notice'),(2,2,1,'Kebijakan privasi dan hukum','','Kebijakan privasi dan hukum','<h2>Kebijakan privasi dan hukum</h2><p>Tentang kebijakan privasi dan hukum bagi pelanggan</p><p>Website ini dibuat menggunakan <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; open-source software.</p>','kebijakan-privasi-dan-hukum'),(3,1,1,'Terms and conditions of use','','Our terms and conditions of use','<h1 class=\"page-heading\">Terms and conditions of use</h1>\n<h3 class=\"page-subheading\">Rule 1</h3>\n<p class=\"bottom-indent\">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<h3 class=\"page-subheading\">Rule 2</h3>\n<p class=\"bottom-indent\">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam&#1102;</p>\n<h3 class=\"page-subheading\">Rule 3</h3>\n<p class=\"bottom-indent\">Tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam&#1102;</p>','terms-and-conditions-of-use'),(3,2,1,'Syarat pemakaian','','Syarat pemakaian','<h2>Syarat dan ketentuan pemakaian website</h2><p>Tentang syarat dan ketentuan pemakaian website (penggunaan cookies, penggunaan data customer, dsb)</p>\n','syarat-pemakaian'),(4,1,1,'About us','','Learn more about us','<h1 class=\"page-heading bottom-indent\">About us</h1>\n<div class=\"row\">\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-block\">\n<h3 class=\"page-subheading\">Our company</h3>\n<p><strong class=\"dark\">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididun.</strong></p>\n<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet conse ctetur adipisicing elit.</p>\n<ul class=\"list-1\">\n<li><em class=\"icon-ok\"></em>Top quality products</li>\n<li><em class=\"icon-ok\"></em>Best customer service</li>\n<li><em class=\"icon-ok\"></em>30-days money back guarantee</li>\n</ul>\n</div>\n</div>\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-box\">\n<h3 class=\"page-subheading\">Our team</h3>\n<p><strong class=\"dark\">Lorem set sint occaecat cupidatat non </strong></p>\n<p>Eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>\n</div>\n</div>\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-box\">\n<h3 class=\"page-subheading\">Testimonials</h3>\n<div class=\"testimonials\">\n<div class=\"inner\"><span class=\"before\">“</span>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.<span class=\"after\">”</span></div>\n</div>\n<p><strong class=\"dark\">Lorem ipsum dolor sit</strong></p>\n<div class=\"testimonials\">\n<div class=\"inner\"><span class=\"before\">“</span>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod.<span class=\"after\">”</span></div>\n</div>\n<p><strong class=\"dark\">Ipsum dolor sit</strong></p>\n</div>\n</div>\n</div>','about-us'),(4,2,1,'Tentang kami','','Lebih lanjut mengenai kami','<h2>Tentang kami</h2>\n<p>Informasi tentang toko Anda</p>\n','tentang-kami'),(5,1,1,'Secure payment','','Our secure payment method','<h2>Secure payment</h2>\r\n<h3>Our secure payment</h3><p>With SSL</p>\r\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this service</p>','secure-payment'),(5,2,1,'Pembayaran','','Pembayaran','<h2>Pembayaran</h2>\n<p>Detail tentang pembayaran</p>','pembayaran');
/*!40000 ALTER TABLE `ubwbh_cms_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cms_role`
--

DROP TABLE IF EXISTS `ubwbh_cms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cms_role` (
  `id_cms_role` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_cms` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_role`,`id_cms`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cms_role`
--

LOCK TABLES `ubwbh_cms_role` WRITE;
/*!40000 ALTER TABLE `ubwbh_cms_role` DISABLE KEYS */;
INSERT INTO `ubwbh_cms_role` VALUES (1,'LEGAL_CONDITIONS',3),(2,'LEGAL_NOTICE',2);
/*!40000 ALTER TABLE `ubwbh_cms_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cms_role_lang`
--

DROP TABLE IF EXISTS `ubwbh_cms_role_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cms_role_lang` (
  `id_cms_role` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_cms_role`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cms_role_lang`
--

LOCK TABLES `ubwbh_cms_role_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_cms_role_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_cms_role_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_cms_shop`
--

DROP TABLE IF EXISTS `ubwbh_cms_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_cms_shop` (
  `id_cms` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_cms_shop`
--

LOCK TABLES `ubwbh_cms_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_cms_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_cms_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `ubwbh_cms_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_configuration`
--

DROP TABLE IF EXISTS `ubwbh_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_configuration` (
  `id_configuration` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned DEFAULT NULL,
  `id_shop` int(11) unsigned DEFAULT NULL,
  `name` varchar(254) NOT NULL,
  `value` mediumtext DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration`),
  KEY `name` (`name`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_configuration`
--

LOCK TABLES `ubwbh_configuration` WRITE;
/*!40000 ALTER TABLE `ubwbh_configuration` DISABLE KEYS */;
INSERT INTO `ubwbh_configuration` VALUES (1,NULL,NULL,'PS_LANG_DEFAULT','1','2026-11-23 14:59:36','2026-11-23 14:59:36'),(2,NULL,NULL,'PS_VERSION_DB','9.2.1','2026-11-23 14:59:36','2026-11-23 14:59:36'),(3,NULL,NULL,'PS_INSTALL_VERSION','9.2.1','2026-11-23 14:59:36','2026-11-23 14:59:36'),(4,NULL,NULL,'PS_CARRIER_DEFAULT','1','2026-11-23 15:01:15','2026-11-23 15:01:15'),(5,NULL,NULL,'PS_GROUP_FEATURE_ACTIVE','1','2026-11-23 15:01:15','2026-11-23 15:01:15'),(6,NULL,NULL,'PS_CURRENCY_DEFAULT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,NULL,NULL,'PS_COUNTRY_DEFAULT','110','0000-00-00 00:00:00','2026-11-23 15:01:19'),(8,NULL,NULL,'PS_REWRITING_SETTINGS','1','0000-00-00 00:00:00','2026-11-23 15:01:19'),(9,NULL,NULL,'PS_DEFAULT_LANGUAGE_URL_PREFIX','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,NULL,NULL,'PS_ORDER_OUT_OF_STOCK','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,NULL,NULL,'PS_LAST_QTIES','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,NULL,NULL,'PS_CONDITIONS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,NULL,NULL,'PS_RECYCLABLE_PACK','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,NULL,NULL,'PS_GIFT_WRAPPING','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,NULL,NULL,'PS_GIFT_WRAPPING_PRICE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,NULL,NULL,'PS_STOCK_MANAGEMENT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,NULL,NULL,'PS_NAVIGATION_PIPE','>','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,NULL,NULL,'PS_PRODUCTS_PER_PAGE','12','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,NULL,NULL,'PS_PURCHASE_MINIMUM','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,NULL,NULL,'PS_PRODUCTS_ORDER_WAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,NULL,NULL,'PS_PRODUCTS_ORDER_BY','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,NULL,NULL,'PS_DISPLAY_QTIES','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,NULL,NULL,'PS_DISPLAY_AMOUNT_IN_CART','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,NULL,NULL,'PS_SHIPPING_HANDLING','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,NULL,NULL,'PS_SHIPPING_FREE_PRICE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,NULL,NULL,'PS_SHIPPING_FREE_WEIGHT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,NULL,NULL,'PS_SHIPPING_METHOD','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,NULL,NULL,'PS_TAX','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,NULL,NULL,'PS_SHOP_ENABLE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,NULL,NULL,'PS_MAINTENANCE_ALLOW_ADMINS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,NULL,NULL,'PS_NB_DAYS_NEW_PRODUCT','20','0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,NULL,NULL,'PS_SSL_ENABLED','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,NULL,NULL,'PS_WEIGHT_UNIT','kg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,NULL,NULL,'PS_BLOCK_CART_AJAX','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,NULL,NULL,'PS_ORDER_RETURN','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,NULL,NULL,'PS_ORDER_RETURN_NB_DAYS','14','0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,NULL,NULL,'PS_MAIL_TYPE','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,NULL,NULL,'PS_PRODUCT_PICTURE_MAX_SIZE','8388608','0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,NULL,NULL,'PS_PRODUCT_PICTURE_WIDTH','64','0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,NULL,NULL,'PS_PRODUCT_PICTURE_HEIGHT','64','0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,NULL,NULL,'PS_INVOICE_PREFIX','#IN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,NULL,NULL,'PS_INVCE_INVOICE_ADDR_RULES','{\"avoid\":[]}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,NULL,NULL,'PS_INVCE_DELIVERY_ADDR_RULES','{\"avoid\":[]}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,NULL,NULL,'PS_DELIVERY_PREFIX','#DE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,NULL,NULL,'PS_DELIVERY_NUMBER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,NULL,NULL,'PS_RETURN_PREFIX','#RE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,NULL,NULL,'PS_INVOICE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,NULL,NULL,'PS_PASSWD_TIME_BACK','360','0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,NULL,NULL,'PS_PASSWD_TIME_FRONT','360','0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,NULL,NULL,'PS_PASSWD_RESET_VALIDITY','1440','0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,NULL,NULL,'PS_DISP_UNAVAILABLE_ATTR','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,NULL,NULL,'PS_SEARCH_INDEXATION','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,NULL,NULL,'PS_SEARCH_FUZZY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,NULL,NULL,'PS_SEARCH_FUZZY_MAX_LOOP','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,NULL,NULL,'PS_SEARCH_FUZZY_MAX_DIFFERENCE','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,NULL,NULL,'PS_SEARCH_MAX_WORD_LENGTH','15','0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,NULL,NULL,'PS_SEARCH_MINWORDLEN','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,NULL,NULL,'PS_SEARCH_BLACKLIST','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,NULL,NULL,'PS_SEARCH_WEIGHT_PNAME','6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,NULL,NULL,'PS_SEARCH_WEIGHT_REF','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,NULL,NULL,'PS_SEARCH_WEIGHT_SHORTDESC','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,NULL,NULL,'PS_SEARCH_WEIGHT_DESC','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,NULL,NULL,'PS_SEARCH_WEIGHT_CNAME','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,NULL,NULL,'PS_SEARCH_WEIGHT_MNAME','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,NULL,NULL,'PS_SEARCH_WEIGHT_TAG','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,NULL,NULL,'PS_SEARCH_WEIGHT_ATTRIBUTE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,NULL,NULL,'PS_SEARCH_WEIGHT_FEATURE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,NULL,NULL,'PS_SEARCH_AJAX','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,NULL,NULL,'PS_TIMEZONE','Asia/Jakarta','0000-00-00 00:00:00','2026-11-23 15:01:19'),(70,NULL,NULL,'PS_THEME_V11','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,NULL,NULL,'PS_TIN_ACTIVE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,NULL,NULL,'PS_SHOW_ALL_MODULES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,NULL,NULL,'PS_BACKUP_ALL','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,NULL,NULL,'PS_1_3_UPDATE_DATE','2011-12-27 10:20:42','0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,NULL,NULL,'PS_PRICE_ROUND_MODE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,NULL,NULL,'PS_1_3_2_UPDATE_DATE','2011-12-27 10:20:42','0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,NULL,NULL,'PS_CONDITIONS_CMS_ID','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,NULL,NULL,'PS_VOLUME_UNIT','cl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,NULL,NULL,'PS_CIPHER_ALGORITHM','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,NULL,NULL,'PS_ATTRIBUTE_CATEGORY_DISPLAY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,NULL,NULL,'PS_CUSTOMER_SERVICE_FILE_UPLOAD','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,NULL,NULL,'PS_CUSTOMER_SERVICE_SIGNATURE','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,NULL,NULL,'PS_BLOCK_BESTSELLERS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,NULL,NULL,'PS_BLOCK_NEWPRODUCTS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,NULL,NULL,'PS_BLOCK_SPECIALS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,NULL,NULL,'PS_SPECIFIC_PRICE_PRIORITIES','id_group;id_currency;id_country;id_shop','0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,NULL,NULL,'PS_TAX_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,NULL,NULL,'PS_SMARTY_FORCE_COMPILE','2','0000-00-00 00:00:00','2026-11-23 15:32:16'),(89,NULL,NULL,'PS_DISTANCE_UNIT','km','0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,NULL,NULL,'PS_STORES_DISPLAY_CMS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,NULL,NULL,'SHOP_LOGO_WIDTH','100','0000-00-00 00:00:00','2026-11-23 15:01:19'),(92,NULL,NULL,'SHOP_LOGO_HEIGHT','28','0000-00-00 00:00:00','2026-11-23 15:01:19'),(93,NULL,NULL,'EDITORIAL_IMAGE_WIDTH','530','0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,NULL,NULL,'EDITORIAL_IMAGE_HEIGHT','228','0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,NULL,NULL,'PS_STATSDATA_CUSTOMER_PAGESVIEWS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,NULL,NULL,'PS_STATSDATA_PAGESVIEWS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,NULL,NULL,'PS_STATSDATA_PLUGINS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(98,NULL,NULL,'PS_GEOLOCATION_ENABLED','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,NULL,NULL,'PS_ALLOWED_COUNTRIES','AF;ZA;AX;AL;DZ;DE;AD;AO;AI;AQ;AG;AN;SA;AR;AM;AW;AU;AT;AZ;BS;BH;BD;BB;BY;BE;BZ;BJ;BM;BT;BO;BA;BW;BV;BR;BN;BG;BF;MM;BI;KY;KH;CM;CA;CV;CF;CL;CN;CX;CY;CC;CO;KM;CG;CD;CK;KR;KP;CR;CI;HR;CU;DK;DJ;DM;EG;IE;SV;AE;EC;ER;ES;EE;ET;FK;FO;FJ;FI;FR;GA;GM;GE;GS;GH;GI;GR;GD;GL;GP;GU;GT;GG;GN;GQ;GW;GY;GF;HT;HM;HN;HK;HU;IM;MU;VG;VI;IN;ID;IR;IQ;IS;IL;IT;JM;JP;JE;JO;KZ;KE;KG;KI;KW;LA;LS;LV;LB;LR;LY;LI;LT;LU;MO;MK;MG;MY;MW;MV;ML;MT;MP;MA;MH;MQ;MR;YT;MX;FM;MD;MC;MN;ME;MS;MZ;NA;NR;NP;NI;NE;NG;NU;NF;NO;NC;NZ;IO;OM;UG;UZ;PK;PW;PS;PA;PG;PY;NL;PE;PH;PN;PL;PF;PR;PT;QA;DO;CZ;RE;RO;GB;RU;RW;EH;BL;KN;SM;MF;PM;VA;VC;LC;SB;WS;AS;ST;SN;RS;SC;SL;SG;SK;SI;SO;SD;LK;SE;CH;SR;SJ;SZ;SY;TJ;TW;TZ;TD;TF;TH;TL;TG;TK;TO;TT;TN;TM;TC;TR;TV;UA;UY;US;VU;VE;VN;WF;YE;ZM;ZW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,NULL,NULL,'PS_GEOLOCATION_BEHAVIOR','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,NULL,NULL,'PS_LOCALE_LANGUAGE','en','0000-00-00 00:00:00','2026-11-23 15:01:19'),(102,NULL,NULL,'PS_LOCALE_COUNTRY','id','0000-00-00 00:00:00','2026-11-23 15:01:19'),(103,NULL,NULL,'PS_ATTACHMENT_MAXIMUM_SIZE','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(104,NULL,NULL,'PS_SMARTY_CACHE',NULL,'0000-00-00 00:00:00','2026-11-23 15:32:16'),(105,NULL,NULL,'PS_CSS_THEME_CACHE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(106,NULL,NULL,'PS_JS_THEME_CACHE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(107,NULL,NULL,'PS_HTACCESS_CACHE_CONTROL','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(108,NULL,NULL,'PS_DIMENSION_UNIT','cm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,NULL,NULL,'PS_GUEST_CHECKOUT_ENABLED','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,NULL,NULL,'PS_DISPLAY_SUPPLIERS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,NULL,NULL,'PS_DISPLAY_MANUFACTURERS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(112,NULL,NULL,'PS_DISPLAY_BEST_SELLERS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(113,NULL,NULL,'PS_CATALOG_MODE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(114,NULL,NULL,'PS_GEOLOCATION_WHITELIST','127.0.0.1;::1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,NULL,NULL,'PS_LOGS_BY_EMAIL','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(116,NULL,NULL,'PS_COOKIE_CHECKIP','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,NULL,NULL,'PS_COOKIE_SAMESITE','Lax','0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,NULL,NULL,'PS_USE_ECOTAX','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,NULL,NULL,'PS_CANONICAL_REDIRECT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,NULL,NULL,'PS_IMG_UPDATE_TIME','1324977642','0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,NULL,NULL,'PS_BACKUP_DROP_TABLE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,NULL,NULL,'PS_OS_CHEQUE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,NULL,NULL,'PS_OS_PAYMENT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,NULL,NULL,'PS_OS_PREPARATION','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,NULL,NULL,'PS_OS_SHIPPING','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,NULL,NULL,'PS_OS_DELIVERED','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(127,NULL,NULL,'PS_OS_CANCELED','6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(128,NULL,NULL,'PS_OS_REFUND','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(129,NULL,NULL,'PS_OS_ERROR','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(130,NULL,NULL,'PS_OS_OUTOFSTOCK','9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,NULL,NULL,'PS_OS_BANKWIRE','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(132,NULL,NULL,'PS_OS_WS_PAYMENT','11','0000-00-00 00:00:00','0000-00-00 00:00:00'),(133,NULL,NULL,'PS_OS_OUTOFSTOCK_PAID','9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,NULL,NULL,'PS_OS_OUTOFSTOCK_UNPAID','12','0000-00-00 00:00:00','0000-00-00 00:00:00'),(135,NULL,NULL,'PS_OS_COD_VALIDATION','13','0000-00-00 00:00:00','0000-00-00 00:00:00'),(136,NULL,NULL,'PS_IMAGE_QUALITY','png','0000-00-00 00:00:00','2026-11-23 15:08:35'),(137,NULL,NULL,'PS_PNG_QUALITY','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(138,NULL,NULL,'PS_JPEG_QUALITY','90','0000-00-00 00:00:00','0000-00-00 00:00:00'),(139,NULL,NULL,'PS_WEBP_QUALITY','80','0000-00-00 00:00:00','0000-00-00 00:00:00'),(140,NULL,NULL,'PS_COOKIE_LIFETIME_FO','480','0000-00-00 00:00:00','0000-00-00 00:00:00'),(141,NULL,NULL,'PS_COOKIE_LIFETIME_BO','480','0000-00-00 00:00:00','0000-00-00 00:00:00'),(142,NULL,NULL,'PS_RESTRICT_DELIVERED_COUNTRIES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(143,NULL,NULL,'PS_SHOW_NEW_ORDERS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(144,NULL,NULL,'PS_SHOW_NEW_CUSTOMERS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(145,NULL,NULL,'PS_SHOW_NEW_MESSAGES','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(146,NULL,NULL,'PS_FEATURE_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(147,NULL,NULL,'PS_COMBINATION_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(148,NULL,NULL,'PS_SPECIFIC_PRICE_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(149,NULL,NULL,'PS_VIRTUAL_PROD_FEATURE_ACTIVE','1','0000-00-00 00:00:00','2026-11-23 15:08:48'),(150,NULL,NULL,'PS_CUSTOMIZATION_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(151,NULL,NULL,'PS_CART_RULE_FEATURE_ACTIVE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(152,NULL,NULL,'PS_PACK_FEATURE_ACTIVE','1','0000-00-00 00:00:00','2026-11-23 15:08:51'),(153,NULL,NULL,'PS_ALIAS_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(154,NULL,NULL,'PS_TAX_ADDRESS_TYPE','id_address_delivery','0000-00-00 00:00:00','0000-00-00 00:00:00'),(155,NULL,NULL,'PS_SHOP_DEFAULT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(156,NULL,NULL,'PS_CARRIER_DEFAULT_SORT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(157,NULL,NULL,'PS_STOCK_CUSTOMER_ORDER_REASON','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(158,NULL,NULL,'PS_STOCK_CUSTOMER_ORDER_CANCEL_REASON','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(159,NULL,NULL,'PS_STOCK_CUSTOMER_RETURN_REASON','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(160,NULL,NULL,'PS_STOCK_MVT_INC_EMPLOYEE_EDITION','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(161,NULL,NULL,'PS_STOCK_MVT_DEC_EMPLOYEE_EDITION','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(162,NULL,NULL,'PS_UNIDENTIFIED_GROUP','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(163,NULL,NULL,'PS_GUEST_GROUP','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(164,NULL,NULL,'PS_CUSTOMER_GROUP','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(165,NULL,NULL,'PS_CARRIER_DEFAULT_ORDER','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(166,NULL,NULL,'PS_SMARTY_CONSOLE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(167,NULL,NULL,'PS_INVOICE_MODEL','invoice','0000-00-00 00:00:00','0000-00-00 00:00:00'),(168,NULL,NULL,'PS_LIMIT_UPLOAD_IMAGE_VALUE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(169,NULL,NULL,'PS_LIMIT_UPLOAD_FILE_VALUE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(170,NULL,NULL,'MB_PAY_TO_EMAIL','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(171,NULL,NULL,'MB_SECRET_WORD','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(172,NULL,NULL,'MB_HIDE_LOGIN','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(173,NULL,NULL,'MB_ID_LOGO','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(174,NULL,NULL,'MB_ID_LOGO_WALLET','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(175,NULL,NULL,'MB_PARAMETERS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(176,NULL,NULL,'MB_PARAMETERS_2','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(177,NULL,NULL,'MB_DISPLAY_MODE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(178,NULL,NULL,'MB_CANCEL_URL','http://www.yoursite.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(179,NULL,NULL,'MB_LOCAL_METHODS','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(180,NULL,NULL,'MB_INTER_METHODS','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(181,NULL,NULL,'BANK_WIRE_CURRENCIES','2,1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(182,NULL,NULL,'CHEQUE_CURRENCIES','2,1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(183,NULL,NULL,'PRODUCTS_VIEWED_NBR','8','0000-00-00 00:00:00','2026-11-23 15:02:25'),(184,NULL,NULL,'BLOCK_CATEG_DHTML','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(185,NULL,NULL,'BLOCK_CATEG_MAX_DEPTH','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(186,NULL,NULL,'MANUFACTURER_DISPLAY_FORM','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(187,NULL,NULL,'MANUFACTURER_DISPLAY_TEXT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(188,NULL,NULL,'MANUFACTURER_DISPLAY_TEXT_NB','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(189,NULL,NULL,'NEW_PRODUCTS_NBR','8','0000-00-00 00:00:00','2026-11-23 15:02:22'),(190,NULL,NULL,'PS_TOKEN_ENABLE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(191,NULL,NULL,'PS_SHOP_MODE','b2c_only','0000-00-00 00:00:00','0000-00-00 00:00:00'),(192,NULL,NULL,'PS_STATS_RENDER','graphnvd3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(193,NULL,NULL,'PS_STATS_OLD_CONNECT_AUTO_CLEAN','never','0000-00-00 00:00:00','0000-00-00 00:00:00'),(194,NULL,NULL,'PS_STATS_GRID_RENDER','gridhtml','0000-00-00 00:00:00','0000-00-00 00:00:00'),(195,NULL,NULL,'BLOCKTAGS_NBR','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(196,NULL,NULL,'CHECKUP_DESCRIPTIONS_LT','100','0000-00-00 00:00:00','0000-00-00 00:00:00'),(197,NULL,NULL,'CHECKUP_DESCRIPTIONS_GT','400','0000-00-00 00:00:00','0000-00-00 00:00:00'),(198,NULL,NULL,'CHECKUP_IMAGES_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(199,NULL,NULL,'CHECKUP_IMAGES_GT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(200,NULL,NULL,'CHECKUP_SALES_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(201,NULL,NULL,'CHECKUP_SALES_GT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(202,NULL,NULL,'CHECKUP_STOCK_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(203,NULL,NULL,'CHECKUP_STOCK_GT','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(204,NULL,NULL,'FOOTER_CMS','0_3|0_4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(205,NULL,NULL,'FOOTER_BLOCK_ACTIVATION','0_3|0_4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(206,NULL,NULL,'FOOTER_POWEREDBY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(207,NULL,NULL,'BLOCKADVERT_LINK','https://www.prestashop.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(208,NULL,NULL,'BLOCKSTORE_IMG','store.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(209,NULL,NULL,'BLOCKADVERT_IMG_EXT','jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(210,NULL,NULL,'MOD_BLOCKTOPMENU_ITEMS','CAT3,CAT6,CAT9','0000-00-00 00:00:00','2026-11-23 15:02:20'),(211,NULL,NULL,'MOD_BLOCKTOPMENU_SEARCH','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(212,NULL,NULL,'BLOCKSOCIAL_FACEBOOK',NULL,'0000-00-00 00:00:00','2026-11-23 15:02:24'),(213,NULL,NULL,'BLOCKSOCIAL_TWITTER',NULL,'0000-00-00 00:00:00','2026-11-23 15:02:24'),(214,NULL,NULL,'BLOCKSOCIAL_RSS',NULL,'0000-00-00 00:00:00','2026-11-23 15:02:24'),(215,NULL,NULL,'BLOCKCONTACTINFOS_COMPANY','Your company','0000-00-00 00:00:00','0000-00-00 00:00:00'),(216,NULL,NULL,'BLOCKCONTACTINFOS_ADDRESS','Address line 1\nCity\nCountry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(217,NULL,NULL,'BLOCKCONTACTINFOS_PHONE','0123-456-789','0000-00-00 00:00:00','0000-00-00 00:00:00'),(218,NULL,NULL,'BLOCKCONTACTINFOS_EMAIL','pub@prestashop.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(219,NULL,NULL,'BLOCKCONTACT_TELNUMBER','0123-456-789','0000-00-00 00:00:00','0000-00-00 00:00:00'),(220,NULL,NULL,'BLOCKCONTACT_EMAIL','pub@prestashop.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(221,NULL,NULL,'SUPPLIER_DISPLAY_TEXT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(222,NULL,NULL,'SUPPLIER_DISPLAY_TEXT_NB','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(223,NULL,NULL,'SUPPLIER_DISPLAY_FORM','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(224,NULL,NULL,'BLOCK_CATEG_NBR_COLUMN_FOOTER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(225,NULL,NULL,'UPGRADER_BACKUPDB_FILENAME','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(226,NULL,NULL,'UPGRADER_BACKUPFILES_FILENAME','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(227,NULL,NULL,'BLOCKREINSURANCE_NBBLOCKS','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(228,NULL,NULL,'HOMESLIDER_WIDTH','535','0000-00-00 00:00:00','0000-00-00 00:00:00'),(229,NULL,NULL,'HOMESLIDER_SPEED','5000','0000-00-00 00:00:00','2026-11-23 15:02:18'),(230,NULL,NULL,'HOMESLIDER_PAUSE','7700','0000-00-00 00:00:00','0000-00-00 00:00:00'),(231,NULL,NULL,'HOMESLIDER_LOOP','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(232,NULL,NULL,'PS_BASE_DISTANCE_UNIT','m','0000-00-00 00:00:00','0000-00-00 00:00:00'),(233,NULL,NULL,'PS_SHOP_DOMAIN','localhost','0000-00-00 00:00:00','0000-00-00 00:00:00'),(234,NULL,NULL,'PS_SHOP_DOMAIN_SSL','localhost','0000-00-00 00:00:00','0000-00-00 00:00:00'),(235,NULL,NULL,'PS_SHOP_NAME','Bloowing Flower','0000-00-00 00:00:00','2026-11-23 15:01:19'),(236,NULL,NULL,'PS_SHOP_EMAIL','ecommerceplenger@gmail.com','0000-00-00 00:00:00','2026-11-23 15:01:27'),(237,NULL,NULL,'PS_MAIL_METHOD','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(238,NULL,NULL,'PS_MAIL_SUBJECT_PREFIX','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(239,NULL,NULL,'PS_LOGO','logo.png','0000-00-00 00:00:00','0000-00-00 00:00:00'),(240,NULL,NULL,'PS_FAVICON','favicon.ico','0000-00-00 00:00:00','0000-00-00 00:00:00'),(241,NULL,NULL,'PS_STORES_ICON','logo_stores.png','0000-00-00 00:00:00','0000-00-00 00:00:00'),(242,NULL,NULL,'PS_ROOT_CATEGORY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(243,NULL,NULL,'PS_HOME_CATEGORY','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(244,NULL,NULL,'PS_CONFIGURATION_AGREMENT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(245,NULL,NULL,'PS_MAIL_SERVER','smtp.','0000-00-00 00:00:00','0000-00-00 00:00:00'),(246,NULL,NULL,'PS_MAIL_USER','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(247,NULL,NULL,'PS_MAIL_PASSWD','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(248,NULL,NULL,'PS_MAIL_SMTP_ENCRYPTION','off','0000-00-00 00:00:00','0000-00-00 00:00:00'),(249,NULL,NULL,'PS_MAIL_SMTP_PORT','25','0000-00-00 00:00:00','0000-00-00 00:00:00'),(250,NULL,NULL,'PS_MAIL_COLOR','#db3484','0000-00-00 00:00:00','0000-00-00 00:00:00'),(251,NULL,NULL,'PS_MAIL_DKIM_ENABLE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(252,NULL,NULL,'PS_MAIL_DKIM_DOMAIN','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(253,NULL,NULL,'PS_MAIL_DKIM_SELECTOR','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(254,NULL,NULL,'PS_MAIL_DKIM_KEY','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(255,NULL,NULL,'NW_SALT','6YWPHY5G48JCBATw','0000-00-00 00:00:00','2026-11-23 15:02:10'),(256,NULL,NULL,'PS_PAYMENT_LOGO_CMS_ID','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(257,NULL,NULL,'HOME_FEATURED_NBR','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(258,NULL,NULL,'SEK_MIN_OCCURENCES','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(259,NULL,NULL,'SEK_FILTER_KW','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(260,NULL,NULL,'PS_CUSTOMER_CREATION_EMAIL','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(261,NULL,NULL,'PS_SMARTY_CONSOLE_KEY','SMARTY_DEBUG','0000-00-00 00:00:00','0000-00-00 00:00:00'),(262,NULL,NULL,'PS_USE_COMBINATION_IMAGE_IN_LISTING','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(263,NULL,NULL,'PS_ATTRIBUTE_ANCHOR_SEPARATOR','-','0000-00-00 00:00:00','0000-00-00 00:00:00'),(264,NULL,NULL,'CONF_AVERAGE_PRODUCT_MARGIN','40','0000-00-00 00:00:00','0000-00-00 00:00:00'),(265,NULL,NULL,'PS_DASHBOARD_SIMULATION','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(266,NULL,NULL,'PS_USE_HTMLPURIFIER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(267,NULL,NULL,'PS_SMARTY_LOCAL',NULL,'0000-00-00 00:00:00','2026-11-23 15:32:16'),(268,NULL,NULL,'PS_SMARTY_CLEAR_CACHE','everytime','0000-00-00 00:00:00','0000-00-00 00:00:00'),(269,NULL,NULL,'PS_DETECT_LANG','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(270,NULL,NULL,'PS_DETECT_COUNTRY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(271,NULL,NULL,'PS_ROUND_TYPE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(272,NULL,NULL,'PS_LOG_EMAILS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(273,NULL,NULL,'PS_CUSTOMER_OPTIN','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(274,NULL,NULL,'PS_CUSTOMER_BIRTHDATE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(275,NULL,NULL,'PS_PACK_STOCK_TYPE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(276,NULL,NULL,'PS_LOG_MODULE_PERFS_MODULO','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(277,NULL,NULL,'PS_DISALLOW_HISTORY_REORDERING','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(278,NULL,NULL,'PS_DISPLAY_PRODUCT_WEIGHT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(279,NULL,NULL,'PS_PRODUCT_WEIGHT_PRECISION','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(280,NULL,NULL,'PS_ORDER_RECALCULATE_SHIPPING','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(281,NULL,NULL,'PS_MAINTENANCE_TEXT','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(282,NULL,NULL,'PS_PRODUCT_SHORT_DESC_LIMIT','800','0000-00-00 00:00:00','0000-00-00 00:00:00'),(283,NULL,NULL,'PS_LABEL_IN_STOCK_PRODUCTS','In Stock','0000-00-00 00:00:00','0000-00-00 00:00:00'),(284,NULL,NULL,'PS_LABEL_OOS_PRODUCTS_BOA','Product available for orders','0000-00-00 00:00:00','0000-00-00 00:00:00'),(285,NULL,NULL,'PS_LABEL_OOS_PRODUCTS_BOD','Out-of-Stock','0000-00-00 00:00:00','0000-00-00 00:00:00'),(286,NULL,NULL,'PS_CATALOG_MODE_WITH_PRICES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(287,NULL,NULL,'PS_MAIL_THEME','modern','0000-00-00 00:00:00','0000-00-00 00:00:00'),(288,NULL,NULL,'PS_ORDER_PRODUCTS_NB_PER_PAGE','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(289,NULL,NULL,'PS_LOGS_EMAIL_RECEIVERS','ecommerceplenger@gmail.com','0000-00-00 00:00:00','2026-11-23 15:01:27'),(290,NULL,NULL,'PS_SHOW_LABEL_OOS_LISTING_PAGES','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(291,NULL,NULL,'ADDONS_API_MODULE_CHANNEL','stable','0000-00-00 00:00:00','0000-00-00 00:00:00'),(292,NULL,NULL,'PS_SECURITY_TOKEN','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(293,NULL,NULL,'PS_SECURITY_PASSWORD_POLICY_MAXIMUM_LENGTH','72','0000-00-00 00:00:00','0000-00-00 00:00:00'),(294,NULL,NULL,'PS_SECURITY_PASSWORD_POLICY_MINIMUM_LENGTH','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(295,NULL,NULL,'PS_SECURITY_PASSWORD_POLICY_MINIMUM_SCORE','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(296,NULL,NULL,'PS_ENABLE_BACKORDER_STATUS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(297,NULL,NULL,'PS_PRODUCT_REDIRECTION_DEFAULT','404','0000-00-00 00:00:00','0000-00-00 00:00:00'),(298,NULL,NULL,'PS_AVIF_QUALITY','90','0000-00-00 00:00:00','0000-00-00 00:00:00'),(299,NULL,NULL,'PS_IMAGE_FORMAT','jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(300,NULL,NULL,'PS_DEBUG_COOKIE_NAME','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(301,NULL,NULL,'PS_DEBUG_COOKIE_VALUE','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(302,NULL,NULL,'PS_PRODUCT_BREADCRUMB_CATEGORY','default','0000-00-00 00:00:00','0000-00-00 00:00:00'),(303,NULL,NULL,'PS_ENABLE_ADMIN_API','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(304,NULL,NULL,'PS_ADMIN_API_FORCE_DEBUG_SECURED','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(305,NULL,NULL,'PS_SEPARATOR_FILE_MANAGER_SQL',';','0000-00-00 00:00:00','0000-00-00 00:00:00'),(306,NULL,NULL,'PS_FEATURE_VALUES_ORDER','name','0000-00-00 00:00:00','0000-00-00 00:00:00'),(307,NULL,NULL,'PS_MIN_LOGGER_LEVEL_IN_DB','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(308,NULL,NULL,'PSR_HOOK_HEADER','0','2026-11-23 15:01:33','2026-11-23 15:01:33'),(309,NULL,NULL,'PSR_HOOK_FOOTER','0','2026-11-23 15:01:33','2026-11-23 15:01:33'),(310,NULL,NULL,'PSR_HOOK_PRODUCT','1','2026-11-23 15:01:33','2026-11-23 15:01:33'),(311,NULL,NULL,'PSR_HOOK_CHECKOUT','1','2026-11-23 15:01:33','2026-11-23 15:01:33'),(312,NULL,NULL,'PSR_ICON_COLOR','#F19D76','2026-11-23 15:01:33','2026-11-23 15:01:33'),(313,NULL,NULL,'PSR_TEXT_COLOR','#000000','2026-11-23 15:01:33','2026-11-23 15:01:33'),(314,NULL,NULL,'blockwishlist_WishlistPageName',NULL,'2026-11-23 15:01:33','2026-11-23 15:01:33'),(315,NULL,NULL,'blockwishlist_WishlistDefaultTitle',NULL,'2026-11-23 15:01:33','2026-11-23 15:01:33'),(316,NULL,NULL,'blockwishlist_CreateButtonLabel',NULL,'2026-11-23 15:01:34','2026-11-23 15:01:34'),(317,NULL,NULL,'DASHACTIVITY_CART_ACTIVE','30','2026-11-23 15:01:34','2026-11-23 15:01:34'),(318,NULL,NULL,'DASHACTIVITY_CART_ABANDONED_MIN','24','2026-11-23 15:01:34','2026-11-23 15:01:34'),(319,NULL,NULL,'DASHACTIVITY_CART_ABANDONED_MAX','48','2026-11-23 15:01:34','2026-11-23 15:01:34'),(320,NULL,NULL,'DASHACTIVITY_VISITOR_ONLINE','30','2026-11-23 15:01:34','2026-11-23 15:01:34'),(321,NULL,NULL,'PS_DASHGOALS_CURRENT_YEAR','2026','2026-11-23 15:01:35','2026-11-23 15:01:35'),(322,NULL,NULL,'DASHPRODUCT_NBR_SHOW_LAST_ORDER','10','2026-11-23 15:01:35','2026-11-23 15:01:35'),(323,NULL,NULL,'DASHPRODUCT_NBR_SHOW_BEST_SELLER','10','2026-11-23 15:01:35','2026-11-23 15:01:35'),(324,NULL,NULL,'DASHPRODUCT_NBR_SHOW_MOST_VIEWED','10','2026-11-23 15:01:35','2026-11-23 15:01:35'),(325,NULL,NULL,'DASHPRODUCT_NBR_SHOW_TOP_SEARCH','10','2026-11-23 15:01:35','2026-11-23 15:01:35'),(326,NULL,NULL,'GSITEMAP_PRIORITY_HOME','1','2026-11-23 15:01:36','2026-11-23 15:01:36'),(327,NULL,NULL,'GSITEMAP_PRIORITY_PRODUCT','0.9','2026-11-23 15:01:36','2026-11-23 15:01:36'),(328,NULL,NULL,'GSITEMAP_PRIORITY_CATEGORY','0.8','2026-11-23 15:01:36','2026-11-23 15:01:36'),(329,NULL,NULL,'GSITEMAP_PRIORITY_MANUFACTURER','0.7','2026-11-23 15:01:36','2026-11-23 15:01:36'),(330,NULL,NULL,'GSITEMAP_PRIORITY_SUPPLIER','0.7','2026-11-23 15:01:36','2026-11-23 15:01:36'),(331,NULL,NULL,'GSITEMAP_PRIORITY_CMS','0.7','2026-11-23 15:01:36','2026-11-23 15:01:36'),(332,NULL,NULL,'GSITEMAP_FREQUENCY','weekly','2026-11-23 15:01:36','2026-11-23 15:01:36'),(333,NULL,NULL,'GSITEMAP_LAST_EXPORT',NULL,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(334,NULL,NULL,'GSITEMAP_DISABLE_LINKS',NULL,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(335,NULL,NULL,'KLAVIYO','klaviyopsautomation','2026-11-23 15:01:36','2026-11-23 15:01:36'),(336,NULL,NULL,'KLAVIYO_REAL_TIME_EVENT_ENABLE','0','2026-11-23 15:01:36','2026-11-23 15:01:36'),(337,NULL,NULL,'KLAVIYO_TRANSACTIONAL_EMAIL_ENABLE','0','2026-11-23 15:01:36','2026-11-23 15:01:36'),(338,NULL,NULL,'KLAVIYO_COUPON_USAGE_LIMIT_TYPE','LIMIT_PREFIX','2026-11-23 15:01:36','2026-11-23 15:01:36'),(339,NULL,NULL,'KLAVIYO_BIS_ENABLED','0','2026-11-23 15:01:36','2026-11-23 15:01:36'),(340,NULL,NULL,'PS_WEBSERVICE','1','2026-11-23 15:01:36','2026-11-23 15:01:36'),(341,NULL,NULL,'KLAVIYO_WEBSERVICE_ID','1','2026-11-23 15:01:36','2026-11-23 15:01:36'),(342,NULL,NULL,'KLAVIYO_WEBSERVICE_KEY','DcKkgbxd3QPfdVEn4Z6xvp4UMQNNVY48','2026-11-23 15:01:36','2026-11-23 15:01:36'),(343,NULL,NULL,'PS_ACCOUNTS_ACCOUNTS_CLIENT_FAILURE_COUNT','0','2026-11-23 15:01:39','2026-11-23 15:01:39'),(344,NULL,NULL,'PS_ACCOUNTS_ACCOUNTS_CLIENT_LAST_FAILURE_TIME',NULL,'2026-11-23 15:01:39','2026-11-23 15:01:39'),(345,NULL,NULL,'PS_ACCOUNTS_OAUTH2_SERVICE_FAILURE_COUNT','0','2026-11-23 15:01:39','2026-11-23 15:01:39'),(346,NULL,NULL,'PS_ACCOUNTS_OAUTH2_SERVICE_LAST_FAILURE_TIME',NULL,'2026-11-23 15:01:39','2026-11-23 15:01:39'),(347,NULL,NULL,'PS_ACCOUNTS_LAST_UPGRADE','8.0.17','2026-11-23 15:01:41','2026-11-23 15:01:41'),(348,NULL,NULL,'PS_ACCOUNTS_ACCOUNTS_SERVICE_FAILURE_COUNT','0','2026-11-23 15:01:42','2026-11-23 15:01:42'),(349,NULL,NULL,'PS_ACCOUNTS_ACCOUNTS_SERVICE_LAST_FAILURE_TIME',NULL,'2026-11-23 15:01:42','2026-11-23 15:01:42'),(350,NULL,NULL,'PRODUCT_COMMENTS_MINIMAL_TIME','30','2026-11-23 15:01:44','2026-11-23 15:01:44'),(351,NULL,NULL,'PRODUCT_COMMENTS_ALLOW_GUESTS','0','2026-11-23 15:01:44','2026-11-23 15:01:44'),(352,NULL,NULL,'PRODUCT_COMMENTS_USEFULNESS','1','2026-11-23 15:01:44','2026-11-23 15:01:44'),(353,NULL,NULL,'PRODUCT_COMMENTS_COMMENTS_PER_PAGE','5','2026-11-23 15:01:44','2026-11-23 15:01:44'),(354,NULL,NULL,'PRODUCT_COMMENTS_ANONYMISATION','0','2026-11-23 15:01:44','2026-11-23 15:01:44'),(355,NULL,NULL,'PRODUCT_COMMENTS_MODERATE','1','2026-11-23 15:01:44','2026-11-23 15:01:44'),(356,NULL,NULL,'PSGDPR_CREATION_FORM_SWITCH','1','2026-11-23 15:01:44','2026-11-23 15:01:44'),(357,NULL,NULL,'PSGDPR_CREATION_FORM',NULL,'2026-11-23 15:01:44','2026-11-23 15:01:44'),(358,NULL,NULL,'PSGDPR_CUSTOMER_FORM_SWITCH','1','2026-11-23 15:01:44','2026-11-23 15:01:44'),(359,NULL,NULL,'PSGDPR_CUSTOMER_FORM',NULL,'2026-11-23 15:01:44','2026-11-23 15:01:44'),(360,NULL,NULL,'PSGDPR_ANONYMOUS_CUSTOMER','1','2026-11-23 15:01:45','2026-11-23 15:01:45'),(361,NULL,NULL,'PSGDPR_ANONYMOUS_ADDRESS','1','2026-11-23 15:01:45','2026-11-23 15:01:45'),(362,NULL,NULL,'PS_ACCOUNTS_TOKEN_SIGNATURE','dc364bfa102adad557d74f1d30ab3f6432b5005934ec4a53adb47c833cf29978','2026-11-23 15:01:49','2026-11-23 15:01:49'),(363,NULL,NULL,'BANNER_IMG',NULL,'2026-11-23 15:01:55','2026-11-23 15:01:55'),(364,NULL,NULL,'BANNER_LINK',NULL,'2026-11-23 15:01:55','2026-11-23 15:01:55'),(365,NULL,NULL,'BANNER_DESC',NULL,'2026-11-23 15:01:55','2026-11-23 15:01:55'),(366,NULL,NULL,'PS_BLOCK_BESTSELLERS_TO_DISPLAY','8','2026-11-23 15:01:56','2026-11-23 15:01:56'),(367,NULL,NULL,'BRAND_DISPLAY_TYPE','brand_text','2026-11-23 15:01:56','2026-11-23 15:01:56'),(368,NULL,NULL,'BRAND_DISPLAY_TEXT_NB','5','2026-11-23 15:01:56','2026-11-23 15:01:56'),(369,NULL,NULL,'CONF_PS_CASHONDELIVERY_FIXED','0.2','2026-11-23 15:01:56','2026-11-23 15:01:56'),(370,NULL,NULL,'CONF_PS_CASHONDELIVERY_VAR','2','2026-11-23 15:01:56','2026-11-23 15:01:56'),(371,NULL,NULL,'CONF_PS_CASHONDELIVERY_FIXED_FOREIGN','0.2','2026-11-23 15:01:56','2026-11-23 15:01:56'),(372,NULL,NULL,'CONF_PS_CASHONDELIVERY_VAR_FOREIGN','2','2026-11-23 15:01:56','2026-11-23 15:01:56'),(373,NULL,NULL,'CATEGORYPRODUCTS_DISPLAY_PRICE','1','2026-11-23 15:01:57','2026-11-23 15:01:57'),(374,NULL,NULL,'CATEGORYPRODUCTS_DISPLAY_PRODUCTS','16','2026-11-23 15:01:57','2026-11-23 15:01:57'),(375,NULL,NULL,'CONF_PS_CHECKOUT_FIXED','0.2','2026-11-23 15:02:05','2026-11-23 15:02:05'),(376,NULL,NULL,'CONF_PS_CHECKOUT_VAR','2','2026-11-23 15:02:05','2026-11-23 15:02:05'),(377,NULL,NULL,'CONF_PS_CHECKOUT_FIXED_FOREIGN','0.2','2026-11-23 15:02:05','2026-11-23 15:02:05'),(378,NULL,NULL,'CONF_PS_CHECKOUT_VAR_FOREIGN','2','2026-11-23 15:02:05','2026-11-23 15:02:05'),(379,NULL,NULL,'PS_CHECKOUT_INTENT','CAPTURE','2026-11-23 15:02:05','2026-11-23 15:02:05'),(380,NULL,NULL,'PS_CHECKOUT_MODE','LIVE','2026-11-23 15:02:05','2026-11-23 15:02:05'),(381,NULL,NULL,'PS_CHECKOUT_PAYPAL_ID_MERCHANT',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(382,NULL,NULL,'PS_CHECKOUT_PAYPAL_EMAIL_MERCHANT',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(383,NULL,NULL,'PS_CHECKOUT_PAYPAL_EMAIL_STATUS',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(384,NULL,NULL,'PS_CHECKOUT_PAYPAL_PAYMENT_STATUS',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(385,NULL,NULL,'PS_CHECKOUT_CARD_PAYMENT_STATUS',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(386,NULL,NULL,'PS_CHECKOUT_CARD_PAYMENT_ENABLED','1','2026-11-23 15:02:05','2026-11-23 15:02:05'),(387,NULL,NULL,'PS_CHECKOUT_EC_ORDER_PAGE',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(388,NULL,NULL,'PS_CHECKOUT_EC_CHECKOUT_PAGE',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(389,NULL,NULL,'PS_CHECKOUT_EC_PRODUCT_PAGE',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(390,NULL,NULL,'PS_CHECKOUT_PAY_IN_4X_PRODUCT_PAGE',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(391,NULL,NULL,'PS_CHECKOUT_PAY_IN_4X_ORDER_PAGE',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(392,NULL,NULL,'PS_CHECKOUT_PAYPAL_CB_INLINE',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(393,NULL,NULL,'PS_CHECKOUT_LOGGER_MAX_FILES','30','2026-11-23 15:02:05','2026-11-23 15:02:05'),(394,NULL,NULL,'PS_CHECKOUT_LOGGER_LEVEL','100','2026-11-23 15:02:05','2026-11-23 15:02:05'),(395,NULL,NULL,'PS_CHECKOUT_LOGGER_HTTP','1','2026-11-23 15:02:05','2026-11-23 15:02:05'),(396,NULL,NULL,'PS_CHECKOUT_INTEGRATION_DATE','2024-04-01','2026-11-23 15:02:05','2026-11-23 15:02:05'),(397,NULL,NULL,'PS_CHECKOUT_WEBHOOK_SECRET',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(398,NULL,NULL,'PS_CHECKOUT_DISPLAY_LOGO_PRODUCT','1','2026-11-23 15:02:05','2026-11-23 15:02:05'),(399,NULL,NULL,'PS_CHECKOUT_DISPLAY_LOGO_CART','1','2026-11-23 15:02:05','2026-11-23 15:02:05'),(400,NULL,NULL,'PS_CHECKOUT_HOSTED_FIELDS_CONTINGENCIES','SCA_WHEN_REQUIRED','2026-11-23 15:02:05','2026-11-23 15:02:05'),(401,NULL,NULL,'PS_CHECKOUT_PAYPAL_BUTTON','{\"shape\":\"pill\",\"label\":\"pay\",\"color\":\"gold\"}','2026-11-23 15:02:05','2026-11-23 15:02:05'),(402,NULL,NULL,'PS_CHECKOUT_AUTHORIZE_STATES',NULL,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(403,NULL,NULL,'PS_CHECKOUT_PAY_LATER_CONFIG','{\"cart\":{\"placement\":\"cart\",\"status\":\"enabled\",\"layout\":\"text\",\"logo-type\":\"inline\",\"text-color\":\"black\",\"text-size\":\"12\"},\"category\":{\"placement\":\"category\",\"status\":\"disabled\",\"color\":\"white\",\"layout\":\"flex\",\"ratio\":\"8x1\"},\"checkout\":{\"placement\":\"checkout\",\"status\":\"enabled\",\"layout\":\"text\",\"logo-type\":\"inline\",\"text-color\":\"black\",\"text-size\":\"12\"},\"homepage\":{\"placement\":\"homepage\",\"status\":\"disabled\",\"color\":\"white\",\"layout\":\"flex\",\"ratio\":\"8x1\"},\"product\":{\"placement\":\"product\",\"status\":\"enabled\",\"layout\":\"text\",\"logo-type\":\"inline\",\"text-color\":\"black\",\"text-size\":\"12\"}}','2026-11-23 15:02:05','2026-11-23 15:02:05'),(404,NULL,NULL,'PS_CHECKOUT_STATE_COMPLETED','2','2026-11-23 15:02:06','2026-11-23 15:02:06'),(405,NULL,NULL,'PS_CHECKOUT_STATE_CANCELED','6','2026-11-23 15:02:06','2026-11-23 15:02:06'),(406,NULL,NULL,'PS_CHECKOUT_STATE_ERROR','8','2026-11-23 15:02:06','2026-11-23 15:02:06'),(407,NULL,NULL,'PS_CHECKOUT_STATE_REFUNDED','7','2026-11-23 15:02:06','2026-11-23 15:02:06'),(408,NULL,NULL,'PS_CHECKOUT_STATE_PENDING','14','2026-11-23 15:02:06','2026-11-23 15:02:06'),(409,NULL,NULL,'PS_CHECKOUT_STATE_PARTIALLY_REFUNDED','15','2026-11-23 15:02:06','2026-11-23 15:02:06'),(410,NULL,NULL,'PS_CHECKOUT_STATE_PARTIALLY_PAID','16','2026-11-23 15:02:06','2026-11-23 15:02:06'),(411,NULL,NULL,'PS_CHECKOUT_STATE_AUTHORIZED','17','2026-11-23 15:02:06','2026-11-23 15:02:06'),(412,NULL,NULL,'PS_CHECKOUT_STATE_VOIDED','18','2026-11-23 15:02:06','2026-11-23 15:02:06'),(413,NULL,NULL,'CONF_PS_CHECKPAYMENT_FIXED','0.2','2026-11-23 15:02:07','2026-11-23 15:02:07'),(414,NULL,NULL,'CONF_PS_CHECKPAYMENT_VAR','2','2026-11-23 15:02:07','2026-11-23 15:02:07'),(415,NULL,NULL,'CONF_PS_CHECKPAYMENT_FIXED_FOREIGN','0.2','2026-11-23 15:02:07','2026-11-23 15:02:07'),(416,NULL,NULL,'CONF_PS_CHECKPAYMENT_VAR_FOREIGN','2','2026-11-23 15:02:07','2026-11-23 15:02:07'),(417,NULL,NULL,'PS_SETUP_GUIDE_MODAL_IS_HIDDEN','1','2026-11-23 15:02:07','2026-11-23 15:02:07'),(418,NULL,NULL,'PS_CONTACT_INFO_DISPLAY_EMAIL','1','2026-11-23 15:02:07','2026-11-23 15:02:07'),(419,NULL,NULL,'CROSSSELLING_DISPLAY_PRICE','1','2026-11-23 15:02:08','2026-11-23 15:02:08'),(420,NULL,NULL,'CROSSSELLING_NBR','8','2026-11-23 15:02:08','2026-11-23 15:02:08'),(421,NULL,NULL,'CUSTPRIV_MSG_AUTH',NULL,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(422,NULL,NULL,'MA_MERCHANT_ORDER','1','2026-11-23 15:02:10','2026-11-23 15:02:10'),(423,NULL,NULL,'MA_MERCHANT_OOS','1','2026-11-23 15:02:10','2026-11-23 15:02:10'),(424,NULL,NULL,'MA_CUSTOMER_QTY','1','2026-11-23 15:02:10','2026-11-23 15:02:10'),(425,NULL,NULL,'MA_ORDER_EDIT','1','2026-11-23 15:02:10','2026-11-23 15:02:10'),(426,NULL,NULL,'MA_RETURN_SLIP','1','2026-11-23 15:02:10','2026-11-23 15:02:10'),(427,NULL,NULL,'MA_MERCHANT_MAILS','ecommerceplenger@gmail.com','2026-11-23 15:02:10','2026-11-23 15:02:10'),(428,NULL,NULL,'MA_LAST_QTIES','3','2026-11-23 15:02:10','2026-11-23 15:02:10'),(429,NULL,NULL,'MA_MERCHANT_COVERAGE','0','2026-11-23 15:02:10','2026-11-23 15:02:10'),(430,NULL,NULL,'MA_PRODUCT_COVERAGE','0','2026-11-23 15:02:10','2026-11-23 15:02:10'),(431,NULL,NULL,'PS_NEWSLETTER_RAND','1858619761875950919','2026-11-23 15:02:10','2026-11-23 15:02:10'),(432,NULL,NULL,'NW_CONDITIONS',NULL,'2026-11-23 15:02:10','2026-11-23 15:02:10'),(433,NULL,NULL,'NW_VERIFICATION_EMAIL','0','2026-11-23 15:02:10','2026-11-23 15:02:10'),(434,NULL,NULL,'NW_CONFIRMATION_EMAIL','0','2026-11-23 15:02:10','2026-11-23 15:02:10'),(435,NULL,NULL,'NW_VOUCHER_CODE',NULL,'2026-11-23 15:02:10','2026-11-23 15:02:10'),(436,NULL,NULL,'0','PS_FACEBOOK_PIXEL_ID','2026-11-23 15:02:14','2026-11-23 15:02:14'),(437,NULL,NULL,'1','PS_FACEBOOK_ACCESS_TOKEN','2026-11-23 15:02:14','2026-11-23 15:02:14'),(438,NULL,NULL,'2','PS_FACEBOOK_PROFILES','2026-11-23 15:02:14','2026-11-23 15:02:14'),(439,NULL,NULL,'3','PS_FACEBOOK_PAGES','2026-11-23 15:02:14','2026-11-23 15:02:14'),(440,NULL,NULL,'4','PS_FACEBOOK_BUSINESS_MANAGER_ID','2026-11-23 15:02:14','2026-11-23 15:02:14'),(441,NULL,NULL,'5','PS_FACEBOOK_AD_ACCOUNT_ID','2026-11-23 15:02:14','2026-11-23 15:02:14'),(442,NULL,NULL,'6','PS_FACEBOOK_CATALOG_ID','2026-11-23 15:02:14','2026-11-23 15:02:14'),(443,NULL,NULL,'7','PS_FACEBOOK_EXTERNAL_BUSINESS_ID','2026-11-23 15:02:14','2026-11-23 15:02:14'),(444,NULL,NULL,'8','PS_FACEBOOK_PIXEL_ENABLED','2026-11-23 15:02:14','2026-11-23 15:02:14'),(445,NULL,NULL,'9','PS_FACEBOOK_PRODUCT_SYNC_FIRST_START','2026-11-23 15:02:14','2026-11-23 15:02:14'),(446,NULL,NULL,'10','PS_FACEBOOK_PRODUCT_SYNC_ON','2026-11-23 15:02:14','2026-11-23 15:02:14'),(455,NULL,NULL,'PS_USE_JQUERY_UI_SLIDER','1','2026-11-23 15:02:16','2026-11-23 15:02:16'),(456,NULL,NULL,'PS_LAYERED_DEFAULT_CATEGORY_TEMPLATE','0','2026-11-23 15:02:16','2026-11-23 15:02:16'),(459,NULL,NULL,'CHECKBOX_ORDER','1','2026-11-23 15:02:17','2026-11-23 15:02:17'),(460,NULL,NULL,'CHECKBOX_CUSTOMER','1','2026-11-23 15:02:17','2026-11-23 15:02:17'),(461,NULL,NULL,'CHECKBOX_MESSAGE','1','2026-11-23 15:02:17','2026-11-23 15:02:17'),(462,NULL,NULL,'BACKGROUND_COLOR_FAVICONBO','#DF0067','2026-11-23 15:02:17','2026-11-23 15:02:17'),(463,NULL,NULL,'TEXT_COLOR_FAVICONBO','#FFFFFF','2026-11-23 15:02:17','2026-11-23 15:02:17'),(464,NULL,NULL,'HOME_FEATURED_CAT','2','2026-11-23 15:02:17','2026-11-23 15:02:17'),(465,NULL,NULL,'HOME_FEATURED_RANDOMIZE',NULL,'2026-11-23 15:02:17','2026-11-23 15:02:17'),(466,NULL,NULL,'GA_CANCELLED_STATES','[\"6\"]','2026-11-23 15:02:17','2026-11-23 15:02:17'),(467,NULL,NULL,'GA_BACKLOAD_ENABLED',NULL,'2026-11-23 15:02:18','2026-11-23 15:02:18'),(468,NULL,NULL,'GA_BACKLOAD_DAYS','30','2026-11-23 15:02:18','2026-11-23 15:02:18'),(469,NULL,NULL,'HOMESLIDER_PAUSE_ON_HOVER','1','2026-11-23 15:02:18','2026-11-23 15:02:18'),(470,NULL,NULL,'HOMESLIDER_WRAP','1','2026-11-23 15:02:18','2026-11-23 15:02:18'),(471,NULL,NULL,'PS_MCP_SERVER_STARTED','1','2026-11-23 15:02:21','2026-11-23 15:02:21'),(472,NULL,NULL,'PS_MCP_SERVER_FIRST_DISCOVERY_DONE',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(473,NULL,NULL,'PS_MCP_SERVER_FEATURES_NEED_DISCOVER','1','2026-11-23 15:02:22','2026-11-23 15:02:22'),(474,NULL,NULL,'PS_MCP_SERVER_NEED_NOTIFY_TOOLS_CHANGED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(475,NULL,NULL,'PS_MCP_SERVER_NEED_NOTIFY_PROMPTS_CHANGED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(476,NULL,NULL,'PS_MCP_SERVER_NEED_NOTIFY_RESOURCES_CHANGED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(477,NULL,NULL,'PS_MCP_SERVER_NEED_NOTIFY_RESOURCE_TEMPLATES_CHANGED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(478,NULL,NULL,'PS_MCP_SERVER_HOT_CACHING_ENABLED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(479,NULL,NULL,'PS_MCP_SERVER_LOGS_ENABLED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(480,NULL,NULL,'PS_MCP_SERVER_CONFIGURATION_URL',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(481,NULL,NULL,'PS_MCP_SERVER_CLOUDSYNC_ALREADY_ONBOARDED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(482,NULL,NULL,'PS_MCP_SERVER_ANON_TRACKING',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(483,NULL,NULL,'PS_MCP_SERVER_ONBOARDING_TRACKED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(484,NULL,NULL,'PS_MCP_SERVER_LLM_CONNECTED_TRACKED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(485,NULL,NULL,'PS_MCP_SERVER_ACCOUNTS_ONBOARDING_TRACKED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(486,NULL,NULL,'PS_MCP_SERVER_AUTH_DISABLED',NULL,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(487,NULL,NULL,'PS_ONE_PAGE_CHECKOUT_ENABLED','0','2026-11-23 15:02:23','2026-11-23 15:02:23'),(488,NULL,NULL,'PS_SC_TWITTER','1','2026-11-23 15:02:23','2026-11-23 15:02:23'),(489,NULL,NULL,'PS_SC_FACEBOOK','1','2026-11-23 15:02:23','2026-11-23 15:02:23'),(490,NULL,NULL,'PS_SC_PINTEREST','1','2026-11-23 15:02:23','2026-11-23 15:02:23'),(491,NULL,NULL,'BLOCKSOCIAL_YOUTUBE',NULL,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(492,NULL,NULL,'BLOCKSOCIAL_PINTEREST',NULL,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(493,NULL,NULL,'BLOCKSOCIAL_VIMEO',NULL,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(494,NULL,NULL,'BLOCKSOCIAL_INSTAGRAM',NULL,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(495,NULL,NULL,'BLOCKSOCIAL_LINKEDIN',NULL,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(496,NULL,NULL,'BLOCKSOCIAL_TIKTOK',NULL,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(497,NULL,NULL,'BLOCKSOCIAL_DISCORD',NULL,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(498,NULL,NULL,'BLOCKSPECIALS_SPECIALS_NBR','8','2026-11-23 15:02:24','2026-11-23 15:02:24'),(499,NULL,NULL,'SUPPLIER_DISPLAY_TYPE','supplier_text','2026-11-23 15:02:24','2026-11-23 15:02:24'),(500,NULL,NULL,'BANK_WIRE_PAYMENT_INVITE','1','2026-11-23 15:02:25','2026-11-23 15:02:25'),(501,NULL,NULL,'CONF_PS_WIREPAYMENT_FIXED','0.2','2026-11-23 15:02:25','2026-11-23 15:02:25'),(502,NULL,NULL,'CONF_PS_WIREPAYMENT_VAR','2','2026-11-23 15:02:25','2026-11-23 15:02:25'),(503,NULL,NULL,'CONF_PS_WIREPAYMENT_FIXED_FOREIGN','0.2','2026-11-23 15:02:25','2026-11-23 15:02:25'),(504,NULL,NULL,'CONF_PS_WIREPAYMENT_VAR_FOREIGN','2','2026-11-23 15:02:25','2026-11-23 15:02:25'),(505,NULL,NULL,'PS_LAYERED_CACHE_ENABLED','1','2026-11-23 15:08:58','2026-11-23 15:08:58'),(506,NULL,NULL,'PS_LAYERED_SHOW_QTIES','1','2026-11-23 15:08:58','2026-11-23 15:08:58'),(507,NULL,NULL,'PS_LAYERED_FULL_TREE','1','2026-11-23 15:08:58','2026-11-23 15:08:58'),(508,NULL,NULL,'PS_LAYERED_FILTER_PRICE_USETAX','1','2026-11-23 15:08:58','2026-11-23 15:08:58'),(509,NULL,NULL,'PS_LAYERED_FILTER_CATEGORY_DEPTH','1','2026-11-23 15:08:58','2026-11-23 15:08:58'),(510,NULL,NULL,'PS_LAYERED_FILTER_PRICE_ROUNDING','1','2026-11-23 15:08:58','2026-11-23 15:08:58'),(511,NULL,NULL,'PS_LAYERED_FILTER_SHOW_OUT_OF_STOCK_LAST','0','2026-11-23 15:08:58','2026-11-23 15:08:58'),(512,NULL,NULL,'PS_LAYERED_FILTER_BY_DEFAULT_CATEGORY','0','2026-11-23 15:08:58','2026-11-23 15:08:58'),(513,NULL,NULL,'PS_LAYERED_INDEXED','1','2026-11-23 15:08:59','2026-11-23 15:08:59'),(514,NULL,NULL,'PS_LAYERED_FILTER_FEATURE_VALUES_USE_POSITION','0','2026-11-23 15:08:59','2026-11-23 15:08:59'),(515,NULL,NULL,'PS_ACCOUNTS_ACCESS_TOKEN',NULL,'2026-11-23 15:14:54','2026-11-23 15:14:54'),(516,NULL,NULL,'PS_PSX_FIREBASE_ID_TOKEN',NULL,'2026-11-23 15:15:30','2026-11-23 15:15:30'),(517,NULL,NULL,'PS_PSX_FIREBASE_REFRESH_TOKEN',NULL,'2026-11-23 15:15:30','2026-11-23 15:15:30'),(518,NULL,NULL,'PS_PSX_FIREBASE_REFRESH_DATE','2026-11-23 15:15:30','2026-11-23 15:15:30','2026-11-23 15:15:30'),(519,NULL,NULL,'PS_ACCOUNTS_FIREBASE_ID_TOKEN',NULL,'2026-11-23 15:15:30','2026-11-23 15:15:30'),(520,NULL,NULL,'PS_ACCOUNTS_FIREBASE_REFRESH_TOKEN',NULL,'2026-11-23 15:15:30','2026-11-23 15:37:03');
/*!40000 ALTER TABLE `ubwbh_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_configuration_kpi`
--

DROP TABLE IF EXISTS `ubwbh_configuration_kpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_configuration_kpi` (
  `id_configuration_kpi` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned DEFAULT NULL,
  `id_shop` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `value` mediumtext DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration_kpi`),
  KEY `name` (`name`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_configuration_kpi`
--

LOCK TABLES `ubwbh_configuration_kpi` WRITE;
/*!40000 ALTER TABLE `ubwbh_configuration_kpi` DISABLE KEYS */;
INSERT INTO `ubwbh_configuration_kpi` VALUES (1,NULL,NULL,'DASHGOALS_TRAFFIC_01_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(2,NULL,NULL,'DASHGOALS_CONVERSION_01_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(3,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_01_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(4,NULL,NULL,'DASHGOALS_TRAFFIC_02_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(5,NULL,NULL,'DASHGOALS_CONVERSION_02_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(6,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_02_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(7,NULL,NULL,'DASHGOALS_TRAFFIC_03_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(8,NULL,NULL,'DASHGOALS_CONVERSION_03_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(9,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_03_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(10,NULL,NULL,'DASHGOALS_TRAFFIC_04_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(11,NULL,NULL,'DASHGOALS_CONVERSION_04_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(12,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_04_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(13,NULL,NULL,'DASHGOALS_TRAFFIC_05_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(14,NULL,NULL,'DASHGOALS_CONVERSION_05_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(15,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_05_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(16,NULL,NULL,'DASHGOALS_TRAFFIC_06_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(17,NULL,NULL,'DASHGOALS_CONVERSION_06_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(18,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_06_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(19,NULL,NULL,'DASHGOALS_TRAFFIC_07_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(20,NULL,NULL,'DASHGOALS_CONVERSION_07_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(21,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_07_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(22,NULL,NULL,'DASHGOALS_TRAFFIC_08_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(23,NULL,NULL,'DASHGOALS_CONVERSION_08_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(24,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_08_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(25,NULL,NULL,'DASHGOALS_TRAFFIC_09_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(26,NULL,NULL,'DASHGOALS_CONVERSION_09_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(27,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_09_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(28,NULL,NULL,'DASHGOALS_TRAFFIC_10_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(29,NULL,NULL,'DASHGOALS_CONVERSION_10_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(30,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_10_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(31,NULL,NULL,'DASHGOALS_TRAFFIC_11_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(32,NULL,NULL,'DASHGOALS_CONVERSION_11_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(33,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_11_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35'),(34,NULL,NULL,'DASHGOALS_TRAFFIC_12_2026','600','2026-11-23 15:01:35','2026-11-23 15:01:35'),(35,NULL,NULL,'DASHGOALS_CONVERSION_12_2026','2','2026-11-23 15:01:35','2026-11-23 15:01:35'),(36,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_12_2026','80','2026-11-23 15:01:35','2026-11-23 15:01:35');
/*!40000 ALTER TABLE `ubwbh_configuration_kpi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_configuration_kpi_lang`
--

DROP TABLE IF EXISTS `ubwbh_configuration_kpi_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_configuration_kpi_lang` (
  `id_configuration_kpi` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` mediumtext DEFAULT NULL,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration_kpi`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_configuration_kpi_lang`
--

LOCK TABLES `ubwbh_configuration_kpi_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_configuration_kpi_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_configuration_kpi_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_configuration_lang`
--

DROP TABLE IF EXISTS `ubwbh_configuration_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_configuration_lang` (
  `id_configuration` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` mediumtext DEFAULT NULL,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_configuration_lang`
--

LOCK TABLES `ubwbh_configuration_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_configuration_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_configuration_lang` VALUES (41,1,'#IN',NULL),(41,2,'#IN',NULL),(44,1,'#DE',NULL),(44,2,'#DE',NULL),(46,1,'#RE',NULL),(46,2,'#RE',NULL),(58,1,'a|about|above|after|again|against|all|am|an|and|any|are|aren|as|at|be|because|been|before|being|below|between|both|but|by|can|cannot|could|couldn|did|didn|do|does|doesn|doing|don|down|during|each|few|for|from|further|had|hadn|has|hasn|have|haven|having|he|ll|her|here|hers|herself|him|himself|his|how|ve|if|in|into|is|isn|it|its|itself|let|me|more|most|mustn|my|myself|no|nor|not|of|off|on|once|only|or|other|ought|our|ours|ourselves|out|over|own|same|shan|she|should|shouldn|so|some|such|than|that|the|their|theirs|them|themselves|then|there|these|they|re|this|those|through|to|too|under|until|up|very|was|wasn|we|were|weren|what|when|where|which|while|who|whom|why|with|won|would|wouldn|you|your|yours|yourself|yourselves',NULL),(58,2,'a|about|above|after|again|against|all|am|an|and|any|are|aren|as|at|be|because|been|before|being|below|between|both|but|by|can|cannot|could|couldn|did|didn|do|does|doesn|doing|don|down|during|each|few|for|from|further|had|hadn|has|hasn|have|haven|having|he|ll|her|here|hers|herself|him|himself|his|how|ve|if|in|into|is|isn|it|its|itself|let|me|more|most|mustn|my|myself|no|nor|not|of|off|on|once|only|or|other|ought|our|ours|ourselves|out|over|own|same|shan|she|should|shouldn|so|some|such|than|that|the|their|theirs|them|themselves|then|there|these|they|re|this|those|through|to|too|under|until|up|very|was|wasn|we|were|weren|what|when|where|which|while|who|whom|why|with|won|would|wouldn|you|your|yours|yourself|yourselves',NULL),(82,1,'Dear Customer,\r\n\r\nRegards,\r\nCustomer service',NULL),(82,2,'Dear Customer,\r\n\r\nRegards,\r\nCustomer service',NULL),(281,1,'We are currently updating our shop and will be back really soon.\r\nThanks for your patience.',NULL),(281,2,'We are currently updating our shop and will be back really soon.\r\nThanks for your patience.',NULL),(283,1,'',NULL),(283,2,'',NULL),(284,1,'',NULL),(284,2,'',NULL),(285,1,'Out-of-Stock',NULL),(285,2,'Stok habis',NULL),(314,1,'My wishlists','2026-11-23 15:01:33'),(314,2,'My wishlists','2026-11-23 15:01:33'),(315,1,'My wishlist','2026-11-23 15:01:33'),(315,2,'My wishlist','2026-11-23 15:01:33'),(316,1,'Create new list','2026-11-23 15:01:34'),(316,2,'Create new list','2026-11-23 15:01:34'),(357,1,'I agree to the terms and conditions and the privacy policy','2026-11-23 15:01:44'),(357,2,'I agree to the terms and conditions and the privacy policy','2026-11-23 15:01:44'),(359,1,'I agree to the terms and conditions and the privacy policy','2026-11-23 15:01:44'),(359,2,'I agree to the terms and conditions and the privacy policy','2026-11-23 15:01:44'),(363,1,'sale70.png','2026-11-23 15:01:55'),(363,2,'sale70.png','2026-11-23 15:01:55'),(364,1,'','2026-11-23 15:01:55'),(364,2,'','2026-11-23 15:01:56'),(365,1,'','2026-11-23 15:01:55'),(365,2,'','2026-11-23 15:01:56'),(421,1,'The personal data you provide is used to answer queries, process orders or allow access to specific information. You have the right to modify and delete all the personal information found in the \"My Account\" page.','2026-11-23 15:02:09'),(421,2,'The personal data you provide is used to answer queries, process orders or allow access to specific information. You have the right to modify and delete all the personal information found in the \"My Account\" page.','2026-11-23 15:02:09'),(432,1,'You may unsubscribe at any moment. For that purpose, please find our contact info in the legal notice.','2026-11-23 15:02:10'),(432,2,'Anda dapat berhenti berlangganan kapan saja. Caranya, temukan informasi kontak kami di halaman aturan penggunaan.','2026-11-23 15:02:10');
/*!40000 ALTER TABLE `ubwbh_configuration_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_connections`
--

DROP TABLE IF EXISTS `ubwbh_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_connections` (
  `id_connections` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT 1,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_guest` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `ip_address` bigint(20) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_connections`),
  KEY `id_guest` (`id_guest`),
  KEY `date_add` (`date_add`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_connections`
--

LOCK TABLES `ubwbh_connections` WRITE;
/*!40000 ALTER TABLE `ubwbh_connections` DISABLE KEYS */;
INSERT INTO `ubwbh_connections` VALUES (1,1,1,1,1,2130706433,'2026-11-23 15:08:50','https://www.prestashop.com'),(2,1,1,3,1,0,'2026-11-23 15:14:14',''),(3,1,1,4,2,0,'2026-11-23 15:19:09',''),(4,1,1,4,2,0,'2026-11-23 15:50:10',''),(5,1,1,4,2,0,'2026-11-23 16:26:13','');
/*!40000 ALTER TABLE `ubwbh_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_connections_page`
--

DROP TABLE IF EXISTS `ubwbh_connections_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_connections_page` (
  `id_connections` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id_connections`,`id_page`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_connections_page`
--

LOCK TABLES `ubwbh_connections_page` WRITE;
/*!40000 ALTER TABLE `ubwbh_connections_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_connections_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_connections_source`
--

DROP TABLE IF EXISTS `ubwbh_connections_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_connections_source` (
  `id_connections_source` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_connections` int(10) unsigned NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_connections_source`),
  KEY `connections` (`id_connections`),
  KEY `orderby` (`date_add`),
  KEY `http_referer` (`http_referer`),
  KEY `request_uri` (`request_uri`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_connections_source`
--

LOCK TABLES `ubwbh_connections_source` WRITE;
/*!40000 ALTER TABLE `ubwbh_connections_source` DISABLE KEYS */;
INSERT INTO `ubwbh_connections_source` VALUES (1,3,'','localhost/bloowing_flower/','','2026-11-23 15:19:09'),(2,3,'','localhost/bloowing_flower/','','2026-11-23 15:30:24'),(3,3,'','localhost/bloowing_flower/','','2026-11-23 15:32:31'),(4,3,'','localhost/bloowing_flower/','','2026-11-23 15:32:51'),(5,3,'','localhost/bloowing_flower/','','2026-11-23 15:44:17'),(6,3,'','localhost/bloowing_flower/','','2026-11-23 15:44:28'),(7,4,'','localhost/bloowing_flower/','','2026-11-23 15:50:10'),(8,4,'','localhost/bloowing_flower/','','2026-11-23 15:58:00'),(9,4,'','localhost/bloowing_flower/','','2026-11-23 15:58:10'),(10,4,'','localhost/bloowing_flower/','','2026-11-23 16:02:32'),(11,4,'','localhost/bloowing_flower/','','2026-11-23 16:03:27'),(12,4,'','localhost/bloowing_flower/','','2026-11-23 16:06:45'),(13,4,'','localhost/bloowing_flower/','','2026-11-23 16:09:26'),(14,5,'','localhost/bloowing_flower/','','2026-11-23 16:26:13');
/*!40000 ALTER TABLE `ubwbh_connections_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_contact`
--

DROP TABLE IF EXISTS `ubwbh_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `customer_service` tinyint(1) NOT NULL DEFAULT 0,
  `position` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_contact`
--

LOCK TABLES `ubwbh_contact` WRITE;
/*!40000 ALTER TABLE `ubwbh_contact` DISABLE KEYS */;
INSERT INTO `ubwbh_contact` VALUES (1,'ecommerceplenger@gmail.com',1,0),(2,'ecommerceplenger@gmail.com',1,0);
/*!40000 ALTER TABLE `ubwbh_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_contact_lang`
--

DROP TABLE IF EXISTS `ubwbh_contact_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_contact_lang` (
  `id_contact` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id_contact`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_contact_lang`
--

LOCK TABLES `ubwbh_contact_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_contact_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_contact_lang` VALUES (1,1,'Webmaster','If a technical problem occurs on this website'),(1,2,'Webmaster','Jika terdapat masalah teknis di website kami'),(2,1,'Customer service','For any question about a product, an order'),(2,2,'Layanan pelanggan','Untuk pertanyaan seputar produk dan pembelian');
/*!40000 ALTER TABLE `ubwbh_contact_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_contact_shop`
--

DROP TABLE IF EXISTS `ubwbh_contact_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_contact_shop` (
  `id_contact` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_contact`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_contact_shop`
--

LOCK TABLES `ubwbh_contact_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_contact_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_contact_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `ubwbh_contact_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_country`
--

DROP TABLE IF EXISTS `ubwbh_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_country` (
  `id_country` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_zone` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL DEFAULT 0,
  `iso_code` varchar(3) NOT NULL,
  `call_prefix` int(10) NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `contains_states` tinyint(1) NOT NULL DEFAULT 0,
  `need_identification_number` tinyint(1) NOT NULL DEFAULT 0,
  `need_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `zip_code_format` varchar(12) NOT NULL DEFAULT '',
  `display_tax_label` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_country`),
  KEY `country_iso_code` (`iso_code`),
  KEY `country_` (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_country`
--

LOCK TABLES `ubwbh_country` WRITE;
/*!40000 ALTER TABLE `ubwbh_country` DISABLE KEYS */;
INSERT INTO `ubwbh_country` VALUES (1,1,0,'DE',49,0,0,0,1,'NNNNN',1),(2,1,0,'AT',43,0,0,0,1,'NNNN',1),(3,1,0,'BE',32,0,0,0,1,'NNNN',1),(4,2,0,'CA',1,0,1,0,1,'LNL NLN',0),(5,3,0,'CN',86,0,0,0,1,'NNNNNN',1),(6,1,0,'ES',34,0,0,1,1,'NNNNN',1),(7,1,0,'FI',358,0,0,0,1,'NNNNN',1),(8,1,0,'FR',33,1,0,0,1,'NNNNN',1),(9,1,0,'GR',30,0,0,0,1,'NNNNN',1),(10,1,0,'IT',39,0,1,0,1,'NNNNN',1),(11,3,0,'JP',81,0,1,0,1,'NNN-NNNN',1),(12,1,0,'LU',352,0,0,0,1,'NNNN',1),(13,1,0,'NL',31,0,0,0,1,'NNNN LL',1),(14,1,0,'PL',48,0,0,0,1,'NN-NNN',1),(15,1,0,'PT',351,0,0,0,1,'NNNN-NNN',1),(16,1,0,'CZ',420,0,0,0,1,'NNN NN',1),(17,7,0,'GB',44,0,0,0,1,'',1),(18,1,0,'SE',46,0,0,0,1,'NNN NN',1),(19,7,0,'CH',41,0,0,0,1,'NNNN',1),(20,1,0,'DK',45,0,0,0,1,'NNNN',1),(21,2,0,'US',1,1,1,0,1,'NNNNN',0),(22,3,0,'HK',852,0,0,0,0,'',1),(23,7,0,'NO',47,0,0,0,1,'NNNN',1),(24,5,0,'AU',61,0,1,0,1,'NNNN',1),(25,3,0,'SG',65,0,0,0,1,'NNNNNN',1),(26,1,0,'IE',353,0,0,0,0,'',1),(27,5,0,'NZ',64,0,0,0,1,'NNNN',1),(28,3,0,'KR',82,0,0,0,1,'NNNNN',1),(29,3,0,'IL',972,0,0,0,1,'NNNNNNN',1),(30,4,0,'ZA',27,0,0,0,1,'NNNN',1),(31,4,0,'NG',234,0,0,0,1,'',1),(32,4,0,'CI',225,0,0,0,1,'',1),(33,4,0,'TG',228,0,0,0,1,'',1),(34,6,0,'BO',591,0,0,0,1,'',1),(35,4,0,'MU',230,0,0,0,1,'',1),(36,1,0,'RO',40,0,0,0,1,'NNNNNN',1),(37,1,0,'SK',421,0,0,0,1,'NNN NN',1),(38,4,0,'DZ',213,0,0,0,1,'NNNNN',1),(39,2,0,'AS',0,0,0,0,1,'',1),(40,7,0,'AD',376,0,0,0,1,'CNNN',1),(41,4,0,'AO',244,0,0,0,0,'',1),(42,8,0,'AI',0,0,0,0,1,'',1),(43,2,0,'AG',0,0,0,0,1,'',1),(44,6,0,'AR',54,0,1,0,1,'LNNNNLLL',1),(45,3,0,'AM',374,0,0,0,1,'NNNN',1),(46,8,0,'AW',297,0,0,0,1,'',1),(47,3,0,'AZ',994,0,0,0,1,'CNNNN',1),(48,2,0,'BS',0,0,0,0,1,'',1),(49,3,0,'BH',973,0,0,0,1,'',1),(50,3,0,'BD',880,0,0,0,1,'NNNN',1),(51,2,0,'BB',0,0,0,0,1,'CNNNNN',1),(52,7,0,'BY',0,0,0,0,1,'NNNNNN',1),(53,8,0,'BZ',501,0,0,0,0,'',1),(54,4,0,'BJ',229,0,0,0,0,'',1),(55,2,0,'BM',0,0,0,0,1,'',1),(56,3,0,'BT',975,0,0,0,1,'',1),(57,4,0,'BW',267,0,0,0,1,'',1),(58,6,0,'BR',55,0,0,0,1,'NNNNN-NNN',1),(59,3,0,'BN',673,0,0,0,1,'LLNNNN',1),(60,4,0,'BF',226,0,0,0,1,'',1),(61,3,0,'MM',95,0,0,0,1,'',1),(62,4,0,'BI',257,0,0,0,1,'',1),(63,3,0,'KH',855,0,0,0,1,'NNNNN',1),(64,4,0,'CM',237,0,0,0,1,'',1),(65,4,0,'CV',238,0,0,0,1,'NNNN',1),(66,4,0,'CF',236,0,0,0,1,'',1),(67,4,0,'TD',235,0,0,0,1,'',1),(68,6,0,'CL',56,0,0,0,1,'NNN-NNNN',1),(69,6,0,'CO',57,0,0,0,1,'NNNNNN',1),(70,4,0,'KM',269,0,0,0,1,'',1),(71,4,0,'CD',243,0,0,0,1,'',1),(72,4,0,'CG',242,0,0,0,1,'',1),(73,8,0,'CR',506,0,0,0,1,'NNNNN',1),(74,1,0,'HR',385,0,0,0,1,'NNNNN',1),(75,8,0,'CU',53,0,0,0,1,'',1),(76,1,0,'CY',357,0,0,0,1,'NNNN',1),(77,4,0,'DJ',253,0,0,0,1,'',1),(78,8,0,'DM',0,0,0,0,1,'',1),(79,8,0,'DO',0,0,0,0,1,'',1),(80,3,0,'TL',670,0,0,0,1,'',1),(81,6,0,'EC',593,0,0,0,1,'CNNNNNN',1),(82,4,0,'EG',20,0,0,0,1,'NNNNN',1),(83,8,0,'SV',503,0,0,0,1,'',1),(84,4,0,'GQ',240,0,0,0,1,'',1),(85,4,0,'ER',291,0,0,0,1,'',1),(86,1,0,'EE',372,0,0,0,1,'NNNNN',1),(87,4,0,'ET',251,0,0,0,1,'',1),(88,8,0,'FK',0,0,0,0,1,'LLLL NLL',1),(89,7,0,'FO',298,0,0,0,1,'',1),(90,5,0,'FJ',679,0,0,0,1,'',1),(91,4,0,'GA',241,0,0,0,1,'',1),(92,4,0,'GM',220,0,0,0,1,'',1),(93,3,0,'GE',995,0,0,0,1,'NNNN',1),(94,4,0,'GH',233,0,0,0,1,'',1),(95,8,0,'GD',0,0,0,0,1,'',1),(96,7,0,'GL',299,0,0,0,1,'',1),(97,7,0,'GI',350,0,0,0,1,'',1),(98,8,0,'GP',590,0,0,0,1,'',1),(99,5,0,'GU',0,0,0,0,1,'',1),(100,8,0,'GT',502,0,0,0,1,'',1),(101,7,0,'GG',0,0,0,0,1,'LLN NLL',1),(102,4,0,'GN',224,0,0,0,1,'',1),(103,4,0,'GW',245,0,0,0,1,'',1),(104,6,0,'GY',592,0,0,0,1,'',1),(105,8,0,'HT',509,0,0,0,1,'',1),(106,7,0,'VA',379,0,0,0,1,'NNNNN',1),(107,8,0,'HN',504,0,0,0,1,'',1),(108,7,0,'IS',354,0,0,0,1,'NNN',1),(109,3,0,'IN',91,0,1,0,1,'NNN NNN',1),(110,3,0,'ID',62,1,1,0,1,'NNNNN',1),(111,3,0,'IR',98,0,0,0,1,'NNNNN-NNNNN',1),(112,3,0,'IQ',964,0,0,0,1,'NNNNN',1),(113,7,0,'IM',0,0,0,0,1,'CN NLL',1),(114,8,0,'JM',0,0,0,0,1,'',1),(115,7,0,'JE',0,0,0,0,1,'CN NLL',1),(116,3,0,'JO',962,0,0,0,1,'',1),(117,3,0,'KZ',7,0,0,0,1,'NNNNNN',1),(118,4,0,'KE',254,0,0,0,1,'',1),(119,5,0,'KI',686,0,0,0,1,'',1),(120,3,0,'KP',850,0,0,0,1,'',1),(121,3,0,'KW',965,0,0,0,1,'',1),(122,3,0,'KG',996,0,0,0,1,'',1),(123,3,0,'LA',856,0,0,0,1,'',1),(124,1,0,'LV',371,0,0,0,1,'C-NNNN',1),(125,3,0,'LB',961,0,0,0,1,'',1),(126,4,0,'LS',266,0,0,0,1,'',1),(127,4,0,'LR',231,0,0,0,1,'',1),(128,4,0,'LY',218,0,0,0,1,'',1),(129,7,0,'LI',423,0,0,0,1,'NNNN',1),(130,1,0,'LT',370,0,0,0,1,'NNNNN',1),(131,3,0,'MO',853,0,0,0,0,'',1),(132,7,0,'MK',389,0,0,0,1,'',1),(133,4,0,'MG',261,0,0,0,1,'',1),(134,4,0,'MW',265,0,0,0,1,'',1),(135,3,0,'MY',60,0,0,0,1,'NNNNN',1),(136,3,0,'MV',960,0,0,0,1,'',1),(137,4,0,'ML',223,0,0,0,1,'',1),(138,1,0,'MT',356,0,0,0,1,'LLL NNNN',1),(139,5,0,'MH',692,0,0,0,1,'',1),(140,8,0,'MQ',596,0,0,0,1,'',1),(141,4,0,'MR',222,0,0,0,1,'',1),(142,1,0,'HU',36,0,0,0,1,'NNNN',1),(143,4,0,'YT',262,0,0,0,1,'',1),(144,2,0,'MX',52,0,1,1,1,'NNNNN',1),(145,5,0,'FM',691,0,0,0,1,'',1),(146,7,0,'MD',373,0,0,0,1,'C-NNNN',1),(147,7,0,'MC',377,0,0,0,1,'980NN',1),(148,3,0,'MN',976,0,0,0,1,'',1),(149,7,0,'ME',382,0,0,0,1,'NNNNN',1),(150,8,0,'MS',0,0,0,0,1,'',1),(151,4,0,'MA',212,0,0,0,1,'NNNNN',1),(152,4,0,'MZ',258,0,0,0,1,'',1),(153,4,0,'NA',264,0,0,0,1,'',1),(154,5,0,'NR',674,0,0,0,1,'',1),(155,3,0,'NP',977,0,0,0,1,'',1),(156,5,0,'NC',687,0,0,0,1,'',1),(157,8,0,'NI',505,0,0,0,1,'NNNNNN',1),(158,4,0,'NE',227,0,0,0,1,'',1),(159,5,0,'NU',683,0,0,0,1,'',1),(160,5,0,'NF',0,0,0,0,1,'',1),(161,5,0,'MP',0,0,0,0,1,'',1),(162,3,0,'OM',968,0,0,0,1,'',1),(163,3,0,'PK',92,0,0,0,1,'',1),(164,5,0,'PW',680,0,0,0,1,'',1),(165,3,0,'PS',0,0,0,0,1,'',1),(166,8,0,'PA',507,0,0,0,1,'NNNNNN',1),(167,5,0,'PG',675,0,0,0,1,'',1),(168,6,0,'PY',595,0,0,0,1,'',1),(169,6,0,'PE',51,0,0,0,1,'',1),(170,3,0,'PH',63,0,0,0,1,'NNNN',1),(171,5,0,'PN',0,0,0,0,1,'LLLL NLL',1),(172,8,0,'PR',0,0,0,0,1,'NNNNN',1),(173,3,0,'QA',974,0,0,0,1,'',1),(174,4,0,'RE',262,0,0,0,1,'',1),(175,7,0,'RU',7,0,0,0,1,'NNNNNN',1),(176,4,0,'RW',250,0,0,0,1,'',1),(177,8,0,'BL',0,0,0,0,1,'',1),(178,8,0,'KN',0,0,0,0,1,'',1),(179,8,0,'LC',0,0,0,0,1,'',1),(180,8,0,'MF',0,0,0,0,1,'',1),(181,8,0,'PM',508,0,0,0,1,'',1),(182,8,0,'VC',0,0,0,0,1,'',1),(183,5,0,'WS',685,0,0,0,1,'',1),(184,7,0,'SM',378,0,0,0,1,'NNNNN',1),(185,4,0,'ST',239,0,0,0,1,'',1),(186,3,0,'SA',966,0,0,0,1,'',1),(187,4,0,'SN',221,0,0,0,1,'',1),(188,7,0,'RS',381,0,0,0,1,'NNNNN',1),(189,4,0,'SC',248,0,0,0,1,'',1),(190,4,0,'SL',232,0,0,0,1,'',1),(191,1,0,'SI',386,0,0,0,1,'C-NNNN',1),(192,5,0,'SB',677,0,0,0,1,'',1),(193,4,0,'SO',252,0,0,0,1,'',1),(194,8,0,'GS',0,0,0,0,1,'LLLL NLL',1),(195,3,0,'LK',94,0,0,0,1,'NNNNN',1),(196,4,0,'SD',249,0,0,0,1,'',1),(197,8,0,'SR',597,0,0,0,1,'',1),(198,7,0,'SJ',0,0,0,0,1,'',1),(199,4,0,'SZ',268,0,0,0,1,'',1),(200,3,0,'SY',963,0,0,0,1,'',1),(201,3,0,'TW',886,0,0,0,1,'NNNNN',1),(202,3,0,'TJ',992,0,0,0,1,'',1),(203,4,0,'TZ',255,0,0,0,1,'',1),(204,3,0,'TH',66,0,0,0,1,'NNNNN',1),(205,5,0,'TK',690,0,0,0,1,'',1),(206,5,0,'TO',676,0,0,0,1,'',1),(207,6,0,'TT',0,0,0,0,1,'',1),(208,4,0,'TN',216,0,0,0,1,'',1),(209,7,0,'TR',90,0,0,0,1,'NNNNN',1),(210,3,0,'TM',993,0,0,0,1,'',1),(211,8,0,'TC',0,0,0,0,1,'LLLL NLL',1),(212,5,0,'TV',688,0,0,0,1,'',1),(213,4,0,'UG',256,0,0,0,1,'',1),(214,7,0,'UA',380,0,0,0,1,'NNNNN',1),(215,3,0,'AE',971,0,0,0,1,'',1),(216,6,0,'UY',598,0,0,0,1,'',1),(217,3,0,'UZ',998,0,0,0,1,'',1),(218,5,0,'VU',678,0,0,0,1,'',1),(219,6,0,'VE',58,0,0,0,1,'',1),(220,3,0,'VN',84,0,0,0,1,'NNNNNN',1),(221,2,0,'VG',0,0,0,0,1,'CNNNN',1),(222,2,0,'VI',0,0,0,0,1,'',1),(223,5,0,'WF',681,0,0,0,1,'',1),(224,4,0,'EH',0,0,0,0,1,'',1),(225,3,0,'YE',967,0,0,0,1,'',1),(226,4,0,'ZM',260,0,0,0,1,'',1),(227,4,0,'ZW',263,0,0,0,1,'',1),(228,7,0,'AL',355,0,0,0,1,'NNNN',1),(229,3,0,'AF',93,0,0,0,1,'NNNN',1),(230,5,0,'AQ',0,0,0,0,1,'',1),(231,7,0,'BA',387,0,0,0,1,'',1),(232,5,0,'IO',0,0,0,0,1,'LLLL NLL',1),(233,1,0,'BG',359,0,0,0,1,'NNNN',1),(234,8,0,'KY',0,0,0,0,1,'',1),(235,3,0,'CX',0,0,0,0,1,'',1),(236,3,0,'CC',0,0,0,0,1,'',1),(237,5,0,'CK',682,0,0,0,1,'',1),(238,6,0,'GF',594,0,0,0,1,'',1),(239,5,0,'PF',689,0,0,0,1,'',1),(240,5,0,'TF',0,0,0,0,1,'',1),(241,7,0,'AX',0,0,0,0,1,'NNNNN',1);
/*!40000 ALTER TABLE `ubwbh_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_country_lang`
--

DROP TABLE IF EXISTS `ubwbh_country_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_country_lang` (
  `id_country` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_country`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_country_lang`
--

LOCK TABLES `ubwbh_country_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_country_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_country_lang` VALUES (1,1,'Germany'),(1,2,'Jerman'),(2,1,'Austria'),(2,2,'Austria'),(3,1,'Belgium'),(3,2,'Belgia'),(4,1,'Canada'),(4,2,'Kanada'),(5,1,'China'),(5,2,'Tiongkok'),(6,1,'Spain'),(6,2,'Spanyol'),(7,1,'Finland'),(7,2,'Finlandia'),(8,1,'France'),(8,2,'Prancis'),(9,1,'Greece'),(9,2,'Yunani'),(10,1,'Italy'),(10,2,'Italia'),(11,1,'Japan'),(11,2,'Jepang'),(12,1,'Luxembourg'),(12,2,'Luksemburg'),(13,1,'Netherlands'),(13,2,'Belanda'),(14,1,'Poland'),(14,2,'Polandia'),(15,1,'Portugal'),(15,2,'Portugal'),(16,1,'Czechia'),(16,2,'Ceko'),(17,1,'United Kingdom'),(17,2,'Inggris Raya'),(18,1,'Sweden'),(18,2,'Swedia'),(19,1,'Switzerland'),(19,2,'Swiss'),(20,1,'Denmark'),(20,2,'Denmark'),(21,1,'United States'),(21,2,'Amerika Serikat'),(22,1,'Hong Kong SAR China'),(22,2,'Hong Kong DAK Tiongkok'),(23,1,'Norway'),(23,2,'Norwegia'),(24,1,'Australia'),(24,2,'Australia'),(25,1,'Singapore'),(25,2,'Singapura'),(26,1,'Ireland'),(26,2,'Irlandia'),(27,1,'New Zealand'),(27,2,'Selandia Baru'),(28,1,'South Korea'),(28,2,'Korea Selatan'),(29,1,'Israel'),(29,2,'Israel'),(30,1,'South Africa'),(30,2,'Afrika Selatan'),(31,1,'Nigeria'),(31,2,'Nigeria'),(32,1,'Côte d’Ivoire'),(32,2,'Côte d’Ivoire'),(33,1,'Togo'),(33,2,'Togo'),(34,1,'Bolivia'),(34,2,'Bolivia'),(35,1,'Mauritius'),(35,2,'Mauritius'),(36,1,'Romania'),(36,2,'Rumania'),(37,1,'Slovakia'),(37,2,'Slovakia'),(38,1,'Algeria'),(38,2,'Aljazair'),(39,1,'American Samoa'),(39,2,'Samoa Amerika'),(40,1,'Andorra'),(40,2,'Andorra'),(41,1,'Angola'),(41,2,'Angola'),(42,1,'Anguilla'),(42,2,'Anguilla'),(43,1,'Antigua & Barbuda'),(43,2,'Antigua dan Barbuda'),(44,1,'Argentina'),(44,2,'Argentina'),(45,1,'Armenia'),(45,2,'Armenia'),(46,1,'Aruba'),(46,2,'Aruba'),(47,1,'Azerbaijan'),(47,2,'Azerbaijan'),(48,1,'Bahamas'),(48,2,'Bahama'),(49,1,'Bahrain'),(49,2,'Bahrain'),(50,1,'Bangladesh'),(50,2,'Bangladesh'),(51,1,'Barbados'),(51,2,'Barbados'),(52,1,'Belarus'),(52,2,'Belarus'),(53,1,'Belize'),(53,2,'Belize'),(54,1,'Benin'),(54,2,'Benin'),(55,1,'Bermuda'),(55,2,'Bermuda'),(56,1,'Bhutan'),(56,2,'Bhutan'),(57,1,'Botswana'),(57,2,'Botswana'),(58,1,'Brazil'),(58,2,'Brasil'),(59,1,'Brunei'),(59,2,'Brunei Darussalam'),(60,1,'Burkina Faso'),(60,2,'Burkina Faso'),(61,1,'Myanmar (Burma)'),(61,2,'Myanmar (Burma)'),(62,1,'Burundi'),(62,2,'Burundi'),(63,1,'Cambodia'),(63,2,'Kamboja'),(64,1,'Cameroon'),(64,2,'Kamerun'),(65,1,'Cape Verde'),(65,2,'Tanjung Verde'),(66,1,'Central African Republic'),(66,2,'Republik Afrika Tengah'),(67,1,'Chad'),(67,2,'Chad'),(68,1,'Chile'),(68,2,'Cile'),(69,1,'Colombia'),(69,2,'Kolombia'),(70,1,'Comoros'),(70,2,'Komoro'),(71,1,'Congo - Kinshasa'),(71,2,'Kongo - Kinshasa'),(72,1,'Congo - Brazzaville'),(72,2,'Kongo - Brazzaville'),(73,1,'Costa Rica'),(73,2,'Kosta Rika'),(74,1,'Croatia'),(74,2,'Kroasia'),(75,1,'Cuba'),(75,2,'Kuba'),(76,1,'Cyprus'),(76,2,'Siprus'),(77,1,'Djibouti'),(77,2,'Jibuti'),(78,1,'Dominica'),(78,2,'Dominika'),(79,1,'Dominican Republic'),(79,2,'Republik Dominika'),(80,1,'Timor-Leste'),(80,2,'Timor Leste'),(81,1,'Ecuador'),(81,2,'Ekuador'),(82,1,'Egypt'),(82,2,'Mesir'),(83,1,'El Salvador'),(83,2,'El Salvador'),(84,1,'Equatorial Guinea'),(84,2,'Guinea Ekuatorial'),(85,1,'Eritrea'),(85,2,'Eritrea'),(86,1,'Estonia'),(86,2,'Estonia'),(87,1,'Ethiopia'),(87,2,'Etiopia'),(88,1,'Falkland Islands'),(88,2,'Kepulauan Falkland'),(89,1,'Faroe Islands'),(89,2,'Kepulauan Faroe'),(90,1,'Fiji'),(90,2,'Fiji'),(91,1,'Gabon'),(91,2,'Gabon'),(92,1,'Gambia'),(92,2,'Gambia'),(93,1,'Georgia'),(93,2,'Georgia'),(94,1,'Ghana'),(94,2,'Ghana'),(95,1,'Grenada'),(95,2,'Grenada'),(96,1,'Greenland'),(96,2,'Greenland'),(97,1,'Gibraltar'),(97,2,'Gibraltar'),(98,1,'Guadeloupe'),(98,2,'Guadeloupe'),(99,1,'Guam'),(99,2,'Guam'),(100,1,'Guatemala'),(100,2,'Guatemala'),(101,1,'Guernsey'),(101,2,'Guernsey'),(102,1,'Guinea'),(102,2,'Guinea'),(103,1,'Guinea-Bissau'),(103,2,'Guinea-Bissau'),(104,1,'Guyana'),(104,2,'Guyana'),(105,1,'Haiti'),(105,2,'Haiti'),(106,1,'Vatican City'),(106,2,'Vatikan'),(107,1,'Honduras'),(107,2,'Honduras'),(108,1,'Iceland'),(108,2,'Islandia'),(109,1,'India'),(109,2,'India'),(110,1,'Indonesia'),(110,2,'Indonesia'),(111,1,'Iran'),(111,2,'Iran'),(112,1,'Iraq'),(112,2,'Irak'),(113,1,'Isle of Man'),(113,2,'Pulau Man'),(114,1,'Jamaica'),(114,2,'Jamaika'),(115,1,'Jersey'),(115,2,'Jersey'),(116,1,'Jordan'),(116,2,'Yordania'),(117,1,'Kazakhstan'),(117,2,'Kazakhstan'),(118,1,'Kenya'),(118,2,'Kenya'),(119,1,'Kiribati'),(119,2,'Kiribati'),(120,1,'North Korea'),(120,2,'Korea Utara'),(121,1,'Kuwait'),(121,2,'Kuwait'),(122,1,'Kyrgyzstan'),(122,2,'Kirgizstan'),(123,1,'Laos'),(123,2,'Laos'),(124,1,'Latvia'),(124,2,'Latvia'),(125,1,'Lebanon'),(125,2,'Lebanon'),(126,1,'Lesotho'),(126,2,'Lesotho'),(127,1,'Liberia'),(127,2,'Liberia'),(128,1,'Libya'),(128,2,'Libya'),(129,1,'Liechtenstein'),(129,2,'Liechtenstein'),(130,1,'Lithuania'),(130,2,'Lituania'),(131,1,'Macao SAR China'),(131,2,'Makau DAK Tiongkok'),(132,1,'North Macedonia'),(132,2,'Makedonia Utara'),(133,1,'Madagascar'),(133,2,'Madagaskar'),(134,1,'Malawi'),(134,2,'Malawi'),(135,1,'Malaysia'),(135,2,'Malaysia'),(136,1,'Maldives'),(136,2,'Maladewa'),(137,1,'Mali'),(137,2,'Mali'),(138,1,'Malta'),(138,2,'Malta'),(139,1,'Marshall Islands'),(139,2,'Kepulauan Marshall'),(140,1,'Martinique'),(140,2,'Martinik'),(141,1,'Mauritania'),(141,2,'Mauritania'),(142,1,'Hungary'),(142,2,'Hungaria'),(143,1,'Mayotte'),(143,2,'Mayotte'),(144,1,'Mexico'),(144,2,'Meksiko'),(145,1,'Micronesia'),(145,2,'Mikronesia'),(146,1,'Moldova'),(146,2,'Moldova'),(147,1,'Monaco'),(147,2,'Monako'),(148,1,'Mongolia'),(148,2,'Mongolia'),(149,1,'Montenegro'),(149,2,'Montenegro'),(150,1,'Montserrat'),(150,2,'Montserrat'),(151,1,'Morocco'),(151,2,'Maroko'),(152,1,'Mozambique'),(152,2,'Mozambik'),(153,1,'Namibia'),(153,2,'Namibia'),(154,1,'Nauru'),(154,2,'Nauru'),(155,1,'Nepal'),(155,2,'Nepal'),(156,1,'New Caledonia'),(156,2,'Kaledonia Baru'),(157,1,'Nicaragua'),(157,2,'Nikaragua'),(158,1,'Niger'),(158,2,'Niger'),(159,1,'Niue'),(159,2,'Niue'),(160,1,'Norfolk Island'),(160,2,'Kepulauan Norfolk'),(161,1,'Northern Mariana Islands'),(161,2,'Kepulauan Mariana Utara'),(162,1,'Oman'),(162,2,'Oman'),(163,1,'Pakistan'),(163,2,'Pakistan'),(164,1,'Palau'),(164,2,'Palau'),(165,1,'Palestinian Territories'),(165,2,'Wilayah Palestina'),(166,1,'Panama'),(166,2,'Panama'),(167,1,'Papua New Guinea'),(167,2,'Papua Nugini'),(168,1,'Paraguay'),(168,2,'Paraguay'),(169,1,'Peru'),(169,2,'Peru'),(170,1,'Philippines'),(170,2,'Filipina'),(171,1,'Pitcairn Islands'),(171,2,'Kepulauan Pitcairn'),(172,1,'Puerto Rico'),(172,2,'Puerto Riko'),(173,1,'Qatar'),(173,2,'Qatar'),(174,1,'Réunion'),(174,2,'Réunion'),(175,1,'Russia'),(175,2,'Rusia'),(176,1,'Rwanda'),(176,2,'Rwanda'),(177,1,'St. Barthélemy'),(177,2,'Saint Barthélemy'),(178,1,'St. Kitts & Nevis'),(178,2,'Saint Kitts dan Nevis'),(179,1,'St. Lucia'),(179,2,'Saint Lucia'),(180,1,'St. Martin'),(180,2,'Saint Martin'),(181,1,'St. Pierre & Miquelon'),(181,2,'Saint Pierre dan Miquelon'),(182,1,'St. Vincent & Grenadines'),(182,2,'Saint Vincent dan Grenadine'),(183,1,'Samoa'),(183,2,'Samoa'),(184,1,'San Marino'),(184,2,'San Marino'),(185,1,'São Tomé & Príncipe'),(185,2,'Sao Tome dan Principe'),(186,1,'Saudi Arabia'),(186,2,'Arab Saudi'),(187,1,'Senegal'),(187,2,'Senegal'),(188,1,'Serbia'),(188,2,'Serbia'),(189,1,'Seychelles'),(189,2,'Seychelles'),(190,1,'Sierra Leone'),(190,2,'Sierra Leone'),(191,1,'Slovenia'),(191,2,'Slovenia'),(192,1,'Solomon Islands'),(192,2,'Kepulauan Solomon'),(193,1,'Somalia'),(193,2,'Somalia'),(194,1,'South Georgia & South Sandwich Islands'),(194,2,'Georgia Selatan & Kep. Sandwich Selatan'),(195,1,'Sri Lanka'),(195,2,'Sri Lanka'),(196,1,'Sudan'),(196,2,'Sudan'),(197,1,'Suriname'),(197,2,'Suriname'),(198,1,'Svalbard & Jan Mayen'),(198,2,'Kepulauan Svalbard dan Jan Mayen'),(199,1,'Eswatini'),(199,2,'eSwatini'),(200,1,'Syria'),(200,2,'Suriah'),(201,1,'Taiwan'),(201,2,'Taiwan'),(202,1,'Tajikistan'),(202,2,'Tajikistan'),(203,1,'Tanzania'),(203,2,'Tanzania'),(204,1,'Thailand'),(204,2,'Thailand'),(205,1,'Tokelau'),(205,2,'Tokelau'),(206,1,'Tonga'),(206,2,'Tonga'),(207,1,'Trinidad & Tobago'),(207,2,'Trinidad dan Tobago'),(208,1,'Tunisia'),(208,2,'Tunisia'),(209,1,'Türkiye'),(209,2,'Turki'),(210,1,'Turkmenistan'),(210,2,'Turkmenistan'),(211,1,'Turks & Caicos Islands'),(211,2,'Kepulauan Turks dan Caicos'),(212,1,'Tuvalu'),(212,2,'Tuvalu'),(213,1,'Uganda'),(213,2,'Uganda'),(214,1,'Ukraine'),(214,2,'Ukraina'),(215,1,'United Arab Emirates'),(215,2,'Uni Emirat Arab'),(216,1,'Uruguay'),(216,2,'Uruguay'),(217,1,'Uzbekistan'),(217,2,'Uzbekistan'),(218,1,'Vanuatu'),(218,2,'Vanuatu'),(219,1,'Venezuela'),(219,2,'Venezuela'),(220,1,'Vietnam'),(220,2,'Vietnam'),(221,1,'British Virgin Islands'),(221,2,'Kepulauan Virgin Britania Raya'),(222,1,'U.S. Virgin Islands'),(222,2,'Kepulauan Virgin Amerika Serikat'),(223,1,'Wallis & Futuna'),(223,2,'Kepulauan Wallis dan Futuna'),(224,1,'Western Sahara'),(224,2,'Sahara Barat'),(225,1,'Yemen'),(225,2,'Yaman'),(226,1,'Zambia'),(226,2,'Zambia'),(227,1,'Zimbabwe'),(227,2,'Zimbabwe'),(228,1,'Albania'),(228,2,'Albania'),(229,1,'Afghanistan'),(229,2,'Afganistan'),(230,1,'Antarctica'),(230,2,'Antarktika'),(231,1,'Bosnia & Herzegovina'),(231,2,'Bosnia dan Herzegovina'),(232,1,'British Indian Ocean Territory'),(232,2,'Wilayah Inggris di Samudra Hindia'),(233,1,'Bulgaria'),(233,2,'Bulgaria'),(234,1,'Cayman Islands'),(234,2,'Kepulauan Cayman'),(235,1,'Christmas Island'),(235,2,'Pulau Natal'),(236,1,'Cocos (Keeling) Islands'),(236,2,'Kepulauan Cocos (Keeling)'),(237,1,'Cook Islands'),(237,2,'Kepulauan Cook'),(238,1,'French Guiana'),(238,2,'Guyana Prancis'),(239,1,'French Polynesia'),(239,2,'Polinesia Prancis'),(240,1,'French Southern and Antarctic Lands'),(240,2,'Wilayah Selatan Prancis'),(241,1,'Åland Islands'),(241,2,'Kepulauan Aland');
/*!40000 ALTER TABLE `ubwbh_country_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_country_shop`
--

DROP TABLE IF EXISTS `ubwbh_country_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_country_shop` (
  `id_country` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_country`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_country_shop`
--

LOCK TABLES `ubwbh_country_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_country_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_country_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1);
/*!40000 ALTER TABLE `ubwbh_country_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_currency`
--

DROP TABLE IF EXISTS `ubwbh_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_currency` (
  `id_currency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `numeric_iso_code` varchar(3) DEFAULT NULL,
  `precision` int(2) NOT NULL DEFAULT 6,
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `unofficial` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `modified` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_currency`),
  KEY `currency_iso_code` (`iso_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_currency`
--

LOCK TABLES `ubwbh_currency` WRITE;
/*!40000 ALTER TABLE `ubwbh_currency` DISABLE KEYS */;
INSERT INTO `ubwbh_currency` VALUES (1,'','IDR','360',0,1.000000,0,1,0,0);
/*!40000 ALTER TABLE `ubwbh_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_currency_lang`
--

DROP TABLE IF EXISTS `ubwbh_currency_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_currency_lang` (
  `id_currency` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_currency`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_currency_lang`
--

LOCK TABLES `ubwbh_currency_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_currency_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_currency_lang` VALUES (1,1,'Indonesian Rupiah','Rp',''),(1,2,'Rupiah Indonesia','Rp','');
/*!40000 ALTER TABLE `ubwbh_currency_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_currency_shop`
--

DROP TABLE IF EXISTS `ubwbh_currency_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_currency_shop` (
  `id_currency` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL,
  PRIMARY KEY (`id_currency`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_currency_shop`
--

LOCK TABLES `ubwbh_currency_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_currency_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_currency_shop` VALUES (1,1,1.000000);
/*!40000 ALTER TABLE `ubwbh_currency_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customer`
--

DROP TABLE IF EXISTS `ubwbh_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customer` (
  `id_customer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT 1,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_gender` int(10) unsigned NOT NULL,
  `id_default_group` int(10) unsigned NOT NULL DEFAULT 1,
  `id_lang` int(10) unsigned DEFAULT NULL,
  `id_risk` int(10) unsigned NOT NULL DEFAULT 1,
  `company` varchar(255) DEFAULT NULL,
  `siret` varchar(14) DEFAULT NULL,
  `ape` varchar(6) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT current_timestamp(),
  `birthday` date DEFAULT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ip_registration_newsletter` varchar(15) DEFAULT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `optin` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `website` varchar(128) DEFAULT NULL,
  `outstanding_allow_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `show_public_prices` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `max_payment_days` int(10) unsigned NOT NULL DEFAULT 60,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `note` mediumtext DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `reset_password_token` varchar(40) DEFAULT NULL,
  `reset_password_validity` datetime DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `customer_email` (`email`),
  KEY `customer_login` (`email`,`passwd`),
  KEY `id_customer_passwd` (`id_customer`,`passwd`),
  KEY `id_gender` (`id_gender`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop` (`id_shop`,`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customer`
--

LOCK TABLES `ubwbh_customer` WRITE;
/*!40000 ALTER TABLE `ubwbh_customer` DISABLE KEYS */;
INSERT INTO `ubwbh_customer` VALUES (1,1,1,1,3,1,0,'','','','Anonymous','Anonymous','anonymous@psgdpr.com','$2y$10$bSJl6pNu8R1pqzlstwtfwuEce18NqyDsdBF3CaUj/OQBx4ODuSU2m','2026-11-23 02:01:45','0000-00-00',0,'','0000-00-00 00:00:00',0,'',0.000000,0,0,'092891e3cd59714803dbafcbf974cdcd','',0,0,0,'2026-11-23 15:01:45','2026-11-23 15:01:45','','0000-00-00 00:00:00'),(2,1,1,1,3,1,0,'','','','John','DOE','pub@prestashop.com','$2y$10$MrV1D7bwjdwYm1mE0lZ.z.fbV2UNR0ITfFVgiIJNF2bbvYhnm3JkK','2026-11-23 02:08:46','1970-01-15',0,'','0000-00-00 00:00:00',0,'',0.000000,0,0,'00eb9736815821dc0109a041e408ade0','',1,0,0,'2026-11-23 15:08:46','2026-11-23 15:08:46','','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ubwbh_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customer_b2b`
--

DROP TABLE IF EXISTS `ubwbh_customer_b2b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customer_b2b` (
  `id_customer_b2b` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `status` enum('pending','active','rejected') NOT NULL DEFAULT 'pending',
  `external_ref` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_customer_b2b`),
  UNIQUE KEY `uniq_customer_b2b_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customer_b2b`
--

LOCK TABLES `ubwbh_customer_b2b` WRITE;
/*!40000 ALTER TABLE `ubwbh_customer_b2b` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_customer_b2b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customer_group`
--

DROP TABLE IF EXISTS `ubwbh_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customer_group` (
  `id_customer` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`id_group`),
  KEY `customer_login` (`id_group`),
  KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customer_group`
--

LOCK TABLES `ubwbh_customer_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_customer_group` DISABLE KEYS */;
INSERT INTO `ubwbh_customer_group` VALUES (1,3),(2,3);
/*!40000 ALTER TABLE `ubwbh_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customer_message`
--

DROP TABLE IF EXISTS `ubwbh_customer_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customer_message` (
  `id_customer_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer_thread` int(11) DEFAULT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned DEFAULT NULL,
  `message` mediumtext NOT NULL,
  `file_name` varchar(18) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `private` tinyint(4) NOT NULL DEFAULT 0,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_customer_message`),
  KEY `id_customer_thread` (`id_customer_thread`),
  KEY `id_employee` (`id_employee`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customer_message`
--

LOCK TABLES `ubwbh_customer_message` WRITE;
/*!40000 ALTER TABLE `ubwbh_customer_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_customer_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customer_message_sync_imap`
--

DROP TABLE IF EXISTS `ubwbh_customer_message_sync_imap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customer_message_sync_imap` (
  `md5_header` varbinary(32) NOT NULL,
  KEY `md5_header_index` (`md5_header`(4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customer_message_sync_imap`
--

LOCK TABLES `ubwbh_customer_message_sync_imap` WRITE;
/*!40000 ALTER TABLE `ubwbh_customer_message_sync_imap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_customer_message_sync_imap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customer_session`
--

DROP TABLE IF EXISTS `ubwbh_customer_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customer_session` (
  `id_customer_session` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customer_session`
--

LOCK TABLES `ubwbh_customer_session` WRITE;
/*!40000 ALTER TABLE `ubwbh_customer_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_customer_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customer_thread`
--

DROP TABLE IF EXISTS `ubwbh_customer_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customer_thread` (
  `id_customer_thread` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_lang` int(10) unsigned NOT NULL,
  `id_contact` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned DEFAULT NULL,
  `status` enum('open','closed','pending1','pending2') NOT NULL DEFAULT 'open',
  `email` varchar(255) NOT NULL,
  `token` varchar(12) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer_thread`),
  KEY `id_shop` (`id_shop`),
  KEY `id_lang` (`id_lang`),
  KEY `id_contact` (`id_contact`),
  KEY `id_customer` (`id_customer`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customer_thread`
--

LOCK TABLES `ubwbh_customer_thread` WRITE;
/*!40000 ALTER TABLE `ubwbh_customer_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_customer_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customization`
--

DROP TABLE IF EXISTS `ubwbh_customization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customization` (
  `id_customization` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_attribute` int(10) unsigned NOT NULL DEFAULT 0,
  `id_address_delivery` int(10) unsigned NOT NULL DEFAULT 0,
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_refunded` int(11) NOT NULL DEFAULT 0,
  `quantity_returned` int(11) NOT NULL DEFAULT 0,
  `in_cart` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_customization`,`id_cart`,`id_product`,`id_address_delivery`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_cart_product` (`id_cart`,`id_product`,`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customization`
--

LOCK TABLES `ubwbh_customization` WRITE;
/*!40000 ALTER TABLE `ubwbh_customization` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_customization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customization_field`
--

DROP TABLE IF EXISTS `ubwbh_customization_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customization_field` (
  `id_customization_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `is_module` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_customization_field`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customization_field`
--

LOCK TABLES `ubwbh_customization_field` WRITE;
/*!40000 ALTER TABLE `ubwbh_customization_field` DISABLE KEYS */;
INSERT INTO `ubwbh_customization_field` VALUES (1,19,1,1,0,0);
/*!40000 ALTER TABLE `ubwbh_customization_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customization_field_lang`
--

DROP TABLE IF EXISTS `ubwbh_customization_field_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customization_field_lang` (
  `id_customization_field` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization_field`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customization_field_lang`
--

LOCK TABLES `ubwbh_customization_field_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_customization_field_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_customization_field_lang` VALUES (1,1,1,'Type your text here'),(1,2,1,'Type your text here');
/*!40000 ALTER TABLE `ubwbh_customization_field_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_customized_data`
--

DROP TABLE IF EXISTS `ubwbh_customized_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_customized_data` (
  `id_customization` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(1024) NOT NULL,
  `id_module` int(10) NOT NULL DEFAULT 0,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `weight` decimal(20,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id_customization`,`type`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_customized_data`
--

LOCK TABLES `ubwbh_customized_data` WRITE;
/*!40000 ALTER TABLE `ubwbh_customized_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_customized_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_date_range`
--

DROP TABLE IF EXISTS `ubwbh_date_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_date_range` (
  `id_date_range` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  PRIMARY KEY (`id_date_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_date_range`
--

LOCK TABLES `ubwbh_date_range` WRITE;
/*!40000 ALTER TABLE `ubwbh_date_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_date_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_delivery`
--

DROP TABLE IF EXISTS `ubwbh_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_delivery` (
  `id_delivery` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned DEFAULT NULL,
  `id_shop_group` int(10) unsigned DEFAULT NULL,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_range_price` int(10) unsigned DEFAULT NULL,
  `id_range_weight` int(10) unsigned DEFAULT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_zone` (`id_zone`),
  KEY `id_carrier` (`id_carrier`,`id_zone`),
  KEY `id_range_price` (`id_range_price`),
  KEY `id_range_weight` (`id_range_weight`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_delivery`
--

LOCK TABLES `ubwbh_delivery` WRITE;
/*!40000 ALTER TABLE `ubwbh_delivery` DISABLE KEYS */;
INSERT INTO `ubwbh_delivery` VALUES (1,NULL,NULL,2,0,1,1,5.000000),(2,NULL,NULL,2,0,1,2,5.000000),(3,NULL,NULL,2,1,0,1,5.000000),(4,NULL,NULL,2,1,0,2,5.000000),(5,NULL,NULL,3,2,0,1,3.000000),(6,NULL,NULL,3,2,0,2,4.000000),(7,NULL,NULL,3,3,0,1,1.000000),(8,NULL,NULL,3,3,0,2,2.000000),(9,NULL,NULL,3,4,0,1,0.000000),(10,NULL,NULL,3,4,0,2,0.000000),(11,NULL,NULL,4,0,2,1,0.000000),(12,NULL,NULL,4,0,2,2,0.000000),(13,NULL,NULL,4,0,3,1,2.000000),(14,NULL,NULL,4,0,3,2,3.000000),(15,NULL,NULL,4,0,4,1,5.000000),(16,NULL,NULL,4,0,4,2,6.000000);
/*!40000 ALTER TABLE `ubwbh_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_emailsubscription`
--

DROP TABLE IF EXISTS `ubwbh_emailsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_emailsubscription` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT 1,
  `email` varchar(255) NOT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `ip_registration_newsletter` varchar(15) NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `id_lang` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_emailsubscription`
--

LOCK TABLES `ubwbh_emailsubscription` WRITE;
/*!40000 ALTER TABLE `ubwbh_emailsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_emailsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_employee`
--

DROP TABLE IF EXISTS `ubwbh_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_employee` (
  `id_employee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL DEFAULT 0,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT current_timestamp(),
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `stats_compare_from` date DEFAULT NULL,
  `stats_compare_to` date DEFAULT NULL,
  `stats_compare_option` int(1) unsigned NOT NULL DEFAULT 1,
  `preselect_date_range` varchar(32) DEFAULT NULL,
  `bo_color` varchar(32) DEFAULT NULL,
  `bo_theme` varchar(32) DEFAULT NULL,
  `bo_css` varchar(64) DEFAULT NULL,
  `default_tab` int(10) unsigned NOT NULL DEFAULT 0,
  `bo_width` int(10) unsigned NOT NULL DEFAULT 0,
  `bo_menu` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `optin` tinyint(1) unsigned DEFAULT NULL,
  `id_last_order` int(10) unsigned NOT NULL DEFAULT 0,
  `id_last_customer_message` int(10) unsigned NOT NULL DEFAULT 0,
  `id_last_customer` int(10) unsigned NOT NULL DEFAULT 0,
  `last_connection_date` date DEFAULT NULL,
  `reset_password_token` varchar(40) DEFAULT NULL,
  `reset_password_validity` datetime DEFAULT NULL,
  `has_enabled_gravatar` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_employee`),
  KEY `employee_login` (`email`,`passwd`),
  KEY `id_employee_passwd` (`id_employee`,`passwd`),
  KEY `id_profile` (`id_profile`),
  KEY `IDX_1D8DF9EBBA299860` (`id_lang`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_employee`
--

LOCK TABLES `ubwbh_employee` WRITE;
/*!40000 ALTER TABLE `ubwbh_employee` DISABLE KEYS */;
INSERT INTO `ubwbh_employee` VALUES (1,1,1,'Bloowing','Admin','ecommerceplenger@gmail.com','$2y$10$ruHt18TUHoyy93JRWXzhoeH9a8PJHs1G1mtgomqhldmh4M9CC9zOG','2026-11-23 02:01:27','2026-10-23','2026-11-23','0000-00-00','0000-00-00',1,NULL,NULL,'default','theme.css',1,0,1,1,NULL,0,0,0,'2026-11-23',NULL,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `ubwbh_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_employee_account`
--

DROP TABLE IF EXISTS `ubwbh_employee_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_employee_account` (
  `id_employee_account` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `uid` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_employee_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_employee_account`
--

LOCK TABLES `ubwbh_employee_account` WRITE;
/*!40000 ALTER TABLE `ubwbh_employee_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_employee_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_employee_session`
--

DROP TABLE IF EXISTS `ubwbh_employee_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_employee_session` (
  `id_employee_session` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_employee_session`),
  KEY `IDX_B10E26A1D449934` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_employee_session`
--

LOCK TABLES `ubwbh_employee_session` WRITE;
/*!40000 ALTER TABLE `ubwbh_employee_session` DISABLE KEYS */;
INSERT INTO `ubwbh_employee_session` VALUES (1,1,'ca55fe51760b26e9c80b4ba68390caeab006a8fe','2026-11-23 15:15:16','2026-11-23 15:15:16');
/*!40000 ALTER TABLE `ubwbh_employee_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_employee_shop`
--

DROP TABLE IF EXISTS `ubwbh_employee_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_employee_shop` (
  `id_employee` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_employee`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_employee_shop`
--

LOCK TABLES `ubwbh_employee_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_employee_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_employee_shop` VALUES (1,1);
/*!40000 ALTER TABLE `ubwbh_employee_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_eventbus_incremental_sync`
--

DROP TABLE IF EXISTS `ubwbh_eventbus_incremental_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_eventbus_incremental_sync` (
  `type` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL DEFAULT 'upsert',
  `id_object` varchar(50) NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `lang_iso` varchar(3) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`type`,`id_object`,`id_shop`,`lang_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_eventbus_incremental_sync`
--

LOCK TABLES `ubwbh_eventbus_incremental_sync` WRITE;
/*!40000 ALTER TABLE `ubwbh_eventbus_incremental_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_eventbus_incremental_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_eventbus_job`
--

DROP TABLE IF EXISTS `ubwbh_eventbus_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_eventbus_job` (
  `job_id` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_eventbus_job`
--

LOCK TABLES `ubwbh_eventbus_job` WRITE;
/*!40000 ALTER TABLE `ubwbh_eventbus_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_eventbus_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_eventbus_live_sync`
--

DROP TABLE IF EXISTS `ubwbh_eventbus_live_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_eventbus_live_sync` (
  `shop_content` varchar(50) NOT NULL,
  `last_change_at` datetime NOT NULL,
  PRIMARY KEY (`shop_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_eventbus_live_sync`
--

LOCK TABLES `ubwbh_eventbus_live_sync` WRITE;
/*!40000 ALTER TABLE `ubwbh_eventbus_live_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_eventbus_live_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_eventbus_type_sync`
--

DROP TABLE IF EXISTS `ubwbh_eventbus_type_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_eventbus_type_sync` (
  `type` varchar(50) NOT NULL,
  `last_seek_key` varchar(190) DEFAULT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `lang_iso` varchar(3) NOT NULL,
  `full_sync_finished` tinyint(1) NOT NULL DEFAULT 0,
  `last_sync_date` datetime NOT NULL,
  PRIMARY KEY (`type`,`id_shop`,`lang_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_eventbus_type_sync`
--

LOCK TABLES `ubwbh_eventbus_type_sync` WRITE;
/*!40000 ALTER TABLE `ubwbh_eventbus_type_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_eventbus_type_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_extra_property_definition`
--

DROP TABLE IF EXISTS `ubwbh_extra_property_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_extra_property_definition` (
  `id_extra_property_definition` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(64) NOT NULL,
  `table_name` varchar(64) DEFAULT NULL,
  `controller_name` varchar(64) DEFAULT NULL,
  `module_name` varchar(64) DEFAULT NULL,
  `property_name` varchar(64) NOT NULL,
  `type` enum('int','bool','string','float','date','html','json','choice') NOT NULL DEFAULT 'string',
  `scope` enum('common','lang','shop') NOT NULL DEFAULT 'common',
  `sql_index` enum('none','key','unique') NOT NULL DEFAULT 'none',
  `size` smallint(5) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `constraints` longtext DEFAULT NULL,
  `display_front` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `associated_apis` text DEFAULT NULL,
  `associated_grids` text DEFAULT NULL,
  `associated_forms` text DEFAULT NULL,
  `form_type` varchar(255) DEFAULT NULL,
  `form_options` text DEFAULT NULL,
  `label_wording` varchar(191) DEFAULT NULL,
  `label_domain` varchar(255) DEFAULT NULL,
  `description_wording` varchar(191) DEFAULT NULL,
  `description_domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_extra_property_definition`),
  UNIQUE KEY `extra_property_definition_unique` (`entity_name`,`module_name`,`property_name`),
  KEY `entity_name` (`entity_name`,`scope`),
  KEY `module_name` (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_extra_property_definition`
--

LOCK TABLES `ubwbh_extra_property_definition` WRITE;
/*!40000 ALTER TABLE `ubwbh_extra_property_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_extra_property_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_extra_property_definition_shop`
--

DROP TABLE IF EXISTS `ubwbh_extra_property_definition_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_extra_property_definition_shop` (
  `id_extra_property_definition` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_extra_property_definition`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_extra_property_definition_shop`
--

LOCK TABLES `ubwbh_extra_property_definition_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_extra_property_definition_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_extra_property_definition_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_fb_category_match`
--

DROP TABLE IF EXISTS `ubwbh_fb_category_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_fb_category_match` (
  `id_category` int(11) NOT NULL,
  `google_category_id` int(64) NOT NULL,
  `google_category_name` varchar(255) NOT NULL,
  `google_category_parent_id` int(64) NOT NULL,
  `google_category_parent_name` varchar(255) NOT NULL,
  `is_parent_category` tinyint(1) DEFAULT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_category`,`id_shop`),
  KEY `id_category` (`id_category`,`google_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_fb_category_match`
--

LOCK TABLES `ubwbh_fb_category_match` WRITE;
/*!40000 ALTER TABLE `ubwbh_fb_category_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_fb_category_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_feature`
--

DROP TABLE IF EXISTS `ubwbh_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_feature` (
  `id_feature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_feature`
--

LOCK TABLES `ubwbh_feature` WRITE;
/*!40000 ALTER TABLE `ubwbh_feature` DISABLE KEYS */;
INSERT INTO `ubwbh_feature` VALUES (1,0),(2,1);
/*!40000 ALTER TABLE `ubwbh_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_feature_flag`
--

DROP TABLE IF EXISTS `ubwbh_feature_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_feature_flag` (
  `id_feature_flag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `type` varchar(64) NOT NULL DEFAULT 'env,dotenv,db',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `label_wording` varchar(191) NOT NULL DEFAULT '',
  `label_domain` varchar(255) NOT NULL DEFAULT '',
  `description_wording` varchar(191) NOT NULL DEFAULT '',
  `description_domain` varchar(255) NOT NULL DEFAULT '',
  `stability` varchar(64) NOT NULL DEFAULT 'beta',
  PRIMARY KEY (`id_feature_flag`),
  UNIQUE KEY `UNIQ_91700F175E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_feature_flag`
--

LOCK TABLES `ubwbh_feature_flag` WRITE;
/*!40000 ALTER TABLE `ubwbh_feature_flag` DISABLE KEYS */;
INSERT INTO `ubwbh_feature_flag` VALUES (1,'admin_api_multistore','env,dotenv,db',0,'Admin API - Multistore','Admin.Advparameters.Feature','Enable or disable the Admin API when multistore is enabled.','Admin.Advparameters.Help','beta'),(2,'admin_api_experimental_endpoints','env,dotenv,db',0,'Admin API - Enable experimental endpoints','Admin.Advparameters.Feature','Experimental API endpoints are disabled by default in prod environment, this configuration allows to forcefully enable them.','Admin.Advparameters.Help','beta'),(3,'catalog_price_rule','env,dotenv,db',0,'Catalog price rules','Admin.Advparameters.Feature','Enable / Disable the migrated catalog price rules page.','Admin.Advparameters.Help','beta'),(4,'country','env,dotenv,db',1,'Countries','Admin.Advparameters.Feature','Enable / Disable the migrated countries page.','Admin.Advparameters.Help','stable'),(5,'carrier','env,dotenv,db',1,'Carriers','Admin.Advparameters.Feature','Enable / Disable the migrated carriers page.','Admin.Advparameters.Help','stable'),(6,'permission','env,dotenv,db',0,'Permissions','Admin.Advparameters.Feature','Enable / Disable the migrated permissions page.','Admin.Advparameters.Help','beta'),(7,'tax_rules_group','env,dotenv,db',1,'Tax rule groups','Admin.Advparameters.Feature','Enable / Disable the migrated tax rules page.','Admin.Advparameters.Help','stable'),(8,'customer_threads','env,dotenv,db',0,'Customer threads','Admin.Advparameters.Feature','Enable / Disable the migrated customer threads page.','Admin.Advparameters.Help','beta'),(9,'front_container_v2','env,dotenv,db',0,'New front container','Admin.Advparameters.Feature','Enable / Disable the new front container.','Admin.Advparameters.Help','beta'),(10,'customer_group','env,dotenv,db',0,'Customer group','Admin.Advparameters.Feature','Enable / Disable the customer group page.','Admin.Advparameters.Help','beta'),(11,'store','env,dotenv,db',0,'Store','Admin.Advparameters.Feature','Enable / Disable the store page.','Admin.Advparameters.Help','beta'),(12,'merchandise_return','env,dotenv,db',1,'Merchandise return','Admin.Advparameters.Feature','Enable / Disable the merchandise return page.','Admin.Advparameters.Help','stable'),(13,'improved_shipment','env,dotenv,db',0,'Improved shipment','Admin.Advparameters.Feature','Enable / Disable the newly improved shipment system.','Admin.Advparameters.Help','beta'),(14,'discount','env,dotenv,db',0,'Discount','Admin.Advparameters.Feature','Enable / Disable the new discount system.','Admin.Advparameters.Help','beta'),(15,'tag','env,dotenv,db',1,'Tag','Admin.Advparameters.Feature','Enable / Disable the tag page.','Admin.Advparameters.Help','stable'),(16,'improved_b2b','env,dotenv,db',0,'Improved B2B','Admin.Advparameters.Feature','Enable / Disable the improved B2B mode. To use the feature activate the B2B mode in General Settings.','Admin.Advparameters.Help','beta'),(17,'new_pricing','env,query,dotenv,db',0,'New pricing','Admin.Advparameters.Feature','Enable / Disable the new pricing system. This feature introduces an improved pricing engine.','Admin.Advparameters.Help','beta'),(18,'email_body_translation','env,dotenv,db',1,'Email body translations','Admin.Advparameters.Feature','Enable / Disable the migrated email body translations page.','Admin.Advparameters.Help','stable'),(19,'hook_module_v2','env,dotenv,db',1,'Hook a module','Admin.Design.Feature','Enable / Disable the migrated Hook a module form page.','Admin.Design.Help','stable'),(20,'quick_access','env,dotenv,db',1,'Quick access','Admin.Advparameters.Feature','Enable / Disable the migrated quick access page.','Admin.Advparameters.Help','stable');
/*!40000 ALTER TABLE `ubwbh_feature_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_feature_lang`
--

DROP TABLE IF EXISTS `ubwbh_feature_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_feature_lang` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_feature_lang`
--

LOCK TABLES `ubwbh_feature_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_feature_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_feature_lang` VALUES (1,1,'Composition'),(2,1,'Property'),(1,2,'Composition'),(2,2,'Property');
/*!40000 ALTER TABLE `ubwbh_feature_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_feature_product`
--

DROP TABLE IF EXISTS `ubwbh_feature_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_feature_product` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_feature_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_product`,`id_feature_value`),
  KEY `id_feature_value` (`id_feature_value`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_feature_product`
--

LOCK TABLES `ubwbh_feature_product` WRITE;
/*!40000 ALTER TABLE `ubwbh_feature_product` DISABLE KEYS */;
INSERT INTO `ubwbh_feature_product` VALUES (1,1,4),(1,2,4),(1,3,6),(1,4,6),(1,5,6),(1,6,3),(1,7,3),(1,8,3),(1,9,1),(1,10,1),(1,11,1),(1,16,5),(1,17,5),(1,18,5),(1,19,3),(2,1,8),(2,2,7),(2,9,9),(2,10,9),(2,11,9),(2,16,10),(2,17,10),(2,18,10);
/*!40000 ALTER TABLE `ubwbh_feature_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_feature_shop`
--

DROP TABLE IF EXISTS `ubwbh_feature_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_feature_shop` (
  `id_feature` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_feature_shop`
--

LOCK TABLES `ubwbh_feature_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_feature_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_feature_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `ubwbh_feature_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_feature_value`
--

DROP TABLE IF EXISTS `ubwbh_feature_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_feature_value` (
  `id_feature_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_feature` int(10) unsigned NOT NULL,
  `custom` tinyint(3) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_feature_value`),
  KEY `feature` (`id_feature`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_feature_value`
--

LOCK TABLES `ubwbh_feature_value` WRITE;
/*!40000 ALTER TABLE `ubwbh_feature_value` DISABLE KEYS */;
INSERT INTO `ubwbh_feature_value` VALUES (1,1,0,0),(2,1,0,1),(3,1,0,2),(4,1,0,3),(5,1,0,4),(6,1,0,5),(7,2,0,0),(8,2,0,1),(9,2,0,2),(10,2,0,3);
/*!40000 ALTER TABLE `ubwbh_feature_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_feature_value_lang`
--

DROP TABLE IF EXISTS `ubwbh_feature_value_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_feature_value_lang` (
  `id_feature_value` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_feature_value_lang`
--

LOCK TABLES `ubwbh_feature_value_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_feature_value_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_feature_value_lang` VALUES (1,1,'Polyester'),(1,2,'Poliester'),(2,1,'Wool'),(2,2,'Wol'),(3,1,'Ceramic'),(3,2,'Ceramic'),(4,1,'Cotton'),(4,2,'Katun'),(5,1,'Recycled cardboard'),(5,2,'Recycled cardboard'),(6,1,'Matt paper'),(6,2,'Matt paper'),(7,1,'Long sleeves'),(7,2,'Long sleeves'),(8,1,'Short sleeves'),(8,2,'Short sleeves'),(9,1,'Removable cover'),(9,2,'Removable cover'),(10,1,'120 pages'),(10,2,'120 pages');
/*!40000 ALTER TABLE `ubwbh_feature_value_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_ganalytics`
--

DROP TABLE IF EXISTS `ubwbh_ganalytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_ganalytics` (
  `id_google_analytics` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_customer` int(10) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `sent` tinyint(1) DEFAULT NULL,
  `refund_sent` tinyint(1) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  PRIMARY KEY (`id_google_analytics`),
  KEY `id_order` (`id_order`),
  KEY `sent` (`sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_ganalytics`
--

LOCK TABLES `ubwbh_ganalytics` WRITE;
/*!40000 ALTER TABLE `ubwbh_ganalytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_ganalytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_ganalytics_data`
--

DROP TABLE IF EXISTS `ubwbh_ganalytics_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_ganalytics_data` (
  `id_cart` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id_cart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_ganalytics_data`
--

LOCK TABLES `ubwbh_ganalytics_data` WRITE;
/*!40000 ALTER TABLE `ubwbh_ganalytics_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_ganalytics_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_gender`
--

DROP TABLE IF EXISTS `ubwbh_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_gender` (
  `id_gender` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_gender`
--

LOCK TABLES `ubwbh_gender` WRITE;
/*!40000 ALTER TABLE `ubwbh_gender` DISABLE KEYS */;
INSERT INTO `ubwbh_gender` VALUES (1,0),(2,1);
/*!40000 ALTER TABLE `ubwbh_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_gender_lang`
--

DROP TABLE IF EXISTS `ubwbh_gender_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_gender_lang` (
  `id_gender` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_gender`,`id_lang`),
  KEY `id_gender` (`id_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_gender_lang`
--

LOCK TABLES `ubwbh_gender_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_gender_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_gender_lang` VALUES (1,1,'Mr.'),(1,2,'Tuan'),(2,1,'Mrs.'),(2,2,'Nona');
/*!40000 ALTER TABLE `ubwbh_gender_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_group`
--

DROP TABLE IF EXISTS `ubwbh_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reduction` decimal(5,2) NOT NULL DEFAULT 0.00,
  `price_display_method` tinyint(4) NOT NULL DEFAULT 0,
  `show_prices` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_group`
--

LOCK TABLES `ubwbh_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_group` DISABLE KEYS */;
INSERT INTO `ubwbh_group` VALUES (1,0.00,0,1,'2026-11-23 15:01:15','2026-11-23 15:01:15'),(2,0.00,0,1,'2026-11-23 15:01:15','2026-11-23 15:01:15'),(3,0.00,0,1,'2026-11-23 15:01:15','2026-11-23 15:01:15');
/*!40000 ALTER TABLE `ubwbh_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_group_lang`
--

DROP TABLE IF EXISTS `ubwbh_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_group_lang` (
  `id_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_group_lang`
--

LOCK TABLES `ubwbh_group_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_group_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_group_lang` VALUES (1,1,'Visitor'),(1,2,'Pengunjung'),(2,1,'Guest'),(2,2,'Pengunjung'),(3,1,'Customer'),(3,2,'Pelanggan');
/*!40000 ALTER TABLE `ubwbh_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_group_reduction`
--

DROP TABLE IF EXISTS `ubwbh_group_reduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_group_reduction` (
  `id_group_reduction` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `reduction` decimal(5,4) NOT NULL,
  PRIMARY KEY (`id_group_reduction`),
  UNIQUE KEY `id_group` (`id_group`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_group_reduction`
--

LOCK TABLES `ubwbh_group_reduction` WRITE;
/*!40000 ALTER TABLE `ubwbh_group_reduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_group_reduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_group_shop`
--

DROP TABLE IF EXISTS `ubwbh_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_group_shop` (
  `id_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_group_shop`
--

LOCK TABLES `ubwbh_group_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_group_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_group_shop` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `ubwbh_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_gsitemap_sitemap`
--

DROP TABLE IF EXISTS `ubwbh_gsitemap_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_gsitemap_sitemap` (
  `link` varchar(255) DEFAULT NULL,
  `id_shop` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_gsitemap_sitemap`
--

LOCK TABLES `ubwbh_gsitemap_sitemap` WRITE;
/*!40000 ALTER TABLE `ubwbh_gsitemap_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_gsitemap_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_guest`
--

DROP TABLE IF EXISTS `ubwbh_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_guest` (
  `id_guest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_operating_system` int(10) unsigned DEFAULT NULL,
  `id_web_browser` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT 0,
  `screen_resolution_x` smallint(5) unsigned DEFAULT NULL,
  `screen_resolution_y` smallint(5) unsigned DEFAULT NULL,
  `screen_color` tinyint(3) unsigned DEFAULT NULL,
  `sun_java` tinyint(1) DEFAULT NULL,
  `adobe_flash` tinyint(1) DEFAULT NULL,
  `adobe_director` tinyint(1) DEFAULT NULL,
  `apple_quicktime` tinyint(1) DEFAULT NULL,
  `real_player` tinyint(1) DEFAULT NULL,
  `windows_media` tinyint(1) DEFAULT NULL,
  `accept_language` varchar(8) DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_guest`),
  KEY `id_customer` (`id_customer`),
  KEY `id_operating_system` (`id_operating_system`),
  KEY `id_web_browser` (`id_web_browser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_guest`
--

LOCK TABLES `ubwbh_guest` WRITE;
/*!40000 ALTER TABLE `ubwbh_guest` DISABLE KEYS */;
INSERT INTO `ubwbh_guest` VALUES (1,0,0,2,0,0,0,0,0,0,0,0,0,0,'',0),(2,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0),(3,6,11,0,0,0,0,0,0,0,0,0,0,0,'en',0),(4,6,11,0,0,0,0,0,0,0,0,0,0,0,'en',0);
/*!40000 ALTER TABLE `ubwbh_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_homeslider`
--

DROP TABLE IF EXISTS `ubwbh_homeslider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_homeslider` (
  `id_homeslider_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_homeslider_slides`,`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_homeslider`
--

LOCK TABLES `ubwbh_homeslider` WRITE;
/*!40000 ALTER TABLE `ubwbh_homeslider` DISABLE KEYS */;
INSERT INTO `ubwbh_homeslider` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `ubwbh_homeslider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_homeslider_slides`
--

DROP TABLE IF EXISTS `ubwbh_homeslider_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_homeslider_slides` (
  `id_homeslider_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_homeslider_slides`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_homeslider_slides`
--

LOCK TABLES `ubwbh_homeslider_slides` WRITE;
/*!40000 ALTER TABLE `ubwbh_homeslider_slides` DISABLE KEYS */;
INSERT INTO `ubwbh_homeslider_slides` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `ubwbh_homeslider_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_homeslider_slides_lang`
--

DROP TABLE IF EXISTS `ubwbh_homeslider_slides_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_homeslider_slides_lang` (
  `id_homeslider_slides` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `legend` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_homeslider_slides`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_homeslider_slides_lang`
--

LOCK TABLES `ubwbh_homeslider_slides_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_homeslider_slides_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_homeslider_slides_lang` VALUES (1,1,'Sample 1','<h3>EXCEPTEUR OCCAECAT</h3>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-1','https://www.prestashop-project.org','sample-1.jpg'),(1,2,'Sample 1','<h3>EXCEPTEUR OCCAECAT</h3>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-1','https://www.prestashop-project.org','sample-1.jpg'),(2,1,'Sample 2','<h3>EXCEPTEUR OCCAECAT</h3>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-2','https://www.prestashop-project.org','sample-2.jpg'),(2,2,'Sample 2','<h3>EXCEPTEUR OCCAECAT</h3>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-2','https://www.prestashop-project.org','sample-2.jpg'),(3,1,'Sample 3','<h3>EXCEPTEUR OCCAECAT</h3>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-3','https://www.prestashop-project.org','sample-3.jpg'),(3,2,'Sample 3','<h3>EXCEPTEUR OCCAECAT</h3>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-3','https://www.prestashop-project.org','sample-3.jpg');
/*!40000 ALTER TABLE `ubwbh_homeslider_slides_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_hook`
--

DROP TABLE IF EXISTS `ubwbh_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_hook` (
  `id_hook` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `position` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_hook`),
  UNIQUE KEY `hook_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_hook`
--

LOCK TABLES `ubwbh_hook` WRITE;
/*!40000 ALTER TABLE `ubwbh_hook` DISABLE KEYS */;
INSERT INTO `ubwbh_hook` VALUES (1,'actionMailAlterMessageBeforeSend','Modify Swift Message before sending','This hook is called before the Swift Message is sent in Mail.php',1,1),(2,'actionValidateOrder','New orders','',1,1),(3,'actionValidateOrderAfter','After validating an order','This hook is called after validating an order by core',1,1),(4,'actionValidateOrderBefore','Before validating an order','This hook is called before validating an order by core',1,1),(5,'displayMaintenance','Maintenance Page','This hook displays new elements on the maintenance page',1,1),(6,'displayCartModalContent','Content of Add-to-cart modal','This hook displays content in the middle of the window that appears after adding product to cart',1,1),(7,'displayCartModalFooter','Bottom of Add-to-cart modal','This hook displays content in the bottom of window that appears after adding product to cart',1,1),(8,'displayProductPageDrawer','Product Page Drawer','This hook displays content in the right sidebar of the product page',1,1),(9,'actionPaymentConfirmation','Payment confirmation','This hook displays new elements after the payment is validated',1,1),(10,'actionPaymentModuleProductVarTplAfter','Triggers after product data is prepared for e-mail template','Allows to modify product data in e-mail template.',1,1),(11,'displayPaymentReturn','Payment return','',1,1),(12,'actionUpdateQuantity','Quantity update','Quantity is updated only when a customer effectively places their order',1,1),(13,'displayRightColumn','Right column blocks','This hook displays new elements in the right-hand column',1,1),(14,'displayContactRightColumn','Right column blocks of the contact page','This hook displays new elements in the right-hand column of the contact page',1,1),(15,'displayWrapperTop','Main wrapper section (top)','This hook displays new elements in the top of the main wrapper',1,1),(16,'displayWrapperBottom','Main wrapper section (bottom)','This hook displays new elements in the bottom of the main wrapper',1,1),(17,'displayContactContent','Content wrapper section of the contact page','This hook displays new elements in the content wrapper of the contact page',1,1),(18,'displayContentWrapperTop','Content wrapper section (top)','This hook displays new elements in the top of the content wrapper',1,1),(19,'displayContentWrapperBottom','Content wrapper section (bottom)','This hook displays new elements in the bottom of the content wrapper',1,1),(20,'displayLeftColumn','Left column blocks','This hook displays new elements in the left-hand column',1,1),(21,'displayContactLeftColumn','Left column blocks on the contact page','This hook displays new elements in the left-hand column of the contact page',1,1),(22,'displayHome','Homepage content','This hook displays new elements on the homepage',1,1),(23,'displayHeader','Pages html head section','This hook adds additional elements in the head section of your pages (head section of html)',1,1),(24,'actionCartSave','Cart creation and update','This hook is displayed when a product is added to the cart or if the cart\'s content is modified',1,1),(25,'actionDuplicateCartData','Cart duplication','This hook is triggered after all the cart related data has been duplicated',1,1),(26,'actionAuthentication','Successful customer authentication','This hook is displayed after a customer successfully signs in',1,1),(27,'actionProductAdd','Product creation','This hook is displayed after a product is created',1,1),(28,'actionProductUpdate','Product update','This hook is displayed after a product has been updated',1,1),(29,'displayAfterTitleTag','After title tag','Use this hook to add content after title tag',1,1),(30,'displayAfterBodyOpeningTag','Very top of pages','Use this hook for advertisement or modals you want to load first',1,1),(31,'displayBanner','Very top of pages','Use this hook for banners on top of every pages',1,1),(32,'displayBeforeBodyClosingTag','Very bottom of pages','Use this hook for your modals or any content you want to load at the very end',1,1),(33,'displayTop','Top of pages','This hook displays additional elements at the top of your pages',1,1),(34,'displayNavFullWidth','Navigation','This hook displays full width navigation menu at the top of your pages',1,1),(35,'displayRightColumnProduct','New elements on the product page (right column)','This hook displays new elements in the right-hand column of the product page',1,1),(36,'actionProductDelete','Product deletion','This hook is called when a product is deleted',1,1),(37,'actionObjectDuplicateAfter','After duplicating an object','This hook is called after duplicating an object by the core.',1,1),(38,'actionObjectProductInCartDeleteBefore','Cart product removal','This hook is called before a product is removed from a cart',1,1),(39,'actionObjectProductInCartDeleteAfter','Cart product removal','This hook is called after a product is removed from a cart',1,1),(40,'displayFooterProduct','Product footer','This hook adds new blocks under the product\'s description',1,1),(41,'displayInvoice','Invoice','This hook displays new blocks on the invoice (order)',1,1),(42,'actionOrderStatusUpdate','Order status update - Event','This hook launches modules when the status of an order changes',1,1),(43,'displayAdminGridTableBefore','Display before Grid table','This hook adds new blocks before Grid component table',1,1),(44,'displayAdminGridTableAfter','Display after Grid table','This hook adds new blocks after Grid component table',1,1),(45,'displayAdminOrder','Display new elements in the Back Office, tab AdminOrder','This hook launches modules when the AdminOrder tab is displayed in the Back Office',1,1),(46,'displayAdminOrderTabOrder','Display new elements in Back Office, AdminOrder, panel Order','This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Order panel tabs',1,1),(47,'displayAdminOrderTabShip','Display new elements in Back Office, AdminOrder, panel Shipping','This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Shipping panel tabs',1,1),(48,'displayAdminOrderContentOrder','Display new elements in Back Office, AdminOrder, panel Order','This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Order panel content',1,1),(49,'displayAdminOrderContentShip','Display new elements in Back Office, AdminOrder, panel Shipping','This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Shipping panel content',1,1),(50,'displayFooter','Footer','This hook displays new blocks in the footer',1,1),(51,'displayPDFInvoice','PDF Invoice','This hook allows you to display additional information on PDF invoices',1,1),(52,'displayInvoiceLegalFreeText','PDF Invoice - Legal Free Text','This hook allows you to modify the legal free text on PDF invoices',1,1),(53,'displayAdminCustomers','Display new elements in the Back Office, tab AdminCustomers','This hook launches modules when the AdminCustomers tab is displayed in the Back Office',1,1),(54,'displayAdminCustomersAddressesItemAction','Display new elements in the Back Office, tab AdminCustomers, Addresses actions','This hook launches modules when the Addresses list into the AdminCustomers tab is displayed in the Back Office',1,1),(55,'displayOrderConfirmation','Order confirmation page','This hook is called within an order\'s confirmation page',1,1),(56,'actionCustomerAccountAdd','Successful customer account creation','This hook is called when a new customer creates an account successfully',1,1),(57,'actionCustomerAccountUpdate','Successful customer account update','This hook is called when a customer updates its account successfully',1,1),(58,'actionSubmitAccountBefore','Before customer account creation','This hook is called before a customer account creation',1,1),(59,'displayCustomerAccount','Customer account displayed in Front Office','This hook displays new elements on the customer account page',1,1),(60,'displayCustomerAccountTop','Customer account displayed in Front Office (Top part)','This hook displays new elements on the customer account page on Top',1,1),(61,'actionOrderSlipAdd','Order slip creation','This hook is called when a new credit slip is added regarding client order',1,1),(62,'displayShoppingCartFooter','Shopping cart footer','This hook displays some specific information on the shopping cart\'s page',1,1),(63,'displayCreateAccountEmailFormBottom','Customer authentication form','This hook displays some information on the bottom of the email form',1,1),(64,'displayAuthenticateFormBottom','Customer authentication form','This hook displays some information on the bottom of the authentication form',1,1),(65,'displayCustomerAccountForm','Customer account creation form','This hook displays some information on the form to create a customer account',1,1),(66,'displayModuleConfigureExtraButtons','Module configuration - After toolbar buttons','This hook allows to add toolbar\'s additional content on module configuration page',1,1),(67,'displayAdminStatsModules','Stats - Modules','',1,1),(68,'displayAdminStatsGraphEngine','Graph engines','',1,1),(69,'actionOrderReturn','Returned product','This hook is displayed when a customer returns a product ',1,1),(70,'displayProductAdditionalInfo','Product page additional info','This hook adds additional information on the product page',1,1),(71,'displayBackOfficeHome','Administration panel homepage','This hook is displayed on the admin panel\'s homepage',1,1),(72,'displayAdminStatsGridEngine','Grid engines','',1,1),(73,'actionWatermark','Watermark','',1,1),(74,'actionProductCancel','Product cancelled','This hook is called when you cancel a product in an order',1,1),(75,'displayLeftColumnProduct','New elements on the product page (left column)','This hook displays new elements in the left-hand column of the product page',1,1),(76,'actionProductOutOfStock','Out-of-stock product','This hook displays new action buttons if a product is out of stock',1,1),(77,'actionProductAttributeUpdate','Product attribute update','This hook is displayed when a product\'s attribute is updated',1,1),(78,'displayCarrierList','Extra carrier (module mode)','',1,1),(79,'displayShoppingCart','Shopping cart - Additional button','This hook displays new action buttons within the shopping cart',1,1),(80,'actionCarrierUpdate','Carrier Update','This hook is called when a carrier is updated',1,1),(81,'actionOrderStatusPostUpdate','Post update of order status','',1,1),(82,'displayCustomerAccountFormTop','Block above the form for create an account','This hook is displayed above the customer\'s account creation form',1,1),(83,'displayBackOfficeHeader','Administration panel header','This hook is displayed in the header of the admin panel',1,1),(84,'displayBackOfficeTop','Administration panel hover the tabs','This hook is displayed on the roll hover of the tabs within the admin panel',1,1),(85,'displayAdminEndContent','Administration end of content','This hook is displayed at the end of the main content, before the footer',1,1),(86,'displayBackOfficeFooter','Administration panel footer','This hook is displayed within the admin panel\'s footer',1,1),(87,'actionProductAttributeDelete','Product attribute deletion','This hook is displayed when a product\'s attribute is deleted',1,1),(88,'actionCarrierProcess','Carrier process','',1,1),(89,'displayBeforeCarrier','Before carriers list','This hook is displayed before the carrier list in Front Office',1,1),(90,'displayAfterCarrier','After carriers list','This hook is displayed after the carrier list in Front Office',1,1),(91,'displayOrderDetail','Order detail','This hook is displayed within the order\'s details in Front Office',1,1),(92,'actionPaymentCCAdd','Payment CC added','',1,1),(93,'actionCategoryAdd','Category creation','This hook is displayed when a category is created',1,1),(94,'actionCategoryUpdate','Category modification','This hook is displayed when a category is modified',1,1),(95,'actionCategoryDelete','Category deletion','This hook is displayed when a category is deleted',1,1),(96,'displayPaymentTop','Top of payment page','This hook is displayed at the top of the payment page',1,1),(97,'actionHtaccessCreate','After htaccess creation','This hook is displayed after the htaccess creation',1,1),(98,'actionAdminMetaSave','After saving the configuration in AdminMeta','This hook is displayed after saving the configuration in AdminMeta',1,1),(99,'displayAttributeGroupForm','Add fields to the form \'attribute group\'','This hook adds fields to the form \'attribute group\'',1,1),(100,'actionAttributeGroupSave','Saving an attribute group','This hook is called while saving an attributes group',1,1),(101,'actionAttributeGroupDelete','Deleting attribute group','This hook is called while deleting an attributes  group',1,1),(102,'displayFeatureForm','Add fields to the form \'feature\'','This hook adds fields to the form \'feature\'',1,1),(103,'actionFeatureSave','Saving attributes\' features','This hook is called while saving an attributes features',1,1),(104,'actionFeatureDelete','Deleting attributes\' features','This hook is called while deleting an attributes features',1,1),(105,'actionProductSave','Saving products','This hook is called while saving products',1,1),(106,'displayAttributeGroupPostProcess','On post-process in admin attribute group','This hook is called on post-process in admin attribute group',1,1),(107,'displayFeaturePostProcess','On post-process in admin feature','This hook is called on post-process in admin feature',1,1),(108,'displayFeatureValueForm','Add fields to the form \'feature value\'','This hook adds fields to the form \'feature value\'',1,1),(109,'displayFeatureValuePostProcess','On post-process in admin feature value','This hook is called on post-process in admin feature value',1,1),(110,'actionFeatureValueDelete','Deleting attributes\' features\' values','This hook is called while deleting an attributes features value',1,1),(111,'actionFeatureValueSave','Saving an attributes features value','This hook is called while saving an attributes features value',1,1),(112,'displayAttributeForm','Add fields to the form \'attribute value\'','This hook adds fields to the form \'attribute value\'',1,1),(113,'actionAttributePostProcess','On post-process in admin feature value','This hook is called on post-process in admin feature value',1,1),(114,'actionAttributeDelete','Deleting an attributes features value','This hook is called while deleting an attributes features value',1,1),(115,'actionAttributeSave','Saving an attributes features value','This hook is called while saving an attributes features value',1,1),(116,'actionTaxManager','Tax Manager Factory','',1,1),(117,'displayMyAccountBlock','My account block','This hook displays extra information within the \'my account\' block\"',1,1),(118,'actionModuleInstallBefore','actionModuleInstallBefore','',1,1),(119,'actionModuleInstallAfter','actionModuleInstallAfter','',1,1),(120,'actionModuleUninstallBefore','actionModuleUninstallBefore','',1,1),(121,'actionModuleUninstallAfter','actionModuleUninstallAfter','',1,1),(122,'displayTopColumn','Top column blocks','This hook displays new elements in the top of columns',1,1),(123,'displayBackOfficeCategory','Display new elements in the Back Office, tab AdminCategories','This hook launches modules when the AdminCategories tab is displayed in the Back Office',1,1),(124,'displayProductListFunctionalButtons','Display new elements in the Front Office, products list','This hook launches modules when the products list is displayed in the Front Office',1,1),(125,'displayNav','Navigation','',1,1),(126,'displayOverrideTemplate','Change the default template of current controller','',1,1),(127,'actionAdminLoginControllerSetMedia','Set media on admin login page header','This hook is called after adding media to admin login page header',1,1),(128,'actionOrderEdited','Order edited','This hook is called when an order is edited',1,1),(129,'actionEmailAddBeforeContent','Add extra content before mail content','This hook is called just before fetching mail template',1,1),(130,'actionEmailAddAfterContent','Add extra content after mail content','This hook is called just after fetching mail template',1,1),(131,'sendMailAlterTemplateVars','Alter template vars on the fly','This hook is called when Mail::send() is called',1,1),(132,'displayCartExtraProductInfo','Extra information in shopping cart product line','This hook adds extra information to the product lines, in the shopping cart',1,1),(133,'displayCartExtraProductActions','Extra buttons in shopping cart','This hook adds extra buttons to the product lines, in the shopping cart',1,1),(134,'displayPaymentByBinaries','Payment form generated by binaries','This hook displays form generated by binaries during the checkout',1,1),(135,'additionalCustomerFormFields','Add fields to the Customer form','This hook returns an array of FormFields to add them to the customer registration form',1,1),(136,'additionalCustomerAddressFields','Add fields to the Customer address form','This hook returns an array of FormFields to add them to the customer address registration form',1,1),(137,'addWebserviceResources','Add extra webservice resource','This hook is called when webservice resources list in webservice controller',1,1),(138,'displayCustomerLoginFormAfter','Display elements after login form','This hook displays new elements after the login form',1,1),(139,'actionClearCache','Clear smarty cache','This hook is called when smarty\'s cache is cleared',1,1),(140,'actionClearCompileCache','Clear smarty compile cache','This hook is called when smarty\'s compile cache is cleared',1,1),(141,'actionClearSf2Cache','Clear Sf2 cache','This hook is called when the Symfony cache is cleared',1,1),(142,'actionValidateCustomerAddressForm','Customer address form validation','This hook is called when a customer submit its address form',1,1),(143,'displayCarrierExtraContent','Display additional content for a carrier (e.g pickup points)','This hook calls only the module related to the carrier, in order to add options when needed',1,1),(144,'validateCustomerFormFields','Customer registration form validation','This hook is called to a module when it has sent additional fields with additionalCustomerFormFields',1,1),(145,'displayProductExtraContent','Display extra content on the product page','This hook expects ProductExtraContent instances, which will be properly displayed by the template on the product page',1,1),(146,'filterCmsContent','Filter the content page','This hook is called just before fetching content page',1,1),(147,'filterCmsCategoryContent','Filter the content page category','This hook is called just before fetching content page category',1,1),(148,'filterProductContent','Filter the content page product','This hook is called just before fetching content page product',1,1),(149,'filterCategoryContent','Filter the content page category','This hook is called just before fetching content page category',1,1),(150,'filterManufacturerContent','Filter the content page manufacturer','This hook is called just before fetching content page manufacturer',1,1),(151,'filterSupplierContent','Filter the content page supplier','This hook is called just before fetching content page supplier',1,1),(152,'filterHtmlContent','Filter HTML field before rending a page','This hook is called just before fetching a page on HTML field',1,1),(153,'displayDashboardTop','Dashboard Top','Displays the content in the dashboard\'s top area',1,1),(154,'actionUpdateLangAfter','Update \"lang\" tables','Update \"lang\" tables after adding or updating a language',1,1),(155,'actionOutputHTMLBefore','Before HTML output','This hook is used to filter the whole HTML page before it is rendered (only front)',1,1),(156,'displayAfterProductThumbs','Display extra content below product thumbs','This hook displays new elements below product images ex. additional media',1,1),(157,'actionDispatcherBefore','Before dispatch','This hook is called at the beginning of the dispatch method of the Dispatcher',1,1),(158,'actionDispatcherAfter','After dispatch','This hook is called at the end of the dispatch method of the Dispatcher',1,1),(159,'filterProductSearch','Filter search products result','This hook is called in order to allow to modify search product result',1,1),(160,'actionProductSearchAfter','Event triggered after search product completed','This hook is called after the product search. Parameters are already filter',1,1),(161,'actionEmailSendBefore','Before sending an email','This hook is used to filter the content or the metadata of an email before sending it or even prevent its sending',1,1),(162,'displayAdminProductsMainStepLeftColumnMiddle','Display new elements in back office product page, left column of the Basic settings tab','This hook launches modules when the back office product page is displayed',1,1),(163,'displayAdminProductsMainStepLeftColumnBottom','Display new elements in back office product page, left column of the Basic settings tab','This hook launches modules when the back office product page is displayed',1,1),(164,'displayAdminProductsMainStepRightColumnBottom','Display new elements in back office product page, right column of the Basic settings tab','This hook launches modules when the back office product page is displayed',1,1),(165,'displayAdminProductsQuantitiesStepBottom','Display new elements in back office product page, Quantities/Combinations tab','This hook launches modules when the back office product page is displayed',1,1),(166,'displayAdminProductsPriceStepBottom','Display new elements in back office product page, Price tab','This hook launches modules when the back office product page is displayed',1,1),(167,'displayAdminProductsOptionsStepTop','Display new elements in back office product page, Options tab','This hook launches modules when the back office product page is displayed',1,1),(168,'displayAdminProductsOptionsStepBottom','Display new elements in back office product page, Options tab','This hook launches modules when the back office product page is displayed',1,1),(169,'displayAdminProductsSeoStepBottom','Display new elements in back office product page, SEO tab','This hook launches modules when the back office product page is displayed',1,1),(170,'displayAdminProductsShippingStepBottom','Display new elements in back office product page, Shipping tab','This hook launches modules when the back office product page is displayed',1,1),(171,'displayAdminProductsExtra','Admin Product Extra Module Tab','This hook displays extra content in the Module tab on the product edit page',1,1),(172,'displayAdminProductsCombinationBottom','Display new elements in back office product page, Combination tab','This hook launches modules when the back office product page is displayed',1,1),(173,'displayDashboardToolbarTopMenu','Display new elements in back office page with a dashboard, on top Menu','This hook launches modules when a page with a dashboard is displayed',1,1),(174,'displayDashboardToolbarIcons','Display new elements in back office page with dashboard, on icons list','This hook launches modules when the back office with dashboard is displayed',1,1),(175,'actionBuildFrontEndObject','Manage elements added to the \"prestashop\" javascript object','This hook allows you to customize the \"prestashop\" javascript object that is included in all front office pages',1,1),(176,'actionFrontControllerInitAfter','Perform actions after front office controller initialization','This hook is launched after the initialization of all front office controllers',1,1),(177,'actionFrontControllerInitBefore','Perform actions before front office controller initialization','This hook is launched before the initialization of all front office controllers',1,1),(178,'actionAdminControllerInitAfter','Perform actions after admin controller initialization','This hook is launched after the initialization of all admin controllers',1,1),(179,'actionAdminControllerInitBefore','Perform actions before admin controller initialization','This hook is launched before the initialization of all admin controllers',1,1),(180,'actionControllerInitAfter','Perform actions after controller initialization','This hook is launched after the initialization of all controllers',1,1),(181,'actionControllerInitBefore','Perform actions before controller initialization','This hook is launched before the initialization of all controllers',1,1),(182,'actionAdministrationPageForm','Manage Administration Page form fields','This hook adds, update or remove fields of the Administration Page form',1,1),(183,'actionPerformancePageForm','Manage Performance Page form fields','This hook adds, update or remove fields of the Performance Page form',1,1),(184,'actionMaintenancePageForm','Manage Maintenance Page form fields','This hook adds, update or remove fields of the Maintenance Page form',1,1),(185,'actionWebserviceKeyGridPresenterModifier','Modify Webservice grid view data','This hook allows to alter presented Webservice grid data',1,1),(186,'actionWebserviceKeyGridDefinitionModifier','Modifying Webservice grid definition','This hook allows to alter Webservice grid columns, actions and filters',1,1),(187,'actionWebserviceKeyGridQueryBuilderModifier','Modify Webservice grid query builder','This hook allows to alter Doctrine query builder for Webservice grid',1,1),(188,'actionWebserviceKeyGridFilterFormModifier','Modify filters form for Webservice grid','This hook allows to alter filters form used in Webservice',1,1),(189,'actionSqlRequestGridPresenterModifier','Modify SQL Manager grid view data','This hook allows to alter presented SQL Manager grid data',1,1),(190,'actionSqlRequestGridDefinitionModifier','Modifying SQL Manager grid definition','This hook allows to alter SQL Manager grid columns, actions and filters',1,1),(191,'actionSqlRequestGridQueryBuilderModifier','Modify SQL Manager grid query builder','This hook allows to alter Doctrine query builder for SQL Manager grid',1,1),(192,'actionSqlRequestGridFilterFormModifier','Modify filters form for SQL Manager grid','This hook allows to alter filters form used in SQL Manager',1,1),(193,'actionMetaGridPresenterModifier','Modify SEO and URLs grid view data','This hook allows to alter presented SEO and URLs grid data',1,1),(194,'actionMetaGridDefinitionModifier','Modifying SEO and URLs grid definition','This hook allows to alter SEO and URLs grid columns, actions and filters',1,1),(195,'actionMetaGridQueryBuilderModifier','Modify SEO and URLs grid query builder','This hook allows to alter Doctrine query builder for SEO and URLs grid',1,1),(196,'actionMetaGridFilterFormModifier','Modify filters form for SEO and URLs grid','This hook allows to alter filters form used in SEO and URLs',1,1),(197,'actionLogsGridPresenterModifier','Modify Logs grid view data','This hook allows to alter presented Logs grid data',1,1),(198,'actionLogsGridDefinitionModifier','Modifying Logs grid definition','This hook allows to alter Logs grid columns, actions and filters',1,1),(199,'actionLogsGridQueryBuilderModifier','Modify Logs grid query builder','This hook allows to alter Doctrine query builder for Logs grid',1,1),(200,'actionLogsGridFilterFormModifier','Modify filters form for Logs grid','This hook allows to alter filters form used in Logs',1,1),(201,'actionEmailLogsGridPresenterModifier','Modify E-mail grid view data','This hook allows to alter presented E-mail grid data',1,1),(202,'actionEmailLogsGridDefinitionModifier','Modifying E-mail grid definition','This hook allows to alter E-mail grid columns, actions and filters',1,1),(203,'actionEmailLogsGridQueryBuilderModifier','Modify E-mail grid query builder','This hook allows to alter Doctrine query builder for E-mail grid',1,1),(204,'actionEmailLogsGridFilterFormModifier','Modify filters form for E-mail grid','This hook allows to alter filters form used in E-mail',1,1),(205,'actionBackupGridPresenterModifier','Modify DB Backup grid view data','This hook allows to alter presented DB Backup grid data',1,1),(206,'actionBackupGridDefinitionModifier','Modifying DB Backup grid definition','This hook allows to alter DB Backup grid columns, actions and filters',1,1),(207,'actionBackupGridFilterFormModifier','Modify filters form for DB Backup grid','This hook allows to alter filters form used in DB Backup',1,1),(208,'actionProductFlagsModifier','Customize product labels displayed on the product list on FO','This hook allows to add and remove product labels displayed on top of product images',1,1),(209,'actionListMailThemes','List the available email themes and layouts','This hook allows to add/remove available email themes (ThemeInterface) and/or to add/remove their layouts (LayoutInterface)',1,1),(210,'actionGetMailThemeFolder','Define the folder of an email theme','This hook allows to change the folder of an email theme (useful if you theme is in a module for example)',1,1),(211,'actionBuildMailLayoutVariables','Build the variables used in email layout rendering','This hook allows to change the variables used when an email layout is rendered',1,1),(212,'actionGetMailLayoutTransformations','Define the transformation to apply on layout','This hook allows to add/remove TransformationInterface used to generate an email layout',1,1),(213,'displayProductActions','Display additional action button on the product page','This hook allow additional actions to be triggered, near the add to cart button.',1,1),(214,'displayPersonalInformationTop','Content in the checkout funnel, on top of the personal information panel','Display actions or additional content in the personal details tab of the checkout funnel.',1,1),(215,'actionSqlRequestFormBuilderModifier','Modify sql request identifiable object form','This hook allows to modify sql request identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(216,'actionCustomerFormBuilderModifier','Modify customer identifiable object form','This hook allows to modify customer identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(217,'actionLanguageFormBuilderModifier','Modify language identifiable object form','This hook allows to modify language identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(218,'actionCurrencyFormBuilderModifier','Modify currency identifiable object form','This hook allows to modify currency identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(219,'actionWebserviceKeyFormBuilderModifier','Modify webservice key identifiable object form','This hook allows to modify webservice key identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(220,'actionMetaFormBuilderModifier','Modify meta identifiable object form','This hook allows to modify meta identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(221,'actionCategoryFormBuilderModifier','Modify category identifiable object form','This hook allows to modify category identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(222,'actionRootCategoryFormBuilderModifier','Modify root category identifiable object form','This hook allows to modify root category identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(223,'actionContactFormBuilderModifier','Modify contact identifiable object form','This hook allows to modify contact identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(224,'actionCmsPageCategoryFormBuilderModifier','Modify cms page category identifiable object form','This hook allows to modify cms page category identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(225,'actionTaxFormBuilderModifier','Modify tax identifiable object form','This hook allows to modify tax identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(226,'actionManufacturerFormBuilderModifier','Modify manufacturer identifiable object form','This hook allows to modify manufacturer identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(227,'actionEmployeeFormBuilderModifier','Modify employee identifiable object form','This hook allows to modify employee identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(228,'actionProfileFormBuilderModifier','Modify profile identifiable object form','This hook allows to modify profile identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(229,'actionCmsPageFormBuilderModifier','Modify cms page identifiable object form','This hook allows to modify cms page identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(230,'actionManufacturerAddressFormBuilderModifier','Modify manufacturer address identifiable object form','This hook allows to modify manufacturer address identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(231,'actionBeforeUpdateSqlRequestFormHandler','Modify sql request identifiable object data before updating it','This hook allows to modify sql request identifiable object forms data before it was updated',1,1),(232,'actionBeforeUpdateCustomerFormHandler','Modify customer identifiable object data before updating it','This hook allows to modify customer identifiable object forms data before it was updated',1,1),(233,'actionBeforeUpdateLanguageFormHandler','Modify language identifiable object data before updating it','This hook allows to modify language identifiable object forms data before it was updated',1,1),(234,'actionBeforeUpdateCurrencyFormHandler','Modify currency identifiable object data before updating it','This hook allows to modify currency identifiable object forms data before it was updated',1,1),(235,'actionBeforeUpdateWebserviceKeyFormHandler','Modify webservice key identifiable object data before updating it','This hook allows to modify webservice key identifiable object forms data before it was updated',1,1),(236,'actionBeforeUpdateMetaFormHandler','Modify meta identifiable object data before updating it','This hook allows to modify meta identifiable object forms data before it was updated',1,1),(237,'actionBeforeUpdateCategoryFormHandler','Modify category identifiable object data before updating it','This hook allows to modify category identifiable object forms data before it was updated',1,1),(238,'actionBeforeUpdateRootCategoryFormHandler','Modify root category identifiable object data before updating it','This hook allows to modify root category identifiable object forms data before it was updated',1,1),(239,'actionBeforeUpdateContactFormHandler','Modify contact identifiable object data before updating it','This hook allows to modify contact identifiable object forms data before it was updated',1,1),(240,'actionBeforeUpdateCmsPageCategoryFormHandler','Modify cms page category identifiable object data before updating it','This hook allows to modify cms page category identifiable object forms data before it was updated',1,1),(241,'actionBeforeUpdateTaxFormHandler','Modify tax identifiable object data before updating it','This hook allows to modify tax identifiable object forms data before it was updated',1,1),(242,'actionBeforeUpdateManufacturerFormHandler','Modify manufacturer identifiable object data before updating it','This hook allows to modify manufacturer identifiable object forms data before it was updated',1,1),(243,'actionBeforeUpdateEmployeeFormHandler','Modify employee identifiable object data before updating it','This hook allows to modify employee identifiable object forms data before it was updated',1,1),(244,'actionBeforeUpdateProfileFormHandler','Modify profile identifiable object data before updating it','This hook allows to modify profile identifiable object forms data before it was updated',1,1),(245,'actionBeforeUpdateCmsPageFormHandler','Modify cms page identifiable object data before updating it','This hook allows to modify cms page identifiable object forms data before it was updated',1,1),(246,'actionBeforeUpdateManufacturerAddressFormHandler','Modify manufacturer address identifiable object data before updating it','This hook allows to modify manufacturer address identifiable object forms data before it was updated',1,1),(247,'actionAfterUpdateSqlRequestFormHandler','Modify sql request identifiable object data after updating it','This hook allows to modify sql request identifiable object forms data after it was updated',1,1),(248,'actionAfterUpdateCustomerFormHandler','Modify customer identifiable object data after updating it','This hook allows to modify customer identifiable object forms data after it was updated',1,1),(249,'actionAfterUpdateLanguageFormHandler','Modify language identifiable object data after updating it','This hook allows to modify language identifiable object forms data after it was updated',1,1),(250,'actionAfterUpdateCurrencyFormHandler','Modify currency identifiable object data after updating it','This hook allows to modify currency identifiable object forms data after it was updated',1,1),(251,'actionAfterUpdateWebserviceKeyFormHandler','Modify webservice key identifiable object data after updating it','This hook allows to modify webservice key identifiable object forms data after it was updated',1,1),(252,'actionAfterUpdateMetaFormHandler','Modify meta identifiable object data after updating it','This hook allows to modify meta identifiable object forms data after it was updated',1,1),(253,'actionAfterUpdateCategoryFormHandler','Modify category identifiable object data after updating it','This hook allows to modify category identifiable object forms data after it was updated',1,1),(254,'actionAfterUpdateRootCategoryFormHandler','Modify root category identifiable object data after updating it','This hook allows to modify root category identifiable object forms data after it was updated',1,1),(255,'actionAfterUpdateContactFormHandler','Modify contact identifiable object data after updating it','This hook allows to modify contact identifiable object forms data after it was updated',1,1),(256,'actionAfterUpdateCmsPageCategoryFormHandler','Modify cms page category identifiable object data after updating it','This hook allows to modify cms page category identifiable object forms data after it was updated',1,1),(257,'actionAfterUpdateTaxFormHandler','Modify tax identifiable object data after updating it','This hook allows to modify tax identifiable object forms data after it was updated',1,1),(258,'actionAfterUpdateManufacturerFormHandler','Modify manufacturer identifiable object data after updating it','This hook allows to modify manufacturer identifiable object forms data after it was updated',1,1),(259,'actionAfterUpdateEmployeeFormHandler','Modify employee identifiable object data after updating it','This hook allows to modify employee identifiable object forms data after it was updated',1,1),(260,'actionAfterUpdateProfileFormHandler','Modify profile identifiable object data after updating it','This hook allows to modify profile identifiable object forms data after it was updated',1,1),(261,'actionAfterUpdateCmsPageFormHandler','Modify cms page identifiable object data after updating it','This hook allows to modify cms page identifiable object forms data after it was updated',1,1),(262,'actionAfterUpdateManufacturerAddressFormHandler','Modify manufacturer address identifiable object data after updating it','This hook allows to modify manufacturer address identifiable object forms data after it was updated',1,1),(263,'actionBeforeCreateSqlRequestFormHandler','Modify sql request identifiable object data before creating it','This hook allows to modify sql request identifiable object forms data before it was created',1,1),(264,'actionBeforeCreateCustomerFormHandler','Modify customer identifiable object data before creating it','This hook allows to modify customer identifiable object forms data before it was created',1,1),(265,'actionBeforeCreateLanguageFormHandler','Modify language identifiable object data before creating it','This hook allows to modify language identifiable object forms data before it was created',1,1),(266,'actionBeforeCreateCurrencyFormHandler','Modify currency identifiable object data before creating it','This hook allows to modify currency identifiable object forms data before it was created',1,1),(267,'actionBeforeCreateWebserviceKeyFormHandler','Modify webservice key identifiable object data before creating it','This hook allows to modify webservice key identifiable object forms data before it was created',1,1),(268,'actionBeforeCreateMetaFormHandler','Modify meta identifiable object data before creating it','This hook allows to modify meta identifiable object forms data before it was created',1,1),(269,'actionBeforeCreateCategoryFormHandler','Modify category identifiable object data before creating it','This hook allows to modify category identifiable object forms data before it was created',1,1),(270,'actionBeforeCreateRootCategoryFormHandler','Modify root category identifiable object data before creating it','This hook allows to modify root category identifiable object forms data before it was created',1,1),(271,'actionBeforeCreateContactFormHandler','Modify contact identifiable object data before creating it','This hook allows to modify contact identifiable object forms data before it was created',1,1),(272,'actionBeforeCreateCmsPageCategoryFormHandler','Modify cms page category identifiable object data before creating it','This hook allows to modify cms page category identifiable object forms data before it was created',1,1),(273,'actionBeforeCreateTaxFormHandler','Modify tax identifiable object data before creating it','This hook allows to modify tax identifiable object forms data before it was created',1,1),(274,'actionBeforeCreateManufacturerFormHandler','Modify manufacturer identifiable object data before creating it','This hook allows to modify manufacturer identifiable object forms data before it was created',1,1),(275,'actionBeforeCreateEmployeeFormHandler','Modify employee identifiable object data before creating it','This hook allows to modify employee identifiable object forms data before it was created',1,1),(276,'actionBeforeCreateProfileFormHandler','Modify profile identifiable object data before creating it','This hook allows to modify profile identifiable object forms data before it was created',1,1),(277,'actionBeforeCreateCmsPageFormHandler','Modify cms page identifiable object data before creating it','This hook allows to modify cms page identifiable object forms data before it was created',1,1),(278,'actionBeforeCreateManufacturerAddressFormHandler','Modify manufacturer address identifiable object data before creating it','This hook allows to modify manufacturer address identifiable object forms data before it was created',1,1),(279,'actionAfterCreateSqlRequestFormHandler','Modify sql request identifiable object data after creating it','This hook allows to modify sql request identifiable object forms data after it was created',1,1),(280,'actionAfterCreateCustomerFormHandler','Modify customer identifiable object data after creating it','This hook allows to modify customer identifiable object forms data after it was created',1,1),(281,'actionAfterCreateLanguageFormHandler','Modify language identifiable object data after creating it','This hook allows to modify language identifiable object forms data after it was created',1,1),(282,'actionAfterCreateCurrencyFormHandler','Modify currency identifiable object data after creating it','This hook allows to modify currency identifiable object forms data after it was created',1,1),(283,'actionAfterCreateWebserviceKeyFormHandler','Modify webservice key identifiable object data after creating it','This hook allows to modify webservice key identifiable object forms data after it was created',1,1),(284,'actionAfterCreateMetaFormHandler','Modify meta identifiable object data after creating it','This hook allows to modify meta identifiable object forms data after it was created',1,1),(285,'actionAfterCreateCategoryFormHandler','Modify category identifiable object data after creating it','This hook allows to modify category identifiable object forms data after it was created',1,1),(286,'actionAfterCreateRootCategoryFormHandler','Modify root category identifiable object data after creating it','This hook allows to modify root category identifiable object forms data after it was created',1,1),(287,'actionAfterCreateContactFormHandler','Modify contact identifiable object data after creating it','This hook allows to modify contact identifiable object forms data after it was created',1,1),(288,'actionAfterCreateCmsPageCategoryFormHandler','Modify cms page category identifiable object data after creating it','This hook allows to modify cms page category identifiable object forms data after it was created',1,1),(289,'actionAfterCreateTaxFormHandler','Modify tax identifiable object data after creating it','This hook allows to modify tax identifiable object forms data after it was created',1,1),(290,'actionAfterCreateManufacturerFormHandler','Modify manufacturer identifiable object data after creating it','This hook allows to modify manufacturer identifiable object forms data after it was created',1,1),(291,'actionAfterCreateEmployeeFormHandler','Modify employee identifiable object data after creating it','This hook allows to modify employee identifiable object forms data after it was created',1,1),(292,'actionAfterCreateProfileFormHandler','Modify profile identifiable object data after creating it','This hook allows to modify profile identifiable object forms data after it was created',1,1),(293,'actionAfterCreateCmsPageFormHandler','Modify cms page identifiable object data after creating it','This hook allows to modify cms page identifiable object forms data after it was created',1,1),(294,'actionAfterCreateManufacturerAddressFormHandler','Modify manufacturer address identifiable object data after creating it','This hook allows to modify manufacturer address identifiable object forms data after it was created',1,1),(295,'actionShippingPreferencesPageForm','Modify shipping preferences page options form content','This hook allows to modify shipping preferences page options form FormBuilder',1,1),(296,'actionOrdersInvoicesByDateForm','Modify orders invoices by date options form content','This hook allows to modify orders invoices by date options form FormBuilder',1,1),(297,'actionOrdersInvoicesByStatusForm','Modify orders invoices by status options form content','This hook allows to modify orders invoices by status options form FormBuilder',1,1),(298,'actionOrdersInvoicesOptionsForm','Modify orders invoices options options form content','This hook allows to modify orders invoices options options form FormBuilder',1,1),(299,'actionCustomerPreferencesPageForm','Modify customer preferences page options form content','This hook allows to modify customer preferences page options form FormBuilder',1,1),(300,'actionOrderPreferencesPageForm','Modify order preferences page options form content','This hook allows to modify order preferences page options form FormBuilder',1,1),(301,'actionProductPreferencesPageForm','Modify product preferences page options form content','This hook allows to modify product preferences page options form FormBuilder',1,1),(302,'actionGeneralPageForm','Modify general page options form content','This hook allows to modify general page options form FormBuilder',1,1),(303,'actionLogsPageForm','Modify logs page options form content','This hook allows to modify logs page options form FormBuilder',1,1),(304,'actionOrderDeliverySlipOptionsForm','Modify order delivery slip options options form content','This hook allows to modify order delivery slip options options form FormBuilder',1,1),(305,'actionOrderDeliverySlipPdfForm','Modify order delivery slip pdf options form content','This hook allows to modify order delivery slip pdf options form FormBuilder',1,1),(306,'actionGeolocationPageForm','Modify geolocation page options form content','This hook allows to modify geolocation page options form FormBuilder',1,1),(307,'actionLocalizationPageForm','Modify localization page options form content','This hook allows to modify localization page options form FormBuilder',1,1),(308,'actionPaymentPreferencesForm','Modify payment preferences options form content','This hook allows to modify payment preferences options form FormBuilder',1,1),(309,'actionEmailConfigurationForm','Modify email configuration options form content','This hook allows to modify email configuration options form FormBuilder',1,1),(310,'actionRequestSqlForm','Modify request sql options form content','This hook allows to modify request sql options form FormBuilder',1,1),(311,'actionBackupForm','Modify backup options form content','This hook allows to modify backup options form FormBuilder',1,1),(312,'actionWebservicePageForm','Modify webservice page options form content','This hook allows to modify webservice page options form FormBuilder',1,1),(313,'actionMetaPageForm','Modify meta page options form content','This hook allows to modify meta page options form FormBuilder',1,1),(314,'actionEmployeeForm','Modify employee options form content','This hook allows to modify employee options form FormBuilder',1,1),(315,'actionCurrencyForm','Modify currency options form content','This hook allows to modify currency options form FormBuilder',1,1),(316,'actionShopLogoForm','Modify shop logo options form content','This hook allows to modify shop logo options form FormBuilder',1,1),(317,'actionTaxForm','Modify tax options form content','This hook allows to modify tax options form FormBuilder',1,1),(318,'actionMailThemeForm','Modify mail theme options form content','This hook allows to modify mail theme options form FormBuilder',1,1),(319,'actionPerformancePageSave','Modify performance page options form saved data','This hook allows to modify data of performance page options form after it was saved',1,1),(320,'actionMaintenancePageSave','Modify maintenance page options form saved data','This hook allows to modify data of maintenance page options form after it was saved',1,1),(321,'actionAdministrationPageSave','Modify administration page options form saved data','This hook allows to modify data of administration page options form after it was saved',1,1),(322,'actionShippingPreferencesPageSave','Modify shipping preferences page options form saved data','This hook allows to modify data of shipping preferences page options form after it was saved',1,1),(323,'actionOrdersInvoicesByDateSave','Modify orders invoices by date options form saved data','This hook allows to modify data of orders invoices by date options form after it was saved',1,1),(324,'actionOrdersInvoicesByStatusSave','Modify orders invoices by status options form saved data','This hook allows to modify data of orders invoices by status options form after it was saved',1,1),(325,'actionOrdersInvoicesOptionsSave','Modify orders invoices options options form saved data','This hook allows to modify data of orders invoices options options form after it was saved',1,1),(326,'actionCustomerPreferencesPageSave','Modify customer preferences page options form saved data','This hook allows to modify data of customer preferences page options form after it was saved',1,1),(327,'actionOrderPreferencesPageSave','Modify order preferences page options form saved data','This hook allows to modify data of order preferences page options form after it was saved',1,1),(328,'actionProductPreferencesPageSave','Modify product preferences page options form saved data','This hook allows to modify data of product preferences page options form after it was saved',1,1),(329,'actionGeneralPageSave','Modify general page options form saved data','This hook allows to modify data of general page options form after it was saved',1,1),(330,'actionLogsPageSave','Modify logs page options form saved data','This hook allows to modify data of logs page options form after it was saved',1,1),(331,'actionOrderDeliverySlipOptionsSave','Modify order delivery slip options options form saved data','This hook allows to modify data of order delivery slip options options form after it was saved',1,1),(332,'actionOrderDeliverySlipPdfSave','Modify order delivery slip pdf options form saved data','This hook allows to modify data of order delivery slip pdf options form after it was saved',1,1),(333,'actionGeolocationPageSave','Modify geolocation page options form saved data','This hook allows to modify data of geolocation page options form after it was saved',1,1),(334,'actionLocalizationPageSave','Modify localization page options form saved data','This hook allows to modify data of localization page options form after it was saved',1,1),(335,'actionPaymentPreferencesSave','Modify payment preferences options form saved data','This hook allows to modify data of payment preferences options form after it was saved',1,1),(336,'actionEmailConfigurationSave','Modify email configuration options form saved data','This hook allows to modify data of email configuration options form after it was saved',1,1),(337,'actionRequestSqlSave','Modify request sql options form saved data','This hook allows to modify data of request sql options form after it was saved',1,1),(338,'actionBackupSave','Modify backup options form saved data','This hook allows to modify data of backup options form after it was saved',1,1),(339,'actionWebservicePageSave','Modify webservice page options form saved data','This hook allows to modify data of webservice page options form after it was saved',1,1),(340,'actionMetaPageSave','Modify meta page options form saved data','This hook allows to modify data of meta page options form after it was saved',1,1),(341,'actionEmployeeSave','Modify employee options form saved data','This hook allows to modify data of employee options form after it was saved',1,1),(342,'actionCurrencySave','Modify currency options form saved data','This hook allows to modify data of currency options form after it was saved',1,1),(343,'actionShopLogoSave','Modify shop logo options form saved data','This hook allows to modify data of shop logo options form after it was saved',1,1),(344,'actionTaxSave','Modify tax options form saved data','This hook allows to modify data of tax options form after it was saved',1,1),(345,'actionMailThemeSave','Modify mail theme options form saved data','This hook allows to modify data of mail theme options form after it was saved',1,1),(346,'actionCategoryGridDefinitionModifier','Modify category grid definition','This hook allows to alter category grid columns, actions and filters',1,1),(347,'actionEmployeeGridDefinitionModifier','Modify employee grid definition','This hook allows to alter employee grid columns, actions and filters',1,1),(348,'actionContactGridDefinitionModifier','Modify contact grid definition','This hook allows to alter contact grid columns, actions and filters',1,1),(349,'actionCustomerGridDefinitionModifier','Modify customer grid definition','This hook allows to alter customer grid columns, actions and filters',1,1),(350,'actionLanguageGridDefinitionModifier','Modify language grid definition','This hook allows to alter language grid columns, actions and filters',1,1),(351,'actionCurrencyGridDefinitionModifier','Modify currency grid definition','This hook allows to alter currency grid columns, actions and filters',1,1),(352,'actionSupplierGridDefinitionModifier','Modify supplier grid definition','This hook allows to alter supplier grid columns, actions and filters',1,1),(353,'actionProfileGridDefinitionModifier','Modify profile grid definition','This hook allows to alter profile grid columns, actions and filters',1,1),(354,'actionCmsPageCategoryGridDefinitionModifier','Modify cms page category grid definition','This hook allows to alter cms page category grid columns, actions and filters',1,1),(355,'actionTaxGridDefinitionModifier','Modify tax grid definition','This hook allows to alter tax grid columns, actions and filters',1,1),(356,'actionManufacturerGridDefinitionModifier','Modify manufacturer grid definition','This hook allows to alter manufacturer grid columns, actions and filters',1,1),(357,'actionManufacturerAddressGridDefinitionModifier','Modify manufacturer address grid definition','This hook allows to alter manufacturer address grid columns, actions and filters',1,1),(358,'actionCmsPageGridDefinitionModifier','Modify cms page grid definition','This hook allows to alter cms page grid columns, actions and filters',1,1),(359,'actionBackupGridQueryBuilderModifier','Modify backup grid query builder','This hook allows to alter Doctrine query builder for backup grid',1,1),(360,'actionCategoryGridQueryBuilderModifier','Modify category grid query builder','This hook allows to alter Doctrine query builder for category grid',1,1),(361,'actionEmployeeGridQueryBuilderModifier','Modify employee grid query builder','This hook allows to alter Doctrine query builder for employee grid',1,1),(362,'actionContactGridQueryBuilderModifier','Modify contact grid query builder','This hook allows to alter Doctrine query builder for contact grid',1,1),(363,'actionCustomerGridQueryBuilderModifier','Modify customer grid query builder','This hook allows to alter Doctrine query builder for customer grid',1,1),(364,'actionLanguageGridQueryBuilderModifier','Modify language grid query builder','This hook allows to alter Doctrine query builder for language grid',1,1),(365,'actionCurrencyGridQueryBuilderModifier','Modify currency grid query builder','This hook allows to alter Doctrine query builder for currency grid',1,1),(366,'actionSupplierGridQueryBuilderModifier','Modify supplier grid query builder','This hook allows to alter Doctrine query builder for supplier grid',1,1),(367,'actionProfileGridQueryBuilderModifier','Modify profile grid query builder','This hook allows to alter Doctrine query builder for profile grid',1,1),(368,'actionCmsPageCategoryGridQueryBuilderModifier','Modify cms page category grid query builder','This hook allows to alter Doctrine query builder for cms page category grid',1,1),(369,'actionTaxGridQueryBuilderModifier','Modify tax grid query builder','This hook allows to alter Doctrine query builder for tax grid',1,1),(370,'actionManufacturerGridQueryBuilderModifier','Modify manufacturer grid query builder','This hook allows to alter Doctrine query builder for manufacturer grid',1,1),(371,'actionManufacturerAddressGridQueryBuilderModifier','Modify manufacturer address grid query builder','This hook allows to alter Doctrine query builder for manufacturer address grid',1,1),(372,'actionCmsPageGridQueryBuilderModifier','Modify cms page grid query builder','This hook allows to alter Doctrine query builder for cms page grid',1,1),(373,'actionLogsGridDataModifier','Modify logs grid data','This hook allows to modify logs grid data',1,1),(374,'actionEmailLogsGridDataModifier','Modify email logs grid data','This hook allows to modify email logs grid data',1,1),(375,'actionSqlRequestGridDataModifier','Modify sql request grid data','This hook allows to modify sql request grid data',1,1),(376,'actionBackupGridDataModifier','Modify backup grid data','This hook allows to modify backup grid data',1,1),(377,'actionWebserviceKeyGridDataModifier','Modify webservice key grid data','This hook allows to modify webservice key grid data',1,1),(378,'actionMetaGridDataModifier','Modify meta grid data','This hook allows to modify meta grid data',1,1),(379,'actionCategoryGridDataModifier','Modify category grid data','This hook allows to modify category grid data',1,1),(380,'actionEmployeeGridDataModifier','Modify employee grid data','This hook allows to modify employee grid data',1,1),(381,'actionContactGridDataModifier','Modify contact grid data','This hook allows to modify contact grid data',1,1),(382,'actionCustomerGridDataModifier','Modify customer grid data','This hook allows to modify customer grid data',1,1),(383,'actionLanguageGridDataModifier','Modify language grid data','This hook allows to modify language grid data',1,1),(384,'actionCurrencyGridDataModifier','Modify currency grid data','This hook allows to modify currency grid data',1,1),(385,'actionSupplierGridDataModifier','Modify supplier grid data','This hook allows to modify supplier grid data',1,1),(386,'actionProfileGridDataModifier','Modify profile grid data','This hook allows to modify profile grid data',1,1),(387,'actionCmsPageCategoryGridDataModifier','Modify cms page category grid data','This hook allows to modify cms page category grid data',1,1),(388,'actionTaxGridDataModifier','Modify tax grid data','This hook allows to modify tax grid data',1,1),(389,'actionManufacturerGridDataModifier','Modify manufacturer grid data','This hook allows to modify manufacturer grid data',1,1),(390,'actionManufacturerAddressGridDataModifier','Modify manufacturer address grid data','This hook allows to modify manufacturer address grid data',1,1),(391,'actionCmsPageGridDataModifier','Modify cms page grid data','This hook allows to modify cms page grid data',1,1),(392,'actionCategoryGridFilterFormModifier','Modify category grid filters','This hook allows to modify filters for category grid',1,1),(393,'actionEmployeeGridFilterFormModifier','Modify employee grid filters','This hook allows to modify filters for employee grid',1,1),(394,'actionContactGridFilterFormModifier','Modify contact grid filters','This hook allows to modify filters for contact grid',1,1),(395,'actionCustomerGridFilterFormModifier','Modify customer grid filters','This hook allows to modify filters for customer grid',1,1),(396,'actionLanguageGridFilterFormModifier','Modify language grid filters','This hook allows to modify filters for language grid',1,1),(397,'actionCurrencyGridFilterFormModifier','Modify currency grid filters','This hook allows to modify filters for currency grid',1,1),(398,'actionSupplierGridFilterFormModifier','Modify supplier grid filters','This hook allows to modify filters for supplier grid',1,1),(399,'actionProfileGridFilterFormModifier','Modify profile grid filters','This hook allows to modify filters for profile grid',1,1),(400,'actionCmsPageCategoryGridFilterFormModifier','Modify cms page category grid filters','This hook allows to modify filters for cms page category grid',1,1),(401,'actionTaxGridFilterFormModifier','Modify tax grid filters','This hook allows to modify filters for tax grid',1,1),(402,'actionManufacturerGridFilterFormModifier','Modify manufacturer grid filters','This hook allows to modify filters for manufacturer grid',1,1),(403,'actionManufacturerAddressGridFilterFormModifier','Modify manufacturer address grid filters','This hook allows to modify filters for manufacturer address grid',1,1),(404,'actionCmsPageGridFilterFormModifier','Modify cms page grid filters','This hook allows to modify filters for cms page grid',1,1),(405,'actionCategoryGridPresenterModifier','Modify category grid template data','This hook allows to modify data which is about to be used in template for category grid',1,1),(406,'actionEmployeeGridPresenterModifier','Modify employee grid template data','This hook allows to modify data which is about to be used in template for employee grid',1,1),(407,'actionContactGridPresenterModifier','Modify contact grid template data','This hook allows to modify data which is about to be used in template for contact grid',1,1),(408,'actionCustomerGridPresenterModifier','Modify customer grid template data','This hook allows to modify data which is about to be used in template for customer grid',1,1),(409,'actionLanguageGridPresenterModifier','Modify language grid template data','This hook allows to modify data which is about to be used in template for language grid',1,1),(410,'actionCurrencyGridPresenterModifier','Modify currency grid template data','This hook allows to modify data which is about to be used in template for currency grid',1,1),(411,'actionSupplierGridPresenterModifier','Modify supplier grid template data','This hook allows to modify data which is about to be used in template for supplier grid',1,1),(412,'actionProfileGridPresenterModifier','Modify profile grid template data','This hook allows to modify data which is about to be used in template for profile grid',1,1),(413,'actionCmsPageCategoryGridPresenterModifier','Modify cms page category grid template data','This hook allows to modify data which is about to be used in template for cms page category grid',1,1),(414,'actionTaxGridPresenterModifier','Modify tax grid template data','This hook allows to modify data which is about to be used in template for tax grid',1,1),(415,'actionManufacturerGridPresenterModifier','Modify manufacturer grid template data','This hook allows to modify data which is about to be used in template for manufacturer grid',1,1),(416,'actionManufacturerAddressGridPresenterModifier','Modify manufacturer address grid template data','This hook allows to modify data which is about to be used in template for manufacturer address grid',1,1),(417,'actionCmsPageGridPresenterModifier','Modify cms page grid template data','This hook allows to modify data which is about to be used in template for cms page grid',1,1),(418,'displayAdminOrderTop','Admin Order Top','This hook displays content at the top of the order view page',1,1),(419,'displayBackOfficeOrderActions','Admin Order Actions','This hook displays content in the order view page after action buttons (or aliased to side column in migrated page)',1,1),(420,'displayAdminOrderSide','Admin Order Side Column','This hook displays content in the order view page in the side column under the customer view',1,1),(421,'displayAdminOrderBottom','Admin Order Side Column Bottom','This hook displays content in the order view page at the bottom of the side column',1,1),(422,'displayAdminOrderMain','Admin Order Main Column','This hook displays content in the order view page in the main column under the details view',1,1),(423,'displayAdminOrderMainBottom','Admin Order Main Column Bottom','This hook displays content in the order view page at the bottom of the main column',1,1),(424,'displayAdminOrderTabLink','Admin Order Tab Link','This hook displays new tab links on the order view page',1,1),(425,'displayAdminOrderTabContent','Admin Order Tab Content','This hook displays new tab contents on the order view page',1,1),(426,'actionGetAdminOrderButtons','Admin Order Buttons','This hook is used to generate the buttons collection on the order view page (see ActionsBarButtonsCollection)',1,1),(427,'actionPresentCart','Cart Presenter','This hook is called before a cart is presented',1,1),(428,'actionPresentOrder','Order Presenter','This hook is called before an order is presented',1,1),(429,'actionPresentOrderReturn','Order Return Presenter','This hook is called before an order return is presented',1,1),(430,'actionPresentSupplier','Supplier Presenter','This hook is called before a supplier is presented',1,1),(431,'actionPresentManufacturer','Manufacturer Presenter','This hook is called before a manufacturer is presented',1,1),(432,'actionPresentProduct','Product Presenter','This hook is called before a product is presented',1,1),(433,'actionPresentStore','Store Presenter','This hook is called before a store is presented',1,1),(434,'actionPresentCategory','Category Presenter','This hook is called before a category is presented',1,1),(435,'actionAdminAdminPreferencesControllerPostProcessBefore','On post-process in Admin Preferences','This hook is called on Admin Preferences post-process before processing the form',1,1),(436,'actionFeatureFormBuilderModifier','Modify feature identifiable object form','This hook allows to modify feature identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(437,'actionOrderMessageFormBuilderModifier','Modify order message identifiable object form','This hook allows to modify order message identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(438,'actionCatalogPriceRuleFormBuilderModifier','Modify catalog price rule identifiable object form','This hook allows to modify catalog price rule identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(439,'actionAttachmentFormBuilderModifier','Modify attachment identifiable object form','This hook allows to modify attachment identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(440,'actionBeforeUpdateFeatureFormHandler','Modify feature identifiable object data before updating it','This hook allows to modify feature identifiable object forms data before it was updated',1,1),(441,'actionBeforeUpdateOrderMessageFormHandler','Modify order message identifiable object data before updating it','This hook allows to modify order message identifiable object forms data before it was updated',1,1),(442,'actionBeforeUpdateCatalogPriceRuleFormHandler','Modify catalog price rule identifiable object data before updating it','This hook allows to modify catalog price rule identifiable object forms data before it was updated',1,1),(443,'actionBeforeUpdateAttachmentFormHandler','Modify attachment identifiable object data before updating it','This hook allows to modify attachment identifiable object forms data before it was updated',1,1),(444,'actionAfterUpdateFeatureFormHandler','Modify feature identifiable object data after updating it','This hook allows to modify feature identifiable object forms data after it was updated',1,1),(445,'actionAfterUpdateOrderMessageFormHandler','Modify order message identifiable object data after updating it','This hook allows to modify order message identifiable object forms data after it was updated',1,1),(446,'actionAfterUpdateCatalogPriceRuleFormHandler','Modify catalog price rule identifiable object data after updating it','This hook allows to modify catalog price rule identifiable object forms data after it was updated',1,1),(447,'actionAfterUpdateAttachmentFormHandler','Modify attachment identifiable object data after updating it','This hook allows to modify attachment identifiable object forms data after it was updated',1,1),(448,'actionBeforeCreateFeatureFormHandler','Modify feature identifiable object data before creating it','This hook allows to modify feature identifiable object forms data before it was created',1,1),(449,'actionBeforeCreateOrderMessageFormHandler','Modify order message identifiable object data before creating it','This hook allows to modify order message identifiable object forms data before it was created',1,1),(450,'actionBeforeCreateCatalogPriceRuleFormHandler','Modify catalog price rule identifiable object data before creating it','This hook allows to modify catalog price rule identifiable object forms data before it was created',1,1),(451,'actionBeforeCreateAttachmentFormHandler','Modify attachment identifiable object data before creating it','This hook allows to modify attachment identifiable object forms data before it was created',1,1),(452,'actionAfterCreateFeatureFormHandler','Modify feature identifiable object data after creating it','This hook allows to modify feature identifiable object forms data after it was created',1,1),(453,'actionAfterCreateOrderMessageFormHandler','Modify order message identifiable object data after creating it','This hook allows to modify order message identifiable object forms data after it was created',1,1),(454,'actionAfterCreateCatalogPriceRuleFormHandler','Modify catalog price rule identifiable object data after creating it','This hook allows to modify catalog price rule identifiable object forms data after it was created',1,1),(455,'actionAfterCreateAttachmentFormHandler','Modify attachment identifiable object data after creating it','This hook allows to modify attachment identifiable object forms data after it was created',1,1),(456,'actionMerchandiseReturnForm','Modify merchandise return options form content','This hook allows to modify merchandise return options form FormBuilder',1,1),(457,'actionCreditSlipForm','Modify credit slip options form content','This hook allows to modify credit slip options form FormBuilder',1,1),(458,'actionMerchandiseReturnSave','Modify merchandise return options form saved data','This hook allows to modify data of merchandise return options form after it was saved',1,1),(459,'actionCreditSlipSave','Modify credit slip options form saved data','This hook allows to modify data of credit slip options form after it was saved',1,1),(460,'actionEmptyCategoryGridDefinitionModifier','Modify empty category grid definition','This hook allows to alter empty category grid columns, actions and filters',1,1),(461,'actionNoQtyProductWithCombinationGridDefinitionModifier','Modify no qty product with combination grid definition','This hook allows to alter no qty product with combination grid columns, actions and filters\n      ',1,1),(462,'actionNoQtyProductWithoutCombinationGridDefinitionModifier','Modify no qty product without combination grid definition','This hook allows to alter no qty product without combination grid columns, actions and filters\n      ',1,1),(463,'actionDisabledProductGridDefinitionModifier','Modify disabled product grid definition','This hook allows to alter disabled product grid columns, actions and filters',1,1),(464,'actionProductWithoutImageGridDefinitionModifier','Modify product without image grid definition','This hook allows to alter product without image grid columns, actions and filters',1,1),(465,'actionProductWithoutDescriptionGridDefinitionModifier','Modify product without description grid definition','This hook allows to alter product without description grid columns, actions and filters',1,1),(466,'actionProductWithoutPriceGridDefinitionModifier','Modify product without price grid definition','This hook allows to alter product without price grid columns, actions and filters',1,1),(467,'actionOrderGridDefinitionModifier','Modify order grid definition','This hook allows to alter order grid columns, actions and filters',1,1),(468,'actionCatalogPriceRuleGridDefinitionModifier','Modify catalog price rule grid definition','This hook allows to alter catalog price rule grid columns, actions and filters',1,1),(469,'actionOrderMessageGridDefinitionModifier','Modify order message grid definition','This hook allows to alter order message grid columns, actions and filters',1,1),(470,'actionAttachmentGridDefinitionModifier','Modify attachment grid definition','This hook allows to alter attachment grid columns, actions and filters',1,1),(471,'actionAttributeGroupGridDefinitionModifier','Modify attribute group grid definition','This hook allows to alter attribute group grid columns, actions and filters',1,1),(472,'actionMerchandiseReturnGridDefinitionModifier','Modify merchandise return grid definition','This hook allows to alter merchandise return grid columns, actions and filters',1,1),(473,'actionTaxRulesGroupGridDefinitionModifier','Modify tax rules group grid definition','This hook allows to alter tax rules group grid columns, actions and filters',1,1),(474,'actionAddressGridDefinitionModifier','Modify address grid definition','This hook allows to alter address grid columns, actions and filters',1,1),(475,'actionCreditSlipGridDefinitionModifier','Modify credit slip grid definition','This hook allows to alter credit slip grid columns, actions and filters',1,1),(476,'actionEmptyCategoryGridQueryBuilderModifier','Modify empty category grid query builder','This hook allows to alter Doctrine query builder for empty category grid',1,1),(477,'actionNoQtyProductWithCombinationGridQueryBuilderModifier','Modify no qty product with combination grid query builder','This hook allows to alter Doctrine query builder for no qty product with combination grid',1,1),(478,'actionNoQtyProductWithoutCombinationGridQueryBuilderModifier','Modify no qty product without combination grid query builder','This hook allows to alter Doctrine query builder for no qty product without combination grid',1,1),(479,'actionDisabledProductGridQueryBuilderModifier','Modify disabled product grid query builder','This hook allows to alter Doctrine query builder for disabled product grid',1,1),(480,'actionProductWithoutImageGridQueryBuilderModifier','Modify product without image grid query builder','This hook allows to alter Doctrine query builder for product without image grid',1,1),(481,'actionProductWithoutDescriptionGridQueryBuilderModifier','Modify product without description grid query builder','This hook allows to alter Doctrine query builder for product without description grid',1,1),(482,'actionProductWithoutPriceGridQueryBuilderModifier','Modify product without price grid query builder','This hook allows to alter Doctrine query builder for product without price grid',1,1),(483,'actionOrderGridQueryBuilderModifier','Modify order grid query builder','This hook allows to alter Doctrine query builder for order grid',1,1),(484,'actionCatalogPriceRuleGridQueryBuilderModifier','Modify catalog price rule grid query builder','This hook allows to alter Doctrine query builder for catalog price rule grid',1,1),(485,'actionOrderMessageGridQueryBuilderModifier','Modify order message grid query builder','This hook allows to alter Doctrine query builder for order message grid',1,1),(486,'actionAttachmentGridQueryBuilderModifier','Modify attachment grid query builder','This hook allows to alter Doctrine query builder for attachment grid',1,1),(487,'actionAttributeGroupGridQueryBuilderModifier','Modify attribute group grid query builder','This hook allows to alter Doctrine query builder for attribute group grid',1,1),(488,'actionMerchandiseReturnGridQueryBuilderModifier','Modify merchandise return grid query builder','This hook allows to alter Doctrine query builder for merchandise return grid',1,1),(489,'actionTaxRulesGroupGridQueryBuilderModifier','Modify tax rules group grid query builder','This hook allows to alter Doctrine query builder for tax rules group grid',1,1),(490,'actionAddressGridQueryBuilderModifier','Modify address grid query builder','This hook allows to alter Doctrine query builder for address grid',1,1),(491,'actionCreditSlipGridQueryBuilderModifier','Modify credit slip grid query builder','This hook allows to alter Doctrine query builder for credit slip grid',1,1),(492,'actionEmptyCategoryGridDataModifier','Modify empty category grid data','This hook allows to modify empty category grid data',1,1),(493,'actionNoQtyProductWithCombinationGridDataModifier','Modify no qty product with combination grid data','This hook allows to modify no qty product with combination grid data',1,1),(494,'actionNoQtyProductWithoutCombinationGridDataModifier','Modify no qty product without combination grid data','This hook allows to modify no qty product without combination grid data',1,1),(495,'actionDisabledProductGridDataModifier','Modify disabled product grid data','This hook allows to modify disabled product grid data',1,1),(496,'actionProductWithoutImageGridDataModifier','Modify product without image grid data','This hook allows to modify product without image grid data',1,1),(497,'actionProductWithoutDescriptionGridDataModifier','Modify product without description grid data','This hook allows to modify product without description grid data',1,1),(498,'actionProductWithoutPriceGridDataModifier','Modify product without price grid data','This hook allows to modify product without price grid data',1,1),(499,'actionOrderGridDataModifier','Modify order grid data','This hook allows to modify order grid data',1,1),(500,'actionCatalogPriceRuleGridDataModifier','Modify catalog price rule grid data','This hook allows to modify catalog price rule grid data',1,1),(501,'actionOrderMessageGridDataModifier','Modify order message grid data','This hook allows to modify order message grid data',1,1),(502,'actionAttachmentGridDataModifier','Modify attachment grid data','This hook allows to modify attachment grid data',1,1),(503,'actionAttributeGroupGridDataModifier','Modify attribute group grid data','This hook allows to modify attribute group grid data',1,1),(504,'actionMerchandiseReturnGridDataModifier','Modify merchandise return grid data','This hook allows to modify merchandise return grid data',1,1),(505,'actionTaxRulesGroupGridDataModifier','Modify tax rules group grid data','This hook allows to modify tax rules group grid data',1,1),(506,'actionAddressGridDataModifier','Modify address grid data','This hook allows to modify address grid data',1,1),(507,'actionCreditSlipGridDataModifier','Modify credit slip grid data','This hook allows to modify credit slip grid data',1,1),(508,'actionEmptyCategoryGridFilterFormModifier','Modify empty category grid filters','This hook allows to modify filters for empty category grid',1,1),(509,'actionNoQtyProductWithCombinationGridFilterFormModifier','Modify no qty product with combination grid filters','This hook allows to modify filters for no qty product with combination grid',1,1),(510,'actionNoQtyProductWithoutCombinationGridFilterFormModifier','Modify no qty product without combination grid filters','This hook allows to modify filters for no qty product without combination grid',1,1),(511,'actionDisabledProductGridFilterFormModifier','Modify disabled product grid filters','This hook allows to modify filters for disabled product grid',1,1),(512,'actionProductWithoutImageGridFilterFormModifier','Modify product without image grid filters','This hook allows to modify filters for product without image grid',1,1),(513,'actionProductWithoutDescriptionGridFilterFormModifier','Modify product without description grid filters','This hook allows to modify filters for product without description grid',1,1),(514,'actionProductWithoutPriceGridFilterFormModifier','Modify product without price grid filters','This hook allows to modify filters for product without price grid',1,1),(515,'actionOrderGridFilterFormModifier','Modify order grid filters','This hook allows to modify filters for order grid',1,1),(516,'actionCatalogPriceRuleGridFilterFormModifier','Modify catalog price rule grid filters','This hook allows to modify filters for catalog price rule grid',1,1),(517,'actionOrderMessageGridFilterFormModifier','Modify order message grid filters','This hook allows to modify filters for order message grid',1,1),(518,'actionAttachmentGridFilterFormModifier','Modify attachment grid filters','This hook allows to modify filters for attachment grid',1,1),(519,'actionAttributeGroupGridFilterFormModifier','Modify attribute group grid filters','This hook allows to modify filters for attribute group grid',1,1),(520,'actionMerchandiseReturnGridFilterFormModifier','Modify merchandise return grid filters','This hook allows to modify filters for merchandise return grid',1,1),(521,'actionTaxRulesGroupGridFilterFormModifier','Modify tax rules group grid filters','This hook allows to modify filters for tax rules group grid',1,1),(522,'actionAddressGridFilterFormModifier','Modify address grid filters','This hook allows to modify filters for address grid',1,1),(523,'actionCreditSlipGridFilterFormModifier','Modify credit slip grid filters','This hook allows to modify filters for credit slip grid',1,1),(524,'actionEmptyCategoryGridPresenterModifier','Modify empty category grid template data','This hook allows to modify data which is about to be used in template for empty category grid',1,1),(525,'actionNoQtyProductWithCombinationGridPresenterModifier','Modify no qty product with combination grid template data','This hook allows to modify data which is about to be used in template for no qty product with combination grid',1,1),(526,'actionNoQtyProductWithoutCombinationGridPresenterModifier','Modify no qty product without combination grid template data','This hook allows to modify data which is about to be used in template for no qty product without combination grid',1,1),(527,'actionDisabledProductGridPresenterModifier','Modify disabled product grid template data','This hook allows to modify data which is about to be used in template for disabled product grid',1,1),(528,'actionProductWithoutImageGridPresenterModifier','Modify product without image grid template data','This hook allows to modify data which is about to be used in template for product without image grid',1,1),(529,'actionProductWithoutDescriptionGridPresenterModifier','Modify product without description grid template data','This hook allows to modify data which is about to be used in template for product without description grid',1,1),(530,'actionProductWithoutPriceGridPresenterModifier','Modify product without price grid template data','This hook allows to modify data which is about to be used in template for product without price grid',1,1),(531,'actionOrderGridPresenterModifier','Modify order grid template data','This hook allows to modify data which is about to be used in template for order grid',1,1),(532,'actionCatalogPriceRuleGridPresenterModifier','Modify catalog price rule grid template data','This hook allows to modify data which is about to be used in template for catalog price rule grid',1,1),(533,'actionOrderMessageGridPresenterModifier','Modify order message grid template data','This hook allows to modify data which is about to be used in template for order message grid',1,1),(534,'actionAttachmentGridPresenterModifier','Modify attachment grid template data','This hook allows to modify data which is about to be used in template for attachment grid',1,1),(535,'actionAttributeGroupGridPresenterModifier','Modify attribute group grid template data','This hook allows to modify data which is about to be used in template for attribute group grid',1,1),(536,'actionMerchandiseReturnGridPresenterModifier','Modify merchandise return grid template data','This hook allows to modify data which is about to be used in template for merchandise return grid',1,1),(537,'actionTaxRulesGroupGridPresenterModifier','Modify tax rules group grid template data','This hook allows to modify data which is about to be used in template for tax rules group grid',1,1),(538,'actionAddressGridPresenterModifier','Modify address grid template data','This hook allows to modify data which is about to be used in template for address grid',1,1),(539,'actionCreditSlipGridPresenterModifier','Modify credit slip grid template data','This hook allows to modify data which is about to be used in template for credit slip grid',1,1),(540,'displayAdditionalCustomerAddressFields','Display additional customer address fields','This hook allows to display extra field values added in an address form using hook \'additionalCustomerAddressFields\'',1,1),(541,'displayFooterCategory','Category footer','This hook adds new blocks under the products listing in a category/search',1,1),(542,'displayHeaderCategory','Category header','This hook adds new blocks above the products listing in a category/search',1,1),(543,'actionAdminAdministrationControllerPostProcessBefore','On post-process in Admin Configure Advanced Parameters Administration Controller','This hook is called on Admin Configure Advanced Parameters Administration post-process before processing any form',1,1),(544,'actionAdminAdministrationControllerPostProcessGeneralBefore','On post-process in Admin Configure Advanced Parameters Administration Controller','This hook is called on Admin Configure Advanced Parameters Administration post-process before processing the General form',1,1),(545,'actionAdminAdministrationControllerPostProcessUploadQuotaBefore','On post-process in Admin Configure Advanced Parameters Administration Controller','This hook is called on Admin Configure Advanced Parameters Administration post-process before processing the Upload Quota form',1,1),(546,'actionAdminAdministrationControllerPostProcessNotificationsBefore','On post-process in Admin Configure Advanced Parameters Administration Controller','This hook is called on Admin Configure Advanced Parameters Administration post-process before processing the Notifications form',1,1),(547,'actionAdminAdvancedParametersPerformanceControllerPostProcessSmartyBefore','On post-process in Admin Configure Advanced Parameters Performance Controller','This hook is called on Admin Configure Advanced Parameters Performance post-process before processing the Smarty form',1,1),(548,'actionAdminAdvancedParametersPerformanceControllerPostProcessDebugModeBefore','On post-process in Admin Configure Advanced Parameters Performance Controller','This hook is called on Admin Configure Advanced Parameters Performance post-process before processing the Debug Mode form',1,1),(549,'actionAdminAdvancedParametersPerformanceControllerPostProcessOptionalFeaturesBefore','On post-process in Admin Configure Advanced Parameters Performance Controller','This hook is called on Admin Configure Advanced Parameters Performance post-process before processing the Optional Features form',1,1),(550,'actionAdminAdvancedParametersPerformanceControllerPostProcessCombineCompressCacheBefore','On post-process in Admin Configure Advanced Parameters Performance Controller','This hook is called on Admin Configure Advanced Parameters Performance post-process before processing the Combine Compress Cache form',1,1),(551,'actionAdminAdvancedParametersPerformanceControllerPostProcessMediaServersBefore','On post-process in Admin Configure Advanced Parameters Performance Controller','This hook is called on Admin Configure Advanced Parameters Performance post-process before processing the Media Servers form',1,1),(552,'actionAdminAdvancedParametersPerformanceControllerPostProcessCachingBefore','On post-process in Admin Configure Advanced Parameters Performance Controller','This hook is called on Admin Configure Advanced Parameters Performance post-process before processing the Caching form',1,1),(553,'actionAdminAdvancedParametersPerformanceControllerPostProcessBefore','On post-process in Admin Configure Advanced Parameters Performance Controller','This hook is called on Admin Configure Advanced Parameters Performance post-process before processing any form',1,1),(554,'actionAdminShopParametersMetaControllerPostProcessSetUpUrlsBefore','On post-process in Admin Configure Shop Parameters Meta Controller','This hook is called on Admin Configure Shop Parameters Meta post-process before processing the SetUp Urls form',1,1),(555,'actionAdminShopParametersMetaControllerPostProcessShopUrlsBefore','On post-process in Admin Configure Shop Parameters Meta Controller','This hook is called on Admin Configure Shop Parameters Meta post-process before processing the Shop Urls form',1,1),(556,'actionAdminShopParametersMetaControllerPostProcessUrlSchemaBefore','On post-process in Admin Configure Shop Parameters Meta Controller','This hook is called on Admin Configure Shop Parameters Meta post-process before processing the Url Schema form',1,1),(557,'actionAdminShopParametersMetaControllerPostProcessSeoOptionsBefore','On post-process in Admin Configure Shop Parameters Meta Controller','This hook is called on Admin Configure Shop Parameters Meta post-process before processing the Seo Options form',1,1),(558,'actionAdminAdminShopParametersMetaControllerPostProcessBefore','On post-process in Admin Configure Shop Parameters Meta Controller','This hook is called on Admin Configure Shop Parameters Meta post-process before processing any form',1,1),(559,'actionAdminShopParametersOrderPreferencesControllerPostProcessGeneralBefore','On post-process in Admin Configure Shop Parameters Order Preferences Controller','This hook is called on Admin Configure Shop Parameters Order Preferences post-process before processing the General form',1,1),(560,'actionAdminShopParametersOrderPreferencesControllerPostProcessGiftOptionsBefore','On post-process in Admin Configure Shop Parameters Order Preferences Controller','This hook is called on Admin Configure Shop Parameters Order Preferences post-process before processing the Gift Options form',1,1),(561,'actionAdminShopParametersOrderPreferencesControllerPostProcessBefore','On post-process in Admin Configure Shop Parameters Order Preferences Controller','This hook is called on Admin Configure Shop Parameters Order Preferences post-process before processing any form',1,1),(562,'actionAdminInternationalGeolocationControllerPostProcessByIpAddressBefore','On post-process in Admin Improve International Geolocation Controller','This hook is called on Admin Improve International Geolocation post-process before processing the By Ip Address form',1,1),(563,'actionAdminInternationalGeolocationControllerPostProcessWhitelistBefore','On post-process in Admin Improve International Geolocation Controller','This hook is called on Admin Improve International Geolocation post-process before processing the Whitelist form',1,1),(564,'actionAdminInternationalGeolocationControllerPostProcessOptionsBefore','On post-process in Admin Improve International Geolocation Controller','This hook is called on Admin Improve International Geolocation post-process before processing the Options form',1,1),(565,'actionAdminInternationalGeolocationControllerPostProcessBefore','On post-process in Admin Improve International Geolocation Controller','This hook is called on Admin Improve International Geolocation post-process before processing any form',1,1),(566,'actionAdminInternationalLocalizationControllerPostProcessConfigurationBefore','On post-process in Admin Improve International Localization Controller','This hook is called on Admin Improve International Localization post-process before processing the Configuration form',1,1),(567,'actionAdminInternationalLocalizationControllerPostProcessLocalUnitsBefore','On post-process in Admin Improve International Localization Controller','This hook is called on Admin Improve International Localization post-process before processing the Local Units form',1,1),(568,'actionAdminInternationalLocalizationControllerPostProcessAdvancedBefore','On post-process in Admin Improve International Localization Controller','This hook is called on Admin Improve International Localization post-process before processing the Advanced form',1,1),(569,'actionAdminInternationalLocalizationControllerPostProcessBefore','On post-process in Admin Improve International Localization Controller','This hook is called on Admin Improve International Localization post-process before processing any form',1,1),(570,'actionAdminShippingPreferencesControllerPostProcessHandlingBefore','On post-process in Admin Improve Shipping Preferences Controller','This hook is called on Admin Improve Shipping Preferences post-process before processing the Handling form',1,1),(571,'actionAdminShippingPreferencesControllerPostProcessCarrierOptionsBefore','On post-process in Admin Improve Shipping Preferences Controller','This hook is called on Admin Improve Shipping Preferences post-process before processing the Carrier Options form',1,1),(572,'actionAdminShippingPreferencesControllerPostProcessBefore','On post-process in Admin Improve Shipping Preferences Controller','This hook is called on Admin Improve Shipping Preferences post-process before processing any form',1,1),(573,'actionCheckoutRender','Modify checkout process','This hook is called when constructing the checkout process',1,1),(574,'actionCheckoutBuildProcess','Build checkout process','This hook is triggered before the checkout is rendered. Modules may return a checkout process provider. The provider is used only when exactly one enabled and valid provider is available.',1,1),(575,'actionCheckoutStepRenderTemplate','Modify the parameters of the checkout step template rendering','This hook is called when rendering every checkout step template',1,1),(576,'actionPresentProductListing','Product Listing Presenter','This hook is called before a product listing is presented',1,1),(577,'actionGetProductPropertiesAfterUnitPrice','Product Properties','This hook is called after defining the properties of a product',1,1),(578,'actionProductPriceCalculation','Product Price Calculation','This hook is called into the priceCalculation method to be able to override the price calculation',1,1),(579,'actionOverrideEmployeeImage','Get Employee Image','This hook is used to get the employee image',1,1),(580,'actionProductSearchProviderRunQueryBefore','Runs an action before ProductSearchProviderInterface::RunQuery()','Required to modify an SQL query before executing it',1,1),(581,'actionProductSearchProviderRunQueryAfter','Runs an action after ProductSearchProviderInterface::RunQuery()','Required to return a previous state of an SQL query or/and to change a result of the SQL query after executing it',1,1),(582,'actionFrontControllerSetVariablesBefore','Add general purpose variables in JavaScript object and Smarty templates before assignation.','Allows defining variables for the JavaScript object before the core does it.',1,1),(583,'actionFrontControllerSetVariables','Add variables in JavaScript object and Smarty templates','Add variables to javascript object that is available in Front Office. These are also available in smarty templates in modules.your_module_name.',1,1),(584,'displayAdminOrderCreateExtraButtons','Add buttons on the create order page dropdown','Add buttons on the create order page dropdown',1,1),(587,'actionProductFormBuilderModifier','Modify product identifiable object form','This hook allows to modify product identifiable object form content by modifying form builder data or FormBuilder itself',1,1),(588,'actionBeforeCreateProductFormHandler','Modify product identifiable object data before creating it','This hook allows to modify product identifiable object form data before it was created',1,1),(590,'actionBeforeUpdateProductFormHandler','Modify product identifiable object data before updating it','This hook allows to modify product identifiable object form data before it was updated',1,1),(591,'actionAfterUpdateProductFormHandler','Modify product identifiable object data after updating it','This hook allows to modify product identifiable object form data after it was updated',1,1),(592,'actionCustomerDiscountGridDefinitionModifier','Modify customer discount grid definition','This hook allows to alter customer discount grid columns, actions and filters',1,1),(593,'actionCustomerAddressGridDefinitionModifier','Modify customer address grid definition','This hook allows to alter customer address grid columns, actions and filters',1,1),(594,'actionCartRuleGridDefinitionModifier','Modify cart rule grid definition','This hook allows to alter cart rule grid columns, actions and filters',1,1),(595,'actionOrderStatesGridDefinitionModifier','Modify order states grid definition','This hook allows to alter order states grid columns, actions and filters',1,1),(596,'actionOrderReturnStatesGridDefinitionModifier','Modify order return states grid definition','This hook allows to alter order return states grid columns, actions and filters',1,1),(597,'actionOutstandingGridDefinitionModifier','Modify outstanding grid definition','This hook allows to alter outstanding grid columns, actions and filters',1,1),(598,'actionCarrierGridDefinitionModifier','Modify carrier grid definition','This hook allows to alter carrier grid columns, actions and filters',1,1),(599,'actionZoneGridDefinitionModifier','Modify zone grid definition','This hook allows to alter zone grid columns, actions and filters',1,1),(600,'actionCustomerDiscountGridQueryBuilderModifier','Modify customer discount grid query builder','This hook allows to alter Doctrine query builder for customer discount grid',1,1),(601,'actionCustomerAddressGridQueryBuilderModifier','Modify customer address grid query builder','This hook allows to alter Doctrine query builder for customer address grid',1,1),(602,'actionCartRuleGridQueryBuilderModifier','Modify cart rule grid query builder','This hook allows to alter Doctrine query builder for cart rule grid',1,1),(603,'actionOrderStatesGridQueryBuilderModifier','Modify order states grid query builder','This hook allows to alter Doctrine query builder for order states grid',1,1),(604,'actionOrderReturnStatesGridQueryBuilderModifier','Modify order return states grid query builder','This hook allows to alter Doctrine query builder for order return states grid',1,1),(605,'actionOutstandingGridQueryBuilderModifier','Modify outstanding grid query builder','This hook allows to alter Doctrine query builder for outstanding grid',1,1),(606,'actionCarrierGridQueryBuilderModifier','Modify carrier grid query builder','This hook allows to alter Doctrine query builder for carrier grid',1,1),(607,'actionZoneGridQueryBuilderModifier','Modify zone grid query builder','This hook allows to alter Doctrine query builder for zone grid',1,1),(608,'actionCustomerDiscountGridDataModifier','Modify customer discount grid data','This hook allows to modify customer discount grid data',1,1),(609,'actionCustomerAddressGridDataModifier','Modify customer address grid data','This hook allows to modify customer address grid data',1,1),(610,'actionCartRuleGridDataModifier','Modify cart rule grid data','This hook allows to modify cart rule grid data',1,1),(611,'actionOrderStatesGridDataModifier','Modify order states grid data','This hook allows to modify order states grid data',1,1),(612,'actionOrderReturnStatesGridDataModifier','Modify order return states grid data','This hook allows to modify order return states grid data',1,1),(613,'actionOutstandingGridDataModifier','Modify outstanding grid data','This hook allows to modify outstanding grid data',1,1),(614,'actionCarrierGridDataModifier','Modify carrier grid data','This hook allows to modify carrier grid data',1,1),(615,'actionZoneGridDataModifier','Modify zone grid data','This hook allows to modify zone grid data',1,1),(616,'actionCustomerDiscountGridFilterFormModifier','Modify customer discount grid filters','This hook allows to modify filters for customer discount grid',1,1),(617,'actionCustomerAddressGridFilterFormModifier','Modify customer address grid filters','This hook allows to modify filters for customer address grid',1,1),(618,'actionCartRuleGridFilterFormModifier','Modify cart rule grid filters','This hook allows to modify filters for cart rule grid',1,1),(619,'actionOrderStatesGridFilterFormModifier','Modify order states grid filters','This hook allows to modify filters for order states grid',1,1),(620,'actionOrderReturnStatesGridFilterFormModifier','Modify order return states grid filters','This hook allows to modify filters for order return states grid',1,1),(621,'actionOutstandingGridFilterFormModifier','Modify outstanding grid filters','This hook allows to modify filters for outstanding grid',1,1),(622,'actionCarrierGridFilterFormModifier','Modify carrier grid filters','This hook allows to modify filters for carrier grid',1,1),(623,'actionZoneGridFilterFormModifier','Modify zone grid filters','This hook allows to modify filters for zone grid',1,1),(624,'actionCustomerDiscountGridPresenterModifier','Modify customer discount grid template data','This hook allows to modify data which is about to be used in template for customer discount grid\n      ',1,1),(625,'actionCustomerAddressGridPresenterModifier','Modify customer address grid template data','This hook allows to modify data which is about to be used in template for customer address grid\n      ',1,1),(626,'actionCartRuleGridPresenterModifier','Modify cart rule grid template data','This hook allows to modify data which is about to be used in template for cart rule grid\n      ',1,1),(627,'actionOrderStatesGridPresenterModifier','Modify order states grid template data','This hook allows to modify data which is about to be used in template for order states grid\n      ',1,1),(628,'actionOrderReturnStatesGridPresenterModifier','Modify order return states grid template data','This hook allows to modify data which is about to be used in template for order return states grid\n      ',1,1),(629,'actionOutstandingGridPresenterModifier','Modify outstanding grid template data','This hook allows to modify data which is about to be used in template for outstanding grid\n      ',1,1),(630,'actionCarrierGridPresenterModifier','Modify carrier grid template data','This hook allows to modify data which is about to be used in template for carrier grid',1,1),(631,'actionZoneGridPresenterModifier','Modify zone grid template data','This hook allows to modify data which is about to be used in template for zone grid',1,1),(632,'actionPerformancePageSmartyForm','Modify performance page smarty options form content','This hook allows to modify performance page smarty options form FormBuilder',1,1),(633,'actionPerformancePageDebugModeForm','Modify performance page debug mode options form content','This hook allows to modify performance page debug mode options form FormBuilder',1,1),(634,'actionPerformancePageOptionalFeaturesForm','Modify performance page optional features options form content','This hook allows to modify performance page optional features options form FormBuilder',1,1),(635,'actionPerformancePageCombineCompressCacheForm','Modify performance page combine compress cache options form content','This hook allows to modify performance page combine compress cache options form FormBuilder\n      ',1,1),(636,'actionPerformancePageMediaServersForm','Modify performance page media servers options form content','This hook allows to modify performance page media servers options form FormBuilder',1,1),(637,'actionPerformancePagecachingForm','Modify performance pagecaching options form content','This hook allows to modify performance pagecaching options form FormBuilder',1,1),(638,'actionAdministrationPageGeneralForm','Modify administration page general options form content','This hook allows to modify administration page general options form FormBuilder',1,1),(639,'actionAdministrationPageUploadQuotaForm','Modify administration page upload quota options form content','This hook allows to modify administration page upload quota options form FormBuilder',1,1),(640,'actionAdministrationPageNotificationsForm','Modify administration page notifications options form content','This hook allows to modify administration page notifications options form FormBuilder',1,1),(641,'actionShippingPreferencesPageHandlingForm','Modify shipping preferences page handling options form content','This hook allows to modify shipping preferences page handling options form FormBuilder',1,1),(642,'actionShippingPreferencesPageCarrierOptionsForm','Modify shipping preferences page carrier options options form content','This hook allows to modify shipping preferences page carrier options options form FormBuilder\n      ',1,1),(643,'actionOrderPreferencesPageGeneralForm','Modify order preferences page general options form content','This hook allows to modify order preferences page general options form FormBuilder',1,1),(644,'actionOrderPreferencesPageGiftOptionsForm','Modify order preferences page gift options options form content','This hook allows to modify order preferences page gift options options form FormBuilder',1,1),(645,'actionProductPreferencesPageGeneralForm','Modify product preferences page general options form content','This hook allows to modify product preferences page general options form FormBuilder',1,1),(646,'actionProductPreferencesPagePaginationForm','Modify product preferences page pagination options form content','This hook allows to modify product preferences page pagination options form FormBuilder',1,1),(647,'actionProductPreferencesPagePageForm','Modify product preferences page page options form content','This hook allows to modify product preferences page page options form FormBuilder',1,1),(648,'actionProductPreferencesPageStockForm','Modify product preferences page stock options form content','This hook allows to modify product preferences page stock options form FormBuilder',1,1),(649,'actionGeolocationPageByAddressForm','Modify geolocation page by address options form content','This hook allows to modify geolocation page by address options form FormBuilder',1,1),(650,'actionGeolocationPageWhitelistForm','Modify geolocation page whitelist options form content','This hook allows to modify geolocation page whitelist options form FormBuilder',1,1),(651,'actionGeolocationPageOptionsForm','Modify geolocation page options options form content','This hook allows to modify geolocation page options options form FormBuilder',1,1),(652,'actionLocalizationPageConfigurationForm','Modify localization page configuration options form content','This hook allows to modify localization page configuration options form FormBuilder',1,1),(653,'actionLocalizationPageLocalUnitsForm','Modify localization page local units options form content','This hook allows to modify localization page local units options form FormBuilder',1,1),(654,'actionLocalizationPageAdvancedForm','Modify localization page advanced options form content','This hook allows to modify localization page advanced options form FormBuilder',1,1),(655,'actionFeatureFlagForm','Modify feature flag page form content','This hook allows to modify the Feature Flag page form\'s FormBuilder',1,1),(656,'actionPerformancePageSmartySave','Modify performance page smarty options form saved data','This hook allows to modify data of performance page smarty options form after it was saved\n      ',1,1),(657,'actionPerformancePageDebugModeSave','Modify performance page debug mode options form saved data','This hook allows to modify data of performance page debug mode options form after it was saved\n      ',1,1),(658,'actionPerformancePageOptionalFeaturesSave','Modify performance page optional features options form saved data','This hook allows to modify data of performance page optional features options form after it was\n        saved\n      ',1,1),(659,'actionPerformancePageCombineCompressCacheSave','Modify performance page combine compress cache options form saved data','This hook allows to modify data of performance page combine compress cache options form after it was\n        saved\n      ',1,1),(660,'actionPerformancePageMediaServersSave','Modify performance page media servers options form saved data','This hook allows to modify data of performance page media servers options form after it was saved\n      ',1,1),(661,'actionPerformancePagecachingSave','Modify performance pagecaching options form saved data','This hook allows to modify data of performance pagecaching options form after it was saved\n      ',1,1),(662,'actionAdministrationPageGeneralSave','Modify administration page general options form saved data','This hook allows to modify data of administration page general options form after it was saved\n      ',1,1),(663,'actionAdministrationPageUploadQuotaSave','Modify administration page upload quota options form saved data','This hook allows to modify data of administration page upload quota options form after it was saved\n      ',1,1),(664,'actionAdministrationPageNotificationsSave','Modify administration page notifications options form saved data','This hook allows to modify data of administration page notifications options form after it was\n        saved\n      ',1,1),(665,'actionShippingPreferencesPageHandlingSave','Modify shipping preferences page handling options form saved data','This hook allows to modify data of shipping preferences page handling options form after it was\n        saved\n      ',1,1),(666,'actionShippingPreferencesPageCarrierOptionsSave','Modify shipping preferences page carrier options options form saved data','This hook allows to modify data of shipping preferences page carrier options options form after it\n        was saved\n      ',1,1),(667,'actionOrderPreferencesPageGeneralSave','Modify order preferences page general options form saved data','This hook allows to modify data of order preferences page general options form after it was saved\n      ',1,1),(668,'actionOrderPreferencesPageGiftOptionsSave','Modify order preferences page gift options options form saved data','This hook allows to modify data of order preferences page gift options options form after it was\n        saved\n      ',1,1),(669,'actionProductPreferencesPageGeneralSave','Modify product preferences page general options form saved data','This hook allows to modify data of product preferences page general options form after it was saved\n      ',1,1),(670,'actionProductPreferencesPagePaginationSave','Modify product preferences page pagination options form saved data','This hook allows to modify data of product preferences page pagination options form after it was\n        saved\n      ',1,1),(671,'actionProductPreferencesPagePageSave','Modify product preferences page page options form saved data','This hook allows to modify data of product preferences page page options form after it was saved\n      ',1,1),(672,'actionProductPreferencesPageStockSave','Modify product preferences page stock options form saved data','This hook allows to modify data of product preferences page stock options form after it was saved\n      ',1,1),(673,'actionGeolocationPageByAddressSave','Modify geolocation page by address options form saved data','This hook allows to modify data of geolocation page by address options form after it was saved\n      ',1,1),(674,'actionGeolocationPageWhitelistSave','Modify geolocation page whitelist options form saved data','This hook allows to modify data of geolocation page whitelist options form after it was saved\n      ',1,1),(675,'actionGeolocationPageOptionsSave','Modify geolocation page options options form saved data','This hook allows to modify data of geolocation page options options form after it was saved\n      ',1,1),(676,'actionLocalizationPageConfigurationSave','Modify localization page configuration options form saved data','This hook allows to modify data of localization page configuration options form after it was saved\n      ',1,1),(677,'actionLocalizationPageLocalUnitsSave','Modify localization page local units options form saved data','This hook allows to modify data of localization page local units options form after it was saved\n      ',1,1),(678,'actionLocalizationPageAdvancedSave','Modify localization page advanced options form saved data','This hook allows to modify data of localization page advanced options form after it was saved\n      ',1,1),(679,'actionFeatureFlagSave','Modify feature flag form submitted data','This hook allows to modify the Feature Flag data being submitted through the form after it was\n        saved\n      ',1,1),(680,'actionOrderStateFormBuilderModifier','Modify order state identifiable object form','This hook allows to modify order state identifiable object forms content by modifying form builder\n        data or FormBuilder itself\n      ',1,1),(681,'actionOrderReturnStateFormBuilderModifier','Modify order return state identifiable object form','This hook allows to modify order return state identifiable object forms content by modifying form\n        builder data or FormBuilder itself\n      ',1,1),(682,'actionZoneFormBuilderModifier','Modify zone identifiable object form','This hook allows to modify zone identifiable object forms content by modifying form builder data or\n        FormBuilder itself\n      ',1,1),(683,'actionBeforeUpdateOrderStateFormHandler','Modify order state identifiable object data before updating it','This hook allows to modify order state identifiable object forms data before it was updated\n      ',1,1),(684,'actionBeforeUpdateOrderReturnStateFormHandler','Modify order return state identifiable object data before updating it','This hook allows to modify order return state identifiable object forms data before it was updated\n      ',1,1),(685,'actionBeforeUpdateZoneFormHandler','Modify zone identifiable object data before updating it','This hook allows to modify zone identifiable object forms data before it was updated',1,1),(686,'actionAfterUpdateOrderStateFormHandler','Modify order state identifiable object data after updating it','This hook allows to modify order state identifiable object forms data after it was updated\n      ',1,1),(687,'actionAfterUpdateOrderReturnStateFormHandler','Modify order return state identifiable object data after updating it','This hook allows to modify order return state identifiable object forms data after it was updated\n      ',1,1),(688,'actionAfterUpdateProductImageFormHandler','Modify product image identifiable object data after updating it','This hook allows to modify product image identifiable object forms data after it was updated\n      ',1,1),(689,'actionAfterUpdateZoneFormHandler','Modify zone identifiable object data after updating it','This hook allows to modify zone identifiable object forms data after it was updated',1,1),(690,'actionBeforeCreateOrderStateFormHandler','Modify order state identifiable object data before creating it','This hook allows to modify order state identifiable object forms data before it was created\n      ',1,1),(691,'actionBeforeCreateOrderReturnStateFormHandler','Modify order return state identifiable object data before creating it','This hook allows to modify order return state identifiable object forms data before it was created\n      ',1,1),(692,'actionBeforeCreateZoneFormHandler','Modify zone identifiable object data before creating it','This hook allows to modify zone identifiable object forms data before it was created',1,1),(693,'actionAfterCreateOrderStateFormHandler','Modify order state identifiable object data after creating it','This hook allows to modify order state identifiable object forms data after it was created\n      ',1,1),(694,'actionAfterCreateOrderReturnStateFormHandler','Modify order return state identifiable object data after creating it','This hook allows to modify order return state identifiable object forms data after it was created\n      ',1,1),(695,'actionAfterCreateZoneFormHandler','Modify zone identifiable object data after creating it','This hook allows to modify zone identifiable object forms data after it was created',1,1),(698,'actionAdminSecurityControllerPostProcessBefore','On post-process in Admin Security Controller','This hook is called on Admin Security Controller post-process before processing any form',1,1),(699,'actionAdminSecurityControllerPostProcessGeneralBefore','On post-process in Admin Security Controller','This hook is called on Admin Security Controller post-process before processing the General form',1,1),(700,'actionBeforeCreateCartSummaryFormHandler','Modify back office order data before creating it','This hook allows to modify order created from back office data before it is created',1,1),(701,'actionAfterCreateCartSummaryFormHandler','Modify back office order data after creating it','This hook allows to modify order created from back office data after it is created',1,1),(702,'actionAdminOrdersTrackingNumberUpdate','After setting the tracking number for the order','This hook allows you to execute code after the unique tracking number for the order was added',1,1),(703,'displayBackOfficeEmployeeMenu','Administration Employee menu','This hook is displayed in the employee menu',1,1),(704,'actionCustomerLogoutBefore','Before customer logout','This hook allows you to execute code before customer logout',1,1),(705,'actionCustomerLogoutAfter','After customer logout','This hook allows you to execute code after customer logout',1,1),(706,'displayCheckoutSummaryTop','Cart summary top','This hook allows you to display new elements in top of cart summary',1,1),(707,'actionPresentPaymentOptions','Payment options Presenter','This hook is called before payment options are presented',1,1),(708,'dashboardZoneThree','Dashboard column three','This hook is displayed in the third column of the dashboard',1,1),(709,'actionFilterDeliveryOptionList','Modify delivery option list result','This hook allows you to modify delivery option list',1,1),(710,'displayCheckoutBeforeConfirmation','Show custom content before checkout confirmation','This hook allows you to display custom content at the end of checkout process',1,1),(711,'actionListModules','Add modules to the module manager list','This hook allows you to add modules to the list of modules displayed in the module manager page',1,1),(712,'actionBeforeInstallModule','Before a module is installed','This hook is called just before a module is installed',1,1),(713,'actionBeforePostInstallModule','Before method `postInstall()` is called','This hook is called juste before a module execute its `postInstall()` method',1,1),(714,'actionBeforeUninstallModule','Before a module is uninstalled','This hook is called just before a module is uninstalled',1,1),(715,'actionBeforeUpgradeModule','Before a module is upgraded','This hook is called just before a module is upgraded',1,1),(716,'actionBeforeEnableModule','Before a module is enabled','This hook is called just before a module is enabled',1,1),(717,'actionBeforeDisableModule','Before a module is disabled','This hook is called just before a module is disabled',1,1),(718,'actionBeforeResetModule','Before a module is reset','This hook is called just before a module is reset',1,1),(719,'displayAdminThemesListAfter','BO themes list extra content','This hook displays content after the themes list in the back office',1,1),(720,'actionGetAdminToolbarButtons','Allows to add buttons in any toolbar in the back office','This hook allows you to define descriptions of buttons to add in any toolbar of the back office',1,1),(721,'displayEmptyModuleCategoryExtraMessage','Extra message to display for an empty modules category','This hook allows to add an extra message to display in the Module manager page when a category doesn\'t have any module',1,1),(722,'actionGetAlternativeSearchPanels','Additional search panel','This hook allows to add an additional search panel for external providers in PrestaShop back office',1,1),(723,'actionCartGetPackageShippingCost','After getting package shipping cost value','This hook is called in order to allow to modify package shipping cost',1,1),(724,'actionCreateProductFormBuilderModifier','Modify create product identifiable object form','This hook allows to modify create product identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(725,'actionCombinationListFormBuilderModifier','Modify combination list identifiable object form','This hook allows to modify combination list identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(726,'actionProductImageFormBuilderModifier','Modify product image identifiable object form','This hook allows to modify product image identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(727,'actionSearchEngineFormBuilderModifier','Modify search engine identifiable object form','This hook allows to modify search engine identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(728,'actionCategoryTreeSelectorFormBuilderModifier','Modify category tree selector identifiable object form','This hook allows to modify category tree selector identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(729,'actionSqlRequestFormDataProviderData','Provide sql request identifiable object form data for update','This hook allows to provide sql request identifiable object form data which will prefill the form in update/edition page',1,1),(730,'actionCustomerFormDataProviderData','Provide customer identifiable object form data for update','This hook allows to provide customer identifiable object form data which will prefill the form in update/edition page',1,1),(731,'actionLanguageFormDataProviderData','Provide language identifiable object form data for update','This hook allows to provide language identifiable object form data which will prefill the form in update/edition page',1,1),(732,'actionCurrencyFormDataProviderData','Provide currency identifiable object form data for update','This hook allows to provide currency identifiable object form data which will prefill the form in update/edition page',1,1),(733,'actionWebserviceKeyFormDataProviderData','Provide webservice key identifiable object form data for update','This hook allows to provide webservice key identifiable object form data which will prefill the form in update/edition page',1,1),(734,'actionMetaFormDataProviderData','Provide meta identifiable object form data for update','This hook allows to provide meta identifiable object form data which will prefill the form in update/edition page',1,1),(735,'actionCategoryFormDataProviderData','Provide category identifiable object form data for update','This hook allows to provide category identifiable object form data which will prefill the form in update/edition page',1,1),(736,'actionRootCategoryFormDataProviderData','Provide root category identifiable object form data for update','This hook allows to provide root category identifiable object form data which will prefill the form in update/edition page',1,1),(737,'actionContactFormDataProviderData','Provide contact identifiable object form data for update','This hook allows to provide contact identifiable object form data which will prefill the form in update/edition page',1,1),(738,'actionCmsPageCategoryFormDataProviderData','Provide cms page category identifiable object form data for update','This hook allows to provide cms page category identifiable object form data which will prefill the form in update/edition page',1,1),(739,'actionTaxFormDataProviderData','Provide tax identifiable object form data for update','This hook allows to provide tax identifiable object form data which will prefill the form in update/edition page',1,1),(740,'actionManufacturerFormDataProviderData','Provide manufacturer identifiable object form data for update','This hook allows to provide manufacturer identifiable object form data which will prefill the form in update/edition page',1,1),(741,'actionEmployeeFormDataProviderData','Provide employee identifiable object form data for update','This hook allows to provide employee identifiable object form data which will prefill the form in update/edition page',1,1),(742,'actionProfileFormDataProviderData','Provide profile identifiable object form data for update','This hook allows to provide profile identifiable object form data which will prefill the form in update/edition page',1,1),(743,'actionCmsPageFormDataProviderData','Provide cms page identifiable object form data for update','This hook allows to provide cms page identifiable object form data which will prefill the form in update/edition page',1,1),(744,'actionFeatureFormDataProviderData','Provide feature identifiable object form data for update','This hook allows to provide feature identifiable object form data which will prefill the form in update/edition page',1,1),(745,'actionOrderMessageFormDataProviderData','Provide order message identifiable object form data for update','This hook allows to provide order message identifiable object form data which will prefill the form in update/edition page',1,1),(746,'actionCatalogPriceRuleFormDataProviderData','Provide catalog price rule identifiable object form data for update','This hook allows to provide catalog price rule identifiable object form data which will prefill the form in update/edition page',1,1),(747,'actionAttachmentFormDataProviderData','Provide attachment identifiable object form data for update','This hook allows to provide attachment identifiable object form data which will prefill the form in update/edition page',1,1),(748,'actionOrderStateFormDataProviderData','Provide order state identifiable object form data for update','This hook allows to provide order state identifiable object form data which will prefill the form in update/edition page',1,1),(749,'actionOrderReturnStateFormDataProviderData','Provide order return state identifiable object form data for update','This hook allows to provide order return state identifiable object form data which will prefill the form in update/edition page',1,1),(750,'actionCreateProductFormDataProviderData','Provide create product identifiable object form data for update','This hook allows to provide create product identifiable object form data which will prefill the form in update/edition page',1,1),(751,'actionCombinationListFormDataProviderData','Provide combination list identifiable object form data for update','This hook allows to provide combination list identifiable object form data which will prefill the form in update/edition page',1,1),(752,'actionProductImageFormDataProviderData','Provide product image identifiable object form data for update','This hook allows to provide product image identifiable object form data which will prefill the form in update/edition page',1,1),(753,'actionZoneFormDataProviderData','Provide zone identifiable object form data for update','This hook allows to provide zone identifiable object form data which will prefill the form in update/edition page',1,1),(754,'actionSearchEngineFormDataProviderData','Provide search engine identifiable object form data for update','This hook allows to provide search engine identifiable object form data which will prefill the form in update/edition page',1,1),(755,'actionCategoryTreeSelectorFormDataProviderData','Provide category tree selector identifiable object form data for update','This hook allows to provide category tree selector identifiable object form data which will prefill the form in update/edition page',1,1),(756,'actionSqlRequestFormDataProviderDefaultData','Provide sql request identifiable object default form data for creation','This hook allows to provide sql request identifiable object form data which will prefill the form in creation page',1,1),(757,'actionCustomerFormDataProviderDefaultData','Provide customer identifiable object default form data for creation','This hook allows to provide customer identifiable object form data which will prefill the form in creation page',1,1),(758,'actionLanguageFormDataProviderDefaultData','Provide language identifiable object default form data for creation','This hook allows to provide language identifiable object form data which will prefill the form in creation page',1,1),(759,'actionCurrencyFormDataProviderDefaultData','Provide currency identifiable object default form data for creation','This hook allows to provide currency identifiable object form data which will prefill the form in creation page',1,1),(760,'actionWebserviceKeyFormDataProviderDefaultData','Provide webservice key identifiable object default form data for creation','This hook allows to provide webservice key identifiable object form data which will prefill the form in creation page',1,1),(761,'actionMetaFormDataProviderDefaultData','Provide meta identifiable object default form data for creation','This hook allows to provide meta identifiable object form data which will prefill the form in creation page',1,1),(762,'actionCategoryFormDataProviderDefaultData','Provide category identifiable object default form data for creation','This hook allows to provide category identifiable object form data which will prefill the form in creation page',1,1),(763,'actionRootCategoryFormDataProviderDefaultData','Provide root category identifiable object default form data for creation','This hook allows to provide root category identifiable object form data which will prefill the form in creation page',1,1),(764,'actionContactFormDataProviderDefaultData','Provide contact identifiable object default form data for creation','This hook allows to provide contact identifiable object form data which will prefill the form in creation page',1,1),(765,'actionCmsPageCategoryFormDataProviderDefaultData','Provide cms page category identifiable object default form data for creation','This hook allows to provide cms page category identifiable object form data which will prefill the form in creation page',1,1),(766,'actionTaxFormDataProviderDefaultData','Provide tax identifiable object default form data for creation','This hook allows to provide tax identifiable object form data which will prefill the form in creation page',1,1),(767,'actionManufacturerFormDataProviderDefaultData','Provide manufacturer identifiable object default form data for creation','This hook allows to provide manufacturer identifiable object form data which will prefill the form in creation page',1,1),(768,'actionEmployeeFormDataProviderDefaultData','Provide employee identifiable object default form data for creation','This hook allows to provide employee identifiable object form data which will prefill the form in creation page',1,1),(769,'actionProfileFormDataProviderDefaultData','Provide profile identifiable object default form data for creation','This hook allows to provide profile identifiable object form data which will prefill the form in creation page',1,1),(770,'actionCmsPageFormDataProviderDefaultData','Provide cms page identifiable object default form data for creation','This hook allows to provide cms page identifiable object form data which will prefill the form in creation page',1,1),(771,'actionFeatureFormDataProviderDefaultData','Provide feature identifiable object default form data for creation','This hook allows to provide feature identifiable object form data which will prefill the form in creation page',1,1),(772,'actionOrderMessageFormDataProviderDefaultData','Provide order message identifiable object default form data for creation','This hook allows to provide order message identifiable object form data which will prefill the form in creation page',1,1),(773,'actionCatalogPriceRuleFormDataProviderDefaultData','Provide catalog price rule identifiable object default form data for creation','This hook allows to provide catalog price rule identifiable object form data which will prefill the form in creation page',1,1),(774,'actionAttachmentFormDataProviderDefaultData','Provide attachment identifiable object default form data for creation','This hook allows to provide attachment identifiable object form data which will prefill the form in creation page',1,1),(775,'actionOrderStateFormDataProviderDefaultData','Provide order state identifiable object default form data for creation','This hook allows to provide order state identifiable object form data which will prefill the form in creation page',1,1),(776,'actionOrderReturnStateFormDataProviderDefaultData','Provide order return state identifiable object default form data for creation','This hook allows to provide order return state identifiable object form data which will prefill the form in creation page',1,1),(777,'actionCreateProductFormDataProviderDefaultData','Provide create product identifiable object default form data for creation','This hook allows to provide create product identifiable object form data which will prefill the form in creation page',1,1),(778,'actionCombinationListFormDataProviderDefaultData','Provide combination list identifiable object default form data for creation','This hook allows to provide combination list identifiable object form data which will prefill the form in creation page',1,1),(779,'actionProductImageFormDataProviderDefaultData','Provide product image identifiable object default form data for creation','This hook allows to provide product image identifiable object form data which will prefill the form in creation page',1,1),(780,'actionZoneFormDataProviderDefaultData','Provide zone identifiable object default form data for creation','This hook allows to provide zone identifiable object form data which will prefill the form in creation page',1,1),(781,'actionSearchEngineFormDataProviderDefaultData','Provide search engine identifiable object default form data for creation','This hook allows to provide search engine identifiable object form data which will prefill the form in creation page',1,1),(782,'actionCategoryTreeSelectorFormDataProviderDefaultData','Provide category tree selector identifiable object default form data for creation','This hook allows to provide category tree selector identifiable object form data which will prefill the form in creation page',1,1),(783,'actionBeforeUpdateCreateProductFormHandler','Modify create product identifiable object data before updating it','This hook allows to modify create product identifiable object forms data before it was updated',1,1),(784,'actionBeforeUpdateCombinationListFormHandler','Modify combination list identifiable object data before updating it','This hook allows to modify combination list identifiable object forms data before it was updated',1,1),(785,'actionBeforeUpdateProductImageFormHandler','Modify product image identifiable object data before updating it','This hook allows to modify product image identifiable object forms data before it was updated',1,1),(786,'actionBeforeUpdateSearchEngineFormHandler','Modify search engine identifiable object data before updating it','This hook allows to modify search engine identifiable object forms data before it was updated',1,1),(787,'actionBeforeUpdateCategoryTreeSelectorFormHandler','Modify category tree selector identifiable object data before updating it','This hook allows to modify category tree selector identifiable object forms data before it was updated',1,1),(788,'actionAfterUpdateCreateProductFormHandler','Modify create product identifiable object data after updating it','This hook allows to modify create product identifiable object forms data after it was updated',1,1),(789,'actionAfterUpdateCombinationListFormHandler','Modify combination list identifiable object data after updating it','This hook allows to modify combination list identifiable object forms data after it was updated',1,1),(790,'actionAfterUpdateSearchEngineFormHandler','Modify search engine identifiable object data after updating it','This hook allows to modify search engine identifiable object forms data after it was updated',1,1),(791,'actionAfterUpdateCategoryTreeSelectorFormHandler','Modify category tree selector identifiable object data after updating it','This hook allows to modify category tree selector identifiable object forms data after it was updated',1,1),(792,'actionBeforeCreateCreateProductFormHandler','Modify create product identifiable object data before creating it','This hook allows to modify create product identifiable object forms data before it was created',1,1),(793,'actionBeforeCreateCombinationListFormHandler','Modify combination list identifiable object data before creating it','This hook allows to modify combination list identifiable object forms data before it was created',1,1),(794,'actionBeforeCreateProductImageFormHandler','Modify product image identifiable object data before creating it','This hook allows to modify product image identifiable object forms data before it was created',1,1),(795,'actionBeforeCreateSearchEngineFormHandler','Modify search engine identifiable object data before creating it','This hook allows to modify search engine identifiable object forms data before it was created',1,1),(796,'actionBeforeCreateCategoryTreeSelectorFormHandler','Modify category tree selector identifiable object data before creating it','This hook allows to modify category tree selector identifiable object forms data before it was created',1,1),(797,'actionAfterCreateCreateProductFormHandler','Modify create product identifiable object data after creating it','This hook allows to modify create product identifiable object forms data after it was created',1,1),(798,'actionAfterCreateCombinationListFormHandler','Modify combination list identifiable object data after creating it','This hook allows to modify combination list identifiable object forms data after it was created',1,1),(799,'actionAfterCreateProductImageFormHandler','Modify product image identifiable object data after creating it','This hook allows to modify product image identifiable object forms data after it was created',1,1),(800,'actionAfterCreateSearchEngineFormHandler','Modify search engine identifiable object data after creating it','This hook allows to modify search engine identifiable object forms data after it was created',1,1),(801,'actionAfterCreateCategoryTreeSelectorFormHandler','Modify category tree selector identifiable object data after creating it','This hook allows to modify category tree selector identifiable object forms data after it was created',1,1),(802,'actionFeatureFlagStableForm','Modify feature flag stable options form content','This hook allows to modify feature flag stable options form FormBuilder',1,1),(803,'actionFeatureFlagBetaForm','Modify feature flag beta options form content','This hook allows to modify feature flag beta options form FormBuilder',1,1),(804,'actionSecurityPageGeneralForm','Modify security page general options form content','This hook allows to modify security page general options form FormBuilder',1,1),(805,'actionSecurityPagePasswordPolicyForm','Modify security page password policy options form content','This hook allows to modify security page password policy options form FormBuilder',1,1),(806,'actionFeatureFlagStableSave','Modify feature flag stable options form saved data','This hook allows to modify data of feature flag stable options form after it was saved',1,1),(807,'actionFeatureFlagBetaSave','Modify feature flag beta options form saved data','This hook allows to modify data of feature flag beta options form after it was saved',1,1),(808,'actionSecurityPageGeneralSave','Modify security page general options form saved data','This hook allows to modify data of security page general options form after it was saved',1,1),(809,'actionSecurityPagePasswordPolicySave','Modify security page password policy options form saved data','This hook allows to modify data of security page password policy options form after it was saved',1,1),(810,'actionCountryGridDefinitionModifier','Modify country grid definition','This hook allows to alter country grid columns, actions and filters',1,1),(811,'actionSearchEngineGridDefinitionModifier','Modify search engine grid definition','This hook allows to alter search engine grid columns, actions and filters',1,1),(812,'actionProductGridDefinitionModifier','Modify product grid definition','This hook allows to alter product grid columns, actions and filters',1,1),(814,'actionSecuritySessionEmployeeGridDefinitionModifier','Modify security session employee grid definition','This hook allows to alter security session employee grid columns, actions and filters',1,1),(815,'actionSecuritySessionCustomerGridDefinitionModifier','Modify security session customer grid definition','This hook allows to alter security session customer grid columns, actions and filters',1,1),(816,'actionStateGridDefinitionModifier','Modify state grid definition','This hook allows to alter state grid columns, actions and filters',1,1),(817,'actionTitleGridDefinitionModifier','Modify title grid definition','This hook allows to alter title grid columns, actions and filters',1,1),(818,'actionCountryGridQueryBuilderModifier','Modify country grid query builder','This hook allows to alter Doctrine query builder for country grid',1,1),(819,'actionSearchEngineGridQueryBuilderModifier','Modify search engine grid query builder','This hook allows to alter Doctrine query builder for search engine grid',1,1),(820,'actionProductGridQueryBuilderModifier','Modify product grid query builder','This hook allows to alter Doctrine query builder for product grid',1,1),(822,'actionSecuritySessionEmployeeGridQueryBuilderModifier','Modify security session employee grid query builder','This hook allows to alter Doctrine query builder for security session employee grid',1,1),(823,'actionSecuritySessionCustomerGridQueryBuilderModifier','Modify security session customer grid query builder','This hook allows to alter Doctrine query builder for security session customer grid',1,1),(824,'actionStateGridQueryBuilderModifier','Modify state grid query builder','This hook allows to alter Doctrine query builder for state grid',1,1),(825,'actionTitleGridQueryBuilderModifier','Modify title grid query builder','This hook allows to alter Doctrine query builder for title grid',1,1),(826,'actionCountryGridDataModifier','Modify country grid data','This hook allows to modify country grid data',1,1),(827,'actionSearchEngineGridDataModifier','Modify search engine grid data','This hook allows to modify search engine grid data',1,1),(828,'actionProductGridDataModifier','Modify product grid data','This hook allows to modify product grid data',1,1),(830,'actionSecuritySessionEmployeeGridDataModifier','Modify security session employee grid data','This hook allows to modify security session employee grid data',1,1),(831,'actionSecuritySessionCustomerGridDataModifier','Modify security session customer grid data','This hook allows to modify security session customer grid data',1,1),(832,'actionStateGridDataModifier','Modify state grid data','This hook allows to modify state grid data',1,1),(833,'actionTitleGridDataModifier','Modify title grid data','This hook allows to modify title grid data',1,1),(834,'actionCountryGridFilterFormModifier','Modify country grid filters','This hook allows to modify filters for country grid',1,1),(835,'actionSearchEngineGridFilterFormModifier','Modify search engine grid filters','This hook allows to modify filters for search engine grid',1,1),(836,'actionProductGridFilterFormModifier','Modify product grid filters','This hook allows to modify filters for product grid',1,1),(838,'actionSecuritySessionEmployeeGridFilterFormModifier','Modify security session employee grid filters','This hook allows to modify filters for security session employee grid',1,1),(839,'actionSecuritySessionCustomerGridFilterFormModifier','Modify security session customer grid filters','This hook allows to modify filters for security session customer grid',1,1),(840,'actionStateGridFilterFormModifier','Modify state grid filters','This hook allows to modify filters for state grid',1,1),(841,'actionTitleGridFilterFormModifier','Modify title grid filters','This hook allows to modify filters for title grid',1,1),(842,'actionCountryGridPresenterModifier','Modify country grid template data','This hook allows to modify data which is about to be used in template for country grid',1,1),(843,'actionSearchEngineGridPresenterModifier','Modify search engine grid template data','This hook allows to modify data which is about to be used in template for search engine grid',1,1),(844,'actionProductGridPresenterModifier','Modify product grid template data','This hook allows to modify data which is about to be used in template for product grid',1,1),(846,'actionSecuritySessionEmployeeGridPresenterModifier','Modify security session employee grid template data','This hook allows to modify data which is about to be used in template for security session employee grid',1,1),(847,'actionSecuritySessionCustomerGridPresenterModifier','Modify security session customer grid template data','This hook allows to modify data which is about to be used in template for security session customer grid',1,1),(848,'actionStateGridPresenterModifier','Modify state grid template data','This hook allows to modify data which is about to be used in template for state grid',1,1),(849,'actionTitleGridPresenterModifier','Modify title grid template data','This hook allows to modify data which is about to be used in template for title grid',1,1),(850,'actionGenerateDocumentReference','Modify document reference','This hook allows modules to return custom document references',1,1),(851,'actionModifyFrontendSitemap','Add or remove links on sitemap page','This hook allows to modify links on sitemap page of your shop. Useful to improve indexation of your modules.',1,1),(852,'displayAddressSelectorBottom','After address selection on checkout page','This hook is displayed after the address selection in checkout step.',1,1),(853,'actionLoggerLogMessage','Allows to make extra action while a log is triggered','This hook allows to make an extra action while an exception is thrown and the logger logs it',1,1),(854,'actionOrderReturnFormBuilderModifier','Modify order return identifiable object form','This hook allows to modify order return identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(855,'actionProductShopsFormBuilderModifier','Modify product shops identifiable object form','This hook allows to modify product shops identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(856,'actionCountryFormBuilderModifier','Modify country identifiable object form','This hook allows to modify country identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(857,'actionStateFormBuilderModifier','Modify state identifiable object form','This hook allows to modify state identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(858,'actionTaxRulesGroupFormBuilderModifier','Modify tax rules group identifiable object form','This hook allows to modify tax rules group identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(859,'actionOrderReturnFormDataProviderData','Provide order return identifiable object form data for update','This hook allows to provide order return identifiable object form data which will prefill the form in update/edition page',1,1),(860,'actionProductShopsFormDataProviderData','Provide product shops identifiable object form data for update','This hook allows to provide product shops identifiable object form data which will prefill the form in update/edition page',1,1),(861,'actionCountryFormDataProviderData','Provide country identifiable object form data for update','This hook allows to provide country identifiable object form data which will prefill the form in update/edition page',1,1),(862,'actionStateFormDataProviderData','Provide state identifiable object form data for update','This hook allows to provide state identifiable object form data which will prefill the form in update/edition page',1,1),(863,'actionTaxRulesGroupFormDataProviderData','Provide tax rules group identifiable object form data for update','This hook allows to provide tax rules group identifiable object form data which will prefill the form in update/edition page',1,1),(864,'actionOrderReturnFormDataProviderDefaultData','Provide order return identifiable object default form data for creation','This hook allows to provide order return identifiable object form data which will prefill the form in creation page',1,1),(865,'actionProductShopsFormDataProviderDefaultData','Provide product shops identifiable object default form data for creation','This hook allows to provide product shops identifiable object form data which will prefill the form in creation page',1,1),(866,'actionCountryFormDataProviderDefaultData','Provide country identifiable object default form data for creation','This hook allows to provide country identifiable object form data which will prefill the form in creation page',1,1),(867,'actionStateFormDataProviderDefaultData','Provide state identifiable object default form data for creation','This hook allows to provide state identifiable object form data which will prefill the form in creation page',1,1),(868,'actionTaxRulesGroupFormDataProviderDefaultData','Provide tax rules group identifiable object default form data for creation','This hook allows to provide tax rules group identifiable object form data which will prefill the form in creation page',1,1),(869,'actionBeforeUpdateOrderReturnFormHandler','Modify order return identifiable object data before updating it','This hook allows to modify order return identifiable object forms data before it was updated',1,1),(870,'actionBeforeUpdateProductShopsFormHandler','Modify product shops identifiable object data before updating it','This hook allows to modify product shops identifiable object forms data before it was updated',1,1),(871,'actionBeforeUpdateCountryFormHandler','Modify country identifiable object data before updating it','This hook allows to modify country identifiable object forms data before it was updated',1,1),(872,'actionBeforeUpdateStateFormHandler','Modify state identifiable object data before updating it','This hook allows to modify state identifiable object forms data before it was updated',1,1),(873,'actionBeforeUpdateTaxRulesGroupFormHandler','Modify tax rules group identifiable object data before updating it','This hook allows to modify tax rules group identifiable object forms data before it was updated',1,1),(874,'actionAfterUpdateOrderReturnFormHandler','Modify order return identifiable object data after updating it','This hook allows to modify order return identifiable object forms data after it was updated',1,1),(875,'actionAfterUpdateProductShopsFormHandler','Modify product shops identifiable object data after updating it','This hook allows to modify product shops identifiable object forms data after it was updated',1,1),(876,'actionAfterUpdateCountryFormHandler','Modify country identifiable object data after updating it','This hook allows to modify country identifiable object forms data after it was updated',1,1),(877,'actionAfterUpdateStateFormHandler','Modify state identifiable object data after updating it','This hook allows to modify state identifiable object forms data after it was updated',1,1),(878,'actionAfterUpdateTaxRulesGroupFormHandler','Modify tax rules group identifiable object data after updating it','This hook allows to modify tax rules group identifiable object forms data after it was updated',1,1),(879,'actionBeforeCreateOrderReturnFormHandler','Modify order return identifiable object data before creating it','This hook allows to modify order return identifiable object forms data before it was created',1,1),(880,'actionBeforeCreateProductShopsFormHandler','Modify product shops identifiable object data before creating it','This hook allows to modify product shops identifiable object forms data before it was created',1,1),(881,'actionBeforeCreateCountryFormHandler','Modify country identifiable object data before creating it','This hook allows to modify country identifiable object forms data before it was created',1,1),(882,'actionBeforeCreateStateFormHandler','Modify state identifiable object data before creating it','This hook allows to modify state identifiable object forms data before it was created',1,1),(883,'actionBeforeCreateTaxRulesGroupFormHandler','Modify tax rules group identifiable object data before creating it','This hook allows to modify tax rules group identifiable object forms data before it was created',1,1),(884,'actionAfterCreateOrderReturnFormHandler','Modify order return identifiable object data after creating it','This hook allows to modify order return identifiable object forms data after it was created',1,1),(885,'actionAfterCreateProductShopsFormHandler','Modify product shops identifiable object data after creating it','This hook allows to modify product shops identifiable object forms data after it was created',1,1),(886,'actionAfterCreateCountryFormHandler','Modify country identifiable object data after creating it','This hook allows to modify country identifiable object forms data after it was created',1,1),(887,'actionAfterCreateStateFormHandler','Modify state identifiable object data after creating it','This hook allows to modify state identifiable object forms data after it was created',1,1),(888,'actionAfterCreateTaxRulesGroupFormHandler','Modify tax rules group identifiable object data after creating it','This hook allows to modify tax rules group identifiable object forms data after it was created',1,1),(889,'actionCustomerThreadGridDefinitionModifier','Modify customer thread grid definition','This hook allows to alter customer thread grid columns, actions and filters',1,1),(890,'actionCustomerThreadGridQueryBuilderModifier','Modify customer thread grid query builder','This hook allows to alter Doctrine query builder for customer thread grid',1,1),(891,'actionCustomerThreadGridDataModifier','Modify customer thread grid data','This hook allows to modify customer thread grid data',1,1),(892,'actionCustomerThreadGridFilterFormModifier','Modify customer thread grid filters','This hook allows to modify filters for customer thread grid',1,1),(893,'actionCustomerThreadGridPresenterModifier','Modify customer thread grid template data','This hook allows to modify data which is about to be used in template for customer thread grid',1,1),(894,'actionUpdateCartAddress','Triggers after changing address on the cart','This hook is called after address is changed on the cart',1,1),(895,'actionAdminMenuTabsModifier','Modify back office menu','This hook allows modifying back office menu tabs',1,1),(896,'actionAdminBreadcrumbModifier','Modify back office breadcrumb','This hook allows modifying back office breadcrumb',1,1),(897,'actionLanguageLinkParameters','Add parameters to language link','Allows modules to provide proper parameters for links in other languages.',1,1),(898,'actionAfterLoadRoutes','Triggers after loading routes','Allow modules to modify routes in any way or add their own multilanguage routes.',1,1),(900,'actionAuthenticationBefore','Triggers before customer logs in','Triggers after successful validation of login form, before the login process itself.',1,1),(901,'actionCartUpdateQuantityBefore','Triggers before product is added to cart','Allows responding to add to cart events.',1,1),(902,'actionValidateCartRule','Alter cart rule validation process','Allow modules to implement their own rules to validate a cart rule.',1,1),(903,'actionFeatureValueFormBuilderModifier','Modify feature value identifiable object form','This hook allows to modify feature value identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(904,'actionCartRuleFormBuilderModifier','Modify cart rule identifiable object form','This hook allows to modify cart rule identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(905,'actionTitleFormBuilderModifier','Modify title identifiable object form','This hook allows to modify title identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(906,'actionApiClientFormBuilderModifier','Modify api client identifiable object form','This hook allows to modify api client identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(907,'actionImageTypeFormBuilderModifier','Modify image type identifiable object form','This hook allows to modify image type identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(908,'actionCarrierFormBuilderModifier','Modify carrier identifiable object form','This hook allows to modify carrier identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(909,'actionFeatureValueFormDataProviderData','Provide feature value identifiable object form data for update','This hook allows to provide feature value identifiable object form data which will prefill the form in update/edition page',1,1),(910,'actionTitleFormDataProviderData','Provide title identifiable object form data for update','This hook allows to provide title identifiable object form data which will prefill the form in update/edition page',1,1),(911,'actionApiClientFormDataProviderData','Provide api client identifiable object form data for update','This hook allows to provide api client identifiable object form data which will prefill the form in update/edition page',1,1),(912,'actionImageTypeFormDataProviderData','Provide image type identifiable object form data for update','This hook allows to provide image type identifiable object form data which will prefill the form in update/edition page',1,1),(913,'actionCarrierFormDataProviderData','Provide carrier identifiable object form data for update','This hook allows to provide carrier identifiable object form data which will prefill the form in update/edition page',1,1),(914,'actionFeatureValueFormDataProviderDefaultData','Provide feature value identifiable object default form data for creation','This hook allows to provide feature value identifiable object form data which will prefill the form in creation page',1,1),(915,'actionTitleFormDataProviderDefaultData','Provide title identifiable object default form data for creation','This hook allows to provide title identifiable object form data which will prefill the form in creation page',1,1),(916,'actionApiClientFormDataProviderDefaultData','Provide api client identifiable object default form data for creation','This hook allows to provide api client identifiable object form data which will prefill the form in creation page',1,1),(917,'actionImageTypeFormDataProviderDefaultData','Provide image type identifiable object default form data for creation','This hook allows to provide image type identifiable object form data which will prefill the form in creation page',1,1),(918,'actionCarrierFormDataProviderDefaultData','Provide carrier identifiable object default form data for creation','This hook allows to provide carrier identifiable object form data which will prefill the form in creation page',1,1),(919,'actionBeforeUpdateFeatureValueFormHandler','Modify feature value identifiable object data before updating it','This hook allows to modify feature value identifiable object forms data before it was updated',1,1),(920,'actionBeforeUpdateCartRuleFormHandler','Modify cart rule identifiable object data before updating it','This hook allows to modify cart rule identifiable object forms data before it was updated',1,1),(921,'actionBeforeUpdateTitleFormHandler','Modify title identifiable object data before updating it','This hook allows to modify title identifiable object forms data before it was updated',1,1),(922,'actionBeforeUpdateApiClientFormHandler','Modify api client identifiable object data before updating it','This hook allows to modify api client identifiable object forms data before it was updated',1,1),(923,'actionBeforeUpdateImageTypeFormHandler','Modify image type identifiable object data before updating it','This hook allows to modify image type identifiable object forms data before it was updated',1,1),(924,'actionBeforeUpdateCarrierFormHandler','Modify carrier identifiable object data before updating it','This hook allows to modify carrier identifiable object forms data before it was updated',1,1),(925,'actionAfterUpdateFeatureValueFormHandler','Modify feature value identifiable object data after updating it','This hook allows to modify feature value identifiable object forms data after it was updated',1,1),(926,'actionAfterUpdateCartRuleFormHandler','Modify cart rule identifiable object data after updating it','This hook allows to modify cart rule identifiable object forms data after it was updated',1,1),(927,'actionAfterUpdateTitleFormHandler','Modify title identifiable object data after updating it','This hook allows to modify title identifiable object forms data after it was updated',1,1),(928,'actionAfterUpdateApiClientFormHandler','Modify api client identifiable object data after updating it','This hook allows to modify api client identifiable object forms data after it was updated',1,1),(929,'actionAfterUpdateImageTypeFormHandler','Modify image type identifiable object data after updating it','This hook allows to modify image type identifiable object forms data after it was updated',1,1),(930,'actionAfterUpdateCarrierFormHandler','Modify carrier identifiable object data after updating it','This hook allows to modify carrier identifiable object forms data after it was updated',1,1),(931,'actionBeforeCreateFeatureValueFormHandler','Modify feature value identifiable object data before creating it','This hook allows to modify feature value identifiable object forms data before it was created',1,1),(932,'actionBeforeCreateCartRuleFormHandler','Modify cart rule identifiable object data before creating it','This hook allows to modify cart rule identifiable object forms data before it was created',1,1),(933,'actionBeforeCreateTitleFormHandler','Modify title identifiable object data before creating it','This hook allows to modify title identifiable object forms data before it was created',1,1),(934,'actionBeforeCreateApiClientFormHandler','Modify api client identifiable object data before creating it','This hook allows to modify api client identifiable object forms data before it was created',1,1),(935,'actionBeforeCreateImageTypeFormHandler','Modify image type identifiable object data before creating it','This hook allows to modify image type identifiable object forms data before it was created',1,1),(936,'actionBeforeCreateCarrierFormHandler','Modify carrier identifiable object data before creating it','This hook allows to modify carrier identifiable object forms data before it was created',1,1),(937,'actionAfterCreateFeatureValueFormHandler','Modify feature value identifiable object data after creating it','This hook allows to modify feature value identifiable object forms data after it was created',1,1),(938,'actionAfterCreateCartRuleFormHandler','Modify cart rule identifiable object data after creating it','This hook allows to modify cart rule identifiable object forms data after it was created',1,1),(939,'actionAfterCreateTitleFormHandler','Modify title identifiable object data after creating it','This hook allows to modify title identifiable object forms data after it was created',1,1),(940,'actionAfterCreateApiClientFormHandler','Modify api client identifiable object data after creating it','This hook allows to modify api client identifiable object forms data after it was created',1,1),(941,'actionAfterCreateImageTypeFormHandler','Modify image type identifiable object data after creating it','This hook allows to modify image type identifiable object forms data after it was created',1,1),(942,'actionAfterCreateCarrierFormHandler','Modify carrier identifiable object data after creating it','This hook allows to modify carrier identifiable object forms data after it was created',1,1),(943,'actionImageSettingsPageForm','Modify image settings page options form content','This hook allows to modify image settings page options form FormBuilder',1,1),(944,'actionAdminAPIForm','Modify admin api options form content','This hook allows to modify admin api options form FormBuilder',1,1),(945,'actionBackOfficeLoginForm','Modify back office login options form content','This hook allows to modify back office login options form FormBuilder',1,1),(946,'actionEmployeeRequestPasswordResetForm','Modify employee request password reset options form content','This hook allows to modify employee request password reset options form FormBuilder',1,1),(947,'actionEmployeeResetPasswordForm','Modify employee reset password options form content','This hook allows to modify employee reset password options form FormBuilder',1,1),(948,'actionImageSettingsPageSave','Modify image settings page options form saved data','This hook allows to modify data of image settings page options form after it was saved',1,1),(949,'actionAdminAPISave','Modify admin api options form saved data','This hook allows to modify data of admin api options form after it was saved',1,1),(950,'actionBackOfficeLoginSave','Modify back office login options form saved data','This hook allows to modify data of back office login options form after it was saved',1,1),(951,'actionEmployeeRequestPasswordResetSave','Modify employee request password reset options form saved data','This hook allows to modify data of employee request password reset options form after it was saved',1,1),(952,'actionEmployeeResetPasswordSave','Modify employee reset password options form saved data','This hook allows to modify data of employee reset password options form after it was saved',1,1),(953,'actionCustomerCartGridDefinitionModifier','Modify customer cart grid definition','This hook allows to alter customer cart grid columns, actions and filters',1,1),(954,'actionCustomerOrderGridDefinitionModifier','Modify customer order grid definition','This hook allows to alter customer order grid columns, actions and filters',1,1),(955,'actionCustomerBoughtProductGridDefinitionModifier','Modify customer bought product grid definition','This hook allows to alter customer bought product grid columns, actions and filters',1,1),(956,'actionCustomerViewedProductGridDefinitionModifier','Modify customer viewed product grid definition','This hook allows to alter customer viewed product grid columns, actions and filters',1,1),(957,'actionCustomerGroupsGridDefinitionModifier','Modify customer groups grid definition','This hook allows to alter customer groups grid columns, actions and filters',1,1),(958,'actionCustomerCartGridQueryBuilderModifier','Modify customer cart grid query builder','This hook allows to alter Doctrine query builder for customer cart grid',1,1),(959,'actionCustomerOrderGridQueryBuilderModifier','Modify customer order grid query builder','This hook allows to alter Doctrine query builder for customer order grid',1,1),(960,'actionCustomerBoughtProductGridQueryBuilderModifier','Modify customer bought product grid query builder','This hook allows to alter Doctrine query builder for customer bought product grid',1,1),(961,'actionCustomerViewedProductGridQueryBuilderModifier','Modify customer viewed product grid query builder','This hook allows to alter Doctrine query builder for customer viewed product grid',1,1),(962,'actionCustomerGroupsGridQueryBuilderModifier','Modify customer groups grid query builder','This hook allows to alter Doctrine query builder for customer groups grid',1,1),(963,'actionCustomerCartGridDataModifier','Modify customer cart grid data','This hook allows to modify customer cart grid data',1,1),(964,'actionCustomerOrderGridDataModifier','Modify customer order grid data','This hook allows to modify customer order grid data',1,1),(965,'actionCustomerBoughtProductGridDataModifier','Modify customer bought product grid data','This hook allows to modify customer bought product grid data',1,1),(966,'actionCustomerViewedProductGridDataModifier','Modify customer viewed product grid data','This hook allows to modify customer viewed product grid data',1,1),(967,'actionCustomerGroupsGridDataModifier','Modify customer groups grid data','This hook allows to modify customer groups grid data',1,1),(968,'actionCustomerCartGridFilterFormModifier','Modify customer cart grid filters','This hook allows to modify filters for customer cart grid',1,1),(969,'actionCustomerOrderGridFilterFormModifier','Modify customer order grid filters','This hook allows to modify filters for customer order grid',1,1),(970,'actionCustomerBoughtProductGridFilterFormModifier','Modify customer bought product grid filters','This hook allows to modify filters for customer bought product grid',1,1),(971,'actionCustomerViewedProductGridFilterFormModifier','Modify customer viewed product grid filters','This hook allows to modify filters for customer viewed product grid',1,1),(972,'actionCustomerGroupsGridFilterFormModifier','Modify customer groups grid filters','This hook allows to modify filters for customer groups grid',1,1),(973,'actionCustomerCartGridPresenterModifier','Modify customer cart grid template data','This hook allows to modify data which is about to be used in template for customer cart grid',1,1),(974,'actionCustomerOrderGridPresenterModifier','Modify customer order grid template data','This hook allows to modify data which is about to be used in template for customer order grid',1,1),(975,'actionCustomerBoughtProductGridPresenterModifier','Modify customer bought product grid template data','This hook allows to modify data which is about to be used in template for customer bought product grid',1,1),(976,'actionCustomerViewedProductGridPresenterModifier','Modify customer viewed product grid template data','This hook allows to modify data which is about to be used in template for customer viewed product grid',1,1),(977,'actionCustomerGroupsGridPresenterModifier','Modify customer groups grid template data','This hook allows to modify data which is about to be used in template for customer groups grid',1,1),(978,'actionPDFInvoiceRender','PDF Invoice - Render','This hook is called when a PDF invoice is rendered from the Front Office and the Back Office',1,1),(979,'actionPresentObject','Object Presenter','This hook is called before an object is presented',1,1),(980,'actionSetInvoice','','',1,1),(981,'actionOrderHistoryAddAfter','','',1,1),(982,'actionInvoiceNumberFormatted','','',1,1),(983,'actionOnImageResizeAfter','','',1,1),(984,'actionOnImageCutAfter','','',1,1),(985,'actionSubmitCustomerAddressForm','','',1,1),(986,'actionCartSummary','','',1,1),(987,'actionGetExtraMailTemplateVars','','',1,1),(988,'deleteProductAttribute','','',1,1),(989,'actionGetProductPropertiesBefore','','',1,1),(990,'actionGetProductPropertiesAfter','','',1,1),(991,'displayCustomization','','',1,1),(992,'actionDeliveryPriceByWeight','','',1,1),(993,'actionDeliveryPriceByPrice','','',1,1),(994,'actionDispatcher','','',1,1),(995,'moduleRoutes','','',1,1),(996,'actionGetIDZoneByAddressID','','',1,1),(997,'actionModuleRegisterHookBefore','','',1,1),(998,'actionModuleRegisterHookAfter','','',1,1),(999,'actionModuleUnRegisterHookBefore','','',1,1),(1000,'actionModuleUnRegisterHookAfter','','',1,1),(1001,'actionShopDataDuplication','','',1,1),(1002,'actionAdminMetaBeforeWriteRobotsFile','','',1,1),(1003,'actionAdminMetaAfterWriteRobotsFile','','',1,1),(1004,'termsAndConditions','','',1,1),(1005,'actionValidateStepComplete','','',1,1),(1006,'actionAdminControllerSetMedia','','',1,1),(1007,'overrideMinimalPurchasePrice','','',1,1),(1008,'actionFrontControllerSetMedia','','',1,1),(1009,'overrideLayoutTemplate','','',1,1),(1010,'productSearchProvider','','',1,1),(1011,'actionAttributeCombinationDelete','','',1,1),(1012,'actionAttributeCombinationSave','','',1,1),(1013,'actionCustomerBeforeUpdateGroup','','',1,1),(1014,'actionCustomerAddGroups','','',1,1),(1015,'actionProductCoverage','','',1,1),(1016,'actionObjectAddBefore','','',1,1),(1017,'actionObjectAddAfter','','',1,1),(1018,'actionObjectUpdateBefore','','',1,1),(1019,'actionObjectUpdateAfter','','',1,1),(1020,'actionObjectDeleteBefore','','',1,1),(1021,'actionObjectDeleteAfter','','',1,1),(1022,'actionWishlistAddProduct','','',1,1),(1023,'displayGDPRConsent','','',1,1),(1024,'actionObjectProductCommentValidateAfter','','',1,1),(1025,'actionExportGDPRData','','',1,1),(1026,'actionDeleteGDPRCustomer','','',1,1),(1027,'actionModuleMailAlertSendCustomer','','',1,1),(1028,'actionNewsletterRegistrationBefore','','',1,1),(1029,'actionNewsletterRegistrationAfter','','',1,1),(1030,'displayNewsletterRegistration','','',1,1),(1031,'dashboardZoneOne','','',1,1),(1032,'dashboardZoneTwo','','',1,1),(1033,'dashboardData','','',1,1),(1034,'actionPasswordRenew','','',1,1),(1035,'actionDownloadAttachment','','',1,1),(1036,'displayReassurance','','',1,1),(1037,'displayProductPriceBlock','','',1,1),(1038,'displayProductListReviews','','',1,1),(1039,'displayCrossSellingShoppingCart','','',1,1),(1040,'displayExpressCheckout','','',1,1),(1041,'displayCheckoutSubtotalDetails','','',1,1),(1042,'displayNav1','','',1,1),(1043,'displayNav2','','',1,1),(1044,'displayOrderConfirmation1','','',1,1),(1045,'displayOrderConfirmation2','','',1,1),(1046,'displayFooterBefore','','',1,1),(1047,'displayFooterAfter','','',1,1),(1048,'displayCMSDisputeInformation','','',1,1),(1049,'displayCMSPrintButton','','',1,1),(1050,'displaySearch','','',1,1),(1051,'displayNotFound','','',1,1),(1052,'displayAdminAfterHeader','','',1,1),(1053,'displayAdminNavBarBeforeEnd','','',1,1),(1054,'displayAdminListBefore','','',1,1),(1055,'displayAdminListAfter','','',1,1),(1056,'displayAdminOptions','','',1,1),(1057,'displayAdminForm','','',1,1),(1058,'displayAdminView','','',1,1),(1059,'displayAdminOrderSideBottom','','',1,1),(1060,'displayOrderPreview','','',1,1),(1061,'displayAdminLogin','','',1,1),(1062,'actionPresentModule','','',1,1),(1063,'actionAdminThemesControllerUpdate_optionsAfter','','',1,1),(1064,'actionAdminDuplicateBefore','','',1,1),(1065,'actionAdminDuplicateAfter','','',1,1),(1066,'actionSearch','','',1,1),(1067,'actionSearchTermFormBuilderModifier','Modify search term identifiable object form','This hook allows to modify search term identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(1068,'actionSearchTermFormDataProviderData','Provide search term identifiable object form data for update','This hook allows to provide search term identifiable object form data which will prefill the form in update/edition page',1,1),(1069,'actionSearchTermFormDataProviderDefaultData','Provide search term identifiable object default form data for creation','This hook allows to provide search term identifiable object form data which will prefill the form in creation page',1,1),(1070,'actionBeforeUpdateSearchTermFormHandler','Modify search term identifiable object data before updating it','This hook allows to modify search term identifiable object forms data before it was updated',1,1),(1071,'actionAfterUpdateSearchTermFormHandler','Modify search term identifiable object data after updating it','This hook allows to modify search term identifiable object forms data after it was updated',1,1),(1072,'actionBeforeCreateSearchTermFormHandler','Modify search term identifiable object data before creating it','This hook allows to modify search term identifiable object forms data before it was created',1,1),(1073,'actionAfterCreateSearchTermFormHandler','Modify search term identifiable object data after creating it','This hook allows to modify search term identifiable object forms data after it was created',1,1),(1074,'actionProductGetAttributesGroupsBefore','Triggers before getting product attributes groups','Allows to modify product attributes groups SQL query before they are retrieved from the database.',1,1),(1075,'actionProductGetAttributesGroupsAfter','Triggers after getting product attributes groups','Allows to modify product attributes groups after they are retrieved from the database.',1,1),(1076,'actionGetPdfRenderer','Provide a PDF renderer','This hook allows to provide a custom PDF renderer to generate PDF files',1,1),(1077,'actionGetPdfTemplateObject','Get PDF template object','This hook allows to recieve a PDF template object from modules',1,1),(1078,'displayAdminStoreInformation','Display extra store information','This hook displays content in the Information page to add store information',1,1),(1079,'overrideImageLink','Override product image link','Allows to fully override the image URL returned by the getImageLink() method.',1,1),(1080,'adaptImageLink','Adapt product image link','Allows to dynamically modify the final image URL generated by getImageLink(), using a reference to the final value.',1,1),(1081,'actionOrderHasBeenShipped','Called when checking if an order has been shipped','Allows modules to override or react to the hasBeenShipped() method of the Order class.',1,1),(1082,'actionOrderHasBeenDelivered','Called when checking if an order has been delivered','Allows modules to override or react to the hasBeenDelivered() method of the Order class.',1,1),(1083,'actionModifyHtmlPurifierConfig','Called when configuring HTMLPurifier','Allows modules to modify the HTMLPurifier definition by adding custom allowed HTML elements or attributes during Tools::purifyHTML().',1,1),(1084,'additionalHtmlAttributesFormFields','','',1,1),(1085,'actionGetCartRuleContextualValue','','',1,1),(1086,'actionApplyCartRule','','',1,1),(1087,'actionDatabaseLogsForm','Modify database logs options form content','This hook allows to modify database logs options form FormBuilder',1,1),(1088,'actionDatabaseLogsSave','Modify database logs options form saved data','This hook allows to modify data of database logs options form after it was saved',1,1),(1089,'actionOverrideQuantityAvailableByProduct','Override available quantity by product','Allows modules to override the available quantity returned by StockAvailable::getQuantityAvailableByProduct().',1,1),(1090,'actionCheckAttributeQuantity','Check product attribute quantity availability','Allows modules to validate or override the stock availability check for a specific product combination.',1,1),(1091,'actionOverrideProductQuantity','Override product quantity calculation','Allows modules to override the final product quantity returned by Product::getQuantity(), including cart-aware calculations.',1,1),(1092,'actionModuleUpgradeAfter','','',1,1),(1093,'actionModuleEnable','','',1,1),(1094,'actionModuleDisable','','',1,1),(1095,'actionConfigurationUpdateValueBefore','','',1,1),(1096,'actionAdminDuplicateDiscountBefore','','',1,1),(1097,'actionAdminDuplicateDiscountAfter','','',1,1),(1098,'actionFacetedSearchSetSupportedControllers','','',1,1),(1099,'actionFacetedSearchFilters','','',1,1),(1100,'actionMainMenuModifier','','',1,1),(1101,'actionTagFormBuilderModifier','Modify tag identifiable object form','This hook allows to modify tag identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(1102,'actionTagFormDataProviderData','Provide tag identifiable object form data for update','This hook allows to provide tag identifiable object form data which will prefill the form in update/edition page',1,1),(1103,'actionTagFormDataProviderDefaultData','Provide tag identifiable object default form data for creation','This hook allows to provide tag identifiable object form data which will prefill the form in creation page',1,1),(1104,'actionBeforeUpdateTagFormHandler','Modify tag identifiable object data before updating it','This hook allows to modify tag identifiable object forms data before it was updated',1,1),(1105,'actionAfterUpdateTagFormHandler','Modify tag identifiable object data after updating it','This hook allows to modify tag identifiable object forms data after it was updated',1,1),(1106,'actionBeforeCreateTagFormHandler','Modify tag identifiable object data before creating it','This hook allows to modify tag identifiable object forms data before it was created',1,1),(1107,'actionAfterCreateTagFormHandler','Modify tag identifiable object data after creating it','This hook allows to modify tag identifiable object forms data after it was created',1,1),(1108,'actionDiscountGridDefinitionModifier','Modify discount grid definition','This hook allows to alter discount grid columns, actions and filters',1,1),(1109,'actionDiscountGridQueryBuilderModifier','Modify discount grid query builder','This hook allows to alter Doctrine query builder for discount grid',1,1),(1110,'actionDiscountGridDataModifier','Modify discount grid data','This hook allows to modify discount grid data',1,1),(1111,'actionDiscountGridFilterFormModifier','Modify discount grid filters','This hook allows to modify filters for discount grid',1,1),(1112,'actionDiscountGridPresenterModifier','Modify discount grid template data','This hook allows to modify data which is about to be used in template for discount grid',1,1),(1113,'actionFrontControllerDetectContextCountryAfter','Action after detecting context country','Allows modules to modify the context country after it has been detected via geolocation.',1,1),(1114,'actionFrontControllerInitContextCurrencyAfter','Action after initializing context currency','Allows modules to modify the context currency after it has been initialized.',1,1),(1118,'actionFacetedSearchCacheKeyGeneration','','',1,1),(1119,'gSitemapAppendUrls','','',1,1),(1120,'actionUpdateDefaultCombinationAfter','After default combination update','Allows modules to react after the default combination of a product has been updated. This hook is triggered once the default combination has been successfully changed.',1,1),(1121,'actionOverrideShippingFreePrice','Override price that determines free shipping','Allows modules to override the free shipping price and return their custom value, for example to specify it by zone or other criteria.',1,1),(1122,'actionOverrideShippingFreeWeight','Override weight that determines free shipping','Allows modules to override the free shipping weight and return their custom value, for example to specify it by zone or other criteria.',1,1),(1123,'displayModalContent','','',1,1),(1124,'actionPresentCartProduct','','',1,1),(1125,'displaySubcategories','Display content in subcategory list','This hooks allows you to display additional items in a list of subcategories in front office. Related blog posts, links to other categories, landing pages etc.',1,1),(1126,'displayCartBelowSummary','Display content below summary on cart page','Allows you to display content on front office cart page, below the totals summary.',1,1),(1127,'actionExtraPropertyDefinitionFormBuilderModifier','Modify extra property definition identifiable object form','This hook allows to modify extra property definition identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(1128,'actionTaxRuleFormBuilderModifier','Modify tax rule identifiable object form','This hook allows to modify tax rule identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(1129,'actionFulfillShipmentFormBuilderModifier','Modify fulfill shipment identifiable object form','This hook allows to modify fulfill shipment identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(1130,'actionQuickAccessFormBuilderModifier','Modify quick access identifiable object form','This hook allows to modify quick access identifiable object forms content by modifying form builder data or FormBuilder itself',1,1),(1131,'actionExtraPropertyDefinitionFormDataProviderData','Provide extra property definition identifiable object form data for update','This hook allows to provide extra property definition identifiable object form data which will prefill the form in update/edition page',1,1),(1132,'actionTaxRuleFormDataProviderData','Provide tax rule identifiable object form data for update','This hook allows to provide tax rule identifiable object form data which will prefill the form in update/edition page',1,1),(1133,'actionFulfillShipmentFormDataProviderData','Provide fulfill shipment identifiable object form data for update','This hook allows to provide fulfill shipment identifiable object form data which will prefill the form in update/edition page',1,1),(1134,'actionQuickAccessFormDataProviderData','Provide quick access identifiable object form data for update','This hook allows to provide quick access identifiable object form data which will prefill the form in update/edition page',1,1),(1135,'actionExtraPropertyDefinitionFormDataProviderDefaultData','Provide extra property definition identifiable object default form data for creation','This hook allows to provide extra property definition identifiable object form data which will prefill the form in creation page',1,1),(1136,'actionTaxRuleFormDataProviderDefaultData','Provide tax rule identifiable object default form data for creation','This hook allows to provide tax rule identifiable object form data which will prefill the form in creation page',1,1),(1137,'actionFulfillShipmentFormDataProviderDefaultData','Provide fulfill shipment identifiable object default form data for creation','This hook allows to provide fulfill shipment identifiable object form data which will prefill the form in creation page',1,1),(1138,'actionQuickAccessFormDataProviderDefaultData','Provide quick access identifiable object default form data for creation','This hook allows to provide quick access identifiable object form data which will prefill the form in creation page',1,1),(1139,'actionBeforeUpdateExtraPropertyDefinitionFormHandler','Modify extra property definition identifiable object data before updating it','This hook allows to modify extra property definition identifiable object forms data before it was updated',1,1),(1140,'actionBeforeUpdateTaxRuleFormHandler','Modify tax rule identifiable object data before updating it','This hook allows to modify tax rule identifiable object forms data before it was updated',1,1),(1141,'actionBeforeUpdateFulfillShipmentFormHandler','Modify fulfill shipment identifiable object data before updating it','This hook allows to modify fulfill shipment identifiable object forms data before it was updated',1,1),(1142,'actionBeforeUpdateQuickAccessFormHandler','Modify quick access identifiable object data before updating it','This hook allows to modify quick access identifiable object forms data before it was updated',1,1),(1143,'actionAfterUpdateExtraPropertyDefinitionFormHandler','Modify extra property definition identifiable object data after updating it','This hook allows to modify extra property definition identifiable object forms data after it was updated',1,1),(1144,'actionAfterUpdateTaxRuleFormHandler','Modify tax rule identifiable object data after updating it','This hook allows to modify tax rule identifiable object forms data after it was updated',1,1),(1145,'actionAfterUpdateFulfillShipmentFormHandler','Modify fulfill shipment identifiable object data after updating it','This hook allows to modify fulfill shipment identifiable object forms data after it was updated',1,1),(1146,'actionAfterUpdateQuickAccessFormHandler','Modify quick access identifiable object data after updating it','This hook allows to modify quick access identifiable object forms data after it was updated',1,1),(1147,'actionBeforeCreateExtraPropertyDefinitionFormHandler','Modify extra property definition identifiable object data before creating it','This hook allows to modify extra property definition identifiable object forms data before it was created',1,1),(1148,'actionBeforeCreateTaxRuleFormHandler','Modify tax rule identifiable object data before creating it','This hook allows to modify tax rule identifiable object forms data before it was created',1,1),(1149,'actionBeforeCreateFulfillShipmentFormHandler','Modify fulfill shipment identifiable object data before creating it','This hook allows to modify fulfill shipment identifiable object forms data before it was created',1,1),(1150,'actionBeforeCreateQuickAccessFormHandler','Modify quick access identifiable object data before creating it','This hook allows to modify quick access identifiable object forms data before it was created',1,1),(1151,'actionAfterCreateExtraPropertyDefinitionFormHandler','Modify extra property definition identifiable object data after creating it','This hook allows to modify extra property definition identifiable object forms data after it was created',1,1),(1152,'actionAfterCreateTaxRuleFormHandler','Modify tax rule identifiable object data after creating it','This hook allows to modify tax rule identifiable object forms data after it was created',1,1),(1153,'actionAfterCreateFulfillShipmentFormHandler','Modify fulfill shipment identifiable object data after creating it','This hook allows to modify fulfill shipment identifiable object forms data after it was created',1,1),(1154,'actionAfterCreateQuickAccessFormHandler','Modify quick access identifiable object data after creating it','This hook allows to modify quick access identifiable object forms data after it was created',1,1),(1155,'actionCountriesPageOptionsForm','Modify countries page options options form content','This hook allows to modify countries page options options form FormBuilder',1,1),(1156,'actionOrderReturnForm','Modify order return options form content','This hook allows to modify order return options form FormBuilder',1,1),(1157,'actionCountriesPageOptionsSave','Modify countries page options options form saved data','This hook allows to modify data of countries page options options form after it was saved',1,1),(1158,'actionOrderReturnSave','Modify order return options form saved data','This hook allows to modify data of order return options form after it was saved',1,1),(1159,'actionEmailBodyTemplateGridDefinitionModifier','Modify email body template grid definition','This hook allows to alter email body template grid columns, actions and filters',1,1),(1160,'actionExtraPropertyDefinitionGridDefinitionModifier','Modify extra property definition grid definition','This hook allows to alter extra property definition grid columns, actions and filters',1,1),(1161,'actionEmailBodyTemplateGridQueryBuilderModifier','Modify email body template grid query builder','This hook allows to alter Doctrine query builder for email body template grid',1,1),(1162,'actionExtraPropertyDefinitionGridQueryBuilderModifier','Modify extra property definition grid query builder','This hook allows to alter Doctrine query builder for extra property definition grid',1,1),(1163,'actionEmailBodyTemplateGridDataModifier','Modify email body template grid data','This hook allows to modify email body template grid data',1,1),(1164,'actionExtraPropertyDefinitionGridDataModifier','Modify extra property definition grid data','This hook allows to modify extra property definition grid data',1,1),(1165,'actionEmailBodyTemplateGridFilterFormModifier','Modify email body template grid filters','This hook allows to modify filters for email body template grid',1,1),(1166,'actionExtraPropertyDefinitionGridFilterFormModifier','Modify extra property definition grid filters','This hook allows to modify filters for extra property definition grid',1,1),(1167,'actionEmailBodyTemplateGridPresenterModifier','Modify email body template grid template data','This hook allows to modify data which is about to be used in template for email body template grid',1,1),(1168,'actionExtraPropertyDefinitionGridPresenterModifier','Modify extra property definition grid template data','This hook allows to modify data which is about to be used in template for extra property definition grid',1,1),(1169,'actionNotFound','Action when a page is not found','Allows modules to react when a page is not found - log it, redirect or perform other actions.',1,1),(1170,'displayOrderDetailProductLine','Order detail product line','This hook is displayed on each product line of the order\'s details in Front Office',1,1),(1171,'registerGDPRConsent','registerGDPRConsent','',1,1),(1172,'GraphEngine','GraphEngine','',1,1),(1173,'GridEngine','GridEngine','',1,1),(1174,'actionObjectMailAlertAddAfter','actionObjectMailAlertAddAfter','',1,1),(1175,'actionShopAccessTokenRefreshAfter','Shop access token refreshed event','Shop access token refreshed event',1,1),(1176,'actionAdminLoginControllerLoginAfter','actionAdminLoginControllerLoginAfter','',1,1),(1177,'actionObjectEmployeeDeleteAfter','actionObjectEmployeeDeleteAfter','',1,1),(1178,'actionObjectShopAddAfter','actionObjectShopAddAfter','',1,1),(1179,'actionObjectShopDeleteAfter','actionObjectShopDeleteAfter','',1,1),(1180,'actionObjectCarrierUpdateAfter','actionObjectCarrierUpdateAfter','',1,1),(1181,'actionGetOrderShipments','actionGetOrderShipments','',1,1),(1182,'actionObjectLanguageAddAfter','actionObjectLanguageAddAfter','',1,1),(1183,'actionObjectManufacturerDeleteAfter','actionObjectManufacturerDeleteAfter','',1,1),(1184,'actionObjectManufacturerAddAfter','actionObjectManufacturerAddAfter','',1,1),(1185,'actionObjectManufacturerUpdateAfter','actionObjectManufacturerUpdateAfter','',1,1),(1186,'paymentOptions','paymentOptions','',1,1),(1187,'actionObjectOrderPaymentAddAfter','actionObjectOrderPaymentAddAfter','',1,1),(1188,'actionObjectOrderPaymentUpdateAfter','actionObjectOrderPaymentUpdateAfter','',1,1),(1189,'actionObjectOrderCarrierUpdateAfter','actionObjectOrderCarrierUpdateAfter','',1,1),(1190,'actionAdminStoresControllerUpdate_optionsAfter','actionAdminStoresControllerUpdate_optionsAfter','',1,1),(1191,'actionAdminCurrenciesControllerSaveAfter','actionAdminCurrenciesControllerSaveAfter','',1,1),(1192,'actionObjectCustomerUpdateBefore','actionObjectCustomerUpdateBefore','',1,1),(1193,'displayAdminCustomersForm','displayAdminCustomersForm','',1,1),(1194,'actionObjectCarrierAddAfter','actionObjectCarrierAddAfter','',1,1),(1195,'actionObjectCarrierDeleteAfter','actionObjectCarrierDeleteAfter','',1,1),(1196,'actionObjectCartAddAfter','actionObjectCartAddAfter','',1,1),(1197,'actionObjectCartUpdateAfter','actionObjectCartUpdateAfter','',1,1),(1198,'actionObjectCartRuleAddAfter','actionObjectCartRuleAddAfter','',1,1),(1199,'actionObjectCartRuleUpdateAfter','actionObjectCartRuleUpdateAfter','',1,1),(1200,'actionObjectCartRuleDeleteAfter','actionObjectCartRuleDeleteAfter','',1,1),(1201,'actionObjectCategoryAddAfter','actionObjectCategoryAddAfter','',1,1),(1202,'actionObjectCategoryUpdateAfter','actionObjectCategoryUpdateAfter','',1,1),(1203,'actionObjectCategoryDeleteAfter','actionObjectCategoryDeleteAfter','',1,1),(1204,'actionObjectCombinationAddAfter','actionObjectCombinationAddAfter','',1,1),(1205,'actionObjectCombinationUpdateAfter','actionObjectCombinationUpdateAfter','',1,1),(1206,'actionObjectCombinationDeleteAfter','actionObjectCombinationDeleteAfter','',1,1),(1207,'actionObjectCurrencyAddAfter','actionObjectCurrencyAddAfter','',1,1),(1208,'actionObjectCurrencyUpdateAfter','actionObjectCurrencyUpdateAfter','',1,1),(1209,'actionObjectCurrencyDeleteAfter','actionObjectCurrencyDeleteAfter','',1,1),(1210,'actionObjectCustomerAddAfter','actionObjectCustomerAddAfter','',1,1),(1211,'actionObjectCustomerUpdateAfter','actionObjectCustomerUpdateAfter','',1,1),(1212,'actionObjectCustomerDeleteAfter','actionObjectCustomerDeleteAfter','',1,1),(1213,'actionObjectEmployeeAddAfter','actionObjectEmployeeAddAfter','',1,1),(1214,'actionObjectEmployeeUpdateAfter','actionObjectEmployeeUpdateAfter','',1,1),(1215,'actionObjectImageAddAfter','actionObjectImageAddAfter','',1,1),(1216,'actionObjectImageUpdateAfter','actionObjectImageUpdateAfter','',1,1),(1217,'actionObjectImageDeleteAfter','actionObjectImageDeleteAfter','',1,1),(1218,'actionObjectImageTypeAddAfter','actionObjectImageTypeAddAfter','',1,1),(1219,'actionObjectImageTypeUpdateAfter','actionObjectImageTypeUpdateAfter','',1,1),(1220,'actionObjectImageTypeDeleteAfter','actionObjectImageTypeDeleteAfter','',1,1),(1221,'actionObjectLanguageUpdateAfter','actionObjectLanguageUpdateAfter','',1,1),(1222,'actionObjectLanguageDeleteAfter','actionObjectLanguageDeleteAfter','',1,1),(1223,'actionObjectOrderCarrierAddAfter','actionObjectOrderCarrierAddAfter','',1,1),(1224,'actionObjectOrderCartRuleAddAfter','actionObjectOrderCartRuleAddAfter','',1,1),(1225,'actionObjectOrderCartRuleUpdateAfter','actionObjectOrderCartRuleUpdateAfter','',1,1),(1226,'actionObjectOrderDetailAddAfter','actionObjectOrderDetailAddAfter','',1,1),(1227,'actionObjectOrderDetailUpdateAfter','actionObjectOrderDetailUpdateAfter','',1,1),(1228,'actionObjectOrderHistoryAddAfter','actionObjectOrderHistoryAddAfter','',1,1),(1229,'actionObjectOrderHistoryUpdateAfter','actionObjectOrderHistoryUpdateAfter','',1,1),(1230,'actionObjectOrderAddAfter','actionObjectOrderAddAfter','',1,1),(1231,'actionObjectOrderUpdateAfter','actionObjectOrderUpdateAfter','',1,1),(1232,'actionObjectProductAddAfter','actionObjectProductAddAfter','',1,1),(1233,'actionObjectProductUpdateAfter','actionObjectProductUpdateAfter','',1,1),(1234,'actionObjectProductDeleteAfter','actionObjectProductDeleteAfter','',1,1),(1235,'actionObjectSpecificPriceAddAfter','actionObjectSpecificPriceAddAfter','',1,1),(1236,'actionObjectSpecificPriceUpdateAfter','actionObjectSpecificPriceUpdateAfter','',1,1),(1237,'actionObjectSpecificPriceDeleteAfter','actionObjectSpecificPriceDeleteAfter','',1,1),(1238,'actionObjectStockAvailableAddAfter','actionObjectStockAvailableAddAfter','',1,1),(1239,'actionObjectStockAvailableUpdateAfter','actionObjectStockAvailableUpdateAfter','',1,1),(1240,'actionObjectStockMvtAddAfter','actionObjectStockMvtAddAfter','',1,1),(1241,'actionObjectStoreAddAfter','actionObjectStoreAddAfter','',1,1),(1242,'actionObjectStoreUpdateAfter','actionObjectStoreUpdateAfter','',1,1),(1243,'actionObjectStoreDeleteAfter','actionObjectStoreDeleteAfter','',1,1),(1244,'actionObjectSupplierAddAfter','actionObjectSupplierAddAfter','',1,1),(1245,'actionObjectSupplierUpdateAfter','actionObjectSupplierUpdateAfter','',1,1),(1246,'actionObjectSupplierDeleteAfter','actionObjectSupplierDeleteAfter','',1,1),(1247,'actionObjectWishlistAddAfter','actionObjectWishlistAddAfter','',1,1),(1248,'actionObjectWishlistUpdateAfter','actionObjectWishlistUpdateAfter','',1,1),(1249,'actionObjectWishlistDeleteAfter','actionObjectWishlistDeleteAfter','',1,1),(1250,'actionAjaxDieProductControllerDisplayAjaxQuickviewAfter','actionAjaxDieProductControllerDisplayAjaxQuickviewAfter','',1,1),(1251,'actionObjectCustomerMessageAddAfter','actionObjectCustomerMessageAddAfter','',1,1),(1252,'actionFacebookCallPixel','actionFacebookCallPixel','',1,1),(1253,'actionAttributeFormBuilderModifier','actionAttributeFormBuilderModifier','',1,1),(1254,'actionAttributeFormDataProviderData','actionAttributeFormDataProviderData','',1,1),(1255,'actionAfterCreateAttributeFormHandler','actionAfterCreateAttributeFormHandler','',1,1),(1256,'actionAfterUpdateAttributeFormHandler','actionAfterUpdateAttributeFormHandler','',1,1),(1257,'actionAttributeGroupFormBuilderModifier','actionAttributeGroupFormBuilderModifier','',1,1),(1258,'actionAttributeGroupFormDataProviderData','actionAttributeGroupFormDataProviderData','',1,1),(1259,'actionAfterCreateAttributeGroupFormHandler','actionAfterCreateAttributeGroupFormHandler','',1,1),(1260,'actionAfterUpdateAttributeGroupFormHandler','actionAfterUpdateAttributeGroupFormHandler','',1,1),(1261,'actionObjectSpecificPriceRuleUpdateBefore','actionObjectSpecificPriceRuleUpdateBefore','',1,1),(1262,'actionAdminSpecificPriceRuleControllerSaveAfter','actionAdminSpecificPriceRuleControllerSaveAfter','',1,1),(1263,'actionObjectCmsUpdateAfter','actionObjectCmsUpdateAfter','',1,1),(1264,'actionObjectCmsDeleteAfter','actionObjectCmsDeleteAfter','',1,1),(1265,'actionObjectCmsAddAfter','actionObjectCmsAddAfter','',1,1);
/*!40000 ALTER TABLE `ubwbh_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_hook_alias`
--

DROP TABLE IF EXISTS `ubwbh_hook_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_hook_alias` (
  `id_hook_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id_hook_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_hook_alias`
--

LOCK TABLES `ubwbh_hook_alias` WRITE;
/*!40000 ALTER TABLE `ubwbh_hook_alias` DISABLE KEYS */;
INSERT INTO `ubwbh_hook_alias` VALUES (1,'newOrder','actionValidateOrder'),(2,'paymentConfirm','actionPaymentConfirmation'),(3,'paymentReturn','displayPaymentReturn'),(4,'updateQuantity','actionUpdateQuantity'),(5,'rightColumn','displayRightColumn'),(6,'leftColumn','displayLeftColumn'),(7,'home','displayHome'),(8,'Header','displayHeader'),(9,'cart','actionCartSave'),(10,'authentication','actionAuthentication'),(11,'addproduct','actionProductAdd'),(12,'updateproduct','actionProductUpdate'),(13,'top','displayTop'),(14,'extraRight','displayRightColumnProduct'),(15,'deleteproduct','actionProductDelete'),(16,'productfooter','displayFooterProduct'),(17,'invoice','displayInvoice'),(18,'updateOrderStatus','actionOrderStatusUpdate'),(19,'adminOrder','displayAdminOrder'),(20,'footer','displayFooter'),(21,'PDFInvoice','displayPDFInvoice'),(22,'adminCustomers','displayAdminCustomers'),(23,'orderConfirmation','displayOrderConfirmation'),(24,'createAccount','actionCustomerAccountAdd'),(25,'customerAccount','displayCustomerAccount'),(26,'orderSlip','actionOrderSlipAdd'),(27,'shoppingCart','displayShoppingCartFooter'),(28,'createAccountForm','displayCustomerAccountForm'),(29,'AdminStatsModules','displayAdminStatsModules'),(30,'GraphEngine','displayAdminStatsGraphEngine'),(31,'orderReturn','actionOrderReturn'),(32,'productActions','displayProductAdditionalInfo'),(33,'displayProductButtons','displayProductAdditionalInfo'),(34,'backOfficeHome','displayBackOfficeHome'),(35,'GridEngine','displayAdminStatsGridEngine'),(36,'watermark','actionWatermark'),(37,'cancelProduct','actionProductCancel'),(38,'extraLeft','displayLeftColumnProduct'),(39,'productOutOfStock','actionProductOutOfStock'),(40,'updateProductAttribute','actionProductAttributeUpdate'),(41,'extraCarrier','displayCarrierList'),(42,'shoppingCartExtra','displayShoppingCart'),(43,'updateCarrier','actionCarrierUpdate'),(44,'postUpdateOrderStatus','actionOrderStatusPostUpdate'),(45,'createAccountTop','displayCustomerAccountFormTop'),(46,'backOfficeHeader','displayBackOfficeHeader'),(47,'backOfficeTop','displayBackOfficeTop'),(48,'backOfficeFooter','displayBackOfficeFooter'),(49,'deleteProductAttribute','actionProductAttributeDelete'),(50,'processCarrier','actionCarrierProcess'),(51,'beforeCarrier','displayBeforeCarrier'),(52,'orderDetailDisplayed','displayOrderDetail'),(53,'paymentCCAdded','actionPaymentCCAdd'),(54,'categoryAddition','actionCategoryAdd'),(55,'categoryUpdate','actionCategoryUpdate'),(56,'categoryDeletion','actionCategoryDelete'),(57,'paymentTop','displayPaymentTop'),(58,'afterCreateHtaccess','actionHtaccessCreate'),(59,'afterSaveAdminMeta','actionAdminMetaSave'),(60,'attributeGroupForm','displayAttributeGroupForm'),(61,'afterSaveAttributeGroup','actionAttributeGroupSave'),(62,'afterDeleteAttributeGroup','actionAttributeGroupDelete'),(63,'featureForm','displayFeatureForm'),(64,'afterSaveFeature','actionFeatureSave'),(65,'afterDeleteFeature','actionFeatureDelete'),(66,'afterSaveProduct','actionProductSave'),(67,'postProcessAttributeGroup','displayAttributeGroupPostProcess'),(68,'postProcessFeature','displayFeaturePostProcess'),(69,'featureValueForm','displayFeatureValueForm'),(70,'postProcessFeatureValue','displayFeatureValuePostProcess'),(71,'afterDeleteFeatureValue','actionFeatureValueDelete'),(72,'afterSaveFeatureValue','actionFeatureValueSave'),(73,'attributeForm','displayAttributeForm'),(74,'postProcessAttribute','actionAttributePostProcess'),(75,'afterDeleteAttribute','actionAttributeDelete'),(76,'afterSaveAttribute','actionAttributeSave'),(77,'taxManager','actionTaxManager'),(78,'myAccountBlock','displayMyAccountBlock'),(79,'actionBeforeCartUpdateQty','actionCartUpdateQuantityBefore'),(80,'actionBeforeAuthentication','actionAuthenticationBefore'),(81,'actionBeforeSubmitAccount','actionSubmitAccountBefore'),(82,'displayInvoice','displayAdminOrderTop'),(83,'displayBackOfficeOrderActions','displayAdminOrderSide'),(84,'actionFrontControllerAfterInit','actionFrontControllerInitAfter'),(85,'displayAdminListBefore','displayAdminGridTableBefore'),(86,'displayAdminListAfter','displayAdminGridTableAfter');
/*!40000 ALTER TABLE `ubwbh_hook_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_hook_module`
--

DROP TABLE IF EXISTS `ubwbh_hook_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`,`id_shop`),
  KEY `id_hook` (`id_hook`),
  KEY `id_module` (`id_module`),
  KEY `position` (`id_shop`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_hook_module`
--

LOCK TABLES `ubwbh_hook_module` WRITE;
/*!40000 ALTER TABLE `ubwbh_hook_module` DISABLE KEYS */;
INSERT INTO `ubwbh_hook_module` VALUES (1,1,30,1),(1,1,34,1),(1,1,1008,1),(1,1,1036,1),(1,1,1047,1),(2,1,36,1),(2,1,53,1),(2,1,59,1),(2,1,87,1),(2,1,114,1),(2,1,117,1),(2,1,213,1),(2,1,1006,1),(3,1,17,1),(3,1,1171,1),(4,1,1033,1),(5,1,1032,1),(8,1,1172,1),(9,1,1173,1),(11,1,55,1),(11,1,56,1),(11,1,57,1),(11,1,81,1),(11,1,136,1),(11,1,137,1),(11,1,161,1),(11,1,176,1),(11,1,985,1),(11,1,995,1),(11,1,1029,1),(11,1,1052,1),(11,1,1174,1),(12,1,83,1),(12,1,127,1),(12,1,703,1),(12,1,1175,1),(12,1,1176,1),(12,1,1177,1),(12,1,1178,1),(12,1,1179,1),(13,1,67,1),(14,1,23,1),(14,1,40,1),(14,1,148,1),(14,1,583,1),(14,1,1025,1),(14,1,1026,1),(14,1,1038,1),(15,1,135,1),(16,1,2,1),(16,1,47,1),(16,1,49,1),(16,1,143,1),(16,1,424,1),(16,1,425,1),(16,1,426,1),(16,1,1180,1),(16,1,1181,1),(17,1,901,1),(19,1,86,1),(20,1,1182,1),(22,1,13,1),(22,1,1183,1),(22,1,1184,1),(22,1,1185,1),(25,1,20,1),(26,1,11,1),(26,1,39,1),(26,1,52,1),(26,1,91,1),(26,1,96,1),(26,1,134,1),(26,1,423,1),(26,1,1186,1),(26,1,1187,1),(26,1,1188,1),(26,1,1189,1),(28,1,1078,1),(29,1,14,1),(29,1,21,1),(29,1,1042,1),(29,1,1190,1),(31,1,1191,1),(32,1,998,1),(32,1,1000,1),(34,1,1001,1),(36,1,711,1),(36,1,712,1),(36,1,715,1),(37,1,12,1),(37,1,69,1),(37,1,77,1),(37,1,128,1),(37,1,1015,1),(38,1,1046,1),(38,1,1192,1),(39,1,1194,1),(39,1,1195,1),(39,1,1196,1),(39,1,1197,1),(39,1,1198,1),(39,1,1199,1),(39,1,1200,1),(39,1,1201,1),(39,1,1202,1),(39,1,1203,1),(39,1,1204,1),(39,1,1205,1),(39,1,1206,1),(39,1,1207,1),(39,1,1208,1),(39,1,1209,1),(39,1,1210,1),(39,1,1211,1),(39,1,1212,1),(39,1,1213,1),(39,1,1214,1),(39,1,1215,1),(39,1,1216,1),(39,1,1217,1),(39,1,1218,1),(39,1,1219,1),(39,1,1220,1),(39,1,1221,1),(39,1,1222,1),(39,1,1223,1),(39,1,1224,1),(39,1,1225,1),(39,1,1226,1),(39,1,1227,1),(39,1,1228,1),(39,1,1229,1),(39,1,1230,1),(39,1,1231,1),(39,1,1232,1),(39,1,1233,1),(39,1,1234,1),(39,1,1235,1),(39,1,1236,1),(39,1,1237,1),(39,1,1238,1),(39,1,1239,1),(39,1,1240,1),(39,1,1241,1),(39,1,1242,1),(39,1,1243,1),(39,1,1244,1),(39,1,1245,1),(39,1,1246,1),(39,1,1247,1),(39,1,1248,1),(39,1,1249,1),(40,1,24,1),(40,1,1066,1),(40,1,1250,1),(40,1,1251,1),(40,1,1252,1),(43,1,1045,1),(44,1,32,1),(44,1,38,1),(44,1,45,1),(44,1,74,1),(44,1,88,1),(46,1,1043,1),(47,1,50,1),(47,1,154,1),(47,1,329,1),(48,1,33,1),(48,1,94,1),(48,1,340,1),(48,1,1263,1),(48,1,1264,1),(48,1,1265,1),(49,1,153,1),(49,1,708,1),(49,1,719,1),(49,1,721,1),(49,1,722,1),(49,1,1031,1),(53,1,126,1),(53,1,574,1),(53,1,705,1),(54,1,1050,1),(55,1,70,1),(72,1,26,1),(81,1,93,1),(81,1,95,1),(81,1,100,1),(81,1,101,1),(81,1,103,1),(81,1,104,1),(81,1,105,1),(81,1,110,1),(81,1,111,1),(81,1,113,1),(81,1,115,1),(81,1,436,1),(81,1,444,1),(81,1,452,1),(81,1,672,1),(81,1,903,1),(81,1,925,1),(81,1,937,1),(81,1,1010,1),(81,1,1253,1),(81,1,1254,1),(81,1,1255,1),(81,1,1256,1),(81,1,1257,1),(81,1,1258,1),(81,1,1259,1),(81,1,1260,1),(81,1,1261,1),(81,1,1262,1),(2,1,1008,2),(4,1,1006,2),(4,1,1031,2),(5,1,1033,2),(6,1,1032,2),(14,1,70,2),(14,1,1171,2),(15,1,56,2),(15,1,59,2),(16,1,23,2),(16,1,55,2),(16,1,83,2),(23,1,1186,2),(24,1,40,2),(26,1,81,2),(26,1,901,2),(26,1,995,2),(26,1,1052,2),(26,1,1178,2),(26,1,1179,2),(26,1,1181,2),(27,1,11,2),(31,1,1043,2),(32,1,50,2),(35,1,135,2),(37,1,2,2),(37,1,36,2),(37,1,87,2),(37,1,117,2),(37,1,1025,2),(37,1,1026,2),(38,1,57,2),(39,1,1177,2),(39,1,1180,2),(39,1,1182,2),(39,1,1183,2),(39,1,1184,2),(39,1,1185,2),(39,1,1189,2),(40,1,1029,2),(43,1,22,2),(45,1,1001,2),(48,1,1201,2),(48,1,1202,2),(48,1,1203,2),(48,1,1232,2),(48,1,1233,2),(48,1,1234,2),(48,1,1244,2),(48,1,1245,2),(48,1,1246,2),(49,1,711,2),(49,1,712,2),(49,1,715,2),(53,1,583,2),(54,1,33,2),(57,1,1046,2),(59,1,13,2),(63,1,67,2),(72,1,32,2),(79,1,1066,2),(81,1,20,2),(1,1,1046,3),(5,1,1006,3),(6,1,1033,3),(7,1,1032,3),(11,1,1008,3),(13,1,33,3),(17,1,23,3),(17,1,55,3),(17,1,83,3),(22,1,20,3),(27,1,1186,3),(29,1,50,3),(30,1,40,3),(30,1,81,3),(33,1,1043,3),(37,1,59,3),(37,1,70,3),(37,1,1171,3),(38,1,56,3),(38,1,135,3),(38,1,1025,3),(38,1,1026,3),(44,1,2,3),(44,1,901,3),(48,1,1001,3),(48,1,1183,3),(48,1,1184,3),(48,1,1185,3),(50,1,995,3),(59,1,1244,3),(59,1,1245,3),(59,1,1246,3),(62,1,11,3),(64,1,67,3),(2,1,50,4),(7,1,1006,4),(7,1,1033,4),(17,1,33,4),(19,1,83,4),(23,1,55,4),(26,1,1008,4),(38,1,1171,4),(40,1,23,4),(40,1,56,4),(44,1,40,4),(44,1,81,4),(56,1,1043,4),(59,1,20,4),(61,1,70,4),(62,1,1186,4),(65,1,67,4),(8,1,1006,5),(26,1,55,5),(28,1,83,5),(37,1,1008,5),(40,1,50,5),(44,1,23,5),(61,1,40,5),(66,1,67,5),(72,1,56,5),(11,1,1006,6),(38,1,1008,6),(40,1,55,6),(40,1,83,6),(45,1,23,6),(67,1,67,6),(15,1,1006,7),(21,1,22,7),(40,1,1008,7),(42,1,83,7),(44,1,55,7),(54,1,23,7),(68,1,67,7),(19,1,1006,8),(44,1,83,8),(53,1,1008,8),(56,1,23,8),(69,1,67,8),(26,1,1006,9),(50,1,83,9),(57,1,1008,9),(70,1,67,9),(37,1,1006,10),(71,1,67,10),(73,1,67,11),(74,1,67,12),(75,1,67,13),(76,1,67,14),(77,1,67,15),(78,1,67,16),(79,1,67,17),(80,1,67,18);
/*!40000 ALTER TABLE `ubwbh_hook_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_hook_module_exceptions`
--

DROP TABLE IF EXISTS `ubwbh_hook_module_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_hook_module_exceptions` (
  `id_hook_module_exceptions` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hook_module_exceptions`),
  KEY `id_module` (`id_module`),
  KEY `id_hook` (`id_hook`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_hook_module_exceptions`
--

LOCK TABLES `ubwbh_hook_module_exceptions` WRITE;
/*!40000 ALTER TABLE `ubwbh_hook_module_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_hook_module_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_image`
--

DROP TABLE IF EXISTS `ubwbh_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `position` smallint(2) unsigned NOT NULL DEFAULT 0,
  `cover` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_image`),
  UNIQUE KEY `id_product_cover` (`id_product`,`cover`),
  UNIQUE KEY `idx_product_image` (`id_image`,`id_product`,`cover`),
  KEY `image_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_image`
--

LOCK TABLES `ubwbh_image` WRITE;
/*!40000 ALTER TABLE `ubwbh_image` DISABLE KEYS */;
INSERT INTO `ubwbh_image` VALUES (1,1,1,1),(2,1,2,NULL),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,8,1,1),(9,9,1,1),(10,9,2,NULL),(11,10,1,1),(12,10,2,NULL),(13,11,1,1),(14,11,2,NULL),(15,12,1,1),(16,13,1,1),(17,14,1,1),(18,16,1,1),(19,17,1,1),(20,18,1,1),(21,2,1,1),(22,19,1,1),(23,15,1,1);
/*!40000 ALTER TABLE `ubwbh_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_image_lang`
--

DROP TABLE IF EXISTS `ubwbh_image_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_image_lang` (
  `id_image` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `legend` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_image`,`id_lang`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_image_lang`
--

LOCK TABLES `ubwbh_image_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_image_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_image_lang` VALUES (1,1,'Hummingbird printed t-shirt'),(1,2,'Hummingbird printed t-shirt'),(2,1,'Hummingbird printed t-shirt'),(2,2,'Hummingbird printed t-shirt'),(3,1,'The best is yet to come\' Framed poster'),(3,2,'The best is yet to come\' Framed poster'),(4,1,'The adventure begins Framed poster'),(4,2,'The adventure begins Framed poster'),(5,1,'Today is a good day Framed poster'),(5,2,'Today is a good day Framed poster'),(6,1,'Mug The best is yet to come'),(6,2,'Mug The best is yet to come'),(7,1,'Mug The adventure begins'),(7,2,'Mug The adventure begins'),(8,1,'Mug Today is a good day'),(8,2,'Mug Today is a good day'),(9,1,'Mountain fox cushion'),(9,2,'Mountain fox cushion'),(10,1,'Mountain fox cushion'),(10,2,'Mountain fox cushion'),(11,1,'Brown bear cushion'),(11,2,'Brown bear cushion'),(12,1,'Brown bear cushion'),(12,2,'Brown bear cushion'),(13,1,'Hummingbird cushion'),(13,2,'Hummingbird cushion'),(14,1,'Hummingbird cushion'),(14,2,'Hummingbird cushion'),(15,1,'Mountain fox - Vector graphics'),(15,2,'Mountain fox - Vector graphics'),(16,1,'Brown bear - Vector graphics'),(16,2,'Brown bear - Vector graphics'),(17,1,'Hummingbird - Vector graphics'),(17,2,'Hummingbird - Vector graphics'),(18,1,'Mountain fox notebook'),(18,2,'Mountain fox notebook'),(19,1,'Mountain fox notebook'),(19,2,'Mountain fox notebook'),(20,1,'Mountain fox notebook'),(20,2,'Mountain fox notebook'),(21,1,'Brown bear printed sweater'),(21,2,'Brown bear printed sweater'),(22,1,'Customizable mug'),(22,2,'Customizable mug'),(23,1,'Pack Mug + Framed poster'),(23,2,'Pack Mug + Framed poster');
/*!40000 ALTER TABLE `ubwbh_image_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_image_shop`
--

DROP TABLE IF EXISTS `ubwbh_image_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_image_shop` (
  `id_product` int(10) unsigned NOT NULL,
  `id_image` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `cover` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_image`,`id_shop`),
  UNIQUE KEY `id_product` (`id_product`,`id_shop`,`cover`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_image_shop`
--

LOCK TABLES `ubwbh_image_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_image_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_image_shop` VALUES (1,2,1,NULL),(1,1,1,1),(2,21,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,8,1,1),(9,10,1,NULL),(9,9,1,1),(10,12,1,NULL),(10,11,1,1),(11,14,1,NULL),(11,13,1,1),(12,15,1,1),(13,16,1,1),(14,17,1,1),(15,23,1,1),(16,18,1,1),(17,19,1,1),(18,20,1,1),(19,22,1,1);
/*!40000 ALTER TABLE `ubwbh_image_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_image_type`
--

DROP TABLE IF EXISTS `ubwbh_image_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_image_type` (
  `id_image_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `image_fitment` enum('fit','crop','bound') NOT NULL DEFAULT 'fit',
  `products` tinyint(1) NOT NULL DEFAULT 1,
  `categories` tinyint(1) NOT NULL DEFAULT 1,
  `manufacturers` tinyint(1) NOT NULL DEFAULT 1,
  `suppliers` tinyint(1) NOT NULL DEFAULT 1,
  `stores` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_image_type`),
  UNIQUE KEY `UNIQ_907C95215E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_image_type`
--

LOCK TABLES `ubwbh_image_type` WRITE;
/*!40000 ALTER TABLE `ubwbh_image_type` DISABLE KEYS */;
INSERT INTO `ubwbh_image_type` VALUES (1,'cart_default',125,125,'fit',1,0,0,0,0),(2,'small_default',98,98,'fit',1,1,1,1,0),(3,'medium_default',452,452,'fit',1,0,1,1,0),(4,'home_default',250,250,'fit',1,0,0,0,0),(5,'large_default',800,800,'fit',1,0,1,1,0),(6,'category_default',141,180,'fit',0,1,0,0,0),(7,'stores_default',170,115,'fit',0,0,0,0,1);
/*!40000 ALTER TABLE `ubwbh_image_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_import_match`
--

DROP TABLE IF EXISTS `ubwbh_import_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_import_match` (
  `id_import_match` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `match` mediumtext NOT NULL,
  `skip` int(2) NOT NULL,
  PRIMARY KEY (`id_import_match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_import_match`
--

LOCK TABLES `ubwbh_import_match` WRITE;
/*!40000 ALTER TABLE `ubwbh_import_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_import_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_info`
--

DROP TABLE IF EXISTS `ubwbh_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_info` (
  `id_info` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_info`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_info`
--

LOCK TABLES `ubwbh_info` WRITE;
/*!40000 ALTER TABLE `ubwbh_info` DISABLE KEYS */;
INSERT INTO `ubwbh_info` VALUES (1);
/*!40000 ALTER TABLE `ubwbh_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_info_lang`
--

DROP TABLE IF EXISTS `ubwbh_info_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_info_lang` (
  `id_info` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id_info`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_info_lang`
--

LOCK TABLES `ubwbh_info_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_info_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_info_lang` VALUES (1,1,1,'<h2>Custom Text Block</h2>\n<p><strong class=\"dark\">Lorem ipsum dolor sit amet conse ctetu</strong></p>\n<p>Sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.</p>'),(1,1,2,'<h2>Custom Text Block</h2>\n<p><strong class=\"dark\">Lorem ipsum dolor sit amet conse ctetu</strong></p>\n<p>Sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.</p>');
/*!40000 ALTER TABLE `ubwbh_info_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_info_shop`
--

DROP TABLE IF EXISTS `ubwbh_info_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_info_shop` (
  `id_info` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_info`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_info_shop`
--

LOCK TABLES `ubwbh_info_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_info_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_info_shop` VALUES (1,1);
/*!40000 ALTER TABLE `ubwbh_info_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_lang`
--

DROP TABLE IF EXISTS `ubwbh_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_lang` (
  `id_lang` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `iso_code` varchar(2) NOT NULL,
  `language_code` varchar(5) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `date_format_lite` varchar(32) NOT NULL,
  `date_format_full` varchar(32) NOT NULL,
  `is_rtl` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_lang`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_lang`
--

LOCK TABLES `ubwbh_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_lang` VALUES (1,'English (English)',1,'en','en-us','en-US','m/d/Y','m/d/Y H:i:s',0),(2,'Indonesia (Indonesia)',1,'id','id','id-ID','Y-m-d','Y-m-d H:i:s',0);
/*!40000 ALTER TABLE `ubwbh_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_lang_shop`
--

DROP TABLE IF EXISTS `ubwbh_lang_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_lang_shop` (
  `id_lang` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_lang`,`id_shop`),
  KEY `IDX_2F43BFC7BA299860` (`id_lang`),
  KEY `IDX_2F43BFC7274A50A0` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_lang_shop`
--

LOCK TABLES `ubwbh_lang_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_lang_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_lang_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `ubwbh_lang_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_category`
--

DROP TABLE IF EXISTS `ubwbh_layered_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_category` (
  `id_layered_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `controller` varchar(64) NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `id_value` int(10) unsigned DEFAULT 0,
  `type` enum('category','id_feature','id_attribute_group','availability','condition','manufacturer','weight','price','extras') NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `filter_type` int(10) unsigned NOT NULL DEFAULT 0,
  `filter_show_limit` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_layered_category`),
  KEY `id_category_shop` (`id_category`,`id_shop`,`type`,`id_value`,`position`),
  KEY `id_category` (`id_category`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_category`
--

LOCK TABLES `ubwbh_layered_category` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_category` DISABLE KEYS */;
INSERT INTO `ubwbh_layered_category` VALUES (1,1,'category',2,NULL,'availability',1,0,0),(2,1,'category',2,NULL,'extras',2,0,0),(3,1,'category',2,NULL,'price',3,0,0),(4,1,'category',2,NULL,'category',4,0,0),(5,1,'category',2,1,'id_attribute_group',5,0,0),(6,1,'category',2,2,'id_attribute_group',6,0,0),(7,1,'category',2,1,'id_feature',7,0,0),(8,1,'category',2,2,'id_feature',8,0,0),(9,1,'category',2,NULL,'manufacturer',9,0,0),(10,1,'category',2,NULL,'condition',10,0,0),(11,1,'category',2,NULL,'weight',11,0,0),(12,1,'category',2,3,'id_attribute_group',12,0,0),(13,1,'category',2,4,'id_attribute_group',13,0,0),(14,1,'category',3,NULL,'availability',1,0,0),(15,1,'category',3,NULL,'extras',2,0,0),(16,1,'category',3,NULL,'price',3,0,0),(17,1,'category',3,NULL,'category',4,0,0),(18,1,'category',3,1,'id_attribute_group',5,0,0),(19,1,'category',3,2,'id_attribute_group',6,0,0),(20,1,'category',3,1,'id_feature',7,0,0),(21,1,'category',3,2,'id_feature',8,0,0),(22,1,'category',3,NULL,'manufacturer',9,0,0),(23,1,'category',3,NULL,'condition',10,0,0),(24,1,'category',3,NULL,'weight',11,0,0),(25,1,'category',3,3,'id_attribute_group',12,0,0),(26,1,'category',3,4,'id_attribute_group',13,0,0),(27,1,'category',4,NULL,'availability',1,0,0),(28,1,'category',4,NULL,'extras',2,0,0),(29,1,'category',4,NULL,'price',3,0,0),(30,1,'category',4,NULL,'category',4,0,0),(31,1,'category',4,1,'id_attribute_group',5,0,0),(32,1,'category',4,2,'id_attribute_group',6,0,0),(33,1,'category',4,1,'id_feature',7,0,0),(34,1,'category',4,2,'id_feature',8,0,0),(35,1,'category',4,NULL,'manufacturer',9,0,0),(36,1,'category',4,NULL,'condition',10,0,0),(37,1,'category',4,NULL,'weight',11,0,0),(38,1,'category',4,3,'id_attribute_group',12,0,0),(39,1,'category',4,4,'id_attribute_group',13,0,0),(40,1,'category',5,NULL,'availability',1,0,0),(41,1,'category',5,NULL,'extras',2,0,0),(42,1,'category',5,NULL,'price',3,0,0),(43,1,'category',5,NULL,'category',4,0,0),(44,1,'category',5,1,'id_attribute_group',5,0,0),(45,1,'category',5,2,'id_attribute_group',6,0,0),(46,1,'category',5,1,'id_feature',7,0,0),(47,1,'category',5,2,'id_feature',8,0,0),(48,1,'category',5,NULL,'manufacturer',9,0,0),(49,1,'category',5,NULL,'condition',10,0,0),(50,1,'category',5,NULL,'weight',11,0,0),(51,1,'category',5,3,'id_attribute_group',12,0,0),(52,1,'category',5,4,'id_attribute_group',13,0,0),(53,1,'category',9,NULL,'availability',1,0,0),(54,1,'category',9,NULL,'extras',2,0,0),(55,1,'category',9,NULL,'price',3,0,0),(56,1,'category',9,NULL,'category',4,0,0),(57,1,'category',9,1,'id_attribute_group',5,0,0),(58,1,'category',9,2,'id_attribute_group',6,0,0),(59,1,'category',9,1,'id_feature',7,0,0),(60,1,'category',9,2,'id_feature',8,0,0),(61,1,'category',9,NULL,'manufacturer',9,0,0),(62,1,'category',9,NULL,'condition',10,0,0),(63,1,'category',9,NULL,'weight',11,0,0),(64,1,'category',9,3,'id_attribute_group',12,0,0),(65,1,'category',9,4,'id_attribute_group',13,0,0),(66,1,'category',6,NULL,'availability',1,0,0),(67,1,'category',6,NULL,'extras',2,0,0),(68,1,'category',6,NULL,'price',3,0,0),(69,1,'category',6,NULL,'category',4,0,0),(70,1,'category',6,1,'id_attribute_group',5,0,0),(71,1,'category',6,2,'id_attribute_group',6,0,0),(72,1,'category',6,1,'id_feature',7,0,0),(73,1,'category',6,2,'id_feature',8,0,0),(74,1,'category',6,NULL,'manufacturer',9,0,0),(75,1,'category',6,NULL,'condition',10,0,0),(76,1,'category',6,NULL,'weight',11,0,0),(77,1,'category',6,3,'id_attribute_group',12,0,0),(78,1,'category',6,4,'id_attribute_group',13,0,0),(79,1,'category',8,NULL,'availability',1,0,0),(80,1,'category',8,NULL,'extras',2,0,0),(81,1,'category',8,NULL,'price',3,0,0),(82,1,'category',8,NULL,'category',4,0,0),(83,1,'category',8,1,'id_attribute_group',5,0,0),(84,1,'category',8,2,'id_attribute_group',6,0,0),(85,1,'category',8,1,'id_feature',7,0,0),(86,1,'category',8,2,'id_feature',8,0,0),(87,1,'category',8,NULL,'manufacturer',9,0,0),(88,1,'category',8,NULL,'condition',10,0,0),(89,1,'category',8,NULL,'weight',11,0,0),(90,1,'category',8,3,'id_attribute_group',12,0,0),(91,1,'category',8,4,'id_attribute_group',13,0,0),(92,1,'category',7,NULL,'availability',1,0,0),(93,1,'category',7,NULL,'extras',2,0,0),(94,1,'category',7,NULL,'price',3,0,0),(95,1,'category',7,NULL,'category',4,0,0),(96,1,'category',7,1,'id_attribute_group',5,0,0),(97,1,'category',7,2,'id_attribute_group',6,0,0),(98,1,'category',7,1,'id_feature',7,0,0),(99,1,'category',7,2,'id_feature',8,0,0),(100,1,'category',7,NULL,'manufacturer',9,0,0),(101,1,'category',7,NULL,'condition',10,0,0),(102,1,'category',7,NULL,'weight',11,0,0),(103,1,'category',7,3,'id_attribute_group',12,0,0),(104,1,'category',7,4,'id_attribute_group',13,0,0),(105,1,'manufacturer',0,NULL,'availability',1,0,0),(106,1,'manufacturer',0,NULL,'extras',2,0,0),(107,1,'manufacturer',0,NULL,'price',3,0,0),(108,1,'manufacturer',0,NULL,'category',4,0,0),(109,1,'manufacturer',0,1,'id_attribute_group',5,0,0),(110,1,'manufacturer',0,2,'id_attribute_group',6,0,0),(111,1,'manufacturer',0,1,'id_feature',7,0,0),(112,1,'manufacturer',0,2,'id_feature',8,0,0),(113,1,'manufacturer',0,NULL,'manufacturer',9,0,0),(114,1,'manufacturer',0,NULL,'condition',10,0,0),(115,1,'manufacturer',0,NULL,'weight',11,0,0),(116,1,'manufacturer',0,3,'id_attribute_group',12,0,0),(117,1,'manufacturer',0,4,'id_attribute_group',13,0,0),(118,1,'supplier',0,NULL,'availability',1,0,0),(119,1,'supplier',0,NULL,'extras',2,0,0),(120,1,'supplier',0,NULL,'price',3,0,0),(121,1,'supplier',0,NULL,'category',4,0,0),(122,1,'supplier',0,1,'id_attribute_group',5,0,0),(123,1,'supplier',0,2,'id_attribute_group',6,0,0),(124,1,'supplier',0,1,'id_feature',7,0,0),(125,1,'supplier',0,2,'id_feature',8,0,0),(126,1,'supplier',0,NULL,'manufacturer',9,0,0),(127,1,'supplier',0,NULL,'condition',10,0,0),(128,1,'supplier',0,NULL,'weight',11,0,0),(129,1,'supplier',0,3,'id_attribute_group',12,0,0),(130,1,'supplier',0,4,'id_attribute_group',13,0,0),(131,1,'new-products',0,NULL,'availability',1,0,0),(132,1,'new-products',0,NULL,'extras',2,0,0),(133,1,'new-products',0,NULL,'price',3,0,0),(134,1,'new-products',0,NULL,'category',4,0,0),(135,1,'new-products',0,1,'id_attribute_group',5,0,0),(136,1,'new-products',0,2,'id_attribute_group',6,0,0),(137,1,'new-products',0,1,'id_feature',7,0,0),(138,1,'new-products',0,2,'id_feature',8,0,0),(139,1,'new-products',0,NULL,'manufacturer',9,0,0),(140,1,'new-products',0,NULL,'condition',10,0,0),(141,1,'new-products',0,NULL,'weight',11,0,0),(142,1,'new-products',0,3,'id_attribute_group',12,0,0),(143,1,'new-products',0,4,'id_attribute_group',13,0,0),(144,1,'best-sales',0,NULL,'availability',1,0,0),(145,1,'best-sales',0,NULL,'extras',2,0,0),(146,1,'best-sales',0,NULL,'price',3,0,0),(147,1,'best-sales',0,NULL,'category',4,0,0),(148,1,'best-sales',0,1,'id_attribute_group',5,0,0),(149,1,'best-sales',0,2,'id_attribute_group',6,0,0),(150,1,'best-sales',0,1,'id_feature',7,0,0),(151,1,'best-sales',0,2,'id_feature',8,0,0),(152,1,'best-sales',0,NULL,'manufacturer',9,0,0),(153,1,'best-sales',0,NULL,'condition',10,0,0),(154,1,'best-sales',0,NULL,'weight',11,0,0),(155,1,'best-sales',0,3,'id_attribute_group',12,0,0),(156,1,'best-sales',0,4,'id_attribute_group',13,0,0),(157,1,'prices-drop',0,NULL,'availability',1,0,0),(158,1,'prices-drop',0,NULL,'extras',2,0,0),(159,1,'prices-drop',0,NULL,'price',3,0,0),(160,1,'prices-drop',0,NULL,'category',4,0,0),(161,1,'prices-drop',0,1,'id_attribute_group',5,0,0),(162,1,'prices-drop',0,2,'id_attribute_group',6,0,0),(163,1,'prices-drop',0,1,'id_feature',7,0,0),(164,1,'prices-drop',0,2,'id_feature',8,0,0),(165,1,'prices-drop',0,NULL,'manufacturer',9,0,0),(166,1,'prices-drop',0,NULL,'condition',10,0,0),(167,1,'prices-drop',0,NULL,'weight',11,0,0),(168,1,'prices-drop',0,3,'id_attribute_group',12,0,0),(169,1,'prices-drop',0,4,'id_attribute_group',13,0,0);
/*!40000 ALTER TABLE `ubwbh_layered_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_filter`
--

DROP TABLE IF EXISTS `ubwbh_layered_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_filter` (
  `id_layered_filter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `filters` longtext DEFAULT NULL,
  `n_categories` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_layered_filter`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_filter`
--

LOCK TABLES `ubwbh_layered_filter` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_filter` DISABLE KEYS */;
INSERT INTO `ubwbh_layered_filter` VALUES (1,'My template 2026-11-23','a:16:{s:10:\"categories\";a:8:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;i:4;i:9;i:5;i:6;i:6;i:8;i:7;i:7;}s:11:\"controllers\";a:6:{i:0;s:8:\"category\";i:1;s:12:\"manufacturer\";i:2;s:8:\"supplier\";i:3;s:12:\"new-products\";i:4;s:10:\"best-sales\";i:5;s:11:\"prices-drop\";}s:9:\"shop_list\";a:1:{i:1;i:1;}s:23:\"layered_selection_stock\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:24:\"layered_selection_extras\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:30:\"layered_selection_price_slider\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:31:\"layered_selection_subcategories\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:22:\"layered_selection_ag_1\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:22:\"layered_selection_ag_2\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:24:\"layered_selection_feat_1\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:24:\"layered_selection_feat_2\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:30:\"layered_selection_manufacturer\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:27:\"layered_selection_condition\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:31:\"layered_selection_weight_slider\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:22:\"layered_selection_ag_3\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:22:\"layered_selection_ag_4\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}}',8,'2026-11-23 15:08:58');
/*!40000 ALTER TABLE `ubwbh_layered_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_filter_block`
--

DROP TABLE IF EXISTS `ubwbh_layered_filter_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_filter_block` (
  `hash` char(32) NOT NULL DEFAULT '',
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_filter_block`
--

LOCK TABLES `ubwbh_layered_filter_block` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_filter_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_layered_filter_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_filter_shop`
--

DROP TABLE IF EXISTS `ubwbh_layered_filter_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_filter_shop` (
  `id_layered_filter` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_layered_filter`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_filter_shop`
--

LOCK TABLES `ubwbh_layered_filter_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_filter_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_layered_filter_shop` VALUES (1,1);
/*!40000 ALTER TABLE `ubwbh_layered_filter_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_indexable_attribute_group`
--

DROP TABLE IF EXISTS `ubwbh_layered_indexable_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_indexable_attribute_group` (
  `id_attribute_group` int(11) NOT NULL,
  `indexable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_indexable_attribute_group`
--

LOCK TABLES `ubwbh_layered_indexable_attribute_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_attribute_group` DISABLE KEYS */;
INSERT INTO `ubwbh_layered_indexable_attribute_group` VALUES (1,0),(2,0),(3,0),(4,0);
/*!40000 ALTER TABLE `ubwbh_layered_indexable_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_indexable_attribute_group_lang_value`
--

DROP TABLE IF EXISTS `ubwbh_layered_indexable_attribute_group_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_indexable_attribute_group_lang_value` (
  `id_attribute_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(128) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_indexable_attribute_group_lang_value`
--

LOCK TABLES `ubwbh_layered_indexable_attribute_group_lang_value` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_attribute_group_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_attribute_group_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_indexable_attribute_lang_value`
--

DROP TABLE IF EXISTS `ubwbh_layered_indexable_attribute_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_indexable_attribute_lang_value` (
  `id_attribute` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(128) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_indexable_attribute_lang_value`
--

LOCK TABLES `ubwbh_layered_indexable_attribute_lang_value` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_attribute_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_attribute_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_indexable_feature`
--

DROP TABLE IF EXISTS `ubwbh_layered_indexable_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_indexable_feature` (
  `id_feature` int(11) NOT NULL,
  `indexable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_indexable_feature`
--

LOCK TABLES `ubwbh_layered_indexable_feature` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_feature` DISABLE KEYS */;
INSERT INTO `ubwbh_layered_indexable_feature` VALUES (1,0),(2,0);
/*!40000 ALTER TABLE `ubwbh_layered_indexable_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_indexable_feature_lang_value`
--

DROP TABLE IF EXISTS `ubwbh_layered_indexable_feature_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_indexable_feature_lang_value` (
  `id_feature` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_indexable_feature_lang_value`
--

LOCK TABLES `ubwbh_layered_indexable_feature_lang_value` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_feature_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_feature_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_indexable_feature_value_lang_value`
--

DROP TABLE IF EXISTS `ubwbh_layered_indexable_feature_value_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_indexable_feature_value_lang_value` (
  `id_feature_value` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(128) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_indexable_feature_value_lang_value`
--

LOCK TABLES `ubwbh_layered_indexable_feature_value_lang_value` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_feature_value_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_layered_indexable_feature_value_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_price_index`
--

DROP TABLE IF EXISTS `ubwbh_layered_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_price_index` (
  `id_product` int(11) NOT NULL,
  `id_currency` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `price_min` decimal(20,6) NOT NULL,
  `price_max` decimal(20,6) NOT NULL,
  `id_country` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_currency`,`id_shop`,`id_country`),
  KEY `id_currency` (`id_currency`),
  KEY `price_min` (`price_min`),
  KEY `price_max` (`price_max`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_price_index`
--

LOCK TABLES `ubwbh_layered_price_index` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_price_index` DISABLE KEYS */;
INSERT INTO `ubwbh_layered_price_index` VALUES (1,1,1,19.120000,23.900000,8),(1,1,1,19.120000,23.900000,21),(1,1,1,21.032000,26.290000,110),(2,1,1,28.720000,35.900000,8),(2,1,1,28.720000,35.900000,21),(2,1,1,31.592000,39.490000,110),(3,1,1,29.000000,29.000000,8),(3,1,1,29.000000,29.000000,21),(3,1,1,31.900000,31.900000,110),(4,1,1,29.000000,29.000000,8),(4,1,1,29.000000,29.000000,21),(4,1,1,31.900000,31.900000,110),(5,1,1,29.000000,29.000000,8),(5,1,1,29.000000,29.000000,21),(5,1,1,31.900000,31.900000,110),(6,1,1,11.900000,11.900000,8),(6,1,1,11.900000,11.900000,21),(6,1,1,13.090000,13.090000,110),(7,1,1,11.900000,11.900000,8),(7,1,1,11.900000,11.900000,21),(7,1,1,13.090000,13.090000,110),(8,1,1,11.900000,11.900000,8),(8,1,1,11.900000,11.900000,21),(8,1,1,13.090000,13.090000,110),(9,1,1,18.900000,18.900000,8),(9,1,1,18.900000,18.900000,21),(9,1,1,20.790000,20.790000,110),(10,1,1,18.900000,18.900000,8),(10,1,1,18.900000,18.900000,21),(10,1,1,20.790000,20.790000,110),(11,1,1,18.900000,18.900000,8),(11,1,1,18.900000,18.900000,21),(11,1,1,20.790000,20.790000,110),(12,1,1,9.000000,9.000000,8),(12,1,1,9.000000,9.000000,21),(12,1,1,9.900000,9.900000,110),(13,1,1,9.000000,9.000000,8),(13,1,1,9.000000,9.000000,21),(13,1,1,9.900000,9.900000,110),(14,1,1,9.000000,9.000000,8),(14,1,1,9.000000,9.000000,21),(14,1,1,9.900000,9.900000,110),(15,1,1,35.000000,35.000000,8),(15,1,1,35.000000,35.000000,21),(15,1,1,38.500000,38.500000,110),(16,1,1,12.900000,12.900000,8),(16,1,1,12.900000,12.900000,21),(16,1,1,14.190000,14.190000,110),(17,1,1,12.900000,12.900000,8),(17,1,1,12.900000,12.900000,21),(17,1,1,14.190000,14.190000,110),(18,1,1,12.900000,12.900000,8),(18,1,1,12.900000,12.900000,21),(18,1,1,14.190000,14.190000,110),(19,1,1,13.900000,13.900000,8),(19,1,1,13.900000,13.900000,21),(19,1,1,15.290000,15.290000,110);
/*!40000 ALTER TABLE `ubwbh_layered_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_layered_product_attribute`
--

DROP TABLE IF EXISTS `ubwbh_layered_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_layered_product_attribute` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_attribute_group` int(10) unsigned NOT NULL DEFAULT 0,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_attribute`,`id_product`,`id_shop`),
  UNIQUE KEY `id_attribute_group` (`id_attribute_group`,`id_attribute`,`id_product`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_layered_product_attribute`
--

LOCK TABLES `ubwbh_layered_product_attribute` WRITE;
/*!40000 ALTER TABLE `ubwbh_layered_product_attribute` DISABLE KEYS */;
INSERT INTO `ubwbh_layered_product_attribute` VALUES (1,1,1,1),(1,2,1,1),(2,1,1,1),(2,2,1,1),(3,1,1,1),(3,2,1,1),(4,1,1,1),(4,2,1,1),(8,1,2,1),(8,9,2,1),(8,10,2,1),(8,11,2,1),(11,1,2,1),(11,9,2,1),(11,10,2,1),(11,11,2,1),(19,3,3,1),(19,4,3,1),(19,5,3,1),(20,3,3,1),(20,4,3,1),(20,5,3,1),(21,3,3,1),(21,4,3,1),(21,5,3,1),(22,16,4,1),(22,17,4,1),(22,18,4,1),(23,16,4,1),(23,17,4,1),(23,18,4,1),(24,16,4,1),(24,17,4,1),(24,18,4,1),(25,16,4,1),(25,17,4,1),(25,18,4,1);
/*!40000 ALTER TABLE `ubwbh_layered_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_link_block`
--

DROP TABLE IF EXISTS `ubwbh_link_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_link_block` (
  `id_link_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_hook` int(1) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id_link_block`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_link_block`
--

LOCK TABLES `ubwbh_link_block` WRITE;
/*!40000 ALTER TABLE `ubwbh_link_block` DISABLE KEYS */;
INSERT INTO `ubwbh_link_block` VALUES (1,50,0,'{\"cms\":[false],\"product\":[\"prices-drop\",\"new-products\",\"best-sales\"],\"static\":[false]}'),(2,50,1,'{\"cms\":[\"1\",\"2\",\"3\",\"4\",\"5\"],\"product\":[false],\"static\":[\"contact\",\"sitemap\",\"stores\"]}');
/*!40000 ALTER TABLE `ubwbh_link_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_link_block_lang`
--

DROP TABLE IF EXISTS `ubwbh_link_block_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_link_block_lang` (
  `id_link_block` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `custom_content` text DEFAULT NULL,
  PRIMARY KEY (`id_link_block`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_link_block_lang`
--

LOCK TABLES `ubwbh_link_block_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_link_block_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_link_block_lang` VALUES (1,1,'Products',NULL),(1,2,'Products',NULL),(2,1,'Our company',NULL),(2,2,'Our company',NULL);
/*!40000 ALTER TABLE `ubwbh_link_block_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_link_block_shop`
--

DROP TABLE IF EXISTS `ubwbh_link_block_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_link_block_shop` (
  `id_link_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_link_block`,`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_link_block_shop`
--

LOCK TABLES `ubwbh_link_block_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_link_block_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_link_block_shop` VALUES (1,1,0),(2,1,1);
/*!40000 ALTER TABLE `ubwbh_link_block_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_linksmenutop`
--

DROP TABLE IF EXISTS `ubwbh_linksmenutop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_linksmenutop` (
  `id_linksmenutop` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `new_window` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_linksmenutop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_linksmenutop`
--

LOCK TABLES `ubwbh_linksmenutop` WRITE;
/*!40000 ALTER TABLE `ubwbh_linksmenutop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_linksmenutop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_linksmenutop_lang`
--

DROP TABLE IF EXISTS `ubwbh_linksmenutop_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_linksmenutop_lang` (
  `id_linksmenutop` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `label` varchar(128) NOT NULL,
  `link` varchar(128) NOT NULL,
  KEY `id_linksmenutop` (`id_linksmenutop`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_linksmenutop_lang`
--

LOCK TABLES `ubwbh_linksmenutop_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_linksmenutop_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_linksmenutop_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_log`
--

DROP TABLE IF EXISTS `ubwbh_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_log` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(1) NOT NULL,
  `error_code` int(11) DEFAULT NULL,
  `message` mediumtext NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `id_shop` int(10) unsigned DEFAULT NULL,
  `id_shop_group` int(10) unsigned DEFAULT NULL,
  `id_lang` int(10) unsigned DEFAULT NULL,
  `in_all_shops` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_log`
--

LOCK TABLES `ubwbh_log` WRITE;
/*!40000 ALTER TABLE `ubwbh_log` DISABLE KEYS */;
INSERT INTO `ubwbh_log` VALUES (1,1,0,'Exporting mail with theme modern for language English (English), Core output folder: C:\\xampp\\htdocs\\bloowing_flower/mails, Modules output folder: C:\\xampp\\htdocs\\bloowing_flower/modules/','',0,NULL,NULL,0,0,0,'2026-11-23 14:59:22','2026-11-23 14:59:22'),(2,1,0,'Exporting mail with theme modern for language Indonesia (Indonesia), Core output folder: C:\\xampp\\htdocs\\bloowing_flower/mails, Modules output folder: C:\\xampp\\htdocs\\bloowing_flower/modules/','',0,NULL,NULL,0,0,0,'2026-11-23 14:59:33','2026-11-23 14:59:33'),(3,1,0,'ExecKernelCacheClearer: Successfully cleared cache for prod env admin','',0,NULL,NULL,1,0,0,'2026-11-23 14:59:39','2026-11-23 14:59:39'),(4,1,0,'ExecKernelCacheClearer: Successfully warmed up cache for admin env prod','',0,NULL,NULL,1,0,0,'2026-11-23 15:01:10','2026-11-23 15:01:10'),(5,1,0,'Starting module install: blockreassurance v6.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:33','2026-11-23 15:01:33'),(6,1,0,'Module installed successfully: blockreassurance v6.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:33','2026-11-23 15:01:33'),(7,1,0,'Starting module install: blockwishlist v4.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:34','2026-11-23 15:01:34'),(8,1,0,'Module installed successfully: blockwishlist v4.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:34','2026-11-23 15:01:34'),(9,1,0,'Starting module install: contactform v5.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:34','2026-11-23 15:01:34'),(10,1,0,'Module installed successfully: contactform v5.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:34','2026-11-23 15:01:34'),(11,1,0,'Starting module install: dashactivity v2.1.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:35','2026-11-23 15:01:35'),(12,1,0,'Module installed successfully: dashactivity v2.1.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:35','2026-11-23 15:01:35'),(13,1,0,'Starting module install: dashgoals v2.0.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:35','2026-11-23 15:01:35'),(14,1,0,'Module installed successfully: dashgoals v2.0.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:35','2026-11-23 15:01:35'),(15,1,0,'Starting module install: dashproducts v2.2.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:35','2026-11-23 15:01:35'),(16,1,0,'Module installed successfully: dashproducts v2.2.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:35','2026-11-23 15:01:35'),(17,1,0,'Starting module install: dashtrends v2.1.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:35','2026-11-23 15:01:35'),(18,1,0,'Module installed successfully: dashtrends v2.1.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:35','2026-11-23 15:01:35'),(19,1,0,'Starting module install: graphnvd3 v2.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(20,1,0,'Module installed successfully: graphnvd3 v2.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(21,1,0,'Starting module install: gridhtml v2.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(22,1,0,'Module installed successfully: gridhtml v2.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(23,1,0,'Starting module install: gsitemap v5.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(24,1,0,'Module installed successfully: gsitemap v5.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(25,1,0,'Starting module install: klaviyopsautomation v1.13.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(26,1,0,'Module installed successfully: klaviyopsautomation v1.13.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(27,1,0,'Webservice key created: DcKkgbxd3QPfdVEn4Z6xvp4UMQNNVY48','WebserviceKey',1,1,NULL,1,0,1,'2026-11-23 15:01:36','2026-11-23 15:01:36'),(28,1,0,'Starting module install: ps_accounts v8.0.17','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:38','2026-11-23 15:01:38'),(29,1,0,'Module installed successfully: ps_accounts v8.0.17','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:38','2026-11-23 15:01:38'),(30,1,0,'Starting module install: pagesnotfound v4.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:43','2026-11-23 15:01:43'),(31,1,0,'Module installed successfully: pagesnotfound v4.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:43','2026-11-23 15:01:43'),(32,1,0,'Starting module install: productcomments v9.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:44','2026-11-23 15:01:44'),(33,1,0,'Module installed successfully: productcomments v9.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:44','2026-11-23 15:01:44'),(34,1,0,'Starting module install: psgdpr v1.4.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:44','2026-11-23 15:01:44'),(35,1,0,'Module installed successfully: psgdpr v1.4.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:44','2026-11-23 15:01:44'),(36,1,0,'Starting module install: psshipping v2.1.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:50','2026-11-23 15:01:50'),(37,1,0,'Module installed successfully: psshipping v2.1.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:50','2026-11-23 15:01:50'),(38,3,0,'Cannot register tab \"PsshippingCarrierController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(39,3,0,'Cannot register tab \"PsshippingCarrierController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(40,3,0,'Cannot register tab \"PsshippingCarrierController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(41,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(42,3,0,'Cannot register tab \"PsshippingOrdersController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(43,3,0,'Cannot register tab \"PsshippingOrdersController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(44,3,0,'Cannot register tab \"PsshippingOrdersController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(45,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(46,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(47,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(48,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(49,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(50,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(51,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(52,3,0,'Cannot register tab \"PsshippingKeycloakAuthController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(53,3,0,'Cannot register tab \"PsshippingConfigurationController\" because it already exists','',0,1,NULL,1,0,1,'2026-11-23 15:01:51','2026-11-23 15:01:51'),(54,1,0,'Starting module install: psxmarketingwithgoogle v1.75.6','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:54','2026-11-23 15:01:54'),(55,1,0,'Module installed successfully: psxmarketingwithgoogle v1.75.6','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:54','2026-11-23 15:01:54'),(56,1,0,'Starting module install: ps_apiresources v0.9.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:54','2026-11-23 15:01:54'),(57,1,0,'Module installed successfully: ps_apiresources v0.9.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:54','2026-11-23 15:01:54'),(58,1,0,'Starting module install: ps_ask_ai v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:55','2026-11-23 15:01:55'),(59,1,0,'Module installed successfully: ps_ask_ai v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:55','2026-11-23 15:01:55'),(60,1,0,'Starting module install: ps_banner v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:55','2026-11-23 15:01:55'),(61,1,0,'Module installed successfully: ps_banner v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:55','2026-11-23 15:01:55'),(62,1,0,'Starting module install: ps_bestsellers v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:56','2026-11-23 15:01:56'),(63,1,0,'Module installed successfully: ps_bestsellers v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:56','2026-11-23 15:01:56'),(64,1,0,'Starting module install: ps_brandlist v1.0.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:56','2026-11-23 15:01:56'),(65,1,0,'Module installed successfully: ps_brandlist v1.0.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:56','2026-11-23 15:01:56'),(66,1,0,'Starting module install: ps_cashondelivery v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:56','2026-11-23 15:01:56'),(67,1,0,'Module installed successfully: ps_cashondelivery v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:56','2026-11-23 15:01:56'),(68,1,0,'Starting module install: ps_categoryproducts v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:57','2026-11-23 15:01:57'),(69,1,0,'Module installed successfully: ps_categoryproducts v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:57','2026-11-23 15:01:57'),(70,1,0,'Starting module install: ps_categorytree v3.0.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:57','2026-11-23 15:01:57'),(71,1,0,'Module installed successfully: ps_categorytree v3.0.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:01:57','2026-11-23 15:01:57'),(72,1,0,'Starting module install: ps_checkout v9.5.5.6','Module',0,NULL,NULL,1,1,1,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(73,1,0,'Module installed successfully: ps_checkout v9.5.5.6','Module',0,NULL,NULL,1,1,1,'2026-11-23 15:02:05','2026-11-23 15:02:05'),(74,1,0,'Starting module install: ps_checkpayment v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:07','2026-11-23 15:02:07'),(75,1,0,'Module installed successfully: ps_checkpayment v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:07','2026-11-23 15:02:07'),(76,1,0,'Starting module install: ps_classic_edition v1.0.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:07','2026-11-23 15:02:07'),(77,1,0,'Module installed successfully: ps_classic_edition v1.0.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:07','2026-11-23 15:02:07'),(78,1,0,'Starting module install: ps_contactinfo v3.3.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:07','2026-11-23 15:02:07'),(79,1,0,'Module installed successfully: ps_contactinfo v3.3.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:07','2026-11-23 15:02:07'),(80,1,0,'Starting module install: ps_crossselling v2.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:08','2026-11-23 15:02:08'),(81,1,0,'Module installed successfully: ps_crossselling v2.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:08','2026-11-23 15:02:08'),(82,1,0,'Starting module install: ps_currencyselector v2.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:08','2026-11-23 15:02:08'),(83,1,0,'Module installed successfully: ps_currencyselector v2.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:08','2026-11-23 15:02:08'),(84,1,0,'Starting module install: ps_customeraccountlinks v3.2.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:08','2026-11-23 15:02:08'),(85,1,0,'Module installed successfully: ps_customeraccountlinks v3.2.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:08','2026-11-23 15:02:08'),(86,1,0,'Starting module install: ps_customersignin v2.0.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(87,1,0,'Module installed successfully: ps_customersignin v2.0.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(88,1,0,'Starting module install: ps_customtext v4.2.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(89,1,0,'Module installed successfully: ps_customtext v4.2.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(90,1,0,'Starting module install: ps_dataprivacy v2.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(91,1,0,'Module installed successfully: ps_dataprivacy v2.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(92,1,0,'Starting module install: ps_distributionapiclient v2.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(93,1,0,'Module installed successfully: ps_distributionapiclient v2.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:09','2026-11-23 15:02:09'),(94,1,0,'Starting module install: ps_emailalerts v3.0.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:10','2026-11-23 15:02:10'),(95,1,0,'Module installed successfully: ps_emailalerts v3.0.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:10','2026-11-23 15:02:10'),(96,1,0,'Starting module install: ps_emailsubscription v3.0.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:10','2026-11-23 15:02:10'),(97,1,0,'Module installed successfully: ps_emailsubscription v3.0.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:10','2026-11-23 15:02:10'),(98,1,0,'Starting module install: ps_eventbus v4.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:11','2026-11-23 15:02:11'),(99,1,0,'Module installed successfully: ps_eventbus v4.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:11','2026-11-23 15:02:11'),(100,1,0,'Starting module install: ps_facebook v1.38.19','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:14','2026-11-23 15:02:14'),(101,1,0,'Module installed successfully: ps_facebook v1.38.19','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:14','2026-11-23 15:02:14'),(102,1,0,'Starting module install: ps_facetedsearch v5.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:15','2026-11-23 15:02:15'),(103,1,0,'Module installed successfully: ps_facetedsearch v5.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:15','2026-11-23 15:02:15'),(104,1,0,'Starting module install: ps_faviconnotificationbo v2.1.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:17','2026-11-23 15:02:17'),(105,1,0,'Module installed successfully: ps_faviconnotificationbo v2.1.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:17','2026-11-23 15:02:17'),(106,1,0,'Starting module install: ps_featuredproducts v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:17','2026-11-23 15:02:17'),(107,1,0,'Module installed successfully: ps_featuredproducts v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:17','2026-11-23 15:02:17'),(108,1,0,'Starting module install: ps_googleanalytics v6.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:17','2026-11-23 15:02:17'),(109,1,0,'Module installed successfully: ps_googleanalytics v6.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:17','2026-11-23 15:02:17'),(110,1,0,'Starting module install: ps_imageslider v3.2.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:18','2026-11-23 15:02:18'),(111,1,0,'Module installed successfully: ps_imageslider v3.2.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:18','2026-11-23 15:02:18'),(112,1,0,'Starting module install: ps_languageselector v2.1.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:18','2026-11-23 15:02:18'),(113,1,0,'Module installed successfully: ps_languageselector v2.1.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:18','2026-11-23 15:02:18'),(114,1,0,'Starting module install: ps_linklist v7.0.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:19','2026-11-23 15:02:19'),(115,1,0,'Module installed successfully: ps_linklist v7.0.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:19','2026-11-23 15:02:19'),(116,1,0,'Starting module install: ps_mainmenu v2.3.6','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:19','2026-11-23 15:02:19'),(117,1,0,'Module installed successfully: ps_mainmenu v2.3.6','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:19','2026-11-23 15:02:19'),(118,1,0,'Starting module install: ps_mbo v5.3.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:20','2026-11-23 15:02:20'),(119,1,0,'Module installed successfully: ps_mbo v5.3.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:21','2026-11-23 15:02:21'),(120,1,0,'Starting module install: ps_mcp_server v1.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:21','2026-11-23 15:02:21'),(121,1,0,'Module installed successfully: ps_mcp_server v1.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:21','2026-11-23 15:02:21'),(122,1,0,'Starting module install: ps_mcp_tools v1.0.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(123,1,0,'Module installed successfully: ps_mcp_tools v1.0.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(124,1,0,'Starting module install: ps_newproducts v2.0.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(125,1,0,'Module installed successfully: ps_newproducts v2.0.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(126,1,0,'Starting module install: ps_onepagecheckout v0.6.7','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:22','2026-11-23 15:02:22'),(127,1,0,'Module installed successfully: ps_onepagecheckout v0.6.7','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:23','2026-11-23 15:02:23'),(128,1,0,'Starting module install: ps_searchbar v2.1.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:23','2026-11-23 15:02:23'),(129,1,0,'Module installed successfully: ps_searchbar v2.1.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:23','2026-11-23 15:02:23'),(130,1,0,'Starting module install: ps_sharebuttons v2.1.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:23','2026-11-23 15:02:23'),(131,1,0,'Module installed successfully: ps_sharebuttons v2.1.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:23','2026-11-23 15:02:23'),(132,1,0,'Starting module install: ps_shoppingcart v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:23','2026-11-23 15:02:23'),(133,1,0,'Module installed successfully: ps_shoppingcart v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:23','2026-11-23 15:02:23'),(134,1,0,'Starting module install: ps_socialfollow v2.3.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:23','2026-11-23 15:02:23'),(135,1,0,'Module installed successfully: ps_socialfollow v2.3.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(136,1,0,'Starting module install: ps_specials v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(137,1,0,'Module installed successfully: ps_specials v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(138,1,0,'Starting module install: ps_supplierlist v1.0.7','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(139,1,0,'Module installed successfully: ps_supplierlist v1.0.7','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(140,1,0,'Starting module install: ps_themecusto v1.2.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(141,1,0,'Module installed successfully: ps_themecusto v1.2.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:24','2026-11-23 15:02:24'),(142,1,0,'Starting module install: ps_viewedproduct v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(143,1,0,'Module installed successfully: ps_viewedproduct v2.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(144,1,0,'Starting module install: ps_wirepayment v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(145,1,0,'Module installed successfully: ps_wirepayment v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(146,1,0,'Starting module install: statsbestcategories v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(147,1,0,'Module installed successfully: statsbestcategories v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(148,1,0,'Starting module install: statsbestcustomers v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(149,1,0,'Module installed successfully: statsbestcustomers v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(150,1,0,'Starting module install: statsbestmanufacturers v2.0.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(151,1,0,'Module installed successfully: statsbestmanufacturers v2.0.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:25','2026-11-23 15:02:25'),(152,1,0,'Starting module install: statsbestproducts v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(153,1,0,'Module installed successfully: statsbestproducts v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(154,1,0,'Starting module install: statsbestsuppliers v2.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(155,1,0,'Module installed successfully: statsbestsuppliers v2.0.3','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(156,1,0,'Starting module install: statsbestvouchers v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(157,1,0,'Module installed successfully: statsbestvouchers v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(158,1,0,'Starting module install: statscarrier v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(159,1,0,'Module installed successfully: statscarrier v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(160,1,0,'Starting module install: statscatalog v2.0.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(161,1,0,'Module installed successfully: statscatalog v2.0.5','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(162,1,0,'Starting module install: statscheckup v2.0.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:26','2026-11-23 15:02:26'),(163,1,0,'Module installed successfully: statscheckup v2.0.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(164,1,0,'Starting module install: statsdata v2.1.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(165,1,0,'Module installed successfully: statsdata v2.1.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(166,1,0,'Starting module install: statsforecast v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(167,1,0,'Module installed successfully: statsforecast v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(168,1,0,'Starting module install: statsnewsletter v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(169,1,0,'Module installed successfully: statsnewsletter v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(170,1,0,'Starting module install: statspersonalinfos v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(171,1,0,'Module installed successfully: statspersonalinfos v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:27','2026-11-23 15:02:27'),(172,1,0,'Starting module install: statsproduct v2.1.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:28','2026-11-23 15:02:28'),(173,1,0,'Module installed successfully: statsproduct v2.1.4','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:28','2026-11-23 15:02:28'),(174,1,0,'Starting module install: statsregistrations v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:28','2026-11-23 15:02:28'),(175,1,0,'Module installed successfully: statsregistrations v2.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:28','2026-11-23 15:02:28'),(176,1,0,'Starting module install: statssales v2.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:28','2026-11-23 15:02:28'),(177,1,0,'Module installed successfully: statssales v2.1.1','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:28','2026-11-23 15:02:28'),(178,1,0,'Starting module install: statssearch v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:28','2026-11-23 15:02:28'),(179,1,0,'Module installed successfully: statssearch v3.0.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:28','2026-11-23 15:02:28'),(180,1,0,'Starting module install: statsstock v2.0.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:29','2026-11-23 15:02:29'),(181,1,0,'Module installed successfully: statsstock v2.0.2','Module',0,1,NULL,1,0,1,'2026-11-23 15:02:29','2026-11-23 15:02:29'),(182,1,0,'ExecKernelCacheClearer: Successfully cleared cache for prod env admin','',0,1,NULL,1,0,1,'2026-11-23 15:02:34','2026-11-23 15:02:34'),(183,1,0,'ExecKernelCacheClearer: Successfully warmed up cache for admin env prod','',0,1,NULL,1,0,1,'2026-11-23 15:08:32','2026-11-23 15:08:32'),(184,1,0,'Starting module uninstall: ps_facetedsearch v5.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:08:54','2026-11-23 15:08:54'),(185,1,0,'Module uninstalled successfully: ps_facetedsearch v5.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:08:54','2026-11-23 15:08:54'),(186,1,0,'Starting module install: ps_facetedsearch v5.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:08:58','2026-11-23 15:08:58'),(187,1,0,'Module installed successfully: ps_facetedsearch v5.1.0','Module',0,1,NULL,1,0,1,'2026-11-23 15:08:58','2026-11-23 15:08:58');
/*!40000 ALTER TABLE `ubwbh_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_mail`
--

DROP TABLE IF EXISTS `ubwbh_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_mail` (
  `id_mail` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recipient` varchar(255) NOT NULL,
  `template` varchar(62) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_mail`),
  KEY `recipient` (`recipient`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_mail`
--

LOCK TABLES `ubwbh_mail` WRITE;
/*!40000 ALTER TABLE `ubwbh_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_mailalert_customer_oos`
--

DROP TABLE IF EXISTS `ubwbh_mailalert_customer_oos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_mailalert_customer_oos` (
  `id_customer` int(10) unsigned NOT NULL,
  `customer_email` varchar(128) NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`customer_email`,`id_product`,`id_product_attribute`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_mailalert_customer_oos`
--

LOCK TABLES `ubwbh_mailalert_customer_oos` WRITE;
/*!40000 ALTER TABLE `ubwbh_mailalert_customer_oos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_mailalert_customer_oos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_manufacturer`
--

DROP TABLE IF EXISTS `ubwbh_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_manufacturer` (
  `id_manufacturer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_manufacturer`
--

LOCK TABLES `ubwbh_manufacturer` WRITE;
/*!40000 ALTER TABLE `ubwbh_manufacturer` DISABLE KEYS */;
INSERT INTO `ubwbh_manufacturer` VALUES (1,'Studio Design','2026-11-23 15:08:46','2026-11-23 15:08:46',1),(2,'Graphic Corner','2026-11-23 15:08:46','2026-11-23 15:08:46',1);
/*!40000 ALTER TABLE `ubwbh_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_manufacturer_lang`
--

DROP TABLE IF EXISTS `ubwbh_manufacturer_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_manufacturer_lang` (
  `id_manufacturer` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `short_description` mediumtext DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_manufacturer_lang`
--

LOCK TABLES `ubwbh_manufacturer_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_manufacturer_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_manufacturer_lang` VALUES (1,1,'<p>Studio Design offers a range of items from ready-to-wear collections to contemporary objects. The brand has been presenting new ideas and trends since its creation in 2012.</p>','','',''),(1,2,'<p>Studio Design offers a range of items from ready-to-wear collections to contemporary objects. The brand has been presenting new ideas and trends since its creation in 2012.</p>','','',''),(2,1,'<p>Since 2010, Graphic Corner offers a large choice of quality posters, available on paper and many other formats. </p>','','',''),(2,2,'<p>Since 2010, Graphic Corner offers a large choice of quality posters, available on paper and many other formats. </p>','','','');
/*!40000 ALTER TABLE `ubwbh_manufacturer_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_manufacturer_shop`
--

DROP TABLE IF EXISTS `ubwbh_manufacturer_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_manufacturer_shop` (
  `id_manufacturer` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_manufacturer_shop`
--

LOCK TABLES `ubwbh_manufacturer_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_manufacturer_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_manufacturer_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `ubwbh_manufacturer_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_mbo_api_config`
--

DROP TABLE IF EXISTS `ubwbh_mbo_api_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_mbo_api_config` (
  `id_mbo_api_config` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  `ps_version` varchar(255) DEFAULT NULL,
  `mbo_version` varchar(255) DEFAULT NULL,
  `applied` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_mbo_api_config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_mbo_api_config`
--

LOCK TABLES `ubwbh_mbo_api_config` WRITE;
/*!40000 ALTER TABLE `ubwbh_mbo_api_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_mbo_api_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_mcp_server_allowed_users`
--

DROP TABLE IF EXISTS `ubwbh_mcp_server_allowed_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_mcp_server_allowed_users` (
  `email` varchar(255) NOT NULL,
  `role` enum('editor','viewer') NOT NULL DEFAULT 'viewer',
  `token_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_mcp_server_allowed_users`
--

LOCK TABLES `ubwbh_mcp_server_allowed_users` WRITE;
/*!40000 ALTER TABLE `ubwbh_mcp_server_allowed_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_mcp_server_allowed_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_mcp_server_features`
--

DROP TABLE IF EXISTS `ubwbh_mcp_server_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_mcp_server_features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `type` enum('tool','prompt','resource','resourceTemplate') NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'general',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feature_name_type` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_mcp_server_features`
--

LOCK TABLES `ubwbh_mcp_server_features` WRITE;
/*!40000 ALTER TABLE `ubwbh_mcp_server_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_mcp_server_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_mcp_server_modules`
--

DROP TABLE IF EXISTS `ubwbh_mcp_server_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_mcp_server_modules` (
  `module_id` int(10) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_mcp_server_modules`
--

LOCK TABLES `ubwbh_mcp_server_modules` WRITE;
/*!40000 ALTER TABLE `ubwbh_mcp_server_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_mcp_server_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_memcached_servers`
--

DROP TABLE IF EXISTS `ubwbh_memcached_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_memcached_servers` (
  `id_memcached_server` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(254) NOT NULL,
  `port` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_memcached_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_memcached_servers`
--

LOCK TABLES `ubwbh_memcached_servers` WRITE;
/*!40000 ALTER TABLE `ubwbh_memcached_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_memcached_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_message`
--

DROP TABLE IF EXISTS `ubwbh_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_message` (
  `id_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `message` mediumtext NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `message_order` (`id_order`),
  KEY `id_cart` (`id_cart`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_message`
--

LOCK TABLES `ubwbh_message` WRITE;
/*!40000 ALTER TABLE `ubwbh_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_message_readed`
--

DROP TABLE IF EXISTS `ubwbh_message_readed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_message_readed` (
  `id_message` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`,`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_message_readed`
--

LOCK TABLES `ubwbh_message_readed` WRITE;
/*!40000 ALTER TABLE `ubwbh_message_readed` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_message_readed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_meta`
--

DROP TABLE IF EXISTS `ubwbh_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_meta` (
  `id_meta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(64) NOT NULL,
  `configurable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_meta`),
  UNIQUE KEY `page` (`page`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_meta`
--

LOCK TABLES `ubwbh_meta` WRITE;
/*!40000 ALTER TABLE `ubwbh_meta` DISABLE KEYS */;
INSERT INTO `ubwbh_meta` VALUES (1,'pagenotfound',1),(2,'best-sales',1),(3,'contact',1),(4,'index',1),(5,'manufacturer',1),(6,'new-products',1),(7,'password',1),(8,'prices-drop',1),(9,'sitemap',1),(10,'supplier',1),(11,'address',1),(12,'addresses',1),(13,'authentication',1),(14,'registration',1),(15,'cart',1),(16,'discount',1),(17,'history',1),(18,'identity',1),(19,'my-account',1),(20,'order-follow',1),(21,'order-slip',1),(22,'order',1),(23,'search',1),(24,'stores',1),(25,'guest-tracking',1),(26,'order-confirmation',1),(27,'product',0),(28,'category',0),(29,'cms',0),(30,'module-cheque-payment',0),(31,'module-cheque-validation',0),(32,'module-bankwire-validation',0),(33,'module-bankwire-payment',0),(34,'module-cashondelivery-validation',0),(35,'module-ps_cashondelivery-validation',1),(36,'module-ps_checkpayment-payment',1),(37,'module-ps_checkpayment-validation',1),(38,'module-ps_emailalerts-account',1),(39,'module-ps_emailsubscription-verification',1),(40,'module-ps_emailsubscription-subscription',1),(41,'module-ps_onepagecheckout-guestinit',1),(42,'module-ps_onepagecheckout-addressform',1),(43,'module-ps_onepagecheckout-addresseslist',1),(44,'module-ps_onepagecheckout-states',1),(45,'module-ps_onepagecheckout-saveaddress',1),(46,'module-ps_onepagecheckout-selectaddress',1),(47,'module-ps_onepagecheckout-deleteaddress',1),(48,'module-ps_onepagecheckout-carriers',1),(49,'module-ps_onepagecheckout-selectcarrier',1),(50,'module-ps_onepagecheckout-paymentmethods',1),(51,'module-ps_onepagecheckout-selectpayment',1),(52,'module-ps_onepagecheckout-opcsubmit',1),(53,'module-ps_shoppingcart-ajax',1),(54,'module-ps_wirepayment-payment',1),(55,'module-ps_wirepayment-validation',1);
/*!40000 ALTER TABLE `ubwbh_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_meta_lang`
--

DROP TABLE IF EXISTS `ubwbh_meta_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_meta_lang` (
  `id_meta` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url_rewrite` varchar(255) NOT NULL,
  PRIMARY KEY (`id_meta`,`id_shop`,`id_lang`),
  KEY `id_shop` (`id_shop`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_meta_lang`
--

LOCK TABLES `ubwbh_meta_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_meta_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_meta_lang` VALUES (1,1,1,'404 error','This page cannot be found','page-not-found'),(1,1,2,'Eror 404','Halaman tidak ditemukan','halaman-tidak-ditemukan'),(2,1,1,'Best sellers','Our best sales','best-sellers'),(2,1,2,'Terlaris','Produk terlaris','Terlaris'),(3,1,1,'Contact us','Use our form to contact us','contact-us'),(3,1,2,'Hubungi kami','Gunakan form ini untuk menghubungi kami','hubungi-kami'),(4,1,1,'','',''),(4,1,2,'','',''),(5,1,1,'Brands','Brands list','brands'),(5,1,2,'Brand','Daftar brand','brand'),(6,1,1,'New products','Our new products','new-products'),(6,1,2,'Produk baru','Produk terbaru','produk-terbaru'),(7,1,1,'Forgot your password','Enter the e-mail address you use to sign in to receive an e-mail with a new password','password-recovery'),(7,1,2,'Lupa password Anda','Isi alamat e-mail dengan alamat e-mail yang Anda gunakan sewaktu mendaftar yang akan digunakan untuk mengirim password baru','lupa-password'),(8,1,1,'Prices drop','Our special products','prices-drop'),(8,1,2,'Turun harga','Produk spesial kami','turun-harga'),(9,1,1,'Sitemap','Lost ? Find what your are looking for','sitemap'),(9,1,2,'Sitemap','Tersesat ? Temukan yang anda cari','sitemap'),(10,1,1,'Suppliers','Suppliers list','suppliers'),(10,1,2,'Supplier','Daftar supplier','supplier'),(11,1,1,'Address','','address'),(11,1,2,'Alamat','','alamat'),(12,1,1,'Addresses','','addresses'),(12,1,2,'Alamat','','daftar-alamat'),(13,1,1,'Login','','login'),(13,1,2,'Login','','login'),(14,1,1,'Registration','','registration'),(14,1,2,'Pendaftaran','','pendaftaran'),(15,1,1,'Cart','','cart'),(15,1,2,'Troli','','keranjang-belanja'),(16,1,1,'Discount','','discount'),(16,1,2,'Diskon','','diskon'),(17,1,1,'Order history','','order-history'),(17,1,2,'Riwayat pembelian','','riwayat-pembelian'),(18,1,1,'Identity','','identity'),(18,1,2,'Identitas','','identitas'),(19,1,1,'My account','','my-account'),(19,1,2,'Akun saya','','akun-saya'),(20,1,1,'Order follow','','order-follow'),(20,1,2,'Pantau order','','pantau-order'),(21,1,1,'Credit slip','','credit-slip'),(21,1,2,'Slip Kredit','','slip-order'),(22,1,1,'Order','','order'),(22,1,2,'Rangka','','penjualan'),(23,1,1,'Search','','search'),(23,1,2,'Cari','','cari'),(24,1,1,'Stores','','stores'),(24,1,2,'Toko','','toko'),(25,1,1,'Guest tracking','','guest-tracking'),(25,1,2,'Pelacakan tamu','','pelacakan-tamu'),(26,1,1,'Order confirmation','','order-confirmation'),(26,1,2,'Konfirmasi Pembelian','','konfirmasi-pembelian'),(35,1,1,'','',''),(35,1,2,'','',''),(36,1,1,'','',''),(36,1,2,'','',''),(37,1,1,'','',''),(37,1,2,'','',''),(38,1,1,'','',''),(38,1,2,'','',''),(39,1,1,'','',''),(39,1,2,'','',''),(40,1,1,'','',''),(40,1,2,'','',''),(41,1,1,'','',''),(41,1,2,'','',''),(42,1,1,'','',''),(42,1,2,'','',''),(43,1,1,'','',''),(43,1,2,'','',''),(44,1,1,'','',''),(44,1,2,'','',''),(45,1,1,'','',''),(45,1,2,'','',''),(46,1,1,'','',''),(46,1,2,'','',''),(47,1,1,'','',''),(47,1,2,'','',''),(48,1,1,'','',''),(48,1,2,'','',''),(49,1,1,'','',''),(49,1,2,'','',''),(50,1,1,'','',''),(50,1,2,'','',''),(51,1,1,'','',''),(51,1,2,'','',''),(52,1,1,'','',''),(52,1,2,'','',''),(53,1,1,'','',''),(53,1,2,'','',''),(54,1,1,'','',''),(54,1,2,'','',''),(55,1,1,'','',''),(55,1,2,'','','');
/*!40000 ALTER TABLE `ubwbh_meta_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module`
--

DROP TABLE IF EXISTS `ubwbh_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `version` varchar(8) NOT NULL,
  PRIMARY KEY (`id_module`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module`
--

LOCK TABLES `ubwbh_module` WRITE;
/*!40000 ALTER TABLE `ubwbh_module` DISABLE KEYS */;
INSERT INTO `ubwbh_module` VALUES (1,'blockreassurance',1,'6.0.0'),(2,'blockwishlist',1,'4.0.0'),(3,'contactform',1,'5.0.0'),(4,'dashactivity',1,'2.1.2'),(5,'dashgoals',1,'2.0.5'),(6,'dashproducts',1,'2.2.1'),(7,'dashtrends',1,'2.1.3'),(8,'graphnvd3',1,'2.0.3'),(9,'gridhtml',1,'2.0.3'),(10,'gsitemap',1,'5.0.0'),(11,'klaviyopsautomation',1,'1.13.2'),(12,'ps_accounts',1,'8.0.17'),(13,'pagesnotfound',1,'4.0.0'),(14,'productcomments',1,'9.0.0'),(15,'psgdpr',1,'1.4.4'),(16,'psshipping',1,'2.1.4'),(17,'psxmarketingwithgoogle',1,'1.75.6'),(18,'ps_apiresources',1,'0.9.0'),(19,'ps_ask_ai',1,'2.0.0'),(20,'ps_banner',0,'3.0.0'),(21,'ps_bestsellers',1,'2.0.0'),(22,'ps_brandlist',1,'1.0.5'),(23,'ps_cashondelivery',1,'3.0.0'),(24,'ps_categoryproducts',1,'2.0.0'),(25,'ps_categorytree',1,'3.0.2'),(26,'ps_checkout',1,'9.5.5.6'),(27,'ps_checkpayment',1,'2.1.0'),(28,'ps_classic_edition',1,'1.0.2'),(29,'ps_contactinfo',1,'3.3.3'),(30,'ps_crossselling',1,'2.0.3'),(31,'ps_currencyselector',1,'2.1.1'),(32,'ps_customeraccountlinks',1,'3.2.0'),(33,'ps_customersignin',1,'2.0.5'),(34,'ps_customtext',0,'4.2.2'),(35,'ps_dataprivacy',1,'2.1.1'),(36,'ps_distributionapiclient',1,'2.1.1'),(37,'ps_emailalerts',1,'3.0.1'),(38,'ps_emailsubscription',1,'3.0.1'),(39,'ps_eventbus',1,'4.1.1'),(40,'ps_facebook',1,'1.38.19'),(42,'ps_faviconnotificationbo',1,'2.1.4'),(43,'ps_featuredproducts',1,'3.0.0'),(44,'ps_googleanalytics',1,'6.0.0'),(45,'ps_imageslider',0,'3.2.2'),(46,'ps_languageselector',1,'2.1.3'),(47,'ps_linklist',1,'7.0.1'),(48,'ps_mainmenu',1,'2.3.6'),(49,'ps_mbo',1,'5.3.2'),(50,'ps_mcp_server',1,'1.0.3'),(51,'ps_mcp_tools',1,'1.0.2'),(52,'ps_newproducts',0,'2.0.1'),(53,'ps_onepagecheckout',1,'0.6.7'),(54,'ps_searchbar',1,'2.1.4'),(55,'ps_sharebuttons',1,'2.1.3'),(56,'ps_shoppingcart',1,'3.0.0'),(57,'ps_socialfollow',1,'2.3.3'),(58,'ps_specials',0,'2.0.0'),(59,'ps_supplierlist',1,'1.0.7'),(60,'ps_themecusto',1,'1.2.5'),(61,'ps_viewedproduct',1,'2.0.0'),(62,'ps_wirepayment',1,'3.0.0'),(63,'statsbestcategories',1,'2.1.0'),(64,'statsbestcustomers',1,'2.1.0'),(65,'statsbestmanufacturers',1,'2.0.4'),(66,'statsbestproducts',1,'3.0.0'),(67,'statsbestsuppliers',1,'2.0.3'),(68,'statsbestvouchers',1,'2.1.0'),(69,'statscarrier',1,'2.1.0'),(70,'statscatalog',1,'2.0.5'),(71,'statscheckup',1,'2.0.4'),(72,'statsdata',1,'2.1.2'),(73,'statsforecast',1,'2.1.0'),(74,'statsnewsletter',1,'2.1.0'),(75,'statspersonalinfos',1,'2.1.0'),(76,'statsproduct',1,'2.1.4'),(77,'statsregistrations',1,'2.1.0'),(78,'statssales',1,'2.1.1'),(79,'statssearch',1,'3.0.0'),(80,'statsstock',1,'2.0.2'),(81,'ps_facetedsearch',1,'5.1.0');
/*!40000 ALTER TABLE `ubwbh_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module_access`
--

DROP TABLE IF EXISTS `ubwbh_module_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_authorization_role` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_profile`,`id_authorization_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module_access`
--

LOCK TABLES `ubwbh_module_access` WRITE;
/*!40000 ALTER TABLE `ubwbh_module_access` DISABLE KEYS */;
INSERT INTO `ubwbh_module_access` VALUES (1,481),(1,482),(1,483),(1,484),(1,501),(1,502),(1,503),(1,504),(1,505),(1,506),(1,507),(1,508),(1,509),(1,510),(1,511),(1,512),(1,517),(1,518),(1,519),(1,520),(1,521),(1,522),(1,523),(1,524),(1,525),(1,526),(1,527),(1,528),(1,529),(1,530),(1,531),(1,532),(1,533),(1,534),(1,535),(1,536),(1,537),(1,538),(1,539),(1,540),(1,541),(1,542),(1,543),(1,544),(1,565),(1,566),(1,567),(1,568),(1,585),(1,586),(1,587),(1,588),(1,589),(1,590),(1,591),(1,592),(1,593),(1,594),(1,595),(1,596),(1,605),(1,606),(1,607),(1,608),(1,645),(1,646),(1,647),(1,648),(1,649),(1,650),(1,651),(1,652),(1,653),(1,654),(1,655),(1,656),(1,657),(1,658),(1,659),(1,660),(1,661),(1,662),(1,663),(1,664),(1,665),(1,666),(1,667),(1,668),(1,669),(1,670),(1,671),(1,672),(1,673),(1,674),(1,675),(1,676),(1,677),(1,678),(1,679),(1,680),(1,681),(1,682),(1,683),(1,684),(1,689),(1,690),(1,691),(1,692),(1,701),(1,702),(1,703),(1,704),(1,709),(1,710),(1,711),(1,712),(1,713),(1,714),(1,715),(1,716),(1,717),(1,718),(1,719),(1,720),(1,721),(1,722),(1,723),(1,724),(1,725),(1,726),(1,727),(1,728),(1,729),(1,730),(1,731),(1,732),(1,733),(1,734),(1,735),(1,736),(1,737),(1,738),(1,739),(1,740),(1,749),(1,750),(1,751),(1,752),(1,753),(1,754),(1,755),(1,756),(1,757),(1,758),(1,759),(1,760),(1,769),(1,770),(1,771),(1,772),(1,777),(1,778),(1,779),(1,780),(1,785),(1,786),(1,787),(1,788),(1,789),(1,790),(1,791),(1,792),(1,797),(1,798),(1,799),(1,800),(1,805),(1,806),(1,807),(1,808),(1,809),(1,810),(1,811),(1,812),(1,813),(1,814),(1,815),(1,816),(1,837),(1,838),(1,839),(1,840),(1,841),(1,842),(1,843),(1,844),(1,845),(1,846),(1,847),(1,848),(1,849),(1,850),(1,851),(1,852),(1,853),(1,854),(1,855),(1,856),(1,861),(1,862),(1,863),(1,864),(1,865),(1,866),(1,867),(1,868),(1,869),(1,870),(1,871),(1,872),(1,873),(1,874),(1,875),(1,876),(1,877),(1,878),(1,879),(1,880),(1,881),(1,882),(1,883),(1,884),(1,885),(1,886),(1,887),(1,888),(1,901),(1,902),(1,903),(1,904),(1,905),(1,906),(1,907),(1,908),(1,909),(1,910),(1,911),(1,912),(1,913),(1,914),(1,915),(1,916),(1,917),(1,918),(1,919),(1,920),(1,921),(1,922),(1,923),(1,924),(1,925),(1,926),(1,927),(1,928),(1,929),(1,930),(1,931),(1,932),(1,933),(1,934),(1,935),(1,936),(1,937),(1,938),(1,939),(1,940),(1,941),(1,942),(1,943),(1,944),(1,945),(1,946),(1,947),(1,948),(1,949),(1,950),(1,951),(1,952),(1,953),(1,954),(1,955),(1,956),(1,957),(1,958),(1,959),(1,960),(1,961),(1,962),(1,963),(1,964),(1,965),(1,966),(1,967),(1,968),(1,969),(1,970),(1,971),(1,972),(1,973),(1,974),(1,975),(1,976),(1,977),(1,978),(1,979),(1,980),(1,981),(1,982),(1,983),(1,984);
/*!40000 ALTER TABLE `ubwbh_module_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module_carrier`
--

DROP TABLE IF EXISTS `ubwbh_module_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module_carrier` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_reference` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module_carrier`
--

LOCK TABLES `ubwbh_module_carrier` WRITE;
/*!40000 ALTER TABLE `ubwbh_module_carrier` DISABLE KEYS */;
INSERT INTO `ubwbh_module_carrier` VALUES (23,1,1),(23,1,2),(23,1,3),(23,1,4),(26,1,1),(26,1,2),(26,1,3),(26,1,4),(27,1,1),(27,1,2),(27,1,3),(27,1,4),(62,1,1),(62,1,2),(62,1,3),(62,1,4);
/*!40000 ALTER TABLE `ubwbh_module_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module_country`
--

DROP TABLE IF EXISTS `ubwbh_module_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module_country` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module_country`
--

LOCK TABLES `ubwbh_module_country` WRITE;
/*!40000 ALTER TABLE `ubwbh_module_country` DISABLE KEYS */;
INSERT INTO `ubwbh_module_country` VALUES (23,1,21),(23,1,110),(26,1,1),(26,1,2),(26,1,3),(26,1,4),(26,1,5),(26,1,6),(26,1,7),(26,1,8),(26,1,9),(26,1,10),(26,1,11),(26,1,12),(26,1,13),(26,1,14),(26,1,15),(26,1,16),(26,1,17),(26,1,18),(26,1,19),(26,1,20),(26,1,21),(26,1,22),(26,1,23),(26,1,24),(26,1,25),(26,1,26),(26,1,27),(26,1,28),(26,1,29),(26,1,30),(26,1,31),(26,1,32),(26,1,33),(26,1,34),(26,1,35),(26,1,36),(26,1,37),(26,1,38),(26,1,40),(26,1,41),(26,1,42),(26,1,43),(26,1,44),(26,1,45),(26,1,46),(26,1,47),(26,1,48),(26,1,49),(26,1,51),(26,1,52),(26,1,53),(26,1,54),(26,1,55),(26,1,56),(26,1,57),(26,1,58),(26,1,59),(26,1,60),(26,1,62),(26,1,63),(26,1,64),(26,1,65),(26,1,67),(26,1,68),(26,1,69),(26,1,70),(26,1,71),(26,1,72),(26,1,73),(26,1,74),(26,1,76),(26,1,77),(26,1,78),(26,1,79),(26,1,81),(26,1,82),(26,1,83),(26,1,85),(26,1,86),(26,1,87),(26,1,88),(26,1,89),(26,1,90),(26,1,91),(26,1,92),(26,1,93),(26,1,95),(26,1,96),(26,1,97),(26,1,98),(26,1,100),(26,1,102),(26,1,103),(26,1,104),(26,1,106),(26,1,107),(26,1,108),(26,1,109),(26,1,110),(26,1,114),(26,1,116),(26,1,117),(26,1,118),(26,1,119),(26,1,121),(26,1,122),(26,1,123),(26,1,124),(26,1,126),(26,1,129),(26,1,130),(26,1,132),(26,1,133),(26,1,134),(26,1,135),(26,1,136),(26,1,137),(26,1,138),(26,1,139),(26,1,140),(26,1,141),(26,1,142),(26,1,143),(26,1,144),(26,1,145),(26,1,146),(26,1,147),(26,1,148),(26,1,149),(26,1,150),(26,1,151),(26,1,152),(26,1,153),(26,1,154),(26,1,155),(26,1,156),(26,1,157),(26,1,158),(26,1,159),(26,1,160),(26,1,162),(26,1,164),(26,1,166),(26,1,167),(26,1,168),(26,1,169),(26,1,170),(26,1,171),(26,1,173),(26,1,174),(26,1,175),(26,1,176),(26,1,178),(26,1,179),(26,1,181),(26,1,182),(26,1,183),(26,1,184),(26,1,185),(26,1,186),(26,1,187),(26,1,188),(26,1,189),(26,1,190),(26,1,191),(26,1,192),(26,1,193),(26,1,195),(26,1,197),(26,1,198),(26,1,199),(26,1,201),(26,1,202),(26,1,203),(26,1,204),(26,1,206),(26,1,207),(26,1,208),(26,1,210),(26,1,211),(26,1,212),(26,1,213),(26,1,214),(26,1,215),(26,1,216),(26,1,218),(26,1,219),(26,1,220),(26,1,221),(26,1,223),(26,1,225),(26,1,226),(26,1,227),(26,1,228),(26,1,231),(26,1,233),(26,1,234),(26,1,237),(26,1,238),(26,1,239),(27,1,21),(27,1,110),(62,1,21),(62,1,110);
/*!40000 ALTER TABLE `ubwbh_module_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module_currency`
--

DROP TABLE IF EXISTS `ubwbh_module_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module_currency` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_currency` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_currency`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module_currency`
--

LOCK TABLES `ubwbh_module_currency` WRITE;
/*!40000 ALTER TABLE `ubwbh_module_currency` DISABLE KEYS */;
INSERT INTO `ubwbh_module_currency` VALUES (23,1,1),(27,1,1),(62,1,1);
/*!40000 ALTER TABLE `ubwbh_module_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module_group`
--

DROP TABLE IF EXISTS `ubwbh_module_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module_group` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_group` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module_group`
--

LOCK TABLES `ubwbh_module_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_module_group` DISABLE KEYS */;
INSERT INTO `ubwbh_module_group` VALUES (1,1,1),(1,1,2),(1,1,3),(2,1,1),(2,1,2),(2,1,3),(3,1,1),(3,1,2),(3,1,3),(4,1,1),(4,1,2),(4,1,3),(5,1,1),(5,1,2),(5,1,3),(6,1,1),(6,1,2),(6,1,3),(7,1,1),(7,1,2),(7,1,3),(8,1,1),(8,1,2),(8,1,3),(9,1,1),(9,1,2),(9,1,3),(10,1,1),(10,1,2),(10,1,3),(11,1,1),(11,1,2),(11,1,3),(12,1,1),(12,1,2),(12,1,3),(13,1,1),(13,1,2),(13,1,3),(14,1,1),(14,1,2),(14,1,3),(15,1,1),(15,1,2),(15,1,3),(16,1,1),(16,1,2),(16,1,3),(17,1,1),(17,1,2),(17,1,3),(18,1,1),(18,1,2),(18,1,3),(19,1,1),(19,1,2),(19,1,3),(20,1,1),(20,1,2),(20,1,3),(21,1,1),(21,1,2),(21,1,3),(22,1,1),(22,1,2),(22,1,3),(23,1,1),(23,1,2),(23,1,3),(24,1,1),(24,1,2),(24,1,3),(25,1,1),(25,1,2),(25,1,3),(26,1,1),(26,1,2),(26,1,3),(27,1,1),(27,1,2),(27,1,3),(28,1,1),(28,1,2),(28,1,3),(29,1,1),(29,1,2),(29,1,3),(30,1,1),(30,1,2),(30,1,3),(31,1,1),(31,1,2),(31,1,3),(32,1,1),(32,1,2),(32,1,3),(33,1,1),(33,1,2),(33,1,3),(34,1,1),(34,1,2),(34,1,3),(35,1,1),(35,1,2),(35,1,3),(36,1,1),(36,1,2),(36,1,3),(37,1,1),(37,1,2),(37,1,3),(38,1,1),(38,1,2),(38,1,3),(39,1,1),(39,1,2),(39,1,3),(40,1,1),(40,1,2),(40,1,3),(42,1,1),(42,1,2),(42,1,3),(43,1,1),(43,1,2),(43,1,3),(44,1,1),(44,1,2),(44,1,3),(45,1,1),(45,1,2),(45,1,3),(46,1,1),(46,1,2),(46,1,3),(47,1,1),(47,1,2),(47,1,3),(48,1,1),(48,1,2),(48,1,3),(49,1,1),(49,1,2),(49,1,3),(50,1,1),(50,1,2),(50,1,3),(51,1,1),(51,1,2),(51,1,3),(52,1,1),(52,1,2),(52,1,3),(53,1,1),(53,1,2),(53,1,3),(54,1,1),(54,1,2),(54,1,3),(55,1,1),(55,1,2),(55,1,3),(56,1,1),(56,1,2),(56,1,3),(57,1,1),(57,1,2),(57,1,3),(58,1,1),(58,1,2),(58,1,3),(59,1,1),(59,1,2),(59,1,3),(60,1,1),(60,1,2),(60,1,3),(61,1,1),(61,1,2),(61,1,3),(62,1,1),(62,1,2),(62,1,3),(63,1,1),(63,1,2),(63,1,3),(64,1,1),(64,1,2),(64,1,3),(65,1,1),(65,1,2),(65,1,3),(66,1,1),(66,1,2),(66,1,3),(67,1,1),(67,1,2),(67,1,3),(68,1,1),(68,1,2),(68,1,3),(69,1,1),(69,1,2),(69,1,3),(70,1,1),(70,1,2),(70,1,3),(71,1,1),(71,1,2),(71,1,3),(72,1,1),(72,1,2),(72,1,3),(73,1,1),(73,1,2),(73,1,3),(74,1,1),(74,1,2),(74,1,3),(75,1,1),(75,1,2),(75,1,3),(76,1,1),(76,1,2),(76,1,3),(77,1,1),(77,1,2),(77,1,3),(78,1,1),(78,1,2),(78,1,3),(79,1,1),(79,1,2),(79,1,3),(80,1,1),(80,1,2),(80,1,3),(81,1,1),(81,1,2),(81,1,3);
/*!40000 ALTER TABLE `ubwbh_module_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module_history`
--

DROP TABLE IF EXISTS `ubwbh_module_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module_history`
--

LOCK TABLES `ubwbh_module_history` WRITE;
/*!40000 ALTER TABLE `ubwbh_module_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_module_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module_preference`
--

DROP TABLE IF EXISTS `ubwbh_module_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module_preference` (
  `id_module_preference` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `module` varchar(191) NOT NULL,
  `interest` tinyint(1) DEFAULT NULL,
  `favorite` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_module_preference`),
  UNIQUE KEY `employee_module` (`id_employee`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module_preference`
--

LOCK TABLES `ubwbh_module_preference` WRITE;
/*!40000 ALTER TABLE `ubwbh_module_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_module_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_module_shop`
--

DROP TABLE IF EXISTS `ubwbh_module_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_module_shop` (
  `id_module` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `enable_device` tinyint(1) NOT NULL DEFAULT 7,
  PRIMARY KEY (`id_module`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_module_shop`
--

LOCK TABLES `ubwbh_module_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_module_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_module_shop` VALUES (1,1,7),(2,1,7),(3,1,7),(4,1,7),(5,1,7),(6,1,7),(7,1,7),(8,1,7),(9,1,7),(10,1,7),(11,1,7),(12,1,7),(13,1,7),(14,1,7),(15,1,7),(16,1,7),(17,1,7),(18,1,7),(19,1,7),(20,1,0),(21,1,7),(22,1,7),(23,1,7),(24,1,7),(25,1,7),(26,1,7),(27,1,7),(28,1,7),(29,1,7),(30,1,7),(31,1,7),(32,1,7),(33,1,7),(34,1,0),(35,1,7),(36,1,7),(37,1,7),(38,1,7),(39,1,7),(40,1,7),(42,1,7),(43,1,7),(44,1,7),(46,1,7),(47,1,7),(48,1,7),(49,1,7),(50,1,7),(51,1,7),(52,1,0),(53,1,7),(54,1,7),(55,1,7),(56,1,7),(57,1,7),(58,1,0),(59,1,7),(60,1,7),(61,1,7),(62,1,7),(63,1,7),(64,1,7),(65,1,7),(66,1,7),(67,1,7),(68,1,7),(69,1,7),(70,1,7),(71,1,7),(72,1,7),(73,1,7),(74,1,7),(75,1,7),(76,1,7),(77,1,7),(78,1,7),(79,1,7),(80,1,7),(81,1,7);
/*!40000 ALTER TABLE `ubwbh_module_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_mutation`
--

DROP TABLE IF EXISTS `ubwbh_mutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_mutation` (
  `id_mutation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mutation_table` varchar(255) NOT NULL,
  `mutation_row_id` bigint(20) NOT NULL,
  `mutation_action` enum('create','update','delete') DEFAULT NULL,
  `mutator_type` enum('employee','api_client','module') DEFAULT NULL,
  `mutator_identifier` varchar(255) NOT NULL,
  `mutation_details` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_mutation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_mutation`
--

LOCK TABLES `ubwbh_mutation` WRITE;
/*!40000 ALTER TABLE `ubwbh_mutation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_mutation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_operating_system`
--

DROP TABLE IF EXISTS `ubwbh_operating_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_operating_system` (
  `id_operating_system` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_operating_system`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_operating_system`
--

LOCK TABLES `ubwbh_operating_system` WRITE;
/*!40000 ALTER TABLE `ubwbh_operating_system` DISABLE KEYS */;
INSERT INTO `ubwbh_operating_system` VALUES (1,'Windows XP'),(2,'Windows Vista'),(3,'Windows 7'),(4,'Windows 8'),(5,'Windows 8.1'),(6,'Windows 10'),(7,'MacOsX'),(8,'Linux'),(9,'Android');
/*!40000 ALTER TABLE `ubwbh_operating_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_carrier`
--

DROP TABLE IF EXISTS `ubwbh_order_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_carrier` (
  `id_order_carrier` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) unsigned NOT NULL,
  `id_carrier` int(11) unsigned NOT NULL,
  `id_order_invoice` int(11) unsigned DEFAULT NULL,
  `weight` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_excl` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_incl` decimal(20,6) DEFAULT NULL,
  `tracking_number` varchar(64) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_carrier`),
  KEY `id_order` (`id_order`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_order_invoice` (`id_order_invoice`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_carrier`
--

LOCK TABLES `ubwbh_order_carrier` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_carrier` DISABLE KEYS */;
INSERT INTO `ubwbh_order_carrier` VALUES (1,1,2,0,0.000000,7.000000,8.400000,'','2026-11-23 15:08:51'),(2,2,2,0,0.000000,7.000000,8.400000,'','2026-11-23 15:08:51'),(3,3,2,0,0.000000,7.000000,8.400000,'','2026-11-23 15:08:51'),(4,4,2,0,0.000000,7.000000,8.400000,'','2026-11-23 15:08:51'),(5,5,2,0,0.000000,7.000000,8.400000,'','2026-11-23 15:08:51');
/*!40000 ALTER TABLE `ubwbh_order_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_cart_rule`
--

DROP TABLE IF EXISTS `ubwbh_order_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_cart_rule` (
  `id_order_cart_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_order_invoice` int(10) unsigned DEFAULT 0,
  `name` varchar(254) NOT NULL,
  `value` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `value_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_order_cart_rule`),
  KEY `id_order` (`id_order`),
  KEY `id_cart_rule` (`id_cart_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_cart_rule`
--

LOCK TABLES `ubwbh_order_cart_rule` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_cart_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_detail`
--

DROP TABLE IF EXISTS `ubwbh_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_detail` (
  `id_order_detail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_invoice` int(11) DEFAULT NULL,
  `id_warehouse` int(10) unsigned DEFAULT 0,
  `id_shop` int(11) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_attribute_id` int(10) unsigned DEFAULT NULL,
  `id_customization` int(10) unsigned DEFAULT 0,
  `product_name` mediumtext NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `product_quantity_in_stock` int(10) NOT NULL DEFAULT 0,
  `product_quantity_refunded` int(10) unsigned NOT NULL DEFAULT 0,
  `product_quantity_return` int(10) unsigned NOT NULL DEFAULT 0,
  `product_quantity_reinjected` int(10) unsigned NOT NULL DEFAULT 0,
  `product_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `reduction_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `reduction_amount_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `reduction_amount_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `group_reduction` decimal(5,2) NOT NULL DEFAULT 0.00,
  `product_quantity_discount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `product_ean13` varchar(20) DEFAULT NULL,
  `product_isbn` varchar(32) DEFAULT NULL,
  `product_upc` varchar(12) DEFAULT NULL,
  `product_mpn` varchar(40) DEFAULT NULL,
  `product_reference` varchar(64) DEFAULT NULL,
  `product_supplier_reference` varchar(64) DEFAULT NULL,
  `product_weight` decimal(20,6) NOT NULL,
  `id_tax_rules_group` int(11) unsigned DEFAULT 0,
  `tax_computation_method` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `tax_name` varchar(16) NOT NULL,
  `tax_rate` decimal(10,3) NOT NULL DEFAULT 0.000,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `ecotax_tax_rate` decimal(5,3) NOT NULL DEFAULT 0.000,
  `discount_quantity_applied` tinyint(1) NOT NULL DEFAULT 0,
  `download_hash` varchar(255) DEFAULT NULL,
  `download_nb` int(10) unsigned DEFAULT 0,
  `download_deadline` datetime DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_price_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_price_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_price_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `purchase_supplier_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `original_product_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `original_wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_refunded_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_refunded_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id_order_detail`),
  KEY `order_detail_order` (`id_order`),
  KEY `product_id` (`product_id`,`product_attribute_id`),
  KEY `product_attribute_id` (`product_attribute_id`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_order_id_order_detail` (`id_order`,`id_order_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_detail`
--

LOCK TABLES `ubwbh_order_detail` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_detail` DISABLE KEYS */;
INSERT INTO `ubwbh_order_detail` VALUES (1,1,0,0,1,1,1,0,'Hummingbird printed t-shirt - Color : White, Size : S',1,1,0,0,0,23.900000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','','demo_1','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',23.900000,23.900000,23.900000,23.900000,0.000000,0.000000,0.000000,23.900000,5.490000,0.000000,0.000000),(2,1,0,0,1,2,9,0,'Hummingbird printed sweater - Color : White, Size : S',1,1,0,0,0,35.900000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','','demo_3','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',35.900000,35.900000,35.900000,35.900000,0.000000,0.000000,0.000000,35.900000,5.490000,0.000000,0.000000),(3,2,0,0,1,4,18,0,'The adventure begins Framed poster - Size : 80x120cm',2,3,0,0,0,79.000000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','','demo_5','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',158.000000,158.000000,79.000000,79.000000,0.000000,0.000000,0.000000,79.000000,5.490000,0.000000,0.000000),(4,2,0,0,1,8,0,0,'Mug Today is a good day',1,1,0,0,0,11.900000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','','demo_13','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',11.900000,11.900000,11.900000,11.900000,0.000000,0.000000,0.000000,11.900000,5.490000,0.000000,0.000000),(5,3,0,0,1,16,28,0,'Mountain fox notebook Style : Ruled',1,1,0,0,0,12.900000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','','demo_8','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',12.900000,12.900000,12.900000,12.900000,0.000000,0.000000,0.000000,12.900000,5.490000,0.000000,0.000000),(6,4,0,0,1,16,29,0,'Mountain fox notebook Style : Plain',1,1,0,0,0,12.900000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','','demo_8','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',12.900000,12.900000,12.900000,12.900000,0.000000,0.000000,0.000000,12.900000,5.490000,0.000000,0.000000),(7,5,0,0,1,10,25,0,'Brown bear cushion Color : Black',1,1,0,0,0,18.900000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','','demo_16','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',18.900000,18.900000,18.900000,18.900000,0.000000,0.000000,0.000000,18.900000,5.490000,0.000000,0.000000);
/*!40000 ALTER TABLE `ubwbh_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_detail_tax`
--

DROP TABLE IF EXISTS `ubwbh_order_detail_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_detail_tax` (
  `id_order_detail` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `total_amount` decimal(16,6) NOT NULL DEFAULT 0.000000,
  KEY `id_order_detail` (`id_order_detail`),
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_detail_tax`
--

LOCK TABLES `ubwbh_order_detail_tax` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_detail_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_detail_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_history`
--

DROP TABLE IF EXISTS `ubwbh_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_history` (
  `id_order_history` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_state` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_history`),
  KEY `order_history_order` (`id_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_order_state` (`id_order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_history`
--

LOCK TABLES `ubwbh_order_history` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_history` DISABLE KEYS */;
INSERT INTO `ubwbh_order_history` VALUES (1,0,1,1,'2026-11-23 15:08:51'),(2,0,2,1,'2026-11-23 15:08:51'),(3,0,3,1,'2026-11-23 15:08:51'),(4,0,4,1,'2026-11-23 15:08:51'),(5,0,5,10,'2026-11-23 15:08:51'),(6,1,1,6,'2026-11-23 15:08:51'),(7,1,3,8,'2026-11-23 15:08:51');
/*!40000 ALTER TABLE `ubwbh_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_invoice`
--

DROP TABLE IF EXISTS `ubwbh_order_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_invoice` (
  `id_order_invoice` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `delivery_number` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `total_discount_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_discount_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_products` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_products_wt` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `shipping_tax_computation_method` int(10) unsigned NOT NULL,
  `total_wrapping_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_wrapping_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `shop_address` mediumtext DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_invoice`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_invoice`
--

LOCK TABLES `ubwbh_order_invoice` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_invoice_payment`
--

DROP TABLE IF EXISTS `ubwbh_order_invoice_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_invoice_payment` (
  `id_order_invoice` int(11) unsigned NOT NULL,
  `id_order_payment` int(11) unsigned NOT NULL,
  `id_order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_order_invoice`,`id_order_payment`),
  KEY `order_payment` (`id_order_payment`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_invoice_payment`
--

LOCK TABLES `ubwbh_order_invoice_payment` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_invoice_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_invoice_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_invoice_tax`
--

DROP TABLE IF EXISTS `ubwbh_order_invoice_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_invoice_tax` (
  `id_order_invoice` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `amount` decimal(10,6) NOT NULL DEFAULT 0.000000,
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_invoice_tax`
--

LOCK TABLES `ubwbh_order_invoice_tax` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_invoice_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_invoice_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_message`
--

DROP TABLE IF EXISTS `ubwbh_order_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_message` (
  `id_order_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_message`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_message`
--

LOCK TABLES `ubwbh_order_message` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_message` DISABLE KEYS */;
INSERT INTO `ubwbh_order_message` VALUES (1,'2026-11-23 15:08:51');
/*!40000 ALTER TABLE `ubwbh_order_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_message_lang`
--

DROP TABLE IF EXISTS `ubwbh_order_message_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_message_lang` (
  `id_order_message` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`id_order_message`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_message_lang`
--

LOCK TABLES `ubwbh_order_message_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_message_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_order_message_lang` VALUES (1,1,'Delay','Hi,\n\nUnfortunately, an item on your order is currently out of stock. This may cause a slight delay in delivery.\nPlease accept our apologies and rest assured that we are working hard to rectify this.\n\nBest regards,'),(1,2,'Tundaan','Halo,\n\nMohon maaf, item produk di daftar pembelian Anda saat ini sedang kehabisan stok. Hal ini akan mengakibatkan pengiriman sedikit tertunda.\nBarang kami usahakan akan tersedia secepatnya, mohon maaf atas ketidaknyamanan ini.\n\nHormat kami,');
/*!40000 ALTER TABLE `ubwbh_order_message_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_payment`
--

DROP TABLE IF EXISTS `ubwbh_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_payment` (
  `id_order_payment` int(11) NOT NULL AUTO_INCREMENT,
  `order_reference` varchar(255) DEFAULT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `amount` decimal(20,6) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT 1.000000,
  `transaction_id` varchar(254) DEFAULT NULL,
  `card_number` varchar(254) DEFAULT NULL,
  `card_brand` varchar(254) DEFAULT NULL,
  `card_expiration` char(7) DEFAULT NULL,
  `card_holder` varchar(254) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `id_employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_order_payment`),
  KEY `order_reference` (`order_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_payment`
--

LOCK TABLES `ubwbh_order_payment` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_return`
--

DROP TABLE IF EXISTS `ubwbh_order_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_return` (
  `id_order_return` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `question` mediumtext NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_return`),
  KEY `order_return_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_return`
--

LOCK TABLES `ubwbh_order_return` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_return_detail`
--

DROP TABLE IF EXISTS `ubwbh_order_return_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_return_detail` (
  `id_order_return` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `id_customization` int(10) unsigned NOT NULL DEFAULT 0,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `cancelled` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_order_return`,`id_order_detail`,`id_customization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_return_detail`
--

LOCK TABLES `ubwbh_order_return_detail` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_return_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_return_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_return_state`
--

DROP TABLE IF EXISTS `ubwbh_order_return_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_return_state` (
  `id_order_return_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(32) DEFAULT NULL,
  `is_cancelling_return` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_order_return_state`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_return_state`
--

LOCK TABLES `ubwbh_order_return_state` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_return_state` DISABLE KEYS */;
INSERT INTO `ubwbh_order_return_state` VALUES (1,'#4169E1',0),(2,'#8A2BE2',0),(3,'#32CD32',0),(4,'#DC143C',1),(5,'#108510',0);
/*!40000 ALTER TABLE `ubwbh_order_return_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_return_state_lang`
--

DROP TABLE IF EXISTS `ubwbh_order_return_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_return_state_lang` (
  `id_order_return_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_return_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_return_state_lang`
--

LOCK TABLES `ubwbh_order_return_state_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_return_state_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_order_return_state_lang` VALUES (1,1,'Waiting for confirmation'),(1,2,'Menunggu konfirmasi'),(2,1,'Waiting for package'),(2,2,'Menunggu paket'),(3,1,'Package received'),(3,2,'Paket diterima'),(4,1,'Return denied'),(4,2,'Retur ditolak'),(5,1,'Return completed'),(5,2,'Retur berhasil');
/*!40000 ALTER TABLE `ubwbh_order_return_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_slip`
--

DROP TABLE IF EXISTS `ubwbh_order_slip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_slip` (
  `id_order_slip` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT 1.000000,
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `total_products_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_products_tax_incl` decimal(20,6) DEFAULT NULL,
  `total_shipping_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_shipping_tax_incl` decimal(20,6) DEFAULT NULL,
  `shipping_cost` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `shipping_cost_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `partial` tinyint(1) NOT NULL,
  `order_slip_type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_slip`),
  KEY `order_slip_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_slip`
--

LOCK TABLES `ubwbh_order_slip` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_slip` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_slip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_slip_detail`
--

DROP TABLE IF EXISTS `ubwbh_order_slip_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_slip_detail` (
  `id_order_slip` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `unit_price_tax_excl` decimal(20,6) DEFAULT NULL,
  `unit_price_tax_incl` decimal(20,6) DEFAULT NULL,
  `total_price_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) DEFAULT NULL,
  `amount_tax_excl` decimal(20,6) DEFAULT NULL,
  `amount_tax_incl` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`id_order_slip`,`id_order_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_slip_detail`
--

LOCK TABLES `ubwbh_order_slip_detail` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_slip_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_order_slip_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_state`
--

DROP TABLE IF EXISTS `ubwbh_order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_state` (
  `id_order_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` tinyint(1) unsigned DEFAULT 0,
  `send_email` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `module_name` varchar(255) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `unremovable` tinyint(1) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `logable` tinyint(1) NOT NULL DEFAULT 0,
  `delivery` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `shipped` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `paid` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `pdf_invoice` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `pdf_delivery` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_order_state`),
  KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_state`
--

LOCK TABLES `ubwbh_order_state` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_state` DISABLE KEYS */;
INSERT INTO `ubwbh_order_state` VALUES (1,0,1,'ps_checkpayment','#34209E',1,0,0,0,0,0,0,0,0),(2,1,1,'','#3498D8',1,0,1,0,0,1,1,0,0),(3,1,1,'','#3498D8',1,0,1,1,0,1,0,0,0),(4,1,1,'','#01B887',1,0,1,1,1,1,0,0,0),(5,1,0,'','#01B887',1,0,1,1,1,1,0,0,0),(6,0,1,'','#2C3E50',1,0,0,0,0,0,0,0,0),(7,1,1,'','#01B887',1,0,0,0,0,0,0,0,0),(8,0,1,'','#E74C3C',1,0,0,0,0,0,0,0,0),(9,1,1,'','#3498D8',1,0,0,0,0,1,0,0,0),(10,0,1,'ps_wirepayment','#34209E',1,0,0,0,0,0,0,0,0),(11,1,1,'','#3498D8',1,0,1,0,0,1,0,0,0),(12,0,1,'','#34209E',1,0,0,0,0,0,0,0,0),(13,0,0,'ps_cashondelivery','#34209E',1,0,0,0,0,0,0,0,0),(14,0,0,'ps_checkout','#34209E',1,0,0,0,0,0,0,0,0),(15,0,0,'ps_checkout','#01B887',1,0,0,0,0,0,0,0,0),(16,0,0,'ps_checkout','#3498D8',1,0,0,0,0,0,0,0,0),(17,0,0,'ps_checkout','#3498D8',1,0,0,0,0,0,0,0,0),(18,0,0,'ps_checkout','#DC143C',1,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `ubwbh_order_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_order_state_lang`
--

DROP TABLE IF EXISTS `ubwbh_order_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_order_state_lang` (
  `id_order_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_order_state_lang`
--

LOCK TABLES `ubwbh_order_state_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_order_state_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_order_state_lang` VALUES (1,1,'Awaiting check payment','cheque'),(1,2,'Menunggu pembayaran via cek','cheque'),(2,1,'Payment accepted','payment'),(2,2,'Pembayaran diterima','payment'),(3,1,'Processing in progress','preparation'),(3,2,'Barang tengah disiapkan','preparation'),(4,1,'Shipped','shipped'),(4,2,'Terkirim','shipped'),(5,1,'Delivered',''),(5,2,'Barang telah diterima',''),(6,1,'Canceled','order_canceled'),(6,2,'Dibatalkan','order_canceled'),(7,1,'Refunded','refund'),(7,2,'Dikembalikan','refund'),(8,1,'Payment error','payment_error'),(8,2,'Pembayaran eror','payment_error'),(9,1,'On backorder (paid)','outofstock'),(9,2,'Sedang dipesan','outofstock'),(10,1,'Awaiting bank wire payment','bankwire'),(10,2,'Menunggu pembayaran via transfer bank','bankwire'),(11,1,'Remote payment accepted','payment'),(11,2,'Pembayaran diterima','payment'),(12,1,'On backorder (not paid)','outofstock'),(12,2,'Sedang dipesan','outofstock'),(13,1,'Awaiting Cash On Delivery validation','cashondelivery'),(13,2,'Awaiting cod validation','cashondelivery'),(14,1,'Waiting for payment',''),(14,2,'Waiting for payment',''),(15,1,'Partial refund',''),(15,2,'Pengembalian bertahap',''),(16,1,'Partial payment',''),(16,2,'Partial payment',''),(17,1,'Authorized. To be captured by merchant',''),(17,2,'Authorized. To be captured by merchant',''),(18,1,'Authorization voided',''),(18,2,'Authorization voided','');
/*!40000 ALTER TABLE `ubwbh_order_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_orders`
--

DROP TABLE IF EXISTS `ubwbh_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_orders` (
  `id_order` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) DEFAULT NULL,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT 1,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `current_state` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `payment` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT 1.000000,
  `module` varchar(255) DEFAULT NULL,
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gift` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gift_message` mediumtext DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT 0,
  `total_discounts` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_discounts_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_discounts_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_real` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_products` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_products_wt` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `carrier_tax_rate` decimal(10,3) NOT NULL DEFAULT 0.000,
  `total_wrapping` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_wrapping_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_wrapping_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `round_mode` tinyint(1) NOT NULL DEFAULT 2,
  `round_type` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_number` int(10) unsigned NOT NULL DEFAULT 0,
  `delivery_number` int(10) unsigned NOT NULL DEFAULT 0,
  `invoice_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `valid` int(1) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `note` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `reference` (`reference`),
  KEY `id_customer` (`id_customer`),
  KEY `id_cart` (`id_cart`),
  KEY `invoice_number` (`invoice_number`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `current_state` (`current_state`),
  KEY `id_shop` (`id_shop`),
  KEY `date_add` (`date_add`),
  KEY `invoice_date` (`invoice_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_orders`
--

LOCK TABLES `ubwbh_orders` WRITE;
/*!40000 ALTER TABLE `ubwbh_orders` DISABLE KEYS */;
INSERT INTO `ubwbh_orders` VALUES (1,'XKBKNABJK',1,1,2,1,2,1,1,5,5,6,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Payment by check',1.000000,'ps_checkpayment',0,0,'',0,0.000000,0.000000,0.000000,61.800000,68.200000,66.800000,0.000000,59.800000,59.800000,7.000000,8.400000,7.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2026-11-23 15:08:51','2026-11-23 15:08:51','Test'),(2,'OHSATSERP',1,1,2,1,2,2,1,5,5,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Payment by check',1.000000,'ps_checkpayment',0,0,'',0,0.000000,0.000000,0.000000,169.900000,169.900000,169.900000,0.000000,169.900000,169.900000,0.000000,0.000000,0.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2026-11-23 15:08:51','2026-11-23 15:08:51',''),(3,'UOYEVOLI',1,1,2,1,2,3,1,5,5,8,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Payment by check',1.000000,'ps_checkpayment',0,0,'',0,0.000000,0.000000,0.000000,14.900000,21.300000,19.900000,0.000000,12.900000,12.900000,7.000000,8.400000,7.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2026-11-23 15:08:51','2026-11-23 15:08:51',''),(4,'FFATNOMMJ',1,1,2,1,2,4,1,5,5,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Payment by check',1.000000,'ps_checkpayment',0,0,'',0,0.000000,0.000000,0.000000,14.900000,21.300000,19.900000,0.000000,12.900000,12.900000,7.000000,8.400000,7.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2026-11-23 15:08:51','2026-11-23 15:08:51',''),(5,'KHWLILZLL',1,1,2,1,2,5,1,5,5,10,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Bank wire',1.000000,'ps_wirepayment',0,0,'',0,0.000000,0.000000,0.000000,20.900000,27.300000,25.900000,0.000000,18.900000,18.900000,7.000000,8.400000,7.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2026-11-23 15:08:51','2026-11-23 15:08:51','');
/*!40000 ALTER TABLE `ubwbh_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pack`
--

DROP TABLE IF EXISTS `ubwbh_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pack` (
  `id_product_pack` int(10) unsigned NOT NULL,
  `id_product_item` int(10) unsigned NOT NULL,
  `id_product_attribute_item` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_product_pack`,`id_product_item`,`id_product_attribute_item`),
  KEY `product_item` (`id_product_item`,`id_product_attribute_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pack`
--

LOCK TABLES `ubwbh_pack` WRITE;
/*!40000 ALTER TABLE `ubwbh_pack` DISABLE KEYS */;
INSERT INTO `ubwbh_pack` VALUES (15,5,19,5),(15,7,0,5);
/*!40000 ALTER TABLE `ubwbh_pack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_page`
--

DROP TABLE IF EXISTS `ubwbh_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_page` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_page_type` int(10) unsigned NOT NULL,
  `id_object` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_page`),
  KEY `id_page_type` (`id_page_type`),
  KEY `id_object` (`id_object`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_page`
--

LOCK TABLES `ubwbh_page` WRITE;
/*!40000 ALTER TABLE `ubwbh_page` DISABLE KEYS */;
INSERT INTO `ubwbh_page` VALUES (1,1,NULL),(2,2,NULL);
/*!40000 ALTER TABLE `ubwbh_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_page_type`
--

DROP TABLE IF EXISTS `ubwbh_page_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_page_type` (
  `id_page_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_type`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_page_type`
--

LOCK TABLES `ubwbh_page_type` WRITE;
/*!40000 ALTER TABLE `ubwbh_page_type` DISABLE KEYS */;
INSERT INTO `ubwbh_page_type` VALUES (2,'index'),(1,'pagenotfound');
/*!40000 ALTER TABLE `ubwbh_page_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_page_viewed`
--

DROP TABLE IF EXISTS `ubwbh_page_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_page_viewed` (
  `id_page` int(10) unsigned NOT NULL,
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT 1,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  `id_date_range` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_page`,`id_date_range`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_page_viewed`
--

LOCK TABLES `ubwbh_page_viewed` WRITE;
/*!40000 ALTER TABLE `ubwbh_page_viewed` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_page_viewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pagenotfound`
--

DROP TABLE IF EXISTS `ubwbh_pagenotfound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pagenotfound` (
  `id_pagenotfound` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT 1,
  `request_uri` varchar(256) NOT NULL,
  `http_referer` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_pagenotfound`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pagenotfound`
--

LOCK TABLES `ubwbh_pagenotfound` WRITE;
/*!40000 ALTER TABLE `ubwbh_pagenotfound` DISABLE KEYS */;
INSERT INTO `ubwbh_pagenotfound` VALUES (1,1,1,'/bloowing_flower/install/theme/img/info.svg','http://localhost/bloowing_flower/install/theme/view.css?version=9.2.1','2026-11-23 15:14:12');
/*!40000 ALTER TABLE `ubwbh_pagenotfound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product`
--

DROP TABLE IF EXISTS `ubwbh_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product` (
  `id_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned DEFAULT NULL,
  `id_manufacturer` int(10) unsigned DEFAULT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT 1,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ean13` varchar(20) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `mpn` varchar(40) DEFAULT NULL,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `quantity` int(10) NOT NULL DEFAULT 0,
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `low_stock_threshold` int(10) DEFAULT NULL,
  `low_stock_alert` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unity` varchar(255) DEFAULT NULL,
  `unit_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `additional_shipping_cost` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `reference` varchar(64) DEFAULT NULL,
  `supplier_reference` varchar(64) DEFAULT NULL,
  `location` varchar(255) NOT NULL DEFAULT '',
  `width` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `height` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `depth` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `weight` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `out_of_stock` int(10) unsigned NOT NULL DEFAULT 2,
  `additional_delivery_times` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `quantity_discount` tinyint(1) DEFAULT 0,
  `customizable` tinyint(2) NOT NULL DEFAULT 0,
  `uploadable_files` tinyint(4) NOT NULL DEFAULT 0,
  `text_fields` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `redirect_type` enum('404','410','301-product','302-product','301-category','302-category','200-displayed','404-displayed','410-displayed','default') NOT NULL DEFAULT 'default',
  `id_type_redirected` int(10) unsigned NOT NULL DEFAULT 0,
  `available_for_order` tinyint(1) NOT NULL DEFAULT 1,
  `available_date` date DEFAULT NULL,
  `show_condition` tinyint(1) NOT NULL DEFAULT 0,
  `condition` enum('new','used','refurbished','open_box','damaged','new_with_defects') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT 1,
  `indexed` tinyint(1) NOT NULL DEFAULT 0,
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_is_pack` tinyint(1) NOT NULL DEFAULT 0,
  `cache_has_attachments` tinyint(1) NOT NULL DEFAULT 0,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0,
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT 0,
  `pack_stock_type` int(11) unsigned NOT NULL DEFAULT 3,
  `state` int(11) unsigned NOT NULL DEFAULT 1,
  `product_type` enum('standard','pack','virtual','combinations','') NOT NULL DEFAULT '',
  PRIMARY KEY (`id_product`),
  KEY `reference_idx` (`reference`),
  KEY `supplier_reference_idx` (`supplier_reference`),
  KEY `product_supplier` (`id_supplier`),
  KEY `product_manufacturer` (`id_manufacturer`,`id_product`),
  KEY `id_category_default` (`id_category_default`),
  KEY `indexed` (`indexed`),
  KEY `date_add` (`date_add`),
  KEY `state` (`state`,`date_upd`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product`
--

LOCK TABLES `ubwbh_product` WRITE;
/*!40000 ALTER TABLE `ubwbh_product` DISABLE KEYS */;
INSERT INTO `ubwbh_product` VALUES (1,1,1,4,1,1,0,0,'','','','',0.000000,0,1,0,0,150000.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_1','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,1,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(2,1,1,5,1,1,0,0,'','','','',0.000000,0,1,0,0,120000.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_3','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,9,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(3,1,2,9,1,1,0,0,'','','','',0.000000,0,1,0,0,175000.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_6','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,13,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(4,1,2,9,1,1,0,0,'','','','',0.000000,0,1,0,0,100000.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_5','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,16,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(5,1,2,9,1,1,0,0,'','','','',0.000000,0,1,0,0,29.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_7','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,19,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(6,2,1,8,1,1,0,0,'','','','',0.000000,0,1,0,0,11.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_11','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'standard'),(7,2,1,8,1,1,0,0,'','','','',0.000000,0,1,0,0,11.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_12','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'standard'),(8,2,1,8,1,1,0,0,'','','','',0.000000,0,1,0,0,11.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_13','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'standard'),(9,2,1,8,1,1,0,0,'','','','',0.000000,0,1,0,0,18.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_15','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,22,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(10,2,1,8,1,1,0,0,'','','','',0.000000,0,1,0,0,18.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_16','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,24,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(11,2,1,8,1,1,0,0,'','','','',0.000000,0,1,0,0,18.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_17','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,26,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(12,2,2,9,1,1,0,0,'','','','',0.000000,0,1,0,0,9.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_18','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,1,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'virtual'),(13,2,2,9,1,1,0,0,'','','','',0.000000,0,1,0,0,9.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_19','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,1,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'virtual'),(14,2,2,9,1,1,0,0,'','','','',0.000000,0,1,0,0,9.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_20','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,1,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'virtual'),(15,2,0,8,1,1,0,0,'','','','',0.000000,0,1,0,0,35.000000,5.490000,'',0.000000,0.000000,0.000000,'demo_21','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',1,0,0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'pack'),(16,2,2,7,1,1,0,0,'','','','',0.000000,0,1,0,0,12.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_8','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,28,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(17,2,2,7,1,1,0,0,'','','','',0.000000,0,1,0,0,12.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_9','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,32,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(18,2,2,7,1,1,0,0,'','','','',0.000000,0,1,0,0,12.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_10','','',0.000000,0.000000,0.000000,0.300000,2,1,0,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,36,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'combinations'),(19,2,1,8,1,1,0,0,'','','','',0.000000,0,1,0,0,13.900000,5.490000,'',0.000000,0.000000,0.000000,'demo_14','','',0.000000,0.000000,0.000000,0.300000,2,1,0,2,0,1,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',0,3,1,'standard');
/*!40000 ALTER TABLE `ubwbh_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_attachment`
--

DROP TABLE IF EXISTS `ubwbh_product_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_attachment` (
  `id_product` int(10) unsigned NOT NULL,
  `id_attachment` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_attachment`
--

LOCK TABLES `ubwbh_product_attachment` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_attribute`
--

DROP TABLE IF EXISTS `ubwbh_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_attribute` (
  `id_product_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `reference` varchar(64) DEFAULT NULL,
  `supplier_reference` varchar(64) DEFAULT NULL,
  `ean13` varchar(20) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `mpn` varchar(40) DEFAULT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `weight` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_impact` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `default_on` tinyint(1) unsigned DEFAULT NULL,
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `low_stock_threshold` int(10) DEFAULT NULL,
  `low_stock_alert` tinyint(1) NOT NULL DEFAULT 0,
  `available_date` date DEFAULT NULL,
  PRIMARY KEY (`id_product_attribute`),
  UNIQUE KEY `product_default` (`id_product`,`default_on`),
  KEY `product_attribute_product` (`id_product`),
  KEY `reference` (`reference`),
  KEY `supplier_reference` (`supplier_reference`),
  KEY `id_product_id_product_attribute` (`id_product_attribute`,`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_attribute`
--

LOCK TABLES `ubwbh_product_attribute` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_attribute` DISABLE KEYS */;
INSERT INTO `ubwbh_product_attribute` VALUES (1,1,'demo_1','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(2,1,'demo_1','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(3,1,'demo_1','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(4,1,'demo_1','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(5,1,'demo_1','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(6,1,'demo_1','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(7,1,'demo_1','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(8,1,'demo_1','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(9,2,'demo_3','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(10,2,'demo_3','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(11,2,'demo_3','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(12,2,'demo_3','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(13,3,'demo_6','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(14,3,'demo_6','','','','','',0.000000,20.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(15,3,'demo_6','','','','','',0.000000,50.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(16,4,'demo_5','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(17,4,'demo_5','','','','','',0.000000,20.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(18,4,'demo_5','','','','','',0.000000,50.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(19,5,'demo_7','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(20,5,'demo_7','','','','','',0.000000,20.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(21,5,'demo_7','','','','','',0.000000,50.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(22,9,'demo_15','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(23,9,'demo_15','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(24,10,'demo_16','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(25,10,'demo_16','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(26,11,'demo_17','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(27,11,'demo_17','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(28,16,'demo_8','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(29,16,'demo_8','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(30,16,'demo_8','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(31,16,'demo_8','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(32,17,'demo_9','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(33,17,'demo_9','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(34,17,'demo_9','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(35,17,'demo_9','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(36,18,'demo_10','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(37,18,'demo_10','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(38,18,'demo_10','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(39,18,'demo_10','','','','','',0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00');
/*!40000 ALTER TABLE `ubwbh_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_attribute_combination`
--

DROP TABLE IF EXISTS `ubwbh_product_attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_attribute_combination` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_attribute_combination`
--

LOCK TABLES `ubwbh_product_attribute_combination` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_attribute_combination` DISABLE KEYS */;
INSERT INTO `ubwbh_product_attribute_combination` VALUES (1,1),(1,2),(1,9),(2,3),(2,4),(2,10),(3,5),(3,6),(3,11),(4,7),(4,8),(4,12),(8,1),(8,3),(8,5),(8,7),(8,22),(8,24),(8,26),(11,2),(11,4),(11,6),(11,8),(11,23),(11,25),(11,27),(19,13),(19,16),(19,19),(20,14),(20,17),(20,20),(21,15),(21,18),(21,21),(22,28),(22,32),(22,36),(23,29),(23,33),(23,37),(24,30),(24,34),(24,38),(25,31),(25,35),(25,39);
/*!40000 ALTER TABLE `ubwbh_product_attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_attribute_image`
--

DROP TABLE IF EXISTS `ubwbh_product_attribute_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_attribute_image` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_image` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_image`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_attribute_image`
--

LOCK TABLES `ubwbh_product_attribute_image` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_attribute_image` DISABLE KEYS */;
INSERT INTO `ubwbh_product_attribute_image` VALUES (1,2),(2,1),(3,2),(4,1),(5,2),(6,1),(7,2),(8,1),(9,21),(10,21),(11,21),(12,21),(13,3),(14,3),(15,3),(16,4),(17,4),(18,4),(19,5),(20,5),(21,5),(22,10),(23,9),(24,12),(25,11),(26,14),(27,13),(28,18),(29,18),(30,18),(31,18),(32,19),(33,19),(34,19),(35,19),(36,20),(37,20),(38,20),(39,20);
/*!40000 ALTER TABLE `ubwbh_product_attribute_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_attribute_lang`
--

DROP TABLE IF EXISTS `ubwbh_product_attribute_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_attribute_lang` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_attribute_lang`
--

LOCK TABLES `ubwbh_product_attribute_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_attribute_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_product_attribute_lang` VALUES (1,1,'',''),(1,2,'',''),(2,1,'',''),(2,2,'',''),(3,1,'',''),(3,2,'',''),(4,1,'',''),(4,2,'',''),(5,1,'',''),(5,2,'',''),(6,1,'',''),(6,2,'',''),(7,1,'',''),(7,2,'',''),(8,1,'',''),(8,2,'',''),(9,1,'',''),(9,2,'',''),(10,1,'',''),(10,2,'',''),(11,1,'',''),(11,2,'',''),(12,1,'',''),(12,2,'',''),(13,1,'',''),(13,2,'',''),(14,1,'',''),(14,2,'',''),(15,1,'',''),(15,2,'',''),(16,1,'',''),(16,2,'',''),(17,1,'',''),(17,2,'',''),(18,1,'',''),(18,2,'',''),(19,1,'',''),(19,2,'',''),(20,1,'',''),(20,2,'',''),(21,1,'',''),(21,2,'',''),(22,1,'',''),(22,2,'',''),(23,1,'',''),(23,2,'',''),(24,1,'',''),(24,2,'',''),(25,1,'',''),(25,2,'',''),(26,1,'',''),(26,2,'',''),(27,1,'',''),(27,2,'',''),(28,1,'',''),(28,2,'',''),(29,1,'',''),(29,2,'',''),(30,1,'',''),(30,2,'',''),(31,1,'',''),(31,2,'',''),(32,1,'',''),(32,2,'',''),(33,1,'',''),(33,2,'',''),(34,1,'',''),(34,2,'',''),(35,1,'',''),(35,2,'',''),(36,1,'',''),(36,2,'',''),(37,1,'',''),(37,2,'',''),(38,1,'',''),(38,2,'',''),(39,1,'',''),(39,2,'','');
/*!40000 ALTER TABLE `ubwbh_product_attribute_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_attribute_shop`
--

DROP TABLE IF EXISTS `ubwbh_product_attribute_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_attribute_shop` (
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `weight` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_impact` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `default_on` tinyint(1) unsigned DEFAULT NULL,
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `low_stock_threshold` int(10) DEFAULT NULL,
  `low_stock_alert` tinyint(1) NOT NULL DEFAULT 0,
  `available_date` date DEFAULT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_shop`),
  UNIQUE KEY `id_product` (`id_product`,`id_shop`,`default_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_attribute_shop`
--

LOCK TABLES `ubwbh_product_attribute_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_attribute_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_product_attribute_shop` VALUES (1,1,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(1,2,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(1,3,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(1,4,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(1,5,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(1,6,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(1,7,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(1,8,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(2,9,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(2,10,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(2,11,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(2,12,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(3,13,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(3,14,1,0.000000,20.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(3,15,1,0.000000,50.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(4,16,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(4,17,1,0.000000,20.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(4,18,1,0.000000,50.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(5,19,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(5,20,1,0.000000,20.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(5,21,1,0.000000,50.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(9,22,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(9,23,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(10,24,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(10,25,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(11,26,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(11,27,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(16,28,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(16,29,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(16,30,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(16,31,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(17,32,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(17,33,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(17,34,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(17,35,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(18,36,1,0.000000,0.000000,0.000000,0.000000,0.000000,1,1,0,0,'0000-00-00'),(18,37,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(18,38,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00'),(18,39,1,0.000000,0.000000,0.000000,0.000000,0.000000,NULL,1,0,0,'0000-00-00');
/*!40000 ALTER TABLE `ubwbh_product_attribute_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_carrier`
--

DROP TABLE IF EXISTS `ubwbh_product_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_carrier` (
  `id_product` int(10) unsigned NOT NULL,
  `id_carrier_reference` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_carrier_reference`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_carrier`
--

LOCK TABLES `ubwbh_product_carrier` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_comment`
--

DROP TABLE IF EXISTS `ubwbh_product_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_comment` (
  `id_product_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `content` text NOT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `grade` float unsigned NOT NULL,
  `validate` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_product_comment`),
  KEY `id_product` (`id_product`),
  KEY `id_customer` (`id_customer`),
  KEY `id_guest` (`id_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_comment`
--

LOCK TABLES `ubwbh_product_comment` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_comment_criterion`
--

DROP TABLE IF EXISTS `ubwbh_product_comment_criterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_comment_criterion` (
  `id_product_comment_criterion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_comment_criterion_type` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_comment_criterion`
--

LOCK TABLES `ubwbh_product_comment_criterion` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_comment_criterion` DISABLE KEYS */;
INSERT INTO `ubwbh_product_comment_criterion` VALUES (1,1,1);
/*!40000 ALTER TABLE `ubwbh_product_comment_criterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_comment_criterion_category`
--

DROP TABLE IF EXISTS `ubwbh_product_comment_criterion_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_comment_criterion_category` (
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`,`id_category`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_comment_criterion_category`
--

LOCK TABLES `ubwbh_product_comment_criterion_category` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_comment_criterion_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_comment_criterion_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_comment_criterion_lang`
--

DROP TABLE IF EXISTS `ubwbh_product_comment_criterion_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_comment_criterion_lang` (
  `id_product_comment_criterion` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_comment_criterion_lang`
--

LOCK TABLES `ubwbh_product_comment_criterion_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_comment_criterion_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_product_comment_criterion_lang` VALUES (1,1,'Quality'),(1,2,'Quality');
/*!40000 ALTER TABLE `ubwbh_product_comment_criterion_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_comment_criterion_product`
--

DROP TABLE IF EXISTS `ubwbh_product_comment_criterion_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_comment_criterion_product` (
  `id_product` int(10) unsigned NOT NULL,
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_product_comment_criterion`),
  KEY `id_product_comment_criterion` (`id_product_comment_criterion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_comment_criterion_product`
--

LOCK TABLES `ubwbh_product_comment_criterion_product` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_comment_criterion_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_comment_criterion_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_comment_grade`
--

DROP TABLE IF EXISTS `ubwbh_product_comment_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_comment_grade` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  `grade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_product_comment_criterion`),
  KEY `id_product_comment_criterion` (`id_product_comment_criterion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_comment_grade`
--

LOCK TABLES `ubwbh_product_comment_grade` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_comment_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_comment_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_comment_report`
--

DROP TABLE IF EXISTS `ubwbh_product_comment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_comment_report` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_comment_report`
--

LOCK TABLES `ubwbh_product_comment_report` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_comment_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_comment_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_comment_usefulness`
--

DROP TABLE IF EXISTS `ubwbh_product_comment_usefulness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_comment_usefulness` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `usefulness` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_comment_usefulness`
--

LOCK TABLES `ubwbh_product_comment_usefulness` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_comment_usefulness` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_comment_usefulness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_country_tax`
--

DROP TABLE IF EXISTS `ubwbh_product_country_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_country_tax` (
  `id_product` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_country_tax`
--

LOCK TABLES `ubwbh_product_country_tax` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_country_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_country_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_download`
--

DROP TABLE IF EXISTS `ubwbh_product_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_download` (
  `id_product_download` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `display_filename` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `nb_days_accessible` int(10) unsigned DEFAULT NULL,
  `nb_downloadable` int(10) unsigned DEFAULT 1,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `is_shareable` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_product_download`),
  UNIQUE KEY `id_product` (`id_product`),
  KEY `product_active` (`id_product`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_download`
--

LOCK TABLES `ubwbh_product_download` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_group_reduction_cache`
--

DROP TABLE IF EXISTS `ubwbh_product_group_reduction_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_group_reduction_cache` (
  `id_product` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `reduction` decimal(5,4) NOT NULL,
  PRIMARY KEY (`id_product`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_group_reduction_cache`
--

LOCK TABLES `ubwbh_product_group_reduction_cache` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_group_reduction_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_group_reduction_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_lang`
--

DROP TABLE IF EXISTS `ubwbh_product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_lang` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_lang` int(10) unsigned NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `description_short` mediumtext DEFAULT NULL,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  `delivery_in_stock` varchar(255) DEFAULT NULL,
  `delivery_out_stock` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_shop`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_lang`
--

LOCK TABLES `ubwbh_product_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_product_lang` VALUES (1,1,1,'<p>Symbol of lightness and delicacy, the hummingbird evokes curiosity and joy. Studio Design\' PolyFaune collection features classic products with colorful patterns, inspired by the traditional japanese origamis. To wear with a chino or jeans. The sublimation textile printing process provides an exceptional color rendering and a color, guaranteed overtime.</p>','Rangkaian buket bunga mawar segar pilihan.','buket-mawar','','','Buket Mawar','','','',''),(1,1,2,'<p>Symbol of lightness and delicacy, the hummingbird evokes curiosity and joy. Studio Design\' PolyFaune collection features classic products with colorful patterns, inspired by the traditional japanese origamis. To wear with a chino or jeans. The sublimation textile printing process provides an exceptional color rendering and a color, guaranteed overtime.</p>','Rangkaian buket bunga mawar segar pilihan.','buket-mawar','','','Buket Mawar','','','',''),(2,1,1,'<p>Studio Design\' PolyFaune collection features classic products with colorful patterns, inspired by the traditional japanese origamis. To wear with a chino or jeans. The sublimation textile printing process provides an exceptional color rendering and a color, guaranteed overtime.</p>','Buket bunga matahari cerah untuk momen bahagia.','buket-sunflower','','','Buket Sunflower','','','',''),(2,1,2,'<p>Studio Design\' PolyFaune collection features classic products with colorful patterns, inspired by the traditional japanese origamis. To wear with a chino or jeans. The sublimation textile printing process provides an exceptional color rendering and a color, guaranteed overtime.</p>','Buket bunga matahari cerah untuk momen bahagia.','buket-sunflower','','','Buket Sunflower','','','',''),(3,1,1,'<p>The best is yet to come! Give your walls a voice with a framed poster. This aesthethic, optimistic poster will look great in your desk or in an open-space office. Painted wooden frame with passe-partout for more depth.</p>','Perpaduan beragam bunga cantik penuh warna.','buket-mix-flower','','','Buket Mix Flower','','','',''),(3,1,2,'<p>The best is yet to come! Give your walls a voice with a framed poster. This aesthethic, optimistic poster will look great in your desk or in an open-space office. Painted wooden frame with passe-partout for more depth.</p>','Perpaduan beragam bunga cantik penuh warna.','buket-mix-flower','','','Buket Mix Flower','','','',''),(4,1,1,'<p>The best is yet to come! Give your walls a voice with a framed poster. This aesthethic, optimistic poster will look great in your desk or in an open-space office. Painted wooden frame with passe-partout for more depth.</p>','Buket baby breath lembut dengan tampilan elegan.','buket-baby-breath','','','Buket Baby Breath','','','',''),(4,1,2,'<p>The best is yet to come! Give your walls a voice with a framed poster. This aesthethic, optimistic poster will look great in your desk or in an open-space office. Painted wooden frame with passe-partout for more depth.</p>','Buket baby breath lembut dengan tampilan elegan.','buket-baby-breath','','','Buket Baby Breath','','','',''),(5,1,1,'<p>The best is yet to come! Give your walls a voice with a framed poster. This aesthethic, optimistic poster will look great in your desk or in an open-space office. Painted wooden frame with passe-partout for more depth.</p>','<p>Printed on rigid paper with matt finish and smooth surface.</p>','today-is-a-good-day-framed-poster','','','Today is a good day Framed poster','','','',''),(5,1,2,'<p>The best is yet to come! Give your walls a voice with a framed poster. This aesthethic, optimistic poster will look great in your desk or in an open-space office. Painted wooden frame with passe-partout for more depth.</p>','<p>Printed on rigid paper with matt finish and smooth surface.</p>','today-is-a-good-day-framed-poster','','','Today is a good day Framed poster','','','',''),(6,1,1,'<p>The best is yet to come! Start the day off right with a positive thought. 8,2cm diameter / 9,5cm height / 0.43kg. Dishwasher-proof.</p>','<p>White Ceramic Mug, 325ml.</p>','mug-the-best-is-yet-to-come','','','Mug The best is yet to come','','','',''),(6,1,2,'<p>The best is yet to come! Start the day off right with a positive thought. 8,2cm diameter / 9,5cm height / 0.43kg. Dishwasher-proof.</p>','<p>White Ceramic Mug, 325ml.</p>','mug-the-best-is-yet-to-come','','','Mug The best is yet to come','','','',''),(7,1,1,'<p>The adventure begins with a cup of coffee. Set out to conquer the day! 8,2cm diameter / 9,5cm height / 0.43kg. Dishwasher-proof.</p>','<p>White Ceramic Mug. 325ml</p>','mug-the-adventure-begins','','','Mug The adventure begins','','','',''),(7,1,2,'<p>The adventure begins with a cup of coffee. Set out to conquer the day! 8,2cm diameter / 9,5cm height / 0.43kg. Dishwasher-proof.</p>','<p>White Ceramic Mug. 325ml</p>','mug-the-adventure-begins','','','Mug The adventure begins','','','',''),(8,1,1,'<p>Add an optimistic touch to your morning coffee and start the day in a good mood! 8,2cm diameter / 9,5cm height / 0.43kg. Dishwasher-proof.</p>','<p>White Ceramic Mug. 325ml</p>','mug-today-is-a-good-day','','','Mug Today is a good day','','','',''),(8,1,2,'<p>Add an optimistic touch to your morning coffee and start the day in a good mood! 8,2cm diameter / 9,5cm height / 0.43kg. Dishwasher-proof.</p>','<p>White Ceramic Mug. 325ml</p>','mug-today-is-a-good-day','','','Mug Today is a good day','','','',''),(9,1,1,'<p>The mountain fox cushion will add a graphic and colorful touch to your sofa, armchair or bed. Create a modern and zen atmosphere that inspires relaxation. Cover 100% cotton, machine washable at 60° / Filling 100% hypoallergenic polyester.</p>','<p>Cushion with removable cover and invisible zip on the back. 32x32cm</p>','mountain-fox-cushion','','','Mountain fox cushion','','','',''),(9,1,2,'<p>The mountain fox cushion will add a graphic and colorful touch to your sofa, armchair or bed. Create a modern and zen atmosphere that inspires relaxation. Cover 100% cotton, machine washable at 60° / Filling 100% hypoallergenic polyester.</p>','<p>Cushion with removable cover and invisible zip on the back. 32x32cm</p>','mountain-fox-cushion','','','Mountain fox cushion','','','',''),(10,1,1,'<p>The brown bear cushion will add a graphic and colorful touch to your sofa, armchair or bed. Create a modern and zen atmosphere that inspires relaxation. Cover 100% cotton, machine washable at 60° / Filling 100% hypoallergenic polyester.</p>','<p>Cushion with removable cover and invisible zip on the back. 32x32cm</p>','brown-bear-cushion','','','Brown bear cushion','','','',''),(10,1,2,'<p>The brown bear cushion will add a graphic and colorful touch to your sofa, armchair or bed. Create a modern and zen atmosphere that inspires relaxation. Cover 100% cotton, machine washable at 60° / Filling 100% hypoallergenic polyester.</p>','<p>Cushion with removable cover and invisible zip on the back. 32x32cm</p>','brown-bear-cushion','','','Brown bear cushion','','','',''),(11,1,1,'<p>The hummingbird cushion will add a graphic and colorful touch to your sofa, armchair or bed. Create a modern and zen atmosphere that inspires relaxation. Cover 100% cotton, machine washable at 60° / Filling 100% hypoallergenic polyester.</p>','<p>Cushion with removable cover and invisible zip on the back. 32x32cm</p>','hummingbird-cushion','','','Hummingbird cushion','','','',''),(11,1,2,'<p>The hummingbird cushion will add a graphic and colorful touch to your sofa, armchair or bed. Create a modern and zen atmosphere that inspires relaxation. Cover 100% cotton, machine washable at 60° / Filling 100% hypoallergenic polyester.</p>','<p>Cushion with removable cover and invisible zip on the back. 32x32cm</p>','hummingbird-cushion','','','Hummingbird cushion','','','',''),(12,1,1,'<p>You have a custom printing creative project? The vector graphic Mountain fox illustration can be used for printing purpose on any support, without size limitation. </p>','<p>Vector graphic, format: svg. Download for personal, private and non-commercial use.</p>','mountain-fox-vector-graphics','','','Mountain fox - Vector graphics','','','',''),(12,1,2,'<p>You have a custom printing creative project? The vector graphic Mountain fox illustration can be used for printing purpose on any support, without size limitation. </p>','<p>Vector graphic, format: svg. Download for personal, private and non-commercial use.</p>','mountain-fox-vector-graphics','','','Mountain fox - Vector graphics','','','',''),(13,1,1,'<p>You have a custom printing creative project? The vector graphic Mountain fox illustration can be used for printing purpose on any support, without size limitation. </p>','<p>Vector graphic, format: svg. Download for personal, private and non-commercial use.</p>','brown-bear-vector-graphics','','','Brown bear - Vector graphics','','','',''),(13,1,2,'<p>You have a custom printing creative project? The vector graphic Mountain fox illustration can be used for printing purpose on any support, without size limitation. </p>','<p>Vector graphic, format: svg. Download for personal, private and non-commercial use.</p>','brown-bear-vector-graphics','','','Brown bear - Vector graphics','','','',''),(14,1,1,'<p>You have a custom printing creative project? The vector graphic Mountain fox illustration can be used for printing purpose on any support, without size limitation. </p>','<p>Vector graphic, format: svg. Download for personal, private and non-commercial use.</p>','hummingbird-vector-graphics','','','Hummingbird - Vector graphics','','','',''),(14,1,2,'<p>You have a custom printing creative project? The vector graphic Mountain fox illustration can be used for printing purpose on any support, without size limitation. </p>','<p>Vector graphic, format: svg. Download for personal, private and non-commercial use.</p>','hummingbird-vector-graphics','','','Hummingbird - Vector graphics','','','',''),(15,1,1,'','<p>Mug The Adventure Begins + Framed poster Today is a good day 40x60cm </p>','pack-mug-framed-poster','','','Pack Mug + Framed poster','','','',''),(15,1,2,'','<p>Mug The Adventure Begins + Framed poster Today is a good day 40x60cm </p>','pack-mug-framed-poster','','','Pack Mug + Framed poster','','','',''),(16,1,1,'<p>The Mountain fox notebook is the best option to write down your most ingenious ideas. At work, at home or when traveling, its endearing design and manufacturing quality will make you feel like writing! 90 gsm paper / double spiral binding.</p>','<p>120 sheets notebook with hard cover made of recycled cardboard. 16x22cm</p>','mountain-fox-notebook','','','Mountain fox notebook','','','',''),(16,1,2,'<p>The Mountain fox notebook is the best option to write down your most ingenious ideas. At work, at home or when traveling, its endearing design and manufacturing quality will make you feel like writing! 90 gsm paper / double spiral binding.</p>','<p>120 sheets notebook with hard cover made of recycled cardboard. 16x22cm</p>','mountain-fox-notebook','','','Mountain fox notebook','','','',''),(17,1,1,'<p>The Mountain fox notebook is the best option to write down your most ingenious ideas. At work, at home or when traveling, its endearing design and manufacturing quality will make you feel like writing! 90 gsm paper / double spiral binding.</p>','<p>120 sheets notebook with hard cover made of recycled cardboard. 16x22cm</p>','brown-bear-notebook','','','Brown bear notebook','','','',''),(17,1,2,'<p>The Mountain fox notebook is the best option to write down your most ingenious ideas. At work, at home or when traveling, its endearing design and manufacturing quality will make you feel like writing! 90 gsm paper / double spiral binding.</p>','<p>120 sheets notebook with hard cover made of recycled cardboard. 16x22cm</p>','brown-bear-notebook','','','Brown bear notebook','','','',''),(18,1,1,'<p>The Mountain fox notebook is the best option to write down your most ingenious ideas. At work, at home or when traveling, its endearing design and manufacturing quality will make you feel like writing! 90 gsm paper / double spiral binding.</p>','<p>120 sheets notebook with hard cover made of recycled cardboard. 16x22cm</p>','hummingbird-notebook','','','Hummingbird notebook','','','',''),(18,1,2,'<p>The Mountain fox notebook is the best option to write down your most ingenious ideas. At work, at home or when traveling, its endearing design and manufacturing quality will make you feel like writing! 90 gsm paper / double spiral binding.</p>','<p>120 sheets notebook with hard cover made of recycled cardboard. 16x22cm</p>','hummingbird-notebook','','','Hummingbird notebook','','','',''),(19,1,1,'<p>Customize your mug with the text of your choice. A mood, a message, a quote... It\'s up to you! Maximum number of characters: ---</p>','<p>White Ceramic Mug. 325ml</p>','customizable-mug','','','Customizable mug','','','',''),(19,1,2,'<p>Customize your mug with the text of your choice. A mood, a message, a quote... It\'s up to you! Maximum number of characters: ---</p>','<p>White Ceramic Mug. 325ml</p>','customizable-mug','','','Customizable mug','','','','');
/*!40000 ALTER TABLE `ubwbh_product_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_sale`
--

DROP TABLE IF EXISTS `ubwbh_product_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_sale` (
  `id_product` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `sale_nbr` int(10) unsigned NOT NULL DEFAULT 0,
  `date_upd` date DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `quantity` (`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_sale`
--

LOCK TABLES `ubwbh_product_sale` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_shop`
--

DROP TABLE IF EXISTS `ubwbh_product_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_shop` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `low_stock_threshold` int(10) DEFAULT NULL,
  `low_stock_alert` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unity` varchar(255) DEFAULT NULL,
  `unit_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `additional_shipping_cost` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `customizable` tinyint(2) NOT NULL DEFAULT 0,
  `uploadable_files` tinyint(4) NOT NULL DEFAULT 0,
  `text_fields` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `redirect_type` enum('404','410','301-product','302-product','301-category','302-category','200-displayed','404-displayed','410-displayed','default') NOT NULL DEFAULT 'default',
  `id_type_redirected` int(10) unsigned NOT NULL DEFAULT 0,
  `available_for_order` tinyint(1) NOT NULL DEFAULT 1,
  `available_date` date DEFAULT NULL,
  `show_condition` tinyint(1) NOT NULL DEFAULT 1,
  `condition` enum('new','used','refurbished','open_box','damaged','new_with_defects') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT 1,
  `indexed` tinyint(1) NOT NULL DEFAULT 0,
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `pack_stock_type` int(11) unsigned NOT NULL DEFAULT 3,
  PRIMARY KEY (`id_product`,`id_shop`),
  KEY `id_category_default` (`id_category_default`),
  KEY `date_add` (`date_add`,`active`,`visibility`),
  KEY `indexed` (`indexed`,`active`,`id_product`),
  KEY `shop_tax` (`id_shop`,`id_tax_rules_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_shop`
--

LOCK TABLES `ubwbh_product_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_product_shop` VALUES (1,1,4,1,0,0,0.000000,1,0,0,150000.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',1,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(2,1,5,1,0,0,0.000000,1,0,0,120000.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',9,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(3,1,9,1,0,0,0.000000,1,0,0,175000.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,1,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',13,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(4,1,9,1,0,0,0.000000,1,0,0,100000.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',16,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(5,1,9,1,0,0,0.000000,1,0,0,29.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',19,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(6,1,8,1,0,0,0.000000,1,0,0,11.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(7,1,8,1,0,0,0.000000,1,0,0,11.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(8,1,8,1,0,0,0.000000,1,0,0,11.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(9,1,8,1,0,0,0.000000,1,0,0,18.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',22,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(10,1,8,1,0,0,0.000000,1,0,0,18.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',24,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(11,1,8,1,0,0,0.000000,1,0,0,18.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',26,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(12,1,9,1,0,0,0.000000,1,0,0,9.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(13,1,9,1,0,0,0.000000,1,0,0,9.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(14,1,9,1,0,0,0.000000,1,0,0,9.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(15,1,8,1,0,0,0.000000,1,0,0,35.000000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(16,1,7,1,0,0,0.000000,1,0,0,12.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',28,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(17,1,7,1,0,0,0.000000,1,0,0,12.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',32,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(18,1,7,1,0,0,0.000000,1,0,0,12.900000,5.490000,'',0.000000,0.000000,0.000000,0,0,0,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',36,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3),(19,1,8,1,0,0,0.000000,1,0,0,13.900000,5.490000,'',0.000000,0.000000,0.000000,2,0,1,0,'301-category',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2026-11-23 15:08:48','2026-11-23 15:08:48',3);
/*!40000 ALTER TABLE `ubwbh_product_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_supplier`
--

DROP TABLE IF EXISTS `ubwbh_product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_supplier` (
  `id_product_supplier` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL DEFAULT 0,
  `id_supplier` int(11) unsigned NOT NULL,
  `product_supplier_reference` varchar(64) DEFAULT NULL,
  `product_supplier_price_te` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `id_currency` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_product_supplier`),
  UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_supplier`),
  KEY `id_supplier` (`id_supplier`,`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_supplier`
--

LOCK TABLES `ubwbh_product_supplier` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_supplier` DISABLE KEYS */;
INSERT INTO `ubwbh_product_supplier` VALUES (1,6,0,2,'demo_11',5.490000,1),(2,7,0,2,'demo_12',5.490000,1),(3,8,0,2,'demo_13',5.490000,1),(4,19,0,2,'demo_14',5.490000,1),(5,12,0,2,'demo_18',5.490000,1),(6,12,0,1,'demo_18',6.490000,1),(7,13,0,2,'demo_19',5.490000,1),(8,13,0,1,'demo_19',6.490000,1),(9,14,0,2,'demo_20',5.490000,1),(10,14,0,1,'demo_20',6.490000,1),(11,1,0,1,'demo_1_46',5.490000,1),(12,1,1,1,'demo_1_46',5.490000,1),(13,1,2,1,'demo_1_47',5.490000,1),(14,1,3,1,'demo_1_48',5.490000,1),(15,1,4,1,'demo_1_49',5.490000,1),(16,1,5,1,'demo_1_50',5.490000,1),(17,1,6,1,'demo_1_51',5.490000,1),(18,1,7,1,'demo_1_52',5.490000,1),(19,1,8,1,'demo_1_53',5.490000,1),(20,2,0,1,'demo_3_62',5.490000,1),(21,2,9,1,'demo_3_62',5.490000,1),(22,2,10,1,'demo_3_63',5.490000,1),(23,2,11,1,'demo_3_64',5.490000,1),(24,2,12,1,'demo_3_65',5.490000,1),(25,3,0,1,'demo_6_70',5.490000,1),(26,3,13,1,'demo_6_70',5.490000,1),(27,3,14,1,'demo_6_71',5.490000,1),(28,3,15,1,'demo_6_72',5.490000,1),(29,4,0,1,'demo_5_73',5.490000,1),(30,4,16,1,'demo_5_73',5.490000,1),(31,4,17,1,'demo_5_74',5.490000,1),(32,4,18,1,'demo_5_75',5.490000,1),(33,5,0,1,'demo_5_76',5.490000,1),(34,5,19,1,'demo_5_76',5.490000,1),(35,5,20,1,'demo_5_77',5.490000,1),(36,5,21,1,'demo_5_78',5.490000,1),(37,3,0,2,'demo_6_70',2.490000,1),(38,3,13,2,'demo_6_70',2.490000,1),(39,3,14,2,'demo_6_71',2.490000,1),(40,3,15,2,'demo_6_72',2.490000,1),(41,4,0,2,'demo_5_73',2.490000,1),(42,4,16,2,'demo_5_73',2.490000,1),(43,4,17,2,'demo_5_74',2.490000,1),(44,4,18,2,'demo_5_75',2.490000,1),(45,5,0,2,'demo_5_76',2.490000,1),(46,5,19,2,'demo_5_76',2.490000,1),(47,5,20,2,'demo_5_77',2.490000,1),(48,5,21,2,'demo_5_78',2.490000,1),(49,9,0,2,'demo_15_79',5.490000,1),(50,9,22,2,'demo_15_79',5.490000,1),(51,9,23,2,'demo_15_80',5.490000,1),(52,10,0,2,'demo_16_81',5.490000,1),(53,10,24,2,'demo_16_81',5.490000,1),(54,10,25,2,'demo_16_82',5.490000,1),(55,11,0,2,'demo_17_83',5.490000,1),(56,11,26,2,'demo_17_83',5.490000,1),(57,11,27,2,'demo_17_84',5.490000,1),(58,16,0,2,'demo_8_85',5.490000,1),(59,16,28,2,'demo_8_85',5.490000,1),(60,16,29,2,'demo_8_86',5.490000,1),(61,16,30,2,'demo_8_87',5.490000,1),(62,16,31,2,'demo_8_88',5.490000,1),(63,17,0,2,'demo_9_89',5.490000,1),(64,17,32,2,'demo_9_89',5.490000,1),(65,17,33,2,'demo_9_90',5.490000,1),(66,17,34,2,'demo_9_91',5.490000,1),(67,17,35,2,'demo_9_92',5.490000,1),(68,18,0,2,'demo_10_93',5.490000,1),(69,18,36,2,'demo_10_93',5.490000,1),(70,18,37,2,'demo_10_94',5.490000,1),(71,18,38,2,'demo_10_95',5.490000,1),(72,18,39,2,'demo_10_96',5.490000,1),(73,15,0,2,'',0.000000,1);
/*!40000 ALTER TABLE `ubwbh_product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_product_tag`
--

DROP TABLE IF EXISTS `ubwbh_product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_product_tag` (
  `id_product` int(10) unsigned NOT NULL,
  `id_tag` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_tag`),
  KEY `id_tag` (`id_tag`),
  KEY `id_lang` (`id_lang`,`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_product_tag`
--

LOCK TABLES `ubwbh_product_tag` WRITE;
/*!40000 ALTER TABLE `ubwbh_product_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_profile`
--

DROP TABLE IF EXISTS `ubwbh_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_profile`
--

LOCK TABLES `ubwbh_profile` WRITE;
/*!40000 ALTER TABLE `ubwbh_profile` DISABLE KEYS */;
INSERT INTO `ubwbh_profile` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `ubwbh_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_profile_lang`
--

DROP TABLE IF EXISTS `ubwbh_profile_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_profile_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_profile_lang`
--

LOCK TABLES `ubwbh_profile_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_profile_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_profile_lang` VALUES (1,1,'SuperAdmin'),(2,1,'SuperAdmin'),(1,2,'Logistician'),(2,2,'Bagian Logistik'),(1,3,'Translator'),(2,3,'Penerjemah'),(1,4,'Salesman'),(2,4,'Bagian sales');
/*!40000 ALTER TABLE `ubwbh_profile_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_ps_ask_ai_chat_history`
--

DROP TABLE IF EXISTS `ubwbh_ps_ask_ai_chat_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_ps_ask_ai_chat_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` varchar(255) NOT NULL,
  `messages` longtext NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_thread_id` (`thread_id`),
  KEY `idx_thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_ps_ask_ai_chat_history`
--

LOCK TABLES `ubwbh_ps_ask_ai_chat_history` WRITE;
/*!40000 ALTER TABLE `ubwbh_ps_ask_ai_chat_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_ps_ask_ai_chat_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_ps_ask_ai_conversation`
--

DROP TABLE IF EXISTS `ubwbh_ps_ask_ai_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_ps_ask_ai_conversation` (
  `id_conversation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` varchar(64) NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_thread_id` varchar(64) DEFAULT NULL,
  `root_thread_id` varchar(64) NOT NULL,
  `branch_point` int(11) DEFAULT NULL,
  `active_leaf_thread_id` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `archived_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_conversation`),
  UNIQUE KEY `uk_thread_id` (`thread_id`),
  KEY `idx_employee_shop` (`id_employee`,`id_shop`),
  KEY `idx_root_thread_id` (`root_thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_ps_ask_ai_conversation`
--

LOCK TABLES `ubwbh_ps_ask_ai_conversation` WRITE;
/*!40000 ALTER TABLE `ubwbh_ps_ask_ai_conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_ps_ask_ai_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_ps_ask_ai_tool_log`
--

DROP TABLE IF EXISTS `ubwbh_ps_ask_ai_tool_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_ps_ask_ai_tool_log` (
  `id_tool_log` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `thread_id` varchar(64) DEFAULT NULL,
  `tool_call_id` varchar(128) DEFAULT NULL,
  `tool_name` varchar(255) NOT NULL,
  `inputs` text DEFAULT NULL,
  `status` varchar(16) NOT NULL,
  `approval` varchar(16) NOT NULL DEFAULT 'auto',
  `executed_at` datetime NOT NULL,
  PRIMARY KEY (`id_tool_log`),
  KEY `idx_employee_shop` (`id_employee`,`id_shop`),
  KEY `idx_shop_executed_at` (`id_shop`,`executed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_ps_ask_ai_tool_log`
--

LOCK TABLES `ubwbh_ps_ask_ai_tool_log` WRITE;
/*!40000 ALTER TABLE `ubwbh_ps_ask_ai_tool_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_ps_ask_ai_tool_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_address`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_address` (
  `id_address` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `checksum` varchar(32) NOT NULL,
  PRIMARY KEY (`id_customer`,`checksum`),
  KEY `id_address` (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_address`
--

LOCK TABLES `ubwbh_pscheckout_address` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_authorization`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_authorization` (
  `id` varchar(50) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `expiration_time` varchar(50) NOT NULL,
  `create_time` varchar(20) NOT NULL,
  `update_time` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_authorization`
--

LOCK TABLES `ubwbh_pscheckout_authorization` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_authorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_capture`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_capture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_capture` (
  `id` varchar(50) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `final_capture` tinyint(1) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL,
  `seller_protection` text DEFAULT NULL,
  `seller_receivable_breakdown` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_capture`
--

LOCK TABLES `ubwbh_pscheckout_capture` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_capture` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_capture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_cart`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_cart` (
  `id_pscheckout_cart` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(10) unsigned NOT NULL,
  `paypal_intent` varchar(20) DEFAULT 'CAPTURE',
  `paypal_order` varchar(20) DEFAULT NULL,
  `paypal_status` varchar(30) DEFAULT NULL,
  `paypal_funding` varchar(20) DEFAULT NULL,
  `paypal_token` text DEFAULT NULL,
  `paypal_token_expire` datetime DEFAULT NULL,
  `paypal_authorization_expire` datetime DEFAULT NULL,
  `environment` varchar(20) DEFAULT NULL,
  `isExpressCheckout` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `isHostedFields` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_pscheckout_cart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_cart`
--

LOCK TABLES `ubwbh_pscheckout_cart` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_customer`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_customer` (
  `id_customer` int(10) unsigned NOT NULL,
  `paypal_customer_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id_customer`,`paypal_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_customer`
--

LOCK TABLES `ubwbh_pscheckout_customer` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_funding_source`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_funding_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_funding_source` (
  `name` varchar(20) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `position` tinyint(2) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_funding_source`
--

LOCK TABLES `ubwbh_pscheckout_funding_source` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_funding_source` DISABLE KEYS */;
INSERT INTO `ubwbh_pscheckout_funding_source` VALUES ('apple_pay',0,11,1),('bancontact',1,4,1),('blik',1,9,1),('card',1,3,1),('eps',1,5,1),('google_pay',0,10,1),('ideal',1,6,1),('mybank',1,7,1),('p24',1,8,1),('paylater',1,2,1),('paypal',1,1,1),('pay_upon_invoice',0,13,1),('venmo',0,12,1);
/*!40000 ALTER TABLE `ubwbh_pscheckout_funding_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_order`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_order` (
  `id` varchar(50) NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `status` varchar(30) NOT NULL,
  `intent` varchar(50) DEFAULT 'CAPTURE',
  `funding_source` varchar(50) NOT NULL,
  `payment_source` text DEFAULT NULL,
  `environment` varchar(50) NOT NULL,
  `is_card_fields` tinyint(1) NOT NULL,
  `is_express_checkout` tinyint(1) NOT NULL,
  `customer_intent` varchar(50) DEFAULT NULL,
  `payment_token_id` varchar(50) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_order`
--

LOCK TABLES `ubwbh_pscheckout_order` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_order_matrice`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_order_matrice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_order_matrice` (
  `id_order_matrice` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order_prestashop` int(10) unsigned NOT NULL,
  `id_order_paypal` varchar(20) NOT NULL,
  PRIMARY KEY (`id_order_matrice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_order_matrice`
--

LOCK TABLES `ubwbh_pscheckout_order_matrice` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_order_matrice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_order_matrice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_payment_token`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_payment_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_payment_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` varchar(50) NOT NULL,
  `paypal_customer_id` varchar(50) NOT NULL,
  `payment_source` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `merchant_id` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `is_favorite` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id_merchant_id_paypal_customer_id` (`token_id`,`merchant_id`,`paypal_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_payment_token`
--

LOCK TABLES `ubwbh_pscheckout_payment_token` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_payment_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_payment_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_purchase_unit`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_purchase_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_purchase_unit` (
  `id_order` varchar(50) NOT NULL,
  `checksum` varchar(50) NOT NULL,
  `reference_id` varchar(50) NOT NULL,
  `items` text DEFAULT NULL,
  PRIMARY KEY (`reference_id`,`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_purchase_unit`
--

LOCK TABLES `ubwbh_pscheckout_purchase_unit` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_purchase_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_purchase_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_refund`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_refund` (
  `id` varchar(50) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `invoice_id` varchar(50) NOT NULL,
  `custom_id` varchar(50) NOT NULL,
  `acquirer_reference_number` varchar(50) NOT NULL,
  `seller_payable_breakdown` text DEFAULT NULL,
  `id_order_slip` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_refund`
--

LOCK TABLES `ubwbh_pscheckout_refund` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_tracking`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_tracking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `tracking_number` varchar(64) NOT NULL,
  `carrier_id` int(10) unsigned NOT NULL,
  `carrier_name` varchar(64) NOT NULL,
  `paypal_order_id` varchar(50) NOT NULL,
  `paypal_capture_id` varchar(50) NOT NULL,
  `tracker_id` varchar(64) DEFAULT NULL,
  `items` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'PENDING',
  `paypal_tracking_status` varchar(20) DEFAULT NULL,
  `payload_checksum` varchar(64) NOT NULL,
  `sent_to_paypal` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_order` (`id_order`),
  KEY `tracking_number` (`tracking_number`),
  KEY `paypal_order_id` (`paypal_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_tracking`
--

LOCK TABLES `ubwbh_pscheckout_tracking` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_pscheckout_webhook_event`
--

DROP TABLE IF EXISTS `ubwbh_pscheckout_webhook_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_pscheckout_webhook_event` (
  `id` varchar(50) NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `resource_id` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'processing',
  `error` text DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_pscheckout_webhook_event`
--

LOCK TABLES `ubwbh_pscheckout_webhook_event` WRITE;
/*!40000 ALTER TABLE `ubwbh_pscheckout_webhook_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_pscheckout_webhook_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_psgdpr_consent`
--

DROP TABLE IF EXISTS `ubwbh_psgdpr_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_psgdpr_consent` (
  `id_gdpr_consent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_module` int(10) unsigned NOT NULL,
  `active` int(10) NOT NULL,
  `error` int(10) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_gdpr_consent`,`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_psgdpr_consent`
--

LOCK TABLES `ubwbh_psgdpr_consent` WRITE;
/*!40000 ALTER TABLE `ubwbh_psgdpr_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_psgdpr_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_psgdpr_consent_lang`
--

DROP TABLE IF EXISTS `ubwbh_psgdpr_consent_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_psgdpr_consent_lang` (
  `id_gdpr_consent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `message` text DEFAULT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_gdpr_consent`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_psgdpr_consent_lang`
--

LOCK TABLES `ubwbh_psgdpr_consent_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_psgdpr_consent_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_psgdpr_consent_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_psgdpr_log`
--

DROP TABLE IF EXISTS `ubwbh_psgdpr_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_psgdpr_log` (
  `id_gdpr_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `id_guest` int(10) unsigned DEFAULT NULL,
  `client_name` varchar(250) DEFAULT NULL,
  `id_module` int(10) unsigned NOT NULL,
  `request_type` int(10) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_gdpr_log`),
  KEY `id_customer` (`id_customer`),
  KEY `idx_id_customer` (`id_customer`,`id_guest`,`client_name`,`id_module`,`date_add`,`date_upd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_psgdpr_log`
--

LOCK TABLES `ubwbh_psgdpr_log` WRITE;
/*!40000 ALTER TABLE `ubwbh_psgdpr_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_psgdpr_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_psreassurance`
--

DROP TABLE IF EXISTS `ubwbh_psreassurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_psreassurance` (
  `id_psreassurance` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) DEFAULT NULL,
  `custom_icon` varchar(255) DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `type_link` int(10) unsigned DEFAULT NULL,
  `id_cms` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_psreassurance`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_psreassurance`
--

LOCK TABLES `ubwbh_psreassurance` WRITE;
/*!40000 ALTER TABLE `ubwbh_psreassurance` DISABLE KEYS */;
INSERT INTO `ubwbh_psreassurance` VALUES (1,'reassurance/pack2/security.svg',NULL,1,1,NULL,NULL,'2026-11-23 15:01:33',NULL),(2,'reassurance/pack2/carrier.svg',NULL,1,2,NULL,NULL,'2026-11-23 15:01:33',NULL),(3,'reassurance/pack2/parcel.svg',NULL,1,3,NULL,NULL,'2026-11-23 15:01:33',NULL);
/*!40000 ALTER TABLE `ubwbh_psreassurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_psreassurance_lang`
--

DROP TABLE IF EXISTS `ubwbh_psreassurance_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_psreassurance_lang` (
  `id_psreassurance` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id_psreassurance`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_psreassurance_lang`
--

LOCK TABLES `ubwbh_psreassurance_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_psreassurance_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_psreassurance_lang` VALUES (1,1,'Security policy','(edit with the Customer Reassurance module)',''),(1,2,'Security policy','(edit with the Customer Reassurance module)',''),(2,1,'Delivery policy','(edit with the Customer Reassurance module)',''),(2,2,'Delivery policy','(edit with the Customer Reassurance module)',''),(3,1,'Return policy','(edit with the Customer Reassurance module)',''),(3,2,'Return policy','(edit with the Customer Reassurance module)','');
/*!40000 ALTER TABLE `ubwbh_psreassurance_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_psshipping_address`
--

DROP TABLE IF EXISTS `ubwbh_psshipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_psshipping_address` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_point_id` int(11) NOT NULL,
  `network_code` varchar(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id_address`),
  UNIQUE KEY `UNIQ_ED8CCBFF682033F1` (`pickup_point_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_psshipping_address`
--

LOCK TABLES `ubwbh_psshipping_address` WRITE;
/*!40000 ALTER TABLE `ubwbh_psshipping_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_psshipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_psshipping_address_orders`
--

DROP TABLE IF EXISTS `ubwbh_psshipping_address_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_psshipping_address_orders` (
  `id_order` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  PRIMARY KEY (`id_order`,`id_shop`,`id_address`),
  KEY `IDX_A5067A5CD3D3C6F1` (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_psshipping_address_orders`
--

LOCK TABLES `ubwbh_psshipping_address_orders` WRITE;
/*!40000 ALTER TABLE `ubwbh_psshipping_address_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_psshipping_address_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_quick_access`
--

DROP TABLE IF EXISTS `ubwbh_quick_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_quick_access` (
  `id_quick_access` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL DEFAULT 0,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id_quick_access`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_quick_access`
--

LOCK TABLES `ubwbh_quick_access` WRITE;
/*!40000 ALTER TABLE `ubwbh_quick_access` DISABLE KEYS */;
INSERT INTO `ubwbh_quick_access` VALUES (1,0,'index.php/sell/orders'),(2,0,'index.php?controller=AdminCartRules&addcart_rule'),(3,0,'index.php/sell/catalog/products/create'),(4,0,'index.php/sell/catalog/categories/new'),(5,0,'index.php/improve/modules/manage'),(6,0,'index.php?controller=AdminStats&module=statscheckup');
/*!40000 ALTER TABLE `ubwbh_quick_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_quick_access_lang`
--

DROP TABLE IF EXISTS `ubwbh_quick_access_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_quick_access_lang` (
  `id_quick_access` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_quick_access`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_quick_access_lang`
--

LOCK TABLES `ubwbh_quick_access_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_quick_access_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_quick_access_lang` VALUES (1,1,'Orders'),(1,2,'Penjualan'),(2,1,'New voucher'),(2,2,'Voucher baru'),(3,1,'New product'),(3,2,'Produk baru'),(4,1,'New category'),(4,2,'Kategori baru'),(5,1,'Installed modules'),(5,2,'Modul terpasang'),(6,1,'Catalog evaluation'),(6,2,'Katalog evaluasi');
/*!40000 ALTER TABLE `ubwbh_quick_access_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_range_price`
--

DROP TABLE IF EXISTS `ubwbh_range_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_range_price` (
  `id_range_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_price`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_range_price`
--

LOCK TABLES `ubwbh_range_price` WRITE;
/*!40000 ALTER TABLE `ubwbh_range_price` DISABLE KEYS */;
INSERT INTO `ubwbh_range_price` VALUES (1,2,0.000000,10000.000000),(2,3,0.000000,50.000000),(3,3,50.000000,100.000000),(4,3,100.000000,200.000000);
/*!40000 ALTER TABLE `ubwbh_range_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_range_weight`
--

DROP TABLE IF EXISTS `ubwbh_range_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_range_weight` (
  `id_range_weight` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_weight`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_range_weight`
--

LOCK TABLES `ubwbh_range_weight` WRITE;
/*!40000 ALTER TABLE `ubwbh_range_weight` DISABLE KEYS */;
INSERT INTO `ubwbh_range_weight` VALUES (1,2,0.000000,10000.000000),(2,4,0.000000,1.000000),(3,4,1.000000,3.000000),(4,4,3.000000,10000.000000);
/*!40000 ALTER TABLE `ubwbh_range_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_request_sql`
--

DROP TABLE IF EXISTS `ubwbh_request_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_request_sql` (
  `id_request_sql` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `sql` mediumtext NOT NULL,
  PRIMARY KEY (`id_request_sql`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_request_sql`
--

LOCK TABLES `ubwbh_request_sql` WRITE;
/*!40000 ALTER TABLE `ubwbh_request_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_request_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_required_field`
--

DROP TABLE IF EXISTS `ubwbh_required_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_required_field` (
  `id_required_field` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(32) NOT NULL,
  `field_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_required_field`),
  KEY `object_name` (`object_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_required_field`
--

LOCK TABLES `ubwbh_required_field` WRITE;
/*!40000 ALTER TABLE `ubwbh_required_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_required_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_risk`
--

DROP TABLE IF EXISTS `ubwbh_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_risk` (
  `id_risk` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `percent` tinyint(3) NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_risk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_risk`
--

LOCK TABLES `ubwbh_risk` WRITE;
/*!40000 ALTER TABLE `ubwbh_risk` DISABLE KEYS */;
INSERT INTO `ubwbh_risk` VALUES (1,0,'#32CD32'),(2,35,'#FF8C00'),(3,75,'#DC143C'),(4,100,'#ec2e15');
/*!40000 ALTER TABLE `ubwbh_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_risk_lang`
--

DROP TABLE IF EXISTS `ubwbh_risk_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_risk_lang` (
  `id_risk` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_risk`,`id_lang`),
  KEY `id_risk` (`id_risk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_risk_lang`
--

LOCK TABLES `ubwbh_risk_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_risk_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_risk_lang` VALUES (1,1,'None'),(1,2,'Tidak satupun'),(2,1,'Low'),(2,2,'Rendah'),(3,1,'Medium'),(3,2,'Menengah'),(4,1,'High'),(4,2,'Tinggi');
/*!40000 ALTER TABLE `ubwbh_risk_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_search_engine`
--

DROP TABLE IF EXISTS `ubwbh_search_engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_search_engine` (
  `id_search_engine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL,
  PRIMARY KEY (`id_search_engine`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_search_engine`
--

LOCK TABLES `ubwbh_search_engine` WRITE;
/*!40000 ALTER TABLE `ubwbh_search_engine` DISABLE KEYS */;
INSERT INTO `ubwbh_search_engine` VALUES (1,'google','q'),(2,'aol','q'),(3,'yandex','text'),(4,'ask.com','q'),(5,'nhl.com','q'),(6,'yahoo','p'),(7,'baidu','wd'),(8,'lycos','query'),(9,'exalead','q'),(10,'search.live','q'),(11,'voila','rdata'),(12,'altavista','q'),(13,'bing','q'),(14,'daum','q'),(15,'eniro','search_word'),(16,'naver','query'),(17,'msn','q'),(18,'netscape','query'),(19,'cnn','query'),(20,'about','terms'),(21,'mamma','query'),(22,'alltheweb','q'),(23,'virgilio','qs'),(24,'alice','qs'),(25,'najdi','q'),(26,'mama','query'),(27,'seznam','q'),(28,'onet','qt'),(29,'szukacz','q'),(30,'yam','k'),(31,'pchome','q'),(32,'kvasir','q'),(33,'sesam','q'),(34,'ozu','q'),(35,'terra','query'),(36,'mynet','q'),(37,'ekolay','q'),(38,'rambler','words');
/*!40000 ALTER TABLE `ubwbh_search_engine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_search_index`
--

DROP TABLE IF EXISTS `ubwbh_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_search_index` (
  `id_product` int(11) unsigned NOT NULL,
  `id_word` int(11) unsigned NOT NULL,
  `weight` smallint(4) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_word`,`id_product`),
  KEY `id_product` (`id_product`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_search_index`
--

LOCK TABLES `ubwbh_search_index` WRITE;
/*!40000 ALTER TABLE `ubwbh_search_index` DISABLE KEYS */;
INSERT INTO `ubwbh_search_index` VALUES (1,7,1),(1,8,1),(1,9,1),(1,10,1),(1,13,1),(1,14,1),(1,15,1),(1,16,1),(1,17,1),(1,19,1),(1,20,1),(1,21,1),(1,22,1),(1,23,1),(1,24,1),(1,26,1),(1,27,1),(1,28,1),(1,29,1),(1,30,1),(1,31,1),(1,32,1),(1,33,1),(1,34,1),(1,35,1),(1,36,1),(1,37,1),(1,38,1),(1,39,1),(1,40,1),(1,41,1),(1,42,1),(1,43,1),(1,44,1),(1,45,1),(1,46,1),(1,47,1),(1,48,1),(1,49,1),(1,50,1),(1,51,1),(1,62,1),(1,63,1),(1,64,1),(1,65,1),(1,68,1),(1,69,1),(1,70,1),(1,71,1),(1,72,1),(1,74,1),(1,75,1),(1,76,1),(1,77,1),(1,78,1),(1,79,1),(1,81,1),(1,82,1),(1,83,1),(1,84,1),(1,85,1),(1,86,1),(1,87,1),(1,88,1),(1,89,1),(1,90,1),(1,91,1),(1,92,1),(1,93,1),(1,94,1),(1,95,1),(1,96,1),(1,97,1),(1,98,1),(1,99,1),(1,100,1),(1,101,1),(1,102,1),(1,103,1),(1,104,1),(1,105,1),(1,106,1),(1,54,2),(1,55,2),(1,109,2),(1,110,2),(1,11,3),(1,12,3),(1,18,3),(1,52,3),(1,53,3),(1,66,3),(1,67,3),(1,73,3),(1,107,3),(1,108,3),(1,25,4),(1,80,4),(1,2,6),(1,3,6),(1,4,6),(1,5,6),(1,57,6),(1,58,6),(1,59,6),(1,60,6),(1,1,7),(1,56,7),(1,6,90),(1,61,90),(2,7,1),(2,8,1),(2,9,1),(2,10,1),(2,14,1),(2,26,1),(2,27,1),(2,28,1),(2,29,1),(2,30,1),(2,31,1),(2,32,1),(2,33,1),(2,34,1),(2,35,1),(2,36,1),(2,37,1),(2,38,1),(2,39,1),(2,40,1),(2,41,1),(2,42,1),(2,43,1),(2,44,1),(2,45,1),(2,46,1),(2,47,1),(2,48,1),(2,49,1),(2,50,1),(2,51,1),(2,62,1),(2,63,1),(2,64,1),(2,65,1),(2,69,1),(2,81,1),(2,82,1),(2,83,1),(2,84,1),(2,85,1),(2,86,1),(2,87,1),(2,88,1),(2,89,1),(2,90,1),(2,91,1),(2,92,1),(2,93,1),(2,94,1),(2,95,1),(2,96,1),(2,97,1),(2,98,1),(2,99,1),(2,100,1),(2,101,1),(2,102,1),(2,103,1),(2,104,1),(2,105,1),(2,106,1),(2,112,1),(2,113,1),(2,114,1),(2,115,1),(2,116,1),(2,117,1),(2,159,1),(2,160,1),(2,161,1),(2,162,1),(2,163,1),(2,164,1),(2,18,2),(2,73,2),(2,12,3),(2,15,3),(2,53,3),(2,67,3),(2,70,3),(2,108,3),(2,118,3),(2,165,3),(2,25,4),(2,80,4),(2,1,6),(2,2,6),(2,56,6),(2,57,6),(2,111,6),(2,158,6),(2,6,50),(2,61,50),(3,2,1),(3,57,1),(3,210,1),(3,213,1),(3,214,1),(3,215,1),(3,216,1),(3,217,1),(3,218,1),(3,219,1),(3,220,1),(3,221,1),(3,222,1),(3,223,1),(3,224,1),(3,225,1),(3,226,1),(3,227,1),(3,228,1),(3,229,1),(3,230,1),(3,231,1),(3,232,1),(3,233,1),(3,234,1),(3,235,1),(3,236,1),(3,237,1),(3,251,1),(3,254,1),(3,255,1),(3,256,1),(3,257,1),(3,258,1),(3,259,1),(3,260,1),(3,261,1),(3,262,1),(3,263,1),(3,264,1),(3,265,1),(3,266,1),(3,267,1),(3,268,1),(3,269,1),(3,270,1),(3,271,1),(3,272,1),(3,273,1),(3,274,1),(3,275,1),(3,276,1),(3,277,1),(3,278,1),(3,241,2),(3,242,2),(3,243,2),(3,282,2),(3,283,2),(3,284,2),(3,211,3),(3,212,3),(3,238,3),(3,239,3),(3,240,3),(3,252,3),(3,253,3),(3,279,3),(3,280,3),(3,281,3),(3,207,6),(3,248,6),(3,205,7),(3,206,7),(3,208,7),(3,209,7),(3,246,7),(3,247,7),(3,249,7),(3,250,7),(3,6,40),(3,61,40),(4,2,1),(4,57,1),(4,205,1),(4,206,1),(4,210,1),(4,213,1),(4,214,1),(4,215,1),(4,216,1),(4,217,1),(4,218,1),(4,219,1),(4,220,1),(4,221,1),(4,222,1),(4,223,1),(4,224,1),(4,225,1),(4,226,1),(4,227,1),(4,228,1),(4,229,1),(4,230,1),(4,231,1),(4,232,1),(4,233,1),(4,234,1),(4,235,1),(4,236,1),(4,237,1),(4,246,1),(4,247,1),(4,251,1),(4,254,1),(4,255,1),(4,256,1),(4,257,1),(4,258,1),(4,259,1),(4,260,1),(4,261,1),(4,262,1),(4,263,1),(4,264,1),(4,265,1),(4,266,1),(4,267,1),(4,268,1),(4,269,1),(4,270,1),(4,271,1),(4,272,1),(4,273,1),(4,274,1),(4,275,1),(4,276,1),(4,277,1),(4,278,1),(4,289,1),(4,332,1),(4,212,2),(4,241,2),(4,242,2),(4,243,2),(4,253,2),(4,282,2),(4,283,2),(4,284,2),(4,211,3),(4,238,3),(4,239,3),(4,240,3),(4,252,3),(4,279,3),(4,280,3),(4,281,3),(4,287,6),(4,288,6),(4,330,6),(4,331,6),(4,208,7),(4,209,7),(4,249,7),(4,250,7),(4,6,40),(4,61,40),(5,2,1),(5,57,1),(5,205,1),(5,206,1),(5,210,1),(5,213,1),(5,214,1),(5,215,1),(5,216,1),(5,217,1),(5,218,1),(5,219,1),(5,220,1),(5,221,1),(5,222,1),(5,223,1),(5,224,1),(5,225,1),(5,226,1),(5,227,1),(5,228,1),(5,229,1),(5,230,1),(5,231,1),(5,232,1),(5,233,1),(5,234,1),(5,235,1),(5,236,1),(5,237,1),(5,246,1),(5,247,1),(5,251,1),(5,254,1),(5,255,1),(5,256,1),(5,257,1),(5,258,1),(5,259,1),(5,260,1),(5,261,1),(5,262,1),(5,263,1),(5,264,1),(5,265,1),(5,266,1),(5,267,1),(5,268,1),(5,269,1),(5,270,1),(5,271,1),(5,272,1),(5,273,1),(5,274,1),(5,275,1),(5,276,1),(5,277,1),(5,278,1),(5,289,1),(5,332,1),(5,241,2),(5,242,2),(5,243,2),(5,282,2),(5,283,2),(5,284,2),(5,211,3),(5,212,3),(5,238,3),(5,239,3),(5,240,3),(5,252,3),(5,253,3),(5,279,3),(5,280,3),(5,281,3),(5,373,6),(5,374,6),(5,375,6),(5,417,6),(5,418,6),(5,419,6),(5,208,7),(5,209,7),(5,249,7),(5,250,7),(5,6,40),(5,61,40),(6,54,1),(6,109,1),(6,215,1),(6,256,1),(6,375,1),(6,419,1),(6,464,1),(6,465,1),(6,466,1),(6,467,1),(6,468,1),(6,469,1),(6,470,1),(6,471,1),(6,472,1),(6,473,1),(6,474,1),(6,475,1),(6,476,1),(6,477,1),(6,478,1),(6,492,1),(6,493,1),(6,494,1),(6,495,1),(6,496,1),(6,497,1),(6,498,1),(6,499,1),(6,500,1),(6,501,1),(6,502,1),(6,503,1),(6,504,1),(6,505,1),(6,506,1),(6,25,3),(6,53,3),(6,80,3),(6,108,3),(6,463,3),(6,479,3),(6,480,3),(6,491,3),(6,507,3),(6,508,3),(6,461,6),(6,462,6),(6,489,6),(6,490,6),(6,205,7),(6,206,7),(6,246,7),(6,247,7),(6,6,10),(6,61,10),(7,54,1),(7,109,1),(7,465,1),(7,470,1),(7,471,1),(7,472,1),(7,473,1),(7,474,1),(7,475,1),(7,476,1),(7,477,1),(7,478,1),(7,493,1),(7,498,1),(7,499,1),(7,500,1),(7,501,1),(7,502,1),(7,503,1),(7,504,1),(7,505,1),(7,506,1),(7,517,1),(7,518,1),(7,519,1),(7,520,1),(7,521,1),(7,542,1),(7,543,1),(7,544,1),(7,545,1),(7,546,1),(7,25,3),(7,53,3),(7,80,3),(7,108,3),(7,463,3),(7,479,3),(7,480,3),(7,491,3),(7,507,3),(7,508,3),(7,287,7),(7,288,7),(7,330,7),(7,331,7),(7,461,7),(7,489,7),(7,6,10),(7,61,10),(8,54,1),(8,109,1),(8,220,1),(8,261,1),(8,465,1),(8,466,1),(8,470,1),(8,471,1),(8,472,1),(8,473,1),(8,474,1),(8,475,1),(8,476,1),(8,477,1),(8,478,1),(8,493,1),(8,494,1),(8,498,1),(8,499,1),(8,500,1),(8,501,1),(8,502,1),(8,503,1),(8,504,1),(8,505,1),(8,506,1),(8,518,1),(8,543,1),(8,567,1),(8,568,1),(8,569,1),(8,570,1),(8,595,1),(8,596,1),(8,597,1),(8,598,1),(8,25,3),(8,53,3),(8,80,3),(8,108,3),(8,463,3),(8,479,3),(8,480,3),(8,491,3),(8,507,3),(8,508,3),(8,373,6),(8,417,6),(8,374,7),(8,375,7),(8,418,7),(8,419,7),(8,461,7),(8,489,7),(8,6,10),(8,61,10),(9,32,1),(9,87,1),(9,112,1),(9,113,1),(9,159,1),(9,160,1),(9,221,1),(9,239,1),(9,262,1),(9,280,1),(9,567,1),(9,568,1),(9,595,1),(9,596,1),(9,628,1),(9,629,1),(9,630,1),(9,631,1),(9,632,1),(9,633,1),(9,634,1),(9,635,1),(9,636,1),(9,637,1),(9,638,1),(9,639,1),(9,640,1),(9,641,1),(9,642,1),(9,643,1),(9,644,1),(9,645,1),(9,666,1),(9,667,1),(9,668,1),(9,669,1),(9,670,1),(9,671,1),(9,672,1),(9,673,1),(9,674,1),(9,675,1),(9,676,1),(9,677,1),(9,678,1),(9,679,1),(9,680,1),(9,681,1),(9,682,1),(9,683,1),(9,54,2),(9,55,2),(9,109,2),(9,110,2),(9,25,3),(9,53,3),(9,80,3),(9,108,3),(9,479,3),(9,480,3),(9,507,3),(9,508,3),(9,626,3),(9,646,3),(9,664,3),(9,684,3),(9,627,4),(9,665,4),(9,623,7),(9,624,7),(9,661,7),(9,662,7),(9,625,8),(9,663,8),(9,6,30),(9,61,30),(10,32,1),(10,87,1),(10,112,1),(10,113,1),(10,159,1),(10,160,1),(10,221,1),(10,239,1),(10,262,1),(10,280,1),(10,567,1),(10,568,1),(10,595,1),(10,596,1),(10,628,1),(10,629,1),(10,630,1),(10,631,1),(10,632,1),(10,633,1),(10,634,1),(10,635,1),(10,636,1),(10,637,1),(10,638,1),(10,639,1),(10,640,1),(10,641,1),(10,642,1),(10,643,1),(10,644,1),(10,645,1),(10,666,1),(10,667,1),(10,668,1),(10,669,1),(10,670,1),(10,671,1),(10,672,1),(10,673,1),(10,674,1),(10,675,1),(10,676,1),(10,677,1),(10,678,1),(10,679,1),(10,680,1),(10,681,1),(10,682,1),(10,683,1),(10,54,2),(10,55,2),(10,109,2),(10,110,2),(10,25,3),(10,53,3),(10,80,3),(10,108,3),(10,479,3),(10,480,3),(10,507,3),(10,508,3),(10,626,3),(10,646,3),(10,664,3),(10,684,3),(10,627,4),(10,665,4),(10,699,7),(10,700,7),(10,737,7),(10,738,7),(10,625,8),(10,663,8),(10,6,30),(10,61,30),(11,32,1),(11,87,1),(11,112,1),(11,113,1),(11,159,1),(11,160,1),(11,221,1),(11,239,1),(11,262,1),(11,280,1),(11,567,1),(11,568,1),(11,595,1),(11,596,1),(11,628,1),(11,629,1),(11,630,1),(11,631,1),(11,632,1),(11,633,1),(11,634,1),(11,635,1),(11,636,1),(11,637,1),(11,638,1),(11,639,1),(11,640,1),(11,641,1),(11,642,1),(11,643,1),(11,644,1),(11,645,1),(11,666,1),(11,667,1),(11,668,1),(11,669,1),(11,670,1),(11,671,1),(11,672,1),(11,673,1),(11,674,1),(11,675,1),(11,676,1),(11,677,1),(11,678,1),(11,679,1),(11,680,1),(11,681,1),(11,682,1),(11,683,1),(11,54,2),(11,55,2),(11,109,2),(11,110,2),(11,25,3),(11,53,3),(11,80,3),(11,108,3),(11,479,3),(11,480,3),(11,507,3),(11,508,3),(11,626,3),(11,646,3),(11,664,3),(11,684,3),(11,627,4),(11,665,4),(11,1,7),(11,56,7),(11,625,8),(11,663,8),(11,6,30),(11,61,30),(12,43,1),(12,98,1),(12,851,1),(12,852,1),(12,853,1),(12,854,1),(12,855,1),(12,856,1),(12,857,1),(12,858,1),(12,859,1),(12,860,1),(12,861,1),(12,862,1),(12,863,1),(12,864,1),(12,865,1),(12,866,1),(12,867,1),(12,868,1),(12,869,1),(12,870,1),(12,871,1),(12,881,1),(12,882,1),(12,883,1),(12,884,1),(12,885,1),(12,886,1),(12,887,1),(12,888,1),(12,889,1),(12,890,1),(12,891,1),(12,892,1),(12,893,1),(12,894,1),(12,895,1),(12,896,1),(12,897,1),(12,898,1),(12,899,1),(12,900,1),(12,901,1),(12,238,3),(12,240,3),(12,279,3),(12,281,3),(12,239,4),(12,280,4),(12,850,6),(12,880,6),(12,623,7),(12,624,7),(12,661,7),(12,662,7),(12,849,8),(12,879,8),(12,6,10),(12,61,10),(13,43,1),(13,98,1),(13,623,1),(13,624,1),(13,661,1),(13,662,1),(13,851,1),(13,852,1),(13,853,1),(13,854,1),(13,855,1),(13,856,1),(13,857,1),(13,858,1),(13,859,1),(13,860,1),(13,861,1),(13,862,1),(13,863,1),(13,864,1),(13,865,1),(13,866,1),(13,867,1),(13,868,1),(13,869,1),(13,870,1),(13,871,1),(13,881,1),(13,882,1),(13,883,1),(13,884,1),(13,885,1),(13,886,1),(13,887,1),(13,888,1),(13,889,1),(13,890,1),(13,891,1),(13,892,1),(13,893,1),(13,894,1),(13,895,1),(13,896,1),(13,897,1),(13,898,1),(13,899,1),(13,900,1),(13,901,1),(13,238,3),(13,240,3),(13,279,3),(13,281,3),(13,239,4),(13,280,4),(13,699,6),(13,700,6),(13,737,6),(13,738,6),(13,850,6),(13,880,6),(13,849,8),(13,879,8),(13,6,10),(13,61,10),(14,43,1),(14,98,1),(14,623,1),(14,624,1),(14,661,1),(14,662,1),(14,851,1),(14,852,1),(14,853,1),(14,854,1),(14,855,1),(14,856,1),(14,857,1),(14,858,1),(14,859,1),(14,860,1),(14,861,1),(14,862,1),(14,863,1),(14,864,1),(14,865,1),(14,866,1),(14,867,1),(14,868,1),(14,869,1),(14,870,1),(14,871,1),(14,881,1),(14,882,1),(14,883,1),(14,884,1),(14,885,1),(14,886,1),(14,887,1),(14,888,1),(14,889,1),(14,890,1),(14,891,1),(14,892,1),(14,893,1),(14,894,1),(14,895,1),(14,896,1),(14,897,1),(14,898,1),(14,899,1),(14,900,1),(14,901,1),(14,238,3),(14,240,3),(14,279,3),(14,281,3),(14,239,4),(14,280,4),(14,1,6),(14,56,6),(14,850,6),(14,880,6),(14,849,8),(14,879,8),(14,6,10),(14,61,10),(15,243,1),(15,284,1),(15,287,1),(15,288,1),(15,330,1),(15,331,1),(15,373,1),(15,374,1),(15,375,1),(15,417,1),(15,418,1),(15,419,1),(15,479,3),(15,480,3),(15,507,3),(15,508,3),(15,1035,6),(15,1048,6),(15,208,7),(15,209,7),(15,249,7),(15,250,7),(15,461,7),(15,489,7),(15,6,10),(15,61,10),(16,13,1),(16,53,1),(16,68,1),(16,108,1),(16,205,1),(16,212,1),(16,221,1),(16,246,1),(16,253,1),(16,262,1),(16,479,1),(16,507,1),(16,627,1),(16,665,1),(16,1063,1),(16,1064,1),(16,1067,1),(16,1068,1),(16,1069,1),(16,1070,1),(16,1071,1),(16,1072,1),(16,1073,1),(16,1074,1),(16,1075,1),(16,1076,1),(16,1077,1),(16,1078,1),(16,1079,1),(16,1080,1),(16,1081,1),(16,1082,1),(16,1083,1),(16,1084,1),(16,1105,1),(16,1106,1),(16,1109,1),(16,1110,1),(16,1111,1),(16,1112,1),(16,1113,1),(16,1114,1),(16,1115,1),(16,1116,1),(16,1117,1),(16,1118,1),(16,1119,1),(16,1120,1),(16,1121,1),(16,1122,1),(16,1123,1),(16,1124,1),(16,1125,1),(16,1126,1),(16,1086,2),(16,1087,2),(16,1088,2),(16,1089,2),(16,1090,2),(16,1128,2),(16,1129,2),(16,1130,2),(16,1131,2),(16,1132,2),(16,239,3),(16,240,3),(16,280,3),(16,281,3),(16,1062,3),(16,1065,3),(16,1066,3),(16,1085,3),(16,1104,3),(16,1107,3),(16,1108,3),(16,1127,3),(16,623,7),(16,624,7),(16,661,7),(16,662,7),(16,1061,8),(16,1103,8),(16,6,50),(16,61,50),(17,13,1),(17,53,1),(17,68,1),(17,108,1),(17,205,1),(17,212,1),(17,221,1),(17,246,1),(17,253,1),(17,262,1),(17,479,1),(17,507,1),(17,623,1),(17,624,1),(17,627,1),(17,661,1),(17,662,1),(17,665,1),(17,1063,1),(17,1064,1),(17,1067,1),(17,1068,1),(17,1069,1),(17,1070,1),(17,1071,1),(17,1072,1),(17,1073,1),(17,1074,1),(17,1075,1),(17,1076,1),(17,1077,1),(17,1078,1),(17,1079,1),(17,1080,1),(17,1081,1),(17,1082,1),(17,1083,1),(17,1084,1),(17,1105,1),(17,1106,1),(17,1109,1),(17,1110,1),(17,1111,1),(17,1112,1),(17,1113,1),(17,1114,1),(17,1115,1),(17,1116,1),(17,1117,1),(17,1118,1),(17,1119,1),(17,1120,1),(17,1121,1),(17,1122,1),(17,1123,1),(17,1124,1),(17,1125,1),(17,1126,1),(17,1086,2),(17,1087,2),(17,1088,2),(17,1089,2),(17,1090,2),(17,1128,2),(17,1129,2),(17,1130,2),(17,1131,2),(17,1132,2),(17,239,3),(17,240,3),(17,280,3),(17,281,3),(17,1062,3),(17,1065,3),(17,1066,3),(17,1085,3),(17,1104,3),(17,1107,3),(17,1108,3),(17,1127,3),(17,699,6),(17,700,6),(17,737,6),(17,738,6),(17,1061,8),(17,1103,8),(17,6,50),(17,61,50),(18,13,1),(18,53,1),(18,68,1),(18,108,1),(18,205,1),(18,212,1),(18,221,1),(18,246,1),(18,253,1),(18,262,1),(18,479,1),(18,507,1),(18,623,1),(18,624,1),(18,627,1),(18,661,1),(18,662,1),(18,665,1),(18,1063,1),(18,1064,1),(18,1067,1),(18,1068,1),(18,1069,1),(18,1070,1),(18,1071,1),(18,1072,1),(18,1073,1),(18,1074,1),(18,1075,1),(18,1076,1),(18,1077,1),(18,1078,1),(18,1079,1),(18,1080,1),(18,1081,1),(18,1082,1),(18,1083,1),(18,1084,1),(18,1105,1),(18,1106,1),(18,1109,1),(18,1110,1),(18,1111,1),(18,1112,1),(18,1113,1),(18,1114,1),(18,1115,1),(18,1116,1),(18,1117,1),(18,1118,1),(18,1119,1),(18,1120,1),(18,1121,1),(18,1122,1),(18,1123,1),(18,1124,1),(18,1125,1),(18,1126,1),(18,1086,2),(18,1087,2),(18,1088,2),(18,1089,2),(18,1090,2),(18,1128,2),(18,1129,2),(18,1130,2),(18,1131,2),(18,1132,2),(18,239,3),(18,240,3),(18,280,3),(18,281,3),(18,1062,3),(18,1065,3),(18,1066,3),(18,1085,3),(18,1104,3),(18,1107,3),(18,1108,3),(18,1127,3),(18,1,6),(18,56,6),(18,1061,8),(18,1103,8),(18,6,50),(18,61,50),(19,54,1),(19,109,1),(19,465,1),(19,493,1),(19,1320,1),(19,1321,1),(19,1322,1),(19,1323,1),(19,1324,1),(19,1325,1),(19,1326,1),(19,1327,1),(19,1328,1),(19,1329,1),(19,1330,1),(19,1331,1),(19,1342,1),(19,1343,1),(19,1344,1),(19,1345,1),(19,1346,1),(19,1347,1),(19,1348,1),(19,1349,1),(19,1350,1),(19,1351,1),(19,1352,1),(19,1353,1),(19,25,3),(19,53,3),(19,80,3),(19,108,3),(19,463,3),(19,479,3),(19,480,3),(19,491,3),(19,507,3),(19,508,3),(19,1319,6),(19,1341,6),(19,461,8),(19,489,8),(19,6,10),(19,61,10);
/*!40000 ALTER TABLE `ubwbh_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_search_word`
--

DROP TABLE IF EXISTS `ubwbh_search_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_search_word` (
  `id_word` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_lang` int(10) unsigned NOT NULL,
  `word` varchar(30) NOT NULL,
  PRIMARY KEY (`id_word`),
  UNIQUE KEY `id_lang` (`id_lang`,`id_shop`,`word`)
) ENGINE=InnoDB AUTO_INCREMENT=1363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_search_word`
--

LOCK TABLES `ubwbh_search_word` WRITE;
/*!40000 ALTER TABLE `ubwbh_search_word` DISABLE KEYS */;
INSERT INTO `ubwbh_search_word` VALUES (1331,1,1,'---'),(474,1,1,'043kg'),(112,1,1,'100%'),(1062,1,1,'120'),(1067,1,1,'16x22cm'),(465,1,1,'325ml'),(631,1,1,'32x32cm'),(243,1,1,'40x60cm'),(241,1,1,'60x90cm'),(643,1,1,'60°'),(242,1,1,'80x120cm'),(470,1,1,'82cm'),(472,1,1,'95cm'),(480,1,1,'accessories'),(567,1,1,'add'),(287,1,1,'adventure'),(219,1,1,'aesthethic,'),(633,1,1,'armchair'),(238,1,1,'art'),(638,1,1,'atmosphere'),(630,1,1,'back'),(700,1,1,'bear'),(634,1,1,'bed'),(288,1,1,'begins'),(205,1,1,'best'),(1084,1,1,'binding'),(55,1,1,'black'),(699,1,1,'brown'),(114,1,1,'brushed'),(1066,1,1,'cardboard'),(463,1,1,'ceramic'),(1330,1,1,'characters:'),(39,1,1,'chino'),(1322,1,1,'choice'),(30,1,1,'classic'),(518,1,1,'coffee'),(28,1,1,'collection'),(47,1,1,'color'),(49,1,1,'color,'),(32,1,1,'colorful'),(462,1,1,'come'),(215,1,1,'come!'),(207,1,1,'come\''),(117,1,1,'comfort'),(858,1,1,'commercial'),(520,1,1,'conquer'),(240,1,1,'corner'),(18,1,1,'cotton'),(113,1,1,'cotton,'),(627,1,1,'cover'),(635,1,1,'create'),(863,1,1,'creative'),(517,1,1,'cup'),(23,1,1,'curiosity'),(625,1,1,'cushion'),(862,1,1,'custom'),(1319,1,1,'customizable'),(1320,1,1,'customize'),(375,1,1,'day'),(521,1,1,'day!'),(21,1,1,'delicacy,'),(6,1,1,'demo'),(233,1,1,'depth'),(53,1,1,'design'),(26,1,1,'design\''),(224,1,1,'desk'),(471,1,1,'diameter'),(475,1,1,'dishwasher'),(477,1,1,'dishwasher-proo'),(478,1,1,'dishwasherproof'),(1088,1,1,'doted'),(1082,1,1,'double'),(854,1,1,'download'),(1074,1,1,'endearing'),(22,1,1,'evokes'),(46,1,1,'exceptional'),(14,1,1,'extra'),(29,1,1,'features'),(1078,1,1,'feel'),(644,1,1,'filling'),(289,1,1,'finish'),(8,1,1,'fit,'),(852,1,1,'format:'),(624,1,1,'fox'),(230,1,1,'frame'),(208,1,1,'framed'),(216,1,1,'give'),(374,1,1,'good'),(239,1,1,'graphic'),(851,1,1,'graphic,'),(850,1,1,'graphics'),(223,1,1,'great'),(1081,1,1,'gsm'),(50,1,1,'guaranteed'),(1064,1,1,'hard'),(473,1,1,'height'),(479,1,1,'home'),(1,1,1,'hummingbird'),(645,1,1,'hypoallergenic'),(1071,1,1,'ideas'),(865,1,1,'illustration'),(1070,1,1,'ingenious'),(115,1,1,'inner'),(34,1,1,'inspired'),(639,1,1,'inspires'),(628,1,1,'invisible'),(1326,1,1,'it\'s'),(36,1,1,'japanese'),(40,1,1,'jeans'),(24,1,1,'joy'),(20,1,1,'lightness'),(1079,1,1,'like'),(871,1,1,'limitation'),(15,1,1,'long'),(222,1,1,'look'),(641,1,1,'machine'),(13,1,1,'made'),(1077,1,1,'make'),(1075,1,1,'manufacturing'),(211,1,1,'matt'),(1328,1,1,'maximum'),(52,1,1,'men'),(1324,1,1,'message,'),(636,1,1,'modern'),(570,1,1,'mood!'),(1323,1,1,'mood,'),(569,1,1,'morning'),(623,1,1,'mountain'),(461,1,1,'mug'),(464,1,1,'mug,'),(10,1,1,'neckline,'),(857,1,1,'non'),(860,1,1,'non-commercial'),(861,1,1,'noncommercial'),(1061,1,1,'notebook'),(1329,1,1,'number'),(227,1,1,'office'),(225,1,1,'open'),(234,1,1,'open-space'),(235,1,1,'openspace'),(220,1,1,'optimistic'),(1068,1,1,'option'),(37,1,1,'origamis'),(51,1,1,'overtime'),(1035,1,1,'pack'),(1090,1,1,'pages'),(228,1,1,'painted'),(212,1,1,'paper'),(232,1,1,'partout'),(231,1,1,'passe'),(236,1,1,'passe-partout'),(237,1,1,'passepartout'),(33,1,1,'patterns,'),(855,1,1,'personal,'),(17,1,1,'pima'),(1086,1,1,'plain'),(646,1,1,'polyester'),(27,1,1,'polyfaune'),(468,1,1,'positive'),(209,1,1,'poster'),(2,1,1,'printed'),(43,1,1,'printing'),(856,1,1,'private'),(44,1,1,'process'),(31,1,1,'products'),(864,1,1,'project?'),(476,1,1,'proof'),(45,1,1,'provides'),(867,1,1,'purpose'),(1076,1,1,'quality'),(1325,1,1,'quote'),(1065,1,1,'recycled'),(7,1,1,'regular'),(640,1,1,'relaxation'),(626,1,1,'removable'),(48,1,1,'rendering'),(467,1,1,'right'),(210,1,1,'rigid'),(9,1,1,'round'),(1089,1,1,'ruled'),(519,1,1,'set'),(1063,1,1,'sheets'),(3,1,1,'shirt'),(11,1,1,'short'),(116,1,1,'side'),(870,1,1,'size'),(12,1,1,'sleeves'),(213,1,1,'smooth'),(632,1,1,'sofa,'),(226,1,1,'space'),(1083,1,1,'spiral'),(1087,1,1,'squared'),(16,1,1,'staple'),(466,1,1,'start'),(1085,1,1,'stationery'),(25,1,1,'studio'),(41,1,1,'sublimation'),(868,1,1,'support,'),(214,1,1,'surface'),(853,1,1,'svg'),(111,1,1,'sweater'),(19,1,1,'symbol'),(4,1,1,'t-shirt'),(1321,1,1,'text'),(42,1,1,'textile'),(469,1,1,'thought'),(373,1,1,'today'),(568,1,1,'touch'),(35,1,1,'traditional'),(1073,1,1,'traveling,'),(5,1,1,'tshirt'),(859,1,1,'use'),(866,1,1,'used'),(849,1,1,'vector'),(218,1,1,'voice'),(217,1,1,'walls'),(642,1,1,'washable'),(38,1,1,'wear'),(54,1,1,'white'),(221,1,1,'will'),(869,1,1,'without'),(118,1,1,'women'),(229,1,1,'wooden'),(1072,1,1,'work,'),(1069,1,1,'write'),(1080,1,1,'writing!'),(206,1,1,'yet'),(1327,1,1,'you!'),(637,1,1,'zen'),(629,1,1,'zip'),(1353,1,2,'---'),(502,1,2,'043kg'),(159,1,2,'100%'),(1104,1,2,'120'),(1109,1,2,'16x22cm'),(493,1,2,'325ml'),(669,1,2,'32x32cm'),(284,1,2,'40x60cm'),(282,1,2,'60x90cm'),(681,1,2,'60°'),(283,1,2,'80x120cm'),(498,1,2,'82cm'),(500,1,2,'95cm'),(508,1,2,'accessories'),(595,1,2,'add'),(330,1,2,'adventure'),(260,1,2,'aesthethic,'),(671,1,2,'armchair'),(279,1,2,'art'),(676,1,2,'atmosphere'),(668,1,2,'back'),(738,1,2,'bear'),(672,1,2,'bed'),(331,1,2,'begins'),(246,1,2,'best'),(1126,1,2,'binding'),(110,1,2,'black'),(737,1,2,'brown'),(161,1,2,'brushed'),(1108,1,2,'cardboard'),(491,1,2,'ceramic'),(1352,1,2,'characters:'),(94,1,2,'chino'),(1344,1,2,'choice'),(85,1,2,'classic'),(543,1,2,'coffee'),(83,1,2,'collection'),(102,1,2,'color'),(104,1,2,'color,'),(87,1,2,'colorful'),(490,1,2,'come'),(256,1,2,'come!'),(248,1,2,'come\''),(164,1,2,'comfort'),(888,1,2,'commercial'),(545,1,2,'conquer'),(281,1,2,'corner'),(73,1,2,'cotton'),(160,1,2,'cotton,'),(665,1,2,'cover'),(673,1,2,'create'),(893,1,2,'creative'),(542,1,2,'cup'),(78,1,2,'curiosity'),(663,1,2,'cushion'),(892,1,2,'custom'),(1341,1,2,'customizable'),(1342,1,2,'customize'),(419,1,2,'day'),(546,1,2,'day!'),(76,1,2,'delicacy,'),(61,1,2,'demo'),(274,1,2,'depth'),(108,1,2,'design'),(81,1,2,'design\''),(265,1,2,'desk'),(499,1,2,'diameter'),(503,1,2,'dishwasher'),(505,1,2,'dishwasher-proo'),(506,1,2,'dishwasherproof'),(1130,1,2,'doted'),(1124,1,2,'double'),(884,1,2,'download'),(1116,1,2,'endearing'),(77,1,2,'evokes'),(101,1,2,'exceptional'),(69,1,2,'extra'),(84,1,2,'features'),(1120,1,2,'feel'),(682,1,2,'filling'),(332,1,2,'finish'),(63,1,2,'fit,'),(882,1,2,'format:'),(662,1,2,'fox'),(271,1,2,'frame'),(249,1,2,'framed'),(257,1,2,'give'),(418,1,2,'good'),(280,1,2,'graphic'),(881,1,2,'graphic,'),(880,1,2,'graphics'),(264,1,2,'great'),(1123,1,2,'gsm'),(105,1,2,'guaranteed'),(1106,1,2,'hard'),(501,1,2,'height'),(507,1,2,'home'),(56,1,2,'hummingbird'),(683,1,2,'hypoallergenic'),(1113,1,2,'ideas'),(895,1,2,'illustration'),(1112,1,2,'ingenious'),(162,1,2,'inner'),(89,1,2,'inspired'),(677,1,2,'inspires'),(666,1,2,'invisible'),(1348,1,2,'it\'s'),(91,1,2,'japanese'),(95,1,2,'jeans'),(79,1,2,'joy'),(75,1,2,'lightness'),(1121,1,2,'like'),(901,1,2,'limitation'),(70,1,2,'long'),(263,1,2,'look'),(679,1,2,'machine'),(68,1,2,'made'),(1119,1,2,'make'),(1117,1,2,'manufacturing'),(252,1,2,'matt'),(1350,1,2,'maximum'),(107,1,2,'men'),(1346,1,2,'message,'),(674,1,2,'modern'),(598,1,2,'mood!'),(1345,1,2,'mood,'),(597,1,2,'morning'),(661,1,2,'mountain'),(489,1,2,'mug'),(492,1,2,'mug,'),(65,1,2,'neckline,'),(887,1,2,'non'),(890,1,2,'non-commercial'),(891,1,2,'noncommercial'),(1103,1,2,'notebook'),(1351,1,2,'number'),(268,1,2,'office'),(266,1,2,'open'),(275,1,2,'open-space'),(276,1,2,'openspace'),(261,1,2,'optimistic'),(1110,1,2,'option'),(92,1,2,'origamis'),(106,1,2,'overtime'),(1048,1,2,'pack'),(1132,1,2,'pages'),(269,1,2,'painted'),(253,1,2,'paper'),(273,1,2,'partout'),(272,1,2,'passe'),(277,1,2,'passe-partout'),(278,1,2,'passepartout'),(88,1,2,'patterns,'),(885,1,2,'personal,'),(72,1,2,'pima'),(1128,1,2,'plain'),(684,1,2,'polyester'),(82,1,2,'polyfaune'),(496,1,2,'positive'),(250,1,2,'poster'),(57,1,2,'printed'),(98,1,2,'printing'),(886,1,2,'private'),(99,1,2,'process'),(86,1,2,'products'),(894,1,2,'project?'),(504,1,2,'proof'),(100,1,2,'provides'),(897,1,2,'purpose'),(1118,1,2,'quality'),(1347,1,2,'quote'),(1107,1,2,'recycled'),(62,1,2,'regular'),(678,1,2,'relaxation'),(664,1,2,'removable'),(103,1,2,'rendering'),(495,1,2,'right'),(251,1,2,'rigid'),(64,1,2,'round'),(1131,1,2,'ruled'),(544,1,2,'set'),(1105,1,2,'sheets'),(58,1,2,'shirt'),(66,1,2,'short'),(163,1,2,'side'),(900,1,2,'size'),(67,1,2,'sleeves'),(254,1,2,'smooth'),(670,1,2,'sofa,'),(267,1,2,'space'),(1125,1,2,'spiral'),(1129,1,2,'squared'),(71,1,2,'staple'),(494,1,2,'start'),(1127,1,2,'stationery'),(80,1,2,'studio'),(96,1,2,'sublimation'),(898,1,2,'support,'),(255,1,2,'surface'),(883,1,2,'svg'),(158,1,2,'sweater'),(74,1,2,'symbol'),(59,1,2,'t-shirt'),(1343,1,2,'text'),(97,1,2,'textile'),(497,1,2,'thought'),(417,1,2,'today'),(596,1,2,'touch'),(90,1,2,'traditional'),(1115,1,2,'traveling,'),(60,1,2,'tshirt'),(889,1,2,'use'),(896,1,2,'used'),(879,1,2,'vector'),(259,1,2,'voice'),(258,1,2,'walls'),(680,1,2,'washable'),(93,1,2,'wear'),(109,1,2,'white'),(262,1,2,'will'),(899,1,2,'without'),(165,1,2,'women'),(270,1,2,'wooden'),(1114,1,2,'work,'),(1111,1,2,'write'),(1122,1,2,'writing!'),(247,1,2,'yet'),(1349,1,2,'you!'),(675,1,2,'zen'),(667,1,2,'zip');
/*!40000 ALTER TABLE `ubwbh_search_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_shipment`
--

DROP TABLE IF EXISTS `ubwbh_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_shipment` (
  `id_shipment` int(10) NOT NULL AUTO_INCREMENT,
  `id_order` int(10) NOT NULL,
  `id_carrier` int(10) NOT NULL,
  `id_delivery_address` int(10) DEFAULT NULL,
  `shipping_cost_tax_excl` decimal(20,6) DEFAULT 0.000000,
  `shipping_cost_tax_incl` decimal(20,6) DEFAULT 0.000000,
  `packed_at` datetime DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_shipment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_shipment`
--

LOCK TABLES `ubwbh_shipment` WRITE;
/*!40000 ALTER TABLE `ubwbh_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_shipment_product`
--

DROP TABLE IF EXISTS `ubwbh_shipment_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_shipment_product` (
  `id_shipment_product` int(11) NOT NULL AUTO_INCREMENT,
  `id_shipment` int(10) NOT NULL,
  `id_order_detail` int(10) NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_shipment_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_shipment_product`
--

LOCK TABLES `ubwbh_shipment_product` WRITE;
/*!40000 ALTER TABLE `ubwbh_shipment_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_shipment_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_shop`
--

DROP TABLE IF EXISTS `ubwbh_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_shop` (
  `id_shop` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `color` varchar(50) NOT NULL,
  `id_category` int(11) NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_shop`),
  KEY `IDX_CBDFBB9EF5C9E40` (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_shop`
--

LOCK TABLES `ubwbh_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_shop` VALUES (1,1,'Bloowing Flower','',2,'bloowing_theme',1,0);
/*!40000 ALTER TABLE `ubwbh_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_shop_group`
--

DROP TABLE IF EXISTS `ubwbh_shop_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_shop_group` (
  `id_shop_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `color` varchar(50) NOT NULL,
  `share_customer` tinyint(1) NOT NULL,
  `share_order` tinyint(1) NOT NULL,
  `share_stock` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_shop_group`
--

LOCK TABLES `ubwbh_shop_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_shop_group` DISABLE KEYS */;
INSERT INTO `ubwbh_shop_group` VALUES (1,'Default','',0,0,0,1,0);
/*!40000 ALTER TABLE `ubwbh_shop_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_shop_url`
--

DROP TABLE IF EXISTS `ubwbh_shop_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_shop_url` (
  `id_shop_url` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `domain` varchar(255) NOT NULL,
  `domain_ssl` varchar(255) NOT NULL,
  `physical_uri` varchar(64) NOT NULL,
  `virtual_uri` varchar(64) NOT NULL,
  `main` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_shop_url`),
  UNIQUE KEY `full_shop_url` (`domain`,`physical_uri`,`virtual_uri`),
  UNIQUE KEY `full_shop_url_ssl` (`domain_ssl`,`physical_uri`,`virtual_uri`),
  KEY `id_shop` (`id_shop`,`main`),
  KEY `IDX_279F19DA274A50A0` (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_shop_url`
--

LOCK TABLES `ubwbh_shop_url` WRITE;
/*!40000 ALTER TABLE `ubwbh_shop_url` DISABLE KEYS */;
INSERT INTO `ubwbh_shop_url` VALUES (1,1,'localhost','localhost','/bloowing_flower/','',1,1);
/*!40000 ALTER TABLE `ubwbh_shop_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_smarty_cache`
--

DROP TABLE IF EXISTS `ubwbh_smarty_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_smarty_cache` (
  `id_smarty_cache` char(40) NOT NULL,
  `name` char(40) NOT NULL,
  `cache_id` varchar(254) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longtext NOT NULL,
  PRIMARY KEY (`id_smarty_cache`),
  KEY `name` (`name`),
  KEY `cache_id` (`cache_id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_smarty_cache`
--

LOCK TABLES `ubwbh_smarty_cache` WRITE;
/*!40000 ALTER TABLE `ubwbh_smarty_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_smarty_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_smarty_last_flush`
--

DROP TABLE IF EXISTS `ubwbh_smarty_last_flush`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_smarty_last_flush` (
  `type` enum('compile','template') NOT NULL,
  `last_flush` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_smarty_last_flush`
--

LOCK TABLES `ubwbh_smarty_last_flush` WRITE;
/*!40000 ALTER TABLE `ubwbh_smarty_last_flush` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_smarty_last_flush` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_smarty_lazy_cache`
--

DROP TABLE IF EXISTS `ubwbh_smarty_lazy_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_smarty_lazy_cache` (
  `template_hash` varchar(32) NOT NULL DEFAULT '',
  `cache_id` varchar(191) NOT NULL DEFAULT '',
  `compile_id` varchar(32) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`template_hash`,`cache_id`,`compile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_smarty_lazy_cache`
--

LOCK TABLES `ubwbh_smarty_lazy_cache` WRITE;
/*!40000 ALTER TABLE `ubwbh_smarty_lazy_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_smarty_lazy_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_specific_price`
--

DROP TABLE IF EXISTS `ubwbh_specific_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_specific_price` (
  `id_specific_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule` int(11) unsigned NOT NULL,
  `id_cart` int(11) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_shop_group` int(11) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_tax` tinyint(1) NOT NULL DEFAULT 1,
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price`),
  UNIQUE KEY `id_product_2` (`id_product`,`id_product_attribute`,`id_customer`,`id_cart`,`from`,`to`,`id_shop`,`id_shop_group`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`id_specific_price_rule`),
  KEY `id_product` (`id_product`,`id_shop`,`id_currency`,`id_country`,`id_group`,`id_customer`,`from_quantity`,`from`,`to`),
  KEY `from_quantity` (`from_quantity`),
  KEY `id_specific_price_rule` (`id_specific_price_rule`),
  KEY `id_cart` (`id_cart`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_shop` (`id_shop`),
  KEY `id_customer` (`id_customer`),
  KEY `from` (`from`),
  KEY `to` (`to`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_specific_price`
--

LOCK TABLES `ubwbh_specific_price` WRITE;
/*!40000 ALTER TABLE `ubwbh_specific_price` DISABLE KEYS */;
INSERT INTO `ubwbh_specific_price` VALUES (1,0,0,1,0,0,0,0,0,0,0,-1.000000,1,0.200000,1,'percentage','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,0,0,2,0,0,0,0,0,0,0,-1.000000,1,0.200000,1,'percentage','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ubwbh_specific_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_specific_price_priority`
--

DROP TABLE IF EXISTS `ubwbh_specific_price_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_specific_price_priority` (
  `id_specific_price_priority` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `priority` varchar(80) NOT NULL,
  PRIMARY KEY (`id_specific_price_priority`,`id_product`),
  UNIQUE KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_specific_price_priority`
--

LOCK TABLES `ubwbh_specific_price_priority` WRITE;
/*!40000 ALTER TABLE `ubwbh_specific_price_priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_specific_price_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_specific_price_rule`
--

DROP TABLE IF EXISTS `ubwbh_specific_price_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_specific_price_rule` (
  `id_specific_price_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 1,
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_tax` tinyint(1) NOT NULL DEFAULT 1,
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price_rule`),
  KEY `id_product` (`id_shop`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`from`,`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_specific_price_rule`
--

LOCK TABLES `ubwbh_specific_price_rule` WRITE;
/*!40000 ALTER TABLE `ubwbh_specific_price_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_specific_price_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_specific_price_rule_condition`
--

DROP TABLE IF EXISTS `ubwbh_specific_price_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_specific_price_rule_condition` (
  `id_specific_price_rule_condition` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule_condition_group` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_specific_price_rule_condition`),
  KEY `id_specific_price_rule_condition_group` (`id_specific_price_rule_condition_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_specific_price_rule_condition`
--

LOCK TABLES `ubwbh_specific_price_rule_condition` WRITE;
/*!40000 ALTER TABLE `ubwbh_specific_price_rule_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_specific_price_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_specific_price_rule_condition_group`
--

DROP TABLE IF EXISTS `ubwbh_specific_price_rule_condition_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_specific_price_rule_condition_group` (
  `id_specific_price_rule_condition_group` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_specific_price_rule_condition_group`,`id_specific_price_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_specific_price_rule_condition_group`
--

LOCK TABLES `ubwbh_specific_price_rule_condition_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_specific_price_rule_condition_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_specific_price_rule_condition_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_state`
--

DROP TABLE IF EXISTS `ubwbh_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_state` (
  `id_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(11) unsigned NOT NULL,
  `id_zone` int(11) unsigned NOT NULL,
  `name` varchar(80) NOT NULL,
  `iso_code` varchar(7) NOT NULL,
  `tax_behavior` smallint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_state`),
  KEY `id_country` (`id_country`),
  KEY `name` (`name`),
  KEY `id_zone` (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_state`
--

LOCK TABLES `ubwbh_state` WRITE;
/*!40000 ALTER TABLE `ubwbh_state` DISABLE KEYS */;
INSERT INTO `ubwbh_state` VALUES (1,21,2,'AA','AA',0,1),(2,21,2,'AE','AE',0,1),(3,21,2,'AP','AP',0,1),(4,21,2,'Alabama','AL',0,1),(5,21,2,'Alaska','AK',0,1),(6,21,2,'Arizona','AZ',0,1),(7,21,2,'Arkansas','AR',0,1),(8,21,2,'California','CA',0,1),(9,21,2,'Colorado','CO',0,1),(10,21,2,'Connecticut','CT',0,1),(11,21,2,'Delaware','DE',0,1),(12,21,2,'Florida','FL',0,1),(13,21,2,'Georgia','GA',0,1),(14,21,2,'Hawaii','HI',0,1),(15,21,2,'Idaho','ID',0,1),(16,21,2,'Illinois','IL',0,1),(17,21,2,'Indiana','IN',0,1),(18,21,2,'Iowa','IA',0,1),(19,21,2,'Kansas','KS',0,1),(20,21,2,'Kentucky','KY',0,1),(21,21,2,'Louisiana','LA',0,1),(22,21,2,'Maine','ME',0,1),(23,21,2,'Maryland','MD',0,1),(24,21,2,'Massachusetts','MA',0,1),(25,21,2,'Michigan','MI',0,1),(26,21,2,'Minnesota','MN',0,1),(27,21,2,'Mississippi','MS',0,1),(28,21,2,'Missouri','MO',0,1),(29,21,2,'Montana','MT',0,1),(30,21,2,'Nebraska','NE',0,1),(31,21,2,'Nevada','NV',0,1),(32,21,2,'New Hampshire','NH',0,1),(33,21,2,'New Jersey','NJ',0,1),(34,21,2,'New Mexico','NM',0,1),(35,21,2,'New York','NY',0,1),(36,21,2,'North Carolina','NC',0,1),(37,21,2,'North Dakota','ND',0,1),(38,21,2,'Ohio','OH',0,1),(39,21,2,'Oklahoma','OK',0,1),(40,21,2,'Oregon','OR',0,1),(41,21,2,'Pennsylvania','PA',0,1),(42,21,2,'Rhode Island','RI',0,1),(43,21,2,'South Carolina','SC',0,1),(44,21,2,'South Dakota','SD',0,1),(45,21,2,'Tennessee','TN',0,1),(46,21,2,'Texas','TX',0,1),(47,21,2,'Utah','UT',0,1),(48,21,2,'Vermont','VT',0,1),(49,21,2,'Virginia','VA',0,1),(50,21,2,'Washington','WA',0,1),(51,21,2,'West Virginia','WV',0,1),(52,21,2,'Wisconsin','WI',0,1),(53,21,2,'Wyoming','WY',0,1),(54,21,2,'Puerto Rico','PR',0,1),(55,21,2,'US Virgin Islands','VI',0,1),(56,21,2,'District of Columbia','DC',0,1),(57,144,2,'Aguascalientes','AGU',0,1),(58,144,2,'Baja California','BCN',0,1),(59,144,2,'Baja California Sur','BCS',0,1),(60,144,2,'Campeche','CAM',0,1),(61,144,2,'Chiapas','CHP',0,1),(62,144,2,'Chihuahua','CHH',0,1),(63,144,2,'Ciudad de México','CMX',0,1),(64,144,2,'Coahuila','COA',0,1),(65,144,2,'Colima','COL',0,1),(66,144,2,'Durango','DUR',0,1),(67,144,2,'Guanajuato','GUA',0,1),(68,144,2,'Guerrero','GRO',0,1),(69,144,2,'Hidalgo','HID',0,1),(70,144,2,'Jalisco','JAL',0,1),(71,144,2,'Estado de México','MEX',0,1),(72,144,2,'Michoacán','MIC',0,1),(73,144,2,'Morelos','MOR',0,1),(74,144,2,'Nayarit','NAY',0,1),(75,144,2,'Nuevo León','NLE',0,1),(76,144,2,'Oaxaca','OAX',0,1),(77,144,2,'Puebla','PUE',0,1),(78,144,2,'Querétaro','QUE',0,1),(79,144,2,'Quintana Roo','ROO',0,1),(80,144,2,'San Luis Potosí','SLP',0,1),(81,144,2,'Sinaloa','SIN',0,1),(82,144,2,'Sonora','SON',0,1),(83,144,2,'Tabasco','TAB',0,1),(84,144,2,'Tamaulipas','TAM',0,1),(85,144,2,'Tlaxcala','TLA',0,1),(86,144,2,'Veracruz','VER',0,1),(87,144,2,'Yucatán','YUC',0,1),(88,144,2,'Zacatecas','ZAC',0,1),(89,4,2,'Ontario','ON',0,1),(90,4,2,'Quebec','QC',0,1),(91,4,2,'British Columbia','BC',0,1),(92,4,2,'Alberta','AB',0,1),(93,4,2,'Manitoba','MB',0,1),(94,4,2,'Saskatchewan','SK',0,1),(95,4,2,'Nova Scotia','NS',0,1),(96,4,2,'New Brunswick','NB',0,1),(97,4,2,'Newfoundland and Labrador','NL',0,1),(98,4,2,'Prince Edward Island','PE',0,1),(99,4,2,'Northwest Territories','NT',0,1),(100,4,2,'Yukon','YT',0,1),(101,4,2,'Nunavut','NU',0,1),(102,44,6,'Buenos Aires','B',0,1),(103,44,6,'Catamarca','K',0,1),(104,44,6,'Chaco','H',0,1),(105,44,6,'Chubut','U',0,1),(106,44,6,'Ciudad de Buenos Aires','C',0,1),(107,44,6,'Córdoba','X',0,1),(108,44,6,'Corrientes','W',0,1),(109,44,6,'Entre Ríos','E',0,1),(110,44,6,'Formosa','P',0,1),(111,44,6,'Jujuy','Y',0,1),(112,44,6,'La Pampa','L',0,1),(113,44,6,'La Rioja','F',0,1),(114,44,6,'Mendoza','M',0,1),(115,44,6,'Misiones','N',0,1),(116,44,6,'Neuquén','Q',0,1),(117,44,6,'Río Negro','R',0,1),(118,44,6,'Salta','A',0,1),(119,44,6,'San Juan','J',0,1),(120,44,6,'San Luis','D',0,1),(121,44,6,'Santa Cruz','Z',0,1),(122,44,6,'Santa Fe','S',0,1),(123,44,6,'Santiago del Estero','G',0,1),(124,44,6,'Tierra del Fuego','V',0,1),(125,44,6,'Tucumán','T',0,1),(126,10,1,'Agrigento','AG',0,1),(127,10,1,'Alessandria','AL',0,1),(128,10,1,'Ancona','AN',0,1),(129,10,1,'Aosta','AO',0,1),(130,10,1,'Arezzo','AR',0,1),(131,10,1,'Ascoli Piceno','AP',0,1),(132,10,1,'Asti','AT',0,1),(133,10,1,'Avellino','AV',0,1),(134,10,1,'Bari','BA',0,1),(135,10,1,'Barletta-Andria-Trani','BT',0,1),(136,10,1,'Belluno','BL',0,1),(137,10,1,'Benevento','BN',0,1),(138,10,1,'Bergamo','BG',0,1),(139,10,1,'Biella','BI',0,1),(140,10,1,'Bologna','BO',0,1),(141,10,1,'Bolzano','BZ',0,1),(142,10,1,'Brescia','BS',0,1),(143,10,1,'Brindisi','BR',0,1),(144,10,1,'Cagliari','CA',0,1),(145,10,1,'Caltanissetta','CL',0,1),(146,10,1,'Campobasso','CB',0,1),(147,10,1,'Carbonia-Iglesias','CI',0,1),(148,10,1,'Caserta','CE',0,1),(149,10,1,'Catania','CT',0,1),(150,10,1,'Catanzaro','CZ',0,1),(151,10,1,'Chieti','CH',0,1),(152,10,1,'Como','CO',0,1),(153,10,1,'Cosenza','CS',0,1),(154,10,1,'Cremona','CR',0,1),(155,10,1,'Crotone','KR',0,1),(156,10,1,'Cuneo','CN',0,1),(157,10,1,'Enna','EN',0,1),(158,10,1,'Fermo','FM',0,1),(159,10,1,'Ferrara','FE',0,1),(160,10,1,'Firenze','FI',0,1),(161,10,1,'Foggia','FG',0,1),(162,10,1,'Forlì-Cesena','FC',0,1),(163,10,1,'Frosinone','FR',0,1),(164,10,1,'Genova','GE',0,1),(165,10,1,'Gorizia','GO',0,1),(166,10,1,'Grosseto','GR',0,1),(167,10,1,'Imperia','IM',0,1),(168,10,1,'Isernia','IS',0,1),(169,10,1,'L\'Aquila','AQ',0,1),(170,10,1,'La Spezia','SP',0,1),(171,10,1,'Latina','LT',0,1),(172,10,1,'Lecce','LE',0,1),(173,10,1,'Lecco','LC',0,1),(174,10,1,'Livorno','LI',0,1),(175,10,1,'Lodi','LO',0,1),(176,10,1,'Lucca','LU',0,1),(177,10,1,'Macerata','MC',0,1),(178,10,1,'Mantova','MN',0,1),(179,10,1,'Massa','MS',0,1),(180,10,1,'Matera','MT',0,1),(181,10,1,'Medio Campidano','VS',0,1),(182,10,1,'Messina','ME',0,1),(183,10,1,'Milano','MI',0,1),(184,10,1,'Modena','MO',0,1),(185,10,1,'Monza e della Brianza','MB',0,1),(186,10,1,'Napoli','NA',0,1),(187,10,1,'Novara','NO',0,1),(188,10,1,'Nuoro','NU',0,1),(189,10,1,'Ogliastra','OG',0,1),(190,10,1,'Olbia-Tempio','OT',0,1),(191,10,1,'Oristano','OR',0,1),(192,10,1,'Padova','PD',0,1),(193,10,1,'Palermo','PA',0,1),(194,10,1,'Parma','PR',0,1),(195,10,1,'Pavia','PV',0,1),(196,10,1,'Perugia','PG',0,1),(197,10,1,'Pesaro-Urbino','PU',0,1),(198,10,1,'Pescara','PE',0,1),(199,10,1,'Piacenza','PC',0,1),(200,10,1,'Pisa','PI',0,1),(201,10,1,'Pistoia','PT',0,1),(202,10,1,'Pordenone','PN',0,1),(203,10,1,'Potenza','PZ',0,1),(204,10,1,'Prato','PO',0,1),(205,10,1,'Ragusa','RG',0,1),(206,10,1,'Ravenna','RA',0,1),(207,10,1,'Reggio Calabria','RC',0,1),(208,10,1,'Reggio Emilia','RE',0,1),(209,10,1,'Rieti','RI',0,1),(210,10,1,'Rimini','RN',0,1),(211,10,1,'Roma','RM',0,1),(212,10,1,'Rovigo','RO',0,1),(213,10,1,'Salerno','SA',0,1),(214,10,1,'Sassari','SS',0,1),(215,10,1,'Savona','SV',0,1),(216,10,1,'Siena','SI',0,1),(217,10,1,'Siracusa','SR',0,1),(218,10,1,'Sondrio','SO',0,1),(219,10,1,'Taranto','TA',0,1),(220,10,1,'Teramo','TE',0,1),(221,10,1,'Terni','TR',0,1),(222,10,1,'Torino','TO',0,1),(223,10,1,'Trapani','TP',0,1),(224,10,1,'Trento','TN',0,1),(225,10,1,'Treviso','TV',0,1),(226,10,1,'Trieste','TS',0,1),(227,10,1,'Udine','UD',0,1),(228,10,1,'Varese','VA',0,1),(229,10,1,'Venezia','VE',0,1),(230,10,1,'Verbano-Cusio-Ossola','VB',0,1),(231,10,1,'Vercelli','VC',0,1),(232,10,1,'Verona','VR',0,1),(233,10,1,'Vibo Valentia','VV',0,1),(234,10,1,'Vicenza','VI',0,1),(235,10,1,'Viterbo','VT',0,1),(236,110,3,'Aceh','ID-AC',0,1),(237,110,3,'Bali','ID-BA',0,1),(238,110,3,'Banten','ID-BT',0,1),(239,110,3,'Bengkulu','ID-BE',0,1),(240,110,3,'Gorontalo','ID-GO',0,1),(241,110,3,'Jakarta','ID-JK',0,1),(242,110,3,'Jambi','ID-JA',0,1),(243,110,3,'Jawa Barat','ID-JB',0,1),(244,110,3,'Jawa Tengah','ID-JT',0,1),(245,110,3,'Jawa Timur','ID-JI',0,1),(246,110,3,'Kalimantan Barat','ID-KB',0,1),(247,110,3,'Kalimantan Selatan','ID-KS',0,1),(248,110,3,'Kalimantan Tengah','ID-KT',0,1),(249,110,3,'Kalimantan Timur','ID-KI',0,1),(250,110,3,'Kalimantan Utara','ID-KU',0,1),(251,110,3,'Kepulauan Bangka Belitug','ID-BB',0,1),(252,110,3,'Kepulauan Riau','ID-KR',0,1),(253,110,3,'Lampung','ID-LA',0,1),(254,110,3,'Maluku','ID-MA',0,1),(255,110,3,'Maluku Utara','ID-MU',0,1),(256,110,3,'Nusa Tengara Barat','ID-NB',0,1),(257,110,3,'Nusa Tenggara Timur','ID-NT',0,1),(258,110,3,'Papua','ID-PA',0,1),(259,110,3,'Papua Barat','ID-PB',0,1),(260,110,3,'Riau','ID-RI',0,1),(261,110,3,'Sulawesi Barat','ID-SR',0,1),(262,110,3,'Sulawesi Selatan','ID-SN',0,1),(263,110,3,'Sulawesi Tengah','ID-ST',0,1),(264,110,3,'Sulawesi Tenggara','ID-SG',0,1),(265,110,3,'Sulawesi Utara','ID-SA',0,1),(266,110,3,'Sumatera Barat','ID-SB',0,1),(267,110,3,'Sumatera Selatan','ID-SS',0,1),(268,110,3,'Sumatera Utara','ID-SU',0,1),(269,110,3,'Yogyakarta','ID-YO',0,1),(270,11,3,'Aichi','23',0,1),(271,11,3,'Akita','05',0,1),(272,11,3,'Aomori','02',0,1),(273,11,3,'Chiba','12',0,1),(274,11,3,'Ehime','38',0,1),(275,11,3,'Fukui','18',0,1),(276,11,3,'Fukuoka','40',0,1),(277,11,3,'Fukushima','07',0,1),(278,11,3,'Gifu','21',0,1),(279,11,3,'Gunma','10',0,1),(280,11,3,'Hiroshima','34',0,1),(281,11,3,'Hokkaido','01',0,1),(282,11,3,'Hyogo','28',0,1),(283,11,3,'Ibaraki','08',0,1),(284,11,3,'Ishikawa','17',0,1),(285,11,3,'Iwate','03',0,1),(286,11,3,'Kagawa','37',0,1),(287,11,3,'Kagoshima','46',0,1),(288,11,3,'Kanagawa','14',0,1),(289,11,3,'Kochi','39',0,1),(290,11,3,'Kumamoto','43',0,1),(291,11,3,'Kyoto','26',0,1),(292,11,3,'Mie','24',0,1),(293,11,3,'Miyagi','04',0,1),(294,11,3,'Miyazaki','45',0,1),(295,11,3,'Nagano','20',0,1),(296,11,3,'Nagasaki','42',0,1),(297,11,3,'Nara','29',0,1),(298,11,3,'Niigata','15',0,1),(299,11,3,'Oita','44',0,1),(300,11,3,'Okayama','33',0,1),(301,11,3,'Okinawa','47',0,1),(302,11,3,'Osaka','27',0,1),(303,11,3,'Saga','41',0,1),(304,11,3,'Saitama','11',0,1),(305,11,3,'Shiga','25',0,1),(306,11,3,'Shimane','32',0,1),(307,11,3,'Shizuoka','22',0,1),(308,11,3,'Tochigi','09',0,1),(309,11,3,'Tokushima','36',0,1),(310,11,3,'Tokyo','13',0,1),(311,11,3,'Tottori','31',0,1),(312,11,3,'Toyama','16',0,1),(313,11,3,'Wakayama','30',0,1),(314,11,3,'Yamagata','06',0,1),(315,11,3,'Yamaguchi','35',0,1),(316,11,3,'Yamanashi','19',0,1),(317,24,5,'Australian Capital Territory','ACT',0,1),(318,24,5,'New South Wales','NSW',0,1),(319,24,5,'Northern Territory','NT',0,1),(320,24,5,'Queensland','QLD',0,1),(321,24,5,'South Australia','SA',0,1),(322,24,5,'Tasmania','TAS',0,1),(323,24,5,'Victoria','VIC',0,1),(324,24,5,'Western Australia','WA',0,1),(325,109,3,'Andhra Pradesh','AP',0,1),(326,109,3,'Arunachal Pradesh','AR',0,1),(327,109,3,'Assam','AS',0,1),(328,109,3,'Bihar','BR',0,1),(329,109,3,'Chhattisgarh','CT',0,1),(330,109,3,'Goa','GA',0,1),(331,109,3,'Gujarat','GJ',0,1),(332,109,3,'Haryana','HR',0,1),(333,109,3,'Himachal Pradesh','HP',0,1),(334,109,3,'Jharkhand','JH',0,1),(335,109,3,'Karnataka','KA',0,1),(336,109,3,'Kerala','KL',0,1),(337,109,3,'Madhya Pradesh','MP',0,1),(338,109,3,'Maharashtra','MH',0,1),(339,109,3,'Manipur','MN',0,1),(340,109,3,'Meghalaya','ML',0,1),(341,109,3,'Mizoram','MZ',0,1),(342,109,3,'Nagaland','NL',0,1),(343,109,3,'Odisha','OR',0,1),(344,109,3,'Punjab','PB',0,1),(345,109,3,'Rajasthan','RJ',0,1),(346,109,3,'Sikkim','SK',0,1),(347,109,3,'Tamil Nadu','TN',0,1),(348,109,3,'Telangana','TG',0,1),(349,109,3,'Tripura','TR',0,1),(350,109,3,'Uttar Pradesh','UP',0,1),(351,109,3,'Uttarakhand','UT',0,1),(352,109,3,'West Bengal','WB',0,1);
/*!40000 ALTER TABLE `ubwbh_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_statssearch`
--

DROP TABLE IF EXISTS `ubwbh_statssearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_statssearch` (
  `id_statssearch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT 1,
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT 1,
  `keywords` varchar(255) NOT NULL,
  `results` int(6) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_statssearch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_statssearch`
--

LOCK TABLES `ubwbh_statssearch` WRITE;
/*!40000 ALTER TABLE `ubwbh_statssearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_statssearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_stock`
--

DROP TABLE IF EXISTS `ubwbh_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_stock` (
  `id_stock` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_warehouse` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `reference` varchar(64) NOT NULL,
  `ean13` varchar(20) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `mpn` varchar(40) DEFAULT NULL,
  `physical_quantity` int(11) unsigned NOT NULL,
  `usable_quantity` int(11) unsigned NOT NULL,
  `price_te` decimal(20,6) DEFAULT 0.000000,
  PRIMARY KEY (`id_stock`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_stock`
--

LOCK TABLES `ubwbh_stock` WRITE;
/*!40000 ALTER TABLE `ubwbh_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_stock_available`
--

DROP TABLE IF EXISTS `ubwbh_stock_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_stock_available` (
  `id_stock_available` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `id_shop_group` int(11) unsigned NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT 0,
  `physical_quantity` int(11) NOT NULL DEFAULT 0,
  `reserved_quantity` int(11) NOT NULL DEFAULT 0,
  `depends_on_stock` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `out_of_stock` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `location` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_stock_available`),
  UNIQUE KEY `product_sqlstock` (`id_product`,`id_product_attribute`,`id_shop`,`id_shop_group`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_stock_available`
--

LOCK TABLES `ubwbh_stock_available` WRITE;
/*!40000 ALTER TABLE `ubwbh_stock_available` DISABLE KEYS */;
INSERT INTO `ubwbh_stock_available` VALUES (1,1,0,1,0,2400,0,0,0,2,''),(2,2,0,1,0,2100,0,0,0,2,''),(3,3,0,1,0,1500,0,0,0,2,''),(4,4,0,1,0,1500,0,0,0,2,''),(5,5,0,1,0,900,0,0,0,2,''),(6,6,0,1,0,300,0,0,0,2,''),(7,7,0,1,0,300,0,0,0,2,''),(8,8,0,1,0,300,0,0,0,2,''),(9,9,0,1,0,600,0,0,0,2,''),(10,10,0,1,0,600,0,0,0,2,''),(11,11,0,1,0,600,0,0,0,2,''),(12,12,0,1,0,300,0,0,0,1,''),(13,13,0,1,0,300,0,0,0,1,''),(14,14,0,1,0,300,0,0,0,1,''),(15,15,0,1,0,100,0,0,0,2,''),(16,16,0,1,0,1200,0,0,0,2,''),(17,17,0,1,0,1200,0,0,0,2,''),(18,18,0,1,0,1200,0,0,0,2,''),(19,19,0,1,0,300,0,0,0,2,''),(20,1,1,1,0,300,0,0,0,2,''),(21,1,2,1,0,300,0,0,0,2,''),(22,1,3,1,0,300,0,0,0,2,''),(23,1,4,1,0,300,0,0,0,2,''),(24,1,5,1,0,300,0,0,0,2,''),(25,1,6,1,0,300,0,0,0,2,''),(26,1,7,1,0,300,0,0,0,2,''),(27,1,8,1,0,300,0,0,0,2,''),(28,2,9,1,0,1200,0,0,0,2,''),(29,2,10,1,0,300,0,0,0,2,''),(30,2,11,1,0,300,0,0,0,2,''),(31,2,12,1,0,300,0,0,0,2,''),(32,3,13,1,0,900,0,0,0,2,''),(33,3,14,1,0,300,0,0,0,2,''),(34,3,15,1,0,300,0,0,0,2,''),(35,4,16,1,0,900,0,0,0,2,''),(36,4,17,1,0,300,0,0,0,2,''),(37,4,18,1,0,300,0,0,0,2,''),(38,5,19,1,0,300,0,0,0,2,''),(39,5,20,1,0,300,0,0,0,2,''),(40,5,21,1,0,300,0,0,0,2,''),(41,9,22,1,0,300,0,0,0,2,''),(42,9,23,1,0,300,0,0,0,2,''),(43,10,24,1,0,300,0,0,0,2,''),(44,10,25,1,0,300,0,0,0,2,''),(45,11,26,1,0,300,0,0,0,2,''),(46,11,27,1,0,300,0,0,0,2,''),(47,16,28,1,0,300,0,0,0,2,''),(48,16,29,1,0,300,0,0,0,2,''),(49,16,30,1,0,300,0,0,0,2,''),(50,16,31,1,0,300,0,0,0,2,''),(51,17,32,1,0,300,0,0,0,2,''),(52,17,33,1,0,300,0,0,0,2,''),(53,17,34,1,0,300,0,0,0,2,''),(54,17,35,1,0,300,0,0,0,2,''),(55,18,36,1,0,300,0,0,0,2,''),(56,18,37,1,0,300,0,0,0,2,''),(57,18,38,1,0,300,0,0,0,2,''),(58,18,39,1,0,300,0,0,0,2,'');
/*!40000 ALTER TABLE `ubwbh_stock_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_stock_mvt`
--

DROP TABLE IF EXISTS `ubwbh_stock_mvt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_stock_mvt` (
  `id_stock_mvt` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_stock` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_supply_order` int(11) DEFAULT 0,
  `id_stock_mvt_reason` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `employee_lastname` varchar(255) DEFAULT NULL,
  `employee_firstname` varchar(255) DEFAULT NULL,
  `physical_quantity` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `sign` smallint(6) NOT NULL DEFAULT 1,
  `price_te` decimal(20,6) DEFAULT 0.000000,
  `last_wa` decimal(20,6) DEFAULT 0.000000,
  `current_wa` decimal(20,6) DEFAULT 0.000000,
  `referer` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_stock_mvt`),
  KEY `id_stock` (`id_stock`),
  KEY `id_stock_mvt_reason` (`id_stock_mvt_reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_stock_mvt`
--

LOCK TABLES `ubwbh_stock_mvt` WRITE;
/*!40000 ALTER TABLE `ubwbh_stock_mvt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_stock_mvt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_stock_mvt_reason`
--

DROP TABLE IF EXISTS `ubwbh_stock_mvt_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_stock_mvt_reason` (
  `id_stock_mvt_reason` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sign` tinyint(1) NOT NULL DEFAULT 1,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stock_mvt_reason`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_stock_mvt_reason`
--

LOCK TABLES `ubwbh_stock_mvt_reason` WRITE;
/*!40000 ALTER TABLE `ubwbh_stock_mvt_reason` DISABLE KEYS */;
INSERT INTO `ubwbh_stock_mvt_reason` VALUES (1,-1,'2026-11-23 15:01:18','2026-11-23 15:01:18',0),(2,1,'2026-11-23 15:01:18','2026-11-23 15:01:18',0),(3,1,'2026-11-23 15:01:18','2026-11-23 15:01:18',0),(4,1,'2026-11-23 15:01:18','2026-11-23 15:01:18',0),(5,-1,'2026-11-23 15:01:18','2026-11-23 15:01:18',0);
/*!40000 ALTER TABLE `ubwbh_stock_mvt_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_stock_mvt_reason_lang`
--

DROP TABLE IF EXISTS `ubwbh_stock_mvt_reason_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_stock_mvt_reason_lang` (
  `id_stock_mvt_reason` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_stock_mvt_reason`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_stock_mvt_reason_lang`
--

LOCK TABLES `ubwbh_stock_mvt_reason_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_stock_mvt_reason_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_stock_mvt_reason_lang` VALUES (1,1,'Customer Order'),(1,2,'Order dari pelanggan'),(2,1,'Customer Order'),(2,2,'Order dari pelanggan'),(3,1,'Product return'),(3,2,'Retur Produk'),(4,1,'Employee Edition'),(4,2,'Edisi Karyawan'),(5,1,'Employee Edition'),(5,2,'Edisi Karyawan');
/*!40000 ALTER TABLE `ubwbh_stock_mvt_reason_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_store`
--

DROP TABLE IF EXISTS `ubwbh_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_store` (
  `id_store` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `postcode` varchar(12) NOT NULL,
  `latitude` decimal(13,8) DEFAULT NULL,
  `longitude` decimal(13,8) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_store`
--

LOCK TABLES `ubwbh_store` WRITE;
/*!40000 ALTER TABLE `ubwbh_store` DISABLE KEYS */;
INSERT INTO `ubwbh_store` VALUES (1,21,12,'Miami','33135',25.76500500,-80.24379700,'','','',1,'2026-11-23 15:08:52','2026-11-23 15:08:52'),(2,21,12,'Miami','33304',26.13793600,-80.13943500,'','','',1,'2026-11-23 15:08:52','2026-11-23 15:08:52'),(3,21,12,'Miami','33026',26.00998700,-80.29447200,'','','',1,'2026-11-23 15:08:52','2026-11-23 15:08:52'),(4,21,12,'Miami','33133',25.73629600,-80.24479700,'','','',1,'2026-11-23 15:08:52','2026-11-23 15:08:52'),(5,21,12,'Miami','33181',25.88674000,-80.16329200,'','','',1,'2026-11-23 15:08:52','2026-11-23 15:08:52');
/*!40000 ALTER TABLE `ubwbh_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_store_lang`
--

DROP TABLE IF EXISTS `ubwbh_store_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_store_lang` (
  `id_store` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `hours` mediumtext DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id_store`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_store_lang`
--

LOCK TABLES `ubwbh_store_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_store_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_store_lang` VALUES (1,1,'Dade County','3030 SW 8th St Miami','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(1,2,'Dade County','3030 SW 8th St Miami','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(2,1,'E Fort Lauderdale','1000 Northeast 4th Ave Fort Lauderdale','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(2,2,'E Fort Lauderdale','1000 Northeast 4th Ave Fort Lauderdale','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(3,1,'Pembroke Pines','11001 Pines Blvd Pembroke Pines','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(3,2,'Pembroke Pines','11001 Pines Blvd Pembroke Pines','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(4,1,'Coconut Grove','2999 SW 32nd Avenue','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(4,2,'Coconut Grove','2999 SW 32nd Avenue','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(5,1,'N Miami/Biscayne','12055 Biscayne Blvd','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]',''),(5,2,'N Miami/Biscayne','12055 Biscayne Blvd','',' [[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"09:00AM - 07:00PM\"],[\"10:00AM - 04:00PM\"],[\"10:00AM - 04:00PM\"]]','');
/*!40000 ALTER TABLE `ubwbh_store_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_store_shop`
--

DROP TABLE IF EXISTS `ubwbh_store_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_store_shop` (
  `id_store` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_store`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_store_shop`
--

LOCK TABLES `ubwbh_store_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_store_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_store_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `ubwbh_store_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supplier`
--

DROP TABLE IF EXISTS `ubwbh_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supplier` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supplier`
--

LOCK TABLES `ubwbh_supplier` WRITE;
/*!40000 ALTER TABLE `ubwbh_supplier` DISABLE KEYS */;
INSERT INTO `ubwbh_supplier` VALUES (1,'Fashion supplier','2026-11-23 15:08:46','2026-11-23 15:08:46',1),(2,'Accessories supplier','2026-11-23 15:08:46','2026-11-23 15:08:46',1);
/*!40000 ALTER TABLE `ubwbh_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supplier_lang`
--

DROP TABLE IF EXISTS `ubwbh_supplier_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supplier_lang` (
  `id_supplier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supplier_lang`
--

LOCK TABLES `ubwbh_supplier_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_supplier_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_supplier_lang` VALUES (1,1,'','',''),(1,2,'','',''),(2,1,'','',''),(2,2,'','','');
/*!40000 ALTER TABLE `ubwbh_supplier_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supplier_shop`
--

DROP TABLE IF EXISTS `ubwbh_supplier_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supplier_shop` (
  `id_supplier` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_supplier`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supplier_shop`
--

LOCK TABLES `ubwbh_supplier_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_supplier_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_supplier_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `ubwbh_supplier_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supply_order`
--

DROP TABLE IF EXISTS `ubwbh_supply_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supply_order` (
  `id_supply_order` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) unsigned NOT NULL,
  `supplier_name` varchar(64) NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `id_currency` int(11) unsigned NOT NULL,
  `id_ref_currency` int(11) unsigned NOT NULL,
  `reference` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `date_delivery_expected` datetime DEFAULT NULL,
  `total_te` decimal(20,6) DEFAULT 0.000000,
  `total_with_discount_te` decimal(20,6) DEFAULT 0.000000,
  `total_tax` decimal(20,6) DEFAULT 0.000000,
  `total_ti` decimal(20,6) DEFAULT 0.000000,
  `discount_rate` decimal(20,6) DEFAULT 0.000000,
  `discount_value_te` decimal(20,6) DEFAULT 0.000000,
  `is_template` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_supply_order`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supply_order`
--

LOCK TABLES `ubwbh_supply_order` WRITE;
/*!40000 ALTER TABLE `ubwbh_supply_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_supply_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supply_order_detail`
--

DROP TABLE IF EXISTS `ubwbh_supply_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supply_order_detail` (
  `id_supply_order_detail` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order` int(11) unsigned NOT NULL,
  `id_currency` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `reference` varchar(64) NOT NULL,
  `supplier_reference` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `ean13` varchar(20) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `mpn` varchar(40) DEFAULT NULL,
  `exchange_rate` decimal(20,6) DEFAULT 0.000000,
  `unit_price_te` decimal(20,6) DEFAULT 0.000000,
  `quantity_expected` int(11) unsigned NOT NULL,
  `quantity_received` int(11) unsigned NOT NULL,
  `price_te` decimal(20,6) DEFAULT 0.000000,
  `discount_rate` decimal(20,6) DEFAULT 0.000000,
  `discount_value_te` decimal(20,6) DEFAULT 0.000000,
  `price_with_discount_te` decimal(20,6) DEFAULT 0.000000,
  `tax_rate` decimal(20,6) DEFAULT 0.000000,
  `tax_value` decimal(20,6) DEFAULT 0.000000,
  `price_ti` decimal(20,6) DEFAULT 0.000000,
  `tax_value_with_order_discount` decimal(20,6) DEFAULT 0.000000,
  `price_with_order_discount_te` decimal(20,6) DEFAULT 0.000000,
  PRIMARY KEY (`id_supply_order_detail`),
  KEY `id_supply_order` (`id_supply_order`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_product_product_attribute` (`id_product`,`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supply_order_detail`
--

LOCK TABLES `ubwbh_supply_order_detail` WRITE;
/*!40000 ALTER TABLE `ubwbh_supply_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_supply_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supply_order_history`
--

DROP TABLE IF EXISTS `ubwbh_supply_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supply_order_history` (
  `id_supply_order_history` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(255) DEFAULT '',
  `employee_firstname` varchar(255) DEFAULT '',
  `id_state` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_supply_order_history`),
  KEY `id_supply_order` (`id_supply_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_state` (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supply_order_history`
--

LOCK TABLES `ubwbh_supply_order_history` WRITE;
/*!40000 ALTER TABLE `ubwbh_supply_order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_supply_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supply_order_receipt_history`
--

DROP TABLE IF EXISTS `ubwbh_supply_order_receipt_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supply_order_receipt_history` (
  `id_supply_order_receipt_history` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order_detail` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(255) DEFAULT '',
  `employee_firstname` varchar(255) DEFAULT '',
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `quantity` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_supply_order_receipt_history`),
  KEY `id_supply_order_detail` (`id_supply_order_detail`),
  KEY `id_supply_order_state` (`id_supply_order_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supply_order_receipt_history`
--

LOCK TABLES `ubwbh_supply_order_receipt_history` WRITE;
/*!40000 ALTER TABLE `ubwbh_supply_order_receipt_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_supply_order_receipt_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supply_order_state`
--

DROP TABLE IF EXISTS `ubwbh_supply_order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supply_order_state` (
  `id_supply_order_state` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_note` tinyint(1) NOT NULL DEFAULT 0,
  `editable` tinyint(1) NOT NULL DEFAULT 0,
  `receipt_state` tinyint(1) NOT NULL DEFAULT 0,
  `pending_receipt` tinyint(1) NOT NULL DEFAULT 0,
  `enclosed` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_supply_order_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supply_order_state`
--

LOCK TABLES `ubwbh_supply_order_state` WRITE;
/*!40000 ALTER TABLE `ubwbh_supply_order_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_supply_order_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_supply_order_state_lang`
--

DROP TABLE IF EXISTS `ubwbh_supply_order_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_supply_order_state_lang` (
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_supply_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_supply_order_state_lang`
--

LOCK TABLES `ubwbh_supply_order_state_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_supply_order_state_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_supply_order_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tab`
--

DROP TABLE IF EXISTS `ubwbh_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tab` (
  `id_tab` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `module` varchar(64) DEFAULT NULL,
  `class_name` varchar(64) NOT NULL,
  `route_name` varchar(256) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `wording` varchar(255) DEFAULT NULL,
  `wording_domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tab`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tab`
--

LOCK TABLES `ubwbh_tab` WRITE;
/*!40000 ALTER TABLE `ubwbh_tab` DISABLE KEYS */;
INSERT INTO `ubwbh_tab` VALUES (1,145,0,'','AdminDashboard','',1,1,'trending_up','Dashboard','Admin.Navigation.Menu'),(2,0,2,NULL,'SELL','',1,1,'','Sell','Admin.Navigation.Menu'),(3,2,0,NULL,'AdminParentOrders','',1,1,'shopping_basket','Orders','Admin.Navigation.Menu'),(4,3,0,NULL,'AdminOrders','',1,1,'','Orders','Admin.Navigation.Menu'),(5,3,1,NULL,'AdminInvoices','',1,1,'','Invoices','Admin.Navigation.Menu'),(6,3,2,NULL,'AdminSlip','',1,1,'','Credit Slips','Admin.Navigation.Menu'),(7,3,3,NULL,'AdminDeliverySlip','',1,1,'','Delivery Slips','Admin.Navigation.Menu'),(8,3,4,NULL,'AdminCarts','',1,1,'','Shopping Carts','Admin.Navigation.Menu'),(9,2,1,NULL,'AdminCatalog','',1,1,'store','Catalog','Admin.Navigation.Menu'),(10,9,0,NULL,'AdminProducts','',1,1,'','Products','Admin.Navigation.Menu'),(11,9,1,NULL,'AdminCategories','',1,1,'','Categories','Admin.Navigation.Menu'),(12,9,2,NULL,'AdminTracking','',1,1,'','Monitoring','Admin.Navigation.Menu'),(13,9,3,NULL,'AdminParentAttributesGroups','',1,1,'','Attributes & Features','Admin.Navigation.Menu'),(14,13,0,NULL,'AdminAttributesGroups','',1,1,'','Attributes','Admin.Navigation.Menu'),(15,13,1,NULL,'AdminFeatures','',1,1,'','Features','Admin.Navigation.Menu'),(16,9,4,NULL,'AdminParentManufacturers','',1,1,'','Brands & Suppliers','Admin.Navigation.Menu'),(17,16,0,NULL,'AdminManufacturers','',1,1,'','Brands','Admin.Navigation.Menu'),(18,16,1,NULL,'AdminSuppliers','',1,1,'','Suppliers','Admin.Navigation.Menu'),(19,9,5,NULL,'AdminAttachments','',1,1,'','Files','Admin.Navigation.Menu'),(20,9,6,NULL,'AdminParentCartRules','',1,1,'','Discounts','Admin.Navigation.Menu'),(21,20,0,NULL,'AdminCartRules','',1,1,'','Cart Rules','Admin.Navigation.Menu'),(22,20,1,NULL,'AdminSpecificPriceRule','',1,1,'','Catalog Price Rules','Admin.Navigation.Menu'),(23,9,7,NULL,'AdminStockManagement','',1,1,'','Stock','Admin.Navigation.Menu'),(24,2,2,NULL,'AdminBusinessEntity','',0,1,'business_center','Business Entity','Admin.Navigation.Menu'),(25,24,0,NULL,'AdminBusinessEntities','admin_business_entities_list',0,1,'','Business Entities','Admin.Navigation.Menu'),(26,24,1,NULL,'AdminCustomersB2B','admin_customer_b2b_list',0,1,'','Customers B2B','Admin.Navigation.Menu'),(27,2,3,NULL,'AdminParentCustomer','',1,1,'account_circle','Customers','Admin.Navigation.Menu'),(28,27,0,NULL,'AdminCustomers','',1,1,'','Customers','Admin.Navigation.Menu'),(29,27,1,NULL,'AdminAddresses','',1,1,'','Addresses','Admin.Navigation.Menu'),(30,27,2,NULL,'AdminOutstanding','',0,1,'','Outstanding','Admin.Navigation.Menu'),(31,2,4,NULL,'AdminParentCustomerThreads','',1,1,'chat','Customer Service','Admin.Navigation.Menu'),(32,31,0,NULL,'AdminCustomerThreads','',1,1,'','Customer Service','Admin.Navigation.Menu'),(33,31,1,NULL,'AdminOrderMessage','',1,1,'','Order Messages','Admin.Navigation.Menu'),(34,31,2,NULL,'AdminReturn','',1,1,'','Merchandise Returns','Admin.Navigation.Menu'),(35,2,5,NULL,'AdminStats','',1,1,'assessment','Stats','Admin.Navigation.Menu'),(36,0,3,NULL,'IMPROVE','',1,1,'','Improve','Admin.Navigation.Menu'),(37,36,0,NULL,'AdminParentModulesSf','',1,1,'extension','Modules','Admin.Navigation.Menu'),(38,37,2,NULL,'AdminModulesSf','',1,1,'','Module Manager','Admin.Navigation.Menu'),(39,38,0,NULL,'AdminModulesManage','',1,1,'','Modules','Admin.Navigation.Menu'),(40,38,1,NULL,'AdminModulesNotifications','',1,1,'','Alerts','Admin.Navigation.Menu'),(41,38,2,NULL,'AdminModulesUpdates','',1,1,'','Updates','Admin.Navigation.Menu'),(42,36,1,NULL,'AdminParentThemes','',1,1,'desktop_mac','Design','Admin.Navigation.Menu'),(43,162,1,'','AdminThemes','',1,1,'','Theme & Logo','Admin.Navigation.Menu'),(44,42,3,NULL,'AdminParentMailTheme','',1,1,'','Email Theme','Admin.Navigation.Menu'),(45,44,0,NULL,'AdminMailTheme','',1,1,'','Email Theme','Admin.Navigation.Menu'),(46,42,4,NULL,'AdminCmsContent','',1,1,'','Pages','Admin.Navigation.Menu'),(47,42,5,NULL,'AdminModulesPositions','',1,1,'','Positions','Admin.Navigation.Menu'),(48,42,6,NULL,'AdminImages','',1,1,'','Image Settings','Admin.Navigation.Menu'),(49,36,2,NULL,'AdminParentShipping','',1,1,'local_shipping','Shipping','Admin.Navigation.Menu'),(50,49,0,NULL,'AdminCarriers','',1,1,'','Carriers','Admin.Navigation.Menu'),(51,49,1,NULL,'AdminShipping','',1,1,'','Preferences','Admin.Navigation.Menu'),(52,36,3,NULL,'AdminParentPayment','',1,1,'payment','Payment','Admin.Navigation.Menu'),(53,52,0,NULL,'AdminPayment','',1,1,'','Payment Methods','Admin.Navigation.Menu'),(54,52,1,NULL,'AdminPaymentPreferences','',1,1,'','Preferences','Admin.Navigation.Menu'),(55,36,4,NULL,'AdminInternational','',1,1,'language','International','Admin.Navigation.Menu'),(56,55,0,NULL,'AdminParentLocalization','',1,1,'','Localization','Admin.Navigation.Menu'),(57,56,0,NULL,'AdminLocalization','',1,1,'','Localization','Admin.Navigation.Menu'),(58,56,1,NULL,'AdminLanguages','',1,1,'','Languages','Admin.Navigation.Menu'),(59,56,2,NULL,'AdminCurrencies','',1,1,'','Currencies','Admin.Navigation.Menu'),(60,56,3,NULL,'AdminGeolocation','',1,1,'','Geolocation','Admin.Navigation.Menu'),(61,55,1,NULL,'AdminParentCountries','',1,1,'','Locations','Admin.Navigation.Menu'),(62,61,0,NULL,'AdminZones','',1,1,'','Zones','Admin.Navigation.Menu'),(63,61,1,NULL,'AdminCountries','',1,1,'','Countries','Admin.Navigation.Menu'),(64,61,2,NULL,'AdminStates','',1,1,'','States','Admin.Navigation.Menu'),(65,55,2,NULL,'AdminParentTaxes','',1,1,'','Taxes','Admin.Navigation.Menu'),(66,65,0,NULL,'AdminTaxes','',1,1,'','Taxes','Admin.Navigation.Menu'),(67,65,1,NULL,'AdminTaxRulesGroup','',1,1,'','Tax Rules','Admin.Navigation.Menu'),(68,55,3,NULL,'AdminTranslations','',1,1,'','Translations','Admin.Navigation.Menu'),(69,0,4,NULL,'CONFIGURE','',1,1,'','Configure','Admin.Navigation.Menu'),(70,69,0,NULL,'ShopParameters','',1,1,'settings','Shop Parameters','Admin.Navigation.Menu'),(71,70,0,NULL,'AdminParentPreferences','',1,1,'','General','Admin.Navigation.Menu'),(72,71,0,NULL,'AdminPreferences','',1,1,'','General','Admin.Navigation.Menu'),(73,71,1,NULL,'AdminMaintenance','',1,1,'','Maintenance','Admin.Navigation.Menu'),(74,70,1,NULL,'AdminParentOrderPreferences','',1,1,'','Order Settings','Admin.Navigation.Menu'),(75,74,0,NULL,'AdminOrderPreferences','',1,1,'','Order Settings','Admin.Navigation.Menu'),(76,74,1,NULL,'AdminStatuses','',1,1,'','Statuses','Admin.Navigation.Menu'),(77,70,2,NULL,'AdminPPreferences','',1,1,'','Product Settings','Admin.Navigation.Menu'),(78,70,3,NULL,'AdminParentCustomerPreferences','',1,1,'','Customer Settings','Admin.Navigation.Menu'),(79,78,0,NULL,'AdminCustomerPreferences','',1,1,'','Customer Settings','Admin.Navigation.Menu'),(80,78,1,NULL,'AdminGroups','',1,1,'','Groups','Admin.Navigation.Menu'),(81,78,2,NULL,'AdminGenders','',1,1,'','Titles','Admin.Navigation.Menu'),(82,70,4,NULL,'AdminParentStores','',1,1,'','Contact','Admin.Navigation.Menu'),(83,82,0,NULL,'AdminContacts','',1,1,'','Contacts','Admin.Navigation.Menu'),(84,82,1,NULL,'AdminStores','',1,1,'','Stores','Admin.Navigation.Menu'),(85,70,5,NULL,'AdminParentMeta','',1,1,'','Traffic & SEO','Admin.Navigation.Menu'),(86,85,0,NULL,'AdminMeta','',1,1,'','SEO & URLs','Admin.Navigation.Menu'),(87,85,1,NULL,'AdminSearchEngines','',1,1,'','Search Engines','Admin.Navigation.Menu'),(88,70,6,NULL,'AdminParentSearchConf','',1,1,'','Search','Admin.Navigation.Menu'),(89,88,0,NULL,'AdminSearchConf','',1,1,'','Search','Admin.Navigation.Menu'),(90,88,1,NULL,'AdminAliases','',1,1,'','Aliases','Admin.Navigation.Menu'),(91,88,2,NULL,'AdminTags','',1,1,'','Tags','Admin.Navigation.Menu'),(92,69,1,NULL,'AdminAdvancedParameters','',1,1,'settings_applications','Advanced Parameters','Admin.Navigation.Menu'),(93,92,0,NULL,'AdminInformation','',1,1,'','Information','Admin.Navigation.Menu'),(94,92,1,NULL,'AdminPerformance','',1,1,'','Performance','Admin.Navigation.Menu'),(95,92,2,NULL,'AdminAdminPreferences','',1,1,'','Administration','Admin.Navigation.Menu'),(96,92,3,NULL,'AdminEmails','',1,1,'','E-mail','Admin.Navigation.Menu'),(97,92,4,NULL,'AdminImport','',1,1,'','Import','Admin.Navigation.Menu'),(98,92,5,NULL,'AdminParentEmployees','',1,1,'','Team','Admin.Navigation.Menu'),(99,98,0,NULL,'AdminEmployees','',1,1,'','Employees','Admin.Navigation.Menu'),(100,98,1,NULL,'AdminProfiles','',1,1,'','Roles','Admin.Navigation.Menu'),(101,98,2,NULL,'AdminAccess','',1,1,'','Permissions','Admin.Navigation.Menu'),(102,92,6,NULL,'AdminParentRequestSql','',1,1,'','Database','Admin.Navigation.Menu'),(103,102,0,NULL,'AdminRequestSql','',1,1,'','SQL Manager','Admin.Navigation.Menu'),(104,102,1,NULL,'AdminBackup','',1,1,'','DB Backup','Admin.Navigation.Menu'),(105,92,7,NULL,'AdminLogs','',1,1,'','Logs','Admin.Navigation.Menu'),(106,92,8,NULL,'AdminWebservice','',1,1,'','Webservice','Admin.Navigation.Menu'),(107,92,9,NULL,'AdminExtraPropertyDefinitions','admin_extra_property_definitions_index',1,1,'','Extra Properties','Admin.Navigation.Menu'),(108,92,10,NULL,'AdminAdminAPI','admin_api_index',1,1,'','Admin API','Admin.Navigation.Menu'),(109,92,11,NULL,'AdminShopGroup','',0,1,'','Multistore','Admin.Navigation.Menu'),(110,92,12,NULL,'AdminShopUrl','',0,1,'','Multistore','Admin.Navigation.Menu'),(111,92,13,NULL,'AdminFeatureFlag','',1,1,'','New & Experimental Features','Admin.Navigation.Menu'),(112,92,14,NULL,'AdminParentSecurity','',1,1,'','Security','Admin.Navigation.Menu'),(113,112,0,NULL,'AdminSecurity','admin_security',1,1,'','Security','Admin.Navigation.Menu'),(114,112,1,NULL,'AdminSecuritySessionEmployee','admin_security_sessions_employee_list',1,1,'','Employee Sessions','Admin.Navigation.Menu'),(115,112,2,NULL,'AdminSecuritySessionCustomer','admin_security_sessions_customer_list',1,1,'','Customer Sessions','Admin.Navigation.Menu'),(116,92,15,NULL,'AdminQuickAccesses','',0,1,'','Quick Access','Admin.Navigation.Menu'),(117,0,5,NULL,'DEFAULT','',1,1,'','More','Admin.Navigation.Menu'),(118,-1,2,NULL,'AdminPatterns','',1,1,'','',''),(119,0,6,'blockreassurance','AdminBlockListing','',0,1,'',NULL,NULL),(120,37,3,'blockwishlist','WishlistConfigurationAdminParentController','',0,1,'',NULL,NULL),(121,120,1,'blockwishlist','WishlistConfigurationAdminController','',1,1,'',NULL,NULL),(122,120,2,'blockwishlist','WishlistStatisticsAdminController','',1,1,'',NULL,NULL),(123,-1,3,'dashgoals','AdminDashgoals','',1,1,'',NULL,NULL),(124,69,2,'klaviyopsautomation','AdminKlaviyoPsConfig','',1,1,'trending_up',NULL,NULL),(125,0,7,'ps_accounts','AdminAjaxPsAccounts','',0,1,'',NULL,NULL),(126,0,8,'ps_accounts','AdminAjaxV2PsAccounts','',0,1,'',NULL,NULL),(127,0,9,'ps_accounts','AdminOAuth2PsAccounts','',0,1,'',NULL,NULL),(128,0,10,'ps_accounts','AdminLoginPsAccounts','',0,1,'',NULL,NULL),(129,0,11,'ps_accounts','AdminDebugPsAccounts','',0,1,'',NULL,NULL),(130,0,12,'ps_accounts','AdminLogin','',0,1,'',NULL,NULL),(131,0,13,'ps_accounts','SfAdminOAuth2PsAccounts','',0,1,'',NULL,NULL),(132,0,14,'ps_accounts','SfAdminLoginPsAccounts','',0,1,'',NULL,NULL),(133,-1,4,'psgdpr','AdminAjaxPsgdpr','',1,1,'',NULL,NULL),(134,-1,5,'psgdpr','AdminDownloadInvoicesPsgdpr','',1,1,'',NULL,NULL),(135,37,4,'psshipping','PsshippingHomeController','',0,1,'','Homepage','Modules.Pshipping.Admin'),(136,0,15,'psshipping','PsshippingCarrierController','',0,1,'',NULL,NULL),(137,0,16,'psshipping','PsshippingConfigurationController','',0,1,'',NULL,NULL),(138,0,17,'psshipping','PsshippingKeycloakAuthController','',0,1,'',NULL,NULL),(139,0,18,'psshipping','PsshippingOrdersController','',0,1,'',NULL,NULL),(140,0,19,'psshipping','PsshippingFaqController','',0,1,'',NULL,NULL),(141,36,5,'','Marketing','',1,1,'campaign',NULL,NULL),(142,141,1,'psxmarketingwithgoogle','AdminPsxMktgWithGoogleModule','',1,1,'',NULL,NULL),(143,-1,6,'psxmarketingwithgoogle','AdminAjaxPsxMktgWithGoogle','',1,1,'',NULL,NULL),(144,0,20,'ps_checkout','AdminAjaxPrestashopCheckout','',0,1,'',NULL,NULL),(145,0,0,'ps_classic_edition','HOME','',1,1,'','Welcome','Modules.Classicedition.Admin'),(146,145,1,'ps_classic_edition','AdminPsClassicEditionHomepageController','ps_classic_edition_homepage',1,1,'support_agent','Care Center','Modules.Classicedition.Admin'),(147,0,21,'ps_classic_edition','AdminPsClassicEditionPsAcademyController','',0,1,'',NULL,NULL),(148,0,22,'ps_distributionapiclient','AdminPsdistributionapiclientCommunity','',1,1,'','Community','Modules.Distributionapiclient.Admin'),(149,148,1,'ps_distributionapiclient','AdminPsdistributionapiclient','ps_distributionapiclient_top_contributors',1,1,'groups','Wall of Fame','Modules.Distributionapiclient.Admin'),(150,141,2,'ps_facebook','AdminPsfacebookModule','',1,1,'',NULL,NULL),(151,-1,7,'ps_facebook','AdminAjaxPsfacebook','',1,1,'',NULL,NULL),(152,-1,8,'ps_faviconnotificationbo','AdminConfigureFaviconBo','',1,1,'',NULL,NULL),(153,-1,9,'ps_googleanalytics','AdminGanalyticsAjax','',1,1,'',NULL,NULL),(154,-1,10,'ps_imageslider','AdminConfigureSlides','',1,0,'',NULL,NULL),(155,42,7,'ps_linklist','AdminLinkWidget','admin_link_block_list',1,1,'','Link List','Modules.Linklist.Admin'),(156,37,0,'ps_mbo','AdminPsMboModuleParent','',1,1,'',NULL,NULL),(157,156,2,'ps_mbo','AdminPsMboModule','',1,1,'',NULL,NULL),(158,156,1,'ps_mbo','AdminPsMboSelection','',0,1,'','Modules in the spotlight','Modules.Mbo.Modulesselection'),(159,-1,0,'ps_mbo','AdminPsMboRecommended','',1,1,'',NULL,NULL),(160,42,2,'ps_mbo','AdminPsMboTheme','',1,1,'','Themes Catalog','Modules.Mbo.Themescatalog'),(161,42,8,'ps_onepagecheckout','AdminPsOnePageCheckout','',1,1,'','Checkout','Modules.Onepagecheckout.Admin'),(162,42,0,'','AdminThemesParent','',1,1,'','Theme & Logo','Admin.Navigation.Menu'),(163,162,2,'ps_themecusto','AdminPsThemeCustoConfiguration','',1,1,'',NULL,NULL),(164,162,3,'ps_themecusto','AdminPsThemeCustoAdvanced','',1,1,'',NULL,NULL);
/*!40000 ALTER TABLE `ubwbh_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tab_lang`
--

DROP TABLE IF EXISTS `ubwbh_tab_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tab_lang` (
  `id_tab` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_tab`,`id_lang`),
  KEY `IDX_CFD9262DED47AB56` (`id_tab`),
  KEY `IDX_CFD9262DBA299860` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tab_lang`
--

LOCK TABLES `ubwbh_tab_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_tab_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_tab_lang` VALUES (1,1,'Dashboard'),(1,2,'Dashboard'),(2,1,'Sell'),(2,2,'Jual'),(3,1,'Orders'),(3,2,'Penjualan'),(4,1,'Orders'),(4,2,'Penjualan'),(5,1,'Invoices'),(5,2,'Invoice'),(6,1,'Credit Slips'),(6,2,'Nota kredit'),(7,1,'Delivery Slips'),(7,2,'Nota pengiriman'),(8,1,'Shopping Carts'),(8,2,'Daftar belanja'),(9,1,'Catalog'),(9,2,'Katalog'),(10,1,'Products'),(10,2,'Produk'),(11,1,'Categories'),(11,2,'Kategori'),(12,1,'Monitoring'),(12,2,'Monitoring'),(13,1,'Attributes & Features'),(13,2,'Atribut dan Fitur'),(14,1,'Attributes'),(14,2,'Atribut'),(15,1,'Features'),(15,2,'Fitur'),(16,1,'Brands & Suppliers'),(16,2,'Brand dan Supplier'),(17,1,'Brands'),(17,2,'Brand'),(18,1,'Suppliers'),(18,2,'Supplier'),(19,1,'Files'),(19,2,'File'),(20,1,'Discounts'),(20,2,'Diskon'),(21,1,'Cart Rules'),(21,2,'Aturan harga'),(22,1,'Catalog Price Rules'),(22,2,'Aturan harga produk'),(23,1,'Stock'),(23,2,'Stok'),(24,1,'Business Entity'),(24,2,'Entitas Bisnis'),(25,1,'Business Entities'),(25,2,'Entitas Bisnis'),(26,1,'Customers B2B'),(26,2,'Pelanggan B2B'),(27,1,'Customers'),(27,2,'Pelanggan'),(28,1,'Customers'),(28,2,'Pelanggan'),(29,1,'Addresses'),(29,2,'Alamat'),(30,1,'Outstanding'),(30,2,'Outstanding'),(31,1,'Customer Service'),(31,2,'Layanan Pelanggan'),(32,1,'Customer Service'),(32,2,'Layanan Pelanggan'),(33,1,'Order Messages'),(33,2,'Pesan'),(34,1,'Merchandise Returns'),(34,2,'Retur barang'),(35,1,'Stats'),(35,2,'Statistik'),(36,1,'Improve'),(36,2,'Peningkatan'),(37,1,'Modules'),(37,2,'Modul'),(38,1,'Module Manager'),(38,2,'Module Manager'),(39,1,'Modules'),(39,2,'Modul'),(40,1,'Alerts'),(40,2,'Pengingat'),(41,1,'Updates'),(41,2,'Pembaruan'),(42,1,'Design'),(42,2,'Desain'),(43,1,'Theme & Logo'),(43,2,'Theme & Logo'),(44,1,'Email Theme'),(44,2,'Tema email'),(45,1,'Email Theme'),(45,2,'Tema email'),(46,1,'Pages'),(46,2,'Halaman'),(47,1,'Positions'),(47,2,'Posisi'),(48,1,'Image Settings'),(48,2,'Pengaturan Gambar'),(49,1,'Shipping'),(49,2,'Pengiriman'),(50,1,'Carriers'),(50,2,'Kurir'),(51,1,'Preferences'),(51,2,'Setting'),(52,1,'Payment'),(52,2,'Pembayaran'),(53,1,'Payment Methods'),(53,2,'Cara Pembayaran'),(54,1,'Preferences'),(54,2,'Setting'),(55,1,'International'),(55,2,'Internasional'),(56,1,'Localization'),(56,2,'Pelokalan'),(57,1,'Localization'),(57,2,'Pelokalan'),(58,1,'Languages'),(58,2,'Bahasa'),(59,1,'Currencies'),(59,2,'Mata Uang'),(60,1,'Geolocation'),(60,2,'Geolocation'),(61,1,'Locations'),(61,2,'Lokasi'),(62,1,'Zones'),(62,2,'Zona'),(63,1,'Countries'),(63,2,'Negara'),(64,1,'States'),(64,2,'Propinsi'),(65,1,'Taxes'),(65,2,'Pajak'),(66,1,'Taxes'),(66,2,'Pajak'),(67,1,'Tax Rules'),(67,2,'Aturan pajak'),(68,1,'Translations'),(68,2,'Terjemahan'),(69,1,'Configure'),(69,2,'Konfigurasi'),(70,1,'Shop Parameters'),(70,2,'Parameter Toko'),(71,1,'General'),(71,2,'Umum'),(72,1,'General'),(72,2,'Umum'),(73,1,'Maintenance'),(73,2,'Pemeliharaan'),(74,1,'Order Settings'),(74,2,'Pengaturan Order'),(75,1,'Order Settings'),(75,2,'Pengaturan Order'),(76,1,'Statuses'),(76,2,'Status'),(77,1,'Product Settings'),(77,2,'Produk'),(78,1,'Customer Settings'),(78,2,'Pengaturan Pelanggan'),(79,1,'Customer Settings'),(79,2,'Pengaturan Pelanggan'),(80,1,'Groups'),(80,2,'Grup'),(81,1,'Titles'),(81,2,'Panggilan'),(82,1,'Contact'),(82,2,'Kontak'),(83,1,'Contacts'),(83,2,'Kontak'),(84,1,'Stores'),(84,2,'Toko'),(85,1,'Traffic & SEO'),(85,2,'Traffic & SEO'),(86,1,'SEO & URLs'),(86,2,'SEO & URL'),(87,1,'Search Engines'),(87,2,'Mesin pencari'),(88,1,'Search'),(88,2,'Cari'),(89,1,'Search'),(89,2,'Cari'),(90,1,'Aliases'),(90,2,'Alias'),(91,1,'Tags'),(91,2,'Tag'),(92,1,'Advanced Parameters'),(92,2,'Parameter lanjutan'),(93,1,'Information'),(93,2,'Informasi'),(94,1,'Performance'),(94,2,'Kinerja'),(95,1,'Administration'),(95,2,'Administrasi'),(96,1,'E-mail'),(96,2,'Email'),(97,1,'Import'),(97,2,'Impor'),(98,1,'Team'),(98,2,'Karyawan'),(99,1,'Employees'),(99,2,'Karyawan'),(100,1,'Roles'),(100,2,'Roles'),(101,1,'Permissions'),(101,2,'Hak akses'),(102,1,'Database'),(102,2,'Database'),(103,1,'SQL Manager'),(103,2,'SQL Manager'),(104,1,'DB Backup'),(104,2,'Backup database'),(105,1,'Logs'),(105,2,'Log'),(106,1,'Webservice'),(106,2,'Webservice'),(107,1,'Extra Properties'),(107,2,'Extra Properties'),(108,1,'Admin API'),(108,2,'Admin API'),(109,1,'Multistore'),(109,2,'Multistore'),(110,1,'Multistore'),(110,2,'Multistore'),(111,1,'New & Experimental Features'),(111,2,'New & Experimental Features'),(112,1,'Security'),(112,2,'Security'),(113,1,'Security'),(113,2,'Security'),(114,1,'Employee Sessions'),(114,2,'Employee Sessions'),(115,1,'Customer Sessions'),(115,2,'Sesi Pelanggan'),(116,1,'Quick Access'),(116,2,'Akses cepat'),(117,1,'More'),(117,2,'Lebih'),(119,1,'AdminBlockListing'),(119,2,'AdminBlockListing'),(120,1,'Wishlist Module'),(120,2,'Wishlist Module'),(121,1,'Configuration'),(121,2,'Konfigurasi'),(122,1,'Statistics'),(122,2,'Statistics'),(123,1,'Dashgoals'),(123,2,'Dashgoals'),(124,1,'Klaviyo'),(124,2,'Klaviyo'),(125,1,'AdminAjaxPsAccounts (PrestaShop Account)'),(125,2,'AdminAjaxPsAccounts (PrestaShop Account)'),(126,1,'AdminAjaxV2PsAccounts (PrestaShop Account)'),(126,2,'AdminAjaxV2PsAccounts (PrestaShop Account)'),(127,1,'AdminOAuth2PsAccounts (PrestaShop Account)'),(127,2,'AdminOAuth2PsAccounts (PrestaShop Account)'),(128,1,'AdminLoginPsAccounts (PrestaShop Account)'),(128,2,'AdminLoginPsAccounts (PrestaShop Account)'),(129,1,'AdminDebugPsAccounts'),(129,2,'AdminDebugPsAccounts'),(130,1,'AdminLogin'),(130,2,'AdminLogin'),(131,1,'SfAdminOAuth2PsAccounts'),(131,2,'SfAdminOAuth2PsAccounts'),(132,1,'SfAdminLoginPsAccounts'),(132,2,'SfAdminLoginPsAccounts'),(133,1,'Official GDPR compliance'),(133,2,'Official GDPR compliance'),(134,1,'Official GDPR compliance'),(134,2,'Official GDPR compliance'),(135,1,'Homepage'),(135,2,'Homepage'),(136,1,'PsshippingCarrierController'),(136,2,'PsshippingCarrierController'),(137,1,'PsshippingConfigurationController'),(137,2,'PsshippingConfigurationController'),(138,1,'PsshippingKeycloakAuthController'),(138,2,'PsshippingKeycloakAuthController'),(139,1,'PsshippingOrdersController'),(139,2,'PsshippingOrdersController'),(140,1,'PsshippingFaqController'),(140,2,'PsshippingFaqController'),(141,1,'Marketing'),(141,2,'Marketing'),(142,1,'Google'),(142,2,'Google'),(143,1,'psxmarketingwithgoogle'),(143,2,'psxmarketingwithgoogle'),(144,1,'AdminAjaxPrestashopCheckout'),(144,2,'AdminAjaxPrestashopCheckout'),(145,1,'Welcome'),(145,2,'Welcome'),(146,1,'Care Center'),(146,2,'Care Center'),(147,1,'AdminPsClassicEditionPsAcademyController'),(147,2,'AdminPsClassicEditionPsAcademyController'),(148,1,'Community'),(148,2,'Community'),(149,1,'Wall of Fame'),(149,2,'Wall of Fame'),(150,1,'Facebook & Instagram'),(150,2,'Facebook & Instagram'),(151,1,'ps_facebook'),(151,2,'ps_facebook'),(152,1,'Order Notifications on the Favicon'),(152,2,'Order Notifications on the Favicon'),(153,1,'Google Analytics'),(153,2,'Google Analytics'),(154,1,'Image slider'),(154,2,'Image slider'),(155,1,'Link List'),(155,2,'Daftar tautan'),(156,1,'Marketplace'),(156,2,'Marketplace'),(157,1,'Marketplace'),(157,2,'Marketplace'),(158,1,'Modules in the spotlight'),(158,2,'Modules in the spotlight'),(159,1,'Modules recommandés'),(159,2,'Modules recommandés'),(160,1,'Themes Catalog'),(160,2,'Themes Catalog'),(161,1,'Checkout'),(161,2,'Pemeriksaan'),(162,1,'Theme & Logo'),(162,2,'Theme & Logo'),(163,1,'Pages Configuration'),(163,2,'Pages Configuration'),(164,1,'Advanced Customization'),(164,2,'Advanced Customization');
/*!40000 ALTER TABLE `ubwbh_tab_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tab_module_preference`
--

DROP TABLE IF EXISTS `ubwbh_tab_module_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tab_module_preference` (
  `id_tab_module_preference` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `id_tab` int(11) NOT NULL,
  `module` varchar(191) NOT NULL,
  PRIMARY KEY (`id_tab_module_preference`),
  UNIQUE KEY `employee_module` (`id_employee`,`id_tab`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tab_module_preference`
--

LOCK TABLES `ubwbh_tab_module_preference` WRITE;
/*!40000 ALTER TABLE `ubwbh_tab_module_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_tab_module_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tag`
--

DROP TABLE IF EXISTS `ubwbh_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`name`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tag`
--

LOCK TABLES `ubwbh_tag` WRITE;
/*!40000 ALTER TABLE `ubwbh_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tag_count`
--

DROP TABLE IF EXISTS `ubwbh_tag_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tag_count` (
  `id_group` int(10) unsigned NOT NULL DEFAULT 0,
  `id_tag` int(10) unsigned NOT NULL DEFAULT 0,
  `id_lang` int(10) unsigned NOT NULL DEFAULT 0,
  `id_shop` int(11) unsigned NOT NULL DEFAULT 0,
  `counter` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_group`,`id_tag`),
  KEY `id_group` (`id_group`,`id_lang`,`id_shop`,`counter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tag_count`
--

LOCK TABLES `ubwbh_tag_count` WRITE;
/*!40000 ALTER TABLE `ubwbh_tag_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_tag_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tax`
--

DROP TABLE IF EXISTS `ubwbh_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tax` (
  `id_tax` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,3) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_tax`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tax`
--

LOCK TABLES `ubwbh_tax` WRITE;
/*!40000 ALTER TABLE `ubwbh_tax` DISABLE KEYS */;
INSERT INTO `ubwbh_tax` VALUES (1,10.000,1,0),(2,0.000,1,0);
/*!40000 ALTER TABLE `ubwbh_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tax_lang`
--

DROP TABLE IF EXISTS `ubwbh_tax_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tax_lang` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tax`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tax_lang`
--

LOCK TABLES `ubwbh_tax_lang` WRITE;
/*!40000 ALTER TABLE `ubwbh_tax_lang` DISABLE KEYS */;
INSERT INTO `ubwbh_tax_lang` VALUES (1,1,'PPN ID 10%'),(1,2,'PPN ID 10%'),(2,1,'PPN ID 0%'),(2,2,'PPN ID 0%');
/*!40000 ALTER TABLE `ubwbh_tax_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tax_rule`
--

DROP TABLE IF EXISTS `ubwbh_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tax_rule` (
  `id_tax_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_tax_rules_group` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `zipcode_from` varchar(12) NOT NULL,
  `zipcode_to` varchar(12) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `behavior` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tax_rule`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_tax` (`id_tax`),
  KEY `category_getproducts` (`id_tax_rules_group`,`id_country`,`id_state`,`zipcode_from`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tax_rule`
--

LOCK TABLES `ubwbh_tax_rule` WRITE;
/*!40000 ALTER TABLE `ubwbh_tax_rule` DISABLE KEYS */;
INSERT INTO `ubwbh_tax_rule` VALUES (1,1,110,0,'0','0',1,0,''),(2,2,110,0,'0','0',2,0,'');
/*!40000 ALTER TABLE `ubwbh_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tax_rules_group`
--

DROP TABLE IF EXISTS `ubwbh_tax_rules_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tax_rules_group` (
  `id_tax_rules_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` int(11) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tax_rules_group`
--

LOCK TABLES `ubwbh_tax_rules_group` WRITE;
/*!40000 ALTER TABLE `ubwbh_tax_rules_group` DISABLE KEYS */;
INSERT INTO `ubwbh_tax_rules_group` VALUES (1,'ID Standard Rate (10%)',1,0,'2026-11-23 15:01:19','2026-11-23 15:01:19'),(2,'ID Zero Rate (0%)',1,0,'2026-11-23 15:01:19','2026-11-23 15:01:19');
/*!40000 ALTER TABLE `ubwbh_tax_rules_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_tax_rules_group_shop`
--

DROP TABLE IF EXISTS `ubwbh_tax_rules_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_tax_rules_group_shop` (
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_tax_rules_group_shop`
--

LOCK TABLES `ubwbh_tax_rules_group_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_tax_rules_group_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_tax_rules_group_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `ubwbh_tax_rules_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_timezone`
--

DROP TABLE IF EXISTS `ubwbh_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_timezone` (
  `id_timezone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_timezone`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_timezone`
--

LOCK TABLES `ubwbh_timezone` WRITE;
/*!40000 ALTER TABLE `ubwbh_timezone` DISABLE KEYS */;
INSERT INTO `ubwbh_timezone` VALUES (1,'Africa/Abidjan'),(2,'Africa/Accra'),(3,'Africa/Addis_Ababa'),(4,'Africa/Algiers'),(5,'Africa/Asmara'),(6,'Africa/Asmera'),(7,'Africa/Bamako'),(8,'Africa/Bangui'),(9,'Africa/Banjul'),(10,'Africa/Bissau'),(11,'Africa/Blantyre'),(12,'Africa/Brazzaville'),(13,'Africa/Bujumbura'),(14,'Africa/Cairo'),(15,'Africa/Casablanca'),(16,'Africa/Ceuta'),(17,'Africa/Conakry'),(18,'Africa/Dakar'),(19,'Africa/Dar_es_Salaam'),(20,'Africa/Djibouti'),(21,'Africa/Douala'),(22,'Africa/El_Aaiun'),(23,'Africa/Freetown'),(24,'Africa/Gaborone'),(25,'Africa/Harare'),(26,'Africa/Johannesburg'),(27,'Africa/Kampala'),(28,'Africa/Khartoum'),(29,'Africa/Kigali'),(30,'Africa/Kinshasa'),(31,'Africa/Lagos'),(32,'Africa/Libreville'),(33,'Africa/Lome'),(34,'Africa/Luanda'),(35,'Africa/Lubumbashi'),(36,'Africa/Lusaka'),(37,'Africa/Malabo'),(38,'Africa/Maputo'),(39,'Africa/Maseru'),(40,'Africa/Mbabane'),(41,'Africa/Mogadishu'),(42,'Africa/Monrovia'),(43,'Africa/Nairobi'),(44,'Africa/Ndjamena'),(45,'Africa/Niamey'),(46,'Africa/Nouakchott'),(47,'Africa/Ouagadougou'),(48,'Africa/Porto-Novo'),(49,'Africa/Sao_Tome'),(50,'Africa/Timbuktu'),(51,'Africa/Tripoli'),(52,'Africa/Tunis'),(53,'Africa/Windhoek'),(54,'America/Adak'),(55,'America/Anchorage '),(56,'America/Anguilla'),(57,'America/Antigua'),(58,'America/Araguaina'),(59,'America/Argentina/Buenos_Aires'),(60,'America/Argentina/Catamarca'),(61,'America/Argentina/ComodRivadavia'),(62,'America/Argentina/Cordoba'),(63,'America/Argentina/Jujuy'),(64,'America/Argentina/La_Rioja'),(65,'America/Argentina/Mendoza'),(66,'America/Argentina/Rio_Gallegos'),(67,'America/Argentina/Salta'),(68,'America/Argentina/San_Juan'),(69,'America/Argentina/San_Luis'),(70,'America/Argentina/Tucuman'),(71,'America/Argentina/Ushuaia'),(72,'America/Aruba'),(73,'America/Asuncion'),(74,'America/Atikokan'),(75,'America/Atka'),(76,'America/Bahia'),(77,'America/Barbados'),(78,'America/Belem'),(79,'America/Belize'),(80,'America/Blanc-Sablon'),(81,'America/Boa_Vista'),(82,'America/Bogota'),(83,'America/Boise'),(84,'America/Buenos_Aires'),(85,'America/Cambridge_Bay'),(86,'America/Campo_Grande'),(87,'America/Cancun'),(88,'America/Caracas'),(89,'America/Catamarca'),(90,'America/Cayenne'),(91,'America/Cayman'),(92,'America/Chicago'),(93,'America/Chihuahua'),(94,'America/Coral_Harbour'),(95,'America/Cordoba'),(96,'America/Costa_Rica'),(97,'America/Cuiaba'),(98,'America/Curacao'),(99,'America/Danmarkshavn'),(100,'America/Dawson'),(101,'America/Dawson_Creek'),(102,'America/Denver'),(103,'America/Detroit'),(104,'America/Dominica'),(105,'America/Edmonton'),(106,'America/Eirunepe'),(107,'America/El_Salvador'),(108,'America/Ensenada'),(109,'America/Fort_Wayne'),(110,'America/Fortaleza'),(111,'America/Glace_Bay'),(112,'America/Godthab'),(113,'America/Goose_Bay'),(114,'America/Grand_Turk'),(115,'America/Grenada'),(116,'America/Guadeloupe'),(117,'America/Guatemala'),(118,'America/Guayaquil'),(119,'America/Guyana'),(120,'America/Halifax'),(121,'America/Havana'),(122,'America/Hermosillo'),(123,'America/Indiana/Indianapolis'),(124,'America/Indiana/Knox'),(125,'America/Indiana/Marengo'),(126,'America/Indiana/Petersburg'),(127,'America/Indiana/Tell_City'),(128,'America/Indiana/Vevay'),(129,'America/Indiana/Vincennes'),(130,'America/Indiana/Winamac'),(131,'America/Indianapolis'),(132,'America/Inuvik'),(133,'America/Iqaluit'),(134,'America/Jamaica'),(135,'America/Jujuy'),(136,'America/Juneau'),(137,'America/Kentucky/Louisville'),(138,'America/Kentucky/Monticello'),(139,'America/Knox_IN'),(140,'America/La_Paz'),(141,'America/Lima'),(142,'America/Los_Angeles'),(143,'America/Louisville'),(144,'America/Maceio'),(145,'America/Managua'),(146,'America/Manaus'),(147,'America/Marigot'),(148,'America/Martinique'),(149,'America/Mazatlan'),(150,'America/Mendoza'),(151,'America/Menominee'),(152,'America/Merida'),(153,'America/Mexico_City'),(154,'America/Miquelon'),(155,'America/Moncton'),(156,'America/Monterrey'),(157,'America/Montevideo'),(158,'America/Montreal'),(159,'America/Montserrat'),(160,'America/Nassau'),(161,'America/New_York'),(162,'America/Nipigon'),(163,'America/Nome'),(164,'America/Noronha'),(165,'America/North_Dakota/Center'),(166,'America/North_Dakota/New_Salem'),(167,'America/Panama'),(168,'America/Pangnirtung'),(169,'America/Paramaribo'),(170,'America/Phoenix'),(171,'America/Port-au-Prince'),(172,'America/Port_of_Spain'),(173,'America/Porto_Acre'),(174,'America/Porto_Velho'),(175,'America/Puerto_Rico'),(176,'America/Rainy_River'),(177,'America/Rankin_Inlet'),(178,'America/Recife'),(179,'America/Regina'),(180,'America/Resolute'),(181,'America/Rio_Branco'),(182,'America/Rosario'),(183,'America/Santarem'),(184,'America/Santiago'),(185,'America/Santo_Domingo'),(186,'America/Sao_Paulo'),(187,'America/Scoresbysund'),(188,'America/Shiprock'),(189,'America/St_Barthelemy'),(190,'America/St_Johns'),(191,'America/St_Kitts'),(192,'America/St_Lucia'),(193,'America/St_Thomas'),(194,'America/St_Vincent'),(195,'America/Swift_Current'),(196,'America/Tegucigalpa'),(197,'America/Thule'),(198,'America/Thunder_Bay'),(199,'America/Tijuana'),(200,'America/Toronto'),(201,'America/Tortola'),(202,'America/Vancouver'),(203,'America/Virgin'),(204,'America/Whitehorse'),(205,'America/Winnipeg'),(206,'America/Yakutat'),(207,'America/Yellowknife'),(208,'Antarctica/Casey'),(209,'Antarctica/Davis'),(210,'Antarctica/DumontDUrville'),(211,'Antarctica/Mawson'),(212,'Antarctica/McMurdo'),(213,'Antarctica/Palmer'),(214,'Antarctica/Rothera'),(215,'Antarctica/South_Pole'),(216,'Antarctica/Syowa'),(217,'Antarctica/Vostok'),(218,'Arctic/Longyearbyen'),(219,'Asia/Aden'),(220,'Asia/Almaty'),(221,'Asia/Amman'),(222,'Asia/Anadyr'),(223,'Asia/Aqtau'),(224,'Asia/Aqtobe'),(225,'Asia/Ashgabat'),(226,'Asia/Ashkhabad'),(227,'Asia/Baghdad'),(228,'Asia/Bahrain'),(229,'Asia/Baku'),(230,'Asia/Bangkok'),(231,'Asia/Beirut'),(232,'Asia/Bishkek'),(233,'Asia/Brunei'),(234,'Asia/Calcutta'),(235,'Asia/Choibalsan'),(236,'Asia/Chongqing'),(237,'Asia/Chungking'),(238,'Asia/Colombo'),(239,'Asia/Dacca'),(240,'Asia/Damascus'),(241,'Asia/Dhaka'),(242,'Asia/Dili'),(243,'Asia/Dubai'),(244,'Asia/Dushanbe'),(245,'Asia/Gaza'),(246,'Asia/Harbin'),(247,'Asia/Ho_Chi_Minh'),(248,'Asia/Hong_Kong'),(249,'Asia/Hovd'),(250,'Asia/Irkutsk'),(251,'Asia/Istanbul'),(252,'Asia/Jakarta'),(253,'Asia/Jayapura'),(254,'Asia/Jerusalem'),(255,'Asia/Kabul'),(256,'Asia/Kamchatka'),(257,'Asia/Karachi'),(258,'Asia/Kashgar'),(259,'Asia/Kathmandu'),(260,'Asia/Katmandu'),(261,'Asia/Kolkata'),(262,'Asia/Krasnoyarsk'),(263,'Asia/Kuala_Lumpur'),(264,'Asia/Kuching'),(265,'Asia/Kuwait'),(266,'Asia/Macao'),(267,'Asia/Macau'),(268,'Asia/Magadan'),(269,'Asia/Makassar'),(270,'Asia/Manila'),(271,'Asia/Muscat'),(272,'Asia/Nicosia'),(273,'Asia/Novosibirsk'),(274,'Asia/Omsk'),(275,'Asia/Oral'),(276,'Asia/Phnom_Penh'),(277,'Asia/Pontianak'),(278,'Asia/Pyongyang'),(279,'Asia/Qatar'),(280,'Asia/Qyzylorda'),(281,'Asia/Rangoon'),(282,'Asia/Riyadh'),(283,'Asia/Saigon'),(284,'Asia/Sakhalin'),(285,'Asia/Samarkand'),(286,'Asia/Seoul'),(287,'Asia/Shanghai'),(288,'Asia/Singapore'),(289,'Asia/Taipei'),(290,'Asia/Tashkent'),(291,'Asia/Tbilisi'),(292,'Asia/Tehran'),(293,'Asia/Tel_Aviv'),(294,'Asia/Thimbu'),(295,'Asia/Thimphu'),(296,'Asia/Tokyo'),(297,'Asia/Ujung_Pandang'),(298,'Asia/Ulaanbaatar'),(299,'Asia/Ulan_Bator'),(300,'Asia/Urumqi'),(301,'Asia/Vientiane'),(302,'Asia/Vladivostok'),(303,'Asia/Yakutsk'),(304,'Asia/Yekaterinburg'),(305,'Asia/Yerevan'),(306,'Atlantic/Azores'),(307,'Atlantic/Bermuda'),(308,'Atlantic/Canary'),(309,'Atlantic/Cape_Verde'),(310,'Atlantic/Faeroe'),(311,'Atlantic/Faroe'),(312,'Atlantic/Jan_Mayen'),(313,'Atlantic/Madeira'),(314,'Atlantic/Reykjavik'),(315,'Atlantic/South_Georgia'),(316,'Atlantic/St_Helena'),(317,'Atlantic/Stanley'),(318,'Australia/ACT'),(319,'Australia/Adelaide'),(320,'Australia/Brisbane'),(321,'Australia/Broken_Hill'),(322,'Australia/Canberra'),(323,'Australia/Currie'),(324,'Australia/Darwin'),(325,'Australia/Eucla'),(326,'Australia/Hobart'),(327,'Australia/LHI'),(328,'Australia/Lindeman'),(329,'Australia/Lord_Howe'),(330,'Australia/Melbourne'),(331,'Australia/North'),(332,'Australia/NSW'),(333,'Australia/Perth'),(334,'Australia/Queensland'),(335,'Australia/South'),(336,'Australia/Sydney'),(337,'Australia/Tasmania'),(338,'Australia/Victoria'),(339,'Australia/West'),(340,'Australia/Yancowinna'),(341,'Europe/Amsterdam'),(342,'Europe/Andorra'),(343,'Europe/Athens'),(344,'Europe/Belfast'),(345,'Europe/Belgrade'),(346,'Europe/Berlin'),(347,'Europe/Bratislava'),(348,'Europe/Brussels'),(349,'Europe/Bucharest'),(350,'Europe/Budapest'),(351,'Europe/Chisinau'),(352,'Europe/Copenhagen'),(353,'Europe/Dublin'),(354,'Europe/Gibraltar'),(355,'Europe/Guernsey'),(356,'Europe/Helsinki'),(357,'Europe/Isle_of_Man'),(358,'Europe/Istanbul'),(359,'Europe/Jersey'),(360,'Europe/Kaliningrad'),(361,'Europe/Kiev'),(362,'Europe/Lisbon'),(363,'Europe/Ljubljana'),(364,'Europe/London'),(365,'Europe/Luxembourg'),(366,'Europe/Madrid'),(367,'Europe/Malta'),(368,'Europe/Mariehamn'),(369,'Europe/Minsk'),(370,'Europe/Monaco'),(371,'Europe/Moscow'),(372,'Europe/Nicosia'),(373,'Europe/Oslo'),(374,'Europe/Paris'),(375,'Europe/Podgorica'),(376,'Europe/Prague'),(377,'Europe/Riga'),(378,'Europe/Rome'),(379,'Europe/Samara'),(380,'Europe/San_Marino'),(381,'Europe/Sarajevo'),(382,'Europe/Simferopol'),(383,'Europe/Skopje'),(384,'Europe/Sofia'),(385,'Europe/Stockholm'),(386,'Europe/Tallinn'),(387,'Europe/Tirane'),(388,'Europe/Tiraspol'),(389,'Europe/Uzhgorod'),(390,'Europe/Vaduz'),(391,'Europe/Vatican'),(392,'Europe/Vienna'),(393,'Europe/Vilnius'),(394,'Europe/Volgograd'),(395,'Europe/Warsaw'),(396,'Europe/Zagreb'),(397,'Europe/Zaporozhye'),(398,'Europe/Zurich'),(399,'Indian/Antananarivo'),(400,'Indian/Chagos'),(401,'Indian/Christmas'),(402,'Indian/Cocos'),(403,'Indian/Comoro'),(404,'Indian/Kerguelen'),(405,'Indian/Mahe'),(406,'Indian/Maldives'),(407,'Indian/Mauritius'),(408,'Indian/Mayotte'),(409,'Indian/Reunion'),(410,'Pacific/Apia'),(411,'Pacific/Auckland'),(412,'Pacific/Chatham'),(413,'Pacific/Easter'),(414,'Pacific/Efate'),(415,'Pacific/Enderbury'),(416,'Pacific/Fakaofo'),(417,'Pacific/Fiji'),(418,'Pacific/Funafuti'),(419,'Pacific/Galapagos'),(420,'Pacific/Gambier'),(421,'Pacific/Guadalcanal'),(422,'Pacific/Guam'),(423,'Pacific/Honolulu'),(424,'Pacific/Johnston'),(425,'Pacific/Kiritimati'),(426,'Pacific/Kosrae'),(427,'Pacific/Kwajalein'),(428,'Pacific/Majuro'),(429,'Pacific/Marquesas'),(430,'Pacific/Midway'),(431,'Pacific/Nauru'),(432,'Pacific/Niue'),(433,'Pacific/Norfolk'),(434,'Pacific/Noumea'),(435,'Pacific/Pago_Pago'),(436,'Pacific/Palau'),(437,'Pacific/Pitcairn'),(438,'Pacific/Ponape'),(439,'Pacific/Port_Moresby'),(440,'Pacific/Rarotonga'),(441,'Pacific/Saipan'),(442,'Pacific/Samoa'),(443,'Pacific/Tahiti'),(444,'Pacific/Tarawa'),(445,'Pacific/Tongatapu'),(446,'Pacific/Truk'),(447,'Pacific/Wake'),(448,'Pacific/Wallis'),(449,'Pacific/Yap'),(450,'Brazil/Acre'),(451,'Brazil/DeNoronha'),(452,'Brazil/East'),(453,'Brazil/West'),(454,'Canada/Atlantic'),(455,'Canada/Central'),(456,'Canada/East-Saskatchewan'),(457,'Canada/Eastern'),(458,'Canada/Mountain'),(459,'Canada/Newfoundland'),(460,'Canada/Pacific'),(461,'Canada/Saskatchewan'),(462,'Canada/Yukon'),(463,'CET'),(464,'Chile/Continental'),(465,'Chile/EasterIsland'),(466,'CST6CDT'),(467,'Cuba'),(468,'EET'),(469,'Egypt'),(470,'Eire'),(471,'EST'),(472,'EST5EDT'),(473,'Etc/GMT'),(474,'Etc/GMT+0'),(475,'Etc/GMT+1'),(476,'Etc/GMT+10'),(477,'Etc/GMT+11'),(478,'Etc/GMT+12'),(479,'Etc/GMT+2'),(480,'Etc/GMT+3'),(481,'Etc/GMT+4'),(482,'Etc/GMT+5'),(483,'Etc/GMT+6'),(484,'Etc/GMT+7'),(485,'Etc/GMT+8'),(486,'Etc/GMT+9'),(487,'Etc/GMT-0'),(488,'Etc/GMT-1'),(489,'Etc/GMT-10'),(490,'Etc/GMT-11'),(491,'Etc/GMT-12'),(492,'Etc/GMT-13'),(493,'Etc/GMT-14'),(494,'Etc/GMT-2'),(495,'Etc/GMT-3'),(496,'Etc/GMT-4'),(497,'Etc/GMT-5'),(498,'Etc/GMT-6'),(499,'Etc/GMT-7'),(500,'Etc/GMT-8'),(501,'Etc/GMT-9'),(502,'Etc/GMT0'),(503,'Etc/Greenwich'),(504,'Etc/UCT'),(505,'Etc/Universal'),(506,'Etc/UTC'),(507,'Etc/Zulu'),(508,'Factory'),(509,'GB'),(510,'GB-Eire'),(511,'GMT'),(512,'GMT+0'),(513,'GMT-0'),(514,'GMT0'),(515,'Greenwich'),(516,'Hongkong'),(517,'HST'),(518,'Iceland'),(519,'Iran'),(520,'Israel'),(521,'Jamaica'),(522,'Japan'),(523,'Kwajalein'),(524,'Libya'),(525,'MET'),(526,'Mexico/BajaNorte'),(527,'Mexico/BajaSur'),(528,'Mexico/General'),(529,'MST'),(530,'MST7MDT'),(531,'Navajo'),(532,'NZ'),(533,'NZ-CHAT'),(534,'Poland'),(535,'Portugal'),(536,'PRC'),(537,'PST8PDT'),(538,'ROC'),(539,'ROK'),(540,'Singapore'),(541,'Turkey'),(542,'UCT'),(543,'Universal'),(544,'US/Alaska'),(545,'US/Aleutian'),(546,'US/Arizona'),(547,'US/Central'),(548,'US/East-Indiana'),(549,'US/Eastern'),(550,'US/Hawaii'),(551,'US/Indiana-Starke'),(552,'US/Michigan'),(553,'US/Mountain'),(554,'US/Pacific'),(555,'US/Samoa'),(556,'UTC'),(557,'W-SU'),(558,'WET'),(559,'Zulu');
/*!40000 ALTER TABLE `ubwbh_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_translation`
--

DROP TABLE IF EXISTS `ubwbh_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_translation` (
  `id_translation` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) NOT NULL,
  `key` text NOT NULL,
  `translation` text NOT NULL,
  `domain` varchar(80) NOT NULL,
  `theme` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_translation`),
  KEY `IDX_ADEBEB36BA299860` (`id_lang`),
  KEY `key` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_translation`
--

LOCK TABLES `ubwbh_translation` WRITE;
/*!40000 ALTER TABLE `ubwbh_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_warehouse`
--

DROP TABLE IF EXISTS `ubwbh_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_warehouse` (
  `id_warehouse` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_currency` int(11) unsigned NOT NULL,
  `id_address` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `reference` varchar(64) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `management_type` enum('WA','FIFO','LIFO') NOT NULL DEFAULT 'WA',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_warehouse`
--

LOCK TABLES `ubwbh_warehouse` WRITE;
/*!40000 ALTER TABLE `ubwbh_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_warehouse_carrier`
--

DROP TABLE IF EXISTS `ubwbh_warehouse_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_warehouse_carrier` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_warehouse`,`id_carrier`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_carrier` (`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_warehouse_carrier`
--

LOCK TABLES `ubwbh_warehouse_carrier` WRITE;
/*!40000 ALTER TABLE `ubwbh_warehouse_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_warehouse_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_warehouse_product_location`
--

DROP TABLE IF EXISTS `ubwbh_warehouse_product_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_warehouse_product_location` (
  `id_warehouse_product_location` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  `location` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_warehouse_product_location`),
  UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_warehouse_product_location`
--

LOCK TABLES `ubwbh_warehouse_product_location` WRITE;
/*!40000 ALTER TABLE `ubwbh_warehouse_product_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_warehouse_product_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_warehouse_shop`
--

DROP TABLE IF EXISTS `ubwbh_warehouse_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_warehouse_shop` (
  `id_shop` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_warehouse`,`id_shop`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_warehouse_shop`
--

LOCK TABLES `ubwbh_warehouse_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_warehouse_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_warehouse_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_web_browser`
--

DROP TABLE IF EXISTS `ubwbh_web_browser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_web_browser` (
  `id_web_browser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_web_browser`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_web_browser`
--

LOCK TABLES `ubwbh_web_browser` WRITE;
/*!40000 ALTER TABLE `ubwbh_web_browser` DISABLE KEYS */;
INSERT INTO `ubwbh_web_browser` VALUES (1,'Safari'),(2,'Safari iPad'),(3,'Firefox'),(4,'Opera'),(5,'IE 6'),(6,'IE 7'),(7,'IE 8'),(8,'IE 9'),(9,'IE 10'),(10,'IE 11'),(11,'Chrome');
/*!40000 ALTER TABLE `ubwbh_web_browser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_webservice_account`
--

DROP TABLE IF EXISTS `ubwbh_webservice_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_webservice_account` (
  `id_webservice_account` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `class_name` varchar(50) NOT NULL DEFAULT 'WebserviceRequest',
  `is_module` tinyint(2) NOT NULL DEFAULT 0,
  `module_name` varchar(50) DEFAULT NULL,
  `active` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_webservice_account`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_webservice_account`
--

LOCK TABLES `ubwbh_webservice_account` WRITE;
/*!40000 ALTER TABLE `ubwbh_webservice_account` DISABLE KEYS */;
INSERT INTO `ubwbh_webservice_account` VALUES (1,'DcKkgbxd3QPfdVEn4Z6xvp4UMQNNVY48','Klaviyo webservice key','WebserviceRequest',0,NULL,1);
/*!40000 ALTER TABLE `ubwbh_webservice_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_webservice_account_shop`
--

DROP TABLE IF EXISTS `ubwbh_webservice_account_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_webservice_account_shop` (
  `id_webservice_account` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_webservice_account`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_webservice_account_shop`
--

LOCK TABLES `ubwbh_webservice_account_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_webservice_account_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_webservice_account_shop` VALUES (1,1);
/*!40000 ALTER TABLE `ubwbh_webservice_account_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_webservice_permission`
--

DROP TABLE IF EXISTS `ubwbh_webservice_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_webservice_permission` (
  `id_webservice_permission` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `method` enum('GET','POST','PUT','PATCH','DELETE','HEAD') NOT NULL,
  `id_webservice_account` int(11) NOT NULL,
  PRIMARY KEY (`id_webservice_permission`),
  UNIQUE KEY `resource_2` (`resource`,`method`,`id_webservice_account`),
  KEY `resource` (`resource`),
  KEY `method` (`method`),
  KEY `id_webservice_account` (`id_webservice_account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_webservice_permission`
--

LOCK TABLES `ubwbh_webservice_permission` WRITE;
/*!40000 ALTER TABLE `ubwbh_webservice_permission` DISABLE KEYS */;
INSERT INTO `ubwbh_webservice_permission` VALUES (1,'klaviyo','GET',1),(3,'klaviyo','POST',1),(2,'klaviyo','PUT',1),(4,'klaviyo','DELETE',1),(5,'klaviyo','HEAD',1);
/*!40000 ALTER TABLE `ubwbh_webservice_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_wishlist`
--

DROP TABLE IF EXISTS `ubwbh_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_wishlist` (
  `id_wishlist` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned DEFAULT 1,
  `id_shop_group` int(10) unsigned DEFAULT 1,
  `token` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `counter` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `default` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id_wishlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_wishlist`
--

LOCK TABLES `ubwbh_wishlist` WRITE;
/*!40000 ALTER TABLE `ubwbh_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_wishlist_product`
--

DROP TABLE IF EXISTS `ubwbh_wishlist_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_wishlist_product` (
  `id_wishlist_product` int(10) NOT NULL AUTO_INCREMENT,
  `id_wishlist` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_wishlist_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_wishlist_product`
--

LOCK TABLES `ubwbh_wishlist_product` WRITE;
/*!40000 ALTER TABLE `ubwbh_wishlist_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_wishlist_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_wishlist_product_cart`
--

DROP TABLE IF EXISTS `ubwbh_wishlist_product_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_wishlist_product_cart` (
  `id_wishlist_product` int(10) unsigned NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_wishlist_product_cart`
--

LOCK TABLES `ubwbh_wishlist_product_cart` WRITE;
/*!40000 ALTER TABLE `ubwbh_wishlist_product_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubwbh_wishlist_product_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_zone`
--

DROP TABLE IF EXISTS `ubwbh_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_zone` (
  `id_zone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_zone`
--

LOCK TABLES `ubwbh_zone` WRITE;
/*!40000 ALTER TABLE `ubwbh_zone` DISABLE KEYS */;
INSERT INTO `ubwbh_zone` VALUES (1,'Europe',1),(2,'North America',1),(3,'Asia',1),(4,'Africa',1),(5,'Oceania',1),(6,'South America',1),(7,'Europe (non-EU)',1),(8,'Central America/Antilla',1);
/*!40000 ALTER TABLE `ubwbh_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubwbh_zone_shop`
--

DROP TABLE IF EXISTS `ubwbh_zone_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubwbh_zone_shop` (
  `id_zone` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_zone`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubwbh_zone_shop`
--

LOCK TABLES `ubwbh_zone_shop` WRITE;
/*!40000 ALTER TABLE `ubwbh_zone_shop` DISABLE KEYS */;
INSERT INTO `ubwbh_zone_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);
/*!40000 ALTER TABLE `ubwbh_zone_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-23 16:52:11
