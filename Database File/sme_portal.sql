-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2021 at 05:43 AM
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
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `fileid` int(11) NOT NULL,
  `msgid` int(11) DEFAULT NULL,
  `filename` text DEFAULT NULL,
  `tempname` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `chatbot_data`
--

CREATE TABLE `chatbot_data` (
  `id` int(11) NOT NULL,
  `user_type` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `request_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chats_count`
--

CREATE TABLE `chats_count` (
  `chatid` int(11) NOT NULL,
  `user1id` varchar(100) DEFAULT NULL,
  `user2id` varchar(100) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  `msgCount` int(11) DEFAULT NULL,
  `user1ClrCount` int(11) DEFAULT NULL,
  `user2ClrCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Dumping data for table `consultation_slots`
--

INSERT INTO `consultation_slots` (`ID`, `sme_email`, `client_email`, `questionid`, `mode_of_cons`, `slot1_date`, `slot1_from_time`, `slot1_to_time`, `slot2_date`, `slot2_from_time`, `slot2_to_time`, `slot3_date`, `slot3_from_time`, `slot3_to_time`) VALUES
(158, 't1@gmail.com', 'user1@gmail.com', 64, 'chat', '2021-03-06', '03:06:00', '04:06:00', '2021-03-06', '03:06:00', '04:06:00', '2021-03-05', '03:06:00', '04:06:00');

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
-- Table structure for table `followup`
--

CREATE TABLE `followup` (
  `followupid` int(11) NOT NULL,
  `followup_date` text DEFAULT NULL,
  `starttime` text DEFAULT NULL,
  `endtime` text DEFAULT NULL,
  `consultationid` int(11) DEFAULT NULL,
  `sme_email` varchar(100) DEFAULT NULL,
  `client_email` varchar(100) DEFAULT NULL
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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msgid` int(11) NOT NULL,
  `senderid` varchar(100) DEFAULT NULL,
  `recieverid` varchar(100) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `isFile` int(1) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
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
('pavansme', 'pavanadhao685@gmail.com', 9763243782, '$2y$10$TW7Jk4jBM07b1WxlcDtTq.EdhQxCPmSxLEqKhhkzEqbcuoggB4SQC', 1, 'd796f66605147f8de7079c00b49969f3', '444444', 'abcd', 'Entrepreneurship', 24, 'HTML, Java, Flutter', 'NDG Linux unhatched, Python Automation.', 'Marathi, Hindi, English', 'Yes', 2000, 'Chat,Email,', 'images/profile_img/1613887608.jpg', 'images/sme_resume/1613895035.docx', 4, 65, 'SME000065', 'Android Developer at Stewart', 'Your “About me” page forms the first impression of a company or product.'),
('sme1', 'sme1@gmail.com', 9983634262, '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL, '435675', '12, kothrud,pune, maharashtra', 'Entrepreneurship', 4, 'Java, Python,C++', 'Google cloud, Linux unhatched', 'English, hindi', 'Yes', 700, 'Chat,Email,', '', 'images/sme_resume/1613837797.docx', 4, 1, 'SME00001', 'Android Developer at Stewart', 'hii'),
('sme2', 'sme2@gmail.com', 4567234567, '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL, '563213', 'At. Nandura, Maharashtra,12', 'Entrepreneurship', 2, 'Digital Marketing', 'Google Digital Marketing', 'Marathi, Hindi, English', 'Yes', 600, 'Chat,Call,Email', NULL, NULL, 4, 2, 'SME00002', NULL, NULL),
('sme3', 'sme3@gmail.com', 9876535463, '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL, '443456', '34,laxmi nagar, kondhawa, pune', 'RealEstate', 12, 'Knowledge about Economics', 'Real Estate Broker', 'Hindi, English', 'No', 1000, 'Chat,Email', NULL, NULL, 4, 3, 'SME00003', NULL, NULL),
('sme4', 'sme4@gmail.com', 9876535463, '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, NULL, '23452', 'nandura, buldhana, nashik43', 'Entrepreneurship', 12, 'Java, Kotlin', 'Certified Android Dev', 'English, marathi, hindi', 'Yes', 1100, 'Call,', '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', '', 4, 66, '', 'Android Developer at Stewart', 'wewe'),
('pavan', 't1@gmail.com', 9763243782, '$2y$10$hwGyL7tRoqeu9c6Ku0HJ9OmjnqmWltadUA4v/Fpz8iFYpq1cn9ML.', 1, '1ed7b8d6dee3595f78a4e950a7f71b85', '444444', 'abcd', 'Entrepreneurship', 12, 'abc', 'asfaa', 'Marathi, Hindi, English', 'Yes', 500, 'Chat,Email,', 'images/profile_img/1614399421.jfif', NULL, 4, 76, 'SME000076', 'Android Developer at Affable', 'fdf');

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

--
-- Dumping data for table `sme_webinar`
--

INSERT INTO `sme_webinar` (`webinar_id`, `webinar_topic`, `webinar_desc`, `who_attend`, `key_takeaways`, `webinar_fees`, `webinar_date`, `webinar_from_time`, `webinar_to_time`, `sme_email`, `course_image`, `webinar_venue`) VALUES
(85, 'Android Development', 'ffgfg', 'fgffgfg', 'fgfgfg', 2000, '2021-02-28', '02:53:00', '03:53:00', 't1@gmail.com', 'images/course_img/1614399791.jpg', 'Google Meet');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `testimonial_id` int(10) NOT NULL,
  `sme_email` varchar(255) DEFAULT NULL,
  `att_photo` text DEFAULT NULL,
  `att_audio` text DEFAULT NULL,
  `att_name` text DEFAULT NULL,
  `att_desig` text DEFAULT NULL,
  `testimony` text DEFAULT NULL
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
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`fileid`),
  ADD KEY `msgid` (`msgid`);

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
-- Indexes for table `chatbot_data`
--
ALTER TABLE `chatbot_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats_count`
--
ALTER TABLE `chats_count`
  ADD PRIMARY KEY (`chatid`),
  ADD KEY `questionid` (`questionid`);

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
-- Indexes for table `followup`
--
ALTER TABLE `followup`
  ADD PRIMARY KEY (`followupid`);

--
-- Indexes for table `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD KEY `forget_password_ibfk_1` (`email`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msgid`),
  ADD KEY `questionid` (`questionid`);

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
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`testimonial_id`);

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
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `fileid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cancelled_consultations`
--
ALTER TABLE `cancelled_consultations`
  MODIFY `cancelid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chatbot_data`
--
ALTER TABLE `chatbot_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `chats_count`
--
ALTER TABLE `chats_count`
  MODIFY `chatid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `consultationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `consultation_slots`
--
ALTER TABLE `consultation_slots`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `declined_requests`
--
ALTER TABLE `declined_requests`
  MODIFY `declineId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followup`
--
ALTER TABLE `followup`
  MODIFY `followupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msgid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `sme_answer`
--
ALTER TABLE `sme_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT for table `sme_profile`
--
ALTER TABLE `sme_profile`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `sme_webinar`
--
ALTER TABLE `sme_webinar`
  MODIFY `webinar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `testimonial_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `userquestion`
--
ALTER TABLE `userquestion`
  MODIFY `questionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`msgid`) REFERENCES `messages` (`msgid`);

--
-- Constraints for table `cancelled_consultations`
--
ALTER TABLE `cancelled_consultations`
  ADD CONSTRAINT `cancelled_consultations_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `userquestion` (`questionid`),
  ADD CONSTRAINT `cancelled_consultations_ibfk_2` FOREIGN KEY (`sme_email`) REFERENCES `sme_profile` (`email`);

--
-- Constraints for table `chats_count`
--
ALTER TABLE `chats_count`
  ADD CONSTRAINT `chats_count_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `userquestion` (`questionid`);

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
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `userquestion` (`questionid`);

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
