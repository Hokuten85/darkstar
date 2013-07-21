-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu1

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
-- Table structure for table `zone_settings`
--

DROP TABLE IF EXISTS `zone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_settings` (
  `zoneid` smallint(3) unsigned NOT NULL DEFAULT '0',
  `zonetype` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zoneip` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `zoneport` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` tinytext NOT NULL,
  `music` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `battlesolo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `battlemulti` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `restriction` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tax` float(5,2) unsigned NOT NULL DEFAULT '0.00',
  `misc` smallint(5) unsigned NOT NULL DEFAULT '0',
  `navmesh` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`zoneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20 PACK_KEYS=1 CHECKSUM=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_settings`
--

LOCK TABLES `zone_settings` WRITE;
/*!40000 ALTER TABLE `zone_settings` DISABLE KEYS */;
INSERT INTO `zone_settings` VALUES (0,1,0016777343,54230,'Residential_Area',0,0,0,0,0.00,32,0);
INSERT INTO `zone_settings` VALUES (1,2,0016777343,54230,'Phanauet_Channel',229,218,219,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (2,2,0016777343,54230,'Carpenters_Landing',0,218,219,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (3,2,0016777343,54230,'Manaclipper',229,218,219,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (4,2,0016777343,54230,'Bibiki_Bay',0,218,219,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (5,2,0016777343,54230,'Uleguerand_Range',0,218,219,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (6,4,0016777343,54230,'Bearclaw_Pinnacle',220,220,220,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (7,2,0016777343,54230,'Attohwa_Chasm',0,218,219,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (8,4,0016777343,54230,'Boneyard_Gully',0,220,220,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (9,3,0016777343,54230,'PsoXja',225,218,219,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (10,4,0016777343,54230,'The_Shrouded_Maw',0,220,220,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (11,3,0016777343,54230,'Oldton_Movalpolos',221,218,219,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (12,3,0016777343,54230,'Newton_Movalpolos',221,218,219,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (13,4,0016777343,54230,'Mine_Shaft_2716',0,220,220,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (14,3,0016777343,54230,'Hall_of_Transference',0,218,219,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (15,2,0016777343,54230,'Abyssea-Konschtat',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (16,3,0016777343,54230,'Promyvion-Holla',222,218,219,30,0.00,145,0);
INSERT INTO `zone_settings` VALUES (17,4,0016777343,54230,'Spire_of_Holla',0,220,220,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (18,3,0016777343,54230,'Promyvion-Dem',222,218,219,30,0.00,145,0);
INSERT INTO `zone_settings` VALUES (19,4,0016777343,54230,'Spire_of_Dem',0,220,220,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (20,3,0016777343,54230,'Promyvion-Mea',222,218,219,30,0.00,145,0);
INSERT INTO `zone_settings` VALUES (21,4,0016777343,54230,'Spire_of_Mea',0,220,220,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (22,3,0016777343,54230,'Promyvion-Vahzl',222,218,219,50,0.00,145,0);
INSERT INTO `zone_settings` VALUES (23,4,0016777343,54230,'Spire_of_Vahzl',0,220,220,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (24,2,0016777343,54230,'Lufaise_Meadows',230,218,219,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (25,2,0016777343,54230,'Misareaux_Coast',230,218,219,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (26,1,0016777343,54230,'Tavnazian_Safehold',245,218,219,0,0.00,104,0);
INSERT INTO `zone_settings` VALUES (27,3,0016777343,54230,'Phomiuna_Aqueducts',0,218,219,40,0.00,145,0);
INSERT INTO `zone_settings` VALUES (28,3,0016777343,54230,'Sacrarium',0,218,219,50,0.00,145,0);
INSERT INTO `zone_settings` VALUES (29,3,0016777343,54230,'Riverne-Site_B01',0,218,219,50,0.00,153,0);
INSERT INTO `zone_settings` VALUES (30,3,0016777343,54230,'Riverne-Site_A01',0,218,219,40,0.00,153,0);
INSERT INTO `zone_settings` VALUES (31,4,0016777343,54230,'Monarch_Linn',0,220,220,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (32,1,0016777343,54230,'Sealions_Den',0,218,219,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (33,2,0016777343,54230,'AlTaieu',233,218,219,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (34,3,0016777343,54230,'Grand_Palace_of_HuXzoi',228,218,219,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (35,3,0016777343,54230,'The_Garden_of_RuHmet',228,218,219,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (36,4,0016777343,54230,'Empyreal_Paradox',0,220,220,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (37,4,0016777343,54230,'Temenos',0,218,219,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (38,4,0016777343,54230,'Apollyon',0,218,219,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (39,5,0016777343,54230,'Dynamis-Valkurm',121,218,219,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (40,5,0016777343,54230,'Dynamis-Buburimu',121,218,219,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (41,5,0016777343,54230,'Dynamis-Qufim',121,218,219,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (42,5,0016777343,54230,'Dynamis-Tavnazia',121,218,219,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (43,2,0016777343,54230,'Diorama_Abdhaljs-Ghelsba',0,218,219,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (44,2,0016777343,54230,'Abdhaljs_Isle-Purgonorgo',0,218,219,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (45,2,0016777343,54230,'Abyssea-Tahrongi',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (46,2,0016777343,54230,'Open_sea_route_to_Al_Zahbi',147,139,139,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (47,2,0016777343,54230,'Open_sea_route_to_Mhaura',147,139,139,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (48,1,0016777343,54230,'Al_Zahbi',178,139,139,0,0.00,24,0);
INSERT INTO `zone_settings` VALUES (49,0,0016777343,0,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (50,1,0016777343,54230,'Aht_Urhgan_Whitegate',178,139,139,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (51,2,0016777343,54230,'Wajaom_Woodlands',149,139,139,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (52,2,0016777343,54230,'Bhaflau_Thickets',149,139,139,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (53,2,0016777343,54230,'Nashmau',175,139,139,0,0.00,40,0);
INSERT INTO `zone_settings` VALUES (54,2,0016777343,54230,'Arrapago_Reef',150,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (55,3,0016777343,54230,'Ilrusi_Atoll',0,138,138,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (56,3,0016777343,54230,'Periqia',0,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (57,4,0016777343,54230,'Talacca_Cove',0,143,143,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (58,2,0016777343,54230,'Silver_Sea_route_to_Nashmau',147,139,139,0,0.00,16,0);
INSERT INTO `zone_settings` VALUES (59,2,0016777343,54230,'Silver_Sea_route_to_Al_Zahbi',147,139,139,0,0.00,16,0);
INSERT INTO `zone_settings` VALUES (60,3,0016777343,54230,'The_Ashu_Talif',172,143,143,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (61,2,0016777343,54230,'Mount_Zhayolm',0,139,139,0,0.00,154,0);
INSERT INTO `zone_settings` VALUES (62,3,0016777343,54230,'Halvung',0,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (63,2,0016777343,54230,'Lebros_Cavern',0,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (64,4,0016777343,54230,'Navukgo_Execution_Chamber',0,143,143,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (65,3,0016777343,54230,'Mamook',0,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (66,3,0016777343,54230,'Mamool_Ja_Training_Grounds',0,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (67,4,0016777343,54230,'Jade_Sepulcher',0,143,143,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (68,3,0016777343,54230,'Aydeewa_Subterrane',174,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (69,3,0016777343,54230,'Leujaoam_Sanctum',0,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (70,1,0016777343,54230,'Chocobo_Circuit',176,139,139,0,0.00,4,0);
INSERT INTO `zone_settings` VALUES (71,1,0016777343,54230,'The_Colosseum',0,139,139,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (72,3,0016777343,54230,'Alzadaal_Undersea_Ruins',0,138,138,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (73,3,0016777343,54230,'Zhayolm_Remnants',148,138,138,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (74,3,0016777343,54230,'Arrapago_Remnants',148,138,138,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (75,3,0016777343,54230,'Bhaflau_Remnants',148,138,138,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (76,3,0016777343,54230,'Silver_Sea_Remnants',148,138,138,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (77,3,0016777343,54230,'Nyzul_Isle',148,138,138,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (78,4,0016777343,54230,'Hazhalm_Testing_Grounds',0,143,143,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (79,2,0016777343,54230,'Caedarva_Mire',173,139,139,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (80,1,0016777343,54230,'Southern_San_dOria_[S]',254,215,215,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (81,2,0016777343,54230,'East_Ronfaure_[S]',251,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (82,2,0016777343,54230,'Jugner_Forest_[S]',0,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (83,2,0016777343,54230,'Vunkerl_Inlet_[S]',0,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (84,2,0016777343,54230,'Batallia_Downs_[S]',252,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (85,2,0016777343,54230,'La_Vaule_[S]',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (86,3,0016777343,54230,'Everbloom_Hollow',0,216,216,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (87,1,0016777343,54230,'Bastok_Markets_[S]',180,215,215,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (88,2,0016777343,54230,'North_Gustaberg_[S]',253,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (89,2,0016777343,54230,'Grauberg_[S]',0,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (90,2,0016777343,54230,'Pashhow_Marshlands_[S]',0,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (91,2,0016777343,54230,'Rolanberry_Fields_[S]',252,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (92,3,0016777343,54230,'Beadeaux_[S]',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (93,3,0016777343,54230,'Ruhotz_Silvermines',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (94,1,0016777343,54230,'Windurst_Waters_[S]',182,215,215,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (95,2,0016777343,54230,'West_Sarutabaruta_[S]',141,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (96,3,0016777343,54230,'Fort_Karugo-Narugo_[S]',0,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (97,2,0016777343,54230,'Meriphataud_Mountains_[S]',0,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (98,2,0016777343,54230,'Sauromugue_Champaign_[S]',252,215,215,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (99,3,0016777343,54230,'Castle_Oztroja_[S]',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (100,2,0016777343,54230,'West_Ronfaure',109,101,103,0,0.00,156,1);
INSERT INTO `zone_settings` VALUES (101,2,0016777343,54230,'East_Ronfaure',109,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (102,2,0016777343,54230,'La_Theine_Plateau',0,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (103,2,0016777343,54230,'Valkurm_Dunes',0,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (104,2,0016777343,54230,'Jugner_Forest',0,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (105,2,0016777343,54230,'Batallia_Downs',114,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (106,2,0016777343,54230,'North_Gustaberg',116,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (107,2,0016777343,54230,'South_Gustaberg',116,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (108,2,0016777343,54230,'Konschtat_Highlands',0,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (109,2,0016777343,54230,'Pashhow_Marshlands',0,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (110,2,0016777343,54230,'Rolanberry_Fields',118,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (111,2,0016777343,54230,'Beaucedine_Glacier',0,101,103,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (112,2,0016777343,54230,'Xarcabard',164,101,103,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (113,2,0016777343,54230,'Cape_Teriggan',0,191,191,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (114,2,0016777343,54230,'Eastern_Altepa_Desert',171,191,191,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (115,2,0016777343,54230,'West_Sarutabaruta',113,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (116,2,0016777343,54230,'East_Sarutabaruta',113,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (117,2,0016777343,54230,'Tahrongi_Canyon',0,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (118,2,0016777343,54230,'Buburimu_Peninsula',0,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (119,2,0016777343,54230,'Meriphataud_Mountains',0,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (120,2,0016777343,54230,'Sauromugue_Champaign',158,101,103,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (121,2,0016777343,54230,'The_Sanctuary_of_ZiTah',190,191,191,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (122,2,0016777343,54230,'RoMaeve',211,191,191,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (123,2,0016777343,54230,'Yuhtunga_Jungle',134,191,191,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (124,2,0016777343,54230,'Yhoator_Jungle',134,191,191,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (125,2,0016777343,54230,'Western_Altepa_Desert',171,191,191,0,0.00,156,0);
INSERT INTO `zone_settings` VALUES (126,2,0016777343,54230,'Qufim_Island',0,101,103,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (127,2,0016777343,54230,'Behemoths_Dominion',0,101,103,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (128,2,0016777343,54230,'Valley_of_Sorrows',0,191,191,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (129,0,0016777343,54230,'Ghoyus_Reverie',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (130,1,0016777343,54230,'RuAun_Gardens',210,191,191,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (131,3,0016777343,54230,'Mordion_Gaol',0,101,103,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (132,2,0016777343,54230,'Abyssea-La_Theine',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (133,0,0016777343,0,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (134,5,0016777343,54230,'Dynamis-Beaucedine',121,115,102,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (135,5,0016777343,54230,'Dynamis-Xarcabard',119,115,102,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (136,2,0016777343,54230,'Beaucedine_Glacier_[S]',0,215,215,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (137,2,0016777343,54230,'Xarcabard_[S]',0,215,215,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (138,3,0016777343,54230,'Castle_Zvahl_Baileys_[S]',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (139,4,0016777343,54230,'Horlais_Peak',0,125,125,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (140,3,0016777343,54230,'Ghelsba_Outpost',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (141,3,0016777343,54230,'Fort_Ghelsba',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (142,3,0016777343,54230,'Yughott_Grotto',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (143,3,0016777343,54230,'Palborough_Mines',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (144,4,0016777343,54230,'Waughroon_Shrine',125,125,125,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (145,3,0016777343,54230,'Giddeus',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (146,4,0016777343,54230,'Balgas_Dais',0,125,125,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (147,3,0016777343,54230,'Beadeaux',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (148,3,0016777343,54230,'Qulun_Dome',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (149,3,0016777343,54230,'Davoi',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (150,3,0016777343,54230,'Monastic_Cavern',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (151,3,0016777343,54230,'Castle_Oztroja',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (152,3,0016777343,54230,'Altar_Room',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (153,3,0016777343,54230,'The_Boyahda_Tree',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (154,3,0016777343,54230,'Dragons_Aery',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (155,3,0016777343,54230,'Castle_Zvahl_Keep_[S]',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (156,4,0016777343,54230,'Throne_Room_[S]',0,217,217,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (157,3,0016777343,54230,'Middle_Delkfutts_Tower',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (158,3,0016777343,54230,'Upper_Delkfutts_Tower',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (159,3,0016777343,54230,'Temple_of_Uggalepih',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (160,3,0016777343,54230,'Den_of_Rancor',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (161,3,0016777343,54230,'Castle_Zvahl_Baileys',155,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (162,3,0016777343,54230,'Castle_Zvahl_Keep',155,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (163,4,0016777343,54230,'Sacrificial_Chamber',0,193,193,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (164,3,0016777343,54230,'Garlaige_Citadel_[S]',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (165,4,0016777343,54230,'Throne_Room',0,125,125,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (166,3,0016777343,54230,'Ranguemont_Pass',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (167,3,0016777343,54230,'Bostaunieux_Oubliette',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (168,4,0016777343,54230,'Chamber_of_Oracles',0,193,193,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (169,3,0016777343,54230,'Toraimarai_Canal',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (170,4,0016777343,54230,'Full_Moon_Fountain',0,193,193,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (171,3,0016777343,54230,'Crawlers_Nest_[S]',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (172,3,0016777343,54230,'Zeruhn_Mines',0,115,102,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (173,3,0016777343,54230,'Korroloka_Tunnel',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (174,3,0016777343,54230,'Kuftal_Tunnel',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (175,3,0016777343,54230,'The_Eldieme_Necropolis_[S]',0,216,216,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (176,3,0016777343,54230,'Sea_Serpent_Grotto',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (177,3,0016777343,54230,'VeLugannon_Palace',207,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (178,3,0016777343,54230,'The_Shrine_of_RuAvitau',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (179,4,0016777343,54230,'Stellar_Fulcrum',0,193,193,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (180,4,0016777343,54230,'LaLoff_Amphitheater',0,193,193,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (181,4,0016777343,54230,'The_Celestial_Nexus',0,193,193,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (182,4,0016777343,54230,'Walk_of_Echoes',0,215,215,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (183,4,0016777343,54230,'Maquette_Abdhaljs_Legion',0,143,143,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (184,3,0016777343,54230,'Lower_Delkfutts_Tower',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (185,5,0016777343,54230,'Dynamis-San_dOria',121,115,102,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (186,5,0016777343,54230,'Dynamis-Bastok',121,115,102,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (187,5,0016777343,54230,'Dynamis-Windurst',121,115,102,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (188,5,0016777343,54230,'Dynamis-Jeuno',121,115,102,0,0.00,400,0);
INSERT INTO `zone_settings` VALUES (189,0,0016777343,0,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (190,3,0016777343,54230,'King_Ranperres_Tomb',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (191,3,0016777343,54230,'Dangruf_Wadi',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (192,3,0016777343,54230,'Inner_Horutoto_Ruins',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (193,3,0016777343,54230,'Ordelles_Caves',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (194,3,0016777343,54230,'Outer_Horutoto_Ruins',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (195,3,0016777343,54230,'The_Eldieme_Necropolis',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (196,3,0016777343,54230,'Gusgen_Mines',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (197,3,0016777343,54230,'Crawlers_Nest',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (198,3,0016777343,54230,'Maze_of_Shakhrami',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (199,0,0016777343,0,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (200,3,0016777343,54230,'Garlaige_Citadel',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (201,4,0016777343,54230,'Cloister_of_Gales',0,193,193,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (202,4,0016777343,54230,'Cloister_of_Storms',0,193,193,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (203,4,0016777343,54230,'Cloister_of_Frost',0,193,193,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (204,3,0016777343,54230,'FeiYin',0,115,102,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (205,3,0016777343,54230,'Ifrits_Cauldron',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (206,4,0016777343,54230,'QuBia_Arena',125,125,125,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (207,4,0016777343,54230,'Cloister_of_Flames',0,193,193,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (208,3,0016777343,54230,'Quicksand_Caves',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (209,4,0016777343,54230,'Cloister_of_Tremors',0,193,193,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (210,0,0016777343,0,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (211,4,0016777343,54230,'Cloister_of_Tides',0,193,193,0,0.00,144,0);
INSERT INTO `zone_settings` VALUES (212,3,0016777343,54230,'Gustav_Tunnel',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (213,3,0016777343,54230,'Labyrinth_of_Onzozo',0,192,192,0,0.00,145,0);
INSERT INTO `zone_settings` VALUES (214,1,0016777343,54230,'Residential_Area',0,0,0,0,0.00,32,0);
INSERT INTO `zone_settings` VALUES (215,2,0016777343,54230,'Abyssea-Attohwa',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (216,2,0016777343,54230,'Abyssea-Misareaux',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (217,2,0016777343,54230,'Abyssea-Vunkerl',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (218,2,0016777343,54230,'Abyssea-Altepa',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (219,0,0016777343,0,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (220,0,0016777343,54230,'Ship_bound_for_Selbina',106,101,103,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (221,0,0016777343,54230,'Ship_bound_for_Mhaura',106,101,103,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (222,4,0016777343,54230,'Provenance',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (223,2,0016777343,54230,'San_dOria-Jeuno_Airship',128,101,103,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (224,2,0016777343,54230,'Bastok-Jeuno_Airship',128,101,103,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (225,2,0016777343,54230,'Windurst-Jeuno_Airship',128,101,103,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (226,2,0016777343,54230,'Kazham-Jeuno_Airship',128,191,191,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (227,2,0016777343,54230,'Ship_bound_for_Selbina',106,101,103,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (228,2,0016777343,54230,'Ship_bound_for_Mhaura',106,101,103,0,0.00,152,0);
INSERT INTO `zone_settings` VALUES (229,0,0016777343,0,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (230,1,0016777343,54230,'Southern_San_dOria',107,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (231,1,0016777343,54230,'Northern_San_dOria',107,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (232,1,0016777343,54230,'Port_San_dOria',107,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (233,1,0016777343,54230,'Chateau_dOraguille',156,101,103,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (234,1,0016777343,54230,'Bastok_Mines',152,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (235,1,0016777343,54230,'Bastok_Markets',152,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (236,1,0016777343,54230,'Port_Bastok',152,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (237,1,0016777343,54230,'Metalworks',154,101,103,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (238,1,0016777343,54230,'Windurst_Waters',151,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (239,1,0016777343,54230,'Windurst_Walls',151,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (240,1,0016777343,54230,'Port_Windurst',151,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (241,1,0016777343,54230,'Windurst_Woods',151,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (242,1,0016777343,54230,'Heavens_Tower',162,101,103,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (243,1,0016777343,54230,'RuLude_Gardens',117,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (244,1,0016777343,54230,'Upper_Jeuno',110,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (245,1,0016777343,54230,'Lower_Jeuno',110,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (246,1,0016777343,54230,'Port_Jeuno',110,101,103,0,0.00,72,0);
INSERT INTO `zone_settings` VALUES (247,1,0016777343,54230,'Rabao',208,191,191,0,0.00,104,0);
INSERT INTO `zone_settings` VALUES (248,1,0016777343,54230,'Selbina',112,101,103,0,0.00,40,0);
INSERT INTO `zone_settings` VALUES (249,1,0016777343,54230,'Mhaura',105,101,103,0,0.00,40,0);
INSERT INTO `zone_settings` VALUES (250,1,0016777343,54230,'Kazham',135,191,191,0,0.00,40,0);
INSERT INTO `zone_settings` VALUES (251,1,0016777343,54230,'Hall_of_the_Gods',213,191,191,0,0.00,8,0);
INSERT INTO `zone_settings` VALUES (252,1,0016777343,54230,'Norg',209,191,191,0,0.00,104,0);
INSERT INTO `zone_settings` VALUES (253,2,0016777343,54230,'Abyssea-Uleguerand',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (254,2,0016777343,54230,'Abyssea-Grauberg',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (255,2,0016777343,54230,'Abyssea-Empyreal_Paradox',51,52,52,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (256,1,0016777343,54230,'Western_Adoulin',59,59,59,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (257,1,0016777343,54230,'Eastern_Adoulin',63,63,63,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (258,0,0016777343,54230,'Rala_Waterways',61,57,57,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (259,0,0016777343,54230,'Rala_Waterways_U',61,57,57,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (260,0,0016777343,54230,'Yahse_Hunting_Grounds',60,57,57,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (261,0,0016777343,54230,'Ceizak_Battlegrounds',60,57,57,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (262,0,0016777343,54230,'Foret_de_Hennetiel',60,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (263,0,0016777343,54230,'Yorcia_Weald',60,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (264,0,0016777343,54230,'Yorcia_Weald_U',60,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (265,0,0016777343,54230,'Morimar_Basalt_Fields',60,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (266,0,0016777343,54230,'Marjami_Ravine',60,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (267,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (268,0,0016777343,54230,'Sih_Gates',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (269,0,0016777343,54230,'Moh_Gates',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (270,0,0016777343,54230,'Cirdas_Caverns',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (271,0,0016777343,54230,'Cirdas_Caverns_U',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (272,0,0016777343,54230,'Dho_Gates',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (273,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (274,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (275,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (276,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (277,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (278,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (279,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (280,0,0016777343,54230,'Mog_Garden',67,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (281,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (282,0,0016777343,54230,'noname',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (283,0,0016777343,54230,'Silver_Knife',0,0,0,0,0.00,0,0);
INSERT INTO `zone_settings` VALUES (284,0,0016777343,54230,'Celennia_Wexworth_Memorial_Library',63,0,0,0,0.00,0,0);
/*!40000 ALTER TABLE `zone_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-06 23:02:18
