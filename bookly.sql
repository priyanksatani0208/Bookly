-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2024 at 08:56 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookly`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Priyank - Admin', 'admin@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bookingDate` datetime NOT NULL,
  `bookingType` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `bookName` varchar(100) NOT NULL,
  `bookAuthor` varchar(30) NOT NULL,
  `bookEdition` varchar(30) NOT NULL,
  `bookPublisher` varchar(100) NOT NULL,
  `bookPrice` int(11) NOT NULL,
  `bookDiscount` int(11) NOT NULL,
  `bookLength` varchar(11) NOT NULL,
  `BookLanguage` varchar(100) NOT NULL,
  `BookTopic` varchar(50) NOT NULL,
  `bookDescription` varchar(255) NOT NULL,
  `bookImg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookId`, `catId`, `bookName`, `bookAuthor`, `bookEdition`, `bookPublisher`, `bookPrice`, `bookDiscount`, `bookLength`, `BookLanguage`, `BookTopic`, `bookDescription`, `bookImg`) VALUES
(2, 19, 'The Art of War', 'abc', '1st Edition', 'abc', 500, 10, '200 page\'s ', 'English', 'War', 'This Book are Write in War.', 'The_Art_of_War.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(30) NOT NULL,
  `catImg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catId`, `catName`, `catImg`) VALUES
(18, 'abc', 'The_Art_of_War.jpg'),
(19, 'History', 'history.webp'),
(20, 'abcd', 'The_Art_of_War.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contId` int(11) NOT NULL,
  `contFname` varchar(30) NOT NULL,
  `contLname` varchar(30) NOT NULL,
  `contEmail` varchar(30) NOT NULL,
  `contPhone` int(12) NOT NULL,
  `contMessage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contId`, `contFname`, `contLname`, `contEmail`, `contPhone`, `contMessage`) VALUES
(1, 'priyank', 'satani', 'priyank@gmail.com', 1234567895, 'hi'),
(2, 'Ram', 'Sita', 'ram@gmail.com', 1234567895, 'jai shri ram'),
(3, 'ram', ' sita', 'ram@gmail.com', 123456789, 'hi'),
(4, 'ram', 'sita', 'ram@gmail.com', 1234567895, 'hi'),
(5, 'Priyank', 'Satani', 'priyank@gmail.com', 753159852, 'hi'),
(6, 'Priyank ', 'Satani', 'priyank@gmail.com', 1234567895, 'Hello Priyank.'),
(7, 'Ram', 'Sita', 'ram@gmail.com', 1234567895, 'hi ram..'),
(8, 'ram', 'Satani', 'ram@gmail.com', 753159852, 'abc'),
(9, 'ram', 'Satani', 'ram@gmail.com', 1234567895, 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL,
  `feed_rating` int(11) NOT NULL,
  `feed_review` varchar(255) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `feed_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `paymentAmount` int(11) NOT NULL,
  `paymentDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uId` int(11) NOT NULL,
  `uName` varchar(25) NOT NULL,
  `uemail` varchar(35) NOT NULL,
  `uPhone` int(11) NOT NULL,
  `ugender` varchar(10) NOT NULL,
  `uAddress` varchar(255) NOT NULL,
  `uabout` varchar(255) DEFAULT NULL,
  `uProfile` varchar(255) NOT NULL DEFAULT 'default.png',
  `upassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uId`, `uName`, `uemail`, `uPhone`, `ugender`, `uAddress`, `uabout`, `uProfile`, `upassword`) VALUES
(9, 'Priyank  Satani', 'priyank@gmail.com', 1234567898, 'Male', 'Ahmadabad', 'hi', 'img2.jpg', '123'),
(15, 'Divya Rathod', 'divya@gmail.com', 1234567895, 'Female', 'Ahmadabad', 'Hi , i am a java developer.', 'signatureday.jpg', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `catId` (`catId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `bookId` (`bookId`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`),
  ADD KEY `catId` (`catId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `bookId` (`bookId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `category` (`catId`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`uId`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `category` (`catId`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`uId`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
