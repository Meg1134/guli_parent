/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : xiaoma_edu

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 01/06/2022 22:35:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1515671403322531841', '1515671368232984577', 'hello', 0, '2022-04-17 20:39:57', '2022-04-17 20:39:57');
INSERT INTO `edu_chapter` VALUES ('1525633590052794370', '1525633543697346562', '第一章', 0, '2022-05-15 08:26:07', '2022-05-15 08:26:07');
INSERT INTO `edu_chapter` VALUES ('1527997903337955330', '1527997872547569666', '第一章', 0, '2022-05-21 21:01:04', '2022-05-27 16:34:33');
INSERT INTO `edu_chapter` VALUES ('1530109054041493506', '1527997872547569666', '第二章', 0, '2022-05-27 16:50:01', '2022-05-27 16:50:01');
INSERT INTO `edu_chapter` VALUES ('1531907448116469761', '1530120966137483265', '第一章', 0, '2022-06-01 15:56:12', '2022-06-01 15:56:12');
INSERT INTO `edu_chapter` VALUES ('1531915516657131522', '1530120392126009345', '第一章', 0, '2022-06-01 16:28:15', '2022-06-01 16:28:15');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1525633543697346562', '1511958712015736834', '1512882288575205378', '1512882287870562306', 'ActiveMq', 0.00, 0, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/15/5f1c7d02-3f9c-4234-9ecd-7b9b488c27c3.jpg', 0, 4, 1, 'Normal', '2022-05-15 08:25:56', '2022-05-22 07:18:35');
INSERT INTO `edu_course` VALUES ('1527997872547569666', '1511958712015736834', '1512882288575205378', '1512882287870562306', 'java', 0.00, 15, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/21/0fa8b4dc-3702-4ae8-a0eb-9c847c3ad518.jpg', 0, 29, 1, 'Normal', '2022-05-21 21:00:56', '2022-06-01 17:27:17');
INSERT INTO `edu_course` VALUES ('1528003832221540354', '1511639214205202434', '1512882301082619905', '1512882300491223042', 'python', 0.00, 15, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/f2f375c0-4d15-4360-b7ed-2cf21ff5f7f0.jpg', 0, 4, 1, 'Normal', '2022-05-21 21:24:37', '2022-06-01 17:31:40');
INSERT INTO `edu_course` VALUES ('1530118847825219586', '1511639214205202434', '1512882301082619905', '1512882300491223042', '人工智能CV和NPL', 0.00, 100, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/2dd8beb3-be19-4fad-ae7f-4061f95bfda7.jpg', 0, 2, 1, 'Normal', '2022-05-27 17:28:56', '2022-06-01 11:33:39');
INSERT INTO `edu_course` VALUES ('1530119184627830786', '2', '1512882301082619905', '1512882300491223042', 'OpenCV', 0.00, 150, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/07c34345-4b5b-4439-b65a-a5661e80f361.jpg', 0, 0, 1, 'Normal', '2022-05-27 17:30:17', '2022-05-27 17:30:19');
INSERT INTO `edu_course` VALUES ('1530119474219356161', '2', '1512882294761803777', '1512882294178795522', 'linux', 0.00, 0, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/55d0554e-f237-4f74-8177-46bdfa89bb37.jpg', 0, 0, 1, 'Normal', '2022-05-27 17:31:26', '2022-05-27 17:31:29');
INSERT INTO `edu_course` VALUES ('1530119878013390849', '3', '1512882292849201153', '1512882292261998593', 'docker', 0.00, 0, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/baeed4b6-b1ab-44e8-b38f-5f15ef702504.jpg', 0, 0, 1, 'Normal', '2022-05-27 17:33:02', '2022-05-27 17:33:04');
INSERT INTO `edu_course` VALUES ('1530120165998497793', '10', '1512882296846372865', '1512882296187867138', 'oracle', 0.00, 0, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/d8fd94be-20d1-4bfa-86ef-21b182590b99.jpg', 0, 1, 1, 'Normal', '2022-05-27 17:34:10', '2022-06-01 11:00:31');
INSERT INTO `edu_course` VALUES ('1530120392126009345', '6', '1512882290680745985', '1512882290089349121', '前端', 998.00, 0, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/5d53d6ff-2b2f-454a-babc-e76ca8cb5736.jpg', 0, 2, 1, 'Normal', '2022-05-27 17:35:04', '2022-06-01 16:28:53');
INSERT INTO `edu_course` VALUES ('1530120966137483265', '1525621252524396546', '1512882298977079298', '1512882298331156481', '大数据入门', 150.00, 0, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/4d754893-8e7e-4f54-93cd-9466bc047e8e.jpg', 0, 20, 1, 'Normal', '2022-05-27 17:37:21', '2022-06-01 17:36:03');
INSERT INTO `edu_course` VALUES ('1531932878135484418', '1', '1512882288575205378', '1512882287870562306', 'test', 0.00, 150, 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/06/01/ac69711f-49f3-47f2-9572-f17748669e1b.jpg', 0, 0, 1, 'Draft', '2022-06-01 17:37:15', '2022-06-01 17:37:15');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程收藏' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1531901900293791746', '1527997872547569666', '1080736474267144193', '2022-06-01 15:34:09', '2022-06-01 15:34:09');
INSERT INTO `edu_course_collect` VALUES ('1531931492421328897', '1528003832221540354', '1080736474267144193', '2022-06-01 17:31:44', '2022-06-01 17:31:44');

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课程简介',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程简介' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1515671368232984577', '<p>发生的</p>', '2022-04-17 20:39:49', '2022-04-17 20:39:49');
INSERT INTO `edu_course_description` VALUES ('1525633543697346562', '', '2022-05-15 08:25:56', '2022-05-21 19:20:22');
INSERT INTO `edu_course_description` VALUES ('1527997872547569666', '', '2022-05-21 21:00:56', '2022-05-27 16:34:21');
INSERT INTO `edu_course_description` VALUES ('1528003832221540354', '<p>这是一节神功</p>', '2022-05-21 21:24:37', '2022-05-27 16:56:53');
INSERT INTO `edu_course_description` VALUES ('1530118847825219586', '<p>这是一节人工智能的课程，你将在这里学习到关于人工智能的知识</p>', '2022-05-27 17:28:56', '2022-05-27 17:28:56');
INSERT INTO `edu_course_description` VALUES ('1530119184627830786', '<p>这是关于Opencv的课程，在这里你将会系统的对Opencv进行学习，希望你能够学习到新的知识</p>', '2022-05-27 17:30:17', '2022-05-27 17:30:17');
INSERT INTO `edu_course_description` VALUES ('1530119474219356161', '<p>这是一节linux课程，跟着我，你将学习到linux的知识</p>', '2022-05-27 17:31:26', '2022-05-27 17:31:26');
INSERT INTO `edu_course_description` VALUES ('1530119878013390849', '<p>这是关于docker的课程，在这里你将系统的学习容器技术，并学会怎么通过容器来进行项目部署</p>', '2022-05-27 17:33:02', '2022-05-27 17:33:02');
INSERT INTO `edu_course_description` VALUES ('1530120165998497793', '<p>这是一节关于oracle的课程，在这里你将会系统的学习到关于oracle的知识<img src=\"static/tinymce4.7.5/plugins/emoticons/img/smiley-sealed.gif\" alt=\"sealed\" /></p>', '2022-05-27 17:34:10', '2022-05-27 17:34:10');
INSERT INTO `edu_course_description` VALUES ('1530120392126009345', '<p>这是一节前端课程，希望你能好好学习他，这对你未来的工作非常高有益</p>', '2022-05-27 17:35:04', '2022-06-01 16:28:06');
INSERT INTO `edu_course_description` VALUES ('1530120966137483265', '<p>大数据</p>', '2022-05-27 17:37:21', '2022-06-01 17:36:03');
INSERT INTO `edu_course_description` VALUES ('1531932878135484418', '<p>test</p>', '2022-06-01 17:37:15', '2022-06-01 17:37:15');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程科目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1512882287870562306', '后端开发', '0', 0, '2022-04-10 03:57:00', '2022-04-10 03:57:00');
INSERT INTO `edu_subject` VALUES ('1512882288575205378', 'Java', '1512882287870562306', 0, '2022-04-10 03:57:00', '2022-04-10 03:57:00');
INSERT INTO `edu_subject` VALUES ('1512882289502146562', 'Python', '1512882287870562306', 0, '2022-04-10 03:57:00', '2022-04-10 03:57:00');
INSERT INTO `edu_subject` VALUES ('1512882290089349121', '前端开发', '0', 0, '2022-04-10 03:57:01', '2022-04-10 03:57:01');
INSERT INTO `edu_subject` VALUES ('1512882290680745985', 'HTML/CSS', '1512882290089349121', 0, '2022-04-10 03:57:01', '2022-04-10 03:57:01');
INSERT INTO `edu_subject` VALUES ('1512882291473469441', 'JavaScript', '1512882290089349121', 0, '2022-04-10 03:57:01', '2022-04-10 03:57:01');
INSERT INTO `edu_subject` VALUES ('1512882292261998593', '云计算', '0', 0, '2022-04-10 03:57:01', '2022-04-10 03:57:01');
INSERT INTO `edu_subject` VALUES ('1512882292849201153', 'Docker', '1512882292261998593', 0, '2022-04-10 03:57:01', '2022-04-10 03:57:01');
INSERT INTO `edu_subject` VALUES ('1512882293646118914', 'Linux', '1512882292261998593', 0, '2022-04-10 03:57:01', '2022-04-10 03:57:01');
INSERT INTO `edu_subject` VALUES ('1512882294178795522', '系统/运维', '0', 0, '2022-04-10 03:57:02', '2022-04-10 03:57:02');
INSERT INTO `edu_subject` VALUES ('1512882294761803777', 'Linux', '1512882294178795522', 0, '2022-04-10 03:57:02', '2022-04-10 03:57:02');
INSERT INTO `edu_subject` VALUES ('1512882295600664577', 'Windows', '1512882294178795522', 0, '2022-04-10 03:57:02', '2022-04-10 03:57:02');
INSERT INTO `edu_subject` VALUES ('1512882296187867138', '数据库', '0', 0, '2022-04-10 03:57:02', '2022-04-10 03:57:02');
INSERT INTO `edu_subject` VALUES ('1512882296846372865', 'MySQL', '1512882296187867138', 0, '2022-04-10 03:57:02', '2022-04-10 03:57:02');
INSERT INTO `edu_subject` VALUES ('1512882297697816577', 'MongoDB', '1512882296187867138', 0, '2022-04-10 03:57:02', '2022-04-10 03:57:02');
INSERT INTO `edu_subject` VALUES ('1512882298331156481', '大数据', '0', 0, '2022-04-10 03:57:03', '2022-04-10 03:57:03');
INSERT INTO `edu_subject` VALUES ('1512882298977079298', 'Hadoop', '1512882298331156481', 0, '2022-04-10 03:57:03', '2022-04-10 03:57:03');
INSERT INTO `edu_subject` VALUES ('1512882299820134401', 'Spark', '1512882298331156481', 0, '2022-04-10 03:57:03', '2022-04-10 03:57:03');
INSERT INTO `edu_subject` VALUES ('1512882300491223042', '人工智能', '0', 0, '2022-04-10 03:57:03', '2022-04-10 03:57:03');
INSERT INTO `edu_subject` VALUES ('1512882301082619905', 'Python', '1512882300491223042', 0, '2022-04-10 03:57:03', '2022-04-10 03:57:03');
INSERT INTO `edu_subject` VALUES ('1512882301745319938', '编程语言', '0', 0, '2022-04-10 03:57:03', '2022-04-10 03:57:03');
INSERT INTO `edu_subject` VALUES ('1512882302332522498', 'Java', '1512882301745319938', 0, '2022-04-10 03:57:04', '2022-04-10 03:57:04');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(10) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `join_date` date NULL DEFAULT NULL COMMENT '入驻时间',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '讲师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '图图', '毕业于师范大学数学系，热爱教育事业，执教数学思维6年有余', '具备深厚的数学思维功底、丰富的小学教育经验，授课风格生动活泼，擅长用形象生动的比喻帮助理解、简单易懂的语言讲解难题，深受学生喜欢', 2, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/e2aa1111-9f56-4f41-a45d-ab8f0c084a9f.jpg', 10, '2022-04-07', 0, '2018-03-30 17:15:57', '2022-05-27 17:17:07');
INSERT INTO `edu_teacher` VALUES ('10', '问天', '北京师范大学法学院副教授', '北京师范大学法学院副教授、清华大学法学博士。自2004年至今已有9年的司法考试培训经验。长期从事司法考试辅导，深知命题规律，了解解题技巧。内容把握准确，授课重点明确，层次分明，调理清晰，将法条法理与案例有机融合，强调综合，深入浅出。', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/5dd513da-b2d6-491e-b614-97f756ff8e28.jpg', 20, '2022-04-07', 0, '2018-04-03 14:32:19', '2022-05-27 17:19:43');
INSERT INTO `edu_teacher` VALUES ('1511639214205202434', '派大星', '学渣一个', '一本毕业', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/229a23e6-d08c-4d6c-bc5f-e1b6555b155d.jpg', 3, '2022-04-06', 0, '2022-04-06 17:37:28', '2022-05-27 17:15:03');
INSERT INTO `edu_teacher` VALUES ('1511958712015736834', '猫咪老师', '这是一位good老师', '非常厉害的一个老师', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/a832f616-7c76-4d2b-b9fd-003d88f80320.jpg', 2, '2022-04-07', 0, '2022-04-07 14:47:02', '2022-06-01 16:11:53');
INSERT INTO `edu_teacher` VALUES ('1512050521609957377', '小唐老师', '拥有非常好的室友，也就是我', '辽工大本科', 2, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/04/07/e7808245-8d2f-40ae-a702-8b05a9e65cb9.jpg', 1, '2022-04-07', 1, '2022-04-07 20:51:52', '2022-04-07 20:51:52');
INSERT INTO `edu_teacher` VALUES ('1512094948785147905', '江小白', '11', '1', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/04/07/cfdf664c-30bc-47e9-b6aa-dd3b4a7c5ca9.jpg', 0, '2022-04-07', 1, '2022-04-07 23:48:24', '2022-04-07 23:48:24');
INSERT INTO `edu_teacher` VALUES ('1512096484550512641', '江小白虹', '1', '发', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/04/07/4bb62160-25cd-44bf-aa6f-9766c120a609.jpg', 0, '2022-04-07', 1, '2022-04-07 23:54:30', '2022-04-07 23:54:30');
INSERT INTO `edu_teacher` VALUES ('1525621252524396546', '海绵宝宝', '讲课十分幽默', '海绵宝宝老师，独特的声线以及优雅的身姿，都是无数学员为之倾倒的原因，加上其与章鱼哥的关系，让其在教书生涯可谓是顺风顺水', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/b199bcfc-efbb-47aa-b0f9-9a5409114e6c.jpg', 0, NULL, 0, '2022-05-15 07:37:06', '2022-05-27 17:04:11');
INSERT INTO `edu_teacher` VALUES ('2', 'test', '中国人民大学附属中学数学一级教师', '中国科学院数学与系统科学研究院应用数学专业博士，研究方向为数字图像处理，中国工业与应用数学学会会员。参与全国教育科学“十五”规划重点课题“信息化进程中的教育技术发展研究”的子课题“基与课程改革的资源开发与应用”，以及全国“十五”科研规划全国重点项目“掌上型信息技术产品在教学中的运用和开发研究”的子课题“用技术学数学”。', 2, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/fa9768ab-eb7c-47d2-8b7c-bd857feae29b.jpg', 1, '2022-04-07', 0, '2018-03-30 18:28:26', '2022-06-01 17:33:15');
INSERT INTO `edu_teacher` VALUES ('3', '艾伦', '塔塔给，塔塔给', '中教一级职称。讲课极具亲和力。', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/48bfee54-a91a-4d43-9fa7-bfd1c59deb44.jpg', 2, '2022-04-07', 0, '2018-03-31 09:20:46', '2022-05-27 17:39:26');
INSERT INTO `edu_teacher` VALUES ('4', '蜡笔小新', '长期从事考研政治课讲授和考研命题趋势与应试对策研究。考研辅导新锐派的代表。', '政治学博士、管理学博士后，北京师范大学马克思主义学院副教授。多年来总结出了一套行之有效的应试技巧与答题方法，针对性和实用性极强，能帮助考生在轻松中应考，在激励的竞争中取得高分，脱颖而出。', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/7c4720bf-6400-4b07-bfc6-0037ed803c29.jpeg', 1, '2022-04-07', 0, '2018-04-03 14:13:51', '2022-05-27 17:05:20');
INSERT INTO `edu_teacher` VALUES ('5', '哪吒', '人大附中2009届毕业生', '北京大学数学科学学院2008级本科生，2012年第八届学生五四奖章获得者，在数学领域取得多项国际国内奖项，学术研究成绩突出。曾被两次评为北京大学三好学生、一次评为北京大学三好标兵，获得过北京大学国家奖学金、北京大学廖凯原奖学金、北京大学星光国际一等奖学金、北京大学明德新生奖学金等。', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/7423b7eb-d668-4d46-b898-43b1c547812d.jpg', 1, '2022-04-07', 0, '2018-04-03 14:15:36', '2022-05-27 17:06:03');
INSERT INTO `edu_teacher` VALUES ('6', 'Reborn', '华东师范大学数学系硕士生导师，中国数学奥林匹克高级教练', '曾参与北京市及全国多项数学活动的命题和组织工作，多次带领北京队参加高中、初中、小学的各项数学竞赛，均取得优异成绩。教学活而新，能够调动学生的学习兴趣并擅长对学生进行思维点拨，对学生学习习惯的养成和非智力因素培养有独到之处，是一位深受学生喜爱的老师。', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/b36d680f-577e-474e-a0fe-591d9861a1b7.jpg', 1, '2022-04-07', 0, '2018-04-01 14:19:28', '2022-05-27 17:08:37');
INSERT INTO `edu_teacher` VALUES ('7', '哆啦A梦', '考研政治辅导实战派专家，全国考研政治命题研究组核心成员。', '法学博士，北京师范大学马克思主义学院副教授，专攻毛泽东思想概论、邓小平理论，长期从事考研辅导。出版著作两部，发表学术论文30余篇，主持国家社会科学基金项目和教育部重大课题子课题各一项，参与中央实施马克思主义理论研究和建设工程项目。', 2, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/7789ced6-41c9-44b3-83df-455a62c8745a.jpg', 8, '2022-04-07', 0, '2018-04-03 14:21:03', '2022-05-27 17:16:25');
INSERT INTO `edu_teacher` VALUES ('8', '虹猫', '资深课程设计专家，专注10年AACTP美国培训协会认证导师', '十年课程研发和培训咨询经验，曾任国企人力资源经理、大型外企培训经理，负责企业大学和培训体系搭建；曾任专业培训机构高级顾问、研发部总监，为包括广东移动、东莞移动、深圳移动、南方电网、工商银行、农业银行、民生银行、邮储银行、TCL集团、清华大学继续教育学院、中天路桥、广西扬翔股份等超过200家企业提供过培训与咨询服务，并担任近50个大型项目的总负责人。', 1, 'https://ma-file.oss-cn-beijing.aliyuncs.com/avatar/2022/05/27/97a55448-5f4a-46ee-82e1-2308a19bc000.jpg', 10, '2022-04-07', 0, '2018-04-03 14:23:33', '2022-05-27 17:18:53');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Empty' COMMENT '状态',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1525633674282807298', '1525633543697346562', '1525633590052794370', 'AcvtiveMq', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-15 08:26:28', '2022-05-21 19:38:57');
INSERT INTO `edu_video` VALUES ('1525633740552810497', '1525633543697346562', '1525633590052794370', 'activemq有什么用', NULL, NULL, 1, 0, 0, 0, 'Empty', 0, 1, '2022-05-15 08:26:43', '2022-05-15 08:26:43');
INSERT INTO `edu_video` VALUES ('1525633794793549826', '1525633543697346562', '1525633590052794370', 'activemq怎么使用', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-15 08:26:56', '2022-05-15 08:26:56');
INSERT INTO `edu_video` VALUES ('1530108613413081090', '1527997872547569666', '1527997903337955330', '01、Java课程简介', '98766de89e7346fd87d9cf2f735903e8', '01、Java课程简介.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:48:16', '2022-05-27 16:49:10');
INSERT INTO `edu_video` VALUES ('1530108692110807041', '1527997872547569666', '1527997903337955330', '02、Java语言概述', 'cf9ffc6b54c840bda5964cb896fe5a72', '02、Java语言概述.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:48:35', '2022-05-27 16:48:35');
INSERT INTO `edu_video` VALUES ('1530108807475138562', '1527997872547569666', '1527997903337955330', '03、Java环境搭建：JDK安装、常用命令', '9442f64760554843829d62feeecd181f', '03、Java环境搭建：JDK安装、常用命令.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:49:02', '2022-05-27 16:49:02');
INSERT INTO `edu_video` VALUES ('1530108940929503233', '1527997872547569666', '1527997903337955330', '04、Java入门HelloWorld', 'b37faeaf6ab742ba9582e84550d59cc7', '04、Java入门HelloWorld.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:49:34', '2022-05-27 16:49:34');
INSERT INTO `edu_video` VALUES ('1530109024840749057', '1527997872547569666', '1527997903337955330', '05、Java入门程序：常见问题', 'b26d0851a61b4292bdada424860e68c1', '05、Java入门程序：常见问题.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:49:54', '2022-05-27 16:49:54');
INSERT INTO `edu_video` VALUES ('1530109150112026625', '1527997872547569666', '1530109054041493506', '01、JDK、JRE、Java跨平台原理介绍', 'e31096baf85f4acaabb89cf7ecd8eaad', '07、JDK、JRE、Java跨平台原理介绍.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:50:24', '2022-05-27 16:50:24');
INSERT INTO `edu_video` VALUES ('1530109245138178049', '1527997872547569666', '1530109054041493506', '02、JDK安装时Path环境变量的注意事项', '7bac829bad73431db8b9a0343002e19b', '08、JDK安装时Path环境变量的注意事项.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:50:47', '2022-05-27 16:50:47');
INSERT INTO `edu_video` VALUES ('1530109360884191234', '1527997872547569666', '1530109054041493506', '03、IDEA集成开发工具的介绍、下载、安装', '4923d3daeab1446e8cce6bf3b5ba4e04', '09、IDEA集成开发工具的介绍、下载、安装.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:51:14', '2022-05-27 16:51:14');
INSERT INTO `edu_video` VALUES ('1530109504803344386', '1527997872547569666', '1530109054041493506', '04、IDEA开发第一个入门程序', '9889ba796cb248e88e4a6f6ea071e2f7', '10、IDEA开发第一个入门程序.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-27 16:51:49', '2022-05-27 16:51:49');
INSERT INTO `edu_video` VALUES ('1531907589116387329', '1530120966137483265', '1531907448116469761', '第一节课', 'ed6f74876b9b49fc8774c9ec9b0a102b', '01、Java课程简介.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-06-01 15:56:45', '2022-06-01 15:56:45');
INSERT INTO `edu_video` VALUES ('1531915663432605697', '1530120392126009345', '1531915516657131522', '第一节课', '28763e1b366c44f5a9c5eb6998c0d4bd', '05、Java入门程序：常见问题.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-06-01 16:28:50', '2022-06-01 16:28:50');

SET FOREIGN_KEY_CHECKS = 1;
