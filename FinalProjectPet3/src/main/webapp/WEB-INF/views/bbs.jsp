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
			<header class="major special"> </header>
			<section>
				<h1>질문 & 답변</h1>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th colspan="2">제목</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${ !empty bList }">
								<c:forEach items="${bList}" var="bList">
									<tr>
										<td>${bList.bNum}</td>
										<td><a href="bbsOpen.do?bTitle=${bList.bTitle}">${bList.bTitle}</a></td>
										<td>${bList.bId}</td>
										<td>${bList.bDate}</td>
										<td>${bList.bDate}</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${ empty bList }">
								<tr>
									<td colspan="5">등록된 게시물이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</section>
		</div>
	</section>


	<!-- Footer -->
	<section id="footer">
		<div class="inner">
			<%
				if (session.getAttribute("id") != null) { //로그인 되어 있으면 글쓰기 사용 o

					Date now = new Date(); //오늘 날짜 받아오기
					SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd");
					String today = sd.format(now);
			%>
			<form method="post" action="bbsQuestion">
				<header>
					<h2>글쓰기</h2>
				</header>
				<div class="row uniform 50%">
					<div class="6u 12u$(xsmall)">
						<input type="hidden" name="bId"
							value="<%=session.getAttribute("id")%>">
						<input type="text" name="bTitle" placeholder="제목">
					</div>
					<div class="6u$ 12u$(xsmall)">
						<input type="email" name="bDate" value="<%=today%>"
							readonly="readonly">
					</div>
					<div class="12u$">
						<div class="select-wrapper">
							<select name="bCategory" id="demo-category">
								<option value="">- 분류 -</option>
								<option value="먹이">먹이</option>
								<option value="질병">질병</option>
								<option value="상식">상식</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<div class="12u$">
						<textarea name="bContent" rows="6"></textarea>
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input type="submit" value="Send Message" class="alt"></li>
							<li><input type="reset" value="Reset"></li>
						</ul>
					</div>
				</div>
			</form>
			<%
				} else { //비 로그인시 글 읽기만 가능
			%>
			<div class="copyright">
				<a href="memberLogin.jsp">로그인</a>을 하시면 글쓰기(질문)를 사용할 수 있습니다.
			</div>
			<%
				}
			%>
		</div>
	</section>
</body>
</html>