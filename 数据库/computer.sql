/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : computer
Target Host     : localhost:3306
Target Database : computer
Date: 2020-04-08 20:34:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for attachement
-- ----------------------------
DROP TABLE IF EXISTS `attachement`;
CREATE TABLE `attachement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongfileldname` varchar(255) DEFAULT NULL,
  `belongid` varchar(255) DEFAULT NULL,
  `belongtable` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachement
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongid` varchar(255) DEFAULT NULL,
  `commentcontent` varchar(255) DEFAULT NULL,
  `commentren` varchar(255) DEFAULT NULL,
  `commenttime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `defen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('10', '5', '好的', '2018041601', '2018-04-16 09:27:07', null, 'shangpin', '/computer/upload/temp/u=447557492,209300989&fm=27&gp=0.jpg', '5');
INSERT INTO `comment` VALUES ('11', '2', '123444444444441234', '13732921234', '2018-04-22 23:37:31', null, 'shangpin', '/computer/upload/temp/u=3762282580,2654694471&fm=27&gp=0.jpg', '5');
INSERT INTO `comment` VALUES ('12', '2', '1234444344', '2018042301', '2018-04-23 00:57:42', null, 'shangpin', '/computer/upload/temp/u=2797276922,3533483258&fm=58&bpow=700&bpoh=998.jpg', '5');

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `fahuoren` varchar(255) DEFAULT NULL,
  `fahuotime` datetime DEFAULT NULL,
  `shouhuodizhi` varchar(255) DEFAULT NULL,
  `shraddress` varchar(255) DEFAULT NULL,
  `shrname` varchar(255) DEFAULT NULL,
  `shrtel` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `totalprice` double NOT NULL,
  `xiadanren` varchar(255) DEFAULT NULL,
  `xiadantime` datetime DEFAULT NULL,
  `shname` varchar(255) DEFAULT NULL,
  `totaljifen` double DEFAULT NULL,
  `wlorderno` varchar(255) DEFAULT NULL,
  `wltype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES ('1', 'D20183622230409', '                         \r\n    12344                     ', '', '2018-04-22 23:37:20', '北京市海淀区啊啊啊啊', null, '李元霸', '16607080660', '已收货', '', '6500', '13732921234', '2018-04-22 23:36:09', null, '0', '', '');
INSERT INTO `dingdan` VALUES ('2', 'D20185623000425', '                         \r\n     123444', '', '2018-04-23 00:57:30', '北京市海淀区啊啊啊啊', null, '法海', '15925672665', '已收货', '', '6500', '2018042301', '2018-04-23 00:56:25', null, '0', '', '');
INSERT INTO `dingdan` VALUES ('3', 'D20202102130401', '       无                  \r\n                         ', null, '2020-04-02 13:21:01', '山东', null, '彭祥', '17863276451', '待付款', '', '9000', 'pengxiang', '2020-04-02 13:21:01', null, '0', null, null);
INSERT INTO `dingdan` VALUES ('4', 'D20201006120404', '                         \r\n               无          ', null, '2020-04-06 12:10:04', '山东', null, '鹏翔', '17863454545', '已取消', '', '12500', 'yuehao', '2020-04-06 12:10:04', null, '0', null, null);
INSERT INTO `dingdan` VALUES ('5', 'D20201406120451', '       fgfgfg                  \r\n                         ', null, '2020-04-06 12:14:51', 'fgfg', null, '鹏翔', 'fgfgfgf', '已取消', '', '6000', 'yuehao', '2020-04-06 12:14:51', null, '0', null, null);
INSERT INTO `dingdan` VALUES ('6', 'D20201806160434', '                         \r\n           无              ', null, '2020-04-06 16:18:34', '大股东', null, '鹏翔', '17863454545', '已取消', '', '6000', 'yuehao', '2020-04-06 16:18:34', null, '0', null, null);
INSERT INTO `dingdan` VALUES ('7', 'D20202406180456', '         iiii                \r\n                         ', null, '2020-04-06 18:24:56', 'iiii', null, '鹏翔', '17863454545', '待付款', '', '3000', 'yuehao', '2020-04-06 18:24:56', null, '0', null, null);

-- ----------------------------
-- Table structure for dingdanitems
-- ----------------------------
DROP TABLE IF EXISTS `dingdanitems`;
CREATE TABLE `dingdanitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `jiage` double(255,0) DEFAULT NULL,
  `shuliang` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `spimage` varchar(255) DEFAULT NULL,
  `spname` varchar(255) DEFAULT NULL,
  `spno` varchar(255) DEFAULT NULL,
  `hyjia` double DEFAULT NULL,
  `shname` varchar(255) DEFAULT NULL,
  `tuihuan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdanitems
