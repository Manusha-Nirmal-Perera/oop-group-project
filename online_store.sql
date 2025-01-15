-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2025 at 12:06 AM
-- Server version: 8.0.37
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminactivity`
--

CREATE TABLE `adminactivity` (
  `activity_id` int NOT NULL,
  `action_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(2000) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adminactivity`
--

INSERT INTO `adminactivity` (`activity_id`, `action_type`, `description`, `datetime`, `status`) VALUES
(1, 'Adding new product', 'Product name: new pr Category: kitchen-appliances Price: 222.2', '2024-09-24 05:01:46', 'Successful'),
(2, 'Removing existing product', 'Product name: aagag Category: kitchen-appliances Price: 11.11', '2024-09-24 05:02:19', 'Failed'),
(3, 'Removing existing product', 'Product name: new pr Category: kitchen-appliances Price: 222.2', '2024-09-24 05:02:36', 'Successful'),
(4, 'Adding new product', 'Product name: aaa Category: kitchen-appliances Price: 33.99', '2024-09-24 10:54:45', 'Successful'),
(5, 'Cancelled Order', 'Order ID: #36 User ID: #16 Product name: Wallpaper Quntity: 1 Placed on: 2024-09-19 22:38:59 Amount : 5490.99', '2024-09-24 14:57:05', 'Successful'),
(6, 'Order Cancelled', 'Order ID: #37 User ID: #16 Product name: Abstract Wallpaper Quntity: 1 Placed on: 2024-09-19 22:38:59 Amount : 7990.9', '2024-09-24 15:13:43', 'Successful'),
(7, 'Removing existing product', 'Product name: aaa Category: kitchen-appliances Price: 33.99', '2024-09-24 16:05:38', 'Successful'),
(8, 'Order Delivered', 'Order ID: #37 User ID: #16 Product name: Abstract Wallpaper Quntity: 1 Placed on on: 2024-09-19 22:38:59Amount : 7990.9', '2024-09-24 17:05:10', 'Successful'),
(9, 'User info updated', 'Updated user info of user #0', '2024-09-24 17:49:21', 'Successful'),
(10, 'User info updated', 'Updated user info of user #0', '2024-09-24 17:50:24', 'Successful'),
(11, 'User info updated', 'Updated user info of user #1', '2024-09-24 17:53:18', 'Successful'),
(12, 'User info updated', 'Updated user info of user #0', '2024-09-24 17:53:23', 'Successful'),
(13, 'User info updated', 'Updated user info of user #0', '2024-09-24 17:54:25', 'Successful'),
(14, 'User info updated', 'Updated user info of user #1', '2024-09-24 17:57:02', 'Successful'),
(15, 'User info updated', 'Updated user info of user #3', '2024-09-24 17:57:20', 'Successful'),
(16, 'User info updated', 'Updated user info of user #3', '2024-09-24 17:57:31', 'Successful'),
(17, 'Adding new product', 'Product name: test product Category: tables Price: 22.22', '2024-09-24 18:58:21', 'Successful'),
(18, 'Adding new product', 'Product name: test 2 Category: beds Price: 22.22', '2024-09-24 19:14:35', 'Successful'),
(19, 'Order Cancelled', 'Order ID: #58 User ID: #16 Product name: Bunk Bed Quntity: 1 Placed on: 2024-09-24 10:00:16 Amount : 44990.99', '2024-09-25 21:28:56', 'Successful'),
(20, 'Order Cancelled', 'Order ID: #37 User ID: #16 Product name: Abstract Wallpaper Quntity: 1 Placed on: 2024-09-19 22:38:59 Amount : 7990.9', '2024-09-25 21:29:00', 'Successful'),
(21, 'Order Cancelled', 'Order ID: #38 User ID: #16 Product name: King Size Bed Quntity: 2 Placed on: 2024-09-20 10:19:04 Amount : 187981.98', '2024-09-25 21:29:04', 'Successful'),
(22, 'Order Cancelled', 'Order ID: #41 User ID: #16 Product name: Bunk Bed Quntity: 1 Placed on: 2024-09-21 15:29:28 Amount : 44990.99', '2024-09-25 21:29:06', 'Successful'),
(23, 'Order Cancelled', 'Order ID: #42 User ID: #16 Product name: Floral Wallpaper Quntity: 1 Placed on: 2024-09-22 02:29:08 Amount : 2390.99', '2024-09-25 21:29:07', 'Successful'),
(24, 'Order Cancelled', 'Order ID: #43 User ID: #16 Product name: Twin Bed Quntity: 1 Placed on: 2024-09-22 08:46:33 Amount : 64900.99', '2024-09-25 21:29:09', 'Successful'),
(25, 'Order Cancelled', 'Order ID: #45 User ID: #16 Product name: Queen size Bed Quntity: 2 Placed on: 2024-09-22 08:54:53 Amount : 169981.98', '2024-09-25 21:29:10', 'Successful'),
(26, 'Order Cancelled', 'Order ID: #46 User ID: #16 Product name: Bunk Bed Quntity: 1 Placed on: 2024-09-22 08:54:59 Amount : 44990.99', '2024-09-25 21:29:11', 'Successful'),
(27, 'Order Cancelled', 'Order ID: #48 User ID: #16 Product name: Twin Bed Quntity: 5 Placed on: 2024-09-22 12:01:39 Amount : 324504.95', '2024-09-25 21:29:12', 'Successful'),
(28, 'Order Cancelled', 'Order ID: #49 User ID: #16 Product name: Queen size Bed Quntity: 1 Placed on: 2024-09-22 12:01:39 Amount : 84990.99', '2024-09-25 21:29:14', 'Successful'),
(29, 'Removing existing product', 'Product name: test 2 Category: beds Price: 22.22', '2024-09-27 04:19:50', 'Successful'),
(30, 'Removing existing product', 'Product name: test product Category: tables Price: 22.22', '2024-09-27 04:19:56', 'Successful'),
(31, 'Adding new product', 'Product name: aagag Category: kitchen-appliances Price: 33.33', '2024-09-28 10:08:18', 'Successful'),
(32, 'Removing existing product', 'Product name: aagag Category: kitchen-appliances Price: 33.33', '2024-09-28 10:08:57', 'Successful'),
(33, 'Order Delivered', 'Order ID: #74 User ID: #23 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-09-28 10:06:58 Amount : 44990.99', '2024-10-01 18:43:19', 'Successful'),
(34, 'Order Delivered', 'Order ID: #74 User ID: #23 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-09-28 10:06:58 Amount : 44990.99', '2024-10-05 18:15:58', 'Successful'),
(35, 'Order Delivered', 'Order ID: #74 User ID: #23 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-09-28 10:06:58 Amount : 44990.99', '2024-10-05 18:16:26', 'Successful'),
(36, 'Order Delivered', 'Order ID: #75 User ID: #23 Product name: Twin Bed Quntity: 1 Placed on on: 2024-09-28 10:07:01 Amount : 64900.99', '2024-10-05 18:18:00', 'Successful'),
(37, 'Order Delivered', 'Order ID: #74 User ID: #23 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-09-28 10:06:58 Amount : 44990.99', '2024-10-05 18:21:22', 'Successful'),
(38, 'Order Delivered', 'Order ID: #75 User ID: #23 Product name: Twin Bed Quntity: 1 Placed on on: 2024-09-28 10:07:01 Amount : 64900.99', '2024-10-08 09:11:13', 'Successful'),
(39, 'Adding new product', 'Product name: new pr Category: kitchen-appliances Price: 22.22', '2024-10-09 22:46:54', 'Successful'),
(40, 'Adding new product', 'Product name: aagag Category: kitchen-appliances Price: 11.0', '2024-10-09 22:56:06', 'Successful'),
(41, 'Adding new product', 'Product name: aaa Category: beds Price: 33.0', '2024-10-09 22:57:59', 'Successful'),
(42, 'Removing existing product', 'Product name: new pr Category: kitchen-appliances Price: 22.22', '2024-10-09 22:58:17', 'Successful'),
(43, 'Removing existing product', 'Product name: aaa Category: beds Price: 33.0', '2024-10-09 22:58:23', 'Successful'),
(44, 'Removing existing product', 'Product name: aagag Category: kitchen-appliances Price: 11.0', '2024-10-09 22:58:29', 'Successful'),
(45, 'Adding new product', 'Product name: FINAL Category: tables Price: 22.0', '2024-10-09 22:59:10', 'Successful'),
(46, 'Adding new product', 'Product name: new pr Category: kitchen-appliances Price: 11.0', '2024-10-09 23:23:50', 'Successful'),
(47, 'Removing existing product', 'Product name: new pr Category: kitchen-appliances Price: 11.0', '2024-10-09 23:24:01', 'Successful'),
(48, 'Removing existing product', 'Product name: FINAL Category: tables Price: 22.0', '2024-10-09 23:24:09', 'Successful'),
(49, 'Order Delivered', 'Order ID: #74 User ID: #23 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-09-28 10:06:58 Amount : 44990.99', '2024-10-10 10:31:48', 'Successful'),
(50, 'Order Delivered', 'Order ID: #74 User ID: #23 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-09-28 10:06:58 Amount : 44990.99', '2024-10-11 12:45:56', 'Successful'),
(51, 'Order Delivered', 'Order ID: #74 User ID: #23 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-09-28 10:06:58 Amount : 44990.99', '2024-10-11 12:46:43', 'Successful'),
(52, 'Order Delivered', 'Order ID: #85 User ID: #26 Product name: Daybed Quntity: 1 Placed on on: 2024-10-11 13:25:23 Amount : 24990.99', '2024-10-11 13:28:23', 'Successful'),
(53, 'Order Delivered', 'Order ID: #84 User ID: #26 Product name: Twin Bed Quntity: 3 Placed on on: 2024-10-11 13:25:23 Amount : 194702.97', '2024-10-11 13:28:45', 'Successful'),
(54, 'Order Cancelled', 'Order ID: #85 User ID: #26 Product name: Daybed Quntity: 1 Placed on: 2024-10-11 13:25:23 Amount : 24990.99', '2024-10-11 13:29:30', 'Successful'),
(55, 'Order Delivered', 'Order ID: #74 User ID: #23 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-09-28 10:06:58 Amount : 44990.99', '2024-10-17 17:52:21', 'Successful'),
(56, 'Order Delivered', 'Order ID: #80 User ID: #24 Product name: Twin Bed Quntity: 3 Placed on on: 2024-10-08 09:14:49 Amount : 194702.97', '2024-10-18 04:03:47', 'Successful'),
(57, 'Order Delivered', 'Order ID: #88 User ID: #23 Product name: Twin Bed Quntity: 1 Placed on on: 2024-10-18 04:02:47 Amount : 64900.99', '2024-10-18 04:04:20', 'Successful'),
(58, 'Order Delivered', 'Order ID: #91 User ID: #23 Product name: Abstract Wallpaper Quntity: 6 Placed on on: 2024-10-18 08:05:50 Amount : 47945.399999999994', '2024-10-18 08:51:49', 'Successful'),
(59, 'Order Cancelled', 'Order ID: #90 User ID: #23', '2024-10-18 15:34:45', 'Failed'),
(60, 'Order Cancelled', 'Order ID: #90 User ID: #23 Product name: Floral Wallpaper Quntity: 3 Placed on: 2024-10-18 08:05:50 Amount : 7172.969999999999', '2024-10-18 15:35:21', 'Successful'),
(61, 'Order Cancelled', 'Order ID: #89 User ID: #23 Product name: Toaster Quntity: 5 Placed on: 2024-10-18 08:05:50 Amount : 59954.95', '2024-10-18 15:35:49', 'Successful'),
(62, 'Order Delivered', 'Order ID: #83 User ID: #26 Product name: Bunk Bed Quntity: 4 Placed on on: 2024-10-11 13:25:18 Amount : 179963.96', '2024-10-18 15:35:56', 'Successful'),
(63, 'Order Delivered', 'Order ID: #82 User ID: #26 Product name: Queen size Bed Quntity: 1 Placed on on: 2024-10-11 13:25:06 Amount : 84990.99', '2024-10-18 15:36:04', 'Successful'),
(64, 'Order Cancelled', 'Order ID: #92 User ID: #23 Product name: Twin Bed Quntity: 1 Placed on: 2024-10-18 15:50:54 Amount : 64900.99', '2024-10-18 15:51:26', 'Successful'),
(65, 'Order Delivered', 'Order ID: #93 User ID: #23 Product name: King Size Bed Quntity: 1 Placed on on: 2024-10-18 15:51:50 Amount : 93990.99', '2024-10-18 15:51:58', 'Successful'),
(66, 'Adding new product', 'Product name: test 2 Category: kitchen-appliances Price: 11.0', '2024-10-18 14:45:52', 'Successful'),
(67, 'Removing existing product', 'Product name: test 2 Category: kitchen-appliances Price: 11.0', '2024-10-18 14:51:52', 'Successful'),
(68, 'Adding new product', 'Product name: aagag Category: kitchen-appliances Price: 11.0', '2024-10-18 14:53:00', 'Successful'),
(69, 'Removing existing product', 'Product name: aagag Category: kitchen-appliances Price: 11.0', '2024-10-18 14:55:16', 'Successful'),
(70, 'Adding new product', 'Product name: aaa Category: kitchen-appliances Price: 11.0', '2024-10-18 14:55:42', 'Successful'),
(71, 'Removing existing product', 'Product name: aaa Category: kitchen-appliances Price: 11.0', '2024-10-18 14:56:46', 'Successful'),
(72, 'Order Delivered', 'Order ID: #97 User ID: #28 Product name: King Size Bed Quntity: 3 Placed on on: 2024-10-18 15:47:25 Amount : 281972.97000000003', '2024-10-18 15:55:05', 'Successful'),
(73, 'Order Delivered', 'Order ID: #98 User ID: #28 Product name: Electric Kettle Quntity: 1 Placed on on: 2024-10-18 15:47:25 Amount : 8990.99', '2024-10-18 15:55:18', 'Successful'),
(74, 'Order Delivered', 'Order ID: #94 User ID: #28 Product name: Abstract Wallpaper Quntity: 5 Placed on on: 2024-10-18 15:47:25 Amount : 39954.5', '2024-10-18 15:55:21', 'Successful'),
(75, 'Order Cancelled', 'Order ID: #95 User ID: #28 Product name: Study Desk Quntity: 2 Placed on: 2024-10-18 15:47:25 Amount : 25981.94', '2024-10-18 15:55:32', 'Successful'),
(76, 'Order Delivered', 'Order ID: #99 User ID: #28 Product name: Floral Wallpaper Quntity: 5 Placed on on: 2024-10-18 15:59:59 Amount : 11954.949999999999', '2024-10-18 16:00:08', 'Successful'),
(77, 'Order Delivered', 'Order ID: #105 User ID: #29 Product name: Toaster Quntity: 4 Placed on on: 2024-10-18 16:09:30 Amount : 47963.96', '2024-10-18 16:09:40', 'Successful'),
(78, 'Order Delivered', 'Order ID: #104 User ID: #29 Product name: Coffee Maker Quntity: 2 Placed on on: 2024-10-18 16:09:30 Amount : 89981.98', '2024-10-18 16:09:43', 'Successful'),
(79, 'Order Delivered', 'Order ID: #101 User ID: #29 Product name: Twin Bed Quntity: 2 Placed on on: 2024-10-18 16:09:29 Amount : 129801.98', '2024-10-18 16:09:48', 'Successful'),
(80, 'User info updated', 'Updated user info of user #32', '2024-10-18 16:21:25', 'Successful'),
(81, 'User info updated', 'Updated user info of user #32', '2024-10-18 16:21:52', 'Successful'),
(82, 'User info updated', 'Updated user info of user #33', '2024-10-18 16:24:53', 'Successful'),
(83, 'User info updated', 'Updated user info of user #33', '2024-10-18 16:25:06', 'Successful'),
(84, 'User info updated', 'Updated user info of user #34', '2024-10-18 16:25:35', 'Successful'),
(85, 'User info updated', 'Updated user info of user #35', '2024-10-18 16:26:52', 'Successful'),
(86, 'User info updated', 'Update of user info of user #37 failed', '2024-10-18 16:30:26', 'Failed'),
(87, 'User info updated', 'Updated user info of user #37', '2024-10-18 16:30:37', 'Successful'),
(88, 'Order Delivered', 'Order ID: #107 User ID: #30 Product name: Coffee Maker Quntity: 1 Placed on on: 2024-10-18 16:15:09 Amount : 44990.99', '2024-10-18 16:32:24', 'Successful'),
(89, 'Order Delivered', 'Order ID: #109 User ID: #30 Product name: Toaster Quntity: 1 Placed on on: 2024-10-18 16:15:09 Amount : 11990.99', '2024-10-18 16:32:29', 'Successful'),
(90, 'Order Delivered', 'Order ID: #108 User ID: #30 Product name: Wallpaper Quntity: 1 Placed on on: 2024-10-18 16:15:09 Amount : 5490.99', '2024-10-18 16:32:49', 'Successful'),
(91, 'Order Delivered', 'Order ID: #115 User ID: #38 Product name: Coffee Maker Quntity: 1 Placed on on: 2024-10-19 04:28:03 Amount : 44990.99', '2024-10-19 04:28:49', 'Successful'),
(92, 'Order Delivered', 'Order ID: #113 User ID: #38 Product name: Wallpaper Quntity: 6 Placed on on: 2024-10-19 04:28:03 Amount : 32945.94', '2024-10-19 04:28:55', 'Successful'),
(93, 'Order Delivered', 'Order ID: #111 User ID: #38 Product name: Queen size Bed Quntity: 2 Placed on on: 2024-10-19 04:28:03 Amount : 169981.98', '2024-10-19 04:28:57', 'Successful'),
(94, 'Order Delivered', 'Order ID: #114 User ID: #38 Product name: Abstract Wallpaper Quntity: 3 Placed on on: 2024-10-19 04:28:03 Amount : 23972.699999999997', '2024-10-19 04:29:04', 'Successful'),
(95, 'Order Delivered', 'Order ID: #116 User ID: #28 Product name: Wallpaper Quntity: 1 Placed on on: 2024-10-19 06:46:57 Amount : 5490.99', '2024-10-19 06:47:33', 'Successful'),
(96, 'Adding new product', 'Product name: aagag$^^&& Category: beds Price: 10000.0', '2024-10-19 07:51:23', 'Successful'),
(97, 'Adding new product', 'Product name: hguhaguah%%% Category: kitchen-appliances Price: 11.0', '2024-10-19 07:55:05', 'Successful'),
(98, 'Adding new product', 'Product name: aagag Category: kitchen-appliances Price: 11.0', '2024-10-19 07:55:37', 'Successful'),
(99, 'Removing existing product', 'Product name: aagag$^^&& Category: beds Price: 10000.0', '2024-10-19 07:56:39', 'Successful'),
(100, 'Removing existing product', 'Product name: hguhaguah%%% Category: kitchen-appliances Price: 11.0', '2024-10-19 07:56:51', 'Successful'),
(101, 'Removing existing product', 'Product name: aagag Category: kitchen-appliances Price: 11.0', '2024-10-19 07:57:31', 'Successful'),
(102, 'Adding new product', 'Product name: Queen size Bed Category: beds Price: 100000.0', '2024-10-19 08:48:02', 'Successful'),
(103, 'Removing existing product', 'Product name: Queen size Bed Category: beds Price: 100000.0', '2024-10-19 08:48:25', 'Successful'),
(104, 'Order Delivered', 'Order ID: #122 User ID: #28 Product name: King Size Bed Quntity: 4 Placed on on: 2024-10-19 10:59:45 Amount : 375963.96', '2024-10-19 11:00:06', 'Successful'),
(105, 'Order Delivered', 'Order ID: #121 User ID: #28 Product name: Bunk Bed Quntity: 2 Placed on on: 2024-10-19 10:59:45 Amount : 89981.98', '2024-10-19 11:00:11', 'Successful'),
(106, 'Order Delivered', 'Order ID: #127 User ID: #40 Product name: Toaster Quntity: 2 Placed on on: 2024-10-20 10:24:26 Amount : 23981.98', '2024-10-20 10:24:58', 'Successful'),
(107, 'Order Delivered', 'Order ID: #126 User ID: #40 Product name: Abstract Wallpaper Quntity: 7 Placed on on: 2024-10-20 10:24:26 Amount : 55936.299999999996', '2024-12-13 22:38:46', 'Successful'),
(108, 'Order Delivered', 'Order ID: #136 User ID: #40 Product name: Toaster Quntity: 1 Placed on on: 2024-12-19 01:56:31 Amount : 11990.99', '2024-12-19 01:57:07', 'Successful'),
(109, 'Order Delivered', 'Order ID: #135 User ID: #40 Product name: King Size Bed Quntity: 15 Placed on on: 2024-12-19 01:56:31 Amount : 1409864.85', '2024-12-19 01:57:11', 'Successful'),
(110, 'Order Delivered', 'Order ID: #134 User ID: #40 Product name: Twin Beds Quntity: 12 Placed on on: 2024-12-19 01:56:31 Amount : 790811.8800000001', '2024-12-19 01:57:13', 'Successful'),
(111, 'Order Delivered', 'Order ID: #129 User ID: #41 Product name: Bread Maker Quntity: 2 Placed on on: 2024-11-09 07:54:30 Amount : 21981.98', '2024-12-19 01:57:17', 'Successful'),
(112, 'Order Delivered', 'Order ID: #131 User ID: #41 Product name: Floral Wallpaper Quntity: 5 Placed on on: 2024-11-09 07:54:30 Amount : 11954.949999999999', '2024-12-19 01:57:19', 'Successful'),
(113, 'Order Delivered', 'Order ID: #138 User ID: #40 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-12-22 23:35:28 Amount : 44990.99', '2024-12-22 23:36:31', 'Successful'),
(114, 'Order Cancelled', 'Order ID: #137 User ID: #40 Product name: Twin Beds Quntity: 1 Placed on: 2024-12-22 23:35:22 Amount : 65900.99', '2024-12-22 23:37:00', 'Successful'),
(115, 'Order Delivered', 'Order ID: #139 User ID: #40 Product name: Bunk Bed Quntity: 1 Placed on on: 2024-12-22 23:37:58 Amount : 44990.99', '2024-12-22 23:38:06', 'Successful');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `firstName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(120) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstName`, `lastName`, `email`, `password`) VALUES
(1, 'Nirmal', 'Perera', 'admin@gmail.com', '$2a$10$LX.q8azSef12OaC9Z8QRK.UAnlo/evtbFUzFBcvv4fIPhMPTt94WO'),
(2, 'ABC', 'DEF', 'abc@gmail.com', '$2a$10$nYeEmJnlNDqugF6/eLI6ZOGtisKLTsYJWdzkHwetIyFA2lSpirnRC');

-- --------------------------------------------------------

--
-- Table structure for table `canceled_orders`
--

CREATE TABLE `canceled_orders` (
  `coid` int NOT NULL,
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_qty` int NOT NULL,
  `o_date` datetime NOT NULL,
  `cancelled_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `giftvouchers`
--

CREATE TABLE `giftvouchers` (
  `voucherid` int NOT NULL,
  `voucherNo` varchar(12) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `o_id` int NOT NULL,
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_quantity` int NOT NULL,
  `o_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `o_status` varchar(20) NOT NULL DEFAULT 'pending',
  `o_msg` varchar(1000) NOT NULL DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`o_id`, `p_id`, `u_id`, `o_quantity`, `o_date`, `o_status`, `o_msg`) VALUES
(94, 18, 28, 5, '2024-10-18 15:47:25', 'Rejected', 'I changed my mind '),
(95, 21, 28, 2, '2024-10-18 15:47:25', 'Rejected', 'Rejected By Amin'),
(96, 22, 28, 1, '2024-10-18 15:47:25', 'pending', 'N/A'),
(97, 23, 28, 3, '2024-10-18 15:47:25', 'Reviewed', 'This bed is awesome'),
(98, 14, 28, 1, '2024-10-18 15:47:25', 'Accepted', 'N/A'),
(99, 8, 28, 5, '2024-10-18 15:59:59', 'Delivered', 'N/A'),
(100, 9, 29, 3, '2024-10-18 16:09:29', 'pending', 'N/A'),
(101, 24, 29, 2, '2024-10-18 16:09:29', 'Reviewed', 'This bed is super comfy.'),
(102, 21, 29, 3, '2024-10-18 16:09:29', 'pending', 'N/A'),
(103, 17, 29, 2, '2024-10-18 16:09:30', 'pending', 'N/A'),
(105, 11, 29, 4, '2024-10-18 16:09:30', 'Rejected', 'Price after charges are too high'),
(106, 23, 30, 1, '2024-10-18 16:15:09', 'pending', 'N/A'),
(107, 12, 30, 1, '2024-10-18 16:15:09', 'Delivered', 'N/A'),
(108, 17, 30, 1, '2024-10-18 16:15:09', 'Reviewed', 'This wallpaper is super satifing and eyecatching'),
(109, 11, 30, 1, '2024-10-18 16:15:09', 'Accepted', 'N/A'),
(110, 9, 30, 1, '2024-10-18 16:15:09', 'pending', 'N/A'),
(111, 10, 38, 2, '2024-10-19 04:28:03', 'Delivered', 'N/A'),
(112, 27, 38, 1, '2024-10-19 04:28:03', 'pending', 'N/A'),
(113, 17, 38, 6, '2024-10-19 04:28:03', 'Rejected', 'I found a better Option'),
(114, 18, 38, 3, '2024-10-19 04:28:03', 'Reviewed', 'This wallpaper is super cool and it gives me good vibes.'),
(115, 12, 38, 1, '2024-10-19 04:28:03', 'Reviewed', 'This is super helpful for me and it worth the cost. '),
(116, 17, 28, 1, '2024-10-19 06:46:57', 'Rejected', 'I don\'t want this anymore'),
(117, 25, 28, 2, '2024-10-19 08:55:46', 'pending', 'N/A'),
(118, 28, 28, 3, '2024-10-19 08:56:07', 'pending', 'N/A'),
(119, 12, 28, 1, '2024-10-19 08:56:07', 'pending', 'N/A'),
(120, 10, 30, 1, '2024-10-19 09:22:44', 'pending', 'N/A'),
(122, 23, 28, 4, '2024-10-19 10:59:45', 'Reviewed', 'THis bed is super comfy and worth the price'),
(126, 18, 40, 7, '2024-10-20 10:24:26', 'Reviewed', 'superb quality'),
(127, 11, 40, 2, '2024-10-20 10:24:26', 'Reviewed', 'this is awesome'),
(128, 23, 41, 3, '2024-11-09 07:54:30', 'pending', 'N/A'),
(129, 28, 41, 2, '2024-11-09 07:54:30', 'Delivered', 'N/A'),
(130, 19, 41, 3, '2024-11-09 07:54:30', 'pending', 'N/A'),
(131, 8, 41, 5, '2024-11-09 07:54:30', 'Delivered', 'N/A'),
(132, 17, 41, 1, '2024-11-09 07:54:38', 'pending', 'N/A'),
(134, 24, 40, 12, '2024-12-19 01:56:31', 'Rejected', 'i dont want this anymore'),
(135, 23, 40, 15, '2024-12-19 01:56:31', 'Reviewed', 'good item'),
(136, 11, 40, 1, '2024-12-19 01:56:31', 'Reviewed', 'superb quality'),
(137, 24, 40, 1, '2024-12-22 23:35:22', 'Rejected', 'Rejected By Amin'),
(138, 25, 40, 1, '2024-12-22 23:35:28', 'Reviewed', 'This is an awesome product'),
(139, 25, 40, 1, '2024-12-22 23:37:58', 'Rejected', 'I dont need this anymore'),
(141, 25, 40, 7, '2025-01-16 03:40:17', 'pending', 'N/A'),
(142, 10, 40, 3, '2025-01-16 03:40:22', 'pending', 'N/A'),
(143, 23, 40, 1, '2025-01-16 03:40:22', 'pending', 'N/A'),
(144, 24, 40, 1, '2025-01-16 03:40:22', 'pending', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(450) NOT NULL,
  `category` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'https://via.placeholder.com/300x200'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(7, 'Blender', 'kitchen-appliances', 7990.99, 'blender.png'),
(8, 'Floral Wallpaper', 'wallpapers', 2390.99, 'floralwallpaper.jpg'),
(9, 'Dining Table', 'tables', 99980.95, 'diningtable.png'),
(10, 'Queen size Bed', 'beds', 84990.99, 'queensizebed.png'),
(11, 'Toaster', 'kitchen-appliances', 11990.99, 'toaster.png'),
(12, 'Coffee Maker', 'kitchen-appliances', 44990.99, 'coffeemaker.png'),
(14, 'Electric Kettle', 'kitchen-appliances', 8990.99, 'electrickettle.png'),
(15, 'Geometric Wallpaper', 'wallpapers', 8990.99, 'geometricwallpaper.jpg'),
(16, 'Vintage Wallpaper', 'wallpapers', 7890.99, 'vintagewallpaper.jpg'),
(17, 'Wallpaper', 'wallpapers', 5490.99, 'wallpaper.jpg'),
(18, 'Abstract Wallpaper', 'wallpapers', 7990.9, 'abstractwallpaper.jpg'),
(19, 'Coffee Table', 'tables', 11990.99, 'coffeetable.png'),
(20, 'Side Table', 'tables', 11990.9, 'sidetable.png'),
(21, 'Study Desk', 'tables', 12990.97, 'studydesk.jpg'),
(22, 'Console Table', 'tables', 8990.99, 'consoletable.jpg'),
(23, 'King Size Bed', 'beds', 93990.99, 'kingsizebed.jpg'),
(24, 'Twin Beds', 'beds', 65900.99, 'twinbed.jpg'),
(25, 'Bunk Bed', 'beds', 44990.99, 'bunkbed.jpg'),
(26, 'Daybeds', 'beds', 24990.99, 'daybed.png'),
(27, 'Refrigerators', 'kitchen-appliances', 149990.98, 'refrigerator.png'),
(28, 'Bread Maker', 'kitchen-appliances', 10990.99, 'breadmaker.png'),
(29, 'Dishwasher', 'kitchen-appliances', 44990.99, 'dishwasher.png'),
(30, 'Rice Cooker', 'kitchen-appliances', 24990.99, 'ricecooker.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(120) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '+947XXXXXXXX',
  `address` varchar(150) NOT NULL DEFAULT 'not set',
  `password` varchar(250) NOT NULL,
  `registered_at` varchar(30) DEFAULT NULL,
  `Image` varchar(255) NOT NULL DEFAULT 'https://via.placeholder.com/192'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `phone`, `address`, `password`, `registered_at`, `Image`) VALUES
(29, 'Abiman', 'Rajapaksha', 'abiman@gmail.com', '+94758908057', 'flower raod, colombo 7', '$2a$10$uF47sTlaxWUpWZc4XAfvSOk1/GgvGPGeEGddXBHuzUfieX2g22EI.', '2024-10-18', '80f67459-05e0-45f7-a686-209fc8884c68.jpg'),
(30, 'Rashan', 'Adithya', 'rashan@gmail.com', '+94723438944', 'Thalahena, Malabe', '$2a$10$MTEWpHKxszDfFRkAAxzhyuVSgCM94PvuaU681tWcZR49ZfmDBAgSO', '2024-10-18', '35005930-8ec3-4932-b46d-2e12c991e0d5.jpg'),
(31, 'Muditha', 'Sankalpa', 'muditha@gmail.com', '+94787654321', 'malabe', '$2a$10$qMbphE7NoQtTpC3EydiH.uiMsCsZPFWZeXgm7wzRhuO5Isjm1rg2S', '2024-10-18', 'ee76e572-8ce1-4341-abba-9f836319c2dd.jpg'),
(32, 'Thevidu', 'Damsith', 'thevidu@gmail.com', '+94770301704', 'not set', '$2a$10$EYBSQGrsOru8GYIJPdN8nOtuRcdOewyiYRo1yR5pgq7chMVlnEBh6', '2024-10-18', 'https://via.placeholder.com/192'),
(33, 'Senuji', 'Vidanage', 'senuji@gmail.com', '+94718580160', 'not set', '$2a$10$akhUOJyDJ0fi6SfukFtg6uIKh36d9Jt4yoLzSOzg0EY2vctftpA4C', '2024-10-18', 'https://via.placeholder.com/192'),
(34, 'Umayangi', 'Rajapaksha', 'umayangi@gmail.com', '+94712489919', 'not set', '$2a$10$tYxkc3hzgbdZBlMzu9Z04.dciC9fMDKD7I8aWdiL.s7YKE4cLCMt2', '2024-10-18', 'https://via.placeholder.com/192'),
(35, 'Arosa', 'Dinal', 'arosa@gmail.com', '+94701949386', 'not set', '$2a$10$dLizgaIA7HkfaYUn17Zw4uclKH43wgBo7igvN//Hr.R4jLicOlIdi', '2024-10-18', 'https://via.placeholder.com/192'),
(36, 'Chamidu', 'Rajapaksha', 'chamidu@gmail.com', '+94712345678', 'not set', '$2a$10$eiaRV5efEm55p9iHgvXZ7eOk81/efWH7m1Ysf8N7GHF1C4mxLEw0e', '2024-10-18', 'https://via.placeholder.com/192'),
(37, 'Binol', 'Perera', 'binol@gmail.com', '+94773295521', 'not set', '$2a$10$PM.D9BOa.tSghK9B6d9r2OUESDYr3mQz0V/Iw8mTDweYM59/BQX4C', '2024-10-18', 'https://via.placeholder.com/192'),
(38, 'Chanodya', 'Kavindi', 'chanodya@gmail.com', '+94714719085', 'kadawatha, Gampaha', '$2a$10$rQDLxPwRd5mwTRTWO/pBe./ypvtI0SthSpfZIzBTU3Qeehlnyf04m', '2024-10-19', '7ac9c19d-4164-422f-adfe-642a83ad0697.jpg'),
(39, 'Yasindu', 'Gamage', 'yasindu@gmail.com', '+947XXXXXXXX', 'not set', '$2a$10$lIl5g8dqGiVabjRhpp6At.XTLlEi.lGej9P/Qnznm4etkYn9iypiy', '2024-10-19', 'https://via.placeholder.com/192'),
(40, 'Nirmal', 'Perera', 'nirmal@gmail.com', '+94758908057', '17D, Dombowala , Udugampola', '$2a$10$mLSHbCHPZ4NMgE4Ezm8wRu5NrfLNloxqNAJNv7fCREZEu0kMOIQ6e', '2024-10-20', 'f97e2f5e-bd61-47c7-86e2-842177272af3.png'),
(41, 'Nirmal', 'Perera', 'nirmalperera2509@gmail.com', '+94758908057', 'somewhere', '$2a$10$shW/6sY5nIGj4DBBadK20ex/pSubkBSfVrOhoUlyNWHXAvwk12CHu', '2024-11-09', '49236e88-1e57-4b30-aa5e-63bfecfb61cc.jpg'),
(42, 'Nirmal', 'Perera', 'someone@gmail.com', '+947XXXXXXXX', 'not set', '$2a$10$Egfwfdx8IpgVO6W5MAhrROiQuoggv61GIIuy2Xs1jtDmCf3q5KLke', '2024-12-13', 'https://via.placeholder.com/192');

-- --------------------------------------------------------

--
-- Table structure for table `user_reports`
--

CREATE TABLE `user_reports` (
  `report_id` int NOT NULL,
  `user_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `messege` varchar(2000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_reports`
--

INSERT INTO `user_reports` (`report_id`, `user_id`, `type`, `messege`, `date`, `status`) VALUES
(13, 30, 'feedback_suggestion', 'teat', '2024-10-19 09:19:30', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_wishlist`
--

CREATE TABLE `user_wishlist` (
  `record_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_wishlist`
--

INSERT INTO `user_wishlist` (`record_id`, `user_id`, `product_id`, `quantity`) VALUES
(50, 28, 8, 4),
(51, 28, 22, 1),
(52, 28, 12, 1),
(55, 30, 23, 1),
(56, 30, 25, 1),
(57, 30, 8, 1),
(58, 30, 22, 1),
(59, 30, 14, 1),
(60, 30, 17, 1),
(61, 38, 24, 1),
(62, 38, 7, 1),
(63, 38, 17, 1),
(64, 38, 18, 1),
(65, 28, 11, 1),
(66, 28, 25, 7),
(68, 28, 24, 1),
(69, 30, 10, 2),
(70, 40, 18, 17),
(71, 40, 22, 3),
(72, 40, 27, 1),
(73, 40, 23, 4),
(74, 40, 8, 10),
(75, 41, 10, 3),
(76, 41, 7, 2),
(77, 41, 18, 2),
(78, 41, 30, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminactivity`
--
ALTER TABLE `adminactivity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `canceled_orders`
--
ALTER TABLE `canceled_orders`
  ADD PRIMARY KEY (`coid`);

--
-- Indexes for table `giftvouchers`
--
ALTER TABLE `giftvouchers`
  ADD PRIMARY KEY (`voucherid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  ADD PRIMARY KEY (`record_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminactivity`
--
ALTER TABLE `adminactivity`
  MODIFY `activity_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `canceled_orders`
--
ALTER TABLE `canceled_orders`
  MODIFY `coid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `o_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user_reports`
--
ALTER TABLE `user_reports`
  MODIFY `report_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  MODIFY `record_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
