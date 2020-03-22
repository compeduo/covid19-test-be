-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: md42.wedos.net:3306
-- Generation Time: Mar 22, 2020 at 11:15 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `d215516_covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE IF NOT EXISTS `form` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `phone` varchar(20) COLLATE utf8_czech_ci NOT NULL,
                                      `fever` tinyint(1) NOT NULL,
                                      `long_fever` tinyint(1) NOT NULL,
                                      `breathing` tinyint(1) NOT NULL,
                                      `cough` tinyint(1) NOT NULL,
                                      `old` tinyint(1) NOT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`id`, `phone`, `fever`, `long_fever`, `breathing`, `cough`, `old`) VALUES
(1, '608747877', 0, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
