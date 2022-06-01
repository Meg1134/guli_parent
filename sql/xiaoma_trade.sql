/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : xiaoma_trade

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 01/06/2022 22:35:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for trade_order
-- ----------------------------
DROP TABLE IF EXISTS `trade_order`;
CREATE TABLE `trade_order`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(20, 2) NULL DEFAULT NULL COMMENT '订单金额（分）',
  `pay_type` tinyint(3) NULL DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_order
-- ----------------------------
INSERT INTO `trade_order` VALUES ('1531904906774970369', '20220601154605498', '1530120966137483265', '大数据入门', 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/4d754893-8e7e-4f54-93cd-9466bc047e8e.jpg', '海绵宝宝', '1080736474267144193', '用户XJtDfaYeKk', '15639145742', 15000.00, 1, 1, 1, '2022-06-01 15:46:06', '2022-06-01 15:46:06');
INSERT INTO `trade_order` VALUES ('1531905921943339009', '20220601155007047', '1530120392126009345', '前端', 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/5d53d6ff-2b2f-454a-babc-e76ca8cb5736.jpg', 'Reborn', '1080736474267144193', '用户XJtDfaYeKk', '15639145742', 1.00, 1, 0, 1, '2022-06-01 15:50:08', '2022-06-01 15:50:08');
INSERT INTO `trade_order` VALUES ('1531906972784263170', '20220601155418931', '1530120966137483265', '大数据入门', 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/4d754893-8e7e-4f54-93cd-9466bc047e8e.jpg', '海绵宝宝', '1080736474267144193', '用户XJtDfaYeKk', '15639145742', 1.00, 1, 1, 1, '2022-06-01 15:54:18', '2022-06-01 15:54:18');
INSERT INTO `trade_order` VALUES ('1531930987787714561', '20220601172944667', '1530120966137483265', '大数据入门', 'https://ma-file.oss-cn-beijing.aliyuncs.com/cover/2022/05/27/4d754893-8e7e-4f54-93cd-9466bc047e8e.jpg', '海绵宝宝', '1080736474267144193', '小马', '15639145742', 15000.00, 1, 1, 0, '2022-06-01 17:29:44', '2022-06-01 17:29:44');

-- ----------------------------
-- Table structure for trade_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_pay_log`;
CREATE TABLE `trade_pay_log`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` bigint(20) NULL DEFAULT NULL COMMENT '支付金额（分）',
  `transaction_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他属性',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_pay_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
