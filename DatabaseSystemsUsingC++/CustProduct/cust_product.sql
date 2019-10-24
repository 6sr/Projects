-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 09:59 AM
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
-- Database: `cust_product`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_num` int(11) NOT NULL,
  `cust_lname` varchar(10) NOT NULL,
  `cust_fname` varchar(10) NOT NULL,
  `cust_balance` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_num`, `cust_lname`, `cust_fname`, `cust_balance`) VALUES
(1, 'garg', 'ajay', 860),
(2, 'sharma', 'raman', 1100),
(3, 'B', 'A', 500);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `inv_num` int(11) NOT NULL,
  `prodNum` int(11) NOT NULL,
  `cust_num` int(11) NOT NULL,
  `inv_date` date NOT NULL,
  `unit_sold` int(11) NOT NULL,
  `inv_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`inv_num`, `prodNum`, `cust_num`, `inv_date`, `unit_sold`, `inv_amount`) VALUES
(1, 1, 1, '2019-09-04', 1, 20),
(2, 1, 1, '2019-09-04', 1, 20),
(3, 1, 1, '2019-09-04', 1, 20),
(4, 1, 1, '2019-09-05', 1, 20),
(5, 1, 1, '2019-09-04', 1, 20);

--
-- Triggers `invoice`
--
DELIMITER $$
CREATE TRIGGER `reduce_cust_bal` AFTER INSERT ON `invoice` FOR EACH ROW UPDATE 
	customer c
SET 
	c.cust_balance = c.cust_balance - NEW.inv_amount
WHERE
	c.cust_num = NEW.cust_num
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_num` int(11) NOT NULL,
  `prod_name` varchar(10) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_num`, `prod_name`, `price`) VALUES
(1, 'Water', 20),
(2, 'chips', 35),
(3, 'cold drink', 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_num`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`inv_num`,`prodNum`,`cust_num`,`inv_date`),
  ADD KEY `prod_num` (`prodNum`),
  ADD KEY `cust_num` (`cust_num`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `inv_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`prodNum`) REFERENCES `product` (`prod_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`cust_num`) REFERENCES `customer` (`cust_num`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
