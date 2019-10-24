-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 10:01 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extendempdeptnsit`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `deptid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `locid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`deptid`, `name`, `locid`) VALUES
(1, 'A', 11),
(2, 'B', 22),
(3, 'C', 33),
(4, 'D', 44);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `jobid` int(11) NOT NULL,
  `managerid` int(11) NOT NULL,
  `hiredate` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `deptid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empid`, `name`, `dob`, `jobid`, `managerid`, `hiredate`, `salary`, `deptid`) VALUES
(1, 'EMP1', '1990-05-06', 1, 1, '2018-09-06', 100000, 1),
(2, 'EMP2', '1989-02-19', 2, 2, '2017-11-15', 150000, 2),
(3, 'EMP3', '1985-09-06', 3, 3, '2015-03-06', 120000, 3),
(4, 'EMP4', '1986-09-10', 1, 1, '2015-03-13', 90000, 1),
(5, 'EMP5', '1988-12-11', 4, 4, '2018-09-06', 150000, 4),
(6, 'EMP5', '1990-05-06', 1, 1, '2018-09-06', 100000, 1),
(7, 'EMP6', '1990-05-06', 1, 1, '2018-09-06', 100000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `jobid` int(11) NOT NULL,
  `function` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`jobid`, `function`) VALUES
(1, 'F1'),
(2, 'F2'),
(3, 'F3'),
(4, 'F4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`deptid`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empid`),
  ADD KEY `jobid` (`jobid`),
  ADD KEY `deptid` (`deptid`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`jobid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`jobid`) REFERENCES `job` (`jobid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`deptid`) REFERENCES `department` (`deptid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
