ALTER TABLE `zt_project` 
ADD `template` char(30) NOT NULL AFTER `catID`,
ADD `category` varchar(20) COLLATE 'utf8_general_ci' NOT NULL DEFAULT 'single' AFTER `type`,
ADD `program` mediumint(8) NOT NULL DEFAULT '0' AFTER `category`,
ADD `budget` varchar(30) NOT NULL DEFAULT '0' AFTER `program`,
ADD `budgetUnit` char(30) NOT NULL  DEFAULT 'yuan' AFTER `budget`,
ADD `percent` float unsigned NOT NULL DEFAULT '0' AFTER `budgetUnit`,
ADD `privway` char(30) NOT NULL AFTER `percent`,
ADD `milestone` enum('0','1') NOT NULL default '0' AFTER `percent`,
ADD `attribute` varchar(30) NOT NULL DEFAULT '' AFTER `budgetUnit`,
ADD `realStarted` date NOT NULL AFTER `end`,
ADD `realFinished` date NOT NULL AFTER `realStarted`,
ADD `version` smallint(6) NOT NULL AFTER `desc`,
ADD `parentVersion` smallint(6) NOT NULL AFTER `version`,
ADD `planDuration` int(11) NOT NULL AFTER `parentVersion`,
ADD `realDuration` int(11) NOT NULL AFTER `planDuration`,
ADD `output` text NOT NULL AFTER `milestone`;

ALTER TABLE `zt_product` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_task` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_doc` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_story` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_repo` ADD `program` varchar(255) NOT NULL AFTER `id`;
ALTER TABLE `zt_bug` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_case` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_testtask` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_testreport` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_testsuite` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_build` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;
ALTER TABLE `zt_release` ADD `program` mediumint(8) unsigned NOT NULL AFTER `id`;

INSERT INTO `zt_group` (`name`, `role`, `desc`) VALUES ('项目管理员', 'pgmadmin', '项目管理员可以维护项目的权限');

ALTER TABLE `zt_usergroup` ADD `program` text NOT NULL;

ALTER TABLE `zt_userview` ADD `programs` mediumtext COLLATE 'utf8_general_ci' NOT NULL AFTER `account`;

ALTER TABLE `zt_user` ADD `type` char(30) NOT NULL AFTER `account`;

CREATE TABLE `zt_stage` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `percent` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `zt_stage` (`name`,`percent`,`type`,`createdBy`,`createdDate`,`editedBy`,`editedDate`,`deleted`) VALUES 
('需求','10','request','admin','2020-02-08 21:08:30','admin','2020-02-12 13:50:27','0'),
('设计','10','design','admin','2020-02-08 21:08:30','admin','2020-02-12 13:50:27','0'), 
('开发','50','dev','admin','2020-02-08 21:08:30','admin','2020-02-12 13:50:27','0'),
('测试','15','qa','admin','2020-02-08 21:08:30','admin','2020-02-12 13:50:27','0'), 
('发布','10','release','admin','2020-02-08 21:08:30','admin','2020-02-12 13:50:27','0'),
('总结评审','5','review','admin','2020-02-08 21:08:45','admin','2020-02-12 13:50:27','0');