-- xpm_citype definition

CREATE DATABASE IF NOT EXISTS `demo_palmyra` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `demo_palmyra`;

CREATE TABLE `xpm_citype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `table_name` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'default',
  `seq_format` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `seq_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `seq_field` int(11) DEFAULT NULL,
  `options` int(11) NOT NULL DEFAULT 0,
  `acl_type` smallint(6) NOT NULL DEFAULT 0,
  `changelog_type` smallint(6) NOT NULL DEFAULT 0,
  `changelog_table` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `select_query` varchar(2048) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `criteria` varchar(2048) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `sys_table` smallint(6) NOT NULL DEFAULT 0,
  `schema_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_xpm_citype_name` (`name`),
  UNIQUE KEY `uq_xpm_citype_table` (`table_name`,`schema_name`),
  UNIQUE KEY `uq_xpm_citype` (`name`,`schema_name`),
  UNIQUE KEY `uq_xpm_code` (`schema_name`,`code`)
) ENGINE=InnoDB;


-- xpm_user definition

CREATE TABLE `xpm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `random` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `next_password_change` timestamp NULL DEFAULT NULL,
  `last_password_change` timestamp NULL DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `locked` smallint(6) NOT NULL DEFAULT 0,
  `external_user` smallint(6) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `office_number` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `department` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT 'default-user.png',
  `home_page` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_xpm_user_login` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=103;


-- xpm_acl_sid definition

CREATE TABLE `xpm_acl_sid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_xpm_acl_sid_group` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5;

-- xpm_acl_user definition

CREATE TABLE `xpm_acl_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_xpm_acl_user` (`acl_id`,`user_id`)
) ENGINE=InnoDB ;


-- xpm_acl_citype definition

CREATE TABLE `xpm_acl_citype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acl_sid` int(11) NOT NULL,
  `ci_type` int(11) NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` smallint(6) DEFAULT NULL,
  `audit_success` smallint(6) DEFAULT NULL,
  `audit_failure` smallint(6) DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_Acl_Citype` (`acl_sid`,`ci_type`),
  KEY `fk_xpm_acl_ci_type_xpm_ci_type` (`ci_type`),
  CONSTRAINT `fk_xpm_acl_ci_type_xpm_acl_sid` FOREIGN KEY (`acl_sid`) REFERENCES `xpm_acl_sid` (`id`),
  CONSTRAINT `fk_xpm_acl_ci_type_xpm_ci_type` FOREIGN KEY (`ci_type`) REFERENCES `xpm_citype` (`id`)
) ENGINE=InnoDB ;


-- xpm_menu definition

CREATE TABLE `xpm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT 1,
  `name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'summary',
  `display_order` int(11) NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `criteria` varchar(300) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `category` smallint(6) DEFAULT 1,
  `external_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `ci_type` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ci_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_menu_Code_Action` (`code`,`action`),
  CONSTRAINT `FK_menu_parent` FOREIGN KEY (`parent`) REFERENCES `xpm_menu` (`id`)  
) ENGINE=InnoDB ;


-- xpm_acl_menu definition

