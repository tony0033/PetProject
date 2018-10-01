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
		var bNum = session.getAttribute("seBBSbNum");
		
		$.ajax({
            url:"bbsCommentList",
            data:{
                commPageNum:commPageNum*10,
               bNum: bNum
            },
            beforeSend:function() {
                console.log("읽어오기 시작 전...");
            },
            complete:function() {
                console.log("읽어오기 완료 후...");
            },
            success:function(data) {
                console.log("comment를 정상적으로 조회하였습니다.");
                showHtml(data, commPageNum);
                
                let position = $("#showComment table tr:last").position();
                $('html, body').animate({scrollTop : position.top}, 400);        // 두 번째 param은 스크롤 이동하는 시간
            }
        })

		$("#bbsComment").on("submit", function() {
			var bTitle = document.getElementById('bTitle').value;
			var cId = document.getElementById('cId').value;
			var cDate = document.getElementById('cDate').value;
			var cComment = document.getElementById('cComment').value;

			if(!cComment){
				alert("내용을 입력하세요.");
				return false;
			}
			else{
				$.ajax({
					url : "bbsComment",
					type : "post",
					data : {
						bTitle : bTitle,
						cId : cId,
						cDate : cDate,
						cComment : cComment
					},
					success : function(data) {
						if (data.result == success) {
							 console.log("comment가 정상적으로 입력되었습니다.");
		                        $("#commentContent").val("");
		                        showHtml(data.comments, 1);
			return false;
						}
					}
				});
			}
		});
/* 
	    function showHtml(data, commPageNum) {
	        let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'><tbody>";
	        $.each(data, function(index, item) {
	            html += "<tr align='center'>";
	            html += "<td>" + (index+1) + "</td>";
	            html += "<td>" + item.id + "</td>";
	            html += "<td align='left'>" + item.commentContent + "</td>";
	            let presentDay = item.commentDate.substring(0, 10);
	            html += "<td>" + presentDay + "</td>";
	            html += "</tr>";
	        });
	        html += "</tbody></table>";
	        commPageNum = parseInt(commPageNum);        // 정수로 변경
	        // commentCount는 동기화되어 값을 받아오기 때문에, 댓글 insert에 즉각적으로 처리되지 못한다.
	        if("${article.commentCount}" > commPageNum * 10) {
	            nextPageNum = commPageNum + 1;
	            html +="<input type='button' class='btn btn-default' onclick='getComment(nextPageNum, event)' value='다음 comment 보기'>";
	        }
	        
	        $("#table-wrapper").html(html);
	        $("#cComment").val("");
	    }
	    */
	});
</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class="logo">introspect</a>
			<nav id="nav">
				<a href="memberLogin.jsp" id="loginout">로그인</a> <a
					href="petHospital.jsp">동물병원 찾기</a><a href="bbs.jsp">게시판</a><a
					href="generic.jsp">Generic</a> <a href="elements.jsp">Elements</a>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

	<!-- Main -->
	<section id="main">
		<div class="inner">
			<section>
				<form method="post" action="bbsQuestion">
					<div class="row uniform 50%">
						<div class="12u$">
							<input type="text" name="bTitle" value="${seBBS.bTitle}"
								readonly="readonly">
						</div>
						<div class="6u 12u$(xsmall)">
							<ul class="actions fit">
								<li><input type="text" name="bCategory"
									value="${seBBS.bCategory}" readonly="readonly"></li>
								<li><input type="text" name="bId" value="${seBBS.bId}"
									readonly="readonly"></li>
							</ul>
						</div>
						<div class="6u$ 12u$(xsmall)">
							<ul class="actions fit small">
								<li>조회수</li>
								<li><input type="text" name="bDate" value="${seBBS.bDate}"
									readonly="readonly"></li>
							</ul>
						</div>
						<div class="12u$">
							<textarea name="bContent" rows="6" readonly="readonly">${seBBS.bContent}</textarea>
						</div>
						<%
							String seBBS = (String) session.getAttribute("seBBS");

							if (session.getAttribute("id") != null) {
								if (session.getAttribute("id").equals("seBBSid")) {
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
				<c:if test="${ !empty cList }">
					<h3>답변</h3>
					<div class="table-wrapper">
						
					</div>
				</c:if>
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
				<form action="bbsComment" id="bbsComment">
					<div class="row uniform 50%">
						<div class="12u$">
							<input type="hidden" name="bNum" id="bNum"
								value="<%=session.getAttribute("seBBSbNum")%>"> <input
								type="hidden" name="cId" id="cId"
								value="<%=session.getAttribute("id")%>"> <input
								type="hidden" name="cDate" id="cDate" value="<%=today%>">
							<textarea name="cComment" id="cComment" rows="2"></textarea>
						</div>
						<div class="12u$">
							<ul class="actions">
								<li><input type="submit" value="Send Message" class="alt"></li>
								<li><input type="reset" value="Reset"></li>
							</ul>
						</div>
					</div>
				</form>
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