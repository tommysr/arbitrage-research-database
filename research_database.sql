/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MariaDB
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : project

 Target Server Type    : MariaDB
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 02/06/2023 14:22:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for arbitrageurs
-- ----------------------------
DROP TABLE IF EXISTS `arbitrageurs`;
CREATE TABLE `arbitrageurs`  (
  `arbitrageur_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `surname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zip_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_handle` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`arbitrageur_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arbitrageurs
-- ----------------------------
INSERT INTO `arbitrageurs` VALUES (1, 'John', 'Smith', '123 Main St', 'New York', '10001', 'USA', 'john.smith@example.com');
INSERT INTO `arbitrageurs` VALUES (2, 'Emma', 'Wilson', '456 Elm St', 'San Francisco', '94101', 'USA', 'emma.wilson@example.com');
INSERT INTO `arbitrageurs` VALUES (3, 'David', 'Taylor', '789 Maple St', 'London', '11001', 'United Kingdom', 'david.taylor@example.com');
INSERT INTO `arbitrageurs` VALUES (4, 'Sarah', 'Johnson', '789 Oak St', 'Los Angeles', '90001', 'USA', 'sarah.johnson@example.com');
INSERT INTO `arbitrageurs` VALUES (5, 'Michael', 'Brown', '321 Pine St', 'Chicago', '60601', 'USA', 'michael.brown@example.com');
INSERT INTO `arbitrageurs` VALUES (6, 'Emily', 'Davis', '654 Cedar St', 'Houston', '77001', 'USA', 'emily.davis@example.com');

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `arbitrageur_id` int(11) NULL DEFAULT NULL,
  `public_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`account_id`) USING BTREE,
  INDEX `accounts_arbitrageur_id`(`arbitrageur_id`) USING BTREE,
  CONSTRAINT `accounts_arbitrageurs` FOREIGN KEY (`arbitrageur_id`) REFERENCES `arbitrageurs` (`arbitrageur_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1, 1, '0x12345678901234567890123456789012345678901234567890123456789012', '2023-06-02 02:04:35');
INSERT INTO `accounts` VALUES (2, NULL, '0x23456789012345678901234567890123456789012345678901234567890123', '2023-02-22 10:26:15');
INSERT INTO `accounts` VALUES (3, NULL, '0x34567890123456789012345678901234567890123456789012345678901234', '2023-05-11 02:22:01');
INSERT INTO `accounts` VALUES (4, 2, '0x45678901234567890123456789012345678901234567890123456789012345', '2023-05-31 09:02:02');
INSERT INTO `accounts` VALUES (5, 4, '0x56789012345678901234567890123456789012345678901234567890123456', '2023-02-02 12:22:11');
INSERT INTO `accounts` VALUES (6, 3, '0x67890123456789012345678901234567890123456789012345678901234567', '2023-06-01 03:06:45');
INSERT INTO `accounts` VALUES (7, 5, '0x78901234567890123456789012345678901234567890123456789012345678', '2023-05-22 06:04:22');
INSERT INTO `accounts` VALUES (8, 2, '0x89012345678901234567890123456789012345678901234567890123456789', '2023-03-02 12:44:25');
INSERT INTO `accounts` VALUES (9, 6, '0x90123456789012345678901234567890123456789012345678901234567890', '2023-06-01 14:22:25');
INSERT INTO `accounts` VALUES (10, NULL, '0x01234567890123456789012345678901234567890123456789012345678901', '2023-04-22 12:04:45');

