-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2024 at 07:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
-- Table structure for table `add_cart`
--

CREATE TABLE `add_cart` (
  `cartId` int(11) NOT NULL,
  `uId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_cart`
--

INSERT INTO `add_cart` (`cartId`, `uId`, `bookId`, `quantity`) VALUES
(5, 9, 9, 1),
(10, 9, 6, 1),
(11, 9, 8, 1),
(12, 15, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, ' Admin', 'admin@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `total_amount` double DEFAULT NULL,
  `bookingDate` datetime NOT NULL,
  `bookingType` varchar(25) NOT NULL,
  `booking_status` bigint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingID`, `userId`, `shipping_address`, `total_amount`, `bookingDate`, `bookingType`, `booking_status`) VALUES
(112, 9, 'Ahmedabad', 199, '2024-10-04 10:05:37', 'COD', 1);

-- --------------------------------------------------------

--
-- Table structure for table `booking_detail`
--

CREATE TABLE `booking_detail` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `bookingId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_detail`
--

INSERT INTO `booking_detail` (`id`, `book_id`, `bookingId`) VALUES
(110, 8, 112);

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
  `bookDescription` text NOT NULL,
  `bookImg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookId`, `catId`, `bookName`, `bookAuthor`, `bookEdition`, `bookPublisher`, `bookPrice`, `bookDiscount`, `bookLength`, `BookLanguage`, `BookTopic`, `bookDescription`, `bookImg`) VALUES
(5, 23, 'HUMSAFAR', 'Hitesh Gupta Aadil', '1st Edition', 'Fingerprint! Publishing (5 June 2023); ', 499, 30, '464 page', 'English', 'Urdu Poetry', 'This book is a treasure trove of over 150 beautiful and timeless romantic ghazals, nazms, and rubaais— all of them translated and transliterated into English. It holds the iconic verses of poets like Ghalib, Firaq, and Faiz, and showcases the poetry of popular contemporary poets.', 'HUMSAFAR.jpg'),
(6, 23, 'Chand Nigal Gayi', 'Saba Mahmood Bashir', '1st Edition', 'HarperHindi (29 October 2021)', 199, 18, '128 pages', 'English', 'Gulzar Saab Ki Kavitaye', 'Gulzar is arguably the most well-known contemporary poet writing in Hindustani. He occupies a unique place by being a Progressive poet in a popular culture.<br><br> His poetry appeals to all strata of society, without compromising either on literary merit or on its ability to convey the most exalted thought in an accessible idiom. In Chand Nigal Gayi, the Hindi translation of I Swallowed the Moon, Saba Bashir attempts to analyse what makes Gulzar the poet he is. ', 'Chand Nigal Gayi.jpg'),
(7, 23, ' Our Love Story', 'Rohit Sharma ', '2nd Edition', 'Fingerprint! Publishing (1 January 2020)', 199, 20, '304 pages', 'English', 'love story', 'Veronica is done. Done trying to make it as a model. Done with getting sexually harassed by casting directors. And done seeing her mother struggle to provide for her family. Tonight, everything ends. She teeters over the edge of the parapet, imagining how the Cold water of the Arabian sea will take her breath away when she drowns.', 'Our Love Story.jpg'),
(8, 22, 'Patanjali’s Yoga Sutras', 'Swami Vivekananda', '1st Edition', 'Fingerprint! Publishing', 199, 1, '160 pages', 'English', 'Yoga and Meditation', 'Patanjali\'s Yoga Sutras is a timeless guide to the practice of yoga and meditation. This edition of the book presents a clear and accessible translation of the ancient text, with helpful commentary and explanations. It is an essential resource for anyone interested in deepening their understanding of yoga and its teachings.', 'Patanjali\'s Yoga Sutras.jpg'),
(9, 22, 'Meditation and Its Methods', ' Swami Vivekananda', '1st Edition', ' Grapevine India (20 June 2018)', 175, 12, '169 pages', 'English', 'Meditation', 'Holy meditation helps to burn out all mental impurities. - Swami VivekanandaThis book is a collection of Swami Vivekananda’s explanation of Meditation, his writings and lectures on Meditation, its benefits and its methods. It is a book with teachings from the life of Swami Vivekananda, to help one get through the chaos in one’s life. Swami ji believed that meditation should be of a negative nature. ', 'Meditation and Its Methods by Swami Vivekananda.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(30) NOT NULL,
  `catImg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catId`, `catName`, `catImg`) VALUES
(22, 'Yoga', 'yoga.svg'),
(23, 'Romance', 'Rommance.svg'),
(25, 'Horror', 'horror.svg'),
(26, 'Businessman', 'businessman.svg'),
(27, 'Kids', 'Kids.svg'),
(28, 'spiritual', 'om.svg'),
(29, 'Cooking', 'cook.svg'),
(30, 'Fitness', 'fitness(2).svg'),
(31, 'Employee', 'employee.svg'),
(32, 'Magic', 'magic-potion.svg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contId`, `contFname`, `contLname`, `contEmail`, `contPhone`, `contMessage`) VALUES
(1, 'priyank', 'satani', 'priyank@gmail.com', 1234567895, 'hi'),
(2, 'Ram', 'Sita', 'ram@gmail.com', 1234567895, 'jai shri ram'),
(3, 'ram', ' sita', 'ram@gmail.com', 123456789, 'hi'),
(4, 'ram', 'sita', 'ram@gmail.com', 1234567895, 'hi');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `upassword` varchar(30) NOT NULL,
  `otp` int(4) DEFAULT NULL,
  `otp_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uId`, `uName`, `uemail`, `uPhone`, `ugender`, `uAddress`, `uabout`, `uProfile`, `upassword`, `otp`, `otp_date`) VALUES
(9, 'Priyank  Satani', 'priyanksatani1234@gmail.com', 1234567898, 'Male', 'Ahmadabad India', 'hi', 'img1.jpg', '123', NULL, NULL),
(15, 'Divya Rathod', 'divya@gmail.com', 1234567895, 'Female', 'Ahmadabad', 'Hi , i am a java developer.', 'IMG_4051.jpg', '123', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_cart`
--
ALTER TABLE `add_cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `bookId` (`bookId`),
  ADD KEY `uId` (`uId`);

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
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `bookingId` (`bookingId`);

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
  ADD PRIMARY KEY (`feed_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `feedback_ibfk_2` (`bookId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_cart`
--
ALTER TABLE `add_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_cart`
--
ALTER TABLE `add_cart`
  ADD CONSTRAINT `add_cart_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`),
  ADD CONSTRAINT `add_cart_ibfk_2` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`uId`);

--
-- Constraints for table `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD CONSTRAINT `booking_detail_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`bookId`),
  ADD CONSTRAINT `booking_detail_ibfk_2` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`bookingID`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `category` (`catId`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `user` (`uId`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
