/*
 Navicat Premium Data Transfer

 Source Server         : changgou
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 192.168.159.134:3306
 Source Schema         : changgou_oauth

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 02/04/2020 04:46:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端ID，主要用于标识对应的应用',
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端秘钥，BCryptPasswordEncoder加密算法加密',
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应的范围',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证模式',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证后重定向地址',
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL COMMENT '令牌有效期',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT '令牌刷新周期',
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('changgou', NULL, '$2a$10$wZRCFgWnwABfE60igAkBPeuGFuzk74V2jw3/trkdUZpnteCtJ9p9m', 'app', 'authorization_code,password,refresh_token,client_credentials', 'http://localhost', NULL, 432000000, 432000000, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('szitheima', NULL, '$2a$10$igxoCZxTbjWx5TrmfWEEpe/WFdwbUhbxik9BKTe9i64ZOSfnu/lqe', 'app', 'authorization_code,password,refresh_token,client_credentials', 'http://localhost', NULL, 432000000, 432000000, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
