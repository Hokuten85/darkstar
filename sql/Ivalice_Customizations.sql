-- ABILITIES
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 41;
UPDATE Abilities SET recastTime = 300 WHERE abilityId = 45;

-- AUGMENTS - DO WE NEED THE CORRECT MULTIPLIER???
UPDATE augments SET multiplier = 10.24, value = 1 WHERE augmentId = 49; -- HASTE+1
UPDATE augments SET multiplier = 10.24, value = -1 WHERE augmentId = 50; -- SLOW+1

-- ITEM_ARMOR -- THIS GETS DELETED
-- NEED TO IMPLEMENT GLOBAL ITEM DROP
-- ALSO IDENTIFY ALL OF THE GEAR DIFFERENCES

-- ITEM_BASIC
-- NEED TO ADJUST SELLING PRICE

-- mob_droplist -- need to add augment item drop - maybe change the actual item - need to make sure that the dropid matches still
INSERT INTO `mob_droplist` VALUES (4510,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (1061,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (1826,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (296,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (3364,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (4401,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (4508,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (2036,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (3539,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (3178,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (3310,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (4559,2,0,1000,3266,250);
INSERT INTO `mob_droplist` VALUES (1842,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4571,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (3412,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4511,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (3623,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (2467,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4507,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (2135,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (477,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4523,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (3379,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (1633,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (272,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (2493,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4574,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (3132,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4325,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4076,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (3464,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (1717,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (190,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4509,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4390,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4391,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (916,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (4408,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (1867,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (1704,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (609,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (367,2,0,1000,2910,250);
INSERT INTO `mob_droplist` VALUES (2402,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (2093,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4575,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (3678,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (1514,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (2746,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (3570,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4524,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (2922,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (1851,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (332,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (3199,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (312,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4578,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (1656,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (410,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (627,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (511,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4392,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4038,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4404,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4394,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4395,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (1644,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (2343,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (2355,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (894,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (1690,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (903,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (1105,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (2145,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (779,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (778,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (325,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (601,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (4563,2,0,1000,2947,250);
INSERT INTO `mob_droplist` VALUES (3388,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4451,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4400,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1671,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1956,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4496,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (503,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (3063,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (586,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (3182,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1958,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4572,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2259,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1046,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1959,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4577,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1034,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4405,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (803,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1960,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (571,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1961,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (653,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4573,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1962,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (3591,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (781,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4403,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (3352,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (3524,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2806,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2238,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2916,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (904,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2815,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2961,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2554,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2960,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2516,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2273,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2824,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1963,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (471,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (921,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (630,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1955,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2220,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2414,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4517,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (3234,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (3244,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (603,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2869,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (436,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4191,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (194,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (1760,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (174,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (2039,2,0,1000,3262,250);
INSERT INTO `mob_droplist` VALUES (4020,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4454,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4455,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1788,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1511,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2734,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4478,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2510,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (3665,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2132,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (3586,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (836,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1654,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (473,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (38,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1187,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4558,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2199,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4576,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2490,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1939,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1078,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (896,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (3172,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (508,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (813,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2483,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2261,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (3003,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (497,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (445,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4370,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4371,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4402,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (346,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1089,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2879,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4209,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (876,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4194,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1065,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2914,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (3139,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2350,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1100,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1861,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4061,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (182,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (1590,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (802,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (2404,2,0,1000,3261,250);
INSERT INTO `mob_droplist` VALUES (4522,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (420,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (720,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4042,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2835,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2239,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (561,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (672,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4348,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (855,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (234,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2089,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2070,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (449,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1785,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1776,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (377,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3661,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (274,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4568,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3230,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1410,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4557,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1932,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4565,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4569,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4564,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (336,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1935,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1045,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2094,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (36,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3354,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3208,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4506,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4512,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (500,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4070,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2987,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (536,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1884,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2302,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4027,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4174,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (303,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (398,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (841,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3476,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (971,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1618,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3430,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3445,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1840,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2735,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4189,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2285,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1101,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4480,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4428,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4431,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4429,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4430,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4426,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4432,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (687,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (794,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2288,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2533,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3225,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2291,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (499,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3033,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2494,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3589,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (1199,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3096,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (2767,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (3097,2,0,1000,3231,250);
INSERT INTO `mob_droplist` VALUES (4364,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2364,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (370,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4141,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (309,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (533,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (610,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2929,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2034,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1941,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (230,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (285,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4514,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2276,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2542,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2639,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2277,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2278,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4446,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (156,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2279,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (372,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2280,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3288,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3289,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2195,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3552,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3287,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (659,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (599,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3030,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2281,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3286,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (496,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1049,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (472,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2282,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (248,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (582,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4019,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (245,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3138,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3183,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2543,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2283,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3028,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (67,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (337,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4337,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (157,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2284,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2768,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2379,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3095,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4026,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4326,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2488,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (706,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4366,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1819,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1817,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1820,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1818,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (17709,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2287,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2908,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2225,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (213,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (507,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1591,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3130,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2289,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2303,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1519,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4137,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2486,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (835,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3285,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (465,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2128,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2290,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (136,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (135,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (139,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (728,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1631,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (4200,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1145,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2110,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2262,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2416,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2757,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1658,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3282,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (2722,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (305,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (3200,2,0,1000,3247,250);
INSERT INTO `mob_droplist` VALUES (1104,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (66,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (1613,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2274,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (417,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4411,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4415,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4412,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4413,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4416,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4409,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4410,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4363,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4447,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (91,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (646,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (719,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (162,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2269,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (165,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (161,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (167,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2754,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2638,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (1410,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3010,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4515,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (24,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2275,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2910,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3011,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (26,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (729,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (750,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2705,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2660,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4244,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4307,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4221,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3663,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2737,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (1814,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (55,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (279,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3440,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (304,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3545,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3561,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3555,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (798,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2765,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4448,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (13,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (11,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (14,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (12,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (8,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (580,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2507,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2286,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4084,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4197,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (498,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2911,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2909,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (4516,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3642,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2064,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (1026,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3432,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (147,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (3588,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (137,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (134,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (125,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2830,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2079,2,0,1000,3294,250);
INSERT INTO `mob_droplist` VALUES (2418,2,0,1000,3294,250);

-- SPELL LIST
UPDATE spell_list SET mpCost = 20, castTime = 2000, recastTime = 10000 WHERE spellid = 57; -- haste
UPDATE spell_list SET validTargets = 3 WHERE spellid = 100; -- enfire
UPDATE spell_list SET validTargets = 3 WHERE spellid = 101; -- enblizzard
UPDATE spell_list SET validTargets = 3 WHERE spellid = 102; -- enaero
UPDATE spell_list SET validTargets = 3 WHERE spellid = 103; -- enstone
UPDATE spell_list SET validTargets = 3 WHERE spellid = 104; -- enthunder
UPDATE spell_list SET validTargets = 3 WHERE spellid = 105; -- enwater
UPDATE spell_list SET mpCost = 20, recastTime = 9000 WHERE spellid = 109; -- refresh
UPDATE spell_list SET mpCost = 15, castTime = 1500 WHERE spellid = 143; -- erase
UPDATE spell_list SET mpCost = 4 WHERE spellid = 144; -- fire
UPDATE spell_list SET mpCost = 16 WHERE spellid = 145; -- fire 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 146; -- fire 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 147; -- fire 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 148; -- fire 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 149; -- blizzard
UPDATE spell_list SET mpCost = 16 WHERE spellid = 150; -- blizzard 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 151; -- blizzard 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 152; -- blizzard 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 153; -- blizzard 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 154; -- aero
UPDATE spell_list SET mpCost = 16 WHERE spellid = 155; -- aero 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 156; -- aero 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 157; -- aero 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 158; -- aero 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 159; -- stone
UPDATE spell_list SET mpCost = 16 WHERE spellid = 160; -- stone 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 161; -- stone 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 162; -- stone 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 163; -- stone 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 164; -- thunder
UPDATE spell_list SET mpCost = 16 WHERE spellid = 165; -- thunder 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 166; -- thunder 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 167; -- thunder 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 168; -- thunder 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 169; -- water
UPDATE spell_list SET mpCost = 16 WHERE spellid = 170; -- water 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 171; -- water 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 172; -- water 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 173; -- water 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 174; -- firaga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 175; -- firaga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 176; -- firaga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 177; -- firaga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 178; -- firaga 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 179; -- blizzaga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 180; -- blizzaga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 181; -- blizzaga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 182; -- blizzaga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 183; -- blizzaga 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 184; -- aeroga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 185; -- aeroga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 186; -- aeroga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 187; -- aeroga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 188; -- aeroga 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 189; -- stonega
UPDATE spell_list SET mpCost = 93 WHERE spellid = 190; -- stonega 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 191; -- stonega 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 192; -- stonega 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 193; -- stonega 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 194; -- thundaga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 195; -- thundaga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 196; -- thundaga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 197; -- thundaga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 198; -- thundaga 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 199; -- waterga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 200; -- waterga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 201; -- waterga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 202; -- waterga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 203; -- waterga 5
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 242; -- absorb-acc
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 266; -- absorb-str
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 267; -- absorb-dex
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 268; -- absorb-vit
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 269; -- absorb-agi
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 270; -- absorb-int
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 271; -- absorb-mnd
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 272; -- absorb-chr
UPDATE spell_list SET validTargets = 3 WHERE spellid = 312; -- enfire 2
UPDATE spell_list SET validTargets = 3 WHERE spellid = 313; -- enblizzard 2
UPDATE spell_list SET validTargets = 3 WHERE spellid = 314; -- enaero 2
UPDATE spell_list SET validTargets = 3 WHERE spellid = 315; -- enstone 2
UPDATE spell_list SET validTargets = 3 WHERE spellid = 316; -- enthunder 2
UPDATE spell_list SET validTargets = 3 WHERE spellid = 317; -- enwater 2
UPDATE spell_list SET jobs = 0x000000004B0000000000000000000000000000000000, mpCost = 30, recastTime = 13500 WHERE spellid = 473; -- refresh 2
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 479; -- boost-str
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 480; -- boost-dex
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 481; -- boost-vit
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 482; -- boost-agi
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 483; -- boost-int
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 484; -- boost-mnd
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 485; -- boost-chr
UPDATE spell_list SET mpCost = 298 WHERE spellid = 496; -- firaja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 497; -- blizzaja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 498; -- aeroja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 499; -- stoneja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 500; -- thundaja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 501; -- waterja
UPDATE spell_list SET mpCost = 50, recastTime = 10000 WHERE spellid = 511; -- haste 2

-- TRAITS -- DO CUSTOM TRAITS-- CUSTOM TRAITS
-- MOD_CRIT_DMG_INCREASE
-- INSERT INTO `traits` VALUES ('150','crit dmg bonus','6','1','1','421','10',null); 
-- INSERT INTO `traits` VALUES ('150','crit dmg bonus','13','1','1','421','10',null);

-- -- Adjust the enmity cap
-- INSERT INTO `traits` VALUES ('151','enmity cap','7','25','1','2000','100',null);
-- INSERT INTO `traits` VALUES ('151','enmity cap','7','50','2','2000','500',null);
-- INSERT INTO `traits` VALUES ('151','enmity cap','7','75','3','2000','1000',null);
-- INSERT INTO `traits` VALUES ('151','enmity cap','7','99','4','2000','1500',null);

-- -- -DT% II
-- INSERT INTO `traits` VALUES ('152','damage taken II','7','10','1','2001','2',null);
-- INSERT INTO `traits` VALUES ('152','damage taken II','7','30','2','2001','4',null);
-- INSERT INTO `traits` VALUES ('152','damage taken II','7','50','3','2001','6',null);
-- INSERT INTO `traits` VALUES ('152','damage taken II','7','70','4','2001','8',null);
-- INSERT INTO `traits` VALUES ('152','damage taken II','7','75','5','2001','10',null);
-- INSERT INTO `traits` VALUES ('152','damage taken II','7','99','6','2001','12',null);

UPDATE traits SET value = 20 WHERE traitid = 1 AND job = 14 AND level = 30 AND modifier = 25;
UPDATE traits SET value = 20 WHERE traitid = 1 AND job = 14 AND level = 30 AND modifier = 26;
UPDATE traits SET value = 50 WHERE traitid = 1 AND job = 14 AND level = 50 AND modifier = 25;
UPDATE traits SET value = 50 WHERE traitid = 1 AND job = 14 AND level = 50 AND modifier = 26;
UPDATE traits SET value = 60 WHERE traitid = 1 AND job = 14 AND level = 78 AND modifier = 25;
UPDATE traits SET value = 60 WHERE traitid = 1 AND job = 14 AND level = 78 AND modifier = 26;

UPDATE traits SET value = 15 WHERE traitid = 14 AND job = 12 AND level = 10 AND modifier = 73;
UPDATE traits SET value = 20 WHERE traitid = 14 AND job = 12 AND level = 30 AND modifier = 73;
UPDATE traits SET value = 25 WHERE traitid = 14 AND job = 12 AND level = 50 AND modifier = 73;
UPDATE traits SET value = 30 WHERE traitid = 14 AND job = 12 AND level = 70 AND modifier = 73;
UPDATE traits SET value = 35 WHERE traitid = 14 AND job = 12 AND level = 90 AND modifier = 73;

UPDATE traits SET value = 35 WHERE traitid = 67 AND job = 2 AND level = 5 AND modifier = 289;
UPDATE traits SET value = 40 WHERE traitid = 67 AND job = 2 AND level = 25 AND modifier = 289;
UPDATE traits SET value = 45 WHERE traitid = 67 AND job = 2 AND level = 45 AND modifier = 289;
UPDATE traits SET value = 50 WHERE traitid = 67 AND job = 2 AND level = 65 AND modifier = 289;
UPDATE traits SET value = 55 WHERE traitid = 67 AND job = 2 AND level = 91 AND modifier = 289;

UPDATE traits SET level = 30 WHERE traitid = 68 AND job = 6 AND level = 60;

UPDATE traits SET value = 30 WHERE traitid = 84 AND job = 11 AND level = 20 AND modifier = 305;
INSERT INTO `traits` VALUES (84,'recycle',11,40,2,305,40,'SOA',0);
INSERT INTO `traits` VALUES (84,'recycle',11,50,3,305,50,'SOA',0);

UPDATE traits SET level = 25 WHERE traitid = 106 AND job = 12 AND level = 78 AND rank = 1 AND modifier = 174;
UPDATE traits SET level = 50 WHERE traitid = 106 AND job = 12 AND level = 88 AND rank = 2 AND modifier = 174;
UPDATE traits SET level = 75 WHERE traitid = 106 AND job = 12 AND level = 98 AND rank = 3 AND modifier = 174;

-- TRIGGERS
DROP TRIGGER IF EXISTS char_insert_custom $$
CREATE TRIGGER char_insert_custom
	BEFORE INSERT ON chars
	FOR EACH ROW
BEGIN
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 48, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 49, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 50, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 51, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 52, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 53, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 54, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 55, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 56, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 57, 2000, 15);
END $$

-- WEAPONSKILLS
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 15;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 224;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 226;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 60;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 77;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 93;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 109;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 125;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 141;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 157;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 174;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 191;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 203;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 221;