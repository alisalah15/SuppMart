-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 02:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schools`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `is_status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `email`, `password`, `is_status`) VALUES
(1, '1', '1', '1', '1', 1),
(2, 'admin', 'admin', 'admin@admin.com', '1', 1),
(3, 'david', 'davidmonir7', 'david@gmail.com', 'password', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categ`
--

CREATE TABLE `categ` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categ`
--

INSERT INTO `categ` (`id`, `user_id`, `name`, `img`, `created_at`) VALUES
(36, 3, 'Pens and pencils', '648af132051c47.64166982.jpg', '2023-06-15 11:08:34'),
(37, 3, 'notebooks and books', '648af147873188.60918365.jpg', '2023-06-15 11:08:55'),
(38, 3, 'senitzers', '648af159d62b21.50254792.jpg', '2023-06-15 11:09:13'),
(39, 3, 'others', '648af1670b8fb9.65611696.jpg', '2023-06-15 11:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `total_amount` double NOT NULL,
  `address` varchar(250) NOT NULL,
  `total_products` int(50) NOT NULL,
  `total_quantity` int(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_messages`
--

CREATE TABLE `orders_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `admin_reply` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_reply_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `school_id` int(11) NOT NULL,
  `quality_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `img`, `price`, `school_id`, `quality_id`, `created_at`) VALUES
(1, 'grade 1', '648d86ba2ae0f5.37031968.jpg', 5350, 6, 1, '2023-06-17 10:11:06'),
(2, 'grade 1', '648d86da676ff9.35962323.jpg', 4500, 6, 2, '2023-06-17 10:11:38'),
(3, 'grade 1', '648d86e9e23330.60765875.jpg', 3520, 6, 3, '2023-06-17 10:11:53'),
(4, 'grade 2 high', '648da12bda8320.00164604.png', 4280, 6, 1, '2023-06-17 12:03:55'),
(5, 'grade 2 mediam', '648da13e3fb7d5.15827249.png', 3935, 6, 2, '2023-06-17 12:04:14'),
(6, 'grade 2 low', '648da1518da282.93618576.png', 3350, 6, 3, '2023-06-17 12:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `package_details`
--

CREATE TABLE `package_details` (
  `id` int(11) NOT NULL,
  `packge_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `price` int(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `package_details`
--

INSERT INTO `package_details` (`id`, `packge_id`, `product_id`, `price`, `quantity`, `user_id`, `created_at`) VALUES
(2, 1, 4, 15, 1, 3, '2023-06-17 11:01:25'),
(3, 1, 7, 55, 1, 3, '2023-06-17 11:02:07'),
(4, 1, 13, 80, 1, 3, '2023-06-17 11:09:58'),
(5, 1, 24, 400, 2, 3, '2023-06-17 11:19:13'),
(6, 1, 25, 450, 2, 3, '2023-06-17 11:19:14'),
(7, 1, 28, 550, 2, 3, '2023-06-17 11:21:46'),
(8, 1, 29, 250, 1, 3, '2023-06-17 11:22:43'),
(9, 1, 31, 100, 1, 3, '2023-06-17 11:24:34'),
(10, 1, 34, 80, 2, 3, '2023-06-17 11:26:59'),
(11, 1, 37, 120, 3, 3, '2023-06-17 11:28:33'),
(12, 1, 40, 120, 3, 3, '2023-06-17 11:30:40'),
(13, 1, 43, 100, 2, 3, '2023-06-17 11:32:18'),
(14, 1, 46, 130, 1, 3, '2023-06-17 11:34:16'),
(15, 1, 10, 90, 1, 3, '2023-06-17 11:43:43'),
(16, 1, 1, 180, 4, 3, '2023-06-17 11:45:51'),
(17, 2, 2, 130, 4, 3, '2023-06-17 11:47:55'),
(18, 2, 5, 10, 1, 3, '2023-06-17 11:47:55'),
(19, 2, 8, 40, 1, 3, '2023-06-17 11:47:55'),
(20, 2, 11, 70, 1, 3, '2023-06-17 11:47:55'),
(21, 2, 14, 80, 1, 3, '2023-06-17 11:47:55'),
(22, 2, 22, 350, 2, 3, '2023-06-17 11:48:45'),
(23, 2, 23, 400, 2, 3, '2023-06-17 11:48:45'),
(24, 2, 29, 250, 1, 3, '2023-06-17 11:52:33'),
(25, 2, 33, 80, 1, 3, '2023-06-17 11:53:01'),
(26, 2, 35, 60, 2, 3, '2023-06-17 11:53:21'),
(27, 2, 38, 100, 3, 3, '2023-06-17 11:53:43'),
(28, 2, 41, 100, 3, 3, '2023-06-17 11:54:08'),
(29, 2, 44, 80, 3, 3, '2023-06-17 11:54:35'),
(30, 2, 47, 90, 1, 3, '2023-06-17 11:54:59'),
(31, 2, 26, 450, 2, 3, '2023-06-17 11:56:21'),
(32, 3, 3, 100, 4, 3, '2023-06-17 11:57:15'),
(33, 3, 6, 5, 1, 3, '2023-06-17 11:57:15'),
(34, 3, 9, 25, 1, 3, '2023-06-17 11:57:15'),
(35, 3, 12, 50, 1, 3, '2023-06-17 11:57:15'),
(36, 3, 16, 80, 1, 3, '2023-06-17 11:57:15'),
(37, 3, 20, 300, 2, 3, '2023-06-17 11:58:10'),
(38, 3, 21, 400, 2, 3, '2023-06-17 11:58:12'),
(39, 3, 27, 400, 1, 3, '2023-06-17 11:58:26'),
(40, 3, 29, 250, 1, 3, '2023-06-17 11:59:09'),
(41, 3, 94, 100, 1, 3, '2023-06-17 11:59:10'),
(42, 3, 39, 80, 3, 3, '2023-06-17 11:59:59'),
(43, 3, 32, 60, 1, 3, '2023-06-17 12:00:10'),
(44, 3, 36, 40, 2, 3, '2023-06-17 12:00:29'),
(45, 3, 42, 70, 3, 3, '2023-06-17 12:00:51'),
(46, 3, 45, 50, 3, 3, '2023-06-17 12:01:17'),
(47, 3, 48, 70, 1, 3, '2023-06-17 12:01:42'),
(48, 4, 75, 50, 12, 3, '2023-06-17 12:06:02'),
(49, 4, 7, 55, 4, 3, '2023-06-17 12:06:44'),
(50, 4, 50, 200, 2, 3, '2023-06-17 12:09:17'),
(51, 4, 111, 200, 1, 3, '2023-06-17 12:09:17'),
(52, 4, 53, 70, 1, 3, '2023-06-17 12:10:11'),
(53, 4, 13, 80, 1, 3, '2023-06-17 12:10:53'),
(54, 4, 14, 80, 1, 3, '2023-06-17 12:10:54'),
(55, 4, 16, 80, 1, 3, '2023-06-17 12:10:54'),
(56, 4, 17, 80, 1, 3, '2023-06-17 12:10:54'),
(57, 4, 57, 500, 2, 3, '2023-06-17 12:11:26'),
(58, 4, 37, 120, 1, 3, '2023-06-17 12:13:13'),
(59, 4, 28, 550, 1, 3, '2023-06-17 12:13:32'),
(60, 4, 31, 100, 1, 3, '2023-06-17 12:13:46'),
(61, 4, 58, 110, 1, 3, '2023-06-17 12:14:26'),
(62, 4, 40, 120, 3, 3, '2023-06-17 12:14:44'),
(63, 4, 43, 100, 1, 3, '2023-06-17 12:15:23'),
(64, 4, 46, 130, 1, 3, '2023-06-17 12:16:24'),
(65, 5, 76, 35, 12, 3, '2023-06-17 12:19:08'),
(66, 5, 8, 40, 4, 3, '2023-06-17 12:19:36'),
(67, 5, 51, 150, 1, 3, '2023-06-17 12:20:20'),
(68, 5, 109, 150, 2, 3, '2023-06-17 12:20:20'),
(69, 5, 54, 60, 1, 3, '2023-06-17 12:20:44'),
(70, 5, 13, 80, 1, 3, '2023-06-17 12:21:02'),
(71, 5, 14, 80, 1, 3, '2023-06-17 12:21:25'),
(72, 5, 16, 80, 1, 3, '2023-06-17 12:21:26'),
(73, 5, 17, 80, 1, 3, '2023-06-17 12:21:26'),
(74, 5, 26, 450, 2, 3, '2023-06-17 12:22:03'),
(75, 5, 55, 450, 2, 3, '2023-06-17 12:22:03'),
(76, 5, 33, 80, 1, 3, '2023-06-17 12:22:41'),
(77, 5, 38, 100, 1, 3, '2023-06-17 12:23:06'),
(78, 5, 59, 75, 1, 3, '2023-06-17 12:23:27'),
(79, 5, 41, 100, 3, 3, '2023-06-17 12:23:46'),
(80, 5, 44, 80, 1, 3, '2023-06-17 12:24:03'),
(81, 5, 47, 90, 1, 3, '2023-06-17 12:24:22'),
(82, 6, 77, 30, 12, 3, '2023-06-17 12:24:53'),
(83, 6, 9, 25, 4, 3, '2023-06-17 12:25:27'),
(84, 6, 13, 80, 1, 3, '2023-06-17 12:25:27'),
(85, 6, 14, 80, 1, 3, '2023-06-17 12:25:27'),
(86, 6, 16, 80, 1, 3, '2023-06-17 12:25:27'),
(87, 6, 17, 80, 1, 3, '2023-06-17 12:25:27'),
(88, 6, 49, 100, 1, 3, '2023-06-17 12:25:48'),
(89, 6, 113, 100, 2, 3, '2023-06-17 12:25:48'),
(90, 6, 52, 50, 1, 3, '2023-06-17 12:26:54'),
(91, 6, 56, 450, 2, 3, '2023-06-17 12:28:02'),
(92, 6, 27, 400, 2, 3, '2023-06-17 12:28:12'),
(93, 6, 32, 60, 1, 3, '2023-06-17 12:28:31'),
(94, 6, 39, 80, 1, 3, '2023-06-17 12:28:57'),
(95, 6, 42, 70, 3, 3, '2023-06-17 12:29:09'),
(96, 6, 60, 50, 1, 3, '2023-06-17 12:29:20'),
(97, 6, 45, 50, 1, 3, '2023-06-17 12:29:45'),
(98, 6, 48, 70, 1, 3, '2023-06-17 12:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `categ_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(25) NOT NULL,
  `IMG` varchar(500) NOT NULL,
  `quantity` int(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `categ_id`, `name`, `price`, `IMG`, `quantity`, `created_at`) VALUES
(1, 3, 36, 'Boxes of 12 pencils (Ticonderoga Brand) (Pre sharpened)', 180, '648af4ed7b6252.44924303.jpg', 100, '2023-06-15 11:24:29'),
(2, 3, 36, 'Boxes of 12 pencils (faber casteel) (Pre sharpened)', 130, '648af527384f72.10034319.jpg', 100, '2023-06-15 11:25:27'),
(3, 3, 36, 'Boxes of 12 pencils (STAEDTLER) (Pre sharpened)', 100, '648af54a347382.23517761.jpeg', 100, '2023-06-15 11:26:02'),
(4, 3, 36, 'Red Click pen roto', 15, '648af5981d8f05.27994025.jpg', 100, '2023-06-15 11:27:20'),
(5, 3, 36, 'red click pen senator', 10, '648af5c1536f95.26909583.jpg', 100, '2023-06-15 11:28:01'),
(6, 3, 36, 'Red Click pens ezee', 5, '648af5e6b416a5.61484672.png', 100, '2023-06-15 11:28:38'),
(7, 3, 39, 'Elmer’s 4 oz. Glue ', 55, '648af6132429e5.33506866.jpg', 100, '2023-06-15 11:29:23'),
(8, 3, 39, 'Deli Stick up 4 oz.Glue', 40, '648af642d89f61.50596241.jpg', 100, '2023-06-15 11:30:10'),
(9, 3, 39, 'zjd oz. Glue', 25, '648af668d21c34.84044647.jpeg', 100, '2023-06-15 11:30:48'),
(10, 3, 39, 'White Glue Stick (deli)', 90, '648af6c807dc15.15706455.jpg', 100, '2023-06-15 11:32:24'),
(11, 3, 39, 'White Glue Stick (elmer\'s)', 70, '648af6ebbba532.85071882.jpg', 100, '2023-06-15 11:32:59'),
(12, 3, 39, 'White Glue Stick (fevi)', 50, '648af7093f0e74.82158657.jpg', 100, '2023-06-15 11:33:29'),
(13, 3, 39, 'Plastic Pocket Folders with brads blue', 80, '648afc0faa7f63.00932243.jpg', 100, '2023-06-15 11:54:55'),
(14, 3, 39, 'Plastic Pocket Folders with brads red', 80, '648afc28a078f8.13261731.jpg', 100, '2023-06-15 11:55:20'),
(15, 3, 39, 'Plastic Pocket Folders with brads purple', 80, '648afc580bd115.80868175.jpg', 100, '2023-06-15 11:56:08'),
(16, 3, 39, 'Plastic Pocket Folders with brads yellow', 80, '648afc7b7978f0.03940578.jpg', 100, '2023-06-15 11:56:43'),
(17, 3, 39, 'Plastic Pocket Folders with brads orange', 80, '648afccc728122.86148879.jpg', 100, '2023-06-15 11:58:04'),
(18, 3, 39, 'Plastic Pocket Folders with brads black', 80, '648afd0598e305.86471906.jpg', 100, '2023-06-15 11:59:01'),
(19, 3, 39, 'Plastic Pocket Folder', 50, '648afd2f997199.80767610.jpg', 100, '2023-06-15 11:59:43'),
(20, 3, 36, 'faber castell colors 8 packs', 300, '648b048849d1b4.23168316.jpg', 100, '2023-06-15 12:31:04'),
(21, 3, 36, 'faber castell colors 16 packs', 400, '648b04e5c26e12.26873020.jpg', 100, '2023-06-15 12:32:37'),
(22, 3, 36, 'Crayola colors 8 packs', 350, '648b051824b259.87448268.jpg', 100, '2023-06-15 12:33:28'),
(23, 3, 36, 'Crayola colors 16 packs', 400, '648b053b7a1288.01113853.png', 100, '2023-06-15 12:34:03'),
(24, 3, 36, 'deli colors 8 packs', 400, '648b0576c604f9.03899270.png', 100, '2023-06-15 12:35:02'),
(25, 3, 36, 'deli colors 16 packs', 450, '648b059bc8b7d9.08010052.jpg', 100, '2023-06-15 12:35:39'),
(26, 3, 36, 'Crayola Washable Markers (10 count)', 450, '648b05d61b14e2.35163856.jpg', 100, '2023-06-15 12:36:38'),
(27, 3, 36, 'faber castell Washable Markers (10 count)', 400, '648b05f9bfd680.84129665.jpg', 100, '2023-06-15 12:37:13'),
(28, 3, 36, 'Deli Washable Markers (10 count)', 550, '648b061b50cdc3.90665163.jpg', 100, '2023-06-15 12:37:47'),
(29, 3, 36, 'Expo Low Odor Dry Erase Markers Fine Tip Black (4 count)', 250, '648b081ed5baa4.20282280.jpg', 100, '2023-06-15 12:46:22'),
(30, 3, 36, 'Expo Low Odor Dry Erase Markers Fine Tip Black (12 count)', 500, '648b084e18ec59.87004190.jpg', 100, '2023-06-15 12:47:10'),
(31, 3, 39, 'Fiskars Scissors 5 in. with BLUNT edge', 100, '648b0875e5cb98.39454497.jpg', 100, '2023-06-15 12:47:49'),
(32, 3, 39, 'Faber castell Scissors 5 in. with BLUNT edge', 60, '648b089f61ccc9.40696289.jpg', 100, '2023-06-15 12:48:31'),
(33, 3, 39, 'Deli Scissors 5 in. with BLUNT edge', 80, '648b08f61e3860.83441384.jpg', 100, '2023-06-15 12:49:58'),
(34, 3, 39, 'Papermate -Pink Pearl Large Erasers', 80, '648b091a651dd1.78141569.jpg', 100, '2023-06-15 12:50:34'),
(35, 3, 39, 'Faber castell Large Erasers', 60, '648b093bd297f4.80165346.jpg', 100, '2023-06-15 12:51:07'),
(36, 3, 39, 'Jumbo Large Erasers', 40, '648b096217a667.00151208.jpg', 100, '2023-06-15 12:51:46'),
(37, 3, 38, 'Containers of Baby Wipes  100wipes', 120, '648b099c822fd3.80599730.jpg', 100, '2023-06-15 12:52:44'),
(38, 3, 38, 'Containers of Baby Wipes  80 wipes', 100, '648b09dd313070.00936759.jpg', 100, '2023-06-15 12:53:49'),
(39, 3, 38, 'Containers of Baby Wipes 64 wipes', 80, '648b09f5c8da52.53914892.jpg', 100, '2023-06-15 12:54:13'),
(40, 3, 38, 'LARGE Boxes of kleenex 160 pieces', 120, '648b0a39e23297.66697661.jpg', 100, '2023-06-15 12:55:21'),
(41, 3, 38, 'LARGE Boxes of kleenex fine 160 pieces', 100, '648b0a5e706f54.40517995.jpg', 100, '2023-06-15 12:55:58'),
(42, 3, 38, 'LARGE  Boxes of Kleenex carmen 160 pieces', 70, '648b0a7f405a87.93548749.jpg', 100, '2023-06-15 12:56:31'),
(43, 3, 38, 'Large Rolls of Paper Towels (Bounty brand)', 100, '648b91aa6f6911.34524160.jpg', 100, '2023-06-15 22:33:14'),
(44, 3, 38, 'Large Rolls of Paper Towels (scott brand)', 80, '648b9267337a51.91213201.jpg', 100, '2023-06-15 22:36:23'),
(45, 3, 38, 'Large Rolls of Paper Towels (sparkle brand)', 50, '648b928e9151b2.94669510.png', 100, '2023-06-15 22:37:02'),
(46, 3, 39, 'Box of Band-Aid Bandages 50 pieces', 130, '648b934182d2c5.19725671.jpg', 100, '2023-06-15 22:40:01'),
(47, 3, 39, 'Box of Bandages 50 pieces curad', 90, '648b9417b13894.24961291.jpg', 100, '2023-06-15 22:43:35'),
(48, 3, 39, 'Box of Bandages 50 pieces leader', 70, '648b94381c9833.78440533.jpg', 100, '2023-06-15 22:44:08'),
(49, 3, 37, 'Spiral Notebooks (70 pages) scholar green', 100, '648b94dd7c2169.58752489.jpg', 100, '2023-06-15 22:46:53'),
(50, 3, 37, 'Spiral Notebooks (70 pages) mead red', 200, '648b957bb13fa8.70684005.jpg', 100, '2023-06-15 22:49:31'),
(51, 3, 37, 'Spiral Notebooks (70 pages) pen+ gear green', 150, '648b95b100c3b2.62441096.jpeg', 100, '2023-06-15 22:50:25'),
(52, 3, 37, 'Black Marble Composition 200 scholar', 50, '648b976aee6418.65152918.jpg', 100, '2023-06-15 22:57:47'),
(53, 3, 37, 'Black Composition 200 pages mead', 70, '648b978b4ee0b4.62221714.jpg', 100, '2023-06-15 22:58:19'),
(54, 3, 37, 'Black Marble Composition 200 pages pen+gear', 60, '648b97b51c4883.27451902.jpeg', 100, '2023-06-15 22:59:01'),
(55, 3, 36, 'Crayola colors 24 pack', 450, '648b98b5984fd4.73377657.jpg', 100, '2023-06-15 23:03:17'),
(56, 3, 36, 'faber castell colors 24 pack', 450, '648b98e26afbc0.36870207.jpg', 100, '2023-06-15 23:04:02'),
(57, 3, 36, 'deli colors 24 packs', 500, '648b9940e35593.36021438.png', 100, '2023-06-15 23:05:36'),
(58, 3, 38, '8 oz. Hand Sanitizer puranic', 110, '648b998f997cc8.21401399.jpg', 100, '2023-06-15 23:06:55'),
(59, 3, 38, '8 oz. Hand Sanitizer germ', 75, '648b99b5823bb9.46960054.jpg', 100, '2023-06-15 23:07:33'),
(60, 3, 38, '8 oz. Hand Sanitizer purell', 50, '648b99d0ea5859.58895297.jpg', 100, '2023-06-15 23:08:00'),
(61, 3, 36, '10-Pack of Red pens – No click style faber castell', 100, '648b9a2a1525e4.22777600.jpg', 100, '2023-06-15 23:09:30'),
(62, 3, 36, '10-Pack of Red pens – No click style retactable', 70, '648b9a51bec811.41421513.jpg', 100, '2023-06-15 23:10:09'),
(63, 3, 36, '10-Pack of Red pens – No click style tre mate', 50, '648b9a803eebb4.97753466.jpg', 100, '2023-06-15 23:10:56'),
(64, 3, 37, 'Packs of Wide Ruled Loose Leaf 100 sheet', 150, '648b9b0c6b5962.46497748.jpg', 100, '2023-06-15 23:13:16'),
(65, 3, 37, 'Packs of Wide Ruled Loose Leaf 100 mead', 100, '648b9b3f2f9ad7.35224442.jpg', 100, '2023-06-15 23:14:07'),
(66, 3, 36, 'Packs of Wide Ruled Loose Leaf 100 Three Leaf', 70, '648b9b622501a0.56904675.jpeg', 100, '2023-06-15 23:14:42'),
(67, 3, 36, 'Yellow highlighters deli', 18, '648b9be7d4da24.60468965.png', 100, '2023-06-15 23:16:55'),
(68, 3, 36, 'Yellow highlighters faber castell', 12, '648b9c0056a9a3.45527347.jpg', 100, '2023-06-15 23:17:20'),
(69, 3, 36, 'Yellow highlighters prima', 10, '648b9c1e5de077.62949405.jpg', 100, '2023-06-15 23:17:50'),
(70, 3, 37, 'Avery Binder three ring White', 400, '648b9c9fc28c97.82191988.jpg', 100, '2023-06-15 23:19:59'),
(71, 3, 37, 'wilson jones binder three ring white', 350, '648d792661b278.29361842.jpg', 100, '2023-06-17 09:13:10'),
(72, 3, 37, 'Premier binder three ring white', 300, '648d7954095905.67221933.jpg', 100, '2023-06-17 09:13:56'),
(73, 3, 37, 'Blue Avery Binder three ring with pockets', 400, '648d798645fbb6.81804821.jpg', 100, '2023-06-17 09:14:46'),
(74, 3, 37, 'Blue Designders Binder three ring with pockets', 350, '648d79a4c96222.89348918.jpg', 100, '2023-06-17 09:15:16'),
(75, 3, 36, 'Pencils (Ticonderoga Brand – Pre-Sharpened', 50, '648d79fe5218c9.00277973.jpg', 100, '2023-06-17 09:16:46'),
(76, 3, 36, 'Pencil (Faber castell Brand – Pre-Sharpened', 35, '648d7a1eac64c2.49024655.jpg', 100, '2023-06-17 09:17:18'),
(77, 3, 36, 'Pencils (STAEDTLER Brand) – Pre-Sharpened', 30, '648d7a353a50e8.49352395.jpg', 100, '2023-06-17 09:17:41'),
(78, 3, 37, 'Black Marble Journals', 400, '648d7a5431efd7.35362678.jpg', 100, '2023-06-17 09:18:12'),
(79, 3, 37, 'Black Marble (Mead) Journals ', 375, '648d7a95dbd3b6.16445493.jpg', 100, '2023-06-17 09:19:17'),
(80, 3, 37, 'Black Marble (Pen + Gear) Journals', 350, '648d7ab13187a0.59781083.jpeg', 100, '2023-06-17 09:19:45'),
(81, 3, 39, 'Scotch 3M brand Large Glue Sticks', 100, '648d7ae58abba6.86137821.jpg', 100, '2023-06-17 09:20:37'),
(82, 3, 39, 'Reynolds 3M brand Large Glue Sticks', 80, '648d7b027288b3.67704054.jpg', 100, '2023-06-17 09:21:06'),
(83, 3, 39, 'UHU 3M brand Large Glue Sticks.jpg', 70, '648d7b395c2744.02683009.jpg', 100, '2023-06-17 09:22:01'),
(84, 3, 37, 'Pack of index cards (ruled) 100-pack BAZIC', 250, '648d7b93472787.08022861.jpg', 100, '2023-06-17 09:23:31'),
(85, 3, 37, 'Pack of index cards (ruled) 100-pack mead', 300, '648d7bd28e09e9.82630449.jpg', 100, '2023-06-17 09:24:34'),
(86, 3, 37, 'Pack of index cards (ruled) 100-pack oxford', 200, '648d7bf04cc3a3.22777861.jpg', 100, '2023-06-17 09:25:04'),
(87, 3, 36, 'pink highlighters deli', 100, '648d7c28a82ab1.22701113.png', 100, '2023-06-17 09:26:00'),
(88, 3, 36, 'Pink highlighters faber castell', 80, '648d7c43581370.61706329.jpg', 100, '2023-06-17 09:26:27'),
(89, 3, 36, 'Pink highlighters prima', 70, '648d7c5a025c46.36763476.jpg', 100, '2023-06-17 09:26:50'),
(90, 3, 36, 'Green highlighters deli', 100, '648d7c70eee9a4.93227789.png', 100, '2023-06-17 09:27:12'),
(91, 3, 36, 'green highlighters faber castell', 80, '648d7c880e5f85.26908750.jpg', 100, '2023-06-17 09:27:36'),
(92, 3, 36, 'green highlighters prima', 70, '648d7c9ab1a207.07806763.jpg', 100, '2023-06-17 09:27:54'),
(93, 3, 36, 'Black Sharpie – Fine Tip', 150, '648d7cbc1f13a2.62986374.jpg', 100, '2023-06-17 09:28:28'),
(94, 3, 36, 'Black EXPO – Fine Tip', 100, '648d7ccf0281c4.74921313.jpg', 100, '2023-06-17 09:28:47'),
(95, 3, 36, 'Black Faber-Castell – Fine Tip', 80, '648d7ce527e5a8.47052276.jpg', 100, '2023-06-17 09:29:09'),
(96, 3, 38, 'Box of Quart Sized Ziploc Bags ', 300, '648d7d5467a275.52156000.jpg', 100, '2023-06-17 09:31:00'),
(97, 3, 38, 'Box of Quart Sized Ziploc (GLAD) Bags ', 280, '648d7d846b7d81.67105503.jpeg', 100, '2023-06-17 09:31:48'),
(98, 3, 38, 'Box of Quart Sized Ziploc (Hefty) Bags ', 250, '648d7da0a334c0.51481485.jpg', 100, '2023-06-17 09:32:16'),
(99, 3, 37, 'Spiral Notebooks (100 pages) mead red', 300, '648d7e55618c16.32805309.jpg', 100, '2023-06-17 09:35:17'),
(100, 3, 37, 'Spiral Notebooks (100 pages) mead blue', 300, '648d7e8cd407a6.14262932.jpg', 100, '2023-06-17 09:36:12'),
(101, 3, 37, 'Spiral Notebooks (100 pages) mead green', 300, '648d7ea4840237.45990882.jpg', 100, '2023-06-17 09:36:36'),
(102, 3, 37, 'Spiral Notebooks (100 pages) pen+ gear blue', 250, '648d7ec130f2b3.00480035.jpeg', 100, '2023-06-17 09:37:05'),
(103, 3, 37, 'Spiral Notebooks (100 pages) pen+ gear green', 250, '648d7ed95d9a30.92326680.jpg', 100, '2023-06-17 09:37:29'),
(104, 3, 37, 'Spiral Notebooks (100 pages) pen+ gear red', 250, '648d7ef5dfbf29.70431926.jpeg', 100, '2023-06-17 09:37:57'),
(105, 3, 37, 'Spiral Notebooks (100 pages) scholar blue', 200, '648d7f0ca26db0.52998301.jpg', 100, '2023-06-17 09:38:20'),
(106, 3, 37, 'Spiral Notebooks (100 pages) scholar green', 200, '648d7f287ca3b1.19938218.jpg', 100, '2023-06-17 09:38:48'),
(107, 3, 37, 'Spiral Notebooks (100 pages) scholar red', 200, '648d7f3e3fdaf5.86172484.jpg', 100, '2023-06-17 09:39:10'),
(108, 3, 37, 'Spiral Notebooks (70 pages) pen+ gear blue', 150, '648d7f7ca209a2.25989070.jpg', 100, '2023-06-17 09:40:12'),
(109, 3, 37, 'Spiral Notebooks (70 pages) pen+ gear red', 150, '648d7f9d815883.97450442.png', 100, '2023-06-17 09:40:45'),
(110, 3, 37, 'Spiral Notebooks (70 pages) mead blue', 200, '648d7fb52f8fd3.23677405.jpg', 100, '2023-06-17 09:41:09'),
(111, 3, 37, 'Spiral Notebooks (70 pages) mead green', 200, '648d7fd04816d4.81950846.jpeg', 100, '2023-06-17 09:41:36'),
(112, 3, 37, 'Spiral Notebooks (70 pages) scholar blue', 100, '648d7fe5deb713.29416619.jpg', 100, '2023-06-17 09:41:57'),
(113, 3, 37, 'Spiral Notebooks (70 pages) scholar red', 100, '648d8001789748.40001698.jpg', 100, '2023-06-17 09:42:25'),
(114, 3, 37, '10 pocket or larger Nylon expandable folder mead', 600, '648d80365fb0b2.50107857.jpg', 100, '2023-06-17 09:43:18'),
(115, 3, 37, '10 pocket or larger Nylon expandable folder pen+ gear', 550, '648d806063a711.97754421.jpg', 100, '2023-06-17 09:44:00'),
(116, 3, 36, '10 pocket or larger Nylon expandable folder (any color) avery ', 500, '648d831a183f56.90745729.jpg', 100, '2023-06-17 09:55:38'),
(117, 3, 36, '24 Pack erasable colored pencils deli', 600, '648d83411f6610.05066269.jpg', 100, '2023-06-17 09:56:17'),
(118, 3, 36, '24 Pack erasable colored pencils faber castell', 500, '648d8360646a17.87185897.jpg', 100, '2023-06-17 09:56:48'),
(119, 3, 36, '24 Pack erasable colored pencils crayola', 550, '648d8382310d68.19641262.jpg', 100, '2023-06-17 09:57:22'),
(120, 3, 39, 'Fiskar’s 7 in. or larger Scissors (sharp edge)', 90, '648d83bae21798.18991211.jpg', 100, '2023-06-17 09:58:18'),
(121, 3, 39, 'faber castell 7 in. or larger Scissors (sharp edge)', 70, '648d83db41b7a8.29404040.jpg', 100, '2023-06-17 09:58:51'),
(122, 3, 39, 'deli 7 in. or larger Scissors (sharp edge)', 100, '648d83f298a5b7.13957427.jpg', 100, '2023-06-17 09:59:14'),
(123, 3, 36, 'Sharpie Fine Point Markers', 150, '648d8459297fb4.88253362.jpg', 100, '2023-06-17 10:00:57'),
(124, 3, 36, 'Deli Fine Point Markers', 200, '648d8459297fb4.88253362.jpg', 100, '2023-06-17 10:01:32'),
(125, 3, 36, 'Faber castell Fine Point Markers', 100, '648d84934ab543.77373434.jpg', 100, '2023-06-17 10:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `quality`
--

CREATE TABLE `quality` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `quality`
--

INSERT INTO `quality` (`id`, `name`) VALUES
(1, 'High quality'),
(2, 'Medium quality'),
(3, 'Low quality');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `descrption` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `descrption`, `img`, `created_at`) VALUES
(6, 'st.fatima', 'St Fatima School is a school in Nasr City, Cairo, Egypt. Established in 1982, the school serves students in preschool through secondary stages of education. It\'s mostly known for its IGCSE division', '648d857e0c7e85.38939688.png', '2023-06-17 10:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `is_status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categ`
--
ALTER TABLE `categ`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_messages`
--
ALTER TABLE `orders_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_details`
--
ALTER TABLE `package_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categ_id` (`categ_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `quality`
--
ALTER TABLE `quality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categ`
--
ALTER TABLE `categ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders_messages`
--
ALTER TABLE `orders_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_details`
--
ALTER TABLE `package_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `quality`
--
ALTER TABLE `quality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categ_id`) REFERENCES `categ` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
