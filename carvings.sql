-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2020 at 02:11 PM
-- Server version: 10.4.12-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carvings`
--

-- --------------------------------------------------------

--
-- Table structure for table `Canteen`
--

CREATE TABLE `Canteen` (
  `CanteenID` int(11) NOT NULL,
  `CanteenName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CanteenDescription` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Canteen`
--

INSERT INTO `Canteen` (`CanteenID`, `CanteenName`, `CanteenDescription`) VALUES
(1, 'Main Canteen', 'This is the main canteen'),
(2, 'Mini Canteen', 'For your short break cravings. Sandwiches and vada pavs, coffee and tea! Samosas are sold out within a couple minutes, from what we\'ve gathered. So be quick!');

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CanteenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`CategoryID`, `CategoryName`, `CanteenID`) VALUES
(1, 'South Indian', 1),
(2, 'North Indian', 1),
(4, 'Juice and Beverages', 1),
(5, 'Chats', 1),
(6, 'Junk Food', 2),
(7, 'Refreshments', 2),
(8, 'Change', 1),
(9, 'Change', 2),
(17, 'Chinese', 1),
(18, 'New Category', 1),
(20, 'GJ\'s corner', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Food`
--

CREATE TABLE `Food` (
  `FoodID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Availability` tinyint(4) NOT NULL DEFAULT 1,
  `Rating` double NOT NULL DEFAULT 0,
  `NumberRatings` int(11) NOT NULL DEFAULT 0,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store each food item.';

--
-- Dumping data for table `Food`
--

INSERT INTO `Food` (`FoodID`, `Name`, `Price`, `Availability`, `Rating`, `NumberRatings`, `CategoryID`) VALUES
(1, 'Coffee', 10, 0, 3.6666666666667, 3, 7),
(2, 'Masala Dosa', 35, 0, 4, 3, 1),
(3, 'Tea', 10, 0, 5, 4, 7),
(4, 'Cheese Masala Dosa', 50, 0, 4, 2, 1),
(5, 'Veg Sandwich', 35, 0, 4, 3, 6),
(6, 'Set Dosa', 40, 0, 4.3333333333333, 3, 1),
(7, 'Plain Dosa', 30, 0, 0, 0, 1),
(8, 'South Thali', 45, 0, 4, 1, 1),
(9, 'North Thali', 55, 0, 3, 1, 2),
(10, 'Roti Curry', 40, 0, 3.6857142857142, 14, 2),
(11, 'Aloo Parota', 40, 0, 4, 20, 2),
(12, 'Badam Milk', 10, 0, 0, 0, 7),
(13, 'Gone Mad', 5, 0, 4.9121621621621, 148, 8),
(14, 'Gone Mad', 5, 0, 1.5, 10, 9),
(15, 'Samosa (nice try)', 10, 0, 4.8153846153846, 26, 6),
(16, 'Bun Samosa', 25, 0, 4, 1, 6),
(18, 'Egg Puff', 20, 0, 5, 1, 6),
(19, 'Bhel Puri', 30, 0, 4.8571428571428, 7, 5),
(20, 'Masala Puri', 30, 0, 0, 0, 5),
(21, 'Pani Puri', 30, 0, 0, 0, 5),
(22, 'Pulao', 40, 0, 4, 1, 1),
(25, 'Watermelon', 30, 0, 4, 2, 4),
(26, 'Chocolate Milkshake', 40, 0, 0, 0, 4),
(27, 'Cold Coffee', 30, 0, 2, 5, 4),
(28, 'Cream Bun', 20, 0, 4, 4, 6),
(29, 'Just Two Idlis', 25, 0, 3.6666666666667, 3, 1),
(30, 'Idli Vada', 35, 0, 4.6666666666667, 3, 1),
(31, 'Rice Rasam', 30, 0, 3.2, 5, 1),
(32, 'Curd Rice (Mosranna)', 25, 0, 0, 0, 1),
(33, 'Bisibelebath (only if you\'re lucky - and i mean it)', 30, 0, 4.4, 4, 1),
(34, 'Veg Puff', 25, 0, 3.5, 2, 6),
(36, 'Cavin\'s Milkshake', 25, 0, 4, 1, 7),
(37, 'The thing in the fridge beside Cavin\'s', 25, 0, 0, 0, 7),
(40, 'Idli x3', 35, 0, 4, 1, 1),
(43, 'Choki Choki', 5, 0, 4.8, 5, 9),
(44, 'Gobi Manchurian', 50, 0, 0, 0, 17),
(45, 'Noodles', 50, 0, 4, 1, 17),
(47, 'Food name', 50, 0, 0, 0, 18),
(48, 'New Food ', 50, 0, 0, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `OrderItem`
--

CREATE TABLE `OrderItem` (
  `OrderItemID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `DidRateFood` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `OrderItem`
--

INSERT INTO `OrderItem` (`OrderItemID`, `OrderID`, `FoodID`, `Quantity`, `DidRateFood`) VALUES
(1, 1, 13, 4, 5),
(2, 2, 22, 1, 3),
(3, 2, 27, 1, 4),
(4, 2, 26, 1, 5),
(5, 3, 27, 2, 5),
(6, 4, 25, 2, 4),
(7, 4, 16, 2, 0),
(8, 4, 13, 4, 0),
(9, 4, 3, 5, 0),
(10, 4, 8, 3, 0),
(11, 4, 2, 1, 0),
(12, 4, 29, 1, 0),
(13, 4, 10, 1, 0),
(14, 5, 10, 2, 3),
(15, 5, 28, 1, 5),
(16, 6, 10, 2, 3),
(17, 6, 28, 1, 5),
(18, 7, 10, 2, 0),
(19, 7, 28, 1, 0),
(20, 8, 10, 2, 0),
(21, 8, 28, 1, 2),
(22, 9, 31, 1, 0),
(23, 9, 2, 4, 3),
(24, 10, 31, 1, 0),
(25, 10, 2, 3, 0),
(26, 11, 6, 1, 5),
(27, 11, 16, 5, 0),
(28, 12, 29, 1, 3),
(29, 12, 19, 4, 5),
(30, 13, 34, 1, 3),
(31, 14, 16, 3, 0),
(32, 14, 6, 1, 3),
(33, 14, 34, 4, 4),
(34, 15, 18, 2, 0),
(35, 15, 3, 3, 0),
(36, 16, 1, 4, 3),
(37, 17, 15, 4, 5),
(38, 18, 30, 4, 5),
(39, 19, 30, 4, 4),
(40, 20, 13, 5, 1),
(41, 21, 13, 4, 2),
(42, 22, 13, 12, 3),
(43, 23, 13, 1, 1),
(44, 23, 5, 5, 5),
(45, 24, 14, 1, 3),
(46, 24, 19, 5, 4),
(47, 24, 25, 1, 3),
(48, 24, 33, 2, 5),
(49, 25, 31, 4, 4),
(50, 26, 31, 1, 1),
(51, 27, 36, 7, 4),
(52, 28, 43, 5, 4),
(53, 29, 45, 1, 4),
(54, 29, 43, 3, 5),
(55, 29, 6, 2, 5),
(56, 30, 5, 2, 4),
(57, 31, 43, 3, 5),
(58, 32, 43, 4, 5),
(59, 33, 8, 2, 4),
(60, 33, 22, 1, 4),
(61, 33, 29, 1, 4),
(62, 33, 25, 2, 5),
(63, 34, 29, 2, 4),
(64, 34, 31, 1, 3),
(65, 35, 18, 4, 5),
(66, 35, 3, 2, 0),
(67, 36, 4, 3, 4),
(68, 36, 14, 4, 4),
(69, 37, 30, 3, 5),
(70, 38, 31, 2, 5),
(71, 39, 5, 1, 3),
(72, 40, 31, 3, 3),
(73, 41, 28, 2, 4),
(74, 42, 4, 3, 4),
(75, 42, 15, 5, 0),
(76, 42, 32, 2, 0),
(77, 43, 40, 3, 4),
(78, 43, 43, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `NumberOfOrderItems` int(11) NOT NULL,
  `OrderTotal` int(11) NOT NULL,
  `OrderTime` date NOT NULL DEFAULT current_timestamp(),
  `OrderStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Processing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `UserID`, `NumberOfOrderItems`, `OrderTotal`, `OrderTime`, `OrderStatus`) VALUES
(1, 2, 1, 20, '2020-03-11', 'Completed'),
(2, 2, 3, 100, '2020-04-01', 'Completed'),
(3, 2, 1, 60, '2020-04-01', 'Completed'),
(4, 1, 8, 415, '2020-04-01', 'Completed'),
(5, 2, 2, 100, '2020-04-01', 'Completed'),
(6, 2, 2, 100, '2020-04-01', 'Completed'),
(7, 2, 2, 100, '2020-04-01', 'Completed'),
(8, 2, 2, 100, '2020-04-01', 'Completed'),
(9, 2, 2, 170, '2020-04-01', 'Completed'),
(10, 2, 2, 135, '2020-04-01', 'Completed'),
(11, 2, 2, 165, '2020-04-01', 'Completed'),
(12, 2, 2, 145, '2020-04-01', 'Completed'),
(13, 2, 1, 25, '2020-04-01', 'Completed'),
(14, 2, 3, 215, '2020-04-01', 'Completed'),
(15, 1, 2, 70, '2020-04-02', 'Completed'),
(16, 2, 1, 40, '2020-04-02', 'Completed'),
(17, 2, 1, 40, '2020-04-02', 'Completed'),
(18, 2, 1, 140, '2020-04-02', 'Completed'),
(19, 2, 1, 140, '2020-04-02', 'Completed'),
(20, 2, 1, 25, '2020-04-02', 'Completed'),
(21, 2, 1, 20, '2020-04-02', 'Completed'),
(22, 2, 1, 60, '2020-04-03', 'Completed'),
(23, 2, 2, 180, '2020-04-03', 'Completed'),
(24, 2, 4, 245, '2020-04-03', 'Completed'),
(25, 2, 1, 120, '2020-04-05', 'Completed'),
(26, 2, 1, 30, '2020-04-06', 'Completed'),
(27, 2, 1, 175, '2020-04-06', 'Completed'),
(28, 2, 1, 25, '2020-04-06', 'Completed'),
(29, 15, 3, 160, '2020-04-06', 'Completed'),
(30, 2, 1, 70, '2020-04-06', 'Completed'),
(31, 2, 1, 15, '2020-04-06', 'Completed'),
(32, 2, 1, 20, '2020-04-06', 'Completed'),
(33, 16, 4, 205, '2020-04-06', 'Completed'),
(34, 17, 2, 80, '2020-04-06', 'Completed'),
(35, 2, 2, 100, '2020-04-10', 'Completed'),
(36, 2, 2, 170, '2020-04-11', 'Completed'),
(37, 2, 1, 105, '2020-04-11', 'Completed'),
(38, 2, 1, 60, '2020-04-11', 'Completed'),
(39, 2, 1, 35, '2020-04-11', 'Completed'),
(40, 2, 1, 90, '2020-04-11', 'Completed'),
(41, 2, 1, 40, '2020-04-11', 'Completed'),
(42, 2, 3, 250, '2020-04-16', 'Completed'),
(43, 20, 2, 110, '2020-04-18', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Role` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores users of the app. Supports multiple roles (user and admin)';

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `Email`, `Name`, `Number`, `Password`, `Role`) VALUES
(1, 'likitha@gmail.com', 'Likitha', '1234567890', '$2y$10$azFPqBa9vwyRTwjGg9UJl.O/YJbLR1dq70B0wG6Znd9myiPilTEFa', 'User'),
(2, 'vivek@gmail.com', 'Vivek', '8989898989', '$2y$10$JXuDcDvcg3LAQZ8hiBncv.oNj92ykPClKKBOcUER3Fz3IJEvy5lTC', 'User'),
(3, 'random', 'random', '6969696969', '$2y$10$gZAbasGfbPQxSKhQCw0RNOnsvgJkE37afKK/iSMUxJvFaFqoYD.pm', 'User'),
(4, 'mingos@rvce.com', 'Cafe Mingos or whatever it\'s called', '8989898989', '$2y$10$pn3/8u1IiXsxMDlwIQZPBunxdEEqHqF5ORALpH9tEx7bM07zmr5pm', 'Admin'),
(5, 'random@gmail.com', 'Random', '5656565656', '$2y$10$xuNPIs8XPhh9lyfcG0YK1.bpkk.Bcv6Z2bjAPof780ttrh1U9Dtl6', 'User'),
(15, 'yashash@gmail.com', 'Yashash', '8989898989', '$2y$10$DsgadaXQVYEtmtwh6KGXwOPFFc5D.LkpXOJEVs34BmlV5XXjpCvw.', 'User'),
(16, 'jayanth@gmail.com', 'GJRV', '6969696969', '$2y$10$RR9n0kInlw02KO7jGtekZuLUURttoFv16jG0I5HppKxsZ1IzwD31K', 'User'),
(17, 'shashank@gmail.com', 'Shashank ', '6969696969', '$2y$10$C5HfT07IctA4aZPXsBWoPuZxyc1Zu2I5Jb4pfLFNVhqWWI7HtbLx6', 'User'),
(18, 'harith@gmail.com', 'Harith', '6969696969', '$2y$10$Izj1wXCLeKauLDrcSzxmXOSJyC.PtmO0HolqEpunIMZa0u4tSS6NO', 'User'),
(19, 'account@gmail.com', 'Account', '5656565656', '$2y$10$O2M.scG01tBAQZv8.PqtyuXn3s9dJ7FhjoCFx41TD8gIMUP/YzlbG', 'User'),
(20, 'newaccount@gmail.com', 'Vivek', '5656565656', '$2y$10$OFTExNyL4L7zNQ1AVPIRxuBk62y51uSEjVhh.XTzEg0iNSx/uMoWS', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Canteen`
--
ALTER TABLE `Canteen`
  ADD PRIMARY KEY (`CanteenID`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `Categories_fk_CanteenID` (`CanteenID`);

--
-- Indexes for table `Food`
--
ALTER TABLE `Food`
  ADD PRIMARY KEY (`FoodID`),
  ADD KEY `Food_fk_CategoryID` (`CategoryID`);

--
-- Indexes for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD PRIMARY KEY (`OrderItemID`),
  ADD KEY `Food_fk_FoodID` (`FoodID`),
  ADD KEY `OrderItem_fk_OrderID` (`OrderID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `Orders_fk_UserID` (`UserID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Canteen`
--
ALTER TABLE `Canteen`
  MODIFY `CanteenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Food`
--
ALTER TABLE `Food`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `OrderItem`
--
ALTER TABLE `OrderItem`
  MODIFY `OrderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Categories`
--
ALTER TABLE `Categories`
  ADD CONSTRAINT `Categories_fk_CanteenID` FOREIGN KEY (`CanteenID`) REFERENCES `Canteen` (`CanteenID`);

--
-- Constraints for table `Food`
--
ALTER TABLE `Food`
  ADD CONSTRAINT `Food_fk_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD CONSTRAINT `Food_fk_FoodID` FOREIGN KEY (`FoodID`) REFERENCES `Food` (`FoodID`),
  ADD CONSTRAINT `OrderItem_fk_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_fk_UserID` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
