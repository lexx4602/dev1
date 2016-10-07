-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 07 2016 г., 11:52
-- Версия сервера: 5.6.30
-- Версия PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dev1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `acltype`
--

DROP TABLE IF EXISTS `acltype`;
CREATE TABLE `acltype` (
  `acltype_id` int(11) NOT NULL,
  `acltypename` varchar(25) NOT NULL,
  `content` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `acltype`:
--

--
-- Дамп данных таблицы `acltype`
--

INSERT INTO `acltype` (`acltype_id`, `acltypename`, `content`) VALUES
(1, 'Запрет', 'Доступ запрещен'),
(2, 'Чтение', 'Права на чтение'),
(3, 'Запись', 'Права на чтение и запись'),
(4, 'Создать', 'Права на создание записи'),
(5, 'Читать все', 'Права на чтение всех данных модуля'),
(6, 'Полные права', 'Полные права на модуль'),
(7, 'Запись всё', 'Редактирование модуля');

-- --------------------------------------------------------

--
-- Структура таблицы `demons`
--

DROP TABLE IF EXISTS `demons`;
CREATE TABLE `demons` (
  `demon_id` int(11) NOT NULL,
  `demonname` varchar(25) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `demons`:
--

--
-- Дамп данных таблицы `demons`
--

INSERT INTO `demons` (`demon_id`, `demonname`, `note`) VALUES
(1, 'Nginx', ''),
(2, 'Apache 2.2', ''),
(3, 'MySQL', ''),
(4, 'PostgreSQL', ''),
(5, 'Tomcat 6', ''),
(6, 'Tomcat 7', ''),
(7, 'Zabbix - Agent', ''),
(8, 'Zabbix - Server', ''),
(9, 'Alfresco', ''),
(10, 'Bitrix 24', ''),
(11, 'Fail2Ban', ''),
(12, 'Iptables', ''),
(13, 'Firewalld', ''),
(14, 'Openssl', ''),
(15, 'IIS 6.0', ''),
(16, 'IIs 7.0', ''),
(17, 'MS SQL Standart', ''),
(18, 'MS SQL Express', ''),
(19, 'Active Directory', ''),
(20, 'AD Federation Service', ''),
(21, 'Samba', ''),
(22, 'RedMine', '');

-- --------------------------------------------------------

--
-- Структура таблицы `dnsreg`
--

DROP TABLE IF EXISTS `dnsreg`;
CREATE TABLE `dnsreg` (
  `dnsreg_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `fullname` varchar(125) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `dnsreg`:
--

--
-- Дамп данных таблицы `dnsreg`
--

INSERT INTO `dnsreg` (`dnsreg_id`, `name`, `fullname`, `content`) VALUES
(1, 'RU_CENTER', '', ''),
(2, 'REG.RU', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `domains`
--

DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `domain_id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `created` date NOT NULL,
  `expired` date NOT NULL,
  `project_id` int(11) NOT NULL,
  `dnsreg_id` int(11) NOT NULL,
  `zoneconfig` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Domain names table';

--
-- СВЯЗИ ТАБЛИЦЫ `domains`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `fsname` int(255) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `files`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `groupname` varchar(30) NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `groups`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `hosts`
--

DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts` (
  `host_id` int(11) NOT NULL,
  `hostname` varchar(40) NOT NULL,
  `content` varchar(125) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `textkey` varchar(255) NOT NULL,
  `register` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `hosts`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `ipaddress`
--

DROP TABLE IF EXISTS `ipaddress`;
CREATE TABLE `ipaddress` (
  `id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '4',
  `expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `ipaddress`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_admin`
--

DROP TABLE IF EXISTS `key_admin`;
CREATE TABLE `key_admin` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_admin`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_dmnsvc`
--

DROP TABLE IF EXISTS `key_dmnsvc`;
CREATE TABLE `key_dmnsvc` (
  `demon_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_dmnsvc`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_hostobj`
--

DROP TABLE IF EXISTS `key_hostobj`;
CREATE TABLE `key_hostobj` (
  `host_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_hostobj`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_hosts`
--

DROP TABLE IF EXISTS `key_hosts`;
CREATE TABLE `key_hosts` (
  `host_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_hosts`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_ip`
--

DROP TABLE IF EXISTS `key_ip`;
CREATE TABLE `key_ip` (
  `host_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_ip`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_mainip`
--

DROP TABLE IF EXISTS `key_mainip`;
CREATE TABLE `key_mainip` (
  `server_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_mainip`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_owner`
--

DROP TABLE IF EXISTS `key_owner`;
CREATE TABLE `key_owner` (
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_owner`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_prjobj`
--

DROP TABLE IF EXISTS `key_prjobj`;
CREATE TABLE `key_prjobj` (
  `project_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_prjobj`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_project`
--

DROP TABLE IF EXISTS `key_project`;
CREATE TABLE `key_project` (
  `project_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_project`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_sprjsrv`
--

DROP TABLE IF EXISTS `key_sprjsrv`;
CREATE TABLE `key_sprjsrv` (
  `supproject_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_sprjsrv`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_sprjsvc`
--

DROP TABLE IF EXISTS `key_sprjsvc`;
CREATE TABLE `key_sprjsvc` (
  `supproject_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_sprjsvc`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_sprjsyst`
--

DROP TABLE IF EXISTS `key_sprjsyst`;
CREATE TABLE `key_sprjsyst` (
  `supproject_id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_sprjsyst`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_srchost`
--

DROP TABLE IF EXISTS `key_srchost`;
CREATE TABLE `key_srchost` (
  `service_id` int(11) DEFAULT NULL,
  `host_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_srchost`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_srvobj`
--

DROP TABLE IF EXISTS `key_srvobj`;
CREATE TABLE `key_srvobj` (
  `server_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_srvobj`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_srvprj`
--

DROP TABLE IF EXISTS `key_srvprj`;
CREATE TABLE `key_srvprj` (
  `server_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Server project relation';

--
-- СВЯЗИ ТАБЛИЦЫ `key_srvprj`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_srvsrc`
--

DROP TABLE IF EXISTS `key_srvsrc`;
CREATE TABLE `key_srvsrc` (
  `service_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_srvsrc`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_svcadm`
--

DROP TABLE IF EXISTS `key_svcadm`;
CREATE TABLE `key_svcadm` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_svcadm`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_svcobj`
--

DROP TABLE IF EXISTS `key_svcobj`;
CREATE TABLE `key_svcobj` (
  `service_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_svcobj`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_svcown`
--

DROP TABLE IF EXISTS `key_svcown`;
CREATE TABLE `key_svcown` (
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_svcown`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_sysobj`
--

DROP TABLE IF EXISTS `key_sysobj`;
CREATE TABLE `key_sysobj` (
  `system_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_sysobj`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_syssrc`
--

DROP TABLE IF EXISTS `key_syssrc`;
CREATE TABLE `key_syssrc` (
  `system_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_syssrc`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_systprj`
--

DROP TABLE IF EXISTS `key_systprj`;
CREATE TABLE `key_systprj` (
  `system_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_systprj`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_systsvc`
--

DROP TABLE IF EXISTS `key_systsvc`;
CREATE TABLE `key_systsvc` (
  `system_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_systsvc`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_sysusr`
--

DROP TABLE IF EXISTS `key_sysusr`;
CREATE TABLE `key_sysusr` (
  `system_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_sysusr`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_trouble`
--

DROP TABLE IF EXISTS `key_trouble`;
CREATE TABLE `key_trouble` (
  `serverid` int(11) NOT NULL,
  `troubleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_trouble`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_usrgp`
--

DROP TABLE IF EXISTS `key_usrgp`;
CREATE TABLE `key_usrgp` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `key_usrgp`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `key_wdomsvc`
--

DROP TABLE IF EXISTS `key_wdomsvc`;
CREATE TABLE `key_wdomsvc` (
  `wd_id` int(11) NOT NULL,
  `svc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Domain Services keys';

--
-- СВЯЗИ ТАБЛИЦЫ `key_wdomsvc`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `needs`
--

DROP TABLE IF EXISTS `needs`;
CREATE TABLE `needs` (
  `id` int(11) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `toneed` text,
  `answer` text,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `needs`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `object`
--

DROP TABLE IF EXISTS `object`;
CREATE TABLE `object` (
  `object_id` int(11) NOT NULL,
  `objectname` varchar(25) NOT NULL,
  `comment` varchar(125) NOT NULL,
  `lists` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `pages` int(11) NOT NULL,
  `systems` int(11) NOT NULL,
  `servers` int(11) NOT NULL,
  `services` int(11) NOT NULL,
  `hosts` int(11) NOT NULL,
  `projects` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `object`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `os`
--

DROP TABLE IF EXISTS `os`;
CREATE TABLE `os` (
  `os_id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `release` varchar(125) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `distrib` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `os`:
--

--
-- Дамп данных таблицы `os`
--

INSERT INTO `os` (`os_id`, `name`, `release`, `comment`, `distrib`) VALUES
(1, 'Linux', 'Centos 7', '0', '0'),
(2, 'Linux', 'Centos 6.7', NULL, NULL),
(3, 'Windows', 'Windows 2008', NULL, NULL),
(4, 'Windows', 'Windows 2012 r2', NULL, NULL),
(5, 'Linux', 'Ubuntu 14', NULL, NULL),
(6, 'Linux', 'Ubuntu 16', NULL, NULL),
(7, 'Linux', 'Ubuntu-12.04.2-server-x64', NULL, NULL),
(8, 'Windows', 'Windows 7', NULL, NULL),
(9, 'Linux', 'AltLinux СПТ 6.0', NULL, NULL),
(10, 'Linux', 'Fedora 16 x 64', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `simple` text,
  `content` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `owner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `pages`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `passport`
--

DROP TABLE IF EXISTS `passport`;
CREATE TABLE `passport` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `sername` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `passport`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `ports`
--

DROP TABLE IF EXISTS `ports`;
CREATE TABLE `ports` (
  `port_id` int(11) NOT NULL,
  `portnum` int(11) NOT NULL,
  `portname` varchar(50) NOT NULL,
  `type` enum('TCP','UDP','RTP','SCTP','DCCP') NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `ports`:
--

--
-- Дамп данных таблицы `ports`
--

INSERT INTO `ports` (`port_id`, `portnum`, `portname`, `type`, `content`) VALUES
(1, 0, '0', 'TCP', 'резерв (допустимо использование в качестве значения порта источника, если отправляющий процесс не ожидает ответных сообщений)'),
(2, 1, '1', 'TCP', 'TCPMUX (TCP Port Service Multiplexer) — для обслуживания нескольких служб через один TCP-порт'),
(3, 1000, '1000', 'TCP', 'CADLOCK2'),
(4, 101, '101', 'TCP', 'HOSTNAME (NIC[en] Host Name Server)'),
(5, 1010, '1010', 'TCP', 'SURF'),
(6, 1011, '1011', 'TCP', 'резерв'),
(7, 1012, '1012', 'TCP', 'резерв'),
(8, 1013, '1013', 'TCP', 'резерв'),
(9, 1014, '1014', 'TCP', 'резерв'),
(10, 1015, '1015', 'TCP', 'резерв'),
(11, 1016, '1016', 'TCP', 'резерв'),
(12, 1017, '1017', 'TCP', 'резерв'),
(13, 1018, '1018', 'TCP', 'резерв'),
(14, 1019, '1019', 'TCP', 'резерв'),
(15, 1020, '1020', 'TCP', 'резерв'),
(16, 102, '102', 'TCP', 'ISO-TSAP (Transport Service Access Point[en] Class 0)[4]'),
(17, 1021, '1021', 'TCP', 'EXP1 (Experiment 1 по RFC3692)[45][46]'),
(18, 1022, '1022', 'TCP', 'EXP2 (Experiment 2 по RFC3692)[45]'),
(19, 1023, '1023', 'TCP', 'резерв'),
(20, 103, '103', 'TCP', 'GPPITNP (Genesis Point-to-Point Trans Net)'),
(21, 104, '104', 'TCP', 'ACR-NEMA (ACR/NEMA DICOM)'),
(22, 105, '105', 'TCP', 'CSO, CSNET-NS (CCSO[en]/Mailbox Name Nameserver)'),
(23, 106, '106', 'TCP', '3COM-TSMUX'),
(24, 107, '107', 'TCP', 'RTELNET (Remote Telnet Service[5])'),
(25, 108, '108', 'TCP', 'SNAGAS (SNA Gateway Access Server)'),
(26, 109, '109', 'TCP', 'POP2 (Post Office Protocol Version 2)'),
(27, 11, '11', 'TCP', 'SYSTAT — выдаёт список активных пользователей в операционной системе'),
(28, 110, '110', 'TCP', 'POP3 (Post Office Protocol Version 3)'),
(29, 111, '111', 'TCP', 'SUNRPC (Sun Remote Procedure Call)'),
(30, 112, '112', 'TCP', 'MCIDAS (McIDAS Data Transmission)'),
(31, 113, '113', 'TCP', 'IDENT — старая система идентификации, до сих пор используется в IRC-серверах'),
(32, 113, '113', 'TCP', 'AUTH (Authentication Service)'),
(33, 115, '115', 'TCP', 'SFTP (Simple File Transfer Protocol[en])'),
(34, 116, '116', 'TCP', 'ANSANOTIFY (ANSA REX Notify)'),
(35, 117, '117', 'TCP', 'UUCP-PATH (UUCP Path Service)'),
(36, 118, '118', 'TCP', 'SQLSERV (SQL Services)'),
(37, 119, '119', 'TCP', 'NNTP (Network News Transfer Protocol) — используется для отправки сообщений новостных рассылок'),
(38, 120, '120', 'TCP', 'CFDPTKT'),
(39, 121, '121', 'TCP', 'ERPC (Encore Expedited Remote Protocol Call)'),
(40, 122, '122', 'TCP', 'SMAKYNET'),
(41, 123, '123', 'TCP', 'NTP (Network Time Protocol) — используется для синхронизации времени'),
(42, 124, '124', 'TCP', 'ANSATRADER (ANSA REX Trader)'),
(43, 125, '125', 'TCP', 'LOCUS-MAP (Locus PC-Interface Net Map Ser)'),
(44, 126, '126', 'TCP', 'NXEdit; ранее — Unisys Unitary Login'),
(45, 127, '127', 'TCP', 'LOCUS-CON (Locus PC-Interface Conn Server)'),
(46, 128, '128', 'TCP', 'GSS-XLICEN (GSS X License Verification)'),
(47, 129, '129', 'TCP', 'PWDGEN (Password Generator Protocol)'),
(48, 13, '13', 'TCP', 'DAYTIME — предназначен для тестирования связи путём получения от сервера текущих даты и времени в текстовом виде'),
(49, 130, '130', 'TCP', 'CISCO-FNA (Cisco FNATIVE)'),
(50, 131, '131', 'TCP', 'CISCO-TNA (Cisco TNATIVE)'),
(51, 132, '132', 'TCP', 'CISCO-SYS (Cisco SYSMAINT)'),
(52, 133, '133', 'TCP', 'STATSRV (Statistics Service)'),
(53, 134, '134', 'TCP', 'INGRES-NET'),
(54, 135, '135', 'TCP', 'EPMAP (DCE[en] Endpoint Mapper)'),
(55, 136, '136', 'TCP', 'PROFILE Naming System'),
(56, 137, '137', 'TCP', 'NETBIOS-NS (NetBIOS Name Service)'),
(57, 138, '138', 'TCP', 'NETBIOS-DGM (NetBIOS Datagram Service)'),
(58, 139, '139', 'TCP', 'NETBIOS-SSN (NetBIOS Session Service)'),
(59, 140, '140', 'TCP', 'EMFIS-DATA (EMFIS Data Service)'),
(60, 141, '141', 'TCP', 'EMFIS-CNTL (EMFIS Control Service)'),
(61, 142, '142', 'TCP', 'BL-IDM (Britton-Lee IDM)'),
(62, 143, 'IMAP (TCP-143)', 'TCP', 'IMAP (Internet Message Access Protocol) — используется для получения и синхронизации сообщений электронной почты'),
(63, 144, '144', 'TCP', 'UMA (Universal Management Architecture)'),
(64, 145, '145', 'TCP', 'UAAC'),
(65, 146, '146', 'TCP', 'ISO-TP0'),
(66, 147, '147', 'TCP', 'ISO-IP'),
(67, 148, '148', 'TCP', 'JARGON'),
(68, 149, '149', 'TCP', 'AED-512'),
(69, 150, '150', 'TCP', 'SQL-NET'),
(70, 151, '151', 'TCP', 'HEMS'),
(71, 152, '152', 'TCP', 'BFTP (Background File Transfer Program)[7]'),
(72, 153, '153', 'TCP', 'SGMP (Simple Gateway Monitoring Protocol[en])'),
(73, 154, '154', 'TCP', 'NETSC-PROD'),
(74, 155, '155', 'TCP', 'NETSC-DEV'),
(75, 156, '156', 'TCP', 'SQLSRV (SQL Service)'),
(76, 157, '157', 'TCP', 'KNET-CMP'),
(77, 158, '158', 'TCP', 'PCMAIL-SRV'),
(78, 159, '159', 'TCP', 'NSS-ROUTING'),
(79, 160, '160', 'TCP', 'SGMP-TRAPS'),
(80, 161, '161', 'TCP', 'SNMP (Simple Network Management Protocol) — используется как порт прослушивания агентами удалённого мониторинга'),
(81, 162, '162', 'TCP', 'SNMPTRAP (Simple Network Management Protocol Trap)[8] — используется как порт приёма асинхронных прерываний (traps)'),
(82, 163, '163', 'TCP', 'CMIP-MAN (CMIP/TCP Manager)'),
(83, 164, '164', 'TCP', 'CMIP-AGENT (CMIP/TCP Agent)'),
(84, 165, '165', 'TCP', 'XNS-COURIER (Xerox Network Services)'),
(85, 166, '166', 'TCP', 'S-NET (Sirius Systems Network)'),
(86, 167, '167', 'TCP', 'NAMP'),
(87, 168, '168', 'TCP', 'RSVD'),
(88, 169, '169', 'TCP', 'SEND'),
(89, 17, '17', 'TCP', 'QOTD (Quote of the Day)'),
(90, 170, '170', 'TCP', 'PRINT-SRV (Network PostScript)'),
(91, 171, '171', 'TCP', 'MULTIPLEX (Network Innovations Multiplex)'),
(92, 172, '172', 'TCP', 'CL-1 (Network Innovations CL/1); ранее — CL/1'),
(93, 173, '173', 'TCP', 'XYPLEX-MUX'),
(94, 174, '174', 'TCP', 'MAILQ'),
(95, 175, '175', 'TCP', 'VMNET'),
(96, 176, '176', 'TCP', 'GENRAD-MUX'),
(97, 177, '177', 'TCP', 'XDMCP (X Display Manager Control Protocol)'),
(98, 178, '178', 'TCP', 'NEXTSTEP (NextStep Window Server)'),
(99, 179, '179', 'TCP', 'BGP (Border Gateway Protocol)'),
(100, 18, '18', 'TCP', 'MSP (Message Send Protocol)[en]'),
(101, 180, '180', 'TCP', 'RIS (Intergraph)'),
(102, 181, '181', 'TCP', 'UNIFY'),
(103, 182, '182', 'TCP', 'AUDIT (Unisys Audit SITP)'),
(104, 183, '183', 'TCP', 'OCBINDER'),
(105, 184, '184', 'TCP', 'OCSERVER'),
(106, 185, '185', 'TCP', 'REMOTE-KIS'),
(107, 186, '186', 'TCP', 'KIS'),
(108, 187, '187', 'TCP', 'ACI (Application Communication Interface)'),
(109, 188, '188', 'TCP', 'MUMPS'),
(110, 189, '189', 'TCP', 'QFT (Queued File Transport)'),
(111, 19, '19', 'TCP', 'CHARGEN (Character Generator)'),
(112, 190, '190', 'TCP', 'GACP (Gateway Access Control Protocol)'),
(113, 191, '191', 'TCP', 'PROSPERO (Prospero Directory Service)'),
(114, 192, '192', 'TCP', 'OSU-NMS (OSU Network Monitoring System)'),
(115, 193, '193', 'TCP', 'SRMP (Spider Remote Monitoring Protocol)'),
(116, 194, '194', 'TCP', 'IRC (Internet Relay Chat)'),
(117, 195, '195', 'TCP', 'DN6-NLM-AUD (DNSIX Network Level Module Audit)'),
(118, 196, '196', 'TCP', 'DN6-SMM-RED (DNSIX Session Mgt Module Audit Redir)'),
(119, 197, '197', 'TCP', 'DLS (Directory Location Service)'),
(120, 198, '198', 'TCP', 'DLS-MON (Directory Location Service Monitor)'),
(121, 199, '199', 'TCP', 'SMUX (SNMP Unix Multiplexer)'),
(122, 2, '2', 'TCP', 'COMPRESSNET, процесс управления'),
(123, 20, '20', 'TCP', 'FTP-DATA — для передачи данных FTP'),
(124, 200, '200', 'TCP', 'SRC (IBM System Resource Controller)'),
(125, 201, '201', 'TCP', 'AT-RTMP (AppleTalk Routing Maintenance)'),
(126, 202, '202', 'TCP', 'AT-NBP (AppleTalk Name Binding)'),
(127, 203, '203', 'TCP', 'AT-3 (AppleTalk Unused)'),
(128, 204, '204', 'TCP', 'AT-ECHO (AppleTalk Echo)'),
(129, 205, '205', 'TCP', 'AT-5 (AppleTalk Unused)'),
(130, 206, '206', 'TCP', 'AT-ZIS (AppleTalk Zone Information)'),
(131, 207, '207', 'TCP', 'AT-7 (AppleTalk Unused)'),
(132, 208, '208', 'TCP', 'AT-8 (AppleTalk Unused)'),
(133, 209, '209', 'TCP', 'QMTP (The Quick Mail Transfer Protocol)'),
(134, 21, 'FTP (TCP 21)', 'TCP', 'FTP — для передачи команд FTP'),
(135, 210, '210', 'TCP', 'Z39-50 (ANSI Z39.50)'),
(136, 211, '211', 'TCP', '914C-G (Texas Instruments 914C/G Terminal)'),
(137, 212, '212', 'TCP', 'ANET (ATEXSSTR)'),
(138, 213, '213', 'TCP', 'IPX'),
(139, 214, '214', 'TCP', 'VMPWSCS'),
(140, 215, '215', 'TCP', 'SOFTPC (Insignia Solutions)'),
(141, 216, '216', 'TCP', 'CALLIC (Computer Associates Int\'l License Server)'),
(142, 217, '217', 'TCP', 'DBASE (dBASE Unix)'),
(143, 218, '218', 'TCP', 'MPP (Message Posting Protocol)'),
(144, 219, '219', 'TCP', 'UARPS (Unisys ARPs)'),
(145, 22, 'SSH (TCP 22)', 'TCP', 'SSH (Secure SHell) — криптографический сетевой протокол для безопасной передачи данных'),
(146, 220, 'IMAP (TCP-220)', 'TCP', 'IMAP3 (Interactive Mail Access Protocol, version 3)'),
(147, 221, '221', 'TCP', 'FLN-SPX (Berkeley rlogind with SPX auth)'),
(148, 222, '222', 'TCP', 'RSH-SPX (Berkeley rshd with SPX auth)'),
(149, 223, '223', 'TCP', 'CDC (Certificate Distribution Center)'),
(150, 224, '224', 'TCP', 'MASQDIALER'),
(151, 23, '23', 'TCP', 'Telnet — применяется для передачи текстовых сообщений в незашифрованном виде'),
(152, 24, '24', 'TCP', 'PRIV-MAIL — для использования в любых частных системах пересылки почтовых сообщений'),
(153, 242, '242', 'TCP', 'DIRECT'),
(154, 243, '243', 'TCP', 'SUR-MEAS (Survey Measurement)'),
(155, 244, '244', 'TCP', 'INBUSINESS'),
(156, 245, '245', 'TCP', 'LINK'),
(157, 246, '246', 'TCP', 'DSP3270 (Display Systems Protocol)'),
(158, 247, '247', 'TCP', 'SUBNTBCST-TFTP'),
(159, 248, '248', 'TCP', 'BHFHS'),
(160, 249, '249', 'TCP', 'резерв'),
(161, 25, 'SMTP', 'TCP', 'SMTP (Simple Mail Transfer Protocol) — применяется для пересылки почтовых сообщений в виде незашифрованного текста'),
(162, 250, '250', 'TCP', 'резерв'),
(163, 251, '251', 'TCP', 'резерв'),
(164, 252, '252', 'TCP', 'резерв'),
(165, 253, '253', 'TCP', 'резерв'),
(166, 254, '254', 'TCP', 'резерв'),
(167, 255, '255', 'TCP', 'резерв'),
(168, 256, '256', 'TCP', 'RAP'),
(169, 257, '257', 'TCP', 'SET (Secure Electronic Transaction)'),
(170, 259, '259', 'TCP', 'ESRO-GEN (Efficient Short Remote Operations)'),
(171, 260, '260', 'TCP', 'OPENPORT'),
(172, 261, '261', 'TCP', 'NSIIOPS (IIOP Name Service over TLS/SSL)'),
(173, 262, '262', 'TCP', 'ARCISDMS'),
(174, 263, '263', 'TCP', 'HDAP'),
(175, 264, '264', 'TCP', 'BGMP (Border Gateway Multicast Protocol[en])'),
(176, 265, '265', 'TCP', 'X-BONE-CTL'),
(177, 266, '266', 'TCP', 'SST (SCSI on ST)'),
(178, 267, '267', 'TCP', 'TD-SERVICE (Tobit David Service Layer)'),
(179, 268, '268', 'TCP', 'TD-REPLICA (Tobit David Replica)'),
(180, 269, '269', 'TCP', 'MANET'),
(181, 27, '27', 'TCP', 'NSW-FE (NSW User System FE)'),
(182, 270, '270', 'TCP', 'резерв'),
(183, 271, '271', 'TCP', 'PT-TLS (IETF Network Endpoint Assessment/NEA Posture Transport Protocol over TLS)'),
(184, 280, '280', 'TCP', 'HTTP-MGMT'),
(185, 281, '281', 'TCP', 'PERSONAL-LINK'),
(186, 282, '282', 'TCP', 'CABLEPORT-AX (Cable Port A/X)'),
(187, 283, '283', 'TCP', 'RESCAP'),
(188, 284, '284', 'TCP', 'CORERJD'),
(189, 286, '286', 'TCP', 'FXP (FXP Communication)'),
(190, 287, '287', 'TCP', 'K-BLOCK'),
(191, 29, '29', 'TCP', 'MSG-ICP'),
(192, 3, '3', 'TCP', 'COMPRESSNET, процесс сжатия'),
(193, 308, '308', 'TCP', 'NOVASTORBAKCUP (Novastor Backup)'),
(194, 309, '309', 'TCP', 'ENTRUSTTIME'),
(195, 31, '31', 'TCP', 'MSG-AUTH'),
(196, 310, '310', 'TCP', 'BHMDS'),
(197, 311, '311', 'TCP', 'ASIP-WEBADMIN (AppleShare IP WebAdmin), используется в Mac OS X Server'),
(198, 312, '312', 'TCP', 'VSLMP'),
(199, 313, '313', 'TCP', 'MAGENTA-LOGIC'),
(200, 314, '314', 'TCP', 'OPALIS-ROBOT'),
(201, 315, '315', 'TCP', 'DPSI'),
(202, 316, '316', 'TCP', 'DECAUTH'),
(203, 317, '317', 'TCP', 'ZANNET'),
(204, 318, '318', 'TCP', 'PKIX-TIMESTAMP (PKIX Time Stamp Protocol)'),
(205, 319, '319', 'TCP', 'PTP-EVENT'),
(206, 320, '320', 'TCP', 'PTP-GENERAL'),
(207, 321, '321', 'TCP', 'PIP'),
(208, 322, '322', 'TCP', 'RTSPS'),
(209, 323, '323', 'TCP', 'RPKI-RTR (Resource PKI to Router Protocol)'),
(210, 324, '324', 'TCP', 'RPKI-RTR-TLS (Resource PKI to Router Protocol over TLS)'),
(211, 33, '33', 'TCP', 'DSP (Display Support Protocol)'),
(212, 333, '333', 'TCP', 'TEXAR (Texar Security Port)'),
(213, 344, '344', 'TCP', 'PDAP (Prospero Data Access Protocol)'),
(214, 345, '345', 'TCP', 'PAWSERV (Perf Analysis Workbench)'),
(215, 346, '346', 'TCP', 'ZSERV (Zebra server)'),
(216, 347, '347', 'TCP', 'FATSERV (Fatmen Server)'),
(217, 348, '348', 'TCP', 'CSI-SGWP (Cabletron Management Protocol)'),
(218, 349, '349', 'TCP', 'MFTP'),
(219, 35, '35', 'TCP', 'PRIV-PRINT — для использования любыми частными серверами печати'),
(220, 350, '350', 'TCP', 'MATIP-TYPE-A (Mapping of Airline Traffic over Internet Protocol, Type A)'),
(221, 351, '351', 'TCP', 'MATIP-TYPE-B (Mapping of Airline Traffic over Internet Protocol, Type B)'),
(222, 352, '352', 'TCP', 'DTAG-STE-SB'),
(223, 353, '353', 'TCP', 'NDSAUTH'),
(224, 354, '354', 'TCP', 'BH611'),
(225, 355, '355', 'TCP', 'DATEX-ASN'),
(226, 356, '356', 'TCP', 'CLOANTO-NET-1'),
(227, 357, '357', 'TCP', 'BHEVENT'),
(228, 358, '358', 'TCP', 'SHRINKWRAP'),
(229, 359, '359', 'TCP', 'NSRMP (Network Security Risk Management Protocol)'),
(230, 360, '360', 'TCP', 'SCOI2ODIALOG'),
(231, 361, '361', 'TCP', 'SEMANTIX'),
(232, 362, '362', 'TCP', 'SRSSEND'),
(233, 363, '363', 'TCP', 'RSVP-TUNNEL'),
(234, 364, '364', 'TCP', 'AURORA-CMGR'),
(235, 365, '365', 'TCP', 'DTK'),
(236, 366, '366', 'TCP', 'ODMR (On-Demand Mail Relay)'),
(237, 367, '367', 'TCP', 'MORTGAGEWARE'),
(238, 368, '368', 'TCP', 'QBIKGDP'),
(239, 369, '369', 'TCP', 'RPC2PORTMAP'),
(240, 37, '37', 'TCP', 'TIME[en] — используется для синхронизации времени (устар.)'),
(241, 370, '370', 'TCP', 'CODAAUTH2'),
(242, 371, '371', 'TCP', 'CLEARCASE'),
(243, 372, '372', 'TCP', 'ULISTPROC (ListProcessor)'),
(244, 373, '373', 'TCP', 'LEGENT-1 (Legent Corporation)'),
(245, 374, '374', 'TCP', 'LEGENT-2 (Legent Corporation)'),
(246, 375, '375', 'TCP', 'HASSLE'),
(247, 376, '376', 'TCP', 'NIP (Amiga Envoy Network Inquiry Proto)'),
(248, 377, '377', 'TCP', 'TNETOS (NEC Corporation)'),
(249, 378, '378', 'TCP', 'DSETOS (NEC Corporation)'),
(250, 379, '379', 'TCP', 'IS99C (TIA/EIA/IS-99 modem client)'),
(251, 38, '38', 'TCP', 'RAP (Route Access Protocol)'),
(252, 380, '380', 'TCP', 'IS99S (TIA/EIA/IS-99 modem server)'),
(253, 381, '381', 'TCP', 'HP-COLLECTOR (Hewlett-Packard performance data collector)'),
(254, 382, '382', 'TCP', 'HP-MANAGED-NODE (Hewlett-Packard performance data managed node)'),
(255, 383, '383', 'TCP', 'HP-ALARM-MGR (Hewlett-Packard data alarm manager)'),
(256, 384, '384', 'TCP', 'ARNS (A Remote Network Server System)'),
(257, 385, '385', 'TCP', 'IBM-APP (IBM Application)'),
(258, 386, '386', 'TCP', 'ASA (ASA Message Router Object Def.)'),
(259, 387, '387', 'TCP', 'AURP (AppleTalk Update-based Routing Protocol)'),
(260, 388, '388', 'TCP', 'UNIDATA-LDM'),
(261, 389, '389', 'TCP', 'LDAP (Lightweight Directory Access Protocol)'),
(262, 39, '39', 'TCP', 'RLP (Resource Location Protocol)[1], протокол поиска ресурсов — служит для нахождения серверов, предоставляющих услуги верхнего уровня'),
(263, 390, '390', 'TCP', 'UIS'),
(264, 391, '391', 'TCP', 'SYNOTICS-RELAY (SynOptics SNMP Relay Port)'),
(265, 392, '392', 'TCP', 'SYNOTICS-BROKER (SynOptics Port Broker Port)'),
(266, 393, '393', 'TCP', 'META5'),
(267, 394, '394', 'TCP', 'EMBL-NDT (EMBL Nucleic Data Transfer)'),
(268, 395, '395', 'TCP', 'NETCP (NetScout Control Protocol)'),
(269, 396, '396', 'TCP', 'NETWARE-IP (Novell Netware over IP)'),
(270, 397, '397', 'TCP', 'MPTN (Multi Protocol Trans. Net.)'),
(271, 398, '398', 'TCP', 'KRYPTOLAN'),
(272, 399, '399', 'TCP', 'ISO-TSAP-C2 (ISO Transport Class 2 Non-Control over TCP)'),
(273, 400, '400', 'TCP', 'OSB-SD (Oracle Secure Backup)'),
(274, 401, '401', 'TCP', 'UPS (Uninterruptible Power Supply)'),
(275, 402, '402', 'TCP', 'GENIE'),
(276, 403, '403', 'TCP', 'DECAP'),
(277, 404, '404', 'TCP', 'NCED'),
(278, 405, '405', 'TCP', 'NCLD'),
(279, 406, '406', 'TCP', 'IMCP (Interactive Mail Support Protocol)'),
(280, 407, '407', 'TCP', 'TIMBUKTU'),
(281, 408, '408', 'TCP', 'PRM-SM (Prospero Resource Manager — System Management)'),
(282, 409, '409', 'TCP', 'PRM-NM (Prospero Resource Manager — Node Management)'),
(283, 41, '41', 'TCP', 'Graphics — используется графическими модулями некоторых браузерных программ'),
(284, 410, '410', 'TCP', 'DECLADEBUG (DECLadebug Remote Debug Protocol)'),
(285, 411, '411', 'TCP', 'RMT (Remote MT Protocol)'),
(286, 412, '412', 'TCP', 'SYNOPTICS-TRAP (Trap Convention Port)'),
(287, 413, '413', 'TCP', 'SMSP (Storage Management Services Protocol)'),
(288, 414, '414', 'TCP', 'INFOSEEK'),
(289, 415, '415', 'TCP', 'BNET'),
(290, 416, '416', 'TCP', 'SILVERPLATTER'),
(291, 417, '417', 'TCP', 'ONMUX'),
(292, 418, '418', 'TCP', 'HYPER-G'),
(293, 419, '419', 'TCP', 'ARIEL1'),
(294, 42, '42', 'TCP', 'NAME, NAMESERVER — ARPA Host Name Server Protocol[en], протокол сервера имён ARPA (устар.)'),
(295, 420, '420', 'TCP', 'SMPTE'),
(296, 421, '421', 'TCP', 'ARIEL2'),
(297, 422, '422', 'TCP', 'ARIEL3'),
(298, 423, '423', 'TCP', 'OPC-JOB-START (IBM Operations Planning and Control Start)'),
(299, 424, '424', 'TCP', 'OPC-JOB-TRACK (IBM Operations Planning and Control Track)'),
(300, 425, '425', 'TCP', 'ICAD'),
(301, 426, '426', 'TCP', 'SMARTDSP'),
(302, 427, '427', 'TCP', 'SVRLOC (SLP, Service Location Protocol)'),
(303, 428, '428', 'TCP', 'OCS-CMU'),
(304, 429, '429', 'TCP', 'OCS-AMU'),
(305, 43, '43', 'TCP', 'WHOIS'),
(306, 430, '430', 'TCP', 'UTMPSD'),
(307, 431, '431', 'TCP', 'UTMPCD'),
(308, 432, '432', 'TCP', 'IASD'),
(309, 433, '433', 'TCP', 'NNSP'),
(310, 434, '434', 'TCP', 'MOBILEIP-AGENT'),
(311, 435, '435', 'TCP', 'MOBILIP-MN'),
(312, 436, '436', 'TCP', 'DNA-CML'),
(313, 437, '437', 'TCP', 'COMSCM'),
(314, 438, '438', 'TCP', 'DSFGW'),
(315, 439, '439', 'TCP', 'DASP'),
(316, 44, '44', 'TCP', 'MPM-FLAGS (Message Processing Module, Flags)'),
(317, 440, '440', 'TCP', 'SGCP'),
(318, 441, '441', 'TCP', 'DECVMS-SYSMGT'),
(319, 442, '442', 'TCP', 'CVC-HOSTD'),
(320, 443, '443', 'TCP', 'HTTPS (HyperText Transfer Protocol Secure) — HTTP с шифрованием по SSL или TLS'),
(321, 444, '444', 'TCP', 'SNPP (Simple Network Paging Protocol[en])[10]'),
(322, 445, '445', 'TCP', 'MICROSOFT-DS — используется в Microsoft Windows 2000 и поздних версий для прямого TCP/IP-доступа без использования NetBIOS(например, в Active Directory)'),
(323, 446, '446', 'TCP', 'DDM-RDB (DDM-Remote Relational Database Access)'),
(324, 447, '447', 'TCP', 'DDM-DFM (DDM-Distributed File Management)'),
(325, 448, '448', 'TCP', 'DDM-SSL (DDM-Remote DB Access Using Secure Sockets)'),
(326, 449, '449', 'TCP', 'AS-SERVERMAP (AS Server Mapper)'),
(327, 45, '45', 'TCP', 'MPM (Message Processing Module, receive)'),
(328, 450, '450', 'TCP', 'TSERVER (Computer Supported Telecomunication Applications)'),
(329, 451, '451', 'TCP', 'SFS-SMP-NET (Cray Network Semaphore server)'),
(330, 452, '452', 'TCP', 'SFS-CONFIG (Cray SFS config server)'),
(331, 453, '453', 'TCP', 'CREATIVESERVER'),
(332, 454, '454', 'TCP', 'CONTENTSERVER'),
(333, 455, '455', 'TCP', 'CREATIVEPARTNR'),
(334, 456, '456', 'TCP', 'MACON-TCP'),
(335, 457, '457', 'TCP', 'SCOHELP'),
(336, 458, '458', 'TCP', 'APPLEQTC (Apple QuickTime Conferencing)'),
(337, 459, '459', 'TCP', 'AMPR-RCMD'),
(338, 46, '46', 'TCP', 'MPM-SND (Message Processing Module, send)'),
(339, 460, '460', 'TCP', 'SKRONK'),
(340, 461, '461', 'TCP', 'DATASURFSRV'),
(341, 462, '462', 'TCP', 'DATASURFSRVSEC'),
(342, 463, '463', 'TCP', 'ALPES'),
(343, 464, '464', 'TCP', 'KPASSWD (Kerberos Change/Set password)'),
(344, 465, '465', 'TCP', 'URD (URL Rendezvous Directory), для Cisco Source Specific Multicast (SSM)'),
(345, 465, '465', 'TCP', 'SMTPS (Simple Mail Transfer Protocol Secure) — SMTP с шифрованием по SSL или TLS'),
(346, 466, '466', 'TCP', 'DIGITAL-VRC'),
(347, 467, '467', 'TCP', 'MYLEX-MAPD'),
(348, 468, '468', 'TCP', 'PHOTURIS'),
(349, 469, '469', 'TCP', 'RCP (Radio Control Protocol)'),
(350, 47, '47', 'TCP', 'NI-FTP'),
(351, 470, '470', 'TCP', 'SCX-PROXY'),
(352, 471, '471', 'TCP', 'MONDEX'),
(353, 472, '472', 'TCP', 'LJK-LOGIN'),
(354, 473, '473', 'TCP', 'HYBRID-POP'),
(355, 474, '474', 'TCP', 'TN-TL-W1'),
(356, 475, '475', 'TCP', 'TCPNETHASPSRV (HASP services, TCP/IP version)'),
(357, 476, '476', 'TCP', 'TN-TL-FD1'),
(358, 477, '477', 'TCP', 'SS7NS'),
(359, 478, '478', 'TCP', 'SPSC'),
(360, 479, '479', 'TCP', 'IAFDBASE'),
(361, 48, '48', 'TCP', 'AUDITD (Digital Audit Daemon)'),
(362, 480, '480', 'TCP', 'IAFDBASE'),
(363, 481, '481', 'TCP', 'PH (Ph service)'),
(364, 482, '482', 'TCP', 'BGS-NSI'),
(365, 483, '483', 'TCP', 'ULPNET'),
(366, 484, '484', 'TCP', 'INTEGRA-SME'),
(367, 485, '485', 'TCP', 'POWERBURST'),
(368, 486, '486', 'TCP', 'AVIAN'),
(369, 487, '487', 'TCP', 'SAFT (Simple Asynchronous File Transfer)'),
(370, 488, '488', 'TCP', 'GSS-HTTP'),
(371, 489, '489', 'TCP', 'NEST-PROTOCOL'),
(372, 49, '49', 'TCP', 'TACACS Login Host protocol'),
(373, 490, '490', 'TCP', 'MICOM-PFS'),
(374, 491, '491', 'TCP', 'GO-LOGIN'),
(375, 492, '492', 'TCP', 'TICF-1 (Transport Independent Convergence for FNA)'),
(376, 493, '493', 'TCP', 'TICF-2 (Transport Independent Convergence for FNA)'),
(377, 494, '494', 'TCP', 'POV-RAY'),
(378, 495, '495', 'TCP', 'INTECOURIER'),
(379, 496, '496', 'TCP', 'PIM-RP-DISC'),
(380, 497, '497', 'TCP', 'RETROSPECT — для службы архивации и восстановления Retrospect'),
(381, 498, '498', 'TCP', 'SIAM'),
(382, 499, '499', 'TCP', 'ISO-ILL'),
(383, 5, '5', 'TCP', 'RJE (Remote Job Entry) — обслуживает отправку файлов и вывод отчётов при работе рабочей станции с мейнфреймами'),
(384, 50, '50', 'TCP', 'RE-MAIL-CK'),
(385, 500, '500', 'TCP', 'ISAKMP (Internet Security Association and Key Management Protocol[en])'),
(386, 501, '501', 'TCP', 'STMF'),
(387, 502, '502', 'TCP', 'ASA-APPL-PROTO'),
(388, 503, '503', 'TCP', 'INTRINSA'),
(389, 504, '504', 'TCP', 'CITADEL'),
(390, 505, '505', 'TCP', 'MAILBOX-LM'),
(391, 506, '506', 'TCP', 'OHIMSRV'),
(392, 507, '507', 'TCP', 'CRS'),
(393, 508, '508', 'TCP', 'XVTTP'),
(394, 509, '509', 'TCP', 'SNARE'),
(395, 51, '51', 'TCP', 'резерв; ранее — LA-MAINT (IMP Logical Address Maintenance)'),
(396, 510, '510', 'TCP', 'FCP (FirstClass Protocol)'),
(397, 511, '511', 'TCP', 'PASSGO'),
(398, 512, '512', 'TCP', 'EXEC (Remote Process Execution)'),
(399, 513, '513', 'TCP', 'LOGIN — удаленный вход наподобие Telnet; автоматическая проверка подлинности выполняется на основе номеров привилегированных портов и распределённых баз данных, которые идентифицируют «домены аутентификации»'),
(400, 514, '514', 'TCP', 'SHELL — для выполнения команд на удалённой системе; используется в аналогах командной строки с автоматической аутентификацией (например, rsh[en], rcp[en])'),
(401, 515, '515', 'TCP', 'PRINTER — для служб печати, ожидающих входящие соединения (например, Line Printer Daemon)'),
(402, 516, '516', 'TCP', 'VIDEOTEX'),
(403, 517, '517', 'TCP', 'TALK'),
(404, 518, '518', 'TCP', 'NTALK'),
(405, 519, '519', 'TCP', 'UTIME'),
(406, 52, '52', 'TCP', 'XNS-TIME (Xerox Network Services Time Protocol)'),
(407, 520, '520', 'TCP', 'EFS (Extended Filename Server)'),
(408, 521, '521', 'TCP', 'RPING'),
(409, 522, '522', 'TCP', 'ULP'),
(410, 523, '523', 'TCP', 'IBM-DB2'),
(411, 524, '524', 'TCP', 'NCP (NetWare Core Protocol) — используется, например, для доступа к ресурсам главного сервера NetWare, синхронизации времени и т. д.'),
(412, 525, '525', 'TCP', 'TIMED'),
(413, 526, '526', 'TCP', 'TEMPO'),
(414, 527, '527', 'TCP', 'STX (Stock IXChange)'),
(415, 528, '528', 'TCP', 'CUSTIX (Customer IXChange)'),
(416, 529, '529', 'TCP', 'IRC-SERV'),
(417, 53, '53', 'TCP', 'DOMAIN (Domain Name System)'),
(418, 530, '530', 'TCP', 'COURIER (RPC)'),
(419, 531, '531', 'TCP', 'CONFERENCE'),
(420, 532, '532', 'TCP', 'NETNEWS'),
(421, 533, '533', 'TCP', 'NETWALL'),
(422, 534, '534', 'TCP', 'WINDREAM'),
(423, 535, '535', 'TCP', 'IIOP'),
(424, 536, '536', 'TCP', 'OPALIS-RDV'),
(425, 537, '537', 'TCP', 'NMSP (Networked Media Streaming Protocol)'),
(426, 538, '538', 'TCP', 'GDOMAP'),
(427, 539, '539', 'TCP', 'APERTUS-LDP (Apertus Technologies Load Determination)'),
(428, 54, '54', 'TCP', 'XNS-CH (Xerox Network Services ClearingHouse)'),
(429, 540, '540', 'TCP', 'UUCP (Unix-to-Unix Copy Protocol)'),
(430, 541, '541', 'TCP', 'UUCP-RLOGIN (Unix-to-Unix Copy Protocol Remote Login)'),
(431, 542, '542', 'TCP', 'COMMERCE'),
(432, 543, '543', 'TCP', 'KLOGIN (Kerberos login)'),
(433, 544, '544', 'TCP', 'KSHELL (Kerberos remote shell)'),
(434, 545, '545', 'TCP', 'APPLEQTCSRVR'),
(435, 546, '546', 'TCP', 'DHCPV6-CLIENT'),
(436, 547, '547', 'TCP', 'DHCPV6-SERVER'),
(437, 548, '548', 'TCP', 'AFPOVERTCP (Apple Filing Protocol over TCP)'),
(438, 549, '549', 'TCP', 'IDFP'),
(439, 55, '55', 'TCP', 'ISI-GL (ISI Graphics Language)[2]'),
(440, 550, '550', 'TCP', 'NEW-RWHO'),
(441, 551, '551', 'TCP', 'CYBERCASH (CyberCash Credit Card Protocol)[12]'),
(442, 552, '552', 'TCP', 'DEVSHR-NTS'),
(443, 553, '553', 'TCP', 'PIRP'),
(444, 554, '554', 'TCP', 'RTSP (Real Time Streaming Protocol)'),
(445, 555, '555', 'TCP', 'DSF'),
(446, 556, '556', 'TCP', 'REMOTEFS (Remote File Sharing[en] Server)'),
(447, 557, '557', 'TCP', 'OPENVMS-SYSIPC'),
(448, 558, '558', 'TCP', 'SDNSKMP'),
(449, 559, '559', 'TCP', 'TEEDTAP'),
(450, 56, '56', 'TCP', 'XNS-AUTH (Xerox Network Services Authentication)'),
(451, 560, '560', 'TCP', 'RMONITOR'),
(452, 561, '561', 'TCP', 'MONITOR'),
(453, 562, '562', 'TCP', 'CHSHELL'),
(454, 563, '563', 'TCP', 'NNTPS (Network News Transfer Protocol Secure) — NNTP с шифрованием по SSL или TLS'),
(455, 564, '564', 'TCP', '9PFS (Plan 9 File Service)'),
(456, 565, '565', 'TCP', 'WHOAMI'),
(457, 566, '566', 'TCP', 'STREETTALK'),
(458, 567, '567', 'TCP', 'BANYAN-RPC'),
(459, 568, '568', 'TCP', 'MS-SHUTTLE'),
(460, 569, '569', 'TCP', 'MS-ROME'),
(461, 57, '57', 'TCP', 'PRIV-TERM — для любых служб, обеспечивающих терминальный доступ; ранее — MTP (Mail Transfer Protocol[en])'),
(462, 570, '570', 'TCP', 'METER'),
(463, 571, '571', 'TCP', 'UMETER'),
(464, 572, '572', 'TCP', 'SONAR'),
(465, 573, '573', 'TCP', 'BANYAN-VIP'),
(466, 574, '574', 'TCP', 'FTP-AGENT (FTP Software Agent System)'),
(467, 575, '575', 'TCP', 'VEMMI'),
(468, 576, '576', 'TCP', 'IPCD'),
(469, 577, '577', 'TCP', 'VNAS'),
(470, 578, '578', 'TCP', 'IPDD'),
(471, 579, '579', 'TCP', 'DECBSRV'),
(472, 58, '58', 'TCP', 'XNS-MAIL (Xerox Network Services Mail)'),
(473, 580, '580', 'TCP', 'SNTP-HEARTBEAT'),
(474, 581, '581', 'TCP', 'BDP (Bundle Discovery Protocol)'),
(475, 582, '582', 'TCP', 'SCC-SECURITY'),
(476, 583, '583', 'TCP', 'PHILIPS-VC (Philips Video-Conferencing)'),
(477, 584, '584', 'TCP', 'KEYSERVER'),
(478, 585, '585', 'TCP', 'свободно; ранее — IMAP4-SSL (см. порт 993)'),
(479, 586, '586', 'TCP', 'PASSWORD-CHG (Password Change)'),
(480, 587, '587', 'TCP', 'SUBMISSION (Message Submission for Mail[13]) — используется (SMTP)'),
(481, 588, '588', 'TCP', 'CAL'),
(482, 589, '589', 'TCP', 'EYELINK'),
(483, 59, '59', 'TCP', 'PRIV-FILE — для любых служб обработки файлов'),
(484, 590, '590', 'TCP', 'TNS-CML'),
(485, 591, '591', 'TCP', 'HTTP-ALT (HTTP Alternate, см. порт 80) — используется программой FileMaker начиная с версии 6.0'),
(486, 592, '592', 'TCP', 'EUDORA-SET'),
(487, 593, '593', 'TCP', 'HTTP-RPC-EPMAP (RPC посредством HTTP) — используется, например, службами DCOM и Microsoft Exchange Server'),
(488, 594, '594', 'TCP', 'TPIP'),
(489, 595, '595', 'TCP', 'CAB-PROTOCOL'),
(490, 596, '596', 'TCP', 'SMSD'),
(491, 597, '597', 'TCP', 'PTCNAMESERVICE (PTC Name Service)'),
(492, 598, '598', 'TCP', 'SCO-WEBSRVRMG3 (SCO Web Server Manager 3)'),
(493, 599, '599', 'TCP', 'ACP (Aeolon Core Protocol)'),
(494, 600, '600', 'TCP', 'IPCSERVER (Sun IPC server)'),
(495, 601, '601', 'TCP', 'SYSLOG-CONN — используется Reliable Syslog Service (служба надёжной доставки сообщений о происходящих в системе событиях с использованием XML-схем протокола BEEP[en])[14]'),
(496, 602, '602', 'TCP', 'XMLRPC-BEEP (XML-RPC посредством BEEP[en])[15]'),
(497, 603, '603', 'TCP', 'IDXP (Intrusion Detection Exchange Protocol)[16]'),
(498, 604, '604', 'TCP', 'TUNNEL — используется для туннелирования протокола BEEP[en] на прикладном уровне[17]'),
(499, 605, '605', 'TCP', 'SOAP-BEEP — используется для передачи сообщений SOAP посредством протокола BEEP[en][18]'),
(500, 606, '606', 'TCP', 'URM (Cray Unified Resource Manager)'),
(501, 607, '607', 'TCP', 'NQS'),
(502, 608, '608', 'TCP', 'SIFT-UFT (Sender-Initiated/Unsolicited File Transfer)'),
(503, 609, '609', 'TCP', 'NPMP-TRAP'),
(504, 61, '61', 'TCP', 'NI-MAIL'),
(505, 610, '610', 'TCP', 'NPMP-LOCAL'),
(506, 611, '611', 'TCP', 'NPMP-GUI'),
(507, 612, '612', 'TCP', 'HMMP-IND (HMMP Indication)'),
(508, 613, '613', 'TCP', 'HMMP-OP (HMMP Operation)'),
(509, 614, '614', 'TCP', 'SSHELL (SSL shell)'),
(510, 615, '615', 'TCP', 'SCO-INETMGR (SCO Internet Configuration Manager)'),
(511, 616, '616', 'TCP', 'SCO-SYSMGR (SCO System Administration Server)'),
(512, 617, '617', 'TCP', 'SCO-DTMGR (SCO Desktop Administration Server)'),
(513, 618, '618', 'TCP', 'DEI-ICDA'),
(514, 619, '619', 'TCP', 'COMPAQ-EVM'),
(515, 62, '62', 'TCP', 'ACAS (ACA Services)'),
(516, 620, '620', 'TCP', 'SCO-WEBSRVRMGR (SCO WebServer Manager)'),
(517, 621, '621', 'TCP', 'ESCP-IP'),
(518, 622, '622', 'TCP', 'COLLABORATOR'),
(519, 623, '623', 'TCP', 'OOB-WS-HTTP (DMTF out-of-band web services management protocol)'),
(520, 624, '624', 'TCP', 'CRYPTOADMIN'),
(521, 625, '625', 'TCP', 'DEC-DLM'),
(522, 626, '626', 'TCP', 'ASIA'),
(523, 627, '627', 'TCP', 'PASSGO-TIVOLI'),
(524, 628, '628', 'TCP', 'QMQP'),
(525, 629, '629', 'TCP', '3COM-AMP3'),
(526, 63, '63', 'TCP', 'WHOISPP'),
(527, 630, '630', 'TCP', 'RDA'),
(528, 631, '631', 'TCP', 'IPP (Internet Printing Protocol)'),
(529, 632, '632', 'TCP', 'BMPP'),
(530, 633, '633', 'TCP', 'SERVSTAT (Service Status update) — для Sterling Software'),
(531, 634, '634', 'TCP', 'GINAD'),
(532, 635, '635', 'TCP', 'RLZDBASE'),
(533, 636, '636', 'TCP', 'LDAPS (Lightweight Directory Access Protocol Secure) — LDAP с шифрованием по SSL или TLS'),
(534, 637, '637', 'TCP', 'LANSERVER'),
(535, 638, '638', 'TCP', 'MCNS-SEC'),
(536, 639, '639', 'TCP', 'MSDP (Multicast Source Discovery Protocol[en])'),
(537, 64, '64', 'TCP', 'COVIA'),
(538, 640, '640', 'TCP', 'ENTRUST-SPS'),
(539, 641, '641', 'TCP', 'REPCMD'),
(540, 642, '642', 'TCP', 'ESRO-EMSDP (v1.3)'),
(541, 643, '643', 'TCP', 'SANITY'),
(542, 644, '644', 'TCP', 'DWR'),
(543, 645, '645', 'TCP', 'PSSC'),
(544, 646, '646', 'TCP', 'LDP (Label Distribution Protocol) — используется для маршрутизации в сетях MPLS'),
(545, 647, '647', 'TCP', 'DHCP-FAILOVER (DHCP Failover)[19]'),
(546, 648, '648', 'TCP', 'RRP (Registry Registrar Protocol)[20]'),
(547, 649, '649', 'TCP', 'CADVIEW-3D'),
(548, 65, '65', 'TCP', 'TACACS-DS (TACACS Database Service)'),
(549, 650, '650', 'TCP', 'OBEX'),
(550, 651, '651', 'TCP', 'IEEE-MMS'),
(551, 652, '652', 'TCP', 'HELLO-PORT'),
(552, 653, '653', 'TCP', 'REPSCMD'),
(553, 654, '654', 'TCP', 'AODV (Ad-hoc On-demand Distance Vector)'),
(554, 655, '655', 'TCP', 'TINC'),
(555, 656, '656', 'TCP', 'SPMP'),
(556, 657, '657', 'TCP', 'RMC (Remote monitoring and Control) — используется в системах IBM (AIX Integrated Virtualization Manager[21], Hardware Management Console[en]) для динамической конфигурации управляемых логических разделов'),
(557, 658, '658', 'TCP', 'TENFOLD'),
(558, 66, '66', 'TCP', 'SQL-NET'),
(559, 660, '660', 'TCP', 'MAC-SRVR-ADMIN (Mac OS X Server administration)'),
(560, 661, '661', 'TCP', 'HAP'),
(561, 662, '662', 'TCP', 'PFTP'),
(562, 663, '663', 'TCP', 'PURENOISE'),
(563, 664, '664', 'TCP', 'OOB-WS-HTTPS (DMTF out-of-band secure web services management protocol)'),
(564, 665, '665', 'TCP', 'SUN-DR (SUN Remote Dynamic Reconfiguration)'),
(565, 666, '666', 'TCP', 'MDQS;'),
(566, 667, '667', 'TCP', 'DISCLOSE (campaign contribution disclosures, SDR Technologies)'),
(567, 668, '668', 'TCP', 'MECOMM'),
(568, 669, '669', 'TCP', 'MEREGISTER'),
(569, 67, '67', 'TCP', 'BOOTPS (Bootstrap Protocol Server) — для сервера, с которого выполняется загрузка бездисковых рабочих станций; также используется DHCP (Dynamic Host Configuration Protocol)'),
(570, 670, '670', 'TCP', 'VACDSM-SWS'),
(571, 671, '671', 'TCP', 'VACDSM-APP'),
(572, 672, '672', 'TCP', 'VPPS-QUA'),
(573, 673, '673', 'TCP', 'CIMPLEX'),
(574, 674, '674', 'TCP', 'ACAP (Application Configuration Access Protocol)'),
(575, 675, '675', 'TCP', 'DCTP'),
(576, 676, '676', 'TCP', 'VPPS-VIA'),
(577, 677, '677', 'TCP', 'VPP (Virtual Presence Protocol)'),
(578, 678, '678', 'TCP', 'GGF-NCP (GNU Generation Foundation NCP)'),
(579, 679, '679', 'TCP', 'MRM'),
(580, 68, '68', 'TCP', 'BOOTPC (Bootstrap Protocol Client) — для клиентов бездисковых рабочих станций, загружающихся с сервера BOOTP; также используется DHCP (Dynamic Host Configuration Protocol)'),
(581, 680, '680', 'TCP', 'ENTRUST-AAAS'),
(582, 681, '681', 'TCP', 'ENTRUST-AAMS'),
(583, 682, '682', 'TCP', 'XFR'),
(584, 683, '683', 'TCP', 'CORBA-IIOP'),
(585, 684, '684', 'TCP', 'CORBA-IIOP-SSL'),
(586, 685, '685', 'TCP', 'MDC-PortMapper'),
(587, 686, '686', 'TCP', 'HCP-Wismar (Hardware Control Protocol Wismar)'),
(588, 687, '687', 'TCP', 'ASIPREGISTRY'),
(589, 688, '688', 'TCP', 'REALM-RUSD (ApplianceWare managment protocol)'),
(590, 689, '689', 'TCP', 'NMAP'),
(591, 69, '69', 'TCP', 'TFTP (Trivial File Transfer Protocol) — тривиальный FTP применяется, например, при установке операционной системы на большое количество компьютеров в сетях предприятий. Для этого сервер TFTP и поддержка удалённого развёртывания (UAM) включены в состав сер'),
(592, 690, '690', 'TCP', 'VATP (Velazquez Application Transfer Protocol)'),
(593, 691, '691', 'TCP', 'MSEXCH-ROUTING (Microsoft Exchange Server Routing)'),
(594, 692, '692', 'TCP', 'Hyperwave-ISP'),
(595, 693, '693', 'TCP', 'CONNENDP (almanid Connection Endpoint)'),
(596, 694, '694', 'TCP', 'HA-CLUSTER (Linux High Availability Cluster heartbeat)'),
(597, 695, '695', 'TCP', 'IEEE-MMS-SSL (IEEE Media Management System over SSL)[22]'),
(598, 696, '696', 'TCP', 'RUSHD'),
(599, 697, '697', 'TCP', 'UUIDGEN'),
(600, 698, '698', 'TCP', 'OLSR (Optimized Link-State Routing)'),
(601, 699, '699', 'TCP', 'ACCESSNETWORK'),
(602, 7, '7', 'TCP', 'ECHO — предназначен для тестирования связи путём отправки данных на сервер и получения от него их же в неизменном виде'),
(603, 70, '70', 'TCP', 'Gopher'),
(604, 700, '700', 'TCP', 'EPP (Extensible Provisioning Protocol)[23] — используется для управления регистрационной информацией DNS'),
(605, 701, '701', 'TCP', 'LMP (Link Management Protocol)[24]'),
(606, 702, '702', 'TCP', 'IRIS-BEEP (IRIS over BEEP)[25] — используется для передачи сообщений IRIS (Internet Registry Information Service)[26][27] посредством протокола BEEP[en]'),
(607, 703, '703', 'TCP', 'свободен'),
(608, 704, '704', 'TCP', 'ELCSD (errlog copy/server daemon)'),
(609, 705, '705', 'TCP', 'AGENTX'),
(610, 706, '706', 'TCP', 'SILC (Secure Internet Live Conferencing) — для организации безопасных аудио- и видеоконференций'),
(611, 707, '707', 'TCP', 'BORLAND-DSJ'),
(612, 708, '708', 'TCP', 'свободен'),
(613, 709, '709', 'TCP', 'ENTRUST-KMSH'),
(614, 71, '71', 'TCP', 'NETRJS-1 (Remote job entry[en] Service)'),
(615, 710, '710', 'TCP', 'ENTRUST-ASH'),
(616, 711, '711', 'TCP', 'CISCO-TDP (Cisco Tag Distribution Protocol)[28][29]'),
(617, 712, '712', 'TCP', 'TBRPF (Topology Broadcast based on Reverse-Path Forwarding routing protocol[en])[30]'),
(618, 713, '713', 'TCP', 'IRIS-XPC (IRIS over XPC)'),
(619, 713, '713', 'TCP', 'IRIS-XPCS (IRIS over XPCS)'),
(620, 715, '715', 'TCP', 'IRIS-LWZ'),
(621, 72, '72', 'TCP', 'NETRJS-2 (Remote job entry[en] Service)'),
(622, 729, '729', 'TCP', 'NETVIEWDM1 (IBM NetView DM/6000 Server/Client)'),
(623, 73, '73', 'TCP', 'NETRJS-3 (Remote job entry[en] Service)'),
(624, 730, '730', 'TCP', 'NETVIEWDM2 (IBM NetView DM/6000 send/tcp)'),
(625, 731, '731', 'TCP', 'NETVIEWDM3 (IBM NetView DM/6000 receive/tcp)'),
(626, 732, '732', 'TCP', 'свободны'),
(627, 733, '733', 'TCP', 'свободны'),
(628, 734, '734', 'TCP', 'свободны'),
(629, 735, '735', 'TCP', 'свободны'),
(630, 736, '736', 'TCP', 'свободны'),
(631, 737, '737', 'TCP', 'свободны'),
(632, 738, '738', 'TCP', 'свободны'),
(633, 739, '739', 'TCP', 'свободны'),
(634, 740, '740', 'TCP', 'свободны'),
(635, 74, '74', 'TCP', 'NETRJS-4 (Remote job entry[en] Service)'),
(636, 741, '741', 'TCP', 'NETGW'),
(637, 742, '742', 'TCP', 'NETRCS'),
(638, 743, '743', 'TCP', 'свободен'),
(639, 744, '744', 'TCP', 'FLEXLM (Flexible License Manager)'),
(640, 745, '745', 'TCP', 'свободен'),
(641, 746, '746', 'TCP', 'свободен'),
(642, 747, '747', 'TCP', 'FUJITSU-DEV (Fujitsu Device Control)'),
(643, 748, '748', 'TCP', 'RIS-CM (Russell Info Sci Calendar Manager)'),
(644, 749, '749', 'TCP', 'KERBEROS-ADM (Kerberos administration)'),
(645, 75, '75', 'TCP', 'PRIV-DIAL — для любых приложений телефонного дозвона'),
(646, 750, '750', 'TCP', 'RFILE'),
(647, 750, '750', 'TCP', 'свободен'),
(648, 751, '751', 'TCP', 'PUMP'),
(649, 751, '751', 'TCP', 'kerberos_master (Kerberos authentication)'),
(650, 752, '752', 'TCP', 'QRH'),
(651, 753, '753', 'TCP', 'RRH (Reverse Routing Header)[31]'),
(652, 754, '754', 'TCP', 'krb5_prop (Kerberos v5 slave propagation)'),
(653, 754, '754', 'TCP', 'TELL'),
(654, 755, '755', 'TCP', 'свободен'),
(655, 756, '756', 'TCP', 'свободен'),
(656, 757, '757', 'TCP', 'свободен'),
(657, 758, '758', 'TCP', 'NLOGIN'),
(658, 759, '759', 'TCP', 'CON'),
(659, 76, '76', 'TCP', 'DEOS (Distributed External Object Store)'),
(660, 760, '760', 'TCP', 'NS'),
(661, 760, '760', 'TCP', 'krbupdate, kreg (Kerberos registration)'),
(662, 761, '761', 'TCP', 'RXE'),
(663, 762, '762', 'TCP', 'QUOTAD'),
(664, 763, '763', 'TCP', 'CYCLESERV'),
(665, 764, '764', 'TCP', 'OMSERV'),
(666, 765, '765', 'TCP', 'WEBSTER'),
(667, 766, '766', 'TCP', 'свободен'),
(668, 767, '767', 'TCP', 'PHONEBOOK'),
(669, 768, '768', 'TCP', 'свободен'),
(670, 769, '769', 'TCP', 'VID'),
(671, 77, '77', 'TCP', 'PRIV-RJE — для использования в любых службах Remote Job Entry[en]'),
(672, 770, '770', 'TCP', 'CADLOCK'),
(673, 771, '771', 'TCP', 'RTIP'),
(674, 772, '772', 'TCP', 'CYCLESERV2'),
(675, 773, '773', 'TCP', 'SUBMIT'),
(676, 774, '774', 'TCP', 'RPASSWD'),
(677, 775, '775', 'TCP', 'ENTOMB'),
(678, 776, '776', 'TCP', 'WPAGES'),
(679, 777, '777', 'TCP', 'Multiling-HTTP'),
(680, 778, '778', 'TCP', 'свободен'),
(681, 779, '779', 'TCP', 'свободен'),
(682, 78, '78', 'TCP', 'VETTCP'),
(683, 780, '780', 'TCP', 'WPGS'),
(684, 782, '782', 'TCP', 'используется Conserver'),
(685, 783, '783', 'TCP', 'используется SpamAssassin'),
(686, 79, '79', 'TCP', 'Finger'),
(687, 80, 'HTTP(80)', 'TCP', 'HTTP (HyperText Transfer Protocol); ранее — WWW'),
(688, 800, '800', 'TCP', 'MDBS-DAEMON'),
(689, 801, '801', 'TCP', 'DEVICE'),
(690, 81, '81', 'TCP', 'HTTP (HyperText Transfer Protocol)'),
(691, 81, '81', 'TCP', 'используется в приложениях проекта Tor для целей маршрутизации'),
(692, 81, '81', 'TCP', 'HOSTS2-NS (HOSTS2 Name Server)'),
(693, 810, '810', 'TCP', 'FCP'),
(694, 82, '82', 'TCP', 'XFER'),
(695, 828, '828', 'TCP', 'ITM-MCELL-S'),
(696, 829, '829', 'TCP', 'CMP (Certificate Management Protocol[en])'),
(697, 829, '829', 'TCP', 'PKIX-3-CA-RA'),
(698, 83, '83', 'TCP', 'MIT-ML-DEV (MIT ML Device)'),
(699, 830, '830', 'TCP', 'NETCONF-SSH (NETCONF over SSH)[32] — NETCONF через SSH'),
(700, 831, '831', 'TCP', 'NETCONF-BEEP (NETCONF over BEEP)[33] — NETCONF через BEEP[en]'),
(701, 832, '832', 'TCP', 'NETCONFSOAPHTTP (NETCONF for SOAP over HTTPS)[34] — NETCONF через SOAP и SSH'),
(702, 833, '833', 'TCP', 'NETCONFSOAPBEEP (NETCONF for SOAP over BEEP)[34] — NETCONF через SOAP и BEEP[en]'),
(703, 834, '834', 'TCP', 'свободны'),
(704, 835, '835', 'TCP', 'свободны'),
(705, 836, '836', 'TCP', 'свободны'),
(706, 837, '837', 'TCP', 'свободны'),
(707, 838, '838', 'TCP', 'свободны'),
(708, 839, '839', 'TCP', 'свободны'),
(709, 840, '840', 'TCP', 'свободны'),
(710, 841, '841', 'TCP', 'свободны'),
(711, 842, '842', 'TCP', 'свободны'),
(712, 843, '843', 'TCP', 'свободны'),
(713, 844, '844', 'TCP', 'свободны'),
(714, 845, '845', 'TCP', 'свободны'),
(715, 846, '846', 'TCP', 'свободны'),
(716, 84, '84', 'TCP', 'CTF (Common Trace Facility)'),
(717, 847, '847', 'TCP', 'DHCP-FAILOVER2 (DHCP Failover)[19]'),
(718, 848, '848', 'TCP', 'GDOI (Group Domain of Interpretation)[35]'),
(719, 849, '849', 'TCP', 'свободны'),
(720, 850, '850', 'TCP', 'свободны'),
(721, 851, '851', 'TCP', 'свободны'),
(722, 852, '852', 'TCP', 'свободны'),
(723, 853, '853', 'TCP', 'свободны'),
(724, 854, '854', 'TCP', 'свободны'),
(725, 855, '855', 'TCP', 'свободны'),
(726, 856, '856', 'TCP', 'свободны'),
(727, 857, '857', 'TCP', 'свободны'),
(728, 858, '858', 'TCP', 'свободны'),
(729, 859, '859', 'TCP', 'свободны'),
(730, 85, '85', 'TCP', 'MIT-ML-DEV (MIT ML Device)'),
(731, 86, '86', 'TCP', 'MFCOBOL (Micro Focus Cobol)'),
(732, 860, '860', 'TCP', 'ISCSI (Internet Small Computer Systems Interface)[36][37]'),
(733, 861, '861', 'TCP', 'OWAMP-CONTROL (One-way Active Measurement Protocol Control)[38]'),
(734, 862, '862', 'TCP', 'TWAMP-CONTROL (Two-way Active Measurement Protocol Control)[39]'),
(735, 863, '863', 'TCP', 'свободны'),
(736, 864, '864', 'TCP', 'свободны'),
(737, 865, '865', 'TCP', 'свободны'),
(738, 866, '866', 'TCP', 'свободны'),
(739, 867, '867', 'TCP', 'свободны'),
(740, 868, '868', 'TCP', 'свободны'),
(741, 869, '869', 'TCP', 'свободны'),
(742, 870, '870', 'TCP', 'свободны'),
(743, 871, '871', 'TCP', 'свободны'),
(744, 872, '872', 'TCP', 'свободны'),
(745, 87, '87', 'TCP', 'PRIV-TERM-L — для любых приложений, обеспечивающих терминальное соединение типа «текстовый чат» (например, аналогичных talk)'),
(746, 873, '873', 'TCP', 'RSYNC (Remote Synchronization) — используется rsync'),
(747, 874, '874', 'TCP', 'свободны'),
(748, 875, '875', 'TCP', 'свободны'),
(749, 876, '876', 'TCP', 'свободны'),
(750, 877, '877', 'TCP', 'свободны'),
(751, 878, '878', 'TCP', 'свободны'),
(752, 879, '879', 'TCP', 'свободны'),
(753, 880, '880', 'TCP', 'свободны'),
(754, 881, '881', 'TCP', 'свободны'),
(755, 882, '882', 'TCP', 'свободны'),
(756, 883, '883', 'TCP', 'свободны'),
(757, 884, '884', 'TCP', 'свободны'),
(758, 885, '885', 'TCP', 'свободны'),
(759, 88, '88', 'TCP', 'Система аутентификации Kerberos'),
(760, 886, '886', 'TCP', 'ICLCNET-LOCATE (ICL coNETion locate server)'),
(761, 887, '887', 'TCP', 'ICLCNET-SVINFO (ICL coNETion server info)'),
(762, 888, '888', 'TCP', 'CDDBP (CDDB Protocol)'),
(763, 888, '888', 'TCP', 'ACCESSBUILDER'),
(764, 89, '89', 'TCP', 'SU-MIT-TG (SU/MIT Telnet Gateway)'),
(765, 897, '897', 'TCP', 'Brocade SMI-S RPC'),
(766, 898, '898', 'TCP', 'Brocade SMI-S RPC с шифрованием по SSL'),
(767, 9, '9', 'TCP', 'DISCARD — предназначен для тестирования связи путём отправки данных на сервер, который отбрасывает принятое, не отправляя никакого ответа'),
(768, 90, '90', 'TCP', 'DNSIX (DoD Network Security for Information eXchange) Securit Attribute Token Map'),
(769, 900, '900', 'TCP', 'OMGINITIALREFS'),
(770, 901, '901', 'TCP', 'SMPNAMERES'),
(771, 902, '902', 'TCP', 'IDEAFARM-DOOR'),
(772, 903, '903', 'TCP', 'IDEAFARM-PANIC'),
(773, 91, '91', 'TCP', 'MIT-DOV (MIT Dover Spooler)'),
(774, 910, '910', 'TCP', 'KINK (Kerberized Internet Negotiation of Keys)[42]'),
(775, 911, '911', 'TCP', 'использовался Network Console on Acid (NCA) для локального перенаправления с использованием OpenSSH'),
(776, 911, '911', 'TCP', 'XACT-BACKUP'),
(777, 912, '912', 'TCP', 'APEX-MESH (Application Exchange relay to relay service)[43]'),
(778, 913, '913', 'TCP', 'APEX-EDGE (Application Exchange endpoint to relay service)[43]'),
(779, 92, '92', 'TCP', 'NPP (Network Printing Protocol)'),
(780, 93, '93', 'TCP', 'DCP (Device Control Protocol)'),
(781, 94, '94', 'TCP', 'OBJCALL'),
(782, 95, '95', 'TCP', 'SUPDUP'),
(783, 96, '96', 'TCP', 'DIXIE'),
(784, 97, '97', 'TCP', 'SWIFT-RVF (Swift Remote Virtural File Protocol)'),
(785, 98, '98', 'TCP', 'TACNEWS'),
(786, 989, '989', 'TCP', 'FTPS-DATA (FTP-данные с шифрованием по SSL или TLS)'),
(787, 99, '99', 'TCP', 'METAGRAM'),
(788, 990, '990', 'TCP', 'FTPS (FTP-команды с шифрованием по SSL или TLS)'),
(789, 991, '991', 'TCP', 'NAS (Netnews Administration System)[44]'),
(790, 992, '992', 'TCP', 'TELNETS (Telnet с шифрованием по SSL или TLS)'),
(791, 993, 'IMAPS (TCP-993)', 'TCP', 'IMAPS (Internet Message Access Protocol с шифрованием по SSL или TLS)'),
(792, 994, '994', 'TCP', 'резерв; ранее — IRCS (IRC с шифрованием по SSL или TLS)'),
(793, 995, '995', 'TCP', 'POP3S (POP3 с шифрованием по SSL или TLS)'),
(794, 996, '996', 'TCP', 'VSINET'),
(795, 997, '997', 'TCP', 'MAITRD'),
(796, 998, '998', 'TCP', 'BUSBOY'),
(797, 999, '999', 'TCP', 'GARCON'),
(798, 999, '999', 'TCP', 'PUPROUTER'),
(799, 0, '0', 'UDP', 'резерв (допустимо использование в качестве значения порта источника, если отправляющий процесс не ожидает ответных сообщений)'),
(800, 1, '1', 'UDP', 'TCPMUX (TCP Port Service Multiplexer) — для обслуживания нескольких служб через один TCP-порт'),
(801, 1000, '1000', 'UDP', 'CADLOCK2'),
(802, 101, '101', 'UDP', 'HOSTNAME (NIC[en] Host Name Server)'),
(803, 1010, '1010', 'UDP', 'SURF'),
(804, 1011, '1011', 'UDP', 'резерв'),
(805, 1012, '1012', 'UDP', 'резерв'),
(806, 1013, '1013', 'UDP', 'резерв'),
(807, 1014, '1014', 'UDP', 'резерв'),
(808, 1015, '1015', 'UDP', 'резерв'),
(809, 1016, '1016', 'UDP', 'резерв'),
(810, 1017, '1017', 'UDP', 'резерв'),
(811, 1018, '1018', 'UDP', 'резерв'),
(812, 1019, '1019', 'UDP', 'резерв'),
(813, 1020, '1020', 'UDP', 'резерв'),
(814, 102, '102', 'UDP', 'ISO-TSAP (Transport Service Access Point[en] Class 0)[4]'),
(815, 1021, '1021', 'UDP', 'EXP1 (Experiment 1 по RFC3692)[45][46]'),
(816, 1022, '1022', 'UDP', 'EXP2 (Experiment 2 по RFC3692)[45]'),
(817, 1023, '1023', 'UDP', 'резерв'),
(818, 103, '103', 'UDP', 'GPPITNP (Genesis Point-to-Point Trans Net)'),
(819, 104, '104', 'UDP', 'ACR-NEMA (ACR/NEMA DICOM)'),
(820, 105, '105', 'UDP', 'CSO, CSNET-NS (CCSO[en]/Mailbox Name Nameserver)'),
(821, 106, '106', 'UDP', '3COM-TSMUX'),
(822, 107, '107', 'UDP', 'RTELNET (Remote Telnet Service[5])'),
(823, 108, '108', 'UDP', 'SNAGAS (SNA Gateway Access Server)'),
(824, 109, '109', 'UDP', 'POP2 (Post Office Protocol Version 2)'),
(825, 11, '11', 'UDP', 'SYSTAT — выдаёт список активных пользователей в операционной системе'),
(826, 110, '110', 'UDP', 'POP3 (Post Office Protocol Version 3)'),
(827, 111, '111', 'UDP', 'SUNRPC (Sun Remote Procedure Call)'),
(828, 112, '112', 'UDP', 'MCIDAS (McIDAS Data Transmission)'),
(829, 113, '113', 'UDP', 'AUTH (Authentication Service)'),
(830, 115, '115', 'UDP', 'SFTP (Simple File Transfer Protocol[en])'),
(831, 116, '116', 'UDP', 'ANSANOTIFY (ANSA REX Notify)'),
(832, 117, '117', 'UDP', 'UUCP-PATH (UUCP Path Service)'),
(833, 118, '118', 'UDP', 'SQLSERV (SQL Services)'),
(834, 119, '119', 'UDP', 'NNTP (Network News Transfer Protocol) — используется для отправки сообщений новостных рассылок'),
(835, 120, '120', 'UDP', 'CFDPTKT'),
(836, 121, '121', 'UDP', 'ERPC (Encore Expedited Remote Protocol Call)'),
(837, 122, '122', 'UDP', 'SMAKYNET'),
(838, 123, '123', 'UDP', 'NTP (Network Time Protocol) — используется для синхронизации времени'),
(839, 124, '124', 'UDP', 'ANSATRADER (ANSA REX Trader)'),
(840, 125, '125', 'UDP', 'LOCUS-MAP (Locus PC-Interface Net Map Ser)'),
(841, 126, '126', 'UDP', 'NXEdit; ранее — Unisys Unitary Login'),
(842, 127, '127', 'UDP', 'LOCUS-CON (Locus PC-Interface Conn Server)'),
(843, 128, '128', 'UDP', 'GSS-XLICEN (GSS X License Verification)'),
(844, 129, '129', 'UDP', 'PWDGEN (Password Generator Protocol)'),
(845, 13, '13', 'UDP', 'DAYTIME — предназначен для тестирования связи путём получения от сервера текущих даты и времени в текстовом виде'),
(846, 130, '130', 'UDP', 'CISCO-FNA (Cisco FNATIVE)'),
(847, 131, '131', 'UDP', 'CISCO-TNA (Cisco TNATIVE)'),
(848, 132, '132', 'UDP', 'CISCO-SYS (Cisco SYSMAINT)'),
(849, 133, '133', 'UDP', 'STATSRV (Statistics Service)'),
(850, 134, '134', 'UDP', 'INGRES-NET'),
(851, 135, '135', 'UDP', 'EPMAP (DCE[en] Endpoint Mapper)'),
(852, 136, '136', 'UDP', 'PROFILE Naming System'),
(853, 137, '137', 'UDP', 'NETBIOS-NS (NetBIOS Name Service)'),
(854, 138, '138', 'UDP', 'NETBIOS-DGM (NetBIOS Datagram Service)'),
(855, 139, '139', 'UDP', 'NETBIOS-SSN (NetBIOS Session Service)'),
(856, 140, '140', 'UDP', 'EMFIS-DATA (EMFIS Data Service)'),
(857, 141, '141', 'UDP', 'EMFIS-CNTL (EMFIS Control Service)'),
(858, 142, '142', 'UDP', 'BL-IDM (Britton-Lee IDM)'),
(859, 143, 'IMAP (UDP-143)', 'UDP', 'IMAP (Internet Message Access Protocol) — используется для получения и синхронизации сообщений электронной почты'),
(860, 144, '144', 'UDP', 'UMA (Universal Management Architecture)'),
(861, 145, '145', 'UDP', 'UAAC'),
(862, 146, '146', 'UDP', 'ISO-TP0'),
(863, 147, '147', 'UDP', 'ISO-IP'),
(864, 148, '148', 'UDP', 'JARGON'),
(865, 149, '149', 'UDP', 'AED-512'),
(866, 150, '150', 'UDP', 'SQL-NET'),
(867, 151, '151', 'UDP', 'HEMS'),
(868, 152, '152', 'UDP', 'BFTP (Background File Transfer Program)[7]'),
(869, 153, '153', 'UDP', 'SGMP (Simple Gateway Monitoring Protocol[en])'),
(870, 154, '154', 'UDP', 'NETSC-PROD'),
(871, 155, '155', 'UDP', 'NETSC-DEV'),
(872, 156, '156', 'UDP', 'SQLSRV (SQL Service)'),
(873, 157, '157', 'UDP', 'KNET-CMP'),
(874, 158, '158', 'UDP', 'PCMAIL-SRV'),
(875, 159, '159', 'UDP', 'NSS-ROUTING'),
(876, 160, '160', 'UDP', 'SGMP-TRAPS'),
(877, 161, '161', 'UDP', 'SNMP (Simple Network Management Protocol) — используется как порт прослушивания агентами удалённого мониторинга'),
(878, 162, '162', 'UDP', 'SNMPTRAP (Simple Network Management Protocol Trap)[8] — используется как порт приёма асинхронных прерываний (traps)'),
(879, 163, '163', 'UDP', 'CMIP-MAN (CMIP/TCP Manager)'),
(880, 164, '164', 'UDP', 'CMIP-AGENT (CMIP/TCP Agent)'),
(881, 165, '165', 'UDP', 'XNS-COURIER (Xerox Network Services)'),
(882, 166, '166', 'UDP', 'S-NET (Sirius Systems Network)'),
(883, 167, '167', 'UDP', 'NAMP'),
(884, 168, '168', 'UDP', 'RSVD'),
(885, 169, '169', 'UDP', 'SEND'),
(886, 17, '17', 'UDP', 'QOTD (Quote of the Day)'),
(887, 170, '170', 'UDP', 'PRINT-SRV (Network PostScript)'),
(888, 171, '171', 'UDP', 'MULTIPLEX (Network Innovations Multiplex)'),
(889, 172, '172', 'UDP', 'CL-1 (Network Innovations CL/1); ранее — CL/1'),
(890, 173, '173', 'UDP', 'XYPLEX-MUX'),
(891, 174, '174', 'UDP', 'MAILQ'),
(892, 175, '175', 'UDP', 'VMNET'),
(893, 176, '176', 'UDP', 'GENRAD-MUX'),
(894, 177, '177', 'UDP', 'XDMCP (X Display Manager Control Protocol)'),
(895, 178, '178', 'UDP', 'NEXTSTEP (NextStep Window Server)'),
(896, 179, '179', 'UDP', 'BGP (Border Gateway Protocol)'),
(897, 18, '18', 'UDP', 'MSP (Message Send Protocol)[en]'),
(898, 180, '180', 'UDP', 'RIS (Intergraph)'),
(899, 181, '181', 'UDP', 'UNIFY'),
(900, 182, '182', 'UDP', 'AUDIT (Unisys Audit SITP)'),
(901, 183, '183', 'UDP', 'OCBINDER'),
(902, 184, '184', 'UDP', 'OCSERVER'),
(903, 185, '185', 'UDP', 'REMOTE-KIS'),
(904, 186, '186', 'UDP', 'KIS'),
(905, 187, '187', 'UDP', 'ACI (Application Communication Interface)'),
(906, 188, '188', 'UDP', 'MUMPS'),
(907, 189, '189', 'UDP', 'QFT (Queued File Transport)'),
(908, 19, '19', 'UDP', 'CHARGEN (Character Generator)'),
(909, 190, '190', 'UDP', 'GACP (Gateway Access Control Protocol)'),
(910, 191, '191', 'UDP', 'PROSPERO (Prospero Directory Service)'),
(911, 192, '192', 'UDP', 'OSU-NMS (OSU Network Monitoring System)'),
(912, 193, '193', 'UDP', 'SRMP (Spider Remote Monitoring Protocol)'),
(913, 194, '194', 'UDP', 'IRC (Internet Relay Chat)'),
(914, 195, '195', 'UDP', 'DN6-NLM-AUD (DNSIX Network Level Module Audit)'),
(915, 196, '196', 'UDP', 'DN6-SMM-RED (DNSIX Session Mgt Module Audit Redir)'),
(916, 197, '197', 'UDP', 'DLS (Directory Location Service)'),
(917, 198, '198', 'UDP', 'DLS-MON (Directory Location Service Monitor)');
INSERT INTO `ports` (`port_id`, `portnum`, `portname`, `type`, `content`) VALUES
(918, 199, '199', 'UDP', 'SMUX (SNMP Unix Multiplexer)'),
(919, 2, '2', 'UDP', 'COMPRESSNET, процесс управления'),
(920, 200, '200', 'UDP', 'SRC (IBM System Resource Controller)'),
(921, 201, '201', 'UDP', 'AT-RTMP (AppleTalk Routing Maintenance)'),
(922, 202, '202', 'UDP', 'AT-NBP (AppleTalk Name Binding)'),
(923, 203, '203', 'UDP', 'AT-3 (AppleTalk Unused)'),
(924, 204, '204', 'UDP', 'AT-ECHO (AppleTalk Echo)'),
(925, 205, '205', 'UDP', 'AT-5 (AppleTalk Unused)'),
(926, 206, '206', 'UDP', 'AT-ZIS (AppleTalk Zone Information)'),
(927, 207, '207', 'UDP', 'AT-7 (AppleTalk Unused)'),
(928, 208, '208', 'UDP', 'AT-8 (AppleTalk Unused)'),
(929, 209, '209', 'UDP', 'QMTP (The Quick Mail Transfer Protocol)'),
(930, 210, '210', 'UDP', 'Z39-50 (ANSI Z39.50)'),
(931, 211, '211', 'UDP', '914C-G (Texas Instruments 914C/G Terminal)'),
(932, 212, '212', 'UDP', 'ANET (ATEXSSTR)'),
(933, 213, '213', 'UDP', 'IPX'),
(934, 214, '214', 'UDP', 'VMPWSCS'),
(935, 215, '215', 'UDP', 'SOFTPC (Insignia Solutions)'),
(936, 216, '216', 'UDP', 'CALLIC (Computer Associates Int\'l License Server)'),
(937, 217, '217', 'UDP', 'DBASE (dBASE Unix)'),
(938, 218, '218', 'UDP', 'MPP (Message Posting Protocol)'),
(939, 219, '219', 'UDP', 'UARPS (Unisys ARPs)'),
(940, 22, 'SSH (UDP 22)', 'UDP', 'SSH (Secure SHell) — криптографический сетевой протокол для безопасной передачи данных'),
(941, 220, 'IMAP (UDP-220)', 'UDP', 'IMAP3 (Interactive Mail Access Protocol, version 3)'),
(942, 221, '221', 'UDP', 'FLN-SPX (Berkeley rlogind with SPX auth)'),
(943, 222, '222', 'UDP', 'RSH-SPX (Berkeley rshd with SPX auth)'),
(944, 223, '223', 'UDP', 'CDC (Certificate Distribution Center)'),
(945, 224, '224', 'UDP', 'MASQDIALER'),
(946, 23, '23', 'UDP', 'Telnet — применяется для передачи текстовых сообщений в незашифрованном виде'),
(947, 24, '24', 'UDP', 'PRIV-MAIL — для использования в любых частных системах пересылки почтовых сообщений'),
(948, 242, '242', 'UDP', 'DIRECT'),
(949, 243, '243', 'UDP', 'SUR-MEAS (Survey Measurement)'),
(950, 244, '244', 'UDP', 'INBUSINESS'),
(951, 245, '245', 'UDP', 'LINK'),
(952, 246, '246', 'UDP', 'DSP3270 (Display Systems Protocol)'),
(953, 247, '247', 'UDP', 'SUBNTBCST-TFTP'),
(954, 248, '248', 'UDP', 'BHFHS'),
(955, 249, '249', 'UDP', 'резерв'),
(956, 25, 'SMTP', 'UDP', 'SMTP (Simple Mail Transfer Protocol) — применяется для пересылки почтовых сообщений в виде незашифрованного текста'),
(957, 250, '250', 'UDP', 'резерв'),
(958, 251, '251', 'UDP', 'резерв'),
(959, 252, '252', 'UDP', 'резерв'),
(960, 253, '253', 'UDP', 'резерв'),
(961, 254, '254', 'UDP', 'резерв'),
(962, 255, '255', 'UDP', 'резерв'),
(963, 256, '256', 'UDP', 'RAP'),
(964, 257, '257', 'UDP', 'SET (Secure Electronic Transaction)'),
(965, 259, '259', 'UDP', 'ESRO-GEN (Efficient Short Remote Operations)'),
(966, 260, '260', 'UDP', 'OPENPORT'),
(967, 261, '261', 'UDP', 'NSIIOPS (IIOP Name Service over TLS/SSL)'),
(968, 262, '262', 'UDP', 'ARCISDMS'),
(969, 263, '263', 'UDP', 'HDAP'),
(970, 264, '264', 'UDP', 'BGMP (Border Gateway Multicast Protocol[en])'),
(971, 265, '265', 'UDP', 'X-BONE-CTL'),
(972, 266, '266', 'UDP', 'SST (SCSI on ST)'),
(973, 267, '267', 'UDP', 'TD-SERVICE (Tobit David Service Layer)'),
(974, 268, '268', 'UDP', 'TD-REPLICA (Tobit David Replica)'),
(975, 269, '269', 'UDP', 'MANET'),
(976, 27, '27', 'UDP', 'NSW-FE (NSW User System FE)'),
(977, 270, '270', 'UDP', 'GIST (Q-mode encapsulation for GIST messages)'),
(978, 271, '271', 'UDP', 'резерв'),
(979, 280, '280', 'UDP', 'HTTP-MGMT'),
(980, 281, '281', 'UDP', 'PERSONAL-LINK'),
(981, 282, '282', 'UDP', 'CABLEPORT-AX (Cable Port A/X)'),
(982, 283, '283', 'UDP', 'RESCAP'),
(983, 284, '284', 'UDP', 'CORERJD'),
(984, 286, '286', 'UDP', 'FXP (FXP Communication)'),
(985, 287, '287', 'UDP', 'K-BLOCK'),
(986, 29, '29', 'UDP', 'MSG-ICP'),
(987, 3, '3', 'UDP', 'COMPRESSNET, процесс сжатия'),
(988, 308, '308', 'UDP', 'NOVASTORBAKCUP (Novastor Backup)'),
(989, 309, '309', 'UDP', 'ENTRUSTTIME'),
(990, 31, '31', 'UDP', 'MSG-AUTH'),
(991, 310, '310', 'UDP', 'BHMDS'),
(992, 311, '311', 'UDP', 'ASIP-WEBADMIN (AppleShare IP WebAdmin), используется в Mac OS X Server'),
(993, 312, '312', 'UDP', 'VSLMP'),
(994, 313, '313', 'UDP', 'MAGENTA-LOGIC'),
(995, 314, '314', 'UDP', 'OPALIS-ROBOT'),
(996, 315, '315', 'UDP', 'DPSI'),
(997, 316, '316', 'UDP', 'DECAUTH'),
(998, 317, '317', 'UDP', 'ZANNET'),
(999, 318, '318', 'UDP', 'PKIX-TIMESTAMP (PKIX Time Stamp Protocol)'),
(1000, 319, '319', 'UDP', 'PTP-EVENT'),
(1001, 320, '320', 'UDP', 'PTP-GENERAL'),
(1002, 321, '321', 'UDP', 'PIP'),
(1003, 322, '322', 'UDP', 'RTSPS'),
(1004, 323, '323', 'UDP', 'резерв'),
(1005, 324, '324', 'UDP', 'резерв'),
(1006, 33, '33', 'UDP', 'DSP (Display Support Protocol)'),
(1007, 333, '333', 'UDP', 'TEXAR (Texar Security Port)'),
(1008, 344, '344', 'UDP', 'PDAP (Prospero Data Access Protocol)'),
(1009, 345, '345', 'UDP', 'PAWSERV (Perf Analysis Workbench)'),
(1010, 346, '346', 'UDP', 'ZSERV (Zebra server)'),
(1011, 347, '347', 'UDP', 'FATSERV (Fatmen Server)'),
(1012, 348, '348', 'UDP', 'CSI-SGWP (Cabletron Management Protocol)'),
(1013, 349, '349', 'UDP', 'MFTP'),
(1014, 35, '35', 'UDP', 'PRIV-PRINT — для использования любыми частными серверами печати'),
(1015, 350, '350', 'UDP', 'MATIP-TYPE-A (Mapping of Airline Traffic over Internet Protocol, Type A)'),
(1016, 351, '351', 'UDP', 'MATIP-TYPE-B (Mapping of Airline Traffic over Internet Protocol, Type B)'),
(1017, 352, '352', 'UDP', 'DTAG-STE-SB'),
(1018, 353, '353', 'UDP', 'NDSAUTH'),
(1019, 354, '354', 'UDP', 'BH611'),
(1020, 355, '355', 'UDP', 'DATEX-ASN'),
(1021, 356, '356', 'UDP', 'CLOANTO-NET-1'),
(1022, 357, '357', 'UDP', 'BHEVENT'),
(1023, 358, '358', 'UDP', 'SHRINKWRAP'),
(1024, 359, '359', 'UDP', 'NSRMP (Network Security Risk Management Protocol)'),
(1025, 360, '360', 'UDP', 'SCOI2ODIALOG'),
(1026, 361, '361', 'UDP', 'SEMANTIX'),
(1027, 362, '362', 'UDP', 'SRSSEND'),
(1028, 363, '363', 'UDP', 'RSVP-TUNNEL'),
(1029, 364, '364', 'UDP', 'AURORA-CMGR'),
(1030, 365, '365', 'UDP', 'DTK'),
(1031, 366, '366', 'UDP', 'ODMR (On-Demand Mail Relay)'),
(1032, 367, '367', 'UDP', 'MORTGAGEWARE'),
(1033, 368, '368', 'UDP', 'QBIKGDP'),
(1034, 369, '369', 'UDP', 'RPC2PORTMAP'),
(1035, 37, '37', 'UDP', 'TIME[en] — используется для синхронизации времени (устар.)'),
(1036, 370, '370', 'UDP', 'CODAAUTH2'),
(1037, 371, '371', 'UDP', 'CLEARCASE'),
(1038, 372, '372', 'UDP', 'ULISTPROC (ListProcessor)'),
(1039, 373, '373', 'UDP', 'LEGENT-1 (Legent Corporation)'),
(1040, 374, '374', 'UDP', 'LEGENT-2 (Legent Corporation)'),
(1041, 375, '375', 'UDP', 'HASSLE'),
(1042, 376, '376', 'UDP', 'NIP (Amiga Envoy Network Inquiry Proto)'),
(1043, 377, '377', 'UDP', 'TNETOS (NEC Corporation)'),
(1044, 378, '378', 'UDP', 'DSETOS (NEC Corporation)'),
(1045, 379, '379', 'UDP', 'IS99C (TIA/EIA/IS-99 modem client)'),
(1046, 38, '38', 'UDP', 'RAP (Route Access Protocol)'),
(1047, 380, '380', 'UDP', 'IS99S (TIA/EIA/IS-99 modem server)'),
(1048, 381, '381', 'UDP', 'HP-COLLECTOR (Hewlett-Packard performance data collector)'),
(1049, 382, '382', 'UDP', 'HP-MANAGED-NODE (Hewlett-Packard performance data managed node)'),
(1050, 383, '383', 'UDP', 'HP-ALARM-MGR (Hewlett-Packard data alarm manager)'),
(1051, 384, '384', 'UDP', 'ARNS (A Remote Network Server System)'),
(1052, 385, '385', 'UDP', 'IBM-APP (IBM Application)'),
(1053, 386, '386', 'UDP', 'ASA (ASA Message Router Object Def.)'),
(1054, 387, '387', 'UDP', 'AURP (AppleTalk Update-based Routing Protocol)'),
(1055, 388, '388', 'UDP', 'UNIDATA-LDM'),
(1056, 389, '389', 'UDP', 'LDAP (Lightweight Directory Access Protocol)'),
(1057, 39, '39', 'UDP', 'RLP (Resource Location Protocol)[1], протокол поиска ресурсов — служит для нахождения серверов, предоставляющих услуги верхнего уровня'),
(1058, 390, '390', 'UDP', 'UIS'),
(1059, 391, '391', 'UDP', 'SYNOTICS-RELAY (SynOptics SNMP Relay Port)'),
(1060, 392, '392', 'UDP', 'SYNOTICS-BROKER (SynOptics Port Broker Port)'),
(1061, 393, '393', 'UDP', 'META5'),
(1062, 394, '394', 'UDP', 'EMBL-NDT (EMBL Nucleic Data Transfer)'),
(1063, 395, '395', 'UDP', 'NETCP (NetScout Control Protocol)'),
(1064, 396, '396', 'UDP', 'NETWARE-IP (Novell Netware over IP)'),
(1065, 397, '397', 'UDP', 'MPTN (Multi Protocol Trans. Net.)'),
(1066, 398, '398', 'UDP', 'KRYPTOLAN'),
(1067, 399, '399', 'UDP', 'ISO-TSAP-C2 (ISO Transport Class 2 Non-Control over TCP)'),
(1068, 400, '400', 'UDP', 'OSB-SD (Oracle Secure Backup)'),
(1069, 401, '401', 'UDP', 'UPS (Uninterruptible Power Supply)'),
(1070, 402, '402', 'UDP', 'GENIE'),
(1071, 403, '403', 'UDP', 'DECAP'),
(1072, 404, '404', 'UDP', 'NCED'),
(1073, 405, '405', 'UDP', 'NCLD'),
(1074, 406, '406', 'UDP', 'IMCP (Interactive Mail Support Protocol)'),
(1075, 407, '407', 'UDP', 'TIMBUKTU'),
(1076, 408, '408', 'UDP', 'PRM-SM (Prospero Resource Manager — System Management)'),
(1077, 409, '409', 'UDP', 'PRM-NM (Prospero Resource Manager — Node Management)'),
(1078, 41, '41', 'UDP', 'Graphics — используется графическими модулями некоторых браузерных программ'),
(1079, 410, '410', 'UDP', 'DECLADEBUG (DECLadebug Remote Debug Protocol)'),
(1080, 411, '411', 'UDP', 'RMT (Remote MT Protocol)'),
(1081, 412, '412', 'UDP', 'SYNOPTICS-TRAP (Trap Convention Port)'),
(1082, 413, '413', 'UDP', 'SMSP (Storage Management Services Protocol)'),
(1083, 414, '414', 'UDP', 'INFOSEEK'),
(1084, 415, '415', 'UDP', 'BNET'),
(1085, 416, '416', 'UDP', 'SILVERPLATTER'),
(1086, 417, '417', 'UDP', 'ONMUX'),
(1087, 418, '418', 'UDP', 'HYPER-G'),
(1088, 419, '419', 'UDP', 'ARIEL1'),
(1089, 42, '42', 'UDP', 'NAME, NAMESERVER — ARPA Host Name Server Protocol[en], протокол сервера имён ARPA (устар.)'),
(1090, 420, '420', 'UDP', 'SMPTE'),
(1091, 421, '421', 'UDP', 'ARIEL2'),
(1092, 422, '422', 'UDP', 'ARIEL3'),
(1093, 423, '423', 'UDP', 'OPC-JOB-START (IBM Operations Planning and Control Start)'),
(1094, 424, '424', 'UDP', 'OPC-JOB-TRACK (IBM Operations Planning and Control Track)'),
(1095, 425, '425', 'UDP', 'ICAD'),
(1096, 426, '426', 'UDP', 'SMARTDSP'),
(1097, 427, '427', 'UDP', 'SVRLOC (SLP, Service Location Protocol)'),
(1098, 428, '428', 'UDP', 'OCS-CMU'),
(1099, 429, '429', 'UDP', 'OCS-AMU'),
(1100, 43, '43', 'UDP', 'WHOIS'),
(1101, 430, '430', 'UDP', 'UTMPSD'),
(1102, 431, '431', 'UDP', 'UTMPCD'),
(1103, 432, '432', 'UDP', 'IASD'),
(1104, 433, '433', 'UDP', 'NNSP'),
(1105, 434, '434', 'UDP', 'MOBILEIP-AGENT'),
(1106, 435, '435', 'UDP', 'MOBILIP-MN'),
(1107, 436, '436', 'UDP', 'DNA-CML'),
(1108, 437, '437', 'UDP', 'COMSCM'),
(1109, 438, '438', 'UDP', 'DSFGW'),
(1110, 439, '439', 'UDP', 'DASP'),
(1111, 44, '44', 'UDP', 'MPM-FLAGS (Message Processing Module, Flags)'),
(1112, 440, '440', 'UDP', 'SGCP'),
(1113, 441, '441', 'UDP', 'DECVMS-SYSMGT'),
(1114, 442, '442', 'UDP', 'CVC-HOSTD'),
(1115, 443, '443', 'UDP', 'HTTPS (HyperText Transfer Protocol Secure) — HTTP с шифрованием по SSL или TLS'),
(1116, 444, '444', 'UDP', 'SNPP (Simple Network Paging Protocol[en])[10]'),
(1117, 445, '445', 'UDP', 'MICROSOFT-DS — используется в Microsoft Windows 2000 и поздних версий для прямого TCP/IP-доступа без использования NetBIOS(например, в Active Directory)'),
(1118, 446, '446', 'UDP', 'DDM-RDB (DDM-Remote Relational Database Access)'),
(1119, 447, '447', 'UDP', 'DDM-DFM (DDM-Distributed File Management)'),
(1120, 448, '448', 'UDP', 'DDM-SSL (DDM-Remote DB Access Using Secure Sockets)'),
(1121, 449, '449', 'UDP', 'AS-SERVERMAP (AS Server Mapper)'),
(1122, 45, '45', 'UDP', 'MPM (Message Processing Module, receive)'),
(1123, 450, '450', 'UDP', 'TSERVER (Computer Supported Telecomunication Applications)'),
(1124, 451, '451', 'UDP', 'SFS-SMP-NET (Cray Network Semaphore server)'),
(1125, 452, '452', 'UDP', 'SFS-CONFIG (Cray SFS config server)'),
(1126, 453, '453', 'UDP', 'CREATIVESERVER'),
(1127, 454, '454', 'UDP', 'CONTENTSERVER'),
(1128, 455, '455', 'UDP', 'CREATIVEPARTNR'),
(1129, 456, '456', 'UDP', 'MACON-UDP'),
(1130, 457, '457', 'UDP', 'SCOHELP'),
(1131, 458, '458', 'UDP', 'APPLEQTC (Apple QuickTime Conferencing)'),
(1132, 459, '459', 'UDP', 'AMPR-RCMD'),
(1133, 46, '46', 'UDP', 'MPM-SND (Message Processing Module, send)'),
(1134, 460, '460', 'UDP', 'SKRONK'),
(1135, 461, '461', 'UDP', 'DATASURFSRV'),
(1136, 462, '462', 'UDP', 'DATASURFSRVSEC'),
(1137, 463, '463', 'UDP', 'ALPES'),
(1138, 464, '464', 'UDP', 'KPASSWD (Kerberos Change/Set password)'),
(1139, 465, '465', 'UDP', 'SMTPS (Simple Mail Transfer Protocol Secure) — SMTP с шифрованием по SSL или TLS'),
(1140, 465, '465', 'UDP', 'IGMPV3LITE (IGMP Version 3 Lite), для Cisco Source Specific Multicast (SSM)'),
(1141, 466, '466', 'UDP', 'DIGITAL-VRC'),
(1142, 467, '467', 'UDP', 'MYLEX-MAPD'),
(1143, 468, '468', 'UDP', 'PHOTURIS'),
(1144, 469, '469', 'UDP', 'RCP (Radio Control Protocol)'),
(1145, 47, '47', 'UDP', 'NI-FTP'),
(1146, 470, '470', 'UDP', 'SCX-PROXY'),
(1147, 471, '471', 'UDP', 'MONDEX'),
(1148, 472, '472', 'UDP', 'LJK-LOGIN'),
(1149, 473, '473', 'UDP', 'HYBRID-POP'),
(1150, 474, '474', 'UDP', 'TN-TL-W1'),
(1151, 475, '475', 'UDP', 'TCPNETHASPSRV (HASP services, TCP/IP version)'),
(1152, 476, '476', 'UDP', 'TN-TL-FD1'),
(1153, 477, '477', 'UDP', 'SS7NS'),
(1154, 478, '478', 'UDP', 'SPSC'),
(1155, 479, '479', 'UDP', 'IAFDBASE'),
(1156, 48, '48', 'UDP', 'AUDITD (Digital Audit Daemon)'),
(1157, 480, '480', 'UDP', 'IAFDBASE'),
(1158, 481, '481', 'UDP', 'PH (Ph service)'),
(1159, 482, '482', 'UDP', 'BGS-NSI'),
(1160, 483, '483', 'UDP', 'ULPNET'),
(1161, 484, '484', 'UDP', 'INTEGRA-SME'),
(1162, 485, '485', 'UDP', 'POWERBURST'),
(1163, 486, '486', 'UDP', 'AVIAN'),
(1164, 487, '487', 'UDP', 'SAFT (Simple Asynchronous File Transfer)'),
(1165, 488, '488', 'UDP', 'GSS-HTTP'),
(1166, 489, '489', 'UDP', 'NEST-PROTOCOL'),
(1167, 49, '49', 'UDP', 'TACACS Login Host protocol'),
(1168, 490, '490', 'UDP', 'MICOM-PFS'),
(1169, 491, '491', 'UDP', 'GO-LOGIN'),
(1170, 492, '492', 'UDP', 'TICF-1 (Transport Independent Convergence for FNA)'),
(1171, 493, '493', 'UDP', 'TICF-2 (Transport Independent Convergence for FNA)'),
(1172, 494, '494', 'UDP', 'POV-RAY'),
(1173, 495, '495', 'UDP', 'INTECOURIER'),
(1174, 496, '496', 'UDP', 'PIM-RP-DISC'),
(1175, 498, '498', 'UDP', 'SIAM'),
(1176, 499, '499', 'UDP', 'ISO-ILL'),
(1177, 5, '5', 'UDP', 'RJE (Remote Job Entry) — обслуживает отправку файлов и вывод отчётов при работе рабочей станции с мейнфреймами'),
(1178, 50, '50', 'UDP', 'RE-MAIL-CK'),
(1179, 500, '500', 'UDP', 'ISAKMP (Internet Security Association and Key Management Protocol[en])'),
(1180, 501, '501', 'UDP', 'STMF'),
(1181, 502, '502', 'UDP', 'ASA-APPL-PROTO'),
(1182, 503, '503', 'UDP', 'INTRINSA'),
(1183, 504, '504', 'UDP', 'CITADEL'),
(1184, 505, '505', 'UDP', 'MAILBOX-LM'),
(1185, 506, '506', 'UDP', 'OHIMSRV'),
(1186, 507, '507', 'UDP', 'CRS'),
(1187, 508, '508', 'UDP', 'XVTTP'),
(1188, 509, '509', 'UDP', 'SNARE'),
(1189, 51, '51', 'UDP', 'резерв; ранее — LA-MAINT (IMP Logical Address Maintenance)'),
(1190, 510, '510', 'UDP', 'FCP (FirstClass Protocol)'),
(1191, 511, '511', 'UDP', 'PASSGO'),
(1192, 512, '512', 'UDP', 'COMSAT (аутентификация с использованием паролей и UNIX-логинов);'),
(1193, 513, '513', 'UDP', 'WHO — поддержка базы данных открытых сеансов на машинах в локальной сети'),
(1194, 514, '514', 'UDP', 'SYSLOG — доставка сообщений о происходящих в системе событиях[11]'),
(1195, 515, '515', 'UDP', 'PRINTER — для служб печати, ожидающих входящие соединения (например, Line Printer Daemon)'),
(1196, 516, '516', 'UDP', 'VIDEOTEX'),
(1197, 517, '517', 'UDP', 'TALK'),
(1198, 518, '518', 'UDP', 'NTALK'),
(1199, 519, '519', 'UDP', 'UTIME'),
(1200, 52, '52', 'UDP', 'XNS-TIME (Xerox Network Services Time Protocol)'),
(1201, 520, '520', 'UDP', 'ROUTER — локальный процесс маршрутизации; используется разновидность протокола Xerox NS RIP'),
(1202, 521, '521', 'UDP', 'RPING'),
(1203, 522, '522', 'UDP', 'ULP'),
(1204, 523, '523', 'UDP', 'IBM-DB2'),
(1205, 524, '524', 'UDP', 'NCP (NetWare Core Protocol) — используется, например, для доступа к ресурсам главного сервера NetWare, синхронизации времени и т. д.'),
(1206, 525, '525', 'UDP', 'TIMED'),
(1207, 526, '526', 'UDP', 'TEMPO'),
(1208, 527, '527', 'UDP', 'STX (Stock IXChange)'),
(1209, 528, '528', 'UDP', 'CUSTIX (Customer IXChange)'),
(1210, 529, '529', 'UDP', 'IRC-SERV'),
(1211, 53, '53', 'UDP', 'DOMAIN (Domain Name System)'),
(1212, 530, '530', 'UDP', 'COURIER (RPC)'),
(1213, 531, '531', 'UDP', 'CONFERENCE'),
(1214, 532, '532', 'UDP', 'NETNEWS'),
(1215, 533, '533', 'UDP', 'NETWALL'),
(1216, 534, '534', 'UDP', 'WINDREAM'),
(1217, 535, '535', 'UDP', 'IIOP'),
(1218, 536, '536', 'UDP', 'OPALIS-RDV'),
(1219, 537, '537', 'UDP', 'NMSP (Networked Media Streaming Protocol)'),
(1220, 538, '538', 'UDP', 'GDOMAP'),
(1221, 539, '539', 'UDP', 'APERTUS-LDP (Apertus Technologies Load Determination)'),
(1222, 54, '54', 'UDP', 'XNS-CH (Xerox Network Services ClearingHouse)'),
(1223, 540, '540', 'UDP', 'UUCP (Unix-to-Unix Copy Protocol)'),
(1224, 541, '541', 'UDP', 'UUCP-RLOGIN (Unix-to-Unix Copy Protocol Remote Login)'),
(1225, 542, '542', 'UDP', 'COMMERCE'),
(1226, 543, '543', 'UDP', 'KLOGIN (Kerberos login)'),
(1227, 544, '544', 'UDP', 'KSHELL (Kerberos remote shell)'),
(1228, 545, '545', 'UDP', 'APPLEQTCSRVR'),
(1229, 546, '546', 'UDP', 'DHCPV6-CLIENT'),
(1230, 547, '547', 'UDP', 'DHCPV6-SERVER'),
(1231, 548, '548', 'UDP', 'AFPOVERTCP (Apple Filing Protocol over TCP)'),
(1232, 549, '549', 'UDP', 'IDFP'),
(1233, 55, '55', 'UDP', 'ISI-GL (ISI Graphics Language)[2]'),
(1234, 550, '550', 'UDP', 'NEW-RWHO'),
(1235, 551, '551', 'UDP', 'CYBERCASH (CyberCash Credit Card Protocol)[12]'),
(1236, 552, '552', 'UDP', 'DEVSHR-NTS'),
(1237, 553, '553', 'UDP', 'PIRP'),
(1238, 554, '554', 'UDP', 'RTSP (Real Time Streaming Protocol)'),
(1239, 555, '555', 'UDP', 'DSF'),
(1240, 556, '556', 'UDP', 'REMOTEFS (Remote File Sharing[en] Server)'),
(1241, 557, '557', 'UDP', 'OPENVMS-SYSIPC'),
(1242, 558, '558', 'UDP', 'SDNSKMP'),
(1243, 559, '559', 'UDP', 'TEEDTAP'),
(1244, 56, '56', 'UDP', 'XNS-AUTH (Xerox Network Services Authentication)'),
(1245, 560, '560', 'UDP', 'RMONITOR'),
(1246, 561, '561', 'UDP', 'MONITOR'),
(1247, 562, '562', 'UDP', 'CHSHELL'),
(1248, 563, '563', 'UDP', 'NNTPS (Network News Transfer Protocol Secure) — NNTP с шифрованием по SSL или TLS'),
(1249, 564, '564', 'UDP', '9PFS (Plan 9 File Service)'),
(1250, 565, '565', 'UDP', 'WHOAMI'),
(1251, 566, '566', 'UDP', 'STREETTALK'),
(1252, 567, '567', 'UDP', 'BANYAN-RPC'),
(1253, 568, '568', 'UDP', 'MS-SHUTTLE'),
(1254, 569, '569', 'UDP', 'MS-ROME'),
(1255, 57, '57', 'UDP', 'PRIV-TERM — для любых служб, обеспечивающих терминальный доступ; ранее — MTP (Mail Transfer Protocol[en])'),
(1256, 570, '570', 'UDP', 'METER'),
(1257, 571, '571', 'UDP', 'UMETER'),
(1258, 572, '572', 'UDP', 'SONAR'),
(1259, 573, '573', 'UDP', 'BANYAN-VIP'),
(1260, 574, '574', 'UDP', 'FTP-AGENT (FTP Software Agent System)'),
(1261, 575, '575', 'UDP', 'VEMMI'),
(1262, 576, '576', 'UDP', 'IPCD'),
(1263, 577, '577', 'UDP', 'VNAS'),
(1264, 578, '578', 'UDP', 'IPDD'),
(1265, 579, '579', 'UDP', 'DECBSRV'),
(1266, 58, '58', 'UDP', 'XNS-MAIL (Xerox Network Services Mail)'),
(1267, 580, '580', 'UDP', 'SNTP-HEARTBEAT'),
(1268, 581, '581', 'UDP', 'BDP (Bundle Discovery Protocol)'),
(1269, 582, '582', 'UDP', 'SCC-SECURITY'),
(1270, 583, '583', 'UDP', 'PHILIPS-VC (Philips Video-Conferencing)'),
(1271, 584, '584', 'UDP', 'KEYSERVER'),
(1272, 585, '585', 'UDP', 'свободно; ранее — IMAP4-SSL (см. порт 993)'),
(1273, 586, '586', 'UDP', 'PASSWORD-CHG (Password Change)'),
(1274, 587, '587', 'UDP', 'SUBMISSION (Message Submission for Mail[13]) — используется (SMTP)'),
(1275, 588, '588', 'UDP', 'CAL'),
(1276, 589, '589', 'UDP', 'EYELINK'),
(1277, 59, '59', 'UDP', 'PRIV-FILE — для любых служб обработки файлов'),
(1278, 590, '590', 'UDP', 'TNS-CML'),
(1279, 591, '591', 'UDP', 'HTTP-ALT (HTTP Alternate, см. порт 80) — используется программой FileMaker начиная с версии 6.0'),
(1280, 592, '592', 'UDP', 'EUDORA-SET'),
(1281, 593, '593', 'UDP', 'HTTP-RPC-EPMAP (RPC посредством HTTP) — используется, например, службами DCOM и Microsoft Exchange Server'),
(1282, 594, '594', 'UDP', 'TPIP'),
(1283, 595, '595', 'UDP', 'CAB-PROTOCOL'),
(1284, 596, '596', 'UDP', 'SMSD'),
(1285, 597, '597', 'UDP', 'PTCNAMESERVICE (PTC Name Service)'),
(1286, 598, '598', 'UDP', 'SCO-WEBSRVRMG3 (SCO Web Server Manager 3)'),
(1287, 599, '599', 'UDP', 'ACP (Aeolon Core Protocol)'),
(1288, 600, '600', 'UDP', 'IPCSERVER (Sun IPC server)'),
(1289, 601, '601', 'UDP', 'SYSLOG-CONN — используется Reliable Syslog Service (служба надёжной доставки сообщений о происходящих в системе событиях с использованием XML-схем протокола BEEP[en])[14]'),
(1290, 602, '602', 'UDP', 'XMLRPC-BEEP (XML-RPC посредством BEEP[en])[15]'),
(1291, 603, '603', 'UDP', 'IDXP (Intrusion Detection Exchange Protocol)[16]'),
(1292, 604, '604', 'UDP', 'TUNNEL — используется для туннелирования протокола BEEP[en] на прикладном уровне[17]'),
(1293, 605, '605', 'UDP', 'SOAP-BEEP — используется для передачи сообщений SOAP посредством протокола BEEP[en][18]'),
(1294, 606, '606', 'UDP', 'URM (Cray Unified Resource Manager)'),
(1295, 607, '607', 'UDP', 'NQS'),
(1296, 608, '608', 'UDP', 'SIFT-UFT (Sender-Initiated/Unsolicited File Transfer)'),
(1297, 609, '609', 'UDP', 'NPMP-TRAP'),
(1298, 61, '61', 'UDP', 'NI-MAIL'),
(1299, 610, '610', 'UDP', 'NPMP-LOCAL'),
(1300, 611, '611', 'UDP', 'NPMP-GUI'),
(1301, 612, '612', 'UDP', 'HMMP-IND (HMMP Indication)'),
(1302, 613, '613', 'UDP', 'HMMP-OP (HMMP Operation)'),
(1303, 614, '614', 'UDP', 'SSHELL (SSL shell)'),
(1304, 615, '615', 'UDP', 'SCO-INETMGR (SCO Internet Configuration Manager)'),
(1305, 616, '616', 'UDP', 'SCO-SYSMGR (SCO System Administration Server)'),
(1306, 617, '617', 'UDP', 'SCO-DTMGR (SCO Desktop Administration Server)'),
(1307, 618, '618', 'UDP', 'DEI-ICDA'),
(1308, 619, '619', 'UDP', 'COMPAQ-EVM'),
(1309, 62, '62', 'UDP', 'ACAS (ACA Services)'),
(1310, 620, '620', 'UDP', 'SCO-WEBSRVRMGR (SCO WebServer Manager)'),
(1311, 621, '621', 'UDP', 'ESCP-IP'),
(1312, 622, '622', 'UDP', 'COLLABORATOR'),
(1313, 623, '623', 'UDP', 'ASF-RMCP (ASF Remote Management and Control Protocol)'),
(1314, 624, '624', 'UDP', 'CRYPTOADMIN'),
(1315, 625, '625', 'UDP', 'DEC-DLM'),
(1316, 626, '626', 'UDP', 'ASIA'),
(1317, 627, '627', 'UDP', 'PASSGO-TIVOLI'),
(1318, 628, '628', 'UDP', 'QMQP'),
(1319, 629, '629', 'UDP', '3COM-AMP3'),
(1320, 63, '63', 'UDP', 'WHOISPP'),
(1321, 630, '630', 'UDP', 'RDA'),
(1322, 631, '631', 'UDP', 'IPP (Internet Printing Protocol)'),
(1323, 632, '632', 'UDP', 'BMPP'),
(1324, 633, '633', 'UDP', 'SERVSTAT (Service Status update) — для Sterling Software'),
(1325, 634, '634', 'UDP', 'GINAD'),
(1326, 635, '635', 'UDP', 'RLZDBASE'),
(1327, 636, '636', 'UDP', 'LDAPS (Lightweight Directory Access Protocol Secure) — LDAP с шифрованием по SSL или TLS'),
(1328, 637, '637', 'UDP', 'LANSERVER'),
(1329, 638, '638', 'UDP', 'MCNS-SEC'),
(1330, 639, '639', 'UDP', 'MSDP (Multicast Source Discovery Protocol[en])'),
(1331, 64, '64', 'UDP', 'COVIA'),
(1332, 640, '640', 'UDP', 'ENTRUST-SPS'),
(1333, 641, '641', 'UDP', 'REPCMD'),
(1334, 642, '642', 'UDP', 'ESRO-EMSDP (v1.3)'),
(1335, 643, '643', 'UDP', 'SANITY'),
(1336, 644, '644', 'UDP', 'DWR'),
(1337, 645, '645', 'UDP', 'PSSC'),
(1338, 646, '646', 'UDP', 'LDP (Label Distribution Protocol) — используется для маршрутизации в сетях MPLS'),
(1339, 647, '647', 'UDP', 'DHCP-FAILOVER (DHCP Failover)[19]'),
(1340, 648, '648', 'UDP', 'RRP (Registry Registrar Protocol)[20]'),
(1341, 649, '649', 'UDP', 'CADVIEW-3D'),
(1342, 65, '65', 'UDP', 'TACACS-DS (TACACS Database Service)'),
(1343, 650, '650', 'UDP', 'OBEX'),
(1344, 651, '651', 'UDP', 'IEEE-MMS'),
(1345, 652, '652', 'UDP', 'HELLO-PORT'),
(1346, 653, '653', 'UDP', 'REPSCMD'),
(1347, 654, '654', 'UDP', 'AODV (Ad-hoc On-demand Distance Vector)'),
(1348, 655, '655', 'UDP', 'TINC'),
(1349, 656, '656', 'UDP', 'SPMP'),
(1350, 657, '657', 'UDP', 'RMC (Remote monitoring and Control) — используется в системах IBM (AIX Integrated Virtualization Manager[21], Hardware Management Console[en]) для динамической конфигурации управляемых логических разделов'),
(1351, 658, '658', 'UDP', 'TENFOLD'),
(1352, 66, '66', 'UDP', 'SQL-NET'),
(1353, 660, '660', 'UDP', 'MAC-SRVR-ADMIN (Mac OS X Server administration)'),
(1354, 661, '661', 'UDP', 'HAP'),
(1355, 662, '662', 'UDP', 'PFTP'),
(1356, 663, '663', 'UDP', 'PURENOISE'),
(1357, 664, '664', 'UDP', 'ASF-SECURE-RMCP (ASF Secure Remote Management and Control Protocol)'),
(1358, 665, '665', 'UDP', 'SUN-DR (SUN Remote Dynamic Reconfiguration)'),
(1359, 666, '666', 'UDP', 'MDQS;'),
(1360, 667, '667', 'UDP', 'DISCLOSE (campaign contribution disclosures, SDR Technologies)'),
(1361, 668, '668', 'UDP', 'MECOMM'),
(1362, 669, '669', 'UDP', 'MEREGISTER'),
(1363, 67, '67', 'UDP', 'BOOTPS (Bootstrap Protocol Server) — для сервера, с которого выполняется загрузка бездисковых рабочих станций; также используется DHCP (Dynamic Host Configuration Protocol)'),
(1364, 670, '670', 'UDP', 'VACDSM-SWS'),
(1365, 671, '671', 'UDP', 'VACDSM-APP'),
(1366, 672, '672', 'UDP', 'VPPS-QUA'),
(1367, 673, '673', 'UDP', 'CIMPLEX'),
(1368, 674, '674', 'UDP', 'ACAP (Application Configuration Access Protocol)'),
(1369, 675, '675', 'UDP', 'DCTP'),
(1370, 676, '676', 'UDP', 'VPPS-VIA'),
(1371, 677, '677', 'UDP', 'VPP (Virtual Presence Protocol)'),
(1372, 678, '678', 'UDP', 'GGF-NCP (GNU Generation Foundation NCP)'),
(1373, 679, '679', 'UDP', 'MRM'),
(1374, 68, '68', 'UDP', 'BOOTPC (Bootstrap Protocol Client) — для клиентов бездисковых рабочих станций, загружающихся с сервера BOOTP; также используется DHCP (Dynamic Host Configuration Protocol)'),
(1375, 680, '680', 'UDP', 'ENTRUST-AAAS'),
(1376, 681, '681', 'UDP', 'ENTRUST-AAMS'),
(1377, 682, '682', 'UDP', 'XFR'),
(1378, 683, '683', 'UDP', 'CORBA-IIOP'),
(1379, 684, '684', 'UDP', 'CORBA-IIOP-SSL'),
(1380, 685, '685', 'UDP', 'MDC-PortMapper'),
(1381, 686, '686', 'UDP', 'HCP-Wismar (Hardware Control Protocol Wismar)'),
(1382, 687, '687', 'UDP', 'ASIPREGISTRY'),
(1383, 688, '688', 'UDP', 'REALM-RUSD (ApplianceWare managment protocol)'),
(1384, 689, '689', 'UDP', 'NMAP'),
(1385, 69, '69', 'UDP', 'TFTP (Trivial File Transfer Protocol) — тривиальный FTP применяется, например, при установке операционной системы на большое количество компьютеров в сетях предприятий. Для этого сервер TFTP и поддержка удалённого развёртывания (UAM) включены в состав сер'),
(1386, 690, '690', 'UDP', 'VATP (Velazquez Application Transfer Protocol)'),
(1387, 691, '691', 'UDP', 'MSEXCH-ROUTING (Microsoft Exchange Server Routing)'),
(1388, 692, '692', 'UDP', 'Hyperwave-ISP'),
(1389, 693, '693', 'UDP', 'CONNENDP (almanid Connection Endpoint)'),
(1390, 694, '694', 'UDP', 'HA-CLUSTER (Linux High Availability Cluster heartbeat)'),
(1391, 695, '695', 'UDP', 'IEEE-MMS-SSL (IEEE Media Management System over SSL)[22]'),
(1392, 696, '696', 'UDP', 'RUSHD'),
(1393, 697, '697', 'UDP', 'UUIDGEN'),
(1394, 698, '698', 'UDP', 'OLSR (Optimized Link-State Routing)'),
(1395, 699, '699', 'UDP', 'ACCESSNETWORK'),
(1396, 7, '7', 'UDP', 'ECHO — предназначен для тестирования связи путём отправки данных на сервер и получения от него их же в неизменном виде'),
(1397, 70, '70', 'UDP', 'Gopher'),
(1398, 700, '700', 'UDP', 'EPP (Extensible Provisioning Protocol)[23] — используется для управления регистрационной информацией DNS'),
(1399, 701, '701', 'UDP', 'LMP (Link Management Protocol)[24]'),
(1400, 702, '702', 'UDP', 'IRIS-BEEP (IRIS over BEEP)[25] — используется для передачи сообщений IRIS (Internet Registry Information Service)[26][27] посредством протокола BEEP[en]'),
(1401, 703, '703', 'UDP', 'свободен'),
(1402, 704, '704', 'UDP', 'ELCSD (errlog copy/server daemon)'),
(1403, 705, '705', 'UDP', 'AGENTX'),
(1404, 706, '706', 'UDP', 'SILC (Secure Internet Live Conferencing) — для организации безопасных аудио- и видеоконференций'),
(1405, 707, '707', 'UDP', 'BORLAND-DSJ'),
(1406, 708, '708', 'UDP', 'свободен'),
(1407, 709, '709', 'UDP', 'ENTRUST-KMSH'),
(1408, 71, '71', 'UDP', 'NETRJS-1 (Remote job entry[en] Service)'),
(1409, 710, '710', 'UDP', 'ENTRUST-ASH'),
(1410, 711, '711', 'UDP', 'CISCO-TDP (Cisco Tag Distribution Protocol)[28][29]'),
(1411, 712, '712', 'UDP', 'TBRPF (Topology Broadcast based on Reverse-Path Forwarding routing protocol[en])[30]'),
(1412, 713, '713', 'UDP', 'IRIS-XPC (IRIS over XPC)'),
(1413, 713, '713', 'UDP', 'IRIS-XPCS (IRIS over XPCS)'),
(1414, 715, '715', 'UDP', 'IRIS-LWZ'),
(1415, 716, '716', 'UDP', 'PANA'),
(1416, 72, '72', 'UDP', 'NETRJS-2 (Remote job entry[en] Service)'),
(1417, 729, '729', 'UDP', 'NETVIEWDM1 (IBM NetView DM/6000 Server/Client)'),
(1418, 73, '73', 'UDP', 'NETRJS-3 (Remote job entry[en] Service)'),
(1419, 730, '730', 'UDP', 'NETVIEWDM2 (IBM NetView DM/6000 send/tcp)'),
(1420, 731, '731', 'UDP', 'NETVIEWDM3 (IBM NetView DM/6000 receive/tcp)'),
(1421, 732, '732', 'UDP', 'свободны'),
(1422, 733, '733', 'UDP', 'свободны'),
(1423, 734, '734', 'UDP', 'свободны'),
(1424, 735, '735', 'UDP', 'свободны'),
(1425, 736, '736', 'UDP', 'свободны'),
(1426, 737, '737', 'UDP', 'свободны'),
(1427, 738, '738', 'UDP', 'свободны'),
(1428, 739, '739', 'UDP', 'свободны'),
(1429, 740, '740', 'UDP', 'свободны'),
(1430, 74, '74', 'UDP', 'NETRJS-4 (Remote job entry[en] Service)'),
(1431, 741, '741', 'UDP', 'NETGW'),
(1432, 742, '742', 'UDP', 'NETRCS'),
(1433, 743, '743', 'UDP', 'свободен'),
(1434, 744, '744', 'UDP', 'FLEXLM (Flexible License Manager)'),
(1435, 745, '745', 'UDP', 'свободен'),
(1436, 746, '746', 'UDP', 'свободен'),
(1437, 747, '747', 'UDP', 'FUJITSU-DEV (Fujitsu Device Control)'),
(1438, 748, '748', 'UDP', 'RIS-CM (Russell Info Sci Calendar Manager)'),
(1439, 749, '749', 'UDP', 'KERBEROS-ADM (Kerberos administration)'),
(1440, 75, '75', 'UDP', 'PRIV-DIAL — для любых приложений телефонного дозвона'),
(1441, 750, '750', 'UDP', 'LOADAV'),
(1442, 750, '750', 'UDP', 'KERBEROS-IV (Kerberos version IV)'),
(1443, 751, '751', 'UDP', 'PUMP'),
(1444, 751, '751', 'UDP', 'kerberos_master (Kerberos authentication)'),
(1445, 752, '752', 'UDP', 'QRH'),
(1446, 752, '752', 'UDP', 'passwd_server (Kerberos password server)'),
(1447, 753, '753', 'UDP', 'RRH (Reverse Routing Header)[31]'),
(1448, 753, '753', 'UDP', 'userreg_server (Kerberos user registration server)'),
(1449, 754, '754', 'UDP', 'TELL'),
(1450, 755, '755', 'UDP', 'свободен'),
(1451, 756, '756', 'UDP', 'свободен'),
(1452, 757, '757', 'UDP', 'свободен'),
(1453, 758, '758', 'UDP', 'NLOGIN'),
(1454, 759, '759', 'UDP', 'CON'),
(1455, 76, '76', 'UDP', 'DEOS (Distributed External Object Store)'),
(1456, 760, '760', 'UDP', 'NS'),
(1457, 760, '760', 'UDP', 'krbupdate, kreg (Kerberos registration)'),
(1458, 761, '761', 'UDP', 'RXE'),
(1459, 762, '762', 'UDP', 'QUOTAD'),
(1460, 763, '763', 'UDP', 'CYCLESERV'),
(1461, 764, '764', 'UDP', 'OMSERV'),
(1462, 765, '765', 'UDP', 'WEBSTER'),
(1463, 766, '766', 'UDP', 'свободен'),
(1464, 767, '767', 'UDP', 'PHONEBOOK'),
(1465, 768, '768', 'UDP', 'свободен'),
(1466, 769, '769', 'UDP', 'VID'),
(1467, 77, '77', 'UDP', 'PRIV-RJE — для использования в любых службах Remote Job Entry[en]'),
(1468, 770, '770', 'UDP', 'CADLOCK'),
(1469, 771, '771', 'UDP', 'RTIP'),
(1470, 772, '772', 'UDP', 'CYCLESERV2'),
(1471, 773, '773', 'UDP', 'NOTIFY'),
(1472, 774, '774', 'UDP', 'ACMAINT-DBD'),
(1473, 775, '775', 'UDP', 'ACMAINT-TRANSD'),
(1474, 776, '776', 'UDP', 'WPAGES'),
(1475, 777, '777', 'UDP', 'Multiling-HTTP'),
(1476, 778, '778', 'UDP', 'свободен'),
(1477, 779, '779', 'UDP', 'свободен'),
(1478, 78, '78', 'UDP', 'VETTCP'),
(1479, 780, '780', 'UDP', 'WPGS'),
(1480, 79, '79', 'UDP', 'Finger'),
(1481, 80, 'HTTP(80)', 'UDP', 'HTTP (HyperText Transfer Protocol); ранее — WWW'),
(1482, 800, '800', 'UDP', 'MDBS-DAEMON'),
(1483, 801, '801', 'UDP', 'DEVICE'),
(1484, 81, '81', 'UDP', 'HOSTS2-NS (HOSTS2 Name Server)'),
(1485, 810, '810', 'UDP', 'FCP-UDP'),
(1486, 82, '82', 'UDP', 'XFER'),
(1487, 828, '828', 'UDP', 'ITM-MCELL-S'),
(1488, 829, '829', 'UDP', 'PKIX-3-CA-RA'),
(1489, 83, '83', 'UDP', 'MIT-ML-DEV (MIT ML Device)'),
(1490, 830, '830', 'UDP', 'NETCONF-SSH (NETCONF over SSH)[32] — NETCONF через SSH'),
(1491, 831, '831', 'UDP', 'NETCONF-BEEP (NETCONF over BEEP)[33] — NETCONF через BEEP[en]'),
(1492, 832, '832', 'UDP', 'NETCONFSOAPHTTP (NETCONF for SOAP over HTTPS)[34] — NETCONF через SOAP и SSH'),
(1493, 833, '833', 'UDP', 'NETCONFSOAPBEEP (NETCONF for SOAP over BEEP)[34] — NETCONF через SOAP и BEEP[en]'),
(1494, 834, '834', 'UDP', 'свободны'),
(1495, 835, '835', 'UDP', 'свободны'),
(1496, 836, '836', 'UDP', 'свободны'),
(1497, 837, '837', 'UDP', 'свободны'),
(1498, 838, '838', 'UDP', 'свободны'),
(1499, 839, '839', 'UDP', 'свободны'),
(1500, 840, '840', 'UDP', 'свободны'),
(1501, 841, '841', 'UDP', 'свободны'),
(1502, 842, '842', 'UDP', 'свободны'),
(1503, 843, '843', 'UDP', 'свободны'),
(1504, 844, '844', 'UDP', 'свободны'),
(1505, 845, '845', 'UDP', 'свободны'),
(1506, 846, '846', 'UDP', 'свободны'),
(1507, 84, '84', 'UDP', 'CTF (Common Trace Facility)'),
(1508, 847, '847', 'UDP', 'DHCP-FAILOVER2 (DHCP Failover)[19]'),
(1509, 848, '848', 'UDP', 'GDOI (Group Domain of Interpretation)[35]'),
(1510, 849, '849', 'UDP', 'свободны'),
(1511, 850, '850', 'UDP', 'свободны'),
(1512, 851, '851', 'UDP', 'свободны'),
(1513, 852, '852', 'UDP', 'свободны'),
(1514, 853, '853', 'UDP', 'свободны'),
(1515, 854, '854', 'UDP', 'свободны'),
(1516, 855, '855', 'UDP', 'свободны'),
(1517, 856, '856', 'UDP', 'свободны'),
(1518, 857, '857', 'UDP', 'свободны'),
(1519, 858, '858', 'UDP', 'свободны'),
(1520, 859, '859', 'UDP', 'свободны'),
(1521, 85, '85', 'UDP', 'MIT-ML-DEV (MIT ML Device)'),
(1522, 86, '86', 'UDP', 'MFCOBOL (Micro Focus Cobol)'),
(1523, 860, '860', 'UDP', 'ISCSI (Internet Small Computer Systems Interface)[36][37]'),
(1524, 861, '861', 'UDP', 'OWAMP-CONTROL (One-way Active Measurement Protocol Control)[38]'),
(1525, 862, '862', 'UDP', 'TWAMP-CONTROL (Two-way Active Measurement Protocol Control)[39]'),
(1526, 863, '863', 'UDP', 'свободны'),
(1527, 864, '864', 'UDP', 'свободны'),
(1528, 865, '865', 'UDP', 'свободны'),
(1529, 866, '866', 'UDP', 'свободны'),
(1530, 867, '867', 'UDP', 'свободны'),
(1531, 868, '868', 'UDP', 'свободны'),
(1532, 869, '869', 'UDP', 'свободны'),
(1533, 870, '870', 'UDP', 'свободны'),
(1534, 871, '871', 'UDP', 'свободны'),
(1535, 872, '872', 'UDP', 'свободны'),
(1536, 87, '87', 'UDP', 'PRIV-TERM-L — для любых приложений, обеспечивающих терминальное соединение типа «текстовый чат» (например, аналогичных talk)'),
(1537, 873, '873', 'UDP', 'RSYNC (Remote Synchronization) — используется rsync'),
(1538, 874, '874', 'UDP', 'свободны'),
(1539, 875, '875', 'UDP', 'свободны'),
(1540, 876, '876', 'UDP', 'свободны'),
(1541, 877, '877', 'UDP', 'свободны'),
(1542, 878, '878', 'UDP', 'свободны'),
(1543, 879, '879', 'UDP', 'свободны'),
(1544, 880, '880', 'UDP', 'свободны'),
(1545, 881, '881', 'UDP', 'свободны'),
(1546, 882, '882', 'UDP', 'свободны'),
(1547, 883, '883', 'UDP', 'свободны'),
(1548, 884, '884', 'UDP', 'свободны'),
(1549, 885, '885', 'UDP', 'свободны'),
(1550, 886, '886', 'UDP', 'ICLCNET-LOCATE (ICL coNETion locate server)'),
(1551, 887, '887', 'UDP', 'ICLCNET-SVINFO (ICL coNETion server info)'),
(1552, 888, '888', 'UDP', 'ACCESSBUILDER'),
(1553, 89, '89', 'UDP', 'SU-MIT-TG (SU/MIT Telnet Gateway)'),
(1554, 897, '897', 'UDP', 'Brocade SMI-S RPC'),
(1555, 898, '898', 'UDP', 'Brocade SMI-S RPC с шифрованием по SSL'),
(1556, 9, '9', 'UDP', 'DISCARD — предназначен для тестирования связи путём отправки данных на сервер, который отбрасывает принятое, не отправляя никакого ответа'),
(1557, 90, '90', 'UDP', 'DNSIX (DoD Network Security for Information eXchange) Securit Attribute Token Map'),
(1558, 900, '900', 'UDP', 'OMGINITIALREFS'),
(1559, 901, '901', 'UDP', 'SMPNAMERES'),
(1560, 902, '902', 'UDP', 'IDEAFARM-DOOR'),
(1561, 903, '903', 'UDP', 'IDEAFARM-PANIC'),
(1562, 91, '91', 'UDP', 'MIT-DOV (MIT Dover Spooler)'),
(1563, 910, '910', 'UDP', 'KINK (Kerberized Internet Negotiation of Keys)[42]'),
(1564, 911, '911', 'UDP', 'XACT-BACKUP'),
(1565, 912, '912', 'UDP', 'APEX-MESH (Application Exchange relay to relay service)[43]'),
(1566, 913, '913', 'UDP', 'APEX-EDGE (Application Exchange endpoint to relay service)[43]'),
(1567, 92, '92', 'UDP', 'NPP (Network Printing Protocol)'),
(1568, 93, '93', 'UDP', 'DCP (Device Control Protocol)'),
(1569, 94, '94', 'UDP', 'OBJCALL'),
(1570, 95, '95', 'UDP', 'SUPDUP'),
(1571, 96, '96', 'UDP', 'DIXIE'),
(1572, 97, '97', 'UDP', 'SWIFT-RVF (Swift Remote Virtural File Protocol)'),
(1573, 98, '98', 'UDP', 'TACNEWS'),
(1574, 989, '989', 'UDP', 'FTPS-DATA (FTP-данные с шифрованием по SSL или TLS)'),
(1575, 99, '99', 'UDP', 'METAGRAM'),
(1576, 990, '990', 'UDP', 'FTPS (FTP-команды с шифрованием по SSL или TLS)'),
(1577, 991, '991', 'UDP', 'NAS (Netnews Administration System)[44]'),
(1578, 992, '992', 'UDP', 'TELNETS (Telnet с шифрованием по SSL или TLS)'),
(1579, 993, 'IMAPS (UDP-993)', 'UDP', 'IMAPS (Internet Message Access Protocol с шифрованием по SSL или TLS)'),
(1580, 994, '994', 'UDP', 'резерв; ранее — IRCS (IRC с шифрованием по SSL или TLS)'),
(1581, 996, '996', 'UDP', 'VSINET'),
(1582, 997, '997', 'UDP', 'MAITRD'),
(1583, 998, '998', 'UDP', 'PUPARP'),
(1584, 999, '999', 'UDP', 'PUPROUTER'),
(1585, 999, '999', 'UDP', 'APPLIX');

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_code` varchar(25) NOT NULL,
  `comment` varchar(125) NOT NULL,
  `contents` text NOT NULL,
  `textkey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `projects`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `rolename` varchar(24) NOT NULL,
  `comment` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `roles`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `servers`
--

DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `servername` varchar(30) NOT NULL,
  `os_id` int(11) NOT NULL,
  `internet` int(11) NOT NULL,
  `cpu` varchar(25) NOT NULL,
  `ram` varchar(25) NOT NULL,
  `hdd` varchar(50) NOT NULL,
  `note` varchar(125) NOT NULL,
  `url` varchar(255) NOT NULL,
  `connect` varchar(125) NOT NULL,
  `content` text NOT NULL,
  `serv_key` varchar(255) NOT NULL,
  `status_id` int(11) NOT NULL,
  `lastupdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `servers`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `servicename` varchar(125) NOT NULL,
  `content` text NOT NULL,
  `note` varchar(125) NOT NULL,
  `host_id` int(25) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `services`:
--

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `serviphost`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `serviphost`;
CREATE TABLE `serviphost` (
`ip` varchar(40)
,`servername` varchar(30)
,`hostname` varchar(40)
);

-- --------------------------------------------------------

--
-- Структура таблицы `srvstatus`
--

DROP TABLE IF EXISTS `srvstatus`;
CREATE TABLE `srvstatus` (
  `status_id` int(11) NOT NULL,
  `statusname` varchar(50) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `srvstatus`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `supproject`
--

DROP TABLE IF EXISTS `supproject`;
CREATE TABLE `supproject` (
  `supproject_id` int(11) NOT NULL,
  `projectname` varchar(50) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `supproject`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `systems`
--

DROP TABLE IF EXISTS `systems`;
CREATE TABLE `systems` (
  `system_id` int(11) NOT NULL,
  `systemname` varchar(50) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `systems`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `taskstatus`
--

DROP TABLE IF EXISTS `taskstatus`;
CREATE TABLE `taskstatus` (
  `tasktatus_id` int(11) NOT NULL,
  `statusname` varchar(25) NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `taskstatus`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `todo`
--

DROP TABLE IF EXISTS `todo`;
CREATE TABLE `todo` (
  `server_id` int(11) NOT NULL,
  `lastdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `todo`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `troubles`
--

DROP TABLE IF EXISTS `troubles`;
CREATE TABLE `troubles` (
  `id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `taststatus_id` int(11) NOT NULL,
  `trouble` varchar(125) NOT NULL,
  `troublefull` text NOT NULL,
  `solution` text NOT NULL,
  `start_date` datetime NOT NULL,
  `textkey` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `finish_date` datetime NOT NULL,
  `lefttime` time NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `troubles`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `login` varchar(25) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `sername` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `seats` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `users`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `workdata`
--

DROP TABLE IF EXISTS `workdata`;
CREATE TABLE `workdata` (
  `id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `taskstatus_id` int(11) NOT NULL,
  `note` varchar(125) NOT NULL,
  `text` text NOT NULL,
  `start_date` datetime NOT NULL,
  `service_id` int(11) NOT NULL,
  `testkey` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `finish_date` datetime NOT NULL,
  `lefttime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `workdata`:
--

-- --------------------------------------------------------

--
-- Структура таблицы `zones`
--

DROP TABLE IF EXISTS `zones`;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `notes` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `zones`:
--

--
-- Дамп данных таблицы `zones`
--

INSERT INTO `zones` (`zone_id`, `name`, `notes`) VALUES
(1, 'local', 'Локальная сеть'),
(2, 'internet', 'Интернет'),
(3, 'DMZ', 'Демилитаризованная зона'),
(4, 'VPN-minprom', 'ВПН Минпром');

-- --------------------------------------------------------

--
-- Структура для представления `serviphost`
--
DROP TABLE IF EXISTS `serviphost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev1`@`localhost` SQL SECURITY DEFINER VIEW `serviphost`  AS  select `ipaddress`.`ip` AS `ip`,`servers`.`servername` AS `servername`,`hosts`.`hostname` AS `hostname` from ((((`key_hosts` join `servers` on((`key_hosts`.`server_id` = `servers`.`id`))) join `key_ip` on((`key_ip`.`host_id` = `key_hosts`.`host_id`))) join `ipaddress` on((`key_ip`.`ip_id` = `ipaddress`.`id`))) join `hosts` on((`key_hosts`.`host_id` = `hosts`.`host_id`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `acltype`
--
ALTER TABLE `acltype`
  ADD PRIMARY KEY (`acltype_id`);

--
-- Индексы таблицы `demons`
--
ALTER TABLE `demons`
  ADD PRIMARY KEY (`demon_id`);

--
-- Индексы таблицы `dnsreg`
--
ALTER TABLE `dnsreg`
  ADD PRIMARY KEY (`dnsreg_id`);

--
-- Индексы таблицы `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`domain_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Индексы таблицы `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`host_id`),
  ADD UNIQUE KEY `hostname` (`hostname`);

--
-- Индексы таблицы `ipaddress`
--
ALTER TABLE `ipaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ip` (`ip`);

--
-- Индексы таблицы `key_admin`
--
ALTER TABLE `key_admin`
  ADD KEY `ix_admin` (`admin_id`);

--
-- Индексы таблицы `key_dmnsvc`
--
ALTER TABLE `key_dmnsvc`
  ADD KEY `demon_id` (`demon_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `key_hostobj`
--
ALTER TABLE `key_hostobj`
  ADD KEY `host_id` (`host_id`),
  ADD KEY `object_id` (`object_id`);

--
-- Индексы таблицы `key_hosts`
--
ALTER TABLE `key_hosts`
  ADD KEY `ix_host_id` (`host_id`) USING BTREE,
  ADD KEY `ix_server_id` (`server_id`) USING BTREE;

--
-- Индексы таблицы `key_mainip`
--
ALTER TABLE `key_mainip`
  ADD KEY `server_id` (`server_id`);

--
-- Индексы таблицы `key_owner`
--
ALTER TABLE `key_owner`
  ADD KEY `ix_owner` (`owner_id`);

--
-- Индексы таблицы `key_prjobj`
--
ALTER TABLE `key_prjobj`
  ADD KEY `project_id` (`project_id`),
  ADD KEY `object_id` (`object_id`);

--
-- Индексы таблицы `key_project`
--
ALTER TABLE `key_project`
  ADD KEY `ix_project` (`project_id`);

--
-- Индексы таблицы `key_sprjsrv`
--
ALTER TABLE `key_sprjsrv`
  ADD KEY `supproject_id` (`supproject_id`),
  ADD KEY `server_id` (`server_id`);

--
-- Индексы таблицы `key_sprjsvc`
--
ALTER TABLE `key_sprjsvc`
  ADD KEY `supproject_id` (`supproject_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `key_sprjsyst`
--
ALTER TABLE `key_sprjsyst`
  ADD KEY `supproject_id` (`supproject_id`),
  ADD KEY `system_id` (`system_id`);

--
-- Индексы таблицы `key_srvobj`
--
ALTER TABLE `key_srvobj`
  ADD KEY `server_id` (`server_id`),
  ADD KEY `object_id` (`object_id`);

--
-- Индексы таблицы `key_svcadm`
--
ALTER TABLE `key_svcadm`
  ADD KEY `ix_admin` (`admin_id`);

--
-- Индексы таблицы `key_svcobj`
--
ALTER TABLE `key_svcobj`
  ADD KEY `service_id` (`service_id`),
  ADD KEY `object_id` (`object_id`);

--
-- Индексы таблицы `key_svcown`
--
ALTER TABLE `key_svcown`
  ADD KEY `ix_owner` (`owner_id`);

--
-- Индексы таблицы `key_sysobj`
--
ALTER TABLE `key_sysobj`
  ADD KEY `system_id` (`system_id`),
  ADD KEY `object_id` (`object_id`);

--
-- Индексы таблицы `key_systprj`
--
ALTER TABLE `key_systprj`
  ADD KEY `ix_system` (`system_id`) USING BTREE,
  ADD KEY `ix_project` (`project_id`) USING BTREE;

--
-- Индексы таблицы `key_systsvc`
--
ALTER TABLE `key_systsvc`
  ADD KEY `ix_system` (`system_id`) USING BTREE,
  ADD KEY `ix_service` (`service_id`) USING BTREE;

--
-- Индексы таблицы `key_sysusr`
--
ALTER TABLE `key_sysusr`
  ADD KEY `ix_system` (`system_id`) USING BTREE,
  ADD KEY `ix_user` (`user_id`) USING BTREE;

--
-- Индексы таблицы `key_trouble`
--
ALTER TABLE `key_trouble`
  ADD KEY `ix_serverid` (`serverid`);

--
-- Индексы таблицы `key_usrgp`
--
ALTER TABLE `key_usrgp`
  ADD KEY `ix_gpid` (`group_id`) USING BTREE,
  ADD KEY `ix_usrid` (`user_id`) USING BTREE;

--
-- Индексы таблицы `needs`
--
ALTER TABLE `needs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`object_id`);

--
-- Индексы таблицы `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`os_id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Индексы таблицы `passport`
--
ALTER TABLE `passport`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ports`
--
ALTER TABLE `ports`
  ADD PRIMARY KEY (`port_id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `servers` ADD FULLTEXT KEY `content` (`content`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);
ALTER TABLE `services` ADD FULLTEXT KEY `tx_services` (`content`);

--
-- Индексы таблицы `srvstatus`
--
ALTER TABLE `srvstatus`
  ADD PRIMARY KEY (`status_id`);

--
-- Индексы таблицы `supproject`
--
ALTER TABLE `supproject`
  ADD PRIMARY KEY (`supproject_id`);

--
-- Индексы таблицы `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`system_id`);

--
-- Индексы таблицы `taskstatus`
--
ALTER TABLE `taskstatus`
  ADD PRIMARY KEY (`tasktatus_id`);

--
-- Индексы таблицы `todo`
--
ALTER TABLE `todo`
  ADD UNIQUE KEY `ix_serverid` (`server_id`);

--
-- Индексы таблицы `troubles`
--
ALTER TABLE `troubles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_date` (`start_date`);
ALTER TABLE `troubles` ADD FULLTEXT KEY `tx_trouble` (`troublefull`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `workdata`
--
ALTER TABLE `workdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_date` (`start_date`);

--
-- Индексы таблицы `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `acltype`
--
ALTER TABLE `acltype`
  MODIFY `acltype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `demons`
--
ALTER TABLE `demons`
  MODIFY `demon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `dnsreg`
--
ALTER TABLE `dnsreg`
  MODIFY `dnsreg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `domains`
--
ALTER TABLE `domains`
  MODIFY `domain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `hosts`
--
ALTER TABLE `hosts`
  MODIFY `host_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT для таблицы `ipaddress`
--
ALTER TABLE `ipaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT для таблицы `object`
--
ALTER TABLE `object`
  MODIFY `object_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `os`
--
ALTER TABLE `os`
  MODIFY `os_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `passport`
--
ALTER TABLE `passport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `ports`
--
ALTER TABLE `ports`
  MODIFY `port_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1586;
--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `srvstatus`
--
ALTER TABLE `srvstatus`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `supproject`
--
ALTER TABLE `supproject`
  MODIFY `supproject_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `systems`
--
ALTER TABLE `systems`
  MODIFY `system_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `taskstatus`
--
ALTER TABLE `taskstatus`
  MODIFY `tasktatus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `troubles`
--
ALTER TABLE `troubles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `workdata`
--
ALTER TABLE `workdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