CREATE TABLE `xpm_acl_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acl_sid` int(11) NOT NULL,
  `menu` int(11) NOT NULL,
  `mask` int(11) NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `granting` smallint(6) DEFAULT NULL,
  `audit_success` smallint(6) DEFAULT NULL,
  `audit_failure` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acl_menu_entry_acl_sid` (`acl_sid`),
  KEY `fk_acl_menu_entry_menu_def` (`menu`),
  CONSTRAINT `fk_acl_menu_entry_acl_sid` FOREIGN KEY (`acl_sid`) REFERENCES `xpm_acl_sid` (`id`),
  CONSTRAINT `fk_acl_menu_entry_menu_def` FOREIGN KEY (`menu`) REFERENCES `xpm_menu` (`id`)
) ENGINE=InnoDB ;


-- xpm_cifield definition

CREATE TABLE `xpm_cifield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citype` int(11) NOT NULL,
  `attribute` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `column_name` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `display_label` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `column_type` int(11) DEFAULT NULL,
  `formula` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `aggregate` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `column_length` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 999,
  `primary_key` smallint(6) DEFAULT 0,
  `mandatory` smallint(6) DEFAULT 0,
  `is_unique` smallint(6) NOT NULL DEFAULT 0,
  `default_value` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fkey_citype` int(11) DEFAULT NULL,
  `fkey_cifield` int(11) DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),  
  UNIQUE KEY `uq_cifield_attrib` (`citype`,`attribute`),
  UNIQUE KEY `uq_cifield_column` (`citype`,`column_name`),
  CONSTRAINT `fk_cifield_citid` FOREIGN KEY (`citype`) REFERENCES `xpm_citype` (`id`),
  CONSTRAINT `fk_cifield_fkey` FOREIGN KEY (`fkey_cifield`) REFERENCES `xpm_cifield` (`id`),
  CONSTRAINT `fk_cifield_related` FOREIGN KEY (`fkey_citype`) REFERENCES `xpm_citype` (`id`)
) ENGINE=InnoDB;


-- xpm_cifield_fkey definition

CREATE TABLE `xpm_cifield_fkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `cifield` int(11) NOT NULL,
  `fkey_field` int(11) NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `schema_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_xpm_cifield_fkey_name` (`key_name`,`cifield`),  
  CONSTRAINT `fk_fkey_cifield` FOREIGN KEY (`fkey_field`) REFERENCES `xpm_cifield` (`id`)
) ENGINE=InnoDB  ;


-- xpm_cifield_uqkey definition

CREATE TABLE `xpm_cifield_uqkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `cifield` int(11) NOT NULL,
  `citype` int(11) NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cifeld_uqkey` (`key_name`,`cifield`),
  CONSTRAINT `fk_uqkey_cifield` FOREIGN KEY (`cifield`) REFERENCES `xpm_cifield` (`id`),
  CONSTRAINT `fk_uqkey_citype` FOREIGN KEY (`citype`) REFERENCES `xpm_citype` (`id`)
) ENGINE=InnoDB ;


-- xpm_user_password_history definition

CREATE TABLE `xpm_user_password_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `random` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `changed_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_user_password_history` FOREIGN KEY (`user`) REFERENCES `xpm_user` (`id`)
) ENGINE=InnoDB ;


-- xpm_user_session definition

CREATE TABLE `xpm_user_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `failure_attempts` int(11) NOT NULL DEFAULT 0,
  `ip_address` int(11) NOT NULL DEFAULT 0,
  `host_name` int(11) NOT NULL DEFAULT 0,
  `cookie` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_session_user` FOREIGN KEY (`user`) REFERENCES `xpm_user` (`id`)
) ENGINE=InnoDB ;


-- xpm_session_history definition

