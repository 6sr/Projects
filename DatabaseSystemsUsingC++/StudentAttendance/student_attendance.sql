-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 09:57 AM
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
-- Database: `student_attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `dailyattendance`
--

CREATE TABLE `dailyattendance` (
  `roll_no` varchar(20) NOT NULL,
  `sem` int(11) NOT NULL,
  `date` date NOT NULL,
  `CEC01` int(2) NOT NULL,
  `CEC02` int(2) NOT NULL,
  `CEC03` int(2) NOT NULL,
  `CEC04` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dailyattendance`
--

INSERT INTO `dailyattendance` (`roll_no`, `sem`, `date`, `CEC01`, `CEC02`, `CEC03`, `CEC04`) VALUES
('101', 3, '2019-10-01', 1, 2, 1, 1),
('101', 3, '2019-10-03', 1, 0, 1, 0),
('102', 3, '2019-10-01', 1, 2, 1, 1),
('102', 3, '2019-10-03', 1, 1, 1, 0),
('103', 3, '2019-10-03', 0, 0, 0, 0),
('104', 3, '2019-10-01', 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medicalrecord`
--

CREATE TABLE `medicalrecord` (
  `roll_no` varchar(20) NOT NULL,
  `sem` int(2) NOT NULL,
  `date` date NOT NULL,
  `medical_info` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicalrecord`
--

INSERT INTO `medicalrecord` (`roll_no`, `sem`, `date`, `medical_info`) VALUES
('103', 3, '2019-10-03', 'Absent due to fever');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dailyattendance`
--
ALTER TABLE `dailyattendance`
  ADD PRIMARY KEY (`roll_no`,`sem`,`date`);

--
-- Indexes for table `medicalrecord`
--
ALTER TABLE `medicalrecord`
  ADD PRIMARY KEY (`roll_no`,`sem`,`date`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
