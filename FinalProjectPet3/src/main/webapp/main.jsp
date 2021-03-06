<%@page import="java.util.List"%>
<%@page import="com.itbank.pet.column.NumDTO"%>
<%@page import="com.itbank.pet.video.VideoDTO"%>
<%@page import="com.itbank.pet.column.ColumnDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="com.itbank.pet.column.ColumnDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">
table {
	width: 600px;
	heigth: 400px;
	float: left;
}
</style>
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

	<!-- Banner -->
	<section id="banner">
		<div class="inner">
			<h1>
				Introspect: <span>A free + fully responsive<br /> site
					template by TEMPLATED
				</span>
			</h1>
			<ul class="actions">
				<li><a href="#" class="button alt">Get Started</a></li>
			</ul>
		</div>
	</section>

	<!-- Two -->
	<section id="two">
		<div class="inner">
			<article>
				<div class="content">
					<header>
						<h3>[Bodeum]강형욱 칼럼</h3>
					</header>
					<div class="slider">
						<%
							Random random = new Random();
							String num = String.valueOf(random.nextInt(5));
						%>
						<img src="resources/images/column<%=num%>.jpg" alt="" />
					</div>
					<div align="center">
						<%
							ColumnDAO dao = new ColumnDAO();
							int pageNum, start, end;
							if (request.getParameter("pageNum") == null) {
								pageNum = 1;
								start = 1;
								end = 4;
							} else if (request.getParameter("pageNum").equals("1")) {
								pageNum = 1;
								start = 1;
								end = 4;
							} else {
								pageNum = Integer.parseInt(request.getParameter("pageNum"));
								start = (pageNum - 1) * 4;
								end = start + 3;
							}
						%>
						<%
							NumDTO dto0 = new NumDTO();
							dto0.setStart(start);
							dto0.setEnd(end);
							List<ColumnDTO> list = dao.selectAll(dto0);
							for (int i = 0; i < list.size(); i++) {

								ColumnDTO dto1 = (ColumnDTO) list.get(i);
						%>
						<form action="column.do">
							<input type="hidden" name="addr" value=<%=dto1.getAddr()%>>
							<font color="#383d44" size="4"><%=dto1.getTitle()%></font> <input
								type="image" src="resources/images/button2.png" name="submit"
								value="">
							<!-- <input type="submit" class="button alt" value="read" width="10" height="5"> -->
						</form>
						<%
							}
						%>
						<%
							int max = dao.ColumnCount() / 4;
							for (int i = 0; i < max; i++) {
						%>
						<a href="main.jsp?pageNum=<%=i + 1%>"><%=i + 1%></a>
						<%
							}
						%>
					</div>
				</div>
			</article>
			<article class="alt">
				<div class="content">
					<header>
						<h3>동영상</h3>
					</header>
					<div id="slider">
						<a href="video.jsp?type=1"> <img
							src="resources/images/video1.png" alt="" /><br>
						</a> <a href="video.jsp?type=2"> <img
							src="resources/images/video2.png" alt="" /><br>
						</a> <a href="video.jsp?type=3"> <img
							src="resources/images/video3.png" alt="" /><br>
						</a>
					</div>
					<br>
					<div align="center">
						<a href="video.jsp?type=1"> <font color="#383d44" size="4">#강형욱의
								견종백과#</font><br>
						</a> <a href="video.jsp?type=2"> <font color="#383d44" size="4">#세상에
								나쁜 개는 없다#</font><br>
						</a> <a href="video.jsp?type=3"> <font color="#383d44" size="4">#소소한
								Q&A#</font>
						</a>
					</div>
				</div>
			</article>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
</html>