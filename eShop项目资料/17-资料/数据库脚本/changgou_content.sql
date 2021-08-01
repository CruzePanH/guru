/*
 Navicat Premium Data Transfer

 Source Server         : changgou
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 192.168.159.134:3306
 Source Schema         : changgou_content

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 02/04/2020 04:46:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_content`;
CREATE TABLE `tb_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL COMMENT '内容类目ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容标题',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片绝对路径',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态,0无效，1有效',
  `sort_order` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_content
-- ----------------------------
INSERT INTO `tb_content` VALUES (28, 1, '京东广告', 'http://www.itheima.com', 'http://192.168.211.128/group1/M00/00/03/wKjTgFucGIOECJMPAAAAAKbBPuo782.jpg', '1', 1);
INSERT INTO `tb_content` VALUES (29, 1, '深圳真美北京不错南京大美丽', 'http://www.itheima.com', 'http://www.itheima.com', '1', 1);
INSERT INTO `tb_content` VALUES (30, 2, '你吃饭了吗', 'http://www.itheima.com', 'http://www.itheima.com', '1', 1);
INSERT INTO `tb_content` VALUES (31, 2, '你的衣服好漂亮', 'http://www.itheima.com', 'http://www.itheima.com', '1', 1);

-- ----------------------------
-- Table structure for tb_content_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_content_category`;
CREATE TABLE `tb_content_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_content_category
-- ----------------------------
INSERT INTO `tb_content_category` VALUES (1, '首页轮播广告');
INSERT INTO `tb_content_category` VALUES (2, '今日推荐A');
INSERT INTO `tb_content_category` VALUES (3, '活动专区');
INSERT INTO `tb_content_category` VALUES (4, '猜你喜欢');

SET FOREIGN_KEY_CHECKS = 1;
