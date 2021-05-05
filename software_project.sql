-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 01:06 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `software_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `timetablescheduler`
--

CREATE TABLE `timetablescheduler` (
  `freeSlotId` int(11) NOT NULL,
  `freeSlot` varchar(256) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timetablescheduler`
--

INSERT INTO `timetablescheduler` (`freeSlotId`, `freeSlot`, `id`) VALUES
(332, '12', 6),
(333, '13', 6),
(334, '14', 6),
(335, '15', 6),
(336, '16', 6),
(337, '17', 6),
(338, '18', 6),
(339, '22', 6),
(340, '23', 6),
(341, '24', 6),
(342, '25', 6),
(343, '26', 6),
(344, '27', 6),
(345, '28', 6),
(346, '32', 6),
(347, '33', 6),
(348, '34', 6),
(349, '35', 6),
(350, '36', 6),
(351, '37', 6),
(352, '38', 6),
(353, '42', 6),
(354, '43', 6),
(355, '44', 6),
(356, '45', 6),
(357, '46', 6),
(358, '47', 6),
(359, '48', 6),
(360, '52', 6),
(361, '53', 6),
(362, '54', 6),
(363, '55', 6),
(364, '56', 6),
(365, '57', 6),
(366, '58', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `regno` varchar(9) NOT NULL,
  `batch` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`id`, `fullname`, `username`, `password`, `regno`, `batch`) VALUES
(5, 'Akshith', 'akshith', 'hello123', '19BCE0095', 1),
(6, 'sampreeth', 'sampreeth', 'sampu123', '19BCE0865', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  ADD PRIMARY KEY (`freeSlotId`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  MODIFY `freeSlotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
