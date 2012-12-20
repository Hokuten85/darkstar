/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 12/19/2012 10:10:58 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for nm_spawn_points
-- ----------------------------
CREATE TABLE `nm_spawn_points` (
  `mobid` int(10) NOT NULL,
  `pos` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`mobid`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `nm_spawn_points` VALUES ('17215888', '0', '-364.189', '30.000', '-442.720');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '1', '-292.232', '21.428', '-413.230');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '2', '-270.019', '20.612', '-389.970');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '3', '-303.720', '26.918', '-320.710');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '4', '-307.972', '27.455', '-367.421');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '5', '-283.056', '20.000', '-398.952');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '6', '-259.746', '22.722', '-412.237');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '7', '-357.308', '32.336', '-422.769');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '8', '-290.946', '21.210', '-321.456');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '9', '-275.636', '22.476', '-420.625');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '10', '-289.261', '21.320', '-328.841');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '11', '-321.379', '29.821', '-322.494');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '12', '-260.427', '22.593', '-405.967');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '13', '-360.824', '30.114', '-454.615');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '14', '-297.822', '23.327', '-318.877');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '15', '-288.541', '21.439', '-330.873');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '16', '-264.865', '20.765', '-336.617');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '17', '-332.532', '31.063', '-381.882');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '18', '-339.668', '28.619', '-388.642');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '19', '-321.228', '30.000', '-382.849');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '20', '-284.635', '20.810', '-386.643');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '21', '-333.047', '30.800', '-325.419');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '22', '-302.158', '27.208', '-350.053');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '23', '-315.889', '29.358', '-318.021');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '24', '-278.573', '20.138', '-339.390');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '25', '-293.311', '21.933', '-318.758');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '26', '-286.319', '20.645', '-391.222');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '27', '-322.615', '32.348', '-417.432');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '28', '-339.649', '32.626', '-336.988');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '29', '-336.543', '31.582', '-341.736');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '30', '-264.601', '22.994', '-419.366');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '31', '-278.841', '20.000', '-362.440');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '32', '-280.307', '20.035', '-382.155');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '33', '-368.938', '30.712', '-429.955');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '34', '-332.177', '30.313', '-345.107');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '35', '-330.438', '30.000', '-327.495');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '36', '-353.660', '29.043', '-449.413');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '37', '-323.998', '30.032', '-404.350');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '38', '-268.856', '21.258', '-398.745');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '39', '-264.791', '21.973', '-374.422');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '40', '-320.521', '29.886', '-320.865');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '41', '-355.270', '28.576', '-463.004');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '42', '-350.338', '32.823', '-421.285');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '43', '-263.350', '20.661', '-331.257');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '44', '-330.561', '30.093', '-399.022');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '45', '-273.274', '21.144', '-347.048');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '46', '-300.770', '26.288', '-344.735');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '47', '-318.258', '29.993', '-347.883');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '48', '-309.062', '28.860', '-321.399');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '49', '-317.119', '30.000', '-322.596');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '0', '-228.957', '2.776', '-101.226');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '1', '-264.829', '-0.843', '-91.306');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '2', '-95.250', '-0.268', '-49.386');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '3', '-144.284', '-1.103', '4.202');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '4', '-270.823', '-2.168', '-16.349');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '5', '-327.000', '-1.000', '-21.000');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '6', '-173.748', '0.359', '-77.374');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '7', '-143.231', '-1.973', '-67.419');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '8', '-281.184', '0.000', '-41.859');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '9', '-205.980', '0.227', '-86.736');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '10', '-282.016', '0.955', '-60.878');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '11', '-246.524', '-0.916', '-51.146');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '12', '-228.267', '-0.028', '-36.761');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '13', '-220.278', '1.528', '-92.214');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '14', '-225.198', '3.304', '-102.791');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '15', '-185.404', '-1.042', '-60.996');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '16', '-120.077', '-0.006', '-78.574');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '17', '-346.179', '-0.286', '-23.185');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '18', '-338.025', '0.232', '-30.453');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '19', '-253.393', '0.372', '-87.479');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '20', '-205.024', '-1.791', '-24.880');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '21', '-279.494', '0.111', '7.036');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '22', '-160.476', '-0.069', '-41.088');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '23', '-328.453', '-0.837', '-47.501');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '24', '-205.095', '-0.040', '-39.637');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '25', '-197.814', '0.000', '-80.991');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '26', '-252.723', '-1.271', '-43.100');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '27', '-333.218', '-1.442', '-8.725');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '28', '-226.117', '-1.772', '11.871');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '29', '-210.075', '-1.062', '-27.973');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '30', '-265.240', '-0.799', '-48.374');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '31', '-130.870', '-0.088', '-54.813');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '32', '-291.648', '0.381', '-42.898');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '33', '-283.645', '0.351', '-68.965');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '34', '-317.890', '-0.426', '-5.929');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '35', '-168.851', '-1.917', '-54.953');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '36', '-132.327', '-0.742', '-71.357');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '37', '-329.940', '-0.704', '-24.331');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '38', '-211.036', '-0.286', '-55.029');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '39', '-155.887', '1.180', '-93.927');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '40', '-291.247', '0.396', '5.381');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '41', '-221.531', '3.786', '-108.077');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '42', '-284.165', '0.902', '-58.260');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '43', '-170.882', '-0.857', '-35.825');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '44', '-257.265', '-0.995', '-57.143');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '45', '-212.513', '3.307', '-105.392');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '46', '-215.818', '0.651', '-43.917');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '47', '-297.203', '-1.108', '-9.745');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '48', '-308.615', '0.242', '-44.649');