-- ----------------------------
INSERT INTO `dingdanitems` VALUES ('1', 'D20183622230409', '13732921234购买Apple MacBook Air 13.3英寸笔记本电脑 银色', '6500', '1', '2', '/computer/upload/temp/5a6947e5N39e16ed8.jpg', 'Apple MacBook Air 13.3英寸笔记本电脑 银色', 'SP2018012223045700001', null, null, '0');
INSERT INTO `dingdanitems` VALUES ('2', 'D20185623000425', '2018042301购买Apple MacBook Air 13.3英寸笔记本电脑 银色', '6500', '1', '2', '/computer/upload/temp/5a6947e5N39e16ed8.jpg', 'Apple MacBook Air 13.3英寸笔记本电脑 银色', 'SP2018012223045700001', null, null, '0');
INSERT INTO `dingdanitems` VALUES ('3', 'D20202102130401', 'pengxiang购买Apple iPad 平板电脑 9.7英寸（128G WLAN版/A9 芯片/Retina显示屏/Touch ID技术 MP2H2CH/A）', '3000', '3', '4', '/computer/upload/temp/58d16208N55e7302b.jpg', 'Apple iPad 平板电脑 9.7英寸（128G WLAN版/A9 芯片/Retina显示屏/Touch ID技术 MP2H2CH/A）', 'SP2018102223043100001', null, null, '0');
INSERT INTO `dingdanitems` VALUES ('4', 'D20201006120404', 'yuehao购买Apple MacBook Air 13.3英寸笔记本电脑 银色', '6500', '1', '2', '/computer/upload/temp/5a6947e5N39e16ed8.jpg', 'Apple MacBook Air 13.3英寸笔记本电脑 银色', 'SP2018012223045700001', null, null, '0');
INSERT INTO `dingdanitems` VALUES ('5', 'D20201006120404', 'yuehao购买联想(Lenovo)拯救者R720 15.6英寸大屏游戏笔记本电脑', '6000', '1', '1', '/computer/upload/temp/5aa8c8a8N7cc84d18.jpg', '联想(Lenovo)拯救者R720 15.6英寸大屏游戏笔记本电脑', 'SP2018592222044500001', null, null, '0');
INSERT INTO `dingdanitems` VALUES ('6', 'D20201406120451', 'yuehao购买联想(Lenovo)拯救者R720 15.6英寸大屏游戏笔记本电脑', '6000', '1', '1', '/computer/upload/temp/5aa8c8a8N7cc84d18.jpg', '联想(Lenovo)拯救者R720 15.6英寸大屏游戏笔记本电脑', 'SP2018592222044500001', null, null, '0');
INSERT INTO `dingdanitems` VALUES ('7', 'D20201806160434', 'yuehao购买联想(Lenovo)小新潮7000 14英寸轻薄窄边框笔记本电脑', '6000', '1', '3', '/computer/upload/temp/5abb4771N00801fa8.jpg', '联想(Lenovo)小新潮7000 14英寸轻薄窄边框笔记本电脑', 'SP2018052223045000001', null, null, '0');
INSERT INTO `dingdanitems` VALUES ('8', 'D20202406180456', 'yuehao购买戴尔(DELL)灵越AIO 3464 23.8英寸一体机台式电脑(i', '3000', '1', '16', '/computer/upload/temp/5a6ea6a4N1a188de5.jpg', '戴尔(DELL)灵越AIO 3464 23.8英寸一体机台式电脑(i', 'SP2018392223044300001', null, null, '0');

-- ----------------------------
-- Table structure for friendlink
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendlink
-- ----------------------------
INSERT INTO `friendlink` VALUES ('1', 'http://mall.jumei.com', '聚美优品');

