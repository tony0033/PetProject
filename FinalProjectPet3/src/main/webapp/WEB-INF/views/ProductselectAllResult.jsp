<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
<style>
table {
width: 600px;
heigth: 400px;
}
</style>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<a href="main.jsp">Home</a> <a href="memberLogin.jsp">Login</a><a
					href="generic.jsp">Generic</a> <a href="elements.jsp">Elements</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<section>
				<h3>상품</h3>
				<div class="table-wrapper">
 <table border="1" bordercolor="red" width="200" height="200"> 

<c:forEach items="${list}" var="list">
		<tr>	
				<td style="color:gray;" id="word" bgcolor="black">사진</td>
				<td bgcolor="gray">${list.img}</td>
			</tr>
			<tr>
				<td style="color:gray;" id="word" bgcolor="black">이름</td>
				<td bgcolor="gray">${list.name}</td>
			</tr>
			<tr>
				<td style="color:gray;" id="word" bgcolor="black">가격</td>
				<td bgcolor="gray">${list.price}</td>
			</tr>
			<tr>
				<td style="color:gray;" id="word" bgcolor="black">정보</td>
				<td bgcolor="gray">${list.other}</td>
			</tr> 
</c:forEach>

		</table> 

</div>
			</section>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>

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
				<h3>상품</h3>
				<div class="table-wrapper">
 <table border="1" bordercolor="red"> 

<c:forEach items="${list}" var="list">
		<tr>	
				<td bgcolor="pink">사진</td>
				<td bgcolor="yellow">${list.img}</td>
			</tr>
			<tr>
				<td bgcolor="pink">이름</td>
				<td bgcolor="yellow">${list.name}</td>
			</tr>
			<tr>
				<td bgcolor="pink">가격</td>
				<td bgcolor="yellow">${list.price}</td>
			</tr>
			<tr>
				<td bgcolor="pink">정보</td>
				<td bgcolor="yellow">${list.other}</td>
			</tr> 
</c:forEach>

		</table> 

</div>
			</section>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
>>>>>>> branch 'master' of https://github.com/tony0033/PetProject.git
</html>