-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.38-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 auth.ss_app 结构
DROP TABLE IF EXISTS `ss_app`;
CREATE TABLE IF NOT EXISTS `ss_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `app_key` varchar(100) DEFAULT NULL,
  `app_secret` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_app_app_key` (`app_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  auth.ss_app 的数据：~1 rows (大约)
DELETE FROM `ss_app`;
/*!40000 ALTER TABLE `ss_app` DISABLE KEYS */;
INSERT INTO `ss_app` (`id`, `name`, `app_key`, `app_secret`, `available`) VALUES
	(1, '授权管理系统', '645ba616-370a-43a8-a8e0-993e7a590cf0', 'bb74abb6-bae0-47dd-a7b1-9571ea3a0f33', 1);
/*!40000 ALTER TABLE `ss_app` ENABLE KEYS */;

-- 导出  表 auth.ss_organization 结构
DROP TABLE IF EXISTS `ss_organization`;
CREATE TABLE IF NOT EXISTS `ss_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机构ID',
  `org_name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  `org_code` varchar(32) DEFAULT NULL COMMENT '机构编码',
  `org_desc` text COMMENT '机构简介',
  `org_website` varchar(255) DEFAULT NULL COMMENT '机构网址',
  `org_pic` varchar(255) DEFAULT NULL COMMENT '机构图片',
  `org_address` varchar(255) DEFAULT NULL COMMENT '机构地址',
  `region_id` smallint(5) DEFAULT NULL COMMENT '地区编号',
  `org_lng` decimal(11,6) DEFAULT NULL COMMENT '经度',
  `org_lat` decimal(11,6) DEFAULT NULL COMMENT '纬度',
  `region` varchar(50) DEFAULT NULL COMMENT '区',
  `city` varchar(5) DEFAULT NULL COMMENT '市',
  `province` varchar(5) DEFAULT NULL COMMENT '省',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `message` varchar(512) DEFAULT NULL COMMENT '重点提示',
  `busline` varchar(512) DEFAULT NULL COMMENT '乘车路线',
  `org_rule` varchar(512) DEFAULT NULL COMMENT '机构规则-预约规则等',
  `org_contact` varchar(20) DEFAULT NULL COMMENT '机构联系人',
  `org_tel` varchar(20) DEFAULT NULL COMMENT '机构电话',
  `vip_phone` varchar(20) DEFAULT NULL COMMENT 'VIP电话',
  `org_email` varchar(50) DEFAULT NULL COMMENT '机构EMAIL',
  `back_address` varchar(255) DEFAULT NULL COMMENT '退货地址',
  `back_contact` varchar(20) DEFAULT NULL COMMENT '退货联系人',
  `back_tel` varchar(20) DEFAULT NULL COMMENT '退货电话',
  `open_time` varchar(255) DEFAULT NULL COMMENT '开门时间',
  `org_grade` varchar(32) DEFAULT NULL COMMENT '机构类型对应字典hosgrade',
  `org_rank` smallint(6) DEFAULT NULL COMMENT '机构性质对应字典hosrank',
  `org_proinfo` smallint(6) DEFAULT NULL COMMENT '机构登记对应hosproinfo',
  `is_mi` smallint(6) DEFAULT NULL COMMENT '是否医保 医院特有 0否 1是',
  `is_delete` smallint(6) DEFAULT NULL COMMENT '是否删除：0-否 1-是',
  `org_lnk` varchar(20) DEFAULT NULL COMMENT '线下CRM地址',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '新建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `parent_ids` varchar(100) DEFAULT NULL,
  `mall_id` varchar(32) DEFAULT NULL COMMENT '集团ID',
  `store_id` varchar(32) DEFAULT NULL COMMENT '微信商户号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COMMENT='门店表';

-- 正在导出表  auth.ss_organization 的数据：~5 rows (大约)
DELETE FROM `ss_organization`;
/*!40000 ALTER TABLE `ss_organization` DISABLE KEYS */;
INSERT INTO `ss_organization` (`id`, `org_name`, `org_code`, `org_desc`, `org_website`, `org_pic`, `org_address`, `region_id`, `org_lng`, `org_lat`, `region`, `city`, `province`, `keywords`, `message`, `busline`, `org_rule`, `org_contact`, `org_tel`, `vip_phone`, `org_email`, `back_address`, `back_contact`, `back_tel`, `open_time`, `org_grade`, `org_rank`, `org_proinfo`, `is_mi`, `is_delete`, `org_lnk`, `createtime`, `updatetime`, `parent_id`, `parent_ids`, `mall_id`, `store_id`) VALUES
	(1, '贝瑞佳母婴服务', 'SN001', '', NULL, '', '北京市, 北京市, 东城区, 府学胡同', NULL, 116.422235, 39.941272, '东城区', '台北市', '台湾省', NULL, NULL, NULL, NULL, NULL, '987123456', NULL, NULL, NULL, NULL, NULL, '0;0', NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 16:49:01', '2015-02-07 14:10:08', 0, '0/', NULL, '1'),
	(97, '悦悦满', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 16:37:21', NULL, 1, '0/1/', NULL, NULL),
	(98, '上海', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 16:38:50', NULL, 97, '0/1/97/', NULL, NULL),
	(99, '北京', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 16:39:02', NULL, 97, '0/1/97/', NULL, NULL),
	(100, '陆家嘴', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 16:49:07', NULL, 98, '0/1/97/98/', NULL, '2');
/*!40000 ALTER TABLE `ss_organization` ENABLE KEYS */;

-- 导出  表 auth.ss_resource 结构
DROP TABLE IF EXISTS `ss_resource`;
CREATE TABLE IF NOT EXISTS `ss_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  auth.ss_resource 的数据：~32 rows (大约)
DELETE FROM `ss_resource`;
/*!40000 ALTER TABLE `ss_resource` DISABLE KEYS */;
INSERT INTO `ss_resource` (`id`, `name`, `type`, `url`, `parent_id`, `parent_ids`, `permission`, `available`) VALUES
	(1, '资源', 'menu', '', 0, '0/', '', 1),
	(82, '系统管理', 'menu', 'menus', 1, '0/1/', 'sys:*', 0),
	(83, '组织机构', 'menu', 'organization', 82, '0/1/82/', 'organization:*', 0),
	(84, '新增', 'button', '', 83, '0/1/82/83/', 'organization:create', 0),
	(85, '修改', 'button', '', 83, '0/1/82/83/', 'organization:update', 0),
	(86, '删除', 'button', '', 83, '0/1/82/83/', 'organization:delete', 0),
	(87, '查看', 'button', '', 83, '0/1/82/83/', 'organization:view', 0),
	(88, '应用管理', 'menu', 'app', 82, '0/1/82/', 'app:*', 0),
	(89, '新增', 'button', '', 88, '0/1/82/88/', 'app:create', 0),
	(90, '修改', 'button', '', 88, '0/1/82/88/', 'app:update', 0),
	(91, '删除', 'button', '', 88, '0/1/82/88/', 'app:delete', 0),
	(92, '查看', 'button', '', 88, '0/1/82/88/', 'app:view', 0),
	(93, '用户管理', 'menu', 'user', 82, '0/1/82/', 'user:*', 0),
	(94, '新增', 'button', '', 93, '0/1/82/93/', 'user:create', 0),
	(95, '修改', 'button', '', 93, '0/1/82/93/', 'user:update', 0),
	(96, '删除', 'button', '', 93, '0/1/82/93/', 'user:delete', 0),
	(97, '查看', 'button', '', 93, '0/1/82/93/', 'user:view', 0),
	(98, '菜单管理', 'menu', 'resource', 82, '0/1/82/', 'resource:*', 0),
	(99, '新增', 'button', '', 98, '0/1/82/98/', 'resource:create', 0),
	(100, '修改', 'button', '', 98, '0/1/82/98/', 'resource:update', 0),
	(101, '删除', 'button', '', 98, '0/1/82/98/', 'resource:delete', 0),
	(102, '查看', 'button', '', 98, '0/1/82/98/', 'resource:view', 0),
	(103, '角色管理', 'menu', 'role', 82, '0/1/82/', 'role:*', 0),
	(104, '新增', 'button', '', 103, '0/1/82/103/', 'role:create', 0),
	(105, '修改', 'button', '', 103, '0/1/82/103/', 'role:update', 0),
	(106, '删除', 'button', '', 103, '0/1/82/103/', 'role:delete', 0),
	(107, '查看', 'button', '', 103, '0/1/82/103/', 'role:view', 0),
	(108, '授权管理', 'menu', 'authorization', 82, '0/1/82/', 'authorization:*', 0),
	(109, '新增', 'button', '', 108, '0/1/82/108/', 'authorization:create', 0),
	(110, '修改', 'button', '', 108, '0/1/82/108/', 'authorization:update', 0),
	(111, '删除', 'button', '', 108, '0/1/82/108/', 'authorization:delete', 0),
	(112, '查看', 'button', '', 108, '0/1/82/108/', 'authorization:view', 0);
/*!40000 ALTER TABLE `ss_resource` ENABLE KEYS */;

-- 导出  表 auth.ss_role 结构
DROP TABLE IF EXISTS `ss_role`;
CREATE TABLE IF NOT EXISTS `ss_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(500) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  auth.ss_role 的数据：~2 rows (大约)
DELETE FROM `ss_role`;
/*!40000 ALTER TABLE `ss_role` DISABLE KEYS */;
INSERT INTO `ss_role` (`id`, `role`, `description`, `resource_ids`, `available`) VALUES
	(1, 'superAdmin', '超级管理员', '82,83,88,93,98,103,108,117', 1),
	(10, '悦悦满管理员', '悦悦满管理员', '82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112', 0);
/*!40000 ALTER TABLE `ss_role` ENABLE KEYS */;

-- 导出  表 auth.ss_role_resource 结构
DROP TABLE IF EXISTS `ss_role_resource`;
CREATE TABLE IF NOT EXISTS `ss_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- 正在导出表  auth.ss_role_resource 的数据：~14 rows (大约)
DELETE FROM `ss_role_resource`;
/*!40000 ALTER TABLE `ss_role_resource` DISABLE KEYS */;
INSERT INTO `ss_role_resource` (`id`, `role_id`, `resource_id`) VALUES
	(8, 1, 82),
	(9, 1, 83),
	(10, 1, 88),
	(11, 1, 93),
	(12, 1, 98),
	(13, 1, 103),
	(14, 1, 108),
	(15, 1, 117),
	(16, 10, 82),
	(17, 10, 83),
	(18, 10, 84),
	(19, 10, 85),
	(20, 10, 86),
	(21, 10, 87),
	(22, 10, 88),
	(23, 10, 89),
	(24, 10, 90),
	(25, 10, 91),
	(26, 10, 92),
	(27, 10, 93),
	(28, 10, 94),
	(29, 10, 95),
	(30, 10, 96),
	(31, 10, 97),
	(32, 10, 98),
	(33, 10, 99),
	(34, 10, 100),
	(35, 10, 101),
	(36, 10, 102),
	(37, 10, 103),
	(38, 10, 104),
	(39, 10, 105),
	(40, 10, 106),
	(41, 10, 107),
	(42, 10, 108),
	(43, 10, 109),
	(44, 10, 110),
	(45, 10, 111),
	(46, 10, 112);
/*!40000 ALTER TABLE `ss_role_resource` ENABLE KEYS */;

-- 导出  表 auth.ss_user 结构
DROP TABLE IF EXISTS `ss_user`;
CREATE TABLE IF NOT EXISTS `ss_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_user_username` (`username`),
  KEY `idx_sys_user_organization_id` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  auth.ss_user 的数据：~2 rows (大约)
DELETE FROM `ss_user`;
/*!40000 ALTER TABLE `ss_user` DISABLE KEYS */;
INSERT INTO `ss_user` (`id`, `organization_id`, `username`, `password`, `salt`, `locked`) VALUES
	(1, 1, 'admin', '20e3e4976998a8abafa3dd401c9e8a81', '3b83c03c477f11f21614388c7810045b', 0),
	(65, 100, 'yangchao', 'ee40bfdbdd9d6919df30f5e410b426d0', 'c894c1f9fe449110e405b754befb0655', 0);
/*!40000 ALTER TABLE `ss_user` ENABLE KEYS */;

-- 导出  表 auth.ss_user_app_roles 结构
DROP TABLE IF EXISTS `ss_user_app_roles`;
CREATE TABLE IF NOT EXISTS `ss_user_app_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `role_ids` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_app_roles_user_id_app_id` (`user_id`,`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  auth.ss_user_app_roles 的数据：~2 rows (大约)
DELETE FROM `ss_user_app_roles`;
/*!40000 ALTER TABLE `ss_user_app_roles` DISABLE KEYS */;
INSERT INTO `ss_user_app_roles` (`id`, `user_id`, `app_id`, `role_ids`) VALUES
	(1, 1, 1, '1'),
	(21, 65, 1, '10');
/*!40000 ALTER TABLE `ss_user_app_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
