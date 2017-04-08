# SQL Manager 2007 for MySQL 4.3.3.2
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : authority


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `authority`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `authority`;

#
# Structure for the `company` table : 
#

CREATE TABLE `company` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `status` INTEGER(11) DEFAULT NULL,
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)

)ENGINE=InnoDB
AUTO_INCREMENT=50 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `company_authority` table : 
#

CREATE TABLE `company_authority` (
  `id` INTEGER(11) NOT NULL,
  `system_code` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `company_id` INTEGER(11) DEFAULT NULL,
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `FK_c_a_SystemCode` (`system_code`),
  KEY `FK_c_a_CompanyId` (`company_id`)

)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `module` table : 
#

CREATE TABLE `module` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `system_code` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统代码',
  `module_code` VARCHAR(20) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_code` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '上级模块',
  `name` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '模块名称',
  `type` INTEGER(11) DEFAULT NULL COMMENT '模块类型',
  `Module_order` INTEGER(11) DEFAULT NULL COMMENT '排序',
  `parameter` VARCHAR(128) COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `url` VARCHAR(128) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'url',
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`module_code`),
  UNIQUE KEY `FK_MODULE_ID` (`id`),
  KEY `FK_Reference_5` (`system_code`),
  KEY `id` (`id`, `module_code`)

)ENGINE=InnoDB
AUTO_INCREMENT=308 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `organization` table : 
#

CREATE TABLE `organization` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `parent_id` INTEGER(11) DEFAULT NULL COMMENT '上级部门ID',
  `company_id` INTEGER(11) DEFAULT NULL,
  `name` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `type` INTEGER(11) DEFAULT NULL COMMENT '部门类型',
  `status` INTEGER(11) DEFAULT '1' COMMENT '状态',
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)

)ENGINE=InnoDB
AUTO_INCREMENT=30 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='组织信息表';

#
# Structure for the `position` table : 
#

CREATE TABLE `position` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `company_id` INTEGER(11) DEFAULT NULL,
  `dep_id` INTEGER(11) DEFAULT NULL COMMENT '部门编号',
  `parent_id` INTEGER(11) DEFAULT NULL COMMENT '上级岗位',
  `status` INTEGER(11) DEFAULT '1' COMMENT '状态',
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`parent_id`)

)ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `role` table : 
#

CREATE TABLE `role` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `system_code` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统代码',
  `dep_juri_type` INTEGER(11) DEFAULT NULL COMMENT '组织管辖类型',
  `dep_juri` VARCHAR(500) COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织管辖范围',
  `system_juri_type` INTEGER(11) DEFAULT NULL COMMENT '系统管辖类型',
  `system_juri` VARCHAR(500) COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统管辖范围',
  `status` INTEGER(11) DEFAULT '1' COMMENT '状态',
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`system_code`)

)ENGINE=InnoDB
AUTO_INCREMENT=56 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `role_authority` table : 
#

CREATE TABLE `role_authority` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `role_id` INTEGER(11) DEFAULT NULL COMMENT '角色编号',
  `system_code` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统代码',
  `module_id` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '模块编号',
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_7` (`role_id`),
  KEY `FK_Reference_8` (`system_code`),
  KEY `FK_Reference_9` (`module_id`)

)ENGINE=InnoDB
AUTO_INCREMENT=2498 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `sequence` table : 
#

CREATE TABLE `sequence` (
  `name` VARCHAR(50) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `current_value` INTEGER(11) NOT NULL,
  `increment` INTEGER(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)

)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `system` table : 
#

CREATE TABLE `system` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统名称',
  `url` VARCHAR(128) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'url',
  `code` VARCHAR(20) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统代码',
  `status` INTEGER(11) DEFAULT '1' COMMENT '状态',
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`code`),
  UNIQUE KEY `FK_SYSTEM_ID` (`id`)

)ENGINE=InnoDB
AUTO_INCREMENT=52 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `user` table : 
#

CREATE TABLE `user` (
  `sequence_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(32) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `company_id` INTEGER(11) DEFAULT NULL,
  `dep_id` INTEGER(11) DEFAULT NULL COMMENT '部门编号',
  `position_id` INTEGER(11) DEFAULT NULL COMMENT '岗位编号',
  `real_name` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `sex` INTEGER(11) DEFAULT NULL COMMENT '性别',
  `id_card` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  `username` VARCHAR(64) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录名',
  `password` VARCHAR(128) COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `mobile` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '座机号码',
  `status` INTEGER(11) DEFAULT '1' COMMENT '状态',
  `orig_system_code` VARCHAR(64) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原系统代码',
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`username`, `orig_system_code`, `id`),
  KEY `FK_Reference_3` (`dep_id`),
  KEY `FK_Reference_4` (`position_id`),
  KEY `FK_CompanyId` (`company_id`),
  KEY `FK_SequenceId` (`sequence_id`)

)ENGINE=InnoDB
AUTO_INCREMENT=76 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `user_role` table : 
#

CREATE TABLE `user_role` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `system_code` VARCHAR(32) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统代码',
  `role_id` INTEGER(11) NOT NULL COMMENT '角色编号',
  `username` VARCHAR(64) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `oper_user` VARCHAR(64) COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `oper_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`system_code`, `role_id`, `username`),
  UNIQUE KEY `FK_USER_ROLD_ID` (`id`),
  KEY `FK_Reference_10` (`username`),
  KEY `FK_Reference_11` (`role_id`)

)ENGINE=InnoDB
AUTO_INCREMENT=228 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Definition for the `currval` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `currval`(seq_name VARCHAR(50))
    RETURNS int(11)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
 DECLARE value INTEGER; 
 SET value = 0; 
 SELECT current_value INTO value 
 FROM sequence
 WHERE name = seq_name; 
 RETURN value; 
END;

#
# Definition for the `setval` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `setval`(seq_name VARCHAR(50), value INTEGER)
    RETURNS int(11)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
 UPDATE sequence
 SET current_value = value 
 WHERE name = seq_name; 
 RETURN currval(seq_name); 
END;

#
# Definition for the `_nextval` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `_nextval`(seq_name VARCHAR(50))
    RETURNS int(11)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
 UPDATE sequence
 SET current_value = current_value + increment 
 WHERE name = seq_name; 
 RETURN currval(seq_name); 
END;

#
# Data for the `company` table  (LIMIT 0,500)
#

INSERT INTO `company` (`id`, `name`, `status`, `oper_user`, `oper_time`) VALUES
  (20,'北京中信国安建筑科技有限公司',1,'lanyt','2015-09-06 10:17:14'),
  (49,'北京中信国安',1,'lanyt','2015-09-06 10:18:31');
COMMIT;

#
# Data for the `module` table  (LIMIT 0,500)
#

INSERT INTO `module` (`id`, `system_code`, `module_code`, `parent_code`, `name`, `type`, `Module_order`, `parameter`, `url`, `oper_user`, `oper_time`) VALUES
  (40,'QX','QX01','QX','组织管理',1,1,'','',NULL,'2015-06-24 11:20:31'),
  (41,'QX','QX0101','QX01','公司管理',1,0,'1','/company/manager',NULL,'2015-06-25 17:35:57'),
  (86,'QX','QX010101','QX0101','添加',1,0,'','/company/insert',NULL,'2015-06-19 17:22:11'),
  (87,'QX','QX010102','QX0101','修改',1,0,'1','/company/update',NULL,'2015-06-19 17:22:41'),
  (88,'QX','QX010103','QX0101','启用/禁用',1,0,'2','/company/update',NULL,'2015-06-19 17:23:01'),
  (42,'QX','QX0102','QX01','岗位管理',1,0,'','','root','2015-08-13 12:20:16'),
  (43,'QX','QX0103','QX01','人员管理',1,4,'','/user-manager',NULL,'2015-06-24 11:20:02'),
  (53,'QX','QX010301','QX0103','添加',0,0,'1','/user-manager-update',NULL,'2015-06-18 15:46:15'),
  (54,'QX','QX010302','QX0103','修改',0,0,'2','/user-manager-update',NULL,'2015-06-18 15:46:18'),
  (55,'QX','QX010303','QX0103','启用/禁用',0,0,'','/user-manager-updateStatus',NULL,'2015-06-18 15:53:06'),
  (64,'QX','QX010304','QX0103','用户保存',0,0,'','/user-manager-add',NULL,'2015-06-18 15:13:13'),
  (307,'QX','QX010305','QX0103','重置密码',1,0,'','/user-reset-password','root','2015-07-30 10:46:09'),
  (52,'QX','QX0104','QX01','部门管理',1,2,'','/depart/manager',NULL,'2015-06-25 12:02:09'),
  (89,'QX','QX010401','QX0104','添加',0,0,'','/depart/insert',NULL,'2015-06-25 14:20:12'),
  (90,'QX','QX010402','QX0104','修改',0,0,'1','/depart/update',NULL,'2015-06-25 14:22:33'),
  (91,'QX','QX010403','QX0104','启用/禁用',0,0,'2','/depart/update',NULL,'2015-06-25 14:22:53'),
  (44,'QX','QX02','QX','系统管理',1,2,'','',NULL,'2015-06-24 11:20:33'),
  (45,'QX','QX0201','QX02','系统管理',1,0,'','/system/message',NULL,'2015-06-26 17:42:09'),
  (56,'QX','QX020101','QX0201','添加',0,0,'','/system/insert',NULL,'2015-06-19 17:20:10'),
  (57,'QX','QX020102','QX0201','修改',0,0,'1','/system/update',NULL,'2015-06-19 17:19:01'),
  (58,'QX','QX020103','QX0201','启用/禁用',0,0,'2','/system/update',NULL,'2015-06-19 17:19:18'),
  (46,'QX','QX0202','QX02','模块管理',1,2,'','/module/treeview',NULL,'2015-06-24 11:20:38'),
  (59,'QX','QX020201','QX0202','添加',0,0,'','/module/insert',NULL,'2015-06-19 17:12:35'),
  (60,'QX','QX020202','QX0202','修改',0,0,'','/module/update',NULL,'2015-06-19 17:14:32'),
  (61,'QX','QX020203','QX0202','删除',0,0,'','/module/delete',NULL,'2015-06-19 17:14:49'),
  (47,'QX','QX03','QX','权限管理',1,3,'','',NULL,'2015-06-24 11:20:43'),
  (48,'QX','QX0301','QX03','角色管理',1,1,'','/role-manager',NULL,'2016-04-25 18:01:41'),
  (71,'QX','QX030101','QX0301','添加',0,0,'','/role/insert',NULL,'2015-06-18 15:38:47'),
  (72,'QX','QX030102','QX0301','修改',0,0,'','/role/update',NULL,'2015-06-18 14:39:58'),
  (73,'QX','QX030103','QX0301','删除',0,0,'','/role/delete',NULL,'2015-06-18 14:40:19'),
  (49,'QX','QX0302','QX03','角色权限管理',1,2,'','/roleAuthority-manager',NULL,'2016-04-25 18:01:10'),
  (74,'QX','QX030201','QX0302','提交',0,0,'','/roleAuthority/saveOrUpdateRoleAuthority',NULL,'2015-06-18 14:53:03'),
  (50,'QX','QX0303','QX03','按人员赋权',1,0,'','/personnel/manager','root','2015-07-30 10:35:56'),
  (51,'QX','QX0304','QX03','按角色赋权',1,4,'','/authorize-user',NULL,'2015-06-24 11:20:54'),
  (69,'QX','QX030401','QX0304','添加用户',0,0,'','/authorize-user-addUser',NULL,'2015-06-17 18:19:50'),
  (70,'QX','QX030402','QX0304','删除用户',0,0,'','/authorize-user-delUser',NULL,'2015-06-18 15:58:15');
COMMIT;

#
# Data for the `organization` table  (LIMIT 0,500)
#

INSERT INTO `organization` (`id`, `parent_id`, `company_id`, `name`, `type`, `status`, `oper_user`, `oper_time`) VALUES
  (3,0,20,'技术部',NULL,1,'qwa','2015-07-20 15:59:55'),
  (27,0,50,'财务部门',NULL,1,'gaojp','2015-09-21 15:14:00'),
  (28,0,49,'财务中心',NULL,1,'gaojp','2015-09-22 17:16:36'),
  (29,0,49,'技术部',NULL,1,'gaojp','2015-09-22 17:16:47');
