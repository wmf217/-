/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : erm

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-28 10:37:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `account_currency` varchar(50) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `account_city` varchar(100) DEFAULT NULL,
  `account_branch` varchar(200) DEFAULT NULL COMMENT '支行',
  `account_name` varchar(255) NOT NULL COMMENT '开户名',
  `status` smallint(5) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `frontimg` varchar(255) DEFAULT NULL,
  `backimg` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('10', '1', '1', '', '233333333333333333', '大连', '南开支行', '王明峰', '0', '/uploads/temp/20170711/92f09fc34d0c53eda95df20ad57c0243.jpg', '/uploads/temp/20170711/6b3123c2cdecef201a7a20b2add532a0.jpg', '2017-07-11 01:40:03', '2017-07-11 09:40:40', null);
INSERT INTO `accounts` VALUES ('12', '1', '1', '', '3213', 'dddd', '22321321', '321', '0', '/uploads/temp/20170711/807b5ef3e02963998027ddfe5f9f3542.jpg', '/uploads/temp/20170711/a7af185d9dc22907c1603e5d4edf0def.jpg', '2017-07-11 06:41:47', '2017-07-11 06:41:47', null);
INSERT INTO `accounts` VALUES ('13', '31', '2', '', '2311211232132132131', '大连', '好的银行', '王明峰', '0', '/uploads/temp/20170719/e55e539531d2b7b0d06f8341e67fecdd.jpg', '/uploads/temp/20170719/71fb384b4c02e40032fc04287a340b32.jpg', '2017-07-19 22:49:39', '2017-07-19 22:49:39', null);
INSERT INTO `accounts` VALUES ('14', '32', '1', '', '13232132123', '312', '321', '321', '0', '/uploads/temp/20170719/5d7fd1044f9f78b70bdbefb8836270e2.jpg', '/uploads/temp/20170719/94ad3b50bf54ea9d33423e295820d075.jpg', '2017-07-19 23:28:32', '2017-07-19 23:28:32', null);
INSERT INTO `accounts` VALUES ('15', '33', '3', '', '13232132123', '312', '321', '321', '0', '/images/front/account/20170720/001cf81d25b12c6416370f0f2c379b93.jpg', '/images/front/account/20170720/1d8f4256c5cecee06fd56deaeade2c29.jpg', '2017-07-20 00:00:10', '2017-07-20 00:00:10', null);

-- ----------------------------
-- Table structure for `agent_applys`
-- ----------------------------
DROP TABLE IF EXISTS `agent_applys`;
CREATE TABLE `agent_applys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` smallint(5) NOT NULL DEFAULT '0' COMMENT '0,等待处理，1成功，2失败',
  `reason` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_applys
-- ----------------------------
INSERT INTO `agent_applys` VALUES ('1', '29', '0', '不好使', '不错不错', '2017-06-19 13:53:07', '2017-07-15 14:46:57');
INSERT INTO `agent_applys` VALUES ('2', '29', '2', null, null, '2017-07-15 06:56:10', '2017-07-19 23:38:52');
INSERT INTO `agent_applys` VALUES ('3', '29', '2', null, null, '2017-07-15 06:56:44', '2017-07-19 23:38:45');

-- ----------------------------
-- Table structure for `banks`
-- ----------------------------
DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankno` int(5) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cername` varchar(100) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banks
-- ----------------------------
INSERT INTO `banks` VALUES ('1', '1001', '中国工商银行', 'ICBC', '/images/front/bank/20170727/59ccf18b3e9e379e8c2a11cc289a24cb.jpg', null, '2017-07-27 13:49:49', null);
INSERT INTO `banks` VALUES ('2', '1002', '中国农业银行', 'ABC', '/images/front/bank/20170727/6629350aaa171120867190ca5594fda8.jpg', null, '2017-07-27 13:49:36', null);
INSERT INTO `banks` VALUES ('3', '1004', '中国建设银行', 'CCB', '/images/front/bank/20170727/a2511519497d99417aedd86c07eacf3a.jpg', null, '2017-07-27 13:49:12', null);
INSERT INTO `banks` VALUES ('4', '1003', '中国银行', 'BOC', '/images/front/bank/20170727/f4a0022ca5eda9413bff0673c4c83069.jpg', null, '2017-07-27 13:49:24', null);
INSERT INTO `banks` VALUES ('5', '1014', '浦发银行', 'SPDB', '/images/front/bank/20170727/f2348c1ce147f4a0eb6920596af67dc7.jpg', '2017-07-27 13:50:28', '2017-07-27 13:50:28', null);
INSERT INTO `banks` VALUES ('6', '1006', '邮政储蓄银行', 'POST', '/images/front/bank/20170727/ede31ae95059dbd36b3fd8af4dab01af.jpg', '2017-07-27 13:53:25', '2017-07-27 13:53:25', null);
INSERT INTO `banks` VALUES ('7', '1009', '华夏银行', 'HXB', '/images/front/bank/20170727/917911c40c6957cfa2e53dc9a0ff7d8e.jpg', '2017-07-27 13:54:07', '2017-07-27 13:54:07', null);
INSERT INTO `banks` VALUES ('8', '1008', '光大银行', 'CEB', '/images/front/bank/20170727/40a85597bcfced770419a8d10a6c799b.jpg', '2017-07-27 13:54:40', '2017-07-27 13:54:40', null);
INSERT INTO `banks` VALUES ('9', '1013', '兴业银行', 'CIB', '/images/front/bank/20170727/6aab90f12d7a7ea59260c4a44b088826.jpg', '2017-07-27 13:55:59', '2017-07-27 13:55:59', null);
INSERT INTO `banks` VALUES ('10', '1007', '中信银行', 'ECITIC', '/images/front/bank/20170727/974f44f2626bd17ad64a8ab26a396816.jpg', '2017-07-27 13:56:31', '2017-07-27 13:56:31', null);
INSERT INTO `banks` VALUES ('11', '1012', '招商银行', 'CMBCHINA', '/images/front/bank/20170727/cf9f7a102fdb00d4cac5bb2f43d6d80f.jpg', '2017-07-27 13:57:02', '2017-07-27 13:57:02', null);
INSERT INTO `banks` VALUES ('12', '1010', '民生银行', 'CMBC', '/images/front/bank/20170727/541f09b3121cdd80c0d3b2e435385220.jpg', '2017-07-27 13:58:58', '2017-07-27 13:58:58', null);
INSERT INTO `banks` VALUES ('13', '1103', '北京农村商业银行', 'BJRCB', '/images/front/bank/20170727/a9c9910074ef6ce4bd3df2e177d47d23.jpg', '2017-07-27 13:59:49', '2017-07-27 13:59:49', null);

-- ----------------------------
-- Table structure for `cingets`
-- ----------------------------
DROP TABLE IF EXISTS `cingets`;
CREATE TABLE `cingets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `detail` varchar(255) DEFAULT NULL COMMENT '佣金明细',
  `amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '返佣金额',
  `status` smallint(5) NOT NULL DEFAULT '0' COMMENT '0,等待处理，1 成功，2失败',
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cingets
-- ----------------------------
INSERT INTO `cingets` VALUES ('5', '1', '333', '0.00', '1', null, '2017-06-20 14:03:04', '2017-07-11 15:15:10', null);
INSERT INTO `cingets` VALUES ('6', '1', null, '0.00', '1', null, '2017-06-20 14:05:39', '2017-07-11 15:15:08', null);
INSERT INTO `cingets` VALUES ('7', '1', '233', '0.00', '2', null, '2017-06-20 14:06:32', '2017-07-11 15:15:02', null);
INSERT INTO `cingets` VALUES ('8', '1', null, '0.00', '2', '没钱', '2017-06-20 14:07:00', '2017-07-11 15:15:01', null);
INSERT INTO `cingets` VALUES ('9', '1', null, '0.00', '2', null, '2017-06-20 14:07:25', '2017-07-11 15:15:03', null);
INSERT INTO `cingets` VALUES ('10', '1', '3213', '0.00', '2', null, '2017-06-20 14:08:56', '2017-07-11 15:15:04', null);
INSERT INTO `cingets` VALUES ('11', '1', '323', '0.00', '2', null, '2017-06-20 14:09:38', '2017-07-11 15:15:05', null);
INSERT INTO `cingets` VALUES ('12', '1', '323', '0.00', '2', null, '2017-06-20 14:09:39', '2017-07-11 15:15:06', null);
INSERT INTO `cingets` VALUES ('14', '1', '33', '30.00', '2', null, '2017-06-20 14:27:09', '2017-07-11 15:15:07', null);
INSERT INTO `cingets` VALUES ('17', '1', 'dada', '10.90', '1', null, '2017-07-11 07:28:23', '2017-07-11 10:22:53', null);
INSERT INTO `cingets` VALUES ('18', '1', '这里', '30.90', '2', null, '2017-07-11 08:01:18', '2017-07-11 08:06:02', null);
INSERT INTO `cingets` VALUES ('19', '1', '2333', '30.90', '2', '没有佣金来源', '2017-07-11 10:23:16', '2017-07-14 01:40:34', null);
INSERT INTO `cingets` VALUES ('20', '1', null, '20.00', '1', null, '2017-07-18 11:21:28', '2017-07-18 11:22:54', null);
INSERT INTO `cingets` VALUES ('21', '1', '233', '2.10', '2', '不行转', '2017-07-20 02:54:54', '2017-07-20 02:57:15', null);

-- ----------------------------
-- Table structure for `commissions`
-- ----------------------------
DROP TABLE IF EXISTS `commissions`;
CREATE TABLE `commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) DEFAULT NULL,
  `trader_id` int(11) DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `status` smallint(18) NOT NULL DEFAULT '0' COMMENT '0等待，1成功，2失败',
  `cinget_id` int(11) NOT NULL DEFAULT '0' COMMENT '不是0为已发出申请，对应的申请id',
  `month` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commissions
-- ----------------------------
INSERT INTO `commissions` VALUES ('16', '33', '32', '9', '25.00', '0', '0', '0000-00-00 00:00:00', '2017-07-20 02:42:33', '2017-07-20 02:42:33', null);
INSERT INTO `commissions` VALUES ('17', '33', '31', '9', '7.50', '0', '0', '0000-00-00 00:00:00', '2017-07-20 02:42:33', '2017-07-20 02:42:33', null);
INSERT INTO `commissions` VALUES ('18', '33', '1', '9', '10.50', '0', '0', '0000-00-00 00:00:00', '2017-07-20 02:42:34', '2017-07-20 02:42:34', null);
INSERT INTO `commissions` VALUES ('19', '33', '32', '10', '5.00', '0', '0', '0000-00-00 00:00:00', '2017-07-20 02:42:34', '2017-07-20 02:42:34', null);
INSERT INTO `commissions` VALUES ('20', '33', '31', '10', '1.50', '0', '0', '0000-00-00 00:00:00', '2017-07-20 02:42:34', '2017-07-20 02:42:34', null);
INSERT INTO `commissions` VALUES ('21', '33', '1', '10', '2.10', '0', '0', '0000-00-00 00:00:00', '2017-07-20 02:42:34', '2017-07-20 02:57:15', null);

-- ----------------------------
-- Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `simulate` smallint(5) NOT NULL DEFAULT '0' COMMENT '模拟',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('2', 'AQ1', '第一个正常用户组', '0', '2017-07-27 15:03:24', '2017-07-27 15:03:24', null);
INSERT INTO `groups` VALUES ('3', 'AQ2', '模拟组', '1', '2017-07-27 15:03:44', '2017-07-27 15:09:45', null);

-- ----------------------------
-- Table structure for `honors`
-- ----------------------------
DROP TABLE IF EXISTS `honors`;
CREATE TABLE `honors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rebate` float(18,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honors
-- ----------------------------
INSERT INTO `honors` VALUES ('1', 'IB1', '0.90', '2017-07-14 03:51:22', '2017-07-14 03:51:22', null);
INSERT INTO `honors` VALUES ('2', 'IB2', '0.60', '2017-07-14 03:54:01', '2017-07-14 03:54:01', null);
INSERT INTO `honors` VALUES ('3', 'IB3', '0.50', '2017-07-14 15:39:04', '2017-07-14 15:39:04', null);
INSERT INTO `honors` VALUES ('4', 'IB4', '0.30', '2017-07-14 15:39:15', '2017-07-14 15:39:15', null);

-- ----------------------------
-- Table structure for `navs`
-- ----------------------------
DROP TABLE IF EXISTS `navs`;
CREATE TABLE `navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `index` varchar(50) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `order` int(11) DEFAULT '1',
  `show` smallint(5) DEFAULT '1' COMMENT '是否可见',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navs
-- ----------------------------
INSERT INTO `navs` VALUES ('1', '审核处理', '0', '#', 'check', 'danger', 'bell', '1', '1', null, '2017-07-13 02:20:42', null);
INSERT INTO `navs` VALUES ('2', '用户审核', '1', '/back/mix/0/ucheck', 'ucheck', null, null, '0', '1', null, null, null);
INSERT INTO `navs` VALUES ('3', '真实用户', '13', '/back/mix/0/user', 'user', null, null, '0', '1', null, '2017-07-07 09:29:11', null);
INSERT INTO `navs` VALUES ('4', '入金审核', '1', '/back/mix/0/incheck', 'incheck', null, null, '0', '1', null, '2017-07-07 03:27:37', null);
INSERT INTO `navs` VALUES ('5', '业务记录', '0', '#', 'work', 'warning', 'jpy', '2', '1', null, '2017-07-14 01:53:19', null);
INSERT INTO `navs` VALUES ('6', '代理账户', '13', '/back/mix/0/agent', 'agent', null, null, '0', '0', '2017-07-07 08:47:06', '2017-07-21 23:50:57', null);
INSERT INTO `navs` VALUES ('7', '入金记录', '5', '/back/mix/0/in', 'in', null, null, '0', '1', null, '2017-07-10 01:35:20', null);
INSERT INTO `navs` VALUES ('8', '出金记录', '5', '/back/mix/0/out', 'out', null, null, '0', '1', null, '2017-07-10 01:35:55', null);
INSERT INTO `navs` VALUES ('9', '系统管理', '0', null, 'system', 'info dker', 'flag', '10', '1', '2017-07-07 05:50:08', '2017-07-13 02:14:52', null);
INSERT INTO `navs` VALUES ('10', '导航管理', '9', '/back/mix/0/nav', 'nav', null, null, '0', '0', '2017-07-07 05:55:31', '2017-07-21 23:51:32', null);
INSERT INTO `navs` VALUES ('11', '出金审核', '1', '/back/mix/0/outcheck', 'outcheck', null, null, '0', '1', null, '2017-07-07 03:30:05', null);
INSERT INTO `navs` VALUES ('13', '用户管理', '0', null, 'user', 'primary', 'users', '1', '1', '2017-07-07 09:28:39', '2017-07-14 07:06:41', null);
INSERT INTO `navs` VALUES ('14', '银行设置', '9', 'http://localhost:8000/back/mix/0/bank', 'bank', null, null, null, '1', '2017-07-07 09:54:50', '2017-07-07 13:02:50', null);
INSERT INTO `navs` VALUES ('15', '转户审批', '1', '/back/mix/0/tcheck', 'tcheck', null, null, null, '1', '2017-07-07 11:06:16', '2017-07-07 11:06:16', null);
INSERT INTO `navs` VALUES ('16', '转户记录', '5', '/back/mix/0/tist', 'tist', null, null, null, '1', '2017-07-07 11:59:29', '2017-07-07 13:01:51', null);
INSERT INTO `navs` VALUES ('17', '佣金审批', '1', '/back/mix/0/ccheck', 'ccheck', null, null, null, '0', '2017-07-10 05:51:33', '2017-07-21 23:49:28', null);
INSERT INTO `navs` VALUES ('18', '代理业务', '0', null, 'agent', 'success', 'sitemap', '8', '0', '2017-07-10 07:45:34', '2017-07-21 23:48:44', null);
INSERT INTO `navs` VALUES ('19', '佣金查询', '18', '/back/mix/0/cinget', 'cinget', null, null, null, '1', '2017-07-10 07:57:09', '2017-07-10 07:57:09', null);
INSERT INTO `navs` VALUES ('22', '代理设置', '18', '/back/mix/0/honor', 'honor', null, null, null, '1', '2017-07-13 11:02:36', '2017-07-14 03:55:44', null);
INSERT INTO `navs` VALUES ('23', '统计报表', '0', null, 'report', 'waring dker', 'bar-chart-o', '7', '1', '2017-07-14 15:45:18', '2017-07-14 15:45:18', null);
INSERT INTO `navs` VALUES ('24', '报表查询', '23', '/back/reportc/index', 'report_all', null, null, null, '1', '2017-07-14 15:46:25', '2017-07-14 16:21:32', null);
INSERT INTO `navs` VALUES ('25', '全局设置', '9', '/back/mix/0/setting/1/edit', 'setting', null, null, null, '1', '2017-07-15 05:18:43', '2017-07-15 05:18:43', null);
INSERT INTO `navs` VALUES ('26', '代理审核', '1', '/back/mix/0/acheck', 'acheck', null, null, null, '0', '2017-07-15 06:01:32', '2017-07-21 23:50:03', null);
INSERT INTO `navs` VALUES ('27', '模拟用户', '13', '/back/mix/0/simulate', 'simulate', null, null, null, '1', '2017-07-24 09:54:06', '2017-07-24 09:54:06', null);
INSERT INTO `navs` VALUES ('28', '分组管理', '9', '/back/mix/0/group', 'group', null, null, null, '1', '2017-07-27 14:58:48', '2017-07-27 14:58:48', null);

-- ----------------------------
-- Table structure for `objects`
-- ----------------------------
DROP TABLE IF EXISTS `objects`;
CREATE TABLE `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_profit` decimal(8,2) NOT NULL DEFAULT '0.80',
  `body_rank` int(11) NOT NULL DEFAULT '0',
  `body_name` varchar(255) NOT NULL,
  `body_status` int(1) NOT NULL DEFAULT '1',
  `body_name_english` varchar(50) NOT NULL,
  `body_tag` varchar(255) NOT NULL,
  `body_tag_forex` varchar(20) NOT NULL,
  `body_price` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `body_price_previous` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `body_price_min` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `body_price_max` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `body_price_interval` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `body_price_decimal` int(1) NOT NULL DEFAULT '5',
  `body_price_repeat` int(11) NOT NULL DEFAULT '0',
  `is_disabled` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of objects
