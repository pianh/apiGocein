-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 04:44 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gocein`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductId` int(11) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductPrice` decimal(12,2) DEFAULT NULL,
  `ProductType` varchar(255) DEFAULT NULL,
  `ProductFileName` varchar(255) DEFAULT NULL,
  `CreateAt` timestamp NULL DEFAULT current_timestamp(),
  `UpdateAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductId`, `ProductName`, `ProductPrice`, `ProductType`, `ProductFileName`, `CreateAt`, `UpdateAt`) VALUES
(1, 'Broccoli', 5.87, 'vegetable', 'BroccoliOrganic.png', '2023-06-06 04:48:07', '2023-06-07 07:43:14'),
(2, 'Onion', 6.87, 'vegetable', 'Onion.png', '2023-06-06 05:45:41', '2023-06-07 07:18:50'),
(3, 'Banana', 5.87, 'fruit', 'Banana.png', '2023-06-06 05:45:55', '2023-06-07 07:36:27'),
(4, 'Egg', 5.87, 'egg', 'Egg.png', '2023-06-06 05:55:50', '2023-06-07 07:16:11'),
(6, 'Carot', 9.87, 'vegetable', 'Carrot.png', '2023-06-06 05:58:39', '2023-06-07 07:36:45'),
(8, 'Starfruit', 5.65, 'fruit', 'Starfruit.png', '2023-06-07 05:02:47', '2023-06-07 07:37:10'),
(9, 'Apple', 1.32, 'fruit', 'Apple.png', '2023-06-07 05:07:39', '2023-06-07 07:37:33'),
(10, 'Coconut', 4.13, 'fruit', 'Coconut.png', '2023-06-07 06:01:09', '2023-06-07 07:37:57'),
(11, 'Avocado', 2.28, 'fruit', 'Avocado.png', '2023-06-07 06:03:07', '2023-06-07 07:38:18'),
(18, 'Starfruit j', 5.22, 'fruit', 'Starfruit.png', '2023-06-07 07:52:53', '2023-06-07 10:16:51'),
(23, 'Coconut', 2.42, 'Fruit', 'Coconut.png', '2023-06-09 07:45:57', '2023-06-09 07:46:06');

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE `producttype` (
  `ProductTypeId` int(11) NOT NULL,
  `ProductTypeName` varchar(255) NOT NULL,
  `CreateAt` timestamp NULL DEFAULT current_timestamp(),
  `UpdateAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`ProductTypeId`, `ProductTypeName`, `CreateAt`, `UpdateAt`) VALUES
(1, 'All', '2023-06-06 07:22:09', '2023-06-06 07:22:09'),
(2, 'Vegetable', '2023-06-06 07:23:02', '2023-06-06 07:23:02'),
(3, 'Fruit', '2023-06-06 07:23:40', '2023-06-06 08:22:13'),
(4, 'Meal', '2023-06-07 03:17:03', '2023-06-07 03:17:03'),
(5, 'Egg', '2023-06-07 03:17:11', '2023-06-07 03:17:11'),
(6, 'Meat', '2023-06-07 03:24:44', '2023-06-07 03:24:44'),
(14, 'Chicken', '2023-06-09 01:20:06', '2023-06-09 01:20:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductId`) USING BTREE;

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`ProductTypeId`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `producttype`
--
ALTER TABLE `producttype`
  MODIFY `ProductTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
