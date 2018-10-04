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

	<!-- One -->
	<section id="one">
		<div class="inner">
			<header>
				<h2>Magna Etiam Lorem</h2>
			</header>
			<p>Suspendisse mauris. Fusce accumsan mollis eros. Pellentesque a
				diam sit amet mi ullamcorper vehicula. Integer adipiscin sem. Nullam
				quis massa sit amet nibh viverra malesuada. Nunc sem lacus, accumsan
				quis, faucibus non, congue vel, arcu, erisque hendrerit tellus.
				Integer sagittis. Vivamus a mauris eget arcu gravida tristique. Nunc
				iaculis mi in ante.</p>
			<ul class="actions">
				<li><a href="#" class="button alt">Learn More</a></li>
			</ul>
		</div>
	</section>

	<!-- Two -->
	<section id="two">
		<div class="inner">
			<article>
				<div class="content">
					<header>
						<h3>Pellentesque adipis</h3>
					</header>
					<div class="image fit">
						<img src="resources/images/pic01.jpg" alt="" />
					</div>
					<p>Cumsan mollis eros. Pellentesque a diam sit amet mi magna
						ullamcorper vehicula. Integer adipiscin sem. Nullam quis massa sit
						amet lorem ipsum feugiat tempus.</p>
				</div>
			</article>
			<article class="alt">
				<div class="content">
					<header>
						<h3>Morbi interdum mol</h3>
					</header>
					<div class="image fit">
						<img src="resources/images/pic02.jpg" alt="" />
					</div>
					<p>Cumsan mollis eros. Pellentesque a diam sit amet mi magna
						ullamcorper vehicula. Integer adipiscin sem. Nullam quis massa sit
						amet lorem ipsum feugiat tempus.</p>
				</div>
			</article>
		</div>
	</section>

	<!-- Three -->
	<section id="three">
		<div class="inner">
			<article>
				<div class="content">
					<span class="icon fa-laptop"></span>
					<header>
						<h3>Tempus Feugiat</h3>
					</header>
					<p>Morbi interdum mollis sapien. Sed ac risus. Phasellus
						lacinia, magna lorem ullamcorper laoreet, lectus arcu.</p>
					<ul class="actions">
						<li><a href="#" class="button alt">Learn More</a></li>
					</ul>
				</div>
			</article>
			<article>
				<div class="content">
					<span class="icon fa-diamond"></span>
					<header>
						<h3>Aliquam Nulla</h3>
					</header>
					<p>Ut convallis, sem sit amet interdum consectetuer, odio augue
						aliquam leo, nec dapibus tortor nibh sed.</p>
					<ul class="actions">
						<li><a href="#" class="button alt">Learn More</a></li>
					</ul>
				</div>
			</article>
			<article>
				<div class="content">
					<span class="icon fa-laptop"></span>
					<header>
						<h3>Sed Magna</h3>
					</header>
					<p>Suspendisse mauris. Fusce accumsan mollis eros. Pellentesque
						a diam sit amet mi ullamcorper vehicula.</p>
					<ul class="actions">
						<li><a href="#" class="button alt">Learn More</a></li>
					</ul>
				</div>
			</article>
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