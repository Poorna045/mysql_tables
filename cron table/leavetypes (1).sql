-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 25, 2017 at 08:12 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `raghuerp`
--

-- --------------------------------------------------------

--
-- Table structure for table `leavetypes`
--

CREATE TABLE `leavetypes` (
  `typeId` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `typename` varchar(20) NOT NULL,
  `totaldays` float NOT NULL,
  `lstatus` varchar(30) NOT NULL,
  `carryfwd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leavetypes`
--

INSERT INTO `leavetypes` (`typeId`, `type`, `typename`, `totaldays`, `lstatus`, `carryfwd`) VALUES
(1, 'Sick Leave', 'sick_leave', 0, 'disable', 0),
(2, 'Prevelege Leave', 'prevelege_leave', 0, 'disable', 0),
(3, 'Compensatory Off', 'compensatory_leave', 0, 'enable', 1),
(4, 'Study Leave', 'study_leave', 0, 'disable', 0),
(5, 'Casual Leave', 'casual_leave', 12, 'enable', 0),
(6, 'LOP', 'LOP', 0, 'enable', 0),
(8, 'Maternaty Leave', 'maternaty_leave', 0, 'enable', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD PRIMARY KEY (`typeId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leavetypes`
--
ALTER TABLE `leavetypes`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
