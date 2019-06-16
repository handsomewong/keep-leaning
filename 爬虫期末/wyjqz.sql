/*
Navicat MySQL Data Transfer

Source Server         : wyj
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : wyjqz

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-16 22:22:40
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
-- Table structure for cpshadow
-- ----------------------------
DROP TABLE IF EXISTS `cpshadow`;
CREATE TABLE `cpshadow` (
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cpshadow
-- ----------------------------
INSERT INTO `cpshadow` VALUES ('MAIN SQUEEZE', '$12.00');
INSERT INTO `cpshadow` VALUES ('SWEET TALK', '$18.00');
INSERT INTO `cpshadow` VALUES ('BLUE MOON', '$12.00');
INSERT INTO `cpshadow` VALUES ('JUST MY LUCK', '$12.00');
INSERT INTO `cpshadow` VALUES ('OOH LA LA!', '$12.00');
INSERT INTO `cpshadow` VALUES ('YES, PLEASE!', '$16.00');
INSERT INTO `cpshadow` VALUES ('GIVE IT TO ME STRAIGHT', '$16.00');
INSERT INTO `cpshadow` VALUES ('BRUNCH DATE', '$18.00');
INSERT INTO `cpshadow` VALUES ('CHASING RAINBOWS', '$20.00');
INSERT INTO `cpshadow` VALUES ('MAR', '$12.00');
INSERT INTO `cpshadow` VALUES ('SOL', '$12.00');
INSERT INTO `cpshadow` VALUES ('DOUBLE ENTENDRE', '$16.00');
INSERT INTO `cpshadow` VALUES ('SHE', '$16.00');
INSERT INTO `cpshadow` VALUES ('I THINK I LOVE YOU', '$16.00');
INSERT INTO `cpshadow` VALUES ('GOOD SPORT', '$16.00');
INSERT INTO `cpshadow` VALUES ('MISUNDERSTOOD.', '$22.00');
INSERT INTO `cpshadow` VALUES ('PERCEPTION', '$24.00');
INSERT INTO `cpshadow` VALUES ('YOU HAD ME AT HELLO', '$18.00');
INSERT INTO `cpshadow` VALUES ('THROUGH MY EYES PALETTE', '$24.00');
INSERT INTO `cpshadow` VALUES ('SALVAJE PALETTE', '$18.00');
INSERT INTO `cpshadow` VALUES ('FAME', '$23.00');
INSERT INTO `cpshadow` VALUES ('FORTUNE', '$23.00');

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
-- Table structure for doubanmusic
-- ----------------------------
DROP TABLE IF EXISTS `doubanmusic`;
CREATE TABLE `doubanmusic` (
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of doubanmusic
-- ----------------------------
INSERT INTO `doubanmusic` VALUES ('\n            We Sing. We Dance. We Steal Things.\n       ', 'Jason Mraz / 2008-05-13 / Import / Audio CD / 民谣', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            Viva La Vida\n                ', 'Coldplay / 2008-06-17 / 专辑 / CD / 摇滚', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            华丽的冒险\n                ', '陈绮贞 / 2005-09-23 / 专辑 / CD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            范特西\n                ', '周杰伦 / 2001-09-14 / 专辑 / CD / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            後。青春期的詩\n                ', '五月天 / 2008-10-23 / 专辑 / CD / 摇滚', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            是时候\n                ', '孙燕姿 / 2011-03-08 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            Lenka\n       ', 'Lenka / 2008-09-23 / 专辑 / Audio CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            Start from Here\n                ', '王若琳 / 2008-01-11 / 专辑 / CD / 爵士', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            旅行的意义\n       ', '陈绮贞 / 2004-02-02 / 单曲 / CD / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            太阳\n                ', '陈绮贞 / 2009-01-22 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            Once (Soundtrack)\n                ', 'Glen Hansard,Marketa Irglova / 2007-05-22 / Soundtrack / CD / 原声', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            Not Going Anywhere\n                ', 'Keren Ann / 2004-08-24 / Import / Audio CD / 民谣', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            American Idiot\n       ', 'Green Day / 2004-09-21 / Explicit Lyrics / Audio CD / 摇滚', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            思念是一种病\n                ', '张震岳 Csun Yuk / 2007-07-06 / 专辑 / CD / 流行', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            無與倫比的美麗\n                ', '苏打绿 / 2007-11-02 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            亲爱的...我还不知道\n                ', '张悬 / 2007-07-20 / 专辑 / CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            城市\n                ', '张悬 / 2009-05-22 / 专辑 / CD / 流行', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            O\n       ', 'Damien Rice / 2003 / 专辑 / CD / 流行', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            Wake Me Up When September Ends\n                ', 'Green Day / 2005-06-13 / 单曲 / CD / 摇滚', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            叶惠美\n                ', '周杰伦 / 2003-07-31 / 专辑 / CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            七里香\n                ', '周杰伦 / 2004 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            21\n       ', 'Adele / 2011-02-01 / 专辑 / CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            My Life Will...\n       ', '张悬 / 2006-06-09 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            寓言\n       ', '王菲 / 2000 / 专辑 / CD / 流行', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            你在煩惱什麼\n                ', '苏打绿 / 2011-11-11 / 专辑 / CD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            感官/世界\n                ', '林宥嘉 / 2009-10-30 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            Nevermind\n       ', 'Nirvana / 1991 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            八度空间\n                ', '周杰伦 / 2002-07-19 / 专辑 / CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            Jay\n       ', '周杰伦 / 2000-11-13 / 专辑 / Audio CD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            Parachutes\n       ', 'Coldplay / 2000-07-10 / 专辑 / CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            我要的幸福\n                ', '孙燕姿 / 2000-12-7 / 专辑 / CD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            还是会寂寞\n                ', '陈绮贞 / 2000 / 专辑 / CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            Let Go\n       ', 'Avril Lavigne / 2002 / Enhanced / Audio CD / 摇滚', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            十一月的萧邦\n                ', '周杰伦 / 2005-11-01 / 专辑 / CD / 流行', '7.9');
INSERT INTO `doubanmusic` VALUES ('\n            橙月\n                ', '方大同 / 2008-12-19 / 专辑 / CD / 放克/灵歌/R&B', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            小宇宙\n       ', '苏打绿 / 2006-10-20 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            若你碰到他\n                ', '蔡健雅 / 2009-08-19 / 专辑 / CD / 流行', '8.0');
INSERT INTO `doubanmusic` VALUES ('\n            Lady & Bird\n       ', 'Lady & Bird / 2003 / Import / Audio CD / 民谣', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            万能青年旅店\n       ', '万能青年旅店 / 2010-11-12 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            Meteora\n                ', 'Linkin Park / 2003-03-25 / Enhanced / Audio CD / 摇滚', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            Back To Bedlam\n                ', 'James Blunt / 2004 / Explicit Lyrics / Audio CD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            苏打绿\n       ', '苏打绿,蘇打綠 / 2005年9月 / 国语 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            静茹&情歌 别再为他流泪\n                ', '梁静茹 / 2009-01-16 / 专辑 / Audio CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            美妙生活\n                ', '林宥嘉 / 2011-05-06 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            Le Fabuleux destin d\'Amélie Poulain\n                ', 'Yann Tiersen / 2001-04-23 / Soundtrack / Audio CD / 原声', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            Joanna & 王若琳\n       ', '王若琳 / 2009-01-16 / 专辑 / CD', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            A Plea En Vendredi\n       ', 'Tamas Wells / 2006 / Import / Audio CD / 民谣', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            To Hebe\n                ', '田馥甄 Hebe / 2010-09-03 / 专辑 / CD / 流行', '8.0');
INSERT INTO `doubanmusic` VALUES ('\n            逆光\n                ', '孙燕姿 / 2007-03-22 / Import / CD / 流行', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            只爱陌生人\n       ', '王菲 / 1999-09-10 / Import / CD / 流行', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            Music For Tourists\n       ', 'Chris Garneau / 2007-01-23 / 引进版 / Audio CD / 民谣', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            The Moment\n                ', '孙燕姿 / 2003-08-22 / 专辑 / CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            七\n       ', '陈奕迅 / 2003-11-20 / 选集 / CD / 流行', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            春·日光\n                ', '苏打绿 / 2009-05-08 / 专辑 / CD / 摇滚', '8.0');
INSERT INTO `doubanmusic` VALUES ('\n            100种生活\n       ', '盧廣仲 / 2008-5-27 / 专辑 / CD / 民谣', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            崇拜\n                ', '梁静茹 / 2007-11-09 / 专辑 / CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            陈绮贞精选\n                ', '陈绮贞 / 2005 / 选集 / CD / 民谣', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            菊次郎の夏\n                ', 'Joe Hisaishi / 1999-05-19 / 专辑 / CD / 原声', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            Fearless\n       ', 'Taylor Swift / 2008-11-11 / Enhanced / Audio CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            Life In Cartoon Motion\n       ', 'Mika / 2007-02-05 / 专辑 / CD / 流行', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            H³M\n                ', '陈奕迅 / 2009-03-23 / 专辑 / CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            神秘嘉宾\n                ', '林宥嘉 / 2008-06-03 / 专辑 / CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            Les Choristes\n                ', 'Bruno Coulais / 2004-05-03 / Soundtrack / Audio CD', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            赤子\n                ', '范晓萱&100% / 2009-08-10 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            9\n       ', 'Damien Rice / 2006-11-06 / 专辑 / Audio CD / 民谣', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            将爱\n       ', '王菲 / 2003 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            遇见我\n                ', '曹方 / 2005年12月 / 专辑 / CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            梵高先生\n                ', '李志 / 2007-01-11 / CD / CD / 民谣', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            Timeless 可啦思刻\n                ', '方大同 / 2009-08-11 / 自选集 / CD / 放克/灵歌/R&B', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            依然范特西\n                ', '周杰伦 / 2006-09-05 / 专辑 / CD / 流行', '7.7');
INSERT INTO `doubanmusic` VALUES ('\n            风筝\n                ', '孙燕姿 / 2001-07-09 / 专辑 / CD / 流行', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            完美的一天\n                ', '孙燕姿 / 2005-10-07 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            Say I Am You\n       ', 'The Weepies / 2006 / Import / Audio CD / 民谣', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            黑色柳丁\n                ', '陶喆 / 2002 / 专辑 / CD / 流行', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            Under My Skin\n                ', 'Avril Lavigne / 2004-05-12 / Import / Audio CD / 摇滚', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            Stefanie\n       ', '孙燕姿 / 2004-10-1 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            The Fame\n       ', 'Lady Gaga / 2008-08-19 / Import / Audio CD / 电子', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            Mr. A-Z\n                ', 'Jason Mraz / 2005-07-04 / Import / Audio CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            为爱而生\n                ', '五月天 / 2006-12-28 / 引进版 / CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            Daniel Powter\n                ', 'Daniel Powter / 2006 / 专辑 / Audio CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            I\'m Yours\n       ', 'Jason Mraz / 2008-12-16 / Single / Audio CD / 民谣', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            在动物园散步才是正经事\n       ', 'My Little Airport / 2004-08-07 / 专辑 / CD / 流行', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            时光·漫步\n       ', '许巍 Wei Xu / 2002-12-01 / 专辑 / CD / 民谣', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            生如夏花\n                ', '朴树 / 2003-11-28 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            我很忙\n                ', '周杰伦 / 2007-11-01 / 专辑 / CD / 流行', '7.3');
INSERT INTO `doubanmusic` VALUES ('\n            夏 / 狂热\n                ', '苏打绿 / 2009-09-11 / 专辑 / CD / 摇滚', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            绝世名伶\n       ', '范晓萱 / 2001-08-25 / 专辑 / CD / 爵士', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            哼一首歌 等日落\n       ', '曹方 / 2009-11-11 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            未完成\n                ', '孙燕姿 / 2003-01-10 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            OK Computer\n       ', 'Radiohead / 1997 / 专辑 / Audio CD / 摇滚', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            Born to Die\n                ', 'Lana Del Rey / 2012-01-31 / 专辑 / Audio CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            The Wall\n                ', 'Pink Floyd / 1979 / 专辑 / Audio CD / 摇滚', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            不要停止我的音乐\n                ', '痛仰 / 2008-10 / 专辑 / CD / 摇滚', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            Hybrid Theory\n                ', 'Linkin Park / 2000 / 专辑 / CD / 摇滚', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            MTV Unplugged in New York\n       ', 'Nirvana / 1994-11-01 / Live / Audio CD / 摇滚', '9.5');
INSERT INTO `doubanmusic` VALUES ('\n            After 17\n       ', '陈绮贞 / 2004年12月 / EP / CD / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            In Between Dreams\n       ', 'Jack Johnson / 2005-03-22 / 专辑 / Audio CD / 民谣', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            神的孩子都在跳舞\n       ', '五月天 Mayday / 2004-11-05 / 专辑 / CD+VCD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            离开地球表面Jump!\n       ', '五月天 / 2007-07-20 / 专辑 / CD+DVD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            不想放手\n                ', '陈奕迅 / 2008-06-30 / 专辑 / CD / 流行', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            我的歌声里\n       ', '曲婉婷 / 2010-02-24 / 单曲 / 数字(Digital) / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            The Legend of 1900\n                ', 'Ennio Morricone / 1999-10-12 / Soundtrack / Audio CD', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            孤独的人是可耻的\n       ', '张楚 / 1994 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            徐佳瑩La La首张创作专辑\n                ', '徐佳莹 / 2009-05-29 / 专辑 / CD / 流行', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            The Best Damn Thing\n       ', 'Avril Lavigne / 2007-04-17 / Import / Audio CD / 流行', '7.7');
INSERT INTO `doubanmusic` VALUES ('\n            知足 just my pride 最真杰作选\n       ', '五月天 / 2005-11-18 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            1\n                ', 'The Beatles / 2000 / 专辑 / CD / 摇滚', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            魔杰座\n       ', '周杰伦 / 2008-10-09 / 专辑 / CD / 流行', '6.9');
INSERT INTO `doubanmusic` VALUES ('\n            X&Y\n       ', 'Coldplay / 2005-06-07 / 专辑 / CD / 摇滚', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            19\n       ', 'Adele / 2008-01-28 / Import / Audio CD / 放克/灵歌/R&B', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            我们在炎热与抑郁的夏天，无法停止抽烟\n                ', 'My Little Airport / 2007-10-10 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            时光机\n                ', '五月天 / 2003-11-11 / 专辑 / CD / 摇滚', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            Yan Zi\n                ', '孙燕姿 / 2000-06-08 / 专辑 / CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            Time Flies\n                ', '陈奕迅 / 2010-03-12 / EP / CD+DVD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            失败者的飞翔\n       ', '陈绮贞 / 2008-07-13 / 单曲 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            My Love\n       ', '田馥甄 / 2011-09-02 / 专辑 / CD / 流行', '8.0');
INSERT INTO `doubanmusic` VALUES ('\n            亲亲\n                ', '梁静茹 / 2006-10-06 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            你王菲所以我王菲\n       ', '王菲 / 2002 / 选集 / CD / 流行', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            Stranger Under My Skin\n       ', '陈奕迅 / 2011-02-22 / EP / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            Come Away with Me\n                ', 'Norah Jones / 2002 / 专辑 / CD / 爵士', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            平凡之路\n                ', '朴树 / 2014-07-16 / 单曲 / 数字(Digital)', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            认了吧\n                ', '陈奕迅 / 2007-04-24 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            21st Century Breakdown\n       ', 'Green Day / 2009-05-15 / 专辑 / CD / 摇滚', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            神的游戏\n                ', '張懸 / 2012-08-10 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            唱游\n       ', '王菲 / 1998 / 專輯 / CD / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            花的姿态：演唱会经典实录\n                ', '陈绮贞 / 2007-05-18 / 演唱会/Live / CD DVD', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            我去2000年\n       ', '朴树 / 1999-1 / 专辑 / CD / 流行', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            Young For You\n       ', 'GALA / 2004 / 专辑 / CD / 摇滚', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            自选集\n                ', '孙燕姿 / 2002年1月 / 专辑 / CD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            理性与感性 作品音乐会\n                ', '李宗盛 Jonathan / 2007-09-28 / 专辑 / CD / 流行', '9.5');
INSERT INTO `doubanmusic` VALUES ('\n            比天空还远\n       ', '曹方 / 2007-11-20 / EP / CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            黑梦\n       ', '窦唯 / 1994-10 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            介乎法國與旺角的詩意\n                ', 'My Little Airport / 2009-11-20 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            不能说的秘密\n                ', '周杰倫,Terdsak Janpan,詹宇豪,陳承麒,黃婉琦,姚蘇蓉,黃俊郎,江語晨,長榮交響樂團 / 2007-08-13 / Soundtrack / CD', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            丝路\n                ', '梁静茹 Fish / 2005-9-16 / 专辑 / CD / 流行', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            All The Lost Souls\n                ', 'James Blunt / 2007-09-18 / Import / Audio CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            F.I.R.\n       ', 'F.I.R.,飞儿乐团 / 2004-04-29 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            上五楼的快活\n       ', '陈奕迅 / 2009-09-23 / 专辑 / CD / 流行', '7.7');
INSERT INTO `doubanmusic` VALUES ('\n            Minutes to Midnight\n       ', 'Linkin Park / 2007-05-15 / 专辑 / CD / 摇滚', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            GOODBYE & HELLO\n       ', '蔡健雅,Tanya / 2007-10-19 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            Someone Like You\n                ', 'Adele / 2011-01-24 / 单曲 / 数字(Digital) / 放克/灵歌/R&B', '9.5');
INSERT INTO `doubanmusic` VALUES ('\n            迟到千年\n       ', '苏打绿 / 2006-09-18 / EP / CD / 流行', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            The Dark Side of the Moon\n       ', 'Pink Floyd / 1973 / 专辑 / 黑胶 / 摇滚', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            王菲 2001\n                ', '王菲 / 2001 / 专辑 / CD / 流行', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            夜空中最亮的星\n       ', '逃跑计划 / 2011-04-12 / 单曲 / 数字(Digital) / 流行', '9.5');
INSERT INTO `doubanmusic` VALUES ('\n            追梦痴子心\n       ', 'GALA / 2011-03-24 / 专辑 / CD / 摇滚', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            宝贝\n       ', '莫文蔚 / 2010-07-26 / 专辑 / CD / 流行', '7.9');
INSERT INTO `doubanmusic` VALUES ('\n            黑白灰\n                ', '陈奕迅 / 2003 / 专辑 / CD / 流行', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            安和桥北\n                ', '宋冬野 / 2013-08-26 / 专辑 / CD / 民谣', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            Prisoner of Love\n                ', '宇多田ヒカル / 2008-05-21 / CD IMPORT / Audio CD / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            Groupies 吉他手\n                ', '陈绮贞 / 2002-08-02 / 专辑 / CD / 流行', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            Now The Day Is Over\n                ', 'The Innocence Mission / 2004 / 专辑 / CD / 民谣', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            Apologize\n       ', 'Timbaland,OneRepublic / 2007-11-06 / Single / Audio CD / 放克/灵歌/R&B', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            阿菲正传\n                ', '王菲 / 2009-06-25 / 选集 / CD / 流行', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            跨时代\n       ', '周杰伦 / 2010-05-14 / 专辑 / CD / 流行', '7.0');
INSERT INTO `doubanmusic` VALUES ('\n            Leave\n                ', '孙燕姿 / 2002-5-21 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            被禁忌的游戏\n       ', '李志 / 2004-12 / 专辑 / CD / 民谣', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            What\'s Going On....?\n       ', '陈奕迅 / 2006 / 专辑 / CD / 流行', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            第二人生 末日版\n                ', '五月天 / 2011-12-20 / 专辑 / CD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            樂之路\n                ', '陶喆 / 2003-08-08 / 选集 / CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            It Won\'t Be Soon Before Long\n                ', 'Maroon 5 / 2007-05-22 / 专辑 / CD / 流行', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            如果你冷\n                ', '张悬 / 2008-10-20 / Bootleg / 数字 / 民谣', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            陌生人\n       ', '蔡健雅 Tanya Chua / 2003-06-00 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            浮躁\n       ', '王菲 / 1996 / 港版 / Audio CD / 摇滚', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            C\'est La Vie\n                ', '自然卷 / 2004 / 专辑 / CD / 民谣', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            在一起\n                ', '刘若英 / 2010-04-16 / 专辑 / CD / 流行', '7.8');
INSERT INTO `doubanmusic` VALUES ('\n            These Friends Of Mine\n       ', 'Rosie Thomas / 2007-03-13 / 专辑 / Audio CD / 民谣', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            陪我歌唱\n                ', '苏打绿 / 2008 / 引进版 / CD', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            It\'s Not Me, It\'s You\n                ', 'Lily Allen / 2009-02-09 / 专辑 / Audio CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            The Rose~I Love Cinemas~\n       ', '手嶌葵 / 2008-03-05 / Import / CD / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            我爱南京\n       ', '李志 / 2009-10-16 / 专辑 / CD / 民谣', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            消失的光年\n                ', '大乔小乔 / 2007-07-12 / 平装版 / CD / 民谣', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            还有别的办法吗\n       ', '范晓萱 / 2004 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            日光倾城\n       ', '卡奇社 / 2007-04-20 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            A Little Love\n                ', '冯曦妤 / 2008-11-20 / 专辑 / CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            Yellow\n                ', 'Coldplay / 2000-07-03 / EP / Audio CD / 摇滚', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            Hopes And Fears\n       ', 'Keane / 2004 / 专辑 / Audio CD / 摇滚', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            U87\n       ', '陈奕迅 / 2005-06-07 / 专辑 / CD+DVD / 流行', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            Lady Sleep\n       ', 'Maximilian Hecker / 2005 / Import / Audio CD / 民谣', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            天空の城ラピュタ サウンドトラック 飛行石の謎\n                ', '久石譲(Joe Hisaishi),杉並児童合唱団,井上杏美 / 1993-12-21 / Soundtrack / Audio CD / 原声', '9.5');
INSERT INTO `doubanmusic` VALUES ('\n            新长征路上的摇滚\n       ', '崔健 / 1989 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            小飞行\n       ', '棉花糖,katncandix2 / 2009-05-01 / 专辑 / CD / 民谣', '7.9');
INSERT INTO `doubanmusic` VALUES ('\n            春生\n       ', '好妹妹乐队 / 2012-07-01 / 专辑 / CD / 民谣', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            讓我想一想\n                ', '陈绮贞 / 1998-07-14 / 专辑 / CD / 民谣', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            未来\n                ', '方大同 / 2007-12-28 / 专辑 / CD / 放克/灵歌/R&B', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            爱爱爱\n                ', '方大同 / 2006-12 / 专辑 / CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            世界\n                ', '逃跑计划 / 2011-12-31 / 专辑 / CD / 摇滚', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            七天\n                ', '盧廣仲,卢广仲 / 2009-10-30 / 专辑 / CD / 民谣', '7.8');
INSERT INTO `doubanmusic` VALUES ('\n            Nirvana\n       ', 'Nirvana / 2002-10-29 / Extra tracks / Audio CD / 摇滚', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            A Rush of  Blood to the Head\n                ', 'Coldplay / 2002 / 专辑 / Audio CD / 流行', '8.6');
INSERT INTO `doubanmusic` VALUES ('\n            The Velvet Underground & Nico\n                ', 'The Velvet Underground,Nico / 1967-04 / 专辑 / CD / 摇滚', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            Love The Way You Lie\n                ', 'Eminem,Rihanna / 2010-08-20 / Single / Audio CD / 说唱', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            天空\n                ', '王菲 / 1994 / 专辑 / CD / 流行', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            The Boat That Rocked\n       ', 'Original Soundtrack / 2009-03-30 / Import / Soundtrack / CD / 原声', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            (What\'s The Story) Morning Glory?\n       ', 'Oasis / 1995 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            PUSSY\n       ', '陈绮贞 / 2007-02-08 / 单曲 / Audio CD / 民谣', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            呼吸\n                ', 'Salyu / 2001 / 专辑 / CD / 原声', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            Fallen\n       ', 'Evanescence / 2003 / 专辑 / Audio CD / 摇滚', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            黑豹\n       ', '黑豹 / 1992-12-01 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            十年一刻\n       ', '苏打绿 / 2010-08-27 / 视频 / CD+DVD / 流行', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            恋爱的力量\n       ', '梁静茹 / 2003年3月 / 专辑 / CD / 流行', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            Suede\n       ', 'Suede / 1993 / 专辑 / CD / 摇滚', '8.9');
INSERT INTO `doubanmusic` VALUES ('\n            The Bends\n       ', 'Radiohead / 1995 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            琵琶相\n                ', '林海 / 2004 / 专辑 / CD / 轻音乐', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            ？\n                ', '陈奕迅 / 2011-11-11 / 专辑 / CD / 流行', '8.0');
INSERT INTO `doubanmusic` VALUES ('\n            少年故事\n       ', '彭坦 / 2007-07-23 / 专辑 / CD / 流行', '8.0');
INSERT INTO `doubanmusic` VALUES ('\n            黑暗之光\n       ', '雷光夏 / 2006-12-01 / 专辑 / CD / 民谣', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            我要我们在一起\n       ', '范晓萱 / 1999-11-1 / 国语 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            人生海海\n       ', '五月天 / 2001-07-06 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            Maybe I\'m Dreaming\n                ', 'Owl City / 2008-03-18 / Import / CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            工体东路没有人\n       ', '李志 / 2009-01-22 / 专辑 / 数字 / 民谣', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            Let It Be\n       ', 'The Beatles / 1990-10-25 / Enhanced / Audio CD / 摇滚', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            Alright,Still\n       ', 'Lily Allen / 2006 / Import / Audio CD / 流行', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            大小說家\n                ', '林宥嘉 / 2012-06-22 / 专辑 / CD / 流行', '7.9');
INSERT INTO `doubanmusic` VALUES ('\n            越长大越孤单\n       ', '牛奶@咖啡 / 2008-03-18 / 专辑 / CD / 流行', '7.6');
INSERT INTO `doubanmusic` VALUES ('\n            燕尾蝶\n                ', '梁静茹 / 2004 / 专辑 / CD / 流行', '8.0');
INSERT INTO `doubanmusic` VALUES ('\n            原谅我就是这样的女生\n                ', '戴佩妮 / 2009-05-16 / 专辑 / CD+DVD / 流行', '7.6');
INSERT INTO `doubanmusic` VALUES ('\n            传奇\n       ', '王菲 / 2010-11-05 / 单曲 / CD / 民谣', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            Under the Radar\n                ', 'Daniel Powter / 2008-10-14 / 专辑 / Audio CD / 流行', '8.3');
INSERT INTO `doubanmusic` VALUES ('\n            知足 MV / Karaoke DVD\n       ', '五月天 / 2006 / 视频 / DVD / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            我的歌声里\n       ', '曲婉婷 / 2012-07-01 / 专辑 / CD / 流行', '7.7');
INSERT INTO `doubanmusic` VALUES ('\n            王菲\n                ', '王菲 / 1997-09-30 / 专辑 / CD / 流行', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            信仰在空中飘扬\n       ', '汪峰 / 2009-07-25 / 专辑 / CD / 摇滚', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            [i]\n                ', '莫文蔚 / 2002-04-29 / 专辑 / CD / 流行', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            Songs About Jane\n       ', 'Maroon 5 / 2002 / 专辑 / Audio CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            Back To Black\n       ', 'Amy Winehouse / 2006-11-30 / 专辑 / Audio CD / 放克/灵歌/R&B', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            Demo 3\n       ', '陈绮贞 / 2001-11-09 / Demo / CD / 流行', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            克卜勒\n                ', '孙燕姿 / 2014-02-27 / 专辑 / CD / 流行', '8.4');
INSERT INTO `doubanmusic` VALUES ('\n            E=MC²\n                ', 'Mariah Carey / 2008-04-16 / 专辑 / CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            9 Crimes\n       ', 'Damien Rice / 2006-11-27 / 单曲 / Audio CD / 民谣', '9.4');
INSERT INTO `doubanmusic` VALUES ('\n            如果有一件事是重要的\n                ', '陈珊妮 / 2008-11-22 / 专辑 / CD / 流行', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            赤裸裸\n                ', '郑钧 / 1994 / 专辑 / CD / 摇滚', '8.8');
INSERT INTO `doubanmusic` VALUES ('\n            阿岳正传\n                ', '张震岳 / 2004-06-24 / 选集 / CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            3颗猫饼干\n                ', '朱玫玲,董運昌,王雁盟,何真真 / 2004/04/26 / CD', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            21 Guns\n       ', 'Green Day / 2009-07-14 / Single / Audio CD', '9.2');
INSERT INTO `doubanmusic` VALUES ('\n            看我72变\n       ', '蔡依林 Jolin Tsai / 2003-03-07 / 专辑 / CD / 流行', '8.2');
INSERT INTO `doubanmusic` VALUES ('\n            第二人生 明日版\n                ', '五月天 / 2011-12-20 / 专辑 / CD / 流行', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            Definitely Maybe\n                ', 'Oasis / 1994-08-30 / 专辑 / CD / 摇滚', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            First Love\n                ', '宇多田ヒカル / 1999 / 专辑 / CD / 流行', '9.1');
INSERT INTO `doubanmusic` VALUES ('\n            阿密特\n                ', '张惠妹 / 2009-06-26 / 专辑 / CD / 流行', '7.7');
INSERT INTO `doubanmusic` VALUES ('\n            心·跳\n                ', '王力宏 Leehom Wang / 2008-12-26 / 专辑 / CD / 流行', '7.1');
INSERT INTO `doubanmusic` VALUES ('\n            xx\n       ', 'The xx / 2009-08-17 / 专辑 / CD / 摇滚', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            回蔚\n       ', '莫文蔚 / 2009-06-23 / 专辑 / CD+DVD / 流行', '8.0');
INSERT INTO `doubanmusic` VALUES ('\n            如果看見地獄，我就不怕魔鬼\n                ', 'Tizzy Bac / 2009-02-13 / 专辑 / CD / 流行', '8.1');
INSERT INTO `doubanmusic` VALUES ('\n            我们是五月天\n       ', '五月天 / 2003年4月17日 / 专辑 / CD', '9.3');
INSERT INTO `doubanmusic` VALUES ('\n            王妃\n                ', '萧敬腾 / 2009-07-17 / 专辑 / CD / 流行', '7.7');
INSERT INTO `doubanmusic` VALUES ('\n            Poker Face\n                ', 'Lady Gaga / September 23, 2008 / Single / Audio CD', '8.7');
INSERT INTO `doubanmusic` VALUES ('\n            唐朝\n                ', '唐朝 / 1992-12 / CD＋DVD / CD / 摇滚', '9.0');
INSERT INTO `doubanmusic` VALUES ('\n            寻找周杰伦\n       ', '周杰伦 / 2003-12-1 / EP / 音乐CD / 流行', '8.5');
INSERT INTO `doubanmusic` VALUES ('\n            她说\n                ', '林俊杰 / 2010-12-08 / 专辑 / CD / 流行', '7.7');

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
INSERT INTO `testmodel_test` VALUES ('1', '\n            We Sing. We Dance. We Steal Things.\n       ', 'Jason Mraz / 2008-05-13 / Import / Audio CD / 民谣', '9.1');
INSERT INTO `testmodel_test` VALUES ('2', '\n            Viva La Vida\n                ', 'Coldplay / 2008-06-17 / 专辑 / CD / 摇滚', '8.7');
INSERT INTO `testmodel_test` VALUES ('3', '\n            华丽的冒险\n                ', '陈绮贞 / 2005-09-23 / 专辑 / CD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('4', '\n            范特西\n                ', '周杰伦 / 2001-09-14 / 专辑 / CD / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('5', '\n            後。青春期的詩\n                ', '五月天 / 2008-10-23 / 专辑 / CD / 摇滚', '8.8');
INSERT INTO `testmodel_test` VALUES ('6', '\n            是时候\n                ', '孙燕姿 / 2011-03-08 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('7', '\n            Lenka\n       ', 'Lenka / 2008-09-23 / 专辑 / Audio CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('8', '\n            Start from Here\n                ', '王若琳 / 2008-01-11 / 专辑 / CD / 爵士', '8.7');
INSERT INTO `testmodel_test` VALUES ('9', '\n            旅行的意义\n       ', '陈绮贞 / 2004-02-02 / 单曲 / CD / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('10', '\n            太阳\n                ', '陈绮贞 / 2009-01-22 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('11', '\n            Once (Soundtrack)\n                ', 'Glen Hansard,Marketa Irglova / 2007-05-22 / Soundtrack / CD / 原声', '9.1');
INSERT INTO `testmodel_test` VALUES ('12', '\n            Not Going Anywhere\n                ', 'Keren Ann / 2004-08-24 / Import / Audio CD / 民谣', '8.9');
INSERT INTO `testmodel_test` VALUES ('13', '\n            American Idiot\n       ', 'Green Day / 2004-09-21 / Explicit Lyrics / Audio CD / 摇滚', '8.9');
INSERT INTO `testmodel_test` VALUES ('14', '\n            思念是一种病\n                ', '张震岳 Csun Yuk / 2007-07-06 / 专辑 / CD / 流行', '8.8');
INSERT INTO `testmodel_test` VALUES ('15', '\n            無與倫比的美麗\n                ', '苏打绿 / 2007-11-02 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('16', '\n            亲爱的...我还不知道\n                ', '张悬 / 2007-07-20 / 专辑 / CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('17', '\n            城市\n                ', '张悬 / 2009-05-22 / 专辑 / CD / 流行', '8.3');
INSERT INTO `testmodel_test` VALUES ('18', '\n            O\n       ', 'Damien Rice / 2003 / 专辑 / CD / 流行', '9.1');
INSERT INTO `testmodel_test` VALUES ('19', '\n            Wake Me Up When September Ends\n                ', 'Green Day / 2005-06-13 / 单曲 / CD / 摇滚', '9.3');
INSERT INTO `testmodel_test` VALUES ('20', '\n            叶惠美\n                ', '周杰伦 / 2003-07-31 / 专辑 / CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('21', '\n            七里香\n                ', '周杰伦 / 2004 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('22', '\n            21\n       ', 'Adele / 2011-02-01 / 专辑 / CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('23', '\n            My Life Will...\n       ', '张悬 / 2006-06-09 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('24', '\n            寓言\n       ', '王菲 / 2000 / 专辑 / CD / 流行', '9.3');
INSERT INTO `testmodel_test` VALUES ('25', '\n            你在煩惱什麼\n                ', '苏打绿 / 2011-11-11 / 专辑 / CD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('26', '\n            感官/世界\n                ', '林宥嘉 / 2009-10-30 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('27', '\n            Nevermind\n       ', 'Nirvana / 1991 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `testmodel_test` VALUES ('28', '\n            八度空间\n                ', '周杰伦 / 2002-07-19 / 专辑 / CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('29', '\n            Jay\n       ', '周杰伦 / 2000-11-13 / 专辑 / Audio CD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('30', '\n            Parachutes\n       ', 'Coldplay / 2000-07-10 / 专辑 / CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('31', '\n            我要的幸福\n                ', '孙燕姿 / 2000-12-7 / 专辑 / CD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('32', '\n            还是会寂寞\n                ', '陈绮贞 / 2000 / 专辑 / CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('33', '\n            Let Go\n       ', 'Avril Lavigne / 2002 / Enhanced / Audio CD / 摇滚', '8.8');
INSERT INTO `testmodel_test` VALUES ('34', '\n            十一月的萧邦\n                ', '周杰伦 / 2005-11-01 / 专辑 / CD / 流行', '7.9');
INSERT INTO `testmodel_test` VALUES ('35', '\n            橙月\n                ', '方大同 / 2008-12-19 / 专辑 / CD / 放克/灵歌/R&B', '8.5');
INSERT INTO `testmodel_test` VALUES ('36', '\n            小宇宙\n       ', '苏打绿 / 2006-10-20 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('37', '\n            若你碰到他\n                ', '蔡健雅 / 2009-08-19 / 专辑 / CD / 流行', '8.0');
INSERT INTO `testmodel_test` VALUES ('38', '\n            Lady & Bird\n       ', 'Lady & Bird / 2003 / Import / Audio CD / 民谣', '8.8');
INSERT INTO `testmodel_test` VALUES ('39', '\n            万能青年旅店\n       ', '万能青年旅店 / 2010-11-12 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `testmodel_test` VALUES ('40', '\n            Meteora\n                ', 'Linkin Park / 2003-03-25 / Enhanced / Audio CD / 摇滚', '9.0');
INSERT INTO `testmodel_test` VALUES ('41', '\n            Back To Bedlam\n                ', 'James Blunt / 2004 / Explicit Lyrics / Audio CD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('42', '\n            苏打绿\n       ', '苏打绿,蘇打綠 / 2005年9月 / 国语 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('43', '\n            静茹&情歌 别再为他流泪\n                ', '梁静茹 / 2009-01-16 / 专辑 / Audio CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('44', '\n            美妙生活\n                ', '林宥嘉 / 2011-05-06 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('45', '\n            Le Fabuleux destin d\'Amélie Poulain\n                ', 'Yann Tiersen / 2001-04-23 / Soundtrack / Audio CD / 原声', '9.3');
INSERT INTO `testmodel_test` VALUES ('46', '\n            Joanna & 王若琳\n       ', '王若琳 / 2009-01-16 / 专辑 / CD', '8.1');
INSERT INTO `testmodel_test` VALUES ('47', '\n            A Plea En Vendredi\n       ', 'Tamas Wells / 2006 / Import / Audio CD / 民谣', '9.0');
INSERT INTO `testmodel_test` VALUES ('48', '\n            To Hebe\n                ', '田馥甄 Hebe / 2010-09-03 / 专辑 / CD / 流行', '8.0');
INSERT INTO `testmodel_test` VALUES ('49', '\n            逆光\n                ', '孙燕姿 / 2007-03-22 / Import / CD / 流行', '8.3');
INSERT INTO `testmodel_test` VALUES ('50', '\n            只爱陌生人\n       ', '王菲 / 1999-09-10 / Import / CD / 流行', '9.3');
INSERT INTO `testmodel_test` VALUES ('51', '\n            Music For Tourists\n       ', 'Chris Garneau / 2007-01-23 / 引进版 / Audio CD / 民谣', '8.7');
INSERT INTO `testmodel_test` VALUES ('52', '\n            The Moment\n                ', '孙燕姿 / 2003-08-22 / 专辑 / CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('53', '\n            七\n       ', '陈奕迅 / 2003-11-20 / 选集 / CD / 流行', '9.4');
INSERT INTO `testmodel_test` VALUES ('54', '\n            春·日光\n                ', '苏打绿 / 2009-05-08 / 专辑 / CD / 摇滚', '8.0');
INSERT INTO `testmodel_test` VALUES ('55', '\n            100种生活\n       ', '盧廣仲 / 2008-5-27 / 专辑 / CD / 民谣', '8.3');
INSERT INTO `testmodel_test` VALUES ('56', '\n            崇拜\n                ', '梁静茹 / 2007-11-09 / 专辑 / CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('57', '\n            陈绮贞精选\n                ', '陈绮贞 / 2005 / 选集 / CD / 民谣', '9.2');
INSERT INTO `testmodel_test` VALUES ('58', '\n            菊次郎の夏\n                ', 'Joe Hisaishi / 1999-05-19 / 专辑 / CD / 原声', '9.4');
INSERT INTO `testmodel_test` VALUES ('59', '\n            Fearless\n       ', 'Taylor Swift / 2008-11-11 / Enhanced / Audio CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('60', '\n            Life In Cartoon Motion\n       ', 'Mika / 2007-02-05 / 专辑 / CD / 流行', '8.8');
INSERT INTO `testmodel_test` VALUES ('61', '\n            H³M\n                ', '陈奕迅 / 2009-03-23 / 专辑 / CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('62', '\n            神秘嘉宾\n                ', '林宥嘉 / 2008-06-03 / 专辑 / CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('63', '\n            Les Choristes\n                ', 'Bruno Coulais / 2004-05-03 / Soundtrack / Audio CD', '9.4');
INSERT INTO `testmodel_test` VALUES ('64', '\n            赤子\n                ', '范晓萱&100% / 2009-08-10 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('65', '\n            9\n       ', 'Damien Rice / 2006-11-06 / 专辑 / Audio CD / 民谣', '8.9');
INSERT INTO `testmodel_test` VALUES ('66', '\n            将爱\n       ', '王菲 / 2003 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('67', '\n            遇见我\n                ', '曹方 / 2005年12月 / 专辑 / CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('68', '\n            梵高先生\n                ', '李志 / 2007-01-11 / CD / CD / 民谣', '8.9');
INSERT INTO `testmodel_test` VALUES ('69', '\n            Timeless 可啦思刻\n                ', '方大同 / 2009-08-11 / 自选集 / CD / 放克/灵歌/R&B', '8.3');
INSERT INTO `testmodel_test` VALUES ('70', '\n            依然范特西\n                ', '周杰伦 / 2006-09-05 / 专辑 / CD / 流行', '7.7');
INSERT INTO `testmodel_test` VALUES ('71', '\n            风筝\n                ', '孙燕姿 / 2001-07-09 / 专辑 / CD / 流行', '8.8');
INSERT INTO `testmodel_test` VALUES ('72', '\n            完美的一天\n                ', '孙燕姿 / 2005-10-07 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('73', '\n            Say I Am You\n       ', 'The Weepies / 2006 / Import / Audio CD / 民谣', '8.5');
INSERT INTO `testmodel_test` VALUES ('74', '\n            黑色柳丁\n                ', '陶喆 / 2002 / 专辑 / CD / 流行', '8.8');
INSERT INTO `testmodel_test` VALUES ('75', '\n            Under My Skin\n                ', 'Avril Lavigne / 2004-05-12 / Import / Audio CD / 摇滚', '8.5');
INSERT INTO `testmodel_test` VALUES ('76', '\n            Stefanie\n       ', '孙燕姿 / 2004-10-1 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('77', '\n            The Fame\n       ', 'Lady Gaga / 2008-08-19 / Import / Audio CD / 电子', '8.3');
INSERT INTO `testmodel_test` VALUES ('78', '\n            Mr. A-Z\n                ', 'Jason Mraz / 2005-07-04 / Import / Audio CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('79', '\n            为爱而生\n                ', '五月天 / 2006-12-28 / 引进版 / CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('80', '\n            Daniel Powter\n                ', 'Daniel Powter / 2006 / 专辑 / Audio CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('81', '\n            I\'m Yours\n       ', 'Jason Mraz / 2008-12-16 / Single / Audio CD / 民谣', '9.4');
INSERT INTO `testmodel_test` VALUES ('82', '\n            在动物园散步才是正经事\n       ', 'My Little Airport / 2004-08-07 / 专辑 / CD / 流行', '8.2');
INSERT INTO `testmodel_test` VALUES ('83', '\n            时光·漫步\n       ', '许巍 Wei Xu / 2002-12-01 / 专辑 / CD / 民谣', '8.9');
INSERT INTO `testmodel_test` VALUES ('84', '\n            生如夏花\n                ', '朴树 / 2003-11-28 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('85', '\n            我很忙\n                ', '周杰伦 / 2007-11-01 / 专辑 / CD / 流行', '7.3');
INSERT INTO `testmodel_test` VALUES ('86', '\n            夏 / 狂热\n                ', '苏打绿 / 2009-09-11 / 专辑 / CD / 摇滚', '8.3');
INSERT INTO `testmodel_test` VALUES ('87', '\n            绝世名伶\n       ', '范晓萱 / 2001-08-25 / 专辑 / CD / 爵士', '8.8');
INSERT INTO `testmodel_test` VALUES ('88', '\n            哼一首歌 等日落\n       ', '曹方 / 2009-11-11 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('89', '\n            未完成\n                ', '孙燕姿 / 2003-01-10 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('90', '\n            OK Computer\n       ', 'Radiohead / 1997 / 专辑 / Audio CD / 摇滚', '9.2');
INSERT INTO `testmodel_test` VALUES ('91', '\n            Born to Die\n                ', 'Lana Del Rey / 2012-01-31 / 专辑 / Audio CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('92', '\n            The Wall\n                ', 'Pink Floyd / 1979 / 专辑 / Audio CD / 摇滚', '9.1');
INSERT INTO `testmodel_test` VALUES ('93', '\n            不要停止我的音乐\n                ', '痛仰 / 2008-10 / 专辑 / CD / 摇滚', '8.6');
INSERT INTO `testmodel_test` VALUES ('94', '\n            Hybrid Theory\n                ', 'Linkin Park / 2000 / 专辑 / CD / 摇滚', '8.9');
INSERT INTO `testmodel_test` VALUES ('95', '\n            MTV Unplugged in New York\n       ', 'Nirvana / 1994-11-01 / Live / Audio CD / 摇滚', '9.5');
INSERT INTO `testmodel_test` VALUES ('96', '\n            After 17\n       ', '陈绮贞 / 2004年12月 / EP / CD / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('97', '\n            In Between Dreams\n       ', 'Jack Johnson / 2005-03-22 / 专辑 / Audio CD / 民谣', '9.0');
INSERT INTO `testmodel_test` VALUES ('98', '\n            神的孩子都在跳舞\n       ', '五月天 Mayday / 2004-11-05 / 专辑 / CD+VCD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('99', '\n            离开地球表面Jump!\n       ', '五月天 / 2007-07-20 / 专辑 / CD+DVD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('100', '\n            不想放手\n                ', '陈奕迅 / 2008-06-30 / 专辑 / CD / 流行', '8.3');
INSERT INTO `testmodel_test` VALUES ('101', '\n            我的歌声里\n       ', '曲婉婷 / 2010-02-24 / 单曲 / 数字(Digital) / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('102', '\n            The Legend of 1900\n                ', 'Ennio Morricone / 1999-10-12 / Soundtrack / Audio CD', '9.4');
INSERT INTO `testmodel_test` VALUES ('103', '\n            孤独的人是可耻的\n       ', '张楚 / 1994 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `testmodel_test` VALUES ('104', '\n            徐佳瑩La La首张创作专辑\n                ', '徐佳莹 / 2009-05-29 / 专辑 / CD / 流行', '8.2');
INSERT INTO `testmodel_test` VALUES ('105', '\n            The Best Damn Thing\n       ', 'Avril Lavigne / 2007-04-17 / Import / Audio CD / 流行', '7.7');
INSERT INTO `testmodel_test` VALUES ('106', '\n            知足 just my pride 最真杰作选\n       ', '五月天 / 2005-11-18 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `testmodel_test` VALUES ('107', '\n            1\n                ', 'The Beatles / 2000 / 专辑 / CD / 摇滚', '9.4');
INSERT INTO `testmodel_test` VALUES ('108', '\n            魔杰座\n       ', '周杰伦 / 2008-10-09 / 专辑 / CD / 流行', '6.9');
INSERT INTO `testmodel_test` VALUES ('109', '\n            X&Y\n       ', 'Coldplay / 2005-06-07 / 专辑 / CD / 摇滚', '8.4');
INSERT INTO `testmodel_test` VALUES ('110', '\n            19\n       ', 'Adele / 2008-01-28 / Import / Audio CD / 放克/灵歌/R&B', '8.3');
INSERT INTO `testmodel_test` VALUES ('111', '\n            我们在炎热与抑郁的夏天，无法停止抽烟\n                ', 'My Little Airport / 2007-10-10 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('112', '\n            时光机\n                ', '五月天 / 2003-11-11 / 专辑 / CD / 摇滚', '9.0');
INSERT INTO `testmodel_test` VALUES ('113', '\n            Yan Zi\n                ', '孙燕姿 / 2000-06-08 / 专辑 / CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('114', '\n            Time Flies\n                ', '陈奕迅 / 2010-03-12 / EP / CD+DVD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('115', '\n            失败者的飞翔\n       ', '陈绮贞 / 2008-07-13 / 单曲 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('116', '\n            My Love\n       ', '田馥甄 / 2011-09-02 / 专辑 / CD / 流行', '8.0');
INSERT INTO `testmodel_test` VALUES ('117', '\n            亲亲\n                ', '梁静茹 / 2006-10-06 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('118', '\n            你王菲所以我王菲\n       ', '王菲 / 2002 / 选集 / CD / 流行', '9.4');
INSERT INTO `testmodel_test` VALUES ('119', '\n            Stranger Under My Skin\n       ', '陈奕迅 / 2011-02-22 / EP / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('120', '\n            Come Away with Me\n                ', 'Norah Jones / 2002 / 专辑 / CD / 爵士', '8.8');
INSERT INTO `testmodel_test` VALUES ('121', '\n            平凡之路\n                ', '朴树 / 2014-07-16 / 单曲 / 数字(Digital)', '8.9');
INSERT INTO `testmodel_test` VALUES ('122', '\n            认了吧\n                ', '陈奕迅 / 2007-04-24 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('123', '\n            21st Century Breakdown\n       ', 'Green Day / 2009-05-15 / 专辑 / CD / 摇滚', '8.5');
INSERT INTO `testmodel_test` VALUES ('124', '\n            神的游戏\n                ', '張懸 / 2012-08-10 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('125', '\n            唱游\n       ', '王菲 / 1998 / 專輯 / CD / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('126', '\n            花的姿态：演唱会经典实录\n                ', '陈绮贞 / 2007-05-18 / 演唱会/Live / CD DVD', '9.2');
INSERT INTO `testmodel_test` VALUES ('127', '\n            我去2000年\n       ', '朴树 / 1999-1 / 专辑 / CD / 流行', '9.1');
INSERT INTO `testmodel_test` VALUES ('128', '\n            Young For You\n       ', 'GALA / 2004 / 专辑 / CD / 摇滚', '8.7');
INSERT INTO `testmodel_test` VALUES ('129', '\n            自选集\n                ', '孙燕姿 / 2002年1月 / 专辑 / CD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('130', '\n            理性与感性 作品音乐会\n                ', '李宗盛 Jonathan / 2007-09-28 / 专辑 / CD / 流行', '9.5');
INSERT INTO `testmodel_test` VALUES ('131', '\n            比天空还远\n       ', '曹方 / 2007-11-20 / EP / CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('132', '\n            黑梦\n       ', '窦唯 / 1994-10 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `testmodel_test` VALUES ('133', '\n            介乎法國與旺角的詩意\n                ', 'My Little Airport / 2009-11-20 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('134', '\n            不能说的秘密\n                ', '周杰倫,Terdsak Janpan,詹宇豪,陳承麒,黃婉琦,姚蘇蓉,黃俊郎,江語晨,長榮交響樂團 / 2007-08-13 / Soundtrack / CD', '8.7');
INSERT INTO `testmodel_test` VALUES ('135', '\n            丝路\n                ', '梁静茹 Fish / 2005-9-16 / 专辑 / CD / 流行', '8.2');
INSERT INTO `testmodel_test` VALUES ('136', '\n            All The Lost Souls\n                ', 'James Blunt / 2007-09-18 / Import / Audio CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('137', '\n            F.I.R.\n       ', 'F.I.R.,飞儿乐团 / 2004-04-29 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('138', '\n            上五楼的快活\n       ', '陈奕迅 / 2009-09-23 / 专辑 / CD / 流行', '7.7');
INSERT INTO `testmodel_test` VALUES ('139', '\n            Minutes to Midnight\n       ', 'Linkin Park / 2007-05-15 / 专辑 / CD / 摇滚', '8.2');
INSERT INTO `testmodel_test` VALUES ('140', '\n            GOODBYE & HELLO\n       ', '蔡健雅,Tanya / 2007-10-19 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('141', '\n            Someone Like You\n                ', 'Adele / 2011-01-24 / 单曲 / 数字(Digital) / 放克/灵歌/R&B', '9.5');
INSERT INTO `testmodel_test` VALUES ('142', '\n            迟到千年\n       ', '苏打绿 / 2006-09-18 / EP / CD / 流行', '8.8');
INSERT INTO `testmodel_test` VALUES ('143', '\n            The Dark Side of the Moon\n       ', 'Pink Floyd / 1973 / 专辑 / 黑胶 / 摇滚', '9.1');
INSERT INTO `testmodel_test` VALUES ('144', '\n            王菲 2001\n                ', '王菲 / 2001 / 专辑 / CD / 流行', '9.1');
INSERT INTO `testmodel_test` VALUES ('145', '\n            夜空中最亮的星\n       ', '逃跑计划 / 2011-04-12 / 单曲 / 数字(Digital) / 流行', '9.5');
INSERT INTO `testmodel_test` VALUES ('146', '\n            追梦痴子心\n       ', 'GALA / 2011-03-24 / 专辑 / CD / 摇滚', '8.8');
INSERT INTO `testmodel_test` VALUES ('147', '\n            宝贝\n       ', '莫文蔚 / 2010-07-26 / 专辑 / CD / 流行', '7.9');
INSERT INTO `testmodel_test` VALUES ('148', '\n            黑白灰\n                ', '陈奕迅 / 2003 / 专辑 / CD / 流行', '9.1');
INSERT INTO `testmodel_test` VALUES ('149', '\n            安和桥北\n                ', '宋冬野 / 2013-08-26 / 专辑 / CD / 民谣', '8.7');
INSERT INTO `testmodel_test` VALUES ('150', '\n            Prisoner of Love\n                ', '宇多田ヒカル / 2008-05-21 / CD IMPORT / Audio CD / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('151', '\n            Groupies 吉他手\n                ', '陈绮贞 / 2002-08-02 / 专辑 / CD / 流行', '9.1');
INSERT INTO `testmodel_test` VALUES ('152', '\n            Now The Day Is Over\n                ', 'The Innocence Mission / 2004 / 专辑 / CD / 民谣', '8.4');
INSERT INTO `testmodel_test` VALUES ('153', '\n            Apologize\n       ', 'Timbaland,OneRepublic / 2007-11-06 / Single / Audio CD / 放克/灵歌/R&B', '9.2');
INSERT INTO `testmodel_test` VALUES ('154', '\n            阿菲正传\n                ', '王菲 / 2009-06-25 / 选集 / CD / 流行', '9.4');
INSERT INTO `testmodel_test` VALUES ('155', '\n            跨时代\n       ', '周杰伦 / 2010-05-14 / 专辑 / CD / 流行', '7.0');
INSERT INTO `testmodel_test` VALUES ('156', '\n            Leave\n                ', '孙燕姿 / 2002-5-21 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('157', '\n            被禁忌的游戏\n       ', '李志 / 2004-12 / 专辑 / CD / 民谣', '8.8');
INSERT INTO `testmodel_test` VALUES ('158', '\n            What\'s Going On....?\n       ', '陈奕迅 / 2006 / 专辑 / CD / 流行', '9.1');
INSERT INTO `testmodel_test` VALUES ('159', '\n            第二人生 末日版\n                ', '五月天 / 2011-12-20 / 专辑 / CD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('160', '\n            樂之路\n                ', '陶喆 / 2003-08-08 / 选集 / CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('161', '\n            It Won\'t Be Soon Before Long\n                ', 'Maroon 5 / 2007-05-22 / 专辑 / CD / 流行', '8.2');
INSERT INTO `testmodel_test` VALUES ('162', '\n            如果你冷\n                ', '张悬 / 2008-10-20 / Bootleg / 数字 / 民谣', '8.3');
INSERT INTO `testmodel_test` VALUES ('163', '\n            陌生人\n       ', '蔡健雅 Tanya Chua / 2003-06-00 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('164', '\n            浮躁\n       ', '王菲 / 1996 / 港版 / Audio CD / 摇滚', '9.2');
INSERT INTO `testmodel_test` VALUES ('165', '\n            C\'est La Vie\n                ', '自然卷 / 2004 / 专辑 / CD / 民谣', '8.2');
INSERT INTO `testmodel_test` VALUES ('166', '\n            在一起\n                ', '刘若英 / 2010-04-16 / 专辑 / CD / 流行', '7.8');
INSERT INTO `testmodel_test` VALUES ('167', '\n            These Friends Of Mine\n       ', 'Rosie Thomas / 2007-03-13 / 专辑 / Audio CD / 民谣', '8.7');
INSERT INTO `testmodel_test` VALUES ('168', '\n            陪我歌唱\n                ', '苏打绿 / 2008 / 引进版 / CD', '9.1');
INSERT INTO `testmodel_test` VALUES ('169', '\n            It\'s Not Me, It\'s You\n                ', 'Lily Allen / 2009-02-09 / 专辑 / Audio CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('170', '\n            The Rose~I Love Cinemas~\n       ', '手嶌葵 / 2008-03-05 / Import / CD / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('171', '\n            我爱南京\n       ', '李志 / 2009-10-16 / 专辑 / CD / 民谣', '8.6');
INSERT INTO `testmodel_test` VALUES ('172', '\n            消失的光年\n                ', '大乔小乔 / 2007-07-12 / 平装版 / CD / 民谣', '8.2');
INSERT INTO `testmodel_test` VALUES ('173', '\n            还有别的办法吗\n       ', '范晓萱 / 2004 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('174', '\n            日光倾城\n       ', '卡奇社 / 2007-04-20 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('175', '\n            A Little Love\n                ', '冯曦妤 / 2008-11-20 / 专辑 / CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('176', '\n            Yellow\n                ', 'Coldplay / 2000-07-03 / EP / Audio CD / 摇滚', '9.3');
INSERT INTO `testmodel_test` VALUES ('177', '\n            Hopes And Fears\n       ', 'Keane / 2004 / 专辑 / Audio CD / 摇滚', '8.9');
INSERT INTO `testmodel_test` VALUES ('178', '\n            U87\n       ', '陈奕迅 / 2005-06-07 / 专辑 / CD+DVD / 流行', '9.3');
INSERT INTO `testmodel_test` VALUES ('179', '\n            Lady Sleep\n       ', 'Maximilian Hecker / 2005 / Import / Audio CD / 民谣', '8.8');
INSERT INTO `testmodel_test` VALUES ('180', '\n            天空の城ラピュタ サウンドトラック 飛行石の謎\n                ', '久石譲(Joe Hisaishi),杉並児童合唱団,井上杏美 / 1993-12-21 / Soundtrack / Audio CD / 原声', '9.5');
INSERT INTO `testmodel_test` VALUES ('181', '\n            新长征路上的摇滚\n       ', '崔健 / 1989 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `testmodel_test` VALUES ('182', '\n            小飞行\n       ', '棉花糖,katncandix2 / 2009-05-01 / 专辑 / CD / 民谣', '7.9');
INSERT INTO `testmodel_test` VALUES ('183', '\n            春生\n       ', '好妹妹乐队 / 2012-07-01 / 专辑 / CD / 民谣', '8.8');
INSERT INTO `testmodel_test` VALUES ('184', '\n            讓我想一想\n                ', '陈绮贞 / 1998-07-14 / 专辑 / CD / 民谣', '9.0');
INSERT INTO `testmodel_test` VALUES ('185', '\n            未来\n                ', '方大同 / 2007-12-28 / 专辑 / CD / 放克/灵歌/R&B', '8.3');
INSERT INTO `testmodel_test` VALUES ('186', '\n            爱爱爱\n                ', '方大同 / 2006-12 / 专辑 / CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('187', '\n            世界\n                ', '逃跑计划 / 2011-12-31 / 专辑 / CD / 摇滚', '9.0');
INSERT INTO `testmodel_test` VALUES ('188', '\n            七天\n                ', '盧廣仲,卢广仲 / 2009-10-30 / 专辑 / CD / 民谣', '7.8');
INSERT INTO `testmodel_test` VALUES ('189', '\n            Nirvana\n       ', 'Nirvana / 2002-10-29 / Extra tracks / Audio CD / 摇滚', '9.2');
INSERT INTO `testmodel_test` VALUES ('190', '\n            A Rush of  Blood to the Head\n                ', 'Coldplay / 2002 / 专辑 / Audio CD / 流行', '8.6');
INSERT INTO `testmodel_test` VALUES ('191', '\n            The Velvet Underground & Nico\n                ', 'The Velvet Underground,Nico / 1967-04 / 专辑 / CD / 摇滚', '9.0');
INSERT INTO `testmodel_test` VALUES ('192', '\n            Love The Way You Lie\n                ', 'Eminem,Rihanna / 2010-08-20 / Single / Audio CD / 说唱', '9.3');
INSERT INTO `testmodel_test` VALUES ('193', '\n            天空\n                ', '王菲 / 1994 / 专辑 / CD / 流行', '9.3');
INSERT INTO `testmodel_test` VALUES ('194', '\n            The Boat That Rocked\n       ', 'Original Soundtrack / 2009-03-30 / Import / Soundtrack / CD / 原声', '9.2');
INSERT INTO `testmodel_test` VALUES ('195', '\n            (What\'s The Story) Morning Glory?\n       ', 'Oasis / 1995 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `testmodel_test` VALUES ('196', '\n            PUSSY\n       ', '陈绮贞 / 2007-02-08 / 单曲 / Audio CD / 民谣', '8.7');
INSERT INTO `testmodel_test` VALUES ('197', '\n            呼吸\n                ', 'Salyu / 2001 / 专辑 / CD / 原声', '9.0');
INSERT INTO `testmodel_test` VALUES ('198', '\n            Fallen\n       ', 'Evanescence / 2003 / 专辑 / Audio CD / 摇滚', '8.5');
INSERT INTO `testmodel_test` VALUES ('199', '\n            黑豹\n       ', '黑豹 / 1992-12-01 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `testmodel_test` VALUES ('200', '\n            十年一刻\n       ', '苏打绿 / 2010-08-27 / 视频 / CD+DVD / 流行', '8.8');
INSERT INTO `testmodel_test` VALUES ('201', '\n            恋爱的力量\n       ', '梁静茹 / 2003年3月 / 专辑 / CD / 流行', '8.9');
INSERT INTO `testmodel_test` VALUES ('202', '\n            Suede\n       ', 'Suede / 1993 / 专辑 / CD / 摇滚', '8.9');
INSERT INTO `testmodel_test` VALUES ('203', '\n            The Bends\n       ', 'Radiohead / 1995 / 专辑 / CD / 摇滚', '9.1');
INSERT INTO `testmodel_test` VALUES ('204', '\n            琵琶相\n                ', '林海 / 2004 / 专辑 / CD / 轻音乐', '9.3');
INSERT INTO `testmodel_test` VALUES ('205', '\n            ？\n                ', '陈奕迅 / 2011-11-11 / 专辑 / CD / 流行', '8.0');
INSERT INTO `testmodel_test` VALUES ('206', '\n            少年故事\n       ', '彭坦 / 2007-07-23 / 专辑 / CD / 流行', '8.0');
INSERT INTO `testmodel_test` VALUES ('207', '\n            黑暗之光\n       ', '雷光夏 / 2006-12-01 / 专辑 / CD / 民谣', '8.8');
INSERT INTO `testmodel_test` VALUES ('208', '\n            我要我们在一起\n       ', '范晓萱 / 1999-11-1 / 国语 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('209', '\n            人生海海\n       ', '五月天 / 2001-07-06 / 专辑 / CD / 摇滚', '9.2');
INSERT INTO `testmodel_test` VALUES ('210', '\n            Maybe I\'m Dreaming\n                ', 'Owl City / 2008-03-18 / Import / CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('211', '\n            工体东路没有人\n       ', '李志 / 2009-01-22 / 专辑 / 数字 / 民谣', '9.0');
INSERT INTO `testmodel_test` VALUES ('212', '\n            Let It Be\n       ', 'The Beatles / 1990-10-25 / Enhanced / Audio CD / 摇滚', '9.3');
INSERT INTO `testmodel_test` VALUES ('213', '\n            Alright,Still\n       ', 'Lily Allen / 2006 / Import / Audio CD / 流行', '8.3');
INSERT INTO `testmodel_test` VALUES ('214', '\n            大小說家\n                ', '林宥嘉 / 2012-06-22 / 专辑 / CD / 流行', '7.9');
INSERT INTO `testmodel_test` VALUES ('215', '\n            越长大越孤单\n       ', '牛奶@咖啡 / 2008-03-18 / 专辑 / CD / 流行', '7.6');
INSERT INTO `testmodel_test` VALUES ('216', '\n            燕尾蝶\n                ', '梁静茹 / 2004 / 专辑 / CD / 流行', '8.0');
INSERT INTO `testmodel_test` VALUES ('217', '\n            原谅我就是这样的女生\n                ', '戴佩妮 / 2009-05-16 / 专辑 / CD+DVD / 流行', '7.6');
INSERT INTO `testmodel_test` VALUES ('218', '\n            传奇\n       ', '王菲 / 2010-11-05 / 单曲 / CD / 民谣', '9.2');
INSERT INTO `testmodel_test` VALUES ('219', '\n            Under the Radar\n                ', 'Daniel Powter / 2008-10-14 / 专辑 / Audio CD / 流行', '8.3');
INSERT INTO `testmodel_test` VALUES ('220', '\n            知足 MV / Karaoke DVD\n       ', '五月天 / 2006 / 视频 / DVD / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('221', '\n            我的歌声里\n       ', '曲婉婷 / 2012-07-01 / 专辑 / CD / 流行', '7.7');
INSERT INTO `testmodel_test` VALUES ('222', '\n            王菲\n                ', '王菲 / 1997-09-30 / 专辑 / CD / 流行', '9.2');
INSERT INTO `testmodel_test` VALUES ('223', '\n            信仰在空中飘扬\n       ', '汪峰 / 2009-07-25 / 专辑 / CD / 摇滚', '8.7');
INSERT INTO `testmodel_test` VALUES ('224', '\n            [i]\n                ', '莫文蔚 / 2002-04-29 / 专辑 / CD / 流行', '8.7');
INSERT INTO `testmodel_test` VALUES ('225', '\n            Songs About Jane\n       ', 'Maroon 5 / 2002 / 专辑 / Audio CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('226', '\n            Back To Black\n       ', 'Amy Winehouse / 2006-11-30 / 专辑 / Audio CD / 放克/灵歌/R&B', '8.5');
INSERT INTO `testmodel_test` VALUES ('227', '\n            Demo 3\n       ', '陈绮贞 / 2001-11-09 / Demo / CD / 流行', '9.1');
INSERT INTO `testmodel_test` VALUES ('228', '\n            克卜勒\n                ', '孙燕姿 / 2014-02-27 / 专辑 / CD / 流行', '8.4');
INSERT INTO `testmodel_test` VALUES ('229', '\n            E=MC²\n                ', 'Mariah Carey / 2008-04-16 / 专辑 / CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('230', '\n            9 Crimes\n       ', 'Damien Rice / 2006-11-27 / 单曲 / Audio CD / 民谣', '9.4');
INSERT INTO `testmodel_test` VALUES ('231', '\n            如果有一件事是重要的\n                ', '陈珊妮 / 2008-11-22 / 专辑 / CD / 流行', '8.2');
INSERT INTO `testmodel_test` VALUES ('232', '\n            赤裸裸\n                ', '郑钧 / 1994 / 专辑 / CD / 摇滚', '8.8');
INSERT INTO `testmodel_test` VALUES ('233', '\n            阿岳正传\n                ', '张震岳 / 2004-06-24 / 选集 / CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('234', '\n            3颗猫饼干\n                ', '朱玫玲,董運昌,王雁盟,何真真 / 2004/04/26 / CD', '9.1');
INSERT INTO `testmodel_test` VALUES ('235', '\n            21 Guns\n       ', 'Green Day / 2009-07-14 / Single / Audio CD', '9.2');
INSERT INTO `testmodel_test` VALUES ('236', '\n            看我72变\n       ', '蔡依林 Jolin Tsai / 2003-03-07 / 专辑 / CD / 流行', '8.2');
INSERT INTO `testmodel_test` VALUES ('237', '\n            第二人生 明日版\n                ', '五月天 / 2011-12-20 / 专辑 / CD / 流行', '9.0');
INSERT INTO `testmodel_test` VALUES ('238', '\n            Definitely Maybe\n                ', 'Oasis / 1994-08-30 / 专辑 / CD / 摇滚', '9.0');
INSERT INTO `testmodel_test` VALUES ('239', '\n            First Love\n                ', '宇多田ヒカル / 1999 / 专辑 / CD / 流行', '9.1');
INSERT INTO `testmodel_test` VALUES ('240', '\n            阿密特\n                ', '张惠妹 / 2009-06-26 / 专辑 / CD / 流行', '7.7');
INSERT INTO `testmodel_test` VALUES ('241', '\n            心·跳\n                ', '王力宏 Leehom Wang / 2008-12-26 / 专辑 / CD / 流行', '7.1');
INSERT INTO `testmodel_test` VALUES ('242', '\n            xx\n       ', 'The xx / 2009-08-17 / 专辑 / CD / 摇滚', '8.7');
INSERT INTO `testmodel_test` VALUES ('243', '\n            回蔚\n       ', '莫文蔚 / 2009-06-23 / 专辑 / CD+DVD / 流行', '8.0');
INSERT INTO `testmodel_test` VALUES ('244', '\n            如果看見地獄，我就不怕魔鬼\n                ', 'Tizzy Bac / 2009-02-13 / 专辑 / CD / 流行', '8.1');
INSERT INTO `testmodel_test` VALUES ('245', '\n            我们是五月天\n       ', '五月天 / 2003年4月17日 / 专辑 / CD', '9.3');
INSERT INTO `testmodel_test` VALUES ('246', '\n            王妃\n                ', '萧敬腾 / 2009-07-17 / 专辑 / CD / 流行', '7.7');
INSERT INTO `testmodel_test` VALUES ('247', '\n            Poker Face\n                ', 'Lady Gaga / September 23, 2008 / Single / Audio CD', '8.7');
INSERT INTO `testmodel_test` VALUES ('248', '\n            唐朝\n                ', '唐朝 / 1992-12 / CD＋DVD / CD / 摇滚', '9.0');
INSERT INTO `testmodel_test` VALUES ('249', '\n            寻找周杰伦\n       ', '周杰伦 / 2003-12-1 / EP / 音乐CD / 流行', '8.5');
INSERT INTO `testmodel_test` VALUES ('250', '\n            她说\n                ', '林俊杰 / 2010-12-08 / 专辑 / CD / 流行', '7.7');

-- ----------------------------
-- Table structure for testmodel_test2
-- ----------------------------
DROP TABLE IF EXISTS `testmodel_test2`;
CREATE TABLE `testmodel_test2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of testmodel_test2
-- ----------------------------
INSERT INTO `testmodel_test2` VALUES ('1', 'MAIN SQUEEZE', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('2', 'SWEET TALK', '$18.00');
INSERT INTO `testmodel_test2` VALUES ('3', 'BLUE MOON', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('4', 'JUST MY LUCK', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('5', 'OOH LA LA!', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('6', 'YES, PLEASE!', '$16.00');
INSERT INTO `testmodel_test2` VALUES ('7', 'GIVE IT TO ME STRAIGHT', '$16.00');
INSERT INTO `testmodel_test2` VALUES ('8', 'BRUNCH DATE', '$18.00');
INSERT INTO `testmodel_test2` VALUES ('9', 'CHASING RAINBOWS', '$20.00');
INSERT INTO `testmodel_test2` VALUES ('10', 'MAR', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('11', 'SOL', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('12', 'DOUBLE ENTENDRE', '$16.00');
INSERT INTO `testmodel_test2` VALUES ('13', 'SHE', '$16.00');
INSERT INTO `testmodel_test2` VALUES ('14', 'I THINK I LOVE YOU', '$16.00');
INSERT INTO `testmodel_test2` VALUES ('15', 'GOOD SPORT', '$16.00');
INSERT INTO `testmodel_test2` VALUES ('16', 'MISUNDERSTOOD.', '$22.00');
INSERT INTO `testmodel_test2` VALUES ('17', 'PERCEPTION', '$24.00');
INSERT INTO `testmodel_test2` VALUES ('18', 'YOU HAD ME AT HELLO', '$18.00');
INSERT INTO `testmodel_test2` VALUES ('19', 'THROUGH MY EYES PALETTE', '$24.00');
INSERT INTO `testmodel_test2` VALUES ('20', 'SALVAJE PALETTE', '$18.00');
INSERT INTO `testmodel_test2` VALUES ('21', 'FAME', '$23.00');
INSERT INTO `testmodel_test2` VALUES ('22', 'FORTUNE', '$23.00');
INSERT INTO `testmodel_test2` VALUES ('23', 'LIT PALETTE', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('24', 'WET PALETTE', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('25', 'DREAM ST.', '$16.00');
INSERT INTO `testmodel_test2` VALUES ('26', 'PROCEED WITH CAUTION', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('27', 'BROWN SUGAR', '$12.00');
INSERT INTO `testmodel_test2` VALUES ('28', 'NOT SAFE FOR WERK', '$36.00');
INSERT INTO `testmodel_test2` VALUES ('29', 'THE ZODIAC', '$18.00');
INSERT INTO `testmodel_test2` VALUES ('30', 'MAKEUP UR MIND', '$12.00$8.40');
INSERT INTO `testmodel_test2` VALUES ('31', 'SOL + MAR', '$24.00');
INSERT INTO `testmodel_test2` VALUES ('32', 'LIT & WET', '$24.00');
INSERT INTO `testmodel_test2` VALUES ('33', 'THE HEADLINER', '$61.00$43.00');
