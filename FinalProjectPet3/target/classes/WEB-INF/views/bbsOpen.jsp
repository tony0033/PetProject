<%@page import="com.itbank.mvc3.BBSDAO"%>
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
<script src="resources/js/jquery-1.11.1.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript">
	$(function() {
		var bNum =<%=session.getAttribute("seBBSbNum")%>;
		console.log(bNum);
	 	 $.ajax({
            url:"bbsCommentList",
            data:{
               "bNum": bNum
            },
            success:function(data) {
                console.log("comment를 정상적으로 조회하였습니다.");
                  showHtml(data);
            }
        })  

		$("#bbsComment").click(function() {
			console.log("ss");
			var bTitle = $('#bTitle').val();
			var bNum = $('#bNum').val();
			var cId = $('#cId').val();
			var cDate = $('#cDate').val();
			var cComment = $('#cComment').val();
			if(cComment == null){
				alert("내용을 입력하세요.");
				return false;
			}
			else{
				$.ajax({
					url : "bbsComment",
					type : "get",
					data : {
						bTitle : bTitle,
						cId : cId,
						cDate : cDate,
						cComment : cComment,
						bNum : bNum
					},
					success : function(data) {
		                        $("#cComment").val("");
		                        showHtml(data);
						}
				});
			}
		});

	    function showHtml(data) {
	        let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'><tbody>";
	        $.each(data, function(index, item) {
	       	console.log(item.cId);
	            html += "<tr align='center'>";
	            html += "<td>" + (index+1) + "</td>";
	            html += "<td>" + item.cId + "</td>";
	            html += "<td align='left'>" + item.cComment + "</td>";
	            html += "<td>" + item.cDate + "</td>";
	            html += "</tr>";
	        });
	        html += "</tbody></table>";
	        
	        $("#table-wrapper").html(html);
	        $("#cComment").val("");
	    }
	});
</script>
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
				<a href="memberLogin.jsp" id="loginout">로그인</a>
				<%
					} else {
				%>
				<a href="memberLogout" id="loginout">로그아웃</a>
				<%
					}
				%>

				<a href="petHospital.jsp">동물병원 찾기</a><a href="bbs.jsp">게시판</a><a
					href="diarymain.jsp">일기</a> <a href="ProductSelect.jsp">쇼핑</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<section>
				<form method="post" action="bbsQuestion">
				<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>Name</th>
											<th>Description</th>
											<th>Price</th>
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
											<td> Morbi faucibus arcu accumsan lorem.</td>
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
					<div class="row uniform 50%">
						<div class="12u$">
							<input type="text" name="bTitle" value="${seBBS.bTitle}"
								readonly="readonly" id="bTitle">
						</div>
						<div class="6u 12u$(xsmall)">
							<ul class="actions fit">
								<li><input type="text" name="bCategory"
									value="${seBBS.bCategory}" readonly="readonly"></li>
								<li><input type="text" name="bCategory"
									readonly="readonly">${seBBS.bId}</li>
							</ul>
						</div>
						<div class="6u$ 12u$(xsmall)">
							<ul class="actions fit small">
								<li><input type="text" name="bDate" value="${seBBS.bView}"
									readonly="readonly"></li>
								<li><input type="text" name="bDate" value="${seBBS.bDate}"
									readonly="readonly"></li>
							</ul> 
						</div>
						<div class="12u$">
							<textarea name="bContent" rows="6" readonly="readonly">${seBBS.bContent}</textarea>
						</div>
						<%
							if (session.getAttribute("nickname") != null) {
								if (session.getAttribute("nickname").equals(session.getAttribute("seBBSid"))) {
						%>
						<div class="12u$">
							<ul class="actions">
								<li><input type="submit" value="수정하기" class="alt"></li>
								<li><input type="reset" value="삭제하기" class="alt"></li>
							</ul>
						</div>
						<%
							}
							}
						%>
					</div>
				</form>
			</section>
		</div>
		<div class="inner">
			<header class="major special"> </header>
			<section>
				<h3>답변</h3>
				<div id="table-wrapper"></div>
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
			<section>

				<div class="row uniform 50%">
					<div class="12u$">
						<input type="hidden" name="bNum" id="bNum"
							value="<%=session.getAttribute("seBBSbNum")%>"> <input
							type="hidden" name="cId" id="cId"
							value="<%=session.getAttribute("nickname")%>"> <input
							type="hidden" name="cDate" id="cDate" value="<%=today%>">
						<textarea name="cComment" id="cComment" rows="2"></textarea>
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><button type="button" class="alt" id="bbsComment">전송</button></li>
							<li><input type="reset" value="Reset"></li>
						</ul>
					</div>
				</div>
			</section>
			<%
				} else { //비 로그인시 글 읽기만 가능
			%>
			<div class="copyright">
				<a href="memberLogin.jsp">로그인</a>을 하시면 답변을 쓰실 수 있습니다.
			</div>
			<%
				}
			%>
		</div>
	</section>
</body>
</html>