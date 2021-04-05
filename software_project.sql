-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2021 at 10:15 PM
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
(286, '13', 2),
(287, '14', 2),
(288, '15', 2),
(289, '16', 2),
(290, '17', 2),
(291, '18', 2),
(292, '21', 2),
(293, '22', 2),
(294, '23', 2),
(295, '24', 2),
(296, '25', 2),
(297, '26', 2),
(298, '27', 2),
(299, '28', 2),
(300, '31', 2),
(301, '32', 2),
(302, '33', 2),
(303, '34', 2),
(304, '35', 2),
(305, '36', 2),
(306, '37', 2),
(307, '38', 2),
(308, '41', 2),
(309, '42', 2),
(310, '43', 2),
(311, '44', 2),
(312, '45', 2),
(313, '46', 2),
(314, '47', 2),
(315, '48', 2),
(316, '51', 2),
(317, '52', 2),
(318, '53', 2),
(319, '54', 2),
(320, '55', 2),
(321, '56', 2),
(322, '57', 2),
(323, '58', 2),
(324, '11', 1),
(325, '13', 1),
(326, '14', 1),
(327, '22', 1),
(328, '31', 1),
(329, '32', 1),
(330, '52', 1),
(331, '53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`id`, `username`, `password`) VALUES
(1, 'abc123', 'abc123'),
(2, 'akshith', 'hello123');

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
  MODIFY `freeSlotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
