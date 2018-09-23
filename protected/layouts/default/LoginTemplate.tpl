<!DOCTYPE html>
<!--[if IE 8]> <html lang="id" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="id">
<!--<![endif]-->
<com:THead>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="Sistem Informasi Guru Kab. Karimun" name="description" />
	<meta content="TIM IT DISDIK Kab. Karimun" name="author" />	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->	
	<link href="<%=$this->Page->Theme->baseUrl%>/assets/plugins/bootstrap/bootstrap4/css/bootstrap.min.css" rel="stylesheet" />
	<link href="<%=$this->Page->Theme->baseUrl%>/assets/plugins/icon/themify-icons/themify-icons.css" rel="stylesheet" />
	<link href="<%=$this->Page->Theme->baseUrl%>/assets/css/animate.min.css" rel="stylesheet" />
	<link href="<%=$this->Page->Theme->baseUrl%>/assets/css/style.min.css" rel="stylesheet" />
	<!-- ================== END BASE CSS STYLE ================== -->
</com:THead>
<body class="inverse-mode">
<com:TForm>			
<com:TOutputCache>
    <com:TClientScript PradoScripts="jqueryui,effects" />
</com:TOutputCache> 	
<!-- BEGIN #page-container -->
<div id="page-container">
	<!-- BEGIN login -->
    <div class="login">
		<!-- BEGIN login-cover -->
		<div class="login-cover"></div>
		<!-- END login-cover -->
		<com:TContentPlaceHolder ID="maincontent" />		
    </div>
    <!-- END login -->	
	<!-- BEGIN btn-scroll-top -->
	<a href="#" data-click="scroll-top" class="btn-scroll-top fade"><i class="ti-arrow-up"></i></a>
	<!-- END btn-scroll-top -->
</div>
<!-- END #page-container -->
</com:TForm>
<!-- ================== BEGIN BASE JS ================== -->	
<script src="<%=$this->Page->Theme->baseUrl%>/assets/plugins/loader/pace/pace.min.js"></script>		
<script src="<%=$this->Page->Theme->baseUrl%>/assets/plugins/cookie/js/js.cookie.js"></script>
<script src="<%=$this->Page->Theme->baseUrl%>/assets/plugins/tooltip/popper/popper.min.js"></script>
<script src="<%=$this->Page->Theme->baseUrl%>/assets/plugins/bootstrap/bootstrap4/js/bootstrap.min.js"></script>
<script src="<%=$this->Page->Theme->baseUrl%>/assets/plugins/scrollbar/slimscroll/jquery.slimscroll.min.js"></script>
<!-- ================== END BASE JS ================== -->
	
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="<%=$this->Page->Theme->baseUrl%>/assets/js/apps.min.js"></script>
<script src="<%=$this->Page->Theme->baseUrl%>/assets/js/aplikasi.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->	
</body>
</html>
