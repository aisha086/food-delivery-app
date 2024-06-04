-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 03, 2024 at 01:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutter-php`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `C_ID` int(11) NOT NULL,
  `C_Name` varchar(255) NOT NULL,
  `C_Email` text NOT NULL,
  `C_State` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_ID`, `C_Name`, `C_Email`, `C_State`) VALUES
(1, 'Aisha', 'a@gmail.com', 'KPK'),
(2, 'test', 't@gmail.com', 'KPK'),
(3, 'Maryam', 'm@gmail.com', 'Punjab'),
(4, 'maryam', 'mr@gmail.com', 'Punjab'),
(5, 'Yusra', 'y@gmail.com', 'Gilgit Baltistan');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `Order_Destination` text NOT NULL,
  `Order_Price` double NOT NULL,
  `Order_Status` text NOT NULL,
  `Order_Date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `C_ID`, `Order_Destination`, `Order_Price`, `Order_Status`, `Order_Date`) VALUES
(2, 2, 'tip', 6800, 'Out for Delivery', '2024-06-03'),
(3, 2, 'mansehra', 6800, 'Order confirmed', '2024-06-03'),
(4, 2, 'txt', 4500, 'Order confirmed', '2024-06-03'),
(5, 3, 'kpk', 2097, 'Order confirmed', '2024-06-03'),
(6, 5, 'Haripur', 10300, 'Out for Delivery', '2024-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `pro_name` varchar(40) NOT NULL,
  `pro_rp` int(11) NOT NULL,
  `pro_desc` text NOT NULL,
  `pro_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `pro_name`, `pro_rp`, `pro_desc`, `pro_img`) VALUES
(1, 'Biryani', 200, 'Indulge in the rich, aromatic flavors of our traditional Biryani. This exquisite dish is a delightful medley of fragrant basmati rice, tender pieces of marinated meat (choose from chicken, lamb, or vegetable), and a blend of authentic spices. Each bite offers a burst of taste, combining the subtle heat of Indian spices with the savory essence of slow-cooked ingredients. Garnished with caramelized onions, fresh coriander, and a touch of saffron, our Biryani is a timeless classic that promises to transport your taste buds to the heart of Indian cuisine. Enjoy it with a side of cool raita and tangy pickles for a complete culinary experience.', 'https://www.thespruceeats.com/thmb/XDBL9gA6A6nYWUdsRZ3QwH084rk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SES-chicken-biryani-recipe-7367850-hero-A-ed211926bb0e4ca1be510695c15ce111.jpg'),
(2, 'Chicken Pizza', 1500, 'Pizza for the foodies!', 'https://www.allrecipes.com/thmb/ee0daLeNNIUcrKbm5nxwFXheMDM=/0x512/filters:no_upscale():max_bytes(150000):strip_icc()/AR-24878-bbq-chicken-pizza-beauty-4x3-39cd80585ad04941914dca4bd82eae3d.jpg'),
(3, 'Fillet', 1000, 'Fillet Grinders Burger is a popular gourmet spot known for high-quality, freshly ground beef fillets and creative toppings, from classic to adventurous. Enjoy a casual dining experience with flavorful, satisfying meals perfect for both traditional and adventurous burger lovers.', 'https://www.recipetineats.com/wp-content/uploads/2023/09/Crispy-fried-chicken-burgers_5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `user_email` text NOT NULL,
  `user_mobile` text DEFAULT NULL,
  `user_password` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_email`, `user_mobile`, `user_password`) VALUES
(1, 'Aisha', 'aisha@gmail.com', '3236565989', 'test123'),
(4, 'Test', 'test@g.com', '11111111111', '$2y$10$PRPFxWZEvnFACfPsD6dM4u1KrUedCoTi50IgM21mMqaGlzA8KwEYK'),
(5, 'test', 't@gmai.com', '2', '$2y$10$m29jTq/.pUcQjK/EyQIdL.DRtEWHxEL8xCMXA9IPZTVL8TEiBCvXS'),
(6, 'Aisha Siddiqui', 'aishasiddiqui633@gmail.com', '03235288981', '$2y$10$A69YLTqzfLF3KiJ9H93VR.QBO/CSKfpIvFj02hPxiLeOV4.vljPvG'),
(7, 'new', 'new@gmail.com', '123456798', '$2y$10$zXu.tlayLji8F64LNF1tQ.9P26WPqfNcSGpdlXUHAL//7a8YeceKG'),
(8, 'new1', 'n@gmail.com', '44545546', 'e10adc3949ba59abbe56e057f20f883e'),
(9, 'Aisha', 'aisha@gmail.com', '123456', 'e10adc3949ba59abbe56e057f20f883e'),
(10, 'Sabahat', 's@gmail.com', '12355455', 'e10adc3949ba59abbe56e057f20f883e'),
(11, 'Maria', 'mar@gmail.com', '1235185151', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `C_Email` (`C_Email`) USING HASH;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `FK_C_ID` (`C_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_C_ID` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
