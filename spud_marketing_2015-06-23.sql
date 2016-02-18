# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.16)
# Database: spud_marketing
# Generation Time: 2015-06-24 00:39:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table gorm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gorm`;

CREATE TABLE `gorm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `version`, `active`, `date_created`, `description`, `last_updated`, `price`, `product_code`, `title`)
VALUES
	(1,4,00000001,'2014-03-17 10:51:43','','2014-03-17 10:52:28',NULL,'','test5'),
	(2,3,00000001,'2014-03-17 11:16:17','','2014-03-17 11:16:24',NULL,'','test5'),
	(3,0,00000001,'2014-03-17 11:35:04','','2014-03-17 11:35:04',NULL,'','Test'),
	(4,15,00000001,'2014-03-17 11:38:43','','2014-03-17 11:39:16',NULL,'','test16'),
	(5,11,00000001,'2014-03-17 11:48:51','','2014-03-17 11:49:25',NULL,'','david11'),
	(6,3,00000001,'2014-03-17 11:55:02','','2014-03-17 12:00:43',NULL,'','test9'),
	(7,3,00000001,'2014-03-17 12:13:13','','2014-03-17 12:21:30',NULL,'','test4'),
	(8,3,00000001,'2014-03-17 12:24:23','','2014-03-17 12:24:29',NULL,'','test4'),
	(9,83,00000001,'2014-03-17 12:31:16','','2014-03-17 13:52:43',NULL,'','david15'),
	(10,11,00000001,'2014-03-17 13:12:21','','2014-03-17 13:17:03',NULL,'','David11');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_media`;

