-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 10.4.22-MariaDB - mariadb.org binary distribution
-- OS Server:                    Win64
-- HeidiSQL Versi:               11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk db_dadido
CREATE DATABASE IF NOT EXISTS `db_dadido` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_dadido`;

-- membuang struktur untuk table db_dadido.tbl_collection
CREATE TABLE IF NOT EXISTS `tbl_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_profile` int(11) NOT NULL DEFAULT 0,
  `collection_name` varchar(255) NOT NULL,
  `image_banner_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel db_dadido.tbl_collection: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_collection` DISABLE KEYS */;
REPLACE INTO `tbl_collection` (`id`, `id_profile`, `collection_name`, `image_banner_url`, `description`) VALUES
	(1, 1, 'Daniel Collection', 'https://lh3.googleusercontent.com/-114aDz8vMbSCOkiv7Id2fnMDTe-eq8iHfurg2xh6d3IaoBb8ylfVizLWZq2wmQze-Ii3mpNKrqrP48i4Q1yf9pzYwHYpuxjKHiLCA=h600', 'Ini adalah collection saya yang dimana banyak isinya'),
	(2, 2, 'Budi Collection', 'https://lh3.googleusercontent.com/RPT6v17Bh3mO_kYFwmrJSnOC_hstEgKoIpEnkp84bqp99I5W1nCvE6hOUnKYt7ZMBQCuI0N8WjyyQNYtzTb6Wcp__YYSr7lPGgASfw=h600', 'Collection saya berisi sangat banyak data gambar bagus');
/*!40000 ALTER TABLE `tbl_collection` ENABLE KEYS */;

-- membuang struktur untuk table db_dadido.tbl_favorit
CREATE TABLE IF NOT EXISTS `tbl_favorit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_collection` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_profile_followers` int(11) NOT NULL,
  `id_profile_following` int(11) DEFAULT NULL,
  `status_favorit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel db_dadido.tbl_favorit: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_favorit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_favorit` ENABLE KEYS */;

-- membuang struktur untuk table db_dadido.tbl_item
CREATE TABLE IF NOT EXISTS `tbl_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_collection` int(11) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sell_status` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel db_dadido.tbl_item: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_item` DISABLE KEYS */;
REPLACE INTO `tbl_item` (`id`, `id_collection`, `id_profile`, `file_name`, `image_url`, `description`, `sell_status`, `price`) VALUES
	(1, 1, 1, 'Gambar Indah', 'https://i.pinimg.com/736x/b9/ae/1c/b9ae1c820c0162c268611941084dd614.jpg', 'Dibuat Oleh daniel', 1, 12),
	(2, 1, 1, 'Gambar Daniel', 'https://i.pinimg.com/736x/9d/22/c6/9d22c6839b684d30075ab1ae321ef058.jpg', 'Dibuat Oleh Daniel', 1, 3),
	(3, 2, 2, 'Gambar Budi', 'https://media.raritysniper.com/azuki/3309-600.webp?cacheId=2', 'Dibuat Oleh Budi', 1, 5),
	(4, 2, 2, 'Gambar Mobil', 'https://lh3.googleusercontent.com/QA8lHQmySHMAL8K9aXetIAlZT0WBtVG7tPQR7u8uWeeFnBqsCAe_c5hok0MGRKpAqTRnzYTHiLzVcwDOvP6Q4tEfXzVZJLtvdmVzvz8=w1400-k', 'Dibuat Oleh Budi', 1, 8);
/*!40000 ALTER TABLE `tbl_item` ENABLE KEYS */;

-- membuang struktur untuk table db_dadido.tbl_profile
CREATE TABLE IF NOT EXISTS `tbl_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_collection` int(11) NOT NULL,
  `id_wallet` int(11) NOT NULL,
  `profile_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel db_dadido.tbl_profile: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_profile` DISABLE KEYS */;
REPLACE INTO `tbl_profile` (`id`, `id_user`, `id_collection`, `id_wallet`, `profile_url`) VALUES
	(1, 1, 1, 1, 'https://lh3.googleusercontent.com/bTxADvEugM_Ot0hMbLxIAfYbDWX6QAaXLWKeKUIDGcz62VRvUd9gRLJqg3r4RIODCHEFuJMVj4qPgB-9sN3aCnfTng2euVM621Syiw=s130'),
	(2, 2, 2, 2, 'https://lh3.googleusercontent.com/VyxHil3DawP25ZoSk7HkSJslwUDLFO3_LC9rj-w0jYUKxkcGy-VLVGk4n-I02t8CwJRt4Bk7mEwhGAgVCsjQyZfzi30RCQoPkXqY=s130');
/*!40000 ALTER TABLE `tbl_profile` ENABLE KEYS */;

-- membuang struktur untuk table db_dadido.tbl_transaction
CREATE TABLE IF NOT EXISTS `tbl_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `id_profile_buyer` int(11) NOT NULL,
  `id_profile_seller` int(11) NOT NULL,
  `event` varchar(50) DEFAULT 'mounted',
  `transaction_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel db_dadido.tbl_transaction: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_transaction` DISABLE KEYS */;
REPLACE INTO `tbl_transaction` (`id`, `id_item`, `id_profile_buyer`, `id_profile_seller`, `event`, `transaction_time`) VALUES
	(1, 1, 1, 0, 'mounted', '2022-04-15 18:52:17'),
	(2, 2, 1, 0, 'mounted', '2022-04-15 18:52:56'),
	(3, 3, 2, 0, 'mounted', '2022-04-15 19:05:55'),
	(4, 4, 2, 0, 'mounted', '2022-04-15 19:06:06');
/*!40000 ALTER TABLE `tbl_transaction` ENABLE KEYS */;

-- membuang struktur untuk table db_dadido.tbl_user
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel db_dadido.tbl_user: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
REPLACE INTO `tbl_user` (`id`, `username`, `fullname`, `email`, `password`) VALUES
	(1, 'dece441', 'Daniel Christian', 'daniel@email.com', 'daniel123'),
	(2, 'Budi123', 'Budi Ariyansa', 'Budi@email.com', 'Budi123'),
	(3, 'Ardo1', 'leonardo', 'ardo@gmail.com', 'ardo123');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;

-- membuang struktur untuk table db_dadido.tbl_wallet
CREATE TABLE IF NOT EXISTS `tbl_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_fund` float NOT NULL,
  `wallet_type` varchar(255) NOT NULL,
  `contract_address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel db_dadido.tbl_wallet: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_wallet` DISABLE KEYS */;
REPLACE INTO `tbl_wallet` (`id`, `total_fund`, `wallet_type`, `contract_address`) VALUES
	(1, 10, 'dadido', 'kDSJhfkjsdhflksajhdkajlsdhflkjahsdfjkhsd'),
	(2, 30, 'dadido', 'kDSJhfkjsdhflksajhdkajlsdhflkjahsdfjkhsd');
/*!40000 ALTER TABLE `tbl_wallet` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
