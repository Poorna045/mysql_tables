-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 01, 2017 at 01:13 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `raghuerp_db`
--
CREATE DATABASE IF NOT EXISTS `raghuerp_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `raghuerp_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dp` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL COMMENT 'admin, management',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `reg_no`, `name`, `email`, `mobile`, `dp`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'admin@raghueducational.org', '8500373704', 'admin.jpg', 'admin', 1, '2017-06-12 20:30:00', '2017-07-16 22:39:26');

--
-- Triggers `admins`
--
DELIMITER $$
CREATE TRIGGER `update_admins_timestamp` BEFORE UPDATE ON `admins` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `branch` varchar(15) NOT NULL,
  `course` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch`, `course`, `fullname`, `status`) VALUES
(1, 'CAD/CAM', 2, 'Computer Aided Design', 1),
(2, 'CIVIL', 1, 'Civil Engineering', 1),
(3, 'CIVIL ', 4, 'Civil Engineering', 1),
(4, 'CSE', 1, 'Computer Science and Engineering', 1),
(5, 'CSE', 4, 'Computer Science and Engineering College', 1),
(6, 'CSE', 2, 'Computer Science and Engineering', 1),
(7, 'CSE', 3, 'Computer Science and Engineering', 1),
(8, 'ECE', 1, 'Electronics and Communication Engineering', 1),
(9, 'ECE', 4, 'Electronics and Communication Engineering', 1),
(10, 'EEE', 1, 'Electrical and Electronical Engineering', 1),
(11, 'EEE', 4, 'Electrical and Electronical Engineering', 1),
(12, 'Embd Sys & VLSI', 3, 'Embedded System and Very-large-scale integration', 1),
(13, 'Embd.Sys', 2, 'Embedded Systems', 1),
(14, 'M.D', 3, 'Machine Design', 1),
(15, 'MECH', 1, 'Mechanical Engineering', 1),
(16, 'MECH', 4, 'Mechanical Engineering', 1),
(17, 'P.E', 2, 'Power Electronics', 1),
(18, 'P.E', 3, 'Power Electronics', 1),
(19, 'S.E', 2, 'Software Engineering', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certificate_ctype`
--

CREATE TABLE `certificate_ctype` (
  `cname` varchar(60) NOT NULL,
  `disporder` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `certificate_ctype`
--

INSERT INTO `certificate_ctype` (`cname`, `disporder`) VALUES
('Certification Course', 7),
('Diploma', 3),
('Graduation', 4),
('Intermediate', 2),
('Ph.D.', 6),
('Post Graduation', 5),
('SSC', 1);

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` int(11) NOT NULL,
  `college` varchar(5) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `college`, `full_name`, `status`) VALUES
(1, 'REC', 'Raghu Engineering College', 1),
(2, 'RIT', 'Raghu Institute of Technology', 1),
(3, 'RCP', 'Raghu College of Pharmacy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course` varchar(10) NOT NULL,
  `college` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course`, `college`, `fullname`, `status`) VALUES
(1, 'B.Tech', 1, 'Bachelor of Technology', 1),
(2, 'M.Tech', 1, 'Master of Technology', 1),
(3, 'M.Tech', 2, 'Master of Technology', 1),
(4, 'B.Tech', 2, 'B.Tech', 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department` varchar(10) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `college` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department`, `full_name`, `college`, `status`) VALUES
(1, 'CIVIL', 'Civil Engineering', 1, 1),
(2, 'CIVIL', 'Civil Engineering', 2, 1),
(3, 'CSE', 'Computer Science and Engineering', 1, 1),
(4, 'CSE', 'Computer Science and Engineering', 2, 1),
(5, 'ECE', 'Electronics and Communication Engineering', 1, 1),
(6, 'ECE', 'Electronics and Communication Engineering', 2, 1),
(7, 'EEE', 'Electrical and Electronics Engineering', 1, 1),
(8, 'EEE', 'Electrical and Electronics Engineering', 2, 1),
(9, 'MECH', 'Mechanical Engineering', 1, 1),
(10, 'MECH', 'Mechanical Engineering', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `designation` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`designation`, `status`) VALUES
('Assistant Professor', 1),
('Associate Professor', 1),
('Office Assistant', 1),
('Principal', 1),
('Professor', 1),
('System Administrator', 1),
('Technician', 1);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `mid` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `item_type` varchar(24) DEFAULT NULL,
  `units` varchar(25) NOT NULL,
  `minvalue` varchar(10) NOT NULL,
  `latest_in` int(8) NOT NULL,
  `latest_out` int(8) NOT NULL,
  `total_balance` int(8) NOT NULL,
  `last_in_updated` datetime DEFAULT NULL,
  `last_out_updated` date DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0-inactive, 1-active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`mid`, `item`, `item_type`, `units`, `minvalue`, `latest_in`, `latest_out`, `total_balance`, `last_in_updated`, `last_out_updated`, `status`) VALUES
(2, 'Oil', 'kitchen', 'litres', '10', 20, 149, 31, '2017-08-29 12:12:30', '2017-08-28', 1),
(11, 'tomato', 'kitchen', 'kgs', '10', 5, 5, 120, '2017-08-29 12:10:38', '2017-08-29', 1),
(12, 'Onions', 'kitchen', 'kgs', '15', 10, 15, 145, '2017-08-29 12:12:30', '2017-08-28', 1),
(13, 'rice', 'kitchen', 'kgs', '10', 150, 0, 5150, '2017-08-24 05:16:52', NULL, 1),
(14, 'salt', NULL, 'kgs', '10', 0, 0, 0, NULL, NULL, 1),
(15, 'sugar', NULL, 'kgs', '5', 0, 0, 0, NULL, NULL, 1),
(18, 'bengal dall', NULL, 'kgs', '10', 0, 0, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `mid` int(11) NOT NULL,
  `mtype` varchar(10) NOT NULL,
  `mailtype` varchar(10) NOT NULL,
  `application_type` varchar(30) NOT NULL,
  `mto` varchar(255) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `bcc` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `processed` bit(1) NOT NULL DEFAULT b'0',
  `processed_return` text NOT NULL,
  `insert_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`mid`, `mtype`, `mailtype`, `application_type`, `mto`, `cc`, `bcc`, `subject`, `message`, `processed`, `processed_return`, `insert_dt`) VALUES
(1, 'mail', 'html', 'LeaveSystem', 'vinay.ece@raghuenggcollege.in', '', '', 'Leave Status', ' D BHASKARA RAO  Details,<br /><br />\r\n            D BHASKARA RAO  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0132</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-26 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-26 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0026</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-26 05:36:20'),
(2, 'mail', 'html', 'LeaveSystem', 'principal@raghuenggcollege.com', '', '', 'Leave Status', ' D BHASKARA RAO  Details,<br /><br />\r\n            D BHASKARA RAO  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0132</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-26 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-26 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0026</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-26 05:36:20'),
(3, 'mail', 'html', 'LeaveSystem', 'bhaskar.ece@raghuenggcollege.in', '', '', 'Leave Status', ' D BHASKARA RAO  Details,<br /><br />\n            D BHASKARA RAO  applied leave Request<br /><br />\n              -------------------------------------------------<br /><br />\n              <table>\n              <thead>\n			   <tr>\n              <th colspan=2>leave details</th>\n              </tr>\n			   </thead>\n			   <tbody>\n              <tr>\n              <td>Faculty Id</th>\n			  <td>rec0132</td>\n			  </tr>\n			  <tr>\n              <td>Department</th>\n			  <td>ECE</td>\n			  </tr>\n			  <tr>\n              <td>College</th>\n			  <td>REC</td>\n			  </tr>\n			  <tr>\n              <td>From Date</th>\n			  <td>2017-07-26 09:00:00</td>\n			  </tr>\n			  <tr>\n              <td>To Date</th>\n			  <td>2017-07-26 12:00:00</td>\n			  </tr>\n			  <tr>\n              <td>Duration</th>\n			  <td>0.5 days</td>\n			  </tr>\n			   <tr>\n              <td>Delegated Person</th>\n			  <td>rec0026</td>\n			  </tr>\n              </tbody>\n              </table>\n              -------------------------------------------------<br /><br />\n        \n          Thanks<br/>REI Team', b'0', '', '2017-07-26 05:36:20'),
(4, 'mail', 'html', 'LeaveSystem', 'manojvarma132@gmail.com', '', '', 'Leave Status', ' D BHASKARA RAO  Details,<br /><br />\r\n            D BHASKARA RAO  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0132</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-26 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-26 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0026</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-26 05:36:20'),
(5, 'mail', 'html', 'LeaveSystem', 'allurinani.007@gmail.com', '', '', 'Leave Status', ' D BHASKARA RAO  Details,<br /><br />\r\n            D BHASKARA RAO  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0132</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-26 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-26 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0026</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-26 05:36:20'),
(6, 'mail', 'html', 'LeaveSystem', 'ksraju.ece@raghuenggcollege.in', '', '', 'Leave Status', ' D BHASKARA RAO  Details,<br /><br />\r\n            D BHASKARA RAO  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0132</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-26 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-26 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0026</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-26 05:36:20'),
(7, 'mail', 'html', 'LeaveSystem', 'vinay.ece@raghuenggcollege.in', '', '', 'Leave Status', ' Dr. PHANI RAMA KRISHNA CHUNDURY  Details,<br /><br />\r\n            Dr. PHANI RAMA KRISHNA CHUNDURY  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0115</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0039</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 06:39:00'),
(8, 'mail', 'html', 'LeaveSystem', 'principal@raghuenggcollege.com', '', '', 'Leave Status', ' Dr. PHANI RAMA KRISHNA CHUNDURY  Details,<br /><br />\r\n            Dr. PHANI RAMA KRISHNA CHUNDURY  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0115</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0039</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 06:39:01'),
(9, 'mail', 'html', 'LeaveSystem', 'ramakrishna@raghueducational.org', '', '', 'Leave Status', ' Dr. PHANI RAMA KRISHNA CHUNDURY  Details,<br /><br />\r\n            Dr. PHANI RAMA KRISHNA CHUNDURY  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0115</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0039</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 06:39:01'),
(10, 'mail', 'html', 'LeaveSystem', 'tatarao.cse@raghuenggcollege.in', '', '', 'Leave Status', ' Dr. PHANI RAMA KRISHNA CHUNDURY  Details,<br /><br />\r\n            Dr. PHANI RAMA KRISHNA CHUNDURY  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0115</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0039</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 06:39:01'),
(11, 'mail', 'html', 'LeaveSystem', 'principal@raghuenggcollege.com', '', '', 'Leave Status', ' B.G.MADHURI  Details,<br /><br />\r\n            B.G.MADHURI  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0013</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>EEE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0010</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 07:07:09'),
(12, 'mail', 'html', 'LeaveSystem', 'satyanarayana.eee@raghuenggcollege.in', '', '', 'Leave Status', ' B.G.MADHURI  Details,<br /><br />\r\n            B.G.MADHURI  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0013</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>EEE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0010</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 07:07:09'),
(13, 'mail', 'html', 'LeaveSystem', 'madhuri.eee@raghuenggcollege.in', '', '', 'Leave Status', ' B.G.MADHURI  Details,<br /><br />\r\n            B.G.MADHURI  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0013</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>EEE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0010</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 07:07:09'),
(14, 'mail', 'html', 'LeaveSystem', 'nanil.cse@raghuenggcollege.in', '', '', 'Leave Status', ' B.G.MADHURI  Details,<br /><br />\r\n            B.G.MADHURI  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0013</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>EEE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0010</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 07:07:09'),
(15, 'mail', 'html', 'LeaveSystem', 'principal@raghuenggcollege.com', '', '', 'Leave Status', 'HOD is Accepted   B.G.MADHURI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:31'),
(16, 'mail', 'html', 'LeaveSystem', 'satyanarayana.eee@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Accepted   B.G.MADHURI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:31'),
(17, 'mail', 'html', 'LeaveSystem', 'madhuri.eee@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Accepted   B.G.MADHURI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:31'),
(18, 'mail', 'html', 'LeaveSystem', 'nanil.cse@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Accepted   B.G.MADHURI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:31'),
(19, 'mail', 'html', 'LeaveSystem', 'manojvarma132@gmail.com', '', '', 'Leave Status', 'HOD is Accepted   B.G.MADHURI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:31'),
(20, 'mail', 'html', 'LeaveSystem', 'allurinani.007@gmail.com', '', '', 'Leave Status', 'HOD is Accepted   B.G.MADHURI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:32'),
(21, 'mail', 'html', 'LeaveSystem', 'principal@raghuenggcollege.com', '', '', 'Leave Status', 'HOD is Rejected   SK.DARYABI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:43'),
(22, 'mail', 'html', 'LeaveSystem', 'satyanarayana.eee@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Rejected   SK.DARYABI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:44'),
(23, 'mail', 'html', 'LeaveSystem', 'madhuri.eee@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Rejected   SK.DARYABI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:44'),
(24, 'mail', 'html', 'LeaveSystem', 'nanil.cse@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Rejected   SK.DARYABI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:44'),
(25, 'mail', 'html', 'LeaveSystem', 'daryabi.eee@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Rejected   SK.DARYABI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:44'),
(26, 'mail', 'html', 'LeaveSystem', 'rec0187@raghuengg.in', '', '', 'Leave Status', 'HOD is Rejected   SK.DARYABI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:44'),
(27, 'mail', 'html', 'LeaveSystem', 'manojvarma132@gmail.com', '', '', 'Leave Status', 'HOD is Rejected   SK.DARYABI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:44'),
(28, 'mail', 'html', 'LeaveSystem', 'allurinani.007@gmail.com', '', '', 'Leave Status', 'HOD is Rejected   SK.DARYABI  '' s Leave Request ', b'0', '', '2017-07-27 07:08:44'),
(29, 'mail', 'html', 'LeaveSystem', 'srinivas.civil@raghuenggcollege.in', '', '', 'Leave Status', ' I. KRISHNA CHAITANYA  Details,<br /><br />\r\n            I. KRISHNA CHAITANYA  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0032</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>CIVIL</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0134</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 07:44:18'),
(30, 'mail', 'html', 'LeaveSystem', 'principal@raghuenggcollege.com', '', '', 'Leave Status', ' I. KRISHNA CHAITANYA  Details,<br /><br />\r\n            I. KRISHNA CHAITANYA  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0032</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>CIVIL</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0134</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 07:44:18'),
(31, 'mail', 'html', 'LeaveSystem', 'ikchaitanya.civil@raghuenggcollege.in', '', '', 'Leave Status', ' I. KRISHNA CHAITANYA  Details,<br /><br />\r\n            I. KRISHNA CHAITANYA  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0032</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>CIVIL</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0134</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 07:44:18'),
(32, 'mail', 'html', 'LeaveSystem', 'nagabhusanam.civil@raghuenggcollege.in', '', '', 'Leave Status', ' I. KRISHNA CHAITANYA  Details,<br /><br />\r\n            I. KRISHNA CHAITANYA  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0032</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>CIVIL</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-27 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-27 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0134</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-27 07:44:19'),
(33, 'mail', 'html', 'LeaveSystem', 'srinivas.civil@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Accepted   I. KRISHNA CHAITANYA  '' s Leave Request ', b'0', '', '2017-07-27 07:44:44'),
(34, 'mail', 'html', 'LeaveSystem', 'principal@raghuenggcollege.com', '', '', 'Leave Status', 'HOD is Accepted   I. KRISHNA CHAITANYA  '' s Leave Request ', b'0', '', '2017-07-27 07:44:44'),
(35, 'mail', 'html', 'LeaveSystem', 'ikchaitanya.civil@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Accepted   I. KRISHNA CHAITANYA  '' s Leave Request ', b'0', '', '2017-07-27 07:44:44'),
(36, 'mail', 'html', 'LeaveSystem', 'nagabhusanam.civil@raghuenggcollege.in', '', '', 'Leave Status', 'HOD is Accepted   I. KRISHNA CHAITANYA  '' s Leave Request ', b'0', '', '2017-07-27 07:44:44'),
(37, 'mail', 'html', 'LeaveSystem', 'manojvarma132@gmail.com', '', '', 'Leave Status', 'HOD is Accepted   I. KRISHNA CHAITANYA  '' s Leave Request ', b'0', '', '2017-07-27 07:44:44'),
(38, 'mail', 'html', 'LeaveSystem', 'allurinani.007@gmail.com', '', '', 'Leave Status', 'HOD is Accepted   I. KRISHNA CHAITANYA  '' s Leave Request ', b'0', '', '2017-07-27 07:44:44'),
(39, 'mail', 'html', 'LeaveSystem', 'josemoses.cse@raghuenggcollege.in', '', '', 'Leave Status', ' BH.V.S.NARAYANA  Details,<br /><br />\r\n            BH.V.S.NARAYANA  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0060</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>CSE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-08-30 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-08-30 17:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>1 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0061</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-08-30 03:54:27'),
(40, 'mail', 'html', 'LeaveSystem', 'principal@raghuenggcollege.com', '', '', 'Leave Status', ' BH.V.S.NARAYANA  Details,<br /><br />\r\n            BH.V.S.NARAYANA  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0060</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>CSE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-08-30 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-08-30 17:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>1 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0061</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-08-30 03:54:27'),
(41, 'mail', 'html', 'LeaveSystem', 'narayana.cse@raghuenggcollege.in', '', '', 'Leave Status', ' BH.V.S.NARAYANA  Details,<br /><br />\r\n            BH.V.S.NARAYANA  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0060</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>CSE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-08-30 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-08-30 17:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>1 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0061</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-08-30 03:54:27'),
(42, 'mail', 'html', 'LeaveSystem', 'surendra.cse@raghuenggcollege.in', '', '', 'Leave Status', ' BH.V.S.NARAYANA  Details,<br /><br />\r\n            BH.V.S.NARAYANA  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0060</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>CSE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-08-30 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-08-30 17:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>1 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0061</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-08-30 03:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_06_12_104039_create_personal_data_table', 1),
(4, '2017_06_13_051023_create_admins_table', 1),
(5, '2017_06_13_051146_create_staff_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section` varchar(8) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `year`) VALUES
(1, 'A', 3),
(2, 'A', 4),
(3, 'A', 5),
(4, 'A', 6),
(5, 'A', 7),
(6, 'A', 8),
(7, 'A', 9),
(8, 'A', 10),
(9, 'A', 11),
(10, 'A', 12),
(11, 'A', 13),
(12, 'A', 14),
(13, 'A', 15),
(14, 'A', 16),
(15, 'A', 17),
(16, 'A', 18),
(17, 'A', 23),
(18, 'A', 24),
(19, 'A', 25),
(20, 'A', 26),
(21, 'A', 27),
(22, 'A', 28),
(23, 'A', 29),
(24, 'A', 30),
(25, 'A', 31),
(26, 'A', 32),
(27, 'A', 33),
(28, 'A', 34),
(29, 'A', 35),
(30, 'A', 36),
(31, 'A', 37),
(32, 'A', 38),
(33, 'A', 45),
(34, 'A', 46),
(35, 'A', 47),
(36, 'A', 48),
(37, 'A', 49),
(38, 'A', 50),
(39, 'A', 51),
(40, 'A', 52),
(41, 'B', 3),
(42, 'B', 4),
(43, 'B', 5),
(44, 'B', 6),
(45, 'B', 7),
(46, 'B', 8),
(47, 'B', 9),
(48, 'B', 10),
(49, 'B', 11),
(50, 'B', 12),
(51, 'B', 13),
(52, 'B', 14),
(53, 'B', 15),
(54, 'B', 16),
(55, 'B', 17),
(56, 'B', 18),
(57, 'B', 23),
(58, 'B', 24),
(59, 'B', 25),
(60, 'B', 26),
(61, 'B', 27),
(62, 'B', 28),
(63, 'B', 29),
(64, 'B', 30),
(65, 'B', 31),
(66, 'B', 32),
(67, 'B', 33),
(68, 'B', 34),
(69, 'B', 35),
(70, 'B', 36),
(71, 'B', 37),
(72, 'B', 38),
(73, 'B', 45),
(74, 'B', 46),
(75, 'B', 47),
(76, 'B', 48),
(77, 'B', 49),
(78, 'B', 50),
(79, 'B', 51),
(80, 'B', 52),
(81, 'A', 1),
(82, 'A', 2),
(83, 'A', 19),
(84, 'A', 20),
(85, 'A', 21),
(86, 'A', 22),
(87, 'A', 39),
(88, 'A', 40),
(89, 'A', 41),
(90, 'A', 42),
(91, 'A', 43),
(92, 'A', 44),
(93, 'A', 53),
(94, 'A', 54),
(95, 'A', 55),
(96, 'A', 56),
(97, 'A', 57),
(98, 'A', 58);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `title` varchar(10) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `dispname` varchar(15) DEFAULT NULL,
  `college` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dp` varchar(30) DEFAULT NULL,
  `present_address` text,
  `permanent_address` text,
  `employment_type` varchar(20) NOT NULL,
  `pan` varchar(20) DEFAULT NULL,
  `pan_file` varchar(30) NOT NULL,
  `aadhar` varchar(20) DEFAULT NULL,
  `aadhar_file` varchar(30) NOT NULL,
  `passport` varchar(25) DEFAULT NULL,
  `passport_file` varchar(30) NOT NULL,
  `dateob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `father_name` varchar(100) NOT NULL,
  `mother_name` varchar(100) NOT NULL,
  `personal_phone_no` varchar(25) NOT NULL,
  `personal_email` varchar(100) NOT NULL,
  `spouce_employment` varchar(100) NOT NULL,
  `spouce_name` varchar(100) NOT NULL,
  `spouce_age` varchar(10) NOT NULL,
  `placeob` varchar(255) DEFAULT NULL,
  `stateob` varchar(50) DEFAULT NULL,
  `countryob` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Triggers `staff`
--
DELIMITER $$
CREATE TRIGGER `create_users_data` AFTER INSERT ON `staff` FOR EACH ROW BEGIN
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_staff_timestamp` BEFORE UPDATE ON `staff` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff_certificate`
--

CREATE TABLE `staff_certificate` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `course` varchar(50) NOT NULL,
  `board` varchar(50) NOT NULL,
  `passyear` varchar(10) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `certificate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(6) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dispname` varchar(15) NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `fathername` varchar(255) DEFAULT NULL,
  `mothername` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `dp` varchar(30) DEFAULT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text,
  `aadhar` varchar(20) DEFAULT NULL,
  `aadhar_file` varchar(100) NOT NULL,
  `passport` varchar(20) NOT NULL,
  `passport_file` varchar(100) NOT NULL,
  `pan` varchar(20) NOT NULL,
  `pan_file` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `college` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  `branch` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `admission_no` varchar(50) NOT NULL,
  `enrollment_no` varchar(50) NOT NULL,
  `entry_passout` varchar(100) NOT NULL,
  `living_status` varchar(50) NOT NULL,
  `admission_type` varchar(50) NOT NULL,
  `admission_category` varchar(50) NOT NULL,
  `admission_date` varchar(20) NOT NULL,
  `scholarship_status` varchar(20) NOT NULL,
  `staff_child` varchar(20) NOT NULL,
  `transport` varchar(20) NOT NULL,
  `aconomically_backword` varchar(20) NOT NULL,
  `father_income` varchar(20) NOT NULL,
  `mother_income` varchar(20) NOT NULL,
  `proposed_discount` varchar(50) NOT NULL,
  `personal_email` varchar(50) NOT NULL,
  `personal_phone_no` varchar(20) NOT NULL,
  `placeob` varchar(255) DEFAULT NULL,
  `stateob` varchar(255) DEFAULT NULL,
  `countryob` varchar(255) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `update_students_timestamp` BEFORE UPDATE ON `students` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_no` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `utype` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `reg_no`, `password`, `utype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '50c2472801ba5f5158b71047563521ef', 'adm', '1234', '2017-06-12 20:30:00', '2017-07-13 03:16:01'),
