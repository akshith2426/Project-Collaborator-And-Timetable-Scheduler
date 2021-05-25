-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2021 at 08:28 AM
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
-- Database: `software_projecttesting`
--

-- --------------------------------------------------------

--
-- Table structure for table `projectstable`
--

CREATE TABLE `projectstable` (
  `projectLeader` varchar(150) NOT NULL,
  `projectTitle` varchar(255) NOT NULL,
  `projectDescription` varchar(255) NOT NULL,
  `vacancyRole` varchar(260) NOT NULL,
  `requiredSkillSet` varchar(260) NOT NULL,
  `deadline` varchar(100) NOT NULL,
  `projectId` int(11) NOT NULL,
  `timestamp` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectstable`
--

INSERT INTO `projectstable` (`projectLeader`, `projectTitle`, `projectDescription`, `vacancyRole`, `requiredSkillSet`, `deadline`, `projectId`, `timestamp`) VALUES
('akshith', 'Covid-tracker', 'Loreum ipsum loreum ipsum', 'Software Developer Engineer', 'Figma', '2021-05-29', 1, '11th May 2021 at 1:11'),
('akshith', 'GITHUB Clone', 'loreum', 'UI/UX Designer', 'sdgdfgd', '2021-05-23', 2, '11th May 2021 at 1:28'),
('sampreeth', 'songs classifier', 'loreum ipsum', 'Software Developer Engineer', 'figma', '2021-05-30', 3, '11th May 2021 at 1:46'),
('akhil', 'NLP based REACT chatbot', 'A table may have multiple foreign keys, and each foreign key can have a different parent table. Each foreign key is enforced independently by the database system. Therefore, cascading relationships between tables can be established using foreign keys.', 'Software Developer Engineer', 'Machine Learning\r\nNLP\r\nTensorflow', '2021-05-21', 4, '11th May 2021 at 1:49'),
('akshith', 'Mental Health Frequency Checker', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specim', 'UI/UX Designer', 'Figma\r\nAdobde Illustrator\r\nPhotoshop', '2021-05-27', 5, '11th May 2021 at 11:19');

-- --------------------------------------------------------

--
-- Table structure for table `teammembers`
--

CREATE TABLE `teammembers` (
  `teamMemberID` int(20) NOT NULL,
  `regno` varchar(9) NOT NULL,
  `projectId` int(11) NOT NULL,
  `memberStatus` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teammembers`
--

INSERT INTO `teammembers` (`teamMemberID`, `regno`, `projectId`, `memberStatus`) VALUES
(3, '19BCE0865', 4, 0),
(4, '19BCE0095', 4, 0),
(5, '19BCE0950', 4, 1),
(6, '19BCE0865', 5, 0),
(7, '19BCE0100', 5, 0),
(8, '19BCE0095', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `timetablescheduler`
--

CREATE TABLE `timetablescheduler` (
  `freeSlotId` int(11) NOT NULL,
  `freeSlot` varchar(256) NOT NULL,
  `regno` varchar(9) NOT NULL,
  `task` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timetablescheduler`
--

INSERT INTO `timetablescheduler` (`freeSlotId`, `freeSlot`, `regno`, `task`) VALUES
(1, '11', '19BCE0865', ''),
(2, '15', '19BCE0865', ''),
(3, '16', '19BCE0865', ''),
(4, '17', '19BCE0865', ''),
(5, '18', '19BCE0865', ''),
(6, '21', '19BCE0865', 'dhobi'),
(7, '25', '19BCE0865', ''),
(8, '26', '19BCE0865', 'gym'),
(9, '27', '19BCE0865', ''),
(10, '28', '19BCE0865', ''),
(11, '31', '19BCE0865', ''),
(12, '41', '19BCE0865', ''),
(13, '45', '19BCE0865', ''),
(14, '46', '19BCE0865', ''),
(15, '47', '19BCE0865', ''),
(16, '48', '19BCE0865', ''),
(17, '51', '19BCE0865', ''),
(18, '52', '19BCE0865', ''),
(19, '53', '19BCE0865', ''),
(20, '54', '19BCE0865', ''),
(33, '13', '19BCE0100', ''),
(34, '16', '19BCE0100', ''),
(35, '17', '19BCE0100', ''),
(36, '23', '19BCE0100', ''),
(37, '26', '19BCE0100', ''),
(38, '27', '19BCE0100', ''),
(39, '28', '19BCE0100', ''),
(40, '33', '19BCE0100', ''),
(41, '34', '19BCE0100', ''),
(42, '35', '19BCE0100', ''),
(43, '36', '19BCE0100', ''),
(44, '44', '19BCE0100', ''),
(45, '46', '19BCE0100', ''),
(46, '47', '19BCE0100', ''),
(47, '48', '19BCE0100', ''),
(48, '51', '19BCE0100', ''),
(49, '54', '19BCE0100', ''),
(50, '57', '19BCE0100', ''),
(51, '58', '19BCE0100', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `regno` varchar(9) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `batch` int(2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `skillset` varchar(255) NOT NULL,
  `subdomain1` varchar(250) NOT NULL,
  `subdomain2` varchar(250) NOT NULL,
  `subdomain3` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`regno`, `fullname`, `username`, `password`, `batch`, `image`, `skillset`, `subdomain1`, `subdomain2`, `subdomain3`) VALUES
('19BCE0095', 'Akshith', 'akshith', 'akshith', 0, '', '', '', '', ''),
('19BCE0100', 'sureshkumar', 'sureshkumar', 'sureshkumar', 1, '', '', '', '', ''),
('19BCE0865', 'sampreeth', 'sampreeth', 'sampreeth', 0, '10.jpg', 'Backend Development', 'NodeJS', 'Adobe XD', 'Illustrator'),
('19BCE0950', 'akhil domakonda', 'akhil', 'akhil', 1, '800px-Ada_Lovelace_portrait.jpg', 'Backend Development', 'NodeJS', 'Sockets', 'Flask');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `projectstable`
--
ALTER TABLE `projectstable`
  ADD PRIMARY KEY (`projectId`),
  ADD UNIQUE KEY `projectId` (`projectId`);

--
-- Indexes for table `teammembers`
--
ALTER TABLE `teammembers`
  ADD PRIMARY KEY (`teamMemberID`),
  ADD KEY `regno` (`regno`),
  ADD KEY `projectId` (`projectId`);

--
-- Indexes for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  ADD PRIMARY KEY (`freeSlotId`),
  ADD KEY `regno` (`regno`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`regno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projectstable`
--
ALTER TABLE `projectstable`
  MODIFY `projectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teammembers`
--
ALTER TABLE `teammembers`
  MODIFY `teamMemberID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  MODIFY `freeSlotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teammembers`
--
ALTER TABLE `teammembers`
  ADD CONSTRAINT `teammembers_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `users_table` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teammembers_ibfk_2` FOREIGN KEY (`projectId`) REFERENCES `projectstable` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  ADD CONSTRAINT `timetablescheduler_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `users_table` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
