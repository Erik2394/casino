-- ============================================================================
-- Casino Platform - Complete Database Schema
-- Generated from Laravel Eloquent Models
-- Table prefix: w_
-- Engine: InnoDB, Charset: utf8mb4, Collation: utf8mb4_unicode_ci
-- ============================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================================
-- CORE TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_shops
-- Model: App\Shop
-- ----------------------------
DROP TABLE IF EXISTS `w_shops`;
CREATE TABLE `w_shops` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `percent` INT NOT NULL DEFAULT 90,
  `frontend` VARCHAR(255) DEFAULT NULL,
  `currency` VARCHAR(10) DEFAULT '',
  `is_blocked` TINYINT(1) NOT NULL DEFAULT 0,
  `orderby` VARCHAR(20) NOT NULL DEFAULT 'AZ',
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `pending` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_shops_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_users
-- Model: App\User
-- ----------------------------
DROP TABLE IF EXISTS `w_users`;
CREATE TABLE `w_users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) DEFAULT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) DEFAULT NULL,
  `last_name` VARCHAR(255) DEFAULT NULL,
  `birthday` DATETIME DEFAULT NULL,
  `avatar` VARCHAR(255) DEFAULT NULL,
  `balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `last_login` DATETIME DEFAULT NULL,
  `confirmation_token` VARCHAR(255) DEFAULT NULL,
  `status` VARCHAR(50) NOT NULL DEFAULT 'Active',
  `wager` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `rating` INT NOT NULL DEFAULT 0,
  `points` INT NOT NULL DEFAULT 0,
  `total_balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `bonus` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `count_bonus` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `total_in` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `total_out` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `language` VARCHAR(10) DEFAULT NULL,
  `remember_token` VARCHAR(100) DEFAULT NULL,
  `role_id` INT UNSIGNED NOT NULL DEFAULT 1,
  `count_balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `count_return` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `parent_id` BIGINT UNSIGNED DEFAULT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `currency` VARCHAR(10) DEFAULT NULL,
  `phone` VARCHAR(50) DEFAULT NULL,
  `country` VARCHAR(100) DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `city` VARCHAR(100) DEFAULT NULL,
  `postalCode` VARCHAR(20) DEFAULT NULL,
  `session` VARCHAR(255) DEFAULT NULL,
  `max_deposit` DECIMAL(18,4) DEFAULT NULL,
  `province` VARCHAR(100) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_users_username` (`username`),
  KEY `idx_users_role_id` (`role_id`),
  KEY `idx_users_shop_id` (`shop_id`),
  KEY `idx_users_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_games
