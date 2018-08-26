<?php

prado::using('Application.MainPageM');

class CPekerjaan extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showPekerjaan = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['currentPagePekerjaan']) || $_SESSION['currentPagePekerjaan']['page_name'] != 'sa.dmaster.Pekerjaan') {
                $_SESSION['currentPagePekerjaan'] = array('page_name' => 'sa.dmaster.Pekerjaan', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPagePekerjaan']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPagePekerjaan']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPagePekerjaan']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPagePekerjaan']['search'] = true;
        $this->populateData($_SESSION['currentPagePekerjaan']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT id,s.nama as nm_sekolah,rpg.tmt,rpg.nip,p.nama_lengkap FROM r_pekerjaan_guru rpg inner join pegawai p ON rpg.nip=p.nip inner join sekolah s on rpg.nm_sekolah=s.kode";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'nip' :
                    $clausa = "WHERE rpg.nip='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_pekerjaan_guru WHERE nip='$txtsearch'", 'id');
                    $str = "$str $clausa";
                    break;
                case 'nm_sekolah' :
                    $clausa = "WHERE s.nama LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_pekerjaan_guru rpg inner join pegawai p ON rpg.nip=p.nip inner join sekolah s on rpg.nm_sekolah=s.kode $clausa", 'id');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("r_pekerjaan_guru", 'id');
            $str = "SELECT id,s.nama as nm_sekolah,rpg.tmt,rpg.nip,p.nama_lengkap FROM r_pekerjaan_guru rpg inner join pegawai p ON rpg.nip=p.nip inner join sekolah s on rpg.nm_sekolah=s.kode";
        }
        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPagePekerjaan']['page_num'];
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
            $_SESSION['currentPagePekerjaan']['page_num'] = 0;
        }
        $str = "$str ORDER BY nip ASC LIMIT $offset,$limit";
        $r = $this->DB->getRecord($str, $offset + 1);

        $this->RepeaterS->DataSource = $r;
        $this->RepeaterS->dataBind();
        $this->paginationInfo->Text = $this->getInfoPaging($this->RepeaterS);
    }

    public function addProcess($sender, $param) {
        $this->idProcess = 'add';

        $this->cmbAddSekolah->dataSource = $this->DMaster->getListSekolah();
        $this->cmbAddSekolah->dataBind();
        $this->cmbAddNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbAddNIP->dataBind();
    }

    public function checkEmail($sender, $param) {
        $this->idProcess = $sender->getId() == 'addEmail' ? 'add' : 'edit';
        $email = $param->Value;
        if ($email != '') {
            try {
                if ($this->hiddenemail->Value != $email) {
                    if ($this->DB->checkRecordIsExist('email', 'sekolah', $email)) {
                        throw new Exception("Email ($email) sudah tidak tersedia silahkan ganti dengan yang lain.");
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
            $nm_sekolah = addslashes($this->cmbAddSekolah->Text);
            $tmt = date('Y-m-d', $this->txtAddTanggalTMT->TimeStamp);
            $nip = addslashes($this->cmbAddNIP->Text);
            $str = "INSERT INTO r_pekerjaan_guru SET nm_sekolah='$nm_sekolah',tmt='$tmt',nip='$nip'";
            $this->DB->insertRecord($str);
            $this->Redirect('riwayat.Pekerjaan', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $id;
        $this->cmbEditSekolah->dataSource = $this->DMaster->getListSekolah();
        $this->cmbEditSekolah->dataBind();
        $this->cmbEditNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbEditNIP->dataBind();
        $str = "SELECT * FROM r_pekerjaan_guru WHERE id='$id'";
        $r = $this->DB->getRecord($str);
        $result = $r[1];
        $this->cmbEditSekolah->Text = $result['nm_sekolah'];
        $this->cmbEditNIP->Text = $result['nip'];
        $this->txtEditTanggalTMT->TimeStamp = $result['tmt'];
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $id = $this->hiddenid->Value;
            $nm_sekolah = $this->cmbEditSekolah->Text;
            $nip = $this->cmbEditNIP->Text;
            $tmt = date('Y-m-d', $this->txtEditTanggalTMT->TimeStamp);
            $str = "UPDATE r_pekerjaan_guru SET nm_sekolah='$nm_sekolah',tmt='$tmt',nip='$nip' WHERE id='$id'";
            $this->DB->updateRecord($str);
            $this->Redirect('riwayat.Pekerjaan', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("r_pekerjaan_guru WHERE id=$id");
        $this->DB->deleteRecord("user WHERE kode_sekolah=$id");
        $this->redirect('riwayat.Pekerjaan', true);
    }

}
