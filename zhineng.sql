/*
 Navicat Premium Data Transfer

 Source Server         : Mysql-8.0
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : zhineng

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 23/08/2025 00:24:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo`  (
  `adminid` int NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `adminname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `adminpwd` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登陆密码',
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属角色',
  `headimg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `admincreatetime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `islock` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户状态',
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES (1, 'admin', '12456', '管理员', 'http://www.javalm.cn/img/1.png', '2024-03-28 09:54:44', '可用');
INSERT INTO `admininfo` VALUES (2, 'admin2', '123456', '管理员', 'http://www.javalm.cn/file/head.jpg', '2025-02-28 09:54:44', '可用');
INSERT INTO `admininfo` VALUES (4, 'admin355', '123456', '管理员', 'http://www.javalm.cn/img/1.png', '2022-02-28 09:54:44', '禁用');
INSERT INTO `admininfo` VALUES (6, 'adminq', '123456', '管理员', 'http://localhost:8088/uploads/1755877042379_8.jpg', '2025-08-22 23:36:57', '可用');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `picurl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '轮播图' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (2, '轮播图02', 'http://www.javalm.cn/file/a2.jpeg');
INSERT INTO `carousel` VALUES (3, '轮播图03', 'http://www.javalm.cn/file/a3.jpeg');

-- ----------------------------
-- Table structure for commentinfo
-- ----------------------------
DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `tid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评论数据',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评论用户',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `picurl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `addtime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `likenum` int NULL DEFAULT NULL COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程评价' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of commentinfo
-- ----------------------------
INSERT INTO `commentinfo` VALUES (2, '1', 'test', '这个视频真的超赞，知识点很实用！', 'http://www.javalm.cn/img/2.png', '2023-02-08 00:00:48', 10);
INSERT INTO `commentinfo` VALUES (3, '1', '张三', '视频讲解很清晰，一下就懂了！', 'http://www.javalm.cn/img/2.png', '2023-02-09 12:30:00', 12);
INSERT INTO `commentinfo` VALUES (4, '2', '李四', '内容丰富，值得反复观看！', 'http://www.javalm.cn/img/2.png', '2023-02-10 15:45:00', 17);
INSERT INTO `commentinfo` VALUES (5, '2', 'test', '讲解深入浅出，非常不错！', 'http://www.javalm.cn/img/2.png', '2023-02-11 09:15:00', 11);
INSERT INTO `commentinfo` VALUES (6, '3', '张三', '视频很有价值，学到了很多！', 'http://www.javalm.cn/img/2.png', '2023-02-12 17:20:00', 19);
INSERT INTO `commentinfo` VALUES (7, '3', '李四', '制作精良，一看就是用心了！', 'http://www.javalm.cn/img/2.png', '2023-02-13 10:05:00', 12);
INSERT INTO `commentinfo` VALUES (8, '4', 'test', '很喜欢这个视频的风格，很吸引人！', 'http://www.javalm.cn/img/2.png', '2023-02-14 14:30:00', 13);
INSERT INTO `commentinfo` VALUES (9, '4', '张三', '讲解详细，解决了我的疑惑！', 'http://www.javalm.cn/img/2.png', '2023-02-15 19:45:00', 16);
INSERT INTO `commentinfo` VALUES (10, '5', '李四', '内容新颖，大开眼界！', 'http://www.javalm.cn/img/2.png', '2023-02-16 11:20:00', 20);
INSERT INTO `commentinfo` VALUES (11, '5', 'test', '视频很有趣，看了还想看！', 'http://www.javalm.cn/img/2.png', '2023-02-17 16:05:00', 7);
INSERT INTO `commentinfo` VALUES (12, '6', '张三', '干货满满，必须点赞！', 'http://www.javalm.cn/img/2.png', '2023-02-18 13:30:00', 14);
INSERT INTO `commentinfo` VALUES (13, '6', '李四', '讲解很生动，容易理解！', 'http://www.javalm.cn/img/2.png', '2023-02-19 20:45:00', 17);
INSERT INTO `commentinfo` VALUES (14, '7', 'test', '这个视频太有用了，收藏了！', 'http://www.javalm.cn/img/2.png', '2023-02-20 09:15:00', 10);
INSERT INTO `commentinfo` VALUES (15, '7', '张三', '内容很有深度，值得研究！', 'http://www.javalm.cn/img/2.png', '2023-02-21 15:30:00', 12);
INSERT INTO `commentinfo` VALUES (16, '8', '李四', '视频质量很高，很清晰！', 'http://www.javalm.cn/img/2.png', '2023-02-22 18:45:00', 13);
INSERT INTO `commentinfo` VALUES (17, '8', 'test', '讲解很有条理，很赞！', 'http://www.javalm.cn/img/2.png', '2023-02-23 12:05:00', 10);
INSERT INTO `commentinfo` VALUES (18, '9', '张三', '学到了很多新知识，感谢！', 'http://www.javalm.cn/img/2.png', '2023-02-24 16:30:00', 12);
INSERT INTO `commentinfo` VALUES (19, '9', '李四', '视频很有创意，很不错！', 'http://www.javalm.cn/img/2.png', '2023-02-25 21:45:00', 15);
INSERT INTO `commentinfo` VALUES (20, '10', 'test', '内容很实用，立马就用上了！', 'http://www.javalm.cn/img/2.png', '2023-02-26 10:15:00', 14);
INSERT INTO `commentinfo` VALUES (21, '10', '张三', '讲解很细致，非常好！', 'http://www.javalm.cn/img/2.png', '2023-02-27 17:30:00', 16);
INSERT INTO `commentinfo` VALUES (22, '11', '李四', '这个视频太棒了，力荐！', 'http://www.javalm.cn/img/2.png', '2023-02-28 13:45:00', 18);
INSERT INTO `commentinfo` VALUES (23, '11', 'test', '讲解很通俗易懂，适合新手！', 'http://www.javalm.cn/img/2.png', '2023-03-01 09:05:00', 11);
INSERT INTO `commentinfo` VALUES (24, '12', '张三', '内容很丰富，值得一看！', 'http://www.javalm.cn/img/2.png', '2023-03-02 15:30:00', 13);
INSERT INTO `commentinfo` VALUES (25, '12', '李四', '视频很精彩，期待更多！', 'http://www.javalm.cn/img/2.png', '2023-03-03 18:45:00', 15);
INSERT INTO `commentinfo` VALUES (26, '13', 'test', '学到了很多技巧，感谢分享！', 'http://www.javalm.cn/img/2.png', '2023-03-04 12:05:00', 10);
INSERT INTO `commentinfo` VALUES (27, '13', '张三', '讲解很清晰，一目了然！', 'http://www.javalm.cn/img/2.png', '2023-03-05 16:30:00', 12);
INSERT INTO `commentinfo` VALUES (28, '14', '李四', '视频很有价值，值得反复看！', 'http://www.javalm.cn/img/2.png', '2023-03-06 21:45:00', 14);
INSERT INTO `commentinfo` VALUES (29, '14', 'test', '内容很新颖，很有吸引力！', 'http://www.javalm.cn/img/2.png', '2023-03-07 10:15:00', 16);
INSERT INTO `commentinfo` VALUES (30, '15', '张三', '干货多多，收获满满！', 'http://www.javalm.cn/img/2.png', '2023-03-08 17:30:00', 19);
INSERT INTO `commentinfo` VALUES (31, '15', '李四', '讲解很生动，很容易懂！', 'http://www.javalm.cn/img/2.png', '2023-03-09 13:45:00', 12);
INSERT INTO `commentinfo` VALUES (32, '16', 'test', '这个视频太实用了，爱了！', 'http://www.javalm.cn/img/2.png', '2023-03-10 09:05:00', 13);
INSERT INTO `commentinfo` VALUES (33, '16', '张三', '内容很有深度，很有启发！', 'http://www.javalm.cn/img/2.png', '2023-03-11 15:30:00', 15);
INSERT INTO `commentinfo` VALUES (34, '17', '李四', '视频质量很高，很清晰！', 'http://www.javalm.cn/img/2.png', '2023-03-12 18:45:00', 17);
INSERT INTO `commentinfo` VALUES (35, '17', 'test', '讲解很有条理，很容易跟上！', 'http://www.javalm.cn/img/2.png', '2023-03-13 12:05:00', 10);
INSERT INTO `commentinfo` VALUES (36, '18', '张三', '学到了很多东西，感谢！', 'http://www.javalm.cn/img/2.png', '2023-03-14 16:30:00', 12);
INSERT INTO `commentinfo` VALUES (37, '18', '李四', '视频很有创意，很喜欢！', 'http://www.javalm.cn/img/2.png', '2023-03-15 21:45:00', 14);
INSERT INTO `commentinfo` VALUES (38, '19', 'test', '内容很实用，马上试试！', 'http://www.javalm.cn/img/2.png', '2023-03-16 10:15:00', 16);
INSERT INTO `commentinfo` VALUES (39, '19', '张三', '讲解很细致，非常棒！', 'http://www.javalm.cn/img/2.png', '2023-03-17 17:30:00', 18);
INSERT INTO `commentinfo` VALUES (40, '20', '李四', '这个视频太棒了，推荐！', 'http://www.javalm.cn/img/2.png', '2023-03-18 13:45:00', 11);
INSERT INTO `commentinfo` VALUES (41, '20', 'test', '讲解很通俗易懂，适合大众！', 'http://www.javalm.cn/img/2.png', '2023-03-19 09:05:00', 13);
INSERT INTO `commentinfo` VALUES (42, '21', '张三', '内容很丰富，很有看点！', 'http://www.javalm.cn/img/2.png', '2023-03-20 15:30:00', 15);
INSERT INTO `commentinfo` VALUES (43, '21', '李四', '视频很精彩，值得一看！', 'http://www.javalm.cn/img/2.png', '2023-03-21 18:45:00', 17);
INSERT INTO `commentinfo` VALUES (44, '22', 'test', '学到了很多技巧，很实用！', 'http://www.javalm.cn/img/2.png', '2023-03-22 12:05:00', 10);
INSERT INTO `commentinfo` VALUES (45, '22', '张三', '讲解很清晰，很容易理解！', 'http://www.javalm.cn/img/2.png', '2023-03-23 16:30:00', 12);
INSERT INTO `commentinfo` VALUES (47, '23', 'test', '内容很新颖，很吸引人！', 'http://www.javalm.cn/img/2.png', '2023-03-25 10:15:00', 16);
INSERT INTO `commentinfo` VALUES (48, '24', '张三', '干货满满，非常实用！', 'http://www.javalm.cn/img/2.png', '2023-03-26 17:30:00', 18);
INSERT INTO `commentinfo` VALUES (49, '24', '李四', '讲解很生动，很容易懂！', 'http://www.javalm.cn/img/2.png', '2023-03-27 13:45:00', 11);
INSERT INTO `commentinfo` VALUES (50, '25', 'test', '这个视频太有用了，必须赞！', 'http://www.javalm.cn/img/2.png', '2023-03-28 09:05:00', 13);
INSERT INTO `commentinfo` VALUES (51, '25', '张三', '内容很有深度，很有意义！', 'http://www.javalm.cn/img/2.png', '2023-03-29 15:30:00', 15);
INSERT INTO `commentinfo` VALUES (52, '26', '李四', '视频质量很高，很清晰！', 'http://www.javalm.cn/img/2.png', '2023-03-30 18:45:00', 17);
INSERT INTO `commentinfo` VALUES (53, '26', 'test', '讲解很有条理，很容易跟上！', 'http://www.javalm.cn/img/2.png', '2023-03-31 12:05:00', 10);
INSERT INTO `commentinfo` VALUES (54, '27', '张三', '学到了很多东西，感谢分享！', 'http://www.javalm.cn/img/2.png', '2023-04-01 16:30:00', 12);
INSERT INTO `commentinfo` VALUES (55, '27', '李四', '视频很有创意，很喜欢！', 'http://www.javalm.cn/img/2.png', '2023-04-02 21:45:00', 14);
INSERT INTO `commentinfo` VALUES (56, '28', 'test', '内容很实用，马上实践！', 'http://www.javalm.cn/img/2.png', '2023-04-03 10:15:00', 16);
INSERT INTO `commentinfo` VALUES (57, '28', '张三', '讲解很细致，非常好！', 'http://www.javalm.cn/img/2.png', '2023-04-04 17:30:00', 18);
INSERT INTO `commentinfo` VALUES (58, '29', '李四', '这个视频太棒了，值得推荐！', 'http://www.javalm.cn/img/2.png', '2023-04-05 13:45:00', 11);
INSERT INTO `commentinfo` VALUES (59, '29', 'test', '讲解很通俗易懂，适合所有人！', 'http://www.javalm.cn/img/2.png', '2023-04-06 09:05:00', 13);
INSERT INTO `commentinfo` VALUES (60, '30', '张三', '内容很丰富，很有价值！', 'http://www.javalm.cn/img/2.png', '2023-04-07 15:30:00', 15);
INSERT INTO `commentinfo` VALUES (61, '30', '李四', '视频很精彩，不容错过！', 'http://www.javalm.cn/img/2.png', '2023-04-08 18:45:00', 17);
INSERT INTO `commentinfo` VALUES (62, '31', 'test', '学到了很多技巧，很有帮助！', 'http://www.javalm.cn/img/2.png', '2023-04-09 12:05:00', 10);
INSERT INTO `commentinfo` VALUES (63, '31', '张三', '讲解很清晰，很容易掌握！', 'http://www.javalm.cn/img/2.png', '2023-04-10 16:30:00', 12);
INSERT INTO `commentinfo` VALUES (64, '32', '李四', '视频很有价值，值得反复品味！', 'http://www.javalm.cn/img/2.png', '2023-04-11 21:45:00', 14);
INSERT INTO `commentinfo` VALUES (65, '32', 'test', '内容很新颖，很有吸引力！', 'http://www.javalm.cn/img/2.png', '2023-04-12 10:15:00', 16);
INSERT INTO `commentinfo` VALUES (66, '33', '张三', '干货满满，非常实用！', 'http://www.javalm.cn/img/2.png', '2023-04-13 17:30:00', 18);
INSERT INTO `commentinfo` VALUES (67, '33', '李四', '讲解很生动，很容易懂！', 'http://www.javalm.cn/img/2.png', '2023-04-14 13:45:00', 11);
INSERT INTO `commentinfo` VALUES (68, '34', 'test', '这个视频太有用了，必须收藏！', 'http://www.javalm.cn/img/2.png', '2023-04-15 09:05:00', 13);
INSERT INTO `commentinfo` VALUES (69, '34', '张三', '内容很有深度，很有启发！', 'http://www.javalm.cn/img/2.png', '2023-04-16 15:30:00', 15);
INSERT INTO `commentinfo` VALUES (70, '35', '李四', '视频质量很高，很清晰！', 'http://www.javalm.cn/img/2.png', '2023-04-17 18:45:00', 17);
INSERT INTO `commentinfo` VALUES (71, '35', 'test', '讲解很有条理，很容易跟上！', 'http://www.javalm.cn/img/2.png', '2023-04-18 12:05:00', 10);
INSERT INTO `commentinfo` VALUES (72, '1', '贾子骞', '', 'http://www.javalm.cn/img/97.png', '2025-08-17 23:45:29', 0);
INSERT INTO `commentinfo` VALUES (73, '2', 'test', '收获颇丰\r\n', 'http://www.javalm.cn/img/186.png', '2025-08-22 09:25:22', 1);
INSERT INTO `commentinfo` VALUES (74, '3', 'test', '收获颇丰\r\n', 'http://www.javalm.cn/file/1.jpg', '2025-08-22 11:09:03', 1);
INSERT INTO `commentinfo` VALUES (75, '2', 'test', '学到了东西', 'http://www.javalm.cn/img/186.png', '2025-08-22 23:09:59', 0);
INSERT INTO `commentinfo` VALUES (76, '15', 'test', 'hun', 'http://www.javalm.cn/img/186.png', '2025-08-22 23:18:45', 1);
INSERT INTO `commentinfo` VALUES (77, '7', 'test', '哈哈啊哈\r\n', 'http://www.javalm.cn/img/186.png', '2025-08-22 23:28:21', 1);

-- ----------------------------
-- Table structure for datainfo
-- ----------------------------
DROP TABLE IF EXISTS `datainfo`;
CREATE TABLE `datainfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `outline` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程详情',
  `picurl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程主图',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `content` varchar(10000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程内容',
  `hits` int NULL DEFAULT NULL COMMENT '浏览量',
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程状态',
  `intro` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程备注',
  `createtime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `nums` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程价格',
  `adduser` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of datainfo
-- ----------------------------
INSERT INTO `datainfo` VALUES (2, 'java面向对象编程', '深入理解 Java 的面向对象特性', 'http://www.javalm.cn/file/video03.png', 'Java编程', '包括类、对象、继承、多态、封装等核心概念。', 120, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 12:35:47', '35', 'admin');
INSERT INTO `datainfo` VALUES (3, 'java异常处理', '学习 Java 中的异常处理机制', 'http://www.javalm.cn/file/video03.png', 'Java编程', '介绍异常的分类、捕获和抛出，以及自定义异常的实现。', 90, '正常', 'http://www.javalm.cn/file/4.mp4', '2025-04-27 12:35:47', '25', 'admin');
INSERT INTO `datainfo` VALUES (4, 'java集合框架', '掌握 Java 的集合框架', 'http://www.javalm.cn/file/video04.png', 'Java编程', '讲解 List、Set、Map 等常用集合类的使用。', 110, '正常', 'http://www.javalm.cn/file/4.mp4', '2025-04-27 12:35:47', '32', 'admin');
INSERT INTO `datainfo` VALUES (5, 'java输入输出流', '了解 Java 的输入输出流体系', 'http://www.javalm.cn/file/video03.png', 'Java编程', '包括文件操作、字节流、字符流等内容。', 105, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 12:35:47', '31', 'admin');
INSERT INTO `datainfo` VALUES (6, '多线程编程', '学习 Java 的多线程编程', 'http://www.javalm.cn/file/video02.png', 'Java编程', '介绍线程的创建、同步、通信等知识。', 130, '正常', 'http://www.javalm.cn/file/4.mp4', '2025-04-27 12:35:47', '38', 'admin');
INSERT INTO `datainfo` VALUES (7, 'java网络编程', '掌握 Java 的网络编程基础', 'http://www.javalm.cn/file/video01.png', 'Java编程', '讲解 TCP 和 UDP 协议的使用，以及 Socket 编程。', 108, '正常', 'http://www.javalm.cn/file/2.mp4', '2025-04-27 12:35:47', '33', 'admin');
INSERT INTO `datainfo` VALUES (8, '数据库连接', '学习 Java 与数据库的连接', 'http://www.javalm.cn/file/video03.png', 'Java编程', '介绍 JDBC 的使用，包括数据库的连接、查询、更新等操作。', 115, '正常', 'http://www.javalm.cn/file/2.mp4', '2025-04-27 12:35:47', '36', 'admin');
INSERT INTO `datainfo` VALUES (9, '反射机制', '了解 Java 的反射机制', 'http://www.javalm.cn/file/video03.png', 'Java编程', '讲解如何在运行时获取类的信息和调用类的方法。', 95, '正常', 'http://www.javalm.cn/file/4.mp4', '2025-04-27 12:35:47', '28', 'admin');
INSERT INTO `datainfo` VALUES (10, '注解与泛型', '掌握 Java 的注解和泛型特性', 'http://www.javalm.cn/file/video02.png', 'Java编程', '介绍注解的定义和使用，以及泛型的类型参数和通配符。', 102, '正常', 'http://www.javalm.cn/file/4.mp4', '2025-04-27 12:35:47', '30', 'admin');
INSERT INTO `datainfo` VALUES (11, 'Java 8 新特性', '学习 Java 8 的新特性', 'http://www.javalm.cn/file/video03.png', 'Java编程', '包括 Lambda 表达式、Stream API、函数式接口等内容。', 125, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 12:35:47', '37', 'admin');
INSERT INTO `datainfo` VALUES (12, '设计模式', '了解 Java 中的设计模式', 'http://www.javalm.cn/file/video03.png', 'Java编程', '介绍常见的设计模式，如单例模式、工厂模式、观察者模式等。', 112, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 12:35:47', '34', 'admin');
INSERT INTO `datainfo` VALUES (13, '单元测试', '学习 Java 的单元测试方法', 'http://www.javalm.cn/file/video01.png', 'Java编程', '介绍 JUnit 框架的使用，编写和运行单元测试用例。', 98, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 12:35:47', '29', 'admin');
INSERT INTO `datainfo` VALUES (14, 'Java 开发工具', '掌握常用的 Java 开发工具', 'http://www.javalm.cn/file/video04.png', 'Java编程', '介绍 Eclipse、IntelliJ IDEA 等开发工具的使用。', 106, '正常', 'http://www.javalm.cn/file/2.mp4', '2025-04-27 12:35:47', '32', 'admin');
INSERT INTO `datainfo` VALUES (15, 'Java 项目实战', '通过项目实战巩固 Java 知识', 'http://www.javalm.cn/file/video03.png', 'Java编程', '开发一个简单的 Java 项目，如学生管理系统。', 135, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 12:35:47', '40', 'admin');
INSERT INTO `datainfo` VALUES (16, 'Python 基础语法', '介绍 Python 的基本语法规则', 'http://www.javalm.cn/file/video02.png', 'Python 编程', '涵盖变量、数据类型（如整数、浮点数、字符串、列表、元组、字典）、运算符、控制结构（如 if - else 语句、循环语句）等内容。', 100, '正常', 'http://www.javalm.cn/file/4.mp4', '2025-04-27 12:36:43', '30', 'admin');
INSERT INTO `datainfo` VALUES (17, '函数与模块', '学习函数的定义与使用，以及模块的导入', 'http://www.javalm.cn/file/video03.png', 'Python 编程', '讲解如何定义和调用函数，包括参数传递、返回值等；同时介绍 Python 模块的概念，如何导入和使用标准库与第三方库模块。', 120, '正常', 'http://www.javalm.cn/file/4.mp4', '2025-04-27 12:36:43', '35', 'admin');
INSERT INTO `datainfo` VALUES (18, 'python面向对象编程', '深入理解 Python 的面向对象特性', 'http://www.javalm.cn/file/video01.png', 'Python 编程', '包括类、对象、继承、多态、封装等核心概念，以及如何在 Python 中实现面向对象的程序设计。', 110, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 12:36:43', '32', 'admin');
INSERT INTO `datainfo` VALUES (19, 'python文件操作', '掌握 Python 对文件的读写操作', 'http://www.javalm.cn/file/video03.png', 'Python 编程', '介绍如何打开、读取、写入和关闭文件，以及对不同格式文件（如文本文件、CSV 文件）的处理。', 90, '正常', 'http://www.javalm.cn/file/2.mp4', '2025-04-27 12:36:43', '25', 'admin');
INSERT INTO `datainfo` VALUES (20, 'python异常处理', '学习 Python 中的异常处理机制', 'http://www.javalm.cn/file/video02.png', 'Python 编程', '讲解异常的分类、捕获和抛出，以及如何编写健壮的代码来处理可能出现的错误。', 105, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 12:36:43', '31', 'admin');
INSERT INTO `datainfo` VALUES (21, '数据科学基础库', '了解 Python 在数据科学领域常用的库', 'http://www.javalm.cn/file/video01.png', 'Python 编程', '介绍 NumPy（用于数值计算）、Pandas（用于数据处理与分析）、Matplotlib（用于数据可视化）等库的基本使用。', 130, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 12:36:43', '38', 'admin');
INSERT INTO `datainfo` VALUES (22, 'Web 开发基础', '学习使用 Python 进行 Web 开发', 'http://www.javalm.cn/file/video03.png', 'Python 编程', '介绍 Flask 或 Django 等 Web 框架的基本概念和使用方法，包括路由、视图、模板等。', 108, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 12:36:43', '33', 'admin');
INSERT INTO `datainfo` VALUES (23, '数据库连接与操作', '掌握 Python 与数据库的交互', 'http://www.javalm.cn/file/video04.png', 'Python 编程', '讲解如何使用 Python 连接不同类型的数据库（如 MySQL、SQLite），进行数据的增删改查操作。', 115, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 12:36:43', '36', 'admin');
INSERT INTO `datainfo` VALUES (24, '爬虫基础', '了解 Python 爬虫的基本原理与实现', 'http://www.javalm.cn/file/video03.png', 'Python 编程', '介绍如何使用 Requests 库发送 HTTP 请求，以及使用 BeautifulSoup 或 Scrapy 等工具解析 HTML 页面、提取数据。', 125, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 12:36:43', '37', 'admin');
INSERT INTO `datainfo` VALUES (25, '装饰器与生成器', '学习 Python 的高级特性', 'http://www.javalm.cn/file/video01.png', 'Python 编程', '讲解装饰器的概念和使用场景，以及生成器的原理和实现方式，如生成器函数和生成器表达式。', 102, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 12:36:43', '30', 'admin');
INSERT INTO `datainfo` VALUES (26, 'MySQL 基础概述', '了解 MySQL 数据库的基本概念和应用场景', 'http://www.javalm.cn/file/video02.png', 'MySQL 数据库', '介绍 MySQL 的发展历程、特点、适用场景，以及如何安装和启动 MySQL 服务。', 100, '正常', 'http://www.javalm.cn/file/2.mp4', '2025-04-27 16:28:35', '30', 'admin');
INSERT INTO `datainfo` VALUES (27, 'SQL 基本语句', '掌握 SQL 基本语句的使用', 'http://www.javalm.cn/file/video02.png', 'MySQL 数据库', '讲解 SQL 的数据定义语言（DDL），如创建、修改和删除数据库、表；数据操作语言（DML），如插入、更新和删除数据；数据查询语言（DQL），如简单查询、条件查询、排序和分组查询。', 120, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 16:28:35', '35', 'admin');
INSERT INTO `datainfo` VALUES (28, '数据库设计与建模', '学习数据库设计的原则和方法', 'http://www.javalm.cn/file/video02.png', 'MySQL 数据库', '介绍数据库设计的流程，包括需求分析、概念设计、逻辑设计和物理设计，以及如何使用 E - R 图进行数据库建模。', 110, '正常', 'http://www.javalm.cn/file/2.mp4', '2025-04-27 16:28:35', '32', 'admin');
INSERT INTO `datainfo` VALUES (29, '索引与优化', '理解索引的原理和优化方法', 'http://www.javalm.cn/file/video01.png', 'MySQL 数据库', '讲解索引的类型、创建和使用，以及如何通过索引优化数据库查询性能，还会介绍执行计划的分析方法。', 90, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 16:28:35', '25', 'admin');
INSERT INTO `datainfo` VALUES (30, '事务处理与并发控制', '掌握事务的概念和并发控制机制', 'http://www.javalm.cn/file/video03.png', 'MySQL 数据库', '介绍事务的特性（ACID）、事务的开始、提交和回滚操作，以及如何处理并发访问带来的数据一致性问题，如锁机制和事务隔离级别。', 105, '正常', 'http://www.javalm.cn/file/4.mp4', '2025-04-27 16:28:35', '31', 'admin');
INSERT INTO `datainfo` VALUES (31, '存储过程与函数', '学会使用存储过程和函数', 'http://www.javalm.cn/file/video03.png', 'MySQL 数据库', '讲解存储过程和函数的定义、创建和调用方法，以及它们在数据库开发中的应用场景和优势。', 130, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 16:28:35', '38', 'admin');
INSERT INTO `datainfo` VALUES (32, '视图与触发器', '了解视图和触发器的使用', 'http://www.javalm.cn/file/video03.png', 'MySQL 数据库', '介绍视图的概念、创建和使用，以及触发器的定义、触发条件和应用场景，如在数据插入、更新或删除时自动执行特定操作。', 108, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 16:28:35', '33', 'admin');
INSERT INTO `datainfo` VALUES (33, '用户管理与权限控制', '掌握 MySQL 的用户管理和权限设置', 'http://www.javalm.cn/file/video01.png', 'MySQL 数据库', '讲解如何创建、修改和删除用户，以及如何为用户分配不同的数据库权限，确保数据库的安全性。', 115, '正常', 'http://www.javalm.cn/file/1.mp4', '2025-04-27 16:28:35', '36', 'admin');
INSERT INTO `datainfo` VALUES (34, '备份与恢复', '学习数据库的备份和恢复方法', 'http://www.javalm.cn/file/video03.png', 'MySQL 数据库', '介绍常见的数据库备份方式，如物理备份和逻辑备份，以及在不同情况下如何进行数据库恢复操作。', 125, '正常', 'http://www.javalm.cn/file/3.mp4', '2025-04-27 16:28:35', '37', 'admin');
INSERT INTO `datainfo` VALUES (35, '性能监控与调优', '掌握数据库性能监控和调优技巧', 'http://www.javalm.cn/file/video02.png', 'MySQL 数据库', '介绍如何使用 MySQL 提供的工具和命令进行性能监控，如查看系统状态、分析慢查询日志，以及根据监控结果进行数据库性能调优。', 102, '正常', 'http://www.javalm.cn/file/2.mp4', '2025-04-27 16:28:35', '30', 'admin');

-- ----------------------------
-- Table structure for noticeinfo
-- ----------------------------
DROP TABLE IF EXISTS `noticeinfo`;
CREATE TABLE `noticeinfo`  (
  `noticeid` int NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `noticetitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `noticecontent` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `noticeaddtime` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '公告时间',
  `noticeremarker` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '公告备注',
  PRIMARY KEY (`noticeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '公告信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of noticeinfo
-- ----------------------------
INSERT INTO `noticeinfo` VALUES (2, '活动报名通知', '亲爱的用户，为了丰富大家的业余生活，我们特别举办了一场户外拓展活动。活动时间为 2025 年 05 月 10 日，地点在郊外的拓展基地。活动内容包括团队合作游戏、户外探险等，既能锻炼身体，又能增进团队成员之间的感情。现面向全体用户开放报名，报名截止时间为 2025 年 05 月 05 日。请大家积极参与，在活动中展现自己的风采！', '2025-03-17 10:30:20', '活动报名详情');
INSERT INTO `noticeinfo` VALUES (3, '新功能上线通知', '各位用户，经过我们团队的努力研发，系统即将上线一批全新功能。新功能涵盖了智能推荐、个性化定制等多个方面，将为您带来更加便捷、高效的使用体验。具体上线时间为 2025 年 04 月 30 日。届时，您可以登录系统进行体验。如果您在使用过程中遇到任何问题，欢迎随时反馈给我们。让我们一起期待新功能的到来！', '2025-03-18 14:40:30', '新功能介绍');
INSERT INTO `noticeinfo` VALUES (4, '安全提示通知', '近期网络安全形势严峻，为了保障您的账号安全，请您务必注意以下几点：一是设置强密码，包含字母、数字和特殊字符；二是不随意点击不明链接，避免遭受诈骗；三是定期更新系统和软件，及时修复安全漏洞。如果您发现任何异常情况，请立即联系我们的客服人员。我们将竭尽全力为您的账号安全保驾护航。请大家提高安全意识，共同营造安全的网络环境。', '2025-03-19 16:50:40', '网络安全提示');
INSERT INTO `noticeinfo` VALUES (5, '服务调整通知', '尊敬的用户，为了优化服务流程，提高服务质量，我们将于 2025 年 05 月 01 日起对部分服务进行调整。具体调整内容包括服务时间的变更、服务内容的优化等。调整后，我们将为您提供更加专业、贴心的服务。详细的调整信息请关注我们的官方网站或咨询客服人员。感谢您一直以来对我们的支持与信任，我们将不断努力，为您提供更好的服务。', '2025-03-20 18:00:50', '服务调整说明');
INSERT INTO `noticeinfo` VALUES (6, '新功能上线', '哈哈哈哈哈哈啊哈', '2025-08-22 23:34:10', '是是是');

-- ----------------------------
-- Table structure for scoreinfo
-- ----------------------------
DROP TABLE IF EXISTS `scoreinfo`;
CREATE TABLE `scoreinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评分编号',
  `uid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `tid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据编号',
  `score` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据评分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评分信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of scoreinfo
-- ----------------------------
INSERT INTO `scoreinfo` VALUES (1, '10', '14', '0.6');
INSERT INTO `scoreinfo` VALUES (2, '2', '33', '3.6');
INSERT INTO `scoreinfo` VALUES (3, '7', '8', '0.1');
INSERT INTO `scoreinfo` VALUES (4, '13', '8', '1.9');
INSERT INTO `scoreinfo` VALUES (5, '16', '26', '4.5');
INSERT INTO `scoreinfo` VALUES (6, '7', '19', '1.2');
INSERT INTO `scoreinfo` VALUES (7, '11', '26', '2.9');
INSERT INTO `scoreinfo` VALUES (8, '14', '1', '4.7');
INSERT INTO `scoreinfo` VALUES (9, '19', '33', '1.4');
INSERT INTO `scoreinfo` VALUES (10, '1', '32', '2.7');
INSERT INTO `scoreinfo` VALUES (11, '2', '4', '4');
INSERT INTO `scoreinfo` VALUES (12, '9', '8', '4.2');
INSERT INTO `scoreinfo` VALUES (13, '14', '2', '2.1');
INSERT INTO `scoreinfo` VALUES (14, '3', '33', '2.6');
INSERT INTO `scoreinfo` VALUES (15, '4', '26', '4.7');
INSERT INTO `scoreinfo` VALUES (16, '8', '30', '3.5');
INSERT INTO `scoreinfo` VALUES (17, '9', '26', '1.8');
INSERT INTO `scoreinfo` VALUES (18, '18', '26', '0.6');
INSERT INTO `scoreinfo` VALUES (19, '4', '31', '4.1');
INSERT INTO `scoreinfo` VALUES (20, '18', '12', '2.2');
INSERT INTO `scoreinfo` VALUES (21, '18', '20', '2');
INSERT INTO `scoreinfo` VALUES (22, '16', '3', '2.4');
INSERT INTO `scoreinfo` VALUES (23, '15', '3', '2.9');
INSERT INTO `scoreinfo` VALUES (24, '17', '5', '2.4');
INSERT INTO `scoreinfo` VALUES (25, '11', '28', '0.3');
INSERT INTO `scoreinfo` VALUES (26, '9', '5', '0.5');
INSERT INTO `scoreinfo` VALUES (27, '7', '10', '2.4');
INSERT INTO `scoreinfo` VALUES (28, '4', '23', '4.3');
INSERT INTO `scoreinfo` VALUES (29, '3', '14', '2.1');
INSERT INTO `scoreinfo` VALUES (30, '6', '25', '1.9');
INSERT INTO `scoreinfo` VALUES (31, '2', '13', '0.8');
INSERT INTO `scoreinfo` VALUES (32, '12', '11', '2.2');
INSERT INTO `scoreinfo` VALUES (33, '12', '16', '0.7');
INSERT INTO `scoreinfo` VALUES (34, '12', '29', '2.8');
INSERT INTO `scoreinfo` VALUES (35, '8', '20', '1.7');
INSERT INTO `scoreinfo` VALUES (36, '8', '4', '4.4');
INSERT INTO `scoreinfo` VALUES (37, '9', '35', '4.6');
INSERT INTO `scoreinfo` VALUES (38, '16', '21', '1.3');
INSERT INTO `scoreinfo` VALUES (39, '8', '4', '5');
INSERT INTO `scoreinfo` VALUES (40, '6', '24', '3.2');
INSERT INTO `scoreinfo` VALUES (41, '12', '34', '1.7');
INSERT INTO `scoreinfo` VALUES (42, '17', '23', '1.9');
INSERT INTO `scoreinfo` VALUES (43, '15', '14', '2.9');
INSERT INTO `scoreinfo` VALUES (44, '11', '24', '0.5');
INSERT INTO `scoreinfo` VALUES (45, '7', '20', '4');
INSERT INTO `scoreinfo` VALUES (46, '17', '30', '1.4');
INSERT INTO `scoreinfo` VALUES (47, '19', '31', '0.2');
INSERT INTO `scoreinfo` VALUES (48, '18', '7', '4.3');
INSERT INTO `scoreinfo` VALUES (49, '5', '14', '1.8');
INSERT INTO `scoreinfo` VALUES (50, '18', '5', '1');
INSERT INTO `scoreinfo` VALUES (51, '5', '11', '2.1');
INSERT INTO `scoreinfo` VALUES (52, '18', '21', '1.8');
INSERT INTO `scoreinfo` VALUES (53, '3', '34', '2.9');
INSERT INTO `scoreinfo` VALUES (54, '6', '22', '3.3');
INSERT INTO `scoreinfo` VALUES (55, '19', '13', '1.7');
INSERT INTO `scoreinfo` VALUES (56, '1', '9', '2.7');
INSERT INTO `scoreinfo` VALUES (57, '17', '30', '0.6');
INSERT INTO `scoreinfo` VALUES (58, '5', '31', '4.1');
INSERT INTO `scoreinfo` VALUES (59, '18', '27', '0.4');
INSERT INTO `scoreinfo` VALUES (60, '1', '8', '0.7');
INSERT INTO `scoreinfo` VALUES (61, '15', '24', '4');
INSERT INTO `scoreinfo` VALUES (62, '6', '16', '0.9');
INSERT INTO `scoreinfo` VALUES (63, '5', '34', '3');
INSERT INTO `scoreinfo` VALUES (64, '7', '24', '2.3');
INSERT INTO `scoreinfo` VALUES (65, '17', '11', '2.4');
INSERT INTO `scoreinfo` VALUES (66, '17', '32', '0.1');
INSERT INTO `scoreinfo` VALUES (67, '3', '13', '1.6');
INSERT INTO `scoreinfo` VALUES (68, '19', '33', '2.9');
INSERT INTO `scoreinfo` VALUES (69, '17', '35', '3.1');
INSERT INTO `scoreinfo` VALUES (70, '17', '27', '2.6');
INSERT INTO `scoreinfo` VALUES (71, '11', '10', '4.9');
INSERT INTO `scoreinfo` VALUES (72, '12', '6', '3.4');
INSERT INTO `scoreinfo` VALUES (73, '3', '14', '5');
INSERT INTO `scoreinfo` VALUES (74, '5', '20', '3.7');
INSERT INTO `scoreinfo` VALUES (75, '1', '8', '3.1');
INSERT INTO `scoreinfo` VALUES (76, '1', '23', '3.1');
INSERT INTO `scoreinfo` VALUES (77, '9', '28', '3.7');
INSERT INTO `scoreinfo` VALUES (78, '7', '2', '4.4');
INSERT INTO `scoreinfo` VALUES (79, '5', '26', '0.6');
INSERT INTO `scoreinfo` VALUES (80, '11', '34', '1.3');
INSERT INTO `scoreinfo` VALUES (81, '17', '15', '4.8');
INSERT INTO `scoreinfo` VALUES (82, '8', '4', '0.9');
INSERT INTO `scoreinfo` VALUES (83, '16', '18', '4.4');
INSERT INTO `scoreinfo` VALUES (84, '12', '18', '1.9');
INSERT INTO `scoreinfo` VALUES (85, '11', '2', '4.5');
INSERT INTO `scoreinfo` VALUES (86, '7', '3', '3.9');
INSERT INTO `scoreinfo` VALUES (87, '19', '26', '1.9');
INSERT INTO `scoreinfo` VALUES (88, '14', '7', '1.1');
INSERT INTO `scoreinfo` VALUES (89, '10', '9', '4.4');
INSERT INTO `scoreinfo` VALUES (90, '12', '30', '3');
INSERT INTO `scoreinfo` VALUES (91, '19', '32', '3.1');
INSERT INTO `scoreinfo` VALUES (92, '13', '28', '3.9');
INSERT INTO `scoreinfo` VALUES (93, '3', '17', '0.6');
INSERT INTO `scoreinfo` VALUES (94, '6', '23', '2.3');
INSERT INTO `scoreinfo` VALUES (95, '18', '28', '2.4');
INSERT INTO `scoreinfo` VALUES (96, '5', '25', '3.2');
INSERT INTO `scoreinfo` VALUES (97, '13', '27', '2.7');
INSERT INTO `scoreinfo` VALUES (98, '17', '28', '2.6');
INSERT INTO `scoreinfo` VALUES (99, '4', '33', '4.5');
INSERT INTO `scoreinfo` VALUES (100, '19', '32', '2');
INSERT INTO `scoreinfo` VALUES (101, '2', '28', '2.6');
INSERT INTO `scoreinfo` VALUES (102, '7', '19', '1.6');
INSERT INTO `scoreinfo` VALUES (103, '12', '26', '5');
INSERT INTO `scoreinfo` VALUES (104, '19', '35', '1.2');
INSERT INTO `scoreinfo` VALUES (105, '8', '12', '4.4');
INSERT INTO `scoreinfo` VALUES (106, '1', '2', '4.9');
INSERT INTO `scoreinfo` VALUES (107, '1', '1', '2.1');
INSERT INTO `scoreinfo` VALUES (108, '14', '18', '2.6');
INSERT INTO `scoreinfo` VALUES (109, '6', '22', '3.6');
INSERT INTO `scoreinfo` VALUES (110, '14', '31', '2.3');
INSERT INTO `scoreinfo` VALUES (111, '17', '4', '1.8');
INSERT INTO `scoreinfo` VALUES (112, '2', '29', '1.3');
INSERT INTO `scoreinfo` VALUES (113, '3', '27', '3.9');
INSERT INTO `scoreinfo` VALUES (114, '3', '27', '2.3');
INSERT INTO `scoreinfo` VALUES (115, '2', '23', '2.6');
INSERT INTO `scoreinfo` VALUES (116, '13', '19', '3.1');
INSERT INTO `scoreinfo` VALUES (117, '17', '34', '3.6');
INSERT INTO `scoreinfo` VALUES (118, '6', '14', '1.9');
INSERT INTO `scoreinfo` VALUES (119, '7', '4', '3.9');
INSERT INTO `scoreinfo` VALUES (120, '18', '28', '3.5');
INSERT INTO `scoreinfo` VALUES (121, '13', '20', '4');
INSERT INTO `scoreinfo` VALUES (122, '6', '30', '1.2');
INSERT INTO `scoreinfo` VALUES (123, '6', '33', '1.6');
INSERT INTO `scoreinfo` VALUES (124, '18', '35', '3.7');
INSERT INTO `scoreinfo` VALUES (125, '3', '34', '4.2');
INSERT INTO `scoreinfo` VALUES (126, '13', '20', '3.6');
INSERT INTO `scoreinfo` VALUES (127, '11', '8', '3.3');
INSERT INTO `scoreinfo` VALUES (128, '4', '26', '4.6');
INSERT INTO `scoreinfo` VALUES (129, '6', '17', '4.3');
INSERT INTO `scoreinfo` VALUES (130, '11', '6', '4.5');
INSERT INTO `scoreinfo` VALUES (131, '15', '35', '4.1');
INSERT INTO `scoreinfo` VALUES (132, '6', '15', '1.2');
INSERT INTO `scoreinfo` VALUES (133, '6', '9', '4.5');
INSERT INTO `scoreinfo` VALUES (134, '15', '19', '2.6');
INSERT INTO `scoreinfo` VALUES (135, '2', '3', '3.6');
INSERT INTO `scoreinfo` VALUES (136, '11', '10', '1.7');
INSERT INTO `scoreinfo` VALUES (137, '18', '35', '4.1');
INSERT INTO `scoreinfo` VALUES (138, '6', '4', '4.4');
INSERT INTO `scoreinfo` VALUES (139, '12', '20', '1.9');
INSERT INTO `scoreinfo` VALUES (140, '14', '14', '0');
INSERT INTO `scoreinfo` VALUES (141, '8', '4', '1.7');
INSERT INTO `scoreinfo` VALUES (142, '5', '15', '0.9');
INSERT INTO `scoreinfo` VALUES (143, '12', '7', '4.2');
INSERT INTO `scoreinfo` VALUES (144, '14', '22', '0.2');
INSERT INTO `scoreinfo` VALUES (145, '17', '3', '2.7');
INSERT INTO `scoreinfo` VALUES (146, '2', '18', '2.9');
INSERT INTO `scoreinfo` VALUES (147, '16', '2', '1.5');
INSERT INTO `scoreinfo` VALUES (148, '17', '24', '1.9');
INSERT INTO `scoreinfo` VALUES (149, '9', '28', '4.4');
INSERT INTO `scoreinfo` VALUES (150, '17', '25', '1.2');
INSERT INTO `scoreinfo` VALUES (151, '13', '10', '3.2');
INSERT INTO `scoreinfo` VALUES (152, '15', '25', '3.4');
INSERT INTO `scoreinfo` VALUES (153, '1', '24', '3.1');
INSERT INTO `scoreinfo` VALUES (154, '6', '25', '3.9');
INSERT INTO `scoreinfo` VALUES (155, '1', '8', '0.6');
INSERT INTO `scoreinfo` VALUES (156, '12', '12', '2.6');
INSERT INTO `scoreinfo` VALUES (157, '9', '6', '0.2');
INSERT INTO `scoreinfo` VALUES (158, '2', '16', '4.3');
INSERT INTO `scoreinfo` VALUES (159, '2', '23', '0');
INSERT INTO `scoreinfo` VALUES (160, '5', '15', '3.6');
INSERT INTO `scoreinfo` VALUES (161, '17', '29', '4');
INSERT INTO `scoreinfo` VALUES (162, '4', '25', '0.1');
INSERT INTO `scoreinfo` VALUES (163, '2', '14', '1.4');
INSERT INTO `scoreinfo` VALUES (164, '12', '21', '1.5');
INSERT INTO `scoreinfo` VALUES (165, '8', '29', '3.4');
INSERT INTO `scoreinfo` VALUES (166, '7', '28', '4.9');
INSERT INTO `scoreinfo` VALUES (167, '13', '5', '1');
INSERT INTO `scoreinfo` VALUES (168, '4', '32', '1.6');
INSERT INTO `scoreinfo` VALUES (169, '6', '7', '4.1');
INSERT INTO `scoreinfo` VALUES (170, '13', '1', '3.8');
INSERT INTO `scoreinfo` VALUES (171, '4', '33', '3.9');
INSERT INTO `scoreinfo` VALUES (172, '11', '5', '1.5');
INSERT INTO `scoreinfo` VALUES (173, '18', '10', '2.3');
INSERT INTO `scoreinfo` VALUES (174, '10', '29', '2.8');
INSERT INTO `scoreinfo` VALUES (175, '10', '6', '0.1');
INSERT INTO `scoreinfo` VALUES (176, '12', '23', '2.7');
INSERT INTO `scoreinfo` VALUES (177, '5', '19', '3.4');
INSERT INTO `scoreinfo` VALUES (178, '13', '29', '5');
INSERT INTO `scoreinfo` VALUES (179, '2', '10', '3.7');
INSERT INTO `scoreinfo` VALUES (180, '2', '8', '1');
INSERT INTO `scoreinfo` VALUES (181, '13', '18', '1.4');
INSERT INTO `scoreinfo` VALUES (182, '6', '31', '1.8');
INSERT INTO `scoreinfo` VALUES (183, '2', '15', '0.4');
INSERT INTO `scoreinfo` VALUES (184, '3', '2', '1.9');
INSERT INTO `scoreinfo` VALUES (185, '19', '30', '3.2');
INSERT INTO `scoreinfo` VALUES (186, '6', '11', '2.4');
INSERT INTO `scoreinfo` VALUES (187, '19', '26', '1.1');
INSERT INTO `scoreinfo` VALUES (188, '11', '20', '1.3');
INSERT INTO `scoreinfo` VALUES (189, '18', '12', '4.7');
INSERT INTO `scoreinfo` VALUES (190, '8', '13', '0.9');
INSERT INTO `scoreinfo` VALUES (191, '11', '14', '0.4');
INSERT INTO `scoreinfo` VALUES (192, '1', '31', '2.4');
INSERT INTO `scoreinfo` VALUES (193, '1', '20', '2.9');
INSERT INTO `scoreinfo` VALUES (194, '2', '20', '4.2');
INSERT INTO `scoreinfo` VALUES (195, '16', '24', '4.2');
INSERT INTO `scoreinfo` VALUES (196, '9', '21', '2');
INSERT INTO `scoreinfo` VALUES (197, '4', '34', '2.9');
INSERT INTO `scoreinfo` VALUES (198, '19', '28', '1.8');
INSERT INTO `scoreinfo` VALUES (199, '5', '32', '1');
INSERT INTO `scoreinfo` VALUES (200, '1', '13', '3.8');
INSERT INTO `scoreinfo` VALUES (201, '1', '2', '4.8');
INSERT INTO `scoreinfo` VALUES (202, '1', '2', '4');
INSERT INTO `scoreinfo` VALUES (203, '49', '3', '4');
INSERT INTO `scoreinfo` VALUES (204, '1', '2', '4');
INSERT INTO `scoreinfo` VALUES (205, '1', '15', '4');
INSERT INTO `scoreinfo` VALUES (206, '1', '7', '4');

-- ----------------------------
-- Table structure for shoucang
-- ----------------------------
DROP TABLE IF EXISTS `shoucang`;
CREATE TABLE `shoucang`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `tid` int NULL DEFAULT NULL COMMENT '产品编号',
  `uid` int NULL DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_index_name101`(`tid` ASC, `uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '收藏信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shoucang
-- ----------------------------
INSERT INTO `shoucang` VALUES (17, 1, 2);
INSERT INTO `shoucang` VALUES (20, 1, 12);
INSERT INTO `shoucang` VALUES (16, 2, 2);
INSERT INTO `shoucang` VALUES (23, 2, 49);
INSERT INTO `shoucang` VALUES (15, 3, 1);
INSERT INTO `shoucang` VALUES (28, 7, 1);
INSERT INTO `shoucang` VALUES (25, 10, 49);
INSERT INTO `shoucang` VALUES (27, 15, 1);

-- ----------------------------
-- Table structure for sorttype
-- ----------------------------
DROP TABLE IF EXISTS `sorttype`;
CREATE TABLE `sorttype`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sortname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `intro` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `createtime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '分类信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sorttype
-- ----------------------------
INSERT INTO `sorttype` VALUES (1, 'Java', 'Java是一种广泛使用的高级编程语言，具有跨平台、面向对象等特性。此课程将深入讲解 Java 的基础知识、高级特性及应用场景。', '2025-04-27 12:35:47');
INSERT INTO `sorttype` VALUES (2, 'Python 编程', 'Python 是一种高级、通用、解释型的编程语言，具有简洁易读的语法，广泛应用于数据科学、人工智能、Web 开发等领域。本课程将全面介绍 Python 编程的基础知识与高级应用。', '2025-04-27 12:36:43');
INSERT INTO `sorttype` VALUES (3, 'MySQL 数据库', 'MySQL 是一种广泛使用的开源关系型数据库管理系统，本课程将全面介绍 MySQL 数据库的基础与高级应用，包括数据库设计、SQL 语句使用、性能优化等内容。', '2025-04-27 16:28:12');
INSERT INTO `sorttype` VALUES (5, 'c++', '编程语言', '2025-08-22 10:09:23');
INSERT INTO `sorttype` VALUES (6, 'Vue', '前端学习', '2025-06-22 23:42:19');

-- ----------------------------
-- Table structure for studyinfo
-- ----------------------------
DROP TABLE IF EXISTS `studyinfo`;
CREATE TABLE `studyinfo`  (
  `dsid` int NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `uid` int NULL DEFAULT NULL COMMENT '用户编号',
  `tid` int NULL DEFAULT NULL COMMENT '课程编号',
  `addtime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建时间',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学习备注',
  PRIMARY KEY (`dsid`) USING BTREE,
  UNIQUE INDEX `uid`(`uid` ASC, `tid` ASC) USING BTREE,
  UNIQUE INDEX `uid_2`(`uid` ASC, `tid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 486 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学习记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of studyinfo
-- ----------------------------
INSERT INTO `studyinfo` VALUES (6, 1, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (7, 1, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (8, 1, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (10, 1, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (14, 1, 26, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (16, 1, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (18, 20, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (20, 10, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (21, 25, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (23, 40, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (24, 17, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (26, 31, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (27, 43, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (28, 27, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (29, 23, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (31, 15, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (34, 12, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (36, 38, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (38, 29, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (39, 15, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (43, 14, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (45, 39, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (47, 12, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (48, 11, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (49, 21, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (50, 10, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (51, 24, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (52, 12, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (53, 15, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (57, 13, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (58, 19, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (59, 18, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (60, 23, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (61, 37, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (62, 2, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (63, 39, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (64, 4, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (65, 22, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (68, 43, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (69, 4, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (70, 24, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (72, 26, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (75, 43, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (76, 34, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (77, 38, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (78, 33, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (79, 16, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (81, 11, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (82, 24, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (83, 29, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (84, 37, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (85, 41, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (87, 5, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (88, 34, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (89, 36, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (90, 25, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (92, 10, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (93, 8, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (94, 7, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (96, 19, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (97, 4, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (101, 40, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (102, 27, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (103, 24, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (105, 40, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (106, 38, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (107, 41, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (108, 16, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (110, 2, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (111, 7, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (112, 27, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (113, 5, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (114, 26, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (115, 35, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (116, 40, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (117, 18, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (118, 34, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (119, 35, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (120, 16, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (121, 7, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (123, 36, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (125, 40, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (126, 30, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (129, 25, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (131, 10, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (132, 29, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (137, 37, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (138, 38, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (140, 30, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (141, 24, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (142, 2, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (143, 39, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (144, 39, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (147, 38, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (149, 42, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (151, 3, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (152, 10, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (153, 42, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (154, 4, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (155, 19, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (161, 15, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (162, 7, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (163, 1, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (165, 23, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (166, 23, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (167, 39, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (168, 11, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (170, 11, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (171, 43, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (175, 10, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (176, 34, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (178, 36, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (180, 17, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (181, 17, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (184, 40, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (185, 4, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (186, 7, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (187, 17, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (189, 2, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (191, 42, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (193, 15, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (195, 29, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (196, 3, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (197, 32, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (198, 18, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (200, 5, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (201, 16, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (202, 22, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (203, 11, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (204, 28, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (205, 6, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (206, 26, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (207, 11, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (208, 19, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (210, 22, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (211, 26, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (214, 37, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (215, 20, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (217, 16, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (218, 22, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (219, 39, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (222, 38, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (223, 8, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (224, 43, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (225, 41, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (227, 12, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (228, 43, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (229, 27, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (231, 41, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (232, 32, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (235, 19, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (236, 11, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (237, 9, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (238, 17, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (239, 38, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (240, 11, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (241, 3, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (242, 40, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (243, 8, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (244, 14, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (246, 36, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (247, 13, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (250, 43, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (251, 27, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (253, 5, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (255, 18, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (256, 21, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (257, 28, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (259, 26, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (261, 25, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (262, 20, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (263, 3, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (264, 9, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (265, 18, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (267, 1, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (268, 5, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (269, 43, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (270, 17, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (271, 25, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (272, 32, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (273, 39, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (274, 29, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (275, 9, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (276, 5, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (277, 23, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (278, 6, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (279, 8, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (280, 27, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (282, 41, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (283, 43, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (284, 1, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (285, 12, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (288, 35, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (289, 12, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (290, 2, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (291, 2, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (293, 3, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (294, 38, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (295, 25, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (296, 33, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (297, 24, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (298, 12, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (299, 14, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (300, 8, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (302, 6, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (303, 31, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (304, 38, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (306, 5, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (308, 7, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (309, 15, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (310, 30, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (311, 27, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (312, 34, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (313, 28, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (314, 33, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (315, 27, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (316, 9, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (317, 20, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (318, 33, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (319, 1, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (321, 14, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (322, 24, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (323, 16, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (324, 31, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (325, 15, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (326, 21, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (327, 14, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (328, 20, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (329, 18, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (330, 30, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (331, 19, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (332, 2, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (333, 31, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (335, 29, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (336, 19, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (337, 15, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (338, 26, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (339, 14, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (340, 26, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (341, 11, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (342, 24, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (343, 14, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (344, 34, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (345, 37, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (346, 1, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (347, 42, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (348, 20, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (349, 6, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (350, 41, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (351, 40, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (354, 3, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (355, 35, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (357, 37, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (358, 43, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (359, 27, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (360, 37, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (361, 43, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (362, 4, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (363, 34, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (364, 29, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (365, 18, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (366, 43, 7, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (367, 41, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (368, 18, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (369, 9, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (370, 6, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (371, 24, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (372, 29, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (373, 12, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (374, 14, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (375, 22, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (376, 42, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (377, 16, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (378, 2, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (379, 3, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (380, 37, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (381, 19, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (382, 39, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (383, 37, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (384, 36, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (385, 20, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (387, 11, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (388, 14, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (389, 28, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (390, 39, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (392, 6, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (393, 17, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (394, 26, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (395, 13, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (397, 15, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (398, 13, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (400, 19, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (401, 6, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (402, 7, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (403, 25, 10, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (404, 29, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (405, 42, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (406, 9, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (407, 11, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (408, 1, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (409, 43, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (410, 30, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (411, 4, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (412, 23, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (413, 8, 20, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (414, 16, 15, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (415, 32, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (416, 24, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (417, 18, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (418, 13, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (419, 38, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (420, 33, 23, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (421, 13, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (422, 32, 8, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (423, 18, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (424, 33, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (425, 5, 12, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (426, 2, 17, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (427, 21, 14, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (428, 34, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (429, 37, 18, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (430, 35, 19, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (431, 37, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (432, 13, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (433, 36, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (434, 4, 24, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (435, 19, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (436, 23, 2, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (437, 31, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (438, 26, 13, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (439, 30, 6, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (440, 14, 9, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (441, 5, 11, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (442, 18, 22, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (443, 42, 25, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (444, 13, 1, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (445, 12, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (446, 9, 21, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (447, 11, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (448, 41, 4, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (449, 32, 3, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (450, 10, 5, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (451, 20, 16, '2025-04-27 13:09:12', '无');
INSERT INTO `studyinfo` VALUES (452, 1, 3, '2025-04-30 12:57:04', '无');
INSERT INTO `studyinfo` VALUES (453, 1, 27, '2025-04-30 19:19:10', '无');
INSERT INTO `studyinfo` VALUES (470, 1, 28, '2025-05-02 22:35:07', '无');
INSERT INTO `studyinfo` VALUES (475, 12, 17, '2025-08-17 23:47:11', '无');
INSERT INTO `studyinfo` VALUES (476, 1, 2, '2025-08-22 09:24:54', '无');
INSERT INTO `studyinfo` VALUES (478, 1, 34, '2025-08-22 09:26:19', '无');
INSERT INTO `studyinfo` VALUES (480, 49, 3, '2025-08-22 11:08:26', '无');
INSERT INTO `studyinfo` VALUES (482, 1, 15, '2025-08-22 23:18:27', '无');
INSERT INTO `studyinfo` VALUES (483, 1, 7, '2025-08-22 23:27:59', '无');
INSERT INTO `studyinfo` VALUES (485, 1, 17, '2025-08-22 23:33:04', '无');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `picurl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `intro` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'test', '14582518182', 'http://www.javalm.cn/img/186.png', '1117670509@qq.com', '用户', 26, '女', '123456', 'dd');
INSERT INTO `userinfo` VALUES (2, '张三', '17096898323', 'http://www.javalm.cn/img/159.png', '2018934097@qq.com', '用户', 24, '女', '123456', '456789123456321116');
INSERT INTO `userinfo` VALUES (3, '李四', '17831441548', 'http://www.javalm.cn/img/35.png', '1662732736@qq.com', '用户', 20, '男', '123456', '456789123456321866');
INSERT INTO `userinfo` VALUES (4, '王五', '17298418769', 'http://www.javalm.cn/img/98.png', '2031518814@qq.com', '用户', 22, '男', '123456', '456789123456321684');
INSERT INTO `userinfo` VALUES (5, '赵六', '17088729870', 'http://www.javalm.cn/img/184.png', '1263103994@qq.com', '用户', 22, '女', '123456', '456789123456321719');
INSERT INTO `userinfo` VALUES (6, 'demo', '17796283958', 'http://www.javalm.cn/img/29.png', '1684132928@qq.com', '用户', 25, '女', '123456', '456789123456321645');
INSERT INTO `userinfo` VALUES (7, 'user', '17369797684', 'http://www.javalm.cn/img/190.png', '2024190463@qq.com', '用户', 24, '女', '123456', '456789123456321166');
INSERT INTO `userinfo` VALUES (8, '覃潇然', '18640337739', 'http://www.javalm.cn/img/62.png', '1935627346@qq.com', '用户', 24, '男', '123456', '456789123456321396');
INSERT INTO `userinfo` VALUES (9, '莫天宇', '15972791031', 'http://www.javalm.cn/img/143.png', '1675272757@qq.com', '用户', 25, '女', '123456', '456789123456321581');
INSERT INTO `userinfo` VALUES (10, '叶凯瑞', '15843220903', 'http://www.javalm.cn/img/129.png', '1421828465@qq.com', '用户', 20, '女', '123456', '456789123456321819');
INSERT INTO `userinfo` VALUES (11, '段思', '15684926722', 'http://www.javalm.cn/img/17.png', '1177918177@qq.com', '用户', 22, '女', '123456', '456789123456321649');
INSERT INTO `userinfo` VALUES (12, '贾子骞', '15903015422', 'http://www.javalm.cn/img/97.png', '1433789777@qq.com', '用户', 23, '女', '123456', '456789123456321691');
INSERT INTO `userinfo` VALUES (13, '朱熠彤', '15994122418', 'http://www.javalm.cn/img/36.png', '2005214146@qq.com', '用户', 22, '女', '123456', '456789123456321607');
INSERT INTO `userinfo` VALUES (14, '汪鸿涛', '17311766601', 'http://www.javalm.cn/img/86.png', '1774186171@qq.com', '用户', 25, '女', '123456', '456789123456321861');
INSERT INTO `userinfo` VALUES (15, '江航', '15666641799', 'http://www.javalm.cn/img/122.png', '2064232537@qq.com', '用户', 22, '男', '123456', '456789123456321784');
INSERT INTO `userinfo` VALUES (16, '高烨霖', '14763128354', 'http://www.javalm.cn/img/154.png', '1504815730@qq.com', '用户', 22, '男', '123456', '456789123456321439');
INSERT INTO `userinfo` VALUES (17, '冯锦程', '15734978884', 'http://www.javalm.cn/img/4.png', '1941981533@qq.com', '用户', 21, '女', '123456', '456789123456321544');
INSERT INTO `userinfo` VALUES (18, '阎立果', '15149913831', 'http://www.javalm.cn/img/156.png', '1847372151@qq.com', '用户', 23, '男', '123456', '456789123456321500');
INSERT INTO `userinfo` VALUES (19, '邱志强', '15884649745', 'http://www.javalm.cn/img/170.png', '1536993059@qq.com', '用户', 24, '女', '123456', '456789123456321769');
INSERT INTO `userinfo` VALUES (20, '夏智渊', '15669417085', 'http://www.javalm.cn/img/180.png', '1640416385@qq.com', '用户', 21, '女', '123456', '456789123456321643');
INSERT INTO `userinfo` VALUES (21, '杜黎昕', '13864372279', 'http://www.javalm.cn/img/190.png', '1843371051@qq.com', '用户', 22, '男', '123456', '456789123456321811');
INSERT INTO `userinfo` VALUES (23, '贾潇然', '14796393367', 'http://www.javalm.cn/img/88.png', '1504209381@qq.com', '用户', 24, '女', '123456', '456789123456321396');
INSERT INTO `userinfo` VALUES (24, '袁志强', '15201755193', 'http://www.javalm.cn/img/3.png', '1677070634@qq.com', '用户', 20, '女', '123456', '456789123456321601');
INSERT INTO `userinfo` VALUES (25, '邱黎昕', '15788415509', 'http://www.javalm.cn/img/151.png', '1589684747@qq.com', '用户', 24, '男', '123456', '456789123456321119');
INSERT INTO `userinfo` VALUES (26, '郝健柏', '18850335526', 'http://www.javalm.cn/img/145.png', '1508963151@qq.com', '用户', 21, '男', '123456', '456789123456321292');
INSERT INTO `userinfo` VALUES (27, '覃雨泽', '13614042454', 'http://www.javalm.cn/img/73.png', '1391589507@qq.com', '用户', 24, '女', '123456', '456789123456321204');
INSERT INTO `userinfo` VALUES (28, '陈博文', '15122910139', 'http://www.javalm.cn/img/130.png', '1563941788@qq.com', '用户', 24, '男', '123456', '456789123456321842');
INSERT INTO `userinfo` VALUES (29, '石擎宇', '15749934769', 'http://www.javalm.cn/img/32.png', '1683781737@qq.com', '用户', 21, '女', '123456', '456789123456321297');
INSERT INTO `userinfo` VALUES (30, '夏昊天', '17649595803', 'http://www.javalm.cn/img/169.png', '1881726694@qq.com', '用户', 22, '男', '123456', '456789123456321460');
INSERT INTO `userinfo` VALUES (31, '范熠彤', '15389224742', 'http://www.javalm.cn/img/148.png', '1796935687@qq.com', '用户', 23, '男', '123456', '456789123456321509');
INSERT INTO `userinfo` VALUES (32, '卢天翊', '15729633985', 'http://www.javalm.cn/img/32.png', '1324179074@qq.com', '用户', 25, '女', '123456', '456789123456321264');
INSERT INTO `userinfo` VALUES (33, '万博文', '17642438365', 'http://www.javalm.cn/img/119.png', '1843668493@qq.com', '用户', 24, '女', '123456', '456789123456321492');
INSERT INTO `userinfo` VALUES (34, '黎博涛', '15320435727', 'http://www.javalm.cn/img/97.png', '2056836567@qq.com', '用户', 24, '女', '123456', '456789123456321769');
INSERT INTO `userinfo` VALUES (35, '熊梓晨', '14584319561', 'http://www.javalm.cn/img/127.png', '1746721843@qq.com', '用户', 24, '男', '123456', '456789123456321671');
INSERT INTO `userinfo` VALUES (36, '陆琪', '15613428526', 'http://www.javalm.cn/img/147.png', '2084470320@qq.com', '用户', 23, '女', '123456', '456789123456321148');
INSERT INTO `userinfo` VALUES (37, '郭潇然', '15748432345', 'http://www.javalm.cn/img/151.png', '1193292772@qq.com', '用户', 22, '女', '123456', '456789123456321225');
INSERT INTO `userinfo` VALUES (38, '雷昊然', '17083628186', 'http://www.javalm.cn/img/116.png', '1810127098@qq.com', '用户', 23, '女', '123456', '456789123456321584');
INSERT INTO `userinfo` VALUES (39, '周烨华', '14717153312', 'http://www.javalm.cn/img/128.png', '1113823349@qq.com', '用户', 23, '男', '123456', '456789123456321542');
INSERT INTO `userinfo` VALUES (40, '江鸿涛', '14505237300', 'http://www.javalm.cn/img/89.png', '1938653203@qq.com', '用户', 21, '女', '123456', '456789123456321858');
INSERT INTO `userinfo` VALUES (41, '莫健雄', '15789986574', 'http://www.javalm.cn/img/63.png', '1600365060@qq.com', '用户', 22, '男', '123456', '456789123456321163');
INSERT INTO `userinfo` VALUES (42, '孔子涵', '15216689379', 'http://www.javalm.cn/img/47.png', '1873494465@qq.com', '用户', 20, '男', '123456789', '456789123456321543');
INSERT INTO `userinfo` VALUES (43, '傅烨华', '15655599458', 'http://www.javalm.cn/img/46.png', '1131171670@qq.com', '用户', 22, '女', '123456', '456789123456321524');
INSERT INTO `userinfo` VALUES (45, 'chen', '1930498156', 'http://www.javalm.cn/file/1.jpg', '340858829@qq.com', '用户', NULL, '男', '123456', '');
INSERT INTO `userinfo` VALUES (46, '123456', '12345678911', 'http://localhost:8088/uploads/1755747976146_4.jpg', '123456', '用户', NULL, '男', '123456', '');
INSERT INTO `userinfo` VALUES (47, 'chen', '12345678911', 'http://www.javalm.cn/file/1.jpg', '1117670509@qq.com', '用户', NULL, '男', '123456', '');
INSERT INTO `userinfo` VALUES (52, 'test', '1930498156', 'http://www.javalm.cn/file/1.jpg', '1117670509@qq.com', '用户', NULL, '男', '12456', '');
INSERT INTO `userinfo` VALUES (53, '宅三', '1930498156', 'http://localhost:8088/uploads/1755875278626_5.jpg', '1117670509@qq.com', '用户', NULL, '男', '123456', '');
INSERT INTO `userinfo` VALUES (54, 'zha', '1930498156', 'http://www.javalm.cn/file/1.jpg', '1117670509@qq.com', '用户', NULL, '男', '1472589', '');
INSERT INTO `userinfo` VALUES (55, 'zhao', '1930498156', 'http://www.javalm.cn/file/1.jpg', '1117670509@qq.com', '用户', NULL, '男', '123456', '');
INSERT INTO `userinfo` VALUES (56, 'hahah', '14582518182', 'http://www.javalm.cn/file/1.jpg', '340858829@qq.com', '用户', NULL, '女', '123456', '');
INSERT INTO `userinfo` VALUES (57, 'zzhoa1', '12345678911', 'http://localhost:8088/uploads/1755877444227_7.jpg', '38085889@qq.com', '用户', 20, '男', '123456', '新用户');

-- ----------------------------
-- View structure for studyinfo_view
-- ----------------------------
DROP VIEW IF EXISTS `studyinfo_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `studyinfo_view` AS select `lt`.`id` AS `tid`,`rt`.`uid` AS `uid`,`lt`.`title` AS `name`,`lt`.`type` AS `type`,(case when (`rt`.`tid` is not null) then 1 else 0 end) AS `exists_in_right_table` from (`datainfo` `lt` left join `studyinfo` `rt` on((`lt`.`id` = `rt`.`tid`)));

SET FOREIGN_KEY_CHECKS = 1;
