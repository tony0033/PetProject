<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
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
<style>
img {
	width: 150px !important;
	height: 130px !important;
}

table {
	width: 600px;
	heigth: 400px;
	float: left;
}

#tb1 {
	padding-right: 50px;
	float: left;
}

button {
	width: 175px;
	height: 50px;
}
</style>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String nickname = (String) session.getAttribute("nickname");
	%>

	<!-- Header -->
	<header id="header">
	<div class="inner">
		<a href="main.jsp" class="logo">introspect</a>
		<nav id="nav"> <%
 	if (session.getAttribute("id") == null) {
 %> <a
			href="memberLogin.jsp" id="loginout">로그인</a> <%
 	} else {
 %> <a href="memberLogout" id="loginout">로그아웃</a> <%
 	}
 %> <a
			href="petHospital.jsp">동물병원 찾기</a>
		<a href="bbs.jsp">게시판</a>
		<a href="diarymain.jsp">일기</a> <a href="ProductSelect.jsp">쇼핑</a> </nav>
	</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>


	<!-- Main -->
	<section id="main">
	<div class="inner">
		<section>
		<center>
			<%
				if (id != null) {
			%>
			<h2><%=nickname%>님의 장바구니
			</h2>
			<!-- <a href="InterestSelect.jsp">rr</a> -->
			<%
				}
			%>
		</center>
		<h3>상품</h3>
		<div class="table-wrapper">
			<c:forEach items="${list}" var="list">
				<div id="tb1" class="table-wrapper">
					<table class="alt">
						<tr>
							<td colspan="2"><a type="hidden" href="${list.link}">${list.img}</a></td>
						</tr>
						<tr>
							<td id="word">이름</td>
							<td>${list.name}</td>
						</tr>
						<tr>
							<td id="word">가격</td>
							<td>${list.price}</td>
						</tr>
						<tr>
							<td id="word">정보</td>
							<td>${list.other}</td>
						</tr>
					</table>
				</div>
			</c:forEach>

		</div>
		</section>
	</div>
	</section>

	<!-- Footer -->
	<section id="footer">
	<div class="inner"></div>
	</section>
</body>