-- ----------------------------
-- Table structure for huiyuan
-- ----------------------------
DROP TABLE IF EXISTS `huiyuan`;
CREATE TABLE `huiyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `aihao` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jibie` varchar(255) DEFAULT NULL,
  `jifen` int(11) NOT NULL,
  `logtimes` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `touxiang` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  `yue` float NOT NULL,
  `zhiye` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `idcardno` varchar(255) DEFAULT NULL,
  `paypwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of huiyuan
-- ----------------------------
INSERT INTO `huiyuan` VALUES ('3', 'pengxiang', null, null, 'pengxiangadmin@163.com', '初级', '0', '2', null, '彭祥', 'pengxiang', 'admin', '2020-04-02 13:17:51', '男', '1', '/computer/upload/nopic.jpg', '普通会员', '1000', null, '', '', '123456');
INSERT INTO `huiyuan` VALUES ('4', 'yuehao', '', null, '21865274242@qq.com', null, '0', '9', '', '鹏翔', 'yuehao', '123456', '2020-04-06 12:08:25', '男', '1', '/computer/upload/nopic.jpg', '普通会员', '1000', null, '', '', '123456');

-- ----------------------------
-- Table structure for indexcolumns
-- ----------------------------
DROP TABLE IF EXISTS `indexcolumns`;
CREATE TABLE `indexcolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coldes` varchar(255) DEFAULT NULL,
  `colid` int(11) NOT NULL,
  `showstyle` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indexcolumns
-- ----------------------------
INSERT INTO `indexcolumns` VALUES ('5', '笔记本', '2', '图片', '商品');
INSERT INTO `indexcolumns` VALUES ('6', '轻薄本', '3', '图片', '商品');
INSERT INTO `indexcolumns` VALUES ('7', '台式机', '5', '图片', '商品');
INSERT INTO `indexcolumns` VALUES ('8', '一体机', '6', '图片', '商品');

-- ----------------------------
-- Table structure for jiaodiantu
-- ----------------------------
DROP TABLE IF EXISTS `jiaodiantu`;
CREATE TABLE `jiaodiantu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `pindex` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jiaodiantu
-- ----------------------------
INSERT INTO `jiaodiantu` VALUES ('1', '#', '0', '电脑专场', '/computer/upload/temp/T1GPWjBTYT1RCvBVdK.jpg', '站内');
INSERT INTO `jiaodiantu` VALUES ('2', '#', '0', '狂欢海购', '/computer/upload/temp/T1x5_QBTZT1RCvBVdK.jpg', '站内');
INSERT INTO `jiaodiantu` VALUES ('3', '#', '0', '愉悦无限', '/computer/upload/temp/T1vLZbBKWT1RCvBVdK.jpg', '站内');

-- ----------------------------
-- Table structure for lanmu
-- ----------------------------
DROP TABLE IF EXISTS `lanmu`;
CREATE TABLE `lanmu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `isleaf` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lanmu
-- ----------------------------
INSERT INTO `lanmu` VALUES ('2', '2017-04-26 17:47:35', '', '', '1', '0', '商城活动');
INSERT INTO `lanmu` VALUES ('3', '2017-04-26 17:47:41', '', '', '1', '0', '新闻资讯');
INSERT INTO `lanmu` VALUES ('4', '2018-04-16 08:56:04', '', null, '1', '0', '电脑常识');

-- ----------------------------
-- Table structure for leaveword
-- ----------------------------
DROP TABLE IF EXISTS `leaveword`;
CREATE TABLE `leaveword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dcontent` varchar(255) DEFAULT NULL,
  `lwren` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `replycontent` varchar(255) DEFAULT NULL,
  `replyren` varchar(255) DEFAULT NULL,
  `replytime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaveword
-- ----------------------------
INSERT INTO `leaveword` VALUES ('8', '12344444444测试啊啊啊', '2018042301', '/computer/upload/temp/u=2797276922,3533483258&fm=58&bpow=700&bpoh=998.jpg', '2018-04-23 00:58:13', '测试回复', 'admin', '2018-04-23 01:01:30', '1', '');

-- ----------------------------
-- Table structure for mingan
-- ----------------------------
DROP TABLE IF EXISTS `mingan`;
CREATE TABLE `mingan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mingan
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clickcount` int(11) NOT NULL,
  `dcontent` text,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '3', '发布系统公告测试', 'admin', '2018-04-23 01:01:23', '发布系统公告测试');

