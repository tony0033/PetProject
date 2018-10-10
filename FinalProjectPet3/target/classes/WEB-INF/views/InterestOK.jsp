<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<%
					if (session.getAttribute("id") == null) {
				%>
				<a href="memberLogin.jsp" id="loginout">로그인</a>
				<%
					} else {
				%>
				<a href="memberLogout" id="loginout">로그아웃</a>
				<%
					}
				%>

				<a href="petHospital.jsp">동물병원 찾기</a><a href="bbs.jsp">게시판</a><a
					href="diarymain.jsp">일기</a> <a href="ProductSelect.jsp">쇼핑</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>


	<!-- Main -->
	<section id="main">
		<div class="inner" align="center">
			<section>
				<button type="submit" onclick="location.href='ProductSelect.jsp'" class="button alt">상품목록으로 돌아가기</button>
				<button type="submit" onclick="location.href='InterestSelect.jsp'" class="button alt">장바구니 확인하기</button>
			</section>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
</html>