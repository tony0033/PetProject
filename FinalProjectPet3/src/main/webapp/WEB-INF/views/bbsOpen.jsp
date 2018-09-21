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
<title>Elements - Introspect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript">
</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<a href="memberLogin.jsp" id="loginout">로그인</a> <a
					href="petHospital.jsp">동물병원 찾기</a><a href="bbs.jsp">게시판</a><a
					href="generic.jsp">Generic</a> <a href="elements.jsp">Elements</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<header class="major special"> </header>
			<section>
				<form method="post" action="bbsQuestion">
					<div class="row uniform 50%">
						<div class="12u$">
							<input type="text" name="bTitle" value="${seBBS.bTitle}"
								readonly="readonly">
						</div>
						<div class="6u 12u$(xsmall)">
							<ul class="actions fit">
								<li><input type="text" name="bCategory"
									value="${seBBS.bCategory}" readonly="readonly"></li>
								<li><input type="text" name="bId" value="${seBBS.bId}"
									readonly="readonly"></li>
							</ul>
						</div>
						<div class="6u$ 12u$(xsmall)">
							<ul class="actions fit small">
								<li>조회수</li>
								<li><input type="text" name="bDate" value="${seBBS.bDate}"
									readonly="readonly"></li>
							</ul>
						</div>
						<div class="12u$">
							<textarea name="bContent" rows="6" readonly="readonly">${seBBS.bContent}</textarea>
						</div>
						<%
							String seBBS = (String)session.getAttribute("seBBS");
							
							if (session.getAttribute("id") != null) {
								if (session.getAttribute("id").equals(seBBS)) {
						%>
						<div class="12u$">
							<ul class="actions">
								<li><input type="submit" value="수정하기" class="alt"></li>
								<li><input type="reset" value="삭제하기" class="alt"></li>
							</ul>
						</div>
						<%
							}
							}
						%>
					</div>
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