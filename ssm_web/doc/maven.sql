/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : 127.0.0.1:3306
Source Database       : maven

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-10-09 09:21:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` float(10,0) DEFAULT NULL,
  `pic` varchar(40) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', '传智播客', '1000', null, '2018-03-13 09:29:30', '带我走上人生巅峰');
INSERT INTO `items` VALUES ('2', '黑马310', null, null, '2018-03-28 10:05:52', '插入测试');
INSERT INTO `items` VALUES ('3', '黑马307', '199', null, '2018-03-07 10:08:04', '插入测试');
INSERT INTO `items` VALUES ('10', '这是测试方法的名称', null, null, null, '这是一个通过测试用例添加的测试方法');
INSERT INTO `items` VALUES ('11', '这是测试方法的名称', null, null, null, '这是一个通过测试用例添加的测试方法');
INSERT INTO `items` VALUES ('12', '这是测试方法的名称', null, null, null, '这是一个通过测试用例添加的测试方法');
INSERT INTO `items` VALUES ('13', '这是测试方法的名称', null, null, null, '这是一个通过测试用例添加的测试方法');
INSERT INTO `items` VALUES ('14', '这是测试方法的名称', null, null, null, '这是一个通过测试用例添加的测试方法');
INSERT INTO `items` VALUES ('15', '这是测试方法的名称', null, null, null, '这是一个通过测试用例添加的测试方法');
INSERT INTO `items` VALUES ('16', '这是测试方法的名称', null, null, null, '这是一个通过测试用例添加的测试方法');
