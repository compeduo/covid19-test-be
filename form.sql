-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Počítač: md42.wedos.net:3306
-- Vygenerováno: Stř 18. bře 2020, 19:42
-- Verze serveru: 10.1.37-MariaDB
-- Verze PHP: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `d215516_covid`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `form`
--

CREATE TABLE IF NOT EXISTS `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `surname` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `age` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `phone` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `street` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `zip` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `city` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
