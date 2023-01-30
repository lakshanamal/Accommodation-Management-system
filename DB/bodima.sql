-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2023 at 03:47 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bodima`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `a_id` int(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'administrator',
  `merchent_id` int(25) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `profileimage` text NOT NULL,
  `user_accepted` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`a_id`, `email`, `password`, `level`, `merchent_id`, `first_name`, `last_name`, `address`, `profileimage`, `user_accepted`) VALUES
(1, 'boadima7@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'administrator', 1216956, 'Amal', 'Lakshan', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `boarder`
--

CREATE TABLE `boarder` (
  `Bid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'boarder',
  `address` varchar(250) NOT NULL,
  `location_link` text NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `image` varchar(255) NOT NULL,
  `institute` varchar(40) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `telephone` text NOT NULL,
  `user_accepted` int(1) NOT NULL,
  `profileimage` text NOT NULL DEFAULT '../resource/Images/a.jpg',
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `boarder`
--

INSERT INTO `boarder` (`Bid`, `email`, `password`, `token`, `first_name`, `last_name`, `level`, `address`, `location_link`, `NIC`, `image`, `institute`, `gender`, `telephone`, `user_accepted`, `profileimage`, `reg_date`) VALUES
(105, '2018cs092@stu.ucsc.cmb.ac.lk', '32b3a23f849bb81092bf605d17a6dff99a1da535', '03a9c2128f9870a0c78d125b238a3b58a21230c68f92249c23ad0452e485648bac92f1dc2604beb07cbc3e9c1df46debe52d', 'Kavi', 'devindi', 'boarder', '  ', '  ', '', '../resource/nicImage/', 'NSBM', 'Boy', '0755535393', 0, '../resource/Images/a.jpg', '2023-01-19'),
(106, 'amal.l@x-venture.io', '32b3a23f849bb81092bf605d17a6dff99a1da535', 'bebb4842e59a35e8e54916614be14246ccd611e5f7ff53e11e6c759588698105506d2b0da5f6e664b111608cccdbd88fbf44', 'Amal', 'Lakshan', 'boarder', '  ', '  ', '', '../resource/nicImage/', 'UCSC', 'Boy', '0755535393', 1, '../resource/Images/a.jpg', '2023-01-25');

--
-- Triggers `boarder`
--
DELIMITER $$
CREATE TRIGGER `regDateboarder` BEFORE INSERT ON `boarder` FOR EACH ROW SET NEW.reg_date = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `boarderparent`
--

