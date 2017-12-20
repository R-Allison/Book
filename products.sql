/*
Navicat MySQL Data Transfer

Source Server         : choose
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-12-20 22:12:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` varchar(100) NOT NULL COMMENT '商品ID',
  `name` varchar(40) DEFAULT NULL COMMENT '商品名称',
  `author` varchar(55) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL COMMENT '商品价格',
  `category` varchar(40) DEFAULT NULL COMMENT '商品分类',
  `pnum` int(11) DEFAULT NULL COMMENT '商品库存量',
  `imgurl` varchar(100) DEFAULT NULL COMMENT '商品图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('001', '个体的崛起', '[英] 罗宾·邓巴 著 / 张杰、区沛仪 译 / 译言丨现代出版社 / 272页 / 精装', '30.00', '文学', '100', 'images/s29613638.jpg', '兰花');
INSERT INTO `products` VALUES ('005', '梵高传', '[英] 罗宾·邓巴 著 / 张杰、区沛仪 译 / 译言丨现代出版社 / 272页 / 精装', '55.00', '文学', '100', 'images/17837003.jpg', '梵高');
INSERT INTO `products` VALUES ('006', '中国怪谈', '[英] 罗宾·邓巴 著 / 张杰、区沛仪 译 / 译言丨现代出版社 / 272页 / 精装', '44.00', '原版', '200', 'images/44062257.jpg', '原版');
INSERT INTO `products` VALUES ('007', 'Python源码刨析', '[英] 罗宾·邓巴 著 / 张杰、区沛仪 译 / 译言丨现代出版社 / 272页 / 精装', '39.98', '计算机', '100', 'images/1499455.jpg', '计算机');
INSERT INTO `products` VALUES ('008', '分开旅行', '[英] 罗宾·邓巴 著 / 张杰、区沛仪 译 / 译言丨现代出版社 / 272页 / 精装', '17.00', '生活', '99', 'images/43082194.jpg', '生活');
INSERT INTO `products` VALUES ('009', '上帝掷骰子吗——量子物理史话', '[英] 罗宾·邓巴 著 / 张杰、区沛仪 译 / 译言丨现代出版社 / 272页 / 精装', '6.99', '科技', '199', 'images/1096463.jpg', '科技');
INSERT INTO `products` VALUES ('010', '1368个单词就够了（实用篇）', '[英] 罗宾·邓巴 著 / 张杰、区沛仪 译 / 译言丨现代出版社 / 272页 / 精装', '19.99', '考试', '999', 'images/42741803.jpg', '考试');
INSERT INTO `products` VALUES ('011', '孩子们的诗', '[英] 罗宾·邓巴 著 / 张杰、区沛仪 译 / 译言丨现代出版社 / 272页 / 精装', '24.00', '少儿', '99', 'images/42478305.jpg', '少儿');
