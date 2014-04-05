SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `aircraft_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `mfgr` varchar(30) DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `engineqty` tinyint(4) DEFAULT NULL,
  `enginetype` char(1) DEFAULT NULL,
  `weightclass` char(1) DEFAULT NULL,
  `descentrate` varchar(10) DEFAULT NULL,
  `serviceceiling` varchar(10) DEFAULT NULL,
  `cruisetas` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=764 ;

CREATE TABLE IF NOT EXISTS `airlines` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `icao` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `radio` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `icao` (`icao`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1073 ;

CREATE TABLE IF NOT EXISTS `airports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icao` varchar(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `alt` int(10) DEFAULT NULL,
  `iata` varchar(4) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `iso` varchar(2) DEFAULT NULL,
  `FIR` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `icao` (`icao`),
  KEY `iso` (`iso`),
  KEY `FIR` (`FIR`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23900 ;

CREATE TABLE IF NOT EXISTS `atc` (
  `aid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) unsigned NOT NULL,
  `callsign` varchar(10) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `facility` tinyint(3) unsigned NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `cid` (`cid`),
  KEY `call` (`callsign`),
  KEY `start` (`start`),
  KEY `end` (`end`),
  KEY `fac` (`facility`),
  KEY `rate` (`rating`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1665157 ;

CREATE TABLE IF NOT EXISTS `exclude_pilots` (
  `cid` mediumint(9) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `flights` (
  `fid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `callsign` varchar(10) NOT NULL DEFAULT '',
  `carrier` varchar(10) DEFAULT NULL,
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dep` varchar(5) NOT NULL,
  `dep_iso` char(2) NOT NULL DEFAULT '',
  `arr` varchar(5) NOT NULL,
  `arr_iso` char(2) NOT NULL DEFAULT '',
  `route` varchar(600) NOT NULL,
  `rmks` varchar(256) NOT NULL,
  `alt` varchar(15) NOT NULL DEFAULT '0',
  `spd` smallint(5) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `acft` varchar(20) NOT NULL,
  `clean_acft` varchar(10) DEFAULT NULL,
  `time_dep` datetime DEFAULT NULL,
  `time_arr` datetime DEFAULT NULL,
  `last_lat` decimal(10,6) DEFAULT NULL,
  `last_lon` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `startdate` (`startdate`),
  KEY `cid` (`cid`),
  KEY `callsign` (`callsign`),
  KEY `dep` (`dep`),
  KEY `arr` (`arr`),
  KEY `dep_iso` (`dep_iso`),
  KEY `arr_iso` (`arr_iso`),
  KEY `state` (`state`),
  KEY `carrier` (`carrier`),
  KEY `time_dep` (`time_dep`),
  KEY `time_arr` (`time_arr`),
  KEY `NewIndex1` (`clean_acft`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11807811 ;

CREATE TABLE IF NOT EXISTS `isocodes` (
  `code` varchar(2) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `cleaned` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `pilots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131650 ;

CREATE TABLE IF NOT EXISTS `position` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updateid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lat` decimal(10,6) DEFAULT NULL,
  `lon` decimal(10,6) DEFAULT NULL,
  `alt` varchar(6) DEFAULT NULL,
  `gs` smallint(5) unsigned DEFAULT NULL,
  `hdg` smallint(5) unsigned DEFAULT NULL,
  `groundelev` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `update` (`updateid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=449657793 ;

CREATE TABLE IF NOT EXISTS `ratings` (
  `rid` tinyint(3) unsigned NOT NULL,
  `short` varchar(5) DEFAULT NULL,
  `long` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `registrations` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(5) NOT NULL,
  `iso` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=209 ;

CREATE TABLE IF NOT EXISTS `routes` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dep` varchar(4) DEFAULT NULL,
  `arr` varchar(4) DEFAULT NULL,
  `rte` text,
  PRIMARY KEY (`rid`),
  KEY `dep` (`dep`,`arr`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3161686 ;

CREATE TABLE IF NOT EXISTS `route_segs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `seq` smallint(5) unsigned DEFAULT NULL,
  `ident` varchar(50) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lon` decimal(10,6) DEFAULT NULL,
  `via` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `freq` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41228826 ;

CREATE TABLE IF NOT EXISTS `servers` (
  `path` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `updates` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1334966 ;
