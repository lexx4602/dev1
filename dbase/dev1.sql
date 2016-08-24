-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Авг 23 2016 г., 17:50
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
-- Структура таблицы `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fsname` int(255) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ipaddres`
--

CREATE TABLE IF NOT EXISTS `ipaddres` (
  `id` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ipaddres`
--

INSERT INTO `ipaddres` (`id`, `ip`, `zone_id`, `comment`) VALUES
(1, 3232238602, 1, 'Внутренний адрес');

-- --------------------------------------------------------

--
-- Структура таблицы `ipaddress`
--

CREATE TABLE IF NOT EXISTS `ipaddress` (
  `id` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ipaddress`
--

INSERT INTO `ipaddress` (`id`, `ip`, `zone_id`, `comment`) VALUES
(1, 3232238602, 1, 'Внутренний адрес');

-- --------------------------------------------------------

--
-- Структура таблицы `os`
--

CREATE TABLE IF NOT EXISTS `os` (
  `id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `release` int(125) DEFAULT NULL,
  `comment` int(255) DEFAULT NULL,
  `distrib` int(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `os`
--

INSERT INTO `os` (`id`, `name`, `release`, `comment`, `distrib`) VALUES
(1, 'Centos 7', 0, 0, 0),
(2, 'Centos 6.7', NULL, NULL, NULL),
(3, 'Windows 2008', NULL, NULL, NULL),
(4, 'Windows 2012 r2', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `passport`
--

CREATE TABLE IF NOT EXISTS `passport` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `sername` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `passport`
--

INSERT INTO `passport` (`id`, `users_id`, `name`, `sername`) VALUES
(1, 1, 'Алексей', 'Борисов');

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `comment` varchar(125) NOT NULL,
  `contents` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` int(2) NOT NULL,
  `project_id` int(11) NOT NULL,
  `internet` int(11) NOT NULL,
  `os_id` int(11) NOT NULL,
  `cpu` varchar(25) NOT NULL,
  `ram` varchar(25) NOT NULL,
  `hdd` varchar(50) NOT NULL,
  `note` varchar(125) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ip_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `servers`
--

INSERT INTO `servers` (`id`, `name`, `status`, `project_id`, `internet`, `os_id`, `cpu`, `ram`, `hdd`, `note`, `comment`, `url`, `ip_id`, `admin_id`) VALUES
(1, 'front-nginx', 1, 0, 1, 1, '1', '8', '40', '', 'Сервер front-end nginx для web серверов', '', 1, 1),
(2, '218', 1, 1, 1, 1, '2', '4', '80', '', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `troublekey`
--

CREATE TABLE IF NOT EXISTS `troublekey` (
  `serverid` int(11) NOT NULL,
  `troubleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `troubles`
--

CREATE TABLE IF NOT EXISTS `troubles` (
  `id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trouble` varchar(255) NOT NULL,
  `solution` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `login` varchar(25) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`) VALUES
(1, 'admin', '1234567890', '');

-- --------------------------------------------------------

--
-- Структура таблицы `workdata`
--

CREATE TABLE IF NOT EXISTS `workdata` (
  `id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `notes` varchar(125) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `zones`
--

INSERT INTO `zones` (`id`, `name`, `notes`) VALUES
(1, 'local', 'Локальная сеть'),
(2, 'internet', 'Интернет');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ipaddres`
--
ALTER TABLE `ipaddres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ip` (`ip`);

--
-- Индексы таблицы `ipaddress`
--
ALTER TABLE `ipaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ip` (`ip`);

--
-- Индексы таблицы `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `passport`
--
ALTER TABLE `passport`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_status` (`status`),
  ADD KEY `ix_admin` (`admin_id`);

--
-- Индексы таблицы `troublekey`
--
ALTER TABLE `troublekey`
  ADD KEY `ix_serverid` (`serverid`);

--
-- Индексы таблицы `troubles`
--
ALTER TABLE `troubles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `workdata`
--
ALTER TABLE `workdata`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ipaddres`
--
ALTER TABLE `ipaddres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `ipaddress`
--
ALTER TABLE `ipaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `os`
--
ALTER TABLE `os`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `passport`
--
ALTER TABLE `passport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `troubles`
--
ALTER TABLE `troubles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `workdata`
--
ALTER TABLE `workdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
