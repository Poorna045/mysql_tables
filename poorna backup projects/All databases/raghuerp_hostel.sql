-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 01, 2017 at 01:16 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `raghuerp_hostel`
--

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
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
