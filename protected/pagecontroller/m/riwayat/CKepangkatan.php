<?php

prado::using('Application.MainPageM');

class CKepangkatan extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showKepangkatan = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['currentPageKepangkatan']) || $_SESSION['currentPageKepangkatan']['page_name'] != 'sa.dmaster.Kepangkatan') {
                $_SESSION['currentPageKepangkatan'] = array('page_name' => 'sa.dmaster.Kepangkatan', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPageKepangkatan']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPageKepangkatan']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPageKepangkatan']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPageKepangkatan']['search'] = true;
        $this->populateData($_SESSION['currentPageKepangkatan']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT * FROM r_kepangkatan rk inner join sekolah s on rk.unit_kerja=s.kode inner join pegawai p on rk.nip=p.nip";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'kode' :
                    $clausa = "WHERE kode='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_kepangkatan $clausa", 'kode');
                    $str = "$str $clausa";
                    break;
                case 'nama_sekolah' :
                    $clausa = "WHERE nama LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_kepangkatan $clausa", 'kode');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("r_kepangkatan", 'id');
            $str = "SELECT * FROM r_kepangkatan rk inner join sekolah s on rk.unit_kerja=s.kode inner join pegawai p on rk.nip=p.nip";
        }
        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPageKepangkatan']['page_num'];
        $this->RepeaterS->VirtualItemCount = $jumlah_baris;
        $currentPage = $this->RepeaterS->CurrentPageIndex;
        $offset = $currentPage * $this->RepeaterS->PageSize;
        $itemcount = $this->RepeaterS->VirtualItemCount;
        $limit = $this->RepeaterS->PageSize;
        if (($offset + $limit) > $itemcount) {
            $limit = $itemcount - $offset;
        }
        if ($limit < 0) {
            $offset = 0;
            $limit = $this->setup->getSettingValue('default_pagesize');
            $_SESSION['currentPageKepangkatan']['page_num'] = 0;
        }
        $str = "$str ORDER BY tanggal_sk DESC LIMIT $offset,$limit";
        $r = $this->DB->getRecord($str, $offset + 1);

        $this->RepeaterS->DataSource = $r;
        $this->RepeaterS->dataBind();
        $this->paginationInfo->Text = $this->getInfoPaging($this->RepeaterS);
    }

    public function addProcess($sender, $param) {
        $this->idProcess = 'add';
        $this->cmbAddNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbAddNIP->dataBind();
        $this->cmbAddSekolah->dataSource = $this->DMaster->getListSekolah();
        $this->cmbAddSekolah->dataBind();
        $this->cmbAddGolongan->dataSource = $this->DMaster->getListGolongan();
        $this->cmbAddGolongan->dataBind();
    }

    public function checkNIP($sender, $param) {
        $this->idProcess = $sender->getId() == 'checkAddNIP' ? 'add' : 'edit';
        $nip = $param->Value;
        if ($nip != '') {
            try {
                if ($this->hiddenid->Value != $kode) {
                    if ($this->DB->checkRecordIsExist('nip', 'pegawai', $nip)) {
                        throw new Exception("NIP ($nip) sudah tidak tersedia silahkan ganti dengan yang lain.");
                    }
                }
            } catch (Exception $e) {
                $param->IsValid = false;
                $sender->ErrorMessage = $e->getMessage();
            }
        }
    }

    public function saveData($sender, $param) {
        if ($this->Page->isValid) {
            $nip = addslashes($this->cmbAddNIP->Text);
            $golongan = addslashes($this->cmbAddGolongan->Text);
            $pangkat = addslashes($this->txtAddPangkat->Text);
            $nomor_sk = addslashes($this->txtAddNomorSK->Text);
            $tanggal_sk = date('Y-m-d', $this->txtAddTanggalSK->TimeStamp);
            $tmt = date('Y-m-d', $this->txtAddTanggalTMT->TimeStamp);
            $pendidikan = addslashes($this->txtAddPendidikan->Text);
            $unit_kerja = addslashes($this->cmbAddSekolah->Text);
            $nip = addslashes($this->cmbAddNIP->Text);
            
            $str = "INSERT INTO r_kepangkatan SET golongan='$golongan',pangkat='$pangkat',nomor_sk='$nomor_sk',tanggal_sk='$tanggal_sk',tmt='$tmt',pendidikan='$pendidikan',unit_kerja='$unit_kerja',nip='$nip'";
            $this->DB->insertRecord($str);
            $this->Redirect('riwayat.Kepangkatan', true);
            
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $id_kepangkatan = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $id_kepangkatan;


//        $str = "SELECT * FROM r_kepangkatan WHERE id_kepangkatan='$id_kepangkatan'";
//        $this->DB->setFieldTable(array('id', 'golongan', 'pangkat', 'nomor_sk', 'tanggal_sk', 'tmt', 'pendidikan', 'unit_kerja', 'nip'));
//        $r = $this->DB->getRecord($str);
//        $result = $r[1];
//
//        $this->txtEditNomorSK->Text = $result['nomor_sk'];
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $kode_old = $this->hiddenid->Value;
            $nip = addslashes($this->txtEditNIP->Text);

            $th_berjenjang_sertifikat = date('Y', $this->txtEditSertifikatBerjenjang->TimeStamp);
            $no_hp = addslashes($this->txtEditNoHP->Text);
            $alamat = addslashes($this->txtEditAlamat->Text);
            $str = "UPDATE pegawai SET nip='$nip', nuptk='$nuptk', npwp='$npwp', nama_lengkap='$nama_lengkap', jk='$jk', tempat_lahir='$tempat_lahir', tgl_lahir='$tgl_lahir', agama='$agama', email='$email', gol_ruang='$gol_ruang', pangkat='$pangkat', status_kepegawaian='$status_kepegawaian', status_perkawinan='$status_perkawinan', nama_suami_istri='$nama_suami_istri', no_kartu='$no_kartu', no_karis='$no_karis', no_karsu='$no_karsu', no_rek='$no_rek', nm_bank='$nm_bank', rek_bank_an='$rek_bank_an', kode_sekolah='$kode_sekolah', tmt='$tmt', status_sertifikasi='$status_sertifikasi', kode_bidang_studi='$kode_bidang_studi', th_sertifikasi='$th_sertifikasi', no_sertifikasi='$no_sertifikasi', no_nuks='$no_nuks', tgl_nuks_sertifikat='$tgl_nuks_sertifikat', predikat_nuks_sertifikat='$predikat_nuks_sertifikat', berjenjang_sertifikat='$berjenjang_sertifikat', th_berjenjang_sertifikat='$th_berjenjang_sertifikat', no_hp='$no_hp', alamat='$alamat' where id_pegawai='$kode_old'";
            $this->DB->updateRecord($str);
            $this->Redirect('pns.Kepangkatan', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $kode = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("pegawai WHERE id_pegawai=$kode");
        $this->Redirect('pns.Kepangkatan', true);
    }

}
