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
    
    public function getListBidangStudi() {
        $dataitem = $this->getList("bidang_studi_sertifikasi", array('kode', 'nama_bidang_studi'), 'kode', null, 1);
        $dataitem['none'] = 'Bidang Studi';
        return $dataitem;
    }
    

}