-- ----------------------------
-- Table structure for blocks
-- ----------------------------
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks`  (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `block_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `block_timestamp` datetime NOT NULL,
  PRIMARY KEY (`block_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blocks
-- ----------------------------
INSERT INTO `blocks` VALUES (1, 'dddb30e0d1e02d4b2a6d0131b21828ff178f8436b8db49d88e74996e7e987a81', '2023-06-02 12:00:00');
INSERT INTO `blocks` VALUES (2, '93e730afdbf8624e7f4e9f55e858d35ef336be56e992f7e1b05138b2a51e2511', '2023-06-02 12:01:00');
INSERT INTO `blocks` VALUES (3, 'e893d7e4d8f1f520345ef1e25e62e20f72fcd7f9b0e88f6e8ae61b0d0d8469ee', '2023-06-02 12:02:00');
INSERT INTO `blocks` VALUES (4, 'efc152be179b1621869e2d09d286e64e8c02be5e4fb58a10eb03c7bc014b8d41', '2023-06-02 12:03:00');
INSERT INTO `blocks` VALUES (5, '10ad6dbf0c8f21a7062c1f3ef573e624d93cb4f09c6ed2ebc1eeae2f343a0e70', '2023-06-02 12:04:00');
INSERT INTO `blocks` VALUES (6, '9a6be0a6d5daa982e57e0b56f289a0b53ddc642f0c03a3ce0f0c31a5ce6ceaa6', '2023-06-02 12:05:00');
INSERT INTO `blocks` VALUES (7, 'e8734493db680fe8c226af3969d8c4e7c76438dbb199d4193b4d401772d8e768', '2023-06-02 12:06:00');
INSERT INTO `blocks` VALUES (8, '0f5c671520a93d55a0dc20f53b6b389c9f020d9a4abab62111722604011c2e06', '2023-06-02 12:07:00');
INSERT INTO `blocks` VALUES (9, '86f70f3d1663fe1df04e1af5a89f5cc3a41d0703f80be768e5b2b1e2bb68cbf6', '2023-06-02 12:08:00');
INSERT INTO `blocks` VALUES (10, 'fcd8587ce9dc165352bb8a270ad3cde73a8d05c56b88de74c769c6e883e74214', '2023-06-02 12:09:00');
INSERT INTO `blocks` VALUES (11, '9ac0e7e0d2f8c90a9b731dd1b5e20875b69db134e8d5a6214bb3894f0c15aedd', '2023-06-02 12:10:00');
INSERT INTO `blocks` VALUES (12, '7db3e15d8d1d942f263e1c37b7c5d6f4147cc48c2d6b9de6840b6f2dbcb12dd7', '2023-06-02 12:11:00');
INSERT INTO `blocks` VALUES (13, '9783e6e6312e8cfd6b336d7d3584af6e6a8e4fb87fe80c0e635e29b314e65d7a', '2023-06-02 12:12:00');
INSERT INTO `blocks` VALUES (14, 'b37f428c474d995a0df6725a930797c67f686fa60a727b4ae4dd5f52749af1de', '2023-06-02 12:13:00');
INSERT INTO `blocks` VALUES (15, 'c3d4096f8818d0e6e2e3a5f5d95ef0c0a08dbb9be8f4e8740b4aaf17b7ff51df', '2023-06-02 12:14:00');
INSERT INTO `blocks` VALUES (16, 'e22e8a16c1ea2c02dddf1a49a37009bdf7c14ed21dbd43ce12b7e9a2d4d6f40c', '2023-06-02 12:15:00');
INSERT INTO `blocks` VALUES (17, 'bd99e37ad036eef9e2fcd67b8f8fd3b711ab6ac38365ae9d791a63c71a22e292', '2023-06-02 12:16:00');
INSERT INTO `blocks` VALUES (18, '4c9320433648296d2b1de71ee2d86ff679bd864e60c1db18e4f20dc17c7ce76b', '2023-06-02 12:17:00');
INSERT INTO `blocks` VALUES (19, 'd4c1d96e9ad0182e0d77df9b8be0d3bbd6f876b15ef5f079b3f523d3c5220e14', '2023-06-02 12:18:00');
INSERT INTO `blocks` VALUES (20, '3d02430542fe22ef10bc4f63a4dcd07c364e10ebe696810786ebd4ac05deaa3e', '2023-06-02 12:19:00');
INSERT INTO `blocks` VALUES (21, '39c37ea17d672731f0f7b6179a2d78869f0c6141f833912ea3d663d222a29de2', '2023-06-02 12:20:00');
INSERT INTO `blocks` VALUES (22, '5f19f889fffa0d87db071d8190e19e7e7810ad35e9c7e7df559c23ceca2e15b1', '2023-06-02 12:21:00');
INSERT INTO `blocks` VALUES (23, '5cc4e853fd4a6eaac27551e738313bc61f8584f62ea6e7d0dca0b02e107a0d48', '2023-06-02 12:22:00');
INSERT INTO `blocks` VALUES (24, 'c19458f17ef9305cb6a7c63ce61a8e0ef8040a3f665a72a56cb526a4aaf0c92f', '2023-06-02 12:23:00');
INSERT INTO `blocks` VALUES (25, 'bca81a54c18c0f09036a3f524d5e477568b7b77c14f15b3c186d90f566a6ab6a', '2023-06-02 12:24:00');

-- ----------------------------
-- Table structure for exchanges
-- ----------------------------
DROP TABLE IF EXISTS `exchanges`;
CREATE TABLE `exchanges`  (
  `exchange_id` int(11) NOT NULL AUTO_INCREMENT,
  `exchange_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exchange_type` enum('AMM','CAMM','ORDERBOOK') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`exchange_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exchanges
-- ----------------------------
INSERT INTO `exchanges` VALUES (1, 'Raydium', 'AMM');
INSERT INTO `exchanges` VALUES (2, 'Dotwave', 'CAMM');
INSERT INTO `exchanges` VALUES (3, 'Openbook', 'ORDERBOOK');
INSERT INTO `exchanges` VALUES (4, 'Orca', 'AMM');

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens`  (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO `tokens` VALUES (1, 'SOL', '0x1234567890123456789012345678901234567890');
INSERT INTO `tokens` VALUES (2, 'USDC', '0xabcdefabcdefabcdefabcdefabcdefabcdefabcd');
INSERT INTO `tokens` VALUES (3, 'SRM', '0x9876543210987654321098765432109876543210');
INSERT INTO `tokens` VALUES (4, 'RAY', '0xfedcba9876543210fedcba9876543210fedcba98');

-- ----------------------------
-- Table structure for base_tokens
-- ----------------------------
DROP TABLE IF EXISTS `base_tokens`;
CREATE TABLE `base_tokens`  (
  `base_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  PRIMARY KEY (`base_token_id`) USING BTREE,
  INDEX `base_tokens_token_id`(`token_id`) USING BTREE,
  CONSTRAINT `base_tokens_tokens` FOREIGN KEY (`token_id`) REFERENCES `tokens` (`token_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_tokens
-- ----------------------------
INSERT INTO `base_tokens` VALUES (1, 1);
INSERT INTO `base_tokens` VALUES (2, 2);
INSERT INTO `base_tokens` VALUES (3, 3);
INSERT INTO `base_tokens` VALUES (4, 4);

-- ----------------------------
-- Table structure for quote_tokens
-- ----------------------------
DROP TABLE IF EXISTS `quote_tokens`;
CREATE TABLE `quote_tokens`  (
  `quote_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  PRIMARY KEY (`quote_token_id`) USING BTREE,
  INDEX `quote_tokens_token_id`(`token_id`) USING BTREE,
  CONSTRAINT `quote_tokens_tokens` FOREIGN KEY (`token_id`) REFERENCES `tokens` (`token_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quote_tokens
-- ----------------------------
INSERT INTO `quote_tokens` VALUES (1, 1);
INSERT INTO `quote_tokens` VALUES (2, 2);
INSERT INTO `quote_tokens` VALUES (3, 3);
INSERT INTO `quote_tokens` VALUES (4, 4);

-- ----------------------------
-- Table structure for pools
-- ----------------------------
DROP TABLE IF EXISTS `pools`;
CREATE TABLE `pools`  (
  `pool_id` int(11) NOT NULL AUTO_INCREMENT,
  `exchange_id` int(11) NOT NULL,
  `base_token_id` int(11) NOT NULL,
  `quote_token_id` int(11) NOT NULL,
  `pool_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`pool_id`) USING BTREE,
  INDEX `pools_exchange_id`(`exchange_id`) USING BTREE,
  INDEX `pools_base_token_id`(`base_token_id`) USING BTREE,
  INDEX `pools_quote_token_id`(`quote_token_id`) USING BTREE,
  CONSTRAINT `pools_base_tokens` FOREIGN KEY (`base_token_id`) REFERENCES `base_tokens` (`base_token_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pools_exchanges` FOREIGN KEY (`exchange_id`) REFERENCES `exchanges` (`exchange_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pools_quote_tokens` FOREIGN KEY (`quote_token_id`) REFERENCES `quote_tokens` (`quote_token_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pools
-- ----------------------------
INSERT INTO `pools` VALUES (1, 1, 1, 2, 'SOL/USDC');
INSERT INTO `pools` VALUES (2, 2, 3, 2, 'SRM/USDC');
INSERT INTO `pools` VALUES (3, 1, 3, 4, 'SRM/RAY');
INSERT INTO `pools` VALUES (4, 3, 4, 1, 'RAY/SOL');
INSERT INTO `pools` VALUES (5, 2, 3, 2, 'SRM/USDC');
INSERT INTO `pools` VALUES (6, 3, 1, 3, 'SOL/SRM');
INSERT INTO `pools` VALUES (7, 1, 1, 2, 'SOL/USDC');
INSERT INTO `pools` VALUES (8, 2, 3, 1, 'SRM/SOL');
INSERT INTO `pools` VALUES (9, 3, 4, 2, 'RAY/USDC');
INSERT INTO `pools` VALUES (10, 1, 3, 2, 'SRM/USDC');
INSERT INTO `pools` VALUES (11, 3, 1, 2, 'SOL/USDC');
INSERT INTO `pools` VALUES (12, 2, 4, 2, 'RAY/USDC');
INSERT INTO `pools` VALUES (13, 1, 2, 3, 'USDC/SRM');

-- ----------------------------
-- Table structure for arbitrages
-- ----------------------------
DROP TABLE IF EXISTS `arbitrages`;
CREATE TABLE `arbitrages`  (
  `arbitrage_id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `gas_fee` decimal(18, 9) NOT NULL,
  `priority_fee` decimal(18, 9) NOT NULL,
  `profit` decimal(18, 9) NOT NULL,
  PRIMARY KEY (`arbitrage_id`) USING BTREE,
  INDEX `arbitrages_block_id`(`block_id`) USING BTREE,
  INDEX `arbitrages_account_id`(`account_id`) USING BTREE,
  CONSTRAINT `arbitrages_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `arbitrages_blocks` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`block_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arbitrages
-- ----------------------------
INSERT INTO `arbitrages` VALUES (1, 1, 1, 0.001000000, 0.002000000, 0.005000000);
INSERT INTO `arbitrages` VALUES (2, 2, 2, 0.002000000, 0.003000000, 10.008000000);
INSERT INTO `arbitrages` VALUES (3, 3, 1, 0.003000000, 0.004000000, 0.010000000);
INSERT INTO `arbitrages` VALUES (4, 4, 5, 0.004000000, 0.005000000, 0.011000000);
INSERT INTO `arbitrages` VALUES (5, 5, 1, 0.005000000, 0.006000000, 5.014000000);
INSERT INTO `arbitrages` VALUES (6, 6, 4, 0.006000000, 0.007000000, 0.017000000);
INSERT INTO `arbitrages` VALUES (7, 7, 3, 0.007000000, 0.008000000, 4.019000000);
INSERT INTO `arbitrages` VALUES (8, 8, 3, 0.008000000, 0.009000000, 0.022000000);
INSERT INTO `arbitrages` VALUES (9, 9, 2, 0.009000000, 0.010000000, 0.025000000);
INSERT INTO `arbitrages` VALUES (10, 10, 6, 0.010000000, 0.011000000, 1.028000000);

-- ----------------------------
-- Table structure for arbitrage_pool
-- ----------------------------
DROP TABLE IF EXISTS `arbitrage_pool`;
CREATE TABLE `arbitrage_pool`  (
  `arbitrage_id` int(11) NOT NULL,
  `pool_id` int(11) NOT NULL,
  PRIMARY KEY (`arbitrage_id`, `pool_id`) USING BTREE,
  INDEX `arbitrage_pool_pool`(`pool_id`) USING BTREE,
  CONSTRAINT `arbitrage_pool_arbitrage` FOREIGN KEY (`arbitrage_id`) REFERENCES `arbitrages` (`arbitrage_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `arbitrage_pool_pool` FOREIGN KEY (`pool_id`) REFERENCES `pools` (`pool_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arbitrage_pool
-- ----------------------------
INSERT INTO `arbitrage_pool` VALUES (1, 9);
INSERT INTO `arbitrage_pool` VALUES (1, 12);
INSERT INTO `arbitrage_pool` VALUES (2, 1);
INSERT INTO `arbitrage_pool` VALUES (2, 7);
INSERT INTO `arbitrage_pool` VALUES (3, 5);
INSERT INTO `arbitrage_pool` VALUES (3, 10);
INSERT INTO `arbitrage_pool` VALUES (4, 5);
INSERT INTO `arbitrage_pool` VALUES (4, 10);
INSERT INTO `arbitrage_pool` VALUES (5, 9);
INSERT INTO `arbitrage_pool` VALUES (5, 12);
INSERT INTO `arbitrage_pool` VALUES (6, 1);
INSERT INTO `arbitrage_pool` VALUES (6, 11);
INSERT INTO `arbitrage_pool` VALUES (7, 9);
INSERT INTO `arbitrage_pool` VALUES (7, 12);
INSERT INTO `arbitrage_pool` VALUES (8, 1);
INSERT INTO `arbitrage_pool` VALUES (8, 7);
INSERT INTO `arbitrage_pool` VALUES (9, 1);
INSERT INTO `arbitrage_pool` VALUES (9, 11);
INSERT INTO `arbitrage_pool` VALUES (10, 5);
INSERT INTO `arbitrage_pool` VALUES (10, 9);

-- ----------------------------
-- Table structure for snapshots
-- ----------------------------
DROP TABLE IF EXISTS `snapshots`;
CREATE TABLE `snapshots`  (
  `snapshot_id` int(11) NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL,
  `base_quantity` decimal(18, 9) NOT NULL,
  `quote_quantity` decimal(18, 9) NOT NULL,
  `price_confidence` decimal(8, 6) NULL DEFAULT NULL,
  `concentration` decimal(8, 6) NULL DEFAULT NULL,
  `price` decimal(18, 9) NULL DEFAULT NULL,
  `fee_percentage` decimal(8, 6) NOT NULL,
  `exchange_parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL CHECK (json_valid(`exchange_parameters`)),
  PRIMARY KEY (`snapshot_id`) USING BTREE,
  INDEX `snapshots_pool_id`(`pool_id`) USING BTREE,
  CONSTRAINT `snapshots_pools` FOREIGN KEY (`pool_id`) REFERENCES `pools` (`pool_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of snapshots
-- ----------------------------
INSERT INTO `snapshots` VALUES (1, 9, 100144.123000000, 200124.456000000, NULL, NULL, NULL, 0.500000, '{}');
INSERT INTO `snapshots` VALUES (2, 12, 50424.789000000, 100124.321000000, NULL, NULL, NULL, 0.750000, '{}');
INSERT INTO `snapshots` VALUES (3, 1, 755312.432000000, 150124.876000000, NULL, NULL, NULL, 0.250000, '{}');
INSERT INTO `snapshots` VALUES (4, 7, 8062326.123000000, 160658865.456000000, NULL, NULL, NULL, 0.350000, '{}');
INSERT INTO `snapshots` VALUES (5, 5, 906232.789000000, 18085656.321000000, NULL, NULL, NULL, 0.150000, '{}');
INSERT INTO `snapshots` VALUES (6, 10, 70236.432000000, 14075457.876000000, NULL, NULL, NULL, 0.650000, '{}');
INSERT INTO `snapshots` VALUES (7, 12, 60236.123000000, 120856.456000000, NULL, NULL, NULL, 0.850000, '{}');
INSERT INTO `snapshots` VALUES (8, 9, 40643643.789000000, 8025354.321000000, NULL, NULL, NULL, 0.950000, '{}');
INSERT INTO `snapshots` VALUES (9, 11, 85346.432000000, 170346.000000000, NULL, NULL, NULL, 0.450000, '{}');
INSERT INTO `snapshots` VALUES (10, 1, 95634436.123000000, 190643346.456000000, NULL, NULL, NULL, 0.550000, '{}');

-- ----------------------------
-- Table structure for instructions
-- ----------------------------
DROP TABLE IF EXISTS `instructions`;
CREATE TABLE `instructions`  (
  `instruction_id` int(11) NOT NULL AUTO_INCREMENT,
  `arbitrage_id` int(11) NOT NULL,
  `snapshot_id` int(11) NULL DEFAULT NULL,
  `base_to_quote` tinyint(1) NOT NULL,
  `amount_in` decimal(18, 9) NOT NULL,
  `amount_out` decimal(18, 9) NOT NULL,
  PRIMARY KEY (`instruction_id`) USING BTREE,
  INDEX `instructions_arbitrage_id`(`arbitrage_id`) USING BTREE,
  INDEX `instructions_snapshot_id`(`snapshot_id`) USING BTREE,
  CONSTRAINT `instructions_arbitrage_id` FOREIGN KEY (`arbitrage_id`) REFERENCES `arbitrages` (`arbitrage_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `instructions_snapshot_id` FOREIGN KEY (`snapshot_id`) REFERENCES `snapshots` (`snapshot_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of instructions
-- ----------------------------
INSERT INTO `instructions` VALUES (1, 1, 1, 0, 100.000000000, 2.000000000);
INSERT INTO `instructions` VALUES (2, 1, 2, 1, 2.000000000, 100.005000000);
INSERT INTO `instructions` VALUES (3, 2, 3, 0, 200.000000000, 122.000000000);
INSERT INTO `instructions` VALUES (4, 2, 4, 1, 122.000000000, 210.008000000);
INSERT INTO `instructions` VALUES (5, 3, 5, 0, 144.400000000, 122.200000000);
INSERT INTO `instructions` VALUES (6, 3, 6, 1, 122.200000000, 144.410000000);
INSERT INTO `instructions` VALUES (7, 4, NULL, 0, 200.000000000, 150.000000000);
INSERT INTO `instructions` VALUES (8, 4, NULL, 1, 150.000000000, 200.011000000);
INSERT INTO `instructions` VALUES (9, 5, 7, 0, 180.900000000, 160.200000000);
INSERT INTO `instructions` VALUES (10, 5, 7, 1, 160.200000000, 185.914000000);
INSERT INTO `instructions` VALUES (11, 6, 9, 0, 70.000000000, 60.600000000);
INSERT INTO `instructions` VALUES (12, 6, 10, 1, 60.600000000, 70.017000000);
INSERT INTO `instructions` VALUES (13, 7, NULL, 0, 150.900000000, 120.525240000);
INSERT INTO `instructions` VALUES (14, 7, NULL, 1, 120.525240000, 154.019000000);
INSERT INTO `instructions` VALUES (15, 8, NULL, 0, 1244.000000000, 4122.414240000);
INSERT INTO `instructions` VALUES (16, 8, NULL, 1, 4212.414240000, 244.022000000);
INSERT INTO `instructions` VALUES (17, 9, NULL, 0, 2112.000000000, 4240.244000000);
INSERT INTO `instructions` VALUES (18, 9, NULL, 1, 4240.244000000, 2112.025000000);
INSERT INTO `instructions` VALUES (19, 10, NULL, 0, 230.500000000, 123.121200000);
INSERT INTO `instructions` VALUES (20, 10, NULL, 1, 123.121200000, 231.528000000);

-- ----------------------------
-- View structure for all_accounts_arbitrageurs
-- ----------------------------
DROP VIEW IF EXISTS `all_accounts_arbitrageurs`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_accounts_arbitrageurs` AS SELECT a.account_id, a.arbitrageur_id, a.public_key, a.created_at, arb.name AS "arbitrageur name", arb.surname AS "arbitrageur surname"
FROM accounts a
LEFT JOIN arbitrageurs arb ON a.arbitrageur_id = arb.arbitrageur_id ;

-- ----------------------------
-- View structure for all_instruction_details
-- ----------------------------
DROP VIEW IF EXISTS `all_instruction_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_instruction_details` AS SELECT i.instruction_id, i.arbitrage_id, i.snapshot_id,
       i.base_to_quote, i.amount_in, i.amount_out,
       acc.public_key,
       acc.created_at,
       s.pool_id, s.base_quantity, s.quote_quantity,
       s.price_confidence, s.concentration, s.price, s.fee_percentage, s.exchange_parameters
FROM instructions i
JOIN arbitrages a ON i.arbitrage_id = a.arbitrage_id
JOIN accounts acc ON a.account_id = acc.account_id
LEFT JOIN snapshots s ON i.snapshot_id = s.snapshot_id ;

-- ----------------------------
-- View structure for arbitrageurs_with_accounts
-- ----------------------------
DROP VIEW IF EXISTS `arbitrageurs_with_accounts`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `arbitrageurs_with_accounts` AS SELECT a.`arbitrageur_id`, a.`name`, a.`surname`, a.`address`, a.`city`, a.`zip_code`, a.`country`,
       ac.`account_id`, ac.`public_key`, ac.`created_at`
FROM `arbitrageurs` a
INNER JOIN `accounts` ac ON a.`arbitrageur_id` = ac.`arbitrageur_id` ;

-- ----------------------------
-- View structure for arbitrage_all_details
-- ----------------------------
DROP VIEW IF EXISTS `arbitrage_all_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `arbitrage_all_details` AS SELECT a.arbitrage_id, a.block_id, a.account_id, a.gas_fee, a.priority_fee, a.profit,
       ac.public_key, ac.created_at,
       b.block_hash, b.block_timestamp,
       arb.name AS arbitrageur_name, arb.surname AS arbitrageur_surname,
       arb.address, arb.city, arb.zip_code, arb.country, arb.contact_handle
FROM arbitrages a
JOIN accounts ac ON a.account_id = ac.account_id
JOIN blocks b ON a.block_id = b.block_id
LEFT JOIN arbitrageurs arb ON ac.arbitrageur_id = arb.arbitrageur_id ;

-- ----------------------------
-- View structure for pool_details
-- ----------------------------
DROP VIEW IF EXISTS `pool_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `pool_details` AS SELECT p.pool_id, p.exchange_id, p.base_token_id, p.quote_token_id,
       p.pool_name,
       ex.exchange_name, ex.exchange_type,
       btok.token_name AS base_token_name, btok.token_address AS base_token_address,
       qtok.token_name AS quote_token_name, qtok.token_address AS quote_token_address
FROM pools p
JOIN exchanges ex ON p.exchange_id = ex.exchange_id
JOIN base_tokens bt ON p.base_token_id = bt.base_token_id
JOIN quote_tokens qt ON p.quote_token_id = qt.quote_token_id
JOIN tokens btok ON bt.token_id = btok.token_id
JOIN tokens qtok ON qt.token_id = qtok.token_id ;

-- ----------------------------
-- Procedure structure for addAccount
-- ----------------------------
DROP PROCEDURE IF EXISTS `addAccount`;
delimiter ;;
CREATE PROCEDURE `addAccount`(IN arbitrageurId INT,
    IN publicKey VARCHAR(64),
    IN createdAt DATETIME)
BEGIN
    INSERT INTO accounts (arbitrageur_id, public_key, created_at)
    VALUES (arbitrageurId, publicKey, createdAt);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for calculateProfit
-- ----------------------------
DROP FUNCTION IF EXISTS `calculateProfit`;
delimiter ;;
CREATE FUNCTION `calculateProfit`(accountId INT)
 RETURNS decimal(18,9)
BEGIN
    DECLARE total_profit DECIMAL(18, 9);
    
    SELECT SUM(profit) INTO total_profit
    FROM arbitrages
    WHERE account_id = accountId;
    
    RETURN total_profit;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for countArbitrages
-- ----------------------------
DROP FUNCTION IF EXISTS `countArbitrages`;
delimiter ;;
CREATE FUNCTION `countArbitrages`(accountId INT)
 RETURNS int(11)
BEGIN
	DECLARE
		count INT;
	SELECT
		COUNT(*) INTO count 
	FROM
		arbitrages 
	WHERE
		account_id = accountId;
	RETURN count;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insertArbitragePool
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertArbitragePool`;
delimiter ;;
CREATE PROCEDURE `insertArbitragePool`(instructionId INT)
BEGIN
  DECLARE snapshotId INT;
  DECLARE poolId INT;

  SELECT snapshot_id
  INTO snapshotId
  FROM instructions
  WHERE instruction_id = instructionId;

  IF snapshotId IS NOT NULL THEN
    SELECT pool_id
    INTO poolId
    FROM snapshots
    WHERE snapshot_id = snapshotId;

    IF poolId IS NOT NULL THEN
      INSERT INTO arbitrage_pool (arbitrage_id, pool_id)
      VALUES ((SELECT arbitrage_id FROM instructions WHERE instruction_id = instructionId), poolId);
    END IF;
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insertPool
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertPool`;
delimiter ;;
CREATE PROCEDURE `insertPool`(IN param_base_token_id INT,
    IN param_quote_token_id INT,
    IN param_exchange_id INT)
BEGIN
    DECLARE new_base_token_id INT;
    DECLARE new_quote_token_id INT;
    DECLARE new_pool_name VARCHAR(255);
    DECLARE new_exchange_id INT;

    SET new_base_token_id = param_base_token_id;
    SET new_quote_token_id = param_quote_token_id;
    SET new_exchange_id = param_exchange_id;

    SELECT CONCAT(t1.token_name, '/', t2.token_name)
    INTO new_pool_name
    FROM tokens AS t1
    INNER JOIN tokens AS t2 ON t2.token_id = new_quote_token_id
    WHERE t1.token_id = new_base_token_id;

    INSERT INTO pools (base_token_id, quote_token_id, pool_name, exchange_id)
    VALUES (new_base_token_id, new_quote_token_id, new_pool_name, new_exchange_id);
END
;;
delimiter ;

-- ----------------------------
-- Event structure for delete_old_arbitrages
-- ----------------------------
DROP EVENT IF EXISTS `delete_old_arbitrages`;
delimiter ;;
CREATE EVENT `delete_old_arbitrages`
ON SCHEDULE
EVERY '1' DAY STARTS '2023-06-02 00:46:15'
DO BEGIN
	DECLARE
		min_block_id INT;
	
	SET min_block_id = ( SELECT MIN( block_id ) FROM blocks WHERE block_timestamp < NOW() - INTERVAL 120 DAY );
	DELETE 
	FROM
		arbitrages 
	WHERE
		block_id <= min_block_id;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table accounts
-- ----------------------------
DROP TRIGGER IF EXISTS `check_format`;
delimiter ;;
CREATE TRIGGER `check_format` BEFORE INSERT ON `accounts` FOR EACH ROW IF
	NEW.public_key NOT REGEXP '^[A-Za-z0-9]+$' THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'Nieprawidłowy format adresu.';
	
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table accounts
-- ----------------------------
DROP TRIGGER IF EXISTS `check unique`;
delimiter ;;
CREATE TRIGGER `check unique` BEFORE INSERT ON `accounts` FOR EACH ROW IF
	EXISTS ( SELECT 1 FROM accounts WHERE public_key = NEW.public_key ) THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'Wartość adresu już istnieje.';
	
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table accounts
-- ----------------------------
DROP TRIGGER IF EXISTS `check_valid_arbitrageur`;
delimiter ;;
CREATE TRIGGER `check_valid_arbitrageur` BEFORE UPDATE ON `accounts` FOR EACH ROW IF NEW.arbitrageur_id IS NOT NULL THEN
    IF NOT EXISTS (SELECT 1 FROM arbitrageurs WHERE arbitrageur_id = NEW.arbitrageur_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Wartość pola arbitrageur_id nie jest poprawna';
    END IF;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table arbitrages
-- ----------------------------
DROP TRIGGER IF EXISTS `before_delete_instructions`;
delimiter ;;
CREATE TRIGGER `before_delete_instructions` BEFORE DELETE ON `arbitrages` FOR EACH ROW BEGIN
	DELETE 
	FROM
		instructions 
	WHERE
		arbitrage_id = OLD.arbitrage_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table arbitrages
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_arbitrage`;
delimiter ;;
CREATE TRIGGER `after_delete_arbitrage` AFTER DELETE ON `arbitrages` FOR EACH ROW BEGIN
    DELETE FROM `arbitrage_pool` WHERE `arbitrage_id` = OLD.`arbitrage_id`;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table arbitrageurs
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_addresses`;
delimiter ;;
CREATE TRIGGER `delete_addresses` BEFORE DELETE ON `arbitrageurs` FOR EACH ROW BEGIN
	DELETE 
	FROM
		accounts
	WHERE
		arbitrageur_id = OLD.arbitrageur_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table instructions
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_instruction`;
delimiter ;;
CREATE TRIGGER `after_insert_instruction` AFTER INSERT ON `instructions` FOR EACH ROW BEGIN
  CALL insertArbitragePool(NEW.instruction_id);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pools
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_name`;
delimiter ;;
CREATE TRIGGER `insert_name` BEFORE INSERT ON `pools` FOR EACH ROW BEGIN
		SET NEW.pool_name = (
		SELECT
			CONCAT( t1.token_name, '/', t2.token_name ) 
		FROM
			tokens AS t1
			INNER JOIN tokens AS t2 ON t2.token_id = NEW.quote_token_id 
		WHERE
			t1.token_id = NEW.base_token_id 
		);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pools
-- ----------------------------
DROP TRIGGER IF EXISTS `update_name`;
delimiter ;;
CREATE TRIGGER `update_name` BEFORE UPDATE ON `pools` FOR EACH ROW BEGIN
    SET NEW.pool_name = (
        SELECT CONCAT(t1.token_name, '/', t2.token_name)
        FROM tokens AS t1
        INNER JOIN tokens AS t2 ON t2.token_id = NEW.quote_token_id
        WHERE t1.token_id = NEW.base_token_id
    );
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;