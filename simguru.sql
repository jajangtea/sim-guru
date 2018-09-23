-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2018 at 05:06 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

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
-- Table structure for table `bidang_studi_sertifikasi`
--

CREATE TABLE `bidang_studi_sertifikasi` (
  `kode` varchar(25) NOT NULL,
  `nama_bidang_studi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidang_studi_sertifikasi`
--

INSERT INTO `bidang_studi_sertifikasi` (`kode`, `nama_bidang_studi`) VALUES
('B002', 'INGGRIS');

-- --------------------------------------------------------

--
-- Table structure for table `golongan`
--

CREATE TABLE `golongan` (
  `kode` varchar(10) NOT NULL,
  `pangkat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `golongan`
--

INSERT INTO `golongan` (`kode`, `pangkat`) VALUES
('IA', 'JURU MUDA'),
('IB', 'JURU MUDA TINGKAT I'),
('IC', 'JURU'),
('ID', 'JURU TINGKAT I'),
('IIA', 'PENGATUR MUDA'),
('IIB', 'PENGATUR MUDA TINGKAT I'),
('IIC', 'PENGATUR'),
('IID', 'PENGATUR TINGKAT I'),
('IIIA', 'PENATA MUDA'),
('IIIB', 'PENATA MUDA TINGKAT I'),
('IIIC', 'PENATA'),
('IIID', 'PENATA TINGKAT I'),
('IVA', 'PEMBINA'),
('IVB', 'PEMBINA TINGKAT I'),
('IVC', 'PEMBINA UTAMA MUDA'),
('IVD', 'PEMBINA UTAMA MADYA'),
('IVE', 'PEMBINA UTAMA');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama_jabatan`) VALUES
(1, 'Wakil Kepala Sekolah'),
(2, 'Wali Kelas'),
(3, 'Kepala Perpustakaan'),
(4, 'Kepala Laboratorium');

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
(5, 1, 'admin', 'm.default.setting.UserDISDIK', 'Menambah data user dengan username ( rizki) berhasil dilakukan.', '2018-07-16 09:21:56'),
(6, 4, 'jajangtea', 'm.default.setting.UserSekolah', 'Menambah data user dengan username ( tes) berhasil dilakukan.', '2018-08-17 21:55:19'),
(7, 4, 'jajangtea', 'm.default.setting.UserSekolah', 'Menambah data user dengan username ( dsafdad) berhasil dilakukan.', '2018-08-17 22:30:03'),
(8, 4, 'jajangtea', 'm.default.setting.UserSekolah', 'Menambah data user dengan username ( 1) berhasil dilakukan.', '2018-08-17 22:32:59'),
(9, 4, 'jajangtea', 'm.default.setting.UserSekolah', 'Menambah data user dengan username ( 2) berhasil dilakukan.', '2018-08-17 22:33:29'),
(10, 4, 'jajangtea', 'm.default.setting.UserSekolah', 'Mengubah data user dengan username ( ) berhasil dilakukan.', '2018-08-17 23:19:15'),
(11, 4, 'jajangtea', 'm.default.setting.UserSekolah', 'Mengubah data user dengan username ( jajangtean) berhasil dilakukan.', '2018-08-17 23:30:26'),
(12, 4, 'jajangtea', 'm.default.setting.UserSekolah', 'Mengubah data user dengan username ( boboho) berhasil dilakukan.', '2018-08-17 23:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(25) NOT NULL,
  `nuptk` varchar(25) DEFAULT NULL,
  `npwp` varchar(25) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gol_ruang` varchar(10) DEFAULT NULL,
  `pangkat` varchar(100) DEFAULT NULL,
  `status_kepegawaian` varchar(25) NOT NULL,
  `status_perkawinan` varchar(25) DEFAULT NULL,
  `nama_suami_istri` varchar(100) DEFAULT NULL,
  `no_kartu` varchar(25) DEFAULT NULL,
  `no_karis` varchar(25) DEFAULT NULL,
  `no_karsu` varchar(25) DEFAULT NULL,
  `no_rek` varchar(25) DEFAULT NULL,
  `nm_bank` varchar(100) DEFAULT NULL,
  `rek_bank_an` varchar(100) DEFAULT NULL,
  `kode_sekolah` smallint(6) DEFAULT NULL COMMENT 'kode sekolah',
  `tmt` date DEFAULT NULL,
  `status_sertifikasi` varchar(25) DEFAULT NULL,
  `kode_bidang_studi` varchar(25) DEFAULT NULL COMMENT 'kode bidang studi',
  `th_sertifikasi` varchar(4) DEFAULT NULL,
  `no_sertifikasi` varchar(25) DEFAULT NULL,
  `no_nuks` varchar(25) DEFAULT NULL,
  `tgl_nuks_sertifikat` date DEFAULT NULL,
  `predikat_nuks_sertifikat` varchar(25) DEFAULT NULL,
  `berjenjang_sertifikat` varchar(25) DEFAULT NULL,
  `th_berjenjang_sertifikat` varchar(4) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nuptk`, `npwp`, `nama_lengkap`, `jk`, `tempat_lahir`, `tgl_lahir`, `agama`, `email`, `gol_ruang`, `pangkat`, `status_kepegawaian`, `status_perkawinan`, `nama_suami_istri`, `no_kartu`, `no_karis`, `no_karsu`, `no_rek`, `nm_bank`, `rek_bank_an`, `kode_sekolah`, `tmt`, `status_sertifikasi`, `kode_bidang_studi`, `th_sertifikasi`, `no_sertifikasi`, `no_nuks`, `tgl_nuks_sertifikat`, `predikat_nuks_sertifikat`, `berjenjang_sertifikat`, `th_berjenjang_sertifikat`, `no_hp`, `alamat`) VALUES
('1', NULL, NULL, 'Jono', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat`
--

CREATE TABLE `riwayat` (
  `id_riwayat` int(11) NOT NULL,
  `nm_riwayat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riwayat`
--

INSERT INTO `riwayat` (`id_riwayat`, `nm_riwayat`) VALUES
(1, 'Kepangkatan'),
(2, 'Pekerjaan'),
(3, 'Tugas Tambahan - Kepala Sekolah'),
(4, 'Pendidikan'),
(5, 'Pendidikan dan Pelatihan (DIKLAT)'),
(6, 'Buku '),
(7, 'Kegiatan Belajar'),
(8, 'Tugas Tambahan Pegawai'),
(9, 'Tunjangan'),
(10, 'Penghargaan'),
(11, 'Anak');

-- --------------------------------------------------------

--
-- Table structure for table `r_anak`
--

CREATE TABLE `r_anak` (
  `id` int(11) NOT NULL,
  `nm_anak` varchar(200) DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_buku`
--

CREATE TABLE `r_buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(250) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `penerbit` varchar(200) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_diklat`
--

CREATE TABLE `r_diklat` (
  `id` int(11) NOT NULL,
  `nm_diklat` varchar(200) DEFAULT NULL,
  `penyelenggara` varchar(200) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `jml_jam` decimal(10,0) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_kegiatan_belajar`
--

CREATE TABLE `r_kegiatan_belajar` (
  `id` int(11) NOT NULL,
  `nm_sekolah` varchar(25) DEFAULT NULL,
  `mt_pelajaran` varchar(100) DEFAULT NULL,
  `jml_jam` int(11) DEFAULT NULL,
  `ta` varchar(10) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_kepangkatan`
--

CREATE TABLE `r_kepangkatan` (
  `id` int(11) NOT NULL,
  `golongan` varchar(5) DEFAULT NULL,
  `pangkat` varchar(100) DEFAULT NULL,
  `nomor_sk` varchar(25) DEFAULT NULL,
  `tanggal_sk` date DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `pendidikan` varchar(100) DEFAULT NULL,
  `unit_kerja` varchar(25) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_kepangkatan`
--

INSERT INTO `r_kepangkatan` (`id`, `golongan`, `pangkat`, `nomor_sk`, `tanggal_sk`, `tmt`, `pendidikan`, `unit_kerja`, `nip`) VALUES
(1, 'IA', 'Pembina', '1', '2018-08-14', '2018-08-21', 'Sarjana', '3213', '1'),
(2, 'IB', '4', 'rew', '2018-09-07', '2018-09-07', 'e', '3213', '1');

-- --------------------------------------------------------

--
-- Table structure for table `r_pekerjaan_guru`
--

CREATE TABLE `r_pekerjaan_guru` (
  `id` int(11) NOT NULL,
  `nm_sekolah` varchar(25) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_pekerjaan_guru`
--

INSERT INTO `r_pekerjaan_guru` (`id`, `nm_sekolah`, `tmt`, `nip`) VALUES
(1, '3213', '2018-09-09', '1');

-- --------------------------------------------------------

--
-- Table structure for table `r_pendidikan`
--

CREATE TABLE `r_pendidikan` (
  `id` int(11) NOT NULL,
  `jenjang` varchar(25) DEFAULT NULL,
  `nm_jurusan` varchar(100) DEFAULT NULL,
  `nm_sekolah` varchar(100) DEFAULT NULL,
  `th_lulus` int(11) DEFAULT NULL,
  `ipk` decimal(10,0) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_pendidikan`
--

INSERT INTO `r_pendidikan` (`id`, `jenjang`, `nm_jurusan`, `nm_sekolah`, `th_lulus`, `ipk`, `nip`) VALUES
(1, 'SD', 'D', 'A', 2015, '4', '1');

-- --------------------------------------------------------

--
-- Table structure for table `r_penghargaan`
--

CREATE TABLE `r_penghargaan` (
  `id` int(11) NOT NULL,
  `nm_penghargaan` varchar(100) DEFAULT NULL,
  `nm_instansi_pemberi` varchar(100) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_penghargaan`
--

INSERT INTO `r_penghargaan` (`id`, `nm_penghargaan`, `nm_instansi_pemberi`, `tahun`, `nip`) VALUES
(2, 'DS', 'DS', '2016', '1');

-- --------------------------------------------------------

--
-- Table structure for table `r_tt_kasek`
--

CREATE TABLE `r_tt_kasek` (
  `id` int(11) NOT NULL,
  `nm_sekolah` varchar(25) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_tt_pegawai`
--

CREATE TABLE `r_tt_pegawai` (
  `id` int(11) NOT NULL,
  `tmt` date DEFAULT NULL,
  `nomor_sk` varchar(25) DEFAULT NULL,
  `ta` int(10) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  `id_jabatan` int(11) NOT NULL,
  `kode` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_tunjangan`
--

CREATE TABLE `r_tunjangan` (
  `id` int(11) NOT NULL,
  `nm_tunjangan` varchar(100) DEFAULT NULL,
  `nm_instansi_pemberi` varchar(100) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_tunjangan`
--

INSERT INTO `r_tunjangan` (`id`, `nm_tunjangan`, `nm_instansi_pemberi`, `tahun`, `nip`) VALUES
(1, 'BEASISWA BUDI', 'DIKTI', '2011', '1');

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
('3213', 'SMKN 4 TANJUNGPINANG', 'JALAN NUSANTARA KM 14 TANJUNGPINANG', 7, 'smkn4tpi@mail.com', 30, 1);

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
(100, 'aktif'),
(101, 'TIDAK');

-- --------------------------------------------------------

--
-- Table structure for table `ta`
--

CREATE TABLE `ta` (
  `id` int(11) NOT NULL,
  `tahun_ajaran` varchar(20) NOT NULL,
  `semester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ta`
--

INSERT INTO `ta` (`id`, `tahun_ajaran`, `semester`) VALUES
(1, '2010/2011', 'Ganjil'),
(2, '2010/2011', 'Genap');

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
  `theme` varchar(25) NOT NULL,
  `photo_profile` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `userpassword`, `salt`, `page`, `kode_sekolah`, `email`, `theme`, `photo_profile`, `active`) VALUES
(1, 'admin', '13cfedd9284ee180e70eb81536cd29a6a9159afa07d5fa1e23d54203d5e3b756', 'd6097e', 'm', '3213', 'm_rizki_r@yacanet.com', 'default', 'resources/userimages/no_photo.png', 1),
(4, 'jajangtea', '8fd8cc1665edbac5c39a6fa546a4fae7c9df5a6894e0eaaa86da7fe831793a69', '332398', 'm', '3213', 'm_rizki_r@yacanet.com', 'default', 'resources/userimages/no_photo.png', 1),
(5, 'tes', 'e1b0e813713f62a104b854846a5559f469fe9d7f9e1f325de2e7f810a02ee535', 'e0d8e2', 'm', '3213', '', 'default', 'resources/userimages/no_photo.png', 1),
(6, 'boboho', '149495fb6692f84b901be7380421fe0264b4f758548c312b078cfc6056f07182', '8316ca', 'm', '3213', '', 'default', 'resources/userimages/no_photo.png', 1),
(7, '1', 'c1f250eb0d0699cd7e0ace3159f149f73ab1ff297bbea8f5dff365bd0c92fce8', '6f143e', 'm', '3213', '', 'default', 'resources/userimages/no_photo.png', 1),
(8, '2', '6053cee5c9539abd8f4c4f20663e32016e42baf611f78bc4910591aab686f066', '12b583', 'm', '3213', '', 'default', 'resources/userimages/no_photo.png', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bidang_studi_sertifikasi`
--
ALTER TABLE `bidang_studi_sertifikasi`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_riwayat`);

--
-- Indexes for table `r_anak`
--
ALTER TABLE `r_anak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_buku`
--
ALTER TABLE `r_buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_diklat`
--
ALTER TABLE `r_diklat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_kegiatan_belajar`
--
ALTER TABLE `r_kegiatan_belajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_kepangkatan`
--
ALTER TABLE `r_kepangkatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_kerja` (`unit_kerja`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_pekerjaan_guru`
--
ALTER TABLE `r_pekerjaan_guru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nm_sekolah` (`nm_sekolah`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_pendidikan`
--
ALTER TABLE `r_pendidikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_penghargaan`
--
ALTER TABLE `r_penghargaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_tt_kasek`
--
ALTER TABLE `r_tt_kasek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `r_tt_pegawai`
--
ALTER TABLE `r_tt_pegawai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idJabatan` (`id_jabatan`),
  ADD KEY `kode` (`kode`),
  ADD KEY `nip` (`nip`),
  ADD KEY `ta` (`ta`);

--
-- Indexes for table `r_tunjangan`
--
ALTER TABLE `r_tunjangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

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
-- Indexes for table `ta`
--
ALTER TABLE `ta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `idkecamatan` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `log_aktivitas_user`
--
ALTER TABLE `log_aktivitas_user`
  MODIFY `idlog` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `r_anak`
--
ALTER TABLE `r_anak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_buku`
--
ALTER TABLE `r_buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_diklat`
--
ALTER TABLE `r_diklat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_kegiatan_belajar`
--
ALTER TABLE `r_kegiatan_belajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_kepangkatan`
--
ALTER TABLE `r_kepangkatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_pekerjaan_guru`
--
ALTER TABLE `r_pekerjaan_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_pendidikan`
--
ALTER TABLE `r_pendidikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_penghargaan`
--
ALTER TABLE `r_penghargaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_tt_kasek`
--
ALTER TABLE `r_tt_kasek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_tt_pegawai`
--
ALTER TABLE `r_tt_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_tunjangan`
--
ALTER TABLE `r_tunjangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  MODIFY `kode` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `ta`
--
ALTER TABLE `ta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `r_anak`
--
ALTER TABLE `r_anak`
  ADD CONSTRAINT `r_anak_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_buku`
--
ALTER TABLE `r_buku`
  ADD CONSTRAINT `r_buku_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_diklat`
--
ALTER TABLE `r_diklat`
  ADD CONSTRAINT `r_diklat_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_kegiatan_belajar`
--
ALTER TABLE `r_kegiatan_belajar`
  ADD CONSTRAINT `r_kegiatan_belajar_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_kepangkatan`
--
ALTER TABLE `r_kepangkatan`
  ADD CONSTRAINT `r_kepangkatan_ibfk_2` FOREIGN KEY (`unit_kerja`) REFERENCES `sekolah` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `r_kepangkatan_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_pekerjaan_guru`
--
ALTER TABLE `r_pekerjaan_guru`
  ADD CONSTRAINT `r_pekerjaan_guru_ibfk_1` FOREIGN KEY (`nm_sekolah`) REFERENCES `sekolah` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `r_pekerjaan_guru_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_pendidikan`
--
ALTER TABLE `r_pendidikan`
  ADD CONSTRAINT `r_pendidikan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_penghargaan`
--
ALTER TABLE `r_penghargaan`
  ADD CONSTRAINT `r_penghargaan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_tt_kasek`
--
ALTER TABLE `r_tt_kasek`
  ADD CONSTRAINT `r_tt_kasek_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `r_tt_pegawai`
--
ALTER TABLE `r_tt_pegawai`
  ADD CONSTRAINT `r_tt_pegawai_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`);

--
-- Constraints for table `r_tunjangan`
--
ALTER TABLE `r_tunjangan`
  ADD CONSTRAINT `r_tunjangan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
