-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2022 at 10:16 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enotes_db`
--
CREATE DATABASE IF NOT EXISTS `enotes_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `enotes_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `sl_no` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `passwd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sl_no`, `name`, `email`, `passwd`) VALUES
(1, 'enotesadmin258', 'vk258@gmail.com', 'AAQ9ejv=p7');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'first', 'firstpost@am.com', '1122334455', 'hello', '2022-01-11 13:24:40'),
(2, 'Luffy', 'onepiece@am.com', '1212120000', 'Hii', '2022-01-11 13:57:33'),
(3, 'Zoro', '3sword@am.com', '1234567890', 'Hello', '2022-01-11 13:59:03'),
(6, 'Luffy', 'varshithkumar243@gmail.com', '1234567890', 'Hii ,first message', '2022-01-14 20:50:48'),
(7, 'Luffy', 'varshithkumar2001@gmail.com', '1234567890', 'hi first message', '2022-01-15 09:07:27'),
(8, 'Luffy', 'onepiece@am.com', '1234567890', 'Hi, first contact message.', '2022-01-15 10:20:12'),
(9, 'Luffy', 'onepiece@am.com', '1234567890', 'Hi, first contact message.', '2022-01-15 10:20:47'),
(10, 'Luffy', 'onepiece@am.com', '1234567890', 'Hi, first contact message.', '2022-01-15 10:21:11'),
(11, 'Luffy', 'onepiece@am.com', '1234567890', 'Hi, first contact message.', '2022-01-15 10:21:19'),
(12, 'Luffy', 'onepiece@am.com', '1234567890', 'Hi, first contact message.', '2022-01-15 10:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `doc_no` int(50) NOT NULL,
  `doc_name` text NOT NULL,
  `sub_no` varchar(15) NOT NULL,
  `sem_no` int(10) NOT NULL,
  `mod_no` int(10) NOT NULL,
  `link` varchar(300) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`doc_no`, `doc_name`, `sub_no`, `sem_no`, `mod_no`, `link`, `date_time`) VALUES
(1, 'Physics', '18PHY12', 1, 2, 'https://drive.google.com/file/d/1-GT1iDxBcdrvI2wd6kybR-M4YCXaTyCf/view?usp=sharing', '2022-01-13 20:35:14'),
(4, 'MES', '18cs44', 4, 1, 'https://drive.google.com/file/d/1-LZKsYtoqk-F_IqRE8Kefh2iylkzUm-v/view?usp=sharing', '2022-01-13 20:52:55'),
(5, 'CPS', '18cps23', 2, 1, 'https://drive.google.com/file/d/100tkcm-ATO2cPEuYAMsuQ1aM1wyFHubL/view?usp=sharing', '2022-01-16 13:31:50'),
(6, 'CPS', '18cps23', 2, 2, 'https://drive.google.com/file/d/100s0mLvkHTqe3mIskFRwPOzMIY_Cmwmb/view?usp=sharing', '2022-01-16 13:32:44'),
(7, 'DAA', '18cs42', 4, 1, 'https://drive.google.com/file/d/100m2N4MuUjyXNsBlgIcUWmKXQV1WtjNZ/view?usp=sharing', '2022-01-16 13:34:15'),
(8, 'DMS', '18cs36', 3, 1, 'https://drive.google.com/file/d/100AaZp6GVyttYaInu28n3194YsHB401w/view?usp=sharing', '2022-01-16 13:35:12'),
(9, 'DMS', '18cs36', 3, 3, 'https://drive.google.com/file/d/10-EdcT1QCPD_zxcT8bNlU0wD8zKplA9h/view?usp=sharing', '2022-01-16 13:35:57'),
(10, 'DSA', '18cs32', 3, 3, 'https://drive.google.com/file/d/1-wxl3q3kB_c-W4fNzsO7VOBHW8Od042u/view?usp=sharing', '2022-01-16 13:36:54'),
(11, 'M2', '18mat21', 2, 1, 'https://drive.google.com/file/d/1-YGQmEH2rImQ1n3rH7Oq39KaQhfPUhOa/view?usp=sharing', '2022-01-16 13:38:59'),
(12, 'M2', '18mat21', 2, 2, 'https://drive.google.com/file/d/1-U7oNDIjeOKyrKW4Y8kCBPaI6wwQbp9R/view?usp=sharing', '2022-01-16 13:39:38'),
(13, 'M3', '18mat31', 3, 1, 'https://drive.google.com/file/d/1-TAjRfpPjC5VsPoFcRF5qJeiMOpzoq5A/view?usp=sharing', '2022-01-16 13:40:30'),
(14, 'M3', '18mat31', 3, 2, 'https://drive.google.com/file/d/1-OvifAKww7ARL5YtxGfxaoRIDnn5W6ve/view?usp=sharing', '2022-01-16 13:41:09'),
(15, 'Mech', '18me25', 2, 1, 'https://drive.google.com/file/d/1-MooOrQsXMkOnH_VKRfepmvFcVHAoj2a/view?usp=sharing', '2022-01-16 13:42:10'),
(16, 'Mech', '18me25', 2, 2, 'https://drive.google.com/file/d/1-Nufo2nr35_VNra-t9xtNikjFl-PPCyj/view?usp=sharing', '2022-01-16 13:42:47'),
(17, 'SE', '18cs35', 3, 1, 'https://drive.google.com/file/d/1-EeN1CHKb-CuEl2sOLo_oeW8MMQOifC8/view?usp=sharing', '2022-01-16 13:43:44'),
(18, 'SE', '18cs35', 3, 2, 'https://drive.google.com/file/d/1-9ufxp_q7JmIz7BHo6gi7qAeyvwB972N/view?usp=sharing', '2022-01-16 13:44:13'),
(19, 'DBMS', '18cs53', 5, 1, 'https://docs.google.com/document/d/1-TA-1nnZD9fcukLz29j372ShqwZg21MP/edit?usp=sharing&ouid=103587635695164352847&rtpof=true&sd=true', '2022-01-16 14:10:47'),
(20, 'DBMS', '18cs53', 5, 2, 'https://docs.google.com/document/d/10-AaBR2uvarjUZpuC01LFtXsb_O_RdE2/edit?usp=sharing&ouid=103587635695164352847&rtpof=true&sd=true', '2022-01-16 14:11:19'),
(21, 'DBMS', '18cs53', 5, 3, 'https://docs.google.com/document/d/106lcKBi5T8TRl2vsLF1ha-rNuEojXbLo/edit?usp=sharing&ouid=103587635695164352847&rtpof=true&sd=true', '2022-01-16 14:11:50'),
(22, 'DBMS', '18cs53', 5, 4, 'https://docs.google.com/document/d/1076ikQ-RAOJsTO5emhzXv6NgLYrwzAvM/edit?usp=sharing&ouid=103587635695164352847&rtpof=true&sd=true', '2022-01-16 14:12:37'),
(23, 'DBMS', '18cs53', 5, 5, 'https://docs.google.com/document/d/10EVYBkt38I7yejivdAJ16vrgEmH4w155/edit?usp=sharing&ouid=103587635695164352847&rtpof=true&sd=true', '2022-01-16 14:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `sem` int(10) NOT NULL,
  `no_of_subject` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`sem`, `no_of_subject`) VALUES
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(6, 6),
(7, 3),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `sub_code` varchar(15) NOT NULL,
  `sub_name` text NOT NULL,
  `sem_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sub_code`, `sub_name`, `sem_no`) VALUES
('18CHE22', 'Engineering Chemistry', 2),
('18CHEL26', 'Engineering Chemistry Laboratory', 2),
('18CIV14', 'Elements of Civil Engineering and Mechanics', 1),
('18CIV59', 'Environmental Studies', 5),
('18CPC39', 'Constitution of India, Professional Ethics and Cyber Law', 3),
('18CPL27', 'C Programming Laboratory', 2),
('18CPS23', 'C Programming for Problem Solving', 2),
('18CS32', 'Data Structure and Applications', 3),
('18CS33', 'Analog and Digital Electronics', 3),
('18CS34', 'Computer Organization', 3),
('18CS35', 'Software Engineering', 3),
('18CS36', 'Discrete Mathematical Structure', 3),
('18CS42', 'Design and Analysis of Algorithms ', 4),
('18CS43', 'Operating Systems', 4),
('18CS44', 'Microcontroller and Embedded Systems', 4),
('18CS45', 'Object Oriented Concepts', 4),
('18CS46', 'Data Communication', 4),
('18CS51', 'Management Entrepreneurship for IT industry', 5),
('18CS52', 'Computer Networks and Security', 5),
('18CS53', 'Database Management System', 5),
('18CS54', 'Automata theory and Computability', 5),
('18CS55', 'Application Development using Python', 5),
('18CS56', 'Unix Programming', 5),
('18CS61', 'System Software and Compilers', 6),
('18CS62', 'Computer Graphics and Visualization', 6),
('18CS63', 'Web Technology and its Applications', 6),
('18CS71', 'Artificial Intelligence and ML', 7),
('18CS72', 'Big Data Analysis', 7),
('18CS81', 'Internet of Things', 8),
('18CSL37', 'Analog and Digital Electronics Laboratory', 3),
('18CSL38', 'Data Structures Laboratory', 3),
('18CSL47', 'Design and Analysis of Algorithms Laboratory', 4),
('18CSL48', 'Microcontroller and Embedded Systems Laboratory', 4),
('18CSL57', 'Computer Network Laboratory', 5),
('18CSL58', 'DBMS Laboratory', 5),
('18CSL66', 'System Software Laboratory', 6),
('18CSL67', 'Computer Graphics Laboratory', 6),
('18CSL76', 'Artificial Intelligence and ML Laboratory', 7),
('18CSMP68', 'Mobile Application Development', 6),
('18EGDL15', 'Engineering Graphics', 1),
('18EGH18', 'Technical English-I', 1),
('18EGH28', 'Technical English-II', 2),
('18ELE13', 'Basic Electrical Engineering', 1),
('18ELEL17', 'Basic Electrical Engineering Laboratory', 1),
('18ELN24', 'Basic Electronics', 2),
('18KVK49', 'Vyavaharika Kannada / Aadalitha Kannada', 4),
('18MAT11', 'Calculus and Linear Algebra', 1),
('18MAT21', 'Advanced Calculus and Numerical Methods', 2),
('18MAT31', 'Transform Calculus, Fourier Series\r\nand Numerical Techniques', 3),
('18MAT41', 'Complex Analysis, Probability and Statistical Methods ', 4),
('18ME25', 'Elements of Mechanical Engineering', 2),
('18PHY12', 'Engineering Physics', 1),
('18PHYL16', 'Engineering Physics Laboratory', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `usn` varchar(20) NOT NULL,
  `user_name` text NOT NULL,
  `email` text NOT NULL,
  `passwd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`usn`, `user_name`, `email`, `passwd`) VALUES
('111', 'Luffy', 'onepiece@am.com', '123123123'),
('112', 'Zoro', '3sword@am.com', '123123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`doc_no`),
  ADD KEY `sub_no` (`sub_no`),
  ADD KEY `semno` (`sem_no`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sem`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sub_code`),
  ADD KEY `sem_no` (`sem_no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`usn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `sl_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `doc_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `semno` FOREIGN KEY (`sem_no`) REFERENCES `semester` (`sem`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_no` FOREIGN KEY (`sub_no`) REFERENCES `subject` (`sub_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `sem_no` FOREIGN KEY (`sem_no`) REFERENCES `semester` (`sem`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