CREATE TABLE `xpm_session_history` (
  `user` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `failure_attempts` int(11) NOT NULL DEFAULT 0,
  `ip_address` int(11) NOT NULL DEFAULT 0,
  `host_name` int(11) NOT NULL DEFAULT 0,
  `cookie` int(11) NOT NULL DEFAULT 0,
  `first_access` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login` timestamp NULL DEFAULT NULL,
  `logout` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `fk_session_user` (`user`),
  CONSTRAINT `fk_session_history_user` FOREIGN KEY (`user`) REFERENCES `xpm_user` (`id`)
) ENGINE=InnoDB ;

-- xpm_users_forgot_password definition

CREATE TABLE `xpm_users_forgot_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `ip_address` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_xpm_users_fo_xpm_users` FOREIGN KEY (`user`) REFERENCES `xpm_user` (`id`)
) ENGINE=InnoDB ;



-- xpm_attachment definition

CREATE TABLE `xpm_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciid` int(11) NOT NULL,
  `citid` int(11) NOT NULL,
  `filename` varchar(256) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fid` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `offset` int(11) DEFAULT NULL,
  `size` bigint(20) DEFAULT 0,
  `expiration` bigint(20) DEFAULT NULL,
  `time` timestamp NULL DEFAULT current_timestamp(),
  `path` varchar(1024) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remote_path` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `filetype` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tag` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` decimal(5,2) NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_upd_by` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_upd_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_unique_id` (`path`),
  UNIQUE KEY `fid` (`fid`),  
  CONSTRAINT `fk_attachment_cit_id` FOREIGN KEY (`citid`) REFERENCES `xpm_citype` (`id`)
) ENGINE=InnoDB ;



INSERT INTO `xpm_acl_sid` (`id`, `sid`, `description`, `active`, `created_by`, `last_upd_by`, `created_on`, `last_upd_on`) VALUES
	(1, 'admin', 'Admin', 1, 'admin', 'admin', '2020-04-07 21:22:47', '2020-04-07 22:03:13.312');
INSERT INTO `xpm_acl_sid` (`id`, `sid`, `description`, `active`, `created_by`, `last_upd_by`, `created_on`, `last_upd_on`) VALUES
	(2, 'user', 'User', 1, 'admin', 'admin', '2020-04-07 21:22:47', '2020-04-07 22:03:13.312');

INSERT INTO `xpm_user` (`id`, `login_name`, `random`, `password`, `next_password_change`, `last_password_change`, `active`, `locked`, `external_user`, `last_login`, `name`, `first_name`, `last_name`, `mobile_number`, `office_number`, `email`, `department`, `icon`, `home_page`, `created_by`, `last_upd_by`, `created_on`, `last_upd_on`) VALUES
	(100, 'admin', 'pisJSiAc9nCKeBr0Ei4eVlf3cAX87OS0MpkvbTRbAnrmEZo9UIDHVION1MitIATraUJCSGTRGaVJpMs0qcj0D5WtccxopjW3qrHUfZDJnzLfpA1L30wCjG0gcMijxFM3', '8474d299fcd5fc50ccb66ece84e8c05a6a9a97f03444b2e7ec3e7a16d218ce84b4cbaa0d735f3eb7824ad42ee392d4c2a7fc1e5ac7c4eb10dec829858d226036', '2020-02-21 01:45:22', '2020-01-01 01:45:07', 1, 0, 0, NULL, 'admin', 'admin', 'k', NULL, NULL, 'admin@sd.com', NULL, 'default-user.png', NULL, 'admin', 'admin', '2020-01-27 01:44:25', '2020-01-27 01:44:29'),
	(101, 'user', 'pisJSiAc9nCKeBr0Ei4eVlf3cAX87OS0MpkvbTRbAnrmEZo9UIDHVION1MitIATraUJCSGTRGaVJpMs0qcj0D5WtccxopjW3qrHUfZDJnzLfpA1L30wCjG0gcMijxFM3', '8474d299fcd5fc50ccb66ece84e8c05a6a9a97f03444b2e7ec3e7a16d218ce84b4cbaa0d735f3eb7824ad42ee392d4c2a7fc1e5ac7c4eb10dec829858d226036', '2020-02-21 01:45:22', '2020-01-01 01:45:07', 1, 0, 0, '2020-02-02 06:08:22', 'user', 'user', 'kser', NULL, NULL, 'user@sd.com', NULL, 'default-user.png', NULL, 'admin', 'admin', '2020-01-27 01:44:25', '2020-02-09 10:44:42.712');


INSERT INTO `xpm_acl_user` (`id`, `acl_id`, `user_id`, `active`, `created_by`, `last_upd_by`, `created_on`, `last_upd_on`) VALUES
	(1, 1, 100, 1, 'admin', 'admin', '2020-04-07 21:22:47', '2020-04-07 21:22:47'),
	(2, 1, 101, 1, 'admin', 'admin', '2020-04-07 00:00:00', '2020-04-07 21:58:00.837666');

