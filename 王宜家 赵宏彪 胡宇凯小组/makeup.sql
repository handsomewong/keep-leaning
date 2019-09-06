/*
Navicat MySQL Data Transfer

Source Server         : wyj
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : makeup

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 21:26:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'tuShOfiBrA8+br7ENrMS8A==');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '口红');
INSERT INTO `category` VALUES ('2', '眼影');
INSERT INTO `category` VALUES ('3', '粉底');
INSERT INTO `category` VALUES ('4', '香水');
INSERT INTO `category` VALUES ('5', '化妆刷');
INSERT INTO `category` VALUES ('6', '妆前乳');
INSERT INTO `category` VALUES ('7', '遮瑕');
INSERT INTO `category` VALUES ('8', '眉粉');
INSERT INTO `category` VALUES ('9', '散粉');
INSERT INTO `category` VALUES ('10', '眼线笔');
INSERT INTO `category` VALUES ('11', '修容');
INSERT INTO `category` VALUES ('12', '睫毛膏');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float DEFAULT NULL COMMENT '总价',
  `amount` int(11) DEFAULT NULL COMMENT '商品总数',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态(1未处理/2已处理)',
  `name` varchar(20) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `systime` datetime DEFAULT NULL COMMENT '下单时间',
  `user_id` int(11) DEFAULT NULL COMMENT '下单用户',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('1', '72', '3', '2', 'www', '12345555', '上海', '2019-06-20 22:27:08', '2');
INSERT INTO `indent` VALUES ('2', '1998', '4', '2', 'wyj', '12345678', '温州', '2019-06-21 23:17:46', '3');
INSERT INTO `indent` VALUES ('3', '1482', '3', '1', 'www', '124566', '北京', '2019-06-22 17:25:07', '2');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL COMMENT '购买时价格',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `makeup_id` int(11) DEFAULT NULL,
  `indent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `makeup_id` (`makeup_id`),
  KEY `indent_id` (`indent_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`makeup_id`) REFERENCES `makeup` (`id`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`indent_id`) REFERENCES `indent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', '24', '3', '6', '1');
INSERT INTO `items` VALUES ('2', '1090', '1', '8', '2');
INSERT INTO `items` VALUES ('3', '98', '1', '19', '2');
INSERT INTO `items` VALUES ('4', '490', '1', '6', '2');
INSERT INTO `items` VALUES ('5', '320', '1', '32', '2');
INSERT INTO `items` VALUES ('6', '300', '1', '2', '3');
INSERT INTO `items` VALUES ('7', '1090', '1', '8', '3');
INSERT INTO `items` VALUES ('8', '92', '1', '21', '3');

-- ----------------------------
-- Table structure for makeup
-- ----------------------------
DROP TABLE IF EXISTS `makeup`;
CREATE TABLE `makeup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `price` float DEFAULT NULL COMMENT '价格',
  `intro` varchar(1024) DEFAULT NULL COMMENT '介绍',
  `press` varchar(255) DEFAULT NULL COMMENT '出版社',
  `pubdate` varchar(255) DEFAULT NULL COMMENT '出版日期',
  `special` int(1) DEFAULT '0' COMMENT '特卖',
  `news` int(1) DEFAULT '0' COMMENT '新书',
  `sale` int(1) DEFAULT '0' COMMENT '打折',
  `category_id` int(11) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `makeup_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of makeup
-- ----------------------------
INSERT INTO `makeup` VALUES ('1', 'SWEET TALK', '/sjk/1.jpg', '120', 'We won’t blame you if this becomes your new fave - create looks from soft, everyday eyes to your ultimate Spring Fling Queen glam! When you feel pretty, we feel pretty.\r\nWe won’t blame you if this becomes your new fave - create looks from soft, everyday eyes to your ultimate Spring Fling Queen glam! When you feel pretty, we feel pretty.\r\nWe won’t blame you if this becomes your new fave - create looks from soft, everyday eyes to your ultimate Spring Fling Queen glam! When you feel pretty, we feel pretty.', 'COLOURPOP', '2008-05-01', '0', '0', '0', '2');
INSERT INTO `makeup` VALUES ('2', 'BORN TO RUN', '/sjk/2.jpg', '300', 'I love this palette! The colors are gorgeous, they are so pigmented an...', 'URBAN DECAY', '2011-05-01', '0', '1', '0', '2');
INSERT INTO `makeup` VALUES ('3', '玛丽黛佳小金钻口红', '/sjk/3.jpg', '89', '口红试色 玛丽黛佳小金钻～blingbling美炸了好么  blingbling金灿灿的外壳特别炫目，里面的膏体也是如此闪耀，涂上它或许你就能吸引到男神的目光噢～', '玛丽黛佳', '2015-09-01', '0', '0', '0', '1');
INSERT INTO `makeup` VALUES ('4', '毛戈平气蕴东方口红', '/sjk/4.jpg', '280', '这款唇膏真的不错，我是第一次购买毛戈平的唇膏，但是真的让我很惊喜啊，唇膏质地是柔雾状的，涂在唇上非常高级，而且这个颜色非常棒，涂在我唇上是接近砖红色的，非常显白，不得不说这个包装了，非常精美，我自己很喜欢古风的，非常棒！快递也迅速，第二天就到了，总体感觉，非常满意！', '毛戈平', '2014-02-01', '0', '0', '0', '1');
INSERT INTO `makeup` VALUES ('5', 'COVERMARK修护粉底液', '/sjk/5.jpg', '455', '超级好用，之前用的bn10感觉有点太粉了，这次换了bo10真的超级合适！大油田表示也很喜欢，时间久了也不怎么脱妆！妆效不好的妹子大概都是皮肤起皮 但是自己没发现吧 之前我皮肤状态不好涂啥粉底都不贴。 洗完脸10分钟就出油 一天能出“二斤油”的表示很好用哈哈哈哈哈哈哈，这个和肤色很贴！适合皮肤没有很红的痘痘的宝贝用，遮瑕一般般～', 'covermark', '2011-03-01', '0', '0', '0', '3');
INSERT INTO `makeup` VALUES ('6', '雅诗兰黛沁水粉底液', '/sjk/6.jpg', '490', '个人情况：34岁，大干皮，有斑有细纹。我不算黑，冷皮。之前买1w0有点暗黄，这次换这个，试一试。磨皮效果.遮瑕还好。干皮友好。同时买了娇兰晶...', '雅诗兰黛', '2011-03-01', '1', '0', '0', '3');
INSERT INTO `makeup` VALUES ('7', '迪奥小姐花漾淡香水', '/sjk/7.jpg', '1008', '爱很抽象又很具体，对你来说爱是什么？对我来说爱就像一缕香气，曼妙，和谐，让我成为更好、更自由的自己；爱就像一首圆舞曲，让人沉浸在里面，旋转起舞。如果爱有香气，可能就像是全新MISS DIOR迪奥小姐淡香水的味道，像是可以和我对话一样，格拉斯玫瑰美妙而温柔，铃兰香调清新而灵动，如同逐渐临近的春日。', 'Dior', '2011-12-01', '0', '0', '0', '4');
INSERT INTO `makeup` VALUES ('8', 'YSL反转巴黎香水', '/sjk/8.jpg', '1090', '前调佛手柑混着略带酸味的水果香一下子就抓住了我，浓浓荷尔蒙的感觉就像热恋般让人兴奋。中调曼陀罗的神秘感有种致幻的感觉，就像两人为对方着迷到不...', 'YSL', '2013-07-01', '0', '1', '0', '4');
INSERT INTO `makeup` VALUES ('9', '白凤堂化妆套刷', '/sjk/9.jpg', '2388', '千等万等终于到手了，自己还配了其他功能的刷子，但是这十支已经能基本满足需求了，毛刷很软，刷在脸上舒服不刺脸，日本EMS快递三天到手，刷子手感...', '白凤堂', '2015-11-01', '1', '0', '0', '5');
INSERT INTO `makeup` VALUES ('10', '琴制绯蓝系列化妆刷', '/sjk/10.jpg', '85', '这六支还可以,不扎脸,不扎眼皮,上脸舒服,抓粉也还可以。但是另外的那个惊鸿系列小马尾,虽说是动物毛,但是眨眼皮啊,扎的疼,最后就退了,留了菲...', '琴制', '2015-10-01', '0', '0', '0', '5');
INSERT INTO `makeup` VALUES ('11', 'YSL精品黑丝缎隔离霜', '/sjk/11.jpg', '308', 'YSL家必败的妆前乳，隐形毛孔，真的跟打磨了一下皮肤一样，亮亮的。 黑丝缎圣罗兰保湿隔离妆前乳打底乳40ml 可以瞬间平滑肌肤，造出丝缎般的细致嫩肌，同时强化妆效，为肌肤72小时长效补湿。配合粉底液用，好哭的节奏', 'YSL', '2014-05-01', '1', '0', '0', '6');
INSERT INTO `makeup` VALUES ('12', 'CPB妆前乳长管', '/sjk/12.jpg', '540', '真正体现大牌品质和气质！要为CPB长管疯狂打call！自从3年前严重过敏过不敢随意乱用护肤品，就选择了CPB，到现在没有一天不用的，可以坦言，敏感肌和激素脸都可以放心用，帮我渡过皮肤受损的困难期！旗舰店没做活动时就找人日本代购，但是感觉国内版比日本专柜40g装的还要适合我啊！618活动买一送了七，唯有认真写评价方可表白了！', 'CPB', '2014-03-01', '0', '0', '0', '6');
INSERT INTO `makeup` VALUES ('13', '歌剧魅影六色遮瑕盘', '/sjk/13.jpg', '319', '好好好，味道很好闻 有点像小时候妈妈涂的七日香面霜哈哈哈，之前都是用遮瑕液，跟这个简直没法比！干皮用这个确实要慎重哦，我的偏油肤质用着刚刚好！', '歌剧魅影', '2010-08-01', '0', '0', '0', '7');
INSERT INTO `makeup` VALUES ('14', 'L.A. GIRL遮瑕膏', '/sjk/14.jpg', '39', '个人情况：2 0岁，混油皮，脸颊有一些浅的痘印，天气热或者激动容易有红血丝hhh 整体描述：小小的一支，但是可以少量多次使用，会回购！ 上妆效果：不卡粉不会太干，上午水乳之后先用美妆蛋在红的地方点几点扑薄薄的一层，再调和粉底液轻轻盖一下，有些遮盖不住的在着重用细节刷点粉底液覆盖一下，最后用散粉定妆 持久情况：上了体育课之后也不会花妆，还被朋友夸皮肤贼好嘻嘻嘻', 'L.A.girl', '2012-06-01', '0', '0', '0', '7');
INSERT INTO `makeup` VALUES ('15', 'KATE三色眉粉', '/sjk/15.jpg', '89', '适合肤质：油皮 上妆效果：第一次会手重但是很好上手 持久情况：持久一整天 真的超级喜欢，非常支持，质量非常好，与卖家描述的完全一致，非常满意,真的很喜欢，完全超出期望值，发货速度非常快，包装非常仔细、严实，物流公司服务态度很好，运送速度很快，很满意的一次购物', 'KATE', '2014-08-01', '0', '0', '0', '8');
INSERT INTO `makeup` VALUES ('16', '植村秀自动砍刀眉笔', '/sjk/16.jpg', '140', '上妆效果：新手手残党必备，笔芯质量好不易断，可以持续服帖一整天，颜色很正跟发色非常搭，个人非常满意的一次购物体验 持久情况：持久一整天没问题，防水防汗，不易晕染 适合肤质：混合肤质，纵然脑门经常会发油，眉型不受丝毫影响，体验效果良好', '植村秀', '2005-06-01', '0', '0', '0', '8');
INSERT INTO `makeup` VALUES ('17', '谢馥春鸭蛋香粉', '/sjk/17.jpg', '198', '整体描述：外形漂亮精致，包装严实， 上妆效果：粉质细腻，不浮粉，气味淡雅， 持久情况：油性皮肤持久短，但不卡粉，不会泛油光。 还送了鸭蛋粉小...', '谢馥春', '2012-06-01', '0', '1', '0', '9');
INSERT INTO `makeup` VALUES ('18', 'RCMA无色透明定妆散粉', '/sjk/18.jpg', '125', '包装的很仔细，物流也很快 个人情况：混油皮 整体描述：便宜量多，就是倒出来在散粉盒的时候飘得到处都是。总的来说很不错 上妆效果：粉质细腻，有点淡淡的肤色，上脸很自然，用来烘焙定妆刚好', 'RCMA', '2012-01-01', '0', '1', '0', '9');
INSERT INTO `makeup` VALUES ('19', 'KISSME眼线液笔', '/sjk/19.jpg', '98', '易出油，易脱妆，手残 整体描述：眼线笔太好用了，轻轻一画就成型，质量非常好，做工精细，送的配套抱枕也是皮质的，虽然是米色的发货速度很快，包装...', 'KISSME', '2014-08-01', '0', '0', '1', '10');
INSERT INTO `makeup` VALUES ('20', '卡姿兰大眼睛眼线液笔', '/sjk/20.jpg', '89', '买的同款第三次了，感觉还是挺好用的，一如既往地好！ 持久情况：持久 上妆效果：不容易散，线条不错 整体描述：这个没什么追求 个人情况：24.每天画，能用两个月没问题 适合肤质：任何肤质！', '卡姿兰', '2013-12-01', '0', '1', '0', '10');
INSERT INTO `makeup` VALUES ('21', 'CANMAKE花瓣腮红', '/sjk/21.jpg', '92', '五色雕刻腮红珠光6号色 这盒简直相见恨晚 桃粉色 可以当腮红、当眼影 非常适合桃花妆 之前各种找适合桃花妆的眼影盘 颜色都没有这个温柔 巨喜...', 'CANMAKE', '2011-01-01', '0', '0', '1', '11');
INSERT INTO `makeup` VALUES ('22', 'too cool三色修容粉', '/sjk/22.jpg', '99', '干皮，少量多次，不太上色我不容易过重或者脏了妆，还在学习。希望能发挥作用，修容的作用是什么？主要是用来修饰脸部轮廓，让五官更立体有型。尤其是...', 'Too Cool For School', '2013-11-01', '0', '1', '0', '11');
INSERT INTO `makeup` VALUES ('23', '悦诗风吟纤巧精细睫毛膏', '/sjk/23.jpg', '80', '个人情况：25岁 经常化妆 要求能快速化一个妆 整体描述：韩版的比这个纤细很多 但是用起来的感觉是一样的 上妆效果：这个刷头很纤细 很适合手残党使用 也挺持久的 所以一直有回购噢 持久情况：不晕妆 很持久 一天10个小时也没问题 适合肤质：我是混干皮 适合', '悦诗风吟', '2014-08-01', '0', '0', '0', '12');
INSERT INTO `makeup` VALUES ('24', 'Mistine4D双头眼睫毛膏', '/sjk/24.jpg', '59', '这款睫毛膏已经是老网红了，回购了很多次，睫毛纤维配上睫毛膏简直是经典搭配，我睫毛虽然比较长，但是很塌，需要睫毛夹夹完之后定型，再刷睫毛膏，这款刷上后睫毛会变得很浓密，瞬间放大双眼，效果很好，很满意。', 'Mistine', '2015-10-01', '0', '0', '0', '12');
INSERT INTO `makeup` VALUES ('25', 'YSL黑管唇釉口红409', '/sjk/25.jpg', '320', '之前并不喜欢这一类重颜色的口红，但是，409真的美到没朋友。显气场，显白，本人黄皮，图三iPhone 前置无滤镜。浆果色，像是吃了小孩，薄涂厚涂都很美。就是太难卸了，很难卸干净，所以持久度什么的完全不用担心。我都是晚上卸妆的时候用卸妆油根本卸不干净，然后用兰芝唇膜涂在嘴上，第二天再洗。不入手会后悔的一支口红', 'YSL', '2014-03-01', '0', '0', '1', '1');
INSERT INTO `makeup` VALUES ('26', 'YSL小金条口红21', '/sjk/26.jpg', '335', '上妆效果：口红颜色很漂亮，是我喜欢的那种，没有色差，一股淡淡的香味，而且不愿意掉色，喜欢的亲人，别再犹豫了，等有蜜橙色我在接着拍，确实不错，...', 'YSL', '2013-12-01', '0', '0', '0', '1');
INSERT INTO `makeup` VALUES ('27', 'YSL方管口红1', '/sjk/27.jpg', '320', '颜色很好看 很上色，一股清香 很好涂 滋润，颜色非常的漂亮，而且是滋润的，不会干，口红闻起来有一股香香的味道 颜色超级漂亮，喜欢，有一点淡淡花香味， 颜色特别的温和。特别好看，特别滋润。气味很芳香。,很喜欢，，外观大气，颜色也好看，颜色百搭 日常薄涂 上妆效果也很好呢 显白显气色真的特别好看', 'YSL', '2015-04-01', '0', '0', '0', '1');
INSERT INTO `makeup` VALUES ('28', 'YSL纯色唇釉口红12', '/sjk/28.jpg', '320', '个人情况：20岁日常淡妆 涂防晒和素颜霜画眉毛和涂口红 今天试图新到的ysl12斩男色 神仙到爆炸 爱到炸裂 同学都说特别自然又好看 持久度真的很好 一直很香 完全不想去抿嘴巴 超级舒服！！！附带本人素颜苹果前置完全没有打底和滤镜的上嘴照片。真的很喜欢很满意特别开心！！！ 适合肤质：干油混合 t区比较油', 'YSL', '2014-02-01', '1', '0', '1', '1');
INSERT INTO `makeup` VALUES ('29', 'Amani红管唇釉口红405', '/sjk/29.jpg', '310', '本来没想买405，无意中发现的，又发现比我之前在其他地方看的便宜，还送赠品，就下单了。顺丰到达，包装精致，上嘴颜色很好看，显白提气色，不愧是热卖色号！我都是薄涂就够了！', 'Amani', '2014-12-01', '0', '0', '1', '1');
INSERT INTO `makeup` VALUES ('30', 'Amani黑管唇釉口红500', '/sjk/30.jpg', '310', '上妆效果：锦鲤色 自己买过一根觉得很赞 这次闺蜜生日也送她一根 显白 提升气色效果nice 包装高端大气 送人不错 还有赠品小样 比在专柜买有仪式感 专柜没有礼盒也不送赠品 个人觉得405也很nice 有钱就会把所有色号都买个遍', 'Amani', '2014-05-01', '0', '0', '1', '1');
INSERT INTO `makeup` VALUES ('31', 'Amani小胖丁唇釉口红506', '/sjk/31.jpg', '340', '整体描述：外观很小巧方便携带，液体看起来是珊瑚红。 上妆效果：我的唇色是浅粉色，这款上色后呈现玫瑰粉的唇色，是我一直想找的颜色。夏天喜欢日常...', 'Amani', '2015-06-01', '1', '0', '1', '1');
INSERT INTO `makeup` VALUES ('32', 'Amani哑光唇膏口红404', '/sjk/32.jpg', '320', '又是被一哥李佳琦种草的颜色，404是新色刚上市不久，看佳琦涂什么颜色都好看，很高级的颜色，红中带一点点玫红调，黄皮适合。膏体带有蓝紫色的细闪...', 'Amani', '2015-07-01', '1', '0', '0', '1');
INSERT INTO `makeup` VALUES ('33', '迪奥520限量版唇膏口红', '/sjk/33.jpg', '335', '迪奥520限量版-烈艳蓝金唇膏官网限量发售24379支，其中包含2145支迪奥520限量版-烈艳蓝金唇膏#080， 14137支迪奥520限...', 'Dior', '2014-04-01', '1', '0', '0', '1');
INSERT INTO `makeup` VALUES ('34', 'DIOR迪奥魅惑釉唇膏口红740', '/sjk/34.jpg', '315', '质地很水润好上色虽然是唇膏的长相但是涂起来居然像唇釉一样，很神奇，持久度蛮好，显白，不卡唇纹但是有点粘杯（在我这里不算缺点），味道我觉得一般，壳子好好看，很有质感也挺有重量的', 'Dior', '2014-08-01', '0', '0', '0', '1');
INSERT INTO `makeup` VALUES ('35', 'DIOR迪奥魅惑唇彩口红643', '/sjk/35.jpg', '315', '三重升级妆感，更胜传统唇彩：- 更丰盈：全新丰唇配方，令双唇立显饱满丰润。- 更炫亮：在双唇形成镜面薄膜，轻盈易涂，镜感亮泽。- 更水润：持续润唇保湿，双唇倍感柔滑舒适。', 'Dior', '2013-04-01', '1', '0', '0', '1');
INSERT INTO `makeup` VALUES ('36', 'DIOR迪奥烈艳蓝金液唇膏口红', '/sjk/36.jpg', '315', 'Dior迪奥烈艳蓝金唇膏再度突破创意，推出首款4种妆效的液态唇膏：摇滚哑光、经典缎光、电光金属、丝绒裸妆。唇彩般轻盈舒适，唇膏般细腻顺滑，高遮盖力，超持妆显色。', 'Dior', '2012-11-01', '0', '0', '0', '1');
INSERT INTO `makeup` VALUES ('37', 'MAC哑光唇膏口红RUBY WOO ', '/sjk/37.jpg', '170', '滋润效果：宝贝很好哟，美丽他家的口红算是性价比非常高质地非常的不错哦，抹到嘴上颜色特别饱满，干了之后是一点都不粘杯，丝毫跟那些大牌可以媲美，为不知该选什么颜色白选的这个热门色号 让我买到了梦寐以求的宝贝,太感谢了 !十分显白。真的好喜欢。', 'MAC', '2015-05-01', '0', '0', '0', '1');
INSERT INTO `makeup` VALUES ('38', 'MAC持久哑光液体唇膏DANCE WITH ME', '/sjk/38.jpg', '210', '对于偏爱时时刻刻都能拥有不受时间影响的魅力的人群来说，哑光是他们的法宝。魅可生产了一种质地经典、色彩饱和度极高的唇膏——持久哑光液体唇膏。无论您选择了哪一色号，有一点是肯定的：一抹丝滑点亮唇间，让人过目不忘。', 'MAC', '2014-04-01', '1', '0', '0', '1');
INSERT INTO `makeup` VALUES ('39', 'MAC珠圆玉润唇膏笔INNOCENT', '/sjk/39.jpg', '170', '魅可珠圆玉润唇膏笔拥有独特的奶油润泽质地，让双唇保持柔软光滑，摆脱厚重和黏腻。旋转式设计，方便快速；圆润笔头，无需修整，10多种全新颜色让所有肤色都能从中找到完美匹配。', 'MAC', '2009-05-01', '0', '0', '1', '1');
INSERT INTO `makeup` VALUES ('40', 'MAC棒棒糖唇釉口红106', '/sjk/40.jpg', '210', '个人情况：平常出门只涂口红就好啦 整体描述：外壳超好看，有质感，不是普通塑料 上妆效果：很显白的车厘子红，很好看。涂上保持时间更长，如果不喝水吃饭很持久，有一股甜甜巧克力味，涂上稍微黏黏的，有水光感的唇釉，nice', 'MAC', '2015-05-01', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'iUOoOdMAl7FsB1Kig37hmg==', '姓名', '12312341234', '北京北京北京');
INSERT INTO `users` VALUES ('2', 'user', 'HAMVRZRssPCADKqGjGWJtQ==', 'www', '124566', '北京');
INSERT INTO `users` VALUES ('3', 'wyj', 'tNSee4l+aCGtRIUHuXtRBQ==', null, null, null);
INSERT INTO `users` VALUES ('4', 'kkk', 'KLhV3KchnkHG1Vo/a8ZHRQ==', 'kkk', '12345677899', '上海');