CREATE TABLE `spud_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `attachment_file_name` varchar(255) NOT NULL,
  `croph` int(11) DEFAULT NULL,
  `crops` int(11) DEFAULT NULL,
  `cropw` int(11) DEFAULT NULL,
  `cropx` int(11) DEFAULT NULL,
  `cropy` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_protected` bit(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `site_id` int(11) NOT NULL,
  `attachment_content_type` varchar(255) NOT NULL,
  `attachment_file_size` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_media` WRITE;
/*!40000 ALTER TABLE `spud_media` DISABLE KEYS */;

INSERT INTO `spud_media` (`id`, `version`, `attachment_file_name`, `croph`, `crops`, `cropw`, `cropx`, `cropy`, `created_at`, `is_protected`, `updated_at`, `site_id`, `attachment_content_type`, `attachment_file_size`)
VALUES
	(19,0,'david2.jpg',NULL,NULL,NULL,NULL,NULL,'2014-10-17 09:51:31',00000000,'2014-10-17 09:51:31',0,'',0),
	(20,0,'02835_beforethestorm_2880x1800.jpg',NULL,NULL,NULL,NULL,NULL,'2014-10-17 09:51:43',00000000,'2014-10-17 09:51:43',0,'',0),
	(21,0,'faces_spriteSheet.png',NULL,NULL,NULL,NULL,NULL,'2014-12-04 14:59:41',00000000,'2014-12-04 14:59:41',0,'',0);

/*!40000 ALTER TABLE `spud_media` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_menu_items`;

CREATE TABLE `spud_menu_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `classes` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `spud_menu_id` bigint(20) NOT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `spud_page_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL,
  `parent_type` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6D177553F9CD9FBA` (`spud_page_id`),
  KEY `FK6D1775536256EDBA` (`spud_menu_id`),
  KEY `idx_menu_item_parent` (`parent_id`,`parent_type`),
  KEY `idx_menu_item_parent_id` (`parent_id`),
  CONSTRAINT `FK6D1775536256EDBA` FOREIGN KEY (`spud_menu_id`) REFERENCES `spud_menus` (`id`),
  CONSTRAINT `FK6D177553F9CD9FBA` FOREIGN KEY (`spud_page_id`) REFERENCES `spud_pages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_menu_items` WRITE;
/*!40000 ALTER TABLE `spud_menu_items` DISABLE KEYS */;

INSERT INTO `spud_menu_items` (`id`, `version`, `classes`, `created_at`, `updated_at`, `spud_menu_id`, `menu_order`, `name`, `spud_page_id`, `parent_id`, `parent_type`, `url`)
VALUES
	(1,5,NULL,'2014-02-22 10:55:46','2014-06-19 20:52:16',1,0,'Home',NULL,1,'SpudMenu','/#'),
	(2,5,NULL,'2014-02-22 10:55:53','2014-06-19 20:52:16',1,1,'Features',NULL,1,'SpudMenu','/#features'),
	(3,3,NULL,'2014-02-22 10:56:03','2014-06-19 20:52:16',1,2,'How to Use',NULL,1,'SpudMenu','/#how-to-use'),
	(5,3,NULL,'2014-02-22 10:56:19','2014-06-19 20:52:16',1,3,'News',NULL,1,'SpudMenu','/#news'),
	(6,3,NULL,'2014-02-22 10:56:24','2014-06-19 20:52:16',1,4,'Contact',NULL,1,'SpudMenu','/#contact'),
	(7,6,NULL,'2014-02-22 10:56:33','2014-06-19 20:52:16',1,5,'Documentation',2,1,'SpudMenu',NULL),
	(8,0,NULL,'2014-08-14 12:51:38','2014-08-14 12:51:38',2,0,'Home',4,2,'SpudMenu',NULL),
	(9,0,NULL,'2014-08-14 12:51:57','2014-08-14 12:51:57',2,1,'Main Site',NULL,2,'SpudMenu','http://localhost:8080/spud-marketing');

/*!40000 ALTER TABLE `spud_menu_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_menus`;

CREATE TABLE `spud_menus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` longtext,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`name`),
  KEY `idx_menu_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_menus` WRITE;
/*!40000 ALTER TABLE `spud_menus` DISABLE KEYS */;

INSERT INTO `spud_menus` (`id`, `version`, `created_at`, `description`, `updated_at`, `name`, `site_id`)
VALUES
	(1,0,'2014-02-22 10:55:38',NULL,'2014-02-22 10:55:38','Main',0),
	(2,0,'2014-08-14 12:49:22',NULL,'2014-08-14 12:49:22','Main',1);

/*!40000 ALTER TABLE `spud_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_page_partials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_page_partials`;

CREATE TABLE `spud_page_partials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `content` longtext,
  `content_processed` longtext,
  `created_at` datetime NOT NULL,
  `format` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `symbol_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7369156F44166B4D` (`page_id`),
  CONSTRAINT `FK7369156F44166B4D` FOREIGN KEY (`page_id`) REFERENCES `spud_pages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_page_partials` WRITE;
/*!40000 ALTER TABLE `spud_page_partials` DISABLE KEYS */;

INSERT INTO `spud_page_partials` (`id`, `version`, `content`, `content_processed`, `created_at`, `format`, `updated_at`, `name`, `page_id`, `symbol_name`)
VALUES
	(62,1,'<p>Test Stuff</p>',NULL,'2014-02-26 17:11:04','html','2014-02-26 17:12:34','Content',2,'content'),
	(66,1,'<h1>Features</h1>\r\n<p>&nbsp;</p>\r\n<p>{{{snippet name=\"Features\"}}}</p>','<h1>Features</h1>\r\n<p>&nbsp;</p>\r\n<p>{{{snippet name=\"Features\"}}}</p>','2014-12-04 10:49:44','html','2014-12-04 10:49:44','Features',1,'features'),
	(67,1,'<p>Welcome to the NEw Website 2</p>','<p>Welcome to the NEw Website 2</p>','2014-12-04 16:36:49','html','2014-12-04 16:36:49','Content',4,'content');

/*!40000 ALTER TABLE `spud_page_partials` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_pages`;

CREATE TABLE `spud_pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` longtext,
  `page_order` int(11) NOT NULL,
  `publish_at` datetime DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `site_id` int(11) NOT NULL,
  `spud_page_id` bigint(20) DEFAULT NULL,
  `template_engine` varchar(255) NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `url_name` varchar(255) NOT NULL,
  `use_custom_url_name` bit(1) NOT NULL,
  `visibility` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`url_name`),
  KEY `FK673B5B71F9CD9FBA` (`spud_page_id`),
  KEY `idx_page_url` (`site_id`,`url_name`),
  CONSTRAINT `FK673B5B71F9CD9FBA` FOREIGN KEY (`spud_page_id`) REFERENCES `spud_pages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_pages` WRITE;
/*!40000 ALTER TABLE `spud_pages` DISABLE KEYS */;

INSERT INTO `spud_pages` (`id`, `version`, `created_by`, `created_at`, `updated_at`, `layout`, `meta_description`, `meta_keywords`, `name`, `notes`, `page_order`, `publish_at`, `published`, `renderer`, `site_id`, `spud_page_id`, `template_engine`, `updated_by`, `url_name`, `use_custom_url_name`, `visibility`)
VALUES
	(1,39,NULL,'2014-02-22 10:23:59','2014-12-04 10:49:44','home',NULL,NULL,'Home',NULL,0,NULL,00000001,'gsp',0,NULL,'system',NULL,'home',00000000,0),
	(2,1,NULL,'2014-02-26 17:11:04','2014-02-26 17:12:34','page',NULL,NULL,'Documentation',NULL,0,NULL,00000001,'gsp',0,NULL,'system',NULL,'documentation',00000000,0),
	(4,2,NULL,'2014-08-14 11:21:41','2014-12-04 16:36:49','subsite',NULL,NULL,'Home',NULL,0,NULL,00000001,'gsp',1,NULL,'system',NULL,'home',00000000,0);

/*!40000 ALTER TABLE `spud_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_permalinks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_permalinks`;

CREATE TABLE `spud_permalinks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `attachment_id` bigint(20) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `destination_url` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `site_id` int(11) NOT NULL,
  `url_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_permalink_url` (`site_id`,`url_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_permalinks` WRITE;
/*!40000 ALTER TABLE `spud_permalinks` DISABLE KEYS */;

INSERT INTO `spud_permalinks` (`id`, `version`, `attachment_id`, `attachment_type`, `created_at`, `destination_url`, `updated_at`, `site_id`, `url_name`)
VALUES
	(1,0,NULL,NULL,'2014-08-14 13:01:50','/','2014-08-14 13:01:50',0,'/preview'),
	(2,0,NULL,NULL,'2014-08-14 13:02:34','/','2014-08-14 13:02:34',1,'/preview2');

/*!40000 ALTER TABLE `spud_permalinks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_post_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_post_categories`;

CREATE TABLE `spud_post_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `url_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_id` (`parent_id`,`name`),
  KEY `FK850FD6888792A084` (`parent_id`),
  CONSTRAINT `FK850FD6888792A084` FOREIGN KEY (`parent_id`) REFERENCES `spud_post_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table spud_post_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_post_sites`;

CREATE TABLE `spud_post_sites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `spud_site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE7A7E620F1E859B0` (`post_id`),
  CONSTRAINT `FKE7A7E620F1E859B0` FOREIGN KEY (`post_id`) REFERENCES `spud_posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_post_sites` WRITE;
/*!40000 ALTER TABLE `spud_post_sites` DISABLE KEYS */;

INSERT INTO `spud_post_sites` (`id`, `version`, `post_id`, `spud_site_id`)
VALUES
	(4,0,62,0),
	(5,0,64,0),
	(10,0,63,0);

/*!40000 ALTER TABLE `spud_post_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_posts`;

CREATE TABLE `spud_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `comments_count` int(11) NOT NULL,
  `comments_enabled` bit(1) NOT NULL,
  `content` longtext,
  `content_processed` longtext,
  `created_at` datetime NOT NULL,
  `content_format` varchar(255) NOT NULL,
  `is_news` bit(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `published_at` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `url_name` varchar(255) NOT NULL,
  `spud_user_id` bigint(20) NOT NULL,
  `visible` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_name` (`url_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_posts` WRITE;
/*!40000 ALTER TABLE `spud_posts` DISABLE KEYS */;

INSERT INTO `spud_posts` (`id`, `version`, `comments_count`, `comments_enabled`, `content`, `content_processed`, `created_at`, `content_format`, `is_news`, `updated_at`, `meta_description`, `meta_keywords`, `published_at`, `title`, `url_name`, `spud_user_id`, `visible`)
VALUES
	(2,0,0,00000000,'<p>This is a test blog post</p>\r\n<ul>\r\n<li>List 1</li>\r\n<li>List 2</li>\r\n<li>List 3</li>\r\n</ul>\r\n<p>It has lists and&nbsp;<strong>BOLD</strong>&nbsp;text and other magical things!</p>',NULL,'2014-02-25 09:49:36','html',00000000,'2014-02-25 09:49:36',NULL,NULL,'2014-02-25 09:49:00','Test Post','2014-02-25-test-post',1,00000001),
	(22,0,0,00000000,'<p>Spud has some really cool stuff in the works! Stay tuned to find out more!</p>',NULL,'2014-02-25 09:55:43','html',00000001,'2014-02-25 09:55:43',NULL,NULL,'2014-02-25 09:55:00','Spud Announcement 1','2014-02-25-spud-announcement-1',1,00000001),
	(42,2,0,00000000,'<p>Spud Grails is nearing release! Get ready to take advantage of a great platform.</p>','<p>Spud Grails is nearing release! Get ready to take advantage of a great platform.</p>','2014-02-25 09:56:34','html',00000001,'2014-10-03 10:08:03',NULL,NULL,'2014-02-25 09:55:00','Spud Grails First Release 2','2014-02-25-spud-grails-first-release',1,00000001),
	(62,14,0,00000000,'<p>Spud Rails is now Rails 4 Compatible. Take advantage of the Russian Doll caching!</p>','<p>Spud Rails is now Rails 4 Compatible. Take advantage of the Russian Doll caching!</p>','2014-02-25 09:57:29','html',00000001,'2014-10-03 10:18:28',NULL,NULL,'2014-02-25 09:56:00','Spud Rails Upgraded to Rails4','2014-02-25-spud-rails-upgraded-to-rails4',1,00000001),
	(63,15,0,00000000,'## My Test Post\r\n\r\n* List 1\r\n* List 2\r\n* List 3\r\n\r\n{{post.customFields.featureText}}\r\n\r\n```java\r\ndependencies {\r\n}\r\nplugins {\r\n  compile \':spud-blog:0.4.0\'\r\n}\r\n```\r\n\r\n**NOTE**: This should work\r\n\r\nSome CSS:\r\n\r\n```css\r\n\r\n.sidebar {\r\n  overflow: auto;\r\n  padding-right: 0px;\r\n  -webkit-overflow-scrolling: touch;\r\n}\r\n.sidebar ul {\r\n  /*margin-top: 80px;*/\r\n}\r\n.sidebar > ul > li > a\r\n{\r\n  color:#707070 !important;\r\n  background: #fff;\r\n  text-shadow:none !important;\r\n}\r\n.sidebar > ul > li a i {\r\n  color: #ecac58 !important;\r\n}\r\n\r\n\r\n.sidebar > ul > li > a,\r\n.sidebar > ul > li.active > a {\r\n  border-top:none !important;\r\n  border-bottom: 1px solid rgb(241,241,241) !important;\r\n}\r\n```','<h2>My Test Post</h2>\n<ul>\n<li>List 1</li>\n<li>List 2</li>\n<li>List 3</li>\n</ul>\n<p>{{post.customFields.featureText}}</p>\n<pre><code class=\"java\">dependencies {\n}\nplugins {\n  compile \':spud-blog:0.4.0\'\n}\n</code></pre>\n<p><strong>NOTE</strong>: This should work</p>\n<p>Some CSS:</p>\n<pre><code class=\"css\">.sidebar {\n  overflow: auto;\n  padding-right: 0px;\n  -webkit-overflow-scrolling: touch;\n}\n.sidebar ul {\n  /*margin-top: 80px;*/\n}\n.sidebar &gt; ul &gt; li &gt; a\n{\n  color:#707070 !important;\n  background: #fff;\n  text-shadow:none !important;\n}\n.sidebar &gt; ul &gt; li a i {\n  color: #ecac58 !important;\n}\n\n\n.sidebar &gt; ul &gt; li &gt; a,\n.sidebar &gt; ul &gt; li.active &gt; a {\n  border-top:none !important;\n  border-bottom: 1px solid rgb(241,241,241) !important;\n}\n</code></pre>\n','2014-05-14 14:42:25','markdown',00000001,'2015-03-23 08:45:18',NULL,NULL,'2014-05-14 14:41:00','Test Post','2014-05-14-test-post',3,00000001),
	(64,0,0,00000000,'## Testing 123\r\n\r\nThis is a brand new test post to see what will happen','<h2>Testing 123</h2>\n<p>This is a brand new test post to see what will happen</p>\n','2014-12-04 10:34:10','markdown',00000001,'2014-12-04 10:34:10',NULL,NULL,'2014-12-04 10:33:00','New Test Post','2014-12-04-new-test-post',3,00000001);

/*!40000 ALTER TABLE `spud_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_posts_custom_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_posts_custom_fields`;

CREATE TABLE `spud_posts_custom_fields` (
  `custom_fields` bigint(20) DEFAULT NULL,
  `custom_fields_idx` varchar(255) DEFAULT NULL,
  `custom_fields_elt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_posts_custom_fields` WRITE;
/*!40000 ALTER TABLE `spud_posts_custom_fields` DISABLE KEYS */;

INSERT INTO `spud_posts_custom_fields` (`custom_fields`, `custom_fields_idx`, `custom_fields_elt`)
VALUES
	(63,'featureText','Feature Text Example');

/*!40000 ALTER TABLE `spud_posts_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_role`;

CREATE TABLE `spud_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table spud_snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_snippets`;

CREATE TABLE `spud_snippets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `content` longtext,
  `content_processed` longtext,
  `created_at` datetime NOT NULL,
  `format` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_snippets` WRITE;
/*!40000 ALTER TABLE `spud_snippets` DISABLE KEYS */;

INSERT INTO `spud_snippets` (`id`, `version`, `content`, `content_processed`, `created_at`, `format`, `updated_at`, `name`, `site_id`)
VALUES
	(1,19,'<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_pageMgmt.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Page Management</h3>\r\n<p class=\"description\">Of Course! Setup editable areas, make different layouts, even use custom formatters.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_menuMgmt.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Menu Management</h3>\r\n<p class=\"description\">Every Site has to have some form of navigation. Spud makes it as easy as Drag and Drop.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_cache.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Cache Optimization</h3>\r\n<p class=\"description\">Don\'t want your site to get Fireballed or Slashdotted? Spud leverages the best caching for Rails and Grails.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_footprint.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Low Footprint</h3>\r\n<p class=\"description\">Spud stays out of your way and keeps memory / CPU usage to a minimum, so you can better leverage your servers.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_SEO.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">SEO Optimized</h3>\r\n<p class=\"description\">With clean markup, sitemaps, and meta; Spud makes SEO a sinch.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_siteMap.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Auto Site Map</h3>\r\n<p class=\"description\">Finally, a platform that knows how to tell those pesky bots where to look.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_RSS.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Auto RSS Feed</h3>\r\n<p class=\"description\">Have a lot to say? Maximize your audience with RSS built right in.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_mediaMgmt.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Media Management</h3>\r\n<p class=\"description\">Upload It. Crop It. Scale It. You name it! Leverage the cloud while you\'re at it.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_bannerMgmt.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Banner Management</h3>\r\n<p class=\"description\">Want some fancy pictures to swish about? Drag and Drop upload makes it easy.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_decoupling.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Decoupling</h3>\r\n<p class=\"description\">Modular Design is what makes this platform great. Pick the parts you need, leave out the cruft.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_admin.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Clean Admin</h3>\r\n<p class=\"description\">Maintaining your site should be easy. A clean, focused, easy to use interface is key!</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_multisite.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Multi-site</h3>\r\n<p class=\"description\">Sometimes one website just isnt enough, save yourself some time and manage them in one place!</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_layouts.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Dynamic Layouts</h3>\r\n<p class=\"description\">We thought about the guy designing the website. Keep it simple and stick your platform, or store them in the cloud for easy adjustment.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_blogging.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Blogging</h3>\r\n<p class=\"description\">Share your thoughts. Take comments. Block the Spam!&nbsp;</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_gallery.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Gallery/Album Management</h3>\r\n<p class=\"description\">A picture is worth a thousand words. So why not a thousand photos?</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img src=\"/assets/features_news.png\" alt=\"feature icon\" width=\"83\" height=\"83\" />\r\n<h3 class=\"title\">News/Events Management</h3>\r\n<p class=\"description\">Extra! Extra! Read all about it! Spread the news, advertise events the way you want to. FY</p>\r\n</div>\r\n</div>','<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_pageMgmt.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Page Management</h3>\r\n<p class=\"description\">Of Course! Setup editable areas, make different layouts, even use custom formatters.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_menuMgmt.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Menu Management</h3>\r\n<p class=\"description\">Every Site has to have some form of navigation. Spud makes it as easy as Drag and Drop.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_cache.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Cache Optimization</h3>\r\n<p class=\"description\">Don\'t want your site to get Fireballed or Slashdotted? Spud leverages the best caching for Rails and Grails.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_footprint.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Low Footprint</h3>\r\n<p class=\"description\">Spud stays out of your way and keeps memory / CPU usage to a minimum, so you can better leverage your servers.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_SEO.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">SEO Optimized</h3>\r\n<p class=\"description\">With clean markup, sitemaps, and meta; Spud makes SEO a sinch.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_siteMap.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Auto Site Map</h3>\r\n<p class=\"description\">Finally, a platform that knows how to tell those pesky bots where to look.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_RSS.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Auto RSS Feed</h3>\r\n<p class=\"description\">Have a lot to say? Maximize your audience with RSS built right in.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_mediaMgmt.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Media Management</h3>\r\n<p class=\"description\">Upload It. Crop It. Scale It. You name it! Leverage the cloud while you\'re at it.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_bannerMgmt.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Banner Management</h3>\r\n<p class=\"description\">Want some fancy pictures to swish about? Drag and Drop upload makes it easy.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_decoupling.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Decoupling</h3>\r\n<p class=\"description\">Modular Design is what makes this platform great. Pick the parts you need, leave out the cruft.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_admin.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Clean Admin</h3>\r\n<p class=\"description\">Maintaining your site should be easy. A clean, focused, easy to use interface is key!</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_multisite.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Multi-site</h3>\r\n<p class=\"description\">Sometimes one website just isnt enough, save yourself some time and manage them in one place!</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_layouts.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Dynamic Layouts</h3>\r\n<p class=\"description\">We thought about the guy designing the website. Keep it simple and stick your platform, or store them in the cloud for easy adjustment.</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_blogging.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Blogging</h3>\r\n<p class=\"description\">Share your thoughts. Take comments. Block the Spam!&nbsp;</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img class=\"image\" src=\"/assets/features_gallery.png\" alt=\"feature icon\" />\r\n<h3 class=\"title\">Gallery/Album Management</h3>\r\n<p class=\"description\">A picture is worth a thousand words. So why not a thousand photos?</p>\r\n</div>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<div class=\"feature-container\"><img src=\"/assets/features_news.png\" alt=\"feature icon\" width=\"83\" height=\"83\" />\r\n<h3 class=\"title\">News/Events Management</h3>\r\n<p class=\"description\">Extra! Extra! Read all about it! Spread the news, advertise events the way you want to. FY</p>\r\n</div>\r\n</div>','2014-02-22 15:18:34','html','2014-12-04 10:31:57','Features',0),
	(2,1,'<p>Cool Features Go Here</p>','<p>Cool Features Go Here</p>','2014-08-14 12:41:31','html','2014-08-14 12:41:31','Sub Features',1),
	(3,6,'<p>My Test Snippet Sucks</p>','<p>My Test Snippet</p>','2014-12-04 10:09:47','html','2014-12-04 10:22:11','Test',0),
	(4,1,'<p>Heyo to you too</p>','<p>Heyo to you too</p>','2014-12-04 15:35:57','html','2014-12-04 15:36:05','My Snippet',0),
	(5,1,'<p>Hey0 to you too</p>','<p>Hey0 to you too</p>','2014-12-04 15:36:20','html','2014-12-04 15:36:25','Subsite Snippet',1);

/*!40000 ALTER TABLE `spud_snippets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spud_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_user_role`;

CREATE TABLE `spud_user_role` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK38F7C1978EC1DD12` (`role_id`),
  KEY `FK38F7C19733ECA0F2` (`user_id`),
  CONSTRAINT `FK38F7C19733ECA0F2` FOREIGN KEY (`user_id`) REFERENCES `spud_users` (`id`),
  CONSTRAINT `FK38F7C1978EC1DD12` FOREIGN KEY (`role_id`) REFERENCES `spud_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table spud_user_spud_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_user_spud_role`;

CREATE TABLE `spud_user_spud_role` (
  `spud_role_id` bigint(20) NOT NULL,
  `spud_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`spud_role_id`,`spud_user_id`),
  KEY `FKFE5DB6A84479117F` (`spud_role_id`),
  KEY `FKFE5DB6A8E9A3D55F` (`spud_user_id`),
  CONSTRAINT `FKFE5DB6A84479117F` FOREIGN KEY (`spud_role_id`) REFERENCES `spud_role` (`id`),
  CONSTRAINT `FKFE5DB6A8E9A3D55F` FOREIGN KEY (`spud_user_id`) REFERENCES `spud_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table spud_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_users`;

CREATE TABLE `spud_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `failed_login_count` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` datetime DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `last_request_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `login` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `perishable_token` varchar(255) DEFAULT NULL,
  `persistence_token` varchar(255) DEFAULT NULL,
  `single_access_token` varchar(255) DEFAULT NULL,
  `super_admin` bit(1) NOT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spud_users` WRITE;
/*!40000 ALTER TABLE `spud_users` DISABLE KEYS */;

INSERT INTO `spud_users` (`id`, `version`, `account_expired`, `account_locked`, `current_login_at`, `created_at`, `email`, `enabled`, `failed_login_count`, `first_name`, `last_login_at`, `last_login_ip`, `last_name`, `last_request_at`, `updated_at`, `login`, `login_count`, `crypted_password`, `password_expired`, `password_salt`, `perishable_token`, `persistence_token`, `single_access_token`, `super_admin`, `time_zone`)
VALUES
	(3,0,00000000,00000000,NULL,'2014-05-14 14:41:43','destes@bcap.com',00000001,0,NULL,NULL,NULL,NULL,NULL,'2014-05-14 14:41:43','bertram',0,'b7db62b2a1e9aba5d5a4094cffc52a26c9e2475e57708bd03bc2feb1666bf0e32bc5fa3178975c15408d54b3b563754182b9bfcb6d187b9cdb5e0159f030ed42',00000000,'bertram',NULL,NULL,NULL,00000001,NULL);

/*!40000 ALTER TABLE `spud_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