-- ----------------------------
-- Table structure for secquestion
-- ----------------------------
DROP TABLE IF EXISTS `secquestion`;
CREATE TABLE `secquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secquestion
-- ----------------------------

-- ----------------------------
-- Table structure for shangpin
-- ----------------------------
DROP TABLE IF EXISTS `shangpin`;
CREATE TABLE `shangpin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dazhe` int(11) NOT NULL,
  `hot` int(11) NOT NULL,
  `hyjia` int(11) NOT NULL,
  `jiage` double DEFAULT NULL,
  `jieshao` text,
  `name` varchar(2000) DEFAULT NULL,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `spno` varchar(255) DEFAULT NULL,
  `sptype` varchar(255) DEFAULT NULL,
  `sptypeid` int(11) NOT NULL,
  `tuijian` int(11) NOT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `zuixin` int(11) NOT NULL,
  `danwei` varchar(255) DEFAULT NULL,
  `computer` int(11) DEFAULT NULL,
  `pubname` varchar(255) DEFAULT NULL,
  `jifen` int(11) DEFAULT NULL,
  `kucun` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `tuihuan` int(11) DEFAULT NULL,
  `pinpai` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin
-- ----------------------------
INSERT INTO `shangpin` VALUES ('1', '1', '1', '6000', '6090', '<img src=\"https://img30.360buyimg.com/sku/jfs/t18913/328/815946595/398498/b8e65fd0/5aa8caccN6ef1e624.jpg\" />', '联想(Lenovo)拯救者R720 15.6英寸大屏游戏笔记本电脑', '', '2018-04-22 22:59:45', 'SP2018592222044500001', '笔记本', '2', '1', '/computer/upload/temp/5aa8c8a8N7cc84d18.jpg', '0', '台', null, null, '0', '98', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('2', '1', '1', '6500', '6588', '<p>\r\n	<div id=\"activity_header\" clstag=\"shangpin|keycount|product|activityheader\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, &quot;white-space:normal;background-color:#FFFFFF;\">\r\n		<div align=\"center\" style=\"margin:0px;padding:0px;\">\r\n			<a href=\"https://item.jd.com/6749532.html\" target=\"_blank\" style=\"margin:0px;padding:0px;color:#666666;text-decoration:none;\"><img alt=\"\" width=\"750\" border=\"0\" height=\"330\" class=\"\" src=\"https://img11.360buyimg.com/cms/jfs/t16903/176/1710755445/25739/ca3289e1/5ad6bd22N475376da.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" /></a>\r\n		</div>\r\n	</div>\r\n	<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, &quot;white-space:normal;background-color:#FFFFFF;\">\r\n		<table id=\"__01\" width=\"750\" height=\"1024\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"ke-zeroborder\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<img width=\"750\" height=\"248\" alt=\"\" usemap=\"#Map01\" border=\"0\" class=\"\" src=\"https://img10.360buyimg.com/imgzone/jfs/t18694/239/653274801/84369/98d97629/5a9eb2e2Nee71d0a1.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" />\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img width=\"750\" height=\"360\" alt=\"\" class=\"\" src=\"https://img10.360buyimg.com/imgzone/jfs/t15214/72/2409872661/64644/fa8a03f2/5a9eb2e2Nf52bcbf9.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" />\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img width=\"750\" height=\"416\" alt=\"\" usemap=\"#Map02\" border=\"0\" class=\"\" src=\"https://img10.360buyimg.com/imgzone/jfs/t15991/52/2291983610/57759/d9a05971/5a9eb2e2N1347ea84.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" />\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<map name=\"Map01\">\r\n			<area shape=\"rect\" coords=\"42,64,139,192\" href=\"https://mall.jd.com/view_page-86030491.html#yuanzhuangpeijian\" target=\"_blank\" /><area shape=\"rect\" coords=\"183,64,281,191\" href=\"https://item.jd.com/6095131.html\" target=\"_blank\" /><area shape=\"rect\" coords=\"324,63,422,191\" href=\"https://mall.jd.com/view_page-86030491.html#jingzhunda\" target=\"_blank\" /><area shape=\"rect\" coords=\"463,63,562,191\" href=\"https://mall.jd.com/view_page-86030491.html#jingdongweixiu\" target=\"_blank\" /><area shape=\"rect\" coords=\"604,63,703,191\" href=\"https://mall.jd.com/view_page-86030491.html#yijiuhuanxin\" target=\"_blank\" />\r\n		</map>\r\n		<map name=\"Map02\">\r\n			<area shape=\"rect\" coords=\"9,49,244,409\" href=\"https://item.jd.com/2187061.html\" target=\"_blank\" /><area shape=\"rect\" coords=\"259,49,490,407\" href=\"https://item.jd.com/311404.html\" target=\"_blank\" /><area shape=\"rect\" coords=\"505,47,741,405\" href=\"https://item.jd.com/778422.html\" target=\"_blank\" />\r\n		</map>\r\n		<div align=\"center\" style=\"margin:0px;padding:0px;\">\r\n			<img alt=\"\" width=\"640\" height=\"250\" class=\"\" src=\"https://img11.360buyimg.com/cms/jfs/t5752/310/5868213562/39921/aef89842/5965efbfN3628426d.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" /><img alt=\"\" width=\"640\" height=\"250\" class=\"\" src=\"https://img13.360buyimg.com/cms/jfs/t6505/108/2688518015/51626/92777a5/5965efd4N8b377773.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" /><img alt=\"\" width=\"640\" height=\"250\" class=\"\" src=\"https://img11.360buyimg.com/cms/jfs/t6649/270/2661504985/99377/483b6062/5965f02bNef3065b2.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" /><img alt=\"\" width=\"640\" height=\"250\" class=\"\" src=\"https://img14.360buyimg.com/cms/jfs/t6544/248/2634974450/26809/c622f5ca/5965f021N39361128.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" /><img alt=\"\" width=\"640\" height=\"250\" class=\"\" src=\"https://img13.360buyimg.com/cms/jfs/t6742/315/2624936529/20852/df4ec514/5965f036N5adcb689.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" /><img alt=\"\" width=\"640\" height=\"250\" class=\"\" src=\"https://img11.360buyimg.com/cms/jfs/t6343/97/2697407639/49423/3da95345/5965f02eNe46d3232.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" /><img alt=\"\" width=\"640\" height=\"250\" class=\"\" src=\"https://img10.360buyimg.com/cms/jfs/t6613/214/2660061283/25445/24e191e0/5965f041N0179b417.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" /><img alt=\"\" width=\"640\" height=\"250\" class=\"\" src=\"https://img12.360buyimg.com/cms/jfs/t6106/152/4584785980/31053/c824de2f/5965f046Ne0300ed1.jpg\" style=\"margin:0px;padding:0px;vertical-align:middle;\" />\r\n		</div>\r\n	</div>\r\n</p>\r\n<p>\r\n	<img src=\"https://img11.360buyimg.com/cms/jfs/t6343/97/2697407639/49423/3da95345/5965f02eNe46d3232.jpg\" />\r\n</p>', 'Apple MacBook Air 13.3英寸笔记本电脑 银色', '', '2018-04-22 23:01:57', 'SP2018012223045700001', '笔记本', '2', '0', '/computer/upload/temp/5a6947e5N39e16ed8.jpg', '0', '台', null, null, '0', '45', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('3', '0', '0', '6000', '6000', '<p>\r\n	<img src=\"https://img30.360buyimg.com/sku/jfs/t9208/196/238351348/248878/f213c8b1/59a395e7N4161cb30.jpg\" />\r\n</p>\r\n<p>\r\n	<span style=\"white-space:nowrap;\"></span>\r\n</p>', '联想(Lenovo)小新潮7000 14英寸轻薄窄边框笔记本电脑', '', '2018-04-22 23:05:50', 'SP2018052223045000001', '笔记本', '2', '0', '/computer/upload/temp/5abb4771N00801fa8.jpg', '0', '台', null, null, '0', '9', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('4', '1', '0', '3000', '3200', '<img src=\"https://img13.360buyimg.com/cms/jfs/t17161/308/291342769/140883/a5db93a0/5a6881b4N0b71b8ff.jpg\" />', 'Apple iPad 平板电脑 9.7英寸（128G WLAN版/A9 芯片/Retina显示屏/Touch ID技术 MP2H2CH/A）', '', '2018-04-22 23:10:31', 'SP2018102223043100001', 'IPAD', '9', '1', '/computer/upload/temp/58d16208N55e7302b.jpg', '0', '台', null, null, '0', '7', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('5', '0', '0', '5680', '5680', '<img src=\"https://img11.360buyimg.com/cms/jfs/t15037/110/2085395624/270679/b94c8eba/5a6a95b9N4f0d1a21.jpg\" />', 'Apple iPad Pro 平板电脑 12.9英寸（64G WLAN版/A10X芯片/Retina屏/Multi-Touch技术 MQDA2CH/A）深空灰色', null, '2018-04-22 23:13:28', 'SP2018122223042200001', 'IPAD', '9', '0', '/computer/upload/temp/59379a84N9399bd00.jpg', '0', '台', null, null, '0', '10', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('6', '0', '0', '2890', '2890', '<img src=\"https://img20.360buyimg.com/vc/jfs/t17443/58/472662614/1640612/122f65a8/5a7c1ebcN0d53b382.jpg\" />', '英特尔（Intel） i7 8700K 酷睿六核 盒装CPU处理器', '', '2018-04-22 23:14:44', 'SP2018142223044400001', 'CPU', '12', '1', '/computer/upload/temp/59db8e3bN55e3b5a2.jpg', '0', null, null, null, '0', '0', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('7', '0', '0', '1346', '1346', '<img src=\"https://img14.360buyimg.com/cms/jfs/t18247/54/461303073/204966/2ae61291/5a7be374N1eafd180.jpg\" />', ' 英特尔（Intel） i5 7500 酷睿四核 盒装', null, '2018-04-22 23:16:19', 'SP2018152223045800001', 'CPU', '12', '0', '/computer/upload/temp/59affdbfN14674648.jpg', '0', null, null, null, '0', '0', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('8', '0', '0', '2500', '2500', '<img src=\"https://img20.360buyimg.com/vc/jfs/t17869/13/1836257824/1565285/4ef24470/5ad95237N8c865b08.jpg\" />', 'AMD 锐龙 7 2700X 处理器 8核16线程 AM4 接口 3.7GHz 盒装', '', '2018-04-22 23:17:28', 'SP2018172223042800001', 'CPU', '12', '0', '/computer/upload/temp/5ac46214N0f6ae0c4.jpg', '1', null, null, null, '0', '0', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('9', '0', '0', '759', '759', '<img src=\"https://img20.360buyimg.com/vc/jfs/t4108/133/1407375145/1717832/5c540f75/5874a7ccN14e83af5.jpg\" />', '英特尔（Intel） i3 7100 酷睿双核 盒装CPU处理器', '', '2018-04-22 23:18:24', 'SP2018182223042400001', 'CPU', '12', '0', '/computer/upload/temp/59affd39Nfcfc0110.jpg', '0', null, null, null, '0', '0', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('10', '0', '0', '369', '369', '<p>\r\n	<img src=\"https://img10.360buyimg.com/imgzone/jfs/t16696/332/1657299381/105338/23a5ea63/5ad46148N2446d2e9.jpg\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"https://img30.360buyimg.com/sku/jfs/t14473/252/591374844/324904/1a892b51/5a32214fNb1ac5b1e.jpg\" />\r\n</p>', '罗技（Logitech）G502 炫光自适应游戏鼠标 RGB鼠标 FPS鼠标 吃鸡鼠标 绝地求生', '', '2018-04-22 23:20:46', 'SP2018202223044600001', '鼠标', '19', '0', '/computer/upload/temp/568f56f4N51dbec26.jpg', '0', null, null, null, '0', '0', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('11', '0', '0', '58', '58', '<img src=\"https://img30.360buyimg.com/sku/jfs/t3205/198/6238271228/135557/bec5d6a9/58a16197N045fe63a.jpg\" />', '罗技（Logitech）M185（M186）无线鼠标 黑色灰边', null, '2018-04-22 23:22:14', 'SP2018222223040200001', '鼠标', '19', '0', '/computer/upload/temp/56f20611N924b233c.jpg', '0', null, null, null, '0', '0', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('12', '0', '0', '10778', '10778', '<img src=\"https://img30.360buyimg.com/sku/jfs/t10285/342/2314576711/111796/97180aac/59f42ea7N0fd897b8.png\" />', '联想（Lenovo）拯救者刃9000 UIY吃鸡游戏台式电脑主机', '', '2018-04-22 23:24:08', 'SP2018242223040800001', '游戏电脑', '26', '0', '/computer/upload/temp/5a7014d7N0c3cbc92.jpg', '0', '台', null, null, '0', '10', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('13', '0', '1', '5600', '5600', '<img src=\"https://img30.360buyimg.com/sku/jfs/t18550/168/445868701/143929/17fa090e/5a7fea31N02997fae.jpg\" />', '小米(MI)Air 13.3英寸全金属超轻薄笔记本电脑(i7-8550U 8G 256GSSD', '', '2018-04-22 23:26:01', 'SP2018262223040100001', '轻薄本', '3', '0', '/computer/upload/temp/5a814c93Ne3c3d51c.jpg', '0', null, null, null, '0', '0', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('14', '0', '0', '5500', '5500', '<img src=\"https://img20.360buyimg.com/vc/jfs/t16588/93/953447928/145515/4b03d2df/5a45b256N5897b311.jpg\" />', '惠普（HP）246 G6 14英寸笔记本电脑（i5-7200U 8G 256G SSD 2G独显 Win10 一年上门）', '', '2018-04-22 23:27:33', 'SP2018272223043300001', '轻薄本', '3', '0', '/computer/upload/temp/59941f74Nab9712af.jpg', '0', '台', null, null, '0', '10', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('15', '0', '1', '3800', '3999', '<img src=\"https://img30.360buyimg.com/sku/jfs/t11269/136/1310410238/396167/4ed7fadc/5a002a7bNc66ff8de.jpg\" />', '戴尔(DELL)灵越3668台式电脑整机(i5-7400 8G 1T 2G独显 DVD WIFI 三年上门 有', null, '2018-04-22 23:29:39', 'SP2018292223043000001', '台式机', '5', '1', '/computer/upload/temp/5ac48880Nb683a8db.jpg', '1', null, null, null, '0', '0', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('16', '1', '0', '3000', '3200', '<img src=\"https://img30.360buyimg.com/sku/jfs/t3142/274/5782119421/392128/ece9f66c/58808569N7710aedb.jpg\" />', '戴尔(DELL)灵越AIO 3464 23.8英寸一体机台式电脑(i', '', '2018-04-22 23:39:43', 'SP2018392223044300001', '一体机', '6', '1', '/computer/upload/temp/5a6ea6a4N1a188de5.jpg', '0', '台', null, null, '0', '9', '1', '0', '联想', '好电脑，小米造');
INSERT INTO `shangpin` VALUES ('17', '0', '0', '2200', '2200', '<img src=\"https://img20.360buyimg.com/vc/jfs/t2731/180/3429863697/149042/496970ed/578d99afN946f7efb.jpg\" />', '索泰（ZOTAC）GeForce GTX1060-6GD5 X-GAMING OC 绝地求生/吃鸡显卡', '', '2018-04-23 01:00:02', 'SP2018002301040200001', '显卡', '15', '1', '/computer/upload/temp/59896cadN7c170bf7.jpg', '0', '张', null, null, '0', '10', '1', '0', '索泰', '绝地求生，绝杀显卡');

-- ----------------------------
-- Table structure for shoucang
-- ----------------------------
DROP TABLE IF EXISTS `shoucang`;
CREATE TABLE `shoucang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `scren` varchar(255) DEFAULT NULL,
  `sctime` datetime DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoucang
