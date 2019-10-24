-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 09:55 AM
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
-- Database: `boatreservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `boats`
--

CREATE TABLE `boats` (
  `Bid` int(11) NOT NULL,
  `Bname` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `boats`
--

INSERT INTO `boats` (`Bid`, `Bname`, `color`) VALUES
(101, 'Intertake', 'blue'),
(102, 'Intertake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `Sid` int(11) NOT NULL,
  `Bid` int(11) NOT NULL,
  `day` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserve`
--

INSERT INTO `reserve` (`Sid`, `Bid`, `day`) VALUES
(32, 102, '1998-03-11 00:00:00.000000'),
(85, 101, '2019-10-07 00:00:00.000000'),
(95, 101, '2012-04-03 00:00:00.000000'),
(95, 102, '2012-10-24 00:00:00.000000'),
(95, 103, '2012-05-10 00:00:00.000000'),
(95, 104, '2012-08-03 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `sailors`
--

CREATE TABLE `sailors` (
  `Sid` int(11) NOT NULL,
  `Sname` varchar(20) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `age` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sailors`
--

INSERT INTO `sailors` (`Sid`, `Sname`, `rating`, `age`) VALUES
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55.5),
(32, 'Andy', 8, 25.5),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'John', 9, 40),
(85, 'Art', 3, 25.5),
(95, 'Bob', 3, 63.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`Bid`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD KEY `Sid` (`Sid`),
  ADD KEY `Bid` (`Bid`);

--
-- Indexes for table `sailors`
--
ALTER TABLE `sailors`
  ADD PRIMARY KEY (`Sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boats`
--
ALTER TABLE `boats`
  MODIFY `Bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `sailors`
--
ALTER TABLE `sailors`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `reserve_ibfk_1` FOREIGN KEY (`Sid`) REFERENCES `sailors` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserve_ibfk_2` FOREIGN KEY (`Bid`) REFERENCES `boats` (`Bid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
