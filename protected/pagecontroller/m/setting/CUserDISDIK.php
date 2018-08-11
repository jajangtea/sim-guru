<?php
prado::using ('Application.MainPageM');
class CUserDISDIK extends MainPageM {
	public function onLoad($param) {		
		parent::onLoad($param);
		$this->showSettingUser=true;		            
        $this->showUserDISDIK=true;
		if (!$this->IsPostBack&&!$this->IsCallBack) {              
            if (!isset($_SESSION['currentPageUserDISDIK'])||$_SESSION['currentPageUserDISDIK']['page_name']!='m.UserDISDIK') {
                $_SESSION['currentPageUserDISDIK']=array('page_name'=>'m.UserDISDIK','page_num'=>0,'search'=>false);												
			}
			$_SESSION['currentPageUserDISDIK']['search']=false;
			$this->populateData ();
		}
	}
	public function renderCallback ($sender,$param) {
		$this->RepeaterS->render($param->NewWriter);	
	}	
	public function Page_Changed ($sender,$param) {
		$_SESSION['currentPageUserDISDIK']['page_num']=$param->NewPageIndex;
		$this->populateData();
	} 
	protected function populateData () {
        $this->RepeaterS->CurrentPageIndex=$_SESSION['currentPageUserDISDIK']['page_num'];
		$jumlah_baris=$this->DB->getCountRowsOfTable ('user where page="m"','userid');		
		$this->RepeaterS->VirtualItemCount=$jumlah_baris;
		$currentPage=$this->RepeaterS->CurrentPageIndex;
		$offset=$currentPage*$this->RepeaterS->PageSize;		
		$itemcount=$this->RepeaterS->VirtualItemCount;
		$limit=$this->RepeaterS->PageSize;
		if (($offset+$limit)>$itemcount) {
			$limit=$itemcount-$offset;
		}
		if ($limit < 0) {$offset=0;$limit=10;$_SESSION['currentPageUserDISDIK']['page_num']=0;}
        $str = "SELECT userid, username, email, page FROM user where page='m' ORDER BY username ASC LIMIT $offset,$limit";
		$r=$this->DB->getRecord($str,$offset+1);    

		$this->RepeaterS->DataSource=$r;
		$this->RepeaterS->dataBind();

		$this->paginationInfo->Text=$this->getInfoPaging($this->RepeaterS); 
	}
	public function addProcess ($sender,$param) {
		$this->idProcess='add';
	}
	public function checkUsername ($sender,$param) {
		$this->idProcess=$sender->getId()==='checkAddUsername'?'add':'edit';
        $username=$param->Value;
        if ($username != '') {
            try {
                if ($this->hiddenusername->Value != $username){                                        
                    if ($this->DB->checkRecordIsExist ('username','user',$username)) {
                        throw new Exception("($username) sudah tersedia silahkan ganti dengan yang lain.");				
                    }
                }
            }catch (Exception $e) {
                $param->IsValid=false;
                $sender->ErrorMessage=$e->getMessage();
            }
        }		
	}
	public function saveData ($sender,$param) {
		if ($this->Page->IsValid) {
            $username=addslashes($this->txtAddUsername->Text);
			$userpassword=strtoupper(addslashes($this->txtAddPassword->Text));
			$data_password=$this->Pengguna->createHashPassword($userpassword);
			
			$userpassword=$data_password['password'];
			$salt=$data_password['salt'];

			$str = "INSERT INTO user SET username='$username', userpassword='$userpassword', salt='$salt', page='m',theme='default', photo_profile='resources/userimages/no_photo.png' ";
			$this->DB->insertRecord($str);
            $this->Pengguna->insertNewActivity($this->Page->getPagePath(),"Menambah data user dengan username ( $username) berhasil dilakukan.");
            $this->redirect('setting.UserDISDIK',true);
		}
	}
	public function editRecord ($sender,$param) {
		$this->idProcess='edit';
		$id=$this->getDataKeyField($sender,$this->RepeaterS);
		$result = $this->DB->getRecord("SELECT userid,username from user WHERE userid='$id'");
		$this->hiddenid->Value=$id;		
		$this->txtEditUsername->Text=$result[1]['username'];
		$this->hiddenusername->Value=$result[1]['username'];		
	}
	public function updateData ($sender,$param) {
		if ($this->Page->IsValid) {
			$id=$this->hiddenid->Value;
            $username=addslashes($this->txtAddUsername->Text);
			$userpassword=strtoupper(addslashes($this->txtAddPassword->Text));
			if ($userpassword == '') {
				$str = "UPDATE user SET username='$username' WHERE userid=$id";
				$this->DB->updateRecord($str);
			}else{
				$data_password=$this->Pengguna->createHashPassword($userpassword);
			
				$userpassword=$data_password['password'];
				$salt=$data_password['salt'];

				$str = "UPDATE user SET username='$username', userpassword='$userpassword', salt='$salt', page='m',theme='default', photo_profile='resources/userimages/no_photo.png' WHERE userid=$id";
				$this->DB->updateRecord($str);
			}
			
            $this->Pengguna->insertNewActivity($this->Page->getPagePath(),"Mengubah data user dengan username ( $username) berhasil dilakukan.");
            $this->redirect('setting.UserDISDIK',true);
		}
	}
	public function deleteRecord ($sender,$param) {
		$this->idProcess='edit';
		$id=$this->getDataKeyField($sender,$this->RepeaterS);
		$this->DB->deleteRecord("user WHERE userid=$id");
		$this->redirect('setting.UserDISDIK',true);
	}
}