COMMIT;

#
# Data for the `role` table  (LIMIT 0,500)
#

INSERT INTO `role` (`id`, `name`, `system_code`, `dep_juri_type`, `dep_juri`, `system_juri_type`, `system_juri`, `status`, `oper_user`, `oper_time`) VALUES
  (16,'管理员','QX',NULL,NULL,NULL,NULL,1,NULL,'2015-06-25 17:31:49'),
  (21,'客服测试角色','KF',NULL,NULL,NULL,NULL,1,'root','2015-08-14 16:17:33'),
  (27,'后台客服','KF',NULL,NULL,NULL,NULL,1,NULL,'2015-07-08 17:01:12'),
  (32,'11','KF',NULL,NULL,NULL,NULL,1,'root','2015-07-21 14:48:36'),
  (33,'财务角色','CW',NULL,NULL,NULL,NULL,1,'root','2015-07-30 10:34:16'),
  (34,'管理员','WOFE',NULL,NULL,NULL,NULL,1,'hello2','2015-08-03 12:21:53'),
  (37,'leimu2.0基础数据管理2','LM',NULL,NULL,NULL,NULL,1,NULL,'2016-03-07 11:28:29'),
  (39,'leimu3类目管理','LM',NULL,NULL,NULL,NULL,1,'root','2015-08-04 12:05:30'),
  (48,'1级管理','QX',NULL,NULL,NULL,NULL,1,'root','2015-08-21 11:01:53'),
  (49,'DEV','QX',NULL,NULL,NULL,NULL,1,'root','2015-08-24 10:35:32'),
  (51,'管理员','LM',NULL,NULL,NULL,NULL,1,'gaojp','2015-08-26 13:45:57'),
  (53,'管理员','CW',NULL,NULL,NULL,NULL,1,'gaojp','2015-08-26 13:46:11'),
  (54,'test','WOFE',NULL,NULL,NULL,NULL,1,'hello2','2015-09-23 14:18:07'),
  (55,'test','CW',NULL,NULL,NULL,NULL,1,'hello2','2016-03-07 13:32:37');
COMMIT;

#
# Data for the `role_authority` table  (LIMIT 0,500)
#

