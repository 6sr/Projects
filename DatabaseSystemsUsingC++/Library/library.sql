-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 09:58 AM
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
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookID` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Coursename` text NOT NULL,
  `noofcopies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `Title`, `Coursename`, `noofcopies`) VALUES
(101, 'A Course to DBMS', 'CEC06', 10),
(102, 'Introduction to Java', 'CEC07', 15),
(103, 'Analog Electronics', 'CEC09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `BookID` int(11) NOT NULL,
  `Sid` int(11) NOT NULL,
  `dateofborrow` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`BookID`, `Sid`, `dateofborrow`) VALUES
(101, 1501, '2019-09-03'),
(102, 1504, '2019-10-07'),
(101, 1501, '2019-10-03'),
(101, 1503, '2019-10-01'),
(101, 1504, '2019-10-07');

--
-- Triggers `borrow`
--
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `borrow` FOR EACH ROW Insert into logbook(Sid, BookID, dateofborrow, dateofreturn)
SELECT A.Sid, A.BookID, A.dateofborrow, B.dateofreturn
from borrow as A, returnbook as B
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `copies`
-- (See below for the actual view)
--
CREATE TABLE `copies` (
`BookID` int(11)
,`noofcopies` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `logbook`
--

CREATE TABLE `logbook` (
  `Sid` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `dateofborrow` date DEFAULT NULL,
  `dateofreturn` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logbook`
--

INSERT INTO `logbook` (`Sid`, `BookID`, `dateofborrow`, `dateofreturn`) VALUES
(1501, 101, '2019-09-03', '2019-10-01'),
(1501, 101, '2019-09-03', '2019-10-01'),
(1501, 101, '2019-09-03', '2019-10-09'),
(1504, 102, '2019-10-07', '2019-10-01'),
(1504, 102, '2019-10-07', '2019-10-01'),
(1504, 102, '2019-10-07', '2019-10-09'),
(1501, 101, '2019-10-03', '2019-10-01'),
(1501, 101, '2019-10-03', '2019-10-01'),
(1501, 101, '2019-10-03', '2019-10-09'),
(1503, 101, '2019-10-01', '2019-10-01'),
(1503, 101, '2019-10-01', '2019-10-01'),
(1503, 101, '2019-10-01', '2019-10-09'),
(1504, 101, '2019-10-07', '2019-10-01'),
(1504, 101, '2019-10-07', '2019-10-01'),
(1504, 101, '2019-10-07', '2019-10-09');

-- --------------------------------------------------------

--
-- Table structure for table `returnbook`
--

CREATE TABLE `returnbook` (
  `BookID` int(11) NOT NULL,
  `Sid` int(11) NOT NULL,
  `dateofreturn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returnbook`
--

INSERT INTO `returnbook` (`BookID`, `Sid`, `dateofreturn`) VALUES
(101, 1501, '2019-10-01'),
(102, 1504, '2019-10-01'),
(101, 1501, '2019-10-09');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Sid` int(11) NOT NULL,
  `Sname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Sid`, `Sname`) VALUES
(1501, 'S1'),
(1502, 'S2'),
(1503, 'S3'),
(1504, 'S4');

-- --------------------------------------------------------

--
-- Table structure for table `student1`
--

CREATE TABLE `student1` (
  `Sid` int(11) NOT NULL,
  `Phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student1`
--

INSERT INTO `student1` (`Sid`, `Phone`) VALUES
(1501, 1564),
(1501, 7584),
(1502, 16564),
(1503, 1654),
(1504, 12);

-- --------------------------------------------------------

--
-- Structure for view `copies`
--
DROP TABLE IF EXISTS `copies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `copies`  AS  select `books`.`BookID` AS `BookID`,`books`.`noofcopies` AS `noofcopies` from `books` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD KEY `BookID` (`BookID`),
  ADD KEY `Sid` (`Sid`);

--
-- Indexes for table `returnbook`
--
ALTER TABLE `returnbook`
  ADD KEY `BookID` (`BookID`),
  ADD KEY `Sid` (`Sid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `student1`
--
ALTER TABLE `student1`
  ADD PRIMARY KEY (`Sid`,`Phone`),
  ADD KEY `Sid` (`Sid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`);

--
-- Constraints for table `returnbook`
--
ALTER TABLE `returnbook`
  ADD CONSTRAINT `returnbook_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  ADD CONSTRAINT `returnbook_ibfk_2` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`);

--
-- Constraints for table `student1`
--
ALTER TABLE `student1`
  ADD CONSTRAINT `student1_ibfk_1` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