(2, 'CseHod', 'RECCSE001', 'b1a5b64256e27fa5ae76d62b95209ab3', 'stf', '1235', '2017-06-14 06:59:29', '2017-06-14 06:59:29'),
(3, 'Vinay Kumar', '125CSE895', 'b1a5b64256e27fa5ae76d62b95209ab3', 'std', '1236', '2017-06-14 07:57:30', '2017-07-04 23:57:56'),
(11, 'Nikhil', 'RECMECH001', '50c2472801ba5f5158b71047563521ef', 'stf', NULL, NULL, '2017-07-13 02:58:46'),
(12, 'Sravan', 'RECCSE548', 'bd03b85c14862dbad8f4ea0ebf08c3a3', 'adm', NULL, NULL, '2017-07-05 03:32:31'),
(13, 'Sivarama rao', 'RECEEE01', 'd7792ea01be12978c51f26450979310f', 'adm', NULL, NULL, NULL),
(14, 'apparo', 'xyz123', '613d3b9c91e9445abaeca02f2342e5a6', 'stf', NULL, NULL, NULL),
(15, 'aas', 'rec0008', '795348e7584c19cc523efb1d2ddd8ae7', 'stf', NULL, '2017-07-19 07:53:02', '2017-07-19 07:53:02'),
(16, 'sasa', 'rec0187', '95dd6714cb0cf0c3450e17d2104b190f', 'stf', NULL, '2017-07-21 13:12:17', '2017-07-21 13:12:17'),
(17, 'satyanarayana', 'rec0143', 'b2928f5f1f8d87a9d00b2b248c4b05cc', 'stf', NULL, '2017-07-24 04:29:30', '2017-07-24 04:29:30'),
(18, 'asd', 'rec0117', 'eac93cc199425a608c49fce1fbbcf85c', 'stf', NULL, '2017-07-24 10:18:23', '2017-07-24 10:18:23'),
(19, 'principal', 'rec0050', '3555c1e4f3a643ba12e37e8d27f33cb2', 'stf', NULL, '2017-07-24 10:53:53', '2017-07-24 10:53:53'),
(35, 'RK', 'rec0115', '88093b5897fd5a2b71a801c35ea1e0bb', 'stf', NULL, '2017-07-25 07:53:33', '2017-07-25 07:53:33'),
(36, 'asff', 'rec0032', 'b216143951cdd2638b4380876ec59256', 'stf', NULL, '2017-07-27 07:47:33', '2017-07-27 07:47:33'),
(37, 'asffAD', 'rec0039', '494108e921de057a9d21e5ceb7db415a', 'stf', NULL, '2017-07-27 08:13:48', '2017-07-27 08:13:48');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `update_users_timestamp` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `id` int(11) NOT NULL,
  `year` varchar(8) NOT NULL,
  `branch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `year`
--

INSERT INTO `year` (`id`, `year`, `branch`) VALUES
(1, '1', 1),
(2, '2', 1),
(3, '1', 2),
(4, '2', 2),
(5, '3', 2),
(6, '4', 2),
(7, '1', 3),
(8, '2', 3),
(9, '3', 3),
(10, '4', 3),
(11, '1', 4),
(12, '2', 4),
(13, '3', 4),
(14, '4', 4),
(15, '1', 5),
(16, '2', 5),
(17, '3', 5),
(18, '4', 5),
(19, '1', 6),
(20, '2', 6),
(21, '1', 7),
(22, '2', 7),
(23, '1', 8),
(24, '2', 8),
(25, '3', 8),
(26, '4', 8),
(27, '1', 9),
(28, '2', 9),
(29, '3', 9),
(30, '4', 9),
(31, '1', 10),
(32, '2', 10),
(33, '3', 10),
(34, '4', 10),
(35, '1', 11),
(36, '2', 11),
(37, '3', 11),
(38, '4', 11),
(39, '1', 12),
(40, '2', 12),
(41, '1', 13),
(42, '2', 13),
(43, '1', 14),
(44, '2', 14),
(45, '1', 15),
(46, '2', 15),
(47, '3', 15),
(48, '4', 15),
(49, '1', 16),
(50, '2', 16),
(51, '3', 16),
(52, '4', 16),
(53, '1', 17),
(54, '2', 17),
(55, '1', 18),
(56, '2', 18),
(57, '1', 19),
(58, '2', 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branch` (`branch`,`course`);

