/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.33 : Database - foodapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `item` varchar(255) NOT NULL,
  `desc` longtext,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `inventory` */

insert  into `inventory`(`id`,`user_id`,`item`,`desc`,`quantity`) values (1,2,'Apple',NULL,20),(2,2,'Banana',NULL,20),(3,2,'Orange',NULL,-990),(4,2,'Kiwi',NULL,0);

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sales` */

insert  into `sales`(`id`,`user_id`,`item_id`,`quantity_sold`,`transaction_date`) values (1,2,4,100,'2024-03-26 18:14:00'),(2,2,3,1000,'2024-03-26 18:16:46');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` enum('manager','staff','student') DEFAULT 'student',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`) values (1,'shariqrvt@gmail.com','$2y$10$bSam1kSH2TyTxsyyqX3G/.Ag/IOeA4RL1gDVW06OrIBbVjNX893bm','staff'),(2,'manager','$2y$10$sLIWGu9Ldd3BSuYMJXA.cu1LxGutsTQnvAa3kx2iS8LDdLdcLC1Bm','manager');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
