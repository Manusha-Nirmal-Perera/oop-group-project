-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2024 at 08:32 AM
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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `o_id` int NOT NULL,
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_quantity` int NOT NULL,
  `o_date` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`o_id`, `p_id`, `u_id`, `o_quantity`, `o_date`) VALUES
(17, 9, 7, 1, '2024-09-14'),
(23, 8, 6, 4, '2024-09-14'),
(24, 9, 6, 1, '2024-09-14'),
(25, 10, 6, 3, '2024-09-14');

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
(7, 'Blender', 'kitchen-appliances', 49.99, 'blender.png'),
(8, 'Floral Wallpaper', 'light-wallpapers', 19.99, 'floralwallpaper.jpg'),
(9, 'Dining Table', 'tables', 299.99, 'diningtable.png'),
(10, 'Queen size Bed', 'beds', 499.99, 'queensizebed.png'),
(11, 'Toaster', 'kitchen-appliances', 24.99, 'toaster.png'),
(12, 'Coffee Maker', 'kitchen-appliances', 89.99, 'coffeemaker.png'),
(13, 'Microwave Oven', 'kitchen-appliances', 149.99, 'microwaveoven.png'),
(14, 'Electric Kettle', 'kitchen-appliances', 39.99, 'electrickettle.png'),
(15, 'Geometric Wallpaper', 'light-wallpapers', 25.99, 'geometricwallpaper.jpg'),
(16, 'Vintage Wallpaper', 'light-wallpapers', 29.99, 'vintagewallpaper.jpg'),
(17, 'Wallpaper', 'light-wallpapers', 21.99, 'wallpaper.jpg'),
(18, 'Abstract Wallpaper', 'light-wallpapers', 22.99, 'abstractwallpaper.jpg'),
(19, 'Coffee Table', 'tables', 149.99, 'coffeetable.png'),
(20, 'Side Table', 'tables', 89.99, 'sidetable.png'),
(21, 'Study Desk', 'tables', 199.99, 'studydesk.jpg'),
(22, 'Console Table', 'tables', 179.99, 'consoletable.jpg'),
(23, 'King Size Bed', 'beds', 599.99, 'kingsizebed.jpg'),
(24, 'Twin Bed', 'beds', 399.99, 'twinbed.jpg'),
(25, 'Bunk Bed', 'beds', 699.99, 'bunkbed.jpg'),
(26, 'Daybed', 'beds', 299.99, 'daybed.png'),
(27, 'Refrigerator', 'kitchen-appliances', 799.99, 'refrigerator.png'),
(28, 'Bread Maker', 'kitchen-appliances', 119.99, 'breadmaker.png'),
(29, 'Dishwasher', 'kitchen-appliances', 599.99, 'dishwasher.png'),
(30, 'Rice Cooker', 'kitchen-appliances', 49.99, 'ricecooker.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(120) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `registered_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `registered_at`) VALUES
(1, 'Nirmal', 'Perera', 'nirmal@gmail.com', 'aaa', NULL),
(3, 'Nirmal', 'Perera', 'a@s', 'a', NULL),
(6, 'original', 'account', 'original@gmail.com', '$2a$10$fE2fS3nEXF0WNDVbDZ5wTui/fZOT4O..PY1f/I7JorQ9vSl9nreVO', NULL),
(7, 'testing', 'date', 'testdate@gmail.com', '$2a$10$rHKa0GtMBEWL1UmUxRB.seDqggkVvjd.N60zvun.9DrRI3gOHgM7O', '2024-09-14 08:32:28');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `o_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
