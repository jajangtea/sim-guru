<?php

prado::using('Application.MainPageM');

class CTpegawai extends MainPageM {

    public function onLoad($param) {
        parent::onLoad($param);
        $this->showTpegawai = true;
        $this->createObj('DMaster');
        if (!$this->IsPostBack && !$this->IsCallback) {
            if (!isset($_SESSION['currentPageTpegawai']) || $_SESSION['currentPageTpegawai']['page_name'] != 'sa.dmaster.Tpegawai') {
                $_SESSION['currentPageTpegawai'] = array('page_name' => 'sa.dmaster.Tpegawai', 'page_num' => 0, 'search' => false);
            }
            $_SESSION['currentPageTpegawai']['search'] = false;
            $this->populateData();
        }
    }

    public function renderCallback($sender, $param) {
        $this->RepeaterS->render($param->NewWriter);
    }

    public function Page_Changed($sender, $param) {
        $_SESSION['currentPageTpegawai']['page_num'] = $param->NewPageIndex;
        $this->populateData($_SESSION['currentPageTpegawai']['search']);
    }

    public function searchRecord($sender, $param) {
        $_SESSION['currentPageTpegawai']['search'] = true;
        $this->populateData($_SESSION['currentPageTpegawai']['search']);
    }

    protected function populateData($search = false) {
        if ($search) {
            $str = "SELECT tp.id, tp.tmt, tp.nomor_sk, ta.tahun_ajaran, tp.nip, j.nama_jabatan,pg.nama_lengkap,sk.nama FROM r_tt_pegawai tp INNER JOIN jabatan j on j.id=tp.id INNER JOIN ta ta on ta.id=tp.id INNER JOIN pegawai pg on tp.nip=pg.nip INNER JOIN sekolah sk on tp.kode=tp.kode
";
            $txtsearch = addslashes($this->txtKriteria->Text);
            switch ($this->cmbKriteria->Text) {
                case 'nip' :
                    $clausa = " AND rp.nip='$txtsearch'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("FROM r_tt_pegawai tp INNER JOIN jabatan j on j.id=tp.id_jabatan INNER JOIN ta ta on ta.id=tp.ta INNER JOIN pegawai pg on tp.nip=pg.nip INNER JOIN sekolah sk on tp.kode=sk.kode $clausa", 'id');
                    $str = "$str $clausa";
                    break;
                case 'nm_sekolah' :
                    $clausa = " AND nm_sekolah LIKE '%$txtsearch%'";
                    $jumlah_baris = $this->DB->getCountRowsOfTable("FROM r_tt_pegawai tp INNER JOIN jabatan j on j.id=tp.id_jabatan INNER JOIN ta ta on ta.id=tp.ta INNER JOIN pegawai pg on tp.nip=pg.nip INNER JOIN sekolah sk on tp.kode=sk.kode $clausa", 'id');
                    $str = "$str $clausa";
                    break;
            }
        } else {
            $jumlah_baris = $this->DB->getCountRowsOfTable("r_tt_pegawai tp INNER JOIN jabatan j on j.id=tp.id_jabatan INNER JOIN ta ta on ta.id=tp.ta INNER JOIN pegawai pg on tp.nip=pg.nip INNER JOIN sekolah sk on tp.kode=sk.kode", 'tp.id');
            $str = "SELECT tp.id, tp.tmt, tp.nomor_sk, ta.tahun_ajaran, tp.nip, j.nama_jabatan,pg.nama_lengkap,sk.nama,sk.kode FROM r_tt_pegawai tp INNER JOIN jabatan j on j.id=tp.id_jabatan INNER JOIN ta ta on ta.id=tp.ta INNER JOIN pegawai pg on tp.nip=pg.nip INNER JOIN sekolah sk on tp.kode=sk.kode";
        }
        $this->RepeaterS->CurrentPageIndex = $_SESSION['currentPageTpegawai']['page_num'];
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
            $_SESSION['currentPageTpegawai']['page_num'] = 0;
        }
        $str = "$str ORDER BY tp.nip ASC LIMIT $offset,$limit";
        $r = $this->DB->getRecord($str, $offset + 1);

