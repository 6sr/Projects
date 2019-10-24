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
-- Database: `hockeytournament`
--

-- --------------------------------------------------------

--
-- Table structure for table `injury`
--

CREATE TABLE `injury` (
  `injuryset` text NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `team1name` text NOT NULL,
  `team2name` text NOT NULL,
  `team1score` int(11) NOT NULL,
  `team2score` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `playername` varchar(30) NOT NULL,
  `skill` text NOT NULL,
  `position` text NOT NULL,
  `no_of_goals` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `playername`, `skill`, `position`, `no_of_goals`) VALUES
(1, 'Ryan', 'Dribbling', 'CentreHalf', 4),
(2, 'Sandra', 'Defense', 'CentreBack', 7),
(3, 'Fernandes', 'Passing', 'Midfielder', 8),
(4, 'Aman', 'solid rock\r\n', 'Goalkeeper', 9),
(5, 'Varun', 'shooting', 'Forward', 10),
(6, 'Olivia', 'Master passer', 'LeftWingBack', 3),
(7, 'Abhishek', 'Dribble', 'defense', 0),
(8, 'Jadon', 'Lazy', 'Box to box', 2);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_name` varchar(30) NOT NULL,
  `team_id` int(11) NOT NULL,
  `coach` varchar(30) NOT NULL,
  `captain` int(11) NOT NULL,
  `collegename` text NOT NULL,
  `no_of_wins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_name`, `team_id`, `coach`, `captain`, `collegename`, `no_of_wins`) VALUES
('Heroes', 1, 'Coach1', 1, 'NSUT', 2),
('Team2', 2, 'Coach2', 2, 'JNU', 1),
('3Rotaters', 3, 'Coach3', 3, 'DTU', 0),
('Breakers', 4, 'Coach4', 4, 'DAV', 0);

-- --------------------------------------------------------

--
-- Table structure for table `teamplayer`
--

CREATE TABLE `teamplayer` (
  `team_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teamplayer`
--

INSERT INTO `teamplayer` (`team_id`, `player_id`) VALUES
(1, 5),
(2, 6),
(3, 7),
(4, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `injury`
--
ALTER TABLE `injury`
  ADD KEY `injuryset` (`injuryset`(3072)),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD KEY `team1name` (`team1name`(3072)),
  ADD KEY `team2name` (`team2name`(3072));

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `captain` (`captain`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `team_name` (`team_name`);

--
-- Indexes for table `teamplayer`
--
ALTER TABLE `teamplayer`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `injury`
--
ALTER TABLE `injury`
  ADD CONSTRAINT `injury_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`captain`) REFERENCES `player` (`player_id`);

--
-- Constraints for table `teamplayer`
--
ALTER TABLE `teamplayer`
  ADD CONSTRAINT `teamplayer_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  ADD CONSTRAINT `teamplayer_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
