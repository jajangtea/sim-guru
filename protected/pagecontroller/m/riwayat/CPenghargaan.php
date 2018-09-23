<?php

prado::using('Application.MainPageM');

class CPenghargaan extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showPenghargaan = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['currentPagePenghargaan']) || $_SESSION['currentPagePenghargaan']['page_name'] != 'sa.dmaster.Penghargaan') {
                $_SESSION['currentPagePenghargaan'] = array('page_name' => 'sa.dmaster.Penghargaan', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPagePenghargaan']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPagePenghargaan']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPagePenghargaan']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPagePenghargaan']['search'] = true;
        $this->populateData($_SESSION['currentPagePenghargaan']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT rp.id,rp.nm_penghargaan,rp.nm_instansi_pemberi,rp.tahun, p.nama_lengkap  FROM r_penghargaan rp INNER JOIN pegawai p on rp.nip=p.nip";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'nip' :
                    $clausa = " AND rp.nip='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_penghargaan rp INNER JOIN pegawai p on rp.nip=p.nip $clausa", 'id');
                    $str = "$str $clausa";
                    break;
                case 'nm_sekolah' :
                    $clausa = " AND nm_sekolah LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_penghargaan rp INNER JOIN pegawai p on rp.nip=p.nip $clausa", 'id');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("r_penghargaan rp INNER JOIN pegawai p on rp.nip=p.nip", 'id');
            $str = "SELECT rp.nip,rp.id,rp.nm_penghargaan,rp.nm_instansi_pemberi,rp.tahun, p.nama_lengkap  FROM r_penghargaan rp INNER JOIN pegawai p on rp.nip=p.nip";
        }
        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPagePenghargaan']['page_num'];
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
            $_SESSION['currentPagePenghargaan']['page_num'] = 0;
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
            $nm_penghargaan = strtoupper(addslashes($this->txtAddNamaPenghargaan->Text));
            $nip = addslashes($this->cmbAddNIP->Text);
            $str = "INSERT INTO r_penghargaan SET nm_penghargaan='$nm_penghargaan',nm_instansi_pemberi='$nm_instansi',tahun='$lulus',nip='$nip'";
            $this->DB->insertRecord($str);
            $this->Redirect('riwayat.Penghargaan', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $id;
        $this->cmbEditNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbEditNIP->dataBind();
        $str = "SELECT * FROM r_penghargaan WHERE id='$id'";
        $r = $this->DB->getRecord($str);
        $result = $r[1];
        $this->cmbEditNIP->Text = $result['nip'];
        $this->txtEditNamaInstansi->Text = $result['nm_instansi_pemberi'];
        $this->txtEditNamaPenghargaan->Text = $result['nm_penghargaan'];
        $this->txtEditTahun->Text = $this->TGL->tanggal('Y', $result['tahun'] . date('-01-01'));
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $id = $this->hiddenid->Value;
            $lulus = date('Y-m-d', $this->txtEditTahun->TimeStamp);
            $nm_instansi = strtoupper(addslashes($this->txtEditNamaInstansi->Text));
            $nm_penghargaan = strtoupper(addslashes($this->txtEditNamaPenghargaan->Text));
            $nip = addslashes($this->cmbEditNIP->Text);
            $str = "UPDATE r_penghargaan SET nm_penghargaan='$nm_penghargaan',nm_instansi_pemberi='$nm_instansi',tahun='$lulus',nip='$nip' where id='$id'";
            $this->DB->updateRecord($str);
            $this->Redirect('riwayat.Penghargaan', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("r_penghargaan WHERE id=$id");
        $this->redirect('riwayat.Penghargaan', true);
    }

}
