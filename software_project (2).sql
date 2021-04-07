-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2021 at 05:36 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

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
(1, '12', 6, ''),
(2, '13', 6, 'Akshith'),
(3, '15', 6, 'Jai balaya'),
(4, '16', 6, ''),
(5, '17', 6, ''),
(6, '18', 6, ''),
(7, '25', 6, ''),
(8, '26', 6, ''),
(9, '27', 6, ''),
(10, '28', 6, ''),
(11, '34', 6, 'sampreeth'),
(12, '36', 6, 'Walking'),
(13, '37', 6, 'Java DA'),
(14, '38', 6, 'ALA DA'),
(15, '41', 6, ''),
(16, '42', 6, ''),
(17, '43', 6, ''),
(18, '44', 6, ''),
(19, '45', 6, ''),
(20, '47', 6, ''),
(21, '48', 6, ''),
(22, '51', 6, ''),
(23, '54', 6, ''),
(24, '55', 6, ''),
(25, '56', 6, ''),
(26, '58', 6, '');

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
(6, 'sampreeth', 'sampreeth', 'sampreeth', '19BCE0865', 0);

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
  MODIFY `freeSlotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
