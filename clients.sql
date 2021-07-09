-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2021 at 11:37 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clients`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments_1`
--

CREATE TABLE `appointments_1` (
  `id` int(11) NOT NULL,
  `appt_status` int(11) NOT NULL,
  `appt_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `appt_type` int(11) NOT NULL,
  `appt_data` text COLLATE utf8_unicode_ci NOT NULL,
  `technician_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_records_1`
--

CREATE TABLE `attendance_records_1` (
  `id` int(11) NOT NULL,
  `technician_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services_1`
--

CREATE TABLE `services_1` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_records_1`
--

CREATE TABLE `service_records_1` (
  `id` int(11) NOT NULL,
  `technician_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stations_1`
--

CREATE TABLE `stations_1` (
  `id` int(11) NOT NULL,
  `expired` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `public_key` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `mac_address` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technicians_1`
--

CREATE TABLE `technicians_1` (
  `id` int(11) NOT NULL,
  `technician_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `verification_code` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `waitlists_1`
--

CREATE TABLE `waitlists_1` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `technician` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `waitlist_status`
--

CREATE TABLE `waitlist_status` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `waitlist_status`
--

INSERT INTO `waitlist_status` (`id`, `title`) VALUES
(1, 'Just Joined'),
(2, 'Hold'),
(3, 'First Called'),
(4, 'Second Called'),
(5, 'Canceled'),
(6, 'Serviced');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments_1`
--
ALTER TABLE `appointments_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_records_1`
--
ALTER TABLE `attendance_records_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_1`
--
ALTER TABLE `services_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_records_1`
--
ALTER TABLE `service_records_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations_1`
--
ALTER TABLE `stations_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technicians_1`
--
ALTER TABLE `technicians_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waitlists_1`
--
ALTER TABLE `waitlists_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waitlist_status`
--
ALTER TABLE `waitlist_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments_1`
--
ALTER TABLE `appointments_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_records_1`
--
ALTER TABLE `attendance_records_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services_1`
--
ALTER TABLE `services_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_records_1`
--
ALTER TABLE `service_records_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stations_1`
--
ALTER TABLE `stations_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `technicians_1`
--
ALTER TABLE `technicians_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waitlists_1`
--
ALTER TABLE `waitlists_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waitlist_status`
--
ALTER TABLE `waitlist_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
