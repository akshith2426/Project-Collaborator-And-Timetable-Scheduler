-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2021 at 12:04 PM
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
-- Database: `software_project_testing2`
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
(27, 9, '19BCE0246'),
(28, 9, '20BME0095'),
(29, 9, '19BCE0100'),
(30, 9, '19BCE0095'),
(35, 11, '19BBS0198'),
(36, 11, '20BME0095'),
(37, 11, '19BCE0100'),
(38, 11, '19BCE0095'),
(39, 12, '19BBS0198'),
(40, 12, '19BCE0095'),
(41, 12, '19BCE0100'),
(42, 12, '20BME0095'),
(51, 15, '19BCE0100'),
(52, 15, '17BCE0095'),
(53, 15, '19BCE0095'),
(54, 15, '19BCE0865');

-- --------------------------------------------------------

--
-- Table structure for table `chatrooms`
--

CREATE TABLE `chatrooms` (
  `chatRoomId` int(11) NOT NULL,
  `regno` varchar(9) NOT NULL,
  `requirementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatrooms`
--

INSERT INTO `chatrooms` (`chatRoomId`, `regno`, `requirementId`) VALUES
(9, '19BCE0246', 3),
(11, '19BBS0198', 6),
(12, '19BBS0198', 7),
(15, '19BCE0100', 9);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageNumber` int(11) NOT NULL,
  `time` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `chatRoomId` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageNumber`, `time`, `user`, `chatRoomId`, `message`) VALUES
(22, '9:10 am', 'cricka', 11, 'hello akshith'),
(23, '9:10 am', 'cricka', 11, 'I am a figma designer'),
(24, '9:11 am', 'akshith', 11, 'that\'s great cricka'),
(25, '9:11 am', 'akshith', 11, 'we will get back to you soon'),
(26, '9:14 am', 'cricka', 12, 'Hello Mam/Sir'),
(27, '9:14 am', 'cricka', 12, 'I am interested into this project'),
(28, '9:14 am', 'manasa', 12, 'that\'s great '),
(29, '9:15 am', 'manasa', 12, 'we will get back to you soon'),
(30, '10:22 am', 'cricka', 11, 'thanks akshith'),
(35, '11:42 am', 'sureshkumar', 15, 'hello here eveyone'),
(36, '11:42 am', 'sureshkumar', 15, 'I am interested to be part of this');

-- --------------------------------------------------------

--
-- Table structure for table `projectrequirement`
--

