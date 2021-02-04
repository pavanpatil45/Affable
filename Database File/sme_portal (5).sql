-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2021 at 09:50 AM
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
-- Table structure for table `forget_password`
--

CREATE TABLE `forget_password` (
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
  `sme_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sme_profile`
--

INSERT INTO `sme_profile` (`name`, `email`, `phone`, `password`, `verified`, `vkey`, `pincode`, `postal_addr`, `categoryname`, `experience`, `skillset`, `sme_cert`, `sme_language`, `webinars`, `sme_fees`, `mode_of_cons`, `photo_loc`, `resume_loc`, `review_rating`, `ID`, `sme_code`) VALUES
('pavan', 'pavanadhao685@gmail.com', 9763243782, '$2y$10$9u3/pABio5wIO.MGk77hbu2lHEQpLT0LCCyuM8tNIBnh4Dj65Tdvi', 1, 'a7ec09b8e9e0f6b9fb7d31d089646783', NULL, '', 'Entrepreneurship', 0, '', '', '', 'Yes', 0, 'Chat,Email,', '2.jpg', '', 4, 60, 'SME000060');

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
('pavanadhao685@gmail.com', 'pavan', '9763243782', '$2y$10$mLyNeSjU9OVHbNMIDdgNceFQPhnMeyyqKae5GsUviZHO8Pf5S2MnS', 1, 'a2623b0620e7099f76049ac64b0c2813');

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
(1, 'Entrepreneurship', 'Mobile App', 'how can i start making mopney from developing apps', 'pavanadhao685@gmail.com', NULL),
(3, 'IT', 'App development', 'Should i learn Flutter instead of Java.', 'pavanadhao685@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryName`);

--
-- Indexes for table `consultation_slots`
--
ALTER TABLE `consultation_slots`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `forget_password`
--
ALTER TABLE `forget_password`
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
-- AUTO_INCREMENT for table `consultation_slots`
--
ALTER TABLE `consultation_slots`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sme_answer`
--
ALTER TABLE `sme_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sme_profile`
--
ALTER TABLE `sme_profile`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `userquestion`
--
ALTER TABLE `userquestion`
  MODIFY `questionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forget_password`
--
ALTER TABLE `forget_password`
  ADD CONSTRAINT `forget_password_ibfk_1` FOREIGN KEY (`email`) REFERENCES `sme_profile` (`email`);

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
