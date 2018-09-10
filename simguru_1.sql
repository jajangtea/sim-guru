/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 10.1.32-MariaDB : Database - simguru
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`simguru` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `simguru`;

/*Table structure for table `bidang_studi_sertifikasi` */

DROP TABLE IF EXISTS `bidang_studi_sertifikasi`;

CREATE TABLE `bidang_studi_sertifikasi` (
  `kode` varchar(25) NOT NULL,
  `nama_bidang_studi` varchar(100) NOT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bidang_studi_sertifikasi` */

insert  into `bidang_studi_sertifikasi`(`kode`,`nama_bidang_studi`) values 
('B002','INGGRIS');

/*Table structure for table `golongan` */

DROP TABLE IF EXISTS `golongan`;

CREATE TABLE `golongan` (
  `kode` varchar(10) NOT NULL,
  `pangkat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `golongan` */

insert  into `golongan`(`kode`,`pangkat`) values 
('IA','JURU MUDA'),
('IB','JURU MUDA TINGKAT I'),
('IC','JURU'),
('ID','JURU TINGKAT I'),
('IIA','PENGATUR MUDA'),
('IIB','PENGATUR MUDA TINGKAT I'),
('IIC','PENGATUR'),
('IID','PENGATUR TINGKAT I'),
('IIIA','PENATA MUDA'),
('IIIB','PENATA MUDA TINGKAT I'),
('IIIC','PENATA'),
('IIID','PENATA TINGKAT I'),
('IVA','PEMBINA'),
('IVB','PEMBINA TINGKAT I'),
('IVC','PEMBINA UTAMA MUDA'),
('IVD','PEMBINA UTAMA MADYA'),
('IVE','PEMBINA UTAMA');

/*Table structure for table `kecamatan` */

DROP TABLE IF EXISTS `kecamatan`;

CREATE TABLE `kecamatan` (
  `idkecamatan` smallint(6) NOT NULL AUTO_INCREMENT,
  `nama_kecamatan` varchar(100) NOT NULL,
  PRIMARY KEY (`idkecamatan`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `kecamatan` */

insert  into `kecamatan`(`idkecamatan`,`nama_kecamatan`) values 
(1,'TEBING'),
(2,'KARIMUN'),
(3,'MERAL'),
(4,'MORO'),
(5,'BURU'),
(6,'DURAI'),
(7,'KUNDUR'),
(8,'KUNDUR UTARA'),
(9,'KUNDUR BARAT'),
(11,'MERAL BARAT'),
(12,'UNGAR'),
(13,'BELAT');

/*Table structure for table `log_aktivitas_user` */

DROP TABLE IF EXISTS `log_aktivitas_user`;

CREATE TABLE `log_aktivitas_user` (
  `idlog` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `halaman` varchar(100) NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `date_activity` datetime NOT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `log_aktivitas_user` */

insert  into `log_aktivitas_user`(`idlog`,`userid`,`username`,`halaman`,`aktivitas`,`date_activity`) values 
(1,1,'admin','logout','berhasil keluar dari sistem simonev','2018-07-04 17:38:13'),
(2,1,'admin','logout','berhasil keluar dari sistem simonev','2018-07-11 05:44:20'),
(3,1,'admin','logout','berhasil keluar dari sistem simonev','2018-07-12 07:38:11'),
(4,1,'admin','m.default.setting.UserDISDIK','Menambah data user dengan username ( test) berhasil dilakukan.','2018-07-16 09:19:46'),
(5,1,'admin','m.default.setting.UserDISDIK','Menambah data user dengan username ( rizki) berhasil dilakukan.','2018-07-16 09:21:56');

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

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
  `alamat` tinytext,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pegawai` */

insert  into `pegawai`(`nip`,`nuptk`,`npwp`,`nama_lengkap`,`jk`,`tempat_lahir`,`tgl_lahir`,`agama`,`email`,`gol_ruang`,`pangkat`,`status_kepegawaian`,`status_perkawinan`,`nama_suami_istri`,`no_kartu`,`no_karis`,`no_karsu`,`no_rek`,`nm_bank`,`rek_bank_an`,`kode_sekolah`,`tmt`,`status_sertifikasi`,`kode_bidang_studi`,`th_sertifikasi`,`no_sertifikasi`,`no_nuks`,`tgl_nuks_sertifikat`,`predikat_nuks_sertifikat`,`berjenjang_sertifikat`,`th_berjenjang_sertifikat`,`no_hp`,`alamat`) values 
('1',NULL,NULL,'Jono',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `r_anak` */

DROP TABLE IF EXISTS `r_anak`;

CREATE TABLE `r_anak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_anak` varchar(200) DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_anak_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_anak` */

/*Table structure for table `r_buku` */

DROP TABLE IF EXISTS `r_buku`;

CREATE TABLE `r_buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(250) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `penerbit` varchar(200) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_buku_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_buku` */

/*Table structure for table `r_diklat` */

DROP TABLE IF EXISTS `r_diklat`;

CREATE TABLE `r_diklat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_diklat` varchar(200) DEFAULT NULL,
  `penyelenggara` varchar(200) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `jml_jam` decimal(10,0) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_diklat_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_diklat` */

/*Table structure for table `r_kegiatan_belajar` */

DROP TABLE IF EXISTS `r_kegiatan_belajar`;

CREATE TABLE `r_kegiatan_belajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_sekolah` varchar(25) DEFAULT NULL,
  `mt_pelajaran` varchar(100) DEFAULT NULL,
  `jml_jam` int(11) DEFAULT NULL,
  `ta` varchar(10) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_kegiatan_belajar_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_kegiatan_belajar` */

/*Table structure for table `r_kepangkatan` */

DROP TABLE IF EXISTS `r_kepangkatan`;

CREATE TABLE `r_kepangkatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `golongan` varchar(5) DEFAULT NULL,
  `pangkat` varchar(100) DEFAULT NULL,
  `nomor_sk` varchar(25) DEFAULT NULL,
  `tanggal_sk` date DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `pendidikan` varchar(100) DEFAULT NULL,
  `unit_kerja` varchar(25) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_kerja` (`unit_kerja`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_kepangkatan_ibfk_2` FOREIGN KEY (`unit_kerja`) REFERENCES `sekolah` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r_kepangkatan_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `r_kepangkatan` */

insert  into `r_kepangkatan`(`id`,`golongan`,`pangkat`,`nomor_sk`,`tanggal_sk`,`tmt`,`pendidikan`,`unit_kerja`,`nip`) values 
(1,'IA','Pembina','1','2018-08-14','2018-08-21','Sarjana','3213','1');

/*Table structure for table `r_pekerjaan_guru` */

DROP TABLE IF EXISTS `r_pekerjaan_guru`;

CREATE TABLE `r_pekerjaan_guru` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_sekolah` varchar(25) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nm_sekolah` (`nm_sekolah`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_pekerjaan_guru_ibfk_1` FOREIGN KEY (`nm_sekolah`) REFERENCES `sekolah` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r_pekerjaan_guru_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_pekerjaan_guru` */

/*Table structure for table `r_pendidikan` */

DROP TABLE IF EXISTS `r_pendidikan`;

CREATE TABLE `r_pendidikan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenjang` varchar(25) DEFAULT NULL,
  `nm_jurusan` varchar(100) DEFAULT NULL,
  `nm_sekolah` varchar(100) DEFAULT NULL,
  `th_lulus` int(11) DEFAULT NULL,
  `ipk` decimal(10,0) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_pendidikan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_pendidikan` */

/*Table structure for table `r_penghargaan` */

DROP TABLE IF EXISTS `r_penghargaan`;

CREATE TABLE `r_penghargaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_penghargaan` varchar(100) DEFAULT NULL,
  `nm_instansi_pemberi` varchar(100) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_penghargaan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_penghargaan` */

/*Table structure for table `r_tt_kasek` */

DROP TABLE IF EXISTS `r_tt_kasek`;

CREATE TABLE `r_tt_kasek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_sekolah` varchar(25) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_tt_kasek_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_tt_kasek` */

/*Table structure for table `r_tt_pegawai` */

DROP TABLE IF EXISTS `r_tt_pegawai`;

CREATE TABLE `r_tt_pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmt` date DEFAULT NULL,
  `nomor_sk` varchar(25) DEFAULT NULL,
  `ta` varchar(10) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_tt_pegawai` */

/*Table structure for table `r_tunjangan` */

DROP TABLE IF EXISTS `r_tunjangan`;

CREATE TABLE `r_tunjangan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_tunjangan` varchar(100) DEFAULT NULL,
  `nm_instansi_pemberi` varchar(100) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nip` (`nip`),
  CONSTRAINT `r_tunjangan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `r_tunjangan` */

/*Table structure for table `riwayat` */

DROP TABLE IF EXISTS `riwayat`;

CREATE TABLE `riwayat` (
  `id_riwayat` int(11) NOT NULL AUTO_INCREMENT,
  `nm_riwayat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_riwayat`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `riwayat` */

insert  into `riwayat`(`id_riwayat`,`nm_riwayat`) values 
(1,'Kepangkatan'),
(2,'Pekerjaan'),
(3,'Tugas Tambahan - Kepala Sekolah'),
(4,'Pendidikan'),
(5,'Pendidikan dan Pelatihan (DIKLAT)'),
(6,'Buku '),
(7,'Kegiatan Belajar'),
(8,'Tugas Tambahan Pegawai'),
(9,'Tunjangan'),
(10,'Penghargaan'),
(11,'Anak');

/*Table structure for table `sekolah` */

DROP TABLE IF EXISTS `sekolah`;

CREATE TABLE `sekolah` (
  `kode` varchar(25) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `idkecamatan` smallint(6) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jumlah_rombel` smallint(6) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sekolah` */

INSERT INTO `sekolah` (`kode`, `nama`, `alamat`, `idkecamatan`, `email`, `jumlah_rombel`, `status`) VALUES
('1111', 'SMPN 1 Karimun', 'Jl. Pendidikan No.100 Tg. Balai Karimun', 2, 'smpn1_karimun@yahoo.com', 22, 1),
('1112', 'SMPN 2 Karimun', 'Jl. Pendidikan No.60 Tg.Balai Karimun', 2, 'smpn_02_krm@yahoo.co.id', 15, 1),
('1113', 'SMPN 3 Karimun', 'Desa Parit I Karimun', 2, 'smpn3karimun@gmail.com', 3, 1),
('1114', 'SD-SMPN 4 Satu Atap Karimun', 'Jl. Pendidikan No. 20 Desa Tulang', 2, 'smpsmahabodhikarimun@yahoo.com', 3, 1),
('1115', 'SMPS Maha Bodhi Karimun', 'Jl. Bhakti Bukit Senang Tg.Balai Karimun', 2, 'smpsmahabodhikarimun@yahoo.com', 11, 1),
('1116', 'SMPS Santu Yusuf Karimun', 'Jl. Pertambangan Bukit Sidomulyo II', 2, 'smp_sty@yahoo.co.id', 11, 1),
('1117', 'SMPS Muhammadiyah Karimun', 'Jl. Sei.Lakam', 2, 'smpsmuhammadiyah_karimun@yahoo.co.id', 6, 1),
('1118', 'SMPS Vidya Sasana Karimun', 'Jl. Veteran No.01 Kapling Tg.Balai Karimun', 2, 'smpsvidyasasana@yahoo.com', 6, 1),
('1119', 'SMPS Darul Mukmin', 'Jl. Angkasa Sidomulyo', 2, 'smpit_darulmukmin@yahoo.co.id', 6, 1),
('1120', 'SMPN 1 Buru', 'Jl. Pendidikan Buru', 5, 'smpn1kundur@yahoo.com', 11, 1),
('1121', 'SMPN 2 Buru', 'Jl. Bukit Karya Desa Tanjung Hutan', 5, 'smp2kundur@yahoo.co.id', 6, 1),
('1122', 'SMPN 1 Meral', 'Jl. A.Yani Kp.Bukit Meral Karimun', 3, 'smpn1mk@hotmail.com', 17, 1),
('1123', 'SMPN 2 Meral', 'Jl. Raja Ishak Sungai Pasir Meral', 3, 'smpn4meral@yahoo.com', 9, 1),
('1124', 'SMPN 3 Meral', 'Jl. Jend. A.Yani No.29 Meral Karimun', 3, 'smpn5meralkarimun@gmail.com', 15, 1),
('1125', 'SMPS Bina Bangsa Meral', 'Jl. Bina Bangsa Kampung Bukit Meral', 3, 'raja_mazlan76@yahoo.com', 4, 1),
('1126', 'SMPS Al-Himmah Meral', 'Jl. Parit Lapis Rt 02 Rw 06 Gg. Yayasan Parit Lapis', 3, 'smpalhimmah@gmail.com', 6, 1),
('1127', 'SMPN 1 Meral Barat', 'Jl. Sepedas Pasir Panjang Meral Barat', 11, 'smpn2mrl@yahoo.co.id', 6, 1),
('1128', 'SMPN 2 Meral Barat', 'Jl. Letjen Suprapto Pangke Barat Meral Barat', 11, 'smpn2meralbarat@gmail.com', 9, 1),
('1129', 'SMPN 1 Tebing', 'Jl. Sungai Lakam Baru Tebing Karimun', 1, 'smpnonetebing@yahoo.com', 21, 1),
('1130', 'SMPN 2 Tebing', 'Jl. Paya Cincin Sungai Bati - Tebing', 1, 'cerdassmpbinaan@yahoo.com', 10, 1),
('1131', 'SMPN 3 Tebing', 'Jl. Penerbangan - Tebing', 1, 'rheandyevanburen@yahoo.co.id', 14, 1),
('1132', 'SMPS Imanuel Tebing', 'Jl. Sei Bati Tebing', 1, 'imanuel_smp@yahoo.com', 3, 1),
('1133', 'SD-SMPN 4 Satu Atap Tebing', 'Jl. Brigjen Katamso - Pongkar', 1, 'smpnsatap_tebing@yahoo.co.id', 5, 1),
('1134', 'SMP Islam Terpadu Cendekia', 'Jl. Kampung Harapan', 1, 'smpit_darulmukmin@yahoo.co.id', 3, 1),
('1135', 'SMPN 1 Kundur Utara', 'Jl. Hangtuah Tg.Berlian Kundur Utara', 8, 'smpn1kundurutara@gmail.com', 12, 1),
('1136', 'SMPN 2 Kundur Utara', 'Jl. Hang Nadim No.2 Prayun Kundur', 8, 'smpnegeri2kundurutara@gmail.com', 11, 1),
('1137', 'SMPN 3 Kundur Utara', 'Jl. Kampung Baru Teluk Radang', 8, 'smpn3kundurutara@yahoo.com', 3, 1),
('1138', 'SMPN 1 Belat', 'Jl. Darat Kabung Desa Penarah Kec. Belat', 13, 'smpn2_belat@yahoo.com', 7, 1),
('1139', 'SD-SMPN 2 Satu Atap Belat', 'Desa Sungai Asam Kec. Belat', 13, 'smpn2_belat@yahoo.com', 3, 1),
('1140', 'SD-SMPN 3 Satu Atap Belat', 'KM.16 Jl.Tg.Batu Sawang', 13, 'smpn3_satapbelat@yahoo.com', 3, 1),
('1141', 'SMPN 1 Kundur Barat', 'KM.16 Jl.Tg.Batu Sawang', 9, 'smpni.kuba@yahoo.com', 15, 1),
('1142', 'SMPN 2 Kundur Barat', 'Jl. Besar Padang Kundur', 9, 'smpn2kuba@gmail.com', 6, 1),
('1143', 'SMPN 3 Kundur Barat', '-', 9, 'smpntiga_kundurbarat@yahoo.com', 4, 1),
('1144', 'SMPS Darul Furqan Kundur Barat', 'JL. Pendidikan Desa Sawang Laut', 9, 'smpdarulfurqan@gmail.com', 6, 1),
('1145', 'SMPN 1 Kundur ', 'Jl. Jend.Sudirman 299 Tg.Batu Kundur', 7, 'smpn1kundur@yahoo.com', 23, 1),
('1146', 'SMPN 2 Kundur ', 'Jl. Jend.A.Yani Tg. Batu', 7, 'smp2kundur@yahoo.co.id', 13, 1),
('1147', 'SD-SMPN 3 Satu Atap Kundur ', 'Jl. Besar Desa Lubuk', 7, 'smpn3_satapkundur@yahoo.com', 5, 1),
('1148', 'SMPN 1 Ungar', 'Jl. Besar Batu limau Alai Ungar', 12, 'smpn1_ungar@yahoo.com', 9, 1),
('1149', 'SD-SMPN 2 Satu Atap Ungar', 'Jl. Kampung Tengah Desa Ngal Kec. Ungar', 12, 'sdsmpnduasatap.ungar@yahoo.co.id', 3, 1),
('1150', 'SMPN 1 Moro', 'Jl. Pangkal Lanang Moro', 4, 'smpnegeri.1moro@yahoo.com', 14, 1),
('1151', 'SMPN 2 Moro', 'Jl. Dusun Niur Ds. Keban', 4, 'smpn2moro@yahoo.co.id', 3, 1),
('1152', 'SD-SMPN 3 Satu Atap Moro', 'Dusun Setonggeng Desa Selat Mie Moro', 4, 'abdgafar99@yahoo.com', 3, 1),
('1153', 'SD-SMPN 4 Satu Atap Moro', 'Jl. Pendidikan No.14 Desa Selat Mie', 4, 'smpn04satapmoro@yahoo.co.id', 3, 1),
('1154', 'SD-SMPN 5 Satu Atap Moro ', 'Tanjung Pelanduk', 4, 'smp5satapmoro@gmail.com', 3, 1),
('1155', 'SD-SMPN 6 Satu Atap Moro ', 'Buluh Patah - Selat Mie', 4, 'rudibarus15@gmail.com', 3, 1),
('1156', 'SD-SMPN 7 Satu Atap Moro', 'Jl. Hang Tuah Desa Sugie', 4, 'sdn003moro@gmail.com', 3, 1),
('1157', 'SD-SMPN 8 Satu Atap Moro ', 'Pulau Bahan Desa Keban', 4, 'adamsriharyati@yahoo.com', 3, 1),
('1158', 'SMPN 1 Durai', 'Jl. Kapten Muchtar Durai', 6, 'smpn_durai@yahoo.co.id', 3, 1),
('1159', 'SD-SMPN 2 Satu Atap Durai', 'Jl. Teluk Serengkam', 6, 'sdsmpsatapsanglar@yahoo.co.id', 3, 1),
('1160', 'SD-SMPN 3 Satu Atap Durai', 'Pulau Semembang Durai', 6, 'hendri_hend85@yahoo.co.id', 3, 1),
('1161', 'SDN 001 Karimun', 'Jl. Pendidikan Nasional No. 101 Tg. Balai Karimun', 2, 'juninhuoke@gmail.com', 17, 1),
('1162', 'SDN 002 Karimun', 'Jl. Pendidikan Nasional No. 102 ', 2, 'sdn002karimun@gmail.com', 15, 1),
('1163', 'SDN 003 Karimun', 'Jl. Pendidikan No 61 Tg. Balai Karimun', 2, 'sdntigatelukair@yahoo.com', 16, 1),
('1164', 'SDN 004 Karimun', 'Jl. Pendidikan Tg. Balai Karimun', 2, 'sdnempat_tanjungbalaikarimun@yahoo.com', 13, 1),
('1165', 'SDN 005 Karimun', 'Parit Karimun', 2, 'muhammadrizli@gmail.com', 6, 1),
('1166', 'SDN 006 Karimun', 'Jl. Pendidikan Bukit Senang Tg. Balai / K.', 2, 'sdn006_tanjungbalaikarimun@yahoo.co.id', 13, 1),
('1167', 'SDN 007 Karimun', 'Jl. Pertambangan No. 41 Tg. Balai Karimun', 2, 'sdn007_k@yahoo.co.id', 16, 1),
('1168', 'SDN 008 Karimun', 'Jl. Pendidikan No 20 Desa Tulang', 2, 'sdn008karimun@yahoo.com', 6, 1),
('1169', 'SDS 009 Santo Yusup Karimun', 'Jl. Pertambangan Bukit Sidomulyo II Tg.Balai', 2, 'sebastiansika1@gmail.com', 13, 1),
('1170', 'SDN 010 Karimun', 'Jl. Pelabuhan Selat Mendaun Parit Karimun', 2, 'adieknazri@yahoo.com', 6, 1),
('1171', 'SDN 011 Karimun', 'Jl. Pemasyarakatan Teluk Air Tg.Balai / K.', 2, 'sdnnolsebelastelukairkarimun@yahoo.co.id', 10, 1),
('1172', 'SDN 012 Karimun', 'Jl. Bukit Naga Dusun II Sei Sikop Karimun', 2, 'sdn012karimun@yahoo.com', 6, 1),
('1173', 'SDN 013 Karimun', 'Jl. Teluk Air No 2 Tg.Balai Karimun', 2, 'sdn_013@yahoo.co.id', 13, 1),
('1174', 'SDS 014 Maha Bodhi Karimun', 'Jl. Bhakti Bukit Senang Tg.Balai Karimun', 2, 'mahabodhi_sd@yahoo.com', 23, 1),
('1175', 'SDS 015 Vidya Sasana Karimun', 'Jl. Veteran No. 1 Kapling Sei. Lakam Tg.Balai/K.', 2, 'sriwyayuk@yahoo.co.id', 13, 1),
('1176', 'SDS 016 Muhammadiyah Karimun', 'Jl. Lubuk Semut Kampung Tengah Karimun', 2, ' sds016_muhammadiyah_karimun@yahoo.co.id', 15, 1),
('1177', 'SDIT Swasta 017 Darul Mukmin Karimun', 'Jl. Angkasa Bukit Sidomulyo Tg.Balai / K.', 2, 'tutik.indrawati@gmail.com', 20, 1),
('1178', 'SDS 018 Plus Avicena Karimun', 'Jl. Telaga Harapan No. 02 RT.03 RW.05 Karimun', 2, ' jumainisagita@yahoo.co.id', 8, 1),
('1179', 'SDN 001 Buru', 'Jl. Pendidikan Buru', 5, 'ryanbae44@yahoo.co.id', 7, 1),
('1180', 'SDN 002 Buru', 'Jl. Raja Ali Haji No. 1 Tg Hutan', 5, 'sdtghutanburu@yahoo.co.id', 6, 1),
('1181', 'SDN 003 Buru', 'Jl. Duku No. 1 Tg.Batu Kecil', 5, 'sdn003buru@gmail.com', 6, 1),
('1182', 'SDN 004 Buru', 'Kayu Ara Hitam Lubuk Puding', 5, 'sdnegeri4@gmail.com', 6, 1),
('1183', 'SDN 005 Buru', 'Jl. Capang Lima  Lubuk Puding', 5, 'sdn.005.buru@gmail.com', 7, 1),
('1184', 'SDN 006 Buru', 'Jl. Baran Abang Tanjung Hutan ', 5, 'sdn006buru@gmail.com', 6, 1),
('1185', 'SDN 007 Buru', 'Jl. Mawar Ling Sentosa Pangkalan Balai', 5, 'sdnegeri_tujuhburu@yahoo.com', 6, 1),
('1186', 'SDN 008 Buru', 'Kampung Baru Tg. Batu Kecil', 5, 'sdn008buru@gmail.com', 6, 1),
('1187', 'SDN 009 Buru', 'Jl. Teluk Nibung Buru', 5, 'sdn009buru@yahoo.com', 6, 1),
('1188', 'SDN 001 Meral', 'Jl. Jend. A. Yani Meral Kota', 3, 'satumerals@yahoo.com', 13, 1),
('1189', 'SDN 002 Meral', 'Jl. A Yani Gg Awang Nur Baran II Meral', 3, 'nurdi198@gmail.com', 19, 1),
('1190', 'SDN 003 Meral', 'Jl. Let Jen Suprapto Sei. Raya', 3, 'sdn_003srm@yahoo.com', 17, 1),
('1191', 'SDN 004 Meral', 'Jl. A. Yani Sei. Pasir No. 80 Meral Kota', 3, 'sdn_004meral@yahoo.co.id', 20, 1),
('1192', 'SDS 005 Cahaya Meral', 'Jl. Jend. A. Yani Meral No. 005', 3, 'sds005_cahaya_karimun@yahoo.co.id', 28, 1),
('1193', 'SDN 006 Meral', 'Jl. Jend. A. Yani Meral No. 28', 3, 'sdn_006meral@yahoo.co.id', 17, 1),
('1194', 'SDS 007 Ora Et Labora Meral', 'Jl. Jend A. Yani No 10 Meral', 3, 'sds007oel@yahoo.com', 6, 1),
('1195', 'SDN 008 Meral', 'Jl. A. Yani Gang Awang Nur Baran', 3, 'ekosaputra367@ymail.com', 12, 1),
('1196', 'SDN 009 Meral', 'Jl. Tengku Ahmad Atan Meral', 3, 'sdn012meralkota@yahoo.co.id', 20, 1),
('1197', 'SDN 010 Meral', 'Jl. Parit Lapis', 3, 'lidiawati3112@yahoo.com', 8, 1),
('1198', 'SDN 011 Meral', 'Jl. Raja Ali Haji', 3, 'nurlela1106@yahoo.co.id', 16, 1),
('1199', 'SDS 012 Bina Bangsa Meral', 'Jl. Bina Bangsa No. 63 Meral Kota', 3, 'binabangsameral@gmail.com', 10, 1),
('1200', 'SDS Methodist Karimun', 'Jl. Poros Kampung Sukajaya', 3, '-', 4, 1),
('1201', 'SDS 001 PTKG Meral Barat', 'Jl. Sepedas Pasir Panjang', 11, 'sdswasta_ptkg@yahoo.co.id', 12, 1),
('1202', 'SDN 002 Meral Barat', 'Jl. Letjen Suprapto Pangke Barat', 11, 'sdn_008pangke@yahoo.com', 19, 1),
('1203', 'SDN 003 Meral Barat', 'Jl. Jelutung No. 008 Darussalam Meral Barat', 11, 'sdn.003.meralbarat@gmail.com', 13, 1),
('1204', 'SDN 004 Meral Barat', 'Jl. Utama No. 1 Lembah Permai Darussalam', 11, 'sdnegeri011jelutung@yahoo.co.id', 12, 1),
('1205', 'SDN 005 Meral Barat', 'Jl. Teluk Paku Pasir Panjang', 11, 'sdn.005meralbarat@yahoo.co.id', 8, 1),
('1206', 'SDN 001 Tebing', 'Jl. Pertambangan Gg Nusa Indah Kapling', 1, 'sd1kapling@yahoo.com', 3, 1),
('1207', 'SDN 002 Tebing', 'Jl. MT.Haryono Teluk Uma', 1, 'sdn002tebing_sekolah@yahoo.com', 14, 1),
('1208', 'SDN 003 Tebing', 'Jl. Pertambangan Teluk Uma', 1, 'sdn003teluk_uma@ymail.com', 23, 1),
('1209', 'SDN 004 Tebing', 'Jl. Mayjen D.I. Panjaitan No. 50 B Tebing', 1, 'azlina.abbyan@gmail.com', 15, 1),
('1210', 'SDN 005 Tebing', 'Jl. Brigjen Katamso Pongkar ', 1, 'sdn005_tebing@yahoo.com', 7, 1),
('1211', 'SDN 006 Tebing', 'Jl. Brigjen Katamso Pongkar ', 1, 'sdn_pongkar@yahoo.com', 6, 1),
('1212', 'SDN 007 Tebing', 'Jl. Penerbangan Pamak', 1, 'sdn007tebing@yahoo.com', 12, 1),
('1213', 'SDN 008 Tebing', 'Jl. Subroto Kampung Harapan Tebing', 1, 'amirsantoso1996@yahoo.com', 12, 1),
('1214', 'SDS 009 Imanuel Tebing', 'Jl. Sungai Bati Tebing', 1, 'sds.imanuel@yahoo.com', 6, 1),
('1215', 'SDS 010 Islam Terpadu Cendekia Tebing', 'Jl. Kp Harapan Kel Harjosari', 1, 'handriyawan31@gmail.com', 15, 1),
('1216', 'SDN 011 Tebing', 'Jl. Brigjen Katamso Gg. Pongkar ', 1, 'sdn011tebingkarimun@gmail.com', 6, 1),
('1217', 'SDS Maitreyawira 012 ', 'Jl. Soekarno Hatta Kampung Bangun Sari RT 001 RW 003 Kec. Tebing', 1, '-', 2, 1),
('1218', 'SDS 013 Avava Tebing', 'Jl. Pertambangan RT 004 RW 001 Tebing', 1, '-', 2, 1),
('1219', 'SDN 001 Kundur Utara', 'Jl. Parit Wagio Sungai Ungar Utara', 8, 'sdnkuta001@gmail.com', 6, 1),
('1220', 'SDN 002 Kundur Utara', 'Jl. Hang Tuah Urung', 8, 'riyan.aprizal@gmail.com', 7, 1),
('1221', 'SDN 003 Kundur Utara', 'Jl. Sudirman Urung', 8, 'sdnegeri003kundurutara@gmail.com', 6, 1),
('1222', 'SDN 004 Kundur Utara', 'Jl. Besar Parit Senang Sei. Ungar Utara', 8, 'sdn004kundurutara@gmail.com', 6, 1),
('1223', 'SDN 005 Kundur Utara', 'Jl. Hang Tuah Km.7 Urung Barat ', 8, 'sdn006urungbaratkuta@gmail.com', 6, 1),
('1224', 'SDN 006 Kundur Utara', 'Jl. Besar Kp. Baru Desa Teluk Radang', 8, 'ma2n.rocknroll@gmail.com', 9, 1),
('1225', 'SDN 007 Kundur Utara', 'Jl. Sidoardjo Km. 12 Urung Barat', 8, 'Isshaolin71@gmail.com', 6, 1),
('1226', 'SDN 008 Kundur Utara', 'Jl. Hang Tuah Tg. Berlian', 8, 'sdn011tanjungberlian@yahoo.co.id', 11, 1),
('1227', 'SDN 001 Belat', 'Jl. Batin Ondan Lebuh Belat', 13, 'sdn001belat@gmail.com', 10, 1),
('1228', 'SDN 002 Belat', 'Jl. A. Kadir Desa Sebele Belat', 13, 'sdn002belat@gmail.com', 26, 1),
('1229', 'SDN 003 Belat', 'Jl. Pendidikan No. 3 Penarah Belat', 13, 'sdntigabelat@gmail.com', 9, 1),
('1230', 'SDN 004 Belat', 'Desa Sungai Asam Belat', 13, 'sdn.sungaiasam@yahoo.com', 6, 1),
('1231', 'SDN 005 Belat', 'Degung Desa Lebuh Kec. Belat', 13, 'sdn005belat@yahoo.co.id', 11, 1),
('1232', 'SDN 006 Belat', 'Dusun 3 Bunut Sebele Desa Tebias Kec. Belat', 13, 'sdn_006_belat@yahoo.com', 6, 1),
('1233', 'SDN 007 Belat', 'Desa Sungai Asam Belat', 13, 'sdn.sedongkol@gmail.com', 6, 1),
('1234', 'SDN 001 Kundur Barat', 'Jl. Besar Sawang Kota', 9, 'rizella76@yahoo.com', 9, 1),
('1235', 'SDN 002 Kundur Barat', 'Jl. Besar Mata Air Km 27 Kundur', 9, 'dzakiyyahnurululya@gmail.com', 7, 1),
('1236', 'SDN 003 Kundur Barat', 'Jl. Besar Mengkuse Sawang Selatan', 9, 'sdn003swgselatan@gmail.com', 6, 1),
('1237', 'SDN 004 Kundur Barat', 'Jl. Besar Kundur Km 24 ', 9, 'sdn004kuba@yahoo.com', 6, 1),
('1238', 'SDN 005 Kundur Barat', 'Jl. Besar Gemuruh', 9, 'sdn005gemuruh@gmail.com', 9, 1),
('1239', 'SDN 006 Kundur Barat', 'Jl. Besar Kobel Darat', 9, 'sd_negeri006@yahoo.co.id', 6, 1),
('1240', 'SDN 007 Kundur Barat', 'Km 17 Jalan Besar Sawang', 9, 'surja_gunawan50@yahoo.com', 13, 1),
('1241', 'SDN 008 Kundur Barat', 'Jl. Dabit Sidomulyo Sawang Selatan', 9, 'sdn008kundurbarat@gmail.com', 6, 1),
('1242', 'SDN 009 Kundur Barat', 'Jl. Besar Sawang Laut No. 009', 9, 'sdn009sawanglaut@yahoo.co.id', 8, 1),
('1243', 'SDN 010 Kundur Barat', 'Jl. Hang Kasturi Komp. PT.Timah Perayun', 9, 'sdn010gemuruh@gmail.com', 10, 1),
('1244', 'SDN 011 Kundur Barat', 'Jl. Besar Sei. Layang Sawang', 9, 'sdnnolsebelas_kundurbarat@yahoo.com', 6, 1),
('1245', 'SDN 012 Kundur Barat', 'Jl. Hang Kasturi Perayun Gemuruh', 9, 'amienzsetiaku@yahoo.com', 13, 1),
('1246', 'SDN 013 Kundur Barat', 'Jl. Besar KM 14 Sawang Selatan', 9, 'mpoeh_as@ymail.com', 7, 1),
('1247', 'SDN 001 Kundur', 'Jl. Jend. Sudirman', 7, 'ina.jacka@gmail.com', 12, 1),
('1248', 'SDN 002 Kundur', 'Jl. A. Yani Tg.Batu Kota', 7, 'sdn002tg.batukota@gmail.com', 12, 1),
('1249', 'SDN 003 Kundur', 'Jl. Jend. Sudirman No. 157 Tg.Batu Kota', 7, 'jacka.aje@gmail.com', 12, 1),
('1250', 'SDN 004 Kundur', 'Jl. Jend. Sudirman No. 157 Tg.Batu Kota', 7, 'Sdn_004kundur@yahoo.com', 7, 1),
('1251', 'SDN 005 Kundur', 'Jl. Gading Tanjungsari Tg.Batu Kota', 7, 'sdn005tanjungbatu.kota@gmail.com', 10, 1),
('1252', 'SDN 006 Kundur', 'Jl. Diponegoro Km. 2 Tg.Batu Kota', 7, 'denny.a.md.kom@gmail.com', 12, 1),
('1253', 'SDN 007 Kundur', 'Jl. A. Yani Sungai Sebesi', 7, 'sdnegeri008@yahoo.com', 6, 1),
('1254', 'SDN 008 Kundur', 'Jl. Besar Sei. Ungar', 7, 'sdnegeri009sungaiungar@yahoo.com', 6, 1),
('1255', 'SDN 009 Kundur', 'Jl. Besar Sei. Ungar', 7, 'rizal.rinaldi53@yahoo.com', 6, 1),
('1256', 'SDN 010 Kundur', 'Jl. Pramuka Tg.Batu Kota', 7, 'sdn010.kundur@gmail.com', 9, 1),
('1257', 'SDN 011 Kundur', 'Jl. Sawang Km 8 Tanjungbatu Barat', 7, 'musacuy58@gmail.com', 12, 1),
('1258', 'SDN 012 Kundur', 'Jl. Parit Pacitan Sei. Ungar', 7, 'sdn012kundur@gmail.com', 6, 1),
('1259', 'SDN 013 Kundur', 'Jl. A. Latif Kebun Pinang', 7, 'didintila@gmail.com', 6, 1),
('1260', 'SDN 014 Kundur', 'Jl. H. M. Nawawi Tg. Batu Kota', 7, 'sdn016_tanjungbatukota@yahoo.com', 6, 1),
('1261', 'SDN 015 Kundur', 'Jl. Besar Desa Lubuk', 7, 'sdn015kundur@yahoo.com', 12, 1),
('1262', 'SDN 016 Kundur', 'Jl. Dewi Sartika', 7, 'sdn016kundur@gmail.com', 8, 1),
('1263', 'SDN 017 Kundur', 'Jl. Sunaryo Km. 05', 7, 'yonrose.98@gmail.com', 10, 1),
('1264', 'SDN 001 Ungar', 'Jl. Abd. Latif Kel. Alai Kec. Ungar', 12, 'zukrie.lee@gmail.com', 6, 1),
('1265', 'SDN 002 Ungar', 'Jl. M.Saleh Kampung Baru Alai', 12, 'adidarwady@ymail.com', 6, 1),
('1266', 'SDN 003 Ungar', 'Jl. Besar Batu Limau Desa Batu Limau Kec. Ungar', 12, 'opet.een@gmail.com', 6, 1),
('1267', 'SDN 004 Ungar', 'Jl. Kampung Tengah Desa Ngal Kec. Ungar', 12, 'sekolahku.ngal@yahoo.co.id', 6, 1),
('1268', 'SDN 005 Ungar', 'Jl. H. M. Sahar Ujung Beras Alai Kec. Ungar', 12, 'sdn021alai@yahoo.co.id', 6, 1),
('1269', 'SDN 006 Ungar', 'Pulau Manda Desa Ngal Kec. Ungar', 12, 'meadie25@yahoo.com', 6, 1),
('1270', 'SDN 001 Moro', 'Jl. Jendral Sudirman Moro', 4, 'feby_aquarian@yahoo.com', 15, 1),
('1271', 'SDN 002 Moro', 'Jl. Bukit Senang Moro', 4, 'sdn002moro@gmail.com', 8, 1),
('1272', 'SDN 003 Moro', 'Jl. Hang Tuah Desa Sugie', 4, 'sdn003_moro@yahoo.com', 11, 1),
('1273', 'SDN 004 Moro', 'Jl. Pelajar Pauh', 4, 'sdn004moro@gmail.com', 6, 1),
('1274', 'SDN 005 Moro', 'Dusun Niur Desa Keban', 4, 'aloi_suzi@yahoo.co.id', 9, 1),
('1275', 'SDN 006 Moro', 'Dusun Setonggeng Desa Selat Mie', 4, 'sulastri_setonggeng@yahoo.com', 8, 1),
('1276', 'SDN 007 Moro', 'Buah Rawa - Keban', 4, 'sdn007rawajaya@yahoo.co.id', 6, 1),
('1277', 'SDN 008 Moro', 'Jl. Simpang Tiga Tg. Semukul - Sugie', 4, 'sdn008sugie@gmail.com', 26, 1),
('1278', 'SDS 009 Moro', 'Jl. Pasar Baru Kp Bedan Moro', 4, 'rajaafrizal32@gmail.com', 11, 1),
('1279', 'SDN 010 Moro', 'Jl. Pendidikan No.13 Selat Mie', 4, 'kilauhamzah@yahoo.co.id', 6, 1),
('1280', 'SDN 011 Moro', 'Pulau Moro', 4, 'sdn011pulaumoro@yahoo.com', 12, 1),
('1281', 'SDN 012 Moro', 'Tanjung Pelanduk', 4, 'sukri.82@yahoo.com', 0, 1),
('1282', 'SDN 013 Moro', 'Jl. Olahraga Pulau Jang Moro', 4, 'haribnu@gmail.com', 10, 1),
('1283', 'SDN 014 Moro', 'Buluh Patah - Selat Mie', 4, 'awie.ysl@yahoo.co.id', 6, 1),
('1284', 'SDN 015 Moro', 'Jl. Rawa Mangun No. 07 Moro', 4, 'sdn015moro@yahoo.com', 10, 1),
('1285', 'SDN 016 Moro', 'Jl. Sepak Bola Dusun Pulau Jaga', 4, 'sdn016sugie@gmail.com', 6, 1),
('1286', 'SDN 017 Moro', 'Selat Binga Moro', 4, 'asbull86@gmail.com', 6, 1),
('1287', 'SDN 018 Moro', 'Pulau Bahan Desa Keban Moro', 4, 'zallfa_budiyono@yahoo.com', 6, 1),
('1288', 'SDN 019 Moro', 'Desa Keban Moro', 4, 'sdn019keban@gmail.com', 6, 1),
('1289', 'SDN 020 Moro', 'Kp. Sidomoro Moro', 4, 'sdn020moro@ymail.com', 6, 1),
('1290', 'SDN 021 Moro', 'Jl. Cepedak Dusun Kericik Moro', 4, 'azmansdn_021@yahoo.com', 6, 1),
('1291', 'SDN 001 Durai', 'Jl. Pendidikan No.1 Durai', 6, 'bujangunet@yahoo.co.id', 11, 1),
('1292', 'SDN 002 Durai', 'Jl. Teluk Serengkam Desa Sanglar', 6, 'arie.poetri@yahoo.co.id', 1, 1),
('1293', 'SDN 003 Durai', 'Jl. Pendidikan No.1 Kampung Tengah Durai', 6, 'iwanzoebir73@gmail.com', 6, 1),
('1294', 'SDN 004 Durai', 'Pulau Sandam Durai', 6, 'bayuoperator4@gmail.com', 6, 1),
('1295', 'SDN 005 Durai', 'Simpang Tiga Serinjing Durai', 6, 'minawrah_mazlan@yahoo.co.id', 6, 1),
('1296', 'SDN 006 Durai', 'Pulau Semembang Durai', 6, 'amz_feb78@yahoo.co.id', 6, 1),
('1297', 'SDN 007 Durai', 'Pulau Akat Desa Semembang', 6, 'm.sayutiutin@yahoo.co.id', 6, 1),
('1298', 'KB.ANDINI', '-', 2, '-', 3, 1),
('1299', 'KB. AWANA KECIL PLUS', '-', 2, '-', 1, 1),
('1300', 'KB. Nusnatar Tuition Centre', '-', 2, '-', 2, 1),
('1301', 'KB QURATTA A\'YUN', '-', 2, '-', 2, 1),
('1302', 'KB.Taqwa', '-', 2, '-', 3, 1),
('1303', 'SPS ANANDA', '-', 2, '-', 2, 1),
('1304', 'KB.KASIH BUNDA', '-', 5, '-', 1, 1),
('1305', 'KB PERMATA BUNDA', '-', 5, '-', 1, 1),
('1306', 'SPS ASOKA', '-', 5, '-', 2, 1),
('1307', 'SPS KARTINI', '-', 5, '-', 2, 1),
('1308', 'KB.MULYA BARAN BARAT', '-', 3, '-', 4, 1),
('1309', 'KB.MUTIARA HATI', '-', 3, '-', 2, 1),
('1310', 'KB. ANUGERAH', '-', 3, '-', 2, 1),
('1311', 'KB. AR RAHMAN', '-', 3, '-', 2, 1),
('1312', 'KB AMANAH', '-', 3, '-', 2, 1),
('1313', 'SPS PERMATA HATI', '-', 11, '-', 2, 1),
('1314', 'SPS PUTRI AYU', '-', 11, '-', 2, 1),
('1315', ' KB CAHAYA HATI ', '-', 11, '-', 2, 1),
('1316', 'KB. AL-AMIN', '-', 1, '-', 9, 1),
('1317', 'KB HARUM SARI', '-', 1, '-', 2, 1),
('1318', 'KB IT CENDEKIA', '-', 1, '-', 8, 1),
('1319', 'KB. KENANGA KARIMUN', '-', 1, '-', 4, 1),
('1320', 'KBS MAITREYAWIRA', '-', 1, '-', 2, 1),
('1321', 'KB NUR GEMILANG', '-', 1, '-', 2, 1),
('1322', 'PAUD CERIA TELOK MESODO', '-', 1, '-', 2, 1),
('1323', 'KB. AL-MAIDAH', '-', 7, '-', 2, 1),
('1324', 'KB AN-NISSA KUNDUR', '-', 7, '-', 3, 1),
('1325', 'KB GEMBIRA KUNDUR', '-', 7, '-', 3, 1),
('1326', 'KB .KECAMBAH  KUNDUR', '-', 7, '-', 3, 1),
('1327', 'KELOMPOK BERMAIN MAWAR', '-', 7, '-', 2, 1),
('1328', 'KB MUSTIKA KUNDUR', '-', 7, '-', 2, 1),
('1329', 'KB KREASI ANAK NEGERI KUNDUR', '-', 7, '-', 2, 1),
('1330', 'KB AL-FALAH', '-', 9, '-', 2, 1),
('1331', 'KB.Bunga Tanjung', '-', 9, '-', 3, 1),
('1332', 'KB. LESTARI', '-', 9, '-', 3, 1),
('1333', 'KB. Stania Madani Kids', '-', 9, '-', 3, 1),
('1334', 'SPS KASIH ANAK BRILLIAN II', '-', 9, '-', 2, 1),
('1335', 'SPS KASIH ANAK BRILLIAN IV', '-', 9, '-', 2, 1),
('1336', 'KB WARDAH', '-', 13, '-', 2, 1),
('1337', 'KB MEKAR SARI UNGAR', '-', 12, '-', 2, 1),
('1338', 'KB AL-MUNAWWARAH', '-', 4, '-', 2, 1),
('1339', 'SPS POS PAUD PELANGI', '-', 4, '-', 2, 1),
('1340', 'SPS POS PAUD DAHLIA', '-', 4, '-', 2, 1),
('1341', 'KB NURJANAH', '-', 4, '-', 2, 1),
('1342', 'PAUD  SELAT MIE MANDIRI', '-', 4, '-', 2, 1),
('1343', 'SPS. PAUD CEMPAKA', '-', 4, '-', 2, 1),
('1344', 'SPS POS PAUD TERATAI 1', '-', 6, '-', 1, 1),
('1345', 'SPS POS PAUD TERATAI 2', '-', 6, '-', 1, 1),
('1346', 'TK NEGERI PEMBINA KECAMATAN KARIMUN', 'Jl. Lubuk Semut Kampung Tengah', 2, '-', 4, 1),
('1347', 'TK SDN SATU ATAP SELAT MENDAUN', 'Jl. Pelabuhan Desa Selat Mendaun', 2, '-', 2, 1),
('1348', 'TKS. AWANA KECIL PLUS', 'Perumahan Balai Garden ', 2, '-', 1, 1),
('1349', 'TKS. HANG TUAH', 'Komp TNI AL Jl.KRI Lemadang Bukit Senang Komp TNI AL Jl.KRI Lemadang Bukit Senang', 2, '-', 4, 1),
('1350', 'TKS. SANTU YUSUP', 'Jl. Bukit Sidomulyo II Kel. Tanjung Balai ', 2, '-', 4, 1),
('1351', 'TK IT YAA BUNAYYA 1 HIDAYATULLAH', 'Jl. Telaga Riau Kel. Sungai Lakam Barat ', 2, '-', 4, 1),
('1352', 'TKS. AMNUR KARIMUN', 'Jl. Jend. A. Yani No.75 Kel. Sungai Lakam Timur', 2, '-', 2, 1),
('1353', 'TKS. AUSTINE KIDS', 'Jl. Pelipit Sungai Lakam Timur', 2, '-', 2, 1),
('1354', 'TKS. AVICENNA INDONESIA', 'Jl. Telaga Harapan No.2 Kel. Sungai Lakam Barat', 2, '-', 2, 1),
('1355', 'TKS. MAHA BODHI KARIMUN', 'Jl. Bhakti Bukit Senang Kel. Tanjung Balai', 2, '-', 8, 1),
('1356', 'TKS. PERTIWI KARIMUN', 'Jl. Bhakti No.1 Kp.Sidorejo Kel. Lubuk Semut', 2, '-', 3, 1),
('1357', 'TKS. VIDYA SASANA', 'Jl. Veteran No.1 Kel. Sungai Lakam Barat', 2, '-', 3, 1),
('1358', 'TKS AISYIYAH BUSTHANUL ATFAL', 'Jl. Teuku Umar No.62 Kel. Tanjung Balai Kota', 2, '-', 4, 1),
('1359', 'TKIT DARUL MUKMIN KARIMUN', 'Jl. Angkasa Bukit Sidomulyo 2 Tg.Balai Karimun', 2, '-', 5, 1),
('1360', 'TKS. KARTINI', 'Jl. Lundang Panjang RT 02 RW 02 Kel. Buru', 5, '-', 4, 1),
('1361', 'TKS. BINA BANGSA', 'Jl. Bina Bangsa No.63 Kel. Meral Kota', 3, '-', 2, 1),
('1362', 'TKS. 005 CAHAYA MERAL', 'Jl. Jendral A. Yani Kel. Meral Kota', 3, '-', 2, 1),
('1363', 'TKS. AL-FALAH MERAL', 'Jl. A.Yani Gang Al Falah Kel. Meral Kota', 3, '-', 6, 1),
('1364', 'TKS. BHAKTI CARAKA', 'Jl. Jendral A. Yani Kel. Meral Kota', 3, '-', 6, 1),
('1365', 'TKS. HARAPAN BUNDA', 'Jl. Letjen Suprapto Kel. Sungai Raya', 3, '-', 2, 1),
('1366', 'TKS. AN-NISA', 'Jl. Masjid Gg Teratai Wonosari No. 80 ', 3, '-', 2, 1),
('1367', 'TKS GEMA CERIA_ ( BELUM )', 'Jl. Letjend. Suprapto No. 6 Kel. Sungai Raya', 3, '-', 2, 1),
('1368', 'TKS NURUL IMAN_ ( BELUM )', 'Perumahan TMK Kel. Sungai Raya', 3, '-', 2, 1),
('1369', 'TKS METHODIST', 'Jl. Poros Kampung Sukajaya', 3, '-', 3, 1),
('1370', 'TKS. PTKG', 'Jl. Sepedas Kel. Pasir Panjang', 11, '-', 2, 1),
('1371', 'TK SDN SATU ATAP PANGKE', 'Jl. LetJen Suprapto Desa Pangke Barat', 11, '-', 5, 1),
('1372', 'TK SDN SATU ATAP TELUK PAKU', 'Jl. Teluk Paku Kel. Pasir Panjang', 11, '-', 2, 1),
('1373', 'TKIT YAA BUNAYYA 2 HIDAYATULLAH', 'Jl. Sememal Kel. Pasir Panjang', 11, '-', 2, 1),
('1374', 'TKS AL-MUJAHIDDIN', 'Jl. Kapt.Piere Tandean Jelutung Kel. Darussalam', 11, '-', 5, 1),
('1375', 'TKS AL-UMARA', 'Jl. Kapten Piere Tendean Lembah Permai', 11, '-', 2, 1),
('1376', 'TKS AVAVA', 'Jl. Pertambangan RT 004 RW 001 Tebing', 1, '-', 2, 1),
('1377', 'TKN CANGGAI PUTRI', 'Jl. Canggai Puteri Kel. Teluk Uma', 1, '-', 3, 1),
('1378', 'TKS.  INSAN MULIA', 'Jl. Poros Tebing', 1, '-', 2, 1),
('1379', 'TKS.  MEKAR SARI', 'Jl. Brigjen Katamso Desa Pongkar ', 1, '-', 3, 1),
('1380', 'TKIT CENDIKIA', 'Jl. Kampung Harapan Kel. Harjosari', 1, '-', 8, 1),
('1381', 'TKS. AL-ISLAMI', 'Jl. Komplek Timah No.64 Kel. Teluk Uma', 1, '-', 2, 1),
('1382', 'TKS. AURA', 'Jl. Perum Griya Praja Blok C 24 Kel. Tebing', 1, '-', 2, 1),
('1383', 'TKS. MAITREYAWIRA', 'Jl. Soekarno-Hatta Poros', 1, '-', 5, 1),
('1384', 'TKS. IMANUEL', 'Jl. Komplek Timah No.64 Kel. Teluk Uma', 1, '-', 0, 1),
('1385', 'TK SDN SATAP TANJUNG BATU BARAT KUNDUR', 'Jl. Sawang KM 8 Kel. Tanjung Batu Barat', 7, '-', 3, 1),
('1386', 'TKS. CENDANA', 'Jl. Besar Desa Sungai Ungar', 7, '-', 2, 1),
('1387', 'TKS. HANDAYANI ', 'Jl. Parit Seratus Desa Sei Sebesi', 7, '-', 3, 1),
('1388', 'TK SDN SATU ATAP LUBUK', 'Jl. Besar Desa Lubuk', 7, '-', 2, 1),
('1389', 'TKN PEMBINA KECAMATAN KUNDUR', 'Jl. Sunaryo KM 5 Tanjung Batu Barat', 7, '-', 3, 1),
('1390', 'TKS. AISYIYAH BA KUNDUR', 'Jl. Dewi Sartika Kel. Tanjung Batu Kota', 7, '-', 4, 1),
('1391', 'TKS. AL-HUDA KUNDUR', 'Jl. MT. Haryono 228 Kel. Gading Sari', 7, '-', 2, 1),
('1392', 'TKS. KEMALA BHAYANGKARI', 'Jl. Diponegoro No. 460 Kel. Tanjung Batu Kota', 7, '-', 6, 1),
('1393', 'TKS. PERTIWI KUNDUR', 'Jl. R.A. Kartini No. 14 Kel. Tanjung Batu Kota', 7, '-', 3, 1),
('1394', 'TKS. SALSABILA KUNDUR', 'Jl. Parit Lintang Sei. Sebesi Kundur', 7, '-', 0, 1),
('1395', 'TKS. SRI LAYANG', 'Jl. Besar Kel. Sawang', 9, '-', 3, 1),
('1396', 'TKS. ISLAM UMMUL QURO', 'Jl. Pendidikan Sawang Laut ', 9, '-', 2, 1),
('1397', 'TKS. MAWAR', 'Jl. Besar Dusun II Kel. Kundur', 9, '-', 3, 1),
('1398', 'TKS. MUTIARA HATI', 'Jl. Besar Kobel Laut Desa Sawang Laut', 9, '-', 3, 1),
('1399', 'TKS. PERMATA SARI', 'Jl. Besar Desa Gemuruh', 9, '-', 3, 1),
('1400', 'TKS AL-FATMA', 'Jl. Mengkuse Dusun I Desa Sawang Selatan', 9, '-', 4, 1),
('1401', 'TK SDN SATU ATAP TELUK RADANG', 'Jl. Besar Kamp Baru Desa Teluk Radang', 8, '-', 2, 1),
('1402', 'TK SDN SATU ATAP URUNG BARAT', 'Jl. Sidoarjo Tg. Berlian Barat', 8, '-', 2, 1),
('1403', 'TKN BINA PERMATA KUNDUR UTARA', 'Jl. Hang Nadim Desa Teluk Radang', 8, '-', 4, 1),
('1404', 'TKS. AL - HUDA KUTA', 'Jl. Hang Tuah Kel. Tanjung Berlian Kota', 8, '-', 2, 1),
('1405', 'TKS. AL-FATTAH  KUNDUR UTARA', 'Jl. Besar P.Senang Desa Sungai Ungar Utara', 8, '-', 2, 1),
('1406', 'TKS. TUNAS JAYA KUNDUR UTARA', 'Jl. Kampung Gajus Kel. Tanjung Berlian Kota', 8, '-', 2, 1),
('1407', 'TKS. CAHAYA MATA KUNDUR UTARA', 'Jl. Family Kundur Utara', 8, '-', 2, 1),
('1408', 'TKS. TUNAS TEBIAS BELAT', 'Dusun II Canggai Gundik Desa Tebias', 13, '-', 2, 1),
('1409', 'TKS. MUTIARA UNGAR', 'Jl. M. Isa Daud Kel. Alai', 12, '-', 2, 1),
('1410', 'TK SD NEGERI SATU ATAP DURAI', 'Jl. Pendidikan No.1 Desa Telaga VII', 6, '-', 2, 1),
('1411', 'TKIT ATTHOHIRIYAH', 'Jl. Paya Lebar Kel. Moro', 4, '-', 2, 1),
('1412', 'TKS. PERTIWI', 'Jl. Olah Raga No.1 Kel. Moro', 4, '-', 3, 1),
('1413', 'TK SDN SATU ATAP SUGIE', 'Jl. Hang Tuah Desa Sugie', 4, '-', 3, 1);

/*Table structure for table `setting` */

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(25) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `setting` */

insert  into `setting`(`setting_id`,`group`,`key`,`value`) values 
(3,'general','default_ta','2018'),
(11,'backup','jumlah_file_backup','5');

/*Table structure for table `status_kepegawaian` */

DROP TABLE IF EXISTS `status_kepegawaian`;

CREATE TABLE `status_kepegawaian` (
  `kode` smallint(6) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

/*Data for the table `status_kepegawaian` */

insert  into `status_kepegawaian`(`kode`,`status`) values 
(100,'aktif'),
(101,'TIDAK');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `userpassword` varchar(80) NOT NULL,
  `salt` varchar(7) NOT NULL,
  `page` enum('m','d','s','p') NOT NULL DEFAULT 'm',
  `kode_sekolah` varchar(25) NOT NULL,
  `email` varchar(150) NOT NULL,
  `idsekolah` smallint(6) NOT NULL,
  `theme` varchar(25) NOT NULL,
  `photo_profile` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`userid`,`username`,`userpassword`,`salt`,`page`,`kode_sekolah`,`email`,`idsekolah`,`theme`,`photo_profile`,`active`) values 
(1,'admin','13cfedd9284ee180e70eb81536cd29a6a9159afa07d5fa1e23d54203d5e3b756','d6097e','m','0','m_rizki_r@yacanet.com',0,'default','resources/userimages/no_photo.png',1),
(4,'jajangtea','8fd8cc1665edbac5c39a6fa546a4fae7c9df5a6894e0eaaa86da7fe831793a69','332398','m','0','m_rizki_r@yacanet.com',0,'default','resources/userimages/no_photo.png',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
