-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2021 at 02:47 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examenvoorbereiding2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `artikelcode` int(11) NOT NULL,
  `artikel` varchar(255) DEFAULT NULL,
  `prijs` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bestelling`
--

CREATE TABLE `bestelling` (
  `Artikelcode` int(11) NOT NULL,
  `Winkelcode` int(11) DEFAULT NULL,
  `Aantal` int(11) DEFAULT NULL,
  `Klantcode` int(11) DEFAULT NULL,
  `Medewerkerscode` int(11) DEFAULT NULL,
  `Afgehaald` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `factuur`
--

CREATE TABLE `factuur` (
  `factuurnummer` int(11) NOT NULL,
  `factuurdatum` datetime DEFAULT NULL,
  `klantcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `factuurregel`
--

CREATE TABLE `factuurregel` (
  `factuurnummer` int(11) NOT NULL,
  `artikelcode` int(11) DEFAULT NULL,
  `aantal` int(11) DEFAULT NULL,
  `prijs` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klant`
--

CREATE TABLE `klant` (
  `klantcode` int(11) NOT NULL,
  `voorletters` varchar(255) DEFAULT NULL,
  `tussenvoegsels` varchar(255) DEFAULT NULL,
  `achternaam` varchar(255) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `woonplaats` varchar(255) DEFAULT NULL,
  `geboortedatum` date DEFAULT NULL,
  `gebruikersnaam` varchar(255) DEFAULT NULL,
  `wachtwoord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medewerker`
--

CREATE TABLE `medewerker` (
  `medewerkerscode` int(11) NOT NULL,
  `voorletters` varchar(255) DEFAULT NULL,
  `voorvoegsels` varchar(255) DEFAULT NULL,
  `achternaam` varchar(255) DEFAULT NULL,
  `gebruikersnaam` varchar(255) DEFAULT NULL,
  `wachtwoord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `winkel`
--

CREATE TABLE `winkel` (
  `winkelcode` int(11) NOT NULL,
  `winkelnaam` varchar(255) DEFAULT NULL,
  `winkeladres` varchar(255) DEFAULT NULL,
  `winkelpostcode` varchar(255) DEFAULT NULL,
  `vestigingsplaats` varchar(255) DEFAULT NULL,
  `telefoonnummer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artikelcode`);

--
-- Indexes for table `bestelling`
--
ALTER TABLE `bestelling`
  ADD KEY `Artikelcode` (`Artikelcode`),
  ADD KEY `Winkelcode` (`Winkelcode`),
  ADD KEY `Klantcode` (`Klantcode`),
  ADD KEY `Medewerkerscode` (`Medewerkerscode`);

--
-- Indexes for table `factuur`
--
ALTER TABLE `factuur`
  ADD PRIMARY KEY (`factuurnummer`),
  ADD KEY `klantcode` (`klantcode`);

--
-- Indexes for table `factuurregel`
--
ALTER TABLE `factuurregel`
  ADD PRIMARY KEY (`factuurnummer`),
  ADD KEY `artikelcode` (`artikelcode`);

--
-- Indexes for table `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`klantcode`);

--
-- Indexes for table `medewerker`
--
ALTER TABLE `medewerker`
  ADD PRIMARY KEY (`medewerkerscode`);

--
-- Indexes for table `winkel`
--
ALTER TABLE `winkel`
  ADD PRIMARY KEY (`winkelcode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bestelling`
--
ALTER TABLE `bestelling`
  ADD CONSTRAINT `bestelling_ibfk_1` FOREIGN KEY (`Artikelcode`) REFERENCES `artikel` (`artikelcode`),
  ADD CONSTRAINT `bestelling_ibfk_2` FOREIGN KEY (`Winkelcode`) REFERENCES `winkel` (`winkelcode`),
  ADD CONSTRAINT `bestelling_ibfk_3` FOREIGN KEY (`Klantcode`) REFERENCES `klant` (`klantcode`),
  ADD CONSTRAINT `bestelling_ibfk_4` FOREIGN KEY (`Medewerkerscode`) REFERENCES `medewerker` (`medewerkerscode`);

--
-- Constraints for table `factuur`
--
ALTER TABLE `factuur`
  ADD CONSTRAINT `factuur_ibfk_1` FOREIGN KEY (`klantcode`) REFERENCES `klant` (`klantcode`);

--
-- Constraints for table `factuurregel`
--
ALTER TABLE `factuurregel`
  ADD CONSTRAINT `factuurregel_ibfk_1` FOREIGN KEY (`artikelcode`) REFERENCES `artikel` (`artikelcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
