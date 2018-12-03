-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2018 at 03:43 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simulasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `bibit`
--

CREATE TABLE `bibit` (
  `idBibit` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `idGudang` int(10) NOT NULL,
  `hasil` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lahan`
--

CREATE TABLE `lahan` (
  `idLahan` int(10) NOT NULL,
  `iduser` int(10) NOT NULL,
  `idBibit` int(10) NOT NULL,
  `idPupuk` int(10) NOT NULL,
  `idGudang` int(10) NOT NULL,
  `luaslahan` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pupuk`
--

CREATE TABLE `pupuk` (
  `idPupuk` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bibit`
--
ALTER TABLE `bibit`
  ADD PRIMARY KEY (`idBibit`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`idGudang`);

--
-- Indexes for table `lahan`
--
ALTER TABLE `lahan`
  ADD PRIMARY KEY (`idLahan`),
  ADD KEY `iduser` (`iduser`),
  ADD KEY `idBibit` (`idBibit`),
  ADD KEY `idPupuk` (`idPupuk`),
  ADD KEY `idGudang` (`idGudang`);

--
-- Indexes for table `pupuk`
--
ALTER TABLE `pupuk`
  ADD PRIMARY KEY (`idPupuk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bibit`
--
ALTER TABLE `bibit`
  MODIFY `idBibit` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `idGudang` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lahan`
--
ALTER TABLE `lahan`
  MODIFY `idLahan` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pupuk`
--
ALTER TABLE `pupuk`
  MODIFY `idPupuk` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lahan`
--
ALTER TABLE `lahan`
  ADD CONSTRAINT `lahan_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `lahan_ibfk_2` FOREIGN KEY (`idPupuk`) REFERENCES `pupuk` (`idPupuk`),
  ADD CONSTRAINT `lahan_ibfk_3` FOREIGN KEY (`idGudang`) REFERENCES `gudang` (`idGudang`),
  ADD CONSTRAINT `lahan_ibfk_4` FOREIGN KEY (`idBibit`) REFERENCES `bibit` (`idBibit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
