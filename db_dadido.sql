-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2022 at 03:19 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

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

CREATE TABLE `tbl_collection` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL DEFAULT 0,
  `collection_name` varchar(255) NOT NULL,
  `image_banner_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_collection`
--

INSERT INTO `tbl_collection` (`id`, `id_profile`, `collection_name`, `image_banner_url`, `description`) VALUES
(1, 1, 'Daniel Collection', 'https://lh3.googleusercontent.com/-114aDz8vMbSCOkiv7Id2fnMDTe-eq8iHfurg2xh6d3IaoBb8ylfVizLWZq2wmQze-Ii3mpNKrqrP48i4Q1yf9pzYwHYpuxjKHiLCA=h600', 'Ini adalah collection saya yang dimana banyak isinya'),
(2, 2, 'Budi Collection', 'https://lh3.googleusercontent.com/RPT6v17Bh3mO_kYFwmrJSnOC_hstEgKoIpEnkp84bqp99I5W1nCvE6hOUnKYt7ZMBQCuI0N8WjyyQNYtzTb6Wcp__YYSr7lPGgASfw=h600', 'Collection saya berisi sangat banyak data gambar bagus'),
(3, 3, 'Ardos Collection', 'https://lh3.googleusercontent.com/48oVuDyfe_xhs24BC2TTVcaYCX7rrU5mpuQLyTgRDbKHj2PtzKZsQ5qC3xTH4ar34wwAXxEKH8uUDPAGffbg7boeGYqX6op5vBDcbA=h600', 'This is Ardos Collection, I have so Many Pictures in here');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favorit`
--

CREATE TABLE `tbl_favorit` (
  `id` int(11) NOT NULL,
  `id_collection` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_profile_followers` int(11) NOT NULL,
  `id_profile_following` int(11) DEFAULT NULL,
  `status_favorit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

CREATE TABLE `tbl_item` (
  `id` int(11) NOT NULL,
  `id_collection` int(11) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sell_status` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`id`, `id_collection`, `id_profile`, `file_name`, `image_url`, `description`, `sell_status`, `price`) VALUES
(1, 1, 1, 'Rambut Api', 'https://i.pinimg.com/736x/b9/ae/1c/b9ae1c820c0162c268611941084dd614.jpg', 'Dibuat Oleh daniel', 1, 12),
(2, 1, 1, 'Headset Brow', 'https://i.pinimg.com/736x/9d/22/c6/9d22c6839b684d30075ab1ae321ef058.jpg', 'Dibuat Oleh Daniel', 1, 3),
(3, 2, 2, 'Golden Swords', 'https://media.raritysniper.com/azuki/3309-600.webp?cacheId=2', 'Dibuat Oleh Budi', 1, 5),
(4, 2, 2, 'GoldenCat', 'https://lh3.googleusercontent.com/QA8lHQmySHMAL8K9aXetIAlZT0WBtVG7tPQR7u8uWeeFnBqsCAe_c5hok0MGRKpAqTRnzYTHiLzVcwDOvP6Q4tEfXzVZJLtvdmVzvz8=w1400-k', 'Dibuat Oleh Budi', 1, 8),
(5, 3, 3, 'Black Man', 'https://lh3.googleusercontent.com/vxPRqRqF5XXXiKcY2WmySxPph8n8DIT4-9lUcGPOOf5FDxzODslqcSy5kr5gt8gEI6c20fDmWTMi9CH86GlPo5wuTMbiuFmCPV2q=w600', 'Ardo', 1, 5),
(6, 3, 3, 'Jacket Man', 'https://lh3.googleusercontent.com/Uagikn-Lhn2W44V54_5UcsnMqrBESw6TkHV3PF_HiDXZZdryannrULVLEsrSeqLZxlSJZ3aA2E7hq3O62Ta4237jEQ=w600', 'Ardo', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

CREATE TABLE `tbl_profile` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_collection` int(11) NOT NULL,
  `id_wallet` int(11) NOT NULL,
  `profile_url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_profile`
--

INSERT INTO `tbl_profile` (`id`, `id_user`, `id_collection`, `id_wallet`, `profile_url`) VALUES
(1, 1, 1, 1, 'https://lh3.googleusercontent.com/bTxADvEugM_Ot0hMbLxIAfYbDWX6QAaXLWKeKUIDGcz62VRvUd9gRLJqg3r4RIODCHEFuJMVj4qPgB-9sN3aCnfTng2euVM621Syiw=s130'),
(2, 2, 2, 2, 'https://lh3.googleusercontent.com/VyxHil3DawP25ZoSk7HkSJslwUDLFO3_LC9rj-w0jYUKxkcGy-VLVGk4n-I02t8CwJRt4Bk7mEwhGAgVCsjQyZfzi30RCQoPkXqY=s130'),
(3, 3, 3, 3, 'https://lh3.googleusercontent.com/BdxvLseXcfl57BiuQcQYdJ64v-aI8din7WPk0Pgo3qQFhAUH-B6i-dCqqc_mCkRIzULmwzwecnohLhrcH8A9mpWIZqA7ygc52Sr81hE=s130');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `id` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_profile_buyer` int(11) NOT NULL,
  `id_profile_seller` int(11) NOT NULL,
  `event` varchar(50) DEFAULT 'minted',
  `transaction_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`id`, `id_item`, `id_profile_buyer`, `id_profile_seller`, `event`, `transaction_time`) VALUES
(1, 1, 1, 0, 'minted', '2022-04-15 18:52:17'),
(2, 2, 1, 0, 'minted', '2022-04-15 18:52:56'),
(3, 3, 2, 0, 'minted', '2022-04-15 19:05:55'),
(4, 4, 2, 0, 'minted', '2022-04-15 19:06:06'),
(5, 5, 3, 0, 'minted', '2022-04-19 15:01:44'),
(6, 6, 3, 0, 'minted', '2022-04-19 15:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `home_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `fullname`, `email`, `password`, `home_address`) VALUES
(1, 'dece441', 'Daniel Christian', 'daniel@email.com', 'daniel123', NULL),
(2, 'Budi123', 'Budi Ariyansa', 'Budi@email.com', 'Budi123', NULL),
(3, 'Ardo1', 'leonardo', 'ardo@gmail.com', 'ardo123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallet`
--

CREATE TABLE `tbl_wallet` (
  `id` int(11) NOT NULL,
  `total_fund` float NOT NULL,
  `wallet_type` varchar(255) NOT NULL,
  `contract_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_wallet`
--

INSERT INTO `tbl_wallet` (`id`, `total_fund`, `wallet_type`, `contract_address`) VALUES
(1, 10, 'dadido', 'kDSJhfkjsdhflksajhdkajlsdhflkjahsdfjkhsd'),
(2, 30, 'dadido', 'kDSJhfkjsdhflksajhdkajlsdhflkjahsdfjkhsd'),
(3, 60, 'dadido', 'jdkhfklkdjshlkjdshflkjhsdlfkhsdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_collection`
--
ALTER TABLE `tbl_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_favorit`
--
ALTER TABLE `tbl_favorit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_wallet`
--
ALTER TABLE `tbl_wallet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_collection`
--
ALTER TABLE `tbl_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_favorit`
--
ALTER TABLE `tbl_favorit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_item`
--
ALTER TABLE `tbl_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_wallet`
--
ALTER TABLE `tbl_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
