<?php

prado::using('Application.MainPageM');

class CPendidikan extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showPendidikan = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['currentPagePendidikan']) || $_SESSION['currentPagePendidikan']['page_name'] != 'sa.dmaster.Pendidikan') {
                $_SESSION['currentPagePendidikan'] = array('page_name' => 'sa.dmaster.Pendidikan', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPagePendidikan']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPagePendidikan']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPagePendidikan']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPagePendidikan']['search'] = true;
        $this->populateData($_SESSION['currentPagePendidikan']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT rp.id,rp.jenjang,rp.nm_jurusan,rp.nm_sekolah,rp.th_lulus,rp.ipk,rp.nip,p.nama_lengkap  FROM r_pendidikan rp INNER JOIN pegawai p on rp.nip=p.nip";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'nip' :
                    $clausa = " AND rp.nip='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_pendidikan rp INNER JOIN pegawai p on rp.nip=p.nip $clausa", 'id');
                    $str = "$str $clausa";
                    break;
                case 'nm_sekolah' :
                    $clausa = " AND nm_sekolah LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("r_pendidikan rp INNER JOIN pegawai p on rp.nip=p.nip $clausa", 'id');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("r_pendidikan rp INNER JOIN pegawai p on rp.nip=p.nip", 'id');
            $str = "SELECT rp.id,rp.jenjang,rp.nm_jurusan,rp.nm_sekolah,rp.th_lulus,rp.ipk,rp.nip,p.nama_lengkap  FROM r_pendidikan rp INNER JOIN pegawai p on rp.nip=p.nip";
        }
        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPagePendidikan']['page_num'];
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
            $_SESSION['currentPagePendidikan']['page_num'] = 0;
        }
        $str = "$str ORDER BY nip ASC LIMIT $offset,$limit";
        $r = $this->DB->getRecord($str, $offset + 1);

        $this->RepeaterS->DataSource = $r;
        $this->RepeaterS->dataBind();
        $this->paginationInfo->Text = $this->getInfoPaging($this->RepeaterS);
    }

    public function addProcess($sender, $param) {
        $this->idProcess = 'add';

        $this->cmbAddJenjang->dataSource = $this->DMaster->getListJenjang();
        $this->cmbAddJenjang->dataBind();
        $this->cmbAddNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbAddNIP->dataBind();
    }

    public function saveData($sender, $param) {
        if ($this->Page->isValid) {
            $jenjang = addslashes($this->cmbAddJenjang->Text);
            $th_lulus = date('Y-m-d', $this->txtAddTahunLulus->TimeStamp);
            $nm_jurusan = strtoupper(addslashes($this->txtAddNamaJurusan->Text));
            $nm_sekolah = strtoupper(addslashes($this->txtAddNamaSekolah->Text));
            $ipk = strtoupper(addslashes($this->txtAddIPK->Text));
            $nip = addslashes($this->cmbAddNIP->Text);
            $str = "INSERT INTO r_pendidikan set jenjang='$jenjang', nm_jurusan='$nm_jurusan', nm_sekolah='$nm_sekolah', th_lulus='$th_lulus', ipk='$ipk', nip='$nip'";
            $this->DB->insertRecord($str);
            $this->Redirect('riwayat.Pendidikan', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $id;
        $this->cmbEditNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbEditNIP->dataBind();
        $str = "SELECT * FROM r_pendidikan WHERE id='$id'";
        $r = $this->DB->getRecord($str);
        $result = $r[1];
        $this->cmbEditJenjang->dataSource = $this->DMaster->getListJenjang();
        $this->cmbEditJenjang->dataBind();
        $this->cmbEditJenjang->Text = $result['jenjang'];

        $this->txtEditNamaSekolah->Text = $result['nm_sekolah'];
        $this->cmbEditNIP->Text = $result['nip'];
        $this->txtEditIPK->Text = $result['ipk'];
        $this->txtEditNamaJurusan->Text = $result['nm_jurusan'];
        $this->txtEditTahunLulus->Text=$this->TGL->tanggal('Y',$result['th_lulus'].date('-01-01'));
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $id = $this->hiddenid->Value;
            $jenjang = addslashes($this->cmbEditJenjang->Text);
            $th_lulus = date('Y', $this->txtEditTahunLulus->TimeStamp);
            $nm_jurusan = strtoupper(addslashes($this->txtEditNamaJurusan->Text));
            $nm_sekolah = strtoupper(addslashes($this->txtEditNamaSekolah->Text));
            $ipk = strtoupper(addslashes($this->txtEditIPK->Text));
            $nip = addslashes($this->cmbEditNIP->Text);
            $str = "UPDATE r_pendidikan set jenjang='$jenjang', nm_jurusan='$nm_jurusan', nm_sekolah='$nm_sekolah', th_lulus='$th_lulus', ipk='$ipk', nip='$nip' where id='$id'";
            $this->DB->updateRecord($str);
            $this->Redirect('riwayat.Pendidikan', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("r_pendidikan WHERE id=$id");
        $this->redirect('riwayat.Pendidikan', true);
    }

}
