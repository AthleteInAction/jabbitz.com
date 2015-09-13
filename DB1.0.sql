# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: us-cdbr-iron-east-02.cleardb.net (MySQL 5.5.42-log)
# Database: heroku_ff3ec29963d3093
# Generation Time: 2015-09-13 00:28:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table chimes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chimes`;

CREATE TABLE `chimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `interaction_date` date DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `body_short` varchar(255) DEFAULT NULL,
  `employer` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `flagged` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `chimes` WRITE;
/*!40000 ALTER TABLE `chimes` DISABLE KEYS */;

INSERT INTO `chimes` (`id`, `category`, `rating`, `interaction_date`, `site`, `body`, `body_html`, `body_short`, `employer`, `job_title`, `location`, `school`, `created_at`, `updated_at`, `user_id`, `author_id`, `flagged`)
VALUES
	(2,'other',10,'2015-03-17',NULL,'Will and I met at Jake\'s Pizza on Lincoln ave.  We had discussed the development of my new website as well as we both ate dinner.  Will is extremely professional, gifted and talented both as a businessman and developer.  I had a great overall experience with Will and would continue to do business with Will moving forward.',NULL,NULL,NULL,NULL,'Willow Glen Ca',NULL,'2015-05-05 20:03:55','2015-05-15 00:35:29',2,62,232),
	(12,'other',NULL,'2015-04-27',NULL,'Aaron and I met at the little leauge park to watch the boys play baseball.',NULL,NULL,NULL,NULL,'San Jose',NULL,'2015-05-05 20:49:39','2015-05-15 00:35:33',22,62,409),
	(72,'other',6,'2015-05-13',NULL,'sdsdsdsdadsdssssssss',NULL,NULL,NULL,NULL,'sds',NULL,'2015-05-07 01:25:30','2015-05-07 01:25:30',112,72,347),
	(82,'other',10,'2015-05-01',NULL,'I have known Mike for years and he is a great father, husband and friend.  We had met up with him for dinner and drinks and he was quite the gentleman and took care of the bill for all of us that were there. He is always a positive person with great energy.',NULL,NULL,NULL,NULL,'San Jose',NULL,'2015-05-07 22:26:19','2015-05-07 22:26:19',32,132,8),
	(92,'other',9,'2015-05-05',NULL,'I met Mike for lunch at the Red Lobster.  We had pleasent conversation and enjoyed a couple of drinks. Mike really likes to drink!',NULL,NULL,NULL,NULL,'San Jose',NULL,'2015-05-07 22:29:09','2015-05-07 22:29:09',32,62,2),
	(102,'dating',9,'2015-05-01','http://www.Match.com','Tina and I met on Match.com about three months ago.  Her and I have been texting and talking, but have yet to meet in person, until last Friday.  Tina and I met for dinner and drinks, in Downtown Campbell.  She picked the restaurant and Sushi it was....\nWhen I first saw Tina I was completely blown away at how beautiful she looked.  Our dinner conversation flowed very well and I was completely engaged with Tina and what she had to say.  After we stopped off at the local watering hole where Tina and I had a couple of drinks, danced and had a truly great time, I drove Tina back to her car for a quick goodbye.  I can\'t wait to see what our next date brings.',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-08 23:14:21','2015-05-08 23:14:21',162,62,485),
	(112,'other',1,'2015-05-07',NULL,'Keep your head up next game!',NULL,NULL,NULL,NULL,'Montreal, QC',NULL,'2015-05-12 18:25:06','2015-05-15 00:35:37',182,72,421),
	(122,'dating',9,'2015-05-07','https://www.match.com','I met Joe on Match and had been communicating back and forth via text.  We finally decided to go out and grab dinner and some drinks.  We chose Steamers in Los Gatos.  He was a true gentleman, he met me there with a beautiful bouquet of flowers, opened doors, and also pulled out my chair to be seated.  We had a great conversation over dinner and decided to go out again. Who knows what the future holds.....',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-14 01:57:16','2015-05-14 01:57:16',152,132,149),
	(132,'dating',5,'2015-05-01','https://www.tinder.com','I met Aaron on Tinder.  We decided to meet up with a group of friends in downtown Campbell.  It was an ok time. I thought he was a really nice guy however not my type. BUT..... He did hit it off with my friend and they had a great time talking.  They exchanged numbers and are going to go out again.',NULL,NULL,NULL,NULL,NULL,NULL,'2015-05-14 02:03:17','2015-05-14 02:03:17',22,132,483);

/*!40000 ALTER TABLE `chimes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20150402033443'),
	('20150402113738'),
	('20150407160717'),
	('20150407170953'),
	('20150414213036'),
	('20150422031602'),
	('20150422032350'),
	('20150422034904'),
	('20150501004533'),
	('20150501021628'),
	('20150505044401'),
	('20150505155833'),
	('20150507013315'),
	('20150509023629'),
	('20150512135528'),
	('20150512140046'),
	('20150514021433'),
	('20150514060811'),
	('20150514061127');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table socials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `socials`;

