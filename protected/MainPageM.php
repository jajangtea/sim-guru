<?php

class MainPageM extends MainPage {   
    /**     
     * show menu data master
     */
    public $showDMaster=false; 
     /**     
     * show menu showPendidikan
     */
    public $showPendidikan=false; 
     /**     
     * show menu showPekerjaan
     */
    public $showPekerjaan=false; 
     /**     
     * show menu showKepangkatan
     */
    public $showKepangkatan=false; 
     /**     
     * show menu IdentitasPegawai
     */
    public $showIdentitasPegawai=false; 
    /**     
     * show menu bidang studi sertifikasi
     */
    public $showBidangStudiSertifikasi=false; 
     /**     
     * show page Status Kepegawaian [datamaster]
     */
    public $showStatusKepegawaian=false; 
    /**     
     * show page Sekolah [datamaster]
     */
    public $showSekolah=false; 
    /**     
     * show page Guru [datamaster]
     */
    public $showGuru=false; 
    /**     
     * show menu setting user
     */
    public $showSettingUser=false; 
    /**     
     * show page user super admin [setting user]
     */
    public $showUserDISDIK=false; 
    /**     
     * show page cache [setting]
     */
    public $showCache=false;
	public function OnPreInit ($param) {   
        parent::onPreInit ($param); 
        $theme=$_SESSION['theme'];
        $this->Theme=$theme;        
        $this->MasterClass="Application.layouts.$theme.MainTemplate";          
    }
    public function onLoad ($param) {       
        parent::onLoad($param);        
    }
}