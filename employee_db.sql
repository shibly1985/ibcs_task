/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : employee_db

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 03/07/2021 09:50:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bank_account_infos
-- ----------------------------
DROP TABLE IF EXISTS `bank_account_infos`;
CREATE TABLE `bank_account_infos`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ledger_id` int(11) NOT NULL,
  `bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` enum('savings','current') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank_account_infos
-- ----------------------------
INSERT INTO `bank_account_infos` VALUES (1, 1, 'BBL', 'Banani', 'IBCS Primax', 'current', '4349783804722323', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (2, 2, 'BBL', 'Banani', 'Franklin Pierce', 'savings', '4349783804722324', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (3, 3, 'BBL', 'Banani', 'Andrew Johnson', 'savings', '4349783804722325', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (4, 4, 'BBL', 'Banani', 'John Adams', 'savings', '4349783804722326', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (5, 5, 'BBL', 'Banani', 'Thomas Jefferson', 'savings', '4349783804722327', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (6, 6, 'BBL', 'Banani', 'James Madison', 'savings', '4349788804722324', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (7, 7, 'BBL', 'Banani', 'James Monroe', 'savings', '4349983804722324', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (8, 8, 'BBL', 'Banani', 'John Quincy Adams', 'savings', '43246212343214312', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (9, 9, 'BBL', 'Banani', 'Andrew Jackson', 'savings', '43282212343214312', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (10, 10, 'BBL', 'Banani', 'Martin Van Buren', 'savings', '4349783604722326', NULL, NULL);
INSERT INTO `bank_account_infos` VALUES (11, 11, 'BBL', 'Banani', 'Millard Fillmore', 'savings', '4349383804722327', NULL, NULL);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_info_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (1, 1747, 'Franklin Pierce', 'abc', '01789654321', 2, 1, '2021-07-03 09:29:21', NULL);
INSERT INTO `employees` VALUES (2, 7042, 'Andrew Johnson', 'abc', '01789654322', 3, 2, '2021-07-03 09:30:16', NULL);
INSERT INTO `employees` VALUES (3, 7881, 'John Adams', 'abc', '01913884094', 4, 3, '2021-07-03 09:32:54', NULL);
INSERT INTO `employees` VALUES (4, 9495, 'Thomas Jefferson', 'abc', '01913884099', 5, 3, '2021-07-03 09:33:41', NULL);
INSERT INTO `employees` VALUES (5, 8603, 'James Madison', 'abc', '01913886092', 6, 4, '2021-07-03 09:34:11', NULL);
INSERT INTO `employees` VALUES (6, 3090, 'James Monroe', 'abc', '01913484092', 7, 4, '2021-07-03 09:34:42', NULL);
INSERT INTO `employees` VALUES (7, 1072, 'John Quincy Adams', 'abc', '01913884692', 8, 5, '2021-07-03 09:41:54', NULL);
INSERT INTO `employees` VALUES (8, 4654, 'Andrew Jackson', 'abc', '01711207221', 9, 5, '2021-07-03 09:42:34', NULL);
INSERT INTO `employees` VALUES (9, 8319, 'Martin Van Buren', 'abc', '1755677011', 10, 6, '2021-07-03 09:43:30', NULL);
INSERT INTO `employees` VALUES (10, 6312, 'Millard Fillmore', 'abc', '01789654322', 11, 6, '2021-07-03 09:44:07', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for grades
-- ----------------------------
DROP TABLE IF EXISTS `grades`;
CREATE TABLE `grades`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `basic_salary` decimal(10, 2) NULL DEFAULT NULL,
  `gross_salary` decimal(10, 2) NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grades
-- ----------------------------
INSERT INTO `grades` VALUES (1, 'A', 'Sr. Manager', 70000.00, 94500.00, 1, '2021-07-03 09:26:03', NULL);
INSERT INTO `grades` VALUES (2, 'B', 'Manager', 65000.00, 87750.00, 1, '2021-07-03 09:26:23', NULL);
INSERT INTO `grades` VALUES (3, 'C', 'Deputy Manager', 60000.00, 81000.00, 1, '2021-07-03 09:26:43', NULL);
INSERT INTO `grades` VALUES (4, 'D', 'Sr. Executive', 55000.00, 74250.00, 1, '2021-07-03 09:27:03', NULL);
INSERT INTO `grades` VALUES (5, 'E', 'Executive', 50000.00, 67500.00, 1, '2021-07-03 09:27:24', NULL);
INSERT INTO `grades` VALUES (6, 'F', 'Jr. Executive', 45000.00, 60750.00, 1, '2021-07-03 09:27:41', NULL);

-- ----------------------------
-- Table structure for ledgers
-- ----------------------------
DROP TABLE IF EXISTS `ledgers`;
CREATE TABLE `ledgers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NULL DEFAULT NULL,
  `company_id` int(11) NULL DEFAULT NULL,
  `opening_balance` double(8, 2) NULL DEFAULT NULL,
  `debit` double(8, 2) NULL DEFAULT NULL,
  `credit` double(8, 2) NULL DEFAULT NULL,
  `current_balance` double(10, 2) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledgers
