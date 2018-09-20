<%@page import="javafx.scene.control.Alert"%>
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
<link rel="stylesheet" href="resources/css/diary.css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript"
	src="resources/js/jquery-1.11.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(function() {


 						var datelist=[];
					$.ajax({
						url : "diaryselectId.do",
						type : "get",
						data : {
						},
						success : function(data) {
							$.each(data, function(idx, val) {
 								var todaydate = new Date(val.calendar); 
 								if($.inArray(todaydate,datelist) ==-1){
								datelist.push(todaydate.getTime());
 								}
 								
							});
						}
					});
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					showOtherMonths : true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					
					showMonthAfterYear : true, //년도 먼저 나오고, 뒤에 월 표시
					
					changeMonth : true, //콤보박스에서 월 선택 가능 
					
					changeYear : true,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ],
				
				beforeShowDay: function(dateStr){
 						var dd = dateStr.getDate();
						var mm = dateStr.getMonth()+1;
						var yyyy = dateStr.getFullYear();
						
						if(dd < 10){
							dd = '0'+dd
						}

						if(mm < 10){
							mm = '0'+mm
						}

						var date = new Date(yyyy+'-'+mm+'-'+dd);        //jquery 달력의 날짜를 yyyy/mm/dd 형태로 만듬.							
						var date3 = date.getTime();
						var Highlight = datelist[date];
						
					if ($.inArray(date3, datelist) != -1) {    //jquery달력의 날짜가 오늘날짜와 같다면
						return [true, "Highlighted", Highlight];    //스타일 적용

					}else{
						return [true, '', ''];

					}
				
				}
				});

		$('#insertbutton').click(function() {
			$("form").submit();
		});

		$('#selectbutton').click(function() {
					$("#diary").text("");
					$.ajax({
						url : "diaryselect.do",
						type : "get",
						data : {
							"calendar" : $("#datepicker").val()
						},
						success : function(data) {
							$.each(data, function(idx, val) {
								$("#diary").append("<div id= onediary>");
								$("#diary").append(
										"<div id = title><h3> " + val.title
												+ "</h3></div>");
								$("#diary").append(
										"<div id = content>" + val.content
												+ "</div></div>");
							});
						}
					});

				});

	});
</script>
</head>
<body>
<%String id= (String)session.getAttribute("id");
if(id!=null){


%>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<a href="main.jsp">Home</a> <a href="memberLogin.jsp" id="loginout">Login</a><a
					href="generic.jsp">Generic</a> <a href="elements.jsp">Elements</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<section>
				<h3>일기</h3>
				<form action="diary.jsp">
					날짜: <input type="text" id="datepicker" name="calendar"
						autocomplete="off" readonly="readonly">

					<div id = right>
						<button id=insertbutton>작성하기</button>
						<button id=selectbutton type="button">그날의 일기</button>
					</div>
					<br> <br>
					<br>
				</form>
				<div id=diary></div>

			</section>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">

		<div class="inner"></div>
	</section>
	<%}
else{
	out.println("<script>");
	out.println("alert('로그인 후 가능합니다.')");
	out.println("location.href='memberLogin.jsp'");
	out.println("</script>"); 
	
}

%>
</body>
</html>