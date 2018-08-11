-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2018 at 12:47 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simguru`
--

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `idkecamatan` smallint(6) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`idkecamatan`, `nama_kecamatan`) VALUES
(1, 'TEBING'),
(2, 'KARIMUN'),
(3, 'MERAL'),
(4, 'MORO'),
(5, 'BURU'),
(6, 'DURAI'),
(7, 'KUNDUR'),
(8, 'KUNDUR UTARA'),
(9, 'KUNDUR BARAT'),
(11, 'MERAL BARAT'),
(12, 'UNGAR'),
(13, 'BELAT');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas_user`
--

CREATE TABLE `log_aktivitas_user` (
  `idlog` bigint(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `halaman` varchar(100) NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `date_activity` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_aktivitas_user`
--

INSERT INTO `log_aktivitas_user` (`idlog`, `userid`, `username`, `halaman`, `aktivitas`, `date_activity`) VALUES
(1, 1, 'admin', 'logout', 'berhasil keluar dari sistem simonev', '2018-07-04 17:38:13'),
(2, 1, 'admin', 'logout', 'berhasil keluar dari sistem simonev', '2018-07-11 05:44:20'),
(3, 1, 'admin', 'logout', 'berhasil keluar dari sistem simonev', '2018-07-12 07:38:11'),
(4, 1, 'admin', 'm.default.setting.UserDISDIK', 'Menambah data user dengan username ( test) berhasil dilakukan.', '2018-07-16 09:19:46'),
(5, 1, 'admin', 'm.default.setting.UserDISDIK', 'Menambah data user dengan username ( rizki) berhasil dilakukan.', '2018-07-16 09:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE `sekolah` (
  `kode` varchar(25) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `idkecamatan` smallint(6) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jumlah_rombel` smallint(6) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sekolah`
--

INSERT INTO `sekolah` (`kode`, `nama`, `alamat`, `idkecamatan`, `email`, `jumlah_rombel`, `status`) VALUES
('11', '22', '33', 1, 'm_rizki_r@yacanet.com', 44, 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `group`, `key`, `value`) VALUES
(3, 'general', 'default_ta', '2018'),
(11, 'backup', 'jumlah_file_backup', '5');

-- --------------------------------------------------------

--
-- Table structure for table `status_kepegawaian`
--

CREATE TABLE `status_kepegawaian` (
  `kode` smallint(6) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_kepegawaian`
--

INSERT INTO `status_kepegawaian` (`kode`, `status`) VALUES
(1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` smallint(6) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `userpassword` varchar(80) NOT NULL,
  `salt` varchar(7) NOT NULL,
  `page` enum('m','d','s','p') NOT NULL DEFAULT 'm',
  `kode_sekolah` varchar(25) NOT NULL,
  `email` varchar(150) NOT NULL,
  `idsekolah` smallint(6) NOT NULL,
  `theme` varchar(25) NOT NULL,
  `photo_profile` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `userpassword`, `salt`, `page`, `kode_sekolah`, `email`, `idsekolah`, `theme`, `photo_profile`, `active`) VALUES
(1, 'admin', '13cfedd9284ee180e70eb81536cd29a6a9159afa07d5fa1e23d54203d5e3b756', 'd6097e', 'm', '0', 'm_rizki_r@yacanet.com', 0, 'default', 'resources/userimages/no_photo.png', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`idkecamatan`);

--
-- Indexes for table `log_aktivitas_user`
--
ALTER TABLE `log_aktivitas_user`
  ADD PRIMARY KEY (`idlog`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `idkecamatan` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `log_aktivitas_user`
--
ALTER TABLE `log_aktivitas_user`
  MODIFY `idlog` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  MODIFY `kode` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
