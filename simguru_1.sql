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

insert  into `sekolah`(`kode`,`nama`,`alamat`,`idkecamatan`,`email`,`jumlah_rombel`,`status`) values 
('3213','SMKN 4 TANJUNGPINANG','JALAN NUSANTARA KM 14 TANJUNGPINANG',7,'smkn4tpi@mail.com',30,1);

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