-- ----------------------------
INSERT INTO `shoucang` VALUES ('5', '37', '福建土楼特产 红香蕉 新鲜红皮香蕉 2.5kg', '18957158888', '2017-06-15 23:59:45', '/agrisale/upload/temp/57d7b150N05098631.jpg');
INSERT INTO `shoucang` VALUES ('6', '5', '维连衣裙短袖春2018新款两件套套装裙时尚套装', '2018041601', '2018-04-16 09:25:39', '/computer/upload/temp/5ac9a6fdN71a37484.jpg!cc_230x322.jpg');
INSERT INTO `shoucang` VALUES ('7', '2', 'Apple MacBook Air 13.3英寸笔记本电脑 银色', '13732921234', '2018-04-22 23:35:54', '/computer/upload/temp/5a6947e5N39e16ed8.jpg');
INSERT INTO `shoucang` VALUES ('8', '2', 'Apple MacBook Air 13.3英寸笔记本电脑 银色', '2018042301', '2018-04-23 00:57:55', '/computer/upload/temp/5a6947e5N39e16ed8.jpg');
INSERT INTO `shoucang` VALUES ('9', '17', '索泰（ZOTAC）GeForce GTX1060-6GD5 X-GAMING OC 绝地求生/吃鸡显卡', '2018042301', '2018-04-23 01:00:40', '/computer/upload/temp/59896cadN7c170bf7.jpg');
INSERT INTO `shoucang` VALUES ('10', '6', '英特尔（Intel） i7 8700K 酷睿六核 盒装CPU处理器', 'pengxiang', '2020-04-02 13:22:31', '/computer/upload/temp/59db8e3bN55e3b5a2.jpg');
INSERT INTO `shoucang` VALUES ('11', '13', '小米(MI)Air 13.3英寸全金属超轻薄笔记本电脑(i7-8550U 8G 256GSSD', 'pengxiang', '2020-04-02 13:35:44', '/computer/upload/temp/5a814c93Ne3c3d51c.jpg');
INSERT INTO `shoucang` VALUES ('12', '15', '戴尔(DELL)灵越3668台式电脑整机(i5-7400 8G 1T 2G独显 DVD WIFI 三年上门 有', 'yuehao', '2020-04-06 16:17:40', '/computer/upload/temp/5ac48880Nb683a8db.jpg');

