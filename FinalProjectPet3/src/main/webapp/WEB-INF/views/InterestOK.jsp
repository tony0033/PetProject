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
				<a href="memberLogin.jsp" id="loginout">�α���</a>
				<%
					} else {
				%>
				<a href="memberLogout" id="loginout">�α׾ƿ�</a>
				<%
					}
				%>

				<a href="petHospital.jsp">�������� ã��</a><a href="bbs.jsp">�Խ���</a><a
					href="diarymain.jsp">�ϱ�</a> <a href="ProductSelect.jsp">����</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>


	<!-- Main -->
	<section id="main">
		<div class="inner" align="center">
			<section>
				<button type="submit" onclick="location.href='ProductSelect.jsp'" class="button alt">��ǰ������� ���ư���</button>
				<button type="submit" onclick="location.href='InterestSelect.jsp'" class="button alt">��ٱ��� Ȯ���ϱ�</button>
			</section>
		</div>
	</section>

	<!-- Footer -->
	<section id="footer">
		<div class="inner"></div>
	</section>
</body>
</html>