CREATE DATABASE  IF NOT EXISTS `mymovies` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mymovies`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mymovies
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (7,'Alemania'),(1,'Argentina'),(11,'Australia'),(12,'Bolivia'),(4,'Brasil'),(14,'Canada'),(13,'Chile'),(6,'España'),(3,'EstadosUnidos'),(2,'Francia'),(9,'GranBretaña'),(8,'Italia'),(10,'Mexico'),(15,'Peru'),(5,'Uruguay');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Accion'),(11,'Animacion'),(2,'Aventura'),(3,'Ciencia Ficción'),(4,'Comedia'),(6,'Drama'),(7,'Fantasia'),(12,'Infantil'),(5,'Romance'),(9,'Suspense'),(10,'Terror');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Inside Out 2','Kelsey Mann',2024,'https://image.tmdb.org/t/p/w500//gMB8vgHu2lcyzv1fyptD6drHmJd.jpg',3,12),(2,'Furiosa a Mad Max Saga','George Miller',2024,' https://image.tmdb.org/t/p/w500//iADOJ8Zymht2JPMoy3R7xceZprc.jpg',3,1),(3,'Bad Boys Ride or Die','Adil El / ArbiBilall Fallah',2024,' https://image.tmdb.org/t/p/w500//nP6RliHjxsz4irTKsxe8FRhKZYl.jpg',3,4),(4,'If','John Krasinski',2024,'https://image.tmdb.org/t/p/w500//xbKFv4KF3sVYuWKllLlwWDmuZP7.jpg',3,12),(5,'Godzilla x Kong The new Impire','Adam Wingard',2024,'https://image.tmdb.org/t/p/w500//z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg',3,7),(6,'The Godfather','Francis Ford Coppola',1972,'https://http2.mlstatic.com/D_NQ_NP_2X_849311-MLA52604231932_112022-F.webp',3,1),(7,'Schindler´s List','Steven Spielberg',1993,'https://image.tmdb.org/t/p/original/xx4JCtIkUj31PJbPFRLhuBc1PRl.jpg',3,6),(8,'Dune','Denis Villeneuve',2021,'https://image.tmdb.org/t/p/w600_and_h900_bestv2/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',3,2),(9,'Oppenheimer','Christopher Nolan',2023,'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',3,1),(10,'Avengers: Endgame','Anthony Russo',2019,'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/or06FN3Dka5tukK1e9sl16pB3iy.jpg',3,11),(11,'The Terminator','James Cameron',1985,'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qvktm0BHcnmDpul4Hz01GIazWPr.jpg',3,3),(12,'Wonder Woman','Patty Jenkins',2017,'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg',3,7),(13,'Joker','Todd Phillips',2019,'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',3,7),(14,'Deadpool','Tim Miller',2016,'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3E53WEZJqP6aM84D8CckXx4pIHw.jpg',3,7),(15,'The Notebook','Nick Cassavetes',2004,'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rNzQyW4f8B8cQeg7Dgj3n6eT5k9.jpg',3,2),(16,'The Matrix','Lilly Wachowski',1999,'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',3,5);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_movie_ratings`
--

LOCK TABLES `user_movie_ratings` WRITE;
/*!40000 ALTER TABLE `user_movie_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_movie_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_movie_watches`
--

LOCK TABLES `user_movie_watches` WRITE;
/*!40000 ALTER TABLE `user_movie_watches` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_movie_watches` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2024-06-30 20:17:59
