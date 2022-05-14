/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_3306
 Source Server Type    : MySQL
 Source Server Version : 50168
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50168
 File Encoding         : 65001

 Date: 21/02/2020 14:38:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for library_admin
-- ----------------------------
DROP TABLE IF EXISTS `library_admin`;
CREATE TABLE `library_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ano` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员编号',
  `aname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `cdate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `udate` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(11) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of library_admin
-- ----------------------------
INSERT INTO `library_admin` VALUES (1, 'A111111', 'Administrator', '111111', '2019-02-10 17:12:44', '2019-02-10 03:34:10', 1);
INSERT INTO `library_admin` VALUES (2, 'A222222', 'Admin', '222222', '2019-02-10 17:12:44', '2019-02-10 03:34:10', 1);
INSERT INTO `library_admin` VALUES (3, 'A333333', 'adm', '333333', '2019-02-10 17:12:44', NULL, 1);

-- ----------------------------
-- Table structure for library_book
-- ----------------------------
DROP TABLE IF EXISTS `library_book`;
CREATE TABLE `library_book`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书编号',
  `bname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `tid` bigint(20) NULL DEFAULT NULL COMMENT '类型编号',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `price` double(8, 2) NULL DEFAULT NULL COMMENT '价格',
  `total` int(11) NULL DEFAULT 0 COMMENT '图书总数量',
  `remain` int(11) NULL DEFAULT 0 COMMENT '在馆数量',
  `brief` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `cdate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `udate` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(1) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of library_book