-- Model: App\Game
-- ----------------------------
DROP TABLE IF EXISTS `w_games`;
CREATE TABLE `w_games` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) DEFAULT NULL,
  `order_no` INT DEFAULT 0,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `gamebank` VARCHAR(50) DEFAULT 'slots',
  `percent` INT NOT NULL DEFAULT 90,
  `original_id` INT DEFAULT NULL,
  `jpg_id` INT DEFAULT NULL,
  `label` VARCHAR(50) DEFAULT NULL,
  `garant_win1` INT NOT NULL DEFAULT 10,
  `garant_win3` INT NOT NULL DEFAULT 10,
  `garant_win5` INT NOT NULL DEFAULT 10,
  `garant_win7` INT NOT NULL DEFAULT 10,
  `garant_win9` INT NOT NULL DEFAULT 10,
  `garant_win10` INT NOT NULL DEFAULT 10,
  `garant_bonus1` INT NOT NULL DEFAULT 100,
  `garant_bonus3` INT NOT NULL DEFAULT 100,
  `garant_bonus5` INT NOT NULL DEFAULT 100,
  `garant_bonus7` INT NOT NULL DEFAULT 100,
  `garant_bonus9` INT NOT NULL DEFAULT 100,
  `garant_bonus10` INT NOT NULL DEFAULT 100,
  `rezerv` INT NOT NULL DEFAULT 2,
  `winline1` INT NOT NULL DEFAULT 10,
  `winline3` INT NOT NULL DEFAULT 10,
  `winline5` INT NOT NULL DEFAULT 10,
  `winline7` INT NOT NULL DEFAULT 10,
  `winline9` INT NOT NULL DEFAULT 10,
  `winline10` INT NOT NULL DEFAULT 10,
  `winbonus1` INT NOT NULL DEFAULT 100,
  `winbonus3` INT NOT NULL DEFAULT 100,
  `winbonus5` INT NOT NULL DEFAULT 100,
  `winbonus7` INT NOT NULL DEFAULT 100,
  `winbonus9` INT NOT NULL DEFAULT 100,
  `winbonus10` INT NOT NULL DEFAULT 100,
  `device` INT NOT NULL DEFAULT 1,
  `cask` INT NOT NULL DEFAULT 9,
  `advanced` TEXT DEFAULT NULL,
  `garant_win_bonus1` INT NOT NULL DEFAULT 10,
  `garant_win_bonus3` INT NOT NULL DEFAULT 10,
  `garant_win_bonus5` INT NOT NULL DEFAULT 10,
  `garant_win_bonus7` INT NOT NULL DEFAULT 10,
  `garant_win_bonus9` INT NOT NULL DEFAULT 10,
  `garant_win_bonus10` INT NOT NULL DEFAULT 10,
  `winline_bonus1` INT NOT NULL DEFAULT 10,
  `winline_bonus3` INT NOT NULL DEFAULT 10,
  `winline_bonus5` INT NOT NULL DEFAULT 10,
  `winline_bonus7` INT NOT NULL DEFAULT 10,
  `winline_bonus9` INT NOT NULL DEFAULT 10,
  `winline_bonus10` INT NOT NULL DEFAULT 10,
  `view` INT NOT NULL DEFAULT 1,
  `bids` VARCHAR(255) DEFAULT NULL,
  `gameline` INT DEFAULT NULL,
  `monitor` INT DEFAULT NULL,
  `bet` VARCHAR(500) DEFAULT '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 90, 100',
  `denomination` VARCHAR(20) DEFAULT '1.00',
  `scaleMode` VARCHAR(50) DEFAULT NULL,
  `numFloat` INT DEFAULT NULL,
  `slotViewState` VARCHAR(50) DEFAULT NULL,
  `stat_in` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `stat_out` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `ReelsMath` TEXT DEFAULT NULL,
  `in_game` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `in_jpg` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `in_jps` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `profit` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `rtp` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_games_shop_id` (`shop_id`),
  KEY `idx_games_name` (`name`),
  KEY `idx_games_original_id` (`original_id`),
  KEY `idx_games_jpg_id` (`jpg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_categories
-- Model: App\Category
-- ----------------------------
DROP TABLE IF EXISTS `w_categories`;
CREATE TABLE `w_categories` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `parent` INT NOT NULL DEFAULT 0,
  `position` INT NOT NULL DEFAULT 0,
  `href` VARCHAR(255) DEFAULT NULL,
  `wager_percent` INT NOT NULL DEFAULT 100,
  `original_id` INT DEFAULT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_categories_parent` (`parent`),
  KEY `idx_categories_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_currency
-- Model: App\Currency
-- ----------------------------
DROP TABLE IF EXISTS `w_currency`;
CREATE TABLE `w_currency` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) DEFAULT NULL,
  `code` VARCHAR(10) DEFAULT NULL,
  `symbol` VARCHAR(10) DEFAULT NULL,
  `rate` DECIMAL(12,6) DEFAULT 1.000000,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_country
-- Model: App\Country
-- ----------------------------
DROP TABLE IF EXISTS `w_country`;
CREATE TABLE `w_country` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) DEFAULT NULL,
  `code` VARCHAR(10) DEFAULT NULL,
  `phone_code` VARCHAR(10) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_province
-- Model: App\Province
-- ----------------------------
DROP TABLE IF EXISTS `w_province`;
CREATE TABLE `w_province` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) DEFAULT NULL,
  `code` VARCHAR(10) DEFAULT NULL,
  `country_id` INT DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_province_country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- API & INTEGRATION TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_apis
-- Model: App\Api
-- ----------------------------
DROP TABLE IF EXISTS `w_apis`;
CREATE TABLE `w_apis` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `keygen` VARCHAR(255) DEFAULT NULL,
  `ip` VARCHAR(255) DEFAULT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_apis_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_api_games
