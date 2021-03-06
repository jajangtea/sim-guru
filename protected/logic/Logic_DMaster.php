<?php

prado::using('Application.logic.Logic_Global');

class Logic_DMaster extends Logic_Global {

    public function __construct($db) {
        parent::__construct($db);
    }

    /**
     * digunakan untuk mendapatkan daftar kecamatan
     * @return array kecamatan
     *
     */
    public function getListKecamatan() {
        $kecamatan = array('none' => 'Pilih', 1 => 'TEBING', 2 => 'KARIMUN', 3 => 'MERAL', 4 => 'MORO', 5 => 'BURU', 6 => 'DURAI', 7 => 'KUNDUR', 8 => 'KUNDUR UTARA', 9 => 'KUNDUR BARAT', 10 => 'UNGAR', 11 => 'MERAL BARAT', 12 => 'BELAT');
        return $kecamatan;
    }

    public function getListAgama() {
        $kecamatan = array('none' => 'Pilih', 'Islam' => 'Islam', 'Kriten' => 'Kristen', 'Hindu' => 'Hindu', 'Budha' => 'Budha','Kong Hu Cu'=>'Kong Hu Cu');
        return $kecamatan;
    }

    public function getListJk() {
        $jk = array('none' => 'Pilih', 'L' => 'Laki - Laki', 'P' => 'Perempuan');
        return $jk;
    }
    
    public function getListStatus() {
        $status = array('none' => 'Pilih', 'Sudah' => 'Sudah', 'Belum' => 'Belum');
        return $status;
    }

    public function getListSekolah() {
        $dataitem = $this->getList("sekolah", array('kode', 'nama'), 'kode', null, 1);
        $dataitem['none'] = 'Daftar Sekolah';
        return $dataitem;
    }
    
    public function getListJenjang() {
        $jk = array('none' => 'Pilih', 'SD' => 'SD', 'SMP' => 'SMP','SMA' => 'SMA','SMK' => 'SMK','S1' => 'S1','S2' => 'S2','S3' => 'S3');
        return $jk;
    }
    
    public function getListNIP() {
        $dataitem = $this->getList("pegawai", array('nip', 'nama_lengkap'), 'nip', null, 1);
        $dataitem['none'] = 'Daftar Pegawai';
        return $dataitem;
    }
    
    public function getListJabatan() {
        $dataitem = $this->getList("jabatan", array('id', 'nama_jabatan'), 'id', null, 1);
        $dataitem['none'] = 'Daftar Jabatan';
        return $dataitem;
    }
    
     public function getListTA() {
        $dataitem = $this->getList("ta", array('id', 'tahun_ajaran'), 'id', null, 1);
        $dataitem['none'] = 'Tahun Ajaran';
        return $dataitem;
    }
    
    public function getListGolongan() {
        $dataitem = $this->getList("golongan", array('kode', 'kode'), 'kode', null, 1);
        $dataitem['none'] = 'Daftar Golongan';
        return $dataitem;
    }
    
    public function getListBidangStudi() {
        $dataitem = $this->getList("bidang_studi_sertifikasi", array('kode', 'nama_bidang_studi'), 'kode', null, 1);
        $dataitem['none'] = 'Bidang Studi';
        return $dataitem;
    }
    

}