CREATE TABLE `projectrequirement` (
  `requirementId` int(11) NOT NULL,
  `vacancyRole` varchar(255) NOT NULL,
  `requiredSkillSet` varchar(255) NOT NULL,
  `deadline` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `projectId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectrequirement`
--

INSERT INTO `projectrequirement` (`requirementId`, `vacancyRole`, `requiredSkillSet`, `deadline`, `timestamp`, `projectId`) VALUES
(3, 'Software Developer Engineer', 'Development and Testing using Seleneium', '2021-05-30', '24th May 2021 at 13:29', 3),
(6, 'UI/UX Designer', 'figma\r\nillustrator', '2021-06-10', '25th May 2021 at 1:26', 3),
(7, 'Backend Engineer', 'Django Development ', '2021-05-30', '25th May 2021 at 9:5', 2),
(9, 'Software Developer Engineer', 'Engineering Graduate\r\nTesting Techniques', '2021-05-28', '25th May 2021 at 11:27', 5),
(10, 'UI/UX Designer', 'figma Adobe', '2021-05-31', '25th May 2021 at 12:8', 6),
(11, 'Backend Engineer', 'Nodejs Docker Azure', '2021-06-30', '25th May 2021 at 12:8', 6),
(12, 'Software Developer Engineer', 'figma', '2021-05-30', '25th May 2021 at 12:8', 4),
(13, 'Testing Role', 'Selenium Testing\r\nDeveloper Tool Testing', '2021-05-29', '25th May 2021 at 15:27', 3);

-- --------------------------------------------------------

--
-- Table structure for table `projectstable`
--

CREATE TABLE `projectstable` (
  `projectId` int(11) NOT NULL,
  `projectTitle` varchar(255) NOT NULL,
  `projectDescription` varchar(255) NOT NULL,
  `projectLeader` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectstable`
--

INSERT INTO `projectstable` (`projectId`, `projectTitle`, `projectDescription`, `projectLeader`) VALUES
(2, 'Netflix Clone', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.', 'manasa'),
(3, 'GITHUB Clone', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis,', 'akshith'),
(4, 'Twitter Clone', 'Twitter is an American microblogging and social networking service on which users post and interact with messages known as \"tweets\". Registered users can post, like, and retweet tweets, but unregistered users can only read them.', 'sureshkumar'),
(5, 'Google Clone', 'Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, a search engine, cloud computing, software, and hardware.', 'sampreeth'),
(6, 'Instagram Clone', 'Instagram is an American photo and video sharing social networking service created by Kevin Systrom and Mike Krieger. In April 2012, Facebook acquired the service for approximately US$1 billion in cash and stock.', 'billa');

-- --------------------------------------------------------

--
-- Table structure for table `teammembers`
--

CREATE TABLE `teammembers` (
  `teamMemberID` int(10) NOT NULL,
  `regno` varchar(10) NOT NULL,
  `projectId` int(11) NOT NULL,
  `memberStatus` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teammembers`
--

INSERT INTO `teammembers` (`teamMemberID`, `regno`, `projectId`, `memberStatus`) VALUES
(1, '19BCE0095', 2, 0),
(2, '19BCE0100', 2, 0),
(3, '20BME0095', 2, 1),
(4, '20BME0095', 3, 0),
(5, '19BCE0100', 3, 0),
(6, '19BCE0095', 3, 1),
(7, '19BCE0095', 4, 0),
(8, '19BCE0865', 4, 0),
(9, '19BCE0100', 4, 1),
(10, '17BCE0095', 5, 0),
(11, '19BCE0095', 5, 0),
(12, '19BCE0865', 5, 1),
(13, '19BBS0198', 4, 0),
(14, '19BCE0293', 4, 0),
(15, '19BCE0095', 6, 0),
(16, '19BCE0865', 6, 0),
(17, '19BCE0950', 6, 0),
(18, '16BCE0095', 6, 1),
(19, '19BCE0100', 6, 0);

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
(78, '58', '18BCE0247', ''),
(79, '11', '20BME0095', ''),
(80, '12', '20BME0095', ''),
(81, '13', '20BME0095', ''),
(82, '17', '20BME0095', ''),
(83, '18', '20BME0095', ''),
(84, '21', '20BME0095', ''),
(85, '26', '20BME0095', ''),
(86, '27', '20BME0095', ''),
(87, '31', '20BME0095', ''),
(88, '32', '20BME0095', ''),
(89, '33', '20BME0095', ''),
(90, '43', '20BME0095', ''),
(91, '45', '20BME0095', ''),
(92, '46', '20BME0095', ''),
(93, '47', '20BME0095', ''),
(94, '48', '20BME0095', ''),
(95, '51', '20BME0095', ''),
(96, '53', '20BME0095', ''),
(97, '58', '20BME0095', ''),
(98, '11', '19BCE0095', ''),
(99, '12', '19BCE0095', ''),
(100, '13', '19BCE0095', ''),
(101, '14', '19BCE0095', ''),
(102, '16', '19BCE0095', ''),
(103, '17', '19BCE0095', ''),
(104, '18', '19BCE0095', ''),
(105, '21', '19BCE0095', ''),
(106, '22', '19BCE0095', ''),
(107, '23', '19BCE0095', ''),
(108, '26', '19BCE0095', ''),
(109, '27', '19BCE0095', ''),
(110, '28', '19BCE0095', ''),
(111, '31', '19BCE0095', ''),
(112, '32', '19BCE0095', ''),
(113, '33', '19BCE0095', ''),
(114, '35', '19BCE0095', ''),
(115, '37', '19BCE0095', ''),
(116, '38', '19BCE0095', ''),
(117, '41', '19BCE0095', ''),
(118, '42', '19BCE0095', ''),
(119, '43', '19BCE0095', ''),
(120, '44', '19BCE0095', ''),
(121, '51', '19BCE0095', ''),
(122, '52', '19BCE0095', ''),
(123, '53', '19BCE0095', ''),
(124, '54', '19BCE0095', ''),
(125, '55', '19BCE0095', ''),
(126, '56', '19BCE0095', ''),
(127, '57', '19BCE0095', ''),
(128, '58', '19BCE0095', ''),
(129, '15', '16BCE0095', ''),
(130, '16', '16BCE0095', ''),
(131, '21', '16BCE0095', 'dhobi'),
(132, '23', '16BCE0095', ''),
(133, '26', '16BCE0095', ''),
(134, '28', '16BCE0095', ''),
(135, '32', '16BCE0095', ''),
(136, '33', '16BCE0095', ''),
(137, '35', '16BCE0095', ''),
(138, '37', '16BCE0095', ''),
(139, '41', '16BCE0095', ''),
(140, '43', '16BCE0095', ''),
(141, '47', '16BCE0095', ''),
(142, '48', '16BCE0095', ''),
(143, '52', '16BCE0095', ''),
(144, '54', '16BCE0095', ''),
(145, '56', '16BCE0095', ''),
(146, '57', '16BCE0095', '');

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
('16BCE0095', 'Billa', 'billa', 'billa', 0, 'Group 2.png', 'Backend Development', 'NodeJS', 'Adobe XD', 'Illustrator'),
('17BCE0095', 'balayya', 'balayya', 'balayya', 0, '', '', '', '', ''),
('18BCE0247', 'rishith', 'rishith', 'rishith', 0, 'signup page 1.png', 'Backend Development', 'Figma', 'Sockets', 'Flask'),
('19BBS0198', 'cricka', 'cricka', 'cricka', 0, '', '', '', '', ''),
('19BCE0095', 'Akshith', 'akshith', 'akshith', 0, 'Screenshot (122).png', 'Backend Developement', 'ReactJS', 'MongoDB', 'NodeJS'),
('19BCE0100', 'sureshkumar', 'sureshkumar', 'sureshkumar', 1, '', '', '', '', ''),
('19BCE0246', 'kaushik', 'kaushik', 'kaushik', 0, '', '', '', '', ''),
('19BCE0293', 'Sai Teja', 'saiteja', 'saiteja', 0, '', '', '', '', ''),
('19BCE0865', 'sampreeth', 'sampreeth', 'sampreeth', 0, '10.jpg', 'Backend Development', 'NodeJS', 'Adobe XD', 'Illustrator'),
('19BCE0950', 'akhil domakonda', 'akhil', 'akhil', 1, '800px-Ada_Lovelace_portrait.jpg', 'Backend Development', 'NodeJS', 'Sockets', 'Flask'),
('20BME0095', 'manasa', 'manasa', 'manasa', 0, 'person3.jpg', 'Backend Development', 'NodeJS', 'Adobe XD', 'Illustrator');

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
  ADD KEY `requirementId` (`requirementId`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageNumber`),
  ADD KEY `chatRoomId` (`chatRoomId`);

--
-- Indexes for table `projectrequirement`
--
ALTER TABLE `projectrequirement`
  ADD PRIMARY KEY (`requirementId`),
  ADD KEY `projectId` (`projectId`);

--
-- Indexes for table `projectstable`
--
ALTER TABLE `projectstable`
  ADD PRIMARY KEY (`projectId`);

--
-- Indexes for table `teammembers`
--
ALTER TABLE `teammembers`
  ADD PRIMARY KEY (`teamMemberID`),
  ADD KEY `projectId` (`projectId`),
  ADD KEY `regno` (`regno`);

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
  MODIFY `chatRoomMemberId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `chatrooms`
--
ALTER TABLE `chatrooms`
  MODIFY `chatRoomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `projectrequirement`
--
ALTER TABLE `projectrequirement`
  MODIFY `requirementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projectstable`
--
ALTER TABLE `projectstable`
  MODIFY `projectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teammembers`
--
ALTER TABLE `teammembers`
  MODIFY `teamMemberID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  MODIFY `freeSlotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

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
  ADD CONSTRAINT `chatrooms_ibfk_1` FOREIGN KEY (`requirementId`) REFERENCES `projectrequirement` (`requirementId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`chatRoomId`) REFERENCES `chatrooms` (`chatRoomId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projectrequirement`
--
ALTER TABLE `projectrequirement`
  ADD CONSTRAINT `projectrequirement_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `projectstable` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teammembers`
--
ALTER TABLE `teammembers`
  ADD CONSTRAINT `teammembers_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `projectstable` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teammembers_ibfk_2` FOREIGN KEY (`regno`) REFERENCES `users_table` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timetablescheduler`
--
ALTER TABLE `timetablescheduler`
  ADD CONSTRAINT `timetablescheduler_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `users_table` (`regno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