INSERT INTO `nm_spawn_points` VALUES ('17199438', '49', '-264.390', '-1.137', '29.689');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '0', '-138.181', '48.389', '-338.001');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '1', '-212.407', '38.538', '-342.544');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '2', '-143.426', '48.267', '-342.433');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '3', '-147.128', '48.343', '-341.618');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '4', '-153.389', '48.438', '-339.050');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '5', '-166.042', '48.340', '-340.356');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '6', '-162.396', '48.436', '-331.558');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '7', '-148.072', '48.484', '-333.427');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '8', '-158.004', '48.441', '-340.802');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '9', '-156.357', '48.451', '-339.278');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '10', '-159.208', '48.246', '-346.543');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '11', '-144.259', '48.485', '-337.866');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '12', '-143.087', '48.271', '-342.227');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '13', '-163.429', '48.460', '-337.624');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '14', '-131.404', '48.213', '-333.826');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '15', '-150.358', '48.291', '-338.601');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '16', '-160.974', '48.453', '-333.704');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '17', '-142.180', '48.271', '-345.135');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '18', '-145.668', '48.405', '-332.181');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '19', '-143.056', '48.276', '-341.779');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '20', '-163.198', '48.327', '-329.005');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '21', '-162.195', '48.460', '-333.260');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '22', '-134.991', '48.422', '-339.475');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '23', '-137.878', '48.355', '-344.886');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '24', '-162.424', '48.375', '-343.121');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '25', '-149.198', '48.475', '-331.289');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '26', '-134.900', '48.415', '-339.600');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '27', '-160.080', '48.457', '-332.202');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '28', '-138.565', '48.477', '-337.513');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '29', '-149.252', '48.330', '-343.319');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '30', '-139.382', '48.414', '-339.323');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '31', '-141.571', '48.426', '-338.449');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '32', '-144.768', '48.291', '-341.985');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '33', '-162.567', '48.465', '-340.182');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '34', '-163.176', '48.323', '-342.850');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '35', '-137.511', '48.474', '-341.490');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '36', '-152.557', '48.309', '-345.523');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '37', '-138.096', '48.493', '-334.148');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '38', '-158.110', '48.448', '-339.344');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '39', '-138.303', '48.420', '-343.009');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '40', '-151.590', '48.434', '-341.447');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '41', '-160.400', '48.477', '-339.910');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '42', '-135.993', '48.497', '-339.355');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '43', '-143.747', '48.389', '-332.658');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '44', '-139.887', '48.470', '-337.201');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '45', '-162.400', '48.474', '-332.129');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '46', '-150.407', '48.460', '-333.947');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '47', '-138.264', '48.466', '-341.724');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '48', '-130.664', '48.315', '-338.463');
INSERT INTO `nm_spawn_points` VALUES ('17498522', '49', '-164.707', '48.330', '-330.263');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '0', '124.811', '-0.363', '-100.604');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '1', '109.361', '0.148', '-128.993');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '2', '130.993', '0.442', '-111.490');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '3', '126.928', '0.211', '-106.533');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '4', '122.910', '0.000', '-118.897');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '5', '112.603', '0.413', '-105.733');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '6', '109.077', '0.000', '-111.850');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '7', '123.890', '-0.536', '-112.319');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '8', '117.297', '0.416', '-109.273');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '9', '112.664', '0.121', '-122.534');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '10', '121.128', '0.000', '-111.788');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '11', '121.333', '0.000', '-120.997');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '12', '126.728', '0.180', '-113.917');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '13', '119.422', '1.000', '-99.664');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '14', '122.871', '-0.043', '-127.113');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '15', '132.335', '-0.089', '-106.863');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '16', '130.137', '0.000', '-129.243');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '17', '117.412', '-0.269', '-113.127');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '18', '114.242', '-0.046', '-126.706');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '19', '124.875', '-0.213', '-108.697');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '20', '121.688', '0.000', '-121.562');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '21', '117.877', '-0.111', '-111.539');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '22', '122.518', '-0.086', '-115.179');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '23', '128.073', '0.290', '-123.622');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '24', '103.632', '-0.066', '-105.804');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '25', '121.592', '0.000', '-125.763');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '26', '125.757', '0.346', '-122.563');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '27', '116.237', '-0.156', '-120.866');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '28', '131.498', '-0.506', '-126.574');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '29', '114.886', '-0.145', '-125.954');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '30', '119.943', '0.000', '-116.446');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '31', '105.091', '-0.233', '-108.453');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '32', '125.475', '0.292', '-123.448');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '33', '120.996', '-0.122', '-113.644');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '34', '124.071', '-0.365', '-108.863');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '35', '104.733', '0.248', '-133.460');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '36', '129.965', '0.421', '-101.528');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '37', '130.587', '0.326', '-116.376');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '38', '119.320', '0.000', '-126.280');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '39', '111.265', '0.361', '-109.438');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '40', '109.970', '0.000', '-131.393');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '41', '132.726', '-0.508', '-133.828');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '42', '123.419', '0.835', '-98.878');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '43', '117.756', '-0.124', '-119.150');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '44', '119.018', '0.000', '-125.633');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '45', '121.352', '-0.069', '-124.460');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '46', '126.158', '0.049', '-99.448');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '47', '112.918', '0.137', '-123.509');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '48', '121.109', '0.000', '-116.222');
INSERT INTO `nm_spawn_points` VALUES ('17649693', '49', '111.741', '-0.059', '-115.428');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '0', '-39.356', '14.265', '-60.406');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '1', '-42.177', '15.083', '-61.268');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '2', '-48.591', '13.670', '-62.263');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '3', '-39.077', '15.000', '-59.959');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '4', '-42.040', '15.119', '-59.413');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '5', '-45.355', '14.945', '-63.082');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '6', '-45.193', '14.955', '-60.006');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '7', '-46.133', '14.723', '-58.024');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '8', '-36.114', '13.989', '-57.724');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '9', '-44.620', '14.929', '-58.605');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '10', '-38.414', '14.750', '-60.096');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '11', '-37.471', '14.464', '-58.490');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '12', '-49.069', '14.049', '-63.596');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '13', '-35.559', '13.641', '-60.284');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '14', '-39.356', '14.726', '-56.944');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '15', '-41.782', '14.828', '-62.819');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '16', '-41.119', '14.902', '-62.313');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '17', '-44.116', '14.974', '-58.091');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '18', '-44.787', '14.938', '-58.249');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '19', '-39.329', '15.000', '-60.935');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '20', '-47.256', '14.195', '-60.468');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '21', '-40.315', '15.000', '-61.106');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '22', '-46.956', '14.285', '-60.829');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '23', '-41.968', '15.106', '-59.468');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '24', '-45.563', '14.874', '-58.500');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '25', '-43.377', '15.110', '-62.059');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '26', '-42.620', '14.884', '-62.945');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '27', '-43.278', '15.144', '-61.741');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '28', '-41.023', '14.673', '-63.246');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '29', '-43.524', '15.119', '-62.085');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '30', '-45.161', '14.976', '-62.846');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '31', '-41.322', '14.998', '-60.555');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '32', '-47.200', '14.111', '-61.794');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '33', '-41.550', '14.499', '-63.605');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '34', '-42.250', '14.591', '-56.363');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '35', '-40.948', '14.825', '-62.632');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '36', '-49.601', '14.065', '-64.565');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '37', '-44.667', '14.892', '-63.163');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '38', '-44.647', '15.059', '-60.604');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '39', '-39.933', '14.947', '-62.122');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '40', '-45.304', '14.946', '-62.563');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '41', '-41.809', '15.014', '-61.388');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '42', '-45.711', '14.864', '-58.371');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '43', '-43.851', '14.419', '-56.093');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '44', '-41.899', '14.990', '-58.209');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '45', '-44.736', '14.932', '-58.965');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '46', '-43.535', '14.512', '-56.305');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '47', '-41.900', '14.829', '-62.887');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '48', '-43.684', '14.866', '-57.263');
INSERT INTO `nm_spawn_points` VALUES ('17649731', '49', '-40.679', '14.138', '-64.338');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '0', '-1.758', '4.982', '153.412');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '1', '8.113', '5.055', '159.197');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '2', '9.000', '4.000', '176.000');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '3', '-7.000', '4.467', '184.000');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '4', '-7.233', '4.976', '204.202');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '5', '26.971', '4.440', '216.229');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '6', '48.440', '5.070', '174.352');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '7', '39.858', '4.364', '164.961');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '8', '-9.860', '5.000', '157.107');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '9', '-4.819', '4.997', '187.279');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '10', '-5.480', '5.494', '177.016');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '11', '42.083', '5.000', '157.020');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '12', '29.577', '5.580', '159.990');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '13', '9.142', '4.628', '179.913');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '14', '35.096', '4.845', '158.344');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '15', '43.935', '4.616', '164.665');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '16', '9.698', '5.300', '196.612');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '17', '34.299', '5.750', '177.411');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '18', '39.423', '5.000', '200.673');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '19', '37.125', '5.365', '185.204');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '20', '21.707', '4.469', '189.550');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '21', '10.144', '5.522', '161.599');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '22', '36.580', '4.993', '184.457');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '23', '21.885', '4.912', '180.982');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '24', '50.998', '5.612', '183.429');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '25', '-1.155', '5.431', '151.473');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '26', '14.400', '5.583', '150.008');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '27', '25.632', '3.720', '186.014');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '28', '29.374', '3.505', '190.121');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '29', '24.605', '4.521', '180.938');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '30', '14.340', '5.280', '174.699');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '31', '32.724', '4.594', '169.051');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '32', '29.209', '5.478', '205.358');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '33', '4.631', '5.004', '153.875');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '34', '1.482', '6.000', '178.313');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '35', '21.752', '5.946', '157.108');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '36', '26.548', '4.373', '166.393');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '37', '-1.625', '5.000', '195.947');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '38', '24.204', '4.296', '167.082');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '39', '10.948', '5.711', '200.284');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '40', '-12.273', '4.984', '174.358');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '41', '38.889', '5.282', '173.433');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '42', '18.121', '4.958', '184.339');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '43', '7.471', '5.000', '167.265');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '44', '43.358', '5.323', '172.545');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '45', '2.505', '5.000', '162.695');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '46', '35.051', '5.000', '197.337');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '47', '7.846', '5.191', '202.515');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '48', '19.666', '6.000', '160.166');
INSERT INTO `nm_spawn_points` VALUES ('17649822', '49', '39.591', '5.000', '165.616');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '0', '38.347', '5.500', '178.050');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '1', '43.103', '5.677', '181.977');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '2', '41.150', '5.026', '204.483');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '3', '24.384', '5.471', '197.938');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '4', '13.729', '4.814', '166.295');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '5', '5.096', '3.930', '166.865');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '6', '8.225', '5.551', '151.919');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '7', '20.416', '4.832', '189.654');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '8', '-1.666', '4.677', '164.201');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '9', '19.538', '5.778', '197.512');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '10', '42.669', '5.287', '178.122');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '11', '16.745', '5.959', '202.097');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '12', '39.434', '5.000', '157.759');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '13', '16.071', '5.323', '183.930');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '14', '33.197', '5.412', '208.225');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '15', '-12.154', '5.196', '179.741');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '16', '45.141', '4.761', '165.555');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '17', '18.929', '5.062', '189.397');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '18', '22.365', '5.674', '202.914');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '19', '-0.308', '5.000', '156.127');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '20', '25.342', '4.490', '190.970');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '21', '3.018', '5.500', '151.834');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '22', '47.518', '5.108', '157.538');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '23', '43.496', '5.888', '181.453');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '24', '39.093', '4.761', '167.379');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '25', '51.751', '5.148', '179.754');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '26', '28.559', '5.222', '196.991');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '27', '3.115', '4.431', '167.534');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '28', '36.808', '5.000', '200.014');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '29', '31.891', '4.984', '202.098');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '30', '26.672', '6.000', '159.843');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '31', '9.982', '4.360', '177.286');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '32', '29.577', '4.091', '182.754');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '33', '38.950', '6.000', '183.656');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '34', '-2.016', '5.586', '181.630');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '35', '30.351', '5.480', '157.129');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '36', '5.447', '4.854', '190.600');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '37', '3.429', '4.700', '192.220');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '38', '-4.040', '5.870', '178.165');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '39', '5.362', '4.431', '165.531');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '40', '13.258', '5.540', '151.087');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '41', '40.123', '5.407', '190.266');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '42', '0.356', '5.000', '157.963');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '43', '2.633', '5.907', '177.665');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '44', '21.833', '5.193', '193.164');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '45', '26.012', '4.669', '192.468');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '46', '7.124', '4.581', '173.092');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '47', '2.651', '5.336', '186.460');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '48', '16.536', '5.572', '203.888');
INSERT INTO `nm_spawn_points` VALUES ('17649818', '49', '44.463', '5.186', '151.789');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '0', '-119.897', '0.275', '127.060');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '1', '-126.841', '-0.554', '129.681');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '2', '-140.000', '-0.955', '144.000');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '3', '-127.567', '-0.046', '128.790');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '4', '-127.477', '-0.713', '131.674');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '5', '-126.123', '-0.794', '119.478');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '6', '-128.146', '-0.486', '131.967');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '7', '-112.349', '0.357', '120.813');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '8', '-131.940', '0.000', '129.200');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '9', '-111.603', '0.000', '131.740');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '10', '-139.276', '0.522', '169.726');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '11', '-138.515', '0.196', '163.013');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '12', '-112.132', '0.347', '123.396');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '13', '-112.185', '0.403', '119.349');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '14', '-132.750', '-0.693', '141.197');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '15', '-123.467', '0.420', '126.177');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '16', '-134.806', '-0.383', '137.258');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '17', '-133.951', '-0.444', '132.249');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '18', '-121.559', '-0.042', '124.208');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '19', '-142.328', '-0.101', '160.475');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '20', '-122.560', '0.000', '119.368');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '21', '-137.594', '0.062', '146.113');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '22', '-130.330', '-0.459', '137.564');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '23', '-130.844', '0.000', '129.291');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '24', '-113.427', '-0.181', '130.849');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '25', '-133.283', '-0.580', '134.269');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '26', '-123.920', '-0.971', '121.728');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '27', '-107.747', '-0.761', '127.387');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '28', '-131.104', '0.198', '119.130');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '29', '-142.146', '0.088', '164.039');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '30', '-131.259', '-0.075', '133.458');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '31', '-139.860', '0.274', '170.049');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '32', '-141.196', '0.313', '164.407');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '33', '-119.757', '0.500', '129.177');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '34', '-118.001', '-0.733', '124.052');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '35', '-136.853', '-0.170', '139.145');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '36', '-116.568', '0.088', '126.651');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '37', '-117.588', '-0.414', '124.803');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '38', '-114.531', '-0.021', '120.129');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '39', '-133.084', '-0.201', '131.928');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '40', '-122.383', '-0.043', '123.871');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '41', '-140.540', '-0.881', '147.108');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '42', '-133.420', '-0.348', '135.990');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '43', '-139.498', '-0.303', '143.339');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '44', '-116.699', '-0.326', '116.940');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '45', '-117.648', '-0.198', '122.736');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '46', '-141.699', '0.000', '159.967');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '47', '-111.942', '0.000', '127.207');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '48', '-134.044', '-0.092', '140.415');
INSERT INTO `nm_spawn_points` VALUES ('17649784', '49', '-121.852', '-0.242', '116.384');