        $this->RepeaterS->DataSource = $r;
        $this->RepeaterS->dataBind();
        $this->paginationInfo->Text = $this->getInfoPaging($this->RepeaterS);
    }

    public function addProcess($sender, $param) {
        $this->idProcess = 'add';

        $this->cmbAddNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbAddNIP->dataBind();

        $this->cmbAddJabatan->dataSource = $this->DMaster->getListJabatan();
        $this->cmbAddJabatan->dataBind();

        $this->cmbAddTA->dataSource = $this->DMaster->getListTA();
        $this->cmbAddTA->dataBind();

        $this->cmbAddSekolah->dataSource = $this->DMaster->getListSekolah();
        $this->cmbAddSekolah->dataBind();
    }

    public function saveData($sender, $param) {
        if ($this->Page->isValid) {
            $tmt = date('Y-m-d', $this->txtAddTMT->TimeStamp);
            $nomor_sk = strtoupper(addslashes($this->txtAddNomorSK->Text));
            $ta = strtoupper(addslashes($this->cmbAddTA->Text));
            $nip = addslashes($this->cmbAddNIP->Text);
            $id_jabatan = addslashes($this->cmbAddJabatan->Text);
            $kode = addslashes($this->cmbAddSekolah->Text);
            $str = "INSERT r_tt_pegawai SET tmt='$tmt',nomor_sk='$nomor_sk',ta='$ta',nip='$nip',id_jabatan='$id_jabatan',kode='$kode'";
            $this->DB->insertRecord($str);
            $this->Redirect('riwayat.Tpegawai', true);
        }
    }

    public function editRecord($sender, $param) {
        $this->idProcess = 'edit';
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->hiddenid->Value = $id;

        $this->cmbEditNIP->dataSource = $this->DMaster->getListNIP();
        $this->cmbEditNIP->dataBind();

        $this->cmbEditJabatan->dataSource = $this->DMaster->getListJabatan();
        $this->cmbEditJabatan->dataBind();

        $this->cmbEditTA->dataSource = $this->DMaster->getListTA();
        $this->cmbEditTA->dataBind();

        $this->cmbEditSekolah->dataSource = $this->DMaster->getListSekolah();
        $this->cmbEditSekolah->dataBind();

        $str = "SELECT tp.id,tp.ta,tp.id_jabatan, tp.tmt, tp.nomor_sk, ta.tahun_ajaran, tp.nip, j.nama_jabatan,pg.nama_lengkap,sk.nama,sk.kode FROM r_tt_pegawai tp INNER JOIN jabatan j on j.id=tp.id_jabatan INNER JOIN ta ta on ta.id=tp.ta INNER JOIN pegawai pg on tp.nip=pg.nip INNER JOIN sekolah sk on tp.kode=sk.kode WHERE tp.id='$id'";

        $r = $this->DB->getRecord($str);
        $result = $r[1];

        $this->cmbEditNIP->Text = $result['nip'];
        $this->txtEditNomorSK->Text = $result['nomor_sk'];
        $this->cmbEditTA->Text = $result['tahun_ajaran'];
        $this->cmbEditSekolah->Text = $result['kode'];
        $this->cmbEditTA->Text = $result['ta'];
        $this->cmbEditJabatan->Text = $result['id_jabatan'];
        $this->txtEditTMT->Text = $this->TGL->tanggal('Y', $result['tmt'] . date('-01-01'));
    }

    public function updateData($sender, $param) {
        if ($this->Page->isValid) {
            $id = $this->hiddenid->Value;
            $tmt = date('Y-m-d', $this->txtEditTMT->TimeStamp);
            $nomor_sk = strtoupper(addslashes($this->txtEditNomorSK->Text));
            $ta = strtoupper(addslashes($this->cmbEditTA->Text));
            $nip = addslashes($this->cmbEditNIP->Text);
            $id_jabatan = addslashes($this->cmbEditJabatan->Text);
            $kode = addslashes($this->cmbEditSekolah->Text);
            $str = "UPDATE r_tt_pegawai SET tmt='$tmt',nomor_sk='$nomor_sk',ta='$ta',nip='$nip',id_jabatan='$id_jabatan',kode='$kode'";
            $this->DB->updateRecord($str);
            $this->Redirect('riwayat.Tpegawai', true);
        }
    }

    public function deleteRecord($sender, $param) {
        $id = $this->getDataKeyField($sender, $this->RepeaterS);
        $this->DB->deleteRecord("r_tt_pegawai WHERE id=$id");
        $this->redirect('riwayat.Tpegawai', true);
    }

}
