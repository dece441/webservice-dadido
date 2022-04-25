-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 25, 2022 at 08:01 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dadido`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_collection`
--

DROP TABLE IF EXISTS `tbl_collection`;
CREATE TABLE IF NOT EXISTS `tbl_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_profile` int(11) NOT NULL DEFAULT 0,
  `collection_name` varchar(255) NOT NULL,
  `image_banner_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_collection`
--

INSERT INTO `tbl_collection` (`id`, `id_profile`, `collection_name`, `image_banner_url`, `description`) VALUES
(1, 1, 'Daniel Collection', '/Image/dece441/bannerbear.png', 'Ini adalah collection saya yang dimana banyak isinya'),
(2, 2, 'Budi Collection', '/Image/kresm10/citybanner.png', 'Collection saya berisi sangat banyak data gambar bagus'),
(3, 3, 'Ardos Collection', '/Image/ardo123/people.png', 'This is Ardos Collection, I have so Many Pictures in here');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favorit`
--

DROP TABLE IF EXISTS `tbl_favorit`;
CREATE TABLE IF NOT EXISTS `tbl_favorit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_collection` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_profile_followers` int(11) NOT NULL,
  `id_profile_following` int(11) DEFAULT NULL,
  `status_favorit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_favorit`
--

INSERT INTO `tbl_favorit` (`id`, `id_collection`, `id_item`, `id_profile_followers`, `id_profile_following`, `status_favorit`) VALUES
(1, 1, 1, 1, 2, '1'),
(2, 1, 2, 1, 2, '1'),
(3, 2, 3, 2, 1, '1'),
(4, 2, 4, 2, 1, '1'),
(5, 3, 5, 3, 2, '1'),
(6, 3, 6, 3, 2, '1'),
(7, 1, 1, 1, 3, '1'),
(8, 1, 2, 1, 3, '1'),
(9, 3, 5, 3, 1, '1'),
(10, 3, 6, 3, 1, '1'),
(11, 2, 3, 2, 3, '1'),
(12, 2, 4, 2, 3, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
CREATE TABLE IF NOT EXISTS `tbl_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_collection` int(11) NOT NULL,
  `id_profile_creator` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sell_status` int(11) NOT NULL,
  `price` float NOT NULL,
  `id_profile_own` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`id`, `id_collection`, `id_profile_creator`, `file_name`, `image_url`, `description`, `sell_status`, `price`, `id_profile_own`) VALUES
(1, 1, 1, 'Rambut Api', '/Image/dece441/fireman.jpg', 'Dibuat Oleh daniel', 1, 12, 1),
(2, 1, 1, 'Headset Brow', '/Image/dece441/headset.jpg', 'Dibuat Oleh Daniel', 1, 3, 1),
(3, 2, 2, 'Golden Swords', '/Image/kresm10/gold_sword.png', 'Dibuat Oleh Budi', 1, 5, 2),
(4, 2, 2, 'GoldenCat', '/Image/kresm10/goldman.png', 'Dibuat Oleh Budi', 1, 8, 2),
(5, 3, 3, 'Black Man', '/Image/ardo123/blackman.png', 'Dibuat Oleh Ardo', 1, 5, 3),
(6, 3, 3, 'Jacket Man', '/Image/ardo123/coolman.png', 'Dibuat Oleh Ardo', 1, 8, 3),
(7, 1, 1, 'alam', '/Image/dece441/alam3.jpg', 'alam indah', 1, 5, 1),
(8, 1, 1, 'pantai', '/Image/dece441/beach.jpg', 'pantai indah', 1, 8, 1),
(9, 2, 2, 'jajsurur', '/Image/kresm10/crop_image.jpg', 'sjjdjrrjke', 1, 20, 2),
(10, 2, 2, 'akakirjrj', '/Image/kresm10/go-explore-949112.jpg', 'aindirkwnw', 1, 23, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

DROP TABLE IF EXISTS `tbl_profile`;
CREATE TABLE IF NOT EXISTS `tbl_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_collection` int(11) NOT NULL,
  `id_wallet` int(11) NOT NULL,
  `profile_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_profile`
--

INSERT INTO `tbl_profile` (`id`, `id_user`, `id_collection`, `id_wallet`, `profile_url`) VALUES
(1, 1, 1, 1, '/Image/dece441/bear.png'),
(2, 2, 2, 2, '/Image/kresm10/night.png'),
(3, 3, 3, 3, '/Image/ardo123/punk.png'),
(4, 4, 0, 4, 'https://www.kindpng.com/picc/m/21-214439_free-high-quality-person-icon-default-profile-picture.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

DROP TABLE IF EXISTS `tbl_transaction`;
CREATE TABLE IF NOT EXISTS `tbl_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `id_profile_buyer` int(11) NOT NULL,
  `id_profile_seller` int(11) NOT NULL,
  `event` varchar(50) DEFAULT 'minted',
  `transaction_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`id`, `id_item`, `id_profile_buyer`, `id_profile_seller`, `event`, `transaction_time`) VALUES
(1, 1, 1, 0, 'minted', '2022-04-15 18:52:17'),
(2, 2, 1, 0, 'minted', '2022-04-15 18:52:56'),
(3, 3, 2, 0, 'minted', '2022-04-15 19:05:55'),
(4, 4, 2, 0, 'minted', '2022-04-15 19:06:06'),
(5, 5, 3, 0, 'minted', '2022-04-19 15:01:44'),
(6, 6, 3, 0, 'minted', '2022-04-19 15:01:44'),
(7, 7, 1, 0, 'minted', '2022-04-25 03:34:37'),
(8, 8, 1, 0, 'minted', '2022-04-25 03:47:42'),
(9, 9, 2, 0, 'minted', '2022-04-25 07:27:17'),
(10, 10, 2, 0, 'minted', '2022-04-25 07:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `fullname`, `email`, `password`, `home_address`) VALUES
(1, 'dece441', 'Daniel Christian', 'daniel@email.com', 'daniel123', 'Jl. Serpong Tanggerang'),
(2, 'kresm10', 'Budi Ariyansa', 'Budi@email.com', 'budi123', ''),
(3, 'ardo13', 'leonardo', 'ardo@gmail.com', 'ardo123', NULL),
(4, 'juju', 'juju atap', 'juju@email.com', 'juju', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallet`
--

DROP TABLE IF EXISTS `tbl_wallet`;
CREATE TABLE IF NOT EXISTS `tbl_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_fund` float NOT NULL,
  `wallet_type` varchar(255) NOT NULL,
  `contract_address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_wallet`
--

INSERT INTO `tbl_wallet` (`id`, `total_fund`, `wallet_type`, `contract_address`) VALUES
(1, 134.875, 'dadido', 'kDSJhfkjsdhflksajhdkajlsdhflkjahsdfjkhsd'),
(2, 30.0125, 'dadido', 'kDSJhfkjsdhflksajhdkajlsdhflkjahsdfjkhsd'),
(3, 60, 'dadido', 'jdkhfklkdjshlkjdshflkjhsdlfkhsdf'),
(4, 0, 'dadido', 'kDSJhfkjsdhflksajhdkajlsdhflkjahsdfjkhsd');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
