-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2021 at 01:58 PM
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
-- Table structure for table `forget_password`
--

CREATE TABLE `forget_password` (
  `email` varchar(200) NOT NULL,
  `temp_key` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forget_password`
--

INSERT INTO `forget_password` (`email`, `temp_key`, `created`) VALUES
('pavanadhao685@gmail.com', 'de28ba9b081ca5eb00c0e34e7e3b766f', '2021-01-25 10:33:43'),
('pavanadhao685@gmail.com', '2d140ff953137b8885f908c38ad0fd16', '2021-01-25 10:33:51'),
('pavanadhao685@gmail.com', 'fa5e7336e435d0d61c57ea0d408aa401', '2021-01-25 10:34:43'),
('pavanadhao685@gmail.com', '4bb4f214a3841ae17da6c1f36943be5e', '2021-01-25 10:40:02'),
('pavanadhao685@gmail.com', 'e4f50a9be1be335eb84b003283c6b97c', '2021-01-25 10:40:07'),
('pavanadhao685@gmail.com', '989d6a919011259da602ce010971695b', '2021-01-25 10:40:42'),
('pavanadhao685@gmail.com', 'ff33e9fffddfb128309bd944454e8b82', '2021-01-25 10:40:48'),
('pavanadhao685@gmail.com', 'fd35ad75f134a33b4a01f99715dbdfa9', '2021-01-25 10:41:12'),
('pavanadhao685@gmail.com', 'a5a40cdb9aed9b88a6de339fa99a48a4', '2021-01-25 10:42:36'),
('pavanadhao685@gmail.com', 'a57806b615fbf292314cf8944afa6902', '2021-01-25 11:27:21'),
('pavanadhao685@gmail.com', '4df5f4e29ad4ceb6c2bf7de6ca39e353', '2021-01-25 12:15:16'),
('pavanadhao685@gmail.com', 'afc0cdb1f259752a311c15e96b4b50bc', '2021-01-25 12:19:12'),
('pavanadhao685@gmail.com', 'f72556b3f10c4d784ef02e0ef8d5bca4', '2021-01-25 12:19:18'),
('pavanadhao685@gmail.com', 'dcf644a9434ce6cd9ee3cb4b00e0d1d8', '2021-01-25 12:43:05'),
('pavanadhao685@gmail.com', '3634ebd0cbb5cf508f6414260b3550d4', '2021-01-25 12:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `sme_reg`
--

CREATE TABLE `sme_reg` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sme_reg`
--

INSERT INTO `sme_reg` (`name`, `email`, `phone`, `password`) VALUES
('akash', 'akash12@gmail.com', 9763243782, '81dc9bdb52d04dc20036dbd8313ed055'),
('aksh', 'aksh@gmail.com', 9763243782, '81dc9bdb52d04dc20036dbd8313ed055'),
('ayush', 'ayush@gmail.com', 9763243782, '81dc9bdb52d04dc20036dbd8313ed055'),
('Naval', 'dev@gmail.com', 9762334532, '81dc9bdb52d04dc20036dbd8313ed055'),
('Gaurav', 'gaurav12@gmail.com', 9763243723, '81dc9bdb52d04dc20036dbd8313ed055'),
('karan', 'karan685@gmail.com', 0, '81dc9bdb52d04dc20036dbd8313ed055'),
('pavan', 'pavanadhao685@gmail.com', 9763243782, '0b4e7a0e5fe84ad35fb5f95b9ceeac79');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forget_password`
--
ALTER TABLE `forget_password`
  ADD KEY `email` (`email`);

--
-- Indexes for table `sme_reg`
--
ALTER TABLE `sme_reg`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forget_password`
--
ALTER TABLE `forget_password`
  ADD CONSTRAINT `forget_password_ibfk_1` FOREIGN KEY (`email`) REFERENCES `sme_reg` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
