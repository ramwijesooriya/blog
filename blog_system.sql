-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2023 at 12:36 PM
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
-- Database: `blog_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `created_at`) VALUES
(1, 7, 'AI TECHNOLOGY ', 'Artificial Intelligence (AI) is the ability of machines to perform tasks that are typically associated with human intelligence, such as learning and problem-solving ¹². The field covers various sub-fields, such as general intelligence, planning, computer vision, natural language processing, and robotics ². AI research has a long history and a vast range of applications in various domains ¹²³. \r\n', '2023-12-02 15:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'blogplatform@gmail.com', '$2y$10$YRPqIJCzbeZdvRgj3wOa5.Rt84ml.Nj2E/4jNBf2l67Quil2.q4Iy', '2023-11-28 12:26:29'),
(2, '1234', '$2y$10$VKxkilGKT9oqFlCC6.MALOY90HVsgmVL8jjJvz3vHEztq4v2w4Gku', '2023-11-28 15:01:02'),
(3, '123456', '$2y$10$V5VCNF4ShdnGVibG/OFSXeXJ93iWOoqHQJxGFRJYvqSsA3BR0VOoq', '2023-11-30 16:45:54'),
(4, '1234567', '$2y$10$ROl8fSpwOxGk.6gFaXYoFOPIRmO7exzNFzViS34zwK8ZPs1DT36SC', '2023-11-30 16:53:02'),
(5, 'blogplatform@gmail.com', '$2y$10$lwkdmgj6i2bbxLCtnYZxNe0NeoRG50XLn0eE7Q/CVCSaHbayVxNcy', '2023-12-02 14:22:48'),
(6, '1234567', '$2y$10$ePRA/6aL67oXLf/lj08WeuIHTo.GmFruQcBZbLxssRhF7Tn97yVJW', '2023-12-02 14:32:46'),
(7, 'asanka@gmail.com', '$2y$10$bQwkLuc.CVTCcGdDF529D.b8XwIHNM3CdNZP4WqcF4/GgD4Br8HLu', '2023-12-02 14:55:24'),
(8, '1234567', '$2y$10$.Dt8oGQsVAupVWFSeadGx.sB9cUC1DZAw02.2chOr5.h/uZ0CyyHK', '2023-12-07 07:54:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
