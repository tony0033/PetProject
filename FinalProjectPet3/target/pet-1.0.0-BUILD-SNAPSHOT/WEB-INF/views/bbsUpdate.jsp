<%@page import="com.itbank.pet.bbs.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Introspect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/js-image-slider.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/js-image-slider.js"></script>
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
		<div class="inner">
			<%
				if (session.getAttribute("id") != null) { //로그인 되어 있으면 글쓰기 사용 o

					Date now = new Date(); //오늘 날짜 받아오기 
					SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd");
					String today = sd.format(now);
			%>
			<section>
				<form method="post" action="bbsUpdate">
					<div class="row uniform 50%">
						<div class="6u 12u$(xsmall)">
							<input type="hidden" name="bId"
								value="${bbsUpdate.bId}"> <input
								type="text" name="bTitle" value="${bbsUpdate.bTitle}">
						</div>
						<div class="6u$ 12u$(xsmall)">
							<input type="email" name="bDate" value="<%=today%>"
								readonly="readonly">
						</div>
						<div class="12u$">
							<div class="select-wrapper">
								<select name="bCategory" id="demo-category">
									<option value="">- 분류 -</option>
									<option value="먹이">먹이</option>
									<option value="질병">질병</option>
									<option value="상식">상식</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="12u$">
							<textarea name="bContent" rows="6">${bbsUpdate.bContent}</textarea>
						</div>
						<div class="12u$">
							<ul class="actions">
								<li><input type="submit" value="수정하기" class="alt"></li>
							</ul>
						</div>
					</div>
				</form>
			</section>
			<%
				}
			%>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
</html>