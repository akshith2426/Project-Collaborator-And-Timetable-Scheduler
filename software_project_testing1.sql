-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 08:44 PM
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
-- Database: `software_project_testing1`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatroommembers`
--

CREATE TABLE `chatroommembers` (
  `chatRoomMemberId` int(11) NOT NULL,
  `chatRoomId` int(11) NOT NULL,
  `regno` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatroommembers`
--

INSERT INTO `chatroommembers` (`chatRoomMemberId`, `chatRoomId`, `regno`) VALUES
(17, 22, '19BCE0100'),
(18, 22, '19BCE0865'),
(19, 22, '19BCE0095'),
(20, 22, '19BCE0950'),
(21, 23, '17BCE0095'),
(22, 23, '19BCE0865'),
(23, 23, '19BCE0095'),
(24, 23, '19BCE0950');

-- --------------------------------------------------------

--
-- Table structure for table `chatrooms`
--

CREATE TABLE `chatrooms` (
  `chatRoomId` int(11) NOT NULL,
  `regno` varchar(9) NOT NULL,
  `projectId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatrooms`
--

INSERT INTO `chatrooms` (`chatRoomId`, `regno`, `projectId`) VALUES
(22, '19BCE0100', 10),
(23, '17BCE0095', 10);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message` text NOT NULL,
  `time` varchar(256) NOT NULL,
  `user` varchar(256) NOT NULL,
  `chatRoomId` int(11) NOT NULL,
  `messageNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message`, `time`, `user`, `chatRoomId`, `messageNumber`) VALUES
('Yo Broo!!!', '10:15 pm', 'sureshkumar', 22, 28),
('Suresh here!', '10:15 pm', 'sureshkumar', 22, 29),
('Yoo ballya in the house!!', '10:45 pm', 'balayya', 23, 30),
('JB', '10:45 pm', 'balayya', 23, 31),
('This is from Sampreeth', '10:58 pm', 'sampreeth', 22, 32),
('for suresh kumar', '10:58 pm', 'sampreeth', 22, 33),
('as collab', '10:58 pm', 'sampreeth', 22, 34),
('Whats up broo!', '10:59 pm', 'sureshkumar', 22, 35),
('Hi guys Akshith here!!', '11:36 pm', 'akshith', 24, 36),
('Hi akshith sam here', '11:38 pm', 'sampreeth', 24, 37),
('Hi teja Here', '11:52 pm', 'saiteja', 25, 38),
('Yo bro', '11:52 pm', 'saiteja', 25, 39);

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
('akhil', 'Testing Project 1', 'Testing Project 1', 'ML', 'MTCNN', '2021-05-24', 9, '14th May 2021 at 22:9'),
('akhil', 'Testing Project 2', 'Testing Project 2', 'Backend', 'Node JS', '2021-05-31', 10, '14th May 2021 at 22:11'),
('balayya', 'Project 3', 'Project 3', 'FrontEnd', 'Figma\r\nCSS3', '2021-05-31', 12, '14th May 2021 at 23:32');

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
(15, '19BCE0865', 10, 0),
(16, '19BCE0095', 10, 0),
(17, '19BCE0950', 10, 1),
(21, '19BCE0865', 12, 0),
(22, '19BCE0950', 12, 0),
(23, '17BCE0095', 12, 1);

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
(51, '58', '19BCE0100', ''),
(52, '11', '18BCE0247', ''),
(53, '12', '18BCE0247', ''),
(54, '14', '18BCE0247', ''),
(55, '15', '18BCE0247', ''),
(56, '16', '18BCE0247', ''),
(57, '17', '18BCE0247', ''),
(58, '18', '18BCE0247', ''),
(59, '21', '18BCE0247', ''),
(60, '22', '18BCE0247', ''),
(61, '24', '18BCE0247', ''),
(62, '27', '18BCE0247', ''),
(63, '28', '18BCE0247', ''),
(64, '31', '18BCE0247', ''),
(65, '32', '18BCE0247', ''),
(66, '34', '18BCE0247', ''),
(67, '37', '18BCE0247', ''),
(68, '38', '18BCE0247', ''),
(69, '41', '18BCE0247', ''),
(70, '42', '18BCE0247', ''),
(71, '47', '18BCE0247', ''),
(72, '48', '18BCE0247', ''),
(73, '51', '18BCE0247', ''),
(74, '52', '18BCE0247', ''),
(75, '55', '18BCE0247', ''),
(76, '56', '18BCE0247', ''),
(77, '57', '18BCE0247', ''),
(78, '58', '18BCE0247', '');

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
('17BCE0095', 'balayya', 'balayya', 'balayya', 0, '', '', '', '', ''),
('18BCE0247', 'rishith', 'rishith', 'rishith', 0, 'signup page 1.png', 'Backend Development', 'Figma', 'Sockets', 'Flask'),
('19BCE0095', 'Akshith', 'akshith', 'akshith', 0, 'Screenshot (122).png', 'Backend Developement', 'ReactJS', 'MongoDB', 'NodeJS'),
('19BCE0100', 'sureshkumar', 'sureshkumar', 'sureshkumar', 1, '', '', '', '', ''),
('19BCE0293', 'Sai Teja', 'saiteja', 'saiteja', 0, '', '', '', '', ''),
('19BCE0865', 'sampreeth', 'sampreeth', 'sampreeth', 0, '10.jpg', 'Backend Development', 'NodeJS', 'Adobe XD', 'Illustrator'),
('19BCE0950', 'akhil domakonda', 'akhil', 'akhil', 1, '800px-Ada_Lovelace_portrait.jpg', 'Backend Development', 'NodeJS', 'Sockets', 'Flask');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatroommembers`
--
ALTER TABLE `chatroommembers`
  ADD PRIMARY KEY (`chatRoomMemberId`),
  ADD KEY `regno` (`regno`),
  ADD KEY `chatRoomId` (`chatRoomId`);

--
-- Indexes for table `chatrooms`
--
ALTER TABLE `chatrooms`
  ADD PRIMARY KEY (`chatRoomId`),
  ADD KEY `chatrooms_ibfk_1` (`regno`),
  ADD KEY `chatrooms_ibfk_2` (`projectId`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageNumber`);

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
-- AUTO_INCREMENT for table `chatroommembers`
--
ALTER TABLE `chatroommembers`
  MODIFY `chatRoomMemberId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `chatrooms`
--
ALTER TABLE `chatrooms`
  MODIFY `chatRoomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `projectstable`
--
ALTER TABLE `projectstable`
  MODIFY `projectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teammembers`
--
ALTER TABLE `teammembers`
  MODIFY `teamMemberID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  MODIFY `freeSlotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatroommembers`
--
ALTER TABLE `chatroommembers`
  ADD CONSTRAINT `chatroommembers_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `users_table` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatroommembers_ibfk_2` FOREIGN KEY (`chatRoomId`) REFERENCES `chatrooms` (`chatRoomId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatrooms`
--
ALTER TABLE `chatrooms`
  ADD CONSTRAINT `chatrooms_ibfk_2` FOREIGN KEY (`projectId`) REFERENCES `projectstable` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE;

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
