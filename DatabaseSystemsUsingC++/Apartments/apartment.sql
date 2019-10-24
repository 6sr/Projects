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
-- Database: `apartment`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE `apartment` (
  `Bno` int(11) NOT NULL,
  `Ano` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `rent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apartment`
--

INSERT INTO `apartment` (`Bno`, `Ano`, `floor`, `rent`) VALUES
(101, 1, 1, 100),
(101, 2, 1, 90),
(101, 3, 2, 80),
(101, 4, 2, 70),
(101, 5, 3, 60),
(102, 1, 1, 120),
(102, 2, 2, 110),
(102, 3, 3, 100),
(102, 4, 4, 90),
(103, 1, 1, 200),
(103, 2, 2, 180),
(103, 3, 3, 150),
(104, 1, 1, 400),
(104, 2, 1, 600);

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `Bno` int(11) NOT NULL,
  `Bname` text NOT NULL,
  `Addr` text NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`Bno`, `Bname`, `Addr`, `Total`) VALUES
(101, 'B1', 'Near the yamuna floodplains', 5),
(102, 'B2', 'Near Laxmi Nagar', 4),
(103, 'B3', 'Near Anand Vihar', 3),
(104, 'B4', 'Near Karkardooma', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
  ADD PRIMARY KEY (`Bno`,`Ano`),
  ADD KEY `Bno` (`Bno`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`Bno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartment`
--
ALTER TABLE `apartment`
  ADD CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`Bno`) REFERENCES `building` (`Bno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
