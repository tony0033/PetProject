<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>>
<!DOCTYPE HTML>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Generic - Introspect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
$(function(){
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({ // 스마트에디터 형식 적용
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "resources/editor/SmartEditor2Skin.html",
        htParams : {
            bUseToolbar : true,            
            bUseVerticalResizer : true,    
            bUseModeChanger : true,
            
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
    
    
        $( "#datepicker" ).datepicker();
          $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
       
})
</script>
<style type="text/css">
input{
width: 350px !important;
display: inline !important; 
border: 1px solid gray !important;
height: 30px !important;
}
#date{
text-align: right;
}

</style>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<a href="main.jsp">Home</a> <a href="memberLogin.jsp" id="loginout" >Login</a><a
					href="generic.jsp">Generic</a> <a href="elements.jsp">Elements</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<section>
				<h3>일기 작성</h3>	
<form action="bbsinsert.do" method="post" id="frm">
				제목: <input type="text" name="title"> 날짜: <input type="text" id="datepicker" name="date" >
				<br><br><br>
    <textarea name="content" id="smarteditor" rows="10" cols="100" style="width:800px; height:412px;"></textarea>
    <input type="button" id="savebutton" value="서버전송" />
</form>

			</section>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
</html>