-- ----------------------------
INSERT INTO `ledgers` VALUES (1, NULL, 777777, 900000.00, 60750.00, 0.00, 150750.00, '2021-07-03 09:23:07', NULL);
INSERT INTO `ledgers` VALUES (2, 1, NULL, 0.00, 0.00, 94500.00, 94500.00, '2021-07-03 09:29:21', NULL);
INSERT INTO `ledgers` VALUES (3, 2, NULL, 0.00, 0.00, 87750.00, 87750.00, '2021-07-03 09:30:17', NULL);
INSERT INTO `ledgers` VALUES (4, 3, NULL, 0.00, 0.00, 81000.00, 81000.00, '2021-07-03 09:32:54', NULL);
INSERT INTO `ledgers` VALUES (5, 4, NULL, 0.00, 0.00, 81000.00, 81000.00, '2021-07-03 09:33:41', NULL);
INSERT INTO `ledgers` VALUES (6, 5, NULL, 0.00, 0.00, 74250.00, 74250.00, '2021-07-03 09:34:11', NULL);
INSERT INTO `ledgers` VALUES (7, 6, NULL, 0.00, 0.00, 74250.00, 74250.00, '2021-07-03 09:34:42', NULL);
INSERT INTO `ledgers` VALUES (8, 7, NULL, 0.00, 0.00, 67500.00, 67500.00, '2021-07-03 09:41:54', NULL);
INSERT INTO `ledgers` VALUES (9, 8, NULL, 0.00, 0.00, 67500.00, 67500.00, '2021-07-03 09:42:34', NULL);
INSERT INTO `ledgers` VALUES (10, 9, NULL, 0.00, 0.00, 60750.00, 60750.00, '2021-07-03 09:43:30', NULL);
INSERT INTO `ledgers` VALUES (11, 10, NULL, 0.00, 0.00, 60750.00, 60750.00, '2021-07-03 09:44:07', NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (3, '2020_04_25_062633_create_tasks_table', 1);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tasks_created_by_foreign`(`created_by`) USING BTREE,
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, 'Cum qui qui maiores omnis.', 'Suscipit voluptatem culpa sequi deleniti ut corrupti ab.', 7, '2021-07-01 12:20:44', '2021-07-01 12:20:44');
INSERT INTO `tasks` VALUES (2, 'Esse consequatur eveniet distinctio.', 'Eos accusantium quas quibusdam et distinctio facere placeat.', 6, '2021-07-01 12:20:44', '2021-07-01 12:20:44');
INSERT INTO `tasks` VALUES (3, 'Quidem et maiores est aut consequatur ea saepe.', 'Sed ipsam accusantium sit reprehenderit.', 6, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (4, 'Sit impedit dolorum non commodi dolorum quasi.', 'Sunt quaerat aliquam eos sint quis aperiam nam.', 3, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (5, 'Omnis et dolores adipisci officia temporibus sequi.', 'Nobis optio autem eius rem ipsam officia.', 7, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (6, 'Fugiat blanditiis ea praesentium voluptatem.', 'Perferendis facilis unde ab.', 9, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (7, 'Ea eum id non ut et.', 'Corporis culpa tenetur et occaecati voluptatibus.', 7, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (8, 'Exercitationem voluptas mollitia sint velit eos.', 'Sunt qui qui explicabo deleniti voluptas.', 5, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (9, 'Distinctio ea nostrum totam cumque id.', 'Nihil est consectetur ut dolor nostrum iusto.', 4, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (10, 'Corrupti adipisci magnam sit exercitationem veniam et dignissimos.', 'Nulla et facilis necessitatibus quae.', 5, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (11, 'Tempora repudiandae illum quia.', 'Adipisci dolor possimus in consectetur doloremque consequatur.', 10, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (12, 'Qui itaque est aut.', 'Ut velit rerum et quod possimus.', 10, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (13, 'Facere nobis accusamus sit et sed et fuga.', 'Qui in aut quae quia repellendus.', 8, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (14, 'In omnis omnis qui enim.', 'Qui velit est et omnis ratione reiciendis facere esse.', 6, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (15, 'Corrupti harum quisquam id fugiat nemo eius sed et.', 'Dignissimos amet aut inventore nulla vel velit.', 2, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (16, 'Nulla est enim omnis earum occaecati ipsa.', 'Dolorem officiis harum est et consequuntur culpa.', 3, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (17, 'Autem sunt cupiditate ut ipsum.', 'Repellat placeat est exercitationem dolor minus.', 7, '2021-07-01 12:20:45', '2021-07-01 12:20:45');
INSERT INTO `tasks` VALUES (18, 'Distinctio magnam occaecati minima laudantium velit maiores quos.', 'Perspiciatis possimus quia modi.', 10, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (19, 'Omnis id omnis rerum architecto ipsam rem.', 'Aut suscipit cupiditate ut itaque ipsa earum voluptas minima.', 1, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (20, 'Nostrum aut ut cupiditate perspiciatis voluptatem.', 'Voluptate eaque et maiores eveniet a aut debitis.', 2, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (21, 'Est veritatis aut vel repellat ea molestiae.', 'Quia pariatur et maiores perferendis.', 7, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (22, 'Architecto quia reprehenderit cumque veritatis omnis ut.', 'Et eum aperiam delectus repudiandae similique facere.', 6, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (23, 'Minima sequi facilis debitis.', 'Est cum ea debitis debitis dolor cumque voluptatem illo.', 8, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (24, 'Aperiam libero asperiores repellat mollitia quo aut.', 'Culpa quia est aut cumque illum ullam.', 4, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (25, 'Veritatis quidem laboriosam laborum et.', 'Omnis provident blanditiis unde rerum maxime culpa dolor.', 6, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (26, 'Delectus veritatis est qui vero vero.', 'Est sunt non in id soluta nam ea.', 2, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (27, 'Mollitia voluptas et sapiente nam.', 'Explicabo cum temporibus iusto.', 2, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (28, 'Nihil dolores quia quae dolorem iusto aliquam.', 'Sint est aut illo.', 3, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (29, 'In quia adipisci vitae et dolorum voluptatum quo.', 'Delectus illum provident pariatur in.', 9, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (30, 'Vero voluptas voluptatem est quo labore.', 'Expedita beatae vitae unde odio tempora quia.', 10, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (31, 'Aliquid aliquid dolores dolor neque commodi.', 'Ab expedita occaecati harum quod eos quidem ea iusto.', 3, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (32, 'Ratione quod tenetur vitae animi incidunt non consequatur et.', 'Totam debitis voluptas ut voluptatem qui et.', 7, '2021-07-01 12:20:46', '2021-07-01 12:20:46');
INSERT INTO `tasks` VALUES (33, 'Sint aperiam cumque a consequatur.', 'Aut amet quo quaerat in occaecati.', 2, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (34, 'Voluptatibus quod fuga quod amet.', 'Eum incidunt labore sunt est.', 6, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (35, 'Hic veritatis voluptatem eos hic voluptas quia dicta.', 'Qui ipsa exercitationem similique omnis tempore ut.', 3, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (36, 'Tempore asperiores eaque sit aut repudiandae.', 'Rem magnam et eius debitis exercitationem.', 7, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (37, 'Veniam eveniet soluta sit minima quia illo iusto voluptate.', 'Voluptas optio qui eos eos atque ut.', 4, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (38, 'Distinctio veritatis non voluptate.', 'Repellat quis architecto nihil enim id et illo.', 9, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (39, 'Nulla temporibus et sunt quam.', 'Culpa et dolorem eos aliquid vitae.', 8, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (40, 'Et quam alias rerum ratione corporis aspernatur minus sed.', 'Et quia molestiae fugiat debitis voluptas soluta provident.', 2, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (41, 'Nisi tempore magni dolores quas aut numquam.', 'Vero aliquam maxime est ex ut dolor.', 10, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (42, 'Velit qui et ea aut.', 'Sit ea rerum fugit sed sed.', 5, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (43, 'In corporis illo quis perferendis.', 'Sunt corporis minus eos sed ut recusandae ipsum nesciunt.', 1, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (44, 'Quidem sequi impedit ab debitis nemo.', 'Ipsa quae sunt quibusdam ut necessitatibus dolor ut.', 8, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (45, 'Nisi quasi quidem sint.', 'Iste sed natus quia inventore nostrum.', 4, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (46, 'Deleniti ab quisquam nobis perferendis temporibus.', 'Quos deleniti qui magni.', 1, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (47, 'Et error excepturi vel quaerat.', 'Debitis rerum voluptate facere qui omnis aut.', 6, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (48, 'Et nulla laudantium error eum beatae.', 'Molestiae facilis necessitatibus deserunt ratione ut ipsum eos eos.', 1, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (49, 'Facilis et minima vitae omnis.', 'Odit non neque esse aut quam.', 3, '2021-07-01 12:20:47', '2021-07-01 12:20:47');
INSERT INTO `tasks` VALUES (50, 'Et eum possimus libero et omnis distinctio beatae ipsum.', 'Facere aut ad quisquam laborum consequuntur eum fugit ea.', 5, '2021-07-01 12:20:47', '2021-07-01 12:20:47');

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ledger_id` int(11) NOT NULL,
  `debit` double(8, 2) NULL DEFAULT NULL,
  `credit` double(8, 2) NULL DEFAULT NULL,
  `status` enum('debit','credit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transactions
-- ----------------------------
INSERT INTO `transactions` VALUES (1, 1, 0.00, 900000.00, 'credit', '2021-07-03 09:23:07', '2021-07-03 09:24:13');
INSERT INTO `transactions` VALUES (2, 2, NULL, 94500.00, 'credit', '2021-07-03 09:47:58', NULL);
INSERT INTO `transactions` VALUES (3, 1, 94500.00, NULL, 'debit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (4, 3, NULL, 87750.00, 'credit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (5, 1, 87750.00, NULL, 'debit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (6, 4, NULL, 81000.00, 'credit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (7, 1, 81000.00, NULL, 'debit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (8, 5, NULL, 81000.00, 'credit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (9, 1, 81000.00, NULL, 'debit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (10, 6, NULL, 74250.00, 'credit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (11, 1, 74250.00, NULL, 'debit', '2021-07-03 09:47:59', NULL);
INSERT INTO `transactions` VALUES (12, 7, NULL, 74250.00, 'credit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (13, 1, 74250.00, NULL, 'debit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (14, 8, NULL, 67500.00, 'credit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (15, 1, 67500.00, NULL, 'debit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (16, 9, NULL, 67500.00, 'credit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (17, 1, 67500.00, NULL, 'debit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (18, 10, NULL, 60750.00, 'credit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (19, 1, 60750.00, NULL, 'debit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (20, 11, NULL, 60750.00, 'credit', '2021-07-03 09:48:00', NULL);
INSERT INTO `transactions` VALUES (21, 1, 60750.00, NULL, 'debit', '2021-07-03 09:48:01', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Lisa Lubowitz', 'tdonnelly@example.net', '2021-07-01 12:20:35', '$2y$10$Bm72byLa2NblwFLcoj6eP.JatVGeldVRE9dPPlXTiYulepkd1FaIK', '4XoMYhyr0C', '2021-07-01 12:20:36', '2021-07-01 12:20:36');
INSERT INTO `users` VALUES (2, 'Rudy Hagenes', 'walter.elvis@example.net', '2021-07-01 12:20:36', '$2y$10$Gxt4.Sz/AIWbbHCTSzBj7ub9ySZj2LCGPn1Bsc3h.uJ3hIVoBDNnG', 'RubHJcPLrE', '2021-07-01 12:20:36', '2021-07-01 12:20:36');
INSERT INTO `users` VALUES (3, 'Magali Funk', 'samanta.sauer@example.org', '2021-07-01 12:20:36', '$2y$10$jaGFdG6qCcAQjgtbaGnIpe0zQfkP765SgikBdWsJeIdhKnyJ9WPtW', 'qNb5vvPxo3', '2021-07-01 12:20:37', '2021-07-01 12:20:37');
INSERT INTO `users` VALUES (4, 'Dr. Sandrine Kiehn V', 'talon27@example.net', '2021-07-01 12:20:36', '$2y$10$Z5mqvIXcVN5JvC8BcVNuT.pL4BAbXwN3cRyh57rulJVAZyZaV2jre', '0xHxq2Fpx6', '2021-07-01 12:20:37', '2021-07-01 12:20:37');
INSERT INTO `users` VALUES (5, 'Prof. Giovanna Feil', 'stanton.leda@example.com', '2021-07-01 12:20:36', '$2y$10$gdZnygMKFtfD.zBWJc65NOS22JtTxGiB2Ye6z9clg/R7GxPLX5pQe', 'cF1v1D3rKE', '2021-07-01 12:20:37', '2021-07-01 12:20:37');
INSERT INTO `users` VALUES (6, 'Rae Bartell', 'uharris@example.net', '2021-07-01 12:20:36', '$2y$10$CMt1zCGQyLl2I2q1nWQLBeP8zzjpVhaT3x7cDez.COIK0JvuPqrQK', 'x3Ps9xs8ny', '2021-07-01 12:20:37', '2021-07-01 12:20:37');
INSERT INTO `users` VALUES (7, 'Georgianna Wolff', 'makenzie29@example.com', '2021-07-01 12:20:36', '$2y$10$J2vkihD1oa7Z2NWIi1jKAuyOZOwobH7ZbR.1QEXOJHuZWYrtLWCa.', 'pvUXVyHSen', '2021-07-01 12:20:37', '2021-07-01 12:20:37');
INSERT INTO `users` VALUES (8, 'Camilla Littel', 'camilla44@example.org', '2021-07-01 12:20:36', '$2y$10$wSLse.qC84ntFJgGNFF.peQS8vL4DESbFNBuPQPLxpl/CxKZRRo5q', 'RIrJkjEP5i', '2021-07-01 12:20:37', '2021-07-01 12:20:37');
INSERT INTO `users` VALUES (9, 'Carolyn Abbott', 'lveum@example.com', '2021-07-01 12:20:36', '$2y$10$APxU3vrNTnesaCH9CQaKzOHqg0/W40WzgzRBmUfU7QjowzP9NoWkC', 'pAKwLHujUs', '2021-07-01 12:20:37', '2021-07-01 12:20:37');
INSERT INTO `users` VALUES (10, 'Cordelia Dare', 'daniel.linda@example.org', '2021-07-01 12:20:36', '$2y$10$n2ZM.1/oNFj0QnbB0roYI.kl8zqEE6ERgarNovsbi.EGGzY8nzxLa', 'WbNusJvZt9', '2021-07-01 12:20:37', '2021-07-01 12:20:37');

SET FOREIGN_KEY_CHECKS = 1;
