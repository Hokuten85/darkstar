/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 2/11/2013 11:16:49 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for chars
-- ----------------------------
DROP TABLE IF EXISTS `chars`;
CREATE TABLE `chars` (
  `charid` int(10) unsigned NOT NULL,
  `accid` int(10) unsigned NOT NULL,
  `charname` varchar(15) NOT NULL,
  `nation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pos_zone` smallint(3) unsigned NOT NULL,
  `pos_prevzone` smallint(3) unsigned NOT NULL DEFAULT '0',
  `pos_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  `boundary` smallint(5) unsigned NOT NULL DEFAULT '0',
  `home_zone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `home_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `home_x` float(7,3) NOT NULL DEFAULT '0.000',
  `home_y` float(7,3) NOT NULL DEFAULT '0.000',
  `home_z` float(7,3) NOT NULL DEFAULT '0.000',
  `merits` blob,
  `missions` blob,
  `quests` blob,
  `keyitems` blob,
  `spells` blob,
  `abilities` blob,
  `titles` blob,
  `zones` blob,
  `playtime` int(10) unsigned NOT NULL DEFAULT '0',
  `unlocked_weapons` blob,
  `gmlevel` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`),
  FULLTEXT KEY `charname` (`charname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