-- ----------------------------
INSERT INTO `objects` VALUES ('1', '0.80', '3', '澳元兑美元', '1', 'AUDUSD', 'fx_saudusd', 'AUDUSD', '0.73874', '0.73869', '0.73874', '0.73874', '0.00000', '5', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:48');
INSERT INTO `objects` VALUES ('2', '0.80', '1', '欧元兑美元', '1', 'EURUSD', 'fx_seurusd', 'EURUSD', '1.09262', '1.09279', '1.09262', '1.09262', '0.00000', '5', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:49');
INSERT INTO `objects` VALUES ('3', '0.80', '0', '英镑兑美元', '1', 'GBPUSD', 'fx_sgbpusd', 'GBPUSD', '1.28932', '1.28973', '1.28932', '1.28932', '0.00000', '5', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:50');
INSERT INTO `objects` VALUES ('4', '0.80', '5', '英镑兑日元', '1', 'GBPJPY', 'fx_sgbpjpy', 'GBPJPY', '145.61000', '145.65400', '145.61000', '145.61000', '0.00000', '3', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:52');
INSERT INTO `objects` VALUES ('5', '0.80', '5', '美元兑日元', '1', 'USDJPY', 'fx_susdjpy', 'USDJPY', '112.92400', '112.92200', '112.92400', '112.92400', '0.00000', '3', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:53');
INSERT INTO `objects` VALUES ('6', '0.80', '5', '欧元兑日元', '1', 'EURJPY', 'fx_seurjpy', 'EURJPY', '123.39800', '123.41700', '123.39800', '123.39800', '0.00000', '3', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:54');
INSERT INTO `objects` VALUES ('7', '0.80', '4', '欧元兑澳元', '1', 'EURAUD', 'fx_seuraud', 'EURAUD', '1.47876', '1.47907', '1.47876', '1.47876', '0.00000', '5', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:55');
INSERT INTO `objects` VALUES ('8', '0.80', '0', '美元兑加元', '1', 'USDCAD', 'fx_susdcad', 'USDCAD', '1.37233', '1.37220', '1.37233', '1.37233', '0.00000', '5', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:56');
INSERT INTO `objects` VALUES ('9', '0.80', '0', '美元兑法郎', '1', 'USDCHF', 'fx_susdchf', 'USDCHF', '0.99255', '0.99239', '0.99255', '0.99255', '0.00000', '5', '0', '0', '2016-04-18 00:00:00', '2017-05-04 21:24:58');
INSERT INTO `objects` VALUES ('11', '0.80', '0', '纽交所黄金', '1', 'XAUUSD', 'hf_GC', 'XAUUSD', '1227.65000', '1227.08000', '1227.65000', '1227.65000', '0.00000', '2', '0', '0', '2016-05-17 00:00:00', '2017-05-04 21:24:59');
INSERT INTO `objects` VALUES ('12', '0.80', '0', '纽交所白银', '1', 'XAGUSD', 'hf_SI', 'XAGUSD', '16.33800', '16.33200', '16.33800', '16.33800', '0.00000', '3', '0', '0', '2016-05-17 00:00:00', '2017-05-04 21:25:00');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` int(11) NOT NULL DEFAULT '0',
  `user_id` varchar(15) NOT NULL,
  `object_id` int(11) NOT NULL,
  `num` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '投入资金',
  `openprice` decimal(18,2) DEFAULT NULL,
  `closeprice` decimal(18,2) DEFAULT NULL,
  `nowprice` decimal(18,2) DEFAULT NULL,
  `storage` decimal(18,2) DEFAULT NULL,
  `profit` decimal(18,2) NOT NULL DEFAULT '0.00',
  `opentime` int(11) DEFAULT NULL,
  `closetime` int(11) DEFAULT NULL,
  `flag` smallint(5) NOT NULL DEFAULT '0' COMMENT '0买入，1卖出',
  `restflag` smallint(5) NOT NULL DEFAULT '0' COMMENT '挂单才有，标注挂单类型',
  `hand` decimal(5,2) NOT NULL DEFAULT '0.01',
  `loseprice` decimal(18,2) DEFAULT NULL COMMENT '止损',
  `winprice` decimal(18,2) DEFAULT NULL COMMENT '止盈',
  `day` varchar(100) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('2', '0', '18705397012', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-14', '2017-06', '2017-07-13 00:00:00', '2017-07-14 13:55:45');
INSERT INTO `orders` VALUES ('3', '122', '1', '1', '0.00', '321321.00', '321321.00', '32121.00', null, '33.50', '0', '0', '1', '0', '0.11', null, null, '2017-07-13', '2017-05', '2017-07-13 00:00:00', '2017-07-14 13:55:45');
INSERT INTO `orders` VALUES ('4', '321321', '1', '5', '0.00', '231.00', '321.00', '22.00', null, '-31.09', '0', '0', '1', '0', '0.01', null, null, '2017-07-13', '2017-06', '2017-07-13 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('5', '321321', '1', '5', '0.00', '321.00', '321.00', '33.00', null, '10.03', '0', '0', '0', '0', '0.02', null, null, '2017-07-13', '2017-06', '2017-07-13 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('6', '321', '1', '1', '0.00', '321.00', '321.00', '55.00', null, '8.04', '0', '0', '1', '1', '0.01', '0.01', '0.02', '2017-07-12', '2017-06', '2017-07-12 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('7', '121', '1', '1', '0.00', '3213.00', '31231.00', '666.00', null, '15.04', '0', '0', '1', '2', '0.01', null, '0.09', '2017-07-12', '2017-06', '2017-07-12 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('8', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-12', '2017-06', '2017-07-12 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('9', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-12', '2017-06', '2017-07-12 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('10', '3221', '1', '1', '0.00', '123.00', '232.00', '666.00', null, '-23.09', null, '0', '0', '0', '0.01', null, null, '2017-07-11', '2017-06', '2017-07-11 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('11', '0', '18705397012', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-11', '2017-06', '2017-07-11 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('12', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-11', '2017-06', '2017-07-11 00:00:00', '2017-07-14 13:55:46');
INSERT INTO `orders` VALUES ('13', '0', '18781987163', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-11', '2017-06', '2017-07-11 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('14', '1221', '1', '1', '0.00', '323.00', '322.00', '666.00', null, '5.03', null, '0', '1', '0', '0.01', null, null, '2017-07-10', '2017-06', '2017-07-10 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('15', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '3', '0.01', '0.02', null, '2017-07-10', '2017-06', '2017-07-10 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('16', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-10', '2017-06', '2017-07-10 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('17', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-10', '2017-06', '2017-07-10 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('18', '122', '1', '7', '0.00', '23.00', '3.00', '888.00', null, '50.09', null, null, '0', '0', '0.01', null, null, '2017-07-09', '2017-06', '2017-07-09 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('19', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-09', '2017-06', '2017-07-09 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('20', '0', '18781987163', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-09', '2017-06', '2017-07-09 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('21', '0', '18705397012', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-09', '2017-06', '2017-07-09 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('22', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-14', '1970-01', '2017-07-08 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('23', '321', '1', '1', '0.00', '2.00', '3213.00', '999.00', null, '39.08', null, null, '0', '0', '0.01', null, null, '2017-07-08', '2017-06', '2017-07-08 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('24', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-08', '1970-01', '2017-07-08 00:00:00', '2017-07-14 13:55:47');
INSERT INTO `orders` VALUES ('25', '321', '1', '6', '0.00', '23.00', '232.00', '878.00', null, '12.06', null, null, '0', '0', '0.01', null, null, '2017-07-14', '2017-06', '2017-07-08 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('26', '0', '18705397012', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-07', '1970-01', '2017-07-07 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('27', '0', '18705397012', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-07', '1970-01', '2017-07-07 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('28', '321', '1', '6', '0.00', '32.00', '23.00', '678.00', null, '80.09', null, null, '0', '0', '0.01', null, null, '2017-07-07', '2017-06', '2017-07-07 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('29', '0', '18705397012', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-07', '1970-01', '2017-07-07 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('30', '0', '18705397012', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-06', '1970-01', '2017-07-06 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('31', '321', '1', '1', '0.00', '232.00', '23.00', '876.00', null, '-99.10', null, null, '0', '0', '0.01', null, null, '2017-07-06', '2017-06', '2017-07-06 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('33', '0', '18781987163', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-06', '1970-01', '2017-07-06 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('35', '0', '18781987163', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-06', '1970-01', '2017-07-06 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('36', '0', '18781987163', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-05', '1970-01', '2017-07-05 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('38', '0', '18705397012', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-05', '1970-01', '2017-07-05 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('40', '0', '18705397012', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-05', '1970-01', '2017-07-05 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('49', '0', '15265496067', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-05', '1970-01', '2017-07-05 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('50', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-04', '1970-01', '2017-07-04 00:00:00', '2017-07-14 13:55:48');
INSERT INTO `orders` VALUES ('51', '0', '15563235235', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-04', '1970-01', '2017-07-04 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('52', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-04', '1970-01', '2017-07-04 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('53', '0', '15265496067', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-04', '1970-01', '2017-07-04 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('54', '0', '15563235235', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-03', '1970-01', '2017-07-03 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('55', '0', '15265496067', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-03', '1970-01', '2017-07-03 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('56', '0', '15265496067', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-03', '1970-01', '2017-07-03 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('57', '0', '15563235235', '9', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-03', '1970-01', '2017-07-03 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('58', '0', '15265496067', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-02', '1970-01', '2017-07-02 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('59', '0', '15563235235', '9', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-02', '1970-01', '2017-07-02 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('60', '0', '15265496067', '9', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-02', '1970-01', '2017-07-02 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('61', '0', '15563235235', '9', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-02', '1970-01', '2017-07-02 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('62', '0', '15265496067', '9', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-01', '1970-01', '2017-07-01 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('63', '0', '15265496067', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-01', '1970-01', '2017-07-01 00:00:00', '2017-07-14 13:55:49');
INSERT INTO `orders` VALUES ('64', '0', '15563235235', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-01', '1970-01', '2017-07-01 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('65', '0', '15265496067', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-07-01', '1970-01', '2017-07-01 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('66', '0', '15563235235', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-30', '1970-01', '2017-06-30 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('67', '0', '15265496067', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-30', '1970-01', '2017-06-30 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('68', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-30', '1970-01', '2017-06-30 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('69', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-30', '1970-01', '2017-06-30 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('70', '0', '18705397012', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-29', '1970-01', '2017-06-29 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('71', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-29', '1970-01', '2017-06-29 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('72', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-29', '1970-01', '2017-06-29 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('73', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-29', '1970-01', '2017-06-29 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('74', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-28', '1970-01', '2017-06-28 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('75', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-28', '1970-01', '2017-06-28 00:00:00', '2017-07-14 13:55:50');
INSERT INTO `orders` VALUES ('76', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-28', '1970-01', '2017-06-28 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('77', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-28', '1970-01', '2017-06-28 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('78', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-27', '1970-01', '2017-06-27 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('79', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-27', '1970-01', '2017-06-27 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('80', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-27', '1970-01', '2017-06-27 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('81', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-27', '1970-01', '2017-06-27 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('82', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-26', '1970-01', '2017-06-26 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('83', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-26', '1970-01', '2017-06-26 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('84', '0', '15563235235', '9', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-26', '1970-01', '2017-06-26 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('85', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-26', '1970-01', '2017-06-26 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('86', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-25', '1970-01', '2017-06-25 00:00:00', '2017-07-14 13:55:51');
INSERT INTO `orders` VALUES ('87', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-25', '1970-01', '2017-06-25 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('88', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-25', '1970-01', '2017-06-25 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('89', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-25', '1970-01', '2017-06-25 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('90', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-24', '1970-01', '2017-06-24 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('91', '0', '18705397012', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-24', '1970-01', '2017-06-24 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('92', '0', '18705397012', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-24', '1970-01', '2017-06-24 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('93', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-24', '1970-01', '2017-06-24 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('94', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-23', '1970-01', '2017-06-23 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('95', '0', '18781987163', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-23', '1970-01', '2017-06-23 00:00:00', '2017-07-14 13:55:52');
INSERT INTO `orders` VALUES ('96', '0', '18781987163', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-23', '1970-01', '2017-06-23 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('97', '0', '18781987163', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-23', '1970-01', '2017-06-23 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('98', '0', '18781987163', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-22', '1970-01', '2017-06-22 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('99', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-22', '1970-01', '2017-06-22 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('100', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-22', '1970-01', '2017-06-22 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('101', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-22', '1970-01', '2017-06-22 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('102', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-21', '1970-01', '2017-06-21 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('103', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-21', '1970-01', '2017-06-21 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('104', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-21', '1970-01', '2017-06-21 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('105', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-21', '1970-01', '2017-06-21 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('106', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-20', '1970-01', '2017-06-20 00:00:00', '2017-07-14 13:55:53');
INSERT INTO `orders` VALUES ('107', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-20', '1970-01', '2017-06-20 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('108', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-20', '1970-01', '2017-06-20 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('109', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-20', '1970-01', '2017-06-20 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('110', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-19', '1970-01', '2017-06-19 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('111', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-19', '1970-01', '2017-06-19 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('112', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-19', '1970-01', '2017-06-19 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('113', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-19', '1970-01', '2017-06-19 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('114', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-18', '1970-01', '2017-06-18 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('115', '0', '15265496067', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-18', '1970-01', '2017-06-18 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('116', '0', '15265496067', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-18', '1970-01', '2017-06-18 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('117', '0', '15265496067', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-18', '1970-01', '2017-06-18 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('118', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-17', '1970-01', '2017-06-17 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('119', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-17', '1970-01', '2017-06-17 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('120', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-17', '1970-01', '2017-06-17 00:00:00', '2017-07-14 13:55:54');
INSERT INTO `orders` VALUES ('121', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-17', '1970-01', '2017-06-17 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('122', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-16', '1970-01', '2017-06-16 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('123', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-16', '1970-01', '2017-06-16 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('124', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-16', '1970-01', '2017-06-16 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('125', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-16', '1970-01', '2017-06-16 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('126', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-15', '1970-01', '2017-06-15 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('127', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-15', '1970-01', '2017-06-15 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('128', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-15', '1970-01', '2017-06-15 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('129', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-15', '1970-01', '2017-06-15 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('130', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-14', '1970-01', '2017-06-14 00:00:00', '2017-07-14 13:55:55');
INSERT INTO `orders` VALUES ('131', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-14', '1970-01', '2017-06-14 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('132', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-14', '1970-01', '2017-06-14 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('133', '0', '15265496067', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-14', '1970-01', '2017-06-14 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('134', '0', '15563235235', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-13', '1970-01', '2017-06-13 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('135', '0', '15563235235', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-13', '1970-01', '2017-06-13 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('136', '0', '15563235235', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-13', '1970-01', '2017-06-13 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('137', '0', '15563235235', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-13', '1970-01', '2017-06-13 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('138', '0', '18781987163', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-12', '1970-01', '2017-06-12 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('139', '0', '18781987163', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-12', '1970-01', '2017-06-12 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('140', '0', '15563235235', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-12', '1970-01', '2017-06-12 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('141', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-12', '1970-01', '2017-06-12 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('142', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-11', '1970-01', '2017-06-11 00:00:00', '2017-07-14 13:55:56');
INSERT INTO `orders` VALUES ('143', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-11', '1970-01', '2017-06-11 00:00:00', '2017-07-14 13:55:57');
INSERT INTO `orders` VALUES ('144', '0', '15265496067', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-11', '1970-01', '2017-06-11 00:00:00', '2017-07-14 13:55:57');
INSERT INTO `orders` VALUES ('145', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-11', '1970-01', '2017-06-11 00:00:00', '2017-07-14 13:55:57');
INSERT INTO `orders` VALUES ('146', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-10', '1970-01', '2017-06-10 00:00:00', '2017-07-14 13:55:57');
INSERT INTO `orders` VALUES ('147', '0', '15265496067', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-10', '1970-01', '2017-06-10 00:00:00', '2017-07-14 13:55:57');
INSERT INTO `orders` VALUES ('148', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-10', '1970-01', '2017-06-10 00:00:00', '2017-07-14 13:55:57');
INSERT INTO `orders` VALUES ('149', '0', '15265496067', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-10', '1970-01', '2017-06-10 00:00:00', '2017-07-14 13:55:57');
INSERT INTO `orders` VALUES ('150', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-09', '1970-01', '2017-06-09 00:00:00', '2017-07-14 13:55:57');
INSERT INTO `orders` VALUES ('151', '0', '15265496067', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-09', '1970-01', '2017-06-09 00:00:00', '2017-07-14 13:55:58');
INSERT INTO `orders` VALUES ('152', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-09', '1970-01', '2017-06-09 00:00:00', '2017-07-14 13:55:58');
INSERT INTO `orders` VALUES ('153', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-09', '1970-01', '2017-06-09 00:00:00', '2017-07-14 13:55:58');
INSERT INTO `orders` VALUES ('154', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-08', '1970-01', '2017-06-08 00:00:00', '2017-07-14 13:55:58');
INSERT INTO `orders` VALUES ('155', '0', '15265496067', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-08', '1970-01', '2017-06-08 00:00:00', '2017-07-14 13:55:58');
INSERT INTO `orders` VALUES ('156', '0', '15265496067', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-08', '1970-01', '2017-06-08 00:00:00', '2017-07-14 13:55:58');
INSERT INTO `orders` VALUES ('157', '0', '15265496067', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-08', '1970-01', '2017-06-08 00:00:00', '2017-07-14 13:55:58');
INSERT INTO `orders` VALUES ('158', '0', '15265496067', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-07', '1970-01', '2017-06-07 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('159', '0', '15265496067', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-07', '1970-01', '2017-06-07 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('160', '0', '15265496067', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-07', '1970-01', '2017-06-07 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('161', '0', '15265496067', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-07', '1970-01', '2017-06-07 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('162', '0', '15265496067', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-06', '1970-01', '2017-06-06 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('163', '0', '15265496067', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-06', '1970-01', '2017-06-06 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('164', '0', '18781987163', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-06', '1970-01', '2017-06-06 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('165', '0', '18781987163', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-06', '1970-01', '2017-06-06 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('166', '0', '18705397012', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-05', '1970-01', '2017-06-05 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('167', '0', '18705397012', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-05', '1970-01', '2017-06-05 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('168', '0', '18705397012', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-05', '1970-01', '2017-06-05 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('169', '0', '18705397012', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-05', '1970-01', '2017-06-05 00:00:00', '2017-07-14 13:55:59');
INSERT INTO `orders` VALUES ('170', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-04', '1970-01', '2017-06-04 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('171', '0', '18705397012', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-04', '1970-01', '2017-06-04 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('172', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-04', '1970-01', '2017-06-04 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('173', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-04', '1970-01', '2017-06-04 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('174', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-03', '1970-01', '2017-06-03 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('175', '0', '15265496067', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-03', '1970-01', '2017-06-03 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('176', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-03', '1970-01', '2017-06-03 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('177', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-03', '1970-01', '2017-06-03 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('178', '0', '8', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-02', '1970-01', '2017-06-02 00:00:00', '2017-07-14 13:56:00');
INSERT INTO `orders` VALUES ('179', '0', '8', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-02', '1970-01', '2017-06-02 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('180', '0', '6', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-02', '1970-01', '2017-06-02 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('181', '0', '6', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-02', '1970-01', '2017-06-02 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('182', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-01', '1970-01', '2017-06-01 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('183', '0', '6', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-01', '1970-01', '2017-06-01 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('184', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-01', '1970-01', '2017-06-01 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('185', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-06-01', '1970-01', '2017-06-01 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('186', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-31', '1970-01', '2017-05-31 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('187', '0', '18781987163', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-31', '1970-01', '2017-05-31 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('188', '0', '18781987163', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-31', '1970-01', '2017-05-31 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('189', '0', '18781987163', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-31', '1970-01', '2017-05-31 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('190', '0', '18781987163', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-30', '1970-01', '2017-05-30 00:00:00', '2017-07-14 13:56:01');
INSERT INTO `orders` VALUES ('191', '0', '18781987163', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-30', '1970-01', '2017-05-30 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('192', '0', '18781987163', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-30', '1970-01', '2017-05-30 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('193', '0', '18781987163', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-30', '1970-01', '2017-05-30 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('197', '0', '18781987163', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-29', '1970-01', '2017-05-29 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('198', '0', '18781987163', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-29', '1970-01', '2017-05-29 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('199', '0', '18781987163', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-29', '1970-01', '2017-05-29 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('200', '0', '18781987163', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-29', '1970-01', '2017-05-29 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('201', '0', '18781987163', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-28', '1970-01', '2017-05-28 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('202', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-28', '1970-01', '2017-05-28 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('203', '0', '18781987163', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-28', '1970-01', '2017-05-28 00:00:00', '2017-07-14 13:56:02');
INSERT INTO `orders` VALUES ('204', '0', '18781987163', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-28', '1970-01', '2017-05-28 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('205', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-27', '1970-01', '2017-05-27 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('206', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-27', '1970-01', '2017-05-27 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('207', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-27', '1970-01', '2017-05-27 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('208', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-27', '1970-01', '2017-05-27 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('209', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-26', '1970-01', '2017-05-26 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('210', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-26', '1970-01', '2017-05-26 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('211', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-26', '1970-01', '2017-05-26 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('212', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-26', '1970-01', '2017-05-26 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('213', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-25', '1970-01', '2017-05-25 00:00:00', '2017-07-14 13:56:03');
INSERT INTO `orders` VALUES ('214', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-25', '1970-01', '2017-05-25 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('215', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-25', '1970-01', '2017-05-25 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('216', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-25', '1970-01', '2017-05-25 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('217', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-24', '1970-01', '2017-05-24 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('218', '0', '18781987163', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-24', '1970-01', '2017-05-24 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('219', '0', '18781987163', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-24', '1970-01', '2017-05-24 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('220', '0', '18781987163', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-24', '1970-01', '2017-05-24 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('221', '0', '18781987163', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-23', '1970-01', '2017-05-23 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('222', '0', '18781987163', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-23', '1970-01', '2017-05-23 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('223', '0', '15563235235', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-23', '1970-01', '2017-05-23 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('224', '0', '15563235235', '8', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-23', '1970-01', '2017-05-23 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('225', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-22', '1970-01', '2017-05-22 00:00:00', '2017-07-14 13:56:04');
INSERT INTO `orders` VALUES ('226', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-22', '1970-01', '2017-05-22 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('227', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-22', '1970-01', '2017-05-22 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('228', '0', '13013554431', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-22', '1970-01', '2017-05-22 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('229', '0', '13013554431', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-21', '1970-01', '2017-05-21 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('230', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-21', '1970-01', '2017-05-21 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('231', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-21', '1970-01', '2017-05-21 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('232', '0', '13013554431', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-21', '1970-01', '2017-05-21 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('233', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-20', '1970-01', '2017-05-20 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('234', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-20', '1970-01', '2017-05-20 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('235', '0', '13013554431', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-20', '1970-01', '2017-05-20 00:00:00', '2017-07-14 13:56:05');
INSERT INTO `orders` VALUES ('236', '0', '15563235235', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-20', '1970-01', '2017-05-20 00:00:00', '2017-07-14 13:56:06');
INSERT INTO `orders` VALUES ('237', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-19', '1970-01', '2017-05-19 00:00:00', '2017-07-14 13:56:06');
INSERT INTO `orders` VALUES ('238', '0', '15563235235', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-19', '1970-01', '2017-05-19 00:00:00', '2017-07-14 13:56:06');
INSERT INTO `orders` VALUES ('239', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-19', '1970-01', '2017-05-19 00:00:00', '2017-07-14 13:56:06');
INSERT INTO `orders` VALUES ('240', '0', '15563235235', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-19', '1970-01', '2017-05-19 00:00:00', '2017-07-14 13:56:06');
INSERT INTO `orders` VALUES ('241', '0', '15563235235', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-18', '1970-01', '2017-05-18 00:00:00', '2017-07-14 13:56:06');
INSERT INTO `orders` VALUES ('242', '0', '15563235235', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-18', '1970-01', '2017-05-18 00:00:00', '2017-07-14 13:56:07');
INSERT INTO `orders` VALUES ('243', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-18', '1970-01', '2017-05-18 00:00:00', '2017-07-14 13:56:07');
INSERT INTO `orders` VALUES ('244', '0', '13013554431', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-18', '1970-01', '2017-05-18 00:00:00', '2017-07-14 13:56:07');
INSERT INTO `orders` VALUES ('245', '0', '15550792990', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-17', '1970-01', '2017-05-17 00:00:00', '2017-07-14 13:56:07');
INSERT INTO `orders` VALUES ('246', '0', '15550792990', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-17', '1970-01', '2017-05-17 00:00:00', '2017-07-14 13:56:07');
INSERT INTO `orders` VALUES ('247', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-17', '1970-01', '2017-05-17 00:00:00', '2017-07-14 13:56:07');
INSERT INTO `orders` VALUES ('248', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-17', '1970-01', '2017-05-17 00:00:00', '2017-07-14 13:56:07');
INSERT INTO `orders` VALUES ('249', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-16', '1970-01', '2017-05-16 00:00:00', '2017-07-14 13:56:07');
INSERT INTO `orders` VALUES ('250', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-16', '1970-01', '2017-05-16 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('251', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-16', '1970-01', '2017-05-16 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('252', '0', '15563235235', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-16', '1970-01', '2017-05-16 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('253', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-15', '1970-01', '2017-05-15 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('254', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-15', '1970-01', '2017-05-15 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('255', '0', '15550792990', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-15', '1970-01', '2017-05-15 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('256', '0', '15550792990', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-15', '1970-01', '2017-05-15 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('257', '0', '15550792990', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-14', '1970-01', '2017-05-14 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('258', '0', '15550792990', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-14', '1970-01', '2017-05-14 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('259', '0', '15550792990', '9', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-14', '1970-01', '2017-05-14 00:00:00', '2017-07-14 13:56:08');
INSERT INTO `orders` VALUES ('260', '0', '15563235235', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-14', '1970-01', '2017-05-14 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('261', '0', '15550792990', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-13', '1970-01', '2017-05-13 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('262', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-13', '1970-01', '2017-05-13 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('263', '0', '13013554431', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-13', '1970-01', '2017-05-13 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('264', '0', '13013554431', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-13', '1970-01', '2017-05-13 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('265', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-12', '1970-01', '2017-05-12 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('266', '0', '15550792990', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-12', '1970-01', '2017-05-12 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('267', '0', '13013554431', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-12', '1970-01', '2017-05-12 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('268', '0', '15563235235', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-12', '1970-01', '2017-05-12 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('269', '0', '15550792990', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-11', '1970-01', '2017-05-11 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('270', '0', '15550792990', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-11', '1970-01', '2017-05-11 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('271', '0', '13013554431', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-11', '1970-01', '2017-05-11 00:00:00', '2017-07-14 13:56:09');
INSERT INTO `orders` VALUES ('272', '0', '15550792990', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-11', '1970-01', '2017-05-11 00:00:00', '2017-07-14 13:56:10');
INSERT INTO `orders` VALUES ('273', '0', '15563235235', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-10', '1970-01', '2017-05-10 00:00:00', '2017-07-14 13:56:10');
INSERT INTO `orders` VALUES ('274', '0', '13013554431', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-10', '1970-01', '2017-05-10 00:00:00', '2017-07-14 13:56:10');
INSERT INTO `orders` VALUES ('275', '0', '15563235235', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-10', '1970-01', '2017-05-10 00:00:00', '2017-07-14 13:56:10');
INSERT INTO `orders` VALUES ('276', '0', '15550792990', '3', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-10', '1970-01', '2017-05-10 00:00:00', '2017-07-14 13:56:10');
INSERT INTO `orders` VALUES ('277', '0', '13013554431', '5', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-09', '1970-01', '2017-05-09 00:00:00', '2017-07-14 13:56:10');
INSERT INTO `orders` VALUES ('278', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-09', '1970-01', '2017-05-09 00:00:00', '2017-07-14 13:56:10');
INSERT INTO `orders` VALUES ('279', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-09', '1970-01', '2017-05-09 00:00:00', '2017-07-14 13:56:10');
INSERT INTO `orders` VALUES ('280', '0', '15265496067', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-09', '1970-01', '2017-05-09 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('281', '0', '15265496067', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-08', '1970-01', '2017-05-08 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('282', '0', '15265496067', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-08', '1970-01', '2017-05-08 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('283', '0', '15265496067', '6', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-08', '1970-01', '2017-05-08 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('284', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-08', '1970-01', '2017-05-08 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('285', '0', '15265496067', '4', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-07', '1970-01', '2017-05-07 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('286', '0', '15265496067', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-07', '1970-01', '2017-05-07 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('287', '0', '15265496067', '2', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-07', '1970-01', '2017-05-07 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('288', '0', '15265496067', '7', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-07', '1970-01', '2017-05-07 00:00:00', '2017-07-14 13:56:11');
INSERT INTO `orders` VALUES ('289', '0', '15265496067', '1', '0.00', null, null, null, null, '0.00', null, null, '0', '0', '0.01', null, null, '2017-05-06', '1970-01', '2017-05-06 00:00:00', '2017-07-14 13:56:12');

-- ----------------------------
-- Table structure for `records`
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `payno` varchar(50) DEFAULT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `bebalance` decimal(18,2) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT '0.00',
  `gobalance` decimal(18,2) DEFAULT NULL,
  `mtflag` smallint(6) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `type` smallint(5) NOT NULL DEFAULT '0' COMMENT '0,入金 1，出金',
  `way` smallint(5) NOT NULL DEFAULT '0' COMMENT '0,充值提款；1,佣金转户;2,账户转账',
  `status` smallint(5) NOT NULL DEFAULT '0',
  `month` varchar(100) NOT NULL DEFAULT '未知',
  `day` varchar(100) DEFAULT NULL,
  `note` text COMMENT '说明',
  `reason` text COMMENT '驳回原因',
  `is_print` smallint(5) NOT NULL DEFAULT '0' COMMENT '0未打印，1已打印',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES ('1', '1', '10', '312312321', '0', '39.00', '40.00', '79.00', null, '233.2.2.1', '0', '0', '1', '2017-05', '2017-06-15', '这是我的充值', null, '0', '2017-06-15 13:57:35', '2017-07-27 05:04:21', null);
INSERT INTO `records` VALUES ('2', '1', '10', '544366655', null, '750.00', '50.00', '800.00', null, '127.0.30.1', '0', '0', '1', '2017-06', '2017-06-15', null, null, '0', '2017-06-15 13:57:42', '2017-07-11 11:41:06', null);
INSERT INTO `records` VALUES ('3', '1', '10', '354353454', null, '960.00', '60.00', '900.00', null, '189.0.2.1', '1', '0', '2', '2017-04', '2017-06-14', null, null, '0', '2017-06-15 13:57:49', '2017-07-19 21:52:57', null);
INSERT INTO `records` VALUES ('4', '1', '10', '354353454', null, '840.00', '60.00', '900.00', null, '189.0.2.1', '0', '0', '1', '2017-03', '2017-06-13', null, null, '0', '2017-06-15 13:57:49', '2017-07-27 05:30:00', null);
INSERT INTO `records` VALUES ('6', '1', '10', '2323', null, null, '31.00', null, null, '127.0.0.1', '1', '0', '2', '2017-06', '2017-06-15', null, null, '0', '2017-06-15 13:17:06', '2017-07-24 09:39:30', null);
INSERT INTO `records` VALUES ('7', '1', '10', '2323', null, null, '100.00', null, null, '127.0.0.1', '1', '0', '1', '2017-02', '2017-06-23', null, null, '0', '2017-06-15 13:17:32', '2017-07-27 13:54:03', null);
INSERT INTO `records` VALUES ('8', '1', '10', '3223', null, null, '100.00', null, null, '127.0.0.1', '0', '0', '1', '2017-06', '2017-06-15', null, null, '0', '2017-06-07 13:19:41', '2017-07-11 11:41:10', null);
INSERT INTO `records` VALUES ('9', '1', '10', '323', null, null, '31.00', null, null, '127.0.0.1', '1', '0', '2', '2017-06', '2017-06-15', null, null, '0', '2017-06-15 13:24:09', '2017-07-19 21:55:47', null);
INSERT INTO `records` VALUES ('18', '1', '10', '232', null, null, '21.00', null, null, '127.0.0.1', '1', '0', '2', '2017-06', '2017-06-26', null, 'adsa', '0', '2017-06-26 11:33:48', '2017-07-19 21:52:50', null);
INSERT INTO `records` VALUES ('28', '1', '10', '3232', null, '988.00', '20.00', '-230324.00', null, '127.0.0.1', '1', '0', '2', '2017-06', '2017-06-26', null, '妈了个逼啊', '0', '2017-06-26 12:43:19', '2017-07-11 11:41:12', null);
INSERT INTO `records` VALUES ('29', '1', null, 'pay201707100240391545', null, null, '222.00', '-222.00', null, null, '1', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 02:40:39', '2017-07-15 17:56:49', null);
INSERT INTO `records` VALUES ('30', '10', null, 'pay201707100240396301', null, null, '222.00', '222.00', null, null, '0', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 02:40:39', '2017-07-15 17:56:48', null);
INSERT INTO `records` VALUES ('31', '1', null, 'PAY201707100258157655', null, null, '100.00', '-100.00', null, null, '1', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 02:58:15', '2017-07-15 17:56:47', null);
INSERT INTO `records` VALUES ('32', '10', null, 'PAY201707100258157702', null, null, '100.00', '100.00', null, null, '0', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 02:58:15', '2017-07-15 17:56:47', null);
INSERT INTO `records` VALUES ('33', '1', null, 'PAY201707100301307678', null, null, '222.00', '-222.00', null, null, '1', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 03:01:30', '2017-07-15 17:56:46', null);
INSERT INTO `records` VALUES ('34', '10', null, 'PAY201707100301304933', null, null, '222.00', '222.00', null, null, '0', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 03:01:30', '2017-07-15 17:56:45', null);
INSERT INTO `records` VALUES ('35', '10', null, 'PAY201707100331495377', null, null, '100.00', '122.00', null, null, '1', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 03:31:49', '2017-07-15 17:56:44', null);
INSERT INTO `records` VALUES ('36', '1', null, 'PAY201707100331503021', null, null, '100.00', '10100.00', null, null, '0', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 03:31:50', '2017-07-10 03:31:50', null);
INSERT INTO `records` VALUES ('37', '1', null, 'PAY201707100352438732', null, null, '222.00', '9878.00', null, null, '1', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 03:52:43', '2017-07-10 03:52:43', null);
INSERT INTO `records` VALUES ('38', '10', null, 'PAY201707100352437837', null, null, '222.00', '272.00', null, null, '0', '2', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 03:52:43', '2017-07-10 03:52:43', null);
INSERT INTO `records` VALUES ('39', '1', null, 'PAY201707100714119692', null, '9878.00', '30.00', '9908.00', null, null, '0', '1', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 07:14:11', '2017-07-10 07:14:11', null);
INSERT INTO `records` VALUES ('40', '1', null, 'PAY201707100803105846', null, '9908.00', '30.00', '9938.00', null, null, '0', '0', '1', '2017-07', '2017-07-10', null, null, '0', '2017-07-10 08:03:10', '2017-07-12 10:13:41', null);
INSERT INTO `records` VALUES ('41', '1', '12', null, null, '9938.00', '23.00', null, null, '127.0.0.1', '1', '0', '1', '2017-07', null, null, null, '0', '2017-07-11 06:45:00', '2017-07-27 13:53:55', null);
INSERT INTO `records` VALUES ('42', '1', null, 'PAY201707111022533265', null, '9938.00', '10.90', '9948.90', null, null, '0', '1', '1', '2017-07', '2017-07-11', null, null, '0', '2017-07-11 10:22:53', '2017-07-11 10:22:53', null);
INSERT INTO `records` VALUES ('43', '1', null, 'PAY201707181122546843', null, '91309.15', '20.00', '91329.15', null, null, '0', '1', '1', '2017-07', '2017-07-18', null, null, '0', '2017-07-18 11:22:54', '2017-07-18 11:22:54', null);
INSERT INTO `records` VALUES ('44', '1', '10', null, null, '91309.15', '11.00', null, null, '127.0.0.1', '1', '0', '2', '2017-07', null, null, null, '0', '2017-07-18 11:48:24', '2017-07-19 21:52:41', null);
INSERT INTO `records` VALUES ('45', '1', '10', null, null, '92302.79', '848.00', null, null, '127.0.0.1', '1', '0', '1', '2017-07', null, null, null, '0', '2017-07-19 21:37:28', '2017-07-27 13:53:56', null);
INSERT INTO `records` VALUES ('46', '1', '10', null, null, '90606.79', '606.00', null, null, '127.0.0.1', '1', '0', '1', '2017-07', null, null, null, '0', '2017-07-19 21:49:06', '2017-07-27 13:53:57', null);
INSERT INTO `records` VALUES ('47', '1', null, 'PAY201707200030273675', null, '88656.54', '669.00', '87987.54', null, null, '1', '2', '1', '2017-07', '2017-07-20', null, null, '0', '2017-07-20 00:30:28', '2017-07-20 00:30:28', null);
INSERT INTO `records` VALUES ('48', '33', null, 'PAY201707200030281796', null, '669.00', '669.00', '1338.00', null, null, '0', '2', '1', '2017-07', '2017-07-20', null, null, '0', '2017-07-20 00:30:28', '2017-07-20 00:30:28', null);
INSERT INTO `records` VALUES ('49', '1', '0', '', null, '87000.04', '998.00', '86002.04', null, null, '1', '2', '1', '2017-07', '2017-07-24', null, null, '0', '2017-07-24 08:39:40', '2017-07-24 08:39:40', null);
INSERT INTO `records` VALUES ('50', '33', '0', '', null, '-340.00', '998.00', '658.00', null, null, '0', '2', '1', '2017-07', '2017-07-24', null, null, '0', '2017-07-24 08:39:40', '2017-07-24 08:39:40', null);
INSERT INTO `records` VALUES ('51', '1', null, '201707240907247461', null, '87000.04', '350.00', '86650.04', null, null, '1', '2', '1', '2017-07', '2017-07-24', null, null, '0', '2017-07-24 09:07:24', '2017-07-24 09:07:24', null);
INSERT INTO `records` VALUES ('52', '33', null, '201707240907248112', null, '-340.00', '350.00', '10.00', null, null, '0', '2', '0', '2017-07', '2017-07-24', null, null, '0', '2017-07-24 09:07:24', '2017-07-27 13:30:14', null);
INSERT INTO `records` VALUES ('53', '1', '10', '201707240919393519', null, '86650.04', '652.00', '85998.04', null, null, '1', '0', '2', '2017-07', '2017-07-24', null, '不好使', '0', '2017-07-24 09:19:39', '2017-07-27 05:00:53', null);
INSERT INTO `records` VALUES ('54', '31', '13', '201707250253217432', null, '2000.00', '100.00', '1900.00', null, null, '1', '0', '0', '2017-07', '2017-07-25', null, null, '0', '2017-07-25 02:53:21', '2017-07-27 13:30:15', null);
INSERT INTO `records` VALUES ('55', '31', '13', '201707270254208209', null, '2000.00', '1000.00', '1000.00', null, null, '1', '0', '0', '2017-07', '2017-07-27', null, null, '0', '2017-07-27 02:54:20', '2017-07-27 13:30:15', null);
INSERT INTO `records` VALUES ('56', '31', '13', '201707270258482585', null, '1000.00', '200.00', '800.00', null, null, '1', '0', '0', '2017-07', '2017-07-27', null, null, '0', '2017-07-27 02:58:48', '2017-07-27 13:30:19', null);
INSERT INTO `records` VALUES ('57', '31', '13', '201707270259172032', null, '1000.00', '800.00', '200.00', null, null, '1', '0', '0', '2017-07', '2017-07-27', null, '231321', '0', '2017-07-27 02:59:17', '2017-07-27 13:30:17', null);
INSERT INTO `records` VALUES ('58', '31', '13', '201707270300185692', null, '1000.00', '500.00', '500.00', null, null, '1', '0', '2', '2017-07', '2017-07-27', null, 'dd', '0', '2017-07-27 03:00:18', '2017-07-27 05:33:39', null);
INSERT INTO `records` VALUES ('59', '1', '10', '201707270511416830', null, '85685.04', '100.00', '85585.04', null, null, '1', '0', '1', '2017-07', '2017-07-27', null, null, '0', '2017-07-27 05:11:41', '2017-07-27 13:53:58', null);
INSERT INTO `records` VALUES ('60', '1', '10', '201707270631088221', null, '85445.04', '100.00', '85345.04', null, null, '1', '0', '0', '2017-07', '2017-07-27', null, null, '0', '2017-07-27 06:31:08', '2017-07-27 06:31:08', null);

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `qq` varchar(100) DEFAULT NULL,
  `QRCode` varchar(255) DEFAULT NULL,
  `Copyright` text,
  `userBanks` smallint(5) DEFAULT NULL COMMENT '单人银行卡数',
  `address` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email_smtp` varchar(100) DEFAULT NULL,
  `email_port` int(11) DEFAULT NULL,
  `email_login` varchar(255) DEFAULT NULL,
  `email_password` varchar(255) DEFAULT NULL,
  `volume` float(18,2) DEFAULT NULL COMMENT '每手佣金返佣钱数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'MT4.admin', '/uploads/temp/20170722/2db0ce8aa4e4d07293122338129c2a9d.png', '+44 (0) 1428 656600', 'forex@forex-bcs.uk', 'http://www.forex-bcs.uk', '1037724555', null, '<p>公司地址：英国伦敦查尔顿街41号1楼（1st Floor,41 Chalton Street,London NW1 1JD）</p><p>电话：+44 (0) 1428 656600 &nbsp;传真：+44 (0) 1428 656745 &nbsp;Email:forex@forex-bcs.uk</p><p><br/></p><p><br/></p>', '3', null, null, null, null, null, null, '10.00', '2017-07-15 05:17:50', '2017-07-22 01:14:29', null);

-- ----------------------------
-- Table structure for `traders`
-- ----------------------------
DROP TABLE IF EXISTS `traders`;
CREATE TABLE `traders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` int(11) DEFAULT NULL,
  `order` bigint(20) DEFAULT NULL,
  `cmd` smallint(5) DEFAULT NULL,
  `openprice` float(18,2) DEFAULT NULL,
  `closeprice` float(18,2) DEFAULT NULL,
  `opentime` int(11) DEFAULT NULL,
  `closetime` int(11) DEFAULT NULL,
  `profit` float(18,2) DEFAULT NULL,
  `symbol` varchar(100) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `volume` float(18,2) DEFAULT NULL,
  `regdate` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `winprice` float(18,2) DEFAULT NULL COMMENT '止盈',
  `loseprice` float(18,2) DEFAULT NULL COMMENT '止损',
  `count` smallint(5) NOT NULL DEFAULT '0' COMMENT '是否计算佣金',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1254 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traders
-- ----------------------------
INSERT INTO `traders` VALUES ('1', '19870907', '1332304530', '0', '1.14', '1.14', '1499587909', '1499587970', '0.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-09 08:11:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('2', '19870907', '1332304531', '0', '1.14', '1.14', '1499587911', '1499591512', '4.25', 'EURUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-09 08:11:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('3', '19870907', '1332304532', '0', '1.14', '1.14', '1499587912', '1499591512', '4.25', 'EURUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-09 08:11:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('4', '19870907', '1332304541', '0', '1.14', '1.14', '1499588980', '1499589280', '3.80', 'EURUSD', 'BO:$5,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-09 08:29:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('5', '19870907', '1332304542', '0', '1.14', '1.14', '1499589044', '1499589345', '0.00', 'EURUSD', 'BO:$5,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-09 08:30:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('6', '19870907', '1332304543', '0', '1.14', '1.14', '1499589049', '1499589109', '0.00', 'EURUSD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-09 08:30:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('7', '19870907', '1332304544', '0', '1.14', '1.14', '1499589109', '1499589169', '0.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-09 08:31:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('8', '19870907', '1332304546', '1', '1.14', '1.14', '1499589150', '1499589210', '0.00', 'EURUSD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-09 08:32:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('9', '2064181', '1332304743', '0', '1.14', '1.14', '1499615457', '1499619057', '4.25', 'EURUSD', 'BO:$5,60m|85', '0.05', '1500280517', null, null, '1', '2017-07-09 15:50:57', '2017-07-20 11:02:04');
INSERT INTO `traders` VALUES ('10', '2064181', '1332304744', '0', '1.14', '1.14', '1499615460', '1499619061', '4.25', 'EURUSD', 'BO:$5,60m|85', '0.01', '1500280517', null, null, '1', '2017-07-09 15:51:00', '2017-07-20 11:02:05');
INSERT INTO `traders` VALUES ('11', '19870907', '1332304745', '0', '1.14', '1.14', '1499615461', '1499619061', '4.25', 'EURUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-09 15:51:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('12', '19870907', '1332304746', '0', '1.14', '1.14', '1499615461', '1499619061', '4.25', 'EURUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-09 15:51:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('13', '19870907', '1332304747', '0', '1.14', '1.14', '1499615461', '1499619061', '4.25', 'EURUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-09 15:51:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('14', '19870907', '1332304748', '0', '1.14', '1.14', '1499615465', '1499619065', '85.00', 'EURUSD', 'BO:$100,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-09 15:51:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('15', '19870907', '1332309400', '0', '1.14', '1.14', '1499661661', '1499661721', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 04:41:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('16', '19870907', '1332309401', '1', '1.14', '1.14', '1499661662', '1499661723', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 04:41:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('17', '19870907', '1332309415', '0', '1.14', '1.14', '1499661694', '1499661754', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 04:41:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('18', '19870907', '1332309416', '1', '1.14', '1.14', '1499661694', '1499661754', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 04:41:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('19', '19870907', '1332309447', '0', '1.14', '1.14', '1499661737', '1499661797', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 04:42:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('20', '19870907', '1332309449', '1', '1.14', '1.14', '1499661738', '1499661798', '0.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 04:42:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('21', '19870907', '1332310044', '0', '1.29', '1.29', '1499663101', '1499663161', '0.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 05:05:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('22', '19870907', '1332310045', '1', '1.29', '1.29', '1499663102', '1499663162', '0.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 05:05:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('23', '19870907', '1332310046', '0', '1.29', '1.29', '1499663104', '1499663164', '0.00', 'USDCAD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 05:05:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('24', '19870907', '1332311226', '0', '1.29', '1.29', '1499666532', '1499666593', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:02:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('25', '19870907', '1332311228', '1', '1.29', '1.29', '1499666534', '1499666595', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:02:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('26', '19870907', '1332311231', '0', '1.29', '1.29', '1499666536', '1499666596', '0.00', 'USDCAD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:02:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('27', '19870907', '1332311233', '0', '1.29', '1.29', '1499666538', '1499666598', '0.00', 'USDCAD', 'BO:$300,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:02:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('28', '19870907', '1332311234', '1', '1.29', '1.29', '1499666539', '1499666599', '0.00', 'USDCAD', 'BO:$300,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:02:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('29', '19870907', '1332311285', '0', '114.15', '114.14', '1499666622', '1499666682', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:03:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('30', '19870907', '1332311288', '0', '114.15', '114.14', '1499666623', '1499666684', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:03:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('31', '19870907', '1332311291', '0', '1.50', '1.50', '1499666628', '1499666688', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:03:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('32', '19870907', '1332311293', '1', '1.50', '1.50', '1499666629', '1499666689', '0.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:03:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('33', '19870907', '1332311302', '0', '1.50', '1.50', '1499666645', '1499666705', '0.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:04:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('34', '19870907', '1332311305', '0', '1.50', '1.50', '1499666646', '1499666706', '0.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:04:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('35', '19870907', '1332311308', '0', '1.50', '1.50', '1499666648', '1499666708', '0.00', 'EURAUD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:04:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('36', '19870907', '1332311309', '0', '1.50', '1.50', '1499666649', '1499666710', '75.00', 'EURAUD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:04:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('37', '19870907', '1332311310', '0', '1.50', '1.50', '1499666651', '1499666952', '-100.00', 'EURAUD', 'BO:$100,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-10 06:04:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('38', '19870907', '1332311311', '0', '1.50', '1.50', '1499666653', '1499666953', '-10.00', 'EURAUD', 'BO:$10,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-10 06:04:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('39', '19870907', '1332311317', '0', '0.88', '0.88', '1499666663', '1499666964', '-10.00', 'EURGBP', 'BO:$10,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-10 06:04:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('40', '19870907', '1332311387', '0', '0.88', '0.88', '1499666829', '1499666890', '0.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:07:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('41', '19870907', '1332311407', '0', '0.88', '0.88', '1499666877', '1499666937', '0.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:07:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('42', '19870907', '1332312092', '0', '0.88', '0.88', '1499668717', '1499668777', '0.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:38:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('43', '19870907', '1332312198', '0', '0.88', '0.88', '1499669090', '1499669150', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:44:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('44', '19870907', '1332312199', '1', '0.88', '0.88', '1499669099', '1499669159', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:44:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('45', '19870907', '1332312200', '1', '0.88', '0.88', '1499669099', '1499669159', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:44:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('46', '19870907', '1332312201', '0', '0.88', '0.88', '1499669099', '1499669159', '-20.00', 'EURGBP', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 06:44:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('47', '19870907', '1332313254', '0', '1.14', '1.14', '1499673097', '1499673158', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 07:51:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('48', '19870907', '1332313314', '0', '1.14', '1.14', '1499673293', '1499676894', '-100.00', 'EURUSD', 'BO:$100,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 07:54:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('49', '19870907', '1332313318', '0', '1.14', '1.14', '1499673296', '1499676897', '-800.00', 'EURUSD', 'BO:$800,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 07:54:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('50', '19870907', '1332313625', '0', '1.14', '1.14', '1499674112', '1499674172', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 08:08:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('51', '19870907', '1332313778', '0', '1.14', '1.14', '1499674735', '1499674795', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 08:18:55', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('52', '19870907', '1332313867', '1', '1.14', '1.14', '1499675076', '1499675136', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 08:24:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('53', '19870907', '1332313868', '0', '1.14', '1.14', '1499675076', '1499675136', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 08:24:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('54', '19870907', '1332313931', '0', '0.76', '0.76', '1499675379', '1499675440', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 08:29:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('55', '19870907', '1332314052', '0', '1.29', '1.29', '1499675738', '1499675798', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 08:35:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('56', '19870907', '1332314687', '0', '1.14', '1.14', '1499680945', '1499681005', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:02:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('57', '19870907', '1332314689', '1', '1.14', '1.14', '1499680946', '1499681008', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:02:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('58', '19870907', '1332314808', '0', '1.29', '1.29', '1499681632', '1499681692', '-10.00', 'USDCAD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:13:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('59', '19870907', '1332314959', '1', '1.14', '1.14', '1499682562', '1499682622', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:29:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('60', '19870907', '1332315048', '0', '0.76', '0.76', '1499683136', '1499683196', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:38:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('61', '19870907', '1332315077', '0', '1.14', '1.14', '1499683325', '1499683385', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:42:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('62', '19870907', '1332315078', '1', '1.14', '1.14', '1499683327', '1499683387', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:42:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('63', '19870907', '1332315079', '0', '1.14', '1.14', '1499683328', '1499683388', '15.00', 'EURUSD', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:42:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('64', '19870907', '1332315146', '0', '114.18', '114.18', '1499683929', '1499683989', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:52:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('65', '19870907', '1332315147', '1', '114.18', '114.18', '1499683930', '1499683990', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 10:52:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('66', '19870907', '1332315291', '0', '0.76', '0.76', '1499686056', '1499686116', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:27:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('67', '19870907', '1332315318', '0', '1.29', '1.29', '1499686237', '1499686297', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:30:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('68', '19870907', '1332315319', '1', '1.29', '1.29', '1499686237', '1499686297', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:30:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('69', '19870907', '1332315355', '0', '0.89', '0.89', '1499686603', '1499686663', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:36:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('70', '19870907', '1332315356', '1', '0.89', '0.89', '1499686604', '1499686666', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:36:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('71', '19870907', '1332315357', '1', '0.89', '0.89', '1499686605', '1499686666', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:36:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('72', '19870907', '1332315359', '0', '0.89', '0.89', '1499686608', '1499686668', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:36:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('73', '19870907', '1332315370', '0', '114.22', '114.22', '1499686672', '1499686732', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:37:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('74', '19870907', '1332315371', '1', '114.22', '114.22', '1499686672', '1499686732', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:37:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('75', '19870907', '1332315372', '0', '114.23', '114.22', '1499686674', '1499686734', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:37:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('76', '19870907', '1332315373', '1', '114.23', '114.23', '1499686676', '1499686736', '0.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:37:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('77', '19870907', '1332315374', '0', '114.23', '114.23', '1499686676', '1499686736', '37.50', 'USDJPY', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:37:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('78', '19870907', '1332315380', '0', '0.76', '0.76', '1499686720', '1499686780', '37.50', 'AUDUSD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:38:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('79', '19870907', '1332315415', '0', '114.20', '114.20', '1499687133', '1499687193', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:45:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('80', '19870907', '1332315416', '1', '114.20', '114.20', '1499687134', '1499687194', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 11:45:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('81', '19870907', '1332315561', '0', '0.76', '0.76', '1499688423', '1499688484', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:07:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('82', '19870907', '1332315562', '1', '0.76', '0.76', '1499688424', '1499688484', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:07:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('83', '19870907', '1332315578', '0', '114.20', '114.21', '1499688547', '1499688607', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:09:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('84', '19870907', '1332315579', '1', '114.20', '114.21', '1499688549', '1499688609', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:09:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('85', '19870907', '1332315580', '1', '114.20', '114.21', '1499688550', '1499688610', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:09:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('86', '19870907', '1332315581', '0', '114.21', '114.21', '1499688552', '1499688612', '75.00', 'USDJPY', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:09:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('87', '19870907', '1332315597', '0', '0.88', '0.88', '1499688791', '1499688853', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:13:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('88', '19870907', '1332315598', '1', '0.88', '0.88', '1499688793', '1499688853', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:13:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('89', '19870907', '1332315600', '0', '83.02', '83.01', '1499688797', '1499688857', '-5.00', 'NZDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:13:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('90', '19870907', '1332315602', '0', '83.02', '83.01', '1499688798', '1499688858', '-50.00', 'NZDJPY', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:13:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('91', '19870907', '1332315603', '0', '83.02', '83.00', '1499688800', '1499689700', '-50.00', 'NZDJPY', 'BO:$50,15m|80', '0.00', '1500280517', null, null, '1', '2017-07-10 12:13:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('92', '19870907', '1332315792', '0', '0.73', '0.73', '1499690521', '1499690582', '3.75', 'NZDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:42:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('93', '19870907', '1332315793', '1', '0.73', '0.73', '1499690521', '1499690582', '-5.00', 'NZDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:42:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('94', '19870907', '1332315818', '0', '1207.81', '1207.91', '1499690802', '1499690862', '3.75', 'XAUUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:46:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('95', '19870907', '1332315819', '1', '1207.81', '1207.92', '1499690803', '1499690863', '-5.00', 'XAUUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:46:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('96', '19870907', '1332315833', '1', '1.47', '1.47', '1499690906', '1499690968', '3.75', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:48:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('97', '19870907', '1332315834', '1', '1.47', '1.47', '1499690906', '1499690968', '3.75', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:48:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('98', '19870907', '1332315835', '0', '1.47', '1.47', '1499690906', '1499690968', '-5.00', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:48:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('99', '19870907', '1332315836', '0', '1.47', '1.47', '1499690908', '1499690968', '-5.00', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:48:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('100', '19870907', '1332315869', '0', '1208.06', '1208.14', '1499691362', '1499691422', '3.75', 'XAUUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:56:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('101', '19870907', '1332315870', '1', '1208.06', '1208.14', '1499691362', '1499691422', '-5.00', 'XAUUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 12:56:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('102', '19870907', '1332316032', '1', '1.47', '1.47', '1499693430', '1499693491', '-5.00', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:30:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('103', '19870907', '1332316033', '1', '1.47', '1.47', '1499693430', '1499693491', '-5.00', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:30:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('104', '19870907', '1332316034', '0', '1.47', '1.47', '1499693436', '1499697036', '-5.00', 'EURCAD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 13:30:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('105', '19870907', '1332316035', '1', '1.47', '1.47', '1499693438', '1499697038', '4.25', 'EURCAD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 13:30:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('106', '19870907', '1332316036', '0', '1.47', '1.47', '1499693438', '1499697038', '-5.00', 'EURCAD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 13:30:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('107', '19870907', '1332316051', '0', '1.47', '1.47', '1499693657', '1499693717', '3.75', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:34:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('108', '19870907', '1332316053', '0', '1.47', '1.47', '1499693661', '1499693721', '3.75', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:34:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('109', '19870907', '1332316056', '0', '1.57', '1.57', '1499693699', '1499693759', '-5.00', 'EURNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:34:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('110', '19870907', '1332316102', '0', '1.56', '1.57', '1499694228', '1499694289', '3.75', 'EURNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:43:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('111', '19870907', '1332316103', '0', '1.56', '1.57', '1499694229', '1499694289', '3.75', 'EURNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:43:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('112', '19870907', '1332316104', '1', '1.56', '1.57', '1499694230', '1499694290', '-5.00', 'EURNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:43:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('113', '19870907', '1332316105', '0', '0.73', '0.73', '1499694234', '1499694294', '-5.00', 'NZDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:43:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('114', '19870907', '1332316106', '0', '0.73', '0.73', '1499694234', '1499694294', '-5.00', 'NZDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:43:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('115', '19870907', '1332316107', '0', '0.73', '0.73', '1499694234', '1499694294', '-5.00', 'NZDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 13:43:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('116', '19870907', '1332316271', '0', '1.47', '1.47', '1499697139', '1499697199', '-5.00', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 14:32:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('117', '19870907', '1332316272', '0', '1.47', '1.47', '1499697139', '1499697199', '-5.00', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 14:32:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('118', '19870907', '1332316273', '1', '1.47', '1.47', '1499697139', '1499697199', '3.75', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 14:32:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('119', '19870907', '1332316274', '0', '1.47', '1.47', '1499697141', '1499697201', '-5.00', 'EURCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 14:32:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('120', '19870907', '1332316276', '0', '1.47', '1.47', '1499697144', '1499697204', '-100.00', 'EURCAD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 14:32:24', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('121', '19870907', '1332316277', '0', '1.47', '1.47', '1499697145', '1499697205', '-100.00', 'EURCAD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 14:32:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('122', '19870907', '1332316278', '1', '1.47', '1.47', '1499697145', '1499697205', '75.00', 'EURCAD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-10 14:32:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('123', '19870907', '1332316513', '0', '114.22', '114.18', '1499701975', '1499705575', '-5.00', 'USDJPY', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 15:52:55', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('124', '19870907', '1332316514', '0', '114.22', '114.18', '1499701979', '1499705579', '-5.00', 'USDJPY', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 15:52:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('125', '19870907', '1332316515', '0', '114.22', '114.18', '1499701979', '1499705579', '-5.00', 'USDJPY', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 15:52:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('126', '19870907', '1332316516', '0', '114.22', '114.18', '1499701979', '1499705579', '-5.00', 'USDJPY', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 15:52:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('127', '19870907', '1332316517', '0', '114.22', '114.18', '1499701979', '1499705579', '-5.00', 'USDJPY', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 15:52:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('128', '19870907', '1332316518', '0', '114.22', '114.18', '1499701982', '1499705582', '-5.00', 'USDJPY', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-10 15:53:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('129', '19870907', '1332319911', '1', '0.76', '0.76', '1499746025', '1499746129', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:07:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('130', '19870907', '1332319912', '0', '0.76', '0.76', '1499746026', '1499746130', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:07:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('131', '19870907', '1332320197', '1', '1.24', '1.24', '1499747338', '1499747399', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:28:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('132', '19870907', '1332320198', '1', '1.24', '1.24', '1499747338', '1499747399', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:28:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('133', '19870907', '1332320199', '0', '1.24', '1.24', '1499747338', '1499747399', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:28:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('134', '19870907', '1332320200', '0', '1.24', '1.24', '1499747338', '1499747399', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:28:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('135', '19870907', '1332320201', '1', '1.24', '1.24', '1499747338', '1499747399', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:28:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('136', '19870907', '1332320202', '0', '1.24', '1.24', '1499747338', '1499747399', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:28:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('137', '19870907', '1332320258', '0', '1.10', '1.10', '1499747394', '1499747455', '-5.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 04:29:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('138', '19870907', '1332322376', '1', '130.20', '130.19', '1499759593', '1499760493', '4.00', 'EURJPY', 'BO:$5,15m|80', '0.00', '1500280517', null, null, '1', '2017-07-11 07:53:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('139', '19870907', '1332322377', '1', '130.20', '130.19', '1499759593', '1499760493', '4.00', 'EURJPY', 'BO:$5,15m|80', '0.00', '1500280517', null, null, '1', '2017-07-11 07:53:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('140', '19870907', '1332322382', '1', '130.20', '130.19', '1499759600', '1499759708', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 07:53:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('141', '19870907', '1332322406', '1', '114.37', '114.39', '1499760042', '1499760128', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:00:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('142', '19870907', '1332322407', '1', '114.37', '114.39', '1499760044', '1499760128', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:00:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('143', '19870907', '1332322408', '0', '114.37', '114.39', '1499760044', '1499760128', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:00:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('144', '19870907', '1332322934', '0', '0.88', '0.88', '1499762475', '1499762535', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:41:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('145', '19870907', '1332322936', '1', '0.88', '0.88', '1499762476', '1499762537', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:41:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('146', '19870907', '1332323151', '0', '114.38', '114.39', '1499762897', '1499762958', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:48:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('147', '19870907', '1332323153', '1', '114.38', '114.39', '1499762902', '1499762962', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:48:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('148', '19870907', '1332323154', '1', '114.38', '114.39', '1499762902', '1499762962', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:48:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('149', '19870907', '1332323155', '1', '114.38', '114.39', '1499762902', '1499762962', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:48:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('150', '19870907', '1332323156', '0', '114.38', '114.39', '1499762902', '1499762962', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:48:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('151', '19870907', '1332323157', '1', '0.76', '0.76', '1499762903', '1499762964', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:48:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('152', '19870907', '1332323161', '1', '114.38', '114.39', '1499762908', '1499762968', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 08:48:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('153', '19870907', '1332323589', '0', '1.14', '1.14', '1499764621', '1499764681', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 09:17:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('154', '19870907', '1332323591', '1', '1.14', '1.14', '1499764621', '1499764681', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 09:17:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('155', '19870907', '1332323593', '0', '1.14', '1.14', '1499764622', '1499764682', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 09:17:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('156', '19870907', '1332323623', '0', '1.14', '1.14', '1499764653', '1499764713', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 09:17:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('157', '19870907', '1332324419', '0', '0.76', '0.76', '1499766394', '1499766454', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 09:46:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('158', '19870907', '1332324422', '1', '0.76', '0.76', '1499766394', '1499766454', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 09:46:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('159', '19870907', '1332324428', '1', '1.14', '1.14', '1499766408', '1499766469', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 09:46:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('160', '19870907', '1332324808', '0', '1.14', '1.14', '1499767480', '1499767540', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 10:04:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('161', '19870907', '1332324809', '1', '1.14', '1.14', '1499767481', '1499767541', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 10:04:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('162', '19870907', '1332324841', '0', '1.29', '1.29', '1499767516', '1499767576', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 10:05:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('163', '19870907', '1332324842', '1', '1.29', '1.29', '1499767518', '1499767578', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 10:05:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('164', '19870907', '1332326524', '0', '0.88', '0.88', '1499772017', '1499772077', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:20:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('165', '19870907', '1332326529', '0', '0.88', '0.88', '1499772018', '1499772078', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:20:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('166', '19870907', '1332326559', '0', '0.88', '0.88', '1499772052', '1499772112', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:20:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('167', '19870907', '1332326574', '0', '1.50', '1.50', '1499772088', '1499772148', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:21:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('168', '19870907', '1332326575', '0', '1.50', '1.50', '1499772096', '1499772156', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:21:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('169', '19870907', '1332326576', '0', '1.50', '1.50', '1499772096', '1499772156', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:21:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('170', '19870907', '1332326577', '0', '1.50', '1.50', '1499772097', '1499772157', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:21:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('171', '19870907', '1332326578', '0', '1.50', '1.50', '1499772097', '1499772157', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:21:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('172', '19870907', '1332326795', '0', '1.14', '1.14', '1499772503', '1499772563', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:28:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('173', '19870907', '1332326796', '1', '1.14', '1.14', '1499772505', '1499772566', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:28:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('174', '19870907', '1332326797', '1', '1.14', '1.14', '1499772505', '1499772566', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:28:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('175', '19870907', '1332326798', '1', '1.14', '1.14', '1499772505', '1499772566', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:28:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('176', '19870907', '1332326881', '1', '1.29', '1.29', '1499772672', '1499772732', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('177', '19870907', '1332326882', '1', '1.29', '1.29', '1499772673', '1499772734', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('178', '19870907', '1332326883', '1', '1.29', '1.29', '1499772674', '1499772734', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('179', '19870907', '1332326889', '1', '1.29', '1.29', '1499772685', '1499772746', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('180', '19870907', '1332326890', '1', '1.29', '1.29', '1499772686', '1499772746', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('181', '19870907', '1332326891', '1', '1.29', '1.29', '1499772687', '1499772747', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('182', '19870907', '1332326892', '0', '1.29', '1.29', '1499772689', '1499772749', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('183', '19870907', '1332326893', '0', '1.29', '1.29', '1499772689', '1499772749', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('184', '19870907', '1332326894', '0', '1.29', '1.29', '1499772692', '1499772752', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('185', '19870907', '1332326895', '0', '1.29', '1.29', '1499772692', '1499772752', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('186', '19870907', '1332326896', '0', '1.29', '1.29', '1499772692', '1499772752', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('187', '19870907', '1332326897', '0', '1.29', '1.29', '1499772692', '1499772752', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('188', '19870907', '1332326898', '0', '1.29', '1.29', '1499772692', '1499772752', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('189', '19870907', '1332326899', '0', '1.29', '1.29', '1499772692', '1499772752', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('190', '19870907', '1332326903', '1', '1.29', '1.29', '1499772703', '1499772764', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('191', '19870907', '1332326910', '1', '1.29', '1.29', '1499772717', '1499772777', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:31:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('192', '19870907', '1332326917', '0', '1.29', '1.29', '1499772734', '1499772794', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:32:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('193', '19870907', '1332326920', '0', '1.29', '1.29', '1499772740', '1499772800', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:32:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('194', '19870907', '1332326926', '1', '1.29', '1.29', '1499772757', '1499772817', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:32:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('195', '19870907', '1332326953', '1', '1.14', '1.14', '1499772843', '1499772903', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:34:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('196', '19870907', '1332326954', '1', '1.14', '1.14', '1499772843', '1499772903', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:34:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('197', '19870907', '1332326955', '1', '1.14', '1.14', '1499772843', '1499772903', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:34:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('198', '19870907', '1332326958', '1', '1.14', '1.14', '1499772843', '1499772903', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:34:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('199', '19870907', '1332326959', '1', '1.14', '1.14', '1499772843', '1499772903', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:34:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('200', '19870907', '1332327025', '0', '1.29', '1.29', '1499773063', '1499773124', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:37:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('201', '19870907', '1332327026', '1', '1.29', '1.29', '1499773066', '1499773126', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:37:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('202', '19870907', '1332327045', '1', '0.76', '0.76', '1499773159', '1499773219', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:39:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('203', '19870907', '1332327046', '1', '0.76', '0.76', '1499773159', '1499773219', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:39:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('204', '19870907', '1332327047', '1', '0.76', '0.76', '1499773160', '1499773221', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:39:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('205', '19870907', '1332327049', '0', '0.76', '0.76', '1499773166', '1499773227', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:39:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('206', '19870907', '1332327051', '0', '0.76', '0.76', '1499773167', '1499773227', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:39:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('207', '19870907', '1332327066', '1', '0.76', '0.76', '1499773227', '1499773287', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:40:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('208', '19870907', '1332327141', '0', '1.50', '1.50', '1499773417', '1499773717', '76.00', 'EURAUD', 'BO:$100,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-11 11:43:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('209', '19870907', '1332327142', '0', '1.50', '1.50', '1499773417', '1499773717', '76.00', 'EURAUD', 'BO:$100,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-11 11:43:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('210', '19870907', '1332327143', '0', '1.50', '1.50', '1499773417', '1499773477', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:43:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('211', '19870907', '1332327147', '0', '1.50', '1.50', '1499773425', '1499773486', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:43:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('212', '19870907', '1332327203', '0', '1.50', '1.50', '1499773496', '1499773557', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:44:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('213', '19870907', '1332327204', '0', '1.50', '1.50', '1499773496', '1499773557', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:44:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('214', '19870907', '1332327205', '0', '1.50', '1.50', '1499773497', '1499773557', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:44:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('215', '19870907', '1332327207', '1', '1.50', '1.50', '1499773498', '1499773558', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:44:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('216', '19870907', '1332327208', '1', '1.50', '1.50', '1499773498', '1499773558', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:44:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('217', '19870907', '1332327244', '1', '1.50', '1.50', '1499773559', '1499773619', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:45:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('218', '19870907', '1332327281', '0', '1.14', '1.14', '1499773611', '1499773672', '0.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:46:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('219', '19870907', '1332327418', '0', '1.14', '1.14', '1499773969', '1499774030', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:52:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('220', '19870907', '1332327421', '1', '1.14', '1.14', '1499773970', '1499774030', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:52:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('221', '19870907', '1332327423', '1', '1.14', '1.14', '1499773970', '1499774030', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:52:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('222', '19870907', '1332327424', '1', '1.14', '1.14', '1499773970', '1499774030', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:52:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('223', '19870907', '1332327425', '1', '1.14', '1.14', '1499773970', '1499774030', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:52:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('224', '19870907', '1332327618', '0', '1.14', '1.14', '1499774235', '1499774295', '0.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:57:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('225', '19870907', '1332327619', '1', '1.14', '1.14', '1499774237', '1499774297', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 11:57:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('226', '19870907', '1332327989', '1', '114.34', '114.34', '1499775479', '1499775542', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:17:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('227', '19870907', '1332327990', '0', '114.34', '114.34', '1499775480', '1499775542', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:18:00', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('228', '19870907', '1332327991', '0', '114.34', '114.34', '1499775480', '1499775542', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:18:00', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('229', '19870907', '1332327992', '0', '114.34', '114.34', '1499775480', '1499775542', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:18:00', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('230', '19870907', '1332328175', '0', '1.29', '1.29', '1499776305', '1499776365', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:31:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('231', '19870907', '1332328176', '0', '1.29', '1.29', '1499776305', '1499776365', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:31:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('232', '19870907', '1332328177', '1', '1.29', '1.29', '1499776306', '1499776367', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:31:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('233', '19870907', '1332328190', '0', '1.29', '1.29', '1499776345', '1499776405', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:32:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('234', '19870907', '1332328191', '0', '1.29', '1.29', '1499776345', '1499776405', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:32:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('235', '19870907', '1332328192', '0', '1.29', '1.29', '1499776346', '1499776406', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:32:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('236', '19870907', '1332328194', '0', '1.29', '1.29', '1499776349', '1499776409', '-100.00', 'USDCAD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:32:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('237', '19870907', '1332328203', '1', '1.29', '1.29', '1499776385', '1499776445', '75.00', 'USDCAD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:33:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('238', '19870907', '1332328204', '1', '1.29', '1.29', '1499776385', '1499776445', '75.00', 'USDCAD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:33:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('239', '19870907', '1332328206', '0', '1.29', '1.29', '1499776389', '1499776449', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:33:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('240', '19870907', '1332328209', '0', '1.29', '1.29', '1499776391', '1499776452', '-10.00', 'USDCAD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:33:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('241', '19870907', '1332328210', '0', '1.29', '1.29', '1499776391', '1499776452', '-10.00', 'USDCAD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:33:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('242', '19870907', '1332328211', '0', '1.29', '1.29', '1499776391', '1499776452', '-10.00', 'USDCAD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:33:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('243', '19870907', '1332328219', '1', '1.29', '1.29', '1499776418', '1499776479', '7.50', 'USDCAD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:33:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('244', '19870907', '1332328220', '1', '1.29', '1.29', '1499776418', '1499776480', '7.50', 'USDCAD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:33:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('245', '19870907', '1332328262', '0', '1.50', '1.50', '1499776672', '1499776733', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:37:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('246', '19870907', '1332328263', '0', '1.50', '1.50', '1499776672', '1499776733', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:37:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('247', '19870907', '1332328264', '0', '1.50', '1.50', '1499776673', '1499776733', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:37:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('248', '19870907', '1332328265', '0', '1.50', '1.50', '1499776673', '1499776733', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:37:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('249', '19870907', '1332328266', '0', '1.50', '1.50', '1499776673', '1499776733', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:37:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('250', '19870907', '1332328267', '0', '1.50', '1.50', '1499776673', '1499776733', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:37:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('251', '19870907', '1332328269', '0', '1.50', '1.50', '1499776676', '1499776736', '7.50', 'EURAUD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:37:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('252', '19870907', '1332328310', '0', '1.50', '1.50', '1499776887', '1499776948', '7.50', 'EURAUD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:41:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('253', '19870907', '1332328311', '0', '1.50', '1.50', '1499776888', '1499776948', '7.50', 'EURAUD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:41:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('254', '19870907', '1332328312', '0', '1.50', '1.50', '1499776891', '1499776951', '7.50', 'EURAUD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:41:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('255', '19870907', '1332328313', '0', '1.50', '1.50', '1499776891', '1499776951', '15.00', 'EURAUD', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:41:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('256', '19870907', '1332328314', '0', '1.50', '1.50', '1499776891', '1499776951', '15.00', 'EURAUD', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:41:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('257', '19870907', '1332328315', '0', '1.50', '1.50', '1499776891', '1499776951', '15.00', 'EURAUD', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:41:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('258', '19870907', '1332328316', '0', '1.50', '1.50', '1499776891', '1499776951', '15.00', 'EURAUD', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:41:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('259', '19870907', '1332328471', '1', '1.50', '1.50', '1499777695', '1499777756', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:54:55', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('260', '19870907', '1332328472', '0', '1.50', '1.50', '1499777696', '1499777756', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:54:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('261', '19870907', '1332328473', '0', '114.31', '114.32', '1499777706', '1499777767', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:55:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('262', '19870907', '1332328474', '0', '114.31', '114.32', '1499777706', '1499777767', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 12:55:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('263', '19870907', '1332331065', '0', '0.89', '0.89', '1499789697', '1499789758', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 16:14:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('264', '19870907', '1332331066', '1', '0.89', '0.89', '1499789699', '1499789759', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 16:14:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('265', '19870907', '1332331082', '0', '0.89', '0.89', '1499789982', '1499790042', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-11 16:19:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('266', '19870907', '1332339827', '1', '1.29', '1.29', '1499842311', '1499842371', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:51:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('267', '19870907', '1332339829', '0', '1.29', '1.29', '1499842311', '1499842371', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:51:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('268', '19870907', '1332339905', '0', '1.15', '1.15', '1499842646', '1499842706', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:57:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('269', '19870907', '1332339908', '0', '1.15', '1.15', '1499842658', '1499842718', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:57:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('270', '19870907', '1332339909', '1', '1.15', '1.15', '1499842658', '1499842718', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:57:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('271', '19870907', '1332339910', '0', '1.50', '1.50', '1499842658', '1499842718', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:57:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('272', '19870907', '1332339916', '1', '1.50', '1.50', '1499842692', '1499842753', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:58:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('273', '19870907', '1332339917', '0', '1.50', '1.50', '1499842693', '1499842753', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:58:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('274', '19870907', '1332339930', '1', '1.50', '1.50', '1499842723', '1499842783', '0.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:58:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('275', '19870907', '1332339932', '0', '1.50', '1.50', '1499842724', '1499842784', '0.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 06:58:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('276', '19870907', '1332340259', '1', '1.15', '1.15', '1499843380', '1499843440', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('277', '19870907', '1332340260', '0', '1.15', '1.15', '1499843381', '1499843441', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('278', '19870907', '1332340261', '0', '1.15', '1.15', '1499843381', '1499843441', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('279', '19870907', '1332340262', '0', '1.15', '1.15', '1499843382', '1499843443', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('280', '19870907', '1332340263', '0', '1.15', '1.15', '1499843382', '1499843443', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('281', '19870907', '1332340264', '0', '1.15', '1.15', '1499843382', '1499843443', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('282', '19870907', '1332340265', '1', '1.15', '1.15', '1499843384', '1499843444', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('283', '19870907', '1332340266', '1', '1.15', '1.15', '1499843384', '1499843444', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('284', '19870907', '1332340267', '1', '1.15', '1.15', '1499843384', '1499843444', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('285', '19870907', '1332340268', '1', '1.15', '1.15', '1499843385', '1499843446', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('286', '19870907', '1332340269', '1', '1.15', '1.15', '1499843385', '1499843446', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('287', '19870907', '1332340270', '1', '1.15', '1.15', '1499843385', '1499843446', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('288', '19870907', '1332340272', '0', '1.15', '1.15', '1499843388', '1499843449', '-50.00', 'EURUSD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('289', '19870907', '1332340273', '0', '1.15', '1.15', '1499843389', '1499843449', '-50.00', 'EURUSD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('290', '19870907', '1332340274', '1', '1.15', '1.15', '1499843389', '1499843449', '37.50', 'EURUSD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('291', '19870907', '1332340275', '1', '1.15', '1.15', '1499843390', '1499843450', '37.50', 'EURUSD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('292', '19870907', '1332340276', '0', '1.15', '1.15', '1499843391', '1499843452', '-50.00', 'EURUSD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('293', '19870907', '1332340277', '0', '1.15', '1.15', '1499843391', '1499843452', '-50.00', 'EURUSD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:09:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('294', '19870907', '1332340533', '1', '1.15', '1.15', '1499844428', '1499844488', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:27:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('295', '19870907', '1332340534', '0', '1.15', '1.15', '1499844428', '1499844488', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:27:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('296', '19870907', '1332340712', '0', '1.15', '1.15', '1499845208', '1499845268', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:40:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('297', '19870907', '1332340730', '0', '1.15', '1.15', '1499845289', '1499845349', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:41:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('298', '19870907', '1332340731', '1', '1.15', '1.15', '1499845290', '1499845351', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:41:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('299', '19870907', '1332340848', '1', '1.15', '1.15', '1499845874', '1499845935', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:51:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('300', '19870907', '1332340849', '0', '1.15', '1.15', '1499845875', '1499845935', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:51:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('301', '19870907', '1332340883', '0', '1.15', '1.15', '1499845990', '1499846050', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:53:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('302', '19870907', '1332340884', '0', '1.15', '1.15', '1499845991', '1499846051', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:53:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('303', '19870907', '1332340885', '1', '1.15', '1.15', '1499845991', '1499846051', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:53:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('304', '19870907', '1332340933', '1', '1.29', '1.29', '1499846149', '1499846212', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:55:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('305', '19870907', '1332340935', '0', '1.29', '1.29', '1499846151', '1499846212', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:55:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('306', '19870907', '1332340936', '1', '1.29', '1.29', '1499846151', '1499846212', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:55:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('307', '19870907', '1332340938', '1', '1.29', '1.29', '1499846153', '1499846213', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 07:55:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('308', '19870907', '1332341031', '0', '1.29', '1.29', '1499846480', '1499846540', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:01:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('309', '19870907', '1332341077', '0', '1.29', '1.29', '1499846658', '1499846719', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:04:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('310', '19870907', '1332341555', '0', '0.76', '0.76', '1499848583', '1499848643', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('311', '19870907', '1332341557', '0', '0.76', '0.76', '1499848590', '1499848650', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('312', '19870907', '1332341559', '0', '0.76', '0.76', '1499848590', '1499848650', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('313', '19870907', '1332341560', '0', '0.76', '0.76', '1499848591', '1499848651', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('314', '19870907', '1332341561', '0', '0.76', '0.76', '1499848591', '1499848651', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('315', '19870907', '1332341562', '0', '0.76', '0.76', '1499848591', '1499848651', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('316', '19870907', '1332341563', '0', '0.76', '0.76', '1499848591', '1499848651', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('317', '19870907', '1332341567', '0', '0.76', '0.76', '1499848600', '1499848660', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('318', '19870907', '1332341568', '0', '0.76', '0.76', '1499848600', '1499848660', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('319', '19870907', '1332341569', '0', '0.76', '0.76', '1499848600', '1499848660', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('320', '19870907', '1332341570', '0', '0.76', '0.76', '1499848601', '1499848662', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('321', '19870907', '1332341572', '0', '0.76', '0.76', '1499848601', '1499848662', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:36:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('322', '19870907', '1332341840', '0', '1.28', '1.28', '1499849798', '1499849865', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:56:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('323', '19870907', '1332341851', '0', '1.28', '1.28', '1499849899', '1499849960', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:58:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('324', '19870907', '1332341852', '1', '1.28', '1.28', '1499849905', '1499849966', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 08:58:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('325', '19870907', '1332341902', '1', '1.15', '1.15', '1499850053', '1499850113', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:00:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('326', '19870907', '1332341940', '1', '1.29', '1.29', '1499850139', '1499850199', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:02:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('327', '19870907', '1332341970', '1', '1.50', '1.50', '1499850206', '1499850266', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:03:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('328', '19870907', '1332341980', '1', '145.51', '145.37', '1499850227', '1499852367', '40.00', 'GBPJPY', 'BO:$50,15m|80', '0.00', '1500280517', null, null, '1', '2017-07-12 09:03:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('329', '19870907', '1332341982', '0', '145.51', '145.37', '1499850227', '1499852367', '-50.00', 'GBPJPY', 'BO:$50,15m|80', '0.00', '1500280517', null, null, '1', '2017-07-12 09:03:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('330', '19870907', '1332341983', '1', '145.51', '145.56', '1499850228', '1499850288', '-5.00', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:03:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('331', '19870907', '1332341984', '1', '145.51', '145.56', '1499850229', '1499850290', '-5.00', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:03:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('332', '19870907', '1332341987', '0', '145.54', '145.59', '1499850239', '1499850299', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:03:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('333', '19870907', '1332341988', '1', '145.54', '145.59', '1499850239', '1499850299', '-5.00', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:03:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('334', '19870907', '1332341990', '0', '145.54', '145.58', '1499850241', '1499850302', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:04:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('335', '19870907', '1332341991', '1', '145.54', '145.58', '1499850243', '1499850304', '-5.00', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:04:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('336', '19870907', '1332341992', '0', '145.54', '145.58', '1499850243', '1499850304', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:04:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('337', '19870907', '1332341997', '0', '1.06', '1.06', '1499850265', '1499850325', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:04:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('338', '19870907', '1332341999', '0', '1.06', '1.06', '1499850269', '1499850329', '-100.00', 'AUDNZD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:04:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('339', '19870907', '1332342002', '1', '1.06', '1.06', '1499850271', '1499850331', '75.00', 'AUDNZD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:04:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('340', '19870907', '1332342027', '0', '1.06', '1.06', '1499850315', '1499850375', '-100.00', 'AUDNZD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:05:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('341', '19870907', '1332342028', '0', '1.06', '1.06', '1499850318', '1499850378', '-100.00', 'AUDNZD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:05:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('342', '19870907', '1332342084', '1', '82.15', '82.16', '1499850578', '1499850638', '-5.00', 'NZDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:09:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('343', '19870907', '1332342086', '1', '82.16', '82.16', '1499850579', '1499850641', '0.00', 'NZDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:09:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('344', '19870907', '1332342088', '0', '82.16', '82.16', '1499850580', '1499850641', '-5.00', 'NZDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:09:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('345', '19870907', '1332342092', '1', '82.16', '82.15', '1499850587', '1499850648', '37.50', 'NZDJPY', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:09:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('346', '19870907', '1332342096', '1', '82.16', '82.15', '1499850598', '1499850658', '3.75', 'NZDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:09:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('347', '19870907', '1332342097', '0', '82.16', '82.15', '1499850600', '1499850661', '-20.00', 'NZDJPY', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:10:00', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('348', '19870907', '1332342105', '1', '82.15', '82.15', '1499850648', '1499850709', '15.00', 'NZDJPY', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:10:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('349', '19870907', '1332342106', '0', '82.15', '82.15', '1499850654', '1499850714', '-100.00', 'NZDJPY', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 09:10:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('350', '19870907', '1332342615', '1', '87.79', '87.80', '1499854373', '1499854434', '-5.00', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 10:12:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('351', '19870907', '1332342616', '1', '87.79', '87.79', '1499854374', '1499854674', '-5.00', 'CADJPY', 'BO:$5,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-12 10:12:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('352', '19870907', '1332342618', '0', '87.80', '87.79', '1499854378', '1499854679', '-100.00', 'CADJPY', 'BO:$100,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-12 10:12:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('353', '19870907', '1332342619', '1', '87.80', '87.79', '1499854379', '1499854679', '76.00', 'CADJPY', 'BO:$100,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-12 10:12:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('354', '19870907', '1332342644', '0', '87.82', '87.84', '1499854520', '1499854820', '76.00', 'CADJPY', 'BO:$100,5m|76', '0.00', '1500280517', null, null, '1', '2017-07-12 10:15:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('355', '19870907', '1332343112', '1', '87.84', '87.84', '1499855664', '1499855725', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 10:34:24', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('356', '19870907', '1332343271', '1', '1.29', '1.29', '1499855829', '1499855889', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 10:37:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('357', '19870907', '1332343272', '0', '1.29', '1.29', '1499855829', '1499855889', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 10:37:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('358', '19870907', '1332343517', '0', '1.15', '1.15', '1499857622', '1499857683', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:07:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('359', '19870907', '1332343518', '1', '1.15', '1.15', '1499857623', '1499857683', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:07:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('360', '19870907', '1332343519', '1', '1.15', '1.15', '1499857624', '1499857684', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:07:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('361', '19870907', '1332343520', '1', '1.15', '1.15', '1499857625', '1499857686', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:07:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('362', '19870907', '1332343572', '0', '1.50', '1.50', '1499858197', '1499858258', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('363', '19870907', '1332343573', '1', '1.50', '1.50', '1499858198', '1499858258', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('364', '19870907', '1332343574', '1', '1.50', '1.50', '1499858198', '1499858258', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('365', '19870907', '1332343575', '1', '1.50', '1.50', '1499858198', '1499858258', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('366', '19870907', '1332343576', '1', '1.50', '1.50', '1499858203', '1499858264', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('367', '19870907', '1332343577', '1', '1.50', '1.50', '1499858204', '1499858264', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('368', '19870907', '1332343578', '1', '1.50', '1.50', '1499858204', '1499858264', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('369', '19870907', '1332343579', '1', '1.50', '1.50', '1499858204', '1499858264', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('370', '19870907', '1332343580', '1', '1.50', '1.50', '1499858204', '1499858264', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('371', '19870907', '1332343581', '1', '1.50', '1.50', '1499858205', '1499858265', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('372', '19870907', '1332343583', '1', '1.50', '1.50', '1499858206', '1499858266', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('373', '19870907', '1332343584', '0', '1.50', '1.50', '1499858209', '1499858270', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('374', '19870907', '1332343585', '0', '1.50', '1.50', '1499858209', '1499858270', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('375', '19870907', '1332343586', '0', '1.50', '1.50', '1499858210', '1499858270', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('376', '19870907', '1332343588', '0', '1.50', '1.50', '1499858210', '1499858270', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('377', '19870907', '1332343589', '0', '1.50', '1.50', '1499858210', '1499858270', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('378', '19870907', '1332343590', '0', '1.50', '1.50', '1499858210', '1499858270', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:16:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('379', '19870907', '1332343659', '1', '87.73', '87.74', '1499859036', '1499859096', '-5.00', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:30:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('380', '19870907', '1332343660', '0', '87.73', '87.74', '1499859037', '1499859097', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:30:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('381', '19870907', '1332343681', '1', '1.50', '1.50', '1499859184', '1499859244', '-5.00', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:33:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('382', '19870907', '1332343682', '0', '1.50', '1.50', '1499859185', '1499859246', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:33:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('383', '19870907', '1332343683', '0', '1.50', '1.50', '1499859185', '1499859246', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:33:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('384', '19870907', '1332343684', '0', '1.50', '1.50', '1499859186', '1499859246', '3.75', 'EURAUD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:33:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('385', '19870907', '1332343775', '0', '145.82', '145.84', '1499860335', '1499860396', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:52:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('386', '19870907', '1332343776', '1', '145.82', '145.84', '1499860336', '1499860396', '-5.00', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:52:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('387', '19870907', '1332343777', '1', '145.82', '145.84', '1499860336', '1499860396', '-5.00', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 11:52:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('388', '19870907', '1332344009', '1', '113.47', '113.47', '1499863487', '1499863548', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:44:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('389', '19870907', '1332344010', '1', '113.47', '113.47', '1499863487', '1499863548', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:44:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('390', '19870907', '1332344011', '1', '113.47', '113.47', '1499863487', '1499863548', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:44:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('391', '19870907', '1332344053', '1', '1.06', '1.06', '1499864264', '1499864324', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:57:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('392', '19870907', '1332344054', '1', '1.06', '1.06', '1499864264', '1499864324', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:57:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('393', '19870907', '1332344055', '1', '1.06', '1.06', '1499864264', '1499864324', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:57:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('394', '19870907', '1332344056', '1', '1.06', '1.06', '1499864264', '1499864324', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:57:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('395', '19870907', '1332344057', '1', '1.06', '1.06', '1499864264', '1499864324', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:57:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('396', '19870907', '1332344058', '1', '1.06', '1.06', '1499864265', '1499864326', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 12:57:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('397', '19870907', '1332344074', '0', '1.06', '1.06', '1499864475', '1499864536', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:01:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('398', '19870907', '1332344075', '0', '1.06', '1.06', '1499864475', '1499864536', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:01:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('399', '19870907', '1332344076', '0', '1.06', '1.06', '1499864475', '1499864536', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:01:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('400', '19870907', '1332344083', '1', '1.06', '1.06', '1499864577', '1499864637', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:02:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('401', '19870907', '1332344084', '1', '1.06', '1.06', '1499864578', '1499864639', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:02:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('402', '19870907', '1332344085', '1', '1.06', '1.06', '1499864578', '1499864639', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:02:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('403', '19870907', '1332344086', '0', '1.06', '1.06', '1499864579', '1499864639', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:02:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('404', '19870907', '1332344087', '0', '1.06', '1.06', '1499864579', '1499864639', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:02:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('405', '19870907', '1332344091', '0', '1.06', '1.06', '1499864705', '1499864766', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:05:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('406', '19870907', '1332344092', '0', '1.06', '1.06', '1499864705', '1499864766', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:05:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('407', '19870907', '1332344093', '0', '1.06', '1.06', '1499864705', '1499864766', '0.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:05:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('408', '19870907', '1332344094', '0', '1.06', '1.06', '1499864705', '1499864766', '0.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:05:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('409', '19870907', '1332344250', '0', '1.06', '1.06', '1499865445', '1499865506', '3.75', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:17:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('410', '19870907', '1332344251', '1', '1.06', '1.06', '1499865446', '1499865506', '-5.00', 'AUDNZD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:17:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('411', '19870907', '1332344254', '1', '130.03', '130.01', '1499865493', '1499865553', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:18:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('412', '19870907', '1332344322', '1', '87.75', '87.75', '1499865646', '1499865706', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:20:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('413', '19870907', '1332344323', '1', '87.75', '87.75', '1499865646', '1499865706', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:20:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('414', '19870907', '1332344324', '1', '87.75', '87.75', '1499865646', '1499865706', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:20:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('415', '19870907', '1332344325', '1', '87.75', '87.75', '1499865646', '1499865706', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:20:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('416', '19870907', '1332344326', '0', '87.75', '87.75', '1499865647', '1499865707', '-5.00', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:20:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('417', '19870907', '1332344327', '0', '87.75', '87.75', '1499865647', '1499865707', '-5.00', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:20:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('418', '19870907', '1332344408', '0', '130.04', '130.04', '1499867298', '1499867358', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:48:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('419', '19870907', '1332344409', '0', '130.04', '130.04', '1499867298', '1499867358', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:48:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('420', '19870907', '1332344410', '0', '130.04', '130.04', '1499867298', '1499867358', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:48:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('421', '19870907', '1332344411', '1', '130.04', '130.04', '1499867299', '1499867360', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 13:48:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('422', '19870907', '1332344492', '0', '0.76', '0.76', '1499869436', '1499869496', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 14:23:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('423', '19870907', '1332344493', '1', '0.76', '0.76', '1499869438', '1499869498', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 14:23:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('424', '19870907', '1332344583', '0', '1.10', '1.10', '1499871967', '1499872028', '-5.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('425', '19870907', '1332344584', '1', '1.10', '1.10', '1499871968', '1499872028', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('426', '19870907', '1332344585', '1', '1.10', '1.10', '1499871968', '1499872028', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('427', '19870907', '1332344586', '1', '1.10', '1.10', '1499871968', '1499872028', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('428', '19870907', '1332344587', '1', '1.10', '1.10', '1499871968', '1499872028', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('429', '19870907', '1332344588', '1', '1.10', '1.10', '1499871969', '1499872029', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('430', '19870907', '1332344589', '1', '1.10', '1.10', '1499871969', '1499872029', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('431', '19870907', '1332344590', '1', '1.10', '1.10', '1499871971', '1499872032', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('432', '19870907', '1332344591', '1', '1.10', '1.10', '1499871972', '1499872032', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('433', '19870907', '1332344592', '1', '1.10', '1.10', '1499871972', '1499872032', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('434', '19870907', '1332344593', '1', '1.10', '1.10', '1499871972', '1499872032', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('435', '19870907', '1332344594', '1', '1.10', '1.10', '1499871972', '1499872032', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:06:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('436', '19870907', '1332344601', '0', '1.24', '1.24', '1499872069', '1499872129', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('437', '19870907', '1332344602', '0', '1.24', '1.24', '1499872070', '1499872131', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('438', '19870907', '1332344603', '0', '1.24', '1.24', '1499872070', '1499872131', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('439', '19870907', '1332344604', '0', '1.24', '1.24', '1499872070', '1499872131', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('440', '19870907', '1332344605', '0', '1.24', '1.24', '1499872070', '1499872131', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('441', '19870907', '1332344606', '0', '1.24', '1.24', '1499872070', '1499872131', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('442', '19870907', '1332344607', '1', '1.24', '1.24', '1499872071', '1499872131', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('443', '19870907', '1332344608', '1', '1.24', '1.24', '1499872072', '1499872132', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('444', '19870907', '1332344609', '1', '1.24', '1.24', '1499872072', '1499872132', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:07:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('445', '19870907', '1332344618', '0', '87.49', '87.51', '1499872238', '1499872299', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:10:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('446', '19870907', '1332344619', '0', '87.49', '87.51', '1499872238', '1499872299', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:10:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('447', '19870907', '1332344620', '0', '87.49', '87.51', '1499872239', '1499872299', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:10:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('448', '19870907', '1332344631', '1', '0.89', '0.89', '1499872880', '1499872940', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:21:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('449', '19870907', '1332344632', '1', '0.89', '0.89', '1499872881', '1499872942', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:21:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('450', '19870907', '1332344633', '1', '0.89', '0.89', '1499872881', '1499872942', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-12 15:21:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('451', '19870907', '1332349510', '0', '129.43', '129.40', '1499918769', '1499918829', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:06:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('452', '19870907', '1332349511', '1', '129.43', '129.40', '1499918770', '1499918830', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:06:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('453', '19870907', '1332349520', '0', '129.44', '129.40', '1499918777', '1499918837', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:06:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('454', '19870907', '1332349525', '1', '129.42', '129.39', '1499918788', '1499918852', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:06:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('455', '19870907', '1332349526', '1', '129.42', '129.39', '1499918788', '1499918853', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:06:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('456', '19870907', '1332349527', '1', '129.42', '129.39', '1499918788', '1499918853', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:06:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('457', '19870907', '1332350067', '0', '129.39', '129.40', '1499919556', '1499919616', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:19:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('458', '19870907', '1332350114', '0', '129.39', '129.38', '1499919612', '1499919672', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:20:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('459', '19870907', '1332350127', '0', '129.40', '129.38', '1499919629', '1499919690', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:20:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('460', '19870907', '1332350130', '0', '129.39', '129.38', '1499919630', '1499919690', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:20:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('461', '19870907', '1332350184', '0', '129.39', '129.38', '1499919635', '1499919696', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:20:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('462', '19870907', '1332350192', '1', '129.39', '129.38', '1499919638', '1499919698', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:20:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('463', '19870907', '1332350193', '1', '129.39', '129.38', '1499919641', '1499919701', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:20:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('464', '19870907', '1332350215', '0', '129.38', '129.38', '1499919669', '1499919729', '-10.00', 'EURJPY', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:21:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('465', '19870907', '1332350288', '1', '129.38', '129.38', '1499919753', '1499919813', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:22:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('466', '19870907', '1332350293', '1', '129.38', '129.38', '1499919754', '1499919814', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:22:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('467', '19870907', '1332350294', '0', '129.38', '129.38', '1499919755', '1499919816', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:22:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('468', '19870907', '1332350319', '1', '0.77', '0.77', '1499919791', '1499919852', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:23:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('469', '19870907', '1332350637', '0', '88.79', '88.80', '1499920225', '1499920285', '3.75', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:30:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('470', '19870907', '1332350642', '1', '88.79', '88.80', '1499920226', '1499920286', '-5.00', 'CADJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 04:30:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('471', '19870907', '1332352318', '1', '0.89', '0.89', '1499922907', '1499922968', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:15:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('472', '19870907', '1332352319', '0', '0.89', '0.89', '1499922908', '1499922968', '0.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:15:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('473', '19870907', '1332352320', '0', '0.89', '0.89', '1499922909', '1499922969', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:15:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('474', '19870907', '1332352321', '0', '0.89', '0.89', '1499922909', '1499922969', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:15:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('475', '19870907', '1332352322', '0', '0.89', '0.89', '1499922912', '1499922972', '-100.00', 'EURGBP', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:15:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('476', '19870907', '1332352323', '0', '0.89', '0.89', '1499922913', '1499922974', '0.00', 'EURGBP', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:15:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('477', '19870907', '1332352427', '0', '129.20', '129.19', '1499923073', '1499923133', '-100.00', 'EURJPY', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:17:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('478', '19870907', '1332352905', '0', '145.67', '145.66', '1499924264', '1499924325', '-5.00', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:37:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('479', '19870907', '1332352906', '1', '145.67', '145.66', '1499924265', '1499924325', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:37:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('480', '19870907', '1332352907', '1', '145.67', '145.66', '1499924265', '1499924325', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:37:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('481', '19870907', '1332352908', '1', '145.67', '145.66', '1499924265', '1499924326', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:37:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('482', '19870907', '1332352912', '0', '1.27', '1.27', '1499924271', '1499924331', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:37:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('483', '19870907', '1332352913', '0', '1.27', '1.27', '1499924272', '1499924332', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:37:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('484', '19870907', '1332352914', '0', '1.27', '1.27', '1499924272', '1499924332', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:37:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('485', '19870907', '1332352916', '1', '1.27', '1.27', '1499924272', '1499924332', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 05:37:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('486', '19870907', '1332355175', '1', '129.35', '129.33', '1499932107', '1499932169', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:48:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('487', '19870907', '1332355176', '0', '129.35', '129.33', '1499932109', '1499932170', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:48:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('488', '19870907', '1332355177', '0', '129.35', '129.33', '1499932109', '1499932170', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:48:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('489', '19870907', '1332355178', '0', '129.35', '129.33', '1499932109', '1499932170', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:48:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('490', '19870907', '1332355179', '0', '129.35', '129.33', '1499932109', '1499932170', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:48:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('491', '19870907', '1332355193', '0', '129.30', '129.30', '1499932236', '1499932296', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:50:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('492', '19870907', '1332355206', '1', '129.30', '129.29', '1499932273', '1499932333', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:51:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('493', '19870907', '1332355207', '0', '129.30', '129.29', '1499932273', '1499932333', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:51:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('494', '19870907', '1332355237', '0', '129.28', '129.30', '1499932369', '1499932430', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:52:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('495', '19870907', '1332355277', '0', '129.39', '129.37', '1499932624', '1499932698', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:57:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('496', '19870907', '1332355278', '1', '129.39', '129.37', '1499932626', '1499932698', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:57:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('497', '19870907', '1332355279', '1', '129.39', '129.37', '1499932627', '1499932698', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:57:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('498', '19870907', '1332355280', '1', '129.39', '129.37', '1499932628', '1499932698', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 07:57:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('499', '19870907', '1332355571', '0', '129.34', '129.34', '1499934063', '1499934123', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 08:21:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('500', '19870907', '1332355572', '1', '129.34', '129.34', '1499934064', '1499934125', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 08:21:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('501', '19870907', '1332355573', '1', '0.77', '0.77', '1499934069', '1499934129', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 08:21:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('502', '19870907', '1332356192', '0', '113.11', '113.11', '1499937137', '1499937197', '0.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:12:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('503', '19870907', '1332356193', '0', '113.11', '113.11', '1499937138', '1499937198', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:12:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('504', '19870907', '1332356194', '1', '113.11', '113.11', '1499937139', '1499937202', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:12:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('505', '19870907', '1332356219', '0', '0.88', '0.88', '1499937412', '1499937472', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:16:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('506', '19870907', '1332356220', '0', '0.88', '0.88', '1499937412', '1499937472', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:16:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('507', '19870907', '1332356221', '1', '0.88', '0.88', '1499937412', '1499937472', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:16:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('508', '19870907', '1332356222', '1', '0.88', '0.88', '1499937412', '1499937472', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:16:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('509', '19870907', '1332356231', '0', '1.10', '1.10', '1499937444', '1499937504', '-5.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:17:24', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('510', '19870907', '1332356232', '0', '1.10', '1.10', '1499937446', '1499937506', '-5.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:17:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('511', '19870907', '1332356234', '0', '0.88', '0.88', '1499937450', '1499937510', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:17:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('512', '19870907', '1332356235', '0', '0.88', '0.88', '1499937450', '1499937511', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:17:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('513', '19870907', '1332356236', '1', '0.88', '0.88', '1499937450', '1499937511', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:17:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('514', '19870907', '1332356261', '0', '0.88', '0.88', '1499937545', '1499937606', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:19:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('515', '19870907', '1332356262', '0', '0.88', '0.88', '1499937545', '1499937606', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:19:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('516', '19870907', '1332356264', '0', '0.88', '0.88', '1499937545', '1499937606', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:19:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('517', '19870907', '1332356265', '1', '0.88', '0.88', '1499937546', '1499937606', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:19:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('518', '19870907', '1332356266', '1', '0.88', '0.88', '1499937546', '1499937606', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:19:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('519', '19870907', '1332356267', '1', '0.88', '0.88', '1499937546', '1499937606', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:19:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('520', '19870907', '1332356268', '1', '0.88', '0.88', '1499937546', '1499937606', '3.75', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 09:19:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('521', '19870907', '1332357130', '0', '0.77', '0.77', '1499943618', '1499943679', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:00:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('522', '19870907', '1332357131', '0', '0.77', '0.77', '1499943623', '1499947223', '4.25', 'AUDUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-13 11:00:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('523', '19870907', '1332357132', '0', '0.77', '0.77', '1499943623', '1499947223', '4.25', 'AUDUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-13 11:00:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('524', '19870907', '1332357133', '0', '0.77', '0.77', '1499943623', '1499947223', '4.25', 'AUDUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-13 11:00:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('525', '19870907', '1332357134', '0', '0.77', '0.77', '1499943623', '1499947223', '4.25', 'AUDUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-13 11:00:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('526', '19870907', '1332357135', '0', '0.77', '0.77', '1499943624', '1499947224', '4.25', 'AUDUSD', 'BO:$5,60m|85', '0.00', '1500280517', null, null, '1', '2017-07-13 11:00:24', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('527', '19870907', '1332357304', '0', '1.29', '1.29', '1499944419', '1499944479', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:13:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('528', '19870907', '1332357307', '0', '1.29', '1.29', '1499944420', '1499944481', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:13:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('529', '19870907', '1332357309', '0', '1.29', '1.29', '1499944424', '1499944484', '-100.00', 'GBPUSD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:13:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('530', '19870907', '1332357311', '0', '1.29', '1.29', '1499944425', '1499944485', '-100.00', 'GBPUSD', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:13:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('531', '19870907', '1332357330', '0', '1.29', '1.29', '1499944525', '1499944585', '-10.00', 'GBPUSD', 'BO:$10,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:15:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('532', '19870907', '1332357402', '0', '1.29', '1.29', '1499945307', '1499945367', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:28:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('533', '19870907', '1332357404', '1', '1.29', '1.29', '1499945307', '1499945367', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:28:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('534', '19870907', '1332357482', '0', '1.29', '1.29', '1499946214', '1499946274', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:43:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('535', '19870907', '1332357483', '0', '1.29', '1.29', '1499946215', '1499946275', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:43:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('536', '19870907', '1332357484', '0', '1.29', '1.29', '1499946215', '1499946275', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 11:43:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('537', '19870907', '1332357940', '0', '0.77', '0.77', '1499952056', '1499952116', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:20:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('538', '19870907', '1332357941', '0', '0.77', '0.77', '1499952057', '1499952118', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:20:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('539', '19870907', '1332357942', '1', '0.77', '0.77', '1499952057', '1499952118', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:20:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('540', '19870907', '1332357943', '1', '0.77', '0.77', '1499952058', '1499952118', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:20:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('541', '19870907', '1332357944', '0', '0.77', '0.77', '1499952059', '1499952121', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:20:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('542', '19870907', '1332357946', '0', '1.29', '1.29', '1499952061', '1499952121', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('543', '19870907', '1332357947', '0', '1.29', '1.29', '1499952061', '1499952121', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('544', '19870907', '1332357948', '0', '1.29', '1.29', '1499952062', '1499952122', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('545', '19870907', '1332357949', '1', '1.29', '1.29', '1499952062', '1499952122', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('546', '19870907', '1332357951', '0', '0.77', '0.77', '1499952076', '1499952136', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('547', '19870907', '1332357952', '0', '0.77', '0.77', '1499952077', '1499952137', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('548', '19870907', '1332357953', '0', '0.77', '0.77', '1499952077', '1499952137', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('549', '19870907', '1332357954', '0', '0.77', '0.77', '1499952077', '1499952137', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('550', '19870907', '1332357955', '0', '0.77', '0.77', '1499952077', '1499952137', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('551', '19870907', '1332357961', '0', '0.77', '0.77', '1499952118', '1499952178', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('552', '19870907', '1332357962', '0', '0.77', '0.77', '1499952119', '1499952180', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:21:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('553', '19870907', '1332357971', '1', '0.77', '0.77', '1499952181', '1499952242', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:23:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('554', '19870907', '1332357972', '1', '0.77', '0.77', '1499952181', '1499952242', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:23:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('555', '19870907', '1332357973', '1', '0.77', '0.77', '1499952182', '1499952242', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:23:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('556', '19870907', '1332357974', '1', '0.77', '0.77', '1499952182', '1499952242', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:23:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('557', '19870907', '1332357975', '1', '0.77', '0.77', '1499952182', '1499952242', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:23:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('558', '19870907', '1332357976', '1', '0.77', '0.77', '1499952182', '1499952242', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:23:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('559', '19870907', '1332357977', '1', '0.77', '0.77', '1499952182', '1499952242', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:23:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('560', '19870907', '1332357994', '0', '1.14', '1.14', '1499952433', '1499952493', '-5.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:27:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('561', '19870907', '1332357995', '1', '1.14', '1.14', '1499952435', '1499952495', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:27:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('562', '19870907', '1332357996', '1', '1.14', '1.14', '1499952435', '1499952495', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:27:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('563', '19870907', '1332357997', '1', '1.14', '1.14', '1499952436', '1499952496', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:27:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('564', '19870907', '1332357998', '1', '1.14', '1.14', '1499952436', '1499952496', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:27:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('565', '19870907', '1332357999', '1', '1.14', '1.14', '1499952436', '1499952496', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:27:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('566', '19870907', '1332358000', '1', '1.14', '1.14', '1499952436', '1499952496', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 13:27:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('567', '19870907', '1332358141', '0', '1.28', '1.28', '1499954858', '1499954919', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 14:07:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('568', '19870907', '1332358142', '0', '1.28', '1.28', '1499954858', '1499954919', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 14:07:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('569', '19870907', '1332358143', '0', '1.28', '1.28', '1499954858', '1499954919', '3.75', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 14:07:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('570', '19870907', '1332358144', '1', '1.28', '1.28', '1499954859', '1499954919', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 14:07:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('571', '19870907', '1332358145', '1', '1.28', '1.28', '1499954859', '1499954919', '-5.00', 'USDCAD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 14:07:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('572', '19870907', '1332358146', '0', '1.28', '1.28', '1499954861', '1499954922', '37.50', 'USDCAD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 14:07:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('573', '19870907', '1332358178', '0', '1.29', '1.29', '1499955797', '1499955857', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-13 14:23:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('574', '19870907', '1332358763', '0', '1.25', '1.25', '1499999900', '1499999961', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('575', '19870907', '1332358766', '0', '1.25', '1.25', '1499999900', '1499999961', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('576', '19870907', '1332358767', '1', '1.25', '1.25', '1499999900', '1499999961', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('577', '19870907', '1332358768', '1', '1.25', '1.25', '1499999900', '1499999961', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('578', '19870907', '1332358769', '1', '1.25', '1.25', '1499999900', '1499999961', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('579', '19870907', '1332358770', '1', '1.25', '1.25', '1499999900', '1499999961', '-5.00', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('580', '19870907', '1332358777', '0', '1.25', '1.25', '1499999903', '1499999964', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('581', '19870907', '1332358778', '0', '1.25', '1.25', '1499999904', '1499999964', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:24', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('582', '19870907', '1332358779', '0', '1.25', '1.25', '1499999905', '1499999965', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 02:38:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('583', '19870907', '1332360923', '0', '0.77', '0.77', '1500002913', '1500002973', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:28:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('584', '19870907', '1332360924', '1', '0.77', '0.77', '1500002914', '1500002975', '0.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:28:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('585', '19870907', '1332360939', '1', '113.53', '113.54', '1500002961', '1500003022', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:29:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('586', '19870907', '1332360940', '1', '113.53', '113.54', '1500002961', '1500003022', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:29:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('587', '19870907', '1332360941', '0', '113.53', '113.54', '1500002962', '1500003022', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:29:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('588', '19870907', '1332360942', '0', '113.53', '113.54', '1500002962', '1500003022', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:29:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('589', '19870907', '1332360943', '0', '113.53', '113.54', '1500002965', '1500003025', '75.00', 'USDJPY', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:29:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('590', '19870907', '1332360968', '0', '1.10', '1.10', '1500003122', '1500003182', '-100.00', 'EURCHF', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:32:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('591', '19870907', '1332360969', '0', '1.10', '1.10', '1500003123', '1500003184', '-100.00', 'EURCHF', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 03:32:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('592', '19870907', '1332362558', '0', '1.25', '1.25', '1500005802', '1500005862', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:16:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('593', '19870907', '1332362559', '0', '1.25', '1.25', '1500005802', '1500005862', '3.75', 'GBPCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:16:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('594', '19870907', '1332362611', '0', '146.81', '146.81', '1500005901', '1500005962', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:18:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('595', '19870907', '1332362612', '0', '146.81', '146.81', '1500005902', '1500005962', '3.75', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:18:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('596', '19870907', '1332362613', '1', '146.81', '146.81', '1500005902', '1500005962', '-5.00', 'GBPJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:18:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('597', '19870907', '1332362985', '0', '0.88', '0.88', '1500006511', '1500006572', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:28:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('598', '19870907', '1332362986', '0', '0.88', '0.88', '1500006511', '1500006572', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:28:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('599', '19870907', '1332362987', '0', '0.88', '0.88', '1500006511', '1500006572', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:28:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('600', '19870907', '1332362988', '0', '0.88', '0.88', '1500006511', '1500006572', '-5.00', 'EURGBP', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:28:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('601', '19870907', '1332363629', '0', '1.10', '1.10', '1500007806', '1500007866', '0.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('602', '19870907', '1332363630', '0', '1.10', '1.10', '1500007806', '1500007866', '0.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('603', '19870907', '1332363631', '0', '1.10', '1.10', '1500007806', '1500007866', '0.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('604', '19870907', '1332363632', '0', '1.10', '1.10', '1500007806', '1500007866', '3.75', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('605', '19870907', '1332363633', '0', '1.10', '1.10', '1500007806', '1500007866', '0.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('606', '19870907', '1332363634', '0', '1.10', '1.10', '1500007806', '1500007866', '0.00', 'EURCHF', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('607', '19870907', '1332363656', '0', '1.10', '1.10', '1500007832', '1500007893', '15.00', 'EURCHF', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('608', '19870907', '1332363657', '0', '1.10', '1.10', '1500007832', '1500007893', '15.00', 'EURCHF', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('609', '19870907', '1332363661', '0', '1.10', '1.10', '1500007835', '1500007896', '75.00', 'EURCHF', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('610', '19870907', '1332363663', '0', '1.10', '1.10', '1500007835', '1500007896', '75.00', 'EURCHF', 'BO:$100,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 04:50:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('611', '19870907', '1332364879', '0', '129.42', '129.42', '1500010433', '1500010494', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:33:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('612', '19870907', '1332364881', '0', '129.42', '129.42', '1500010433', '1500010494', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:33:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('613', '19870907', '1332364886', '0', '129.42', '129.42', '1500010445', '1500010505', '3.75', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('614', '19870907', '1332364887', '1', '129.42', '129.42', '1500010446', '1500010506', '-5.00', 'EURJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('615', '19870907', '1332364889', '1', '129.42', '129.42', '1500010447', '1500010508', '-200.00', 'EURJPY', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('616', '19870907', '1332364891', '1', '129.42', '129.42', '1500010447', '1500010508', '-200.00', 'EURJPY', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('617', '19870907', '1332364892', '0', '129.42', '129.42', '1500010448', '1500010508', '150.00', 'EURJPY', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('618', '19870907', '1332364895', '1', '129.42', '129.42', '1500010451', '1500010514', '150.00', 'EURJPY', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('619', '19870907', '1332364897', '1', '1.56', '1.56', '1500010458', '1500010518', '150.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('620', '19870907', '1332364901', '1', '1.56', '1.56', '1500010458', '1500010518', '150.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('621', '19870907', '1332364902', '1', '1.56', '1.56', '1500010458', '1500010518', '150.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('622', '19870907', '1332364903', '1', '1.56', '1.56', '1500010458', '1500010518', '150.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('623', '19870907', '1332364904', '1', '1.56', '1.56', '1500010458', '1500010518', '150.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('624', '19870907', '1332364905', '1', '1.56', '1.56', '1500010458', '1500010518', '150.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('625', '19870907', '1332364906', '0', '1.56', '1.56', '1500010463', '1500010524', '-200.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('626', '19870907', '1332364907', '0', '1.56', '1.56', '1500010464', '1500010524', '-200.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:24', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('627', '19870907', '1332364908', '0', '1.56', '1.56', '1500010465', '1500010526', '0.00', 'EURNZD', 'BO:$200,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('628', '19870907', '1332364911', '0', '1.56', '1.56', '1500010471', '1500010532', '-50.00', 'EURNZD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('629', '19870907', '1332364912', '0', '1.56', '1.56', '1500010471', '1500010532', '0.00', 'EURNZD', 'BO:$50,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:34:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('630', '19870907', '1332365044', '0', '113.42', '113.41', '1500010775', '1500010836', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:39:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('631', '19870907', '1332365045', '0', '113.42', '113.41', '1500010776', '1500010836', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:39:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('632', '19870907', '1332365046', '0', '113.42', '113.41', '1500010776', '1500010836', '-5.00', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:39:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('633', '19870907', '1332365047', '1', '113.42', '113.41', '1500010777', '1500010837', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:39:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('634', '19870907', '1332365048', '1', '113.42', '113.41', '1500010777', '1500010837', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 05:39:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('635', '19870907', '1332365868', '0', '1.14', '1.14', '1500013219', '1500013280', '0.00', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 06:20:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('636', '19870907', '1332365869', '1', '1.14', '1.14', '1500013220', '1500013280', '3.75', 'EURUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 06:20:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('637', '19870907', '1332367017', '0', '1.30', '1.30', '1500018029', '1500018089', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 07:40:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('638', '19870907', '1332367018', '1', '1.30', '1.30', '1500018030', '1500018090', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 07:40:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('639', '19870907', '1332367075', '0', '1.30', '1.30', '1500018195', '1500018255', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 07:43:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('640', '19870907', '1332367133', '0', '1.30', '1.30', '1500018492', '1500018552', '0.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 07:48:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('641', '19870907', '1332367134', '0', '1.30', '1.30', '1500018492', '1500018552', '0.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 07:48:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('642', '19870907', '1332367641', '1', '113.27', '113.26', '1500020906', '1500020967', '3.75', 'USDJPY', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 08:28:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('643', '19870907', '1332370070', '0', '0.78', '0.78', '1500036896', '1500036957', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:54:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('644', '19870907', '1332370071', '0', '0.78', '0.78', '1500036896', '1500036957', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:54:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('645', '19870907', '1332370072', '0', '0.78', '0.78', '1500036897', '1500036957', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:54:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('646', '19870907', '1332370074', '1', '0.78', '0.78', '1500036901', '1500036964', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:55:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('647', '19870907', '1332370075', '1', '0.78', '0.78', '1500036902', '1500036964', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:55:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('648', '19870907', '1332370076', '1', '0.78', '0.78', '1500036904', '1500036964', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:55:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('649', '19870907', '1332370077', '0', '0.78', '0.78', '1500036905', '1500036966', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:55:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('650', '19870907', '1332370078', '0', '0.78', '0.78', '1500036907', '1500036968', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:55:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('651', '19870907', '1332370079', '1', '0.78', '0.78', '1500036908', '1500036968', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 12:55:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('652', '19870907', '1332370250', '0', '0.78', '0.78', '1500037699', '1500037759', '-5.00', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 13:08:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('653', '19870907', '1332370251', '1', '0.78', '0.78', '1500037700', '1500037760', '3.75', 'AUDUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 13:08:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('654', '19870907', '1332370573', '1', '1.30', '1.30', '1500039984', '1500040044', '-5.00', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 13:46:24', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('655', '19870907', '1332370574', '0', '1.30', '1.30', '1500039985', '1500040045', '3.75', 'GBPUSD', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-14 13:46:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('656', '19870907', '1332372266', '0', '0.78', '0.78', '1500276195', '1500276255', '-5.00', 'AUDUSDbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:23:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('657', '19870907', '1332372267', '0', '0.78', '0.78', '1500276196', '1500276256', '-5.00', 'AUDUSDbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:23:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('658', '19870907', '1332372268', '0', '0.78', '0.78', '1500276197', '1500276257', '-5.00', 'AUDUSDbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:23:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('659', '19870907', '1332372269', '0', '0.78', '0.78', '1500276197', '1500276257', '-5.00', 'AUDUSDbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:23:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('660', '19870907', '1332372270', '0', '0.78', '0.78', '1500276197', '1500276257', '-5.00', 'AUDUSDbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:23:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('661', '19870907', '1332372276', '0', '1.31', '1.31', '1500276414', '1500276474', '-5.00', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:26:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('662', '19870907', '1332372277', '0', '1.31', '1.31', '1500276414', '1500276474', '-5.00', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:26:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('663', '19870907', '1332372278', '0', '88.03', '88.03', '1500276500', '1500276560', '-5.00', 'AUDJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:28:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('664', '19870907', '1332372279', '0', '88.03', '88.03', '1500276501', '1500276561', '-5.00', 'AUDJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:28:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('665', '19870907', '1332372282', '0', '147.40', '147.42', '1500276737', '1500276797', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('666', '19870907', '1332372283', '0', '147.40', '147.42', '1500276738', '1500276798', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('667', '19870907', '1332372284', '0', '147.40', '147.42', '1500276738', '1500276798', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('668', '19870907', '1332372286', '0', '147.40', '147.42', '1500276738', '1500276798', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('669', '19870907', '1332372289', '0', '147.40', '147.42', '1500276740', '1500276800', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('670', '19870907', '1332372290', '0', '147.40', '147.42', '1500276740', '1500276800', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('671', '19870907', '1332372291', '0', '147.40', '147.42', '1500276740', '1500276800', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('672', '19870907', '1332372295', '0', '147.42', '147.43', '1500276767', '1500276827', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('673', '19870907', '1332372296', '0', '147.42', '147.43', '1500276768', '1500276828', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('674', '19870907', '1332372297', '0', '147.42', '147.43', '1500276768', '1500276828', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('675', '19870907', '1332372298', '0', '147.42', '147.43', '1500276768', '1500276828', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('676', '19870907', '1332372299', '0', '147.42', '147.43', '1500276768', '1500276828', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('677', '19870907', '1332372300', '0', '147.42', '147.43', '1500276769', '1500276829', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('678', '19870907', '1332372301', '0', '147.42', '147.43', '1500276769', '1500276829', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('679', '19870907', '1332372302', '0', '147.42', '147.43', '1500276769', '1500276829', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('680', '19870907', '1332372303', '0', '147.42', '147.43', '1500276769', '1500276829', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('681', '19870907', '1332372304', '0', '147.42', '147.43', '1500276769', '1500276829', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('682', '19870907', '1332372305', '0', '147.42', '147.42', '1500276770', '1500276830', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('683', '19870907', '1332372306', '0', '147.42', '147.42', '1500276770', '1500276830', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('684', '19870907', '1332372307', '0', '147.42', '147.42', '1500276770', '1500276830', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('685', '19870907', '1332372308', '0', '147.42', '147.42', '1500276770', '1500276830', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('686', '19870907', '1332372309', '0', '147.42', '147.42', '1500276770', '1500276830', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('687', '19870907', '1332372310', '0', '147.42', '147.42', '1500276771', '1500276831', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('688', '19870907', '1332372311', '0', '147.42', '147.42', '1500276771', '1500276831', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('689', '19870907', '1332372312', '0', '147.42', '147.42', '1500276771', '1500276831', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('690', '19870907', '1332372313', '0', '147.42', '147.42', '1500276771', '1500276831', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('691', '19870907', '1332372314', '0', '147.42', '147.42', '1500276771', '1500276831', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('692', '19870907', '1332372315', '0', '147.42', '147.42', '1500276772', '1500276832', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('693', '19870907', '1332372316', '0', '147.42', '147.42', '1500276772', '1500276832', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('694', '19870907', '1332372317', '0', '147.42', '147.42', '1500276772', '1500276832', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('695', '19870907', '1332372318', '0', '147.42', '147.42', '1500276772', '1500276832', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('696', '19870907', '1332372319', '0', '147.42', '147.42', '1500276772', '1500276832', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('697', '19870907', '1332372320', '0', '147.42', '147.42', '1500276772', '1500276832', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('698', '19870907', '1332372321', '0', '147.42', '147.42', '1500276773', '1500276833', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('699', '19870907', '1332372322', '0', '147.42', '147.42', '1500276773', '1500276833', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('700', '19870907', '1332372323', '0', '147.42', '147.42', '1500276773', '1500276833', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('701', '19870907', '1332372324', '0', '147.42', '147.42', '1500276773', '1500276833', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:32:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('702', '19870907', '1332372327', '0', '147.42', '147.42', '1500276788', '1500276848', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:08', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('703', '19870907', '1332372328', '0', '147.42', '147.42', '1500276789', '1500276849', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('704', '19870907', '1332372329', '0', '147.42', '147.42', '1500276789', '1500276849', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('705', '19870907', '1332372330', '0', '147.42', '147.42', '1500276789', '1500276849', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('706', '19870907', '1332372331', '0', '147.42', '147.42', '1500276789', '1500276849', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('707', '19870907', '1332372332', '0', '147.42', '147.42', '1500276789', '1500276849', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('708', '19870907', '1332372333', '0', '147.42', '147.42', '1500276789', '1500276849', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('709', '19870907', '1332372334', '0', '147.42', '147.42', '1500276790', '1500276850', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('710', '19870907', '1332372335', '0', '147.42', '147.42', '1500276790', '1500276850', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('711', '19870907', '1332372336', '0', '147.42', '147.42', '1500276790', '1500276850', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('712', '19870907', '1332372337', '0', '147.42', '147.42', '1500276790', '1500276850', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('713', '19870907', '1332372341', '0', '147.42', '147.42', '1500276791', '1500276851', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('714', '19870907', '1332372342', '0', '147.42', '147.42', '1500276791', '1500276851', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('715', '19870907', '1332372343', '0', '147.42', '147.42', '1500276791', '1500276851', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('716', '19870907', '1332372344', '0', '147.42', '147.42', '1500276791', '1500276851', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:11', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('717', '19870907', '1332372348', '0', '147.42', '147.41', '1500276793', '1500276853', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('718', '19870907', '1332372349', '0', '147.42', '147.41', '1500276793', '1500276853', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('719', '19870907', '1332372350', '1', '147.42', '147.42', '1500276793', '1500276853', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('720', '19870907', '1332372351', '1', '147.42', '147.42', '1500276793', '1500276853', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('721', '19870907', '1332372352', '1', '147.42', '147.42', '1500276793', '1500276853', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('722', '19870907', '1332372353', '1', '147.42', '147.42', '1500276793', '1500276853', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('723', '19870907', '1332372355', '0', '147.42', '147.41', '1500276796', '1500276856', '-500.00', 'GBPJPYbo', 'BO:$500,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('724', '19870907', '1332372356', '0', '147.42', '147.42', '1500276798', '1500276858', '-500.00', 'GBPJPYbo', 'BO:$500,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('725', '19870907', '1332372357', '1', '147.42', '147.41', '1500276799', '1500276859', '375.00', 'GBPJPYbo', 'BO:$500,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('726', '19870907', '1332372358', '0', '147.42', '147.42', '1500276805', '1500276865', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('727', '19870907', '1332372359', '1', '147.42', '147.41', '1500276806', '1500276866', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('728', '19870907', '1332372360', '1', '147.42', '147.41', '1500276807', '1500276867', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('729', '19870907', '1332372361', '0', '147.42', '147.42', '1500276807', '1500276867', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:33:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('730', '19870907', '1332372368', '0', '0.96', '0.96', '1500276849', '1500276909', '0.00', 'USDCHFbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:34:09', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('731', '19870907', '1332372369', '0', '0.96', '0.96', '1500276852', '1500276912', '-20.00', 'USDCHFbo', 'BO:$20,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:34:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('732', '19870907', '1332372400', '0', '147.36', '147.37', '1500278032', '1500278092', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('733', '19870907', '1332372401', '0', '147.36', '147.37', '1500278032', '1500278092', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('734', '19870907', '1332372402', '0', '147.36', '147.37', '1500278032', '1500278092', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('735', '19870907', '1332372403', '0', '147.36', '147.37', '1500278033', '1500278093', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('736', '19870907', '1332372404', '0', '147.36', '147.37', '1500278033', '1500278093', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('737', '19870907', '1332372405', '0', '147.36', '147.37', '1500278033', '1500278093', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('738', '19870907', '1332372406', '0', '147.36', '147.37', '1500278033', '1500278093', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('739', '19870907', '1332372407', '0', '147.36', '147.37', '1500278033', '1500278093', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('740', '19870907', '1332372408', '0', '147.36', '147.37', '1500278034', '1500278094', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('741', '19870907', '1332372409', '0', '147.36', '147.37', '1500278034', '1500278094', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 07:53:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('742', '19870907', '1332372438', '1', '147.37', '147.37', '1500278542', '1500278602', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 08:02:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('743', '19870907', '1332372439', '1', '147.37', '147.37', '1500278542', '1500278602', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 08:02:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('744', '19870907', '1332372440', '1', '147.37', '147.37', '1500278542', '1500278602', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 08:02:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('745', '19870907', '1332372441', '1', '147.37', '147.37', '1500278542', '1500278602', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 08:02:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('746', '19870907', '1332372442', '1', '147.37', '147.37', '1500278542', '1500278602', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 08:02:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('747', '19870907', '1332372443', '1', '147.37', '147.37', '1500278543', '1500278603', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 08:02:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('748', '19870907', '1332372444', '1', '147.37', '147.37', '1500278543', '1500278603', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500280517', null, null, '1', '2017-07-17 08:02:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('749', '19870907', '1332382823', '1', '82.52', '82.54', '1500375014', '1500375074', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('750', '19870907', '1332382824', '1', '82.52', '82.54', '1500375014', '1500375074', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('751', '19870907', '1332382825', '1', '82.52', '82.54', '1500375015', '1500375075', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('752', '19870907', '1332382827', '1', '82.52', '82.54', '1500375015', '1500375075', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('753', '19870907', '1332382828', '1', '82.53', '82.54', '1500375015', '1500375075', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('754', '19870907', '1332382829', '1', '82.53', '82.54', '1500375015', '1500375075', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('755', '19870907', '1332382830', '1', '82.53', '82.54', '1500375015', '1500375075', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('756', '19870907', '1332382831', '1', '82.53', '82.54', '1500375016', '1500375076', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('757', '19870907', '1332382832', '1', '82.53', '82.54', '1500375016', '1500375076', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('758', '19870907', '1332382833', '1', '82.53', '82.54', '1500375016', '1500375076', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500375140', null, null, '1', '2017-07-18 10:50:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('759', '19870907', '1332382670', '0', '82.52', '82.51', '1500374943', '1500375843', '-100.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('760', '19870907', '1332382671', '0', '82.52', '82.51', '1500374943', '1500375843', '-100.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('761', '19870907', '1332382672', '0', '82.52', '82.51', '1500374943', '1500375843', '-100.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('762', '19870907', '1332382673', '0', '82.52', '82.51', '1500374943', '1500375843', '-100.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('763', '19870907', '1332382674', '0', '82.52', '82.51', '1500374943', '1500375843', '-100.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('764', '19870907', '1332382675', '0', '82.52', '82.51', '1500374944', '1500375844', '-100.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('765', '19870907', '1332382676', '0', '82.52', '82.51', '1500374944', '1500375844', '-100.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('766', '19870907', '1332382677', '1', '82.52', '82.51', '1500374944', '1500375844', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('767', '19870907', '1332382678', '1', '82.52', '82.51', '1500374945', '1500375845', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('768', '19870907', '1332382679', '1', '82.52', '82.51', '1500374945', '1500375845', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('769', '19870907', '1332382680', '1', '82.52', '82.51', '1500374945', '1500375845', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('770', '19870907', '1332382681', '1', '82.52', '82.51', '1500374945', '1500375845', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('771', '19870907', '1332382682', '1', '82.52', '82.51', '1500374945', '1500375845', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('772', '19870907', '1332382683', '1', '82.52', '82.51', '1500374945', '1500375845', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('773', '19870907', '1332382684', '1', '82.52', '82.51', '1500374945', '1500375845', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('774', '19870907', '1332382685', '1', '82.52', '82.51', '1500374946', '1500375846', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('775', '19870907', '1332382686', '1', '82.52', '82.51', '1500374946', '1500375846', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('776', '19870907', '1332382687', '1', '82.52', '82.51', '1500374946', '1500375846', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('777', '19870907', '1332382688', '1', '82.52', '82.51', '1500374946', '1500375846', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('778', '19870907', '1332382689', '1', '82.52', '82.51', '1500374946', '1500375846', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('779', '19870907', '1332382690', '1', '82.52', '82.51', '1500374947', '1500375847', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('780', '19870907', '1332382691', '1', '82.52', '82.51', '1500374947', '1500375847', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('781', '19870907', '1332382692', '1', '82.52', '82.51', '1500374947', '1500375847', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('782', '19870907', '1332382693', '1', '82.52', '82.51', '1500374947', '1500375847', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('783', '19870907', '1332382694', '1', '82.52', '82.51', '1500374947', '1500375847', '76.00', 'NZDJPYbo', 'BO:$100,15m|76', '0.00', '1500375897', null, null, '1', '2017-07-18 10:49:07', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('784', '19870907', '1332382834', '1', '82.53', '82.51', '1500375030', '1500375930', '4.00', 'NZDJPYbo', 'BO:$5,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('785', '19870907', '1332382835', '1', '82.53', '82.51', '1500375030', '1500375930', '4.00', 'NZDJPYbo', 'BO:$5,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('786', '19870907', '1332382836', '1', '82.53', '82.51', '1500375030', '1500375930', '4.00', 'NZDJPYbo', 'BO:$5,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('787', '19870907', '1332382837', '1', '82.53', '82.51', '1500375030', '1500375930', '4.00', 'NZDJPYbo', 'BO:$5,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('788', '19870907', '1332382838', '1', '82.53', '82.51', '1500375030', '1500375930', '4.00', 'NZDJPYbo', 'BO:$5,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('789', '19870907', '1332382839', '1', '82.53', '82.51', '1500375031', '1500375931', '4.00', 'NZDJPYbo', 'BO:$5,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('790', '19870907', '1332382840', '1', '82.53', '82.51', '1500375031', '1500375931', '4.00', 'NZDJPYbo', 'BO:$5,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('791', '19870907', '1332382841', '1', '82.53', '82.51', '1500375031', '1500375931', '4.00', 'NZDJPYbo', 'BO:$5,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('792', '19870907', '1332382842', '0', '82.53', '82.51', '1500375035', '1500375935', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('793', '19870907', '1332382843', '0', '82.53', '82.51', '1500375035', '1500375935', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('794', '19870907', '1332382844', '0', '82.53', '82.51', '1500375035', '1500375935', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('795', '19870907', '1332382845', '0', '82.53', '82.51', '1500375035', '1500375935', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('796', '19870907', '1332382846', '0', '82.53', '82.51', '1500375035', '1500375935', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('797', '19870907', '1332382847', '0', '82.53', '82.51', '1500375035', '1500375935', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('798', '19870907', '1332382848', '0', '82.53', '82.51', '1500375036', '1500375936', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('799', '19870907', '1332382849', '0', '82.53', '82.51', '1500375036', '1500375936', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('800', '19870907', '1332382850', '0', '82.53', '82.51', '1500375036', '1500375936', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('801', '19870907', '1332382851', '0', '82.53', '82.51', '1500375036', '1500375936', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('802', '19870907', '1332382852', '0', '82.53', '82.51', '1500375036', '1500375936', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('803', '19870907', '1332382853', '0', '82.53', '82.51', '1500375036', '1500375936', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('804', '19870907', '1332382854', '0', '82.53', '82.51', '1500375037', '1500375937', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('805', '19870907', '1332382855', '0', '82.53', '82.51', '1500375037', '1500375937', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('806', '19870907', '1332382856', '0', '82.53', '82.51', '1500375037', '1500375937', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('807', '19870907', '1332382857', '0', '82.53', '82.51', '1500375037', '1500375937', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('808', '19870907', '1332382858', '1', '82.53', '82.53', '1500375039', '1500375939', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('809', '19870907', '1332382859', '1', '82.53', '82.53', '1500375039', '1500375939', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('810', '19870907', '1332382860', '1', '82.53', '82.53', '1500375039', '1500375939', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('811', '19870907', '1332382861', '1', '82.53', '82.53', '1500375039', '1500375939', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('812', '19870907', '1332382862', '1', '82.53', '82.53', '1500375039', '1500375939', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('813', '19870907', '1332382863', '1', '82.53', '82.53', '1500375039', '1500375939', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375940', null, null, '1', '2017-07-18 10:50:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('814', '19870907', '1332382864', '1', '82.54', '82.51', '1500375074', '1500375974', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375974', null, null, '1', '2017-07-18 10:51:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('815', '19870907', '1332382865', '1', '82.54', '82.51', '1500375074', '1500375974', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375974', null, null, '1', '2017-07-18 10:51:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('816', '19870907', '1332382866', '1', '82.54', '82.51', '1500375074', '1500375974', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375974', null, null, '1', '2017-07-18 10:51:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('817', '19870907', '1332382864', '1', '82.54', '82.51', '1500375074', '1500375974', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375976', null, null, '1', '2017-07-18 10:51:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('818', '19870907', '1332382865', '1', '82.54', '82.51', '1500375074', '1500375974', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375976', null, null, '1', '2017-07-18 10:51:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('819', '19870907', '1332382866', '1', '82.54', '82.51', '1500375074', '1500375974', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375976', null, null, '1', '2017-07-18 10:51:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('820', '19870907', '1332382867', '1', '82.54', '82.51', '1500375075', '1500375975', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375976', null, null, '1', '2017-07-18 10:51:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('821', '19870907', '1332382868', '1', '82.54', '82.51', '1500375075', '1500375975', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375976', null, null, '1', '2017-07-18 10:51:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('822', '19870907', '1332382869', '1', '82.54', '82.51', '1500375075', '1500375975', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500375976', null, null, '1', '2017-07-18 10:51:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('823', '19870907', '1332382870', '1', '82.54', '82.51', '1500375091', '1500375991', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('824', '19870907', '1332382871', '1', '82.54', '82.51', '1500375091', '1500375991', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('825', '19870907', '1332382872', '1', '82.54', '82.51', '1500375091', '1500375991', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('826', '19870907', '1332382873', '1', '82.54', '82.51', '1500375091', '1500375991', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('827', '19870907', '1332382874', '1', '82.54', '82.51', '1500375091', '1500375991', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('828', '19870907', '1332382875', '1', '82.54', '82.51', '1500375092', '1500375992', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('829', '19870907', '1332382876', '1', '82.54', '82.51', '1500375092', '1500375992', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('830', '19870907', '1332382877', '1', '82.54', '82.51', '1500375092', '1500375992', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('831', '19870907', '1332382878', '1', '82.54', '82.51', '1500375092', '1500375992', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('832', '19870907', '1332382879', '1', '82.54', '82.51', '1500375092', '1500375992', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('833', '19870907', '1332382880', '1', '82.54', '82.51', '1500375092', '1500375992', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('834', '19870907', '1332382881', '1', '82.54', '82.51', '1500375093', '1500375993', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('835', '19870907', '1332382882', '1', '82.54', '82.51', '1500375093', '1500375993', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('836', '19870907', '1332382883', '1', '82.54', '82.51', '1500375093', '1500375993', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('837', '19870907', '1332382884', '1', '82.54', '82.51', '1500375093', '1500375993', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('838', '19870907', '1332382885', '1', '82.54', '82.51', '1500375093', '1500375993', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('839', '19870907', '1332382886', '1', '82.54', '82.51', '1500375094', '1500375994', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('840', '19870907', '1332382887', '0', '82.54', '82.51', '1500375094', '1500375994', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('841', '19870907', '1332382888', '0', '82.54', '82.51', '1500375094', '1500375994', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('842', '19870907', '1332382889', '0', '82.54', '82.51', '1500375094', '1500375994', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('843', '19870907', '1332382890', '0', '82.54', '82.51', '1500375094', '1500375994', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('844', '19870907', '1332382891', '0', '82.54', '82.51', '1500375095', '1500375995', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('845', '19870907', '1332382892', '0', '82.54', '82.51', '1500375095', '1500375995', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('846', '19870907', '1332382893', '0', '82.54', '82.51', '1500375095', '1500375995', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('847', '19870907', '1332382894', '0', '82.54', '82.51', '1500375095', '1500375995', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('848', '19870907', '1332382895', '0', '82.54', '82.51', '1500375095', '1500375995', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('849', '19870907', '1332382896', '0', '82.54', '82.51', '1500375095', '1500375995', '-80.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('850', '19870907', '1332382897', '1', '82.54', '82.51', '1500375096', '1500375996', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('851', '19870907', '1332382898', '1', '82.54', '82.51', '1500375096', '1500375996', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('852', '19870907', '1332382899', '1', '82.54', '82.51', '1500375097', '1500375997', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('853', '19870907', '1332382900', '1', '82.54', '82.51', '1500375098', '1500375998', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('854', '19870907', '1332382901', '1', '82.54', '82.51', '1500375098', '1500375998', '64.00', 'NZDJPYbo', 'BO:$80,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('855', '19870907', '1332382902', '1', '82.54', '82.51', '1500375099', '1500375999', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('856', '19870907', '1332382903', '1', '82.54', '82.51', '1500375099', '1500375999', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('857', '19870907', '1332382904', '1', '82.54', '82.51', '1500375099', '1500375999', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('858', '19870907', '1332382905', '0', '82.54', '82.51', '1500375101', '1500376001', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('859', '19870907', '1332382906', '0', '82.54', '82.51', '1500375101', '1500376001', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('860', '19870907', '1332382907', '0', '82.54', '82.51', '1500375101', '1500376001', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('861', '19870907', '1332382908', '0', '82.54', '82.51', '1500375101', '1500376001', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('862', '19870907', '1332382909', '0', '82.54', '82.51', '1500375103', '1500376003', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('863', '19870907', '1332382910', '0', '82.54', '82.51', '1500375103', '1500376003', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('864', '19870907', '1332382911', '0', '82.54', '82.51', '1500375103', '1500376003', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('865', '19870907', '1332382912', '0', '82.54', '82.51', '1500375103', '1500376003', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('866', '19870907', '1332382913', '0', '82.54', '82.51', '1500375103', '1500376003', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('867', '19870907', '1332382914', '0', '82.54', '82.51', '1500375104', '1500376004', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('868', '19870907', '1332382915', '0', '82.54', '82.51', '1500375104', '1500376004', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('869', '19870907', '1332382916', '0', '82.54', '82.51', '1500375104', '1500376004', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('870', '19870907', '1332382917', '0', '82.54', '82.51', '1500375104', '1500376004', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('871', '19870907', '1332382918', '0', '82.54', '82.51', '1500375104', '1500376004', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('872', '19870907', '1332382919', '1', '82.54', '82.51', '1500375106', '1500376006', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('873', '19870907', '1332382920', '1', '82.54', '82.51', '1500375106', '1500376006', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('874', '19870907', '1332382921', '1', '82.54', '82.51', '1500375106', '1500376006', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('875', '19870907', '1332382922', '1', '82.54', '82.51', '1500375106', '1500376006', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('876', '19870907', '1332382923', '1', '82.54', '82.51', '1500375106', '1500376006', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:46', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('877', '19870907', '1332382924', '1', '82.54', '82.51', '1500375107', '1500376007', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('878', '19870907', '1332382925', '1', '82.54', '82.51', '1500375107', '1500376007', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('879', '19870907', '1332382926', '1', '82.54', '82.51', '1500375107', '1500376007', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('880', '19870907', '1332382927', '1', '82.54', '82.51', '1500375107', '1500376007', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('881', '19870907', '1332382928', '1', '82.54', '82.51', '1500375107', '1500376007', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('882', '19870907', '1332382929', '1', '82.54', '82.51', '1500375107', '1500376007', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('883', '19870907', '1332382930', '1', '82.54', '82.50', '1500375108', '1500376008', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('884', '19870907', '1332382931', '1', '82.54', '82.50', '1500375108', '1500376008', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('885', '19870907', '1332382932', '1', '82.54', '82.50', '1500375108', '1500376008', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('886', '19870907', '1332382933', '1', '82.54', '82.50', '1500375108', '1500376008', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('887', '19870907', '1332382934', '1', '82.54', '82.50', '1500375108', '1500376008', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('888', '19870907', '1332382935', '1', '82.54', '82.50', '1500375108', '1500376008', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('889', '19870907', '1332382936', '1', '82.54', '82.50', '1500375109', '1500376009', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('890', '19870907', '1332382937', '1', '82.54', '82.50', '1500375109', '1500376009', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('891', '19870907', '1332382938', '1', '82.54', '82.50', '1500375109', '1500376009', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('892', '19870907', '1332382939', '1', '82.54', '82.50', '1500375109', '1500376009', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('893', '19870907', '1332382940', '1', '82.54', '82.50', '1500375109', '1500376009', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('894', '19870907', '1332382941', '1', '82.54', '82.50', '1500375109', '1500376009', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:49', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('895', '19870907', '1332382942', '1', '82.54', '82.50', '1500375110', '1500376010', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('896', '19870907', '1332382943', '1', '82.54', '82.50', '1500375110', '1500376010', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('897', '19870907', '1332382944', '1', '82.54', '82.50', '1500375110', '1500376010', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('898', '19870907', '1332382945', '1', '82.54', '82.50', '1500375110', '1500376010', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('899', '19870907', '1332382946', '1', '82.54', '82.50', '1500375110', '1500376010', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('900', '19870907', '1332382947', '1', '82.54', '82.50', '1500375110', '1500376010', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('901', '19870907', '1332382948', '0', '82.54', '82.50', '1500375111', '1500376011', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('902', '19870907', '1332382949', '0', '82.54', '82.50', '1500375112', '1500376012', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('903', '19870907', '1332382950', '0', '82.54', '82.50', '1500375112', '1500376012', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('904', '19870907', '1332382951', '0', '82.54', '82.50', '1500375112', '1500376012', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('905', '19870907', '1332382952', '0', '82.54', '82.50', '1500375112', '1500376012', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('906', '19870907', '1332382953', '0', '82.54', '82.50', '1500375112', '1500376012', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('907', '19870907', '1332382954', '0', '82.54', '82.50', '1500375112', '1500376012', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('908', '19870907', '1332382955', '0', '82.54', '82.50', '1500375112', '1500376012', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('909', '19870907', '1332382956', '0', '82.54', '82.50', '1500375112', '1500376012', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('910', '19870907', '1332382957', '0', '82.54', '82.50', '1500375113', '1500376013', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('911', '19870907', '1332382958', '0', '82.54', '82.50', '1500375113', '1500376013', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('912', '19870907', '1332382959', '0', '82.54', '82.50', '1500375113', '1500376013', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('913', '19870907', '1332382960', '0', '82.54', '82.50', '1500375113', '1500376013', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('914', '19870907', '1332382961', '0', '82.54', '82.50', '1500375113', '1500376013', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('915', '19870907', '1332382962', '0', '82.54', '82.50', '1500375113', '1500376013', '-50.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376120', null, null, '1', '2017-07-18 10:51:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('916', '19870907', '1332383042', '0', '129.44', '129.46', '1500376010', '1500376070', '3.75', 'EURJPYbo', 'BO:$5,1m|75', '0.00', '1500376120', null, null, '1', '2017-07-18 11:06:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('917', '19870907', '1332383043', '0', '129.44', '129.46', '1500376011', '1500376071', '3.75', 'EURJPYbo', 'BO:$5,1m|75', '0.00', '1500376120', null, null, '1', '2017-07-18 11:06:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('918', '19870907', '1332383044', '0', '129.44', '129.46', '1500376013', '1500376073', '3.75', 'EURJPYbo', 'BO:$5,1m|75', '0.00', '1500376120', null, null, '1', '2017-07-18 11:06:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('919', '19870907', '1332382969', '1', '82.53', '82.52', '1500375422', '1500376322', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500376956', null, null, '1', '2017-07-18 10:57:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('920', '19870907', '1332383045', '0', '0.89', '0.89', '1500376355', '1500376415', '3.75', 'EURGBPbo', 'BO:$5,1m|75', '0.00', '1500376956', null, null, '1', '2017-07-18 11:12:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('921', '19870907', '1332383051', '0', '1236.11', '1236.40', '1500376674', '1500376974', '38.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377319', null, null, '1', '2017-07-18 11:17:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('922', '19870907', '1332383054', '0', '1.30', '1.30', '1500377097', '1500377157', '0.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('923', '19870907', '1332383055', '0', '1.30', '1.30', '1500377098', '1500377158', '-50.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('924', '19870907', '1332383056', '0', '1.30', '1.30', '1500377098', '1500377158', '-50.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('925', '19870907', '1332383057', '0', '1.30', '1.30', '1500377098', '1500377158', '-50.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('926', '19870907', '1332383058', '0', '1.30', '1.30', '1500377099', '1500377159', '-50.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('927', '19870907', '1332383059', '0', '1.30', '1.30', '1500377099', '1500377159', '-50.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('928', '19870907', '1332383060', '0', '1.30', '1.30', '1500377099', '1500377159', '-50.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('929', '19870907', '1332383061', '0', '1.30', '1.30', '1500377099', '1500377159', '-50.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('930', '19870907', '1332383062', '0', '1.30', '1.30', '1500377099', '1500377159', '-50.00', 'GBPUSDbo', 'BO:$50,1m|75', '0.00', '1500377319', null, null, '1', '2017-07-18 11:24:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('931', '19870907', '1332383063', '0', '1.30', '1.30', '1500377102', '1500377402', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('932', '19870907', '1332383064', '0', '1.30', '1.30', '1500377102', '1500377402', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('933', '19870907', '1332383065', '0', '1.30', '1.30', '1500377103', '1500377403', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('934', '19870907', '1332383066', '0', '1.30', '1.30', '1500377103', '1500377403', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('935', '19870907', '1332383067', '0', '1.30', '1.30', '1500377103', '1500377403', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('936', '19870907', '1332383068', '0', '1.30', '1.30', '1500377103', '1500377403', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('937', '19870907', '1332383069', '0', '1.30', '1.30', '1500377103', '1500377403', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('938', '19870907', '1332383070', '0', '1.30', '1.30', '1500377104', '1500377404', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('939', '19870907', '1332383071', '0', '1.30', '1.30', '1500377104', '1500377405', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('940', '19870907', '1332383072', '0', '1.30', '1.30', '1500377104', '1500377405', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('941', '19870907', '1332383073', '0', '1.30', '1.30', '1500377104', '1500377405', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('942', '19870907', '1332383074', '0', '1.30', '1.30', '1500377104', '1500377405', '38.00', 'GBPUSDbo', 'BO:$50,5m|76', '0.00', '1500377409', null, null, '1', '2017-07-18 11:25:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('943', '19870907', '1332383047', '0', '1236.00', '1236.52', '1500376538', '1500377438', '4.00', 'XAUUSDbo', 'BO:$5,15m|80', '0.00', '1500377440', null, null, '1', '2017-07-18 11:15:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('944', '19870907', '1332383048', '0', '1235.99', '1236.57', '1500376539', '1500377439', '4.00', 'XAUUSDbo', 'BO:$5,15m|80', '0.00', '1500377440', null, null, '1', '2017-07-18 11:15:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('945', '19870907', '1332383050', '0', '1236.08', '1236.60', '1500376642', '1500377542', '40.00', 'XAUUSDbo', 'BO:$50,15m|80', '0.00', '1500377972', null, null, '1', '2017-07-18 11:17:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('946', '19870907', '1332383098', '1', '1236.67', '1236.66', '1500377665', '1500377965', '38.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('947', '19870907', '1332383099', '1', '1236.66', '1236.66', '1500377666', '1500377966', '0.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('948', '19870907', '1332383100', '1', '1236.66', '1236.66', '1500377666', '1500377966', '0.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('949', '19870907', '1332383101', '1', '1236.66', '1236.66', '1500377666', '1500377966', '0.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('950', '19870907', '1332383102', '1', '1236.66', '1236.70', '1500377667', '1500377967', '-50.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('951', '19870907', '1332383103', '1', '1236.66', '1236.70', '1500377667', '1500377967', '-50.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('952', '19870907', '1332383104', '1', '1236.66', '1236.70', '1500377667', '1500377967', '-50.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('953', '19870907', '1332383105', '1', '1236.66', '1236.70', '1500377667', '1500377967', '-50.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('954', '19870907', '1332383106', '1', '1236.68', '1236.70', '1500377667', '1500377967', '-50.00', 'XAUUSDbo', 'BO:$50,5m|76', '0.00', '1500377972', null, null, '1', '2017-07-18 11:34:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('955', '19870907', '1332383114', '0', '1236.68', '1236.67', '1500377721', '1500378021', '-6.00', 'XAUUSDbo', 'BO:$6,5m|76', '0.00', '1500378224', null, null, '1', '2017-07-18 11:35:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('956', '19870907', '1332383115', '0', '1236.68', '1236.62', '1500377723', '1500378023', '-6.00', 'XAUUSDbo', 'BO:$6,5m|76', '0.00', '1500378224', null, null, '1', '2017-07-18 11:35:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('957', '19870907', '1332383116', '1', '1236.68', '1236.61', '1500377724', '1500378024', '4.56', 'XAUUSDbo', 'BO:$6,5m|76', '0.00', '1500378224', null, null, '1', '2017-07-18 11:35:24', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('958', '19870907', '1332383123', '0', '1236.62', '1236.57', '1500377781', '1500378081', '-6.00', 'XAUUSDbo', 'BO:$6,5m|76', '0.00', '1500378224', null, null, '1', '2017-07-18 11:36:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('959', '19870907', '1332382667', '0', '82.52', '82.29', '1500374941', '1500389341', '-100.00', 'NZDJPYbo', 'BO:$100,240m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('960', '19870907', '1332382668', '0', '82.52', '82.29', '1500374941', '1500389341', '-100.00', 'NZDJPYbo', 'BO:$100,240m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('961', '19870907', '1332382669', '0', '82.52', '82.29', '1500374941', '1500389341', '-100.00', 'NZDJPYbo', 'BO:$100,240m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('962', '19870907', '1332382695', '0', '82.52', '82.53', '1500374954', '1500378554', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('963', '19870907', '1332382696', '0', '82.52', '82.53', '1500374954', '1500378554', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('964', '19870907', '1332382697', '0', '82.52', '82.53', '1500374954', '1500378554', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('965', '19870907', '1332382698', '0', '82.52', '82.53', '1500374954', '1500378554', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('966', '19870907', '1332382699', '0', '82.52', '82.53', '1500374954', '1500378554', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('967', '19870907', '1332382700', '0', '82.52', '82.53', '1500374954', '1500378554', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('968', '19870907', '1332382701', '0', '82.52', '82.53', '1500374955', '1500378555', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('969', '19870907', '1332382702', '0', '82.52', '82.53', '1500374955', '1500378555', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('970', '19870907', '1332382703', '0', '82.52', '82.53', '1500374955', '1500378555', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('971', '19870907', '1332382704', '0', '82.52', '82.53', '1500374955', '1500378555', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('972', '19870907', '1332382705', '0', '82.52', '82.53', '1500374955', '1500378555', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('973', '19870907', '1332382706', '0', '82.52', '82.53', '1500374955', '1500378555', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('974', '19870907', '1332382707', '0', '82.52', '82.53', '1500374956', '1500378556', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('975', '19870907', '1332382708', '0', '82.52', '82.53', '1500374956', '1500378556', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('976', '19870907', '1332382709', '1', '82.51', '82.53', '1500374956', '1500378556', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('977', '19870907', '1332382710', '1', '82.52', '82.53', '1500374957', '1500378557', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('978', '19870907', '1332382711', '1', '82.52', '82.53', '1500374957', '1500378557', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('979', '19870907', '1332382712', '1', '82.52', '82.53', '1500374957', '1500378557', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('980', '19870907', '1332382713', '1', '82.52', '82.53', '1500374957', '1500378557', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('981', '19870907', '1332382714', '1', '82.52', '82.53', '1500374957', '1500378557', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('982', '19870907', '1332382715', '1', '82.52', '82.53', '1500374957', '1500378557', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('983', '19870907', '1332382716', '1', '82.52', '82.53', '1500374958', '1500378558', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('984', '19870907', '1332382717', '1', '82.52', '82.53', '1500374958', '1500378558', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('985', '19870907', '1332382718', '1', '82.52', '82.53', '1500374958', '1500378558', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('986', '19870907', '1332382719', '1', '82.52', '82.53', '1500374958', '1500378558', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('987', '19870907', '1332382720', '1', '82.52', '82.53', '1500374958', '1500378558', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('988', '19870907', '1332382721', '1', '82.52', '82.53', '1500374958', '1500378558', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('989', '19870907', '1332382722', '1', '82.52', '82.53', '1500374959', '1500378559', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('990', '19870907', '1332382723', '1', '82.52', '82.53', '1500374959', '1500378559', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('991', '19870907', '1332382724', '1', '82.52', '82.53', '1500374959', '1500378559', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('992', '19870907', '1332382725', '1', '82.52', '82.53', '1500374959', '1500378559', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('993', '19870907', '1332382726', '1', '82.52', '82.53', '1500374959', '1500378559', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('994', '19870907', '1332382727', '1', '82.52', '82.53', '1500374959', '1500378559', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('995', '19870907', '1332382728', '1', '82.52', '82.53', '1500374960', '1500378560', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('996', '19870907', '1332382729', '1', '82.52', '82.53', '1500374960', '1500378560', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('997', '19870907', '1332382730', '1', '82.52', '82.53', '1500374960', '1500378560', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('998', '19870907', '1332382731', '1', '82.52', '82.53', '1500374960', '1500378560', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('999', '19870907', '1332382732', '1', '82.52', '82.53', '1500374960', '1500378560', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1000', '19870907', '1332382733', '1', '82.52', '82.53', '1500374960', '1500378560', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1001', '19870907', '1332382734', '1', '82.52', '82.53', '1500374961', '1500378561', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1002', '19870907', '1332382735', '1', '82.52', '82.53', '1500374961', '1500378561', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1003', '19870907', '1332382736', '1', '82.52', '82.53', '1500374961', '1500378561', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1004', '19870907', '1332382737', '1', '82.52', '82.53', '1500374961', '1500378561', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1005', '19870907', '1332382738', '1', '82.52', '82.53', '1500374961', '1500378561', '-100.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1006', '19870907', '1332382739', '0', '82.51', '82.53', '1500374962', '1500378562', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1007', '19870907', '1332382740', '0', '82.51', '82.53', '1500374962', '1500378562', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1008', '19870907', '1332382741', '0', '82.51', '82.53', '1500374962', '1500378562', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1009', '19870907', '1332382742', '0', '82.51', '82.53', '1500374962', '1500378562', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1010', '19870907', '1332382743', '0', '82.51', '82.53', '1500374963', '1500378563', '78.00', 'NZDJPYbo', 'BO:$100,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1011', '19870907', '1332382744', '0', '82.52', '82.54', '1500374966', '1500378566', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1012', '19870907', '1332382745', '0', '82.52', '82.54', '1500374966', '1500378566', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1013', '19870907', '1332382746', '0', '82.52', '82.54', '1500374966', '1500378566', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1014', '19870907', '1332382747', '0', '82.52', '82.54', '1500374966', '1500378566', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1015', '19870907', '1332382748', '0', '82.52', '82.54', '1500374967', '1500378567', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1016', '19870907', '1332382749', '0', '82.52', '82.54', '1500374967', '1500378567', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1017', '19870907', '1332382750', '0', '82.52', '82.54', '1500374967', '1500378567', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1018', '19870907', '1332382751', '0', '82.52', '82.54', '1500374968', '1500378568', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1019', '19870907', '1332382752', '0', '82.52', '82.54', '1500374968', '1500378568', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1020', '19870907', '1332382753', '0', '82.52', '82.54', '1500374968', '1500378568', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1021', '19870907', '1332382754', '0', '82.52', '82.54', '1500374968', '1500378568', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1022', '19870907', '1332382755', '0', '82.52', '82.54', '1500374969', '1500378569', '234.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1023', '19870907', '1332382756', '1', '82.51', '82.54', '1500374970', '1500378570', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1024', '19870907', '1332382757', '1', '82.51', '82.54', '1500374970', '1500378570', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1025', '19870907', '1332382758', '1', '82.51', '82.54', '1500374970', '1500378570', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1026', '19870907', '1332382759', '1', '82.51', '82.54', '1500374970', '1500378570', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1027', '19870907', '1332382760', '1', '82.51', '82.54', '1500374970', '1500378570', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1028', '19870907', '1332382761', '1', '82.51', '82.54', '1500374970', '1500378570', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1029', '19870907', '1332382762', '1', '82.51', '82.54', '1500374970', '1500378570', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1030', '19870907', '1332382763', '1', '82.51', '82.54', '1500374971', '1500378571', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1031', '19870907', '1332382764', '1', '82.51', '82.54', '1500374971', '1500378571', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1032', '19870907', '1332382765', '1', '82.51', '82.54', '1500374971', '1500378571', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1033', '19870907', '1332382766', '1', '82.51', '82.54', '1500374971', '1500378571', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1034', '19870907', '1332382767', '1', '82.51', '82.54', '1500374971', '1500378571', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1035', '19870907', '1332382768', '1', '82.51', '82.54', '1500374972', '1500378572', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1036', '19870907', '1332382769', '1', '82.52', '82.54', '1500374972', '1500378572', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1037', '19870907', '1332382770', '1', '82.52', '82.54', '1500374972', '1500378572', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1038', '19870907', '1332382771', '1', '82.52', '82.54', '1500374972', '1500378572', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1039', '19870907', '1332382772', '1', '82.52', '82.54', '1500374972', '1500378572', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1040', '19870907', '1332382773', '1', '82.52', '82.54', '1500374972', '1500378572', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1041', '19870907', '1332382774', '1', '82.52', '82.54', '1500374973', '1500378573', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1042', '19870907', '1332382775', '1', '82.52', '82.54', '1500374973', '1500378573', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1043', '19870907', '1332382776', '1', '82.52', '82.54', '1500374973', '1500378573', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1044', '19870907', '1332382777', '1', '82.52', '82.54', '1500374973', '1500378573', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1045', '19870907', '1332382778', '1', '82.52', '82.54', '1500374973', '1500378573', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1046', '19870907', '1332382779', '1', '82.52', '82.54', '1500374973', '1500378573', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1047', '19870907', '1332382780', '1', '82.52', '82.54', '1500374974', '1500378574', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1048', '19870907', '1332382781', '1', '82.52', '82.54', '1500374974', '1500378574', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1049', '19870907', '1332382782', '1', '82.52', '82.54', '1500374974', '1500378574', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1050', '19870907', '1332382783', '1', '82.52', '82.54', '1500374974', '1500378574', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1051', '19870907', '1332382784', '1', '82.52', '82.54', '1500374974', '1500378574', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1052', '19870907', '1332382785', '1', '82.52', '82.54', '1500374974', '1500378574', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1053', '19870907', '1332382786', '1', '82.52', '82.54', '1500374975', '1500378575', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1054', '19870907', '1332382787', '1', '82.52', '82.54', '1500374975', '1500378575', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1055', '19870907', '1332382788', '1', '82.52', '82.54', '1500374975', '1500378575', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1056', '19870907', '1332382789', '1', '82.52', '82.54', '1500374975', '1500378575', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1057', '19870907', '1332382790', '1', '82.52', '82.54', '1500374975', '1500378575', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1058', '19870907', '1332382791', '1', '82.52', '82.54', '1500374975', '1500378575', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1059', '19870907', '1332382792', '1', '82.52', '82.54', '1500374976', '1500378576', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1060', '19870907', '1332382793', '1', '82.52', '82.54', '1500374976', '1500378576', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1061', '19870907', '1332382794', '1', '82.52', '82.54', '1500374976', '1500378576', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1062', '19870907', '1332382795', '1', '82.52', '82.54', '1500374976', '1500378576', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1063', '19870907', '1332382796', '1', '82.52', '82.54', '1500374976', '1500378576', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1064', '19870907', '1332382797', '1', '82.52', '82.54', '1500374976', '1500378576', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:36', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1065', '19870907', '1332382798', '1', '82.52', '82.54', '1500374977', '1500378577', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1066', '19870907', '1332382799', '1', '82.52', '82.54', '1500374977', '1500378577', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1067', '19870907', '1332382800', '1', '82.52', '82.54', '1500374977', '1500378577', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1068', '19870907', '1332382801', '1', '82.52', '82.54', '1500374977', '1500378577', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1069', '19870907', '1332382802', '1', '82.52', '82.54', '1500374977', '1500378577', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1070', '19870907', '1332382803', '1', '82.52', '82.54', '1500374977', '1500378577', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1071', '19870907', '1332382804', '1', '82.52', '82.54', '1500374978', '1500378578', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1072', '19870907', '1332382805', '1', '82.52', '82.54', '1500374978', '1500378578', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1073', '19870907', '1332382806', '1', '82.52', '82.54', '1500374978', '1500378578', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1074', '19870907', '1332382807', '1', '82.52', '82.54', '1500374978', '1500378578', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1075', '19870907', '1332382808', '1', '82.52', '82.54', '1500374978', '1500378578', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1076', '19870907', '1332382809', '1', '82.52', '82.54', '1500374978', '1500378578', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1077', '19870907', '1332382810', '1', '82.52', '82.54', '1500374979', '1500378579', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1078', '19870907', '1332382811', '1', '82.52', '82.54', '1500374979', '1500378579', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1079', '19870907', '1332382812', '1', '82.52', '82.54', '1500374979', '1500378579', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1080', '19870907', '1332382813', '1', '82.52', '82.54', '1500374979', '1500378579', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1081', '19870907', '1332382814', '1', '82.52', '82.54', '1500374979', '1500378579', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1082', '19870907', '1332382815', '1', '82.52', '82.54', '1500374979', '1500378579', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1083', '19870907', '1332382816', '1', '82.52', '82.54', '1500374979', '1500378579', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1084', '19870907', '1332382817', '1', '82.52', '82.53', '1500374980', '1500378580', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1085', '19870907', '1332382818', '1', '82.52', '82.53', '1500374980', '1500378580', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1086', '19870907', '1332382819', '1', '82.52', '82.53', '1500374980', '1500378580', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1087', '19870907', '1332382820', '1', '82.52', '82.53', '1500374980', '1500378580', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1088', '19870907', '1332382821', '1', '82.52', '82.53', '1500374980', '1500378580', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1089', '19870907', '1332382822', '1', '82.52', '82.53', '1500374980', '1500378580', '-300.00', 'NZDJPYbo', 'BO:$300,60m|78', '0.00', '1500427203', null, null, '1', '2017-07-18 10:49:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1090', '19870907', '1332383053', '1', '1.30', '1.30', '1500376976', '1500378776', '-50.00', 'GBPUSDbo', 'BO:$50,30m|82', '0.00', '1500427203', null, null, '1', '2017-07-18 11:22:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1091', '19870907', '1332383160', '0', '1.26', '1.26', '1500378462', '1500378762', '4.56', 'USDCADbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 11:47:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1092', '19870907', '1332383161', '1', '1.26', '1.26', '1500378463', '1500378763', '-6.00', 'USDCADbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 11:47:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1093', '19870907', '1332383251', '1', '1.26', '1.26', '1500378577', '1500378877', '-6.00', 'USDCADbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 11:49:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1094', '19870907', '1332383252', '1', '1.26', '1.26', '1500378577', '1500378877', '-6.00', 'USDCADbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 11:49:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1095', '19870907', '1332383260', '1', '146.36', '146.40', '1500378937', '1500379237', '-6.00', 'GBPJPYbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 11:55:37', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1096', '19870907', '1332383281', '0', '0.89', '0.89', '1500380254', '1500380554', '4.56', 'EURGBPbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 12:17:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1097', '19870907', '1332383285', '0', '0.89', '0.89', '1500380772', '1500381072', '-6.00', 'EURGBPbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 12:26:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1098', '19870907', '1332383286', '0', '0.89', '0.89', '1500380772', '1500381072', '-6.00', 'EURGBPbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 12:26:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1099', '19870907', '1332383287', '0', '0.89', '0.89', '1500380772', '1500381072', '-6.00', 'EURGBPbo', 'BO:$6,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 12:26:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1100', '19870907', '1332383288', '0', '0.89', '0.89', '1500380774', '1500380834', '0.00', 'EURGBPbo', 'BO:$6,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:26:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1101', '19870907', '1332383308', '1', '82.42', '82.42', '1500381474', '1500381534', '0.00', 'NZDJPYbo', 'BO:$6,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:37:54', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1102', '19870907', '1332383309', '1', '82.42', '82.42', '1500381475', '1500381535', '0.00', 'NZDJPYbo', 'BO:$6,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:37:55', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1103', '19870907', '1332383310', '1', '82.42', '82.42', '1500381661', '1500381721', '-6.00', 'NZDJPYbo', 'BO:$6,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:41:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1104', '19870907', '1332383311', '1', '82.42', '82.42', '1500381662', '1500381722', '-6.00', 'NZDJPYbo', 'BO:$6,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:41:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1105', '19870907', '1332383312', '1', '82.42', '82.42', '1500381662', '1500381722', '-6.00', 'NZDJPYbo', 'BO:$6,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:41:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1106', '19870907', '1332383313', '0', '82.42', '82.43', '1500381663', '1500381723', '4.50', 'NZDJPYbo', 'BO:$6,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:41:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1107', '19870907', '1332383314', '1', '82.42', '82.42', '1500381666', '1500381726', '-8.00', 'NZDJPYbo', 'BO:$8,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:41:06', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1108', '19870907', '1332383330', '1', '82.47', '82.46', '1500382409', '1500382469', '3.75', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:53:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1109', '19870907', '1332383331', '0', '82.47', '82.46', '1500382415', '1500382475', '-88.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:53:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1110', '19870907', '1332383332', '0', '82.47', '82.46', '1500382415', '1500382475', '-88.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:53:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1111', '19870907', '1332383334', '1', '82.46', '82.47', '1500382462', '1500382522', '-88.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:54:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1112', '19870907', '1332383335', '0', '82.46', '82.45', '1500382467', '1500382767', '-88.00', 'NZDJPYbo', 'BO:$88,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 12:54:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1113', '19870907', '1332383336', '1', '82.47', '82.45', '1500382517', '1500382817', '66.88', 'NZDJPYbo', 'BO:$88,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 12:55:17', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1114', '19870907', '1332383337', '1', '82.47', '82.45', '1500382518', '1500382818', '66.88', 'NZDJPYbo', 'BO:$88,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 12:55:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1115', '19870907', '1332383338', '1', '82.47', '82.47', '1500382520', '1500382580', '-88.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:55:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1116', '19870907', '1332383339', '1', '82.47', '82.46', '1500382676', '1500382736', '66.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 12:57:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1117', '19870907', '1332383345', '1', '82.39', '82.39', '1500386296', '1500386356', '-88.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 13:58:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1118', '19870907', '1332383346', '1', '82.39', '82.39', '1500386296', '1500386356', '-88.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 13:58:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1119', '19870907', '1332383347', '0', '82.40', '82.38', '1500386654', '1500386714', '-88.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:04:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1120', '19870907', '1332383348', '0', '82.38', '82.40', '1500386713', '1500386773', '66.00', 'NZDJPYbo', 'BO:$88,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1121', '19870907', '1332383349', '0', '82.39', '82.37', '1500386718', '1500387618', '-88.00', 'NZDJPYbo', 'BO:$88,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:18', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1122', '19870907', '1332383350', '0', '82.39', '82.36', '1500386719', '1500387619', '-88.00', 'NZDJPYbo', 'BO:$88,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1123', '19870907', '1332383351', '0', '82.39', '82.36', '1500386719', '1500387619', '-88.00', 'NZDJPYbo', 'BO:$88,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:19', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1124', '19870907', '1332383352', '1', '82.39', '82.36', '1500386721', '1500387621', '16.00', 'NZDJPYbo', 'BO:$20,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1125', '19870907', '1332383353', '1', '82.39', '82.36', '1500386721', '1500387621', '16.00', 'NZDJPYbo', 'BO:$20,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1126', '19870907', '1332383354', '0', '82.38', '82.36', '1500386722', '1500387622', '-20.00', 'NZDJPYbo', 'BO:$20,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1127', '19870907', '1332383355', '0', '82.39', '82.36', '1500386723', '1500387623', '-20.00', 'NZDJPYbo', 'BO:$20,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1128', '19870907', '1332383356', '1', '82.38', '82.36', '1500386728', '1500387628', '16.00', 'NZDJPYbo', 'BO:$20,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1129', '19870907', '1332383357', '1', '82.39', '82.36', '1500386730', '1500387630', '16.00', 'NZDJPYbo', 'BO:$20,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:05:30', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1130', '19870907', '1332383359', '1', '82.39', '82.37', '1500387039', '1500387939', '16.00', 'NZDJPYbo', 'BO:$20,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:10:39', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1131', '19870907', '1332383360', '1', '82.39', '82.37', '1500387042', '1500387942', '40.00', 'NZDJPYbo', 'BO:$50,15m|80', '0.00', '1500427203', null, null, '1', '2017-07-18 14:10:42', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1132', '19870907', '1332383361', '1', '82.39', '82.38', '1500387044', '1500387344', '38.00', 'NZDJPYbo', 'BO:$50,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:10:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1133', '19870907', '1332383362', '1', '82.39', '82.38', '1500387045', '1500387345', '38.00', 'NZDJPYbo', 'BO:$50,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:10:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1134', '19870907', '1332383364', '1', '82.38', '82.38', '1500387173', '1500387473', '38.00', 'NZDJPYbo', 'BO:$50,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:12:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1135', '19870907', '1332383365', '1', '82.38', '82.38', '1500387178', '1500387478', '3.80', 'NZDJPYbo', 'BO:$5,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:12:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1136', '19870907', '1332383366', '1', '82.38', '82.38', '1500387179', '1500387479', '3.80', 'NZDJPYbo', 'BO:$5,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:12:59', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1137', '19870907', '1332383367', '0', '82.38', '82.38', '1500387181', '1500387241', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:13:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1138', '19870907', '1332383368', '0', '82.38', '82.38', '1500387181', '1500387241', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:13:01', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1139', '19870907', '1332383372', '1', '82.34', '82.33', '1500388041', '1500388101', '3.75', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:27:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1140', '19870907', '1332383373', '1', '82.34', '82.33', '1500388042', '1500388102', '3.75', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:27:22', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1141', '19870907', '1332383374', '0', '82.35', '82.33', '1500388045', '1500388105', '-100.00', 'NZDJPYbo', 'BO:$100,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:27:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1142', '19870907', '1332383375', '1', '82.34', '82.33', '1500388046', '1500388106', '75.00', 'NZDJPYbo', 'BO:$100,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:27:26', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1143', '19870907', '1332383384', '1', '82.34', '82.32', '1500388848', '1500388908', '75.00', 'NZDJPYbo', 'BO:$100,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:40:48', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1144', '19870907', '1332383386', '1', '82.34', '82.31', '1500388888', '1500388948', '75.00', 'NZDJPYbo', 'BO:$100,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:41:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1145', '19870907', '1332383387', '1', '82.34', '82.31', '1500388893', '1500388953', '13.50', 'NZDJPYbo', 'BO:$18,1m|75', '0.00', '1500427203', null, null, '1', '2017-07-18 14:41:33', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1146', '19870907', '1332383388', '0', '82.34', '82.25', '1500388895', '1500389195', '-18.00', 'NZDJPYbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:41:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1147', '19870907', '1332383390', '1', '82.33', '82.23', '1500388918', '1500389218', '13.68', 'NZDJPYbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:41:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1148', '19870907', '1332383394', '1', '82.28', '82.27', '1500389480', '1500389780', '13.68', 'NZDJPYbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:51:20', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1149', '19870907', '1332383398', '1', '82.28', '82.26', '1500389548', '1500389848', '13.68', 'NZDJPYbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:52:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1150', '19870907', '1332383399', '1', '1.26', '1.26', '1500389571', '1500389871', '-18.00', 'USDCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:52:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1151', '19870907', '1332383400', '1', '1.26', '1.26', '1500389572', '1500389872', '-18.00', 'USDCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 14:52:52', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1152', '19870907', '1332383427', '1', '1.26', '1.26', '1500391153', '1500391453', '-18.00', 'USDCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 15:19:13', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1153', '19870907', '1332383428', '1', '1.26', '1.26', '1500391154', '1500391454', '-18.00', 'USDCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 15:19:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1154', '19870907', '1332383429', '0', '1.26', '1.26', '1500391155', '1500391455', '13.68', 'USDCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 15:19:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1155', '19870907', '1332383430', '0', '1.26', '1.26', '1500391155', '1500391455', '13.68', 'USDCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 15:19:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1156', '19870907', '1332383432', '0', '1.46', '1.46', '1500391334', '1500391634', '0.00', 'EURCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 15:22:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1157', '19870907', '1332383433', '0', '1.46', '1.46', '1500391335', '1500391635', '13.68', 'EURCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 15:22:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1158', '19870907', '1332383434', '0', '1.46', '1.46', '1500391335', '1500391635', '13.68', 'EURCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 15:22:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1159', '19870907', '1332383435', '0', '1.46', '1.46', '1500391335', '1500391635', '13.68', 'EURCADbo', 'BO:$18,5m|76', '0.00', '1500427203', null, null, '1', '2017-07-18 15:22:15', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1160', '19870907', '1332383858', '1', '0.79', '0.79', '1500428723', '1500429023', '-18.00', 'AUDUSDbo', 'BO:$18,5m|76', '0.00', '1500430637', null, null, '1', '2017-07-19 01:45:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1161', '19870907', '1332384332', '0', '0.73', '0.73', '1500433407', '1500433707', '-18.00', 'NZDUSDbo', 'BO:$18,5m|76', '0.00', '1500441694', null, null, '1', '2017-07-19 03:03:27', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1162', '19870907', '1332384333', '0', '0.73', '0.73', '1500433409', '1500433709', '-18.00', 'NZDUSDbo', 'BO:$18,5m|76', '0.00', '1500441694', null, null, '1', '2017-07-19 03:03:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1163', '19870907', '1332384334', '0', '0.73', '0.73', '1500433414', '1500433714', '-20.00', 'NZDUSDbo', 'BO:$20,5m|76', '0.00', '1500441694', null, null, '1', '2017-07-19 03:03:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1164', '19870907', '1332384335', '0', '0.73', '0.73', '1500433418', '1500433718', '-20.00', 'NZDUSDbo', 'BO:$20,5m|76', '0.00', '1500441694', null, null, '1', '2017-07-19 03:03:38', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1165', '19870907', '1332384336', '0', '0.73', '0.73', '1500433420', '1500433720', '-20.00', 'NZDUSDbo', 'BO:$20,5m|76', '0.00', '1500441694', null, null, '1', '2017-07-19 03:03:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1166', '19870907', '1332384342', '1', '0.74', '0.74', '1500433438', '1500433498', '-20.00', 'NZDUSDbo', 'BO:$20,1m|75', '0.00', '1500441694', null, null, '1', '2017-07-19 03:03:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1167', '19870907', '1332385398', '1', '0.73', '0.73', '1500435801', '1500435861', '-5.00', 'NZDUSDbo', 'BO:$5,1m|75', '0.00', '1500441694', null, null, '1', '2017-07-19 03:43:21', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1168', '19870907', '1332385400', '0', '0.73', '0.73', '1500435803', '1500435863', '3.75', 'NZDUSDbo', 'BO:$5,1m|75', '0.00', '1500441694', null, null, '1', '2017-07-19 03:43:23', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1169', '19870907', '1332385431', '1', '0.73', '0.73', '1500435850', '1500435910', '3.75', 'NZDUSDbo', 'BO:$5,1m|75', '0.00', '1500441694', null, null, '1', '2017-07-19 03:44:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1170', '19870907', '1332385434', '1', '0.73', '0.73', '1500435852', '1500435912', '-50.00', 'NZDUSDbo', 'BO:$50,1m|75', '0.00', '1500441694', null, null, '1', '2017-07-19 03:44:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1171', '19870907', '1332385436', '0', '0.73', '0.73', '1500435854', '1500436754', '0.00', 'NZDUSDbo', 'BO:$50,15m|80', '0.00', '1500441694', null, null, '1', '2017-07-19 03:44:14', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1172', '19870907', '1332385467', '0', '0.73', '0.73', '1500435932', '1500436832', '40.00', 'NZDUSDbo', 'BO:$50,15m|80', '0.00', '1500441694', null, null, '1', '2017-07-19 03:45:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1173', '19870907', '1332385471', '0', '0.73', '0.73', '1500435935', '1500436835', '0.00', 'NZDUSDbo', 'BO:$20,15m|80', '0.00', '1500441694', null, null, '1', '2017-07-19 03:45:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1174', '19870907', '1332385475', '1', '0.73', '0.73', '1500435941', '1500436841', '-5.00', 'NZDUSDbo', 'BO:$5,15m|80', '0.00', '1500441694', null, null, '1', '2017-07-19 03:45:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1175', '19870907', '1332385736', '1', '146.08', '146.01', '1500436181', '1500437081', '4.00', 'GBPJPYbo', 'BO:$5,15m|80', '0.00', '1500441694', null, null, '1', '2017-07-19 03:49:41', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1176', '19870907', '1332391339', '0', '1.15', '1.15', '1500447460', '1500447520', '0.00', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500452285', null, null, '1', '2017-07-19 06:57:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1177', '19870907', '1332391340', '0', '1.15', '1.15', '1500447460', '1500447520', '0.00', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500452285', null, null, '1', '2017-07-19 06:57:40', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1178', '19870907', '1332391633', '0', '1240.81', '1240.70', '1500448114', '1500448174', '-5.00', 'XAUUSDbo', 'BO:$5,1m|75', '0.00', '1500452285', null, null, '1', '2017-07-19 07:08:34', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1179', '19870907', '1332391634', '1', '1240.81', '1240.70', '1500448115', '1500448175', '3.75', 'XAUUSDbo', 'BO:$5,1m|75', '0.00', '1500452285', null, null, '1', '2017-07-19 07:08:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1180', '19870907', '1332391635', '1', '1240.81', '1240.70', '1500448115', '1500448175', '3.75', 'XAUUSDbo', 'BO:$5,1m|75', '0.00', '1500452285', null, null, '1', '2017-07-19 07:08:35', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1181', '19870907', '1332391673', '1', '1240.75', '1240.82', '1500448204', '1500448264', '-5.00', 'XAUUSDbo', 'BO:$5,1m|75', '0.00', '1500452285', null, null, '1', '2017-07-19 07:10:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1182', '19870907', '1332391674', '1', '1240.75', '1240.82', '1500448205', '1500448265', '-5.00', 'XAUUSDbo', 'BO:$5,1m|75', '0.00', '1500452285', null, null, '1', '2017-07-19 07:10:05', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1183', '19870907', '1332394005', '1', '1.26', '1.26', '1500455811', '1500455871', '-5.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:16:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1184', '19870907', '1332394006', '0', '1.26', '1.26', '1500455813', '1500455873', '-5.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:16:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1185', '19870907', '1332394008', '0', '1.26', '1.26', '1500455813', '1500455873', '-5.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:16:53', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1186', '19870907', '1332394019', '0', '1.26', '1.26', '1500455911', '1500455971', '3.75', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:31', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1187', '19870907', '1332394023', '1', '1.26', '1.26', '1500455923', '1500455983', '0.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:43', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1188', '19870907', '1332394024', '0', '1.26', '1.26', '1500455924', '1500455984', '3.75', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:44', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1189', '19870907', '1332394026', '1', '1.26', '1.26', '1500455930', '1500455990', '-5.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1190', '19870907', '1332394027', '1', '1.26', '1.26', '1500455930', '1500455990', '-5.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:50', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1191', '19870907', '1332394028', '1', '1.26', '1.26', '1500455931', '1500455991', '-5.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1192', '19870907', '1332394029', '1', '1.26', '1.26', '1500455931', '1500455991', '-5.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1193', '19870907', '1332394030', '1', '1.26', '1.26', '1500455931', '1500455991', '-5.00', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1194', '19870907', '1332394031', '0', '1.26', '1.26', '1500455931', '1500455991', '3.75', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1195', '19870907', '1332394032', '0', '1.26', '1.26', '1500455931', '1500455991', '3.75', 'USDCADbo', 'BO:$5,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:51', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1196', '19870907', '1332394033', '1', '1.26', '1.26', '1500455936', '1500455996', '-100.00', 'USDCADbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1197', '19870907', '1332394034', '1', '1.26', '1.26', '1500455936', '1500455996', '-100.00', 'USDCADbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1198', '19870907', '1332394035', '1', '1.26', '1.26', '1500455936', '1500455996', '-100.00', 'USDCADbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:56', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1199', '19870907', '1332394036', '0', '1.26', '1.26', '1500455937', '1500455997', '75.00', 'USDCADbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1200', '19870907', '1332394037', '0', '1.26', '1.26', '1500455937', '1500455997', '75.00', 'USDCADbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:18:57', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1201', '19870907', '1332394065', '1', '1.26', '1.26', '1500456105', '1500456165', '-100.00', 'USDCADbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:21:45', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1202', '19870907', '1332394066', '0', '1.26', '1.26', '1500456107', '1500456167', '75.00', 'USDCADbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 09:21:47', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1203', '19870907', '1332395267', '0', '1.26', '1.26', '1500463318', '1500463378', '-100.00', 'USDCADbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 11:21:58', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1204', '19870907', '1332395295', '0', '1239.17', '1239.02', '1500463690', '1500463750', '-100.00', 'XAUUSDbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 11:28:10', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1205', '19870907', '1332395654', '0', '1.15', '1.15', '1500468865', '1500468925', '-100.00', 'EURUSDbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 12:54:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1206', '19870907', '1332395655', '0', '1.15', '1.15', '1500468865', '1500468925', '-100.00', 'EURUSDbo', 'BO:$100,1m|75', '0.00', '1500500299', null, null, '1', '2017-07-19 12:54:25', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1207', '19870907', '1332395656', '1', '1.15', '1.15', '1500468868', '1500469168', '76.00', 'EURUSDbo', 'BO:$100,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 12:54:28', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1208', '19870907', '1332395657', '1', '1.15', '1.15', '1500468869', '1500469169', '76.00', 'EURUSDbo', 'BO:$100,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 12:54:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1209', '19870907', '1332395658', '1', '1.15', '1.15', '1500468872', '1500469172', '3.80', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 12:54:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1210', '19870907', '1332395659', '1', '1.15', '1.15', '1500468872', '1500469172', '3.80', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 12:54:32', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1211', '19870907', '1332395684', '0', '1.15', '1.15', '1500469229', '1500469529', '3.80', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:00:29', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1212', '19870907', '1332395691', '0', '0.79', '0.79', '1500469272', '1500469572', '3.80', 'AUDUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:01:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1213', '19870907', '1332395693', '1', '0.79', '0.79', '1500469272', '1500469572', '-5.00', 'AUDUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:01:12', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1214', '19870907', '1332395694', '0', '129.07', '129.11', '1500469276', '1500469576', '3.80', 'EURJPYbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:01:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1215', '19870907', '1332395695', '1', '129.07', '129.11', '1500469276', '1500469576', '-5.00', 'EURJPYbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:01:16', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1216', '19870907', '1332395709', '1', '1.15', '1.15', '1500469442', '1500469742', '-5.00', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:04:02', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1217', '19870907', '1332395710', '1', '1.15', '1.15', '1500469443', '1500469743', '-5.00', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:04:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1218', '19870907', '1332395711', '1', '1.15', '1.15', '1500469443', '1500469743', '-5.00', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:04:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1219', '19870907', '1332395712', '1', '1.15', '1.15', '1500469443', '1500469743', '-5.00', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:04:03', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1220', '19870907', '1332395713', '0', '1.15', '1.15', '1500469444', '1500469744', '3.80', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:04:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1221', '19870907', '1332395714', '0', '1.15', '1.15', '1500469444', '1500469744', '3.80', 'EURUSDbo', 'BO:$5,5m|76', '0.00', '1500500299', null, null, '1', '2017-07-19 13:04:04', '2017-07-20 09:52:03');
INSERT INTO `traders` VALUES ('1222', '19870907', '1332397377', '1', '1.15', '1.15', '1500517065', '1500517125', '-5.00', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500519316', null, null, '1', '2017-07-20 02:17:45', '2017-07-20 03:02:19');
INSERT INTO `traders` VALUES ('1223', '19870907', '1332397465', '1', '1.15', '1.15', '1500517266', '1500517326', '3.75', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500519316', null, null, '1', '2017-07-20 02:21:06', '2017-07-20 03:02:19');
INSERT INTO `traders` VALUES ('1224', '19870907', '1332397466', '0', '1.15', '1.15', '1500517268', '1500517328', '-5.00', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500519316', null, null, '1', '2017-07-20 02:21:08', '2017-07-20 03:02:19');
INSERT INTO `traders` VALUES ('1225', '19870907', '1332398430', '1', '1.15', '1.15', '1500518970', '1500519030', '0.00', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500519316', null, null, '1', '2017-07-20 02:49:30', '2017-07-20 03:02:19');
INSERT INTO `traders` VALUES ('1226', '19870907', '1332398433', '0', '1.15', '1.15', '1500518972', '1500519032', '0.00', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500519316', null, null, '1', '2017-07-20 02:49:32', '2017-07-20 03:02:19');
INSERT INTO `traders` VALUES ('1227', '19870907', '1332399720', '0', '1.15', '1.15', '1500520744', '1500520804', '-5.00', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 03:19:04', '2017-07-20 07:29:13');
INSERT INTO `traders` VALUES ('1228', '19870907', '1332399721', '1', '1.15', '1.15', '1500520746', '1500520806', '3.75', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 03:19:06', '2017-07-20 07:29:13');
INSERT INTO `traders` VALUES ('1229', '19870907', '1332399722', '1', '1.15', '1.15', '1500520746', '1500520806', '3.75', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 03:19:06', '2017-07-20 07:29:14');
INSERT INTO `traders` VALUES ('1230', '19870907', '1332399801', '1', '1.15', '1.15', '1500520863', '1500520923', '3.75', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 03:21:03', '2017-07-20 07:29:14');
INSERT INTO `traders` VALUES ('1231', '19870907', '1332402237', '1', '1.15', '1.15', '1500524099', '1500524159', '3.75', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:14:59', '2017-07-20 07:29:14');
INSERT INTO `traders` VALUES ('1232', '19870907', '1332402268', '0', '88.89', '88.91', '1500524120', '1500524180', '3.75', 'AUDJPYbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:15:20', '2017-07-20 07:29:14');
INSERT INTO `traders` VALUES ('1233', '19870907', '1332402345', '0', '82.22', '82.22', '1500524259', '1500524319', '3.75', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:17:39', '2017-07-20 07:29:14');
INSERT INTO `traders` VALUES ('1234', '19870907', '1332402346', '0', '82.22', '82.22', '1500524260', '1500524320', '3.75', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:17:40', '2017-07-20 07:29:14');
INSERT INTO `traders` VALUES ('1235', '19870907', '1332402598', '1', '1.15', '1.15', '1500524696', '1500524756', '3.75', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:24:56', '2017-07-20 07:29:14');
INSERT INTO `traders` VALUES ('1236', '19870907', '1332402600', '1', '1.15', '1.15', '1500524696', '1500524756', '3.75', 'EURUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:24:56', '2017-07-20 07:29:14');
INSERT INTO `traders` VALUES ('1237', '19870907', '1332403418', '1', '145.80', '145.81', '1500525814', '1500525874', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:43:34', '2017-07-20 07:29:15');
INSERT INTO `traders` VALUES ('1238', '19870907', '1332403670', '1', '0.79', '0.79', '1500526264', '1500526324', '-5.00', 'AUDUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:51:04', '2017-07-20 07:29:15');
INSERT INTO `traders` VALUES ('1239', '19870907', '1332403737', '0', '1.30', '1.30', '1500526378', '1500526438', '3.75', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500526748', null, null, '1', '2017-07-20 04:52:58', '2017-07-20 07:29:15');
INSERT INTO `traders` VALUES ('1240', '19870907', '1332404163', '1', '1.30', '1.30', '1500527004', '1500527064', '3.75', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500527484', null, null, '1', '2017-07-20 05:03:24', '2017-07-20 07:29:15');
INSERT INTO `traders` VALUES ('1241', '19870907', '1332404165', '1', '1.30', '1.30', '1500527007', '1500527067', '-5.00', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500527484', null, null, '1', '2017-07-20 05:03:27', '2017-07-20 07:29:15');
INSERT INTO `traders` VALUES ('1242', '19870907', '1332404398', '1', '1.30', '1.30', '1500527535', '1500527595', '3.75', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500529623', null, null, '1', '2017-07-20 05:12:15', '2017-07-20 07:29:16');
INSERT INTO `traders` VALUES ('1243', '19870907', '1332404401', '0', '1.30', '1.30', '1500527538', '1500527598', '-5.00', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500529623', null, null, '1', '2017-07-20 05:12:18', '2017-07-20 07:29:16');
INSERT INTO `traders` VALUES ('1244', '19870907', '1332407481', '0', '1.30', '1.30', '1500536779', '1500536839', '3.75', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500542787', null, null, '0', '2017-07-20 07:46:19', '2017-07-20 09:26:27');
INSERT INTO `traders` VALUES ('1245', '19870907', '1332407482', '1', '1.30', '1.30', '1500536779', '1500536839', '-5.00', 'GBPUSDbo', 'BO:$5,1m|75', '0.00', '1500542787', null, null, '0', '2017-07-20 07:46:19', '2017-07-20 09:26:28');
INSERT INTO `traders` VALUES ('1246', '19870907', '1332407904', '0', '1238.17', '1237.99', '1500538325', '1500538385', '-5.00', 'XAUUSDbo', 'BO:$5,1m|75', '0.00', '1500542787', null, null, '0', '2017-07-20 08:12:05', '2017-07-20 09:26:28');
INSERT INTO `traders` VALUES ('1247', '19870907', '1332407905', '0', '1238.17', '1237.99', '1500538326', '1500538386', '-5.00', 'XAUUSDbo', 'BO:$5,1m|75', '0.00', '1500542787', null, null, '0', '2017-07-20 08:12:06', '2017-07-20 09:26:28');
INSERT INTO `traders` VALUES ('1248', '19870907', '1332407906', '1', '1238.17', '1237.99', '1500538326', '1500538386', '3.75', 'XAUUSDbo', 'BO:$5,1m|75', '0.00', '1500542787', null, null, '0', '2017-07-20 08:12:06', '2017-07-20 09:26:28');
INSERT INTO `traders` VALUES ('1249', '19870907', '1332430024', '1', '144.41', '144.43', '1500870418', '1500870478', '-5.00', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500875304', null, null, '0', '2017-07-24 04:26:58', '2017-07-24 05:48:25');
INSERT INTO `traders` VALUES ('1250', '19870907', '1332430025', '0', '144.41', '144.43', '1500870418', '1500870478', '3.75', 'GBPJPYbo', 'BO:$5,1m|75', '0.00', '1500875304', null, null, '0', '2017-07-24 04:26:58', '2017-07-24 05:48:26');
INSERT INTO `traders` VALUES ('1251', '19870907', '1332431480', '0', '1.17', '1.17', '1500872771', '1500876371', '4.25', 'EURUSDbo', 'BO:$5,60m|85', '0.00', '1500885372', null, null, '0', '2017-07-24 05:06:11', '2017-07-24 08:36:15');
INSERT INTO `traders` VALUES ('1252', '19870907', '1332431486', '1', '0.79', '0.79', '1500872782', '1500876382', '-5.00', 'AUDUSDbo', 'BO:$5,60m|85', '0.00', '1500885372', null, null, '0', '2017-07-24 05:06:22', '2017-07-24 08:36:15');
INSERT INTO `traders` VALUES ('1253', '19870907', '1332447847', '0', '82.57', '82.56', '1500970347', '1500970407', '-5.00', 'NZDJPYbo', 'BO:$5,1m|75', '0.00', '1501121882', null, null, '0', '2017-07-25 08:12:27', '2017-07-27 02:18:05');

-- ----------------------------
-- Table structure for `translists`
-- ----------------------------
DROP TABLE IF EXISTS `translists`;
CREATE TABLE `translists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(20) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL COMMENT '转账给谁',
  `status` smallint(5) NOT NULL DEFAULT '0' COMMENT '0 等待处理,1 成功， 2失败',
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of translists
-- ----------------------------
INSERT INTO `translists` VALUES ('9', '669', '1', '33', '1', null, '2017-07-20 00:28:35', '2017-07-20 00:30:25', null);
INSERT INTO `translists` VALUES ('10', '998', '1', '33', '1', null, '2017-07-24 08:36:28', '2017-07-24 08:39:40', null);
INSERT INTO `translists` VALUES ('11', '350', '1', '33', '1', null, '2017-07-24 09:06:44', '2017-07-24 09:07:24', null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userno` varchar(20) DEFAULT '',
  `idnum` varchar(255) NOT NULL,
  `englishname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `name` int(11) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `tel` varchar(20) NOT NULL DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `country` varchar(255) DEFAULT '0',
  `idcountry` varchar(100) DEFAULT NULL COMMENT '发证国家',
  `address` varchar(255) DEFAULT NULL,
  `fete` varchar(50) DEFAULT NULL,
  `balance` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '可用金',
  `vailable` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '可用值',
  `netvalue` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '净值',
  `assurevalue` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '保证金',
  `agent_id` int(11) DEFAULT NULL,
  `honor_id` int(11) DEFAULT NULL COMMENT '资质',
  `is_agent` smallint(5) NOT NULL DEFAULT '0' COMMENT '0普通用户，1代理',
  `id_type` varchar(255) DEFAULT NULL COMMENT '身份证类型',
  `sex` varchar(100) DEFAULT NULL COMMENT '性别',
  `active` smallint(5) NOT NULL DEFAULT '0' COMMENT '是否激活',
  `idfront` varchar(255) DEFAULT NULL,
  `idback` varchar(255) DEFAULT NULL,
  `role` smallint(5) NOT NULL DEFAULT '1',
  `group` varchar(255) DEFAULT NULL COMMENT '分组',
  `leverage` int(11) DEFAULT NULL COMMENT '杠杆',
  `credit` int(11) DEFAULT NULL COMMENT '信用',
  `simulate` smallint(5) NOT NULL DEFAULT '0' COMMENT '模拟',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '12306', '23232333233323332323', 'james', '王', '明峰', '19870907', '$2y$10$/Jp/bIelB9dTte4e2gXrS.rC9luckJAWGilug3.R.pAguEvmZ8PiK', 'pTNmVu3iNR7hYMZtNYSOrBez1HtqYrkonsoSgSKHbcMKnMlg0xbjvXnXhMRk', '12312312331', '852181955@qq.com', 'China', '中国', '大连', null, '85445.04', '87882.79', '-4340.00', '0.00', '27', '2', '1', null, null, '1', '/images/front/id/20170714/0eb3eac182c8960fbc014e1c7eee6814.jpg', '/images/front/id/20170714/364dd6b15e53f5310fcdc7ab1d7f4a1f.jpg', '0', 'AQ1', '150', '0', '0', '2017-03-04 11:52:34', '2017-07-27 06:31:08', null);
INSERT INTO `users` VALUES ('17', '', '', null, null, null, '31515807', null, null, '', 'wangmingfeng_217@163.com', '', null, '', null, '0.00', '0.00', '0.00', '0.00', '1', null, '0', null, null, '1', '/uploads/temp/20170714/7dcd2665edad6aa954edeba1eddf04b3.jpg', '/uploads/temp/20170714/0d5395f148b39feb8600ee1a590929e0.jpg', '1', 'AQ1', '0', '0', '0', '2017-04-05 10:22:15', '2017-07-27 06:13:52', null);
INSERT INTO `users` VALUES ('28', 'ddd', '232321321', 'tank', '哇', '导弹', '19263090', '$2y$10$UHyFUrewJw35yFku2nGiOur8vosZQ0NXxW.JFPjI8zHZK7Hv0dQDC', 'qE2I67H6qjD9Sn7Vydc0NlNctIESiJ1ykH1VQPQ4wc7VpyNvldreIf7ZDQiZ', '', '1037724555@qq.com', '', '中国', '', '2010-05-03', '0.00', '0.00', '0.00', '0.00', '1', null, '0', null, '男', '1', '/uploads/temp/20170703/c0706c658dd3e386baf60b9b9f94b1a3.jpg', '/uploads/temp/20170703/9d5117efd4be2fd18010d9ddb835963b.jpg', '1', 'AQ1', '0', '0', '0', '2017-07-03 13:53:46', '2017-07-27 06:13:57', null);
INSERT INTO `users` VALUES ('29', '', '', null, null, null, '12306', '$2y$10$UHyFUrewJw35yFku2nGiOur8vosZQ0NXxW.JFPjI8zHZK7Hv0dQDC', '3OqIl5QGQD2OPr9pfs4renDGixI32P1Oam3hHgrS4AOYeTzMPniOIf7dVajS', '0', null, '0', null, null, null, '0.00', '0.00', '0.00', '0.00', '11', null, '0', null, null, '1', null, null, '0', null, null, null, '0', '0000-00-00 00:00:00', '2017-07-16 05:05:01', null);
INSERT INTO `users` VALUES ('31', '', '2333333333333333333', 'coldplay', '赵', '四', '16093958', '$2y$10$UHyFUrewJw35yFku2nGiOur8vosZQ0NXxW.JFPjI8zHZK7Hv0dQDC', 't79SLycB2WFl2loQtgaTQcpI6YGjOb7OOqy4Gn3fGgd4UA4o8ZSh7RjoN2bt', '', 'wangmingfeng_217@163.com', '', '中国', '', '2017-07-14', '200.00', '1800.00', '-1800.00', '0.00', '1', '4', '1', '大陆身份证', null, '1', '/images/front/id/20170719/f20737f1b49503328e4c781fde8bfb97.jpg', '/images/front/id/20170719/9468b6897809118d3acd1436f0319070.jpg', '1', 'AQ1', '0', '0', '0', '2017-07-19 22:49:39', '2017-07-27 06:14:10', null);
INSERT INTO `users` VALUES ('32', '', '1232131312321321321312331', 'yool', '沈阳', '大', '30323151', '$2y$10$UHyFUrewJw35yFku2nGiOur8vosZQ0NXxW.JFPjI8zHZK7Hv0dQDC', 'onRyL59l85YQz9CCR8cVafEGg5VoiAptMIPJhPxYXjGihVWaIlAQgL7fXYhT', '', '3287991259@qq.com', '', '中国', null, '2017-06-29', '0.00', '0.00', '0.00', '0.00', '31', '3', '1', '大陆身份证', null, '1', '/images/front/id/20170719/55b2a5d61dcb5339af44e85a2759974f.jpg', '/images/front/id/20170719/80421eaf58460d9269ba6bd8a48bc325.jpg', '1', 'AQ1', '0', '0', '0', '2017-07-19 23:28:32', '2017-07-27 13:11:00', null);
INSERT INTO `users` VALUES ('33', '', '221442444', 'han', '韩', '信', '2064181', '$2y$10$7siGP2nlEs9hr0W7ebRNmetly00lXNpapTIpW9vbeZAk2mw0fa0u.', 'Xlco3N1Bwx4RQHE4cS3G3f1Dbvx7Kzomx2BLgaFYknvXKhv51Iy9Oh66k7vq', '', '3287991259@qq.com', '', '中国', '', '2017-06-28', '10.00', '2686.00', '2686.00', '0.00', '32', null, '0', '大陆身份证', null, '1', '/images/front/id/20170719/ce2d95f93a8f655cf4a19207fcdc3f96.jpg', '/images/front/id/20170719/ded94c5c07be1e7cc062f752f78fbb55.jpg', '1', 'AQ1', '0', '0', '1', '2017-07-20 00:00:10', '2017-07-28 02:10:17', null);

-- ----------------------------
-- Procedure structure for `objectpre`
-- ----------------------------
DROP PROCEDURE IF EXISTS `objectpre`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectpre`(IN `userid` int,IN `way` int)
BEGIN
	#Routine body goes here...
  DECLARE aa VARCHAR(50);
  DECLARE flag INT;
	declare cur1 CURSOR for select traders.symbol from traders where traders.login = userid GROUP BY symbol;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag=1;
  SET flag=0;
	DROP TABLE IF EXISTS `winob`;
	CREATE TEMPORARY TABLE winob (
	symbol VARCHAR(10),
	wl DECIMAL(18,2),
	wltime INT,
	wlhand DECIMAL(18,2),
  win DECIMAL(18,2),
	wtime INT,
	whand DECIMAL(18,2),
  lose DECIMAL(18,2),
	ltime INT,
	lhand DECIMAL(18,2)
) ENGINE=MEMORY ;
INSERT INTO winob(symbol, wl, wltime, wlhand) select traders.symbol, SUM(profit), COUNT(profit), SUM(volume) from traders where traders.login = userid GROUP BY traders.symbol;

OPEN cur1;
REPEAT
 FETCH cur1 INTO aa;
 UPDATE winob SET win = (select SUM(profit) from traders where traders.login = userid and traders.profit > 0 and traders.symbol = aa GROUP BY symbol) where winob.symbol=aa;
 UPDATE winob SET wtime = (select count(profit) from traders where traders.login = userid and traders.profit > 0 and traders.symbol = aa GROUP BY symbol) where winob.symbol=aa;
 UPDATE winob SET whand = (select SUM(volume) from traders where traders.login = userid and traders.profit > 0 and traders.symbol = aa GROUP BY symbol) where winob.symbol=aa;
 UPDATE winob SET lose = (select SUM(profit) from traders where traders.login = userid and traders.profit < 0 and traders.symbol = aa GROUP BY symbol) where winob.symbol=aa;
 UPDATE winob SET ltime = (select count(profit) from traders where traders.login = userid and traders.profit < 0 and traders.symbol = aa GROUP BY symbol) where winob.symbol=aa;
 UPDATE winob SET lhand = (select SUM(volume) from traders where traders.login = userid and traders.profit < 0 and traders.symbol = aa GROUP BY symbol) where winob.symbol=aa;
 UNTIL flag

END REPEAT;
CLOSE cur1;
IF way = 1 THEN 
SELECT * from winob WHERE wl > 0;
ELSEIF way = 2 THEN 
SELECT * from winob WHERE wl < 0;
ELSE
SELECT * from winob;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `winob`
-- ----------------------------
DROP PROCEDURE IF EXISTS `winob`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `winob`()
BEGIN
	#Routine body goes here...
  DECLARE aa VARCHAR(50);
  DECLARE flag INT;
	declare cur1 CURSOR for select objects.id from orders INNER JOIN objects on objects.id = orders.object_id where orders.user_id = 1 GROUP BY object_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag=1;
  SET flag=0;
	DROP TABLE IF EXISTS `winob`;
	CREATE TEMPORARY TABLE winob (
	id INT,
	obname VARCHAR(10),
	wl DECIMAL(18,2),
	wltime INT,
	wlhand DECIMAL(18,2),
  win DECIMAL(18,2),
	wtime INT,
	whand DECIMAL(18,2),
  lose DECIMAL(18,2),
	ltime INT,
	lhand DECIMAL(18,2)
) ENGINE=MEMORY ;
INSERT INTO winob(id, obname, wl, wltime, wlhand) select objects.id, body_name_english, SUM(profit), COUNT(profit), SUM(hand) from orders INNER JOIN objects on objects.id = orders.object_id where orders.user_id = 1 GROUP BY object_id;

OPEN cur1;
REPEAT
 FETCH cur1 INTO aa;
 UPDATE winob SET win = (select SUM(profit) from orders INNER JOIN objects on objects.id = orders.object_id where orders.user_id = 1 and orders.profit > 0 and orders.object_id = aa GROUP BY object_id) where winob.id=aa;
 UPDATE winob SET wtime = (select count(profit) from orders INNER JOIN objects on objects.id = orders.object_id where orders.user_id = 1 and orders.profit > 0 and orders.object_id = aa GROUP BY object_id) where winob.id=aa;
 UPDATE winob SET whand = (select SUM(hand) from orders INNER JOIN objects on objects.id = orders.object_id where orders.user_id = 1 and orders.profit > 0 and orders.object_id = aa GROUP BY object_id) where winob.id=aa;
 UPDATE winob SET lose = (select SUM(profit) from orders INNER JOIN objects on objects.id = orders.object_id where orders.user_id = 1 and orders.profit < 0 and orders.object_id = aa GROUP BY object_id) where winob.id=aa;
 UPDATE winob SET ltime = (select count(profit) from orders INNER JOIN objects on objects.id = orders.object_id where orders.user_id = 1 and orders.profit < 0 and orders.object_id = aa GROUP BY object_id) where winob.id=aa;
 UPDATE winob SET lhand = (select SUM(hand) from orders INNER JOIN objects on objects.id = orders.object_id where orders.user_id = 1 and orders.profit < 0 and orders.object_id = aa GROUP BY object_id) where winob.id=aa;
 UNTIL flag

END REPEAT;
CLOSE cur1;
SELECT * from winob;
END
;;
DELIMITER ;
