<?php

prado::using('Application.MainPageM');

class CStatusKepegawaian extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showStatusKepegawaian = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['currentPageStatusKepegawaian']) || $_SESSION['currentPageStatusKepegawaian']['page_name'] != 'sa.dmaster.StatusKepegawaian') {
                $_SESSION['currentPageStatusKepegawaian'] = array('page_name' => 'sa.dmaster.StatusKepegawaian', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPageStatusKepegawaian']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPageStatusKepegawaian']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPageStatusKepegawaian']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPageStatusKepegawaian']['search'] = true;
        $this->populateData($_SESSION['currentPageStatusKepegawaian']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT kode,status FROM status_kepegawaian";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'kode' :
                    $clausa = "WHERE kode='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("status_kepegawaian $clausa", 'kode');
                    $str = "$str $clausa";
                    break;
                case 'status_kepegawaian' :
                    $clausa = "WHERE status LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("status_kepegawaian $clausa", 'kode');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("status_kepegawaian", 'kode');
            $str = "SELECT s.kode,s.status FROM status_kepegawaian s";
        }

        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPageStatusKepegawaian']['page_num'];
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
            $_SESSION['currentPageStatusKepegawaian']['page_num'] = 0;
        }
        $str = "$str ORDER BY status ASC LIMIT $offset,$limit";
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
                    if ($this->DB->checkRecordIsExist('kode', 'status_kepegawaian', $kode)) {
                        throw new Exception("KODE status kepegawaian ($kode) sudah tidak tersedia silahkan ganti dengan yang lain.");
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
            $status = strtoupper(addslashes($this->txtAddStatus->Text));
            $str = "INSERT INTO status_kepegawaian SET kode='$kode',status='$status'";
            $this->DB->insertRecord($str);
            $this->Redirect('dmaster.StatusKepegawaian', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $kode = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $kode;

        $str = "SELECT kode,status FROM status_kepegawaian WHERE kode='$kode'";
        $r = $this->DB->getRecord($str);
        $result = $r[1];
        $this->txtEditKode->Text = $result['kode'];
        $this->txtEditStatus->Text = $result['status'];
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $kode_old = $this->hiddenid->Value;
            $kode = addslashes($this->txtEditKode->Text);
            $status = strtoupper(addslashes($this->txtEditStatus->Text));
            $str = "UPDATE status_kepegawaian SET kode='$kode',status='$status' WHERE kode=$kode_old";
            $this->DB->updateRecord($str);
            $this->Redirect('dmaster.StatusKepegawaian', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $kode = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("status_kepegawaian WHERE kode=$kode");
        $this->redirect('dmaster.StatusKepegawaian', true);
    }

}
