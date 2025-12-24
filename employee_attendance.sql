/*
SQLyog Ultimate v10.42 
MySQL - 8.0.37 : Database - employee_attendance
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`employee_attendance` /*!40100 DEFAULT CHARACTER SET utf16 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `employee_attendance`;

/*Table structure for table `clock_records` */

DROP TABLE IF EXISTS `clock_records`;

CREATE TABLE `clock_records` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '打卡记录唯一ID',
  `employee_id` int NOT NULL COMMENT '员工ID',
  `clock_time` datetime NOT NULL COMMENT '打卡时间戳',
  `device_id` varchar(50) DEFAULT NULL COMMENT '打卡设备ID',
  `location` varchar(100) DEFAULT NULL COMMENT '打卡位置',
  `type` tinyint DEFAULT NULL COMMENT '打卡类型（1-上班 2-下班）',
  `status` tinyint DEFAULT NULL COMMENT '打卡状态（0-异常 1-正常）',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`record_id`),
  KEY `idx_employee_clock` (`employee_id`,`clock_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf16 COMMENT='存储员工打卡原始记录';

/*Data for the table `clock_records` */

insert  into `clock_records`(`record_id`,`employee_id`,`clock_time`,`device_id`,`location`,`type`,`status`,`created_time`) values (1,2,'2023-10-25 08:45:12','D002','技术部办公室',1,1,'2025-09-03 19:33:08'),(2,2,'2023-10-25 18:05:33','D002','技术部办公室',2,1,'2025-09-03 19:33:08'),(3,3,'2023-10-25 09:01:45','D002','技术部办公室',1,1,'2025-09-03 19:33:08'),(4,3,'2023-10-25 18:15:22','D002','技术部办公室',2,1,'2025-09-03 19:33:08'),(5,4,'2023-10-25 08:50:11','D002','技术部办公室',1,1,'2025-09-03 19:33:08'),(6,4,'2023-10-25 17:58:09','D002','技术部办公室',2,1,'2025-09-03 19:33:08'),(7,5,'2023-10-25 08:42:33','D001','公司前台',1,1,'2025-09-03 19:33:08'),(8,5,'2023-10-25 17:55:41','D001','公司前台',2,1,'2025-09-03 19:33:08'),(9,99,'2025-09-04 09:34:29','D049','郑云龙',1,3,'2025-09-04 15:10:05');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `empno` int NOT NULL COMMENT '员工编号',
  `ename` varchar(32) DEFAULT NULL COMMENT '员工姓名',
  `job` varchar(32) DEFAULT NULL COMMENT '员工工作',
  `mgr` int DEFAULT NULL COMMENT '领导编号',
  `hiredate` date DEFAULT NULL COMMENT '入职日期',
  `sal` float DEFAULT NULL COMMENT '员工工资',
  `comm` float DEFAULT NULL COMMENT '员工奖金',
  `deptno` int DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='员工表';

/*Data for the table `emp` */

insert  into `emp`(`empno`,`ename`,`job`,`mgr`,`hiredate`,`sal`,`comm`,`deptno`) values (1002,'Linda','CLERK',1001,'1979-05-10',7300,NULL,10),(1003,'Helen','MANAGER',1007,'1983-05-12',15000,5000,30),(1004,'Jack','PROGRAMER',1010,'1982-02-05',18100,0,20),(1005,'Yamada','PROGRAMER',1010,'1982-02-05',17500,NULL,20),(1006,'Peter','SALESMAN',1003,'1982-12-12',8000,13000,30),(1007,'Larry','KING',NULL,'1978-08-01',35000,15000,10),(1008,'Lucy','CLERK',1003,'1984-05-27',7800,NULL,30),(1009,'Baker','SALESMAN',1013,'1983-07-02',8000,5000,30),(1010,'Scott','MANAGER',1007,'1981-02-14',25000,NULL,20),(1011,'Edwin','SALESMAN',1013,'1984-09-10',9000,12000,30),(1012,'Grally','SALESMAN',1013,'1985-01-01',8000,10000,30),(1013,'Doctory','MANAGER',1007,'1982-11-15',20000,NULL,30),(1014,'Lin','CLERK',1010,'1984-06-28',8000,NULL,20),(1015,'Richard','SALESMAN',1003,'1985-02-11',8500,2500,30),(4040,'张三','职员',NULL,'2020-09-04',NULL,NULL,10),(5251,'司马光','砸光',2399,'2005-12-06',8888.78,222.23,30);

/*Table structure for table `leave_records` */

DROP TABLE IF EXISTS `leave_records`;

CREATE TABLE `leave_records` (
  `leave_id` bigint NOT NULL AUTO_INCREMENT COMMENT '请假记录唯一ID',
  `employee_id` int NOT NULL COMMENT '员工ID',
  `type_id` int NOT NULL COMMENT '请假类型ID',
  `start_time` datetime NOT NULL COMMENT '请假开始时间',
  `end_time` datetime NOT NULL COMMENT '请假结束时间',
  `duration` decimal(5,2) DEFAULT NULL COMMENT '请假时长（天）',
  `status` tinyint DEFAULT '0' COMMENT '审批状态（0-待审批 1-通过 2-拒绝）',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf16 COMMENT='存储员工请假记录';

/*Data for the table `leave_records` */

insert  into `leave_records`(`leave_id`,`employee_id`,`type_id`,`start_time`,`end_time`,`duration`,`status`,`created_time`) values (1,3,2,'2023-10-20 09:00:00','2023-10-21 18:00:00',2.00,1,'2025-09-22 16:43:26'),(2,6,1,'2023-10-23 09:00:00','2023-10-25 18:00:00',3.00,1,'2025-09-22 16:43:26'),(3,8,3,'2023-10-26 09:00:00','2023-10-26 18:00:00',1.00,0,'2025-09-22 16:43:26');

/*Table structure for table `leave_types` */

DROP TABLE IF EXISTS `leave_types`;

CREATE TABLE `leave_types` (
  `type_id` int NOT NULL AUTO_INCREMENT COMMENT '请假类型ID',
  `type_name` varchar(50) NOT NULL COMMENT '请假类型名称（事假、病假等）',
  `deduct_policy` varchar(100) DEFAULT NULL COMMENT '扣薪策略',
  `requires_proof` tinyint DEFAULT '0' COMMENT '是否需要证明',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf16 COMMENT='存储请假类型及规则';

/*Data for the table `leave_types` */

insert  into `leave_types`(`type_id`,`type_name`,`deduct_policy`,`requires_proof`,`created_time`) values (1,'年假','不扣薪',0,'2025-09-03 19:34:30'),(2,'病假','按基本工资80%支付',1,'2025-09-03 19:34:30'),(3,'事假','扣除当日工资',0,'2025-09-03 19:34:30'),(4,'婚假','不扣薪',1,'2025-09-03 19:34:30'),(5,'产假','按国家规定执行',1,'2025-09-03 19:34:30'),(6,'丧假','不扣薪',0,'2025-09-03 19:34:30');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `parent_id` int DEFAULT '0' COMMENT '父菜单ID',
  `url` varchar(64) DEFAULT '#' COMMENT '请求地址',
  `visible` int DEFAULT '0' COMMENT '菜单状态（0隐藏 1显示）',
  `remark` varchar(64) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COMMENT='菜单权限表';

/*Data for the table `menu` */

insert  into `menu`(`menu_id`,`menu_name`,`parent_id`,`url`,`visible`,`remark`) values (1,'系统设置',0,'',1,'系统管理员使用'),(2,'组织架构管理',0,'',1,'系统管理员使用'),(3,'考勤记录管理',0,'',1,'系统管理员使用'),(5,'请假管理',0,'',1,'系统管理员使用'),(6,'薪资规则管理',0,'',1,'系统管理员使用'),(7,'系统日志',0,'/system_logs',1,'系统管理员使用'),(8,'部门管理',2,'',1,'组织架构管理员'),(11,'职位管理',2,'',1,'组织架构管理员'),(12,'员工管理',2,'',1,'组织架构管理员'),(13,'设备管理',2,'',1,'组织架构管理员'),(14,'班次管理',3,'/shifts',1,'考勤记录管理员 '),(15,'打卡记录管理',3,'/clock_records',1,'考勤记录管理员 '),(16,'加班记录管理',3,'/overtime_records',1,'考勤记录管理员 '),(17,'考勤统计管理',3,'',1,'考勤记录管理员 '),(22,'请假记录管理',5,'/leave_records',1,'请假管理员 '),(24,'请假类型管理',5,'leave_types',1,'请假管理员'),(33,'用户管理',1,'/user',1,'系统管理员使用');

/*Table structure for table `overtime_records` */

DROP TABLE IF EXISTS `overtime_records`;

CREATE TABLE `overtime_records` (
  `overtime_id` bigint NOT NULL AUTO_INCREMENT COMMENT '加班记录唯一ID',
  `employee_id` int NOT NULL COMMENT '员工ID',
  `start_time` datetime NOT NULL COMMENT '加班开始时间',
  `end_time` datetime NOT NULL COMMENT '加班结束时间',
  `duration` decimal(5,2) DEFAULT NULL COMMENT '加班时长（小时）',
  `multiplier` decimal(3,2) DEFAULT NULL COMMENT '薪资倍数',
  `status` tinyint DEFAULT '0' COMMENT '审批状态',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`overtime_id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf16 COMMENT='存储员工加班记录';

/*Data for the table `overtime_records` */

insert  into `overtime_records`(`overtime_id`,`employee_id`,`start_time`,`end_time`,`duration`,`multiplier`,`status`,`created_time`) values (1,2,'2023-10-24 19:00:00','2023-10-24 22:00:00',3.00,1.50,1,'2025-09-23 10:37:34'),(2,3,'2023-10-25 18:30:00','2023-10-25 21:00:00',2.50,1.50,0,'2025-09-23 10:37:34'),(3,4,'2023-10-22 09:00:00','2023-10-22 17:00:00',8.00,2.00,1,'2025-09-23 10:37:34');

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  `menu_id` int NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='角色和菜单关联表';

/*Data for the table `role_menu` */

insert  into `role_menu`(`id`,`role_id`,`menu_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,11),(10,2,12),(11,2,13),(12,3,14),(13,3,15),(14,3,16),(15,3,17),(16,5,22),(17,5,24);

/*Table structure for table `shifts` */

DROP TABLE IF EXISTS `shifts`;

CREATE TABLE `shifts` (
  `shift_id` int NOT NULL AUTO_INCREMENT COMMENT '班次唯一标识ID',
  `shift_name` varchar(50) NOT NULL COMMENT '班次名称（如：早班、晚班）',
  `start_time` time NOT NULL COMMENT '班次开始时间',
  `end_time` time NOT NULL COMMENT '班次结束时间',
  `flexible_minutes` int DEFAULT '0' COMMENT '弹性分钟数',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf16 COMMENT='存储班次时间安排';

/*Data for the table `shifts` */

insert  into `shifts`(`shift_id`,`shift_name`,`start_time`,`end_time`,`flexible_minutes`,`created_time`) values (1,'标准班','09:00:00','18:00:00',15,'2025-09-04 15:31:13'),(2,'早班','08:00:00','17:00:00',10,'2025-09-04 15:31:13'),(3,'晚班','13:00:00','22:00:00',15,'2025-09-04 15:31:13'),(4,'弹性班','10:00:00','19:00:00',30,'2025-09-04 15:31:13'),(5,'杜城','09:34:29','09:34:49',20,'2025-09-04 15:31:36'),(6,'不上班','00:00:22','00:00:33',10,'2025-09-11 12:10:55'),(8,'kkk','30:02:22','00:33:33',40,'2025-09-12 00:00:00');

/*Table structure for table `system_logs` */

DROP TABLE IF EXISTS `system_logs`;

CREATE TABLE `system_logs` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志唯一ID',
  `user_id` int DEFAULT NULL COMMENT '操作人ID',
  `action_type` varchar(50) NOT NULL COMMENT '操作类型',
  `action_details` text COMMENT '操作详情',
  `ip_address` varchar(45) DEFAULT NULL COMMENT '操作IP地址',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf16 COMMENT='存储系统操作日志';

/*Data for the table `system_logs` */

insert  into `system_logs`(`log_id`,`user_id`,`action_type`,`action_details`,`ip_address`,`created_time`) values (1,1,'登录','用户登录系统','192.168.1.101','2025-09-24 09:19:14'),(2,2,'打卡','上班打卡成功','192.168.1.102','2025-09-24 09:19:14'),(3,2,'打卡','下班打卡成功','192.168.1.102','2025-09-24 09:19:14'),(4,5,'审批','批准请假申请 ID: 3','192.168.1.105','2025-09-24 09:19:14'),(5,1,'配置修改','修改考勤规则','192.168.1.101','2025-09-24 09:19:14'),(999,0,'ff','fff','fff','2025-09-24 11:38:00');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `user_name` varchar(64) NOT NULL COMMENT '登录名',
  `user_password` varchar(64) NOT NULL COMMENT '密码',
  `real_name` varchar(64) NOT NULL COMMENT '真实姓名',
  `role_id` int DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user` */

insert  into `user`(`id`,`user_name`,`user_password`,`real_name`,`role_id`) values (1,'root','root123','赵系',1),(6,'aaa','aaa123','钱组',2),(7,'bbb','bbb123','孙考',3),(8,'ccc','ccc123','李请',5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
