-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2021 at 02:19 PM
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
  `ID` int(5) UNSIGNED ZEROFILL NOT NULL,
  `sme_code` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sme_profile`
--

INSERT INTO `sme_profile` (`name`, `email`, `phone`, `password`, `verified`, `vkey`, `pincode`, `postal_addr`, `categoryname`, `experience`, `skillset`, `sme_cert`, `sme_language`, `webinars`, `sme_fees`, `mode_of_cons`, `photo_loc`, `resume_loc`, `review_rating`, `ID`, `sme_code`) VALUES
('pavan', 'pavanadhao685@gmail.com', 9763243782, '$2y$10$mloaXMt91cmrfc6P.JDfruXMOqkUr/ItddmEIWhqNjartalFmJvGe', 0, 'e0aa9fe0974902da492d5e6130d954f9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 00017, NULL),
('sme1', 'sme1@gmail.com', 9999999232, '123', 1, NULL, '65432', '12, kothrud,pune, maharashtra', 'IT', 12, 'Java, Python,C++', 'Google cloud, Linux unhatched, Red Hat', 'English, hindi', 'Yes', 300, 'Call', NULL, NULL, 4, 00001, NULL),
('sme2', 'sme2@gmail.com', 8654235672, '123', 1, NULL, '36547', 'At. Nandura, Maharashtra,12', 'Entrepreneurship', 2, 'Digital Marketing', 'Google Digital Marketing', 'Marathi, Hindi, English', 'No', 600, 'Email,Call', NULL, NULL, 4, 00002, NULL),
('sme3', 'sme3@gmail.com', 7765897654, '123', 1, NULL, '4356', '34,laxmi nagar, kondhawa, pune', 'Health and Fitness', 3, 'abc,xyz', 'national health influencer Award', 'Gujarati, Hindi, English', 'No', 700, 'Call,Email', NULL, NULL, NULL, 00003, NULL),
('sme4', 'sme4@gmail.com', 9876376534, '123', 1, NULL, '443404', 'at. Tilak Nagar, Nashik 12, Maharashtra', 'RealEstate', 4, 'Knowledge about Economics', 'Real Estate Broker', 'Hindi, English', 'Yes', 1000, 'Chat,Email', NULL, NULL, 4, 00004, NULL),
('sme5', 'sme5@gmail.com', 9876535463, '123', 1, NULL, '12421', '99, Sai Apartment, Pimpri Chinchwad, Maharashtra', 'IT', 5, 'Flutter, Android, IOS', 'Google Certified App Dev.', 'Hindi, Marathi, Hindi', 'No', 300, 'Chat, Call', NULL, NULL, 4, 00005, NULL);

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
('user1@gmail.com', 'user1', '9876524367', '123', 1, NULL),
('user2@gmail.com', 'user2', '7638647364', '123', 1, NULL),
('user3@gmail.com', 'user3', '9873654632', '123', 1, NULL),
('user4@gmail.com', 'user4', '8765345223', '123', 1, NULL),
('user5@gmail.com', 'user5', '7638965463', '123', 1, NULL),
('user6@gmail.com', 'user6', '8762987364', '123', 1, NULL),
('user7@gmail.com', 'user7', '9837654263', '123', 1, NULL),
('user8@gmail.com', 'user8', '9876374653', '123', 1, NULL);

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
(1, 'Entrepreneurship', 'Mobile App', 'how can i start making mopney from developing apps', 'pavanadhao685@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryName`);

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
-- AUTO_INCREMENT for table `sme_answer`
--
ALTER TABLE `sme_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sme_profile`
--
ALTER TABLE `sme_profile`
  MODIFY `ID` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `userquestion`
--
ALTER TABLE `userquestion`
  MODIFY `questionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
