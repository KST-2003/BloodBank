-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 17, 2023 at 10:08 AM
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
-- Database: `BloodBank`
--

-- --------------------------------------------------------

--
-- Table structure for table `BloodStock`
--

CREATE TABLE `BloodStock` (
  `Id` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `BloodType_Id` int(11) NOT NULL,
  `Donor_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BloodType`
--

CREATE TABLE `BloodType` (
  `Id` int(11) NOT NULL,
  `BloodType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Donation`
--

CREATE TABLE `Donation` (
  `Id` int(11) NOT NULL,
  `ReqDetail_Id` int(11) NOT NULL,
  `BloodStock_Id` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Donor`
--

CREATE TABLE `Donor` (
  `Id` int(11) NOT NULL,
  `Donor_Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Remark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Donor_Req`
--

CREATE TABLE `Donor_Req` (
  `Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhNo` varchar(255) NOT NULL,
  `BloodType_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Hospital`
--

CREATE TABLE `Hospital` (
  `Id` int(11) NOT NULL,
  `Hospital_Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Remark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Hospital_Req`
--

CREATE TABLE `Hospital_Req` (
  `Id` int(11) NOT NULL,
  `Contact_Name` varchar(255) NOT NULL,
  `Dept` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhNo` varchar(255) NOT NULL,
  `Status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `Id` int(11) NOT NULL,
  `Patient_Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Remark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Patient_Req`
--

CREATE TABLE `Patient_Req` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhNo` varchar(255) NOT NULL,
  `Hospital_Name` varchar(255) NOT NULL,
  `Reason` varchar(255) NOT NULL,
  `Qty` int(11) NOT NULL,
  `BloodType_Id` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Req`
--

CREATE TABLE `Req` (
  `Id` int(11) NOT NULL,
  `Patient_Req_Id` int(11) DEFAULT NULL,
  `Hospital_Req_Id` int(11) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `Reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Req_Detail`
--

CREATE TABLE `Req_Detail` (
  `Id` int(11) NOT NULL,
  `Req_Id` int(11) NOT NULL,
  `BloodType_Id` int(11) NOT NULL,
  `Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BloodStock`
--
ALTER TABLE `BloodStock`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BloodType_Id` (`BloodType_Id`),
  ADD KEY `Donor_Id` (`Donor_Id`);

--
-- Indexes for table `BloodType`
--
ALTER TABLE `BloodType`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Donation`
--
ALTER TABLE `Donation`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ReqDetail_Id` (`ReqDetail_Id`),
  ADD KEY `BloodStock_Id` (`BloodStock_Id`);

--
-- Indexes for table `Donor`
--
ALTER TABLE `Donor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Donor_Id` (`Donor_Id`);

--
-- Indexes for table `Donor_Req`
--
ALTER TABLE `Donor_Req`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BloodType_Id` (`BloodType_Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Indexes for table `Hospital`
--
ALTER TABLE `Hospital`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Hospital_Id` (`Hospital_Id`);

--
-- Indexes for table `Hospital_Req`
--
ALTER TABLE `Hospital_Req`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Patient_Id` (`Patient_Id`);

--
-- Indexes for table `Patient_Req`
--
ALTER TABLE `Patient_Req`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BloodType_Id` (`BloodType_Id`);

--
-- Indexes for table `Req`
--
ALTER TABLE `Req`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Hospital_Req` (`Hospital_Req_Id`),
  ADD KEY `Patient_Req_Id` (`Patient_Req_Id`);

--
-- Indexes for table `Req_Detail`
--
ALTER TABLE `Req_Detail`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Req_Id` (`Req_Id`),
  ADD KEY `BloodType_Id` (`BloodType_Id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BloodStock`
--
ALTER TABLE `BloodStock`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BloodType`
--
ALTER TABLE `BloodType`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Donation`
--
ALTER TABLE `Donation`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Donor`
--
ALTER TABLE `Donor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Donor_Req`
--
ALTER TABLE `Donor_Req`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Hospital`
--
ALTER TABLE `Hospital`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Hospital_Req`
--
ALTER TABLE `Hospital_Req`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Patient`
--
ALTER TABLE `Patient`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Patient_Req`
--
ALTER TABLE `Patient_Req`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Req`
--
ALTER TABLE `Req`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Req_Detail`
--
ALTER TABLE `Req_Detail`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BloodStock`
--
ALTER TABLE `BloodStock`
  ADD CONSTRAINT `bloodstock_ibfk_1` FOREIGN KEY (`BloodType_Id`) REFERENCES `BloodType` (`Id`),
  ADD CONSTRAINT `bloodstock_ibfk_2` FOREIGN KEY (`Donor_Id`) REFERENCES `Donor` (`Id`);

--
-- Constraints for table `Donation`
--
ALTER TABLE `Donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`ReqDetail_Id`) REFERENCES `Req_Detail` (`Id`),
  ADD CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`BloodStock_Id`) REFERENCES `BloodStock` (`Id`);

--
-- Constraints for table `Donor`
--
ALTER TABLE `Donor`
  ADD CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`Donor_Id`) REFERENCES `Donor_Req` (`Id`);

--
-- Constraints for table `Donor_Req`
--
ALTER TABLE `Donor_Req`
  ADD CONSTRAINT `donor_req_ibfk_1` FOREIGN KEY (`BloodType_Id`) REFERENCES `BloodType` (`Id`),
  ADD CONSTRAINT `donor_req_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `User` (`Id`);

--
-- Constraints for table `Hospital`
--
ALTER TABLE `Hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`Hospital_Id`) REFERENCES `Hospital_Req` (`Id`);

--
-- Constraints for table `Patient`
--
ALTER TABLE `Patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `Patient_Req` (`Id`);

--
-- Constraints for table `Patient_Req`
--
ALTER TABLE `Patient_Req`
  ADD CONSTRAINT `patient_req_ibfk_1` FOREIGN KEY (`BloodType_Id`) REFERENCES `BloodType` (`Id`);

--
-- Constraints for table `Req`
--
ALTER TABLE `Req`
  ADD CONSTRAINT `req_ibfk_1` FOREIGN KEY (`Hospital_Req_Id`) REFERENCES `Hospital_Req` (`Id`),
  ADD CONSTRAINT `req_ibfk_2` FOREIGN KEY (`Patient_Req_Id`) REFERENCES `Patient_Req` (`Id`);

--
-- Constraints for table `Req_Detail`
--
ALTER TABLE `Req_Detail`
  ADD CONSTRAINT `req_detail_ibfk_1` FOREIGN KEY (`Req_Id`) REFERENCES `Req` (`Id`),
  ADD CONSTRAINT `req_detail_ibfk_2` FOREIGN KEY (`BloodType_Id`) REFERENCES `BloodType` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
