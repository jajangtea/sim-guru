<?php
class MainPageF extends MainPage {
    public function OnPreInit ($param) {	
		parent::onPreInit ($param);	
		$theme=$_SESSION['theme'];
        $this->Theme=$theme;        
		$this->MasterClass="Application.layouts.default.FrontendTemplate";	
        
	}
	public function onLoad ($param) {		
		parent::onLoad($param);	       
	}
}