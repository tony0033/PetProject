<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*"%>

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
</head>
<body>

	<%
		Date now = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd");
		String today = sd.format(now);
	%>

	<%=today%><br>

</body>
</html>