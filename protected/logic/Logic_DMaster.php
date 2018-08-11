<?php

prado::using ('Application.logic.Logic_Global');
class Logic_DMaster extends Logic_Global {		
	public function __construct ($db) {
		parent::__construct ($db);			
	}
	/**
	* digunakan untuk mendapatkan daftar kecamatan
	* @return array kecamatan
	*
	*/
	public function getListKecamatan () {
		$kecamatan =array ('none'=>'Pilih',1=>'TEBING',2=>'KARIMUN',3=>'MERAL',4=>'MORO',5=>'BURU',6=>'DURAI',7=>'KUNDUR',8=>'KUNDUR UTARA',9=>'KUNDUR BARAT',10=>'UNGAR',11=>'MERAL BARAT',12=>'BELAT');
		return $kecamatan;
	}
        public function getListAgama () {
		$kecamatan =array ('none'=>'Pilih',1=>'Islam',2=>'Kristen',3=>'Hindu',4=>'Budha');
		return $kecamatan;
	}
        public function getListJk () {
		$kecamatan =array ('none'=>'Pilih','L'=>'Laki - Laki','P'=>'Perempuan');
		return $kecamatan;
	}
}