-- ----------------------------
INSERT INTO `library_book` VALUES (1, '100001', '大学英语', 1, '刘玲', 38.50, 50, 49, '新视野大学英语教程 郑树棠总主编 北京：外语教学与研究出版社，2003。  ', '2019-02-10 03:34:10', '2019-02-10 23:39:03', 1);
INSERT INTO `library_book` VALUES (2, '100002', '计算机基础', 3, '张良', 39.70, 50, 49, '《计算机基础》内容分为三篇，各篇内容如下：第一篇为综合评析。对历年“专转本”计算机基础考试的内容、形式、理论知识考点和操作能力考点进行了评析、汇总，并提出了针对性的复习方案。第二篇为内容详解。分10个章节对考试内容和掌握程度进行详尽阐述，并配备了典型试题解析和仿真练习。第三篇为全真测试。提供了近年来的考试试卷和解答，供考生实战训练之用。', '2019-02-10 13:43:23', '2019-02-10 23:39:06', 1);
INSERT INTO `library_book` VALUES (3, '100003', 'C语言程序设计', 3, '王晓光', 45.80, 50, 49, 'C语言是一种计算机程序设计语言。它既有高级语言的特点，又具有汇编语言的特点。它可以作为系统设计语言，编写工作系统应用程序，也可以作为应用程序设计语言，编写不依赖计算机硬件的应用程序。因此，它的应用范围广泛。', '2019-02-10 13:43:23', '2019-02-10 23:39:09', 1);
INSERT INTO `library_book` VALUES (4, '100004', 'Linux基础', 3, '李良', 54.60, 50, 49, 'Linux是一种自由和开放源码的类Unix操作系统。目前存在着许多不同的Linux,但它们都使用了Linux内核。Linux可安装在各种计算机硬件设备中，从手机、平板电脑、路由器和视频游戏控制台，到台式计算机、大型机和超级计算机。Linux是一个领先的操作系统，世界上运算最快的10台超级计算机运行的都是Linux操作系统。严格来讲，Linux这个词本身只表示Linux内核，但实际上人们已经习惯了用', '2019-02-10 13:43:23', '2019-02-10 23:39:12', 1);
INSERT INTO `library_book` VALUES (5, '100005', '芈月传', 2, '蒋胜男', 149.10, 60, 58, '她是历史上真实存在的传奇女性。“太后”一词由她而来。太后专权，也自她始。', '2019-02-10 13:43:23', '2019-02-10 23:39:15', 1);
INSERT INTO `library_book` VALUES (6, '100006', 'Java编程思想（第4版）', 3, 'Bruce Eckel', 73.40, 60, 58, '《计算机科学丛书：Java编程思想（第4版）》赢得了全球程序员的广泛赞誉，即使是最晦涩的概念，在BruceEckel的文字亲和力和小而直接的编程示例面前也会化解于无形。从Java的基础语法到高级特性（深入的面向对象概念、多线程、自动项目构建、单元测试和调试等），本书都能逐步指导你轻松掌握。', '2019-02-10 10:55:44', '2019-02-10 23:39:18', 1);
INSERT INTO `library_book` VALUES (8, '100007', '深入理解Java虚拟机', 3, '周志明', 58.00, 60, 58, '本书第1版两年内印刷近10次，4家网上书店的评论近4?000条，98%以上的评论全部为5星级的好评，是整个Java图书领域公认的经典著作和超级畅销书，繁体版在台湾也十分受欢迎。第2版在第1版的基础上做了很大的改进：根据全新的JDK 1.7对全书内容进行了全面的升级和补充；增加了大量处理各种常见JVM问题的技巧和优佳实践；增加了若干与生产环境相结合的实战案例；对第1版中的错误和不足之处的修正；等等。第2版不仅技术更新、内容更丰富，而且实战性更强。', '2019-02-10 23:05:33', '2019-02-10 23:39:27', 1);
INSERT INTO `library_book` VALUES (9, '100008', 'Java从入门到精通', 3, '明日科技', 40.70, 40, 40, '《软件开发视频大讲堂 Java从入门到精通（第3版）》从初学者角度出发，通过通俗易懂的语言、丰富多彩的实例，详细介绍了使用Java语言进行程序开发需要掌握的知识。全书分为28章，包括初识Java，熟悉Eclipse开发工具，Java语言基础，流程控制，字符串，数组，类和对象，包装类，数字处理类，接口、继承与多态，类的高级特性，异常处理，Swing程序设计，集合类，I/O（输入/输出），反射，枚举类型与泛型，多线程，网络通信，数据库操作，Swing表格组件，Swing树组件，Swing其他高级组件，高级布局管理器，高级事件处理，AWT绘图与音频播放，打印技术和企业进销存管理系统等。', '2019-02-10 23:09:16', '2019-02-10 23:05:05', 1);
INSERT INTO `library_book` VALUES (10, '100009', '盗墓笔记1七星鲁王宫', 2, '南派三叔', 32.00, 40, 39, '《盗墓笔记1七星鲁王宫》：', '2019-02-10 01:28:15', '2020-02-21 14:34:22', 1);
INSERT INTO `library_book` VALUES (11, '100010', '火车上的女孩', 2, '宝拉·霍金斯', 28.50, 40, 39, '瑞秋每天早晚在固定时间搭乘通勤火车上下班。她熟知火车会在同一盏信号灯前停留，让她得以透过车窗，窥见路旁15号住户的后院。她对这户人家的生活渐渐痴迷，甚至给男女主人分别取了名字：“杰丝”和“杰森”。在瑞秋的想象中，他们是一对情投意合的璧人，恩爱甜蜜的夫妻。她无比艳羡，又满怀妒意。直到有一天,瑞秋从车窗里看到了15号住户异常的一幕。一分钟后，火车重新启动，但三个人的命运从此改变。过去她只能从车窗后窥视陌生人的生活，而此刻，她与他们，开始有了紧密的交集。瑞秋不再甘心只当一个搭火车经过的路人……', '2019-02-10 01:49:40', '2020-02-21 14:34:08', 1);
INSERT INTO `library_book` VALUES (12, '100011', '吉他入门经典教程', 6, '李国标', 33.80, 20, 0, '抱着一把木吉他，随意弹唱喜欢的歌曲，这是多么炫酷的一件事！本书为零基础小白贴身打造，教会你从“DoReMi”开始，到《月亮代表我的心》、《童年》等简单歌曲，直到《十年》《她来听我的演唱会》，最后到创作属于自己的音乐，不知不觉中达到随心所欲的地步！', '2019-02-10 23:02:38', '2019-02-15 20:14:22', 1);

-- ----------------------------
-- Table structure for library_book_student
-- ----------------------------
DROP TABLE IF EXISTS `library_book_student`;
CREATE TABLE `library_book_student`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bid` bigint(20) NULL DEFAULT NULL COMMENT '图书id',
  `sid` bigint(20) NULL DEFAULT NULL COMMENT '学生id',
  `bdate` datetime NULL DEFAULT NULL COMMENT '借书日期',
  `rdate` datetime NULL DEFAULT NULL COMMENT '最后还书日期',
  `cdate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `udate` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(1) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of library_book_student
