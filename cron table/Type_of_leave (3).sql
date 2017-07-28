-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 25, 2017 at 08:13 AM
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
('rec0001', 'Dr G CH S N RAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0002', 'A VIJAY KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0003', '', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0004', 'B.UMAMAHESWAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0005', 'U SARAT', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0006', '', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0007', '', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0008', 'SK.DARYABI', 0, 0, 0, 0, 9.5, 10, 9.5, 0, 0),
('rec0009', 'K ARUN KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0010', 'N.ANIL CHAKRAVARTHY', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0011', '', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0012', 'Dr. P MALLIKARJUNA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0013', 'B.G.MADHURI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0014', 'Dr R.V.BHASKAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0015', 'B.MADHU BABU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0016', 'M MEENA KUMARI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0017', 'I S SIVA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0018', 'G.SRIDEVI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0019', 'TVS SRIRAM', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0020', 'G V SIVA PRASAD', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0021', 'A.J.SIRISHA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0022', 'A.DURGA PRAVEEN KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0023', 'R.NAVEEN KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0024', 'S.KRANTHI KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0025', 'K.BHANU KUMARI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0026', 'K.SATHIRAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0027', 'T P R VITAL', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0028', 'K.PHANINDER VINAY', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0029', 'M.V.SURESH KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0030', 'S.APPALA RAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0031', 'M.ANIL KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0032', 'I. KRISHNA CHAITANYA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0033', 'S.PRASADA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0034', 'K. TRINADHA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0035', 'J.RENUKESWARA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0036', 'D V S RAVI VARMA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0037', 'Dr A.S.PRAKASH RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0038', 'T.ANURADHA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0039', 'V.TATA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0040', 'S.RAMANA BABU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0041', 'LAL BABUPRASAD', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0042', 'K.MADHAVI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0043', 'V S SUBRAHMANYAM', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0044', 'V.SOMASEKHARAM', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0045', 'N.MARKANDEYA GUPTA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0046', 'P.SRINIVAS', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0047', 'S.SRINADH RAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0048', 'B.RAMESH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0049', 'P.RAJESH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0050', 'R KAMESWARA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0051', 'S A ANICIA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0052', 'V PARTHA SARADHI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0053', 'Y.RAGHAVENDRA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0054', 'P.ANIL KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0055', 'VVN SURYANARAYANA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0056', 'Y.V.SRI CHARAN', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0057', 'YLV SANTOSH KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0058', 'P SEKHARA BABU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0059', 'N.ADILAKSHMI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0060', 'BH.V.S.NARAYANA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0061', 'P.SURENDRA VARMA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0062', 'N V S S PRABHAKAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0063', 'A.SUKANYA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0064', 'B SIVA RAMA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0065', 'PKVS SUBRAMANYESWARA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0066', 'P.E.SATYANARAYANA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0067', 'R. SRINIVASA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0068', 'L.SATISH KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0069', 'M.VENKATA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0070', 'K.SWATHI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0071', 'B.L.GANESWARA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0072', 'SHAHAZADI BEGUM', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0073', 'M.RUPALI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0074', 'Dr K.SUBRAMANYAM', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0075', 'P NARESH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0076', 'N.SAHADEVA RAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0077', 'NIKHIL BHAT', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0078', 'N.SREELEKHA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0079', 'CH LAVANYA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0080', 'safd', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0081', 'Dr.T.VENKATA SWAMY', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0082', 'Y.VENKATA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0083', 'S.SANTOSH KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0084', 'CH.RAJESH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0085', 'M. SATYANARAYANA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0086', 'P.CHNADRA SEKHAR PILLI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0087', 'Y. SATYANARAYANA RAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0088', 'Dr T.RAMU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0089', 'P.VENUGOPAL', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0090', 'Dr R SRINIVASU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0091', 'A.NAGESWARA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0092', 'S S PRAKASH RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0093', 'K.SHANMUKHA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0094', 'G.SANYASI RAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0095', 'Dr PANCHANAND JHA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0096', 'B.SREEVIDYA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0097', '', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0098', 'P. SIDDHARTHA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0099', 'S.SUDHIRVARMA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0100', 'P P N G PHANI KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0101', 'Dr. V.PRAMILA MURTHY', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0102', 'P.RAJA NAVEEN', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0103', 'N S C  CHAITANYA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0104', 'K.V. VARA LAKSHMI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0105', 'K PRANEETH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0106', 'DVR VASU PAVANI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0107', 'M.SURYA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0108', 'P.SANKAR RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0109', 'SVV RAMA DEVI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0110', 'S. TEJESWAR REDDY', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0111', 'B VISALAKSHI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0112', 'T.SANTHI PRIYA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0113', 'S KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0114', 'MD. RAMEEZ', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0115', 'Dr. PHANI RAMA KRISHNA CHUNDURY', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0116', 'RADHARANI NAYAK', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0117', 'VANDANA MAHANTHI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0118', 'S SARALA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0119', 'D SIVA PRASAD VARMA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0120', 'L SREEDHAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0121', 'K SRINIVAS RAVI KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0122', 'K SULOCHANA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0123', 'P S KRISHNAM RAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0124', 'M SRIDHAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0125', 'MANISH YADAV', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0126', 'V PRAMADHA RANI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0127', 'M SHOBHA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0128', 'Y E VASANTH KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0129', 'K CHINABABU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0130', 'B SUDEEPTHI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0131', 'GUPTESWAR SAHU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0132', 'D BHASKARA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0133', 'NETHALA RAJU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0134', 'P NAGABHUSHANAM', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0135', 'A SWETHA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0136', 'BLESSY NAVARA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0137', 'K MAHESWAR RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0138', 'T SURESH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0139', 'P REVATHI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0140', 'K SREEKANTH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0141', 'Y SWAPNA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0142', 'P RAMESH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0143', 'Dr S SATYANARAYANA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0144', 'P RAVI KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0145', 'AMIT KUMAR MEHAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0146', 'D SANDHYA RANI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0147', 'R SIRI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0148', 'R VIJAY SAGAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0149', 'RAJ KISHOR DAS', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0150', 'K JYOTHSNA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0151', 'N B L V PRASAD', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0152', 'Dr T GANAPATHY', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0153', 'Dr.S RAVI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0154', 'R GOVINDA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0155', 'Dr VIVEK PANDEY', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0156', 'G SUNIL KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0157', 'S P APARANJI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0158', 'T HIMA BINDU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0159', 'T KALYANI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0160', 'R VINAY KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0161', 'K H K RAGHU VAMSI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0162', 'Y S G GOVIND BABU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0163', 'MD ARIF', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0164', 'MOHD MERAJ KHAN', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0165', 'T S KAVITHA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0166', 'A VAMSIDHAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0167', 'M SRIKANTH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0168', 'Dr. M MURALI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0169', 'Y SUDHAVANI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0170', 'G RAJA KUMARI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0171', 'P BEERSHEBA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0172', 'T. SATYANARAYANA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0173', 'Dr. B SRINIVAS', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0174', 'P.V.V. RAJAGOPAL', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0175', 'Dr. R VAIKUNTA RAO', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0176', 'JASMINE VINCENT', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0177', 'SAI SRIKANTH', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0178', 'J RAMESH NAIDU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0179', 'D UMA SANKAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0180', 'D MOUNIKA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0181', 'C.V.R.PADMAJA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0182', 'MUNAGAPATI MURALI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0183', 'R. SUPRIYA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0184', 'A. Rutwik', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0185', 'G. SANTOSH KUMAR VARMA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0186', 'G. SAROJA', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0187', 'M. HARISH', 0, 0, 0, 0, 9.5, 10, 9.5, 0, 0),
('rec0188', 'P. TEJASWI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0189', 'V. MOHANA GANDHI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0190', 'D. KEERTHI', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0191', 'M. ANIL KUMAR', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('rec0192', 'M MADHU', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('REC410', 'poorna', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('RECCSE001', 'cseHOD', 0, 0, 0, 0, 9.5, 10, 9.5, 0.5, 0),
('RECCSE002', 'csedean', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('RECEEE01', 'Sivarama rao', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('RECMECH001', 'Nikhil', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('RECPRI001', 'principal', 0, 0, 0, 0, 10, 10, 10, 0, 0),
('xyz123', 'apparo', 0, 0, 0, 0, 10, 10, 10, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Type_of_leave`
--
ALTER TABLE `Type_of_leave`
  ADD UNIQUE KEY `reg_no` (`reg_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
