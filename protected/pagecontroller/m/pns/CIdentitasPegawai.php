<?php

prado::using('Application.MainPageM');

class CIdentitasPegawai extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showSekolah = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['currentPageSekolah']) || $_SESSION['currentPageSekolah']['page_name'] != 'sa.dmaster.Sekolah') {
                $_SESSION['currentPageSekolah'] = array('page_name' => 'sa.dmaster.Sekolah', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPageSekolah']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPageSekolah']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPageSekolah']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPageSekolah']['search'] = true;
        $this->populateData($_SESSION['currentPageSekolah']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT * FROM pegawai";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'kode' :
                    $clausa = "WHERE kode='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("sekolah $clausa", 'kode');
                    $str = "$str $clausa";
                    break;
                case 'nama_sekolah' :
                    $clausa = "WHERE nama LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("sekolah $clausa", 'kode');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("pegawai", 'id_pegawai');
            $str = "SELECT * FROM pegawai";
        }
        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPageSekolah']['page_num'];
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
            $_SESSION['currentPageSekolah']['page_num'] = 0;
        }
        $str = "$str ORDER BY nama_lengkap ASC LIMIT $offset,$limit";
        $r = $this->DB->getRecord($str, $offset + 1);

        $this->RepeaterS->DataSource = $r;
        $this->RepeaterS->dataBind();
        $this->paginationInfo->Text = $this->getInfoPaging($this->RepeaterS);
    }

    public function addProcess($sender, $param) {
        $this->idProcess = 'add';

        $this->cmbAddJk->dataSource = $this->DMaster->getListJk();
        $this->cmbAddJk->dataBind();

        $this->cmbAddAgama->dataSource = $this->DMaster->getListAgama();
        $this->cmbAddAgama->dataBind();

        $this->cmbAddSekolah->dataSource = $this->DMaster->getListSekolah();
        $this->cmbAddSekolah->dataBind();

        $this->cmbAddBidangStudi->dataSource = $this->DMaster->getListBidangStudi();
        $this->cmbAddBidangStudi->dataBind();

        $this->cmbAddStatusSertifikasi->dataSource = $this->DMaster->getListStatus();
        $this->cmbAddStatusSertifikasi->dataBind();
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
            $nip = addslashes($this->txtAddNIP->Text);
            $nuptk = strtoupper(addslashes($this->txtAddNUPTK->Text));
            $npwp = strtoupper(addslashes($this->txtAddNPWP->Text));
            $nama_lengkap = $this->txtAddNama->Text;
            $jk = addslashes($this->cmbAddJk->Text);
            $tempat_lahir = addslashes($this->txtAddTempatLahir->Text);
            $tgl_lahir = date('Y-m-d', $this->txtAddTanggalLahir->TimeStamp);
            $agama = addslashes($this->cmbAddAgama->Text);
            $email = addslashes($this->txtAddEmail->Text);
            $gol_ruang = addslashes($this->txtAddGolongan->Text);
            $pangkat = addslashes($this->txtAddPangkat->Text);
            $status_kepegawaian = addslashes($this->txtAddStatusPegawai->Text);
            $status_perkawinan = addslashes($this->txtAddStatusPerkawinan->Text);
            $nama_suami_istri = addslashes($this->txtAddNamaSuami_Istri->Text);
            $no_kartu = addslashes($this->txtAddNoKartu->Text);
            $no_karis = addslashes($this->txtAddNoKaris->Text);
            $no_karsu = addslashes($this->txtAddNoKarsu->Text);
            $no_rek = addslashes($this->txtAddNoRekening->Text);
            $nm_bank = addslashes($this->txtAddNamaBank->Text);
            $rek_bank_an = addslashes($this->txtAddAtasNama->Text);
            $kode_sekolah = addslashes($this->cmbAddSekolah->Text);
            $tmt = date('Y-m-d', $this->txtAddTMT->TimeStamp);
            $status_sertifikasi = addslashes($this->cmbAddStatusSertifikasi->Text);
            $kode_bidang_studi = addslashes($this->cmbAddBidangStudi->Text);
            $th_sertifikasi = date('Y', $this->txtAddTahunSertifikasi->TimeStamp);
            $no_sertifikasi = addslashes($this->txtAddNoSertifikasi->Text);
            $no_nuks = addslashes($this->txtAddNoNUKS->Text);
            $tgl_nuks_sertifikat = date('Y-m-d', $this->txtAddSertifikatNUKS->TimeStamp);
            $predikat_nuks_sertifikat = addslashes($this->txtAddPredikatNUKS->Text);
            $berjenjang_sertifikat = addslashes($this->txtAddSertifikatBerjenjang->Text);
            $th_berjenjang_sertifikat = date('Y', $this->txtAddSertifikatBerjenjang->TimeStamp);
            $no_hp = addslashes($this->txtAddNoHP->Text);
            $alamat = addslashes($this->txtAddAlamat->Text);
            $str = "INSERT INTO pegawai SET nip='$nip', nuptk='$nuptk', npwp='$npwp', nama_lengkap='$nama_lengkap', jk='$jk', tempat_lahir='$tempat_lahir', tgl_lahir='$tgl_lahir', agama='$agama', email='$email', gol_ruang='$gol_ruang', pangkat='$pangkat', status_kepegawaian='$status_kepegawaian', status_perkawinan='$status_perkawinan', nama_suami_istri='$nama_suami_istri', no_kartu='$no_kartu', no_karis='$no_karis', no_karsu='$no_karsu', no_rek='$no_rek', nm_bank='$nm_bank', rek_bank_an='$rek_bank_an', kode_sekolah='$kode_sekolah', tmt='$tmt', status_sertifikasi='$status_sertifikasi', kode_bidang_studi='$kode_bidang_studi', th_sertifikasi='$th_sertifikasi', no_sertifikasi='$no_sertifikasi', no_nuks='$no_nuks', tgl_nuks_sertifikat='$tgl_nuks_sertifikat', predikat_nuks_sertifikat='$predikat_nuks_sertifikat', berjenjang_sertifikat='$berjenjang_sertifikat', th_berjenjang_sertifikat='$th_berjenjang_sertifikat', no_hp='$no_hp', alamat='$alamat'";
            $this->DB->insertRecord($str);
            $this->Redirect('pns.IdentitasPegawai', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $id_pegawai = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $id_pegawai;

        $str = "SELECT * FROM pegawai WHERE id_pegawai='$id_pegawai'";
        $r = $this->DB->getRecord($str);
        $result = $r[1];

        $this->txtEditNIP->Text = $result['nip'];
        $this->txtEditNUPTK->Text = $result['nuptk'];
        $this->txtEditNPWP->Text = $result['npwp'];
        $this->txtEditNama->Text;
        $this->cmbEditJk->Text = $result['jk'];
        $this->txtEditTempatLahir->Text = $result['tempat_lahir'];
        // date('Y-m-d',$this->txtEditTanggalLahir->TimeStamp=$result['nip'];
        $this->cmbEditAgama->Text = $result['agama'];
        $this->txtEditEmail->Text = $result['email'];
        $this->txtEditGolongan->Text = $result['nip'];
        $this->txtEditPangkat->Text = $result['gol_ruang'];
        $this->txtEditStatusPegawai->Text = $result['status_kepegawaian'];
        $this->txtEditStatusPerkawinan->Text = $result['status_perkawinan'];
        $this->txtEditNamaSuami_Istri->Text = $result['nama_suami_istri'];
        $this->txtEditNoKartu->Text = $result['no_karti'];
        $this->txtEditNoKaris->Text = $result['no_karis'];
        $this->txtEditNoKarsu->Text = $result['no_karsu'];
        $this->txtEditNoRekening->Text = $result['no_rek'];
        $this->txtEditNamaBank->Text = $result['nm_bank'];
        $this->txtEditAtasNama->Text = $result['rek_bank_an'];
        $this->cmbEditSekolah->Text = $result['kode_sekolah'];
        //$this->txtEditTMT = $result['tmt'];
        $this->cmbEditStatusSertifikasi->Text = $result['status_sertifikasi'];
        $this->cmbEditBidangStudi->Text = $result['kode_bidang_studi'];
        //$this->txtEditTahunSertifikasi = $result['th_sertifikasi'];
        $this->txtEditNoSertifikasi->Text = $result['no_sertifikasi'];
        $this->txtEditNoNUKS->Text = $result['no_nuks'];
        $this->txtEditSertifikatNUKS->Text = $result['tgl_nuks_sertifikat'];
        $this->txtEditPredikatNUKS->Text = $result['predikat_nuks_sertifikat'];
        $this->txtEditSertifikatBerjenjang->Text = $result['berjenjang_sertifikat'];
        $this->txtEditNoHP->Text = $result['no_hp'];
        $this->txtEditAlamat->Text = $result['alamat'];


//        $this->txtEditNama->Text = $result['nama'];
//        $this->txtEditAlamat->Text = $result['alamat'];
//        $this->cmbEditKecamatan->dataSource = $this->DMaster->getListKecamatan();
//        $this->cmbEditKecamatan->dataBind();
//        $this->cmbEditKecamatan->Text = $result['idkecamatan'];
//        $this->txtEditEmail->Text = $result['email'];
//        $this->hiddenemail->Value = $result['email'];
//        $this->txtEditRombel->Text = $result['jumlah_rombel'];
//
//        $this->cmbEditStatus->Text = $result['status'];
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $kode_old = $this->hiddenid->Value;
            $nip = addslashes($this->txtEditNIP->Text);
            $nuptk = strtoupper(addslashes($this->txtEditNUPTK->Text));
            $npwp = strtoupper(addslashes($this->txtEditNPWP->Text));
            $nama_lengkap = $this->txtEditNama->Text;
            $jk = addslashes($this->cmbEditJk->Text);
            $tempat_lahir = addslashes($this->txtEditTempatLahir->Text);
            $tgl_lahir = date('Y-m-d', $this->txtEditTanggalLahir->TimeStamp);
            $agama = addslashes($this->cmbEditAgama->Text);
            $email = addslashes($this->txtEditEmail->Text);
            $gol_ruang = addslashes($this->txtEditGolongan->Text);
            $pangkat = addslashes($this->txtEditPangkat->Text);
            $status_kepegawaian = addslashes($this->txtEditStatusPegawai->Text);
            $status_perkawinan = addslashes($this->txtEditStatusPerkawinan->Text);
            $nama_suami_istri = addslashes($this->txtEditNamaSuami_Istri->Text);
            $no_kartu = addslashes($this->txtEditNoKartu->Text);
            $no_karis = addslashes($this->txtEditNoKaris->Text);
            $no_karsu = addslashes($this->txtEditNoKarsu->Text);
            $no_rek = addslashes($this->txtEditNoRekening->Text);
            $nm_bank = addslashes($this->txtEditNamaBank->Text);
            $rek_bank_an = addslashes($this->txtEditAtasNama->Text);
            $kode_sekolah = addslashes($this->cmbEditSekolah->Text);
            $tmt = date('Y-m-d', $this->txtEditTMT->TimeStamp);
            $status_sertifikasi = addslashes($this->cmbEditStatusSertifikasi->Text);
            $kode_bidang_studi = addslashes($this->cmbEditBidangStudi->Text);
            $th_sertifikasi = date('Y', $this->txtEditTahunSertifikasi->TimeStamp);
            $no_sertifikasi = addslashes($this->txtEditNoSertifikasi->Text);
            $no_nuks = addslashes($this->txtEditNoNUKS->Text);
            $tgl_nuks_sertifikat = date('Y-m-d', $this->txtEditSertifikatNUKS->TimeStamp);
            $predikat_nuks_sertifikat = addslashes($this->txtEditPredikatNUKS->Text);
            $berjenjang_sertifikat = addslashes($this->txtEditSertifikatBerjenjang->Text);
            $th_berjenjang_sertifikat = date('Y', $this->txtEditSertifikatBerjenjang->TimeStamp);
            $no_hp = addslashes($this->txtEditNoHP->Text);
            $alamat = addslashes($this->txtEditAlamat->Text);
            $str = "UPDATE pegawai SET nip='$nip', nuptk='$nuptk', npwp='$npwp', nama_lengkap='$nama_lengkap', jk='$jk', tempat_lahir='$tempat_lahir', tgl_lahir='$tgl_lahir', agama='$agama', email='$email', gol_ruang='$gol_ruang', pangkat='$pangkat', status_kepegawaian='$status_kepegawaian', status_perkawinan='$status_perkawinan', nama_suami_istri='$nama_suami_istri', no_kartu='$no_kartu', no_karis='$no_karis', no_karsu='$no_karsu', no_rek='$no_rek', nm_bank='$nm_bank', rek_bank_an='$rek_bank_an', kode_sekolah='$kode_sekolah', tmt='$tmt', status_sertifikasi='$status_sertifikasi', kode_bidang_studi='$kode_bidang_studi', th_sertifikasi='$th_sertifikasi', no_sertifikasi='$no_sertifikasi', no_nuks='$no_nuks', tgl_nuks_sertifikat='$tgl_nuks_sertifikat', predikat_nuks_sertifikat='$predikat_nuks_sertifikat', berjenjang_sertifikat='$berjenjang_sertifikat', th_berjenjang_sertifikat='$th_berjenjang_sertifikat', no_hp='$no_hp', alamat='$alamat' where id_pegawai='$kode_old'";
            $this->DB->updateRecord($str);
            $this->Redirect('pns.IdentitasPegawai', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $kode = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("pegawai WHERE id_pegawai=$kode");
        $this->Redirect('pns.IdentitasPegawai', true);
    }

}
