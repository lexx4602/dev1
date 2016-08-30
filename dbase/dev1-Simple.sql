-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 30 2016 г., 18:36
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
-- Структура таблицы `adminkey`
--

DROP TABLE IF EXISTS `adminkey`;
CREATE TABLE `adminkey` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `user_id` int(11) NOT NULL,
  `dnsreg_id` int(11) NOT NULL,
  `zoneconfig` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Domain names table';

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

-- --------------------------------------------------------

--
-- Структура таблицы `hostskey`
--

DROP TABLE IF EXISTS `hostskey`;
CREATE TABLE `hostskey` (
  `host_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `version` int(11) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ipkey`
--

DROP TABLE IF EXISTS `ipkey`;
CREATE TABLE `ipkey` (
  `host_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mainipkey`
--

DROP TABLE IF EXISTS `mainipkey`;
CREATE TABLE `mainipkey` (
  `server_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(9, 'Linux', 'AltLinux СПТ 6.0', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ownerkey`
--

DROP TABLE IF EXISTS `ownerkey`;
CREATE TABLE `ownerkey` (
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Структура таблицы `projectkey`
--

DROP TABLE IF EXISTS `projectkey`;
CREATE TABLE `projectkey` (
  `project_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `hostname` varchar(25) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Структура таблицы `srchostkey`
--

DROP TABLE IF EXISTS `srchostkey`;
CREATE TABLE `srchostkey` (
  `service_id` int(11) DEFAULT NULL,
  `host_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `srvprjkey`
--

DROP TABLE IF EXISTS `srvprjkey`;
CREATE TABLE `srvprjkey` (
  `server_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Server project relation';

-- --------------------------------------------------------

--
-- Структура таблицы `srvsrckey`
--

DROP TABLE IF EXISTS `srvsrckey`;
CREATE TABLE `srvsrckey` (
  `service_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Структура таблицы `syssrckey`
--

DROP TABLE IF EXISTS `syssrckey`;
CREATE TABLE `syssrckey` (
  `system_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Systems`
--

DROP TABLE IF EXISTS `Systems`;
CREATE TABLE `Systems` (
  `system_id` int(11) NOT NULL,
  `systemname` varchar(50) DEFAULT NULL,
  `prj_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `taskstatus`
--

DROP TABLE IF EXISTS `taskstatus`;
CREATE TABLE `taskstatus` (
  `taststatus_id` int(11) NOT NULL,
  `statusname` varchar(25) NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `troublekey`
--

DROP TABLE IF EXISTS `troublekey`;
CREATE TABLE `troublekey` (
  `serverid` int(11) NOT NULL,
  `troubleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `lefttime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Структура таблицы `wdomsvckey`
--

DROP TABLE IF EXISTS `wdomsvckey`;
CREATE TABLE `wdomsvckey` (
  `wd_id` int(11) NOT NULL,
  `svc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Domain Services keys';

-- --------------------------------------------------------

--
-- Структура таблицы `workdata`
--

DROP TABLE IF EXISTS `workdata`;
CREATE TABLE `workdata` (
  `id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `taststatus_id` int(11) NOT NULL,
  `note` varchar(125) NOT NULL,
  `text` text NOT NULL,
  `start_date` datetime NOT NULL,
  `service_id` int(11) NOT NULL,
  `testkey` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `finish_date` datetime NOT NULL,
  `lefttime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`dev1`@`localhost` SQL SECURITY DEFINER VIEW `serviphost`  AS  select `ipaddress`.`ip` AS `ip`,`servers`.`servername` AS `servername`,`hosts`.`hostname` AS `hostname` from ((((`hostskey` join `servers` on((`hostskey`.`server_id` = `servers`.`id`))) join `ipkey` on((`ipkey`.`host_id` = `hostskey`.`host_id`))) join `ipaddress` on((`ipkey`.`ip_id` = `ipaddress`.`id`))) join `hosts` on((`hostskey`.`host_id` = `hosts`.`host_id`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adminkey`
--
ALTER TABLE `adminkey`
  ADD KEY `ix_admin` (`admin_id`);

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
-- Индексы таблицы `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`host_id`),
  ADD UNIQUE KEY `hostname` (`hostname`);

--
-- Индексы таблицы `hostskey`
--
ALTER TABLE `hostskey`
  ADD KEY `ix_host_id` (`host_id`) USING BTREE,
  ADD KEY `ix_server_id` (`server_id`) USING BTREE;

--
-- Индексы таблицы `ipaddress`
--
ALTER TABLE `ipaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ip` (`ip`);

--
-- Индексы таблицы `mainipkey`
--
ALTER TABLE `mainipkey`
  ADD KEY `server_id` (`server_id`);

--
-- Индексы таблицы `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`os_id`);

--
-- Индексы таблицы `ownerkey`
--
ALTER TABLE `ownerkey`
  ADD KEY `ix_owner` (`owner_id`);

--
-- Индексы таблицы `passport`
--
ALTER TABLE `passport`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `projectkey`
--
ALTER TABLE `projectkey`
  ADD KEY `ix_project` (`project_id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`);

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
-- Индексы таблицы `Systems`
--
ALTER TABLE `Systems`
  ADD PRIMARY KEY (`system_id`);

--
-- Индексы таблицы `taskstatus`
--
ALTER TABLE `taskstatus`
  ADD PRIMARY KEY (`taststatus_id`);

--
-- Индексы таблицы `troublekey`
--
ALTER TABLE `troublekey`
  ADD KEY `ix_serverid` (`serverid`);

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
-- AUTO_INCREMENT для таблицы `hosts`
--
ALTER TABLE `hosts`
  MODIFY `host_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT для таблицы `ipaddress`
--
ALTER TABLE `ipaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT для таблицы `os`
--
ALTER TABLE `os`
  MODIFY `os_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `passport`
--
ALTER TABLE `passport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `srvstatus`
--
ALTER TABLE `srvstatus`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Systems`
--
ALTER TABLE `Systems`
  MODIFY `system_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `taskstatus`
--
ALTER TABLE `taskstatus`
  MODIFY `taststatus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `troubles`
--
ALTER TABLE `troubles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `workdata`
--
ALTER TABLE `workdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