INSERT INTO `role_authority` (`id`, `role_id`, `system_code`, `module_id`, `oper_user`, `oper_time`) VALUES
  (423,16,'QX','QX03',NULL,'2015-07-06 14:28:11'),
  (431,16,'QX','QX0304',NULL,'2015-07-06 14:28:11'),
  (432,16,'QX','QX030401',NULL,'2015-07-06 14:28:11'),
  (433,16,'QX','QX030402',NULL,'2015-07-06 14:28:11'),
  (459,21,'KF','KF01',NULL,'2015-07-07 17:30:12'),
  (460,21,'KF','KF0101',NULL,'2015-07-07 17:30:12'),
  (473,21,'KF','KF02',NULL,'2015-07-07 17:30:12'),
  (474,21,'KF','KF0201',NULL,'2015-07-07 17:30:12'),
  (497,21,'KF','KF010102',NULL,'2015-07-08 12:33:03'),
  (498,21,'KF','KF010101',NULL,'2015-07-08 12:33:40'),
  (499,21,'KF','KF010103',NULL,'2015-07-08 12:33:58'),
  (501,21,'KF','KF010108',NULL,'2015-07-08 12:34:45'),
  (502,21,'KF','KF010109',NULL,'2015-07-08 12:34:45'),
  (503,21,'KF','KF010107',NULL,'2015-07-08 12:36:11'),
  (504,21,'KF','KF010110',NULL,'2015-07-08 12:36:11'),
  (507,21,'KF','KF010104',NULL,'2015-07-08 15:15:28'),
  (508,21,'KF','KF010106',NULL,'2015-07-08 15:15:28'),
  (527,27,'KF','KF01',NULL,'2015-07-08 17:01:32'),
  (528,27,'KF','KF0101',NULL,'2015-07-08 17:01:32'),
  (539,27,'KF','KF02',NULL,'2015-07-08 17:01:32'),
  (540,27,'KF','KF0201',NULL,'2015-07-08 17:01:32'),
  (542,27,'KF','KF010101',NULL,'2015-07-10 14:25:39'),
  (543,27,'KF','KF010102',NULL,'2015-07-10 14:25:39'),
  (544,27,'KF','KF010103',NULL,'2015-07-10 14:25:39'),
  (545,27,'KF','KF010104',NULL,'2015-07-10 14:25:39'),
  (547,27,'KF','KF010106',NULL,'2015-07-10 14:25:39'),
  (548,27,'KF','KF010107',NULL,'2015-07-10 14:25:39'),
  (549,27,'KF','KF010108',NULL,'2015-07-10 14:25:39'),
  (550,27,'KF','KF010109',NULL,'2015-07-10 14:25:39'),
  (551,27,'KF','KF010110',NULL,'2015-07-10 14:25:39'),
  (563,33,'CW','CW01','root','2015-07-30 10:34:25'),
  (564,33,'CW','CW0101','root','2015-07-30 10:34:25'),
  (569,33,'CW','CW0103','root','2015-07-30 10:34:25'),
  (570,33,'CW','CW010301','root','2015-07-30 10:34:25'),
  (572,33,'CW','CW0104','root','2015-07-30 10:34:25'),
  (573,33,'CW','CW010401','root','2015-07-30 10:34:25'),
  (575,33,'CW','CW0105','root','2015-07-30 10:34:25'),
  (576,33,'CW','CW010501','root','2015-07-30 10:34:25'),
  (578,33,'CW','CW0106','root','2015-07-30 10:34:25'),
  (579,33,'CW','CW010601','root','2015-07-30 10:34:25'),
  (580,33,'CW','CW010602','root','2015-07-30 10:34:25'),
  (581,33,'CW','CW010603','root','2015-07-30 10:34:25'),
  (582,33,'CW','CW0107','root','2015-07-30 10:34:25'),
  (586,34,'WOFE','WOFE01','hello2','2015-08-03 12:22:06'),
  (635,34,'WOFE','WOFE03','hello2','2015-08-03 12:22:06'),
  (636,34,'WOFE','WOFE0301','hello2','2015-08-03 12:22:06'),
  (637,34,'WOFE','WOFE030101','hello2','2015-08-03 12:22:06'),
  (638,34,'WOFE','WOFE03010101','hello2','2015-08-03 12:22:06'),
  (639,34,'WOFE','WOFE03010102','hello2','2015-08-03 12:22:06'),
  (640,34,'WOFE','WOFE03010103','hello2','2015-08-03 12:22:06'),
  (641,34,'WOFE','WOFE03010104','hello2','2015-08-03 12:22:06'),
  (642,34,'WOFE','WOFE030102','hello2','2015-08-03 12:22:06'),
  (643,34,'WOFE','WOFE03010201','hello2','2015-08-03 12:22:06'),
  (644,34,'WOFE','WOFE03010202','hello2','2015-08-03 12:22:06'),
  (645,34,'WOFE','WOFE03010203','hello2','2015-08-03 12:22:06'),
  (646,34,'WOFE','WOFE03010204','hello2','2015-08-03 12:22:06'),
  (647,34,'WOFE','WOFE04','hello2','2015-08-03 12:22:06'),
  (648,34,'WOFE','WOFE0401','hello2','2015-08-03 12:22:06'),
  (649,34,'WOFE','WOFE040101','hello2','2015-08-03 12:22:06'),
  (650,34,'WOFE','WOFE04010101','hello2','2015-08-03 12:22:06'),
  (651,34,'WOFE','WOFE04010102','hello2','2015-08-03 12:22:06'),
  (652,34,'WOFE','WOFE04010103','hello2','2015-08-03 12:22:06'),
  (653,34,'WOFE','WOFE04010104','hello2','2015-08-03 12:22:06'),
  (654,34,'WOFE','WOFE04010105','hello2','2015-08-03 12:22:06'),
  (655,34,'WOFE','WOFE04010106','hello2','2015-08-03 12:22:06'),
  (656,34,'WOFE','WOFE04010107','hello2','2015-08-03 12:22:06'),
  (657,34,'WOFE','WOFE04010108','hello2','2015-08-03 12:22:06'),
  (658,34,'WOFE','WOFE04010109','hello2','2015-08-03 12:22:06'),
  (659,34,'WOFE','WOFE04010110','hello2','2015-08-03 12:22:06'),
  (660,34,'WOFE','WOFE04010111','hello2','2015-08-03 12:22:06'),
  (661,34,'WOFE','WOFE04010112','hello2','2015-08-03 12:22:06'),
  (662,34,'WOFE','WOFE04010113','hello2','2015-08-03 12:22:06'),
  (663,34,'WOFE','WOFE04010114','hello2','2015-08-03 12:22:06'),
  (664,34,'WOFE','WOFE04010115','hello2','2015-08-03 12:22:06'),
  (665,34,'WOFE','WOFE04010116','hello2','2015-08-03 12:22:06'),
  (666,34,'WOFE','WOFE04010117','hello2','2015-08-03 12:22:06'),
  (667,34,'WOFE','WOFE04010118','hello2','2015-08-03 12:22:06'),
  (668,34,'WOFE','WOFE04010119','hello2','2015-08-03 12:22:06'),
  (669,34,'WOFE','WOFE04010120','hello2','2015-08-03 12:22:06'),
  (670,34,'WOFE','WOFE04010121','hello2','2015-08-03 12:22:06'),
  (671,34,'WOFE','WOFE04010122','hello2','2015-08-03 12:22:06'),
  (672,34,'WOFE','WOFE04010123','hello2','2015-08-03 12:22:06'),
  (673,34,'WOFE','WOFE04010124','hello2','2015-08-03 12:22:06'),
  (674,34,'WOFE','WOFE04010125','hello2','2015-08-03 12:22:06'),
  (675,34,'WOFE','WOFE04010126','hello2','2015-08-03 12:22:06'),
  (676,34,'WOFE','WOFE04010127','hello2','2015-08-03 12:22:06'),
  (677,34,'WOFE','WOFE04010128','hello2','2015-08-03 12:22:06'),
  (678,34,'WOFE','WOFE040102','hello2','2015-08-03 12:22:06'),
  (679,34,'WOFE','WOFE04010201','hello2','2015-08-03 12:22:06'),
  (680,34,'WOFE','WOFE04010202','hello2','2015-08-03 12:22:06'),
  (681,34,'WOFE','WOFE04010203','hello2','2015-08-03 12:22:06'),
  (682,34,'WOFE','WOFE04010204','hello2','2015-08-03 12:22:06'),
  (683,34,'WOFE','WOFE04010205','hello2','2015-08-03 12:22:06'),
  (684,34,'WOFE','WOFE04010206','hello2','2015-08-03 12:22:06'),
  (685,34,'WOFE','WOFE04010207','hello2','2015-08-03 12:22:06'),
  (686,34,'WOFE','WOFE04010208','hello2','2015-08-03 12:22:06'),
  (687,34,'WOFE','WOFE04010209','hello2','2015-08-03 12:22:06'),
  (688,34,'WOFE','WOFE04010210','hello2','2015-08-03 12:22:06'),
  (689,34,'WOFE','WOFE04010211','hello2','2015-08-03 12:22:06'),
  (690,34,'WOFE','WOFE040103','hello2','2015-08-03 12:22:06'),
  (691,34,'WOFE','WOFE04010301','hello2','2015-08-03 12:22:06'),
  (692,34,'WOFE','WOFE04010302','hello2','2015-08-03 12:22:06'),
  (693,34,'WOFE','WOFE04010303','hello2','2015-08-03 12:22:06'),
  (694,34,'WOFE','WOFE04010304','hello2','2015-08-03 12:22:06'),
  (695,34,'WOFE','WOFE04010305','hello2','2015-08-03 12:22:06'),
  (696,34,'WOFE','WOFE04010306','hello2','2015-08-03 12:22:06'),
  (697,34,'WOFE','WOFE0402','hello2','2015-08-03 12:22:06'),
  (698,34,'WOFE','WOFE040201','hello2','2015-08-03 12:22:06'),
  (699,34,'WOFE','WOFE04020101','hello2','2015-08-03 12:22:06'),
  (700,34,'WOFE','WOFE04020102','hello2','2015-08-03 12:22:06'),
  (701,34,'WOFE','WOFE04020103','hello2','2015-08-03 12:22:06'),
  (702,34,'WOFE','WOFE040202','hello2','2015-08-03 12:22:06'),
  (703,34,'WOFE','WOFE04020201','hello2','2015-08-03 12:22:06'),
  (704,34,'WOFE','WOFE04020202','hello2','2015-08-03 12:22:06'),
  (705,34,'WOFE','WOFE040203','hello2','2015-08-03 12:22:06'),
  (706,34,'WOFE','WOFE04020301','hello2','2015-08-03 12:22:06'),
  (707,34,'WOFE','WOFE04020302','hello2','2015-08-03 12:22:06'),
  (708,34,'WOFE','WOFE04020303','hello2','2015-08-03 12:22:06'),
  (709,34,'WOFE','WOFE040204','hello2','2015-08-03 12:22:06'),
  (710,34,'WOFE','WOFE040205','hello2','2015-08-03 12:22:06'),
  (711,34,'WOFE','WOFE04020501','hello2','2015-08-03 12:22:06'),
  (712,34,'WOFE','WOFE04020502','hello2','2015-08-03 12:22:06'),
  (713,34,'WOFE','WOFE04020503','hello2','2015-08-03 12:22:06'),
  (714,34,'WOFE','WOFE040206','hello2','2015-08-03 12:22:06'),
  (715,34,'WOFE','WOFE04020601','hello2','2015-08-03 12:22:06'),
  (716,34,'WOFE','WOFE0403','hello2','2015-08-03 12:22:06'),
  (717,34,'WOFE','WOFE040301','hello2','2015-08-03 12:22:06'),
  (718,34,'WOFE','WOFE04030101','hello2','2015-08-03 12:22:06'),
  (719,34,'WOFE','WOFE0404','hello2','2015-08-03 12:22:06'),
  (720,34,'WOFE','WOFE040401','hello2','2015-08-03 12:22:06'),
  (721,34,'WOFE','WOFE0405','hello2','2015-08-03 12:22:06'),
  (722,34,'WOFE','WOFE040501','hello2','2015-08-03 12:22:06'),
  (723,34,'WOFE','WOFE04050101','hello2','2015-08-03 12:22:06'),
  (724,34,'WOFE','WOFE04050102','hello2','2015-08-03 12:22:06'),
  (725,34,'WOFE','WOFE04050103','hello2','2015-08-03 12:22:06'),
  (726,34,'WOFE','WOFE04050104','hello2','2015-08-03 12:22:06'),
  (727,34,'WOFE','WOFE040502','hello2','2015-08-03 12:22:06'),
  (728,34,'WOFE','WOFE04050201','hello2','2015-08-03 12:22:06'),
  (729,34,'WOFE','WOFE04050202','hello2','2015-08-03 12:22:06'),
  (730,34,'WOFE','WOFE04050203','hello2','2015-08-03 12:22:06'),
  (731,34,'WOFE','WOFE04050204','hello2','2015-08-03 12:22:06'),
  (732,34,'WOFE','WOFE0406','hello2','2015-08-03 12:22:06'),
  (733,34,'WOFE','WOFE040601','hello2','2015-08-03 12:22:06'),
  (734,34,'WOFE','WOFE040602','hello2','2015-08-03 12:22:06'),
  (735,34,'WOFE','WOFE040603','hello2','2015-08-03 12:22:06'),
  (736,34,'WOFE','WOFE040604','hello2','2015-08-03 12:22:06'),
  (737,34,'WOFE','WOFE040605','hello2','2015-08-03 12:22:06'),
  (738,34,'WOFE','WOFE040606','hello2','2015-08-03 12:22:06'),
  (739,34,'WOFE','WOFE040607','hello2','2015-08-03 12:22:06'),
  (740,34,'WOFE','WOFE040608','hello2','2015-08-03 12:22:06'),
  (741,34,'WOFE','WOFE040609','hello2','2015-08-03 12:22:06'),
  (742,34,'WOFE','WOFE040610','hello2','2015-08-03 12:22:06'),
  (743,34,'WOFE','WOFE040611','hello2','2015-08-03 12:22:06'),
  (744,34,'WOFE','WOFE040612','hello2','2015-08-03 12:22:06'),
  (745,34,'WOFE','WOFE040613','hello2','2015-08-03 12:22:06'),
  (746,34,'WOFE','WOFE0407','hello2','2015-08-03 12:22:06'),
  (747,34,'WOFE','WOFE040701','hello2','2015-08-03 12:22:06'),
  (748,34,'WOFE','WOFE040702','hello2','2015-08-03 12:22:06'),
  (749,34,'WOFE','WOFE040703','hello2','2015-08-03 12:22:06'),
  (750,34,'WOFE','WOFE040704','hello2','2015-08-03 12:22:06'),
  (751,34,'WOFE','WOFE040705','hello2','2015-08-03 12:22:06'),
  (752,34,'WOFE','WOFE040706','hello2','2015-08-03 12:22:06'),
  (753,34,'WOFE','WOFE040707','hello2','2015-08-03 12:22:06'),
  (754,34,'WOFE','WOFE0408','hello2','2015-08-03 12:22:06'),
  (755,34,'WOFE','WOFE040801','hello2','2015-08-03 12:22:06'),
  (756,34,'WOFE','WOFE0409','hello2','2015-08-03 12:22:06'),
  (757,34,'WOFE','WOFE040901','hello2','2015-08-03 12:22:06'),
  (758,34,'WOFE','WOFE040902','hello2','2015-08-03 12:22:06'),
  (759,34,'WOFE','WOFE0410','hello2','2015-08-03 12:22:06'),
  (760,34,'WOFE','WOFE041001','hello2','2015-08-03 12:22:06'),
  (761,34,'WOFE','WOFE041002','hello2','2015-08-03 12:22:06'),
  (762,34,'WOFE','WOFE0411','hello2','2015-08-03 12:22:06'),
  (763,34,'WOFE','WOFE0412','hello2','2015-08-03 12:22:06'),
  (764,34,'WOFE','WOFE05','hello2','2015-08-03 12:22:06'),
  (765,34,'WOFE','WOFE0501','hello2','2015-08-03 12:22:06'),
  (766,34,'WOFE','WOFE050101','hello2','2015-08-03 12:22:06'),
  (767,34,'WOFE','WOFE05010101','hello2','2015-08-03 12:22:06'),
  (768,34,'WOFE','WOFE05010102','hello2','2015-08-03 12:22:06'),
  (769,34,'WOFE','WOFE05010103','hello2','2015-08-03 12:22:06'),
  (770,34,'WOFE','WOFE05010104','hello2','2015-08-03 12:22:06'),
  (771,34,'WOFE','WOFE050102','hello2','2015-08-03 12:22:06'),
  (772,34,'WOFE','WOFE050103','hello2','2015-08-03 12:22:06'),
  (773,34,'WOFE','WOFE0502','hello2','2015-08-03 12:22:06'),
  (774,34,'WOFE','WOFE050201','hello2','2015-08-03 12:22:06'),
  (775,34,'WOFE','WOFE05020101','hello2','2015-08-03 12:22:06'),
  (776,34,'WOFE','WOFE05020102','hello2','2015-08-03 12:22:06'),
  (777,34,'WOFE','WOFE05020103','hello2','2015-08-03 12:22:06'),
  (778,34,'WOFE','WOFE050202','hello2','2015-08-03 12:22:06'),
  (784,34,'WOFE','WOFE050205','hello2','2015-08-03 12:22:06'),
  (885,39,'LM','LM01','root','2015-08-04 12:05:45'),
  (886,39,'LM','LM0101','root','2015-08-04 12:05:45'),
  (887,39,'LM','LM010101','root','2015-08-04 12:05:45'),
  (888,39,'LM','LM010102','root','2015-08-04 12:05:45'),
  (889,39,'LM','LM010103','root','2015-08-04 12:05:45'),
  (890,39,'LM','LM010104','root','2015-08-04 12:05:45'),
  (891,39,'LM','LM010105','root','2015-08-04 12:05:45'),
  (892,39,'LM','LM01010501','root','2015-08-04 12:05:45'),
  (893,39,'LM','LM01010502','root','2015-08-04 12:05:45'),
  (894,39,'LM','LM01010503','root','2015-08-04 12:05:45'),
  (895,39,'LM','LM01010504','root','2015-08-04 12:05:45'),
  (896,39,'LM','LM0101050401','root','2015-08-04 12:05:45'),
  (897,39,'LM','LM0101050402','root','2015-08-04 12:05:45'),
  (898,39,'LM','LM0101050403','root','2015-08-04 12:05:45'),
  (899,39,'LM','LM01010505','root','2015-08-04 12:05:45'),
  (900,39,'LM','LM01010506','root','2015-08-04 12:05:45'),
  (901,39,'LM','LM0102','root','2015-08-04 12:05:45'),
  (902,39,'LM','LM010201','root','2015-08-04 12:05:45'),
  (903,39,'LM','LM010202','root','2015-08-04 12:05:45'),
  (904,39,'LM','LM010203','root','2015-08-04 12:05:45'),
  (905,39,'LM','LM010204','root','2015-08-04 12:05:45'),
  (906,39,'LM','LM01020401','root','2015-08-04 12:05:45'),
  (907,39,'LM','LM0102040101','root','2015-08-04 12:05:45'),
  (908,39,'LM','LM0102040102','root','2015-08-04 12:05:45'),
  (909,39,'LM','LM010204010201','root','2015-08-04 12:05:45'),
  (910,39,'LM','LM0102040103','root','2015-08-04 12:05:45'),
  (911,39,'LM','LM0102040104','root','2015-08-04 12:05:45'),
  (912,39,'LM','LM01020402','root','2015-08-04 12:05:45'),
  (913,39,'LM','LM010205','root','2015-08-04 12:05:45'),
  (914,39,'LM','LM01020501','root','2015-08-04 12:05:45'),
  (915,39,'LM','LM01020502','root','2015-08-04 12:05:45'),
  (916,39,'LM','LM010206','root','2015-08-04 12:05:45'),
  (917,39,'LM','LM010207','root','2015-08-04 12:05:45'),
  (918,39,'LM','LM010208','root','2015-08-04 12:05:45'),
  (919,39,'LM','LM0103','root','2015-08-04 12:05:45'),
  (920,39,'LM','LM010301','root','2015-08-04 12:05:45'),
  (921,39,'LM','LM010302','root','2015-08-04 12:05:45'),
  (922,39,'LM','LM010303','root','2015-08-04 12:05:45'),
  (923,39,'LM','LM01030301','root','2015-08-04 12:05:45'),
  (924,39,'LM','LM0103030101','root','2015-08-04 12:05:45'),
  (925,39,'LM','LM01030302','root','2015-08-04 12:05:45'),
  (926,39,'LM','LM01030303','root','2015-08-04 12:05:45'),
  (927,39,'LM','LM0103030301','root','2015-08-04 12:05:45'),
  (928,39,'LM','LM0103030302','root','2015-08-04 12:05:45'),
  (929,39,'LM','LM0103030303','root','2015-08-04 12:05:45'),
  (930,39,'LM','LM010303030301','root','2015-08-04 12:05:45'),
  (931,39,'LM','LM010303030302','root','2015-08-04 12:05:45'),
  (932,39,'LM','LM0103030304','root','2015-08-04 12:05:45'),
  (933,39,'LM','LM010304','root','2015-08-04 12:05:45'),
  (934,39,'LM','LM010305','root','2015-08-04 12:05:45'),
  (935,39,'LM','LM010306','root','2015-08-04 12:05:45'),
  (936,39,'LM','LM010307','root','2015-08-04 12:05:45'),
  (937,39,'LM','LM010308','root','2015-08-04 12:05:45'),
  (938,39,'LM','LM010309','root','2015-08-04 12:05:45'),
  (939,39,'LM','LM0104','root','2015-08-04 12:05:45'),
  (940,39,'LM','LM010401','root','2015-08-04 12:05:45'),
  (941,39,'LM','LM010402','root','2015-08-04 12:05:45'),
  (942,39,'LM','LM010403','root','2015-08-04 12:05:45'),
  (943,39,'LM','LM01040301','root','2015-08-04 12:05:45'),
  (944,39,'LM','LM01040302','root','2015-08-04 12:05:45'),
  (945,39,'LM','LM01040303','root','2015-08-04 12:05:45'),
  (946,39,'LM','LM01040304','root','2015-08-04 12:05:45'),
  (947,39,'LM','LM01040305','root','2015-08-04 12:05:45'),
  (948,39,'LM','LM010404','root','2015-08-04 12:05:45'),
  (949,39,'LM','LM010405','root','2015-08-04 12:05:45'),
  (950,39,'LM','LM010406','root','2015-08-04 12:05:45'),
  (951,39,'LM','LM05','root','2015-08-04 14:36:21'),
  (952,39,'LM','LM0501','root','2015-08-04 14:36:21'),
  (953,39,'LM','LM050101','root','2015-08-04 14:36:21'),
  (954,39,'LM','LM050102','root','2015-08-04 14:36:21'),
  (955,39,'LM','LM05010201','root','2015-08-04 14:36:21'),
  (956,39,'LM','LM05010202','root','2015-08-04 14:36:21'),
  (957,39,'LM','LM05010203','root','2015-08-04 14:36:21'),
  (958,39,'LM','LM05010204','root','2015-08-04 14:36:21'),
  (959,39,'LM','LM050103','root','2015-08-04 14:36:21'),
  (960,39,'LM','LM050104','root','2015-08-04 14:36:21'),
  (961,39,'LM','LM05010401','root','2015-08-04 14:36:21'),
  (962,39,'LM','LM050105','root','2015-08-04 14:36:21'),
  (1302,33,'CW','CW010402','root','2015-08-05 17:00:11'),
  (1305,37,'LM','LM01','zhxy','2015-08-05 17:55:38'),
  (1306,37,'LM','LM0101','zhxy','2015-08-05 17:55:38'),
  (1307,37,'LM','LM010101','zhxy','2015-08-05 17:55:38'),
  (1308,37,'LM','LM010102','zhxy','2015-08-05 17:55:38'),
  (1309,37,'LM','LM010103','zhxy','2015-08-05 17:55:38'),
  (1310,37,'LM','LM010104','zhxy','2015-08-05 17:55:38'),
  (1311,37,'LM','LM010105','zhxy','2015-08-05 17:55:38'),
  (1312,37,'LM','LM01010501','zhxy','2015-08-05 17:55:38'),
  (1313,37,'LM','LM01010502','zhxy','2015-08-05 17:55:38'),
  (1314,37,'LM','LM01010503','zhxy','2015-08-05 17:55:38'),
  (1315,37,'LM','LM01010504','zhxy','2015-08-05 17:55:38'),
  (1316,37,'LM','LM0101050401','zhxy','2015-08-05 17:55:38'),
  (1317,37,'LM','LM0101050402','zhxy','2015-08-05 17:55:38'),
  (1318,37,'LM','LM0101050403','zhxy','2015-08-05 17:55:38'),
  (1319,37,'LM','LM01010505','zhxy','2015-08-05 17:55:38'),
  (1320,37,'LM','LM01010506','zhxy','2015-08-05 17:55:38'),
  (1321,37,'LM','LM0102','zhxy','2015-08-05 17:55:38'),
  (1322,37,'LM','LM010201','zhxy','2015-08-05 17:55:38'),
  (1323,37,'LM','LM010202','zhxy','2015-08-05 17:55:38'),
  (1324,37,'LM','LM010203','zhxy','2015-08-05 17:55:38'),
  (1325,37,'LM','LM010204','zhxy','2015-08-05 17:55:38'),
  (1326,37,'LM','LM01020401','zhxy','2015-08-05 17:55:38'),
  (1327,37,'LM','LM0102040101','zhxy','2015-08-05 17:55:38'),
  (1328,37,'LM','LM0102040102','zhxy','2015-08-05 17:55:38'),
  (1329,37,'LM','LM010204010201','zhxy','2015-08-05 17:55:38'),
  (1330,37,'LM','LM0102040103','zhxy','2015-08-05 17:55:38'),
  (1331,37,'LM','LM0102040104','zhxy','2015-08-05 17:55:38'),
  (1332,37,'LM','LM01020402','zhxy','2015-08-05 17:55:38'),
  (1333,37,'LM','LM010205','zhxy','2015-08-05 17:55:38'),
  (1334,37,'LM','LM01020501','zhxy','2015-08-05 17:55:38'),
  (1335,37,'LM','LM01020502','zhxy','2015-08-05 17:55:38'),
  (1336,37,'LM','LM010206','zhxy','2015-08-05 17:55:38'),
  (1337,37,'LM','LM010207','zhxy','2015-08-05 17:55:38'),
  (1338,37,'LM','LM010208','zhxy','2015-08-05 17:55:38'),
  (1339,37,'LM','LM0103','zhxy','2015-08-05 17:55:38'),
  (1340,37,'LM','LM010301','zhxy','2015-08-05 17:55:38'),
  (1341,37,'LM','LM010302','zhxy','2015-08-05 17:55:38'),
  (1342,37,'LM','LM010303','zhxy','2015-08-05 17:55:38'),
  (1343,37,'LM','LM01030301','zhxy','2015-08-05 17:55:38'),
  (1344,37,'LM','LM0103030101','zhxy','2015-08-05 17:55:38'),
  (1345,37,'LM','LM01030302','zhxy','2015-08-05 17:55:38'),
  (1346,37,'LM','LM01030303','zhxy','2015-08-05 17:55:38'),
  (1347,37,'LM','LM0103030301','zhxy','2015-08-05 17:55:38'),
  (1348,37,'LM','LM0103030302','zhxy','2015-08-05 17:55:38'),
  (1349,37,'LM','LM0103030303','zhxy','2015-08-05 17:55:38'),
  (1350,37,'LM','LM010303030301','zhxy','2015-08-05 17:55:38'),
  (1351,37,'LM','LM010303030302','zhxy','2015-08-05 17:55:38'),
  (1352,37,'LM','LM0103030304','zhxy','2015-08-05 17:55:38'),
  (1353,37,'LM','LM010304','zhxy','2015-08-05 17:55:38'),
  (1354,37,'LM','LM010305','zhxy','2015-08-05 17:55:38'),
  (1355,37,'LM','LM010306','zhxy','2015-08-05 17:55:38'),
  (1356,37,'LM','LM010307','zhxy','2015-08-05 17:55:38'),
  (1357,37,'LM','LM010308','zhxy','2015-08-05 17:55:38'),
  (1358,37,'LM','LM010309','zhxy','2015-08-05 17:55:38'),
  (1359,37,'LM','LM0104','zhxy','2015-08-05 17:55:38'),
  (1360,37,'LM','LM010401','zhxy','2015-08-05 17:55:38'),
  (1361,37,'LM','LM010402','zhxy','2015-08-05 17:55:38'),
  (1362,37,'LM','LM010403','zhxy','2015-08-05 17:55:38'),
  (1363,37,'LM','LM01040301','zhxy','2015-08-05 17:55:38'),
  (1364,37,'LM','LM01040302','zhxy','2015-08-05 17:55:38'),
  (1365,37,'LM','LM01040303','zhxy','2015-08-05 17:55:38'),
  (1366,37,'LM','LM01040304','zhxy','2015-08-05 17:55:38'),
  (1367,37,'LM','LM01040305','zhxy','2015-08-05 17:55:38'),
  (1368,37,'LM','LM010404','zhxy','2015-08-05 17:55:38'),
  (1369,37,'LM','LM010405','zhxy','2015-08-05 17:55:38'),
  (1370,37,'LM','LM010406','zhxy','2015-08-05 17:55:38'),
  (1371,37,'LM','LM02','zhxy','2015-08-05 17:55:38'),
  (1372,37,'LM','LM0201','zhxy','2015-08-05 17:55:38'),
  (1373,37,'LM','LM020101','zhxy','2015-08-05 17:55:38'),
  (1374,37,'LM','LM020102','zhxy','2015-08-05 17:55:38'),
  (1375,37,'LM','LM020103','zhxy','2015-08-05 17:55:38'),
  (1376,37,'LM','LM020104','zhxy','2015-08-05 17:55:38'),
  (1377,37,'LM','LM0202','zhxy','2015-08-05 17:55:38'),
  (1378,37,'LM','LM020201','zhxy','2015-08-05 17:55:38'),
  (1379,37,'LM','LM020202','zhxy','2015-08-05 17:55:38'),
  (1380,37,'LM','LM020203','zhxy','2015-08-05 17:55:38'),
  (1381,37,'LM','LM020204','zhxy','2015-08-05 17:55:38'),
  (1382,37,'LM','LM03','zhxy','2015-08-05 17:55:38'),
  (1383,37,'LM','LM0301','zhxy','2015-08-05 17:55:38'),
  (1384,37,'LM','LM030101','zhxy','2015-08-05 17:55:38'),
  (1385,37,'LM','LM030102','zhxy','2015-08-05 17:55:38'),
  (1386,37,'LM','LM030103','zhxy','2015-08-05 17:55:38'),
  (1387,37,'LM','LM030104','zhxy','2015-08-05 17:55:38'),
  (1388,37,'LM','LM0302','zhxy','2015-08-05 17:55:38'),
  (1389,37,'LM','LM030201','zhxy','2015-08-05 17:55:38'),
  (1390,37,'LM','LM030202','zhxy','2015-08-05 17:55:38'),
  (1391,37,'LM','LM030203','zhxy','2015-08-05 17:55:38'),
  (1392,37,'LM','LM030204','zhxy','2015-08-05 17:55:38'),
  (1393,37,'LM','LM0303','zhxy','2015-08-05 17:55:38'),
  (1394,37,'LM','LM030301','zhxy','2015-08-05 17:55:38'),
  (1395,37,'LM','LM030302','zhxy','2015-08-05 17:55:38'),
  (1396,37,'LM','LM030303','zhxy','2015-08-05 17:55:38'),
  (1397,37,'LM','LM0304','zhxy','2015-08-05 17:55:38'),
  (1398,37,'LM','LM030401','zhxy','2015-08-05 17:55:38'),
  (1399,37,'LM','LM030402','zhxy','2015-08-05 17:55:38'),
  (1400,37,'LM','LM030403','zhxy','2015-08-05 17:55:38'),
  (1401,37,'LM','LM04','zhxy','2015-08-05 17:55:38'),
  (1402,37,'LM','LM0401','zhxy','2015-08-05 17:55:38'),
  (1403,37,'LM','LM0402','zhxy','2015-08-05 17:55:38'),
  (1404,37,'LM','LM040201','zhxy','2015-08-05 17:55:38'),
  (1405,37,'LM','LM05','zhxy','2015-08-05 17:55:38'),
  (1406,37,'LM','LM0501','zhxy','2015-08-05 17:55:38'),
  (1407,37,'LM','LM050101','zhxy','2015-08-05 17:55:38'),
  (1408,37,'LM','LM050102','zhxy','2015-08-05 17:55:38'),
  (1409,37,'LM','LM05010201','zhxy','2015-08-05 17:55:38'),
  (1410,37,'LM','LM05010202','zhxy','2015-08-05 17:55:38'),
  (1411,37,'LM','LM05010203','zhxy','2015-08-05 17:55:38'),
  (1412,37,'LM','LM05010204','zhxy','2015-08-05 17:55:38'),
  (1413,37,'LM','LM050103','zhxy','2015-08-05 17:55:38'),
  (1414,37,'LM','LM050104','zhxy','2015-08-05 17:55:38'),
  (1415,37,'LM','LM05010401','zhxy','2015-08-05 17:55:38'),
  (1416,37,'LM','LM050105','zhxy','2015-08-05 17:55:38'),
  (1417,37,'LM','LM0502','zhxy','2015-08-05 17:55:38'),
  (1418,37,'LM','LM050201','zhxy','2015-08-05 17:55:38'),
  (1419,37,'LM','LM050202','zhxy','2015-08-05 17:55:38'),
  (1420,37,'LM','LM050203','zhxy','2015-08-05 17:55:38'),
  (1421,37,'LM','LM0503','zhxy','2015-08-05 17:55:38'),
  (1422,37,'LM','LM050301','zhxy','2015-08-05 17:55:38'),
  (1423,37,'LM','LM050302','zhxy','2015-08-05 17:55:38'),
  (1424,37,'LM','LM050303','zhxy','2015-08-05 17:55:38'),
  (1435,33,'CW','CW010302','root','2015-08-07 10:19:57'),
  (1446,27,'KF','KF020101','root','2015-08-14 16:11:56'),
  (1447,27,'KF','KF020102','root','2015-08-14 16:11:56'),
  (1448,27,'KF','KF020103','root','2015-08-14 16:11:56'),
  (1449,27,'KF','KF020104','root','2015-08-14 16:11:56'),
  (1450,27,'KF','KF020105','root','2015-08-14 16:11:56'),
  (1451,27,'KF','KF020106','root','2015-08-14 16:11:56'),
  (1452,27,'KF','KF020107','root','2015-08-14 16:11:56'),
  (1453,21,'KF','KF020101','root','2015-08-14 16:17:54'),
  (1454,21,'KF','KF020102','root','2015-08-14 16:17:54'),
  (1455,21,'KF','KF020103','root','2015-08-14 16:17:54'),
  (1456,21,'KF','KF020104','root','2015-08-14 16:17:54'),
  (1457,21,'KF','KF020105','root','2015-08-14 16:17:54'),
  (1458,21,'KF','KF020106','root','2015-08-14 16:17:54'),
  (1459,21,'KF','KF020107','root','2015-08-14 16:17:54'),
  (1460,21,'KF','KF04','root','2015-08-18 17:40:20'),
  (1462,34,'WOFE','WOFE04040101','root','2015-08-19 15:04:52'),
  (1463,34,'WOFE','WOFE0413','root','2015-08-19 15:12:44'),
  (1464,34,'WOFE','WOFE041301','root','2015-08-19 15:12:44'),
  (1465,34,'WOFE','WOFE040104','root','2015-08-19 15:23:06'),
  (1466,34,'WOFE','WOFE04010401','root','2015-08-19 15:23:06'),
  (1467,34,'WOFE','WOFE0503','root','2015-08-20 16:39:27'),
  (1468,34,'WOFE','WOFE050301','root','2015-08-20 16:39:27'),
  (1469,34,'WOFE','WOFE050302','root','2015-08-20 16:39:27'),
  (1470,34,'WOFE','WOFE050303','root','2015-08-20 16:39:27'),
  (1471,34,'WOFE','WOFE05020501','root','2015-08-20 17:29:45'),
  (1472,34,'WOFE','WOFE040708','root','2015-08-21 10:51:51'),
  (1522,48,'QX','QX01','root','2015-08-21 15:28:00'),
  (1528,48,'QX','QX0103','root','2015-08-21 15:28:00'),
  (1529,48,'QX','QX010301','root','2015-08-21 15:28:00'),
  (1530,48,'QX','QX010302','root','2015-08-21 15:28:00'),
  (1531,48,'QX','QX010303','root','2015-08-21 15:28:00'),
  (1532,48,'QX','QX010304','root','2015-08-21 15:28:00'),
  (1533,48,'QX','QX010305','root','2015-08-21 15:28:00'),
  (1538,48,'QX','QX02','root','2015-08-21 15:28:00'),
  (1543,48,'QX','QX0202','root','2015-08-21 15:28:00'),
  (1544,48,'QX','QX020201','root','2015-08-21 15:28:00'),
  (1545,48,'QX','QX020202','root','2015-08-21 15:28:00'),
  (1546,48,'QX','QX020203','root','2015-08-21 15:28:00'),
  (1547,48,'QX','QX03','root','2015-08-21 15:28:00'),
  (1552,48,'QX','QX0302','root','2015-08-21 15:28:00'),
  (1553,48,'QX','QX030201','root','2015-08-21 15:28:00'),
  (1554,48,'QX','QX0303','root','2015-08-21 15:28:00'),
  (1555,48,'QX','QX0304','root','2015-08-21 15:28:00'),
  (1556,48,'QX','QX030401','root','2015-08-21 15:28:00'),
  (1557,48,'QX','QX030402','root','2015-08-21 15:28:00'),
  (1558,49,'QX','QX02','root','2015-08-24 10:35:41'),
  (1559,49,'QX','QX0202','root','2015-08-24 10:35:41'),
  (1560,49,'QX','QX020201','root','2015-08-24 10:35:41'),
  (1561,49,'QX','QX020202','root','2015-08-24 10:35:41'),
  (1562,49,'QX','QX020203','root','2015-08-24 10:35:41'),
  (1563,49,'QX','QX03','lanyt','2015-08-24 11:33:28'),
  (1564,49,'QX','QX0302','lanyt','2015-08-24 11:33:28'),
  (1565,49,'QX','QX030201','lanyt','2015-08-24 11:33:28'),
  (1566,34,'WOFE','WOFE050304','dev','2015-08-24 11:35:12'),
  (1567,34,'WOFE','WOFE04040102','root','2015-08-24 11:43:20'),
  (1568,34,'WOFE','WOFE04040103','root','2015-08-24 11:43:20'),
  (1569,34,'WOFE','WOFE04040104','root','2015-08-24 11:43:20'),
  (1570,34,'WOFE','WOFE04040105','root','2015-08-24 11:45:40'),
  (1571,34,'WOFE','WOFE04040106','root','2015-08-24 11:59:18'),
  (1633,21,'KF','KF0402','root','2015-08-25 11:33:55'),
  (1634,53,'CW','CW01','gaojp','2015-08-26 13:46:20'),
  (1635,53,'CW','CW0101','gaojp','2015-08-26 13:46:20'),
  (1636,53,'CW','CW010101','gaojp','2015-08-26 13:46:20'),
  (1637,53,'CW','CW010102','gaojp','2015-08-26 13:46:20'),
  (1638,53,'CW','CW0102','gaojp','2015-08-26 13:46:20'),
  (1639,53,'CW','CW010201','gaojp','2015-08-26 13:46:20'),
  (1640,53,'CW','CW010202','gaojp','2015-08-26 13:46:20'),
  (1641,53,'CW','CW0103','gaojp','2015-08-26 13:46:20'),
  (1642,53,'CW','CW010301','gaojp','2015-08-26 13:46:20'),
  (1643,53,'CW','CW010302','gaojp','2015-08-26 13:46:20'),
  (1644,53,'CW','CW0104','gaojp','2015-08-26 13:46:20'),
  (1645,53,'CW','CW010401','gaojp','2015-08-26 13:46:20'),
  (1646,53,'CW','CW010402','gaojp','2015-08-26 13:46:20'),
  (1647,53,'CW','CW0105','gaojp','2015-08-26 13:46:20'),
  (1650,53,'CW','CW0106','gaojp','2015-08-26 13:46:20'),
  (1651,53,'CW','CW010601','gaojp','2015-08-26 13:46:20'),
  (1652,53,'CW','CW010602','gaojp','2015-08-26 13:46:20'),
  (1653,53,'CW','CW010603','gaojp','2015-08-26 13:46:20'),
  (1654,53,'CW','CW0107','gaojp','2015-08-26 13:46:20'),
  (1655,53,'CW','CW0108','gaojp','2015-08-26 13:46:20'),
  (1656,53,'CW','CW010801','gaojp','2015-08-26 13:46:20'),
  (1682,51,'LM','LM01','gaojp','2015-08-26 13:46:32'),
  (1683,51,'LM','LM0101','gaojp','2015-08-26 13:46:32'),
  (1684,51,'LM','LM010101','gaojp','2015-08-26 13:46:32'),
  (1685,51,'LM','LM010102','gaojp','2015-08-26 13:46:32'),
  (1686,51,'LM','LM010103','gaojp','2015-08-26 13:46:32'),
  (1687,51,'LM','LM010104','gaojp','2015-08-26 13:46:32'),
  (1688,51,'LM','LM010105','gaojp','2015-08-26 13:46:32'),
  (1689,51,'LM','LM01010501','gaojp','2015-08-26 13:46:32'),
  (1690,51,'LM','LM01010502','gaojp','2015-08-26 13:46:32'),
  (1691,51,'LM','LM01010503','gaojp','2015-08-26 13:46:32'),
  (1692,51,'LM','LM01010504','gaojp','2015-08-26 13:46:32'),
  (1693,51,'LM','LM0101050401','gaojp','2015-08-26 13:46:32'),
  (1694,51,'LM','LM0101050402','gaojp','2015-08-26 13:46:32'),
  (1695,51,'LM','LM0101050403','gaojp','2015-08-26 13:46:32'),
  (1696,51,'LM','LM01010505','gaojp','2015-08-26 13:46:32'),
  (1697,51,'LM','LM01010506','gaojp','2015-08-26 13:46:32'),
  (1698,51,'LM','LM0102','gaojp','2015-08-26 13:46:32'),
  (1699,51,'LM','LM010201','gaojp','2015-08-26 13:46:32'),
  (1700,51,'LM','LM010202','gaojp','2015-08-26 13:46:32'),
  (1701,51,'LM','LM010203','gaojp','2015-08-26 13:46:32'),
  (1702,51,'LM','LM010204','gaojp','2015-08-26 13:46:32'),
  (1703,51,'LM','LM01020401','gaojp','2015-08-26 13:46:32'),
  (1704,51,'LM','LM0102040101','gaojp','2015-08-26 13:46:32'),
  (1705,51,'LM','LM0102040102','gaojp','2015-08-26 13:46:32'),
  (1706,51,'LM','LM010204010201','gaojp','2015-08-26 13:46:32'),
  (1707,51,'LM','LM0102040103','gaojp','2015-08-26 13:46:32'),
  (1708,51,'LM','LM0102040104','gaojp','2015-08-26 13:46:32'),
  (1709,51,'LM','LM01020402','gaojp','2015-08-26 13:46:32'),
  (1710,51,'LM','LM010205','gaojp','2015-08-26 13:46:32'),
  (1711,51,'LM','LM01020501','gaojp','2015-08-26 13:46:32');
