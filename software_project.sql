-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2021 at 08:14 AM
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
  `id` int(11) NOT NULL,
  `task` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timetablescheduler`
--

INSERT INTO `timetablescheduler` (`freeSlotId`, `freeSlot`, `id`, `task`) VALUES
(283, '11', 5, ''),
(284, '12', 5, ''),
(285, '13', 5, ''),
(286, '16', 5, ''),
(287, '17', 5, ''),
(288, '18', 5, ''),
(289, '22', 5, ''),
(290, '23', 5, ''),
(291, '24', 5, ''),
(292, '28', 5, ''),
(293, '32', 5, ''),
(294, '36', 5, ''),
(295, '38', 5, ''),
(296, '42', 5, ''),
(297, '43', 5, ''),
(298, '44', 5, ''),
(299, '47', 5, ''),
(300, '48', 5, ''),
(301, '52', 5, ''),
(302, '53', 5, ''),
(303, '54', 5, ''),
(304, '57', 5, ''),
(305, '58', 5, ''),
(306, '11', 6, 'dhobi'),
(307, '12', 6, ''),
(308, '13', 6, ''),
(309, '15', 6, ''),
(310, '16', 6, ''),
(311, '17', 6, ''),
(312, '18', 6, ''),
(313, '21', 6, ''),
(314, '22', 6, ''),
(315, '25', 6, ''),
(316, '27', 6, ''),
(317, '28', 6, ''),
(318, '31', 6, 'gym'),
(319, '32', 6, ''),
(320, '35', 6, ''),
(321, '37', 6, ''),
(322, '38', 6, 'gym'),
(323, '41', 6, ''),
(324, '42', 6, ''),
(325, '43', 6, ''),
(326, '46', 6, ''),
(327, '47', 6, ''),
(328, '48', 6, ''),
(329, '51', 6, ''),
(330, '52', 6, ''),
(331, '53', 6, ''),
(332, '55', 6, ''),
(333, '56', 6, ''),
(334, '57', 6, ''),
(335, '58', 6, '');

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
  `batch` int(2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `skillset` varchar(250) NOT NULL,
  `subdomain1` varchar(250) NOT NULL,
  `subdomain2` varchar(250) NOT NULL,
  `subdomain3` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`id`, `fullname`, `username`, `password`, `regno`, `batch`, `image`, `skillset`, `subdomain1`, `subdomain2`, `subdomain3`) VALUES
(5, 'Akshith', 'akshith', 'akshith', '19BCE0001', 1, '', 'Backend Developments', 'NodeJS', 'Sockets', 'Flask'),
(6, 'sampreeth', 'sampreeth', 'sampreeth', '19BCE0865', 0, 'logo192.png', '', '', '', ''),
(7, 'a vasa', 'avasa', 'avasa', '3242323', 1, '', '', '', '', ''),
(8, 'siamvit', 'siamvit', 'siamvit', '19BCE0100', 0, 'logo512.png', 'Front End Developer', 'Figma', 'Adobe XD', 'Illustrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  ADD PRIMARY KEY (`freeSlotId`),
  ADD KEY `id` (`id`);

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
  MODIFY `freeSlotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  ADD CONSTRAINT `timetablescheduler_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users_table` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
