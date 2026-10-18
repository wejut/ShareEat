CREATE DATABASE IF NOT EXISTS `shareeat_merchant` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `shareeat_merchant`;

/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80037
 Source Host           : localhost:3306
 Source Schema         : shareeat_merchant

 Target Server Type    : MySQL
 Target Server Version : 80037
 File Encoding         : 65001

 Date: 19/10/2026 00:47:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (2, 47, '理解', '0', '15089520570', '44', '广东省', '4401', '广州市', '440106', '天河区', '理解', '2', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (11, 1, '酒水饮料', 10, 1, '2022-06-09 22:09:18', '2022-06-09 22:09:18', 1, 1);
INSERT INTO `category` VALUES (12, 1, '传统主食', 1, 1, '2022-06-09 22:09:32', '2025-06-02 14:51:23', 1, 2);
INSERT INTO `category` VALUES (13, 2, '人气套餐', 12, 1, '2022-06-09 22:11:38', '2022-06-10 11:04:40', 1, 1);
INSERT INTO `category` VALUES (15, 2, '商务套餐', 13, 1, '2022-06-09 22:14:10', '2022-06-10 11:04:48', 1, 1);
INSERT INTO `category` VALUES (16, 1, '蜀味烤鱼', 4, 1, '2022-06-09 22:15:37', '2022-08-31 14:27:25', 1, 1);
INSERT INTO `category` VALUES (17, 1, '蜀味牛蛙', 5, 1, '2022-06-09 22:16:14', '2022-08-31 14:39:44', 1, 1);
INSERT INTO `category` VALUES (18, 1, '特色蒸菜', 6, 1, '2022-06-09 22:17:42', '2022-06-09 22:17:42', 1, 1);
INSERT INTO `category` VALUES (19, 1, '新鲜时蔬', 7, 1, '2022-06-09 22:18:12', '2022-06-09 22:18:28', 1, 1);
INSERT INTO `category` VALUES (20, 1, '水煮鱼', 8, 1, '2022-06-09 22:22:29', '2022-06-09 22:23:45', 1, 1);
INSERT INTO `category` VALUES (21, 1, '汤类', 11, 1, '2022-06-10 10:51:47', '2022-06-10 10:51:47', 1, 1);
INSERT INTO `category` VALUES (26, 1, '其他', 16, 1, '2025-06-01 14:37:54', '2025-06-01 14:37:54', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (46, '王老吉', 11, 6.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '', 1, '2022-06-09 22:40:47', '2022-06-09 22:40:47', 1, 1);
INSERT INTO `dish` VALUES (47, '北冰洋', 11, 4.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '还是小时候的味道', 1, '2022-06-10 09:18:49', '2022-06-10 09:18:49', 1, 1);
INSERT INTO `dish` VALUES (48, '雪花啤酒', 11, 4.00, 'http://localhost:8080/upload/Screenshot_20260223_011446_com.jiaohua_browser.png', '', 1, '2022-06-10 09:22:54', '2022-06-10 09:22:54', 1, 1);
INSERT INTO `dish` VALUES (49, '米饭', 12, 2.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '精选五常大米', 1, '2022-06-10 09:30:17', '2022-06-10 09:30:17', 1, 1);
INSERT INTO `dish` VALUES (50, '馒头', 12, 1.00, 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', '优质面粉', 1, '2022-06-10 09:34:28', '2022-06-10 09:34:28', 1, 1);
INSERT INTO `dish` VALUES (51, '老坛酸菜鱼', 20, 56.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：汤，草鱼，酸菜', 1, '2022-06-10 09:40:51', '2022-06-10 09:40:51', 1, 1);
INSERT INTO `dish` VALUES (52, '经典酸菜鮰鱼', 20, 66.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：酸菜，江团，鮰鱼', 1, '2022-06-10 09:46:02', '2022-06-10 09:46:02', 1, 1);
INSERT INTO `dish` VALUES (53, '蜀味水煮草鱼', 20, 38.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：草鱼，汤', 1, '2022-06-10 09:48:37', '2022-06-10 09:48:37', 1, 1);
INSERT INTO `dish` VALUES (54, '清炒小油菜', 19, 18.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：小油菜', 1, '2022-06-10 09:51:46', '2022-06-10 09:51:46', 1, 1);
INSERT INTO `dish` VALUES (55, '蒜蓉娃娃菜', 19, 18.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：蒜，娃娃菜', 1, '2022-06-10 09:53:37', '2022-06-10 09:53:37', 1, 1);
INSERT INTO `dish` VALUES (56, '清炒西兰花', 19, 18.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：西兰花', 1, '2022-06-10 09:55:44', '2022-06-10 09:55:44', 1, 1);
INSERT INTO `dish` VALUES (57, '炝炒圆白菜', 19, 18.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：圆白菜', 1, '2022-06-10 09:58:35', '2022-06-10 09:58:35', 1, 1);
INSERT INTO `dish` VALUES (58, '清蒸鲈鱼', 18, 98.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：鲈鱼', 1, '2022-06-10 10:12:28', '2022-06-10 10:12:28', 1, 1);
INSERT INTO `dish` VALUES (59, '东坡肘子', 18, 138.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：猪肘棒', 1, '2022-06-10 10:24:03', '2022-06-10 10:24:03', 1, 1);
INSERT INTO `dish` VALUES (60, '梅菜扣肉', 18, 58.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：猪肉，梅菜', 1, '2022-06-10 10:26:03', '2022-06-10 10:26:03', 1, 1);
INSERT INTO `dish` VALUES (61, '剁椒鱼头', 18, 66.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：鲢鱼，剁椒', 1, '2022-06-10 10:28:54', '2022-06-10 10:28:54', 1, 1);
INSERT INTO `dish` VALUES (62, '金汤酸菜牛蛙', 17, 88.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：鲜活牛蛙，酸菜', 1, '2022-06-10 10:33:05', '2022-06-10 10:33:05', 1, 1);
INSERT INTO `dish` VALUES (63, '香锅牛蛙', 17, 88.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '配料：鲜活牛蛙，莲藕，青笋', 1, '2022-06-10 10:35:40', '2022-06-10 10:35:40', 1, 1);
INSERT INTO `dish` VALUES (64, '馋嘴牛蛙', 17, 88.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '配料：鲜活牛蛙，丝瓜，黄豆芽', 1, '2022-06-10 10:37:52', '2022-06-10 10:37:52', 1, 1);
INSERT INTO `dish` VALUES (65, '草鱼2斤', 16, 68.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：草鱼，黄豆芽，莲藕', 1, '2022-06-10 10:41:08', '2022-06-10 10:41:08', 1, 1);
INSERT INTO `dish` VALUES (66, '江团鱼2斤', 16, 119.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '配料：江团鱼，黄豆芽，莲藕', 1, '2022-06-10 10:42:42', '2022-06-10 10:42:42', 1, 1);
INSERT INTO `dish` VALUES (67, '鮰鱼2斤', 16, 72.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '原料：鮰鱼，黄豆芽，莲藕', 1, '2022-06-10 10:43:56', '2022-06-10 10:43:56', 1, 1);
INSERT INTO `dish` VALUES (68, '鸡蛋汤', 21, 4.00, 'http://localhost:8080/upload/Screenshot_20260515_041934_com.jiaohua_browser.png', '配料：鸡蛋，紫菜', 1, '2022-06-10 10:54:25', '2026-06-07 01:22:57', 1, 13);
INSERT INTO `dish` VALUES (69, '平菇豆腐汤', 21, 6.00, 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', '配料：豆腐，平菇', 1, '2022-06-10 10:55:02', '2022-06-10 10:55:02', 1, 1);
INSERT INTO `dish` VALUES (73, '家常小菜', 26, 648.00, NULL, '时令配菜', 1, NULL, '2026-06-09 21:50:50', NULL, 13);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (40, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (41, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (42, 7, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (45, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (46, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (47, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (48, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (49, 2, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (50, 4, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (51, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (52, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (86, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (87, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (88, 51, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (89, 51, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (92, 53, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (93, 53, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (94, 54, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (95, 56, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (96, 57, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (97, 60, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (101, 66, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (102, 67, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (103, 65, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '示雯静', '示雯静', 'e10adc3949ba59abbe56e057f20f883e', '11770541073', '女', '36', 1, '2022-02-15 15:51:20', '2025-06-01 16:40:25', 10, 1);
INSERT INTO `employee` VALUES (2, '尼玛', '尼玛', 'e10adc3949ba59abbe56e057f20f883e', '13428247008', '女', '22', 1, '2025-05-17 16:57:54', '2025-05-29 23:56:00', 10, 1);
INSERT INTO `employee` VALUES (10, '草泥马', '草泥马', 'e10adc3949ba59abbe56e057f20f883e', '13002302376', '1', '15', 1, '2025-05-17 22:59:06', '2025-05-17 22:59:06', 1, 1);
INSERT INTO `employee` VALUES (11, '草泥', '草泥', 'e10adc3949ba59abbe56e057f20f883e', '13002302376', '1', '16', 1, '2025-05-17 23:20:52', '2025-05-17 23:20:52', 1, 1);
INSERT INTO `employee` VALUES (13, '泥', '泥', 'e10adc3949ba59abbe56e057f20f883e', '13002302376', '1', '17', 1, '2025-05-17 23:23:19', '2025-05-17 23:23:19', 1, 1);
INSERT INTO `employee` VALUES (14, '草泥泥', 'wejuttt', 'e10adc3949ba59abbe56e057f20f883e', '13002302376', '0', '151515155151515115', 1, '2025-05-18 11:54:02', '2025-06-04 16:36:19', 1, 13);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (9, '馒头', 'https://java-dgcyvjc.oss-cn-beijing.aliyuncs.com/imagesUrl/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 6, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (10, '超值工作餐', NULL, 6, NULL, 48, NULL, 1, 42.00);
INSERT INTO `order_detail` VALUES (11, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 7, 50, NULL, NULL, 2, 1.00);
INSERT INTO `order_detail` VALUES (12, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 8, 50, NULL, NULL, 2, 1.00);
INSERT INTO `order_detail` VALUES (13, '商务聚餐套餐', NULL, 9, NULL, 50, NULL, 2, 55.00);
INSERT INTO `order_detail` VALUES (14, '清淡商务套餐', NULL, 9, NULL, 49, NULL, 1, 38.00);
INSERT INTO `order_detail` VALUES (15, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 10, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (16, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 10, 49, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (17, '人气双人套餐', NULL, 10, NULL, 47, NULL, 1, 35.00);
INSERT INTO `order_detail` VALUES (18, '超值工作餐', NULL, 10, NULL, 48, NULL, 1, 42.00);
INSERT INTO `order_detail` VALUES (19, '清淡商务套餐', NULL, 10, NULL, 49, NULL, 1, 38.00);
INSERT INTO `order_detail` VALUES (20, '商务聚餐套餐', NULL, 10, NULL, 50, NULL, 1, 55.00);
INSERT INTO `order_detail` VALUES (21, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 11, 50, NULL, NULL, 2, 1.00);
INSERT INTO `order_detail` VALUES (22, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 11, 49, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (23, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 12, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (24, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 12, 49, NULL, NULL, 2, 2.00);
INSERT INTO `order_detail` VALUES (25, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 13, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (26, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 13, 49, NULL, NULL, 2, 2.00);
INSERT INTO `order_detail` VALUES (27, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 14, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (28, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 14, 49, NULL, NULL, 2, 2.00);
INSERT INTO `order_detail` VALUES (29, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 15, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (30, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 15, 49, NULL, NULL, 2, 2.00);
INSERT INTO `order_detail` VALUES (31, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 16, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (32, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 16, 49, NULL, NULL, 2, 2.00);
INSERT INTO `order_detail` VALUES (33, '超值工作餐', NULL, 17, NULL, 48, NULL, 1, 42.00);
INSERT INTO `order_detail` VALUES (34, '清淡商务套餐', NULL, 17, NULL, 49, NULL, 1, 38.00);
INSERT INTO `order_detail` VALUES (35, '商务聚餐套餐', NULL, 17, NULL, 50, NULL, 1, 55.00);
INSERT INTO `order_detail` VALUES (36, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 27, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (37, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 27, 49, NULL, NULL, 2, 2.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (6, '1781367172641', 6, 47, 2, '2026-06-14 00:12:53', NULL, 1, 0, 51.00, '', '15089520570', '理解', '理解', '理解', '用户取消', NULL, '2026-07-02 02:45:33', '2026-06-14 01:12:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (7, '1782931582184', 3, 47, 2, '2026-07-02 02:46:22', NULL, 1, 0, 10.00, '', '15089520570', '理解', '理解', '理解', NULL, NULL, NULL, '2026-07-02 03:46:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (8, '1782931696376', 6, 47, 2, '2026-07-02 02:48:16', NULL, 1, 0, 10.00, '', '15089520570', '理解', '理解', '理解', '用户取消', NULL, '2026-07-02 02:49:25', '2026-07-02 03:48:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (9, '1782933720184', 6, 47, 2, '2026-07-02 03:22:00', NULL, 1, 0, 157.00, '', '15089520570', '理解', '理解', '理解', '用户取消', NULL, '2026-07-02 03:22:13', '2026-07-02 04:21:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (10, '1783272356100', 6, 47, 2, '2026-07-06 01:25:56', NULL, 1, 0, 185.00, '', '15089520570', '理解', '理解', '理解', '订单超时，取消订单', NULL, '2026-07-06 01:41:00', '2026-07-06 02:25:00', 0, NULL, 6, 0, 0);
INSERT INTO `orders` VALUES (11, '1783272613521', 6, 47, 2, '2026-07-06 01:30:14', NULL, 1, 0, 13.00, '', '15089520570', '理解', '理解', '理解', '订单超时，取消订单', NULL, '2026-07-06 01:46:00', '2026-07-06 02:30:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (12, '1783274121001', 6, 47, 2, '2026-07-06 01:55:21', NULL, 1, 0, 14.00, '', '15089520570', '理解', '理解', '理解', '订单超时，取消订单', NULL, '2026-07-06 02:11:00', '2026-07-06 02:55:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (13, '1783274311050', 6, 47, 2, '2026-07-06 01:58:31', NULL, 1, 0, 14.00, '', '15089520570', '理解', '理解', '理解', '订单超时，取消订单', NULL, '2026-07-06 02:14:00', '2026-07-06 02:58:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (14, '1783274430489', 6, 47, 2, '2026-07-06 02:00:30', NULL, 1, 0, 14.00, '', '15089520570', '理解', '理解', '理解', '订单超时，取消订单', NULL, '2026-07-06 02:16:00', '2026-07-06 03:00:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (15, '1783274577023', 6, 47, 2, '2026-07-06 02:02:57', NULL, 1, 1, 14.00, '', '15089520570', '理解', '理解', '理解', '订单量较多，暂时无法接单', NULL, '2026-07-08 02:25:07', '2026-07-06 03:02:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (16, '1783448530352', 3, 47, 2, '2026-07-08 02:22:10', NULL, 1, 1, 14.00, '', '15089520570', '理解', '理解', '理解', NULL, NULL, NULL, '2026-07-08 03:22:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (17, '1783448653568', 3, 47, 2, '2026-07-08 02:24:14', NULL, 1, 1, 144.00, '', '15089520570', '理解', '理解', '理解', NULL, NULL, NULL, '2026-07-08 03:24:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (23, '20250708001', 5, 1, 1, '2026-07-08 10:30:00', '2025-07-08 10:35:00', 1, 1, 35.00, '不要香菜', '13800138001', '北京市朝阳区xx路1号', '张三', '张三', NULL, NULL, NULL, '2025-07-08 11:30:00', 1, '2025-07-08 11:15:00', 2, 1, 1);
INSERT INTO `orders` VALUES (24, '20250708002', 5, 2, 2, '2026-07-08 12:00:00', '2025-07-08 12:10:00', 2, 1, 28.50, NULL, '13800138002', '上海市浦东新区xx路2号', '李四', '李四', NULL, NULL, NULL, '2025-07-08 13:00:00', 0, '2025-07-08 12:50:00', 0, 2, 0);
INSERT INTO `orders` VALUES (25, '20250709001', 5, 1, 1, '2026-07-09 09:00:00', '2025-07-09 09:05:00', 1, 1, 42.00, '少盐', '13800138001', '北京市朝阳区xx路1号', '张三', '张三', NULL, NULL, NULL, '2025-07-09 10:00:00', 1, '2025-07-09 09:45:00', 1, 1, 1);
INSERT INTO `orders` VALUES (26, '20250707001', 5, 2, 2, '2026-07-07 18:00:00', '2025-07-07 18:15:00', 1, 1, 18.00, NULL, '13800138002', '上海市浦东新区xx路2号', '李四', '李四', NULL, NULL, NULL, '2025-07-07 19:00:00', 1, '2025-07-07 18:50:00', 1, 1, 1);
INSERT INTO `orders` VALUES (27, '1783601548400', 3, 47, 2, '2026-07-09 20:52:28', NULL, 1, 1, 14.00, '', '15089520570', '理解', '理解', '理解', NULL, NULL, NULL, '2026-07-09 21:52:00', 0, NULL, 3, 0, 0);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (47, 13, '人气双人套餐', 35.00, 1, '含热菜与主食，适合两人分享', NULL, NULL, NULL, 13, 13);
INSERT INTO `setmeal` VALUES (48, 13, '超值工作餐', 42.00, 1, '一荤一素配主食', NULL, NULL, NULL, 13, 13);
INSERT INTO `setmeal` VALUES (49, 15, '清淡商务套餐', 38.00, 1, '蒸菜配汤，口味清淡', NULL, NULL, NULL, 13, 13);
INSERT INTO `setmeal` VALUES (50, 15, '商务聚餐套餐', 55.00, 1, '多道热菜组合，适合小型聚餐', NULL, NULL, NULL, 13, 13);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (52, 47, 73, '家常小菜', 20.00, 5);
INSERT INTO `setmeal_dish` VALUES (54, 48, 73, '家常小菜', 20.00, 6);
INSERT INTO `setmeal_dish` VALUES (55, 46, 50, '馒头', 1.00, 5);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (69, '馒头', 'http://localhost:8080/upload/Screenshot_20260323_052750_com.jiaohua_browser_edit_562358108740751.jpg', 47, 50, NULL, NULL, 1, 1.00, '2026-08-11 02:25:45');
INSERT INTO `shopping_cart` VALUES (70, '米饭', 'http://localhost:8080/upload/Screenshot_20260327_050636_com.jiaohua_browser.png', 47, 49, NULL, NULL, 1, 2.00, '2026-08-11 02:25:46');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (47, 'oeFFGvrUxkXBfhYCAZhSkWy_-ClI', NULL, NULL, NULL, NULL, NULL, '2026-06-10 02:20:18');

SET FOREIGN_KEY_CHECKS = 1;
