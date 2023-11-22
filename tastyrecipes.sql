-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 09:38 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tastyrecipes`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` varchar(10) NOT NULL,
  `receptId` int(11) NOT NULL,
  `userName` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentId`, `content`, `date`, `receptId`, `userName`) VALUES
(24, 'gött', '2021-03-17', 61, 'nader');

-- --------------------------------------------------------

--
-- Table structure for table `ingredientinfo`
--

CREATE TABLE `ingredientinfo` (
  `receptId` int(11) NOT NULL,
  `Ingredients` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredientinfo`
--

INSERT INTO `ingredientinfo` (`receptId`, `Ingredients`) VALUES
(60, 'dsf'),
(60, 'sdf'),
(61, 'dfg'),
(61, 'dfg');

-- --------------------------------------------------------

--
-- Table structure for table `likesamount`
--

CREATE TABLE `likesamount` (
  `receptId` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likesamount`
--

INSERT INTO `likesamount` (`receptId`, `likes`) VALUES
(60, 88),
(61, 75);

-- --------------------------------------------------------

--
-- Table structure for table `recept`
--

CREATE TABLE `recept` (
  `receptId` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `userName` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recept`
--

INSERT INTO `recept` (`receptId`, `title`, `userName`) VALUES
(60, 'food', 'Tim'),
(61, 'food', 'nader');

-- --------------------------------------------------------

--
-- Table structure for table `receptinfo`
--

CREATE TABLE `receptinfo` (
  `receptId` int(11) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(10) NOT NULL,
  `nutritionalValue` text NOT NULL,
  `imgPath` varchar(64) NOT NULL,
  `time` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receptinfo`
--

INSERT INTO `receptinfo` (`receptId`, `description`, `category`, `nutritionalValue`, `imgPath`, `time`) VALUES
(60, 'dsf', 'Sött', 'dsf', 'imges\\img6.jpeg', 'dsf'),
(61, 'dfg', 'Kött', 'dfg', 'imges\\img2.png', '3 timmar');

-- --------------------------------------------------------

--
-- Table structure for table `receptsteg`
--

CREATE TABLE `receptsteg` (
  `stegId` int(11) NOT NULL,
  `receptId` int(11) NOT NULL,
  `steg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receptsteg`
--

INSERT INTO `receptsteg` (`stegId`, `receptId`, `steg`) VALUES
(0, 60, 'dsf'),
(1, 60, 'dsf'),
(0, 61, 'fdg'),
(1, 61, 'dfg');

-- --------------------------------------------------------

--
-- Table structure for table `replaydcomments`
--

CREATE TABLE `replaydcomments` (
  `commentId` int(11) NOT NULL,
  `relatedUserName` varchar(128) NOT NULL,
  `userName` varchar(128) NOT NULL,
  `parentId` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `replaydcomments`
--

INSERT INTO `replaydcomments` (`commentId`, `relatedUserName`, `userName`, `parentId`, `date`, `content`) VALUES
(34, 'nader', 'david', 24, '2021-03-17', 'vrf'),
(36, 'nader', 'Tim', 24, '2021-03-02', 'fg'),
(37, 'nader', 'david', 24, '2021-03-5', 'fdg'),
(38, 'nader', 'Tim', 24, '2021-03-02', 'fg'),
(39, 'nader', 'david', 24, '2021-03-5', 'fdg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userName` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `adminStatus` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userName`, `email`, `password`, `adminStatus`) VALUES
('alaa', 'a@g.c', '$2a$12$f8e7DNPtlUQ4P0Usj2nuG.rSXuTSa6bbwFP16ovKR/okbUzJtoICe', 0),
('david', 'david@g.c', '$2a$12$CxiN9HvDzoLid3StC3ObjeotmIHm2x7uWVLoW31YASP4nH8uyQyjG', 0),
('nader', 'nader@gmail.com', '$2a$12$Ffp95ExWuVbhFX3hVfCJHuMuEA9Ya3rN6QLWAFQlPQ7oXu9tU3RsO', 1),
('Tim', 'tim@gmail.com', '$2a$12$o4ySeefQVHDrxYearWnKheofUpA8RbK7M24GgUfyItgyvsZTt4vAq', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentId`),
  ADD KEY `comment_ibfk_1` (`receptId`),
  ADD KEY `comment_ibfk_2` (`userName`);

--
-- Indexes for table `ingredientinfo`
--
ALTER TABLE `ingredientinfo`
  ADD KEY `ingredientinfo_ibfk_1` (`receptId`);

--
-- Indexes for table `likesamount`
--
ALTER TABLE `likesamount`
  ADD KEY `receptId` (`receptId`);

--
-- Indexes for table `recept`
--
ALTER TABLE `recept`
  ADD PRIMARY KEY (`receptId`),
  ADD KEY `recept_ibfk_1` (`userName`);

--
-- Indexes for table `receptinfo`
--
ALTER TABLE `receptinfo`
  ADD KEY `receptinfo_ibfk_1` (`receptId`);

--
-- Indexes for table `receptsteg`
--
ALTER TABLE `receptsteg`
  ADD KEY `receptsteg_ibfk_1` (`receptId`);

--
-- Indexes for table `replaydcomments`
--
ALTER TABLE `replaydcomments`
  ADD PRIMARY KEY (`commentId`),
  ADD KEY `replaydcomments_ibfk_1` (`relatedUserName`),
  ADD KEY `replaydcomments_ibfk_2` (`userName`),
  ADD KEY `replaydcomments_ibfk_3` (`parentId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `recept`
--
ALTER TABLE `recept`
  MODIFY `receptId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `replaydcomments`
--
ALTER TABLE `replaydcomments`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`receptId`) REFERENCES `recept` (`receptId`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE;

--
-- Constraints for table `ingredientinfo`
--
ALTER TABLE `ingredientinfo`
  ADD CONSTRAINT `ingredientinfo_ibfk_1` FOREIGN KEY (`receptId`) REFERENCES `recept` (`receptId`) ON DELETE CASCADE;

--
-- Constraints for table `likesamount`
--
ALTER TABLE `likesamount`
  ADD CONSTRAINT `receptId` FOREIGN KEY (`receptId`) REFERENCES `recept` (`receptId`) ON DELETE CASCADE;

--
-- Constraints for table `recept`
--
ALTER TABLE `recept`
  ADD CONSTRAINT `recept_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE;

--
-- Constraints for table `receptinfo`
--
ALTER TABLE `receptinfo`
  ADD CONSTRAINT `receptinfo_ibfk_1` FOREIGN KEY (`receptId`) REFERENCES `recept` (`receptId`) ON DELETE CASCADE;

--
-- Constraints for table `receptsteg`
--
ALTER TABLE `receptsteg`
  ADD CONSTRAINT `receptsteg_ibfk_1` FOREIGN KEY (`receptId`) REFERENCES `recept` (`receptId`) ON DELETE CASCADE;

--
-- Constraints for table `replaydcomments`
--
ALTER TABLE `replaydcomments`
  ADD CONSTRAINT `replaydcomments_ibfk_1` FOREIGN KEY (`relatedUserName`) REFERENCES `comment` (`userName`) ON DELETE CASCADE,
  ADD CONSTRAINT `replaydcomments_ibfk_2` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE,
  ADD CONSTRAINT `replaydcomments_ibfk_3` FOREIGN KEY (`parentId`) REFERENCES `comment` (`commentId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
