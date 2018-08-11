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
            $str = "SELECT kode,nama,alamat,idkecamatan,email,jumlah_rombel,status FROM sekolah";
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
            $jumlah_baris = $this->DB->getCountRowsOfTable("sekolah", 'kode');
            $str = "SELECT s.kode,s.nama,s.alamat,k.nama_kecamatan,s.email,s.jumlah_rombel,s.status FROM sekolah s LEFT JOIN kecamatan k ON (s.idkecamatan=k.idkecamatan)";
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
        $str = "$str ORDER BY nama ASC LIMIT $offset,$limit";
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
    }

    public function checkKode($sender, $param) {
        $this->idProcess = $sender->getId() == 'addNidn' ? 'add' : 'edit';
        $kode = $param->Value;
        if ($kode != '') {
            try {
                if ($this->hiddenid->Value != $kode) {
                    if ($this->DB->checkRecordIsExist('kode', 'sekolah', $kode)) {
                        throw new Exception("KODE sekolah ($kode) sudah tidak tersedia silahkan ganti dengan yang lain.");
                    }
                }
            } catch (Exception $e) {
                $param->IsValid = false;
                $sender->ErrorMessage = $e->getMessage();
            }
        }
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
            $kode = addslashes($this->txtAddKode->Text);
            $nama = strtoupper(addslashes($this->txtAddNama->Text));
            $alamat_sekolah = strtoupper(addslashes($this->txtAddAlamat->Text));
            $idkecamatan = $this->cmbAddKecamatan->Text;
            $email = addslashes($this->txtAddEmail->Text);
            $jumlah_rombel = addslashes($this->txtAddRombel->Text);

            $str = "INSERT INTO sekolah SET kode='$kode',nama='$nama',alamat='$alamat_sekolah',idkecamatan='$idkecamatan',email='$email',jumlah_rombel='$jumlah_rombel'";
            $this->DB->insertRecord($str);

            $this->Redirect('dmaster.Sekolah', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $kode = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $kode;

        $str = "SELECT kode,nama,alamat,idkecamatan,email,jumlah_rombel,status FROM sekolah WHERE kode='$kode'";
        $r = $this->DB->getRecord($str);
        $result = $r[1];

        $this->txtEditKode->Text = $result['kode'];
        $this->txtEditNama->Text = $result['nama'];
        $this->txtEditAlamat->Text = $result['alamat'];
        $this->cmbEditKecamatan->dataSource = $this->DMaster->getListKecamatan();
        $this->cmbEditKecamatan->dataBind();
        $this->cmbEditKecamatan->Text = $result['idkecamatan'];
        $this->txtEditEmail->Text = $result['email'];
        $this->hiddenemail->Value = $result['email'];
        $this->txtEditRombel->Text = $result['jumlah_rombel'];

        $this->cmbEditStatus->Text = $result['status'];
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $kode_old = $this->hiddenid->Value;
            $kode = addslashes($this->txtEditKode->Text);
            $nama = strtoupper(addslashes($this->txtEditNama->Text));
            $alamat_sekolah = strtoupper(addslashes($this->txtEditAlamat->Text));
            $idkecamatan = $this->cmbEditKecamatan->Text;
            $email = addslashes($this->txtEditEmail->Text);
            $jumlah_rombel = addslashes($this->txtEditRombel->Text);
            $status = $this->cmbEditStatus->Text;

            $str = "UPDATE sekolah SET kode='$kode',nama='$nama',alamat='$alamat_sekolah',idkecamatan='$idkecamatan',email='$email',jumlah_rombel='$jumlah_rombel',status=$status WHERE kode=$kode_old";
            $this->DB->updateRecord($str);

            $this->Redirect('dmaster.Sekolah', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $kode = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("sekolah WHERE kode=$kode");
        $this->DB->deleteRecord("user WHERE kode_sekolah=$kode");
        $this->redirect('dmaster.Sekolah', true);
    }

}
