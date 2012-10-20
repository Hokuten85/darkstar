-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 03 Février 2012 à 22:54
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `mob_skill`
--

DROP TABLE IF EXISTS `mob_skill`;
CREATE TABLE IF NOT EXISTS `mob_skill` (
  `mob_skill_id` smallint(4) unsigned NOT NULL,
  `family_id` smallint(3) unsigned NOT NULL,
  `mob_anim_id` smallint(4) unsigned NOT NULL,
  `mob_skill_name` char(20) CHARACTER SET latin1 NOT NULL,
  `mob_skill_aoe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_distance` float(3,1) NOT NULL DEFAULT '6.0',
  `mob_anim_time` smallint(4) unsigned NOT NULL DEFAULT '2000',
  `mob_prepare_time` smallint(4) unsigned NOT NULL DEFAULT '1500',
  `mob_valid_targets` smallint(4) unsigned NOT NULL DEFAULT '4',
  `mob_skill_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mob_skill_id`,`family_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mob_skill`
-- 

-- ------------------------------------------
-- Normal Monster
-- ------------------------------------------

-- Rabbits 
-- Base (206)
INSERT INTO `mob_skill` VALUES (1,206,1,'Foot_Kick', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (2,206,2,'Dust_Cloud', 4, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (3,206,3,'Whirl_Claws', 1, 5.0, 2000, 1500, 4, 0);
-- With Cure (317)
INSERT INTO `mob_skill` VALUES (1,317,1,'Foot_Kick', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (2,317,2,'Dust_Cloud', 4, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (3,317,3,'Whirl_Claws', 1, 5.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES(67, 317, 67, 'Wild_Carrot', 1, 20.0, 2000, 1500, 2, 0);
-- Snowy Area (318)
INSERT INTO `mob_skill` VALUES (3,318,3,'Whirl_Claws', 1, 5.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES(67, 318, 67, 'Wild_Carrot', 1, 20.0, 2000, 1500, 2, 0);
-- INSERT INTO `mob_skill` VALUES(405, 318, 0, 'Snow_Cloud', 4, 10.0, 2000, 1500, 4, 0);

-- Sheep
INSERT INTO `mob_skill` VALUES (4,226,4,'Lamb_Chop', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (5,226,5,'Rage', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (6,226,6,'Sheep_Charge', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (8,226,8,'Sheep_Song', 1, 10.0, 2000, 1500, 4, 0);

-- Karakul
INSERT INTO `mob_skill` VALUES (1581,167,1275,'Feeble_Bleat', 1, 18.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (4,167,4,'Lamb_Chop', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (5,167,5,'Rage', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (6,167,6,'Sheep_Charge', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (8,167,8,'Sheep_Song', 1, 10.0, 2000, 1500, 4, 0);

-- Ram
INSERT INTO `mob_skill` VALUES (9,208,9,'Rage', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (10,208,10,'Ram_Charge', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (11,208,11,'Rumble', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (12,208,12,'Great_Bleat', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (13,208,13,'Petribreath', 4, 10.0, 2000, 1500, 4, 0);

-- Tiger
INSERT INTO `mob_skill` VALUES (14,242,14,'Roar', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (15,242,15,'Razor_Fang', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (17,242,17,'Claw_Cyclone', 4, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,242,0,'Crossthrash', 0, 7.0, 2000, 1500, 4, 0); -- NM/Dyna/einherjar
-- INSERT INTO `mob_skill` VALUES (0,242,0,'Predatory_Glare', 4, 16.0, 2000, 1500, 4, 0); -- NM/Dyna/einherjar
-- INSERT INTO `mob_skill` VALUES (0,242,0,'Disorienting_Waul', 1, 18.0, 2000, 1500, 4, 0); -- used by certain NM

-- Dhalmel
INSERT INTO `mob_skill` VALUES (24,80,24,'Sonic_Wave', 4, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (25,80,25,'Stomping', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (28,80,28,'Cold_Stare', 4, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (29,80,29,'Whistle', 1, 20.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (30,80,30,'Berserk', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (31,80,31,'Healing_Breeze', 1, 15.0, 2000, 1500, 1, 0);

-- Opo-opo
INSERT INTO `mob_skill` VALUES (38,188,38,'Eye_Scratch', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (32,188,32,'Vicious_Claw', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (34,188,34,'Spinning_Claw', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (39,188,39,'Magic_Fruit', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES(35, 188, 35, 'Claw_Storm', 0, 7.0, 2000, 1500, 4, 0); -- 7hp/tick
INSERT INTO `mob_skill` VALUES(33, 188, 33, 'Stone_Throw', 0, 25.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES(36, 188, 36, 'Blank_Gaze', 0, 16.0, 2000, 1500, 4, 0);

-- Mandragora
INSERT INTO `mob_skill` VALUES (45,178,45,'Dream_Flower', 1, 15.0, 2000, 1500, 4, 0); -- Not used by Lycopodia
INSERT INTO `mob_skill` VALUES (46,178,46,'Wild_Oats', 0, 12.5, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (48,178,48,'Photosynthesis', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (49,178,49,'Leaf_Dagger', 0, 7.0, 2000, 1500, 4, 0); -- 1hp/tick
-- INSERT INTO `mob_skill` VALUES(44, 178, 44, 'Head_Butt', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES(50, 178, 50, 'Scream', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES(0, 178, 0, 'Petal_Pirouette', 0, 15.0, 2000, 1500, 4, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES(0, 178, 0, 'Demonic_Flower', 0, 7.0, 2000, 1500, 4, 0); -- Only used by certain NM

-- Morbol
INSERT INTO `mob_skill` VALUES (60,186,60,'Impale', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (61,186,61,'Vampiric_Lash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (63,186,63,'Bad_Breath', 4, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Sweet Breath', 4, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Impale', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Vampiric Root', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Vampiric Lash', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Drain Whip', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Extremely_Bad_Breath', 4, 7.0, 2000, 1500, 4, 0); -- used only by Evil Oscar, Cirrate Christelle, Livid***REMOVED*** Amooshah, Eccentric Eve and Melancholic Moira.

-- Sabotenders (cactuars)
INSERT INTO `mob_skill` VALUES (65,212,65,'Needleshot', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (66,212,66,'1000_Needles', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'2000_Needles', 1, 10.0, 2000, 1500, 4, 0); -- Only used by Nightmare Sabotender
-- INSERT INTO `mob_skill` VALUES (0,0,0,'4000_Needles', 1, 10.0, 2000, 1500, 4, 0); -- Only used by Nightmare Sabotender
-- INSERT INTO `mob_skill` VALUES (0,0,0,'10000_Needles', 1, 10.0, 2000, 1500, 4, 0); -- Only used by certain Notorious Monsters
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Photosynthesis', 0, 7.0, 2000, 1500, 2, 0);

-- Funguar
INSERT INTO `mob_skill` VALUES (52,116,52,'Frogkick', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (53,116,53,'Spore', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (54,116,54,'Queasyshroom', 0, 13.5, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Silence_Gas', 4, 13.5, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dark_Spore', 4, 13.5, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Numbshroom', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Shakeshroom', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Microspores', 1, 10.0, 2000, 1500, 4, 0); -- Only used by certain Notorious Monsters

-- Treant
INSERT INTO `mob_skill` VALUES (72,245,72,'Drill_Branch', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (73,245,73,'Pinecone_Bomb', 0, 23.5, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (75,245,75,'Leafstorm', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (76,245,76,'Entangle', 0, 7.0, 2000, 1500, 4, 0);

-- Bee
INSERT INTO `mob_skill` VALUES (80,48,80,'Final_Sting', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (79,48,79,'Pollen', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (78,48,78,'Sharp_Sting', 0, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Frenzy_Pollen', 0, 7.0, 2000, 1500, 2, 0); -- Only used by Nightmare Hornets and Chasmic Hornet. 

-- Beetle 
INSERT INTO `mob_skill` VALUES (82,49,82,'Power_Attack', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (83,49,83,'Hi-Freq_Field', 4, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (84,50,84,'Rhino_Attack', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Spoil', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Rhino Guard', 0, 7.0, 2000, 1500, 2, 0);



-- Crawler
INSERT INTO `mob_skill` VALUES (90,79,90,'Cocoon', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (89,79,89,'Poison_Breath', 4, 10.0, 2000, 1500, 4, 0); --  Not used by Eruca
INSERT INTO `mob_skill` VALUES (88,79,88,'Sticky_Thread', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Incinerate', 4, 10.0, 2000, 1500, 4, 0); -- only used by Eruca

-- Scorpion
INSERT INTO `mob_skill` VALUES (94,217,94,'Mandible_Bite', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (97,217,97,'Death_Scissors', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (98,217,98,'Wild_Rage', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (99,217,99,'Earth_Pounder', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Poison Sting', 0, 7.0, 2000, 1500, 4, 0); -- 1hp/tick
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Cold_Breath', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Numbing_Breath', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Sharp Strike', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Earthbreaker', 1, 40.0, 2000, 1500, 4, 0); -- NM/HNM only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Critical_Bite', 0, 7.0, 2000, 1500, 4, 0); -- NM/HNM only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Venom_Sting', 0, 7.0, 2000, 1500, 4, 0); -- NM/HNM only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Venom_Breath', 4, 10.0, 2000, 1500, 4, 0); -- NM/HNM only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Venom_Storm', 1, 40.0, 2000, 1500, 4, 0); -- NM/HNM only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Evasion', 0, 7.0, 2000, 1500, 1, 0); -- NM/HNM only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Stasis', 0, 7.0, 2000, 1500, 4, 0); -- NM/HNM only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Hell_Scissors', 0, 7.0, 2000, 1500, 4, 0); -- Campaign NM only

-- Diremite
INSERT INTO `mob_skill` VALUES (108,81,108,'Filamented_Hold', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (109,81,109,'Spinning_Top', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Grapple', 4, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Double_Claw', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Tarsal_Slam', 4, 10.0, 2000, 1500, 4, 0); -- Only used by certain notorious monsters

-- Lizard
INSERT INTO `mob_skill` VALUES (110,174,110,'Tail_Blow', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (111,174,111,'Fireball', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (112,174,112,'Blockhead', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (113,174,113,'Brain_Crush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (114,174,114,'Infrasonics', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Secretion', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Baleful_Gaze', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Snowball', 1, 10.0, 2000, 1500, 4, 0); -- only in colder regions
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Plague_Breath', 4, 10.0, 2000, 1500, 4, 0);

-- Raptor
INSERT INTO `mob_skill` VALUES (123,210,123,'Chomp_Rush', 0, 7.0, 2000, 1500, 4, 0); -- para 25%
INSERT INTO `mob_skill` VALUES (121,210,121,'Frost_Breath', 4, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (124,210,124,'Scythe_Tail', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Foul_Breath', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Thunderbolt', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Ripper_Fang', 0, 7.0, 2000, 1500, 4, 0);

-- Bugard
-- INSERT INTO `mob_skill` VALUES (127,50,0,'Tusk', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (130,50,0,'Awful_Eye', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (131,50,0,'Heavy_Bellow', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Scutum', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Tail-Roll', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Bone_Crunch', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Hungry_Crunch', 0, 7.0, 2000, 1500, 4, 0); -- Only used by the Boggelmann

-- Giant Bat
INSERT INTO `mob_skill` VALUES (138,46,138,'Blood_Drain', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Ultrasonics', 1, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Marrow_Drain', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Subsonics', 1, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Supersonics', 1, 16.0, 2000, 1500, 4, 0); -- Aht Urhgan only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Soul_Accretion', 0, 7.0, 2000, 1500, 4, 0); -- Only by Upyri. Used frequently during nighttime hours

-- Bats
INSERT INTO `mob_skill` VALUES (137,47,137,'Sonic_Boom', 1, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (139,47,139,'Jet_Stream', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Turbulence', 1, 16.0, 2000, 1500, 4, 0); -- Not used in original zone
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Slipstream', 1, 16.0, 2000, 1500, 4, 0); -- Not used in original zone

-- Rocs
INSERT INTO `mob_skill` VALUES (147,125,147,'Stormwind', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Feather_Barrier', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Gliding_Spike', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Scratch', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Triple_Attack', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dread_Dive', 0, 7.0, 2000, 1500, 4, 0); -- Used instead of Gliding Spike by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Blind_Vortex', 0, 7.0, 2000, 1500, 4, 0); -- Used in place of Triple Attack by certain NM 
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Giga Scream', 0, 7.0, 2000, 1500, 4, 0); -- Used by some NM in place of Triple Attack

-- Cockatrice
INSERT INTO `mob_skill` VALUES (150,70,150,'Hammer_Beak', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (151,70,151,'Poison_Pick', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (152,70,152,'Sound_Vacuum', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Baleful_Gaze', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Sound_Blast', 1, 16.0, 2000, 1500, 4, 0);

-- Leech
INSERT INTO `mob_skill` VALUES (158,172,158,'Suction', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (159,172,159,'Acid_Mist', 1, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (160,172,160,'Sand_Breath', 4, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (161,172,161,'Drainkiss', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Brain_Drain', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Regeneration', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'MP_Drainkiss', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'TP_Drainkiss', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Absorbing_Kiss', 0, 7.0, 2000, 1500, 4, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Deep_Kiss', 0, 7.0, 2000, 1500, 4, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Random_Kiss', 0, 7.0, 2000, 1500, 4, 0); -- Only used by certain NM

-- Worm
INSERT INTO `mob_skill` VALUES (168,258,168,'Full-force_Blow', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (169,258,169,'Gastric_Bomb', 0, 20.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (170,258,170,'Sandspin', 1, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (171,258,171,'Tremors', 1, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Sound_Vacuum', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'MP Absorption', 0, 7.0, 2000, 1500, 4, 0);

-- Slime 
INSERT INTO `mob_skill` VALUES (175,228,175,'Fluid_Spread', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (176,228,176,'Fluid_Toss', 0, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Digest', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'HP Drain', 0, 7.0, 2000, 1500, 4, 0); -- TOAU/WOTG?
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Epoxy Spread', 1, 10.0, 2000, 1500, 4, 0); -- TOAU/WOTG
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Mucus Spread', 1, 10.0, 2000, 1500, 4, 0); -- WOTG
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dissolve', 4, 10.0, 2000, 1500, 4, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Cytokinesis', 0, 7.0, 2000, 1500, 4, 0); -- Only used by certain NM

INSERT INTO `mob_skill` VALUES (175,229,175,'Fluid_Spread', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (176,229,176,'Fluid_Toss', 0, 18.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (175,230,175,'Fluid_Spread', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (176,230,176,'Fluid_Toss', 0, 18.0, 2000, 1500, 4, 0);

-- Hecteyes
INSERT INTO `mob_skill` VALUES (181,139,181,'Death_Ray', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (182,139,182,'Hex_Eye', 4, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Catharsis', 0, 7.0, 2000, 1500, 2, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Petro Gaze', 4, 7.0, 2000, 1500, 4, 0);

-- Crab
INSERT INTO `mob_skill` VALUES (188,75,188,'Big_Scissors', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (187,75,187,'Bubble_Curtain', 0, 7.0, 2000, 1500, 1, 0); -- Shell -50% magic damage taken
INSERT INTO `mob_skill` VALUES (186,75,186,'Bubble_Shower', 1, 12.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (192,75,192,'Metallic_Body', 0, 7.0, 2000, 1500, 1, 0); -- 25HP Stoneskin
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Scissor_Guard', 0, 7.0, 2000, 1500, 1, 0); -- +100% defense boost
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Mega_Scissors', 4, 10.0, 2000, 1500, 4, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Venom_Shower', 1, 20.0, 2000, 1500, 4, 0); -- Only used by certain NM

INSERT INTO `mob_skill` VALUES (188,76,188,'Big_Scissors', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (187,76,187,'Bubble_Curtain', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (186,76,186,'Bubble_Shower', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (192,76,192,'Metallic_Body', 0, 7.0, 2000, 1500, 1, 0);

INSERT INTO `mob_skill` VALUES (188,77,188,'Big_Scissors', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (187,77,187,'Bubble_Curtain', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (186,77,186,'Bubble_Shower', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (192,77,192,'Metallic_Body', 0, 7.0, 2000, 1500, 1, 0);

-- Pugil
INSERT INTO `mob_skill` VALUES (195,197,195,'Splash_Breath', 4, 12.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (196,197,196,'Screwdriver', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (197,197,197,'Water_Wall', 0, 7.0, 2000, 1500, 1, 0); -- 100% Defense Boost. 1 minute duration
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Water Shield', 0, 7.0, 2000, 1500, 1, 0); -- Eva boost
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Aqua Ball', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Intimidate', 4, 12.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Recoil Dive', 4, 12.0, 2000, 1500, 4, 0); -- Used by Jagils instead of Screwdriver

-- Sea Monks (Kraken)
INSERT INTO `mob_skill` VALUES (202,218,202,'Ink_Jet', 4, 12.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (203,218,203,'Hard_Membrane', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (204,218,204,'Cross_Attack', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (205,218,205,'Regeneration', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (206,218,206,'Maelstrom', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (207,218,207,'Whirlwind', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Tentacle', 0, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (202,219,202,'Ink_Jet', 4, 12.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (203,219,203,'Hard_Membrane', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (204,219,204,'Cross_Attack', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (205,219,205,'Regeneration', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (206,219,206,'Maelstrom', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (207,219,207,'Whirlwind', 1, 15.0, 2000, 1500, 4, 0);

-- Hound 142,143
INSERT INTO `mob_skill` VALUES (209,142,209,'Howling', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (210,142,210,'Poison_Breath', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (211,142,211,'Rot_Gas', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dirty Claw', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Shadow Claw', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Methane Breath', 4, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (209,143,209,'Howling', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (210,143,210,'Poison_Breath', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (211,143,211,'Rot_Gas', 1, 7.0, 2000, 1500, 4, 0);

-- Ghost
INSERT INTO `mob_skill` VALUES (220,121,220,'Curse', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (218,121,218,'Fear_Touch', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (219,121,219,'Terror_Touch', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (217,121,217,'Ectosmash', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dark_Sphere', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Grave_Reel', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Perdition', 0, 7.0, 2000, 1500, 4, 0); -- Bhoot only

-- Skeleton
INSERT INTO `mob_skill` VALUES (222,227,222,'Hell_Slash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (223,227,223,'Horror_Cloud', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (228,227,228,'Black_Cloud', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (229,227,229,'Blood_Saber', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Marrow Drain', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Malediction', 1, 15.0, 2000, 1500, 4, 0); --  Drain (~300). Only used by draugar
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dereliction', 1, 20.0, 2000, 1500, 4, 0); -- Only used by draugar NM

-- Coeurls
INSERT INTO `mob_skill` VALUES (396,71,396,'Blaster', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (397,71,397,'Chaotic_Eye', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Petrifactive_Breath', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Frenzied_Rage', 0, 7.0, 2000, 1500, 1, 0); --  Attack Boost (20%)
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Pounce', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Charged_Whisker', 1, 12.5, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Blink_of_Peril', 4, 10.0, 2000, 1500, 4, 0); -- Only used by certain Lynx-type NM

-- Doomed
INSERT INTO `mob_skill` VALUES (233,86,233,'Stinking_Gas', 1, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (234,86,234,'Undead_Mold', 4, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (236,86,236,'Abyss_Blast', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Acid_Breath', 4, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Call_of_the_Grave', 1, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Whip_Tongue', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Infernal_Pestilence', 4, 10.0, 2000, 1500, 4, 0); -- Only used by certain NM

-- Bombs
INSERT INTO `mob_skill` VALUES (253,56,253,'Self-Destruct', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (254,56,254,'Berserk', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Heat_Wave', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Vulcanian_Impact', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Hellstorm', 1, 15.0, 2000, 1500, 4, 0);

-- Evil Weapon 
INSERT INTO `mob_skill` VALUES (257,110,257,'Smite_of_Rage', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (258,110,258,'Whirl_of_Rage', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Smite_of_Fury', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Furious_Flurry', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Whispers_of_Ire', 1, 10.0, 2000, 1500, 4, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Flurry_of_Rage', 0, 7.0, 2000, 1500, 4, 0); -- Only used by certain NM

INSERT INTO `mob_skill` VALUES (257,111,257,'Smite_of_Rage', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (258,111,258,'Whirl_of_Rage', 1, 7.0, 2000, 1500, 4, 0);

-- Magic Pot
INSERT INTO `mob_skill` VALUES (269,175,269,'Battery_Charge', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (267,175,267,'Mysterious_Light', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (265,175,265,'Spinning_Attack', 4, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (264,175,264,'Double_Ray', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Spectral_Barrier', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Mind_Drain', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'', 0, 7.0, 2000, 1500, 4, 0);
-- Doll
INSERT INTO `mob_skill` VALUES (279,83,279,'Blitzstrahl', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (280,83,280,'Panzerfaust', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (283,83,283,'Typhoon', 1, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'', 0, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (279,84,279,'Blitzstrahl', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (280,84,280,'Panzerfaust', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (283,84,283,'Typhoon', 1, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (279,85,279,'Blitzstrahl', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (280,85,280,'Panzerfaust', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (283,85,283,'Typhoon', 1, 7.0, 2000, 1500, 4, 0);

-- Ahriman
INSERT INTO `mob_skill` VALUES (293,4,293,'Eyes_on_Me', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (292,4,292,'Blindeye', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'', 0, 7.0, 2000, 1500, 4, 0);
-- Demon
INSERT INTO `mob_skill` VALUES (303,169,303,'Soul_Drain', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (304,169,304,'Hecatomb_Wave', 0, 7.0, 2000, 1500, 4, 0);
-- Goblin
INSERT INTO `mob_skill` VALUES(334, 133, 334, 'Goblin_Rush', 0, 6.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES(335, 133, 335, 'Bomb_Toss', 2, 8.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES(336, 133, 336, 'Bomb_Toss_Suicide', 1, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES(0, 0, 0, 'Goblin-Dice', 0, 7.0, 2000, 1500, 4, 0); -- Only by Vanguard NM and Moblin Fantocciniman.
-- INSERT INTO `mob_skill` VALUES(0, 0, 0, 'Saucepan', 4, 7.0, 2000, 1500, 4, 0); -- Only by NM
-- Orc
INSERT INTO `mob_skill` VALUES (353,189,353,'Battle_Dance', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (351,189,351,'Slam_Dunk', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (349,189,349,'Aerial_Wheel', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (350,189,350,'Shoulder_Attack', 0, 7.0, 2000, 1500, 4, 0);
-- Quadav
INSERT INTO `mob_skill` VALUES (355,200,355,'Ore_Toss', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (356,200,356,'Head_Butt', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (357,200,357,'Shell_Bash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (358,200,358,'Shell_Guard', 0, 7.0, 2000, 1500, 1, 0);

INSERT INTO `mob_skill` VALUES (355,201,355,'Ore_Toss', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (356,201,356,'Head_Butt', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (357,201,357,'Shell_Bash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (358,201,358,'Shell_Guard', 0, 7.0, 2000, 1500, 1, 0);

INSERT INTO `mob_skill` VALUES (355,202,355,'Ore_Toss', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (356,202,356,'Head_Butt', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (357,202,357,'Shell_Bash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (358,202,358,'Shell_Guard', 0, 7.0, 2000, 1500, 1, 0);
-- Yagudo
INSERT INTO `mob_skill` VALUES (361,270,361,'Feather_Storm', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (362,270,362,'Double_Kick', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (363,270,363,'Parry', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (364,270,364,'Sweep', 1, 7.0, 2000, 1500, 4, 0);
-- Bird
INSERT INTO `mob_skill` VALUES (366,55,366,'Helldive', 0, 9.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (367,55,367,'Wing_Cutter', 4, 7.0, 2000, 1500, 4, 0);
-- Behemoth
INSERT INTO `mob_skill` VALUES (372,51,372,'Wild_Horn', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (373,51,373,'Thunderbolt', 1, 30.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (374,51,374,'Kick_Out', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (375,51,375,'Shock_Wave', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (376,51,376,'Flame_Armor', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (377,51,377,'Howl', 0, 7.0, 2000, 1500, 1, 0);
-- Dragon - 4 foot kind
INSERT INTO `mob_skill` VALUES (388,87,388,'Wind_Breath', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (389,87,389,'Body_Slam', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (390,87,390,'Heavy_Stomp', 1, 10.0, 2000, 1500, 4, 0);
-- Fly
INSERT INTO `mob_skill` VALUES (403,113,403,'Cursed_Sphere', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (404,113,404,'Venom', 0, 7.0, 2000, 1500, 4, 0);
-- Gigas
INSERT INTO `mob_skill` VALUES (408,126,408,'Impact_Roar', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (409,126,409,'Grand_Slam', 1, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (408,127,408,'Impact_Roar', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (409,127,409,'Grand_Slam', 1, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (408,128,408,'Impact_Roar', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (409,128,409,'Grand_Slam', 1, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (408,129,408,'Impact_Roar', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (409,129,409,'Grand_Slam', 1, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (408,130,408,'Impact_Roar', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (409,130,409,'Grand_Slam', 1, 7.0, 2000, 1500, 4, 0);
-- Golem
INSERT INTO `mob_skill` VALUES (419,135,419,'Heavy_Strike', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (420,135,420,'Ice_Break', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (421,135,421,'Thunder_Break', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (422,135,422,'Crystal_Rain', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (423,135,423,'Crystal_Weapon', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (425,135,425,'Crystal_Weapon', 0, 7.0, 2000, 1500, 4, 0);
-- Sapling
INSERT INTO `mob_skill` VALUES (429,216,429,'Sprout_Spin', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (430,216,430,'Slumber_Powder', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (431,216,431,'Sprout_Smack', 0, 7.0, 2000, 1500, 4, 0);
-- Cardian
INSERT INTO `mob_skill` VALUES (427,61,427,'Bludgeon', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (428,61,428,'Deal_Out', 4, 7.0, 2000, 1500, 4, 0);

-- anim 432 = 2h cloud

-- now they dont start matching up....

-- Sahagin (-72 for anim id)
INSERT INTO `mob_skill` VALUES (515,213,443,'Hydroball', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (521,213,449,'Hydro_Shot', 0, 7.0, 2000, 1500, 4, 0);
-- Tonberry
INSERT INTO `mob_skill` VALUES (527,243,455,'Words_of_Bane', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (529,243,457,'Light_of_Penance', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (530,243,458,'Lateral_Slash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (531,243,459,'Vertical_Slash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (532,243,460,'Throat_Stab', 0, 7.0, 2000, 4500, 4, 0);
INSERT INTO `mob_skill` VALUES (664,243,503,'Everyones_Grudge', 0, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (527,244,455,'Words_of_Bane', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (529,244,457,'Light_of_Penance', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (530,244,458,'Lateral_Slash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (531,244,459,'Vertical_Slash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (532,244,460,'Throat_Stab', 0, 7.0, 2000, 4500, 4, 0);
INSERT INTO `mob_skill` VALUES (664,244,503,'Everyones_Grudge', 0, 7.0, 2000, 1500, 4, 0);
-- Antica
INSERT INTO `mob_skill` VALUES (535,25,463,'Magnetite_Cloud', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (536,25,464,'Sandstorm', 1, 7.0, 2000, 1500, 4, 0);
-- Manticore
INSERT INTO `mob_skill` VALUES (541,179,469,'Deadly_Hold', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (542,179,470,'Tail_Swing', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (543,179,471,'Tail_Smash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (544,179,472,'Heat_Breath', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (545,179,473,'Riddle', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (546,179,474,'Great_Sandstorm', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (547,179,475,'Great_Whirlwind', 4, 7.0, 2000, 1500, 4, 0);
-- Adamantoise
INSERT INTO `mob_skill` VALUES (549,2,477,'Head_Butt_Turtle', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (550,2,478,'Tortoise_Stomp', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (551,2,479,'Harden_Shell', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (552,2,480,'Earth_Breath', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (553,2,481,'Aqua_Breath', 4, 7.0, 2000, 1500, 4, 0);
-- Spider
INSERT INTO `mob_skill` VALUES (554,235,482,'Sickle_Slash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (555,235,483,'Acid_Spray', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (556,235,484,'Spider_Web', 1, 7.0, 2000, 1500, 4, 0);
-- Wyvern 
INSERT INTO `mob_skill` VALUES (557,265,485,'Dispelling_Wind', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (558,265,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (559,265,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (560,265,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (561,265,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (562,265,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (565,265,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (557,266,485,'Dispelling_Wind', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (558,266,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (559,266,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (560,266,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (561,266,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (562,266,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (565,266,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (557,267,485,'Dispelling_Wind', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (558,267,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (559,267,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (560,267,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (561,267,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (562,267,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (565,267,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0);

-- Genbu
INSERT INTO `mob_skill` VALUES (549,277,477,'Head_Butt_Turtle', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (550,277,478,'Tortoise_Stomp', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (551,277,479,'Harden_Shell', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (552,277,480,'Earth_Breath', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (553,277,481,'Aqua_Breath', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,277,432,'Two_Hour', 1, 15.0, 2000, 10, 4, 0);

-- Seiryu
INSERT INTO `mob_skill` VALUES (558,278,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (559,278,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (560,278,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (561,278,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (562,278,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (565,278,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,278,432,'Two_Hour', 1, 15.0, 2000, 10, 4, 0);

-- Byakko
INSERT INTO `mob_skill` VALUES (14,279,14,'Roar', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (15,279,15,'Razor_Fang', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (17,279,17,'Claw_Cyclone', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,279,432,'Two_Hour', 1, 15.0, 2000, 10, 4, 0);

-- offsets shift some more.. (tpid - 72 - 89 (-161)

-- bugbear
INSERT INTO `mob_skill` VALUES (105,59,828,'Earthshock', 1, 7.0, 2000, 1500, 4, 0);
-- taurus
INSERT INTO `mob_skill` VALUES (242,240,851,'Triclip', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (243,240,852,'Back_Swish', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (244,240,853,'Mow', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (245,240,854,'Frightful_Roar', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (246,240,855,'Mortal_Ray', 4, 7.0, 2000, 1500, 4, 0);
-- cluster
INSERT INTO `mob_skill` VALUES (313,68,868,'Refueling', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (314,68,869,'Circle_of_Flames', 1, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (313,69,868,'Refueling', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (314,69,869,'Circle_of_Flames', 1, 7.0, 2000, 1500, 4, 0);
-- uragnite
INSERT INTO `mob_skill` VALUES (1315,251,861,'Gas_Shell', 4, 7.0, 2000, 1500, 4, 0);
-- snoll
INSERT INTO `mob_skill` VALUES (1389,232,876,'Freeze_Rush', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1390,232,877,'Cold_Wave', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1388,232,878,'Hypothermal_Combustion', 1, 7.0, 2000, 1500, 4, 0);
-- corse
INSERT INTO `mob_skill` VALUES (276,74,902,'Envoutement', 0, 7.0, 2000, 1500, 4, 0);

-- -------------------- 
-- VALUES POST 1024
-- Take tpid and +256 then -1024 to find the correct param for the packet
-- Take animid and -1024 to find the correct param
-- REMEMBER TO SET BOTH ANIM AND TPID TO THE CORRECT 0X01

-- Mamool Ja
INSERT INTO `mob_skill` VALUES (1475,176,1265,'Forceful_Blow', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1476,176,1266,'Somersault_Kick', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1477,176,1267,'Firespit', 0, 30.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1478,176,1268,'Warm-Up', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (1664,176,1347,'Rushing_Drub', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1670,176,1353,'Groundburst', 1, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1545,176,1228,'Vorpal_Wheel', 0, 7.0, 2000, 1500, 4, 0); Gulool Jaja only
-- INSERT INTO `mob_skill` VALUES (1544,176,1227,'Miasma', 1, 16.0, 2000, 1500, 4, 0); Gulool Jaja only
-- INSERT INTO `mob_skill` VALUES (1543,176,1226,'Tyranic_Blare', 1, 16.0, 2000, 1500, 4, 0); Gulool Jaja only
-- INSERT INTO `mob_skill` VALUES (1542,176,1225,'Decussate', 1, 16.0, 2000, 1500, 4, 0); Gulool Jaja only

-- Apkallu
INSERT INTO `mob_skill` VALUES (1457,27,1159,'Yawn', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1458,27,1160,'Wing_Slap', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1459,27,1161,'Beak_Lunge', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1460,27,1162,'Frigid_Shuffle', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1461,27,1163,'Wing_Whirl', 1, 10.0, 2000, 1500, 4, 0);

-- Imp 
INSERT INTO `mob_skill` VALUES (1455,165,1180,'Frenetic_Rip', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1453,165,1181,'Abrasive_Tantara', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1454,165,1182,'Deafening_Tantara', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Grating_Tantara', 1, 10.0, 2000, 1500, 4, 0); -- Used by NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Stifling_Tantara', 1, 10.0, 2000, 1500, 4, 0); -- Used by NM

INSERT INTO `mob_skill` VALUES (1455,166,1180,'Frenetic_Rip', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1453,166,1181,'Abrasive_Tantara', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1454,166,1182,'Deafening_Tantara', 1, 10.0, 2000, 1500, 4, 0);

-- Puk
INSERT INTO `mob_skill` VALUES (1468,198,1199,'White_Wind', 1, 10.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (1467,198,1198,'Ill_wind', 1, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1466,198,1197,'Zephyr_Mantle', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (1465,198,1196,'Obfuscate', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1464,198,1195,'Wind_Shear', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1462,198,1194,'Crosswind', 4, 18.0, 2000, 1500, 4, 0);
-- Qutrub
INSERT INTO `mob_skill` VALUES (1522,203,1205,'Spinal_Cleave', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1523,203,1206,'Mangle', 4, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1524,203,1207,'Leaping_Cleave', 0, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (1522,204,1205,'Spinal_Cleave', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1523,204,1206,'Mangle', 4, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1524,204,1207,'Leaping_Cleave', 0, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (1522,205,1205,'Spinal_Cleave', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1523,205,1206,'Mangle', 4, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1524,205,1207,'Leaping_Cleave', 0, 7.0, 2000, 1500, 4, 0);

-- Wivre
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Demoralizing_Roar', 1, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Clobber', 4, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Batterhorn', 4, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Granite_Hide', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Boiling_Blood', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Crippling_Slam', 4, 16.0, 2000, 1500, 4, 0);

-- Hydra
-- INSERT INTO `mob_skill` VALUES (1572,164,0,'Pyric_Blast', 4, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1573,164,0,'Polar_Bulwark', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (1574,164,0,'Polar_Blast', 4, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1575,164,0,'Pyric_Bulwark', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (1576,164,0,'Barofield', 4, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1578,164,0,'Trembling', 1, 5.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1579,164,0,'Serpentine_Tail', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1580,164,0,'Nerve_Gas', 1, 10.0, 2000, 1500, 4, 0);

-- Marid
-- Colibri
-- Ladybug
INSERT INTO `mob_skill` VALUES (1925,170,1579,'Spiral_Spin', 0, 7.0, 2000, 1500, 4, 0);
-- Pixie
INSERT INTO `mob_skill` VALUES (1937,195,1581,'Zephyr_Arrow', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1938,195,1582,'Lethe_Arrows', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1943,195,1587,'Cyclonic_Turmoil', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1944,195,1588,'Cyclonic_Torrent', 0, 7.0, 2000, 1500, 4, 0);
-- Gnole
INSERT INTO `mob_skill` VALUES (1913,132,1593,'Plenilune_Embrace', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1914,132,1594,'Fevered_Pitch', 0, 7.0, 2000, 1500, 4, 0);
-- Djinn
INSERT INTO `mob_skill` VALUES (1960,82,1597,'Nocturnal_Combustion', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1962,82,1599,'Penumbral_Impact', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1963,82,1600,'Dark_Wave', 0, 7.0, 2000, 1500, 4, 0);
-- Ghrah 
INSERT INTO `mob_skill` VALUES (1187,122,1061,'Hexidiscs', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1185,122,1065,'Actinic_Burst', 0, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (1187,123,1061,'Hexidiscs', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1185,123,1065,'Actinic_Burst', 0, 7.0, 2000, 1500, 4, 0);

INSERT INTO `mob_skill` VALUES (1187,124,1061,'Hexidiscs', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1185,124,1065,'Actinic_Burst', 0, 7.0, 2000, 1500, 4, 0);
-- Euvhi
INSERT INTO `mob_skill` VALUES (1194,109,1067,'Viscid_Nectar', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1196,109,1068,'Axial_Bloom', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1191,109,1070,'Vertical_Cleave', 0, 7.0, 2000, 1500, 4, 0);
-- Zdei
INSERT INTO `mob_skill` VALUES (1209,272,1076,'Optic_Induration', 0, 7.0, 2000, 1500, 4, 0);
-- Yovra
INSERT INTO `mob_skill` VALUES (1119,271,1027,'Asthenic_Fog', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1117,271,1025,'Ion_Shower', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1116,271,1024,'Concussive_Oscillation', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1115,271,1023,'Primal_Drill', 0, 7.0, 2000, 1500, 4, 0);
-- Aern
INSERT INTO `mob_skill` VALUES (1128,3,1019,'Disseverment', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1127,3,1018,'Glacier_Splitter', 0, 7.0, 2000, 1500, 4, 0);
-- Phuabo
INSERT INTO `mob_skill` VALUES (1101,194,1008,'Tidal_Dive', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1098,194,1005,'Vapor_Spray', 0, 7.0, 2000, 1500, 4, 0);
-- Xzomit
INSERT INTO `mob_skill` VALUES (1096,269,1003,'Saline_Coat', 0, 7.0, 2000, 1500, 4, 0); -- not included since buffs dont work yet
INSERT INTO `mob_skill` VALUES (1094,269,1001,'Ink_Cloud', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1093,269,1004,'Mantle_Pierce', 0, 7.0, 2000, 1500, 4, 0);
-- Troll
INSERT INTO `mob_skill` VALUES (1487,246,1232,'Rock_Smash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1488,246,1233,'Diamondhide', 1, 16.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (1489,246,1234,'Enervation', 1, 18.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1490,246,1235,'Quake_Stomp', 0, 7.0, 2000, 1500, 1, 0);
-- Lamia = 171 Merrow = 182
INSERT INTO `mob_skill` VALUES (1510,171,1253,'Hysteric_Barrage', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1515,182,1258,'Tail_Slap', 4, 16.0, 2000, 1500, 4, 0);
-- Poroggo
INSERT INTO `mob_skill` VALUES (1703,196,1361,'Water_Bomb', 1, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1702,196,1360,'Magic_Hammer', 0, 16.0, 2000, 1500, 4, 0);
-- Vampyr
INSERT INTO `mob_skill` VALUES (1850,252,1450,'Bloodrake', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1854,252,1454,'Wings_of_Gehenna', 1, 18.0, 2000, 1500, 4, 0);
-- Dvergr
INSERT INTO `mob_skill` VALUES (1862,90,1458,'Bilgestorm', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1863,90,1459,'Thundris_Shriek', 0, 7.0, 2000, 1500, 4, 0);
-- Peiste
INSERT INTO `mob_skill` VALUES (1897,192,1544,'Regurgitation', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1898,192,1545,'Delta_Thrust', 0, 7.0, 2000, 1500, 4, 0);
-- Gnat
INSERT INTO `mob_skill` VALUES (1902,131,1567,'Insipid_Nip', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1903,131,1568,'Pandemic_Nip', 0, 7.0, 2000, 1500, 4, 0);
-- Limule
INSERT INTO `mob_skill` VALUES (2308,173,1796,'Blazing_Bound', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (2309,173,1797,'Molting_Burst', 0, 7.0, 2000, 1500, 4, 0);
-- Clionid
INSERT INTO `mob_skill` VALUES (2307,65,1795,'Rime_Spray', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (2306,65,1794,'Acrid_Stream', 0, 7.0, 2000, 1500, 4, 0);
-- Murex
INSERT INTO `mob_skill` VALUES (2373,187,1829,'Benthic_Typhoon', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (2374,187,1830,'Pelagic_Tempest', 0, 7.0, 2000, 1500, 4, 0);
-- Amoeban
INSERT INTO `mob_skill` VALUES (2375,5,1831,'Osmosis', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (2376,5,1832,'Vacuole_Discharge', 0, 7.0, 2000, 1500, 4, 0);
-- pet wyvern
INSERT INTO `mob_skill` VALUES (638,193,621,'Healing_Breath_I', 0, 10.0, 2000, 2000, 2, 0);
INSERT INTO `mob_skill` VALUES (639,193,622,'Healing_Breath_II', 0, 10.0, 2000, 2000, 2, 0);
INSERT INTO `mob_skill` VALUES (640,193,623,'Healing_Breath_III', 0, 10.0, 2000, 2000, 2, 0);
INSERT INTO `mob_skill` VALUES (641,193,624,'Remove_Poison', 0, 10.0, 2000, 1500, 2, 0);
INSERT INTO `mob_skill` VALUES (642,193,625,'Remove_Blindness', 0, 10.0, 2000, 1500, 2, 0);
INSERT INTO `mob_skill` VALUES (643,193,626,'Remove_Paralysis', 0, 10.0, 2000, 1500, 2, 0);
INSERT INTO `mob_skill` VALUES (644,193,627,'Flame_Breath', 0, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (645,193,628,'Frost_Breath', 0, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (646,193,629,'Gust_Breath', 0, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (647,193,630,'Sand_Breath', 0, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (648,193,631,'Lightning_Breath', 0, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (649,193,632,'Hydro_Breath', 0, 10.0, 2000, 1500, 4, 0);

-- --------------------------------------
-- NM / HNM
-- --------------------------------------

-- Cerberus
INSERT INTO `mob_skill` VALUES (1529,62,1223,'Lava_Spit', 1, 10.0, 2000, 1500, 4, 0); -- ~400 dmg
INSERT INTO `mob_skill` VALUES (1530,62,1224,'Sulfurous_Breath', 0, 7.0, 2000, 1500, 4, 0); -- ~500 dmg
INSERT INTO `mob_skill` VALUES (1531,62,1225,'Scorching_Lash', 1, 20.0, 2000, 1500, 4, 0); -- ~900 dmg
INSERT INTO `mob_skill` VALUES (1532,62,1226,'Ululation', 1, 20.0, 2000, 1500, 4, 0); -- Paralyze
INSERT INTO `mob_skill` VALUES (1533,62,1227,'Magma_Hoplon', 0, 7.0, 2000, 1500, 1, 0); -- Stoneskin + Blaze Spike
INSERT INTO `mob_skill` VALUES (1534,62,1228,'Gates_of_Hades', 1, 20.0, 2000, 1500, 4, 0); -- ~950 dmg + 20hp/tick

-- King Vinegaroon
-- INSERT INTO `mob_skill` VALUES (467,274,0,'Earthbreaker', 1, 40.0, 2000, 1500, 4, 0); -- add effect stun
-- INSERT INTO `mob_skill` VALUES (98,274,0,'Wild_Rage', 1, 15.0, 2000, 1500, 4, 0); -- add effect poison
-- INSERT INTO `mob_skill` VALUES (466,274,0,'Venom_Storm', 1, 40.0, 2000, 1500, 4, 0); -- 32hp/tick
-- INSERT INTO `mob_skill` VALUES (464,274,0,'Venom_Sting', 0, 7.0, 2000, 1500, 4, 0); -- 100hp/tick
-- INSERT INTO `mob_skill` VALUES (463,274,0,'Critical_Bite', 0, 7.0, 2000, 1500, 4, 0); -- High damage

-- Ouryu
INSERT INTO `mob_skill` VALUES (695,259,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (696,259,654,'Spike_Flail', 1, 23.0, 2000, 1000, 4, 0);
INSERT INTO `mob_skill` VALUES (697,259,655,'Dragon_Breath', 4, 18.0, 2000, 1500, 4, 0);

-- Fafnir
INSERT INTO `mob_skill` VALUES (695,260,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (696,260,654,'Spike_Flail', 1, 23.0, 2000, 1000, 4, 0); -- only if a player is behind fafnir
INSERT INTO `mob_skill` VALUES (697,260,655,'Dragon_Breath', 4, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (701,260,0,'Absolute_Terror', 0, 18.0, 2000, 1000, 4, 0);
-- INSERT INTO `mob_skill` VALUES (702,260,0,'Horrid_Roar', 0, 18.0, 2000, 1000, 4, 0);

-- Cynoprosopi
INSERT INTO `mob_skill` VALUES (695,261,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (696,261,654,'Spike_Flail', 1, 23.0, 2000, 1000, 4, 0);
INSERT INTO `mob_skill` VALUES (697,261,655,'Dragon_Breath', 4, 18.0, 2000, 1500, 4, 0);

-- Wyrm
INSERT INTO `mob_skill` VALUES (695,262,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (696,262,654,'Spike_Flail', 1, 23.0, 2000, 1000, 4, 0);
INSERT INTO `mob_skill` VALUES (697,262,655,'Dragon_Breath', 4, 18.0, 2000, 1500, 4, 0);

-- Nidhogg
INSERT INTO `mob_skill` VALUES (695,263,653,'Hurricane_Wing', 1, 40.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (696,263,654,'Spike_Flail', 1, 40.0, 2000, 1000, 4, 0);
INSERT INTO `mob_skill` VALUES (697,263,655,'Dragon_Breath', 4, 40.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (701,263,0,'Absolute_Terror', 0, 18.0, 2000, 1000, 4, 0);
-- INSERT INTO `mob_skill` VALUES (702,263,0,'Horrid_Roar', 0, 18.0, 2000, 1000, 4, 0);

-- INSERT INTO `mob_skill` VALUES (698,193,656,'Touchdown', 0, 7.0, 2000, 1500, 4, 0);
-- anim 657 for fire breath attack (in air)

-- anim 765 = seismostomp

-- Gurfurlur the Menacing (326)
INSERT INTO `mob_skill` VALUES (0,326,0,'', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,326,0,'', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,326,0,'', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,326,0,'', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,326,0,'', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,326,0,'', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,326,0,'', 0, 7.0, 2000, 1500, 4, 0);

-- --------------------------------------
-- MAAT
-- --------------------------------------

INSERT INTO `mob_skill` VALUES (772,149,729,'Tackle', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (777,149,734,'Dragon_Kick', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (778,149,735,'Asuran_Fists', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (0,149,432,'Two_Hour', 1, 15.0, 2000, 10, 4, 0);

-- --------------------------------------
-- AVATAR
-- --------------------------------------

-- Fenrir
INSERT INTO `mob_skill` VALUES (575,36,513,'Moonlit_Charge', 0, 10.0, 512, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (576,36,514,'Crescent_Fang', 0, 10.0, 513, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (577,36,515,'Lunar_Cry', 0, 10.0, 514, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (578,36,516,'Ecliptic_Growl', 1, 10.0, 516, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (579,36,517,'Lunar_Roar', 1, 10.0, 515, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (580,36,518,'Eclipse_Bite', 0, 10.0, 518, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (581,36,519,'Ecliptic_Howl', 1, 10.0, 517, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (582,36,550,'Lunar_Bay', 0, 10.0, 519, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (583,36,521,'Howling_Moon', 1, 10.0, 520, 2000, 4, 0);

INSERT INTO `mob_skill` VALUES (577,325,515,'Lunar_Cry', 0, 10.0, 514, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (579,325,517,'Lunar_Roar', 1, 30.0, 515, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (580,325,518,'Eclipse_Bite', 0, 10.0, 518, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (583,325,521,'Howling_Moon', 1, 30.0, 520, 2000, 4, 0);

-- Ifrit
INSERT INTO `mob_skill` VALUES (584,38,526,'Punch', 0, 10.0, 528, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (585,38,527,'Fire_II', 0, 10.0, 529, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (586,38,528,'Burning_Strike', 0, 10.0, 530, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (587,38,529,'Double_Punch', 0, 10.0, 531, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (588,38,530,'Crimson_Howl', 1, 10.0, 532, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (589,38,531,'Fire_IV', 0, 10.0, 533, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (590,38,532,'Flaming_Crush', 0, 10.0, 534, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (591,38,533,'Meteor_Strike', 0, 10.0, 535, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (592,38,534,'Inferno', 1, 10.0, 536, 2000, 4, 0);

INSERT INTO `mob_skill` VALUES (589,322,531,'Fire_IV', 0, 10.0, 533, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (590,322,532,'Flaming_Crush', 0, 10.0, 534, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (591,322,533,'Meteor_Strike', 0, 10.0, 535, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (592,322,534,'Inferno', 1, 10.0, 536, 2000, 4, 0);

-- Titan
INSERT INTO `mob_skill` VALUES (593,45,539,'Rock_Throw', 0, 12.0, 544, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (594,45,540,'Stone_II', 0, 10.0, 545, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (595,45,541,'Rock_Buster', 0, 10.0, 546, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (596,45,542,'Megalith_Throw', 0, 17.0, 547, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (597,45,543,'Earthen_Ward', 1, 10.0, 548, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (598,45,544,'Stone_IV', 0, 10.0, 549, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (599,45,545,'Mountain_Buster', 0, 10.0, 550, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (600,45,546,'Geocrush', 0, 10.0, 551, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (601,45,547,'Earthen_Fury', 1, 10.0, 552, 2000, 4, 0);

INSERT INTO `mob_skill` VALUES (597,321,543,'Earthen_Ward', 1, 10.0, 548, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (598,321,544,'Stone_IV', 0, 10.0, 549, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (599,321,545,'Mountain_Buster', 0, 10.0, 550, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (600,321,546,'Geocrush', 0, 10.0, 551, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (601,321,547,'Earthen_Fury', 1, 10.0, 552, 2000, 4, 0);

-- Leviathan
INSERT INTO `mob_skill` VALUES (602,40,552,'Barracuda_Dive', 0, 10.0, 560, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (603,40,553,'Water_II', 0, 10.0, 561, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (604,40,554,'Tail_Whip', 0, 10.0, 562, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (605,40,555,'Spring_Water', 1, 10.0, 563, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (606,40,556,'Slowga', 1, 10.0, 564, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (607,40,557,'Water_IV', 0, 20.0, 565, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (608,40,558,'Spinning_Dive', 0, 10.0, 566, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (609,40,559,'Grand_Fall', 0, 10.0, 567, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (610,40,560,'Tidal_Wave', 1, 20.0, 568, 2000, 4, 0);

INSERT INTO `mob_skill` VALUES (605,323,555,'Spring_Water', 1, 10.0, 563, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (607,323,557,'Water_IV', 0, 20.0, 565, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (608,323,558,'Spinning_Dive', 0, 10.0, 566, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (609,323,559,'Grand_Fall', 0, 10.0, 567, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (610,323,560,'Tidal_Wave', 1, 20.0, 568, 2000, 4, 0);

-- Garuda
INSERT INTO `mob_skill` VALUES (611,37,565,'Claw', 0, 10.0, 576, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (612,37,566,'Aero_II', 0, 10.0, 577, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (613,37,569,'Whispering_Wind', 1, 10.0, 578, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (614,37,568,'Hastega', 1, 10.0, 579, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (615,37,567,'Aerial_Armor', 1, 10.0, 580, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (616,37,570,'Aero_IV', 0, 10.0, 581, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (617,37,571,'Predator_Claws', 0, 10.0, 582, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (618,37,572,'Wind_Blade', 0, 10.0, 583, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (619,37,573,'Aerial_Blast', 1, 10.0, 584, 2000, 4, 0);

INSERT INTO `mob_skill` VALUES (616,324,570,'Aero_IV', 0, 10.0, 581, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (617,324,571,'Predator_Claws', 0, 10.0, 582, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (618,324,572,'Wind_Blade', 0, 10.0, 583, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (619,324,573,'Aerial_Blast', 1, 10.0, 584, 2000, 4, 0);

-- Shiva
INSERT INTO `mob_skill` VALUES (620,44,578,'Axe_Kick', 0, 10.0, 592, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (621,44,579,'Blizzard_II', 0, 10.0, 593, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (622,44,580,'Frost_Armor', 1, 10.0, 594, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (623,44,581,'Sleepga', 1, 10.0, 595, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (624,44,582,'Double_Slap', 0, 10.0, 596, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (625,44,583,'Blizzard_IV', 0, 10.0, 597, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (626,44,584,'Rush', 0, 10.0, 598, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (627,44,585,'Heavenly_Strike', 0, 10.0, 599, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (628,44,586,'Diamond_Dust', 1, 10.0, 600, 2000, 4, 0);

INSERT INTO `mob_skill` VALUES (625,319,583,'Blizzard_IV', 0, 10.0, 597, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (626,319,584,'Rush', 0, 10.0, 598, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (627,319,585,'Heavenly_Strike', 0, 10.0, 599, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (628,319,586,'Diamond_Dust', 1, 10.0, 600, 2000, 4, 0);

-- Ramuh
INSERT INTO `mob_skill` VALUES (629,43,591,'Shock_Strike', 0, 10.0, 608, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (630,43,592,'Thunder_II', 0, 10.0, 609, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (631,43,593,'Rolling_Thunder', 1, 10.0, 610, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (632,43,594,'Thunderspark', 1, 10.0, 611, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (633,43,595,'Lightning_Armor', 1, 10.0, 612, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (634,43,596,'Thunder_IV', 0, 10.0, 613, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (635,43,597,'Chaotic_Strike', 0, 10.0, 614, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (636,43,598,'Thunderstorm', 0, 10.0, 615, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (637,43,599,'Judgment_Bolt', 1, 10.0, 616, 2000, 4, 0);

INSERT INTO `mob_skill` VALUES (634,320,596,'Thunder_IV', 0, 10.0, 613, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (635,320,597,'Chaotic_Strike', 0, 10.0, 614, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (636,320,598,'Thunderstorm', 0, 10.0, 615, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (637,320,599,'Judgment_Bolt', 1, 10.0, 616, 2000, 4, 0);

-- Carbuncle
INSERT INTO `mob_skill` VALUES (650,34,605,'Healing_Ruby', 0, 10.0, 496, 2000, 2, 0);
INSERT INTO `mob_skill` VALUES (651,34,606,'Poison_Nails', 0, 10.0, 497, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (652,34,607,'Shining_Ruby', 1, 10.0, 498, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (653,34,608,'Glittering_Ruby', 1, 10.0, 499, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (654,34,609,'Meteorite', 0, 10.0, 500, 2000, 4, 0);
INSERT INTO `mob_skill` VALUES (655,34,610,'Healing_Ruby_II', 1, 10.0, 501, 2000, 1, 0);
INSERT INTO `mob_skill` VALUES (656,34,611,'Searing_Light', 1, 10.0, 502, 2000, 4, 0);

-- --------------------------------------
-- ZNM
-- --------------------------------------

-- Vulpangue (286)
-- INSERT INTO `mob_skill` VALUES (1468,286,0,'White_Wind', 0, 20.0, 2000, 1500, 2, 0);
-- INSERT INTO `mob_skill` VALUES (1467,286,0,'Ill_Wind', 1, 18.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1466,286,1197,'Zephyr_Mantle', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (1465,286,1196,'Obfuscate', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1464,286,1195,'Wind_Shear', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1462,286,1194,'Crosswind', 4, 18.0, 2000, 1500, 4, 0);

-- Chamrosh (287)
-- INSERT INTO `mob_skill` VALUES (0,287,0,'Feather_Tickle', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,287,0,'Snatch_Morsel', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,287,0,'Pecking_Flurry', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,287,0,'Wisecrack', 1, 10.0, 2000, 1500, 4, 0);

-- Cheese Hoarder Gigiroon (288)
-- INSERT INTO `mob_skill` VALUES (1472,288,0,'Faze', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,288,0,'Kibosh', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1471,288,0,'Sandspray', 4, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,288,0,'Strap_Cutter', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1474,288,0,'Deadeye', 1, 18.0, 2000, 1500, 4, 0);

-- Brass Borer (289)
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Cannonball', 0, 24.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Heat_Barrier', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Amber_Scutum', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Thermal_Pulse', 1, 12.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Vitriolic_Spray', 4, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Vitriolic_Shower', 4, 18.0, 2000, 1500, 4, 0); no info

-- Claret (290)
INSERT INTO `mob_skill` VALUES (176,290,176,'Fluid_Toss', 0, 18.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (175,290,175,'Fluid_Spread', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,290,0,'Digest', 0, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,290,0,'Mucus_Spread', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,290,0,'Epoxy_Spread', 1, 10.0, 2000, 1500, 4, 0);

-- Ob (291)
-- Velionis (292)
-- INSERT INTO `mob_skill` VALUES (0,292,0,'Malediction', 1, 18.0, 2000, 1500, 4, 0);

-- Lil'Apkallu (294)
-- INSERT INTO `mob_skill` VALUES (0,294,0,'Frigid_Shuffle', 1, 18.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1459,294,1161,'Beak_Lunge', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1457,294,1159,'Yawn', 1, 18.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1458,294,1160,'Wing_Slap', 0, 7.0, 2000, 1500, 4, 0);

-- Iriz Ima (295)
-- INSERT INTO `mob_skill` VALUES (0,295,0,'Barrier_Tusk', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,295,0,'Voracious_Trunk', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,295,0,'Flailing_Trunk', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,295,0,'Stampede', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,295,0,'Onrush', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,295,0,'Proboscis_Shower', 0, 7.0, 2000, 1500, 2, 0);

-- Livid***REMOVED*** Amooshah (296)
INSERT INTO `mob_skill` VALUES (60,296,60,'Impale', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (61,296,61,'Vampiric_Lash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (63,296,63,'Bad_Breath', 4, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,296,0,'Sweet Breath', 4, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,296,0,'Impale', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,296,0,'Vampiric Root', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,296,0,'Vampiric Lash', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,296,0,'Extremely_Bad_Breath', 4, 7.0, 2000, 1500, 4, 0);

-- Iriri Samariri (297)
INSERT INTO `mob_skill` VALUES (1703,297,1361,'Water_Bomb', 1, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1702,297,1360,'Magic_Hammer', 0, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,297,0,'Frog_Cheer', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,295,0,'Frog_Chorus', 1, 16.0, 2000, 1500, 4, 0);

-- Anantaboga (298)
INSERT INTO `mob_skill` VALUES (388,298,388,'Wind_Breath', 4, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (389,298,389,'Body_Slam', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (390,298,390,'Heavy_Stomp', 1, 10.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,298,0,'Chaos_Blade', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,298,0,'Petro_Eyes', 0, 7.0, 2000, 1500, 4, 0);

-- Dextrose (299)
-- INSERT INTO `mob_skill` VALUES (0,299,0,'Amplification', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,299,0,'Boiling_Point', 4, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,299,0,'Synergism', 1, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,299,0,'Xenoglossia', 0, 7.0, 2000, 1500, 1, 0);

-- Reacton (300)
INSERT INTO `mob_skill` VALUES (253,300,253,'Self-Destruct', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (254,300,254,'Berserk', 0, 7.0, 2000, 1500, 1, 0);

-- Verdelet (301)
INSERT INTO `mob_skill` VALUES (1455,301,1180,'Frenetic_Rip', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1453,301,1181,'Abrasive_Tantara', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1454,301,1182,'Deafening_Tantara', 1, 10.0, 2000, 1500, 4, 0);

-- Wulgaru (302)
-- INSERT INTO `mob_skill` VALUES (0,302,0,'Dire_Straight', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,302,0,'Detonating_Grip', 1, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,302,0,'Sinker_Drill', 0, 7.0, 2000, 1500, 4, 0);

-- Zareehkl the Jubilant (303)
INSERT INTO `mob_skill` VALUES (1522,303,1205,'Spinal_Cleave', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1523,303,1206,'Mangle', 4, 16.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1524,303,1207,'Leaping_Cleave', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,303,0,'Hex_Palm', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,303,0,'Animating_Wail', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,303,0,'Fortifying_Wail', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,303,0,'Unblest_Jambiya', 1, 15.0, 2000, 1500, 4, 0);

-- Armed Gears (304)
-- INSERT INTO `mob_skill` VALUES (0,304,0,'Antigravity', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,304,0,'Artificial_Gravity', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,304,0,'Rail_Cannon', 1, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,304,0,'Restoral', 0, 7.0, 2000, 1500, 2, 0);
-- INSERT INTO `mob_skill` VALUES (0,304,0,'Heavy_Armature', 0, 7.0, 2000, 1500, 1, 0);

-- Gotoh Zha the Redolent (305)
INSERT INTO `mob_skill` VALUES (1475,305,1265,'Forceful_Blow', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1476,305,1266,'Somersault_Kick', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1477,305,1267,'Firespit', 0, 30.0, 2000, 1500, 4, 0); -- 1000 dmg
INSERT INTO `mob_skill` VALUES (1478,305,1268,'Warm-Up', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (0,305,432,'Two_Hour', 1, 15.0, 2000, 10, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,305,0,'Rushing Drub', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,305,0,'Groundburst', 1, 16.0, 2000, 1500, 4, 0);

-- Dea (306)
-- Achamoth (307)
-- Khromasoul Bhurborlor (308)
INSERT INTO `mob_skill` VALUES (1487,308,1232,'Rock_Smash', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1488,308,1233,'Diamondhide', 1, 16.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (1489,308,1234,'Enervation', 1, 18.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1490,308,1235,'Quake_Stomp', 0, 7.0, 2000, 1500, 1, 0);

-- Nosferatu (309)
INSERT INTO `mob_skill` VALUES (1850,309,1450,'Bloodrake', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1854,309,1454,'Wings_of_Gehenna', 1, 18.0, 2000, 1500, 4, 0);

-- Experimental Lamia (310)
INSERT INTO `mob_skill` VALUES (1510,310,1253,'Hysteric_Barrage', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1515,310,1258,'Tail_Slap', 4, 16.0, 2000, 1500, 4, 0);

-- Mahjlaef the Paintorn (311)
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Mind_Blast', 4, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Mind_Purge', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Immortal_Shield', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Immortal_Mind', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Immortal_Anathema', 1, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Tribulation', 1, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Reprobation', 1, 18.0, 2000, 1500, 4, 0); -- Only by NM

-- Nuhn (312)
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Hypnic_Lamp', 1, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Vile_Belch', 1, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Seaspray', 4, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Seismic_Tail', 1, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Gnash', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Leeching_Current', 1, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Deathgnash', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Abominable_Belch', 1, 18.0, 2000, 1500, 4, 0);

-- Tinnin (313)
-- INSERT INTO `mob_skill` VALUES (1572,313,0,'Pyric_Blast', 4, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1573,313,0,'Polar_Bulwark', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (1574,313,0,'Polar_Blast', 4, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1575,313,0,'Pyric_Bulwark', 0, 7.0, 2000, 1500, 1, 0);
-- INSERT INTO `mob_skill` VALUES (1576,313,0,'Barofield', 4, 15.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1578,313,0,'Trembling', 1, 5.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1579,313,0,'Serpentine_Tail', 0, 7.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (1580,313,0,'Nerve_Gas', 1, 10.0, 2000, 1500, 4, 0);

-- Sarameya (314)
INSERT INTO `mob_skill` VALUES (1529,314,1223,'Lava_Spit', 1, 10.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1530,314,1224,'Sulfurous_Breath', 0, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1531,314,1225,'Scorching_Lash', 1, 20.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1532,314,1226,'Ululation', 1, 20.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES (1533,314,1227,'Magma_Hoplon', 0, 7.0, 2000, 1500, 1, 0);
INSERT INTO `mob_skill` VALUES (1534,314,1228,'Gates_of_Hades', 1, 20.0, 2000, 1500, 4, 0);

-- Tyger (315)
-- INSERT INTO `mob_skill` VALUES (0,315,0,'Dreadstorm', 1, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,315,0,'Fossilizing_Breath', 4, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,315,0,'Fulmination', 1, 32.0, 2000, 1500, 4, 0); -- only at < 50% strong paralyze
-- INSERT INTO `mob_skill` VALUES (0,315,0,'Plague_Swipe', 4, 16.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,315,0,'Tenebrous_Mist', 1, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,315,0,'Thunderstrike', 1, 18.0, 2000, 1500, 4, 0);
-- INSERT INTO `mob_skill` VALUES (0,315,0,'Tourbillion', 1, 18.0, 2000, 1500, 4, 0);

-- Pandemonium Warden  (316)