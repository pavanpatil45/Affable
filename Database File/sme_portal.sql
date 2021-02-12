-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2021 at 09:09 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sme_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `cancelled_consultations`
--

CREATE TABLE `cancelled_consultations` (
  `cancelid` int(11) NOT NULL,
  `questionid` int(11) DEFAULT NULL,
  `sme_email` varchar(100) DEFAULT NULL,
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryName` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryName`, `description`) VALUES
('Entrepreneurship', 'Company laws, Legal matters, Mentorship'),
('Health and Fitness', 'Physical Health, Mental Health, Therapies'),
('IT', 'Software, Hardware, Training'),
('Others', 'Psychology, art, sports'),
('RealEstate', 'Civil, Construction, Land Disputes, Residential Complex');

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `consultationId` int(11) NOT NULL,
  `clientEmailId` varchar(100) DEFAULT NULL,
  `smeEmailId` varchar(100) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `mode` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `fromTime` time DEFAULT NULL,
  `toTime` time DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `consultation_slots`
--

CREATE TABLE `consultation_slots` (
  `ID` int(11) NOT NULL,
  `sme_email` varchar(255) DEFAULT NULL,
  `client_email` varchar(100) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  `mode_of_cons` text DEFAULT NULL,
  `slot1_date` date DEFAULT NULL,
  `slot1_from_time` time DEFAULT NULL,
  `slot1_to_time` time DEFAULT NULL,
  `slot2_date` date DEFAULT NULL,
  `slot2_from_time` time DEFAULT NULL,
  `slot2_to_time` time DEFAULT NULL,
  `slot3_date` date DEFAULT NULL,
  `slot3_from_time` time DEFAULT NULL,
  `slot3_to_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `declined_requests`
--

CREATE TABLE `declined_requests` (
  `declineId` int(11) NOT NULL,
  `questionid` int(11) DEFAULT NULL,
  `sme_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password`
--

CREATE TABLE `forgot_password` (
  `email` varchar(200) NOT NULL,
  `temp_key` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sme_answer`
--

CREATE TABLE `sme_answer` (
  `id` int(11) NOT NULL,
  `questionid` int(11) DEFAULT NULL,
  `answered_by` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sme_profile`
--

CREATE TABLE `sme_profile` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `verified` int(1) NOT NULL,
  `vkey` varchar(255) DEFAULT NULL,
  `pincode` text DEFAULT NULL,
  `postal_addr` varchar(200) DEFAULT NULL,
  `categoryname` varchar(100) DEFAULT NULL,
  `experience` int(2) DEFAULT NULL,
  `skillset` varchar(200) DEFAULT NULL,
  `sme_cert` text DEFAULT NULL,
  `sme_language` text DEFAULT NULL,
  `webinars` varchar(5) DEFAULT NULL,
  `sme_fees` int(11) DEFAULT NULL,
  `mode_of_cons` text DEFAULT NULL,
  `photo_loc` text DEFAULT NULL,
  `resume_loc` text DEFAULT NULL,
  `review_rating` double DEFAULT NULL,
  `ID` int(5) NOT NULL,
  `sme_code` varchar(20) NOT NULL,
  `sme_designation` text DEFAULT NULL,
  `about_sme` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sme_profile`
--

INSERT INTO `sme_profile` (`name`, `email`, `phone`, `password`, `verified`, `vkey`, `pincode`, `postal_addr`, `categoryname`, `experience`, `skillset`, `sme_cert`, `sme_language`, `webinars`, `sme_fees`, `mode_of_cons`, `photo_loc`, `resume_loc`, `review_rating`, `ID`, `sme_code`, `sme_designation`, `about_sme`) VALUES
('pavan', 'pavanadhao685@gmail.com', 9763243782, '$2y$10$TW7Jk4jBM07b1WxlcDtTq.EdhQxCPmSxLEqKhhkzEqbcuoggB4SQC', 1, 'd796f66605147f8de7079c00b49969f3', '444444', 'abcd', 'IT', 24, 'HTML, Java, Flutter', 'NDG Linux unhatched, Python Automation.', 'Marathi, Hindi, English', 'Yes', 2000, 'Chat,Email,', '2.jpg', '', 4, 65, 'SME000065', 'Android Developer at Stewart', NULL),
('sme1', 'sme1@gmail.com', 9983634262, '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL, '435675', '12, kothrud,pune, maharashtra', 'Entrepreneurship', 4, 'Java, Python,C++', 'Google cloud, Linux unhatched', 'English, hindi', 'Yes', 700, 'Chat,Email,', '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', 'webinars.docx', 4, 1, 'SME00001', 'Android Developer at Stewart', NULL),
('sme2', 'sme2@gmail.com', 4567234567, '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL, '563213', 'At. Nandura, Maharashtra,12', 'Entrepreneurship', 2, 'Digital Marketing', 'Google Digital Marketing', 'Marathi, Hindi, English', 'Yes', 600, 'Chat,Call,Email', NULL, NULL, 4, 2, 'SME00002', NULL, NULL),
('sme3', 'sme3@gmail.com', 9876535463, '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL, '443456', '34,laxmi nagar, kondhawa, pune', 'RealEstate', 12, 'Knowledge about Economics', 'Real Estate Broker', 'Hindi, English', 'No', 1000, 'Chat,Email', NULL, NULL, 4, 3, 'SME00003', NULL, NULL),
('sme4', 'sme4@gmail.com', 9876535463, '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL, '23452', 'nandura, buldhana, nashik43', 'Entrepreneurship', 12, 'Java, Kotlin', 'Certified Android Dev', 'English, marathi, hindi', 'Yes', 1100, 'Chat,Email,', '', '', 4, 66, '', 'Android Developer at Stewart', 'wewe');

-- --------------------------------------------------------

--
-- Table structure for table `sme_webinar`
--

CREATE TABLE `sme_webinar` (
  `webinar_id` int(11) NOT NULL,
  `webinar_topic` varchar(255) DEFAULT NULL,
  `webinar_desc` varchar(255) DEFAULT NULL,
  `who_attend` varchar(255) DEFAULT NULL,
  `key_takeaways` varchar(255) DEFAULT NULL,
  `webinar_fees` int(11) DEFAULT NULL,
  `webinar_date` date DEFAULT NULL,
  `webinar_from_time` time DEFAULT NULL,
  `webinar_to_time` time DEFAULT NULL,
  `sme_email` varchar(255) DEFAULT NULL,
  `course_image` text DEFAULT NULL,
  `webinar_venue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `verified` int(1) NOT NULL,
  `vkey` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `name`, `phoneNumber`, `password`, `verified`, `vkey`) VALUES
('pavanadhao685@gmail.com', 'pavanuser', '9763243782', '$2y$10$xbBRUb97m7lGWKNwN.k8bOZeaIeQK1508kHJ46cOhK8QgVBKUDG9u', 1, '18f87314d3c73bb61818a21edd719f83'),
('user1@gmail.com', 'user1', '9876524367', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL),
('user2@gmail.com', 'user2', '7638647364', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL),
('user3@gmail.com', 'user3', '9873654632', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL),
('user4@gmail.com', 'user4', '8765345223', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL),
('user5@gmail.com', 'user5', '7638965463', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL),
('user6@gmail.com', 'user6', '8762987364', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL),
('user7@gmail.com', 'user7', '9837654263', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL),
('user8@gmail.com', 'user8', '9876374653', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userquestion`
--

CREATE TABLE `userquestion` (
  `questionid` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `topic` text NOT NULL,
  `question` text NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userquestion`
--

INSERT INTO `userquestion` (`questionid`, `category`, `topic`, `question`, `email`, `status`) VALUES
(27, 'IT', 'u1', 'u1?', 'user1@gmail.com', 'In review'),
(28, 'IT', 'u2', 'u2?', 'user1@gmail.com', 'In review');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cancelled_consultations`
--
ALTER TABLE `cancelled_consultations`
  ADD PRIMARY KEY (`cancelid`),
  ADD KEY `questionid` (`questionid`),
  ADD KEY `sme_email` (`sme_email`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryName`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`consultationId`),
  ADD KEY `clientEmailId` (`clientEmailId`),
  ADD KEY `smeEmailId` (`smeEmailId`),
  ADD KEY `questionId` (`questionId`);

--
-- Indexes for table `consultation_slots`
--
ALTER TABLE `consultation_slots`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `declined_requests`
--
ALTER TABLE `declined_requests`
  ADD PRIMARY KEY (`declineId`),
  ADD KEY `questionid` (`questionid`),
  ADD KEY `sme_email` (`sme_email`);

--
-- Indexes for table `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD KEY `forget_password_ibfk_1` (`email`);

--
-- Indexes for table `sme_answer`
--
ALTER TABLE `sme_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sme_profile`
--
ALTER TABLE `sme_profile`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `categoryname` (`categoryname`);

--
-- Indexes for table `sme_webinar`
--
ALTER TABLE `sme_webinar`
  ADD PRIMARY KEY (`webinar_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `userquestion`
--
ALTER TABLE `userquestion`
  ADD PRIMARY KEY (`questionid`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cancelled_consultations`
--
ALTER TABLE `cancelled_consultations`
  MODIFY `cancelid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `consultationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `consultation_slots`
--
ALTER TABLE `consultation_slots`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `declined_requests`
--
ALTER TABLE `declined_requests`
  MODIFY `declineId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sme_answer`
--
ALTER TABLE `sme_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `sme_profile`
--
ALTER TABLE `sme_profile`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `sme_webinar`
--
ALTER TABLE `sme_webinar`
  MODIFY `webinar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `userquestion`
--
ALTER TABLE `userquestion`
  MODIFY `questionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cancelled_consultations`
--
ALTER TABLE `cancelled_consultations`
  ADD CONSTRAINT `cancelled_consultations_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `userquestion` (`questionid`),
  ADD CONSTRAINT `cancelled_consultations_ibfk_2` FOREIGN KEY (`sme_email`) REFERENCES `sme_profile` (`email`);

--
-- Constraints for table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`clientEmailId`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`smeEmailId`) REFERENCES `sme_profile` (`email`),
  ADD CONSTRAINT `consultation_ibfk_3` FOREIGN KEY (`questionId`) REFERENCES `userquestion` (`questionid`);

--
-- Constraints for table `declined_requests`
--
ALTER TABLE `declined_requests`
  ADD CONSTRAINT `declined_requests_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `userquestion` (`questionid`),
  ADD CONSTRAINT `declined_requests_ibfk_2` FOREIGN KEY (`sme_email`) REFERENCES `sme_profile` (`email`);

--
-- Constraints for table `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD CONSTRAINT `forgot_password_ibfk_1` FOREIGN KEY (`email`) REFERENCES `sme_profile` (`email`);

--
-- Constraints for table `sme_profile`
--
ALTER TABLE `sme_profile`
  ADD CONSTRAINT `sme_profile_ibfk_1` FOREIGN KEY (`categoryname`) REFERENCES `category` (`categoryName`);

--
-- Constraints for table `userquestion`
--
ALTER TABLE `userquestion`
  ADD CONSTRAINT `userquestion_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`categoryName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
