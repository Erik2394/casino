-- Fix missing columns - run ONCE
SET NAMES utf8mb4;

-- w_country: add 'country' and 'ranking'
ALTER TABLE `w_country`
  ADD COLUMN `country` VARCHAR(255) DEFAULT NULL AFTER `name`,
  ADD COLUMN `ranking` INT NOT NULL DEFAULT 0 AFTER `phone_code`;

-- w_currency: add 'currency' and 'ranking'
ALTER TABLE `w_currency`
  ADD COLUMN `currency` VARCHAR(100) DEFAULT NULL AFTER `name`,
  ADD COLUMN `ranking` INT NOT NULL DEFAULT 0 AFTER `rate`;

-- w_province: add 'country'
ALTER TABLE `w_province`
  ADD COLUMN `country` VARCHAR(100) DEFAULT NULL AFTER `country_id`;

-- w_users: add 'visitor_id'
ALTER TABLE `w_users`
  ADD COLUMN `visitor_id` VARCHAR(255) DEFAULT NULL AFTER `session`;

-- w_shops: add 'credit' and 'status'
ALTER TABLE `w_shops`
  ADD COLUMN `credit` DECIMAL(18,4) NOT NULL DEFAULT 0.0000 AFTER `balance`,
  ADD COLUMN `status` TINYINT(1) NOT NULL DEFAULT 1 AFTER `pending`;

-- Populate data from existing columns
UPDATE `w_country` SET `country` = `name` WHERE `country` IS NULL AND `name` IS NOT NULL;
UPDATE `w_currency` SET `currency` = `code` WHERE `currency` IS NULL AND `code` IS NOT NULL;
UPDATE `w_shops` SET `status` = CASE WHEN `is_blocked` = 1 THEN 0 ELSE 1 END;
