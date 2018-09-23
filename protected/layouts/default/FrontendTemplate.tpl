<!DOCTYPE html>
<html lang="id">
<com:THead>     
    <link rel="stylesheet" href="<%=$this->Page->Theme->baseUrl%>/css/aplikasi.css">    
    <com:TContentPlaceHolder ID="csscontent" />	
</com:THead>
<body>   
<com:TForm>
<com:TContentPlaceHolder ID="maincontent" />
<%=$this->Application->getID()%>  Powered by <a href="#">Tim IT Dinas Pendidikan Kab. Karimun</a>
</com:TForm>
<script src="<%=$this->Page->Theme->baseUrl%>/js/aplikasi.js"></script>
<com:TContentPlaceHolder ID="jscontent" />
<com:TContentPlaceHolder ID="jsinlinecontent" />     
</body>
</html>