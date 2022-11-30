-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2022 at 04:04 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_ip` varchar(20) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`) VALUES
(1, 'Baguette'),
(2, 'Coffee'),
(3, 'Crepes'),
(5, 'Shake');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `mobile` text NOT NULL,
  `email` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `address`, `mobile`, `email`, `status`, `order_date`) VALUES
(7, 'julito ducay', 'talangnan', '0909625552', 'julito@gmail.com', 3, '2022-11-28 17:27:34'),
(8, 'julito ducay', 'talangnan', '0909625552', 'julito@gmail.com', 3, '2022-11-28 19:12:06'),
(9, 'julito ducay', 'Santa Fe', '0909625552', 'julito@gmail.com', 3, '2022-11-28 19:23:56'),
(10, 'test test', 'test', '123', 'test@gmail.com', 0, '2022-11-29 09:53:52'),
(11, 'tae TAE', 'tae', '235', 'tae@gmail.com', 0, '2022-11-29 10:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `user_id` int(50) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `user_id`, `order_id`, `product_id`, `qty`) VALUES
(1, 1, 1, 1, 5),
(2, 1, 2, 2, 3),
(3, 1, 2, 3, 2),
(4, 2, 3, 3, 5),
(5, 2, 4, 5, 3),
(6, 2, 5, 8, 4),
(7, 2, 6, 6, 2),
(8, 2, 7, 7, 3),
(9, 2, 8, 7, 2),
(10, 2, 9, 13, 50),
(11, 3, 10, 3, 1),
(12, 4, 11, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `img_path` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= unavailable, 2 Available',
  `stocks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `name`, `description`, `price`, `img_path`, `status`, `stocks`) VALUES
(2, 2, 'Chocolate Hazelnut', 'choco', 170, '1669606560_Chocolate Hazelnut.jpg', 0, 50),
(3, 3, 'Crepes', 'deliciouso', 170, '1669606620_Crepes with Mango.jpeg', 0, 5),
(4, 1, 'Baguette with Frank Sausage & Vegetables', '*fresh homemade baguette*\r\n14 inches', 260, '1669620360_Baguette with Frank Sausage & Vegetables.jpeg', 0, 50),
(5, 1, 'Baguette with Ham & Vegetables', '*fresh homemade baguette* \r\n14 inches', 260, '1669620540_Baguette with ham& Vegetables.jpeg', 0, 50),
(6, 5, 'Strawberry Shake', 'strawberry flavor', 160, '1669620660_Strawberry Shake.jpg', 0, 50),
(7, 5, 'Shake', 'caramel flavor', 130, '1669621020_Chocolate Hazelnut.jpg', 0, 5),
(8, 3, 'Crepes with Chicken Breast&Fresh Veggies', '12 inches', 190, '1669623720_Crepes with Chicken Breast&Fresh Veggies.jpeg', 0, 50),
(9, 3, 'Crepes with Fresh Veggies', '12 inches', 160, '1669623900_Crepes with Fresh Veggies.jpeg', 0, 50),
(10, 3, 'Crepes with Nutella', '12 inches', 140, '1669623960_Crepes with Nutella.jpeg', 0, 50),
(11, 3, 'Crepes with Tuna & Fresh Veggies', '12 inches', 190, '1669624020_Crepes with Tuna & Fresh Veggies.jpeg', 0, 50),
(12, 5, 'Chocolateberry', 'chocolate and berry', 130, '1669624260_Chocolateberry.jpg', 0, 50),
(13, 5, 'Blueberry Shake', '.....', 130, '1669624320_Blueberry Shake.jpg', 0, 0),
(14, 5, 'Mango Shake', '.......', 130, '1669624380_Mango Shake.jpg', 0, 50),
(15, 2, 'Ice coffee W peanutButter&Salted Caramel', '.......', 170, '1669632780_Ice coffee W peanutButter&Salted Caramel.jpg', 0, 50);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Micky Santoro', 'admin@gmail.com', '+639123456789', '2.jpg', '&lt;p style=&quot;text-align: justify; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size: 14.3998px;&quot;&gt;&lt;span style=&quot;font-size:12px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(300) NOT NULL,
  `municipality` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address`, `municipality`) VALUES
(1, 'ruby', 'gwapa', 'ruby@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0909777709', 'pooc', 'Santafe'),
(2, 'julito', 'ducay', 'julito@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0909625552', 'talangnan', 'Santafe'),
(3, 'test', 'test', 'test@gmail.com', '098f6bcd4621d373cade4e832627b4f6', '123', 'test', 'Santafe'),
(4, 'tae', 'TAE', 'tae@gmail.com', '4752d51bd71f704beec34b798c76ca9e', '235', 'tae', 'Bantayan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
