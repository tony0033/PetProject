<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
			<%if(session.getAttribute("id")==null){ %>
				<a href="memberLogin.jsp" id="loginout">�α���</a> 
				<%}
			else{  %>
				<a href="memberLogout" id="loginout">�α׾ƿ�</a>
				<% } %>
				
				<a
					href="petHospital.jsp">�������� ã��</a><a href="bbs.jsp">�Խ���</a><a
					href="diarymain.jsp">�ϱ�</a> <a href="ProductSelect.jsp">����</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<section>
				<div class="table-wrapper">
					<form action="memberLogin">
						<table class="alt">
							<tbody>
								<tr>
									<td>${name }���� ���̵�� <br>'${id }'�Դϴ�.<br>
									<a href="memberLogin.jsp">�ǵ��ư���</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td><a href="memberInsert.jsp">ȸ������ | </a><a
										href="memberSearchId.jsp">���̵� ã�� | </a><a
										href="memberSearchPw.jsp">��й�ȣ ã��</a></td>
								</tr>
							</tfoot>
						</table>
					</form>
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