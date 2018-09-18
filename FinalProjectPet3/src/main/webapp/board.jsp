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

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<a href="memberLogin.jsp">로그인</a> <a href="petHospital.jsp">동물병원
					찾기</a><a href="board.jsp">게시판</a><a href="generic.jsp">Generic</a> <a
					href="elements.jsp">Elements</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<header class="major special"> </header>
			<section>
				<h1>질문 & 답변</h1>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Item 1</td>
								<td>Ante turpis integer aliquet porttitor.</td>
								<td>29.99</td>
							</tr>
							<tr>
								<td>Item 2</td>
								<td>Vis ac commodo adipiscing arcu aliquet.</td>
								<td>19.99</td>
							</tr>
							<tr>
								<td>Item 3</td>
								<td>Morbi faucibus arcu accumsan lorem.</td>
								<td>29.99</td>
							</tr>
							<tr>
								<td>Item 4</td>
								<td>Vitae integer tempus condimentum.</td>
								<td>19.99</td>
							</tr>
							<tr>
								<td>Item 5</td>
								<td>Ante turpis integer aliquet porttitor.</td>
								<td>29.99</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"></td>
								<td>100.00</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</section>
		</div>
	</section>

	<%
		Date now = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd");
		String today = sd.format(now);
	%>

	<!-- Footer -->
	<section id="footer">
		<div class="inner">
			<header>
				<h2>글쓰기</h2>
			</header>
			<form method="post" action="bbsQuestion">
				<div class="row uniform 50%">
					<div class="6u 12u$(xsmall)">
						<input type="text" name="bTitle" placeholder="제목" />
					</div>
					<div class="6u$ 12u$(xsmall)">
						<input type="email" name="bDate" value="<%=today%>"
							readonly="readonly" />
					</div>
					<div class="12u$">
						<div class="select-wrapper">
							<select name="bCategory" id="demo-category">
								<option value="">- 분류 -</option>
								<option value="eat">먹이</option>
								<option value="sick">질병</option>
								<option value="common">상식</option>
								<option value="etc">기타</option>
							</select>
						</div>
					</div>
					<div class="12u$">
						<textarea name="bContent" rows="6"></textarea>
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input type="submit" value="Send Message" class="alt" /></li>
							<li><input type="reset" value="Reset" /></li>
						</ul>
					</div>
				</div>
			</form>
			<div class="copyright">
				&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>.
				Images <a href="https://unsplash.com/">Unsplash</a>
			</div>
		</div>
	</section>
</body>
</html>