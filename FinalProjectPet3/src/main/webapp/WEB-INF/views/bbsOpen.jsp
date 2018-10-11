<%@page import="com.itbank.pet.bbs.BBSDAO"%>
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
<title>Introspect by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/js-image-slider.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/js-image-slider.js"></script>
<script type="text/javascript">
 function deletecomment(cNum){
	var deleteComment = cNum;
	var bNum = <%=session.getAttribute("seBBSbNum")%>;
		$.ajax({
				url : "bbsCommentDelete",
				type : "get",
				data : {
					cNum : deleteComment,
					bNum: bNum
				},
				success : function(data) {
	                        $("#cComment").val("");
	                         showHtml(data); 
				}
		});
 		 
 	 }
	$(function() {
		var bNum = <%=session.getAttribute("seBBSbNum")%>;
		
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
			var bNum = $('#bNum').val();
			var cId = $('#cId').val();
			var cComment = $('#cComment').val();
			var cDate = $('#cDate').val();
			
			if(cComment == null){
				alert("내용을 입력하세요.");
				return false;
			}
			else{
				$.ajax({
					url : "bbsComment",
					type : "get",
					data : {
						bNum : bNum,
						cId : cId,
						cComment : cComment,
						cDate : cDate
					},
					success : function(data) {
		                        $("#cComment").val("");
		                        showHtml(data);
						}
				});
			}
		});

	 	
	 	 
	 	$("#bbsCommentDelete").click(function() {
	 		
			var deleteComment = $('#deleteComment').val();
			
			$.ajax({
					url : "bbsCommentDelete",
					type : "get",
					data : {
						cComment : deleteComment
					},
					success : function(data) {
		                        $("#cComment").val("");
		                        showHtml(data);
					}
			});
		});
	 	
	    function showHtml(data) {
	        let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'><tbody>";
	        var nick = "<%=session.getAttribute("nickname")%>";
	        
	        $.each(data, function(index, item) {
	            html += "<tr align='center'>";
	            html += "<td>" + item.cNum + "</td>";
	            html += "<td>" + item.cId + "</td>";
	            html += "<td align='left'>" + item.cComment + "</td>";
	    	if (nick == item.cId){
	            html += "<td align='right'>" + item.cDate + "<button type='button' onclick='deletecomment("+item.cNum+")' style='width:2pt; height:30px; background-color: #FFFFFF !important; color: #758e26 !important; border: 0; outline:0;'>[삭제]</button></td>";
	    	}
	    	else{
	    		html += "<td align='right'>" + item.cDate + "</td>";
	    	}
	    	
	    	html += "</tr>";
	        });
	        html += "</tbody></table>";
	        
	        $("#table-wrapper").html(html);
	        $("#cComment").val("");
	    }
	    
	});
	   function showHtml(data) {
	        let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'><tbody>";
	        var nick = "<%=session.getAttribute("nickname")%>";
	        
	        $.each(data, function(index, item) {
	            html += "<tr align='center'>";
	            html += "<td>" + item.cNum + "</td>";
	            html += "<td>" + item.cId + "</td>";
	            html += "<td align='left'>" + item.cComment + "</td>";
	    	if (nick == item.cId){
	            html += "<td align='right'>" + item.cDate + "<button type='button' onclick='deletecomment("+item.cNum+")' style='width:2pt; height:30px; background-color: #FFFFFF !important; color: #758e26 !important; border: 0; outline:0;'>[삭제]</button></td>";
	    	}
	    	else{
	    		html += "<td align='right'>" + item.cDate + "</td>";
	    	}
	    	
	    	html += "</tr>";
	        });
	        html += "</tbody></table>";
	        
	        $("#table-wrapper").html(html);
	        $("#cComment").val("");
	    }
</script>
</head>
<body>
	<button onclick="deletecomment('113')">sss</button>

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
				<header>
					<div class="12u$">
						<h1>${seBBS.bTitle}</h1>
						<p>작성자 ${seBBS.bId} | 분류 ${seBBS.bCategory} | 조회
							${seBBS.bView} | ${seBBS.bDate}</p>
					</div>
				</header>
				<hr>
				<div class="12u$">
					<textarea name="bContent" rows="6" readonly="readonly">${seBBS.bContent}</textarea>
				</div>
				<br>
				<%
					if (session.getAttribute("nickname") != null) {
						if (session.getAttribute("nickname").equals(session.getAttribute("seBBSid"))) {
				%>
				<div class="12u$">
					<ul class="actions">
						<li><button type="button" class="alt"
								onclick="location.href='bbsSelect?bTitle=${seBBS.bTitle}'">수정</button></li>
						<li><button type="button" class="alt"
								onclick="location.href='bbsDelete?bTitle=${seBBS.bTitle}'">삭제</button></li>
					</ul>
				</div>
				<%
					}
					}
				%>
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