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
<style>
img {
width: 150px !important ;
height: 130px !important ;
}
table {
width: 600px;
heigth: 400px;
float: left;
}
#tb1{
padding-right: 50px;
float: left;
}
button{
width: 175px;
height: 50px;
}
</style>
</head>
<body>
<%String id = (String)session.getAttribute("id"); 
String nickname = (String)session.getAttribute("nickname");
%>

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
				<center>
					<%
	if(id != null){
		%>
		<h2><%= nickname %>�� ȯ���մϴ�.</h2>
		<a href="InterestSelect.jsp">rr</a>
		<%
	}
	%>
				</center>
				<h3>��ǰ</h3>
				<div class="table-wrapper">
<c:forEach items="${list}" var="list">
<div id="tb1">
 <table border="1" bordercolor="red"> 

		     <tr>
				<td colspan="2"><a type="hidden" href="${list.link}">${list.img}</a></td>
			</tr>
			<tr>
				<td style="color:gray;" id="word" bgcolor="black">�̸�</td>
				<td bgcolor="gray">${list.name}</td>
			</tr>
			<tr>
				<td style="color:gray;" id="word" bgcolor="black">����</td>
				<td bgcolor="gray">${list.price}</td>
			</tr>
			<tr>
				<td style="color:gray;" id="word" bgcolor="black">����</td>
				<td bgcolor="gray">${list.other}</td>
			</tr> 
				<%
	if(id != null){
		%>
			<tr>	
				<td><button onclick="location.href='interestInput?num=${list.num}&id=<%= id %>'">��ٱ��Ͽ� ���</button></td>
			</tr>				
		<%
	}
	%>
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
				