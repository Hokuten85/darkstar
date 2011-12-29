-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- G�n�r� le : Sam 25 Juin 2011 � 10:09
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de donn�es: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `pet_list`
--

DROP TABLE IF EXISTS `pet_list`;
CREATE TABLE IF NOT EXISTS `pet_list` (
  `petid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `poolid` int(10) unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `pet_list`
--

INSERT INTO `pet_list` VALUES (0, 'FireSpirit', 1341, 1, 99, 0);
INSERT INTO `pet_list` VALUES (1, 'IceSpirit', 2043, 1, 99, 0);
INSERT INTO `pet_list` VALUES (2, 'AirSpirit', 71, 1, 99, 0);
INSERT INTO `pet_list` VALUES (3, 'EarthSpirit', 1160, 1, 99, 0);
INSERT INTO `pet_list` VALUES (4, 'ThunderSpirit', 3912, 1, 99, 0);
INSERT INTO `pet_list` VALUES (5, 'WaterSpirit', 4309, 1, 99, 0);
INSERT INTO `pet_list` VALUES (6, 'LightSpirit', 2413, 1, 99, 0);
INSERT INTO `pet_list` VALUES (7, 'DarkSpirit', 913, 1, 99, 0);
INSERT INTO `pet_list` VALUES (8, 'Carbuncle', 636, 1, 99, 0);
INSERT INTO `pet_list` VALUES (9, 'Fenrir', 1322, 1, 99, 0);
INSERT INTO `pet_list` VALUES (10, 'Ifrit', 2050, 1, 99, 0);
INSERT INTO `pet_list` VALUES (11, 'Titan', 3931, 1, 99, 0);
INSERT INTO `pet_list` VALUES (12, 'Leviathan', 2402, 1, 99, 0);
INSERT INTO `pet_list` VALUES (13, 'Garuda', 1473, 1, 99, 0);
INSERT INTO `pet_list` VALUES (14, 'Shiva', 3607, 1, 99, 0);
INSERT INTO `pet_list` VALUES (15, 'Ramuh', 3317, 1, 99, 0);
INSERT INTO `pet_list` VALUES (16, 'Diabolos', 0, 1, 99, 0);
INSERT INTO `pet_list` VALUES (17, 'SheepFamiliar', 696, 23, 35, 3600);
INSERT INTO `pet_list` VALUES (18, 'HareFamiliar', 4256, 23, 35, 5400);
INSERT INTO `pet_list` VALUES (19, 'CrabFamiliar', 743, 23, 55, 1800);
INSERT INTO `pet_list` VALUES (20, 'CourierCarrie', 0, 23, 75, 1800);
INSERT INTO `pet_list` VALUES (21, 'Homunculus', 97, 23, 75, 3600);
INSERT INTO `pet_list` VALUES (22, 'FlytrapFamiliar', 421, 28, 40, 3600);
INSERT INTO `pet_list` VALUES (23, 'TigerFamiliar', 4050, 28, 40, 3600);
INSERT INTO `pet_list` VALUES (24, 'FlowerpotBill', 4482, 28, 40, 3600);
INSERT INTO `pet_list` VALUES (25, 'EftFamiliar', 1181, 33, 45, 3600);
INSERT INTO `pet_list` VALUES (26, 'LizardFamiliar', 1956, 33, 45, 3600);
INSERT INTO `pet_list` VALUES (27, 'MayflyFamiliar', 1454, 33, 45, 3600);
INSERT INTO `pet_list` VALUES (28, 'FunguarFamiliar', 1271, 33, 65, 3600);
INSERT INTO `pet_list` VALUES (29, 'BeetleFamiliar', 512, 38, 45, 3600);
INSERT INTO `pet_list` VALUES (30, 'AntlionFamiliar', 3141, 38, 50, 3600);
INSERT INTO `pet_list` VALUES (31, 'MiteFamiliar', 1040, 43, 55, 3600);
INSERT INTO `pet_list` VALUES (32, 'LullabyMelodia', 539, 43, 55, 3600);
INSERT INTO `pet_list` VALUES (33, 'KeenearedSteffi', 2107, 43, 55, 5400);
INSERT INTO `pet_list` VALUES (34, 'FlowerpotBen', 2762, 51, 63, 3600);
INSERT INTO `pet_list` VALUES (35, 'SaberSiravarde', 4079, 51, 63, 3600);
INSERT INTO `pet_list` VALUES (36, 'ColdbloodComo', 2311, 53, 65, 3600);
INSERT INTO `pet_list` VALUES (37, 'ShellbusterOrob', 1099, 53, 65, 3600);
INSERT INTO `pet_list` VALUES (38, 'VoraciousAudrey', 2556, 53, 75, 3600);
INSERT INTO `pet_list` VALUES (39, 'AmbusherAllie', 3848, 58, 75, 3600);
INSERT INTO `pet_list` VALUES (40, 'LifedrinkerLars', 307, 63, 75, 3600);
INSERT INTO `pet_list` VALUES (41, 'PanzerGalahad', 3755, 63, 75, 3600);
INSERT INTO `pet_list` VALUES (42, 'ChopsueyChucky', 3983, 63, 85, 1800);
INSERT INTO `pet_list` VALUES (43, 'AmigoSabotender', 3432, 75, 85, 1200);