-- ----------------------------
-- Table structure for sitenav
-- ----------------------------
DROP TABLE IF EXISTS `sitenav`;
CREATE TABLE `sitenav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `sindex` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sitenav
-- ----------------------------
INSERT INTO `sitenav` VALUES ('1', '/e/index.jsp', '1', '首页');
INSERT INTO `sitenav` VALUES ('3', '/e/shopcart.jsp', '4', '购物车');
INSERT INTO `sitenav` VALUES ('58', '/e/shangpinlist.jsp?spcid=1', '1', '电脑整机');
INSERT INTO `sitenav` VALUES ('59', '/e/shangpinlist.jsp?spcid=8', '1', '平板电脑');
INSERT INTO `sitenav` VALUES ('60', '/e/shangpinlist.jsp?spcid=11', '1', '电脑配件');
INSERT INTO `sitenav` VALUES ('61', '/e/shangpinlist.jsp?spcid=18', '1', '外设产品');
INSERT INTO `sitenav` VALUES ('62', '/e/shangpinlist.jsp?spcid=25', '1', '游戏装备');

-- ----------------------------
-- Table structure for spcategory
-- ----------------------------
DROP TABLE IF EXISTS `spcategory`;
CREATE TABLE `spcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isleaf` int(11) NOT NULL,
  `jieshao` varchar(255) DEFAULT NULL,
  `mingcheng` varchar(255) DEFAULT NULL,
  `parentid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spcategory
