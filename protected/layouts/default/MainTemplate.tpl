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
        <link href="<%=$this->Page->Theme->baseUrl%>/assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
        <link href="<%=$this->Page->Theme->baseUrl%>/assets/plugins/bootstrap/bootstrap4/css/bootstrap.min.css" rel="stylesheet" />
        <link href="<%=$this->Page->Theme->baseUrl%>/assets/plugins/icon/themify-icons/themify-icons.css" rel="stylesheet" />
        <link href="<%=$this->Page->Theme->baseUrl%>/assets/css/animate.min.css" rel="stylesheet" />
        <link href="<%=$this->Page->Theme->baseUrl%>/assets/css/style.min.css" rel="stylesheet" />
        <!-- ================== END BASE CSS STYLE ================== -->	
        <link rel="stylesheet" href="<%=$this->Page->Theme->baseUrl%>/assets/css/aplikasi.css">    
        <com:TContentPlaceHolder ID="csscontent" />	
        <style type="text/css">
            .TDatePicker_default
            {
                z-index: 10000 !important;
            }
        </style>
    </com:THead>
    <body>
    <com:TForm>
        <com:TOutputCache>
            <com:TClientScript PradoScripts="jqueryui,effects" />
        </com:TOutputCache> 	
        <!-- BEGIN #page-container -->
        <div id="page-container" class="page-header-fixed page-sidebar-fixed">
            <!-- BEGIN #header -->
            <div id="header" class="header navbar navbar-default navbar-fixed-top">
                <!-- BEGIN container-fluid -->
                <div class="container-fluid">
                    <!-- BEGIN mobile sidebar expand / collapse button -->
                    <div class="navbar-header">
                        <a href="<%=$this->Page->constructUrl('Home',true)%>" class="navbar-brand">
                            <i class="ti-infinite navbar-logo text-gradient bg-gradient-blue-purple"></i>
                            <b>SIM-Guru</b> Disdik Kab. Karimun
                        </a>
                        <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- END mobile sidebar expand / collapse button -->
                    <!-- BEGIN header navigation right -->
                    <div class="navbar-xs-justified">
                        <ul class="nav navbar-nav navbar-right">															
                            <li class="dropdown">
                                <a href="javascript:;" data-toggle="dropdown">
                                    <span class="navbar-user-img online pull-left">
                                        <img src="<%=$this->Page->Theme->baseUrl%>/assets/img/user.jpg" alt="" />
                                    </span>
                                    <span class="hidden-xs "><%=$this->Page->Pengguna->getUsername()%> <b class="caret"></b></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:;">Edit Profile</a></li>														
                                    <li class="divider"></li>
                                    <li>
                                    <com:TActiveLinkButton ID="btnLogout" OnClick="logoutUser" ClientSide.PostState="false">
                                        <prop:Text>
                                            Logout
                                        </prop:Text>
                                        <prop:ClientSide.OnPreDispatch>
                                            Pace.stop();
                                            Pace.start();
                                            $('#<%=$this->btnLogout->ClientId%>').prop('disabled',true);                        
                                        </prop:ClientSide.OnPreDispatch>
                                        <prop:ClientSide.OnLoading>
                                            $('#<%=$this->btnLogout->ClientId%>').prop('disabled',true);                                                                
                                        </prop:ClientSide.OnLoading>
                                        <prop:ClientSide.onComplete>
                                            $('#<%=$this->btnLogout->ClientId%>').prop('disabled',true);                                                                
                                        </prop:ClientSide.OnComplete>
                                    </com:TActiveLinkButton>   
                            </li>
                        </ul>
                        </li>
                        </ul>
                    </div>
                    <!-- END header navigation right -->
                </div>
                <!-- END container-fluid -->		
            </div>
            <!-- END #header -->

            <!-- BEGIN #sidebar -->
            <div id="sidebar" class="sidebar sidebar-inverse">
                <!-- BEGIN scrollbar -->
                <div data-scrollbar="true" data-height="100%">
                    <!-- BEGIN nav -->
                    <ul class="nav">
                        <li class="nav-profile">
                            <div class="image">
                                <img src="<%=$this->Page->Theme->baseUrl%>/assets/img/user.jpg" />
                            </div>
                            <div class="info">
                                <h4><%=$this->Page->Pengguna->getUsername()%></h4>
                                <p><%=$this->Page->Pengguna->getTipeUser()%></p>
                            </div>
                        </li>
                        <li class="nav-divider"></li>
                        <li class="nav-header">Menu Navigasi</li>
                        <li<%=$this->Page->showDashboard===true?' class="active"':''%>>
                            <a href="<%=$this->Page->constructUrl('Home',true)%>">
                                <i class="ti-home"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <li><a href="#"><i class="ti-pie-chart"></i><span>Analisa</span></a></li>				
                        <li class="nav-divider"></li>
                        <li class="nav-header">Data Master</li>
                        <li<%=$this->Page->showStatusKepegawaian===true?' class="active"':''%>>
                            <a href="<%=$this->Page->constructUrl('dmaster.StatusKepegawaian',true)%>">
                                <i class="ti-shortcode"></i>
                                <span>Status Kepegawaian</span>
                            </a>
                        </li>
                        <li<%=$this->Page->showBidangStudiSertifikasi===true?' class="active"':''%>>
                            <a href="<%=$this->Page->constructUrl('dmaster.BidangStudiSertifikasi',true)%>">
                                <i class="ti-shortcode"></i>
                                <span>Bidang Studi Sertifikasi</span>
                            </a>
                        </li>
                        <li<%=$this->Page->showSekolah===true?' class="active"':''%>>
                            <a href="<%=$this->Page->constructUrl('dmaster.Sekolah',true)%>">
                                <i class="ti-shortcode"></i>
                                <span>Sekolah</span>
                            </a>
                        </li>
                        <li class="nav-divider"></li>
                        <li class="nav-header">Pegawai</li>
                        <li<%=$this->Page->showIdentitasPegawai===true?' class="active"':''%>>
                            <a href="<%=$this->Page->constructUrl('pns.IdentitasPegawai',true)%>">
                                <i class="ti-shortcode"></i>
                                <span>Identitas Pegawai</span>
                            </a>
                        </li>
                        <li class="nav-divider"></li>
                        <li class="nav-header">Riwayat</li>
                        <li<%=$this->Page->showKepangkatan===true?' class="active"':''%>>
                            <a href="<%=$this->Page->constructUrl('riwayat.Kepangkatan',true)%>">
                                <i class="ti-shortcode"></i>
                                <span>Kepangkatan</span>
                            </a>
                        </li>
                        <li<%=$this->Page->showPekerjaan===true?' class="active"':''%>>
                            <a href="<%=$this->Page->constructUrl('riwayat.Pekerjaan',true)%>">
                                <i class="ti-shortcode"></i>
                                <span>Pekerjaan</span>
                            </a>
                        </li>
                        <li<%=$this->Page->showPendidikan===true?' class="active"':''%>>
                            <a href="<%=$this->Page->constructUrl('riwayat.Pendidikan',true)%>">
                                <i class="ti-shortcode"></i>
                                <span>Pendidikan</span>
                            </a>
                        </li>
                        <li class="nav-divider"></li>
                        <li class="nav-header">Setting</li>
                        <li class="has-sub<%=$this->Page->showSettingUser===true?' active':''%>">
                            <a href="javascript:;">
                                <b class="caret caret-right pull-right"></b>
                                <i class="ti-gift"></i>
                                <span>User</span>
                            </a>
                            <ul class="sub-menu">
                                <li<%=$this->Page->showUserDISDIK===true?' class="active"':''%>><a href="<%=$this->Page->constructUrl('setting.UserDISDIK',true)%>">
                                        <i class="ti-shortcode"></i>
                                        <span>User DISDIK</span>
                                    </a>
                                </li>
                                <li><a href="<%=$this->Page->constructUrl('setting.UserSekolah',true)%>">
                                        <i class="ti-shortcode"></i>
                                        <span>User Sekolah</span>
                                    </a>
                                </li>
                                <li><a href="<%=$this->Page->constructUrl('setting.UserGuru',true)%>">
                                        <i class="ti-shortcode"></i>
                                        <span>User Guru</span>
                                    </a>
                                </li>
                            </ul>
                        </li>																	
                        <li class="nav-divider"></li>
                        <li class="nav-copyright">&copy; <%=date('Y')%> DISDIK Karimun All Right Reserved</li>
                    </ul>
                    <!-- END nav -->
                </div>
                <!-- END scrollbar -->
            </div>
            <!-- END #sidebar -->

            <!-- BEGIN #content -->
            <div id="content" class="content">
                <!-- BEGIN breadcrumb -->
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=$this->Page->constructUrl('Home',true)%>">HOME</a></li>
                    <com:TContentPlaceHolder ID="modulebreadcrumb" />
                </ul>
                <!-- END breadcrumb -->
                <!-- BEGIN page-header -->
                <h1 class="page-header">
                    <com:TContentPlaceHolder ID="moduleheader" />			
                </h1>
                <!-- END page-header -->
                <com:TContentPlaceHolder ID="maincontent" />		
                <%=$this->Application->getID()%> dikembangkan oleh TIM IT DISDIK Kab. Karimun	
                <com:TJavascriptLogger ID="loggerJS" />	
            </div>
            <!-- END #content -->	
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
    <com:TContentPlaceHolder ID="jscontent" />
    <script src="<%=$this->Page->Theme->baseUrl%>/assets/js/apps.min.js"></script>
    <script src="<%=$this->Page->Theme->baseUrl%>/assets/js/aplikasi.js"></script>
    <com:TContentPlaceHolder ID="jsinlinecontent" />     
    <!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>