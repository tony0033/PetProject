<%@page import="com.itbank.mvc3.NumDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itbank.mvc3.VideoDTO"%>
<%@page import="com.itbank.mvc3.VideoDAO"%>
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
<script src="resources/js/jquery.iframetracker.js"></script>
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
				<h3><a href="video.jsp?type=1">견종백과</a> | 
					<a href="video.jsp?type=2">세나개</a> | 
					<a href="video.jsp?type=3">소소한 Q&A</a></h3>
				<div class="table-wrapper">
					<%
						VideoDAO dao1 = new VideoDAO();
															int pageNum, type;
															if(request.getParameter("type") == null){
																type = 1;
															}else{
																 type = Integer.parseInt(request.getParameter("type"));
															}	
															if (request.getParameter("pageNum") == null) {
																	pageNum = 1;
																} else {
																	pageNum = Integer.parseInt(request.getParameter("pageNum"));
																}
															NumDTO dto0 = new NumDTO();
															dto0.setNo(pageNum);
															dto0.setType(type);
															VideoDTO dto1 = dao1.select(dto0);
															int cnt = dao1.IframeCount();
					%>
					<div align="center">
						<h3><%=dto1.getTitle()%></h3>
						<iframe width="600" height="350" src=<%=dto1.getSrc()%> frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
						<br>
						<h4><%=dto1.getViews()%></h4>
						
						<%
													if(pageNum==1){
												%> 
							<img src="resources/images/button2.png" onclick="location.href='video.jsp?pageNum=<%=pageNum + 1%>,type=<%=type%>'">
						<%
							}else if(pageNum==cnt){
						%>
							<img src="resources/images/button1.png" onclick="location.href='video.jsp?pageNum=<%=pageNum - 1%>,type=<%= type%>'">
						<%
							}else{
						%>	
							<img src="resources/images/button1.png" onclick="location.href='video.jsp?pageNum=<%=pageNum - 1%>,type=<%= type%>'">
							<img src="resources/images/button2.png" onclick="location.href='video.jsp?pageNum=<%=pageNum + 1%>,type=<%= type%>'">
						<%
							}
						%>
					</div>
					<div align="center">
						<%
							int start = 0;
							int end = 0;
							if(pageNum==1 || pageNum==2){
								start = 1;
								end = 5;
							}else if(pageNum==9 || pageNum==10){
								start = 6;
								end = 10;
							}else{
								start = pageNum-2;
								end = pageNum+2;
							}
							
							
							dto0.setStart(start);
							dto0.setEnd(end);
							ArrayList<VideoDTO> list = dao1.selectAll(dto0);
											for(int i=0;i<list.size();i++){
											VideoDTO dto2 = list.get(i);
						%>
						<div class="vList" onclick="location.href='video1.jsp?pageNum=<%=dto2.getNo()%>'">
							<iframe width="200" height="130" src=<%=dto2.getSrc() %> frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
							<br>
							<%=dto2.getTitle() %>
						</div>
						<%
							};
						%>
					</div>
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