COMMIT;

#
# Data for the `role_authority` table  (LIMIT 500,500)
#

INSERT INTO `role_authority` (`id`, `role_id`, `system_code`, `module_id`, `oper_user`, `oper_time`) VALUES
  (1712,51,'LM','LM01020502','gaojp','2015-08-26 13:46:32'),
  (1713,51,'LM','LM010206','gaojp','2015-08-26 13:46:32'),
  (1714,51,'LM','LM010207','gaojp','2015-08-26 13:46:32'),
  (1715,51,'LM','LM010208','gaojp','2015-08-26 13:46:32'),
  (1716,51,'LM','LM0103','gaojp','2015-08-26 13:46:32'),
  (1717,51,'LM','LM010301','gaojp','2015-08-26 13:46:32'),
  (1718,51,'LM','LM010302','gaojp','2015-08-26 13:46:32'),
  (1719,51,'LM','LM010303','gaojp','2015-08-26 13:46:32'),
  (1720,51,'LM','LM01030301','gaojp','2015-08-26 13:46:32'),
  (1721,51,'LM','LM0103030101','gaojp','2015-08-26 13:46:32'),
  (1722,51,'LM','LM01030302','gaojp','2015-08-26 13:46:32'),
  (1723,51,'LM','LM01030303','gaojp','2015-08-26 13:46:32'),
  (1724,51,'LM','LM0103030301','gaojp','2015-08-26 13:46:32'),
  (1725,51,'LM','LM0103030302','gaojp','2015-08-26 13:46:32'),
  (1726,51,'LM','LM0103030303','gaojp','2015-08-26 13:46:32'),
  (1727,51,'LM','LM010303030301','gaojp','2015-08-26 13:46:32'),
  (1728,51,'LM','LM010303030302','gaojp','2015-08-26 13:46:32'),
  (1729,51,'LM','LM0103030304','gaojp','2015-08-26 13:46:32'),
  (1730,51,'LM','LM010304','gaojp','2015-08-26 13:46:32'),
  (1731,51,'LM','LM010305','gaojp','2015-08-26 13:46:32'),
  (1732,51,'LM','LM010306','gaojp','2015-08-26 13:46:32'),
  (1733,51,'LM','LM010307','gaojp','2015-08-26 13:46:32'),
  (1734,51,'LM','LM010308','gaojp','2015-08-26 13:46:32'),
  (1735,51,'LM','LM010309','gaojp','2015-08-26 13:46:32'),
  (1736,51,'LM','LM0104','gaojp','2015-08-26 13:46:32'),
  (1737,51,'LM','LM010401','gaojp','2015-08-26 13:46:32'),
  (1738,51,'LM','LM010402','gaojp','2015-08-26 13:46:32'),
  (1739,51,'LM','LM010403','gaojp','2015-08-26 13:46:32'),
  (1740,51,'LM','LM01040301','gaojp','2015-08-26 13:46:32'),
  (1741,51,'LM','LM01040302','gaojp','2015-08-26 13:46:32'),
  (1742,51,'LM','LM01040303','gaojp','2015-08-26 13:46:32'),
  (1743,51,'LM','LM01040304','gaojp','2015-08-26 13:46:32'),
  (1744,51,'LM','LM01040305','gaojp','2015-08-26 13:46:32'),
  (1745,51,'LM','LM010404','gaojp','2015-08-26 13:46:32'),
  (1746,51,'LM','LM010405','gaojp','2015-08-26 13:46:32'),
  (1747,51,'LM','LM010406','gaojp','2015-08-26 13:46:32'),
  (1748,51,'LM','LM02','gaojp','2015-08-26 13:46:32'),
  (1749,51,'LM','LM0201','gaojp','2015-08-26 13:46:32'),
  (1750,51,'LM','LM020101','gaojp','2015-08-26 13:46:32'),
  (1751,51,'LM','LM020102','gaojp','2015-08-26 13:46:32'),
  (1752,51,'LM','LM020103','gaojp','2015-08-26 13:46:32'),
  (1753,51,'LM','LM020104','gaojp','2015-08-26 13:46:32'),
  (1754,51,'LM','LM0202','gaojp','2015-08-26 13:46:32'),
  (1755,51,'LM','LM020201','gaojp','2015-08-26 13:46:32'),
  (1756,51,'LM','LM020202','gaojp','2015-08-26 13:46:32'),
  (1757,51,'LM','LM020203','gaojp','2015-08-26 13:46:32'),
  (1758,51,'LM','LM020204','gaojp','2015-08-26 13:46:32'),
  (1759,51,'LM','LM03','gaojp','2015-08-26 13:46:32'),
  (1760,51,'LM','LM0301','gaojp','2015-08-26 13:46:32'),
  (1761,51,'LM','LM030101','gaojp','2015-08-26 13:46:32'),
  (1762,51,'LM','LM030102','gaojp','2015-08-26 13:46:32'),
  (1763,51,'LM','LM030103','gaojp','2015-08-26 13:46:32'),
  (1764,51,'LM','LM030104','gaojp','2015-08-26 13:46:32'),
  (1765,51,'LM','LM0302','gaojp','2015-08-26 13:46:32'),
  (1766,51,'LM','LM030201','gaojp','2015-08-26 13:46:32'),
  (1767,51,'LM','LM030202','gaojp','2015-08-26 13:46:32'),
  (1768,51,'LM','LM030203','gaojp','2015-08-26 13:46:32'),
  (1769,51,'LM','LM030204','gaojp','2015-08-26 13:46:32'),
  (1770,51,'LM','LM0303','gaojp','2015-08-26 13:46:32'),
  (1771,51,'LM','LM030301','gaojp','2015-08-26 13:46:32'),
  (1772,51,'LM','LM030302','gaojp','2015-08-26 13:46:32'),
  (1773,51,'LM','LM030303','gaojp','2015-08-26 13:46:32'),
  (1774,51,'LM','LM0304','gaojp','2015-08-26 13:46:32'),
  (1775,51,'LM','LM030401','gaojp','2015-08-26 13:46:32'),
  (1776,51,'LM','LM030402','gaojp','2015-08-26 13:46:32'),
  (1777,51,'LM','LM030403','gaojp','2015-08-26 13:46:32'),
  (1778,51,'LM','LM04','gaojp','2015-08-26 13:46:32'),
  (1779,51,'LM','LM0401','gaojp','2015-08-26 13:46:32'),
  (1780,51,'LM','LM0402','gaojp','2015-08-26 13:46:32'),
  (1781,51,'LM','LM040201','gaojp','2015-08-26 13:46:32'),
  (1782,51,'LM','LM05','gaojp','2015-08-26 13:46:32'),
  (1783,51,'LM','LM0501','gaojp','2015-08-26 13:46:32'),
  (1784,51,'LM','LM050101','gaojp','2015-08-26 13:46:32'),
  (1785,51,'LM','LM050102','gaojp','2015-08-26 13:46:32'),
  (1786,51,'LM','LM05010201','gaojp','2015-08-26 13:46:32'),
  (1787,51,'LM','LM05010202','gaojp','2015-08-26 13:46:32'),
  (1788,51,'LM','LM05010203','gaojp','2015-08-26 13:46:32'),
  (1789,51,'LM','LM05010204','gaojp','2015-08-26 13:46:32'),
  (1790,51,'LM','LM050103','gaojp','2015-08-26 13:46:32'),
  (1791,51,'LM','LM050104','gaojp','2015-08-26 13:46:32'),
  (1792,51,'LM','LM05010401','gaojp','2015-08-26 13:46:32'),
  (1793,51,'LM','LM050105','gaojp','2015-08-26 13:46:32'),
  (1794,51,'LM','LM0502','gaojp','2015-08-26 13:46:32'),
  (1795,51,'LM','LM050201','gaojp','2015-08-26 13:46:32'),
  (1796,51,'LM','LM050202','gaojp','2015-08-26 13:46:32'),
  (1797,51,'LM','LM050203','gaojp','2015-08-26 13:46:32'),
  (1798,51,'LM','LM0503','gaojp','2015-08-26 13:46:32'),
  (1799,51,'LM','LM050301','gaojp','2015-08-26 13:46:32'),
  (1800,51,'LM','LM050302','gaojp','2015-08-26 13:46:32'),
  (1801,51,'LM','LM050303','gaojp','2015-08-26 13:46:32'),
  (1807,27,'KF','KF04','root','2015-08-28 10:00:58'),
  (1809,27,'KF','KF0402','root','2015-08-28 10:00:58'),
  (1810,27,'KF','KF05','root','2015-08-28 10:00:58'),
  (1811,27,'KF','KF0501','root','2015-08-28 10:00:58'),
  (1812,21,'KF','KF05','gaojp','2015-08-28 15:29:13'),
  (1813,21,'KF','KF0501','gaojp','2015-08-28 15:29:13'),
  (1823,34,'WOFE','WOFE040802','lanyt','2015-09-01 15:41:16'),
  (1825,53,'CW','CW0109','dev','2015-09-05 14:23:06'),
  (1826,21,'KF','KF0403','root','2015-09-05 16:39:54'),
  (1827,27,'KF','KF0403','root','2015-09-05 16:40:11'),
  (1828,27,'KF','KF0404','root','2015-09-07 15:51:40'),
  (1829,21,'KF','KF0404','root','2015-09-11 11:23:14'),
  (1831,53,'CW','CW0110','dev','2015-09-16 18:05:00'),
  (1832,33,'CW','CW0108','root','2015-09-17 16:26:29'),
  (1833,33,'CW','CW010801','root','2015-09-17 16:26:29'),
  (1834,33,'CW','CW0109','root','2015-09-17 16:26:29'),
  (1835,33,'CW','CW0110','root','2015-09-17 16:26:29'),
  (1836,34,'WOFE','WOFE02','root','2015-09-17 16:30:33'),
  (1837,34,'WOFE','WOFE0201','root','2015-09-17 16:30:33'),
  (1838,34,'WOFE','WOFE020101','root','2015-09-17 16:30:33'),
  (1839,34,'WOFE','WOFE02010101','root','2015-09-17 16:30:33'),
  (1840,34,'WOFE','WOFE02010102','root','2015-09-17 16:30:33'),
  (1841,34,'WOFE','WOFE02010103','root','2015-09-17 16:30:33'),
  (1842,34,'WOFE','WOFE02010104','root','2015-09-17 16:30:33'),
  (1843,34,'WOFE','WOFE02010105','root','2015-09-17 16:30:33'),
  (1844,34,'WOFE','WOFE02010106','root','2015-09-17 16:30:33'),
  (1845,34,'WOFE','WOFE02010107','root','2015-09-17 16:30:33'),
  (1846,34,'WOFE','WOFE02010108','root','2015-09-17 16:30:33'),
  (1847,34,'WOFE','WOFE02010109','root','2015-09-17 16:30:33'),
  (1848,34,'WOFE','WOFE020102','root','2015-09-17 16:30:33'),
  (1849,34,'WOFE','WOFE020103','root','2015-09-17 16:30:33'),
  (1850,34,'WOFE','WOFE02010301','root','2015-09-17 16:30:33'),
  (1851,34,'WOFE','WOFE02010302','root','2015-09-17 16:30:33'),
  (1852,34,'WOFE','WOFE0202','root','2015-09-17 16:30:33'),
  (1853,34,'WOFE','WOFE020201','root','2015-09-17 16:30:33'),
  (1854,34,'WOFE','WOFE02020101','root','2015-09-17 16:30:33'),
  (1855,34,'WOFE','WOFE02020102','root','2015-09-17 16:30:33'),
  (1856,34,'WOFE','WOFE02020103','root','2015-09-17 16:30:33'),
  (1857,34,'WOFE','WOFE02020104','root','2015-09-17 16:30:33'),
  (1858,34,'WOFE','WOFE020202','root','2015-09-17 16:30:33'),
  (1859,34,'WOFE','WOFE02020201','root','2015-09-17 16:30:33'),
  (1860,34,'WOFE','WOFE02020202','root','2015-09-17 16:30:33'),
  (1861,34,'WOFE','WOFE02020203','root','2015-09-17 16:30:33'),
  (1862,34,'WOFE','WOFE02020204','root','2015-09-17 16:30:33'),
  (1863,34,'WOFE','WOFE0203','root','2015-09-17 16:30:33'),
  (1864,34,'WOFE','WOFE020301','root','2015-09-17 16:30:33'),
  (1865,34,'WOFE','WOFE02030101','root','2015-09-17 16:30:33'),
  (1866,34,'WOFE','WOFE02030102','root','2015-09-17 16:30:33'),
  (1867,34,'WOFE','WOFE020307','root','2015-09-17 16:30:33'),
  (1868,34,'WOFE','WOFE020308','root','2015-09-17 16:30:33'),
  (2031,34,'WOFE','WOFE04020401','root','2015-09-23 17:23:20'),
  (2032,34,'WOFE','WOFE04020402','root','2015-09-23 17:23:20'),
  (2098,27,'KF','KF0102','root','2015-10-27 15:57:13'),
  (2099,53,'CW','CW0111','hello2','2015-10-29 16:43:57'),
  (2100,33,'CW','CW0111','hello2','2015-10-29 16:44:05'),
  (2101,33,'CW','CW011101','dev','2015-11-02 10:57:15'),
  (2102,33,'CW','CW011102','dev','2015-11-02 10:57:15'),
  (2103,53,'CW','CW011101','dev','2015-11-02 10:57:23'),
  (2104,53,'CW','CW011102','dev','2015-11-02 10:57:23'),
  (2105,53,'CW','CW010501','dev','2015-11-02 11:13:22'),
  (2106,53,'CW','CW010502','dev','2015-11-02 11:13:22'),
  (2107,33,'CW','CW0112','dev','2015-11-03 12:05:34'),
  (2108,33,'CW','CW011201','dev','2015-11-03 12:05:34'),
  (2109,33,'CW','CW011202','dev','2015-11-03 12:05:34'),
  (2110,53,'CW','CW0112','dev','2015-11-03 12:05:41'),
  (2111,53,'CW','CW011201','dev','2015-11-03 12:05:41'),
  (2112,53,'CW','CW011202','dev','2015-11-03 12:05:41'),
  (2120,33,'CW','CW0114','dev','2015-11-09 15:15:27'),
  (2121,33,'CW','CW011401','dev','2015-11-09 15:15:27'),
  (2122,33,'CW','CW011402','dev','2015-11-09 15:15:27'),
  (2123,53,'CW','CW0114','dev','2015-11-09 15:15:32'),
  (2124,53,'CW','CW011401','dev','2015-11-09 15:15:32'),
  (2125,53,'CW','CW011402','dev','2015-11-09 15:15:32'),
  (2126,34,'WOFE','WOFE050203','root','2015-11-16 11:26:46'),
  (2129,21,'KF','KF010111','root','2015-11-17 10:41:50'),
  (2130,27,'KF','KF010111','root','2015-11-17 10:41:57'),
  (2131,21,'KF','KF0102','root','2015-11-18 10:46:42'),
  (2132,27,'KF','KF010201','root','2015-11-20 11:39:09'),
  (2133,27,'KF','KF010202','root','2015-11-20 11:39:09'),
  (2134,27,'KF','KF010203','root','2015-11-20 11:39:09'),
  (2135,34,'WOFE','WOFE0204','root','2015-11-24 15:06:38'),
  (2136,33,'CW','CW0115','dev','2015-11-26 15:39:35'),
  (2137,33,'CW','CW011501','dev','2015-11-26 15:39:35'),
  (2138,53,'CW','CW0115','dev','2015-11-26 15:39:42'),
  (2139,53,'CW','CW011501','dev','2015-11-26 15:39:42'),
  (2140,33,'CW','CW0116','dev','2015-11-27 13:51:57'),
  (2141,33,'CW','CW011601','dev','2015-11-27 13:51:57'),
  (2142,53,'CW','CW0116','dev','2015-11-27 13:52:05'),
  (2143,53,'CW','CW011601','dev','2015-11-27 13:52:05'),
  (2144,21,'KF','KF010201','hello2','2015-12-03 14:54:47'),
  (2145,21,'KF','KF010202','hello2','2015-12-03 14:54:47'),
  (2146,21,'KF','KF010203','hello2','2015-12-03 14:54:47'),
  (2147,34,'WOFE','WOFE040207','hello2','2015-12-06 13:38:32'),
  (2148,33,'CW','CW0117','hello2','2015-12-06 16:31:44'),
  (2149,53,'CW','CW0117','hello2','2015-12-06 16:31:52'),
  (2151,53,'CW','CW011701','hello2','2015-12-08 19:01:46'),
  (2152,33,'CW','CW011701','hello2','2015-12-08 19:01:54'),
  (2154,34,'WOFE','WOFE0414','root','2015-12-18 20:35:58'),
  (2155,34,'WOFE','WOFE041401','root','2015-12-18 20:41:58'),
  (2158,33,'CW','CW010502','root','2015-12-30 14:42:43'),
  (2161,54,'WOFE','WOFE01','hello2','2016-01-14 17:17:15'),
  (2162,54,'WOFE','WOFE02','hello2','2016-01-14 17:20:16'),
  (2163,54,'WOFE','WOFE0201','hello2','2016-01-14 17:20:16'),
  (2164,54,'WOFE','WOFE020101','hello2','2016-01-14 17:20:16'),
  (2165,54,'WOFE','WOFE02010101','hello2','2016-01-14 17:20:16'),
  (2166,54,'WOFE','WOFE02010102','hello2','2016-01-14 17:20:16'),
  (2167,54,'WOFE','WOFE02010103','hello2','2016-01-14 17:20:16'),
  (2168,54,'WOFE','WOFE02010104','hello2','2016-01-14 17:20:16'),
  (2169,54,'WOFE','WOFE02010105','hello2','2016-01-14 17:20:16'),
  (2170,54,'WOFE','WOFE02010106','hello2','2016-01-14 17:20:16'),
  (2171,54,'WOFE','WOFE02010107','hello2','2016-01-14 17:20:16'),
  (2172,54,'WOFE','WOFE02010108','hello2','2016-01-14 17:20:16'),
  (2173,54,'WOFE','WOFE02010109','hello2','2016-01-14 17:20:16'),
  (2174,54,'WOFE','WOFE020102','hello2','2016-01-14 17:20:16'),
  (2175,54,'WOFE','WOFE020103','hello2','2016-01-14 17:20:16'),
  (2176,54,'WOFE','WOFE02010301','hello2','2016-01-14 17:20:16'),
  (2177,54,'WOFE','WOFE02010302','hello2','2016-01-14 17:20:16'),
  (2178,54,'WOFE','WOFE0202','hello2','2016-01-14 17:20:16'),
  (2179,54,'WOFE','WOFE020201','hello2','2016-01-14 17:20:16'),
  (2180,54,'WOFE','WOFE02020101','hello2','2016-01-14 17:20:16'),
  (2181,54,'WOFE','WOFE02020102','hello2','2016-01-14 17:20:16'),
  (2182,54,'WOFE','WOFE02020103','hello2','2016-01-14 17:20:16'),
  (2183,54,'WOFE','WOFE02020104','hello2','2016-01-14 17:20:16'),
  (2184,54,'WOFE','WOFE020202','hello2','2016-01-14 17:20:16'),
  (2185,54,'WOFE','WOFE02020201','hello2','2016-01-14 17:20:16'),
  (2186,54,'WOFE','WOFE02020202','hello2','2016-01-14 17:20:16'),
  (2187,54,'WOFE','WOFE02020203','hello2','2016-01-14 17:20:16'),
  (2188,54,'WOFE','WOFE02020204','hello2','2016-01-14 17:20:16'),
  (2189,54,'WOFE','WOFE0203','hello2','2016-01-14 17:20:16'),
  (2190,54,'WOFE','WOFE020301','hello2','2016-01-14 17:20:16'),
  (2191,54,'WOFE','WOFE02030101','hello2','2016-01-14 17:20:16'),
  (2192,54,'WOFE','WOFE02030102','hello2','2016-01-14 17:20:16'),
  (2193,54,'WOFE','WOFE020307','hello2','2016-01-14 17:20:16'),
  (2194,54,'WOFE','WOFE020308','hello2','2016-01-14 17:20:16'),
  (2195,54,'WOFE','WOFE0204','hello2','2016-01-14 17:20:16'),
  (2196,54,'WOFE','WOFE03','hello2','2016-01-14 17:20:16'),
  (2197,54,'WOFE','WOFE0301','hello2','2016-01-14 17:20:16'),
  (2198,54,'WOFE','WOFE030101','hello2','2016-01-14 17:20:16'),
  (2199,54,'WOFE','WOFE03010101','hello2','2016-01-14 17:20:16'),
  (2200,54,'WOFE','WOFE03010102','hello2','2016-01-14 17:20:16'),
  (2201,54,'WOFE','WOFE03010103','hello2','2016-01-14 17:20:16'),
  (2202,54,'WOFE','WOFE03010104','hello2','2016-01-14 17:20:16'),
  (2203,54,'WOFE','WOFE030102','hello2','2016-01-14 17:20:16'),
  (2204,54,'WOFE','WOFE03010201','hello2','2016-01-14 17:20:16'),
  (2205,54,'WOFE','WOFE03010202','hello2','2016-01-14 17:20:16'),
  (2206,54,'WOFE','WOFE03010203','hello2','2016-01-14 17:20:16'),
  (2207,54,'WOFE','WOFE03010204','hello2','2016-01-14 17:20:16'),
  (2335,54,'WOFE','WOFE040207','hello2','2016-01-14 17:20:16'),
  (2336,54,'WOFE','WOFE05','hello2','2016-01-14 17:20:16'),
  (2337,54,'WOFE','WOFE0501','hello2','2016-01-14 17:20:16'),
  (2338,54,'WOFE','WOFE050101','hello2','2016-01-14 17:20:16'),
  (2339,54,'WOFE','WOFE05010101','hello2','2016-01-14 17:20:16'),
  (2340,54,'WOFE','WOFE05010102','hello2','2016-01-14 17:20:16'),
  (2341,54,'WOFE','WOFE05010103','hello2','2016-01-14 17:20:16'),
  (2342,54,'WOFE','WOFE05010104','hello2','2016-01-14 17:20:16'),
  (2343,54,'WOFE','WOFE050102','hello2','2016-01-14 17:20:16'),
  (2344,54,'WOFE','WOFE050103','hello2','2016-01-14 17:20:16'),
  (2345,54,'WOFE','WOFE0502','hello2','2016-01-14 17:20:16'),
  (2346,54,'WOFE','WOFE050201','hello2','2016-01-14 17:20:16'),
  (2347,54,'WOFE','WOFE05020101','hello2','2016-01-14 17:20:16'),
  (2348,54,'WOFE','WOFE05020102','hello2','2016-01-14 17:20:16'),
  (2349,54,'WOFE','WOFE05020103','hello2','2016-01-14 17:20:16'),
  (2350,54,'WOFE','WOFE050202','hello2','2016-01-14 17:20:16'),
  (2351,54,'WOFE','WOFE050203','hello2','2016-01-14 17:20:16'),
  (2352,54,'WOFE','WOFE050205','hello2','2016-01-14 17:20:16'),
  (2353,54,'WOFE','WOFE05020501','hello2','2016-01-14 17:20:16'),
  (2354,54,'WOFE','WOFE0503','hello2','2016-01-14 17:20:16'),
  (2355,54,'WOFE','WOFE050301','hello2','2016-01-14 17:20:16'),
  (2356,54,'WOFE','WOFE050302','hello2','2016-01-14 17:20:16'),
  (2357,54,'WOFE','WOFE050303','hello2','2016-01-14 17:20:16'),
  (2358,54,'WOFE','WOFE050304','hello2','2016-01-14 17:20:16'),
  (2360,34,'WOFE','WOFE040105','hello2','2016-01-18 16:51:39'),
  (2361,34,'WOFE','WOFE040106','hello2','2016-01-18 16:51:39'),
  (2362,54,'WOFE','WOFE04','hello2','2016-01-19 16:06:31'),
  (2363,54,'WOFE','WOFE0401','hello2','2016-01-19 16:06:31'),
  (2364,54,'WOFE','WOFE040101','hello2','2016-01-19 16:06:31'),
  (2365,54,'WOFE','WOFE04010101','hello2','2016-01-19 16:06:31'),
  (2366,54,'WOFE','WOFE04010102','hello2','2016-01-19 16:06:31'),
  (2367,54,'WOFE','WOFE04010103','hello2','2016-01-19 16:06:31'),
  (2368,54,'WOFE','WOFE04010104','hello2','2016-01-19 16:06:31'),
  (2369,54,'WOFE','WOFE04010105','hello2','2016-01-19 16:06:31'),
  (2370,54,'WOFE','WOFE04010106','hello2','2016-01-19 16:06:31'),
  (2371,54,'WOFE','WOFE04010107','hello2','2016-01-19 16:06:31'),
  (2372,54,'WOFE','WOFE04010108','hello2','2016-01-19 16:06:31'),
  (2373,54,'WOFE','WOFE04010109','hello2','2016-01-19 16:06:31'),
  (2374,54,'WOFE','WOFE04010110','hello2','2016-01-19 16:06:31'),
  (2375,54,'WOFE','WOFE04010111','hello2','2016-01-19 16:06:31'),
  (2376,54,'WOFE','WOFE04010112','hello2','2016-01-19 16:06:31'),
  (2377,54,'WOFE','WOFE04010113','hello2','2016-01-19 16:06:31'),
  (2378,54,'WOFE','WOFE04010114','hello2','2016-01-19 16:06:31'),
  (2379,54,'WOFE','WOFE04010115','hello2','2016-01-19 16:06:31'),
  (2380,54,'WOFE','WOFE04010116','hello2','2016-01-19 16:06:31'),
  (2381,54,'WOFE','WOFE04010117','hello2','2016-01-19 16:06:31'),
  (2382,54,'WOFE','WOFE04010118','hello2','2016-01-19 16:06:31'),
  (2383,54,'WOFE','WOFE04010119','hello2','2016-01-19 16:06:31'),
  (2384,54,'WOFE','WOFE04010120','hello2','2016-01-19 16:06:31'),
  (2385,54,'WOFE','WOFE04010121','hello2','2016-01-19 16:06:31'),
  (2386,54,'WOFE','WOFE04010122','hello2','2016-01-19 16:06:31'),
  (2387,54,'WOFE','WOFE04010123','hello2','2016-01-19 16:06:31'),
  (2388,54,'WOFE','WOFE04010124','hello2','2016-01-19 16:06:31'),
  (2389,54,'WOFE','WOFE04010125','hello2','2016-01-19 16:06:31'),
  (2390,54,'WOFE','WOFE04010126','hello2','2016-01-19 16:06:31'),
  (2391,54,'WOFE','WOFE04010127','hello2','2016-01-19 16:06:31'),
  (2392,54,'WOFE','WOFE04010128','hello2','2016-01-19 16:06:31'),
  (2393,54,'WOFE','WOFE040102','hello2','2016-01-19 16:06:31'),
  (2394,54,'WOFE','WOFE04010201','hello2','2016-01-19 16:06:31'),
  (2395,54,'WOFE','WOFE04010202','hello2','2016-01-19 16:06:31'),
  (2396,54,'WOFE','WOFE04010203','hello2','2016-01-19 16:06:31'),
  (2397,54,'WOFE','WOFE04010204','hello2','2016-01-19 16:06:31'),
  (2398,54,'WOFE','WOFE04010205','hello2','2016-01-19 16:06:31'),
  (2399,54,'WOFE','WOFE04010206','hello2','2016-01-19 16:06:31'),
  (2400,54,'WOFE','WOFE04010207','hello2','2016-01-19 16:06:31'),
  (2401,54,'WOFE','WOFE04010208','hello2','2016-01-19 16:06:31'),
  (2402,54,'WOFE','WOFE04010209','hello2','2016-01-19 16:06:31'),
  (2403,54,'WOFE','WOFE04010210','hello2','2016-01-19 16:06:31'),
  (2404,54,'WOFE','WOFE04010211','hello2','2016-01-19 16:06:31'),
  (2405,54,'WOFE','WOFE040103','hello2','2016-01-19 16:06:31'),
  (2406,54,'WOFE','WOFE04010301','hello2','2016-01-19 16:06:31'),
  (2407,54,'WOFE','WOFE04010302','hello2','2016-01-19 16:06:31'),
  (2408,54,'WOFE','WOFE04010303','hello2','2016-01-19 16:06:31'),
  (2409,54,'WOFE','WOFE04010304','hello2','2016-01-19 16:06:31'),
  (2410,54,'WOFE','WOFE04010305','hello2','2016-01-19 16:06:31'),
  (2411,54,'WOFE','WOFE04010306','hello2','2016-01-19 16:06:31'),
  (2412,54,'WOFE','WOFE040104','hello2','2016-01-19 16:06:31'),
  (2413,54,'WOFE','WOFE04010401','hello2','2016-01-19 16:06:31'),
  (2414,54,'WOFE','WOFE040105','hello2','2016-01-19 16:06:31'),
  (2415,54,'WOFE','WOFE040106','hello2','2016-01-19 16:06:31'),
  (2416,54,'WOFE','WOFE0402','hello2','2016-01-19 16:06:31'),
  (2417,54,'WOFE','WOFE040201','hello2','2016-01-19 16:06:31'),
  (2418,54,'WOFE','WOFE04020101','hello2','2016-01-19 16:06:31'),
  (2419,54,'WOFE','WOFE04020102','hello2','2016-01-19 16:06:31'),
  (2420,54,'WOFE','WOFE04020103','hello2','2016-01-19 16:06:31'),
  (2421,54,'WOFE','WOFE040202','hello2','2016-01-19 16:06:31'),
  (2422,54,'WOFE','WOFE04020201','hello2','2016-01-19 16:06:31'),
  (2423,54,'WOFE','WOFE04020202','hello2','2016-01-19 16:06:31'),
  (2424,54,'WOFE','WOFE040203','hello2','2016-01-19 16:06:31'),
  (2425,54,'WOFE','WOFE04020301','hello2','2016-01-19 16:06:31'),
  (2426,54,'WOFE','WOFE04020302','hello2','2016-01-19 16:06:31'),
  (2427,54,'WOFE','WOFE04020303','hello2','2016-01-19 16:06:31'),
  (2428,54,'WOFE','WOFE040204','hello2','2016-01-19 16:06:31'),
  (2429,54,'WOFE','WOFE04020401','hello2','2016-01-19 16:06:31'),
  (2430,54,'WOFE','WOFE04020402','hello2','2016-01-19 16:06:31'),
  (2431,54,'WOFE','WOFE040205','hello2','2016-01-19 16:06:31'),
  (2432,54,'WOFE','WOFE04020501','hello2','2016-01-19 16:06:31'),
  (2433,54,'WOFE','WOFE04020502','hello2','2016-01-19 16:06:31'),
  (2434,54,'WOFE','WOFE04020503','hello2','2016-01-19 16:06:31'),
  (2435,54,'WOFE','WOFE040206','hello2','2016-01-19 16:06:31'),
  (2436,54,'WOFE','WOFE04020601','hello2','2016-01-19 16:06:31'),
  (2437,54,'WOFE','WOFE0403','hello2','2016-01-19 16:06:31'),
  (2438,54,'WOFE','WOFE040301','hello2','2016-01-19 16:06:31'),
  (2439,54,'WOFE','WOFE04030101','hello2','2016-01-19 16:06:31'),
  (2440,54,'WOFE','WOFE0404','hello2','2016-01-19 16:06:31'),
  (2441,54,'WOFE','WOFE040401','hello2','2016-01-19 16:06:31'),
  (2442,54,'WOFE','WOFE04040101','hello2','2016-01-19 16:06:31'),
  (2443,54,'WOFE','WOFE04040102','hello2','2016-01-19 16:06:31'),
  (2444,54,'WOFE','WOFE04040103','hello2','2016-01-19 16:06:31'),
  (2445,54,'WOFE','WOFE04040104','hello2','2016-01-19 16:06:31'),
  (2446,54,'WOFE','WOFE04040105','hello2','2016-01-19 16:06:31'),
  (2447,54,'WOFE','WOFE04040106','hello2','2016-01-19 16:06:31'),
  (2448,54,'WOFE','WOFE0405','hello2','2016-01-19 16:06:31'),
  (2449,54,'WOFE','WOFE040501','hello2','2016-01-19 16:06:31'),
  (2450,54,'WOFE','WOFE04050101','hello2','2016-01-19 16:06:31'),
  (2451,54,'WOFE','WOFE04050102','hello2','2016-01-19 16:06:31'),
  (2452,54,'WOFE','WOFE04050103','hello2','2016-01-19 16:06:31'),
  (2453,54,'WOFE','WOFE04050104','hello2','2016-01-19 16:06:31'),
  (2454,54,'WOFE','WOFE040502','hello2','2016-01-19 16:06:31'),
  (2455,54,'WOFE','WOFE04050201','hello2','2016-01-19 16:06:31'),
  (2456,54,'WOFE','WOFE04050202','hello2','2016-01-19 16:06:31'),
  (2457,54,'WOFE','WOFE04050203','hello2','2016-01-19 16:06:31'),
  (2458,54,'WOFE','WOFE04050204','hello2','2016-01-19 16:06:31'),
  (2459,54,'WOFE','WOFE0406','hello2','2016-01-19 16:06:31'),
  (2460,54,'WOFE','WOFE040601','hello2','2016-01-19 16:06:31'),
  (2461,54,'WOFE','WOFE040602','hello2','2016-01-19 16:06:31'),
  (2462,54,'WOFE','WOFE040603','hello2','2016-01-19 16:06:31'),
  (2463,54,'WOFE','WOFE040604','hello2','2016-01-19 16:06:31'),
  (2464,54,'WOFE','WOFE040605','hello2','2016-01-19 16:06:31'),
  (2465,54,'WOFE','WOFE040606','hello2','2016-01-19 16:06:31'),
  (2466,54,'WOFE','WOFE040607','hello2','2016-01-19 16:06:31'),
  (2467,54,'WOFE','WOFE040608','hello2','2016-01-19 16:06:31'),
  (2468,54,'WOFE','WOFE040609','hello2','2016-01-19 16:06:31'),
  (2469,54,'WOFE','WOFE040610','hello2','2016-01-19 16:06:31'),
  (2470,54,'WOFE','WOFE040611','hello2','2016-01-19 16:06:31'),
  (2471,54,'WOFE','WOFE040612','hello2','2016-01-19 16:06:31'),
  (2472,54,'WOFE','WOFE040613','hello2','2016-01-19 16:06:31'),
  (2473,54,'WOFE','WOFE0407','hello2','2016-01-19 16:06:31'),
  (2474,54,'WOFE','WOFE040701','hello2','2016-01-19 16:06:31'),
  (2475,54,'WOFE','WOFE040702','hello2','2016-01-19 16:06:31'),
  (2476,54,'WOFE','WOFE040703','hello2','2016-01-19 16:06:31'),
  (2477,54,'WOFE','WOFE040704','hello2','2016-01-19 16:06:31'),
  (2478,54,'WOFE','WOFE040705','hello2','2016-01-19 16:06:31'),
  (2479,54,'WOFE','WOFE040706','hello2','2016-01-19 16:06:31'),
  (2480,54,'WOFE','WOFE040707','hello2','2016-01-19 16:06:31'),
  (2481,54,'WOFE','WOFE040708','hello2','2016-01-19 16:06:31'),
  (2482,54,'WOFE','WOFE0408','hello2','2016-01-19 16:06:31'),
  (2483,54,'WOFE','WOFE040801','hello2','2016-01-19 16:06:31'),
  (2484,54,'WOFE','WOFE040802','hello2','2016-01-19 16:06:31'),
  (2485,54,'WOFE','WOFE0409','hello2','2016-01-19 16:06:31'),
  (2486,54,'WOFE','WOFE040901','hello2','2016-01-19 16:06:31'),
  (2487,54,'WOFE','WOFE040902','hello2','2016-01-19 16:06:31'),
  (2488,54,'WOFE','WOFE0410','hello2','2016-01-19 16:06:31'),
  (2489,54,'WOFE','WOFE041001','hello2','2016-01-19 16:06:31'),
  (2490,54,'WOFE','WOFE041002','hello2','2016-01-19 16:06:31'),
  (2491,54,'WOFE','WOFE0411','hello2','2016-01-19 16:06:31'),
  (2492,54,'WOFE','WOFE0412','hello2','2016-01-19 16:06:31'),
  (2493,54,'WOFE','WOFE0413','hello2','2016-01-19 16:06:31'),
  (2494,54,'WOFE','WOFE041301','hello2','2016-01-19 16:06:31'),
  (2495,54,'WOFE','WOFE0414','hello2','2016-01-19 16:06:31'),
  (2496,54,'WOFE','WOFE041401','hello2','2016-01-19 16:06:31'),
  (2497,34,'WOFE','WOFE04010212','hello2','2016-01-19 17:21:58');