--
-- Indexes for table `certificate_ctype`
--
ALTER TABLE `certificate_ctype`
  ADD UNIQUE KEY `cname` (`cname`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `college` (`college`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department` (`department`,`college`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD UNIQUE KEY `designation` (`designation`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`mid`),
  ADD UNIQUE KEY `item` (`item`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_empid_unique` (`reg_no`),
  ADD UNIQUE KEY `staff_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `staff_certificate`
--
ALTER TABLE `staff_certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_no` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`reg_no`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_certificate`
--
ALTER TABLE `staff_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `year`
--
ALTER TABLE `year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;--
-- Database: `raghuerp_db1`
--
CREATE DATABASE IF NOT EXISTS `raghuerp_db1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `raghuerp_db1`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dp` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL COMMENT 'admin, management',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `reg_no`, `name`, `email`, `mobile`, `dp`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'admin@raghueducational.org', '8500373704', 'admin.jpg', 'admin', 1, '2017-06-13 02:00:00', '2017-07-17 04:09:26');

--
-- Triggers `admins`
--
DELIMITER $$
CREATE TRIGGER `update_admins_timestamp` BEFORE UPDATE ON `admins` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `branch` varchar(15) NOT NULL,
  `course` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch`, `course`, `fullname`, `status`) VALUES
(1, 'CAD/CAM', 2, 'Computer Aided Design', 1),
(2, 'CIVIL', 1, 'Civil Engineering', 1),
(3, 'CIVIL ', 4, 'Civil Engineering', 1),
(4, 'CSE', 1, 'Computer Science and Engineering', 1),
(5, 'CSE', 4, 'Computer Science and Engineering College', 1),
(6, 'CSE', 2, 'Computer Science and Engineering', 1),
(7, 'CSE', 3, 'Computer Science and Engineering', 1),
(8, 'ECE', 1, 'Electronics and Communication Engineering', 1),
(9, 'ECE', 4, 'Electronics and Communication Engineering', 1),
(10, 'EEE', 1, 'Electrical and Electronical Engineering', 1),
(11, 'EEE', 4, 'Electrical and Electronical Engineering', 1),
(12, 'Embd Sys & VLSI', 3, 'Embedded System and Very-large-scale integration', 1),
(13, 'Embd.Sys', 2, 'Embedded Systems', 1),
(14, 'M.D', 3, 'Machine Design', 1),
(15, 'MECH', 1, 'Mechanical Engineering', 1),
(16, 'MECH', 4, 'Mechanical Engineering', 1),
(17, 'P.E', 2, 'Power Electronics', 1),
(18, 'P.E', 3, 'Power Electronics', 1),
(19, 'S.E', 2, 'Software Engineering', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certificate_ctype`
--

CREATE TABLE `certificate_ctype` (
  `cname` varchar(60) NOT NULL,
  `disporder` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `certificate_ctype`
--

INSERT INTO `certificate_ctype` (`cname`, `disporder`) VALUES
('Certification Course', 7),
('Diploma', 3),
('Graduation', 4),
('Intermediate', 2),
('Ph.D.', 6),
('Post Graduation', 5),
('SSC', 1);

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` int(11) NOT NULL,
  `college` varchar(5) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `college`, `full_name`, `status`) VALUES
(1, 'REC', 'Raghu Engineering College', 1),
(2, 'RIT', 'Raghu Institute of Technology', 1),
(3, 'RCP', 'Raghu College of Pharmacy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course` varchar(10) NOT NULL,
  `college` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course`, `college`, `fullname`, `status`) VALUES
(1, 'B.Tech', 1, 'Bachelor of Technology', 1),
(2, 'M.Tech', 1, 'Master of Technology', 1),
(3, 'M.Tech', 2, 'Master of Technology', 1),
(4, 'B.Tech', 2, 'B.Tech', 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department` varchar(10) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `college` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department`, `full_name`, `college`, `status`) VALUES
(1, 'CIVIL', 'Civil Engineering', 1, 1),
(2, 'CIVIL', 'Civil Engineering', 2, 1),
(3, 'CSE', 'Computer Science and Engineering', 1, 1),
(4, 'CSE', 'Computer Science and Engineering', 2, 1),
(5, 'ECE', 'Electronics and Communication Engineering', 1, 1),
(6, 'ECE', 'Electronics and Communication Engineering', 2, 1),
(7, 'EEE', 'Electrical and Electronics Engineering', 1, 1),
(8, 'EEE', 'Electrical and Electronics Engineering', 2, 1),
(9, 'MECH', 'Mechanical Engineering', 1, 1),
(10, 'MECH', 'Mechanical Engineering', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `designation` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`designation`, `status`) VALUES
('Assistant Professor', 1),
('Associate Professor', 1),
('Office Assistant', 1),
('Principal', 1),
('Professor', 1),
('System Administrator', 1),
('Technician', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_06_12_104039_create_personal_data_table', 1),
(4, '2017_06_13_051023_create_admins_table', 1),
(5, '2017_06_13_051146_create_staff_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section` varchar(8) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `year`) VALUES
(1, 'A', 3),
(2, 'A', 4),
(3, 'A', 5),
(4, 'A', 6),
(5, 'A', 7),
(6, 'A', 8),
(7, 'A', 9),
(8, 'A', 10),
(9, 'A', 11),
(10, 'A', 12),
(11, 'A', 13),
(12, 'A', 14),
(13, 'A', 15),
(14, 'A', 16),
(15, 'A', 17),
(16, 'A', 18),
(17, 'A', 23),
(18, 'A', 24),
(19, 'A', 25),
(20, 'A', 26),
(21, 'A', 27),
(22, 'A', 28),
(23, 'A', 29),
(24, 'A', 30),
(25, 'A', 31),
(26, 'A', 32),
(27, 'A', 33),
(28, 'A', 34),
(29, 'A', 35),
(30, 'A', 36),
(31, 'A', 37),
(32, 'A', 38),
(33, 'A', 45),
(34, 'A', 46),
(35, 'A', 47),
(36, 'A', 48),
(37, 'A', 49),
(38, 'A', 50),
(39, 'A', 51),
(40, 'A', 52),
(41, 'B', 3),
(42, 'B', 4),
(43, 'B', 5),
(44, 'B', 6),
(45, 'B', 7),
(46, 'B', 8),
(47, 'B', 9),
(48, 'B', 10),
(49, 'B', 11),
(50, 'B', 12),
(51, 'B', 13),
(52, 'B', 14),
(53, 'B', 15),
(54, 'B', 16),
(55, 'B', 17),
(56, 'B', 18),
(57, 'B', 23),
(58, 'B', 24),
(59, 'B', 25),
(60, 'B', 26),
(61, 'B', 27),
(62, 'B', 28),
(63, 'B', 29),
(64, 'B', 30),
(65, 'B', 31),
(66, 'B', 32),
(67, 'B', 33),
(68, 'B', 34),
(69, 'B', 35),
(70, 'B', 36),
(71, 'B', 37),
(72, 'B', 38),
(73, 'B', 45),
(74, 'B', 46),
(75, 'B', 47),
(76, 'B', 48),
(77, 'B', 49),
(78, 'B', 50),
(79, 'B', 51),
(80, 'B', 52),
(81, 'A', 1),
(82, 'A', 2),
(83, 'A', 19),
(84, 'A', 20),
(85, 'A', 21),
(86, 'A', 22),
(87, 'A', 39),
(88, 'A', 40),
(89, 'A', 41),
(90, 'A', 42),
(91, 'A', 43),
(92, 'A', 44),
(93, 'A', 53),
(94, 'A', 54),
(95, 'A', 55),
(96, 'A', 56),
(97, 'A', 57),
(98, 'A', 58);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dispname` varchar(15) DEFAULT NULL,
  `college` varchar(15) NOT NULL,
  `department` varchar(30) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dp` varchar(30) DEFAULT NULL,
  `present_address` text,
  `permanent_address` text,
  `employment_type` varchar(20) NOT NULL,
  `pan` varchar(20) DEFAULT NULL,
  `pan_file` varchar(30) NOT NULL,
  `aadhar` varchar(20) DEFAULT NULL,
  `aadhar_file` varchar(30) DEFAULT NULL,
  `passport` varchar(25) DEFAULT NULL,
  `passport_file` varchar(30) NOT NULL,
  `dateob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `placeob` varchar(255) DEFAULT NULL,
  `stateob` varchar(50) DEFAULT NULL,
  `countryob` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `reg_no`, `title`, `firstname`, `lastname`, `dispname`, `college`, `department`, `designation`, `qualification`, `email`, `mobile`, `dp`, `present_address`, `permanent_address`, `employment_type`, `pan`, `pan_file`, `aadhar`, `aadhar_file`, `passport`, `passport_file`, `dateob`, `doj`, `placeob`, `stateob`, `countryob`, `gender`, `nationality`, `religion`, `caste`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'RECMECH001', 'Mr.', 'Nikhil', 'Kumar', NULL, '1', '9', 'Associate Professor', 'M.Tech', 'i.nikhil@akrivia.in', '9866898768', 'RECMECH001_dp.png', 'City Office', 'College', 'Permanent', 'ABDFGT45RE', 'RECMECH001_pan.jpg', '1234 5678 9012', 'RECMECH001_aadhar.jpg', 'ASDF67VSKP123', 'RECMECH001_passport.png', '1986-07-11', '2015-07-25', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 0, '2017-06-30 07:13:03', '2017-07-17 03:59:26'),
(2, 'RECCSE548', 'Mr.', 'Sravan', 'Kumar', NULL, '1', '3', 'System Administrator', 'B.Tech', 'system.admin@gmail.com', '9849197874', NULL, 'city office', 'vizianagaram', 'Permanent', NULL, '', NULL, '', NULL, '', NULL, '2015-05-15', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 0, '2017-06-30 10:58:30', '2017-07-14 11:50:31'),
(3, 'RECEEE01', 'Mr.', 'Sivarama rao', 'Ch', NULL, '1', '7', 'Associate Professor', 'M.E.', 'techlead.it@raghues.com', '9492534735', 'RECEEE01_dp.jpg', 'College', 'PM Palem', 'Permanent', NULL, '', NULL, '', NULL, '', '1980-07-02', '2017-07-03', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 1, '2017-07-03 03:48:14', '2017-07-14 11:50:58'),
(4, 'xyz123', 'mr.', 'apparo', 'aoj', 'testing', '1', '5', 'Principal', 'Ph.D.', 'testmail@test.com', '1234569879', NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '2017-07-07 07:15:40', '2017-07-14 11:51:01');

--
-- Triggers `staff`
--
DELIMITER $$
CREATE TRIGGER `create_users_data` AFTER INSERT ON `staff` FOR EACH ROW BEGIN
	INSERT INTO users (name,reg_no,password,utype) values (New.firstname,New.reg_no,md5(New.reg_no),'stf');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_staff_timestamp` BEFORE UPDATE ON `staff` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff_certificate`
--

CREATE TABLE `staff_certificate` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `course` varchar(50) NOT NULL,
  `board` varchar(50) NOT NULL,
  `passyear` varchar(10) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `certificate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(6) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dispname` varchar(15) NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `fathername` varchar(255) DEFAULT NULL,
  `mothername` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `dp` varchar(30) DEFAULT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text,
  `aadhar` varchar(20) DEFAULT NULL,
  `dob` date NOT NULL,
  `college` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  `branch` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `placeob` varchar(255) DEFAULT NULL,
  `stateob` varchar(255) DEFAULT NULL,
  `countryob` varchar(255) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstname`, `lastname`, `dispname`, `reg_no`, `fathername`, `mothername`, `email`, `mobile`, `dp`, `present_address`, `permanent_address`, `aadhar`, `dob`, `college`, `course`, `branch`, `year`, `section`, `placeob`, `stateob`, `countryob`, `gender`, `nationality`, `religion`, `caste`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'CSE2YR', 'Kumar', 'Vinay', 'CSE2CR', '', '', 'cse_student@raghuenggcollege.com', '9879875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-05', 1, 1, 4, 12, 10, '', '', '', 'M', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-07-27 16:45:55'),
(3, 'CSE 1YR', 'A Sec', 'CSE_CR', 'CSE1CR', '', '', 'cse_cr_student@raghuenggcollege.com', '9879875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-05', 1, 1, 4, 11, 9, '', '', '', 'F', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-04 10:30:26'),
(5, 'ECE 2 YR A Sec.', 'A Sec', 'ECE_CR_2YR_A', 'RECECE2ACR', '', '', 'cse_cecefsdr_student@raghuenggcollege.com', '9879875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-05', 1, 1, 8, 24, 18, '', '', '', 'M', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-01 09:53:24'),
(6, 'ECE 4 YR A Sec.', 'A Sec', 'ECE_CR_4YR_A', 'RECECE4ACR', '', '', 'cse_cedfsadfsacefsdr_student@raghuenggcollege.com', '9879875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-05', 1, 1, 8, 26, 20, '', '', '', 'M', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-01 09:53:33'),
(7, 'ECE 3 YR A Sec.', 'A Sec', 'ECE_CR_3YR_A', 'RECECE3ACR', '', '', 'cse_cedfsadfsacefdfsadfsasdr_student@raghuenggcollege.com', '9879875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-05', 1, 1, 8, 25, 19, '', '', '', 'M', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-01 09:53:44'),
(8, 'RIT CSE 3A', 'A Sec', 'RIT CSE 3A', 'ritcse3a', '', '', 'cse_cedfsadfsadfscefdfsadfsasdr_student@raghuenggcollege.com', '9879875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-05', 2, 4, 5, 17, 15, '', '', '', 'F', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-04 10:30:22'),
(9, 'karthik', 'A Sec', 'RIT CSE 3A', 'reccse001', '', '', 'karthik@raghuenggcollege.com', '9879875855', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-09', 2, 4, 5, 17, 15, '', '', '', 'F', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-04 10:30:22'),
(10, 'jogesh', 'A Sec', 'ECE_CR_4YR_A', 'recmech001', '', '', 'jogesh@raghuenggcollege.com', '9879875856', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-22', 1, 1, 8, 26, 20, '', '', '', 'M', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-01 09:53:33'),
(11, 'suresh', 'A Sec', 'ECE_CR_4YR_A', 'recmech002', '', '', 'suresh@raghuenggcollege.com', '9879875256', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-16', 1, 1, 8, 26, 20, '', '', '', 'M', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-01 09:53:33'),
(18, 'praveen', 'Kumar', 'Vinay', 'reccse002', '', '', 'cse_student54@raghuenggcollege.com', '9879175850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-08', 1, 1, 4, 12, 10, '', '', '', 'M', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-07-27 16:45:55'),
(19, 'shrija', 'A Sec', 'ECE_CR_4YR_A', 'reccse003', '', '', 'csestudent3@raghuenggcollege.com', '9779875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-08', 1, 1, 8, 26, 20, '', '', '', 'F', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-01 09:53:33'),
(20, 'susmitha', 'A Sec', 'RIT CSE 3A', 'ritmech003', '', '', 'cse_student4@raghuenggcollege.com', '9869875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-15', 2, 4, 5, 17, 15, '', '', '', 'F', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-04 10:30:22'),
(21, 'abc', 'A Sec', 'RIT CSE 3A', '2018ca1', '', '', 'cse_ceadfsasdr_student@raghuenggcollege.com', '9879875821', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-05', 2, 4, 5, 17, 15, '', '', '', 'F', '', '', '', 'cr', 1, '2017-06-15 00:00:00', '2017-08-28 13:01:20');

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `update_students_timestamp` BEFORE UPDATE ON `students` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_no` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `utype` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `reg_no`, `password`, `utype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '50c2472801ba5f5158b71047563521ef', 'adm', '1234', '2017-06-13 02:00:00', '2017-07-13 08:46:01'),
(2, 'CseHod', 'RECCSE001', 'b1a5b64256e27fa5ae76d62b95209ab3', 'stf', '1235', '2017-06-14 12:29:29', '2017-06-14 12:29:29'),
(3, 'Vinay Kumar', '125CSE895', 'b1a5b64256e27fa5ae76d62b95209ab3', 'std', '1236', '2017-06-14 13:27:30', '2017-07-05 05:27:56'),
(11, 'Nikhil', 'RECMECH001', '50c2472801ba5f5158b71047563521ef', 'stf', NULL, NULL, '2017-07-13 08:28:46'),
(12, 'Sravan', 'RECCSE548', 'bd03b85c14862dbad8f4ea0ebf08c3a3', 'adm', NULL, NULL, '2017-07-05 09:02:31'),
(13, 'Sivarama rao', 'RECEEE01', 'd7792ea01be12978c51f26450979310f', 'adm', NULL, NULL, NULL),
(14, 'apparo', 'xyz123', '613d3b9c91e9445abaeca02f2342e5a6', 'stf', NULL, NULL, NULL);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `update_users_timestamp` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `id` int(11) NOT NULL,
  `year` varchar(8) NOT NULL,
  `branch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `year`
--

INSERT INTO `year` (`id`, `year`, `branch`) VALUES
(1, '1', 1),
(2, '2', 1),
(3, '1', 2),
(4, '2', 2),
(5, '3', 2),
(6, '4', 2),
(7, '1', 3),
(8, '2', 3),
(9, '3', 3),
(10, '4', 3),
(11, '1', 4),
(12, '2', 4),
(13, '3', 4),
(14, '4', 4),
(15, '1', 5),
(16, '2', 5),
(17, '3', 5),
(18, '4', 5),
(19, '1', 6),
(20, '2', 6),
(21, '1', 7),
(22, '2', 7),
(23, '1', 8),
(24, '2', 8),
(25, '3', 8),
(26, '4', 8),
(27, '1', 9),
(28, '2', 9),
(29, '3', 9),
(30, '4', 9),
(31, '1', 10),
(32, '2', 10),
(33, '3', 10),
(34, '4', 10),
(35, '1', 11),
(36, '2', 11),
(37, '3', 11),
(38, '4', 11),
(39, '1', 12),
(40, '2', 12),
(41, '1', 13),
(42, '2', 13),
(43, '1', 14),
(44, '2', 14),
(45, '1', 15),
(46, '2', 15),
(47, '3', 15),
(48, '4', 15),
(49, '1', 16),
(50, '2', 16),
(51, '3', 16),
(52, '4', 16),
(53, '1', 17),
(54, '2', 17),
(55, '1', 18),
(56, '2', 18),
(57, '1', 19),
(58, '2', 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branch` (`branch`,`course`);

--
-- Indexes for table `certificate_ctype`
--
ALTER TABLE `certificate_ctype`
  ADD UNIQUE KEY `cname` (`cname`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `college` (`college`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department` (`department`,`college`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD UNIQUE KEY `designation` (`designation`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_empid_unique` (`reg_no`),
  ADD UNIQUE KEY `staff_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `staff_certificate`
--
ALTER TABLE `staff_certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_no` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`reg_no`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `staff_certificate`
--
ALTER TABLE `staff_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `year`
--
ALTER TABLE `year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;--
-- Database: `raghuerp_dbnew`
--
CREATE DATABASE IF NOT EXISTS `raghuerp_dbnew` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `raghuerp_dbnew`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dp` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL COMMENT 'admin, management',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `reg_no`, `name`, `email`, `mobile`, `dp`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'admin@raghueducational.org', '8500373704', 'admin.jpg', 'admin', 1, '2017-06-13 02:00:00', '2017-07-17 04:09:26');

--
-- Triggers `admins`
--
DELIMITER $$
CREATE TRIGGER `update_admins_timestamp` BEFORE UPDATE ON `admins` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `attended`
--

CREATE TABLE `attended` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `atinstitutionname` varchar(255) NOT NULL,
  `atinstitutionaddress` varchar(255) NOT NULL,
  `frominstitutionname` varchar(255) NOT NULL,
  `frominstitutionaddress` varchar(255) NOT NULL,
  `area_field` varchar(255) NOT NULL,
  `title_details` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `awards_remarks` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attended`
--

INSERT INTO `attended` (`id`, `reg_no`, `atinstitutionname`, `atinstitutionaddress`, `frominstitutionname`, `frominstitutionaddress`, `area_field`, `title_details`, `duration`, `awards_remarks`, `certificate`) VALUES
(1, 'RECMECH001', 'dsfsaf', 'sdfasd', '123', '2313', '13123', '12312', '23123', '1', 'RECMECH001_dsfsaf_13123'),
(3, '13981A0507', 'RIT', 'vsk', 'REC', 'vsk', 'testing', 'testing tools are not enough', '2 weeks', '112', '13981A0507_RIT_testing.jpg.jpg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `branch` varchar(15) NOT NULL,
  `course` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch`, `course`, `fullname`, `status`) VALUES
(1, 'CAD/CAM', 2, 'Computer Aided Design', 1),
(2, 'CIVIL', 1, 'Civil Engineering', 1),
(3, 'CIVIL ', 4, 'Civil Engineering', 1),
(4, 'CSE', 1, 'Computer Science and Engineering', 1),
(5, 'CSE', 4, 'Computer Science and Engineering College', 1),
(6, 'CSE', 2, 'Computer Science and Engineering', 1),
(7, 'CSE', 3, 'Computer Science and Engineering', 1),
(8, 'ECE', 1, 'Electronics and Communication Engineering', 1),
(9, 'ECE', 4, 'Electronics and Communication Engineering', 1),
(10, 'EEE', 1, 'Electrical and Electronical Engineering', 1),
(11, 'EEE', 4, 'Electrical and Electronical Engineering', 1),
(12, 'Embd Sys & VLSI', 3, 'Embedded System and Very-large-scale integration', 1),
(13, 'Embd.Sys', 2, 'Embedded Systems', 1),
(14, 'M.D', 3, 'Machine Design', 1),
(15, 'MECH', 1, 'Mechanical Engineering', 1),
(16, 'MECH', 4, 'Mechanical Engineering', 1),
(17, 'P.E', 2, 'Power Electronics', 1),
(18, 'P.E', 3, 'Power Electronics', 1),
(19, 'S.E', 2, 'Software Engineering', 1),
(20, 's/w', 5, 'S/w', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certificate_ctype`
--

CREATE TABLE `certificate_ctype` (
  `cname` varchar(60) NOT NULL,
  `disporder` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `certificate_ctype`
--

INSERT INTO `certificate_ctype` (`cname`, `disporder`) VALUES
('Certification Course', 7),
('Diploma', 3),
('Graduation', 4),
('Intermediate', 2),
('Ph.D.', 6),
('Post Graduation', 5),
('PostDoc', 8),
('SSC', 1);

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` int(11) NOT NULL,
  `college` varchar(5) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `college`, `full_name`, `status`) VALUES
(1, 'REC', 'Raghu Engineering College', 1),
(2, 'RIT', 'Raghu Institute of Technology', 1),
(3, 'RCP', 'Raghu College of Pharmacy', 1),
(4, 'RES', 'Raghu Engineering College(Akv)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `consultancy_projects`
--

CREATE TABLE `consultancy_projects` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `frominstitutionname` varchar(255) NOT NULL,
  `frominstitutionaddress` varchar(255) NOT NULL,
  `area_field` varchar(255) NOT NULL,
  `title_details` varchar(255) NOT NULL,
  `value` float(10,2) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `teamsize` varchar(255) NOT NULL,
  `responsibilities` varchar(255) NOT NULL,
  `awards_remarks` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL,
  `forinstitutionname` varchar(255) NOT NULL,
  `forinstitutionaddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultancy_projects`
--

INSERT INTO `consultancy_projects` (`id`, `reg_no`, `frominstitutionname`, `frominstitutionaddress`, `area_field`, `title_details`, `value`, `duration`, `teamsize`, `responsibilities`, `awards_remarks`, `certificate`, `forinstitutionname`, `forinstitutionaddress`) VALUES
(4, 'RECMECH001', '12', '12', '12', '12', 12.00, '121', '2', '121', '122', 'RECMECH001_12_12.png.png', '12', '12'),
(6, 'RECMECH001', 'abcd', 'abcd', 'abcd', 'abcd', 0.00, 'abcd', 'abcd', 'abcd', 'abcd', 'RECMECH001_abcd_abcd.png', 'abcd', 'abcd'),
(7, '125CSE895', 'REC', 'visakhapatnam', 'facilities', 'lack of facilities', 210.00, '2 days', '10', 'manager', '2', '', 'RIT', 'visakhapatnam'),
(10, '13981A0507', 'REC', 'vsk', 'testing', 'testing tools are not sufficient', 254100.00, '1 month', '12', 'Manager', '1', '13981A0507_REC_testing.jpg', 'RIT', 'vsk'),
(11, '125CSE895', '123', '123', '312', '123', 123.00, '123', '123', '123', '7557', '', '123', '12');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course` varchar(10) NOT NULL,
  `college` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course`, `college`, `fullname`, `status`) VALUES
(1, 'B.Tech', 1, 'Bachelor of Technology', 1),
(2, 'M.Tech', 1, 'Master of Technology', 1),
(3, 'M.Tech', 2, 'Master of Technology', 1),
(4, 'B.Tech', 2, 'B.Tech', 1),
(5, 'software', 4, 'S/W', 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department` varchar(10) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `college` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department`, `full_name`, `college`, `status`) VALUES
(1, 'CIVIL', 'Civil Engineering', 1, 1),
(2, 'CIVIL', 'Civil Engineering', 2, 1),
(3, 'CSE', 'Computer Science and Engineering', 1, 1),
(4, 'CSE', 'Computer Science and Engineering', 2, 1),
(5, 'ECE', 'Electronics and Communication Engineering', 1, 1),
(6, 'ECE', 'Electronics and Communication Engineering', 2, 1),
(7, 'EEE', 'Electrical and Electronics Engineering', 1, 1),
(8, 'EEE', 'Electrical and Electronics Engineering', 2, 1),
(9, 'MECH', 'Mechanical Engineering', 1, 1),
(10, 'MECH', 'Mechanical Engineering', 2, 1),
(11, 'HNS', 'Human Science', 2, 1),
(12, 'sw', 'S/w', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `designation` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`designation`, `status`) VALUES
('123', 0),
('456', 1),
('Assistant Professor', 1),
('Associate Professor', 1),
('Office Assistant', 1),
('Principal', 1),
('Professor', 1),
('System Administrator', 1),
('Technician', 1),
('tester', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emergency_details`
--

CREATE TABLE `emergency_details` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `bloodgroup` varchar(16) NOT NULL,
  `weight` varchar(30) NOT NULL,
  `height` float(10,2) NOT NULL,
  `disability` varchar(100) NOT NULL,
  `eye_color` varchar(100) NOT NULL,
  `mark1` varchar(255) NOT NULL,
  `mark2` varchar(255) NOT NULL,
  `allergies` varchar(255) NOT NULL,
  `doctorname` varchar(255) NOT NULL,
  `doctor_no` int(30) NOT NULL,
  `medical_insurance` varchar(255) NOT NULL,
  `donateblood` varchar(16) NOT NULL,
  `w_donate` varchar(16) NOT NULL,
  `donateddate` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `firstrelation` varchar(255) NOT NULL,
  `c_no1` int(30) NOT NULL,
  `secondname` varchar(255) NOT NULL,
  `secondrelation` varchar(255) NOT NULL,
  `c_no2` int(30) NOT NULL,
  `sponsorship` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergency_details`
--

INSERT INTO `emergency_details` (`id`, `reg_no`, `bloodgroup`, `weight`, `height`, `disability`, `eye_color`, `mark1`, `mark2`, `allergies`, `doctorname`, `doctor_no`, `medical_insurance`, `donateblood`, `w_donate`, `donateddate`, `remarks`, `firstname`, `firstrelation`, `c_no1`, `secondname`, `secondrelation`, `c_no2`, `sponsorship`) VALUES
(1, 'RECMECH001', 'B+', '75kg', 6.20, 'null', 'blaCK', 'test1', 'test2', 'no', 'me', 123, 'null', 'No', 'No', '0000-00-00', '321', 'person1', 'test1', 11111, 'person2', 'test2', 2147483647, 'null'),
(2, 'rec507', 'B+', '76', 6.20, 'Null', 'Brown', 'Mole on left hand.', 'Mole on center of neck.', 'no', 'Rajsekhar', 2147483647, 'Null', 'No', 'No', '0000-00-00', 'null', 'Ramana', 'Father', 2147483647, 'Swarana', 'Mother', 123, 'no'),
(3, 'rec0091', 'AB-', '120', 7.00, '2', 'Black', '-', '-', 'no', 'mea', 0, 'no', 'No', 'No', '0000-00-00', 'no', 'no', 'no', 0, 'no', 'on', 0, 'no'),
(4, 'rec539', 'A+', '78 kg', 5.10, 'No', 'Black', 'Size fat', 'Akayapalam property', 'no', 'no', 0, 'no', 'No', 'No', '2017-08-01', 'no', 'no', 'n', 0, 'on', 'ononon', 0, 'no'),
(5, 'rec9998s', 'B+', '75kgs', 5.10, 'No', 'Black', '-', '-', 'No', 'Vasavi', 2147483647, 'No', 'Yes', 'Yes', '2016-12-14', 'No Remarks', 'Rohith', 'Friend', 2147483647, 'Poorna', 'Friend', 2147483647, 'NO'),
(6, '13981A0509', 'B+', '75kgs', 5.10, 'No', 'Black', '-', '-', 'No', 'Vasavi', 2147483647, 'No', 'Yes', 'Yes', '2016-12-14', 'No Remarks', 'Rohith', 'Friend', 2147483647, 'Poorna', 'Friend', 2147483647, 'NO'),
(7, '13981A0502', 'B+', '75kgs', 5.10, 'No', 'Black', '-', '-', 'No', 'Vasavi', 2147483647, 'No', 'Yes', 'Yes', '2016-12-14', 'No Remarks', 'Rohith', 'Friend', 2147483647, 'Poorna', 'Friend', 2147483647, 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `extraactivites`
--

CREATE TABLE `extraactivites` (
  `id` int(255) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `details` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `extraactivites`
--

INSERT INTO `extraactivites` (`id`, `reg_no`, `details`, `description`, `certificate`) VALUES
(1, '125CSE895', 'NCC', 'Got C certificate', '125CSE895_NCC'),
(2, 'RECMECH001', 'fasdfsad', 'fafasdfasdfasdfasdfsdf\nadsfasdf\nf\nasdfasf', 'RECMECH001_fasdfsad.jpg'),
(3, 'RECMECH001', 'NCC', '123456', 'RECMECH001_NCC'),
(5, '13981A0507', 'testing', 'testing -1,testing -2,testing -3123', '13981A0507_testing.jpg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `fdps_conducted`
--

CREATE TABLE `fdps_conducted` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `frominstitutionname` varchar(255) NOT NULL,
  `frominstitutionaddress` varchar(255) NOT NULL,
  `forinstitutionaddress` varchar(255) NOT NULL,
  `forinstitutionname` varchar(255) NOT NULL,
  `area_field` varchar(255) NOT NULL,
  `title_details` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `awards_remarks` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fdps_conducted`
--

INSERT INTO `fdps_conducted` (`id`, `reg_no`, `frominstitutionname`, `frominstitutionaddress`, `forinstitutionaddress`, `forinstitutionname`, `area_field`, `title_details`, `duration`, `awards_remarks`, `certificate`) VALUES
(6, 'RECMECH001', '25', '2', '2', '2', '2', '2', '2', '2', 'RECMECH001_2_2.png'),
(7, 'RECCSE548', '2', '2', '2', '2', '2', '2', '2', '2', 'RECCSE548_2_2'),
(12, '13981A0539', 'fudk', 'dghj', 'jdghj', 'dhgjkdgh', 'dgkj', 'dghjk', 'ghkd', 'hkgd', '13981A0539_dgkj_dghjk.png'),
(13, 'RECMECH001', '123', '213', '1321', '23', '321', '321321321231', '231321', '231', 'RECMECH001_321_321321321231.png'),
(14, 'RECMECH001', 'Gmr', 'Rajam', 'Sontayam', 'NSRIT', 'Basket Ball', 'Capten', ' 4 days', 'Best Playes', 'RECMECH001_Gmr_Basket Ball');

-- --------------------------------------------------------

--
-- Table structure for table `left_table`
--

CREATE TABLE `left_table` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `left_date` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `left_table`
--

INSERT INTO `left_table` (`id`, `reg_no`, `left_date`, `reason`) VALUES
(1, '132', '2017-08-12', 'fh'),
(2, '13981A0539', '2017-08-16', 'Health Issue.'),
(3, 'rec539', '2017-08-18', 'Health Issue'),
(4, '125CSE895', '2017-08-22', 'testing');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `mid` int(11) NOT NULL,
  `mtype` varchar(10) NOT NULL,
  `mailtype` varchar(10) NOT NULL,
  `application_type` varchar(30) NOT NULL,
  `mto` varchar(255) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `bcc` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `processed` bit(1) NOT NULL DEFAULT b'0',
  `processed_return` text NOT NULL,
  `insert_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`mid`, `mtype`, `mailtype`, `application_type`, `mto`, `cc`, `bcc`, `subject`, `message`, `processed`, `processed_return`, `insert_dt`) VALUES
(0, 'mail', 'd', 'd', 'd', 'd', '', 'd', 'd', b'0', '', '2017-08-23 06:11:08'),
(0, 'mail', 'm', 'm', 'm', 'm', '', 'm', 'm', b'0', '', '2017-08-23 06:12:00'),
(0, 'mail', 'r', 'r', 'r', 'r', '', 'r', 'r', b'0', '', '2017-08-23 06:28:22'),
(0, 'mail', '5', '5', '5', '5', '', '5', '5', b'0', '', '2017-08-23 09:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_06_12_104039_create_personal_data_table', 1),
(4, '2017_06_13_051023_create_admins_table', 1),
(5, '2017_06_13_051146_create_staff_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patents`
--

CREATE TABLE `patents` (
  `id` int(255) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` varchar(500) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patents`
--

INSERT INTO `patents` (`id`, `reg_no`, `title`, `details`, `certificate`) VALUES
(2, 'RECMECH001', 'The Manoj test', 'Great Person Manoj doing test', 'RECMECH001_Manoj test.png'),
(5, '13981A0507', 'testing', 'testing -1,\ntesting -2,\ntesting -3', '13981A0507_testing');

-- --------------------------------------------------------

--
-- Table structure for table `preffered_teaching`
--

CREATE TABLE `preffered_teaching` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `no_years` int(30) NOT NULL,
  `awards_remarks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preffered_teaching`
--

INSERT INTO `preffered_teaching` (`id`, `reg_no`, `subject`, `semester`, `experience`, `no_years`, `awards_remarks`) VALUES
(1, 'recmech001', 'Maths', '1', '2 years', 2, 'Yes'),
(2, 'admin', 'test', 'test', 'test', 0, 'test'),
(3, 'RECMECH001', '789', '879', '789', 897, '2222'),
(5, '125CSE895', 'Science', '12', '2', 2, '2'),
(6, '125CSE895', 'Maths', '4', '2', 2, 'More'),
(8, 'RECMECH001', '12', '12', '12', 12, '123'),
(9, 'RECMECH001', '45', '45', '54', 54, '54'),
(14, 'RECMECH001', 'chem', '12', '12', 12, '12'),
(15, 'RECMECH001', '66', '666', '666', 666, '66');

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `forinstitutionname` varchar(255) NOT NULL,
  `forinstitutionaddress` varchar(255) NOT NULL,
  `frominstitutionname` varchar(255) NOT NULL,
  `frominstitutionaddress` varchar(255) NOT NULL,
  `area_field` varchar(255) NOT NULL,
  `title_details` varchar(255) NOT NULL,
  `value` float(10,2) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `outcome` varchar(100) NOT NULL,
  `awards_remarks` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proposals`
--

INSERT INTO `proposals` (`id`, `reg_no`, `forinstitutionname`, `forinstitutionaddress`, `frominstitutionname`, `frominstitutionaddress`, `area_field`, `title_details`, `value`, `duration`, `outcome`, `awards_remarks`, `certificate`) VALUES
(8, 'RECMECH001', '12', '12', '12', '12', '121', '21', 21.00, '21', 'Awarded', '2', 'RECMECH001_12_121.png.jpg'),
(9, '125CSE895', 'rec', 'rec', 'rec', 'rec', 'rec', 'rec', 0.00, 'rec', 'Not Awarded', '123', ''),
(12, '125CSE895', 'sdasdf', 'dfadsfasa', 'dsfasd', 'fdasfa', 'dsfadsf', 'dasf', 0.00, 'fasdfasdf', 'Not Awarded', 'sdfdasf', '125CSE895_dsfasd_dsfadsf.jpg'),
(14, 'RECMECH001', '123', '123', 'Gmr', '123', '123', '123', 123.00, '123', 'Awarded', '123', 'RECMECH001_Gmr_123.png');

-- --------------------------------------------------------

--
-- Table structure for table `research_work`
--

CREATE TABLE `research_work` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `frominstitutionname` varchar(255) NOT NULL,
  `frominstitutionaddress` varchar(255) NOT NULL,
  `area_field` varchar(255) NOT NULL,
  `title_details` varchar(255) NOT NULL,
  `awards_remarks` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL,
  `value` float(10,2) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `outcome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `research_work`
--

INSERT INTO `research_work` (`id`, `reg_no`, `frominstitutionname`, `frominstitutionaddress`, `area_field`, `title_details`, `awards_remarks`, `certificate`, `value`, `duration`, `outcome`) VALUES
(6, 'RECMECH001', '12', '12', '121', '21', '1', 'RECMECH001_121_21.png.png', 21.00, '21', 'UnSuccessfull'),
(8, '13981A0507', 'REC', 'vsk', 'testing', 'testing tools were not sufficient', 'No remarks', '13981A0507_REC_testing.jpg.jpg', 250000.00, '2 months', 'Partially Successful ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section` varchar(8) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `year`) VALUES
(1, 'A', 3),
(2, 'A', 4),
(4, 'A', 6),
(5, 'A', 7),
(6, 'B', 1),
(7, 'A', 9),
(8, 'A', 10),
(9, 'A', 11),
(10, 'A', 12),
(11, 'A', 13),
(12, 'A', 14),
(13, 'A', 15),
(14, 'A', 16),
(15, 'A', 17),
(16, 'A', 18),
(17, 'A', 23),
(18, 'A', 24),
(19, 'A', 25),
(20, 'A', 26),
(21, 'A', 27),
(22, 'A', 28),
(23, 'A', 29),
(24, 'A', 30),
(25, 'A', 31),
(26, 'A', 32),
(27, 'A', 33),
(28, 'A', 34),
(29, 'A', 35),
(30, 'A', 36),
(31, 'A', 37),
(32, 'A', 38),
(33, 'A', 45),
(34, 'A', 46),
(35, 'A', 47),
(36, 'A', 48),
(37, 'A', 49),
(38, 'A', 50),
(39, 'A', 51),
(40, 'A', 52),
(41, 'B', 3),
(42, 'B', 4),
(43, 'B', 5),
(44, 'B', 6),
(45, 'B', 7),
(46, 'B', 8),
(47, 'B', 9),
(48, 'B', 10),
(49, 'B', 11),
(50, 'B', 12),
(51, 'B', 13),
(52, 'B', 14),
(53, 'B', 15),
(54, 'B', 16),
(55, 'B', 17),
(56, 'B', 18),
(57, 'B', 23),
(58, 'B', 24),
(59, 'B', 25),
(60, 'B', 26),
(61, 'B', 27),
(62, 'B', 28),
(63, 'B', 29),
(64, 'B', 30),
(65, 'B', 31),
(66, 'B', 32),
(67, 'B', 33),
(68, 'B', 34),
(69, 'B', 35),
(70, 'B', 36),
(71, 'B', 37),
(72, 'B', 38),
(73, 'B', 45),
(74, 'B', 46),
(75, 'B', 47),
(76, 'B', 48),
(77, 'B', 49),
(78, 'B', 50),
(79, 'B', 51),
(80, 'B', 52),
(81, 'A', 1),
(82, 'A', 2),
(83, 'A', 19),
(84, 'A', 20),
(85, 'A', 21),
(86, 'A', 22),
(87, 'A', 39),
(88, 'A', 40),
(89, 'A', 41),
(90, 'A', 42),
(91, 'A', 43),
(92, 'A', 44),
(93, 'A', 53),
(94, 'A', 54),
(95, 'A', 55),
(96, 'A', 56),
(97, 'A', 57),
(98, 'A', 58),
(99, 'D', 4),
(100, '00000000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dispname` varchar(15) DEFAULT NULL,
  `college` varchar(15) NOT NULL,
  `department` varchar(30) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dp` varchar(30) DEFAULT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `present_address` text,
  `permanent_address` text,
  `employment_type` varchar(20) NOT NULL,
  `pan` varchar(20) DEFAULT NULL,
  `pan_file` varchar(30) NOT NULL,
  `aadhar` varchar(20) DEFAULT NULL,
  `aadhar_file` varchar(30) DEFAULT NULL,
  `passport` varchar(25) DEFAULT NULL,
  `passport_file` varchar(30) NOT NULL,
  `dateob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `placeob` varchar(255) DEFAULT NULL,
  `stateob` varchar(50) DEFAULT NULL,
  `countryob` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `personal_email` varchar(255) NOT NULL,
  `personal_phone_no` varchar(255) NOT NULL,
  `spouce_name` varchar(255) NOT NULL,
  `spouce_age` varchar(255) NOT NULL,
  `spouce_employment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `reg_no`, `title`, `firstname`, `lastname`, `dispname`, `college`, `department`, `designation`, `qualification`, `email`, `mobile`, `dp`, `father_name`, `mother_name`, `present_address`, `permanent_address`, `employment_type`, `pan`, `pan_file`, `aadhar`, `aadhar_file`, `passport`, `passport_file`, `dateob`, `doj`, `placeob`, `stateob`, `countryob`, `gender`, `nationality`, `religion`, `caste`, `role`, `status`, `created_at`, `updated_at`, `personal_email`, `personal_phone_no`, `spouce_name`, `spouce_age`, `spouce_employment`) VALUES
(1, 'RECMECH001', 'Mr.', 'Nikhil', ' Kumar', 'Nikhil', '1', '9', 'Associate Professor', 'Ph.D', 'i.nikhil@akrivia.in', '1234567890', 'RECMECH001_dp.png', 'father', 'mother', 'Visakhapatnam.1258', 'vizinagaram111', 'Permanent', 'ABDFGT45RE', 'RECMECH001_pan.png', '1212 2524 3321', 'RECMECH001_aadhar.png', 'ASDF67VSKP123', 'RECMECH001_passport.png', '1996-08-20', '2017-08-02', 'palce of birth', 'birth state', 'country ', 'M', 'nationality', 'religion', 'caste', 'ps', 1, '2017-06-30 07:13:03', '2017-08-23 11:57:31', 'personal_id', 'personal no', 'nukl', '12', 'no'),
(2, 'RECCSE548', 'Mr.', 'Sravan', 'Kumar', NULL, '1', '3', 'System Administrator', 'B.Tech', 'system.admin@gmail.com', '9849197874', NULL, 'father', 'mother', 'city office', 'vizianagaram', 'Permanent', NULL, '', NULL, '', NULL, '', '2017-08-02', '2017-08-02', 'palce', 'birth state', 'country', 'M', 'nationality', 'religion', 'caste', '', 0, '2017-06-30 10:58:30', '2017-08-23 10:23:19', 'pr_is', 'pr_no', 'sp_name_test', 'sp_age_test', 'sp_emp_test'),
(3, 'RECEEE01', 'Mr.', 'Sivarama rao', 'Ch', NULL, '1', '7', 'Associate Professor', 'M.E.', '12345@gmail.com', '9492534735', 'RECEEE01_dp.jpg', '', '', 'College', 'PM Palem', 'Permanent', NULL, '', NULL, '', NULL, '', NULL, '2017-07-03', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 1, '2017-07-03 03:48:14', '2017-08-21 03:51:28', '', '', '', '', '0'),
(4, 'xyz123', 'Mr.', 'apparo', 'aoj', 'testing', '1', '5', 'Principal', 'Ph.D.', 'testmail@test.com', '1234569879', NULL, '', '', '132', '132', 'Contract', NULL, '', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 2, '2017-07-07 07:15:40', '2017-08-24 11:56:09', '', '', '', '', '0'),
(12, 'rec9998', 'Mr.', '123456', '123456', NULL, '1', '1', 'Assistant Professor', 'mtech', '9998@gmail.com', '9998999854', NULL, '', '', 'sg', 'gsf', 'Probation', NULL, '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 1, '2017-08-16 09:33:55', '2017-08-16 09:33:55', '', '', '', '', ''),
(13, 'rec9977', 'Mrs.', '9977', '9977', NULL, '1', '3', 'Associate Professor', '9977', '9977@gmail.com', '9977997765', NULL, '', '', '9977', '9977', 'Contract', NULL, '', NULL, NULL, NULL, '', '2017-08-16', '2017-08-16', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 1, '2017-08-16 09:35:31', '2017-08-16 09:35:31', '', '', '', '', ''),
(20, 'rec0091', 'Mr.', 'Raju', 'Sanayasi', NULL, '1', '3', 'Associate Professor', 'M.Tech', '123@gmail.com', '123456789', NULL, '', '', NULL, NULL, 'Probation', NULL, '', NULL, NULL, NULL, '', NULL, '0000-00-00', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 0, '2017-08-21 04:04:33', '2017-08-23 10:23:26', '', '', '', '', ''),
(23, 'rec0093', 'Mr.', 'Rajesh', '', NULL, '1', '5', 'Associate Professor', 'mtech', 'rajesh@gmail.com', '7412589630', NULL, '', '', NULL, NULL, 'Probation', NULL, '', NULL, NULL, NULL, '', '0000-00-00', '2017-08-19', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 1, '2017-08-21 09:17:51', '2017-08-21 09:17:51', '', '', '', '', ''),
(24, 'rec0092', 'Mr.', 'Rajesh', '', NULL, '1', '5', 'Associate Professor', 'mtech', 'rajesh2@gmail.com', '74125896302', NULL, '', '', NULL, NULL, 'Probation', NULL, '', NULL, NULL, NULL, '', '0000-00-00', '2017-08-19', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 1, '2017-08-21 09:18:18', '2017-08-21 09:18:18', '', '', '', '', ''),
(31, '13981A0507', 'Mr.', 'Rohith', 'A', NULL, '1', '5', 'Assistant Professor', 'M tech', 'raja@gmail.com', '12345678900', '13981A0507_dp.png', 'Asina Ramana', 'Asina Swarna', 'Vsk', 'CSk', 'Permanent', '2145 2563 1452', '13981A0507_pan.jpg', '2561 4521 6523', '13981A0507_aadhar.jpg', '2145 2563 5623', '13981A0507_passport.jpg', NULL, '2017-08-23', 'Vizag', 'Andhra Pradesh', 'India', 'M', 'Indian', 'Hindu', 'General', '', 1, '2017-08-23 06:28:22', '2017-08-23 09:30:39', 'rajarohit.in@gmail.com', '8596452563', 'Hema Asina', '19yrs', 'No');

--
-- Triggers `staff`
--
DELIMITER $$
CREATE TRIGGER `create_users_data` AFTER INSERT ON `staff` FOR EACH ROW BEGIN
	
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_staff_timestamp` BEFORE UPDATE ON `staff` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff_certificate`
--

CREATE TABLE `staff_certificate` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `course` varchar(50) NOT NULL,
  `board` varchar(50) NOT NULL,
  `passyear` varchar(10) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_certificate`
--

INSERT INTO `staff_certificate` (`id`, `reg_no`, `course`, `board`, `passyear`, `grade`, `certificate`) VALUES
(62, 'RECMECH001', 'Post Graduation', '2', '2', '1', 'RECMECH001_Post Graduation.png'),
(63, 'RECMECH001', 'Intermediate', 'dsg', 'gsd', 'gsf', 'RECMECH001_Intermediate.png.png.png'),
(65, 'rec507', 'SSC', 'State Board', '2011', 'A+', 'rec507_SSC'),
(67, '125CSE895', 'Diploma', '12', '123', '312', '125CSE895_Diploma.jpg'),
(71, 'RECEEE01', 'Intermediate', 'APIED', '2011', 'A+', 'RECEEE01_Intermediate'),
(73, '13981A0507', 'Graduation', 'JNTUK', '2017', 'A+', '13981A0507_Graduation.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staff_children_info`
--

CREATE TABLE `staff_children_info` (
  `id` int(255) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `child_name` varchar(255) NOT NULL,
  `child_age` varchar(255) NOT NULL,
  `child_gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_children_info`
--

INSERT INTO `staff_children_info` (`id`, `reg_no`, `child_name`, `child_age`, `child_gender`) VALUES
(1, 'RECMECH001', '123', '123', 'male'),
(2, 'RECMECH001', 'Manoj', '22', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `staff_collegeaccount`
--

CREATE TABLE `staff_collegeaccount` (
  `id` int(255) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `pf_number` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `name_in_bank` varchar(255) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `bank_address` varchar(500) NOT NULL,
  `ifc_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_collegeaccount`
--

INSERT INTO `staff_collegeaccount` (`id`, `reg_no`, `pf_number`, `bank_name`, `name_in_bank`, `account_no`, `bank_address`, `ifc_code`) VALUES
(1, 'rec539', '1234567890', 'Federal', 'Manoj', '7418529630', 'Green Park.', '74ABC'),
(2, 'RECMECH001', '4374673929903', 'Federal', 'Nikhil Kumar', '9999028263512', 'Near Green Park,\nSiripooram,\nvisakhapatnam.', '25413'),
(3, '125CSE895', '47373439792798', 'Federal', 'Vinay Kumar', '99901233437889', 'Near Green Park,\nSiripooram,\nVisakhapatnam', '25632'),
(4, 'rec539', '1234 5678 9632', 'FEderal', 'Manoj', 'APd56415684', 'Dabagardens, Visakhapatnam', '1254952'),
(5, '13981A0507', '123 456', 'HDFC', 'Manoj', 'HDFC741', 'Vsk', 'HDFC741');

-- --------------------------------------------------------

--
-- Table structure for table `staff_experience`
--

CREATE TABLE `staff_experience` (
  `id` int(255) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `teach_tech` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_experience`
--

INSERT INTO `staff_experience` (`id`, `reg_no`, `from_date`, `to_date`, `total`, `company_name`, `designation`, `teach_tech`, `certificate`) VALUES
(1, '13981A0525', '2017-08-01', '2017-08-02', '11', '11', '11', 'Teaching', '13981A0525_11'),
(10, '125CSE895', '2017-08-05', '2017-08-04', '2', 'Opentext123', 'demo', 'Teaching', '125CSE895_14_10.png'),
(11, 'rec539', '2017-08-31', '2017-09-22', '1 year', 'REC', 'Developer', 'Industry', 'rec539_REC.jpg'),
(16, 'rec9998', '2017-08-04', '2017-08-05', 'asd', 'acv', 'asd', 'Teaching', 'rec9998_sdqa.jpg'),
(17, 'RECMECH001', '2010-08-03', '2017-08-22', '7', 'Akrivia', 'Tech Manager', 'Industry', 'RECMECH001_Akrivia_17.jpg'),
(19, 'RECMECH001', '2017-08-12', '2017-08-18', '3', 'gfsdf', 'dsg', 'Industry', 'RECMECH001_gfsdf_19.jpg'),
(20, '13981A0507', '2017-01-05', '2017-08-23', '8 months', 'Akrivia', 'Application Developer', 'Industry', '13981A0507_Akrivia_20.jpg'),
(21, '13981A0507', '2017-08-04', '2017-08-03', '2 yrs', 'testing', 'testing', 'Industry', '13981A0507_undefined.jpg'),
(22, '125CSE895', '2017-08-06', '2017-08-04', '132', '132', '123', 'Teaching', '125CSE895_undefined.png');

-- --------------------------------------------------------

--
-- Table structure for table `staff_publications`
--

CREATE TABLE `staff_publications` (
  `id` int(255) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `categoty` varchar(255) NOT NULL,
  `paper_title` varchar(255) NOT NULL,
  `authors` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `brief_description` varchar(255) NOT NULL,
  `publisher_type` varchar(255) NOT NULL,
  `publisher_name` varchar(255) NOT NULL,
  `scopus_index` varchar(255) NOT NULL,
  `impact_factor` varchar(255) NOT NULL,
  `publishing_date` varchar(255) NOT NULL,
  `page_no` varchar(255) NOT NULL,
  `awards` varchar(255) NOT NULL,
  `citations` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_publications`
--

INSERT INTO `staff_publications` (`id`, `reg_no`, `categoty`, `paper_title`, `authors`, `specialization`, `brief_description`, `publisher_type`, `publisher_name`, `scopus_index`, `impact_factor`, `publishing_date`, `page_no`, `awards`, `citations`, `certificate`) VALUES
(1, '125CSE895', 'Article', 'Times of India', 'Rambabu', 'Nothing', 'Emo', 'National', 'Manoj', '123', 'nothing', '2017-08-02', '5', 'Null', '1324', '125CSE895_Times of India.png'),
(2, '125CSE895', 'Paper', 'Durga', '123', '1232', '123', 'International', '531', '456', '546', '2017-08-12', '56+', '465', '465654', '125CSE895_Durga.png'),
(3, 'RECMECH001', 'Paper', 'testing', 'testing', 'testing', 'testing', 'National', 'testing', 'testing', 'testing', '2017-08-17', '2101', 'testing', 'testing', 'RECMECH001_testing.jpg'),
(4, 'RECMECH001', 'Article', 'manoj', '123', '123', '123', 'National', '123', '123', '123', '', '13', '123', '255555555', 'RECMECH001_123.png.png.png'),
(5, '125CSE895', 'Article', '123', '123', '231', '1231', 'National', '231', '312', '32312', '2017-08-03', '1231', '231', '123', '125CSE895_123.jpg'),
(6, '13981A0507', 'Article', 'test', 'test', 'test', 'test', 'National', 'test', 'test', 'test', '2017-08-14', 'test', 'test', 'test', '13981A0507_test.jpg'),
(8, 'RECMECH001', 'Material', '123', '132', '132', '132', 'International', '321', '321', '321', '', '1325146', '54654', '657', 'RECMECH001_123.png');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(6) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dispname` varchar(15) NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `college` varchar(20) NOT NULL,
  `course` varchar(20) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `fathername` varchar(255) DEFAULT NULL,
  `mothername` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `dp` varchar(30) DEFAULT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text,
  `aadhar` varchar(20) DEFAULT NULL,
  `aadhar_file` varchar(255) NOT NULL,
  `passport` varchar(255) NOT NULL,
  `passport_file` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `pan_file` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `placeob` varchar(255) DEFAULT NULL,
  `stateob` varchar(255) DEFAULT NULL,
  `countryob` varchar(255) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admission_category` varchar(20) NOT NULL,
  `admission_no` varchar(255) NOT NULL,
  `enrollment_no` varchar(255) NOT NULL,
  `entry_passout` varchar(255) NOT NULL,
  `living_status` varchar(255) NOT NULL,
  `admission_type` varchar(255) NOT NULL,
  `admission_date` varchar(255) NOT NULL,
  `scholarship_status` varchar(255) NOT NULL,
  `staff_child` varchar(255) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `aconomically_backword` varchar(255) NOT NULL,
  `father_income` varchar(255) NOT NULL,
  `mother_income` varchar(255) NOT NULL,
  `proposed_discount` varchar(255) NOT NULL,
  `personal_email` varchar(255) NOT NULL,
  `personal_phone_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstname`, `lastname`, `dispname`, `reg_no`, `college`, `course`, `branch`, `year`, `section`, `fathername`, `mothername`, `email`, `mobile`, `dp`, `present_address`, `permanent_address`, `aadhar`, `aadhar_file`, `passport`, `passport_file`, `pan`, `pan_file`, `dob`, `placeob`, `stateob`, `countryob`, `gender`, `nationality`, `religion`, `caste`, `role`, `status`, `created_at`, `updated_at`, `admission_category`, `admission_no`, `enrollment_no`, `entry_passout`, `living_status`, `admission_type`, `admission_date`, `scholarship_status`, `staff_child`, `transport`, `aconomically_backword`, `father_income`, `mother_income`, `proposed_discount`, `personal_email`, `personal_phone_no`) VALUES
(1, 'Vinay', 'Kumar', 'Vinay', '125CSE895', '1', '1', '5', 2, 2, NULL, NULL, 'cse_student@raghuenggcollege.com', '9879875850', '125CSE895_dp.jpg', 'Raghu Engineering College', 'NAD Kotha Road', '', '', '', '', '', '', '2017-07-23', 'ap', 'ap', 'India', 'M', 'Indian', 'Hindu', 'Kshatriyas', '', 2, '2017-06-15 00:00:00', '2017-08-31 17:38:31', 'BC-A', '125CSE895', '125CSE895', '2013-2017', 'Day Scholar', 'Counciling (Convener)', '2017-07-23', 'No', 'No', 'No', 'No', '1,50,000', '75,000', 'No', 'vinay@gmail.com', '2563415263'),
(5, 'Manoj Varma', 'K', 'Maonoj', 'rec539', '1', '1', '7', 2, 2, 'Father', 'Mother', 'manoj539@gmail.com', '7895213640', NULL, 'Town kotha road', 'Akayapalam', '1234 5678 9512', 'rec539_aadhar.png', '', '', '', '', '2017-07-23', 'Kakinada', 'Ap', 'India', 'M', 'Indian', 'Hindhu', 'Oc', '', 1, '2017-08-17 14:33:05', '2017-08-31 17:38:34', 'General', '2541455722210', '13981A0539', '2013-2017', 'Day Scholar', 'Counciling (Convener)', '2017-07-07', 'Yes', 'No', 'No', 'Yes', '200000', '7000', 'Yes', 'manojvarama143@gmail.com', '90005060404010203'),
(6, 'Rohith', 'Asina', 'Rohith', 'rec507', '1', '1', '2', 2, 2, NULL, NULL, 'rajarohit.in@gmail.com', '8374384580', NULL, 'Visakhapatnam', 'Visakhapatnam', '1234 5678 9541', 'rec507_aadhar.png', '', '', '9845 6574 2654', 'rec507_pan.png', '2017-08-17', 'vsk', 'Ap', 'India', 'M', 'Indian', 'Christian', 'oc', '', 1, '2017-08-17 15:09:44', '2017-08-31 17:38:37', 'OBC', 'RECCS13981507', 'ENRRECCSE5', '2013-2017', 'Day Scholar', 'Counciling (Convener)', '2017-08-17', 'Yes', 'No', 'No', 'Yes', '70000', '30000', 'Yes', 'raja@gmail.com', '8374384580'),
(7, '123987', '123987', '123987', '123987', '1', '1', '3', 2, 2, NULL, NULL, '123987@gmail.com', '123987', NULL, '123987', '123987', NULL, '', '', '', '', '', '2017-08-01', NULL, NULL, NULL, 'M', NULL, NULL, NULL, '', 1, '2017-08-29 09:23:48', '2017-08-31 17:38:40', 'BC-D', '123987', '123987', '123987', 'Day Scholar', 'Counciling (Convener)', '2017-08-01', 'Yes', '', '', '', '', '', '', '', '');

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `update_students_timestamp` BEFORE UPDATE ON `students` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_no` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `utype` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `reg_no`, `password`, `utype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'adm', '1234', '2017-06-13 02:00:00', '2017-08-29 05:26:53'),
(2, 'CseHod', 'RECCSE001', 'e10adc3949ba59abbe56e057f20f883e', 'stf', '1235', '2017-06-14 12:29:29', '2017-08-14 11:25:16'),
(3, 'Vinay', '125CSE895', '93ef7669244e75c9e1eda49d1a4c4a55', 'std', '1236', '2017-06-14 13:27:30', '2017-08-23 04:14:21'),
(11, 'Nikhil', 'RECMECH001', '2cc8d2ca1f0f369f6f3f3943d8064850', 'stf', NULL, NULL, '2017-08-23 10:45:47'),
(12, 'Sravan', 'RECCSE548', 'b1a5b64256e27fa5ae76d62b95209ab3', 'adm', NULL, NULL, '2017-08-17 11:42:24'),
(13, 'Sivarama rao', 'RECEEE01', 'd7792ea01be12978c51f26450979310f', 'adm', NULL, NULL, '2017-08-21 03:51:28'),
(14, 'apparo', 'xyz123', 'b1a5b64256e27fa5ae76d62b95209ab3', 'stf', NULL, NULL, '2017-08-24 11:56:09'),
(30, '123456', 'rec9998', 'b2d62796f3b6b183443db46f02d02939', 'stf', NULL, '2017-08-16 09:33:55', '2017-08-16 09:33:55'),
(32, '9977', 'rec9977', 'c1bbe1f7308b2d2e09460bef841aa0c5', 'stf', NULL, '2017-08-16 09:35:31', '2017-08-16 09:35:31'),
(36, 'Manoj Varma', 'rec539', '1e1fbd0f61c7390b5ba1d3676f3ff542', 'std', NULL, '2017-08-17 09:03:05', '2017-08-23 03:51:33'),
(37, 'Rohith', 'rec507', '39a8b8911b3e5d35c10f5d1807dc709a', 'std', NULL, '2017-08-17 09:39:45', '2017-08-18 05:32:37'),
(44, 'Raju', 'rec0091', 'be7d566123964adf2f8da9364073bce8', 'stf', NULL, '2017-08-21 04:04:33', '2017-08-21 04:04:33'),
(49, 'Rajesh', 'rec0093', 'b929fab56da43e1c721ce26d5ee7c699', 'stf', NULL, '2017-08-21 09:17:51', '2017-08-21 09:17:51'),
(51, 'Rajesh', 'rec0092', '3022508aa85171383cdc443303b413c9', 'stf', NULL, '2017-08-21 09:18:18', '2017-08-21 09:18:18'),
(61, 'Rohith', '13981A0507', 'e10adc3949ba59abbe56e057f20f883e', 'stf', NULL, '2017-08-23 06:28:22', '2017-08-23 06:32:44'),
(62, '546', '123', '4ccd80f4094469930f48433254b31d11', 'std', NULL, '2017-08-23 09:21:23', '2017-08-23 09:21:23'),
(63, '123987', '123987', '15586ef14a4dba26707ce6a6bda3707b', 'std', NULL, '2017-08-29 03:53:48', '2017-08-29 03:53:48');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `update_users_timestamp` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `id` int(11) NOT NULL,
  `year` varchar(8) NOT NULL,
  `branch` int(11) NOT NULL,
  `department` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `year`
--

INSERT INTO `year` (`id`, `year`, `branch`, `department`) VALUES
(1, '1', 1, 9),
(2, '2', 1, 9),
(3, '1', 2, 1),
(4, '2', 2, 1),
(5, '3', 2, 1),
(6, '4', 2, 1),
(7, '1', 3, 12),
(8, '2', 3, 2),
(9, '3', 3, 2),
(10, '4', 3, 2),
(11, '1', 4, 11),
(12, '2', 4, 3),
(13, '3', 4, 3),
(14, '4', 4, 3),
(15, '1', 5, 12),
(16, '2', 5, 4),
(17, '3', 5, 4),
(18, '4', 5, 4),
(19, '1', 6, 3),
(20, '2', 6, 3),
(21, '1', 7, 4),
(22, '2', 7, 4),
(23, '1', 8, 11),
(24, '2', 8, 5),
(25, '3', 8, 5),
(26, '4', 8, 5),
(27, '1', 9, 12),
(28, '2', 9, 6),
(29, '3', 9, 6),
(30, '4', 9, 6),
(31, '1', 10, 11),
(32, '2', 10, 7),
(33, '3', 10, 7),
(34, '4', 10, 7),
(35, '1', 11, 12),
(36, '2', 11, 8),
(37, '3', 11, 8),
(38, '4', 11, 8),
(39, '1', 12, 6),
(40, '2', 12, 6),
(41, '1', 13, 5),
(42, '2', 13, 5),
(43, '1', 14, 10),
(44, '2', 14, 10),
(45, '1', 15, 11),
(46, '2', 15, 9),
(47, '3', 15, 9),
(48, '4', 15, 9),
(49, '1', 16, 12),
(50, '2', 16, 10),
(51, '3', 16, 10),
(52, '4', 16, 10),
(53, '1', 17, 7),
(54, '2', 17, 7),
(55, '1', 18, 8),
(56, '2', 18, 8),
(57, '1', 19, 3),
(58, '2', 19, 3),
(59, '5', 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `attended`
--
ALTER TABLE `attended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branch` (`branch`,`course`);

--
-- Indexes for table `certificate_ctype`
--
ALTER TABLE `certificate_ctype`
  ADD UNIQUE KEY `cname` (`cname`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `college` (`college`);

--
-- Indexes for table `consultancy_projects`
--
ALTER TABLE `consultancy_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department` (`department`,`college`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD UNIQUE KEY `designation` (`designation`);

--
-- Indexes for table `emergency_details`
--
ALTER TABLE `emergency_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extraactivites`
--
ALTER TABLE `extraactivites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fdps_conducted`
--
ALTER TABLE `fdps_conducted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `left_table`
--
ALTER TABLE `left_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patents`
--
ALTER TABLE `patents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preffered_teaching`
--
ALTER TABLE `preffered_teaching`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `research_work`
--
ALTER TABLE `research_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_empid_unique` (`reg_no`),
  ADD UNIQUE KEY `staff_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `staff_certificate`
--
ALTER TABLE `staff_certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_children_info`
--
ALTER TABLE `staff_children_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_collegeaccount`
--
ALTER TABLE `staff_collegeaccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_experience`
--
ALTER TABLE `staff_experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_publications`
--
ALTER TABLE `staff_publications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_no` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`reg_no`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `attended`
--
ALTER TABLE `attended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `consultancy_projects`
--
ALTER TABLE `consultancy_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `emergency_details`
--
ALTER TABLE `emergency_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `extraactivites`
--
ALTER TABLE `extraactivites`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fdps_conducted`
--
ALTER TABLE `fdps_conducted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `left_table`
--
ALTER TABLE `left_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `patents`
--
ALTER TABLE `patents`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `preffered_teaching`
--
ALTER TABLE `preffered_teaching`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `research_work`
--
ALTER TABLE `research_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `staff_certificate`
--
ALTER TABLE `staff_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `staff_children_info`
--
ALTER TABLE `staff_children_info`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `staff_collegeaccount`
--
ALTER TABLE `staff_collegeaccount`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `staff_experience`
--
ALTER TABLE `staff_experience`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `staff_publications`
--
ALTER TABLE `staff_publications`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `year`
--
ALTER TABLE `year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;--
-- Database: `raghuerp_hostel`
--
CREATE DATABASE IF NOT EXISTS `raghuerp_hostel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `raghuerp_hostel`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `bid` int(11) NOT NULL,
  `n_id` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `semstartdate` date NOT NULL,
  `semenddate` date NOT NULL,
  `hosteltype` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bid`, `n_id`, `startdate`, `enddate`, `semstartdate`, `semenddate`, `hosteltype`, `description`, `status`) VALUES
(4, 0, '2017-07-17', '2017-07-25', '2017-07-04', '2017-12-27', 'Boys', 'Bookings are open Please apply for Rooms', 'disable'),
(5, 0, '2017-08-02', '2017-08-04', '2017-08-07', '2017-12-02', 'Girls', 'Bookings opened', 'enable'),
(8, 0, '2017-08-23', '2017-08-16', '2017-08-15', '2017-08-23', 'Girls', 'Bookings Opened', 'enable'),
(10, 0, '2017-08-29', '2017-08-31', '2017-09-01', '2018-01-01', 'Girls', 'Only Four AC and Three Non-AC seats Remaining For Girls', 'enable'),
(12, 11, '2017-08-28', '2017-08-30', '2017-08-01', '2017-09-30', 'Girls', 'New Bookings For Girls 5 AC and 10 Non-AC Seats are available', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `categorytypes`
--

CREATE TABLE `categorytypes` (
  `ctid` int(11) NOT NULL,
  `categorytype` varchar(30) NOT NULL,
  `cstatus` varchar(20) NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorytypes`
--

INSERT INTO `categorytypes` (`ctid`, `categorytype`, `cstatus`) VALUES
(1, 'Hostel', 'enable'),
(2, 'Mess', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(15) NOT NULL,
  `reg_no` varchar(30) NOT NULL,
  `complaint_type` varchar(30) NOT NULL,
  `complaint_priority` varchar(30) NOT NULL,
  `complaint_category_type` varchar(30) NOT NULL,
  `feedback` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `reg_no`, `complaint_type`, `complaint_priority`, `complaint_category_type`, `feedback`) VALUES
(1, 'admin', 'Complaint', 'High', 'Mess', 'hi'),
(2, 'rec0026', 'Complaint', 'Medium', 'Mess', 'dsad'),
(3, 'admin', 'Complaint', 'High', 'Mess', 'Rice is not good'),
(4, 'admin', 'Issue', 'High', 'Mess', 'chef  working not good'),
(5, 'rec0026', 'Complaint', 'High', 'Hostel', 'bathroom is very smell'),
(6, 'admin', 'Issue', 'High', 'Hostel', 'fan not working'),
(7, 'admin', 'Complaint', 'Medium', 'Hostel', 'Please Change My Room'),
(8, 'admin', 'Complaint', 'Medium', 'Mess', 'testing'),
(9, 'admin', 'Complaint', 'High', 'Mess', 'testing'),
(10, 'admin', 'Complaint', 'Medium', 'Mess', 'xzcg'),
(11, 'admin', 'Issue', 'High', 'Mess', 'popup testing'),
(12, 'admin', 'Issue', 'Medium', 'Hostel', 'sadf;lnfoasdl'),
(13, 'admin', 'Issue', 'High', 'Mess', 'adsfdsa'),
(14, 'admin', 'Issue', 'High', 'Hostel', 'fdsgf'),
(15, 'admin', 'Complaint', 'High', 'Hostel', 'repair fan in room no 101 Boys hostel');

-- --------------------------------------------------------

--
-- Table structure for table `feeconfig`
--

CREATE TABLE `feeconfig` (
  `fid` int(11) NOT NULL,
  `roomtype` varchar(30) NOT NULL,
  `totaldues` int(11) NOT NULL,
  `totalamount` int(11) NOT NULL,
  `amt_perdue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feeconfig`
--

INSERT INTO `feeconfig` (`fid`, `roomtype`, `totaldues`, `totalamount`, `amt_perdue`) VALUES
(1, 'AC', 3, 18000, 6000),
(2, 'Non-AC', 3, 15000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `hostelconfig`
--

CREATE TABLE `hostelconfig` (
  `hid` int(11) NOT NULL,
  `hostelname` varchar(50) NOT NULL,
  `hosteltype` varchar(20) NOT NULL,
  `floors` int(11) NOT NULL,
  `hlocation` text NOT NULL,
  `hstatus` varchar(30) NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostelconfig`
--

INSERT INTO `hostelconfig` (`hid`, `hostelname`, `hosteltype`, `floors`, `hlocation`, `hstatus`) VALUES
(1, 'Boys Delux 1', 'Boys', 4, 'college', 'enable'),
(2, 'Girls Delux 1', 'Girls', 3, 'college', 'enable'),
(3, 'Boys Delux 3', 'Boys', 6, 'city', 'enable'),
(4, 'Girls Delux 3', 'Girls', 6, 'city', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `instructions`
--

CREATE TABLE `instructions` (
  `i_id` int(11) NOT NULL,
  `instructiondate` date NOT NULL,
  `i_created_at` datetime NOT NULL,
  `instructiondescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructions`
--

INSERT INTO `instructions` (`i_id`, `instructiondate`, `i_created_at`, `instructiondescription`) VALUES
(1, '2017-08-01', '2017-08-22 09:17:59', 'Welcome to my personal campaign for Heart of Missouri United Way, and thank you for taking a minute to check it out. When you support United Way, you do more than reach out to people in urgent need right now. You also support meaningful, lasting change that impacts everyone in our mid-Missouri community. Please help me make a difference by giving from your heart and making a donation to Heart of Missouri United Way. Together, we can achieve so much more than we ever could alone. '),
(2, '2017-08-23', '2017-08-22 09:55:51', 'In business writing, technical writing, and other forms of composition, instructions are written or spoken directions for carrying out a procedure or performing a task. Also called instructive writing.'),
(3, '2017-08-22', '2017-08-22 09:58:29', 'I used these examples of instructions when starting a block of literacy focusing on instruction writing.'),
(4, '2017-08-24', '2017-08-23 12:23:11', 'asadaf');

-- --------------------------------------------------------

--
-- Table structure for table `maintenancedata`
--

CREATE TABLE `maintenancedata` (
  `mdid` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `billtype` varchar(30) NOT NULL,
  `paymentdate` datetime NOT NULL,
  `cost` float NOT NULL,
  `receipt_no` varchar(20) NOT NULL,
  `ctype` varchar(30) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintenancedata`
--

INSERT INTO `maintenancedata` (`mdid`, `reg_no`, `billtype`, `paymentdate`, `cost`, `receipt_no`, `ctype`, `description`) VALUES
(7, 'admin', 'Electrician Services', '2017-08-24 18:30:00', 4320, '2351', 'Hostel', 'repaired fans in Boys hostel'),
(8, 'admin', 'Elevator Services', '2017-08-30 18:30:00', 50, '234', 'Mess', 'Fixed Elevator Problem in Mess'),
(12, 'admin', 'Electrician Services', '2017-08-01 14:54:06', 23452, '324', 'Mess', 'Repaired Boards in Mess '),
(13, 'admin', 'Carpentry Services', '2017-08-23 16:37:06', 23342, '2341', 'Mess', 'Done Carpentry works in Kitchen'),
(14, 'admin', 'Electrician Services', '2017-08-23 16:38:02', 1232, '1234', 'Mess', 'Repaired Kitchen Items'),
(15, 'rec0154', 'Plumbing Services', '2017-08-28 10:12:12', 15000.5, '1231', 'Hostel', 'Done Plumbing Works in Boys Wash Room ');

-- --------------------------------------------------------

--
-- Table structure for table `maintenanceservices`
--

CREATE TABLE `maintenanceservices` (
  `bid` int(11) NOT NULL,
  `billtype` varchar(40) NOT NULL,
  `bstatus` varchar(15) NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintenanceservices`
--

INSERT INTO `maintenanceservices` (`bid`, `billtype`, `bstatus`) VALUES
(7, 'Carpentry Services', 'enable'),
(8, 'Electrician Services', 'enable'),
(9, 'Elevator Services', 'enable'),
(10, 'Grounds Services', 'enable'),
(11, 'Light bulbs', 'enable'),
(12, 'Pest Control', 'enable'),
(13, 'Plumbing Services', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `n_id` int(11) NOT NULL,
  `notificationdate` date NOT NULL,
  `created_at` datetime NOT NULL,
  `noticedescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`n_id`, `notificationdate`, `created_at`, `noticedescription`) VALUES
(8, '2017-08-28', '2017-08-28 09:39:38', '05-sep-2017 is the Last Date for 4-1 Advance Supply Fee Payment'),
(9, '2017-08-29', '2017-08-28 17:17:35', 'Bookings are open for Boys'),
(11, '2017-08-28', '2017-08-28 17:30:11', 'New Bookings For Girls 5 AC and 10 Non-AC Seats are available , Last Date : 2017-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `registereddetails`
--

CREATE TABLE `registereddetails` (
  `registerid` int(11) NOT NULL,
  `reg_no` varchar(15) NOT NULL,
  `registereddate` datetime NOT NULL,
  `roomtype` varchar(20) NOT NULL,
  `typepriority` varchar(20) NOT NULL,
  `selectedtype` varchar(20) NOT NULL,
  `hostellocation` text NOT NULL,
  `locationpriority` text NOT NULL,
  `selectedlocation` text NOT NULL,
  `distance` varchar(10) NOT NULL,
  `utype` varchar(10) NOT NULL,
  `rstatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registereddetails`
--

INSERT INTO `registereddetails` (`registerid`, `reg_no`, `registereddate`, `roomtype`, `typepriority`, `selectedtype`, `hostellocation`, `locationpriority`, `selectedlocation`, `distance`, `utype`, `rstatus`) VALUES
(1, '125CSE895', '2017-08-22 04:17:06', '1', '1', '1', 'college', 'college', 'college', '150', 'std', 'pending'),
(2, 'rec539', '2017-08-29 06:09:00', '2', '2', '2', 'college', 'college', 'college', '100', 'std', 'pending'),
(3, 'rec507', '2017-08-22 04:17:06', 'all', '1', '1', 'college', 'college', 'college', '150', 'std', 'pending'),
(4, '123987', '2017-08-29 06:09:00', 'all', '6', '6', 'city', 'city', 'city', '100', 'std', 'pending'),
(5, 'rec0092', '2017-08-22 04:17:06', '1', '1', '1', 'all', 'city', 'college', '150', 'stf', 'pending'),
(6, 'rec9998', '2017-08-29 06:09:00', 'all', '1', '6', 'all', 'college', 'city', '100', 'stf', 'pending'),
(7, 'rec0091', '2017-08-22 04:17:06', '6', '6', '6', 'college', 'college', 'college', '150', 'stf', 'pending'),
(8, 'RECCSE548', '2017-08-29 06:09:00', 'all', '2', '1', 'city', 'city', 'city', '100', 'stf', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `registrationdetails`
--

CREATE TABLE `registrationdetails` (
  `registrationid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `reg_no` varchar(30) NOT NULL,
  `priority` varchar(15) NOT NULL,
  `type` varchar(15) NOT NULL,
  `registerdate` datetime NOT NULL,
  `studentname` varchar(30) NOT NULL,
  `dateofbirth` date NOT NULL,
  `genderT` varchar(20) NOT NULL,
  `pwd` varchar(10) NOT NULL DEFAULT '0',
  `distance` int(11) NOT NULL,
  `roomtype` varchar(15) NOT NULL,
  `bloodgroup` varchar(10) NOT NULL,
  `fathername` varchar(35) NOT NULL,
  `mothername` varchar(30) NOT NULL,
  `occupation` varchar(35) NOT NULL,
  `parentmobile` int(20) NOT NULL,
  `parentemail` varchar(50) NOT NULL,
  `permanentaddress` varchar(150) NOT NULL,
  `parentaddress` varchar(150) NOT NULL,
  `guardianname` varchar(35) NOT NULL,
  `guardianrelation` varchar(30) NOT NULL,
  `guardianmobile` int(20) NOT NULL,
  `guardianemail` varchar(50) NOT NULL,
  `guardianaddress` varchar(150) NOT NULL,
  `guardianpermanentaddress` varchar(150) NOT NULL,
  `rstatus` varchar(15) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registrationdetails`
--

INSERT INTO `registrationdetails` (`registrationid`, `pid`, `reg_no`, `priority`, `type`, `registerdate`, `studentname`, `dateofbirth`, `genderT`, `pwd`, `distance`, `roomtype`, `bloodgroup`, `fathername`, `mothername`, `occupation`, `parentmobile`, `parentemail`, `permanentaddress`, `parentaddress`, `guardianname`, `guardianrelation`, `guardianmobile`, `guardianemail`, `guardianaddress`, `guardianpermanentaddress`, `rstatus`) VALUES
(1, 1, 'CSE2CR', '1', '2', '0000-00-00 00:00:00', 'venkat Sai', '1989-08-02', 'M', '1', 150, 'all', '', 'T.A.Achari', 'Anasuya', 'business', 2147483647, 'venkatasait336@gmail.com', 'RTCCOMPLEX', 'RTCCOMPLEX', 'venkat', 'brother', 2147483647, 'venkat@gmail.com', 'RTCCOMPLEX', 'RTCCOMPLEX', 'Allocated'),
(2, 0, 'CSE1CR', '1', 'all', '0000-00-00 00:00:00', 'Pravalika', '1990-12-29', 'F', '0', 100, 'all', '', 'Achari', '', 'business', 2147483647, 'chari@gmail.com', 'vskp', 'vskp', 'ram', 'Brother', 2147483647, 'ram@gmail.com', 'vskp', 'vskp', 'Waiting'),
(3, 1, 'RECECE2ACR', '1', '1', '0000-00-00 00:00:00', 'Poorna Chand', '1991-08-01', 'M', '1', 150, 'AC', '', 'Ramarao', '', 'Employe', 2147483647, 'ramarao@gmail.com', 'pendurthi', 'pendurthi', 'kalyan', 'Brother', 2147483647, 'kalyan@gmail.com', 'vskp', 'vskp', 'Accepted'),
(4, 0, 'recmech002', '1', '1', '2017-08-02 10:38:46', 'suresh', '1988-12-12', 'M', '0', 10, 'AC', '', 'Laxman', 'Supriya', 'business', 2147483647, 'laxman@gmail.com', 'vskp', 'vskp', 'babu', 'Brother', 2147483647, 'babu@gmail.com', 'vskp', 'vskp', 'Pending'),
(5, 0, 'reccse002', '2', '1', '2017-08-02 11:02:11', 'Praveen', '1991-09-02', 'M', '1', 500, 'all', '', 'Appalaswami', '', 'farmer', 2147483647, 'appalaswami@gmail.com', 'vijayawada', 'vijayawada', 'Sravan', 'Uncle', 897456231, 'sravan123@gmail.com', 'vijayanagaram', 'vijayanagaram', 'Allocated'),
(6, 2, 'recmech001', '2', '1', '2017-08-02 11:05:12', 'Jogesh kumar', '1995-10-10', 'M', '1', 500, 'all', '', 'Durga Prasad', '', 'Employe', 896325417, 'durgaprasad@gmail.com', 'vijayawada', 'vijayawada', 'sagar', 'Uncle', 897456231, 'sagar123@gmail.com', 'vijayanagaram', 'vijayanagaram', 'Waiting'),
(7, 0, 'RECECE4ACR', '2', '2', '2017-08-02 11:12:26', 'Mehar', '1990-09-25', 'M', '0', 200, 'Non-AC', '', 'Pawan Kalyan', '', 'Employe', 897456321, 'pawankalyan@gmail.com', 'Bhimavaram', 'Bhimavaram', 'bhaskar Raja', 'uncle', 789456321, 'bhaskar123@gmail.com', 'vskp', 'vskp', 'Allocated'),
(8, 0, 'reccse003', '2', '2', '2017-08-02 11:42:33', 'shrija', '1991-10-13', 'F', '1', 250, 'Non-AC', '', 'Kalyan srinivas', '', 'business', 2147483647, 'kalyansrinivasn@gmail.com', 'Bhimavaram', 'Bhimavaram', 'Harish', 'Brother', 874589632, 'Harish123@gmail.com', 'vskp', 'vskp', 'Pending'),
(9, 0, 'RECECE3ACR', '1', '1', '2017-08-02 11:44:45', 'admin', '1990-05-13', 'M', '0', 250, 'AC', '', 'srinivas', '', '', 2147483647, 'srinivas@gmail.com', 'vijayawada', 'vijayawada', 'Harikumar', 'Brother', 2147483647, 'Harikumar123@gmail.com', 'vskp', 'vskp', 'Pending'),
(10, 0, 'ritmech003', '1', '1', '2017-08-02 11:46:10', 'susmitha', '1990-05-13', 'F', '0', 250, 'AC', '', 'anilkumar', '', 'Farmer', 2147483647, 'anil@gmail.com', 'vijayawada', 'vijayawada', 'akhil', 'Brother', 2147483647, 'akhil123@gmail.com', 'vskp', 'vskp', 'Pending'),
(11, 0, 'ritcse3a', '2', '2', '2017-08-02 11:49:35', 'Rithika', '1989-06-13', 'F', '0', 250, 'Non-AC', '', 'Naidu', '', 'Farmer', 2147483647, 'naidu@gmail.com', 'vijayawada', 'vijayawada', 'rajashekar', 'Brother', 2147483647, 'rajashekar123@gmail.com', 'vskp', 'vskp', 'Pending'),
(12, 0, '12', '2', '2', '2017-08-02 11:51:01', 'admin', '1990-01-13', 'M', '0', 250, 'Non-AC', '', 'Murali', '', 'Farmer', 2147483647, 'murali1523@gmail.com', 'vijayawada', 'vijayawada', 'krishna', 'uncle', 2147483647, 'krishna143@gmail.com', 'vskp', 'vskp', 'Pending'),
(14, 0, 'rceccse012', '1', 'all', '2017-08-23 10:21:44', 'Rakul', '1994-04-15', 'F', '0', 146, 'all', '', 'Surya Prakash', '', 'Bank Manager', 2147483647, 'surya23@gmail.com', 'delhi', 'delhi', 'Shankar Prasad', 'Uncle', 2147483647, 'shankarp89@yahoo.com', 'vizag', 'vizag', 'Pending'),
(15, 0, 'reccse012', '2', '2', '2017-08-23 11:15:02', 'harsha', '2017-08-09', 'M', '1', 126, 'Non-AC', '', 'Ram Prasad', '', 'Driver', 2147483647, 'ram2@gmail.com', 'Chodavaram', 'Chodavaram', 'ramesh', 'uncle', 2147483647, 'ramesh222@yahoo.com', 'Vizayanagaram', 'Vizayanagaram', 'Pending'),
(16, 0, '2018ca1', '1', 'all', '2017-08-28 12:13:52', 'abc', '1995-08-08', 'F', '0', 180, 'all', '', 'xyz', '', 'Bank Employe', 2147483647, 'xyz32@abc', 'vizag', 'vizag', 'pqr', 'friend', 122, 'sad', 'vizag', 'vizag', 'Pending'),
(17, 0, '12345', '1', '1', '2017-08-28 14:58:38', 'dasf', '2017-08-14', 'F', '1', 123, 'AC', 'A -', 'fsda', '', 'dsa', 0, 'sdaf', 'sadf', 'sdfa', 'sdf', 'sdfa', 0, 'sdfa', 'sfda', 'sadf', 'Pending'),
(18, 0, 'ritcse3af', '2', '2', '2017-08-28 18:07:01', 'RIT CSE 3A', '1999-08-05', 'M', '0', 123, 'Non-AC', 'A -', 'dfg', 'gfd', 'dg', 0, 'ds', 'NAD Kotha Road', 'NAD Kotha Road', 'dfsg', 'g', 0, 'gs', 'f', 'f', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `roomdetails`
--

CREATE TABLE `roomdetails` (
  `rid` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `roomno` int(11) NOT NULL,
  `bedno` int(11) NOT NULL,
  `utype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomdetails`
--

INSERT INTO `roomdetails` (`rid`, `reg_no`, `roomno`, `bedno`, `utype`) VALUES
(2, 'RECECE2ACR', 1, 3, 'std'),
(3, 'RECECE3ACR', 6, 1, 'std'),
(4, 'rec539', 7, 2, 'std'),
(5, 'RECECE4ACR', 5, 2, 'std'),
(6, 'rec0091', 4, 3, 'stf'),
(7, 'reccse002', 1, 1, 'std'),
(8, 'CSE2CR', 1, 4, 'std'),
(9, '2018ca1', 13, 1, 'std');

-- --------------------------------------------------------

--
-- Table structure for table `roomsconfig`
--

CREATE TABLE `roomsconfig` (
  `rcid` int(11) NOT NULL,
  `roomno` varchar(20) NOT NULL,
  `avlbeds` int(11) NOT NULL,
  `totbeds` int(11) NOT NULL,
  `rcstatus` varchar(20) NOT NULL DEFAULT 'available',
  `roomtype` varchar(20) NOT NULL,
  `roomrent` float NOT NULL,
  `hostelid` int(11) NOT NULL,
  `floorno` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomsconfig`
--

INSERT INTO `roomsconfig` (`rcid`, `roomno`, `avlbeds`, `totbeds`, `rcstatus`, `roomtype`, `roomrent`, `hostelid`, `floorno`) VALUES
(1, '101', 3, 6, 'available', '1', 35000, 1, 'g'),
(2, '102', 4, 4, 'available', '2', 28000, 2, 'g'),
(3, '103', 4, 5, 'available', '1', 32000, 2, '1'),
(4, '104', 5, 5, 'available', '2', 30000, 3, '1'),
(5, '105', 5, 5, 'available', '1', 35000, 3, '2'),
(6, '106', 3, 4, 'available', '1', 32000, 2, '2'),
(7, '106', 4, 5, 'available', '2', 30000, 3, '2'),
(8, '112', 6, 6, 'available', '2', 28000, 2, '3'),
(9, '109', 5, 5, 'available', '6', 31900, 1, '3'),
(10, '134', 5, 5, 'available', '2', 30000, 2, '3'),
(11, '1034', 6, 6, 'available', '6', 35000, 2, '3'),
(12, '13212', 5, 5, 'available', '2', 25000, 3, '2'),
(13, '1034', 2, 3, 'filled', '1', 19999, 1, '4');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `typeid` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'enable',
  `hostels` varchar(50) NOT NULL,
  `enabletypes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`typeid`, `type`, `status`, `hostels`, `enabletypes`) VALUES
(1, 'AC', 'enable', '0', '1,2,3,4'),
(2, 'Non-AC', 'enable', '0', '1,2,3,4'),
(6, 'AC Delux', 'enable', '0', '1,2,4');

-- --------------------------------------------------------

--
-- Table structure for table `upcomingevents`
--

CREATE TABLE `upcomingevents` (
  `e_id` int(11) NOT NULL,
  `eventtype` varchar(500) NOT NULL,
  `eventdate` date NOT NULL,
  `eventtime` varchar(16) NOT NULL,
  `event_created_at` datetime NOT NULL,
  `eventdescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upcomingevents`
--

INSERT INTO `upcomingevents` (`e_id`, `eventtype`, `eventdate`, `eventtime`, `event_created_at`, `eventdescription`) VALUES
(1, 'freshers party', '2017-07-03', '10:30 AM', '2017-08-22 11:02:16', 'REC CSE 1st Year Freshers Party in Indoor Stadium'),
(7, 'NAAC ', '2017-09-21', '11:00 AM', '2017-08-28 09:41:58', 'Naac for RIT ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `categorytypes`
--
ALTER TABLE `categorytypes`
  ADD PRIMARY KEY (`ctid`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feeconfig`
--
ALTER TABLE `feeconfig`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `hostelconfig`
--
ALTER TABLE `hostelconfig`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `instructions`
--
ALTER TABLE `instructions`
  ADD PRIMARY KEY (`i_id`);

--
-- Indexes for table `maintenancedata`
--
ALTER TABLE `maintenancedata`
  ADD PRIMARY KEY (`mdid`);

--
-- Indexes for table `maintenanceservices`
--
ALTER TABLE `maintenanceservices`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `registereddetails`
--
ALTER TABLE `registereddetails`
  ADD PRIMARY KEY (`registerid`);

--
-- Indexes for table `registrationdetails`
--
ALTER TABLE `registrationdetails`
  ADD PRIMARY KEY (`registrationid`),
  ADD UNIQUE KEY `reg_no` (`reg_no`);

--
-- Indexes for table `roomdetails`
--
ALTER TABLE `roomdetails`
  ADD PRIMARY KEY (`rid`),
  ADD UNIQUE KEY `reg_no` (`reg_no`);

--
-- Indexes for table `roomsconfig`
--
ALTER TABLE `roomsconfig`
  ADD PRIMARY KEY (`rcid`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`typeid`);

--
-- Indexes for table `upcomingevents`
--
ALTER TABLE `upcomingevents`
  ADD PRIMARY KEY (`e_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `categorytypes`
--
ALTER TABLE `categorytypes`
  MODIFY `ctid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `feeconfig`
--
ALTER TABLE `feeconfig`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hostelconfig`
--
ALTER TABLE `hostelconfig`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `instructions`
--
ALTER TABLE `instructions`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `maintenancedata`
--
ALTER TABLE `maintenancedata`
  MODIFY `mdid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `maintenanceservices`
--
ALTER TABLE `maintenanceservices`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `registereddetails`
--
ALTER TABLE `registereddetails`
  MODIFY `registerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `registrationdetails`
--
ALTER TABLE `registrationdetails`
  MODIFY `registrationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `roomdetails`
--
ALTER TABLE `roomdetails`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `roomsconfig`
--
ALTER TABLE `roomsconfig`
  MODIFY `rcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `typeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `upcomingevents`
--
ALTER TABLE `upcomingevents`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;--
-- Database: `raghuerp_leavesys`
--
CREATE DATABASE IF NOT EXISTS `raghuerp_leavesys` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `raghuerp_leavesys`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `college_leaves_summary` (IN `fromdate` DATETIME, IN `todate` DATETIME, IN `college` VARCHAR(10))  NO SQL
BEGIN

CREATE TEMPORARY TABLE IF NOT EXISTS temp_colglvs_table(   
  `college` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `y` int(4)
) ENGINE=memory;

insert into temp_colglvs_table (SELECT c.college, d.department, 0 as y FROM raghuerp_db.departments d inner join raghuerp_db.colleges c on c.id = d.college);

SET @query = CONCAT("update temp_colglvs_table t1,(select c.college, d.department, count(*) as y from raghuerp.leave_issues lv inner join raghuerp_db.staff s on s.reg_no = lv.reg_no inner join raghuerp_db.colleges c on s.college = c.id inner join raghuerp_db.departments d on s.department = d.id where lv.from_date <= '", fromdate, "' and lv.to_date >= '", todate, "' and lv.status='Accepted' group by d.department) t2 set t1.y = t2.y where t1.college = t2.college and t1.department = t2.department");

 PREPARE stat FROM @query;
 EXECUTE stat;

if college = "" then
 select college, department as name, y from temp_colglvs_table order by college asc;
else
 SET @q2 = CONCAT("select college, department as name, y from temp_colglvs_table where college='", college,  "'");
 PREPARE stat FROM @q2;
 EXECUTE stat;
end if;

drop table temp_colglvs_table;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findSundays` ()  NO SQL
BEGIN

DECLARE flag smallint;
  DECLARE c    smallint;
  DECLARE firstsunday date;
  DECLARE thisdate date;
  DECLARE Sundays varchar(500);
  DECLARE start_date date;
  DECLARE end_date date;
  
  set start_date = concat(year(now()),'-01-01');
  set end_date = concat(year(now()),'-12-31');

#CREATE TEMPORARY TABLE IF NOT EXISTS sundays_table(   
#  `dt` date
#) ENGINE=memory;
  
  
  SET flag := 1;
#  SET c    := 0;
  SET thisdate := start_date;
  SET Sundays := "";

  IF dayofweek(thisdate) <> 1 THEN

  WHILE flag > 0 DO
    SET thisdate := date_add(thisdate, interval 1 day);
    #select thisdate;
    IF dayofweek(thisdate) = 1 THEN
      SET flag := 0;
      SET firstsunday := thisdate;
    END IF;
#    SET c := c+1;
#    if c = 5 then set flag := 0; end if;
  END WHILE;

  ELSE
    SET firstsunday := thisdate;
  END IF;

#  select firstsunday;
  SET Sundays := firstsunday;
#  insert into sundays_table(dt) values (firstsunday);

  SET flag := 1;
  WHILE flag > 0 DO
    IF date_add(firstsunday, INTERVAL 7 day) <= end_date THEN
      SET Sundays := concat(Sundays, ", ", date_add(firstsunday, INTERVAL 7 day));
	  insert into holidays(holdate,holname,holtype) values (firstsunday, 'Sunday','Public Holiday');
      SET firstsunday := date_add(firstsunday, INTERVAL 7 day);
    ELSE
      SET flag := 0;
    END IF;
  END WHILE;
  
  INSERT INTO `raghuerp`.`lmscron`(`cid`, `cname`, `cyear`) VALUES (NULL,'holidays',year(now()));

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE `Role` (
  `role_id` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `role` varchar(15) NOT NULL,
  `type` varchar(15) NOT NULL,
  `upto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`role_id`, `reg_no`, `role`, `type`, `upto`) VALUES
(1, 'management', 'Management', 'Permanent', ''),
(9, 'admin', 'admin', 'Permanent', ''),
(14, 'rec0067', 'HOD', 'Permanent', ''),
(15, 'rec0080', 'HOD', 'Permanent', ''),
(16, 'rec0028', 'HOD', 'Permanent', ''),
(17, 'rec0143', 'HOD', 'Permanent', ''),
(18, 'rec0005', 'HOD', 'Permanent', ''),
(19, 'rec0175', 'HOD', 'Permanent', ''),
(20, 'rec0050', 'Principal', 'Permanent', ''),
(21, 'rec0152', 'Dean', 'Permanent', ''),
(24, 'rit0001', 'HOD', 'Permanent', ''),
(25, 'rit0004', 'HOD', 'Permanent', ''),
(26, 'rit0011', 'HOD', 'Permanent', ''),
(27, 'rit0082', 'HOD', 'Permanent', ''),
(28, 'rit0098', 'HOD', 'Permanent', ''),
(29, 'rit0103', 'HOD', 'Permanent', '');

-- --------------------------------------------------------

--
-- Table structure for table `Type_of_leave`
--

CREATE TABLE `Type_of_leave` (
  `reg_no` varchar(20) NOT NULL,
  `emp_name` varchar(35) NOT NULL,
  `sick_leave` float NOT NULL,
  `prevelege_leave` float NOT NULL,
  `compensatory_leave` float NOT NULL,
  `study_leave` float NOT NULL,
  `casual_leave` float NOT NULL,
  `Total` float NOT NULL,
  `Remaining` float NOT NULL,
  `LOP` float NOT NULL,
  `maternaty_leave` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Type_of_leave`
--

INSERT INTO `Type_of_leave` (`reg_no`, `emp_name`, `sick_leave`, `prevelege_leave`, `compensatory_leave`, `study_leave`, `casual_leave`, `Total`, `Remaining`, `LOP`, `maternaty_leave`) VALUES
('rec0001', 'Dr G CH S N RAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0002', 'A VIJAY KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0003', '', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0004', 'B.UMAMAHESWAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0005', 'U SARAT', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0006', '', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0007', '', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0008', 'SK.DARYABI', 0, 0, 0, 0, 5, 6, 5, 0, 0),
('rec0009', ' K ARUN KUMAR ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0010', 'N.ANIL CHAKRAVARTHY', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0011', '', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0012', 'Dr. P MALLIKARJUNA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0013', 'B.G.MADHURI', 0, 0, 0, 0, 5.5, 6, 5.5, 0, 0),
('rec0014', 'Dr R.V.BHASKAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0015', 'B.MADHU BABU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0016', 'M MEENA KUMARI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0018', 'G.SRIDEVI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0019', 'TVS SRIRAM', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0020', 'G V SIVA PRASAD', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0021', 'A.J.SIRISHA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0022', 'A.DURGA PRAVEEN KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0023', 'R.NAVEEN KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0024', 'S.KRANTHI KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0025', 'K.BHANU KUMARI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0026', 'K.SATHIRAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0027', 'T P R VITAL', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0028', 'K.PHANINDER VINAY', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0029', 'M.V.SURESH KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0030', 'S.APPALA RAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0031', 'M.ANIL KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0032', 'I. KRISHNA CHAITANYA', 0, 0, 0, 0, 5.5, 6, 5.5, 0, 0),
('rec0033', 'S.PRASADA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0034', 'K. TRINADHA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0035', 'J.RENUKESWARA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0036', 'D V S RAVI VARMA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0037', 'Dr A.S.PRAKASH RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0038', 'T.ANURADHA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0039', 'V.TATA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0040', 'S.RAMANA BABU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0041', 'LAL BABUPRASAD', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0042', 'K.MADHAVI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0043', 'V S SUBRAHMANYAM', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0044', 'V.SOMASEKHARAM', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0045', 'N.MARKANDEYA GUPTA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0046', 'P.SRINIVAS', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0047', 'S.SRINADH RAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0048', 'B.RAMESH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0049', 'P.RAJESH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0050', 'R KAMESWARA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0051', 'S A ANICIA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0052', 'V PARTHA SARADHI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0053', 'Y.RAGHAVENDRA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0054', 'P.ANIL KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0055', 'VVN SURYANARAYANA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0056', 'Y.V.SRI CHARAN', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0057', 'YLV SANTOSH KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0058', 'P SEKHARA BABU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0059', 'N.ADILAKSHMI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0060', 'BH.V.S.NARAYANA', 0, 0, 0, 0, 5, 6, 5, 0, 0),
('rec0061', 'P.SURENDRA VARMA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0062', 'N V S S PRABHAKAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0063', 'A.SUKANYA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0064', 'B SIVA RAMA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0065', 'PKVS SUBRAMANYESWARA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0066', 'P.E.SATYANARAYANA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0067', 'R. SRINIVASA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0068', 'L.SATISH KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0069', 'M.VENKATA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0070', 'K.SWATHI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0071', 'B.L.GANESWARA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0072', 'SHAHAZADI BEGUM', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0073', 'M.RUPALI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0074', 'Dr K.SUBRAMANYAM', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0075', 'P NARESH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0076', 'N.SAHADEVA RAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0077', 'NIKHIL BHAT', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0078', 'N.SREELEKHA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0079', 'CH LAVANYA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0080', 'safd', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0081', 'Dr.T.VENKATA SWAMY', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0082', 'Y.VENKATA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0083', 'S.SANTOSH KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0085', 'M. SATYANARAYANA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0086', 'P.CHNADRA SEKHAR PILLI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0087', 'Y. SATYANARAYANA RAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0088', 'Dr T.RAMU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0089', 'P.VENUGOPAL', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0090', 'Dr R SRINIVASU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0091', 'A.NAGESWARA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0092', 'S S PRAKASH RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0093', 'K.SHANMUKHA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0094', 'G.SANYASI RAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0095', 'Dr PANCHANAND JHA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0096', 'B.SREEVIDYA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0097', '', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0098', 'P. SIDDHARTHA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0099', 'S.SUDHIRVARMA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0100', 'P P N G PHANI KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0101', ' Dr. V.PRAMILA MURTHY ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0102', 'P.RAJA NAVEEN', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0103', 'N S C  CHAITANYA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0104', 'K.V. VARA LAKSHMI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0105', 'K PRANEETH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0106', 'DVR VASU PAVANI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0107', 'M.SURYA RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0108', 'P.SANKAR RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0109', 'SVV RAMA DEVI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0110', 'S. TEJESWAR REDDY', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0111', 'B VISALAKSHI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0112', 'T.SANTHI PRIYA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0113', 'S KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0114', 'MD. RAMEEZ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0115', 'Dr. PHANI RAMA KRISHNA CHUNDURY', 0, 0, 0, 0, 5.5, 6, 5.5, 0, 0),
('rec0116', 'RADHARANI NAYAK', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0117', 'VANDANA MAHANTHI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0118', 'S SARALA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0119', 'D SIVA PRASAD VARMA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0120', 'L SREEDHAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0121', 'K SRINIVAS RAVI KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0122', 'K SULOCHANA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0123', 'P S KRISHNAM RAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0124', 'M SRIDHAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0125', 'MANISH YADAV', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0126', 'V PRAMADHA RANI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0127', 'M SHOBHA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0128', 'Y E VASANTH KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0129', 'K CHINABABU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0130', 'B SUDEEPTHI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0131', ' GUPTESWAR SAHU ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0132', 'D BHASKARA RAO', 0, 0, 0, 0, 5.5, 6, 5.5, 0, 0),
('rec0133', 'NETHALA RAJU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0134', 'P NAGABHUSHANAM', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0135', 'A SWETHA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0136', 'BLESSY NAVARA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0137', 'K MAHESWAR RAO', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0138', 'T SURESH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0139', 'P REVATHI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0141', 'Y SWAPNA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0142', 'P RAMESH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0143', 'Dr S SATYANARAYANA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0144', 'P RAVI KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0145', 'AMIT KUMAR MEHAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0146', 'D SANDHYA RANI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0147', 'R SIRI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0148', 'R VIJAY SAGAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0149', 'RAJ KISHOR DAS', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0150', ' K JYOTHSNA ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0151', 'N B L V PRASAD', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0152', 'Dr T GANAPATHY', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0153', 'Dr.S RAVI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0154', 'R GOVINDA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0155', ' Dr VIVEK PANDEY ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0157', 'S P APARANJI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0158', 'T HIMA BINDU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0159', 'T KALYANI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0160', 'R VINAY KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0161', 'K H K RAGHU VAMSI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0162', 'Y S G GOVIND BABU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0163', 'MD ARIF', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0164', 'MOHD MERAJ KHAN', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0165', 'T S KAVITHA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0166', 'A VAMSIDHAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0167', 'M SRIKANTH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0168', 'Dr. M MURALI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0169', 'Y SUDHAVANI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0170', ' G RAJA KUMARI ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0171', 'P BEERSHEBA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0172', 'T. SATYANARAYANA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0173', ' Dr. B SRINIVAS ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0174', 'P.V.V. RAJAGOPAL', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0175', ' Dr. R VAIKUNTA RAO ', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0176', 'JASMINE VINCENT', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0177', 'SAI SRIKANTH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0178', 'J RAMESH NAIDU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0179', 'D UMA SANKAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0180', 'D MOUNIKA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0182', 'MUNAGAPATI MURALI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0183', 'R. SUPRIYA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0184', 'A. Rutwik', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0185', 'G. SANTOSH KUMAR VARMA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0186', 'G. SAROJA', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0187', 'M. HARISH', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0188', 'P. TEJASWI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0189', 'V. MOHANA GANDHI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0190', 'D. KEERTHI', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0191', 'M. ANIL KUMAR', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('rec0192', 'M MADHU', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('REC410', 'poorna', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('RECCSE001', 'cseHOD', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('RECCSE002', 'csedean', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('RECEEE01', 'Sivarama rao', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('RECMECH001', 'Nikhil', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('RECPRI001', 'principal', 0, 0, 0, 0, 6, 6, 6, 0, 0),
('xyz123', 'apparo', 0, 0, 0, 0, 6, 6, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dp` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL COMMENT 'admin, management',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `reg_no`, `name`, `email`, `mobile`, `dp`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'admin@raghueducational.org', '8500373704', '', 'admin', 1, '2017-06-12 20:30:00', '2017-06-29 10:37:30'),
(2, 'management', 'management', '', '', '', 'Management', 1, '2017-06-14 01:30:00', '2017-06-29 10:37:36'),
(3, 'admin2', 'leaveadmin', 'leaveadmin@raghuerp.com', '235', '', 'admin', 1, '2017-05-08 02:58:28', '2017-06-11 03:47:11');

--
-- Triggers `admins`
--
DELIMITER $$
CREATE TRIGGER `update_admins_timestamp` BEFORE UPDATE ON `admins` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `allroles`
--

CREATE TABLE `allroles` (
  `rid` int(11) NOT NULL,
  `rname` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allroles`
--

INSERT INTO `allroles` (`rid`, `rname`) VALUES
(1, 'admin'),
(2, 'Management'),
(3, 'HOD'),
(4, 'Principal'),
(5, 'Dean');

-- --------------------------------------------------------

--
-- Table structure for table `coff`
--

CREATE TABLE `coff` (
  `cid` int(11) NOT NULL,
  `reg_no` varchar(15) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `reason` varchar(50) NOT NULL,
  `reject_reason` varchar(50) NOT NULL,
  `rejectedby` varchar(25) NOT NULL,
  `status` varchar(15) NOT NULL,
  `days` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coff`
--

INSERT INTO `coff` (`cid`, `reg_no`, `from_date`, `to_date`, `reason`, `reject_reason`, `rejectedby`, `status`, `days`) VALUES
(14, 'rec0008', '2017-07-19 09:00:00', '2017-07-19 12:00:00', 'testing coff', '', '', 'Accepted', 0.5),
(15, 'rec0008', '2017-07-19 12:00:00', '2017-07-19 17:00:00', 'testing', '', 'HOD', 'Rejected', 0.5),
(16, 'rec0008', '2017-07-20 09:00:00', '2017-07-20 12:00:00', 'testing', '', '', 'Accepted', 0.5),
(17, 'rec0008', '2017-07-20 12:00:00', '2017-07-20 17:00:00', 'testing', '', '', 'Accepted', 0.5);

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `college` varchar(5) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`college`, `full_name`, `status`) VALUES
('REC', 'Raghu Engineering College', 1),
('RIT', 'Raghu Institute of Technology', 1);

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `sno` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`sno`, `designation`, `email`) VALUES
(1, 'Director', 'manojvarma132@gmail.com'),
(2, 'Chairman', 'allurinani.007@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department` varchar(10) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `college` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department`, `full_name`, `college`, `status`) VALUES
('CSE', 'Computer Science and Engineering', 'REC', 1),
('ECE', 'Electronics and Communication Engineering', 'RIT', 1),
('EEE', 'Electrical and Electronics Engineering', 'RIT', 1),
('MECH', 'Mechanical Engineering', 'REC', 1);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `designation` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`designation`, `status`) VALUES
('Assistant Professor', 1),
('Associate Professor', 1),
('Office Assistant', 1),
('Principal', 1),
('Professor', 1),
('System Administrator', 1),
('Technician', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `eid` int(11) NOT NULL,
  `emails` varchar(500) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `sno` int(11) NOT NULL,
  `holdate` date NOT NULL,
  `holname` varchar(30) NOT NULL,
  `holtype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`sno`, `holdate`, `holname`, `holtype`) VALUES
(1, '2017-08-15', 'Independence Day', 'Public Holiday'),
(2, '2017-01-01', 'Sunday', 'Public Holiday'),
(3, '2017-01-08', 'Sunday', 'Public Holiday'),
(4, '2017-01-15', 'Sunday', 'Public Holiday'),
(5, '2017-01-22', 'Sunday', 'Public Holiday'),
(6, '2017-01-29', 'Sunday', 'Public Holiday'),
(7, '2017-02-05', 'Sunday', 'Public Holiday'),
(8, '2017-02-12', 'Sunday', 'Public Holiday'),
(9, '2017-02-19', 'Sunday', 'Public Holiday'),
(10, '2017-02-26', 'Sunday', 'Public Holiday'),
(11, '2017-03-05', 'Sunday', 'Public Holiday'),
(12, '2017-03-12', 'Sunday', 'Public Holiday'),
(13, '2017-03-19', 'Sunday', 'Public Holiday'),
(14, '2017-03-26', 'Sunday', 'Public Holiday'),
(15, '2017-04-02', 'Sunday', 'Public Holiday'),
(16, '2017-04-09', 'Sunday', 'Public Holiday'),
(17, '2017-04-16', 'Sunday', 'Public Holiday'),
(18, '2017-04-23', 'Sunday', 'Public Holiday'),
(19, '2017-04-30', 'Sunday', 'Public Holiday'),
(20, '2017-05-07', 'Sunday', 'Public Holiday'),
(21, '2017-05-14', 'Sunday', 'Public Holiday'),
(22, '2017-05-21', 'Sunday', 'Public Holiday'),
(23, '2017-05-28', 'Sunday', 'Public Holiday'),
(24, '2017-06-04', 'Sunday', 'Public Holiday'),
(25, '2017-06-11', 'Sunday', 'Public Holiday'),
(26, '2017-06-18', 'Sunday', 'Public Holiday'),
(27, '2017-06-25', 'Sunday', 'Public Holiday'),
(28, '2017-07-02', 'Sunday', 'Public Holiday'),
(29, '2017-07-09', 'Sunday', 'Public Holiday'),
(30, '2017-07-16', 'Sunday', 'Public Holiday'),
(31, '2017-07-23', 'Sunday', 'Public Holiday'),
(32, '2017-07-30', 'Sunday', 'Public Holiday'),
(33, '2017-08-06', 'Sunday', 'Public Holiday'),
(34, '2017-08-13', 'Sunday', 'Public Holiday'),
(35, '2017-08-20', 'Sunday', 'Public Holiday'),
(36, '2017-08-27', 'Sunday', 'Public Holiday'),
(37, '2017-09-03', 'Sunday', 'Public Holiday'),
(38, '2017-09-10', 'Sunday', 'Public Holiday'),
(39, '2017-09-17', 'Sunday', 'Public Holiday'),
(40, '2017-09-24', 'Sunday', 'Public Holiday'),
(41, '2017-10-01', 'Sunday', 'Public Holiday'),
(42, '2017-10-08', 'Sunday', 'Public Holiday'),
(43, '2017-10-15', 'Sunday', 'Public Holiday'),
(44, '2017-10-22', 'Sunday', 'Public Holiday'),
(45, '2017-10-29', 'Sunday', 'Public Holiday'),
(46, '2017-11-05', 'Sunday', 'Public Holiday'),
(47, '2017-11-12', 'Sunday', 'Public Holiday'),
(48, '2017-11-19', 'Sunday', 'Public Holiday'),
(49, '2017-11-26', 'Sunday', 'Public Holiday'),
(50, '2017-12-03', 'Sunday', 'Public Holiday'),
(51, '2017-12-10', 'Sunday', 'Public Holiday'),
(52, '2017-12-17', 'Sunday', 'Public Holiday'),
(53, '2017-12-24', 'Sunday', 'Public Holiday'),
(54, '2017-12-31', 'Sunday', 'Public Holiday'),
(59, '2017-08-28', 'ganesh chaturthi', 'Public Holiday'),
(60, '2017-09-30', 'Dasara', 'Public Holiday'),
(61, '2016-12-04', 'Sunday', 'Public Holiday'),
(62, '2016-12-11', 'Sunday', 'Public Holiday'),
(63, '2016-12-18', 'Sunday', 'Public Holiday');

-- --------------------------------------------------------

--
-- Table structure for table `leave_issues`
--

CREATE TABLE `leave_issues` (
  `leave_id` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `type_of_leave` varchar(25) NOT NULL,
  `previous` float NOT NULL,
  `duration` float NOT NULL,
  `alternateId` varchar(20) NOT NULL,
  `alternateStatus` varchar(15) NOT NULL,
  `delegatedreason` varchar(64) NOT NULL,
  `lop` float NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `reason` varchar(30) NOT NULL,
  `reject_reason` varchar(50) NOT NULL,
  `alter_reason` varchar(50) NOT NULL,
  `rejectedby` varchar(30) NOT NULL,
  `status` varchar(25) NOT NULL,
  `remarks` varchar(30) NOT NULL,
  `days` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_issues`
--

INSERT INTO `leave_issues` (`leave_id`, `reg_no`, `type_of_leave`, `previous`, `duration`, `alternateId`, `alternateStatus`, `delegatedreason`, `lop`, `from_date`, `to_date`, `reason`, `reject_reason`, `alter_reason`, `rejectedby`, `status`, `remarks`, `days`) VALUES
(86, 'rec0008', 'Casual Leave', 1, 0, 'rec0117', 'Pending', '', 0, '2017-07-25 12:00:00', '2017-07-26 12:00:00', 'testing', '', '', '', 'Accepted', '', 1),
(87, 'rec0008', 'Compensatory Off', 0, 0, 'rec0187', 'Pending', '', 0.5, '2017-07-26 12:00:00', '2017-07-26 17:00:00', 'testing', 'testing', '', 'HOD', 'Rejected', '', 0.5),
(88, 'rec0132', 'Casual Leave', 0.5, 0, 'rec0026', 'Pending', '', 0, '2017-07-26 09:00:00', '2017-07-26 12:00:00', 'testing mail', '', '', '', 'Accepted', '', 0.5),
(89, 'rec0115', 'Casual Leave', 0.5, 0, 'rec0039', 'Pending', '', 0, '2017-07-27 09:00:00', '2017-07-27 12:00:00', 'testing', '', '', '', 'Accepted', '', 0.5),
(90, 'rec0013', 'Casual Leave', 0.5, 0, 'rec0010', 'Pending', '', 0, '2017-07-27 09:00:00', '2017-07-27 12:00:00', 'testing', '', '', '', 'Accepted', '', 0.5),
(91, 'rec0032', 'Casual Leave', 0.5, 0, 'rec0134', 'Pending', '', 0, '2017-07-27 09:00:00', '2017-07-27 12:00:00', 'testing', '', '', '', 'Accepted', '', 0.5),
(92, 'rec0060', 'Casual Leave', 1, 0, 'rec0061', 'Pending', '', 0, '2017-08-30 09:00:00', '2017-08-30 17:00:00', 'testing for modification of te', '', '', '', 'Pending', '', 1);

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
(1, 'Sick Leave', 'sick_leave', 0, 'disable', 1),
(2, 'Prevelege Leave', 'prevelege_leave', 1, 'disable', 0),
(3, 'Compensatory Off', 'compensatory_leave', 0, 'enable', 1),
(4, 'Study Leave', 'study_leave', 0, 'disable', 0),
(5, 'Casual Leave', 'casual_leave', 12, 'enable', 0),
(6, 'LOP', 'LOP', 0, 'enable', 0),
(8, 'Maternaty Leave', 'maternaty_leave', 6, 'enable', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmscron`
--

CREATE TABLE `lmscron` (
  `cid` int(11) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `cyear` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmscron`
--

INSERT INTO `lmscron` (`cid`, `cname`, `cyear`) VALUES
(1, 'holidays', '2017'),
(18, 'carryfwd', '2017');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dispname` varchar(15) DEFAULT NULL,
  `college` varchar(15) NOT NULL,
  `department` varchar(30) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dp` varchar(30) DEFAULT NULL,
  `present_address` text,
  `permanent_address` text,
  `employment_type` varchar(20) NOT NULL,
  `pan` varchar(20) DEFAULT NULL,
  `aadhar` varchar(20) DEFAULT NULL,
  `passport` varchar(25) DEFAULT NULL,
  `dateob` date NOT NULL,
  `placeob` varchar(255) DEFAULT NULL,
  `stateob` varchar(50) DEFAULT NULL,
  `countryob` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `roleid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `reg_no`, `title`, `firstname`, `lastname`, `dispname`, `college`, `department`, `designation`, `qualification`, `email`, `mobile`, `dp`, `present_address`, `permanent_address`, `employment_type`, `pan`, `aadhar`, `passport`, `dateob`, `placeob`, `stateob`, `countryob`, `gender`, `nationality`, `religion`, `caste`, `role`, `roleid`, `status`, `created_at`, `updated_at`) VALUES
(1, 'RECCSE001', '', 'Cse Hod', 'Faculty', 'CseHod', 'REC', 'CSE', 'Professor', 'Ph.D.', 'krishna.krishnachandra.chandra@gmail.com', '9859852589', '', 'Raghu Engineering College', 'madhurawada', '', '', '', '', '1975-06-05', '', '', '', '', '', '', '', 'HOD', 3, 1, '2017-06-13 20:30:00', '2017-07-03 04:21:21'),
(2, 'REC410', 's', NULL, NULL, 'poorna', 'REC', 'CSE', 'Proffessor', 'B.Tech', 'rajarohit.in@gmail.com', 's', NULL, NULL, NULL, 's', NULL, NULL, NULL, '2017-06-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Staff', 5, 1, '2017-06-15 01:42:00', '2017-07-03 07:02:49'),
(3, 'RECPRI001', '', NULL, NULL, 'principal', 'REC', '', 'Proffessor', 'Ph.D.', 'poornachand046@gmail.com', '', NULL, NULL, NULL, '', NULL, NULL, NULL, '1987-03-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Principal', 2, 1, '2017-06-14 05:30:00', '2017-07-03 07:02:45'),
(7, 'RECCSE002', '', NULL, NULL, 'csedean', 'REC', 'CSE', 'Professor', 'Ph.D.', 'dd', '26578', NULL, NULL, NULL, '', NULL, NULL, NULL, '1965-06-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dean', 0, 0, '2017-06-11 23:30:00', '2017-07-03 04:21:17'),
(11, 'management', 'management', 'management', 'management', 'management', 'RIT', 'ECE', 'management', '', 'asdds', 'as', NULL, NULL, NULL, 'permanent', 'dsa', 'sda', 'asa', '0000-00-00', 'sad', NULL, NULL, NULL, NULL, NULL, NULL, 'Management', 0, 0, '2017-06-28 23:30:00', '2017-07-07 09:53:05'),
(12, '235', '43', 'er', 'dsaf', 'safd', 'RCP', 'B.Pharmacy', 'asf', 'af', 'afs', 'af', 'af', NULL, NULL, 'permanent', NULL, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'af', 1, 0, '2017-07-20 02:30:00', '2017-07-06 09:31:57');

--
-- Triggers `staff`
--
DELIMITER $$
CREATE TRIGGER `update_staff_timestamp` BEFORE UPDATE ON `staff` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(6) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dispname` varchar(15) NOT NULL,
  `reg_no` varchar(12) NOT NULL,
  `fathername` varchar(255) DEFAULT NULL,
  `mothername` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `dp` varchar(30) DEFAULT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text,
  `aadhar` varchar(20) DEFAULT NULL,
  `dob` date NOT NULL,
  `placeob` varchar(255) DEFAULT NULL,
  `stateob` varchar(255) DEFAULT NULL,
  `countryob` varchar(255) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstname`, `lastname`, `dispname`, `reg_no`, `fathername`, `mothername`, `email`, `mobile`, `dp`, `present_address`, `permanent_address`, `aadhar`, `dob`, `placeob`, `stateob`, `countryob`, `gender`, `nationality`, `religion`, `caste`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Vinay', 'Kumar', 'Vinay', '125CSE895', '', '', 'cse_student@raghuenggcollege.com', '9879875850', '', 'Raghu Engineering College', 'NAD Kotha Road', '', '1999-08-05', '', '', '', 'M', '', '', '', '', 1, '2017-06-15 00:00:00', '2017-06-15 00:00:00');

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `update_students_timestamp` BEFORE UPDATE ON `students` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_no` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `utype` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `reg_no`, `password`, `utype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'b1a5b64256e27fa5ae76d62b95209ab3', 'adm', '1234', '2017-06-12 20:30:00', '2017-06-12 20:30:00'),
(2, 'CseHod', 'RECCSE001', 'd0c65fddac5b54f5f81acd72df8f4e20', 'stf', '1235', '2017-06-14 06:59:29', '2017-06-26 03:51:46'),
(3, 'Vinay Kumar', '125CSE895', 'fedb93a39e3d11f452fb953b9ca01944', 'std', '1236', '2017-06-14 07:57:30', '2017-06-29 10:38:42'),
(4, 'poorna', 'REC410', 'bdd9a2881764e666a7f3a5abfb0e7031', 'stf', '1237', '2017-06-13 02:42:00', '2017-06-23 12:15:27'),
(5, 'principal', 'RECPRI001', 'c22396348411bfdd2ca55f92b8c676ed', 'stf', '1238', '2017-06-21 02:42:00', '2017-06-28 11:19:34'),
(6, 'Dean', 'RECCSE002', 'ff13581a6b160192e6f35f5cfc136b3f', 'stf', '1239', '2017-06-21 01:30:00', '2017-06-29 06:07:53'),
(7, 'management', 'management', 'd10af457daa1deed54e2c36b5f295e7e', 'adm', '1240', '2017-06-14 00:30:00', '2017-06-29 06:31:57'),
(8, 'leaveadmin', 'admin2', 'c84258e9c39059a89ab77d846ddab909', 'adm', '1321', '2017-05-02 01:30:00', '2017-07-04 05:15:37');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `update_users_timestamp` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
Set New.updated_at = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `reg_no` (`reg_no`);

--
-- Indexes for table `Type_of_leave`
--
ALTER TABLE `Type_of_leave`
  ADD UNIQUE KEY `reg_no` (`reg_no`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `allroles`
--
ALTER TABLE `allroles`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `coff`
--
ALTER TABLE `coff`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD UNIQUE KEY `college` (`college`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD UNIQUE KEY `department` (`department`,`college`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD UNIQUE KEY `designation` (`designation`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `holdate` (`holdate`);

--
-- Indexes for table `leave_issues`
--
ALTER TABLE `leave_issues`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD PRIMARY KEY (`typeId`);

--
-- Indexes for table `lmscron`
--
ALTER TABLE `lmscron`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_empid_unique` (`reg_no`),
  ADD UNIQUE KEY `staff_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_no` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`reg_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Role`
--
ALTER TABLE `Role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `allroles`
--
ALTER TABLE `allroles`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `coff`
--
ALTER TABLE `coff`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `leave_issues`
--
ALTER TABLE `leave_issues`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `leavetypes`
--
ALTER TABLE `leavetypes`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `lmscron`
--
ALTER TABLE `lmscron`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `sundays` ON SCHEDULE EVERY 1 YEAR STARTS '2017-01-01 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

call findSundays();

END$$

DELIMITER ;
--
-- Database: `raghuerp_mom`
--
CREATE DATABASE IF NOT EXISTS `raghuerp_mom` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `raghuerp_mom`;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `acid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `actdescription` longtext NOT NULL,
  `actresponsibleperson` longtext NOT NULL,
  `actexpectcompletion` date NOT NULL,
  `acstatus` varchar(20) NOT NULL DEFAULT 'pending',
  `actualcompdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`acid`, `mid`, `actdescription`, `actresponsibleperson`, `actexpectcompletion`, `acstatus`, `actualcompdate`) VALUES
(1, 1, 'sadf', 'rec0010', '2017-08-22', 'pending', '0000-00-00'),
(2, 1, 'sadf', 'rec0067', '2017-08-22', 'pending', '0000-00-00'),
(3, 1, 'sadf', 'rec0032', '2017-08-22', 'pending', '0000-00-00'),
(4, 1, 'dsfa', 'rec0067', '2017-08-24', 'pending', '0000-00-00'),
(5, 1, 'dsfa', 'rec0032', '2017-08-24', 'pending', '0000-00-00'),
(6, 1, 'dsfa', 'rec0018', '2017-08-24', 'pending', '0000-00-00'),
(7, 2, 'sadf', 'RECMECH001', '2017-08-15', 'completed', '2017-08-17'),
(8, 2, 'sadf', 'rec0153', '2017-08-15', 'pending', '0000-00-00'),
(9, 3, 'sdfa', 'rec0153', '2017-08-02', 'pending', '0000-00-00'),
(10, 3, 'sdfa', 'rec0148', '2017-08-02', 'pending', '0000-00-00'),
(11, 3, 'sfad', 'rit0069', '2017-08-30', 'pending', '0000-00-00'),
(12, 3, 'sfad', 'RECMECH001', '2017-08-30', 'pending', '0000-00-00'),
(13, 4, 'dfs', 'rec0134', '2017-08-16', 'pending', '0000-00-00'),
(14, 4, 'dfs', 'RECMECH001', '2017-08-16', 'pending', '0000-00-00'),
(15, 4, 'dsf', 'rec0134', '2017-08-15', 'pending', '0000-00-00'),
(16, 4, 'dsf', 'rec0072', '2017-08-15', 'pending', '0000-00-00'),
(17, 5, 'fd', 'rec0067', '2017-08-15', 'completed', '2017-08-25'),
(18, 5, 'fd', 'rec0176', '2017-08-15', 'pending', '0000-00-00'),
(19, 5, 'fd', 'rec0148', '2017-08-15', 'pending', '0000-00-00'),
(20, 6, 'Prepare Presentation', 'rit0206', '2017-08-18', 'pending', '0000-00-00'),
(21, 6, 'Prepare Schedule', 'rec0130', '2017-08-14', 'pending', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `agid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `agtopic` longtext NOT NULL,
  `agresponsibleperson` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`agid`, `mid`, `agtopic`, `agresponsibleperson`) VALUES
(1, 1, 'hostel', 'rec0130'),
(2, 1, 'hostel', 'rec0072'),
(3, 1, 'hostel', 'rec0036'),
(4, 1, 'hostel', 'rec0017'),
(5, 1, 'sda', 'rec0130'),
(6, 1, 'sda', 'RECCSE001'),
(7, 2, 'dsfa', 'rec0130'),
(8, 2, 'dsfa', 'rec0153'),
(9, 2, 'sadf', 'rec0153'),
(10, 2, 'sadf', 'rec0130'),
(11, 3, 'sdaf', 'rit0083'),
(12, 3, 'sdaf', 'rit0118'),
(13, 4, 'sfda', 'rec0124'),
(14, 4, 'sfda', 'rec0072'),
(15, 4, 'safddsfa', 'rec0072'),
(16, 4, 'safddsfa', 'rec0134'),
(17, 5, 'dfsg', 'rec0148'),
(18, 5, 'dfsg', 'rec0060'),
(19, 6, 'NAAC-A', 'rec0124'),
(20, 6, 'NAAC-B', 'rec0016');

-- --------------------------------------------------------

--
-- Table structure for table `decisions`
--

CREATE TABLE `decisions` (
  `did` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `decisiontaken` longtext NOT NULL,
  `dedescription` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `decisions`
--

INSERT INTO `decisions` (`did`, `mid`, `decisiontaken`, `dedescription`) VALUES
(1, 1, 'rec0130', 'sdfa'),
(2, 1, 'rec0162', 'sdfa'),
(3, 1, 'rit0207', 'sdfa'),
(4, 1, 'rec0072', 'fsda'),
(5, 1, 'rec0010', 'fsda'),
(6, 1, 'rec0067', 'fsda'),
(7, 2, 'rec0006', 'sdaf'),
(8, 2, 'rit0207', 'sdaf'),
(9, 2, 'rec0148', 'sdaf'),
(10, 3, 'rit0118', 'safd'),
(11, 3, 'rit0083', 'safd'),
(12, 3, 'rec0153', 'sfda'),
(13, 3, 'rec0148', 'sfda'),
(14, 4, 'rec0134', 'fds'),
(15, 4, 'rec0072', 'fds'),
(16, 4, 'rec0134', 'sdf'),
(17, 4, 'rec0072', 'sdf'),
(18, 5, 'rec0148', 'gf'),
(19, 5, 'rec0130', 'gf'),
(20, 5, 'rec0176', 'gf'),
(21, 5, 'rec0067', 'dfsg'),
(22, 5, 'rec0080', 'dfsg'),
(23, 5, 'rec0153', 'dfsg'),
(24, 6, 'rit0001', 'No holiday on Sunday, 20th Aug'),
(25, 6, 'rec0124', 'Compensatory on Any other working day');

-- --------------------------------------------------------

--
-- Table structure for table `meetingdetails`
--

CREATE TABLE `meetingdetails` (
  `mid` int(11) NOT NULL,
  `meetingname` tinytext NOT NULL,
  `facilitator` longtext NOT NULL,
  `meetingdate` date NOT NULL,
  `meetingtime` varchar(20) NOT NULL,
  `meetingduration` varchar(20) NOT NULL,
  `location` text NOT NULL,
  `presences` longtext NOT NULL,
  `absences` longtext NOT NULL,
  `reg_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meetingdetails`
--

INSERT INTO `meetingdetails` (`mid`, `meetingname`, `facilitator`, `meetingdate`, `meetingtime`, `meetingduration`, `location`, `presences`, `absences`, `reg_no`) VALUES
(1, 'busses', 'rec0032,rec0067,rec0010', '2017-08-18', '09:45:00', '1 hr 30 min', 'conference hall', 'rec0032,rec0067,rec0010,rit0207,rit0202,RECCSE001,rit0198,rec0022,rec0019,rec0018,rec0017,rec0036,rec0031,rec0030,rec0060,rec0047,rec0099', 'rec0072,rec0130,rec0162', 'admin'),
(2, 'asdf', 'rec0032,rec0067,rec0130', '2017-08-08', '09:00:00', '6 hrs', 'sdfasdfa', 'rec0032,rec0067,rec0130,rec0006,rec0003,rit0202', 'rec0153,rec0148,rit0207', 'admin'),
(3, 'sadf', 'rit0118,rit0083,rit0069', '2017-08-09', '07:30:00', '4 hrs', 'sadf', 'rit0118,rit0083,rit0069', 'rec0148,rec0153', 'admin'),
(4, 'sdf', 'rec0124,rec0072', '2017-08-16', '07:00:00', '6 hrs 30 min', 'sdfa', 'rec0124,rec0072', 'rec0134,rec0130', 'rec0123'),
(5, 'fdsag', 'rec0067,rec0176,rec0010,rec0031,rec0080', '2017-08-24', '08:30:00', '6 hrs', 'sadg', 'rec0067,rec0176,rec0010,rec0031,rec0080,rec0022,rec0027,rec0061,rec0060', 'rec0153,rec0148,rec0134,rec0130', 'admin'),
(6, 'NAAC', 'rit0001', '2017-08-17', '7:00 AM', '1 hr 30 min', 'aaa', 'rit0001,rec0124,rec0130,rit0206,rec0016,rit0088,rit0082,rit0062', 'RECCSE001,rec0060,rec0154,rec0079,rec0089', 'RECMECH001');

-- --------------------------------------------------------

--
-- Table structure for table `nextmeeting`
--

CREATE TABLE `nextmeeting` (
  `nid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `nextagendadesc` longtext NOT NULL,
  `nextdate` date NOT NULL,
  `nexttime` varchar(20) NOT NULL,
  `nextvenue` text NOT NULL,
  `nextfacilitator` longtext NOT NULL,
  `attendeeslist` longtext NOT NULL,
  `nextexpmeetdate` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nextmeeting`
--

INSERT INTO `nextmeeting` (`nid`, `mid`, `nextagendadesc`, `nextdate`, `nexttime`, `nextvenue`, `nextfacilitator`, `attendeeslist`, `nextexpmeetdate`, `status`) VALUES
(1, 1, 'sdaf', '2017-08-09', '7:00 AM', 'dsfa', 'rec0134,rec0130,rec0124', 'rec0134,rec0130,rec0124,rit0207,rit0202,rit0198', '', 'Sure'),
(2, 2, 'sadf', '2017-08-29', '7:00 AM', 'sadf', 'rec0124,rec0072', 'rec0124,rec0072,rec0134', '', 'Sure'),
(3, 3, 'sadf', '0000-00-00', 's', '', 'rec0124,rec0072', 'rec0124,rec0072,rec0134', 'sadf', 'Expected'),
(4, 4, 'dfs', '2017-08-30', '7:45 AM', 'gsd', 'rec0067,rit0202', 'rec0067,rit0202,rec0153', '', 'Sure'),
(5, 5, 'ds', '2017-08-30', '9:15 AM', 'dg', 'rec0124,rec0072', 'rec0124,rec0072,RECCSE001,rec0176', '', 'Sure'),
(6, 6, 'Review', '2017-08-19', '7:00 AM', 'BBB', 'rec0072', 'rec0072,rec0176,rec0007,rec0006,rec0027,rec0030,rec0060,rec0061', '', 'Sure');

-- --------------------------------------------------------

--
-- Table structure for table `objectives`
--

CREATE TABLE `objectives` (
  `oid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `objective` longtext NOT NULL,
  `objdescription` longtext NOT NULL,
  `objowner` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `objectives`
--

INSERT INTO `objectives` (`oid`, `mid`, `objective`, `objdescription`, `objowner`) VALUES
(1, 1, 'sdaf', 'dsfa', ''),
(2, 2, 'dsf', 'sfad', ''),
(3, 2, 'sadf', 'fsda', ''),
(4, 3, 'asdf', 'sdfa', ''),
(5, 4, 'sdaf', 'dfsa', ''),
(6, 4, 'sdag', 'gfd', ''),
(7, 5, 'gsd', 'g', 'rec0148'),
(8, 5, 'gsd', 'g', 'rec0153'),
(9, 5, 'gsd', 'g', 'rec0067'),
(10, 5, 'dsg', 'dfsfgh', 'rec0067'),
(11, 5, 'dsg', 'dfsfgh', 'rec0148'),
(12, 5, 'dsg', 'dfsfgh', 'rec0060'),
(13, 6, 'NAAC-AA', 'NAAC-AAA', 'rec0124'),
(14, 6, 'NAAC-BB', 'NAAC-BBB', 'rec0130');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`acid`);

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`agid`);

--
-- Indexes for table `decisions`
--
ALTER TABLE `decisions`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `meetingdetails`
--
ALTER TABLE `meetingdetails`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `nextmeeting`
--
ALTER TABLE `nextmeeting`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`oid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `acid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `agid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `decisions`
--
ALTER TABLE `decisions`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `meetingdetails`
--
ALTER TABLE `meetingdetails`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `nextmeeting`
--
ALTER TABLE `nextmeeting`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