-- Model: App\ApiGames
-- ----------------------------
DROP TABLE IF EXISTS `w_api_games`;
CREATE TABLE `w_api_games` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `category` VARCHAR(255) DEFAULT NULL,
  `subcategory` VARCHAR(255) DEFAULT NULL,
  `new` TINYINT(1) NOT NULL DEFAULT 0,
  `system` VARCHAR(255) DEFAULT NULL,
  `position` INT NOT NULL DEFAULT 0,
  `type` VARCHAR(100) DEFAULT NULL,
  `image` VARCHAR(500) DEFAULT NULL,
  `image_preview` VARCHAR(500) DEFAULT NULL,
  `image_filled` VARCHAR(500) DEFAULT NULL,
  `mobile` TINYINT(1) NOT NULL DEFAULT 0,
  `play_for_fun_supported` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_api_games_game_id` (`game_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_api_tokens
-- Model: App\Services\Auth\Api\Token
-- ----------------------------
DROP TABLE IF EXISTS `w_api_tokens`;
CREATE TABLE `w_api_tokens` (
  `id` VARCHAR(255) NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `ip_address` VARCHAR(45) DEFAULT NULL,
  `user_agent` TEXT DEFAULT NULL,
  `expires_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_api_tokens_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- GAME-RELATED TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_game_categories
-- Model: App\GameCategory
-- ----------------------------
DROP TABLE IF EXISTS `w_game_categories`;
CREATE TABLE `w_game_categories` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` BIGINT UNSIGNED NOT NULL,
  `category_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_game_categories_game_id` (`game_id`),
  KEY `idx_game_categories_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_game_bank
-- Model: App\GameBank
-- ----------------------------
DROP TABLE IF EXISTS `w_game_bank`;
CREATE TABLE `w_game_bank` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `slots` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `little` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `table_bank` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `fish` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `bonus` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_game_bank_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_game_win
-- Model: App\GameWin
-- ----------------------------
DROP TABLE IF EXISTS `w_game_win`;
CREATE TABLE `w_game_win` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT NOT NULL DEFAULT 0,
  `winline1` INT NOT NULL DEFAULT 0,
  `winline3` INT NOT NULL DEFAULT 0,
  `winline5` INT NOT NULL DEFAULT 0,
  `winline7` INT NOT NULL DEFAULT 0,
  `winline9` INT NOT NULL DEFAULT 0,
  `winline10` INT NOT NULL DEFAULT 0,
  `winbonus1` INT NOT NULL DEFAULT 0,
  `winbonus3` INT NOT NULL DEFAULT 0,
  `winbonus5` INT NOT NULL DEFAULT 0,
  `winbonus7` INT NOT NULL DEFAULT 0,
  `winbonus9` INT NOT NULL DEFAULT 0,
  `winbonus10` INT NOT NULL DEFAULT 0,
  `winline_bonus1` INT NOT NULL DEFAULT 0,
  `winline_bonus3` INT NOT NULL DEFAULT 0,
  `winline_bonus5` INT NOT NULL DEFAULT 0,
  `winline_bonus7` INT NOT NULL DEFAULT 0,
  `winline_bonus9` INT NOT NULL DEFAULT 0,
  `winline_bonus10` INT NOT NULL DEFAULT 0,
  `winbonus_bonus1` INT NOT NULL DEFAULT 0,
  `winbonus_bonus3` INT NOT NULL DEFAULT 0,
  `winbonus_bonus5` INT NOT NULL DEFAULT 0,
  `winbonus_bonus7` INT NOT NULL DEFAULT 0,
  `winbonus_bonus9` INT NOT NULL DEFAULT 0,
  `winbonus_bonus10` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_game_win_game_id` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_game_log
-- Model: App\GameLog
-- ----------------------------
DROP TABLE IF EXISTS `w_game_log`;
CREATE TABLE `w_game_log` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `time` DATETIME DEFAULT NULL,
  `game_id` INT DEFAULT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `ip` VARCHAR(45) DEFAULT NULL,
  `str` TEXT DEFAULT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_game_log_user_id` (`user_id`),
  KEY `idx_game_log_game_id` (`game_id`),
  KEY `idx_game_log_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_games_activity
-- Model: App\GameActivity
-- ----------------------------
DROP TABLE IF EXISTS `w_games_activity`;
CREATE TABLE `w_games_activity` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game` VARCHAR(255) DEFAULT NULL,
  `number` INT NOT NULL DEFAULT 0,
  `max_win` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `max_bet` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_games_activity_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_stat_game
-- Model: App\StatGame
-- ----------------------------
DROP TABLE IF EXISTS `w_stat_game`;
CREATE TABLE `w_stat_game` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME DEFAULT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `bet` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `win` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `game` VARCHAR(255) DEFAULT NULL,
  `denomination` VARCHAR(20) DEFAULT NULL,
  `percent` DECIMAL(10,4) NOT NULL DEFAULT 0.0000,
  `percent_jps` DECIMAL(10,4) NOT NULL DEFAULT 0.0000,
  `percent_jpg` DECIMAL(10,4) NOT NULL DEFAULT 0.0000,
  `profit` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `game_bank` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `jack_balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_stat_game_user_id` (`user_id`),
  KEY `idx_stat_game_shop_id` (`shop_id`),
  KEY `idx_stat_game_date_time` (`date_time`),
  KEY `idx_stat_game_game` (`game`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_bots_games
-- Model: App\BotGame
-- ----------------------------
DROP TABLE IF EXISTS `w_bots_games`;
CREATE TABLE `w_bots_games` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT DEFAULT NULL,
  `device` INT NOT NULL DEFAULT 1,
  `login` VARCHAR(255) DEFAULT NULL,
  `bet` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `win` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `date_time` DATETIME DEFAULT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_bots_games_game_id` (`game_id`),
  KEY `idx_bots_games_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- SHOP-RELATED TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_shop_categories
-- Model: App\ShopCategory
-- ----------------------------
DROP TABLE IF EXISTS `w_shop_categories`;
CREATE TABLE `w_shop_categories` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` BIGINT UNSIGNED NOT NULL,
  `category_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_shop_categories_shop_id` (`shop_id`),
  KEY `idx_shop_categories_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_shops_user
-- Model: App\ShopUser
-- ----------------------------
DROP TABLE IF EXISTS `w_shops_user`;
CREATE TABLE `w_shops_user` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` BIGINT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_shops_user_shop_id` (`shop_id`),
  KEY `idx_shops_user_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_shops_stat
-- Model: App\ShopStat
-- ----------------------------
DROP TABLE IF EXISTS `w_shops_stat`;
CREATE TABLE `w_shops_stat` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` BIGINT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `type` VARCHAR(50) DEFAULT NULL,
  `sum` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `date_time` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_shops_stat_shop_id` (`shop_id`),
  KEY `idx_shops_stat_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- JACKPOT TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_jackpots
-- Model: App\Jackpot (JPS - Jackpot Per Shop)
-- ----------------------------
DROP TABLE IF EXISTS `w_jackpots`;
CREATE TABLE `w_jackpots` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `pay_sum` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `start_balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `percent` DECIMAL(5,2) NOT NULL DEFAULT 0.10,
  `view` TINYINT(1) NOT NULL DEFAULT 1,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_jackpots_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_jpg
-- Model: App\JPG (Jackpot Per Game)
-- ----------------------------
DROP TABLE IF EXISTS `w_jpg`;
CREATE TABLE `w_jpg` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `pay_sum` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `start_balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `percent` DECIMAL(5,2) NOT NULL DEFAULT 0.10,
  `view` TINYINT(1) NOT NULL DEFAULT 1,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_jpg_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_jackpots_stat
-- Model: App\JackpotStat
-- ----------------------------
DROP TABLE IF EXISTS `w_jackpots_stat`;
CREATE TABLE `w_jackpots_stat` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `system` VARCHAR(255) DEFAULT NULL,
  `jackpot_id` INT DEFAULT NULL,
  `type` VARCHAR(50) DEFAULT NULL,
  `summ` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`id`),
  KEY `idx_jackpots_stat_user_id` (`user_id`),
  KEY `idx_jackpots_stat_jackpot_id` (`jackpot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- FINANCIAL / TRANSACTION TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_transactions
-- Model: App\Transaction
-- ----------------------------
DROP TABLE IF EXISTS `w_transactions`;
CREATE TABLE `w_transactions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `payeer_id` BIGINT UNSIGNED DEFAULT NULL,
  `system` VARCHAR(255) DEFAULT NULL,
  `value` VARCHAR(255) DEFAULT NULL,
  `type` VARCHAR(50) DEFAULT NULL,
  `summ` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `email` VARCHAR(255) DEFAULT NULL,
  `phone` VARCHAR(50) DEFAULT NULL,
  `ip` VARCHAR(45) DEFAULT NULL,
  `transaction` VARCHAR(255) DEFAULT NULL,
  `status` INT NOT NULL DEFAULT 0,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_transactions_user_id` (`user_id`),
  KEY `idx_transactions_payeer_id` (`payeer_id`),
  KEY `idx_transactions_shop_id` (`shop_id`),
  KEY `idx_transactions_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_payments
-- Model: App\Payment
-- ----------------------------
DROP TABLE IF EXISTS `w_payments`;
CREATE TABLE `w_payments` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `summ` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `status` INT NOT NULL DEFAULT 0,
  `system` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_payments_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_coinpayment_transactions
-- Model: App\CoinpaymentTransactions
-- ----------------------------
DROP TABLE IF EXISTS `w_coinpayment_transactions`;
CREATE TABLE `w_coinpayment_transactions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `txn_id` VARCHAR(255) DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `amount` DECIMAL(18,8) NOT NULL DEFAULT 0.00000000,
  `amountf` VARCHAR(50) DEFAULT NULL,
  `coin` VARCHAR(20) DEFAULT NULL,
  `confirms_needed` INT NOT NULL DEFAULT 0,
  `payment_address` VARCHAR(255) DEFAULT NULL,
  `qrcode_url` VARCHAR(500) DEFAULT NULL,
  `received` DECIMAL(18,8) NOT NULL DEFAULT 0.00000000,
  `receivedf` VARCHAR(50) DEFAULT NULL,
  `recv_confirms` INT NOT NULL DEFAULT 0,
  `status` INT NOT NULL DEFAULT 0,
  `status_text` VARCHAR(255) DEFAULT NULL,
  `status_url` VARCHAR(500) DEFAULT NULL,
  `timeout` INT DEFAULT NULL,
  `type` VARCHAR(50) DEFAULT NULL,
  `payload` TEXT DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_coinpayment_txn_id` (`txn_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_bank_stat
-- Model: App\BankStat
-- ----------------------------
DROP TABLE IF EXISTS `w_bank_stat`;
CREATE TABLE `w_bank_stat` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) DEFAULT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `type` VARCHAR(50) DEFAULT NULL,
  `sum` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `old` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `new` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bank_stat_user_id` (`user_id`),
  KEY `idx_bank_stat_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- BONUS & PROMOTIONS TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_bonus
