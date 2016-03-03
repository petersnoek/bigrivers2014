-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 03 mrt 2016 om 13:35
-- Serverversie: 5.7.11
-- PHP-versie: 5.5.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bigrivers2014`
--
CREATE DATABASE IF NOT EXISTS `bigrivers2014` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bigrivers2014`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artist`
--

CREATE TABLE `artist` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `ytchannel` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `event`
--

CREATE TABLE `event` (
  `id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` varchar(500) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `image` varchar(255) NOT NULL,
  `start` varchar(100) NOT NULL,
  `end` varchar(100) NOT NULL,
  `date` int(11) NOT NULL,
  `event_date` varchar(20) NOT NULL,
  `display_date` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `ticket` int(1) NOT NULL COMMENT 'Option iif event needs tickets 1 is true 0 is false',
  `location` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genre_cat`
--

CREATE TABLE `genre_cat` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `news`
--

CREATE TABLE `news` (
  `id` int(255) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` longtext,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `performance`
--

CREATE TABLE `performance` (
  `id` int(11) NOT NULL,
  `description` longtext,
  `start` varchar(100) NOT NULL,
  `end` varchar(100) NOT NULL,
  `stage_id` int(255) NOT NULL,
  `performance_date` varchar(10) NOT NULL,
  `artist_id` int(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `post`
--

CREATE TABLE `post` (
  `id` int(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `title` varchar(128) NOT NULL,
  `body` longtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sponsor`
--

CREATE TABLE `sponsor` (
  `id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `priority` int(1) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `stage`
--

CREATE TABLE `stage` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `color_code` varchar(7) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL COMMENT 'Unique user id',
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(512) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT 'If user is active 1 if user is blocked 0',
  `created` int(11) NOT NULL COMMENT 'Timestamp when the user was created'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `genre_cat`
--
ALTER TABLE `genre_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `event`
--
ALTER TABLE `event`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT voor een tabel `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT voor een tabel `genre_cat`
--
ALTER TABLE `genre_cat`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT voor een tabel `news`
--
ALTER TABLE `news`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `performance`
--
ALTER TABLE `performance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT voor een tabel `post`
--
ALTER TABLE `post`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT voor een tabel `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT voor een tabel `stage`
--
ALTER TABLE `stage`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'Unique user id', AUTO_INCREMENT=28;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
