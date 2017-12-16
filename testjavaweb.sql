/*
Navicat MySQL Data Transfer

Source Server         : java
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : testjavaweb

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-12-16 22:47:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'aaa', '100');
INSERT INTO `account` VALUES ('2', 'bbb', '1200');
INSERT INTO `account` VALUES ('3', 'ccc', '1000');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(25) NOT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `quanty` int(10) DEFAULT NULL,
  `goods_state` char(2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '洗衣粉', '5.00', '99', '在售');
INSERT INTO `goods` VALUES ('2', '牙膏', '8.00', '100', '在售');

-- ----------------------------
-- Table structure for stdb
-- ----------------------------
DROP TABLE IF EXISTS `stdb`;
CREATE TABLE `stdb` (
  `sno` int(3) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `chinese` int(2) NOT NULL,
  `math` int(2) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stdb
-- ----------------------------
INSERT INTO `stdb` VALUES ('101', '张三', '80', '99');
INSERT INTO `stdb` VALUES ('102', '李四', '70', '100');
INSERT INTO `stdb` VALUES ('103', '王五', '85', '45');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', '123456');
INSERT INTO `user` VALUES ('2', '李四', '123456');
INSERT INTO `user` VALUES ('3', '王五', '123456');
