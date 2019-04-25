/*
Navicat MySQL Data Transfer

Source Server         : wyj
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : wyjqz

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-25 15:18:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add test', '7', 'add_test');
INSERT INTO `auth_permission` VALUES ('26', 'Can change test', '7', 'change_test');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete test', '7', 'delete_test');
INSERT INTO `auth_permission` VALUES ('28', 'Can view test', '7', 'view_test');
INSERT INTO `auth_permission` VALUES ('29', 'Can add test2', '8', 'add_test2');
INSERT INTO `auth_permission` VALUES ('30', 'Can change test2', '8', 'change_test2');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete test2', '8', 'delete_test2');
INSERT INTO `auth_permission` VALUES ('32', 'Can view test2', '8', 'view_test2');
INSERT INTO `auth_permission` VALUES ('33', 'Can add test3', '9', 'add_test3');
INSERT INTO `auth_permission` VALUES ('34', 'Can change test3', '9', 'change_test3');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete test3', '9', 'delete_test3');
INSERT INTO `auth_permission` VALUES ('36', 'Can view test3', '9', 'view_test3');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'TestModel', 'test');
INSERT INTO `django_content_type` VALUES ('8', 'TestModel', 'test2');
INSERT INTO `django_content_type` VALUES ('9', 'TestModel', 'test3');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'TestModel', '0001_initial', '2019-04-23 08:18:36.658442');
INSERT INTO `django_migrations` VALUES ('2', 'TestModel', '0002_auto_20190423_1531', '2019-04-23 08:18:36.922201');
INSERT INTO `django_migrations` VALUES ('3', 'contenttypes', '0001_initial', '2019-04-23 08:18:36.989193');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0001_initial', '2019-04-23 08:18:37.273057');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0001_initial', '2019-04-23 08:18:38.062355');
INSERT INTO `django_migrations` VALUES ('6', 'admin', '0002_logentry_remove_auto_add', '2019-04-23 08:18:38.226157');
INSERT INTO `django_migrations` VALUES ('7', 'admin', '0003_logentry_add_action_flag_choices', '2019-04-23 08:18:38.245210');
INSERT INTO `django_migrations` VALUES ('8', 'contenttypes', '0002_remove_content_type_name', '2019-04-23 08:18:38.397225');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0002_alter_permission_name_max_length', '2019-04-23 08:18:38.491857');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0003_alter_user_email_max_length', '2019-04-23 08:18:38.578944');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0004_alter_user_username_opts', '2019-04-23 08:18:38.593982');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0005_alter_user_last_login_null', '2019-04-23 08:18:38.663646');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0006_require_contenttypes_0002', '2019-04-23 08:18:38.721164');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0007_alter_validators_add_error_messages', '2019-04-23 08:18:38.746259');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0008_alter_user_username_max_length', '2019-04-23 08:18:38.862801');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0009_alter_user_last_name_max_length', '2019-04-23 08:18:38.964455');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0010_alter_group_name_max_length', '2019-04-23 08:18:39.055362');
INSERT INTO `django_migrations` VALUES ('18', 'auth', '0011_update_proxy_permissions', '2019-04-23 08:18:39.065878');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2019-04-23 08:18:39.102806');
INSERT INTO `django_migrations` VALUES ('20', 'TestModel', '0003_test2', '2019-04-23 08:58:24.564301');
INSERT INTO `django_migrations` VALUES ('21', 'TestModel', '0004_test3', '2019-04-24 13:40:39.274293');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for testmodel_test
-- ----------------------------
DROP TABLE IF EXISTS `testmodel_test`;
CREATE TABLE `testmodel_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `detail1` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `detail2` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of testmodel_test
-- ----------------------------
INSERT INTO `testmodel_test` VALUES ('1', '肖申克的救赎', '\n                            导演: 弗兰克·德拉邦特 Frank Darabont   主演: 蒂姆·罗宾斯 Tim Robbins /...', '\n                            1994 / 美国 / 犯罪 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('2', '霸王别姬', '\n                            导演: 陈凯歌 Kaige Chen   主演: 张国荣 Leslie Cheung / 张丰毅 Fengyi Zha...', '\n                            1993 / 中国大陆 香港 / 剧情 爱情 同性\n                        ');
INSERT INTO `testmodel_test` VALUES ('3', '这个杀手不太冷', '\n                            导演: 吕克·贝松 Luc Besson   主演: 让·雷诺 Jean Reno / 娜塔莉·波特曼 ...', '\n                            1994 / 法国 / 剧情 动作 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('4', '阿甘正传', '\n                            导演: 罗伯特·泽米吉斯 Robert Zemeckis   主演: 汤姆·汉克斯 Tom Hanks / ...', '\n                            1994 / 美国 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('5', '美丽人生', '\n                            导演: 罗伯托·贝尼尼 Roberto Benigni   主演: 罗伯托·贝尼尼 Roberto Beni...', '\n                            1997 / 意大利 / 剧情 喜剧 爱情 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('6', '泰坦尼克号', '\n                            导演: 詹姆斯·卡梅隆 James Cameron   主演: 莱昂纳多·迪卡普里奥 Leonardo...', '\n                            1997 / 美国 / 剧情 爱情 灾难\n                        ');
INSERT INTO `testmodel_test` VALUES ('7', '千与千寻', '\n                            导演: 宫崎骏 Hayao Miyazaki   主演: 柊瑠美 Rumi Hîragi / 入野自由 Miy...', '\n                            2001 / 日本 / 剧情 动画 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('8', '辛德勒的名单', '\n                            导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 连姆·尼森 Liam Neeson...', '\n                            1993 / 美国 / 剧情 历史 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('9', '盗梦空间', '\n                            导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 莱昂纳多·迪卡普里奥 Le...', '\n                            2010 / 美国 英国 / 剧情 科幻 悬疑 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('10', '忠犬八公的故事', '\n                            导演: 莱塞·霍尔斯道姆 Lasse Hallström   主演: 理查·基尔 Richard Ger...', '\n                            2009 / 美国 英国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('11', '机器人总动员', '\n                            导演: 安德鲁·斯坦顿 Andrew Stanton   主演: 本·贝尔特 Ben Burtt / 艾丽...', '\n                            2008 / 美国 / 爱情 科幻 动画 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('12', '三傻大闹宝莱坞', '\n                            导演: 拉库马·希拉尼 Rajkumar Hirani   主演: 阿米尔·汗 Aamir Khan / 卡...', '\n                            2009 / 印度 / 剧情 喜剧 爱情 歌舞\n                        ');
INSERT INTO `testmodel_test` VALUES ('13', '海上钢琴师', '\n                            导演: 朱塞佩·托纳多雷 Giuseppe Tornatore   主演: 蒂姆·罗斯 Tim Roth / ...', '\n                            1998 / 意大利 / 剧情 音乐\n                        ');
INSERT INTO `testmodel_test` VALUES ('14', '放牛班的春天', '\n                            导演: 克里斯托夫·巴拉蒂 Christophe Barratier   主演: 热拉尔·朱尼奥 Gé...', '\n                            2004 / 法国 瑞士 德国 / 剧情 音乐\n                        ');
INSERT INTO `testmodel_test` VALUES ('15', '楚门的世界', '\n                            导演: 彼得·威尔 Peter Weir   主演: 金·凯瑞 Jim Carrey / 劳拉·琳妮 Lau...', '\n                            1998 / 美国 / 剧情 科幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('16', '大话西游之大圣娶亲', '\n                            导演: 刘镇伟 Jeffrey Lau   主演: 周星驰 Stephen Chow / 吴孟达 Man Tat Ng...', '\n                            1995 / 香港 中国大陆 / 喜剧 爱情 奇幻 古装\n                        ');
INSERT INTO `testmodel_test` VALUES ('17', '星际穿越', '\n                            导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 马修·麦康纳 Matthew Mc...', '\n                            2014 / 美国 英国 加拿大 冰岛 / 剧情 科幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('18', '龙猫', '\n                            导演: 宫崎骏 Hayao Miyazaki   主演: 日高法子 Noriko Hidaka / 坂本千夏 Ch...', '\n                            1988 / 日本 / 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('19', '教父', '\n                            导演: 弗朗西斯·福特·科波拉 Francis Ford Coppola   主演: 马龙·白兰度 M...', '\n                            1972 / 美国 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('20', '熔炉', '\n                            导演: 黄东赫 Dong-hyuk Hwang   主演: 孔侑 Yoo Gong / 郑有美 Yu-mi Jeong ...', '\n                            2011 / 韩国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('21', '无间道', '\n                            导演: 刘伟强 / 麦兆辉   主演: 刘德华 / 梁朝伟 / 黄秋生', '\n                            2002 / 香港 / 剧情 犯罪 悬疑\n                        ');
INSERT INTO `testmodel_test` VALUES ('22', '疯狂动物城', '\n                            导演: 拜伦·霍华德 Byron Howard / 瑞奇·摩尔 Rich Moore   主演: 金妮弗·...', '\n                            2016 / 美国 / 喜剧 动画 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('23', '当幸福来敲门', '\n                            导演: 加布里尔·穆奇诺 Gabriele Muccino   主演: 威尔·史密斯 Will Smith ...', '\n                            2006 / 美国 / 剧情 传记 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('24', '怦然心动', '\n                            导演: 罗伯·莱纳 Rob Reiner   主演: 玛德琳·卡罗尔 Madeline Carroll / 卡...', '\n                            2010 / 美国 / 剧情 喜剧 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('25', '触不可及', '\n                            导演: 奥利维·那卡什 Olivier Nakache / 艾力克·托兰达 Eric Toledano   主...', '\n                            2011 / 法国 / 剧情 喜剧\n                        ');
INSERT INTO `testmodel_test` VALUES ('26', '蝙蝠侠：黑暗骑士', '\n                            导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 克里斯蒂安·贝尔 Christ...', '\n                            2008 / 美国 英国 / 剧情 动作 科幻 犯罪 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('27', '乱世佳人', '\n                            导演: 维克多·弗莱明 Victor Fleming / 乔治·库克 George Cukor   主演: 费...', '\n                            1939 / 美国 / 剧情 历史 爱情 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('28', '活着', '\n                            导演: 张艺谋 Yimou Zhang   主演: 葛优 You Ge / 巩俐 Li Gong / 姜武 Wu Jiang', '\n                            1994 / 中国大陆 香港 / 剧情 历史 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('29', '少年派的奇幻漂流', '\n                            导演: 李安 Ang Lee   主演: 苏拉·沙玛 Suraj Sharma / 伊尔凡·可汗 Irrfan...', '\n                            2012 / 美国 台湾 英国 加拿大 / 剧情 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('30', '控方证人', '\n                            导演: 比利·怀尔德 Billy Wilder   主演: 泰隆·鲍华 Tyrone Power / 玛琳·...', '\n                            1957 / 美国 / 剧情 犯罪 悬疑\n                        ');
INSERT INTO `testmodel_test` VALUES ('31', '天堂电影院', '\n                            导演: 朱塞佩·托纳多雷 Giuseppe Tornatore   主演: 安东内拉·阿蒂利 Anton...', '\n                            1988 / 意大利 法国 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('32', '鬼子来了', '\n                            导演: 姜文 Wen Jiang   主演: 姜文 Wen Jiang / 香川照之 Teruyuki Kagawa /...', '\n                            2000 / 中国大陆 / 剧情 历史 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('33', '指环王3：王者无敌', '\n                            导演: 彼得·杰克逊 Peter Jackson   主演: 维果·莫腾森 Viggo Mortensen / ...', '\n                            2003 / 美国 新西兰 / 剧情 动作 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('34', '十二怒汉', '\n                            导演: Sidney Lumet   主演: 亨利·方达 Henry Fonda / 马丁·鲍尔萨姆 Marti...', '\n                            1957 / 美国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('35', '天空之城', '\n                            导演: 宫崎骏 Hayao Miyazaki   主演: 田中真弓 Mayumi Tanaka / 横泽启子 Ke...', '\n                            1986 / 日本 / 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('36', '摔跤吧！爸爸', '\n                            导演: 涅提·蒂瓦里 Nitesh Tiwari   主演: 阿米尔·汗 Aamir Khan / 法缇玛...', '\n                            2016 / 印度 / 剧情 传记 运动 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('37', '飞屋环游记', '\n                            导演: 彼特·道格特 Pete Docter / 鲍勃·彼德森 Bob Peterson   主演: 爱德...', '\n                            2009 / 美国 / 剧情 喜剧 动画 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('38', '大话西游之月光宝盒', '\n                            导演: 刘镇伟 Jeffrey Lau   主演: 周星驰 Stephen Chow / 吴孟达 Man Tat Ng...', '\n                            1995 / 香港 中国大陆 / 喜剧 爱情 奇幻 古装\n                        ');
INSERT INTO `testmodel_test` VALUES ('39', '搏击俱乐部', '\n                            导演: 大卫·芬奇 David Fincher   主演: 爱德华·诺顿 Edward Norton / 布拉...', '\n                            1999 / 美国 德国 / 剧情 动作 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('40', '罗马假日', '\n                            导演: 威廉·惠勒 William Wyler   主演: 奥黛丽·赫本 Audrey Hepburn / 格...', '\n                            1953 / 美国 / 喜剧 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('41', '哈尔的移动城堡', '\n                            导演: 宫崎骏 Hayao Miyazaki   主演: 倍赏千惠子 Chieko Baishô / 木村拓...', '\n                            2004 / 日本 / 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('42', '闻香识女人', '\n                            导演: 马丁·布莱斯 Martin Brest   主演: 阿尔·帕西诺 Al Pacino / 克里斯...', '\n                            1992 / 美国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('43', '辩护人', '\n                            导演: 杨宇硕 Woo-seok Yang   主演: 宋康昊 Kang-ho Song / 吴达洙 Dal-su O...', '\n                            2013 / 韩国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('44', '窃听风暴', '\n                            导演: 弗洛里安·亨克尔·冯·多纳斯马尔克 Florian Henckel von Donnersmarck  &n...', '\n                            2006 / 德国 / 剧情 悬疑\n                        ');
INSERT INTO `testmodel_test` VALUES ('45', '末代皇帝', '\n                            导演: 贝纳尔多·贝托鲁奇 Bernardo Bertolucci   主演: 尊龙 John Lone / 陈...', '\n                            1987 / 英国 意大利 中国大陆 法国 美国 / 剧情 传记 历史\n                        ');
INSERT INTO `testmodel_test` VALUES ('46', '两杆大烟枪', '\n                            导演: Guy Ritchie   主演: Jason Flemyng / Dexter Fletcher / Nick Moran', '\n                            1998 / 英国 / 剧情 喜剧 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('47', '飞越疯人院', '\n                            导演: 米洛斯·福尔曼 Miloš Forman   主演: 杰克·尼科尔森 Jack Nichols...', '\n                            1975 / 美国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('48', '死亡诗社', '\n                            导演: 彼得·威尔 Peter Weir   主演: 罗宾·威廉姆斯 Robin Williams / 罗伯...', '\n                            1989 / 美国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('49', '素媛', '\n                            导演: 李濬益 Jun-ik Lee   主演: 薛景求 Kyung-gu Sol / 严志媛 Ji-won Uhm ...', '\n                            2013 / 韩国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('50', '寻梦环游记', '\n                            导演: 李·昂克里奇 Lee Unkrich / 阿德里安·莫利纳 Adrian Molina   主演: ...', '\n                            2017 / 美国 / 喜剧 动画 奇幻 音乐\n                        ');
INSERT INTO `testmodel_test` VALUES ('51', '指环王2：双塔奇兵', '\n                            导演: 彼得·杰克逊 Peter Jackson   主演: 伊利亚·伍德 Elijah Wood / 西恩...', '\n                            2002 / 美国 新西兰 / 剧情 动作 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('52', '教父2', '\n                            导演: 弗朗西斯·福特·科波拉 Francis Ford Coppola   主演: 阿尔·帕西诺 A...', '\n                            1974 / 美国 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('53', 'V字仇杀队', '\n                            导演: 詹姆斯·麦克特格 James McTeigue   主演: 娜塔莉·波特曼 Natalie Por...', '\n                            2005 / 美国 英国 德国 / 剧情 动作 科幻 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('54', '指环王1：魔戒再现', '\n                            导演: 彼得·杰克逊 Peter Jackson   主演: 伊利亚·伍德 Elijah Wood / 西恩...', '\n                            2001 / 新西兰 美国 / 剧情 动作 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('55', '海豚湾', '\n                            导演: 路易·西霍尤斯 Louie Psihoyos   主演: Richard O\'Barry / 路易·西霍...', '\n                            2009 / 美国 / 纪录片\n                        ');
INSERT INTO `testmodel_test` VALUES ('56', '饮食男女', '\n                            导演: 李安 Ang Lee   主演: 郎雄 Sihung Lung / 杨贵媚 Kuei-Mei Yang / 吴...', '\n                            1994 / 台湾 美国 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('57', '狮子王', '\n                            导演: Roger Allers / 罗伯·明可夫 Rob Minkoff   主演: 乔纳森·泰勒·托马...', '\n                            1994 / 美国 / 剧情 动画 冒险 歌舞 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('58', '美丽心灵', '\n                            导演: 朗·霍华德 Ron Howard   主演: 罗素·克劳 Russell Crowe / 艾德·哈...', '\n                            2001 / 美国 / 传记 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('59', '情书', '\n                            导演: 岩井俊二 Shunji Iwai   主演: 中山美穗 Miho Nakayama / 丰川悦司 Ets...', '\n                            1995 / 日本 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('60', '钢琴家', '\n                            导演: 罗曼·波兰斯基 Roman Polanski   主演: 艾德里安·布洛迪 Adrien Brod...', '\n                            2002 / 法国 德国 英国 波兰 / 剧情 传记 历史 战争 音乐\n                        ');
INSERT INTO `testmodel_test` VALUES ('61', '本杰明·巴顿奇事', '\n                            导演: 大卫·芬奇 David Fincher   主演: 凯特·布兰切特 Cate Blanchett / ...', '\n                            2008 / 美国 / 剧情 爱情 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('62', '美国往事', '\n                            导演: 赛尔乔·莱翁内 Sergio Leone   主演: 罗伯特·德尼罗 Robert De Niro ...', '\n                            1984 / 意大利 美国 / 犯罪 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('63', '看不见的客人', '\n                            导演: 奥里奥尔·保罗 Oriol Paulo   主演: 马里奥·卡萨斯 Mario Casas / 阿...', '\n                            2016 / 西班牙 / 剧情 犯罪 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('64', '黑客帝国', '\n                            导演: 安迪·沃卓斯基 Andy Wachowski / 拉娜·沃卓斯基 Lana Wachowski   主...', '\n                            1999 / 美国 澳大利亚 / 动作 科幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('65', '小鞋子', '\n                            导演: 马基德·马基迪 Majid Majidi   主演: 法拉赫阿米尔·哈什米安 Amir Fa...', '\n                            1997 / 伊朗 / 剧情 儿童 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('66', '西西里的美丽传说', '\n                            导演: 朱塞佩·托纳多雷 Giuseppe Tornatore   主演: 莫妮卡·贝鲁奇 Monica ...', '\n                            2000 / 意大利 美国 / 剧情 战争 情色\n                        ');
INSERT INTO `testmodel_test` VALUES ('67', '大闹天宫', '\n                            导演: 万籁鸣 Laiming Wan / 唐澄 Cheng  Tang   主演: 邱岳峰 Yuefeng Qiu /...', '\n                            1961(中国大陆) / 1964(中国大陆) / 1978(中国大陆) / 2004(中国大陆) / 中国大陆 / 动画 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('68', '哈利·波特与魔法石', '\n                            导演: Chris Columbus   主演: Daniel Radcliffe / Emma Watson / Rupert Grint', '\n                            2001 / 美国 英国 / 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('69', '让子弹飞', '\n                            导演: 姜文 Wen Jiang   主演: 姜文 Wen Jiang / 葛优 You Ge / 周润发 Yun-F...', '\n                            2010 / 中国大陆 香港 / 剧情 喜剧 动作 西部\n                        ');
INSERT INTO `testmodel_test` VALUES ('70', '拯救大兵瑞恩', '\n                            导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 汤姆·汉克斯 Tom Hanks...', '\n                            1998 / 美国 / 剧情 历史 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('71', '致命魔术', '\n                            导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 休·杰克曼 Hugh Jackman...', '\n                            2006 / 美国 英国 / 剧情 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('72', '七宗罪', '\n                            导演: 大卫·芬奇 David Fincher   主演: 摩根·弗里曼 Morgan Freeman / 布...', '\n                            1995 / 美国 / 剧情 犯罪 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('73', '被嫌弃的松子的一生', '\n                            导演: 中岛哲也 Tetsuya Nakashima   主演: 中谷美纪 Miki Nakatani / 瑛太 E...', '\n                            2006 / 日本 / 剧情 歌舞\n                        ');
INSERT INTO `testmodel_test` VALUES ('74', '音乐之声', '\n                            导演: 罗伯特·怀斯 Robert Wise   主演: 朱莉·安德鲁斯 Julie Andrews / 克...', '\n                            1965 / 美国 / 剧情 传记 爱情 歌舞\n                        ');
INSERT INTO `testmodel_test` VALUES ('75', '低俗小说', '\n                            导演: 昆汀·塔伦蒂诺 Quentin Tarantino   主演: 约翰·特拉沃尔塔 John Tra...', '\n                            1994 / 美国 / 剧情 喜剧 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('76', '沉默的羔羊', '\n                            导演: 乔纳森·戴米 Jonathan Demme   主演: 朱迪·福斯特 Jodie Foster / 安...', '\n                            1991 / 美国 / 剧情 犯罪 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('77', '天使爱美丽', '\n                            导演: 让-皮埃尔·热内 Jean-Pierre Jeunet   主演: 奥黛丽·塔图 Audrey Tau...', '\n                            2001 / 法国 德国 / 喜剧 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('78', '猫鼠游戏', '\n                            导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 莱昂纳多·迪卡普里奥 L...', '\n                            2002 / 美国 加拿大 / 传记 犯罪 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('79', '勇敢的心', '\n                            导演: 梅尔·吉布森 Mel Gibson   主演: 梅尔·吉布森 Mel Gibson / 苏菲·玛...', '\n                            1995 / 美国 / 动作 传记 剧情 历史 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('80', '蝴蝶效应', '\n                            导演: 埃里克·布雷斯 Eric Bress / J·麦基·格鲁伯 J. Mackye Gruber   主...', '\n                            2004 / 美国 加拿大 / 剧情 悬疑 科幻 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('81', '剪刀手爱德华', '\n                            导演: 蒂姆·波顿 Tim Burton   主演: 约翰尼·德普 Johnny Depp / 薇诺娜·...', '\n                            1990 / 美国 / 剧情 奇幻 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('82', '春光乍泄', '\n                            导演: 王家卫 Kar Wai Wong   主演: 张国荣 Leslie Cheung / 梁朝伟 Tony Leu...', '\n                            1997 / 香港 日本 韩国 / 剧情 爱情 同性\n                        ');
INSERT INTO `testmodel_test` VALUES ('83', '心灵捕手', '\n                            导演: 格斯·范·桑特 Gus Van Sant   主演: 马特·达蒙 Matt Damon / 罗宾·...', '\n                            1997 / 美国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('84', '禁闭岛', '\n                            导演: Martin Scorsese   主演: 莱昂纳多·迪卡普里奥 Leonardo DiCaprio / ...', '\n                            2010 / 美国 / 剧情 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('85', '布达佩斯大饭店', '\n                            导演: 韦斯·安德森 Wes Anderson   主演: 拉尔夫·费因斯 Ralph Fiennes / ...', '\n                            2014 / 美国 德国 英国 / 剧情 喜剧 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('86', '穿条纹睡衣的男孩', '\n                            导演: 马克·赫尔曼 Mark Herman   主演: 阿萨·巴特菲尔德 Asa Butterfield ...', '\n                            2008 / 英国 美国 / 剧情 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('87', '入殓师', '\n                            导演: 泷田洋二郎 Yôjirô Takita   主演: 本木雅弘 Masahiro Motoki / ...', '\n                            2008 / 日本 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('88', '阿凡达', '\n                            导演: 詹姆斯·卡梅隆 James Cameron   主演: 萨姆·沃辛顿 Sam Worthington ...', '\n                            2009 / 美国 英国 / 动作 战争 科幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('89', '幽灵公主', '\n                            导演: 宫崎骏 Hayao Miyazaki   主演: 松田洋治 Yôji Matsuda / 石田百合...', '\n                            1997 / 日本 / 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('90', '阳光灿烂的日子', '\n                            导演: 姜文 Wen Jiang   主演: 夏雨 Yu Xia / 宁静 Jing Ning / 陶虹 Hong Tao', '\n                            1994 / 中国大陆 香港 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('91', '致命ID', '\n                            导演: James Mangold   主演: John Cusack / Ray Liotta / Amanda Peet', '\n                            2003 / 美国 / 剧情 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('92', '第六感', '\n                            导演: M·奈特·沙马兰 M. Night Shyamalan   主演: 布鲁斯·威利斯 Bruce Wi...', '\n                            1999 / 美国 / 剧情 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('93', '加勒比海盗', '\n                            导演: 戈尔·维宾斯基 Gore Verbinski   主演: 约翰尼·德普 Johnny Depp / ...', '\n                            2003 / 美国 / 动作 冒险 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('94', '狩猎', '\n                            导演: 托马斯·温特伯格 Thomas Vinterberg   主演: 麦斯·米科尔森 Mads Mik...', '\n                            2012 / 丹麦 瑞典 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('95', '断背山', '\n                            导演: 李安 Ang Lee   主演: 希斯·莱杰 Heath Ledger / 杰克·吉伦哈尔 Jake...', '\n                            2005 / 美国 加拿大 / 剧情 爱情 同性 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('96', '玛丽和马克思', '\n                            导演: 亚当·艾略特 Adam Elliot   主演: 托妮·科莱特 Toni Collette / 菲利...', '\n                            2009 / 澳大利亚 / 剧情 喜剧 动画\n                        ');
INSERT INTO `testmodel_test` VALUES ('97', '重庆森林', '\n                            导演: 王家卫 Kar Wai Wong   主演: 林青霞 Brigitte Lin / 金城武 Takeshi K...', '\n                            1994 / 香港 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('98', '摩登时代', '\n                            导演: 查理·卓别林 Charles Chaplin   主演: 查理·卓别林 Charles Chaplin ...', '\n                            1936 / 美国 / 剧情 喜剧 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('99', '喜剧之王', '\n                            导演: 周星驰 Stephen Chow / 李力持 Lik-Chi Lee   主演: 周星驰 Stephen Ch...', '\n                            1999 / 香港 / 喜剧 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('100', '告白', '\n                            导演: 中岛哲也 Tetsuya Nakashima   主演: 松隆子 Takako Matsu / 冈田将生 ...', '\n                            2010 / 日本 / 剧情 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('101', '大鱼', '\n                            导演: 蒂姆·波顿 Tim Burton   主演: 伊万·麦克格雷格 Ewan McGregor / 阿...', '\n                            2003 / 美国 / 剧情 家庭 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('102', '消失的爱人', '\n                            导演: 大卫·芬奇 David Fincher   主演: 本·阿弗莱克 Ben Affleck / 罗莎蒙...', '\n                            2014 / 美国 / 剧情 犯罪 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('103', '一一', '\n                            导演: 杨德昌 Edward Yang   主演: 吴念真 / 李凯莉 Kelly Lee / 金燕玲 Elai...', '\n                            2000 / 台湾 日本 / 剧情 爱情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('104', '射雕英雄传之东成西就', '\n                            导演: 刘镇伟 Jeffrey Lau   主演: 梁朝伟 Tony Leung Chiu Wai / 林青霞 Bri...', '\n                            1993 / 香港 / 喜剧 奇幻 武侠 古装\n                        ');
INSERT INTO `testmodel_test` VALUES ('105', '阳光姐妹淘', '\n                            导演: 姜炯哲 Hyeong-Cheol Kang   主演: 沈恩京 Eun-kyung Shim / 闵孝琳 Hy...', '\n                            2011 / 韩国 / 剧情 喜剧\n                        ');
INSERT INTO `testmodel_test` VALUES ('106', '甜蜜蜜', '\n                            导演: 陈可辛 Peter Chan   主演: 黎明 Leon Lai / 张曼玉 Maggie Cheung / ...', '\n                            1996 / 香港 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('107', '爱在黎明破晓前', '\n                            导演: 理查德·林克莱特 Richard Linklater   主演: 伊桑·霍克 Ethan Hawke ...', '\n                            1995 / 美国 奥地利 瑞士 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('108', '小森林 夏秋篇', '\n                            导演: 森淳一 Junichi Mori   主演: 桥本爱 Ai Hashimoto / 三浦贵大 Takahir...', '\n                            2014 / 日本 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('109', '驯龙高手', '\n                            导演: 迪恩·德布洛斯 Dean DeBlois / 克里斯·桑德斯 Chris Sanders   主演:...', '\n                            2010 / 美国 / 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('110', '侧耳倾听', '\n                            导演: 近藤喜文 Yoshifumi Kondo   主演: 本名阳子 Youko Honna / 小林桂树 K...', '\n                            1995 / 日本 / 剧情 爱情 动画\n                        ');
INSERT INTO `testmodel_test` VALUES ('111', '请以你的名字呼唤我', '\n                            导演: 卢卡·瓜达尼诺 Luca Guadagnino   主演: 艾米·汉莫 Armie Hammer / ...', '\n                            2017 / 意大利 法国 巴西 美国 荷兰 德国 / 剧情 爱情 同性\n                        ');
INSERT INTO `testmodel_test` VALUES ('112', '红辣椒', '\n                            导演: 今敏 Satoshi Kon   主演: 林原惠美 Megumi Hayashibara / 江守彻 Toru...', '\n                            2006 / 日本 / 动画 悬疑 科幻 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('113', '倩女幽魂', '\n                            导演: 程小东 Siu-Tung Ching   主演: 张国荣 Leslie Cheung / 王祖贤 Joey W...', '\n                            1987 / 香港 / 爱情 奇幻 武侠 古装\n                        ');
INSERT INTO `testmodel_test` VALUES ('114', '恐怖直播', '\n                            导演: 金秉祐 Byeong-woo Kim   主演: 河正宇 Jung-woo Ha / 李璟荣 Kyeong-y...', '\n                            2013 / 韩国 / 剧情 犯罪 悬疑\n                        ');
INSERT INTO `testmodel_test` VALUES ('115', '风之谷', '\n                            导演: 宫崎骏 Hayao Miyazaki   主演: 岛本须美 Sumi Shimamoto / 松田洋治 Y...', '\n                            1984 / 日本 / 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('116', '超脱', '\n                            导演: 托尼·凯耶 Tony Kaye   主演: 艾德里安·布洛迪 Adrien Brody / 马西...', '\n                            2011 / 美国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('117', '上帝之城', '\n                            导演: Kátia Lund / Fernando Meirelles   主演: Alexandre Rodrigues / Lea...', '\n                            2002 / 巴西 法国 / 犯罪 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('118', '爱在日落黄昏时', '\n                            导演: 理查德·林克莱特 Richard Linklater   主演: 伊桑·霍克 Ethan Hawke ...', '\n                            2004 / 美国 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('119', '菊次郎的夏天', '\n                            导演: 北野武 Takeshi Kitano   主演: 北野武 Takeshi Kitano / 关口雄介 Yus...', '\n                            1999 / 日本 / 剧情 喜剧\n                        ');
INSERT INTO `testmodel_test` VALUES ('120', '幸福终点站', '\n                            导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 汤姆·汉克斯 Tom Hanks...', '\n                            2004 / 美国 / 喜剧 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('121', '哈利·波特与死亡圣器(下)', '\n                            导演: 大卫·叶茨 David Yates   主演: 丹尼尔·雷德克里夫 Daniel Radcliffe...', '\n                            2011 / 美国 英国 / 剧情 悬疑 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('122', '小森林 冬春篇', '\n                            导演: 森淳一 Junichi Mori   主演: 桥本爱 Ai Hashimoto / 三浦贵大 Takahir...', '\n                            2015 / 日本 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('123', '杀人回忆', '\n                            导演: 奉俊昊 Joon-ho Bong   主演: 宋康昊 Kang-ho Song / 金相庆 Sang-kyun...', '\n                            2003 / 韩国 / 犯罪 剧情 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('124', '7号房的礼物', '\n                            导演: 李焕庆 Hwan-kyeong Lee   主演: 柳承龙 Seung-yong Ryoo / 朴信惠 Shi...', '\n                            2013 / 韩国 / 剧情 喜剧 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('125', '神偷奶爸', '\n                            导演: 皮艾尔·柯芬 Pierre Coffin / 克里斯·雷纳德 Chris Renaud   主演: ...', '\n                            2010 / 美国 法国 / 喜剧 动画 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('126', '借东西的小人阿莉埃蒂', '\n                            导演: 米林宏昌 Hiromasa Yonebayashi   主演: 志田未来 Mirai Shida / 神木...', '\n                            2010 / 日本 / 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('127', '萤火之森', '\n                            导演: 大森贵弘 Takahiro Omori   主演: 佐仓绫音 Ayane Sakura / 内山昂辉 K...', '\n                            2011 / 日本 / 剧情 爱情 动画 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('128', '唐伯虎点秋香', '\n                            导演: 李力持 Lik-Chi Lee   主演: 周星驰 Stephen Chow / 巩俐 Li Gong / 陈...', '\n                            1993 / 香港 / 喜剧 爱情 古装\n                        ');
INSERT INTO `testmodel_test` VALUES ('129', '蝙蝠侠：黑暗骑士崛起', '\n                            导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 克里斯蒂安·贝尔 Christ...', '\n                            2012 / 美国 英国 / 剧情 动作 科幻 犯罪 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('130', '超能陆战队', '\n                            导演: 唐·霍尔 Don Hall / 克里斯·威廉姆斯 Chris Williams   主演: 斯科特...', '\n                            2014 / 美国 / 喜剧 动作 科幻 动画 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('131', '怪兽电力公司', '\n                            导演: 彼特·道格特 Pete Docter / 大卫·斯沃曼 David Silverman   主演: 约...', '\n                            2001 / 美国 / 儿童 喜剧 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('132', '岁月神偷', '\n                            导演: 罗启锐 Alex Law   主演: 吴君如 Sandra Ng / 任达华 Simon Yam / 钟绍...', '\n                            2010 / 香港 中国大陆 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('133', '电锯惊魂', '\n                            导演: 詹姆斯·温 James Wan   主演: 雷·沃纳尔 Leigh Whannell / 加利·艾...', '\n                            2004 / 美国 / 悬疑 惊悚 恐怖\n                        ');
INSERT INTO `testmodel_test` VALUES ('134', '七武士', '\n                            导演: 黑泽明 Akira Kurosawa   主演: 三船敏郎 Toshirô Mifune / 志村乔 ...', '\n                            1954 / 日本 / 动作 冒险 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('135', '谍影重重3', '\n                            导演: 保罗·格林格拉斯 Paul Greengrass   主演: 马特·达蒙 Matt Damon / ...', '\n                            2007 / 美国 德国 / 动作 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('136', '真爱至上', '\n                            导演: 理查德·柯蒂斯 Richard Curtis   主演: 休·格兰特 Hugh Grant / 柯林...', '\n                            2003 / 英国 美国 法国 / 喜剧 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('137', '无人知晓', '\n                            导演: 是枝裕和 Hirokazu Koreeda   主演: 柳乐优弥 Yûya Yagira / 北浦爱...', '\n                            2004 / 日本 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('138', '疯狂原始人', '\n                            导演: 科克·德·米科 Kirk De Micco / 克里斯·桑德斯 Chris Sanders   主演...', '\n                            2013 / 美国 / 喜剧 动画 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('139', '喜宴', '\n                            导演: 李安 Ang Lee   主演: 赵文瑄 Winston Chao / 郎雄 Sihung Lung / 归亚...', '\n                            1993 / 台湾 美国 / 剧情 喜剧 爱情 同性 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('140', '英雄本色', '\n                            导演: 吴宇森 John Woo   主演: 周润发 Yun-Fat Chow / 狄龙 Lung Ti / 张国...', '\n                            1986 / 香港 / 剧情 动作 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('141', '萤火虫之墓', '\n                            导演: 高畑勋 Isao Takahata   主演: 辰己努 / 白石绫乃 / 志乃原良子', '\n                            1988 / 日本 / 动画 剧情 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('142', '东邪西毒', '\n                            导演: 王家卫 Kar Wai Wong   主演: 张国荣 Leslie Cheung / 林青霞 Brigitte...', '\n                            1994 / 香港 台湾 / 剧情 动作 爱情 武侠 古装\n                        ');
INSERT INTO `testmodel_test` VALUES ('143', '贫民窟的百万富翁', '\n                            导演: 丹尼·鲍尔 Danny Boyle / 洛芙琳·坦丹 Loveleen Tandan   主演: 戴夫...', '\n                            2008 / 英国 美国 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('144', '黑天鹅', '\n                            导演: 达伦·阿罗诺夫斯基 Darren Aronofsky   主演: 娜塔莉·波特曼 Natalie...', '\n                            2010 / 美国 / 剧情 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('145', '记忆碎片', '\n                            导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 盖·皮尔斯 Guy Pearce /...', '\n                            2000 / 美国 / 犯罪 剧情 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('146', '血战钢锯岭', '\n                            导演: 梅尔·吉布森 Mel Gibson   主演: 安德鲁·加菲尔德 Andrew Garfield /...', '\n                            2016 / 美国 澳大利亚 / 剧情 传记 历史 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('147', '傲慢与偏见', '\n                            导演: 乔·怀特 Joe Wright   主演: 凯拉·奈特莉 Keira Knightley / 马修·...', '\n                            2005 / 法国 英国 美国 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('148', '心迷宫', '\n                            导演: 忻钰坤 Yukun Xin   主演: 霍卫民 Weimin Huo / 王笑天 Xiaotian Wang ...', '\n                            2014 / 中国大陆 / 剧情 犯罪 悬疑\n                        ');
INSERT INTO `testmodel_test` VALUES ('149', '时空恋旅人', '\n                            导演: 理查德·柯蒂斯 Richard Curtis   主演: 多姆纳尔·格里森 Domhnall Gl...', '\n                            2013 / 英国 / 喜剧 爱情 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('150', '荒蛮故事', '\n                            导演: 达米安·斯兹弗隆 Damián Szifron   主演: 达里奥·葛兰帝内提 Darío...', '\n                            2014 / 阿根廷 西班牙 / 剧情 喜剧 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('151', '纵横四海', '\n                            导演: 吴宇森 John Woo   主演: 周润发 Yun-Fat Chow / 张国荣 Leslie Cheung...', '\n                            1991 / 香港 / 剧情 喜剧 动作 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('152', '雨人', '\n                            导演: 巴瑞·莱文森 Barry Levinson   主演: 达斯汀·霍夫曼 Dustin Hoffman ...', '\n                            1988 / 美国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('153', '教父3', '\n                            导演: 弗朗西斯·福特·科波拉 Francis Ford Coppola   主演: 阿尔·帕西诺 A...', '\n                            1990 / 美国 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('154', '达拉斯买家俱乐部', '\n                            导演: 让-马克·瓦雷 Jean-Marc Vallée   主演: 马修·麦康纳 Matthew McCon...', '\n                            2013 / 美国 / 剧情 传记 同性\n                        ');
INSERT INTO `testmodel_test` VALUES ('155', '玩具总动员3', '\n                            导演: 李·昂克里奇 Lee Unkrich   主演: 汤姆·汉克斯 Tom Hanks / 蒂姆·艾...', '\n                            2010 / 美国 / 喜剧 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('156', '完美的世界', '\n                            导演: 克林特·伊斯特伍德 Clint Eastwood   主演: 凯文·科斯特纳 Kevin Cos...', '\n                            1993 / 美国 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('157', '卢旺达饭店', '\n                            导演: 特瑞·乔治 Terry George   主演: 唐·钱德尔 Don Cheadle / 苏菲·奥...', '\n                            2004 / 英国 南非 意大利 美国 / 剧情 历史 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('158', '花样年华', '\n                            导演: 王家卫 Kar Wai Wong   主演: 梁朝伟 Tony Leung Chiu Wai / 张曼玉 Ma...', '\n                            2000 / 香港 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('159', '海边的曼彻斯特', '\n                            导演: 肯尼斯·罗纳根 Kenneth Lonergan   主演: 卡西·阿弗莱克 Casey Affle...', '\n                            2016 / 美国 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('160', '海洋', '\n                            导演: 雅克·贝汉 Jacques Perrin / 雅克·克鲁奥德 Jacques Cluzaud   主演:...', '\n                            2009 / 法国 瑞士 西班牙 美国 阿联酋 / 纪录片\n                        ');
INSERT INTO `testmodel_test` VALUES ('161', '恋恋笔记本', '\n                            导演: 尼克·卡索维茨 Nick Cassavetes   主演: 瑞恩·高斯林 Ryan Gosling /...', '\n                            2004 / 美国 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('162', '虎口脱险', '\n                            导演: 杰拉尔·乌里 Gérard Oury   主演: 路易·德·菲耐斯 Louis de Funès...', '\n                            1966 / 法国 英国 / 喜剧 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('163', '你看起来好像很好吃', '\n                            导演: 藤森雅也 Masaya Fujimori   主演: 山口胜平 Kappei Yamaguchi / 爱河...', '\n                            2010 / 日本 / 剧情 动画 儿童\n                        ');
INSERT INTO `testmodel_test` VALUES ('164', '被解救的姜戈', '\n                            导演: 昆汀·塔伦蒂诺 Quentin Tarantino   主演: 杰米·福克斯 Jamie Foxx /...', '\n                            2012 / 美国 / 剧情 动作 西部 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('165', '二十二', '\n                            导演: 郭柯 Ke Guo   主演: ', '\n                            2015 / 中国大陆 / 纪录片\n                        ');
INSERT INTO `testmodel_test` VALUES ('166', '头脑特工队', '\n                            导演: 彼特·道格特 Pete Docter / 罗纳尔多·德尔·卡门 Ronaldo Del Carmen  &nb...', '\n                            2015 / 美国 / 喜剧 动画 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('167', '三块广告牌', '\n                            导演: 马丁·麦克唐纳 Martin McDonagh   主演: 弗兰西斯·麦克多蒙德 France...', '\n                            2017 / 美国 英国 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('168', '无敌破坏王', '\n                            导演: 瑞奇·莫尔 Rich Moore   主演: 约翰·C·赖利 John C. Reilly / 萨拉...', '\n                            2012 / 美国 / 喜剧 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('169', '雨中曲', '\n                            导演: 斯坦利·多南 Stanley Donen / 吉恩·凯利 Gene Kelly   主演: 吉恩·...', '\n                            1952 / 美国 / 喜剧 歌舞 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('170', '冰川时代', '\n                            导演: 卡洛斯·沙尔丹哈 Carlos Saldanha / 克里斯·韦奇 Chris Wedge   主演...', '\n                            2002 / 美国 / 喜剧 动画 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('171', '你的名字。', '\n                            导演: 新海诚 Makoto Shinkai   主演: 神木隆之介 Ryûnosuke Kamiki / 上...', '\n                            2016 / 日本 / 剧情 爱情 动画\n                        ');
INSERT INTO `testmodel_test` VALUES ('172', '燃情岁月', '\n                            导演: 爱德华·兹威克 Edward Zwick   主演: 布拉德·皮特 Brad Pitt / 安东...', '\n                            1994 / 美国 / 剧情 爱情 战争 西部\n                        ');
INSERT INTO `testmodel_test` VALUES ('173', '我是山姆', '\n                            导演: 杰茜·尼尔森 Jessie Nelson   主演: Sean Penn / Dakota Fanning / Mi...', '\n                            2001 / 美国 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('174', '爆裂鼓手', '\n                            导演: 达米恩·查泽雷 Damien Chazelle   主演: 迈尔斯·特勒 Miles Teller /...', '\n                            2014 / 美国 / 剧情 音乐\n                        ');
INSERT INTO `testmodel_test` VALUES ('175', '人工智能', '\n                            导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 海利·乔·奥斯蒙 Haley...', '\n                            2001 / 美国 / 冒险 剧情 科幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('176', '未麻的部屋', '\n                            导演: 今敏 Satoshi Kon   主演: 岩男润子 Junko Iwao / 松本梨香 Rica Matsu...', '\n                            1997 / 日本 / 动画 奇幻 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('177', '穿越时空的少女', '\n                            导演: 细田守 Mamoru Hosoda   主演: 仲里依纱 Riisa Naka / 石田卓也 Takuya...', '\n                            2006 / 日本 / 剧情 爱情 科幻 动画\n                        ');
INSERT INTO `testmodel_test` VALUES ('178', '魂断蓝桥', '\n                            导演: 茂文·勒鲁瓦 Mervyn LeRoy   主演: 费雯·丽 Vivien Leigh / 罗伯特·...', '\n                            1940 / 美国 / 剧情 爱情 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('179', '一个叫欧维的男人决定去死', '\n                            导演: 汉内斯·赫尔姆 Hannes Holm   主演: 罗夫·拉斯加德 Rolf Lassgård...', '\n                            2015 / 瑞典 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('180', '模仿游戏', '\n                            导演: 莫滕·泰杜姆 Morten Tyldum   主演: 本尼迪克特·康伯巴奇 Benedict C...', '\n                            2014 / 英国 美国 / 剧情 传记 战争 同性\n                        ');
INSERT INTO `testmodel_test` VALUES ('181', '猜火车', '\n                            导演: 丹尼·博伊尔 Danny Boyle   主演: 伊万·麦克格雷格 Ewan McGregor / ...', '\n                            1996 / 英国 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('182', '房间', '\n                            导演: 伦尼·阿伯拉罕森 Lenny Abrahamson   主演: 布丽·拉尔森 Brie Larson...', '\n                            2015 / 爱尔兰 加拿大 英国 美国 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('183', '忠犬八公物语', '\n                            导演: Seijirô Kôyama   主演: 山本圭 Kei Yamamoto / 井川比佐志 Hisa...', '\n                            1987 / 日本 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('184', '恐怖游轮', '\n                            导演: 克里斯托弗·史密斯 Christopher Smith   主演: 梅利莎·乔治 Melissa ...', '\n                            2009 / 英国 澳大利亚 / 剧情 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('185', '罗生门', '\n                            导演: 黑泽明 Akira Kurosawa   主演: 三船敏郎 Toshirô Mifune / 千秋实 ...', '\n                            1950 / 日本 / 犯罪 剧情 悬疑\n                        ');
INSERT INTO `testmodel_test` VALUES ('186', '完美陌生人', '\n                            导演: 保罗·格诺维瑟 Paolo Genovese   主演: 马可·贾利尼 Marco Giallini ...', '\n                            2016 / 意大利 / 剧情 喜剧\n                        ');
INSERT INTO `testmodel_test` VALUES ('187', '魔女宅急便', '\n                            导演: 宫崎骏 Hayao Miyazaki   主演: 高山南 Minami Takayama / 佐久间玲 Re...', '\n                            1989 / 日本 / 动画 奇幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('188', '阿飞正传', '\n                            导演: 王家卫 Kar Wai Wong   主演: 张国荣 Leslie Cheung / 张曼玉 Maggie C...', '\n                            1990 / 香港 / 犯罪 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('189', '香水', '\n                            导演: 汤姆·提克威 Tom Tykwer   主演: 本·卫肖 Ben Whishaw / 艾伦·瑞克...', '\n                            2006 / 德国 法国 西班牙 美国 / 剧情 犯罪 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('190', '哪吒闹海', '\n                            导演: 严定宪 Dingxian Yan / 王树忱 Shuchen Wang   主演: 梁正晖 Zhenghui ...', '\n                            1979 / 中国大陆 / 冒险 动画 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('191', '浪潮', '\n                            导演: 丹尼斯·甘塞尔 Dennis Gansel   主演: 尤尔根·沃格尔 Jürgen Vogel ...', '\n                            2008 / 德国 / 剧情 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('192', '黑客帝国3：矩阵革命', '\n                            导演: Andy Wachowski / Larry Wachowski   主演: 基努·里维斯 Keanu Reeves...', '\n                            2003 / 美国 澳大利亚 / 动作 科幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('193', '海街日记', '\n                            导演: 是枝裕和 Hirokazu Koreeda   主演: 绫濑遥 Haruka Ayase / 长泽雅美 M...', '\n                            2015 / 日本 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('194', '朗读者', '\n                            导演: 史蒂芬·戴德利 Stephen Daldry   主演: 凯特·温丝莱特 Kate Winslet ...', '\n                            2008 / 美国 德国 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('195', '可可西里', '\n                            导演: 陆川 Chuan Lu   主演: 多布杰 Duobujie / 张磊 Lei Zhang / 亓亮 Qi L...', '\n                            2004 / 中国大陆 香港 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('196', '谍影重重2', '\n                            导演: 保罗·格林格拉斯 Paul Greengrass   主演: 马特·达蒙 Matt Damon / ...', '\n                            2004 / 美国 德国 / 动作 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('197', '谍影重重', '\n                            导演: 道格·里曼 Doug Liman   主演: 马特·达蒙 Matt Damon / 弗兰卡·波坦...', '\n                            2002 / 美国 德国 捷克 / 动作 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('198', '战争之王', '\n                            导演: 安德鲁·尼科尔 Andrew Niccol   主演: 尼古拉斯·凯奇 Nicolas Cage /...', '\n                            2005 / 美国 法国 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('199', '牯岭街少年杀人事件', '\n                            导演: 杨德昌 Edward Yang   主演: 张震 Chen Chang / 杨静怡 Lisa Yang / 张...', '\n                            1991 / 台湾 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('200', '地球上的星星', '\n                            导演: 阿米尔·汗 Aamir Khan   主演: 达席尔·萨法瑞 Darsheel Safary / 阿...', '\n                            2007 / 印度 / 剧情 儿童 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('201', '惊魂记', '\n                            导演: Alfred Hitchcock   主演: Janet Leigh / Anthony Perkins / Vera Miles', '\n                            1960 / 美国 / 悬疑 惊悚 恐怖\n                        ');
INSERT INTO `testmodel_test` VALUES ('202', '青蛇', '\n                            导演: 徐克 Hark Tsui   主演: 张曼玉 Maggie Cheung / 王祖贤 Joey Wang / ...', '\n                            1993 / 香港 / 剧情 爱情 奇幻 古装\n                        ');
INSERT INTO `testmodel_test` VALUES ('203', '疯狂的石头', '\n                            导演: 宁浩 Hao Ning   主演: 郭涛 Tao Guo / 刘桦 Hua Liu / 连晋 Teddy Lin', '\n                            2006 / 中国大陆 香港 / 喜剧 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('204', '一次别离', '\n                            导演: 阿斯哈·法哈蒂  Asghar Farhadi   主演: 佩曼·莫阿迪 Peyman Moadi /...', '\n                            2011 / 伊朗 法国 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('205', '追随', '\n                            导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 杰里米·西奥伯德 Jeremy...', '\n                            1998 / 英国 / 犯罪 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('206', '天书奇谭', '\n                            导演: 王树忱 Shuchen Wang / 钱运达 Yunda Qian   主演: 丁建华 Jianhua Din...', '\n                            1983(中国大陆) / 2019(中国大陆重映) / 中国大陆 / 动画 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('207', '终结者2：审判日', '\n                            导演: 詹姆斯·卡梅隆 James Cameron   主演: 阿诺·施瓦辛格 Arnold Schwarz...', '\n                            1991 / 美国 法国 / 动作 科幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('208', '源代码', '\n                            导演: 邓肯·琼斯 Duncan Jones   主演: 杰克·吉伦哈尔 Jake Gyllenhaal / ...', '\n                            2011 / 美国 加拿大 / 科幻 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('209', '初恋这件小事', '\n                            导演: 普特鹏·普罗萨卡·那·萨克那卡林 Puttipong Promsaka Na Sakolnakorn / 华森·波克彭...', '\n                            2010 / 泰国 / 剧情 喜剧 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('210', '步履不停', '\n                            导演: 是枝裕和 Hirokazu Koreeda   主演: 阿部宽 Hiroshi Abe / 夏川结衣 Yu...', '\n                            2008 / 日本 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('211', '小萝莉的猴神大叔', '\n                            导演: 卡比尔·汗 Kabir Khan   主演: 萨尔曼·汗 Salman Khan / 哈莎莉·马...', '\n                            2015 / 印度 / 剧情 喜剧 动作\n                        ');
INSERT INTO `testmodel_test` VALUES ('212', '新龙门客栈', '\n                            导演: 李惠民 Raymond Lee   主演: 张曼玉 Maggie Cheung / 林青霞 Brigitte ...', '\n                            1992 / 香港 中国大陆 / 动作 爱情 武侠 古装\n                        ');
INSERT INTO `testmodel_test` VALUES ('213', '再次出发之纽约遇见你', '\n                            导演: 约翰·卡尼 John Carney   主演: 凯拉·奈特莉 Keira Knightley / 马克...', '\n                            2013 / 美国 / 喜剧 爱情 音乐\n                        ');
INSERT INTO `testmodel_test` VALUES ('214', '撞车', '\n                            导演: 保罗·哈吉斯 Paul Haggis   主演: 桑德拉·布洛克 Sandra Bullock / ...', '\n                            2004 / 美国 德国 / 犯罪 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('215', '爱在午夜降临前', '\n                            导演: 理查德·林克莱特 Richard Linklater   主演: 伊桑·霍克 Ethan Hawke ...', '\n                            2013 / 美国 希腊 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('216', '梦之安魂曲', '\n                            导演: 达伦·阿伦诺夫斯基 Darren Aronofsky   主演: 艾伦·伯斯汀 Ellen Bur...', '\n                            2000 / 美国 / 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('217', '海蒂和爷爷', '\n                            导演: 阿兰·葛斯彭纳 Alain Gsponer   主演: 阿努克·斯特芬 Anuk Steffen /...', '\n                            2015 / 德国 瑞士 南非 / 剧情 冒险 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('218', '无耻混蛋', '\n                            导演: Quentin Tarantino   主演: 布拉德·皮特 Brad Pitt / 梅拉尼·罗兰 M...', '\n                            2009 / 美国 德国 / 剧情 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('219', '东京物语', '\n                            导演: 小津安二郎 Yasujirô Ozu   主演: 笠智众 Chishû Ryû / 原节...', '\n                            1953 / 日本 / 剧情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('220', '城市之光', '\n                            导演: Charles Chaplin   主演: 查理·卓别林 Charles Chaplin / 弗吉尼亚·...', '\n                            1931 / 美国 / 喜剧 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('221', '绿里奇迹', '\n                            导演: Frank Darabont   主演: 汤姆·汉克斯 Tom Hanks / 大卫·摩斯 David M...', '\n                            1999 / 美国 / 犯罪 剧情 奇幻 悬疑\n                        ');
INSERT INTO `testmodel_test` VALUES ('222', '彗星来的那一夜', '\n                            导演: 詹姆斯·沃德·布柯特 James Ward Byrkit   主演: 艾米丽·芭尔多尼 Em...', '\n                            2013 / 美国 英国 / 科幻 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('223', '血钻', '\n                            导演: 爱德华·兹威克 Edward Zwick   主演: 莱昂纳多·迪卡普里奥 Leonardo ...', '\n                            2006 / 美国 德国 / 剧情 惊悚 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('224', '2001太空漫游', '\n                            导演: 斯坦利·库布里克 Stanley Kubrick   主演: 凯尔·杜拉 Keir Dullea / ...', '\n                            1968 / 英国 美国 / 科幻 惊悚 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('225', '这个男人来自地球', '\n                            导演: 理查德·沙因克曼 Richard Schenkman   主演: 大卫·李·史密斯 David ...', '\n                            2007 / 美国 / 剧情 科幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('226', 'E.T. 外星人', '\n                            导演: Steven Spielberg   主演: Henry Thomas / Dee Wallace / Robert MacNa...', '\n                            1982 / 美国 / 剧情 科幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('227', '末路狂花', '\n                            导演: 雷德利·斯科特 Ridley Scott   主演: 吉娜·戴维斯 Geena Davis / 苏...', '\n                            1991 / 美国 法国 / 犯罪 剧情 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('228', '聚焦', '\n                            导演: 托马斯·麦卡锡 Thomas McCarthy   主演: 马克·鲁弗洛 Mark Ruffalo /...', '\n                            2015 / 美国 / 剧情 传记\n                        ');
INSERT INTO `testmodel_test` VALUES ('229', '功夫', '\n                            导演: 周星驰 Stephen Chow   主演: 周星驰 Stephen Chow / 元秋 Qiu Yuen / ...', '\n                            2004 / 中国大陆 香港 / 动作 喜剧 犯罪 奇幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('230', '勇闯夺命岛', '\n                            导演: 迈克尔·贝 Michael Bay   主演: 肖恩·康纳利 Sean Connery / 尼古拉...', '\n                            1996 / 美国 / 动作 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('231', '变脸', '\n                            导演: 吴宇森 John Woo   主演: 约翰·特拉沃尔塔 John Travolta / 尼古拉斯...', '\n                            1997 / 美国 / 动作 科幻 犯罪 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('232', '发条橙', '\n                            导演: Stanley Kubrick   主演: Malcolm McDowell / Patrick Magee / Michael...', '\n                            1971 / 英国 美国 / 犯罪 剧情 科幻\n                        ');
INSERT INTO `testmodel_test` VALUES ('233', '黄金三镖客', '\n                            导演: Sergio Leone   主演: Clint Eastwood / Eli Wallach / Lee Van Cleef', '\n                            1966 / 意大利 西班牙 西德 / 冒险 西部\n                        ');
INSERT INTO `testmodel_test` VALUES ('234', '黑鹰坠落', '\n                            导演: 雷德利·斯科特 Ridley Scott   主演: 乔什·哈奈特 Josh Hartnett / ...', '\n                            2001 / 美国 / 动作 历史 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('235', '秒速5厘米', '\n                            导演: 新海诚 Makoto Shinkai   主演: 水桥研二 Kenji Mizuhashi / 近藤好美 ...', '\n                            2007 / 日本 / 动画 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('236', '非常嫌疑犯', '\n                            导演: 布莱恩·辛格 Bryan Singer   主演: 史蒂芬·鲍德温 Stephen Baldwin /...', '\n                            1995 / 德国 美国 / 剧情 犯罪 悬疑 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('237', '我爱你', '\n                            导演: 秋昌民 Chang-min Choo   主演: 宋在河 Jae-ho Song / 李顺载 Soon-jae...', '\n                            2011 / 韩国 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('238', '卡萨布兰卡', '\n                            导演: 迈克尔·柯蒂兹 Michael Curtiz   主演: 亨弗莱·鲍嘉 Humphrey Bogart...', '\n                            1942 / 美国 / 剧情 爱情 战争\n                        ');
INSERT INTO `testmodel_test` VALUES ('239', '国王的演讲', '\n                            导演: 汤姆·霍珀 Tom Hooper   主演: 柯林·菲尔斯 Colin Firth / 杰弗里·...', '\n                            2010 / 英国 澳大利亚 美国 / 剧情 传记 历史\n                        ');
INSERT INTO `testmodel_test` VALUES ('240', '千钧一发', '\n                            导演: 安德鲁·尼科尔 Andrew Niccol   主演: 伊桑·霍克 Ethan Hawke / 乌玛...', '\n                            1997 / 美国 / 剧情 科幻 惊悚\n                        ');
INSERT INTO `testmodel_test` VALUES ('241', '奇迹男孩', '\n                            导演: 斯蒂芬·卓博斯基 Stephen Chbosky   主演: 雅各布·特伦布莱 Jacob Tr...', '\n                            2017 / 美国 香港 / 剧情 儿童 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('242', '疯狂的麦克斯4：狂暴之路', '\n                            导演: 乔治·米勒 George Miller   主演: 汤姆·哈迪 Tom Hardy / 查理兹·塞...', '\n                            2015 / 澳大利亚 美国 / 动作 科幻 冒险\n                        ');
INSERT INTO `testmodel_test` VALUES ('243', '遗愿清单', '\n                            导演: 罗伯·莱纳 Rob Reiner   主演: 杰克·尼科尔森 Jack Nicholson / 摩根...', '\n                            2007 / 美国 / 冒险 喜剧 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('244', '美国丽人', '\n                            导演: 萨姆·门德斯 Sam Mendes   主演: 凯文·史派西 Kevin Spacey / 安妮特...', '\n                            1999 / 美国 / 剧情 爱情 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('245', '驴得水', '\n                            导演: 周申 Shen Zhou / 刘露 Lu Liu   主演: 任素汐 Suxi Ren / 大力 Da Li ...', '\n                            2016 / 中国大陆 / 剧情 喜剧\n                        ');
INSERT INTO `testmodel_test` VALUES ('246', '荒岛余生', '\n                            导演: 罗伯特·泽米吉斯 Robert Zemeckis   主演: 汤姆·汉克斯 Tom Hanks / ...', '\n                            2000 / 美国 / 冒险 剧情\n                        ');
INSERT INTO `testmodel_test` VALUES ('247', '碧海蓝天', '\n                            导演: Luc Besson   主演: 让-马克·巴尔 Jean-Marc Barr / 让·雷诺 Jean Re...', '\n                            1988 / 法国 美国 意大利 / 剧情 爱情\n                        ');
INSERT INTO `testmodel_test` VALUES ('248', '枪火', '\n                            导演: 杜琪峰 Johnnie To   主演: 吴镇宇 Francis Ng / 任达华 Simon Yam / ...', '\n                            1999 / 香港 / 剧情 动作 犯罪\n                        ');
INSERT INTO `testmodel_test` VALUES ('249', '四个春天', '\n                            导演: 陆庆屹 Lu Qing Yi   主演: 陆运坤 / 李桂贤', '\n                            2017 / 中国大陆 / 纪录片 家庭\n                        ');
INSERT INTO `testmodel_test` VALUES ('250', '新世界', '\n                            导演: 朴勋政 Hoon-jung Park   主演: 李政宰 Jung-Jae Lee / 崔岷植 Min-sik...', '\n                            2013 / 韩国 / 剧情 犯罪\n                        ');

-- ----------------------------
-- Table structure for testmodel_test2
-- ----------------------------
DROP TABLE IF EXISTS `testmodel_test2`;
CREATE TABLE `testmodel_test2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of testmodel_test2
-- ----------------------------
INSERT INTO `testmodel_test2` VALUES ('1', 'Apple iPhone XR (A2108) 128GB 黑色 移动联通电信4G手机 双卡双待', '5699.00');
INSERT INTO `testmodel_test2` VALUES ('2', '【KPL官方比赛用机】vivo iQOO 44W超快闪充 8GB+128GB电光蓝 全面屏拍照手机 骁龙855电竞游戏 全网通4G', '3298.00');
INSERT INTO `testmodel_test2` VALUES ('3', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+64GB亮黑色全网通双4G双', '3988.00');
INSERT INTO `testmodel_test2` VALUES ('4', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄 4GB+64GB 幻夜黑 移动联通电信4G全面屏 双卡双待', '1299.00');
INSERT INTO `testmodel_test2` VALUES ('5', '小米 红米Redmi Note7 幻彩渐变AI双摄 4GB+64GB 梦幻蓝 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '1199.00');
INSERT INTO `testmodel_test2` VALUES ('6', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB 渐变蓝 移动联通电信4G全面屏 双卡双待', '1299.00');
INSERT INTO `testmodel_test2` VALUES ('7', 'vivo U1 水滴全面屏 AI智慧拍照手机 3GB+32GB 极光色 移动联通电信全网通4G', '799.00');
INSERT INTO `testmodel_test2` VALUES ('8', '小米 红米6 4GB+64GB 铂银灰 全网通4G手机 双卡双待', '799.00');
INSERT INTO `testmodel_test2` VALUES ('9', '荣耀V20 胡歌同款 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻夜黑 移动联通电信4G全面屏', '2799.00');
INSERT INTO `testmodel_test2` VALUES ('10', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB 幻夜黑 移动联通电信4G全面屏 双卡双待', '899.00');
INSERT INTO `testmodel_test2` VALUES ('11', '小米8SE 全面屏智能游戏拍照手机 6GB+64GB 灰色 骁龙710处理器 全网通4G 双卡双待', '1399.00');
INSERT INTO `testmodel_test2` VALUES ('12', '小米9 4800万超广角三摄 8GB+128GB全息幻彩蓝 骁龙855 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '3299.00');
INSERT INTO `testmodel_test2` VALUES ('13', 'vivo Z3 6GB+64GB 极光蓝 性能实力派 全面屏游戏手机 移动联通电信全网通4G手机', '1548.00');
INSERT INTO `testmodel_test2` VALUES ('14', '小米8青春版 镜面渐变AI双摄 6GB+64GB 梦幻蓝 骁龙 全网通4G 双卡双待 全面屏拍照游戏智能', '1499.00');
INSERT INTO `testmodel_test2` VALUES ('15', 'vivo X27 8GB+256GB大内存 雀羽蓝 4800万AI三摄全面屏拍照手机 移动联通电信全网通4G', '3598.00');
INSERT INTO `testmodel_test2` VALUES ('16', '小米 红米6A AI美颜 3GB+32GB 流沙金 全网通4G手机 双卡双待', '649.00');
INSERT INTO `testmodel_test2` VALUES ('17', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机', '6199.00');
INSERT INTO `testmodel_test2` VALUES ('18', '小米 红米Redmi 7 幻彩渐变AI双摄 3GB+32GB 梦幻蓝 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '799.00');
INSERT INTO `testmodel_test2` VALUES ('19', 'vivo S1 6GB+128GB 冰湖蓝 2480万AI高清自拍 超广角后置三摄拍照手机 移动联通电信全网通4G', '2298.00');
INSERT INTO `testmodel_test2` VALUES ('20', '黑鲨游戏手机2 8GB+128GB 暗影黑 骁龙855 Magic Press立体操控 塔式全域液冷 全面屏 全网通4G 双卡双待', '3499.00');
INSERT INTO `testmodel_test2` VALUES ('21', '诺基亚 NOKIA X6 6GB+64GB 星空黑 全网通 双卡双待 移动联通电信4G手机', '1039.00');
INSERT INTO `testmodel_test2` VALUES ('22', '荣耀10 GT游戏加速 AIS手持夜景 6GB+64GB 幻夜黑 全网通 移动联通电信4G 双卡双待 游戏', '2199.00');
INSERT INTO `testmodel_test2` VALUES ('23', 'Apple iPhone 8 (A1863) 64GB 深空灰色 移动联通电信4G手机', '3799.00');
INSERT INTO `testmodel_test2` VALUES ('24', 'Apple iPhone 8 Plus (A1864) 64GB 深空灰色 移动联通电信4G手机', '4699.00');
INSERT INTO `testmodel_test2` VALUES ('25', '小米 红米Redmi Note7Pro AI双摄 6GB+128GB 亮黑色 全网通4G 双卡双待 水滴屏拍照游戏', '1599.00');
INSERT INTO `testmodel_test2` VALUES ('26', 'Apple iPhone XS Max (A2104) 64GB 金色 移动联通电信4G手机 双卡双待', '8299.00');
INSERT INTO `testmodel_test2` VALUES ('27', '华为 HUAWEI nova 4e 3200万立体美颜AI超广角三摄珍珠屏6GB+128GB幻夜黑全网通版双4G', '2299.00');
INSERT INTO `testmodel_test2` VALUES ('28', '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB 极光蓝 移动联通电信4G全面屏 双卡双待', '799.00');
INSERT INTO `testmodel_test2` VALUES ('29', '华为 HUAWEI 畅享 9S 4GB+64GB 极光蓝 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G 双卡双待', '1499.00');
INSERT INTO `testmodel_test2` VALUES ('30', 'Apple iPhone XR (A2108) 128GB 黑色 移动联通电信4G手机 双卡双待', '5699.00');
INSERT INTO `testmodel_test2` VALUES ('31', '【KPL官方比赛用机】vivo iQOO 44W超快闪充 8GB+128GB电光蓝 全面屏拍照手机 骁龙855电竞游戏 全网通4G', '3298.00');
INSERT INTO `testmodel_test2` VALUES ('32', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+64GB亮黑色全网通双4G双', '3988.00');
INSERT INTO `testmodel_test2` VALUES ('33', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄 4GB+64GB 幻夜黑 移动联通电信4G全面屏 双卡双待', '1299.00');
INSERT INTO `testmodel_test2` VALUES ('34', '小米 红米Redmi Note7 幻彩渐变AI双摄 4GB+64GB 梦幻蓝 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '1199.00');
INSERT INTO `testmodel_test2` VALUES ('35', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB 渐变蓝 移动联通电信4G全面屏 双卡双待', '1299.00');
INSERT INTO `testmodel_test2` VALUES ('36', 'vivo U1 水滴全面屏 AI智慧拍照手机 3GB+32GB 极光色 移动联通电信全网通4G', '799.00');
INSERT INTO `testmodel_test2` VALUES ('37', '小米 红米6 4GB+64GB 铂银灰 全网通4G手机 双卡双待', '799.00');
INSERT INTO `testmodel_test2` VALUES ('38', '荣耀V20 胡歌同款 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻夜黑 移动联通电信4G全面屏', '2799.00');
INSERT INTO `testmodel_test2` VALUES ('39', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB 幻夜黑 移动联通电信4G全面屏 双卡双待', '899.00');
INSERT INTO `testmodel_test2` VALUES ('40', '小米8SE 全面屏智能游戏拍照手机 6GB+64GB 灰色 骁龙710处理器 全网通4G 双卡双待', '1399.00');
INSERT INTO `testmodel_test2` VALUES ('41', '小米9 4800万超广角三摄 8GB+128GB全息幻彩蓝 骁龙855 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '3299.00');
INSERT INTO `testmodel_test2` VALUES ('42', 'vivo Z3 6GB+64GB 极光蓝 性能实力派 全面屏游戏手机 移动联通电信全网通4G手机', '1548.00');
INSERT INTO `testmodel_test2` VALUES ('43', '小米8青春版 镜面渐变AI双摄 6GB+64GB 梦幻蓝 骁龙 全网通4G 双卡双待 全面屏拍照游戏智能', '1499.00');
INSERT INTO `testmodel_test2` VALUES ('44', 'vivo X27 8GB+256GB大内存 雀羽蓝 4800万AI三摄全面屏拍照手机 移动联通电信全网通4G', '3598.00');
INSERT INTO `testmodel_test2` VALUES ('45', '小米 红米6A AI美颜 3GB+32GB 流沙金 全网通4G手机 双卡双待', '649.00');
INSERT INTO `testmodel_test2` VALUES ('46', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机', '6199.00');
INSERT INTO `testmodel_test2` VALUES ('47', '小米 红米Redmi 7 幻彩渐变AI双摄 3GB+32GB 梦幻蓝 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '799.00');
INSERT INTO `testmodel_test2` VALUES ('48', 'vivo S1 6GB+128GB 冰湖蓝 2480万AI高清自拍 超广角后置三摄拍照手机 移动联通电信全网通4G', '2298.00');
INSERT INTO `testmodel_test2` VALUES ('49', '黑鲨游戏手机2 8GB+128GB 暗影黑 骁龙855 Magic Press立体操控 塔式全域液冷 全面屏 全网通4G 双卡双待', '3499.00');
INSERT INTO `testmodel_test2` VALUES ('50', '诺基亚 NOKIA X6 6GB+64GB 星空黑 全网通 双卡双待 移动联通电信4G手机', '1039.00');
INSERT INTO `testmodel_test2` VALUES ('51', '荣耀10 GT游戏加速 AIS手持夜景 6GB+64GB 幻夜黑 全网通 移动联通电信4G 双卡双待 游戏', '2199.00');
INSERT INTO `testmodel_test2` VALUES ('52', 'Apple iPhone 8 (A1863) 64GB 深空灰色 移动联通电信4G手机', '3799.00');
INSERT INTO `testmodel_test2` VALUES ('53', 'Apple iPhone 8 Plus (A1864) 64GB 深空灰色 移动联通电信4G手机', '4699.00');
INSERT INTO `testmodel_test2` VALUES ('54', '小米 红米Redmi Note7Pro AI双摄 6GB+128GB 亮黑色 全网通4G 双卡双待 水滴屏拍照游戏', '1599.00');
INSERT INTO `testmodel_test2` VALUES ('55', 'Apple iPhone XS Max (A2104) 64GB 金色 移动联通电信4G手机 双卡双待', '8299.00');
INSERT INTO `testmodel_test2` VALUES ('56', '华为 HUAWEI nova 4e 3200万立体美颜AI超广角三摄珍珠屏6GB+128GB幻夜黑全网通版双4G', '2299.00');
INSERT INTO `testmodel_test2` VALUES ('57', '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB 极光蓝 移动联通电信4G全面屏 双卡双待', '799.00');
INSERT INTO `testmodel_test2` VALUES ('58', '华为 HUAWEI 畅享 9S 4GB+64GB 极光蓝 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G 双卡双待', '1499.00');
INSERT INTO `testmodel_test2` VALUES ('59', '华为 HUAWEI Mate 20 麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB亮黑色全网通版双4G', '3989.00');
INSERT INTO `testmodel_test2` VALUES ('60', '小米9 SE 4800万超广角三摄 骁龙712 水滴全面屏 游戏智能拍照手机 6GB+128GB 全息幻彩蓝 全网通4G双卡双待', '2299.00');
INSERT INTO `testmodel_test2` VALUES ('61', '一加手机6T 8GB+128GB 墨岩黑 超强城市夜景 光感屏幕指纹 全面屏双摄游戏手机 全网通4G 双卡双待', '3189.00');
INSERT INTO `testmodel_test2` VALUES ('62', '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 6GB+128GB 亮黑色 全网通双卡双待', '2689.00');
INSERT INTO `testmodel_test2` VALUES ('63', '荣耀Play 全网通版 6GB+64GB 幻夜黑 移动联通电信4G全面屏游戏手机 双卡双待', '1899.00');
INSERT INTO `testmodel_test2` VALUES ('64', 'OPPO Reno 全面屏拍照手机 8G+256G 雾海绿 全网通 移动联通电信 双卡双待手机', '3599.00');
INSERT INTO `testmodel_test2` VALUES ('65', 'Apple iPhone 7 (A1660) 128G 玫瑰金色 移动联通电信4G手机', '2999.00');
INSERT INTO `testmodel_test2` VALUES ('66', '三星 Galaxy S10 8GB+128GB皓玉白（SM-G9730）超感官全视屏骁龙855双卡双待全网通4G游戏', '5999.00');
INSERT INTO `testmodel_test2` VALUES ('67', 'Apple iPhone XS (A2100) 64GB 金色 移动联通电信4G手机', '7599.00');
INSERT INTO `testmodel_test2` VALUES ('68', '荣耀20i 3200万AI自拍 超广角三摄 全网通版6GB+64GB 幻夜黑 移动联通电信4G全面屏 双卡双待', '1599.00');
INSERT INTO `testmodel_test2` VALUES ('69', '华为 HUAWEI Mate 20 Pro (UD)屏内指纹版麒麟980芯片全面屏超大广角徕卡三摄8GB+128GB亮黑色全网通双4G', '5489.00');
INSERT INTO `testmodel_test2` VALUES ('70', '华为 HUAWEI 畅享 9e 实力大音量高像素珍珠屏3GB+64GB幻夜黑全网通版双4G手机', '999.00');
INSERT INTO `testmodel_test2` VALUES ('71', '华为 HUAWEI 畅享9 Plus 4GB+64GB 极光紫 全网通 四摄超清全面屏大电池 移动联通电信4G 双卡双待', '1399.00');
INSERT INTO `testmodel_test2` VALUES ('72', '三星 Galaxy S10+ 8GB+128GB皓玉白（SM-G9750）3D超声波屏下指纹超感官全视屏双卡双待全网通4G游戏', '6999.00');
INSERT INTO `testmodel_test2` VALUES ('73', 'Apple iPhone 7 Plus (A1661) 128G 黑色 移动联通电信4G手机', '4199.00');
INSERT INTO `testmodel_test2` VALUES ('74', '荣耀 畅玩7 2GB+16GB 金色 全网通4G手机 双卡双待', '599.00');
INSERT INTO `testmodel_test2` VALUES ('75', '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机 6GB+64GB 极光色 全网通移动联通电信4G 双卡双待', '3088.00');
INSERT INTO `testmodel_test2` VALUES ('76', 'HUAWEI 华为畅享9 4GB+64GB 幻夜黑 高清珍珠屏 AI长续航 全网通高配版 移动联通电信4G', '1189.00');
INSERT INTO `testmodel_test2` VALUES ('77', 'OPPO K1 光感屏幕指纹 水滴屏拍照手机 4G+64G 摩卡红 全网通 移动联通电信4G 双卡双待', '1399.00');
INSERT INTO `testmodel_test2` VALUES ('78', '荣耀Note10 全网通6G+64G 幻夜黑 移动联通电信4G全面屏手机 双卡双待 游戏手机', '2599.00');
INSERT INTO `testmodel_test2` VALUES ('79', 'OPPO R17 2500万美颜拍照 6.4英寸水滴屏 光感屏幕指纹 6G+128G 流光蓝 全网通 移动联通电信4G 双卡双待', '2399.00');
INSERT INTO `testmodel_test2` VALUES ('80', '华为 HUAWEI P20 Pro 全面屏徕卡三摄游戏手机 6GB+128GB 亮黑色 全网通移动联通电信4G 双卡双待', '3688.00');
INSERT INTO `testmodel_test2` VALUES ('81', '魅族 Note9 全面屏游戏拍照手机 4GB+64GB 幻黑 全网通移动联通电信4G 双卡双待', '1398.00');
INSERT INTO `testmodel_test2` VALUES ('82', '小米8屏幕指纹版 6GB+128GB 黑色 全网通4G 双卡双待 全面屏拍照游戏智能手机', '2499.00');
INSERT INTO `testmodel_test2` VALUES ('83', '锤子（smartisan ) 坚果 Pro 2S 6G+64GB 炫光蓝 全面屏双摄 全网通4G手机 双卡双待 游戏', '1399.00');
INSERT INTO `testmodel_test2` VALUES ('84', '华为 HUAWEI Mate20X 麒麟980芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB宝石蓝全网通版双4G游戏', '4489.00');
INSERT INTO `testmodel_test2` VALUES ('85', '魅族 Note8 全面屏手机 4GB+64GB 曜黑 全网通移动联通电信4G手机 双卡双待', '949.00');
INSERT INTO `testmodel_test2` VALUES ('86', '华为 HUAWEI 畅享MAX 4GB+64GB 幻夜黑 全网通版 珍珠屏杜比全景声大电池 移动联通电信4G 双卡双待', '1489.00');
INSERT INTO `testmodel_test2` VALUES ('87', 'Apple iPhone 6s Plus (A1699) 128G 玫瑰金色 移动联通电信4G手机', '2999.00');
INSERT INTO `testmodel_test2` VALUES ('88', '小米6X 全网通 6GB+64GB 赤焰红 移动联通电信4G手机 双卡双待 智能手机 拍照手机', '1299.00');
