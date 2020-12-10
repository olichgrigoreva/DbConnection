-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 10 2020 г., 17:48
-- Версия сервера: 10.1.30-MariaDB
-- Версия PHP: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `addressbook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addressbook`
--

CREATE TABLE `addressbook` (
  `domain_id` int(9) UNSIGNED NOT NULL DEFAULT '0',
  `id` int(9) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `addr_long` text,
  `addr_lat` text,
  `addr_status` text,
  `home` text NOT NULL,
  `mobile` text NOT NULL,
  `work` text NOT NULL,
  `fax` text NOT NULL,
  `email` text NOT NULL,
  `email2` text NOT NULL,
  `email3` text NOT NULL,
  `im` text NOT NULL,
  `im2` text NOT NULL,
  `im3` text NOT NULL,
  `homepage` text NOT NULL,
  `bday` tinyint(2) NOT NULL,
  `bmonth` varchar(50) NOT NULL,
  `byear` varchar(4) NOT NULL,
  `aday` tinyint(2) NOT NULL,
  `amonth` varchar(50) NOT NULL,
  `ayear` varchar(4) NOT NULL,
  `address2` text NOT NULL,
  `phone2` text NOT NULL,
  `notes` text NOT NULL,
  `photo` mediumtext,
  `x_vcard` mediumtext,
  `x_activesync` mediumtext,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deprecated` datetime NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `login` date DEFAULT NULL,
  `role` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `addressbook`
--

INSERT INTO `addressbook` (`domain_id`, `id`, `firstname`, `middlename`, `lastname`, `nickname`, `company`, `title`, `address`, `addr_long`, `addr_lat`, `addr_status`, `home`, `mobile`, `work`, `fax`, `email`, `email2`, `email3`, `im`, `im2`, `im3`, `homepage`, `bday`, `bmonth`, `byear`, `aday`, `amonth`, `ayear`, `address2`, `phone2`, `notes`, `photo`, `x_vcard`, `x_activesync`, `created`, `modified`, `deprecated`, `password`, `login`, `role`) VALUES
(0, 1, 'Jack', '', 'Johnson', '', '', '', '', NULL, NULL, NULL, '123', '', '', '', '', '', '', '', '', '', '', 0, '-', '', 0, '-', '', '', '', '', '', NULL, NULL, '2020-11-30 16:41:11', '2020-11-30 16:41:43', '0000-00-00 00:00:00', NULL, NULL, NULL),
(0, 2, 'Jack', '', 'Wolfskin', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', 0, '-', '', 0, '-', '', '', '', '', '', NULL, NULL, '2020-11-30 16:43:00', '2020-11-30 16:43:00', '0000-00-00 00:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `address_in_groups`
--

CREATE TABLE `address_in_groups` (
  `domain_id` int(9) UNSIGNED NOT NULL DEFAULT '0',
  `id` int(9) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(9) UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deprecated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `address_in_groups`
--

INSERT INTO `address_in_groups` (`domain_id`, `id`, `group_id`, `created`, `modified`, `deprecated`) VALUES
(0, 2, 1, '2020-11-30 16:43:00', '2020-11-30 16:43:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `group_list`
--

CREATE TABLE `group_list` (
  `domain_id` int(9) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(9) UNSIGNED NOT NULL,
  `group_parent_id` int(9) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deprecated` datetime NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT '',
  `group_header` mediumtext NOT NULL,
  `group_footer` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `group_list`
--

INSERT INTO `group_list` (`domain_id`, `group_id`, `group_parent_id`, `created`, `modified`, `deprecated`, `group_name`, `group_header`, `group_footer`) VALUES
(0, 1, NULL, NULL, NULL, '0000-00-00 00:00:00', 'jacjk group', '', ''),
(0, 2, NULL, NULL, NULL, '0000-00-00 00:00:00', 'group', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `month_lookup`
--

CREATE TABLE `month_lookup` (
  `bmonth` varchar(50) NOT NULL DEFAULT '',
  `bmonth_short` char(3) NOT NULL DEFAULT '',
  `bmonth_num` int(2) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `month_lookup`
--

INSERT INTO `month_lookup` (`bmonth`, `bmonth_short`, `bmonth_num`) VALUES
('', '', 0),
('January', 'Jan', 1),
('February', 'Feb', 2),
('March', 'Mar', 3),
('April', 'Apr', 4),
('May', 'May', 5),
('June', 'Jun', 6),
('July', 'Jul', 7),
('August', 'Aug', 8),
('September', 'Sep', 9),
('October', 'Oct', 10),
('November', 'Nov', 11),
('December', 'Dec', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `domain_id` int(9) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(128) NOT NULL,
  `md5_pass` char(128) NOT NULL,
  `password_hint` varchar(255) NOT NULL DEFAULT '',
  `sso_facebook_uid` varchar(255) DEFAULT NULL,
  `sso_google_uid` varchar(255) DEFAULT NULL,
  `sso_live_uid` varchar(255) DEFAULT NULL,
  `sso_yahoo_uid` varchar(255) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `address1` varchar(100) NOT NULL DEFAULT '',
  `address2` varchar(100) NOT NULL DEFAULT '',
  `city` varchar(80) NOT NULL DEFAULT '',
  `state` varchar(20) NOT NULL DEFAULT '',
  `zip` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `master_code` char(128) NOT NULL,
  `confirmation_code` char(128) DEFAULT NULL,
  `pass_reset_code` char(128) DEFAULT NULL,
  `status` char(128) NOT NULL DEFAULT 'NEW' COMMENT 'New, Ready, Blocked',
  `trials` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deprecated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addressbook`
--
ALTER TABLE `addressbook`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `address_in_groups`
--
ALTER TABLE `address_in_groups`
  ADD PRIMARY KEY (`group_id`,`id`);

--
-- Индексы таблицы `group_list`
--
ALTER TABLE `group_list`
  ADD PRIMARY KEY (`group_id`);

--
-- Индексы таблицы `month_lookup`
--
ALTER TABLE `month_lookup`
  ADD PRIMARY KEY (`bmonth_num`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `addressbook`
--
ALTER TABLE `addressbook`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `group_list`
--
ALTER TABLE `group_list`
  MODIFY `group_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