-- ----------------------------
INSERT INTO `spcategory` VALUES ('1', '0', '', '电脑整机', '0');
INSERT INTO `spcategory` VALUES ('2', '1', '', '笔记本', '1');
INSERT INTO `spcategory` VALUES ('3', '1', '', '轻薄本', '1');
INSERT INTO `spcategory` VALUES ('4', '1', '', '游戏本', '1');
INSERT INTO `spcategory` VALUES ('5', '1', '', '台式机', '1');
INSERT INTO `spcategory` VALUES ('6', '1', '', '一体机', '1');
INSERT INTO `spcategory` VALUES ('7', '1', '', '服务器', '1');
INSERT INTO `spcategory` VALUES ('8', '0', '', '平板电脑', '0');
INSERT INTO `spcategory` VALUES ('9', '1', '', 'IPAD', '8');
INSERT INTO `spcategory` VALUES ('10', '1', '', '普通平板', '8');
INSERT INTO `spcategory` VALUES ('11', '0', '', '电脑配件', '0');
INSERT INTO `spcategory` VALUES ('12', '1', '', 'CPU', '11');
INSERT INTO `spcategory` VALUES ('13', '1', '', 'SSD硬盘', '11');
INSERT INTO `spcategory` VALUES ('14', '1', '', '显示器', '11');
INSERT INTO `spcategory` VALUES ('15', '1', '', '显卡', '11');
INSERT INTO `spcategory` VALUES ('16', '1', '', '组装电脑', '11');
INSERT INTO `spcategory` VALUES ('17', '1', '', '机箱', '11');
INSERT INTO `spcategory` VALUES ('18', '0', '', '外设产品', '0');
INSERT INTO `spcategory` VALUES ('21', '1', '', '鼠标垫', '18');
INSERT INTO `spcategory` VALUES ('22', '1', '', 'U盘', '18');
INSERT INTO `spcategory` VALUES ('23', '1', '', '移动硬盘', '18');
INSERT INTO `spcategory` VALUES ('24', '1', '', '摄像头', '18');
INSERT INTO `spcategory` VALUES ('25', '0', '', '游戏装备', '0');
INSERT INTO `spcategory` VALUES ('26', '1', '', '游戏电脑', '25');
INSERT INTO `spcategory` VALUES ('27', '1', '', '电竞显示器', '25');
INSERT INTO `spcategory` VALUES ('28', '1', '', '机械键盘', '25');
INSERT INTO `spcategory` VALUES ('29', '1', '', '游戏鼠标', '25');
INSERT INTO `spcategory` VALUES ('30', '1', '', '游戏手柄', '25');
INSERT INTO `spcategory` VALUES ('31', '1', '', 'MOD', '25');