CREATE TABLE `boarderparent` (
  `Pid` int(11) NOT NULL,
  `Bid` int(11) NOT NULL,
  `parent_name` varchar(40) NOT NULL,
  `parent_telephone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `boarderparent`
--

INSERT INTO `boarderparent` (`Pid`, `Bid`, `parent_name`, `parent_telephone`) VALUES
(42, 105, 'Test', '0755535393'),
(43, 106, 'Kanthi', '0755535393');

-- --------------------------------------------------------

--
-- Table structure for table `boardings_owner`
--

CREATE TABLE `boardings_owner` (
  `BOid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `token` varchar(250) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'boardings_owner',
  `NIC` varchar(12) NOT NULL,
  `address` varchar(250) NOT NULL,
  `merchent_id` int(25) NOT NULL,
  `account_no` int(11) NOT NULL,
  `user_accepted` int(1) NOT NULL,
  `profileimage` text NOT NULL DEFAULT '../resource/Images/a.jpg',
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `boardings_owner`
--

INSERT INTO `boardings_owner` (`BOid`, `email`, `password`, `token`, `first_name`, `last_name`, `level`, `NIC`, `address`, `merchent_id`, `account_no`, `user_accepted`, `profileimage`, `reg_date`) VALUES
(7, 'lakshanamal200@gmail.com', '32b3a23f849bb81092bf605d17a6dff99a1da535', '3d3da6cff62e5d0da83872435933f84478b574c9933dcef54793bfe8057fd3c27c8d82c6c3eeb0bdae8c73cfa0c13cac556d', 'Kalana', 'Ravishanka', 'boardings_owner', '971741547v', '310/delgasduwa/dodanduwa', 1222017, 0, 1, '../resource/Images/uploaded_profile_Image/hostel-img3.jpg', '2023-01-19');

--
-- Triggers `boardings_owner`
--
DELIMITER $$
CREATE TRIGGER `regDatebordingOwner` BEFORE INSERT ON `boardings_owner` FOR EACH ROW SET NEW.reg_date = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `boarding_post`
--

CREATE TABLE `boarding_post` (
  `B_post_id` int(11) NOT NULL,
  `BOid` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `girlsBoys` varchar(255) DEFAULT NULL,
  `person_count` int(100) DEFAULT NULL,
  `cost_per_person` int(255) DEFAULT NULL,
  `rating` int(100) DEFAULT 20,
  `image` varchar(255) NOT NULL DEFAULT '../resource/Images/h1.jpg',
  `house_num` varchar(255) DEFAULT NULL,
  `lane` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `lifespan` int(255) DEFAULT NULL,
  `post_amount` int(255) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `keymoney` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_pay_post` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boarding_post`
--

INSERT INTO `boarding_post` (`B_post_id`, `BOid`, `category`, `girlsBoys`, `person_count`, `cost_per_person`, `rating`, `image`, `house_num`, `lane`, `city`, `district`, `description`, `location`, `latitude`, `longitude`, `lifespan`, `post_amount`, `review`, `keymoney`, `title`, `create_time`, `is_pay_post`) VALUES
(36, 7, 'Individual', 'AnyOne', 1, 3000, 8, '../resource/Images/uploaded_boarding/1 (5).png', '310', 'Delgasduwa', 'Dodanduwa', 'Galle', 'test', '', 0, 0, 30, 3000, 'ishan', 2000, 'test', '2023-01-19 05:30:22', 1),
(37, 7, 'Individual', 'Boys', 2, 5000, 8, '../resource/Images/uploaded_boarding/InkedScreenshot_22_LI.jpg', '310', 'Delgaduwa', 'Dodanduwa', 'Galle', 'Test description', '', 0, 0, 37, 3700, 'ishan', 2000, 'Coral', '2023-01-19 08:46:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `complain_boarding`
--

CREATE TABLE `complain_boarding` (
  `Bid` int(11) NOT NULL,
  `B_post_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `action_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complain_food`
--

CREATE TABLE `complain_food` (
  `Bid` int(11) NOT NULL,
  `F_post_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `action_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `confirm_rent`
--

CREATE TABLE `confirm_rent` (
  `rent_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `Bid` int(11) NOT NULL,
  `BOid` int(11) NOT NULL,
  `B_post_id` int(11) NOT NULL,
  `is_paid` int(11) NOT NULL,
  `keymoneyAmount` int(11) NOT NULL,
  `payment_method` text NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `agreement` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `confirm_rent`
--

INSERT INTO `confirm_rent` (`rent_id`, `request_id`, `Bid`, `BOid`, `B_post_id`, `is_paid`, `keymoneyAmount`, `payment_method`, `payment_date`, `agreement`) VALUES
(39, 140, 105, 7, 36, 0, 2000, 'hand', '2023-01-19 12:18:28', ' '),
(40, 141, 106, 7, 36, 1, 2000, 'hand', '2023-01-25 14:34:57', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `confirm_rent_document`
--

CREATE TABLE `confirm_rent_document` (
  `Bid` int(11) NOT NULL,
  `BOid` int(11) NOT NULL,
  `B_post_id` int(11) NOT NULL,
  `document` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `food_post`
--

CREATE TABLE `food_post` (
  `F_post_id` int(100) NOT NULL,
  `FSid` int(11) NOT NULL,
  `ad_title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `address` varchar(100) NOT NULL,
  `location` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `rating` int(255) NOT NULL,
  `orderingtimedeadline` time NOT NULL,
  `lifespan` int(31) NOT NULL,
  `post_amount` int(255) NOT NULL,
  `image` text NOT NULL DEFAULT '../resource/Images/h1.jpg',
  `posted_date` datetime NOT NULL DEFAULT current_timestamp(),
  `blocked` int(11) NOT NULL DEFAULT 0,
  `is_pay_post` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_post`
--

INSERT INTO `food_post` (`F_post_id`, `FSid`, `ad_title`, `description`, `address`, `location`, `type`, `rating`, `orderingtimedeadline`, `lifespan`, `post_amount`, `image`, `posted_date`, `blocked`, `is_pay_post`) VALUES
(35, 24, 'Araliya', 'Testey', '310/delgasduwa/dodanduwa', '', 'Both', 1, '21:00:00', 30, 3000, '../resource/Images/uploaded_foodpost/foodPost.jpeg', '2023-01-19 13:21:58', 0, 1),
(36, 24, 'Araliya 2', '', '310/delgasduwa/dodanduwa', '', 'Short Term', 1, '21:00:00', 30, 3000, '../resource/Images/uploaded_foodpost/foodPost.jpg', '2023-01-19 13:33:59', 0, 1),
(37, 24, 'Araliya 3', 'test', '310/delgasduwa/dodanduwa', '', 'Short Term', 1, '21:00:00', 30, 3000, '../resource/Images/uploaded_foodpost/patties.jpg', '2023-01-19 13:36:59', 0, 1),
(38, 24, 'Resturent', 'Test resturent', '310/1,Delgasduwa, Dodanduwa', '', 'Short Term', 1, '21:00:00', 30, 3000, '../resource/Images/uploaded_foodpost/cheesekottu.jpg', '2023-01-19 20:52:41', 0, 1),
(40, 24, 'Rasa bojun', '', '310/delgasduwa/dodanduwa ', '', 'Short Term', 1, '21:00:00', 30, 3000, '../resource/Images/uploaded_foodpost/product1.jpg', '2023-01-29 08:43:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_request`
--

CREATE TABLE `food_request` (
  `request_id` int(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `is_accepted` int(1) NOT NULL,
  `term` varchar(10) NOT NULL DEFAULT 'shortTerm',
  `order_type` varchar(10) NOT NULL,
  `shedule` varchar(20) NOT NULL,
  `restaurant` varchar(50) NOT NULL,
  `F_post_id` int(11) NOT NULL,
  `order_id` int(50) NOT NULL,
  `total` double NOT NULL,
  `phone` int(20) NOT NULL,
  `method` varchar(10) NOT NULL,
  `time` datetime NOT NULL,
  `expireTime` datetime NOT NULL,
  `deliveredTime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_request`
--

INSERT INTO `food_request` (`request_id`, `email`, `address`, `first_name`, `last_name`, `is_accepted`, `term`, `order_type`, `shedule`, `restaurant`, `F_post_id`, `order_id`, `total`, `phone`, `method`, `time`, `expireTime`, `deliveredTime`) VALUES
(827, '{$email}', '{$address}', '{$first_name}', '{$last_name}', 0, '{$term}', '{$order_ty', '{$shedule}', '{$name}', 35, 0, 0, 0, '{$method}', '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(828, '2018cs092@stu.ucsc.cmb.ac.lk', '310/delgasduwa/dodanduwa', 'Kavi', 'devindi', 1, 'shortTerm', 'dinner', '3:45 PM', 'Araliya', 35, 2147483647, 380, 755535393, 'cash', '2023-01-19 15:45:13', '2023-01-29 23:27:52', ''),
(829, '2018cs092@stu.ucsc.cmb.ac.lk', '310/delgasduwa/dodanduwa', 'Kavi', 'devindi', 1, 'shortTerm', 'dinner', '3:48 PM', 'Araliya', 35, 2147483647, 380, 755535393, 'card', '2023-01-19 15:48:52', '2023-01-29 23:27:52', ''),
(830, '2018cs092@stu.ucsc.cmb.ac.lk', '310/delgasduwa/dodanduwa', 'Kavi', 'devindi', 4, 'shortTerm', 'dinner', '3:55 PM', 'Araliya', 35, 63, 380, 755535393, 'cash', '2023-01-19 15:55:25', '2023-01-29 23:28:08', '11:18:59pm'),
(831, 'lakshanamal200@gmail.com', '310/delgasduwa/dodanduwa', 'Kalana', 'Ravishanka', 4, 'shortTerm', 'dinner', '9:00 PM', 'Araliya', 35, 223480, 760, 755535393, 'cash', '2023-01-19 21:01:23', '2023-01-19 21:13:51', '09:04:35pm'),
(833, 'amal.l@x-venture.io', '', 'Amal', 'Lakshan', 2, 'shortTerm', 'lunch', '1:22 PM', 'Araliya', 35, 739670, 380, 755535393, '', '2023-01-29 13:26:15', '2023-01-29 13:46:15', ''),
(834, 'amal.l@x-venture.io', '', 'Amal', 'Lakshan', 4, 'shortTerm', 'lunch', '1:30 PM', 'Araliya', 35, 328308, 380, 755535393, '', '2023-01-29 13:30:33', '2023-01-29 13:50:33', '11:18:48pm'),
(835, 'amal.l@x-venture.io', '310/delgasduwa/dodanduwa', 'Amal', 'Lakshan', 2, 'shortTerm', 'lunch', '1:34 PM', 'Araliya', 35, 240648, 380, 755535393, 'cash', '2023-01-29 13:34:11', '2023-01-29 13:54:11', ''),
(836, 'amal.l@x-venture.io', '310/delgasduwa/dodanduwa', 'Amal', 'Lakshan', 2, 'shortTerm', 'lunch', '1:38 PM', 'Araliya', 35, 277840, 380, 755535393, 'cash', '2023-01-29 13:38:45', '2023-01-29 13:58:45', ''),
(837, 'amal.l@x-venture.io', '', 'Amal', 'Lakshan', 4, 'shortTerm', 'lunch', '1:39 PM', 'Araliya', 35, 582055, 380, 755535393, '', '2023-01-29 13:39:47', '2023-01-29 13:59:47', '11:18:42pm'),
(838, 'amal.l@x-venture.io', '310/delgasduwa/dodanduwa', 'Amal', 'Lakshan', 4, 'shortTerm', 'dinner', '11:15 PM', 'Araliya', 35, 9259, 380, 755535393, 'cash', '2023-01-29 23:15:18', '2023-01-29 23:27:59', '11:18:30pm');

-- --------------------------------------------------------

--
-- Table structure for table `food_supplier`
--

CREATE TABLE `food_supplier` (
  `FSid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(250) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `level` varchar(25) NOT NULL DEFAULT 'food_supplier',
  `NIC` varchar(12) NOT NULL,
  `address` varchar(250) NOT NULL,
  `merchent_id` int(25) NOT NULL,
  `user_accepted` int(1) NOT NULL,
  `profileimage` text NOT NULL DEFAULT '../resource/Images/a.jpg',
  `available` int(1) NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_supplier`
--

INSERT INTO `food_supplier` (`FSid`, `email`, `password`, `token`, `first_name`, `last_name`, `level`, `NIC`, `address`, `merchent_id`, `user_accepted`, `profileimage`, `available`, `reg_date`) VALUES
(24, 'lakshanamal100@gmail.com', '32b3a23f849bb81092bf605d17a6dff99a1da535', '83ca30df11251e9ec88fcf2719c791a28f66188ff895f8a423b6573489aa41a7b7bc6dd8ecd3aefcd9e54d2eb8631340219a', 'Amal', 'Lakshan', 'food_supplier', '971741546v', '310/delgasduwa/dodanduwa', 1222017, 1, '../resource/Images/a.jpg', 1, '2023-01-19'),
(25, 'afzalmvaffie@gmail.com', '32b3a23f849bb81092bf605d17a6dff99a1da535', 'c6a2e3fabf9dc6eff3013db409b3766a7e051c25e46dba186edc58cf11f1b7b7aed84c160b9b7b635b5d538fd7378c4a3e5d', 'Test', 'User', 'food_supplier', '971741549V', '310/1,Delgasduwa, Dodanduwa', 12132423, 1, '../resource/Images/a.jpg', 0, '2023-01-19');

--
-- Triggers `food_supplier`
--
DELIMITER $$
CREATE TRIGGER `regDatefoodSupplier` BEFORE INSERT ON `food_supplier` FOR EACH ROW SET NEW.reg_date = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `imgid` int(100) NOT NULL,
  `boid` int(100) NOT NULL,
  `postid` int(100) NOT NULL,
  `image_name` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '../resource/Images/h1.jpg',
  `is_pay` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`imgid`, `boid`, `postid`, `image_name`, `is_pay`) VALUES
(25, 7, 37, '../resource/Images/uploaded_boarding/post37imgUI.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `livesupport`
--

CREATE TABLE `livesupport` (
  `cId` int(11) NOT NULL,
  `admin` varchar(50) NOT NULL DEFAULT 'boadima7@gmail.com',
  `user` varchar(50) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `sender_name` varchar(20) NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `livesupport`
--

INSERT INTO `livesupport` (`cId`, `admin`, `user`, `sender`, `sender_name`, `message`) VALUES
(191, 'boadima7@gmail.com', 'amal.l@x-venture.io', 'amal.l@x-venture.io', 'Amal Lakshan', 'hi');

-- --------------------------------------------------------

--
-- Table structure for table `longterm`
--

CREATE TABLE `longterm` (
  `ltID` int(11) NOT NULL,
  `day` datetime NOT NULL,
  `delivery_state` int(1) NOT NULL,
  `deliveredTime` datetime NOT NULL,
  `order_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `noID` int(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `title` varchar(25) NOT NULL,
  `discription` varchar(100) NOT NULL,
  `time` time NOT NULL,
  `seen_state` int(1) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notify_id` int(11) NOT NULL,
  `type_number` int(11) NOT NULL,
  `from_level` varchar(50) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_level` varchar(50) NOT NULL,
  `to_id` int(11) NOT NULL,
  `massageHeader` text NOT NULL,
  `massage` text NOT NULL,
  `sendDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `redirect_url` text NOT NULL,
  `is_seen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notify_id`, `type_number`, `from_level`, `from_id`, `to_level`, `to_id`, `massageHeader`, `massage`, `sendDateTime`, `redirect_url`, `is_seen`) VALUES
(44, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 1674116819<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 13:56:59', '../views/orders.php', 0),
(45, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 1674119120<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 14:35:20', '../views/orders.php', 0),
(46, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167411922635<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 14:37:06', '../views/orders.php', 0),
(47, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167411928928<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 14:38:09', '../views/orders.php', 0),
(48, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167411951121<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 14:41:51', '../views/orders.php', 0),
(49, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167412047712<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 14:57:57', '../views/orders.php', 0),
(50, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167412055723<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 14:59:17', '../views/orders.php', 0),
(51, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167412213675<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 15:25:36', '../views/orders.php', 0),
(52, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 1674122587100<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 15:33:07', '../views/orders.php', 0),
(53, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 16741227863<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 15:36:26', '../views/orders.php', 0),
(54, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167412315420<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 15:42:34', '../views/orders.php', 0),
(55, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167412325152<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 15:44:11', '../views/orders.php', 0),
(56, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 167412331318<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 15:45:13', '../views/orders.php', 0),
(58, 2, 'student', 51, 'food_supplier', 24, 'New order Arrived', 'customer name : Kavi devindi<br>order id : 63<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-19 15:55:25', '../views/orders.php', 0),
(60, 1, 'food_supplier', 24, 'boardings_owner', 7, 'Your Order Accepted', 'Resturant : Araliya<br>Order id :223480<br>Total amount :760', '2023-01-19 21:03:51', '../views/paymentFood_accept.php', 0),
(62, 2, 'boarder', 106, 'food_supplier', 24, 'New order Arrived', 'customer name : Amal Lakshan<br>order id : 739670<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-29 13:26:15', '../views/orders.php', 0),
(63, 2, 'boarder', 106, 'food_supplier', 24, 'New order Arrived', 'customer name : Amal Lakshan<br>order id : 328308<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-29 13:30:33', '../views/orders.php', 0),
(64, 2, 'boarder', 106, 'food_supplier', 24, 'New order Arrived', 'customer name : Amal Lakshan<br>order id : 240648<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-29 13:34:11', '../views/orders.php', 0),
(65, 2, 'boarder', 106, 'food_supplier', 24, 'New order Arrived', 'customer name : Amal Lakshan<br>order id : 277840<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-29 13:38:45', '../views/orders.php', 0),
(66, 2, 'boarder', 106, 'food_supplier', 24, 'New order Arrived', 'customer name : Amal Lakshan<br>order id : 582055<p style=\"font-size:12px; color:black;\">Accept the order before timeout!</p>', '2023-01-29 13:39:47', '../views/orders.php', 0),
(68, 1, 'food_supplier', 24, 'boarder', 105, 'Your Order Accepted', 'Resturant : Araliya<br>Order id :2147483647<br>Total amount :380<p style=\"font-size:12px; color:black;\">Please do the card payment', '2023-01-29 23:17:52', '../views/paymentFood_accept.php', 0),
(69, 1, 'food_supplier', 24, 'boarder', 106, 'Your Order Accepted', 'Resturant : Araliya<br>Order id :9259<br>Total amount :380', '2023-01-29 23:17:59', '../views/paymentFood_accept.php', 0),
(70, 1, 'food_supplier', 24, 'boarder', 105, 'Your Order Accepted', 'Resturant : Araliya<br>Order id :63<br>Total amount :380', '2023-01-29 23:18:08', '../views/paymentFood_accept.php', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ordereditems`
--

CREATE TABLE `ordereditems` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `breakfast` int(11) NOT NULL,
  `lunch` int(11) NOT NULL,
  `dinner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderfoodboarder`
--

CREATE TABLE `orderfoodboarder` (
  `Bid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `F_post_id` int(11) NOT NULL,
  `FSid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderfoodboardingowner`
--

CREATE TABLE `orderfoodboardingowner` (
  `BOid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `F_post_id` int(11) NOT NULL,
  `FSid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `marchent_id` int(100) NOT NULL,
  `order_id` int(100) NOT NULL,
  `pay_amount` int(100) NOT NULL,
  `pay_currency` varchar(100) NOT NULL,
  `status_code` int(11) NOT NULL,
  `md5sig` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`marchent_id`, `order_id`, `pay_amount`, `pay_currency`, `status_code`, `md5sig`) VALUES
(456, 0, 0, '', 0, ''),
(456, 0, 0, '', 0, ''),
(456, 0, 0, '', 0, ''),
(456, 0, 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `itemID` int(11) NOT NULL,
  `item_name` varchar(20) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `order_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`itemID`, `item_name`, `quantity`, `order_id`) VALUES
(367, 'Kottu ', 1, 2147483647),
(368, 'Kottu ', 1, 2147483647),
(369, 'Kottu ', 1, 63),
(370, 'Kottu ', 2, 223480),
(372, 'Kottu ', 1, 739670),
(373, 'Kottu ', 1, 328308),
(374, 'Kottu ', 1, 240648),
(375, 'Kottu ', 1, 277840),
(376, 'Kottu ', 1, 582055),
(377, 'Kottu ', 1, 9259);

-- --------------------------------------------------------

--
-- Table structure for table `payfee`
--

CREATE TABLE `payfee` (
  `payid` int(11) NOT NULL,
  `Bid` int(11) NOT NULL,
  `BOid` int(11) NOT NULL,
  `year` int(4) DEFAULT NULL,
  `month` int(12) NOT NULL,
  `amount` int(11) NOT NULL,
  `paidDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `cash_card` varchar(11) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payfee`
--

INSERT INTO `payfee` (`payid`, `Bid`, `BOid`, `year`, `month`, `amount`, `paidDateTime`, `cash_card`) VALUES
(122, 106, 7, 2023, 1, 3000, '2023-01-25 20:09:18', 'cash'),
(123, 106, 7, 0, 0, 3000, '2023-01-25 20:09:23', 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `FSid` int(11) NOT NULL,
  `F_post_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `breakfast` int(11) NOT NULL,
  `lunch` int(11) NOT NULL,
  `dinner` int(11) NOT NULL,
  `is_pay` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `FSid`, `F_post_id`, `product_name`, `image`, `price`, `breakfast`, `lunch`, `dinner`, `is_pay`) VALUES
(47, 24, 35, 'Kottu', '../resource/Images/uploaded_foodpost/pasta.jpg', 380, 0, 1, 1, 1),
(48, 24, 36, 'Kottu', '../resource/Images/uploaded_foodpost/burger.jpg', 380, 0, 1, 0, 1),
(49, 24, 37, 'Kottu', '../resource/Images/uploaded_foodpost/pasta.jpg', 380, 0, 1, 0, 1),
(50, 24, 38, 'Kottu', '../resource/Images/uploaded_foodpost/pasta.jpg', 490, 0, 1, 0, 1),
(54, 24, 40, '', '../img/pastry.jpg', 560, 1, 1, 1, 1),
(55, 24, 40, 'Kottu', '../resource/Images/uploaded_foodpost/product1.png', 690, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `rateId` int(10) NOT NULL,
  `ratingpostid` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `uName` varchar(100) NOT NULL,
  `uReview` int(10) NOT NULL,
  `uMsg` varchar(100) NOT NULL,
  `dReview` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`rateId`, `ratingpostid`, `email`, `uName`, `uReview`, `uMsg`, `dReview`) VALUES
(9, 36, 'lakshanamal100@gmail.com', 'Amal', 5, 'Superb', '2023-01-29 06:27:48'),
(10, 36, 'amal.l@x-venture.io', 'Kalana', 5, 'Good', '2023-01-29 06:27:03');

-- --------------------------------------------------------

--
-- Table structure for table `ratefood`
--

CREATE TABLE `ratefood` (
  `ratefId` int(10) NOT NULL,
  `ratingfpostid` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ufName` varchar(255) NOT NULL,
  `ufReview` int(10) NOT NULL,
  `ufMsg` varchar(255) NOT NULL,
  `dfReview` datetime(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(100) NOT NULL,
  `student_email` varchar(40) NOT NULL,
  `BOid` int(100) NOT NULL,
  `B_post_id` int(100) NOT NULL,
  `message` varchar(100) NOT NULL,
  `isAccept` tinyint(1) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `student_email`, `BOid`, `B_post_id`, `message`, `isAccept`, `date`) VALUES
(140, '2018cs092@stu.ucsc.cmb.ac.lk', 7, 36, 'I need one', 3, '2023-01-19 17:42:01'),
(141, 'amal.l@x-venture.io', 7, 36, 'I want this boarding ', 3, '2023-01-25 19:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `set_notification`
--

CREATE TABLE `set_notification` (
  `set_id` int(11) NOT NULL,
  `from_BOid` int(11) NOT NULL,
  `to_Bid` int(11) NOT NULL,
  `setdate` datetime NOT NULL DEFAULT current_timestamp(),
  `deadline_date` date NOT NULL,
  `occurance` int(11) NOT NULL,
  `massage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `set_notification`
--
DELIMITER $$
CREATE TRIGGER `new_payrent_remainder` AFTER INSERT ON `set_notification` FOR EACH ROW BEGIN
INSERT INTO notifications(type_number,from_level,from_id,to_level,to_id,massageHeader,massage)
VALUES(3,'boardings_owner',NEW.from_BOid,'boarder' ,NEW.to_Bid,'Rent Payment Remainder',NEW.massage);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Reg_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'student',
  `NIC` varchar(15) NOT NULL,
  `address` varchar(250) NOT NULL,
  `user_accepted` int(2) NOT NULL,
  `profileimage` text NOT NULL DEFAULT '../resource/Images/a.jpg',
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Reg_id`, `email`, `first_name`, `last_name`, `password`, `token`, `level`, `NIC`, `address`, `user_accepted`, `profileimage`, `reg_date`) VALUES
(51, '2018cs092@stu.ucsc.cmb.ac.lk', 'Kavi', 'devindi', '32b3a23f849bb81092bf605d17a6dff99a1da535', '03a9c2128f9870a0c78d125b238a3b58a21230c68f92249c23ad0452e485648bac92f1dc2604beb07cbc3e9c1df46debe52d', 'student', '971741546V', '', 1, '../resource/Images/uploaded_profile_Image/1 (2).jpg', '2023-01-18'),
(52, 'amal.l@x-venture.io', 'Amal', 'Lakshan', '32b3a23f849bb81092bf605d17a6dff99a1da535', 'bebb4842e59a35e8e54916614be14246ccd611e5f7ff53e11e6c759588698105506d2b0da5f6e664b111608cccdbd88fbf44', 'student', '971741556v', 'kumarakanda', 3, '../resource/Images/uploaded_profile_Image/IMG_E2238.JPG', '2023-01-25'),
(53, 'nassimabderahmanfront@gmail.com', 'nassim', 'Lakshan', '32b3a23f849bb81092bf605d17a6dff99a1da535', 'c7d8eb18434ee232e7e844c1ef66818c366c05f810d376a57de241bdf9bc15de7b46ec83bb1c30d6b5208ac82d71c1db0752', 'student', '971741566v', '', 0, '../resource/Images/a.jpg', '2023-01-26'),
(54, 'salmaoujanafront@gmail.com', 'KalanaR', 'Ravi', '32b3a23f849bb81092bf605d17a6dff99a1da535', 'f94c5604ba083e7db060d29ffa2c46a9f641769c1366e6ff7db5c8e45a22dfc476962f97b414607f85c97bdfe459b9441e8e', 'student', '971741566v', '', 1, '../resource/Images/a.jpg', '2023-01-26');

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `regDate` BEFORE INSERT ON `student` FOR EACH ROW SET NEW.reg_date = NOW()
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `boarder`
--
ALTER TABLE `boarder`
  ADD PRIMARY KEY (`Bid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `boarderparent`
--
ALTER TABLE `boarderparent`
  ADD PRIMARY KEY (`Pid`),
  ADD KEY `Bid` (`Bid`);

--
-- Indexes for table `boardings_owner`
--
ALTER TABLE `boardings_owner`
  ADD PRIMARY KEY (`BOid`);

--
-- Indexes for table `boarding_post`
--
ALTER TABLE `boarding_post`
  ADD PRIMARY KEY (`B_post_id`),
  ADD KEY `BOid` (`BOid`);
ALTER TABLE `boarding_post` ADD FULLTEXT KEY `category` (`category`,`girlsBoys`,`image`,`house_num`,`lane`,`city`,`district`,`description`);

--
-- Indexes for table `complain_boarding`
--
ALTER TABLE `complain_boarding`
  ADD KEY `Bid` (`Bid`),
  ADD KEY `B_post_id` (`B_post_id`);

--
-- Indexes for table `complain_food`
--
ALTER TABLE `complain_food`
  ADD KEY `a_id` (`a_id`),
  ADD KEY `Bid` (`Bid`),
  ADD KEY `F_post_id` (`F_post_id`);

--
-- Indexes for table `confirm_rent`
--
ALTER TABLE `confirm_rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `Bid` (`Bid`),
  ADD KEY `BOid` (`BOid`),
  ADD KEY `B_post_id` (`B_post_id`),
  ADD KEY `confirm_rent_ibfk_4` (`request_id`);

--
-- Indexes for table `confirm_rent_document`
--
ALTER TABLE `confirm_rent_document`
  ADD KEY `Bid` (`Bid`),
  ADD KEY `BOid` (`BOid`),
  ADD KEY `B_post_id` (`B_post_id`);

--
-- Indexes for table `food_post`
--
ALTER TABLE `food_post`
  ADD PRIMARY KEY (`F_post_id`) USING BTREE,
  ADD KEY `FSid` (`FSid`);

--
-- Indexes for table `food_request`
--
ALTER TABLE `food_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `F-post-id` (`F_post_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `food_supplier`
--
ALTER TABLE `food_supplier`
  ADD PRIMARY KEY (`FSid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`imgid`),
  ADD KEY `Test` (`boid`),
  ADD KEY `Test1` (`postid`);

--
-- Indexes for table `livesupport`
--
ALTER TABLE `livesupport`
  ADD PRIMARY KEY (`cId`);

--
-- Indexes for table `longterm`
--
ALTER TABLE `longterm`
  ADD PRIMARY KEY (`ltID`),
  ADD KEY `fk1` (`order_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`noID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notify_id`);

--
-- Indexes for table `ordereditems`
--
ALTER TABLE `ordereditems`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orderfoodboarder`
--
ALTER TABLE `orderfoodboarder`
  ADD KEY `Bid` (`Bid`),
  ADD KEY `FSid` (`FSid`),
  ADD KEY `F_post_id` (`F_post_id`);

--
-- Indexes for table `orderfoodboardingowner`
--
ALTER TABLE `orderfoodboardingowner`
  ADD KEY `BOid` (`BOid`),
  ADD KEY `FSid` (`FSid`),
  ADD KEY `F_post_id` (`F_post_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `fk2` (`order_id`);

--
-- Indexes for table `payfee`
--
ALTER TABLE `payfee`
  ADD PRIMARY KEY (`payid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FSid` (`FSid`),
  ADD KEY `F-post-id` (`F_post_id`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`rateId`);

--
-- Indexes for table `ratefood`
--
ALTER TABLE `ratefood`
  ADD PRIMARY KEY (`ratefId`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_boid` (`BOid`),
  ADD KEY `fk_b_post_id` (`B_post_id`);

--
-- Indexes for table `set_notification`
--
ALTER TABLE `set_notification`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `from_BOid` (`from_BOid`),
  ADD KEY `to_Bid` (`to_Bid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Reg_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `a_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `boarder`
--
ALTER TABLE `boarder`
  MODIFY `Bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `boarderparent`
--
ALTER TABLE `boarderparent`
  MODIFY `Pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `boardings_owner`
--
ALTER TABLE `boardings_owner`
  MODIFY `BOid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `boarding_post`
--
ALTER TABLE `boarding_post`
  MODIFY `B_post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `confirm_rent`
--
ALTER TABLE `confirm_rent`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `food_post`
--
ALTER TABLE `food_post`
  MODIFY `F_post_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `food_request`
--
ALTER TABLE `food_request`
  MODIFY `request_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=839;

--
-- AUTO_INCREMENT for table `food_supplier`
--
ALTER TABLE `food_supplier`
  MODIFY `FSid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `imgid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `livesupport`
--
ALTER TABLE `livesupport`
  MODIFY `cId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `longterm`
--
ALTER TABLE `longterm`
  MODIFY `ltID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=592;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `noID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notify_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `payfee`
--
ALTER TABLE `payfee`
  MODIFY `payid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `rateId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ratefood`
--
ALTER TABLE `ratefood`
  MODIFY `ratefId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `set_notification`
--
ALTER TABLE `set_notification`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boarderparent`
--
ALTER TABLE `boarderparent`
  ADD CONSTRAINT `fk_bparent` FOREIGN KEY (`Bid`) REFERENCES `boarder` (`Bid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `boarding_post`
--
ALTER TABLE `boarding_post`
  ADD CONSTRAINT `boarding_post_ibfk_1` FOREIGN KEY (`BOid`) REFERENCES `boardings_owner` (`BOid`);

--
-- Constraints for table `complain_boarding`
--
ALTER TABLE `complain_boarding`
  ADD CONSTRAINT `complain_boarding_ibfk_1` FOREIGN KEY (`Bid`) REFERENCES `boarder` (`Bid`),
  ADD CONSTRAINT `complain_boarding_ibfk_2` FOREIGN KEY (`B_post_id`) REFERENCES `boarding_post` (`B_post_id`);

--
-- Constraints for table `complain_food`
--
ALTER TABLE `complain_food`
  ADD CONSTRAINT `complain_food_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `administrator` (`a_id`),
  ADD CONSTRAINT `complain_food_ibfk_2` FOREIGN KEY (`Bid`) REFERENCES `boarder` (`Bid`),
  ADD CONSTRAINT `complain_food_ibfk_3` FOREIGN KEY (`F_post_id`) REFERENCES `food_post` (`F_post_id`);

--
-- Constraints for table `confirm_rent`
--
ALTER TABLE `confirm_rent`
  ADD CONSTRAINT `confirm_rent_ibfk_1` FOREIGN KEY (`Bid`) REFERENCES `boarder` (`Bid`),
  ADD CONSTRAINT `confirm_rent_ibfk_2` FOREIGN KEY (`BOid`) REFERENCES `boardings_owner` (`BOid`),
  ADD CONSTRAINT `confirm_rent_ibfk_3` FOREIGN KEY (`B_post_id`) REFERENCES `boarding_post` (`B_post_id`),
  ADD CONSTRAINT `confirm_rent_ibfk_4` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`);

--
-- Constraints for table `confirm_rent_document`
--
ALTER TABLE `confirm_rent_document`
  ADD CONSTRAINT `confirm_rent_document_ibfk_1` FOREIGN KEY (`Bid`) REFERENCES `boarder` (`Bid`),
  ADD CONSTRAINT `confirm_rent_document_ibfk_2` FOREIGN KEY (`BOid`) REFERENCES `boardings_owner` (`BOid`),
  ADD CONSTRAINT `confirm_rent_document_ibfk_3` FOREIGN KEY (`B_post_id`) REFERENCES `boarding_post` (`B_post_id`);

--
-- Constraints for table `food_post`
--
ALTER TABLE `food_post`
  ADD CONSTRAINT `food_post_ibfk_1` FOREIGN KEY (`FSid`) REFERENCES `food_supplier` (`FSid`);

--
-- Constraints for table `food_request`
--
ALTER TABLE `food_request`
  ADD CONSTRAINT `food_request_ibfk_1` FOREIGN KEY (`F_post_id`) REFERENCES `food_post` (`F_post_id`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `Test` FOREIGN KEY (`boid`) REFERENCES `boardings_owner` (`BOid`),
  ADD CONSTRAINT `Test1` FOREIGN KEY (`postid`) REFERENCES `boarding_post` (`B_post_id`);

--
-- Constraints for table `ordereditems`
--
ALTER TABLE `ordereditems`
  ADD CONSTRAINT `ordereditems_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `orderfoodboarder`
--
ALTER TABLE `orderfoodboarder`
  ADD CONSTRAINT `orderfoodboarder_ibfk_1` FOREIGN KEY (`Bid`) REFERENCES `boarder` (`Bid`),
  ADD CONSTRAINT `orderfoodboarder_ibfk_2` FOREIGN KEY (`FSid`) REFERENCES `food_supplier` (`FSid`),
  ADD CONSTRAINT `orderfoodboarder_ibfk_3` FOREIGN KEY (`F_post_id`) REFERENCES `food_post` (`F_post_id`);

--
-- Constraints for table `orderfoodboardingowner`
--
ALTER TABLE `orderfoodboardingowner`
  ADD CONSTRAINT `orderfoodboardingowner_ibfk_1` FOREIGN KEY (`BOid`) REFERENCES `boardings_owner` (`BOid`),
  ADD CONSTRAINT `orderfoodboardingowner_ibfk_2` FOREIGN KEY (`FSid`) REFERENCES `food_supplier` (`FSid`),
  ADD CONSTRAINT `orderfoodboardingowner_ibfk_3` FOREIGN KEY (`F_post_id`) REFERENCES `food_post` (`F_post_id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`order_id`) REFERENCES `food_request` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`F_post_id`) REFERENCES `food_post` (`F_post_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk_b_post_id` FOREIGN KEY (`B_post_id`) REFERENCES `boarding_post` (`B_post_id`),
  ADD CONSTRAINT `fk_boid` FOREIGN KEY (`BOid`) REFERENCES `boardings_owner` (`BOid`);

--
-- Constraints for table `set_notification`
--
ALTER TABLE `set_notification`
  ADD CONSTRAINT `set_notification_ibfk_1` FOREIGN KEY (`from_BOid`) REFERENCES `boardings_owner` (`BOid`),
  ADD CONSTRAINT `set_notification_ibfk_2` FOREIGN KEY (`to_Bid`) REFERENCES `boarder` (`Bid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
