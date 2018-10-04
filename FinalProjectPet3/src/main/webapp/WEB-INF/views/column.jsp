<%@page import="com.itbank.mvc3.Crawling"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itbank.mvc3.VideoDTO"%>
<%@page import="com.itbank.mvc3.VideoDAO"%>
<%@page import="org.jsoup.*"%>
<%@page import="org.jsoup.nodes.Document, org.jsoup.nodes.Element, org.jsoup.select.Elements"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="resources/js/jquery.iframetracker.js"></script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
			<%if(session.getAttribute("id")==null){ %>
				<a href="memberLogin.jsp" id="loginout">로그인</a> 
				<%}
			else{  %>
				<a href="memberLogout" id="loginout">로그아웃</a>
				<% } %>
				
				<a
					href="petHospital.jsp">동물병원 찾기</a><a href="bbs.jsp">게시판</a><a
					href="diarymain.jsp">일기</a> <a href="ProductSelect.jsp">쇼핑</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<section>
				<div class="table-wrapper">
					<div align="center">
					<c:forEach items="${list}" var="n" varStatus="status">
						<c:choose>
							<c:when test="${status.getIndex() == 0}">
							 <h2>${n}</h2>
							</c:when>
							<c:when test="${status.getIndex() == 1}">
								<font color="#383d44" size="5">${n}</font><br>
							</c:when>
							<c:when test="${status.getIndex() == 2}">
								<font color="#383d44" size="5">${n}</font><br>
							</c:when>
							<c:otherwise>
								${n}<br>
							</c:otherwise>						
						</c:choose>
					</c:forEach>
					<c:forEach items="${list2}" var="n" varStatus="status">
						${n}<br>
					</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</section>
 
	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
</html>