-- ----------------------------
-- Table structure for supplyor
-- ----------------------------
DROP TABLE IF EXISTS `supplyor`;
CREATE TABLE `supplyor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplyor
-- ----------------------------
INSERT INTO `supplyor` VALUES ('1', 'S001', '深圳市罗湖区东正街XXXX', '2017-11-05 15:24:45', '1233333333333332332323', '13732921234', '服装供应商', '123456', '/computer/upload/nopic.jpg', '个人');
INSERT INTO `supplyor` VALUES ('2', 'S002', '北京市海淀区复兴路28号', '2017-11-05 21:28:38', '供应服装', '15797821233', '服装供应商二老大', '123456', '/computer/upload/temp/59fca361N1cc6ac2e.jpg', '个人');

-- ----------------------------
-- Table structure for sysconfig
-- ----------------------------
DROP TABLE IF EXISTS `sysconfig`;
CREATE TABLE `sysconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dcontent` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysconfig
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logtimes` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `xiangpian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '2018-04-16 09:15:45', null, '67@qq.com', '123', 'admin1', 'admin', 'daowen1', 'admin', '男', '1361782334', 'admin', '/computer/upload/temp/18_180122115452_1.jpg');

-- ----------------------------
-- Table structure for xinxi
-- ----------------------------
DROP TABLE IF EXISTS `xinxi`;
CREATE TABLE `xinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `againstcount` int(11) NOT NULL,
  `agreecount` int(11) NOT NULL,
  `clickcount` int(11) NOT NULL,
  `dcontent` text,
  `hot` int(11) NOT NULL,
  `laiyuan` varchar(255) DEFAULT NULL,
  `lanmuid` int(11) NOT NULL,
  `lanmuming` varchar(255) DEFAULT NULL,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tuijian` int(11) NOT NULL,
  `tupian2` varchar(255) DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `zuixin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinxi
-- ----------------------------
INSERT INTO `xinxi` VALUES ('3', '1', '1', '1', '12343434343434', '0', null, '3', '新闻资讯', 'admin', '2018-04-16 09:15:45', '测试新闻资讯', '0', '/agrisale/upload/nopic.jpg', '', '0');
INSERT INTO `xinxi` VALUES ('4', '0', '0', '0', '1234343434', '0', null, '3', '新闻资讯', 'admin', '2018-04-16 09:15:45', '发布时资讯信息', '0', '/agrisale/upload/nopic.jpg', '', '0');
INSERT INTO `xinxi` VALUES ('5', '0', '0', '3', '12344444444444444441234', '1', null, '2', '商城活动', 'admin', '2018-04-16 09:15:45', '商城活动测试', '1', '/agrisale/upload/temp/58f1cb42N60c2bd2c.jpg', '', '1');
