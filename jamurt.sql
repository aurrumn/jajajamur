-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2020 at 09:38 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jamurt`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE IF NOT EXISTS `detail_periksa` (
`id_detail_periksa` int(5) NOT NULL,
  `id_periksa` int(5) NOT NULL,
  `id_subkriteria` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE IF NOT EXISTS `gender` (
`id_gender` int(1) NOT NULL,
  `keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id_gender`, `keterangan`) VALUES
(1, 'Laki'),
(2, 'Puan'),
(3, 'Laki'),
(4, 'Puan');

-- --------------------------------------------------------

--
-- Table structure for table `jamur`
--

CREATE TABLE IF NOT EXISTS `jamur` (
`id_jamur` int(5) NOT NULL,
  `id_rak` int(3) NOT NULL,
  `id_petugas` int(5) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `berat` int(5) NOT NULL,
  `status_jamur` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE IF NOT EXISTS `kriteria` (
`id_kriteria` int(2) NOT NULL,
  `kriteria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `levelakses`
--

CREATE TABLE IF NOT EXISTS `levelakses` (
`id_akses` int(1) NOT NULL,
  `keterangan_akses` varchar(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levelakses`
--

INSERT INTO `levelakses` (`id_akses`, `keterangan_akses`) VALUES
(1, 'Owner'),
(2, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE IF NOT EXISTS `periksa` (
`id_periksa` int(5) NOT NULL,
  `id_jamur` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `id_petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promethee`
--

CREATE TABLE IF NOT EXISTS `promethee` (
`id_promethee` int(7) NOT NULL,
  `id_jamur` int(5) NOT NULL,
  `leaving_flow` double NOT NULL,
  `entering_flow` double NOT NULL,
  `net_flow` double NOT NULL,
  `tanggal_perhitungan` date NOT NULL,
  `petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rakjamur`
--

CREATE TABLE IF NOT EXISTS `rakjamur` (
`id_rak` int(3) NOT NULL,
  `nama_rak` varchar(30) NOT NULL,
  `lokasi` varchar(70) NOT NULL,
  `tgl_rak` date NOT NULL,
  `jenis_kelamin` int(1) NOT NULL,
  `status_aktif` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statusaktif`
--

CREATE TABLE IF NOT EXISTS `statusaktif` (
`id_aktif` int(1) NOT NULL,
  `keterangan_aktif` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statusaktif`
--

INSERT INTO `statusaktif` (`id_aktif`, `keterangan_aktif`) VALUES
(1, 'Active'),
(2, 'Non-Active');

-- --------------------------------------------------------

--
-- Table structure for table `status_jamurt`
--

CREATE TABLE IF NOT EXISTS `status_jamurt` (
`id_status` int(1) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_kriteria`
--

CREATE TABLE IF NOT EXISTS `sub_kriteria` (
`id_sub_kriteria` int(2) NOT NULL,
  `id_kriteria` int(2) NOT NULL,
  `sub_kriteria` varchar(70) NOT NULL,
  `bobot` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(5) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `jenis_kelamin` int(1) NOT NULL,
  `telephone` varchar(12) NOT NULL,
  `status_aktif` int(1) NOT NULL,
  `level_akses` int(1) NOT NULL,
  `mulai_kerja` date DEFAULT NULL,
  `akhir_kerja` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `alamat`, `jenis_kelamin`, `telephone`, `status_aktif`, `level_akses`, `mulai_kerja`, `akhir_kerja`) VALUES
(1, 'Yuca', '123qwe', 'AkbarYuca', 'Jalan Pinggir Jalan', 1, '082139155149', 1, 1, '2020-08-18', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
 ADD PRIMARY KEY (`id_detail_periksa`), ADD UNIQUE KEY `id_periksa` (`id_periksa`,`id_subkriteria`), ADD KEY `id_subkriteria` (`id_subkriteria`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
 ADD PRIMARY KEY (`id_gender`);

--
-- Indexes for table `jamur`
--
ALTER TABLE `jamur`
 ADD PRIMARY KEY (`id_jamur`), ADD UNIQUE KEY `id_rak` (`id_rak`,`id_petugas`), ADD UNIQUE KEY `status_jamur` (`status_jamur`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
 ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `levelakses`
--
ALTER TABLE `levelakses`
 ADD PRIMARY KEY (`id_akses`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
 ADD PRIMARY KEY (`id_periksa`), ADD UNIQUE KEY `id_jamur` (`id_jamur`,`id_petugas`);

--
-- Indexes for table `promethee`
--
ALTER TABLE `promethee`
 ADD PRIMARY KEY (`id_promethee`), ADD UNIQUE KEY `id_jamur` (`id_jamur`,`petugas`), ADD KEY `petugas` (`petugas`);

--
-- Indexes for table `rakjamur`
--
ALTER TABLE `rakjamur`
 ADD PRIMARY KEY (`id_rak`), ADD UNIQUE KEY `jenis_kelamin` (`jenis_kelamin`,`status_aktif`);

--
-- Indexes for table `statusaktif`
--
ALTER TABLE `statusaktif`
 ADD PRIMARY KEY (`id_aktif`);

--
-- Indexes for table `status_jamurt`
--
ALTER TABLE `status_jamurt`
 ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
 ADD PRIMARY KEY (`id_sub_kriteria`), ADD UNIQUE KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`), ADD UNIQUE KEY `jenis_kelamin` (`jenis_kelamin`), ADD UNIQUE KEY `status_aktif` (`status_aktif`,`level_akses`), ADD KEY `level_akses` (`level_akses`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
MODIFY `id_detail_periksa` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
MODIFY `id_gender` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jamur`
--
ALTER TABLE `jamur`
MODIFY `id_jamur` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
MODIFY `id_kriteria` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `levelakses`
--
ALTER TABLE `levelakses`
MODIFY `id_akses` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
MODIFY `id_periksa` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `promethee`
--
ALTER TABLE `promethee`
MODIFY `id_promethee` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rakjamur`
--
ALTER TABLE `rakjamur`
MODIFY `id_rak` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `statusaktif`
--
ALTER TABLE `statusaktif`
MODIFY `id_aktif` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `status_jamurt`
--
ALTER TABLE `status_jamurt`
MODIFY `id_status` int(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
MODIFY `id_sub_kriteria` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_subkriteria`) REFERENCES `sub_kriteria` (`id_sub_kriteria`),
ADD CONSTRAINT `detail_periksa_ibfk_2` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id_periksa`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_jamur`) REFERENCES `jamur` (`id_jamur`);

--
-- Constraints for table `promethee`
--
ALTER TABLE `promethee`
ADD CONSTRAINT `promethee_ibfk_1` FOREIGN KEY (`id_jamur`) REFERENCES `jamur` (`id_jamur`),
ADD CONSTRAINT `promethee_ibfk_2` FOREIGN KEY (`petugas`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `rakjamur`
--
ALTER TABLE `rakjamur`
ADD CONSTRAINT `rakjamur_ibfk_1` FOREIGN KEY (`id_rak`) REFERENCES `jamur` (`id_rak`);

--
-- Constraints for table `status_jamurt`
--
ALTER TABLE `status_jamurt`
ADD CONSTRAINT `status_jamurt_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `jamur` (`status_jamur`);

--
-- Constraints for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
ADD CONSTRAINT `sub_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level_akses`) REFERENCES `levelakses` (`id_akses`),
ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`status_aktif`) REFERENCES `statusaktif` (`id_aktif`),
ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`jenis_kelamin`) REFERENCES `gender` (`id_gender`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