COMMIT;

#
# Data for the `sequence` table  (LIMIT 0,500)
#

INSERT INTO `sequence` (`name`, `current_value`, `increment`) VALUES
  ('seq_user',113,1);
COMMIT;

#
# Data for the `system` table  (LIMIT 0,500)
#

INSERT INTO `system` (`id`, `name`, `url`, `code`, `status`, `oper_user`, `oper_time`) VALUES
  (51,'财务系统','http://192.168.1.57:8080/ccigmall-financial-web_v10/toindex','CW',1,'hello2','2015-12-18 16:20:49'),
  (21,'权限系统','','QX',1,NULL,'2015-06-12 17:50:08');
COMMIT;

#
# Data for the `user` table  (LIMIT 0,500)
#

INSERT INTO `user` (`sequence_id`, `id`, `company_id`, `dep_id`, `position_id`, `real_name`, `sex`, `id_card`, `username`, `password`, `mobile`, `email`, `phone`, `status`, `orig_system_code`, `oper_user`, `oper_time`) VALUES
  (37,'N78',20,3,NULL,'dingwz',1,'','hello2','E10ADC3949BA59ABBE56E057F20F883E','13888888888','dingwz@cigmall.cn','',1,'','hello2','2015-07-20 12:08:12'),
  (75,'N98',20,4,NULL,'dev',1,'','dev','E10ADC3949BA59ABBE56E057F20F883E','18513838382','lanyt@cigmall.cn','',1,'','dev','2015-08-24 10:35:15');
COMMIT;

#
# Data for the `user_role` table  (LIMIT 0,500)
#

INSERT INTO `user_role` (`id`, `system_code`, `role_id`, `username`, `oper_user`, `oper_time`) VALUES
  (227,'QX',16,'hello2','hello2','2016-03-07 15:04:18'),
  (176,'QX',49,'dev','root','2016-03-22 18:29:52');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;