CREATE TABLE `socials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `socials` WRITE;
/*!40000 ALTER TABLE `socials` DISABLE KEYS */;

INSERT INTO `socials` (`id`, `user_id`, `uri`, `created_at`, `updated_at`, `category`, `profile`)
VALUES
	(2,182,'https://www.twitter.com/thegreatone','2015-05-12 18:22:36','2015-05-12 18:22:36','twitter','thegreatone');

/*!40000 ALTER TABLE `socials` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birth_month` int(11) DEFAULT NULL,
  `birth_date` int(11) DEFAULT NULL,
  `birth_year` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `floating` tinyint(1) DEFAULT '0',
  `promo_code` varchar(255) DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_expiration` datetime DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `access` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `password_digest`, `created_at`, `updated_at`, `name`, `gender`, `birth_month`, `birth_date`, `birth_year`, `phone`, `address`, `city`, `state`, `zip_code`, `image`, `author_id`, `floating`, `promo_code`, `last_active`, `token`, `token_expiration`, `birthdate`, `access`)
VALUES
	(2,'will@wambl.com','$2a$10$DyurBJUOyFi5Jut2QHKWaONDCxzMM5nxld/gvwptNQ4VXZpGXF6L6','2015-04-02 06:07:10','2015-05-26 21:04:37','Will Robinson',NULL,10,11,1986,'321312321321',NULL,NULL,NULL,NULL,'v1430837648/profile_image_1429059868.png',NULL,0,NULL,'2015-05-26 21:04:37','1BO_d-Py6C091zqvW5Fm-g','2015-05-17 12:59:28','1986-10-11',1),
	(22,'Italian_town@yahoo.com','$2a$10$2m55JXU4mlJuLaduhIfv3.Io.a5v.8l7C7gRP2HDV5QVNhSBp72WG','2015-05-05 16:47:48','2015-05-05 20:37:22','Aaron Marinucci','male',4,15,1973,NULL,'2275','Campbell','Ca','95008','v1430844494/rcrkwjkv8sy4tgirzdmc.jpg',NULL,0,NULL,'2015-05-05 20:37:22',NULL,NULL,NULL,0),
	(32,'mikey_town@yahoo.com','$2a$10$GNgjRWtguVElhe0U/1JM4.JTp/K2KbhWrKPIJFacXVA6VgSEfeFLG','2015-05-05 16:59:34','2015-05-05 17:07:14','Mike','male',1,10,1972,NULL,'2121 Beat Street','San Jose','CA','95131','v1430845622/q16qpjtp2dzohaxusobd.jpg',NULL,0,NULL,'2015-05-05 17:07:14',NULL,NULL,NULL,0),
	(42,'50cent@oldrap.com','$2a$10$ah6qP2jtb.RRwv8N0r7yFeEP7.2S0ocA5O1RAHBsj0Nyl4qtN5tIe','2015-05-05 18:00:48','2015-05-05 18:08:54','G Unit','',NULL,NULL,2015,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2015-05-05 18:08:54',NULL,NULL,NULL,0),
	(62,'dm07122003@yahoo.com','$2a$10$xRp3KvI39oE.qNDaGiek0uhyUh1OgLwkYZ4fzeZ.qlUCKxGc.7wdO','2015-05-05 19:39:32','2015-05-25 20:08:31','Michael  Marinucci','male',9,24,1975,NULL,NULL,'San Jose','CA',NULL,NULL,NULL,0,NULL,'2015-05-25 20:08:31',NULL,NULL,'1975-09-24',0),
	(72,'toughguy@hockey.com','$2a$10$jcuOF.K8Uu407xB84k5jReT4RTFhBro0Uv5WiS6qM4uqVd5FPh8dK','2015-05-05 19:43:27','2015-05-12 18:28:05','Ross \"The Boss\" Rhea','male',NULL,NULL,2015,NULL,NULL,'Halifax','NS',NULL,'v1430855124/gmj3ct6vpgqucmnemk2f.png',NULL,0,NULL,'2015-05-12 18:28:05',NULL,NULL,NULL,0),
	(82,'test@test.com','$2a$10$l8tHVlA/lkDHizmwQ8OXmeAK.Zf7vEO1VxfISuKtt253IKpQtc3Xq','2015-05-05 20:04:51','2015-05-05 20:04:51','Matt Miller',NULL,NULL,NULL,NULL,'123-456-7890',NULL,NULL,NULL,NULL,NULL,62,1,NULL,NULL,NULL,NULL,NULL,0),
	(92,'test@test.com','$2a$10$4P4A7j2BVdnKQzdJJjjCYeV36FV9VTPa399gy5BTZjGNc2AvT1I16','2015-05-05 20:05:16','2015-05-05 20:05:16','Matt Miller',NULL,NULL,NULL,NULL,'123-456-7890',NULL,NULL,NULL,NULL,NULL,62,1,NULL,NULL,NULL,NULL,NULL,0),
	(102,NULL,'$2a$10$.dQxx4je0hLahGFEL1o99OwXdnDoDMwAeeaPHmOvl6dGvullgAvOq','2015-05-05 20:18:38','2015-05-05 20:18:38','jennifer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62,1,NULL,NULL,NULL,NULL,NULL,0),
	(112,NULL,'$2a$10$tmHe0L4LhJJH3owGT9e1wukHBpOn4beOzrVOxPGN/QbhoAvt2Uyp6','2015-05-05 20:19:28','2015-05-05 20:19:28','Test T',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62,1,NULL,NULL,NULL,NULL,NULL,0),
	(122,'ruizchristian76@gmail.com','$2a$10$CC/7f/W0fbBV8YxNhhUaMeA3lx2RM6UzMM1G13oD6EpRMrFAGE.K.','2015-05-06 00:42:47','2015-05-06 00:45:58','Chris','male',NULL,9,1986,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2015-05-06 00:45:58',NULL,NULL,NULL,0),
	(132,'jwmsales@gmail.com','$2a$10$VdG.lRZK9wXrBFvRt/USo..D1HOQvzg2Q3algTbjPLZG.DJm3mnb2','2015-05-07 20:17:11','2015-05-14 02:04:51','Jennifer Willis','female',10,18,1975,NULL,'123 State St','San Jose','California','95118',NULL,NULL,0,NULL,'2015-05-14 02:04:51',NULL,NULL,NULL,0),
	(142,NULL,'$2a$10$idhrW3pmyc6Eqj9nJJXg1.4CPYfKaKY0K6aJvQNDuXTWZ7JTKaJp.','2015-05-08 02:05:54','2015-05-08 02:05:54','chris nice',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62,1,NULL,NULL,NULL,NULL,NULL,0),
	(152,'joea123@yahoo.com','$2a$10$eT5K0t4fH4HfYWCFIsRcQOMTVdQBf/PKLyMllhFlHDjpesuyfspI.','2015-05-08 22:58:14','2015-05-08 22:59:49','Joe Adams','male',4,1,1995,'408-650-4567',NULL,'San Jose','Ca',NULL,'v1431125954/jr43nqg5k4xou8juhnhj.jpg',NULL,0,NULL,'2015-05-08 22:59:49',NULL,NULL,NULL,0),
	(162,'TinaS123@gmail.com','$2a$10$EeYtJhLvSNRCCVIwzprcEuBiC7F/qbKAz2aDBbcywuKdwYMt8R6YC','2015-05-08 23:01:12','2015-05-08 23:01:44','Tina Stone','female',7,6,1992,'650-456-7890',NULL,'Campbell','Ca',NULL,'v1431126084/qikea58jnclxfvbyanwe.jpg',NULL,0,NULL,'2015-05-08 23:01:44',NULL,NULL,NULL,0),
	(172,'RandyR123@yahoo.co','$2a$10$uqOv20V3KO8E77sGNm9TEuSbkI3Hj7KANnkq41blzD7IIQos5qZNO','2015-05-08 23:02:47','2015-05-08 23:03:57','Randy Richards','male',3,7,1999,'669-345-6789',NULL,'Los Banos','Ca',NULL,'v1431126212/rujd1zm5ebv2tv0c5fw5.jpg',NULL,0,NULL,'2015-05-08 23:03:57',NULL,NULL,NULL,0),
	(182,NULL,'$2a$10$AqtjD1Hh6QRVm/emggLMOulVvEXleqm7dL1lPfyY6M2zQUKFacpZ6','2015-05-12 18:20:54','2015-05-12 18:21:54','Wayne Gretzky',NULL,NULL,NULL,NULL,NULL,NULL,'Edmonton','Alberta',NULL,'v1431454915/ochuvcdu0rpovdcgdkxc.jpg',72,1,NULL,NULL,'CljSgiTpFQopxSWtetozOQ',NULL,NULL,0),
	(192,'hitmebackkk@yahoo.com','$2a$10$SDJTGF87cpLfOv5Q9tBbsuMlOKxK/MLY4z9tWRru3C65KWI66aQzG','2015-05-13 18:16:54','2015-05-13 18:17:49','Uncle Tony','male',12,3,1987,NULL,NULL,NULL,NULL,NULL,'v1431541030/uuqlrpbr4sgrvxkm3a6k.gif',NULL,0,NULL,'2015-05-13 18:17:49','P_K4B1DI4NDD92P1YCNIng',NULL,NULL,0),
	(202,'giblin.JAMES@yahoo.com','$2a$10$UqGkhRo1flT3zZyIYl9MAudZuzS5bFkvQExkBkhMg2cPNPuvs398e','2015-07-01 22:56:43','2015-07-01 23:36:29','Jim Giblin','',NULL,NULL,2015,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2015-07-01 23:36:29','JVwrq3EbzeCW67lgqhOnYA',NULL,NULL,0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