-- Model: App\Bonus
-- ----------------------------
DROP TABLE IF EXISTS `w_bonus`;
CREATE TABLE `w_bonus` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `deposit_num` INT NOT NULL DEFAULT 0,
  `deposit` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `bonus` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_bonus_log
-- Model: App\BonusLog
-- ----------------------------
DROP TABLE IF EXISTS `w_bonus_log`;
CREATE TABLE `w_bonus_log` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `deposit_num` INT NOT NULL DEFAULT 0,
  `deposit` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `bonus` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `wager_time` INT NOT NULL DEFAULT 0,
  `wager` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `wager_played` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bonus_log_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_bonus_preset
-- Model: App\BonusPreset
-- ----------------------------
DROP TABLE IF EXISTS `w_bonus_preset`;
CREATE TABLE `w_bonus_preset` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) DEFAULT NULL,
  `value` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_bonus_conditions
-- Model: App\BonusCondition
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_bonus_conditions`;
CREATE TABLE `w_bonus_conditions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type` INT NOT NULL DEFAULT 0,
  `valid_from` DATETIME DEFAULT NULL,
  `valid_until` DATETIME DEFAULT NULL,
  `is_mon` TINYINT(1) NOT NULL DEFAULT 1,
  `is_tue` TINYINT(1) NOT NULL DEFAULT 1,
  `is_wed` TINYINT(1) NOT NULL DEFAULT 1,
  `is_thr` TINYINT(1) NOT NULL DEFAULT 1,
  `is_fri` TINYINT(1) NOT NULL DEFAULT 1,
  `is_sat` TINYINT(1) NOT NULL DEFAULT 1,
  `is_sun` TINYINT(1) NOT NULL DEFAULT 1,
  `deposit_min` INT DEFAULT NULL,
  `deposit_max` INT DEFAULT NULL,
  `match_win` INT DEFAULT NULL,
  `code` VARCHAR(255) DEFAULT NULL,
  `wagering` INT DEFAULT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_bonus_types
-- Model: App\BonusType
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_bonus_types`;
CREATE TABLE `w_bonus_types` (
  `type` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  UNIQUE KEY `uk_bonus_types_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_happyhours
-- Model: App\HappyHour
-- ----------------------------
DROP TABLE IF EXISTS `w_happyhours`;
CREATE TABLE `w_happyhours` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `multiplier` VARCHAR(10) NOT NULL DEFAULT 'x2',
  `wager` VARCHAR(10) NOT NULL DEFAULT 'x2',
  `time` INT NOT NULL DEFAULT 0,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_happyhours_shop_id` (`shop_id`),
  KEY `idx_happyhours_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_points
-- Model: App\Point
-- ----------------------------
DROP TABLE IF EXISTS `w_points`;
CREATE TABLE `w_points` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL DEFAULT 0,
  `name` VARCHAR(255) DEFAULT NULL,
  `sum` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `bonus` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `img` VARCHAR(255) DEFAULT NULL,
  `pay` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `exchange` VARCHAR(255) DEFAULT NULL,
  `title` VARCHAR(255) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_points_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_return
-- Model: App\Returns
-- ----------------------------
DROP TABLE IF EXISTS `w_return`;
CREATE TABLE `w_return` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `min_pay` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `max_pay` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `percent` INT NOT NULL DEFAULT 1,
  `min_balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_return_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_welcomepackages
-- Model: App\WelcomePackage
-- ----------------------------
DROP TABLE IF EXISTS `w_welcomepackages`;
CREATE TABLE `w_welcomepackages` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `day` INT NOT NULL DEFAULT 1,
  `freespin` INT NOT NULL DEFAULT 0,
  `game_id` INT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_welcomepackage_log
-- Model: App\WelcomePackageLog
-- ----------------------------
DROP TABLE IF EXISTS `w_welcomepackage_log`;
CREATE TABLE `w_welcomepackage_log` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `day` INT NOT NULL DEFAULT 0,
  `freespin` INT NOT NULL DEFAULT 0,
  `remain_freespin` INT NOT NULL DEFAULT 0,
  `game_id` INT DEFAULT NULL,
  `max_bonus` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `win` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `wager` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `wager_played` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `started_at` DATETIME DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_welcomepackage_log_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_freespinround
-- Model: App\Freespinround
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_freespinround`;
CREATE TABLE `w_freespinround` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `players` VARCHAR(255) NOT NULL DEFAULT '',
  `games` VARCHAR(255) NOT NULL DEFAULT '',
  `apigames` VARCHAR(255) NOT NULL DEFAULT '',
  `free_rounds` FLOAT NOT NULL DEFAULT 0,
  `bet_type` VARCHAR(10) NOT NULL DEFAULT 'mid',
  `valid_from` DATE DEFAULT NULL,
  `valid_to` DATE DEFAULT NULL,
  `notify` INT NOT NULL DEFAULT 0,
  `active` INT NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- USER & SESSION TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_sessions
-- Model: App\Session
-- ----------------------------
DROP TABLE IF EXISTS `w_sessions`;
CREATE TABLE `w_sessions` (
  `id` VARCHAR(255) NOT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `ip_address` VARCHAR(45) DEFAULT NULL,
  `user_agent` TEXT DEFAULT NULL,
  `payload` TEXT NOT NULL,
  `last_activity` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_subsessions
-- Model: App\Subsession
-- ----------------------------
DROP TABLE IF EXISTS `w_subsessions`;
CREATE TABLE `w_subsessions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `subsession` VARCHAR(255) DEFAULT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_subsessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_user_activity
-- Model: App\UserActivity / App\Services\Logging\UserActivity\Activity
-- ----------------------------
DROP TABLE IF EXISTS `w_user_activity`;
CREATE TABLE `w_user_activity` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` TEXT DEFAULT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `ip_address` VARCHAR(45) DEFAULT NULL,
  `user_agent` VARCHAR(500) DEFAULT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_activity_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_open_shift
-- Model: App\OpenShift
-- ----------------------------
DROP TABLE IF EXISTS `w_open_shift`;
CREATE TABLE `w_open_shift` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `balance` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `balance_in` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `balance_out` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `users` INT NOT NULL DEFAULT 0,
  `money_in` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `money_out` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `old_banks` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `last_banks` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `last_returns` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `start_date` DATETIME DEFAULT NULL,
  `end_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_open_shift_user_id` (`user_id`),
  KEY `idx_open_shift_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_password_resets
-- Model: App\PasswordReset
-- ----------------------------
DROP TABLE IF EXISTS `w_password_resets`;
CREATE TABLE `w_password_resets` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `token` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_password_resets_email` (`email`(191)),
  KEY `idx_password_resets_token` (`token`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_pincodes
-- Model: App\Pincode
-- ----------------------------
DROP TABLE IF EXISTS `w_pincodes`;
CREATE TABLE `w_pincodes` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(255) NOT NULL,
  `nominal` DECIMAL(18,4) NOT NULL DEFAULT 0.0000,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 0,
  `shop_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `activated_at` DATETIME DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pincodes_user_id` (`user_id`),
  KEY `idx_pincodes_shop_id` (`shop_id`),
  KEY `idx_pincodes_code` (`code`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- INFORMATION & CONTENT TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_info
-- Model: App\Info
-- ----------------------------
DROP TABLE IF EXISTS `w_info`;
CREATE TABLE `w_info` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `link` VARCHAR(255) DEFAULT NULL,
  `title` VARCHAR(255) DEFAULT NULL,
  `text` LONGTEXT DEFAULT NULL,
  `roles` VARCHAR(255) DEFAULT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_info_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_info_shop
-- Model: App\InfoShop
-- ----------------------------
DROP TABLE IF EXISTS `w_info_shop`;
CREATE TABLE `w_info_shop` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `info_id` BIGINT UNSIGNED NOT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_info_shop_info_id` (`info_id`),
  KEY `idx_info_shop_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_notifications
-- Model: App\Notifications
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_notifications`;
CREATE TABLE `w_notifications` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(255) NOT NULL DEFAULT '',
  `image` VARCHAR(255) NOT NULL DEFAULT '',
  `campaign` INT NOT NULL DEFAULT 0,
  `notify_date` DATE NOT NULL,
  `notify_time` TIME NOT NULL,
  `timezone` VARCHAR(255) NOT NULL DEFAULT '',
  `frequency` VARCHAR(255) NOT NULL,
  `active` INT NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- AUTHORIZATION & ROLES TABLES (Laravel Roles package)
-- ============================================================================

-- ----------------------------
-- Table: w_roles
-- Model: App\Role (extends jeremykenedy\LaravelRoles\Models\Role)
-- ----------------------------
DROP TABLE IF EXISTS `w_roles`;
CREATE TABLE `w_roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `level` INT NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_roles_slug` (`slug`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_permissions
-- Model: App\Permission
-- ----------------------------
DROP TABLE IF EXISTS `w_permissions`;
CREATE TABLE `w_permissions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `display_name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `removable` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_permissions_name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_role_user (pivot - Laravel Roles package)
-- ----------------------------
DROP TABLE IF EXISTS `w_role_user`;
CREATE TABLE `w_role_user` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` INT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_user_role_id` (`role_id`),
  KEY `idx_role_user_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_permission_role (pivot - Laravel Roles package)
-- ----------------------------
DROP TABLE IF EXISTS `w_permission_role`;
CREATE TABLE `w_permission_role` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` INT UNSIGNED NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_permission_role_permission_id` (`permission_id`),
  KEY `idx_permission_role_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_permission_user (pivot - Laravel Roles package)
-- ----------------------------
DROP TABLE IF EXISTS `w_permission_user`;
CREATE TABLE `w_permission_user` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` INT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_permission_user_permission_id` (`permission_id`),
  KEY `idx_permission_user_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- API USER & SESSION TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_user_registration_api
-- Model: App\UsersRegistrationApi
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_user_registration_api`;
CREATE TABLE `w_user_registration_api` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT DEFAULT NULL,
  `password` VARCHAR(255) DEFAULT NULL,
  `username` VARCHAR(255) DEFAULT NULL,
  `currency` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_registration_api_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_user_gamesession_id
-- Model: App\UserGamesessionID
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_user_gamesession_id`;
CREATE TABLE `w_user_gamesession_id` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT DEFAULT NULL,
  `session_id` VARCHAR(255) DEFAULT NULL,
  `game_id` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_gamesession_id_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_user_games_log
-- Model: App\UserGamesLog
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_user_games_log`;
CREATE TABLE `w_user_games_log` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT DEFAULT NULL,
  `session_id` VARCHAR(255) DEFAULT NULL,
  `game_id` VARCHAR(255) DEFAULT NULL,
  `transaction_id` VARCHAR(255) DEFAULT NULL,
  `amount` INT DEFAULT NULL,
  `no_money_left` INT DEFAULT NULL,
  `there_was_money` INT DEFAULT NULL,
  `remote_id` VARCHAR(255) DEFAULT NULL,
  `provider` VARCHAR(255) DEFAULT NULL,
  `original_session_id` VARCHAR(255) DEFAULT NULL,
  `action` VARCHAR(255) DEFAULT NULL,
  `status` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_games_log_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_user_funs
-- Model: App\UserFun
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_user_funs`;
CREATE TABLE `w_user_funs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) DEFAULT NULL,
  `visitor_id` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- VERIFICATION & SECURITY TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_verifies
-- Model: App\Verify
-- Migration-based schema
-- ----------------------------
DROP TABLE IF EXISTS `w_verifies`;
CREATE TABLE `w_verifies` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT DEFAULT NULL,
  `id_img` VARCHAR(255) DEFAULT NULL,
  `address_img` VARCHAR(255) DEFAULT NULL,
  `verified` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_verifies_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- TASK & LOGGING TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_tasks
-- Model: App\Task
-- ----------------------------
DROP TABLE IF EXISTS `w_tasks`;
CREATE TABLE `w_tasks` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(255) DEFAULT NULL,
  `user_id` BIGINT UNSIGNED DEFAULT NULL,
  `action` VARCHAR(255) DEFAULT NULL,
  `item_id` INT DEFAULT NULL,
  `details` TEXT DEFAULT NULL,
  `ip_address` VARCHAR(45) DEFAULT NULL,
  `user_agent` VARCHAR(500) DEFAULT NULL,
  `finished` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tasks_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- LARAVEL FRAMEWORK TABLES
-- ============================================================================

-- ----------------------------
-- Table: w_migrations (Laravel migrations tracker)
-- ----------------------------
DROP TABLE IF EXISTS `w_migrations`;
CREATE TABLE `w_migrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_failed_jobs (Laravel failed jobs)
-- ----------------------------
DROP TABLE IF EXISTS `w_failed_jobs`;
CREATE TABLE `w_failed_jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table: w_jobs (Laravel jobs queue)
-- ----------------------------
DROP TABLE IF EXISTS `w_jobs`;
CREATE TABLE `w_jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` VARCHAR(255) NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `attempts` TINYINT UNSIGNED NOT NULL,
  `reserved_at` INT UNSIGNED DEFAULT NULL,
  `available_at` INT UNSIGNED NOT NULL,
  `created_at` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jobs_queue` (`queue`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================================
-- SETTINGS TABLE (referenced by SettingsController)
-- ============================================================================

-- ----------------------------
-- Table: w_settings
-- ----------------------------
DROP TABLE IF EXISTS `w_settings`;
CREATE TABLE `w_settings` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(255) NOT NULL,
  `value` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_settings_key` (`key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================
