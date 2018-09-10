<?php

prado::using('Application.MainPageM');

class CBidangStudiSertifikasi extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showBidangStudiSertifikasi = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['']) || $_SESSION['currentPageBidangStudiSertifikasi']['page_name'] != 'sa.dmaster.BidangStudiSertifikasi') {
                $_SESSION['currentPageBidangStudiSertifikasi'] = array('page_name' => 'sa.dmaster.BidangStudiSertifikasi', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPageBidangStudiSertifikasi']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPageBidangStudiSertifikasi']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPageBidangStudiSertifikasi']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPageBidangStudiSertifikasi']['search'] = true;
        $this->populateData($_SESSION['currentPageBidangStudiSertifikasi']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT kode,nama_bidang_studi FROM bidang_studi_sertifikasi";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'kode' :
                    $clausa = "WHERE kode='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("bidang_studi_sertifikasi $clausa", 'kode');
                    $str = "$str $clausa";
                    break;
                case 'bidang_studi_sertifikasi' :
                    $clausa = "WHERE nama_bidang_studi LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("bidang_studi_sertifikasi $clausa", 'kode');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("bidang_studi_sertifikasi", 'kode');
            $str = "SELECT s.kode,s.nama_bidang_studi FROM bidang_studi_sertifikasi s";
        }

        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPageBidangStudiSertifikasi']['page_num'];
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
            $_SESSION['currentPageBidangStudiSertifikasi']['page_num'] = 0;
        }
        $str = "$str ORDER BY nama_bidang_studi ASC LIMIT $offset,$limit";
        $r = $this->DB->getRecord($str, $offset + 1);

        $this->RepeaterS->DataSource = $r;
        $this->RepeaterS->dataBind();
        $this->paginationInfo->Text = $this->getInfoPaging($this->RepeaterS);
    }

    public function addProcess($sender, $param) {
        $this->idProcess = 'add';
    }

    public function checkKode($sender, $param) {
        $this->idProcess = $sender->getId() == 'addNidn' ? 'add' : 'edit';
        $kode = $param->Value;
        if ($kode != '') {
            try {
                if ($this->hiddenid->Value != $kode) {
                    if ($this->DB->checkRecordIsExist('kode', 'bidang_studi_sertifikasi', $kode)) {
                        throw new Exception("KODE nama_bidang_studi kepegawaian ($kode) sudah tidak tersedia silahkan ganti dengan yang lain.");
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
            $kode = addslashes($this->txtAddKode->Text);
            $nama_bidang_studi = strtoupper(addslashes($this->txtAddNamaBidangStudi->Text));
            $str = "INSERT INTO bidang_studi_sertifikasi SET kode='$kode',nama_bidang_studi='$nama_bidang_studi'";
            $this->DB->insertRecord($str);
            $this->Redirect('dmaster.BidangStudiSertifikasi', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $kode = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $kode;

        $str = "SELECT kode,nama_bidang_studi FROM bidang_studi_sertifikasi WHERE kode='$kode'";
        $r = $this->DB->getRecord($str);
        $result = $r[1];
        $this->txtEditKode->Text = $result['kode'];
        $this->txtEditNamaBidangStudi->Text = $result['nama_bidang_studi'];
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $kode_old = $this->hiddenid->Value;
            $kode = addslashes($this->txtEditKode->Text);
            $nama_bidang_studi = strtoupper(addslashes($this->txtEditNamaBidangStudi->Text));
            $str = "UPDATE bidang_studi_sertifikasi SET kode='$kode',nama_bidang_studi='$nama_bidang_studi' WHERE kode='$kode_old'";
            $this->DB->updateRecord($str);
            $this->Redirect('dmaster.BidangStudiSertifikasi', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $kode = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("bidang_studi_sertifikasi WHERE kode='$kode'");
        $this->redirect('dmaster.BidangStudiSertifikasi', true);
    }

}
