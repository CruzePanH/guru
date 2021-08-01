/*
 Navicat Premium Data Transfer

 Source Server         : changgou
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 192.168.159.134:3306
 Source Schema         : changgou_order

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 02/04/2020 04:47:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_category_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_category_report`;
CREATE TABLE `tb_category_report`  (
  `category_id1` int(11) NOT NULL COMMENT '1级分类',
  `category_id2` int(11) NOT NULL COMMENT '2级分类',
  `category_id3` int(11) NOT NULL COMMENT '3级分类',
  `count_date` date NOT NULL COMMENT '统计日期',
  `num` int(11) NULL DEFAULT NULL COMMENT '销售数量',
  `money` int(11) NULL DEFAULT NULL COMMENT '销售额',
  PRIMARY KEY (`category_id1`, `category_id2`, `category_id3`, `count_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tb_category_report
-- ----------------------------
INSERT INTO `tb_category_report` VALUES (1, 4, 5, '2019-01-26', 1, 300);
INSERT INTO `tb_category_report` VALUES (74, 7, 8, '2019-01-26', 5, 900);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单id',
  `total_num` int(11) NULL DEFAULT NULL COMMENT '数量合计',
  `total_money` int(11) NULL DEFAULT NULL COMMENT '金额合计',
  `pre_money` int(11) NULL DEFAULT NULL COMMENT '优惠金额',
  `post_fee` int(11) NULL DEFAULT NULL COMMENT '邮费',
  `pay_money` int(11) NULL DEFAULT NULL COMMENT '实付金额',
  `pay_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '支付类型，1、在线支付、0 货到付款',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '订单更新时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime(0) NULL DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流单号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名称',
  `buyer_message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '买家留言',
  `buyer_rate` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否评价',
  `receiver_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `receiver_mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人手机',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人地址',
  `source_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单来源：1:web，2：app，3：微信公众号，4：微信小程序  5 H5手机页面',
  `transaction_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '交易流水号',
  `order_status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单状态,0:未完成,1:已完成，2：已退货',
  `pay_status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '支付状态,0:未支付，1：已支付，2：支付失败',
  `consign_status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发货状态,0:未发货，1：已发货，2：已收货',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `status`(`order_status`) USING BTREE,
  INDEX `payment_type`(`pay_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1163030316416237512', 17, 9812, NULL, NULL, 9812, '1', '2019-08-18 10:10:10', '2019-08-18 10:10:10', '2019-08-18 10:34:41', NULL, NULL, NULL, NULL, NULL, 'wangwu', NULL, NULL, '王五', '136700000', '中国北京黑马', '1', '4200000345201908186864005884', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for tb_order_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_config`;
CREATE TABLE `tb_order_config`  (
  `id` int(11) NOT NULL COMMENT 'ID',
  `order_timeout` int(11) NULL DEFAULT NULL COMMENT '正常订单超时时间（分）',
  `seckill_timeout` int(11) NULL DEFAULT NULL COMMENT '秒杀订单超时时间（分）',
  `take_timeout` int(11) NULL DEFAULT NULL COMMENT '自动收货（天）',
  `service_timeout` int(11) NULL DEFAULT NULL COMMENT '售后期限',
  `comment_timeout` int(11) NULL DEFAULT NULL COMMENT '自动五星好评',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_config
-- ----------------------------
INSERT INTO `tb_order_config` VALUES (1, 60, 10, 15, 7, 7);

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `category_id1` int(11) NULL DEFAULT NULL COMMENT '1级分类',
  `category_id2` int(11) NULL DEFAULT NULL COMMENT '2级分类',
  `category_id3` int(11) NULL DEFAULT NULL COMMENT '3级分类',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'SPU_ID',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'SKU_ID',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `price` int(20) NULL DEFAULT NULL COMMENT '单价',
  `num` int(10) NULL DEFAULT NULL COMMENT '数量',
  `money` int(20) NULL DEFAULT NULL COMMENT '总金额',
  `pay_money` int(11) NULL DEFAULT NULL COMMENT '实付金额',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片地址',
  `weight` int(11) NULL DEFAULT NULL COMMENT '重量',
  `post_fee` int(11) NULL DEFAULT NULL COMMENT '运费',
  `is_return` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否退货,0:未退货，1：已退货',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`sku_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------
INSERT INTO `tb_order_item` VALUES ('1163030316433014784', 74, 75, 76, 1148477873514881024, 1148477873695236096, '1163030316416237561', '海尔 涉龟幻  环绕  20英寸  170', 356, 3, 1068, NULL, 'http://img11.360buyimg.com/n7/jfs/t1/21612/38/4767/334593/5c3582e4E8fd541ce/a17353d206e19e68.jpg', NULL, NULL, '0');
INSERT INTO `tb_order_item` VALUES ('1163030316764364800', 74, 75, 76, 1148477873900756992, 1148477873951088640, '1163030316416237561', '联想 员广痘柿  环绕  20英寸  165', 508, 6, 3048, NULL, 'http://img11.360buyimg.com/n7/jfs/t1/6413/35/485/159824/5bc9349eE2ddb3c30/6dddf7ef5a4de686.jpg', NULL, NULL, '0');
INSERT INTO `tb_order_item` VALUES ('1163030316781142016', 74, 75, 76, 1148477873514881024, 1148477873732984832, '1163030316416237561', '海尔 涉龟幻  环绕  50英寸  170', 610, 2, 1220, NULL, 'http://img11.360buyimg.com/n7/jfs/t1/21612/38/4767/334593/5c3582e4E8fd541ce/a17353d206e19e68.jpg', NULL, NULL, '0');
INSERT INTO `tb_order_item` VALUES ('1163030316797919232', 74, 75, 76, 1148477873158365184, 1148477873175142400, '1163030316416237561', 'TCL 测试掀暮涩  立体声  20英寸  165', 746, 6, 4476, NULL, 'http://img13.360buyimg.com/n7/jfs/t1/47562/33/125/375477/5cd2c3bdE4164c44c/7c809fa28037ad16.jpg', NULL, NULL, '0');

-- ----------------------------
-- Table structure for tb_order_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_log`;
CREATE TABLE `tb_order_log`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `operater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单ID',
  `order_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态,0未完成，1已完成，2，已退货',
  `pay_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款状态  0:未支付，1：已支付，2：支付失败',
  `consign_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货状态',
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `money` int(11) NULL DEFAULT NULL COMMENT '支付金额',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_log
-- ----------------------------
INSERT INTO `tb_order_log` VALUES ('1131403764209684480', NULL, NULL, 'NO.1131403764083855360', '0', '1', '0', '创建支付记录！', 1499950, 'szitheima');
INSERT INTO `tb_order_log` VALUES ('1160860277189775360', NULL, NULL, '1160860272995471360', '0', '1', NULL, '创建支付记录！', 639900, 'wangwu');

-- ----------------------------
-- Table structure for tb_preferential
-- ----------------------------
DROP TABLE IF EXISTS `tb_preferential`;
CREATE TABLE `tb_preferential`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `buy_money` int(11) NULL DEFAULT NULL COMMENT '消费金额',
  `pre_money` int(11) NULL DEFAULT NULL COMMENT '优惠金额',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '品类ID',
  `start_time` date NULL DEFAULT NULL COMMENT '活动开始日期',
  `end_time` date NULL DEFAULT NULL COMMENT '活动截至日期',
  `state` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型1不翻倍 2翻倍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_preferential
-- ----------------------------
INSERT INTO `tb_preferential` VALUES (1, 10000, 3000, 757, '2019-01-16', '2019-01-18', '1', '1');
INSERT INTO `tb_preferential` VALUES (2, 30000, 10000, 757, '2019-01-16', '2019-01-18', '1', '1');
INSERT INTO `tb_preferential` VALUES (3, 60000, 30000, 757, '2019-01-16', '2019-01-18', '1', '1');
INSERT INTO `tb_preferential` VALUES (4, 10000, 4000, 76, '2019-01-16', '2019-03-23', '1', '2');

-- ----------------------------
-- Table structure for tb_return_cause
-- ----------------------------
DROP TABLE IF EXISTS `tb_return_cause`;
CREATE TABLE `tb_return_cause`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cause` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `seq` int(11) NULL DEFAULT 1 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_return_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_return_order`;
CREATE TABLE `tb_return_order`  (
  `id` bigint(20) NOT NULL COMMENT '服务单号',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单号',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `user_account` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `linkman` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `linkman_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `return_money` int(11) NULL DEFAULT NULL COMMENT '退款金额',
  `is_return_freight` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否退运费',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请状态',
  `dispose_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `return_cause` int(11) NULL DEFAULT NULL COMMENT '退货退款原因',
  `evidence` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凭证图片',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题描述',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_return_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_return_order_item`;
CREATE TABLE `tb_return_order_item`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类ID',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'SPU_ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'SKU_ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_item_id` bigint(20) NULL DEFAULT NULL COMMENT '订单明细ID',
  `return_order_id` bigint(20) NOT NULL COMMENT '退货订单ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `price` int(20) NULL DEFAULT NULL COMMENT '单价',
  `num` int(10) NULL DEFAULT NULL COMMENT '数量',
  `money` int(20) NULL DEFAULT NULL COMMENT '总金额',
  `pay_money` int(20) NULL DEFAULT NULL COMMENT '支付金额',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片地址',
  `weight` int(11) NULL DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`sku_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime(0) NOT NULL,
  `log_modified` datetime(0) NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionkey`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
