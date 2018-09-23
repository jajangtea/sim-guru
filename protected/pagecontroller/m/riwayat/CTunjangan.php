<?php

prado::using('Application.MainPageM');

class CTunjangan extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showTunjangan = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['currentPageTunjangan']) || $_SESSION['currentPageTunjangan']['page_name'] != 'sa.dmaster.Tunjangan') {
                $_SESSION['currentPageTunjangan'] = array('page_name' => 'sa.dmaster.Tunjangan', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPageTunjangan']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPageTunjangan']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPageTunjangan']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPageTunjangan']['search'] = true;
        $this->populateData($_SESSION['currentPageTunjangan']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT rp.id,rp.nm_tunjangan,rp.nm_instansi_pemberi,rp.tahun, p.nama_lengkap  FROM r_tunjangan rp INNER JOIN pegawai p on rp.nip=p.nip";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'nip' :
                    $clausa = " AND rp.nip='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_tunjangan rp INNER JOIN pegawai p on rp.nip=p.nip $clausa", 'id');
                    $str = "$str $clausa";
                    break;
                case 'nm_sekolah' :
                    $clausa = " AND nm_sekolah LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_tunjangan rp INNER JOIN pegawai p on rp.nip=p.nip $clausa", 'id');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("r_tunjangan rp INNER JOIN pegawai p on rp.nip=p.nip", 'id');
            $str = "SELECT rp.nip,rp.id,rp.nm_tunjangan,rp.nm_instansi_pemberi,rp.tahun, p.nama_lengkap  FROM r_tunjangan rp INNER JOIN pegawai p on rp.nip=p.nip";
        }
        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPageTunjangan']['page_num'];
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
            $_SESSION['currentPageTunjangan']['page_num'] = 0;
        }
        $str = "$str ORDER BY rp.nip ASC LIMIT $offset,$limit";
        $r = $this->DB->getRecord($str, $offset + 1);

        $this->RepeaterS->DataSource = $r;
        $this->RepeaterS->dataBind();
        $this->paginationInfo->Text = $this->getInfoPaging($this->RepeaterS);
    }

    public function addProcess($sender, $param) {
        $this->idProcess = 'add';


        $this->cmbAddNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbAddNIP->dataBind();
    }

    public function saveData($sender, $param) {
        if ($this->Page->isValid) {
            $lulus = date('Y-m-d', $this->txtAddTahun->TimeStamp);
            $nm_instansi = strtoupper(addslashes($this->txtAddNamaInstansi->Text));
            $nm_tunjangan = strtoupper(addslashes($this->txtAddNamaTunjangan->Text));
            $nip = addslashes($this->cmbAddNIP->Text);
            $str = "INSERT INTO r_tunjangan SET nm_tunjangan='$nm_tunjangan',nm_instansi_pemberi='$nm_instansi',tahun='$lulus',nip='$nip'";
            $this->DB->insertRecord($str);
            $this->Redirect('riwayat.Tunjangan', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $id;
        $this->cmbEditNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbEditNIP->dataBind();
        $str = "SELECT * FROM r_tunjangan WHERE id='$id'";
        $r = $this->DB->getRecord($str);
        $result = $r[1];
        $this->cmbEditNIP->Text = $result['nip'];
        $this->txtEditNamaInstansi->Text = $result['nm_instansi_pemberi'];
        $this->txtEditNamaTunjangan->Text = $result['nm_tunjangan'];
        $this->txtEditTahun->Text = $this->TGL->tanggal('Y', $result['tahun'] . date('-01-01'));
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $id = $this->hiddenid->Value;
            $lulus = date('Y-m-d', $this->txtEditTahun->TimeStamp);
            $nm_instansi = strtoupper(addslashes($this->txtEditNamaInstansi->Text));
            $nm_tunjangan = strtoupper(addslashes($this->txtEditNamaTunjangan->Text));
            $nip = addslashes($this->cmbEditNIP->Text);
            $str = "UPDATE r_tunjangan SET nm_tunjangan='$nm_tunjangan',nm_instansi_pemberi='$nm_instansi',tahun='$lulus',nip='$nip' where id='$id'";
            $this->DB->updateRecord($str);
            $this->Redirect('riwayat.Tunjangan', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("r_tunjangan WHERE id=$id");
        $this->redirect('riwayat.Tunjangan', true);
    }

}
