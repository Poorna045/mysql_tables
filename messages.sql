-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 26, 2017 at 10:13 AM
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
(6, 'mail', 'html', 'LeaveSystem', 'ksraju.ece@raghuenggcollege.in', '', '', 'Leave Status', ' D BHASKARA RAO  Details,<br /><br />\r\n            D BHASKARA RAO  applied leave Request<br /><br />\r\n              -------------------------------------------------<br /><br />\r\n              <table>\r\n              <thead>\r\n			   <tr>\r\n              <th colspan=2>leave details</th>\r\n              </tr>\r\n			   </thead>\r\n			   <tbody>\r\n              <tr>\r\n              <td>Faculty Id</th>\r\n			  <td>rec0132</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Department</th>\r\n			  <td>ECE</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>College</th>\r\n			  <td>REC</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>From Date</th>\r\n			  <td>2017-07-26 09:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>To Date</th>\r\n			  <td>2017-07-26 12:00:00</td>\r\n			  </tr>\r\n			  <tr>\r\n              <td>Duration</th>\r\n			  <td>0.5 days</td>\r\n			  </tr>\r\n			   <tr>\r\n              <td>Delegated Person</th>\r\n			  <td>rec0026</td>\r\n			  </tr>\r\n              </tbody>\r\n              </table>\r\n              -------------------------------------------------<br /><br />\r\n        \r\n          Thanks<br/>REI Team', b'0', '', '2017-07-26 05:36:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`mid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
