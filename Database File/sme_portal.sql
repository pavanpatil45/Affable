-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2021 at 01:01 PM
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
  `review_rating` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sme_profile`
--

INSERT INTO `sme_profile` (`name`, `email`, `phone`, `password`, `verified`, `vkey`, `pincode`, `postal_addr`, `categoryname`, `experience`, `skillset`, `sme_cert`, `sme_language`, `webinars`, `sme_fees`, `mode_of_cons`, `photo_loc`, `resume_loc`, `review_rating`) VALUES
('pavan12', 'pavanadhao222@gmail.com', 9763243782, '$2y$10$RcxeA5QMK4qu/TW0hwNyvOSgueDuOAo9Ads9B3tCAUe1fHX6hVAzy', 1, '9409c06f1508777381a089464ea54bbe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
('Pavan Patil', 'pavanadhao685@gmail.com', 9876543672, '$2y$10$Ovy6tWP66k2eWnWdJC9SfeJQ3tWc/pkxPd36Z8xcFmpRe245hrl5m', 1, '962ee05a508ab9d5b70d8ab7d92ddf66', '1212', 'At. Pimpri Adhao, nandura, maharashtra', 'Entrepreneurship', 2, 'HTML, Java, Flutter', 'NDG Linux unhatched, Python Automation.', 'Marathi, Hindi, English', 'Yes', 500, 'Chat,Email,Call,', '', '', 4.5);

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
('pavanadhao68512@gmail.com', 'pavan12', '9763243782', '$2y$10$CC//2IqFT1yPoE/2qLoeY.PEu2dZ1T08mrx8ORu.hpDxSiFgEcfSG', 0, '1c5fa610ed32511d2c5b3fc51c9096ca'),
('pavanadhao685@gmail.com', 'pavan', '9763243782', '$2y$10$prdM83sihd8I2wyEJF.VI.WgH768SOnLdDTUmMpWZ.tQ9heoZM1tK', 1, '4594e0d93756f6f255b7ffa3a17cca73'),
('pavanadhqwao685@gmail.com', 'pavan', '9763243782', '$2y$10$EcJp4A53N4HsTjsAxA/CkOEg8oyO7aBXbAZSOG1fDmBQ1oZfcJmUi', 0, '77b08d52ad78549d9a89e448c4a3edd8');

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
-- Indexes for table `sme_profile`
--
ALTER TABLE `sme_profile`
  ADD PRIMARY KEY (`email`),
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
