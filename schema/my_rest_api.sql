-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Feb 16, 2016 at 08:15 PM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_rest_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `c_utilization`
--

CREATE TABLE `c_utilization` (
`c_id` int(11) NOT NULL,
  `c_cpu` float NOT NULL,
  `c_mem` float NOT NULL,
  `c_cdrive` float NOT NULL,
  `c_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_utilization`
--

INSERT INTO `c_utilization` (`c_id`, `c_cpu`, `c_mem`, `c_cdrive`, `c_date`) VALUES
(1, 95.3, 24, 67.77, '2016-01-27 01:18:50'),
(2, 90.2, 24.2, 66.77, '2016-01-27 01:18:50'),
(3, 95.3, 24, 67.77, '2016-01-27 01:21:55'),
(4, 90.2, 24.2, 66.77, '2016-01-27 01:21:55'),
(5, 99.9, 24.2, 66.79, '2016-01-27 01:21:55'),
(6, 47.2, 24.2, 66.82, '2016-01-27 01:21:55'),
(7, 93.22, 24.22, 66.75, '2016-01-27 01:21:55'),
(8, 33, 44, 67.99, '2016-01-27 01:35:57'),
(9, 95.3, 24, 67.77, '2016-01-27 02:18:50'),
(10, 33, 44, 66, '2016-01-27 01:47:10'),
(11, 44, 22.3, 12.4, '2016-02-10 11:47:30'),
(12, 44, 22.3, 12.4, '2016-02-10 12:31:40'),
(13, 44, 22.3, 12.4, '2016-02-14 18:46:51'),
(14, 64, 22.3, 12.4, '2016-02-14 18:48:44'),
(15, 64, 22.3, 12.4, '2016-02-14 19:22:57'),
(16, 74, 62.3, 18.4, '2016-02-14 19:24:34'),
(17, 74, 62.3, 18.4, '2016-02-14 19:36:30'),
(18, 74, 62.3, 18.4, '2016-02-14 23:50:01'),
(19, 100, 62.3, 18.4, '2016-02-17 00:49:05'),
(20, 100, 62.3, 18.4, '2016-02-17 00:49:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `c_utilization`
--
ALTER TABLE `c_utilization`
 ADD PRIMARY KEY (`c_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c_utilization`
--
ALTER TABLE `c_utilization`
MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
