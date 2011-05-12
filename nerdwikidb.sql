-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 12, 2011 at 07:26 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nerdwikidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `nw_archive`
--

DROP TABLE IF EXISTS `nw_archive`;
CREATE TABLE IF NOT EXISTS `nw_archive` (
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` tinyblob NOT NULL,
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varbinary(255) NOT NULL,
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned DEFAULT NULL,
  `ar_text_id` int(10) unsigned DEFAULT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_archive`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_category`
--

DROP TABLE IF EXISTS `nw_category`;
CREATE TABLE IF NOT EXISTS `nw_category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  `cat_hidden` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1 ;

--
-- Dumping data for table `nw_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_categorylinks`
--

DROP TABLE IF EXISTS `nw_categorylinks`;
CREATE TABLE IF NOT EXISTS `nw_categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(70) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_categorylinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_change_tag`
--

DROP TABLE IF EXISTS `nw_change_tag`;
CREATE TABLE IF NOT EXISTS `nw_change_tag` (
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(11) DEFAULT NULL,
  `ct_rev_id` int(11) DEFAULT NULL,
  `ct_tag` varbinary(255) NOT NULL,
  `ct_params` blob,
  UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_change_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_externallinks`
--

DROP TABLE IF EXISTS `nw_externallinks`;
CREATE TABLE IF NOT EXISTS `nw_externallinks` (
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_externallinks`
--

INSERT INTO `nw_externallinks` (`el_from`, `el_to`, `el_index`) VALUES
(4, 0x687474703a2f2f776f726470726573732e6f72672f6c61746573742e7461722e677a, 0x687474703a2f2f6f72672e776f726470726573732e2f6c61746573742e7461722e677a),
(3, 0x687474703a2f2f7777772e706f696e746c65737372616e74732e636f6d2f323030392f30352f696e7374616c6c696e672d616e642d636f6e6669677572696e672d697263642d6879627269642d6f6e2d7562756e74752d3930342f, 0x687474703a2f2f636f6d2e706f696e746c65737372616e74732e7777772e2f323030392f30352f696e7374616c6c696e672d616e642d636f6e6669677572696e672d697263642d6879627269642d6f6e2d7562756e74752d3930342f),
(2, 0x687474703a2f2f7777772e65676768656c702e6f72672f7573696e672e68746d, 0x687474703a2f2f6f72672e65676768656c702e7777772e2f7573696e672e68746d),
(7, 0x687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e3034, 0x687474703a2f2f6f72672e6d6564696177696b692e7777772e2f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e3034),
(7, 0x687474703a2f2f6c6f652e6f72672f6c6f676f2e706e67, 0x687474703a2f2f6f72672e6c6f652e2f6c6f676f2e706e67),
(4, 0x687474703a2f2f636f6465782e776f726470726573732e6f72672f4d6f76696e675f576f72645072657373, 0x687474703a2f2f6f72672e776f726470726573732e636f6465782e2f4d6f76696e675f576f72645072657373),
(4, 0x687474703a2f2f636f6465782e776f726470726573732e6f72672f4261636b696e675f55705f596f75725f4461746162617365, 0x687474703a2f2f6f72672e776f726470726573732e636f6465782e2f4261636b696e675f55705f596f75725f4461746162617365),
(4, 0x687474703a2f2f636f6465782e776f726470726573732e6f72672f526573746f72696e675f596f75725f44617461626173655f46726f6d5f4261636b7570, 0x687474703a2f2f6f72672e776f726470726573732e636f6465782e2f526573746f72696e675f596f75725f44617461626173655f46726f6d5f4261636b7570),
(4, 0x687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d27, 0x687474703a2f2f636f6d272e6f6c642d646f6d61696e2e7777772e2f),
(4, 0x687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d27, 0x687474703a2f2f636f6d272e6e65772d646f6d61696e2e7777772e2f),
(4, 0x687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c27687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d27, 0x687474703a2f2f636f6d272c27687474702e6f6c642d646f6d61696e2e7777772e2f2f7777772e6e65772d646f6d61696e2e636f6d27),
(5, 0x687474703a2f2f6c65616775656f666576696c2e6f72672f6e6572642f3f703d333334, 0x687474703a2f2f6f72672e6c65616775656f666576696c2e2f6e6572642f3f703d333334),
(5, 0x687474703a2f2f7777772e64656269616e2d61646d696e697374726174696f6e2e6f72672f61727469636c65732f313532, 0x687474703a2f2f6f72672e64656269616e2d61646d696e697374726174696f6e2e7777772e2f61727469636c65732f313532),
(9, 0x687474703a2f2f6b6970706f2e676f6f676c65636f64652e636f6d2f73766e2f7472756e6b2f, 0x687474703a2f2f636f6d2e676f6f676c65636f64652e6b6970706f2e2f73766e2f7472756e6b2f),
(8, 0x687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a, 0x687474703a2f2f6f72672e6b65726e656c2e2f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a);

-- --------------------------------------------------------

--
-- Table structure for table `nw_filearchive`
--

DROP TABLE IF EXISTS `nw_filearchive`;
CREATE TABLE IF NOT EXISTS `nw_filearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` blob,
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(32) DEFAULT 'unknown',
  `fa_description` tinyblob,
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varbinary(255) DEFAULT NULL,
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1 ;

--
-- Dumping data for table `nw_filearchive`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_hitcounter`
--

DROP TABLE IF EXISTS `nw_hitcounter`;
CREATE TABLE IF NOT EXISTS `nw_hitcounter` (
  `hc_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 MAX_ROWS=25000;

--
-- Dumping data for table `nw_hitcounter`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_image`
--

DROP TABLE IF EXISTS `nw_image`;
CREATE TABLE IF NOT EXISTS `nw_image` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(32) NOT NULL DEFAULT 'unknown',
  `img_description` tinyblob NOT NULL,
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varbinary(255) NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_imagelinks`
--

DROP TABLE IF EXISTS `nw_imagelinks`;
CREATE TABLE IF NOT EXISTS `nw_imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  UNIQUE KEY `il_to` (`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_imagelinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_interwiki`
--

DROP TABLE IF EXISTS `nw_interwiki`;
CREATE TABLE IF NOT EXISTS `nw_interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_interwiki`
--

INSERT INTO `nw_interwiki` (`iw_prefix`, `iw_url`, `iw_local`, `iw_trans`) VALUES
('acronym', 0x687474703a2f2f7777772e6163726f6e796d66696e6465722e636f6d2f61662d71756572792e6173703f537472696e673d6578616374264163726f6e796d3d2431, 0, 0),
('advogato', 0x687474703a2f2f7777772e6164766f6761746f2e6f72672f2431, 0, 0),
('annotationwiki', 0x687474703a2f2f7777772e7365656477696b692e636f6d2f706167652e63666d3f77696b6969643d33363826646f633d2431, 0, 0),
('arxiv', 0x687474703a2f2f7777772e61727869762e6f72672f6162732f2431, 0, 0),
('c2find', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f46696e64506167652676616c75653d2431, 0, 0),
('cache', 0x687474703a2f2f7777772e676f6f676c652e636f6d2f7365617263683f713d63616368653a2431, 0, 0),
('commons', 0x687474703a2f2f636f6d6d6f6e732e77696b696d656469612e6f72672f77696b692f2431, 0, 0),
('corpknowpedia', 0x687474703a2f2f636f72706b6e6f7770656469612e6f72672f77696b692f696e6465782e7068702f2431, 0, 0),
('dictionary', 0x687474703a2f2f7777772e646963742e6f72672f62696e2f446963743f44617461626173653d2a26466f726d3d44696374312653747261746567793d2a2651756572793d2431, 0, 0),
('disinfopedia', 0x687474703a2f2f7777772e646973696e666f70656469612e6f72672f77696b692e7068746d6c3f7469746c653d2431, 0, 0),
('docbook', 0x687474703a2f2f77696b692e646f63626f6f6b2e6f72672f746f7069632f2431, 0, 0),
('doi', 0x687474703a2f2f64782e646f692e6f72672f2431, 0, 0),
('drumcorpswiki', 0x687474703a2f2f7777772e6472756d636f72707377696b692e636f6d2f696e6465782e7068702f2431, 0, 0),
('dwjwiki', 0x687474703a2f2f7777772e737562657269632e6e65742f6367692d62696e2f64776a2f77696b692e6367693f2431, 0, 0),
('elibre', 0x687474703a2f2f656e6369636c6f70656469612e75732e65732f696e6465782e7068702f2431, 0, 0),
('emacswiki', 0x687474703a2f2f7777772e656d61637377696b692e6f72672f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('foldoc', 0x687474703a2f2f666f6c646f632e6f72672f3f2431, 0, 0),
('foxwiki', 0x687474703a2f2f666f782e77696b69732e636f6d2f77632e646c6c3f57696b697e2431, 0, 0),
('freebsdman', 0x687474703a2f2f7777772e467265654253442e6f72672f6367692f6d616e2e6367693f6170726f706f733d312671756572793d2431, 0, 0),
('gej', 0x687474703a2f2f7777772e6573706572616e746f2e64652f6367692d62696e2f616b746976696b696f2f77696b692e706c3f2431, 0, 0),
('gentoo-wiki', 0x687474703a2f2f67656e746f6f2d77696b692e636f6d2f2431, 0, 0),
('google', 0x687474703a2f2f7777772e676f6f676c652e636f6d2f7365617263683f713d2431, 0, 0),
('googlegroups', 0x687474703a2f2f67726f7570732e676f6f676c652e636f6d2f67726f7570733f713d2431, 0, 0),
('hammondwiki', 0x687474703a2f2f7777772e64616972696b692e6f72672f48616d6d6f6e6457696b692f2431, 0, 0),
('hewikisource', 0x687474703a2f2f68652e77696b69736f757263652e6f72672f77696b692f2431, 1, 0),
('hrwiki', 0x687474703a2f2f7777772e687277696b692e6f72672f696e6465782e7068702f2431, 0, 0),
('imdb', 0x687474703a2f2f75732e696d64622e636f6d2f5469746c653f2431, 0, 0),
('jargonfile', 0x687474703a2f2f73756e69722e6f72672f617070732f6d6574612e706c3f77696b693d4a6172676f6e46696c652672656469726563743d2431, 0, 0),
('jspwiki', 0x687474703a2f2f7777772e6a737077696b692e6f72672f77696b692f2431, 0, 0),
('keiki', 0x687474703a2f2f6b65692e6b692f656e2f2431, 0, 0),
('kmwiki', 0x687474703a2f2f6b6d77696b692e77696b697370616365732e636f6d2f2431, 0, 0),
('linuxwiki', 0x687474703a2f2f6c696e757877696b692e64652f2431, 0, 0),
('lojban', 0x687474703a2f2f7777772e6c6f6a62616e2e6f72672f74696b692f74696b692d696e6465782e7068703f706167653d2431, 0, 0),
('lqwiki', 0x687474703a2f2f77696b692e6c696e75787175657374696f6e732e6f72672f77696b692f2431, 0, 0),
('lugkr', 0x687474703a2f2f6c75672d6b722e736f75726365666f7267652e6e65742f6367692d62696e2f6c756777696b692e706c3f2431, 0, 0),
('mathsongswiki', 0x687474703a2f2f5365656457696b692e636f6d2f706167652e63666d3f77696b6969643d32333726646f633d2431, 0, 0),
('meatball', 0x687474703a2f2f7777772e7573656d6f642e636f6d2f6367692d62696e2f6d622e706c3f2431, 0, 0),
('mediawikiwiki', 0x687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f2431, 0, 0),
('mediazilla', 0x687474703a2f2f6275677a696c6c612e77696b6970656469612e6f72672f2431, 1, 0),
('memoryalpha', 0x687474703a2f2f7777772e6d656d6f72792d616c7068612e6f72672f656e2f696e6465782e7068702f2431, 0, 0),
('metawiki', 0x687474703a2f2f73756e69722e6f72672f617070732f6d6574612e706c3f2431, 0, 0),
('metawikipedia', 0x687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f2431, 0, 0),
('moinmoin', 0x687474703a2f2f7075726c2e6e65742f77696b692f6d6f696e2f2431, 0, 0),
('mozillawiki', 0x687474703a2f2f77696b692e6d6f7a696c6c612e6f72672f696e6465782e7068702f2431, 0, 0),
('oeis', 0x687474703a2f2f7777772e72657365617263682e6174742e636f6d2f6367692d62696e2f6163636573732e6367692f61732f6e6a61732f73657175656e6365732f656973412e6367693f416e756d3d2431, 0, 0),
('openfacts', 0x687474703a2f2f6f70656e66616374732e6265726c696f732e64652f696e6465782e7068746d6c3f7469746c653d2431, 0, 0),
('openwiki', 0x687474703a2f2f6f70656e77696b692e636f6d2f3f2431, 0, 0),
('patwiki', 0x687474703a2f2f67617573732e666669692e6f72672f2431, 0, 0),
('pmeg', 0x687474703a2f2f7777772e62657274696c6f772e636f6d2f706d65672f24312e706870, 0, 0),
('ppr', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f2431, 0, 0),
('pythoninfo', 0x687474703a2f2f77696b692e707974686f6e2e6f72672f6d6f696e2f2431, 0, 0),
('rfc', 0x687474703a2f2f7777772e7266632d656469746f722e6f72672f7266632f72666324312e747874, 0, 0),
('s23wiki', 0x687474703a2f2f69732d726f6f742e64652f77696b692f696e6465782e7068702f2431, 0, 0),
('seattlewiki', 0x687474703a2f2f73656174746c652e77696b69612e636f6d2f77696b692f2431, 0, 0),
('seattlewireless', 0x687474703a2f2f73656174746c65776972656c6573732e6e65742f3f2431, 0, 0),
('senseislibrary', 0x687474703a2f2f73656e736569732e786d702e6e65742f3f2431, 0, 0),
('slashdot', 0x687474703a2f2f736c617368646f742e6f72672f61727469636c652e706c3f7369643d2431, 0, 0),
('sourceforge', 0x687474703a2f2f736f75726365666f7267652e6e65742f2431, 0, 0),
('squeak', 0x687474703a2f2f77696b692e73717565616b2e6f72672f73717565616b2f2431, 0, 0),
('susning', 0x687474703a2f2f7777772e7375736e696e672e6e752f2431, 0, 0),
('svgwiki', 0x687474703a2f2f77696b692e7376672e6f72672f2431, 0, 0),
('tavi', 0x687474703a2f2f746176692e736f75726365666f7267652e6e65742f2431, 0, 0),
('tejo', 0x687474703a2f2f7777772e74656a6f2e6f72672f76696b696f2f2431, 0, 0),
('theopedia', 0x687474703a2f2f7777772e7468656f70656469612e636f6d2f2431, 0, 0),
('tmbw', 0x687474703a2f2f7777772e746d62772e6e65742f77696b692f2431, 0, 0),
('tmnet', 0x687474703a2f2f7777772e746563686e6f6d616e69666573746f732e6e65742f3f2431, 0, 0),
('tmwiki', 0x687474703a2f2f7777772e45617379546f7069634d6170732e636f6d2f3f706167653d2431, 0, 0),
('twiki', 0x687474703a2f2f7477696b692e6f72672f6367692d62696e2f766965772f2431, 0, 0),
('uea', 0x687474703a2f2f7777772e74656a6f2e6f72672f7565612f2431, 0, 0),
('unreal', 0x687474703a2f2f77696b692e6265796f6e64756e7265616c2e636f6d2f77696b692f2431, 0, 0),
('usemod', 0x687474703a2f2f7777772e7573656d6f642e636f6d2f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('vinismo', 0x687474703a2f2f76696e69736d6f2e636f6d2f656e2f2431, 0, 0),
('webseitzwiki', 0x687474703a2f2f776562736569747a2e666c7578656e742e636f6d2f77696b692f2431, 0, 0),
('why', 0x687474703a2f2f636c75626c65742e636f6d2f632f632f7768793f2431, 0, 0),
('wiki', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f2431, 0, 0),
('wikia', 0x687474703a2f2f7777772e77696b69612e636f6d2f77696b692f2431, 0, 0),
('wikibooks', 0x687474703a2f2f656e2e77696b69626f6f6b732e6f72672f77696b692f2431, 1, 0),
('wikicities', 0x687474703a2f2f7777772e77696b696369746965732e636f6d2f696e6465782e7068702f2431, 0, 0),
('wikif1', 0x687474703a2f2f7777772e77696b6966312e6f72672f2431, 0, 0),
('wikihow', 0x687474703a2f2f7777772e77696b69686f772e636f6d2f2431, 0, 0),
('wikimedia', 0x687474703a2f2f77696b696d65646961666f756e646174696f6e2e6f72672f77696b692f2431, 0, 0),
('wikinews', 0x687474703a2f2f656e2e77696b696e6577732e6f72672f77696b692f2431, 1, 0),
('wikinfo', 0x687474703a2f2f7777772e77696b696e666f2e6f72672f696e6465782e7068702f2431, 0, 0),
('wikipedia', 0x687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f2431, 1, 0),
('wikiquote', 0x687474703a2f2f656e2e77696b6971756f74652e6f72672f77696b692f2431, 1, 0),
('wikisource', 0x687474703a2f2f736f75726365732e77696b6970656469612e6f72672f77696b692f2431, 1, 0),
('wikispecies', 0x687474703a2f2f737065636965732e77696b6970656469612e6f72672f77696b692f2431, 1, 0),
('wikitravel', 0x687474703a2f2f77696b6974726176656c2e6f72672f656e2f2431, 0, 0),
('wikt', 0x687474703a2f2f656e2e77696b74696f6e6172792e6f72672f77696b692f2431, 1, 0),
('wiktionary', 0x687474703a2f2f656e2e77696b74696f6e6172792e6f72672f77696b692f2431, 1, 0),
('wlug', 0x687474703a2f2f7777772e776c75672e6f72672e6e7a2f2431, 0, 0),
('zwiki', 0x687474703a2f2f7a77696b692e6f72672f2431, 0, 0),
('zzz wiki', 0x687474703a2f2f77696b692e7a7a7a2e65652f696e6465782e7068702f2431, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nw_ipblocks`
--

DROP TABLE IF EXISTS `nw_ipblocks`;
CREATE TABLE IF NOT EXISTS `nw_ipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varbinary(255) NOT NULL DEFAULT '',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1 ;

--
-- Dumping data for table `nw_ipblocks`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_job`
--

DROP TABLE IF EXISTS `nw_job`;
CREATE TABLE IF NOT EXISTS `nw_job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_params` blob NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1 ;

--
-- Dumping data for table `nw_job`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_langlinks`
--

DROP TABLE IF EXISTS `nw_langlinks`;
CREATE TABLE IF NOT EXISTS `nw_langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_langlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_logging`
--

DROP TABLE IF EXISTS `nw_logging`;
CREATE TABLE IF NOT EXISTS `nw_logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(10) NOT NULL DEFAULT '',
  `log_action` varbinary(10) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_comment` varbinary(255) NOT NULL DEFAULT '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=binary AUTO_INCREMENT=96 ;

--
-- Dumping data for table `nw_logging`
--

INSERT INTO `nw_logging` (`log_id`, `log_type`, `log_action`, `log_timestamp`, `log_user`, `log_namespace`, `log_title`, `log_comment`, `log_params`, `log_deleted`) VALUES
(1, 'patrol', 'patrol', '20110214151007', 1, 0, 'Eggdrop', '', 0x320a300a31, 0),
(2, 'patrol', 'patrol', '20110214151041', 1, 0, 'Eggdrop', '', 0x330a320a31, 0),
(3, 'patrol', 'patrol', '20110214151410', 1, 0, 'IRC_Server', '', 0x340a300a31, 0),
(4, 'patrol', 'patrol', '20110214151423', 1, 0, 'IRC_Server', '', 0x350a340a31, 0),
(5, 'patrol', 'patrol', '20110214151431', 1, 0, 'IRC_Server', '', 0x360a350a31, 0),
(6, 'patrol', 'patrol', '20110214152801', 1, 0, 'Wordpress', '', 0x370a300a31, 0),
(7, 'patrol', 'patrol', '20110214153446', 1, 0, 'SSH', '', 0x380a300a31, 0),
(8, 'patrol', 'patrol', '20110214153649', 1, 0, 'SSH', '', 0x390a380a31, 0),
(9, 'patrol', 'patrol', '20110214153904', 1, 0, 'SSH', '', 0x31300a390a31, 0),
(10, 'patrol', 'patrol', '20110214153922', 1, 0, 'SSH', '', 0x31310a31300a31, 0),
(11, 'patrol', 'patrol', '20110214153951', 1, 0, 'SSH', '', 0x31320a31310a31, 0),
(12, 'patrol', 'patrol', '20110214160243', 1, 0, 'Network_Interfaces', '', 0x31330a300a31, 0),
(13, 'patrol', 'patrol', '20110214160324', 1, 0, 'Network_Interfaces', '', 0x31340a31330a31, 0),
(14, 'patrol', 'patrol', '20110308092941', 1, 0, 'IRC_Server', '', 0x31350a360a31, 0),
(15, 'patrol', 'patrol', '20110308092956', 1, 0, 'IRC_Server', '', 0x31360a31350a31, 0),
(16, 'patrol', 'patrol', '20110308093021', 1, 0, 'IRC_Server', '', 0x31370a31360a31, 0),
(17, 'patrol', 'patrol', '20110308132332', 1, 0, 'Eggdrop', '', 0x31390a31380a31, 0),
(18, 'patrol', 'patrol', '20110308142406', 1, 0, 'Eggdrop', '', 0x32300a31390a31, 0),
(19, 'patrol', 'patrol', '20110308144223', 1, 0, 'Eggdrop', '', 0x32310a32300a31, 0),
(20, 'patrol', 'patrol', '20110309073316', 1, 0, 'SSH', '', 0x32320a31320a31, 0),
(21, 'patrol', 'patrol', '20110309073329', 1, 0, 'SSH', '', 0x32330a32320a31, 0),
(22, 'patrol', 'patrol', '20110309075258', 1, 0, 'Eggdrop', '', 0x32340a32310a31, 0),
(23, 'patrol', 'patrol', '20110309075503', 1, 0, 'SSH', '', 0x32350a32330a31, 0),
(24, 'patrol', 'patrol', '20110309075719', 1, 0, 'SSH', '', 0x32360a32350a31, 0),
(25, 'patrol', 'patrol', '20110309075759', 1, 0, 'SSH', '', 0x32370a32360a31, 0),
(26, 'patrol', 'patrol', '20110309083859', 1, 0, 'Eggdrop', '', 0x32380a32340a31, 0),
(27, 'patrol', 'patrol', '20110309084317', 1, 0, 'Eggdrop', '', 0x32390a32380a31, 0),
(28, 'patrol', 'patrol', '20110309084514', 1, 0, 'Eggdrop', '', 0x33300a32390a31, 0),
(29, 'patrol', 'patrol', '20110309084539', 1, 0, 'Eggdrop', '', 0x33310a33300a31, 0),
(30, 'patrol', 'patrol', '20110309084620', 1, 0, 'Eggdrop', '', 0x33320a33310a31, 0),
(31, 'patrol', 'patrol', '20110309085044', 1, 0, 'Wordpress', '', 0x33330a370a31, 0),
(32, 'patrol', 'patrol', '20110309085230', 1, 0, 'MediaWiki', '', 0x33340a300a31, 0),
(33, 'patrol', 'patrol', '20110309085438', 1, 0, 'Main_Page', '', 0x33350a310a31, 0),
(34, 'patrol', 'patrol', '20110309085452', 1, 0, 'Main_Page', '', 0x33360a33350a31, 0),
(35, 'patrol', 'patrol', '20110309085551', 1, 0, 'Main_Page', '', 0x33370a33360a31, 0),
(36, 'patrol', 'patrol', '20110310205822', 1, 0, 'Git', '', 0x33380a300a31, 0),
(37, 'patrol', 'patrol', '20110310211002', 1, 0, 'Git', '', 0x33390a33380a31, 0),
(38, 'patrol', 'patrol', '20110310211216', 1, 0, 'Git', '', 0x34300a33390a31, 0),
(39, 'patrol', 'patrol', '20110310212353', 1, 0, 'MediaWiki', '', 0x34310a33340a31, 0),
(40, 'patrol', 'patrol', '20110310212522', 1, 0, 'MediaWiki', '', 0x34320a34310a31, 0),
(41, 'patrol', 'patrol', '20110310212538', 1, 0, 'MediaWiki', '', 0x34330a34320a31, 0),
(42, 'patrol', 'patrol', '20110310212551', 1, 0, 'MediaWiki', '', 0x34340a34330a31, 0),
(43, 'patrol', 'patrol', '20110311002503', 1, 0, 'Wordpress', '', 0x34350a33330a31, 0),
(44, 'patrol', 'patrol', '20110311004156', 1, 0, 'Honeypot', '', 0x34360a300a31, 0),
(45, 'patrol', 'patrol', '20110311013045', 1, 0, 'Wordpress', '', 0x34370a34350a31, 0),
(46, 'patrol', 'patrol', '20110313151210', 1, 0, 'MediaWiki', '', 0x34380a34340a31, 0),
(47, 'patrol', 'patrol', '20110313151350', 1, 0, 'PhpMyAdmin', '', 0x34390a300a31, 0),
(48, 'patrol', 'patrol', '20110313151839', 1, 0, 'Leagueofevil.org', '', 0x35300a300a31, 0),
(49, 'patrol', 'patrol', '20110314130201', 1, 0, 'SSH', '', 0x35310a32370a31, 0),
(50, 'patrol', 'patrol', '20110314130314', 1, 0, 'Misc_CLI_Commands', '', 0x35320a300a31, 0),
(51, 'newusers', 'create', '20110314130810', 2, 2, 'Lag', '', 0x32, 0),
(52, 'rights', 'rights', '20110314163634', 1, 2, 'Lag', '', 0x0a7379736f702c2062757265617563726174, 0),
(53, 'patrol', 'patrol', '20110314170019', 1, 0, 'Wordpress', '', 0x35330a34370a31, 0),
(54, 'patrol', 'patrol', '20110314172522', 1, 0, 'SSH', '', 0x35340a35310a31, 0),
(55, 'patrol', 'patrol', '20110314173323', 1, 0, 'SSH', '', 0x35350a35340a31, 0),
(56, 'patrol', 'patrol', '20110314225731', 1, 0, 'Honeypot', '', 0x35360a34360a31, 0),
(57, 'patrol', 'patrol', '20110314225844', 1, 0, 'Honeypot', '', 0x35370a35360a31, 0),
(58, 'patrol', 'patrol', '20110314225918', 1, 0, 'Honeypot', '', 0x35380a35370a31, 0),
(59, 'patrol', 'patrol', '20110314230729', 1, 0, 'Misc_CLI_Commands', '', 0x35390a35320a31, 0),
(60, 'patrol', 'patrol', '20110314233620', 2, 0, 'Login', '', 0x36300a300a31, 0),
(61, 'patrol', 'patrol', '20110314235803', 2, 0, 'SSH', '', 0x36310a35350a31, 0),
(62, 'patrol', 'patrol', '20110318015657', 1, 0, 'Git', '', 0x36320a34300a31, 0),
(63, 'patrol', 'patrol', '20110318015739', 1, 0, 'Git', '', 0x36330a36320a31, 0),
(64, 'patrol', 'patrol', '20110318020255', 1, 0, 'Grep', '', 0x36340a300a31, 0),
(65, 'patrol', 'patrol', '20110318020429', 1, 0, 'Grep', '', 0x36350a36340a31, 0),
(66, 'patrol', 'patrol', '20110318020819', 1, 0, 'Git', '', 0x36360a36330a31, 0),
(67, 'patrol', 'patrol', '20110318021233', 1, 0, 'Git', '', 0x36370a36360a31, 0),
(68, 'patrol', 'patrol', '20110318021334', 1, 0, 'Grep', '', 0x36380a36350a31, 0),
(69, 'patrol', 'patrol', '20110318022946', 1, 0, 'Git', '', 0x36390a36370a31, 0),
(70, 'patrol', 'patrol', '20110320224834', 1, 0, 'Mac_Terminal_Commands', '', 0x37300a300a31, 0),
(71, 'protect', 'protect', '20110320224931', 1, 0, 'Mac_Terminal_Commands', '', 0x5b656469743d7379736f705d2028696e646566696e69746529205b6d6f76653d7379736f705d2028696e646566696e697465290a, 0),
(72, 'patrol', 'patrol', '20110321135043', 1, 0, 'Mac_Terminal_Commands', '', 0x37320a37310a31, 0),
(73, 'patrol', 'patrol', '20110321165743', 1, 0, 'SSH', '', 0x37330a36310a31, 0),
(74, 'patrol', 'patrol', '20110321170407', 1, 0, 'Wordpress', '', 0x37340a35330a31, 0),
(75, 'patrol', 'patrol', '20110321170541', 1, 0, 'Misc_CLI_Commands', '', 0x37350a35390a31, 0),
(76, 'patrol', 'patrol', '20110321170609', 1, 0, 'Misc_CLI_Commands', '', 0x37360a37350a31, 0),
(77, 'patrol', 'patrol', '20110321170850', 1, 0, 'Honeypot', '', 0x37370a35380a31, 0),
(78, 'patrol', 'patrol', '20110321171654', 1, 0, 'Eggdrop', '', 0x37380a33320a31, 0),
(79, 'patrol', 'patrol', '20110321172039', 1, 0, 'MediaWiki', '', 0x37390a34380a31, 0),
(80, 'patrol', 'patrol', '20110321172338', 1, 0, 'IRC_Server', '', 0x38300a31370a31, 0),
(81, 'patrol', 'patrol', '20110321181616', 1, 0, 'Network_Interfaces', '', 0x38310a31340a31, 0),
(82, 'patrol', 'patrol', '20110321182346', 1, 0, 'Grep', '', 0x38320a36380a31, 0),
(83, 'patrol', 'patrol', '20110321233712', 1, 0, 'Mac_Terminal_Commands', '', 0x38330a37320a31, 0),
(84, 'patrol', 'patrol', '20110321233733', 1, 0, 'Mac_Terminal_Commands', '', 0x38340a38330a31, 0),
(85, 'patrol', 'patrol', '20110328111953', 2, 0, 'Indicator_applet', '', 0x38350a300a31, 0),
(86, 'patrol', 'patrol', '20110410110022', 1, 0, 'SSH', '', 0x38360a37330a31, 0),
(87, 'patrol', 'patrol', '20110505140516', 2, 0, 'Grub', '', 0x38370a300a31, 0),
(88, 'patrol', 'patrol', '20110508113113', 1, 0, 'Misc_CLI_Commands', '', 0x38380a37360a31, 0),
(89, 'patrol', 'patrol', '20110508141822', 1, 0, 'Git', '', 0x38390a36390a31, 0),
(90, 'patrol', 'patrol', '20110508141851', 1, 0, 'Git', '', 0x39300a38390a31, 0),
(91, 'patrol', 'patrol', '20110508141927', 1, 0, 'Git', '', 0x39310a39300a31, 0),
(92, 'patrol', 'patrol', '20110508160627', 1, 0, 'Git', '', 0x39320a39310a31, 0),
(93, 'patrol', 'patrol', '20110509082657', 1, 0, 'Apache', '', 0x39330a300a31, 0),
(94, 'patrol', 'patrol', '20110512083205', 1, 0, 'Python', '', 0x39340a300a31, 0),
(95, 'patrol', 'patrol', '20110512083256', 1, 0, 'Ruby', '', 0x39350a300a31, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nw_math`
--

DROP TABLE IF EXISTS `nw_math`;
CREATE TABLE IF NOT EXISTS `nw_math` (
  `math_inputhash` varbinary(16) NOT NULL,
  `math_outputhash` varbinary(16) NOT NULL,
  `math_html_conservativeness` tinyint(4) NOT NULL,
  `math_html` blob,
  `math_mathml` blob,
  UNIQUE KEY `math_inputhash` (`math_inputhash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_math`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_objectcache`
--

DROP TABLE IF EXISTS `nw_objectcache`;
CREATE TABLE IF NOT EXISTS `nw_objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_objectcache`
--

INSERT INTO `nw_objectcache` (`keyname`, `value`, `exptime`) VALUES
('nerdwikidb-nw_:messages:en', 0x4bb432b4aa2eb632b7520a730d0af6f4f753b2ceb432b4ae0500, '2011-05-12 22:45:29'),
('nerdwikidb-nw_:pcache:idhash:1-0!1!0!!en!2!edit=0', 0x75535d6f9b3014ed33bfc2f03c1a43433f9c2c2f55b546ea52a446ebe364f01db10a36b24d1256f5bfef9a3613c93a243e7ccfc5f7dc73ae1f5992b228e7c68279ec5cdbb988a517ecd5b28c45cd1af62e9a5936a5b89ab78b79212b7c2c5660c4b37c91f349b1c01b83c17c8270bb586fa42576a3bb5a10a51d29806c25ec4090a2275cf55ac117a28badd49dad7b02423ae2f09ff36183601ec6310956b0cb7352cb064103ad362ec8f16d7409d66a831b0b20a5ee946324992474b8825c5b17c3bee54a10a9cabac3242b7f03237492d29bab244b9184031baca1696bee807053750d28f79fbcbb7d0bcaca2d90761088fcea54e9a45687e2d4170fe27811bc337fe25bf0c50ff9252f374076d26dc80bf444a16c3b944d14b1dafd64ed00332936dc6e5812d330096918820ad3d00bf39512df8b930d58c79b96a434496896a4f42acba694f8bade9d648a563d705575bc8207a95e6c34e38cb2d737c412c46eb1d74a1b0963e0ca035a392e957dacc5775ec9329a158cfa1da9375fba1a0e138081e800dc7ada6b6475287ecccb47af31ed07188b5af9254e4f727e793ef5df979eec09c9a1dc8729e3783a8a2fc508f1e4970db63bcef632dced1d18c5ebcf64c0b17a82c1bfbf7dfa21bf97023e813ca795fec6eb1a4c7f14bd072e960e9a53a6efe7e75eeb71e51b049eb951525527d18f82a72c73a35b30eec8ac14453b1b1fd2b366a904ec735dcbb21ff9f36fa29016e5eb07334fecfd18ab23172fe80dbdceb22c89666f7f00, '2011-05-13 07:55:40'),
('nerdwikidb-nw_:pcache:idhash:14-0!1!0!!en!2!edit=0', 0x8554df6f9b400cde337f8583a6f52909d0a43f481669abba2552d7466ab43d4e1770e154b863774713d6f57f9f0f4247d24ecd4bc0fe6c7ff6677313fa41e82e99d2a86e4a5394c60d83e3f05187e3d0cd57b835ee448767c7e7a13b2d665fb88881c1e74fb77388649e337aad6479f48050287ce0b2d45905a5c618face349231cea66b05c3d97b48b9365255f00712850524dc4c8735c069102b02c086671964840426aab682359b148e28e408b800932261040e9ce9b098b5ac5429041709f190116a8d1ad6150896e30b268506566e5b22ac60518a6f72f997d6a4cceca20220dcaef03e9b3b9e1194c83288b9c2a86efd9048a65b125ae668439e6934a91a411a889175d2b7e68a49122b59c087c44c609852de21c9a1863bfb9ae97460b6c6797d18fa57c9e326b67eb45d53db36627f4268a29aa433edf5fbe05ce366b9a461e5dc00e591ca384bfa6f662615080a25394b6142f087be57ff9ca5d4a68fdbc26e111751561248f3df1882370cbcf3537f1c908806b5b3c2bcc89841602a297314e63fb8cb6d814273bb8ef546c35d2922c3a5688b7bb6b8d3efcf9c86f92d7b405bbcc54756d666dfee91f60755bce1f73c5ef7c5e66758d4ee90c7298d31f4477dafe7f7bc5e0f452fe861cccd470f6c3386e7a80dcb0b083cdff7c67ee08d4767e373b085ed3df9233aae2b2692922578c5c5bd76272cf4c2c727f2f9e4bba06613a938761da7d62185615ce89b2cfec6121eb99375e8d98c9e3d576e326c6f960c6eebb8b0bc57c4aa2dbecfab3e71827d47a56958f695aedf1f9c0c46f6f9c4923d205997dba9d2b5071dfb22ee782cf9454eed76d1760c975b834ab0ecb531d05edd622de0739ff6b334e731bee2b29caee5579665a8aa3deb1c59bc30981f326d0e6c2e65b7327deaf21f4cd9a33eb0ee0a1eb25cd261a1327b620534b477ddcfeabb7c2162dc2e65c6a3aaa3cf4b60cc358dafaac53c9077b7567b2a1e07be7f161c8f4edcc9d35f, '2011-05-13 05:48:59'),
('nerdwikidb-nw_:pcache:idhash:19-0!1!0!!en!2', 0x7553d16eda3014ed73bee226da6b8a93422926e2a5aa0652572281b687699a4c720b16891dd94e21adfaefb3034c81311e20dc73ec73ee3d37731ac5344899d2a8e6b5a96a13d0f88e7e683aa041b9c4bd09c69af6c990064935495693052fab0261ba5ca660cfbca18257254b60a2819c2bcc8c544dd25b4dbc64a5a037493299e3e40b548dd948016109871bdc058bc3f99f9554e657d26b995ed2abec971f86e0bde02e4da1e02537a0d0b1bcd4fe2a99a1d65281b0072093b53014a25e44da8f974a6d42dc574ce4c04556d496a4f93b5220bd988c86d120865563507b4bb44e9841606a5d9728cc7f784ffb0a85e66f08553b2878ad4566b86de7284e9cb8178613efe07cc1ded0899ff819cb36083b6e36b0c50604aa7cc7b73c5f8562f79b562d4c79be617a43a35148fcc827be8fc28fc175617889dab0b28298441119443179b88bc9009ca2cb27eadbb09e9958d76c8dcf5c6c75306694d08f4f8b45167bb45daea5e2d805860e90c2302ef4bcc8bfb135cf82f18a12772371f17353e069076c2138018fcef0d2ba3a899ffb72d5074bfb8e4adb29b9bf769ba2dbfbdbbe7bbe77662f4cb672c738baf5b8539fe51dc4999f95b6dd2edb8de1696f5009565c1b835da805b6c9fdedd3adf994e77805729e5ee4575614a89ab3ea14593e33585e3a3dbc415329bbca230bfc604a70b1bea81e052f5da64a56a8cc5958b11dda4df735bd296722c77d2a0b9e359d7cfe25e65cdbf1356d9817f11ed7ea6a8a36aacf3f, '2011-05-13 08:32:05'),
('nerdwikidb-nw_:pcache:idhash:20-0!1!0!!en!2', 0x7553c16ea33014ec99af30dc690c6992d68972a9aa2652b7416db47b5c19fc4aac806dd926095bf5dfd7a6c98a645b2ec09b07336fe6794592944419d506f4aab1aab1114987e4dd901189ea351c6c34356438c1249aa9f92c9fbf34798ba4402f94570671612cadaad9209f07b35ca3c1fc514a860cd846a137a911831d5452d520ec75301b28d716c6310a9e619f65a8e235b7488392da0699bb6b598031ee3b2119a04236c212940c12dc5d41268d8de1a0a8608ebaa81ad764f81f20080f527c37494629ca5b0b265843ad2a6a01515d369efd9bbe87830261f80e90ea3c406f8d282c77031ec9b1270fe2781e7c2a7fa53bf0e4a7fe82161b407b6e37680b2d12a0d99e6f39cb63b1ff4d540713ce36d46c488a631c26210e4310618afc1496d7e02cac154a7192e05192e2db613a1a23cfe8ad4f6e5c0e4f54940d2de1898bad89a69460f2fee1b0c461f76eca526a0e7d60e201292c7501ad2af68396bc88a639c1fe8fd827cb6d05a7785d213a01f75ef0daa93a919febf2d55bd7f613b4712ef957b728c9f5f8fac63f8fbdd80b911ddd318e7e3dedd597ac8778f1cbda8ddbeff6363c1c2c6841abaf6c700bf50a5d72ffe6f41bbce00cbe80bca667f9e85617747b565d00654b0bf5a5d2cfc3b190b2cf7ce7805f540b2eca8bea91f05265a6a5026dcfc24a9d6957fd1378552f058343262b5eb4bd7cfe6f64dc38fbda2ecc8b788f6bf55d8a1f7f01, '2011-05-13 08:32:56'),
('nerdwikidb-nw_:pcache:idhash:4-0!1!0!!en!2!edit=0', 0xed18ef6fda46b49ff92b5eac4a6c52c03681d03a04294bd32552685892ae9ab6091df601b7d877dedd198756fddff7ee30d490c09c6a1f974ff1fbfdfbbde326f05b81332452517993e934d34ed03a0abea8a01338c93d7dd4ce890a8e8e5aedc0e9a5fddeb87fc5952671ccf8143e0919a5922ad573c7fd5a6f2cc1edf74211d1fe6bc8a754438fc04cd2c9a933d33a0d5c375f3134859cba31d154e9a626b239fdec401813a54e1d54492527314c24a50e68a6635a4d80a4f1a9c3c544c4b1c89dfebfb3f45cb232fb3520081e3fcf27b041b246ab2c1290cc612d0edc39916e9ee72e27091593712ca66bea30da8b5e0b4b1ba1e013366d2892a4316da6b3f41bd07c6db270c2c526bee7da78d77a2e2627ed9f4511445413162b10134816eaef183d1bc71426428231e2b08066ca8439a14078042986de78d684fb19e530155a5862601cc652e4480b089a30ced40c81b6048866823757aab13406626ecac2322235a73920e39cca527dbcb7d9b12264161a090a332d926fc5048a690a0d5815d4560d197f1f9b9b595d2a1e19114303ac564cd5243d5f5555784be555c5899f48f860f83fa6a3df442647ef08268e28fafdceec9658dda95d325ee8dc2db6949046d08694d17b4cfdc8e8c8d2eff7b392f0ea2e5710b7f47e59f803f24097351f314943645d80c839768ce9aca914590a751c048d0805d50f41d9a653b60141669c9b9e394b4938a3cd554459fffc7270f30eb0cbd6521955d0ed740e2d70c262fc3c6eb7a1d173591fb6a62f366a04bf2fd07c6c6d3d831995f44f68e8454a2182067da42184b3444446227cf90a7f9cac27cd3edec906af51bfc95bc8ec768b29a529d76e96c682446a6b54191f67844f297cbcbd5666d00c1677bf5c43ce50e7f07238589c4509e3c6bb42fc79ccc20710bc0876919643d06664e5e948a4769c14d4b71907232f14496212d1d88cd1c7e1bbb3fb8b121bdc5ddcc3f2ffd19cc4198553ac99342621fda10c3e84fa93b596e74d11478d482484f1266aac575c67cf31ee58634f494d11eeb00647eff759f38471b7355ba4c69a1fe1d3e5c5edc52a8c76bd9c427d26125a879bdb6db819f4998ceb275ba5b14c34a626154aab43d3249ba9dc91494b6ef338cd5854ca9ff9ac96b7c3fa7f11c51709ad9cef7d626cf4b7e3582d56e6bf51d1aba59895c1ffd7fc0ba28e87d08594422a3bff71b53c10dc013c2a5fc903b280199953732691e8af4c69185299103cab1fec2c2c5d43546bdc10089da047cc6e633304433c53a7cbad602f389bcf98e2a0b542a1edb5811a3b804cb459469088395d9e6bb5de4103e7e1079a0f8710b38469937621750d0f97548a1015232347b7b0e932ae03f05ddfb37fb5216ac22d901aad8c877186448a7da601786ecb7bdbf53b2d182ff086aedd533c6ad14c20729a25a6bc9ea7bb784c29570cc391da87084c326e4fc39572cf28af351afddad2f23b0c9d51bea20fcdf25c6e8e07bac0c35346397b60d1b8c1f351905a74c0a21951b3a0ddf00efc03efe080f283d6018d983ef56c04354b70f1e31d0e2dcff7bd8edff23aed371ddcb0a8d7bc827c7c0325d7b8b23232a5d72653ce0909bce0cb57c4f9883b5fa7a484e81a04b611d68cba89a30199b2d03919079e91e899479629c8d54b0b01ce0a716eccbe47ab56ca37ed32d03748f62b950a63653ef1cde6378f9b16756c8cdd32d2aa2b925286b74af0aba88431c65f25e86e99da84e1a268aab586ae79331e21aac24bed84053e5ad83e0a5e748a176c1d7f2fdbcea3b7603f6eed65af724b16925ac7c1bea1f63cd5f6b05939d5de276bef02b1125625882d7d476defac6bcc3ce42f59449f41997af8207ec68392cac506f41207c995a6c976952c7f23b814a25c576f11f1894873c86e410b85db8d329422a5526f348a89d3abf20f11af922b8ef9190a1c7a8b526f3c258c98c2d25dd846da6aada2a5373ae8a8e5fb5dafed759d93afff00, '2011-05-13 05:48:54'),
('nerdwikidb-nw_:pcache:idhash:9-0!1!0!!en!2!edit=0', 0x8d566d6fdb3610ee67ff8ab3302ced505992f32e3bc6d6cc688ca5891767db87612868f12cb191488da4e27845fffb8e92ecd86e0bc44010e9deefb9e748ddc6513ff6a64c1bd4b7952d2bebc5fdc3f8b3898f63afb8c727eb0d4c1c9d9c92d5b01c0de7a3893496e5b99029fc26ca5241a624ae4a6587c17cd419ce3504a377cc200725210a7be111cc503fa26e75c344711cfd00acb47e8a1644130fca95a548be5d0a63c9b97d2d56e6df9ccfc154730a6184926d180ac0794555c383ab6223358f12920c930755591832c8342e2ebcccda320e82dab4972a95e6e8cae825aa08c823b0ba920f810749ce8cb9f0a86dd492e5b0d0881e5861737c79108df98527d542e5b95a7aa397b90d03368220530506bb0d25e5b6b80d932cd21e27a0bead1a0635c69d6140132b47974a2e445a696ca002ab205729014f0f1f56b3dfafc1df9b4d8d3af81568a52cf8e573311a9945e0ccb239cdb80938d8a853cda4857a9a5a3c8a1c53348e064d653fb9cc07f5f3c1cfb94a589e296a417094562c040d7dbe82038394c41e3c07c527619fdfd6a535adf86563de76f6636e073b90709504641fd45e3dfadb8366cc850507192ca85a575fa2a4c4c4c2069b4dafbb20fdbd967fac63ff03752f17b0e9abb5aecdc8fb6287a78eb89215fbe292d8b7549a93b8e96bafdc6b950a09ccb4edbe5e2a796081f8e3646e566fde026d93b6ed6aeecfb517d4da9ec9f602bf5b01c705abf2b527c5ac27572a0ad6a75f0fee288dcd8421888a8249ee20d2b465356c6befd9ec8acc1bb7d752598c777d9682c891b1c7da698e4ded29a3aec402cc8a56bf0032d758178afccd573d889200cd8957be05c9889dbfc0f46e7c77fbc7fde4e63df802d0662111032c6d8ecfdb06c0ff0477e35f2777e3cb7bf254fea6b1af21aeb96080b985c1d29d50d024df66166d5060edaaf57e0b5c2d65ae18271637eedf77e53b2cec0cbbbe0f9d1b5c4ea7908b8208a9d155d799d27fad1234466990e4402856d2c610055158ff3a53229a8f4fa58356c824afc8c888ff08f530e887e7a7d1719f96caa2e9dc6351e66e77994eab8236ee3b76e3a712a51134a0b2be146051c9c4d2b9bb4e1ebae41ddf1f759aca67344c977c6d9f303a7e69ce362308562051f3a578107ceecbe5c7b8acd5b1e01933597cee87dda81b76bb28bbfd2ed2325e8450534b148e014509fd308ac2e3a81f1e1f9d1d9d80cb5bdf4847743d5d3399562cc56b211f8c376071187ffe42ba887497d46baab4c06dc5a9532869896fe636e71f582a126f308f43173174179e3be9d7b71e09bcb5e2d2957d4f55ad93efd6e5a46764f6677347b957ba3fa3de49efc83d9fb862f78aacd3b543d996f7b7e413bea571c54f0a6a77dbdac1306e6fab4d86c8dddf8754cf0b6fac8188a3c11a3822e20ceb896f90719f0257744c7f43e5bab851efe9c847bdda915e21e3135ae7fdde9aaf8c2ba5b6d13827c55f4c4bfaaad893b609f7c73bd5aa446d77c6db27985f6d7fcabc2a2692e3d354e522596d4df46b43ba4b09f0553dfe3d42b444dc99fb613f8a4ec3b3e3d01b7cf91f, '2011-05-13 05:48:46'),
('nerdwikidb-nw_:rcfeed:rss:50::', 0xed1c5d73dbb8f139f915a8938992d62425f933f4d7f9925c929938c9c4bee974ae371e8800259c49820540cbcaf4a14f7deeafe80fbb5fd25d8094284b71acd8729d1beac126416077b1bbd80f70411d769eaf6f6d862bbb07176942ceb9d242667b2b1dbfbd72b0ffd0b67ada8c12ae079c1b624639df5b31fcc20491d62b64a078bcb73230260f8320e1b45f7019f37391f852f5838c2b36146722d06722d34124d3546641cc39f361f441b7bd659128ad2798bb809900d64c872c1a83ce0be540b228e0094f796674d0f13bc1cafec307bbd18066194fe0f2c1ae1126e1fbef01f35f0133211ef9c423e84eb0539f6bf20bcf7edd0d5c371c9088ec6cffab331019e3177e3ec883e39c478226a103fbc241dd0d2c1884c7b88e94c80dcc66ff44d1e88c980127a9d486a8694a8cb48f103e11195c0b4d2c7376833a104b248c28689feff30c505537f8a4cf81466aa4da3fe24c503b6960cc86dfd90d26cf1c0c6d7e2c44c25e52c3f74f06c52ae974c9111d916ebbd321eded706d2b5c6f93d7472788a3de19870bc353bca858fca9e88d6a7c5c98910776e81e827942d37c878938de7bbe61af65c204dbcb153f9f30769ab34f12b3933fe99b9d178a03858ce4c0106c0c6cebc3f173bce8e1c57b3e9c74ea558f82712726cef1b2d56a21494466e413158906c968439304da2d2845028700e9b40df60a9a5e4bc988e6a6c8492c1561fc9c27324755f52da612c18c701fece645efcb32e9861b1b4e265537cb8b288c70e620db43960ad08a5a0b76c0c586ab6411d53ea1c959e8e43a1e0ea0824af4333af071640632bb052d70806a7ab07e0ff4e058a479c2c99b93938f205705268ac44aa6846623c2042c66e0f5e8eb7a51b54492f1aaed31c9ed8c8997128706b11c3b24bfe452995fab61417ddccd14a9bd7e978a5429c7f554e930a7d180df822a394035555abb07aae488224ec05f579956eb48e88870a5a4d2a06f8cc4e282ebaf8e7b1b13e484250ac6299eb50cd103391459df82812622e3982b6c00ffc3e4304b2465d611c502dcbcb5779c327f1a55fde615138604dc4401b5d3ea06a964dae319ed259c0540c0861fc92c46042935d1c0419749e208f1be61c1546d6fe323c98a041d2a3b7598ea6be30aa8047e55eb4f38d3234b9a6dfa4721cdcedf81754ff3b5837f9a3479f678d2be007cfc1d73f306589dc042a6799e8888a27605171e6a32f380e605080d2694dee63473bdccf9795a162ae24b9fe623722221a62a158fa0e243185580a91e9b67010a5dda9f4b4a083680eb6b21796a8dfe8c02fabe3fee078a3e9e4ad5a17ae83f232f2579ffe1046303022b073a7fc808859566ae851f6d16da4fe20f0c8d220ed1b25ba9962e2634cc1e67248c7f1d78735712320d78b6c8627a5417e0cbca1d926020531efc197d0ce8c6e90016d342222d7f20cc538afee8f49c2605273ceb83c0c88738be2e94b140c6b42d42c717c5794ddb353bee06eefc4866aba4fd7cca9d7737c38dadbb74e79583be9e3b7f2dcc2df872805273e4dd451d79cd794327bc33d652d88476ef89b57e3dc8d0fa4a1619f32299481592e10026b343dc5d2f81e73baeab05e4e0c04312418ea4f75a489b975275068ebd548bf97dc0251a60dcd59dbe19905104568ae8677b2d23f356fd09c3b9e89cc2a36eeb2693fffddfff211f1206f615b82f305fb71c366c29d83e9538d054ca987436c3f6e62ad91eaf8259dc8151531ca974a04ed37a8b946cc25c1c593dc5fe2231c232efe91a3813789e62566df878c69a64d2c554d9b31a0535f45fc4eda6d675ff4ab4eec6e2468f94c9c9fcdfa1c15bdf0eebf3bc758875b6cd123eab98f8945c1a0f3de78b39248f38bf245f70c199f1b4f8cc43a25348acb9aac97c3a6a7e35897f87529d510b5497e17365376789f91ec9be9f32989399f414cd209e0457109d418e240bb043364f21c2855ab06087039e11a346659291177a80ff292ca254c25a72c9f42af9add006328433682920313103eaa2b412c748162d6c9e012434e6353401b7c646755270d706014ce1f1c9cf9a8fc381bafbed0be346e3500aeb7ac095c33dd75b23f429c8488b1e0a9be1c80a4049bd7f8f75b411eb52c4fae5353ccf5c8f0591f5747e7d0df9cb021a12c5d1b76a085c0af07575d0a5cf569c9570865cf40726243d08c92007e217c6633c92ca268421f8c98c5f820e019e1e5f374c5c9c89e04420267e53f42a6fd230f4865a39630a8f9102b00411f647db0096cc6e9f918c0f014f2eb1d149c1fa78345fa52503c3e376884922239ad8de7e23a7c67adc0f26fe241478669e59b78c5ef29c2a8119b14695762a9b42968f6982dbb82dd51cb787329a72abef3ca522719bb88d446ec9fcccdbea9e98a4c75658b8a52efac4f3fa89ec81a45028be95ca642fb712546d77b711d332bcc4152271eb032f7f6012ae33dce36ac470876280b641d1f3ed9b80f18a680470e70230f20c32c676a7bbb6beb1b9b5fd1c323f154f6edde3a722c69410a22b48f60e3fbe25ee1dc7b32f6f9837526c62a9ff3b134f7033c4be58e1656a3009f99be0e84e83a388910004809c6ff8be442b2f32f7c6ba61f012186c6401f9d6a757872f8f5e354c5ea21653c648b327b3dc68304de19f97d612d3b7603b04b847f7ccbf547dd484794d98773f99381be64def00fba46173a3abf7838987b1b1a53939be4a2529657cd5d61cd61293dadbd6726bb7c95796e80fe76530ce47962f9c3118914af44586ad3f94fb26e024c3bfc942793f979b57011d722d53fe51c9df7864fc7e5917d7f8cdc616dd4f269ecc181afb6274ea1dd32ab11578970ab33142c4d74c8d4dbaeb174c56605e5119a4946a90ce6dd9993f791e41ae92f1a1c4d0155866a01058cee9b537bc4eb73a86d8219e371e1bd8b25dbcbda248fab8c022e94979a82b180dbb775a246dcb9eaf57216d4ff8bc78f796bc700aaf6fa15e1a619e02ccd30ae6a47a7a7b7bd1eae943c6387329dca3b5e73beea42b3122e59f41c7c6ed55a9841554536cfd0729b6ee846b9d1b175b4f59de6b962777b66ebbe0791ae2d52ee37e55657a17648f80815734b2efd88c3d0604e2f10d55f610d015c6f70f369def46669f6192e001c0c45607b5be7af4e7fe4beee6936ac2b426e75832135badd6a52085784d9decddee6de88249c2f2b3bea7b8ab0ab147003e336ae8779c4a60381476d6ee32959889e5af7df45215bddb387b09606ae9c3d6a2e943fd2b0a6428cc60924acc539da027a509fa80d4fef1a3b83fffb486d084164656c2070cbdd1dc6320450e4ac7bd7e358f1948e464c049ae04accf11a994d5aabf7571f62b2ef65b3db82d018c2ff0b0759e8052686e0c346a24c67e0881f1981689a3dfb78041eba9e2bfffebbf93594f12a43193f062914f49dc0fce59aae77e1a62491cbd12a1e334b14737f17b2de5e17844555260abf3f1234c88d19b858f0f9048e008edc973beeabe959124539fc5b03776aca58905938fc02cf4819ff646cdb0ac87ed8db0b379a5617947fbb7b84361adc33c4b02add577b47603a5f5fecaceff00, '2038-01-19 03:14:07'),
('nerdwikidb-nw_:rcfeed:rss:timestamp', 0x2bb63234b152323230343430353432b03036373154b20600, '2011-05-13 08:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `nw_oldimage`
--

DROP TABLE IF EXISTS `nw_oldimage`;
CREATE TABLE IF NOT EXISTS `nw_oldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` tinyblob NOT NULL,
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varbinary(255) NOT NULL,
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(32) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_oldimage`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_page`
--

DROP TABLE IF EXISTS `nw_page`;
CREATE TABLE IF NOT EXISTS `nw_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`)
) ENGINE=InnoDB  DEFAULT CHARSET=binary AUTO_INCREMENT=21 ;

--
-- Dumping data for table `nw_page`
--

INSERT INTO `nw_page` (`page_id`, `page_namespace`, `page_title`, `page_restrictions`, `page_counter`, `page_is_redirect`, `page_is_new`, `page_random`, `page_touched`, `page_latest`, `page_len`) VALUES
(1, 0, 'Main_Page', '', 232, 0, 0, 0.204015393323, '20110309085551', 37, 84),
(2, 0, 'Eggdrop', '', 22, 0, 0, 0.210935266997, '20110321171654', 78, 1306),
(3, 0, 'IRC_Server', '', 21, 0, 0, 0.696426268093, '20110321172338', 80, 1384),
(4, 0, 'Wordpress', '', 40, 0, 0, 0.682324541997, '20110321170407', 74, 1674),
(5, 0, 'SSH', '', 63, 0, 0, 0.498394619476, '20110410110022', 86, 3640),
(6, 0, 'Network_Interfaces', '', 20, 0, 0, 0.347750782739, '20110321181616', 81, 732),
(7, 0, 'MediaWiki', '', 18, 0, 0, 0.257918408238, '20110321172039', 79, 1351),
(8, 0, 'Git', '', 52, 0, 0, 0.94932588515, '20110508160627', 92, 3052),
(9, 0, 'Honeypot', '', 16, 0, 0, 0.058427376707, '20110321170850', 77, 1155),
(10, 0, 'PhpMyAdmin', '', 12, 0, 1, 0.857256055761, '20110313151350', 49, 124),
(11, 0, 'Leagueofevil.org', '', 5, 0, 1, 0.993291478679, '20110313151839', 50, 629),
(12, 0, 'Misc_CLI_Commands', '', 13, 0, 0, 0.372251430327, '20110508113113', 88, 518),
(13, 0, 'Login', '', 11, 0, 1, 0.383298840253, '20110314233620', 60, 501),
(14, 0, 'Grep', '', 13, 0, 0, 0.575055637526, '20110321182346', 82, 484),
(15, 0, 'Mac_Terminal_Commands', '', 21, 0, 0, 0.257236298914, '20110321233733', 84, 1266),
(16, 0, 'Indicator_applet', '', 7, 0, 1, 0.540570312011, '20110328111953', 85, 573),
(17, 0, 'Grub', '', 4, 0, 1, 0.334188742189, '20110505140516', 87, 304),
(18, 0, 'Apache', '', 2, 0, 1, 0.303880988048, '20110509082657', 93, 838),
(19, 0, 'Python', '', 1, 0, 1, 0.57072935859, '20110512083204', 94, 96),
(20, 0, 'Ruby', '', 1, 0, 1, 0.544483458657, '20110512083256', 95, 59);

-- --------------------------------------------------------

--
-- Table structure for table `nw_pagelinks`
--

DROP TABLE IF EXISTS `nw_pagelinks`;
CREATE TABLE IF NOT EXISTS `nw_pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  UNIQUE KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_pagelinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_page_props`
--

DROP TABLE IF EXISTS `nw_page_props`;
CREATE TABLE IF NOT EXISTS `nw_page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_page_props`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_page_restrictions`
--

DROP TABLE IF EXISTS `nw_page_restrictions`;
CREATE TABLE IF NOT EXISTS `nw_page_restrictions` (
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB  DEFAULT CHARSET=binary AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nw_page_restrictions`
--

INSERT INTO `nw_page_restrictions` (`pr_page`, `pr_type`, `pr_level`, `pr_cascade`, `pr_user`, `pr_expiry`, `pr_id`) VALUES
(15, 'edit', 'sysop', 0, NULL, 'infinity', 1),
(15, 'move', 'sysop', 0, NULL, 'infinity', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nw_protected_titles`
--

DROP TABLE IF EXISTS `nw_protected_titles`;
CREATE TABLE IF NOT EXISTS `nw_protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` tinyblob,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_protected_titles`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_querycache`
--

DROP TABLE IF EXISTS `nw_querycache`;
CREATE TABLE IF NOT EXISTS `nw_querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_querycache`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_querycachetwo`
--

DROP TABLE IF EXISTS `nw_querycachetwo`;
CREATE TABLE IF NOT EXISTS `nw_querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_querycachetwo`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_querycache_info`
--

DROP TABLE IF EXISTS `nw_querycache_info`;
CREATE TABLE IF NOT EXISTS `nw_querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_querycache_info`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_recentchanges`
--

DROP TABLE IF EXISTS `nw_recentchanges`;
CREATE TABLE IF NOT EXISTS `nw_recentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_cur_time` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varbinary(255) NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment` varbinary(255) NOT NULL DEFAULT '',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_moved_to_ns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_moved_to_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=binary AUTO_INCREMENT=97 ;

--
-- Dumping data for table `nw_recentchanges`
--

INSERT INTO `nw_recentchanges` (`rc_id`, `rc_timestamp`, `rc_cur_time`, `rc_user`, `rc_user_text`, `rc_namespace`, `rc_title`, `rc_comment`, `rc_minor`, `rc_bot`, `rc_new`, `rc_cur_id`, `rc_this_oldid`, `rc_last_oldid`, `rc_type`, `rc_moved_to_ns`, `rc_moved_to_title`, `rc_patrolled`, `rc_ip`, `rc_old_len`, `rc_new_len`, `rc_deleted`, `rc_logid`, `rc_log_type`, `rc_log_action`, `rc_params`) VALUES
(1, '20110214151007', '20110214151007', 1, 'Admin', 0, 'Eggdrop', 'Created page with ''''''''Installing eggdrop'''''' sudo apt-get install eggdrop adduser eggdrop  ''''''Installing new bot'''''' .conf file -m''', 0, 0, 1, 2, 2, 0, 1, 0, '', 1, '220.233.24.79', 0, 109, 0, 0, NULL, '', ''),
(2, '20110214151041', '20110214151041', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 3, 2, 0, 0, '', 1, '220.233.24.79', 109, 124, 0, 0, NULL, '', ''),
(3, '20110214151410', '20110214151410', 1, 'Admin', 0, 'IRC_Server', 'Created page with ''''''''Installing ircd-hybrid'''''' <br>sudo apt-get install ircd-hybrid <br>edit /etc/ircd-hybrid/ircd.conf <br>edit /etc/ircd-hybrid/ircd.motd <br>sudo /etc/init.d/ircd-hybrid restart…''', 0, 0, 1, 3, 4, 0, 1, 0, '', 1, '220.233.24.79', 0, 318, 0, 0, NULL, '', ''),
(4, '20110214151423', '20110214151423', 1, 'Admin', 0, 'IRC_Server', '', 0, 0, 0, 3, 5, 4, 0, 0, '', 1, '220.233.24.79', 318, 319, 0, 0, NULL, '', ''),
(5, '20110214151431', '20110214151431', 1, 'Admin', 0, 'IRC_Server', '', 0, 0, 0, 3, 6, 5, 0, 0, '', 1, '220.233.24.79', 319, 315, 0, 0, NULL, '', ''),
(6, '20110214152800', '20110214152800', 1, 'Admin', 0, 'Wordpress', 'Created page with ''''''''Installing Wordpress'''''' <br>wget http://wordpress.org/latest.tar.gz <br>tar xzvf latest.tar.gz <br>sudo mv wordpress /var/www/nameofblog <br>cd /var/www/nameofblog <br>sudo mv…''', 0, 0, 1, 4, 7, 0, 1, 0, '', 1, '220.233.24.79', 0, 365, 0, 0, NULL, '', ''),
(7, '20110214153446', '20110214153446', 1, 'Admin', 0, 'SSH', 'Created page with ''''''''Secure SSH server'''''' sudo nano /etc/ssh/sshd_config Disable root login Enable login only for certain users Change SSH port from 22 to something else''', 0, 0, 1, 5, 8, 0, 1, 0, '', 1, '220.233.24.79', 0, 151, 0, 0, NULL, '', ''),
(8, '20110214153649', '20110214153649', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 9, 8, 0, 0, '', 1, '220.233.24.79', 151, 321, 0, 0, NULL, '', ''),
(9, '20110214153904', '20110214153904', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 10, 9, 0, 0, '', 1, '220.233.24.79', 321, 341, 0, 0, NULL, '', ''),
(10, '20110214153922', '20110214153922', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 11, 10, 0, 0, '', 1, '220.233.24.79', 341, 337, 0, 0, NULL, '', ''),
(11, '20110214153951', '20110214153951', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 12, 11, 0, 0, '', 1, '220.233.24.79', 337, 365, 0, 0, NULL, '', ''),
(12, '20110214160242', '20110214160242', 1, 'Admin', 0, 'Network_Interfaces', 'Created page with ''''''''Setting a static IP for a network interface'''''' <br> This file describes the network interfaces available on your system <br> and how to activate them. For more information, se…''', 0, 0, 1, 6, 13, 0, 1, 0, '', 1, '220.233.24.79', 0, 531, 0, 0, NULL, '', ''),
(13, '20110214160324', '20110214160324', 1, 'Admin', 0, 'Network_Interfaces', '', 0, 0, 0, 6, 14, 13, 0, 0, '', 1, '220.233.24.79', 531, 614, 0, 0, NULL, '', ''),
(14, '20110308092940', '20110308092940', 1, 'Admin', 0, 'IRC_Server', '', 0, 0, 0, 3, 15, 6, 0, 0, '', 1, '220.233.24.79', 315, 1342, 0, 0, NULL, '', ''),
(15, '20110308092956', '20110308092956', 1, 'Admin', 0, 'IRC_Server', '', 0, 0, 0, 3, 16, 15, 0, 0, '', 1, '220.233.24.79', 1342, 1347, 0, 0, NULL, '', ''),
(16, '20110308093021', '20110308093021', 1, 'Admin', 0, 'IRC_Server', '', 0, 0, 0, 3, 17, 16, 0, 0, '', 1, '220.233.24.79', 1347, 1352, 0, 0, NULL, '', ''),
(17, '20110308120502', '20110308120502', 0, '220.233.24.79', 0, 'Eggdrop', '', 0, 0, 0, 2, 18, 3, 0, 0, '', 0, '220.233.24.79', 124, 458, 0, 0, NULL, '', ''),
(18, '20110308132332', '20110308132332', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 19, 18, 0, 0, '', 1, '220.233.24.79', 458, 531, 0, 0, NULL, '', ''),
(19, '20110308142406', '20110308142406', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 20, 19, 0, 0, '', 1, '220.233.24.79', 531, 732, 0, 0, NULL, '', ''),
(20, '20110308144223', '20110308144223', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 21, 20, 0, 0, '', 1, '220.233.24.79', 732, 899, 0, 0, NULL, '', ''),
(21, '20110309073316', '20110309073316', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 22, 12, 0, 0, '', 1, '220.233.24.79', 365, 434, 0, 0, NULL, '', ''),
(22, '20110309073329', '20110309073329', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 23, 22, 0, 0, '', 1, '220.233.24.79', 434, 440, 0, 0, NULL, '', ''),
(23, '20110309075258', '20110309075258', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 24, 21, 0, 0, '', 1, '220.233.24.79', 899, 931, 0, 0, NULL, '', ''),
(24, '20110309075503', '20110309075503', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 25, 23, 0, 0, '', 1, '220.233.24.79', 440, 463, 0, 0, NULL, '', ''),
(25, '20110309075719', '20110309075719', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 26, 25, 0, 0, '', 1, '220.233.24.79', 463, 645, 0, 0, NULL, '', ''),
(26, '20110309075759', '20110309075759', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 27, 26, 0, 0, '', 1, '220.233.24.79', 645, 646, 0, 0, NULL, '', ''),
(27, '20110309083859', '20110309083859', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 28, 24, 0, 0, '', 1, '220.233.24.79', 931, 1159, 0, 0, NULL, '', ''),
(28, '20110309084317', '20110309084317', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 29, 28, 0, 0, '', 1, '220.233.24.79', 1159, 1231, 0, 0, NULL, '', ''),
(29, '20110309084514', '20110309084514', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 30, 29, 0, 0, '', 1, '220.233.24.79', 1231, 1207, 0, 0, NULL, '', ''),
(30, '20110309084539', '20110309084539', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 31, 30, 0, 0, '', 1, '220.233.24.79', 1207, 1222, 0, 0, NULL, '', ''),
(31, '20110309084620', '20110309084620', 1, 'Admin', 0, 'Eggdrop', '', 0, 0, 0, 2, 32, 31, 0, 0, '', 1, '220.233.24.79', 1222, 1209, 0, 0, NULL, '', ''),
(32, '20110309085044', '20110309085044', 1, 'Admin', 0, 'Wordpress', '', 0, 0, 0, 4, 33, 7, 0, 0, '', 1, '220.233.24.79', 365, 369, 0, 0, NULL, '', ''),
(33, '20110309085230', '20110309085230', 1, 'Admin', 0, 'MediaWiki', 'Created page with ''''''''Installing MediaWiki'''''' <br>Followed this guide, works perfect. Will maybe steal the words later to save time opening another website -  <br>http://www.mediawiki.org/wiki/Manu…''', 0, 0, 1, 7, 34, 0, 1, 0, '', 1, '220.233.24.79', 0, 217, 0, 0, NULL, '', ''),
(34, '20110309085438', '20110309085438', 1, 'Admin', 0, 'Main_Page', '', 0, 0, 0, 1, 35, 1, 0, 0, '', 1, '220.233.24.79', 449, 63, 0, 0, NULL, '', ''),
(35, '20110309085452', '20110309085452', 1, 'Admin', 0, 'Main_Page', '', 0, 0, 0, 1, 36, 35, 0, 0, '', 1, '220.233.24.79', 63, 84, 0, 0, NULL, '', ''),
(36, '20110309085551', '20110309085551', 1, 'Admin', 0, 'Main_Page', '', 0, 0, 0, 1, 37, 36, 0, 0, '', 1, '220.233.24.79', 84, 84, 0, 0, NULL, '', ''),
(37, '20110310205822', '20110310205822', 1, 'Admin', 0, 'Git', 'Created page with ''''''''Installing git'''''' <br>Based on 10.04 Server  <br>$ sudo aptitude build-dep git-core <br>$ wget http://kernel.org/pub/software/scm/git/git-1.7.1.tar.gz (check latest version) <…''', 0, 0, 1, 8, 38, 0, 1, 0, '', 1, '220.233.24.79', 0, 352, 0, 0, NULL, '', ''),
(38, '20110310211002', '20110310211002', 1, 'Admin', 0, 'Git', '', 0, 0, 0, 8, 39, 38, 0, 0, '', 1, '220.233.24.79', 352, 761, 0, 0, NULL, '', ''),
(39, '20110310211216', '20110310211216', 1, 'Admin', 0, 'Git', '', 0, 0, 0, 8, 40, 39, 0, 0, '', 1, '220.233.24.79', 761, 1049, 0, 0, NULL, '', ''),
(40, '20110310212353', '20110310212353', 1, 'Admin', 0, 'MediaWiki', '', 0, 0, 0, 7, 41, 34, 0, 0, '', 1, '220.233.24.79', 217, 526, 0, 0, NULL, '', ''),
(41, '20110310212522', '20110310212522', 1, 'Admin', 0, 'MediaWiki', '', 0, 0, 0, 7, 42, 41, 0, 0, '', 1, '220.233.24.79', 526, 655, 0, 0, NULL, '', ''),
(42, '20110310212538', '20110310212538', 1, 'Admin', 0, 'MediaWiki', '', 0, 0, 0, 7, 43, 42, 0, 0, '', 1, '220.233.24.79', 655, 661, 0, 0, NULL, '', ''),
(43, '20110310212551', '20110310212551', 1, 'Admin', 0, 'MediaWiki', '', 0, 0, 0, 7, 44, 43, 0, 0, '', 1, '220.233.24.79', 661, 686, 0, 0, NULL, '', ''),
(44, '20110311002503', '20110311002503', 1, 'Admin', 0, 'Wordpress', '', 0, 0, 0, 4, 45, 33, 0, 0, '', 1, '220.233.24.79', 369, 625, 0, 0, NULL, '', ''),
(45, '20110311004156', '20110311004156', 1, 'Admin', 0, 'Honeypot', 'Created page with ''''''''Installing Kippo honeypot'''''' Based on 10.04 Server apt-get install all those things mysql setup adduser kippo svn download kippo googlecode Edit .cfg file start.sh''', 0, 0, 1, 9, 46, 0, 1, 0, '', 1, '220.233.24.79', 0, 166, 0, 0, NULL, '', ''),
(46, '20110311013045', '20110311013045', 1, 'Admin', 0, 'Wordpress', '', 0, 0, 0, 4, 47, 45, 0, 0, '', 1, '220.233.24.79', 625, 1628, 0, 0, NULL, '', ''),
(47, '20110313151210', '20110313151210', 1, 'Admin', 0, 'MediaWiki', '', 0, 0, 0, 7, 48, 44, 0, 0, '', 1, '220.233.24.79', 686, 1332, 0, 0, NULL, '', ''),
(48, '20110313151350', '20110313151350', 1, 'Admin', 0, 'PhpMyAdmin', 'Created page with ''''''''Installing phpMyAdmin'''''' <br>apt-get install phpmyadmin <br>Set apache2 virtual host or redirect to /usr/share/phpmyadmin''', 0, 0, 1, 10, 49, 0, 1, 0, '', 1, '220.233.24.79', 0, 124, 0, 0, NULL, '', ''),
(49, '20110313151839', '20110313151839', 1, 'Admin', 0, 'Leagueofevil.org', 'Created page with ''''''''Steps to setup server'''''' <br>$ adduser newuser <br>(use ''visudo'' as root to add new user to sudoers) <br>$ adduser eggdrop <br>$ apt-get install ircd-hybrid <br>$ apt-get inst…''', 0, 0, 1, 11, 50, 0, 1, 0, '', 1, '220.233.24.79', 0, 629, 0, 0, NULL, '', ''),
(50, '20110314130201', '20110314130201', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 51, 27, 0, 0, '', 1, '220.233.24.79', 646, 827, 0, 0, NULL, '', ''),
(51, '20110314130314', '20110314130314', 1, 'Admin', 0, 'Misc_CLI_Commands', 'Created page with ''$ sudo netstat -tpl''', 0, 0, 1, 12, 52, 0, 1, 0, '', 1, '220.233.24.79', 0, 19, 0, 0, NULL, '', ''),
(52, '20110314130810', '20110314130810', 2, 'Lag', 2, 'Lag', '', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '118.209.112.75', NULL, NULL, 0, 51, 'newusers', 'create', 0x32),
(53, '20110314163634', '20110314163634', 1, 'Admin', 2, 'Lag', '', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '220.233.24.79', NULL, NULL, 0, 52, 'rights', 'rights', 0x0a7379736f702c2062757265617563726174),
(54, '20110314170018', '20110314170018', 1, 'Admin', 0, 'Wordpress', '', 0, 0, 0, 4, 53, 47, 0, 0, '', 1, '220.233.24.79', 1628, 1626, 0, 0, NULL, '', ''),
(55, '20110314172522', '20110314172522', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 54, 51, 0, 0, '', 1, '220.233.24.79', 827, 2609, 0, 0, NULL, '', ''),
(56, '20110314173323', '20110314173323', 1, 'Admin', 0, 'SSH', '', 0, 0, 0, 5, 55, 54, 0, 0, '', 1, '220.233.24.79', 2609, 2733, 0, 0, NULL, '', ''),
(57, '20110314225731', '20110314225731', 1, 'Admin', 0, 'Honeypot', '', 0, 0, 0, 9, 56, 46, 0, 0, '', 1, '220.233.24.79', 166, 1013, 0, 0, NULL, '', ''),
(58, '20110314225844', '20110314225844', 1, 'Admin', 0, 'Honeypot', '', 0, 0, 0, 9, 57, 56, 0, 0, '', 1, '220.233.24.79', 1013, 1101, 0, 0, NULL, '', ''),
(59, '20110314225918', '20110314225918', 1, 'Admin', 0, 'Honeypot', '', 0, 0, 0, 9, 58, 57, 0, 0, '', 1, '220.233.24.79', 1101, 1104, 0, 0, NULL, '', ''),
(60, '20110314230728', '20110314230728', 1, 'Admin', 0, 'Misc_CLI_Commands', '', 0, 0, 0, 12, 59, 52, 0, 0, '', 1, '220.233.24.79', 19, 409, 0, 0, NULL, '', ''),
(61, '20110314233620', '20110314233620', 2, 'Lag', 0, 'Login', 'Created page with ''add login background jpg to <code>/usr/share/backgrounds</code> using sudo for permissions  then <code>sudo cp /usr/share/applications/gnome-appearance-properties.desktop /usr/sh…''', 0, 0, 1, 13, 60, 0, 1, 0, '', 1, '118.209.112.75', 0, 501, 0, 0, NULL, '', ''),
(62, '20110314235802', '20110314235802', 2, 'Lag', 0, 'SSH', '# added ssh login banner details', 0, 0, 0, 5, 61, 55, 0, 0, '', 1, '118.209.112.75', 2733, 3348, 0, 0, NULL, '', ''),
(63, '20110318015655', '20110318015655', 1, 'Admin', 0, 'Git', 'Added a bunch more info about branches and remote repos', 0, 0, 0, 8, 62, 40, 0, 0, '', 1, '220.233.24.79', 1049, 1989, 0, 0, NULL, '', ''),
(64, '20110318015739', '20110318015739', 1, 'Admin', 0, 'Git', '', 1, 0, 0, 8, 63, 62, 0, 0, '', 1, '220.233.24.79', 1989, 1989, 0, 0, NULL, '', ''),
(65, '20110318020254', '20110318020254', 1, 'Admin', 0, 'Grep', 'Created grep', 0, 0, 1, 14, 64, 0, 1, 0, '', 1, '220.233.24.79', 0, 401, 0, 0, NULL, '', ''),
(66, '20110318020429', '20110318020429', 1, 'Admin', 0, 'Grep', 'Added ls and a $ sign', 1, 0, 0, 14, 65, 64, 0, 0, '', 1, '220.233.24.79', 401, 473, 0, 0, NULL, '', ''),
(67, '20110318020819', '20110318020819', 1, 'Admin', 0, 'Git', 'Added <code> tages', 1, 0, 0, 8, 66, 63, 0, 0, '', 1, '220.233.24.79', 1989, 2131, 0, 0, NULL, '', ''),
(68, '20110318021232', '20110318021232', 1, 'Admin', 0, 'Git', 'Capital letter adjustment', 1, 0, 0, 8, 67, 66, 0, 0, '', 1, '220.233.24.79', 2131, 2131, 0, 0, NULL, '', ''),
(69, '20110318021334', '20110318021334', 1, 'Admin', 0, 'Grep', 'Added <code> tages', 1, 0, 0, 14, 68, 65, 0, 0, '', 1, '220.233.24.79', 473, 513, 0, 0, NULL, '', ''),
(70, '20110318022946', '20110318022946', 1, 'Admin', 0, 'Git', '', 1, 0, 0, 8, 69, 67, 0, 0, '', 1, '220.233.24.79', 2131, 2167, 0, 0, NULL, '', ''),
(71, '20110320224833', '20110320224833', 1, 'Admin', 0, 'Mac_Terminal_Commands', 'Created page', 0, 0, 1, 15, 70, 0, 1, 0, '', 1, '220.233.24.79', 0, 996, 0, 0, NULL, '', ''),
(72, '20110320224931', '20110320224931', 1, 'Admin', 0, 'Mac_Terminal_Commands', '', 0, 0, 0, 15, 0, 0, 3, 0, '', 1, '220.233.24.79', NULL, NULL, 0, 71, 'protect', 'protect', 0x5b656469743d7379736f705d2028696e646566696e69746529205b6d6f76653d7379736f705d2028696e646566696e697465290a),
(73, '20110321135043', '20110321135043', 1, 'Admin', 0, 'Mac_Terminal_Commands', 'Fixed typo and edited opensnoop', 1, 0, 0, 15, 72, 71, 0, 0, '', 1, '220.233.24.79', 996, 1176, 0, 0, NULL, '', ''),
(74, '20110321165742', '20110321165742', 1, 'Admin', 0, 'SSH', 'Changed formatting, added <code> tags', 1, 0, 0, 5, 73, 61, 0, 0, '', 1, '220.233.24.79', 3348, 3411, 0, 0, NULL, '', ''),
(75, '20110321170407', '20110321170407', 1, 'Admin', 0, 'Wordpress', 'Changed formatting, added <code> tags', 1, 0, 0, 4, 74, 53, 0, 0, '', 1, '220.233.24.79', 1626, 1674, 0, 0, NULL, '', ''),
(76, '20110321170541', '20110321170541', 1, 'Admin', 0, 'Misc_CLI_Commands', '', 0, 0, 0, 12, 75, 59, 0, 0, '', 1, '220.233.24.79', 409, 459, 0, 0, NULL, '', ''),
(77, '20110321170609', '20110321170609', 1, 'Admin', 0, 'Misc_CLI_Commands', 'Changed formatting, added <code> tags', 1, 0, 0, 12, 76, 75, 0, 0, '', 1, '220.233.24.79', 459, 445, 0, 0, NULL, '', ''),
(78, '20110321170850', '20110321170850', 1, 'Admin', 0, 'Honeypot', 'Changed formatting, added <code> tags', 1, 0, 0, 9, 77, 58, 0, 0, '', 1, '220.233.24.79', 1104, 1155, 0, 0, NULL, '', ''),
(79, '20110321171654', '20110321171654', 1, 'Admin', 0, 'Eggdrop', 'Changed formatting, added <code> tags', 1, 0, 0, 2, 78, 32, 0, 0, '', 1, '220.233.24.79', 1209, 1306, 0, 0, NULL, '', ''),
(80, '20110321172039', '20110321172039', 1, 'Admin', 0, 'MediaWiki', 'Changed formatting, added <code> tags', 1, 0, 0, 7, 79, 48, 0, 0, '', 1, '220.233.24.79', 1332, 1351, 0, 0, NULL, '', ''),
(81, '20110321172338', '20110321172338', 1, 'Admin', 0, 'IRC_Server', 'Changed formatting, added <code> tags', 1, 0, 0, 3, 80, 17, 0, 0, '', 1, '220.233.24.79', 1352, 1384, 0, 0, NULL, '', ''),
(82, '20110321181615', '20110321181615', 1, 'Admin', 0, 'Network_Interfaces', 'Changed formatting, added <code> tags', 1, 0, 0, 6, 81, 14, 0, 0, '', 1, '220.233.24.79', 614, 732, 0, 0, NULL, '', ''),
(83, '20110321182346', '20110321182346', 1, 'Admin', 0, 'Grep', '', 1, 0, 0, 14, 82, 68, 0, 0, '', 1, '220.233.24.79', 513, 484, 0, 0, NULL, '', ''),
(84, '20110321233712', '20110321233712', 1, 'Admin', 0, 'Mac_Terminal_Commands', 'Added drutil', 1, 0, 0, 15, 83, 72, 0, 0, '', 1, '17.233.140.173', 1176, 1268, 0, 0, NULL, '', ''),
(85, '20110321233733', '20110321233733', 1, 'Admin', 0, 'Mac_Terminal_Commands', '', 1, 0, 0, 15, 84, 83, 0, 0, '', 1, '17.233.140.173', 1268, 1266, 0, 0, NULL, '', ''),
(86, '20110328111953', '20110328111953', 2, 'Lag', 0, 'Indicator_applet', 'Created page with ''Remove Evolution from the Indicator Applet notifier in the system tray:  sudo apt-get remove evolution-ind  sudo apt-get remove evolution-indicator  sudo apt-get remove indicator…''', 0, 0, 1, 16, 85, 0, 1, 0, '', 1, '27.32.195.47', 0, 573, 0, 0, NULL, '', ''),
(87, '20110410110022', '20110410110022', 1, 'Admin', 0, 'SSH', 'Added section on running remote commands', 1, 0, 0, 5, 86, 73, 0, 0, '', 1, '220.233.24.79', 3411, 3640, 0, 0, NULL, '', ''),
(88, '20110505140516', '20110505140516', 2, 'Lag', 0, 'Grub', 'Created page with ''<code>/boot/grub/grub.cfg</code> is auto generated by <code>update-grub</code>  The primary configuration file for changing menu display settings is /etc/default/grub.  There are…''', 0, 0, 1, 17, 87, 0, 1, 0, '', 1, '27.32.195.47', 0, 304, 0, 0, NULL, '', ''),
(89, '20110508113113', '20110508113113', 1, 'Admin', 0, 'Misc_CLI_Commands', 'Added ''Change timezone'' section', 1, 0, 0, 12, 88, 76, 0, 0, '', 1, '220.233.24.79', 445, 518, 0, 0, NULL, '', ''),
(90, '20110508141822', '20110508141822', 1, 'Admin', 0, 'Git', 'Added GitHub section', 0, 0, 0, 8, 89, 69, 0, 0, '', 1, '220.233.24.79', 2167, 2906, 0, 0, NULL, '', ''),
(91, '20110508141851', '20110508141851', 1, 'Admin', 0, 'Git', 'Edited typo', 1, 0, 0, 8, 90, 89, 0, 0, '', 1, '220.233.24.79', 2906, 2906, 0, 0, NULL, '', ''),
(92, '20110508141927', '20110508141927', 1, 'Admin', 0, 'Git', 'Edited yet another typo', 1, 0, 0, 8, 91, 90, 0, 0, '', 1, '220.233.24.79', 2906, 2910, 0, 0, NULL, '', ''),
(93, '20110508160627', '20110508160627', 1, 'Admin', 0, 'Git', '', 0, 0, 0, 8, 92, 91, 0, 0, '', 1, '220.233.24.79', 2910, 3052, 0, 0, NULL, '', ''),
(94, '20110509082657', '20110509082657', 1, 'Admin', 0, 'Apache', 'Created page', 0, 0, 1, 18, 93, 0, 1, 0, '', 1, '220.233.24.79', 0, 838, 0, 0, NULL, '', ''),
(95, '20110512083204', '20110512083204', 1, 'Admin', 0, 'Python', 'Created page', 0, 0, 1, 19, 94, 0, 1, 0, '', 1, '220.233.24.79', 0, 96, 0, 0, NULL, '', ''),
(96, '20110512083255', '20110512083255', 1, 'Admin', 0, 'Ruby', 'Created page', 0, 0, 1, 20, 95, 0, 1, 0, '', 1, '220.233.24.79', 0, 59, 0, 0, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `nw_redirect`
--

DROP TABLE IF EXISTS `nw_redirect`;
CREATE TABLE IF NOT EXISTS `nw_redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_redirect`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_revision`
--

DROP TABLE IF EXISTS `nw_revision`;
CREATE TABLE IF NOT EXISTS `nw_revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` tinyblob NOT NULL,
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024 AUTO_INCREMENT=96 ;

--
-- Dumping data for table `nw_revision`
--

INSERT INTO `nw_revision` (`rev_id`, `rev_page`, `rev_text_id`, `rev_comment`, `rev_user`, `rev_user_text`, `rev_timestamp`, `rev_minor_edit`, `rev_deleted`, `rev_len`, `rev_parent_id`) VALUES
(1, 1, 1, '', 0, 'MediaWiki default', '20110214142429', 0, 0, 449, 0),
(2, 2, 2, 0x43726561746564207061676520776974682027272727496e7374616c6c696e672065676764726f70272727207375646f206170742d67657420696e7374616c6c2065676764726f7020616464757365722065676764726f702020272727496e7374616c6c696e67206e657720626f74272727202e636f6e662066696c65202d6d27, 1, 'Admin', '20110214151007', 0, 0, 109, 0),
(3, 2, 3, '', 1, 'Admin', '20110214151041', 0, 0, 124, 2),
(4, 3, 4, 0x43726561746564207061676520776974682027272727496e7374616c6c696e6720697263642d687962726964272727203c62723e7375646f206170742d67657420696e7374616c6c20697263642d687962726964203c62723e65646974202f6574632f697263642d6879627269642f697263642e636f6e66203c62723e65646974202f6574632f697263642d6879627269642f697263642e6d6f7464203c62723e7375646f202f6574632f696e69742e642f697263642d6879627269642072657374617274e280a627, 1, 'Admin', '20110214151410', 0, 0, 318, 0),
(5, 3, 5, '', 1, 'Admin', '20110214151423', 0, 0, 319, 4),
(6, 3, 6, '', 1, 'Admin', '20110214151431', 0, 0, 315, 5),
(7, 4, 7, 0x43726561746564207061676520776974682027272727496e7374616c6c696e6720576f72647072657373272727203c62723e7767657420687474703a2f2f776f726470726573732e6f72672f6c61746573742e7461722e677a203c62723e74617220787a7666206c61746573742e7461722e677a203c62723e7375646f206d7620776f72647072657373202f7661722f7777772f6e616d656f66626c6f67203c62723e6364202f7661722f7777772f6e616d656f66626c6f67203c62723e7375646f206d76e280a627, 1, 'Admin', '20110214152800', 0, 0, 365, 0),
(8, 5, 8, 0x437265617465642070616765207769746820272727275365637572652053534820736572766572272727207375646f206e616e6f202f6574632f7373682f737368645f636f6e6669672044697361626c6520726f6f74206c6f67696e20456e61626c65206c6f67696e206f6e6c7920666f72206365727461696e207573657273204368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527, 1, 'Admin', '20110214153446', 0, 0, 151, 0),
(9, 5, 9, '', 1, 'Admin', '20110214153649', 0, 0, 321, 8),
(10, 5, 10, '', 1, 'Admin', '20110214153904', 0, 0, 341, 9),
(11, 5, 11, '', 1, 'Admin', '20110214153922', 0, 0, 337, 10),
(12, 5, 12, '', 1, 'Admin', '20110214153951', 0, 0, 365, 11),
(13, 6, 13, 0x4372656174656420706167652077697468202727272753657474696e6720612073746174696320495020666f722061206e6574776f726b20696e74657266616365272727203c62723e20546869732066696c652064657363726962657320746865206e6574776f726b20696e746572666163657320617661696c61626c65206f6e20796f75722073797374656d203c62723e20616e6420686f7720746f206163746976617465207468656d2e20466f72206d6f726520696e666f726d6174696f6e2c207365e280a627, 1, 'Admin', '20110214160243', 0, 0, 531, 0),
(14, 6, 14, '', 1, 'Admin', '20110214160324', 0, 0, 614, 13),
(15, 3, 15, '', 1, 'Admin', '20110308092940', 0, 0, 1342, 6),
(16, 3, 16, '', 1, 'Admin', '20110308092956', 0, 0, 1347, 15),
(17, 3, 17, '', 1, 'Admin', '20110308093021', 0, 0, 1352, 16),
(18, 2, 18, '', 0, '220.233.24.79', '20110308120502', 0, 0, 458, 3),
(19, 2, 19, '', 1, 'Admin', '20110308132332', 0, 0, 531, 18),
(20, 2, 20, '', 1, 'Admin', '20110308142406', 0, 0, 732, 19),
(21, 2, 21, '', 1, 'Admin', '20110308144223', 0, 0, 899, 20),
(22, 5, 22, '', 1, 'Admin', '20110309073316', 0, 0, 434, 12),
(23, 5, 23, '', 1, 'Admin', '20110309073329', 0, 0, 440, 22),
(24, 2, 24, '', 1, 'Admin', '20110309075258', 0, 0, 931, 21),
(25, 5, 25, '', 1, 'Admin', '20110309075503', 0, 0, 463, 23),
(26, 5, 26, '', 1, 'Admin', '20110309075719', 0, 0, 645, 25),
(27, 5, 27, '', 1, 'Admin', '20110309075759', 0, 0, 646, 26),
(28, 2, 28, '', 1, 'Admin', '20110309083859', 0, 0, 1159, 24),
(29, 2, 29, '', 1, 'Admin', '20110309084317', 0, 0, 1231, 28),
(30, 2, 30, '', 1, 'Admin', '20110309084514', 0, 0, 1207, 29),
(31, 2, 31, '', 1, 'Admin', '20110309084539', 0, 0, 1222, 30),
(32, 2, 32, '', 1, 'Admin', '20110309084620', 0, 0, 1209, 31),
(33, 4, 33, '', 1, 'Admin', '20110309085044', 0, 0, 369, 7),
(34, 7, 34, 0x43726561746564207061676520776974682027272727496e7374616c6c696e67204d6564696157696b69272727203c62723e466f6c6c6f77656420746869732067756964652c20776f726b7320706572666563742e2057696c6c206d6179626520737465616c2074686520776f726473206c6174657220746f20736176652074696d65206f70656e696e6720616e6f746865722077656273697465202d20203c62723e687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75e280a627, 1, 'Admin', '20110309085230', 0, 0, 217, 0),
(35, 1, 35, '', 1, 'Admin', '20110309085438', 0, 0, 63, 1),
(36, 1, 36, '', 1, 'Admin', '20110309085452', 0, 0, 84, 35),
(37, 1, 37, '', 1, 'Admin', '20110309085551', 0, 0, 84, 36),
(38, 8, 38, 0x43726561746564207061676520776974682027272727496e7374616c6c696e6720676974272727203c62723e4261736564206f6e2031302e30342053657276657220203c62723e24207375646f206170746974756465206275696c642d646570206769742d636f7265203c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e312e7461722e677a2028636865636b206c61746573742076657273696f6e29203ce280a627, 1, 'Admin', '20110310205822', 0, 0, 352, 0),
(39, 8, 39, '', 1, 'Admin', '20110310211002', 0, 0, 761, 38),
(40, 8, 40, '', 1, 'Admin', '20110310211216', 0, 0, 1049, 39),
(41, 7, 41, '', 1, 'Admin', '20110310212353', 0, 0, 526, 34),
(42, 7, 42, '', 1, 'Admin', '20110310212522', 0, 0, 655, 41),
(43, 7, 43, '', 1, 'Admin', '20110310212538', 0, 0, 661, 42),
(44, 7, 44, '', 1, 'Admin', '20110310212551', 0, 0, 686, 43),
(45, 4, 45, '', 1, 'Admin', '20110311002503', 0, 0, 625, 33),
(46, 9, 46, 0x43726561746564207061676520776974682027272727496e7374616c6c696e67204b6970706f20686f6e6579706f74272727204261736564206f6e2031302e303420536572766572206170742d67657420696e7374616c6c20616c6c2074686f7365207468696e6773206d7973716c2073657475702061646475736572206b6970706f2073766e20646f776e6c6f6164206b6970706f20676f6f676c65636f64652045646974202e6366672066696c652073746172742e736827, 1, 'Admin', '20110311004156', 0, 0, 166, 0),
(47, 4, 47, '', 1, 'Admin', '20110311013045', 0, 0, 1628, 45),
(48, 7, 48, '', 1, 'Admin', '20110313151210', 0, 0, 1332, 44),
(49, 10, 49, 0x43726561746564207061676520776974682027272727496e7374616c6c696e67207068704d7941646d696e272727203c62723e6170742d67657420696e7374616c6c207068706d7961646d696e203c62723e5365742061706163686532207669727475616c20686f7374206f7220726564697265637420746f202f7573722f73686172652f7068706d7961646d696e27, 1, 'Admin', '20110313151350', 0, 0, 124, 0),
(50, 11, 50, 0x43726561746564207061676520776974682027272727537465707320746f20736574757020736572766572272727203c62723e242061646475736572206e657775736572203c62723e28757365202776697375646f2720617320726f6f7420746f20616464206e6577207573657220746f207375646f65727329203c62723e2420616464757365722065676764726f70203c62723e24206170742d67657420696e7374616c6c20697263642d687962726964203c62723e24206170742d67657420696e7374e280a627, 1, 'Admin', '20110313151839', 0, 0, 629, 0),
(51, 5, 51, '', 1, 'Admin', '20110314130201', 0, 0, 827, 27),
(52, 12, 52, 0x4372656174656420706167652077697468202724207375646f206e657473746174202d74706c27, 1, 'Admin', '20110314130314', 0, 0, 19, 0),
(53, 4, 53, '', 1, 'Admin', '20110314170018', 0, 0, 1626, 47),
(54, 5, 54, '', 1, 'Admin', '20110314172522', 0, 0, 2609, 51),
(55, 5, 55, '', 1, 'Admin', '20110314173323', 0, 0, 2733, 54),
(56, 9, 56, '', 1, 'Admin', '20110314225731', 0, 0, 1013, 46),
(57, 9, 57, '', 1, 'Admin', '20110314225844', 0, 0, 1101, 56),
(58, 9, 58, '', 1, 'Admin', '20110314225918', 0, 0, 1104, 57),
(59, 12, 59, '', 1, 'Admin', '20110314230728', 0, 0, 409, 52),
(60, 13, 60, 0x43726561746564207061676520776974682027616464206c6f67696e206261636b67726f756e64206a706720746f203c636f64653e2f7573722f73686172652f6261636b67726f756e64733c2f636f64653e207573696e67207375646f20666f72207065726d697373696f6e7320207468656e203c636f64653e7375646f206370202f7573722f73686172652f6170706c69636174696f6e732f676e6f6d652d617070656172616e63652d70726f706572746965732e6465736b746f70202f7573722f7368e280a627, 2, 'Lag', '20110314233620', 0, 0, 501, 0),
(61, 5, 61, 0x2320616464656420737368206c6f67696e2062616e6e65722064657461696c73, 2, 'Lag', '20110314235802', 0, 0, 3348, 55),
(62, 8, 62, 0x416464656420612062756e6368206d6f726520696e666f2061626f7574206272616e6368657320616e642072656d6f7465207265706f73, 1, 'Admin', '20110318015655', 0, 0, 1989, 40),
(63, 8, 63, '', 1, 'Admin', '20110318015739', 1, 0, 1989, 62),
(64, 14, 64, 0x437265617465642067726570, 1, 'Admin', '20110318020255', 0, 0, 401, 0),
(65, 14, 65, 0x4164646564206c7320616e6420612024207369676e, 1, 'Admin', '20110318020429', 1, 0, 473, 64),
(66, 8, 66, 0x4164646564203c636f64653e207461676573, 1, 'Admin', '20110318020819', 1, 0, 2131, 63),
(67, 8, 67, 0x4361706974616c206c65747465722061646a7573746d656e74, 1, 'Admin', '20110318021232', 1, 0, 2131, 66),
(68, 14, 68, 0x4164646564203c636f64653e207461676573, 1, 'Admin', '20110318021334', 1, 0, 513, 65),
(69, 8, 69, '', 1, 'Admin', '20110318022946', 1, 0, 2167, 67),
(70, 15, 70, 0x437265617465642070616765, 1, 'Admin', '20110320224833', 0, 0, 996, 0),
(71, 15, 70, 0x50726f74656374656420225b5b4d6163205465726d696e616c20436f6d6d616e64735d5d2220285b656469743d7379736f705d2028696e646566696e69746529205b6d6f76653d7379736f705d2028696e646566696e6974652929, 1, 'Admin', '20110320224931', 1, 0, 996, 70),
(72, 15, 71, 0x4669786564207479706f20616e6420656469746564206f70656e736e6f6f70, 1, 'Admin', '20110321135043', 1, 0, 1176, 71),
(73, 5, 72, 0x4368616e67656420666f726d617474696e672c206164646564203c636f64653e2074616773, 1, 'Admin', '20110321165742', 1, 0, 3411, 61),
(74, 4, 73, 0x4368616e67656420666f726d617474696e672c206164646564203c636f64653e2074616773, 1, 'Admin', '20110321170407', 1, 0, 1674, 53),
(75, 12, 74, '', 1, 'Admin', '20110321170541', 0, 0, 459, 59),
(76, 12, 75, 0x4368616e67656420666f726d617474696e672c206164646564203c636f64653e2074616773, 1, 'Admin', '20110321170609', 1, 0, 445, 75),
(77, 9, 76, 0x4368616e67656420666f726d617474696e672c206164646564203c636f64653e2074616773, 1, 'Admin', '20110321170850', 1, 0, 1155, 58),
(78, 2, 77, 0x4368616e67656420666f726d617474696e672c206164646564203c636f64653e2074616773, 1, 'Admin', '20110321171654', 1, 0, 1306, 32),
(79, 7, 78, 0x4368616e67656420666f726d617474696e672c206164646564203c636f64653e2074616773, 1, 'Admin', '20110321172039', 1, 0, 1351, 48),
(80, 3, 79, 0x4368616e67656420666f726d617474696e672c206164646564203c636f64653e2074616773, 1, 'Admin', '20110321172338', 1, 0, 1384, 17),
(81, 6, 80, 0x4368616e67656420666f726d617474696e672c206164646564203c636f64653e2074616773, 1, 'Admin', '20110321181615', 1, 0, 732, 14),
(82, 14, 81, '', 1, 'Admin', '20110321182346', 1, 0, 484, 68),
(83, 15, 82, 0x41646465642064727574696c, 1, 'Admin', '20110321233712', 1, 0, 1268, 72),
(84, 15, 83, '', 1, 'Admin', '20110321233733', 1, 0, 1266, 83),
(85, 16, 84, 0x4372656174656420706167652077697468202752656d6f76652045766f6c7574696f6e2066726f6d2074686520496e64696361746f72204170706c6574206e6f74696669657220696e207468652073797374656d20747261793a20207375646f206170742d6765742072656d6f76652065766f6c7574696f6e2d696e6420207375646f206170742d6765742072656d6f76652065766f6c7574696f6e2d696e64696361746f7220207375646f206170742d6765742072656d6f766520696e64696361746f72e280a627, 2, 'Lag', '20110328111953', 0, 0, 573, 0),
(86, 5, 85, 0x41646465642073656374696f6e206f6e2072756e6e696e672072656d6f746520636f6d6d616e6473, 1, 'Admin', '20110410110022', 1, 0, 3640, 73),
(87, 17, 86, 0x437265617465642070616765207769746820273c636f64653e2f626f6f742f677275622f677275622e6366673c2f636f64653e206973206175746f2067656e657261746564206279203c636f64653e7570646174652d677275623c2f636f64653e2020546865207072696d61727920636f6e66696775726174696f6e2066696c6520666f72206368616e67696e67206d656e7520646973706c61792073657474696e6773206973202f6574632f64656661756c742f677275622e2020546865726520617265e280a627, 2, 'Lag', '20110505140516', 0, 0, 304, 0),
(88, 12, 87, 0x416464656420274368616e67652074696d657a6f6e65272073656374696f6e, 1, 'Admin', '20110508113113', 1, 0, 518, 76),
(89, 8, 88, 0x4164646564204769744875622073656374696f6e, 1, 'Admin', '20110508141822', 0, 0, 2906, 69),
(90, 8, 89, 0x456469746564207479706f, 1, 'Admin', '20110508141851', 1, 0, 2906, 89),
(91, 8, 90, 0x4564697465642079657420616e6f74686572207479706f, 1, 'Admin', '20110508141927', 1, 0, 2910, 90),
(92, 8, 91, '', 1, 'Admin', '20110508160627', 0, 0, 3052, 91),
(93, 18, 92, 0x437265617465642070616765, 1, 'Admin', '20110509082657', 0, 0, 838, 0),
(94, 19, 93, 0x437265617465642070616765, 1, 'Admin', '20110512083204', 0, 0, 96, 0),
(95, 20, 94, 0x437265617465642070616765, 1, 'Admin', '20110512083256', 0, 0, 59, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nw_searchindex`
--

DROP TABLE IF EXISTS `nw_searchindex`;
CREATE TABLE IF NOT EXISTS `nw_searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nw_searchindex`
--

INSERT INTO `nw_searchindex` (`si_page`, `si_title`, `si_text`) VALUES
(2, 'eggdrop', '  installing eggdrop  sudo aptu800-getu800 install eggdrop adduser eggdrop make eggdrop au800 sudoer oru800 youu800''llu800 have tou800 chown from au800 sudoer user edit .conf file sudo chmod 777u800 usru800 libu800 eggdrop -ru800 lnu800 -su800 usru800 libu800 eggdrop modules home youruser modules lnu800 -su800 usru800 share eggdrop scripts home youruser scripts eggdrop home youruser simpleu82econf  installing newu800 botu800  useu800 .conf file google ''simpleu82econf eggdrop'' foru800 au800 good starter file. much more options areu800 avaliable. eggdrop -mu800 whateveru82econf will start eggdrop inu800 newu800 botu800 mode telnet inu800 using port from conf file - telnet localhost 20666 enter ''newu800'' asu800 username then will prompt tou800 make au800 newu800 user andu800 setu800 youu800 asu800 owner commands found here - .chanadd #thoughtmaybe isu800 this right .chanset autoop #thoughtmaybe  aliceu82etclu800  .chanset #thoughtmaybe alice  errors andu800 workarounds  ifu800 getting au800 ''could notu800 write tou800 temp'' error upon start ofu800 botu800 addu800 this tou800 .conf file andu800 make au800 tmpu800 directory owned byu800 eggdrop user inu800 home folder oru800 same folder asu800 .conf file - # setu800 here au800 place tou800 store temporary files. setu800 temp-path tmpu800 '),
(3, 'ircu800 server', '  installing ircd-hybrid  sudo aptu800-getu800 install ircd-hybrid edit etcu800 ircd-hybrid ircdu82econf andu800 change this - listen port theu800 specific port tou800 listen onu800. ifu800 nou800 host isu800 specified before itu800 will listen onu800 allu800 available ipsu800. ports areu800 seperated viau800 au800 comma au800 range mayu800 beu800 specified using u8e2809c..u8e2809d port listen onu800 allu800 available ipsu800 ports 6665 tou800 6669 host u8e2809c127u82e0u800u82e0u800u82e1u8e280b3; # change this port 6665 .. 6669; ; tou800 something like this - listen port theu800 specific port tou800 listen onu800. ifu800 nou800 host isu800 specified before itu800 will listen onu800 allu800 available ipsu800. ports areu800 seperated viau800 au800 comma au800 range mayu800 beu800 specified using u8e2809c..u8e2809d port listen onu800 allu800 available ipsu800 ports 6665 tou800 6669 # comment outu800 completely host u8e2809c127u82e0u800u82e0u800u82e1u8e280b3; # change this port 6667; ; stolen from edit etcu800 ircd-hybrid ircdu82emotd sudo etcu800 initu82edu800 ircd-hybrid restart  installing irssi tou800 connect tou800 ircu800 server  sudo aptu800-getu800 install irssi connect 127u800u82e0u800u82e0u800u82e1u800 hostname will beu800 spoofed. '),
(4, 'wordpress', '  installing wordpress  wget taru800 xzvf latestu82etaru800u82egzu800 sudo mvu800 wordpress varu800 wwwu800 nameofblog cdu800 varu800 wwwu800 nameofblog sudo mvu800 wpu800-config-sampleu82ephpu800 wpu800-configu82ephpu800 sudo nano wpu800-configu82ephpu800 addu800 details ofu800 mysql table foru800 blog mysql username andu800 password. then goto blog inu800 browser tou800 finish installation.  moving blog tou800 newu800 server  follow instructions from wordpress site - make blog directory owner andu800 group ''wwwu800-data'' same asu800 user running apache.  chmod allu800 directories 755u800 allu800 files 644u800 -  find your path here -type du800 -exec chmod 755u800 ; find your path here -type fu800 -exec chmod 644u800 ; chmod 777u800 wpu800-content uploads  change urls inu800 mysql with phpmyadmin  click onu800 blog database then wp_options runu800 sqlu800 command - update wp_options setu800 option_value replace option_value '' '' '' '' where option_name ''home'' oru800 option_name ''siteurl''; click wp_posts runu800 sqlu800 command - update wp_posts setu800 guid replace guid '' '' '' '' ; andu800 - update wp_posts setu800 post_content replace post_content '' '' '' '' ;  errors andu800 workarounds  mayu800 have tou800 adjust permalinks inu800 wordpress settings ifu800 clicking onu800 categories andu800 posts leads tou800 au800 404u800 error after au800 move. '),
(5, 'sshu800', '  secure sshu800 server  sudo nano etcu800 sshu800 sshd_config disable root login andu800 enable login only foru800 certain users authentication logingracetime 120u800 permitrootlogin nou800 allowusers jlu800 eggdrop jore strictmodes yesu800 change sshu800 port from 22u800 tou800 something else what ports ipsu800 andu800 protocols weu800 listen foru800 port 14666  socks5 proxy  sshu800 -pu800 14666 -du800 8082 user 123u800u82e156u800u82e156u800u82e23u800  reverse tunnel  onu800 remote machine sshu800 with - sshu800 -ru800 19999 localhost 22u800 user 123u800u82e156u800u82e156u800u82e23u800 port 19999 canu800 beu800 anyu800 unused port onu800 local machine sshu800 with - sshu800 localhost -pu800 19999  reverse vncu800 tunnel  onu800 remote server runu800 - sshu800 user otherserveru82enetu800 -ru800 5900 127u800u82e0u800u82e0u800u82e1u800 5900 then onu800 local client connect tou800 vncu800 onu800 localhost viau800 port 5900  password-less sshu800  stolen from tou800 enable password-less sshu800 login between twou800 machines au800 public keyu800 id_rsau82epubu800 must beu800 generated onu800 your home machine andu800 then uploaded tou800 au800 remote machine. this will enable youu800 tou800 logu800 inu800 tou800 theu800 remote machine andu800 notu800 beu800 prompted foru800 au800 password. tou800 generate anu800 id_rsau82epubu800 file open upu800 au800 terminal andu800 type theu800 following sshu800-keygen -tu800 rsau800 just press u8e28098enteru8e28099 foru800 allu800 ofu800 theu800 following prompts generating public private rsau800 keyu800 pair. enter file inu800 which tou800 save theu800 keyu800 home user .sshu800 id_rsa enter passphrase empty foru800 nou800 passphrase enter same passphrase again your identification hasu800 been saved inu800 home user .sshu800 id_rsa. your public keyu800 hasu800 been saved inu800 home user .sshu800 id_rsau82epubu800. this will leave theu800 passphrase empty enabling password-less login. nowu800 that theu800 public keyu800 file hasu800 been generated itu800 needs tou800 beu800 transferred tou800 theu800 remote machine that weu800 want tou800 logu800 inu800 tou800. youu800 canu800 useu800 rsync scpu800 ftpu800 oru800 anything similar just asu800 long asu800 theu800 id_rsau82epubu800 file that wasu800 generated isu800 transferred tou800 .sshu800 authorized_keys onu800 theu800 remote server. hereu8e28099s au800 fewu800 examples 1u800. scpu800 .sshu800 id_rsau82epubu800 user domainu82ecomu800 .sshu800 authorized_keys 2u800. rsync --progress -eu800 sshu800 .sshu800 id_rsau82epubu800 user domainu82ecomu800 .sshu800 authorized_keys 3u800. sshu800-copy-idu800 -iu800 .sshu800 id_rsau82epubu800 user domainu82ecomu800 once id_rsau82epubu800 hasu800 been transferred tryu800 tou800 sshu800 tou800 theu800 remote server. ifu800 everything went oku800 then youu800 shouldnu8e28099t beu800 prompted foru800 au800 password. ifu800 itu800 dosenu8e28099t work either theu800 sshu800 configuration onu800 theu800 remote machine isnu8e28099t setu800 upu800 tou800 accept public keys andu800 password-less logins oru800 theu800 permissions ofu800 theu800 id_rsau82epubu800 file areu800 incorrect. google isu800 your friend here andu800 also this link hasu800 some helpful hints  change sshu800 login banner etcu800  move oldu800 file asu800 backup sudo mvu800 etcu800 motd etcu800 motdu82ebaku800 create newu800 etcu800 motd file post-login message save. addu800 edit following line inu800 etcu800 default rcsu800 -- editmotd nou800 sudo nano etcu800 sshu800 sshd_config andu800 uncomment theu800 banner line with etcu800 issueu82enetu800 sudo nano etcu800 issueu82enetu800 -- displayed onu800 connect preu800-login sudo nano etcu800 motd -- displayed post-login have au800 look atu800 etcu800 update-motdu82edu800 00u800-header whats going onu800 there etcu800 initu82edu800 sshu800 restart ifu800 done properly wonu800''tu800 allu800 disappear onu800 reboot  running remote commands  works best tou800 have au800 public keyu800 setup between theu800 twou800 servers. sshu800 user serveru82enetu800 lsu800 runu800 multiple commands - sshu800 user serveru82enetu800 home user scripts lolu800u82eshu800; lsu800 '),
(6, 'network interfaces', '  setting au800 static ipu800 foru800 au800 network interface  edit network interfaces file - sudo nano etcu800 network interfaces this file describes theu800 network interfaces available onu800 your system andu800 howu800 tou800 activate them. foru800 more information seeu800 interfaces 5u800 . theu800 loopback network interface auto lou800 iface lou800 inet loopback theu800 primary network interface auto eth0 iface eth0 inet static address 192u800u82e168u800u82e0u800u82e100u800 netmask 255u800u82e255u800u82e255u800u82e0u800 network 192u800u82e168u800u82e0u800u82e0u800 broadcast 192u800u82e168u800u82e0u800u82e255u800 gateway 192u800u82e168u800u82e0u800u82e1u800 restart networking foru800 changes tou800 take effect - sudo etcu800 initu82edu800 networking restart '),
(7, 'mediawiki', '  installing mediawiki  followed this guide works perfect. will maybe steal theu800 words later tou800 save time opening another website -  making wiki private  tou800 limit editing tou800 only admin users edit etcu800 mediawiki localsettingsu82ephpu800 andu800 addu800 following lines - wggrouppermissions '' '' ''edit'' false; wggrouppermissions ''user'' ''edit'' false; wggrouppermissions ''sysop'' ''edit'' true; then restart apache.  change wiki logo  edit etcu800 mediawiki localsettingsu82ephpu800 andu800 addu800 following line - wglogo ; then restart apache.  moving wiki  backup mysql database andu800 backup theu800 following paths - etcu800 mediawiki usru800 share mediawiki varu800 libu800 mediawiki  restoring wiki  restore mysql database. install mediawiki. copy back theu800 above file path folders. edit etcu800 mediawiki localsettingsu82ephpu800 tou800 match newu800 server settings. ensure permissions areu800 setu800 correctly onu800 theu800 following - varu800 libu800 mediawiki config andu800 images folders should beu800 wwwu800-data oru800 user running apache2 etcu800 mediawiki localsettingsu82ephpu800 should beu800 wwwu800-data oru800 user running apache2 '),
(1, 'main page', '  nerdwiki  this should notu800 beu800 viewed byu800 anyone obviously edit this. '),
(8, 'gitu800', '  installing gitu800  based onu800 10u800u82e04u800 server sudo aptitude build-depu800 gitu800-core wget check latest version taru800 xvzf gitu800-1u800u82e7u800u82e4u800u82etaru800u82egzu800 cdu800 gitu800-1u800u82e7u800u82e4u800 . configure make sudo make install gitu800 --version cdu800 ..  clean upu800 after installation -  rmu800 -ru800 gitu800-1u800u82e7u800u82e4u800 gitu800-1u800u82e7u800u82e4u800u82etaru800u82egzu800  making au800 newu800 repo  mkdir newrepo cdu800 newrepo gitu800 init nano readme with whatever text gitu800 addu800 . tou800 addu800 allu800 files inu800 directory tou800 index gitu800 commit -mu800 ''initial commit.''  branches   checking outu800 au800 newu800 branch  gitu800 checkout -bu800 development  addu800 files then commit changes -  gitu800 addu800 . gitu800 commit -mu800 ''added files tou800 development branch.''  list allu800 branches with -  gitu800 branch  change branches with -  gitu800 checkout master oru800 whatever branch youu800 want  merge branches this example isu800 merging development branch with master branch make sure youu800''veu800 checked outu800 theu800 master branch first -  gitu800 merge development  cloning au800 repo from remote server  make sure youu800''veu800 checked outu800 another branch onu800 theu800 remote serverthat isnu800''tu800 theu800 master branch sayu800 au800 development branch otherwise youu800''llu800 getu800 anu800 error. gitu800 clone sshu800 user loeu800u82eorgu800 gitu800 repo nameofbranch make changes then push back tou800 server - gitu800 addu800 . gitu800 commit -mu800 made changes gitu800 push oru800 youu800 could rsync allu800 files between servers then init au800 gitu800 repo inu800 theu800 directory holding theu800 files. then useu800 theu800 following tou800 push anyu800 changes tou800 au800 newu800 branch onu800 theu800 remote server - gitu800 push user loeu800u82eorgu800 gitu800 repo -bu800 newbranch  errors andu800 workarounds  ''branch checked outu800'' error isu800 common when trying tou800 push tou800 au800 remote server just make sure that theu800 branch youu800''reu800 trying tou800 push tou800 isnu800''tu800 already checked outu800 onu800 theu800 remote server. useu800 gitu800 checkout anotherbranch onu800 remote server tou800 switch tou800 another branch.  github  small section onu800 making au800 newu800 repo onu800 github andu800 pushing tou800 itu800 from au800 local repo. first ensure gitu800 variables onu800 local machine match github username andu800 email - gitu800 config --global useru82ename username gitu800 config --global useru82eemail user domainu82eorgu800 gitu800 config --global githubu82euser username gitu800 config --global githubu82etoken 0123456789yourf0123456789token ifu800 youu800 need apiu800 access then create au800 newu800 local repo - cdu800 newrepo gitu800 init touch readme gitu800 addu800 . gitu800 commit -mu800 initial commit. then create au800 newu800 repo onu800 github. after repo isu800 made setu800 local repo tou800 push tou800 github repo - gitu800 remote addu800 origin gitu800 githubu82ecomu800 your-username awesomeprojectu82egitu800 tou800 push tou800 github from local machine enter theu800 following command - gitu800 push -uu800 origin master '),
(9, 'honeypot', '  installing kippo honeypot  based onu800 10u800u82e04u800 server aptu800-getu800 install python-twisted python-mysqldb subversion adduser kippo svnu800 checkout home kippo cpu800 home kippo kippou82ecfgu800u82edist home kippo kippou82ecfgu800 configure kippo tou800 logu800 into mysql - mysql -uu800 root -pu800 create database kippo; grant allu800 privileges onu800 kippou82e tou800 ''kippo'' localhost identified byu800 ''secret''; exit; mysql -ukippo -psecret kippo home kippo docu800 sqlu800 mysqlu82esqlu800 edit .cfgu800 file tou800 connect tou800 mysql database - database_mysql host localhost databse kippo username kippo password secret login asu800 kippo wonu800''tu800 runu800 asu800 root start kippo - . startu82eshu800 byu800 default kippo runs onu800 port 2222. runu800 this command tou800 route tou800 default sshu800 22u800 port note this command will have tou800 beu800 runu800 again ifu800 system isu800 restarted - iptables -tu800 natu800 -au800 prerouting -iu800 eth0 -pu800 tcpu800 -dport 22u800 -ju800 redirect -tou800-port 2222 logu800 files areu800 kept inu800 home kippo logu800 ttyu800 downloaded files kept inu800 home kippo dlu800 '),
(10, 'phpmyadmin', '  installing phpmyadmin  aptu800-getu800 install phpmyadmin setu800 apache2 virtual host oru800 redirect tou800 usru800 share phpmyadmin '),
(11, 'leagueofevilu82eorgu800', '  steps tou800 setup server  adduser newuser useu800 ''visudo'' asu800 root tou800 addu800 newu800 user tou800 sudoers adduser eggdrop aptu800-getu800 install ircd-hybrid aptu800-getu800 install screen aptu800-getu800 install irssi aptu800-getu800 install eggdrop aptu800-getu800 install mediawiki aptu800-getu800 install phpmyadmin edit etcu800 sshu800 sshd_config tou800 prevent root access change default port addu800 certain users. move back etcu800 ircd-hybrid ircdu82econf file andu800 ircdu82emotd file. move back eggdrop home folder including botu800 .conf files. move back .bash_history andu800 .bash_aliases files foru800 users. restore nerdwiki andu800 nerdlog '),
(12, 'misc cliu800 commands', '  list processes with open ports -  sudo netstat -tplu800  taru800  compress au800 file - taru800 -czfu800 whateveru82etaru800 foldername untar au800 file - taru800 -xfu800 whateveru82etaru800 taru800 options - -cu800 create -fu800 read tou800 from theu800 named file -tu800 list contents ofu800 .taru800 file -ru800 append tou800 au800 .taru800 file -vu800 verbose -xu800 extract contents ofu800 .taru800 file -zu800 compress files  change timezone -  sudo dpkg-reconfigure tzdata '),
(13, 'login', ' addu800 login background jpgu800 tou800 usru800 share backgrounds using sudo foru800 permissions then sudo cpu800 usru800 share applications gnome-appearance-propertiesu82edesktop usru800 share gdmu800 autostart loginwindow logout ofu800 gnome appearance dialogue pops upu800 onu800 next login prompt. change settings like colour scheme theme background etcu800 close andu800 then login again. unhook appearance dialogue with sudo unlink usru800 share gdmu800 autostart loginwindow gnome-appearance-propertiesu82edesktop '),
(14, 'grep', ' find au800 bash command youu800''veu800 previously used - history grep gitu800 this will list anyu800 commands with ''gitu800'' inu800 theu800 line. find running processes byu800 name - psu800 auxu800 grep apache this will list anyu800 processes that apache2 isu800 running. find files inu800 au800 directory - lsu800 grep somefile output grep tou800 file - history grep eggdrop home user eggdropbashu82etxtu800 psu800 auxu800 grep squid squidproccesu82etxtu800 etcu800 '),
(15, 'macu800 terminal commands', '  fixu800 home permissions  sudo chmod -ru800 ugu800 rwxu800 users username  list andu800 sort files byu800 filesize  useful foru800 finding what files areu800 taking upu800 theu800 most space. duu800 -ku800 sort -nru800  list open ports andu800 theu800 processes using them  lsof -iu800 lsof -iu800 tcpu800 8254  list allu800 loaded third-party kernel extensions  kextstat grep -vu800 comu800u82eapple  list files that running applications processes areu800 accessing  find application process with psu800 auxu800 psu800 auxu800 grep nameofapp then useu800 opensnoop with name ofu800 application oru800 process idu800. sudo opensnoop -nu800 nameofapp sudo opensnoop -pu800 2837  show hidden files inu800 finder  useu800 false tou800 hide files again. defaults write comu800u82eappleu82efinder appleshowallfiles true  list history ofu800 reboots andu800 shutdowns  last reboot last shutdown useu800 grep tou800 find reboots oru800 shutdowns inu800 au800 certain month. last reboot grep mayu800  eject andu800 close dvdu800 drive  drutil tray eject drutil tray close  misc.  launchctl load library launchdaemons lsbom .pkgu800 contents archiveu82ebomu800 more '),
(16, 'indicator applet', ' remove evolution from theu800 indicator applet notifier inu800 theu800 system tray sudo aptu800-getu800 remove evolution-indu800 sudo aptu800-getu800 remove evolution-indicator sudo aptu800-getu800 remove indicator-messages ifu800 youu800 also want tou800 getu800 ridu800 ofu800 theu800 memenu youu800 canu800 dou800 sou800 with this sudo aptu800-getu800 remove indicator-meu800 theu800 mail notifier oru800 anything else youu8e28099ve removed might still beu800 there when youu8e28099ve finished though should beu800 gone after au800 reboot. however tou800 view your changes immediately youu800 canu800 refresh theu800 panel byu800 entering theu800 following into au800 terminal oru800 altu800 f2u800 killall gnome-panel '),
(17, 'grub', ' boot grub grubu82ecfgu800 isu800 auto generated byu800 update-grub theu800 primary configuration file foru800 changing menu display settings isu800 etcu800 default grub. there areu800 multiple files foru800 configuring theu800 menu - etcu800 default grub mentioned above andu800 allu800 theu800 files inu800 theu800 etcu800 grubu82edu800 directory. '),
(18, 'apache', '  apache server   misc errors andu800 fixes  ifu800 .phpu800 pages aren''tu800 showing andu800 areu800 offering tou800 download theu800 files instead. edit etcu800 apache2 mods-enabled php5u82econf tou800 match theu800 following - sethandler application xu800-httpd-phpu800 sethandler application xu800-httpd-phpu800-source # tou800 reu800-enable phpu800 inu800 user directories comment theu800 following lines # from tou800 . dou800 notu800 setu800 itu800 tou800 onu800 asu800 itu800 # prevents .htaccess files from disabling itu800. # # # php_admin_value engine offu800 # # '),
(19, 'python', '  simple http server from anyu800 directory  python -mu800 simplehttpserver port '),
(20, 'ruby', '  ruby onu800 rails install  good setup foru800 development. ');

-- --------------------------------------------------------

--
-- Table structure for table `nw_site_stats`
--

DROP TABLE IF EXISTS `nw_site_stats`;
CREATE TABLE IF NOT EXISTS `nw_site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_views` bigint(20) unsigned DEFAULT '0',
  `ss_total_edits` bigint(20) unsigned DEFAULT '0',
  `ss_good_articles` bigint(20) unsigned DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_active_users` bigint(20) DEFAULT '-1',
  `ss_admins` int(11) DEFAULT '-1',
  `ss_images` int(11) DEFAULT '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_site_stats`
--

INSERT INTO `nw_site_stats` (`ss_row_id`, `ss_total_views`, `ss_total_edits`, `ss_good_articles`, `ss_total_pages`, `ss_users`, `ss_active_users`, `ss_admins`, `ss_images`) VALUES
(1, 574, 94, 0, 20, 2, -1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nw_tag_summary`
--

DROP TABLE IF EXISTS `nw_tag_summary`;
CREATE TABLE IF NOT EXISTS `nw_tag_summary` (
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(11) DEFAULT NULL,
  `ts_rev_id` int(11) DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_tag_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_templatelinks`
--

DROP TABLE IF EXISTS `nw_templatelinks`;
CREATE TABLE IF NOT EXISTS `nw_templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  UNIQUE KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_templatelinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_text`
--

DROP TABLE IF EXISTS `nw_text`;
CREATE TABLE IF NOT EXISTS `nw_text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240 AUTO_INCREMENT=95 ;

--
-- Dumping data for table `nw_text`
--

INSERT INTO `nw_text` (`old_id`, `old_text`, `old_flags`) VALUES
(1, 0x3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b68747470733a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d, 0x7574662d38),
(2, 0x272727496e7374616c6c696e672065676764726f702727270a7375646f206170742d67657420696e7374616c6c2065676764726f700a616464757365722065676764726f700a0a272727496e7374616c6c696e67206e657720626f742727270a2e636f6e662066696c65202d6d, 0x7574662d38),
(3, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f700a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e2e636f6e662066696c65202d6d, 0x7574662d38),
(4, 0x272727496e7374616c6c696e6720697263642d6879627269642727270a3c62723e7375646f206170742d67657420696e7374616c6c20697263642d6879627269640a3c62723e65646974202f6574632f697263642d6879627269642f697263642e636f6e660a3c62723e65646974202f6574632f697263642d6879627269642f697263642e6d6f74640a3c62723e7375646f202f6574632f696e69742e642f697263642d68796272696420726573746172740a0a3c703e3c703e0a0a272727496e7374616c6c696e6720697273736920746f20636f6e6e65637420746f20495243207365727665722727270a3c62723e7375646f206170742d67657420696e7374616c6c2069727373690a3c62723e2f636f6e6e656374203132372e302e302e310a3c62723e486f73746e616d652077696c6c2062652073706f6f666564, 0x7574662d38),
(5, 0x272727496e7374616c6c696e6720697263642d6879627269642727270a3c62723e7375646f206170742d67657420696e7374616c6c20697263642d6879627269640a3c62723e65646974202f6574632f697263642d6879627269642f697263642e636f6e660a3c62723e65646974202f6574632f697263642d6879627269642f697263642e6d6f74640a3c62723e7375646f202f6574632f696e69742e642f697263642d68796272696420726573746172740a0a3c703e0a3c703e0a0a272727496e7374616c6c696e6720697273736920746f20636f6e6e65637420746f20495243207365727665722727270a3c62723e7375646f206170742d67657420696e7374616c6c2069727373690a3c62723e2f636f6e6e656374203132372e302e302e310a3c62723e486f73746e616d652077696c6c2062652073706f6f666564, 0x7574662d38),
(6, 0x272727496e7374616c6c696e6720697263642d6879627269642727270a3c62723e7375646f206170742d67657420696e7374616c6c20697263642d6879627269640a3c62723e65646974202f6574632f697263642d6879627269642f697263642e636f6e660a3c62723e65646974202f6574632f697263642d6879627269642f697263642e6d6f74640a3c62723e7375646f202f6574632f696e69742e642f697263642d68796272696420726573746172740a0a3c703e0a0a272727496e7374616c6c696e6720697273736920746f20636f6e6e65637420746f20495243207365727665722727270a3c62723e7375646f206170742d67657420696e7374616c6c2069727373690a3c62723e2f636f6e6e656374203132372e302e302e310a3c62723e486f73746e616d652077696c6c2062652073706f6f666564, 0x7574662d38),
(7, 0x272727496e7374616c6c696e6720576f726470726573732727270a3c62723e7767657420687474703a2f2f776f726470726573732e6f72672f6c61746573742e7461722e677a0a3c62723e74617220787a7666206c61746573742e7461722e677a0a3c62723e7375646f206d7620776f72647072657373202f7661722f7777772f6e616d656f66626c6f670a3c62723e6364202f7661722f7777772f6e616d656f66626c6f670a3c62723e7375646f206d762077702d636f6e6669672d73616d706c652e7068702077702d636f6e6669672e7068700a3c62723e7375646f206e616e6f2077702d636f6e6669672e7068700a3c703e0a4164642064657461696c73206f66206d7973716c207461626c6520666f7220626c6f672c206d7973716c20757365726e616d6520616e642070617373776f72642e0a3c703e0a5468656e20676f746f20626c6f6720696e2062726f7773657220746f2066696e69736820696e7374616c6c6174696f6e2e, 0x7574662d38),
(8, 0x27272753656375726520535348207365727665722727270a7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a44697361626c6520726f6f74206c6f67696e0a456e61626c65206c6f67696e206f6e6c7920666f72206365727461696e2075736572730a4368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c7365, 0x7574662d38),
(9, 0x27272753656375726520535348207365727665722727270a7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a232041757468656e7469636174696f6e3a0a4c6f67696e477261636554696d65203132300a5065726d6974526f6f744c6f67696e206e6f0a416c6c6f775573657273206a6c2065676764726f70206a6f72650a5374726963744d6f646573207965730a0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a23205768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a506f7274203134363636, 0x7574662d38),
(10, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a232041757468656e7469636174696f6e3a0a4c6f67696e477261636554696d65203132300a5065726d6974526f6f744c6f67696e206e6f0a416c6c6f775573657273206a6c2065676764726f70206a6f72650a5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a23205768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a506f7274203134363636, 0x7574662d38),
(11, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a41757468656e7469636174696f6e3a0a4c6f67696e477261636554696d65203132300a5065726d6974526f6f744c6f67696e206e6f0a416c6c6f775573657273206a6c2065676764726f70206a6f72650a5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a506f7274203134363636, 0x7574662d38),
(12, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f7274203134363636, 0x7574662d38),
(13, 0x27272753657474696e6720612073746174696320495020666f722061206e6574776f726b20696e746572666163652727270a3c62723e20546869732066696c652064657363726962657320746865206e6574776f726b20696e746572666163657320617661696c61626c65206f6e20796f75722073797374656d0a3c62723e20616e6420686f7720746f206163746976617465207468656d2e20466f72206d6f726520696e666f726d6174696f6e2c2073656520696e74657266616365732835292e0a3c62723e3c62723e0a3c62723e20546865206c6f6f706261636b206e6574776f726b20696e746572666163650a3c62723e6175746f206c6f0a3c62723e6966616365206c6f20696e6574206c6f6f706261636b0a3c62723e3c62723e0a3c62723e20546865207072696d617279206e6574776f726b20696e746572666163650a3c62723e6175746f20657468300a3c62723e6966616365206574683020696e6574207374617469630a3c62723e202020202020202061646472657373203139322e3136382e302e3130300a3c62723e20202020202020206e65746d61736b203235352e3235352e3235352e300a3c62723e20202020202020206e6574776f726b203139322e3136382e302e300a3c62723e202020202020202062726f616463617374203139322e3136382e302e3235350a3c62723e202020202020202067617465776179203139322e3136382e302e31, 0x7574662d38),
(14, 0x27272753657474696e6720612073746174696320495020666f722061206e6574776f726b20696e746572666163652727270a3c62723e7375646f206e616e6f202f6574632f6e6574776f726b2f696e74657266616365730a3c62723e20546869732066696c652064657363726962657320746865206e6574776f726b20696e746572666163657320617661696c61626c65206f6e20796f75722073797374656d0a3c62723e20616e6420686f7720746f206163746976617465207468656d2e20466f72206d6f726520696e666f726d6174696f6e2c2073656520696e74657266616365732835292e0a3c62723e3c62723e0a3c62723e20546865206c6f6f706261636b206e6574776f726b20696e746572666163650a3c62723e6175746f206c6f0a3c62723e6966616365206c6f20696e6574206c6f6f706261636b0a3c62723e3c62723e0a3c62723e20546865207072696d617279206e6574776f726b20696e746572666163650a3c62723e6175746f20657468300a3c62723e6966616365206574683020696e6574207374617469630a3c62723e202020202020202061646472657373203139322e3136382e302e3130300a3c62723e20202020202020206e65746d61736b203235352e3235352e3235352e300a3c62723e20202020202020206e6574776f726b203139322e3136382e302e300a3c62723e202020202020202062726f616463617374203139322e3136382e302e3235350a3c62723e202020202020202067617465776179203139322e3136382e302e310a3c62723e3c62723e0a7375646f202f6574632f696e69742e642f6e6574776f726b696e672072657374617274, 0x7574662d38),
(15, 0x272727496e7374616c6c696e6720697263642d6879627269642727270a3c62723e7375646f206170742d67657420696e7374616c6c20697263642d6879627269640a3c62723e0a3c62723e65646974202f6574632f697263642d6879627269642f697263642e636f6e662c20616e64206368616e67652074686973202d0a3c62723e202020206c697374656e207b0a3c62723e202020202f2a20706f72743a2074686520737065636966696320706f727420746f206c697374656e206f6e2e20206966206e6f20686f7374206973207370656369666965640a3c62723e202020202a206265666f72652c2069742077696c6c206c697374656e206f6e20616c6c20617661696c61626c65204950732e0a3c62723e202020202a0a3c62723e202020202a20706f727473206172652073657065726174656420766961206120636f6d6d612c20612072616e6765206d617920626520737065636966696564207573696e6720e2809c2e2ee2809d0a3c62723e202020202a2f0a3c62723e0a3c62723e202020202f2a20706f72743a206c697374656e206f6e20616c6c20617661696c61626c65204950732c20706f727473203636363520746f2036363639202a2f0a3c62723e20202020686f7374203d20e2809c3132372e302e302e31e280b33b2020202023206368616e67652074686973210a3c62723e20202020706f7274203d2036363635202e2e20363636393b0a3c62723e202020207d3b0a3c62723e0a3c62723e746f20736f6d657468696e67206c696b652074686973202d0a3c62723e202020206c697374656e207b0a3c62723e202020202f2a20706f72743a2074686520737065636966696320706f727420746f206c697374656e206f6e2e20206966206e6f20686f7374206973207370656369666965640a3c62723e202020202a206265666f72652c2069742077696c6c206c697374656e206f6e20616c6c20617661696c61626c65204950732e0a3c62723e202020202a0a3c62723e202020202a20706f727473206172652073657065726174656420766961206120636f6d6d612c20612072616e6765206d617920626520737065636966696564207573696e6720e2809c2e2ee2809d0a3c62723e202020202a2f0a3c62723e0a3c62723e202020202f2a20706f72743a206c697374656e206f6e20616c6c20617661696c61626c65204950732c20706f727473203636363520746f2036363639202a2f0a3c62723e0a3c62723e202020202320434f4d4d454e54204f555420434f4d504c4554454c592020686f7374203d20e2809c3132372e302e302e31e280b33b2020202023206368616e67652074686973210a3c62723e20202020706f7274203d20363636373b0a3c62723e202020207d3b0a3c62723e0a3c62723e2873746f6c656e2066726f6d20687474703a2f2f7777772e706f696e746c65737372616e74732e636f6d2f323030392f30352f696e7374616c6c696e672d616e642d636f6e6669677572696e672d697263642d6879627269642d6f6e2d7562756e74752d3930342f290a3c62723e0a3c62723e65646974202f6574632f697263642d6879627269642f697263642e6d6f74640a3c62723e7375646f202f6574632f696e69742e642f697263642d68796272696420726573746172740a0a3c703e0a0a272727496e7374616c6c696e6720697273736920746f20636f6e6e65637420746f20495243207365727665722727270a3c62723e7375646f206170742d67657420696e7374616c6c2069727373690a3c62723e2f636f6e6e656374203132372e302e302e310a3c62723e486f73746e616d652077696c6c2062652073706f6f666564, 0x7574662d38),
(16, 0x272727496e7374616c6c696e6720697263642d6879627269642727270a3c62723e7375646f206170742d67657420696e7374616c6c20697263642d6879627269640a3c62723e0a3c62723e65646974202f6574632f697263642d6879627269642f697263642e636f6e662c20616e64206368616e67652074686973202d0a3c62723e202020206c697374656e207b0a3c62723e202020202f2a20706f72743a2074686520737065636966696320706f727420746f206c697374656e206f6e2e20206966206e6f20686f7374206973207370656369666965640a3c62723e202020202a206265666f72652c2069742077696c6c206c697374656e206f6e20616c6c20617661696c61626c65204950732e0a3c62723e202020202a0a3c62723e202020202a20706f727473206172652073657065726174656420766961206120636f6d6d612c20612072616e6765206d617920626520737065636966696564207573696e6720e2809c2e2ee2809d0a3c62723e202020202a2f0a3c62723e0a3c62723e202020202f2a20706f72743a206c697374656e206f6e20616c6c20617661696c61626c65204950732c20706f727473203636363520746f2036363639202a2f0a3c62723e20202020686f7374203d20e2809c3132372e302e302e31e280b33b2020202023206368616e67652074686973210a3c62723e20202020706f7274203d2036363635202e2e20363636393b0a3c62723e202020207d3b0a3c62723e0a3c62723e746f20736f6d657468696e67206c696b652074686973202d0a3c62723e0a3c62723e202020206c697374656e207b0a3c62723e202020202f2a20706f72743a2074686520737065636966696320706f727420746f206c697374656e206f6e2e20206966206e6f20686f7374206973207370656369666965640a3c62723e202020202a206265666f72652c2069742077696c6c206c697374656e206f6e20616c6c20617661696c61626c65204950732e0a3c62723e202020202a0a3c62723e202020202a20706f727473206172652073657065726174656420766961206120636f6d6d612c20612072616e6765206d617920626520737065636966696564207573696e6720e2809c2e2ee2809d0a3c62723e202020202a2f0a3c62723e0a3c62723e202020202f2a20706f72743a206c697374656e206f6e20616c6c20617661696c61626c65204950732c20706f727473203636363520746f2036363639202a2f0a3c62723e0a3c62723e202020202320434f4d4d454e54204f555420434f4d504c4554454c592020686f7374203d20e2809c3132372e302e302e31e280b33b2020202023206368616e67652074686973210a3c62723e20202020706f7274203d20363636373b0a3c62723e202020207d3b0a3c62723e0a3c62723e2873746f6c656e2066726f6d20687474703a2f2f7777772e706f696e746c65737372616e74732e636f6d2f323030392f30352f696e7374616c6c696e672d616e642d636f6e6669677572696e672d697263642d6879627269642d6f6e2d7562756e74752d3930342f290a3c62723e0a3c62723e65646974202f6574632f697263642d6879627269642f697263642e6d6f74640a3c62723e7375646f202f6574632f696e69742e642f697263642d68796272696420726573746172740a0a3c703e0a0a272727496e7374616c6c696e6720697273736920746f20636f6e6e65637420746f20495243207365727665722727270a3c62723e7375646f206170742d67657420696e7374616c6c2069727373690a3c62723e2f636f6e6e656374203132372e302e302e310a3c62723e486f73746e616d652077696c6c2062652073706f6f666564, 0x7574662d38),
(17, 0x272727496e7374616c6c696e6720697263642d6879627269642727270a3c62723e7375646f206170742d67657420696e7374616c6c20697263642d6879627269640a3c62723e0a3c62723e65646974202f6574632f697263642d6879627269642f697263642e636f6e662c20616e64206368616e67652074686973202d0a3c62723e0a3c62723e202020206c697374656e207b0a3c62723e202020202f2a20706f72743a2074686520737065636966696320706f727420746f206c697374656e206f6e2e20206966206e6f20686f7374206973207370656369666965640a3c62723e202020202a206265666f72652c2069742077696c6c206c697374656e206f6e20616c6c20617661696c61626c65204950732e0a3c62723e202020202a0a3c62723e202020202a20706f727473206172652073657065726174656420766961206120636f6d6d612c20612072616e6765206d617920626520737065636966696564207573696e6720e2809c2e2ee2809d0a3c62723e202020202a2f0a3c62723e0a3c62723e202020202f2a20706f72743a206c697374656e206f6e20616c6c20617661696c61626c65204950732c20706f727473203636363520746f2036363639202a2f0a3c62723e20202020686f7374203d20e2809c3132372e302e302e31e280b33b2020202023206368616e67652074686973210a3c62723e20202020706f7274203d2036363635202e2e20363636393b0a3c62723e202020207d3b0a3c62723e0a3c62723e746f20736f6d657468696e67206c696b652074686973202d0a3c62723e0a3c62723e202020206c697374656e207b0a3c62723e202020202f2a20706f72743a2074686520737065636966696320706f727420746f206c697374656e206f6e2e20206966206e6f20686f7374206973207370656369666965640a3c62723e202020202a206265666f72652c2069742077696c6c206c697374656e206f6e20616c6c20617661696c61626c65204950732e0a3c62723e202020202a0a3c62723e202020202a20706f727473206172652073657065726174656420766961206120636f6d6d612c20612072616e6765206d617920626520737065636966696564207573696e6720e2809c2e2ee2809d0a3c62723e202020202a2f0a3c62723e0a3c62723e202020202f2a20706f72743a206c697374656e206f6e20616c6c20617661696c61626c65204950732c20706f727473203636363520746f2036363639202a2f0a3c62723e0a3c62723e202020202320434f4d4d454e54204f555420434f4d504c4554454c592020686f7374203d20e2809c3132372e302e302e31e280b33b2020202023206368616e67652074686973210a3c62723e20202020706f7274203d20363636373b0a3c62723e202020207d3b0a3c62723e0a3c62723e2873746f6c656e2066726f6d20687474703a2f2f7777772e706f696e746c65737372616e74732e636f6d2f323030392f30352f696e7374616c6c696e672d616e642d636f6e6669677572696e672d697263642d6879627269642d6f6e2d7562756e74752d3930342f290a3c62723e0a3c62723e65646974202f6574632f697263642d6879627269642f697263642e6d6f74640a3c62723e7375646f202f6574632f696e69742e642f697263642d68796272696420726573746172740a0a3c703e0a0a272727496e7374616c6c696e6720697273736920746f20636f6e6e65637420746f20495243207365727665722727270a3c62723e7375646f206170742d67657420696e7374616c6c2069727373690a3c62723e2f636f6e6e656374203132372e302e302e310a3c62723e486f73746e616d652077696c6c2062652073706f6f666564, 0x7574662d38),
(18, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e2e636f6e662066696c65202d6d0a0a3c703e27272745646974696e6720626f74202e636f6e662066696c652727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c646572202d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d7022, 0x7574662d38),
(19, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e2e636f6e662066696c65202d6d0a0a3c62723e3c62723e27272745646974696e6720626f74202e636f6e662066696c652727270a0a3c62723e3c62723e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d7022, 0x7574662d38),
(20, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e65676764726f70202d6d2077686174657665722e636f6e66202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a3c62723e0a0a3c62723e3c62723e27272745646974696e6720626f74202e636f6e662066696c652727270a0a3c62723e3c62723e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d70220a0a416c6963652e74636c0a2e6368616e736574202374686f756768746d61796265202b616c696365, 0x7574662d38),
(21, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e65676764726f70202d6d2077686174657665722e636f6e66202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a3c62723e54656c6e657420696e207573696e6720706f72742066726f6d20636f6e662066696c650a74656c6e6574206c6f63616c686f73742032303636360a456e74657220274e45572720617320757365726e616d652c207468656e2077696c6c2070726f6d707420746f206d616b652061206e6577207573657220616e642073657420796f75206173206f776e65720a0a2e6368616e616464202374686f756768746d61796265203f3f0a0a3c62723e3c62723e27272745646974696e6720626f74202e636f6e662066696c652727270a0a3c62723e3c62723e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d70220a0a416c6963652e74636c0a2e6368616e736574202374686f756768746d61796265202b616c696365, 0x7574662d38),
(22, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e3c62723e0a534f434b53352070726f78790a3c62723e737368202d70203134363636202d442038303832206a6f7265403138342e3130362e3138392e313330, 0x7574662d38),
(23, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e3c62723e0a272727534f434b53352070726f78792727270a3c62723e737368202d70203134363636202d442038303832206a6f7265403138342e3130362e3138392e313330, 0x7574662d38),
(24, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e65676764726f70202d6d2077686174657665722e636f6e66202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a3c62723e54656c6e657420696e207573696e6720706f72742066726f6d20636f6e662066696c650a74656c6e6574206c6f63616c686f73742032303636360a456e74657220274e45572720617320757365726e616d652c207468656e2077696c6c2070726f6d707420746f206d616b652061206e6577207573657220616e642073657420796f75206173206f776e65720a0a2e6368616e616464202374686f756768746d61796265203f3f0a2e6368616e736574202b6175746f6f70202374686f756768746d617962650a0a0a3c62723e3c62723e27272745646974696e6720626f74202e636f6e662066696c652727270a0a3c62723e3c62723e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d70220a0a416c6963652e74636c0a2e6368616e736574202374686f756768746d61796265202b616c696365, 0x7574662d38),
(25, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e0a272727534f434b53352070726f78792727270a3c62723e737368202d70203134363636202d442038303832206a6f7265403138342e3130362e3138392e3133300a0a3c62723e0a272727526576657273652074756e6e656c272727, 0x7574662d38),
(26, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e0a272727534f434b53352070726f78792727270a3c62723e737368202d70203134363636202d442038303832206a6f7265403138342e3130362e3138392e3133300a0a3c62723e0a272727526576657273652074756e6e656c2727270a3c62723e4f6e2072656d6f7465206d616368696e652c205353482077697468202d0a3c62723e737368202d522031393939393a6c6f63616c686f73743a3232206a6c403132332e3135362e3135362e32332028706f72742031393939392063616e20626520616e7920756e7573656420706f7274290a3c62723e3c62723e4f6e206c6f63616c206d616368696e652c205353482077697468202d0a3c62723e737368206c6f63616c686f7374202d70203139393939, 0x7574662d38),
(27, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e0a272727534f434b53352070726f78792727270a3c62723e737368202d70203134363636202d4420383038322075736572403132332e3135362e3135362e32330a0a3c62723e0a272727526576657273652074756e6e656c2727270a3c62723e4f6e2072656d6f7465206d616368696e652c205353482077697468202d0a3c62723e737368202d522031393939393a6c6f63616c686f73743a32322075736572403132332e3135362e3135362e32332028706f72742031393939392063616e20626520616e7920756e7573656420706f7274290a3c62723e3c62723e4f6e206c6f63616c206d616368696e652c205353482077697468202d0a3c62723e737368206c6f63616c686f7374202d70203139393939, 0x7574662d38),
(28, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a3c62723e7375646f2063686d6f6420373737202f7573722f6c69622f65676764726f70202d520a3c62723e6c6e202d73202f7573722f6c69622f65676764726f702f6d6f64756c6573202f686f6d652f796f7572757365722f6d6f64756c65730a3c62723e6c6e202d73202f7573722f73686172652f65676764726f702f73637269707473202f686f6d652f796f7572757365722f736372697074730a3c62723e65676764726f70202f686f6d652f796f7572757365722f73696d706c652e636f6e660a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e65676764726f70202d6d2077686174657665722e636f6e66202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a3c62723e3c62723e54656c6e657420696e207573696e6720706f72742066726f6d20636f6e662066696c650a3c62723e74656c6e6574206c6f63616c686f73742032303636360a3c62723e456e74657220274e45572720617320757365726e616d652c207468656e2077696c6c2070726f6d707420746f206d616b652061206e6577207573657220616e642073657420796f75206173206f776e65720a0a3c62723e2e6368616e616464202374686f756768746d61796265203f3f0a3c62723e2e6368616e736574202b6175746f6f70202374686f756768746d617962650a0a0a3c62723e3c62723e27272745646974696e6720626f74202e636f6e662066696c652727270a0a3c62723e3c62723e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d70220a0a3c62723e3c62723e416c6963652e74636c0a3c62723e2e6368616e736574202374686f756768746d61796265202b616c696365, 0x7574662d38),
(29, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a3c62723e7375646f2063686d6f6420373737202f7573722f6c69622f65676764726f70202d520a3c62723e6c6e202d73202f7573722f6c69622f65676764726f702f6d6f64756c6573202f686f6d652f796f7572757365722f6d6f64756c65730a3c62723e6c6e202d73202f7573722f73686172652f65676764726f702f73637269707473202f686f6d652f796f7572757365722f736372697074730a3c62723e65676764726f70202f686f6d652f796f7572757365722f73696d706c652e636f6e660a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e65676764726f70202d6d2077686174657665722e636f6e66202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a3c62723e3c62723e54656c6e657420696e207573696e6720706f72742066726f6d20636f6e662066696c650a3c62723e74656c6e6574206c6f63616c686f73742032303636360a3c62723e456e74657220274e45572720617320757365726e616d652c207468656e2077696c6c2070726f6d707420746f206d616b652061206e6577207573657220616e642073657420796f75206173206f776e65720a3c62723e436f6d6d616e647320666f756e642068657265202d20687474703a2f2f7777772e65676768656c702e6f72672f7573696e672e68746d0a3c62723e2e6368616e616464202374686f756768746d617962652028697320746869732072696768743f290a3c62723e2e6368616e736574202b6175746f6f70202374686f756768746d617962650a0a0a3c62723e3c62723e27272745646974696e6720626f74202e636f6e662066696c652727270a0a3c62723e3c62723e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d70220a0a3c62723e3c62723e416c6963652e74636c0a3c62723e2e6368616e736574202374686f756768746d61796265202b616c696365, 0x7574662d38),
(30, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a3c62723e65646974202e636f6e662066696c650a3c62723e7375646f2063686d6f6420373737202f7573722f6c69622f65676764726f70202d520a3c62723e6c6e202d73202f7573722f6c69622f65676764726f702f6d6f64756c6573202f686f6d652f796f7572757365722f6d6f64756c65730a3c62723e6c6e202d73202f7573722f73686172652f65676764726f702f73637269707473202f686f6d652f796f7572757365722f736372697074730a3c62723e65676764726f70202f686f6d652f796f7572757365722f73696d706c652e636f6e660a0a3c703e272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e65676764726f70202d6d2077686174657665722e636f6e66202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a3c62723e54656c6e657420696e207573696e6720706f72742066726f6d20636f6e662066696c65202d0a3c62723e74656c6e6574206c6f63616c686f73742032303636360a3c62723e456e74657220274e45572720617320757365726e616d652c207468656e2077696c6c2070726f6d707420746f206d616b652061206e6577207573657220616e642073657420796f75206173206f776e65720a3c62723e436f6d6d616e647320666f756e642068657265202d20687474703a2f2f7777772e65676768656c702e6f72672f7573696e672e68746d0a3c62723e2e6368616e616464202374686f756768746d617962652028697320746869732072696768743f290a3c62723e2e6368616e736574202b6175746f6f70202374686f756768746d617962650a0a0a3c703e272727416c6963652e74636c2727270a3c62723e2e6368616e736574202374686f756768746d61796265202b616c6963650a0a3c703e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d7022, 0x7574662d38),
(31, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a3c62723e65646974202e636f6e662066696c650a3c62723e7375646f2063686d6f6420373737202f7573722f6c69622f65676764726f70202d520a3c62723e6c6e202d73202f7573722f6c69622f65676764726f702f6d6f64756c6573202f686f6d652f796f7572757365722f6d6f64756c65730a3c62723e6c6e202d73202f7573722f73686172652f65676764726f702f73637269707473202f686f6d652f796f7572757365722f736372697074730a3c62723e65676764726f70202f686f6d652f796f7572757365722f73696d706c652e636f6e660a0a3c62723e3c62723e272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e65676764726f70202d6d2077686174657665722e636f6e66202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a3c62723e54656c6e657420696e207573696e6720706f72742066726f6d20636f6e662066696c65202d0a3c62723e74656c6e6574206c6f63616c686f73742032303636360a3c62723e456e74657220274e45572720617320757365726e616d652c207468656e2077696c6c2070726f6d707420746f206d616b652061206e6577207573657220616e642073657420796f75206173206f776e65720a3c62723e436f6d6d616e647320666f756e642068657265202d20687474703a2f2f7777772e65676768656c702e6f72672f7573696e672e68746d0a3c62723e2e6368616e616464202374686f756768746d617962652028697320746869732072696768743f290a3c62723e2e6368616e736574202b6175746f6f70202374686f756768746d617962650a0a0a3c62723e3c62723e272727416c6963652e74636c2727270a3c62723e2e6368616e736574202374686f756768746d61796265202b616c6963650a0a3c62723e3c62723e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d7022, 0x7574662d38),
(32, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e7375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e616464757365722065676764726f7020286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a3c62723e65646974202e636f6e662066696c650a3c62723e7375646f2063686d6f6420373737202f7573722f6c69622f65676764726f70202d520a3c62723e6c6e202d73202f7573722f6c69622f65676764726f702f6d6f64756c6573202f686f6d652f796f7572757365722f6d6f64756c65730a3c62723e6c6e202d73202f7573722f73686172652f65676764726f702f73637269707473202f686f6d652f796f7572757365722f736372697074730a3c62723e65676764726f70202f686f6d652f796f7572757365722f73696d706c652e636f6e660a0a3c62723e272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e65676764726f70202d6d2077686174657665722e636f6e66202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a3c62723e54656c6e657420696e207573696e6720706f72742066726f6d20636f6e662066696c65202d0a3c62723e74656c6e6574206c6f63616c686f73742032303636360a3c62723e456e74657220274e45572720617320757365726e616d652c207468656e2077696c6c2070726f6d707420746f206d616b652061206e6577207573657220616e642073657420796f75206173206f776e65720a3c62723e436f6d6d616e647320666f756e642068657265202d20687474703a2f2f7777772e65676768656c702e6f72672f7573696e672e68746d0a3c62723e2e6368616e616464202374686f756768746d617962652028697320746869732072696768743f290a3c62723e2e6368616e736574202b6175746f6f70202374686f756768746d617962650a0a3c62723e272727416c6963652e74636c2727270a3c62723e2e6368616e736574202374686f756768746d61796265202b616c6963650a0a3c62723e2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c65292d0a3c62723e3c62723e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d7022, 0x7574662d38),
(33, 0x272727496e7374616c6c696e6720576f726470726573732727270a3c62723e7767657420687474703a2f2f776f726470726573732e6f72672f6c61746573742e7461722e677a0a3c62723e74617220787a7666206c61746573742e7461722e677a0a3c62723e7375646f206d7620776f72647072657373202f7661722f7777772f6e616d656f66626c6f670a3c62723e6364202f7661722f7777772f6e616d656f66626c6f670a3c62723e7375646f206d762077702d636f6e6669672d73616d706c652e7068702077702d636f6e6669672e7068700a3c62723e7375646f206e616e6f2077702d636f6e6669672e7068700a0a3c62723e0a4164642064657461696c73206f66206d7973716c207461626c6520666f7220626c6f672c206d7973716c20757365726e616d6520616e642070617373776f72642e0a0a3c62723e0a5468656e20676f746f20626c6f6720696e2062726f7773657220746f2066696e69736820696e7374616c6c6174696f6e2e, 0x7574662d38),
(34, 0x272727496e7374616c6c696e67204d6564696157696b692727270a3c62723e466f6c6c6f77656420746869732067756964652c20776f726b7320706572666563742e2057696c6c206d6179626520737465616c2074686520776f726473206c6174657220746f20736176652074696d65206f70656e696e6720616e6f746865722077656273697465202d200a3c62723e687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e3034, 0x7574662d38),
(35, 0x3c6269673e2727274e65726457696b692727273c2f6269673e0a0a746869732073686f756c64206e6f742062652076696577656420627920616e796f6e652e, 0x7574662d38),
(36, 0x3c6269673e2727274e65726457696b692727273c2f6269673e0a0a746869732073686f756c64206e6f742062652076696577656420627920616e796f6e652c206f6276696f75736c79206564697420746869732e, 0x7574662d38),
(37, 0x3c6269673e2727274e65726457696b692727273c2f6269673e0a0a546869732073686f756c64206e6f742062652076696577656420627920616e796f6e652c206f6276696f75736c79206564697420746869732e, 0x7574662d38),
(38, 0x272727496e7374616c6c696e67206769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c62723e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e312e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e312e7461722e677a0a3c62723e24206364206769742d312e372e312f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e0a3c62723e2420726d202d72206769742d312e372e31206769742d312e372e312e7461722e677a, 0x7574662d38),
(39, 0x272727496e7374616c6c696e67206769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c62723e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e312e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e312e7461722e677a0a3c62723e24206364206769742d312e372e312f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e0a3c62723e2420726d202d72206769742d312e372e31206769742d312e372e312e7461722e677a0a0a3c62723e0a2727274d616b696e672061206e6577207265706f2727270a3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e24206e616e6f20524541444d452028776974682077686174657665722074657874290a3c62723e242067697420696e69740a3c62723e242067697420616464202e2028746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c62723e242067697420636f6d6d6974202d6d2022496e697469616c20636f6d6d69742e220a0a3c62723e0a272727436c6f6e696e672061207265706f2727270a3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a31343636362f6769742f6e65777265706f0a0a3c62723e0a4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e24206769742070757368, 0x7574662d38),
(40, 0x272727496e7374616c6c696e67206769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c62723e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e312e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e312e7461722e677a0a3c62723e24206364206769742d312e372e312f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e0a3c62723e2420726d202d72206769742d312e372e31206769742d312e372e312e7461722e677a0a0a3c62723e0a2727274d616b696e672061206e6577207265706f2727270a3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e24206e616e6f20524541444d452028776974682077686174657665722074657874290a3c62723e242067697420696e69740a3c62723e242067697420616464202e2028746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c62723e242067697420636f6d6d6974202d6d2022496e697469616c20636f6d6d69742e220a0a3c62723e0a272727436c6f6e696e672061207265706f2727270a3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a31343636362f6769742f6e65777265706f0a0a3c62723e0a4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573680a0a3c62723e0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e496620796f752063616e6e6f74207075736820746f206f726967696e616c2072656d6f7465207265706f2062656361757365206f6620276272616e636820636865636b6564206f757427206f722073696d696c6172206572726f722c2072756e2074686973206f6e2072656d6f746520736572766572202d0a3c62723e242067697420636f6e666967202d2d626f6f6c20636f72652e6261726520747275650a3c62723e5468656e2064656c6574652072657374206f662066696c657320696e207265706f20657863657074202e67697420666f6c6465722e205468656e20796f752063616e20707573682066726f6d20636c69656e742e, 0x7574662d38),
(41, 0x272727496e7374616c6c696e67204d6564696157696b692727270a3c62723e466f6c6c6f77656420746869732067756964652c20776f726b7320706572666563742e2057696c6c206d6179626520737465616c2074686520776f726473206c6174657220746f20736176652074696d65206f70656e696e6720616e6f746865722077656273697465202d200a3c62723e687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e30340a0a3c62723e0a2727274d616b696e672077696b6920707269766174652727270a3c62723e546f206c696d69742065646974696e6720746f206f6e6c792061646d696e2075736572732c2065646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e6573202d0a0a3c62723e24776747726f75705065726d697373696f6e735b272a275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b2775736572275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b277379736f70275d5b2765646974275d203d20747275653b0a0a3c62723e5468656e2072657374617274206170616368652e, 0x7574662d38);
INSERT INTO `nw_text` (`old_id`, `old_text`, `old_flags`) VALUES
(42, 0x272727496e7374616c6c696e67204d6564696157696b692727270a3c62723e466f6c6c6f77656420746869732067756964652c20776f726b7320706572666563742e2057696c6c206d6179626520737465616c2074686520776f726473206c6174657220746f20736176652074696d65206f70656e696e6720616e6f746865722077656273697465202d200a3c62723e687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e30340a0a3c62723e0a2727274d616b696e672077696b6920707269766174652727270a3c62723e546f206c696d69742065646974696e6720746f206f6e6c792061646d696e2075736572732c2065646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e6573202d0a3c62723e24776747726f75705065726d697373696f6e735b272a275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b2775736572275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b277379736f70275d5b2765646974275d203d20747275653b0a3c62723e5468656e2072657374617274206170616368652e0a0a3c62723e0a4368616e67652077696b69206c6f676f0a3c62723e45646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e65202d0a3c62723e2477674c6f676f203d2022687474703a2f2f6c6f652e6f72672f6c6f676f2e706e67223b, 0x7574662d38),
(43, 0x272727496e7374616c6c696e67204d6564696157696b692727270a3c62723e466f6c6c6f77656420746869732067756964652c20776f726b7320706572666563742e2057696c6c206d6179626520737465616c2074686520776f726473206c6174657220746f20736176652074696d65206f70656e696e6720616e6f746865722077656273697465202d200a3c62723e687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e30340a0a3c62723e0a2727274d616b696e672077696b6920707269766174652727270a3c62723e546f206c696d69742065646974696e6720746f206f6e6c792061646d696e2075736572732c2065646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e6573202d0a3c62723e24776747726f75705065726d697373696f6e735b272a275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b2775736572275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b277379736f70275d5b2765646974275d203d20747275653b0a3c62723e5468656e2072657374617274206170616368652e0a0a3c62723e0a2727274368616e67652077696b69206c6f676f2727270a3c62723e45646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e65202d0a3c62723e2477674c6f676f203d2022687474703a2f2f6c6f652e6f72672f6c6f676f2e706e67223b, 0x7574662d38),
(44, 0x272727496e7374616c6c696e67204d6564696157696b692727270a3c62723e466f6c6c6f77656420746869732067756964652c20776f726b7320706572666563742e2057696c6c206d6179626520737465616c2074686520776f726473206c6174657220746f20736176652074696d65206f70656e696e6720616e6f746865722077656273697465202d200a3c62723e687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e30340a0a3c62723e0a2727274d616b696e672077696b6920707269766174652727270a3c62723e546f206c696d69742065646974696e6720746f206f6e6c792061646d696e2075736572732c2065646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e6573202d0a3c62723e24776747726f75705065726d697373696f6e735b272a275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b2775736572275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b277379736f70275d5b2765646974275d203d20747275653b0a3c62723e5468656e2072657374617274206170616368652e0a0a3c62723e0a2727274368616e67652077696b69206c6f676f2727270a3c62723e45646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e65202d0a3c62723e2477674c6f676f203d2022687474703a2f2f6c6f652e6f72672f6c6f676f2e706e67223b0a3c62723e5468656e2072657374617274206170616368652e, 0x7574662d38),
(45, 0x272727496e7374616c6c696e6720576f726470726573732727270a3c62723e7767657420687474703a2f2f776f726470726573732e6f72672f6c61746573742e7461722e677a0a3c62723e74617220787a7666206c61746573742e7461722e677a0a3c62723e7375646f206d7620776f72647072657373202f7661722f7777772f6e616d656f66626c6f670a3c62723e6364202f7661722f7777772f6e616d656f66626c6f670a3c62723e7375646f206d762077702d636f6e6669672d73616d706c652e7068702077702d636f6e6669672e7068700a3c62723e7375646f206e616e6f2077702d636f6e6669672e7068700a0a3c62723e0a4164642064657461696c73206f66206d7973716c207461626c6520666f7220626c6f672c206d7973716c20757365726e616d6520616e642070617373776f72642e0a0a3c62723e0a5468656e20676f746f20626c6f6720696e2062726f7773657220746f2066696e69736820696e7374616c6c6174696f6e2e0a0a3c62723e0a2727274d6f76696e6720626c6f6720746f206e6577207365727665722727270a3c62723e466f6c6c6f7720696e737472756374696f6e732066726f6d20576f726470726573732073697465202d200a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f4d6f76696e675f576f726450726573730a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f4261636b696e675f55705f596f75725f44617461626173650a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f526573746f72696e675f596f75725f44617461626173655f46726f6d5f4261636b7570, 0x7574662d38),
(46, 0x272727496e7374616c6c696e67204b6970706f20686f6e6579706f742727270a4261736564206f6e2031302e3034205365727665720a6170742d67657420696e7374616c6c20616c6c2074686f7365207468696e67730a6d7973716c2073657475700a61646475736572206b6970706f0a73766e20646f776e6c6f6164206b6970706f20676f6f676c65636f64650a45646974202e6366672066696c650a73746172742e7368, 0x7574662d38),
(47, 0x272727496e7374616c6c696e6720576f726470726573732727270a3c62723e7767657420687474703a2f2f776f726470726573732e6f72672f6c61746573742e7461722e677a0a3c62723e74617220787a7666206c61746573742e7461722e677a0a3c62723e7375646f206d7620776f72647072657373202f7661722f7777772f6e616d656f66626c6f670a3c62723e6364202f7661722f7777772f6e616d656f66626c6f670a3c62723e7375646f206d762077702d636f6e6669672d73616d706c652e7068702077702d636f6e6669672e7068700a3c62723e7375646f206e616e6f2077702d636f6e6669672e7068700a0a3c62723e0a4164642064657461696c73206f66206d7973716c207461626c6520666f7220626c6f672c206d7973716c20757365726e616d6520616e642070617373776f72642e0a0a3c62723e0a5468656e20676f746f20626c6f6720696e2062726f7773657220746f2066696e69736820696e7374616c6c6174696f6e2e0a0a3c62723e0a2727274d6f76696e6720626c6f6720746f206e6577207365727665722727270a3c62723e466f6c6c6f7720696e737472756374696f6e732066726f6d20576f726470726573732073697465202d200a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f4d6f76696e675f576f726450726573730a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f4261636b696e675f55705f596f75725f44617461626173650a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f526573746f72696e675f596f75725f44617461626173655f46726f6d5f4261636b75700a0a3c62723e0a4d616b6520626c6f67206469726563746f7279206f776e657220616e642067726f757020277777772d64617461272c2073616d6520617320757365722072756e6e696e67204170616368652e0a3c62723e434d4f4420616c6c206469726563746f727973203735352c20616c6c2066696c657320363434202d200a3c62723e66696e64205b796f7572207061746820686572655d202d747970652066202d657865632063686d6f6420373535207b7d205c3b0a3c62723e242066696e64205b796f7572207061746820686572655d202d747970652066202d657865632063686d6f6420363434207b7d205c3b0a3c62723e43484d4f442077702d636f6e74656e742f75706c6f61647320666f6c646572203737370a0a3c62723e4368616e67652055524c7320696e204d7953514c2077697468205048504d7941646d696e0a3c62723e436c69636b206f6e20626c6f672064617461626173652c207468656e2077705f6f7074696f6e730a3c62723e52756e2053514c20636f6d6d616e64202d200a3c62723e5550444154452077705f6f7074696f6e7320534554206f7074696f6e5f76616c7565203d207265706c616365286f7074696f6e5f76616c75652c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c2027687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d2729205748455245206f7074696f6e5f6e616d65203d2027686f6d6527204f52206f7074696f6e5f6e616d65203d20277369746575726c273b0a0a3c62723e436c69636b2077705f706f7374732c2072756e2053514c20636f6d6d616e64202d0a3c62723e5550444154452077705f706f737473205345542067756964203d207265706c61636528677569642c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c27687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d27293b0a0a3c62723e616e64202d0a3c62723e5550444154452077705f706f7374732053455420706f73745f636f6e74656e74203d207265706c61636528706f73745f636f6e74656e742c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c2027687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d27293b0a0a3c62723e0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e4d6179206861766520746f2061646a757374205065726d616c696e6b7320696e20576f726470726573732073657474696e677320696620636c69636b696e67206f6e2063617465676f7269657320616e6420706f737473206c6561647320746f206120343034206572726f722061667465722061206d6f76652e, 0x7574662d38),
(48, 0x272727496e7374616c6c696e67204d6564696157696b692727270a3c62723e466f6c6c6f77656420746869732067756964652c20776f726b7320706572666563742e2057696c6c206d6179626520737465616c2074686520776f726473206c6174657220746f20736176652074696d65206f70656e696e6720616e6f746865722077656273697465202d200a3c62723e687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e30340a0a3c62723e0a2727274d616b696e672077696b692070726976617465272727687474703a2f2f6c65616775656f666576696c2e6f72672f6e65726477696b692f696e6465782e7068703f7469746c653d4d6564696157696b6926616374696f6e3d656469740a3c62723e546f206c696d69742065646974696e6720746f206f6e6c792061646d696e2075736572732c2065646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e6573202d0a3c62723e24776747726f75705065726d697373696f6e735b272a275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b2775736572275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b277379736f70275d5b2765646974275d203d20747275653b0a3c62723e5468656e2072657374617274206170616368652e0a0a3c62723e0a2727274368616e67652077696b69206c6f676f2727270a3c62723e45646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020616e642061646420666f6c6c6f77696e67206c696e65202d0a3c62723e2477674c6f676f203d2022687474703a2f2f6c6f652e6f72672f6c6f676f2e706e67223b0a3c62723e5468656e2072657374617274206170616368652e0a0a3c62723e0a2727274d6f76696e672077696b692727270a3c62723e4261636b7570204d7953514c2064617461626173650a3c62723e4261636b75702074686520666f6c6c6f77696e67207061746873202d200a3c62723e2f6574632f6d6564696177696b690a3c62723e2f7573722f73686172652f6d6564696177696b690a3c62723e2f7661722f6c69622f6d6564696177696b690a0a3c62723e0a272727526573746f72696e672077696b692727270a3c62723e526573746f7265204d7953514c2064617461626173650a3c62723e496e7374616c6c204d6564696157696b690a3c62723e436f7079206261636b207468652061626f76652066696c65207061746820666f6c646572730a3c62723e45646974202f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e70687020746f206d61746368206e6577207365727665722073657474696e67730a3c62723e456e73757265207065726d697373696f6e73206172652073657420636f72726563746c79206f6e2074686520666f6c6c6f77696e67202d0a3c62723e2f7661722f6c69622f6d6564696177696b692f636f6e66696720616e6420696d6167657320666f6c64657273202873686f756c64206265207777772d64617461206f7220757365722072756e6e696e672061706163686532290a3c62723e2f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e706870202873686f756c64206265207777772d64617461206f7220757365722072756e6e696e67206170616368653229, 0x7574662d38),
(49, 0x272727496e7374616c6c696e67207068704d7941646d696e2727270a3c62723e6170742d67657420696e7374616c6c207068706d7961646d696e0a3c62723e5365742061706163686532207669727475616c20686f7374206f7220726564697265637420746f202f7573722f73686172652f7068706d7961646d696e, 0x7574662d38),
(50, 0x272727537465707320746f207365747570207365727665722727270a3c62723e242061646475736572206e6577757365720a3c62723e28757365202776697375646f2720617320726f6f7420746f20616464206e6577207573657220746f207375646f657273290a3c62723e2420616464757365722065676764726f700a3c62723e24206170742d67657420696e7374616c6c20697263642d6879627269640a3c62723e24206170742d67657420696e7374616c6c2073637265656e0a3c62723e24206170742d67657420696e7374616c6c2069727373690a3c62723e24206170742d67657420696e7374616c6c2065676764726f700a3c62723e24206170742d67657420696e7374616c6c206d6564696177696b690a3c62723e24206170742d67657420696e7374616c6c207068706d7961646d696e0a3c62723e45646974202f6574632f7373682f737368645f636f6e66696720746f2070726576656e7420726f6f74206163636573732c206368616e67652064656661756c7420706f72742c20616464206365727461696e2075736572732e0a3c62723e4d6f7665206261636b202f6574632f697263642d6879627269642f697263642e636f6e662066696c6520616e6420697263642e6d6f74642066696c652e0a3c62723e4d6f7665206261636b2065676764726f7020686f6d6520666f6c6465722c20696e636c7564696e6720626f74202e636f6e662066696c65732e0a3c62723e4d6f7665206261636b202e626173685f686973746f727920616e64202e626173685f616c69617365732066696c657320666f722075736572732e0a3c62723e526573746f7265206e65726477696b6920616e64206e6572646c6f67, 0x7574662d38),
(51, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e0a272727534f434b53352070726f78792727270a3c62723e737368202d70203134363636202d4420383038322075736572403132332e3135362e3135362e32330a0a3c62723e0a272727526576657273652074756e6e656c2727270a3c62723e4f6e2072656d6f7465206d616368696e652c205353482077697468202d0a3c62723e737368202d522031393939393a6c6f63616c686f73743a32322075736572403132332e3135362e3135362e32332028706f72742031393939392063616e20626520616e7920756e7573656420706f7274290a3c62723e3c62723e4f6e206c6f63616c206d616368696e652c205353482077697468202d0a3c62723e737368206c6f63616c686f7374202d702031393939390a0a3c62723e0a2727275265766572736520564e432074756e6e656c2727270a3c62723e4f6e2072656d6f7465207365727665722c2072756e202d0a3c62723e24207373682075736572406f746865727365727665722e6e6574202d5220353930303a3132372e302e302e313a353930300a3c62723e7468656e206f6e206c6f63616c20636c69656e742c20636f6e6e65637420746f20564e43206f6e206c6f63616c686f73742076696120706f72742035393030, 0x7574662d38),
(52, 0x24207375646f206e657473746174202d74706c, 0x7574662d38),
(53, 0x272727496e7374616c6c696e6720576f726470726573732727270a3c62723e7767657420687474703a2f2f776f726470726573732e6f72672f6c61746573742e7461722e677a0a3c62723e74617220787a7666206c61746573742e7461722e677a0a3c62723e7375646f206d7620776f72647072657373202f7661722f7777772f6e616d656f66626c6f670a3c62723e6364202f7661722f7777772f6e616d656f66626c6f670a3c62723e7375646f206d762077702d636f6e6669672d73616d706c652e7068702077702d636f6e6669672e7068700a3c62723e7375646f206e616e6f2077702d636f6e6669672e7068700a0a3c62723e0a4164642064657461696c73206f66206d7973716c207461626c6520666f7220626c6f672c206d7973716c20757365726e616d6520616e642070617373776f72642e0a0a3c62723e0a5468656e20676f746f20626c6f6720696e2062726f7773657220746f2066696e69736820696e7374616c6c6174696f6e2e0a0a3c62723e0a2727274d6f76696e6720626c6f6720746f206e6577207365727665722727270a3c62723e466f6c6c6f7720696e737472756374696f6e732066726f6d20576f726470726573732073697465202d200a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f4d6f76696e675f576f726450726573730a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f4261636b696e675f55705f596f75725f44617461626173650a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f526573746f72696e675f596f75725f44617461626173655f46726f6d5f4261636b75700a0a3c62723e0a4d616b6520626c6f67206469726563746f7279206f776e657220616e642067726f757020277777772d64617461272c2073616d6520617320757365722072756e6e696e67204170616368652e0a3c62723e434d4f4420616c6c206469726563746f72696573203735352c20616c6c2066696c657320363434202d200a3c62723e242066696e64205b796f7572207061746820686572655d202d747970652064202d657865632063686d6f6420373535207b7d205c3b0a3c62723e242066696e64205b796f7572207061746820686572655d202d747970652066202d657865632063686d6f6420363434207b7d205c3b0a3c62723e242063686d6f64203737372077702d636f6e74656e742f75706c6f6164730a0a3c62723e4368616e67652055524c7320696e204d7953514c2077697468205048504d7941646d696e0a3c62723e436c69636b206f6e20626c6f672064617461626173652c207468656e2077705f6f7074696f6e730a3c62723e52756e2053514c20636f6d6d616e64202d200a3c62723e5550444154452077705f6f7074696f6e7320534554206f7074696f6e5f76616c7565203d207265706c616365286f7074696f6e5f76616c75652c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c2027687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d2729205748455245206f7074696f6e5f6e616d65203d2027686f6d6527204f52206f7074696f6e5f6e616d65203d20277369746575726c273b0a0a3c62723e436c69636b2077705f706f7374732c2072756e2053514c20636f6d6d616e64202d0a3c62723e5550444154452077705f706f737473205345542067756964203d207265706c61636528677569642c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c27687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d27293b0a0a3c62723e616e64202d0a3c62723e5550444154452077705f706f7374732053455420706f73745f636f6e74656e74203d207265706c61636528706f73745f636f6e74656e742c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c2027687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d27293b0a0a3c62723e0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e4d6179206861766520746f2061646a757374205065726d616c696e6b7320696e20576f726470726573732073657474696e677320696620636c69636b696e67206f6e2063617465676f7269657320616e6420706f737473206c6561647320746f206120343034206572726f722061667465722061206d6f76652e, 0x7574662d38),
(54, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e0a272727534f434b53352070726f78792727270a3c62723e737368202d70203134363636202d4420383038322075736572403132332e3135362e3135362e32330a0a3c62723e0a272727526576657273652074756e6e656c2727270a3c62723e4f6e2072656d6f7465206d616368696e652c205353482077697468202d0a3c62723e737368202d522031393939393a6c6f63616c686f73743a32322075736572403132332e3135362e3135362e32332028706f72742031393939392063616e20626520616e7920756e7573656420706f7274290a3c62723e3c62723e4f6e206c6f63616c206d616368696e652c205353482077697468202d0a3c62723e737368206c6f63616c686f7374202d702031393939390a0a3c62723e0a2727275265766572736520564e432074756e6e656c2727270a3c62723e4f6e2072656d6f7465207365727665722c2072756e202d0a3c62723e24207373682075736572406f746865727365727665722e6e6574202d5220353930303a3132372e302e302e313a353930300a3c62723e7468656e206f6e206c6f63616c20636c69656e742c20636f6e6e65637420746f20564e43206f6e206c6f63616c686f73742076696120706f727420353930300a0a3c62723e0a27272750617373776f72642d6c657373205353482727270a3c62723e2873746f6c656e2066726f6d20687474703a2f2f6c65616775656f666576696c2e6f72672f6e6572642f3f703d333334290a3c62723e546f20656e61626c652070617373776f72642d6c65737320535348206c6f67696e206265747765656e2074776f206d616368696e65732c2061207075626c6963206b6579202869645f7273612e70756229206d7573742062652067656e657261746564206f6e20796f757220686f6d65206d616368696e6520616e64207468656e2075706c6f6164656420746f20612072656d6f7465206d616368696e652e20546869732077696c6c20656e61626c6520796f7520746f206c6f6720696e20746f207468652072656d6f7465206d616368696e6520616e64206e6f742062652070726f6d7074656420666f7220612070617373776f72642e0a0a546f2067656e657261746520616e2069645f7273612e7075622066696c652c206f70656e2075702061207465726d696e616c20616e6420747970652074686520666f6c6c6f77696e673a0a0a7373682d6b657967656e202d74207273610a0a4a75737420707265737320e28098656e746572e2809920666f7220616c6c206f662074686520666f6c6c6f77696e672070726f6d7074733a0a0a47656e65726174696e67207075626c69632f7072697661746520727361206b657920706169722e0a456e7465722066696c6520696e20776869636820746f207361766520746865206b657920282f686f6d652f757365722f2e7373682f69645f727361293a0a456e74657220706173737068726173652028656d70747920666f72206e6f2070617373706872617365293a0a456e7465722073616d65207061737370687261736520616761696e3a0a596f7572206964656e74696669636174696f6e20686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e0a596f7572207075626c6963206b657920686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e7075622e0a0a546869732077696c6c206c6561766520746865207061737370687261736520656d7074792c20656e61626c696e672070617373776f72642d6c657373206c6f67696e2e0a0a4e6f77207468617420746865207075626c6963206b65792066696c6520686173206265656e2067656e657261746564206974206e6565647320746f206265207472616e7366657272656420746f207468652072656d6f7465206d616368696e6520746861742077652077616e7420746f206c6f6720696e20746f2e20596f752063616e20757365207273796e632c207363702c204654502c206f7220616e797468696e672073696d696c61722c206a757374206173206c6f6e67206173207468652069645f7273612e7075622066696c652074686174207761732067656e657261746564206973207472616e7366657272656420746f207e2f2e7373682f617574686f72697a65645f6b657973206f6e207468652072656d6f7465207365727665722e2048657265e2809973206120666577206578616d706c65733a0a0a312e20736370207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579730a322e207273796e63202d2d70726f6772657373202d6520737368207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579730a332e207373682d636f70792d6964202d69207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d0a0a4f6e63652069645f7273612e70756220686173206265656e207472616e736665727265642c2074727920746f2053534820746f207468652072656d6f7465207365727665722e2049662065766572797468696e672077656e74204f4b207468656e20796f752073686f756c646ee28099742062652070726f6d7074656420666f7220612070617373776f72642e0a0a496620697420646f73656ee280997420776f726b2c20656974686572207468652053534820636f6e66696775726174696f6e206f6e207468652072656d6f7465206d616368696e652069736ee28099742073657420757020746f20616363657074207075626c6963206b65797320616e642070617373776f72642d6c657373206c6f67696e732c206f7220746865207065726d697373696f6e73206f66207468652069645f7273612e7075622066696c652061726520696e636f72726563742e20476f6f676c6520697320796f757220667269656e6420686572652c20616e6420616c736f2074686973206c696e6b2068617320736f6d652068656c7066756c2068696e74732e, 0x7574662d38),
(55, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e0a272727534f434b53352070726f78792727270a3c62723e737368202d70203134363636202d4420383038322075736572403132332e3135362e3135362e32330a0a3c62723e0a272727526576657273652074756e6e656c2727270a3c62723e4f6e2072656d6f7465206d616368696e652c205353482077697468202d0a3c62723e737368202d522031393939393a6c6f63616c686f73743a32322075736572403132332e3135362e3135362e32332028706f72742031393939392063616e20626520616e7920756e7573656420706f7274290a3c62723e3c62723e4f6e206c6f63616c206d616368696e652c205353482077697468202d0a3c62723e737368206c6f63616c686f7374202d702031393939390a0a3c62723e0a2727275265766572736520564e432074756e6e656c2727270a3c62723e4f6e2072656d6f7465207365727665722c2072756e202d0a3c62723e24207373682075736572406f746865727365727665722e6e6574202d5220353930303a3132372e302e302e313a353930300a3c62723e7468656e206f6e206c6f63616c20636c69656e742c20636f6e6e65637420746f20564e43206f6e206c6f63616c686f73742076696120706f727420353930300a0a3c62723e0a27272750617373776f72642d6c657373205353482727270a3c62723e2873746f6c656e2066726f6d20687474703a2f2f6c65616775656f666576696c2e6f72672f6e6572642f3f703d333334290a3c62723e546f20656e61626c652070617373776f72642d6c65737320535348206c6f67696e206265747765656e2074776f206d616368696e65732c2061207075626c6963206b6579202869645f7273612e70756229206d7573742062652067656e657261746564206f6e20796f757220686f6d65206d616368696e6520616e64207468656e2075706c6f6164656420746f20612072656d6f7465206d616368696e652e20546869732077696c6c20656e61626c6520796f7520746f206c6f6720696e20746f207468652072656d6f7465206d616368696e6520616e64206e6f742062652070726f6d7074656420666f7220612070617373776f72642e0a0a3c62723e546f2067656e657261746520616e2069645f7273612e7075622066696c652c206f70656e2075702061207465726d696e616c20616e6420747970652074686520666f6c6c6f77696e673a0a0a3c62723e24207373682d6b657967656e202d74207273610a0a3c62723e4a75737420707265737320e28098656e746572e2809920666f7220616c6c206f662074686520666f6c6c6f77696e672070726f6d7074733a0a0a3c62723e47656e65726174696e67207075626c69632f7072697661746520727361206b657920706169722e0a3c62723e456e7465722066696c6520696e20776869636820746f207361766520746865206b657920282f686f6d652f757365722f2e7373682f69645f727361293a0a3c62723e456e74657220706173737068726173652028656d70747920666f72206e6f2070617373706872617365293a0a3c62723e456e7465722073616d65207061737370687261736520616761696e3a0a3c62723e596f7572206964656e74696669636174696f6e20686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e0a3c62723e596f7572207075626c6963206b657920686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e7075622e0a0a3c62723e546869732077696c6c206c6561766520746865207061737370687261736520656d7074792c20656e61626c696e672070617373776f72642d6c657373206c6f67696e2e0a0a3c62723e4e6f77207468617420746865207075626c6963206b65792066696c6520686173206265656e2067656e657261746564206974206e6565647320746f206265207472616e7366657272656420746f207468652072656d6f7465206d616368696e6520746861742077652077616e7420746f206c6f6720696e20746f2e20596f752063616e20757365207273796e632c207363702c204654502c206f7220616e797468696e672073696d696c61722c206a757374206173206c6f6e67206173207468652069645f7273612e7075622066696c652074686174207761732067656e657261746564206973207472616e7366657272656420746f207e2f2e7373682f617574686f72697a65645f6b657973206f6e207468652072656d6f7465207365727665722e2048657265e2809973206120666577206578616d706c65733a0a0a3c62723e312e202420736370207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579730a3c62723e322e2024207273796e63202d2d70726f6772657373202d6520737368207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579730a3c62723e332e2024207373682d636f70792d6964202d69207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d0a0a3c62723e4f6e63652069645f7273612e70756220686173206265656e207472616e736665727265642c2074727920746f2053534820746f207468652072656d6f7465207365727665722e2049662065766572797468696e672077656e74204f4b207468656e20796f752073686f756c646ee28099742062652070726f6d7074656420666f7220612070617373776f72642e0a0a3c62723e496620697420646f73656ee280997420776f726b2c20656974686572207468652053534820636f6e66696775726174696f6e206f6e207468652072656d6f7465206d616368696e652069736ee28099742073657420757020746f20616363657074207075626c6963206b65797320616e642070617373776f72642d6c657373206c6f67696e732c206f7220746865207065726d697373696f6e73206f66207468652069645f7273612e7075622066696c652061726520696e636f72726563742e20476f6f676c6520697320796f757220667269656e6420686572652c20616e6420616c736f2074686973206c696e6b2068617320736f6d652068656c7066756c2068696e74732028687474703a2f2f7777772e64656269616e2d61646d696e697374726174696f6e2e6f72672f61727469636c65732f313532292e, 0x7574662d38),
(56, 0x272727496e7374616c6c696e67204b6970706f20686f6e6579706f742727270a3c62723e4261736564206f6e2031302e3034205365727665720a3c62723e24206170742d67657420696e7374616c6c20707974686f6e2d7477697374656420707974686f6e2d6d7973716c64622073756276657273696f6e0a3c62723e242061646475736572206b6970706f0a3c62723e242073766e20636865636b6f757420687474703a2f2f6b6970706f2e676f6f676c65636f64652e636f6d2f73766e2f7472756e6b2f202f686f6d652f6b6970706f0a3c62723e24206370202f686f6d652f6b6970706f2f6b6970706f2e6366672e64697374202f686f6d652f6b6970706f2f6b6970706f2e6366670a3c62723e2727436f6e666967757265206b6970706f20746f206c6f6720696e746f204d7953514c202d27270a3c62723e24206d7973716c202d7520726f6f74202d700a3c62723e2420637265617465206461746162617365206b6970706f3b0a3c62723e24206772616e7420616c6c2070726976696c65676573206f6e206b6970706f2e2a20746f20276b6970706f27406c6f63616c686f7374206964656e7469666965642062792027736563726574273b0a3c62723e2420657869743b0a3c62723e24206d7973716c202d756b6970706f202d70736563726574206b6970706f203c202f686f6d652f6b6970706f2f646f632f73716c2f6d7973716c2e73716c0a3c62723e272745646974202e6366672066696c6520746f20636f6e6e65637420746f204d7953514c206461746162617365202d2727200a3c62723e5b64617461626173655f6d7973716c5d20686f7374203d206c6f63616c686f73740a3c62723e64617461627365203d206b6970706f0a3c62723e757365726e616d65203d206b6970706f0a3c62723e70617373776f7264203d207365637265740a3c62723e27274c6f67696e206173206b6970706f2028776f6e27742072756e20617320726f6f74292c207374617274204b6970706f202d2727200a3c62723e24202e2f73746172742e73680a0a3c62723e0a272742792064656661756c74204b6970706f2072756e73206f6e20706f727420323232322e2052756e207468697320636f6d6d616e6420746f20726f75746520746f2064656661756c742053534820323220706f727420286e6f74653a207468697320636f6d6d616e642077696c6c206861766520746f2062652072756e20616761696e2069662073797374656d2069732072657374617274656429202d2727200a3c62723e242069707461626c6573202d74206e6174202d4120505245524f5554494e47202d692065746830202d7020746370202d64706f7274203232202d6a205245444952454354202d746f2d706f72742032323232, 0x7574662d38),
(57, 0x272727496e7374616c6c696e67204b6970706f20686f6e6579706f742727270a3c62723e4261736564206f6e2031302e3034205365727665720a3c62723e24206170742d67657420696e7374616c6c20707974686f6e2d7477697374656420707974686f6e2d6d7973716c64622073756276657273696f6e0a3c62723e242061646475736572206b6970706f0a3c62723e242073766e20636865636b6f757420687474703a2f2f6b6970706f2e676f6f676c65636f64652e636f6d2f73766e2f7472756e6b2f202f686f6d652f6b6970706f0a3c62723e24206370202f686f6d652f6b6970706f2f6b6970706f2e6366672e64697374202f686f6d652f6b6970706f2f6b6970706f2e6366670a3c62723e2727436f6e666967757265206b6970706f20746f206c6f6720696e746f204d7953514c202d27270a3c62723e24206d7973716c202d7520726f6f74202d700a3c62723e2420637265617465206461746162617365206b6970706f3b0a3c62723e24206772616e7420616c6c2070726976696c65676573206f6e206b6970706f2e2a20746f20276b6970706f27406c6f63616c686f7374206964656e7469666965642062792027736563726574273b0a3c62723e2420657869743b0a3c62723e24206d7973716c202d756b6970706f202d70736563726574206b6970706f203c202f686f6d652f6b6970706f2f646f632f73716c2f6d7973716c2e73716c0a3c62723e272745646974202e6366672066696c6520746f20636f6e6e65637420746f204d7953514c206461746162617365202d2727200a3c62723e5b64617461626173655f6d7973716c5d20686f7374203d206c6f63616c686f73740a3c62723e64617461627365203d206b6970706f0a3c62723e757365726e616d65203d206b6970706f0a3c62723e70617373776f7264203d207365637265740a3c62723e27274c6f67696e206173206b6970706f2028776f6e27742072756e20617320726f6f74292c207374617274204b6970706f202d2727200a3c62723e24202e2f73746172742e73680a0a3c62723e0a272742792064656661756c74204b6970706f2072756e73206f6e20706f727420323232322e2052756e207468697320636f6d6d616e6420746f20726f75746520746f2064656661756c742053534820323220706f727420286e6f74653a207468697320636f6d6d616e642077696c6c206861766520746f2062652072756e20616761696e2069662073797374656d2069732072657374617274656429202d2727200a3c62723e242069707461626c6573202d74206e6174202d4120505245524f5554494e47202d692065746830202d7020746370202d64706f7274203232202d6a205245444952454354202d746f2d706f727420323232320a0a3c62723e4c6f672066696c657320617265206b65707420696e202f686f6d652f6b6970706f2f6c6f672f7474792c20646f776e6c6f616465642066696c6573206b65707420696e202f686f6d652f6b6970706f2f646c, 0x7574662d38),
(58, 0x272727496e7374616c6c696e67204b6970706f20686f6e6579706f742727270a3c62723e4261736564206f6e2031302e3034205365727665720a3c62723e24206170742d67657420696e7374616c6c20707974686f6e2d7477697374656420707974686f6e2d6d7973716c64622073756276657273696f6e0a3c62723e242061646475736572206b6970706f0a3c62723e242073766e20636865636b6f757420687474703a2f2f6b6970706f2e676f6f676c65636f64652e636f6d2f73766e2f7472756e6b2f202f686f6d652f6b6970706f0a3c62723e24206370202f686f6d652f6b6970706f2f6b6970706f2e6366672e64697374202f686f6d652f6b6970706f2f6b6970706f2e6366670a0a3c62723e2727436f6e666967757265206b6970706f20746f206c6f6720696e746f204d7953514c202d27270a3c62723e24206d7973716c202d7520726f6f74202d700a3c62723e2420637265617465206461746162617365206b6970706f3b0a3c62723e24206772616e7420616c6c2070726976696c65676573206f6e206b6970706f2e2a20746f20276b6970706f27406c6f63616c686f7374206964656e7469666965642062792027736563726574273b0a3c62723e2420657869743b0a3c62723e24206d7973716c202d756b6970706f202d70736563726574206b6970706f203c202f686f6d652f6b6970706f2f646f632f73716c2f6d7973716c2e73716c0a0a3c62723e272745646974202e6366672066696c6520746f20636f6e6e65637420746f204d7953514c206461746162617365202d2727200a3c62723e5b64617461626173655f6d7973716c5d20686f7374203d206c6f63616c686f73740a3c62723e64617461627365203d206b6970706f0a3c62723e757365726e616d65203d206b6970706f0a3c62723e70617373776f7264203d207365637265740a0a3c62723e27274c6f67696e206173206b6970706f2028776f6e27742072756e20617320726f6f74292c207374617274204b6970706f202d2727200a3c62723e24202e2f73746172742e73680a0a3c62723e0a272742792064656661756c74204b6970706f2072756e73206f6e20706f727420323232322e2052756e207468697320636f6d6d616e6420746f20726f75746520746f2064656661756c742053534820323220706f727420286e6f74653a207468697320636f6d6d616e642077696c6c206861766520746f2062652072756e20616761696e2069662073797374656d2069732072657374617274656429202d2727200a3c62723e242069707461626c6573202d74206e6174202d4120505245524f5554494e47202d692065746830202d7020746370202d64706f7274203232202d6a205245444952454354202d746f2d706f727420323232320a0a3c62723e4c6f672066696c657320617265206b65707420696e202f686f6d652f6b6970706f2f6c6f672f7474792c20646f776e6c6f616465642066696c6573206b65707420696e202f686f6d652f6b6970706f2f646c, 0x7574662d38),
(59, 0x27274c6973742070726f6365737365732077697468206f70656e20706f727473202d27270a3c62723e24207375646f206e657473746174202d74706c0a0a3c62723e2727275461722727270a3c62723e2727436f6d707265737320612066696c65202d2727200a3c62723e2420746172202d637a662077686174657665722e74617220666f6c6465726e616d650a0a2727556e74617220612066696c65202d2727200a3c62723e2420746172202d78662077686174657665722e7461720a0a2727546172206f7074696f6e73202d2727200a3c62723e2d63203d206372656174650a3c62723e2d66203d207265616420746f2f66726f6d20746865206e616d65642066696c650a3c62723e2d74203d206c69737420636f6e74656e7473206f66202e7461722066696c650a3c62723e2d72203d20617070656e6420746f2061202e7461722066696c650a3c62723e2d76203d20766572626f73650a3c62723e2d78203d206578747261637420636f6e74656e7473206f66202e7461722066696c650a3c62723e2d7a203d20636f6d70726573732066696c6573, 0x7574662d38),
(60, 0x616464206c6f67696e206261636b67726f756e64206a706720746f203c636f64653e2f7573722f73686172652f6261636b67726f756e64733c2f636f64653e207573696e67207375646f20666f72207065726d697373696f6e730a0a7468656e203c636f64653e7375646f206370202f7573722f73686172652f6170706c69636174696f6e732f676e6f6d652d617070656172616e63652d70726f706572746965732e6465736b746f70202f7573722f73686172652f67646d2f6175746f73746172742f4c6f67696e57696e646f773c2f636f64653e0a0a6c6f676f7574206f6620676e6f6d652c20617070656172616e6365206469616c6f67756520706f7073207570206f6e206e657874206c6f67696e2070726f6d70742e206368616e67652073657474696e6773206c696b6520636f6c6f757220736368656d652c207468656d652c206261636b67726f756e64206574632c20636c6f736520616e64207468656e206c6f67696e20616761696e2e20756e686f6f6b20617070656172616e6365206469616c6f67756520776974683a0a0a3c636f64653e7375646f20756e6c696e6b202f7573722f73686172652f67646d2f6175746f73746172742f4c6f67696e57696e646f772f676e6f6d652d617070656172616e63652d70726f706572746965732e6465736b746f703c2f636f64653e, 0x7574662d38),
(61, 0x27272753656375726520535348207365727665722727270a3c62723e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669670a3c62723e3c62723e0a272744697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e20757365727327270a3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965730a3c62723e3c62723e0a27274368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c736527270a3c62723e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636360a0a3c62723e0a272727534f434b53352070726f78792727270a3c62723e737368202d70203134363636202d4420383038322075736572403132332e3135362e3135362e32330a0a3c62723e0a272727526576657273652074756e6e656c2727270a3c62723e4f6e2072656d6f7465206d616368696e652c205353482077697468202d0a3c62723e737368202d522031393939393a6c6f63616c686f73743a32322075736572403132332e3135362e3135362e32332028706f72742031393939392063616e20626520616e7920756e7573656420706f7274290a3c62723e3c62723e4f6e206c6f63616c206d616368696e652c205353482077697468202d0a3c62723e737368206c6f63616c686f7374202d702031393939390a0a3c62723e0a2727275265766572736520564e432074756e6e656c2727270a3c62723e4f6e2072656d6f7465207365727665722c2072756e202d0a3c62723e24207373682075736572406f746865727365727665722e6e6574202d5220353930303a3132372e302e302e313a353930300a3c62723e7468656e206f6e206c6f63616c20636c69656e742c20636f6e6e65637420746f20564e43206f6e206c6f63616c686f73742076696120706f727420353930300a0a3c62723e0a27272750617373776f72642d6c657373205353482727270a3c62723e2873746f6c656e2066726f6d20687474703a2f2f6c65616775656f666576696c2e6f72672f6e6572642f3f703d333334290a3c62723e546f20656e61626c652070617373776f72642d6c65737320535348206c6f67696e206265747765656e2074776f206d616368696e65732c2061207075626c6963206b6579202869645f7273612e70756229206d7573742062652067656e657261746564206f6e20796f757220686f6d65206d616368696e6520616e64207468656e2075706c6f6164656420746f20612072656d6f7465206d616368696e652e20546869732077696c6c20656e61626c6520796f7520746f206c6f6720696e20746f207468652072656d6f7465206d616368696e6520616e64206e6f742062652070726f6d7074656420666f7220612070617373776f72642e0a0a3c62723e546f2067656e657261746520616e2069645f7273612e7075622066696c652c206f70656e2075702061207465726d696e616c20616e6420747970652074686520666f6c6c6f77696e673a0a0a3c62723e24207373682d6b657967656e202d74207273610a0a3c62723e4a75737420707265737320e28098656e746572e2809920666f7220616c6c206f662074686520666f6c6c6f77696e672070726f6d7074733a0a0a3c62723e47656e65726174696e67207075626c69632f7072697661746520727361206b657920706169722e0a3c62723e456e7465722066696c6520696e20776869636820746f207361766520746865206b657920282f686f6d652f757365722f2e7373682f69645f727361293a0a3c62723e456e74657220706173737068726173652028656d70747920666f72206e6f2070617373706872617365293a0a3c62723e456e7465722073616d65207061737370687261736520616761696e3a0a3c62723e596f7572206964656e74696669636174696f6e20686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e0a3c62723e596f7572207075626c6963206b657920686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e7075622e0a0a3c62723e546869732077696c6c206c6561766520746865207061737370687261736520656d7074792c20656e61626c696e672070617373776f72642d6c657373206c6f67696e2e0a0a3c62723e4e6f77207468617420746865207075626c6963206b65792066696c6520686173206265656e2067656e657261746564206974206e6565647320746f206265207472616e7366657272656420746f207468652072656d6f7465206d616368696e6520746861742077652077616e7420746f206c6f6720696e20746f2e20596f752063616e20757365207273796e632c207363702c204654502c206f7220616e797468696e672073696d696c61722c206a757374206173206c6f6e67206173207468652069645f7273612e7075622066696c652074686174207761732067656e657261746564206973207472616e7366657272656420746f207e2f2e7373682f617574686f72697a65645f6b657973206f6e207468652072656d6f7465207365727665722e2048657265e2809973206120666577206578616d706c65733a0a0a3c62723e312e202420736370207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579730a3c62723e322e2024207273796e63202d2d70726f6772657373202d6520737368207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579730a3c62723e332e2024207373682d636f70792d6964202d69207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d0a0a3c62723e4f6e63652069645f7273612e70756220686173206265656e207472616e736665727265642c2074727920746f2053534820746f207468652072656d6f7465207365727665722e2049662065766572797468696e672077656e74204f4b207468656e20796f752073686f756c646ee28099742062652070726f6d7074656420666f7220612070617373776f72642e0a0a3c62723e496620697420646f73656ee280997420776f726b2c20656974686572207468652053534820636f6e66696775726174696f6e206f6e207468652072656d6f7465206d616368696e652069736ee28099742073657420757020746f20616363657074207075626c6963206b65797320616e642070617373776f72642d6c657373206c6f67696e732c206f7220746865207065726d697373696f6e73206f66207468652069645f7273612e7075622066696c652061726520696e636f72726563742e20476f6f676c6520697320796f757220667269656e6420686572652c20616e6420616c736f2074686973206c696e6b2068617320736f6d652068656c7066756c2068696e74732028687474703a2f2f7777772e64656269616e2d61646d696e697374726174696f6e2e6f72672f61727469636c65732f313532292e3c62723e0a0a3c62723e0a2727274368616e676520737368206c6f67696e2062616e6e6572206574632727270a3c62723e6d6f7665206f6c642066696c65206173206261636b75702c207375646f206d76202f6574632f6d6f7464202f6574632f6d6f74642e62616b3c62723e0a637265617465206e6577202f6574632f6d6f74642066696c652028706f73742d6c6f67696e206d657373616765292c20736176652e3c62723e0a6164642f6564697420666f6c6c6f77696e67206c696e6520696e202f6574632f64656661756c742f726353202d2d2022454449544d4f54443d6e6f223c62723e0a7375646f206e616e6f202f6574632f7373682f737368645f636f6e66696720616e6420756e636f6d6d656e74207468652042616e6e6572206c696e65207769746820222f6574632f69737375652e6e6574223c62723e0a3c636f64653e7375646f206e616e6f202f6574632f69737375652e6e65743c2f636f64653e202d2d20646973706c61796564206f6e20636f6e6e6563742c207072652d6c6f67696e3c62723e0a3c636f64653e7375646f206e616e6f202f6574632f6d6f74643c2f636f64653e202d2d20646973706c6179656420706f73742d6c6f67696e3c62723e0a686176652061206c6f6f6b206174202f6574632f7570646174652d6d6f74642e642f30302d6865616465722028776861747320676f696e67206f6e2074686572653f293c62723e0a3c636f64653e2f6574632f696e69742e642f73736820726573746172743c2f636f64653e0a696620646f6e652070726f7065726c792c20776f6e277420616c6c20646973617070656172206f6e207265626f6f7421, 0x7574662d38),
(62, 0x272727496e7374616c6c696e67206769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c62723e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e312f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a3c62723e0a2727274d616b696e672061206e6577207265706f2727270a3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d452028776974682077686174657665722074657874290a3c62723e242067697420616464202e2028746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e270a0a3c62723e272727436865636b696e67206f75742061206e6577206272616e63682727270a3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e740a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e270a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c62723e2420676974206272616e63680a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c62723e242067697420636865636b6f7574206d617374657220286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c62723e2420676974206d6572676520646576656c6f706d656e740a0a3c62723e0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f0a0a3c62723e4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e636820746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573680a0a3c62723e4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63680a0a3c62723e0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e, 0x7574662d38);
INSERT INTO `nw_text` (`old_id`, `old_text`, `old_flags`) VALUES
(63, 0x272727496e7374616c6c696e67206769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c62723e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e342f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a3c62723e0a2727274d616b696e672061206e6577207265706f2727270a3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d452028776974682077686174657665722074657874290a3c62723e242067697420616464202e2028746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e270a0a3c62723e272727436865636b696e67206f75742061206e6577206272616e63682727270a3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e740a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e270a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c62723e2420676974206272616e63680a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c62723e242067697420636865636b6f7574206d617374657220286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c62723e2420676974206d6572676520646576656c6f706d656e740a0a3c62723e0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f0a0a3c62723e4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e636820746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573680a0a3c62723e4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63680a0a3c62723e0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e, 0x7574662d38),
(64, 0x272727677265702727270a0a3c62723e272746696e642061204241534820636f6d6d616e6420796f752776652070726576696f75736c792075736564202d27270a3c62723e2420686973746f7279207c2067726570206769740a3c62723e546869732077696c6c206c69737420616e7920636f6d6d616e6473207769746820276769742720696e20746865206c696e652e0a0a3c62723e272746696e642072756e6e696e672070726f636573736573206279206e616d65202d2727200a3c62723e707320617578207c2067726570206170616368650a3c62723e546869732077696c6c206c69737420616e792070726f636573736573207468617420617061636865322069732072756e6e696e672e0a0a3c62723e27274f7574707574206772657020746f2066696c65202d27270a3c62723e686973746f7279207c20677265702065676764726f70203e202f686f6d652f757365722f65676764726f70626173682e7478740a3c62723e707320617578207c2067726570207371756964203e20737175696470726f636365732e747874, 0x7574662d38),
(65, 0x272727477265702727270a0a3c62723e272746696e642061204241534820636f6d6d616e6420796f752776652070726576696f75736c792075736564202d27270a3c62723e2420686973746f7279207c2067726570206769740a3c62723e546869732077696c6c206c69737420616e7920636f6d6d616e6473207769746820276769742720696e20746865206c696e652e0a0a3c62723e272746696e642072756e6e696e672070726f636573736573206279206e616d65202d2727200a3c62723e2420707320617578207c2067726570206170616368650a3c62723e546869732077696c6c206c69737420616e792070726f636573736573207468617420617061636865322069732072756e6e696e672e0a0a3c62723e272746696e642066696c657320696e2061206469726563746f7279202d27270a3c62723e24206c73207c206772657020736f6d6566696c650a0a3c62723e27274f7574707574206772657020746f2066696c65202d27270a3c62723e686973746f7279207c20677265702065676764726f70203e202f686f6d652f757365722f65676764726f70626173682e7478740a3c62723e707320617578207c2067726570207371756964203e20737175696470726f636365732e7478740a3c62723e657463, 0x7574662d38),
(66, 0x272727496e7374616c6c696e67206769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c636f64653e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e342f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e3c2f636f64653e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a2727274d616b696e672061206e6577207265706f2727270a3c636f64653e3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d453c2f636f64653e2028776974682077686174657665722074657874290a3c636f64653e3c62723e242067697420616464202e203c2f636f64653e28746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c636f64653e3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e273c2f636f64653e0a0a2727274272616e636865732727270a3c62723e2727436865636b696e67206f75742061206e6577206272616e636827270a3c636f64653e3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e743c2f636f64653e0a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e273c2f636f64653e0a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c636f64653e3c62723e2420676974206272616e63683c2f636f64653e0a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c636f64653e3c62723e242067697420636865636b6f7574206d6173746572203c2f636f64653e286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c636f64653e3c62723e2420676974206d6572676520646576656c6f706d656e743c2f636f64653e0a0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c636f64653e3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f3c2f636f64653e0a0a4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e636820746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573683c2f636f64653e0a0a4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c636f64653e3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63683c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e, 0x7574662d38),
(67, 0x272727496e7374616c6c696e67204769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c636f64653e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e342f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e3c2f636f64653e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a2727274d616b696e672061206e6577207265706f2727270a3c636f64653e3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d453c2f636f64653e2028776974682077686174657665722074657874290a3c636f64653e3c62723e242067697420616464202e203c2f636f64653e28746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c636f64653e3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e273c2f636f64653e0a0a2727274272616e636865732727270a3c62723e2727436865636b696e67206f75742061206e6577206272616e636827270a3c636f64653e3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e743c2f636f64653e0a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e273c2f636f64653e0a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c636f64653e3c62723e2420676974206272616e63683c2f636f64653e0a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c636f64653e3c62723e242067697420636865636b6f7574206d6173746572203c2f636f64653e286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c636f64653e3c62723e2420676974206d6572676520646576656c6f706d656e743c2f636f64653e0a0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c636f64653e3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f3c2f636f64653e0a0a4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e636820746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573683c2f636f64653e0a0a4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c636f64653e3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63683c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e, 0x7574662d38),
(68, 0x272727477265702727270a0a272746696e642061204241534820636f6d6d616e6420796f752776652070726576696f75736c792075736564202d27270a3c636f64653e3c62723e2420686973746f7279207c2067726570206769743c2f636f64653e0a3c62723e546869732077696c6c206c69737420616e7920636f6d6d616e6473207769746820276769742720696e20746865206c696e652e0a0a272746696e642072756e6e696e672070726f636573736573206279206e616d65202d2727200a3c636f64653e3c62723e2420707320617578207c2067726570206170616368653c2f636f64653e0a3c62723e546869732077696c6c206c69737420616e792070726f636573736573207468617420617061636865322069732072756e6e696e672e0a0a272746696e642066696c657320696e2061206469726563746f7279202d27270a3c636f64653e3c62723e24206c73207c206772657020736f6d6566696c653c2f636f64653e0a0a27274f7574707574206772657020746f2066696c65202d27270a3c636f64653e3c62723e2420686973746f7279207c20677265702065676764726f70203e202f686f6d652f757365722f65676764726f70626173682e7478740a3c62723e2420707320617578207c2067726570207371756964203e20737175696470726f636365732e7478743c2f636f64653e0a3c62723e657463, 0x7574662d38),
(69, 0x272727496e7374616c6c696e67204769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c636f64653e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e342f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e3c2f636f64653e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a2727274d616b696e672061206e6577207265706f2727270a3c636f64653e3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d453c2f636f64653e2028776974682077686174657665722074657874290a3c636f64653e3c62723e242067697420616464202e203c2f636f64653e28746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c636f64653e3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e273c2f636f64653e0a0a2727274272616e636865732727270a3c62723e2727436865636b696e67206f75742061206e6577206272616e636827270a3c636f64653e3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e743c2f636f64653e0a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e273c2f636f64653e0a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c636f64653e3c62723e2420676974206272616e63683c2f636f64653e0a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c636f64653e3c62723e242067697420636865636b6f7574206d6173746572203c2f636f64653e286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c636f64653e3c62723e2420676974206d6572676520646576656c6f706d656e743c2f636f64653e0a0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c62723e4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e6368206f6e207468652072656d6f746520736572766572746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c636f64653e3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f206e616d656f666272616e63683c2f636f64653e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573683c2f636f64653e0a0a4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c636f64653e3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63683c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e, 0x7574662d38),
(70, 0x27272746697820686f6d65207065726d697373696f6e732727270a3c62723e3c636f64653e7375646f2063686d6f64202d522075672b727758202f55736572732f757365726e616d653c2f636f64653e0a0a2727274c69737420616e6420736f72742066696c65732062792066696c6573697a652727270a3c62723e55736566756c20666f722066696e64696e6720776861742066696c6573206172652074616b696e6720757020746865206d6f73742073706163652e0a3c62723e3c636f64653e6475202d6b20736f7274202d6e723c2f636f64653e0a0a2727274c697374206f70656e20706f72747320616e64207468652070726f636573736573207573696e67207468656d2727270a3c62723e3c636f64653e6c736f66202d690a3c62723e6c736f66202d69207463703a383235343c2f636f64653e0a0a2727274c69737420616c6c206c6f616465642074686972642d7061727479206b65726e656c20657874656e73696f6e732727270a3c62723e3c636f64653e6b65787473746174207c2067726570202d7620636f6d2e6170706c653c2f636f64653e0a0a2727274c6973742066696c657320746861742072756e6e696e67206170706c69636174696f6e732f70726f6365737365732061726520616363657373696e672727270a3c62723e3c636f64653e7375646f206f70656e736e6f6f70202d7020323833370a3c62723e7375646f206f70656e736e6f6f70202d6e205b6170705d3c2f636f64653e0a0a27272753686f772068696464656e2066696c657320696e2046696e6465722727270a3c62723e5573652046414c534520746f20686964652066696c657320616761696e2e0a3c62723e3c636f64653e64656661756c747320777269746520636f6d2e6170706c652e46696e646572204170706c6553686f77416c6c46696c657320545255453c2f636f64653e0a0a2727274c69737420686973746f7279206f66207265626f6f747320616e642073687574646f776e732727270a3c62723e3c636f64653e6c617374207265626f6f740a3c62723e6c6173742073687574646f776e3c2f636f64653e0a3c62723e557365206772657020746f2066696e64207265626f6f7473206f722073687574646f776e7320696e2061206365727461696e206d6f6e74680a3c62723e3c636f64653e6c617374207265626f6f74207c2067726570204d61793c2f636f64653e0a0a2727274d6973632e2727270a3c62723e3c636f64653e6c61756e636863746c206c6f6164202f4c6962726172792f4c61756e63684461656d6f6e732f0a3c62723e6c73626f6d202e706b672f436f6e74656e74732f417263686976652e626f6d3e207c206d6f72653c2f636f64653e, 0x7574662d38),
(71, 0x27272746697820686f6d65207065726d697373696f6e732727270a3c62723e3c636f64653e7375646f2063686d6f64202d522075672b727758202f55736572732f757365726e616d653c2f636f64653e0a0a2727274c69737420616e6420736f72742066696c65732062792066696c6573697a652727270a3c62723e55736566756c20666f722066696e64696e6720776861742066696c6573206172652074616b696e6720757020746865206d6f73742073706163652e0a3c62723e3c636f64653e6475202d6b207c20736f7274202d6e723c2f636f64653e0a0a2727274c697374206f70656e20706f72747320616e64207468652070726f636573736573207573696e67207468656d2727270a3c62723e3c636f64653e6c736f66202d690a3c62723e6c736f66202d69207463703a383235343c2f636f64653e0a0a2727274c69737420616c6c206c6f616465642074686972642d7061727479206b65726e656c20657874656e73696f6e732727270a3c62723e3c636f64653e6b65787473746174207c2067726570202d7620636f6d2e6170706c653c2f636f64653e0a0a2727274c6973742066696c657320746861742072756e6e696e67206170706c69636174696f6e732f70726f6365737365732061726520616363657373696e672727270a3c62723e46696e64206170706c69636174696f6e2f70726f636573732077697468203c636f64653e7073206175783c2f636f64653e0a3c62723e3c636f64653e707320617578207c2067726570206e616d656f666170703c2f636f64653e0a3c62723e5468656e20757365203c636f64653e6f70656e736e6f6f703c2f636f64653e2077697468206e616d65206f66206170706c69636174696f6e206f722070726f636573732049442e0a3c62723e3c636f64653e7375646f206f70656e736e6f6f70202d6e205b6e616d656f666170705d0a3c62723e7375646f206f70656e736e6f6f70202d7020323833373c2f636f64653e0a0a27272753686f772068696464656e2066696c657320696e2046696e6465722727270a3c62723e5573652046414c534520746f20686964652066696c657320616761696e2e0a3c62723e3c636f64653e64656661756c747320777269746520636f6d2e6170706c652e46696e646572204170706c6553686f77416c6c46696c657320545255453c2f636f64653e0a0a2727274c69737420686973746f7279206f66207265626f6f747320616e642073687574646f776e732727270a3c62723e3c636f64653e6c617374207265626f6f740a3c62723e6c6173742073687574646f776e3c2f636f64653e0a3c62723e557365206772657020746f2066696e64207265626f6f7473206f722073687574646f776e7320696e2061206365727461696e206d6f6e74682e0a3c62723e3c636f64653e6c617374207265626f6f74207c2067726570204d61793c2f636f64653e0a0a2727274d6973632e2727270a3c62723e3c636f64653e6c61756e636863746c206c6f6164202f4c6962726172792f4c61756e63684461656d6f6e732f0a3c62723e6c73626f6d202e706b672f436f6e74656e74732f417263686976652e626f6d3e207c206d6f72653c2f636f64653e, 0x7574662d38),
(72, 0x27272753656375726520535348207365727665722727270a3c62723e3c636f64653e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669673c2f636f64653e0a0a44697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e2075736572730a3c636f64653e3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965733c2f636f64653e0a0a4368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c73650a3c62723e3c636f64653e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636363c2f636f64653e0a0a272727534f434b53352070726f78792727270a3c62723e3c636f64653e737368202d70203134363636202d4420383038322075736572403132332e3135362e3135362e32333c2f636f64653e0a0a272727526576657273652074756e6e656c2727270a3c62723e4f6e2072656d6f7465206d616368696e652c205353482077697468202d0a3c62723e3c636f64653e737368202d522031393939393a6c6f63616c686f73743a32322075736572403132332e3135362e3135362e32333c2f636f64653e2028706f72742031393939392063616e20626520616e7920756e7573656420706f7274290a3c62723e4f6e206c6f63616c206d616368696e652c205353482077697468202d0a3c62723e3c636f64653e737368206c6f63616c686f7374202d702031393939393c2f636f64653e0a0a2727275265766572736520564e432074756e6e656c2727270a3c62723e4f6e2072656d6f7465207365727665722c2072756e202d0a3c62723e3c636f64653e24207373682075736572406f746865727365727665722e6e6574202d5220353930303a3132372e302e302e313a353930303c2f636f64653e0a3c62723e7468656e206f6e206c6f63616c20636c69656e742c20636f6e6e65637420746f20564e43206f6e206c6f63616c686f73742076696120706f727420353930300a0a27272750617373776f72642d6c657373205353482727270a3c62723e2873746f6c656e2066726f6d20687474703a2f2f6c65616775656f666576696c2e6f72672f6e6572642f3f703d333334290a3c62723e546f20656e61626c652070617373776f72642d6c65737320535348206c6f67696e206265747765656e2074776f206d616368696e65732c2061207075626c6963206b6579202869645f7273612e70756229206d7573742062652067656e657261746564206f6e20796f757220686f6d65206d616368696e6520616e64207468656e2075706c6f6164656420746f20612072656d6f7465206d616368696e652e20546869732077696c6c20656e61626c6520796f7520746f206c6f6720696e20746f207468652072656d6f7465206d616368696e6520616e64206e6f742062652070726f6d7074656420666f7220612070617373776f72642e0a0a546f2067656e657261746520616e2069645f7273612e7075622066696c652c206f70656e2075702061207465726d696e616c20616e6420747970652074686520666f6c6c6f77696e673a0a0a3c636f64653e24207373682d6b657967656e202d74207273613c2f636f64653e0a0a4a75737420707265737320e28098656e746572e2809920666f7220616c6c206f662074686520666f6c6c6f77696e672070726f6d7074733a0a0a3c636f64653e47656e65726174696e67207075626c69632f7072697661746520727361206b657920706169722e0a3c62723e456e7465722066696c6520696e20776869636820746f207361766520746865206b657920282f686f6d652f757365722f2e7373682f69645f727361293a0a3c62723e456e74657220706173737068726173652028656d70747920666f72206e6f2070617373706872617365293a0a3c62723e456e7465722073616d65207061737370687261736520616761696e3a0a3c62723e596f7572206964656e74696669636174696f6e20686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e0a3c62723e596f7572207075626c6963206b657920686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e7075622e3c2f636f64653e0a0a546869732077696c6c206c6561766520746865207061737370687261736520656d7074792c20656e61626c696e672070617373776f72642d6c657373206c6f67696e2e0a0a4e6f77207468617420746865207075626c6963206b65792066696c6520686173206265656e2067656e657261746564206974206e6565647320746f206265207472616e7366657272656420746f207468652072656d6f7465206d616368696e6520746861742077652077616e7420746f206c6f6720696e20746f2e20596f752063616e20757365207273796e632c207363702c204654502c206f7220616e797468696e672073696d696c61722c206a757374206173206c6f6e67206173207468652069645f7273612e7075622066696c652074686174207761732067656e657261746564206973207472616e7366657272656420746f207e2f2e7373682f617574686f72697a65645f6b657973206f6e207468652072656d6f7465207365727665722e2048657265e2809973206120666577206578616d706c65733a0a0a312e203c636f64653e2420736370207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579733c2f636f64653e0a3c62723e322e203c636f64653e24207273796e63202d2d70726f6772657373202d6520737368207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579733c2f636f64653e0a3c62723e332e203c636f64653e24207373682d636f70792d6964202d69207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3c2f636f64653e0a0a4f6e63652069645f7273612e70756220686173206265656e207472616e736665727265642c2074727920746f2053534820746f207468652072656d6f7465207365727665722e2049662065766572797468696e672077656e74204f4b207468656e20796f752073686f756c646ee28099742062652070726f6d7074656420666f7220612070617373776f72642e0a0a496620697420646f73656ee280997420776f726b2c20656974686572207468652053534820636f6e66696775726174696f6e206f6e207468652072656d6f7465206d616368696e652069736ee28099742073657420757020746f20616363657074207075626c6963206b65797320616e642070617373776f72642d6c657373206c6f67696e732c206f7220746865207065726d697373696f6e73206f66207468652069645f7273612e7075622066696c652061726520696e636f72726563742e20476f6f676c6520697320796f757220667269656e6420686572652c20616e6420616c736f2074686973206c696e6b2068617320736f6d652068656c7066756c2068696e74732028687474703a2f2f7777772e64656269616e2d61646d696e697374726174696f6e2e6f72672f61727469636c65732f313532292e0a0a2727274368616e676520737368206c6f67696e2062616e6e6572206574632727270a3c62723e6d6f7665206f6c642066696c65206173206261636b75702c207375646f206d76202f6574632f6d6f7464202f6574632f6d6f74642e62616b3c62723e0a637265617465206e6577202f6574632f6d6f74642066696c652028706f73742d6c6f67696e206d657373616765292c20736176652e3c62723e0a6164642f6564697420666f6c6c6f77696e67206c696e6520696e202f6574632f64656661756c742f726353202d2d2022454449544d4f54443d6e6f223c62723e0a7375646f206e616e6f202f6574632f7373682f737368645f636f6e66696720616e6420756e636f6d6d656e74207468652042616e6e6572206c696e65207769746820222f6574632f69737375652e6e6574223c62723e0a3c636f64653e7375646f206e616e6f202f6574632f69737375652e6e65743c2f636f64653e202d2d20646973706c61796564206f6e20636f6e6e6563742c207072652d6c6f67696e3c62723e0a3c636f64653e7375646f206e616e6f202f6574632f6d6f74643c2f636f64653e202d2d20646973706c6179656420706f73742d6c6f67696e3c62723e0a686176652061206c6f6f6b206174202f6574632f7570646174652d6d6f74642e642f30302d6865616465722028776861747320676f696e67206f6e2074686572653f293c62723e0a3c636f64653e2f6574632f696e69742e642f73736820726573746172743c2f636f64653e0a696620646f6e652070726f7065726c792c20776f6e277420616c6c20646973617070656172206f6e207265626f6f7421, 0x7574662d38),
(73, 0x272727496e7374616c6c696e6720576f726470726573732727270a3c62723e3c636f64653e24207767657420687474703a2f2f776f726470726573732e6f72672f6c61746573742e7461722e677a0a3c62723e242074617220787a7666206c61746573742e7461722e677a0a3c62723e24207375646f206d7620776f72647072657373202f7661722f7777772f6e616d656f66626c6f670a3c62723e24206364202f7661722f7777772f6e616d656f66626c6f670a3c62723e24207375646f206d762077702d636f6e6669672d73616d706c652e7068702077702d636f6e6669672e7068700a3c62723e24207375646f206e616e6f2077702d636f6e6669672e7068703c2f636f64653e0a0a4164642064657461696c73206f66206d7973716c207461626c6520666f7220626c6f672c206d7973716c20757365726e616d6520616e642070617373776f72642e205468656e20676f746f20626c6f6720696e2062726f7773657220746f2066696e69736820696e7374616c6c6174696f6e2e0a0a2727274d6f76696e6720626c6f6720746f206e6577207365727665722727270a3c62723e466f6c6c6f7720696e737472756374696f6e732066726f6d20576f726470726573732073697465202d200a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f4d6f76696e675f576f726450726573730a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f4261636b696e675f55705f596f75725f44617461626173650a3c62723e687474703a2f2f636f6465782e776f726470726573732e6f72672f526573746f72696e675f596f75725f44617461626173655f46726f6d5f4261636b75700a0a4d616b6520626c6f67206469726563746f7279206f776e657220616e642067726f757020277777772d64617461272c2073616d6520617320757365722072756e6e696e67204170616368652e0a3c62723e272743484d4f4420616c6c206469726563746f72696573203735352c20616c6c2066696c657320363434202d2727200a3c62723e3c636f64653e242066696e64205b796f7572207061746820686572655d202d747970652064202d657865632063686d6f6420373535207b7d205c3b0a3c62723e242066696e64205b796f7572207061746820686572655d202d747970652066202d657865632063686d6f6420363434207b7d205c3b0a3c62723e242063686d6f64203737372077702d636f6e74656e742f75706c6f6164733c2f636f64653e0a0a27274368616e67652055524c7320696e204d7953514c2077697468205048504d7941646d696e27270a3c62723e436c69636b206f6e20626c6f672064617461626173652c207468656e2077705f6f7074696f6e730a3c62723e52756e2053514c20636f6d6d616e64202d200a3c62723e3c636f64653e5550444154452077705f6f7074696f6e7320534554206f7074696f6e5f76616c7565203d207265706c616365286f7074696f6e5f76616c75652c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c2027687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d2729205748455245206f7074696f6e5f6e616d65203d2027686f6d6527204f52206f7074696f6e5f6e616d65203d20277369746575726c273b3c2f636f64653e0a0a436c69636b2077705f706f7374732c2072756e2053514c20636f6d6d616e64202d0a3c62723e3c636f64653e5550444154452077705f706f737473205345542067756964203d207265706c61636528677569642c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c27687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d27293b3c2f636f64653e0a0a616e64202d0a3c62723e3c636f64653e5550444154452077705f706f7374732053455420706f73745f636f6e74656e74203d207265706c61636528706f73745f636f6e74656e742c2027687474703a2f2f7777772e6f6c642d646f6d61696e2e636f6d272c2027687474703a2f2f7777772e6e65772d646f6d61696e2e636f6d27293b3c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e4d6179206861766520746f2061646a757374205065726d616c696e6b7320696e20576f726470726573732073657474696e677320696620636c69636b696e67206f6e2063617465676f7269657320616e6420706f737473206c6561647320746f206120343034206572726f722061667465722061206d6f76652e, 0x7574662d38),
(74, 0x2727274c6973742070726f6365737365732077697468206f70656e20706f727473202d2727270a3c62723e3c636f64653e24207375646f206e657473746174202d74706c3c2f636f64653e0a0a2727275461722727270a3c62723e2727436f6d707265737320612066696c65202d2727200a3c62723e3c636f64653e2420746172202d637a662077686174657665722e74617220666f6c6465726e616d653c2f636f64653e0a0a2727556e74617220612066696c65202d2727200a3c62723e3c636f64653e2420746172202d78662077686174657665722e7461723c2f636f64653e0a0a2727546172206f7074696f6e73202d2727200a3c62723e3c636f64653e2d63203d206372656174650a3c62723e2d66203d207265616420746f2f66726f6d20746865206e616d65642066696c650a3c62723e2d74203d206c69737420636f6e74656e7473206f66202e7461722066696c650a3c62723e2d72203d20617070656e6420746f2061202e7461722066696c650a3c62723e2d76203d20766572626f73650a3c62723e2d78203d206578747261637420636f6e74656e7473206f66202e7461722066696c650a3c62723e2d7a203d20636f6d70726573732066696c65733c2f636f64653e, 0x7574662d38),
(75, 0x2727274c6973742070726f6365737365732077697468206f70656e20706f727473202d2727270a3c62723e3c636f64653e24207375646f206e657473746174202d74706c3c2f636f64653e0a0a2727275461722727270a3c62723e436f6d707265737320612066696c65202d200a3c62723e3c636f64653e2420746172202d637a662077686174657665722e74617220666f6c6465726e616d653c2f636f64653e0a0a556e74617220612066696c65202d0a3c62723e3c636f64653e2420746172202d78662077686174657665722e7461723c2f636f64653e0a0a546172206f7074696f6e73202d0a3c62723e3c636f64653e2d63203d206372656174650a3c62723e2d66203d207265616420746f2f66726f6d20746865206e616d65642066696c650a3c62723e2d74203d206c69737420636f6e74656e7473206f66202e7461722066696c650a3c62723e2d72203d20617070656e6420746f2061202e7461722066696c650a3c62723e2d76203d20766572626f73650a3c62723e2d78203d206578747261637420636f6e74656e7473206f66202e7461722066696c650a3c62723e2d7a203d20636f6d70726573732066696c65733c2f636f64653e, 0x7574662d38),
(76, 0x272727496e7374616c6c696e67204b6970706f20686f6e6579706f742727270a3c62723e4261736564206f6e2031302e3034205365727665720a3c62723e3c636f64653e24206170742d67657420696e7374616c6c20707974686f6e2d7477697374656420707974686f6e2d6d7973716c64622073756276657273696f6e0a3c62723e242061646475736572206b6970706f0a3c62723e242073766e20636865636b6f757420687474703a2f2f6b6970706f2e676f6f676c65636f64652e636f6d2f73766e2f7472756e6b2f202f686f6d652f6b6970706f0a3c62723e24206370202f686f6d652f6b6970706f2f6b6970706f2e6366672e64697374202f686f6d652f6b6970706f2f6b6970706f2e6366673c2f636f64653e0a0a436f6e666967757265206b6970706f20746f206c6f6720696e746f204d7953514c202d0a3c62723e3c636f64653e24206d7973716c202d7520726f6f74202d700a3c62723e2420637265617465206461746162617365206b6970706f3b0a3c62723e24206772616e7420616c6c2070726976696c65676573206f6e206b6970706f2e2a20746f20276b6970706f27406c6f63616c686f7374206964656e7469666965642062792027736563726574273b0a3c62723e2420657869743b0a3c62723e24206d7973716c202d756b6970706f202d70736563726574206b6970706f203c202f686f6d652f6b6970706f2f646f632f73716c2f6d7973716c2e73716c3c2f636f64653e0a0a45646974202e6366672066696c6520746f20636f6e6e65637420746f204d7953514c206461746162617365202d0a3c62723e3c636f64653e5b64617461626173655f6d7973716c5d20686f7374203d206c6f63616c686f73740a3c62723e64617461627365203d206b6970706f0a3c62723e757365726e616d65203d206b6970706f0a3c62723e70617373776f7264203d207365637265743c2f636f64653e0a0a4c6f67696e206173206b6970706f2028776f6e27742072756e20617320726f6f74292c207374617274204b6970706f202d0a3c62723e3c636f64653e24202e2f73746172742e73683c2f636f64653e0a0a42792064656661756c74204b6970706f2072756e73206f6e20706f727420323232322e2052756e207468697320636f6d6d616e6420746f20726f75746520746f2064656661756c742053534820323220706f727420286e6f74653a207468697320636f6d6d616e642077696c6c206861766520746f2062652072756e20616761696e2069662073797374656d2069732072657374617274656429202d0a3c62723e3c636f64653e242069707461626c6573202d74206e6174202d4120505245524f5554494e47202d692065746830202d7020746370202d64706f7274203232202d6a205245444952454354202d746f2d706f727420323232323c2f636f64653e0a0a4c6f672066696c657320617265206b65707420696e203c636f64653e2f686f6d652f6b6970706f2f6c6f672f7474793c2f636f64653e2c20646f776e6c6f616465642066696c6573206b65707420696e203c636f64653e2f686f6d652f6b6970706f2f646c3c2f636f64653e, 0x7574662d38),
(77, 0x272727496e7374616c6c696e672065676764726f702727270a3c62723e3c636f64653e24207375646f206170742d67657420696e7374616c6c2065676764726f700a3c62723e2420616464757365722065676764726f703c2f636f64653e20286d616b652065676764726f702061207375646f65722c206f7220796f75276c6c206861766520746f2063686f776e2066726f6d2061207375646f65722075736572290a0a45646974202e636f6e662066696c650a3c62723e3c636f64653e24207375646f2063686d6f6420373737202f7573722f6c69622f65676764726f70202d520a3c62723e24206c6e202d73202f7573722f6c69622f65676764726f702f6d6f64756c6573202f686f6d652f796f7572757365722f6d6f64756c65730a3c62723e24206c6e202d73202f7573722f73686172652f65676764726f702f73637269707473202f686f6d652f796f7572757365722f736372697074730a3c62723e242065676764726f70202f686f6d652f796f7572757365722f73696d706c652e636f6e663c2f636f64653e0a0a272727496e7374616c6c696e67206e657720626f742727270a3c62723e557365202e636f6e662066696c652c20476f6f676c65202773696d706c652e636f6e662065676764726f702720666f72206120676f6f6420737461727465722066696c652e204d756368206d6f7265206f7074696f6e7320617265206176616c6961626c652e0a3c62723e3c636f64653e242065676764726f70202d6d2077686174657665722e636f6e663c2f636f64653e202877696c6c2073746172742065676764726f7020696e206e657720626f74206d6f6465290a0a54656c6e657420696e207573696e6720706f72742066726f6d20636f6e662066696c65202d0a3c62723e3c636f64653e74656c6e6574206c6f63616c686f73742032303636363c2f636f64653e0a3c62723e456e74657220274e45572720617320757365726e616d652c207468656e2077696c6c2070726f6d707420746f206d616b652061206e6577207573657220616e642073657420796f75206173206f776e65720a3c62723e436f6d6d616e647320666f756e642068657265202d20687474703a2f2f7777772e65676768656c702e6f72672f7573696e672e68746d0a3c62723e3c636f64653e2e6368616e616464202374686f756768746d617962653c2f636f64653e2028697320746869732072696768743f290a3c62723e3c636f64653e2e6368616e736574202b6175746f6f70202374686f756768746d617962653c2f636f64653e0a0a272727416c6963652e74636c2727270a3c62723e3c636f64653e2e6368616e736574202374686f756768746d61796265202b616c6963653c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e49662067657474696e6720612027436f756c64206e6f7420777269746520746f2074656d7027206572726f722075706f6e207374617274206f6620626f742c20616464207468697320746f202e636f6e662066696c6520616e64206d616b65206120746d70206469726563746f7279206f776e65642062792065676764726f70207573657220696e20686f6d6520666f6c64657220286f722073616d6520666f6c646572206173202e636f6e662066696c6529202d0a3c62723e3c636f64653e23205365742068657265206120706c61636520746f2073746f72652074656d706f726172792066696c65732e0a3c62723e7365742074656d702d7061746820222f746d70223c2f636f64653e, 0x7574662d38),
(78, 0x272727496e7374616c6c696e67204d6564696157696b692727270a3c62723e466f6c6c6f77656420746869732067756964652c20776f726b7320706572666563742e2057696c6c206d6179626520737465616c2074686520776f726473206c6174657220746f20736176652074696d65206f70656e696e6720616e6f746865722077656273697465202d200a3c62723e687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a496e7374616c6c696e675f4d6564696177696b695f6f6e5f5562756e74755f31302e30340a0a2727274d616b696e672077696b6920707269766174652727270a3c62723e546f206c696d69742065646974696e6720746f206f6e6c792061646d696e2075736572732c2065646974203c636f64653e2f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e7068703c2f636f64653e20616e642061646420666f6c6c6f77696e67206c696e6573202d0a3c62723e3c636f64653e24776747726f75705065726d697373696f6e735b272a275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b2775736572275d5b2765646974275d203d2066616c73653b0a3c62723e24776747726f75705065726d697373696f6e735b277379736f70275d5b2765646974275d203d20747275653b3c2f636f64653e0a3c62723e5468656e2072657374617274204170616368652e0a0a2727274368616e67652077696b69206c6f676f2727270a3c62723e45646974203c636f64653e2f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e7068703c2f636f64653e20616e642061646420666f6c6c6f77696e67206c696e65202d0a3c62723e3c636f64653e2477674c6f676f203d2022687474703a2f2f6c6f652e6f72672f6c6f676f2e706e67223b3c2f636f64653e0a3c62723e5468656e2072657374617274204170616368652e0a0a2727274d6f76696e672077696b692727270a3c62723e4261636b7570204d7953514c2064617461626173652c20616e64206261636b75702074686520666f6c6c6f77696e67207061746873202d200a3c62723e3c636f64653e2f6574632f6d6564696177696b690a3c62723e2f7573722f73686172652f6d6564696177696b690a3c62723e2f7661722f6c69622f6d6564696177696b693c2f636f64653e0a0a272727526573746f72696e672077696b692727270a3c62723e526573746f7265204d7953514c2064617461626173652e0a3c62723e496e7374616c6c204d6564696157696b692e0a3c62723e436f7079206261636b207468652061626f76652066696c65207061746820666f6c646572732e0a3c62723e45646974203c636f64653e2f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e7068703c2f636f64653e20746f206d61746368206e6577207365727665722073657474696e67732e0a3c62723e456e73757265207065726d697373696f6e73206172652073657420636f72726563746c79206f6e2074686520666f6c6c6f77696e67202d0a3c62723e3c636f64653e2f7661722f6c69622f6d6564696177696b692f636f6e6669673c2f636f64653e20616e6420696d6167657320666f6c64657273202873686f756c64206265207777772d64617461206f7220757365722072756e6e696e672061706163686532290a3c62723e3c636f64653e2f6574632f6d6564696177696b692f4c6f63616c53657474696e67732e7068703c2f636f64653e202873686f756c64206265207777772d64617461206f7220757365722072756e6e696e67206170616368653229, 0x7574662d38),
(79, 0x272727496e7374616c6c696e6720697263642d6879627269642727270a3c62723e3c636f64653e24207375646f206170742d67657420696e7374616c6c20697263642d6879627269643c2f636f64653e0a0a45646974202f6574632f697263642d6879627269642f697263642e636f6e662c20616e64206368616e67652074686973202d0a0a3c636f64653e202020206c697374656e207b0a3c62723e202020202f2a20706f72743a2074686520737065636966696320706f727420746f206c697374656e206f6e2e20206966206e6f20686f7374206973207370656369666965640a3c62723e202020202a206265666f72652c2069742077696c6c206c697374656e206f6e20616c6c20617661696c61626c65204950732e0a3c62723e202020202a0a3c62723e202020202a20706f727473206172652073657065726174656420766961206120636f6d6d612c20612072616e6765206d617920626520737065636966696564207573696e6720e2809c2e2ee2809d0a3c62723e202020202a2f0a3c62723e0a3c62723e202020202f2a20706f72743a206c697374656e206f6e20616c6c20617661696c61626c65204950732c20706f727473203636363520746f2036363639202a2f0a3c62723e20202020686f7374203d20e2809c3132372e302e302e31e280b33b2020202023206368616e67652074686973210a3c62723e20202020706f7274203d2036363635202e2e20363636393b0a3c62723e202020207d3b3c2f636f64653e0a0a746f20736f6d657468696e67206c696b652074686973202d0a0a3c636f64653e202020206c697374656e207b0a3c62723e202020202f2a20706f72743a2074686520737065636966696320706f727420746f206c697374656e206f6e2e20206966206e6f20686f7374206973207370656369666965640a3c62723e202020202a206265666f72652c2069742077696c6c206c697374656e206f6e20616c6c20617661696c61626c65204950732e0a3c62723e202020202a0a3c62723e202020202a20706f727473206172652073657065726174656420766961206120636f6d6d612c20612072616e6765206d617920626520737065636966696564207573696e6720e2809c2e2ee2809d0a3c62723e202020202a2f0a3c62723e0a3c62723e202020202f2a20706f72743a206c697374656e206f6e20616c6c20617661696c61626c65204950732c20706f727473203636363520746f2036363639202a2f0a3c62723e0a3c62723e202020202320434f4d4d454e54204f555420434f4d504c4554454c592020686f7374203d20e2809c3132372e302e302e31e280b33b2020202023206368616e67652074686973210a3c62723e20202020706f7274203d20363636373b0a3c62723e202020207d3b3c2f636f64653e0a0a2873746f6c656e2066726f6d20687474703a2f2f7777772e706f696e746c65737372616e74732e636f6d2f323030392f30352f696e7374616c6c696e672d616e642d636f6e6669677572696e672d697263642d6879627269642d6f6e2d7562756e74752d3930342f290a0a45646974203c636f64653e2f6574632f697263642d6879627269642f697263642e6d6f74643c2f636f64653e0a3c62723e3c636f64653e24207375646f202f6574632f696e69742e642f697263642d68796272696420726573746172743c2f636f64653e0a0a272727496e7374616c6c696e6720697273736920746f20636f6e6e65637420746f20495243207365727665722727270a3c62723e3c636f64653e24207375646f206170742d67657420696e7374616c6c2069727373690a3c62723e2f636f6e6e656374203132372e302e302e313c2f636f64653e0a3c62723e486f73746e616d652077696c6c2062652073706f6f6665642e, 0x7574662d38),
(80, 0x27272753657474696e6720612073746174696320495020666f722061206e6574776f726b20696e746572666163652727270a3c62723e45646974206e6574776f726b20696e74657266616365732066696c65202d0a3c62723e3c636f64653e24207375646f206e616e6f202f6574632f6e6574776f726b2f696e74657266616365733c2f636f64653e0a0a3c636f64653e546869732066696c652064657363726962657320746865206e6574776f726b20696e746572666163657320617661696c61626c65206f6e20796f75722073797374656d0a3c62723e20616e6420686f7720746f206163746976617465207468656d2e20466f72206d6f726520696e666f726d6174696f6e2c2073656520696e74657266616365732835292e3c2f636f64653e0a0a3c636f64653e546865206c6f6f706261636b206e6574776f726b20696e746572666163650a3c62723e6175746f206c6f0a3c62723e6966616365206c6f20696e6574206c6f6f706261636b3c2f636f64653e0a0a3c636f64653e546865207072696d617279206e6574776f726b20696e746572666163650a3c62723e6175746f20657468300a3c62723e6966616365206574683020696e6574207374617469630a3c62723e202020202020202061646472657373203139322e3136382e302e3130300a3c62723e20202020202020206e65746d61736b203235352e3235352e3235352e300a3c62723e20202020202020206e6574776f726b203139322e3136382e302e300a3c62723e202020202020202062726f616463617374203139322e3136382e302e3235350a3c62723e202020202020202067617465776179203139322e3136382e302e313c2f636f64653e0a0a52657374617274206e6574776f726b696e6720666f72206368616e67657320746f2074616b6520656666656374202d0a3c62723e3c636f64653e24207375646f202f6574632f696e69742e642f6e6574776f726b696e6720726573746172743c2f636f64653e, 0x7574662d38),
(81, 0x46696e642061204241534820636f6d6d616e6420796f752776652070726576696f75736c792075736564202d0a3c636f64653e3c62723e2420686973746f7279207c2067726570206769743c2f636f64653e0a3c62723e546869732077696c6c206c69737420616e7920636f6d6d616e6473207769746820276769742720696e20746865206c696e652e0a0a46696e642072756e6e696e672070726f636573736573206279206e616d65202d0a3c636f64653e3c62723e2420707320617578207c2067726570206170616368653c2f636f64653e0a3c62723e546869732077696c6c206c69737420616e792070726f636573736573207468617420617061636865322069732072756e6e696e672e0a0a46696e642066696c657320696e2061206469726563746f7279202d0a3c636f64653e3c62723e24206c73207c206772657020736f6d6566696c653c2f636f64653e0a0a4f7574707574206772657020746f2066696c65202d0a3c636f64653e3c62723e2420686973746f7279207c20677265702065676764726f70203e202f686f6d652f757365722f65676764726f70626173682e7478740a3c62723e2420707320617578207c2067726570207371756964203e20737175696470726f636365732e7478743c2f636f64653e0a3c62723e657463, 0x7574662d38);
INSERT INTO `nw_text` (`old_id`, `old_text`, `old_flags`) VALUES
(82, 0x27272746697820686f6d65207065726d697373696f6e732727270a3c62723e3c636f64653e7375646f2063686d6f64202d522075672b727758202f55736572732f757365726e616d653c2f636f64653e0a0a2727274c69737420616e6420736f72742066696c65732062792066696c6573697a652727270a3c62723e55736566756c20666f722066696e64696e6720776861742066696c6573206172652074616b696e6720757020746865206d6f73742073706163652e0a3c62723e3c636f64653e6475202d6b207c20736f7274202d6e723c2f636f64653e0a0a2727274c697374206f70656e20706f72747320616e64207468652070726f636573736573207573696e67207468656d2727270a3c62723e3c636f64653e6c736f66202d690a3c62723e6c736f66202d69207463703a383235343c2f636f64653e0a0a2727274c69737420616c6c206c6f616465642074686972642d7061727479206b65726e656c20657874656e73696f6e732727270a3c62723e3c636f64653e6b65787473746174207c2067726570202d7620636f6d2e6170706c653c2f636f64653e0a0a2727274c6973742066696c657320746861742072756e6e696e67206170706c69636174696f6e732f70726f6365737365732061726520616363657373696e672727270a3c62723e46696e64206170706c69636174696f6e2f70726f636573732077697468203c636f64653e7073206175783c2f636f64653e0a3c62723e3c636f64653e707320617578207c2067726570206e616d656f666170703c2f636f64653e0a3c62723e5468656e20757365203c636f64653e6f70656e736e6f6f703c2f636f64653e2077697468206e616d65206f66206170706c69636174696f6e206f722070726f636573732049442e0a3c62723e3c636f64653e7375646f206f70656e736e6f6f70202d6e205b6e616d656f666170705d0a3c62723e7375646f206f70656e736e6f6f70202d7020323833373c2f636f64653e0a0a27272753686f772068696464656e2066696c657320696e2046696e6465722727270a3c62723e5573652046414c534520746f20686964652066696c657320616761696e2e0a3c62723e3c636f64653e64656661756c747320777269746520636f6d2e6170706c652e46696e646572204170706c6553686f77416c6c46696c657320545255453c2f636f64653e0a0a2727274c69737420686973746f7279206f66207265626f6f747320616e642073687574646f776e732727270a3c62723e3c636f64653e6c617374207265626f6f740a3c62723e6c6173742073687574646f776e3c2f636f64653e0a3c62723e557365206772657020746f2066696e64207265626f6f7473206f722073687574646f776e7320696e2061206365727461696e206d6f6e74682e0a3c62723e3c636f64653e6c617374207265626f6f74207c2067726570204d61793c2f636f64653e0a0a272727456a65637420616e6420636c6f7365204456442064726976652727270a3c62723e3c636f64653e64727574696c207472617920656a6563740a3c62723e6469736b7574696c207472617920636c6f73653c2f636f64653e0a0a2727274d6973632e2727270a3c62723e3c636f64653e6c61756e636863746c206c6f6164202f4c6962726172792f4c61756e63684461656d6f6e732f0a3c62723e6c73626f6d202e706b672f436f6e74656e74732f417263686976652e626f6d3e207c206d6f72653c2f636f64653e, 0x7574662d38),
(83, 0x27272746697820686f6d65207065726d697373696f6e732727270a3c62723e3c636f64653e7375646f2063686d6f64202d522075672b727758202f55736572732f757365726e616d653c2f636f64653e0a0a2727274c69737420616e6420736f72742066696c65732062792066696c6573697a652727270a3c62723e55736566756c20666f722066696e64696e6720776861742066696c6573206172652074616b696e6720757020746865206d6f73742073706163652e0a3c62723e3c636f64653e6475202d6b207c20736f7274202d6e723c2f636f64653e0a0a2727274c697374206f70656e20706f72747320616e64207468652070726f636573736573207573696e67207468656d2727270a3c62723e3c636f64653e6c736f66202d690a3c62723e6c736f66202d69207463703a383235343c2f636f64653e0a0a2727274c69737420616c6c206c6f616465642074686972642d7061727479206b65726e656c20657874656e73696f6e732727270a3c62723e3c636f64653e6b65787473746174207c2067726570202d7620636f6d2e6170706c653c2f636f64653e0a0a2727274c6973742066696c657320746861742072756e6e696e67206170706c69636174696f6e732f70726f6365737365732061726520616363657373696e672727270a3c62723e46696e64206170706c69636174696f6e2f70726f636573732077697468203c636f64653e7073206175783c2f636f64653e0a3c62723e3c636f64653e707320617578207c2067726570206e616d656f666170703c2f636f64653e0a3c62723e5468656e20757365203c636f64653e6f70656e736e6f6f703c2f636f64653e2077697468206e616d65206f66206170706c69636174696f6e206f722070726f636573732049442e0a3c62723e3c636f64653e7375646f206f70656e736e6f6f70202d6e205b6e616d656f666170705d0a3c62723e7375646f206f70656e736e6f6f70202d7020323833373c2f636f64653e0a0a27272753686f772068696464656e2066696c657320696e2046696e6465722727270a3c62723e5573652046414c534520746f20686964652066696c657320616761696e2e0a3c62723e3c636f64653e64656661756c747320777269746520636f6d2e6170706c652e46696e646572204170706c6553686f77416c6c46696c657320545255453c2f636f64653e0a0a2727274c69737420686973746f7279206f66207265626f6f747320616e642073687574646f776e732727270a3c62723e3c636f64653e6c617374207265626f6f740a3c62723e6c6173742073687574646f776e3c2f636f64653e0a3c62723e557365206772657020746f2066696e64207265626f6f7473206f722073687574646f776e7320696e2061206365727461696e206d6f6e74682e0a3c62723e3c636f64653e6c617374207265626f6f74207c2067726570204d61793c2f636f64653e0a0a272727456a65637420616e6420636c6f7365204456442064726976652727270a3c62723e3c636f64653e64727574696c207472617920656a6563740a3c62723e64727574696c207472617920636c6f73653c2f636f64653e0a0a2727274d6973632e2727270a3c62723e3c636f64653e6c61756e636863746c206c6f6164202f4c6962726172792f4c61756e63684461656d6f6e732f0a3c62723e6c73626f6d202e706b672f436f6e74656e74732f417263686976652e626f6d3e207c206d6f72653c2f636f64653e, 0x7574662d38),
(84, 0x52656d6f76652045766f6c7574696f6e2066726f6d2074686520496e64696361746f72204170706c6574206e6f74696669657220696e207468652073797374656d20747261793a0a0a7375646f206170742d6765742072656d6f76652065766f6c7574696f6e2d696e640a0a7375646f206170742d6765742072656d6f76652065766f6c7574696f6e2d696e64696361746f720a0a7375646f206170742d6765742072656d6f766520696e64696361746f722d6d657373616765730a0a496620796f7520616c736f2077616e7420746f2067657420726964206f6620746865204d654d656e752c20796f752063616e20646f20736f207769746820746869733a0a0a7375646f206170742d6765742072656d6f766520696e64696361746f722d6d650a0a546865206d61696c206e6f74696669657220286f7220616e797468696e6720656c736520796f75e2809976652072656d6f76656429206d69676874207374696c6c206265207468657265207768656e20796f75e2809976652066696e69736865642c2074686f7567682073686f756c6420626520676f6e652061667465722061207265626f6f742e20486f77657665722c20746f207669657720796f7572206368616e67657320696d6d6564696174656c792c20796f752063616e2072656672657368207468652070616e656c20627920656e746572696e672074686520666f6c6c6f77696e6720696e746f2061207465726d696e616c20286f7220416c742b4632293a0a0a6b696c6c616c6c20676e6f6d652d70616e656c, 0x7574662d38),
(85, 0x27272753656375726520535348207365727665722727270a3c62723e3c636f64653e7375646f206e616e6f202f6574632f7373682f737368645f636f6e6669673c2f636f64653e0a0a44697361626c6520726f6f74206c6f67696e20616e6420656e61626c65206c6f67696e206f6e6c7920666f72206365727461696e2075736572730a3c636f64653e3c62723e41757468656e7469636174696f6e3a0a3c62723e4c6f67696e477261636554696d65203132300a3c62723e5065726d6974526f6f744c6f67696e206e6f0a3c62723e416c6c6f775573657273206a6c2065676764726f70206a6f72650a3c62723e5374726963744d6f646573207965733c2f636f64653e0a0a4368616e67652053534820706f72742066726f6d20323220746f20736f6d657468696e6720656c73650a3c62723e3c636f64653e5768617420706f7274732c2049507320616e642070726f746f636f6c73207765206c697374656e20666f720a3c62723e506f72742031343636363c2f636f64653e0a0a272727534f434b53352070726f78792727270a3c62723e3c636f64653e737368202d70203134363636202d4420383038322075736572403132332e3135362e3135362e32333c2f636f64653e0a0a272727526576657273652074756e6e656c2727270a3c62723e4f6e2072656d6f7465206d616368696e652c205353482077697468202d0a3c62723e3c636f64653e737368202d522031393939393a6c6f63616c686f73743a32322075736572403132332e3135362e3135362e32333c2f636f64653e2028706f72742031393939392063616e20626520616e7920756e7573656420706f7274290a3c62723e4f6e206c6f63616c206d616368696e652c205353482077697468202d0a3c62723e3c636f64653e737368206c6f63616c686f7374202d702031393939393c2f636f64653e0a0a2727275265766572736520564e432074756e6e656c2727270a3c62723e4f6e2072656d6f7465207365727665722c2072756e202d0a3c62723e3c636f64653e24207373682075736572406f746865727365727665722e6e6574202d5220353930303a3132372e302e302e313a353930303c2f636f64653e0a3c62723e7468656e206f6e206c6f63616c20636c69656e742c20636f6e6e65637420746f20564e43206f6e206c6f63616c686f73742076696120706f727420353930300a0a27272750617373776f72642d6c657373205353482727270a3c62723e2873746f6c656e2066726f6d20687474703a2f2f6c65616775656f666576696c2e6f72672f6e6572642f3f703d333334290a3c62723e546f20656e61626c652070617373776f72642d6c65737320535348206c6f67696e206265747765656e2074776f206d616368696e65732c2061207075626c6963206b6579202869645f7273612e70756229206d7573742062652067656e657261746564206f6e20796f757220686f6d65206d616368696e6520616e64207468656e2075706c6f6164656420746f20612072656d6f7465206d616368696e652e20546869732077696c6c20656e61626c6520796f7520746f206c6f6720696e20746f207468652072656d6f7465206d616368696e6520616e64206e6f742062652070726f6d7074656420666f7220612070617373776f72642e0a0a546f2067656e657261746520616e2069645f7273612e7075622066696c652c206f70656e2075702061207465726d696e616c20616e6420747970652074686520666f6c6c6f77696e673a0a0a3c636f64653e24207373682d6b657967656e202d74207273613c2f636f64653e0a0a4a75737420707265737320e28098656e746572e2809920666f7220616c6c206f662074686520666f6c6c6f77696e672070726f6d7074733a0a0a3c636f64653e47656e65726174696e67207075626c69632f7072697661746520727361206b657920706169722e0a3c62723e456e7465722066696c6520696e20776869636820746f207361766520746865206b657920282f686f6d652f757365722f2e7373682f69645f727361293a0a3c62723e456e74657220706173737068726173652028656d70747920666f72206e6f2070617373706872617365293a0a3c62723e456e7465722073616d65207061737370687261736520616761696e3a0a3c62723e596f7572206964656e74696669636174696f6e20686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e0a3c62723e596f7572207075626c6963206b657920686173206265656e20736176656420696e202f686f6d652f757365722f2e7373682f69645f7273612e7075622e3c2f636f64653e0a0a546869732077696c6c206c6561766520746865207061737370687261736520656d7074792c20656e61626c696e672070617373776f72642d6c657373206c6f67696e2e0a0a4e6f77207468617420746865207075626c6963206b65792066696c6520686173206265656e2067656e657261746564206974206e6565647320746f206265207472616e7366657272656420746f207468652072656d6f7465206d616368696e6520746861742077652077616e7420746f206c6f6720696e20746f2e20596f752063616e20757365207273796e632c207363702c204654502c206f7220616e797468696e672073696d696c61722c206a757374206173206c6f6e67206173207468652069645f7273612e7075622066696c652074686174207761732067656e657261746564206973207472616e7366657272656420746f207e2f2e7373682f617574686f72697a65645f6b657973206f6e207468652072656d6f7465207365727665722e2048657265e2809973206120666577206578616d706c65733a0a0a312e203c636f64653e2420736370207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579733c2f636f64653e0a3c62723e322e203c636f64653e24207273796e63202d2d70726f6772657373202d6520737368207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3a2e7373682f617574686f72697a65645f6b6579733c2f636f64653e0a3c62723e332e203c636f64653e24207373682d636f70792d6964202d69207e2f2e7373682f69645f7273612e707562207573657240646f6d61696e2e636f6d3c2f636f64653e0a0a4f6e63652069645f7273612e70756220686173206265656e207472616e736665727265642c2074727920746f2053534820746f207468652072656d6f7465207365727665722e2049662065766572797468696e672077656e74204f4b207468656e20796f752073686f756c646ee28099742062652070726f6d7074656420666f7220612070617373776f72642e0a0a496620697420646f73656ee280997420776f726b2c20656974686572207468652053534820636f6e66696775726174696f6e206f6e207468652072656d6f7465206d616368696e652069736ee28099742073657420757020746f20616363657074207075626c6963206b65797320616e642070617373776f72642d6c657373206c6f67696e732c206f7220746865207065726d697373696f6e73206f66207468652069645f7273612e7075622066696c652061726520696e636f72726563742e20476f6f676c6520697320796f757220667269656e6420686572652c20616e6420616c736f2074686973206c696e6b2068617320736f6d652068656c7066756c2068696e74732028687474703a2f2f7777772e64656269616e2d61646d696e697374726174696f6e2e6f72672f61727469636c65732f313532292e0a0a2727274368616e676520737368206c6f67696e2062616e6e6572206574632727270a3c62723e6d6f7665206f6c642066696c65206173206261636b75702c207375646f206d76202f6574632f6d6f7464202f6574632f6d6f74642e62616b3c62723e0a637265617465206e6577202f6574632f6d6f74642066696c652028706f73742d6c6f67696e206d657373616765292c20736176652e3c62723e0a6164642f6564697420666f6c6c6f77696e67206c696e6520696e202f6574632f64656661756c742f726353202d2d2022454449544d4f54443d6e6f223c62723e0a7375646f206e616e6f202f6574632f7373682f737368645f636f6e66696720616e6420756e636f6d6d656e74207468652042616e6e6572206c696e65207769746820222f6574632f69737375652e6e6574223c62723e0a3c636f64653e7375646f206e616e6f202f6574632f69737375652e6e65743c2f636f64653e202d2d20646973706c61796564206f6e20636f6e6e6563742c207072652d6c6f67696e3c62723e0a3c636f64653e7375646f206e616e6f202f6574632f6d6f74643c2f636f64653e202d2d20646973706c6179656420706f73742d6c6f67696e3c62723e0a686176652061206c6f6f6b206174202f6574632f7570646174652d6d6f74642e642f30302d6865616465722028776861747320676f696e67206f6e2074686572653f293c62723e0a3c636f64653e2f6574632f696e69742e642f73736820726573746172743c2f636f64653e0a696620646f6e652070726f7065726c792c20776f6e277420616c6c20646973617070656172206f6e207265626f6f74210a0a27272752756e6e696e672072656d6f746520636f6d6d616e64732727270a3c62723e576f726b73206265737420746f20686176652061207075626c6963206b6579207365747570206265747765656e207468652074776f20736572766572732e0a0a3c636f64653e7373682075736572407365727665722e6e6574206c733c2f636f64653e0a0a52756e206d756c7469706c6520636f6d6d616e6473202d0a3c62723e3c636f64653e7373682075736572407365727665722e6e657420222f686f6d652f757365722f736372697074732f6c6f6c2e73683b206c73223c2f636f64653e, 0x7574662d38),
(86, 0x3c636f64653e2f626f6f742f677275622f677275622e6366673c2f636f64653e206973206175746f2067656e657261746564206279203c636f64653e7570646174652d677275623c2f636f64653e0a0a546865207072696d61727920636f6e66696775726174696f6e2066696c6520666f72206368616e67696e67206d656e7520646973706c61792073657474696e6773206973202f6574632f64656661756c742f677275622e0a0a546865726520617265206d756c7469706c652066696c657320666f7220636f6e6669677572696e6720746865206d656e75202d202f6574632f64656661756c742f67727562206d656e74696f6e65642061626f76652c20616e6420616c6c207468652066696c657320696e20746865202f6574632f677275622e642f206469726563746f72792e, 0x7574662d38),
(87, 0x2727274c6973742070726f6365737365732077697468206f70656e20706f727473202d2727270a3c62723e3c636f64653e24207375646f206e657473746174202d74706c3c2f636f64653e0a0a2727275461722727270a3c62723e436f6d707265737320612066696c65202d200a3c62723e3c636f64653e2420746172202d637a662077686174657665722e74617220666f6c6465726e616d653c2f636f64653e0a0a556e74617220612066696c65202d0a3c62723e3c636f64653e2420746172202d78662077686174657665722e7461723c2f636f64653e0a0a546172206f7074696f6e73202d0a3c62723e3c636f64653e2d63203d206372656174650a3c62723e2d66203d207265616420746f2f66726f6d20746865206e616d65642066696c650a3c62723e2d74203d206c69737420636f6e74656e7473206f66202e7461722066696c650a3c62723e2d72203d20617070656e6420746f2061202e7461722066696c650a3c62723e2d76203d20766572626f73650a3c62723e2d78203d206578747261637420636f6e74656e7473206f66202e7461722066696c650a3c62723e2d7a203d20636f6d70726573732066696c65733c2f636f64653e0a0a2727274368616e67652074696d657a6f6e65202d2727270a3c62723e3c636f64653e24207375646f2064706b672d7265636f6e66696775726520747a646174613c2f636f64653e, 0x7574662d38),
(88, 0x272727496e7374616c6c696e67204769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c636f64653e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e342f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e3c2f636f64653e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a2727274d616b696e672061206e6577207265706f2727270a3c636f64653e3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d453c2f636f64653e2028776974682077686174657665722074657874290a3c636f64653e3c62723e242067697420616464202e203c2f636f64653e28746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c636f64653e3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e273c2f636f64653e0a0a2727274272616e636865732727270a3c62723e2727436865636b696e67206f75742061206e6577206272616e636827270a3c636f64653e3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e743c2f636f64653e0a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e273c2f636f64653e0a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c636f64653e3c62723e2420676974206272616e63683c2f636f64653e0a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c636f64653e3c62723e242067697420636865636b6f7574206d6173746572203c2f636f64653e286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c636f64653e3c62723e2420676974206d6572676520646576656c6f706d656e743c2f636f64653e0a0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c62723e4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e6368206f6e207468652072656d6f746520736572766572746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c636f64653e3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f206e616d656f666272616e63683c2f636f64653e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573683c2f636f64653e0a0a4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c636f64653e3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63683c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e0a0a2727274769744875622727270a536d616c6c2073656374696f6e206f6e206d616b696e672061206e6577207265706f206f6e2047697448756220616e642070757368696e6720746f2069742066726f6d2061206c6f63616c207265706f2e0a0a466972737420656e7375726520676974207661726961626c6573206f6e206c6f63616c206d616368696e65206d617463682047697448756220757365726e616d6520616e6420656d61696c202d0a3c636f64653e3c62723e242067697420636f6e666967202d2d676c6f62616c20757365722e6e616d652022757365726e616d65220a3c62723e242067697420636f6e666967202d2d676c6f62616c20757365722e656d61696c207573657240646f6d61696e2e6f72673c2f636f64653e0a0a5468656e206372656174652061206e6577206c6f63616c207265706f202d0a3c636f64653e3c62723e24206364202f6e65777265706f0a3c62723e242067697420696e69740a3c62723e2420746f75636820524541444d450a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d2022496e697469616c20636f6d6d69742e223c2f636f64653e0a0a5468656e206372656174652061206e6577207265706f206f6e204769744875622e200a0a4166746572207265706f206973206d6164652c20736574206c6f63616c207265706f20746f207075736820746f20476974487562207265706f202d0a3c62723e3c636f64653e24206769742072656d6f746520616464206f726967696e20676974406769746875622e636f6d3a596f75722d557365726e616d652f617765736f6d6550726f6a6563742e6769743c2f636f64653e0a0a546f207075736820746f204769744875622066726f6d206c6f63616c206d616368696e652c20656e7465722074686520666f6c6c6f77696e6720636f6d6d616e64202d0a3c636f64653e3c62723e24206769742070757368202d75206f726967696e206d61737465723c2f637064653e, 0x7574662d38),
(89, 0x272727496e7374616c6c696e67204769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c636f64653e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e342f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e3c2f636f64653e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a2727274d616b696e672061206e6577207265706f2727270a3c636f64653e3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d453c2f636f64653e2028776974682077686174657665722074657874290a3c636f64653e3c62723e242067697420616464202e203c2f636f64653e28746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c636f64653e3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e273c2f636f64653e0a0a2727274272616e636865732727270a3c62723e2727436865636b696e67206f75742061206e6577206272616e636827270a3c636f64653e3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e743c2f636f64653e0a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e273c2f636f64653e0a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c636f64653e3c62723e2420676974206272616e63683c2f636f64653e0a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c636f64653e3c62723e242067697420636865636b6f7574206d6173746572203c2f636f64653e286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c636f64653e3c62723e2420676974206d6572676520646576656c6f706d656e743c2f636f64653e0a0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c62723e4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e6368206f6e207468652072656d6f746520736572766572746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c636f64653e3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f206e616d656f666272616e63683c2f636f64653e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573683c2f636f64653e0a0a4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c636f64653e3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63683c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e0a0a2727274769744875622727270a536d616c6c2073656374696f6e206f6e206d616b696e672061206e6577207265706f206f6e2047697448756220616e642070757368696e6720746f2069742066726f6d2061206c6f63616c207265706f2e0a0a466972737420656e7375726520676974207661726961626c6573206f6e206c6f63616c206d616368696e65206d617463682047697448756220757365726e616d6520616e6420656d61696c202d0a3c636f64653e3c62723e242067697420636f6e666967202d2d676c6f62616c20757365722e6e616d652022757365726e616d65220a3c62723e242067697420636f6e666967202d2d676c6f62616c20757365722e656d61696c207573657240646f6d61696e2e6f72673c2f636f64653e0a0a5468656e206372656174652061206e6577206c6f63616c207265706f202d0a3c636f64653e3c62723e24206364202f6e65777265706f0a3c62723e242067697420696e69740a3c62723e2420746f75636820524541444d450a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d2022496e697469616c20636f6d6d69742e223c2f636f64653e0a0a5468656e206372656174652061206e6577207265706f206f6e204769744875622e200a0a4166746572207265706f206973206d6164652c20736574206c6f63616c207265706f20746f207075736820746f20476974487562207265706f202d0a3c62723e3c636f64653e24206769742072656d6f746520616464206f726967696e20676974406769746875622e636f6d3a596f75722d557365726e616d652f617765736f6d6550726f6a6563742e6769743c2f636f64653e0a0a546f207075736820746f204769744875622066726f6d206c6f63616c206d616368696e652c20656e7465722074686520666f6c6c6f77696e6720636f6d6d616e64202d0a3c636f64653e3c62723e24206769742070757368202d75206f726967696e206d61737465723c2f636f64653e, 0x7574662d38),
(90, 0x272727496e7374616c6c696e67204769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c636f64653e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e342f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e3c2f636f64653e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a2727274d616b696e672061206e6577207265706f2727270a3c636f64653e3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d453c2f636f64653e2028776974682077686174657665722074657874290a3c636f64653e3c62723e242067697420616464202e203c2f636f64653e28746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c636f64653e3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e273c2f636f64653e0a0a2727274272616e636865732727270a3c62723e2727436865636b696e67206f75742061206e6577206272616e636827270a3c636f64653e3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e743c2f636f64653e0a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e273c2f636f64653e0a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c636f64653e3c62723e2420676974206272616e63683c2f636f64653e0a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c636f64653e3c62723e242067697420636865636b6f7574206d6173746572203c2f636f64653e286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c636f64653e3c62723e2420676974206d6572676520646576656c6f706d656e743c2f636f64653e0a0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c62723e4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e6368206f6e207468652072656d6f746520736572766572746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c636f64653e3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f206e616d656f666272616e63683c2f636f64653e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573683c2f636f64653e0a0a4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c636f64653e3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63683c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e0a0a2727274769744875622727270a3c62723e536d616c6c2073656374696f6e206f6e206d616b696e672061206e6577207265706f206f6e2047697448756220616e642070757368696e6720746f2069742066726f6d2061206c6f63616c207265706f2e0a0a466972737420656e7375726520676974207661726961626c6573206f6e206c6f63616c206d616368696e65206d617463682047697448756220757365726e616d6520616e6420656d61696c202d0a3c636f64653e3c62723e242067697420636f6e666967202d2d676c6f62616c20757365722e6e616d652022757365726e616d65220a3c62723e242067697420636f6e666967202d2d676c6f62616c20757365722e656d61696c207573657240646f6d61696e2e6f72673c2f636f64653e0a0a5468656e206372656174652061206e6577206c6f63616c207265706f202d0a3c636f64653e3c62723e24206364202f6e65777265706f0a3c62723e242067697420696e69740a3c62723e2420746f75636820524541444d450a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d2022496e697469616c20636f6d6d69742e223c2f636f64653e0a0a5468656e206372656174652061206e6577207265706f206f6e204769744875622e200a0a4166746572207265706f206973206d6164652c20736574206c6f63616c207265706f20746f207075736820746f20476974487562207265706f202d0a3c62723e3c636f64653e24206769742072656d6f746520616464206f726967696e20676974406769746875622e636f6d3a596f75722d557365726e616d652f617765736f6d6550726f6a6563742e6769743c2f636f64653e0a0a546f207075736820746f204769744875622066726f6d206c6f63616c206d616368696e652c20656e7465722074686520666f6c6c6f77696e6720636f6d6d616e64202d0a3c636f64653e3c62723e24206769742070757368202d75206f726967696e206d61737465723c2f636f64653e, 0x7574662d38),
(91, 0x272727496e7374616c6c696e67204769742727270a3c62723e4261736564206f6e2031302e3034205365727665720a0a3c636f64653e24207375646f206170746974756465206275696c642d646570206769742d636f72650a3c62723e24207767657420687474703a2f2f6b65726e656c2e6f72672f7075622f736f6674776172652f73636d2f6769742f6769742d312e372e342e7461722e677a2028636865636b206c61746573742076657273696f6e290a3c62723e24207461722078767a66206769742d312e372e342e7461722e677a0a3c62723e24206364206769742d312e372e342f0a3c62723e24202e2f636f6e6669677572650a3c62723e24206d616b650a3c62723e24207375646f206d616b6520696e7374616c6c0a3c62723e2420676974202d2d76657273696f6e0a3c62723e24206364202e2e3c2f636f64653e0a3c62723e2727436c65616e20757020616674657220696e7374616c6c6174696f6e202d27270a3c62723e2420726d202d72206769742d312e372e34206769742d312e372e342e7461722e677a0a0a2727274d616b696e672061206e6577207265706f2727270a3c636f64653e3c62723e24206d6b646972206e65777265706f0a3c62723e24206364206e65777265706f0a3c62723e242067697420696e69740a3c62723e24206e616e6f20524541444d453c2f636f64653e2028776974682077686174657665722074657874290a3c636f64653e3c62723e242067697420616464202e203c2f636f64653e28746f2061646420616c6c2066696c657320696e206469726563746f727920746f20696e646578290a3c636f64653e3c62723e242067697420636f6d6d6974202d6d2027496e697469616c20636f6d6d69742e273c2f636f64653e0a0a2727274272616e636865732727270a3c62723e2727436865636b696e67206f75742061206e6577206272616e636827270a3c636f64653e3c62723e242067697420636865636b6f7574202d6220646576656c6f706d656e743c2f636f64653e0a3c62723e27274164642066696c65732c207468656e20636f6d6d6974206368616e676573202d27270a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d202741646465642066696c657320746f20646576656c6f706d656e74206272616e63682e273c2f636f64653e0a3c62723e27274c69737420616c6c206272616e636865732077697468202d27270a3c636f64653e3c62723e2420676974206272616e63683c2f636f64653e0a3c62723e27274368616e6765206272616e636865732077697468202d27270a3c636f64653e3c62723e242067697420636865636b6f7574206d6173746572203c2f636f64653e286f72207768617465766572206272616e636820796f752077616e74290a3c62723e27274d65726765206272616e63686573202874686973206578616d706c65206973206d657267696e6720646576656c6f706d656e74206272616e63682077697468206d6173746572206272616e63682c206d616b65207375726520796f7527766520636865636b6564206f757420746865206d6173746572206272616e636820666972737429202d27270a3c636f64653e3c62723e2420676974206d6572676520646576656c6f706d656e743c2f636f64653e0a0a272727436c6f6e696e672061207265706f2066726f6d2072656d6f7465207365727665722727270a3c62723e4d616b65207375726520796f7527766520636865636b6564206f757420616e6f74686572206272616e6368206f6e207468652072656d6f746520736572766572746861742069736e277420746865206d6173746572206272616e63682c20736179206120646576656c6f706d656e74206272616e63682c206f746865727769736520796f75276c6c2067657420616e206572726f722e0a3c636f64653e3c62723e242067697420636c6f6e65207373683a2f2f75736572406c6f652e6f72673a2f6769742f7265706f206e616d656f666272616e63683c2f636f64653e0a3c62723e4d616b65206368616e6765732c207468656e2070757368206261636b20746f20736572766572202d0a3c636f64653e3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d20224d616465206368616e676573220a3c62723e242067697420707573683c2f636f64653e0a0a4f7220796f7520636f756c64207273796e6320616c6c2066696c6573206265747765656e20736572766572732c207468656e20696e6974206120676974207265706f20696e20746865206469726563746f727920686f6c64696e67207468652066696c65732e205468656e207573652074686520666f6c6c6f77696e6720746f207075736820616e79206368616e67657320746f2061206e6577206272616e6368206f6e207468652072656d6f746520736572766572202d200a3c636f64653e3c62723e242067697420707573682075736572406c6f652e6f72673a2f6769742f7265706f202d62206e65776272616e63683c2f636f64653e0a0a2727274572726f727320616e6420776f726b61726f756e64732727270a3c62723e276272616e636820636865636b6564206f757427206572726f7220697320636f6d6d6f6e207768656e20747279696e6720746f207075736820746f20612072656d6f7465207365727665722c206a757374206d616b652073757265207468617420746865206272616e636820796f7527726520747279696e6720746f207075736820746f2069736e277420616c726561647920636865636b6564206f7574206f6e207468652072656d6f7465207365727665722e20557365203c636f64653e67697420636865636b6f757420616e6f746865726272616e63683c2f636f64653e206f6e2072656d6f74652073657276657220746f2073776974636820746f20616e6f74686572206272616e63682e0a0a2727274769744875622727270a3c62723e536d616c6c2073656374696f6e206f6e206d616b696e672061206e6577207265706f206f6e2047697448756220616e642070757368696e6720746f2069742066726f6d2061206c6f63616c207265706f2e0a0a466972737420656e7375726520676974207661726961626c6573206f6e206c6f63616c206d616368696e65206d617463682047697448756220757365726e616d6520616e6420656d61696c202d0a3c636f64653e3c62723e242067697420636f6e666967202d2d676c6f62616c20757365722e6e616d652022757365726e616d65220a3c62723e242067697420636f6e666967202d2d676c6f62616c20757365722e656d61696c207573657240646f6d61696e2e6f72670a3c62723e242067697420636f6e666967202d2d676c6f62616c206769746875622e7573657220757365726e616d650a3c62723e242067697420636f6e666967202d2d676c6f62616c206769746875622e746f6b656e2030313233343536373839796f75726630313233343536373839746f6b656e2028696620796f75206e6565642041504920616363657373293c2f636f64653e0a0a5468656e206372656174652061206e6577206c6f63616c207265706f202d0a3c636f64653e3c62723e24206364202f6e65777265706f0a3c62723e242067697420696e69740a3c62723e2420746f75636820524541444d450a3c62723e242067697420616464202e0a3c62723e242067697420636f6d6d6974202d6d2022496e697469616c20636f6d6d69742e223c2f636f64653e0a0a5468656e206372656174652061206e6577207265706f206f6e204769744875622e200a0a4166746572207265706f206973206d6164652c20736574206c6f63616c207265706f20746f207075736820746f20476974487562207265706f202d0a3c62723e3c636f64653e24206769742072656d6f746520616464206f726967696e20676974406769746875622e636f6d3a596f75722d557365726e616d652f617765736f6d6550726f6a6563742e6769743c2f636f64653e0a0a546f207075736820746f204769744875622066726f6d206c6f63616c206d616368696e652c20656e7465722074686520666f6c6c6f77696e6720636f6d6d616e64202d0a3c636f64653e3c62723e24206769742070757368202d75206f726967696e206d61737465723c2f636f64653e, 0x7574662d38),
(92, 0x272727417061636865205365727665722727270a3c62723e27274d697363206572726f727320616e6420666978657327270a3c62723e4966202e706870207061676573206172656e27742073686f77696e6720616e6420617265206f66666572696e6720746f20646f776e6c6f6164207468652066696c657320696e73746561642e0a0a45646974202f6574632f617061636865322f6d6f64732d656e61626c65642f706870352e636f6e6620746f206d617463682074686520666f6c6c6f77696e67202d0a3c62723e3c636f64653e3c49664d6f64756c65206d6f645f706870352e633e0a3c62723e202020203c46696c65734d6174636820225c2e70682870333f7c746d6c2924223e0a3c62723e202020202020202053657448616e646c6572206170706c69636174696f6e2f782d68747470642d7068700a3c62723e202020203c2f46696c65734d617463683e0a3c62723e202020203c46696c65734d6174636820225c2e7068707324223e0a3c62723e202020202020202053657448616e646c6572206170706c69636174696f6e2f782d68747470642d7068702d736f757263650a3c62723e202020203c2f46696c65734d617463683e0a3c62723e202020202320546f2072652d656e61626c652070687020696e2075736572206469726563746f7269657320636f6d6d656e742074686520666f6c6c6f77696e67206c696e65730a3c62723e2020202023202866726f6d203c49664d6f64756c65202e2e2e3e20746f203c2f49664d6f64756c653e2e2920446f204e4f542073657420697420746f204f6e2061732069740a3c62723e20202020232070726576656e7473202e68746163636573732066696c65732066726f6d2064697361626c696e672069742e0a3c62723e20202020233c49664d6f64756c65206d6f645f757365726469722e633e0a3c62723e20202023202020203c4469726563746f7279202f686f6d652f2a2f7075626c69635f68746d6c3e0a3c62723e202020202320202020202020207068705f61646d696e5f76616c756520656e67696e65204f66660a3c62723e2020202023202020203c2f4469726563746f72793e0a3c62723e20202020233c2f49664d6f64756c653e0a3c62723e3c2f49664d6f64756c653e3c2f636f64653e, 0x7574662d38),
(93, 0x27272753696d706c652048545450207365727665722066726f6d20616e79206469726563746f72792727270a3c62723e3c636f64653e2420707974686f6e202d6d2053696d706c6548545450536572766572205b706f72745d3c2f636f64653e, 0x7574662d38),
(94, 0x27272752756279206f6e205261696c7320696e7374616c6c2727270a3c62723e476f6f6420736574757020666f7220646576656c6f706d656e742e, 0x7574662d38);

-- --------------------------------------------------------

--
-- Table structure for table `nw_trackbacks`
--

DROP TABLE IF EXISTS `nw_trackbacks`;
CREATE TABLE IF NOT EXISTS `nw_trackbacks` (
  `tb_id` int(11) NOT NULL AUTO_INCREMENT,
  `tb_page` int(11) DEFAULT NULL,
  `tb_title` varbinary(255) NOT NULL,
  `tb_url` blob NOT NULL,
  `tb_ex` blob,
  `tb_name` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`tb_id`),
  KEY `tb_page` (`tb_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary AUTO_INCREMENT=1 ;

--
-- Dumping data for table `nw_trackbacks`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_transcache`
--

DROP TABLE IF EXISTS `nw_transcache`;
CREATE TABLE IF NOT EXISTS `nw_transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` blob,
  `tc_time` int(11) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_transcache`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_updatelog`
--

DROP TABLE IF EXISTS `nw_updatelog`;
CREATE TABLE IF NOT EXISTS `nw_updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_updatelog`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_user`
--

DROP TABLE IF EXISTS `nw_user`;
CREATE TABLE IF NOT EXISTS `nw_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_options` blob NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=binary AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nw_user`
--

INSERT INTO `nw_user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_options`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`) VALUES
(1, 'Admin', 'jl', 0x3a423a62616331343033623a6564383537653166623838653964643534616630643138346531636332653765, '', NULL, '', 0x717569636b6261723d310a756e6465726c696e653d320a636f6c733d38300a726f77733d32350a7365617263686c696d69743d32300a636f6e746578746c696e65733d350a636f6e7465787463686172733d35300a64697361626c65737567676573743d0a736b696e3d6d6f6e6f626f6f6b0a6d6174683d310a7573656e657772633d300a7263646179733d370a72636c696d69743d35300a776c6c696d69743d3235300a686964656d696e6f723d300a68696465706174726f6c6c65643d300a6e6577706167657368696465706174726f6c6c65643d300a686967686c6967687462726f6b656e3d310a737475627468726573686f6c643d300a707265766965776f6e746f703d310a707265766965776f6e66697273743d300a6564697473656374696f6e3d310a6564697473656374696f6e6f6e7269676874636c69636b3d300a656469746f6e64626c636c69636b3d300a6564697477696474683d300a73686f77746f633d310a73686f77746f6f6c6261723d310a6d696e6f7264656661756c743d300a646174653d64656661756c740a696d61676573697a653d320a7468756d6273697a653d320a72656d656d62657270617373776f72643d300a6e6f63616368653d300a646966666f6e6c793d300a73686f7768696464656e636174733d300a6e6f726f6c6c6261636b646966663d300a656e6f74696677617463686c69737470616765733d300a656e6f7469667573657274616c6b70616765733d300a656e6f7469666d696e6f7265646974733d300a656e6f74696672657665616c616464723d300a73686f776e756d626572737761746368696e673d300a66616e63797369673d300a65787465726e616c656469746f723d300a65787465726e616c646966663d300a666f7263656564697473756d6d6172793d300a73686f776a756d706c696e6b733d310a6a7573746966793d300a6e756d62657268656164696e67733d300a7573656c697665707265766965773d300a77617463686c697374646179733d330a657874656e6477617463686c6973743d300a77617463686c697374686964656d696e6f723d300a77617463686c69737468696465626f74733d300a77617463686c697374686964656f776e3d300a77617463686c69737468696465616e6f6e733d300a77617463686c697374686964656c69753d300a77617463686c69737468696465706174726f6c6c65643d300a77617463686372656174696f6e733d300a776174636864656661756c743d300a77617463686d6f7665733d300a776174636864656c6574696f6e3d300a6e6f636f6e766572746c696e6b3d300a67656e6465723d756e6b6e6f776e0a76617269616e743d0a6c616e67756167653d656e0a7365617263684e73303d310a6e69636b6e616d653d0a74696d65636f7272656374696f6e3d53797374656d7c0a7365617263684e73313d300a7365617263684e73323d300a7365617263684e73333d300a7365617263684e73343d300a7365617263684e73353d300a7365617263684e73363d300a7365617263684e73373d300a7365617263684e73383d300a7365617263684e73393d300a7365617263684e7331303d300a7365617263684e7331313d300a7365617263684e7331323d300a7365617263684e7331333d300a7365617263684e7331343d300a7365617263684e7331353d300a63636d656f6e656d61696c733d30, '20110512083301', '8e440ec68df498782986b415a0348eff', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', NULL, '20110214142428', 88),
(2, 'Lag', '', 0x3a423a37343136626265303a6632656234373262323739316537633761316239343962633061316265653233, '', NULL, '', 0x717569636b6261723d310a756e6465726c696e653d320a636f6c733d38300a726f77733d32350a7365617263686c696d69743d32300a636f6e746578746c696e65733d350a636f6e7465787463686172733d35300a64697361626c65737567676573743d300a736b696e3d0a6d6174683d310a7573656e657772633d300a7263646179733d370a72636c696d69743d35300a776c6c696d69743d3235300a686964656d696e6f723d300a68696465706174726f6c6c65643d300a6e6577706167657368696465706174726f6c6c65643d300a686967686c6967687462726f6b656e3d310a737475627468726573686f6c643d300a707265766965776f6e746f703d310a707265766965776f6e66697273743d300a6564697473656374696f6e3d310a6564697473656374696f6e6f6e7269676874636c69636b3d300a656469746f6e64626c636c69636b3d300a6564697477696474683d300a73686f77746f633d310a73686f77746f6f6c6261723d310a6d696e6f7264656661756c743d300a646174653d64656661756c740a696d61676573697a653d320a7468756d6273697a653d320a72656d656d62657270617373776f72643d300a6e6f63616368653d300a646966666f6e6c793d300a73686f7768696464656e636174733d300a6e6f726f6c6c6261636b646966663d300a656e6f74696677617463686c69737470616765733d300a656e6f7469667573657274616c6b70616765733d310a656e6f7469666d696e6f7265646974733d300a656e6f74696672657665616c616464723d300a73686f776e756d626572737761746368696e673d310a66616e63797369673d300a65787465726e616c656469746f723d300a65787465726e616c646966663d300a666f7263656564697473756d6d6172793d300a73686f776a756d706c696e6b733d310a6a7573746966793d300a6e756d62657268656164696e67733d300a7573656c697665707265766965773d300a77617463686c697374646179733d330a657874656e6477617463686c6973743d300a77617463686c697374686964656d696e6f723d300a77617463686c69737468696465626f74733d300a77617463686c697374686964656f776e3d300a77617463686c69737468696465616e6f6e733d300a77617463686c697374686964656c69753d300a77617463686c69737468696465706174726f6c6c65643d300a77617463686372656174696f6e733d300a776174636864656661756c743d300a77617463686d6f7665733d300a776174636864656c6574696f6e3d300a6e6f636f6e766572746c696e6b3d300a67656e6465723d756e6b6e6f776e0a76617269616e743d656e0a6c616e67756167653d656e0a7365617263684e73303d31, '20110505140521', '8ac3a9b78e274a77c967aca46845f4d8', NULL, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', NULL, '20110314130810', 4);

-- --------------------------------------------------------

--
-- Table structure for table `nw_user_groups`
--

DROP TABLE IF EXISTS `nw_user_groups`;
CREATE TABLE IF NOT EXISTS `nw_user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(16) NOT NULL DEFAULT '',
  UNIQUE KEY `ug_user_group` (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_user_groups`
--

INSERT INTO `nw_user_groups` (`ug_user`, `ug_group`) VALUES
(1, 'bureaucrat'),
(2, 'bureaucrat'),
(1, 'sysop'),
(2, 'sysop');

-- --------------------------------------------------------

--
-- Table structure for table `nw_user_newtalk`
--

DROP TABLE IF EXISTS `nw_user_newtalk`;
CREATE TABLE IF NOT EXISTS `nw_user_newtalk` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_user_newtalk`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_valid_tag`
--

DROP TABLE IF EXISTS `nw_valid_tag`;
CREATE TABLE IF NOT EXISTS `nw_valid_tag` (
  `vt_tag` varbinary(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_valid_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `nw_watchlist`
--

DROP TABLE IF EXISTS `nw_watchlist`;
CREATE TABLE IF NOT EXISTS `nw_watchlist` (
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `nw_watchlist`
--

