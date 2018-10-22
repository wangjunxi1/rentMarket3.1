/*
Navicat MySQL Data Transfer

Source Server         : RentMarket
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : rentmarket

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2018-10-21 22:57:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad`
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `adId` int(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `adContent` varchar(255) DEFAULT NULL COMMENT '广告内容',
  `adPicture` varchar(255) DEFAULT NULL COMMENT '广告图片',
  `adProductor` varchar(255) DEFAULT NULL COMMENT '广告供应商',
  `adDay` int(20) DEFAULT NULL COMMENT '投放天数',
  `adBeginDate` datetime DEFAULT NULL COMMENT '开始时间',
  `adEndDate` datetime DEFAULT NULL COMMENT '结束时间',
  `adState` int(20) DEFAULT '0' COMMENT '状态,0未激活,1激活',
  PRIMARY KEY (`adId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('4', '饿了么,饿了就上饿了么', 'timg.jpg', '饿了么', '10', '2018-10-15 09:07:12', '2018-10-15 11:38:17', '0');
INSERT INTO `ad` VALUES ('5', '要旅游找途牛,专业的旅游网站', 'timg.jpg', '旅游', '3', null, '2018-10-16 15:38:46', '1');
INSERT INTO `ad` VALUES ('7', '美团外卖,天天红包领不停', 'amdc.jpg', '美团', '3', '2018-10-16 15:41:00', null, '0');
INSERT INTO `ad` VALUES ('8', '为什么我的演唱会这么廉价吗,连买都没人买,我看你们是不给我伍佰面子', 'amdc.jpg', '伍佰演唱会', '3', '2018-10-16 15:41:19', '2018-10-16 15:41:36', '0');
INSERT INTO `ad` VALUES ('9', '伊利纯牛奶,源自大草原牧场的新鲜牛奶', 'timg.jpg', '伊利', '1', '2018-10-16 15:42:31', null, '0');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin` varchar(50) DEFAULT NULL COMMENT '管理员用户名',
  `adminPwd` varchar(50) DEFAULT NULL COMMENT '管理员密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for `evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `evaluateId` int(20) NOT NULL AUTO_INCREMENT COMMENT '评论Id',
  `userId` int(20) NOT NULL COMMENT '用户Id',
  `goodId` int(10) NOT NULL,
  `evaluateContent` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `evaluateDate` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`evaluateId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '1', '8', '真好用', '2018-10-15 17:47:05');
INSERT INTO `evaluate` VALUES ('3', '1', '56', '很可爱', '2018-10-08 17:47:14');
INSERT INTO `evaluate` VALUES ('4', '1', '6', '加热很快，好评', '2018-10-04 18:11:58');
INSERT INTO `evaluate` VALUES ('11', '1', '42', '好评', '2018-10-18 18:29:11');
INSERT INTO `evaluate` VALUES ('15', '1', '8', '<p>配置很高</p>', '2018-10-21 22:34:27');

-- ----------------------------
-- Table structure for `favorite`
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `favoriteId` int(20) NOT NULL AUTO_INCREMENT COMMENT '收藏夹Id(主键)',
  `goodId` int(20) NOT NULL COMMENT '商品Id(外键)',
  `userId` int(20) NOT NULL COMMENT '用户Id(外键)',
  `goodName` varchar(255) DEFAULT NULL,
  `goodPrice` double(255,0) DEFAULT NULL,
  `favoriteDate` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`favoriteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `goodId` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键（商品表）',
  `goodName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `typeId` int(20) DEFAULT NULL COMMENT '外键（商品类型表）',
  `goodPrice` double(20,2) DEFAULT NULL,
  `goodCount` int(20) DEFAULT NULL,
  `goodState` varchar(20) DEFAULT NULL COMMENT '商品状态 0 待审核，1 审核失败，2审核通过',
  `goodImgAdd` varchar(50) DEFAULT NULL COMMENT '商品图片地址',
  `userId` int(20) DEFAULT NULL COMMENT '卖家Id',
  PRIMARY KEY (`goodId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('2', '简约现代 文件柜  实木颗粒板 白色 3层 9格 9成新', '2', '66.60', '10', '2', 'p2.jpg', '1');
INSERT INTO `good` VALUES ('3', '微骑仕 智能平衡车 智能代步电动体感车 白色 M9', '2', '88.00', '10', '2', 'p3.jpg', '1');
INSERT INTO `good` VALUES ('4', '双超踏步机 液压家用健身器材 免安装 SC-S032D', '2', '50.00', '10', '2', 'p4.jpg', '1');
INSERT INTO `good` VALUES ('5', '奥克斯 挂机 35GW/HFJ+3 陶瓷白 8成新', '13', '27.40', '10', '2', 'p5.jpg', '2');
INSERT INTO `good` VALUES ('6', '皇冠电热水器DRB-40D防电墙40升', '13', '36.48', '10', '2', 'p6.jpg', '2');
INSERT INTO `good` VALUES ('8', '一加手机5T 8GB+128GB 星辰黑 全面屏游戏手机 全网通4G 双卡双待', '1', '99.00', '10', '2', 'o5t.jpg', '2');
INSERT INTO `good` VALUES ('9', '一加手机6 8GB+128GB 亮瓷黑 全面屏游戏手机 全网通4G 双卡双待', '1', '95.00', '10', '2', 'o6.jpg', '3');
INSERT INTO `good` VALUES ('10', '一加 6手机 OnePlus6 （六）游戏手机 复仇者联盟限量版 全网通(8G+256G)', '1', '85.00', '10', '2', 'o6a.jpg', '3');
INSERT INTO `good` VALUES ('11', '一加 6手机 OnePlus6 全面屏游戏手机 全网通4G 双卡双待 琥珀红 8G+128G', '1', '80.00', '10', '2', 'o6r.jpg', '3');
INSERT INTO `good` VALUES ('35', '明基（BenQ） 商务 投影仪 短焦 BW6730ST 9成新', '17', '26.00', '23', '2', 'pd06.jpg', '4');
INSERT INTO `good` VALUES ('42', 'FZM方米 正1匹 分体式 空调 壁挂式', '10', '26.00', '20', '2', 'pd01.jpg', '4');
INSERT INTO `good` VALUES ('43', '简约现代 电脑桌 电脑书桌 书桌 可置物 枫樱木 枫木色', '21', '20.00', '10', '2', 'pd02.jpg', '4');
INSERT INTO `good` VALUES ('44', 'TOVSTO 穿越机 无人机 FALCON250 黑色+黄色', '26', '26.00', '10', '2', 'pd03.jpg', '5');
INSERT INTO `good` VALUES ('51', '美的洗衣机 MG70-J11WDX 8成新', '11', '20.00', '10', '2', 'meidi洗衣机.jpg', '5');
INSERT INTO `good` VALUES ('52', '奥克斯（AUX）2匹 定频 单冷 立柜式空调 KF-51LW/N+3 8成新空调', '10', '30.00', '10', '2', 'AUX空调.jpg', '5');
INSERT INTO `good` VALUES ('53', '海尔（Haier） 波轮 洗衣机 顶开式 银灰色 红色盖 XQS60-Z1128洗衣机', '11', '22.00', '15', '2', 'Haier洗衣机.jpg', '6');
INSERT INTO `good` VALUES ('54', 'Haier/海尔 EG10014B39GU1 10公斤大容量、BLDC变频、消毒洗洗衣机', '11', '23.00', '10', '2', 'Haier洗衣机.jpg', '6');
INSERT INTO `good` VALUES ('55', 'Littleswan/小天鹅 TB55V20 单身优选 实用波轮 全自动洗衣机', '11', '22.50', '9', '2', 'meidi洗衣机.jpg', '6');
INSERT INTO `good` VALUES ('56', '美国艾罗伯特智能扫地机器人 吸尘器 Roomba 651', '11', '23.00', '23', '2', 'Haier洗衣机.jpg', '7');
INSERT INTO `good` VALUES ('57', 'Chigo/志高 XQB75-3801 7.5KG大容量全自动洗衣机', '11', '20.00', '10', '2', 'Haier洗衣机.jpg', '7');
INSERT INTO `good` VALUES ('58', '\r\nLG WD-M51VNG40 lg 9kg直驱全自动洗衣机', '11', '23.50', '10', '2', 'meidi洗衣机.jpg', '7');
INSERT INTO `good` VALUES ('59', 'Leader/统帅 TQG100-BKX1231洗衣机', '11', '21.50', '10', '2', 'meidi洗衣机.jpg', '8');
INSERT INTO `good` VALUES ('60', 'AUX/奥克斯 XQB55-A1678洗衣机', '11', '20.50', '10', '2', 'Haier洗衣机.jpg', '8');
INSERT INTO `good` VALUES ('61', 'Sanyo/三洋 WF810320BS0S 8kg，变频洗衣机', '11', '20.00', '10', '2', 'Haier洗衣机.jpg', '8');
INSERT INTO `good` VALUES ('62', 'AUX/奥克斯 XQB55-A1678洗衣机', '11', '21.00', '10', '2', 'meidi洗衣机.jpg', '9');
INSERT INTO `good` VALUES ('63', 'Haier/海尔 EG10014B39GU1 10公斤大容量、BLDC变频、消毒洗洗衣机', '11', '21.00', '10', '2', 'Haier洗衣机.jpg', '9');
INSERT INTO `good` VALUES ('64', '美国艾罗伯特智能扫地机器人 吸尘器 Roomba 651洗衣机', '11', '20.30', '10', '2', 'meidi洗衣机.jpg', '9');
INSERT INTO `good` VALUES ('65', 'LG WD-M51VNG40 lg 9kg直驱全自动洗衣机', '11', '22.00', '10', '2', 'Haier洗衣机.jpg', '10');
INSERT INTO `good` VALUES ('66', '乐视 GENE 自拍伴侣 自拍杆 蓝牙 Liveman S1相机', '8', '2.00', '10', '2', '相机1.jpg', '10');
INSERT INTO `good` VALUES ('67', '乐视 GENE 运动相机 直播相机 Liveman M1', '4', '20.00', '20', '2', '相机2.jpg', '10');
INSERT INTO `good` VALUES ('68', 'vivox21手机', '3', '30.00', '22', '2', 'v3.jpg', '11');
INSERT INTO `good` VALUES ('69', 'vivo Z1手机', '3', '32.00', '24', '2', 'v2.jpg', '11');
INSERT INTO `good` VALUES ('70', 'vivo Nex手机', '3', '31.00', '19', '2', 'v1.jpg', '11');
INSERT INTO `good` VALUES ('71', 'vivo X23手机', '3', '28.00', '18', '2', 'v4.jpg', '12');
INSERT INTO `good` VALUES ('72', '乐视 GENE 4K 运动相机 直播相机 Liveman C1', '8', '35.00', '6', '2', '相机3.jpg', '12');
INSERT INTO `good` VALUES ('73', '佳能 GENE 自拍伴侣 自拍杆 蓝牙 Liveman S1', '8', '33.00', '8', '2', '相机1.jpg', '12');
INSERT INTO `good` VALUES ('74', 'CTO 动感单车 家用健身车 黑色 F8218 9成新', '2', '33.00', '20', '2', 'pd07.jpg', '12');

-- ----------------------------
-- Table structure for `goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `typeId` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键（商品类型表）',
  `typeName` varchar(50) DEFAULT NULL COMMENT '商品类型',
  `typeparentId` int(20) DEFAULT NULL COMMENT '所属商品id',
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', '家用电器', '1');
INSERT INTO `goodstype` VALUES ('2', '办公家具', '0');
INSERT INTO `goodstype` VALUES ('3', '家居家具', '0');
INSERT INTO `goodstype` VALUES ('4', '手机数码', '0');
INSERT INTO `goodstype` VALUES ('5', '乐器', '0');
INSERT INTO `goodstype` VALUES ('6', '图书、音像', '0');
INSERT INTO `goodstype` VALUES ('7', '汽车、房子', '0');
INSERT INTO `goodstype` VALUES ('8', '运动户外、保健器械', '0');
INSERT INTO `goodstype` VALUES ('9', '电视', '1');
INSERT INTO `goodstype` VALUES ('10', '空调', '1');
INSERT INTO `goodstype` VALUES ('11', '洗衣机', '1');
INSERT INTO `goodstype` VALUES ('12', '冰箱', '1');
INSERT INTO `goodstype` VALUES ('13', '厨房大电', '1');
INSERT INTO `goodstype` VALUES ('14', '厨房小电', '1');
INSERT INTO `goodstype` VALUES ('15', '生活电器', '1');
INSERT INTO `goodstype` VALUES ('16', '商业办公', '2');
INSERT INTO `goodstype` VALUES ('17', '办公设备', '2');
INSERT INTO `goodstype` VALUES ('18', '卧室家具', '3');
INSERT INTO `goodstype` VALUES ('19', '客厅家具', '3');
INSERT INTO `goodstype` VALUES ('20', '餐厅家具', '3');
INSERT INTO `goodstype` VALUES ('21', '书房家具', '3');
INSERT INTO `goodstype` VALUES ('22', '储物家具', '3');
INSERT INTO `goodstype` VALUES ('23', '家装软饰', '3');
INSERT INTO `goodstype` VALUES ('24', '手机', '4');
INSERT INTO `goodstype` VALUES ('25', '相机', '4');
INSERT INTO `goodstype` VALUES ('26', '智能设备', '4');
INSERT INTO `goodstype` VALUES ('27', '摄像机', '4');
INSERT INTO `goodstype` VALUES ('28', '民族乐器', '5');
INSERT INTO `goodstype` VALUES ('29', '西洋乐器', '5');
INSERT INTO `goodstype` VALUES ('30', '健身器械', '8');
INSERT INTO `goodstype` VALUES ('31', '骑行运动', '8');
INSERT INTO `goodstype` VALUES ('32', '体育用品', '8');
INSERT INTO `goodstype` VALUES ('33', '医疗器械', '8');
INSERT INTO `goodstype` VALUES ('34', '汽车', '7');
INSERT INTO `goodstype` VALUES ('35', '套房', '7');
INSERT INTO `goodstype` VALUES ('36', '别墅', '7');
INSERT INTO `goodstype` VALUES ('37', '少儿图书', '6');
INSERT INTO `goodstype` VALUES ('38', '小说', '6');
INSERT INTO `goodstype` VALUES ('39', '名著', '6');
INSERT INTO `goodstype` VALUES ('40', 'CD', '6');
INSERT INTO `goodstype` VALUES ('41', '电视机', '9');
INSERT INTO `goodstype` VALUES ('42', '电视配件', '9');
INSERT INTO `goodstype` VALUES ('43', '壁挂式空调', '10');
INSERT INTO `goodstype` VALUES ('44', '柜式空调', '10');
INSERT INTO `goodstype` VALUES ('45', '滚筒洗衣机', '11');
INSERT INTO `goodstype` VALUES ('46', '波轮洗衣机', '11');
INSERT INTO `goodstype` VALUES ('47', '单门', '12');
INSERT INTO `goodstype` VALUES ('48', '双门', '12');
INSERT INTO `goodstype` VALUES ('49', '多门', '12');
INSERT INTO `goodstype` VALUES ('50', '消毒柜', '13');
INSERT INTO `goodstype` VALUES ('51', '油烟机', '13');
INSERT INTO `goodstype` VALUES ('52', '热水器', '13');
INSERT INTO `goodstype` VALUES ('53', '电饭煲', '14');
INSERT INTO `goodstype` VALUES ('54', '压力锅', '14');
INSERT INTO `goodstype` VALUES ('55', '榨汁机', '14');
INSERT INTO `goodstype` VALUES ('56', '台灯', '15');
INSERT INTO `goodstype` VALUES ('57', '电风扇', '15');
INSERT INTO `goodstype` VALUES ('58', '烘干机', '15');
INSERT INTO `goodstype` VALUES ('59', '办公桌', '16');
INSERT INTO `goodstype` VALUES ('60', '办公椅', '16');
INSERT INTO `goodstype` VALUES ('61', '办公柜', '16');
INSERT INTO `goodstype` VALUES ('62', '投影机', '17');
INSERT INTO `goodstype` VALUES ('63', '保险柜', '17');
INSERT INTO `goodstype` VALUES ('64', '打印机', '17');
INSERT INTO `goodstype` VALUES ('65', '边桌', '18');
INSERT INTO `goodstype` VALUES ('66', '斗柜', '18');
INSERT INTO `goodstype` VALUES ('67', '衣帽架', '18');
INSERT INTO `goodstype` VALUES ('68', '鞋柜', '19');
INSERT INTO `goodstype` VALUES ('69', '沙发', '19');
INSERT INTO `goodstype` VALUES ('70', '茶几', '19');
INSERT INTO `goodstype` VALUES ('71', '桌子', '20');
INSERT INTO `goodstype` VALUES ('72', '椅子', '20');
INSERT INTO `goodstype` VALUES ('73', '酒柜', '20');
INSERT INTO `goodstype` VALUES ('74', '书椅', '21');
INSERT INTO `goodstype` VALUES ('75', '书桌', '21');
INSERT INTO `goodstype` VALUES ('76', '书架', '21');
INSERT INTO `goodstype` VALUES ('77', '置物架', '22');
INSERT INTO `goodstype` VALUES ('78', '收纳柜', '22');
INSERT INTO `goodstype` VALUES ('79', '书柜', '22');
INSERT INTO `goodstype` VALUES ('80', '家装软饰', '23');
INSERT INTO `goodstype` VALUES ('81', 'vivo', '24');
INSERT INTO `goodstype` VALUES ('82', '一加', '24');
INSERT INTO `goodstype` VALUES ('83', '苹果', '24');
INSERT INTO `goodstype` VALUES ('84', '佳能', '25');
INSERT INTO `goodstype` VALUES ('85', '尼康', '25');
INSERT INTO `goodstype` VALUES ('86', '索尼', '25');
INSERT INTO `goodstype` VALUES ('87', '无人机', '26');
INSERT INTO `goodstype` VALUES ('88', '视频眼镜', '26');
INSERT INTO `goodstype` VALUES ('89', '高清摄像机', '27');
INSERT INTO `goodstype` VALUES ('90', '运动摄像机', '27');
INSERT INTO `goodstype` VALUES ('91', '高速摄像机', '27');
INSERT INTO `goodstype` VALUES ('92', '箫', '28');
INSERT INTO `goodstype` VALUES ('93', '二胡', '28');
INSERT INTO `goodstype` VALUES ('94', '琵琶', '28');
INSERT INTO `goodstype` VALUES ('95', '钢琴', '29');
INSERT INTO `goodstype` VALUES ('96', '吉他', '29');
INSERT INTO `goodstype` VALUES ('97', '小提琴', '29');
INSERT INTO `goodstype` VALUES ('98', '跑步机', '30');
INSERT INTO `goodstype` VALUES ('99', '动感单车', '30');
INSERT INTO `goodstype` VALUES ('100', '踏步机', '30');
INSERT INTO `goodstype` VALUES ('101', '电动车', '31');
INSERT INTO `goodstype` VALUES ('102', '平衡车', '31');
INSERT INTO `goodstype` VALUES ('103', '篮球', '32');
INSERT INTO `goodstype` VALUES ('104', '足球', '32');
INSERT INTO `goodstype` VALUES ('105', '网球', '32');
INSERT INTO `goodstype` VALUES ('106', '轮椅', '33');
INSERT INTO `goodstype` VALUES ('107', '电子体温表', '33');
INSERT INTO `goodstype` VALUES ('108', '电动按摩椅', '33');
INSERT INTO `goodstype` VALUES ('109', '10w以下', '34');
INSERT INTO `goodstype` VALUES ('110', '10w-30w', '34');
INSERT INTO `goodstype` VALUES ('111', '30w-60w', '34');
INSERT INTO `goodstype` VALUES ('112', '60w以上', '34');
INSERT INTO `goodstype` VALUES ('113', '一室一厅', '35');
INSERT INTO `goodstype` VALUES ('114', '两室一厅', '35');
INSERT INTO `goodstype` VALUES ('115', '三室一厅', '35');
INSERT INTO `goodstype` VALUES ('116', '海景别墅', '36');
INSERT INTO `goodstype` VALUES ('117', '独栋别墅', '36');
INSERT INTO `goodstype` VALUES ('118', '丛林庄别墅', '36');
INSERT INTO `goodstype` VALUES ('119', '格林童话', '37');
INSERT INTO `goodstype` VALUES ('120', '安徒生童话', '37');
INSERT INTO `goodstype` VALUES ('121', '十万个为什么', '37');
INSERT INTO `goodstype` VALUES ('122', '推理', '38');
INSERT INTO `goodstype` VALUES ('123', '言情', '38');
INSERT INTO `goodstype` VALUES ('124', '玄幻', '38');
INSERT INTO `goodstype` VALUES ('125', '国内名著', '39');
INSERT INTO `goodstype` VALUES ('126', '国外名著', '39');
INSERT INTO `goodstype` VALUES ('127', '车载CD', '40');

-- ----------------------------
-- Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `infoId` int(20) NOT NULL AUTO_INCREMENT COMMENT '商品Id',
  `infoContent` varchar(255) NOT NULL COMMENT '商品咨询内容',
  `infoDate` datetime NOT NULL COMMENT '商品资讯时间',
  PRIMARY KEY (`infoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `did` int(255) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `orderId` int(255) DEFAULT NULL COMMENT '订单Id',
  `goodName` varchar(255) DEFAULT NULL COMMENT '商品名',
  `goodNumber` int(255) DEFAULT NULL COMMENT '商品数量',
  `rentDate` varchar(20) DEFAULT NULL COMMENT '租赁天数',
  `goodImg` varchar(255) DEFAULT NULL,
  `rentPrice` double(20,0) DEFAULT NULL COMMENT '押金',
  `goodState` int(255) DEFAULT '2' COMMENT '0.已归还1.已收货2.未收货',
  PRIMARY KEY (`did`),
  KEY `fk_orderId` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('1', '1', '一加手机5T 8GB+128GB 星辰黑 全面屏游戏手机 全网通4G 双卡双待', '1', '1天', 'v1.jpg', null, '0');
INSERT INTO `orderdetail` VALUES ('2', '1', '美国艾罗伯特智能扫地机器人 吸尘器 Roomba 651', '1', '1天', 'p1.jpg', null, '0');
INSERT INTO `orderdetail` VALUES ('3', '2', '皇冠电热水器DRB-40D防电墙40升', '1', '1天', 'p6.jpg', null, '1');
INSERT INTO `orderdetail` VALUES ('5', '1', '简约现代 电脑桌 电脑书桌 书桌 可置物 枫樱木 枫木色', '54', '1', 'pd02.jpg', '20', '2');
INSERT INTO `orderdetail` VALUES ('6', '1', 'CTO 动感单车 家用健身车 黑色 F8218 9成新', '50', '1', 'pd07.jpg', '33', '2');
INSERT INTO `orderdetail` VALUES ('7', '1', 'CTO 动感单车 家用健身车 黑色 F8218 9成新', '49', '1', 'pd07.jpg', '33', '2');
INSERT INTO `orderdetail` VALUES ('8', '57', 'CTO 动感单车 家用健身车 黑色 F8218 9成新', '49', '1', 'pd07.jpg', '33', '2');
INSERT INTO `orderdetail` VALUES ('9', '58', '简约现代 电脑桌 电脑书桌 书桌 可置物 枫樱木 枫木色', '49', '1', 'pd02.jpg', '20', '2');
INSERT INTO `orderdetail` VALUES ('10', '59', '简约现代 电脑桌 电脑书桌 书桌 可置物 枫樱木 枫木色', '49', '1', 'pd02.jpg', '20', '2');
INSERT INTO `orderdetail` VALUES ('11', '60', '简约现代 电脑桌 电脑书桌 书桌 可置物 枫樱木 枫木色', '49', '1', 'pd02.jpg', '20', '2');
INSERT INTO `orderdetail` VALUES ('12', '64', '简约现代 电脑桌 电脑书桌 书桌 可置物 枫樱木 枫木色', '49', '1', 'pd02.jpg', '20', '2');
INSERT INTO `orderdetail` VALUES ('13', '65', '简约现代 电脑桌 电脑书桌 书桌 可置物 枫樱木 枫木色', '49', '1', 'pd02.jpg', '20', '2');
INSERT INTO `orderdetail` VALUES ('14', '67', '一加 6手机 OnePlus6 全面屏游戏手机 全网通4G 双卡双待 琥珀红 8G+128G', '50', '6', 'o6r.jpg', '80', '2');
INSERT INTO `orderdetail` VALUES ('15', '68', '皇冠电热水器DRB-40D防电墙40升', '49', '1', 'p6.jpg', '36', '2');
INSERT INTO `orderdetail` VALUES ('16', '71', '皇冠电热水器DRB-40D防电墙40升', '49', '1', 'p6.jpg', '36', '2');
INSERT INTO `orderdetail` VALUES ('17', '74', 'CTO 动感单车 家用健身车 黑色 F8218 9成新', '49', '1', 'pd07.jpg', '33', '2');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键(订单表)',
  `userName` varchar(255) NOT NULL COMMENT '下单用户名',
  `orderDate` datetime NOT NULL,
  `orderTPrice` double(20,0) NOT NULL COMMENT '订单总价',
  `userAddress` varchar(255) NOT NULL,
  `userTel` varchar(255) NOT NULL,
  `orderState` int(20) NOT NULL DEFAULT '0' COMMENT '0未发货，1已发货,2已收货,',
  PRIMARY KEY (`orderId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'azhuge', '2018-10-07 09:57:46', '123', '福建厦门', '13799956074', '1');
INSERT INTO `orders` VALUES ('2', 'azhuge', '2018-10-09 09:59:41', '2222', '福建福清', '13799956074', '0');
INSERT INTO `orders` VALUES ('58', 'azhuge', '2018-10-21 21:24:13', '170', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('59', 'azhuge', '2018-10-21 21:24:59', '170', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('60', 'azhuge', '2018-10-21 21:42:23', '40', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('61', 'azhuge', '2018-10-21 21:44:58', '40', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('62', 'azhuge', '2018-10-21 21:45:05', '40', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('63', 'azhuge', '2018-10-21 21:45:05', '40', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('64', 'azhuge', '2018-10-21 21:46:27', '40', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('65', 'azhuge', '2018-10-21 21:59:23', '40', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('66', 'azhuge', '2018-10-21 21:59:49', '40', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('67', 'azhuge', '2018-10-21 22:00:26', '980', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('68', 'azhuge', '2018-10-21 22:46:35', '56', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('69', 'azhuge', '2018-10-21 22:47:50', '56', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('70', 'azhuge', '2018-10-21 22:48:03', '56', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('71', 'azhuge', '2018-10-21 22:49:22', '56', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('72', 'azhuge', '2018-10-21 22:49:49', '56', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('73', 'azhuge', '2018-10-21 22:50:03', '56', '福建厦门市思明区明发园', '13254565212', '0');
INSERT INTO `orders` VALUES ('74', 'azhuge', '2018-10-21 22:50:58', '53', '福建厦门市思明区明发园', '13254565212', '0');

-- ----------------------------
-- Table structure for `reevaluate`
-- ----------------------------
DROP TABLE IF EXISTS `reevaluate`;
CREATE TABLE `reevaluate` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '再次评论',
  `lastuserId` int(11) DEFAULT NULL COMMENT '上一次用户评论的Id',
  `userName` varchar(255) DEFAULT NULL COMMENT '本次评论用户名',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL,
  `evaluateId` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `evaluateId` (`evaluateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reevaluate
-- ----------------------------

-- ----------------------------
-- Table structure for `releasegoods`
-- ----------------------------
DROP TABLE IF EXISTS `releasegoods`;
CREATE TABLE `releasegoods` (
  `releaseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '发布Id',
  `goodId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL COMMENT '用户Id',
  `releaseState` varchar(255) DEFAULT NULL COMMENT '0未审核，1审核失败，2审核通过',
  `releaseDate` datetime DEFAULT NULL,
  PRIMARY KEY (`releaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of releasegoods
-- ----------------------------
INSERT INTO `releasegoods` VALUES ('1', '1', '1', '1', '2018-10-15 16:14:23');
INSERT INTO `releasegoods` VALUES ('2', '2', '2', '1', '2018-10-11 00:00:00');
INSERT INTO `releasegoods` VALUES ('3', '3', '3', '3', '2018-10-15 16:14:46');
INSERT INTO `releasegoods` VALUES ('4', '1', '2', '2', '2018-10-14 17:42:57');
INSERT INTO `releasegoods` VALUES ('5', '4', null, '1', '2018-10-15 17:44:00');
INSERT INTO `releasegoods` VALUES ('6', '5', null, '2', '2018-10-15 17:44:03');
INSERT INTO `releasegoods` VALUES ('7', '6', null, '2', '2018-10-15 17:44:06');
INSERT INTO `releasegoods` VALUES ('8', '47', '11', '1', '2013-10-02 16:14:37');
INSERT INTO `releasegoods` VALUES ('9', '48', '22', '2', null);
INSERT INTO `releasegoods` VALUES ('10', '49', '33', '2', null);
INSERT INTO `releasegoods` VALUES ('13', '51', '55', '1', null);

-- ----------------------------
-- Table structure for `returnsituation`
-- ----------------------------
DROP TABLE IF EXISTS `returnsituation`;
CREATE TABLE `returnsituation` (
  `returnId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品归还Id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单Id(买家信息)',
  `goodId` int(11) DEFAULT NULL COMMENT '商品Id（卖家信息，商品名称）',
  `returnGoodState` double(20,0) DEFAULT NULL COMMENT '商品状态（损坏）按小数计算新旧程度',
  `returnState` varchar(11) DEFAULT NULL COMMENT '订单归还状态：0未归还1：已归还',
  `returnPrice` double(20,0) DEFAULT NULL COMMENT '归还押金',
  PRIMARY KEY (`returnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of returnsituation
-- ----------------------------

-- ----------------------------
-- Table structure for `salecount`
-- ----------------------------
DROP TABLE IF EXISTS `salecount`;
CREATE TABLE `salecount` (
  `saleId` int(11) NOT NULL COMMENT '销售Id',
  `typeId` int(11) DEFAULT NULL,
  `saleCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`saleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salecount
-- ----------------------------

-- ----------------------------
-- Table structure for `shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `cartId` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键（购物车）',
  `userId` int(20) DEFAULT NULL,
  `goodId` int(20) DEFAULT NULL COMMENT '外键（商品表）',
  `goodNumber` int(20) DEFAULT NULL COMMENT '商品数量',
  `rentDays` varchar(20) DEFAULT '1',
  PRIMARY KEY (`cartId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(50) NOT NULL,
  `userPwd` varchar(32) DEFAULT NULL COMMENT 'md5加密',
  `userState` varchar(11) DEFAULT '1' COMMENT '用户状态0不正常,1正常',
  `userphoto` varchar(50) DEFAULT NULL COMMENT '用户头像',
  `userRegisterTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'azhuge', 'e10adc3949ba59abbe56e057f20f883e', '1', '11.jpg', '2018-10-11 15:09:49');
INSERT INTO `users` VALUES ('2', 'mada', '202cb962ac59075b964b07152d234b70', '1', null, '2018-10-15 09:20:08');

-- ----------------------------
-- Table structure for `usersdetail`
-- ----------------------------
DROP TABLE IF EXISTS `usersdetail`;
CREATE TABLE `usersdetail` (
  `userDetailId` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键 (用户详细信息)',
  `userName` varchar(20) NOT NULL COMMENT '外键（用户表）',
  `userPhone` varchar(20) DEFAULT NULL,
  `userAddress` varchar(50) DEFAULT NULL,
  `userRealName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userDetailId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1510 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usersdetail
-- ----------------------------
INSERT INTO `usersdetail` VALUES ('1434', 'azhuge', '13254565212', '福建厦门市思明区明发园', '老王');
INSERT INTO `usersdetail` VALUES ('1493', 'mada', '13456548451', '福建厦门市思明区厦门中软国际', '马达2');
INSERT INTO `usersdetail` VALUES ('1495', '小白', '13456548451', '福建厦门市集美区理工学院', '马达');
INSERT INTO `usersdetail` VALUES ('1505', '马大', '13254565212', '天津市辖区和平区福建福清', '马达');
INSERT INTO `usersdetail` VALUES ('1506', 'azhuge', '13799956074', '福建厦门市集美区厦门理工学院', '马达');