-- ----------------------------
INSERT INTO `library_book_student` VALUES (39, 12, 1, '2019-02-15 20:14:22', '2019-03-17 20:14:22', '2019-02-15 20:14:22', NULL, 1);
INSERT INTO `library_book_student` VALUES (40, 11, 1, '2020-02-21 11:07:48', '2020-02-28 11:07:48', '2020-02-21 11:07:48', '2020-02-21 14:34:08', 0);
INSERT INTO `library_book_student` VALUES (41, 10, 1, '2020-02-21 11:07:54', '2020-03-22 11:07:54', '2020-02-21 11:07:54', '2020-02-21 14:34:03', 0);
INSERT INTO `library_book_student` VALUES (42, 11, 1, '2020-02-21 14:34:08', '2020-02-28 14:34:08', '2020-02-21 14:34:08', NULL, 1);
INSERT INTO `library_book_student` VALUES (43, 10, 1, '2020-02-21 14:34:22', '2020-03-22 14:34:22', '2020-02-21 14:34:22', NULL, 1);

-- ----------------------------
-- Table structure for library_book_student_yy
-- ----------------------------
DROP TABLE IF EXISTS `library_book_student_yy`;
CREATE TABLE `library_book_student_yy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bid` bigint(20) NULL DEFAULT NULL COMMENT '图书id',
  `sid` bigint(20) NULL DEFAULT NULL COMMENT '学生id',
  `bdate` datetime NULL DEFAULT NULL COMMENT '预约日期',
  `cdate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `udate` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(1) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of library_book_student_yy
-- ----------------------------
INSERT INTO `library_book_student_yy` VALUES (1, 12, 1, '2020-02-21 11:03:14', '2020-02-21 11:03:14', NULL, 1);

-- ----------------------------
-- Table structure for library_book_type
-- ----------------------------
DROP TABLE IF EXISTS `library_book_type`;
CREATE TABLE `library_book_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书分类',
  `cdate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `udate` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(1) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of library_book_type
-- ----------------------------
INSERT INTO `library_book_type` VALUES (1, '语言', '2019-02-10 13:43:23', '2019-02-10 02:01:26', 1);
INSERT INTO `library_book_type` VALUES (2, '文学', '2019-02-10 13:43:23', NULL, 1);
INSERT INTO `library_book_type` VALUES (3, '计算机', '2019-02-10 12:55:16', '2019-02-10 02:26:26', 1);
INSERT INTO `library_book_type` VALUES (4, '科技', '2019-02-10 12:57:58', NULL, 1);
INSERT INTO `library_book_type` VALUES (5, '美术', '2019-02-10 12:57:58', NULL, 1);
INSERT INTO `library_book_type` VALUES (6, '音乐', '2019-02-10 12:57:58', NULL, 1);

-- ----------------------------
-- Table structure for library_setting
-- ----------------------------
DROP TABLE IF EXISTS `library_setting`;
CREATE TABLE `library_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设置项名称',
  `value` int(11) NULL DEFAULT NULL COMMENT '设置项值',
  `cdate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `udate` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `yn` int(11) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of library_setting
-- ----------------------------
INSERT INTO `library_setting` VALUES (1, '最多借阅天数', 30, '2019-02-10 17:12:44', '2019-02-10 03:40:18', 1);
INSERT INTO `library_setting` VALUES (2, '最多借阅本数', 7, '2019-02-10 17:12:44', '2019-02-10 03:40:44', 1);
INSERT INTO `library_setting` VALUES (3, '超期金额/天（角）', 1, '2020-02-19 13:19:08', '2020-02-19 13:22:20', 1);

-- ----------------------------
-- Table structure for library_student
-- ----------------------------
DROP TABLE IF EXISTS `library_student`;
CREATE TABLE `library_student`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `sname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `cdate` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `udate` datetime NULL DEFAULT NULL COMMENT '修改日期',
  `yn` int(11) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of library_student
-- ----------------------------
INSERT INTO `library_student` VALUES (1, 'S111111', '李晓明', '111111', '2019-02-10 17:12:44', '2019-02-10 13:52:06', 1);
INSERT INTO `library_student` VALUES (2, 'S222222', '张晓华', '222222', '2019-02-10 17:12:44', NULL, 1);
INSERT INTO `library_student` VALUES (3, 'S333333', '孙晓丽', '333333', '2019-02-10 17:12:44', NULL, 1);
INSERT INTO `library_student` VALUES (4, 'S444444', '吴晓兰', '444444', '2019-02-10 17:12:44', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
