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
<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=6q8NtRx8aBLV8lmz00Wd&submodules=geocoder"></script>
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
			<header class="major special">
				<section>
					<h1>동물병원 찾기</h1>
					<hr>
					<div id="map" style="width: 100%; height: 400px;"></div>
					<script>
						var map = new naver.maps.Map('map', {
							center : 0,
							zoom : 8
						}); //좌표로 장소 이동, map 띄우기
					</script>
					<hr>
				</section>
				<section>
					<form action="petHospital">
						<h4>동물 병원 검색할 지역 :</h4>
						<div class="row">
							<div class="6u 12u$(xsmall)">
								<input type="text" name="petHospital">
							</div>
							<div class="6u$ 12u$(xsmall)">
								<input type="submit" value="확인" class="special">
							</div>
						</div>
					</form>
				</section>
			</header>
		</div>
	</section>


	<!-- Footer -->
	<section id="footer">
		<div class="inner">
			<header>
				<h2>Get in Touch</h2>
			</header>
			<form method="post" action="#">
				<div class="field half first">
					<label for="name">Name</label> <input type="text" name="name"
						id="name" />
				</div>
				<div class="field half">
					<label for="email">Email</label> <input type="text" name="email"
						id="email" />
				</div>
				<div class="field">
					<label for="message">Message</label>
					<textarea name="message" id="message" rows="6"></textarea>
				</div>
				<ul class="actions">
					<li><input type="submit" value="Send Message" class="alt" /></li>
				</ul>
			</form>
			<div class="copyright">
				&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>.
				Images <a href="https://unsplash.com/">Unsplash</a>
			</div>
		</div>
	</section>
</body>
</html>