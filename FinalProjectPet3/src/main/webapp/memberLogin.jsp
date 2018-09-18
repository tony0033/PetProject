<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>>
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
				<h3>로그인</h3>
				<div class="table-wrapper">
					<form action="memberLogin">
						<table class="alt">
							<tbody>
								<tr>
									<td>아이디</td>
									<td><input type="text" name="id"></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="text" name="pw"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="로그인"
										class="alt"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2"><a href="memberInsert.jsp">회원가입 | </a><a
										href="memberSearchId.jsp">아이디 찾기 | </a><a
										href="memberSearchPw.jsp">비밀번호 찾기</a></td>
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